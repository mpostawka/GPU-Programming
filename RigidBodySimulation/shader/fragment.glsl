#version 330

// FS locations
#define FRAG_COLOR	0

in vec3 color;

layout(location = FRAG_COLOR, index = 0) out vec3 Color;

void main()
{
	Color = color;
	//Color = vec3(1.0f, 1.0f, 1.0f);
}