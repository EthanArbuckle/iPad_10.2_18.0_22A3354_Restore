@implementation PUWallpaperHelper

+ (id)deleteSuggestionAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__PUWallpaperHelper_deleteSuggestionAction___block_invoke;
  v9[3] = &unk_1E58A6930;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", CFSTR("Delete Suggestion"), v5, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAttributes:", 2);
  return v7;
}

+ (id)rejectSuggestionAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark.circle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__PUWallpaperHelper_rejectSuggestionAction___block_invoke;
  v9[3] = &unk_1E58A6930;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", CFSTR("Reject Suggestion"), v5, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAttributes:", 2);
  return v7;
}

+ (id)presentPosterEditorWithAsset:(id)a3 fromViewController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("slider.horizontal.3"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__PUWallpaperHelper_presentPosterEditorWithAsset_fromViewController___block_invoke;
  v13[3] = &unk_1E58A5B60;
  v14 = v5;
  v15 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", CFSTR("Edit Poster"), v8, 0, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)fileRadarSubmenuForSuggestion:(id)a3 asset:(id)a4 actionBeingHandler:(id)a5 actionEndHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(a1, "fileRadarActionForComponent:title:suggestion:asset:actionBeingHandler:actionEndHandler:", 9, CFSTR("File General Radar"), v13, v12, v11, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fileRadarActionForComponent:title:suggestion:asset:actionBeingHandler:actionEndHandler:", 7, CFSTR("File UI Radar"), v13, v12, v11, v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v15;
  objc_msgSend(a1, "fileRadarActionForComponent:title:suggestion:asset:actionBeingHandler:actionEndHandler:", 8, CFSTR("File Curation Radar"), v13, v12, v11, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v16;
  objc_msgSend(a1, "fileRadarActionForComponent:title:suggestion:asset:actionBeingHandler:actionEndHandler:", 9, CFSTR("File Feedback Radar"), v13, v12, v11, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v17;
  objc_msgSend(a1, "fileRadarActionForComponent:title:suggestion:asset:actionBeingHandler:actionEndHandler:", 10, CFSTR("File Imaging Radar"), v13, v12, v11, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v24[4] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ant.circle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "menuWithTitle:image:identifier:options:children:", CFSTR("File Radar"), v21, 0, 32, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)fileRadarActionForComponent:(int64_t)a3 title:(id)a4 suggestion:(id)a5 asset:(id)a6 actionBeingHandler:(id)a7 actionEndHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = (void *)MEMORY[0x1E0DC3428];
  v18 = (void *)MEMORY[0x1E0DC3870];
  v19 = a4;
  objc_msgSend(v18, "systemImageNamed:", CFSTR("ant.circle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __108__PUWallpaperHelper_fileRadarActionForComponent_title_suggestion_asset_actionBeingHandler_actionEndHandler___block_invoke;
  v27[3] = &unk_1E58A5B88;
  v28 = v14;
  v29 = v13;
  v31 = v16;
  v32 = a3;
  v30 = v15;
  v21 = v16;
  v22 = v13;
  v23 = v14;
  v24 = v15;
  objc_msgSend(v17, "actionWithTitle:image:identifier:handler:", v19, v20, 0, v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

void __108__PUWallpaperHelper_fileRadarActionForComponent_title_suggestion_asset_actionBeingHandler_actionEndHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  v2 = a1[6];
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  +[PUWallpaperRadarAttachmentProvider radarConfigurationForAsset:suggestion:compoundLayerStack:segmentationItem:posterDescriptor:posterConfiguration:component:completionHandler:](PUWallpaperRadarAttachmentProvider, "radarConfigurationForAsset:suggestion:compoundLayerStack:segmentationItem:posterDescriptor:posterConfiguration:component:completionHandler:", a1[4], a1[5], 0, 0, 0, 0, a1[8], a1[7]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  PXFileRadarWithConfiguration();

}

void __69__PUWallpaperHelper_presentPosterEditorWithAsset_fromViewController___block_invoke(uint64_t a1)
{
  PUWallpaperPosterEditDebugViewController *v2;

  v2 = -[PUWallpaperPosterEditDebugViewController initWithAsset:]([PUWallpaperPosterEditDebugViewController alloc], "initWithAsset:", *(_QWORD *)(a1 + 32));
  -[PUWallpaperPosterEditDebugViewController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 5);
  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v2, 1, 0);

}

void __44__PUWallpaperHelper_rejectSuggestionAction___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = (void *)MEMORY[0x1E0D77EF8];
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__PUWallpaperHelper_rejectSuggestionAction___block_invoke_2;
  v3[3] = &unk_1E58AB060;
  v4 = v2;
  objc_msgSend(v1, "rejectWallpaperSuggestionsUsingAssetOfSuggestion:completionHandler:", v4, v3);

}

void __44__PUWallpaperHelper_rejectSuggestionAction___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed rejecting Suggesstion %@, error: %@", (uint8_t *)&v8, 0x16u);

    }
  }

}

void __44__PUWallpaperHelper_deleteSuggestionAction___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__PUWallpaperHelper_deleteSuggestionAction___block_invoke_2;
  v8[3] = &unk_1E58ABD10;
  v9 = *(id *)(a1 + 32);
  v7 = 0;
  v3 = objc_msgSend(v2, "performChangesAndWait:error:", v8, &v7);
  v4 = v7;
  if ((v3 & 1) == 0)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "Failed deleting Suggesstion %@, error: %@", buf, 0x16u);

    }
  }

}

void __44__PUWallpaperHelper_deleteSuggestionAction___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CD17D8];
  v3[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deleteSuggestions:", v2);

}

@end
