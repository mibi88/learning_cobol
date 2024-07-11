#include <stdio.h>
#include <stdlib.h>

#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>
#include <GL/gl.h>
#include <GL/glu.h>

int should_quit;
SDL_Window *window;

int open_window(void) {
    window = SDL_CreateWindow("COBOL OpenGL Test", 0, 0, 640, 480,
                                          SDL_WINDOW_OPENGL);
    if(!window){
        fputs("Failed to create the SDL window!\n", stderr);
        return 1;
    }
    SDL_GLContext context = SDL_GL_CreateContext(window);
    glViewport(0, 0, 640, 480);
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glClear(GL_COLOR_BUFFER_BIT);
    should_quit = 0;
    return 0;
}

int quit(void) {
    glFlush();
    SDL_GL_SwapWindow(window);
    return should_quit;
}

int get_next_key(void) {
    SDL_Event event;
    while(SDL_PollEvent(&event)){
        if(event.type == SDL_QUIT){
            should_quit = 1;
            puts("Quit");
            SDL_Quit();
        }
        if(event.type == SDL_KEYDOWN){
            return event.key.keysym.sym;
        }
    }
    return SDLK_UNKNOWN;
}

