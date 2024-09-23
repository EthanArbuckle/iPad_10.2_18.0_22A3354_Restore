@implementation PXPhotosDetailsLoadCoordinationToken

- (PXPhotosDetailsLoadCoordinationToken)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsLoadCoordinator.m"), 130, CFSTR("%s is not available as initializer"), "-[PXPhotosDetailsLoadCoordinationToken init]");

  abort();
}

- (id)_initWithLoadCoordinator:(id)a3
{
  id v4;
  PXPhotosDetailsLoadCoordinationToken *v5;
  PXPhotosDetailsLoadCoordinationToken *v6;
  double v7;
  dispatch_time_t v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXPhotosDetailsLoadCoordinationToken;
  v5 = -[PXPhotosDetailsLoadCoordinationToken init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->__loadCoordinator, v4);
    objc_initWeak(&location, v6);
    objc_msgSend(v4, "timeoutDelay");
    v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__PXPhotosDetailsLoadCoordinationToken__initWithLoadCoordinator___block_invoke;
    v10[3] = &unk_1E5148D30;
    objc_copyWeak(&v11, &location);
    dispatch_after(v8, MEMORY[0x1E0C80D38], v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  if (!self->_didComplete)
  {
    self->_didComplete = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->__loadCoordinator);
    objc_msgSend(WeakRetained, "_tokenDidComplete:", 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)PXPhotosDetailsLoadCoordinationToken;
  -[PXPhotosDetailsLoadCoordinationToken dealloc](&v4, sel_dealloc);
}

- (void)complete
{
  id v3;

  if (!self->_didComplete)
  {
    self->_didComplete = 1;
    -[PXPhotosDetailsLoadCoordinationToken _loadCoordinator](self, "_loadCoordinator");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_tokenDidComplete:", self);

  }
}

- (void)_timeout
{
  NSObject *v3;
  uint8_t v4[16];

  if (!self->_didComplete)
  {
    PLRelatedGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "Photos details load coordination token did timeout. Related fetches might be unnecessarily delayed.", v4, 2u);
    }

    -[PXPhotosDetailsLoadCoordinationToken complete](self, "complete");
  }
}

- (PXPhotosDetailsLoadCoordinator)_loadCoordinator
{
  return (PXPhotosDetailsLoadCoordinator *)objc_loadWeakRetained((id *)&self->__loadCoordinator);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__loadCoordinator);
}

void __65__PXPhotosDetailsLoadCoordinationToken__initWithLoadCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_timeout");

}

@end
