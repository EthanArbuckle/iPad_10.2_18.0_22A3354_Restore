@implementation UIAlertControllerStackManager

- (UIAlertControllerStackManager)initWithScene:(id)a3
{
  id v4;
  UIAlertControllerStackManager *v5;
  NSMutableArray *v6;
  NSMutableArray *alertControllerStack;
  NSMutableArray *v8;
  NSMutableArray *hiddenAlertControllers;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIAlertControllerStackManager;
  v5 = -[UIAlertControllerStackManager init](&v11, sel_init);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    alertControllerStack = v5->_alertControllerStack;
    v5->_alertControllerStack = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    hiddenAlertControllers = v5->_hiddenAlertControllers;
    v5->_hiddenAlertControllers = v8;

    objc_storeWeak((id *)&v5->_scene, v4);
  }

  return v5;
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void)_alertControllerWillAppear:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  if (-[UIAlertControllerStackManager _alertControllerShouldBeTrackedInStack:](self, "_alertControllerShouldBeTrackedInStack:", v4))
  {
    -[UIAlertControllerStackManager _willShowAlertController:](self, "_willShowAlertController:", v4);
    -[UIAlertControllerStackManager _addAlertControllerToStack:](self, "_addAlertControllerToStack:", v4);
    if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
    {
      if (objc_msgSend((id)UIApp, "_isSpringBoardShowingAnAlert"))
      {
        v5 = _alertControllerWillAppear____s_category;
        if (!_alertControllerWillAppear____s_category)
        {
          v5 = __UILogCategoryGetNode("UIAlertControllerStackManager", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v5, (unint64_t *)&_alertControllerWillAppear____s_category);
        }
        v6 = *(NSObject **)(v5 + 8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v7 = 0;
          _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "_alertControllerWillAppear: Hiding stacked Alerts", v7, 2u);
        }
        -[UIAlertControllerStackManager _hideStackedAlertControllers](self, "_hideStackedAlertControllers");
      }
    }
  }

}

- (void)_alertControllerWillDisappear:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  int v7;
  UIAlertControllerStackManager *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[UIAlertControllerStackManager _alertControllerShouldBeTrackedInStack:](self, "_alertControllerShouldBeTrackedInStack:", v4))
  {
    v5 = _alertControllerWillDisappear____s_category;
    if (!_alertControllerWillDisappear____s_category)
    {
      v5 = __UILogCategoryGetNode("UIAlertControllerStackManager", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_alertControllerWillDisappear____s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "_alertControllerWillDisappear: will hide alert : %@", (uint8_t *)&v7, 0xCu);
    }
    -[UIAlertControllerStackManager _willHideAlertController:](self, "_willHideAlertController:", v4);
    -[UIAlertControllerStackManager _removeAlertControllerFromStack:](self, "_removeAlertControllerFromStack:", v4);
  }

}

- (void)_alertControllerDidDisappear:(id)a3
{
  id v4;

  v4 = a3;
  if (-[UIAlertControllerStackManager _alertControllerShouldBeTrackedInStack:](self, "_alertControllerShouldBeTrackedInStack:"))
  {
    -[UIAlertControllerStackManager _didHideAlertController:](self, "_didHideAlertController:", v4);
  }

}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_hideStackedAlertControllers
{
  NSMutableArray *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->_alertControllerStack;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v14;
    *(_QWORD *)&v5 = 138412290;
    v12 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isViewLoaded", v12, (_QWORD)v13)
          && (objc_msgSend(v9, "_isHidden") & 1) == 0)
        {
          -[UIAlertControllerStackManager _willHideAlertController:](self, "_willHideAlertController:", v9);
          v10 = _hideStackedAlertControllers___s_category;
          if (!_hideStackedAlertControllers___s_category)
          {
            v10 = __UILogCategoryGetNode("UIAlertControllerStackManager", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v10, (unint64_t *)&_hideStackedAlertControllers___s_category);
          }
          v11 = *(NSObject **)(v10 + 8);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v12;
            v18 = v9;
            _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "_hideStackedAlertControllers: Hiding alert : %@", buf, 0xCu);
          }
          objc_msgSend(v9, "_setHidden:", 1);
          -[UIAlertControllerStackManager _didHideAlertController:](self, "_didHideAlertController:", v9);
          -[NSMutableArray addObject:](self->_hiddenAlertControllers, "addObject:", v9);
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v6);
  }

}

- (void)_showHiddenStackedAlertControllers
{
  NSMutableArray *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_hiddenAlertControllers, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = self->_hiddenAlertControllers;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v6 = v4;
      v7 = *(_QWORD *)v17;
      *(_QWORD *)&v5 = 138412290;
      v15 = v5;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          -[UIAlertControllerStackManager _willShowAlertController:](self, "_willShowAlertController:", v9, v15, (_QWORD)v16);
          v10 = qword_1ECD7CA90;
          if (!qword_1ECD7CA90)
          {
            v10 = __UILogCategoryGetNode("UIAlertControllerStackManager", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v10, (unint64_t *)&qword_1ECD7CA90);
          }
          v11 = *(NSObject **)(v10 + 8);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v15;
            v22 = v9;
            _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "_showHiddenStackedAlertControllers: Showing Hidden alert : %@", buf, 0xCu);
          }
          objc_msgSend(v9, "_setHidden:", 0);
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }

    -[NSMutableArray removeAllObjects](self->_hiddenAlertControllers, "removeAllObjects");
  }
  else
  {
    -[UIAlertControllerStackManager _topAlertControllerInStack](self, "_topAlertControllerInStack");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = _MergedGlobals_934;
    if (!_MergedGlobals_934)
    {
      v13 = __UILogCategoryGetNode("UIAlertControllerStackManager", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&_MergedGlobals_934);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v12;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "_showHiddenStackedAlertControllers : Showing top alert : %@", buf, 0xCu);
    }
    -[UIAlertControllerStackManager _willShowAlertController:](self, "_willShowAlertController:", v12);

  }
}

- (void)_addAlertControllerToStack:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _addAlertControllerToStack____s_category;
  if (!_addAlertControllerToStack____s_category)
  {
    v5 = __UILogCategoryGetNode("UIAlertControllerStackManager", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&_addAlertControllerToStack____s_category);
  }
  v6 = *(NSObject **)(v5 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "_addAlertControllerToStack: Adding Alert to stack : %@", (uint8_t *)&v7, 0xCu);
  }
  -[NSMutableArray addObject:](self->_alertControllerStack, "addObject:", v4);

}

- (void)_removeAlertControllerFromStack:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _removeAlertControllerFromStack____s_category;
  if (!_removeAlertControllerFromStack____s_category)
  {
    v5 = __UILogCategoryGetNode("UIAlertControllerStackManager", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&_removeAlertControllerFromStack____s_category);
  }
  v6 = *(NSObject **)(v5 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "_removeAlertControllerFromStack: Removing Alert from stack : %@", (uint8_t *)&v7, 0xCu);
  }
  -[NSMutableArray removeObject:](self->_alertControllerStack, "removeObject:", v4);

}

- (id)_topAlertControllerInStack
{
  return (id)-[NSMutableArray lastObject](self->_alertControllerStack, "lastObject");
}

- (void)_willShowAlertController:(id)a3
{
  id v3;
  unint64_t v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = _willShowAlertController____s_category;
  if (!_willShowAlertController____s_category)
  {
    v4 = __UILogCategoryGetNode("UIAlertControllerStackManager", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&_willShowAlertController____s_category);
  }
  v5 = *(NSObject **)(v4 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "_willShowAlertController: %@", (uint8_t *)&v6, 0xCu);
  }
  if (v3)
    objc_msgSend((id)UIApp, "willDisplayMiniAlert");

}

- (void)_didHideAlertController:(id)a3
{
  id v3;
  unint64_t v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = _didHideAlertController____s_category;
  if (!_didHideAlertController____s_category)
  {
    v4 = __UILogCategoryGetNode("UIAlertControllerStackManager", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&_didHideAlertController____s_category);
  }
  v5 = *(NSObject **)(v4 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "_didHideAlertController: %@", (uint8_t *)&v6, 0xCu);
  }
  if (v3)
    objc_msgSend((id)UIApp, "didDismissMiniAlert");

}

- (BOOL)_alertControllerShouldBeTrackedInStack:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "_resolvedStyle") == 1)
  {
    objc_msgSend(v3, "_window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_windowHostingScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "_sceneSessionRoleIsCarPlayOrNonInteractiveExternal") & 1) != 0)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      objc_msgSend(v3, "_window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "_isHostedInAnotherProcess") ^ 1;

    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (int64_t)_alertControllerStackCount
{
  return -[NSMutableArray count](self->_alertControllerStack, "count");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_hiddenAlertControllers, 0);
  objc_storeStrong((id *)&self->_alertControllerStack, 0);
}

@end
