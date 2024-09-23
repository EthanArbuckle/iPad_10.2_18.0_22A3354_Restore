@implementation WebAppNotificationCenterDelegate

+ (id)sharedDelegate
{
  if (sharedDelegate_onceToken != -1)
    dispatch_once(&sharedDelegate_onceToken, &__block_literal_global_0);
  return (id)sharedDelegate_sharedDelegate;
}

void __50__WebAppNotificationCenterDelegate_sharedDelegate__block_invoke()
{
  WebAppNotificationCenterDelegate *v0;
  void *v1;
  uint64_t v2;
  id v3;

  v0 = objc_alloc_init(WebAppNotificationCenterDelegate);
  v1 = (void *)sharedDelegate_sharedDelegate;
  sharedDelegate_sharedDelegate = (uint64_t)v0;

  v2 = sharedDelegate_sharedDelegate;
  objc_msgSend(MEMORY[0x24BDF88B8], "currentNotificationCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", v2);

}

- (WebAppNotificationCenterDelegate)init
{
  WebAppNotificationCenterDelegate *v2;
  uint64_t v3;
  NSMutableDictionary *webAppViewControllers;
  WebAppNotificationCenterDelegate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WebAppNotificationCenterDelegate;
  v2 = -[WebAppNotificationCenterDelegate init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    webAppViewControllers = v2->_webAppViewControllers;
    v2->_webAppViewControllers = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)addWebAppViewController:(id)a3
{
  NSMutableDictionary *webAppViewControllers;
  id v4;
  void *v5;
  id v6;

  webAppViewControllers = self->_webAppViewControllers;
  v4 = a3;
  objc_msgSend(v4, "webClip");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](webAppViewControllers, "setObject:forKeyedSubscript:", v4, v5);

}

- (void)removeWebAppViewController:(id)a3
{
  void *v4;
  void *v5;
  NSMutableDictionary *webAppViewControllers;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "webClip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    webAppViewControllers = self->_webAppViewControllers;
    objc_msgSend(v9, "webClip");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](webAppViewControllers, "setObject:forKeyedSubscript:", 0, v8);

  }
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  char v10;
  NSMutableDictionary *webAppViewControllers;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  objc_msgSend(v7, "actionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDF8A60]);

  if ((v10 & 1) != 0)
  {
    webAppViewControllers = self->_webAppViewControllers;
    objc_msgSend(v7, "notification");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "content");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "targetContentIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](webAppViewControllers, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v7, "notification");
      v17 = objc_claimAutoreleasedReturnValue();
      -[NSObject request](v17, "request");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "content");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "userInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "notificationActivated:", v20);
    }
    else
    {
      viewServiceLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
LABEL_10:

        v8[2](v8);
        goto LABEL_11;
      }
      objc_msgSend(v7, "notification");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "request");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "content");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "targetContentIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v23;
      _os_log_impl(&dword_22E28F000, v17, OS_LOG_TYPE_INFO, "Received UNNotificationResponse for WebClip %{public}@, but cannot find associated WebAppViewController", (uint8_t *)&v24, 0xCu);

    }
    goto LABEL_10;
  }
  viewServiceLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "actionIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412290;
    v25 = v22;
    _os_log_impl(&dword_22E28F000, v21, OS_LOG_TYPE_INFO, "Received UNNotificationResponse that was not for the default action: %@", (uint8_t *)&v24, 0xCu);

  }
  v8[2](v8);
LABEL_11:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webAppViewControllers, 0);
}

@end
