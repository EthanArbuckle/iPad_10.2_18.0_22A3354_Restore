@implementation RTTGenerateUserNotificationForContact

void __RTTGenerateUserNotificationForContact_block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  id v28;
  __int128 buf;
  void *v30;
  void *v31;
  uint64_t *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  v4 = *(id *)(a1 + 32);
  v5 = v1;
  v6 = v2;
  v7 = v3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v8 = (void *)getUNMutableNotificationContentClass_softClass;
  v26 = getUNMutableNotificationContentClass_softClass;
  if (!getUNMutableNotificationContentClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v30 = __getUNMutableNotificationContentClass_block_invoke;
    v31 = &unk_24D203C78;
    v32 = &v23;
    __getUNMutableNotificationContentClass_block_invoke((uint64_t)&buf);
    v8 = (void *)v24[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v23, 8);
  v10 = (void *)objc_opt_new();
  objc_msgSend(v6, "text", v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBody:", v11);

  objc_msgSend(v10, "setCategoryIdentifier:", CFSTR("com.apple.RTTNotifications.message"));
  objc_msgSend(v10, "setTitle:", v4);
  objc_msgSend(v10, "setThreadIdentifier:", v7);
  objc_msgSend(MEMORY[0x24BDBCF48], "faceTimeShowInCallUIURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDefaultActionURL:", v12);

  objc_msgSend(v10, "setShouldSuppressDefaultAction:", 0);
  objc_msgSend(v10, "setShouldAuthenticateDefaultAction:", 0);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateByAddingTimeInterval:", 3600.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setExpirationDate:", v14);

  v27 = CFSTR("CallUID");
  v28 = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInfo:", v15);

  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v16 = (void *)getUNNotificationRequestClass_softClass;
  v26 = getUNNotificationRequestClass_softClass;
  if (!getUNNotificationRequestClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v30 = __getUNNotificationRequestClass_block_invoke;
    v31 = &unk_24D203C78;
    v32 = &v23;
    __getUNNotificationRequestClass_block_invoke((uint64_t)&buf);
    v16 = (void *)v24[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v23, 8);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID", v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "requestWithIdentifier:content:trigger:", v19, v10, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogRTT();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v20;
    _os_log_impl(&dword_21473C000, v21, OS_LOG_TYPE_INFO, "Posting local notification: %@", (uint8_t *)&buf, 0xCu);
  }

  RTTNotificationCenter();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addNotificationRequest:withCompletionHandler:", v20, &__block_literal_global_26);

}

@end
