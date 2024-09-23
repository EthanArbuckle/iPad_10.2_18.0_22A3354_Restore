@implementation UIApplicationModalProgressController

void __55___UIApplicationModalProgressController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_1008;
  _MergedGlobals_1008 = (uint64_t)v1;

}

uint64_t __100___UIApplicationModalProgressController_hideAfterDelay_forceCompletion_replacementDismissalHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideAfterMinimumUptimeWithDismissalHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __108___UIApplicationModalProgressController_reconfigureWithTitle_message_progress_buttonTitle_dismissalHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hideImmediatelyWasDismissedByUser:", 1);
}

uint64_t __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void *__115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD aBlock[5];

  objc_msgSend(*(id *)(a1 + 32), "setUrlProgress:", a2);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  return _Block_copy(aBlock);
}

uint64_t __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUrlProgress:", 0);
}

void __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v3 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_5;
  v9[3] = &unk_1E16C28D0;
  v4 = *(_QWORD *)(a1 + 80);
  v10 = v3;
  v17 = v4;
  v11 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v15 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 72);
  v8 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_5(_QWORD *a1)
{
  void *v2;
  float v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v2 = (void *)a1[4];
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", (unint64_t)(float)(v3 * (float)(unint64_t)a1[11]), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", a1[5], v10, a1[6]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)a1[7];
    v6 = a1[8];
    objc_msgSend(v5, "urlProgress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reconfigureWithTitle:message:progress:buttonTitle:dismissalHandler:", v6, v4, v7, a1[9], a1[10]);

  }
  else
  {
    v8 = (void *)a1[7];
    v9 = a1[8];
    objc_msgSend(v8, "urlProgress");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reconfigureWithTitle:message:progress:buttonTitle:dismissalHandler:", v9, 0);
  }

}

void __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "finishObserving");
  objc_msgSend(*(id *)(a1 + 40), "setUrlProgress:", 0);
  objc_msgSend(MEMORY[0x1E0CB38A8], "_removeSubscriber:", *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_7(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  __int128 v9;
  _QWORD block[5];
  __int128 v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  __int128 v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__50;
  v21[4] = __Block_byref_object_dispose__51;
  v22 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_52;
    v13[3] = &unk_1E16C2970;
    v19 = *(_OWORD *)(a1 + 96);
    v7 = *(void **)(a1 + 64);
    v13[4] = *(_QWORD *)(a1 + 56);
    v14 = v7;
    v15 = *(id *)(a1 + 72);
    v18 = *(id *)(a1 + 80);
    v16 = v2;
    v17 = *(id *)(a1 + 32);
    v20 = v21;
    objc_msgSend(v3, "coordinateReadingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v5, 0, v4, 0, 0, v13);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "coordinateReadingItemAtURL:options:error:byAccessor:", *(_QWORD *)(a1 + 48), 0x20000, 0, &__block_literal_global_145);
  }
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_4_61;
  block[3] = &unk_1E16C29B8;
  block[4] = *(_QWORD *)(a1 + 56);
  v9 = *(_OWORD *)(a1 + 88);
  v8 = (id)v9;
  v11 = v9;
  v12 = *(_QWORD *)(a1 + 104);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v21, 8);
}

void __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id obj;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_2_53;
    block[3] = &unk_1E16C2948;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v20 = *(_QWORD *)(a1 + 88);
    block[4] = v7;
    v17 = v8;
    v18 = *(id *)(a1 + 48);
    v19 = *(id *)(a1 + 72);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_msgSend(*(id *)(a1 + 56), "removeItemAtURL:error:", *(_QWORD *)(a1 + 64), 0);
    v9 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "URLByDeletingLastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    obj = *(id *)(v11 + 40);
    LODWORD(v9) = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, &obj);
    objc_storeStrong((id *)(v11 + 40), obj);

    if ((_DWORD)v9)
    {
      v12 = *(void **)(a1 + 56);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v14 = *(id *)(v13 + 40);
      objc_msgSend(v12, "copyItemAtURL:toURL:error:", v5, v6, &v14);
      objc_storeStrong((id *)(v13 + 40), v14);
    }

  }
}

void __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_2_53(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  _UIKitBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Copying..."), CFSTR("Copying…"), CFSTR("Localizable"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "reconfigureWithTitle:message:progress:buttonTitle:dismissalHandler:", *(_QWORD *)(a1 + 40), v4, 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_4_61(uint64_t a1)
{
  uint64_t result;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "hideAfterMinimumUptimeWithDismissalHandler:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
