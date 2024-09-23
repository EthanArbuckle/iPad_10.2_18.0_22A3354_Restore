@implementation SUScriptStorePageViewController

- (SUScriptStorePageViewController)init
{
  return -[SUScriptStorePageViewController initWithURLStrings:](self, "initWithURLStrings:", 0);
}

- (SUScriptStorePageViewController)initWithURLStrings:(id)a3
{
  id v4;
  SUScriptStorePageViewController *v5;
  uint64_t v6;
  NSArray *initialURLStrings;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUScriptStorePageViewController;
  v5 = -[SUScriptObject init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    initialURLStrings = v5->_initialURLStrings;
    v5->_initialURLStrings = (NSArray *)v6;

  }
  return v5;
}

+ (BOOL)copyURLStrings:(id *)a3 forValue:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (SUURLValidator((uint64_t)v5))
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v5, 0);
LABEL_6:
      v7 = (void *)v6;
      goto LABEL_12;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(v5, "copyArrayValueWithValidator:context:", SUURLValidator, 0);
      if (v6)
        goto LABEL_6;
    }
    else if (!v5)
    {
      v7 = 0;
LABEL_12:
      v8 = 1;
      if (!a3)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  v8 = 0;
  v7 = 0;
  if (a3)
LABEL_9:
    *a3 = objc_retainAutorelease(v7);
LABEL_10:

  return v8;
}

- (void)applyURLStrings:(id)a3 toViewController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a4;
  v6 = -[SUScriptStorePageViewController _copyURLsFromURLStrings:](self, "_copyURLsFromURLStrings:", a3);
  objc_msgSend(v10, "URLRequestProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    objc_msgSend(v8, "setAllowedRetryCount:", 0);
  v9 = objc_msgSend(v10, "isViewLoaded");
  objc_msgSend(v8, "setURLs:", v6);
  if (v9)
    objc_msgSend(v10, "performSelector:withObject:afterDelay:", sel_reloadWithURLRequestProperties_, v8, 0.0);
  else
    objc_msgSend(v10, "setURLRequestProperties:", v8);

}

- (NSArray)URLStrings
{
  return self->_initialURLStrings;
}

- (id)newNativeViewController
{
  void *v3;
  void *v4;
  SUStorePageViewController *v5;
  SUStorePageViewController *v6;
  NSArray *initialURLStrings;
  void *v8;

  -[SUScriptObject viewControllerFactory](self, "viewControllerFactory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = (SUStorePageViewController *)objc_msgSend(v3, "newStorePageViewControllerWithSection:", 0);
  else
    v5 = -[SUViewController initWithSection:]([SUStorePageViewController alloc], "initWithSection:", 0);
  v6 = v5;
  initialURLStrings = self->_initialURLStrings;
  if (initialURLStrings)
    -[SUScriptStorePageViewController applyURLStrings:toViewController:](self, "applyURLStrings:toViewController:", initialURLStrings, v5);
  -[SUScriptObject clientInterface](self, "clientInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUViewController setClientInterface:](v6, "setClientInterface:", v8);

  return v6;
}

- (void)setNativeViewController:(id)a3
{
  id v4;

  if (a3)
  {
    +[SUScriptNativeObject objectWithNativeObject:](SUScriptStorePageNativeObject, "objectWithNativeObject:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SUScriptObject setNativeObject:](self, "setNativeObject:", v4);

  }
  else
  {
    -[SUScriptObject setNativeObject:](self, "setNativeObject:");
  }
}

- (id)loadWebArchiveWithIdentifier:(id)a3 fromDirectory:(id)a4
{
  id v5;
  id v6;
  id *v7;
  id v8;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v10 = v5;
    v11 = v6;
    WebThreadRunOnMainThread();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
  if (*((_BYTE *)v13 + 24))
    v7 = (id *)MEMORY[0x24BDBD270];
  else
    v7 = (id *)MEMORY[0x24BDBD268];
  v8 = *v7;
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __78__SUScriptStorePageViewController_loadWebArchiveWithIdentifier_fromDirectory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  BOOL v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  int v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_pathForWebArchiveWithIdentifier:inDirectory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "launchedToTest");

  if (v4)
    v5 = v2 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v25 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:options:error:", v2, 0, &v25);
    v7 = v25;
    if (v6)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA930]), "initWithData:", v6);
      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "mainResource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "URL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "reloadWithStorePage:ofType:forURL:", v8, 1, v11);

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
LABEL_26:

        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v14 = objc_claimAutoreleasedReturnValue();
      v18 = -[NSObject shouldLog](v14, "shouldLog");
      if (-[NSObject shouldLogToDisk](v14, "shouldLogToDisk"))
        v19 = v18 | 2;
      else
        v19 = v18;
      -[NSObject OSLogObject](v14, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        v19 &= 2u;
      if (!v19)
        goto LABEL_24;
      v21 = (void *)objc_opt_class();
      v26 = 138412546;
      v27 = v21;
      v28 = 2112;
      v29 = v2;
      v22 = v21;
      LODWORD(v24) = 22;
      v23 = (void *)_os_log_send_and_compose_impl();

      if (v23)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v23, 4, &v26, v24);
        v20 = objc_claimAutoreleasedReturnValue();
        free(v23);
        SSFileLog();
LABEL_24:

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "shouldLog");
      if (objc_msgSend(v8, "shouldLogToDisk"))
        v13 = v12 | 2;
      else
        v13 = v12;
      objc_msgSend(v8, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        v13 &= 2u;
      if (v13)
      {
        v15 = (void *)objc_opt_class();
        v26 = 138412802;
        v27 = v15;
        v28 = 2112;
        v29 = v2;
        v30 = 2112;
        v31 = v7;
        v16 = v15;
        LODWORD(v24) = 32;
        v17 = (void *)_os_log_send_and_compose_impl();

        if (!v17)
          goto LABEL_26;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v17, 4, &v26, v24);
        v14 = objc_claimAutoreleasedReturnValue();
        free(v17);
        SSFileLog();
      }
    }

    goto LABEL_26;
  }
LABEL_27:

}

- (void)reloadWithCallback:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v3 = 0;
  }
  v4 = v3;
  WebThreadRunOnMainThread();

}

void __54__SUScriptStorePageViewController_reloadWithCallback___block_invoke(uint64_t a1)
{
  SUScriptFunction *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  SUScriptFunction *v6;
  _QWORD v7[4];
  SUScriptFunction *v8;
  uint64_t v9;

  if (*(_QWORD *)(a1 + 32))
    v2 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", *(_QWORD *)(a1 + 32));
  else
    v2 = 0;
  objc_msgSend(*(id *)(a1 + 40), "_storePageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLRequestProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__SUScriptStorePageViewController_reloadWithCallback___block_invoke_2;
  v7[3] = &unk_24DE7C670;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v2;
  v9 = v5;
  v6 = v2;
  objc_msgSend(v3, "_reloadWithURLRequestProperties:completionBlock:", v4, v7);

}

uint64_t __54__SUScriptStorePageViewController_reloadWithCallback___block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  _QWORD *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "setThisObject:", *(_QWORD *)(a1 + 40));
  v4 = *(void **)(a1 + 32);
  v5 = (_QWORD *)MEMORY[0x24BDBD268];
  if (a2)
    v5 = (_QWORD *)MEMORY[0x24BDBD270];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callWithArguments:", v6);

  return objc_msgSend(*(id *)(a1 + 32), "setThisObject:", 0);
}

- (id)saveWebArchiveWithIdentifier:(id)a3 toDirectory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id *v22;
  id v23;
  uint64_t v25;
  void *v26;
  id v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v7 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[SUScriptStorePageViewController _pathForWebArchiveWithIdentifier:inDirectory:](self, "_pathForWebArchiveWithIdentifier:inDirectory:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v27[1] = (id)MEMORY[0x24BDAC760];
        v27[2] = (id)3221225472;
        v27[3] = __76__SUScriptStorePageViewController_saveWebArchiveWithIdentifier_toDirectory___block_invoke;
        v27[4] = &unk_24DE7AF68;
        v27[5] = &v28;
        WebThreadRunOnMainThread();
      }
      if (!*((_BYTE *)v29 + 24))
        goto LABEL_21;
      -[SUScriptObject webFrame](self, "webFrame");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "webArchive");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = 0;
      v12 = objc_msgSend(v11, "writeToFile:options:error:", v8, 0, v27);
      v13 = v27[0];
      *((_BYTE *)v29 + 24) = v12;

      if (*((_BYTE *)v29 + 24))
      {
LABEL_20:

LABEL_21:
        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "shouldLog");
      v16 = objc_msgSend(v14, "shouldLogToDisk");
      objc_msgSend(v14, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v16)
        v15 |= 2u;
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        v15 &= 2u;
      if (v15)
      {
        v19 = (void *)objc_opt_class();
        v32 = 138412802;
        v33 = v19;
        v34 = 2112;
        v35 = v8;
        v36 = 2112;
        v37 = v13;
        v20 = v19;
        LODWORD(v25) = 32;
        v21 = (void *)_os_log_send_and_compose_impl();

        if (!v21)
        {
LABEL_19:

          goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v21, 4, &v32, v25);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        free(v21);
        SSFileLog();
      }

      goto LABEL_19;
    }
  }
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
LABEL_23:
  if (*((_BYTE *)v29 + 24))
    v22 = (id *)MEMORY[0x24BDBD270];
  else
    v22 = (id *)MEMORY[0x24BDBD268];
  v23 = *v22;
  _Block_object_dispose(&v28, 8);

  return v23;
}

void __76__SUScriptStorePageViewController_saveWebArchiveWithIdentifier_toDirectory___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "launchedToTest");

}

- (void)setScrollEdgeInsetsWithTop:(double)a3 left:(double)a4 bottom:(double)a5 right:(double)a6
{
  WebThreadRunOnMainThread();
}

void __80__SUScriptStorePageViewController_setScrollEdgeInsetsWithTop_left_bottom_right___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v3, "copyScriptProperties");
  objc_msgSend(v2, "setScrollContentInsets:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(v3, "setScriptProperties:", v2);

}

- (id)_className
{
  return CFSTR("iTunesStorePageViewController");
}

- (id)alwaysDispatchesScrollEvents
{
  id *v2;
  id v3;
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
    v2 = (id *)MEMORY[0x24BDBD270];
  else
    v2 = (id *)MEMORY[0x24BDBD268];
  v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __63__SUScriptStorePageViewController_alwaysDispatchesScrollEvents__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "copyScriptProperties");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "alwaysDispatchesScrollEvents");
}

- (BOOL)doubleTapEnabled
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 1;
  WebThreadRunOnMainThread();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __51__SUScriptStorePageViewController_doubleTapEnabled__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "copyScriptProperties");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "isDoubleTapEnabled");
}

- (BOOL)flashesScrollIndicators
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 1;
  WebThreadRunOnMainThread();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __58__SUScriptStorePageViewController_flashesScrollIndicators__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "copyScriptProperties");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "flashesScrollIndicators");
}

- (id)inputViewObeysDOMFocus
{
  id *v2;
  id v3;
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
    v2 = (id *)MEMORY[0x24BDBD270];
  else
    v2 = (id *)MEMORY[0x24BDBD268];
  v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __57__SUScriptStorePageViewController_inputViewObeysDOMFocus__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "copyScriptProperties");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "inputViewObeysDOMFocus");
}

- (int64_t)loadingIndicatorStyle
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

void __56__SUScriptStorePageViewController_loadingIndicatorStyle__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "copyScriptProperties");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "loadingIndicatorStyle");
}

- (id)loadsWhenHidden
{
  id *v2;
  id v3;
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
    v2 = (id *)MEMORY[0x24BDBD270];
  else
    v2 = (id *)MEMORY[0x24BDBD268];
  v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __50__SUScriptStorePageViewController_loadsWhenHidden__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "loadsWhenHidden");

}

- (id)loadingTextColor
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__13;
  v8 = __Block_byref_object_dispose__13;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __51__SUScriptStorePageViewController_loadingTextColor__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  SUScriptColor *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v2, "copyScriptProperties");

  objc_msgSend(v10, "loadingTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [SUScriptColor alloc];
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "initWithUIColor:", v3);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (id)loadingTextShadowColor
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__13;
  v8 = __Block_byref_object_dispose__13;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __57__SUScriptStorePageViewController_loadingTextShadowColor__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  SUScriptColor *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v2, "copyScriptProperties");

  objc_msgSend(v10, "loadingTextShadowColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [SUScriptColor alloc];
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "initWithUIColor:", v3);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (id)placeholderBackgroundStyle
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__13;
  v8 = __Block_byref_object_dispose__13;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __61__SUScriptStorePageViewController_placeholderBackgroundStyle__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  SUScriptGradient *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v2, "copyScriptProperties");

  objc_msgSend(v7, "placeholderBackgroundGradient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[SUScriptGradient initWithGradient:]([SUScriptGradient alloc], "initWithGradient:", v3);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (id)rootObject
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SUScriptObject webFrame](self, "webFrame");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScriptObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)scrollingEnabled
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 1;
  WebThreadRunOnMainThread();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __51__SUScriptStorePageViewController_scrollingEnabled__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "copyScriptProperties");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "isScrollingDisabled") ^ 1;
}

- (SUScriptSegmentedControl)segmentedControl
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__13;
  v12 = __Block_byref_object_dispose__13;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __51__SUScriptStorePageViewController_segmentedControl__block_invoke, &unk_24DE7B458, self, &v8);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);

  return (SUScriptSegmentedControl *)v4;
}

void __51__SUScriptStorePageViewController_segmentedControl__block_invoke(uint64_t a1)
{
  void *v2;
  SUScriptSegmentedControl *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = -[SUScriptSegmentedControl initWithPageSectionGroup:]([SUScriptSegmentedControl alloc], "initWithPageSectionGroup:", v2);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v10, "sectionSegmentedControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "selectedItemIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectedIndex:", v9);

    objc_msgSend(*(id *)(a1 + 32), "checkInScriptObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }

}

- (void)setAlwaysDispatchesScrollEvents:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v3 = 0;
  }
  else if (v3 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    goto LABEL_5;
  }
  v3 = v3;
  WebThreadRunOnMainThread();

LABEL_5:
}

void __67__SUScriptStorePageViewController_setAlwaysDispatchesScrollEvents___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v3, "copyScriptProperties");
  objc_msgSend(v2, "setAlwaysDispatchesScrollEvents:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
  objc_msgSend(v3, "setScriptProperties:", v2);

}

- (void)setDoubleTapEnabled:(BOOL)a3
{
  WebThreadRunOnMainThread();
}

void __55__SUScriptStorePageViewController_setDoubleTapEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v3, "copyScriptProperties");
  objc_msgSend(v2, "setDoubleTapEnabled:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(v3, "setScriptProperties:", v2);

}

- (void)setFlashesScrollIndicators:(BOOL)a3
{
  WebThreadRunOnMainThread();
}

void __62__SUScriptStorePageViewController_setFlashesScrollIndicators___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v3, "copyScriptProperties");
  objc_msgSend(v2, "setFlashesScrollIndicators:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(v3, "setScriptProperties:", v2);

}

- (void)setInputViewObeysDOMFocus:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v3 = 0;
  }
  else if (v3 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    goto LABEL_5;
  }
  v3 = v3;
  WebThreadRunOnMainThread();

LABEL_5:
}

void __61__SUScriptStorePageViewController_setInputViewObeysDOMFocus___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v3, "copyScriptProperties");
  objc_msgSend(v2, "setInputViewObeysDOMFocus:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
  objc_msgSend(v3, "setScriptProperties:", v2);

}

- (void)setLoadingIndicatorStyle:(int64_t)a3
{
  WebThreadRunOnMainThread();
}

void __60__SUScriptStorePageViewController_setLoadingIndicatorStyle___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v3, "copyScriptProperties");
  objc_msgSend(v2, "setLoadingIndicatorStyle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setScriptProperties:", v2);

}

- (void)setLoadingTextColor:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = -[SUScriptViewController newScriptColorWithValue:](self, "newScriptColorWithValue:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    WebThreadRunOnMainThread();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

}

void __55__SUScriptStorePageViewController_setLoadingTextColor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v4, "copyScriptProperties");
  objc_msgSend(*(id *)(a1 + 40), "nativeColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLoadingTextColor:", v3);

  objc_msgSend(v4, "setScriptProperties:", v2);
}

- (void)setLoadingTextShadowColor:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = -[SUScriptViewController newScriptColorWithValue:](self, "newScriptColorWithValue:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    WebThreadRunOnMainThread();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

}

void __61__SUScriptStorePageViewController_setLoadingTextShadowColor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v4, "copyScriptProperties");
  objc_msgSend(*(id *)(a1 + 40), "nativeColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLoadingTextShadowColor:", v3);

  objc_msgSend(v4, "setScriptProperties:", v2);
}

- (void)setLoadsWhenHidden:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v3 = 0;
  }
  else if (v3 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    goto LABEL_5;
  }
  v3 = v3;
  WebThreadRunOnMainThread();

LABEL_5:
}

void __54__SUScriptStorePageViewController_setLoadsWhenHidden___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLoadsWhenHidden:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));

}

- (void)setPlaceholderBackgroundStyle:(id)a3
{
  SUScriptColor *v3;
  SUScriptColor *v4;
  SUGradient *v5;
  id v6;
  SUGradient *v7;

  v3 = (SUScriptColor *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v3 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[SUScriptColor initWithStyleString:]([SUScriptColor alloc], "initWithStyleString:", v3);

    v3 = v4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (SUGradient *)-[SUScriptColor copyNativeGradient](v3, "copyNativeGradient");
    if (!v3)
      goto LABEL_15;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[SUGradient initWithType:]([SUGradient alloc], "initWithType:", 0);
      -[SUScriptColor nativeColor](v3, "nativeColor");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[SUGradient addColorStopWithOffset:color:](v5, "addColorStopWithOffset:color:", objc_msgSend(v6, "CGColor"), 0.0);

      if (!v3)
        goto LABEL_15;
    }
    else
    {
      v5 = 0;
      if (!v3)
      {
LABEL_15:
        v7 = v5;
        WebThreadRunOnMainThread();

        goto LABEL_16;
      }
    }
  }
  if (v5)
    goto LABEL_15;
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
LABEL_16:

}

void __65__SUScriptStorePageViewController_setPlaceholderBackgroundStyle___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v3, "copyScriptProperties");
  objc_msgSend(v2, "setPlaceholderBackgroundGradient:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setScriptProperties:", v2);

}

- (void)setScrollingEnabled:(BOOL)a3
{
  WebThreadRunOnMainThread();
}

void __55__SUScriptStorePageViewController_setScrollingEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v3, "copyScriptProperties");
  objc_msgSend(v2, "setScrollingDisabled:", *(_BYTE *)(a1 + 40) == 0);
  objc_msgSend(v3, "setScriptProperties:", v2);

}

- (void)setSegmentedControl:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v4 = 0;
  }
  else if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
      goto LABEL_5;
    }
    -[SUScriptStorePageViewController _isSegmentedControlValid:](self, "_isSegmentedControlValid:", v4);
  }
  v4 = v4;
  WebThreadRunOnMainThread();

LABEL_5:
}

void __55__SUScriptStorePageViewController_setSegmentedControl___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  SUPageSectionGroup *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v6 = (id)v2;
  if (v3)
  {
    if (!*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(v3, "nativeSegmentedControl");
      v4 = (SUPageSectionGroup *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_setSegmentedControl:", v4);
      goto LABEL_8;
    }
    v4 = (SUPageSectionGroup *)objc_msgSend(v3, "newPageSectionGroup");
    if (objc_msgSend(*(id *)(a1 + 40), "nativeSelectedIndex") == -1)
    {
      objc_msgSend(v6, "sectionSegmentedControl");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUPageSectionGroup setDefaultSectionIndex:](v4, "setDefaultSectionIndex:", objc_msgSend(v5, "selectedItemIndex"));

    }
  }
  else
  {
    v4 = objc_alloc_init(SUPageSectionGroup);
  }
  objc_msgSend(v6, "reloadForSectionsWithGroup:", v4);
LABEL_8:

}

- (void)setShouldInvalidateForLowMemory:(BOOL)a3
{
  WebThreadRunOnMainThread();
}

void __67__SUScriptStorePageViewController_setShouldInvalidateForLowMemory___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldInvalidateForMemoryPurge:", *(unsigned __int8 *)(a1 + 40));

}

- (void)setShouldLoadProgressively:(BOOL)a3
{
  WebThreadRunOnMainThread();
}

void __62__SUScriptStorePageViewController_setShouldLoadProgressively___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v3, "copyScriptProperties");
  objc_msgSend(v2, "setShouldLoadProgressively:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(v3, "setScriptProperties:", v2);

}

- (void)setShouldShowFormAccessory:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = v3;
    WebThreadRunOnMainThread();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

}

void __62__SUScriptStorePageViewController_setShouldShowFormAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v3, "copyScriptProperties");
  objc_msgSend(v2, "setShouldShowFormAccessory:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
  objc_msgSend(v3, "setScriptProperties:", v2);

}

- (void)setShowsBackgroundShadow:(BOOL)a3
{
  WebThreadRunOnMainThread();
}

void __60__SUScriptStorePageViewController_setShowsBackgroundShadow___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v3, "copyScriptProperties");
  objc_msgSend(v2, "setShowsBackgroundShadow:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(v3, "setScriptProperties:", v2);

}

- (void)setShowsHorizontalScrollIndicator:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = v3;
    WebThreadRunOnMainThread();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

}

void __69__SUScriptStorePageViewController_setShowsHorizontalScrollIndicator___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v3, "copyScriptProperties");
  objc_msgSend(v2, "setShowsHorizontalScrollIndicator:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
  objc_msgSend(v3, "setScriptProperties:", v2);

}

- (void)setShowsVerticalScrollIndicator:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = v3;
    WebThreadRunOnMainThread();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

}

void __67__SUScriptStorePageViewController_setShowsVerticalScrollIndicator___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v3, "copyScriptProperties");
  objc_msgSend(v2, "setShowsVerticalScrollIndicator:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
  objc_msgSend(v3, "setScriptProperties:", v2);

}

- (void)setTimeoutInterval:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = v3;
    WebThreadRunOnMainThread();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

}

void __54__SUScriptStorePageViewController_setTimeoutInterval___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLRequestProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 40), "doubleValue");
  objc_msgSend(v3, "setTimeoutInterval:");
  objc_msgSend(v4, "setURLRequestProperties:", v3);

}

- (void)setURLs:(id)a3
{
  id v4;
  int v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v4 = 0;
  }
  v8 = 0;
  v5 = objc_msgSend((id)objc_opt_class(), "copyURLStrings:forValue:", &v8, v4);
  v6 = v8;
  if (v5)
  {
    -[SUScriptObject webThreadMainThreadBatchProxy](self, "webThreadMainThreadBatchProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setURLs:", v6);

  }
}

- (void)setUserInfo:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v3 = 0;
  }
  else if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
      goto LABEL_5;
    }
  }
  v3 = v3;
  WebThreadRunOnMainThread();

LABEL_5:
}

void __47__SUScriptStorePageViewController_setUserInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setScriptUserInfo:", *(_QWORD *)(a1 + 40));

}

- (BOOL)shouldLoadProgressively
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 1;
  WebThreadRunOnMainThread();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __58__SUScriptStorePageViewController_shouldLoadProgressively__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "copyScriptProperties");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "shouldLoadProgressively");
}

- (BOOL)shouldInvalidateForLowMemory
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 1;
  WebThreadRunOnMainThread();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __63__SUScriptStorePageViewController_shouldInvalidateForLowMemory__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "shouldInvalidateForMemoryPurge");

}

- (id)shouldShowFormAccessory
{
  id *v2;
  id v3;
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
    v2 = (id *)MEMORY[0x24BDBD270];
  else
    v2 = (id *)MEMORY[0x24BDBD268];
  v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __58__SUScriptStorePageViewController_shouldShowFormAccessory__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "copyScriptProperties");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "shouldShowFormAccessory");
}

- (BOOL)showsBackgroundShadow
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 1;
  WebThreadRunOnMainThread();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __56__SUScriptStorePageViewController_showsBackgroundShadow__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "copyScriptProperties");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "showsBackgroundShadow");
}

- (id)showsHorizontalScrollIndicator
{
  id *v2;
  id v3;
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
    v2 = (id *)MEMORY[0x24BDBD270];
  else
    v2 = (id *)MEMORY[0x24BDBD268];
  v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __65__SUScriptStorePageViewController_showsHorizontalScrollIndicator__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "copyScriptProperties");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "showsHorizontalScrollIndicator");
}

- (id)showsVerticalScrollIndicator
{
  id *v2;
  id v3;
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
    v2 = (id *)MEMORY[0x24BDBD270];
  else
    v2 = (id *)MEMORY[0x24BDBD268];
  v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __63__SUScriptStorePageViewController_showsVerticalScrollIndicator__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "copyScriptProperties");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "showsVerticalScrollIndicator");
}

- (NSNumber)timeoutInterval
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__13;
  v12 = __Block_byref_object_dispose__13;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __50__SUScriptStorePageViewController_timeoutInterval__block_invoke, &unk_24DE7B458, self, &v8);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);

  return (NSNumber *)v4;
}

void __50__SUScriptStorePageViewController_timeoutInterval__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x24BDD16E0]);
  objc_msgSend(v7, "URLRequestProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeoutInterval");
  v4 = objc_msgSend(v2, "initWithDouble:");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)URLs
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__13;
  v12 = __Block_byref_object_dispose__13;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __39__SUScriptStorePageViewController_URLs__block_invoke, &unk_24DE7B458, self, &v8);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __39__SUScriptStorePageViewController_URLs__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLRequestProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLs");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (NSString)userInfo
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__13;
  v8 = __Block_byref_object_dispose__13;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __43__SUScriptStorePageViewController_userInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_storePageViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scriptUserInfo");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int64_t)indicatorStyleGray
{
  return 2;
}

- (int64_t)indicatorStyleWhite
{
  return 1;
}

- (void)_setURLs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUScriptStorePageViewController _storePageViewController](self, "_storePageViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SUScriptStorePageViewController applyURLStrings:toViewController:](self, "applyURLStrings:toViewController:", v4, v5);

}

- (id)_copyURLsFromURLStrings:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = objc_alloc(MEMORY[0x24BDBCF48]);
        v12 = (void *)objc_msgSend(v11, "initWithString:", v10, (_QWORD)v14);
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_isSegmentedControlValid:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "segments");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "newPageSection", (_QWORD)v11);

        if (!v8)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (id)_pathForWebArchiveWithIdentifier:(id)a3 inDirectory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    NSTemporaryDirectory();
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(MEMORY[0x24BDD1580], "ensureDirectoryExists:", v6))
  {
    objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("webarchive"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_setValue:(id)a3 forScriptPropertyKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SUScriptStorePageViewController _storePageViewController](self, "_storePageViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v9, "copyScriptProperties");
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

  objc_msgSend(v9, "setScriptProperties:", v8);
}

- (id)_storePageViewController
{
  void *v2;
  uint64_t v3;

  -[SUScriptViewController nativeViewController](self, "nativeViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v2, "parentViewController");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  objc_msgSend((id)__KeyMapping_21, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptStorePageViewController;
    objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_16, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptStorePageViewController;
    objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)scriptAttributeKeys
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptStorePageViewController;
  -[SUScriptViewController scriptAttributeKeys](&v5, sel_scriptAttributeKeys);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__KeyMapping_21, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_16 = (uint64_t)sel_loadWebArchiveWithIdentifier_fromDirectory_;
    *(_QWORD *)algn_255186398 = CFSTR("loadWebArchive");
    qword_2551863A0 = (uint64_t)sel_reloadWithCallback_;
    unk_2551863A8 = CFSTR("reload");
    qword_2551863B0 = (uint64_t)sel_saveWebArchiveWithIdentifier_toDirectory_;
    unk_2551863B8 = CFSTR("saveWebArchive");
    qword_2551863C0 = (uint64_t)sel_setScrollEdgeInsetsWithTop_left_bottom_right_;
    unk_2551863C8 = CFSTR("setScrollEdgeInsets");
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("alwaysDispatchesScrollEvents"), CFSTR("doubleTapEnabled"), CFSTR("doubleTapEnabled"), CFSTR("flashesScrollIndicators"), CFSTR("flashesScrollIndicators"), CFSTR("inputViewObeysDOMFocus"), CFSTR("inputViewObeysDOMFocus"), CFSTR("loadingIndicatorStyle"), CFSTR("loadingIndicatorStyle"), CFSTR("loadingTextColor"), CFSTR("loadingTextColor"), CFSTR("loadingTextShadowColor"), CFSTR("loadingTextShadowColor"), CFSTR("loadsWhenHidden"), CFSTR("loadsWhenHidden"), CFSTR("placeholderBackgroundStyle"), CFSTR("placeholderBackgroundStyle"),
           CFSTR("rootObject"),
           CFSTR("rootObject"),
           CFSTR("scrollingEnabled"),
           CFSTR("scrollingEnabled"),
           CFSTR("segmentedControl"),
           CFSTR("segmentedControl"),
           CFSTR("shouldInvalidateForLowMemory"),
           CFSTR("shouldInvalidateForLowMemory"),
           CFSTR("shouldLoadProgressively"),
           CFSTR("shouldLoadProgressively"),
           CFSTR("shouldShowFormAccessory"),
           CFSTR("shouldShowFormAccessory"),
           CFSTR("showsBackgroundShadow"),
           CFSTR("showsBackgroundShadow"),
           CFSTR("showsHorizontalScrollIndicator"),
           CFSTR("showsHorizontalScrollIndicator"),
           CFSTR("showsVerticalScrollIndicator"),
           CFSTR("showsVerticalScrollIndicator"),
           CFSTR("timeoutInterval"),
           CFSTR("timeoutInterval"),
           CFSTR("urls"),
           CFSTR("URLs"),
           CFSTR("userInfo"),
           CFSTR("userInfo"),
           CFSTR("INDICATOR_STYLE_GRAY"),
           CFSTR("indicatorStyleGray"),
           CFSTR("INDICATOR_STYLE_WHITE"),
           CFSTR("indicatorStyleWhite"),
           0);
    v3 = (void *)__KeyMapping_21;
    __KeyMapping_21 = v2;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialURLStrings, 0);
}

@end
