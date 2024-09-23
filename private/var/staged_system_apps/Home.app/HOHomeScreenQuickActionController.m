@implementation HOHomeScreenQuickActionController

- (HOHomeScreenQuickActionController)initWithApplication:(id)a3
{
  id v6;
  HOHomeScreenQuickActionController *v7;
  HOHomeScreenQuickActionController *v8;
  HOHomeScreenQuickActionItemManager *v9;
  HOHomeScreenQuickActionItemManager *itemManager;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15[2];
  id location;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HOHomeScreenQuickActionController;
  v7 = -[HOHomeScreenQuickActionController init](&v17, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_application, a3);
    v9 = -[HOHomeScreenQuickActionItemManager initWithDelegate:]([HOHomeScreenQuickActionItemManager alloc], "initWithDelegate:", v8);
    itemManager = v8->_itemManager;
    v8->_itemManager = v9;

    objc_initWeak(&location, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[HMFScheduler defaultScheduler](HMFScheduler, "defaultScheduler"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100006074;
    v14[3] = &unk_1000B5D38;
    objc_copyWeak(v15, &location);
    v15[1] = (id)a2;
    v12 = objc_msgSend(v11, "performBlock:", v14);

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)_updateShortcutItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOHomeScreenQuickActionController itemManager](self, "itemManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayedItemsInSection:", 0));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000A5A8;
  v10[3] = &unk_1000B5D60;
  v10[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_map:", v10));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture combineAllFutures:ignoringErrors:scheduler:](NAFuture, "combineAllFutures:ignoringErrors:scheduler:", v5, 1, v6));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000BA1C;
  v9[3] = &unk_1000B5DC8;
  v9[4] = self;
  v8 = objc_msgSend(v7, "addCompletionBlock:", v9);

}

- (id)_generateShortcutItemForActionSetItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latestResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", HFResultDisplayTitleKey));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOHomeScreenQuickActionController itemManager](self, "itemManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionSet"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));

    if (v13 && v10)
    {
      v14 = objc_msgSend(v4, "copy");

      v15 = objc_alloc_init((Class)NAFuture);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler globalAsyncScheduler](NAScheduler, "globalAsyncScheduler"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10000909C;
      v24[3] = &unk_1000B5DF0;
      v25 = v13;
      v26 = v10;
      v4 = v14;
      v27 = v4;
      v28 = v6;
      v29 = v15;
      v17 = v15;
      objc_msgSend(v16, "performBlock:", v24);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "reschedule:", v18));

    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[HOHomeScreenQuickActionController itemManager](self, "itemManager"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "home"));
      NSLog(CFSTR("No action set or home identifier for action set item: %@. Home: %@"), v4, v22);

      v17 = (id)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:](NSError, "hf_errorWithCode:", 33));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v17));
    }

  }
  else
  {
    NSLog(CFSTR("No title for action set item: %@"), v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:](NSError, "hf_errorWithCode:", 33));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v20));

  }
  return v19;
}

- (HOHomeScreenQuickActionItemManager)itemManager
{
  return self->_itemManager;
}

- (UIApplication)application
{
  return self->_application;
}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
  objc_msgSend(a4, "performWithOptions:", 0);
  -[HOHomeScreenQuickActionController _updateShortcutItems](self, "_updateShortcutItems");
}

- (id)performActionForShortcutItem:(id)a3 navigator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "type"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("HOHomeScreenQuickActionExecuteSceneType"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOHomeScreenQuickActionController _executeActionSetForShortcutItem:navigator:](self, "_executeActionSetForShortcutItem:navigator:", v7, v6));

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "type"));

    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("HOHomeScreenQuickActionCreateSceneType"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "homeFuture"));
      v15 = objc_msgSend(v6, "createOrEditActionSetWithName:home:switchToHomeTab:", 0, v14, 0);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)_executeActionSetForShortcutItem:(id)a3 navigator:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class(NSString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HOHomeScreenQuickActionActionSetIdentifierKey")));
  if ((objc_opt_isKindOfClass(v9, v7) & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v12 = objc_opt_class(NSString);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("HOHomeScreenQuickActionHomeIdentifierKey")));
  if ((objc_opt_isKindOfClass(v14, v12) & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (!v11)
  {
    NSLog(CFSTR("No action set identifier in shortcut item: %@"), v5);
    if (v16)
    {
LABEL_12:
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:](NSError, "hf_errorWithCode:", 33));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v20));

      goto LABEL_13;
    }
LABEL_11:
    NSLog(CFSTR("No home identifier in shortcut item: %@"), v5);
    goto LABEL_12;
  }
  if (!v16)
    goto LABEL_11;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allHomesFuture"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100014EA8;
  v22[3] = &unk_1000B5E68;
  v23 = v16;
  v24 = v5;
  v25 = v11;
  v26 = v6;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "flatMap:", v22));

LABEL_13:
  return v19;
}

- (void)setApplication:(id)a3
{
  objc_storeStrong((id *)&self->_application, a3);
}

- (void)setItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_itemManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end
