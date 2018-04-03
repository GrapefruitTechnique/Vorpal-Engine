#version 450

#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable

layout(set = 0, binding = 0) uniform UniformViewProjection {
    mat4 view;
    mat4 proj;
} uvp_buffer;

layout(set = 0, binding = 1) uniform UniformModel {
    mat4 model;
} um_buffer;

layout(location = 0) in vec3 inPos;
layout(location = 1) in vec2 inTextureCoordinates;

layout(location = 0) out vec2 outTextureCoordinates;

out gl_PerVertex {
    vec4 gl_Position;
};

void main() {
    gl_Position = uvp_buffer.proj * uvp_buffer.view * um_buffer.model
                    * vec4(inPos , 1.0);
    gl_Position.y = -gl_Position.y;
    outTextureCoordinates = inTextureCoordinates;
}