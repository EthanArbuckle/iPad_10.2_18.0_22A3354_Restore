@implementation PLAccountingOperator

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingOperator;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventNoneDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("Nodes");
  objc_msgSend((id)objc_opt_class(), "entryEventNoneDefinitionNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("DistributionRules");
  objc_msgSend((id)objc_opt_class(), "entryEventNoneDefinitionDistributionRules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("QualificationRules");
  objc_msgSend((id)objc_opt_class(), "entryEventNoneDefinitionQualificationRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryEventNoneDefinitionNodes
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
  v13[0] = &unk_1E6ABEF00;
  v13[1] = &unk_1E6ABB120;
  v12[2] = CFSTR("AppIdentifierKeys");
  v13[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = CFSTR("Keys");
  v10[0] = CFSTR("Name");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat_withBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("IsPermanent");
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

+ (id)entryEventNoneDefinitionDistributionRules
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
  v14[1] = CFSTR("TrimConditionsTemplate");
  v15[0] = &unk_1E6ABEF10;
  v15[1] = &unk_1E6ABB120;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = CFSTR("Keys");
  v12[0] = CFSTR("NodeID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("RootNodeID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("DistributionID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventNoneDefinitionQualificationRules
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
  v12[1] = CFSTR("TrimConditionsTemplate");
  v13[0] = &unk_1E6ABEF10;
  v13[1] = &unk_1E6ABB120;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = CFSTR("Keys");
  v10[0] = CFSTR("RootNodeID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("QualificationID");
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

+ (id)entryEventForwardDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("PowerEvents");
  objc_msgSend((id)objc_opt_class(), "entryEventForwardDefinitionPowerEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("DistributionEvents");
  objc_msgSend((id)objc_opt_class(), "entryEventForwardDefinitionDistributionEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("QualificationEvents");
  objc_msgSend((id)objc_opt_class(), "entryEventForwardDefinitionQualificationEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryEventForwardDefinitionPowerEvents
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
  const __CFString *v13;
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[5];

  v19[3] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("Configs");
  v16[0] = CFSTR("SchemaVersion");
  v16[1] = CFSTR("SQLPrepareStatementCaching");
  v17[0] = &unk_1E6ABEF20;
  v17[1] = MEMORY[0x1E0C9AAB0];
  v16[2] = CFSTR("SubEntryKey");
  v17[2] = CFSTR("RootNodeID");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v2;
  v18[1] = CFSTR("Keys");
  v14[0] = CFSTR("RootNodeID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v14[1] = CFSTR("Power");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  v14[2] = CFSTR("StartOffset");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v9;
  v18[2] = CFSTR("IndexKeys");
  v13 = CFSTR("RootNodeID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventForwardDefinitionDistributionEvents
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
  _QWORD v17[2];
  const __CFString *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[6];

  v27[4] = *MEMORY[0x1E0C80C00];
  v26[0] = CFSTR("Configs");
  v24[0] = CFSTR("SchemaVersion");
  v24[1] = CFSTR("DynamicDefinition");
  v25[0] = &unk_1E6ABEF20;
  v25[1] = MEMORY[0x1E0C9AAB0];
  v24[2] = CFSTR("SQLPrepareStatementCaching");
  v24[3] = CFSTR("SubEntryKey");
  v25[2] = MEMORY[0x1E0C9AAB0];
  v25[3] = CFSTR("DistributionID");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v16;
  v26[1] = CFSTR("Keys");
  v22[0] = CFSTR("DistributionID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = CFSTR("StartOffset");
  v23[0] = v14;
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v3;
  v26[2] = CFSTR("DynamicKeys");
  v20[0] = CFSTR("key");
  v18 = CFSTR("ChildNodeID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = CFSTR("value");
  v21[0] = v6;
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v9;
  v26[3] = CFSTR("IndexKeys");
  v17[0] = CFSTR("DistributionID");
  v17[1] = CFSTR("FK_ID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventForwardDefinitionQualificationEvents
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
  _QWORD v17[2];
  const __CFString *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[6];

  v27[4] = *MEMORY[0x1E0C80C00];
  v26[0] = CFSTR("Configs");
  v24[0] = CFSTR("SchemaVersion");
  v24[1] = CFSTR("DynamicDefinition");
  v25[0] = &unk_1E6ABEF20;
  v25[1] = MEMORY[0x1E0C9AAB0];
  v24[2] = CFSTR("SQLPrepareStatementCaching");
  v24[3] = CFSTR("SubEntryKey");
  v25[2] = MEMORY[0x1E0C9AAB0];
  v25[3] = CFSTR("QualificationID");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v16;
  v26[1] = CFSTR("Keys");
  v22[0] = CFSTR("QualificationID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = CFSTR("StartOffset");
  v23[0] = v14;
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v3;
  v26[2] = CFSTR("DynamicKeys");
  v20[0] = CFSTR("key");
  v18 = CFSTR("ChildNodeID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = CFSTR("value");
  v21[0] = v6;
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v9;
  v26[3] = CFSTR("IndexKeys");
  v17[0] = CFSTR("QualificationID");
  v17[1] = CFSTR("FK_ID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventBackwardDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("PowerEvents");
  objc_msgSend((id)objc_opt_class(), "entryEventBackwardDefinitionPowerEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("DistributionEvents");
  objc_msgSend((id)objc_opt_class(), "entryEventBackwardDefinitionDistributionEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("QualificationEvents");
  objc_msgSend((id)objc_opt_class(), "entryEventBackwardDefinitionQualificationEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryEventBackwardDefinitionPowerEvents
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
  const __CFString *v13;
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[5];

  v19[3] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("Configs");
  v16[0] = CFSTR("SchemaVersion");
  v16[1] = CFSTR("SQLPrepareStatementCaching");
  v17[0] = &unk_1E6ABEF20;
  v17[1] = MEMORY[0x1E0C9AAB0];
  v16[2] = CFSTR("SubEntryKey");
  v17[2] = CFSTR("RootNodeID");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v2;
  v18[1] = CFSTR("Keys");
  v14[0] = CFSTR("RootNodeID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v14[1] = CFSTR("Power");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  v14[2] = CFSTR("EndOffset");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v9;
  v18[2] = CFSTR("IndexKeys");
  v13 = CFSTR("RootNodeID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventBackwardDefinitionDistributionEvents
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
  _QWORD v17[2];
  const __CFString *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[6];

  v27[4] = *MEMORY[0x1E0C80C00];
  v26[0] = CFSTR("Configs");
  v24[0] = CFSTR("SchemaVersion");
  v24[1] = CFSTR("DynamicDefinition");
  v25[0] = &unk_1E6ABEF20;
  v25[1] = MEMORY[0x1E0C9AAB0];
  v24[2] = CFSTR("SQLPrepareStatementCaching");
  v24[3] = CFSTR("SubEntryKey");
  v25[2] = MEMORY[0x1E0C9AAB0];
  v25[3] = CFSTR("DistributionID");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v16;
  v26[1] = CFSTR("Keys");
  v22[0] = CFSTR("DistributionID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = CFSTR("EndOffset");
  v23[0] = v14;
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v3;
  v26[2] = CFSTR("DynamicKeys");
  v20[0] = CFSTR("key");
  v18 = CFSTR("ChildNodeID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = CFSTR("value");
  v21[0] = v6;
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v9;
  v26[3] = CFSTR("IndexKeys");
  v17[0] = CFSTR("DistributionID");
  v17[1] = CFSTR("FK_ID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventBackwardDefinitionQualificationEvents
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
  _QWORD v17[2];
  const __CFString *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[6];

  v27[4] = *MEMORY[0x1E0C80C00];
  v26[0] = CFSTR("Configs");
  v24[0] = CFSTR("SchemaVersion");
  v24[1] = CFSTR("DynamicDefinition");
  v25[0] = &unk_1E6ABEF20;
  v25[1] = MEMORY[0x1E0C9AAB0];
  v24[2] = CFSTR("SQLPrepareStatementCaching");
  v24[3] = CFSTR("SubEntryKey");
  v25[2] = MEMORY[0x1E0C9AAB0];
  v25[3] = CFSTR("QualificationID");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v16;
  v26[1] = CFSTR("Keys");
  v22[0] = CFSTR("QualificationID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = CFSTR("EndOffset");
  v23[0] = v14;
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v3;
  v26[2] = CFSTR("DynamicKeys");
  v20[0] = CFSTR("key");
  v18 = CFSTR("ChildNodeID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = CFSTR("value");
  v21[0] = v6;
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v9;
  v26[3] = CFSTR("IndexKeys");
  v17[0] = CFSTR("QualificationID");
  v17[1] = CFSTR("FK_ID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventIntervalDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("PowerEvents");
  objc_msgSend((id)objc_opt_class(), "entryEventIntervalDefinitionPowerEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("EnergyEstimateEvents");
  objc_msgSend((id)objc_opt_class(), "entryEventIntervalDefinitionEnergyEstimateEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("DistributionEvents");
  objc_msgSend((id)objc_opt_class(), "entryEventIntervalDefinitionDistributionEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("QualificationEvents");
  objc_msgSend((id)objc_opt_class(), "entryEventIntervalDefinitionQualificationEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventIntervalDefinitionPowerEvents
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
  const __CFString *v15;
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[5];

  v21[3] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("Configs");
  v18[0] = CFSTR("SchemaVersion");
  v18[1] = CFSTR("SQLPrepareStatementCaching");
  v19[0] = &unk_1E6ABEF20;
  v19[1] = MEMORY[0x1E0C9AAB0];
  v18[2] = CFSTR("SubEntryKey");
  v19[2] = CFSTR("RootNodeID");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  v20[1] = CFSTR("Keys");
  v16[0] = CFSTR("RootNodeID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = CFSTR("Power");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  v16[2] = CFSTR("StartOffset");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v6;
  v16[3] = CFSTR("EndOffset");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  v20[2] = CFSTR("IndexKeys");
  v15 = CFSTR("RootNodeID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventIntervalDefinitionEnergyEstimateEvents
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
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[2];
  _QWORD v27[4];

  v27[2] = *MEMORY[0x1E0C80C00];
  v26[0] = CFSTR("Configs");
  v24[0] = CFSTR("SchemaVersion");
  v24[1] = CFSTR("SQLPrepareStatementCaching");
  v25[0] = &unk_1E6ABEF30;
  v25[1] = MEMORY[0x1E0C9AAB0];
  v24[2] = CFSTR("SubEntryKey");
  v25[2] = CFSTR("NodeID");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = CFSTR("Keys");
  v27[0] = v21;
  v22[0] = CFSTR("NodeID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  v22[1] = CFSTR("RootNodeID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  v22[2] = CFSTR("ParentEntryID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v15;
  v22[3] = CFSTR("Energy");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v13;
  v22[4] = CFSTR("CorrectionEnergy");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v3;
  v22[5] = CFSTR("TerminationRatio");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v5;
  v22[6] = CFSTR("StartOffset");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v7;
  v22[7] = CFSTR("EndOffset");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
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

+ (id)entryEventIntervalDefinitionDistributionEvents
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
  _QWORD v19[2];
  const __CFString *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[6];

  v29[4] = *MEMORY[0x1E0C80C00];
  v28[0] = CFSTR("Configs");
  v26[0] = CFSTR("SchemaVersion");
  v26[1] = CFSTR("DynamicDefinition");
  v27[0] = &unk_1E6ABEF20;
  v27[1] = MEMORY[0x1E0C9AAB0];
  v26[2] = CFSTR("SQLPrepareStatementCaching");
  v26[3] = CFSTR("SubEntryKey");
  v27[2] = MEMORY[0x1E0C9AAB0];
  v27[3] = CFSTR("DistributionID");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v18;
  v28[1] = CFSTR("Keys");
  v24[0] = CFSTR("DistributionID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  v24[1] = CFSTR("StartOffset");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  v24[2] = CFSTR("EndOffset");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v3;
  v28[2] = CFSTR("DynamicKeys");
  v22[0] = CFSTR("key");
  v20 = CFSTR("ChildNodeID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = CFSTR("value");
  v23[0] = v6;
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v9;
  v28[3] = CFSTR("IndexKeys");
  v19[0] = CFSTR("DistributionID");
  v19[1] = CFSTR("FK_ID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventIntervalDefinitionQualificationEvents
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
  _QWORD v19[2];
  const __CFString *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[6];

  v29[4] = *MEMORY[0x1E0C80C00];
  v28[0] = CFSTR("Configs");
  v26[0] = CFSTR("SchemaVersion");
  v26[1] = CFSTR("DynamicDefinition");
  v27[0] = &unk_1E6ABEF20;
  v27[1] = MEMORY[0x1E0C9AAB0];
  v26[2] = CFSTR("SQLPrepareStatementCaching");
  v26[3] = CFSTR("SubEntryKey");
  v27[2] = MEMORY[0x1E0C9AAB0];
  v27[3] = CFSTR("QualificationID");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v18;
  v28[1] = CFSTR("Keys");
  v24[0] = CFSTR("QualificationID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  v24[1] = CFSTR("StartOffset");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  v24[2] = CFSTR("EndOffset");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v3;
  v28[2] = CFSTR("DynamicKeys");
  v22[0] = CFSTR("key");
  v20 = CFSTR("ChildNodeID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = CFSTR("value");
  v23[0] = v6;
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v9;
  v28[3] = CFSTR("IndexKeys");
  v19[0] = CFSTR("QualificationID");
  v19[1] = CFSTR("FK_ID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("DistributionEvents");
  objc_msgSend((id)objc_opt_class(), "entryEventPointDefinitionDistributionEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("QualificationEvents");
  v7[0] = v2;
  objc_msgSend((id)objc_opt_class(), "entryEventPointDefinitionQualificationEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)entryEventPointDefinitionDistributionEvents
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
  _QWORD v17[2];
  const __CFString *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[6];

  v27[4] = *MEMORY[0x1E0C80C00];
  v26[0] = CFSTR("Configs");
  v24[0] = CFSTR("SchemaVersion");
  v24[1] = CFSTR("DynamicDefinition");
  v25[0] = &unk_1E6ABEF20;
  v25[1] = MEMORY[0x1E0C9AAB0];
  v24[2] = CFSTR("SQLPrepareStatementCaching");
  v24[3] = CFSTR("SubEntryKey");
  v25[2] = MEMORY[0x1E0C9AAB0];
  v25[3] = CFSTR("DistributionID");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v16;
  v26[1] = CFSTR("Keys");
  v22[0] = CFSTR("DistributionID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = CFSTR("StartOffset");
  v23[0] = v14;
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v3;
  v26[2] = CFSTR("DynamicKeys");
  v20[0] = CFSTR("key");
  v18 = CFSTR("ChildNodeID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = CFSTR("value");
  v21[0] = v6;
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v9;
  v26[3] = CFSTR("IndexKeys");
  v17[0] = CFSTR("DistributionID");
  v17[1] = CFSTR("FK_ID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitionQualificationEvents
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
  _QWORD v17[2];
  const __CFString *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[6];

  v27[4] = *MEMORY[0x1E0C80C00];
  v26[0] = CFSTR("Configs");
  v24[0] = CFSTR("SchemaVersion");
  v24[1] = CFSTR("DynamicDefinition");
  v25[0] = &unk_1E6ABEF20;
  v25[1] = MEMORY[0x1E0C9AAB0];
  v24[2] = CFSTR("SQLPrepareStatementCaching");
  v24[3] = CFSTR("SubEntryKey");
  v25[2] = MEMORY[0x1E0C9AAB0];
  v25[3] = CFSTR("QualificationID");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v16;
  v26[1] = CFSTR("Keys");
  v22[0] = CFSTR("QualificationID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = CFSTR("StartOffset");
  v23[0] = v14;
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v3;
  v26[2] = CFSTR("DynamicKeys");
  v20[0] = CFSTR("key");
  v18 = CFSTR("ChildNodeID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = CFSTR("value");
  v21[0] = v6;
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v9;
  v26[3] = CFSTR("IndexKeys");
  v17[0] = CFSTR("QualificationID");
  v17[1] = CFSTR("FK_ID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryAggregateDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("RootNodeEnergy");
  objc_msgSend(a1, "entryAggregateDefinitionEnergy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("QualificationEnergy");
  v8[0] = v3;
  objc_msgSend(a1, "entryAggregateDefinitionQualificationEnergy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryAggregateDefinitionEnergy
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
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[6];

  v28[4] = *MEMORY[0x1E0C80C00];
  v27[0] = CFSTR("Configs");
  v25[0] = CFSTR("SchemaVersion");
  v25[1] = CFSTR("AggregateWallClockBucket");
  v26[0] = &unk_1E6ABEF20;
  v26[1] = MEMORY[0x1E0C9AAB0];
  v25[2] = CFSTR("SQLPrepareStatementCaching");
  v25[3] = CFSTR("TrimConditionsTemplate");
  v26[2] = MEMORY[0x1E0C9AAB0];
  v26[3] = &unk_1E6ABB120;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v15;
  v27[1] = CFSTR("Keys");
  v23[0] = CFSTR("NodeID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v13;
  v23[1] = CFSTR("RootNodeID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v3;
  v23[2] = CFSTR("Energy");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v6;
  v27[2] = CFSTR("AggregateBuckets");
  v21[0] = &unk_1E6ABEF40;
  v19 = CFSTR("AggregateBucketRetainDuration");
  v20 = &unk_1E6ABEF50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = &unk_1E6ABEF60;
  v22[0] = v7;
  v17 = CFSTR("AggregateBucketRetainDuration");
  v18 = &unk_1E6ABEF70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v9;
  v27[3] = CFSTR("AggregateKeys");
  v16 = CFSTR("Energy");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryAggregateDefinitionQualificationEnergy
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
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[6];

  v30[4] = *MEMORY[0x1E0C80C00];
  v29[0] = CFSTR("Configs");
  v27[0] = CFSTR("SchemaVersion");
  v27[1] = CFSTR("AggregateWallClockBucket");
  v28[0] = &unk_1E6ABEF20;
  v28[1] = MEMORY[0x1E0C9AAB0];
  v27[2] = CFSTR("SQLPrepareStatementCaching");
  v27[3] = CFSTR("TrimConditionsTemplate");
  v28[2] = MEMORY[0x1E0C9AAB0];
  v28[3] = &unk_1E6ABB120;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v17;
  v29[1] = CFSTR("Keys");
  v25[0] = CFSTR("NodeID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  v25[1] = CFSTR("RootNodeID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v13;
  v25[2] = CFSTR("QualificationID");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v3;
  v25[3] = CFSTR("Energy");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v6;
  v29[2] = CFSTR("AggregateBuckets");
  v23[0] = &unk_1E6ABEF40;
  v21 = CFSTR("AggregateBucketRetainDuration");
  v22 = &unk_1E6ABEF50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = &unk_1E6ABEF60;
  v24[0] = v7;
  v19 = CFSTR("AggregateBucketRetainDuration");
  v20 = &unk_1E6ABEF70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v9;
  v29[3] = CFSTR("AggregateKeys");
  v18 = CFSTR("Energy");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (PLAccountingOperator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLAccountingOperator;
  return -[PLOperator init](&v3, sel_init);
}

- (void)initOperatorDependancies
{
  +[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd");
}

- (void)startAccounting
{
  void *v2;
  id v3;

  +[PLEntryKey setupEntryObjectsForOperatorClass:](PLEntryKey, "setupEntryObjectsForOperatorClass:", objc_opt_class());
  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setupStorageForOperatorClass:", objc_opt_class());

}

- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLAccountingOperator, "entryKeyForType:andName:", CFSTR("EventNone"), CFSTR("Nodes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  +[PLOperator entryKeyForType:andName:](PLAccountingOperator, "entryKeyForType:andName:", CFSTR("Aggregate"), CFSTR("RootNodeEnergy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(ID > %i) AND (%@ = 0) AND (ID NOT IN (SELECT %@ FROM '%@'))"), 10000, CFSTR("IsPermanent"), CFSTR("NodeID"), v7);
  }
  else
  {
    v9 = objc_msgSend(v4, "isEqualToString:", v7);

    if (v9
      || (+[PLOperator entryKeyForType:andName:](PLAccountingOperator, "entryKeyForType:andName:", CFSTR("Aggregate"), CFSTR("QualificationEnergy")), v10 = (void *)objc_claimAutoreleasedReturnValue(), v11 = objc_msgSend(v4, "isEqualToString:", v10), v10, v11))
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dateByAddingTimeInterval:", -1209600.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSince1970");
      v15 = v14;
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dateByAddingTimeInterval:", -1209600.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSince1970");
      v19 = v18;
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dateByAddingTimeInterval:", -2592000.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSince1970");
      objc_msgSend(v12, "stringWithFormat:", CFSTR("(timeInterval = %f AND timestamp < %f) OR (timeInterval = %f AND Energy < %f AND timestamp < %f) OR (timeInterval = %f AND timestamp < %f)"), 0x40AC200000000000, v15, 0x40F5180000000000, 0x40F86A0000000000, v19, 0x40F5180000000000, v22);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    +[PLOperator entryKeyForType:andName:](PLAccountingOperator, "entryKeyForType:andName:", CFSTR("EventNone"), CFSTR("DistributionRules"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v4, "isEqualToString:", v24);

    if (!v25)
    {
      +[PLOperator entryKeyForType:andName:](PLAccountingOperator, "entryKeyForType:andName:", CFSTR("EventNone"), CFSTR("QualificationRules"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v4, "isEqualToString:", v26);

      if (!v27)
      {
        v8 = 0;
        goto LABEL_8;
      }
    }
    v28 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    objc_msgSend(v28, "stringWithFormat:", CFSTR("timestamp<%f"), v29, v30, v31, v32);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

LABEL_8:
  return v8;
}

- (NSSet)rules
{
  return self->_rules;
}

- (void)setRules:(id)a3
{
  objc_storeStrong((id *)&self->_rules, a3);
}

- (NSMutableDictionary)ruleIDToPendingJobs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRuleIDToPendingJobs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleIDToPendingJobs, 0);
  objc_storeStrong((id *)&self->_rules, 0);
}

@end
