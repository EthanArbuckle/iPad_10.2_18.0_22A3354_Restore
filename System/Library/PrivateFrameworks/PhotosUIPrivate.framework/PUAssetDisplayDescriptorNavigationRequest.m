@implementation PUAssetDisplayDescriptorNavigationRequest

- (PUAssetDisplayDescriptorNavigationRequest)init
{
  PUAssetDisplayDescriptorNavigationRequest *result;
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUAssetDisplayDescriptorNavigationRequest;
  result = -[PUAssetDisplayDescriptorNavigationRequest init](&v4, sel_init);
  if (result)
  {
    v3 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&result->_targetSeekTime.value = *MEMORY[0x1E0CA2E18];
    result->_targetSeekTime.epoch = *(_QWORD *)(v3 + 16);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_timeOutTimer)
    -[PUAssetDisplayDescriptorNavigationRequest _finishRequest](self, "_finishRequest");
  v3.receiver = self;
  v3.super_class = (Class)PUAssetDisplayDescriptorNavigationRequest;
  -[PUAssetDisplayDescriptorNavigationRequest dealloc](&v3, sel_dealloc);
}

- (void)setViewModel:(id)a3
{
  PUBrowsingViewModel *viewModel;
  PUBrowsingViewModel *v6;

  v6 = (PUBrowsingViewModel *)a3;
  -[PUAssetDisplayDescriptorNavigationRequest _assertInsideChangeBlock](self, "_assertInsideChangeBlock");
  viewModel = self->_viewModel;
  if (viewModel != v6)
  {
    -[PUBrowsingViewModel unregisterChangeObserver:](viewModel, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[PUBrowsingViewModel registerChangeObserver:](self->_viewModel, "registerChangeObserver:", self);
    -[PUAssetDisplayDescriptorNavigationRequest _invalidateFoundTargetAssetReference](self, "_invalidateFoundTargetAssetReference");
  }

}

- (void)setTargetAssetReference:(id)a3
{
  PUAssetReference *v5;

  v5 = (PUAssetReference *)a3;
  -[PUAssetDisplayDescriptorNavigationRequest _assertInsideChangeBlock](self, "_assertInsideChangeBlock");
  if (self->_targetAssetReference != v5)
  {
    objc_storeStrong((id *)&self->_targetAssetReference, a3);
    -[PUAssetDisplayDescriptorNavigationRequest _invalidateFoundTargetAssetReference](self, "_invalidateFoundTargetAssetReference");
  }

}

- (void)setTargetModificationDate:(id)a3
{
  NSDate *v5;
  char v6;
  NSDate *v7;

  v7 = (NSDate *)a3;
  -[PUAssetDisplayDescriptorNavigationRequest _assertInsideChangeBlock](self, "_assertInsideChangeBlock");
  v5 = v7;
  if (self->_targetModificationDate != v7)
  {
    v6 = -[NSDate isEqual:](v7, "isEqual:");
    v5 = v7;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_targetModificationDate, a3);
      -[PUAssetDisplayDescriptorNavigationRequest _invalidateFoundTargetAssetReference](self, "_invalidateFoundTargetAssetReference");
      v5 = v7;
    }
  }

}

- (void)setTargetSeekTime:(id *)a3
{
  __int128 v5;
  $95D729B680665BEAEFA1D6FCA8238556 targetSeekTime;
  CMTime time1;

  -[PUAssetDisplayDescriptorNavigationRequest _assertInsideChangeBlock](self, "_assertInsideChangeBlock");
  time1 = *(CMTime *)a3;
  targetSeekTime = self->_targetSeekTime;
  if (CMTimeCompare(&time1, (CMTime *)&targetSeekTime))
  {
    v5 = *(_OWORD *)&a3->var0;
    self->_targetSeekTime.epoch = a3->var3;
    *(_OWORD *)&self->_targetSeekTime.value = v5;
    -[PUAssetDisplayDescriptorNavigationRequest _setSeeked:](self, "_setSeeked:", 0);
  }
}

- (void)setTimeOut:(double)a3
{
  NSTimer *timeOutTimer;
  void *v6;
  NSTimer *v7;
  NSTimer *v8;
  _QWORD v9[5];
  id v10;
  id location;

  -[PUAssetDisplayDescriptorNavigationRequest _assertInsideChangeBlock](self, "_assertInsideChangeBlock");
  -[NSTimer invalidate](self->_timeOutTimer, "invalidate");
  timeOutTimer = self->_timeOutTimer;
  self->_timeOutTimer = 0;

  self->_timeOut = a3;
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0C99E88];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__PUAssetDisplayDescriptorNavigationRequest_setTimeOut___block_invoke;
  v9[3] = &unk_1E58AB210;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  objc_msgSend(v6, "pu_scheduledTimerWithTimeInterval:repeats:block:", 0, v9, a3);
  v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v8 = self->_timeOutTimer;
  self->_timeOutTimer = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)setCompletionHandler:(id)a3
{
  void *v4;
  id completionHandler;

  if (self->_completionHandler != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    completionHandler = self->_completionHandler;
    self->_completionHandler = v4;

  }
}

- (void)_updateCurrentAssetReference
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  -[PUAssetDisplayDescriptorNavigationRequest _foundTargetAssetReference](self, "_foundTargetAssetReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PUAssetDisplayDescriptorNavigationRequest viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentAssetReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqual:", v5) & 1) == 0)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __73__PUAssetDisplayDescriptorNavigationRequest__updateCurrentAssetReference__block_invoke;
      v6[3] = &unk_1E58ABCA8;
      v7 = v4;
      v8 = v3;
      objc_msgSend(v7, "performChanges:", v6);

    }
  }

}

- (void)_updateSeeking
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  __int128 v13;
  int64_t epoch;
  _QWORD v15[4];
  id v16;
  id location;
  _QWORD v18[4];
  id v19;

  -[PUAssetDisplayDescriptorNavigationRequest _foundTargetAssetReference](self, "_foundTargetAssetReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "mediaType");

    if (v6 == 2 && (self->_targetSeekTime.flags & 1) != 0)
    {
      -[PUAssetDisplayDescriptorNavigationRequest viewModel](self, "viewModel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __59__PUAssetDisplayDescriptorNavigationRequest__updateSeeking__block_invoke;
      v18[3] = &unk_1E58ABD10;
      v9 = v7;
      v19 = v9;
      objc_msgSend(v9, "performChanges:", v18);
      objc_msgSend(v9, "assetViewModelForAssetReference:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "videoPlayer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      v15[0] = v8;
      v15[1] = 3221225472;
      v15[2] = __59__PUAssetDisplayDescriptorNavigationRequest__updateSeeking__block_invoke_2;
      v15[3] = &unk_1E58AA420;
      objc_copyWeak(&v16, &location);
      v13 = *(_OWORD *)&self->_targetSeekTime.value;
      epoch = self->_targetSeekTime.epoch;
      objc_msgSend(v11, "seekToTime:completionHandler:", &v13, v15);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);

    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __59__PUAssetDisplayDescriptorNavigationRequest__updateSeeking__block_invoke_5;
      v12[3] = &unk_1E58ABD10;
      v12[4] = self;
      -[PUAssetDisplayDescriptorNavigationRequest performChanges:](self, "performChanges:", v12);
    }
  }

}

- (void)_setFoundTargetAssetReference:(id)a3
{
  PUAssetReference *v5;
  BOOL v6;
  PUAssetReference *v7;

  v7 = (PUAssetReference *)a3;
  -[PUAssetDisplayDescriptorNavigationRequest _assertInsideUpdate](self, "_assertInsideUpdate");
  v5 = v7;
  if (self->__foundTargetAssetReference != v7)
  {
    v6 = -[PUAssetReference isEqual:](v7, "isEqual:");
    v5 = v7;
    if (!v6)
    {
      objc_storeStrong((id *)&self->__foundTargetAssetReference, a3);
      -[PUAssetDisplayDescriptorNavigationRequest _updateCurrentAssetReference](self, "_updateCurrentAssetReference");
      -[PUAssetDisplayDescriptorNavigationRequest _updateSeeking](self, "_updateSeeking");
      -[PUAssetDisplayDescriptorNavigationRequest _invalidateArrived](self, "_invalidateArrived");
      v5 = v7;
    }
  }

}

- (void)_setSeeked:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[PUAssetDisplayDescriptorNavigationRequest _assertInsideChangeBlock](self, "_assertInsideChangeBlock");
  if (self->__seeked != v3)
  {
    self->__seeked = v3;
    -[PUAssetDisplayDescriptorNavigationRequest _invalidateArrived](self, "_invalidateArrived");
  }
}

- (void)_setTimedOut:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[PUAssetDisplayDescriptorNavigationRequest _assertInsideChangeBlock](self, "_assertInsideChangeBlock");
  if (self->__timedOut != v3)
  {
    self->__timedOut = v3;
    -[PUAssetDisplayDescriptorNavigationRequest _invalidateDone](self, "_invalidateDone");
  }
}

- (void)_setArrived:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[PUAssetDisplayDescriptorNavigationRequest _assertInsideUpdate](self, "_assertInsideUpdate");
  if (self->__arrived != v3)
  {
    self->__arrived = v3;
    -[PUAssetDisplayDescriptorNavigationRequest _invalidateDone](self, "_invalidateDone");
  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  _QWORD block[5];

  if (objc_msgSend(a4, "assetsDataSourceDidChange", a3))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__PUAssetDisplayDescriptorNavigationRequest_viewModel_didChange___block_invoke;
    block[3] = &unk_1E58ABD10;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)_assertInsideChangeBlock
{
  id v4;

  if (!-[PUAssetDisplayDescriptorNavigationRequest _isPerformingChanges](self, "_isPerformingChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetDisplayDescriptorNavigationRequest.m"), 239, CFSTR("not within a change block"));

  }
}

- (void)_assertInsideUpdate
{
  id v4;

  if (!-[PUAssetDisplayDescriptorNavigationRequest _isUpdating](self, "_isUpdating"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetDisplayDescriptorNavigationRequest.m"), 244, CFSTR("not withing update"));

  }
}

- (void)performChanges:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL8 v5;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[PUAssetDisplayDescriptorNavigationRequest _isPerformingChanges](self, "_isPerformingChanges");
  -[PUAssetDisplayDescriptorNavigationRequest _setPerformingChanges:](self, "_setPerformingChanges:", 1);
  v4[2](v4);

  -[PUAssetDisplayDescriptorNavigationRequest _setPerformingChanges:](self, "_setPerformingChanges:", v5);
  if (!v5)
    -[PUAssetDisplayDescriptorNavigationRequest _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_updateIfNeeded
{
  _BOOL8 v4;
  id v5;

  if (-[PUAssetDisplayDescriptorNavigationRequest _needsUpdate](self, "_needsUpdate"))
  {
    v4 = -[PUAssetDisplayDescriptorNavigationRequest _isUpdating](self, "_isUpdating");
    -[PUAssetDisplayDescriptorNavigationRequest _setUpdating:](self, "_setUpdating:", 1);
    -[PUAssetDisplayDescriptorNavigationRequest _updateFoundTargetAssetReferenceIfNeeded](self, "_updateFoundTargetAssetReferenceIfNeeded");
    -[PUAssetDisplayDescriptorNavigationRequest _updateArrivedIfNeeded](self, "_updateArrivedIfNeeded");
    -[PUAssetDisplayDescriptorNavigationRequest _updateDoneIfNeeded](self, "_updateDoneIfNeeded");
    -[PUAssetDisplayDescriptorNavigationRequest _setUpdating:](self, "_setUpdating:", v4);
    if (-[PUAssetDisplayDescriptorNavigationRequest _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetDisplayDescriptorNavigationRequest.m"), 271, CFSTR("updates still needed after an update cycle"));

    }
  }
}

- (BOOL)_needsUpdate
{
  return -[PUAssetDisplayDescriptorNavigationRequest _needsUpdateFoundTargetAssetReference](self, "_needsUpdateFoundTargetAssetReference")|| -[PUAssetDisplayDescriptorNavigationRequest _needsUpdateArrived](self, "_needsUpdateArrived")|| -[PUAssetDisplayDescriptorNavigationRequest _needsUpdateDone](self, "_needsUpdateDone");
}

- (void)_setNeedsUpdate
{
  id v4;

  if (!-[PUAssetDisplayDescriptorNavigationRequest _isUpdating](self, "_isUpdating")
    && !-[PUAssetDisplayDescriptorNavigationRequest _isPerformingChanges](self, "_isPerformingChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetDisplayDescriptorNavigationRequest.m"), 284, CFSTR("not within a change block or update"));

  }
}

- (void)_invalidateFoundTargetAssetReference
{
  -[PUAssetDisplayDescriptorNavigationRequest _setNeedsUpdateFoundTargetAssetReference:](self, "_setNeedsUpdateFoundTargetAssetReference:", 1);
  -[PUAssetDisplayDescriptorNavigationRequest _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateFoundTargetAssetReferenceIfNeeded
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  PUAssetDisplayDescriptorNavigationRequest *v15;
  id v16;

  if (-[PUAssetDisplayDescriptorNavigationRequest _needsUpdateFoundTargetAssetReference](self, "_needsUpdateFoundTargetAssetReference"))
  {
    -[PUAssetDisplayDescriptorNavigationRequest _setNeedsUpdateFoundTargetAssetReference:](self, "_setNeedsUpdateFoundTargetAssetReference:", 0);
    -[PUAssetDisplayDescriptorNavigationRequest _foundTargetAssetReference](self, "_foundTargetAssetReference");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[PUBrowsingViewModel assetsDataSource](self->_viewModel, "assetsDataSource");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "assetReferenceForAssetReference:", self->_targetAssetReference);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        if (self->_targetModificationDate)
        {
          objc_msgSend(v5, "asset");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "modificationDate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "compare:", self->_targetModificationDate);

          v10 = v9 == 1;
          if (v10)
          {
            v3 = v6;
          }
          else
          {
            v11 = MEMORY[0x1E0C809B0];
            v12 = 3221225472;
            v13 = __85__PUAssetDisplayDescriptorNavigationRequest__updateFoundTargetAssetReferenceIfNeeded__block_invoke;
            v14 = &unk_1E58ABCA8;
            v15 = self;
            v16 = v6;
            -[PUAssetDisplayDescriptorNavigationRequest performChanges:](self, "performChanges:", &v11);

            v3 = 0;
          }
          self->_hasSeenContentChange = v10;

        }
        else
        {
          v3 = v5;
        }
      }
      else
      {
        v3 = 0;
      }

    }
    -[PUAssetDisplayDescriptorNavigationRequest _setFoundTargetAssetReference:](self, "_setFoundTargetAssetReference:", v3, v11, v12, v13, v14, v15);

  }
}

- (void)_invalidateArrived
{
  -[PUAssetDisplayDescriptorNavigationRequest _setNeedsUpdateArrived:](self, "_setNeedsUpdateArrived:", 1);
  -[PUAssetDisplayDescriptorNavigationRequest _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateArrivedIfNeeded
{
  void *v3;
  _BOOL8 v4;

  if (-[PUAssetDisplayDescriptorNavigationRequest _needsUpdateArrived](self, "_needsUpdateArrived"))
  {
    -[PUAssetDisplayDescriptorNavigationRequest _setNeedsUpdateArrived:](self, "_setNeedsUpdateArrived:", 0);
    -[PUAssetDisplayDescriptorNavigationRequest _foundTargetAssetReference](self, "_foundTargetAssetReference");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      v4 = -[PUAssetDisplayDescriptorNavigationRequest _seeked](self, "_seeked");
    else
      v4 = 0;
    -[PUAssetDisplayDescriptorNavigationRequest _setArrived:](self, "_setArrived:", v4);
  }
}

- (void)_invalidateDone
{
  -[PUAssetDisplayDescriptorNavigationRequest _setNeedsUpdateDone:](self, "_setNeedsUpdateDone:", 1);
  -[PUAssetDisplayDescriptorNavigationRequest _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateDoneIfNeeded
{
  if (-[PUAssetDisplayDescriptorNavigationRequest _needsUpdateDone](self, "_needsUpdateDone"))
  {
    -[PUAssetDisplayDescriptorNavigationRequest _setNeedsUpdateDone:](self, "_setNeedsUpdateDone:", 0);
    if (-[PUAssetDisplayDescriptorNavigationRequest _arrived](self, "_arrived")
      || -[PUAssetDisplayDescriptorNavigationRequest _timedOut](self, "_timedOut"))
    {
      -[PUAssetDisplayDescriptorNavigationRequest _finishRequest](self, "_finishRequest");
    }
  }
}

- (void)_finishRequest
{
  void *v3;
  BOOL v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PUAssetDisplayDescriptorNavigationRequest _navigationRequestError](self, "_navigationRequestError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUAssetDisplayDescriptorNavigationRequest _arrived](self, "_arrived");
  -[PUAssetDisplayDescriptorNavigationRequest _infoMessage](self, "_infoMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLOneUpGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3 || !v4)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    v8 = v7;
    v9 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    v8 = v7;
    v9 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_1AAB61000, v8, v9, "%@", buf, 0xCu);
LABEL_8:

  v10 = (void *)objc_msgSend(self->_completionHandler, "copy");
  v11 = v10;
  if (v10)
  {
    v13 = v10;
    v12 = v3;
    px_dispatch_on_main_queue();

  }
  -[PUAssetDisplayDescriptorNavigationRequest _cleanUpWhenDone](self, "_cleanUpWhenDone");

}

- (void)_cleanUpWhenDone
{
  NSTimer *timeOutTimer;

  -[NSTimer invalidate](self->_timeOutTimer, "invalidate");
  timeOutTimer = self->_timeOutTimer;
  self->_timeOutTimer = 0;

  -[PUAssetDisplayDescriptorNavigationRequest setCompletionHandler:](self, "setCompletionHandler:", 0);
}

- (id)_navigationRequestError
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (-[PUAssetDisplayDescriptorNavigationRequest _arrived](self, "_arrived"))
  {
    v3 = 0;
  }
  else
  {
    if (-[PUAssetDisplayDescriptorNavigationRequest _timedOut](self, "_timedOut"))
    {
      if (self->__foundTargetAssetReference)
      {
        v4 = (void *)MEMORY[0x1E0CB35C8];
        if (self->_hasSeenContentChange)
          v5 = 5;
        else
          v5 = 4;
      }
      else
      {
        v4 = (void *)MEMORY[0x1E0CB35C8];
        v5 = 3;
      }
    }
    else
    {
      v4 = (void *)MEMORY[0x1E0CB35C8];
      if (self->_timeOutTimer)
        v5 = 2;
      else
        v5 = 0;
    }
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("PUAssetDisplayDescriptorNavigationErrorDomain"), v5, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_infoMessage
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v2 = CFSTR("YES");
  if (self->__arrived)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  if (self->__timedOut)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (self->__foundTargetAssetReference)
    v5 = CFSTR("NO");
  else
    v5 = CFSTR("YES");
  if (self->_hasSeenContentChange)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (!self->__seeked)
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Navigation request terminated with success %@, timedOut %@, waiting for dataSource %@, has seen content change %@, seeked %@"), v3, v4, v5, v6, v2);
}

- (PUBrowsingViewModel)viewModel
{
  return self->_viewModel;
}

- (PUAssetReference)targetAssetReference
{
  return self->_targetAssetReference;
}

- (NSDate)targetModificationDate
{
  return self->_targetModificationDate;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetSeekTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (double)timeOut
{
  return self->_timeOut;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (BOOL)_isPerformingChanges
{
  return self->__isPerformingChanges;
}

- (void)_setPerformingChanges:(BOOL)a3
{
  self->__isPerformingChanges = a3;
}

- (BOOL)_isUpdating
{
  return self->__isUpdating;
}

- (void)_setUpdating:(BOOL)a3
{
  self->__isUpdating = a3;
}

- (BOOL)_needsUpdateFoundTargetAssetReference
{
  return self->__needsUpdateFoundTargetAssetReference;
}

- (void)_setNeedsUpdateFoundTargetAssetReference:(BOOL)a3
{
  self->__needsUpdateFoundTargetAssetReference = a3;
}

- (BOOL)_needsUpdateArrived
{
  return self->__needsUpdateArrived;
}

- (void)_setNeedsUpdateArrived:(BOOL)a3
{
  self->__needsUpdateArrived = a3;
}

- (BOOL)_needsUpdateDone
{
  return self->__needsUpdateDone;
}

- (void)_setNeedsUpdateDone:(BOOL)a3
{
  self->__needsUpdateDone = a3;
}

- (PUAssetReference)_foundTargetAssetReference
{
  return self->__foundTargetAssetReference;
}

- (BOOL)_seeked
{
  return self->__seeked;
}

- (BOOL)_arrived
{
  return self->__arrived;
}

- (BOOL)_timedOut
{
  return self->__timedOut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__foundTargetAssetReference, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_targetModificationDate, 0);
  objc_storeStrong((id *)&self->_targetAssetReference, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_timeOutTimer, 0);
}

uint64_t __59__PUAssetDisplayDescriptorNavigationRequest__finishRequest__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __85__PUAssetDisplayDescriptorNavigationRequest__updateFoundTargetAssetReferenceIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTargetAssetReference:", *(_QWORD *)(a1 + 40));
}

uint64_t __65__PUAssetDisplayDescriptorNavigationRequest_viewModel_didChange___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__PUAssetDisplayDescriptorNavigationRequest_viewModel_didChange___block_invoke_2;
  v3[3] = &unk_1E58ABD10;
  v3[4] = v1;
  return objc_msgSend(v1, "performChanges:", v3);
}

uint64_t __65__PUAssetDisplayDescriptorNavigationRequest_viewModel_didChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateFoundTargetAssetReference");
}

uint64_t __59__PUAssetDisplayDescriptorNavigationRequest__updateSeeking__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVideoContentAllowedForAllReasons");
}

void __59__PUAssetDisplayDescriptorNavigationRequest__updateSeeking__block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PUAssetDisplayDescriptorNavigationRequest__updateSeeking__block_invoke_3;
  block[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

uint64_t __59__PUAssetDisplayDescriptorNavigationRequest__updateSeeking__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSeeked:", 1);
}

void __59__PUAssetDisplayDescriptorNavigationRequest__updateSeeking__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__PUAssetDisplayDescriptorNavigationRequest__updateSeeking__block_invoke_4;
  v3[3] = &unk_1E58ABD10;
  v4 = WeakRetained;
  v2 = WeakRetained;
  objc_msgSend(v2, "performChanges:", v3);

}

uint64_t __59__PUAssetDisplayDescriptorNavigationRequest__updateSeeking__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSeeked:", 1);
}

uint64_t __73__PUAssetDisplayDescriptorNavigationRequest__updateCurrentAssetReference__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentAssetReference:", *(_QWORD *)(a1 + 40));
}

void __56__PUAssetDisplayDescriptorNavigationRequest_setTimeOut___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PUAssetDisplayDescriptorNavigationRequest_setTimeOut___block_invoke_2;
  v6[3] = &unk_1E58ABD10;
  v7 = WeakRetained;
  v3 = WeakRetained;
  objc_msgSend(v3, "performChanges:", v6);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;

}

uint64_t __56__PUAssetDisplayDescriptorNavigationRequest_setTimeOut___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setTimedOut:", 1);
}

@end
