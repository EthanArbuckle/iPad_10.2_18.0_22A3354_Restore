@implementation TPSUserNotificationController

- (BOOL)isNotificationSettingValid
{
  void *v2;
  void *v3;
  BOOL v4;

  -[TPSUserNotificationController userNotificationCenter](self, "userNotificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "alertStyle")
    || objc_msgSend(v3, "notificationCenterSetting") == 2
    || objc_msgSend(v3, "lockScreenSetting") == 2;

  return v4;
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (TPSUserNotificationController)initWithBundleIdentifier:(id)a3
{
  id v4;
  TPSUserNotificationController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UNUserNotificationCenter *userNotificationCenter;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSUserNotificationController;
  v5 = -[TPSLocalNotificationController initWithBundleIdentifier:](&v11, sel_initWithBundleIdentifier_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CEC720], "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("tip-notification-extension"), MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", v4);
    userNotificationCenter = v5->_userNotificationCenter;
    v5->_userNotificationCenter = (UNUserNotificationCenter *)v8;

    -[UNUserNotificationCenter setNotificationCategories:](v5->_userNotificationCenter, "setNotificationCategories:", v7);
  }

  return v5;
}

- (void)removeAllNotifications
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TPSUserNotificationController;
  -[TPSLocalNotificationController removeAllNotifications](&v4, sel_removeAllNotifications);
  -[TPSUserNotificationController userNotificationCenter](self, "userNotificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllDeliveredNotifications");

}

- (void)removeNotificationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)TPSUserNotificationController;
  v4 = a3;
  -[TPSLocalNotificationController removeNotificationWithIdentifier:](&v7, sel_removeNotificationWithIdentifier_, v4);
  -[TPSUserNotificationController userNotificationCenter](self, "userNotificationCenter", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeDeliveredNotificationsWithIdentifiers:", v6);
}

- (void)sendNotificationWithIdentifier:(id)a3 collectionID:(id)a4 correlationID:(id)a5 title:(id)a6 text:(id)a7 attachmentURL:(id)a8 extensionPayload:(id)a9
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a8;
  v17 = (void *)MEMORY[0x1E0C99E08];
  v18 = a7;
  v19 = a6;
  v20 = a5;
  objc_msgSend(v17, "dictionaryWithDictionary:", a9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v16;
  if (objc_msgSend(v15, "length"))
  {
    if (v16)
    {
      v31 = v20;
      if (a9)
      {
        v22 = 0;
      }
      else
      {
        v36 = *MEMORY[0x1E0CEC7E8];
        v37[0] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
        v22 = objc_claimAutoreleasedReturnValue();
      }
      v30 = (void *)v22;
      v23 = (void *)MEMORY[0x1E0CEC718];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUIDString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      objc_msgSend(v23, "attachmentWithIdentifier:URL:options:error:", v25, v33, v22, &v34);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v34;

      v16 = 0;
      if (!v27)
      {
        v35 = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }

      v20 = v31;
    }
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v15, CFSTR("collectionId"));
  }
  else
  {
    v16 = 0;
  }
  v28 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  objc_msgSend(v28, "setTitle:", v19);

  objc_msgSend(v28, "setBody:", v18);
  objc_msgSend(MEMORY[0x1E0DBF3B0], "URLWithTipIdentifier:collectionIdentifier:referrer:", v14, v15, *MEMORY[0x1E0DBF430]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setDefaultActionURL:", v29);

  objc_msgSend(v28, "setUserInfo:", v21);
  if (v16)
    objc_msgSend(v28, "setAttachments:", v16);
  if (a9)
    objc_msgSend(v28, "setCategoryIdentifier:", CFSTR("tip-notification-extension"));
  objc_msgSend(v28, "setInterruptionLevel:", 0);
  -[TPSUserNotificationController sendNotificationWithIdentifier:collectionID:correlationID:content:](self, "sendNotificationWithIdentifier:collectionID:correlationID:content:", v14, v15, v20, v28);

}

- (void)sendNotificationWithIdentifier:(id)a3 collectionID:(id)a4 correlationID:(id)a5 content:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
    v14 = v10;
  else
    v14 = v11;
  objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", v14, v13, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[TPSUserNotificationController userNotificationCenter](self, "userNotificationCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __99__TPSUserNotificationController_sendNotificationWithIdentifier_collectionID_correlationID_content___block_invoke;
  v20[3] = &unk_1EA1E12D8;
  objc_copyWeak(&v24, &location);
  v17 = v10;
  v21 = v17;
  v18 = v11;
  v22 = v18;
  v19 = v12;
  v23 = v19;
  objc_msgSend(v16, "addNotificationRequest:withCompletionHandler:", v15, v20);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __99__TPSUserNotificationController_sendNotificationWithIdentifier_collectionID_correlationID_content___block_invoke(_QWORD *a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 7);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "notificationCompletedForIdentifier:collectionID:correlationID:error:", a1[4], a1[5], a1[6], v4);

}

- (void)setUserNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_userNotificationCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
}

@end
