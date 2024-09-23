@implementation ICQHelperFunctions

void __58___ICQHelperFunctions_getPhotosLibrarySizeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%lu"), 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59___ICQHelperFunctions_getOriginalPhotosSizeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithLongLong:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

}

void __78___ICQHelperFunctions_remoteBackupSizeForAccount_timeoutInSeconds_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = objc_alloc(MEMORY[0x1E0D4E0A8]);
  objc_msgSend(*(id *)(a1 + 32), "personaIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v2, "initWithDelegate:eventQueue:personaIdentifier:", 0, 0, v3);

  objc_msgSend(*(id *)(a1 + 56), "_fetchNextBackupSize:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v5 && (objc_msgSend(v5, "isCancelled") & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void __78___ICQHelperFunctions_remoteBackupSizeForAccount_timeoutInSeconds_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isFinished") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "cancel");
    _ICQGetLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __78___ICQHelperFunctions_remoteBackupSizeForAccount_timeoutInSeconds_completion___block_invoke_2_cold_1(v2);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

uint64_t __44___ICQHelperFunctions__fetchNextBackupSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "snapshotID");
  v6 = objc_msgSend(v4, "snapshotID");

  if (v5 < v6)
    return -1;
  else
    return 1;
}

uint64_t __54___ICQHelperFunctions__remoteBackupSizeOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)_remoteBackupSizeOperationQueue_operationQueue;
  _remoteBackupSizeOperationQueue_operationQueue = (uint64_t)v0;

  return objc_msgSend((id)_remoteBackupSizeOperationQueue_operationQueue, "setMaxConcurrentOperationCount:", 1);
}

void __78___ICQHelperFunctions_remoteBackupSizeForAccount_timeoutInSeconds_completion___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CDEBD000, log, OS_LOG_TYPE_ERROR, "MBManager took too long to respond. Returning nil for remote backup.", v1, 2u);
}

@end
