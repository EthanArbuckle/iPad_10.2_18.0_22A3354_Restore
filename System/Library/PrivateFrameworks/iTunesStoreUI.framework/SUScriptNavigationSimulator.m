@implementation SUScriptNavigationSimulator

- (SUScriptNavigationSimulator)initWithNavigationController:(id)a3
{
  id v4;
  SUScriptNavigationSimulator *v5;
  SUScriptNavigationSimulator *v6;
  NSMutableArray *v7;
  NSMutableArray *enqueuedTransitions;
  void *v9;
  void *v10;
  SUScriptNavigationSimulator *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUScriptNavigationSimulator;
  v5 = -[SUScriptObject init](&v14, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_7;
  if (!v4)
    goto LABEL_9;
  objc_storeWeak((id *)&v5->_navigationController, v4);
  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  enqueuedTransitions = v6->_enqueuedTransitions;
  v6->_enqueuedTransitions = v7;

  objc_msgSend(v4, "viewControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_initialIndex = objc_msgSend(v9, "count") - 1;

  if (v6->_initialIndex < 0)
  {
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v4, "viewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", v6->_initialIndex);
  v11 = (SUScriptNavigationSimulator *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }
  if (v11)
  {
    -[SUScriptNavigationSimulator _popHandler](v6, "_popHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScriptNavigationSimulator setPopHandler:](v11, "setPopHandler:", v12);

LABEL_7:
    v11 = v6;
  }
LABEL_10:

  return v11;
}

+ (BOOL)transitioning
{
  return _transitionCount > 0;
}

+ (void)startTransition
{
  ++_transitionCount;
}

+ (void)stopTransition
{
  --_transitionCount;
}

- (WebScriptObject)transitionCallback
{
  WebScriptObject *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_transitionCallback;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (int64_t)indexCount
{
  return -[SUScriptNavigationSimulator visibleIndex](self, "visibleIndex") + 1;
}

- (int64_t)visibleIndex
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[SUScriptNavigationSimulator navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") - 1;

  return -[SUScriptNavigationSimulator _relativeIndexFromIndex:](self, "_relativeIndexFromIndex:", v5);
}

- (void)setTransitionCallback:(id)a3
{
  WebScriptObject *v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  WebScriptObject *transitionCallback;
  uint64_t v12;
  _BYTE v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (WebScriptObject *)a3;
  -[SUScriptObject lock](self, "lock");
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    v7 &= 2u;
  if (!v7)
    goto LABEL_9;
  *(_DWORD *)v13 = 138543618;
  *(_QWORD *)&v13[4] = objc_opt_class();
  *(_WORD *)&v13[12] = 2114;
  *(_QWORD *)&v13[14] = v4;
  v9 = *(id *)&v13[4];
  LODWORD(v12) = 22;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, v13, v12, *(_OWORD *)v13, *(_QWORD *)&v13[16], v14);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v10);
    SSFileLog();
LABEL_9:

  }
  transitionCallback = self->_transitionCallback;
  self->_transitionCallback = v4;

  -[SUScriptObject unlock](self, "unlock");
}

- (void)setIndexCount:(int64_t)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("indexCount"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)setVisibleIndex:(int64_t)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("visibleIndex"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)popViewWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  -[SUScriptNavigationSimulator popToViewAtIndex:completion:](self, "popToViewAtIndex:completion:", -[SUScriptNavigationSimulator visibleIndex](self, "visibleIndex") - 1, v4);

}

- (void)popToViewAtIndex:(int64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  int64_t v12;
  _QWORD v13[4];
  id v14;
  SUScriptNavigationSimulator *v15;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v6 = 0;
  }
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__SUScriptNavigationSimulator_popToViewAtIndex_completion___block_invoke;
  v13[3] = &unk_24DE7B0F0;
  v14 = v6;
  v15 = self;
  v8 = v6;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __59__SUScriptNavigationSimulator_popToViewAtIndex_completion___block_invoke_2;
  block[3] = &unk_24DE7BFD8;
  v11 = (id)MEMORY[0x220763634](v13);
  v12 = a3;
  block[4] = self;
  v9 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __59__SUScriptNavigationSimulator_popToViewAtIndex_completion___block_invoke(uint64_t a1)
{
  SUScriptFunction *v2;

  v2 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", *(_QWORD *)(a1 + 32));
  -[SUScriptFunction setThisObject:](v2, "setThisObject:", *(_QWORD *)(a1 + 40));
  -[SUScriptFunction callWithArguments:](v2, "callWithArguments:", 0);
  -[SUScriptFunction setThisObject:](v2, "setThisObject:", 0);

}

void __59__SUScriptNavigationSimulator_popToViewAtIndex_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  id v32;
  int *v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  int v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = *(_QWORD *)(a1 + 48) + objc_msgSend(*(id *)(a1 + 32), "initialIndex");
  if (v5 >= v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    return;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  objc_msgSend(v6, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    v8 &= 2u;
  if (!v8)
    goto LABEL_10;
  v42 = 138543362;
  v43 = (id)objc_opt_class();
  v10 = v43;
  LODWORD(v34) = 12;
  v33 = &v42;
  v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, &v42, v34);
    v9 = objc_claimAutoreleasedReturnValue();
    free(v11);
    v33 = (int *)v9;
    SSFileLog();
LABEL_10:

  }
  if ((v5 & 0x8000000000000000) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    v15 = (void *)MEMORY[0x24BDE57D8];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __59__SUScriptNavigationSimulator_popToViewAtIndex_completion___block_invoke_22;
    v35[3] = &unk_24DE7BFB0;
    v36 = *(id *)(a1 + 40);
    objc_msgSend(v15, "setCompletionBlock:", v35);
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "shouldLog");
    if (objc_msgSend(v16, "shouldLogToDisk"))
      v18 = v17 | 2;
    else
      v18 = v17;
    objc_msgSend(v16, "OSLogObject", v33);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      v18 &= 2u;
    if (v18)
    {
      v20 = (void *)objc_opt_class();
      v42 = 138543362;
      v43 = v20;
      v21 = v20;
      LODWORD(v34) = 12;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_21:

        objc_msgSend(*(id *)(a1 + 32), "navigationController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v23, "popToViewController:animated:", v14, 1);

        objc_msgSend(MEMORY[0x24BDE57D8], "commit");
        return;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v22, 4, &v42, v34);
      v19 = objc_claimAutoreleasedReturnValue();
      free(v22);
      SSFileLog();
    }

    goto LABEL_21;
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "viewControllers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v38 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v31, "bridgedNavigation") & 1) != 0)
        {

          objc_msgSend(*(id *)(a1 + 32), "navigationController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (id)objc_msgSend(v26, "popToViewController:animated:", 0, 1);
          goto LABEL_34;
        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v28)
        continue;
      break;
    }
  }
LABEL_34:

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __59__SUScriptNavigationSimulator_popToViewAtIndex_completion___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)pushViewWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;
  SUScriptNavigationSimulator *v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v4 = 0;
  }
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke;
  v10[3] = &unk_24DE7B0F0;
  v11 = v4;
  v12 = self;
  v6 = v4;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke_2;
  v8[3] = &unk_24DE7B280;
  v8[4] = self;
  v9 = (id)MEMORY[0x220763634](v10);
  v7 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke(uint64_t a1)
{
  SUScriptFunction *v2;

  v2 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", *(_QWORD *)(a1 + 32));
  -[SUScriptFunction setThisObject:](v2, "setThisObject:", *(_QWORD *)(a1 + 40));
  -[SUScriptFunction callWithArguments:](v2, "callWithArguments:", 0);
  -[SUScriptFunction setThisObject:](v2, "setThisObject:", 0);

}

void __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char *v7;
  unint64_t v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  _BYTE *v15;
  SUSnapshotViewController *v16;
  int v17;
  int v18;
  SUNavigationContainerViewController *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  SUScriptNavigationTransition *v24;
  SUScriptNavigationTransition *v25;
  _BYTE *v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31[3];
  _BYTE location[12];
  __int16 v33;
  char *v34;
  __int16 v35;
  char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "embeddedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (char *)objc_msgSend(v6, "count");

    v8 = 0x24BEB1000uLL;
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      v11 &= 2u;
    if (v11)
    {
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = objc_opt_class();
      v33 = 2048;
      v34 = v7 - 1;
      v35 = 2048;
      v36 = v7;
      v13 = *(id *)&location[4];
      LODWORD(v27) = 32;
      v26 = location;
      v14 = (void *)_os_log_send_and_compose_impl();

      v8 = 0x24BEB1000;
      if (v14)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, location, v27);
        v15 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        free(v14);
        v26 = v15;
        SSFileLog();

      }
    }
    else
    {

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(v8 + 3736), "sharedConfig");
      v16 = (SUSnapshotViewController *)objc_claimAutoreleasedReturnValue();
      v17 = -[SUSnapshotViewController shouldLog](v16, "shouldLog");
      if (-[SUSnapshotViewController shouldLogToDisk](v16, "shouldLogToDisk"))
        v18 = v17 | 2;
      else
        v18 = v17;
      -[SUSnapshotViewController OSLogObject](v16, "OSLogObject", v26);
      v19 = (SUNavigationContainerViewController *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v19->super.super.super.super, OS_LOG_TYPE_DEFAULT))
        v18 &= 2u;
      if (v18)
      {
        v20 = (void *)objc_opt_class();
        *(_DWORD *)location = 138543874;
        *(_QWORD *)&location[4] = v20;
        v33 = 2048;
        v34 = v7 - 1;
        v35 = 2048;
        v36 = v7;
        v21 = v20;
        LODWORD(v27) = 32;
        v22 = (void *)_os_log_send_and_compose_impl();

        if (!v22)
        {
LABEL_22:

          goto LABEL_23;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v22, 4, location, v27);
        v19 = (SUNavigationContainerViewController *)objc_claimAutoreleasedReturnValue();
        free(v22);
        SSFileLog();
      }
    }
    else
    {
      v16 = -[SUSnapshotViewController initWithOriginal:]([SUSnapshotViewController alloc], "initWithOriginal:", v4);
      objc_msgSend(v3, "setEmbeddedViewController:animated:completion:", v16, 0, 0);
      v19 = -[SUNavigationContainerViewController initWithChildViewController:]([SUNavigationContainerViewController alloc], "initWithChildViewController:", v4);
      -[SUNavigationContainerViewController setBridgedNavigation:](v19, "setBridgedNavigation:", objc_msgSend(v3, "bridgedNavigation"));
      objc_msgSend(*(id *)(a1 + 32), "_popHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUNavigationContainerViewController setPopHandler:](v19, "setPopHandler:", v23);

      objc_initWeak((id *)location, *(id *)(a1 + 32));
      v24 = [SUScriptNavigationTransition alloc];
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke_25;
      v28[3] = &unk_24DE7C050;
      objc_copyWeak(v31, (id *)location);
      v31[1] = v7 - 1;
      v31[2] = v7;
      v29 = v3;
      v30 = *(id *)(a1 + 40);
      v25 = -[SUScriptNavigationTransition initWithContainer:finishBlock:](v24, "initWithContainer:finishBlock:", v19, v28);
      -[SUScriptNavigationTransition setFromIndex:](v25, "setFromIndex:", v7 - 1);
      -[SUScriptNavigationTransition setToIndex:](v25, "setToIndex:", v7);
      objc_msgSend(*(id *)(a1 + 32), "_enqueueLoadingState:", v25);

      objc_destroyWeak(v31);
      objc_destroyWeak((id *)location);
    }

    goto LABEL_22;
  }
LABEL_23:

}

void __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  __int128 v25;
  int v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  objc_msgSend(v7, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    v9 &= 2u;
  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v12 = (void *)objc_opt_class();
    v13 = *(_QWORD *)(a1 + 56);
    v14 = *(_QWORD *)(a1 + 64);
    v26 = 138543874;
    v27 = v12;
    v28 = 2048;
    v29 = v13;
    v30 = 2048;
    v31 = v14;
    v15 = v12;
    LODWORD(v20) = 32;
    v16 = (void *)_os_log_send_and_compose_impl();

    if (v16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, &v26, v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      free(v16);
      SSFileLog();

    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "appearancePromise");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke_26;
  v21[3] = &unk_24DE7C028;
  objc_copyWeak(&v24, (id *)(a1 + 48));
  v25 = *(_OWORD *)(a1 + 56);
  v23 = *(id *)(a1 + 40);
  v19 = v6;
  v22 = v19;
  objc_msgSend(v18, "addFinishBlock:", v21);

  objc_destroyWeak(&v24);
}

void __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke_26(uint64_t a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;
  __int128 v6;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke_2_27;
  block[3] = &unk_24DE7C000;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v6 = *(_OWORD *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v5);
}

void __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke_2_27(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  int v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "shouldLog");
    if (objc_msgSend(v20, "shouldLogToDisk"))
      v22 = v21 | 2;
    else
      v22 = v21;
    objc_msgSend(v20, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      v22 &= 2u;
    if (v22)
    {
      v24 = objc_loadWeakRetained(v2);
      v25 = (void *)objc_opt_class();
      v26 = *(_QWORD *)(a1 + 56);
      v27 = *(_QWORD *)(a1 + 64);
      v33 = 138543874;
      v34 = v25;
      v35 = 2048;
      v36 = v26;
      v37 = 2048;
      v38 = v27;
      v28 = v25;
      LODWORD(v30) = 32;
      v29 = (void *)_os_log_send_and_compose_impl();

      if (!v29)
      {
LABEL_21:

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v29, 4, &v33, v30);
      v23 = objc_claimAutoreleasedReturnValue();
      free(v29);
      SSFileLog();
    }

    goto LABEL_21;
  }
  objc_msgSend(*(id *)(a1 + 32), "embeddedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "embeddedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v8 = (void *)MEMORY[0x24BDE57D8];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke_28;
  v31[3] = &unk_24DE7BFB0;
  v32 = *(id *)(a1 + 40);
  objc_msgSend(v8, "setCompletionBlock:", v31);
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldLog");
  if (objc_msgSend(v9, "shouldLogToDisk"))
    v11 = v10 | 2;
  else
    v11 = v10;
  objc_msgSend(v9, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    v11 &= 2u;
  if (!v11)
    goto LABEL_10;
  v13 = objc_loadWeakRetained(v2);
  v14 = (void *)objc_opt_class();
  v15 = *(_QWORD *)(a1 + 56);
  v16 = *(_QWORD *)(a1 + 64);
  v33 = 138543874;
  v34 = v14;
  v35 = 2048;
  v36 = v15;
  v37 = 2048;
  v38 = v16;
  v17 = v14;
  LODWORD(v30) = 32;
  v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v33, v30);
    v12 = objc_claimAutoreleasedReturnValue();
    free(v18);
    SSFileLog();
LABEL_10:

  }
  objc_msgSend(WeakRetained, "navigationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pushViewController:animated:", *(_QWORD *)(a1 + 32), 1);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  objc_msgSend(WeakRetained, "setLastVisibleIndex:", *(_QWORD *)(a1 + 64));

LABEL_22:
}

uint64_t __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_enqueueLoadingState:(id)a3
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  int v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  int v23;
  NSObject *v24;
  int v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int *v32;
  uint64_t v33;
  id v34;
  int v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v34 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[SUScriptNavigationSimulator enqueuedTransitions](self, "enqueuedTransitions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 2)
  {
    v6 = 1;
    while (1)
    {
      -[SUScriptNavigationSimulator enqueuedTransitions](self, "enqueuedTransitions", v32);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setStatus:", 2);
      -[SUScriptNavigationSimulator enqueuedTransitions](self, "enqueuedTransitions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectAtIndex:", v6);

      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "shouldLog");
      if (objc_msgSend(v10, "shouldLogToDisk"))
        v12 = v11 | 2;
      else
        v12 = v11;
      objc_msgSend(v10, "OSLogObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        v14 = v12;
      else
        v14 = v12 & 2;
      if (!v14)
        goto LABEL_12;
      v15 = (void *)objc_opt_class();
      v16 = v15;
      v17 = objc_msgSend(v8, "fromIndex");
      v18 = objc_msgSend(v8, "toIndex");
      v35 = 138543874;
      v36 = v15;
      v37 = 2048;
      v38 = v17;
      v39 = 2048;
      v40 = v18;
      LODWORD(v33) = 32;
      v32 = &v35;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (v19)
        break;
LABEL_13:

      ++v6;
      -[SUScriptNavigationSimulator enqueuedTransitions](self, "enqueuedTransitions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v6 >= v21)
        goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, &v35, v33);
    v13 = objc_claimAutoreleasedReturnValue();
    free(v19);
    v32 = (int *)v13;
    SSFileLog();
LABEL_12:

    goto LABEL_13;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig", v32);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "shouldLog");
  if (objc_msgSend(v22, "shouldLogToDisk"))
    v23 |= 2u;
  objc_msgSend(v22, "OSLogObject");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    v25 = v23;
  else
    v25 = v23 & 2;
  if (!v25)
    goto LABEL_22;
  v26 = (void *)objc_opt_class();
  v27 = v26;
  -[SUScriptNavigationSimulator enqueuedTransitions](self, "enqueuedTransitions");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");
  v35 = 138543618;
  v36 = v26;
  v37 = 2048;
  v38 = v29;
  LODWORD(v33) = 22;
  v30 = (void *)_os_log_send_and_compose_impl();

  if (v30)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v30, 4, &v35, v33);
    v24 = objc_claimAutoreleasedReturnValue();
    free(v30);
    SSFileLog();
LABEL_22:

  }
  -[SUScriptNavigationSimulator enqueuedTransitions](self, "enqueuedTransitions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v34);

  -[SUScriptNavigationSimulator _startNextTransition](self, "_startNextTransition");
}

- (void)_handlePopFromIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  id v11;
  void *v12;
  _BYTE *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  SUScriptNavigationTransition *v35;
  SUScriptNavigationTransition *v36;
  void *v37;
  int v38;
  int v39;
  NSObject *v40;
  int v41;
  void *v42;
  id v43;
  void *v44;
  _BYTE *v45;
  uint64_t v46;
  _QWORD v48[4];
  id v49[3];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE location[12];
  __int16 v56;
  int64_t v57;
  __int16 v58;
  int64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  objc_msgSend(v6, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    v10 = v8;
  else
    v10 = v8 & 2;
  if (v10)
  {
    *(_DWORD *)location = 138543874;
    *(_QWORD *)&location[4] = objc_opt_class();
    v56 = 2048;
    v57 = a3;
    v58 = 2048;
    v59 = a4;
    v11 = *(id *)&location[4];
    LODWORD(v46) = 32;
    v45 = location;
    v12 = (void *)_os_log_send_and_compose_impl();

    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, location, v46);
      v13 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      free(v12);
      v45 = v13;
      SSFileLog();

    }
  }
  else
  {

  }
  v14 = -[SUScriptNavigationSimulator initialIndex](self, "initialIndex");
  -[SUScriptNavigationSimulator navigationController](self, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "viewControllers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v14 < objc_msgSend(v16, "count");

  if (v17)
  {
    do
    {
      -[SUScriptNavigationSimulator navigationController](self, "navigationController", v45);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "viewControllers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeAllAnimations");

      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      objc_msgSend(v20, "childViewControllers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v51 != v25)
              objc_enumerationMutation(v23);
            objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "view");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "layer");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "removeAllAnimations");

          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
        }
        while (v24);
      }

      -[SUScriptNavigationSimulator navigationController](self, "navigationController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "viewControllers");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");

      ++v14;
    }
    while (v14 < v31);
  }
  -[SUScriptNavigationSimulator navigationController](self, "navigationController", v45);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "viewControllers");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 < 0 || objc_msgSend(v33, "count") <= (unint64_t)a4)
  {
    v34 = 0;
  }
  else
  {
    objc_msgSend(v33, "objectAtIndexedSubscript:", a4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "shouldLog");
    if (objc_msgSend(v37, "shouldLogToDisk"))
      v39 = v38 | 2;
    else
      v39 = v38;
    objc_msgSend(v37, "OSLogObject");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      v41 = v39;
    else
      v41 = v39 & 2;
    if (v41)
    {
      v42 = (void *)objc_opt_class();
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = v42;
      v56 = 2048;
      v57 = a3;
      v58 = 2048;
      v59 = a4;
      v43 = v42;
      LODWORD(v46) = 32;
      v44 = (void *)_os_log_send_and_compose_impl();

      if (!v44)
      {
LABEL_36:

        goto LABEL_37;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v44, 4, location, v46);
      v40 = objc_claimAutoreleasedReturnValue();
      free(v44);
      SSFileLog();
    }

    goto LABEL_36;
  }
  objc_initWeak((id *)location, self);
  v35 = [SUScriptNavigationTransition alloc];
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __59__SUScriptNavigationSimulator__handlePopFromIndex_toIndex___block_invoke;
  v48[3] = &unk_24DE7C0A0;
  objc_copyWeak(v49, (id *)location);
  v49[1] = (id)a3;
  v49[2] = (id)a4;
  v36 = -[SUScriptNavigationTransition initWithContainer:finishBlock:](v35, "initWithContainer:finishBlock:", v34, v48);
  -[SUScriptNavigationTransition setFromIndex:](v36, "setFromIndex:", a3);
  -[SUScriptNavigationTransition setToIndex:](v36, "setToIndex:", a4);
  -[SUScriptNavigationSimulator _enqueueLoadingState:](self, "_enqueueLoadingState:", v36);

  objc_destroyWeak(v49);
  objc_destroyWeak((id *)location);
LABEL_37:

}

void __59__SUScriptNavigationSimulator__handlePopFromIndex_toIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD block[4];
  id v18;
  id v19;
  __int128 v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    v7 &= 2u;
  if (!v7)
    goto LABEL_9;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = (void *)objc_opt_class();
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  v21 = 138543874;
  v22 = v10;
  v23 = 2048;
  v24 = v11;
  v25 = 2048;
  v26 = v12;
  v13 = v10;
  LODWORD(v16) = 32;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v21, v16);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v14);
    SSFileLog();
LABEL_9:

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SUScriptNavigationSimulator__handlePopFromIndex_toIndex___block_invoke_31;
  block[3] = &unk_24DE7C078;
  objc_copyWeak(&v19, (id *)(a1 + 32));
  v20 = *(_OWORD *)(a1 + 40);
  v18 = v4;
  v15 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v19);
}

void __59__SUScriptNavigationSimulator__handlePopFromIndex_toIndex___block_invoke_31(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  _BYTE v29[24];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v21 = v20 | 2;
    else
      v21 = v20;
    objc_msgSend(v6, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      v21 &= 2u;
    if (!v21)
      goto LABEL_22;
    v22 = objc_loadWeakRetained(v2);
    v23 = (void *)objc_opt_class();
    v24 = *(_QWORD *)(a1 + 48);
    v25 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)v29 = 138543874;
    *(_QWORD *)&v29[4] = v23;
    *(_WORD *)&v29[12] = 2048;
    *(_QWORD *)&v29[14] = v24;
    *(_WORD *)&v29[22] = 2048;
    v30 = v25;
    v26 = v23;
    LODWORD(v28) = 32;
    v27 = (void *)_os_log_send_and_compose_impl();

    if (v27)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v27, 4, v29, v28, *(_QWORD *)v29, *(_OWORD *)&v29[8], v30);
      v17 = objc_claimAutoreleasedReturnValue();
      free(v27);
      SSFileLog();
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 == objc_msgSend(WeakRetained, "lastVisibleIndex"))
  {
    objc_msgSend(*(id *)(a1 + 32), "embeddedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "shouldLog");
      if (objc_msgSend(v7, "shouldLogToDisk"))
        v9 = v8 | 2;
      else
        v9 = v8;
      objc_msgSend(v7, "OSLogObject");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        v9 &= 2u;
      if (v9)
      {
        v11 = objc_loadWeakRetained(v2);
        v12 = (void *)objc_opt_class();
        v13 = *(_QWORD *)(a1 + 48);
        v14 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)v29 = 138543874;
        *(_QWORD *)&v29[4] = v12;
        *(_WORD *)&v29[12] = 2048;
        *(_QWORD *)&v29[14] = v13;
        *(_WORD *)&v29[22] = 2048;
        v30 = v14;
        v15 = v12;
        LODWORD(v28) = 32;
        v16 = (void *)_os_log_send_and_compose_impl();

        if (!v16)
        {
LABEL_13:

          objc_msgSend(v6, "originalViewController");
          v17 = objc_claimAutoreleasedReturnValue();
          -[NSObject view](v17, "view");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setNeedsLayout");

          -[NSObject view](v17, "view");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "layoutIfNeeded");

          objc_msgSend(*(id *)(a1 + 32), "setEmbeddedViewController:animated:completion:", v17, 0, 0);
LABEL_22:

          goto LABEL_23;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, v29, v28, *(_OWORD *)v29, *(_QWORD *)&v29[16], v30);
        v10 = objc_claimAutoreleasedReturnValue();
        free(v16);
        SSFileLog();
      }

      goto LABEL_13;
    }
LABEL_23:

  }
}

- (id)_popHandler
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__SUScriptNavigationSimulator__popHandler__block_invoke;
  v5[3] = &unk_24DE7C0C8;
  v5[4] = self;
  v2 = (void *)MEMORY[0x220763634](v5, a2);
  v3 = (void *)MEMORY[0x220763634]();

  return v3;
}

void __42__SUScriptNavigationSimulator__popHandler__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "lastVisibleIndex");
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v4);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v8 != v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setLastVisibleIndex:", v8);
    objc_msgSend(*(id *)(a1 + 32), "_handlePopFromIndex:toIndex:", v5, v8);
  }
}

- (void)_startNextTransition
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id location[4];

  location[3] = *(id *)MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[SUScriptNavigationSimulator enqueuedTransitions](self, "enqueuedTransitions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && !objc_msgSend(v4, "status"))
  {
    objc_msgSend(v4, "setStatus:", 1);
    objc_initWeak(location, self);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __51__SUScriptNavigationSimulator__startNextTransition__block_invoke;
    v13[3] = &unk_24DE7C0F0;
    objc_copyWeak(&v14, location);
    objc_msgSend(v4, "addFinishBlock:", v13);
    -[SUScriptNavigationSimulator _callCallbackWithWithTransition:](self, "_callCallbackWithWithTransition:", v4);
    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      v7 &= 2u;
    if (v7)
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = (id)objc_opt_class();
      v9 = *(id *)((char *)location + 4);
      LODWORD(v12) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (v10)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, location, v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        free(v10);
        SSFileLog();

      }
    }
    else
    {

    }
  }

}

void __51__SUScriptNavigationSimulator__startNextTransition__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__SUScriptNavigationSimulator__startNextTransition__block_invoke_2;
  v5[3] = &unk_24DE7B5F0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __51__SUScriptNavigationSimulator__startNextTransition__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "enqueuedTransitions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 32));

  objc_msgSend(WeakRetained, "_startNextTransition");
}

- (void)_callCallbackWithWithTransition:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  SUScriptFunction *v17;
  void *v18;
  SUScriptFunction *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int *v32;
  uint64_t v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[3];
  int v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    v9 = v7;
  else
    v9 = v7 & 2;
  if (v9)
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    v12 = objc_msgSend(v4, "fromIndex");
    v13 = objc_msgSend(v4, "toIndex");
    -[SUScriptNavigationSimulator transitionCallback](self, "transitionCallback");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138544130;
    v38 = v10;
    v39 = 2048;
    v40 = v12;
    v41 = 2048;
    v42 = v13;
    v43 = 2114;
    v44 = v14;
    LODWORD(v33) = 42;
    v32 = &v37;
    v15 = (void *)_os_log_send_and_compose_impl();

    if (!v15)
      goto LABEL_11;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v37, v33);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v15);
    v32 = (int *)v8;
    SSFileLog();
  }

LABEL_11:
  -[SUScriptNavigationSimulator transitionCallback](self, "transitionCallback");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "shouldLog");
    if (objc_msgSend(v23, "shouldLogToDisk"))
      v25 = v24 | 2;
    else
      v25 = v24;
    objc_msgSend(v23, "OSLogObject", v32);
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      v25 &= 2u;
    if (v25)
    {
      v27 = (void *)objc_opt_class();
      v28 = v27;
      v29 = objc_msgSend(v4, "fromIndex");
      v30 = objc_msgSend(v4, "toIndex");
      v37 = 138543874;
      v38 = v27;
      v39 = 2048;
      v40 = v29;
      v41 = 2048;
      v42 = v30;
      LODWORD(v33) = 32;
      v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
      {
LABEL_22:

        -[SUScriptObject dispatchEvent:forName:](self, "dispatchEvent:forName:", v4, CFSTR("simulatorWillTransition"));
        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v31, 4, &v37, v33);
      v26 = objc_claimAutoreleasedReturnValue();
      free(v31);
      SSFileLog();
    }

    goto LABEL_22;
  }
  v17 = [SUScriptFunction alloc];
  -[SUScriptNavigationSimulator transitionCallback](self, "transitionCallback");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SUScriptFunction initWithScriptObject:](v17, "initWithScriptObject:", v18);

  -[SUScriptFunction setThisObject:](v19, "setThisObject:", self);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SUScriptNavigationSimulator _relativeIndexFromIndex:](self, "_relativeIndexFromIndex:", objc_msgSend(v4, "fromIndex")));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v20;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SUScriptNavigationSimulator _relativeIndexFromIndex:](self, "_relativeIndexFromIndex:", objc_msgSend(v4, "toIndex")));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v21;
  v36[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __63__SUScriptNavigationSimulator__callCallbackWithWithTransition___block_invoke;
  v34[3] = &unk_24DE7C118;
  v34[4] = self;
  v35 = v4;
  -[SUScriptFunction callWithArguments:completionBlock:](v19, "callWithArguments:completionBlock:", v22, v34);
  -[SUScriptFunction setThisObject:](v19, "setThisObject:", 0);

LABEL_23:
}

void __63__SUScriptNavigationSimulator__callCallbackWithWithTransition___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  _BYTE v28[24];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) == 0 || !objc_msgSend(v3, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      v12 &= 2u;
    if (v12)
    {
      *(_DWORD *)v28 = 138543618;
      *(_QWORD *)&v28[4] = objc_opt_class();
      *(_WORD *)&v28[12] = 2114;
      *(_QWORD *)&v28[14] = v3;
      v14 = *(id *)&v28[4];
      LODWORD(v27) = 22;
      v26 = v28;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
        goto LABEL_22;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, v28, v27, *(_QWORD *)v28, *(_OWORD *)&v28[8]);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v15);
      v26 = v13;
      SSFileLog();
    }

LABEL_22:
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "shouldLog");
    if (objc_msgSend(v16, "shouldLogToDisk"))
      v18 = v17 | 2;
    else
      v18 = v17;
    objc_msgSend(v16, "OSLogObject", v26);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      v18 &= 2u;
    if (v18)
    {
      v20 = (void *)objc_opt_class();
      v21 = *(void **)(a1 + 40);
      v22 = v20;
      v23 = objc_msgSend(v21, "fromIndex");
      v24 = objc_msgSend(*(id *)(a1 + 40), "toIndex");
      *(_DWORD *)v28 = 138543874;
      *(_QWORD *)&v28[4] = v20;
      *(_WORD *)&v28[12] = 2048;
      *(_QWORD *)&v28[14] = v23;
      *(_WORD *)&v28[22] = 2048;
      v29 = v24;
      LODWORD(v27) = 32;
      v25 = (void *)_os_log_send_and_compose_impl();

      if (!v25)
      {
LABEL_31:

        objc_msgSend(*(id *)(a1 + 32), "dispatchEvent:forName:", *(_QWORD *)(a1 + 40), CFSTR("simulatorWillTransition"));
        goto LABEL_32;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v25, 4, v28, v27);
      v19 = objc_claimAutoreleasedReturnValue();
      free(v25);
      SSFileLog();
    }

    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  *(_DWORD *)v28 = 138543362;
  *(_QWORD *)&v28[4] = objc_opt_class();
  v8 = *(id *)&v28[4];
  LODWORD(v27) = 12;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, v28, v27, *(_OWORD *)v28);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog();
LABEL_11:

  }
LABEL_32:

}

- (int64_t)_relativeIndexFromIndex:(int64_t)a3
{
  return a3 - -[SUScriptNavigationSimulator initialIndex](self, "initialIndex");
}

- (id)_className
{
  return CFSTR("iTunesNavigationSimulator");
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  objc_msgSend((id)__KeyMapping_10, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptNavigationSimulator;
    objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptNavigationSimulator;
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
  v5.super_class = (Class)SUScriptNavigationSimulator;
  -[SUScriptObject scriptAttributeKeys](&v5, sel_scriptAttributeKeys);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__KeyMapping_10, "allKeys");
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
    __SelectorMapping_7 = (uint64_t)sel_popViewWithCompletion_;
    unk_255186130 = CFSTR("popView");
    qword_255186138 = (uint64_t)sel_popToViewAtIndex_completion_;
    unk_255186140 = CFSTR("popToView");
    qword_255186148 = (uint64_t)sel_pushViewWithCompletion_;
    unk_255186150 = CFSTR("pushView");
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("transitionCallback"), CFSTR("visibleIndex"), CFSTR("visibleIndex"), CFSTR("indexCount"), CFSTR("indexCount"), 0);
    v3 = (void *)__KeyMapping_10;
    __KeyMapping_10 = v2;

  }
}

- (int64_t)initialIndex
{
  return self->_initialIndex;
}

- (void)setInitialIndex:(int64_t)a3
{
  self->_initialIndex = a3;
}

- (int64_t)lastVisibleIndex
{
  return self->_lastVisibleIndex;
}

- (void)setLastVisibleIndex:(int64_t)a3
{
  self->_lastVisibleIndex = a3;
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void)setNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_navigationController, a3);
}

- (NSMutableArray)enqueuedTransitions
{
  return self->_enqueuedTransitions;
}

- (void)setEnqueuedTransitions:(id)a3
{
  objc_storeStrong((id *)&self->_enqueuedTransitions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enqueuedTransitions, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_storeStrong((id *)&self->_transitionCallback, 0);
}

@end
