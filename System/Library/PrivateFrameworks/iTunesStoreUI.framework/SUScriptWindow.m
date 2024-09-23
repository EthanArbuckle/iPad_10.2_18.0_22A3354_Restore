@implementation SUScriptWindow

- (SUScriptWindow)init
{
  SUScriptWindow *v2;
  SUScriptWindow *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptWindow;
  v2 = -[SUScriptObject init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_canSwipeToDismiss = 1;
    v2->_context = objc_alloc_init(SUScriptWindowContext);
    -[SUScriptWindow _registerForOverlayNotifications](v3, "_registerForOverlayNotifications");
  }
  return v3;
}

- (SUScriptWindow)initWithContext:(id)a3
{
  SUScriptWindow *v4;
  SUScriptWindow *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUScriptWindow;
  v4 = -[SUScriptObject init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_canSwipeToDismiss = 1;
    v4->_context = (SUScriptWindowContext *)a3;
    -[SUScriptWindow _registerForOverlayNotifications](v5, "_registerForOverlayNotifications");
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUOverlayDidDismissNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUOverlayDidFlipNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUOverlayDidShowNotification"), 0);

  -[SUScriptFunction setScriptObject:](self->_shouldDismissFunction, "setScriptObject:", 0);
  -[SUScriptFunction setThisObject:](self->_shouldDismissFunction, "setThisObject:", 0);

  v4.receiver = self;
  v4.super_class = (Class)SUScriptWindow;
  -[SUScriptObject dealloc](&v4, sel_dealloc);
}

+ (void)dismissWindowsWithOptions:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "safeValueForKey:", CFSTR("animate"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "BOOLValue");
  WebThreadRunOnMainThread();
}

uint64_t __44__SUScriptWindow_dismissWindowsWithOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(+[SUClientDispatch tabBarController](SUClientDispatch, "tabBarController"), "overlayBackgroundViewController"), "dismissAnimated:", *(unsigned __int8 *)(a1 + 32));
}

- (SUScriptWindowContext)context
{
  SUScriptWindowContext *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_context;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (void)dismiss:(id)a3
{
  id v3;

  v3 = -[SUScriptWindow _copySafeTransitionOptionsFromOptions:](self, "_copySafeTransitionOptionsFromOptions:", a3);
  WebThreadRunOnMainThread();

}

uint64_t __26__SUScriptWindow_dismiss___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  uint64_t result;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_backgroundViewController:", 0);
  v3 = objc_msgSend(v2, "viewControllerForScriptWindowContext:", objc_msgSend(*(id *)(a1 + 32), "context"));
  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("animate"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = objc_msgSend(v5, "BOOLValue");
    else
      v6 = 0;
    return objc_msgSend(v2, "dismissOverlay:animated:", v4, v6);
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    result = os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEFAULT);
    if (!(_DWORD)result)
      v9 &= 2u;
    if (v9)
    {
      v13 = 138412290;
      v14 = objc_opt_class();
      LODWORD(v12) = 12;
      result = _os_log_send_and_compose_impl();
      if (result)
      {
        v11 = (void *)result;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", result, 4, &v13, v12);
        free(v11);
        return SSFileLog();
      }
    }
  }
  return result;
}

- (void)flip:(id)a3
{
  id v3;

  v3 = -[SUScriptWindow _copySafeTransitionOptionsFromOptions:](self, "_copySafeTransitionOptionsFromOptions:", a3);
  WebThreadRunOnMainThread();

}

void __23__SUScriptWindow_flip___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_overlayViewController:", 0);
  if (v2)
  {
    v3 = (void *)v2;
    v10 = (id)objc_msgSend(*(id *)(a1 + 32), "_newOverlayTransitionWithOptions:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "flipWithTransition:");

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
      v11 = 138412290;
      v12 = objc_opt_class();
      LODWORD(v9) = 12;
      v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v11, v9);
        free(v8);
        SSFileLog();
      }
    }
  }
}

- (void)show:(id)a3
{
  id v3;

  v3 = -[SUScriptWindow _copySafeTransitionOptionsFromOptions:](self, "_copySafeTransitionOptionsFromOptions:", a3);
  WebThreadRunOnMainThread();

}

void __23__SUScriptWindow_show___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  SUOverlayViewController *v10;
  uint64_t v11;
  SUCanvasMaskProvider *v12;
  uint64_t v13;
  void *v14;
  float v15;
  void *v16;
  float v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  float v23;
  double v24;
  void *v25;
  float v26;
  void *v27;
  void *v28;
  SUScrollViewScroller *v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  uint64_t v34;
  _QWORD v35[8];
  int v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_backgroundViewController:", 1);
  if (objc_msgSend(v3, "viewControllerForScriptWindowContext:", v2))
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
LABEL_8:
      v36 = 138412290;
      v37 = objc_opt_class();
      LODWORD(v34) = 12;
      v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v36, v34);
        free(v8);
        SSFileLog();
      }
    }
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v9 + 72) || *(_QWORD *)(v9 + 96))
    {
      if (v3)
      {
        v10 = objc_alloc_init(SUOverlayViewController);
        -[SUOverlayViewController setCanSwipeToDismiss:](v10, "setCanSwipeToDismiss:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 80));
        -[SUViewController setClientInterface:](v10, "setClientInterface:", objc_msgSend(v3, "clientInterface"));
        -[SUOverlayViewController setScriptWindowContext:](v10, "setScriptWindowContext:", v2);
        -[SUOverlayViewController setBackViewController:](v10, "setBackViewController:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "nativeViewController"));
        -[SUOverlayViewController setFrontViewController:](v10, "setFrontViewController:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "nativeViewController"));
        objc_msgSend(*(id *)(a1 + 32), "lock");
        v11 = *(_QWORD *)(a1 + 32);
        if (*(_QWORD *)(v11 + 112))
        {
          v12 = -[SUCanvasMaskProvider initWithFunction:]([SUCanvasMaskProvider alloc], "initWithFunction:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
          v11 = *(_QWORD *)(a1 + 32);
        }
        else
        {
          v12 = 0;
        }
        -[SUOverlayViewController setShouldDismissFunction:](v10, "setShouldDismissFunction:", *(_QWORD *)(v11 + 136));
        objc_msgSend(*(id *)(a1 + 32), "unlock");
        -[SUOverlayViewController setMaskProvider:](v10, "setMaskProvider:", v12);

        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(void **)(v13 + 120);
        if (v14)
        {
          objc_msgSend(v14, "floatValue");
          -[SUOverlayViewController setShadowOpacity:](v10, "setShadowOpacity:", v15);
          v13 = *(_QWORD *)(a1 + 32);
        }
        v16 = *(void **)(v13 + 128);
        if (v16)
        {
          objc_msgSend(v16, "floatValue");
          -[SUOverlayViewController setShadowRadius:](v10, "setShadowRadius:", v17);
        }
        objc_msgSend((id)objc_opt_class(), "defaultOverlaySize");
        v20 = v19;
        v21 = *(_QWORD *)(a1 + 32);
        v22 = *(void **)(v21 + 104);
        if (v22)
        {
          objc_msgSend(v22, "floatValue");
          v24 = v23;
          v21 = *(_QWORD *)(a1 + 32);
        }
        else
        {
          v24 = v18;
        }
        v25 = *(void **)(v21 + 144);
        if (v25)
        {
          objc_msgSend(v25, "floatValue");
          v20 = v26;
        }
        -[SUOverlayViewController setOverlaySize:](v10, "setOverlaySize:", v20, v24);
        v27 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newOverlayTransitionWithOptions:", *(_QWORD *)(a1 + 40));
        v28 = (void *)objc_msgSend(v27, "sourceElement");
        if (objc_msgSend(v28, "webView"))
        {
          v29 = objc_alloc_init(SUScrollViewScroller);
          v30 = (void *)objc_msgSend((id)objc_msgSend(v28, "webView"), "scrollView");
          -[SUScrollViewScroller attachToScrollView:](v29, "attachToScrollView:", v30);
          objc_msgSend(v28, "frame");
          objc_msgSend(v30, "convertRect:fromView:", 0);
          v35[0] = MEMORY[0x24BDAC760];
          v35[1] = 3221225472;
          v35[2] = __23__SUScriptWindow_show___block_invoke_15;
          v35[3] = &unk_24DE7BEF0;
          v35[4] = v3;
          v35[5] = v10;
          v35[6] = v27;
          v35[7] = v29;
          -[SUScrollViewScroller scrollFrameToVisible:animated:completionBlock:](v29, "scrollFrameToVisible:animated:completionBlock:", 1, v35);

        }
        else
        {
          objc_msgSend(v3, "presentOverlay:withTransition:", v10, v27);
        }

      }
    }
    else
    {
      v31 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v32 = objc_msgSend(v31, "shouldLog");
      if (objc_msgSend(v31, "shouldLogToDisk"))
        v33 = v32 | 2;
      else
        v33 = v32;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v31, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v33 &= 2u;
      if (v33)
        goto LABEL_8;
    }
  }
}

uint64_t __23__SUScriptWindow_show___block_invoke_15(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "presentOverlay:withTransition:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 56), "detachFromScrollView");
}

- (SUScriptViewController)backViewController
{
  void *v3;
  SUScriptViewController *v4;
  SUScriptViewController *v5;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  SUScriptWindow *v11;
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
  v16 = __Block_byref_object_copy__11;
  v17 = __Block_byref_object_dispose__11;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __36__SUScriptWindow_backViewController__block_invoke;
  v10 = &unk_24DE7BE08;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __36__SUScriptWindow_backViewController__block_invoke, &unk_24DE7BE08, v11, &v13), (v3 = (void *)v14[5]) != 0))
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

id __36__SUScriptWindow_backViewController__block_invoke(uint64_t a1)
{
  void *v2;
  id result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_overlayViewController:", 0);
  if (v2)
    result = (id)objc_msgSend((id)objc_msgSend(v2, "backViewController"), "copyScriptViewController");
  else
    result = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)canSwipeToDismiss
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
  v8 = 1;
  WebThreadRunOnMainThread();
  if (*((_BYTE *)v6 + 24))
    v2 = (void **)MEMORY[0x24BDBD270];
  else
    v2 = (void **)MEMORY[0x24BDBD268];
  v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

void *__35__SUScriptWindow_canSwipeToDismiss__block_invoke(uint64_t a1)
{
  void *result;

  result = (void *)objc_msgSend(*(id *)(a1 + 32), "_overlayViewController:", 0);
  if (result)
  {
    result = (void *)objc_msgSend(result, "canSwipeToDismiss");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80);
  }
  return result;
}

- (id)_className
{
  return CFSTR("iTunesWindow");
}

- (SUScriptViewController)frontViewController
{
  void *v3;
  SUScriptViewController *v4;
  SUScriptViewController *v5;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  SUScriptWindow *v11;
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
  v16 = __Block_byref_object_copy__11;
  v17 = __Block_byref_object_dispose__11;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __37__SUScriptWindow_frontViewController__block_invoke;
  v10 = &unk_24DE7BE08;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __37__SUScriptWindow_frontViewController__block_invoke, &unk_24DE7BE08, v11, &v13), (v3 = (void *)v14[5]) != 0))
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

id __37__SUScriptWindow_frontViewController__block_invoke(uint64_t a1)
{
  void *v2;
  id result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_overlayViewController:", 0);
  if (v2)
    result = (id)objc_msgSend((id)objc_msgSend(v2, "frontViewController"), "copyScriptViewController");
  else
    result = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSNumber)height
{
  double v2;
  NSNumber *v3;
  uint64_t v5;
  uint64_t v7;
  double *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x3010000000;
  v10 = &unk_21B5745F1;
  v11 = *MEMORY[0x24BDBF148];
  v5 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = v8[5];
  *(float *)&v2 = v2;
  v3 = (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2, v5, 3221225472, __24__SUScriptWindow_height__block_invoke, &unk_24DE7BE30, self, &v7);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __24__SUScriptWindow_height__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1 + 32), "_overlaySize");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

- (WebScriptObject)maskFunction
{
  WebScriptObject *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = -[SUScriptFunction scriptObject](self->_maskFunction, "scriptObject");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (void)setBackViewController:(id)a3
{
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  else
    WebThreadRunOnMainThread();
}

id __40__SUScriptWindow_setBackViewController___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id result;
  BOOL v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_overlayViewController:", 0);
  if (v2)
  {
    v3 = (void *)v2;
    result = (id)objc_msgSend(*(id *)(a1 + 40), "nativeViewController");
    if (*(_QWORD *)(a1 + 40))
      v5 = result == 0;
    else
      v5 = 0;
    if (!v5)
      return (id)objc_msgSend(v3, "setBackViewController:", result);
  }
  else
  {

    result = *(id *)(a1 + 40);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = result;
  }
  return result;
}

- (void)setCanSwipeToDismiss:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

uint64_t __39__SUScriptWindow_setCanSwipeToDismiss___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_overlayViewController:", 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
  return objc_msgSend(v2, "setCanSwipeToDismiss:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 80));
}

- (void)setHeight:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

uint64_t __28__SUScriptWindow_setHeight___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  float v6;
  uint64_t result;
  id v8;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_overlayViewController:", 0);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "overlaySize");
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 40), "floatValue");
    return objc_msgSend(v3, "setOverlaySize:", v5, v6);
  }
  else
  {

    v8 = objc_alloc(MEMORY[0x24BDD16E0]);
    objc_msgSend(*(id *)(a1 + 40), "floatValue");
    result = objc_msgSend(v8, "initWithFloat:");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = result;
  }
  return result;
}

- (void)setMaskFunction:(id)a3
{
  SUScriptCanvasFunction *v3;
  SUScriptCanvasFunction *v5;

  v3 = (SUScriptCanvasFunction *)a3;
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
  else
  {
    -[SUScriptObject lock](self, "lock");

    if (v3)
      v3 = -[SUScriptFunction initWithScriptObject:]([SUScriptCanvasFunction alloc], "initWithScriptObject:", v3);
    self->_maskFunction = v3;
    +[SUOverlayViewController defaultOverlaySize](SUOverlayViewController, "defaultOverlaySize");

    v5 = self->_maskFunction;
    -[SUScriptObject unlock](self, "unlock");
    WebThreadRunOnMainThread();

  }
}

void __34__SUScriptWindow_setMaskFunction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  SUCanvasMaskProvider *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_overlayViewController:", 0);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = -[SUCanvasMaskProvider initWithFunction:]([SUCanvasMaskProvider alloc], "initWithFunction:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "setMaskProvider:", v4);

  }
}

- (void)setFrontViewController:(id)a3
{
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  else
    WebThreadRunOnMainThread();
}

id __41__SUScriptWindow_setFrontViewController___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id result;
  BOOL v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_overlayViewController:", 0);
  if (v2)
  {
    v3 = (void *)v2;
    result = (id)objc_msgSend(*(id *)(a1 + 40), "nativeViewController");
    if (*(_QWORD *)(a1 + 40))
      v5 = result == 0;
    else
      v5 = 0;
    if (!v5)
      return (id)objc_msgSend(v3, "setFrontViewController:", result);
  }
  else
  {

    result = *(id *)(a1 + 40);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = result;
  }
  return result;
}

- (void)setShadowOpacity:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "floatValue");
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __35__SUScriptWindow_setShadowOpacity___block_invoke(uint64_t a1)
{
  id v2;
  double v3;
  uint64_t result;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_overlayViewController:", 0), "setShadowOpacity:", *(double *)(a1 + 40));

  v2 = objc_alloc(MEMORY[0x24BDD16E0]);
  v3 = *(double *)(a1 + 40);
  *(float *)&v3 = v3;
  result = objc_msgSend(v2, "initWithFloat:", v3);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = result;
  return result;
}

- (void)setShadowRadius:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "floatValue");
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __34__SUScriptWindow_setShadowRadius___block_invoke(uint64_t a1)
{
  id v2;
  double v3;
  uint64_t result;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_overlayViewController:", 0), "setShadowRadius:", *(double *)(a1 + 40));

  v2 = objc_alloc(MEMORY[0x24BDD16E0]);
  v3 = *(double *)(a1 + 40);
  *(float *)&v3 = v3;
  result = objc_msgSend(v2, "initWithFloat:", v3);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = result;
  return result;
}

- (void)setShouldDismissFunction:(id)a3
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

uint64_t __43__SUScriptWindow_setShouldDismissFunction___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = objc_alloc_init(SUScriptFunction);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setThisObject:");
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  }
  objc_msgSend(v2, "setScriptObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_overlayViewController:", 0), "setShouldDismissFunction:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
}

- (void)setWidth:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

uint64_t __27__SUScriptWindow_setWidth___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  float v6;
  uint64_t result;
  id v8;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_overlayViewController:", 0);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "overlaySize");
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 40), "floatValue");
    return objc_msgSend(v3, "setOverlaySize:", v6, v5);
  }
  else
  {

    v8 = objc_alloc(MEMORY[0x24BDD16E0]);
    objc_msgSend(*(id *)(a1 + 40), "floatValue");
    result = objc_msgSend(v8, "initWithFloat:");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = result;
  }
  return result;
}

- (NSNumber)shadowOpacity
{
  double v2;
  NSNumber *v3;
  uint64_t v5;
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0x3FE570A3E0000000;
  v5 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = v8[3];
  *(float *)&v2 = v2;
  v3 = (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2, v5, 3221225472, __31__SUScriptWindow_shadowOpacity__block_invoke, &unk_24DE7BE08, self, &v7);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void *__31__SUScriptWindow_shadowOpacity__block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  double v4;
  float v5;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_overlayViewController:", 0);
  if (v2)
  {
    result = (void *)objc_msgSend(v2, "shadowOpacity");
  }
  else
  {
    result = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    if (!result)
      return result;
    result = (void *)objc_msgSend(result, "floatValue");
    v4 = v5;
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (NSNumber)shadowRadius
{
  double v2;
  NSNumber *v3;
  uint64_t v5;
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0x402E000000000000;
  v5 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = v8[3];
  *(float *)&v2 = v2;
  v3 = (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2, v5, 3221225472, __30__SUScriptWindow_shadowRadius__block_invoke, &unk_24DE7BE08, self, &v7);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void *__30__SUScriptWindow_shadowRadius__block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  double v4;
  float v5;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_overlayViewController:", 0);
  if (v2)
  {
    result = (void *)objc_msgSend(v2, "shadowRadius");
  }
  else
  {
    result = *(void **)(*(_QWORD *)(a1 + 32) + 128);
    if (!result)
      return result;
    result = (void *)objc_msgSend(result, "floatValue");
    v4 = v5;
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (WebScriptObject)shouldDismissFunction
{
  void *v2;
  WebScriptObject *v3;
  WebScriptObject *v4;
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
  v11 = __Block_byref_object_copy__11;
  v12 = __Block_byref_object_dispose__11;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (WebScriptObject *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __39__SUScriptWindow_shouldDismissFunction__block_invoke, &unk_24DE7BE08, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __39__SUScriptWindow_shouldDismissFunction__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_overlayViewController:", 0);
  if (v2)
    v3 = (void *)objc_msgSend(v2, "shouldDismissFunction");
  else
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  result = (id)objc_msgSend(v3, "scriptObject");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)style
{
  return (NSString *)CFSTR("overlay");
}

- (NSNumber)width
{
  double v2;
  NSNumber *v3;
  uint64_t v5;
  uint64_t v7;
  double *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x3010000000;
  v10 = &unk_21B5745F1;
  v11 = *MEMORY[0x24BDBF148];
  v5 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = v8[4];
  *(float *)&v2 = v2;
  v3 = (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2, v5, 3221225472, __23__SUScriptWindow_width__block_invoke, &unk_24DE7BE30, self, &v7);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __23__SUScriptWindow_width__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1 + 32), "_overlaySize");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

- (SUScriptViewController)windowParentViewController
{
  void *v3;
  SUScriptViewController *v4;
  SUScriptViewController *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  SUScriptWindow *v11;
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
  v16 = __Block_byref_object_copy__11;
  v17 = __Block_byref_object_dispose__11;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __44__SUScriptWindow_windowParentViewController__block_invoke;
  v10 = &unk_24DE7BE08;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __44__SUScriptWindow_windowParentViewController__block_invoke, &unk_24DE7BE08, v11, &v13), (v3 = (void *)v14[5]) != 0))
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

uint64_t __44__SUScriptWindow_windowParentViewController__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_backgroundViewController:", 0), "parentViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (void *)objc_msgSend(v2, "transientViewController");
    if (!v3)
      v3 = (void *)objc_msgSend(v2, "selectedNavigationController");
  }
  else
  {
    v3 = v2;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(v3, "topViewController");
  result = objc_msgSend(v3, "copyScriptViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_overlayDidDismissNotification:(id)a3
{
  int v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "object"), "scriptWindowContext"), "tag");
  if (v4 == -[SUScriptWindowContext tag](-[SUScriptWindow context](self, "context"), "tag"))
  {
    -[SUScriptObject dispatchEvent:forName:](self, "dispatchEvent:forName:", 0, CFSTR("dismiss"));
    -[SUScriptObject setVisible:](self, "setVisible:", 0);
  }
}

- (void)_overlayDidFlipNotification:(id)a3
{
  int v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "object"), "scriptWindowContext"), "tag");
  if (v4 == -[SUScriptWindowContext tag](-[SUScriptWindow context](self, "context"), "tag"))
    -[SUScriptObject dispatchEvent:forName:](self, "dispatchEvent:forName:", 0, CFSTR("flip"));
}

- (void)_overlayDidShowNotification:(id)a3
{
  int v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "object"), "scriptWindowContext"), "tag");
  if (v4 == -[SUScriptWindowContext tag](-[SUScriptWindow context](self, "context"), "tag"))
  {
    -[SUScriptObject dispatchEvent:forName:](self, "dispatchEvent:forName:", 0, CFSTR("show"));
    -[SUScriptObject setVisible:](self, "setVisible:", 1);
  }
}

- (CGSize)_overlaySize
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  id height;
  float v11;
  id width;
  float v13;
  double v14;
  double v15;
  CGSize result;

  +[SUOverlayViewController defaultOverlaySize](SUOverlayViewController, "defaultOverlaySize");
  v4 = v3;
  v6 = v5;
  v7 = -[SUScriptWindow _overlayViewController:](self, "_overlayViewController:", 0);
  if (v7)
  {
    objc_msgSend(v7, "overlaySize");
    v4 = v8;
    v6 = v9;
  }
  else
  {
    height = self->_height;
    if (height)
    {
      objc_msgSend(height, "floatValue");
      v6 = v11;
    }
    width = self->_width;
    if (width)
    {
      objc_msgSend(width, "floatValue");
      v4 = v13;
    }
  }
  v14 = v4;
  v15 = v6;
  result.height = v15;
  result.width = v14;
  return result;
}

- (id)_backgroundViewController:(BOOL)a3
{
  _BOOL4 v3;
  SUOverlayBackgroundViewController *v5;
  BOOL v6;
  SUOverlayBackgroundViewController *v7;
  SUOverlayBackgroundViewController *v8;

  v3 = a3;
  v5 = +[SUClientDispatch overlayBackgroundViewController](SUClientDispatch, "overlayBackgroundViewController");
  if (v5)
    v6 = 1;
  else
    v6 = !v3;
  if (!v6)
  {
    v7 = objc_alloc_init(SUOverlayBackgroundViewController);
    -[SUViewController setClientInterface:](v7, "setClientInterface:", -[SUScriptObject clientInterface](self, "clientInterface"));
    if (+[SUClientDispatch presentOverlayBackgroundViewController:](SUClientDispatch, "presentOverlayBackgroundViewController:", v7))
    {
      v5 = v7;
    }
    else
    {
      v5 = 0;
    }
    v8 = v7;
  }
  return v5;
}

- (id)_copySafeTransitionOptionsFromOptions:(id)a3
{
  return (id)objc_msgSend(a3, "copyValuesForKeys:", CFSTR("animate"), CFSTR("duration"), CFSTR("srcElement"), CFSTR("transition"), 0);
}

- (id)_newOverlayTransitionWithOptions:(id)a3
{
  SUOverlayTransition *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_alloc_init(SUOverlayTransition);
  v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("duration"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "doubleValue");
    -[SUOverlayTransition setDuration:](v5, "setDuration:");
  }
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("srcElement"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUOverlayTransition setSourceElement:](v5, "setSourceElement:", -[SUScriptObject DOMElementWithElement:](self, "DOMElementWithElement:", v7));
  v8 = objc_msgSend(a3, "objectForKey:", CFSTR("transition"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUOverlayTransition setType:](v5, "setType:", objc_msgSend((id)objc_opt_class(), "transitionTypeFromString:", v8));
  return v5;
}

- (id)_overlayViewController:(BOOL)a3
{
  return (id)objc_msgSend(-[SUScriptWindow _backgroundViewController:](self, "_backgroundViewController:", a3), "viewControllerForScriptWindowContext:", -[SUScriptWindow context](self, "context"));
}

- (void)_registerForOverlayNotifications
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__overlayDidDismissNotification_, CFSTR("SUOverlayDidDismissNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__overlayDidFlipNotification_, CFSTR("SUOverlayDidFlipNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__overlayDidShowNotification_, CFSTR("SUOverlayDidShowNotification"), 0);
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_18, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptWindow;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_13, 3);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptWindow;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptWindow;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_18, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_13 = (uint64_t)sel_dismiss_;
    *(_QWORD *)algn_2551862C8 = CFSTR("dismiss");
    qword_2551862D0 = (uint64_t)sel_flip_;
    unk_2551862D8 = CFSTR("flip");
    qword_2551862E0 = (uint64_t)sel_show_;
    unk_2551862E8 = CFSTR("show");
    __KeyMapping_18 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("backViewController"), CFSTR("canSwipeToDismiss"), CFSTR("canSwipeToDismiss"), CFSTR("frontViewController"), CFSTR("frontViewController"), CFSTR("height"), CFSTR("height"), CFSTR("maskFunction"), CFSTR("maskFunction"), CFSTR("parentViewController"), CFSTR("windowParentViewController"), CFSTR("shadowOpacity"), CFSTR("shadowOpacity"), CFSTR("shadowRadius"), CFSTR("shadowRadius"), CFSTR("shouldDismissFunction"), CFSTR("shouldDismissFunction"),
                        CFSTR("style"),
                        CFSTR("style"),
                        CFSTR("width"),
                        CFSTR("width"),
                        0);
  }
}

@end
