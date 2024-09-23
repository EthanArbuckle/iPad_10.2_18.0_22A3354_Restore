@implementation SBSceneWatchdogProvider

+ (id)defaultSceneWatchdogProvider
{
  if (defaultSceneWatchdogProvider___once != -1)
    dispatch_once(&defaultSceneWatchdogProvider___once, &__block_literal_global_77);
  return (id)defaultSceneWatchdogProvider___instance;
}

- (id)watchdogPolicyForProcess:(id)a3 eventContext:(id)a4
{
  FBSProcessWatchdogPolicy *explicitPolicy;
  FBSProcessWatchdogPolicy *v5;
  FBApplicationProcessWatchdogPolicy *defaultProcessWatchdogProvider;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  explicitPolicy = self->_explicitPolicy;
  if (explicitPolicy)
  {
    v5 = explicitPolicy;
  }
  else
  {
    defaultProcessWatchdogProvider = self->_defaultProcessWatchdogProvider;
    v9 = a4;
    -[FBApplicationProcessWatchdogPolicy watchdogPolicyForProcess:eventContext:](defaultProcessWatchdogProvider, "watchdogPolicyForProcess:eventContext:", a3, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sceneTransitionContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "watchdogScaleFactor");
      v13 = v12;
    }
    else
    {
      v13 = 1.0;
    }
    if (BSFloatIsOne())
    {
      v5 = v10;
    }
    else
    {
      objc_msgSend(v10, "provisions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSceneWatchdogProvider _scaleProvisions:byFactor:](self, "_scaleProvisions:byFactor:", v14, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x1E0D231A0];
      objc_msgSend(v10, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "policyWithName:forProvisions:", v17, v15);
      v5 = (FBSProcessWatchdogPolicy *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v5;
}

- (id)initAsDisabled:(BOOL)a3
{
  _BOOL4 v3;
  SBSceneWatchdogProvider *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  FBSProcessWatchdogPolicy *explicitPolicy;
  uint64_t v10;
  FBApplicationProcessWatchdogPolicy *defaultProcessWatchdogProvider;
  objc_super v13;
  _QWORD v14[2];

  v3 = a3;
  v14[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)SBSceneWatchdogProvider;
  v4 = -[SBSceneWatchdogProvider init](&v13, sel_init);
  if (v4)
  {
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0D23190], "provisionWithResourceType:timeInterval:", 1, 600.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D231A0];
      v14[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "policyWithName:forProvisions:", CFSTR("watchdog \"disabled\"), v7);
      v8 = objc_claimAutoreleasedReturnValue();
      explicitPolicy = v4->_explicitPolicy;
      v4->_explicitPolicy = (FBSProcessWatchdogPolicy *)v8;

    }
    objc_msgSend(MEMORY[0x1E0D228E0], "defaultPolicy");
    v10 = objc_claimAutoreleasedReturnValue();
    defaultProcessWatchdogProvider = v4->_defaultProcessWatchdogProvider;
    v4->_defaultProcessWatchdogProvider = (FBApplicationProcessWatchdogPolicy *)v10;

  }
  return v4;
}

void __55__SBSceneWatchdogProvider_defaultSceneWatchdogProvider__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SBSceneWatchdogProvider initAsDisabled:]([SBSceneWatchdogProvider alloc], "initAsDisabled:", 0);
  v1 = (void *)defaultSceneWatchdogProvider___instance;
  defaultSceneWatchdogProvider___instance = (uint64_t)v0;

}

+ (id)disabledSceneWatchdogProvider
{
  if (disabledSceneWatchdogProvider___once != -1)
    dispatch_once(&disabledSceneWatchdogProvider___once, &__block_literal_global_6_1);
  return (id)disabledSceneWatchdogProvider___instance;
}

void __56__SBSceneWatchdogProvider_disabledSceneWatchdogProvider__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SBSceneWatchdogProvider initAsDisabled:]([SBSceneWatchdogProvider alloc], "initAsDisabled:", 1);
  v1 = (void *)disabledSceneWatchdogProvider___instance;
  disabledSceneWatchdogProvider___instance = (uint64_t)v0;

}

- (id)_scaleProvisions:(id)a3 byFactor:(double)a4
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  id v13;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v11, "isResourceProvision"))
        {
          v20 = 0uLL;
          v21 = 0;
          if (v11)
          {
            objc_msgSend(v11, "allowance");
          }
          else
          {
            v17 = 0;
            v18 = 0;
            v19 = 0;
          }
          FBSProcessResourceAllowanceScale();
          v15 = v20;
          v16 = v21;
          objc_msgSend(MEMORY[0x1E0D23190], "provisionWithAllowance:", &v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            v13 = v12;
          else
            v13 = v11;
          objc_msgSend(v5, "addObject:", v13);

        }
        else
        {
          objc_msgSend(v5, "addObject:", v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultProcessWatchdogProvider, 0);
  objc_storeStrong((id *)&self->_explicitPolicy, 0);
}

@end
