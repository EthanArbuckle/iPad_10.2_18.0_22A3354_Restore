@implementation PLApplicationAgent

+ (id)defaults
{
  return &unk_1EA1D7838;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLApplicationAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (void)addAppVersion:(id)a3 withVersion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if (addAppVersion_withVersion__onceToken != -1)
    dispatch_once(&addAppVersion_withVersion__onceToken, &__block_literal_global_62);
  if (v7 && v5)
  {
    v6 = (id)_appVersions;
    objc_sync_enter(v6);
    objc_msgSend((id)_appVersions, "setObject:forKey:", v5, v7);
    objc_sync_exit(v6);

  }
}

void __48__PLApplicationAgent_addAppVersion_withVersion___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_appVersions;
  _appVersions = v0;

}

+ (void)removeAppVersion:(id)a3 forVersion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  v5 = a4;
  if (v5 && v9 && _appVersions)
  {
    v6 = (id)_appVersions;
    objc_sync_enter(v6);
    objc_msgSend((id)_appVersions, "objectForKeyedSubscript:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v5);

    if (v8)
      objc_msgSend((id)_appVersions, "removeObjectForKey:", v9);
    objc_sync_exit(v6);

  }
}

+ (id)appVersionForBundle:(id)a3
{
  id v3;
  id v4;
  __CFString *v5;

  v3 = a3;
  if (_appVersions)
  {
    v4 = (id)_appVersions;
    objc_sync_enter(v4);
    objc_msgSend((id)_appVersions, "objectForKeyedSubscript:", v3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v4);

  }
  else
  {
    v5 = &stru_1EA174678;
  }

  return v5;
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
  void *v11;
  _QWORD v13[8];
  _QWORD v14[9];

  v14[8] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("SuggestedWidgetReload");
  objc_msgSend(a1, "entryEventPointDefinitionSuggestedWidgetReload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("WidgetUpdates");
  objc_msgSend(a1, "entryEventPointDefinitionWidgetUpdates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  v13[2] = CFSTR("ApplicationExitReason");
  objc_msgSend(a1, "entryEventPointDefinitionApplicationExitReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  v13[3] = CFSTR("AppDocking");
  objc_msgSend(a1, "entryEventPointDefinitionAppDocking");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v6;
  v13[4] = CFSTR("AppPrewarm");
  objc_msgSend(a1, "entryEventPointDefinitionAppPrewarm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v7;
  v13[5] = CFSTR("PosterUpdates");
  objc_msgSend(a1, "entryEventPointDefinitionPosterUpdates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v8;
  v13[6] = CFSTR("LiveActivityUpdates");
  objc_msgSend(a1, "entryEventPointDefinitionLiveActivityUpdates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v9;
  v13[7] = CFSTR("ControlCenterUpdates");
  objc_msgSend(a1, "entryEventPointDefinitionControlCenterUpdates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitionSuggestedWidgetReload
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
  v18[0] = &unk_1EA1DA718;
  v18[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat_withBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("kind");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("size");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("suggestionIdentifier");
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

+ (id)entryEventPointDefinitionWidgetUpdates
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
  _QWORD v25[9];
  _QWORD v26[9];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[4];

  v30[2] = *MEMORY[0x1E0C80C00];
  v29[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v27[0] = *MEMORY[0x1E0D80318];
  v27[1] = v2;
  v28[0] = &unk_1EA1DA728;
  v28[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v24;
  v29[1] = *MEMORY[0x1E0D802F0];
  v25[0] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_StringFormat_withBundleID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v22;
  v25[1] = CFSTR("cost");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v20;
  v25[2] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_StringFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v18;
  v25[3] = CFSTR("kind");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v16;
  v25[4] = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v14;
  v25[5] = CFSTR("remainingBudget");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v4;
  v25[6] = CFSTR("suggestionIdentifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v6;
  v25[7] = CFSTR("executionTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[7] = v8;
  v25[8] = CFSTR("host");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionPosterUpdates
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
  v16[0] = &unk_1EA1DA718;
  v16[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("Reason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("updateType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitionLiveActivityUpdates
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
  _QWORD v21[7];
  _QWORD v22[7];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[4];

  v26[2] = *MEMORY[0x1E0C80C00];
  v25[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v23[0] = *MEMORY[0x1E0D80318];
  v23[1] = v2;
  v24[0] = &unk_1EA1DA738;
  v24[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v20;
  v25[1] = *MEMORY[0x1E0D802F0];
  v21[0] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_StringFormat_withBundleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  v21[1] = CFSTR("activityIdentifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  v21[2] = CFSTR("source");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v14;
  v21[3] = CFSTR("pushPriority");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v4;
  v21[4] = CFSTR("isAlert");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v6;
  v21[5] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v8;
  v21[6] = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionApplicationExitReason
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
  v18[0] = &unk_1EA1DA748;
  v18[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("Identifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat_withBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("pid");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("Reason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("Subcode");
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

+ (id)entryEventPointDefinitionAppDocking
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
  v16[0] = &unk_1EA1DA718;
  v16[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("PID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitionAppPrewarm
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
  v2 = *MEMORY[0x1E0D80250];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1EA1DA718;
  v14[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("PID");
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

+ (id)entryEventPointDefinitionControlCenterUpdates
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
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1EA1DA718;
  v20[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat_withBundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("location");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("executionTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_RealFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardDefinitions
{
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
  _QWORD v15[10];
  _QWORD v16[12];

  v16[10] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("Application");
  objc_msgSend(a1, "entryEventForwardDefinitionApplication");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  v15[1] = CFSTR("ApplicationDidUninstall");
  objc_msgSend(a1, "entryEventForwardDefinitionApplicationDidUninstall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v3;
  v15[2] = CFSTR("SystemAperture");
  objc_msgSend(a1, "entryEventForwardDefinitionSystemAperture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v4;
  v15[3] = CFSTR("LiveActivityStats");
  objc_msgSend(a1, "entryEventForwardDefinitionLiveActivityStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v5;
  v15[4] = CFSTR("HomeScreenConfiguration");
  objc_msgSend(a1, "entryEventForwardDefinitionHomeScreenConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v6;
  v15[5] = CFSTR("AmbientMode");
  objc_msgSend(a1, "entryEventForwardDefinitionAmbientMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v7;
  v15[6] = CFSTR("HomeScreenPresentation");
  objc_msgSend(a1, "entryEventForwardDefinitionHomeScreenPresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v8;
  v15[7] = CFSTR("AmbientModeActiveFace");
  objc_msgSend(a1, "entryEventForwardDefinitionAmbientActiveFace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v9;
  v15[8] = CFSTR("AmbientModeLifetimeCounter");
  objc_msgSend(a1, "entryEventForwardDefinitionAmbientModeLifetimeCounter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v10;
  v15[9] = CFSTR("MotionToWake");
  objc_msgSend(a1, "entryEventForwardDefinitionMotionToWake");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardDefinitionApplication
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
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[3];
  _QWORD v23[5];

  v23[3] = *MEMORY[0x1E0C80C00];
  v22[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v20[0] = *MEMORY[0x1E0D80318];
  v20[1] = v2;
  v21[0] = &unk_1EA1DA758;
  v21[1] = MEMORY[0x1E0C9AAB0];
  v3 = *MEMORY[0x1E0D802F8];
  v20[2] = *MEMORY[0x1E0D80320];
  v20[3] = v3;
  v21[2] = &unk_1EA1DBC80;
  v21[3] = CFSTR("logEventPointApplication");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v4;
  v22[1] = *MEMORY[0x1E0D802F0];
  v18[0] = CFSTR("Identifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat_withBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  v18[1] = CFSTR("pid");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v8;
  v18[2] = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v10;
  v18[3] = CFSTR("Reason");
  v11 = *MEMORY[0x1E0D80350];
  v16[0] = *MEMORY[0x1E0D80358];
  v16[1] = v11;
  v17[0] = &unk_1EA1C0020;
  v17[1] = &unk_1EA1C0038;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = *MEMORY[0x1E0D80260];
  v23[1] = v13;
  v23[2] = &unk_1EA1DBC98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)entryEventForwardDefinitionApplicationDidUninstall
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
  v2 = *MEMORY[0x1E0D80340];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1EA1DA758;
  v14[1] = &unk_1EA1C0050;
  v13[2] = *MEMORY[0x1E0D80338];
  v14[2] = &unk_1EA1DA768;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("AppBundleId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("AppName");
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

+ (id)entryEventForwardDefinitionSystemAperture
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
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1EA1DA718;
  v20[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("PrimaryClient");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat_withBundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("PrimaryElement");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("SecondaryClient");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat_withBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("SecondaryElement");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("Layout");
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

+ (id)entryEventForwardDefinitionLiveActivityStats
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
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1EA1DA748;
  v20[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat_withBundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("activityIdentifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("source");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("eventType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("updateBudget");
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

+ (id)entryEventForwardDefinitionHomeScreenConfiguration
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitionAmbientMode
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
  v13 = &unk_1EA1DA718;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("Mode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("Enabled");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventForwardDefinitionHomeScreenPresentation
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitionAmbientActiveFace
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
  v13 = &unk_1EA1DA718;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("ActiveFaceType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("ActiveFaceDescriptor");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventForwardDefinitionAmbientModeLifetimeCounter
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
  v11 = &unk_1EA1DA718;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("LifetimePresentationCounter");
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

+ (id)entryEventForwardDefinitionMotionToWake
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
  v11 = &unk_1EA1DA718;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("Enabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventBackwardDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("ApplicationMemory");
  objc_msgSend(a1, "entryEventBackwardDefinitionApplicationMemory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("WidgetStats");
  objc_msgSend(a1, "entryEventBackwardDefinitionWidgetStats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("ControlCenterStats");
  objc_msgSend(a1, "entryEventBackwardDefinitionControlCenterStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventBackwardDefinitionApplicationMemory
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
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v16[0] = *MEMORY[0x1E0D80318];
  v16[1] = v2;
  v17[0] = &unk_1EA1DA718;
  v17[1] = MEMORY[0x1E0C9AAB0];
  v3 = *MEMORY[0x1E0D80338];
  v16[2] = *MEMORY[0x1E0D80340];
  v16[3] = v3;
  v17[2] = &unk_1EA1C0050;
  v17[3] = &unk_1EA1DA778;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("AppBundleId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat_withBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v14[1] = CFSTR("SuspendedMemory");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v8;
  v14[2] = CFSTR("PeakMemory");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionWidgetStats
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
  _QWORD v29[11];
  _QWORD v30[11];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  v33[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v31[0] = *MEMORY[0x1E0D80318];
  v31[1] = v2;
  v32[0] = &unk_1EA1DA748;
  v32[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v28;
  v33[1] = *MEMORY[0x1E0D802F0];
  v29[0] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_StringFormat_withBundleID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v26;
  v29[1] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_StringFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v24;
  v29[2] = CFSTR("isInStack");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_BoolFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v22;
  v29[3] = CFSTR("kind");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_StringFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v20;
  v29[4] = CFSTR("location");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v18;
  v29[5] = CFSTR("page");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v16;
  v29[6] = CFSTR("size");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v14;
  v29[7] = CFSTR("suggestionIdentifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v4;
  v29[8] = CFSTR("totalFramesRendered");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v6;
  v29[9] = CFSTR("totalRenderWorkload");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v8;
  v29[10] = CFSTR("totalTimeSpentOnScreen");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_RealFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionControlCenterStats
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
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[4];

  v24[2] = *MEMORY[0x1E0C80C00];
  v23[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v21[0] = *MEMORY[0x1E0D80318];
  v21[1] = v2;
  v22[0] = &unk_1EA1DA718;
  v22[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E0D802F0];
  v19[0] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat_withBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v19[1] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  v19[2] = CFSTR("kind");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v4;
  v19[3] = CFSTR("location");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v6;
  v19[4] = CFSTR("stateBased");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v8;
  v19[5] = CFSTR("totalTimeSpentOnScreen");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_RealFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventNoneDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("AllApps");
  +[PLApplicationAgent entryEventNoneAllApps](PLApplicationAgent, "entryEventNoneAllApps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("AllPlugins");
  v7[0] = v2;
  +[PLApplicationAgent entryEventNoneAllPlugins](PLApplicationAgent, "entryEventNoneAllPlugins");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)entryEventNoneAllApps
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[18];
  _QWORD v45[18];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[3];
  _QWORD v49[5];

  v49[3] = *MEMORY[0x1E0C80C00];
  v48[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v46[0] = *MEMORY[0x1E0D80318];
  v46[1] = v2;
  v47[0] = &unk_1EA1DA788;
  v47[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80340];
  v46[2] = *MEMORY[0x1E0D80250];
  v46[3] = v3;
  v47[2] = MEMORY[0x1E0C9AAB0];
  v47[3] = &unk_1EA1C0068;
  v46[4] = *MEMORY[0x1E0D80328];
  v47[4] = CFSTR("AppBundleId");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 5);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v43;
  v48[1] = *MEMORY[0x1E0D802F0];
  v44[0] = CFSTR("AppBundleId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "commonTypeDict_StringFormat_withBundleID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v41;
  v44[1] = CFSTR("AppName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "commonTypeDict_StringFormat_withAppName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v39;
  v44[2] = CFSTR("AppBuildVersion");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "commonTypeDict_StringFormat");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v37;
  v44[3] = CFSTR("AppBundleVersion");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "commonTypeDict_StringFormat");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v35;
  v44[4] = CFSTR("AppExecutable");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "commonTypeDict_StringFormat_withProcessName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v33;
  v44[5] = CFSTR("AppVendorID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_StringFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v31;
  v44[6] = CFSTR("AppItemID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v29;
  v44[7] = CFSTR("AppCohort");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonTypeDict_StringFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v45[7] = v27;
  v44[8] = CFSTR("AppStoreFront");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v45[8] = v25;
  v44[9] = CFSTR("AppDistributorID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_StringFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v45[9] = v23;
  v44[10] = CFSTR("AppIsBeta");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_BoolFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v45[10] = v21;
  v44[11] = CFSTR("AppIs3rdParty");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_BoolFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45[11] = v19;
  v44[12] = CFSTR("AppIsClip");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_BoolFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45[12] = v17;
  v44[13] = CFSTR("AppArchitecture");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_StringFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[13] = v15;
  v44[14] = CFSTR("AppUUID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v45[14] = v5;
  v44[15] = CFSTR("AppDeletedDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45[15] = v7;
  v44[16] = CFSTR("AppType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v45[16] = v9;
  v44[17] = CFSTR("AppUpdatedDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v45[17] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = *MEMORY[0x1E0D802D8];
  v49[1] = v12;
  v49[2] = &unk_1EA1DBCB0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryEventNoneAllPlugins
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
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[3];
  _QWORD v23[5];

  v23[3] = *MEMORY[0x1E0C80C00];
  v22[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v20[0] = *MEMORY[0x1E0D80318];
  v20[1] = v2;
  v21[0] = &unk_1EA1DA758;
  v21[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80328];
  v20[2] = *MEMORY[0x1E0D80340];
  v20[3] = v3;
  v21[2] = &unk_1EA1C0068;
  v21[3] = CFSTR("PluginId");
  v20[4] = *MEMORY[0x1E0D80250];
  v21[4] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E0D802F0];
  v18[0] = CFSTR("PluginId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_StringFormat_withBundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v18[1] = CFSTR("PluginParentApp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v5;
  v18[2] = CFSTR("PluginType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v7;
  v18[3] = CFSTR("PluginExecutableName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat_withProcessName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v9;
  v18[4] = CFSTR("PluginDeletedDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = *MEMORY[0x1E0D802D8];
  v23[1] = v12;
  v23[2] = &unk_1EA1DBCC8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryAggregateDefinitions
{
  void *v3;
  void *v4;
  void **v5;
  const __CFString **v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "isDebugEnabledForKey:", CFSTR("Aggregate")))
  {
    v11 = CFSTR("ApplicationReason");
    objc_msgSend(a1, "entryAggregateDefinitionApplicationReason");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v3;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = (void **)v12;
    v6 = &v11;
  }
  else
  {
    v9 = CFSTR("WidgetUpdates");
    objc_msgSend(a1, "entryAggregateDefintionWidgetUpdates");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v3;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = &v10;
    v6 = &v9;
  }
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryAggregateDefinitionApplicationReason
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[4];
  _QWORD v29[6];

  v29[4] = *MEMORY[0x1E0C80C00];
  v28[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v26[0] = *MEMORY[0x1E0D80318];
  v26[1] = v2;
  v27[0] = &unk_1EA1DA718;
  v27[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v15;
  v28[1] = *MEMORY[0x1E0D802F0];
  v24[0] = CFSTR("Reason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = CFSTR("Count");
  v25[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v7;
  v28[2] = *MEMORY[0x1E0D80228];
  v22[0] = &unk_1EA1DA798;
  v20 = *MEMORY[0x1E0D80220];
  v8 = v20;
  v21 = &unk_1EA1DA7A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v9;
  v22[1] = &unk_1EA1DA7A8;
  v18 = v8;
  v19 = &unk_1EA1DA7B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v10;
  v22[2] = &unk_1EA1DA7B8;
  v16 = v8;
  v17 = &unk_1EA1DA7C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = *MEMORY[0x1E0D80238];
  v29[2] = v12;
  v29[3] = &unk_1EA1DBCE0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryAggregateDefintionWidgetUpdates
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
  v2 = *MEMORY[0x1E0D80300];
  v21[0] = *MEMORY[0x1E0D80318];
  v21[1] = v2;
  v22[0] = &unk_1EA1DA718;
  v22[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v23[1] = *MEMORY[0x1E0D802F0];
  v19[0] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  v19[1] = CFSTR("host");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  v19[2] = CFSTR("Count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v9;
  v23[2] = *MEMORY[0x1E0D80228];
  v17 = &unk_1EA1DA7D8;
  v15 = *MEMORY[0x1E0D80220];
  v16 = &unk_1EA1DA7B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = *MEMORY[0x1E0D80238];
  v24[2] = v11;
  v24[3] = &unk_1EA1DBCF8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (PLApplicationAgent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLApplicationAgent;
  return -[PLAgent init](&v3, sel_init);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3 != v4)
      {
        objc_msgSend(v3, "removeObserver:", self);
        objc_msgSend(v3, "_LSClearSchemaCaches");
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("PLAppDeletionActivityComplete"), 0);

  }
  v6.receiver = self;
  v6.super_class = (Class)PLApplicationAgent;
  -[PLAgent dealloc](&v6, sel_dealloc);
}

- (void)sendApplicationMetadataToCA
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Logging all Installed Applications' BundleID/DistributorID to CA", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

id __49__PLApplicationAgent_sendApplicationMetadataToCA__block_invoke(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v1 = CFSTR("nil");
  v4[0] = CFSTR("AppBundleId");
  v4[1] = CFSTR("AppDistributorID");
  v2 = *(const __CFString **)(a1 + 32);
  if (!v2)
    v2 = CFSTR("nil");
  if (*(_QWORD *)(a1 + 40))
    v1 = *(const __CFString **)(a1 + 40);
  v5[0] = v2;
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)initOperatorDependancies
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Not invoking initOperatorDependancies for powerlogHelperd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  NSObject *v2;

  PLLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __46__PLApplicationAgent_initOperatorDependancies__block_invoke_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "sendApplicationMetadataToCA");
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_255(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2;
  block[3] = &unk_1EA16D040;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayIdentifiersDidChange");
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  _QWORD block[5];

  v2 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v3 = MEMORY[0x1E0C809B0];
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_4;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_defaultOnce != -1)
      dispatch_once(&kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_defaultOnce, block);
    if (kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLApplicationAgent_RefreshAllsAppsAndPlugins callback initiated"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLApplicationAgent initOperatorDependancies]_block_invoke_3");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 859);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_264;
  v11[3] = &unk_1EA16D040;
  v11[4] = *(_QWORD *)(a1 + 32);
  dispatch_async_and_wait(v10, v11);

}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_classDebugEnabled = result;
  return result;
}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke_264(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_265;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_2_defaultOnce != -1)
      dispatch_once(&kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_2_defaultOnce, block);
    if (kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_2_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLApplicationAgent_RefreshAllsAppsAndPlugins callback running"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLApplicationAgent initOperatorDependancies]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 863);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "refreshAllAppsAndPlugins");
}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_265(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_2_classDebugEnabled = result;
  return result;
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_274(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  int v20;

  v3 = *MEMORY[0x1E0CFE2C8];
  v4 = a2;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "intValue");
  else
    v6 = -1;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CFE2A8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CFE2C0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CFE2D8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_276;
  block[3] = &unk_1EA16E8A0;
  objc_copyWeak(&v19, (id *)(a1 + 32));
  v20 = v6;
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_276(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  _DWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  _DWORD *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  _DWORD *v24;
  id v25;
  __CFString *v26;
  size_t size;
  rusage_info_t buffer[2];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  int out[12];
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "logEventPointApplicationForDisplayID:withPid:withState:withReasons:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  if (+[PLUtilities isAppAnalyticsEnabled](PLUtilities, "isAppAnalyticsEnabled")
    && (int)objc_msgSend(*(id *)(a1 + 40), "intValue") >= 4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("AppBundleId"), *(_QWORD *)(a1 + 32), 0);
    +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllApps"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "storage");
    v7 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    v48[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastEntryForKey:withComparisons:isSingleton:", v5, v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    *(_OWORD *)buffer = 0u;
    v29 = 0u;
    if (proc_pid_rusage(*(_DWORD *)(a1 + 64), 0, buffer))
    {
      v10 = 0;
    }
    else
    {
      memset(out, 0, 37);
      uuid_unparse((const unsigned __int8 *)buffer, (char *)out);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", out);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    size = 0;
    *(_QWORD *)out = 0xE00000001;
    v15 = *(_DWORD *)(a1 + 64);
    out[2] = 1;
    out[3] = v15;
    if (sysctl(out, 4u, 0, &size, 0, 0) < 0 || (v16 = malloc_type_malloc(size, 0x49ABEC14uLL)) == 0)
    {
      v18 = 0;
      if (!v10)
        goto LABEL_23;
    }
    else
    {
      v7 = v16;
      if (sysctl(out, 4u, v16, &size, 0, 0) < 0)
      {
        v18 = 0;
      }
      else
      {
        if ((v7[8] & 4) != 0)
          v17 = CFSTR("arm-64bit");
        else
          v17 = CFSTR("arm-32bit");
        v18 = v17;
      }
      free(v7);
      if (!v10)
      {
LABEL_23:
        if (!v18)
        {
LABEL_29:

          return;
        }
        goto LABEL_24;
      }
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppUUID"));
    v7 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", v7) & 1) == 0)
    {

LABEL_27:
      v21 = objc_loadWeakRetained(v2);
      objc_msgSend(v21, "storage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_3_283;
      v23[3] = &unk_1EA16DCE0;
      v24 = v9;
      v25 = v10;
      v26 = v18;
      objc_msgSend(v22, "updateEntry:withBlock:", v24, v23);

      v7 = v24;
LABEL_28:

      goto LABEL_29;
    }
    if (!v18)
      goto LABEL_28;
LABEL_24:
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppArchitecture"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[__CFString isEqualToString:](v18, "isEqualToString:", v19);

    if (v10)
    if ((v20 & 1) != 0)
      goto LABEL_29;
    goto LABEL_27;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "intValue") == 2)
  {
    v46 = 0;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    *(_OWORD *)buffer = 0u;
    v29 = 0u;
    if (!proc_pid_rusage(*(_DWORD *)(a1 + 64), 4, buffer))
    {
      v11 = objc_loadWeakRetained(v2);
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v32 + 1));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v43);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logEventBackwardApplicationMemoryWithBundleId:withSuspendedMemory:withPeakMemory:", v12, v13, v14);

    }
  }
}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke_3_283(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("AppUUID"));
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("AppArchitecture"));
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_4_285(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id WeakRetained;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  id v31;
  id v32;
  id v33;
  int v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "previousState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "taskState");

  objc_msgSend(v7, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "taskState");

  objc_msgSend(v7, "previousState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[PLApplicationAgent isVisible:](PLApplicationAgent, "isVisible:", v12);

  objc_msgSend(v7, "state");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[PLApplicationAgent isVisible:](PLApplicationAgent, "isVisible:", v14);

  if (v9 != (_DWORD)v11 || v13 != v15)
  {
    v16 = objc_msgSend(v6, "pid");
    objc_msgSend(v6, "bundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "state");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "assertions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLApplicationAgent getReasons:](PLApplicationAgent, "getReasons:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109890;
      v36 = v16;
      v37 = 2112;
      v38 = v18;
      v39 = 1024;
      v40 = v11;
      v41 = 2112;
      v42 = v21;
      _os_log_debug_impl(&dword_1DA9D6000, v22, OS_LOG_TYPE_DEBUG, "pid: %d, name: %@, state: %d, reasons: %@", buf, 0x22u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "workQueue");
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_286;
    block[3] = &unk_1EA16E8A0;
    objc_copyWeak(&v33, (id *)(a1 + 32));
    v34 = v16;
    v30 = v18;
    v31 = v23;
    v32 = v21;
    v26 = v21;
    v27 = v23;
    v28 = v18;
    dispatch_async(v25, block);

    objc_destroyWeak(&v33);
  }

}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_286(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  _DWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  _DWORD *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  _DWORD *v24;
  id v25;
  __CFString *v26;
  size_t size;
  rusage_info_t buffer[2];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  int out[12];
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "logEventPointApplicationForDisplayID:withPid:withState:withReasons:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  if (+[PLUtilities isAppAnalyticsEnabled](PLUtilities, "isAppAnalyticsEnabled")
    && (int)objc_msgSend(*(id *)(a1 + 40), "intValue") >= 4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("AppBundleId"), *(_QWORD *)(a1 + 32), 0);
    +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllApps"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "storage");
    v7 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    v48[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastEntryForKey:withComparisons:isSingleton:", v5, v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    *(_OWORD *)buffer = 0u;
    v29 = 0u;
    if (proc_pid_rusage(*(_DWORD *)(a1 + 64), 0, buffer))
    {
      v10 = 0;
    }
    else
    {
      memset(out, 0, 37);
      uuid_unparse((const unsigned __int8 *)buffer, (char *)out);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", out);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    size = 0;
    *(_QWORD *)out = 0xE00000001;
    v15 = *(_DWORD *)(a1 + 64);
    out[2] = 1;
    out[3] = v15;
    if (sysctl(out, 4u, 0, &size, 0, 0) < 0 || (v16 = malloc_type_malloc(size, 0x527A8535uLL)) == 0)
    {
      v18 = 0;
      if (!v10)
        goto LABEL_23;
    }
    else
    {
      v7 = v16;
      if (sysctl(out, 4u, v16, &size, 0, 0) < 0)
      {
        v18 = 0;
      }
      else
      {
        if ((v7[8] & 4) != 0)
          v17 = CFSTR("arm-64bit");
        else
          v17 = CFSTR("arm-32bit");
        v18 = v17;
      }
      free(v7);
      if (!v10)
      {
LABEL_23:
        if (!v18)
        {
LABEL_29:

          return;
        }
        goto LABEL_24;
      }
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppUUID"));
    v7 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", v7) & 1) == 0)
    {

LABEL_27:
      v21 = objc_loadWeakRetained(v2);
      objc_msgSend(v21, "storage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_287;
      v23[3] = &unk_1EA16DCE0;
      v24 = v9;
      v25 = v10;
      v26 = v18;
      objc_msgSend(v22, "updateEntry:withBlock:", v24, v23);

      v7 = v24;
LABEL_28:

      goto LABEL_29;
    }
    if (!v18)
      goto LABEL_28;
LABEL_24:
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppArchitecture"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[__CFString isEqualToString:](v18, "isEqualToString:", v19);

    if (v10)
    if ((v20 & 1) != 0)
      goto LABEL_29;
    goto LABEL_27;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "intValue") == 3)
  {
    v46 = 0;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    *(_OWORD *)buffer = 0u;
    v29 = 0u;
    if (!proc_pid_rusage(*(_DWORD *)(a1 + 64), 4, buffer))
    {
      v11 = objc_loadWeakRetained(v2);
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v32 + 1));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v43);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logEventBackwardApplicationMemoryWithBundleId:withSuspendedMemory:withPeakMemory:", v12, v13, v14);

    }
  }
}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_287(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("AppUUID"));
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("AppArchitecture"));
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_3_290(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D87DA0];
  v4 = a2;
  objc_msgSend(v3, "predicateMatchingProcessTypeApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicates:", v6);

  objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValues:", 25);
  objc_msgSend(v7, "setEndowmentNamespaces:", &unk_1EA1DBD10);
  objc_msgSend(v4, "setStateDescriptor:", v7);
  v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v4, "setUpdateHandler:", v8);

}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_309(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogApplication();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLApplicationAgent_initOperatorDependancies__block_invoke_309_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardWidgetStats:", v6);
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogApplication();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLApplicationAgent_initOperatorDependancies__block_invoke_314_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventPointWidgetUpdates:", v6);
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_318(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogApplication();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLApplicationAgent_initOperatorDependancies__block_invoke_318_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventPointSuggestedWidgetReload:", v6);
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_323(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogApplication();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLApplicationAgent_initOperatorDependancies__block_invoke_323_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventPointPosterUpdates:", v6);
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogApplication();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLApplicationAgent_initOperatorDependancies__block_invoke_330_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardSystemAperture:", v6);
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_335(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogApplication();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLApplicationAgent_initOperatorDependancies__block_invoke_335_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardAmbientMode:", v6);
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogApplication();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLApplicationAgent_initOperatorDependancies__block_invoke_340_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventPointLiveActivityUpdates:", v6);
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogApplication();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLApplicationAgent_initOperatorDependancies__block_invoke_344_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardLiveActivityStats:", v6);
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogApplication();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLApplicationAgent_initOperatorDependancies__block_invoke_348_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardAmbientModeActiveFace:", v6);
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogApplication();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLApplicationAgent_initOperatorDependancies__block_invoke_354_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardAmbientModeLifetimeCounter:", v6);
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogApplication();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLApplicationAgent_initOperatorDependancies__block_invoke_360_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardMotionToWake:", v6);
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_364(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogApplication();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLApplicationAgent_initOperatorDependancies__block_invoke_364_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventPointControlCenterUpdates:", v6);
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogApplication();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLApplicationAgent_initOperatorDependancies__block_invoke_368_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardControlCenterStats:", v6);
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_369(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D87DA0];
  v4 = a2;
  objc_msgSend(v3, "predicateMatchingLaunchServicesProcesses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicates:", v6);

  objc_msgSend(v4, "setEvents:", 1);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_370;
  v7[3] = &unk_1EA16E940;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "setUpdateHandler:", v7);

}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_370(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  id v34;
  _QWORD v35[5];
  _QWORD block[5];

  v6 = a3;
  objc_msgSend(a4, "exitEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "status");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "process");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "pid");

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v12 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_3_371;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v12;
    if (kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_3_defaultOnce != -1)
      dispatch_once(&kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_3_defaultOnce, block);
    if (kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_3_classDebugEnabled)
    {
      v33 = v6;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received exit event for %d"), v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLApplicationAgent initOperatorDependancies]_block_invoke_2");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 1185);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      v6 = v33;
    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isApplication:", v11))
  {
    v19 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("pid"));

    objc_msgSend(v6, "bundle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, CFSTR("Identifier"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v9, "domain"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("Reason"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "code"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v24, CFSTR("Subcode"));

    objc_msgSend(v8, "timestamp");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, CFSTR("timestamp"));

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v26 = objc_opt_class();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_378;
      v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v35[4] = v26;
      if (kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_3_defaultOnce_376 != -1)
        dispatch_once(&kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_3_defaultOnce_376, v35);
      if (kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_3_classDebugEnabled_377)
      {
        v34 = v6;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload for app exit is %@"), v19);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "lastPathComponent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLApplicationAgent initOperatorDependancies]_block_invoke_2");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 1194);

        PLLogCommon();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        v6 = v34;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "logEventPointApplicationExitReason:", v19);

  }
}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke_3_371(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_3_classDebugEnabled = result;
  return result;
}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke_378(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_3_classDebugEnabled_377 = result;
  return result;
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_387(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
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
    v16 = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_388;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_4_defaultOnce != -1)
      dispatch_once(&kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_4_defaultOnce, &block);
    if (kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_4_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLApplicationAgent:: appDockingListener with payload=%@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLApplicationAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 1203);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventPointDASAppDocking:", v6);

}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_388(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_4_classDebugEnabled = result;
  return result;
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_396(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
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
    v16 = __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_397;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_5_defaultOnce != -1)
      dispatch_once(&kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_5_defaultOnce, &block);
    if (kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_5_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLApplicationAgent:: appPrewarmListener with payload=%@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLApplicationAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 1210);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventPointDASAppPrewarm:", v6);

}

uint64_t __46__PLApplicationAgent_initOperatorDependancies__block_invoke_2_397(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_5_classDebugEnabled = result;
  return result;
}

- (void)logEventPointDASAppDocking:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", v4, CFSTR("AppDocking"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointDASAppPrewarm:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", v4, CFSTR("AppPrewarm"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (BOOL)isApplication:(int)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  id v10;

  v3 = (void *)MEMORY[0x1E0D87D68];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v3, "handleForIdentifier:error:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  objc_msgSend(v5, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isApplication");

  if (v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[PLApplicationAgent isApplication:].cold.1();

  return v8;
}

- (BOOL)checkAppReferenceCleanupNeeded
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  NSObject *v15;
  uint8_t v17[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!+[PLUtilities AppDeletionEnabled](PLUtilities, "AppDeletionEnabled"))
    return 0;
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entriesForKey:", CFSTR("PLApplicationAgent_EventForward_ApplicationDidUninstall"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AppBundleId"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "containsString:", CFSTR("Unspecified")) & 1) == 0)
        {

LABEL_15:
          PLLogAppDeletion();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v17 = 0;
            _os_log_impl(&dword_1DA9D6000, v15, OS_LOG_TYPE_DEFAULT, "AppDeletion : Cleanup pending", v17, 2u);
          }

          v14 = 1;
          goto LABEL_18;
        }
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AppName"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsString:", CFSTR("Unspecified"));

        if ((v13 & 1) == 0)
          goto LABEL_15;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v14 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_18:

  return v14;
}

- (void)resetScheduledAppCleanup
{
  self->_scheduledAppCleanup = -[PLApplicationAgent checkAppReferenceCleanupNeeded](self, "checkAppReferenceCleanupNeeded");
}

+ (BOOL)hasScreenPresence:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "appTags");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "containsObject:", CFSTR("Hidden")) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v4, "appTags");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "containsObject:", CFSTR("hidden")) & 1) != 0)
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend(v4, "applicationState");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isRestricted") & 1) != 0)
        {
          v6 = 1;
        }
        else
        {
          objc_msgSend(v4, "applicationState");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "isRemovedSystemApp") & 1) != 0)
            v6 = 1;
          else
            v6 = objc_msgSend(v4, "isLaunchProhibited");

        }
      }

    }
  }
  else
  {
    v6 = 1;
  }

  return v6 ^ 1;
}

- (BOOL)isAppClipWithBundleID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v9;

  v3 = (objc_class *)MEMORY[0x1E0CA5870];
  v4 = a3;
  v9 = 0;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, &v9);

  if (v9)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "appClipMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v7 != 0;
  }

  return v6;
}

- (void)refreshAllAppsAndPlugins
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
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
  uint64_t v22;
  dispatch_time_t v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *context;
  void *v33;
  _QWORD v34[5];
  _QWORD block[4];
  id v36;
  _QWORD v37[5];
  void *v38;
  void *v39;
  _QWORD v40[4];

  v40[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __46__PLApplicationAgent_refreshAllAppsAndPlugins__block_invoke;
    v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v37[4] = objc_opt_class();
    if (refreshAllAppsAndPlugins_defaultOnce != -1)
      dispatch_once(&refreshAllAppsAndPlugins_defaultOnce, v37);
    if (refreshAllAppsAndPlugins_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLApplicationAgent refreshAllAppsAndPlugins]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 1305);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  v33 = (void *)os_transaction_create();
  context = (void *)MEMORY[0x1DF0A47AC]();
  v9 = *MEMORY[0x1E0D80388];
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllApps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", v9, CFSTR("AllPlugins"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = 0"), CFSTR("AppDeletedDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = 0"), CFSTR("AppUpdatedDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteAllEntriesForKey:withFilters:", v10, v15);

  -[PLOperator storage](self, "storage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ IS NULL"), CFSTR("AppUpdatedDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deleteAllEntriesForKey:withFilters:", v10, v18);

  -[PLOperator storage](self, "storage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = 0"), CFSTR("PluginDeletedDate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "deleteAllEntriesForKey:withFilters:", v11, v21);

  v22 = MEMORY[0x1E0C809B0];
  -[PLApplicationAgent logAllApps](self, "logAllApps");
  -[PLApplicationAgent logAllPlugins](self, "logAllPlugins");

  objc_autoreleasePoolPop(context);
  v23 = dispatch_time(0, 60000000000);
  +[PLUtilities transactionWorkQueue](PLUtilities, "transactionWorkQueue");
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = v22;
  block[1] = 3221225472;
  block[2] = __46__PLApplicationAgent_refreshAllAppsAndPlugins__block_invoke_418;
  block[3] = &unk_1EA16D040;
  v25 = v33;
  v36 = v25;
  dispatch_after(v23, v24, block);

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v34[0] = v22;
    v34[1] = 3221225472;
    v34[2] = __46__PLApplicationAgent_refreshAllAppsAndPlugins__block_invoke_2;
    v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v34[4] = objc_opt_class();
    if (refreshAllAppsAndPlugins_defaultOnce_419 != -1)
      dispatch_once(&refreshAllAppsAndPlugins_defaultOnce_419, v34);
    if (refreshAllAppsAndPlugins_classDebugEnabled_420)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "lastPathComponent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLApplicationAgent refreshAllAppsAndPlugins]");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v29, v30, 1332);

      PLLogCommon();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

uint64_t __46__PLApplicationAgent_refreshAllAppsAndPlugins__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  refreshAllAppsAndPlugins_classDebugEnabled = result;
  return result;
}

uint64_t __46__PLApplicationAgent_refreshAllAppsAndPlugins__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  refreshAllAppsAndPlugins_classDebugEnabled_420 = result;
  return result;
}

- (void)logEventBackwardApplicationMemoryWithBundleId:(id)a3 withSuspendedMemory:(id)a4 withPeakMemory:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (v12 && objc_msgSend(v12, "length"))
  {
    +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("ApplicationMemory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("AppBundleId"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("SuspendedMemory"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("PeakMemory"));
    -[PLOperator logEntry:](self, "logEntry:", v11);

  }
}

- (void)logEventBackwardWidgetStats:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stats"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("WidgetStats"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __50__PLApplicationAgent_logEventBackwardWidgetStats___block_invoke;
  v20 = &unk_1EA16E990;
  v13 = v11;
  v21 = v13;
  v14 = v9;
  v22 = v14;
  v15 = v12;
  v23 = v15;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v17);
  if (objc_msgSend(v15, "count", v17, v18, v19, v20))
  {
    v24 = v13;
    v25[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v16, v13);

    -[PLApplicationAgent createWidgetStatsAccountingEvents:](self, "createWidgetStatsAccountingEvents:", v15);
  }

}

void __50__PLApplicationAgent_logEventBackwardWidgetStats___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D7FFB0];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithEntryKey:withRawData:", *(_QWORD *)(a1 + 32), v4);

  objc_msgSend(v5, "setEntryDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);

}

- (void)createWidgetStatsAccountingEvents:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  _QWORD v15[5];
  uint64_t v16;
  _QWORD v17[3];

  v3 = a3;
  v16 = 0;
  v17[0] = &v16;
  v17[1] = 0x2020000000;
  v17[2] = 0;
  v4 = (void *)objc_opt_new();
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__PLApplicationAgent_createWidgetStatsAccountingEvents___block_invoke;
  v15[3] = &unk_1EA16E9B8;
  v15[4] = &v16;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v15);
  if (*(double *)(v17[0] + 24) > 0.0)
  {
    PLLogApplication();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PLApplicationAgent createWidgetStatsAccountingEvents:].cold.2();

    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __56__PLApplicationAgent_createWidgetStatsAccountingEvents___block_invoke_429;
    v12[3] = &unk_1EA16E9E0;
    v14 = &v16;
    v7 = v4;
    v13 = v7;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v12);
    PLLogApplication();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PLApplicationAgent createWidgetStatsAccountingEvents:].cold.1((uint64_t)v17, (uint64_t)v7, v8);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "entryDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createDistributionEventBackwardWithDistributionID:withChildNodeNameToWeight:withEndDate:", 50, v7, v11);

  }
  _Block_object_dispose(&v16, 8);

}

void __56__PLApplicationAgent_createWidgetStatsAccountingEvents___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("totalFramesRendered"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);

}

void __56__PLApplicationAgent_createWidgetStatsAccountingEvents___block_invoke_429(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("totalFramesRendered"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  objc_msgSend(v4, "numberWithDouble:", v6 / *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v12 = v11;
      objc_msgSend(v7, "doubleValue");
      objc_msgSend(v9, "numberWithDouble:", v12 + v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, v15);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v15);
    }
  }

}

- (void)logEventBackwardControlCenterStats:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stats"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("ControlCenterStats"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __57__PLApplicationAgent_logEventBackwardControlCenterStats___block_invoke;
  v20 = &unk_1EA16E990;
  v13 = v11;
  v21 = v13;
  v14 = v9;
  v22 = v14;
  v15 = v12;
  v23 = v15;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v17);
  if (objc_msgSend(v15, "count", v17, v18, v19, v20))
  {
    v24 = v13;
    v25[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v16, v13);

  }
}

void __57__PLApplicationAgent_logEventBackwardControlCenterStats___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D7FFB0];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithEntryKey:withRawData:", *(_QWORD *)(a1 + 32), v4);

  objc_msgSend(v5, "setEntryDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);

}

- (void)logEventForwardApplicationDidUninstall:(id)a3 withAppName:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = *MEMORY[0x1E0D80378];
  v7 = a4;
  v8 = a3;
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", v6, CFSTR("ApplicationDidUninstall"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("AppBundleId"));

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("AppName"));
  -[PLOperator logEntry:](self, "logEntry:", v9);

}

- (void)logEventForwardSystemAperture:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", v4, CFSTR("SystemAperture"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardAmbientMode:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", v4, CFSTR("AmbientMode"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardAmbientModeActiveFace:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", v4, CFSTR("AmbientModeActiveFace"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardAmbientModeLifetimeCounter:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", v4, CFSTR("AmbientModeLifetimeCounter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v6);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LifetimePresentationCounter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "intValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", v9, 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("LifetimePresentationCounter"));

  PLLogApplication();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[PLApplicationAgent logEventForwardAmbientModeLifetimeCounter:].cold.1(v7, v9, v11);

  -[PLOperator logEntry:](self, "logEntry:", v7);
}

- (void)logEventForwardMotionToWake:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", v4, CFSTR("MotionToWake"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointApplicationExitReason:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("ApplicationExitReason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v9);
  objc_msgSend(v9, "objectForKey:", CFSTR("timestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "convertFromSystemToMonotonic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setEntryDate:", v8);
  }
  -[PLOperator logEntry:](self, "logEntry:", v5);

}

- (void)logEventPointApplication
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)SBSCopyApplicationDisplayIdentifiers();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v3, "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          -[PLApplicationAgent logEventPointApplicationForDisplayID:](self, "logEventPointApplicationForDisplayID:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
  else
  {
    -[PLApplicationAgent logEventPointApplicationForDisplayID:withPid:withState:withReasons:](self, "logEventPointApplicationForDisplayID:withPid:withState:withReasons:", CFSTR("noApplications"), 4294967196, 0, 0);
  }

}

- (void)logEventPointApplicationForDisplayID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  SBSProcessIDForDisplayIdentifier();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", SBSGetApplicationState());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLApplicationAgent logEventPointApplicationForDisplayID:withPid:withState:withReasons:](self, "logEventPointApplicationForDisplayID:withPid:withState:withReasons:", v4, 0, v5, 0);

}

- (void)logEventPointApplicationForDisplayID:(id)a3 withPid:(int)a4 withState:(id)a5 withReasons:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  unsigned int v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD block[5];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v8 = *(_QWORD *)&a4;
  v63 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1DF0A47AC]();
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Application"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v14);
  v16 = v15;
  if ((_DWORD)v8 == -100)
  {
    objc_msgSend(v15, "setIsErrorEntry:", 1);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v10, CFSTR("__PLEntryErrorString__"));
    -[PLOperator logEntry:](self, "logEntry:", v16);
  }
  else
  {
    v56 = (void *)objc_opt_new();
    v53 = v16;
    v54 = v14;
    if (v12)
    {
      v51 = v11;
      v52 = v10;
      v49 = v13;
      v48 = v8;
      if (-[PLOperator isDebugEnabledForKey:](self, "isDebugEnabledForKey:", CFSTR("Aggregate")))
      {
        +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("ApplicationReason"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v55 = 0;
      }
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v50 = v12;
      v17 = v12;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v59;
        v21 = *MEMORY[0x1E0DAB0E8];
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v59 != v20)
              objc_enumerationMutation(v17);
            v23 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:ifNotSet:", CFSTR("EnableRunningBoardServices"), 0) & 1) != 0)
            {
              v24 = v23;
            }
            else
            {
              objc_msgSend(v23, "objectForKeyedSubscript:", v21);
              v24 = (id)objc_claimAutoreleasedReturnValue();
            }
            v25 = v24;
            objc_msgSend(v56, "addObject:", v24);
            if (-[PLOperator isDebugEnabledForKey:](self, "isDebugEnabledForKey:", CFSTR("Aggregate")))
            {
              v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v55);
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, CFSTR("Reason"));
              objc_msgSend(v26, "setObject:forKeyedSubscript:", &unk_1EA1C0110, CFSTR("Count"));
              -[PLOperator logEntry:](self, "logEntry:", v26);

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
        }
        while (v19);
      }

      v13 = v49;
      if (-[PLOperator isDebugEnabledForKey:](self, "isDebugEnabledForKey:", CFSTR("Aggregate")))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeIntervalSince1970");
        v29 = v28 + -86400.0;

        -[PLOperator storage](self, "storage");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v55, 1800.0, v29, 172800.0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D7FFB0], "summarizeAggregateEntries:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("results=%@\naggregatedResults=%@"), v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "lastPathComponent");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLApplicationAgent logEventPointApplicationForDisplayID:withPid:withState:withReasons:]");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v36, v37, 1576);

        PLLogCommon();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
      v11 = v51;
      v10 = v52;
      v12 = v50;
      v16 = v53;
      v14 = v54;
      v8 = v48;
    }
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v10, CFSTR("Identifier"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v39, CFSTR("pid"));

    objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, CFSTR("State"));
    objc_msgSend(v56, "allObjects");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v40, CFSTR("Reason"));

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v41 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __89__PLApplicationAgent_logEventPointApplicationForDisplayID_withPid_withState_withReasons___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v41;
      if (logEventPointApplicationForDisplayID_withPid_withState_withReasons__defaultOnce != -1)
        dispatch_once(&logEventPointApplicationForDisplayID_withPid_withState_withReasons__defaultOnce, block);
      if (logEventPointApplicationForDisplayID_withPid_withState_withReasons__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("entry=%@"), v16);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "lastPathComponent");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLApplicationAgent logEventPointApplicationForDisplayID:withPid:withState:withReasons:]");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "logMessage:fromFile:fromFunction:fromLineNumber:", v42, v45, v46, 1584);

        PLLogCommon();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        v16 = v53;
        v14 = v54;
      }
    }
    -[PLOperator logEntry:](self, "logEntry:", v16);

  }
  objc_autoreleasePoolPop(v13);

}

uint64_t __89__PLApplicationAgent_logEventPointApplicationForDisplayID_withPid_withState_withReasons___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointApplicationForDisplayID_withPid_withState_withReasons__classDebugEnabled = result;
  return result;
}

- (void)logEventPointSuggestedWidgetReload:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stats"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("SuggestedWidgetReload"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __57__PLApplicationAgent_logEventPointSuggestedWidgetReload___block_invoke;
  v20 = &unk_1EA16E990;
  v13 = v11;
  v21 = v13;
  v14 = v9;
  v22 = v14;
  v15 = v12;
  v23 = v15;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v17);
  if (objc_msgSend(v15, "count", v17, v18, v19, v20))
  {
    v24 = v13;
    v25[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v16, v13);

  }
}

void __57__PLApplicationAgent_logEventPointSuggestedWidgetReload___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D7FFB0];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithEntryKey:withRawData:", *(_QWORD *)(a1 + 32), v4);

  objc_msgSend(v5, "setEntryDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);

}

- (void)logEventPointWidgetUpdates:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  PLApplicationAgent *v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stats"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("WidgetUpdates"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__PLApplicationAgent_logEventPointWidgetUpdates___block_invoke;
  v17[3] = &unk_1EA16EA08;
  v13 = v11;
  v18 = v13;
  v14 = v9;
  v19 = v14;
  v15 = v12;
  v20 = v15;
  v21 = self;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v17);
  if (objc_msgSend(v15, "count"))
  {
    v22 = v13;
    v23[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v16, v13);

  }
}

void __49__PLApplicationAgent_logEventPointWidgetUpdates___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0D7FFB0];
  v4 = a2;
  v10 = (id)objc_msgSend([v3 alloc], "initWithEntryKey:withRawData:", *(_QWORD *)(a1 + 32), v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("host"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.chronod.timeline-host"));
  if ((_DWORD)v4)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("Local"), CFSTR("host"));
  objc_msgSend(v10, "setEntryDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("WidgetUpdates"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v6);
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("bundleID"));

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("host"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("host"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA1C0110, CFSTR("Count"));
  objc_msgSend(*(id *)(a1 + 56), "logEntry:", v7);

}

- (void)logEventPointPosterUpdates:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", v4, CFSTR("PosterUpdates"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardLiveActivityStats:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", v4, CFSTR("LiveActivityStats"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v9, v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "convertFromSystemToMonotonic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEntryDate:", v8);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointLiveActivityUpdates:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", v4, CFSTR("LiveActivityUpdates"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v9, v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "convertFromSystemToMonotonic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEntryDate:", v8);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointControlCenterUpdates:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stats"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("ControlCenterUpdates"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __56__PLApplicationAgent_logEventPointControlCenterUpdates___block_invoke;
  v20 = &unk_1EA16E990;
  v13 = v11;
  v21 = v13;
  v14 = v9;
  v22 = v14;
  v15 = v12;
  v23 = v15;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v17);
  if (objc_msgSend(v15, "count", v17, v18, v19, v20))
  {
    v24 = v13;
    v25[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v16, v13);

  }
}

void __56__PLApplicationAgent_logEventPointControlCenterUpdates___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D7FFB0];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithEntryKey:withRawData:", *(_QWORD *)(a1 + 32), v4);

  objc_msgSend(v5, "setEntryDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);

}

- (void)displayIdentifiersDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *context;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1DF0A47AC]();
  objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v9, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);
        -[PLApplicationAgent currentDisplayIdentifiers](self, "currentDisplayIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v10);

        if ((v12 & 1) == 0)
          -[PLApplicationAgent logInstalledAppWithRecord:withBundleID:shouldMaskTimestamp:](self, "logInstalledAppWithRecord:withBundleID:shouldMaskTimestamp:", v9, v10, 1);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v6);
  }

  objc_autoreleasePoolPop(context);
  v13 = (void *)MEMORY[0x1E0C99E20];
  -[PLApplicationAgent currentDisplayIdentifiers](self, "currentDisplayIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithSet:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "minusSet:", v3);
  -[PLApplicationAgent currentDisplayIdentifiers](self, "currentDisplayIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "minusSet:", v17);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = v15;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        -[PLApplicationAgent logUninstalledApp:](self, "logUninstalledApp:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v20);
  }

  if (objc_msgSend(v16, "count") || objc_msgSend(v18, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "storage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "flushCachesWithReason:", CFSTR("AppAddedOrRemoved"));

  }
  -[PLApplicationAgent setCurrentDisplayIdentifiers:](self, "setCurrentDisplayIdentifiers:", v3);

}

+ (id)pluginEntryFromRecord:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllPlugins"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "executableURL");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v4, "containingBundleRecord");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v4, "containingBundleRecord");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {

LABEL_10:
          v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
          objc_msgSend(v4, "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("PluginId"));

          objc_msgSend(v4, "containingBundleRecord");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "bundleIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("PluginParentApp"));

          objc_msgSend(v4, "extensionPointRecord");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("PluginType"));

          objc_msgSend(v4, "executableURL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "path");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("PluginExecutableName"));

          objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1EA1C0128, CFSTR("PluginDeletedDate"));
          goto LABEL_12;
        }
      }
      objc_msgSend(v4, "extensionPointRecord");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.posterkit.provider"));

      if (v9)
      {

      }
      if ((v13 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    v6 = 0;
  }
LABEL_12:

  return v6;
}

- (void)logInstalledAppWithRecord:(id)a3 withBundleID:(id)a4 shouldMaskTimestamp:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  char v38;
  void *v39;
  double v40;
  double v41;
  NSObject *v42;
  void **v43;
  id v44;
  id *v45;
  id *v46;
  void *v47;
  double v48;
  double v49;
  NSObject *v50;
  id v51;
  void *v52;
  double v53;
  id v54;
  void *v55;
  NSObject *v56;
  void *v57;
  double v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  _QWORD v89[4];
  id v90;
  id v91;
  id v92;
  id v93;
  _QWORD v94[4];
  id v95;
  id v96;
  id v97;
  id v98;
  _QWORD v99[4];
  id v100;
  id v101;
  id v102;
  char v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "storageLocked");

  if ((v12 & 1) == 0)
  {
    v88 = v9;
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    objc_msgSend(v8, "applicationExtensionRecords");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v104, v108, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v105;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v105 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x1DF0A47AC]();
          +[PLApplicationAgent pluginEntryFromRecord:](PLApplicationAgent, "pluginEntryFromRecord:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLApplicationAgent logInstalledPlugin:](self, "logInstalledPlugin:", v20);

          objc_autoreleasePoolPop(v19);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v104, v108, 16);
      }
      while (v15);
    }

    v21 = *MEMORY[0x1E0D80388];
    +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllApps"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator storage](self, "storage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v88;
    objc_msgSend(v23, "lastEntryForKey:withSubEntryKey:", v22, v88);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v8, "shortVersionString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
        objc_msgSend(v8, "shortVersionString");
      else
        objc_msgSend(v8, "bundleVersion");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("AppBundleVersion"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "isEqualToString:", v28);

      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("AppDeletedDate"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "doubleValue");
      v41 = v40;

      if (v41 == 0.0)
      {
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("AppUpdatedDate"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "doubleValue");
        v49 = v48;

        if (v49 == 0.0)
        {
          v89[0] = MEMORY[0x1E0C809B0];
          v89[1] = 3221225472;
          v89[2] = __81__PLApplicationAgent_logInstalledAppWithRecord_withBundleID_shouldMaskTimestamp___block_invoke_2;
          v89[3] = &unk_1EA16EA58;
          v43 = &v90;
          v54 = v25;
          v90 = v54;
          v45 = &v91;
          v91 = v28;
          v46 = &v92;
          v92 = v8;
          v93 = v88;
          -[PLOperator updateEntry:withBlock:](self, "updateEntry:withBlock:", v54, v89);

        }
        else
        {
          PLLogApplication();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
            -[PLApplicationAgent logInstalledAppWithRecord:withBundleID:shouldMaskTimestamp:].cold.9();

          v94[0] = MEMORY[0x1E0C809B0];
          v94[1] = 3221225472;
          v94[2] = __81__PLApplicationAgent_logInstalledAppWithRecord_withBundleID_shouldMaskTimestamp___block_invoke_454;
          v94[3] = &unk_1EA16EA58;
          v43 = &v95;
          v51 = v25;
          v95 = v51;
          v45 = &v96;
          v96 = v28;
          v46 = &v97;
          v97 = v8;
          v98 = v88;
          -[PLOperator updateEntry:withBlock:](self, "updateEntry:withBlock:", v51, v94);

        }
      }
      else
      {
        PLLogApplication();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          -[PLApplicationAgent logInstalledAppWithRecord:withBundleID:shouldMaskTimestamp:].cold.8();

        v99[0] = MEMORY[0x1E0C809B0];
        v99[1] = 3221225472;
        v99[2] = __81__PLApplicationAgent_logInstalledAppWithRecord_withBundleID_shouldMaskTimestamp___block_invoke;
        v99[3] = &unk_1EA16EA30;
        v43 = &v100;
        v44 = v25;
        v100 = v44;
        v103 = v38;
        v45 = &v101;
        v101 = v28;
        v46 = &v102;
        v102 = v8;
        -[PLOperator updateEntry:withBlock:](self, "updateEntry:withBlock:", v44, v99);
      }

      v55 = *v43;
      v9 = v88;
    }
    else
    {
      PLLogApplication();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[PLApplicationAgent logInstalledAppWithRecord:withBundleID:shouldMaskTimestamp:].cold.7();

      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) == 0)
      {
        PLLogApplication();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[PLApplicationAgent logInstalledAppWithRecord:withBundleID:shouldMaskTimestamp:].cold.6(a5, v29);

        if (a5)
        {
          PLLogApplication();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            -[PLApplicationAgent logInstalledAppWithRecord:withBundleID:shouldMaskTimestamp:].cold.5();

          +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", v21, CFSTR("AllApps"));
          v31 = objc_claimAutoreleasedReturnValue();
          -[PLOperator storage](self, "storage");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "lastEntryForKey:", v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
          {
            v34 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("timestamp"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "doubleValue");
            objc_msgSend(v34, "dateWithTimeIntervalSince1970:");
            v36 = objc_claimAutoreleasedReturnValue();

          }
          else
          {
            PLLogApplication();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              -[PLApplicationAgent logInstalledAppWithRecord:withBundleID:shouldMaskTimestamp:].cold.4();

            v57 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v28, "timeIntervalSince1970");
            objc_msgSend(v57, "dateWithTimeIntervalSince1970:", round(v58 / 1800.0) * 1800.0);
            v36 = objc_claimAutoreleasedReturnValue();
          }

          v28 = (void *)v31;
        }
        else
        {
          v52 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v28, "timeIntervalSince1970");
          objc_msgSend(v52, "dateWithTimeIntervalSince1970:", round(v53 / 1800.0) * 1800.0);
          v36 = objc_claimAutoreleasedReturnValue();
        }

        v28 = (void *)v36;
        v24 = v88;
      }
      PLLogApplication();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        -[PLApplicationAgent logInstalledAppWithRecord:withBundleID:shouldMaskTimestamp:].cold.3();

      v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v22, v28);
      objc_msgSend(v55, "setObject:forKeyedSubscript:", v24, CFSTR("AppBundleId"));
      objc_msgSend(v8, "iTunesMetadata");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "distributorInfo");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "distributorID");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setObject:forKeyedSubscript:", v62, CFSTR("AppDistributorID"));

      PLLogApplication();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        -[PLApplicationAgent logInstalledAppWithRecord:withBundleID:shouldMaskTimestamp:].cold.2(v8, (uint64_t)v88, v63);

      objc_msgSend(v8, "localizedName");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setObject:forKeyedSubscript:", v64, CFSTR("AppName"));

      objc_msgSend(v8, "bundleVersion");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setObject:forKeyedSubscript:", v65, CFSTR("AppBuildVersion"));

      objc_msgSend(v8, "shortVersionString");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (v66)
        objc_msgSend(v8, "shortVersionString");
      else
        objc_msgSend(v8, "bundleVersion");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setObject:forKeyedSubscript:", v67, CFSTR("AppBundleVersion"));

      objc_msgSend(v8, "executableURL");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "lastPathComponent");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setObject:forKeyedSubscript:", v69, CFSTR("AppExecutable"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLApplicationAgent isAppClipWithBundleID:](self, "isAppClipWithBundleID:", v88));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setObject:forKeyedSubscript:", v70, CFSTR("AppIsClip"));

      objc_msgSend(v55, "setObject:forKeyedSubscript:", &unk_1EA1C0128, CFSTR("AppDeletedDate"));
      v71 = &unk_1EA1C0158;
      if (objc_msgSend(v8, "mayBeBUIVisible")
        && +[PLApplicationAgent hasScreenPresence:](PLApplicationAgent, "hasScreenPresence:", v8))
      {
        v71 = &unk_1EA1C0140;
      }
      objc_msgSend(v55, "setObject:forKeyedSubscript:", v71, CFSTR("AppType"));
      objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("AppBundleId"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "isEqualToString:", CFSTR("com.apple.NanoUniverse.AegirProxyApp"));

      if (v73)
        objc_msgSend(v55, "setObject:forKeyedSubscript:", &unk_1EA1C0140, CFSTR("AppType"));
      objc_msgSend(v55, "setObject:forKeyedSubscript:", &unk_1EA1C0128, CFSTR("AppUpdatedDate"));
      if (+[PLUtilities isAppAnalyticsEnabled](PLUtilities, "isAppAnalyticsEnabled"))
      {
        objc_msgSend(v8, "deviceIdentifierForVendor");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "UUIDString");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setObject:forKeyedSubscript:", v75, CFSTR("AppVendorID"));

        v76 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "iTunesMetadata");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "numberWithUnsignedLongLong:", objc_msgSend(v77, "storeItemIdentifier"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setObject:forKeyedSubscript:", v78, CFSTR("AppItemID"));

        objc_msgSend(v8, "iTunesMetadata");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "storeCohort");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setObject:forKeyedSubscript:", v80, CFSTR("AppCohort"));

        v81 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "iTunesMetadata");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "numberWithUnsignedLongLong:", objc_msgSend(v82, "storeFront"));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setObject:forKeyedSubscript:", v83, CFSTR("AppStoreFront"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isBeta"));
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setObject:forKeyedSubscript:", v84, CFSTR("AppIsBeta"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "developerType") == 3);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setObject:forKeyedSubscript:", v85, CFSTR("AppIs3rdParty"));

      }
      -[PLOperator logEntry:](self, "logEntry:", v55);
      PLLogApplication();
      v86 = objc_claimAutoreleasedReturnValue();
      v9 = v88;
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
        -[PLApplicationAgent logInstalledAppWithRecord:withBundleID:shouldMaskTimestamp:].cold.1();

      objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("AppBundleVersion"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLApplicationAgent addAppVersion:withVersion:](PLApplicationAgent, "addAppVersion:withVersion:", v88, v87);

    }
  }

}

void __81__PLApplicationAgent_logInstalledAppWithRecord_withBundleID_shouldMaskTimestamp___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDateWithTimeIntervalSinceNow:", 2700.0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) != 0)
  {
    v2 = v10;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v10, "timeIntervalSince1970");
    objc_msgSend(v3, "dateWithTimeIntervalSince1970:", round(v4 / 1800.0) * 1800.0);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v5;
  }
  v11 = v2;
  objc_msgSend(*(id *)(a1 + 32), "setEntryDate:");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", &unk_1EA1C0128, CFSTR("AppDeletedDate"));
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("AppBundleVersion"));
    objc_msgSend(*(id *)(a1 + 48), "bundleVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, CFSTR("AppBuildVersion"));

  }
  objc_msgSend(*(id *)(a1 + 48), "iTunesMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "distributorInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "distributorID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, CFSTR("AppDistributorID"));

}

uint64_t __81__PLApplicationAgent_logInstalledAppWithRecord_withBundleID_shouldMaskTimestamp___block_invoke_454(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("AppBundleVersion"));
  objc_msgSend(*(id *)(a1 + 48), "bundleVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, CFSTR("AppBuildVersion"));

  objc_msgSend(*(id *)(a1 + 48), "iTunesMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "distributorInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "distributorID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("AppDistributorID"));

  return +[PLApplicationAgent addAppVersion:withVersion:](PLApplicationAgent, "addAppVersion:withVersion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

uint64_t __81__PLApplicationAgent_logInstalledAppWithRecord_withBundleID_shouldMaskTimestamp___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("AppBundleVersion"));
  objc_msgSend(*(id *)(a1 + 48), "bundleVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, CFSTR("AppBuildVersion"));

  objc_msgSend(*(id *)(a1 + 48), "iTunesMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "distributorInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "distributorID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("AppDistributorID"));

  return +[PLApplicationAgent addAppVersion:withVersion:](PLApplicationAgent, "addAppVersion:withVersion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (void)buildAppVersionDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *context;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  context = (void *)MEMORY[0x1DF0A47AC]();
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v3;
  objc_msgSend(v5, "entriesForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogApplication();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PLApplicationAgent buildAppVersionDictionary:].cold.1();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AppBundleId"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AppBundleVersion"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLApplicationAgent addAppVersion:withVersion:](PLApplicationAgent, "addAppVersion:withVersion:", v14, v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  objc_autoreleasePoolPop(context);
}

- (void)logInstalledPlugin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD block[5];
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "storageLocked");

  if (v4 && (v7 & 1) == 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PluginId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && objc_msgSend(v9, "length"))
    {
      +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllPlugins"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      v43 = &v42;
      v44 = 0x3032000000;
      v45 = __Block_byref_object_copy__8;
      v46 = __Block_byref_object_dispose__8;
      -[PLOperator storage](self, "storage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastEntryForKey:withSubEntryKey:", v10, v9);
      v47 = (id)objc_claimAutoreleasedReturnValue();

      v12 = (void *)v43[5];
      if (v12)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PluginDeletedDate"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        v15 = v14;

        if (v15 == 0.0)
        {
          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v31 = objc_opt_class();
            v38[0] = MEMORY[0x1E0C809B0];
            v38[1] = 3221225472;
            v38[2] = __41__PLApplicationAgent_logInstalledPlugin___block_invoke_2;
            v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v38[4] = v31;
            if (logInstalledPlugin__defaultOnce_463 != -1)
              dispatch_once(&logInstalledPlugin__defaultOnce_463, v38);
            if (logInstalledPlugin__classDebugEnabled_464)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate: pluginID=%@"), v9);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "lastPathComponent");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLApplicationAgent logInstalledPlugin:]");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 1922);

              PLLogCommon();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

            }
          }
        }
        else
        {
          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v16 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __41__PLApplicationAgent_logInstalledPlugin___block_invoke_459;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v16;
            if (logInstalledPlugin__defaultOnce_457 != -1)
              dispatch_once(&logInstalledPlugin__defaultOnce_457, block);
            if (logInstalledPlugin__classDebugEnabled_458)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Update: pluginID=%@"), v9);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "lastPathComponent");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLApplicationAgent logInstalledPlugin:]");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 1913);

              PLLogCommon();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

            }
          }
          v23 = v43[5];
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __41__PLApplicationAgent_logInstalledPlugin___block_invoke_462;
          v39[3] = &unk_1EA16D4A8;
          v39[4] = &v42;
          -[PLOperator updateEntry:withBlock:](self, "updateEntry:withBlock:", v23, v39);
        }
      }
      else
      {
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v24 = objc_opt_class();
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __41__PLApplicationAgent_logInstalledPlugin___block_invoke;
          v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v41[4] = v24;
          if (logInstalledPlugin__defaultOnce != -1)
            dispatch_once(&logInstalledPlugin__defaultOnce, v41);
          if (logInstalledPlugin__classDebugEnabled)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("New: pluginID=%@"), v9);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "lastPathComponent");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLApplicationAgent logInstalledPlugin:]");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 1908);

            PLLogCommon();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

          }
        }
        -[PLOperator logEntry:](self, "logEntry:", v4);
      }
      _Block_object_dispose(&v42, 8);

    }
  }

}

uint64_t __41__PLApplicationAgent_logInstalledPlugin___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logInstalledPlugin__classDebugEnabled = result;
  return result;
}

uint64_t __41__PLApplicationAgent_logInstalledPlugin___block_invoke_459(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logInstalledPlugin__classDebugEnabled_458 = result;
  return result;
}

void __41__PLApplicationAgent_logInstalledPlugin___block_invoke_462(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setEntryDate:", v2);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", &unk_1EA1C0128, CFSTR("PluginDeletedDate"));

}

uint64_t __41__PLApplicationAgent_logInstalledPlugin___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logInstalledPlugin__classDebugEnabled_464 = result;
  return result;
}

- (void)logUninstalledApp:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[6];
  _QWORD v24[5];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[5];
  id v38;
  _BYTE v39[128];
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__8;
  v37[4] = __Block_byref_object_dispose__8;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D80388];
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllApps"));
  v5 = objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__8;
  v35 = __Block_byref_object_dispose__8;
  -[PLOperator storage](self, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastEntryForKey:withSubEntryKey:", v5, v22);
  v21 = (void *)v5;
  v36 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v32[5];
  v8 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __40__PLApplicationAgent_logUninstalledApp___block_invoke;
  v30[3] = &unk_1EA16EA80;
  v30[4] = &v31;
  v30[5] = v37;
  -[PLOperator updateEntry:withBlock:](self, "updateEntry:withBlock:", v7, v30);
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", v4, CFSTR("AllPlugins"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("PluginParentApp"), v22, 0);
  -[PLOperator storage](self, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "entriesForKey:withComparisons:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)v9;
  v20 = (void *)v10;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v27;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v17);
        v24[0] = 0;
        v24[1] = v24;
        v24[2] = 0x3032000000;
        v24[3] = __Block_byref_object_copy__8;
        v24[4] = __Block_byref_object_dispose__8;
        v25 = v18;
        v23[0] = v8;
        v23[1] = 3221225472;
        v23[2] = __40__PLApplicationAgent_logUninstalledApp___block_invoke_2;
        v23[3] = &unk_1EA16EA80;
        v23[4] = v24;
        v23[5] = v37;
        -[PLOperator updateEntry:withBlock:](self, "updateEntry:withBlock:", v25, v23, v19, v20, v21);
        _Block_object_dispose(v24, 8);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
    }
    while (v15);
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v37, 8);

}

void __40__PLApplicationAgent_logUninstalledApp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "timeIntervalSince1970");
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v3, CFSTR("AppDeletedDate"));

}

void __40__PLApplicationAgent_logUninstalledApp___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "timeIntervalSince1970");
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v3, CFSTR("PluginDeletedDate"));

}

- (void)logUninstalledAppVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__8;
  v20[4] = __Block_byref_object_dispose__8;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllApps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=\"%@\"), CFSTR("AppBundleId"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8;
  v18 = __Block_byref_object_dispose__8;
  -[PLOperator storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastEntryForKey:withFilters:", v5, v8);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v15[5];
  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__PLApplicationAgent_logUninstalledAppVersion___block_invoke;
    v10[3] = &unk_1EA16EAA8;
    v12 = v20;
    v13 = &v14;
    v11 = v4;
    -[PLOperator updateEntry:withBlock:](self, "updateEntry:withBlock:", v9, v10);

  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(v20, 8);
}

void __47__PLApplicationAgent_logUninstalledAppVersion___block_invoke(_QWORD *a1)
{
  void *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) == 0)
  {
    v2 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "timeIntervalSince1970");
    objc_msgSend(v2, "dateWithTimeIntervalSince1970:", round(v3 / 1800.0) * 1800.0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[5] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "timeIntervalSince1970");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setObject:forKeyedSubscript:", v8, CFSTR("AppDeletedDate"));

  v9 = a1[4];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "objectForKeyedSubscript:", CFSTR("AppBundleVersion"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[PLApplicationAgent removeAppVersion:forVersion:](PLApplicationAgent, "removeAppVersion:forVersion:", v9, v10);

}

- (void)logUpdatedAppVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__8;
  v20[4] = __Block_byref_object_dispose__8;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllApps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=\"%@\"), CFSTR("AppBundleId"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8;
  v18 = __Block_byref_object_dispose__8;
  -[PLOperator storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastEntryForKey:withFilters:", v5, v8);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v15[5];
  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__PLApplicationAgent_logUpdatedAppVersion___block_invoke;
    v10[3] = &unk_1EA16EAD0;
    v12 = v20;
    v13 = &v14;
    v10[4] = self;
    v11 = v4;
    -[PLOperator updateEntry:withBlock:](self, "updateEntry:withBlock:", v9, v10);

  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(v20, 8);
}

void __43__PLApplicationAgent_logUpdatedAppVersion___block_invoke(_QWORD *a1)
{
  void *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v16;
  void *v17;
  uint64_t block;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  uint64_t v22;

  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) == 0)
  {
    v2 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "timeIntervalSince1970");
    objc_msgSend(v2, "dateWithTimeIntervalSince1970:", round(v3 / 1800.0) * 1800.0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[6] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "timeIntervalSince1970");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setObject:forKeyedSubscript:", v8, CFSTR("AppUpdatedDate"));

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __43__PLApplicationAgent_logUpdatedAppVersion___block_invoke_2;
    v21 = &__block_descriptor_40_e5_v8__0lu32l8;
    v22 = v9;
    if (kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_6_defaultOnce != -1)
      dispatch_once(&kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_6_defaultOnce, &block);
    if (kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_6_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Update: mark %@ entry as updated\n"), a1[5], block, v19, v20, v21, v22);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLApplicationAgent.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLApplicationAgent logUpdatedAppVersion:]_block_invoke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 1990);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  v16 = a1[5];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "objectForKeyedSubscript:", CFSTR("AppBundleVersion"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLApplicationAgent removeAppVersion:forVersion:](PLApplicationAgent, "removeAppVersion:forVersion:", v16, v17);

}

uint64_t __43__PLApplicationAgent_logUpdatedAppVersion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLApplicationAgentEventPointNameControlCenterUpdates_block_invoke_6_classDebugEnabled = result;
  return result;
}

- (void)logAllApps
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "logAllApps was called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)logAllPlugins
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  +[PLApplicationAgent installedPlugins](PLApplicationAgent, "installedPlugins", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[PLApplicationAgent logInstalledPlugin:](self, "logInstalledPlugin:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

+ (id)installedPlugins
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1DF0A47AC](a1, a2);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(MEMORY[0x1E0CA5848], "enumeratorWithOptions:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        +[PLApplicationAgent pluginEntryFromRecord:](PLApplicationAgent, "pluginEntryFromRecord:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_autoreleasePoolPop(v2);
  return v3;
}

- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4
{
  id v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a3;
  objc_msgSend(a4, "timeIntervalSince1970");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  v10 = v9 + -604800.0;

  if (v7 >= v10)
    v7 = v10;
  v11 = (void *)objc_opt_class();
  v12 = *MEMORY[0x1E0D80388];
  objc_msgSend(v11, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllApps"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "isEqualToString:", v13);

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(timestamp is NULL OR timestamp<%f) AND ((%@!=0 AND %@<%f) OR (%@!=0 AND %@<%f))"), *(_QWORD *)&v7, CFSTR("AppDeletedDate"), CFSTR("AppDeletedDate"), *(_QWORD *)&v7, CFSTR("AppUpdatedDate"), CFSTR("AppUpdatedDate"), *(_QWORD *)&v7);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", v12, CFSTR("AllPlugins"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v5, "isEqualToString:", v15);

    if (!v16)
    {
      v17 = 0;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(timestamp is NULL OR timestamp<%f) AND %@!=0 AND %@<%f"), *(_QWORD *)&v7, CFSTR("PluginDeletedDate"), CFSTR("PluginDeletedDate"), *(_QWORD *)&v7, v19, v20, v21);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v17;
}

- (void)appReferenceCleanup
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "AppDeletion : Activity is scheduled.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (BOOL)isVisible:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "endowmentNamespaces");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

  return v4;
}

+ (id)getReasons:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v10, "reason", (_QWORD)v16));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "explanation");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v11)
          v14 = v12 == 0;
        else
          v14 = 1;
        if (!v14)
          objc_msgSend(v4, "addObject:", v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)getApplicationRecordSet:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *context;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  context = (void *)MEMORY[0x1DF0A47AC]();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        v11 = objc_alloc(MEMORY[0x1E0CA5870]);
        objc_msgSend(v10, "bundleURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        v13 = (void *)objc_msgSend(v11, "initWithURL:allowPlaceholder:error:", v12, 1, &v18);
        v14 = v18;

        if (v13)
        {
          objc_msgSend(v4, "addObject:", v13);
        }
        else
        {
          PLLogCommon();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v24 = v10;
            v25 = 2112;
            v26 = v14;
            _os_log_error_impl(&dword_1DA9D6000, v15, OS_LOG_TYPE_ERROR, "could not refresh application record for %@: %@", buf, 0x16u);
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v7);
  }

  objc_autoreleasePoolPop(context);
  return v4;
}

- (void)applicationsDidInstall:(id)a3
{
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  __int128 v15;
  uint8_t v16;
  _BYTE v17[15];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  NSObject *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[PLApplicationAgent getApplicationRecordSet:](self, "getApplicationRecordSet:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v19;
    *(_QWORD *)&v6 = 138412290;
    v15 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v10, "isPlaceholder", v15))
        {
          PLLogCommon();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            -[PLApplicationAgent applicationsDidInstall:].cold.1(&v16, v17, v11);
        }
        else
        {
          objc_msgSend(v10, "bundleIdentifier");
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isUpdate");
          PLLogApplication();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
          if (v12)
          {
            if (v14)
            {
              *(_DWORD *)buf = v15;
              v23 = v11;
              _os_log_debug_impl(&dword_1DA9D6000, v13, OS_LOG_TYPE_DEBUG, "applicationsDidInstall: Update %@\n", buf, 0xCu);
            }

            -[PLApplicationAgent logUpdatedAppVersion:](self, "logUpdatedAppVersion:", v11);
          }
          else
          {
            if (v14)
            {
              *(_DWORD *)buf = v15;
              v23 = v11;
              _os_log_debug_impl(&dword_1DA9D6000, v13, OS_LOG_TYPE_DEBUG, "applicationsDidInstall: Install %@", buf, 0xCu);
            }

          }
          -[PLApplicationAgent logInstalledAppWithRecord:withBundleID:shouldMaskTimestamp:](self, "logInstalledAppWithRecord:withBundleID:shouldMaskTimestamp:", v10, v11, 1);
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v7);
  }

}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  __int128 v16;
  uint8_t v17;
  _BYTE v18[15];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  NSObject *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v20;
    *(_QWORD *)&v6 = 138412546;
    v16 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v10, "isPlaceholder", v16))
        {
          PLLogCommon();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            -[PLApplicationAgent applicationsDidUninstall:].cold.2(&v17, v18, v11);
        }
        else
        {
          objc_msgSend(v10, "bundleIdentifier");
          v11 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "localizedName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLApplicationAgent logUninstalledAppVersion:](self, "logUninstalledAppVersion:", v11);
          PLLogCommon();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v16;
            v24 = v12;
            v25 = 2112;
            v26 = v11;
            _os_log_debug_impl(&dword_1DA9D6000, v13, OS_LOG_TYPE_DEBUG, "AppDeletion : Application Name %@ and bundle ID %@", buf, 0x16u);
          }

          -[PLApplicationAgent logEventForwardApplicationDidUninstall:withAppName:](self, "logEventForwardApplicationDidUninstall:withAppName:", v11, v12);
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v7);
  }
  if (objc_msgSend(v4, "count"))
  {
    if (+[PLUtilities AppDeletionEnabled](PLUtilities, "AppDeletionEnabled"))
      -[PLApplicationAgent appReferenceCleanup](self, "appReferenceCleanup");
    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[PLApplicationAgent applicationsDidUninstall:].cold.1();

    v15 = +[PLUtilities generateAndUpdateSaltValue:](PLUtilities, "generateAndUpdateSaltValue:", CFSTR("PLSaltBundleID"));
  }

}

- (NSSet)currentDisplayIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentDisplayIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BKSApplicationStateMonitor)appStateMonitor
{
  return (BKSApplicationStateMonitor *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAppStateMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (RBSProcessMonitor)RBSAppStateMonitor
{
  return (RBSProcessMonitor *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRBSAppStateMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLXPCListenerOperatorComposition)widgetStatsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWidgetStatsListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLXPCListenerOperatorComposition)widgetUpdatesListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setWidgetUpdatesListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLXPCListenerOperatorComposition)suggestedWidgetReloadListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSuggestedWidgetReloadListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PLXPCListenerOperatorComposition)posterUpdatesListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPosterUpdatesListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (PLXPCListenerOperatorComposition)ambientModeListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAmbientModeListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLXPCListenerOperatorComposition)liveActivityStatsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLiveActivityStatsListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PLXPCListenerOperatorComposition)liveActivityUpdatesListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLiveActivityUpdatesListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (PLXPCListenerOperatorComposition)systemApertureListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSystemApertureListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PLXPCListenerOperatorComposition)ambientModeActiveFaceListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAmbientModeActiveFaceListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (PLXPCListenerOperatorComposition)ambientModeLifetimeCounterListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAmbientModeLifetimeCounterListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (PLXPCListenerOperatorComposition)motionToWakeListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setMotionToWakeListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (RBSProcessMonitor)appStateMonitorRBS
{
  return (RBSProcessMonitor *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAppStateMonitorRBS:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (PLXPCListenerOperatorComposition)appDockingListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAppDockingListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (PLXPCListenerOperatorComposition)appPrewarmListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAppPrewarmListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (PLXPCListenerOperatorComposition)controlCenterStatsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 192, 1);
}

- (void)setControlCenterStatsListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (PLXPCListenerOperatorComposition)controlCenterUpdatesListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 200, 1);
}

- (void)setControlCenterUpdatesListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (PLNSNotificationOperatorComposition)dailyTaskNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 208, 1);
}

- (void)setDailyTaskNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (BOOL)scheduledAppCleanup
{
  return self->_scheduledAppCleanup;
}

- (void)setScheduledAppCleanup:(BOOL)a3
{
  self->_scheduledAppCleanup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyTaskNotification, 0);
  objc_storeStrong((id *)&self->_controlCenterUpdatesListener, 0);
  objc_storeStrong((id *)&self->_controlCenterStatsListener, 0);
  objc_storeStrong((id *)&self->_appPrewarmListener, 0);
  objc_storeStrong((id *)&self->_appDockingListener, 0);
  objc_storeStrong((id *)&self->_appStateMonitorRBS, 0);
  objc_storeStrong((id *)&self->_motionToWakeListener, 0);
  objc_storeStrong((id *)&self->_ambientModeLifetimeCounterListener, 0);
  objc_storeStrong((id *)&self->_ambientModeActiveFaceListener, 0);
  objc_storeStrong((id *)&self->_systemApertureListener, 0);
  objc_storeStrong((id *)&self->_liveActivityUpdatesListener, 0);
  objc_storeStrong((id *)&self->_liveActivityStatsListener, 0);
  objc_storeStrong((id *)&self->_ambientModeListener, 0);
  objc_storeStrong((id *)&self->_posterUpdatesListener, 0);
  objc_storeStrong((id *)&self->_suggestedWidgetReloadListener, 0);
  objc_storeStrong((id *)&self->_widgetUpdatesListener, 0);
  objc_storeStrong((id *)&self->_widgetStatsListener, 0);
  objc_storeStrong((id *)&self->_RBSAppStateMonitor, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_currentDisplayIdentifiers, 0);
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Application metadata being sent to CA", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_309_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "WidgetStats payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_314_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "WidgetUpdates payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_318_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "SuggestedWidgetReload payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_323_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "PosterUpdates payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_330_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "System Aperture payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_335_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "AmbientMode payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_340_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "LiveActivityUpdates payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_344_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "LiveActivityStats payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_348_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "AmbientModeActiveFace payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_354_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "AmbientModeLifetimePresentationCounter payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_360_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "AmbientModeMotionToWake payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_364_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "ControlCenterUpdates payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLApplicationAgent_initOperatorDependancies__block_invoke_368_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "ControlCenterStats payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isApplication:.cold.1()
{
  uint8_t v0[24];
  uint64_t v1;

  v1 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1DA9D6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error to identify isApplication %@", v0, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)createWidgetStatsAccountingEvents:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v4 = 134218242;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, a3, (uint64_t)a3, "WidgetStats Accounting: totalFramesRendered=%f, identifierToWeight=%@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)createWidgetStatsAccountingEvents:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "WidgetStats Accounting: entries=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)logEventForwardAmbientModeLifetimeCounter:(NSObject *)a3 .cold.1(void *a1, int a2, NSObject *a3)
{
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("LifetimePresentationCounter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 67109378;
  v6[1] = a2;
  v7 = 2112;
  v8 = v5;
  _os_log_debug_impl(&dword_1DA9D6000, a3, OS_LOG_TYPE_DEBUG, "AmbientModeLifetimePresentationCounter value from payload: %d, value after rounding: %@", (uint8_t *)v6, 0x12u);

}

- (void)logInstalledAppWithRecord:withBundleID:shouldMaskTimestamp:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "log new AppVersions entry %@\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)logInstalledAppWithRecord:(void *)a1 withBundleID:(uint64_t)a2 shouldMaskTimestamp:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[12];
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "iTunesMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "distributorInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "distributorID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  v10 = 2112;
  v11 = a2;
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, a3, v8, "AllApps logging DistributorID: %@ for BundleID: %@", v9);

}

- (void)logInstalledAppWithRecord:withBundleID:shouldMaskTimestamp:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "AllApps lastRow Timestamp: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)logInstalledAppWithRecord:withBundleID:shouldMaskTimestamp:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "AllApps table is empty, using fuzzed timestamp", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)logInstalledAppWithRecord:withBundleID:shouldMaskTimestamp:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "AllApps masking Timestamp", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)logInstalledAppWithRecord:(char)a1 withBundleID:(NSObject *)a2 shouldMaskTimestamp:.cold.6(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_DEBUG, "AllApps shouldMaskTimestamp: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_6();
}

- (void)logInstalledAppWithRecord:withBundleID:shouldMaskTimestamp:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "AllApps logInstalledAppWithRecord bundleID doesnt exist for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)logInstalledAppWithRecord:withBundleID:shouldMaskTimestamp:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "AllApps entry %@ was deleted and reinstalled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)logInstalledAppWithRecord:withBundleID:shouldMaskTimestamp:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "%@ was updated, modify version", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)buildAppVersionDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "AllApps Building app verion dictionary from the db", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)applicationsDidInstall:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, a3, (uint64_t)a3, "app Record is placeHolder", a1);
}

- (void)applicationsDidUninstall:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "AppResume : Updating salt value", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)applicationsDidUninstall:(NSObject *)a3 .cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, a3, (uint64_t)a3, "app Proxy is placeHolder", a1);
}

@end
