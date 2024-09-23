@implementation PXStoryAudioSessionController

- (PXStoryAudioSessionController)initWithModel:(id)a3
{
  id v4;
  PXStoryAudioSessionController *v5;
  PXStoryAudioSessionController *v6;
  PXAVResourceReclamationController *v7;
  PXAVResourceReclamationController *resourceReclamationController;
  uint64_t v9;
  OS_dispatch_queue *workQueue;
  _QWORD v12[4];
  PXStoryAudioSessionController *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryAudioSessionController;
  v5 = -[PXStoryController initWithObservableModel:](&v14, sel_initWithObservableModel_, v4);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_model, v4);
    v7 = (PXAVResourceReclamationController *)objc_alloc_init(MEMORY[0x1E0D78238]);
    resourceReclamationController = v6->_resourceReclamationController;
    v6->_resourceReclamationController = v7;

    px_dispatch_queue_create_serial();
    v9 = objc_claimAutoreleasedReturnValue();
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v9;

    -[PXAVResourceReclamationController registerObserver:](v6->_resourceReclamationController, "registerObserver:", v6);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__PXStoryAudioSessionController_initWithModel___block_invoke;
    v12[3] = &unk_1E5146DD8;
    v13 = v6;
    -[PXStoryController performChanges:](v13, "performChanges:", v12);

  }
  return v6;
}

- (void)_invalidateShouldMixWithOthers
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateShouldMixWithOthers);

}

- (void)_updateShouldMixWithOthers
{
  void *v3;
  void *v4;
  id v5;

  -[PXStoryAudioSessionController model](self, "model");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeSongResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_storyResourceSongAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryAudioSessionController setShouldMixWithOthers:](self, "setShouldMixWithOthers:", objc_msgSend(v4, "catalog") == 2);

}

- (void)setShouldMixWithOthers:(BOOL)a3
{
  if (self->_shouldMixWithOthers != a3)
  {
    self->_shouldMixWithOthers = a3;
    -[PXStoryAudioSessionController _invalidateAudioSession](self, "_invalidateAudioSession");
  }
}

- (void)_invalidateAudioSession
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAudioSession);

}

- (void)_updateAudioSession
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;

  -[PXStoryAudioSessionController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = ~objc_msgSend(v4, "options") & 3;

  if (v5)
  {
    objc_initWeak(&location, self);
    -[PXStoryAudioSessionController workQueue](self, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__PXStoryAudioSessionController__updateAudioSession__block_invoke;
    v7[3] = &unk_1E5148D30;
    objc_copyWeak(&v8, &location);
    dispatch_async(v6, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_workQueue_createAudioSession
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  char v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PXStoryAudioSessionController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C89AE8], "auxiliarySession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PXStoryAudioSessionController shouldMixWithOthers](self, "shouldMixWithOthers");
    v6 = (id)*MEMORY[0x1E0C89690];
    v7 = *MEMORY[0x1E0C89748];
    v19 = 0;
    LOBYTE(v5) = objc_msgSend(v4, "setCategory:mode:routeSharingPolicy:options:error:", v6, v7, 0, v5, &v19);
    v8 = v19;
    if ((v5 & 1) == 0)
    {
      PLStoryGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v8;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Failed to prepare shared audio session, error: %@", buf, 0xCu);
      }

    }
    v18 = v8;
    v10 = objc_msgSend(v4, "setPreferredOutputNumberOfChannels:error:", 2, &v18);
    v11 = v18;

    if ((v10 & 1) == 0)
    {
      PLStoryGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v11;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Failed to setPreferredOutputNumberOfChannels, error: %@", buf, 0xCu);
      }

    }
    objc_initWeak((id *)buf, self);
    -[PXStoryController storyQueue](self, "storyQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__PXStoryAudioSessionController__workQueue_createAudioSession__block_invoke;
    v15[3] = &unk_1E5147280;
    objc_copyWeak(&v17, (id *)buf);
    v16 = v4;
    v14 = v4;
    dispatch_async(v13, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);

  }
}

- (void)setAudioSession:(id)a3
{
  AVAudioSession *v5;
  void *v6;
  _QWORD v7[4];
  AVAudioSession *v8;

  v5 = (AVAudioSession *)a3;
  if (self->_audioSession != v5)
  {
    objc_storeStrong((id *)&self->_audioSession, a3);
    -[PXStoryAudioSessionController model](self, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__PXStoryAudioSessionController_setAudioSession___block_invoke;
    v7[3] = &unk_1E5142E50;
    v8 = v5;
    objc_msgSend(v6, "performChanges:", v7);

  }
}

- (void)_storyQueue_discardExistingAudioSession
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __72__PXStoryAudioSessionController__storyQueue_discardExistingAudioSession__block_invoke;
  v2[3] = &unk_1E5146DD8;
  v2[4] = self;
  -[PXStoryController performChanges:](self, "performChanges:", v2);
}

- (void)resourceReclamationEventDidOccur:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PXStoryController storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PXStoryAudioSessionController_resourceReclamationEventDidOccur___block_invoke;
  v6[3] = &unk_1E5148D30;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)configureUpdater:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryAudioSessionController;
  v3 = a3;
  -[PXStoryController configureUpdater:](&v4, sel_configureUpdater_, v3);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateShouldMixWithOthers, v4.receiver, v4.super_class);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateAudioSession);

}

- (void)handleModelChange:(unint64_t)a3
{
  __int16 v3;
  _QWORD v5[5];
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PXStoryAudioSessionController;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_);
  if ((v3 & 0x400) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __51__PXStoryAudioSessionController_handleModelChange___block_invoke;
    v5[3] = &unk_1E5146DD8;
    v5[4] = self;
    -[PXStoryController performChanges:](self, "performChanges:", v5);
  }
}

- (PXStoryAudioSessionController)initWithObservableModel:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryAudioSessionController.m"), 153, CFSTR("%s is not available as initializer"), "-[PXStoryAudioSessionController initWithObservableModel:]");

  abort();
}

- (PXStoryModel)model
{
  return (PXStoryModel *)objc_loadWeakRetained((id *)&self->_model);
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (PXAVResourceReclamationController)resourceReclamationController
{
  return self->_resourceReclamationController;
}

- (BOOL)shouldMixWithOthers
{
  return self->_shouldMixWithOthers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceReclamationController, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_destroyWeak((id *)&self->_model);
}

uint64_t __51__PXStoryAudioSessionController_handleModelChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateShouldMixWithOthers");
}

void __66__PXStoryAudioSessionController_resourceReclamationEventDidOccur___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_storyQueue_discardExistingAudioSession");

}

uint64_t __72__PXStoryAudioSessionController__storyQueue_discardExistingAudioSession__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAudioSession:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAudioSession");
}

uint64_t __49__PXStoryAudioSessionController_setAudioSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAudioSession:", *(_QWORD *)(a1 + 32));
}

void __62__PXStoryAudioSessionController__workQueue_createAudioSession__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAudioSession:", v1);

}

void __52__PXStoryAudioSessionController__updateAudioSession__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_workQueue_createAudioSession");

}

uint64_t __47__PXStoryAudioSessionController_initWithModel___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateShouldMixWithOthers");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAudioSession");
}

@end
