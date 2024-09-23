@implementation SUScriptNavigationController

- (SUScriptNavigationController)initWithRootScriptViewController:(id)a3 clientInterface:(id)a4
{
  SUScriptNavigationController *v4;

  v4 = -[SUScriptObject init](self, "init");
  if (v4)
    WebThreadRunOnMainThread();
  return v4;
}

void __81__SUScriptNavigationController_initWithRootScriptViewController_clientInterface___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  SUNavigationController *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "nativeViewController");
  if (v2)
  {
    v3 = (void *)v2;
    v12 = -[SUNavigationController initWithRootViewController:]([SUNavigationController alloc], "initWithRootViewController:", v2);
    -[SUNavigationController setClientInterface:](v12, "setClientInterface:", *(_QWORD *)(a1 + 48));
    -[SUNavigationController setModalPresentationStyle:](v12, "setModalPresentationStyle:", objc_msgSend(v3, "modalPresentationStyle"));
    objc_msgSend(*(id *)(a1 + 40), "setNativeViewController:", v12);

  }
  else
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v5 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v6 &= 2u;
    if (v6)
    {
      v7 = objc_msgSend(*(id *)(a1 + 40), "_className");
      v8 = *(_QWORD *)(a1 + 32);
      v13 = 138412546;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      LODWORD(v11) = 22;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v13, v11);
        free(v10);
        SSFileLog();
      }
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptNavigationController;
  -[SUScriptViewController dealloc](&v3, sel_dealloc);
}

- (id)newNativeViewController
{
  SUNavigationController *v3;

  v3 = objc_alloc_init(SUNavigationController);
  -[SUNavigationController setClientInterface:](v3, "setClientInterface:", -[SUScriptObject clientInterface](self, "clientInterface"));
  return v3;
}

- (void)didPerformBatchedInvocations
{
  objc_super v3;

  self->_navController = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScriptNavigationController;
  -[SUScriptObject didPerformBatchedInvocations](&v3, sel_didPerformBatchedInvocations);
}

- (void)willPerformBatchedInvocations
{
  objc_super v3;

  self->_navController = 0;
  self->_navController = (UINavigationController *)-[SUScriptNavigationController _navigationController](self, "_navigationController");
  v3.receiver = self;
  v3.super_class = (Class)SUScriptNavigationController;
  -[SUScriptObject willPerformBatchedInvocations](&v3, sel_willPerformBatchedInvocations);
}

- (void)popToRootViewControllerAnimated:(BOOL)a3
{
  objc_msgSend(-[SUScriptObject webThreadMainThreadBatchProxy](self, "webThreadMainThreadBatchProxy"), "_popToRootViewControllerAnimated:", a3);
}

- (void)popViewControllerAnimated:(BOOL)a3
{
  objc_msgSend(-[SUScriptObject webThreadMainThreadBatchProxy](self, "webThreadMainThreadBatchProxy"), "_popViewControllerAnimated:", a3);
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  objc_msgSend(-[SUScriptObject webThreadMainThreadBatchProxy](self, "webThreadMainThreadBatchProxy"), "_pushViewController:animated:", a3, a4);
}

- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  WebThreadRunOnMainThread();
}

uint64_t __64__SUScriptNavigationController_setNavigationBarHidden_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", objc_msgSend(*(id *)(a1 + 32), "_navigationController")), "setNavigationBarHidden:animated:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

- (void)setToolbarHidden:(BOOL)a3 animated:(BOOL)a4
{
  WebThreadRunOnMainThread();
}

uint64_t __58__SUScriptNavigationController_setToolbarHidden_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", objc_msgSend(*(id *)(a1 + 32), "_navigationController")), "setToolbarHidden:animated:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (id)objc_msgSend(a3, "copyArrayValueWithValidator:context:", SUISAValidator, objc_opt_class());
    if (objc_msgSend(v7, "count"))
      objc_msgSend(-[SUScriptObject webThreadMainThreadBatchProxy](self, "webThreadMainThreadBatchProxy"), "_setViewControllers:animated:", v7, v4);
    else
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

- (id)_className
{
  return CFSTR("iTunesNavigationController");
}

- (SUScriptNavigationBar)navigationBar
{
  void *v3;
  SUScriptNavigationBar *v4;
  SUScriptNavigationBar *v5;
  uint64_t v7;
  uint64_t v8;
  SUScriptNavigationBar *(*v9)(uint64_t);
  void *v10;
  SUScriptNavigationController *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__14;
  v17 = __Block_byref_object_dispose__14;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __45__SUScriptNavigationController_navigationBar__block_invoke;
  v10 = &unk_24DE7BE08;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __45__SUScriptNavigationController_navigationBar__block_invoke, &unk_24DE7BE08, v11, &v13), (v3 = (void *)v14[5]) != 0))
  {
    v4 = v3;
  }
  else
  {
    v4 = (SUScriptNavigationBar *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v7, v8, v9, v10, v11, v12);
  }
  v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

SUScriptNavigationBar *__45__SUScriptNavigationController_navigationBar__block_invoke(uint64_t a1)
{
  SUScriptNavigationBar *result;

  result = (SUScriptNavigationBar *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_navigationController"), "navigationBar");
  if (result)
  {
    result = -[SUScriptNavigationBar initWithNativeNavigationBar:]([SUScriptNavigationBar alloc], "initWithNativeNavigationBar:", result);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (BOOL)navigationBarHidden
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  WebThreadRunOnMainThread();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __51__SUScriptNavigationController_navigationBarHidden__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_navigationController");
  if (v2)
    result = objc_msgSend(v2, "isNavigationBarHidden");
  else
    result = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setNavigationBar:(id)a3
{
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("navigationBar")));
}

- (void)setNavigationBarHidden:(BOOL)a3
{
  -[SUScriptNavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", a3, 0);
}

- (void)setToolbarHidden:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUScriptNavigationController setToolbarHidden:animated:](self, "setToolbarHidden:animated:", objc_msgSend(a3, "BOOLValue"), 0);
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

- (void)setTopViewController:(id)a3
{
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("topViewController")));
}

- (void)setViewControllers:(id)a3
{
  -[SUScriptNavigationController setViewControllers:animated:](self, "setViewControllers:animated:", a3, 0);
}

- (id)toolbarHidden
{
  void **v2;
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  WebThreadRunOnMainThread();
  if (*((_BYTE *)v6 + 24))
    v2 = (void **)MEMORY[0x24BDBD270];
  else
    v2 = (void **)MEMORY[0x24BDBD268];
  v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __45__SUScriptNavigationController_toolbarHidden__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_navigationController"), "isToolbarHidden");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (SUScriptViewController)topViewController
{
  void *v3;
  SUScriptViewController *v4;
  SUScriptViewController *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  SUScriptNavigationController *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__14;
  v17 = __Block_byref_object_dispose__14;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __49__SUScriptNavigationController_topViewController__block_invoke;
  v10 = &unk_24DE7BE08;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __49__SUScriptNavigationController_topViewController__block_invoke, &unk_24DE7BE08, v11, &v13), (v3 = (void *)v14[5]) != 0))
  {
    v4 = v3;
  }
  else
  {
    v4 = (SUScriptViewController *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v7, v8, v9, v10, v11, v12);
  }
  v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __49__SUScriptNavigationController_topViewController__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_filteredViewControllers"), "lastObject"), "copyScriptViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)viewControllers
{
  id v3;
  uint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  -[SUScriptObject checkInScriptObjects:](self, "checkInScriptObjects:", v3, v5, 3221225472, __47__SUScriptNavigationController_viewControllers__block_invoke, &unk_24DE7AFB8, self, v3);
  return v3;
}

uint64_t __47__SUScriptNavigationController_viewControllers__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_filteredViewControllers");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "copyScriptViewController");
        if (v7)
        {
          v8 = (void *)v7;
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

        }
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)_popToRootViewControllerAnimated:(BOOL)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", -[SUScriptNavigationController _navigationController](self, "_navigationController")), "popToRootViewControllerAnimated:", a3);
}

- (void)_popViewControllerAnimated:(BOOL)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", -[SUScriptNavigationController _navigationController](self, "_navigationController")), "popViewControllerAnimated:", a3);
}

- (void)_pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  SUNavigationContainerViewController *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend(a3, "nativeViewController");
  if (v7)
  {
    v14 = -[SUNavigationContainerViewController initWithChildViewController:]([SUNavigationContainerViewController alloc], "initWithChildViewController:", v7);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", -[SUScriptNavigationController _navigationController](self, "_navigationController")), "pushViewController:animated:", v14, v4);

  }
  else
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v8, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v10 &= 2u;
    if (v10)
    {
      v15 = 138412546;
      v16 = -[SUScriptNavigationController _className](self, "_className");
      v17 = 2112;
      v18 = a3;
      LODWORD(v13) = 22;
      v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        v12 = (void *)v11;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, &v15, v13);
        free(v12);
        SSFileLog();
      }
    }
  }
}

- (void)_setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = -[SUScriptNavigationController _copyNativeViewControllersFromScriptViewControllers:](self, "_copyNativeViewControllersFromScriptViewControllers:", a3);
  if (objc_msgSend(v8, "count"))
  {
    v6 = -[SUScriptNavigationController _navigationController](self, "_navigationController");
    v7 = (void *)objc_msgSend(v8, "objectAtIndex:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v7, "setSection:", objc_msgSend(v6, "section"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", v6), "setViewControllers:animated:", v8, v4);
  }

}

- (id)_copyNativeViewControllersFromScriptViewControllers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
          objc_enumerationMutation(a3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "nativeViewController");
        if (v9)
          objc_msgSend(v4, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v4;
}

- (id)_filteredViewControllers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  const char *v11;
  id v12;
  SUScriptNavigationController *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend((id)objc_msgSend(-[SUScriptNavigationController _navigationController](self, "_navigationController"), "viewControllers"), "mutableCopy");
  v14 = self;
  v4 = (void *)objc_msgSend(-[SUScriptObject invocationBatch:](self, "invocationBatch:", 0), "copyQueuedInvocationsForObject:", self);
  if (objc_msgSend(v4, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v10 = objc_msgSend(v3, "count");
          v11 = (const char *)objc_msgSend(v9, "selector");
          if (sel_isEqual(v11, sel__popToRootViewControllerAnimated_))
          {
            if (v10 >= 2)
              objc_msgSend(v3, "removeObjectsInRange:", 1, v10 - 1);
          }
          else if (sel_isEqual(v11, sel__popViewControllerAnimated_))
          {
            if (v10 >= 2)
              objc_msgSend(v3, "removeLastObject");
          }
          else if (sel_isEqual(v11, sel__pushViewController_animated_))
          {
            v15 = 0;
            objc_msgSend(v9, "getArgument:atIndex:", &v15, 2);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v3, "addObject:", objc_msgSend(v15, "nativeViewController"));
          }
          else if (sel_isEqual(v11, sel__setViewControllers_animated_))
          {
            v15 = 0;
            objc_msgSend(v9, "getArgument:atIndex:", &v15, 2);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v12 = -[SUScriptNavigationController _copyNativeViewControllersFromScriptViewControllers:](v14, "_copyNativeViewControllersFromScriptViewControllers:", v15);
              objc_msgSend(v3, "setArray:", v12);

            }
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }
  }

  return v3;
}

- (id)_navigationController
{
  UINavigationController *navController;

  navController = self->_navController;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    navController = -[SUScriptViewController nativeViewController](self, "nativeViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return navController;
  else
    return (id)-[UINavigationController navigationController](navController, "navigationController");
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_22, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptNavigationController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_17, 6);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptNavigationController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptNavigationController;
  v2 = -[SUScriptViewController scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_22, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_17 = (uint64_t)sel_popToRootViewControllerAnimated_;
    unk_2551863E0 = CFSTR("popToRootViewController");
    qword_2551863E8 = (uint64_t)sel_popViewControllerAnimated_;
    unk_2551863F0 = CFSTR("popViewController");
    qword_2551863F8 = (uint64_t)sel_pushViewController_animated_;
    unk_255186400 = CFSTR("pushViewController");
    qword_255186408 = (uint64_t)sel_setNavigationBarHidden_animated_;
    unk_255186410 = CFSTR("setNavigationBarHidden");
    qword_255186418 = (uint64_t)sel_setToolbarHidden_animated_;
    unk_255186420 = CFSTR("setToolbarHidden");
    qword_255186428 = (uint64_t)sel_setViewControllers_animated_;
    unk_255186430 = CFSTR("setViewControllers");
    __KeyMapping_22 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("navigationBar"), CFSTR("navigationBarHidden"), CFSTR("navigationBarHidden"), CFSTR("toolbarHidden"), CFSTR("toolbarHidden"), CFSTR("topViewController"), CFSTR("topViewController"), CFSTR("viewControllers"), CFSTR("viewControllers"), 0);
  }
}

@end
