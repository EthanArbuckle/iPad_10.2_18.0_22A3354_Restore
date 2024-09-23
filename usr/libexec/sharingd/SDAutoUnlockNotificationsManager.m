@implementation SDAutoUnlockNotificationsManager

+ (id)sharedManager
{
  if (qword_1007C6510 != -1)
    dispatch_once(&qword_1007C6510, &stru_100714D68);
  return (id)qword_1007C6508;
}

- (SDAutoUnlockNotificationsManager)init
{
  SDAutoUnlockNotificationsManager *v2;
  uint64_t v3;
  NSHashTable *observers;
  FLFollowUpController *v5;
  FLFollowUpController *coreFollowUpController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDAutoUnlockNotificationsManager;
  v2 = -[SDAutoUnlockNotificationsManager init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = (FLFollowUpController *)objc_msgSend(objc_alloc((Class)FLFollowUpController), "initWithClientIdentifier:", CFSTR("com.apple.sharingd.phone-auto-unlock-client"));
    coreFollowUpController = v2->coreFollowUpController;
    v2->coreFollowUpController = v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SDAutoUnlockNotificationsManager;
  -[SDAutoUnlockNotificationsManager dealloc](&v2, "dealloc");
}

- (void)addObserver:(id)a3
{
  id v4;
  SDAutoUnlockNotificationsManager *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NSHashTable addObject:](v5->_observers, "addObject:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  SDAutoUnlockNotificationsManager *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NSHashTable removeObject:](v5->_observers, "removeObject:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (void)notifyObservers:(SEL)a3
{
  SDAutoUnlockNotificationsManager *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockNotificationsManager observers](v4, "observers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));

  objc_sync_exit(v4);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v11, a3) & 1) != 0)
          ((void (*)(void *, SEL))objc_msgSend(v11, "methodForSelector:", a3, (_QWORD)v12))(v11, a3);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)showAuthenticatedSiriForDeviceID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceNameForDeviceID:", v3));

  v7 = auto_unlock_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Posting \"%@\" authenticated Siri by Apple Watch (device ID: %@)", (uint8_t *)&v9, 0x16u);
  }

}

- (void)showUnlockedByDeviceNotificationWithDeviceID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceNameForDeviceID:", v3));

  v7 = auto_unlock_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Posting \"%@\" unlocked by Apple Watch (device ID: %@)", (uint8_t *)&v9, 0x16u);
  }

}

- (void)clearPhoneAutoUnlockUpsellNotification:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  FLFollowUpController *coreFollowUpController;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  const __CFString *v12;

  v3 = a3;
  v5 = auto_unlock_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Clearing auto unlock notification (isUpsell=%@)", buf, 0xCu);
  }

  coreFollowUpController = self->coreFollowUpController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004C214;
  v9[3] = &unk_100714D90;
  v10 = v3;
  v9[4] = self;
  -[FLFollowUpController pendingFollowUpItemsWithCompletion:](coreFollowUpController, "pendingFollowUpItemsWithCompletion:", v9);
}

- (void)showPhoneAutoUnlockNotificationWithBodyText:(id)a3 isUpsell:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v23;
  FLFollowUpController *coreFollowUpController;
  id v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint8_t buf[4];
  const __CFString *v37;
  _QWORD v38[2];
  const __CFString *v39;
  void *v40;

  v4 = a4;
  v6 = a3;
  -[SDAutoUnlockNotificationsManager clearPhoneAutoUnlockUpsellNotification:](self, "clearPhoneAutoUnlockUpsellNotification:", v4);
  v7 = objc_alloc_init((Class)FLFollowUpItem);
  v8 = objc_alloc_init((Class)FLFollowUpAction);
  v9 = objc_alloc_init((Class)FLFollowUpNotification);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=Pearl")));
  objc_msgSend(v8, "setUrl:", v10);

  v12 = SFLocalizedStringForKey(CFSTR("UNLOCK_PHONE_UPSELL_TITLE"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v9, "setTitle:", v13);

  objc_msgSend(v9, "setInformativeText:", v6);
  objc_msgSend(v9, "setActivateAction:", v8);
  objc_msgSend(v9, "setFrequency:", 0.0);
  objc_msgSend(v7, "setUniqueIdentifier:", CFSTR("com.apple.sharingd.phone-auto-unlock-upsell"));
  objc_msgSend(v7, "setNotification:", v9);
  v39 = CFSTR("SDPhoneAutoUnlockNotificationUpsellKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  v40 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
  objc_msgSend(v7, "setUserInfo:", v15);

  objc_msgSend(v7, "setDisplayStyle:", 24);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FLFollowUpNotification defaultOptions](FLFollowUpNotification, "defaultOptions"));
  v38[0] = FLNotificationOptionBannerAlert;
  v38[1] = FLNotificationOptionNotificationCenter;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "setByAddingObjectsFromArray:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notification"));
  objc_msgSend(v19, "setOptions:", v18);

  v21 = auto_unlock_log(v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = CFSTR("NO");
    if (v4)
      v23 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v37 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Posting auto unlock notification (isUpsell=%@)", buf, 0xCu);
  }

  coreFollowUpController = self->coreFollowUpController;
  v35 = 0;
  -[FLFollowUpController postFollowUpItem:error:](coreFollowUpController, "postFollowUpItem:error:", v7, &v35);
  v25 = v35;
  v26 = v25;
  if (v25)
  {
    v27 = auto_unlock_log(v25);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_10004D1F4((uint64_t)v26, v28, v29, v30, v31, v32, v33, v34);

  }
}

- (void)showPhoneAutoRelockNotification
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v2 = SFLocalizedStringForKey(CFSTR("UNLOCK_IPHONE_AUTO_RELOCK_TITLE"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = SFLocalizedStringForKey(CFSTR("UNLOCK_IPHONE_AUTO_RELOCK_BODY"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = CUMainQueue();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004C878;
  v11[3] = &unk_100714860;
  v12 = v3;
  v13 = v6;
  v9 = v6;
  v10 = v3;
  dispatch_async(v8, v11);

}

- (void)showRequestToUnlockNotification
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v2 = SFLocalizedStringForKey(CFSTR("ARM_XROS_PHONE_UNLOCK_TITLE"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = SFLocalizedStringForKey(CFSTR("ARM_XROS_PHONE_UNLOCK_BODY"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = CUMainQueue();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004CB98;
  v11[3] = &unk_100714860;
  v12 = v3;
  v13 = v6;
  v9 = v6;
  v10 = v3;
  dispatch_async(v8, v11);

}

- (void)dismissRequestToUnlockNotification
{
  CFUserNotificationCancel((CFUserNotificationRef)qword_1007D7F20);
}

- (void)restartNotificationTimer:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  uint8_t buf[16];

  v5 = auto_unlock_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restarting notification timer", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockNotificationsManager notificationTimer](self, "notificationTimer"));
  if (!v7)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10004CF28;
    v12[3] = &unk_1007146D8;
    v12[4] = self;
    v8 = sub_10019AAD8(0, &_dispatch_main_q, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[SDAutoUnlockNotificationsManager setNotificationTimer:](self, "setNotificationTimer:", v9);

    v10 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockNotificationsManager notificationTimer](self, "notificationTimer"));
    dispatch_resume(v10);

  }
  v11 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockNotificationsManager notificationTimer](self, "notificationTimer"));
  sub_10019AB78(v11, a3);

}

- (void)invalidateNotificationTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invaliding suggestion scan timer", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockNotificationsManager notificationTimer](self, "notificationTimer"));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockNotificationsManager notificationTimer](self, "notificationTimer"));
    dispatch_source_cancel(v6);

    -[SDAutoUnlockNotificationsManager setNotificationTimer:](self, "setNotificationTimer:", 0);
  }
}

- (SFAutoUnlockNotificationModel)notificationModel
{
  return self->_notificationModel;
}

- (void)setNotificationModel:(id)a3
{
  objc_storeStrong((id *)&self->_notificationModel, a3);
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setObservers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDictionary)promptInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPromptInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_source)notificationTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNotificationTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (id)radarNotificationCompletion
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setRadarNotificationCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_radarNotificationCompletion, 0);
  objc_storeStrong((id *)&self->_notificationTimer, 0);
  objc_storeStrong((id *)&self->_promptInfo, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notificationModel, 0);
  objc_storeStrong(&self->_cancelListener, 0);
  objc_storeStrong(&self->_doubleClickListener, 0);
  objc_storeStrong((id *)&self->coreFollowUpController, 0);
}

@end
