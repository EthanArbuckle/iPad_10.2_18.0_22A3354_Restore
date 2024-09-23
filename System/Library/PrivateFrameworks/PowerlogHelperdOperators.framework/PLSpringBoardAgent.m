@implementation PLSpringBoardAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSpringBoardAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("SBAutoLock");
  objc_msgSend(a1, "entryEventPointAutoLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("SBNotifications");
  objc_msgSend(a1, "entryEventPointLocalRemoteNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("SBBulletins");
  objc_msgSend(a1, "entryEventPointBulletins");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventPointLocalRemoteNotifications
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
  v2 = *MEMORY[0x1E0D80300];
  v21[0] = *MEMORY[0x1E0D80318];
  v21[1] = v2;
  v22[0] = &unk_1EA1DA828;
  v22[1] = MEMORY[0x1E0C9AAA0];
  v21[2] = *MEMORY[0x1E0D80250];
  v22[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E0D802F0];
  v19[0] = CFSTR("NotificationType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v19[1] = CFSTR("NotificationBundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat_withBundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  v19[2] = CFSTR("Waking");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v4;
  v19[3] = CFSTR("NSEStartTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_DateFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v6;
  v19[4] = CFSTR("NSEEndTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_DateFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v8;
  v19[5] = CFSTR("UIShown");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointBulletins
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
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1EA1DA838;
  v14[1] = MEMORY[0x1E0C9AAA0];
  v13[2] = *MEMORY[0x1E0D80250];
  v14[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("PostType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("BulletinBundleID");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat_withBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventPointAutoLock
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1EA1DA838;
  v12[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("AutoLockType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  v8[0] = CFSTR("SBBlank");
  +[PLSpringBoardAgent entryEventForwardDefinitionBlank](PLSpringBoardAgent, "entryEventForwardDefinitionBlank");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("SBLock");
  +[PLSpringBoardAgent entryEventForwardDefinitionLock](PLSpringBoardAgent, "entryEventForwardDefinitionLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("SBScreen");
  +[PLSpringBoardAgent entryEventForwardDefinitionScreen](PLSpringBoardAgent, "entryEventForwardDefinitionScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("SBWallpaper");
  +[PLSpringBoardAgent entryEventForwardDefinitionWallpaper](PLSpringBoardAgent, "entryEventForwardDefinitionWallpaper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventForwardDefinitionBlank
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1EA1DA838;
  v12[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("Blanked");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventForwardDefinitionLock
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1EA1DA838;
  v12[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("Locked");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventForwardDefinitionScreen
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1EA1DA838;
  v12[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("Screen");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventForwardDefinitionWallpaper
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
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1EA1DA838;
  v14[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("HomeScreen");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("LockScreen");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryAggregateDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("SBNotifications_Aggregate");
  objc_msgSend(a1, "entryAggregateDefinitionNotifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("SBBulletins_Aggregate");
  v8[0] = v3;
  objc_msgSend(a1, "entryAggregateDefinitionBulletins");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryAggregateDefinitionNotifications
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
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[15];
  _QWORD v44[15];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[4];
  _QWORD v48[6];

  v48[4] = *MEMORY[0x1E0C80C00];
  v47[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v45[0] = *MEMORY[0x1E0D80318];
  v45[1] = v2;
  v46[0] = &unk_1EA1DA848;
  v46[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v38;
  v47[1] = *MEMORY[0x1E0D802F0];
  v43[0] = CFSTR("NotificationType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v36;
  v43[1] = CFSTR("NotificationBundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_StringFormat_withBundleID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v34;
  v43[2] = CFSTR("Count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v32;
  v43[3] = CFSTR("FgWakingCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v30;
  v43[4] = CFSTR("FgWakingPluggedInCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v28;
  v43[5] = CFSTR("BgWakingCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v44[5] = v26;
  v43[6] = CFSTR("BgWakingPluggedInCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44[6] = v24;
  v43[7] = CFSTR("NonWakingCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v44[7] = v22;
  v43[8] = CFSTR("NonWakingPluggedInCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44[8] = v20;
  v43[9] = CFSTR("BgWakingNSEDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_RealFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44[9] = v18;
  v43[10] = CFSTR("BgWakingPluggedInNSEDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_RealFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44[10] = v16;
  v43[11] = CFSTR("NonWakingNSEDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_RealFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v44[11] = v14;
  v43[12] = CFSTR("NonWakingPluggedInNSEDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v44[12] = v4;
  v43[13] = CFSTR("FgWakingNSEDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v44[13] = v6;
  v43[14] = CFSTR("FgWakingPluggedInNSEDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44[14] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v9;
  v47[2] = *MEMORY[0x1E0D80228];
  v41 = &unk_1EA1DA858;
  v39 = *MEMORY[0x1E0D80220];
  v40 = &unk_1EA1DA868;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v47[3] = *MEMORY[0x1E0D80238];
  v48[2] = v11;
  v48[3] = &unk_1EA1DBD40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryAggregateDefinitionBulletins
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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[4];
  _QWORD v24[6];

  v24[4] = *MEMORY[0x1E0C80C00];
  v23[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v21[0] = *MEMORY[0x1E0D80318];
  v21[1] = v2;
  v22[0] = &unk_1EA1DA838;
  v22[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v23[1] = *MEMORY[0x1E0D802F0];
  v19[0] = CFSTR("PostType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  v19[1] = CFSTR("BulletinBundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat_withBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  v19[2] = CFSTR("Count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v9;
  v23[2] = *MEMORY[0x1E0D80228];
  v17 = &unk_1EA1DA858;
  v15 = *MEMORY[0x1E0D80220];
  v16 = &unk_1EA1DA878;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = *MEMORY[0x1E0D80238];
  v24[2] = v11;
  v24[3] = &unk_1EA1DBD58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)defaults
{
  return &unk_1EA1D7AB8;
}

- (PLSpringBoardAgent)init
{
  PLSpringBoardAgent *v3;
  PLSpringBoardAgent *v4;
  PLSpringBoardAgent *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  PLSpringBoardAgent *v10;
  uint64_t v11;
  PLNSNotificationOperatorComposition *notificationSBScreenTimeTrackingChanged;
  id v13;
  uint64_t v14;
  PLSpringBoardAgent *v15;
  uint64_t v16;
  PLNSNotificationOperatorComposition *notificationSBAutoLockTimerFiredNotification;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  PLSpringBoardAgent *v27;
  void *v28;
  id v29;
  PLSpringBoardAgent *v30;
  uint64_t v31;
  PLCFNotificationOperatorComposition *notificationSBLockTrackingChanged;
  id v33;
  PLSpringBoardAgent *v34;
  uint64_t v35;
  PLCFNotificationOperatorComposition *notificationSBBlankTrackingChanged;
  _QWORD v38[4];
  PLSpringBoardAgent *v39;
  _QWORD v40[4];
  PLSpringBoardAgent *v41;
  _QWORD v42[4];
  PLSpringBoardAgent *v43;
  _QWORD block[5];
  _QWORD v45[4];
  PLSpringBoardAgent *v46;
  _QWORD v47[4];
  PLSpringBoardAgent *v48;
  objc_super v49;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v49.receiver = self;
    v49.super_class = (Class)PLSpringBoardAgent;
    v4 = -[PLAgent init](&v49, sel_init);
    v5 = v4;
    if (v4)
    {
      -[PLSpringBoardAgent setUpScreenNumberDictionary](v4, "setUpScreenNumberDictionary");
      -[PLSpringBoardAgent resetAutoLockIsNil](v5, "resetAutoLockIsNil");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel_settingsChangedNotification_, *MEMORY[0x1E0D46EC8], 0);
      v7 = objc_alloc(MEMORY[0x1E0D80010]);
      v8 = *MEMORY[0x1E0DABAA8];
      v9 = MEMORY[0x1E0C809B0];
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __26__PLSpringBoardAgent_init__block_invoke;
      v47[3] = &unk_1EA16D158;
      v10 = v5;
      v48 = v10;
      v11 = objc_msgSend(v7, "initWithOperator:forNotification:withBlock:", v10, v8, v47);
      notificationSBScreenTimeTrackingChanged = v10->_notificationSBScreenTimeTrackingChanged;
      v10->_notificationSBScreenTimeTrackingChanged = (PLNSNotificationOperatorComposition *)v11;

      _SBFScreenTimeRegisterForExternalChangeNotification();
      v13 = objc_alloc(MEMORY[0x1E0D80010]);
      v14 = *MEMORY[0x1E0DAB0F0];
      v45[0] = v9;
      v45[1] = 3221225472;
      v45[2] = __26__PLSpringBoardAgent_init__block_invoke_114;
      v45[3] = &unk_1EA16D158;
      v15 = v10;
      v46 = v15;
      v16 = objc_msgSend(v13, "initWithOperator:forNotification:withBlock:", v15, v14, v45);
      notificationSBAutoLockTimerFiredNotification = v15->_notificationSBAutoLockTimerFiredNotification;
      v15->_notificationSBAutoLockTimerFiredNotification = (PLNSNotificationOperatorComposition *)v16;

      _SBSAutolockTimerRegisterForExternalChangeNotification();
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __26__PLSpringBoardAgent_init__block_invoke_120;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = objc_opt_class();
        if (init_defaultOnce != -1)
          dispatch_once(&init_defaultOnce, block);
        if (init_classDebugEnabled)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Initing SB Wallpaper poll"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "lastPathComponent");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent init]");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 344);

          PLLogCommon();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      v24 = objc_alloc(MEMORY[0x1E0D80070]);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator workQueue](v15, "workQueue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v9;
      v42[1] = 3221225472;
      v42[2] = __26__PLSpringBoardAgent_init__block_invoke_125;
      v42[3] = &unk_1EA16EB78;
      v27 = v15;
      v43 = v27;
      v28 = (void *)objc_msgSend(v24, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v25, 1, 0, v26, v42, 86400.0, 0.0);

      -[PLSpringBoardAgent setDailyWallpaperPoll:](v27, "setDailyWallpaperPoll:", v28);
      v29 = objc_alloc(MEMORY[0x1E0D7FF80]);
      v40[0] = v9;
      v40[1] = 3221225472;
      v40[2] = __26__PLSpringBoardAgent_init__block_invoke_131;
      v40[3] = &unk_1EA16D158;
      v30 = v27;
      v41 = v30;
      v31 = objc_msgSend(v29, "initWithOperator:forNotification:requireState:withBlock:", v30, CFSTR("com.apple.springboard.lockstate"), 1, v40);
      notificationSBLockTrackingChanged = v30->_notificationSBLockTrackingChanged;
      v30->_notificationSBLockTrackingChanged = (PLCFNotificationOperatorComposition *)v31;

      v33 = objc_alloc(MEMORY[0x1E0D7FF80]);
      v38[0] = v9;
      v38[1] = 3221225472;
      v38[2] = __26__PLSpringBoardAgent_init__block_invoke_135;
      v38[3] = &unk_1EA16D158;
      v34 = v30;
      v39 = v34;
      v35 = objc_msgSend(v33, "initWithOperator:forNotification:requireState:withBlock:", v34, CFSTR("com.apple.springboard.hasBlankedScreen"), 1, v38);
      notificationSBBlankTrackingChanged = v34->_notificationSBBlankTrackingChanged;
      v34->_notificationSBBlankTrackingChanged = (PLCFNotificationOperatorComposition *)v35;

    }
    self = v5;
    v3 = self;
  }

  return v3;
}

void __26__PLSpringBoardAgent_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0DABAA0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[PLOperator entryKeyForType:andName:](PLSpringBoardAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("SBScreen"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v4);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, CFSTR("Screen"));
    objc_msgSend(*(id *)(a1 + 32), "logEntry:", v5);
    objc_msgSend(*(id *)(a1 + 32), "addAccountingEvent:", v5);

  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__PLSpringBoardAgent_init__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (kPLAutoLockAccountingEvent_block_invoke_defaultOnce != -1)
      dispatch_once(&kPLAutoLockAccountingEvent_block_invoke_defaultOnce, block);
    if (kPLAutoLockAccountingEvent_block_invoke_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: screenNumber is null; this implies the notification payload was not delivered via NSNotificationOperatorComposition"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent init]_block_invoke");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 328);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

uint64_t __26__PLSpringBoardAgent_init__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLAutoLockAccountingEvent_block_invoke_classDebugEnabled = result;
  return result;
}

void __26__PLSpringBoardAgent_init__block_invoke_114(uint64_t a1, void *a2, void *a3)
{
  id v5;
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
  _QWORD block[5];

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__PLSpringBoardAgent_init__block_invoke_2_115;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (kPLAutoLockAccountingEvent_block_invoke_2_defaultOnce != -1)
      dispatch_once(&kPLAutoLockAccountingEvent_block_invoke_2_defaultOnce, block);
    if (kPLAutoLockAccountingEvent_block_invoke_2_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Autolock Fired %@: userInfo=%@"), v6, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent init]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 336);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  +[PLOperator entryKeyForType:andName:](PLSpringBoardAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("SBAutoLock"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v14);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SBAutoLockTimerCategoryKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("AutoLockType"));

  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v15);
}

uint64_t __26__PLSpringBoardAgent_init__block_invoke_2_115(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLAutoLockAccountingEvent_block_invoke_2_classDebugEnabled = result;
  return result;
}

uint64_t __26__PLSpringBoardAgent_init__block_invoke_120(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  init_classDebugEnabled = result;
  return result;
}

void __26__PLSpringBoardAgent_init__block_invoke_125(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__PLSpringBoardAgent_init__block_invoke_2_126;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (kPLAutoLockAccountingEvent_block_invoke_3_defaultOnce != -1)
      dispatch_once(&kPLAutoLockAccountingEvent_block_invoke_3_defaultOnce, block);
    if (kPLAutoLockAccountingEvent_block_invoke_3_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SB Wallpaper poll"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent init]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 356);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  +[PLOperator entryKeyForType:andName:](PLSpringBoardAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("SBWallpaper"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v9);
  objc_msgSend(*(id *)(a1 + 32), "fetchSBWallpaperForType:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("HomeScreen"));

  objc_msgSend(*(id *)(a1 + 32), "fetchSBWallpaperForType:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("LockScreen"));

  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v10);
}

uint64_t __26__PLSpringBoardAgent_init__block_invoke_2_126(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLAutoLockAccountingEvent_block_invoke_3_classDebugEnabled = result;
  return result;
}

void __26__PLSpringBoardAgent_init__block_invoke_131(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];

  objc_msgSend(a2, "objectForKey:", CFSTR("com.apple.springboard.lockstate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLSpringBoardAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("SBLock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v4);
    if (objc_msgSend(v3, "longLongValue"))
      v6 = MEMORY[0x1E0C9AAB0];
    else
      v6 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("Locked"));
    objc_msgSend(*(id *)(a1 + 32), "logEntry:", v5);

  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__PLSpringBoardAgent_init__block_invoke_2_132;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (kPLAutoLockAccountingEvent_block_invoke_4_defaultOnce != -1)
      dispatch_once(&kPLAutoLockAccountingEvent_block_invoke_4_defaultOnce, block);
    if (kPLAutoLockAccountingEvent_block_invoke_4_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: lockState is null; this implies the notification payload was not or could not be populated by the CFNotificationOperatorComposition"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent init]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 382);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

uint64_t __26__PLSpringBoardAgent_init__block_invoke_2_132(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLAutoLockAccountingEvent_block_invoke_4_classDebugEnabled = result;
  return result;
}

void __26__PLSpringBoardAgent_init__block_invoke_135(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[5];

  objc_msgSend(a2, "objectForKey:", CFSTR("com.apple.springboard.hasBlankedScreen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLSpringBoardAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("SBBlank"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v4);
    if (objc_msgSend(v3, "longLongValue"))
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("Blanked"));
      v6 = dispatch_time(0, 1000000000);
      objc_msgSend(*(id *)(a1 + 32), "workQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      dispatch_after(v6, v7, &__block_literal_global_12);

    }
    else
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("Blanked"));
    }
    objc_msgSend(*(id *)(a1 + 32), "logEntry:", v5);

  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__PLSpringBoardAgent_init__block_invoke_3;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (kPLAutoLockAccountingEvent_block_invoke_5_defaultOnce != -1)
      dispatch_once(&kPLAutoLockAccountingEvent_block_invoke_5_defaultOnce, block);
    if (kPLAutoLockAccountingEvent_block_invoke_5_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: blankState is null; this implies the notification payload was not or could not be populated by the CFNotificationOperatorComposition"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent init]_block_invoke");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 420);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

void __26__PLSpringBoardAgent_init__block_invoke_2_136()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!_os_feature_enabled_impl() || (objc_msgSend(MEMORY[0x1E0D80020], "hasAOD") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, MEMORY[0x1E0C9AA70], v2);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 2, MEMORY[0x1E0C9AA60], v2);

  }
}

uint64_t __26__PLSpringBoardAgent_init__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLAutoLockAccountingEvent_block_invoke_5_classDebugEnabled = result;
  return result;
}

- (void)initOperatorDependancies
{
  void *v3;
  void *v4;
  int v5;
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
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  PLXPCListenerOperatorComposition *v36;
  PLXPCListenerOperatorComposition *userNotificationRequestEvent;
  PLXPCListenerOperatorComposition *v38;
  PLXPCListenerOperatorComposition *userNotificationTriggerEvent;
  PLXPCListenerOperatorComposition *v40;
  PLXPCListenerOperatorComposition *bulletinBoardNotificationPublishEvent;
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD block[5];
  void *v52;
  void *v53;
  const __CFString *v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  -[PLOperator storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastEntryForKey:", CFSTR("PLBatteryAgent_EventBackward_Battery"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (initOperatorDependancies_defaultOnce != -1)
      dispatch_once(&initOperatorDependancies_defaultOnce, block);
    if (initOperatorDependancies_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The last entry from BatteryU table: %@"), v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent initOperatorDependancies]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 433);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  if (v4)
    -[PLSpringBoardAgent handleChargingStateChange:](self, "handleChargingStateChange:", v4);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v50[0] = v6;
    v50[1] = 3221225472;
    v50[2] = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_148;
    v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v50[4] = objc_opt_class();
    if (initOperatorDependancies_defaultOnce_146 != -1)
      dispatch_once(&initOperatorDependancies_defaultOnce_146, v50);
    if (initOperatorDependancies_classDebugEnabled_147)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Initial device Charging State: %d"), -[PLSpringBoardAgent deviceIsCharging](self, "deviceIsCharging"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent initOperatorDependancies]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 438);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  v19 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v54 = CFSTR("ExternalConnected");
  v52 = &unk_1EA1C01A0;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v6;
  v49[1] = 3221225472;
  v49[2] = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_156;
  v49[3] = &unk_1EA16D158;
  v49[4] = self;
  v23 = (void *)objc_msgSend(v19, "initWithOperator:forEntryKey:withFilter:withBlock:", self, CFSTR("PLBatteryAgent_EventBackward_Battery"), v22, v49);
  -[PLSpringBoardAgent setDeviceChargingStateNotification:](self, "setDeviceChargingStateNotification:", v23);

  -[PLOperator storage](self, "storage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "lastEntryForKey:", CFSTR("PLDisplayAgent_EventPoint_Display"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl() && objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
  {
    if (v25)
    {
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Block"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v26, "isEqualToString:", CFSTR("Backlight")) & 1) != 0)
      {
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Active"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "intValue");

        if (v28 != 1)
          goto LABEL_28;
        goto LABEL_26;
      }
LABEL_27:

    }
  }
  else if (v25)
  {
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Block"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "isEqualToString:", CFSTR("Backlight")) & 1) == 0)
      goto LABEL_27;
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Active"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "BOOLValue");

    if (v30)
LABEL_26:
      -[PLSpringBoardAgent startAutolockEnergyPeriodicTimer](self, "startAutolockEnergyPeriodicTimer");
  }
LABEL_28:
  v48[0] = v6;
  v48[1] = 3221225472;
  v48[2] = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_2;
  v48[3] = &unk_1EA16D158;
  v48[4] = self;
  objc_msgSend(MEMORY[0x1E0D7FFC8], "displayOnNotificationWithOperator:withBlock:", self, v48);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSpringBoardAgent setDisplayOnNotification:](self, "setDisplayOnNotification:", v31);

  if (_os_feature_enabled_impl() && objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
  {
    v47[0] = v6;
    v47[1] = 3221225472;
    v47[2] = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_3;
    v47[3] = &unk_1EA16D158;
    v47[4] = self;
    objc_msgSend(MEMORY[0x1E0D7FFC8], "displayOffOrAODNotificationWithOperator:withBlock:", self, v47);
    v32 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46[0] = v6;
    v46[1] = 3221225472;
    v46[2] = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_4;
    v46[3] = &unk_1EA16D158;
    v46[4] = self;
    objc_msgSend(MEMORY[0x1E0D7FFC8], "displayOffNotificationWithOperator:withBlock:", self, v46);
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v32;
  -[PLSpringBoardAgent setDisplayOffNotification:](self, "setDisplayOffNotification:", v32);

  +[PLOperator entryKeyForType:andName:](PLPushAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("ReceivedPush"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v6;
  v45[1] = 3221225472;
  v45[2] = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_5;
  v45[3] = &unk_1EA16D158;
  v45[4] = self;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFC8]), "initWithOperator:forEntryKey:withBlock:", self, v34, v45);
  -[PLSpringBoardAgent setReceivedPushNotification:](self, "setReceivedPushNotification:", v35);

  v44[0] = v6;
  v44[1] = 3221225472;
  v44[2] = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_180;
  v44[3] = &unk_1EA16CF18;
  v44[4] = self;
  v36 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7AE0, v44);
  userNotificationRequestEvent = self->_userNotificationRequestEvent;
  self->_userNotificationRequestEvent = v36;

  v43[0] = v6;
  v43[1] = 3221225472;
  v43[2] = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_187;
  v43[3] = &unk_1EA16CF18;
  v43[4] = self;
  v38 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7B08, v43);
  userNotificationTriggerEvent = self->_userNotificationTriggerEvent;
  self->_userNotificationTriggerEvent = v38;

  v42[0] = v6;
  v42[1] = 3221225472;
  v42[2] = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_197;
  v42[3] = &unk_1EA16CF18;
  v42[4] = self;
  v40 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7B30, v42);
  bulletinBoardNotificationPublishEvent = self->_bulletinBoardNotificationPublishEvent;
  self->_bulletinBoardNotificationPublishEvent = v40;

}

uint64_t __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  initOperatorDependancies_classDebugEnabled = result;
  return result;
}

uint64_t __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_148(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  initOperatorDependancies_classDebugEnabled_147 = result;
  return result;
}

void __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_156(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectForKey:", CFSTR("entry"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleChargingStateChange:", v3);

}

uint64_t __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startAutolockEnergyPeriodicTimer");
}

uint64_t __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopAutolockEnergyPeriodicTimer");
}

uint64_t __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopAutolockEnergyPeriodicTimer");
}

void __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLastReceivedPushEntry:", v3);

}

void __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_180_cold_1();

  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
  {
    objc_msgSend(*(id *)(a1 + 32), "logBulletinPerEvent:", v6);
  }
  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "liteMode") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode"))
  {
    objc_msgSend(*(id *)(a1 + 32), "logBulletinAggregate:", v6);
  }

}

void __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_187(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
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

  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_2_188;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (kPLAutoLockAccountingEvent_block_invoke_6_defaultOnce != -1)
      dispatch_once(&kPLAutoLockAccountingEvent_block_invoke_6_defaultOnce, &block);
    if (kPLAutoLockAccountingEvent_block_invoke_6_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("payload=%@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 508);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logNotification:", v6);

}

uint64_t __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_2_188(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLAutoLockAccountingEvent_block_invoke_6_classDebugEnabled = result;
  return result;
}

void __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_197(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
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

  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_2_198;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (kPLAutoLockAccountingEvent_block_invoke_7_defaultOnce != -1)
      dispatch_once(&kPLAutoLockAccountingEvent_block_invoke_7_defaultOnce, &block);
    if (kPLAutoLockAccountingEvent_block_invoke_7_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received BulletinBoard payload: %@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 516);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logMailNotification:", v6);

}

uint64_t __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_2_198(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLAutoLockAccountingEvent_block_invoke_7_classDebugEnabled = result;
  return result;
}

- (void)handleChargingStateChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ExternalConnected"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSpringBoardAgent setDeviceIsCharging:](self, "setDeviceIsCharging:", objc_msgSend(v6, "BOOLValue"));

  }
  else
  {
    -[PLSpringBoardAgent setDeviceIsCharging:](self, "setDeviceIsCharging:", 0);
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PLSpringBoardAgent_handleChargingStateChange___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (handleChargingStateChange__defaultOnce != -1)
      dispatch_once(&handleChargingStateChange__defaultOnce, block);
    if (handleChargingStateChange__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ChargingState: %d for the entry: %@"), -[PLSpringBoardAgent deviceIsCharging](self, "deviceIsCharging"), v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent handleChargingStateChange:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 529);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

uint64_t __48__PLSpringBoardAgent_handleChargingStateChange___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleChargingStateChange__classDebugEnabled = result;
  return result;
}

- (void)startAutolockEnergyPeriodicTimer
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD block[5];
  _QWORD v32[6];

  if (-[PLSpringBoardAgent autoLockIsNil](self, "autoLockIsNil"))
  {
    -[PLSpringBoardAgent autolockEnergyPeriodicTimer](self, "autolockEnergyPeriodicTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
      v5 = MEMORY[0x1E0C809B0];
      if (v4)
      {
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __54__PLSpringBoardAgent_startAutolockEnergyPeriodicTimer__block_invoke;
        v32[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v32[4] = objc_opt_class();
        if (startAutolockEnergyPeriodicTimer_defaultOnce != -1)
          dispatch_once(&startAutolockEnergyPeriodicTimer_defaultOnce, v32);
        if (startAutolockEnergyPeriodicTimer_classDebugEnabled)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "lastPathComponent");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent startAutolockEnergyPeriodicTimer]");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 534);

          PLLogCommon();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSpringBoardAgent setLastEligibleAutolockEnergyComputationDate:](self, "setLastEligibleAutolockEnergyComputationDate:", v12);
      v13 = (void *)MEMORY[0x1E0D80000];
      block[0] = v5;
      block[1] = 3221225472;
      block[2] = __54__PLSpringBoardAgent_startAutolockEnergyPeriodicTimer__block_invoke_207;
      block[3] = &unk_1EA16D040;
      block[4] = self;
      if (startAutolockEnergyPeriodicTimer_defaultOnce_206 != -1)
        dispatch_once(&startAutolockEnergyPeriodicTimer_defaultOnce_206, block);
      objc_msgSend(v12, "dateByAddingTimeInterval:", *(double *)&startAutolockEnergyPeriodicTimer_objectForKey);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v5;
      v30[1] = 3221225472;
      v30[2] = __54__PLSpringBoardAgent_startAutolockEnergyPeriodicTimer__block_invoke_2;
      v30[3] = &unk_1EA16D040;
      v30[4] = self;
      if (startAutolockEnergyPeriodicTimer_defaultOnce_208 != -1)
        dispatch_once(&startAutolockEnergyPeriodicTimer_defaultOnce_208, v30);
      v15 = *(double *)&startAutolockEnergyPeriodicTimer_objectForKey_209;
      -[PLOperator workQueue](self, "workQueue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v5;
      v29[1] = 3221225472;
      v29[2] = __54__PLSpringBoardAgent_startAutolockEnergyPeriodicTimer__block_invoke_3;
      v29[3] = &unk_1EA16EEF0;
      v29[4] = self;
      objc_msgSend(v13, "scheduledTimerWithMonotonicFireDate:withInterval:withQueue:withBlock:", v14, v16, v29, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSpringBoardAgent setAutolockEnergyPeriodicTimer:](self, "setAutolockEnergyPeriodicTimer:", v17);

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v24 = v5;
        v25 = 3221225472;
        v26 = __54__PLSpringBoardAgent_startAutolockEnergyPeriodicTimer__block_invoke_4;
        v27 = &__block_descriptor_40_e5_v8__0lu32l8;
        v28 = objc_opt_class();
        if (startAutolockEnergyPeriodicTimer_defaultOnce_211 != -1)
          dispatch_once(&startAutolockEnergyPeriodicTimer_defaultOnce_211, &v24);
        if (startAutolockEnergyPeriodicTimer_classDebugEnabled_212)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"), v24, v25, v26, v27, v28);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "lastPathComponent");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent startAutolockEnergyPeriodicTimer]");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 545);

          PLLogCommon();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }

    }
  }
}

uint64_t __54__PLSpringBoardAgent_startAutolockEnergyPeriodicTimer__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  startAutolockEnergyPeriodicTimer_classDebugEnabled = result;
  return result;
}

uint64_t __54__PLSpringBoardAgent_startAutolockEnergyPeriodicTimer__block_invoke_207(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultDoubleForKey:", CFSTR("AutolockEnergyPeriodicTimerInterval"));
  startAutolockEnergyPeriodicTimer_objectForKey = v2;
  return result;
}

uint64_t __54__PLSpringBoardAgent_startAutolockEnergyPeriodicTimer__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultDoubleForKey:", CFSTR("AutolockEnergyPeriodicTimerInterval"));
  startAutolockEnergyPeriodicTimer_objectForKey_209 = v2;
  return result;
}

uint64_t __54__PLSpringBoardAgent_startAutolockEnergyPeriodicTimer__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "computeAutolockEnergyWithNow:", a2);
}

uint64_t __54__PLSpringBoardAgent_startAutolockEnergyPeriodicTimer__block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  startAutolockEnergyPeriodicTimer_classDebugEnabled_212 = result;
  return result;
}

- (void)stopAutolockEnergyPeriodicTimer
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  uint64_t v24;
  _QWORD block[5];

  -[PLSpringBoardAgent autolockEnergyPeriodicTimer](self, "autolockEnergyPeriodicTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
    v5 = MEMORY[0x1E0C809B0];
    if (v4)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__PLSpringBoardAgent_stopAutolockEnergyPeriodicTimer__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = objc_opt_class();
      if (stopAutolockEnergyPeriodicTimer_defaultOnce != -1)
        dispatch_once(&stopAutolockEnergyPeriodicTimer_defaultOnce, block);
      if (stopAutolockEnergyPeriodicTimer_classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent stopAutolockEnergyPeriodicTimer]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 550);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    -[PLSpringBoardAgent setLastEligibleAutolockEnergyComputationDate:](self, "setLastEligibleAutolockEnergyComputationDate:", 0);
    -[PLSpringBoardAgent setAutolockEnergyPeriodicTimer:](self, "setAutolockEnergyPeriodicTimer:", 0);
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 9, MEMORY[0x1E0C9AA60], v13);

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v20 = v5;
      v21 = 3221225472;
      v22 = __53__PLSpringBoardAgent_stopAutolockEnergyPeriodicTimer__block_invoke_217;
      v23 = &__block_descriptor_40_e5_v8__0lu32l8;
      v24 = objc_opt_class();
      if (stopAutolockEnergyPeriodicTimer_defaultOnce_215 != -1)
        dispatch_once(&stopAutolockEnergyPeriodicTimer_defaultOnce_215, &v20);
      if (stopAutolockEnergyPeriodicTimer_classDebugEnabled_216)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"), v20, v21, v22, v23, v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent stopAutolockEnergyPeriodicTimer]");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 557);

        PLLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
  }
}

uint64_t __53__PLSpringBoardAgent_stopAutolockEnergyPeriodicTimer__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  stopAutolockEnergyPeriodicTimer_classDebugEnabled = result;
  return result;
}

uint64_t __53__PLSpringBoardAgent_stopAutolockEnergyPeriodicTimer__block_invoke_217(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  stopAutolockEnergyPeriodicTimer_classDebugEnabled_216 = result;
  return result;
}

- (double)currentMediaTime
{
  kern_return_t v2;
  unint64_t v3;
  double result;
  mach_timebase_info info;

  info = 0;
  v2 = mach_timebase_info(&info);
  result = -1.0;
  if (!v2)
  {
    LODWORD(result) = info.numer;
    LODWORD(v3) = info.denom;
    return (double)*(unint64_t *)&result / (double)v3 * 0.000000001 * (double)mach_absolute_time();
  }
  return result;
}

- (void)computeAutolockEnergyWithNow:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  double v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD block[6];

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PLSpringBoardAgent_computeAutolockEnergyWithNow___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (computeAutolockEnergyWithNow__defaultOnce != -1)
      dispatch_once(&computeAutolockEnergyWithNow__defaultOnce, block);
    if (computeAutolockEnergyWithNow__classDebugEnabled)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      -[PLSpringBoardAgent lastEligibleAutolockEnergyComputationDate](self, "lastEligibleAutolockEnergyComputationDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("now=%@, self.lastEligibleAutolockEnergyComputationDate=%@"), v4, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent computeAutolockEnergyWithNow:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 576);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  -[PLSpringBoardAgent currentMediaTime](self, "currentMediaTime");
  v15 = v14;
  if (v14 != -1.0)
  {
    BKSHIDServicesLastUserEventTime();
    objc_msgSend(v4, "dateByAddingTimeInterval:", v16 - v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v18 = objc_opt_class();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __51__PLSpringBoardAgent_computeAutolockEnergyWithNow___block_invoke_222;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v45[4] = v18;
      if (computeAutolockEnergyWithNow__defaultOnce_220 != -1)
        dispatch_once(&computeAutolockEnergyWithNow__defaultOnce_220, v45);
      if (computeAutolockEnergyWithNow__classDebugEnabled_221)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lastUserEventDate=%@"), v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "lastPathComponent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent computeAutolockEnergyWithNow:]");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 582);

        PLLogCommon();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    -[PLSpringBoardAgent lastEligibleAutolockEnergyComputationDate](self, "lastEligibleAutolockEnergyComputationDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "laterDate:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v27 = objc_opt_class();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __51__PLSpringBoardAgent_computeAutolockEnergyWithNow___block_invoke_227;
      v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v44[4] = v27;
      if (computeAutolockEnergyWithNow__defaultOnce_225 != -1)
        dispatch_once(&computeAutolockEnergyWithNow__defaultOnce_225, v44);
      if (computeAutolockEnergyWithNow__classDebugEnabled_226)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("eligibleAutolockEnergyComputationDate=%@"), v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "lastPathComponent");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent computeAutolockEnergyWithNow:]");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 586);

        PLLogCommon();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    objc_msgSend(v4, "timeIntervalSinceDate:", v26);
    if (v34 > 60.0)
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v35 = objc_opt_class();
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __51__PLSpringBoardAgent_computeAutolockEnergyWithNow___block_invoke_232;
        v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v43[4] = v35;
        if (computeAutolockEnergyWithNow__defaultOnce_230 != -1)
          dispatch_once(&computeAutolockEnergyWithNow__defaultOnce_230, v43);
        if (computeAutolockEnergyWithNow__classDebugEnabled_231)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("computing autolock energy"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "lastPathComponent");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent computeAutolockEnergyWithNow:]");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "logMessage:fromFile:fromFunction:fromLineNumber:", v36, v39, v40, 590);

          PLLogCommon();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 9, &unk_1EA1DBD70, v26);

    }
    -[PLSpringBoardAgent setLastEligibleAutolockEnergyComputationDate:](self, "setLastEligibleAutolockEnergyComputationDate:", v4);

  }
}

uint64_t __51__PLSpringBoardAgent_computeAutolockEnergyWithNow___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  computeAutolockEnergyWithNow__classDebugEnabled = result;
  return result;
}

uint64_t __51__PLSpringBoardAgent_computeAutolockEnergyWithNow___block_invoke_222(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  computeAutolockEnergyWithNow__classDebugEnabled_221 = result;
  return result;
}

uint64_t __51__PLSpringBoardAgent_computeAutolockEnergyWithNow___block_invoke_227(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  computeAutolockEnergyWithNow__classDebugEnabled_226 = result;
  return result;
}

uint64_t __51__PLSpringBoardAgent_computeAutolockEnergyWithNow___block_invoke_232(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  computeAutolockEnergyWithNow__classDebugEnabled_231 = result;
  return result;
}

- (void)setLastReceivedPushEntry:(id)a3
{
  id v5;
  id *p_lastReceivedPushEntry;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  _BOOL4 v12;
  id v13;

  v5 = a3;
  p_lastReceivedPushEntry = (id *)&self->_lastReceivedPushEntry;
  v13 = v5;
  if (!v5)
    goto LABEL_4;
  if (!*p_lastReceivedPushEntry)
    goto LABEL_4;
  objc_msgSend(v5, "entryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*p_lastReceivedPushEntry, "entryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  v11 = v13;
  if (v10 > 0.0)
  {
LABEL_4:
    v12 = +[PLPushAgent isHighPriorityPushEntry:](PLPushAgent, "isHighPriorityPushEntry:", v13);
    v11 = v13;
    if (v12)
    {
      objc_storeStrong(p_lastReceivedPushEntry, a3);
      v11 = v13;
    }
  }

}

- (id)screenLock:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectiveValueForSetting:", *MEMORY[0x1E0D46F68]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "intValue") == 0x7FFFFFFF)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0xFFFFFFFFLL);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (void)resetAutoLockIsNil
{
  void *v3;
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  void *v7;
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

  -[PLSpringBoardAgent screenLock:](self, "screenLock:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue") == -1;

  -[PLSpringBoardAgent setAutoLockIsNil:](self, "setAutoLockIsNil:", v4);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __40__PLSpringBoardAgent_resetAutoLockIsNil__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v5;
    if (resetAutoLockIsNil_defaultOnce != -1)
      dispatch_once(&resetAutoLockIsNil_defaultOnce, &block);
    if (resetAutoLockIsNil_classDebugEnabled)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLSpringBoardAgent autoLockIsNil](self, "autoLockIsNil"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Value of autolock %@"), v7, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent resetAutoLockIsNil]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 617);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
}

uint64_t __40__PLSpringBoardAgent_resetAutoLockIsNil__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  resetAutoLockIsNil_classDebugEnabled = result;
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D46EC8], 0);

  v4.receiver = self;
  v4.super_class = (Class)PLSpringBoardAgent;
  -[PLAgent dealloc](&v4, sel_dealloc);
}

- (id)fetchSBWallpaperForType:(int)a3
{
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  char v10;
  void *v11;
  double v12;

  if (a3)
  {
    if (a3 != 1)
    {
      v8 = CFSTR("unknown");
      return v8;
    }
    v4 = CFSTR("kSBProceduralWallpaperLockDefaultKey");
    v5 = CFSTR("SBWallpaperParallaxFactorLockScreen");
  }
  else
  {
    v4 = CFSTR("kSBProceduralWallpaperHomeDefaultKey");
    v5 = CFSTR("SBWallpaperParallaxFactorHomeScreen");
  }
  objc_msgSend(MEMORY[0x1E0D7FFA0], "resetUserDefaultCacheForKey:forApplicationID:", v4, CFSTR("com.apple.springboard"));
  objc_msgSend(MEMORY[0x1E0D7FFA0], "resetUserDefaultCacheForKey:forApplicationID:", v5, CFSTR("com.apple.springboard"));
  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", v4, CFSTR("com.apple.springboard"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else if (a3 == 1
         && (objc_msgSend(MEMORY[0x1E0D7FFA0], "resetUserDefaultCacheForKey:forApplicationID:", CFSTR("SBWallpaperHasVideoKey"), CFSTR("com.apple.springboard")), objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("SBWallpaperHasVideoKey"), CFSTR("com.apple.springboard"), 1), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v9, "BOOLValue"), v9, (v10 & 1) != 0))
  {
    v8 = CFSTR("motion");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", v5, CFSTR("com.apple.springboard"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    if (v12 <= 0.0)
      v8 = CFSTR("still");
    else
      v8 = CFSTR("perspective");

  }
  return v8;
}

- (id)addCountsAndDurationsFor:(id)a3 toEntry:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t);
  void *v80;
  uint64_t v81;
  _QWORD block[5];
  _QWORD v83[5];
  _QWORD v84[5];
  _QWORD v85[5];
  _QWORD v86[5];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NSEStartTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NSEEndTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Waking"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("UIShown"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "BOOLValue");
  v14 = 0.0;
  if (v8 && v9)
  {
    objc_msgSend(v9, "doubleValue");
    v16 = v15;
    objc_msgSend(v8, "doubleValue");
    v18 = v16 - v17;
    if (v18 >= 0.0)
      v14 = v18;
    else
      v14 = 0.0;
  }
  v19 = -[PLSpringBoardAgent deviceIsCharging](self, "deviceIsCharging");
  if (v11)
  {
    if (v13)
    {
      if (v19)
      {
        objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1EA1C01E8, CFSTR("FgWakingPluggedInCount"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("FgWakingPluggedInNSEDuration"));

        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v21 = objc_opt_class();
          v86[0] = MEMORY[0x1E0C809B0];
          v86[1] = 3221225472;
          v86[2] = __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke;
          v86[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v86[4] = v21;
          if (addCountsAndDurationsFor_toEntry__defaultOnce != -1)
            dispatch_once(&addCountsAndDurationsFor_toEntry__defaultOnce, v86);
          if (addCountsAndDurationsFor_toEntry__classDebugEnabled)
          {
            v22 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FgWakingPluggedInCount"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FgWakingPluggedInNSEDuration"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "stringWithFormat:", CFSTR("Waking Fg plugged in count: %@, Waking Fg NSE duration: %@"), v23, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v26 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "lastPathComponent");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent addCountsAndDurationsFor:toEntry:]");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 724);

            PLLogCommon();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
LABEL_47:

          }
        }
      }
      else
      {
        objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1EA1C01E8, CFSTR("FgWakingCount"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v58, CFSTR("FgWakingNSEDuration"));

        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v59 = objc_opt_class();
          v85[0] = MEMORY[0x1E0C809B0];
          v85[1] = 3221225472;
          v85[2] = __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke_271;
          v85[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v85[4] = v59;
          if (addCountsAndDurationsFor_toEntry__defaultOnce_269 != -1)
            dispatch_once(&addCountsAndDurationsFor_toEntry__defaultOnce_269, v85);
          if (addCountsAndDurationsFor_toEntry__classDebugEnabled_270)
          {
            v60 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FgWakingCount"));
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FgWakingNSEDuration"));
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "stringWithFormat:", CFSTR("Waking Fg un-plugged count: %@, Waking Fg NSE duration: %@"), v61, v62);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v63 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "lastPathComponent");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent addCountsAndDurationsFor:toEntry:]");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v65, v66, 728);

            PLLogCommon();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
            goto LABEL_47;
          }
        }
      }
    }
    else if (v19)
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1EA1C01E8, CFSTR("BgWakingPluggedInCount"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v40, CFSTR("BgWakingPluggedInNSEDuration"));

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v41 = objc_opt_class();
        v84[0] = MEMORY[0x1E0C809B0];
        v84[1] = 3221225472;
        v84[2] = __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke_276;
        v84[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v84[4] = v41;
        if (addCountsAndDurationsFor_toEntry__defaultOnce_274 != -1)
          dispatch_once(&addCountsAndDurationsFor_toEntry__defaultOnce_274, v84);
        if (addCountsAndDurationsFor_toEntry__classDebugEnabled_275)
        {
          v42 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BgWakingPluggedInCount"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BgWakingPluggedInNSEDuration"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "stringWithFormat:", CFSTR("Waking Bg plugged in count: %@, Waking Bg NSE duration: %@"), v43, v44);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "lastPathComponent");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent addCountsAndDurationsFor:toEntry:]");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v47, v48, 734);

          PLLogCommon();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          goto LABEL_47;
        }
      }
    }
    else
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1EA1C01E8, CFSTR("BgWakingCount"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v67, CFSTR("BgWakingNSEDuration"));

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v68 = objc_opt_class();
        v83[0] = MEMORY[0x1E0C809B0];
        v83[1] = 3221225472;
        v83[2] = __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke_281;
        v83[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v83[4] = v68;
        if (addCountsAndDurationsFor_toEntry__defaultOnce_279 != -1)
          dispatch_once(&addCountsAndDurationsFor_toEntry__defaultOnce_279, v83);
        if (addCountsAndDurationsFor_toEntry__classDebugEnabled_280)
        {
          v69 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BgWakingCount"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BgWakingNSEDuration"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "stringWithFormat:", CFSTR("Waking Bg count: %@, Waking Bg NSE duration: %@"), v70, v71);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v72 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "lastPathComponent");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent addCountsAndDurationsFor:toEntry:]");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v74, v75, 738);

          PLLogCommon();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          goto LABEL_47;
        }
      }
    }
  }
  else if (v19)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1EA1C01E8, CFSTR("NonWakingPluggedInCount"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, CFSTR("NonWakingPluggedInNSEDuration"));

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v32 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke_286;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v32;
      if (addCountsAndDurationsFor_toEntry__defaultOnce_284 != -1)
        dispatch_once(&addCountsAndDurationsFor_toEntry__defaultOnce_284, block);
      if (addCountsAndDurationsFor_toEntry__classDebugEnabled_285)
      {
        v33 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NonWakingPluggedInCount"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NonWakingNSEDuration"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("Non-Waking plugged in count: %@, Non Waking NSE duration: %@"), v34, v35);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "lastPathComponent");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent addCountsAndDurationsFor:toEntry:]");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v38, v39, 746);

        PLLogCommon();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        goto LABEL_47;
      }
    }
  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1EA1C01E8, CFSTR("NonWakingCount"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v49, CFSTR("NonWakingNSEDuration"));

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v50 = objc_opt_class();
      v77 = MEMORY[0x1E0C809B0];
      v78 = 3221225472;
      v79 = __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke_291;
      v80 = &__block_descriptor_40_e5_v8__0lu32l8;
      v81 = v50;
      if (addCountsAndDurationsFor_toEntry__defaultOnce_289 != -1)
        dispatch_once(&addCountsAndDurationsFor_toEntry__defaultOnce_289, &v77);
      if (addCountsAndDurationsFor_toEntry__classDebugEnabled_290)
      {
        v51 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NonWakingCount"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NonWakingNSEDuration"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "stringWithFormat:", CFSTR("Non-Waking count: %@, Non Waking NSE duration: %@"), v52, v53, v77, v78, v79, v80, v81);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v54 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "lastPathComponent");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent addCountsAndDurationsFor:toEntry:]");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v56, v57, 751);

        PLLogCommon();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        goto LABEL_47;
      }
    }
  }

  return v6;
}

uint64_t __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addCountsAndDurationsFor_toEntry__classDebugEnabled = result;
  return result;
}

uint64_t __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke_271(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addCountsAndDurationsFor_toEntry__classDebugEnabled_270 = result;
  return result;
}

uint64_t __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke_276(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addCountsAndDurationsFor_toEntry__classDebugEnabled_275 = result;
  return result;
}

uint64_t __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke_281(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addCountsAndDurationsFor_toEntry__classDebugEnabled_280 = result;
  return result;
}

uint64_t __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke_286(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addCountsAndDurationsFor_toEntry__classDebugEnabled_285 = result;
  return result;
}

uint64_t __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke_291(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addCountsAndDurationsFor_toEntry__classDebugEnabled_290 = result;
  return result;
}

- (void)logNotification:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
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
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  _QWORD v41[5];
  _QWORD block[5];

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__PLSpringBoardAgent_logNotification___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (logNotification__defaultOnce != -1)
      dispatch_once(&logNotification__defaultOnce, block);
    if (logNotification__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Notification: %@"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent logNotification:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 759);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
  {
    +[PLOperator entryKeyForType:andName:](PLSpringBoardAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("SBNotifications"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v12);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TriggerType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("NotificationType"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("NotificationBundleID"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Waking"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("Waking"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NSEStartTime"));
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NSEEndTime"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NSEStartTime"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValue");
        objc_msgSend(v20, "dateWithTimeIntervalSinceReferenceDate:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "convertFromSystemToMonotonic");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, CFSTR("NSEStartTime"));

        v24 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NSEEndTime"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "doubleValue");
        objc_msgSend(v24, "dateWithTimeIntervalSinceReferenceDate:");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "convertFromSystemToMonotonic");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v27, CFSTR("NSEEndTime"));

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UIShown"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v28, CFSTR("UIShown"));

    -[PLOperator logEntry:](self, "logEntry:", v13);
  }
  +[PLOperator entryKeyForType:andName:](PLSpringBoardAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("SBNotifications_Aggregate"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v29);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TriggerType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, CFSTR("NotificationType"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleIdentifier"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, CFSTR("NotificationBundleID"));

  objc_msgSend(v30, "setObject:forKeyedSubscript:", &unk_1EA1C01E8, CFSTR("Count"));
  if (objc_msgSend(v31, "intValue") == 3 || !objc_msgSend(v31, "intValue"))
  {
    -[PLSpringBoardAgent addCountsAndDurationsFor:toEntry:](self, "addCountsAndDurationsFor:toEntry:", v4, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v34 = objc_opt_class();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __38__PLSpringBoardAgent_logNotification___block_invoke_302;
      v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v41[4] = v34;
      if (logNotification__defaultOnce_300 != -1)
        dispatch_once(&logNotification__defaultOnce_300, v41);
      if (logNotification__classDebugEnabled_301)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Notification Entry: %@"), v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "lastPathComponent");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent logNotification:]");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 791);

        PLLogCommon();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
  }
  else
  {
    v33 = v30;
  }
  -[PLOperator logEntry:](self, "logEntry:", v33);

}

uint64_t __38__PLSpringBoardAgent_logNotification___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logNotification__classDebugEnabled = result;
  return result;
}

uint64_t __38__PLSpringBoardAgent_logNotification___block_invoke_302(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logNotification__classDebugEnabled_301 = result;
  return result;
}

- (void)logMailNotification:(id)a3
{
  void *v4;
  int v5;
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
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD block[5];

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SectionIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobilemail"));

  if (v5)
  {
    +[PLOperator entryKeyForType:andName:](PLSpringBoardAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("SBNotifications_Aggregate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v6);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA1C0200, CFSTR("NotificationType"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("com.apple.mobilemail"), CFSTR("NotificationBundleID"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA1C01E8, CFSTR("Count"));
    if (-[PLSpringBoardAgent deviceIsCharging](self, "deviceIsCharging"))
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA1C01E8, CFSTR("NonWakingPluggedInCount"));
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_16;
      v8 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__PLSpringBoardAgent_logMailNotification___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v8;
      if (logMailNotification__defaultOnce != -1)
        dispatch_once(&logMailNotification__defaultOnce, block);
      if (!logMailNotification__classDebugEnabled)
        goto LABEL_16;
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NonWakingPluggedInCount"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("Non-Waking plugged in count: %@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent logMailNotification:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 813);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    }
    else
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA1C01E8, CFSTR("NonWakingCount"));
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_16;
      v17 = objc_opt_class();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __42__PLSpringBoardAgent_logMailNotification___block_invoke_314;
      v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v24[4] = v17;
      if (logMailNotification__defaultOnce_312 != -1)
        dispatch_once(&logMailNotification__defaultOnce_312, v24);
      if (!logMailNotification__classDebugEnabled_313)
        goto LABEL_16;
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NonWakingCount"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Non-Waking count: %@"), v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent logMailNotification:]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v22, v23, 816);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    }

LABEL_16:
    -[PLOperator logEntry:](self, "logEntry:", v7);

  }
}

uint64_t __42__PLSpringBoardAgent_logMailNotification___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logMailNotification__classDebugEnabled = result;
  return result;
}

uint64_t __42__PLSpringBoardAgent_logMailNotification___block_invoke_314(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logMailNotification__classDebugEnabled_313 = result;
  return result;
}

- (void)logBulletinPerEvent:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PLSpringBoardAgent logBulletinPerEvent:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  +[PLOperator entryKeyForType:andName:](PLSpringBoardAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("SBBulletins"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v13);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PostType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("PostType"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("BulletinBundleID"));
  -[PLOperator logEntry:](self, "logEntry:", v14);

}

- (void)logBulletinAggregate:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PLSpringBoardAgent logBulletinAggregate:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  +[PLOperator entryKeyForType:andName:](PLSpringBoardAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("SBBulletins_Aggregate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v13);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PostType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("PostType"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("BulletinBundleID"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1EA1C01E8, CFSTR("Count"));
  -[PLOperator logEntry:](self, "logEntry:", v14);

}

- (void)setUpScreenNumberDictionary
{
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = &unk_1EA1C0218;
  v5[0] = CFSTR("com.apple.Maps");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSpringBoardAgent setScreenNumberToName:](self, "setScreenNumberToName:", v3);

}

- (void)addAccountingEvent:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  unsigned int v12;
  unsigned int v13;
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
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD block[5];
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Screen"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  -[PLSpringBoardAgent lastSBEntry](self, "lastSBEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PLSpringBoardAgent lastSBEntry](self, "lastSBEntry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Screen"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

  }
  else
  {
    v12 = 0;
  }
  v13 = v7;

  -[PLSpringBoardAgent lastSBEntry](self, "lastSBEntry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14 || v12 != v13)
  {
    objc_msgSend(v4, "entryDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSpringBoardAgent closeLastOpenEventsWithStopDate:](self, "closeLastOpenEventsWithStopDate:", v15);

    -[PLSpringBoardAgent screenNumberToName](self, "screenNumberToName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v19 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__PLSpringBoardAgent_addAccountingEvent___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v19;
      if (addAccountingEvent__defaultOnce != -1)
        dispatch_once(&addAccountingEvent__defaultOnce, block);
      if (addAccountingEvent__classDebugEnabled)
      {
        v20 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("screenNumber unfiltered : %@"), v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "lastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSpringBoardAgent addAccountingEvent:]");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 889);

        PLLogCommon();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v18;
      v57[0] = &unk_1EA1DA838;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, v29, v30);

      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 2, v32, v33);

    }
    if (!v12 && v13 == 9)
    {
      -[PLSpringBoardAgent lastReceivedPushEntry](self, "lastReceivedPushEntry");
      v34 = objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v35 = (void *)v34;
        objc_msgSend(v4, "entryDate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLSpringBoardAgent lastReceivedPushEntry](self, "lastReceivedPushEntry");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "entryDate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "timeIntervalSinceDate:", v38);
        v40 = v39;

        if (v40 < 3.0)
        {
          objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLSpringBoardAgent lastReceivedPushEntry](self, "lastReceivedPushEntry");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("BundleID"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v43;
          v54 = &unk_1EA1DA838;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "entryDate");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "createDistributionEventPointWithDistributionID:withChildNodeNameToWeight:withStartDate:", 28, v44, v45);

          objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLSpringBoardAgent lastReceivedPushEntry](self, "lastReceivedPushEntry");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("BundleID"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v48;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "entryDate");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 10, v49, v50);

        }
      }
    }
    -[PLSpringBoardAgent setLastSBEntry:](self, "setLastSBEntry:", v4);

  }
}

uint64_t __41__PLSpringBoardAgent_addAccountingEvent___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addAccountingEvent__classDebugEnabled = result;
  return result;
}

- (void)closeLastOpenEventsWithStopDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[PLSpringBoardAgent lastSBEntry](self, "lastSBEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLSpringBoardAgent lastSBEntry](self, "lastSBEntry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Screen"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    -[PLSpringBoardAgent lastReceivedPushEntry](self, "lastReceivedPushEntry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (v8 == 9)
      {
        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "createDistributionEventPointWithDistributionID:withChildNodeNameToWeight:withStartDate:", 28, MEMORY[0x1E0C9AA70], v12);

        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 10, MEMORY[0x1E0C9AA60], v12);

        -[PLSpringBoardAgent setLastReceivedPushEntry:](self, "setLastReceivedPushEntry:", 0);
      }
    }
  }

}

- (PLNSNotificationOperatorComposition)notificationSBScreenTimeTrackingChanged
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (PLCFNotificationOperatorComposition)notificationSBLockTrackingChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (PLCFNotificationOperatorComposition)notificationSBBlankTrackingChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (PLNSNotificationOperatorComposition)notificationSBWallpaperTrackingChanged
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (PLNSNotificationOperatorComposition)notificationSBAutoLockTimerFiredNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (PLTimer)dailyWallpaperPoll
{
  return (PLTimer *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDailyWallpaperPoll:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)autoLockIsNil
{
  return self->_autoLockIsNil;
}

- (void)setAutoLockIsNil:(BOOL)a3
{
  self->_autoLockIsNil = a3;
}

- (PLEntryNotificationOperatorComposition)displayOnNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDisplayOnNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (PLEntryNotificationOperatorComposition)displayOffNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDisplayOffNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLEntryNotificationOperatorComposition)receivedPushNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setReceivedPushNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PLXPCListenerOperatorComposition)userNotificationRequestEvent
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (PLXPCListenerOperatorComposition)userNotificationTriggerEvent
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (PLXPCListenerOperatorComposition)bulletinBoardNotificationPublishEvent
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (PLMonotonicTimer)autolockEnergyPeriodicTimer
{
  return (PLMonotonicTimer *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAutolockEnergyPeriodicTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSDate)lastEligibleAutolockEnergyComputationDate
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLastEligibleAutolockEnergyComputationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSDictionary)screenNumberToName
{
  return (NSDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setScreenNumberToName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (BOOL)deviceIsCharging
{
  return self->_deviceIsCharging;
}

- (void)setDeviceIsCharging:(BOOL)a3
{
  self->_deviceIsCharging = a3;
}

- (PLEntryNotificationOperatorComposition)deviceChargingStateNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDeviceChargingStateNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (PLEntry)lastSBEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLastSBEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (PLEntry)lastReceivedPushEntry
{
  return self->_lastReceivedPushEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReceivedPushEntry, 0);
  objc_storeStrong((id *)&self->_lastSBEntry, 0);
  objc_storeStrong((id *)&self->_deviceChargingStateNotification, 0);
  objc_storeStrong((id *)&self->_screenNumberToName, 0);
  objc_storeStrong((id *)&self->_lastEligibleAutolockEnergyComputationDate, 0);
  objc_storeStrong((id *)&self->_autolockEnergyPeriodicTimer, 0);
  objc_storeStrong((id *)&self->_bulletinBoardNotificationPublishEvent, 0);
  objc_storeStrong((id *)&self->_userNotificationTriggerEvent, 0);
  objc_storeStrong((id *)&self->_userNotificationRequestEvent, 0);
  objc_storeStrong((id *)&self->_receivedPushNotification, 0);
  objc_storeStrong((id *)&self->_displayOffNotification, 0);
  objc_storeStrong((id *)&self->_displayOnNotification, 0);
  objc_storeStrong((id *)&self->_dailyWallpaperPoll, 0);
  objc_storeStrong((id *)&self->_notificationSBAutoLockTimerFiredNotification, 0);
  objc_storeStrong((id *)&self->_notificationSBWallpaperTrackingChanged, 0);
  objc_storeStrong((id *)&self->_notificationSBBlankTrackingChanged, 0);
  objc_storeStrong((id *)&self->_notificationSBLockTrackingChanged, 0);
  objc_storeStrong((id *)&self->_notificationSBScreenTimeTrackingChanged, 0);
}

void __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_180_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "PLSpringBoardAgent:Request payload =%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)logBulletinPerEvent:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, a1, a3, "PLSpringBoardAgent:Request logging in Event Point table", a5, a6, a7, a8, 0);
}

- (void)logBulletinAggregate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, a1, a3, "PLSpringBoardAgent:Request logging in Aggregate table", a5, a6, a7, a8, 0);
}

@end
