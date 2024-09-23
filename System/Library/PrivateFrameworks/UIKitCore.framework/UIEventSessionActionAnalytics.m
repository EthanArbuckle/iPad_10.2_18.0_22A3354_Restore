@implementation UIEventSessionActionAnalytics

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__UIEventSessionActionAnalytics_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7FEE8 != -1)
    dispatch_once(&qword_1ECD7FEE8, block);
  return (id)_MergedGlobals_1199;
}

void __47__UIEventSessionActionAnalytics_sharedInstance__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  unint64_t v10;
  __int16 v11;
  __int16 v12;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v4 = objc_alloc_init(*(Class *)(a1 + 32));
    v5 = (void *)_MergedGlobals_1199;
    _MergedGlobals_1199 = (uint64_t)v4;

    if (os_variant_has_internal_diagnostics())
    {
      v6 = qword_1ECD7FEF0;
      if (!qword_1ECD7FEF0)
      {
        v6 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v6, (unint64_t *)&qword_1ECD7FEF0);
      }
      if ((*(_BYTE *)v6 & 1) != 0)
      {
        v7 = *(NSObject **)(v6 + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v12 = 0;
          v8 = "Created shared instance on iPad";
          v9 = (uint8_t *)&v12;
LABEL_15:
          _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, v8, v9, 2u);
        }
      }
    }
  }
  else if (os_variant_has_internal_diagnostics())
  {
    v10 = qword_1ECD7FEF8;
    if (!qword_1ECD7FEF8)
    {
      v10 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&qword_1ECD7FEF8);
    }
    if ((*(_BYTE *)v10 & 1) != 0)
    {
      v7 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v11 = 0;
        v8 = "Disabled on non-iPad device";
        v9 = (uint8_t *)&v11;
        goto LABEL_15;
      }
    }
  }
}

- (UIEventSessionActionAnalytics)init
{
  UIEventSessionActionAnalytics *v2;
  UIEventSessionActionAnalytics *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSMutableSet *accumulators;
  UIEventSessionTouchEventAnalyzer *v9;
  UIEventSessionTouchEventAnalyzer *touchAnalyzer;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *bundleID;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UIEventSessionActionAnalytics;
  v2 = -[UIEventSessionActionAnalytics init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_maxDepth = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.UIKit.UIEventSessionActionAnalytics", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 100);
    accumulators = v3->_accumulators;
    v3->_accumulators = (NSMutableSet *)v7;

    v9 = objc_alloc_init(UIEventSessionTouchEventAnalyzer);
    touchAnalyzer = v3->touchAnalyzer;
    v3->touchAnalyzer = v9;

    -[UIEventSessionActionAnalytics resetSessionID](v3, "resetSessionID");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v3, sel_writeAnalytics, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
    objc_msgSend(v11, "addObserver:selector:name:object:", v3, sel_writeAnalytics, 0x1E1784B20, 0);
    objc_msgSend(v11, "addObserver:selector:name:object:", v3, sel_writeAnalytics, 0x1E1784A40, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v3, sel_didHardwareConfigurationChange_, CFSTR("_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification"), 0);

    if ((_UIIsPrivateMainBundle() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bundleIdentifier");
      v14 = objc_claimAutoreleasedReturnValue();
      bundleID = v3->_bundleID;
      v3->_bundleID = (NSString *)v14;

    }
    else
    {
      v13 = v3->_bundleID;
      v3->_bundleID = (NSString *)CFSTR("other");
    }

    -[UIEventSessionActionAnalytics q_setupDefaultAnalytics](v3, "q_setupDefaultAnalytics");
    -[UIEventSessionActionAnalytics q_updateHardwareState](v3, "q_updateHardwareState");
    -[UIEventSessionActionAnalytics q_updateUIInterfaceOrientation](v3, "q_updateUIInterfaceOrientation");

  }
  return v3;
}

- (void)resetSessionID
{
  NSNumber *v3;
  NSNumber *sessionID;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", arc4random_uniform(0x5F5E0FFu));
  v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  sessionID = self->_sessionID;
  self->_sessionID = v3;

}

- (void)q_enumerateAnalytics:(id)a3
{
  NSMutableSet *accumulators;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[UIEventSessionActionAnalytics q_flushRecentActions](self, "q_flushRecentActions");
    accumulators = self->_accumulators;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__UIEventSessionActionAnalytics_q_enumerateAnalytics___block_invoke;
    v6[3] = &unk_1E16DF498;
    v7 = v5;
    -[NSMutableSet enumerateObjectsUsingBlock:](accumulators, "enumerateObjectsUsingBlock:", v6);

  }
}

uint64_t __54__UIEventSessionActionAnalytics_q_enumerateAnalytics___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enumerateAnalytics:", *(_QWORD *)(a1 + 32));
}

- (id)allAccumulatorNames
{
  void *v3;
  NSObject *queue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableSet count](self->_accumulators, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__UIEventSessionActionAnalytics_allAccumulatorNames__block_invoke;
  v9[3] = &unk_1E16B1B50;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(queue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void __52__UIEventSessionActionAnalytics_allAccumulatorNames__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
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
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "name", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)q_writeAnalytics
{
  unint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    v3 = q_writeAnalytics___s_category;
    if (!q_writeAnalytics___s_category)
    {
      v3 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&q_writeAnalytics___s_category);
    }
    if ((*(_BYTE *)v3 & 1) != 0)
    {
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "writeAnalytics() called! (Should be when app goes to background)", buf, 2u);
      }
    }
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__UIEventSessionActionAnalytics_q_writeAnalytics__block_invoke;
  v5[3] = &unk_1E16DF4E8;
  v5[4] = self;
  -[UIEventSessionActionAnalytics q_enumerateAnalytics:](self, "q_enumerateAnalytics:", v5);
  -[NSMutableSet enumerateObjectsUsingBlock:](self->_accumulators, "enumerateObjectsUsingBlock:", &__block_literal_global_460);
  -[UIEventSessionActionAnalytics resetSessionID](self, "resetSessionID");
}

void __49__UIEventSessionActionAnalytics_q_writeAnalytics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  unint64_t v7;
  NSObject *v8;
  uint8_t buf[16];

  v4 = a2;
  v5 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    v7 = _UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_2___s_category;
    if (!_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_2___s_category)
    {
      v7 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_2___s_category);
    }
    if ((*(_BYTE *)v7 & 1) != 0)
    {
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "writeAnalytics(): [self enumerateAnalytics]...", buf, 2u);
      }
    }
  }
  v6 = v4;
  AnalyticsSendEventLazy();

}

id __49__UIEventSessionActionAnalytics_q_writeAnalytics__block_invoke_16(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(*(id *)(a1 + 40), "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("bundleId"));

  return v2;
}

uint64_t __49__UIEventSessionActionAnalytics_q_writeAnalytics__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reset");
}

- (void)writeAnalytics
{
  NSObject *queue;
  unint64_t v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    v4 = writeAnalytics___s_category;
    if (!writeAnalytics___s_category)
    {
      v4 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&writeAnalytics___s_category);
    }
    if ((*(_BYTE *)v4 & 1) != 0)
    {
      v5 = *(NSObject **)(v4 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "writeAnalytics() called! (Should be when app goes to background)", buf, 2u);
      }
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__UIEventSessionActionAnalytics_writeAnalytics__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __47__UIEventSessionActionAnalytics_writeAnalytics__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_writeAnalytics");
}

- (void)writeEventWithFields:(id)a3 andName:(id)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  AnalyticsSendEventLazy();

}

id __62__UIEventSessionActionAnalytics_writeEventWithFields_andName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(*(id *)(a1 + 40), "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("bID"));

  if (os_variant_has_internal_diagnostics())
  {
    v5 = _UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_3___s_category;
    if (!_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_3___s_category)
    {
      v5 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_3___s_category);
    }
    if ((*(_BYTE *)v5 & 1) != 0)
    {
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = 138412290;
        v8 = v2;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "writeEventWithFields() wrote %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
  return v2;
}

- (void)addAccumulator:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__UIEventSessionActionAnalytics_addAccumulator___block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __48__UIEventSessionActionAnalytics_addAccumulator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addAccumulator:", *(_QWORD *)(a1 + 40));
}

- (void)q_addAccumulator:(id)a3
{
  unint64_t maxDepth;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;

  maxDepth = self->_maxDepth;
  v8 = a3;
  v5 = objc_msgSend(v8, "depthRange");
  v7 = v5 + v6;
  if (maxDepth > v5 + v6)
    v7 = maxDepth;
  self->_maxDepth = v7;
  -[NSMutableSet addObject:](self->_accumulators, "addObject:", v8);

}

- (void)q_addActionAndUpdate:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  _UIEventSessionAction **p_lastAction;
  int64_t v9;
  unint64_t v10;
  NSObject *v11;
  _UIEventSessionAction *v12;
  int v13;
  int64_t v14;
  __int16 v15;
  _UIEventSessionAction *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (!self->_magicKeyboardState || !self->_hardwareKeyboardState)
      -[UIEventSessionActionAnalytics q_updateHardwareState](self, "q_updateHardwareState");
    -[UIEventSessionActionAnalytics q_updateUIInterfaceOrientation](self, "q_updateUIInterfaceOrientation");
    objc_msgSend(v5, "setSessionID:", self->_sessionID);
    objc_msgSend(v5, "setUiInterfaceOrientation:", self->_uiInterfaceOrientation);
    objc_msgSend(v5, "setHardwareKeyboardState:", self->_hardwareKeyboardState);
    objc_msgSend(v5, "setMagicKeyboardState:", self->_magicKeyboardState);
    -[UIEventSessionActionAnalytics bundleID](self, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.springboard")))
    {
      v7 = objc_msgSend(v5, "source");

      if (v7 == 2)
        goto LABEL_14;
    }
    else
    {

    }
    p_lastAction = &self->_lastAction;
    v9 = -[_UIEventSessionAction mergeActionIfPossible:](self->_lastAction, "mergeActionIfPossible:", v5);
    if (os_variant_has_internal_diagnostics())
    {
      v10 = q_addActionAndUpdate____s_category;
      if (!q_addActionAndUpdate____s_category)
      {
        v10 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&q_addActionAndUpdate____s_category);
      }
      if ((*(_BYTE *)v10 & 1) != 0)
      {
        v11 = *(NSObject **)(v10 + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = *p_lastAction;
          v13 = 134218498;
          v14 = v9;
          v15 = 2112;
          v16 = v12;
          v17 = 2112;
          v18 = v5;
          _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "q_addActionAndUpdate: Merge result %lu lastAction:%@ newAction:%@", (uint8_t *)&v13, 0x20u);
        }
      }
    }
    if (!*p_lastAction)
      goto LABEL_13;
    if (!v9)
    {
      -[UIEventSessionActionAnalytics q_updateAnalyticsFromAccumulators](self, "q_updateAnalyticsFromAccumulators");
LABEL_13:
      objc_storeStrong((id *)&self->_lastAction, a3);
    }
  }
LABEL_14:

}

- (void)q_updateAnalyticsFromAccumulators
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _UIEventSessionAction *lastAction;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_lastAction)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = self->_accumulators;
    v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "increaseWithAction:", self->_lastAction, (_QWORD)v9);
        }
        while (v5 != v7);
        v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    lastAction = self->_lastAction;
    self->_lastAction = 0;

  }
}

- (void)q_flushRecentActions
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[UIEventSessionActionAnalytics q_updateAnalyticsFromAccumulators](self, "q_updateAnalyticsFromAccumulators");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_accumulators;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "flushAccumulator", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)_instanceOfActionClass:(Class)a3 source:(int64_t)a4
{
  id v6;

  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    v6 = objc_alloc_init(a3);
    objc_msgSend(v6, "setSource:", a4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)getAIDState
{
  const __CFArray *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  BOOL v25;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  __IOHIDEventSystemClient *cf;
  const __CFArray *obj;
  void *v33;
  __IOHIDServiceClient *service;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  cf = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v2 = IOHIDEventSystemClientCopyServices(cf);
  v3 = -[__CFArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0x1E0C99000uLL;
    v6 = *(_QWORD *)v40;
    v7 = CFSTR("DeviceUsagePage");
    v8 = CFSTR("DeviceUsage");
    v9 = &unk_1E1A9A0B0;
    obj = v2;
    v27 = *(_QWORD *)v40;
    do
    {
      v10 = 0;
      v28 = v4;
      do
      {
        if (*(_QWORD *)v40 != v6)
          objc_enumerationMutation(obj);
        service = *(__IOHIDServiceClient **)(*((_QWORD *)&v39 + 1) + 8 * v10);
        v11 = (void *)IOHIDServiceClientCopyProperty(service, CFSTR("DeviceUsagePairs"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v30 = v10;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          v29 = v11;
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v36;
            v33 = v12;
            while (2)
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v36 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v17, "objectForKey:", v7);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "objectForKey:", v8);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v18, "isEqual:", v9)
                    && objc_msgSend(v19, "isEqual:", &unk_1E1A9A0C8))
                  {
                    v20 = v5;
                    v21 = v9;
                    v22 = v8;
                    v23 = v7;
                    v24 = (void *)IOHIDServiceClientCopyProperty(service, CFSTR("Transport"));
                    if (objc_msgSend(v24, "isEqualToString:", CFSTR("AID")))
                    {
                      CFRelease(cf);

                      v2 = obj;
                      v25 = 1;
                      goto LABEL_27;
                    }

                    v7 = v23;
                    v8 = v22;
                    v9 = v21;
                    v5 = v20;
                    v12 = v33;
                  }

                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              if (v14)
                continue;
              break;
            }
          }

          v4 = v28;
          v11 = v29;
          v6 = v27;
          v10 = v30;
        }

        ++v10;
      }
      while (v10 != v4);
      v2 = obj;
      v4 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v4);
  }

  if (cf)
    CFRelease(cf);
  v25 = 0;
LABEL_27:

  return v25;
}

- (void)updateAIDState
{
  _BOOL4 v3;
  int64_t v4;
  unint64_t v5;
  NSObject *v6;
  int64_t magicKeyboardState;
  int v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[UIEventSessionActionAnalytics getAIDState](self, "getAIDState");
  v4 = 1;
  if (v3)
    v4 = 2;
  self->_magicKeyboardState = v4;
  if (os_variant_has_internal_diagnostics())
  {
    v5 = updateAIDState___s_category;
    if (!updateAIDState___s_category)
    {
      v5 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&updateAIDState___s_category);
    }
    if ((*(_BYTE *)v5 & 1) != 0)
    {
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        magicKeyboardState = self->_magicKeyboardState;
        v8 = 134217984;
        v9 = magicKeyboardState;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "New magic keyboard state: %lu", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

- (void)updateHardwareKeyboardState
{
  void *v3;
  void *v4;
  int v5;
  int64_t v6;
  unint64_t v7;
  NSObject *v8;
  int64_t hardwareKeyboardState;
  int v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "_isHardwareKeyboardAvailable");
    v6 = 1;
    if (v5)
      v6 = 2;
  }
  else
  {
    v6 = 0;
  }
  self->_hardwareKeyboardState = v6;
  if (os_variant_has_internal_diagnostics())
  {
    v7 = updateHardwareKeyboardState___s_category;
    if (!updateHardwareKeyboardState___s_category)
    {
      v7 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&updateHardwareKeyboardState___s_category);
    }
    if ((*(_BYTE *)v7 & 1) != 0)
    {
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        hardwareKeyboardState = self->_hardwareKeyboardState;
        v10 = 134217984;
        v11 = hardwareKeyboardState;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "New hardware keyboard state: %lu", (uint8_t *)&v10, 0xCu);
      }
    }
  }

}

- (void)updateUIInterfaceOrientation
{
  unint64_t v3;
  NSObject *v4;
  int64_t uiInterfaceOrientation;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  self->_uiInterfaceOrientation = objc_msgSend((id)UIApp, "activeInterfaceOrientation");
  if (os_variant_has_internal_diagnostics())
  {
    v3 = updateUIInterfaceOrientation___s_category;
    if (!updateUIInterfaceOrientation___s_category)
    {
      v3 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&updateUIInterfaceOrientation___s_category);
    }
    if ((*(_BYTE *)v3 & 1) != 0)
    {
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uiInterfaceOrientation = self->_uiInterfaceOrientation;
        v6 = 134217984;
        v7 = uiInterfaceOrientation;
        _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "New interface orientation: %lu", (uint8_t *)&v6, 0xCu);
      }
    }
  }
}

- (void)q_updateHardwareState
{
  int v3;
  int64_t lastMagicKeyboardState;
  BOOL v5;
  int64_t v6;
  int v7;
  unint64_t v8;
  NSObject *v9;
  int64_t v10;
  int64_t magicKeyboardState;
  int64_t lastHardwareKeyboardState;
  int64_t hardwareKeyboardState;
  int v14;
  int64_t v15;
  __int16 v16;
  int64_t v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v3 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    v7 = _UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled)
    {
      while (v3 >= v7)
      {
        _UIInternalPreferenceSync(v3, &_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled, (uint64_t)CFSTR("UIEventSessionActionAnalyticsMagicKeyboardStateEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        v7 = _UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled;
        if (v3 == _UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled)
          goto LABEL_4;
      }
      if (byte_1EDDA8284)
        -[UIEventSessionActionAnalytics updateAIDState](self, "updateAIDState");
    }
  }
LABEL_4:
  -[UIEventSessionActionAnalytics updateHardwareKeyboardState](self, "updateHardwareKeyboardState");
  lastMagicKeyboardState = self->_lastMagicKeyboardState;
  v5 = self->_magicKeyboardState == lastMagicKeyboardState || lastMagicKeyboardState == 0;
  if (!v5 || (v6 = self->_lastHardwareKeyboardState, self->_hardwareKeyboardState != v6) && v6)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v8 = q_updateHardwareState___s_category[0];
      if (!q_updateHardwareState___s_category[0])
      {
        v8 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, q_updateHardwareState___s_category);
      }
      if ((*(_BYTE *)v8 & 1) != 0)
      {
        v9 = *(NSObject **)(v8 + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          magicKeyboardState = self->_magicKeyboardState;
          v10 = self->_lastMagicKeyboardState;
          hardwareKeyboardState = self->_hardwareKeyboardState;
          lastHardwareKeyboardState = self->_lastHardwareKeyboardState;
          v14 = 134218752;
          v15 = v10;
          v16 = 2048;
          v17 = magicKeyboardState;
          v18 = 2048;
          v19 = lastHardwareKeyboardState;
          v20 = 2048;
          v21 = hardwareKeyboardState;
          _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "*** Detected hardware state change (Magic KB %lu->%lu, HW KB %lu->%lu)", (uint8_t *)&v14, 0x2Au);
        }
      }
    }
  }
  self->_lastMagicKeyboardState = self->_magicKeyboardState;
  self->_lastHardwareKeyboardState = self->_hardwareKeyboardState;
}

- (void)q_updateUIInterfaceOrientation
{
  int64_t lastUIInterfaceOrientation;
  BOOL v4;
  int64_t v5;
  unint64_t v6;
  NSObject *v7;
  int64_t v8;
  int64_t uiInterfaceOrientation;
  int v10;
  int64_t v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[UIEventSessionActionAnalytics updateUIInterfaceOrientation](self, "updateUIInterfaceOrientation");
  lastUIInterfaceOrientation = self->_lastUIInterfaceOrientation;
  v4 = self->_uiInterfaceOrientation == lastUIInterfaceOrientation || lastUIInterfaceOrientation == 0;
  if (!v4 && os_variant_has_internal_diagnostics())
  {
    v6 = q_updateUIInterfaceOrientation___s_category;
    if (!q_updateUIInterfaceOrientation___s_category)
    {
      v6 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&q_updateUIInterfaceOrientation___s_category);
    }
    if ((*(_BYTE *)v6 & 1) != 0)
    {
      v7 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uiInterfaceOrientation = self->_uiInterfaceOrientation;
        v8 = self->_lastUIInterfaceOrientation;
        v10 = 134218240;
        v11 = v8;
        v12 = 2048;
        v13 = uiInterfaceOrientation;
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "*** Detected UI interface orientation change (orientation %lu->%lu)", (uint8_t *)&v10, 0x16u);
      }
    }
  }
  v5 = self->_uiInterfaceOrientation;
  if (v5 != self->_lastUIInterfaceOrientation)
    self->_lastUIInterfaceOrientation = v5;
}

- (void)didTouch:(id)a3 withLocationInWindow:(CGPoint)a4 withWindowBounds:(CGRect)a5 withTrackpadFingerDownCount:(int64_t)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v11;
  CGFloat v12;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *queue;
  id v20;
  _QWORD block[5];
  id v22;
  uint64_t v23;
  uint64_t v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  int64_t v31;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4.y;
  v12 = a4.x;
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = a3;
  objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "_touchIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "phase");
  v18 = objc_msgSend(v15, "type");

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108__UIEventSessionActionAnalytics_didTouch_withLocationInWindow_withWindowBounds_withTrackpadFingerDownCount___block_invoke;
  block[3] = &unk_1E16B71F8;
  block[4] = self;
  v22 = v16;
  v23 = v17;
  v24 = v18;
  v25 = v12;
  v26 = v11;
  v27 = x;
  v28 = y;
  v29 = width;
  v30 = height;
  v31 = a6;
  v20 = v16;
  dispatch_async(queue, block);

}

void __108__UIEventSessionActionAnalytics_didTouch_withLocationInWindow_withWindowBounds_withTrackpadFingerDownCount___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "didTouchWithID:withPhase:withType:withLocationInWindow:withWindowBounds:withTrackpadFingerDownCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 112), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)didPointerHover:(id)a3 withLocationInWindow:(CGPoint)a4 withWindowBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  uint64_t v12;
  NSObject *queue;
  _QWORD v14[12];

  if (a3)
  {
    height = a5.size.height;
    width = a5.size.width;
    y = a5.origin.y;
    x = a5.origin.x;
    v9 = a4.y;
    v10 = a4.x;
    v12 = objc_msgSend(a3, "_trackpadFingerDownCount");
    queue = self->_queue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __87__UIEventSessionActionAnalytics_didPointerHover_withLocationInWindow_withWindowBounds___block_invoke;
    v14[3] = &unk_1E16DF530;
    v14[4] = self;
    v14[5] = v12;
    *(CGFloat *)&v14[6] = v10;
    *(CGFloat *)&v14[7] = v9;
    *(CGFloat *)&v14[8] = x;
    *(CGFloat *)&v14[9] = y;
    *(CGFloat *)&v14[10] = width;
    *(CGFloat *)&v14[11] = height;
    dispatch_async(queue, v14);
  }
}

void __87__UIEventSessionActionAnalytics_didPointerHover_withLocationInWindow_withWindowBounds___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "didPointerHoverWithTrackpadFingerDownCount:withLocationInWindow:withWindowBounds:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)didPointerClick:(id)a3 withLocationInWindow:(CGPoint)a4 withWindowBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  uint64_t v12;
  NSObject *queue;
  _QWORD v14[12];

  if (a3)
  {
    height = a5.size.height;
    width = a5.size.width;
    y = a5.origin.y;
    x = a5.origin.x;
    v9 = a4.y;
    v10 = a4.x;
    v12 = objc_msgSend(a3, "_trackpadFingerDownCount");
    queue = self->_queue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __87__UIEventSessionActionAnalytics_didPointerClick_withLocationInWindow_withWindowBounds___block_invoke;
    v14[3] = &unk_1E16DF530;
    v14[4] = self;
    v14[5] = v12;
    *(CGFloat *)&v14[6] = v10;
    *(CGFloat *)&v14[7] = v9;
    *(CGFloat *)&v14[8] = x;
    *(CGFloat *)&v14[9] = y;
    *(CGFloat *)&v14[10] = width;
    *(CGFloat *)&v14[11] = height;
    dispatch_async(queue, v14);
  }
}

void __87__UIEventSessionActionAnalytics_didPointerClick_withLocationInWindow_withWindowBounds___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "didPointerClickWithTrackpadFingerDownCount:withLocationInWindow:withWindowBounds:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)didTap:(id)a3 withSource:(int64_t)a4
{
  void *v5;
  void *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[4];
  id v10;
  UIEventSessionActionAnalytics *v11;

  -[UIEventSessionActionAnalytics _instanceOfActionClass:source:](self, "_instanceOfActionClass:source:", objc_opt_class(), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asTap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__UIEventSessionActionAnalytics_didTap_withSource___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(queue, v9);

}

uint64_t __51__UIEventSessionActionAnalytics_didTap_withSource___block_invoke(uint64_t a1)
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    v3 = _UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_4___s_category;
    if (!_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_4___s_category)
    {
      v3 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_4___s_category);
    }
    if ((*(_BYTE *)v3 & 1) != 0)
    {
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = *(void **)(a1 + 32);
        v6 = v4;
        objc_msgSend(v5, "description");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "bundleID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v7;
        v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "didTap action = %@, bundleId = %@", (uint8_t *)&v9, 0x16u);

      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 32));
}

- (void)didScroll:(id)a3 withSource:(int64_t)a4
{
  void *v5;
  void *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[4];
  id v10;
  UIEventSessionActionAnalytics *v11;

  -[UIEventSessionActionAnalytics _instanceOfActionClass:source:](self, "_instanceOfActionClass:source:", objc_opt_class(), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asScroll");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__UIEventSessionActionAnalytics_didScroll_withSource___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(queue, v9);

}

void __54__UIEventSessionActionAnalytics_didScroll_withSource___block_invoke(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  unint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (_UIIsPrivateMainBundle())
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleIdentifier");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = CFSTR("other");
  }
  if (os_variant_has_internal_diagnostics())
  {
    v4 = _UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_5___s_category;
    if (!_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_5___s_category)
    {
      v4 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_5___s_category);
    }
    if ((*(_BYTE *)v4 & 1) != 0)
    {
      v5 = *(NSObject **)(v4 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = *(void **)(a1 + 32);
        v7 = v5;
        objc_msgSend(v6, "description");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v8;
        v11 = 2112;
        v12 = v3;
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "didScroll action = %@, bundleId = %@", (uint8_t *)&v9, 0x16u);

      }
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 32));

}

- (void)didShowContextualMenuFromLocation:(CGPoint)a3 withSource:(int64_t)a4
{
  void *v5;
  void *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[4];
  id v10;
  UIEventSessionActionAnalytics *v11;

  -[UIEventSessionActionAnalytics _instanceOfActionClass:source:](self, "_instanceOfActionClass:source:", objc_opt_class(), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asContextualPress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__UIEventSessionActionAnalytics_didShowContextualMenuFromLocation_withSource___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(queue, v9);

}

uint64_t __78__UIEventSessionActionAnalytics_didShowContextualMenuFromLocation_withSource___block_invoke(uint64_t a1)
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    v3 = _UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_6___s_category;
    if (!_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_6___s_category)
    {
      v3 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_6___s_category);
    }
    if ((*(_BYTE *)v3 & 1) != 0)
    {
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = *(void **)(a1 + 32);
        v6 = v4;
        objc_msgSend(v5, "description");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "bundleID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v7;
        v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "didShowContextualMenuFromLocation action = %@, bundleId = %@", (uint8_t *)&v9, 0x16u);

      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 32));
}

- (void)didTypingWithSource:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *queue;
  id v8;
  void *v10;
  _QWORD v11[4];
  id v12;
  UIEventSessionActionAnalytics *v13;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIEventSessionActionAnalytics.m"), 473, CFSTR("didTypingWithSource called with direct touch source. This should be accounted for in didTouch:"));

  }
  -[UIEventSessionActionAnalytics _instanceOfActionClass:source:](self, "_instanceOfActionClass:source:", objc_opt_class(), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asTyping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__UIEventSessionActionAnalytics_didTypingWithSource___block_invoke;
  v11[3] = &unk_1E16B1B50;
  v12 = v6;
  v13 = self;
  v8 = v6;
  dispatch_async(queue, v11);

}

uint64_t __53__UIEventSessionActionAnalytics_didTypingWithSource___block_invoke(uint64_t a1)
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    v3 = _UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_7___s_category;
    if (!_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_7___s_category)
    {
      v3 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_7___s_category);
    }
    if ((*(_BYTE *)v3 & 1) != 0)
    {
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = *(void **)(a1 + 32);
        v6 = v4;
        objc_msgSend(v5, "description");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "bundleID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v7;
        v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "didTypingWithSource action = %@, bundleId = %@", (uint8_t *)&v9, 0x16u);

      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 32));
}

- (void)didTextSelectionWithSource:(int64_t)a3
{
  void *v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  UIEventSessionActionAnalytics *v10;

  -[UIEventSessionActionAnalytics _instanceOfActionClass:source:](self, "_instanceOfActionClass:source:", objc_opt_class(), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asTextSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__UIEventSessionActionAnalytics_didTextSelectionWithSource___block_invoke;
  v8[3] = &unk_1E16B1B50;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __60__UIEventSessionActionAnalytics_didTextSelectionWithSource___block_invoke(uint64_t a1)
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    v3 = _UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_8___s_category;
    if (!_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_8___s_category)
    {
      v3 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_8___s_category);
    }
    if ((*(_BYTE *)v3 & 1) != 0)
    {
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = *(void **)(a1 + 32);
        v6 = v4;
        objc_msgSend(v5, "description");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "bundleID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v7;
        v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "didTextSelectionWithSource action = %@, bundleId = %@", (uint8_t *)&v9, 0x16u);

      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 32));
}

- (void)didKeyCommand:(id)a3
{
  void *v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  UIEventSessionActionAnalytics *v10;

  -[UIEventSessionActionAnalytics _instanceOfActionClass:source:](self, "_instanceOfActionClass:source:", objc_opt_class(), 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asKeyCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__UIEventSessionActionAnalytics_didKeyCommand___block_invoke;
  v8[3] = &unk_1E16B1B50;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __47__UIEventSessionActionAnalytics_didKeyCommand___block_invoke(uint64_t a1)
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    v3 = _UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_9___s_category;
    if (!_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_9___s_category)
    {
      v3 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_9___s_category);
    }
    if ((*(_BYTE *)v3 & 1) != 0)
    {
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = *(void **)(a1 + 32);
        v6 = v4;
        objc_msgSend(v5, "description");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "bundleID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v7;
        v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "didKeyCommand action = %@, bundleId = %@", (uint8_t *)&v9, 0x16u);

      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 32));
}

- (void)didHardwareConfigurationChange:(id)a3
{
  NSObject *queue;
  unint64_t v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    v5 = didHardwareConfigurationChange____s_category;
    if (!didHardwareConfigurationChange____s_category)
    {
      v5 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&didHardwareConfigurationChange____s_category);
    }
    if ((*(_BYTE *)v5 & 1) != 0)
    {
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Received hardware keyboard availability change notification!", buf, 2u);
      }
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__UIEventSessionActionAnalytics_didHardwareConfigurationChange___block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __64__UIEventSessionActionAnalytics_didHardwareConfigurationChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_updateHardwareState");
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->touchAnalyzer, 0);
  objc_storeStrong((id *)&self->_accumulators, 0);
  objc_storeStrong((id *)&self->_lastAction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)q_setupDefaultAnalytics
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[8];
  _QWORD v15[8];
  _QWORD v16[8];
  _QWORD v17[10];

  v17[8] = *MEMORY[0x1E0C80C00];
  v16[0] = objc_opt_class();
  v17[0] = &unk_1E1A94EB0;
  v16[1] = objc_opt_class();
  v17[1] = &unk_1E1A94EC8;
  v16[2] = objc_opt_class();
  v17[2] = &unk_1E1A94EE0;
  v16[3] = objc_opt_class();
  v17[3] = &unk_1E1A94EF8;
  v16[4] = objc_opt_class();
  v17[4] = &unk_1E1A94F10;
  v16[5] = objc_opt_class();
  v17[5] = &unk_1E1A94F28;
  v16[6] = objc_opt_class();
  v17[6] = &unk_1E1A94F40;
  v16[7] = objc_opt_class();
  v17[7] = &unk_1E1A94F58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 != 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIEventSessionActionDefaultAnalytics.m"), 77, CFSTR("rawEventsAllowedActionSourcePairs has incoorect length. Make sure it aligns with _UIEventSourceCount"));

  }
  v14[0] = objc_opt_class();
  v15[0] = &unk_1E1A94F70;
  v14[1] = objc_opt_class();
  v15[1] = &unk_1E1A94F88;
  v14[2] = objc_opt_class();
  v15[2] = &unk_1E1A94FA0;
  v14[3] = objc_opt_class();
  v15[3] = &unk_1E1A94FB8;
  v14[4] = objc_opt_class();
  v15[4] = &unk_1E1A94FD0;
  v14[5] = objc_opt_class();
  v15[5] = &unk_1E1A94FE8;
  v14[6] = objc_opt_class();
  v15[6] = &unk_1E1A95000;
  v14[7] = objc_opt_class();
  v15[7] = &unk_1E1A95018;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 != 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIEventSessionActionDefaultAnalytics.m"), 92, CFSTR("rawEventsAllowedActionSourcePairs has incoorect length. Make sure it aligns with _UIEventSourceCount"));

  }
  +[_UIEventSessionDynamicAllEventAccumulator accumulatorWithName:depth:block:delegate:allowedActionSourceTypes:](_UIEventSessionDynamicAllEventAccumulator, "accumulatorWithName:depth:block:delegate:allowedActionSourceTypes:", CFSTR("com.apple.inputAnalytics.eventSessionActionRawEvents"), 1, &__block_literal_global_577, self, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIEventSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v9);

  +[_UIEventSessionDynamicAllEventAccumulator accumulatorWithName:depth:block:delegate:allowedActionSourceTypes:](_UIEventSessionDynamicAllEventAccumulator, "accumulatorWithName:depth:block:delegate:allowedActionSourceTypes:", CFSTR("com.apple.inputAnalytics.eventSessionActionContextualEvents"), 1, &__block_literal_global_66_2, self, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIEventSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v10);

}

uint64_t __65__UIEventSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "actionCount");

  return v3;
}

uint64_t __65__UIEventSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "actionCount");

  return v3;
}

@end
