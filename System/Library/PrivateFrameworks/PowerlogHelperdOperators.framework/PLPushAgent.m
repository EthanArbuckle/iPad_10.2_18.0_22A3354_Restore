@implementation PLPushAgent

+ (id)defaults
{
  return &unk_1EA1D7E28;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLPushAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("ReceivedPush");
  objc_msgSend(a1, "entryEventPointDefinitionsReceivedPush");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("SentPush");
  objc_msgSend(a1, "entryEventPointDefinitionsSentPush");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = CFSTR("APSDConnectedEvent");
  objc_msgSend(a1, "entryEventPointDefinitionsAPSDConnectedEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v12[3] = CFSTR("SentKeepAlive");
  objc_msgSend(a1, "entryEventPointDefinitionsSentKeepAlive");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v6;
  v12[4] = CFSTR("ReceivedKeepAlive");
  objc_msgSend(a1, "entryEventPointDefinitionsReceivedKeepAlive");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v7;
  v12[5] = CFSTR("MessageSent");
  objc_msgSend(a1, "entryEventPointDefinitionMessageSent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v8;
  v12[6] = CFSTR("MessageReceived");
  objc_msgSend(a1, "entryEventPointDefinitionMessageReceived");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventPointDefinitionsReceivedPush
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
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
  _QWORD v34[13];
  _QWORD v35[13];
  _QWORD v36[4];
  _QWORD v37[4];
  _QWORD v38[2];
  _QWORD v39[4];

  v39[2] = *MEMORY[0x1E0C80C00];
  v38[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v36[0] = *MEMORY[0x1E0D80318];
  v36[1] = v2;
  v37[0] = &unk_1EA1DA908;
  v37[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80250];
  v36[2] = *MEMORY[0x1E0D80288];
  v36[3] = v3;
  v37[2] = MEMORY[0x1E0C9AAB0];
  v37[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v33;
  v38[1] = *MEMORY[0x1E0D802F0];
  v34[0] = CFSTR("ConnectionType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_StringFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v31;
  v34[1] = CFSTR("ServerHostname");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commonTypeDict_StringFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v29;
  v34[2] = CFSTR("ServerIP");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonTypeDict_StringFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v27;
  v34[3] = CFSTR("LinkQuality");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v25;
  v34[4] = CFSTR("MessageIdentifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v23;
  v34[5] = CFSTR("Topic");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_StringFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v21;
  v34[6] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_StringFormat_withBundleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v19;
  v34[7] = CFSTR("IsDropped");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v17;
  v34[8] = CFSTR("Priority");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v15;
  v34[9] = CFSTR("StorageFlag");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35[9] = v5;
  v34[10] = CFSTR("Size");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[10] = v7;
  v34[11] = CFSTR("FilterList");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[11] = v9;
  v34[12] = CFSTR("DidWake");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_BoolFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[12] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryEventPointDefinitionsSentPush
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[8];
  _QWORD v24[8];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[2];
  _QWORD v28[4];

  v28[2] = *MEMORY[0x1E0C80C00];
  v27[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v25[0] = *MEMORY[0x1E0D80318];
  v25[1] = v2;
  v26[0] = &unk_1EA1DA918;
  v26[1] = MEMORY[0x1E0C9AAB0];
  v25[2] = *MEMORY[0x1E0D80300];
  v26[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  v27[1] = *MEMORY[0x1E0D802F0];
  v23[0] = CFSTR("ConnectionType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  v23[1] = CFSTR("ServerHostname");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_StringFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v18;
  v23[2] = CFSTR("ServerIP");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v16;
  v23[3] = CFSTR("LinkQuality");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v14;
  v23[4] = CFSTR("MessageIdentifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v4;
  v23[5] = CFSTR("Topic");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v6;
  v23[6] = CFSTR("Priority");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v8;
  v23[7] = CFSTR("Size");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionsAPSDConnectedEvent
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
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1EA1DA928;
  v20[1] = MEMORY[0x1E0C9AAB0];
  v19[2] = *MEMORY[0x1E0D80300];
  v20[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("ConnectionType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("ServerHostname");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("ServerIP");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("LinkQuality");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("ExperimentID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionsSentKeepAlive
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1EA1DA938;
  v14[1] = MEMORY[0x1E0C9AAB0];
  v13[2] = *MEMORY[0x1E0D80300];
  v14[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("ConnectionType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("LinkQuality");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventPointDefinitionsReceivedKeepAlive
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
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[2];
  _QWORD v20[4];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1EA1DA938;
  v18[1] = MEMORY[0x1E0C9AAB0];
  v17[2] = *MEMORY[0x1E0D80300];
  v18[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("ConnectionType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("DidWake");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("Environment");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("LinkQuality");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionMessageReceived
{
  return +[PLPushAgent entryEventPointDefinitionMessage](PLPushAgent, "entryEventPointDefinitionMessage");
}

+ (id)entryEventPointDefinitionMessageSent
{
  return +[PLPushAgent entryEventPointDefinitionMessage](PLPushAgent, "entryEventPointDefinitionMessage");
}

+ (id)entryEventPointDefinitionMessage
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[2];
  _QWORD v24[4];

  v24[2] = *MEMORY[0x1E0C80C00];
  v23[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v21[0] = *MEMORY[0x1E0D80318];
  v21[1] = v2;
  v22[0] = &unk_1EA1DA918;
  v22[1] = MEMORY[0x1E0C9AAB0];
  v21[2] = *MEMORY[0x1E0D80300];
  v22[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E0D802F0];
  v19[0] = CFSTR("MessageType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v19[1] = CFSTR("ConversationType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  v19[2] = CFSTR("Protocol");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v4;
  v19[3] = CFSTR("Target");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v6;
  v19[4] = CFSTR("Source");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v8;
  v19[5] = CFSTR("MessageGUID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryAggregateDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("SentPushes");
  objc_msgSend(a1, "entryAggregateDefinitionSentPushes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("SuppressedPushes");
  objc_msgSend(a1, "entryAggregateDefinitionSuppressedPushes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("APSDConnected");
  objc_msgSend(a1, "entryAggregateDefinitionAPSDConnected");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryAggregateDefinitionSentPushes
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[4];
  _QWORD v31[6];

  v31[4] = *MEMORY[0x1E0C80C00];
  v30[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v28[0] = *MEMORY[0x1E0D80318];
  v28[1] = v2;
  v29[0] = &unk_1EA1DA918;
  v29[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80340];
  v28[2] = *MEMORY[0x1E0D80288];
  v28[3] = v3;
  v29[2] = MEMORY[0x1E0C9AAB0];
  v29[3] = &unk_1EA1C0470;
  v28[4] = *MEMORY[0x1E0D80338];
  v29[4] = &unk_1EA1DA948;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v20;
  v30[1] = *MEMORY[0x1E0D802F0];
  v26[0] = CFSTR("ConnectionType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v18;
  v26[1] = CFSTR("Topic");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v16;
  v26[2] = CFSTR("Priority");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v4;
  v26[3] = CFSTR("Count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v6;
  v26[4] = CFSTR("Size");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v9;
  v30[2] = *MEMORY[0x1E0D80228];
  v24 = &unk_1EA1DA958;
  v22 = *MEMORY[0x1E0D80220];
  v23 = &unk_1EA1DA968;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v11;
  v30[3] = *MEMORY[0x1E0D80238];
  v21[0] = CFSTR("Count");
  v21[1] = CFSTR("Size");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryAggregateDefinitionSuppressedPushes
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
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[4];
  _QWORD v26[6];

  v26[4] = *MEMORY[0x1E0C80C00];
  v25[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v23[0] = *MEMORY[0x1E0D80318];
  v23[1] = v2;
  v24[0] = &unk_1EA1DA938;
  v24[1] = MEMORY[0x1E0C9AAB0];
  v23[2] = *MEMORY[0x1E0D80250];
  v24[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  v25[1] = *MEMORY[0x1E0D802F0];
  v21[0] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_StringFormat_withBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v3;
  v21[1] = CFSTR("InterruptionSuppression");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v5;
  v21[2] = CFSTR("Count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v8;
  v25[2] = *MEMORY[0x1E0D80228];
  v19 = &unk_1EA1DA978;
  v17 = *MEMORY[0x1E0D80220];
  v18 = &unk_1EA1DA968;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v10;
  v25[3] = *MEMORY[0x1E0D80238];
  v16 = CFSTR("Count");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryAggregateDefinitionAPSDConnected
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
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1EA1DA938;
  v20[1] = MEMORY[0x1E0C9AAB0];
  v19[2] = *MEMORY[0x1E0D80300];
  v20[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v3;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17 = CFSTR("Count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v6;
  v21[2] = *MEMORY[0x1E0D80228];
  v15 = &unk_1EA1DA978;
  v13 = *MEMORY[0x1E0D80220];
  v14 = &unk_1EA1DA968;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v8;
  v21[3] = *MEMORY[0x1E0D80238];
  v12 = CFSTR("Count");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (PLPushAgent)init
{
  PLPushAgent *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLPushAgent;
  result = -[PLAgent init](&v3, sel_init);
  if (result)
    result->_numKeepAlives = 0;
  return result;
}

- (void)initOperatorDependancies
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  PLTimer *v15;
  PLTimer *runTimeAggregatorTimer;
  void *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *pushUsageDict;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];

  v3 = objc_alloc(MEMORY[0x1E0D80090]);
  v4 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __39__PLPushAgent_initOperatorDependancies__block_invoke;
  v30[3] = &unk_1EA16CF18;
  v30[4] = self;
  v5 = (void *)objc_msgSend(v3, "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7E50, v30);
  -[PLPushAgent setReceivedPushListener:](self, "setReceivedPushListener:", v5);

  v29[0] = v4;
  v29[1] = 3221225472;
  v29[2] = __39__PLPushAgent_initOperatorDependancies__block_invoke_124;
  v29[3] = &unk_1EA16CF18;
  v29[4] = self;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7E78, v29);
  -[PLPushAgent setSentPushListener:](self, "setSentPushListener:", v6);

  v28[0] = v4;
  v28[1] = 3221225472;
  v28[2] = __39__PLPushAgent_initOperatorDependancies__block_invoke_135;
  v28[3] = &unk_1EA16CF18;
  v28[4] = self;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7EA0, v28);
  -[PLPushAgent setSuppressedPushesListener:](self, "setSuppressedPushesListener:", v7);

  v27[0] = v4;
  v27[1] = 3221225472;
  v27[2] = __39__PLPushAgent_initOperatorDependancies__block_invoke_141;
  v27[3] = &unk_1EA16CF18;
  v27[4] = self;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7EC8, v27);
  -[PLPushAgent setApsdConnectedListener:](self, "setApsdConnectedListener:", v8);

  v26[0] = v4;
  v26[1] = 3221225472;
  v26[2] = __39__PLPushAgent_initOperatorDependancies__block_invoke_147;
  v26[3] = &unk_1EA16CF18;
  v26[4] = self;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7EF0, v26);
  -[PLPushAgent setSentKeepAliveListener:](self, "setSentKeepAliveListener:", v9);

  -[PLOperator defaultDoubleForKey:](self, "defaultDoubleForKey:", CFSTR("RunTimeAggregatorTimerCadence"));
  v11 = v10;
  v12 = objc_alloc(MEMORY[0x1E0D80070]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator workQueue](self, "workQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v4;
  v25[1] = 3221225472;
  v25[2] = __39__PLPushAgent_initOperatorDependancies__block_invoke_152;
  v25[3] = &unk_1EA16EB78;
  v25[4] = self;
  v15 = (PLTimer *)objc_msgSend(v12, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v13, 1, 0, v14, v25, v11, 0.0);
  runTimeAggregatorTimer = self->_runTimeAggregatorTimer;
  self->_runTimeAggregatorTimer = v15;

  v24[0] = v4;
  v24[1] = 3221225472;
  v24[2] = __39__PLPushAgent_initOperatorDependancies__block_invoke_2_159;
  v24[3] = &unk_1EA16CF18;
  v24[4] = self;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7F18, v24);
  -[PLPushAgent setReceivedKeepAliveListener:](self, "setReceivedKeepAliveListener:", v17);

  v18 = (NSMutableDictionary *)objc_opt_new();
  pushUsageDict = self->_pushUsageDict;
  self->_pushUsageDict = v18;

  v23[0] = v4;
  v23[1] = 3221225472;
  v23[2] = __39__PLPushAgent_initOperatorDependancies__block_invoke_167;
  v23[3] = &unk_1EA16CF18;
  v23[4] = self;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7F40, v23);
  -[PLPushAgent setMessageSentListener:](self, "setMessageSentListener:", v20);

  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = __39__PLPushAgent_initOperatorDependancies__block_invoke_173;
  v22[3] = &unk_1EA16CF18;
  v22[4] = self;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7F68, v22);
  -[PLPushAgent setMessageReceivedListener:](self, "setMessageReceivedListener:", v21);

}

void __39__PLPushAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;

  v6 = a5;
  PLLogPush();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __39__PLPushAgent_initOperatorDependancies__block_invoke_cold_1();

  +[PLOperator entryKeyForType:andName:](PLPushAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("ReceivedPush"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v8, v6);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Topic"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "containsString:", CFSTR("com.apple.Safari")) & 1) != 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Topic"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsString:", CFSTR("https://"));

    if (v12)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("com.apple.Safari"), CFSTR("Topic"));
  }
  else
  {

  }
  v13 = (void *)objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Topic"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdFromTopic:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("BundleID"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("IsWakingMessage"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("DidWake"));

  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Size"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v18, "intValue"), 2));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("Size"));

  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v9, "entryDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSince1970");
    objc_msgSend(v20, "dateWithTimeIntervalSince1970:", round(v22 / 60.0) * 60.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEntryDate:", v23);

  }
  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v9);
  if (objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
  {
    v24 = *(void **)(a1 + 32);
    objc_msgSend(v9, "entryDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "checkPushUsage:withPLEntry:", v25, v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "accountReceivedPushWithEntry:", v9);

}

void __39__PLPushAgent_initOperatorDependancies__block_invoke_124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
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
  uint64_t block;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  uint64_t v33;

  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __39__PLPushAgent_initOperatorDependancies__block_invoke_2;
    v32 = &__block_descriptor_40_e5_v8__0lu32l8;
    v33 = v7;
    if (kPLPushAgentInterruptionSuppression_block_invoke_defaultOnce != -1)
      dispatch_once(&kPLPushAgentInterruptionSuppression_block_invoke_defaultOnce, &block);
    if (kPLPushAgentInterruptionSuppression_block_invoke_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLPushAgent:: sentPushListener with payload=%@"), v6, block, v30, v31, v32, v33);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPushAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPushAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 437);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  v14 = (void *)objc_msgSend(v6, "mutableCopy");
  v15 = (void *)objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ConnectionType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "replaceConnectionTypeWithEnum:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("ConnectionType"));

  v18 = 0x1E0CB3000;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
  {
    +[PLOperator entryKeyForType:andName:](PLPushAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("SentPush"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v19, v14);
    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Size"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v22, "intValue"), 2));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("Size"));

    v18 = 0x1E0CB3000uLL;
    objc_msgSend(*(id *)(a1 + 32), "logEntry:", v20);

  }
  +[PLOperator entryKeyForType:andName:](PLPushAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("SentPushes"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v24, v14);
  v26 = *(void **)(v18 + 2024);
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Size"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v27, "intValue"), 2));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, CFSTR("Size"));

  objc_msgSend(v25, "setObject:forKeyedSubscript:", &unk_1EA1C04A0, CFSTR("Count"));
  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v25);

}

uint64_t __39__PLPushAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLPushAgentInterruptionSuppression_block_invoke_classDebugEnabled = result;
  return result;
}

void __39__PLPushAgent_initOperatorDependancies__block_invoke_135(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __39__PLPushAgent_initOperatorDependancies__block_invoke_135_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logAggregateSuppressedPushes:", v6);
}

void __39__PLPushAgent_initOperatorDependancies__block_invoke_141(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __39__PLPushAgent_initOperatorDependancies__block_invoke_141_cold_1();

  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  v9 = (void *)objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ConnectionType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "replaceConnectionTypeWithEnum:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("ConnectionType"));

  +[PLOperator entryKeyForType:andName:](PLPushAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("APSDConnectedEvent"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v12, v8);
  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v13);
  +[PLOperator entryKeyForType:andName:](PLPushAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("APSDConnected"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v14, v8);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1EA1C04A0, CFSTR("Count"));
  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v15);

}

void __39__PLPushAgent_initOperatorDependancies__block_invoke_147(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  uint64_t block;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  uint64_t v27;

  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __39__PLPushAgent_initOperatorDependancies__block_invoke_2_148;
    v26 = &__block_descriptor_40_e5_v8__0lu32l8;
    v27 = v7;
    if (kPLPushAgentInterruptionSuppression_block_invoke_2_defaultOnce != -1)
      dispatch_once(&kPLPushAgentInterruptionSuppression_block_invoke_2_defaultOnce, &block);
    if (kPLPushAgentInterruptionSuppression_block_invoke_2_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLPushAgent:: sentKeepAliveListener with payload=%@"), v6, block, v24, v25, v26, v27);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPushAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPushAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 489);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  +[PLOperator entryKeyForType:andName:](PLPushAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("SentKeepAlive"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v14);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LinkQuality"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("LinkQuality"));

  v17 = (void *)objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ConnectionType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "replaceConnectionTypeWithEnum:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("ConnectionType"));

  v20 = *(_QWORD **)(a1 + 32);
  v21 = v20[12];
  if (v21 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 500);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, CFSTR("ConnectionType"));

    v20 = *(_QWORD **)(a1 + 32);
  }
  else if (v21)
  {
    goto LABEL_13;
  }
  objc_msgSend(v20, "logEntry:", v15);
LABEL_13:
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);

}

uint64_t __39__PLPushAgent_initOperatorDependancies__block_invoke_2_148(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLPushAgentInterruptionSuppression_block_invoke_2_classDebugEnabled = result;
  return result;
}

uint64_t __39__PLPushAgent_initOperatorDependancies__block_invoke_152(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 96) = 0;
  return result;
}

void __39__PLPushAgent_initOperatorDependancies__block_invoke_2_159(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogPush();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __39__PLPushAgent_initOperatorDependancies__block_invoke_2_159_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventPointReceivedKeepAlive:", v6);
}

void __39__PLPushAgent_initOperatorDependancies__block_invoke_167(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogPush();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __39__PLPushAgent_initOperatorDependancies__block_invoke_167_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "handleMessageEvent:isSentEvent:", v6, 1);
}

void __39__PLPushAgent_initOperatorDependancies__block_invoke_173(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogPush();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __39__PLPushAgent_initOperatorDependancies__block_invoke_173_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "handleMessageEvent:isSentEvent:", v6, 0);
}

- (void)logEventPointReceivedKeepAlive:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLPushAgent, "entryKeyForType:andName:", v4, CFSTR("ReceivedKeepAlive"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logAggregateSuppressedPushes:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80368];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLPushAgent, "entryKeyForType:andName:", v4, CFSTR("SuppressedPushes"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)accountReceivedPushWithEntry:(id)a3
{
  id v3;
  NSObject *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
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
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLLogPush();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[PLPushAgent accountReceivedPushWithEntry:].cold.2();

  v5 = objc_msgSend(MEMORY[0x1E0D80020], "isHomePod");
  if (v3 && (v5 & 1) == 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BundleID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "hasPrefix:", CFSTR("com.apple.icloud-container.clouddocs.")) & 1) != 0)
    {
      v7 = 37;
    }
    else
    {
      if (!objc_msgSend(v6, "hasPrefix:", CFSTR("com.apple.icloud-container.")))
        goto LABEL_10;
      v7 = 27;
    }
    objc_msgSend(v6, "substringFromIndex:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
LABEL_10:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ConnectionType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("wifi")))
    {
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v6;
      v38[0] = &unk_1EA1DA938;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "entryDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v10;
      v14 = 4;
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("wwan")))
      {
LABEL_15:
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DidWake"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "BOOLValue");

        PLLogPush();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[PLPushAgent accountReceivedPushWithEntry:].cold.1(v16, v17);

        if (v16)
        {
          PLLogPush();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v3, "entryDate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v32 = v3;
            v33 = 2112;
            v34 = v19;
            _os_log_impl(&dword_1DA9D6000, v18, OS_LOG_TYPE_INFO, "Waking push with entry=%@, entry.entryDate=%@", buf, 0x16u);

          }
          objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "entryDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "entryDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "dateByAddingTimeInterval:", 10.0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", 60, v21, v23, 150.0);

          objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v6;
          v30 = &unk_1EA1DA938;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "entryDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "entryDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "dateByAddingTimeInterval:", 10.0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "createDistributionEventIntervalWithDistributionID:withChildNodeNameToWeight:withStartDate:withEndDate:", 48, v25, v26, v28);

        }
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v6;
      v36 = &unk_1EA1DA938;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "entryDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v10;
      v14 = 5;
    }
    objc_msgSend(v13, "createDistributionEventPointWithDistributionID:withChildNodeNameToWeight:withStartDate:", v14, v11, v12);

    goto LABEL_15;
  }
LABEL_22:

}

+ (id)bundleIdFromTopic:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[9];
  _QWORD v23[10];

  v23[9] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "length"))
    {
      v22[0] = CFSTR("com.apple.madrid");
      v22[1] = CFSTR("com.apple.calendar");
      v23[0] = &__block_literal_global_188;
      v23[1] = &__block_literal_global_193;
      v22[2] = CFSTR("com.me.cal");
      v22[3] = CFSTR("com.me.bookmarks");
      v23[2] = &__block_literal_global_198;
      v23[3] = &__block_literal_global_201;
      v22[4] = CFSTR("com.me.contacts");
      v22[5] = CFSTR("com.apple.mobilemail");
      v23[4] = &__block_literal_global_206;
      v23[5] = &__block_literal_global_211;
      v22[6] = CFSTR("com.apple.sharedstreams");
      v22[7] = CFSTR("com.apple.private.alloy.sms");
      v23[6] = &__block_literal_global_214;
      v23[7] = &__block_literal_global_219;
      v22[8] = CFSTR("com.apple.Safari");
      v23[8] = &__block_literal_global_220;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v17 = &v16;
      v18 = 0x3032000000;
      v19 = __Block_byref_object_copy__10;
      v20 = __Block_byref_object_dispose__10;
      v21 = v4;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __33__PLPushAgent_bundleIdFromTopic___block_invoke_223;
      v13[3] = &unk_1EA16F2F8;
      v6 = v21;
      v14 = v6;
      v15 = &v16;
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v13);
      v7 = objc_msgSend(v6, "rangeOfString:", CFSTR(".voip"));
      v8 = objc_msgSend(v6, "length");
      if (v7 == v8 - objc_msgSend(CFSTR(".voip"), "length"))
      {
        objc_msgSend(v6, "substringToIndex:", v7);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v17[5];
        v17[5] = v9;

      }
      v11 = (__CFString *)(id)v17[5];

      _Block_object_dispose(&v16, 8);
    }
    else
    {
      v11 = &stru_1EA174678;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

const __CFString *__33__PLPushAgent_bundleIdFromTopic___block_invoke()
{
  return CFSTR("com.apple.MobileSMS");
}

const __CFString *__33__PLPushAgent_bundleIdFromTopic___block_invoke_2()
{
  return CFSTR("com.apple.mobilecal");
}

const __CFString *__33__PLPushAgent_bundleIdFromTopic___block_invoke_3()
{
  return CFSTR("com.apple.mobilecal");
}

const __CFString *__33__PLPushAgent_bundleIdFromTopic___block_invoke_4()
{
  return CFSTR("com.apple.mobilesafari");
}

const __CFString *__33__PLPushAgent_bundleIdFromTopic___block_invoke_5()
{
  return CFSTR("com.apple.MobileAddressBook");
}

const __CFString *__33__PLPushAgent_bundleIdFromTopic___block_invoke_6()
{
  return CFSTR("com.apple.mobilemail");
}

const __CFString *__33__PLPushAgent_bundleIdFromTopic___block_invoke_7()
{
  return CFSTR("com.apple.mobileslideshow");
}

const __CFString *__33__PLPushAgent_bundleIdFromTopic___block_invoke_8()
{
  return CFSTR("com.apple.MobileSMS");
}

const __CFString *__33__PLPushAgent_bundleIdFromTopic___block_invoke_9()
{
  return CFSTR("webpushd");
}

void __33__PLPushAgent_bundleIdFromTopic___block_invoke_223(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (**v10)(id, _QWORD);

  v10 = a3;
  if (!objc_msgSend(*(id *)(a1 + 32), "rangeOfString:", a2))
  {
    v10[2](v10, *(_QWORD *)(a1 + 32));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a4 = 1;
  }

}

+ (id)replaceConnectionTypeWithEnum:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "isEqual:", CFSTR("wwan")))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = 1;
  }
  else if (objc_msgSend(v3, "isEqual:", CFSTR("wifi")))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = 2;
  }
  else
  {
    v6 = objc_msgSend(v3, "isEqual:", CFSTR("proxy"));
    v4 = (void *)MEMORY[0x1E0CB37E8];
    if (v6)
      v5 = 4;
    else
      v5 = 3;
  }
  objc_msgSend(v4, "numberWithInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)isHighPriorityPushEntry:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Priority"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue") == 10;
  else
    v5 = 0;

  return v5;
}

- (void)sendEnergyIssueSignatureNotification:(id)a3 withThreshold:(double)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0DAFF28]);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("Energy"), CFSTR("Push"), CFSTR("PushStorm"), &stru_1EA174678, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = *MEMORY[0x1E0DB0060];
    v18 = CFSTR("com.apple.PowerlogCore.DESysLogFilterProcess");
    v15 = v6;
    v16 = CFSTR("processNames");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __66__PLPushAgent_sendEnergyIssueSignatureNotification_withThreshold___block_invoke;
    v14[3] = &unk_1EA16F320;
    v14[4] = self;
    objc_msgSend(v7, "snapshotWithSignature:duration:events:payload:actions:reply:", v9, 0, v13, 0, v14, 120.0);

  }
}

void __66__PLPushAgent_sendEnergyIssueSignatureNotification_withThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD block[5];

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0DB00A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0DB00A0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_16;
    v6 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__PLPushAgent_sendEnergyIssueSignatureNotification_withThreshold___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (kPLPushAgentInterruptionSuppression_block_invoke_3_defaultOnce != -1)
      dispatch_once(&kPLPushAgentInterruptionSuppression_block_invoke_3_defaultOnce, block);
    if (!kPLPushAgentInterruptionSuppression_block_invoke_3_classDebugEnabled)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SDRDiagnosticReporter response = %@, sessionID = %@"), v2, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPushAgent.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPushAgent sendEnergyIssueSignatureNotification:withThreshold:]_block_invoke");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 689);

    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

LABEL_15:
LABEL_16:

    goto LABEL_17;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v13 = objc_opt_class();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __66__PLPushAgent_sendEnergyIssueSignatureNotification_withThreshold___block_invoke_246;
    v18[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v18[4] = v13;
    if (kPLPushAgentInterruptionSuppression_block_invoke_3_defaultOnce_244 != -1)
      dispatch_once(&kPLPushAgentInterruptionSuppression_block_invoke_3_defaultOnce_244, v18);
    if (kPLPushAgentInterruptionSuppression_block_invoke_3_classDebugEnabled_245)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SDRDiagnosticReporter dampened"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPushAgent.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPushAgent sendEnergyIssueSignatureNotification:withThreshold:]_block_invoke_2");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v16, v17, 692);

      PLLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      goto LABEL_15;
    }
  }
LABEL_17:

}

uint64_t __66__PLPushAgent_sendEnergyIssueSignatureNotification_withThreshold___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLPushAgentInterruptionSuppression_block_invoke_3_classDebugEnabled = result;
  return result;
}

uint64_t __66__PLPushAgent_sendEnergyIssueSignatureNotification_withThreshold___block_invoke_246(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLPushAgentInterruptionSuppression_block_invoke_3_classDebugEnabled_245 = result;
  return result;
}

- (void)checkPushUsage:(id)a3 withPLEntry:(id)a4
{
  id v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD block[5];

  v7 = a3;
  v8 = a4;
  if (self->_detectionStartTime)
  {
    objc_msgSend(v7, "timeIntervalSinceDate:");
    if (v9 <= 86400.0)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BundleID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](self->_pushUsageDict, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = (void *)MEMORY[0x1E0CB37E8];
        -[NSMutableDictionary objectForKeyedSubscript:](self->_pushUsageDict, "objectForKeyedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "numberWithInt:", objc_msgSend(v13, "intValue") + 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pushUsageDict, "setObject:forKeyedSubscript:", v14, v10);

      }
      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pushUsageDict, "setObject:forKeyedSubscript:", &unk_1EA1C04A0, v10);
      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_pushUsageDict, "objectForKeyedSubscript:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "intValue");

      if (v16 >= 1001)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pushUsageDict, "setObject:forKeyedSubscript:", 0, v10);
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.private.alloy.willow")))
          -[PLPushAgent sendEnergyIssueSignatureNotification:withThreshold:](self, "sendEnergyIssueSignatureNotification:withThreshold:", v10, 1000.0);
      }

    }
    else
    {
      -[NSMutableDictionary removeAllObjects](self->_pushUsageDict, "removeAllObjects");
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_detectionStartTime, a3);
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v17 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__PLPushAgent_checkPushUsage_withPLEntry___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v17;
    if (checkPushUsage_withPLEntry__defaultOnce != -1)
      dispatch_once(&checkPushUsage_withPLEntry__defaultOnce, block);
    if (checkPushUsage_withPLEntry__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLPushAgent: checkPushUsage"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPushAgent.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPushAgent checkPushUsage:withPLEntry:]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 727);

      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

uint64_t __42__PLPushAgent_checkPushUsage_withPLEntry___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  checkPushUsage_withPLEntry__classDebugEnabled = result;
  return result;
}

- (unint64_t)convertMessageProtocol:(id)a3
{
  id v3;
  unint64_t v4;
  NSObject *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iMessage")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iMessageLite")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RCS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SatelliteSMS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 6;
  }
  else
  {
    PLLogPush();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PLPushAgent convertMessageProtocol:].cold.1();

    v4 = 2;
  }

  return v4;
}

- (void)handleMessageEvent:(id)a3 isSentEvent:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a4;
  v6 = a3;
  PLLogPush();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PLPushAgent handleMessageEvent:isSentEvent:].cold.1(v4, (uint64_t)v6, v7);

  v8 = CFSTR("MessageReceived");
  if (v4)
    v8 = CFSTR("MessageSent");
  v9 = v8;
  +[PLOperator entryKeyForType:andName:](PLPushAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MessageType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("MessageType"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ConversationType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("ConversationType"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Protocol"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithUnsignedInteger:", -[PLPushAgent convertMessageProtocol:](self, "convertMessageProtocol:", v15));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("Protocol"));

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Target"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUtilities hashString:](PLUtilities, "hashString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v19, "hash"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("Target"));

    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Source"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUtilities hashString:](PLUtilities, "hashString:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v23, "hash"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v24, CFSTR("Source"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MessageGUID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, CFSTR("MessageGUID"));

  }
  -[PLOperator logEntry:](self, "logEntry:", v11);

}

- (PLXPCListenerOperatorComposition)receivedPushListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setReceivedPushListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLXPCListenerOperatorComposition)sentPushListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSentPushListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLXPCListenerOperatorComposition)suppressedPushesListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSuppressedPushesListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLXPCListenerOperatorComposition)sentKeepAliveListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSentKeepAliveListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLXPCListenerOperatorComposition)receivedKeepAliveListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setReceivedKeepAliveListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLTimer)runTimeAggregatorTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRunTimeAggregatorTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (unint64_t)numKeepAlives
{
  return self->_numKeepAlives;
}

- (void)setNumKeepAlives:(unint64_t)a3
{
  self->_numKeepAlives = a3;
}

- (PLXPCListenerOperatorComposition)apsdConnectedListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setApsdConnectedListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableDictionary)pushUsageDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPushUsageDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSDate)detectionStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDetectionStartTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PLXPCListenerOperatorComposition)messageSentListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setMessageSentListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (PLXPCListenerOperatorComposition)messageReceivedListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setMessageReceivedListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageReceivedListener, 0);
  objc_storeStrong((id *)&self->_messageSentListener, 0);
  objc_storeStrong((id *)&self->_detectionStartTime, 0);
  objc_storeStrong((id *)&self->_pushUsageDict, 0);
  objc_storeStrong((id *)&self->_apsdConnectedListener, 0);
  objc_storeStrong((id *)&self->_runTimeAggregatorTimer, 0);
  objc_storeStrong((id *)&self->_receivedKeepAliveListener, 0);
  objc_storeStrong((id *)&self->_sentKeepAliveListener, 0);
  objc_storeStrong((id *)&self->_suppressedPushesListener, 0);
  objc_storeStrong((id *)&self->_sentPushListener, 0);
  objc_storeStrong((id *)&self->_receivedPushListener, 0);
}

void __39__PLPushAgent_initOperatorDependancies__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "PLPushAgent:: receivedPushListener with payload=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __39__PLPushAgent_initOperatorDependancies__block_invoke_135_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "SuppressedPushes payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __39__PLPushAgent_initOperatorDependancies__block_invoke_141_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "PLPushAgent:: apsdConnectedListener with payload=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __39__PLPushAgent_initOperatorDependancies__block_invoke_2_159_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "PLPushAgent:: receivedKeepAliveListener with payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __39__PLPushAgent_initOperatorDependancies__block_invoke_167_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "iMessageSent payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __39__PLPushAgent_initOperatorDependancies__block_invoke_173_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "iMessageReceived payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)accountReceivedPushWithEntry:(char)a1 .cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_DEBUG, "didWake = %d", (uint8_t *)v2, 8u);
}

- (void)accountReceivedPushWithEntry:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "accounting entry %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)convertMessageProtocol:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Other Message Protocol logged: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMessageEvent:(NSObject *)a3 isSentEvent:.cold.1(char a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1 & 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_1DA9D6000, a3, OS_LOG_TYPE_DEBUG, "Received messages update, isSentEvent: %@, payload: %@", v6, 0x16u);

}

@end
