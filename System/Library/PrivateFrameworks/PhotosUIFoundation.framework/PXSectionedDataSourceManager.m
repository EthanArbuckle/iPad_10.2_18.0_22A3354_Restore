@implementation PXSectionedDataSourceManager

- (PXSectionedDataSource)dataSource
{
  PXSectionedDataSource *dataSource;
  PXSectionedDataSource *v4;
  PXSectionedDataSource *v5;

  dataSource = self->_dataSource;
  if (!dataSource)
  {
    -[PXSectionedDataSourceManager createInitialDataSource](self, "createInitialDataSource");
    v4 = (PXSectionedDataSource *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dataSource;
    self->_dataSource = v4;

    -[PXSectionedDataSourceManager didCreateInitialDataSource](self, "didCreateInitialDataSource");
    dataSource = self->_dataSource;
  }
  return dataSource;
}

- (void)setDataSource:(id)a3 changeDetails:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v11 = v6;
    v8 = (void *)MEMORY[0x24BDBCE30];
    v9 = a3;
    objc_msgSend(v8, "arrayWithObjects:count:", &v11, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[PXSectionedDataSourceManager setDataSource:changeDetailsArray:](self, "setDataSource:changeDetailsArray:", v9, v10, v11, v12);

  }
  else
  {
    v10 = a3;
    -[PXSectionedDataSourceManager setDataSource:changeDetailsArray:](self, "setDataSource:changeDetailsArray:", v10, 0);
  }

}

- (void)setDataSource:(id)a3 changeDetailsArray:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__PXSectionedDataSourceManager_setDataSource_changeDetailsArray___block_invoke;
  v10[3] = &unk_2514D0238;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PXObservable performChanges:](self, "performChanges:", v10);

}

- (void)didPublishChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSectionedDataSourceManager;
  -[PXObservable didPublishChanges](&v3, sel_didPublishChanges);
  if ((-[PXObservable currentChanges](self, "currentChanges") & 1) != 0)
    -[PXSectionedDataSourceManager _reevaluateWaitingConditions](self, "_reevaluateWaitingConditions");
}

void __65__PXSectionedDataSourceManager_setDataSource_changeDetailsArray___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_setDataSource:", *(_QWORD *)(a1 + 40));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "changeHistory", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addChangeDetails:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (PXSectionedChangeDetailsRepository)changeHistory
{
  return self->_changeHistory;
}

- (void)_reevaluateWaitingConditions
{
  id v3;
  void *v4;
  NSMutableArray *waitingConditions;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD);
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableArray count](self->_waitingConditions, "count"))
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD1698]);
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    waitingConditions = self->_waitingConditions;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __60__PXSectionedDataSourceManager__reevaluateWaitingConditions__block_invoke;
    v19[3] = &unk_2514D0210;
    v6 = v4;
    v20 = v6;
    v7 = v3;
    v21 = v7;
    -[NSMutableArray enumerateObjectsUsingBlock:](waitingConditions, "enumerateObjectsUsingBlock:", v19);
    if (objc_msgSend(v7, "count"))
    {
      -[NSMutableArray objectsAtIndexes:](self->_waitingConditions, "objectsAtIndexes:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectsAtIndexes:](self->_waitingConditions, "removeObjectsAtIndexes:", v7);
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v16;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v16 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13), "completionHandler", (_QWORD)v15);
            v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v14[2](v14, 1);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
        }
        while (v11);
      }

    }
  }
}

- (void)_setDataSource:(id)a3
{
  int64_t v5;
  id v6;

  v6 = a3;
  v5 = -[PXSectionedDataSource identifier](self->_dataSource, "identifier");
  if (v5 != objc_msgSend(v6, "identifier"))
  {
    objc_storeStrong((id *)&self->_dataSource, a3);
    -[PXObservable signalChange:](self, "signalChange:", 1);
  }

}

- (void)registerChangeObserver:(id)a3 context:(void *)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXSectionedDataSourceManager;
  -[PXObservable registerChangeObserver:context:](&v4, sel_registerChangeObserver_context_, a3, a4);
}

- (PXSectionedDataSourceManager)init
{
  PXSectionedDataSourceManager *v2;
  PXSectionedChangeDetailsRepository *v3;
  PXSectionedChangeDetailsRepository *changeHistory;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSectionedDataSourceManager;
  v2 = -[PXObservable init](&v6, sel_init);
  if (v2)
  {
    v3 = -[PXSectionedChangeDetailsRepository initWithChangeHistoryLimit:]([PXSectionedChangeDetailsRepository alloc], "initWithChangeHistoryLimit:", 100);
    changeHistory = v2->_changeHistory;
    v2->_changeHistory = v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeHistory, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_waitingConditions, 0);
}

- (void)unregisterChangeObserver:(id)a3 context:(void *)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXSectionedDataSourceManager;
  -[PXObservable unregisterChangeObserver:context:](&v4, sel_unregisterChangeObserver_context_, a3, a4);
}

- (id)changeDetailsFromDataSource:(id)a3 toDataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v9 = 0;
    if (v7)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v9 = objc_msgSend(v6, "identifier");
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = objc_msgSend(v8, "identifier");
LABEL_6:
  -[PXSectionedDataSourceManager changeHistory](self, "changeHistory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "coalescedChangeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)allChangeDetailsFromDataSource:(id)a3 toDataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v9 = 0;
    if (v7)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v9 = objc_msgSend(v6, "identifier");
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = objc_msgSend(v8, "identifier");
LABEL_6:
  -[PXSectionedDataSourceManager changeHistory](self, "changeHistory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)waitForCondition:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  uint64_t (**v8)(id, void *);
  void (**v9)(id, uint64_t);
  void *v10;
  int v11;
  PXSectionedDataSourceWaitingCondition *v12;
  NSMutableArray *waitingConditions;
  NSMutableArray *v14;
  NSMutableArray *v15;
  dispatch_time_t v16;
  PXSectionedDataSourceWaitingCondition *v17;
  _QWORD block[4];
  PXSectionedDataSourceWaitingCondition *v19;
  id v20;
  id location;

  v8 = (uint64_t (**)(id, void *))a3;
  v9 = (void (**)(id, uint64_t))a5;
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8[2](v8, v10);

  if (v11)
  {
    v9[2](v9, 1);
  }
  else
  {
    v12 = objc_alloc_init(PXSectionedDataSourceWaitingCondition);
    -[PXSectionedDataSourceWaitingCondition setCondition:](v12, "setCondition:", v8);
    -[PXSectionedDataSourceWaitingCondition setCompletionHandler:](v12, "setCompletionHandler:", v9);
    waitingConditions = self->_waitingConditions;
    if (!waitingConditions)
    {
      v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v15 = self->_waitingConditions;
      self->_waitingConditions = v14;

      waitingConditions = self->_waitingConditions;
    }
    -[NSMutableArray addObject:](waitingConditions, "addObject:", v12);
    objc_initWeak(&location, self);
    v16 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__PXSectionedDataSourceManager_waitForCondition_timeout_completionHandler___block_invoke;
    block[3] = &unk_2514D01E8;
    objc_copyWeak(&v20, &location);
    v19 = v12;
    v17 = v12;
    dispatch_after(v16, MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

}

- (void)_waitingConditionDidTimeout:(id)a3
{
  uint64_t v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  v4 = -[NSMutableArray indexOfObject:](self->_waitingConditions, "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_waitingConditions, "removeObjectAtIndex:", v4);
    objc_msgSend(v6, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0);

  }
}

- (id)queryObserversInterestingObjectReferences
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  PXSectionedDataSourceManager *v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __73__PXSectionedDataSourceManager_queryObserversInterestingObjectReferences__block_invoke;
  v10 = &unk_2514D0260;
  v11 = self;
  v12 = v3;
  v4 = v3;
  -[PXObservable enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", &v7);
  objc_msgSend(v4, "allObjects", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)createInitialDataSource
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedDataSourceManager.m"), 161, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXSectionedDataSourceManager createInitialDataSource]", v6);

  abort();
}

- (PXSectionedDataSource)dataSourceIfExists
{
  return self->_dataSource;
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", a4, a3);
}

void __73__PXSectionedDataSourceManager_queryObserversInterestingObjectReferences__block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_opt_respondsToSelector();
  v4 = v6;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v6, "sectionedDataSourceManagerInterestingObjectReferences:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v5);

    v4 = v6;
  }

}

void __60__PXSectionedDataSourceManager__reevaluateWaitingConditions__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t (**v5)(_QWORD, _QWORD);
  int v6;

  objc_msgSend(a2, "condition");
  v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6 = v5[2](v5, *(_QWORD *)(a1 + 32));

  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
}

void __75__PXSectionedDataSourceManager_waitForCondition_timeout_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_waitingConditionDidTimeout:", *(_QWORD *)(a1 + 32));

}

@end
