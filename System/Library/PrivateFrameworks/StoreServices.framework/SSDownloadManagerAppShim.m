@implementation SSDownloadManagerAppShim

- (SSDownloadManagerAppShim)initWithManagerOptions:(id)a3
{
  id v4;
  SSDownloadManagerAppShim *v5;
  SSDownloadManagerAppShim *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  ASDJobManager *jobManager;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SSDownloadManagerAppShim;
  v5 = -[SSDownloadManager initWithManagerOptions:](&v12, sel_initWithManagerOptions_, v4);
  v6 = v5;
  if (v5)
  {
    -[SSDownloadManagerAppShim __app_convertOptions:](v5, "__app_convertOptions:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = SSVAppstoreDaemonFramework();
    v9 = objc_msgSend(objc_alloc((Class)SSVWeakLinkedClassForString(CFSTR("ASDJobManager"), v8)), "initWithOptions:", v7);
    jobManager = v6->_jobManager;
    v6->_jobManager = (ASDJobManager *)v9;

    -[ASDJobManager addJobObserver:](v6->_jobManager, "addJobObserver:", v6);
  }

  return v6;
}

- (void)jobManager:(id)a3 changedJobs:(id)a4
{
  void *v5;
  NSObject *accessQueue;
  _QWORD v7[5];
  id v8;

  -[SSDownloadManagerAppShim __app_downloadsForJobs:](self, "__app_downloadsForJobs:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    accessQueue = self->super._accessQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__SSDownloadManagerAppShim_jobManager_changedJobs___block_invoke;
    v7[3] = &unk_1E47B8768;
    v7[4] = self;
    v8 = v5;
    dispatch_async(accessQueue, v7);

  }
}

void __51__SSDownloadManagerAppShim_jobManager_changedJobs___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "__app_sendDownloadsChanged:filterSoftware:", v2, 0);

}

- (void)jobManager:(id)a3 updatedProgressOfJobs:(id)a4
{
  void *v5;
  NSObject *accessQueue;
  _QWORD v7[5];
  id v8;

  -[SSDownloadManagerAppShim __app_downloadsForJobs:](self, "__app_downloadsForJobs:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    accessQueue = self->super._accessQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__SSDownloadManagerAppShim_jobManager_updatedProgressOfJobs___block_invoke;
    v7[3] = &unk_1E47B8768;
    v7[4] = self;
    v8 = v5;
    dispatch_async(accessQueue, v7);

  }
}

void __61__SSDownloadManagerAppShim_jobManager_updatedProgressOfJobs___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "__app_sendDownloadsChanged:filterSoftware:", v2, 0);

}

- (void)jobManager:(id)a3 updatedStateOfJobs:(id)a4
{
  void *v5;
  NSObject *accessQueue;
  _QWORD v7[5];
  id v8;

  -[SSDownloadManagerAppShim __app_downloadsForJobs:](self, "__app_downloadsForJobs:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    accessQueue = self->super._accessQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__SSDownloadManagerAppShim_jobManager_updatedStateOfJobs___block_invoke;
    v7[3] = &unk_1E47B8768;
    v7[4] = self;
    v8 = v5;
    dispatch_async(accessQueue, v7);

  }
}

void __58__SSDownloadManagerAppShim_jobManager_updatedStateOfJobs___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "__app_sendDownloadsChanged:filterSoftware:", v2, 0);

}

- (void)cancelAllDownloadsWithCompletionBlock:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSDownloadManagerAppShim;
  -[SSDownloadManager cancelAllDownloadsWithCompletionBlock:](&v3, sel_cancelAllDownloadsWithCompletionBlock_, a3);
}

- (void)cancelDownloads:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__SSDownloadManagerAppShim_cancelDownloads_completionBlock___block_invoke;
  v8[3] = &unk_1E47BFF80;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[SSDownloadManagerAppShim __app_filterDownloads:withResult:](self, "__app_filterDownloads:withResult:", a3, v8);

}

void __60__SSDownloadManagerAppShim_cancelDownloads_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  objc_super v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id location;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v7 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__SSDownloadManagerAppShim_cancelDownloads_completionBlock___block_invoke_2;
    v11[3] = &unk_1E47C0960;
    objc_copyWeak(&v14, &location);
    v8 = *(id *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 32);
    v13 = v8;
    v11[4] = v9;
    v12 = v5;
    v10.receiver = v7;
    v10.super_class = (Class)SSDownloadManagerAppShim;
    objc_msgSendSuper2(&v10, sel_cancelDownloads_completionBlock_, v6, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "__app_cancelDownloads:completionBlock:", v5, *(_QWORD *)(a1 + 40));
  }

}

void __60__SSDownloadManagerAppShim_cancelDownloads_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (v5)
    objc_msgSend(WeakRetained, "__app_dispatchBlock:withError:", *(_QWORD *)(a1 + 48), v5);
  else
    objc_msgSend(*(id *)(a1 + 32), "__app_cancelDownloads:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)finishDownloads:(id)a3
{
  id v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSDownloadManagerAppShim;
  v4 = a3;
  -[SSDownloadManager _willFinishDownloads:](&v6, sel__willFinishDownloads_, v4);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__SSDownloadManagerAppShim_finishDownloads___block_invoke;
  v5[3] = &unk_1E47C0988;
  v5[4] = self;
  -[SSDownloadManagerAppShim __app_filterDownloads:withResult:](self, "__app_filterDownloads:withResult:", v4, v5);

}

void __44__SSDownloadManagerAppShim_finishDownloads___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  objc_super v7;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7.receiver = *(id *)(a1 + 32);
    v7.super_class = (Class)SSDownloadManagerAppShim;
    objc_msgSendSuper2(&v7, sel__finishDownloads_, v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "__app_finishDownloads:", v5);

}

- (void)moveDownload:(id)a3 afterDownload:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "valueForProperty:", CFSTR("1"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("software"));

  objc_msgSend(v9, "valueForProperty:", CFSTR("1"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("software"));

  if ((v12 & 1) == 0 && (v14 & 1) == 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)SSDownloadManagerAppShim;
    -[SSDownloadManager moveDownload:afterDownload:completionBlock:](&v15, sel_moveDownload_afterDownload_completionBlock_, v8, v9, v10);
  }

}

- (void)moveDownload:(id)a3 beforeDownload:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "valueForProperty:", CFSTR("1"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("software"));

  objc_msgSend(v9, "valueForProperty:", CFSTR("1"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("software"));

  if ((v12 & 1) == 0 && (v14 & 1) == 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)SSDownloadManagerAppShim;
    -[SSDownloadManager moveDownload:beforeDownload:completionBlock:](&v15, sel_moveDownload_beforeDownload_completionBlock_, v8, v9, v10);
  }

}

- (void)resumeDownloads:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__SSDownloadManagerAppShim_resumeDownloads_completionBlock___block_invoke;
  v8[3] = &unk_1E47BFF80;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[SSDownloadManagerAppShim __app_filterDownloads:withResult:](self, "__app_filterDownloads:withResult:", a3, v8);

}

void __60__SSDownloadManagerAppShim_resumeDownloads_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  objc_super v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id location;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v7 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__SSDownloadManagerAppShim_resumeDownloads_completionBlock___block_invoke_2;
    v11[3] = &unk_1E47C0960;
    objc_copyWeak(&v14, &location);
    v8 = *(id *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 32);
    v13 = v8;
    v11[4] = v9;
    v12 = v5;
    v10.receiver = v7;
    v10.super_class = (Class)SSDownloadManagerAppShim;
    objc_msgSendSuper2(&v10, sel_resumeDownloads_completionBlock_, v6, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "__app_resumeDownloads:completionBlock:", v5, *(_QWORD *)(a1 + 40));
  }

}

void __60__SSDownloadManagerAppShim_resumeDownloads_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (v5)
    objc_msgSend(WeakRetained, "__app_dispatchBlock:withError:", *(_QWORD *)(a1 + 48), v5);
  else
    objc_msgSend(*(id *)(a1 + 32), "__app_resumeDownloads:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)restartDownloads:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__SSDownloadManagerAppShim_restartDownloads_completionBlock___block_invoke;
  v8[3] = &unk_1E47BFF80;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[SSDownloadManagerAppShim __app_filterDownloads:withResult:](self, "__app_filterDownloads:withResult:", a3, v8);

}

void __61__SSDownloadManagerAppShim_restartDownloads_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v7 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__SSDownloadManagerAppShim_restartDownloads_completionBlock___block_invoke_2;
    v9[3] = &unk_1E47BACE0;
    objc_copyWeak(&v11, &location);
    v10 = *(id *)(a1 + 40);
    v8.receiver = v7;
    v8.super_class = (Class)SSDownloadManagerAppShim;
    objc_msgSendSuper2(&v8, sel_restartDownloads_completionBlock_, v6, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __61__SSDownloadManagerAppShim_restartDownloads_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "__app_dispatchBlock:withError:", *(_QWORD *)(a1 + 32), v4);

}

- (void)setDownloads:(id)a3 forKinds:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__SSDownloadManagerAppShim_setDownloads_forKinds_completionBlock___block_invoke;
  v14[3] = &unk_1E47C09B0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[SSDownloadManagerAppShim __app_filterDownloads:withResult:](self, "__app_filterDownloads:withResult:", v12, v14);

}

void __66__SSDownloadManagerAppShim_setDownloads_forKinds_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v8 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__SSDownloadManagerAppShim_setDownloads_forKinds_completionBlock___block_invoke_2;
    v11[3] = &unk_1E47BFF58;
    objc_copyWeak(&v14, &location);
    v13 = *(id *)(a1 + 56);
    v12 = v5;
    v10.receiver = v8;
    v10.super_class = (Class)SSDownloadManagerAppShim;
    objc_msgSendSuper2(&v10, sel_setDownloads_forKinds_completionBlock_, v7, v9, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "__app_insertDownloads:before:after:completionBlock:", v5, 0, 0, *(_QWORD *)(a1 + 56));
  }

}

void __66__SSDownloadManagerAppShim_setDownloads_forKinds_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (v5)
    objc_msgSend(WeakRetained, "__app_dispatchBlock:withError:", *(_QWORD *)(a1 + 40), v5);
  else
    objc_msgSend(WeakRetained, "__app_insertDownloads:before:after:completionBlock:", *(_QWORD *)(a1 + 32), 0, 0, *(_QWORD *)(a1 + 40));

}

- (id)_copyDownloadsForMessage:(int64_t)a3 downloadIDs:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSDownloadManagerAppShim;
  v5 = -[SSDownloadManager _copyDownloadsForMessage:downloadIDs:](&v9, sel__copyDownloadsForMessage_downloadIDs_, a3, a4);
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", &__block_literal_global_46);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsAtIndexes:", v6);
  -[SSDownloadManagerAppShim __app_getAllDownloads](self, "__app_getAllDownloads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  return v5;
}

uint64_t __65__SSDownloadManagerAppShim__copyDownloadsForMessage_downloadIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "valueForProperty:", CFSTR("1"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("software"));

  return v3;
}

- (void)_insertDownloads:(id)a3 before:(id)a4 after:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__SSDownloadManagerAppShim__insertDownloads_before_after_completionBlock___block_invoke;
  v16[3] = &unk_1E47C0A20;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[SSDownloadManagerAppShim __app_filterDownloads:withResult:](self, "__app_filterDownloads:withResult:", a3, v16);

}

void __74__SSDownloadManagerAppShim__insertDownloads_before_after_completionBlock___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id location;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, a1[4]);
    v8 = a1[4];
    v7 = a1[5];
    v9 = a1[6];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__SSDownloadManagerAppShim__insertDownloads_before_after_completionBlock___block_invoke_2;
    v11[3] = &unk_1E47C09F8;
    objc_copyWeak(&v16, &location);
    v15 = a1[7];
    v12 = v5;
    v13 = a1[5];
    v14 = a1[6];
    v10.receiver = v8;
    v10.super_class = (Class)SSDownloadManagerAppShim;
    objc_msgSendSuper2(&v10, sel__insertDownloads_before_after_completionBlock_, v6, v7, v9, v11);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(a1[4], "__app_insertDownloads:before:after:completionBlock:", v5, a1[5], a1[6], a1[7]);
  }

}

void __74__SSDownloadManagerAppShim__insertDownloads_before_after_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (v5)
    objc_msgSend(WeakRetained, "__app_dispatchBlock:withError:", *(_QWORD *)(a1 + 56), v5);
  else
    objc_msgSend(WeakRetained, "__app_insertDownloads:before:after:completionBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)_pauseDownloads:(id)a3 forced:(BOOL)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__SSDownloadManagerAppShim__pauseDownloads_forced_completionBlock___block_invoke;
  v10[3] = &unk_1E47BFFA8;
  v10[4] = self;
  v11 = v8;
  v12 = a4;
  v9 = v8;
  -[SSDownloadManagerAppShim __app_filterDownloads:withResult:](self, "__app_filterDownloads:withResult:", a3, v10);

}

void __67__SSDownloadManagerAppShim__pauseDownloads_forced_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  objc_super v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id location;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v7 = *(void **)(a1 + 32);
    v8 = *(unsigned __int8 *)(a1 + 48);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__SSDownloadManagerAppShim__pauseDownloads_forced_completionBlock___block_invoke_2;
    v12[3] = &unk_1E47C0960;
    objc_copyWeak(&v15, &location);
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 32);
    v14 = v9;
    v12[4] = v10;
    v13 = v5;
    v11.receiver = v7;
    v11.super_class = (Class)SSDownloadManagerAppShim;
    objc_msgSendSuper2(&v11, sel__pauseDownloads_forced_completionBlock_, v6, v8, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "__app_pauseDownloads:completionBlock:", v5, *(_QWORD *)(a1 + 40));
  }

}

void __67__SSDownloadManagerAppShim__pauseDownloads_forced_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (v5)
    objc_msgSend(WeakRetained, "__app_dispatchBlock:withError:", *(_QWORD *)(a1 + 48), v5);
  else
    objc_msgSend(*(id *)(a1 + 32), "__app_pauseDownloads:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_sendDownloadsChanged:(id)a3
{
  NSObject *accessQueue;
  id v5;

  accessQueue = self->super._accessQueue;
  v5 = a3;
  dispatch_assert_queue_V2(accessQueue);
  -[SSDownloadManagerAppShim __app_sendDownloadsChanged:filterSoftware:](self, "__app_sendDownloadsChanged:filterSoftware:", v5, 1);

}

- (void)__app_cancelDownloads:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ASDJobManager *jobManager;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[SSDownloadManagerAppShim __app_extractJobIDsFromSoftwareDownloads:](self, "__app_extractJobIDsFromSoftwareDownloads:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    jobManager = self->_jobManager;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__SSDownloadManagerAppShim___app_cancelDownloads_completionBlock___block_invoke;
    v10[3] = &unk_1E47C0A48;
    v10[4] = self;
    v11 = v7;
    -[ASDJobManager cancelJobsWithIDs:completionBlock:](jobManager, "cancelJobsWithIDs:completionBlock:", v8, v10);

  }
  else
  {
    -[SSDownloadManagerAppShim __app_dispatchBlock:withError:](self, "__app_dispatchBlock:withError:", v7, 0);
  }

}

uint64_t __66__SSDownloadManagerAppShim___app_cancelDownloads_completionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "__app_dispatchBlock:withError:", *(_QWORD *)(a1 + 40), a3);
}

- (id)__app_convertOptions:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = SSVAppstoreDaemonFramework();
  SSVWeakLinkedClassForString(CFSTR("ASDJobManagerOptions"), v4);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setShouldFilterExternalOriginatedDownloads:", objc_msgSend(v3, "shouldFilterExternalOriginatedDownloads"));
  objc_msgSend(v3, "persistenceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPersistenceIdentifier:", v6);
  return v5;
}

- (id)__app_downloadsForJobs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SSSoftwareDownload *v11;
  SSSoftwareDownload *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [SSSoftwareDownload alloc];
        v12 = -[SSSoftwareDownload initWithJob:](v11, "initWithJob:", v10, (_QWORD)v15);
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (void)__app_dispatchBlock:(id)a3 withError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    dispatch_get_global_queue(21, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__SSDownloadManagerAppShim___app_dispatchBlock_withError___block_invoke;
    v8[3] = &unk_1E47B8A98;
    v10 = v5;
    v9 = v6;
    dispatch_async(v7, v8);

  }
}

uint64_t __58__SSDownloadManagerAppShim___app_dispatchBlock_withError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)__app_extractJobIDsFromSoftwareDownloads:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "persistentIdentifier", (_QWORD)v13));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (void)__app_filterDownloads:(id)a3 withResult:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(id, void *, void *);
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = (void (**)(id, void *, void *))a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "valueForProperty:", CFSTR("1"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", CFSTR("software")))
          v15 = v6;
        else
          v15 = v7;
        objc_msgSend(v15, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(v6, "copy");
  v17 = (void *)objc_msgSend(v7, "copy");
  v18[2](v18, v16, v17);

}

- (void)__app_finishDownloads:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "job", (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    -[ASDJobManager finishJobs:](self->_jobManager, "finishJobs:", v5);
  }

}

- (id)__app_getAllDownloads
{
  dispatch_semaphore_t v3;
  ASDJobManager *jobManager;
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__87;
  v15 = __Block_byref_object_dispose__87;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  jobManager = self->_jobManager;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__SSDownloadManagerAppShim___app_getAllDownloads__block_invoke;
  v8[3] = &unk_1E47C0A70;
  v10 = &v11;
  v8[4] = self;
  v5 = v3;
  v9 = v5;
  -[ASDJobManager getJobsUsingBlock:](jobManager, "getJobsUsingBlock:", v8);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

intptr_t __49__SSDownloadManagerAppShim___app_getAllDownloads__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "__app_downloadsForJobs:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)__app_insertDownloads:(id)a3 before:(id)a4 after:(id)a5 completionBlock:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_QWORD *, void *, uint64_t);
  void *v17;
  SSDownloadManagerAppShim *v18;
  id v19;
  id v20;

  v13 = a3;
  v8 = a6;
  if (objc_msgSend(v13, "count"))
  {
    -[SSDownloadManagerAppShim __app_newManifestWithType:](self, "__app_newManifestWithType:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSDownloadManagerAppShim __app_newManifestWithType:](self, "__app_newManifestWithType:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __79__SSDownloadManagerAppShim___app_insertDownloads_before_after_completionBlock___block_invoke;
    v17 = &unk_1E47C0A98;
    v18 = self;
    v11 = v10;
    v19 = v11;
    v12 = v9;
    v20 = v12;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v14);
    if (objc_msgSend(v12, "count"))
      -[SSDownloadManagerAppShim __app_installManifest:completionBlock:](self, "__app_installManifest:completionBlock:", v12, v8);
    if (objc_msgSend(v11, "count", v13, v14, v15, v16, v17, v18))
      -[SSDownloadManagerAppShim __app_installManifest:completionBlock:](self, "__app_installManifest:completionBlock:", v11, v8);

  }
  else
  {
    -[SSDownloadManagerAppShim __app_dispatchBlock:withError:](self, "__app_dispatchBlock:withError:", v8, 0);
  }

}

void __79__SSDownloadManagerAppShim___app_insertDownloads_before_after_completionBlock___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = (void *)a1[4];
  v6 = a2;
  objc_msgSend(v5, "__app_newActivityWithDownload:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setExternalOrderKey:", v7);

  objc_msgSend(v6, "valueForProperty:", CFSTR("V"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v8, "BOOLValue");

  v9 = (void *)MEMORY[0x1E0CB37E8];
  if ((_DWORD)v5)
    v10 = (void *)a1[5];
  else
    v10 = (void *)a1[6];
  v11 = objc_msgSend(v6, "persistentIdentifier");

  objc_msgSend(v9, "numberWithLongLong:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addActivity:withIdentifier:", v13, v12);

}

- (void)__app_installManifest:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = SSVAppstoreDaemonFramework();
  v9 = (void *)objc_msgSend(objc_alloc((Class)SSVWeakLinkedClassForString(CFSTR("ASDInstallManifestRequestOptions"), v8)), "initWithManifest:", v7);

  v10 = SSVAppstoreDaemonFramework();
  v11 = (void *)objc_msgSend(objc_alloc((Class)SSVWeakLinkedClassForString(CFSTR("ASDInstallManifestRequest"), v10)), "initWithOptions:", v9);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__SSDownloadManagerAppShim___app_installManifest_completionBlock___block_invoke;
  v13[3] = &unk_1E47C0AC0;
  v13[4] = self;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v11, "startWithCompletionBlock:", v13);

}

uint64_t __66__SSDownloadManagerAppShim___app_installManifest_completionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__app_dispatchBlock:withError:", *(_QWORD *)(a1 + 40));
}

- (id)__app_newAssetWithDownloadAsset:(id)a3 assetType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  char isKindOfClass;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "_localValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = SSVAppstoreDaemonFramework();
  v9 = objc_alloc_init((Class)SSVWeakLinkedClassForString(CFSTR("ASDJobAsset"), v8));
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("e"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v12 = v10;
  if ((isKindOfClass & 1) != 0
    || (objc_msgSend(v9, "assetType", v10),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12 = v6,
        !v13))
  {
    objc_msgSend(v9, "setAssetType:", v12);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("c"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v9, "setAssetURL:", v14);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("3"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v9, "setBytesTotal:", v15);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("m"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v9, "setExpectedDiskspace:", v16);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("0"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v9, "setHashArrayData:", v17);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("o"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v9, "setHashType:", v18);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("1"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v9, "setNumberOfBytesToHash:", v19);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("B"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v9, "setSinfs:", v20);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("q"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v9, "setDPInfo:", v21);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("x"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v9, "setInitialODRSize:", v22);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("l"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "setIsLocallyCacheable:", objc_msgSend(v23, "BOOLValue"));
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("9"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "setIsExternal:", objc_msgSend(v24, "BOOLValue"));
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("k"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "setIsZipStreamable:", objc_msgSend(v25, "BOOLValue"));
  objc_msgSend(v5, "_localProperties");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    objc_msgSend(v26, "URL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "absoluteString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v9, "setAssetURL:", v29);
  }
  else
  {
    v29 = v25;
  }

  return v9;
}

- (id)__app_newActivityWithDownload:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  SSDownloadManagerAppShim *v15;
  id v16;

  v4 = a3;
  v5 = SSVAppstoreDaemonFramework();
  v6 = objc_alloc_init((Class)SSVWeakLinkedClassForString(CFSTR("ASDJobActivity"), v5));
  -[SSDownloadManagerAppShim __app_setPropertiesForActivity:withDownload:](self, "__app_setPropertiesForActivity:withDownload:", v6, v4);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "_localAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __58__SSDownloadManagerAppShim___app_newActivityWithDownload___block_invoke;
  v14 = &unk_1E47C0AE8;
  v15 = self;
  v16 = v7;
  v9 = v7;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v11);

  objc_msgSend(v6, "setAssets:", v9, v11, v12, v13, v14, v15);
  return v6;
}

void __58__SSDownloadManagerAppShim___app_newActivityWithDownload___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 32), "__app_newAssetWithDownloadAsset:assetType:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (id)__app_newManifestWithType:(int64_t)a3
{
  uint64_t v4;

  v4 = SSVAppstoreDaemonFramework();
  return (id)objc_msgSend(objc_alloc((Class)SSVWeakLinkedClassForString(CFSTR("ASDJobManifest"), v4)), "initWithManifestType:", a3);
}

- (void)__app_pauseDownloads:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ASDJobManager *jobManager;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[SSDownloadManagerAppShim __app_extractJobIDsFromSoftwareDownloads:](self, "__app_extractJobIDsFromSoftwareDownloads:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    jobManager = self->_jobManager;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__SSDownloadManagerAppShim___app_pauseDownloads_completionBlock___block_invoke;
    v10[3] = &unk_1E47C0A48;
    v10[4] = self;
    v11 = v7;
    -[ASDJobManager pauseJobsWithIDs:completionBlock:](jobManager, "pauseJobsWithIDs:completionBlock:", v8, v10);

  }
  else
  {
    -[SSDownloadManagerAppShim __app_dispatchBlock:withError:](self, "__app_dispatchBlock:withError:", v7, 0);
  }

}

uint64_t __65__SSDownloadManagerAppShim___app_pauseDownloads_completionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "__app_dispatchBlock:withError:", *(_QWORD *)(a1 + 40), a3);
}

- (void)__app_resumeDownloads:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ASDJobManager *jobManager;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[SSDownloadManagerAppShim __app_extractJobIDsFromSoftwareDownloads:](self, "__app_extractJobIDsFromSoftwareDownloads:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    jobManager = self->_jobManager;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__SSDownloadManagerAppShim___app_resumeDownloads_completionBlock___block_invoke;
    v10[3] = &unk_1E47C0A48;
    v10[4] = self;
    v11 = v7;
    -[ASDJobManager resumeJobsWithIDs:completionBlock:](jobManager, "resumeJobsWithIDs:completionBlock:", v8, v10);

  }
  else
  {
    -[SSDownloadManagerAppShim __app_dispatchBlock:withError:](self, "__app_dispatchBlock:withError:", v7, 0);
  }

}

uint64_t __66__SSDownloadManagerAppShim___app_resumeDownloads_completionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "__app_dispatchBlock:withError:", *(_QWORD *)(a1 + 40), a3);
}

- (void)__app_setPropertiesForActivity:(id)a3 withDownload:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;

  v45 = a3;
  v5 = a4;
  objc_msgSend(v5, "_localValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("3"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setArtistID:", v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("d"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setArtistName:", v8);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("27"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setBetaExternalVersionIdentifier:", v9);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("c"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setBundleID:", v10);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("20"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setBundleVersion:", v11);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("04"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setBuyParams:", v12);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("P"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setCancelDownloadURL:", v13);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("10"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v45, "setCancelIfDuplicate:", objc_msgSend(v14, "BOOLValue"));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("17"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setClientID:", v15);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("f"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setCollectionName:", v16);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EE"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setEnableExtensions:", v17);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("i"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setGenre:", v18);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("6"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setGenreID:", v19);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HM"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v45, "setHasMessagesExtension:", objc_msgSend(v20, "BOOLValue"));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("12"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v45, "setExplicitContent:", objc_msgSend(v21, "BOOLValue"));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("D"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v45, "setIsAutomatic:", objc_msgSend(v22, "integerValue") != 0);
    objc_msgSend(v45, "setIsUpdate:", objc_msgSend(v22, "integerValue") == 2);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("vp"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v45, "setIsDeviceBasedVPP:", objc_msgSend(v23, "BOOLValue"));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("03"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v45, "setIsInQueue:", objc_msgSend(v24, "BOOLValue"));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("21"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v45, "setIsPurchasedRedownload:", objc_msgSend(v25, "BOOLValue"));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("V"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v45, "setIsRestore:", objc_msgSend(v26, "BOOLValue"));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("7"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setItemID:", v27);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("1"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setKind:", v28);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LP"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v45, "setLaunchProhibited:", objc_msgSend(v29, "BOOLValue"));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MA"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setMessagesArtworkURL:", v30);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("8"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setPurchaseDate:", v31);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("q"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setReleaseDate:", v32);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("U"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setStoreAccountID:", v33);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Z"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setStoreAccountName:", v34);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("F"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setStoreDownloadKey:", v35);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("9"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setStoreTransactionID:", v36);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("b"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v45, "setSoftwareIconNeedsShine:", objc_msgSend(v37, "BOOLValue") ^ 1);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("G"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setThumbnailURL:", v38);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("2"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setTitle:", v39);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("T"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v45, "setStorefront:", v40);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v40, "stringValue");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setStorefront:", v41);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("R"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setSoftwareVersionExternalIdentifier:", v42);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("22"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setStoreCohort:", v43);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("26"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v45, "setVariantID:", v44);

}

- (void)__app_sendDownloadsChanged:(id)a3 filterSoftware:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *accessQueue;
  id v7;
  uint64_t v8;
  objc_super v9;
  objc_super v10;

  v4 = a4;
  accessQueue = self->super._accessQueue;
  v7 = a3;
  dispatch_assert_queue_V2(accessQueue);
  -[SSDownloadManager _resetAllDownloads](self, "_resetAllDownloads");
  if (v4)
  {
    objc_msgSend(v7, "objectsPassingTest:", &__block_literal_global_59);
    v8 = objc_claimAutoreleasedReturnValue();

    v10.receiver = self;
    v10.super_class = (Class)SSDownloadManagerAppShim;
    -[SSDownloadManager _sendDownloadsChanged:](&v10, sel__sendDownloadsChanged_, v8);
    v7 = (id)v8;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SSDownloadManagerAppShim;
    -[SSDownloadManager _sendDownloadsChanged:](&v9, sel__sendDownloadsChanged_, v7);
  }

}

uint64_t __70__SSDownloadManagerAppShim___app_sendDownloadsChanged_filterSoftware___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "valueForProperty:", CFSTR("1"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("software")) ^ 1;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jobManager, 0);
}

@end
