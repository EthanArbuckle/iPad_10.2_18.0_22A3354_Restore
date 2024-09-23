@implementation SKIMessagesInvocation

+ (id)announceMessagesRequestFromAnnounceDirectInvocationPayload:(id)a3
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
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v26;

  v3 = a3;
  +[SKIDirectInvocationContext contextForAnnounceNotifications](SKIDirectInvocationContext, "contextForAnnounceNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.DirectInvocation.Messages.AnnounceMessage"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 4);
  objc_msgSend(v3, "notificationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("notificationIdentifier"));
  objc_msgSend(v3, "appBundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    objc_msgSend(v3, "appBundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v10, CFSTR("appBundleId"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "synchronousBurstIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v11, CFSTR("synchronousBurstIndex"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "isMediaPlaying"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v12, CFSTR("isMediaPlaying"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "announcementPlatform"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v13, CFSTR("announcePlatform"));

  v26 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v26;
  if (v14)
  {
    objc_msgSend(v6, "setValue:forKey:", v14, CFSTR("announcePayload"));
  }
  else
  {
    SKIDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[SKIMessagesInvocation announceMessagesRequestFromAnnounceDirectInvocationPayload:].cold.1((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);

  }
  -[SKIDirectInvocationPayload setUserData:](v5, "setUserData:", v6);
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v4, v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
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
      +[SKIMessagesInvocation announcePayloadFromUserData:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

+ (id)readMessagesRequestFromNotificationIdentifier:(id)a3 fromApp:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  SKIDirectInvocationPayload *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  +[SKIDirectInvocationContext contextForCarPlayDirectAction](SKIDirectInvocationContext, "contextForCarPlayDirectAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v8, "setValue:forKey:", v5, CFSTR("notificationIdentifier"));
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v8, "setValue:forKey:", v6, CFSTR("appBundleId"));
  v9 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.DirectInvocation.Messages.ReadFromNotification"));
  -[SKIDirectInvocationPayload setUserData:](v9, "setUserData:", v8);
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)readMessagesRequestFromConversationIdentifier:(id)a3 inApp:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  SKIDirectInvocationPayload *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  +[SKIDirectInvocationContext contextForCarPlayDirectAction](SKIDirectInvocationContext, "contextForCarPlayDirectAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v8, "setValue:forKey:", v5, CFSTR("conversationIdentifier"));
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v8, "setValue:forKey:", v6, CFSTR("appBundleId"));
  v9 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.DirectInvocation.Messages.ReadFromConversation"));
  -[SKIDirectInvocationPayload setUserData:](v9, "setUserData:", v8);
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)composeNewMessageRequestInApp:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  SKIDirectInvocationPayload *v6;
  void *v7;
  void *v8;

  v3 = a3;
  +[SKIDirectInvocationContext contextForCarPlayDirectAction](SKIDirectInvocationContext, "contextForCarPlayDirectAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
  if (objc_msgSend(v3, "length"))
    objc_msgSend(v5, "setValue:forKey:", v3, CFSTR("appBundleId"));
  v6 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.DirectInvocation.Messages.NewMessage"));
  -[SKIDirectInvocationPayload setUserData:](v6, "setUserData:", v5);
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)composeNewMessageRequestToContact:(id)a3 phoneNumber:(id)a4 emailAddress:(id)a5 inApp:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  SKIDirectInvocationPayload *v15;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  +[SKIDirectInvocationContext contextForCarPlayDirectAction](SKIDirectInvocationContext, "contextForCarPlayDirectAction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 4);
  if (objc_msgSend(v12, "length"))
    objc_msgSend(v14, "setValue:forKey:", v12, CFSTR("appBundleId"));
  if (objc_msgSend(v9, "length"))
    objc_msgSend(v14, "setValue:forKey:", v9, CFSTR("contactName"));
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v14, "setValue:forKey:", v10, CFSTR("contactPhoneNumber"));
  if (objc_msgSend(v11, "length"))
    objc_msgSend(v14, "setValue:forKey:", v11, CFSTR("contactEmailAddress"));
  v15 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.DirectInvocation.Messages.NewMessageToContact"));
  -[SKIDirectInvocationPayload setUserData:](v15, "setUserData:", v14);
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)composeReplyRequestToConversationIdentifier:(id)a3 inApp:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  SKIDirectInvocationPayload *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  +[SKIDirectInvocationContext contextForCarPlayDirectAction](SKIDirectInvocationContext, "contextForCarPlayDirectAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v8, "setValue:forKey:", v5, CFSTR("conversationIdentifier"));
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v8, "setValue:forKey:", v6, CFSTR("appBundleId"));
  v9 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.DirectInvocation.Messages.NewMessageToConversation"));
  -[SKIDirectInvocationPayload setUserData:](v9, "setUserData:", v8);
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)updateMessageContentFromInteractiveSnippet:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  SKIDirectInvocationPayload *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  v7 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.directInvocation.messages.MessageContentChangedViaSnippet"));
  v12 = CFSTR("content");
  v13[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKIDirectInvocationPayload setUserData:](v7, "setUserData:", v8);

  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)sendMessageFromInteractiveSnippetWithUpdatedContent:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  SKIDirectInvocationPayload *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  v7 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.directInvocation.messages.MessageSendViaSnippet"));
  v12 = CFSTR("content");
  v13[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKIDirectInvocationPayload setUserData:](v7, "setUserData:", v8);

  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)beginSiriRequestForApp:(id)a3
{
  id v3;
  SKIMessagesGatekeeperPayload *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = -[SKIMessagesGatekeeperPayload initWithAppBundleId:]([SKIMessagesGatekeeperPayload alloc], "initWithAppBundleId:", v3);

  -[SKIMessagesGatekeeperPayload invocationPayload](v4, "invocationPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[SKIDirectInvocationContext contextForCarPlayDirectAction](SKIDirectInvocationContext, "contextForCarPlayDirectAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)makeParameterMetadataForIntent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[SKIMessagesInvocation makeParameterMetadataForParameterNamed:](SKIMessagesInvocation, "makeParameterMetadataForParameterNamed:", CFSTR("recipient"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    +[SKIMessagesInvocation makeParameterMetadataForParameterNamed:](SKIMessagesInvocation, "makeParameterMetadataForParameterNamed:", CFSTR("speakableGroupName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v5;
    +[SKIMessagesInvocation makeParameterMetadataForParameterNamed:](SKIMessagesInvocation, "makeParameterMetadataForParameterNamed:", CFSTR("outgoingMessageType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v6;
    +[SKIMessagesInvocation makeParameterMetadataForParameterNamed:](SKIMessagesInvocation, "makeParameterMetadataForParameterNamed:", CFSTR("content"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[3] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = (void *)MEMORY[0x24BDBD1A8];
      goto LABEL_7;
    }
    +[SKIMessagesInvocation makeParameterMetadataForParameterNamed:](SKIMessagesInvocation, "makeParameterMetadataForParameterNamed:", CFSTR("recipient"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKIMessagesInvocation makeParameterMetadataForParameterNamed:](SKIMessagesInvocation, "makeParameterMetadataForParameterNamed:", CFSTR("speakableGroupName"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v5;
    +[SKIMessagesInvocation makeParameterMetadataForParameterNamed:](SKIMessagesInvocation, "makeParameterMetadataForParameterNamed:", CFSTR("sender"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v6;
    +[SKIMessagesInvocation makeParameterMetadataForParameterNamed:](SKIMessagesInvocation, "makeParameterMetadataForParameterNamed:", CFSTR("attribute"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v7;
    +[SKIMessagesInvocation makeParameterMetadataForParameterNamed:](SKIMessagesInvocation, "makeParameterMetadataForParameterNamed:", CFSTR("dateTimeRange"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[4] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:

  return v8;
}

+ (id)makeParameterMetadataForParameterNamed:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x24BE813B8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setParameterName:", v4);

  objc_msgSend(v5, "setShouldResolve:", 1);
  return v5;
}

+ (void)announceMessagesRequestFromAnnounceDirectInvocationPayload:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_212490000, a2, a3, "error archiving SKIAnnounceNotificationDirectInvocationPayload for SKIMessagesInvocation: %@", a5, a6, a7, a8, 2u);
}

+ (void)announcePayloadFromUserData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_212490000, a2, a3, "error unarchiving SKIAnnounceNotificationDirectInvocationPayload from userData for SKIMessagesInvocation: %@", a5, a6, a7, a8, 2u);
}

@end
