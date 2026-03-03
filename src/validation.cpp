#include "validation.hpp"
#include <volk.h>
#include <vector>
#include <cstring>
#include <iostream>

bool checkValidationLayerSupport() {
    uint32_t layerCount;
    vkEnumerateInstanceLayerProperties(&layerCount, nullptr);

    std::vector<VkLayerProperties> availableLayers(layerCount);
    vkEnumerateInstanceLayerProperties(&layerCount, availableLayers.data());

    for (const auto& layerProperties : availableLayers) {
        std::cout << layerProperties.layerName << std::endl;
        if (strcmp(VALIDATION_LAYER_NAME, layerProperties.layerName) == 0) {
            return true;
        }
    }

    return false;
}
