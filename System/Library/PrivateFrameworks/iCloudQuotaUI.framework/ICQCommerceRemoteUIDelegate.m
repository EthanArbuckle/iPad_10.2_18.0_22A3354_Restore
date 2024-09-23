@implementation ICQCommerceRemoteUIDelegate

- (BOOL)_isPurchaseTokenOperation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(a3, "requestProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "HTTPHeaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("X-Apple-GS-Token"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (int64_t)_statusCodeForFinishedOperation:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "statusCode");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_isSuccessfulPurchaseTokenOperation:(id)a3
{
  return -[ICQCommerceRemoteUIDelegate _statusCodeForFinishedOperation:](self, "_statusCodeForFinishedOperation:", a3) == 200;
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__ICQCommerceRemoteUIDelegate_operation_finishedWithOutput___block_invoke;
  block[3] = &unk_24E3F4098;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __60__ICQCommerceRemoteUIDelegate_operation_finishedWithOutput___block_invoke(id *a1)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id location;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNetworkActivityIndicatorVisible:", 0);

  v3 = a1[4];
  if (!*((_BYTE *)v3 + 74))
  {
    if (*((_QWORD *)v3 + 10))
    {
      objc_initWeak(&location, v3);
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __60__ICQCommerceRemoteUIDelegate_operation_finishedWithOutput___block_invoke_2;
      v7[3] = &unk_24E3F5878;
      objc_copyWeak(&v10, &location);
      v8 = a1[5];
      v9 = a1[6];
      v4 = _Block_copy(v7);
      v5 = a1[4];
      v6 = (void *)v5[11];
      v5[11] = v4;

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(a1[4], "_handleFinishForOperation:withOutput:", a1[5], a1[6]);
    }
  }
}

void __60__ICQCommerceRemoteUIDelegate_operation_finishedWithOutput___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleFinishForOperation:withOutput:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_handleFinishForOperation:(id)a3 withOutput:(id)a4
{
  id v7;
  id v8;
  ISURLOperation **p_finishingOperation;
  void *v10;
  NSObject *v11;
  BOOL v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  int64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  UINavigationController *navigationController;
  ICQCommerceNavigationController *v27;
  UINavigationController *v28;
  id WeakRetained;
  char v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  UINavigationController *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  int v56;
  const __CFString *v57;
  int v58;
  UIViewController *v59;
  UIViewController *topViewController;
  ISURLOperation *v61;
  uint64_t v62;
  int v63;
  UINavigationController *v64;
  UINavigationController *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD v69[5];
  _QWORD v70[5];
  uint8_t buf[4];
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  p_finishingOperation = &self->_finishingOperation;
  objc_storeStrong((id *)&self->_finishingOperation, a3);
  objc_msgSend(v7, "dataProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICQCommerceRemoteUIDelegate skipGoBack](self, "skipGoBack"))
  {
    ICQUSLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "async operation in flight -- skipGoBack set", buf, 2u);
    }

  }
  v12 = -[ICQCommerceRemoteUIDelegate skipGoBack](self, "skipGoBack");
  -[ICQCommerceRemoteUIDelegate setSkipGoBack:](self, "setSkipGoBack:", 0);
  if (-[ICQCommerceRemoteUIDelegate didJustCancelDialog](self, "didJustCancelDialog"))
  {
    ICQUSLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "server dialog was just canceled", buf, 2u);
    }

  }
  v14 = -[ICQCommerceRemoteUIDelegate didJustCancelDialog](self, "didJustCancelDialog");
  -[ICQCommerceRemoteUIDelegate setDidJustCancelDialog:](self, "setDidJustCancelDialog:", 0);
  if ((objc_msgSend(v10, "isPlist") & 1) == 0)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7EDF0]), "initWithXML:", v8);
    if (PSIsInternalInstall()
      && CFPreferencesGetAppBooleanValue(CFSTR("loggingEnabled"), CFSTR("com.apple.RemoteUI"), 0))
    {
      ICQUSLogForCategory(0);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
        *(_DWORD *)buf = 138412290;
        v72 = v23;
        _os_log_impl(&dword_21F2CC000, v22, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

      }
    }
    if ((objc_msgSend(v19, "succeeded") & 1) == 0)
    {
      ISError();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQCommerceRemoteUIDelegate _handleOperationError:](self, "_handleOperationError:", v24);
LABEL_102:

      goto LABEL_103;
    }
    objc_msgSend(v19, "uiObjectModel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "actionSignal");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDelegate:", self);
    if (!-[NSMutableArray count](self->_objectModels, "count") && objc_msgSend(v25, "topSignal") == 3)
      objc_msgSend(v25, "setTopSignal:", 2);
    navigationController = self->_navigationController;
    if (!navigationController)
    {
      v27 = objc_alloc_init(ICQCommerceNavigationController);
      v28 = self->_navigationController;
      self->_navigationController = &v27->super;

      -[UINavigationController setModalPresentationStyle:](self->_navigationController, "setModalPresentationStyle:", 2);
      -[UINavigationController setModalTransitionStyle:](self->_navigationController, "setModalTransitionStyle:", 0);
    }
    if (!objc_msgSend(v25, "topSignal"))
      objc_msgSend(v25, "setTopSignal:", 2);
    if (objc_msgSend(v25, "topSignal") == 2)
    {
      v64 = navigationController;
      v67 = v10;
      -[NSMutableArray addObject:](self->_objectModels, "addObject:", v24);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v30 = objc_opt_respondsToSelector();

      if ((v30 & 1) != 0)
      {
        objc_msgSend(v24, "defaultPages");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          -[ICQCommerceRemoteUIDelegate _handleFinishForOperation:withOutput:].cold.1();
        if (v32)
        {
          v33 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v33, "commerceDelegate:willPresentObjectModel:page:", self, v24, v32);

        }
      }
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "bundleIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      -[UINavigationController topViewController](self->_navigationController, "topViewController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = objc_msgSend(v35, "isEqualToString:", CFSTR("com.apple.Preferences"));

        if (v37)
        {
          self->_pseudoModallyPresented = 1;
          v38 = self->_navigationController;
          v70[0] = MEMORY[0x24BDAC760];
          v70[1] = 3221225472;
          v70[2] = __68__ICQCommerceRemoteUIDelegate__handleFinishForOperation_withOutput___block_invoke;
          v70[3] = &unk_24E3F3610;
          v70[4] = self;
          objc_msgSend(v24, "presentInParentViewController:animated:completion:", v38, 0, v70);

          v10 = v67;
          goto LABEL_76;
        }
      }
      else
      {

      }
      objc_msgSend(v24, "presentInParentViewController:animated:", self->_navigationController, v64 != 0);

      v10 = v67;
      if (!v64)
      {
LABEL_76:
        if (self->_modallyPresented)
          -[UINavigationController presentViewController:animated:completion:](self->_parentNavigationController, "presentViewController:animated:completion:", self->_navigationController, 1, 0);
      }
LABEL_78:

      goto LABEL_102;
    }
    if (objc_msgSend(v25, "topSignal") == 3)
    {
      -[UINavigationController viewControllers](self->_navigationController, "viewControllers");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v10;
      v40 = (void *)objc_msgSend(v39, "mutableCopy");

      -[NSMutableArray removeLastObject](self->_objectModels, "removeLastObject");
      objc_msgSend(v40, "removeLastObject");
      objc_msgSend(v24, "defaultPages");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "lastObject");
      v65 = navigationController;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addObject:", v42);

      -[NSMutableArray addObject:](self->_objectModels, "addObject:", v24);
      goto LABEL_47;
    }
    if (objc_msgSend(v25, "topSignal") == 4)
    {
      v68 = v10;
      objc_msgSend(v24, "defaultPages");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "count");

      if (v48)
      {
        if ((unint64_t)-[NSMutableArray count](self->_objectModels, "count") > 1)
        {
          -[NSMutableArray removeLastObject](self->_objectModels, "removeLastObject");
          -[NSMutableArray removeLastObject](self->_objectModels, "removeLastObject");
          -[UINavigationController viewControllers](self->_navigationController, "viewControllers");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)objc_msgSend(v50, "mutableCopy");

          objc_msgSend(v40, "removeLastObject");
          objc_msgSend(v40, "removeLastObject");
          -[NSMutableArray addObject:](self->_objectModels, "addObject:", v24);
          objc_msgSend(v24, "defaultPages");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "lastObject");
          v65 = navigationController;
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v52);

LABEL_47:
          -[UINavigationController setViewControllers:animated:](self->_navigationController, "setViewControllers:animated:", v40, 0);

          v10 = v68;
          if (!v65)
            goto LABEL_76;
          goto LABEL_78;
        }
        ICQUSLogForCategory(0);
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F2CC000, v49, OS_LOG_TYPE_DEFAULT, "Pop + Replace requires at least 2 existing object models.", buf, 2u);
        }

      }
      else
      {
        -[ICQCommerceRemoteUIDelegate _popObjectModelAnimated:](self, "_popObjectModelAnimated:", 1);
      }
      v10 = v68;
    }
    if (!navigationController)
      goto LABEL_76;
    goto LABEL_78;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v66 = v10;
    ICQUSLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v72 = v8;
      _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "Store operation completed with response %@", buf, 0xCu);
    }

    LODWORD(v62) = -[ICQCommerceRemoteUIDelegate _isPurchaseTokenOperation:](self, "_isPurchaseTokenOperation:", v7);
    if ((_DWORD)v62)
    {
      v16 = -[ICQCommerceRemoteUIDelegate _statusCodeForFinishedOperation:](self, "_statusCodeForFinishedOperation:", v7);
      ICQUSLogForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v72 = v18;
        _os_log_impl(&dword_21F2CC000, v17, OS_LOG_TYPE_DEFAULT, "Purchase token operation status code: %@", buf, 0xCu);

      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("failureType"), v62);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[ICQCommerceRemoteUIDelegate setFailureType:](self, "setFailureType:", objc_msgSend(v19, "integerValue"));
      ICQUSLogForCategory(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[ICQCommerceRemoteUIDelegate failureType](self, "failureType"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v72 = v21;
        _os_log_impl(&dword_21F2CC000, v20, OS_LOG_TYPE_DEFAULT, "ft=%@", buf, 0xCu);

      }
    }
    else
    {
      -[ICQCommerceRemoteUIDelegate setFailureType:](self, "setFailureType:", 0);
    }
    if ((-[ICQCommerceRemoteUIDelegate failureType](self, "failureType") == 8067
       || -[ICQCommerceRemoteUIDelegate failureType](self, "failureType") == 3067)
      && -[ICQCommerceRemoteUIDelegate forRetailOffer](self, "forRetailOffer"))
    {
      -[ICQCommerceRemoteUIDelegate _clearRetailFollowUpItem](self, "_clearRetailFollowUpItem");
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("dialog"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v43)
    {
      ICQUSLogForCategory(0);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F2CC000, v44, OS_LOG_TYPE_DEFAULT, "no dialog; checking for message", buf, 2u);
      }

      objc_msgSend(v8, "objectForKey:", CFSTR("customerMessage"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v45, "length"))
      {
        if (v63 && !-[ICQCommerceRemoteUIDelegate skipRetryWithoutToken](self, "skipRetryWithoutToken"))
        {
          ICQUSLogForCategory(0);
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21F2CC000, v53, OS_LOG_TYPE_DEFAULT, "retryPurchaseWithoutToken", buf, 2u);
          }

          -[ICQCommerceRemoteUIDelegate retryPurchaseWithoutToken](self, "retryPurchaseWithoutToken");
        }
        else
        {
          ICQUSLogForCategory(0);
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v72 = v45;
            _os_log_impl(&dword_21F2CC000, v46, OS_LOG_TYPE_DEFAULT, "show error with title: %@", buf, 0xCu);
          }

          v69[0] = MEMORY[0x24BDAC760];
          v69[1] = 3221225472;
          v69[2] = __68__ICQCommerceRemoteUIDelegate__handleFinishForOperation_withOutput___block_invoke_84;
          v69[3] = &unk_24E3F3610;
          v69[4] = self;
          -[ICQCommerceRemoteUIDelegate errorWithTitle:andExplanation:dismissedCompletion:](self, "errorWithTitle:andExplanation:dismissedCompletion:", v45, 0, v69);
        }
        v10 = v66;
      }

    }
    if (-[ICQCommerceRemoteUIDelegate skipCompletionAlert](self, "skipCompletionAlert")
      && (unint64_t)(-[ICQCommerceRemoteUIDelegate failureType](self, "failureType") - 3067) <= 1)
    {
      -[ICQCommerceRemoteUIDelegate userCompletedFlow:](self, "userCompletedFlow:", -[ICQCommerceRemoteUIDelegate failureType](self, "failureType"));
      -[UINavigationController topViewController](self->_navigationController, "topViewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQCommerceRemoteUIDelegate cancelRemoteUIKeeping:](self, "cancelRemoteUIKeeping:", v24);
      goto LABEL_102;
    }
    if (v12)
    {
LABEL_103:

      goto LABEL_104;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("action"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v54;
    if (v54)
    {
      objc_msgSend(v54, "objectForKey:", CFSTR("kind"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "isEqualToString:", CFSTR("GoBack"));

      if (v56)
      {
        v57 = CFSTR("server provided action GoBack");
        if (!v14)
        {
LABEL_100:
          -[ICQCommerceRemoteUIDelegate cancelFlowBecause:](self, "cancelFlowBecause:", v57);
          -[ICQCommerceRemoteUIDelegate cancelRemoteUI](self, "cancelRemoteUI");
          goto LABEL_101;
        }
        v58 = 1;
        goto LABEL_97;
      }
      if (!v14)
        goto LABEL_101;
    }
    else if (!v14)
    {
      goto LABEL_102;
    }
    v57 = 0;
    v58 = 0;
LABEL_97:
    -[UINavigationController topViewController](self->_navigationController, "topViewController");
    v59 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    topViewController = self->_topViewController;

    if (v59 == topViewController)
    {
      v57 = CFSTR("dialog cancelled before any pages pushed");
      goto LABEL_100;
    }
    if (v58)
      goto LABEL_100;
LABEL_101:
    v10 = v66;
    goto LABEL_102;
  }
LABEL_104:
  v61 = *p_finishingOperation;
  *p_finishingOperation = 0;

}

void __68__ICQCommerceRemoteUIDelegate__handleFinishForOperation_withOutput___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__ICQCommerceRemoteUIDelegate__handleFinishForOperation_withOutput___block_invoke_2;
  block[3] = &unk_24E3F3610;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __68__ICQCommerceRemoteUIDelegate__handleFinishForOperation_withOutput___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObject:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setViewControllers:", v4);
}

uint64_t __68__ICQCommerceRemoteUIDelegate__handleFinishForOperation_withOutput___block_invoke_84(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancelFlowBecause:", CFSTR("customer message shown & dismissed"));
  return objc_msgSend(*(id *)(a1 + 32), "cancelRemoteUI");
}

- (void)_clearRetailFollowUpItem
{
  NSObject *v2;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_22);

}

void __55__ICQCommerceRemoteUIDelegate__clearRetailFollowUpItem__block_invoke()
{
  NSObject *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  ICQUSLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21F2CC000, v0, OS_LOG_TYPE_DEFAULT, "Clearing iCloud follow up item", v8, 2u);
  }

  AMSGenerateLogCorrelationKey();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BE08050];
  objc_msgSend(MEMORY[0x24BE08120], "bagSubProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE08120], "bagSubProfileVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bagForProfile:profileVersion:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE08118], "removeDeviceOfferWithIdentifier:account:bag:logKey:", *MEMORY[0x24BE07CF8], v3, v7, v1);
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__ICQCommerceRemoteUIDelegate_operation_failedWithError___block_invoke;
  v7[3] = &unk_24E3F34D8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __57__ICQCommerceRemoteUIDelegate_operation_failedWithError___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD aBlock[4];
  id v7;
  id v8;
  id location;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[10])
  {
    objc_initWeak(&location, v2);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__ICQCommerceRemoteUIDelegate_operation_failedWithError___block_invoke_2;
    aBlock[3] = &unk_24E3F5978;
    objc_copyWeak(&v8, &location);
    v7 = *(id *)(a1 + 40);
    v3 = _Block_copy(aBlock);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 88);
    *(_QWORD *)(v4 + 88) = v3;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleOperationError:", *(_QWORD *)(a1 + 40));
  }
}

void __57__ICQCommerceRemoteUIDelegate_operation_failedWithError___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleOperationError:", *(_QWORD *)(a1 + 32));

}

- (void)_handleOperationError:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "commerceDelegate:loadDidFailWithError:", self, v4);

  }
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNetworkActivityIndicatorVisible:", 0);

  if (objc_msgSend(v4, "code") == 16 || objc_msgSend(v4, "code") == 4)
  {
    -[UINavigationController topViewController](self->_navigationController, "topViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[UINavigationController popViewControllerAnimated:](self->_navigationController, "popViewControllerAnimated:", 1);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "table");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "indexPathForSelectedRow");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deselectRowAtIndexPath:animated:", v12, 1);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "tableViewOM");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "tableView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "indexPathForSelectedRow");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "deselectRowAtIndexPath:animated:", v17, 1);

        }
      }
    }

  }
  else
  {
    objc_msgSend(v4, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedFailureReason");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __53__ICQCommerceRemoteUIDelegate__handleOperationError___block_invoke;
    v18[3] = &unk_24E3F34D8;
    v18[4] = self;
    v19 = v4;
    -[ICQCommerceRemoteUIDelegate errorWithTitle:andExplanation:dismissedCompletion:](self, "errorWithTitle:andExplanation:dismissedCompletion:", v13, v14, v18);

  }
}

uint64_t __53__ICQCommerceRemoteUIDelegate__handleOperationError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("operation error shown & dismissed (error:%@)"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelFlowBecause:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "cancelRemoteUI");
}

- (void)errorWithTitle:(id)a3 andExplanation:(id)a4 dismissedCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  ICQCommerceRemoteUIDelegate *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __81__ICQCommerceRemoteUIDelegate_errorWithTitle_andExplanation_dismissedCompletion___block_invoke;
  v14[3] = &unk_24E3F59C8;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

void __81__ICQCommerceRemoteUIDelegate_errorWithTitle_andExplanation_dismissedCompletion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  uint64_t v21;
  id v22;

  v2 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  if (!objc_msgSend(v2, "length") && !objc_msgSend(*(id *)(a1 + 40), "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DEFAULT_ERROR_TITLE"), &stru_24E400750, CFSTR("CloudGroup"));
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v4 = *(void **)(a1 + 32);
  SSError();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "isEqualToString:", v6);

  if ((_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DEFAULT_ERROR_GENERIC"), &stru_24E400750, CFSTR("CloudGroup"));
    v8 = objc_claimAutoreleasedReturnValue();

    v2 = v7;
    v9 = v3;
    v3 = 0;
LABEL_6:

    v2 = (id)v8;
  }
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v2, v3, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DISMISS"), &stru_24E400750, CFSTR("CloudGroup"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __81__ICQCommerceRemoteUIDelegate_errorWithTitle_andExplanation_dismissedCompletion___block_invoke_2;
  v20 = &unk_24E3F59A0;
  v14 = *(void **)(a1 + 56);
  v21 = *(_QWORD *)(a1 + 48);
  v22 = v14;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 0, &v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v15, v17, v18, v19, v20, v21);

  objc_msgSend(*(id *)(a1 + 48), "presentationContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "presentViewController:animated:completion:", v10, 1, 0);

}

void __81__ICQCommerceRemoteUIDelegate_errorWithTitle_andExplanation_dismissedCompletion___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "topViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "popViewControllerAnimated:", 1);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "table");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "indexPathForSelectedRow");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "deselectRowAtIndexPath:animated:", v4, 1);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "tableViewOM");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "tableView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "indexPathForSelectedRow");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

      }
    }
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(void))(v8 + 16))();

}

- (void)unregisterAuthNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *v5;

  self->_registeredAuthNotification = 0;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BEB2C60], 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, (CFNotificationName)*MEMORY[0x24BEB2C58], 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, (CFNotificationName)*MEMORY[0x24BEB2C50], 0);
}

- (BOOL)_hasUnfinishedOperations
{
  void *v3;
  ISURLOperation *v4;
  ISURLOperation *finishingOperation;
  BOOL v6;

  -[NSOperationQueue operations](self->_queue, "operations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v3, "count") != 1
     || (objc_msgSend(v3, "firstObject"),
         v4 = (ISURLOperation *)objc_claimAutoreleasedReturnValue(),
         finishingOperation = self->_finishingOperation,
         v4,
         v4 != finishingOperation))
    && objc_msgSend(v3, "count") != 0;

  return v6;
}

- (void)cleanupLoader
{
  id WeakRetained;
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[ICQCommerceRemoteUIDelegate _hasUnfinishedOperations](self, "_hasUnfinishedOperations"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Preferences.cloud-storage-offers"), 1, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "commerceDelegate:loadDidFailWithError:", self, v6);

    }
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNetworkActivityIndicatorVisible:", 0);

  }
  -[NSOperationQueue operations](self->_queue, "operations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &__block_literal_global_123);

  -[NSOperationQueue cancelAllOperations](self->_queue, "cancelAllOperations");
}

void __44__ICQCommerceRemoteUIDelegate_cleanupLoader__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "setDelegate:", 0);

}

- (void)pushSpinner
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__ICQCommerceRemoteUIDelegate_pushSpinner__block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __42__ICQCommerceRemoteUIDelegate_pushSpinner__block_invoke(uint64_t a1)
{
  void *v2;
  char isKindOfClass;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ICQCommerceSpinner *v18;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v18 = objc_alloc_init(ICQCommerceSpinner);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "topViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x24BEBD410]);
    objc_msgSend(v5, "leftBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", v8, 0, 0, 0);

    objc_msgSend(v9, "setEnabled:", 0);
    v10 = objc_alloc(MEMORY[0x24BEBD410]);
    objc_msgSend(v5, "rightBarButtonItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithTitle:style:target:action:", v12, 2, 0, 0);

    objc_msgSend(v13, "setEnabled:", 0);
    -[ICQCommerceSpinner navigationItem](v18, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLeftBarButtonItem:", v9);

    -[ICQCommerceSpinner navigationItem](v18, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRightBarButtonItem:", v13);

    objc_msgSend(v5, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQCommerceSpinner navigationItem](v18, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:", v16);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "showViewController:sender:", v18);
  }
}

- (void)_popCommerceSpinnerIfNeeded
{
  void *v3;
  char isKindOfClass;
  NSObject *v5;
  id v6;
  uint8_t v7[16];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[UINavigationController topViewController](self->_navigationController, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    ICQUSLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "popping commerce spinner", v7, 2u);
    }

    v6 = -[UINavigationController popViewControllerAnimated:](self->_navigationController, "popViewControllerAnimated:", 1);
  }
}

- (void)purchaseWithToken:(id)a3 buyParameters:(id)a4 requestHeaders:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18[16];
  uint8_t buf[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ICQCommerceRemoteUIDelegate setSkipCompletionAlert:](self, "setSkipCompletionAlert:", 1);
  -[ICQCommerceRemoteUIDelegate setPurchaseToken:](self, "setPurchaseToken:", v10);

  -[ICQCommerceRemoteUIDelegate setBuyParameters:](self, "setBuyParameters:", v9);
  -[ICQCommerceRemoteUIDelegate setRequestHeaders:](self, "setRequestHeaders:", v8);

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.preferences"));
  _ICQGetLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v14, OS_LOG_TYPE_DEFAULT, "Freshmint using AMSPurchase flow.", buf, 2u);
    }

    -[ICQCommerceRemoteUIDelegate makeBuyRequest:](self, "makeBuyRequest:", &stru_24E400750);
  }
  else
  {
    if (v15)
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_21F2CC000, v14, OS_LOG_TYPE_DEFAULT, "Freshmint using legacy purchase flow.", v18, 2u);
    }

    if (v10)
    {
      v16 = 0;
      v17 = 1;
    }
    else
    {
      v16 = 1;
      v17 = 0;
    }
    -[ICQCommerceRemoteUIDelegate makeBuyRequest:forceAuth:usePurchaseToken:](self, "makeBuyRequest:forceAuth:usePurchaseToken:", &stru_24E400750, v16, v17);
  }

}

- (void)makeBuyRequest:(id)a3 forceAuth:(BOOL)a4 usePurchaseToken:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v24;
  __CFNotificationCenter *v25;
  uint8_t v26[16];

  v5 = a5;
  v6 = a4;
  v8 = a3;
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "Preparing StoreService purchase request.", v26, 2u);
  }

  v10 = objc_alloc_init(MEMORY[0x24BEB1F30]);
  objc_msgSend(v10, "setURLBagKey:", CFSTR("buyProduct"));
  -[ICQCommerceRemoteUIDelegate buyParameters](self, "buyParameters");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11 && (v12 = (void *)v11, v13 = objc_msgSend(v8, "length"), v12, !v13))
  {
    -[ICQCommerceRemoteUIDelegate buyParameters](self, "buyParameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "mutableCopy");
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v8, "stringByRemovingPercentEncoding");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "copyDictionaryForQueryString:unescapedValues:", v15, 0);
  }
  v17 = (void *)v16;

  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("forRetailOffer"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v18, "BOOLValue"))
    -[ICQCommerceRemoteUIDelegate setForRetailOffer:](self, "setForRetailOffer:", 1);
  objc_msgSend(MEMORY[0x24BEC8B88], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "guid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v20, CFSTR("guid"));

  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v17, 100, 0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHTTPBody:", v21);
  objc_msgSend(v10, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v10, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("Content-Type"));
  if (v5
    && (-[ICQCommerceRemoteUIDelegate purchaseToken](self, "purchaseToken"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v22,
        v22))
  {
    -[ICQCommerceRemoteUIDelegate processLink:forceAuth:needsAuth:localAuth:usePurchaseToken:](self, "processLink:forceAuth:needsAuth:localAuth:usePurchaseToken:", v10, 0, 0, 0, 1);
  }
  else
  {
    -[ICQCommerceRemoteUIDelegate processLink:forceAuth:needsAuth:localAuth:](self, "processLink:forceAuth:needsAuth:localAuth:", v10, v6, 1, 1);
  }
  if (!self->_registeredAuthNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)AuthSubmitted, (CFStringRef)*MEMORY[0x24BEB2C60], 0, CFNotificationSuspensionBehaviorCoalesce);
    v24 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v24, self, (CFNotificationCallback)AuthSubmitted, (CFStringRef)*MEMORY[0x24BEB2C58], 0, CFNotificationSuspensionBehaviorCoalesce);
    v25 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v25, self, (CFNotificationCallback)AuthCancelled, (CFStringRef)*MEMORY[0x24BEB2C50], 0, CFNotificationSuspensionBehaviorCoalesce);
    self->_registeredAuthNotification = 1;
  }

}

- (void)retryPurchaseWithoutToken
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__ICQCommerceRemoteUIDelegate_retryPurchaseWithoutToken__block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __56__ICQCommerceRemoteUIDelegate_retryPurchaseWithoutToken__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "skipRetryWithoutToken");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSkipRetryWithoutToken:", 1);
    return objc_msgSend(*(id *)(a1 + 32), "makeBuyRequest:", &stru_24E400750);
  }
  return result;
}

- (void)loadURLforKey:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  self->_cancelled = 0;
  v4 = (objc_class *)MEMORY[0x24BEB1F30];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setURLBagKey:", v5);
  LODWORD(v4) = objc_msgSend(v5, "isEqualToString:", CFSTR("mint-offers"));

  if ((_DWORD)v4)
  {
    if (-[ICQCommerceRemoteUIDelegate shouldOfferFamilySharePlansOnly](self, "shouldOfferFamilySharePlansOnly"))
      objc_msgSend(v6, "setValue:forRequestParameter:", CFSTR("true"), CFSTR("sharePlanOnly"));
    if (-[ICQCommerceRemoteUIDelegate shouldOfferDeviceOffers](self, "shouldOfferDeviceOffers"))
      objc_msgSend(v6, "setValue:forRequestParameter:", CFSTR("true"), CFSTR("deviceOffers"));
  }
  -[ICQCommerceRemoteUIDelegate processLink:forceAuth:needsAuth:](self, "processLink:forceAuth:needsAuth:", v6, 0, 0);

}

- (void)cancelFlowBecause:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  NSObject *v6;
  const __CFString *v7;
  id WeakRetained;
  char v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  if (self->_cancelled)
  {
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ICQCommerceRemoteUIDelegate cancelFlowBecause:].cold.1();
    goto LABEL_10;
  }
  ICQUSLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("reasons");
    if (v4)
      v7 = v4;
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "user flow is ending because %{public}@", (uint8_t *)&v10, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSObject commerceDelegateDidCancel:](v5, "commerceDelegateDidCancel:", self);
LABEL_10:

  }
}

- (void)userCompletedFlow:(int64_t)a3
{
  NSObject *v3;
  unsigned int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id WeakRetained;
  char v15;
  id v16;
  int v17;
  int64_t v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  if (self->_cancelled)
  {
    _ICQGetLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[ICQCommerceRemoteUIDelegate userCompletedFlow:].cold.1();
    goto LABEL_24;
  }
  v6 = 0;
  if (a3 && a3 != 3067)
  {
    if (a3 == 3068)
    {
      v6 = 2;
      goto LABEL_12;
    }
    ICQUSLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134217984;
      v18 = a3;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "unexpected failure type %lld; handling as generic failure",
        (uint8_t *)&v17,
        0xCu);
    }

    v6 = 3;
  }
  if (!a3)
  {
    v9 = 0;
LABEL_17:

LABEL_18:
    +[ICQPurchase clearCacheAndNotifyClients](ICQPurchase, "clearCacheAndNotifyClients");
    v3 = 0;
    goto LABEL_19;
  }
LABEL_12:
  SSError();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v6 || !v8)
    goto LABEL_17;
  v10 = (void *)MEMORY[0x24BDD1540];
  v21 = *MEMORY[0x24BDD1398];
  v22[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Preferences.cloud-storage-offers"), v6, v11);
  v3 = objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_18;
LABEL_19:
  ICQUSLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = (int64_t)v13;
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "user completed flow with ft=%@, error %@", (uint8_t *)&v17, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    v16 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v16, "commerceDelegate:didCompleteWithError:", self, v3);

  }
  else
  {
    -[ICQCommerceRemoteUIDelegate cancelFlowBecause:](self, "cancelFlowBecause:", CFSTR("flow is complete and client did not implement commerceDelegate:didCompleteWithError:"));
  }
LABEL_24:

}

- (void)cancelRemoteUI
{
  -[ICQCommerceRemoteUIDelegate cancelRemoteUIKeeping:](self, "cancelRemoteUIKeeping:", 0);
}

- (void)cancelRemoteUIKeeping:(id)a3
{
  id v4;
  UINavigationController *navigationController;
  UINavigationController *v6;
  dispatch_time_t v7;
  UINavigationController *v8;
  UIViewController *topViewController;
  id v10;
  id v11;

  v4 = a3;
  if (!self->_cancelled)
  {
    v11 = v4;
    -[ICQCommerceRemoteUIDelegate cleanupLoader](self, "cleanupLoader");
    if (self->_pseudoModallyPresented)
    {
      navigationController = self->_navigationController;
    }
    else
    {
      if (v11 || !self->_modallyPresented)
      {
        -[NSMutableArray removeAllObjects](self->_objectModels, "removeAllObjects");
        v8 = self->_navigationController;
        topViewController = self->_topViewController;
        if (v11)
          -[UINavigationController removeViewControllersAfter:before:animated:](v8, "removeViewControllersAfter:before:animated:", topViewController, v11, 0);
        else
          v10 = -[UINavigationController popToViewController:animated:](v8, "popToViewController:animated:", topViewController, 1);
        goto LABEL_8;
      }
      navigationController = self->_parentNavigationController;
    }
    -[UINavigationController dismissViewControllerAnimated:completion:](navigationController, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_8:
    v6 = self->_navigationController;
    self->_navigationController = 0;

    v7 = dispatch_time(0, 1000000000);
    dispatch_after(v7, MEMORY[0x24BDAC9B8], &__block_literal_global_156);
    self->_cancelled = 1;
    v4 = v11;
  }

}

void __53__ICQCommerceRemoteUIDelegate_cancelRemoteUIKeeping___block_invoke()
{
  id v0;

  +[ICQQuotaRequestManager sharedManager](ICQQuotaRequestManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "noteQuotaInfoChanged");

}

- (void)makeBuyRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id buf[2];
  void *v30;
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Performing AMSPurchase request.", (uint8_t *)buf, 2u);
  }

  -[ICQCommerceRemoteUIDelegate buyParameters](self, "buyParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (v7 = objc_msgSend(v4, "length") == 0, v6, v7))
  {
    -[ICQCommerceRemoteUIDelegate buyParameters](self, "buyParameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("forRetailOffer"), v26);
  }
  else
  {
    v24 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "copyDictionaryForQueryString:unescapedValues:", v4, 0);
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("forRetailOffer"), v24);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v9, "BOOLValue"))
    -[ICQCommerceRemoteUIDelegate setForRetailOffer:](self, "setForRetailOffer:", 1);
  v10 = objc_alloc(MEMORY[0x24BE08360]);
  objc_msgSend(MEMORY[0x24BE08050], "quotaBag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithBag:", v11);

  objc_msgSend(v12, "setDelegate:", self);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08358]), "initWithConfiguration:", v12);
  v14 = objc_alloc(MEMORY[0x24BE08350]);
  objc_msgSend(MEMORY[0x24BE08098], "buyParamsWithString:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithPurchaseType:buyParams:", 0, v15);

  objc_msgSend(v16, "setUserInitiated:", 1);
  objc_msgSend(v16, "setAdditionalHeaders:", &unk_24E436498);
  v31 = CFSTR("mtTopic");
  v32[0] = CFSTR("xp_its_main");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMetricsOverlay:", v17);

  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "ams_isActiveAccountCombined"))
    objc_msgSend(v18, "ams_activeiTunesAccount");
  else
    objc_msgSend(v18, "ams_activeiCloudAccount");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccount:", v19);

  objc_msgSend(MEMORY[0x24BE08328], "currentProcess");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CastleSettings/1.0"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setUserAgentSuffix:", v21);

  objc_msgSend(v16, "setClientInfo:", v20);
  v30 = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enquePurchases:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(buf, self);
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __46__ICQCommerceRemoteUIDelegate_makeBuyRequest___block_invoke;
  v27[3] = &unk_24E3F5A30;
  objc_copyWeak(&v28, buf);
  objc_msgSend(v23, "addFinishBlock:", v27);
  objc_destroyWeak(&v28);
  objc_destroyWeak(buf);

}

void __46__ICQCommerceRemoteUIDelegate_makeBuyRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __46__ICQCommerceRemoteUIDelegate_makeBuyRequest___block_invoke_cold_2((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "didUserDismissAMSFlow:", v4))
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __46__ICQCommerceRemoteUIDelegate_makeBuyRequest___block_invoke_166;
      v19[3] = &unk_24E3F3610;
      v19[4] = WeakRetained;
      v13 = MEMORY[0x24BDAC9B8];
      v14 = v19;
    }
    else
    {
      if (v4)
      {
        objc_msgSend(v4, "userInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE07D38]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(WeakRetained, "userCompletedFlow:", objc_msgSend(v17, "integerValue"));
      }
      else
      {
        objc_msgSend(WeakRetained, "userCompletedFlow:", 0);
      }
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __46__ICQCommerceRemoteUIDelegate_makeBuyRequest___block_invoke_2;
      v18[3] = &unk_24E3F3610;
      v18[4] = WeakRetained;
      v13 = MEMORY[0x24BDAC9B8];
      v14 = v18;
    }
    dispatch_async(v13, v14);
  }
  else
  {
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __46__ICQCommerceRemoteUIDelegate_makeBuyRequest___block_invoke_cold_1();

  }
}

void __46__ICQCommerceRemoteUIDelegate_makeBuyRequest___block_invoke_166(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "lastObject");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopNavigationBarSpinner");

}

void __46__ICQCommerceRemoteUIDelegate_makeBuyRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    if (*(_BYTE *)(v1 + 40) || *(_BYTE *)(v1 + 104))
    {
      objc_msgSend(*(id *)(a1 + 32), "cancelRemoteUIKeeping:", 0);
    }
    else
    {
      objc_msgSend(*(id *)(v1 + 8), "topViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v1, "cancelRemoteUIKeeping:", v3);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "lastObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopNavigationBarSpinner");

  }
}

- (BOOL)didUserDismissAMSFlow:(id)a3
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  __int16 v11;
  __int16 v12;

  v3 = a3;
  if (objc_msgSend(v3, "code") == 100)
  {
    ICQUSLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 0;
      v5 = "Authentication failed";
      v6 = (uint8_t *)&v12;
LABEL_8:
      _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  objc_msgSend(v3, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE07D20]))
  {

    goto LABEL_11;
  }
  v8 = objc_msgSend(v3, "code");

  if (v8 != 6)
  {
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  ICQUSLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 0;
    v5 = "User Cancelled Oslo sheet";
    v6 = (uint8_t *)&v11;
    goto LABEL_8;
  }
LABEL_9:

  v9 = 1;
LABEL_12:

  return v9;
}

- (void)processLink:(id)a3 forceAuth:(BOOL)a4
{
  -[ICQCommerceRemoteUIDelegate processLink:forceAuth:needsAuth:](self, "processLink:forceAuth:needsAuth:", a3, a4, 1);
}

- (void)processLink:(id)a3 forceAuth:(BOOL)a4 needsAuth:(BOOL)a5
{
  -[ICQCommerceRemoteUIDelegate processLink:forceAuth:needsAuth:localAuth:](self, "processLink:forceAuth:needsAuth:localAuth:", a3, a4, a5, 0);
}

- (void)processLink:(id)a3 forceAuth:(BOOL)a4 needsAuth:(BOOL)a5 localAuth:(BOOL)a6
{
  -[ICQCommerceRemoteUIDelegate processLink:forceAuth:needsAuth:localAuth:usePurchaseToken:](self, "processLink:forceAuth:needsAuth:localAuth:usePurchaseToken:", a3, a4, a5, a6, 0);
}

- (void)processLink:(id)a3 forceAuth:(BOOL)a4 needsAuth:(BOOL)a5 localAuth:(BOOL)a6 usePurchaseToken:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  id v11;
  NSUInteger v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int AppBooleanValue;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  NSObject *v55;
  _BOOL4 v56;
  _BOOL4 v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  void *v75;
  char v76;
  void *v77;
  _BOOL4 v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t buf[16];
  _BYTE v85[128];
  uint64_t v86;

  v7 = a7;
  v8 = a6;
  v9 = a4;
  v86 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = -[NSOperationQueue operationCount](self->_queue, "operationCount");
  _ICQGetLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ICQCommerceRemoteUIDelegate processLink:forceAuth:needsAuth:localAuth:usePurchaseToken:].cold.1();
    goto LABEL_39;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v14, OS_LOG_TYPE_DEFAULT, "Performing legacy ISStoreURLOperation for quota purchase.", buf, 2u);
  }
  v78 = v9;

  v14 = objc_alloc_init(MEMORY[0x24BEC8C30]);
  +[ISDataProvider provider](ICQCommerceRemoteUIDataProvider, "provider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setParent:", self);
  -[NSObject setDataProvider:](v14, "setDataProvider:", v15);
  objc_msgSend(MEMORY[0x24BE048E0], "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "primaryAccount");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("ISAlwaysSendGuid"), CFSTR("com.apple.itunesstored"), 0);
  objc_msgSend(v11, "URLBagKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {

    goto LABEL_8;
  }
  v74 = AppBooleanValue;
  objc_msgSend(v11, "URL");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "scheme");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "lowercaseString");
  v55 = v14;
  v56 = v8;
  v57 = v7;
  v58 = v17;
  v59 = v15;
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v60, "isEqualToString:", CFSTR("https"));

  v15 = v59;
  v17 = v58;
  v7 = v57;
  v8 = v56;
  v14 = v55;

  if ((v76 & 1) != 0 || v74)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BEB1F28], "contextForSignIn");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "username");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAccountName:", v21);

    v22 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v17, "personID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "numberWithUnsignedLongLong:", objc_msgSend(v23, "longLongValue"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setRequiredUniqueIdentifier:", v24);

    objc_msgSend(v20, "setAccountNameEditable:", 0);
    objc_msgSend(v20, "setShouldFollowAccountButtons:", 1);
    if (v78)
    {
      objc_msgSend(v20, "setPromptStyle:", 1);
    }
    else if (!v8)
    {
      goto LABEL_12;
    }
    -[NSObject setNeedsAuthentication:](v14, "setNeedsAuthentication:", 1);
LABEL_12:
    -[NSObject setAuthenticationContext:](v14, "setAuthenticationContext:", v20);
    v77 = v17;
    if (v7
      && (-[ICQCommerceRemoteUIDelegate purchaseToken](self, "purchaseToken"),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          v25,
          v25))
    {
      objc_msgSend(MEMORY[0x24BE04958], "currentInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "clientInfoHeader");
      v27 = objc_claimAutoreleasedReturnValue();

      if (v27)
        objc_msgSend(v11, "setValue:forHTTPHeaderField:", v27, CFSTR("X-MMe-Client-Info"));
      v73 = (void *)v27;
      v75 = v20;
      v79 = v15;
      objc_msgSend(v17, "account");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "aa_altDSID");
      v29 = objc_claimAutoreleasedReturnValue();

      if (v29)
        objc_msgSend(v11, "setValue:forHTTPHeaderField:", v29, CFSTR("X-Apple-ADSID"));
      v72 = (void *)v29;
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      -[ICQCommerceRemoteUIDelegate requestHeaders](self, "requestHeaders");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v81;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v81 != v33)
              objc_enumerationMutation(v30);
            v35 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i);
            -[ICQCommerceRemoteUIDelegate requestHeaders](self, "requestHeaders");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "objectForKeyedSubscript:", v35);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "setValue:forHTTPHeaderField:", v37, v35);
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
        }
        while (v32);
      }

      v38 = (void *)MGCopyAnswer();
      objc_msgSend(v11, "setValue:forHTTPHeaderField:", v38, CFSTR("X-Mme-Device-Id"));
      objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "abbreviation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setValue:forHTTPHeaderField:", v40, CFSTR("X-MMe-Timezone"));

      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKey:", *MEMORY[0x24BDBCAE8]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "uppercaseString");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setValue:forHTTPHeaderField:", v43, CFSTR("X-MMe-Country"));

      v44 = v72;
      if (v72)
      {
        v45 = v72;
      }
      else
      {
        objc_msgSend(v77, "personID");
        v45 = (id)objc_claimAutoreleasedReturnValue();
      }
      v61 = v45;
      v20 = v75;
      v62 = (void *)MEMORY[0x24BDD17C8];
      -[ICQCommerceRemoteUIDelegate purchaseToken](self, "purchaseToken");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "stringWithFormat:", CFSTR("%@:%@"), v61, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v64, "dataUsingEncoding:", 4);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "base64EncodedStringWithOptions:", 0);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (v66)
        objc_msgSend(v11, "setValue:forHTTPHeaderField:", v66, CFSTR("X-Apple-GS-Token"));

      v15 = v79;
      v50 = v73;
    }
    else
    {
      v46 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v17, "personID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "authToken");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringWithFormat:", CFSTR("%@:%@"), v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = v49;
      objc_msgSend(v49, "dataUsingEncoding:", 4);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "base64EncodedStringWithOptions:", 0);
      v52 = objc_claimAutoreleasedReturnValue();

      v44 = (void *)v52;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v52);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setValue:forHTTPHeaderField:", v38, CFSTR("Authorization"));
    }

    objc_msgSend(MEMORY[0x24BEC8B88], "sharedInstance");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "guid");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forRequestParameter:", v68, CFSTR("guid"));

    v17 = v77;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", CFSTR("CastleSettings/1.0"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserAgentComponents:", v69);

  -[NSObject setRequestProperties:](v14, "setRequestProperties:", v11);
  -[NSObject setDelegate:](v14, "setDelegate:", self);
  if (!self->_registeredDialogNotification)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addObserver:selector:name:object:", self, sel_handleDialog_, *MEMORY[0x24BEC8AB8], 0);

    self->_registeredDialogNotification = 1;
  }
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setNetworkActivityIndicatorVisible:", 1);

  -[NSOperationQueue addOperation:](self->_queue, "addOperation:", v14);
LABEL_39:

}

- (id)parentViewControllerForObjectModel:(id)a3
{
  id v4;
  UINavigationController *navigationController;
  UINavigationController *v6;

  v4 = a3;
  navigationController = self->_navigationController;
  if (!navigationController)
    -[ICQCommerceRemoteUIDelegate parentViewControllerForObjectModel:].cold.1();
  v6 = navigationController;

  return v6;
}

- (void)_popObjectModelAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  id v10;
  id v12;

  v3 = a3;
  if (!-[NSMutableArray count](self->_objectModels, "count"))
    -[ICQCommerceRemoteUIDelegate _popObjectModelAnimated:].cold.1();
  -[NSMutableArray lastObject](self->_objectModels, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultPages");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray removeLastObject](self->_objectModels, "removeLastObject");
  v6 = objc_msgSend(v12, "count") - 1;
  if (v6 >= 0)
  {
    do
    {
      objc_msgSend(v12, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationController topViewController](self->_navigationController, "topViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 == v7)
      {
        if (v6)
          v9 = 0;
        else
          v9 = v3;
        v10 = -[UINavigationController popViewControllerAnimated:](self->_navigationController, "popViewControllerAnimated:", v9);
      }

    }
    while (v6-- > 0);
  }

}

- (void)objectModelPressedBack:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  -[UINavigationController topViewController](self->_navigationController, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UINavigationController popViewControllerAnimated:](self->_navigationController, "popViewControllerAnimated:", 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    if (v6)
    {
      objc_msgSend(v9, "defaultPages");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsObject:", v6);

      if (v8)
        -[NSMutableArray removeLastObject](self->_objectModels, "removeLastObject");
    }
  }
  else
  {
    v6 = 0;
  }

}

- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;

  v20 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ams_followup"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("clear")))
    -[ICQCommerceRemoteUIDelegate _clearRetailFollowUpItem](self, "_clearRetailFollowUpItem");
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("cancel")))
  {
    -[ICQCommerceRemoteUIDelegate cancelFlowBecause:](self, "cancelFlowBecause:", CFSTR("cancel button pressed in RUI object model"));
    -[ICQCommerceRemoteUIDelegate cancelRemoteUI](self, "cancelRemoteUI");
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("buy")))
  {
    objc_msgSend(v20, "defaultPages");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "navTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "startNavigationBarSpinnerWithTitle:", v13);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "defaultPages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "populatePostbackDictionary:", v14);

    objc_msgSend(v14, "objectForKey:", CFSTR("quota"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("id"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("quota"));

      if (v19)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("value"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
    }
    -[ICQCommerceRemoteUIDelegate makeBuyRequest:](self, "makeBuyRequest:", v17);

  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("pop")))
  {
    -[ICQCommerceRemoteUIDelegate _popObjectModelAnimated:](self, "_popObjectModelAnimated:", 1);
  }

}

- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  if (!-[ICQCommerceRemoteUIDelegate _loadNativeURL:](self, "_loadNativeURL:", v8))
  {
    objc_msgSend(v9, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("post"));

    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "defaultPages");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "populatePostbackDictionary:", v12);

      objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v12, 100, 0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F30]), "initWithURL:", v8);
    objc_msgSend(v16, "setHTTPMethod:", v9);
    if (v15)
    {
      objc_msgSend(v16, "setHTTPBody:", v15);
      objc_msgSend(v16, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("Content-Type"));
    }
    objc_msgSend(v8, "scheme");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lowercaseString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQCommerceRemoteUIDelegate processLink:forceAuth:needsAuth:](self, "processLink:forceAuth:needsAuth:", v16, 0, objc_msgSend(v18, "isEqualToString:", CFSTR("https")));

  }
}

- (BOOL)_loadNativeURL:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("ams-ui"));

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "openSensitiveURL:withOptions:", v3, 0);

  }
  return v5;
}

- (void)accountPageViewControllerDidFinish:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  ICQUSLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "accountPageViewController finished", v5, 2u);
  }

  -[ICQCommerceRemoteUIDelegate cancelFlowBecause:](self, "cancelFlowBecause:", CFSTR("account page view controller did finish"));
  -[ICQCommerceRemoteUIDelegate cancelRemoteUI](self, "cancelRemoteUI");
}

- (void)accountPageViewController:(id)a3 financeInterruptionResolved:(BOOL)a4
{
  _BOOL4 v4;
  SKAccountPageViewController *v6;
  SKAccountPageViewController *v7;
  NSObject *v8;
  const __CFString *v9;
  SKAccountPageViewController *v10;
  _QWORD block[5];
  SKAccountPageViewController *v12;
  BOOL v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = (SKAccountPageViewController *)a3;
  if (self->_accountPageViewController != v6)
    -[ICQCommerceRemoteUIDelegate accountPageViewController:financeInterruptionResolved:].cold.1();
  v7 = v6;
  ICQUSLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    if (v4)
      v9 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v15 = v9;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "accountPageViewController finance interruption resolved: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__ICQCommerceRemoteUIDelegate_accountPageViewController_financeInterruptionResolved___block_invoke;
  block[3] = &unk_24E3F35C0;
  block[4] = self;
  v12 = v7;
  v13 = v4;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __85__ICQCommerceRemoteUIDelegate_accountPageViewController_financeInterruptionResolved___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "_popAccountPageViewController:keepCommerceSpinner:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  if (*(_BYTE *)(a1 + 48))
  {
    ICQUSLogForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "retry the buy after fixing payment method", v4, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "makeBuyRequest:", &stru_24E400750);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cancelFlowBecause:", CFSTR("payment method not established"));
    return objc_msgSend(*(id *)(a1 + 32), "cancelRemoteUI");
  }
}

- (void)_dismissAccountPageViewController:(id)a3 keepCommerceSpinner:(BOOL)a4
{
  SKAccountPageViewController *v6;
  SKAccountPageViewController *v7;
  NSObject *v8;
  SKAccountPageViewController *v9;
  _QWORD v10[5];
  SKAccountPageViewController *v11;
  BOOL v12;
  uint8_t buf[16];

  v6 = (SKAccountPageViewController *)a3;
  if (self->_accountPageViewController != v6)
    -[ICQCommerceRemoteUIDelegate _dismissAccountPageViewController:keepCommerceSpinner:].cold.1();
  v7 = v6;
  ICQUSLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "dismiss accountPageViewController", buf, 2u);
  }

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __85__ICQCommerceRemoteUIDelegate__dismissAccountPageViewController_keepCommerceSpinner___block_invoke;
  v10[3] = &unk_24E3F35C0;
  v12 = a4;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  -[SKAccountPageViewController dismissViewControllerAnimated:completion:](v9, "dismissViewControllerAnimated:completion:", 1, v10);

}

uint64_t __85__ICQCommerceRemoteUIDelegate__dismissAccountPageViewController_keepCommerceSpinner___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  ICQUSLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "accountPageViewController dismissed", v4, 2u);
  }

  if (!*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "_popCommerceSpinnerIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_forgetAccountPageViewController:", *(_QWORD *)(a1 + 40));
}

- (void)_popAccountPageViewController:(id)a3 keepCommerceSpinner:(BOOL)a4
{
  _BOOL8 v4;
  SKAccountPageViewController *v6;
  SKAccountPageViewController *v7;
  NSObject *v8;
  const __CFString *v9;
  uint64_t v10;
  UIViewController *v11;
  UIViewController *topViewController;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  int v19;
  const __CFString *v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = (SKAccountPageViewController *)a3;
  if (self->_accountPageViewController != v6)
    -[ICQCommerceRemoteUIDelegate _popAccountPageViewController:keepCommerceSpinner:].cold.1();
  v7 = v6;
  ICQUSLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    if (v4)
      v9 = CFSTR("YES");
    v19 = 138412290;
    v20 = v9;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "pop accountPageViewController; keepCommerceSpinner: %@",
      (uint8_t *)&v19,
      0xCu);
  }

  -[UINavigationController topViewController](self->_navigationController, "topViewController");
  v10 = objc_claimAutoreleasedReturnValue();
  if ((SKAccountPageViewController *)v10 == v7)
  {
LABEL_13:
    ICQUSLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_21F2CC000, v16, OS_LOG_TYPE_DEFAULT, "popping accountPageViewController", (uint8_t *)&v19, 2u);
    }

    v17 = -[UINavigationController popViewControllerAnimated:](self->_navigationController, "popViewControllerAnimated:", v4);
    v11 = (UIViewController *)v7;
  }
  else
  {
    v11 = (UIViewController *)v10;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      topViewController = self->_topViewController;
      ICQUSLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v11 == topViewController)
      {
        if (v14)
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "popped to initial view controller; not popping further",
            (uint8_t *)&v19,
            2u);
        }

        goto LABEL_22;
      }
      if (v14)
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "popping unknown VC; assuming it's after the accountPageViewController",
          (uint8_t *)&v19,
          2u);
      }

      v15 = -[UINavigationController popViewControllerAnimated:](self->_navigationController, "popViewControllerAnimated:", 0);
      -[UINavigationController topViewController](self->_navigationController, "topViewController");
      v11 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      if (v11 == (UIViewController *)v7)
        goto LABEL_13;
    }
    ICQUSLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_21F2CC000, v18, OS_LOG_TYPE_DEFAULT, "at CommerceSpinner", (uint8_t *)&v19, 2u);
    }

  }
LABEL_22:

  if (!v4)
    -[ICQCommerceRemoteUIDelegate _popCommerceSpinnerIfNeeded](self, "_popCommerceSpinnerIfNeeded");
  -[ICQCommerceRemoteUIDelegate _forgetAccountPageViewController:](self, "_forgetAccountPageViewController:", v7);

}

- (void)_forgetAccountPageViewController:(id)a3
{
  SKAccountPageViewController *v4;
  SKAccountPageViewController *accountPageViewController;
  SKAccountPageViewController *v6;

  v4 = (SKAccountPageViewController *)a3;
  if (self->_accountPageViewController != v4)
    -[ICQCommerceRemoteUIDelegate _forgetAccountPageViewController:].cold.1();
  v6 = v4;
  -[SKAccountPageViewController setDelegate:](v4, "setDelegate:", 0);
  accountPageViewController = self->_accountPageViewController;
  self->_accountPageViewController = 0;

}

- (BOOL)_shouldSuppressDialog:(id)a3 failureType:(int64_t)a4
{
  BOOL result;

  result = -[ICQCommerceRemoteUIDelegate skipCompletionAlert](self, "skipCompletionAlert", a3);
  if ((unint64_t)(a4 - 3067) >= 2)
    return 0;
  return result;
}

- (void)handleDialog:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ICQUSLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Dialog notification arrived... %@", buf, 0xCu);

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__ICQCommerceRemoteUIDelegate_handleDialog___block_invoke;
  v8[3] = &unk_24E3F34D8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void __44__ICQCommerceRemoteUIDelegate_handleDialog___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __44__ICQCommerceRemoteUIDelegate_handleDialog___block_invoke_2;
  v2[3] = &unk_24E3F34D8;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_dismissAlertsWithCompletion:", v2);

}

void __44__ICQCommerceRemoteUIDelegate_handleDialog___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldSuppressDialog:failureType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), objc_msgSend(*(id *)(a1 + 32), "failureType")))
  {
    ICQUSLogForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(*(id *)(a1 + 32), "failureType");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "title");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "message");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 134218498;
      v16 = v3;
      v17 = 2114;
      v18 = v4;
      v19 = 2114;
      v20 = v5;
      _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "suppressing dialog of failureType:%lld, title:%{public}@, message:%{public}@", (uint8_t *)&v15, 0x20u);

    }
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 64);
    *(_QWORD *)(v6 + 64) = 0;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "object");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 64);
    *(_QWORD *)(v9 + 64) = v8;

    ICQUSLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(*(id *)(a1 + 32), "failureType");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "message");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 134218498;
      v16 = v12;
      v17 = 2114;
      v18 = v13;
      v19 = 2114;
      v20 = v14;
      _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "Presenting dialog of failureType:%lld, title:%{public}@, message:%{public}@", (uint8_t *)&v15, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_presentAlertWithDialog:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  }
}

- (void)_dismissAlertsWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  UIAlertController *alertController;
  _QWORD v7[5];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  alertController = self->_alertController;
  if (alertController)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __60__ICQCommerceRemoteUIDelegate__dismissAlertsWithCompletion___block_invoke;
    v7[3] = &unk_24E3F3E88;
    v7[4] = self;
    v8 = v4;
    -[UIAlertController dismissViewControllerAnimated:completion:](alertController, "dismissViewControllerAnimated:completion:", 1, v7);

  }
  else
  {
    v4[2](v4);
  }

}

uint64_t __60__ICQCommerceRemoteUIDelegate__dismissAlertsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  *(_QWORD *)(v2 + 64) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_presentAlertWithDialog:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIAlertController *v8;
  UIAlertController *alertController;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  alertController = self->_alertController;
  self->_alertController = v8;

  objc_msgSend(v4, "buttons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __55__ICQCommerceRemoteUIDelegate__presentAlertWithDialog___block_invoke;
  v13[3] = &unk_24E3F5A80;
  v13[4] = self;
  v14 = v4;
  v12 = v4;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

  -[ICQCommerceRemoteUIDelegate presentationContext](self, "presentationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentViewController:animated:completion:", self->_alertController, 1, 0);

}

void __55__ICQCommerceRemoteUIDelegate__presentAlertWithDialog___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  v6 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(a2, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__ICQCommerceRemoteUIDelegate__presentAlertWithDialog___block_invoke_2;
  v10[3] = &unk_24E3F5A58;
  v8 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v8;
  v12 = a3;
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v9);

}

void __55__ICQCommerceRemoteUIDelegate__presentAlertWithDialog___block_invoke_2(uint64_t a1)
{
  char v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[16];

  v2 = objc_msgSend(*(id *)(a1 + 32), "_handleResponseForDialog:atIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = 0;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
  if (v5)
  {
    if ((v2 & 1) == 0)
    {
      ICQUSLogForCategory(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "need to wait for async response", v9, 2u);
      }

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 110) = 1;
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
    }
    (*(void (**)(void))(v5 + 16))();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 88);
    *(_QWORD *)(v7 + 88) = 0;

  }
}

- (id)presentationContext
{
  UINavigationController *navigationController;
  UINavigationController *v3;
  NSObject *v4;
  void *v5;
  int v7;
  UINavigationController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  navigationController = self->_navigationController;
  if (!navigationController)
    navigationController = self->_parentNavigationController;
  v3 = navigationController;
  ICQUSLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[UINavigationController presentedViewController](v3, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v3;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Presenting alert on controller: %@ - %@", (uint8_t *)&v7, 0x16u);

  }
  return v3;
}

- (BOOL)_handleResponseForDialog:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  SKAccountPageViewController *v21;
  SKAccountPageViewController *accountPageViewController;
  SKAccountPageViewController *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v28[5];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "buttons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") <= (unint64_t)a4)
  {
    v17 = 1;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v8, "actionType"))
    {
      case 1u:
        objc_msgSend(v8, "parameter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
          v10 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v10;
        }
        objc_msgSend(v9, "schemeSwizzledURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "urlType");
        v12 = objc_alloc(MEMORY[0x24BEB1F30]);
        objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithURLRequest:", v13);

        objc_msgSend(v11, "scheme");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lowercaseString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQCommerceRemoteUIDelegate processLink:forceAuth:needsAuth:](self, "processLink:forceAuth:needsAuth:", v14, 0, objc_msgSend(v16, "isEqualToString:", CFSTR("https")));

        goto LABEL_15;
      case 2u:
        objc_msgSend(v8, "parameter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        ICQUSLogForCategory(0);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v18;
          _os_log_impl(&dword_21F2CC000, v19, OS_LOG_TYPE_DEFAULT, "GotoFinance %@", buf, 0xCu);
        }

        if (self->_accountPageViewController)
        {
          ICQUSLogForCategory(0);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            -[ICQCommerceRemoteUIDelegate _handleResponseForDialog:atIndex:].cold.1();

        }
        v21 = (SKAccountPageViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BDEA6A8]), "initWithAccountURL:", v18);
        accountPageViewController = self->_accountPageViewController;
        self->_accountPageViewController = v21;

        -[SKAccountPageViewController setDelegate:](self->_accountPageViewController, "setDelegate:", self);
        v23 = self->_accountPageViewController;
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __64__ICQCommerceRemoteUIDelegate__handleResponseForDialog_atIndex___block_invoke;
        v28[3] = &unk_24E3F3610;
        v28[4] = self;
        -[SKAccountPageViewController loadWithCompletionBlock:](v23, "loadWithCompletionBlock:", v28);

        goto LABEL_25;
      case 3u:
        objc_msgSend(v8, "parameter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQCommerceRemoteUIDelegate makeBuyRequest:](self, "makeBuyRequest:", v9);
LABEL_15:

        v17 = 0;
        break;
      case 4u:
        objc_msgSend(v8, "parameter");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v24);
          v25 = objc_claimAutoreleasedReturnValue();

          v24 = (void *)v25;
        }
        if (objc_msgSend(v24, "isSafeExternalURL"))
        {
          objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "openURL:options:completionHandler:", v24, MEMORY[0x24BDBD1B8], 0);

        }
        goto LABEL_25;
      case 5u:
        -[ICQCommerceRemoteUIDelegate cancelFlowBecause:](self, "cancelFlowBecause:", CFSTR("dialog button pressed with action GoBack"));
        goto LABEL_24;
      case 0xBu:
        objc_msgSend(v8, "performDefaultActionForDialog:", v6);
LABEL_24:
        -[ICQCommerceRemoteUIDelegate cancelRemoteUI](self, "cancelRemoteUI");
LABEL_25:
        v17 = 1;
        break;
      default:
        -[ICQCommerceRemoteUIDelegate _popCommerceSpinnerIfNeeded](self, "_popCommerceSpinnerIfNeeded");
        v17 = 1;
        -[ICQCommerceRemoteUIDelegate setDidJustCancelDialog:](self, "setDidJustCancelDialog:", 1);
        break;
    }

  }
  return v17;
}

uint64_t __64__ICQCommerceRemoteUIDelegate__handleResponseForDialog_atIndex___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  ICQUSLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "accountPageViewController completed loading; pushing with loaded HTML content",
      v4,
      2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "pushViewController:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), 1);
}

- (ICQCommerceRemoteUIDelegate)initWithNavigationController:(id)a3 needsModalPresentation:(BOOL)a4
{
  id v6;
  ICQCommerceRemoteUIDelegate *v7;
  ICQCommerceRemoteUIDelegate *v8;
  NSMutableArray *v9;
  NSMutableArray *objectModels;
  _BOOL4 modallyPresented;
  UINavigationController *v12;
  UINavigationController *v13;
  UINavigationController *parentNavigationController;
  UINavigationController *navigationController;
  uint64_t v16;
  NSOperationQueue *v17;
  NSOperationQueue *queue;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICQCommerceRemoteUIDelegate;
  v7 = -[ICQCommerceRemoteUIDelegate init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    if (!v6)
      -[ICQCommerceRemoteUIDelegate initWithNavigationController:needsModalPresentation:].cold.1();
    v7->_modallyPresented = a4;
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objectModels = v8->_objectModels;
    v8->_objectModels = v9;

    modallyPresented = v8->_modallyPresented;
    v12 = (UINavigationController *)v6;
    v13 = v12;
    if (modallyPresented)
    {
      parentNavigationController = v8->_parentNavigationController;
      v8->_parentNavigationController = v12;
    }
    else
    {
      navigationController = v8->_navigationController;
      v8->_navigationController = v12;

      -[UINavigationController topViewController](v13, "topViewController");
      v16 = objc_claimAutoreleasedReturnValue();
      parentNavigationController = (UINavigationController *)v8->_topViewController;
      v8->_topViewController = (UIViewController *)v16;
    }

    v17 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    queue = v8->_queue;
    v8->_queue = v17;

  }
  return v8;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *v5;
  void *v6;
  objc_super v7;

  -[ICQCommerceRemoteUIDelegate cleanupLoader](self, "cleanupLoader");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BEB2C60], 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, (CFNotificationName)*MEMORY[0x24BEB2C58], 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, (CFNotificationName)*MEMORY[0x24BEB2C50], 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BEC8AB8], 0);

  v7.receiver = self;
  v7.super_class = (Class)ICQCommerceRemoteUIDelegate;
  -[ICQCommerceRemoteUIDelegate dealloc](&v7, sel_dealloc);
}

- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  ICQCommerceRemoteUIDelegate *v15;
  id v16;
  uint8_t buf[16];

  v8 = a3;
  v9 = a6;
  ICQUSLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "We were asked to authenticate.  Attempting silent authentication.", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__ICQCommerceRemoteUIDelegate_handleAuthenticateRequest_purchase_purchaseQueue_completion___block_invoke;
  block[3] = &unk_24E3F3FD0;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __91__ICQCommerceRemoteUIDelegate_handleAuthenticateRequest_purchase_purchaseQueue_completion___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v2 = objc_alloc(MEMORY[0x24BE08618]);
  objc_msgSend(a1[4], "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithAccount:presentingViewController:options:", v3, v4, v5);

  objc_msgSend(v6, "performAuthentication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __91__ICQCommerceRemoteUIDelegate_handleAuthenticateRequest_purchase_purchaseQueue_completion___block_invoke_2;
  v8[3] = &unk_24E3F3FA8;
  v9 = a1[6];
  objc_msgSend(v7, "addFinishBlock:", v8);

}

void __91__ICQCommerceRemoteUIDelegate_handleAuthenticateRequest_purchase_purchaseQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[16];

  v5 = a3;
  v6 = a2;
  ICQUSLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __91__ICQCommerceRemoteUIDelegate_handleAuthenticateRequest_purchase_purchaseQueue_completion___block_invoke_2_cold_1((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Successfully finished silent authentication.", v15, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleDialogRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  ICQCommerceRemoteUIDelegate *v15;
  id v16;
  uint8_t buf[16];

  v8 = a3;
  v9 = a6;
  ICQUSLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "We were asked to handle a dialog request", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__ICQCommerceRemoteUIDelegate_handleDialogRequest_purchase_purchaseQueue_completion___block_invoke;
  block[3] = &unk_24E3F3FD0;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __85__ICQCommerceRemoteUIDelegate_handleDialogRequest_purchase_purchaseQueue_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_alloc(MEMORY[0x24BE08610]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v2, "initWithRequest:presentingViewController:", v3, v4);

  objc_msgSend(v6, "present");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addFinishBlock:", *(_QWORD *)(a1 + 48));

}

- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  ICQCommerceRemoteUIDelegate *v15;
  id v16;
  uint8_t buf[16];

  v8 = a3;
  v9 = a6;
  ICQUSLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "We were asked to handle an engagement request", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__ICQCommerceRemoteUIDelegate_handleEngagementRequest_purchase_purchaseQueue_completion___block_invoke;
  block[3] = &unk_24E3F3FD0;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __89__ICQCommerceRemoteUIDelegate_handleEngagementRequest_purchase_purchaseQueue_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = objc_alloc(MEMORY[0x24BE08638]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE08050], "quotaBag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "presentationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v2, "initWithRequest:bag:presentingViewController:", v3, v4, v5);

  objc_msgSend(v7, "presentEngagement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addFinishBlock:", *(_QWORD *)(a1 + 48));

}

- (ICQCommerceRemoteUIDelegateDelegate)delegate
{
  return (ICQCommerceRemoteUIDelegateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)skipRetryWithoutToken
{
  return self->_skipRetryWithoutToken;
}

- (void)setSkipRetryWithoutToken:(BOOL)a3
{
  self->_skipRetryWithoutToken = a3;
}

- (BOOL)skipCompletionAlert
{
  return self->_skipCompletionAlert;
}

- (void)setSkipCompletionAlert:(BOOL)a3
{
  self->_skipCompletionAlert = a3;
}

- (BOOL)supportsModernAlerts
{
  return self->_supportsModernAlerts;
}

- (void)setSupportsModernAlerts:(BOOL)a3
{
  self->_supportsModernAlerts = a3;
}

- (BOOL)shouldOfferFamilySharePlansOnly
{
  return self->_shouldOfferFamilySharePlansOnly;
}

- (void)setShouldOfferFamilySharePlansOnly:(BOOL)a3
{
  self->_shouldOfferFamilySharePlansOnly = a3;
}

- (BOOL)shouldOfferDeviceOffers
{
  return self->_shouldOfferDeviceOffers;
}

- (void)setShouldOfferDeviceOffers:(BOOL)a3
{
  self->_shouldOfferDeviceOffers = a3;
}

- (BOOL)skipGoBack
{
  return self->_skipGoBack;
}

- (void)setSkipGoBack:(BOOL)a3
{
  self->_skipGoBack = a3;
}

- (BOOL)didJustCancelDialog
{
  return self->_didJustCancelDialog;
}

- (void)setDidJustCancelDialog:(BOOL)a3
{
  self->_didJustCancelDialog = a3;
}

- (BOOL)forRetailOffer
{
  return self->_forRetailOffer;
}

- (void)setForRetailOffer:(BOOL)a3
{
  self->_forRetailOffer = a3;
}

- (NSString)purchaseToken
{
  return self->_purchaseToken;
}

- (void)setPurchaseToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSDictionary)buyParameters
{
  return self->_buyParameters;
}

- (void)setBuyParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSDictionary)requestHeaders
{
  return self->_requestHeaders;
}

- (void)setRequestHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (int64_t)failureType
{
  return self->_failureType;
}

- (void)setFailureType:(int64_t)a3
{
  self->_failureType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestHeaders, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);
  objc_storeStrong((id *)&self->_purchaseToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_finishingOperation, 0);
  objc_storeStrong(&self->_queuedCompletionBlock, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_objectModels, 0);
  objc_storeStrong((id *)&self->_accountPageViewController, 0);
  objc_storeStrong((id *)&self->_topViewController, 0);
  objc_storeStrong((id *)&self->_parentNavigationController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

- (void)_handleFinishForOperation:withOutput:.cold.1()
{
  __assert_rtn("-[ICQCommerceRemoteUIDelegate _handleFinishForOperation:withOutput:]", "ICQCommerceRemoteUIDelegate.m", 343, "[firstPage isKindOfClass:[RUIPage class]]");
}

- (void)cancelFlowBecause:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "Cancel called on already cancelled ICQCommerceRemoteUIDelegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)userCompletedFlow:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "Completed called on already cancelled ICQCommerceRemoteUIDelegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __46__ICQCommerceRemoteUIDelegate_makeBuyRequest___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "CommerceRemoteUIDelegate object got destroyed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __46__ICQCommerceRemoteUIDelegate_makeBuyRequest___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a2, a3, "AMS Purchase completed with error %@", a5, a6, a7, a8, 2u);
}

- (void)processLink:forceAuth:needsAuth:localAuth:usePurchaseToken:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "ISStoreURLOperation request is already in progress. Bailing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)parentViewControllerForObjectModel:.cold.1()
{
  __assert_rtn("-[ICQCommerceRemoteUIDelegate parentViewControllerForObjectModel:]", "ICQCommerceRemoteUIDelegate.m", 1016, "_navigationController");
}

- (void)_popObjectModelAnimated:.cold.1()
{
  __assert_rtn("-[ICQCommerceRemoteUIDelegate _popObjectModelAnimated:]", "ICQCommerceRemoteUIDelegate.m", 1023, "0");
}

- (void)accountPageViewController:financeInterruptionResolved:.cold.1()
{
  __assert_rtn("-[ICQCommerceRemoteUIDelegate accountPageViewController:financeInterruptionResolved:]", "ICQCommerceRemoteUIDelegate.m", 1143, "_accountPageViewController == viewController");
}

- (void)_dismissAccountPageViewController:keepCommerceSpinner:.cold.1()
{
  __assert_rtn("-[ICQCommerceRemoteUIDelegate _dismissAccountPageViewController:keepCommerceSpinner:]", "ICQCommerceRemoteUIDelegate.m", 1161, "_accountPageViewController == viewController");
}

- (void)_popAccountPageViewController:keepCommerceSpinner:.cold.1()
{
  __assert_rtn("-[ICQCommerceRemoteUIDelegate _popAccountPageViewController:keepCommerceSpinner:]", "ICQCommerceRemoteUIDelegate.m", 1177, "_accountPageViewController == viewController");
}

- (void)_forgetAccountPageViewController:.cold.1()
{
  __assert_rtn("-[ICQCommerceRemoteUIDelegate _forgetAccountPageViewController:]", "ICQCommerceRemoteUIDelegate.m", 1207, "_accountPageViewController == viewController");
}

- (void)_handleResponseForDialog:atIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "more than one GotoFinance in the same flow!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithNavigationController:needsModalPresentation:.cold.1()
{
  __assert_rtn("-[ICQCommerceRemoteUIDelegate initWithNavigationController:needsModalPresentation:]", "ICQCommerceRemoteUIDelegate.m", 1380, "navigationController");
}

void __91__ICQCommerceRemoteUIDelegate_handleAuthenticateRequest_purchase_purchaseQueue_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a2, a3, "Error attempting silent auth: %@", a5, a6, a7, a8, 2u);
}

@end
