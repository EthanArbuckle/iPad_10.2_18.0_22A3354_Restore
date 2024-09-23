@implementation SKIPhoneInvocation

+ (id)announceHomeAnnouncementRequestFromApp:(id)a3 withAnnouncementIdentifier:(id)a4 withUserNotificationType:(int64_t)a5 synchronousBurstIndex:(id)a6
{
  id v9;
  id v10;
  id v11;
  SKIDirectInvocationPayload *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.directInvocation.homeCommunication.announce.notification"));
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("appBundleId"));
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, CFSTR("announcementId"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("notificationType"));

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("synchronousBurstIndex"));
  -[SKIDirectInvocationPayload setUserData:](v12, "setUserData:", v13);
  +[SKIDirectInvocationContext contextForAnnounceNotifications](SKIDirectInvocationContext, "contextForAnnounceNotifications");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)readHomeAnnouncementRequestFromApp:(id)a3
{
  id v3;
  SKIDirectInvocationPayload *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.directInvocation.homeCommunication.read"));
  if (objc_msgSend(v3, "length"))
  {
    v10 = CFSTR("appBundleId");
    v11[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKIDirectInvocationPayload setUserData:](v4, "setUserData:", v5);

  }
  +[SKIDirectInvocationContext contextForCarPlayDirectAction](SKIDirectInvocationContext, "contextForCarPlayDirectAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)announceIncomingCallerRequestForCallUUID:(id)a3 callProviderIdentifier:(id)a4 callProviderBundleId:(id)a5 callerContactIdentifiers:(id)a6 handle:(id)a7 isVideo:(BOOL)a8 isCallerIDBlocked:(BOOL)a9
{
  uint64_t v10;

  LOWORD(v10) = a9;
  return (id)objc_msgSend(a1, "announceIncomingCallerRequestForCallID:callProviderIdentifier:callProviderBundleId:callerContactIdentifiers:handle:isVideo:isCallerIDBlocked:isBobbleCapableAnnouncement:", a3, a4, a5, a6, a7, a8, v10);
}

+ (id)announceIncomingCallerRequestForCallID:(id)a3 callProviderIdentifier:(id)a4 callProviderBundleId:(id)a5 callerContactIdentifiers:(id)a6 handle:(id)a7 isVideo:(BOOL)a8 isCallerIDBlocked:(BOOL)a9 isBobbleCapableAnnouncement:(BOOL)a10
{
  _BOOL8 v10;
  _BOOL8 v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  SKIDirectInvocationPayload *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;

  v10 = a8;
  v15 = a10;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  +[SKIDirectInvocationContext contextForAnnounceNotifications](SKIDirectInvocationContext, "contextForAnnounceNotifications");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.directInvocation.phone.identifyIncomingCaller"));
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 9);
  if (objc_msgSend(v16, "length"))
    objc_msgSend(v22, "setValue:forKey:", v16, CFSTR("callUUID"));
  if (objc_msgSend(v17, "length"))
    objc_msgSend(v22, "setValue:forKey:", v17, CFSTR("callProviderIdentifier"));
  if (objc_msgSend(v18, "length"))
    objc_msgSend(v22, "setValue:forKey:", v18, CFSTR("callProviderBundleId"));
  if (objc_msgSend(v19, "count"))
    objc_msgSend(v22, "setValue:forKey:", v19, CFSTR("callerContactIdentifiers"));
  if (v20)
  {
    objc_msgSend(v20, "value");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setValue:forKey:", v23, CFSTR("handleValue"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v20, "type"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setValue:forKey:", v24, CFSTR("handleType"));

    v15 = a10;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setValue:forKey:", v25, CFSTR("isVideo"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setValue:forKey:", v26, CFSTR("isCallerIDBlocked"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setValue:forKey:", v27, CFSTR("isBobbleCapableAnnouncement"));

  -[SKIDirectInvocationPayload setUserData:](v21, "setUserData:", v22);
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v31, v21);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (id)announceIncomingCallNotificationRequest:(id)a3
{
  id v3;
  void *v4;
  SKIDirectInvocationPayload *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v30;
  id v31;

  v3 = a3;
  +[SKIDirectInvocationContext contextForAnnounceNotifications](SKIDirectInvocationContext, "contextForAnnounceNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.directInvocation.phone.announceIncomingCallNotification"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 8);
  objc_msgSend(v3, "notification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD1618];
    objc_msgSend(v3, "notification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v31);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v31;

    if (v11)
    {
      SKIDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[SKIPhoneInvocation announceIncomingCallNotificationRequest:].cold.2();

    }
    objc_msgSend(v6, "setValue:forKey:", v10, CFSTR("notification"));

  }
  objc_msgSend(v3, "appBundleId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    objc_msgSend(v3, "appBundleId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v15, CFSTR("appBundleId"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "synchronousBurstIndex"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v16, CFSTR("synchronousBurstIndex"));

  objc_msgSend(v3, "appBundleIdOfLastAnnouncement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (v18)
  {
    objc_msgSend(v3, "appBundleIdOfLastAnnouncement");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v19, CFSTR("appBundleIdOfLastAnnouncement"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "isSameTypeAsLastAnnouncement"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v20, CFSTR("isSameTypeAsLastAnnouncement"));

  v21 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "timeSinceLastAnnouncement");
  objc_msgSend(v21, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v22, CFSTR("timeSinceLastAnnouncement"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "announcementPlatform"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v23, CFSTR("announcePlatform"));

  v30 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v30;
  if (v24)
  {
    objc_msgSend(v6, "setValue:forKey:", v24, CFSTR("announcePayload"));
  }
  else
  {
    SKIDefaultLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      +[SKIPhoneInvocation announceIncomingCallNotificationRequest:].cold.1();

  }
  -[SKIDirectInvocationPayload setUserData:](v5, "setUserData:", v6);
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v4, v5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)startPhoneCallRequestFromApp:(id)a3
{
  id v3;
  SKIDirectInvocationPayload *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.directInvocation.phone.startPhoneCall"));
  if (objc_msgSend(v3, "length"))
  {
    v10 = CFSTR("appBundleId");
    v11[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKIDirectInvocationPayload setUserData:](v4, "setUserData:", v5);

  }
  +[SKIDirectInvocationContext contextForCarPlayDirectAction](SKIDirectInvocationContext, "contextForCarPlayDirectAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)announceVoicemailRequestForAnnounceDirectInvocationPayload:(id)a3
{
  id v3;
  SKIDirectInvocationPayload *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v3 = a3;
  +[SKIDirectInvocationContext contextForAnnounceNotifications](SKIDirectInvocationContext, "contextForAnnounceNotifications");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.directInvocation.phone.announceVoicemail"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 9);
  objc_msgSend(v3, "notification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = v8;
  objc_msgSend(v8, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKey:", CFSTR("VMVoicemailIdentifier"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(v5, "setValue:forKey:", v10, CFSTR("VMVoicemailIdentifier"));
  objc_msgSend(v9, "valueForKey:", CFSTR("MessageIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
    objc_msgSend(v5, "setValue:forKey:", v11, CFSTR("MessageIdentifier"));
  v27 = v11;
  v28 = (void *)v10;
  objc_msgSend(v9, "valueForKey:", CFSTR("contactInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
    objc_msgSend(v5, "setValue:forKey:", v12, CFSTR("contactInfo"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "synchronousBurstIndex"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v13, CFSTR("synchronousBurstIndex"));

  objc_msgSend(v3, "appBundleIdOfLastAnnouncement");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    objc_msgSend(v3, "appBundleIdOfLastAnnouncement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v16, CFSTR("appBundleIdOfLastAnnouncement"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "isSameTypeAsLastAnnouncement"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v17, CFSTR("isSameTypeAsLastAnnouncement"));

  v18 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "timeSinceLastAnnouncement");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v19, CFSTR("timeSinceLastAnnouncement"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "announcementPlatform"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v20, CFSTR("announcePlatform"));

  v31 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v31;
  if (v21)
  {
    objc_msgSend(v5, "setValue:forKey:", v21, CFSTR("announcePayload"));
  }
  else
  {
    SKIDefaultLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      +[SKIPhoneInvocation announceIncomingCallNotificationRequest:].cold.1();

  }
  -[SKIDirectInvocationPayload setUserData:](v4, "setUserData:", v5);
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v30, v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)announceGroupFaceTimeRequestForAnnounceDirectInvocationPayload:(id)a3
{
  id v3;
  uint64_t v4;
  SKIDirectInvocationPayload *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  v3 = a3;
  +[SKIDirectInvocationContext contextForAnnounceNotifications](SKIDirectInvocationContext, "contextForAnnounceNotifications");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.directInvocation.phone.announceGroupFaceTimeInvite"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 11);
  objc_msgSend(v3, "notification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKey:", CFSTR("remoteParticipantHandles"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
    objc_msgSend(v6, "setValue:forKey:", v11, CFSTR("remoteParticipantHandles"));
  v37 = v10;
  objc_msgSend(v10, "valueForKey:", CFSTR("activeParticipantHandles"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
    objc_msgSend(v6, "setValue:forKey:", v12, CFSTR("activeParticipantHandles"));
  v36 = v12;
  objc_msgSend(v9, "defaultActionURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "length"))
    objc_msgSend(v6, "setValue:forKey:", v14, CFSTR("defaultActionURL"));
  objc_msgSend(v9, "subtitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
    objc_msgSend(v6, "setValue:forKey:", v15, CFSTR("subtitle"));
  v35 = v14;
  v38 = v9;
  v39 = v8;
  objc_msgSend(v8, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length"))
    objc_msgSend(v6, "setValue:forKey:", v16, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "synchronousBurstIndex"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v17, CFSTR("synchronousBurstIndex"));

  objc_msgSend(v3, "appBundleIdOfLastAnnouncement");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (v19)
  {
    objc_msgSend(v3, "appBundleIdOfLastAnnouncement");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v20, CFSTR("appBundleIdOfLastAnnouncement"));

  }
  v34 = v16;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "isSameTypeAsLastAnnouncement"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v21, CFSTR("isSameTypeAsLastAnnouncement"));

  v22 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "timeSinceLastAnnouncement");
  objc_msgSend(v22, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v23, CFSTR("timeSinceLastAnnouncement"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "announcementPlatform"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v24, CFSTR("announcePlatform"));

  v40 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v40);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v40;
  v27 = v15;
  if (v25)
  {
    v28 = v11;
    objc_msgSend(v6, "setValue:forKey:", v25, CFSTR("announcePayload"));
  }
  else
  {
    SKIDefaultLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      +[SKIPhoneInvocation announceGroupFaceTimeRequestForAnnounceDirectInvocationPayload:].cold.1();
    v28 = v11;

  }
  -[SKIDirectInvocationPayload setUserData:](v5, "setUserData:", v6);
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v4, v5);
  v30 = (void *)v4;
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

+ (id)announceDropInCallForType:(int64_t)a3
{
  SKIDirectInvocationPayload *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.directInvocation.phone.announceCallBell"));
  if (a3)
  {
    v11 = CFSTR("announcementType");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKIDirectInvocationPayload setUserData:](v4, "setUserData:", v6);

  }
  +[SKIDirectInvocationContext contextForAnnounceNotifications](SKIDirectInvocationContext, "contextForAnnounceNotifications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)announcePayloadFromUserData:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("announcePayload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (!v4)
  {
    SKIDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[SKIPhoneInvocation announcePayloadFromUserData:].cold.1();

  }
  return v4;
}

+ (void)announceIncomingCallNotificationRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_212490000, v0, v1, "error archiving SKIAnnounceNotificationDirectInvocationPayload for SKIPhoneInvocation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)announceIncomingCallNotificationRequest:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_212490000, v0, v1, "Error archiving UNNotification %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)announceGroupFaceTimeRequestForAnnounceDirectInvocationPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_212490000, v0, v1, "error archving SKIAnnounceNotificationDirectInvocationPayload for SKIPhoneInvocation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)announcePayloadFromUserData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_212490000, v0, v1, "error unarchiving SKIAnnounceNotificationDirectInvocationPayload from userData for SKIPhoneInvocation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
