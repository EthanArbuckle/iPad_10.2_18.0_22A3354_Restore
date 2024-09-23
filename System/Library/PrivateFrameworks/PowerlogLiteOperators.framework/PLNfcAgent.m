@implementation PLNfcAgent

- (void)fieldChangedWithEntry:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("State"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0.0;
  if (v5)
  {
    -[PLNfcAgent onPower](self, "onPower");
    v7 = v8;
  }
  objc_msgSend(v10, "entryDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 16, v9, v7);

  -[PLOperator logEntry:](self, "logEntry:", v10);
}

- (double)onPower
{
  return self->_onPower;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLNfcAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("Card");
  objc_msgSend(a1, "entryEventForwardDefinitionCard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("Field");
  objc_msgSend(a1, "entryEventForwardDefinitionField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("Transaction");
  objc_msgSend(a1, "entryEventForwardDefinitionTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("TSMCommunication");
  objc_msgSend(a1, "entryEventForwardDefinitionTSMCommunication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("LPEM");
  objc_msgSend(a1, "entryEventForwardDefinitionLPEM");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventForwardDefinitionCard
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
  v11 = &unk_1E86534B0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("AuthorizedStatus");
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

+ (id)entryEventForwardDefinitionField
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
  v2 = *MEMORY[0x1E0D802B8];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E86534B0;
  v12[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("State");
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

+ (id)entryEventForwardDefinitionTransaction
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
  v11 = &unk_1E86534B0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("Status");
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

+ (id)entryEventForwardDefinitionTSMCommunication
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
  v11 = &unk_1E86534B0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("Status");
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

+ (id)entryEventForwardDefinitionLPEM
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
  _QWORD v27[10];
  _QWORD v28[10];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[4];

  v32[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "hasLPEM"))
    return MEMORY[0x1E0C9AA70];
  v31[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80330];
  v29[0] = *MEMORY[0x1E0D80318];
  v29[1] = v2;
  v30[0] = &unk_1E86534B0;
  v30[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v26;
  v31[1] = *MEMORY[0x1E0D802F0];
  v27[0] = CFSTR("BTCC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v24;
  v27[1] = CFSTR("BTCT");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v22;
  v27[2] = CFSTR("SRSC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v20;
  v27[3] = CFSTR("SRST");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v18;
  v27[4] = CFSTR("SRUC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v16;
  v27[5] = CFSTR("SRLC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v14;
  v27[6] = CFSTR("SERESET");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[6] = v4;
  v27[7] = CFSTR("ROLL");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[7] = v6;
  v27[8] = CFSTR("BTENTRY");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[8] = v8;
  v27[9] = CFSTR("BTEXIT");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
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
  v6[0] = CFSTR("Power");
  +[PLNfcAgent entryEventIntervalDefinitionPower](PLNfcAgent, "entryEventIntervalDefinitionPower");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("AccessoryPower");
  v7[0] = v2;
  +[PLNfcAgent entryEventIntervalDefinitionAccessoryPower](PLNfcAgent, "entryEventIntervalDefinitionAccessoryPower");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)entryEventIntervalDefinitionPower
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
  _QWORD v31[12];
  _QWORD v32[12];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[4];

  v36[2] = *MEMORY[0x1E0C80C00];
  v35[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80330];
  v33[0] = *MEMORY[0x1E0D80318];
  v33[1] = v2;
  v34[0] = &unk_1E86534C0;
  v34[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v30;
  v35[1] = *MEMORY[0x1E0D802F0];
  v31[0] = CFSTR("idleTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v28;
  v31[1] = CFSTR("rfTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v26;
  v31[2] = CFSTR("sleepTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v24;
  v31[3] = CFSTR("SEUptime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v22;
  v31[4] = CFSTR("lpcdFalseDetectCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v20;
  v31[5] = CFSTR("falseDetect");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v18;
  v31[6] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_DateFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v16;
  v31[7] = CFSTR("expressUpTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[7] = v14;
  v31[8] = CFSTR("fieldDetectUpTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32[8] = v4;
  v31[9] = CFSTR("uiccUpCounter");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[9] = v6;
  v31[10] = CFSTR("jcopUpCounter");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[10] = v8;
  v31[11] = CFSTR("mboxStatus");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32[11] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventIntervalDefinitionAccessoryPower
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
  _QWORD v24[9];
  _QWORD v25[9];
  uint64_t v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "hasCapability:", 7))
    return MEMORY[0x1E0C9AA70];
  v28[0] = *MEMORY[0x1E0D80298];
  v26 = *MEMORY[0x1E0D80318];
  v27 = &unk_1E86534B0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  v28[1] = *MEMORY[0x1E0D802F0];
  v24[0] = CFSTR("idleTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  v24[1] = CFSTR("rfTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v19;
  v24[2] = CFSTR("sleepTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v17;
  v24[3] = CFSTR("SEUptime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v15;
  v24[4] = CFSTR("lpcdFalseDetectCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v13;
  v24[5] = CFSTR("falseDetect");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v3;
  v24[6] = CFSTR("vGpioFalseDetectCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v5;
  v24[7] = CFSTR("vGpioFalseDetectCountWithTags");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v7;
  v24[8] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_DateFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (PLNfcAgent)init
{
  PLNfcAgent *v3;
  objc_super v5;

  if (objc_msgSend(MEMORY[0x1E0D80020], "hasNFC"))
  {
    v5.receiver = self;
    v5.super_class = (Class)PLNfcAgent;
    self = -[PLAgent init](&v5, sel_init);
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];

  if (-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)logFieldChangedNotificationReceived, CFSTR("com.apple.powerlogd.PLNfcAgent.logFieldChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  objc_msgSend(MEMORY[0x1E0D80078], "powerModelForOperatorName:", CFSTR("nfc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("field"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  -[PLNfcAgent setOnPower:](self, "setOnPower:");

  v6 = objc_alloc(MEMORY[0x1E0D80090]);
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __38__PLNfcAgent_initOperatorDependancies__block_invoke;
  v15[3] = &unk_1E8578610;
  v15[4] = self;
  v8 = (void *)objc_msgSend(v6, "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D0E8, v15);
  -[PLNfcAgent setCardNotification:](self, "setCardNotification:", v8);

  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __38__PLNfcAgent_initOperatorDependancies__block_invoke_120;
  v14[3] = &unk_1E8578610;
  v14[4] = self;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D110, v14);
  -[PLNfcAgent setFieldNotification:](self, "setFieldNotification:", v9);

  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __38__PLNfcAgent_initOperatorDependancies__block_invoke_127;
  v13[3] = &unk_1E8578610;
  v13[4] = self;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D138, v13);
  -[PLNfcAgent setTransactionNotification:](self, "setTransactionNotification:", v10);

  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __38__PLNfcAgent_initOperatorDependancies__block_invoke_134;
  v12[3] = &unk_1E8578610;
  v12[4] = self;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D160, v12);
  -[PLNfcAgent setTsmCommunicationNotification:](self, "setTsmCommunicationNotification:", v11);

  -[PLNfcAgent setupNfcAccessoryPowerCounterRetrieval](self, "setupNfcAccessoryPowerCounterRetrieval");
}

void __38__PLNfcAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[5];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D7FFA0];
  v7 = a5;
  if (objc_msgSend(v6, "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__PLNfcAgent_initOperatorDependancies__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1ED884AB0 != -1)
      dispatch_once(&qword_1ED884AB0, block);
    if (_MergedGlobals_1_48)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLNfcAgent::cardNotification fired"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNfcAgent initOperatorDependancies]_block_invoke");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 284);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v9;
        _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLNfcAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Card"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(void **)(a1 + 32);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v15, v7);

  objc_msgSend(v16, "logEntry:", v17);
}

uint64_t __38__PLNfcAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_48 = result;
  return result;
}

void __38__PLNfcAgent_initOperatorDependancies__block_invoke_120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD block[5];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D7FFA0];
  v7 = a5;
  if (objc_msgSend(v6, "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__PLNfcAgent_initOperatorDependancies__block_invoke_2_121;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1ED884AB8 != -1)
      dispatch_once(&qword_1ED884AB8, block);
    if (byte_1ED884A99)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLNfcAgent::fieldNotification fired"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNfcAgent initOperatorDependancies]_block_invoke");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 292);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v9;
        _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLNfcAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Field"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v15, v7);

  objc_msgSend(*(id *)(a1 + 32), "fieldChangedWithEntry:", v16);
  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v16);

}

uint64_t __38__PLNfcAgent_initOperatorDependancies__block_invoke_2_121(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884A99 = result;
  return result;
}

void __38__PLNfcAgent_initOperatorDependancies__block_invoke_127(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[5];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D7FFA0];
  v7 = a5;
  if (objc_msgSend(v6, "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__PLNfcAgent_initOperatorDependancies__block_invoke_2_128;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1ED884AC0 != -1)
      dispatch_once(&qword_1ED884AC0, block);
    if (byte_1ED884A9A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLNfcAgent::transactionNotification fired"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNfcAgent initOperatorDependancies]_block_invoke");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 304);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v9;
        _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLNfcAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Transaction"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(void **)(a1 + 32);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v15, v7);

  objc_msgSend(v16, "logEntry:", v17);
}

uint64_t __38__PLNfcAgent_initOperatorDependancies__block_invoke_2_128(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884A9A = result;
  return result;
}

void __38__PLNfcAgent_initOperatorDependancies__block_invoke_134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[5];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D7FFA0];
  v7 = a5;
  if (objc_msgSend(v6, "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__PLNfcAgent_initOperatorDependancies__block_invoke_2_135;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1ED884AC8 != -1)
      dispatch_once(&qword_1ED884AC8, block);
    if (byte_1ED884A9B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLNfcAgent::tsmCommunicationNotification fired"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNfcAgent initOperatorDependancies]_block_invoke");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 312);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v9;
        _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLNfcAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("TSMCommunication"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(void **)(a1 + 32);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v15, v7);

  objc_msgSend(v16, "logEntry:", v17);
}

uint64_t __38__PLNfcAgent_initOperatorDependancies__block_invoke_2_135(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884A9B = result;
  return result;
}

- (void)setupLPEMCounter
{
  id v3;
  void *v4;
  void *v5;
  PLTimer *v6;
  PLTimer *nfcConnectionRetryTimer;
  _QWORD v8[5];

  if (objc_msgSend(MEMORY[0x1E0D80020], "hasLPEM"))
  {
    self->_nfcConnectionRetryCount = 0;
    v3 = objc_alloc(MEMORY[0x1E0D80070]);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 300.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator workQueue](self, "workQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __30__PLNfcAgent_setupLPEMCounter__block_invoke;
    v8[3] = &unk_1E8578078;
    v8[4] = self;
    v6 = (PLTimer *)objc_msgSend(v3, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v4, 1, 0, v5, v8, 300.0, 0.0);
    nfcConnectionRetryTimer = self->_nfcConnectionRetryTimer;
    self->_nfcConnectionRetryTimer = v6;

  }
}

uint64_t __30__PLNfcAgent_setupLPEMCounter__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "getNFCHarwareState");
  if ((_DWORD)result != 4)
  {
    if ((_DWORD)result != 2)
    {
      ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 48);
      v3 = *(_QWORD *)(a1 + 32);
      if (*(int *)(v3 + 48) <= 4)
        return result;
      return objc_msgSend(*(id *)(v3 + 128), "invalidate");
    }
    objc_msgSend(*(id *)(a1 + 32), "logEventForwardLPEM");
  }
  v3 = *(_QWORD *)(a1 + 32);
  return objc_msgSend(*(id *)(v3 + 128), "invalidate");
}

- (void)initTaskOperatorDependancies
{
  -[PLNfcAgent setupLPEMCounter](self, "setupLPEMCounter");
  -[PLNfcAgent setUpNfcPowerCounterRetrieval](self, "setUpNfcPowerCounterRetrieval");
}

- (void)setUpNfcPowerCounterRetrieval
{
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  id v37;
  _QWORD block[5];
  id v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D51950], "sharedHardwareManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v4 = objc_msgSend(v3, "queryHardwareSupport:", &v39);
  v5 = v39;

  if (v4 != 4)
  {
    objc_msgSend(MEMORY[0x1E0D51950], "sharedHardwareManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v5;
    objc_msgSend(v13, "getPowerCounters:", &v37);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v37;

    v15 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
    v16 = MEMORY[0x1E0C809B0];
    if (v15)
    {
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __43__PLNfcAgent_setUpNfcPowerCounterRetrieval__block_invoke_146;
      v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v36[4] = objc_opt_class();
      if (qword_1ED884AD8 != -1)
        dispatch_once(&qword_1ED884AD8, v36);
      if (byte_1ED884A9D)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Initial NFC power counters: %@, error: %@"), v7, v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNfcAgent setUpNfcPowerCounterRetrieval]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 366);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v17;
          _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v16 = MEMORY[0x1E0C809B0];
      }
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLNfcAgent setLastPowerCountersLogTime:](self, "setLastPowerCountersLogTime:", v23);

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v35[0] = v16;
      v35[1] = 3221225472;
      v35[2] = __43__PLNfcAgent_setUpNfcPowerCounterRetrieval__block_invoke_151;
      v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v35[4] = objc_opt_class();
      if (qword_1ED884AE0 != -1)
        dispatch_once(&qword_1ED884AE0, v35);
      if (byte_1ED884A9E)
      {
        v24 = v16;
        v25 = (void *)MEMORY[0x1E0CB3940];
        -[PLNfcAgent lastPowerCountersLogTime](self, "lastPowerCountersLogTime");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("NFC power logging start time: %@"), v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "lastPathComponent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNfcAgent setUpNfcPowerCounterRetrieval]");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 369);

        PLLogCommon();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v27;
          _os_log_debug_impl(&dword_1CAF47000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v16 = v24;
      }
    }
    v34[0] = v16;
    v34[1] = 3221225472;
    v34[2] = __43__PLNfcAgent_setUpNfcPowerCounterRetrieval__block_invoke_155;
    v34[3] = &unk_1E8577F48;
    v34[4] = self;
    objc_msgSend(MEMORY[0x1E0D7FFC8], "significantBatteryChangeNotificationWithOperator:withBlock:", self, v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLNfcAgent setNfcPowerCountersNotification:](self, "setNfcPowerCountersNotification:", v33);

    v5 = v14;
    goto LABEL_24;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PLNfcAgent_setUpNfcPowerCounterRetrieval__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1ED884AD0 != -1)
      dispatch_once(&qword_1ED884AD0, block);
    if (byte_1ED884A9C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Initial check: NF hardware not supported, error message: %@"), v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNfcAgent setUpNfcPowerCounterRetrieval]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 360);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_24:
    }
  }

}

uint64_t __43__PLNfcAgent_setUpNfcPowerCounterRetrieval__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884A9C = result;
  return result;
}

uint64_t __43__PLNfcAgent_setUpNfcPowerCounterRetrieval__block_invoke_146(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884A9D = result;
  return result;
}

uint64_t __43__PLNfcAgent_setUpNfcPowerCounterRetrieval__block_invoke_151(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884A9E = result;
  return result;
}

uint64_t __43__PLNfcAgent_setUpNfcPowerCounterRetrieval__block_invoke_155(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "retrieveAndLogNfcPowerCountersWithRetry:", 1);
}

- (void)setupNfcAccessoryPowerCounterRetrieval
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD block[5];
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D80020], "hasCapability:", 7))
  {
    objc_msgSend(MEMORY[0x1E0D51968], "sharedHardwareManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v3, "getPowerCounters:", &v28);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v28;

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v6 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__PLNfcAgent_setupNfcAccessoryPowerCounterRetrieval__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v6;
      if (qword_1ED884AE8 != -1)
        dispatch_once(&qword_1ED884AE8, block);
      if (byte_1ED884A9F)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Initial NFC accessory power counters: %@, error: %@"), v4, v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNfcAgent setupNfcAccessoryPowerCounterRetrieval]");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 385);

        PLLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v7;
          _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLNfcAgent setLastAccessoryPowerCountersLogTime:](self, "setLastAccessoryPowerCountersLogTime:", v13);

      v14 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
      v15 = MEMORY[0x1E0C809B0];
      if (v14)
      {
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __52__PLNfcAgent_setupNfcAccessoryPowerCounterRetrieval__block_invoke_162;
        v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v26[4] = objc_opt_class();
        if (qword_1ED884AF0 != -1)
          dispatch_once(&qword_1ED884AF0, v26);
        if (byte_1ED884AA0)
        {
          v16 = (void *)MEMORY[0x1E0CB3940];
          -[PLNfcAgent lastAccessoryPowerCountersLogTime](self, "lastAccessoryPowerCountersLogTime");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("NFC accessory power logging start time: %@"), v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "lastPathComponent");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNfcAgent setupNfcAccessoryPowerCounterRetrieval]");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 392);

          PLLogCommon();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v18;
            _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      v25[0] = v15;
      v25[1] = 3221225472;
      v25[2] = __52__PLNfcAgent_setupNfcAccessoryPowerCounterRetrieval__block_invoke_165;
      v25[3] = &unk_1E8577F48;
      v25[4] = self;
      objc_msgSend(MEMORY[0x1E0D7FFC8], "significantBatteryChangeNotificationWithOperator:withBlock:", self, v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLNfcAgent setNfcAccessoryPowerCounterNotification:](self, "setNfcAccessoryPowerCounterNotification:", v24);

    }
  }
}

uint64_t __52__PLNfcAgent_setupNfcAccessoryPowerCounterRetrieval__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884A9F = result;
  return result;
}

uint64_t __52__PLNfcAgent_setupNfcAccessoryPowerCounterRetrieval__block_invoke_162(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884AA0 = result;
  return result;
}

uint64_t __52__PLNfcAgent_setupNfcAccessoryPowerCounterRetrieval__block_invoke_165(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "retrieveAndLogNfcAccessoryPowerCountersWithRetry:", 1);
}

- (void)retrieveAndLogNfcPowerCountersWithRetry:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  dispatch_time_t v51;
  NSObject *v52;
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD block[5];
  _QWORD v57[5];
  id v58;
  _QWORD v59[5];
  id v60;
  uint8_t buf[4];
  void *v62;
  uint64_t v63;

  v3 = a3;
  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D51950], "sharedHardwareManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0;
  objc_msgSend(v5, "getPowerCounters:", &v60);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v60;
  if (v7)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (v8)
  {
    v9 = v7;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v10 = objc_opt_class();
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke;
      v59[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v59[4] = v10;
      if (qword_1ED884AF8 != -1)
        dispatch_once(&qword_1ED884AF8, v59);
      if (byte_1ED884AA1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Power counters not valid: %@, error: %@"), v6, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNfcAgent retrieveAndLogNfcPowerCountersWithRetry:]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 407);

        PLLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v62 = v11;
          _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }

    v58 = 0;
    v17 = objc_msgSend(v5, "queryHardwareSupport:", &v58);
    v18 = v58;
    if ((_DWORD)v17 == 4)
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v19 = objc_opt_class();
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke_2;
        v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v55[4] = v19;
        if (qword_1ED884B08 != -1)
          dispatch_once(&qword_1ED884B08, v55);
        if (byte_1ED884AA3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NF hardware state is not supported, error message: %@"), v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "lastPathComponent");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNfcAgent retrieveAndLogNfcPowerCountersWithRetry:]");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 421);

          PLLogCommon();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v62 = v20;
            _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
    }
    else if (v3)
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v44 = objc_opt_class();
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke_170;
        v57[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v57[4] = v44;
        if (qword_1ED884B00 != -1)
          dispatch_once(&qword_1ED884B00, v57);
        if (byte_1ED884AA2)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Retry NF power counters query once with current HW state: %d"), v17);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "lastPathComponent");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNfcAgent retrieveAndLogNfcPowerCountersWithRetry:]");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "logMessage:fromFile:fromFunction:fromLineNumber:", v45, v48, v49, 415);

          PLLogCommon();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v62 = v45;
            _os_log_debug_impl(&dword_1CAF47000, v50, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      v51 = dispatch_time(0, 30000000000);
      -[PLOperator workQueue](self, "workQueue");
      v52 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke_173;
      block[3] = &unk_1E85780C8;
      block[4] = self;
      dispatch_after(v51, v52, block);

    }
  }
  else
  {
    +[PLOperator entryKeyForType:andName:](PLNfcAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("Power"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
    v28 = MEMORY[0x1E0C809B0];
    if (v27)
    {
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke_180;
      v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v54[4] = objc_opt_class();
      if (qword_1ED884B10 != -1)
        dispatch_once(&qword_1ED884B10, v54);
      if (byte_1ED884AA4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received valid NFC power counters: %@"), v6);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "lastPathComponent");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNfcAgent retrieveAndLogNfcPowerCountersWithRetry:]");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v32, v33, 425);

        PLLogCommon();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v62 = v29;
          _os_log_debug_impl(&dword_1CAF47000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v28 = MEMORY[0x1E0C809B0];
      }
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v53[0] = v28;
      v53[1] = 3221225472;
      v53[2] = __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke_185;
      v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v53[4] = objc_opt_class();
      if (qword_1ED884B18 != -1)
        dispatch_once(&qword_1ED884B18, v53);
      if (byte_1ED884AA5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NFC power logging end time: %@"), v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "lastPathComponent");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNfcAgent retrieveAndLogNfcPowerCountersWithRetry:]");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "logMessage:fromFile:fromFunction:fromLineNumber:", v36, v39, v40, 428);

        PLLogCommon();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v62 = v36;
          _os_log_debug_impl(&dword_1CAF47000, v41, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v26, v6);
    -[PLNfcAgent lastPowerCountersLogTime](self, "lastPowerCountersLogTime");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setEntryDate:", v43);

    objc_msgSend(v42, "setObject:forKeyedSubscript:", v35, CFSTR("timestampEnd"));
    -[PLOperator logEntry:](self, "logEntry:", v42);
    -[PLNfcAgent setLastPowerCountersLogTime:](self, "setLastPowerCountersLogTime:", v35);

    v18 = 0;
  }

}

uint64_t __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884AA1 = result;
  return result;
}

uint64_t __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke_170(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884AA2 = result;
  return result;
}

uint64_t __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke_173(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "retrieveAndLogNfcPowerCountersWithRetry:", 0);
}

uint64_t __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884AA3 = result;
  return result;
}

uint64_t __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke_180(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884AA4 = result;
  return result;
}

uint64_t __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke_185(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884AA5 = result;
  return result;
}

- (void)retrieveAndLogNfcAccessoryPowerCountersWithRetry:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  dispatch_time_t v23;
  NSObject *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD block[5];
  _QWORD v48[5];
  _QWORD v49[5];
  id v50;
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v3 = a3;
  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D51968], "sharedHardwareManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  objc_msgSend(v5, "getPowerCounters:", &v50);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v50;
  if (v7)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (v8)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v9 = objc_opt_class();
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __63__PLNfcAgent_retrieveAndLogNfcAccessoryPowerCountersWithRetry___block_invoke;
      v49[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v49[4] = v9;
      if (qword_1ED884B20 != -1)
        dispatch_once(&qword_1ED884B20, v49);
      if (byte_1ED884AA6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Accessory power counters not valid: %@, error: %@"), v6, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNfcAgent retrieveAndLogNfcAccessoryPowerCountersWithRetry:]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 447);

        PLLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v10;
          _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    if (v3)
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v16 = objc_opt_class();
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __63__PLNfcAgent_retrieveAndLogNfcAccessoryPowerCountersWithRetry___block_invoke_192;
        v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v48[4] = v16;
        if (qword_1ED884B28 != -1)
          dispatch_once(&qword_1ED884B28, v48);
        if (byte_1ED884AA7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Retry NF power counters query once"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "lastPathComponent");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNfcAgent retrieveAndLogNfcAccessoryPowerCountersWithRetry:]");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 450);

          PLLogCommon();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v17;
            _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      v23 = dispatch_time(0, 30000000000);
      -[PLOperator workQueue](self, "workQueue");
      v24 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__PLNfcAgent_retrieveAndLogNfcAccessoryPowerCountersWithRetry___block_invoke_195;
      block[3] = &unk_1E85780C8;
      block[4] = self;
      dispatch_after(v23, v24, block);

    }
  }
  else
  {
    +[PLOperator entryKeyForType:andName:](PLNfcAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("AccessoryPower"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
    v27 = MEMORY[0x1E0C809B0];
    if (v26)
    {
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __63__PLNfcAgent_retrieveAndLogNfcAccessoryPowerCountersWithRetry___block_invoke_2;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = objc_opt_class();
      if (qword_1ED884B30 != -1)
        dispatch_once(&qword_1ED884B30, v46);
      if (byte_1ED884AA8)
      {
        v43 = v25;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received valid NFC accessory power counters: %@"), v6);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "lastPathComponent");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNfcAgent retrieveAndLogNfcAccessoryPowerCountersWithRetry:]");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 457);

        PLLogCommon();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v28;
          _os_log_debug_impl(&dword_1CAF47000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v25 = v43;
        v27 = MEMORY[0x1E0C809B0];
      }
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v45[0] = v27;
      v45[1] = 3221225472;
      v45[2] = __63__PLNfcAgent_retrieveAndLogNfcAccessoryPowerCountersWithRetry___block_invoke_202;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v45[4] = objc_opt_class();
      if (qword_1ED884B38 != -1)
        dispatch_once(&qword_1ED884B38, v45);
      if (byte_1ED884AA9)
      {
        v44 = v25;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NFC accessory power logging end time: %@"), v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "lastPathComponent");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNfcAgent retrieveAndLogNfcAccessoryPowerCountersWithRetry:]");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 460);

        PLLogCommon();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v35;
          _os_log_debug_impl(&dword_1CAF47000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v25 = v44;
      }
    }
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v25, v6);
    -[PLNfcAgent lastAccessoryPowerCountersLogTime](self, "lastAccessoryPowerCountersLogTime");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setEntryDate:", v42);

    objc_msgSend(v41, "setObject:forKeyedSubscript:", v34, CFSTR("timestampEnd"));
    -[PLOperator logEntry:](self, "logEntry:", v41);
    -[PLNfcAgent setLastAccessoryPowerCountersLogTime:](self, "setLastAccessoryPowerCountersLogTime:", v34);

  }
}

uint64_t __63__PLNfcAgent_retrieveAndLogNfcAccessoryPowerCountersWithRetry___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884AA6 = result;
  return result;
}

uint64_t __63__PLNfcAgent_retrieveAndLogNfcAccessoryPowerCountersWithRetry___block_invoke_192(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884AA7 = result;
  return result;
}

uint64_t __63__PLNfcAgent_retrieveAndLogNfcAccessoryPowerCountersWithRetry___block_invoke_195(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "retrieveAndLogNfcAccessoryPowerCountersWithRetry:", 0);
}

uint64_t __63__PLNfcAgent_retrieveAndLogNfcAccessoryPowerCountersWithRetry___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884AA8 = result;
  return result;
}

uint64_t __63__PLNfcAgent_retrieveAndLogNfcAccessoryPowerCountersWithRetry___block_invoke_202(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884AA9 = result;
  return result;
}

- (unsigned)getNFCHarwareState
{
  void *v2;
  unsigned int v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D51950], "sharedHardwareManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v3 = objc_msgSend(v2, "queryHardwareSupport:", &v7);
  v4 = v7;

  if (v4)
  {
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_error_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_ERROR, "failed to get the hardware state: %@", buf, 0xCu);
    }
    v3 = 1;
LABEL_9:

    goto LABEL_10;
  }
  if (v3 == 4)
  {
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v9 = 0;
      _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "The hardware is not supported: %@", buf, 0xCu);
    }
    v3 = 4;
    goto LABEL_9;
  }
LABEL_10:

  return v3;
}

- (void)logEventForwardLPEM
{
  NSObject *v3;
  _QWORD v4[8];
  _QWORD v5[5];
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__12;
  v9[4] = __Block_byref_object_dispose__12;
  v10 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__12;
  v7[4] = __Block_byref_object_dispose__12;
  v8 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__12;
  v5[4] = __Block_byref_object_dispose__12;
  v6 = 0;
  dispatch_get_global_queue(2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__PLNfcAgent_logEventForwardLPEM__block_invoke;
  v4[3] = &unk_1E857FC10;
  v4[6] = v7;
  v4[7] = v5;
  v4[4] = self;
  v4[5] = v9;
  dispatch_async(v3, v4);

  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(v9, 8);
}

void __33__PLNfcAgent_logEventForwardLPEM__block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  _QWORD v5[4];
  __int128 v6;
  __int128 v7;

  objc_msgSend(MEMORY[0x1E0D51950], "sharedHardwareManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__PLNfcAgent_logEventForwardLPEM__block_invoke_2;
  v5[3] = &unk_1E857FBE8;
  v3 = *(_OWORD *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 32);
  v7 = v3;
  objc_msgSend(v2, "startSecureElementLoggingSession:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

}

void __33__PLNfcAgent_logEventForwardLPEM__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
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
  id v44;
  id obj;
  uint8_t buf[4];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    PLLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v47 = v8;
      v9 = "failed to start  logEventForwardLPEM%@";
LABEL_10:
      _os_log_error_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_ERROR, v9, buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D51958], "embeddedSecureElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serialNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v12 + 40);
    objc_msgSend(v5, "getLogs:forSEID:error:", 4, v11, &obj);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v12 + 40), obj);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      PLLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v47 = v16;
        v9 = "failed to get logs%@";
        goto LABEL_10;
      }
    }
    else
    {
      v17 = objc_alloc(MEMORY[0x1E0C99D50]);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", CFSTR("A000000704E000010002"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("FixedBuffer"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v17, "initWithData:", v19);
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;

      objc_msgSend(MEMORY[0x1E0D51958], "embeddedSecureElement");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "serialNumber");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clearLogs:forSEID:", 4, v24);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
        goto LABEL_12;
      PLLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v47 = v28;
        v9 = "failed to clear the log: %@";
        goto LABEL_10;
      }
    }
  }

LABEL_12:
  objc_msgSend(v5, "endSession");
  +[PLNfcAgent parseLPEMFromData:](PLNfcAgent, "parseLPEMFromData:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v31 = *(void **)(v30 + 40);
  *(_QWORD *)(v30 + 40) = v29;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    +[PLOperator entryKeyForType:andName:](PLNfcAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("LPEM"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v32, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 32), "logEntry:", v33);
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("BTCC"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "intValue");
    ADClientSetValueForScalarKey();

    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("BTCT"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "intValue");
    ADClientSetValueForScalarKey();

    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("SRSC"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "intValue");
    ADClientSetValueForScalarKey();

    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("SRST"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "intValue");
    ADClientSetValueForScalarKey();

    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("SRUC"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "intValue");
    ADClientSetValueForScalarKey();

    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("SRLC"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "intValue");
    ADClientSetValueForScalarKey();

    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("SERESET"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "intValue");
    ADClientSetValueForScalarKey();

    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("ROLL"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "intValue");
    ADClientSetValueForScalarKey();

    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("BTENTRY"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "intValue");
    ADClientSetValueForScalarKey();

    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("BTEXIT"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "intValue");
    ADClientSetValueForScalarKey();

    v44 = v33;
    AnalyticsSendEventLazy();

  }
}

id __33__PLNfcAgent_logEventForwardLPEM__block_invoke_229(uint64_t a1)
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
  _QWORD v34[10];
  _QWORD v35[12];

  v35[10] = *MEMORY[0x1E0C80C00];
  v34[0] = CFSTR("BTCC");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInt:", objc_msgSend(v33, "intValue"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v32;
  v34[1] = CFSTR("BTCT");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v31, "intValue"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v30;
  v34[2] = CFSTR("SRSC");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v29, "intValue"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v28;
  v34[3] = CFSTR("SRST");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInt:", objc_msgSend(v27, "intValue"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v26;
  v34[4] = CFSTR("SRUC");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInt:", objc_msgSend(v25, "intValue"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v24;
  v34[5] = CFSTR("SRLC");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInt:", objc_msgSend(v23, "intValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v8;
  v34[6] = CFSTR("SERESET");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "intValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v11;
  v34[7] = CFSTR("ROLL");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInt:", objc_msgSend(v13, "intValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v14;
  v34[8] = CFSTR("BTENTRY");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithInt:", objc_msgSend(v16, "intValue"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v17;
  v34[9] = CFSTR("BTEXIT");
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "numberWithInt:", objc_msgSend(v19, "intValue"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[9] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)parseLPEMFromData:(id)a3
{
  id v3;
  unsigned __int8 *v4;
  NSObject *v5;
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
  uint8_t buf[16];
  _QWORD v18[10];
  _QWORD v19[12];

  v19[10] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") < 0x10)
  {
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_ERROR, "Not able to parse the LPEM, mismatch of length", buf, 2u);
    }
    v13 = 0;
  }
  else
  {
    v4 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
    v18[0] = CFSTR("BTCC");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v19[0] = v5;
    v18[1] = CFSTR("BTCT");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v4 + 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v16;
    v18[2] = CFSTR("SRSC");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4[5]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v15;
    v18[3] = CFSTR("SRST");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v4 + 6));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v6;
    v18[4] = CFSTR("SRUC");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4[10]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[4] = v7;
    v18[5] = CFSTR("SRLC");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4[11]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[5] = v8;
    v18[6] = CFSTR("SERESET");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4[12]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[6] = v9;
    v18[7] = CFSTR("ROLL");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4[13]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[7] = v10;
    v18[8] = CFSTR("BTENTRY");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4[14]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[8] = v11;
    v18[9] = CFSTR("BTEXIT");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4[15]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[9] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (PLXPCListenerOperatorComposition)cardNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCardNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLXPCListenerOperatorComposition)fieldNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFieldNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLXPCListenerOperatorComposition)transactionNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTransactionNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLXPCListenerOperatorComposition)tsmCommunicationNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTsmCommunicationNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLEntryNotificationOperatorComposition)nfcPowerCountersNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setNfcPowerCountersNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLEntryNotificationOperatorComposition)nfcAccessoryPowerCounterNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setNfcAccessoryPowerCounterNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void)setOnPower:(double)a3
{
  self->_onPower = a3;
}

- (NSDate)lastPowerCountersLogTime
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLastPowerCountersLogTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSDate)lastAccessoryPowerCountersLogTime
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLastAccessoryPowerCountersLogTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PLTimer)nfcConnectionRetryTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNfcConnectionRetryTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (int)nfcConnectionRetryCount
{
  return self->_nfcConnectionRetryCount;
}

- (void)setNfcConnectionRetryCount:(int)a3
{
  self->_nfcConnectionRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nfcConnectionRetryTimer, 0);
  objc_storeStrong((id *)&self->_lastAccessoryPowerCountersLogTime, 0);
  objc_storeStrong((id *)&self->_lastPowerCountersLogTime, 0);
  objc_storeStrong((id *)&self->_nfcAccessoryPowerCounterNotification, 0);
  objc_storeStrong((id *)&self->_nfcPowerCountersNotification, 0);
  objc_storeStrong((id *)&self->_tsmCommunicationNotification, 0);
  objc_storeStrong((id *)&self->_transactionNotification, 0);
  objc_storeStrong((id *)&self->_fieldNotification, 0);
  objc_storeStrong((id *)&self->_cardNotification, 0);
}

@end
