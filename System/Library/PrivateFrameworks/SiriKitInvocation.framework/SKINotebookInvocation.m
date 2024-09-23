@implementation SKINotebookInvocation

+ (id)announceRemindersRequestFromAnnounceDirectInvocationPayload:(id)a3
{
  id v3;
  void *v4;
  SKIDirectInvocationPayload *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a3;
  +[SKIDirectInvocationContext contextForAnnounceNotifications](SKIDirectInvocationContext, "contextForAnnounceNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.directInvocation.notebook.announceReminder"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 8);
  objc_msgSend(v3, "notificationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("notificationIdentifer"));
  objc_msgSend(v3, "appBundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    objc_msgSend(v3, "appBundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v10, CFSTR("appBundleId"));

  }
  objc_msgSend(v3, "appBundleIdOfLastAnnouncement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    objc_msgSend(v3, "appBundleIdOfLastAnnouncement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v13, CFSTR("appBundleIdOfLastAnnouncement"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "synchronousBurstIndex"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v14, CFSTR("burstIndex"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "isSameTypeAsLastAnnouncement"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v15, CFSTR("isSameTypeAsLastAnnouncement"));

  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "timeSinceLastAnnouncement");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v17, CFSTR("timeSinceLastAnnouncement"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "announcementPlatform"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v18, CFSTR("announcePlatform"));

  -[SKIDirectInvocationPayload setUserData:](v5, "setUserData:", v6);
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v4, v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
