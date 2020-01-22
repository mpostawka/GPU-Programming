#version 330

// VS locations
#define POSITION	0
// FS locations
#define FRAG_COLOR	0

layout(location = POSITION) in vec4 Pin;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

out vec3 colorToFrag;

void main()
{
	gl_Position = projection * view * model * vec4(Pin.xy/20.0f, 0.5f, 1.0f);
	float div = Pin.z > 0.05 ? Pin.z : 1.0f;
	colorToFrag = vec3(0.1f/div, 0.1f/div, 0.1f/div);
	if( Pin.w > 100.0f )
	{
		colorToFrag = vec3(1.0f, 0.0f, 0.0f);
	}
}