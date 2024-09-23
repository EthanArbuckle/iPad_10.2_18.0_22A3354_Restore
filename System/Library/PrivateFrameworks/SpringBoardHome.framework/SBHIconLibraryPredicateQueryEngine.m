@implementation SBHIconLibraryPredicateQueryEngine

- (void)executeQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id location;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  -[SBHIconLibraryAbstractQueryEngine iconModel](self, "iconModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leafIcons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__SBHIconLibraryPredicateQueryEngine_executeQuery___block_invoke;
  v18[3] = &unk_1E8D86720;
  v8 = v5;
  v19 = v8;
  objc_msgSend(v6, "bs_filter:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[SBHIconLibraryAbstractQueryEngine processingQueue](self, "processingQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __51__SBHIconLibraryPredicateQueryEngine_executeQuery___block_invoke_2;
  v13[3] = &unk_1E8D86748;
  objc_copyWeak(&v16, &location);
  v13[4] = self;
  v14 = v4;
  v15 = v9;
  v11 = v9;
  v12 = v4;
  dispatch_async(v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

uint64_t __51__SBHIconLibraryPredicateQueryEngine_executeQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t IsLeafIconAndNotWidgetIcon;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isIconVisible:", v3))
    IsLeafIconAndNotWidgetIcon = _SBIconIsLeafIconAndNotWidgetIcon(v3);
  else
    IsLeafIconAndNotWidgetIcon = 0;

  return IsLeafIconAndNotWidgetIcon;
}

void __51__SBHIconLibraryPredicateQueryEngine_executeQuery___block_invoke_2(id *a1)
{
  id *WeakRetained;
  id *v3;
  char v4;
  id v5;
  void *v6;
  SBHIconLibraryQueryContext *v7;
  void *v8;
  void *v9;
  id *v10;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "_processingQueue_isIconModelReloading");
    v3 = v10;
    if ((v4 & 1) == 0)
    {
      v5 = objc_loadWeakRetained(v10 + 8);
      if (v5)
      {
        v6 = v5;
        objc_msgSend(a1[4], "_processingQueue_teardownQueryContext:", v5);

      }
      v7 = -[SBHIconLibraryQueryContext initWithQuery:]([SBHIconLibraryQueryContext alloc], "initWithQuery:", a1[5]);
      objc_storeWeak(v10 + 8, v7);
      objc_msgSend(v10, "_processingQueue_startNewQueryContext:", v7);
      objc_msgSend(a1[5], "predicate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "filteredSetUsingPredicate:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "_processingQueue_addIcons:iconLibraryQueryContext:notifyDelegate:", v9, v7, 1);

      v3 = v10;
    }
  }

}

- (void)_processingQueue_teardownQueryContext:(id)a3
{
  id v4;
  id WeakRetained;
  objc_super v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentlyRunningQueryContext);

  if (WeakRetained == v4)
    objc_storeWeak((id *)&self->_currentlyRunningQueryContext, 0);
  v6.receiver = self;
  v6.super_class = (Class)SBHIconLibraryPredicateQueryEngine;
  -[SBHIconLibraryAbstractQueryEngine _processingQueue_teardownQueryContext:](&v6, sel__processingQueue_teardownQueryContext_, v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentlyRunningQueryContext);
}

@end
