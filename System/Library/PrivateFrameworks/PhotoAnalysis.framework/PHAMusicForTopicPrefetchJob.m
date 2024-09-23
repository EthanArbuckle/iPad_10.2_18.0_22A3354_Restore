@implementation PHAMusicForTopicPrefetchJob

- (PHAMusicForTopicPrefetchJob)init
{
  PHAMusicForTopicPrefetchJob *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *runQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHAMusicForTopicPrefetchJob;
  v2 = -[PHAMusicForTopicPrefetchJob init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.photoanalysisd.music.forTopicPrefetchJob", v4);
    runQueue = v2->_runQueue;
    v2->_runQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)runWithGraphManager:(id)a3 progressBlock:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *runQueue;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  runQueue = self->_runQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__PHAMusicForTopicPrefetchJob_runWithGraphManager_progressBlock_completionHandler___block_invoke;
  v12[3] = &unk_1E8520C10;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(runQueue, v12);

}

- (BOOL)shouldRunForLibrary:(id)a3
{
  return 1;
}

- (double)periodicity
{
  return 86400.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runQueue, 0);
}

void __83__PHAMusicForTopicPrefetchJob_runWithGraphManager_progressBlock_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[16];

  if (__PXLog_genericOnceToken != -1)
    dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_6331);
  v2 = __PXLog_genericOSLog;
  if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, v2, OS_LOG_TYPE_INFO, "[MemoriesMusic] MusicForTopicPrefetch - beginning music for topic prefetch job", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D76148];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__PHAMusicForTopicPrefetchJob_runWithGraphManager_progressBlock_completionHandler___block_invoke_132;
  v5[3] = &unk_1E85213D8;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "prefetchCuratedSongLibraryAssetsWithProgressReporter:completionHandler:", v3, v5);

}

void __83__PHAMusicForTopicPrefetchJob_runWithGraphManager_progressBlock_completionHandler___block_invoke_132(uint64_t a1, int a2, void *a3)
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
    dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_134);
  v6 = __PXLog_genericOSLog;
  if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_1CAC16000, v6, OS_LOG_TYPE_INFO, "[MemoriesMusic] PHAMusicForTopicPrefetch - music for topic prefetch job completed, success=%d, error=%{public}@", (uint8_t *)v7, 0x12u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __83__PHAMusicForTopicPrefetchJob_runWithGraphManager_progressBlock_completionHandler___block_invoke_2_133()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __83__PHAMusicForTopicPrefetchJob_runWithGraphManager_progressBlock_completionHandler___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

@end
