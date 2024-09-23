@implementation SFCAPackageView

- (SFCAPackageView)initWithFrame:(CGRect)a3
{
  SFCAPackageView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFCAPackageView;
  v3 = -[SFCAPackageView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SFCAPackageView _stcaPackageViewCommonInit](v3, "_stcaPackageViewCommonInit");
  return v3;
}

- (SFCAPackageView)initWithCoder:(id)a3
{
  SFCAPackageView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFCAPackageView;
  v3 = -[SFCAPackageView initWithCoder:](&v5, sel_initWithCoder_, a3);
  -[SFCAPackageView _stcaPackageViewCommonInit](v3, "_stcaPackageViewCommonInit");
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

  -[SFCAPackageView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SFCAPackageView _newStateControllerWithSuperlayer:](self, "_newStateControllerWithSuperlayer:", v5);
  stateController = self->_stateController;
  self->_stateController = v6;

  -[SFCAPackageView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
}

- (id)_newStateControllerWithSuperlayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SFCAPackageView makeCAPackage](self, "makeCAPackage");
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
  v8.super_class = (Class)SFCAPackageView;
  -[SFCAPackageView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  if (!v4
    || (v5 = objc_msgSend(v4, "userInterfaceStyle"),
        -[SFCAPackageView traitCollection](self, "traitCollection"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "userInterfaceStyle"),
        v6,
        v5 != v7))
  {
    -[SFCAPackageView _changeAppearance](self, "_changeAppearance");
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

  -[SFCAPackageView packageRootLayer](self, "packageRootLayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SFCAPackageView stateController](self, "stateController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stateOfLayer:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeFromSuperlayer");
  -[SFCAPackageView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SFCAPackageView _newStateControllerWithSuperlayer:](self, "_newStateControllerWithSuperlayer:", v6);
  -[SFCAPackageView setStateController:](self, "setStateController:", v7);

  if (v5)
    -[SFCAPackageView setStateName:](self, "setStateName:", v5);

}

+ (id)keyPathsForValuesAffectingPackageRootLayer
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("stateController.layer"));
}

- (CALayer)packageRootLayer
{
  void *v2;
  void *v3;

  -[SFCAPackageView stateController](self, "stateController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALayer *)v3;
}

- (unint64_t)statesCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[SFCAPackageView packageRootLayer](self, "packageRootLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "states");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
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

  -[SFCAPackageView packageRootLayer](self, "packageRootLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCAPackageView stateController](self, "stateController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stateOfLayer:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "states");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", &__block_literal_global_4);
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

uint64_t __33__SFCAPackageView_isInitialState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInitial");
}

- (void)setInitialState
{
  void *v3;
  id v4;

  -[SFCAPackageView stateController](self, "stateController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SFCAPackageView packageRootLayer](self, "packageRootLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInitialStatesOfLayer:", v3);

}

- (void)animateToInitialStateWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  double v6;
  void *v7;
  float v8;
  dispatch_time_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  _QWORD block[4];
  void (**v18)(_QWORD);
  uint8_t buf[4];
  SFCAPackageView *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  if (-[SFCAPackageView statesCount](self, "statesCount"))
  {
    if (-[SFCAPackageView isInitialState](self, "isInitialState"))
    {
      framework_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[SFCAPackageView animateToInitialStateWithCompletionHandler:].cold.1((uint64_t)self, v5);

      v4[2](v4);
    }
    else
    {
      -[SFCAPackageView completionHandlers](self, "completionHandlers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = _Block_copy(v4);
      objc_msgSend(v10, "addObject:", v11);

      framework_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[SFCAPackageView stateName](self, "stateName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = self;
        v21 = 2112;
        v22 = v13;
        _os_log_impl(&dword_212728000, v12, OS_LOG_TYPE_DEFAULT, "%@ starting transition(s) from state %@ to initial state", buf, 0x16u);

      }
      -[SFCAPackageView stateController](self, "stateController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCAPackageView packageRootLayer](self, "packageRootLayer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v16) = 1.0;
      objc_msgSend(v14, "setInitialStatesOfLayer:transitionSpeed:", v15, v16);

    }
  }
  else
  {
    v6 = CACurrentMediaTime();
    -[SFCAPackageView packageRootLayer](self, "packageRootLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBeginTime:", v6);

    -[SFCAPackageView duration](self, "duration");
    v9 = dispatch_time(0, (uint64_t)(float)(v8 * 1000000000.0));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__SFCAPackageView_animateToInitialStateWithCompletionHandler___block_invoke;
    block[3] = &unk_24CE0F3C0;
    v18 = v4;
    dispatch_after(v9, MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __62__SFCAPackageView_animateToInitialStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)stateName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SFCAPackageView stateController](self, "stateController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCAPackageView packageRootLayer](self, "packageRootLayer");
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
  -[SFCAPackageView stateController](self, "stateController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SFCAPackageView _getStateWithName:](self, "_getStateWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFCAPackageView packageRootLayer](self, "packageRootLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setState:ofLayer:", v5, v6);

}

- (void)animateToStateName:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  double v18;
  int v19;
  SFCAPackageView *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[SFCAPackageView stateController](self, "stateController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCAPackageView packageRootLayer](self, "packageRootLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stateOfLayer:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCAPackageView _getStateWithName:](self, "_getStateWithName:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v11 || (objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
  {
    framework_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[SFCAPackageView animateToStateName:completionHandler:].cold.1();

    v7[2](v7);
  }
  else
  {
    -[SFCAPackageView completionHandlers](self, "completionHandlers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = _Block_copy(v7);
    objc_msgSend(v13, "addObject:", v14);

    framework_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412802;
      v20 = self;
      v21 = 2112;
      v22 = v16;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_212728000, v15, OS_LOG_TYPE_DEFAULT, "%@ starting transition(s) from state %@ to state %@", (uint8_t *)&v19, 0x20u);

    }
    -[SFCAPackageView packageRootLayer](self, "packageRootLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = 1.0;
    objc_msgSend(v8, "setState:ofLayer:transitionSpeed:", v11, v17, v18);

  }
}

- (id)_getStateWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  -[SFCAPackageView packageRootLayer](self, "packageRootLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stateWithName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    framework_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[SFCAPackageView _getStateWithName:].cold.1();

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
  SFCAPackageView *v22;
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
  framework_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "fromState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "toState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v22 = self;
    v23 = 2112;
    v24 = v9;
    v25 = 2112;
    v26 = v10;
    v27 = 1024;
    v28 = v5;
    _os_log_impl(&dword_212728000, v8, OS_LOG_TYPE_DEFAULT, "%@ stopped transition <fromState=%@ toState=%@> completed:%d", buf, 0x26u);

  }
  -[SFCAPackageView completionHandlers](self, "completionHandlers");
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

- (float)duration
{
  return self->_duration;
}

- (CAStateController)stateController
{
  return (CAStateController *)objc_getProperty(self, a2, 424, 1);
}

- (void)setStateController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (NSMutableArray)completionHandlers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 432, 1);
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
  v4 = 138412290;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_fault_impl(&dword_212728000, a2, OS_LOG_TYPE_FAULT, "Trying to animate to the initial state of %@ when already there", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_1();
}

- (void)animateToStateName:completionHandler:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_0_1(v0);
  OUTLINED_FUNCTION_2(&dword_212728000, v2, v3, "Trying to animate to %@ of %@ when already there", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_getStateWithName:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_0_1(v0);
  OUTLINED_FUNCTION_2(&dword_212728000, v2, v3, "Invalid state name %@ for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
