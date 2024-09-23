@implementation PLStorageOperator

+ (id)entryEventIntervalDefinitions
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "isDebugEnabledForKey:", CFSTR("LogCacheSize")))
    return MEMORY[0x1E0C9AA70];
  v6 = CFSTR("CacheSize");
  objc_msgSend(a1, "entryEventIntervalDefinitionCacheSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)entryEventIntervalDefinitionCacheSize
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
  _QWORD v20[7];
  _QWORD v21[7];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[4];

  v25[2] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("Configs");
  v22[0] = CFSTR("SchemaVersion");
  v22[1] = CFSTR("OnDemandQuery");
  v23[0] = &unk_1E6ABEE80;
  v23[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  v24[1] = CFSTR("Keys");
  v20[0] = CFSTR("timestampEnd");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_DateFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  v20[1] = CFSTR("EntryKey");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_StringFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v15;
  v20[2] = CFSTR("InsertCount");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v13;
  v20[3] = CFSTR("UpdateCount");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v3;
  v20[4] = CFSTR("State");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v5;
  v20[5] = CFSTR("WarningCount");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v7;
  v20[6] = CFSTR("SafetyDropCount");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[4];
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "isDebugEnabledForKey:", CFSTR("LogCacheFlush")))
  {
    v12[0] = CFSTR("OTA");
    objc_msgSend(a1, "entryEventPointDefinitionOTA");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v3;
    v12[1] = CFSTR("TimeCorrection");
    objc_msgSend(a1, "entryEventPointDefinitionTimeCorrection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v4;
    v12[2] = CFSTR("Archive");
    objc_msgSend(a1, "entryEventPointDefinitionArchive");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v5;
    v12[3] = CFSTR("PLLog");
    objc_msgSend(a1, "entryEventPointDefinitionPLLog");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v6;
    v12[4] = CFSTR("CacheFlush");
    objc_msgSend(a1, "entryEventPointDefinitionCacheFlush");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[4] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10[0] = CFSTR("OTA");
    objc_msgSend(a1, "entryEventPointDefinitionOTA");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v3;
    v10[1] = CFSTR("TimeCorrection");
    objc_msgSend(a1, "entryEventPointDefinitionTimeCorrection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v4;
    v10[2] = CFSTR("Archive");
    objc_msgSend(a1, "entryEventPointDefinitionArchive");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v5;
    v10[3] = CFSTR("PLLog");
    objc_msgSend(a1, "entryEventPointDefinitionPLLog");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)entryEventPointDefinitionCacheFlush
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
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("Configs");
  v12[0] = CFSTR("SchemaVersion");
  v12[1] = CFSTR("OnDemandQuery");
  v13[0] = &unk_1E6ABEE80;
  v13[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = CFSTR("Keys");
  v10[0] = CFSTR("Reason");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("Size");
  v11[0] = v4;
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
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

+ (id)entryEventPointDefinitionOTA
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
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("Configs");
  v14[0] = CFSTR("SchemaVersion");
  v14[1] = CFSTR("OnDemandQuery");
  v15[0] = &unk_1E6ABEE90;
  v15[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = CFSTR("Keys");
  v12[0] = CFSTR("Type");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("Name");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("Success");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_BoolFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventPointDefinitionTimeCorrection
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
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("Configs");
  v16[0] = CFSTR("SchemaVersion");
  v16[1] = CFSTR("OnDemandQuery");
  v17[0] = &unk_1E6ABEE80;
  v17[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = CFSTR("Keys");
  v14[0] = CFSTR("TimeReferenceType");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("TimeInReference");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_DateFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("ProjectedTimeInMonotonic");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_DateFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("CallStack");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitionArchive
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[11];
  _QWORD v29[11];
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[2];
  _QWORD v33[4];

  v33[2] = *MEMORY[0x1E0C80C00];
  v32[0] = CFSTR("Configs");
  v30[0] = CFSTR("SchemaVersion");
  v30[1] = CFSTR("OnDemandQuery");
  v31[0] = &unk_1E6ABEEA0;
  v31[1] = MEMORY[0x1E0C9AAA0];
  v30[2] = CFSTR("TrimConditionsTemplate");
  v30[3] = CFSTR("TrimConditionsTemplateArg");
  v31[2] = &unk_1E6ABB0C0;
  v31[3] = &unk_1E6ABEEB0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v27;
  v32[1] = CFSTR("Keys");
  v28[0] = CFSTR("StartDate");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_DateFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v25;
  v28[1] = CFSTR("EndDate");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_DateFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v23;
  v28[2] = CFSTR("SystemTimeOffset");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_RealFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v21;
  v28[3] = CFSTR("SystemTimeOffsetModified");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_BoolFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v19;
  v28[4] = CFSTR("UUID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_StringFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v17;
  v28[5] = CFSTR("FullMode");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_BoolFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v15;
  v28[6] = CFSTR("Stage");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v13;
  v28[7] = CFSTR("NumAttempts");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v3;
  v28[8] = CFSTR("SyncedOffDate");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_DateFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[8] = v5;
  v28[9] = CFSTR("RemovedDate");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_DateFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[9] = v7;
  v28[10] = CFSTR("MainDBSizeAtStart");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[10] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitionPLLog
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
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("Configs");
  v16[0] = CFSTR("SchemaVersion");
  v16[1] = CFSTR("OnDemandQuery");
  v17[0] = &unk_1E6ABEEC0;
  v17[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = CFSTR("Keys");
  v14[0] = CFSTR("file");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_StringFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("function");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("line");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("message");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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
  _QWORD v11[6];
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("SchemaChange");
  objc_msgSend(a1, "entryEventForwardDefinitionSchemaChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("Configuration");
  objc_msgSend(a1, "entryEventForwardDefinitionConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v11[2] = CFSTR("TimeOffset");
  objc_msgSend(a1, "entryEventForwardDefinitionTimeOffset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  v11[3] = CFSTR("ActivityStates");
  objc_msgSend(a1, "entryEventForwardDefinitionActivityStates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  v11[4] = CFSTR("TaskingMode");
  objc_msgSend(a1, "entryEventForwardDefinitionTaskingMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  v11[5] = CFSTR("SubmissionTag");
  objc_msgSend(a1, "entryEventForwardDefinitionSubmissionTag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventForwardDefinitionConfiguration
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
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[2];
  _QWORD v23[4];

  v23[2] = *MEMORY[0x1E0C80C00];
  v22[0] = CFSTR("Configs");
  v20[0] = CFSTR("SchemaVersion");
  v20[1] = CFSTR("OnDemandQuery");
  v21[0] = &unk_1E6ABEED0;
  v21[1] = MEMORY[0x1E0C9AAA0];
  v20[2] = CFSTR("TrimConditionsTemplate");
  v20[3] = CFSTR("TrimConditionsTemplateArg");
  v21[2] = &unk_1E6ABB0C0;
  v21[3] = &unk_1E6ABEEE0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  v22[1] = CFSTR("Keys");
  v18[0] = CFSTR("Mode");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_StringFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v18[1] = CFSTR("Version");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_RealFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  v18[2] = CFSTR("PID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v3;
  v18[3] = CFSTR("ProcessName");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v5;
  v18[4] = CFSTR("ExitReason");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v7;
  v18[5] = CFSTR("DefaultsEnabled");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventForwardDefinitionSchemaChange
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
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("Configs");
  v14[0] = CFSTR("SchemaVersion");
  v14[1] = CFSTR("OnDemandQuery");
  v15[0] = &unk_1E6ABEEF0;
  v15[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = CFSTR("Keys");
  v12[0] = CFSTR("TableName");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("PreviousVersion");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("CurrentVersion");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventForwardDefinitionTimeOffset
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
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("Configs");
  v14[0] = CFSTR("SchemaVersion");
  v14[1] = CFSTR("OnDemandQuery");
  v15[0] = &unk_1E6ABEE80;
  v15[1] = MEMORY[0x1E0C9AAA0];
  v14[2] = CFSTR("TrimConditionsTemplate");
  v14[3] = CFSTR("TrimConditionsTemplateArg");
  v15[2] = &unk_1E6ABB0C0;
  v15[3] = &unk_1E6ABEEE0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = CFSTR("Keys");
  v12[0] = CFSTR("kernel");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("system");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("baseband");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventForwardDefinitionActivityStates
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
  _QWORD v12[4];
  _QWORD v13[4];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("Configs");
  v12[0] = CFSTR("SchemaVersion");
  v12[1] = CFSTR("OnDemandQuery");
  v13[0] = &unk_1E6ABEEF0;
  v13[1] = MEMORY[0x1E0C9AAA0];
  v12[2] = CFSTR("TrimConditionsTemplate");
  v12[3] = CFSTR("TrimConditionsTemplateArg");
  v13[2] = &unk_1E6ABB0C0;
  v13[3] = &unk_1E6ABEEE0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = CFSTR("Keys");
  v10[0] = CFSTR("ActivityID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("State");
  v11[0] = v4;
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
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

+ (id)entryEventForwardDefinitionTaskingMode
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
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("Configs");
  v14[0] = CFSTR("SchemaVersion");
  v14[1] = CFSTR("OnDemandQuery");
  v15[0] = &unk_1E6ABEEC0;
  v15[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = CFSTR("Keys");
  v12[0] = CFSTR("Action");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("ErrorType");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("TaskingTablesPayload");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventForwardDefinitionSubmissionTag
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
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("Configs");
  v12[0] = CFSTR("SchemaVersion");
  v12[1] = CFSTR("TrimConditionsTemplate");
  v13[0] = &unk_1E6ABEEC0;
  v13[1] = &unk_1E6ABB0D8;
  v12[2] = CFSTR("TrimConditionsTemplateArg");
  v13[2] = &unk_1E6ABB0F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = CFSTR("Keys");
  v10[0] = CFSTR("UUIDTag");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("Reason");
  v11[0] = v4;
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
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

+ (id)entryEventNoneDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("Activity");
  objc_msgSend(a1, "entryEventNoneDefinitionActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("AdditionalTablesTurnedOn");
  v8[0] = v3;
  objc_msgSend(a1, "entryEventNoneDefinitionAdditionalTablesTurnedOn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryEventNoneDefinitionActivity
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
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("Configs");
  v14[0] = CFSTR("SchemaVersion");
  v14[1] = CFSTR("OnDemandQuery");
  v15[0] = &unk_1E6ABEE80;
  v15[1] = MEMORY[0x1E0C9AAA0];
  v14[2] = CFSTR("TrimConditionsTemplate");
  v15[2] = &unk_1E6ABB108;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = CFSTR("Keys");
  v12[0] = CFSTR("Identifier");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("Criteria");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("MustRunCriterion");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventNoneDefinitionAdditionalTablesTurnedOn
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("Configs");
  v10[0] = CFSTR("SchemaVersion");
  v10[1] = CFSTR("OnDemandQuery");
  v11[0] = &unk_1E6ABEE80;
  v11[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = CFSTR("Keys");
  v8 = CFSTR("TableName");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)eventIntervalCacheSizeWithPayload:(id)a3 withEntryDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  PLEntry *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", CFSTR("EventInterval"), CFSTR("CacheSize"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLEntry initWithEntryKey:withDate:]([PLEntry alloc], "initWithEntryKey:withDate:", v7, v5);

  -[PLEntry setObjectsFromRawData:](v8, "setObjectsFromRawData:", v6);
  return v8;
}

+ (id)eventPointCacheFlushWithPayload:(id)a3
{
  id v3;
  void *v4;
  PLEntry *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", CFSTR("EventPoint"), CFSTR("CacheFlush"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLEntry initWithEntryKey:withRawData:]([PLEntry alloc], "initWithEntryKey:withRawData:", v4, v3);

  return v5;
}

- (void)logEventPointCacheFlush:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__PLStorageOperator_logEventPointCacheFlush___block_invoke;
  v7[3] = &unk_1E6A521A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __45__PLStorageOperator_logEventPointCacheFlush___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "eventPointCacheFlushWithPayload:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v2);

}

- (void)logEventPointOTA:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__PLStorageOperator_logEventPointOTA___block_invoke;
  v7[3] = &unk_1E6A521A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __38__PLStorageOperator_logEventPointOTA___block_invoke(uint64_t a1)
{
  PLEntry *v2;
  id v3;

  objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", CFSTR("EventPoint"), CFSTR("OTA"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[PLEntry initWithEntryKey:withRawData:]([PLEntry alloc], "initWithEntryKey:withRawData:", v3, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v2);

}

- (void)logEventPointTimeCorrection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__PLStorageOperator_logEventPointTimeCorrection___block_invoke;
  v7[3] = &unk_1E6A521A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __49__PLStorageOperator_logEventPointTimeCorrection___block_invoke(uint64_t a1)
{
  PLEntry *v2;
  id v3;

  objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", CFSTR("EventPoint"), CFSTR("TimeCorrection"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[PLEntry initWithEntryKey:withRawData:]([PLEntry alloc], "initWithEntryKey:withRawData:", v3, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v2);

}

- (void)logEventPointArchive:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__PLStorageOperator_logEventPointArchive___block_invoke;
  v7[3] = &unk_1E6A521A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __42__PLStorageOperator_logEventPointArchive___block_invoke(uint64_t a1)
{
  PLEntry *v2;
  id v3;

  objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", CFSTR("EventPoint"), CFSTR("Archive"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[PLEntry initWithEntryKey:withRawData:]([PLEntry alloc], "initWithEntryKey:withRawData:", v3, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v2);

}

- (void)logEventPointPLLog:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__PLStorageOperator_logEventPointPLLog___block_invoke;
  v7[3] = &unk_1E6A521A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __40__PLStorageOperator_logEventPointPLLog___block_invoke(uint64_t a1)
{
  PLEntry *v2;
  id v3;

  objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", CFSTR("EventPoint"), CFSTR("PLLog"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[PLEntry initWithEntryKey:withRawData:]([PLEntry alloc], "initWithEntryKey:withRawData:", v3, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v2);

}

- (void)logEventForwardConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PLStorageOperator_logEventForwardConfiguration___block_invoke;
  v7[3] = &unk_1E6A521A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __50__PLStorageOperator_logEventForwardConfiguration___block_invoke(uint64_t a1)
{
  PLEntry *v2;
  id v3;

  objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", CFSTR("EventForward"), CFSTR("Configuration"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[PLEntry initWithEntryKey:withRawData:]([PLEntry alloc], "initWithEntryKey:withRawData:", v3, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v2);

}

- (void)logEventForwardSchemaChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__PLStorageOperator_logEventForwardSchemaChange___block_invoke;
  v7[3] = &unk_1E6A521A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __49__PLStorageOperator_logEventForwardSchemaChange___block_invoke(uint64_t a1)
{
  PLEntry *v2;
  id v3;

  objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", CFSTR("EventForward"), CFSTR("SchemaChange"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[PLEntry initWithEntryKey:withRawData:]([PLEntry alloc], "initWithEntryKey:withRawData:", v3, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v2);

}

- (void)logEventForwardTimeOffset:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__PLStorageOperator_logEventForwardTimeOffset___block_invoke;
  v7[3] = &unk_1E6A521A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __47__PLStorageOperator_logEventForwardTimeOffset___block_invoke(uint64_t a1)
{
  PLEntry *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", CFSTR("EventForward"), CFSTR("TimeOffset"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[PLEntry initWithEntryKey:withRawData:]([PLEntry alloc], "initWithEntryKey:withRawData:", v12, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v2);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  -[PLEntry entryDate](v2, "entryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logForSubsystem:category:data:date:", CFSTR("PPTStorageOperator"), CFSTR("TimeOffset"), v4, v5);

  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  -[PLEntry entryDate](v2, "entryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logForSubsystem:category:data:date:", CFSTR("XcodeMetrics"), CFSTR("TimeOffset"), v7, v8);

  v10 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  -[PLEntry entryDate](v2, "entryDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logForSubsystem:category:data:date:", CFSTR("BackgroundProcessing"), CFSTR("TimeOffset"), v9, v11);

}

- (void)logEventForwardTaskingMode:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__PLStorageOperator_logEventForwardTaskingMode___block_invoke;
  v7[3] = &unk_1E6A521A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __48__PLStorageOperator_logEventForwardTaskingMode___block_invoke(uint64_t a1)
{
  PLEntry *v2;
  id v3;

  objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", CFSTR("EventForward"), CFSTR("TaskingMode"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[PLEntry initWithEntryKey:withRawData:]([PLEntry alloc], "initWithEntryKey:withRawData:", v3, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v2);

}

- (void)logEventNoneAdditionalTablesTurnedOn:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__PLStorageOperator_logEventNoneAdditionalTablesTurnedOn___block_invoke;
  v7[3] = &unk_1E6A521A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __58__PLStorageOperator_logEventNoneAdditionalTablesTurnedOn___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PLEntry *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", CFSTR("EventNone"), CFSTR("AdditionalTablesTurnedOn"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v13 = a1;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = -[PLEntry initWithEntryKey:]([PLEntry alloc], "initWithEntryKey:", v2);
        -[PLEntry setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, CFSTR("TableName"));
        objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

  v11 = *(void **)(v13 + 32);
  v18 = v2;
  v19 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logEntries:withGroupID:", v12, v2);

}

- (void)logEventPointPreUnlock:(id)a3
{
  -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("PPTStorageOperator"), CFSTR("Configuration"), a3);
}

- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLStorageOperator, "entryKeyForType:andName:", CFSTR("EventNone"), CFSTR("Activity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLStorageOperator, "entryKeyForType:andName:", CFSTR("EventForward"), CFSTR("ActivityStates"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ID NOT IN (SELECT %@ FROM %@)"), CFSTR("ActivityID"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
