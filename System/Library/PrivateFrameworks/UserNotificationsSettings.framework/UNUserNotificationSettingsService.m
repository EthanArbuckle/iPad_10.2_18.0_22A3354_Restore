@implementation UNUserNotificationSettingsService

+ (id)clientInterface
{
  if (clientInterface_onceToken != -1)
    dispatch_once(&clientInterface_onceToken, &__block_literal_global_0);
  return (id)clientInterface___interface;
}

void __52__UNUserNotificationSettingsService_clientInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254628880);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)clientInterface___interface;
  clientInterface___interface = v0;

  v2 = (void *)clientInterface___interface;
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_updateNotificationSourcesWithBundleIdentifiers_, 0, 0);

  v6 = (void *)clientInterface___interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_updateNotificationSystemSettings_, 0, 0);

}

+ (id)serverInterface
{
  if (serverInterface_onceToken != -1)
    dispatch_once(&serverInterface_onceToken, &__block_literal_global_51);
  return (id)serverInterface___interface;
}

void __52__UNUserNotificationSettingsService_serverInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
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
  void *v34;
  void *v35;
  void *v36;
  id v37;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254628ED0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serverInterface___interface;
  serverInterface___interface = v0;

  v2 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_getNotificationSource_withCompletionHandler_, 0, 0);

  v4 = (void *)serverInterface___interface;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_getNotificationSource_withCompletionHandler_, 0, 1);

  v8 = (void *)serverInterface___interface;
  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_getNotificationSources_withCompletionHandler_, 0, 0);

  v12 = (void *)serverInterface___interface;
  v13 = (void *)MEMORY[0x24BDBCF20];
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_getNotificationSources_withCompletionHandler_, 0, 1);

  v17 = (void *)serverInterface___interface;
  v18 = (void *)MEMORY[0x24BDBCF20];
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_getAllNotificationSourcesWithCompletionHandler_, 0, 1);

  v22 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_authorizationWithOptions_forNotificationSourceIdentifier_withCompletionHandler_, 1, 0);

  v24 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_replaceNotificationSettings_forNotificationSourceIdentifier_, 0, 0);

  v26 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_replaceNotificationSettings_forNotificationSourceIdentifier_, 1, 0);

  v28 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_replaceNotificationTopicSettings_forNotificationSourceIdentifier_topicIdentifier_, 0, 0);

  v30 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_replaceNotificationTopicSettings_forNotificationSourceIdentifier_topicIdentifier_, 1, 0);

  v32 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_replaceNotificationTopicSettings_forNotificationSourceIdentifier_topicIdentifier_, 2, 0);

  v34 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_getNotificationSystemSettingsWithCompletionHandler_, 0, 1);

  v36 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_setNotificationSystemSettings_, 0, 0);

}

@end
