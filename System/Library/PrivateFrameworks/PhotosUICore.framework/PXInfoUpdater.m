@implementation PXInfoUpdater

void __28__PXInfoUpdater__updateInfo__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleCurrentUpdateWithInfo:generation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

- (PXInfoUpdater)initWithInfoProvider:(id)a3 infoKind:(id)a4
{
  id v6;
  id v7;
  PXInfoUpdater *v8;
  PXInfoUpdater *v9;
  uint64_t v10;
  NSString *infoKind;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXInfoUpdater;
  v8 = -[PXInfoUpdater init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_infoProvider, v6);
    v9->_infoProviderRespondsTo.priorityForInfoRequestOfKind = objc_opt_respondsToSelector() & 1;
    v10 = objc_msgSend(v7, "copy");
    infoKind = v9->_infoKind;
    v9->_infoKind = (NSString *)v10;

    v9->_shouldUpdateInfo = 1;
  }

  return v9;
}

void __46__PXInfoUpdater_performBlockWhenDoneUpdating___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "performBlockWhenDoneUpdating:", *(_QWORD *)(a1 + 32));

}

- (void)invalidateInfo
{
  -[PXInfoUpdater setShouldUpdateInfo:](self, "setShouldUpdateInfo:", 1);
  -[PXInfoUpdater _updateInfoIfNeeded](self, "_updateInfoIfNeeded");
}

- (void)performBlockWhenDoneUpdating:(id)a3
{
  void (**v4)(_QWORD);
  _QWORD block[4];
  void (**v6)(_QWORD);
  id v7;
  id location;

  v4 = (void (**)(_QWORD))a3;
  if (-[PXInfoUpdater isUpdatingInfo](self, "isUpdatingInfo")
    || -[PXInfoUpdater shouldUpdateInfo](self, "shouldUpdateInfo"))
  {
    -[PXInfoUpdater info](self, "info");

    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__PXInfoUpdater_performBlockWhenDoneUpdating___block_invoke;
    block[3] = &unk_1E5146480;
    objc_copyWeak(&v7, &location);
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    v4[2](v4);
  }

}

- (void)_handleCurrentUpdateWithInfo:(id)a3 generation:(int64_t)a4
{
  id v6;

  v6 = a3;
  if (-[PXInfoUpdater currentUpdateGeneration](self, "currentUpdateGeneration") == a4)
  {
    -[PXInfoUpdater setInfo:](self, "setInfo:", v6);
    -[PXInfoUpdater setIsUpdatingInfo:](self, "setIsUpdatingInfo:", 0);
    if (-[PXInfoUpdater shouldUpdateInfo](self, "shouldUpdateInfo"))
      -[PXInfoUpdater _updateInfo](self, "_updateInfo");
  }

}

- (id)info
{
  _QWORD v4[4];
  id v5;
  id location;

  if (-[PXInfoUpdater shouldUpdateInfo](self, "shouldUpdateInfo"))
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __21__PXInfoUpdater_info__block_invoke;
    v4[3] = &unk_1E5148D30;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  return self->_info;
}

- (void)_updateInfoIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;

  if (-[PXInfoUpdater shouldUpdateInfo](self, "shouldUpdateInfo"))
  {
    if (-[PXInfoUpdater isUpdatingInfo](self, "isUpdatingInfo"))
    {
      if (!self->_infoProviderRespondsTo.priorityForInfoRequestOfKind)
        return;
      -[PXInfoUpdater infoProvider](self, "infoProvider");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXInfoUpdater infoKind](self, "infoKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v3, "priorityForInfoRequestOfKind:", v4);

      if (v5 <= -[PXInfoUpdater currentUpdatePriority](self, "currentUpdatePriority"))
        return;
    }
    else
    {
      v5 = 0;
    }
    if (!self->_observerRespondsTo.shouldUpdate
      || (-[PXInfoUpdater observer](self, "observer"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "infoUpdaterShouldUpdate:", self),
          v6,
          v7))
    {
      -[PXInfoUpdater setCurrentUpdatePriority:](self, "setCurrentUpdatePriority:", v5);
      -[PXInfoUpdater _updateInfo](self, "_updateInfo");
    }
  }
}

- (BOOL)shouldUpdateInfo
{
  return self->_shouldUpdateInfo;
}

- (BOOL)isUpdatingInfo
{
  return self->_isUpdatingInfo;
}

- (void)setInfo:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  if (self->_info != v5)
  {
    v7 = v5;
    objc_storeStrong(&self->_info, a3);
    -[PXInfoUpdater observer](self, "observer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "infoUpdaterDidUpdate:", self);

    v5 = v7;
  }

}

- (void)_updateInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9[2];
  id location;

  v3 = (void *)(-[PXInfoUpdater currentUpdateGeneration](self, "currentUpdateGeneration") + 1);
  -[PXInfoUpdater setCurrentUpdateGeneration:](self, "setCurrentUpdateGeneration:", v3);
  -[PXInfoUpdater setShouldUpdateInfo:](self, "setShouldUpdateInfo:", 0);
  -[PXInfoUpdater setIsUpdatingInfo:](self, "setIsUpdatingInfo:", 1);
  -[PXInfoUpdater currentUpdateProgress](self, "currentUpdateProgress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[PXInfoUpdater infoProvider](self, "infoProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_initWeak(&location, self);
    -[PXInfoUpdater infoKind](self, "infoKind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __28__PXInfoUpdater__updateInfo__block_invoke;
    v8[3] = &unk_1E51198D0;
    objc_copyWeak(v9, &location);
    v9[1] = v3;
    objc_msgSend(v5, "requestInfoOfKind:withResultHandler:", v6, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PXInfoUpdater _handleCurrentUpdateWithInfo:generation:](self, "_handleCurrentUpdateWithInfo:generation:", 0, v3);
    v7 = 0;
  }
  -[PXInfoUpdater setCurrentUpdateProgress:](self, "setCurrentUpdateProgress:", v7);

}

- (void)setIsUpdatingInfo:(BOOL)a3
{
  self->_isUpdatingInfo = a3;
}

- (int64_t)currentUpdateGeneration
{
  return self->_currentUpdateGeneration;
}

- (void)setShouldUpdateInfo:(BOOL)a3
{
  self->_shouldUpdateInfo = a3;
}

- (PXInfoProvider)infoProvider
{
  return (PXInfoProvider *)objc_loadWeakRetained((id *)&self->_infoProvider);
}

- (NSString)infoKind
{
  return self->_infoKind;
}

- (void)setCurrentUpdateProgress:(id)a3
{
  objc_storeStrong((id *)&self->_currentUpdateProgress, a3);
}

- (void)setCurrentUpdateGeneration:(int64_t)a3
{
  self->_currentUpdateGeneration = a3;
}

- (NSProgress)currentUpdateProgress
{
  return self->_currentUpdateProgress;
}

- (void)setCurrentUpdatePriority:(int64_t)a3
{
  self->_currentUpdatePriority = a3;
}

- (PXInfoUpdaterObserver)observer
{
  return (PXInfoUpdaterObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

void __28__PXInfoUpdater__updateInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5[2];

  v3 = a2;
  objc_copyWeak(v5, (id *)(a1 + 32));
  v4 = v3;
  v5[1] = *(id *)(a1 + 40);
  px_dispatch_on_main_queue();

  objc_destroyWeak(v5);
}

- (int64_t)currentUpdatePriority
{
  return self->_currentUpdatePriority;
}

- (void)setObserver:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_observer, obj);
    self->_observerRespondsTo.shouldUpdate = objc_opt_respondsToSelector() & 1;
    -[PXInfoUpdater _updateInfoIfNeeded](self, "_updateInfoIfNeeded");
  }

}

void __21__PXInfoUpdater_info__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateInfoIfNeeded");

}

- (PXInfoUpdater)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXInfoUpdater.m"), 36, CFSTR("%s is not available as initializer"), "-[PXInfoUpdater init]");

  abort();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUpdateProgress, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_infoKind, 0);
  objc_destroyWeak((id *)&self->_infoProvider);
  objc_storeStrong(&self->_info, 0);
}

@end
