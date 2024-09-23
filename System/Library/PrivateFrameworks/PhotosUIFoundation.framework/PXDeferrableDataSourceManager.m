@implementation PXDeferrableDataSourceManager

- (PXDeferrableDataSourceManager)initWithDataSourceManager:(id)a3
{
  id v6;
  PXDeferrableDataSourceManager *v7;
  PXDeferrableDataSourceManager *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXDeferrableDataSourceManager;
  v7 = -[PXSectionedDataSourceManager init](&v11, sel_init);
  v8 = v7;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("PXDeferrableDataSourceManager.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("underlyingDataSourceManager"));

    if (!v8)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v7)
  {
LABEL_3:
    objc_storeStrong((id *)&v8->_underlyingDataSourceManager, a3);
    -[PXSectionedDataSourceManager registerChangeObserver:context:](v8->_underlyingDataSourceManager, "registerChangeObserver:context:", v8, UnderlyingDataSourceManagerObservationContext);
  }
LABEL_4:

  return v8;
}

- (PXDeferrableDataSourceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDeferrableDataSourceManager.m"), 37, CFSTR("%s is not available as initializer"), "-[PXDeferrableDataSourceManager init]");

  abort();
}

- (id)changeDetailsFromDataSource:(id)a3 toDataSource:(id)a4
{
  return -[PXSectionedDataSourceManager changeDetailsFromDataSource:toDataSource:](self->_underlyingDataSourceManager, "changeDetailsFromDataSource:toDataSource:", a3, a4);
}

- (void)setDataSource:(id)a3 changeDetails:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDeferrableDataSourceManager.m"), 45, CFSTR("%s should not be called directly"), "-[PXDeferrableDataSourceManager setDataSource:changeDetails:]");

  abort();
}

- (void)setDataSource:(id)a3 changeDetailsArray:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDeferrableDataSourceManager.m"), 49, CFSTR("%s should not be called directly"), "-[PXDeferrableDataSourceManager setDataSource:changeDetailsArray:]");

  abort();
}

- (void)setUnderlyingDataSourceManager:(id)a3
{
  PXSectionedDataSourceManager *v6;
  PXSectionedDataSourceManager **p_underlyingDataSourceManager;
  PXSectionedDataSourceManager *underlyingDataSourceManager;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = (PXSectionedDataSourceManager *)a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDeferrableDataSourceManager.m"), 53, CFSTR("%s must be called on the main thread"), "-[PXDeferrableDataSourceManager setUnderlyingDataSourceManager:]");

  }
  p_underlyingDataSourceManager = &self->_underlyingDataSourceManager;
  underlyingDataSourceManager = self->_underlyingDataSourceManager;
  if (underlyingDataSourceManager != v6)
  {
    -[PXSectionedDataSourceManager unregisterChangeObserver:context:](underlyingDataSourceManager, "unregisterChangeObserver:context:", self, UnderlyingDataSourceManagerObservationContext);
    objc_storeStrong((id *)&self->_underlyingDataSourceManager, a3);
    -[PXSectionedDataSourceManager registerChangeObserver:context:](*p_underlyingDataSourceManager, "registerChangeObserver:context:", self, UnderlyingDataSourceManagerObservationContext);
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSectionedDataSourceManager dataSource](*p_underlyingDataSourceManager, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSectionedDataSourceChangeDetails changeDetailsWithoutIncrementalChangesFromDataSourceIdentifier:toDataSourceIdentifier:](PXSectionedDataSourceChangeDetails, "changeDetailsWithoutIncrementalChangesFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v9, "identifier"), objc_msgSend(v10, "identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDeferrableDataSourceManager _internal_setDataSource:changeDetailsArray:](self, "_internal_setDataSource:changeDetailsArray:", v10, v12);

  }
}

- (void)_finishTransitionToDataSource:(id)a3 changeDetailsArray:(id)a4
{
  id v7;
  id v8;
  void *v9;
  objc_super v10;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDeferrableDataSourceManager.m"), 70, CFSTR("%s must be called on the main thread"), "-[PXDeferrableDataSourceManager _finishTransitionToDataSource:changeDetailsArray:]");

  }
  self->_clientIsHandlingDataSourceTransition = 0;
  v10.receiver = self;
  v10.super_class = (Class)PXDeferrableDataSourceManager;
  -[PXSectionedDataSourceManager setDataSource:changeDetailsArray:](&v10, sel_setDataSource_changeDetailsArray_, v7, v8);
  -[PXDeferrableDataSourceManager resumeDataSourceChanges](self, "resumeDataSourceChanges");

}

- (void)_internal_setDataSource:(id)a3 changeDetailsArray:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  if (-[PXDeferrableDataSourceManager _canAttemptDataSourceChanges](self, "_canAttemptDataSourceChanges")
    && (-[PXDeferrableDataSourceManager delegate](self, "delegate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "shouldSuspendDataSourceChangesForDataSourceManager:", self),
        v8,
        !v9))
  {
    self->_clientIsHandlingDataSourceTransition = 1;
    objc_initWeak(&location, self);
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __76__PXDeferrableDataSourceManager__internal_setDataSource_changeDetailsArray___block_invoke;
    v18 = &unk_2514CF3C0;
    objc_copyWeak(&v21, &location);
    v10 = v6;
    v19 = v10;
    v20 = v7;
    v11 = (void (**)(_QWORD))_Block_copy(&v15);
    -[PXDeferrableDataSourceManager delegate](self, "delegate", v15, v16, v17, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[PXDeferrableDataSourceManager delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dataSourceManager:willSetDataSource:completion:", self, v10, v11);

    }
    else
    {
      v11[2](v11);
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PXDeferrableDataSourceManager _setPendingDataSource:changeDetailsArray:](self, "_setPendingDataSource:changeDetailsArray:", v6, v7);
  }

}

- (id)createInitialDataSource
{
  self->_hasInitialDataSource = 1;
  return -[PXSectionedDataSourceManager dataSource](self->_underlyingDataSourceManager, "dataSource");
}

- (BOOL)_canAttemptDataSourceChanges
{
  return !self->_clientIsHandlingDataSourceTransition && self->_pendingDataSource == 0;
}

- (void)_setPendingDataSource:(id)a3 changeDetailsArray:(id)a4
{
  PXSectionedDataSource *v6;
  NSArray *v7;
  PXSectionedDataSource *pendingDataSource;
  NSArray *pendingDataSourceChangeDetails;
  PXSectionedDataSource *v10;

  v6 = (PXSectionedDataSource *)a3;
  v7 = (NSArray *)a4;
  pendingDataSource = self->_pendingDataSource;
  self->_pendingDataSource = v6;
  v10 = v6;

  pendingDataSourceChangeDetails = self->_pendingDataSourceChangeDetails;
  self->_pendingDataSourceChangeDetails = v7;

}

- (void)resumeDataSourceChanges
{
  PXSectionedDataSource *pendingDataSource;
  NSArray *pendingDataSourceChangeDetails;
  NSArray *v5;
  NSArray *v6;
  void *v8;
  PXSectionedDataSource *v9;

  if (self->_clientIsHandlingDataSourceTransition)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDeferrableDataSourceManager.m"), 124, CFSTR("Cannot call -[PXDeferrableDataSourceManager resumeDataSourceChanges] while an outstanding change is being made. This means we're not calling the completion block for accepting a change."));

  }
  pendingDataSource = self->_pendingDataSource;
  if (pendingDataSource)
  {
    pendingDataSourceChangeDetails = self->_pendingDataSourceChangeDetails;
    self->_pendingDataSource = 0;
    v5 = pendingDataSourceChangeDetails;
    v9 = pendingDataSource;

    v6 = self->_pendingDataSourceChangeDetails;
    self->_pendingDataSourceChangeDetails = 0;

    -[PXDeferrableDataSourceManager _internal_setDataSource:changeDetailsArray:](self, "_internal_setDataSource:changeDetailsArray:", v9, v5);
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  v9 = a3;
  if ((void *)UnderlyingDataSourceManagerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDeferrableDataSourceManager.m"), 154, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0 && self->_hasInitialDataSource)
  {
    v15 = v9;
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSectionedDataSourceManager dataSource](self->_underlyingDataSourceManager, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSectionedDataSourceManager changeHistory](self->_underlyingDataSourceManager, "changeHistory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v10, "identifier"), objc_msgSend(v11, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXDeferrableDataSourceManager _internal_setDataSource:changeDetailsArray:](self, "_internal_setDataSource:changeDetailsArray:", v11, v13);
    v9 = v15;
  }

}

- (PXDeferrableDataSourceManagerDelegate)delegate
{
  return (PXDeferrableDataSourceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXSectionedDataSourceManager)underlyingDataSourceManager
{
  return self->_underlyingDataSourceManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDataSourceManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingDataSourceChangeDetails, 0);
  objc_storeStrong((id *)&self->_pendingDataSource, 0);
}

void __76__PXDeferrableDataSourceManager__internal_setDataSource_changeDetailsArray___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_finishTransitionToDataSource:changeDetailsArray:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
