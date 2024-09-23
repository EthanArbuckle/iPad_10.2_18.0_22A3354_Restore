@implementation MSQuickActionController

- (MSQuickActionController)init
{
  MSQuickActionController *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSQuickActionController;
  v2 = -[MSQuickActionController init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v4 = SSAccountStoreChangedNotification;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_accountStoreDidChange:", v4, v5);

  }
  return v2;
}

+ (void)updateShortcutItems
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_msgSend((id)objc_opt_class(a1, a2), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_shortcutItems"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v4, "setShortcutItems:", v5);

}

- (id)_shortcutItems
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v27;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = objc_claimAutoreleasedReturnValue(+[UIApplicationShortcutIcon iconWithType:](UIApplicationShortcutIcon, "iconWithType:", 5));
  v4 = objc_alloc((Class)UIApplicationShortcutItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("QUICK_ACTION_SEARCH"), &stru_10000C7F8, 0));
  v27 = (void *)v3;
  v7 = objc_msgSend(v4, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", CFSTR("com.apple.MobileStore.search"), v6, 0, v3, 0);

  objc_msgSend(v2, "addObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeAccount"));

  if ((objc_msgSend(v9, "isManagedAppleID") & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationShortcutIcon iconWithTemplateImageName:](UIApplicationShortcutIcon, "iconWithTemplateImageName:", CFSTR("RedeemMusicCodeQuickAction")));
    v11 = objc_alloc((Class)UIApplicationShortcutItem);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("QUICK_ACTION_REDEEM"), &stru_10000C7F8, 0));
    v14 = objc_msgSend(v11, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", CFSTR("com.apple.MobileStore.redeem"), v13, 0, v10, 0);

    objc_msgSend(v2, "addObject:", v14);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationShortcutIcon iconWithType:](UIApplicationShortcutIcon, "iconWithType:", 28));
  v16 = objc_alloc((Class)UIApplicationShortcutItem);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("QUICK_ACTION_VIEW_DOWNLOADS"), &stru_10000C7F8, 0));
  v19 = objc_msgSend(v16, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", CFSTR("com.apple.MobileStore.viewdownloads"), v18, 0, v15, 0);

  objc_msgSend(v2, "addObject:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationShortcutIcon iconWithTemplateImageName:](UIApplicationShortcutIcon, "iconWithTemplateImageName:", CFSTR("QuickActionPurchased")));
  v21 = objc_alloc((Class)UIApplicationShortcutItem);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("QUICK_ACTION_PURCHASED"), &stru_10000C7F8, 0));
  v24 = objc_msgSend(v21, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", CFSTR("com.apple.MobileStore.purchased"), v23, 0, v20, 0);

  objc_msgSend(v2, "addObject:", v24);
  v25 = objc_msgSend(v2, "copy");

  return v25;
}

+ (id)sharedInstance
{
  if (qword_100011E10 != -1)
    dispatch_once(&qword_100011E10, &stru_10000C448);
  return (id)qword_100011E08;
}

+ (void)processShortcutItem:(id)a3 applicationController:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = objc_msgSend((id)objc_opt_class(a1, v11), "sharedInstance");
  v13 = (id)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v13, "processShortcutItem:applicationController:completionHandler:", v10, v9, v8);

}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = SSAccountStoreChangedNotification;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"));
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)MSQuickActionController;
  -[MSQuickActionController dealloc](&v6, "dealloc");
}

- (void)processShortcutItem:(id)a3 applicationController:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003174;
  block[3] = &unk_10000C4E8;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v7 = v13;
  v8 = v12;
  v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_accountStoreDidChange:(id)a3
{
  objc_msgSend((id)objc_opt_class(self, a2), "updateShortcutItems");
}

@end
