@implementation URTAlertPresenter

- (URTAlertPresenter)init
{
  URTAlertPresenter *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *presentationsForDestinations;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *presentationsQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)URTAlertPresenter;
  v2 = -[URTAlertPresenter init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    presentationsForDestinations = v2->_presentationsForDestinations;
    v2->_presentationsForDestinations = v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.internal.UserAlerts.presentationQueue", v5);
    presentationsQueue = v2->_presentationsQueue;
    v2->_presentationsQueue = (OS_dispatch_queue *)v6;

    objc_storeWeak((id *)&v2->_userNotificationPresentation, 0);
    v2->_compatibilityCallback = 0;
    *(_QWORD *)&v2->_compatibilityResponse = 0;

  }
  return v2;
}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[URTAlertPresenter presentationsQueue](self, "presentationsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__URTAlertPresenter_invalidate__block_invoke;
  block[3] = &unk_24DC7B160;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __31__URTAlertPresenter_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentationQueue_invalidate");
}

- (void)addAlert:(id)a3 forDestination:(int64_t)a4
{
  -[URTAlertPresenter addAlert:forDestination:preferringStyle:](self, "addAlert:forDestination:preferringStyle:", a3, a4, 0);
}

- (void)addAlert:(id)a3 forDestination:(int64_t)a4 preferringStyle:(int64_t)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  URTAlertPresenter *v13;
  int64_t v14;
  int64_t v15;

  v8 = a3;
  -[URTAlertPresenter presentationsQueue](self, "presentationsQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__URTAlertPresenter_addAlert_forDestination_preferringStyle___block_invoke;
  block[3] = &unk_24DC7B188;
  v14 = a4;
  v15 = a5;
  v12 = v8;
  v13 = self;
  v10 = v8;
  dispatch_sync(v9, block);

}

void __61__URTAlertPresenter_addAlert_forDestination_preferringStyle___block_invoke(uint64_t a1)
{
  __objc2_class **v2;
  void *v3;
  void *v4;
  id v5;

  v2 = off_24DC7ACF8;
  if (*(_QWORD *)(a1 + 48))
    v2 = &off_24DC7AD00;
  v5 = (id)objc_msgSend(objc_alloc(*v2), "initWithAlert:forDestination:preferredPresentationStyle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "presentationsForDestinations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, v4);

}

- (void)_addDefaultDestinationAlertFromUserNotificationContents:(id)a3 flags:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  URTAlertPresenter *v11;
  unint64_t v12;

  v6 = a3;
  -[URTAlertPresenter presentationsQueue](self, "presentationsQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__URTAlertPresenter__addDefaultDestinationAlertFromUserNotificationContents_flags___block_invoke;
  block[3] = &unk_24DC7B1B0;
  v11 = self;
  v12 = a4;
  v10 = v6;
  v8 = v6;
  dispatch_sync(v7, block);

}

void __83__URTAlertPresenter__addDefaultDestinationAlertFromUserNotificationContents_flags___block_invoke(uint64_t a1)
{
  void *v2;
  URTUserNotificationPresentation *v3;

  v3 = -[URTUserNotificationPresentation initWithContents:flags:]([URTUserNotificationPresentation alloc], "initWithContents:flags:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 40), v3);
  objc_msgSend(*(id *)(a1 + 40), "presentationsForDestinations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, &unk_24DC7D390);

}

- (void)_addFromUserNotificationContents:(id)a3 toServiceDestination:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int64_t v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDBD6D8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  URTVerifyString(v7);
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDBD6E0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  URTVerifyString(v9);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v8 | v10)
  {
    v24 = a4;
    objc_initWeak(&location, self);
    +[URTAlert alertWithTitle:message:](URTAlert, "alertWithTitle:message:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDBD6F8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    URTVerifyString(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __75__URTAlertPresenter__addFromUserNotificationContents_toServiceDestination___block_invoke;
      v29[3] = &unk_24DC7B1D8;
      objc_copyWeak(&v30, &location);
      +[URTAlertAction actionWithTitle:handler:](URTAlertAction, "actionWithTitle:handler:", v13, v29);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDefaultAction:", v14);

      objc_destroyWeak(&v30);
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDBD718]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    URTVerifyString(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __75__URTAlertPresenter__addFromUserNotificationContents_toServiceDestination___block_invoke_2;
      v27[3] = &unk_24DC7B1D8;
      objc_copyWeak(&v28, &location);
      +[URTAlertAction actionWithTitle:handler:](URTAlertAction, "actionWithTitle:handler:", v16, v27);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setOtherAction:", v17);

      objc_destroyWeak(&v28);
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDBD6F0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    URTVerifyString(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __75__URTAlertPresenter__addFromUserNotificationContents_toServiceDestination___block_invoke_3;
      v25[3] = &unk_24DC7B1D8;
      objc_copyWeak(&v26, &location);
      +[URTAlertAction actionWithTitle:handler:](URTAlertAction, "actionWithTitle:handler:", v16, v25);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCancelAction:", v20);

      objc_destroyWeak(&v26);
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SBUserNotificationAllowedApplications"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_class();
    URTVerifyClass(v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setAllowedApplicationBundleIDs:", v23);
    -[URTAlertPresenter addAlert:forDestination:](self, "addAlert:forDestination:", v11, v24);

    objc_destroyWeak(&location);
  }

}

void __75__URTAlertPresenter__addFromUserNotificationContents_toServiceDestination___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invokeCallbackForResponseFlags:", 0);

}

void __75__URTAlertPresenter__addFromUserNotificationContents_toServiceDestination___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invokeCallbackForResponseFlags:", 2);

}

void __75__URTAlertPresenter__addFromUserNotificationContents_toServiceDestination___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invokeCallbackForResponseFlags:", 1);

}

- (void)present
{
  NSObject *v3;
  _QWORD block[5];

  -[URTAlertPresenter presentationsQueue](self, "presentationsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__URTAlertPresenter_present__block_invoke;
  block[3] = &unk_24DC7B160;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __28__URTAlertPresenter_present__block_invoke(uint64_t a1)
{
  void *v1;
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

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "presentationsForDestinations", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "present");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)dismiss
{
  NSObject *v3;
  _QWORD block[5];

  -[URTAlertPresenter presentationsQueue](self, "presentationsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__URTAlertPresenter_dismiss__block_invoke;
  block[3] = &unk_24DC7B160;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __28__URTAlertPresenter_dismiss__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentationQueue_dismiss");
}

- (void)handleCancelActionForAlertPresentation:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  URTLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_21A1D3000, v5, OS_LOG_TYPE_DEFAULT, "cancel button pressed for presentation %@", buf, 0xCu);
  }

  -[URTAlertPresenter presentationsQueue](self, "presentationsQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__URTAlertPresenter_handleCancelActionForAlertPresentation___block_invoke;
  v8[3] = &unk_24DC7B040;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

void __60__URTAlertPresenter_handleCancelActionForAlertPresentation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "alert");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_presentationQueue_invokeAction:forPresentation:", v3, *(_QWORD *)(a1 + 40));

}

- (void)handleDefaultActionForAlertPresentation:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  URTLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_21A1D3000, v5, OS_LOG_TYPE_DEFAULT, "default button pressed for presentation %@", buf, 0xCu);
  }

  -[URTAlertPresenter presentationsQueue](self, "presentationsQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__URTAlertPresenter_handleDefaultActionForAlertPresentation___block_invoke;
  v8[3] = &unk_24DC7B040;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

void __61__URTAlertPresenter_handleDefaultActionForAlertPresentation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "alert");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_presentationQueue_invokeAction:forPresentation:", v3, *(_QWORD *)(a1 + 40));

}

- (void)handleOtherActionForAlertPresentation:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  URTLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_21A1D3000, v5, OS_LOG_TYPE_DEFAULT, "other button pressed for presentation %@", buf, 0xCu);
  }

  -[URTAlertPresenter presentationsQueue](self, "presentationsQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__URTAlertPresenter_handleOtherActionForAlertPresentation___block_invoke;
  v8[3] = &unk_24DC7B040;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

void __59__URTAlertPresenter_handleOtherActionForAlertPresentation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "alert");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "otherAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_presentationQueue_invokeAction:forPresentation:", v3, *(_QWORD *)(a1 + 40));

}

- (void)_presentationQueue_invalidate
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[URTAlertPresenter presentationsForDestinations](self, "presentationsForDestinations", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "invalidate");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[URTAlertPresenter presentationsForDestinations](self, "presentationsForDestinations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

}

- (void)_presentationQueue_dismiss
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  -[URTAlertPresenter presentationsForDestinations](self, "presentationsForDestinations", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "dismiss");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[URTAlertPresenter _presentationQueue_invalidate](self, "_presentationQueue_invalidate");
}

- (void)_presentationQueue_removePresentation:(id)a3 forDestination:(int64_t)a4
{
  void *v6;
  id v7;

  objc_msgSend(a3, "invalidate");
  -[URTAlertPresenter presentationsForDestinations](self, "presentationsForDestinations");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v6);

}

- (void)_presentationQueue_invokeAction:(id)a3 forPresentation:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v9, "handler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v9, "handler");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v8)[2](v8, v9);

  }
  -[URTAlertPresenter _presentationQueue_removePresentation:forDestination:](self, "_presentationQueue_removePresentation:forDestination:", v6, objc_msgSend(v6, "destination"));

  -[URTAlertPresenter _presentationQueue_dismiss](self, "_presentationQueue_dismiss");
}

- (void)_invokeCallbackForResponseFlags:(unint64_t)a3
{
  void *v5;
  __CFRunLoop *Main;
  const void *v7;
  __CFRunLoop *v8;
  _QWORD block[7];

  v5 = -[URTAlertPresenter compatibilityCallback](self, "compatibilityCallback");
  Main = CFRunLoopGetMain();
  v7 = (const void *)*MEMORY[0x24BDBD5A0];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__URTAlertPresenter__invokeCallbackForResponseFlags___block_invoke;
  block[3] = &unk_24DC7B208;
  block[4] = self;
  block[5] = v5;
  block[6] = a3;
  CFRunLoopPerformBlock(Main, v7, block);
  v8 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v8);
}

_QWORD *__53__URTAlertPresenter__invokeCallbackForResponseFlags___block_invoke(_QWORD *result)
{
  uint64_t (*v1)(_QWORD, _QWORD);

  v1 = (uint64_t (*)(_QWORD, _QWORD))result[5];
  if (v1)
    return (_QWORD *)v1(result[4], result[6]);
  return result;
}

- (void)_handleUserNotificationResponse:(unint64_t)a3
{
  void (*v5)(URTAlertPresenter *, unint64_t);
  NSObject *v6;
  _QWORD block[5];

  v5 = -[URTAlertPresenter compatibilityCallback](self, "compatibilityCallback");
  if (v5)
    v5(self, a3);
  -[URTAlertPresenter presentationsQueue](self, "presentationsQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__URTAlertPresenter__handleUserNotificationResponse___block_invoke;
  block[3] = &unk_24DC7B160;
  block[4] = self;
  dispatch_sync(v6, block);

}

uint64_t __53__URTAlertPresenter__handleUserNotificationResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "userNotificationPresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_presentationQueue_removePresentation:forDestination:", v3, 0);

  return objc_msgSend(*(id *)(a1 + 32), "_presentationQueue_dismiss");
}

- (NSMutableDictionary)presentationsForDestinations
{
  return self->_presentationsForDestinations;
}

- (OS_dispatch_queue)presentationsQueue
{
  return self->_presentationsQueue;
}

- (void)compatibilityCallback
{
  return self->_compatibilityCallback;
}

- (void)setCompatibilityCallback:(void *)a3
{
  self->_compatibilityCallback = a3;
}

- (int)compatibilityResponse
{
  return self->_compatibilityResponse;
}

- (int)compatibilityResponseButtonFlag
{
  return self->_compatibilityResponseButtonFlag;
}

- (URTUserNotificationPresentation)userNotificationPresentation
{
  return (URTUserNotificationPresentation *)objc_loadWeakRetained((id *)&self->_userNotificationPresentation);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userNotificationPresentation);
  objc_storeStrong((id *)&self->_presentationsQueue, 0);
  objc_storeStrong((id *)&self->_presentationsForDestinations, 0);
}

@end
