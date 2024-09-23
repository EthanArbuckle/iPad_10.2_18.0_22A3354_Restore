@implementation SUScriptPopOver

- (SUScriptPopOver)init
{
  SUScriptPopOver *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptPopOver;
  v2 = -[SUScriptObject init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__overlayWillShowNotification_, CFSTR("SUOverlayWillShowNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__viewControllerDidDismiss_, CFSTR("SUViewControllerDidDisappearNotification"), 0);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUOverlayWillShowNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUViewControllerDidDisappearNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)SUScriptPopOver;
  -[SUScriptObject dealloc](&v4, sel_dealloc);
}

- (UIViewController)activeViewController
{
  UIViewController *v2;

  v2 = -[SUScriptNativeObject object](-[SUScriptObject nativeObject](self, "nativeObject"), "object");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = (UIViewController *)-[UIViewController contentViewController](v2, "contentViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (UIPopoverController)nativePopoverController
{
  UIPopoverController *v2;

  v2 = -[SUScriptNativeObject object](-[SUScriptObject nativeObject](self, "nativeObject"), "object");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (void)setNativePopoverController:(id)a3
{
  id v5;
  id v6;
  SUScriptPopOverNativeObject *v7;
  id AssociatedObject;

  v5 = -[SUScriptObject parentViewController](self, "parentViewController");
  v6 = v5;
  if (a3)
  {
    if (v5)
      objc_setAssociatedObject(a3, "SUScriptPopOverPresentingViewController", (id)objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", v5), (void *)1);
    v7 = +[SUScriptNativeObject objectWithNativeObject:](SUScriptPopOverNativeObject, "objectWithNativeObject:", a3);
  }
  else
  {
    AssociatedObject = objc_getAssociatedObject(-[SUScriptNativeObject object](-[SUScriptObject nativeObject](self, "nativeObject"), "object"), "SUScriptPopOverPresentingViewController");
    if ((id)objc_msgSend(AssociatedObject, "object") == v6 || !objc_msgSend(AssociatedObject, "object"))
      objc_setAssociatedObject(0, "SUScriptPopOverPresentingViewController", 0, (void *)1);
    v7 = 0;
  }
  -[SUScriptObject setNativeObject:](self, "setNativeObject:", v7);
}

- (BOOL)isVisible
{
  id v2;

  v2 = -[SUScriptNativeObject object](-[SUScriptObject nativeObject](self, "nativeObject"), "object");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(v2, "isPopoverVisible");
  else
    return 0;
}

- (void)tearDownUserInterface
{
  objc_super v3;

  if (-[SUScriptPopOver isVisible](self, "isVisible"))
    -[SUScriptPopOver _dismissAnimated:](self, "_dismissAnimated:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptPopOver;
  -[SUScriptObject tearDownUserInterface](&v3, sel_tearDownUserInterface);
}

- (void)dismissAnimated:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_6:
    objc_msgSend(-[SUScriptObject webThreadMainThreadBatchProxy](self, "webThreadMainThreadBatchProxy"), "_dismissAnimated:", objc_msgSend(v5, "BOOLValue"));
    return;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (!a3)
    goto LABEL_6;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_6;
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

- (void)setContentWidth:(double)a3 height:(double)a4 animated:(BOOL)a5
{
  WebThreadRunOnMainThread();
}

uint64_t __51__SUScriptPopOver_setContentWidth_height_animated___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_shouldDisplayAsPopover");
  if ((_DWORD)result)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_popOverController"), "setPopoverContentSize:animated:", *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
  return result;
}

- (BOOL)showFromElement:(id)a3
{
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
    return 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid element"));
    return 0;
  }
}

uint64_t __35__SUScriptPopOver_showFromElement___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  uint64_t result;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  SUScrollViewScroller *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  _QWORD v23[8];
  int v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "_isViewControllerVisible"))
  {
    v2 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = objc_msgSend(v2, "shouldLog");
    if (objc_msgSend(v2, "shouldLogToDisk"))
      v4 = v3 | 2;
    else
      v4 = v3;
    result = os_log_type_enabled((os_log_t)objc_msgSend(v2, "OSLogObject"), OS_LOG_TYPE_INFO);
    if (!(_DWORD)result)
      v4 &= 2u;
    if (v4)
    {
      v24 = 138412290;
      v25 = objc_opt_class();
      LODWORD(v22) = 12;
      result = _os_log_send_and_compose_impl();
      if (result)
      {
        v6 = (void *)result;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", result, 4, &v24, v22);
        free(v6);
        return SSFileLog();
      }
    }
  }
  else
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "_shouldDisplayAsPopover");
    v8 = *(void **)(a1 + 32);
    if ((v7 & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "DOMElementWithElement:", *(_QWORD *)(a1 + 40));
      v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "nativeObject");
      objc_msgSend(v10, "setSourceButtonItem:", 0);
      objc_msgSend(v10, "setSourceDOMElement:", v9);
      v11 = objc_alloc_init(SUScrollViewScroller);
      v12 = (void *)objc_msgSend(v9, "webView");
      v13 = (void *)objc_msgSend(v12, "scrollView");
      objc_msgSend(v9, "frame");
      objc_msgSend(v13, "convertRect:fromView:", 0);
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      -[SUScrollViewScroller attachToScrollView:](v11, "attachToScrollView:", v13);
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __35__SUScriptPopOver_showFromElement___block_invoke_27;
      v23[3] = &unk_24DE7BEF0;
      v23[4] = v12;
      v23[5] = v9;
      v23[6] = *(_QWORD *)(a1 + 32);
      v23[7] = v11;
      -[SUScrollViewScroller scrollFrameToVisible:animated:completionBlock:](v11, "scrollFrameToVisible:animated:completionBlock:", 1, v23, v15, v17, v19, v21);

    }
    else
    {
      objc_msgSend(v8, "_showAsModalViewController");
    }
    objc_msgSend(*(id *)(a1 + 32), "setVisible:", 1);
    return objc_msgSend(*(id *)(a1 + 32), "dispatchEvent:forName:", 0, CFSTR("show"));
  }
  return result;
}

uint64_t __35__SUScriptPopOver_showFromElement___block_invoke_27(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "frame");
  objc_msgSend(v2, "convertRect:fromView:", 0);
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "_presentablePopoverController"), "presentPopoverFromRect:inView:permittedArrowDirections:animated:", *(_QWORD *)(a1 + 32), 15, 1, v3, v4, v5, v6);
  return objc_msgSend(*(id *)(a1 + 56), "detachFromScrollView");
}

- (BOOL)showFromNavigationItem:(id)a3
{
  if (a3 && (objc_msgSend(a3, "conformsToProtocol:", &unk_2551CCDD0) & 1) != 0)
  {
    WebThreadRunOnMainThread();
    return 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid navigation item"));
    return 0;
  }
}

uint64_t __42__SUScriptPopOver_showFromNavigationItem___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  uint64_t result;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "_isViewControllerVisible"))
  {
    v2 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = objc_msgSend(v2, "shouldLog");
    if (objc_msgSend(v2, "shouldLogToDisk"))
      v4 = v3 | 2;
    else
      v4 = v3;
    result = os_log_type_enabled((os_log_t)objc_msgSend(v2, "OSLogObject"), OS_LOG_TYPE_INFO);
    if (!(_DWORD)result)
      v4 &= 2u;
    if (v4)
    {
      v10 = 138412290;
      v11 = objc_opt_class();
      LODWORD(v9) = 12;
      result = _os_log_send_and_compose_impl();
      if (result)
      {
        v6 = (void *)result;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", result, 4, &v10, v9);
        free(v6);
        return SSFileLog();
      }
    }
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "parentViewController");
    if (result)
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "_shouldDisplayAsPopover") & 1) != 0)
      {
        v7 = objc_msgSend(*(id *)(a1 + 40), "buttonItem");
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_presentablePopoverController"), "presentPopoverFromBarButtonItem:permittedArrowDirections:animated:", v7, 15, 1);
        v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "nativeObject");
        objc_msgSend(v8, "setSourceButtonItem:", v7);
        objc_msgSend(v8, "setSourceDOMElement:", 0);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_showAsModalViewController");
      }
      objc_msgSend(*(id *)(a1 + 32), "setVisible:", 1);
      return objc_msgSend(*(id *)(a1 + 32), "dispatchEvent:forName:", 0, CFSTR("show"));
    }
  }
  return result;
}

- (int64_t)backgroundStyle
{
  int64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  WebThreadRunOnMainThread();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __34__SUScriptPopOver_backgroundStyle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_popOverController"), "_popoverBackgroundStyle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_className
{
  return CFSTR("iTunesPopOver");
}

- (double)contentHeight
{
  double v2;
  uint64_t v4;
  double *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = (double *)&v4;
  v6 = 0x2020000000;
  v7 = 0;
  WebThreadRunOnMainThread();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __32__SUScriptPopOver_contentHeight__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  if (objc_msgSend(*(id *)(a1 + 32), "_shouldDisplayAsPopover"))
  {
    result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_popOverController"), "popoverContentSize");
  }
  else
  {
    result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
    v3 = v4;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)contentWidth
{
  double v2;
  uint64_t v4;
  double *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = (double *)&v4;
  v6 = 0x2020000000;
  v7 = 0;
  WebThreadRunOnMainThread();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __31__SUScriptPopOver_contentWidth__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  if (objc_msgSend(*(id *)(a1 + 32), "_shouldDisplayAsPopover"))
  {
    result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_popOverController"), "popoverContentSize");
  }
  else
  {
    result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
    v3 = v4;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
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
  v11 = __Block_byref_object_copy__4;
  v12 = __Block_byref_object_dispose__4;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  if (v9[5])
  {
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v6, 3221225472, __43__SUScriptPopOver_presentingViewController__block_invoke, &unk_24DE7BE08, self, &v8);
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

uint64_t __43__SUScriptPopOver_presentingViewController__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_popOverController");
  if (v2)
    v3 = (void *)objc_msgSend(objc_getAssociatedObject(v2, "SUScriptPopOverPresentingViewController"), "object");
  else
    v3 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeViewController"), "presentingViewController");
  result = objc_msgSend(v3, "copyScriptViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __38__SUScriptPopOver_setBackgroundStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_popOverController"), "_setPopoverBackgroundStyle:", *(_QWORD *)(a1 + 40));
}

- (void)setContentHeight:(double)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __36__SUScriptPopOver_setContentHeight___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_shouldDisplayAsPopover");
  if ((_DWORD)result)
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_popOverController");
    objc_msgSend(v3, "popoverContentSize");
    return objc_msgSend(v3, "setPopoverContentSize:animated:", 0);
  }
  return result;
}

- (void)setContentWidth:(double)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __35__SUScriptPopOver_setContentWidth___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_shouldDisplayAsPopover");
  if ((_DWORD)result)
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_popOverController");
    objc_msgSend(v3, "popoverContentSize");
    return objc_msgSend(v3, "setPopoverContentSize:animated:", 0, *(double *)(a1 + 40));
  }
  return result;
}

- (void)setViewController:(id)a3
{
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  else
    WebThreadRunOnMainThread();
}

uint64_t __37__SUScriptPopOver_setViewController___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t result;

  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldDisplayAsPopover") & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_setNativeViewController:", objc_msgSend(*(id *)(a1 + 40), "nativeViewController"));
  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "nativeViewController");
  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[9];
  if (v4 != v2)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = v2;
    v3 = *(_QWORD **)(a1 + 32);
  }
  v5 = (void *)objc_msgSend(v3, "_popOverController");
  result = objc_msgSend(v5, "isPopoverVisible");
  if ((_DWORD)result)
    return objc_msgSend(v5, "setContentViewController:", v2);
  return result;
}

- (SUScriptViewController)viewController
{
  void *v3;
  SUScriptViewController *v4;
  SUScriptViewController *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  SUScriptPopOver *v11;
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
  v16 = __Block_byref_object_copy__4;
  v17 = __Block_byref_object_dispose__4;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __33__SUScriptPopOver_viewController__block_invoke;
  v10 = &unk_24DE7BE08;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __33__SUScriptPopOver_viewController__block_invoke, &unk_24DE7BE08, v11, &v13), (v3 = (void *)v14[5]) != 0))
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

uint64_t __33__SUScriptPopOver_viewController__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_shouldDisplayAsPopover");
  v3 = *(void **)(a1 + 32);
  if (v2)
    v4 = (void *)objc_msgSend((id)objc_msgSend(v3, "_popOverController"), "contentViewController");
  else
    v4 = (void *)objc_msgSend(v3, "_nativeViewController");
  result = objc_msgSend(v4, "copyScriptViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (int64_t)backgroundStyleBlack
{
  return 3;
}

- (int64_t)backgroundStyleClear
{
  return 1;
}

- (int64_t)backgroundStyleCream
{
  return 2;
}

- (int64_t)backgroundStyleDefault
{
  return 0;
}

- (int64_t)backgroundStyleShare
{
  return 4;
}

- (void)_overlayWillShowNotification:(id)a3
{
  -[SUScriptPopOver _dismissAnimated:](self, "_dismissAnimated:", 0);
}

- (void)_viewControllerDidDismiss:(id)a3
{
  UIViewController *v4;

  v4 = (UIViewController *)objc_msgSend(a3, "object");
  if (v4 == -[SUScriptPopOver activeViewController](self, "activeViewController"))
  {
    if (!self->_ignoreDismiss)
    {
      -[SUScriptObject dispatchEvent:forName:](self, "dispatchEvent:forName:", 0, CFSTR("dismiss"));
      -[SUScriptObject setNativeObject:](self, "setNativeObject:", 0);
      -[SUScriptObject setVisible:](self, "setVisible:", 0);
    }
  }
  else if (-[SUScriptPopOver _shouldDisplayAsPopover](self, "_shouldDisplayAsPopover"))
  {
    if (objc_msgSend(-[SUScriptObject parentViewController](self, "parentViewController"), "isDescendantOfViewController:", v4))-[SUScriptPopOver _dismissAnimated:](self, "_dismissAnimated:", 0);
  }
}

- (void)_dismissAnimated:(BOOL)a3
{
  _BOOL8 v3;
  UIViewController *v5;

  v3 = a3;
  if (-[SUScriptPopOver _shouldDisplayAsPopover](self, "_shouldDisplayAsPopover"))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", -[SUScriptPopOver _popOverController](self, "_popOverController")), "dismissPopoverAnimated:", v3);
  }
  else
  {
    v5 = -[UIViewController parentViewController](-[SUScriptPopOver activeViewController](self, "activeViewController"), "parentViewController");
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", v5), "dismissViewControllerAnimated:completion:", v3, 0);
  }
  -[SUScriptObject setNativeObject:](self, "setNativeObject:", 0);
  -[SUScriptObject setVisible:](self, "setVisible:", 0);
}

- (id)_nativeViewController
{
  id v2;

  v2 = -[SUScriptNativeObject object](-[SUScriptObject nativeObject](self, "nativeObject"), "object");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (BOOL)_isViewControllerVisible
{
  id v3;

  if (-[SUScriptPopOver nativePopoverController](self, "nativePopoverController"))
  {
    LOBYTE(v3) = -[UIPopoverController isPopoverVisible](-[SUScriptPopOver nativePopoverController](self, "nativePopoverController"), "isPopoverVisible");
  }
  else
  {
    v3 = -[SUScriptPopOver _nativeViewController](self, "_nativeViewController");
    if (v3)
      LOBYTE(v3) = objc_msgSend(-[SUScriptPopOver _nativeViewController](self, "_nativeViewController"), "parentViewController") != 0;
  }
  return (char)v3;
}

- (id)_popOverController
{
  UIPopoverController *v3;
  id v4;
  UIPopoverController *v5;

  v3 = -[SUScriptPopOver nativePopoverController](self, "nativePopoverController");
  if (!v3)
  {
    if (-[SUScriptPopOver _shouldDisplayAsPopover](self, "_shouldDisplayAsPopover"))
    {
      v4 = objc_alloc_init(MEMORY[0x24BDF6F98]);
      objc_msgSend(v4, "setPreferredContentSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
      v3 = (UIPopoverController *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6CA0]), "initWithContentViewController:", v4);
      -[UIPopoverController _setPopoverBackgroundStyle:](v3, "_setPopoverBackgroundStyle:", 3);
      -[SUScriptPopOver setNativePopoverController:](self, "setNativePopoverController:", v3);
      v5 = v3;

    }
    else
    {
      return 0;
    }
  }
  return v3;
}

- (id)_presentablePopoverController
{
  id v3;
  void *v4;
  void *v5;

  v3 = -[SUScriptPopOver _popOverController](self, "_popOverController");
  v4 = v3;
  if (!self->_contentViewController
    || (UIViewController *)objc_msgSend(v3, "contentViewController") == self->_contentViewController)
  {
    return v4;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6CA0]), "initWithContentViewController:", self->_contentViewController);
  objc_msgSend(v5, "_setPopoverBackgroundStyle:", objc_msgSend(v4, "_popoverBackgroundStyle"));
  objc_msgSend(v4, "popoverContentSize");
  objc_msgSend(v5, "setPopoverContentSize:animated:", 0);
  -[SUScriptPopOver setNativePopoverController:](self, "setNativePopoverController:", v5);
  return v5;
}

- (void)_setIgnoresDismiss:(BOOL)a3
{
  self->_ignoreDismiss = a3;
}

- (void)_setNativeViewController:(id)a3
{
  if (a3)
    a3 = +[SUScriptNativeObject objectWithNativeObject:](SUScriptViewControllerNativeObject, "objectWithNativeObject:");
  -[SUScriptObject setNativeObject:](self, "setNativeObject:", a3);
}

- (BOOL)_shouldDisplayAsPopover
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1;
}

- (void)_showAsModalViewController
{
  id v3;
  id v4;
  id v5;
  SUNavigationController *v6;

  v3 = -[SUScriptObject parentViewController](self, "parentViewController");
  v4 = -[SUScriptPopOver _nativeViewController](self, "_nativeViewController");
  if (v3)
  {
    v5 = v4;
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v3, "presentViewController:animated:completion:", v5, 1, 0);
      }
      else
      {
        v6 = -[SUNavigationController initWithRootViewController:]([SUNavigationController alloc], "initWithRootViewController:", v5);
        -[SUNavigationController setClientInterface:](v6, "setClientInterface:", -[SUScriptObject clientInterface](self, "clientInterface"));
        objc_msgSend(v3, "presentViewController:animated:completion:", v6, 1, 0);

      }
    }
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_7, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptPopOver;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_5, 4);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptPopOver;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptPopOver;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_7, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_5 = (uint64_t)sel_dismissAnimated_;
    unk_255186060 = CFSTR("dismiss");
    qword_255186068 = (uint64_t)sel_setContentWidth_height_animated_;
    unk_255186070 = CFSTR("setContentSize");
    qword_255186078 = (uint64_t)sel_showFromElement_;
    unk_255186080 = CFSTR("showFromElement");
    qword_255186088 = (uint64_t)sel_showFromNavigationItem_;
    unk_255186090 = CFSTR("showFromNavigationItem");
    __KeyMapping_7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("backgroundStyle"), CFSTR("contentHeight"), CFSTR("contentHeight"), CFSTR("contentWidth"), CFSTR("contentWidth"), CFSTR("parentViewController"), CFSTR("presentingViewController"), CFSTR("viewController"), CFSTR("viewController"), CFSTR("BACKGROUND_STYLE_BLACK"), CFSTR("backgroundStyleBlack"), CFSTR("BACKGROUND_STYLE_CLEAR"), CFSTR("backgroundStyleClear"), CFSTR("BACKGROUND_STYLE_CREAM"), CFSTR("backgroundStyleCream"), CFSTR("BACKGROUND_STYLE_DEFAULT"), CFSTR("backgroundStyleDefault"),
                       CFSTR("BACKGROUND_STYLE_SHARE"),
                       CFSTR("backgroundStyleShare"),
                       0);
  }
}

@end
