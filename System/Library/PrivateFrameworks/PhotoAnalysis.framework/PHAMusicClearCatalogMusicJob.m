@implementation PHAMusicClearCatalogMusicJob

- (PHAMusicClearCatalogMusicJob)init
{
  PHAMusicClearCatalogMusicJob *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *runQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHAMusicClearCatalogMusicJob;
  v2 = -[PHAMusicClearCatalogMusicJob init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.photoanalysisd.music.clearCatalogJob", v4);
    runQueue = v2->_runQueue;
    v2->_runQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)runWithGraphManager:(id)a3 progressBlock:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *runQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, a3);
  runQueue = self->_runQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__PHAMusicClearCatalogMusicJob_runWithGraphManager_progressBlock_completionHandler___block_invoke;
  v13[3] = &unk_1E8521400;
  objc_copyWeak(&v16, &location);
  v14 = v9;
  v15 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_async(runQueue, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (BOOL)shouldRunForLibrary:(id)a3
{
  return 1;
}

- (double)periodicity
{
  return 172800.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runQueue, 0);
}

void __84__PHAMusicClearCatalogMusicJob_runWithGraphManager_progressBlock_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  if (__PXLog_genericOnceToken != -1)
    dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_1997);
  v2 = __PXLog_genericOSLog;
  if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, v2, OS_LOG_TYPE_INFO, "[MemoriesMusic] MusicClearCatalogMusicJob - beginning clear catalog music job", buf, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0D76110];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __84__PHAMusicClearCatalogMusicJob_runWithGraphManager_progressBlock_completionHandler___block_invoke_133;
    v8[3] = &unk_1E85213D8;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v6, "clearCatalogMusicFromCacheWithPhotoLibrary:progressReporter:completionHandler:", v5, v4, v8);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D75CF8], "errorForCode:", -8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v4);
  }

}

void __84__PHAMusicClearCatalogMusicJob_runWithGraphManager_progressBlock_completionHandler___block_invoke_133(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (__PXLog_genericOnceToken != -1)
    dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_135_2002);
  v6 = __PXLog_genericOSLog;
  if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_1CAC16000, v6, OS_LOG_TYPE_INFO, "[MemoriesMusic] MusicClearCatalogMusicJob - clear catalog music job completed, success=%d, error=%{public}@", (uint8_t *)v7, 0x12u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __84__PHAMusicClearCatalogMusicJob_runWithGraphManager_progressBlock_completionHandler___block_invoke_2_134()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __84__PHAMusicClearCatalogMusicJob_runWithGraphManager_progressBlock_completionHandler___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

@end
