@implementation WLKNotificationCenter

void __38__WLKNotificationCenter_defaultCenter__block_invoke()
{
  WLKNotificationCenter *v0;
  void *v1;

  v0 = objc_alloc_init(WLKNotificationCenter);
  v1 = (void *)defaultCenter__singleton;
  defaultCenter__singleton = (uint64_t)v0;

}

- (WLKNotificationCenter)init
{
  WLKNotificationCenter *v2;
  WLKNotificationsImpl_iOS *v3;
  WLKNotificationsImpl *impl;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WLKNotificationCenter;
  v2 = -[WLKNotificationCenter init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(WLKNotificationsImpl_iOS);
    impl = v2->_impl;
    v2->_impl = (WLKNotificationsImpl *)v3;

  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  -[WLKNotificationsImpl setDelegate:](self->_impl, "setDelegate:", a3);
}

+ (id)defaultCenter
{
  if (defaultCenter_onceToken != -1)
    dispatch_once(&defaultCenter_onceToken, &__block_literal_global_21);
  return (id)defaultCenter__singleton;
}

- (void)setBadgeNumber:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_msgSend(v7, "integerValue") & 0x8000000000000000) == 0)
    -[WLKNotificationsImpl setBadgeNumber:withCompletionHandler:](self->_impl, "setBadgeNumber:withCompletionHandler:", v7, v6);

}

- (void)post:(id)a3 title:(id)a4 body:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  WLKNotificationsImpl *impl;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("expirationDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v15, "compare:", v14) == 1)
    {
      NSLog(CFSTR("WLKNotificationCenter: notification has expired. will not post."));
    }
    else
    {
      impl = self->_impl;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __49__WLKNotificationCenter_post_title_body_options___block_invoke;
      v17[3] = &unk_1E68A8700;
      v17[4] = self;
      v18 = v10;
      v19 = v11;
      v20 = v12;
      v21 = v13;
      -[WLKNotificationsImpl getNotificationSettings:](impl, "getNotificationSettings:", v17);

    }
  }
  else
  {
    NSLog(CFSTR("WLKNotificationCenter: identifier is required. will not post"));
  }

}

void __49__WLKNotificationCenter_post_title_body_options___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  NSLog(CFSTR("UNUserNotificationCenter: notification status:%ld."), objc_msgSend(v3, "authorizationStatus"));
  v4 = objc_msgSend(v3, "authorizationStatus");

  if (v4 == 2)
    objc_msgSend(*(id *)(a1[4] + 8), "post:title:body:options:", a1[5], a1[6], a1[7], a1[8]);
}

- (void)setBadgeString:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (!objc_msgSend(v7, "length") || objc_msgSend(v7, "isEqualToString:", CFSTR(" ")))
    -[WLKNotificationsImpl setBadgeString:withCompletionHandler:](self->_impl, "setBadgeString:withCompletionHandler:", v7, v6);

}

- (BOOL)isCategoryEnabledByUser:(int64_t)a3
{
  return -[WLKNotificationsImpl isCategoryEnabledByUser:](self->_impl, "isCategoryEnabledByUser:", a3);
}

- (BOOL)isCategoryBadgeSettingEnabledByUser:(int64_t)a3
{
  return -[WLKNotificationsImpl isCategoryBadgeSettingEnabledByUser:](self->_impl, "isCategoryBadgeSettingEnabledByUser:", a3);
}

- (WLKNotificationCenterDelegate)delegate
{
  return (WLKNotificationCenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
