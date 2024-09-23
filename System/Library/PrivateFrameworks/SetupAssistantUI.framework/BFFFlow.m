@implementation BFFFlow

- (BFFFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BFFFlow *v14;
  BFFFlow *v15;
  NSMutableArray *v16;
  NSMutableArray *controllers;
  uint64_t v18;
  id injector;
  id WeakRetained;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BFFFlow;
  v14 = -[BFFFlow init](&v22, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_navigationController, v10);
    objc_storeWeak((id *)&v15->_navigationFlowDelegate, v11);
    objc_storeWeak((id *)&v15->_starter, v12);
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    controllers = v15->_controllers;
    v15->_controllers = v16;

    v18 = objc_msgSend(v13, "copy");
    injector = v15->_injector;
    v15->_injector = (id)v18;

    WeakRetained = objc_loadWeakRetained((id *)&v15->_navigationController);
    objc_msgSend(WeakRetained, "addDelegateObserver:", v15);

  }
  return v15;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  objc_msgSend(WeakRetained, "removeDelegateObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BFFFlow;
  -[BFFFlow dealloc](&v4, sel_dealloc);
}

- (void)startFlowAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  -[BFFFlow precedingItems](self, "precedingItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[BFFFlow pushFlowItem:inFlow:withExtendedInitialization:animated:](self, "pushFlowItem:inFlow:withExtendedInitialization:animated:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), self, 0, 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  -[BFFFlow firstItem](self, "firstItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFFlow pushFlowItem:inFlow:animated:](self, "pushFlowItem:inFlow:animated:", v10, self, v3);

}

- (void)startFlowWithAllFlowItems
{
  NSMutableArray *controllers;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  controllers = self->_controllers;
  -[BFFFlow precedingItems](self, "precedingItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](controllers, "addObjectsFromArray:", v4);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BFFFlow classList](self, "classList", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        -[BFFFlow precedingItemsClasses](self, "precedingItemsClasses");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v10);

        if ((v12 & 1) == 0)
        {
          -[BFFFlow createConditionalFlowItemForClass:](self, "createConditionalFlowItemForClass:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            -[BFFFlow firstController](self, "firstController");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v14)
              -[BFFFlow setFirstController:](self, "setFirstController:", v13);
            -[NSMutableArray addObject:](self->_controllers, "addObject:", v13);
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (id)precedingItems
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  BFFFlow *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[BFFFlow precedingItemsClasses](self, "precedingItemsClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v19;
    *(_QWORD *)&v7 = 138412546;
    v17 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
        -[BFFFlow starter](self, "starter", v17, (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "controllerNeedsToRunForClass:", v11);

        if ((v13 & 1) == 0)
        {
          _BYLoggingFacility();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v17;
            v23 = v11;
            v24 = 2112;
            v25 = self;
            _os_log_fault_impl(&dword_214875000, v14, OS_LOG_TYPE_FAULT, "Preceding flow item \"%@\" for flow %@ does not need to run. This is invalid.", buf, 0x16u);
          }

        }
        -[BFFFlow createFlowItem:](self, "createFlowItem:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v15);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v8);
  }

  return v4;
}

- (id)precedingItemsClasses
{
  return 0;
}

- (id)firstItem
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[BFFFlow firstController](self, "firstController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

    goto LABEL_5;
  }
  v5 = (void *)v4;
  -[BFFFlow firstController](self, "firstController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFFlow firstController](self, "firstController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if ((v10 & 1) == 0)
LABEL_5:
    -[BFFFlow setFirstController:](self, "setFirstController:", 0);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[BFFFlow classList](self, "classList", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[BFFFlow precedingItemsClasses](self, "precedingItemsClasses");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "containsObject:", v16);

        if ((v18 & 1) == 0)
        {
          -[BFFFlow createConditionalFlowItemForClass:](self, "createConditionalFlowItemForClass:", v16);
          v19 = objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = (void *)v19;
            -[BFFFlow setFirstController:](self, "setFirstController:", v19);

            goto LABEL_17;
          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_17:

  -[BFFFlow firstController](self, "firstController");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)controllerFollowingControllerClass:(Class)a3 requestedNext:(Class)a4
{
  void *v7;
  int v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;

  if (!a4
    || (-[BFFFlow starter](self, "starter"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "controllerNeedsToRunForClass:", a4),
        v7,
        !v8)
    || (-[BFFFlow createConditionalFlowItemForClass:](self, "createConditionalFlowItemForClass:", a4),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[BFFFlow classList](self, "classList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "indexOfObject:", a3);

    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      while (1)
      {
        ++v11;
        -[BFFFlow classList](self, "classList");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v11 >= v14)
          break;
        -[BFFFlow classList](self, "classList");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", v11);

        -[BFFFlow createConditionalFlowItemForClass:](self, "createConditionalFlowItemForClass:", v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          return v9;
      }
    }
    v9 = 0;
  }
  return v9;
}

- (id)createConditionalFlowItemForClass:(Class)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;

  -[BFFFlow starter](self, "starter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "controllerNeedsToRunForClass:", a3);

  if (!v6)
  {
LABEL_6:
    v7 = 0;
    return v7;
  }
  -[BFFFlow createFlowItem:](self, "createFlowItem:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFFlow starter](self, "starter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "controllerNeedsToRunForFlowItem:", v7);

  if ((v9 & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "controllerWillNotRun");

    goto LABEL_6;
  }
  return v7;
}

- (id)createFlowItem:(Class)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    v5 = [a3 alloc];
    -[BFFFlow navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFFlow navigationFlowDelegate](self, "navigationFlowDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFFlow starter](self, "starter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFFlow injector](self, "injector");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v5, "initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:", v6, v7, v8, v9);

  }
  else
  {
    v10 = objc_alloc_init(a3);
  }
  -[BFFFlow configureFlowItem:](self, "configureFlowItem:", v10);
  return v10;
}

- (void)configureFlowItem:(id)a3
{
  uint64_t (**v4)(_QWORD, _QWORD);
  id v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  -[BFFFlow injector](self, "injector");
  v4 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v5 = (id)((uint64_t (**)(_QWORD, id))v4)[2](v4, v11);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_5;
  -[BFFFlow precedingItemsClasses](self, "precedingItemsClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", objc_opt_class());

  -[BFFFlow classList](self, "classList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", objc_opt_class());

  if (!v7 || (v9 & 1) != 0)
  {
LABEL_5:
    objc_msgSend(v11, "setDelegate:", self);
  }
  else
  {
    -[BFFFlow flowItemDelegate](self, "flowItemDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", v10);

  }
}

- (id)viewControllers
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BFFFlow controllers](self, "controllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[BFFFlow _viewControllerForBuddyController:](self, "_viewControllerForBuddyController:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

+ (id)allowedFlowItems
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "array");
}

- (id)_viewControllerForBuddyController:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "viewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = v3;
  }
  v5 = v4;
LABEL_7:

  return v5;
}

- (void)presentWiFiPaneForFlow:(id)a3
{
  id v4;

  -[BFFFlow delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentWiFiPaneForFlow:", self);

}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend((id)objc_opt_class(), "allowedFlowItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "applicableDispositions");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)responsibleForViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BFFFlow controllers](self, "controllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend(v10, "responsibleForViewController:", v4) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[BFFFlow viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "containsObject:", v4);
LABEL_12:

  return v11;
}

- (void)flowItemDone:(id)a3 nextItem:(id)a4
{
  id v6;
  void *v7;
  BFFFlow *v8;

  v8 = (BFFFlow *)a3;
  v6 = a4;
  if (self != v8)
    -[BFFFlow markFlowItemDone:](self, "markFlowItemDone:", v8);
  if (v6)
  {
    -[BFFFlow configureFlowItem:](self, "configureFlowItem:", v6);
    -[BFFFlow pushFlowItem:inFlow:animated:](self, "pushFlowItem:inFlow:animated:", v6, self, 1);
  }
  else
  {
    -[BFFFlow delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "flow:finishedWithLastItem:nextItem:", self, v8, 0);

  }
}

- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[BFFFlow controllerFollowingControllerClass:requestedNext:](self, "controllerFollowingControllerClass:requestedNext:", objc_opt_class(), a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[BFFFlow flowItemDone:nextItem:](self, "flowItemDone:nextItem:", v6, v7);

}

- (void)flowItemDone:(id)a3
{
  -[BFFFlow flowItemDone:nextItemClass:](self, "flowItemDone:nextItemClass:", a3, 0);
}

- (void)flowItemCancelled:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BFFFlow flowItemDelegate](self, "flowItemDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flowItemCancelled:", v4);

}

- (BOOL)controllerNeedsToRunForClass:(Class)a3
{
  void *v4;

  -[BFFFlow navigationFlowDelegate](self, "navigationFlowDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "controllerNeedsToRunForClass:", a3);

  return (char)a3;
}

- (void)markFlowItemDone:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BFFFlow navigationFlowDelegate](self, "navigationFlowDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markFlowItemDone:", v4);

}

- (BOOL)isFlowItemOnTop:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[BFFFlow navigationFlowDelegate](self, "navigationFlowDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFlowItemOnTop:", v4);

  return v6;
}

- (id)popToBuddyControllerWithClass:(Class)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  -[BFFFlow navigationFlowDelegate](self, "navigationFlowDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "popToBuddyControllerWithClass:animated:", a3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)popToBuddyControllerWithClass:(Class)a3 withOffset:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;

  v5 = a5;
  -[BFFFlow navigationFlowDelegate](self, "navigationFlowDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "popToBuddyControllerWithClass:withOffset:animated:", a3, a4, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)pushFlowItem:(id)a3 animated:(BOOL)a4
{
  -[BFFFlow pushFlowItem:inFlow:animated:](self, "pushFlowItem:inFlow:animated:", a3, 0, a4);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 animated:(BOOL)a5
{
  -[BFFFlow pushFlowItem:inFlow:withExtendedInitialization:animated:](self, "pushFlowItem:inFlow:withExtendedInitialization:animated:", a3, a4, 1, a5);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  BFFFlow *v16;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  -[BFFFlow navigationFlowDelegate](self, "navigationFlowDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __67__BFFFlow_pushFlowItem_inFlow_withExtendedInitialization_animated___block_invoke;
  v14[3] = &unk_24D2346A8;
  v15 = v10;
  v16 = self;
  v13 = v10;
  objc_msgSend(v12, "pushFlowItem:inFlow:withExtendedInitialization:animated:willPushFlowItem:", v13, v11, v7, v6, v14);

}

uint64_t __67__BFFFlow_pushFlowItem_inFlow_withExtendedInitialization_animated___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    if (*(_QWORD *)(result + 32))
      return objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 56), "addObject:");
  }
  return result;
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6 willPushFlowItem:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  BFFFlow *v20;
  id v21;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a7;
  v14 = a4;
  -[BFFFlow navigationFlowDelegate](self, "navigationFlowDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __84__BFFFlow_pushFlowItem_inFlow_withExtendedInitialization_animated_willPushFlowItem___block_invoke;
  v18[3] = &unk_24D234760;
  v19 = v12;
  v20 = self;
  v21 = v13;
  v16 = v13;
  v17 = v12;
  objc_msgSend(v15, "pushFlowItem:inFlow:withExtendedInitialization:animated:willPushFlowItem:", v17, v14, v9, v8, v18);

}

uint64_t __84__BFFFlow_pushFlowItem_inFlow_withExtendedInitialization_animated_willPushFlowItem___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t result;

  if ((_DWORD)a2 && a1[4])
    objc_msgSend(*(id *)(a1[5] + 56), "addObject:");
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)removeViewControllersOnNextPush:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BFFFlow navigationFlowDelegate](self, "navigationFlowDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeViewControllersOnNextPush:", v4);

}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  -[BFFFlow controllers](self, "controllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = v7 - 1;

  if (((v7 - 1) & 0x8000000000000000) == 0)
  {
    v9 = 0;
    while (1)
    {
      -[BFFFlow controllers](self, "controllers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[BFFFlow _viewControllerForBuddyController:](self, "_viewControllerForBuddyController:", v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12 == v15)
        break;
      if (v7 == ++v9)
        goto LABEL_11;
    }
    if (v9 != 0x7FFFFFFFFFFFFFFFLL && v8 > v9)
    {
      do
      {
        -[BFFFlow controllers](self, "controllers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "controllerWasPopped");
        -[NSMutableArray removeLastObject](self->_controllers, "removeLastObject");

        --v8;
      }
      while (v8 > v9);
    }
  }
LABEL_11:

}

- (BFFNavigationController)navigationController
{
  return (BFFNavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (BFFNavigationFlowDelegate)navigationFlowDelegate
{
  return (BFFNavigationFlowDelegate *)objc_loadWeakRetained((id *)&self->_navigationFlowDelegate);
}

- (BFFFlowItemDelegate)flowItemDelegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_flowItemDelegate);
}

- (void)setFlowItemDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowItemDelegate, a3);
}

- (BFFFlowDelegate)delegate
{
  return (BFFFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BFFFlowStarter)starter
{
  return (BFFFlowStarter *)objc_loadWeakRetained((id *)&self->_starter);
}

- (NSArray)classList
{
  return self->_classList;
}

- (void)setClassList:(id)a3
{
  objc_storeStrong((id *)&self->_classList, a3);
}

- (NSMutableArray)controllers
{
  return self->_controllers;
}

- (void)setControllers:(id)a3
{
  objc_storeStrong((id *)&self->_controllers, a3);
}

- (id)injector
{
  return self->_injector;
}

- (BFFFlowItem)firstController
{
  return self->_firstController;
}

- (void)setFirstController:(id)a3
{
  objc_storeStrong((id *)&self->_firstController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstController, 0);
  objc_storeStrong(&self->_injector, 0);
  objc_storeStrong((id *)&self->_controllers, 0);
  objc_storeStrong((id *)&self->_classList, 0);
  objc_destroyWeak((id *)&self->_starter);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_flowItemDelegate);
  objc_destroyWeak((id *)&self->_navigationFlowDelegate);
  objc_destroyWeak((id *)&self->_navigationController);
}

@end
