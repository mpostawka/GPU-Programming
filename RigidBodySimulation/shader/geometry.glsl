#version 330 core
layout(points) in;
layout(triangle_strip, max_vertices = 108) out;
in vec3 colorToFrag[];
out vec3 color;

#define M_PI 3.1415926535897932384626433832795

mat4 rotateX(float angle) {
    return mat4(1.0, 0, 0, 0,
        0, cos(angle), -sin(angle), 0,
        0, sin(angle), cos(angle), 0,
        0, 0, 0, 1);
}

mat4 rotateY(float angle) {
    return mat4(cos(angle), 0, sin(angle), 0,
        0, 1.0, 0, 0,
        -sin(angle), 0, cos(angle), 0,
        0, 0, 0, 1);
}

void main() {
    color = colorToFrag[0];
    

    float radius = 0.5f;
    int detail = 10;
    vec4 center = gl_in[0].gl_Position;



    for (int j = 1; j < detail; j++) {
        for (int i = 0; i < detail; i++) {
            vec4 vec;
            float angleX = float(i) / float(detail) * 2.0f * M_PI;
            float angleY = float(j) / float(detail) * M_PI;
            vec = vec4(0.0f, 1.0f, 0.0f, 1.0f);
            vec = rotateY(angleY) * rotateX(angleX) * vec;
            vec4 pointOne = vec4(radius * vec.x, radius * vec.y, radius * vec.z, 1.0f);

            angleX = float(i+1) / float(detail) * 2.0f * M_PI;
            angleY = float(j-1) / float(detail) * M_PI;
            vec = vec4(0.0f, 1.0f, 0.0f, 1.0f);
            vec = rotateY(angleY) * rotateX(angleX) * vec;
            vec4 pointTwo = vec4(radius * vec.x, radius * vec.y, radius * vec.z, 1.0f);

            gl_Position = center + pointOne;
            EmitVertex();
            gl_Position = center + pointTwo;
            EmitVertex();
        }
    }

    EndPrimitive();
}