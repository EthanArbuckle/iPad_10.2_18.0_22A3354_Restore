@implementation MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc

void *__get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!MaterialKitLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_1E6B95A38;
    v5 = 0;
    MaterialKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!MaterialKitLibraryCore_frameworkLibrary_0)
    __get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)MaterialKitLibraryCore_frameworkLibrary_0, "_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                                                 + 24);
  return result;
}

void *__get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_block_invoke_0(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!MaterialKitLibraryCore_frameworkLibrary_1)
  {
    v4 = xmmword_1E6B95C58;
    v5 = 0;
    MaterialKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!MaterialKitLibraryCore_frameworkLibrary_1)
    __get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_block_invoke_cold_1_0(&v3);
  result = dlsym((void *)MaterialKitLibraryCore_frameworkLibrary_1, "_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MaterialKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PBUIWallpaperEffectCompositor.m"), 25, CFSTR("%s"), *a1);

  __break(1u);
}

void __get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MaterialKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PBUIWallpaperView.m"), 44, CFSTR("%s"), *a1);

  __break(1u);
}

@end
