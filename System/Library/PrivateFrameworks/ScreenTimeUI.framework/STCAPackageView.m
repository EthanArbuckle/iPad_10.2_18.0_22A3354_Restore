@implementation STCAPackageView

- (STCAPackageView)initWithFrame:(CGRect)a3
{
  STCAPackageView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STCAPackageView;
  v3 = -[STCAPackageView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[STCAPackageView _stcaPackageViewCommonInit](v3, "_stcaPackageViewCommonInit");
  return v3;
}

- (STCAPackageView)initWithCoder:(id)a3
{
  STCAPackageView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STCAPackageView;
  v3 = -[STCAPackageView initWithCoder:](&v5, sel_initWithCoder_, a3);
  -[STCAPackageView _stcaPackageViewCommonInit](v3, "_stcaPackageViewCommonInit");
  return v3;
}

- (void)_stcaPackageViewCommonInit
{
  NSMutableArray *v3;
  NSMutableArray *completionHandlers;
  void *v5;
  CAStateController *v6;
  CAStateController *stateController;

  v3 = (NSMutableArray *)objc_opt_new();
  completionHandlers = self->_completionHandlers;
  self->_completionHandlers = v3;

  -[STCAPackageView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STCAPackageView _newStateControllerWithSuperlayer:](self, "_newStateControllerWithSuperlayer:", v5);
  stateController = self->_stateController;
  self->_stateController = v6;

  -[STCAPackageView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
}

- (id)_newStateControllerWithSuperlayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[STCAPackageView makeCAPackage](self, "makeCAPackage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSublayer:", v6);
  objc_msgSend(v4, "setGeometryFlipped:", objc_msgSend(v5, "isGeometryFlipped"));

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE5788]), "initWithLayer:", v6);
  objc_msgSend(v7, "setDelegate:", self);

  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)STCAPackageView;
  -[STCAPackageView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  if (!v4
    || (v5 = objc_msgSend(v4, "userInterfaceStyle"),
        -[STCAPackageView traitCollection](self, "traitCollection"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "userInterfaceStyle"),
        v6,
        v5 != v7))
  {
    -[STCAPackageView _changeAppearance](self, "_changeAppearance");
  }

}

- (void)_changeAppearance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[STCAPackageView packageRootLayer](self, "packageRootLayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[STCAPackageView stateController](self, "stateController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stateOfLayer:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeFromSuperlayer");
  -[STCAPackageView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[STCAPackageView _newStateControllerWithSuperlayer:](self, "_newStateControllerWithSuperlayer:", v6);
  -[STCAPackageView setStateController:](self, "setStateController:", v7);

  if (v5)
    -[STCAPackageView setStateName:](self, "setStateName:", v5);

}

+ (id)keyPathsForValuesAffectingPackageRootLayer
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("stateController.layer"));
}

- (CALayer)packageRootLayer
{
  void *v2;
  void *v3;

  -[STCAPackageView stateController](self, "stateController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALayer *)v3;
}

- (BOOL)isInitialState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;

  -[STCAPackageView packageRootLayer](self, "packageRootLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCAPackageView stateController](self, "stateController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stateOfLayer:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "states");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", &__block_literal_global_6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v5 == v8)
    v9 = 1;
  else
    v9 = objc_msgSend(v5, "isEqual:", v8);

  return v9;
}

uint64_t __33__STCAPackageView_isInitialState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInitial");
}

- (void)setInitialState
{
  void *v3;
  id v4;

  -[STCAPackageView stateController](self, "stateController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STCAPackageView packageRootLayer](self, "packageRootLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInitialStatesOfLayer:", v3);

}

- (void)animateToInitialStateWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  int v12;
  STCAPackageView *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  if (-[STCAPackageView isInitialState](self, "isInitialState"))
  {
    objc_msgSend(MEMORY[0x24BE845E0], "coreAnimation");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[STCAPackageView animateToInitialStateWithCompletionHandler:].cold.1((uint64_t)self, v5);

    v4[2](v4);
  }
  else
  {
    -[STCAPackageView completionHandlers](self, "completionHandlers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x2199A6950](v4);

    objc_msgSend(v6, "addObject:", v7);
    objc_msgSend(MEMORY[0x24BE845E0], "coreAnimation");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[STCAPackageView stateName](self, "stateName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_212E1A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ starting transition(s) from state %{public}@ to initial state", (uint8_t *)&v12, 0x16u);

    }
    -[STCAPackageView stateController](self, "stateController");
    v4 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    -[STCAPackageView packageRootLayer](self, "packageRootLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 1.0;
    objc_msgSend(v4, "setInitialStatesOfLayer:transitionSpeed:", v10, v11);

  }
}

- (NSString)stateName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[STCAPackageView stateController](self, "stateController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCAPackageView packageRootLayer](self, "packageRootLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stateOfLayer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setStateName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[STCAPackageView stateController](self, "stateController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[STCAPackageView _getStateWithName:](self, "_getStateWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[STCAPackageView packageRootLayer](self, "packageRootLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setState:ofLayer:", v5, v6);

}

- (void)animateToStateName:(id)a3 completionHandler:(id)a4
{
  STCAPackageView *v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  double v19;
  int v20;
  STCAPackageView *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  STCAPackageView *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = (STCAPackageView *)a3;
  v7 = (void (**)(_QWORD))a4;
  -[STCAPackageView stateController](self, "stateController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCAPackageView packageRootLayer](self, "packageRootLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stateOfLayer:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCAPackageView _getStateWithName:](self, "_getStateWithName:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v11 || (objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE845E0], "coreAnimation");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138543618;
      v21 = v6;
      v22 = 2114;
      v23 = (id)objc_opt_class();
      v13 = v23;
      _os_log_impl(&dword_212E1A000, v12, OS_LOG_TYPE_DEFAULT, "Trying to animate to %{public}@ of %{public}@ when already there", (uint8_t *)&v20, 0x16u);

    }
    if (v7)
      v7[2](v7);
  }
  else
  {
    if (v7)
    {
      -[STCAPackageView completionHandlers](self, "completionHandlers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x2199A6950](v7);
      objc_msgSend(v14, "addObject:", v15);

    }
    objc_msgSend(MEMORY[0x24BE845E0], "coreAnimation");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = self;
      v22 = 2114;
      v23 = v17;
      v24 = 2114;
      v25 = v6;
      _os_log_impl(&dword_212E1A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ starting transition(s) from state %{public}@ to state %{public}@", (uint8_t *)&v20, 0x20u);

    }
    -[STCAPackageView packageRootLayer](self, "packageRootLayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = 1.0;
    objc_msgSend(v8, "setState:ofLayer:transitionSpeed:", v11, v18, v19);

  }
}

- (id)_getStateWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  -[STCAPackageView packageRootLayer](self, "packageRootLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stateWithName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BE845E0], "coreAnimation");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[STCAPackageView _getStateWithName:].cold.1((uint64_t)v4, (uint64_t)self, v7);

  }
  return v6;
}

- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  STCAPackageView *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v5 = a5;
  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE845E0], "coreAnimation");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "fromState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "toState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v22 = self;
    v23 = 2114;
    v24 = v9;
    v25 = 2114;
    v26 = v10;
    v27 = 1024;
    v28 = v5;
    _os_log_impl(&dword_212E1A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ stopped transition <fromState=%{public}@ toState=%{public}@> completed:%d", buf, 0x26u);

  }
  -[STCAPackageView completionHandlers](self, "completionHandlers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++) + 16))();
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }
  objc_msgSend(v11, "removeAllObjects");

}

- (CAStateController)stateController
{
  return (CAStateController *)objc_getProperty(self, a2, 416, 1);
}

- (void)setStateController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (NSMutableArray)completionHandlers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 424, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
}

- (void)animateToInitialStateWithCompletionHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 138543362;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_fault_impl(&dword_212E1A000, a2, OS_LOG_TYPE_FAULT, "Trying to animate to the initial state of %{public}@ when already there", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_10_0();
}

- (void)_getStateWithName:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = 138543618;
  v6 = a1;
  v7 = 2114;
  v8 = (id)objc_opt_class();
  v4 = v8;
  _os_log_fault_impl(&dword_212E1A000, a3, OS_LOG_TYPE_FAULT, "Invalid state name %{public}@ for %{public}@", (uint8_t *)&v5, 0x16u);

  OUTLINED_FUNCTION_10_0();
}

@end
