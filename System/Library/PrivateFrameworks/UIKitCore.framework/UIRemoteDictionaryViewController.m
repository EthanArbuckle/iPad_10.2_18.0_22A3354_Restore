@implementation UIRemoteDictionaryViewController

void __48___UIRemoteDictionaryViewController_viewDidLoad__block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48___UIRemoteDictionaryViewController_viewDidLoad__block_invoke_2;
  v2[3] = &unk_1E16B1B78;
  v3 = a2;
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

void __48___UIRemoteDictionaryViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend((id)UIApp, "_endShowingNetworkActivityIndicator");
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "_allAvailableDefinitionDictionaries");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1016);
    *(_QWORD *)(v3 + 1016) = v2;

    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadData");

  }
}

void __59___UIRemoteDictionaryViewController__handleDownloadButton___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "rawAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshState");

  objc_msgSend(*(id *)(a1 + 40), "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

void __65___UIRemoteDictionaryViewController__startDownloadForDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD block[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65___UIRemoteDictionaryViewController__startDownloadForDictionary___block_invoke_2;
  block[3] = &unk_1E16B2900;
  v11 = a2;
  v7 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __65___UIRemoteDictionaryViewController__startDownloadForDictionary___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
  {
    NSLog(CFSTR("_UIRemoteDictionaryViewController failed to download dictionary %@ with result: %ld"), *(_QWORD *)(a1 + 40), v2);
LABEL_7:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1032), "removeObjectForKey:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 48), "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "refreshState");
  objc_msgSend(*(id *)(a1 + 40), "updateAsset");
  objc_msgSend(*(id *)(a1 + 40), "setActivated:", 1);
  objc_msgSend(*(id *)(a1 + 32), "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v4 = getDCSDictionaryAssetAttributesDownloadedSymbolLoc_ptr;
  v12 = getDCSDictionaryAssetAttributesDownloadedSymbolLoc_ptr;
  if (!getDCSDictionaryAssetAttributesDownloadedSymbolLoc_ptr)
  {
    v5 = DictionaryServicesLibrary();
    v4 = dlsym(v5, "DCSDictionaryAssetAttributesDownloaded");
    v10[3] = (uint64_t)v4;
    getDCSDictionaryAssetAttributesDownloadedSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v9, 8);
  if (v4)
  {
    ((void (*)(void *))v4)(v3);

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _DCSDictionaryAssetAttributesDownloaded(CFDictionaryRef)");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("UIReferenceLibraryViewController.m"), 44, CFSTR("%s"), dlerror());

  __break(1u);
}

void __69___UIRemoteDictionaryViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "rawAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshState");

  objc_msgSend(*(id *)(a1 + 40), "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

void __69___UIRemoteDictionaryViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  float v4;
  double v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  double v11;

  v3 = a2;
  v4 = (float)objc_msgSend(v3, "totalWritten");
  v5 = (float)(v4 / (float)objc_msgSend(v3, "totalExpected"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69___UIRemoteDictionaryViewController_tableView_cellForRowAtIndexPath___block_invoke_3;
  block[3] = &unk_1E16B1C28;
  v6 = *(id *)(a1 + 32);
  v11 = v5;
  v9 = v6;
  v10 = v3;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __69___UIRemoteDictionaryViewController_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setProgress:animated:", 1, *(double *)(a1 + 48));
  result = objc_msgSend(*(id *)(a1 + 40), "isStalled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "setIndeterminate:", 1);
  return result;
}

void __84___UIRemoteDictionaryViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "rawAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v4 = getDCSDictionaryAssetAttributesWillBePurgedSymbolLoc_ptr;
  v16 = getDCSDictionaryAssetAttributesWillBePurgedSymbolLoc_ptr;
  if (!getDCSDictionaryAssetAttributesWillBePurgedSymbolLoc_ptr)
  {
    v5 = DictionaryServicesLibrary();
    v4 = dlsym(v5, "DCSDictionaryAssetAttributesWillBePurged");
    v14[3] = (uint64_t)v4;
    getDCSDictionaryAssetAttributesWillBePurgedSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v13, 8);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _DCSDictionaryAssetAttributesWillBePurged(CFDictionaryRef)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("UIReferenceLibraryViewController.m"), 45, CFSTR("%s"), dlerror());

    __break(1u);
  }
  ((void (*)(void *))v4)(v3);

  objc_msgSend(*(id *)(a1 + 32), "rawAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "purgeSync") == 0;

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "rawAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "refreshState");

    v9 = *(void **)(a1 + 40);
    v17[0] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadRowsAtIndexPaths:withRowAnimation:", v10, 100);

  }
}

@end
