@implementation TPSLocalNotificationController

- (TPSLocalNotificationController)initWithBundleIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TPSLocalNotificationController;
  return -[TPSLocalNotificationController init](&v4, sel_init, a3);
}

- (BOOL)isNotificationSettingValid
{
  return 0;
}

- (id)personalizedStringForText:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0DBF348];
  v4 = a3;
  objc_msgSend(v3, "deviceMarketingName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{{device_name}}"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)showNotificationForNotificationCache:(id)a3 attachmentURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0DBF3A0], "suppressNotifications") & 1) == 0)
  {
    objc_msgSend(v6, "document");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "notification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSLocalNotificationController personalizedStringForText:](self, "personalizedStringForText:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSLocalNotificationController personalizedStringForText:](self, "personalizedStringForText:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "identifier");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "correlationID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "length") || objc_msgSend(v13, "length")) && v14 | v15)
    {
      objc_msgSend(v6, "extensionPayload");
      v22 = v9;
      v17 = v7;
      v18 = v16;
      v19 = v13;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPSLocalNotificationController sendNotificationWithIdentifier:collectionID:correlationID:title:text:attachmentURL:extensionPayload:](self, "sendNotificationWithIdentifier:collectionID:correlationID:title:text:attachmentURL:extensionPayload:", v14, v15, v18, v11, v19, v17, v20);

      v13 = v19;
      v16 = v18;
      v7 = v17;
      v9 = v22;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v24 = v11;
        v25 = 2112;
        v26 = v13;
        v27 = 2112;
        v28 = v14;
        v29 = 2112;
        v30 = v15;
        _os_log_impl(&dword_1DAC2F000, v21, OS_LOG_TYPE_DEFAULT, "Notification document missing information Title: %@ text: %@ identifier: %@ collectionID: %@.", buf, 0x2Au);
      }

    }
  }

}

- (void)sendNotificationWithIdentifier:(id)a3 collectionID:(id)a4 correlationID:(id)a5 title:(id)a6 text:(id)a7 attachmentURL:(id)a8 extensionPayload:(id)a9
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412802;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_1DAC2F000, v14, OS_LOG_TYPE_DEFAULT, "Send notification with identifier %@, collectionID %@, correlationID %@", (uint8_t *)&v15, 0x20u);
  }

}

- (void)removeAllNotifications
{
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DAC2F000, v2, OS_LOG_TYPE_DEFAULT, "Remove all notifications.", v3, 2u);
  }

}

- (void)removeNotificationWithIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1DAC2F000, v4, OS_LOG_TYPE_DEFAULT, "Remove notification for identifier: %@.", (uint8_t *)&v5, 0xCu);
  }

}

- (void)notificationCompletedForIdentifier:(id)a3 collectionID:(id)a4 correlationID:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v9)
    v9 = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[TPSNotificationController remainingCountOfNotificationsUntilOptOut](TPSNotificationController, "remainingCountOfNotificationsUntilOptOut"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DBF2E0];
  if (v12)
  {
    objc_msgSend(v12, "localizedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "eventWithContentID:collectionID:correlationID:remainingNotificationsCount:errorCode:", v9, v10, v11, v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "log");

    objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v12;
      v18 = "Notification error %@";
LABEL_8:
      _os_log_impl(&dword_1DAC2F000, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF2E0], "eventWithContentID:collectionID:correlationID:remainingNotificationsCount:errorCode:", v9, v10, v11, v13, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "log");

    objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v9;
      v18 = "Notification sent for identifier %@";
      goto LABEL_8;
    }
  }

}

@end
