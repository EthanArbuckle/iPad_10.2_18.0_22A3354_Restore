@implementation PFStoryRecipe

void __88__PFStoryRecipe_PXStoryExtension_requestAudioAssetFromRecipeAsset_recipe_resultHandler___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  uint8_t v12[16];

  v7 = a2;
  v8 = a4;
  if (a3)
  {
    PLAudioPlaybackGetLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_make_with_pointer(v9, *(const void **)(a1 + 40));
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_END, v11, "PFStoryRecipe_PXStoryExtension - requestAudioAssetFromRecipeAsset", " enableTelemetry=YES ", v12, 2u);
      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __88__PFStoryRecipe_PXStoryExtension_requestAudioAssetFromRecipeAsset_recipe_resultHandler___block_invoke_143(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t, id))(v4 + 16))(v4, v6, 1, v5);

}

void __88__PFStoryRecipe_PXStoryExtension_requestAudioAssetFromRecipeAsset_recipe_resultHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  +[PXFlexMusicLibrary sharedLibrary](PXFlexMusicLibrary, "sharedLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchAssetsWithIdentifiers:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40))
  {
    v12 = 0;
  }
  else
  {
    PXStoryErrorCreateWithCodeDebugFormat(1, CFSTR("unable to fetch Flex Song for song: %@"), v6, v7, v8, v9, v10, v11, *(_QWORD *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "totalUnitCount"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __88__PFStoryRecipe_PXStoryExtension_requestAudioAssetFromRecipeAsset_recipe_resultHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  objc_msgSend(*(id *)(a1 + 32), "colorGradeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColorGradeCategory:", v6);

  objc_msgSend(*(id *)(a1 + 32), "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v7);

  objc_msgSend(*(id *)(a1 + 32), "subtitle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubtitle:", v8);

}

void __48__PFStoryRecipe_PXStoryExtension_flexFetchQueue__block_invoke()
{
  uint64_t v0;
  void *v1;

  px_dispatch_queue_create_serial();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)flexFetchQueue_queue;
  flexFetchQueue_queue = v0;

}

void __75__PFStoryRecipe_PXStoryExtension_displayAssetsInRecipe_withCategory_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "scheme");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = 1;
}

uint64_t __64__PFStoryRecipe_PXStoryExtension_recipeContainsAnyDisplayAsset___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

void __88__PFStoryRecipe_PXStoryExtension_PhotoKit__enumerateDisplayAssetsFromRecipe_usingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  char v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v8 = 0;
  v6 = objc_msgSend(v5, "didEnumerateRecipeDisplayAsset:error:", a2, &v8);
  v7 = v8;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;

}

void __80__PFStoryRecipe_PXStoryExtension_PhotoKit__PHAssetsInRecipe_withCategory_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    if (objc_msgSend(v5, "category") == *(_QWORD *)(a1 + 56))
    {
      v8 = objc_alloc(MEMORY[0x1E0CD14B0]);
      objc_msgSend(v5, "cloudIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithStringValue:", v9);

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2938];
    v17[0] = CFSTR("Recipe asset doesn't refer to a PhotoKit Asset");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PXStoryErrorDomain"), 1, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    *a3 = 1;
  }

}

void __80__PFStoryRecipe_PXStoryExtension_PhotoKit__PHAssetsInRecipe_withCategory_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = a3;
  objc_msgSend(v6, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v6, "localIdentifier");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addObject:", v12);
  }
  else
  {
    objc_msgSend(v6, "error");
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

void __84__PFStoryRecipe_PXStoryExtension_PhotoKit__addPHAssets_toRecipe_withCategory_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "cloudIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0D752B8];
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createAssetWithCategory:scheme:cloudIdentifier:", v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addAsset:", v12);
  }
  else
  {
    objc_msgSend(v16, "error");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    *a4 = 1;
  }

}

void __88__PFStoryRecipe_PXStoryExtension_Synthetic__syntheticAssetsInRecipe_withCategory_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    if (objc_msgSend(v5, "category") == *(_QWORD *)(a1 + 56))
    {
      objc_msgSend(v5, "cloudIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E50B5AF0, "syntheticAssetWithSerializableDescription:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2938];
    v16[0] = CFSTR("Recipe asset doesn't refer to a synthetic asset");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("PXStoryErrorDomain"), 1, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *a3 = 1;
  }

}

@end
