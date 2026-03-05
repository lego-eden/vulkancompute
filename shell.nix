# most of this code has been yoinked from the nixpkgs version of SDL, before they changed it to be statically built
{
  pkgs ? import (
    fetchTarball "https://github.com/NixOS/nixpkgs/archive/00c21e4c93d963c50d4c0c89bfa84ed6e0694df2.tar.gz"
  ) {}
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    gnumake
    cmake
    ninja
    glm
    vulkan-volk
    sdl3
    vulkan-memory-allocator
    vulkan-tools
    vulkan-loader
    vulkan-headers
    vulkan-helper
    vulkan-caps-viewer
    vulkan-tools-lunarg
    vulkan-validation-layers
    vulkan-utility-libraries
    glslang
    shader-slang
    shaderc
    tinyobjloader
    ktx-tools
    spirv-tools
    spirv-cross
    spirv-headers
    clang-tools
  ];
  shellHook = ''
    export VK_LAYER_PATH=${pkgs.vulkan-validation-layers}/share/vulkan/explicit_layer.d
  '';
}
