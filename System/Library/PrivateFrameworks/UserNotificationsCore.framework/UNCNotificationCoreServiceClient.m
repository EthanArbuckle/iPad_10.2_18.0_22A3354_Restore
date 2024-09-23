@implementation UNCNotificationCoreServiceClient

- (UNCNotificationCoreServiceClient)init
{
  UNCNotificationCoreServiceClient *v2;
  UNCNotificationCoreServiceClientImpl *v3;
  UNCNotificationCoreServiceClientImpl *client;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UNCNotificationCoreServiceClient;
  v2 = -[UNCNotificationCoreServiceClient init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(UNCNotificationCoreServiceClientImpl);
    client = v2->_client;
    v2->_client = v3;

  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  -[UNCNotificationCoreServiceClientImpl setDelegate:](self->_client, "setDelegate:", a3);
}

- (UNCNotificationCoreServiceClientDelegate)delegate
{
  return -[UNCNotificationCoreServiceClientImpl delegate](self->_client, "delegate");
}

- (void)notificationRepository:(id)a3 didPerformUpdates:(id)a4 forBundleIdentifier:(id)a5
{
  -[UNCNotificationCoreServiceClientImpl notificationRepositoryDidPerformUpdates:forBundleIdentifier:](self->_client, "notificationRepositoryDidPerformUpdates:forBundleIdentifier:", a4, a5);
}

- (void)categoryRepository:(id)a3 didChangeCategoriesForBundleIdentifier:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  v6 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    -[UNCNotificationCoreServiceClient categoryRepository:didChangeCategoriesForBundleIdentifier:].cold.1(v6);
  -[UNCNotificationCoreServiceClientImpl categoryRepositoryDidChangeCategories:](self->_client, "categoryRepositoryDidChangeCategories:", v5);

}

- (id)allBundleIdentifiersForNotifications
{
  return -[UNCNotificationCoreServiceClientImpl allBundleIdentifiersForNotifications](self->_client, "allBundleIdentifiersForNotifications");
}

- (id)notificationRecordsForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    -[UNCNotificationCoreServiceClientImpl notificationRecordsForBundleIdentifier:](self->_client, "notificationRecordsForBundleIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[UNCNotificationCoreServiceClient notificationRecordsForBundleIdentifier:].cold.1(v6);
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

- (id)notificationRecordForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v10 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[UNCNotificationCoreServiceClient notificationRecordForIdentifier:bundleIdentifier:].cold.1(v10);
    goto LABEL_8;
  }
  if (!v7)
  {
    v11 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[UNCNotificationCoreServiceClient notificationRecordForIdentifier:bundleIdentifier:].cold.2(v11);
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  -[UNCNotificationCoreServiceClientImpl notificationRecordForIdentifier:bundleIdentifier:](self->_client, "notificationRecordForIdentifier:bundleIdentifier:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v9;
}

- (void)saveNotificationRecord:(id)a3 targetRevisionNumber:(id)a4 shouldRepost:(BOOL)a5 forBundleIdentifier:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, void *);
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, _QWORD, void *))a7;
  if (!v12)
  {
    v16 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    {
      -[UNCNotificationCoreServiceClient saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:completionHandler:].cold.1(v16);
      if (!v15)
        goto LABEL_11;
    }
    else if (!v15)
    {
      goto LABEL_11;
    }
    v17 = CFSTR("notificationRecord");
LABEL_10:
    _UNCNilArgumentError((uint64_t)"-[UNCNotificationCoreServiceClient saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:completionHandler:]", (uint64_t)v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 0, v19);

    goto LABEL_11;
  }
  if (!v14)
  {
    v18 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    {
      -[UNCNotificationCoreServiceClient saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:completionHandler:].cold.2(v18);
      if (!v15)
        goto LABEL_11;
    }
    else if (!v15)
    {
      goto LABEL_11;
    }
    v17 = CFSTR("bundleIdentifier");
    goto LABEL_10;
  }
  -[UNCNotificationCoreServiceClientImpl save:targetRevisionNumber:shouldRepost:forBundleIdentifier:completionHandler:](self->_client, "save:targetRevisionNumber:shouldRepost:forBundleIdentifier:completionHandler:", v12, v13, v9, v14, v15);
LABEL_11:

}

- (void)saveNotificationRequest:(id)a3 shouldRepost:(BOOL)a4 apsMessageTimestamp:(id)a5 forBundleIdentifier:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v10)
  {
    if (v11)
    {
      if (v12)
      {
        -[UNCNotificationCoreServiceClientImpl save:shouldRepost:apsMessageTimestamp:forBundleIdentifier:](self->_client, "save:shouldRepost:apsMessageTimestamp:forBundleIdentifier:", v10, v8, v11, v12);
      }
      else
      {
        v16 = (void *)*MEMORY[0x24BDF8998];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
          -[UNCNotificationCoreServiceClient saveNotificationRequest:shouldRepost:apsMessageTimestamp:forBundleIdentifier:].cold.3(v16);
      }
    }
    else
    {
      v15 = (void *)*MEMORY[0x24BDF8998];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
        -[UNCNotificationCoreServiceClient saveNotificationRequest:shouldRepost:apsMessageTimestamp:forBundleIdentifier:].cold.2(v15);
    }
  }
  else
  {
    v14 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[UNCNotificationCoreServiceClient saveNotificationRequest:shouldRepost:apsMessageTimestamp:forBundleIdentifier:].cold.1(v14);
  }

}

- (void)removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      -[UNCNotificationCoreServiceClientImpl removeNotificationRecordsForIdentifiersWithIdentifiers:bundleIdentifier:](self->_client, "removeNotificationRecordsForIdentifiersWithIdentifiers:bundleIdentifier:", v6, v7);
    }
    else
    {
      v10 = (void *)*MEMORY[0x24BDF8998];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
        -[UNCNotificationCoreServiceClient removeNotificationRecordsForIdentifiers:bundleIdentifier:].cold.2(v10);
    }
  }
  else
  {
    v9 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[UNCNotificationCoreServiceClient removeNotificationRecordsForIdentifiers:bundleIdentifier:].cold.1(v9);
  }

}

- (void)removeSimilarNotificationRecords:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      -[UNCNotificationCoreServiceClientImpl removeSimilarNotificationRecords:forBundleIdentifier:](self->_client, "removeSimilarNotificationRecords:forBundleIdentifier:", v6, v7);
    }
    else
    {
      v10 = (void *)*MEMORY[0x24BDF8998];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
        -[UNCNotificationCoreServiceClient removeSimilarNotificationRecords:forBundleIdentifier:].cold.2(v10);
    }
  }
  else
  {
    v9 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[UNCNotificationCoreServiceClient removeSimilarNotificationRecords:forBundleIdentifier:].cold.1(v9);
  }

}

- (void)removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    -[UNCNotificationCoreServiceClientImpl removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:](self->_client, "removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:", v4);
  }
  else
  {
    v5 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[UNCNotificationCoreServiceClient removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:].cold.1(v5);
  }

}

- (void)removeInvalidNotificationRecordsForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    -[UNCNotificationCoreServiceClientImpl removeInvalidNotificationRecordsForBundleIdentifier:](self->_client, "removeInvalidNotificationRecordsForBundleIdentifier:", v4);
  }
  else
  {
    v5 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[UNCNotificationCoreServiceClient removeInvalidNotificationRecordsForBundleIdentifier:].cold.1(v5);
  }

}

- (void)removeAllNotificationRecordsForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    -[UNCNotificationCoreServiceClientImpl removeAllNotificationRecordsForBundleIdentifier:](self->_client, "removeAllNotificationRecordsForBundleIdentifier:", v4);
  }
  else
  {
    v5 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[UNCNotificationCoreServiceClient removeAllNotificationRecordsForBundleIdentifier:].cold.1(v5);
  }

}

- (void)removeStoreForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    -[UNCNotificationCoreServiceClientImpl removeStoreForBundleIdentifier:](self->_client, "removeStoreForBundleIdentifier:", v4);
  }
  else
  {
    v5 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[UNCNotificationCoreServiceClient removeStoreForBundleIdentifier:].cold.1(v5);
  }

}

- (id)badgeNumberForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    -[UNCNotificationCoreServiceClientImpl badgeNumberForBundleIdentifier:](self->_client, "badgeNumberForBundleIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[UNCNotificationCoreServiceClient badgeNumberForBundleIdentifier:].cold.1(v6);
    v5 = 0;
  }

  return v5;
}

- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (!v9)
  {
    v11 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    {
      -[UNCNotificationCoreServiceClient setBadgeNumber:forBundleIdentifier:completionHandler:].cold.1(v11);
      if (!v10)
        goto LABEL_6;
    }
    else if (!v10)
    {
      goto LABEL_6;
    }
    _UNCNilArgumentError((uint64_t)"-[UNCNotificationCoreServiceClient setBadgeNumber:forBundleIdentifier:completionHandler:]", (uint64_t)CFSTR("bundleIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v12);

    goto LABEL_6;
  }
  -[UNCNotificationCoreServiceClientImpl setBadgeNumber:forBundleIdentifier:completionHandler:](self->_client, "setBadgeNumber:forBundleIdentifier:completionHandler:", v8, v9, v10);
LABEL_6:

}

- (void)setBadgeCount:(int64_t)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;

  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  if (!v8)
  {
    v10 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    {
      -[UNCNotificationCoreServiceClient setBadgeCount:forBundleIdentifier:completionHandler:].cold.1(v10);
      if (!v9)
        goto LABEL_6;
    }
    else if (!v9)
    {
      goto LABEL_6;
    }
    _UNCNilArgumentError((uint64_t)"-[UNCNotificationCoreServiceClient setBadgeCount:forBundleIdentifier:completionHandler:]", (uint64_t)CFSTR("bundleIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v11);

    goto LABEL_6;
  }
  -[UNCNotificationCoreServiceClientImpl setBadgeCount:forBundleIdentifier:completionHandler:](self->_client, "setBadgeCount:forBundleIdentifier:completionHandler:", a3, v8, v9);
LABEL_6:

}

- (void)setBadgeString:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (!v9)
  {
    v11 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    {
      -[UNCNotificationCoreServiceClient setBadgeString:forBundleIdentifier:completionHandler:].cold.1(v11);
      if (!v10)
        goto LABEL_6;
    }
    else if (!v10)
    {
      goto LABEL_6;
    }
    _UNCNilArgumentError((uint64_t)"-[UNCNotificationCoreServiceClient setBadgeString:forBundleIdentifier:completionHandler:]", (uint64_t)CFSTR("bundleIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v12);

    goto LABEL_6;
  }
  -[UNCNotificationCoreServiceClientImpl setBadgeString:forBundleIdentifier:completionHandler:](self->_client, "setBadgeString:forBundleIdentifier:completionHandler:", v8, v9, v10);
LABEL_6:

}

- (id)allBundleIdentifiersForCategories
{
  return -[UNCNotificationCoreServiceClientImpl allBundleIdentifiersForCategories](self->_client, "allBundleIdentifiersForCategories");
}

- (id)categoryForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v10 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[UNCNotificationCoreServiceClient categoryForIdentifier:bundleIdentifier:].cold.1(v10);
    goto LABEL_8;
  }
  if (!v7)
  {
    v11 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[UNCNotificationCoreServiceClient categoryForIdentifier:bundleIdentifier:].cold.2(v11);
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  -[UNCNotificationCoreServiceClientImpl categoryForIdentifier:bundleIdentifier:](self->_client, "categoryForIdentifier:bundleIdentifier:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v9;
}

- (id)categoriesForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    -[UNCNotificationCoreServiceClientImpl categoriesForBundleIdentifier:](self->_client, "categoriesForBundleIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[UNCNotificationCoreServiceClient categoriesForBundleIdentifier:].cold.1(v6);
    v5 = 0;
  }

  return v5;
}

- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      -[UNCNotificationCoreServiceClientImpl setCategories:forBundleIdentifier:](self->_client, "setCategories:forBundleIdentifier:", v6, v7);
    }
    else
    {
      v10 = (void *)*MEMORY[0x24BDF8998];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
        -[UNCNotificationCoreServiceClient setCategories:forBundleIdentifier:].cold.2(v10);
    }
  }
  else
  {
    v9 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[UNCNotificationCoreServiceClient setCategories:forBundleIdentifier:].cold.1(v9);
  }

}

- (void)categoryRepositoryDidChangeCategoriesForBundleIdentifier:(id)a3
{
  -[UNCNotificationCoreServiceClientImpl categoryRepositoryDidChangeCategories:](self->_client, "categoryRepositoryDidChangeCategories:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)categoryRepository:(os_log_t)log didChangeCategoriesForBundleIdentifier:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2499A5000, log, OS_LOG_TYPE_ERROR, "CoreServiceClient didChangeCategoriesForBundleIdentifier not implemented", v1, 2u);
}

- (void)notificationRecordsForBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient notificationRecordsForBundleIdentifier:]", (uint64_t)CFSTR("bundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)notificationRecordForIdentifier:(void *)a1 bundleIdentifier:.cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient notificationRecordForIdentifier:bundleIdentifier:]", (uint64_t)CFSTR("identifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)notificationRecordForIdentifier:(void *)a1 bundleIdentifier:.cold.2(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient notificationRecordForIdentifier:bundleIdentifier:]", (uint64_t)CFSTR("bundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)saveNotificationRecord:(void *)a1 targetRevisionNumber:shouldRepost:forBundleIdentifier:completionHandler:.cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:completionHandler:]", (uint64_t)CFSTR("notificationRecord"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)saveNotificationRecord:(void *)a1 targetRevisionNumber:shouldRepost:forBundleIdentifier:completionHandler:.cold.2(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:completionHandler:]", (uint64_t)CFSTR("bundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)saveNotificationRequest:(void *)a1 shouldRepost:apsMessageTimestamp:forBundleIdentifier:.cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient saveNotificationRequest:shouldRepost:apsMessageTimestamp:forBundleIdentifier:]", (uint64_t)CFSTR("notificationRequest"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)saveNotificationRequest:(void *)a1 shouldRepost:apsMessageTimestamp:forBundleIdentifier:.cold.2(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient saveNotificationRequest:shouldRepost:apsMessageTimestamp:forBundleIdentifier:]", (uint64_t)CFSTR("apsMessageTimestamp"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)saveNotificationRequest:(void *)a1 shouldRepost:apsMessageTimestamp:forBundleIdentifier:.cold.3(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient saveNotificationRequest:shouldRepost:apsMessageTimestamp:forBundleIdentifier:]", (uint64_t)CFSTR("bundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)removeNotificationRecordsForIdentifiers:(void *)a1 bundleIdentifier:.cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient removeNotificationRecordsForIdentifiers:bundleIdentifier:]", (uint64_t)CFSTR("identifiers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)removeNotificationRecordsForIdentifiers:(void *)a1 bundleIdentifier:.cold.2(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient removeNotificationRecordsForIdentifiers:bundleIdentifier:]", (uint64_t)CFSTR("bundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)removeSimilarNotificationRecords:(void *)a1 forBundleIdentifier:.cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient removeSimilarNotificationRecords:forBundleIdentifier:]", (uint64_t)CFSTR("records"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)removeSimilarNotificationRecords:(void *)a1 forBundleIdentifier:.cold.2(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient removeSimilarNotificationRecords:forBundleIdentifier:]", (uint64_t)CFSTR("bundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:]", (uint64_t)CFSTR("bundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)removeInvalidNotificationRecordsForBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient removeInvalidNotificationRecordsForBundleIdentifier:]", (uint64_t)CFSTR("bundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)removeAllNotificationRecordsForBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient removeAllNotificationRecordsForBundleIdentifier:]", (uint64_t)CFSTR("bundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)removeStoreForBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient removeStoreForBundleIdentifier:]", (uint64_t)CFSTR("bundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)badgeNumberForBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient badgeNumberForBundleIdentifier:]", (uint64_t)CFSTR("bundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)setBadgeNumber:(void *)a1 forBundleIdentifier:completionHandler:.cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient setBadgeNumber:forBundleIdentifier:completionHandler:]", (uint64_t)CFSTR("bundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)setBadgeCount:(void *)a1 forBundleIdentifier:completionHandler:.cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient setBadgeCount:forBundleIdentifier:completionHandler:]", (uint64_t)CFSTR("bundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)setBadgeString:(void *)a1 forBundleIdentifier:completionHandler:.cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient setBadgeString:forBundleIdentifier:completionHandler:]", (uint64_t)CFSTR("bundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)categoryForIdentifier:(void *)a1 bundleIdentifier:.cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient categoryForIdentifier:bundleIdentifier:]", (uint64_t)CFSTR("categoryIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)categoryForIdentifier:(void *)a1 bundleIdentifier:.cold.2(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient categoryForIdentifier:bundleIdentifier:]", (uint64_t)CFSTR("bundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)categoriesForBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient categoriesForBundleIdentifier:]", (uint64_t)CFSTR("bundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)setCategories:(void *)a1 forBundleIdentifier:.cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient setCategories:forBundleIdentifier:]", (uint64_t)CFSTR("categories"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

- (void)setCategories:(void *)a1 forBundleIdentifier:.cold.2(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5(a1);
  _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient setCategories:forBundleIdentifier:]", (uint64_t)CFSTR("bundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_2499A5000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

@end
