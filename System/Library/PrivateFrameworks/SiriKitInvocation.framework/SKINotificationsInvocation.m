@implementation SKINotificationsInvocation

+ (id)announceNotificationsRequestFromAnnounceDirectInvocationPayload:(id)a3
{
  id v3;
  void *v4;
  SKIDirectInvocationPayload *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v45;

  v3 = a3;
  +[SKIDirectInvocationContext contextForAnnounceNotifications](SKIDirectInvocationContext, "contextForAnnounceNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.directInvocation.notifications.announceNotification"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 10);
  objc_msgSend(v3, "appBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    objc_msgSend(v3, "appBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v9, CFSTR("appBundleId"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "synchronousBurstIndex"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v10, CFSTR("synchronousBurstIndex"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "isMediaPlaying"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v11, CFSTR("isMediaPlaying"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "isSameTypeAsLastAnnouncement"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v12, CFSTR("isSameTypeAsLastAnnouncement"));

  objc_msgSend(v3, "notification");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "content");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v17)
  {
    objc_msgSend(v14, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v18, CFSTR("notificationId"));

  }
  objc_msgSend(v3, "notification");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v3, "notification");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v22, CFSTR("notificationDate"));

  }
  objc_msgSend(v15, "title");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v15, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v24, CFSTR("notificationTitle"));

  }
  objc_msgSend(v15, "subtitle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v15, "subtitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v26, CFSTR("notificationSubtitle"));

  }
  objc_msgSend(v15, "body");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v15, "body");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v28, CFSTR("notificationBody"));

  }
  objc_msgSend(v15, "threadIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v15, "threadIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v30, CFSTR("notificationThreadId"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v15, "interruptionLevel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v31, CFSTR("interruptionLevel"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "announcementPlatform"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v32, CFSTR("announcePlatform"));

  v45 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v45);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v45;
  if (v33)
  {
    objc_msgSend(v6, "setValue:forKey:", v33, CFSTR("announcePayload"));
  }
  else
  {
    SKIDefaultLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      +[SKINotificationsInvocation announceNotificationsRequestFromAnnounceDirectInvocationPayload:].cold.1((uint64_t)v34, v35, v36, v37, v38, v39, v40, v41);

  }
  -[SKIDirectInvocationPayload setUserData:](v5, "setUserData:", v6);
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v4, v5);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

+ (id)announcePayloadFromUserData:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("announcePayload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  if (!v4)
  {
    SKIDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[SKINotificationsInvocation announceNotificationsRequestFromAnnounceDirectInvocationPayload:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

+ (void)announceNotificationsRequestFromAnnounceDirectInvocationPayload:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_212490000, a2, a3, "error unarchiving SKIAnnounceNotificationDirectInvocationPayload from userData for SKINotificationsInvocation: %@", a5, a6, a7, a8, 2u);
}

@end
