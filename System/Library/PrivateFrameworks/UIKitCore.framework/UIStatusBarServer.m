@implementation UIStatusBarServer

- (UIStatusBarServer)initWithStatusBar:(id)a3
{
  id v4;
  UIStatusBarServer *v5;
  UIStatusBarServer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIStatusBarServer;
  v5 = -[UIStatusBarServer init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[UIStatusBarServer setStatusBar:](v5, "setStatusBar:", v4);
    objc_msgSend((id)qword_1ECD809D8, "addObject:", v6);
  }

  return v6;
}

- (void)setStatusBar:(id)a3
{
  UIStatusBarServerClient *v4;
  mach_port_name_t v5;
  UIStatusBarServerClient *statusBar;

  v4 = (UIStatusBarServerClient *)a3;
  if (self->_source)
  {
    v5 = CPGetMachPortForMIGServerSource();
    CFRunLoopSourceInvalidate(self->_source);
    CFRelease(self->_source);
    self->_source = 0;
    mach_port_mod_refs(*MEMORY[0x1E0C83DA0], v5, 1u, -1);
  }
  statusBar = self->_statusBar;
  self->_statusBar = v4;

}

+ (unint64_t)getStyleOverrides
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "Unsupported use of UIStatusBarSever SPI outside of SpringBoard. Use System Status APIs instead.", buf, 2u);
      }

    }
    else
    {
      v3 = qword_1ECD80A30;
      if (!qword_1ECD80A30)
      {
        v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v3, (unint64_t *)&qword_1ECD80A30);
      }
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Unsupported use of UIStatusBarSever SPI outside of SpringBoard. Use System Status APIs instead.", v6, 2u);
      }
    }
  }
  return qword_1ECD809E0;
}

+ (void)postStatusBarData:(id *)a3 withActions:(int)a4
{
  uint64_t v4;
  _BOOL8 v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x1E0C80C00];
  v7 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  memcpy(&statusBarData, a3, 0xF28uLL);
  _MergedGlobals_1242 = 0;
  v8 = objc_msgSend(a1, "_statusBarData");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = (id)qword_1ECD809D8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "_receivedStatusBarData:actions:animated:", v8, v4, v7, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)_receivedStatusBarData:(id *)a3 actions:(int)a4 animated:(BOOL)a5
{
  _QWORD v5[6];
  int v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__UIStatusBarServer__receivedStatusBarData_actions_animated___block_invoke;
  v5[3] = &unk_1E16D6650;
  v5[4] = self;
  v5[5] = a3;
  v6 = a4;
  if (a5)
    -[UIStatusBarServerClient statusBarServer:didReceiveStatusBarData:withActions:](self->_statusBar, "statusBarServer:didReceiveStatusBarData:withActions:", self, a3, *(_QWORD *)&a4);
  else
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5, a3);
}

+ ($6C45178016D353444451090973A2A97F)_statusBarData
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((_MergedGlobals_1242[0] & 1) == 0)
  {
    memcpy(&unk_1ECD80A38, &statusBarData, 0xF28uLL);
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = (id)qword_1ECD809F0;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          _MergedGlobals_1242[objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "intValue", (_QWORD)v8)+ 104] = 1;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

    +[UIStatusBar getData:forRequestedData:withOverrides:](UIStatusBar, "getData:forRequestedData:withOverrides:", &unk_1ECD80A38, &unk_1ECD80A38, &statusBarOverrides);
    _MergedGlobals_1242[0] = 1;
  }
  return ($6C45178016D353444451090973A2A97F *)&unk_1ECD80A38;
}

+ (void)runServer
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (!qword_1ECD809D8)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 6);
    v3 = (void *)qword_1ECD809D8;
    qword_1ECD809D8 = v2;

    qword_1ECD809E0 = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)qword_1ECD809E8;
    qword_1ECD809E8 = v4;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)qword_1ECD809F0;
    qword_1ECD809F0 = v6;

    NSHomeDirectory();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Library/SpringBoard/statusBarOverrides"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && objc_msgSend(v9, "length") == 3944)
      memcpy(&statusBarOverrides, (const void *)objc_msgSend(objc_retainAutorelease(v10), "bytes"), 0xF68uLL);
    else
      bzero(&statusBarOverrides, 0xF68uLL);

  }
}

+ (void)_updateStatusBarDataAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  _MergedGlobals_1242[0] = 0;
  v4 = objc_msgSend(a1, "_statusBarData");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (id)qword_1ECD809D8;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_receivedStatusBarData:actions:animated:", v4, 0, v3, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

+ (void)addStyleOverrides:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Unsupported use of UIStatusBarSever SPI outside of SpringBoard. Use System Status APIs instead.", buf, 2u);
      }

    }
    else
    {
      v9 = qword_1ECD809F8;
      if (!qword_1ECD809F8)
      {
        v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&qword_1ECD809F8);
      }
      v10 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Unsupported use of UIStatusBarSever SPI outside of SpringBoard. Use System Status APIs instead.", buf, 2u);
      }
    }
  }
  qword_1ECD809E0 |= a3;
  _MergedGlobals_1242[0] = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)qword_1ECD809D8;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "_receivedStyleOverrides:", qword_1ECD809E0, (_QWORD)v12);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v6);
  }

}

+ (void)removeStyleOverrides:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Unsupported use of UIStatusBarSever SPI outside of SpringBoard. Use System Status APIs instead.", buf, 2u);
      }

    }
    else
    {
      v9 = qword_1ECD80A00;
      if (!qword_1ECD80A00)
      {
        v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&qword_1ECD80A00);
      }
      v10 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Unsupported use of UIStatusBarSever SPI outside of SpringBoard. Use System Status APIs instead.", buf, 2u);
      }
    }
  }
  qword_1ECD809E0 &= ~a3;
  _MergedGlobals_1242[0] = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)qword_1ECD809D8;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "_receivedStyleOverrides:", qword_1ECD809E0, (_QWORD)v12);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v6);
  }

}

+ (void)postDoubleHeightStatusString:(id)a3 forStyle:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "copy");
  v6 = (void *)qword_1ECD809E8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (id)qword_1ECD809D8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v13, "statusBar", (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "statusBarServer:didReceiveDoubleHeightStatusString:forStyle:", v13, v5, a4);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

+ (void)addStatusBarItem:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = *(_QWORD *)&a3;
  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Unsupported use of UIStatusBarSever SPI outside of SpringBoard. Use System Status APIs instead.", buf, 2u);
      }

    }
    else
    {
      v7 = qword_1ECD80A08;
      if (!qword_1ECD80A08)
      {
        v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&qword_1ECD80A08);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Unsupported use of UIStatusBarSever SPI outside of SpringBoard. Use System Status APIs instead.", v10, 2u);
      }
    }
  }
  v5 = (void *)qword_1ECD809F0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_msgSend(a1, "_updateStatusBarDataAnimated:", 1);
}

+ (void)removeStatusBarItem:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = *(_QWORD *)&a3;
  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Unsupported use of UIStatusBarSever SPI outside of SpringBoard. Use System Status APIs instead.", buf, 2u);
      }

    }
    else
    {
      v7 = qword_1ECD80A10;
      if (!qword_1ECD80A10)
      {
        v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&qword_1ECD80A10);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Unsupported use of UIStatusBarSever SPI outside of SpringBoard. Use System Status APIs instead.", v10, 2u);
      }
    }
  }
  v5 = (void *)qword_1ECD809F0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  objc_msgSend(a1, "_updateStatusBarDataAnimated:", 1);
}

+ (void)postStatusBarOverrideData:(id *)a3
{
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "Unsupported use of UIStatusBarSever SPI outside of SpringBoard. Use System Status APIs instead.", buf, 2u);
      }

    }
    else
    {
      v5 = qword_1ECD80A18;
      if (!qword_1ECD80A18)
      {
        v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&qword_1ECD80A18);
      }
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Unsupported use of UIStatusBarSever SPI outside of SpringBoard. Use System Status APIs instead.", v8, 2u);
      }
    }
  }
  memcpy(&statusBarOverrides, a3, 0xF68uLL);
  objc_msgSend(a1, "_updateStatusBarDataAnimated:", 1);
}

+ (void)permanentizeStatusBarOverrideData
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "Unsupported use of UIStatusBarSever SPI outside of SpringBoard. Use System Status APIs instead.", buf, 2u);
      }

    }
    else
    {
      v5 = qword_1ECD80A20;
      if (!qword_1ECD80A20)
      {
        v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&qword_1ECD80A20);
      }
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Unsupported use of UIStatusBarSever SPI outside of SpringBoard. Use System Status APIs instead.", v8, 2u);
      }
    }
  }
  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library/SpringBoard/statusBarOverrides"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", &statusBarOverrides, 3944, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeToFile:atomically:", v3, 0);

}

- (void)dealloc
{
  objc_super v3;

  -[UIStatusBarServer setStatusBar:](self, "setStatusBar:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarServer;
  -[UIStatusBarServer dealloc](&v3, sel_dealloc);
}

+ (id)_cachedTimeStringFromData:(id *)a3
{
  void *v4;
  void *v5;

  if (_UIDeviceNativeUserInterfaceIdiom() != 1)
    goto LABEL_5;
  _UIKitUserDefaults();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "BOOLForKey:", 0x1E176CE40) & 1) == 0)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->var1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->var2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ ($6DFA6A1B36B4056F0CD57F9D22B125FB)getStatusBarOverrideData
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "Unsupported use of UIStatusBarSever SPI outside of SpringBoard. Use System Status APIs instead.", buf, 2u);
      }

    }
    else
    {
      v3 = qword_1ECD80A28;
      if (!qword_1ECD80A28)
      {
        v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v3, (unint64_t *)&qword_1ECD80A28);
      }
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Unsupported use of UIStatusBarSever SPI outside of SpringBoard. Use System Status APIs instead.", v6, 2u);
      }
    }
  }
  return ($6DFA6A1B36B4056F0CD57F9D22B125FB *)&statusBarOverrides;
}

+ (double)getGlowAnimationEndTimeForStyle:(int64_t)a3
{
  return 1.79769313e308;
}

+ (BOOL)getGlowAnimationStateForStyle:(int64_t)a3
{
  return 0;
}

+ (id)getDoubleHeightStatusStringForStyle:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)qword_1ECD809E8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __61__UIStatusBarServer__receivedStatusBarData_actions_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "statusBarServer:didReceiveStatusBarData:withActions:");
}

- (void)_receivedStyleOverrides:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _UIStatusBar_Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "StatusBar received style overrides: %llu", (uint8_t *)&v6, 0xCu);
  }

  -[UIStatusBarServerClient statusBarServer:didReceiveStyleOverrides:](self->_statusBar, "statusBarServer:didReceiveStyleOverrides:", self, a3);
}

- (UIStatusBarServerClient)statusBar
{
  return self->_statusBar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBar, 0);
}

@end
