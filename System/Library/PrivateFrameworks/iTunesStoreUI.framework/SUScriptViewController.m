@implementation SUScriptViewController

- (void)dealloc
{
  NSArray *scriptToolbarItems;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  objc_super v8;
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
  scriptToolbarItems = self->_scriptToolbarItems;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](scriptToolbarItems, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(scriptToolbarItems);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "setVisible:", 0);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](scriptToolbarItems, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SUScriptViewController;
  -[SUScriptObject dealloc](&v8, sel_dealloc);
}

- (id)newScriptColorWithValue:(id)a3
{
  SUScriptColor *v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[SUScriptColor initWithStyleString:]([SUScriptColor alloc], "initWithStyleString:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return a3;
  if (a3)
    return 0;
  v4 = [SUScriptColor alloc];
  return -[SUScriptColor initWithUIColor:](v4, "initWithUIColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
}

- (UIViewController)nativeViewController
{
  UIViewController *v3;
  UIViewController *v4;
  void *v5;

  v3 = -[SUScriptNativeObject object](-[SUScriptObject nativeObject](self, "nativeObject"), "object");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = -[SUScriptViewController newNativeViewController](self, "newNativeViewController");
    if (v3)
    {
      -[SUScriptViewController setNativeViewController:](self, "setNativeViewController:", v3);
      v4 = v3;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = (void *)-[UIViewController copyScriptProperties](v3, "copyScriptProperties");
    if (objc_msgSend(v5, "usesBlurredBackground"))
      -[UIViewController setModalPresentationStyle:](v3, "setModalPresentationStyle:", 17);

  }
  return v3;
}

- (id)newNativeViewController
{
  return 0;
}

- (void)setNativeViewController:(id)a3
{
  if (a3)
    a3 = +[SUScriptNativeObject objectWithNativeObject:](SUScriptViewControllerNativeObject, "objectWithNativeObject:");
  -[SUScriptObject setNativeObject:](self, "setNativeObject:", a3);
}

- (BOOL)equals:(id)a3
{
  int v5;
  BOOL v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_opt_class();
  objc_opt_class();
  v11 = objc_opt_isKindOfClass() & 1;
  v5 = *((unsigned __int8 *)v9 + 24);
  if (self != a3 && *((_BYTE *)v9 + 24))
  {
    WebThreadRunOnMainThread();
    v5 = *((unsigned __int8 *)v9 + 24);
  }
  v6 = v5 != 0;
  _Block_object_dispose(&v8, 8);
  return v6;
}

uint64_t __33__SUScriptViewController_equals___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "isEqual:", objc_msgSend(*(id *)(a1 + 40), "nativeViewController"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)tearDownUserInterface
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = -[SUScriptNativeObject object](-[SUScriptObject nativeObject](self, "nativeObject"), "object");
  v4 = (void *)objc_msgSend(v3, "toolbarItems");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "target");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "setAction:", 0);
          objc_msgSend(v10, "setTarget:", 0);
          v7 = 1;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
    if ((v7 & 1) != 0)
      objc_msgSend(v3, "setToolbarItems:", 0);
  }
  v11.receiver = self;
  v11.super_class = (Class)SUScriptViewController;
  -[SUScriptObject tearDownUserInterface](&v11, sel_tearDownUserInterface);
}

- (void)addPassbookPassWithURL:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

uint64_t __49__SUScriptViewController_addPassbookPassWithURL___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "nativeObject");
  return objc_msgSend(v2, "_loadPassbookPassWithURL:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *(_QWORD *)(a1 + 40)));
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  objc_msgSend(-[SUScriptObject webThreadMainThreadBatchProxy](self, "webThreadMainThreadBatchProxy"), "dismissViewControllerAnimated:completion:", a3, a4);
}

- (void)dismissModalViewControllerAnimated:(BOOL)a3
{
  objc_msgSend(-[SUScriptObject webThreadMainThreadBatchProxy](self, "webThreadMainThreadBatchProxy"), "_dismissModalViewControllerAnimated:", a3);
}

- (void)dismissModalViewControllerWithTransition:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_6:
    objc_msgSend(-[SUScriptObject webThreadMainThreadBatchProxy](self, "webThreadMainThreadBatchProxy"), "_dismissModalViewControllerWithTransition:", v5);
    return;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (!a3)
    goto LABEL_6;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_6;
  objc_opt_class();
  v5 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

- (void)presentModalViewController:(id)a3 withTransition:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
    objc_msgSend(-[SUScriptObject webThreadMainThreadBatchProxy](self, "webThreadMainThreadBatchProxy"), "_presentModalViewController:withTransition:", a3, a4);
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

- (void)runScrollTest:(id)a3 withDelta:(float)a4 forIterations:(int)a5
{
  WebThreadRunOnMainThread();
}

uint64_t __64__SUScriptViewController_runScrollTest_withDelta_forIterations___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;

  v2 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "view"), "firstScrollViewDescendant");
  LODWORD(v3) = *(_DWORD *)(a1 + 48);
  return objc_msgSend(v2, "runScrollTest:withDelta:forIterations:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 52), v3);
}

- (void)setToolbarItems:(id)a3 animated:(BOOL)a4
{
  id v6;
  char isKindOfClass;
  uint64_t v8;
  void *v9;
  NSArray *scriptToolbarItems;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v6 = 0;
    if (a3)
    {
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        v6 = a3;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v20 = (void *)MEMORY[0x24BDFA950];
          goto LABEL_24;
        }
      }
    }
  }
  v8 = objc_msgSend(v6, "copyArrayValueWithValidator:context:", SUISAValidator, objc_opt_class());
  if (!v8)
  {
    v20 = (void *)MEMORY[0x24BDFA950];
LABEL_24:
    objc_msgSend(v20, "throwException:", CFSTR("Invalid argument"));
    return;
  }
  v9 = (void *)v8;
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  v25 = 0u;
  scriptToolbarItems = self->_scriptToolbarItems;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](scriptToolbarItems, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(scriptToolbarItems);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "setVisible:", 0);
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](scriptToolbarItems, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v12);
  }

  v15 = (NSArray *)objc_msgSend(v9, "copy");
  self->_scriptToolbarItems = v15;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "setVisible:", 1);
      }
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v17);
  }
  WebThreadRunOnMainThread();

}

void __51__SUScriptViewController_setToolbarItems_animated___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "clientInterface"), "appearance");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(void **)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "nativeButtonOfType:", 1);
        if (v9)
        {
          v10 = v9;
          objc_msgSend(v3, "styleBarButtonItem:", v9);
          objc_msgSend(v2, "addObject:", v10);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "setToolbarItems:animated:", v2, *(unsigned __int8 *)(a1 + 48));

}

- (NSString)contextDictionary
{
  NSString *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  uint64_t v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3052000000;
  v7 = __Block_byref_object_copy__12;
  v8 = __Block_byref_object_dispose__12;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (NSString *)(id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __43__SUScriptViewController_contextDictionary__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "nativeViewController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = (id)objc_msgSend(v2, "copyScriptProperties");
    v3 = objc_msgSend(v5, "contextDictionary");
    if (v3)
    {
      v4 = objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v3, 0, 0);
      if (v4)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
    }

  }
}

- (id)backgroundColor
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__12;
  v12 = __Block_byref_object_dispose__12;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __41__SUScriptViewController_backgroundColor__block_invoke, &unk_24DE7BE08, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __41__SUScriptViewController_backgroundColor__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "nativeViewController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)objc_msgSend(v2, "copyScriptProperties");
    v4 = (id)objc_msgSend(v3, "backgroundColor");

    if (!v4)
      return;
LABEL_6:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = [SUScriptColor alloc];
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 40), "initWithUIColor:", v4);
    return;
  }
  if (objc_msgSend(v2, "isViewLoaded"))
  {
    v4 = (id)objc_msgSend((id)objc_msgSend(v2, "view"), "backgroundColor");
    if (v4)
      goto LABEL_6;
  }
}

- (id)_className
{
  return CFSTR("iTunesViewController");
}

- (SUScriptViewController)inputAccessoryViewController
{
  void *v3;
  SUScriptViewController *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__12;
  v12 = __Block_byref_object_dispose__12;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  if (v9[5])
  {
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v6, 3221225472, __54__SUScriptViewController_inputAccessoryViewController__block_invoke, &unk_24DE7BE08, self, &v8);
    v3 = (void *)v9[5];
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __54__SUScriptViewController_inputAccessoryViewController__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "nativeViewController");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    result = objc_msgSend((id)objc_msgSend(v2, "inputAccessoryViewController"), "copyScriptViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (NSString)modalPresentationStyle
{
  NSString *v3;
  NSString *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  if ((unint64_t)(v9[3] - 1) >= 2)
    v3 = -[SUScriptViewController modalPresentationStyleNameFullScreen](self, "modalPresentationStyleNameFullScreen", v6, 3221225472, __48__SUScriptViewController_modalPresentationStyle__block_invoke, &unk_24DE7BE30, self, &v8);
  else
    v3 = -[SUScriptViewController modalPresentationStyleNameFormSheet](self, "modalPresentationStyleNameFormSheet", v6, 3221225472, __48__SUScriptViewController_modalPresentationStyle__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __48__SUScriptViewController_modalPresentationStyle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "modalPresentationStyle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (SUScriptViewController)modalViewController
{
  void *v3;
  SUScriptViewController *v4;
  SUScriptViewController *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  SUScriptViewController *v11;
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
  v16 = __Block_byref_object_copy__12;
  v17 = __Block_byref_object_dispose__12;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __45__SUScriptViewController_modalViewController__block_invoke;
  v10 = &unk_24DE7BE30;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __45__SUScriptViewController_modalViewController__block_invoke, &unk_24DE7BE30, v11, &v13), (v3 = (void *)v14[5]) != 0))
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

void __45__SUScriptViewController_modalViewController__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "presentedViewController"), "copyScriptViewController");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
  v11 = a1;
  v3 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "invocationBatch:", 0), "copyQueuedInvocationsForObject:", *(_QWORD *)(a1 + 32));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        v9 = (const char *)objc_msgSend(v8, "selector");
        if (sel_isEqual(v9, sel__dismissModalViewControllerAnimated_)
          || sel_isEqual(v9, sel__dismissModalViewControllerWithTransition_))
        {
          objc_msgSend(v2, "removeLastObject");
        }
        else if (sel_isEqual(v9, sel__presentModalViewController_withTransition_))
        {
          v12 = 0;
          objc_msgSend(v8, "getArgument:atIndex:", &v12, 2);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v2, "addObject:", v12);
        }
        ++v7;
      }
      while (v5 != v7);
      v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v5 = v10;
    }
    while (v10);
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v11 + 40) + 8) + 40) = (id)objc_msgSend(v2, "lastObject");
}

- (SUScriptNavigationController)navigationController
{
  void *v3;
  SUScriptNavigationController *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__12;
  v12 = __Block_byref_object_dispose__12;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  if (v9[5])
  {
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v6, 3221225472, __46__SUScriptViewController_navigationController__block_invoke, &unk_24DE7BE08, self, &v8);
    v3 = (void *)v9[5];
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __46__SUScriptViewController_navigationController__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "navigationController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(v2, "copyScriptViewController");
  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) == 0)
  {

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_alloc_init(SUScriptNavigationController);
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setNativeViewController:", v2);
  }
  return result;
}

- (SUScriptNavigationItem)navigationItem
{
  void *v2;
  SUScriptNavigationItem *v3;
  SUScriptNavigationItem *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__12;
  v12 = __Block_byref_object_dispose__12;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (SUScriptNavigationItem *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __40__SUScriptViewController_navigationItem__block_invoke, &unk_24DE7BE08, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __40__SUScriptViewController_navigationItem__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "navigationItemForScriptInterface");
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[SUScriptNavigationItem initWithNativeNavigationItem:]([SUScriptNavigationItem alloc], "initWithNativeNavigationItem:", result);
    return objc_msgSend(*(id *)(a1 + 32), "checkInScriptObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  return result;
}

- (SUScriptPopOver)popOver
{
  void *v3;
  SUScriptPopOver *v4;
  SUScriptPopOver *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  SUScriptViewController *v11;
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
  v16 = __Block_byref_object_copy__12;
  v17 = __Block_byref_object_dispose__12;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __33__SUScriptViewController_popOver__block_invoke;
  v10 = &unk_24DE7BE08;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __33__SUScriptViewController_popOver__block_invoke, &unk_24DE7BE08, v11, &v13), (v3 = (void *)v14[5]) != 0))
  {
    v4 = v3;
  }
  else
  {
    v4 = (SUScriptPopOver *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v7, v8, v9, v10, v11, v12);
  }
  v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __33__SUScriptViewController_popOver__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "_popoverController"), "copyScriptPopOver");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (SUScriptViewController)presentingViewController
{
  void *v3;
  SUScriptViewController *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__12;
  v12 = __Block_byref_object_dispose__12;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  if (v9[5])
  {
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v6, 3221225472, __50__SUScriptViewController_presentingViewController__block_invoke, &unk_24DE7BE30, self, &v8);
    v3 = (void *)v9[5];
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __50__SUScriptViewController_presentingViewController__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "presentingViewController"), "copyScriptViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (SUScriptSection)section
{
  void *v2;
  SUScriptSection *v3;
  SUScriptSection *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__12;
  v12 = __Block_byref_object_dispose__12;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (SUScriptSection *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __33__SUScriptViewController_section__block_invoke, &unk_24DE7BE08, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

SUScriptSection *__33__SUScriptViewController_section__block_invoke(uint64_t a1)
{
  SUScriptSection *result;

  result = (SUScriptSection *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "section");
  if (result)
  {
    result = -[SUScriptSection initWithNativeSection:]([SUScriptSection alloc], "initWithNativeSection:", result);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  id v3;
  void *v4;

  v3 = -[SUScriptViewController newScriptColorWithValue:](self, "newScriptColorWithValue:", a3);
  if (v3)
  {
    v4 = v3;
    WebThreadRunOnMainThread();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

void __45__SUScriptViewController_setBackgroundColor___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "nativeViewController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (id)objc_msgSend(v2, "copyScriptProperties");
    objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(*(id *)(a1 + 40), "nativeColor"));
    objc_msgSend(v2, "setScriptProperties:", v3);

  }
  else if (objc_msgSend(v2, "isViewLoaded"))
  {
    objc_msgSend((id)objc_msgSend(v2, "view"), "setBackgroundColor:", objc_msgSend(*(id *)(a1 + 40), "nativeColor"));
  }
}

- (void)setInputAccessoryViewController:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __58__SUScriptViewController_setInputAccessoryViewController___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "nativeViewController");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(v2, "setInputAccessoryViewController:", objc_msgSend(*(id *)(a1 + 40), "nativeViewController"));
  return result;
}

- (void)setModalPresentationStyle:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_6:
    objc_msgSend(v5, "isEqualToString:", -[SUScriptViewController modalPresentationStyleNameFormSheet](self, "modalPresentationStyleNameFormSheet"));
    WebThreadRunOnMainThread();
    return;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (!a3)
    goto LABEL_6;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_6;
  objc_opt_class();
  v5 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

uint64_t __52__SUScriptViewController_setModalPresentationStyle___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
  if (result == 1)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "setModalPresentationStyle:", 2);
  return result;
}

uint64_t __52__SUScriptViewController_setModalPresentationStyle___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "setModalPresentationStyle:", 0);
}

- (void)setSection:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

uint64_t __37__SUScriptViewController_setSection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "nativeViewController");
  v3 = (void *)objc_msgSend(v2, "tabBarController");
  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend(v3, "pushTransientViewController:onSectionWithIdentifier:", v2, objc_msgSend(*(id *)(a1 + 40), "identifier"));
  return result;
}

- (void)setShowsLibraryButton:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

uint64_t __48__SUScriptViewController_setShowsLibraryButton___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "nativeViewController");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(v2, "setShowsLibraryButton:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
  return result;
}

- (void)setToolbarItems:(id)a3
{
  -[SUScriptViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", a3, 0);
}

- (void)setTopBackgroundColor:(id)a3
{
  id v3;
  void *v4;

  v3 = -[SUScriptViewController newScriptColorWithValue:](self, "newScriptColorWithValue:", a3);
  if (v3)
  {
    v4 = v3;
    WebThreadRunOnMainThread();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

void __48__SUScriptViewController_setTopBackgroundColor___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "nativeViewController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (id)objc_msgSend(v2, "copyScriptProperties");
    objc_msgSend(v3, "setTopExtensionColor:", objc_msgSend(*(id *)(a1 + 40), "nativeColor"));
    objc_msgSend(v2, "setScriptProperties:", v3);

  }
}

- (void)setTransientViewController:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __53__SUScriptViewController_setTransientViewController___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "nativeViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v2 = (void *)objc_msgSend(v2, "tabBarController");
  return objc_msgSend(v2, "setTransientViewController:", objc_msgSend(*(id *)(a1 + 40), "nativeViewController"));
}

- (void)setUsesBlurredBackground:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

void __51__SUScriptViewController_setUsesBlurredBackground___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "nativeViewController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (id)objc_msgSend(v2, "copyScriptProperties");
    objc_msgSend(v3, "setUsesBlurredBackground:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
    objc_msgSend(v2, "setScriptProperties:", v3);

  }
}

- (id)showsLibraryButton
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

uint64_t __44__SUScriptViewController_showsLibraryButton__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "nativeViewController");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    result = objc_msgSend(v2, "showsLibraryButton");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (SUScriptSplitViewController)splitViewController
{
  void *v3;
  SUScriptSplitViewController *v4;
  SUScriptSplitViewController *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  SUScriptViewController *v11;
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
  v16 = __Block_byref_object_copy__12;
  v17 = __Block_byref_object_dispose__12;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __45__SUScriptViewController_splitViewController__block_invoke;
  v10 = &unk_24DE7BE30;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __45__SUScriptViewController_splitViewController__block_invoke, &unk_24DE7BE30, v11, &v13), (v3 = (void *)v14[5]) != 0))
  {
    v4 = v3;
  }
  else
  {
    v4 = (SUScriptSplitViewController *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v7, v8, v9, v10, v11, v12);
  }
  v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

void __45__SUScriptViewController_splitViewController__block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "storeSplitViewController"), "copyScriptViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = 0;
  }
}

- (id)toolbarItems
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  WebThreadRunOnMainThread();
  return v2;
}

uint64_t __38__SUScriptViewController_toolbarItems__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SUScriptButton *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "toolbarItems");
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
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        v8 = objc_alloc_init(SUScriptButton);
        -[SUScriptButton setNativeButton:](v8, "setNativeButton:", v7);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

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

- (id)topBackgroundColor
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__12;
  v12 = __Block_byref_object_dispose__12;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __44__SUScriptViewController_topBackgroundColor__block_invoke, &unk_24DE7BE08, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __44__SUScriptViewController_topBackgroundColor__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "nativeViewController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)objc_msgSend(v2, "copyScriptProperties");
    v4 = (id)objc_msgSend(v3, "topExtensionColor");

    if (v4)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = [SUScriptColor alloc];
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 40), "initWithUIColor:", v4);
    }
  }
}

- (SUScriptViewController)transientViewController
{
  void *v3;
  SUScriptViewController *v4;
  SUScriptViewController *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  SUScriptViewController *v11;
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
  v16 = __Block_byref_object_copy__12;
  v17 = __Block_byref_object_dispose__12;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __49__SUScriptViewController_transientViewController__block_invoke;
  v10 = &unk_24DE7BE08;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __49__SUScriptViewController_transientViewController__block_invoke, &unk_24DE7BE08, v11, &v13), (v3 = (void *)v14[5]) != 0))
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

uint64_t __49__SUScriptViewController_transientViewController__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "nativeViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v2 = (void *)objc_msgSend(v2, "tabBarController");
  result = objc_msgSend((id)objc_msgSend(v2, "transientViewController"), "copyScriptViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)usesBlurredBackground
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

void __47__SUScriptViewController_usesBlurredBackground__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "nativeViewController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (id)objc_msgSend(v2, "copyScriptProperties");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "usesBlurredBackground");

  }
}

- (id)wantsFullScreenLayout
{
  return (id)*MEMORY[0x24BDBD268];
}

- (NSString)modalPresentationStyleNameFormSheet
{
  return (NSString *)CFSTR("formsheet");
}

- (NSString)modalPresentationStyleNameFullScreen
{
  return (NSString *)CFSTR("fullscreen");
}

- (void)_dismissModalViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  UIViewController *v5;
  UITabBarController *v6;
  SUClientInterface *v7;
  UIViewController *v8;
  void *v9;

  v3 = a3;
  v5 = -[SUScriptViewController nativeViewController](self, "nativeViewController");
  v6 = -[UIViewController tabBarController](v5, "tabBarController");
  if (-[UITabBarController transientViewController](v6, "transientViewController")
    && -[UIViewController isDescendantOfViewController:](v5, "isDescendantOfViewController:", -[UITabBarController transientViewController](v6, "transientViewController")))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", v6), "setTransientViewController:animated:", 0, v3);
  }
  else
  {
    v7 = -[SUScriptObject clientInterface](self, "clientInterface");
    if (v5)
    {
      v8 = v5;
      while (1)
      {
        NSSelectorFromString(CFSTR("embeddedParent"));
        if ((objc_opt_respondsToSelector() & 1) != 0)
          break;
        v8 = -[UIViewController parentViewController](v8, "parentViewController");
        if (!v8)
        {
          v8 = v5;
          break;
        }
      }
    }
    else
    {
      v8 = 0;
    }
    v9 = (void *)objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", v8);
    if (v7)
      -[SUClientInterface _dismissViewControllerFromViewController:animated:completion:](v7, "_dismissViewControllerFromViewController:animated:completion:", v9, v3, 0);
    else
      objc_msgSend(v9, "dismissViewControllerAnimated:completion:", v3, 0);
  }
}

- (void)_dismissModalViewControllerWithTransition:(id)a3
{
  SUClientInterface *v5;
  void *v6;
  uint64_t v7;

  v5 = -[SUScriptObject clientInterface](self, "clientInterface");
  v6 = (void *)objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", -[SUScriptViewController nativeViewController](self, "nativeViewController"));
  v7 = -[SUScriptViewController _transitionForString:](self, "_transitionForString:", a3);
  if (v5)
    -[SUClientInterface _dismissModalViewControllerFromViewController:withTransition:](v5, "_dismissModalViewControllerFromViewController:withTransition:", v6, v7);
  else
    objc_msgSend(v6, "dismissModalViewControllerWithTransition:", v7);
}

- (void)_presentModalViewController:(id)a3 withTransition:(id)a4
{
  UIViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  void *v20;
  SUClientInterface *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[9];
  int v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = -[SUScriptViewController nativeViewController](self, "nativeViewController");
  if (-[UIViewController parentViewController](v7, "parentViewController"))
  {
    v8 = (void *)objc_msgSend(a3, "nativeViewController");
    if (v8)
    {
      v9 = v8;
      if (objc_msgSend(v8, "presentingViewController"))
      {
        v10 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v11 = objc_msgSend(v10, "shouldLog");
        if (objc_msgSend(v10, "shouldLogToDisk"))
          v12 = v11 | 2;
        else
          v12 = v11;
        if (!os_log_type_enabled((os_log_t)objc_msgSend(v10, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
          v12 &= 2u;
        if (v12)
        {
LABEL_24:
          v28 = 138412546;
          v29 = -[SUScriptViewController _className](self, "_className");
          v30 = 2112;
          v31 = a3;
          LODWORD(v25) = 22;
          v19 = _os_log_send_and_compose_impl();
          if (v19)
          {
            v20 = (void *)v19;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, &v28, v25);
            free(v20);
            SSFileLog();
          }
        }
      }
      else
      {
        v21 = -[SUScriptObject clientInterface](self, "clientInterface");
        v22 = objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", v7);
        v23 = MEMORY[0x24BDAC760];
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __69__SUScriptViewController__presentModalViewController_withTransition___block_invoke;
        v27[3] = &unk_24DE7C5F8;
        v27[4] = v21;
        v27[5] = v9;
        v27[6] = v22;
        v27[7] = self;
        v27[8] = a4;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (v24 = (void *)objc_msgSend(v9, "firstViewController"),
              objc_opt_class(),
              (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v9, "setNavigationBarHidden:", 1);
          v26[0] = v23;
          v26[1] = 3221225472;
          v26[2] = __69__SUScriptViewController__presentModalViewController_withTransition___block_invoke_2;
          v26[3] = &unk_24DE7C620;
          v26[4] = v27;
          objc_msgSend(v24, "prepareWithCompletionBlock:", v26);
        }
        else
        {
          __69__SUScriptViewController__presentModalViewController_withTransition___block_invoke((uint64_t)v27);
        }
      }
    }
    else
    {
      v16 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v17 = objc_msgSend(v16, "shouldLog");
      if (objc_msgSend(v16, "shouldLogToDisk"))
        v18 = v17 | 2;
      else
        v18 = v17;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v16, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v18 &= 2u;
      if (v18)
        goto LABEL_24;
    }
  }
  else
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v14 = objc_msgSend(v13, "shouldLog");
    if (objc_msgSend(v13, "shouldLogToDisk"))
      v15 = v14 | 2;
    else
      v15 = v14;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v13, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v15 &= 2u;
    if (v15)
      goto LABEL_24;
  }
}

uint64_t __69__SUScriptViewController__presentModalViewController_withTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  if (v2)
    return objc_msgSend(v2, "_presentViewController:fromViewController:withTransition:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(v3, "_transitionForString:", v4));
  else
    return objc_msgSend(*(id *)(a1 + 48), "presentModalViewController:withTransition:", *(_QWORD *)(a1 + 40), objc_msgSend(v3, "_transitionForString:", v4));
}

uint64_t __69__SUScriptViewController__presentModalViewController_withTransition___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (int)_transitionForString:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("show-sheet")) & 1) != 0)
    return 8;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("hide-sheet")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("reveal-down")) & 1) != 0)
  {
    return 9;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("cover-up")) & 1) != 0)
    return 8;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("flip-from-left")) & 1) != 0)
    return 10;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("flip-from-right")) & 1) != 0)
    return 11;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("cross-dissolve")))
    return 6;
  return 0;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_20, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_15, 7);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptViewController;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_20, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_15 = (uint64_t)sel_addPassbookPassWithURL_;
    unk_255186320 = CFSTR("addPassbookPassWithURL");
    qword_255186328 = (uint64_t)sel_dismissModalViewControllerWithTransition_;
    unk_255186330 = CFSTR("dismissModalViewController");
    qword_255186338 = (uint64_t)sel_presentModalViewController_withTransition_;
    unk_255186340 = CFSTR("presentModalViewController");
    qword_255186348 = (uint64_t)sel_runScrollTest_withDelta_forIterations_;
    unk_255186350 = CFSTR("runScrollTest");
    qword_255186358 = (uint64_t)sel_setToolbarItems_animated_;
    unk_255186360 = CFSTR("setToolbarItems");
    qword_255186368 = (uint64_t)sel_dismissVolumeViewControllerAnimated_;
    unk_255186370 = CFSTR("dismissVolumeViewController");
    qword_255186378 = (uint64_t)sel_presentVolumeViewController_animated_;
    unk_255186380 = CFSTR("presentVolumeViewController");
    __KeyMapping_20 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("backgroundColor"), CFSTR("clientContext"), CFSTR("contextDictionary"), CFSTR("inputAccessoryViewController"), CFSTR("inputAccessoryViewController"), CFSTR("modalPresentationStyle"), CFSTR("modalPresentationStyle"), CFSTR("modalViewController"), CFSTR("modalViewController"), CFSTR("navigationController"), CFSTR("navigationController"), CFSTR("navigationItem"), CFSTR("navigationItem"), CFSTR("popOver"), CFSTR("popOver"), CFSTR("presentingViewController"), CFSTR("presentingViewController"),
                        CFSTR("section"),
                        CFSTR("section"),
                        CFSTR("showsLibraryButton"),
                        CFSTR("showsLibraryButton"),
                        CFSTR("splitViewController"),
                        CFSTR("splitViewController"),
                        CFSTR("toolbarItems"),
                        CFSTR("toolbarItems"),
                        CFSTR("topBackgroundColor"),
                        CFSTR("topBackgroundColor"),
                        CFSTR("transientViewController"),
                        CFSTR("transientViewController"),
                        CFSTR("wantsFullScreenLayout"),
                        CFSTR("wantsFullScreenLayout"),
                        CFSTR("usesBlurredBackground"),
                        CFSTR("usesBlurredBackground"),
                        CFSTR("volumeViewController"),
                        CFSTR("volumeViewController"),
                        CFSTR("MODAL_FORM_SHEET"),
                        CFSTR("modalPresentationStyleNameFormSheet"),
                        CFSTR("MODAL_FULL_SCREEN"),
                        CFSTR("modalPresentationStyleNameFullScreen"),
                        0);
  }
}

- (SUScriptViewController)volumeViewController
{
  void *v3;
  SUScriptViewController *v4;
  SUScriptViewController *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  SUScriptViewController *v11;
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
  v16 = __Block_byref_object_copy__32;
  v17 = __Block_byref_object_dispose__32;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __75__SUScriptViewController_SUScriptVolumeViewAdditions__volumeViewController__block_invoke;
  v10 = &unk_24DE7BE08;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __75__SUScriptViewController_SUScriptVolumeViewAdditions__volumeViewController__block_invoke, &unk_24DE7BE08, v11, &v13), (v3 = (void *)v14[5]) != 0))
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

uint64_t __75__SUScriptViewController_SUScriptVolumeViewAdditions__volumeViewController__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_parentViewControllerForVolumeViewController"), "footerViewController"), "copyScriptViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)dismissVolumeViewControllerAnimated:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0)
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __91__SUScriptViewController_SUScriptVolumeViewAdditions__dismissVolumeViewControllerAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  void *v4;
  int v5;
  int v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_parentViewControllerForVolumeViewController");
  if (objc_msgSend(v2, "footerViewController"))
    return objc_msgSend(v2, "dismissFooterViewControllerAnimated:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
  v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  result = os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_DEFAULT);
  if (!(_DWORD)result)
    v6 &= 2u;
  if (v6)
  {
    v9 = 138412290;
    v10 = objc_opt_class();
    LODWORD(v8) = 12;
    result = _os_log_send_and_compose_impl();
    if (result)
    {
      v7 = (void *)result;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", result, 4, &v9, v8);
      free(v7);
      return SSFileLog();
    }
  }
  return result;
}

- (void)presentVolumeViewController:(id)a3 animated:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (!a4 || (objc_opt_respondsToSelector() & 1) != 0))
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

void *__92__SUScriptViewController_SUScriptVolumeViewAdditions__presentVolumeViewController_animated___block_invoke(id *a1)
{
  void *result;

  result = (void *)objc_msgSend(a1[4], "_parentViewControllerForVolumeViewController");
  if (result)
    return (void *)objc_msgSend(result, "presentFooterViewController:animated:", objc_msgSend(a1[5], "nativeViewController"), objc_msgSend(a1[6], "BOOLValue"));
  return result;
}

- (id)_parentViewControllerForVolumeViewController
{
  UIViewController *v2;

  v2 = -[SUScriptViewController nativeViewController](self, "nativeViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = (UIViewController *)-[UIViewController selectedNavigationController](v2, "selectedNavigationController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = (UIViewController *)-[UIViewController topViewController](v2, "topViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

@end
