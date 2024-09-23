@implementation PUInternalGIFExportActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BD68];
}

- (id)activityTitle
{
  return CFSTR("Export GIF");
}

- (id)_systemImageName
{
  return CFSTR("person.2.square.stack");
}

- (id)_asset
{
  void *v2;
  void *v3;
  void *v4;

  -[PXActivity itemSourceController](self, "itemSourceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if (!MEMORY[0x1AF429AFC](self, a2, a3))
    return 0;
  objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "showInternalGIFExport"))
  {
    -[PXActivity itemSourceController](self, "itemSourceController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isPreparingIndividualItems"))
    {
      -[PUInternalGIFExportActivity _asset](self, "_asset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "canPlayLoopingVideo");

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)performActivity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;

  -[PXActivity itemSourceController](self, "itemSourceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXActivity itemSourceController](self, "itemSourceController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetItemSources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUInternalGIFExportActivity activityType](self, "activityType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activityViewController:itemForActivityType:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;
  v12 = v11;
  if (!v11)
    goto LABEL_8;
  v13 = (void *)MEMORY[0x1E0CEC3F8];
  objc_msgSend(v11, "pathExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "typeWithFilenameExtension:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15 || (v16 = objc_msgSend(v15, "conformsToType:", *MEMORY[0x1E0CEC4F8]), v15, v16))
  {
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy__42096;
    v30[4] = __Block_byref_object_dispose__42097;
    v31 = 0;
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __46__PUInternalGIFExportActivity_performActivity__block_invoke;
    v27[3] = &unk_1E58AAE48;
    v28 = v12;
    v29 = v30;
    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __46__PUInternalGIFExportActivity_performActivity__block_invoke_2;
    v24[3] = &unk_1E58A0F98;
    v26 = v30;
    v24[4] = self;
    v25 = v4;
    objc_msgSend(v17, "performChanges:completionHandler:", v27, v24);

    _Block_object_dispose(v30, 8);
  }
  else
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("GIF Export Failed"), CFSTR("Failed to get a valid GIF URL"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("OK"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __46__PUInternalGIFExportActivity_performActivity__block_invoke_6;
    v23[3] = &unk_1E58A8DE8;
    v23[4] = self;
    objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addAction:", v22);

    objc_msgSend(v4, "presentViewController:animated:completion:", v19, 1, 0);
  }

}

void __46__PUInternalGIFExportActivity_performActivity__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CD1400], "creationRequestForAssetFromImageAtFileURL:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placeholderForCreatedAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __46__PUInternalGIFExportActivity_performActivity__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  __int128 v7;

  v4 = a3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v6 = v4;
  px_dispatch_on_main_queue();

}

uint64_t __46__PUInternalGIFExportActivity_performActivity__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", 0);
}

void __46__PUInternalGIFExportActivity_performActivity__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[10];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (void *)MEMORY[0x1E0CD1390];
    v15[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fetchAssetsWithLocalIdentifiers:options:", v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", 1);
    v14[5] = MEMORY[0x1E0C809B0];
    v14[6] = 3221225472;
    v14[7] = __46__PUInternalGIFExportActivity_performActivity__block_invoke_4;
    v14[8] = &unk_1E58ABD10;
    v14[9] = v7;
    v8 = v7;
    px_dispatch_on_main_queue_when_idle_after_delay();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Failed to save GIF"), v10, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("OK"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__PUInternalGIFExportActivity_performActivity__block_invoke_5;
    v14[3] = &unk_1E58A8DE8;
    v14[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v13);

    objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v8, 1, 0);
  }

}

void __46__PUInternalGIFExportActivity_performActivity__block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_navigateToOneUpShowingAsset:completionHandler:", *(_QWORD *)(a1 + 32), 0);

}

uint64_t __46__PUInternalGIFExportActivity_performActivity__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", 0);
}

@end
