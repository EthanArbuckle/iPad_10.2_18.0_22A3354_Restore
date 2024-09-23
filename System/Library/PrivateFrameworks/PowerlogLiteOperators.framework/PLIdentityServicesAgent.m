@implementation PLIdentityServicesAgent

+ (void)load
{
  objc_msgSend(MEMORY[0x1E0D7FF90], "registerOperator:", objc_opt_class());
}

+ (id)entryEventForwardDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("LocalLinkType");
  +[PLIdentityServicesAgent entryDefinitionLocalLink](PLIdentityServicesAgent, "entryDefinitionLocalLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("LocalInfraWiFiRequests");
  +[PLIdentityServicesAgent entryDefinitionLocalInfraWiFiRequests](PLIdentityServicesAgent, "entryDefinitionLocalInfraWiFiRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("CloudMessaging");
  +[PLIdentityServicesAgent entryDefinitionCloudMessaging](PLIdentityServicesAgent, "entryDefinitionCloudMessaging");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("Session");
  +[PLIdentityServicesAgent entryDefinitionSession](PLIdentityServicesAgent, "entryDefinitionSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryDefinitionLocalLink
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1E8652D80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("linkType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryDefinitionCloudMessaging
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8652D90;
  v12[1] = MEMORY[0x1E0C9AAA0];
  v11[2] = *MEMORY[0x1E0D80330];
  v12[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("IDSClientBringsUpCloudMessaging");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryDefinitionSession
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8652D90;
  v18[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("isInitiator");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("serviceName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat_withBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("sessionID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventIntervalDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("IDSMessagePeriodic");
  +[PLIdentityServicesAgent entryDefinitionIDSMessageStats](PLIdentityServicesAgent, "entryDefinitionIDSMessageStats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("IDSSocketPeriodic");
  v7[0] = v2;
  +[PLIdentityServicesAgent entryDefinitionIDSSocketStats](PLIdentityServicesAgent, "entryDefinitionIDSSocketStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)entryDefinitionIDSMessageStats
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[8];
  _QWORD v23[8];
  uint64_t v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[4];

  v27[2] = *MEMORY[0x1E0C80C00];
  v26[0] = *MEMORY[0x1E0D80298];
  v24 = *MEMORY[0x1E0D80318];
  v25 = &unk_1E8652DA0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  v26[1] = *MEMORY[0x1E0D802F0];
  v22[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_DateFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  v22[1] = CFSTR("topic");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_StringFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  v22[2] = CFSTR("priority");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_StringFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v15;
  v22[3] = CFSTR("OutgoingBytes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v13;
  v22[4] = CFSTR("IncomingBytes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v3;
  v22[5] = CFSTR("OutgoingMessages");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v5;
  v22[6] = CFSTR("IncomingMessages");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v7;
  v22[7] = CFSTR("LinkType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryDefinitionIDSSocketStats
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[6];
  uint64_t v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[4];

  v23[2] = *MEMORY[0x1E0C80C00];
  v22[0] = *MEMORY[0x1E0D80298];
  v20 = *MEMORY[0x1E0D80318];
  v21 = &unk_1E8652D90;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E0D802F0];
  v18[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_DateFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v18[1] = CFSTR("topic");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_StringFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  v18[2] = CFSTR("OutgoingBytes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v3;
  v18[3] = CFSTR("IncomingBytes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v5;
  v18[4] = CFSTR("OutgoingPackets");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v7;
  v18[5] = CFSTR("IncomingPackets");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryDefinitionLocalInfraWiFiRequests
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  uint64_t v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v13 = *MEMORY[0x1E0D80318];
  v14 = &unk_1E8652DA0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v2;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("requestingServices");
  v9 = *MEMORY[0x1E0D80358];
  v10 = &unk_1E86330A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("reason");
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = *MEMORY[0x1E0D80260];
  v16[1] = v6;
  v16[2] = &unk_1E864FEC8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("IDSLocalMessage");
  objc_msgSend(a1, "entryEventPointDefinitionIDSLocalMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("IDSLinkPreferenceRequest");
  objc_msgSend(a1, "entryEventPointDefinitionIDSLinkPreferenceRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("IDSOutgoingPushSent");
  objc_msgSend(a1, "entryEventPointDefinitionIDSOutgoingPushSent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("IDSIncomingPushReceived");
  objc_msgSend(a1, "entryEventPointDefinitionIDSIncomingPushReceived");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionIDSLocalMessage
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _QWORD v13[4];
  _QWORD v14[4];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80268];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8652DB0;
  v14[1] = MEMORY[0x1E0C9AAB0];
  v3 = *MEMORY[0x1E0D80270];
  v13[2] = *MEMORY[0x1E0D80278];
  v13[3] = v3;
  v14[2] = &unk_1E86330C0;
  v14[3] = &unk_1E86330C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11 = CFSTR("IDSDeviceDidWakeHintTopic");
  v9 = *MEMORY[0x1E0D80358];
  v10 = &unk_1E86330D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionIDSLinkPreferenceRequest
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0D80298];
  v12 = *MEMORY[0x1E0D80318];
  v13 = &unk_1E8652D90;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("InputBytesPerSecond");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("ServiceName");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventPointDefinitionIDSOutgoingPushSent
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v15[0] = *MEMORY[0x1E0D80318];
  v15[1] = v2;
  v16[0] = &unk_1E8652D80;
  v16[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("CommandContext");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("CommandID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("Topic");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat_withBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitionIDSIncomingPushReceived
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v15[0] = *MEMORY[0x1E0D80318];
  v15[1] = v2;
  v16[0] = &unk_1E8652D80;
  v16[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("CommandContext");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("CommandID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("Topic");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat_withBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (PLIdentityServicesAgent)init
{
  PLIdentityServicesAgent *v2;
  uint64_t v3;
  NSDate *initialEntryDate;
  NSDate *lastLocalDeliveryLogDate;
  uint64_t v6;
  NSMutableDictionary *previousStatsByPriority;
  uint64_t v8;
  NSMutableDictionary *lastEntryDatePerCategory;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLIdentityServicesAgent;
  v2 = -[PLAgent init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v3 = objc_claimAutoreleasedReturnValue();
    initialEntryDate = v2->_initialEntryDate;
    v2->_initialEntryDate = (NSDate *)v3;

    lastLocalDeliveryLogDate = v2->_lastLocalDeliveryLogDate;
    v2->_lastLocalDeliveryLogDate = 0;

    v6 = objc_opt_new();
    previousStatsByPriority = v2->_previousStatsByPriority;
    v2->_previousStatsByPriority = (NSMutableDictionary *)v6;

    v8 = objc_opt_new();
    lastEntryDatePerCategory = v2->_lastEntryDatePerCategory;
    v2->_lastEntryDatePerCategory = (NSMutableDictionary *)v8;

  }
  return v2;
}

- (void)setCurrentLinkType
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PLIdentityServicesAgent_setCurrentLinkType__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1ED883040 != -1)
      dispatch_once(&qword_1ED883040, block);
    if (_MergedGlobals_1_26)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setCurrentLinkType:: setting current linktype"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIdentityServicesAgent setCurrentLinkType]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 361);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getActivePairedDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceIDForNRDevice:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v13 = objc_opt_class();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __45__PLIdentityServicesAgent_setCurrentLinkType__block_invoke_105;
      v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v37[4] = v13;
      if (qword_1ED883048 != -1)
        dispatch_once(&qword_1ED883048, v37);
      if (byte_1ED883021)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setCurrentLinkType:: initialized companionPeerIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIdentityServicesAgent setCurrentLinkType]");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 374);

        PLLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v14;
          _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v20 = objc_msgSend(MEMORY[0x1E0D51A98], "newDeviceIdentifierWithBluetoothUUID:", v12);
    if (!v20)
    {
      PLLogCommon();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v12;
        v33 = "setCurrentLinkType:: Failed to create NRDeviceIdentifier for bluetooth UUID %@";
        v34 = v32;
        v35 = 12;
        goto LABEL_33;
      }
LABEL_30:

      goto LABEL_31;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v21 = objc_opt_class();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __45__PLIdentityServicesAgent_setCurrentLinkType__block_invoke_111;
      v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v36[4] = v21;
      if (qword_1ED883050 != -1)
        dispatch_once(&qword_1ED883050, v36);
      if (byte_1ED883022)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setCurrentLinkType:: initialized networkRelayIdentifier"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "lastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIdentityServicesAgent setCurrentLinkType]");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 377);

        PLLogCommon();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v22;
          _os_log_debug_impl(&dword_1CAF47000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v28 = objc_alloc(MEMORY[0x1E0D51AA0]);
    -[PLOperator workQueue](self, "workQueue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithDeviceIdentifier:delegate:queue:", v20, self, v29);
    -[PLIdentityServicesAgent setNrdm:](self, "setNrdm:", v30);

    -[PLIdentityServicesAgent nrdm](self, "nrdm");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
      PLLogCommon();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v33 = "setCurrentLinkType:: NRDeviceMonitor init failed";
        v34 = v32;
        v35 = 2;
LABEL_33:
        _os_log_debug_impl(&dword_1CAF47000, v34, OS_LOG_TYPE_DEBUG, v33, buf, v35);
        goto LABEL_30;
      }
      goto LABEL_30;
    }
  }
  else
  {
    PLLogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v11;
      _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "setCurrentLinkType:: No bluetooth ID from active device %@", buf, 0xCu);
    }
  }
LABEL_31:

}

uint64_t __45__PLIdentityServicesAgent_setCurrentLinkType__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_26 = result;
  return result;
}

uint64_t __45__PLIdentityServicesAgent_setCurrentLinkType__block_invoke_105(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883021 = result;
  return result;
}

uint64_t __45__PLIdentityServicesAgent_setCurrentLinkType__block_invoke_111(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883022 = result;
  return result;
}

- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4
{
  uint64_t v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  uint64_t v30;
  uint64_t block;
  uint64_t v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v4 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled", a3))
  {
    v6 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = __60__PLIdentityServicesAgent_deviceLinkTypeDidChange_linkType___block_invoke;
    v34 = &__block_descriptor_40_e5_v8__0lu32l8;
    v35 = v6;
    if (qword_1ED883058 != -1)
      dispatch_once(&qword_1ED883058, &block);
    if (byte_1ED883023)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deviceLinkTypeDidChange:: checking current link type"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIdentityServicesAgent deviceLinkTypeDidChange:linkType:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 393);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLIdentityServicesAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("LocalLinkType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastEntryForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15
    || (objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("linkType")),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v16, "isEqual:", v17),
        v17,
        v16,
        (v18 & 1) == 0))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v19 = objc_opt_class();
      v26 = MEMORY[0x1E0C809B0];
      v27 = 3221225472;
      v28 = __60__PLIdentityServicesAgent_deviceLinkTypeDidChange_linkType___block_invoke_120;
      v29 = &__block_descriptor_40_e5_v8__0lu32l8;
      v30 = v19;
      if (qword_1ED883060 != -1)
        dispatch_once(&qword_1ED883060, &v26);
      if (byte_1ED883024)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deviceLinkTypeDidChange:: adding current link type"), v26, v27, v28, v29, v30);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lastPathComponent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIdentityServicesAgent deviceLinkTypeDidChange:linkType:]");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 397);

        PLLogCommon();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v20;
          _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLIdentityServicesAgent logLocalLinkType:](self, "logLocalLinkType:", v4, v26, v27, v28, v29, v30, block, v32, v33, v34, v35);
  }

}

uint64_t __60__PLIdentityServicesAgent_deviceLinkTypeDidChange_linkType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883023 = result;
  return result;
}

uint64_t __60__PLIdentityServicesAgent_deviceLinkTypeDidChange_linkType___block_invoke_120(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883024 = result;
  return result;
}

- (void)initOperatorDependancies
{
  id v3;
  uint64_t v4;
  PLXPCListenerOperatorComposition *v5;
  PLXPCListenerOperatorComposition *networkStatsHandler;
  PLXPCListenerOperatorComposition *v7;
  PLXPCListenerOperatorComposition *infraWiFiRequestHandler;
  PLXPCListenerOperatorComposition *v9;
  PLXPCListenerOperatorComposition *localLinkTypeHandler;
  PLXPCListenerOperatorComposition *v11;
  PLXPCListenerOperatorComposition *localMessageHandler;
  PLXPCListenerOperatorComposition *v13;
  PLXPCListenerOperatorComposition *idsLinkPreferenceRequestHandler;
  PLXPCListenerOperatorComposition *v15;
  PLXPCListenerOperatorComposition *idsOutgoingPushSentListener;
  PLXPCListenerOperatorComposition *v17;
  PLXPCListenerOperatorComposition *idsIncomingPushReceivedListener;
  PLXPCListenerOperatorComposition *v19;
  PLXPCListenerOperatorComposition *idsSessionListener;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];

  -[PLIdentityServicesAgent setCurrentLinkType](self, "setCurrentLinkType");
  v3 = objc_alloc(MEMORY[0x1E0D80090]);
  v4 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke;
  v28[3] = &unk_1E8578610;
  v28[4] = self;
  v5 = (PLXPCListenerOperatorComposition *)objc_msgSend(v3, "initWithOperator:withRegistration:withBlock:", self, &unk_1E864BC48, v28);
  networkStatsHandler = self->_networkStatsHandler;
  self->_networkStatsHandler = v5;

  v27[0] = v4;
  v27[1] = 3221225472;
  v27[2] = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_141;
  v27[3] = &unk_1E8578610;
  v27[4] = self;
  v7 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864BC70, v27);
  infraWiFiRequestHandler = self->_infraWiFiRequestHandler;
  self->_infraWiFiRequestHandler = v7;

  v26[0] = v4;
  v26[1] = 3221225472;
  v26[2] = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_2_147;
  v26[3] = &unk_1E8578610;
  v26[4] = self;
  v9 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864BC98, v26);
  localLinkTypeHandler = self->_localLinkTypeHandler;
  self->_localLinkTypeHandler = v9;

  v25[0] = v4;
  v25[1] = 3221225472;
  v25[2] = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_3;
  v25[3] = &unk_1E8578610;
  v25[4] = self;
  v11 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864BCC0, v25);
  localMessageHandler = self->_localMessageHandler;
  self->_localMessageHandler = v11;

  v24[0] = v4;
  v24[1] = 3221225472;
  v24[2] = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_158;
  v24[3] = &unk_1E8578610;
  v24[4] = self;
  v13 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864BCE8, v24);
  idsLinkPreferenceRequestHandler = self->_idsLinkPreferenceRequestHandler;
  self->_idsLinkPreferenceRequestHandler = v13;

  v23[0] = v4;
  v23[1] = 3221225472;
  v23[2] = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_168;
  v23[3] = &unk_1E8578610;
  v23[4] = self;
  v15 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864BD10, v23);
  idsOutgoingPushSentListener = self->_idsOutgoingPushSentListener;
  self->_idsOutgoingPushSentListener = v15;

  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_174;
  v22[3] = &unk_1E8578610;
  v22[4] = self;
  v17 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864BD38, v22);
  idsIncomingPushReceivedListener = self->_idsIncomingPushReceivedListener;
  self->_idsIncomingPushReceivedListener = v17;

  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_180;
  v21[3] = &unk_1E8578610;
  v21[4] = self;
  v19 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864BD60, v21);
  idsSessionListener = self->_idsSessionListener;
  self->_idsSessionListener = v19;

}

void __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_2;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (qword_1ED883068 != -1)
      dispatch_once(&qword_1ED883068, &block);
    if (byte_1ED883025)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IDS Message callback recieved payload %@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIdentityServicesAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 414);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logIDSNetworkEntries:", v6);

}

uint64_t __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883025 = result;
  return result;
}

uint64_t __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_141(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "logLocalInfraWiFiFrequests:", a5);
}

void __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_2_147(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(v9, "objectForKey:", CFSTR("IDSLinkType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v9, "objectForKey:", CFSTR("IDSLinkType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logLocalLinkType:", objc_msgSend(v8, "integerValue"));

  }
}

void __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_4;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (qword_1ED883070 != -1)
      dispatch_once(&qword_1ED883070, &block);
    if (byte_1ED883026)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Local Message Topic callback: %@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIdentityServicesAgent initOperatorDependancies]_block_invoke_3");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 435);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logLocalMessageTopic:", v6);

}

uint64_t __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883026 = result;
  return result;
}

void __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_2_159;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (qword_1ED883078 != -1)
      dispatch_once(&qword_1ED883078, &block);
    if (byte_1ED883027)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IDS Link Preference Request payload %@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIdentityServicesAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 444);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logIDSLinkPreference:", v6);

}

uint64_t __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_2_159(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883027 = result;
  return result;
}

void __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogIDS();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_INFO, "IDS Outgoing Push Sent payload %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logIDSOutgoingPushSent:", v6);
}

void __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogIDS();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_INFO, "IDS Incoming Push Received payload %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logIDSIncomingPushReceived:", v6);
}

void __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogIDS();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "IDSDSession payload %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logIDSSession:", v6);
}

- (void)initTaskOperatorDependancies
{
  id v3;
  PLXPCListenerOperatorComposition *v4;
  PLXPCListenerOperatorComposition *cloudMessagingHandler;
  _QWORD v6[5];

  v3 = objc_alloc(MEMORY[0x1E0D80090]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PLIdentityServicesAgent_initTaskOperatorDependancies__block_invoke;
  v6[3] = &unk_1E8578610;
  v6[4] = self;
  v4 = (PLXPCListenerOperatorComposition *)objc_msgSend(v3, "initWithOperator:withRegistration:withBlock:", self, &unk_1E864BD88, v6);
  cloudMessagingHandler = self->_cloudMessagingHandler;
  self->_cloudMessagingHandler = v4;

}

void __55__PLIdentityServicesAgent_initTaskOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __55__PLIdentityServicesAgent_initTaskOperatorDependancies__block_invoke_2;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (qword_1ED883080 != -1)
      dispatch_once(&qword_1ED883080, &block);
    if (byte_1ED883028)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cloud Messaging callback: %@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIdentityServicesAgent initTaskOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 479);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logCloudMessaging:", v6);

}

uint64_t __55__PLIdentityServicesAgent_initTaskOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883028 = result;
  return result;
}

- (void)logLocalMessageTopic:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLIdentityServicesAgent, "entryKeyForType:andName:", v4, CFSTR("IDSLocalMessage"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logIDSLinkPreference:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLIdentityServicesAgent, "entryKeyForType:andName:", v4, CFSTR("IDSLinkPreferenceRequest"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v8, v5);
  objc_msgSend(v5, "objectForKey:", CFSTR("InputBytesPerSecond"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E8633120, CFSTR("InputBytesPerSecond"));
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

- (void)logIDSOutgoingPushSent:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLIdentityServicesAgent, "entryKeyForType:andName:", v4, CFSTR("IDSOutgoingPushSent"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logIDSIncomingPushReceived:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLIdentityServicesAgent, "entryKeyForType:andName:", v4, CFSTR("IDSIncomingPushReceived"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logIDSSession:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLIdentityServicesAgent, "entryKeyForType:andName:", v4, CFSTR("Session"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logCloudMessaging:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IDSClientBringsUpCloudMessaging")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    +[PLOperator entryKeyForType:andName:](PLIdentityServicesAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("CloudMessaging"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);
    -[PLOperator logEntry:](self, "logEntry:", v8);

  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PLIdentityServicesAgent_logCloudMessaging___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1ED883088 != -1)
      dispatch_once(&qword_1ED883088, block);
    if (byte_1ED883029)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload invalid for Cloud Messaging"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIdentityServicesAgent logCloudMessaging:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 526);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __45__PLIdentityServicesAgent_logCloudMessaging___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883029 = result;
  return result;
}

- (void)logLocalLinkType:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  +[PLOperator entryKeyForType:andName:](PLIdentityServicesAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("LocalLinkType"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("linkType"));

  -[PLOperator logEntry:](self, "logEntry:", v5);
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
    -[PLIdentityServicesAgent createBTAccountingEvents:](self, "createBTAccountingEvents:", v5);

}

- (void)notifyLinkType:(unint64_t)a3
{
  int out_token;

  out_token = 0;
  notify_register_check((const char *)objc_msgSend(CFSTR("PLIDSStatusChangedNotification"), "UTF8String"), &out_token);
  notify_set_state(out_token, a3);
  notify_post((const char *)objc_msgSend(CFSTR("PLIDSStatusChangedNotification"), "UTF8String"));
  notify_cancel(out_token);
}

- (void)logLocalInfraWiFiFrequests:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLIdentityServicesAgent, "entryKeyForType:andName:", v4, CFSTR("LocalInfraWiFiRequests"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IDSServicePrefersInfraWifi"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("requestingServices"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Reason"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("reason"));
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

- (void)logIDSNetworkEntries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
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
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  unint64_t v50;
  NSObject *v51;
  void *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  unint64_t v56;
  unint64_t v57;
  NSObject *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  unint64_t v62;
  unint64_t v63;
  NSObject *v64;
  void *v65;
  unint64_t v66;
  void *v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  char v87;
  void *v88;
  uint64_t v89;
  NSObject *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  unint64_t v102;
  void *v103;
  unint64_t v104;
  NSObject *v105;
  void *v106;
  unint64_t v107;
  void *v108;
  unint64_t v109;
  NSObject *v110;
  void *v111;
  unint64_t v112;
  void *v113;
  unint64_t v114;
  unint64_t v115;
  NSObject *v116;
  void *v117;
  unint64_t v118;
  void *v119;
  unint64_t v120;
  unint64_t v121;
  unint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  unint64_t v145;
  unint64_t v146;
  unint64_t v147;
  void *v148;
  unint64_t v149;
  unint64_t v150;
  unint64_t v151;
  unint64_t v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  PLIdentityServicesAgent *v156;
  void *v157;
  void *v158;
  void *v159;
  unint64_t v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  _QWORD v165[5];
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  _QWORD block[5];
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  void *v175;
  void *v176;
  _BYTE v177[128];
  void *v178;
  void *v179;
  uint8_t buf[4];
  uint64_t v181;
  _BYTE v182[128];
  uint64_t v183;

  v183 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IDSLocalStatisticsCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIdentityServicesAgent previousStatsByPriority](self, "previousStatsByPriority");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = objc_claimAutoreleasedReturnValue();

  v159 = (void *)v7;
  if (!v7)
  {
    v8 = objc_opt_new();
    -[PLIdentityServicesAgent previousStatsByPriority](self, "previousStatsByPriority");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = (void *)v8;
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v5);

  }
  v10 = objc_msgSend(v5, "isEqualToString:", CFSTR("Sockets"));
  v141 = (void *)objc_opt_new();
  v11 = *MEMORY[0x1E0D80380];
  v156 = self;
  v140 = v4;
  if (!v10)
  {
    +[PLOperator entryKeyForType:andName:](PLIdentityServicesAgent, "entryKeyForType:andName:", v11, CFSTR("IDSMessagePeriodic"));
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = 0u;
    v167 = 0u;
    v168 = 0u;
    v169 = 0u;
    v80 = v4;
    v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v166, v177, 16);
    if (!v81)
      goto LABEL_92;
    v82 = v81;
    v83 = *(_QWORD *)v167;
    v158 = v5;
    v153 = v80;
    v163 = *(_QWORD *)v167;
LABEL_54:
    v84 = 0;
    v155 = v82;
    while (1)
    {
      if (*(_QWORD *)v167 != v83)
        objc_enumerationMutation(v80);
      v85 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * v84);
      if ((objc_msgSend(v85, "isEqualToString:", CFSTR("IDSLocalStatisticsCategory")) & 1) != 0
        || (objc_msgSend(v85, "containsString:", CFSTR("__pl_internal")) & 1) != 0)
      {
        goto LABEL_90;
      }
      objc_msgSend(v80, "objectForKeyedSubscript:", v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_opt_respondsToSelector();

      if ((v87 & 1) != 0)
      {
        -[PLIdentityServicesAgent lastEntryDatePerCategory](self, "lastEntryDatePerCategory");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "objectForKeyedSubscript:", v5);
        v89 = objc_claimAutoreleasedReturnValue();

        v164 = v89;
        if (!v89)
        {
          -[PLIdentityServicesAgent initialEntryDate](self, "initialEntryDate");
          v164 = objc_claimAutoreleasedReturnValue();
        }
        v90 = objc_opt_new();
        objc_msgSend(v80, "objectForKeyedSubscript:", v85);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("IDSLocalOutgoingMessageBytes"));
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:atIndexedSubscript:](v90, "setObject:atIndexedSubscript:", v92, 0);

        objc_msgSend(v80, "objectForKeyedSubscript:", v85);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("IDSLocalIncomingMessageBytes"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:atIndexedSubscript:](v90, "setObject:atIndexedSubscript:", v94, 1);

        objc_msgSend(v80, "objectForKeyedSubscript:", v85);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("IDSLocalOutgoingMessages"));
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:atIndexedSubscript:](v90, "setObject:atIndexedSubscript:", v96, 2);

        objc_msgSend(v80, "objectForKeyedSubscript:", v85);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("IDSLocalIncomingMessages"));
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:atIndexedSubscript:](v90, "setObject:atIndexedSubscript:", v98, 3);

        objc_msgSend(v159, "objectForKeyedSubscript:", v85);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "setObject:forKeyedSubscript:", v90, v85);
        if (v99 && v90)
        {
          v100 = v90;
          objc_msgSend(v99, "objectAtIndexedSubscript:", 0);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = objc_msgSend(v101, "unsignedLongValue");

          -[NSObject objectAtIndexedSubscript:](v100, "objectAtIndexedSubscript:", 0);
          v103 = (void *)objc_claimAutoreleasedReturnValue();

          v151 = objc_msgSend(v103, "unsignedLongValue");
          v104 = v151 >= v102 ? v102 : 0;
          v149 = v104;
          v105 = v100;
          objc_msgSend(v99, "objectAtIndexedSubscript:", 1);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = objc_msgSend(v106, "unsignedLongValue");

          -[NSObject objectAtIndexedSubscript:](v105, "objectAtIndexedSubscript:", 1);
          v108 = (void *)objc_claimAutoreleasedReturnValue();

          v145 = objc_msgSend(v108, "unsignedLongValue");
          v109 = v145 >= v107 ? v107 : 0;
          v147 = v109;
          v110 = v105;
          objc_msgSend(v99, "objectAtIndexedSubscript:", 2);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = objc_msgSend(v111, "unsignedLongValue");

          -[NSObject objectAtIndexedSubscript:](v110, "objectAtIndexedSubscript:", 2);
          v113 = (void *)objc_claimAutoreleasedReturnValue();

          v114 = objc_msgSend(v113, "unsignedLongValue");
          v115 = v114 >= v112 ? v112 : 0;
          v116 = v110;
          objc_msgSend(v99, "objectAtIndexedSubscript:", 3);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = objc_msgSend(v117, "unsignedLongValue");

          -[NSObject objectAtIndexedSubscript:](v116, "objectAtIndexedSubscript:", 3);
          v119 = (void *)objc_claimAutoreleasedReturnValue();

          v120 = objc_msgSend(v119, "unsignedLongValue");
          v82 = v155;
          v121 = v120 >= v118 ? v118 : 0;
          if (v151 != v149 || v145 != v147 || v114 != v115 || v120 != v121)
          {
            v122 = v120 - v121;
            v123 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v142, v164);
            objc_msgSend(v123, "setObject:forKeyedSubscript:", v85, CFSTR("topic"));
            objc_msgSend(v123, "setObject:forKeyedSubscript:", v158, CFSTR("priority"));
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v151 - v149);
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "setObject:forKeyedSubscript:", v124, CFSTR("OutgoingBytes"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v145 - v147);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "setObject:forKeyedSubscript:", v125, CFSTR("IncomingBytes"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v114 - v115);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "setObject:forKeyedSubscript:", v126, CFSTR("OutgoingMessages"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v122);
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "setObject:forKeyedSubscript:", v127, CFSTR("IncomingMessages"));

            objc_msgSend(v123, "setObject:forKeyedSubscript:", v143, CFSTR("timestampEnd"));
            objc_msgSend(v153, "objectForKeyedSubscript:", v85);
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("IDSLocalLinkType"));
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "setObject:forKeyedSubscript:", v129, CFSTR("LinkType"));

            objc_msgSend(v141, "addObject:", v123);
            v82 = v155;
          }
        }

        self = v156;
        v5 = v158;
        v80 = v153;
        v83 = v163;
        v130 = (void *)v164;
      }
      else
      {
        v83 = v163;
        if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          goto LABEL_90;
        v131 = objc_opt_class();
        v165[0] = MEMORY[0x1E0C809B0];
        v165[1] = 3221225472;
        v165[2] = __48__PLIdentityServicesAgent_logIDSNetworkEntries___block_invoke_228;
        v165[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v165[4] = v131;
        if (qword_1ED883098 != -1)
          dispatch_once(&qword_1ED883098, v165);
        if (!byte_1ED88302B)
          goto LABEL_90;
        v132 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v80, "objectForKeyedSubscript:", v85);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "stringWithFormat:", CFSTR("Key %@ does not support objectForKeyedSubscript"), v133);
        v130 = (void *)objc_claimAutoreleasedReturnValue();

        v134 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "lastPathComponent");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIdentityServicesAgent logIDSNetworkEntries:]");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "logMessage:fromFile:fromFunction:fromLineNumber:", v130, v136, v137, 704);

        PLLogCommon();
        v90 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v181 = (uint64_t)v130;
          _os_log_debug_impl(&dword_1CAF47000, v90, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        v82 = v155;
        v83 = v163;
      }

LABEL_90:
      if (v82 == ++v84)
      {
        v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v166, v177, 16);
        if (!v82)
        {
LABEL_92:

          v78 = v141;
          v175 = v142;
          v176 = v141;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v176, &v175, 1);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v138, v142);

          if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
            goto LABEL_93;
          goto LABEL_94;
        }
        goto LABEL_54;
      }
    }
  }
  v157 = v5;
  +[PLOperator entryKeyForType:andName:](PLIdentityServicesAgent, "entryKeyForType:andName:", v11, CFSTR("IDSSocketPeriodic"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = 0u;
  v172 = 0u;
  v173 = 0u;
  v174 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v171, v182, 16);
  if (!v13)
    goto LABEL_50;
  v14 = v13;
  v15 = *(_QWORD *)v172;
  v162 = *(_QWORD *)v172;
  do
  {
    v16 = 0;
    v144 = v14;
    do
    {
      if (*(_QWORD *)v172 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * v16);
      if ((objc_msgSend(v17, "isEqualToString:", CFSTR("IDSLocalStatisticsCategory")) & 1) == 0
        && (objc_msgSend(v17, "containsString:", CFSTR("__pl_internal")) & 1) == 0)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_opt_respondsToSelector();

        if ((v19 & 1) != 0)
        {
          v20 = objc_opt_new();
          objc_msgSend(v12, "objectForKeyedSubscript:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("IDSLocalOutgoingSocketBytes"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:atIndexedSubscript:](v20, "setObject:atIndexedSubscript:", v22, 0);

          objc_msgSend(v12, "objectForKeyedSubscript:", v17);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("IDSLocalIncomingSocketBytes"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:atIndexedSubscript:](v20, "setObject:atIndexedSubscript:", v24, 1);

          objc_msgSend(v12, "objectForKeyedSubscript:", v17);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("IDSLocalOutgoingSocketPackets"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:atIndexedSubscript:](v20, "setObject:atIndexedSubscript:", v26, 2);

          objc_msgSend(v12, "objectForKeyedSubscript:", v17);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("IDSLocalIncomingSocketPackets"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:atIndexedSubscript:](v20, "setObject:atIndexedSubscript:", v28, 3);

          objc_msgSend(v159, "objectForKeyedSubscript:", v17);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v159, "setObject:forKeyedSubscript:", v20, v17);
          v30 = 0;
          if (!v29 || !v20)
            goto LABEL_46;
          if (objc_msgSend(v17, "isEqualToString:", CFSTR("localdelivery")))
          {
            -[PLIdentityServicesAgent lastLocalDeliveryLogDate](self, "lastLocalDeliveryLogDate");
            v31 = objc_claimAutoreleasedReturnValue();
            if (v31)
            {
              v32 = (void *)v31;
              -[PLIdentityServicesAgent lastLocalDeliveryLogDate](self, "lastLocalDeliveryLogDate");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v143, "timeIntervalSinceDate:", v33);
              v35 = fabs(v34);

              if (v35 < 600.0)
              {
                v30 = 0;
LABEL_46:

LABEL_47:
                v15 = v162;
                goto LABEL_48;
              }
            }
            -[PLIdentityServicesAgent lastLocalDeliveryLogDate](self, "lastLocalDeliveryLogDate");
            v154 = objc_claimAutoreleasedReturnValue();
            -[PLIdentityServicesAgent setLastLocalDeliveryLogDate:](self, "setLastLocalDeliveryLogDate:", v143);
          }
          else
          {
            -[PLIdentityServicesAgent lastEntryDatePerCategory](self, "lastEntryDatePerCategory");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "objectForKeyedSubscript:", v157);
            v154 = objc_claimAutoreleasedReturnValue();

          }
          v46 = v20;
          objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "unsignedLongValue");

          -[NSObject objectAtIndexedSubscript:](v46, "objectAtIndexedSubscript:", 0);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v152 = objc_msgSend(v49, "unsignedLongValue");
          if (v152 >= v48)
            v50 = v48;
          else
            v50 = 0;
          v150 = v50;
          v51 = v46;
          objc_msgSend(v29, "objectAtIndexedSubscript:", 1);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "unsignedLongValue");

          -[NSObject objectAtIndexedSubscript:](v51, "objectAtIndexedSubscript:", 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          v55 = v29;
          v56 = objc_msgSend(v54, "unsignedLongValue");

          if (v56 >= v53)
            v57 = v53;
          else
            v57 = 0;
          v146 = v57;
          v58 = v51;
          objc_msgSend(v55, "objectAtIndexedSubscript:", 2);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v59, "unsignedLongValue");

          -[NSObject objectAtIndexedSubscript:](v58, "objectAtIndexedSubscript:", 2);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          v62 = objc_msgSend(v61, "unsignedLongValue");
          if (v62 >= v60)
            v63 = v60;
          else
            v63 = 0;
          v160 = v63;
          v64 = v58;
          v148 = v55;
          objc_msgSend(v55, "objectAtIndexedSubscript:", 3);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v65, "unsignedLongValue");

          -[NSObject objectAtIndexedSubscript:](v64, "objectAtIndexedSubscript:", 3);
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          v68 = objc_msgSend(v67, "unsignedLongValue");
          if (v68 < v66)
            v66 = 0;
          if (v152 == v150 && v56 == v146 && v62 == v160 && v68 == v66)
          {
            v30 = (void *)v154;
            self = v156;
            v14 = v144;
          }
          else
          {
            v69 = v154;
            if (!v154)
            {
              -[PLIdentityServicesAgent initialEntryDate](v156, "initialEntryDate");
              v69 = objc_claimAutoreleasedReturnValue();
            }
            v70 = v56 - v146;
            v161 = v62 - v160;
            v71 = v68 - v66;
            v72 = (void *)v69;
            v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v142, v69);
            objc_msgSend(v73, "setObject:forKeyedSubscript:", v17, CFSTR("topic"));
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v152 - v150);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "setObject:forKeyedSubscript:", v74, CFSTR("OutgoingBytes"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v70);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "setObject:forKeyedSubscript:", v75, CFSTR("IncomingBytes"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v161);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "setObject:forKeyedSubscript:", v76, CFSTR("OutgoingPackets"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v71);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "setObject:forKeyedSubscript:", v77, CFSTR("IncomingPackets"));

            objc_msgSend(v73, "setObject:forKeyedSubscript:", v143, CFSTR("timestampEnd"));
            objc_msgSend(v141, "addObject:", v73);

            v14 = v144;
            v30 = v72;
            self = v156;
          }
          v29 = v148;
          goto LABEL_46;
        }
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v36 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __48__PLIdentityServicesAgent_logIDSNetworkEntries___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v36;
          if (qword_1ED883090 != -1)
            dispatch_once(&qword_1ED883090, block);
          if (byte_1ED88302A)
          {
            v37 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v12, "objectForKeyedSubscript:", v17);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "stringWithFormat:", CFSTR("IDS Sockets - Key %@ does not support objectForKeyedSubscript"), v38);
            v39 = objc_claimAutoreleasedReturnValue();

            v40 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "lastPathComponent");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIdentityServicesAgent logIDSNetworkEntries:]");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v40;
            v30 = (void *)v39;
            objc_msgSend(v44, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v42, v43, 651);

            PLLogCommon();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v181 = v39;
              _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
            goto LABEL_47;
          }
        }
      }
LABEL_48:
      ++v16;
    }
    while (v14 != v16);
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v171, v182, 16);
  }
  while (v14);
LABEL_50:

  v78 = v141;
  v178 = v142;
  v179 = v141;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v179, &v178, 1);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v79, v142);

  v5 = v157;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
    goto LABEL_94;
LABEL_93:
  -[PLIdentityServicesAgent createIDSAccountingEventsWithEntries:](self, "createIDSAccountingEventsWithEntries:", v78);
LABEL_94:

  -[PLIdentityServicesAgent lastEntryDatePerCategory](self, "lastEntryDatePerCategory");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "setObject:forKeyedSubscript:", v143, v5);

}

uint64_t __48__PLIdentityServicesAgent_logIDSNetworkEntries___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88302A = result;
  return result;
}

uint64_t __48__PLIdentityServicesAgent_logIDSNetworkEntries___block_invoke_228(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88302B = result;
  return result;
}

- (void)createBTAccountingEvents:(id)a3
{
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v3 = objc_msgSend(MEMORY[0x1E0D80020], "isHomePod");
  v4 = v9;
  if ((v3 & 1) == 0)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("linkType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "entryDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == 1)
      objc_msgSend(v7, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 8, CFSTR("IDSWatchBT"), v8);
    else
      objc_msgSend(v7, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 8, CFSTR("IDSWatchBT"), v8);

    v4 = v9;
  }

}

- (void)createIDSAccountingEventsWithEntries:(id)a3
{
  id v3;
  char v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E0D80020], "isHomePod");
  if (v3 && (v4 & 1) == 0 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    v8 = v6;
    if (v7)
    {
      v9 = v7;
      v35 = v3;
      v10 = *(_QWORD *)v41;
      v11 = 0.0;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v41 != v10)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("topic"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14 && (objc_msgSend(v14, "isEqualToString:", CFSTR("localdelivery")) & 1) == 0)
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("OutgoingBytes"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "doubleValue");
            v18 = v17;
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("IncomingBytes"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "doubleValue");
            v21 = v18 + v20;

            v11 = v11 + v21;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, v15);

          }
        }
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v9);

      v3 = v35;
      if (v11 <= 0.0)
        goto LABEL_23;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      objc_msgSend(v5, "allKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v37;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v37 != v25)
              objc_enumerationMutation(v8);
            v27 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
            objc_msgSend(v5, "objectForKeyedSubscript:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "doubleValue");
            v30 = v29;

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30 / v11);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, v27);

          }
          v24 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        }
        while (v24);
      }
    }

LABEL_23:
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "createDistributionEventBackwardWithDistributionID:withChildNodeNameToWeight:withEndDate:", 31, v5, v34);

  }
}

- (PLXPCListenerOperatorComposition)localMessageHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLocalMessageHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLXPCListenerOperatorComposition)networkStatsHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNetworkStatsHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLXPCListenerOperatorComposition)infraWiFiRequestHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInfraWiFiRequestHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLXPCListenerOperatorComposition)localLinkTypeHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLocalLinkTypeHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLXPCListenerOperatorComposition)ipsecLinkTypeHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setIpsecLinkTypeHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLXPCListenerOperatorComposition)cloudMessagingHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCloudMessagingHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLXPCListenerOperatorComposition)idsLinkPreferenceRequestHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setIdsLinkPreferenceRequestHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PLXPCListenerOperatorComposition)idsOutgoingPushSentListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setIdsOutgoingPushSentListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (PLXPCListenerOperatorComposition)idsIncomingPushReceivedListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setIdsIncomingPushReceivedListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLXPCListenerOperatorComposition)idsSessionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setIdsSessionListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSMutableDictionary)previousStatsByPriority
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPreviousStatsByPriority:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSDate)initialEntryDate
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInitialEntryDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSDate)lastLocalDeliveryLogDate
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLastLocalDeliveryLogDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSMutableDictionary)lastEntryDatePerCategory
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLastEntryDatePerCategory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NRDeviceMonitor)nrdm
{
  return (NRDeviceMonitor *)objc_getProperty(self, a2, 160, 1);
}

- (void)setNrdm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nrdm, 0);
  objc_storeStrong((id *)&self->_lastEntryDatePerCategory, 0);
  objc_storeStrong((id *)&self->_lastLocalDeliveryLogDate, 0);
  objc_storeStrong((id *)&self->_initialEntryDate, 0);
  objc_storeStrong((id *)&self->_previousStatsByPriority, 0);
  objc_storeStrong((id *)&self->_idsSessionListener, 0);
  objc_storeStrong((id *)&self->_idsIncomingPushReceivedListener, 0);
  objc_storeStrong((id *)&self->_idsOutgoingPushSentListener, 0);
  objc_storeStrong((id *)&self->_idsLinkPreferenceRequestHandler, 0);
  objc_storeStrong((id *)&self->_cloudMessagingHandler, 0);
  objc_storeStrong((id *)&self->_ipsecLinkTypeHandler, 0);
  objc_storeStrong((id *)&self->_localLinkTypeHandler, 0);
  objc_storeStrong((id *)&self->_infraWiFiRequestHandler, 0);
  objc_storeStrong((id *)&self->_networkStatsHandler, 0);
  objc_storeStrong((id *)&self->_localMessageHandler, 0);
}

@end
