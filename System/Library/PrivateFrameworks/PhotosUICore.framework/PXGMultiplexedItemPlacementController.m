@implementation PXGMultiplexedItemPlacementController

- (PXGMultiplexedItemPlacementController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGItemPlacementController.m"), 80, CFSTR("%s is not available as initializer"), "-[PXGMultiplexedItemPlacementController init]");

  abort();
}

- (PXGMultiplexedItemPlacementController)initWithItemPlacementControllers:(id)a3
{
  id v4;
  PXGMultiplexedItemPlacementController *v5;
  uint64_t v6;
  NSArray *itemPlacementControllers;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id *p_mainItemPlacementController;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v17;
  uint8_t buf[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PXGMultiplexedItemPlacementController;
  v5 = -[PXGMultiplexedItemPlacementController init](&v23, sel_init);
  if (v5)
  {
    v17 = v4;
    v6 = objc_msgSend(v4, "copy");
    itemPlacementControllers = v5->_itemPlacementControllers;
    v5->_itemPlacementControllers = (NSArray *)v6;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v5->_itemPlacementControllers;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      p_mainItemPlacementController = (id *)&v5->_mainItemPlacementController;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
          if ((objc_opt_respondsToSelector() & 1) == 0
            || (objc_msgSend(v14, "isIndirectItemPlacementController") & 1) == 0)
          {
            if (*p_mainItemPlacementController)
            {
              PXAssertGetLog();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "multiple main item placement controllers", buf, 2u);
              }

            }
            objc_storeStrong(p_mainItemPlacementController, v14);
          }
          ++v13;
        }
        while (v10 != v13);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v10);
    }

    v4 = v17;
    v5->_isIndirectItemPlacementController = v5->_mainItemPlacementController != 0;
  }

  return v5;
}

- (id)placementInContext:(id)a3 forItemReference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PXGMultiplexedItemPlacementController mainItemPlacementController](self, "mainItemPlacementController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "placementInContext:forItemReference:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setPlacementOverride:(id)a3 forItemReference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PXGMultiplexedItemPlacementController itemPlacementControllers](self, "itemPlacementControllers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setPlacementOverride:forItemReference:", v6, v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (BOOL)isIndirectItemPlacementController
{
  return self->_isIndirectItemPlacementController;
}

- (NSArray)itemPlacementControllers
{
  return self->_itemPlacementControllers;
}

- (PXGItemPlacementController)mainItemPlacementController
{
  return self->_mainItemPlacementController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainItemPlacementController, 0);
  objc_storeStrong((id *)&self->_itemPlacementControllers, 0);
}

+ (id)itemPlacementControllerForItemPlacementControllers:(id)a3
{
  id v3;
  PXGMultiplexedItemPlacementController *v4;
  PXGMultiplexedItemPlacementController *v5;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (PXGMultiplexedItemPlacementController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = -[PXGMultiplexedItemPlacementController initWithItemPlacementControllers:]([PXGMultiplexedItemPlacementController alloc], "initWithItemPlacementControllers:", v3);
  }
  v5 = v4;

  return v5;
}

@end
