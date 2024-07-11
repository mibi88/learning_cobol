#include <stdio.h>
#include <libcob.h>
#include <GL/gl.h>

void cobGlBegin(void) {
    glBegin(GL_TRIANGLES);
}

void cobGlVertex3v3(void) {
    float x = (float)cob_get_s64_param(1)/1000.0;
    float y = (float)cob_get_s64_param(2)/1000.0;
    float z = (float)cob_get_s64_param(3)/1000.0;
    glVertex3f(x, y, z);
}

void cobGlColor3v3(void) {
    float r = (float)cob_get_s64_param(1)/1000.0;
    float g = (float)cob_get_s64_param(2)/1000.0;
    float b = (float)cob_get_s64_param(3)/1000.0;
    glColor3f(r, g, b);
}
