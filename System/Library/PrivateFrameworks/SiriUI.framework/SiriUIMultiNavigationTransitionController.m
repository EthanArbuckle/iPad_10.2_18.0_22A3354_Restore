@implementation SiriUIMultiNavigationTransitionController

- (SiriUIMultiNavigationTransitionController)initWithPrimaryTransitionController:(id)a3
{
  id v5;
  SiriUIMultiNavigationTransitionController *v6;
  SiriUIMultiNavigationTransitionController *v7;
  NSMutableArray *v8;
  NSMutableArray *mutableAdditionalCoordinationControllers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriUIMultiNavigationTransitionController;
  v6 = -[SiriUIMultiNavigationTransitionController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_primaryTransitionController, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mutableAdditionalCoordinationControllers = v7->_mutableAdditionalCoordinationControllers;
    v7->_mutableAdditionalCoordinationControllers = v8;

  }
  return v7;
}

- (NSArray)additionalCoordinationControllers
{
  void *v2;
  void *v3;

  -[SiriUIMultiNavigationTransitionController _mutableAdditionalCoordinationControllers](self, "_mutableAdditionalCoordinationControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)addAdditionalCoordinationController:(id)a3
{
  void *v4;
  int64_t v5;
  id v6;

  v6 = a3;
  -[NSMutableArray addObject:](self->_mutableAdditionalCoordinationControllers, "addObject:");
  -[SiriUIMultiNavigationTransitionController _navigationController](self, "_navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v6, "configureWithNavigationController:", v4);
  v5 = -[SiriUIMultiNavigationTransitionController operation](self, "operation");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setOperation:", v5);

}

- (void)setOperation:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_operation != a3)
  {
    self->_operation = a3;
    -[SiriUIMultiNavigationTransitionController primaryTransitionController](self, "primaryTransitionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "setOperation:", a3);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[SiriUIMultiNavigationTransitionController additionalCoordinationControllers](self, "additionalCoordinationControllers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "setOperation:", a3);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)configureWithNavigationController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SiriUIMultiNavigationTransitionController primaryTransitionController](self, "primaryTransitionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "configureWithNavigationController:", v4);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SiriUIMultiNavigationTransitionController additionalCoordinationControllers](self, "additionalCoordinationControllers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "configureWithNavigationController:", v4);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[SiriUIMultiNavigationTransitionController _setNavigationController:](self, "_setNavigationController:", v4);
}

- (UIViewControllerAnimatedTransitioning)animationController
{
  void *v2;
  void *v3;

  -[SiriUIMultiNavigationTransitionController primaryTransitionController](self, "primaryTransitionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "animationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (UIViewControllerAnimatedTransitioning *)v3;
}

- (id)interactionControllerForAnimationController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SiriUIMultiNavigationTransitionController primaryTransitionController](self, "primaryTransitionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "interactionControllerForAnimationController:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)coordinateAdditionalTransitionsWithTransitionCoordinator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SiriUIMultiNavigationTransitionController primaryTransitionController](self, "primaryTransitionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "coordinateAdditionalTransitionsWithTransitionCoordinator:", v4);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SiriUIMultiNavigationTransitionController additionalCoordinationControllers](self, "additionalCoordinationControllers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "coordinateAdditionalTransitionsWithTransitionCoordinator:", v4);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (int64_t)operation
{
  return self->_operation;
}

- (SiriUINavigationTransitioning)primaryTransitionController
{
  return self->_primaryTransitionController;
}

- (NSMutableArray)_mutableAdditionalCoordinationControllers
{
  return self->_mutableAdditionalCoordinationControllers;
}

- (void)setMutableAdditionalCoordinationControllers:(id)a3
{
  objc_storeStrong((id *)&self->_mutableAdditionalCoordinationControllers, a3);
}

- (UINavigationController)_navigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void)_setNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_navigationController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationController);
  objc_storeStrong((id *)&self->_mutableAdditionalCoordinationControllers, 0);
  objc_storeStrong((id *)&self->_primaryTransitionController, 0);
}

@end
