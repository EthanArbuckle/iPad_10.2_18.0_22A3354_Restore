@implementation PUPXAssetsDataSourceManager

- (PUPXAssetsDataSourceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXAssetsDataSourceManager.m"), 24, CFSTR("%s is not available as initializer"), "-[PUPXAssetsDataSourceManager init]");

  abort();
}

- (PUPXAssetsDataSourceManager)initWithUnderlyingDataSourceManager:(id)a3
{
  id v5;
  PUPXAssetsDataSourceManager *v6;
  PUPXAssetsDataSourceManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUPXAssetsDataSourceManager;
  v6 = -[PUPXAssetsDataSourceManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingDataSourceManager, a3);
    -[PXAssetsDataSourceManager registerChangeObserver:context:](v7->_underlyingDataSourceManager, "registerChangeObserver:context:", v7, PUPXAssetsDataSourceManagerObservationContext);
    -[PUPXAssetsDataSourceManager _update](v7, "_update");
  }

  return v7;
}

- (id)photosDataSource
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[PUPXAssetsDataSourceManager underlyingDataSourceManager](self, "underlyingDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PUPXAssetsDataSourceManager underlyingDataSourceManager](self, "underlyingDataSourceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photosDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_scheduleUpdate
{
  void *v3;
  _QWORD block[4];
  id v5[2];
  id location;

  v3 = (void *)(-[PUPXAssetsDataSourceManager _currentUpdateID](self, "_currentUpdateID") + 1);
  -[PUPXAssetsDataSourceManager _setCurrentUpdateId:](self, "_setCurrentUpdateId:", v3);
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PUPXAssetsDataSourceManager__scheduleUpdate__block_invoke;
  block[3] = &unk_1E58A79B8;
  objc_copyWeak(v5, &location);
  v5[1] = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

- (void)_handleScheduledUpdateWithID:(int64_t)a3
{
  if (-[PUPXAssetsDataSourceManager _currentUpdateID](self, "_currentUpdateID") == a3)
    -[PUPXAssetsDataSourceManager _update](self, "_update");
}

- (void)_update
{
  void *v3;
  PUPXAssetsDataSource *v4;
  id v5;

  -[PUPXAssetsDataSourceManager underlyingDataSourceManager](self, "underlyingDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[PUPXAssetsDataSource initWithUnderlyingDataSource:]([PUPXAssetsDataSource alloc], "initWithUnderlyingDataSource:", v5);
  -[PUAssetsDataSourceManager setAssetsDataSource:](self, "setAssetsDataSource:", v4);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PUPXAssetsDataSourceManagerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXAssetsDataSourceManager.m"), 80, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v11 = v9;
    -[PUPXAssetsDataSourceManager _scheduleUpdate](self, "_scheduleUpdate");
    v9 = v11;
  }

}

- (PXAssetsDataSourceManager)underlyingDataSourceManager
{
  return self->_underlyingDataSourceManager;
}

- (int64_t)_currentUpdateID
{
  return self->__currentUpdateID;
}

- (void)_setCurrentUpdateId:(int64_t)a3
{
  self->__currentUpdateID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDataSourceManager, 0);
}

void __46__PUPXAssetsDataSourceManager__scheduleUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleScheduledUpdateWithID:", *(_QWORD *)(a1 + 40));

}

@end
