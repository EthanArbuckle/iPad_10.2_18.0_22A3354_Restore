@implementation PUContentSyndicationSaveToLibraryActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BE60];
}

- (id)activityTitle
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PUContentSyndicationSaveToLibraryActivity itemSourceController](self, "itemSourceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "mediaType");

    v6 = CFSTR("ITEM");
    if (v5 == 1)
      v6 = CFSTR("PHOTO");
    if (v5 == 2)
      v6 = CFSTR("VIDEO");
    v7 = v6;
    objc_msgSend(CFSTR("SYNDICATION_SAVE_TO_LIBRARY_ACTIVITY_TITLE_"), "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PXFilter();
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    PXMediaTypeForAssets();
    -[__CFString count](v7, "count");
    PXLocalizationKeyForMediaType();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedStringWithValidatedFormat(v10, CFSTR("%lu"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_systemImageName
{
  return CFSTR("square.and.arrow.down");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v3;
  BOOL v4;

  -[PUContentSyndicationSaveToLibraryActivity itemSourceController](self, "itemSourceController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsavedSyndicatedAssetCount") != 0;

  return v4;
}

- (id)activityViewController
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  objc_msgSend(MEMORY[0x1E0D7B2A8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preventActualSaveToLibraryBehavior");

  if (!v4)
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Save to Library Prevented"), CFSTR("Saving to Library is currently disabled via our internal settings (for debugging)."), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0DC3448];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __67__PUContentSyndicationSaveToLibraryActivity_activityViewController__block_invoke;
  v12 = &unk_1E58AA850;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v6, "actionWithTitle:style:handler:", CFSTR("OK"), 0, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v7, v9, v10, v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v5;
}

- (void)performActivity
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PUContentSyndicationSaveToLibraryActivity *v13;
  _QWORD v14[4];
  id v15;

  objc_msgSend(MEMORY[0x1E0D7B2A8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preventActualSaveToLibraryBehavior");

  if (v4)
  {
    -[UIActivity activityDidFinish:](self, "activityDidFinish:", 0);
  }
  else
  {
    -[PUContentSyndicationSaveToLibraryActivity itemSourceController](self, "itemSourceController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PXFilter();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__PUContentSyndicationSaveToLibraryActivity_performActivity__block_invoke_2;
    v14[3] = &unk_1E58ABD10;
    v15 = v7;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __60__PUContentSyndicationSaveToLibraryActivity_performActivity__block_invoke_3;
    v11[3] = &unk_1E58AA020;
    v12 = v15;
    v13 = self;
    v10 = v15;
    objc_msgSend(v8, "performChanges:completionHandler:", v14, v11);

  }
}

- (PXActivityItemSourceController)itemSourceController
{
  return (PXActivityItemSourceController *)objc_loadWeakRetained((id *)&self->itemSourceController);
}

- (void)setItemSourceController:(id)a3
{
  objc_storeWeak((id *)&self->itemSourceController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->itemSourceController);
}

void __60__PUContentSyndicationSaveToLibraryActivity_performActivity__block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = (id)objc_msgSend(MEMORY[0x1E0CD1400], "creationRequestForAssetFromGuestAsset:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5++), (_QWORD)v7);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __60__PUContentSyndicationSaveToLibraryActivity_performActivity__block_invoke_3(uint64_t a1, char a2)
{
  id v3;
  uint64_t v4;
  _QWORD block[4];
  id v6;
  uint64_t v7;
  char v8;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PUContentSyndicationSaveToLibraryActivity_performActivity__block_invoke_4;
  block[3] = &unk_1E58AA878;
  v8 = a2;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __60__PUContentSyndicationSaveToLibraryActivity_performActivity__block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v19 = a1;
    obj = *(id *)(a1 + 32);
    v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v1)
    {
      v2 = v1;
      v16 = 0;
      v18 = *(_QWORD *)v21;
      v3 = *MEMORY[0x1E0D7BEE0];
      v4 = *MEMORY[0x1E0D09830];
      v5 = *MEMORY[0x1E0D09828];
LABEL_4:
      v6 = 0;
      v7 = 9;
      if (v16 > 9)
        v7 = v16;
      v8 = v16 - v7;
      while (1)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v6);
        v10 = (void *)MEMORY[0x1E0D09910];
        v24[0] = v4;
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v24[1] = v5;
        v25[0] = v12;
        v25[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sendEvent:withPayload:", v3, v13);

        if (!(v8 + v6))
          break;
        if (v2 == ++v6)
        {
          v16 += v6;
          v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
          if (v2)
            goto LABEL_4;
          break;
        }
      }
    }

    a1 = v19;
    v14 = *(_BYTE *)(v19 + 48) != 0;
  }
  else
  {
    v14 = 0;
  }
  return objc_msgSend(*(id *)(a1 + 40), "activityDidFinish:", v14, v16);
}

uint64_t __60__PUContentSyndicationSaveToLibraryActivity_performActivity__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "px_isUnsavedSyndicatedAsset");
}

void __67__PUContentSyndicationSaveToLibraryActivity_activityViewController__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "activityDidFinish:", 0);

}

uint64_t __58__PUContentSyndicationSaveToLibraryActivity_activityTitle__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "px_isUnsavedSyndicatedAsset");
}

@end
