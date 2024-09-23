@implementation VUIDebugMetricsEventControllerGenerator

- (VUIDebugMetricsEventControllerGenerator)initWithMetrics:(id)a3
{
  id v4;
  VUIDebugMetricsEventControllerGenerator *v5;
  VUIDebugMetricsTermCollector *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  VUIDebugMetricsEvent *v15;
  VUIDebugMetricsEvent *v16;
  VUIDebugMetricsEventListViewController *v17;
  UIViewController *viewController;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)VUIDebugMetricsEventControllerGenerator;
  v5 = -[VUIDebugMetricsEventControllerGenerator init](&v24, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(VUIDebugMetricsTermCollector);
    v7 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v7, "sortUsingComparator:", &__block_literal_global_157);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
          v15 = [VUIDebugMetricsEvent alloc];
          v16 = -[VUIDebugMetricsEvent initWithEventDictionary:termCollater:](v15, "initWithEventDictionary:termCollater:", v14, v6, (_QWORD)v20);
          objc_msgSend(v8, "addObject:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v11);
    }

    v17 = -[VUIDebugMetricsEventListViewController initWithEvents:]([VUIDebugMetricsEventListViewController alloc], "initWithEvents:", v8);
    viewController = v5->_viewController;
    v5->_viewController = &v17->super.super;

  }
  return v5;
}

uint64_t __59__VUIDebugMetricsEventControllerGenerator_initWithMetrics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(a2, "valueForKey:", CFSTR("eventTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v4, "valueForKey:", CFSTR("eventTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  v12 = objc_msgSend(v11, "compare:", v8);
  return v12;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
