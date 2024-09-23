@implementation MAAsset

void __94__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_startCatalogDownload_options_completionWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0DA8988];
  v6 = a3;
  objc_msgSend(v5, "sharedSimulator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "end:atFunction:", CFSTR("ma"), CFSTR("startCatalogDownload"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(MEMORY[0x1E0D4E038], "_SUCoreBorder_MADownloadResultAtEnd:withResult:withError:withCompletion:", v8, a2, v6, *(_QWORD *)(a1 + 32));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __94__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_cancelCatalogDownload_completionWithCancelResult___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end:atFunction:", CFSTR("ma"), CFSTR("cancelCatalogDownload"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(MEMORY[0x1E0D4E038], "_SUCoreBorder_MACancelDownloadResultAtEnd:withResult:withCompletion:", v5, a2, *(_QWORD *)(a1 + 32));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __79__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_startDownload_completionWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "end:atFunction:", CFSTR("ma"), CFSTR("startDownload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D4E038], "_SUCoreBorder_MADownloadResultAtEnd:withResult:withError:withCompletion:", v6, a2, v9, *(_QWORD *)(a1 + 48));
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "sessionId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_prepAndSendDownloadFinishedSplunkEvent:withError:withSessionId:", a2, v9, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __60__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_purgeWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0DA8988];
  v6 = a3;
  objc_msgSend(v5, "sharedSimulator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "end:atFunction:", CFSTR("ma"), CFSTR("purgeWithError"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(MEMORY[0x1E0D4E038], "_SUCoreBorder_MAPurgeResultAtEnd:withResult:withError:withCompletion:", v8, a2, v6, *(_QWORD *)(a1 + 32));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __60__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_cancelDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end:atFunction:", CFSTR("ma"), CFSTR("cancelDownload"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(MEMORY[0x1E0D4E038], "_SUCoreBorder_MACancelDownloadResultAtEnd:withResult:withCompletion:", v5, a2, *(_QWORD *)(a1 + 32));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __71__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_configDownload_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end:atFunction:", CFSTR("ma"), CFSTR("configDownload"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(MEMORY[0x1E0D4E038], "_SUCoreBorder_MAOperationResultAtEnd:withResult:withCompletion:", v5, a2, *(_QWORD *)(a1 + 32));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __85__MAAsset_SUCoreBorderMAAsset___SUCoreBorder_MADownloadResultAtBegin_withCompletion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __82__MAAsset_SUCoreBorderMAAsset___SUCoreBorder_MAPurgeResultAtBegin_withCompletion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __91__MAAsset_SUCoreBorderMAAsset___SUCoreBorder_MACancelDownloadResultAtBegin_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __86__MAAsset_SUCoreBorderMAAsset___SUCoreBorder_MAOperationResultAtBegin_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
