@implementation PLDisplayAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLDisplayAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventNoneDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("PanelStats");
  +[PLDisplayAgent entryEventNoneDefinitionPanelStats](PLDisplayAgent, "entryEventNoneDefinitionPanelStats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventNoneDefinitionPanelStats
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[7];
  _QWORD v21[7];
  uint64_t v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[4];

  v25[2] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isMac") & 1) != 0)
    return MEMORY[0x1E0C9AA70];
  v24[0] = *MEMORY[0x1E0D80298];
  v22 = *MEMORY[0x1E0D80318];
  v23 = &unk_1EA1DAC18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  v24[1] = *MEMORY[0x1E0D802F0];
  v20[0] = CFSTR("B_input");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_RealFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  v20[1] = CFSTR("B_min");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_RealFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v15;
  v20[2] = CFSTR("I_input");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_RealFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v13;
  v20[3] = CFSTR("I_nominal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v4;
  v20[4] = CFSTR("I_threshold");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v6;
  v20[5] = CFSTR("Scalar");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v8;
  v20[6] = CFSTR("Slope");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_RealFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("Display");
  +[PLDisplayAgent entryEventPointDefinitionDisplay](PLDisplayAgent, "entryEventPointDefinitionDisplay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v9[1] = CFSTR("UserBrightness");
  +[PLDisplayAgent entryEventPointDefinitionUserBrightness](PLDisplayAgent, "entryEventPointDefinitionUserBrightness");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  v9[2] = CFSTR("Multitouch");
  +[PLDisplayAgent entryEventPointDefinitionMultitouch](PLDisplayAgent, "entryEventPointDefinitionMultitouch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  v9[3] = CFSTR("BacklightControl");
  +[PLDisplayAgent entryEventPointDefinitionBacklightControl](PLDisplayAgent, "entryEventPointDefinitionBacklightControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  v9[4] = CFSTR("KeyboardBrightness");
  +[PLDisplayAgent entryEventPointDefinitionKeyboardBrightness](PLDisplayAgent, "entryEventPointDefinitionKeyboardBrightness");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionDisplay
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
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLDisplayAgent shouldLogDisplay](PLDisplayAgent, "shouldLogDisplay")
    && !+[PLDisplayAgent shouldLogLCD](PLDisplayAgent, "shouldLogLCD"))
  {
    return MEMORY[0x1E0C9AA70];
  }
  v16[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80320];
  v14[0] = *MEMORY[0x1E0D80318];
  v14[1] = v2;
  v15[0] = &unk_1EA1DAC28;
  v15[1] = &unk_1EA1DCD78;
  v3 = *MEMORY[0x1E0D80340];
  v14[2] = *MEMORY[0x1E0D80328];
  v14[3] = v3;
  v15[2] = CFSTR("Block");
  v15[3] = &unk_1EA1C14A8;
  v14[4] = *MEMORY[0x1E0D80288];
  v15[4] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = *MEMORY[0x1E0D802F0];
  v17[0] = v4;
  v12[0] = CFSTR("Block");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("Active");
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventPointDefinitionUserBrightness
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];
  const __CFString *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLDisplayAgent shouldLogUserBrightness](PLDisplayAgent, "shouldLogUserBrightness"))
    return MEMORY[0x1E0C9AA70];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80320];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1EA1DAC18;
  v14[1] = &unk_1EA1DCD90;
  v13[2] = *MEMORY[0x1E0D80300];
  v14[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11 = CFSTR("UserBrightness");
  v4 = *MEMORY[0x1E0D80360];
  v9[0] = *MEMORY[0x1E0D80358];
  v9[1] = v4;
  v10[0] = &unk_1EA1C14C0;
  v10[1] = CFSTR("%");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionMultitouch
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
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[7];
  _QWORD v27[7];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[8];
  _QWORD v33[8];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLDisplayAgent shouldLogTouch](PLDisplayAgent, "shouldLogTouch"))
    return MEMORY[0x1E0C9AA70];
  if (objc_msgSend(MEMORY[0x1E0D80020], "hasOrb"))
  {
    v36[0] = *MEMORY[0x1E0D80298];
    v2 = *MEMORY[0x1E0D80300];
    v34[0] = *MEMORY[0x1E0D80318];
    v34[1] = v2;
    v35[0] = &unk_1EA1DAC38;
    v35[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v18 = objc_claimAutoreleasedReturnValue();
    v37[0] = v18;
    v36[1] = *MEMORY[0x1E0D802F0];
    v32[0] = CFSTR("fingerNum");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v25;
    v32[1] = CFSTR("peak");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v23;
    v32[2] = CFSTR("peakMillimetersFromEdge");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "commonTypeDict_RealFormat");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v21;
    v32[3] = CFSTR("peakProximity");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "commonTypeDict_RealFormat");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v19;
    v32[4] = CFSTR("peakMajorRadius");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "commonTypeDict_RealFormat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v33[4] = v4;
    v32[5] = CFSTR("peakMinorRadius");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "commonTypeDict_RealFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v33[5] = v6;
    v32[6] = CFSTR("touchStartTime");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "commonTypeDict_RealFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33[6] = v8;
    v32[7] = CFSTR("touchStopTime");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "commonTypeDict_RealFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33[7] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v17;
    v14 = (void *)v18;
  }
  else
  {
    v30[0] = *MEMORY[0x1E0D80298];
    v16 = *MEMORY[0x1E0D80300];
    v28[0] = *MEMORY[0x1E0D80318];
    v28[1] = v16;
    v29[0] = &unk_1EA1DAC28;
    v29[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v14;
    v30[1] = *MEMORY[0x1E0D802F0];
    v26[0] = CFSTR("fingerNum");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "commonTypeDict_IntegerFormat");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v25;
    v26[1] = CFSTR("peakProximity");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v23;
    v26[2] = CFSTR("peakProximityMillimetersFromEdge");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "commonTypeDict_RealFormat");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v21;
    v26[3] = CFSTR("peakProximityMajorRadius");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "commonTypeDict_RealFormat");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v19;
    v26[4] = CFSTR("peakProximityMinorRadius");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "commonTypeDict_RealFormat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v27[4] = v4;
    v26[5] = CFSTR("touchStartTime");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "commonTypeDict_RealFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27[5] = v6;
    v26[6] = CFSTR("touchStopTime");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "commonTypeDict_RealFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[6] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)entryEventPointDefinitionBacklightControl
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
  if (!+[PLDisplayAgent shouldLogBacklightControl](PLDisplayAgent, "shouldLogBacklightControl"))
    return MEMORY[0x1E0C9AA70];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1EA1DAC18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("backlightEnabledTimestamp");
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

+ (id)entryEventPointDefinitionKeyboardBrightness
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
  if (!+[PLDisplayAgent shouldLogKeyboardBrightness](PLDisplayAgent, "shouldLogKeyboardBrightness"))
    return MEMORY[0x1E0C9AA70];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1EA1DAC18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("KeyboardBrightness");
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

+ (id)entryEventForwardDefinitions
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
  _QWORD v14[10];
  _QWORD v15[12];

  v15[10] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("Display");
  +[PLDisplayAgent entryEventForwardDefinitionDisplay](PLDisplayAgent, "entryEventForwardDefinitionDisplay");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v13;
  v14[1] = CFSTR("DisplayBacklight");
  +[PLDisplayAgent entryEventForwardDefinitionDisplayBacklight](PLDisplayAgent, "entryEventForwardDefinitionDisplayBacklight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v2;
  v14[2] = CFSTR("ALSUserPreferences");
  +[PLDisplayAgent entryEventForwardDefinitionALSUserPreferences](PLDisplayAgent, "entryEventForwardDefinitionALSUserPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v3;
  v14[3] = CFSTR("ALSEnabled");
  +[PLDisplayAgent entryEventForwardDefinitionALSEnabled](PLDisplayAgent, "entryEventForwardDefinitionALSEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v4;
  v14[4] = CFSTR("ALSPowerSaved");
  +[PLDisplayAgent entryEventForwardDefinitionALSPowerSaved](PLDisplayAgent, "entryEventForwardDefinitionALSPowerSaved");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v5;
  v14[5] = CFSTR("BlueLightReductionStatus");
  +[PLDisplayAgent entryEventForwardDefinitionBlueLightReductionStatus](PLDisplayAgent, "entryEventForwardDefinitionBlueLightReductionStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v6;
  v14[6] = CFSTR("CAModeEnabled");
  +[PLDisplayAgent entryEventForwardDefinitionColorAdaptationMode](PLDisplayAgent, "entryEventForwardDefinitionColorAdaptationMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v7;
  v14[7] = CFSTR("ALSLux");
  +[PLDisplayAgent entryEventForwardDefinitionALSLux](PLDisplayAgent, "entryEventForwardDefinitionALSLux");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v8;
  v14[8] = CFSTR("LinearBrightness");
  +[PLDisplayAgent entryEventForwardDefinitionLinearBrightness](PLDisplayAgent, "entryEventForwardDefinitionLinearBrightness");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v9;
  v14[9] = CFSTR("LuxStats");
  +[PLDisplayAgent entryEventForwardDefinitionLuxStats](PLDisplayAgent, "entryEventForwardDefinitionLuxStats");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventForwardDefinitionDisplay
{
  uint64_t v2;
  _BOOL4 v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[7];
  _QWORD v50[7];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[4];

  v54[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLDisplayAgent shouldLogDisplay](PLDisplayAgent, "shouldLogDisplay"))
    return MEMORY[0x1E0C9AA70];
  v53[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80320];
  v51[0] = *MEMORY[0x1E0D80318];
  v51[1] = v2;
  v52[0] = &unk_1EA1DAC48;
  v52[1] = &unk_1EA1DCDA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v38;
  v53[1] = *MEMORY[0x1E0D802F0];
  v49[0] = CFSTR("Brightness");
  v3 = +[PLDisplayAgent shouldLogFromDCP](PLDisplayAgent, "shouldLogFromDCP");
  v4 = (_QWORD *)MEMORY[0x1E0D80358];
  v37 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "commonTypeDict_RealFormat");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = *MEMORY[0x1E0D80360];
    v47[0] = *MEMORY[0x1E0D80358];
    v47[1] = v7;
    v48[0] = &unk_1EA1C14C0;
    v48[1] = CFSTR("%");
    v47[2] = *MEMORY[0x1E0D80290];
    v48[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
    v5 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v5;
  }
  v29 = (void *)v5;
  v50[0] = v5;
  v49[1] = CFSTR("SliderValue");
  v8 = +[PLDisplayAgent shouldLogFromDCP](PLDisplayAgent, "shouldLogFromDCP");
  v9 = &unk_1EA1C14D8;
  v10 = (uint64_t *)MEMORY[0x1E0D802E8];
  v35 = v8;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "commonTypeDict_IntegerFormat");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = *MEMORY[0x1E0D802E8];
    v45[0] = *v4;
    v45[1] = v12;
    v46[0] = &unk_1EA1C14D8;
    v46[1] = &unk_1EA1DCDC0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
    v11 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v11;
  }
  v28 = (void *)v11;
  v50[1] = v11;
  v49[2] = CFSTR("lux");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v32;
  v49[3] = CFSTR("iDAC");
  v31 = +[PLDisplayAgent shouldLogFromDCP](PLDisplayAgent, "shouldLogFromDCP");
  if (v31)
  {
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "commonTypeDict_IntegerFormat");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = *v10;
    v43[0] = *v4;
    v43[1] = v14;
    v44[0] = &unk_1EA1C14D8;
    v44[1] = &unk_1EA1DCDD8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
    v13 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v13;
  }
  v50[3] = v13;
  v49[4] = CFSTR("mNits");
  v15 = +[PLDisplayAgent shouldLogFromDCP](PLDisplayAgent, "shouldLogFromDCP", v13);
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = *v10;
    v41[0] = *v4;
    v41[1] = v18;
    v42[0] = &unk_1EA1C14D8;
    v42[1] = &unk_1EA1DCDF0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
    v17 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v17;
  }
  v19 = (void *)v17;
  v50[4] = v17;
  v49[5] = CFSTR("uAmps");
  v20 = +[PLDisplayAgent shouldLogFromDCP](PLDisplayAgent, "shouldLogFromDCP");
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = *v10;
    v39[0] = *v4;
    v39[1] = v22;
    v40[0] = &unk_1EA1C14D8;
    v40[1] = &unk_1EA1DCE08;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v50[5] = v21;
  v49[6] = CFSTR("EDRHeadroom");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v50[6] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {

    v21 = v9;
  }

  if (v15)
  if (v31)

  if (v35)
  if (v37)

  return v26;
}

+ (id)entryEventForwardDefinitionDisplayBacklight
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
  if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
    return MEMORY[0x1E0C9AA70];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1EA1DAC18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("DisplayPower");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventForwardDefinitionALSUserPreferences
{
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
  void *v39;
  void *v40;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
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
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  _QWORD v99[46];
  _QWORD v100[46];
  _QWORD v101[3];
  _QWORD v102[3];
  _QWORD v103[2];
  _QWORD v104[4];

  v104[2] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isMac") & 1) != 0)
    return MEMORY[0x1E0C9AA70];
  v103[0] = *MEMORY[0x1E0D80298];
  v3 = *MEMORY[0x1E0D80340];
  v101[0] = *MEMORY[0x1E0D80318];
  v101[1] = v3;
  v102[0] = &unk_1EA1DAC58;
  v102[1] = &unk_1EA1C14F0;
  v101[2] = *MEMORY[0x1E0D80338];
  v102[2] = &unk_1EA1C1508;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 3);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v104[0] = v98;
  v103[1] = *MEMORY[0x1E0D802F0];
  v99[0] = CFSTR("E0a");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "commonTypeDict_IntegerFormat");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v100[0] = v96;
  v99[1] = CFSTR("E0b");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "commonTypeDict_IntegerFormat");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v100[1] = v94;
  v99[2] = CFSTR("E1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "commonTypeDict_IntegerFormat");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v100[2] = v92;
  v99[3] = CFSTR("E2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "commonTypeDict_IntegerFormat");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v100[3] = v90;
  v99[4] = CFSTR("L0a");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "commonTypeDict_RealFormat");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v100[4] = v88;
  v99[5] = CFSTR("L0b");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "commonTypeDict_RealFormat");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v100[5] = v86;
  v99[6] = CFSTR("L1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "commonTypeDict_RealFormat");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v100[6] = v84;
  v99[7] = CFSTR("L2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "commonTypeDict_RealFormat");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v100[7] = v82;
  v99[8] = CFSTR("S");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "commonTypeDict_RealFormat");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v100[8] = v80;
  v99[9] = CFSTR("version");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "commonTypeDict_IntegerFormat");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v100[9] = v78;
  v99[10] = CFSTR("Lux");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "commonTypeDict_IntegerFormat");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v100[10] = v76;
  v99[11] = CFSTR("thirdSlope");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "commonTypeDict_RealFormat");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v100[11] = v74;
  v99[12] = CFSTR("aabParamsUpdateOnly");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "commonTypeDict_BoolFormat");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v100[12] = v72;
  v99[13] = CFSTR("auroraFactor");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "commonTypeDict_RealFormat");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v100[13] = v70;
  v99[14] = CFSTR("autobrightnessEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "commonTypeDict_BoolFormat");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v100[14] = v68;
  v99[15] = CFSTR("colorAdaptationStrength");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "commonTypeDict_RealFormat");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v100[15] = v66;
  v99[16] = CFSTR("colorAdaptationMode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "commonTypeDict_IntegerFormat");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v100[16] = v64;
  v99[17] = CFSTR("cpmsMitigationLimitingBrightness");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "commonTypeDict_BoolFormat");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v100[17] = v62;
  v99[18] = CFSTR("darkThemeApplied");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "commonTypeDict_BoolFormat");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v100[18] = v60;
  v99[19] = CFSTR("delayedAPCE");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v100[19] = v58;
  v99[20] = CFSTR("delayedAPCEStatus");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "commonTypeDict_IntegerFormat");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v100[20] = v56;
  v99[21] = CFSTR("ecoModeEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "commonTypeDict_BoolFormat");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v100[21] = v54;
  v99[22] = CFSTR("ecoModeFactor");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v100[22] = v52;
  v99[23] = CFSTR("edrHeadroom");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "commonTypeDict_RealFormat");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v100[23] = v50;
  v99[24] = CFSTR("landscapeOrientation");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "commonTypeDict_BoolFormat");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v100[24] = v48;
  v99[25] = CFSTR("localTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "commonTypeDict_DateFormat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v100[25] = v46;
  v99[26] = CFSTR("nits");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "commonTypeDict_RealFormat");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v100[26] = v44;
  v99[27] = CFSTR("proxMitigationTriggered");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commonTypeDict_BoolFormat");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v100[27] = v42;
  v99[28] = CFSTR("rearLux");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v100[28] = v40;
  v99[29] = CFSTR("rearLuxInUse");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "commonTypeDict_BoolFormat");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v100[29] = v38;
  v99[30] = CFSTR("touchMitigationTriggered");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "commonTypeDict_BoolFormat");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v100[30] = v36;
  v99[31] = CFSTR("trustedLux");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v100[31] = v34;
  v99[32] = CFSTR("aabParamsUpdateReason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v100[32] = v32;
  v99[33] = CFSTR("inactiveLength");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v100[33] = v30;
  v99[34] = CFSTR("inactiveStart");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v100[34] = v28;
  v99[35] = CFSTR("alternativeE0a");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v100[35] = v26;
  v99[36] = CFSTR("alternativeE0b");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v100[36] = v24;
  v99[37] = CFSTR("alternativeE1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v100[37] = v22;
  v99[38] = CFSTR("alternativeE2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v100[38] = v20;
  v99[39] = CFSTR("alternativeL0a");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v100[39] = v18;
  v99[40] = CFSTR("alternativeL0b");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v100[40] = v16;
  v99[41] = CFSTR("alternativeL1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v100[41] = v14;
  v99[42] = CFSTR("alternativeL2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v100[42] = v5;
  v99[43] = CFSTR("alternativeThirdSlope");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v100[43] = v7;
  v99[44] = CFSTR("nitsDelta");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v100[44] = v9;
  v99[45] = CFSTR("nitsDeltaAlternative");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v100[45] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v99, 46);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v104[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryEventForwardDefinitionALSEnabled
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
  v11 = &unk_1EA1DAC18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("ALSEnabled");
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

+ (id)entryEventForwardDefinitionALSPowerSaved
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
  if (!+[PLDisplayAgent shouldLogALSPowerSaved](PLDisplayAgent, "shouldLogALSPowerSaved"))
    return MEMORY[0x1E0C9AA70];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1EA1DAC18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("Power");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventForwardDefinitionColorAdaptationMode
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
  if (!objc_msgSend(MEMORY[0x1E0D15718], "supportsAdaptation"))
    return MEMORY[0x1E0C9AA70];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1EA1DAC18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("CAModeEnabled");
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

+ (id)entryEventForwardDefinitionBlueLightReductionStatus
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
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLDisplayAgent shouldLogBLR](PLDisplayAgent, "shouldLogBLR"))
    return MEMORY[0x1E0C9AA70];
  v16[0] = *MEMORY[0x1E0D80298];
  v14 = *MEMORY[0x1E0D80318];
  v15 = &unk_1EA1DAC18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E0D802F0];
  v12[0] = CFSTR("BlueReductionEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("BlueReductionMode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("BlueReductionSunScheduleAllowed");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
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

+ (id)entryEventForwardDefinitionALSLux
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitionLinearBrightness
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitionLuxStats
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
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[4];

  v21[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLDisplayAgent shouldLogLuxStats](PLDisplayAgent, "shouldLogLuxStats"))
    return MEMORY[0x1E0C9AA70];
  v20[0] = *MEMORY[0x1E0D80298];
  v18 = *MEMORY[0x1E0D80318];
  v19 = &unk_1EA1DAC18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E0D802F0];
  v16[0] = CFSTR("cappedLuxForAAB");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v16[1] = CFSTR("frontNits");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v3;
  v16[2] = CFSTR("gainChanged");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v5;
  v16[3] = CFSTR("rearNits");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v7;
  v16[4] = CFSTR("rearLux");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventBackwardDefinitions
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
  _QWORD v16[12];
  _QWORD v17[14];

  v17[12] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("Touch");
  +[PLDisplayAgent entryEventBackwardDefinitionTouch](PLDisplayAgent, "entryEventBackwardDefinitionTouch");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v15;
  v16[1] = CFSTR("BlueLightParameters");
  +[PLDisplayAgent entryEventBackwardDefinitionBlueLightParameters](PLDisplayAgent, "entryEventBackwardDefinitionBlueLightParameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v14;
  v16[2] = CFSTR("HParameters");
  +[PLDisplayAgent entryEventBackwardDefinitionHarmonyParameters](PLDisplayAgent, "entryEventBackwardDefinitionHarmonyParameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v13;
  v16[3] = CFSTR("APLStats");
  +[PLDisplayAgent entryEventBackwardDefinitionAPLStats](PLDisplayAgent, "entryEventBackwardDefinitionAPLStats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v2;
  v16[4] = CFSTR("AZLStats");
  +[PLDisplayAgent entryEventBackwardDefinitionAZLStats](PLDisplayAgent, "entryEventBackwardDefinitionAZLStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v3;
  v16[5] = CFSTR("AZLSnapshots");
  +[PLDisplayAgent entryEventBackwardDefinitionAZLSnapshots](PLDisplayAgent, "entryEventBackwardDefinitionAZLSnapshots");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v4;
  v16[6] = CFSTR("RampInfo");
  +[PLDisplayAgent entryEventBackwardDefinitionRampInfo](PLDisplayAgent, "entryEventBackwardDefinitionRampInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v5;
  v16[7] = CFSTR("CurveUpdate");
  +[PLDisplayAgent entryEventBackwardDefinitionCurveUpdate](PLDisplayAgent, "entryEventBackwardDefinitionCurveUpdate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v6;
  v16[8] = CFSTR("ALSThreshold");
  +[PLDisplayAgent entryEventBackwardDefinitionALSThreshold](PLDisplayAgent, "entryEventBackwardDefinitionALSThreshold");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[8] = v7;
  v16[9] = CFSTR("ALSSamplesBeforeWake");
  +[PLDisplayAgent entryEventBackwardDefinitionALSSamplesBeforeWake](PLDisplayAgent, "entryEventBackwardDefinitionALSSamplesBeforeWake");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[9] = v8;
  v16[10] = CFSTR("AmbientLight");
  +[PLDisplayAgent entryEventBackwardDefinitionAmbientLight](PLDisplayAgent, "entryEventBackwardDefinitionAmbientLight");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[10] = v9;
  v16[11] = CFSTR("DCPAODstats");
  +[PLDisplayAgent entryEventBackwardDefinitionDCPAODstats](PLDisplayAgent, "entryEventBackwardDefinitionDCPAODstats");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[11] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventBackwardDefinitionTouch
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[2];
  uint64_t v44;
  _QWORD v45[3];
  _QWORD v46[12];
  _QWORD v47[12];
  uint64_t v48;
  void *v49;
  _QWORD v50[2];
  _QWORD v51[4];

  v51[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLDisplayAgent shouldLogTouch](PLDisplayAgent, "shouldLogTouch"))
    return MEMORY[0x1E0C9AA70];
  v50[0] = *MEMORY[0x1E0D80298];
  v48 = *MEMORY[0x1E0D80318];
  v49 = &unk_1EA1DAC18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v20;
  v50[1] = *MEMORY[0x1E0D802F0];
  v46[0] = CFSTR("Unknown");
  v3 = *MEMORY[0x1E0D80360];
  v43[0] = *MEMORY[0x1E0D80358];
  v2 = v43[0];
  v43[1] = v3;
  v45[0] = &unk_1EA1C14C0;
  v45[1] = CFSTR("s");
  v44 = *MEMORY[0x1E0D802E8];
  v4 = v44;
  v45[2] = &unk_1EA1DCE20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v43, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v19;
  v46[1] = CFSTR("Active");
  v41[0] = v2;
  v41[1] = v3;
  v42[0] = &unk_1EA1C14C0;
  v42[1] = CFSTR("s");
  v41[2] = v4;
  v42[2] = &unk_1EA1DCE38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v18;
  v46[2] = CFSTR("Ready");
  v39[0] = v2;
  v39[1] = v3;
  v40[0] = &unk_1EA1C14C0;
  v40[1] = CFSTR("s");
  v39[2] = v4;
  v40[2] = &unk_1EA1DCE50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v17;
  v46[3] = CFSTR("AutoReady");
  v37[0] = v2;
  v37[1] = v3;
  v38[0] = &unk_1EA1C14C0;
  v38[1] = CFSTR("s");
  v37[2] = v4;
  v38[2] = &unk_1EA1DCE68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47[3] = v16;
  v46[4] = CFSTR("UILock");
  v35[0] = v2;
  v35[1] = v3;
  v36[0] = &unk_1EA1C14C0;
  v36[1] = CFSTR("s");
  v35[2] = v4;
  v36[2] = &unk_1EA1DCE80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v47[4] = v15;
  v46[5] = CFSTR("FaceDetected");
  v33[0] = v2;
  v33[1] = v3;
  v34[0] = &unk_1EA1C14C0;
  v34[1] = CFSTR("s");
  v33[2] = v4;
  v34[2] = &unk_1EA1DCE98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v47[5] = v14;
  v46[6] = CFSTR("StationaryFingers");
  v31[0] = v2;
  v31[1] = v3;
  v32[0] = &unk_1EA1C14C0;
  v32[1] = CFSTR("s");
  v31[2] = v4;
  v32[2] = &unk_1EA1DCEB0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v47[6] = v13;
  v46[7] = CFSTR("AutoScan");
  v29[0] = v2;
  v29[1] = v3;
  v30[0] = &unk_1EA1C14C0;
  v30[1] = CFSTR("s");
  v29[2] = v4;
  v30[2] = &unk_1EA1DCEC8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47[7] = v5;
  v46[8] = CFSTR("VSFOMCal");
  v27[0] = v2;
  v27[1] = v3;
  v28[0] = &unk_1EA1C14C0;
  v28[1] = CFSTR("s");
  v27[2] = v4;
  v28[2] = &unk_1EA1DCEE0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v47[8] = v6;
  v46[9] = CFSTR("Anticipate");
  v25[0] = v2;
  v25[1] = v3;
  v26[0] = &unk_1EA1C14C0;
  v26[1] = CFSTR("s");
  v25[2] = v4;
  v26[2] = &unk_1EA1DCEF8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47[9] = v7;
  v46[10] = CFSTR("Off");
  v23[0] = v2;
  v23[1] = v3;
  v24[0] = &unk_1EA1C14C0;
  v24[1] = CFSTR("s");
  v23[2] = v4;
  v24[2] = &unk_1EA1DCF10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47[10] = v8;
  v46[11] = CFSTR("On");
  v21[0] = v2;
  v21[1] = v3;
  v22[0] = &unk_1EA1C14C0;
  v22[1] = CFSTR("s");
  v21[2] = v4;
  v22[2] = &unk_1EA1DCF28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v47[11] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventBackwardDefinitionHarmonyParameters
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
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
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
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
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  _QWORD v254[124];
  _QWORD v255[124];
  uint64_t v256;
  void *v257;
  _QWORD v258[2];
  _QWORD v259[4];

  v259[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D15718], "supportsAdaptation"))
    return MEMORY[0x1E0C9AA70];
  v258[0] = *MEMORY[0x1E0D80298];
  v256 = *MEMORY[0x1E0D80318];
  v257 = &unk_1EA1DAC68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v257, &v256, 1);
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  v259[0] = v253;
  v258[1] = *MEMORY[0x1E0D802F0];
  v254[0] = CFSTR("DCBins_0");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v252, "commonTypeDict_RealFormat");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  v255[0] = v251;
  v254[1] = CFSTR("DCBins_1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v250, "commonTypeDict_RealFormat");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v255[1] = v249;
  v254[2] = CFSTR("DCBins_2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v248, "commonTypeDict_RealFormat");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  v255[2] = v247;
  v254[3] = CFSTR("DCBins_3");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "commonTypeDict_RealFormat");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  v255[3] = v245;
  v254[4] = CFSTR("DCBins_4");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "commonTypeDict_RealFormat");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  v255[4] = v243;
  v254[5] = CFSTR("DCBins_5");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v242, "commonTypeDict_RealFormat");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  v255[5] = v241;
  v254[6] = CFSTR("DCBins_6");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "commonTypeDict_RealFormat");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  v255[6] = v239;
  v254[7] = CFSTR("DCBins_7");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v238, "commonTypeDict_RealFormat");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v255[7] = v237;
  v254[8] = CFSTR("DCBins_8");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v236, "commonTypeDict_RealFormat");
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  v255[8] = v235;
  v254[9] = CFSTR("DCBins_9");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v234, "commonTypeDict_RealFormat");
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  v255[9] = v233;
  v254[10] = CFSTR("DCBins_10");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v232, "commonTypeDict_RealFormat");
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v255[10] = v231;
  v254[11] = CFSTR("DCBins_11");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v230, "commonTypeDict_RealFormat");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  v255[11] = v229;
  v254[12] = CFSTR("DCBins_12");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v228, "commonTypeDict_RealFormat");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  v255[12] = v227;
  v254[13] = CFSTR("DCBins_13");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v226, "commonTypeDict_RealFormat");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  v255[13] = v225;
  v254[14] = CFSTR("DCBins_14");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "commonTypeDict_RealFormat");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  v255[14] = v223;
  v254[15] = CFSTR("DCBins_15");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v222, "commonTypeDict_RealFormat");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  v255[15] = v221;
  v254[16] = CFSTR("DCBins_16");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v220, "commonTypeDict_RealFormat");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v255[16] = v219;
  v254[17] = CFSTR("ACBins_0");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v218, "commonTypeDict_RealFormat");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v255[17] = v217;
  v254[18] = CFSTR("ACBins_1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v216, "commonTypeDict_RealFormat");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v255[18] = v215;
  v254[19] = CFSTR("ACBins_2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "commonTypeDict_RealFormat");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v255[19] = v213;
  v254[20] = CFSTR("ACBins_3");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "commonTypeDict_RealFormat");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v255[20] = v211;
  v254[21] = CFSTR("ACBins_4");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "commonTypeDict_RealFormat");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v255[21] = v209;
  v254[22] = CFSTR("ACBins_5");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "commonTypeDict_RealFormat");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v255[22] = v207;
  v254[23] = CFSTR("ACBins_6");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "commonTypeDict_RealFormat");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v255[23] = v205;
  v254[24] = CFSTR("ACBins_7");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "commonTypeDict_RealFormat");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v255[24] = v203;
  v254[25] = CFSTR("ACBins_8");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "commonTypeDict_RealFormat");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v255[25] = v201;
  v254[26] = CFSTR("ACBins_9");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "commonTypeDict_RealFormat");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v255[26] = v199;
  v254[27] = CFSTR("ACBins_10");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "commonTypeDict_RealFormat");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v255[27] = v197;
  v254[28] = CFSTR("ACBins_11");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v196, "commonTypeDict_RealFormat");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v255[28] = v195;
  v254[29] = CFSTR("ACBins_12");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "commonTypeDict_RealFormat");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v255[29] = v193;
  v254[30] = CFSTR("ACBins_13");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "commonTypeDict_RealFormat");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v255[30] = v191;
  v254[31] = CFSTR("ACBins_14");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "commonTypeDict_RealFormat");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v255[31] = v189;
  v254[32] = CFSTR("ACBins_15");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "commonTypeDict_RealFormat");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v255[32] = v187;
  v254[33] = CFSTR("ACBins_16");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "commonTypeDict_RealFormat");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v255[33] = v185;
  v254[34] = CFSTR("ASBins_0");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "commonTypeDict_RealFormat");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v255[34] = v183;
  v254[35] = CFSTR("ASBins_1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "commonTypeDict_RealFormat");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v255[35] = v181;
  v254[36] = CFSTR("ASBins_2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "commonTypeDict_RealFormat");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v255[36] = v179;
  v254[37] = CFSTR("ASBins_3");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "commonTypeDict_RealFormat");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v255[37] = v177;
  v254[38] = CFSTR("ASBins_4");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "commonTypeDict_RealFormat");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v255[38] = v175;
  v254[39] = CFSTR("ASBins_5");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "commonTypeDict_RealFormat");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v255[39] = v173;
  v254[40] = CFSTR("ASBins_6");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "commonTypeDict_RealFormat");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v255[40] = v171;
  v254[41] = CFSTR("ASBins_7");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "commonTypeDict_RealFormat");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v255[41] = v169;
  v254[42] = CFSTR("ASBins_8");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "commonTypeDict_RealFormat");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v255[42] = v167;
  v254[43] = CFSTR("ASBins_9");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "commonTypeDict_RealFormat");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v255[43] = v165;
  v254[44] = CFSTR("ACABins_0");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "commonTypeDict_RealFormat");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v255[44] = v163;
  v254[45] = CFSTR("ACABins_1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "commonTypeDict_RealFormat");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v255[45] = v161;
  v254[46] = CFSTR("ACABins_2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "commonTypeDict_RealFormat");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v255[46] = v159;
  v254[47] = CFSTR("ACABins_3");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "commonTypeDict_RealFormat");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v255[47] = v157;
  v254[48] = CFSTR("ACABins_4");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "commonTypeDict_RealFormat");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v255[48] = v155;
  v254[49] = CFSTR("ACABins_5");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "commonTypeDict_RealFormat");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v255[49] = v153;
  v254[50] = CFSTR("ACABins_6");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "commonTypeDict_RealFormat");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v255[50] = v151;
  v254[51] = CFSTR("ACABins_7");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "commonTypeDict_RealFormat");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v255[51] = v149;
  v254[52] = CFSTR("ACABins_8");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "commonTypeDict_RealFormat");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v255[52] = v147;
  v254[53] = CFSTR("ACABins_9");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "commonTypeDict_RealFormat");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v255[53] = v145;
  v254[54] = CFSTR("ACABins_10");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "commonTypeDict_RealFormat");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v255[54] = v143;
  v254[55] = CFSTR("ACABins_11");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "commonTypeDict_RealFormat");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v255[55] = v141;
  v254[56] = CFSTR("ACABins_12");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "commonTypeDict_RealFormat");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v255[56] = v139;
  v254[57] = CFSTR("ACABins_13");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "commonTypeDict_RealFormat");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v255[57] = v137;
  v254[58] = CFSTR("ACABins_14");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "commonTypeDict_RealFormat");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v255[58] = v135;
  v254[59] = CFSTR("ACABins_15");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "commonTypeDict_RealFormat");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v255[59] = v133;
  v254[60] = CFSTR("ACABins_16");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "commonTypeDict_RealFormat");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v255[60] = v131;
  v254[61] = CFSTR("ACABins_17");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "commonTypeDict_RealFormat");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v255[61] = v129;
  v254[62] = CFSTR("ACABins_18");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "commonTypeDict_RealFormat");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v255[62] = v127;
  v254[63] = CFSTR("ACABins_19");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "commonTypeDict_RealFormat");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v255[63] = v125;
  v254[64] = CFSTR("ACABins_20");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "commonTypeDict_RealFormat");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v255[64] = v123;
  v254[65] = CFSTR("ACABins_21");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "commonTypeDict_RealFormat");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v255[65] = v121;
  v254[66] = CFSTR("ACABins_22");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "commonTypeDict_RealFormat");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v255[66] = v119;
  v254[67] = CFSTR("ACABins_23");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "commonTypeDict_RealFormat");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v255[67] = v117;
  v254[68] = CFSTR("ACABins_24");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "commonTypeDict_RealFormat");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v255[68] = v115;
  v254[69] = CFSTR("ACABins_25");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "commonTypeDict_RealFormat");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v255[69] = v113;
  v254[70] = CFSTR("ACABins_26");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "commonTypeDict_RealFormat");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v255[70] = v111;
  v254[71] = CFSTR("ACABins_27");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "commonTypeDict_RealFormat");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v255[71] = v109;
  v254[72] = CFSTR("ACABins_28");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "commonTypeDict_RealFormat");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v255[72] = v107;
  v254[73] = CFSTR("ACABins_29");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "commonTypeDict_RealFormat");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v255[73] = v105;
  v254[74] = CFSTR("ACABins_30");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "commonTypeDict_RealFormat");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v255[74] = v103;
  v254[75] = CFSTR("ACABins_31");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "commonTypeDict_RealFormat");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v255[75] = v101;
  v254[76] = CFSTR("ACABins_32");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "commonTypeDict_RealFormat");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v255[76] = v99;
  v254[77] = CFSTR("ACABins_33");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "commonTypeDict_RealFormat");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v255[77] = v97;
  v254[78] = CFSTR("ACABins_34");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "commonTypeDict_RealFormat");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v255[78] = v95;
  v254[79] = CFSTR("ACABins_35");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "commonTypeDict_RealFormat");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v255[79] = v93;
  v254[80] = CFSTR("ACABins_36");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "commonTypeDict_RealFormat");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v255[80] = v91;
  v254[81] = CFSTR("ACABins_37");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "commonTypeDict_RealFormat");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v255[81] = v89;
  v254[82] = CFSTR("ACABins_38");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "commonTypeDict_RealFormat");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v255[82] = v87;
  v254[83] = CFSTR("ACABins_39");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "commonTypeDict_RealFormat");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v255[83] = v85;
  v254[84] = CFSTR("ACABins_40");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "commonTypeDict_RealFormat");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v255[84] = v83;
  v254[85] = CFSTR("ACABins_41");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "commonTypeDict_RealFormat");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v255[85] = v81;
  v254[86] = CFSTR("ACABins_42");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "commonTypeDict_RealFormat");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v255[86] = v79;
  v254[87] = CFSTR("ACABins_43");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "commonTypeDict_RealFormat");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v255[87] = v77;
  v254[88] = CFSTR("ACABins_44");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "commonTypeDict_RealFormat");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v255[88] = v75;
  v254[89] = CFSTR("ACABins_45");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "commonTypeDict_RealFormat");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v255[89] = v73;
  v254[90] = CFSTR("ACTBins_0");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "commonTypeDict_IntegerFormat");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v255[90] = v71;
  v254[91] = CFSTR("ACTBins_1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "commonTypeDict_IntegerFormat");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v255[91] = v69;
  v254[92] = CFSTR("ACTBins_2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "commonTypeDict_IntegerFormat");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v255[92] = v67;
  v254[93] = CFSTR("ACTBins_3");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "commonTypeDict_IntegerFormat");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v255[93] = v65;
  v254[94] = CFSTR("ACTBins_4");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "commonTypeDict_IntegerFormat");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v255[94] = v63;
  v254[95] = CFSTR("ACTBins_5");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "commonTypeDict_IntegerFormat");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v255[95] = v61;
  v254[96] = CFSTR("ACTBins_6");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "commonTypeDict_IntegerFormat");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v255[96] = v59;
  v254[97] = CFSTR("ACTBins_7");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "commonTypeDict_IntegerFormat");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v255[97] = v57;
  v254[98] = CFSTR("ACTBins_8");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "commonTypeDict_IntegerFormat");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v255[98] = v55;
  v254[99] = CFSTR("ACTBins_9");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "commonTypeDict_IntegerFormat");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v255[99] = v53;
  v254[100] = CFSTR("ACTBins_10");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "commonTypeDict_IntegerFormat");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v255[100] = v51;
  v254[101] = CFSTR("ACTBins_11");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v255[101] = v49;
  v254[102] = CFSTR("ACTBins_12");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "commonTypeDict_IntegerFormat");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v255[102] = v47;
  v254[103] = CFSTR("ACTBins_13");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "commonTypeDict_IntegerFormat");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v255[103] = v45;
  v254[104] = CFSTR("ACTBins_14");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "commonTypeDict_IntegerFormat");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v255[104] = v43;
  v254[105] = CFSTR("ACTBins_15");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "commonTypeDict_IntegerFormat");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v255[105] = v41;
  v254[106] = CFSTR("ACTBins_16");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "commonTypeDict_IntegerFormat");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v255[106] = v39;
  v254[107] = CFSTR("DCTBins_0");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "commonTypeDict_IntegerFormat");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v255[107] = v37;
  v254[108] = CFSTR("DCTBins_1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "commonTypeDict_IntegerFormat");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v255[108] = v35;
  v254[109] = CFSTR("DCTBins_2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v255[109] = v33;
  v254[110] = CFSTR("DCTBins_3");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_IntegerFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v255[110] = v31;
  v254[111] = CFSTR("DCTBins_4");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v255[111] = v29;
  v254[112] = CFSTR("DCTBins_5");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v255[112] = v27;
  v254[113] = CFSTR("DCTBins_6");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v255[113] = v25;
  v254[114] = CFSTR("DCTBins_7");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v255[114] = v23;
  v254[115] = CFSTR("DCTBins_8");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v255[115] = v21;
  v254[116] = CFSTR("DCTBins_9");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v255[116] = v19;
  v254[117] = CFSTR("DCTBins_10");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v255[117] = v17;
  v254[118] = CFSTR("DCTBins_11");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v255[118] = v15;
  v254[119] = CFSTR("DCTBins_12");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v255[119] = v13;
  v254[120] = CFSTR("DCTBins_13");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v255[120] = v3;
  v254[121] = CFSTR("DCTBins_14");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v255[121] = v5;
  v254[122] = CFSTR("DCTBins_15");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v255[122] = v7;
  v254[123] = CFSTR("DCTBins_16");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v255[123] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v255, v254, 124);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v259[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v259, v258, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventBackwardDefinitionBlueLightParameters
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
  uint64_t v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLDisplayAgent shouldLogBLR](PLDisplayAgent, "shouldLogBLR"))
    return MEMORY[0x1E0C9AA70];
  v18[0] = *MEMORY[0x1E0D80298];
  v16 = *MEMORY[0x1E0D80318];
  v17 = &unk_1EA1DAC18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("AvgBacklightNits");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_RealFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("AvgLogicalBrightnessNits");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_RealFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("BlueLightReductionOffTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_RealFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("BlueLightReductionOnTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_RealFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventBackwardDefinitionRampInfo
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[23];
  _QWORD v53[23];
  uint64_t v54;
  void *v55;
  _QWORD v56[2];
  _QWORD v57[4];

  v57[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
    return MEMORY[0x1E0C9AA70];
  v56[0] = *MEMORY[0x1E0D80298];
  v54 = *MEMORY[0x1E0D80318];
  v55 = &unk_1EA1DAC18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v51;
  v56[1] = *MEMORY[0x1E0D802F0];
  v52[0] = CFSTR("AAP_NumberOfUpdates");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v49;
  v52[1] = CFSTR("AAP_RampFrequency");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "commonTypeDict_IntegerFormat");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v47;
  v52[2] = CFSTR("AAP_RampLength");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "commonTypeDict_RealFormat");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v45;
  v52[3] = CFSTR("AAP_RampOrigin");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "commonTypeDict_RealFormat");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v43;
  v52[4] = CFSTR("AAP_RampTarget");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "commonTypeDict_RealFormat");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v41;
  v52[5] = CFSTR("Colour_NumberOfUpdates");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "commonTypeDict_IntegerFormat");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v39;
  v52[6] = CFSTR("Colour_RampFrequency");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "commonTypeDict_IntegerFormat");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v53[6] = v37;
  v52[7] = CFSTR("Colour_RampLength");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "commonTypeDict_RealFormat");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v53[7] = v35;
  v52[8] = CFSTR("Colour_RampOrigin_X");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "commonTypeDict_RealFormat");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v53[8] = v33;
  v52[9] = CFSTR("Colour_RampOrigin_Y");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_RealFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v53[9] = v31;
  v52[10] = CFSTR("Colour_RampTarget_X");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commonTypeDict_RealFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v53[10] = v29;
  v52[11] = CFSTR("Colour_RampTarget_Y");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonTypeDict_RealFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v53[11] = v27;
  v52[12] = CFSTR("SDR_NumberOfUpdates");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v53[12] = v25;
  v52[13] = CFSTR("SDR_RampFrequency");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v53[13] = v23;
  v52[14] = CFSTR("SDR_RampLength");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_RealFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v53[14] = v21;
  v52[15] = CFSTR("SDR_RampOrigin");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_RealFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v53[15] = v19;
  v52[16] = CFSTR("SDR_RampTarget");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_RealFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v53[16] = v17;
  v52[17] = CFSTR("EDR_NumberOfUpdates");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53[17] = v15;
  v52[18] = CFSTR("EDR_RampFrequency");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v53[18] = v13;
  v52[19] = CFSTR("EDR_RampLength");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_RealFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v53[19] = v3;
  v52[20] = CFSTR("EDR_RampOrigin");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_RealFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v53[20] = v5;
  v52[21] = CFSTR("EDR_RampTarget");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_RealFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v53[21] = v7;
  v52[22] = CFSTR("isFlipbookActive");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v53[22] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventBackwardDefinitionCurveUpdate
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
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
    return MEMORY[0x1E0C9AA70];
  v16[0] = *MEMORY[0x1E0D80298];
  v14 = *MEMORY[0x1E0D80318];
  v15 = &unk_1EA1DAC18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E0D802F0];
  v12[0] = CFSTR("lux");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("nits");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("level");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
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

+ (id)entryEventBackwardDefinitionALSThreshold
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
  uint64_t v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
    return MEMORY[0x1E0C9AA70];
  v18[0] = *MEMORY[0x1E0D80298];
  v16 = *MEMORY[0x1E0D80318];
  v17 = &unk_1EA1DAC18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("WakeReason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_StringFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("Lux");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_RealFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("DimThreshold");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_RealFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("BrightenThreshold");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_RealFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventBackwardDefinitionALSSamplesBeforeWake
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
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
    return MEMORY[0x1E0C9AA70];
  v16[0] = *MEMORY[0x1E0D80298];
  v14 = *MEMORY[0x1E0D80318];
  v15 = &unk_1EA1DAC18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E0D802F0];
  v12[0] = CFSTR("Lux");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("colorX");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("colorY");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
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

+ (id)entryEventBackwardDefinitionAmbientLight
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
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
    return MEMORY[0x1E0C9AA70];
  v16[0] = *MEMORY[0x1E0D80298];
  v14 = *MEMORY[0x1E0D80318];
  v15 = &unk_1EA1DAC18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E0D802F0];
  v12[0] = CFSTR("Lux");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("colorX");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("colorY");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
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

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventBackwardDefinitionAPLStats
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];
  _QWORD v24[7];
  _QWORD v25[7];
  _QWORD v26[7];
  _QWORD v27[2];
  _QWORD v28[4];

  v28[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLDisplayAgent shouldLogAPL](PLDisplayAgent, "shouldLogAPL"))
    return MEMORY[0x1E0C9AA70];
  v27[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v25[0] = *MEMORY[0x1E0D80318];
  v25[1] = v2;
  v26[0] = &unk_1EA1DAC78;
  v26[1] = CFSTR("logDisplayAPL");
  v3 = *MEMORY[0x1E0D80340];
  v25[2] = *MEMORY[0x1E0D80288];
  v25[3] = v3;
  v26[2] = MEMORY[0x1E0C9AAB0];
  v26[3] = &unk_1EA1C1520;
  v4 = *MEMORY[0x1E0D80250];
  v25[4] = *MEMORY[0x1E0D80338];
  v25[5] = v4;
  v26[4] = &unk_1EA1DAC88;
  v26[5] = MEMORY[0x1E0C9AAB0];
  v25[6] = *MEMORY[0x1E0D802A0];
  v26[6] = &unk_1EA1DCF40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  v27[1] = *MEMORY[0x1E0D802F0];
  v23[0] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_StringFormat_withBundleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  v23[1] = CFSTR("AvgRed");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v18;
  v23[2] = CFSTR("AvgGreen");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v16;
  v23[3] = CFSTR("AvgBlue");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v6;
  v23[4] = CFSTR("Frames");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v8;
  v23[5] = CFSTR("AvgPower");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_RealFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v10;
  v23[6] = CFSTR("AvgAPL");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commonTypeDict_RealFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)entryEventBackwardDefinitionAZLStats
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
  if (!objc_msgSend(MEMORY[0x1E0D80020], "hasCapability:", 8))
    return MEMORY[0x1E0C9AA70];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1EA1DAC18;
  v20[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("AvgPower");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("AZLAccum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("NitsAccum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("BLUpdateCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("BLFrameCount");
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

+ (id)entryEventBackwardDefinitionAZLSnapshots
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
  if (!objc_msgSend(MEMORY[0x1E0D80020], "hasCapability:", 8))
    return MEMORY[0x1E0C9AA70];
  v25[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80330];
  v23[0] = *MEMORY[0x1E0D80318];
  v23[1] = v2;
  v24[0] = &unk_1EA1DAC18;
  v24[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v20;
  v25[1] = *MEMORY[0x1E0D802F0];
  v21[0] = CFSTR("PacketID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  v21[1] = CFSTR("VLED");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  v21[2] = CFSTR("MaxRowCurrent");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v14;
  v21[3] = CFSTR("NitsAccum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v4;
  v21[4] = CFSTR("AverageCurrent");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v6;
  v21[5] = CFSTR("AZL");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v8;
  v21[6] = CFSTR("SystemNits");
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

+ (id)entryEventBackwardDefinitionDCPAODstats
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
  uint64_t v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[4];

  v33[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
    return MEMORY[0x1E0C9AA70];
  v32[0] = *MEMORY[0x1E0D80298];
  v30 = *MEMORY[0x1E0D80318];
  v31 = &unk_1EA1DAC98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v27;
  v32[1] = *MEMORY[0x1E0D802F0];
  v28[0] = CFSTR("awake_count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v25;
  v28[1] = CFSTR("media_count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v23;
  v28[2] = CFSTR("flipbook_count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v21;
  v28[3] = CFSTR("flipbook_delay");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v19;
  v28[4] = CFSTR("media_scanout");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v17;
  v28[5] = CFSTR("ambient_count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v15;
  v28[6] = CFSTR("prc_repeat_coun");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v13;
  v28[7] = CFSTR("pdc_repeat_coun");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v3;
  v28[8] = CFSTR("llm_count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[8] = v5;
  v28[9] = CFSTR("apl_sum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[9] = v7;
  v28[10] = CFSTR("apl_count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
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

+ (id)entryAggregateDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("UserTouch");
  +[PLDisplayAgent entryAggregateDefinitionUserTouch](PLDisplayAgent, "entryAggregateDefinitionUserTouch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("ScreenOn");
  v7[0] = v2;
  +[PLDisplayAgent entryAggregateDefinitionScreenOn](PLDisplayAgent, "entryAggregateDefinitionScreenOn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)entryAggregateDefinitionUserTouch
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  if (!+[PLDisplayAgent shouldLogTouch](PLDisplayAgent, "shouldLogTouch"))
    return MEMORY[0x1E0C9AA70];
  v20[0] = *MEMORY[0x1E0D80298];
  v18 = *MEMORY[0x1E0D80318];
  v19 = &unk_1EA1DAC18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v2;
  v20[1] = *MEMORY[0x1E0D802F0];
  v16[0] = CFSTR("UserTouchCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("UserTouchTime");
  v17[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v7;
  v20[2] = *MEMORY[0x1E0D80228];
  v14 = &unk_1EA1DACA8;
  v12 = *MEMORY[0x1E0D80220];
  v13 = &unk_1EA1DACB8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = *MEMORY[0x1E0D80238];
  v21[2] = v9;
  v21[3] = &unk_1EA1DCF58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryAggregateDefinitionScreenOn
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLDisplayAgent)init
{
  PLDisplayAgent *v3;
  PLDisplayAgent *v4;
  int v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  unint64_t v9;
  id v10;
  const __CFString *v11;
  CBAdaptationClient *v12;
  CBAdaptationClient *colorAdaptationClient;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSDate *pendingBacklightEntryDate;
  NSMutableDictionary *v22;
  NSMutableDictionary *pendingBacklightEntry;
  id v24;
  void *v25;
  id *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  id v45;
  uint64_t v46;
  id *v47;
  uint64_t v48;
  id v49;
  id v50;
  void *v51;
  id *v52;
  void *v53;
  void *v54;
  id v55;
  id *v56;
  uint64_t v57;
  id v58;
  id v59;
  id *v60;
  uint64_t v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  PLIOKitOperatorComposition *v66;
  PLIOKitOperatorComposition *iokitDisplay;
  int MainDisplay;
  uint64_t v69;
  NSObject *v70;
  NSObject *v71;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Main;
  PLIOKitOperatorComposition *v74;
  PLIOKitOperatorComposition *iokitTouch;
  NSDate *userTouchDownTime;
  PLEntry *bluelightStatusEntry;
  PLTimer *bluelightFilterTimer;
  PLTimer *uAmpsFilterTimer;
  PLEventForwardDisplayEntry *uAmpsEntry;
  void *v82;
  uint8_t buf[8];
  _QWORD v84[4];
  PLDisplayAgent *v85;
  _QWORD v86[4];
  id *v87;
  _QWORD v88[4];
  id *v89;
  _QWORD v90[4];
  id *v91;
  _QWORD v92[4];
  id *v93;
  _QWORD v94[4];
  id *v95;
  _QWORD v96[5];
  _QWORD v97[4];
  id *v98;
  _QWORD v99[5];
  _QWORD block[4];
  PLDisplayAgent *v101;
  objc_super v102;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
    goto LABEL_2;
  v102.receiver = self;
  v102.super_class = (Class)PLDisplayAgent;
  v4 = -[PLAgent init](&v102, sel_init);
  if (!v4)
  {
LABEL_61:
    self = v4;
    v3 = self;
    goto LABEL_62;
  }
  v5 = _os_feature_enabled_impl();
  v6 = MEMORY[0x1E0C809B0];
  if (v5 && objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
  {
    objc_msgSend(MEMORY[0x1E0D00F58], "sharedBacklight");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:", v4);

    -[PLOperator workQueue](v4, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __22__PLDisplayAgent_init__block_invoke;
    block[3] = &unk_1EA16D040;
    v101 = v4;
    dispatch_async(v8, block);

  }
  v4->_alsOn = -[PLDisplayAgent isAlsEnabled](v4, "isAlsEnabled");
  v4->_lastALSPowerSaved = 1.79769313e308;
  v4->_isFirstTimeModeling = 1;
  v4->_displaymNits = 0.0;
  v4->_realmNits = 0.0;
  v4->_autobrightnessmNits = 0.0;
  v4->_ShouldLogAmbient = objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:ifNotSet:", CFSTR("AmbientFullMode"), 0);
  v4->_lastRearLuxValue = -1;
  v4->_supportsFinalBrightnessCommit = 0;
  v9 = 0x1E0C99000uLL;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isiPad") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isiPod") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isiPhone") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isMac"))
  {
    objc_msgSend(v10, "addObject:", CFSTR("BacklightPowerMilliWatts"));
    objc_msgSend(v10, "addObject:", CFSTR("BacklightPowerNits"));
    objc_msgSend(v10, "addObject:", CFSTR("DisplayBrightness"));
    objc_msgSend(v10, "addObject:", CFSTR("CBSupportsFinalCommit"));
    objc_msgSend(v10, "addObject:", CFSTR("CBFinalBrightnessCommit"));
    objc_msgSend(v10, "addObject:", CFSTR("DisplayBrightnessAuto"));
    objc_msgSend(v10, "addObject:", CFSTR("PowerLogReport"));
    objc_msgSend(v10, "addObject:", CFSTR("CBBlueReductionStatus"));
    if (objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
    {
      objc_msgSend(v10, "addObject:", CFSTR("AODRampTelemetry"));
      objc_msgSend(v10, "addObject:", CFSTR("AODCurveUpdate"));
      objc_msgSend(v10, "addObject:", CFSTR("AODWakeFromALSThreshold"));
      objc_msgSend(v10, "addObject:", CFSTR("CBAmbientLightTelemetry"));
    }
    if (+[PLDisplayAgent shouldLogLuxStats](PLDisplayAgent, "shouldLogLuxStats"))
    {
      v11 = CFSTR("RLuxStats");
LABEL_15:
      objc_msgSend(v10, "addObject:", v11);
    }
  }
  else if (objc_msgSend(MEMORY[0x1E0D80020], "isWatch"))
  {
    v11 = CFSTR("InactiveScreenHistory");
    goto LABEL_15;
  }
  if (objc_msgSend(MEMORY[0x1E0D15718], "supportsAdaptation"))
  {
    v12 = (CBAdaptationClient *)objc_alloc_init(MEMORY[0x1E0D15718]);
    colorAdaptationClient = v4->_colorAdaptationClient;
    v4->_colorAdaptationClient = v12;

    if (v4->_colorAdaptationClient)
    {
      objc_msgSend(v10, "addObject:", CFSTR("ColorAdaptationEnabled"));
    }
    else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v99[0] = v6;
      v99[1] = 3221225472;
      v99[2] = __22__PLDisplayAgent_init__block_invoke_2;
      v99[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v99[4] = objc_opt_class();
      if (init_defaultOnce_0 != -1)
        dispatch_once(&init_defaultOnce_0, v99);
      if (init_classDebugEnabled_0)
      {
        v14 = v6;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CBAdaptationClient init fail! Cannot get color adaptation information!"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent init]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 1461);

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        v6 = v14;
        v9 = 0x1E0C99000;
      }
    }
  }
  pendingBacklightEntryDate = v4->_pendingBacklightEntryDate;
  v4->_pendingBacklightEntryDate = 0;

  v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  pendingBacklightEntry = v4->_pendingBacklightEntry;
  v4->_pendingBacklightEntry = v22;

  v24 = objc_alloc(MEMORY[0x1E0D80070]);
  -[PLOperator workQueue](v4, "workQueue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = v6;
  v97[1] = 3221225472;
  v97[2] = __22__PLDisplayAgent_init__block_invoke_989;
  v97[3] = &unk_1EA16EB78;
  v26 = v4;
  v98 = v26;
  v27 = objc_msgSend(v24, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", 0, 1, 0, v25, v97, 1.0, 0.0);
  v28 = v26[18];
  v26[18] = (id)v27;

  objc_msgSend(v26[18], "arm");
  v29 = objc_alloc_init(MEMORY[0x1E0D15710]);
  v30 = v26[16];
  v26[16] = v29;

  if (!v26[16] && objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v96[0] = v6;
    v96[1] = 3221225472;
    v96[2] = __22__PLDisplayAgent_init__block_invoke_999;
    v96[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v96[4] = objc_opt_class();
    if (init_defaultOnce_997 != -1)
      dispatch_once(&init_defaultOnce_997, v96);
    if (init_classDebugEnabled_998)
    {
      v31 = v6;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BrightnessSystemClient init fail!"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "lastPathComponent");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent init]");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 1489);

      PLLogCommon();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      v6 = v31;
      v9 = 0x1E0C99000uLL;
    }
  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v26, "brightnessSystemClient");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = v26[16];
      v94[0] = v6;
      v94[1] = 3221225472;
      v94[2] = __22__PLDisplayAgent_init__block_invoke_1002;
      v94[3] = &unk_1EA170A20;
      v95 = v26;
      objc_msgSend(v39, "registerNotificationBlock:forProperties:", v94, v10);

    }
  }
  objc_msgSend(v26, "brightnessSystemClient");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v40, "copyPropertyForKey:", CFSTR("CBSupportsFinalCommit"));
  objc_msgSend(v26, "setSupportsFinalBrightnessCommit:", objc_msgSend(v41, "BOOLValue"));

  PLLogDisplay();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    -[PLDisplayAgent init].cold.3(v26, v42);

  if (+[PLDisplayAgent shouldLogFromDCP](PLDisplayAgent, "shouldLogFromDCP")
    && !+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    PLLogDisplay();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA9D6000, v43, OS_LOG_TYPE_DEFAULT, "IO object: seting up notification", buf, 2u);
    }

    objc_msgSend(*(id *)(v9 + 3560), "array");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAfkEndpoints:", v44);

    v45 = objc_alloc(MEMORY[0x1E0D7FFE8]);
    v46 = *MEMORY[0x1E0D803B0];
    v92[0] = v6;
    v92[1] = 3221225472;
    v92[2] = __22__PLDisplayAgent_init__block_invoke_1006;
    v92[3] = &unk_1EA170A48;
    v47 = v26;
    v93 = v47;
    v48 = objc_msgSend(v45, "initWithOperator:forDynamicServiceClass:forNotificationType:withMatchBlock:", v47, v46, "IOServiceMatched", v92);
    v49 = v47[10];
    v47[10] = (id)v48;

    v50 = objc_alloc(MEMORY[0x1E0D80070]);
    objc_msgSend(v47, "workQueue");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = v6;
    v90[1] = 3221225472;
    v90[2] = __22__PLDisplayAgent_init__block_invoke_2_1008;
    v90[3] = &unk_1EA16EB78;
    v52 = v47;
    v91 = v52;
    v53 = (void *)objc_msgSend(v50, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", 0, 1, 0, v51, v90, 10.0, 10.0);
    objc_msgSend(v52, "setDcpTimeoffsetCalibTimer:", v53);

    objc_msgSend(v52, "dcpTimeoffsetCalibTimer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "arm");

  }
  v82 = v10;
  v55 = objc_alloc(MEMORY[0x1E0D7FFE8]);
  v88[0] = v6;
  v88[1] = 3221225472;
  v88[2] = __22__PLDisplayAgent_init__block_invoke_1011;
  v88[3] = &unk_1EA170A70;
  v56 = v26;
  v89 = v56;
  v57 = objc_msgSend(v55, "initWithOperator:forService:withBlock:", v56, CFSTR("AppleARMBacklight"), v88);
  v58 = v56[9];
  v56[9] = (id)v57;

  if (+[PLDisplayAgent shouldLogBacklightControl](PLDisplayAgent, "shouldLogBacklightControl"))
  {
    v59 = objc_alloc(MEMORY[0x1E0D7FFE8]);
    v86[0] = v6;
    v86[1] = 3221225472;
    v86[2] = __22__PLDisplayAgent_init__block_invoke_1031;
    v86[3] = &unk_1EA170A70;
    v60 = v56;
    v87 = v60;
    v61 = objc_msgSend(v59, "initWithOperator:forService:withBlock:", v60, CFSTR("backlight-control"), v86);
    v62 = v60[11];
    v60[11] = (id)v61;

  }
  v63 = objc_alloc(MEMORY[0x1E0D7FFE8]);
  v64 = v6;
  v65 = *MEMORY[0x1E0D803B8];
  v84[0] = v64;
  v84[1] = 3221225472;
  v84[2] = __22__PLDisplayAgent_init__block_invoke_2_1034;
  v84[3] = &unk_1EA170A70;
  self = v56;
  v85 = self;
  v66 = (PLIOKitOperatorComposition *)objc_msgSend(v63, "initWithOperator:forService:withBlock:", self, v65, v84);
  iokitDisplay = self->_iokitDisplay;
  self->_iokitDisplay = v66;

  if (objc_msgSend(MEMORY[0x1E0D80020], "hasDCP")
    && !+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    *(_QWORD *)buf = 0;
    MainDisplay = IOMobileFramebufferGetMainDisplay();
    v69 = *(_QWORD *)buf;
    PLLogDisplay();
    v70 = objc_claimAutoreleasedReturnValue();
    v71 = v70;
    if (MainDisplay || !v69)
    {
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        -[PLDisplayAgent init].cold.2();

    }
    else
    {
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
        -[PLDisplayAgent init].cold.1();

      RunLoopSource = (__CFRunLoopSource *)IOMobileFramebufferGetRunLoopSource();
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
      IOMobileFramebufferEnablePowerNotifications();
      -[PLDisplayAgent setFrameBuffer:](self, "setFrameBuffer:", *(_QWORD *)buf);
    }
  }
  v74 = (PLIOKitOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFE8]), "initWithOperator:forService:", self, CFSTR("AppleMultitouchSPI"));
  iokitTouch = self->_iokitTouch;
  self->_iokitTouch = v74;

  if (self->_iokitDisplay || v56[9] || self->_iokitTouch || v26[16])
  {
    self->_userTouch = 0;
    userTouchDownTime = self->_userTouchDownTime;
    self->_userTouchDownTime = 0;

    self->_touchHIDClientRef = -[PLDisplayAgent setUpIOHIDTouchSystemClient](self, "setUpIOHIDTouchSystemClient");
    bluelightStatusEntry = self->_bluelightStatusEntry;
    self->_bluelightStatusEntry = 0;

    bluelightFilterTimer = self->_bluelightFilterTimer;
    self->_bluelightFilterTimer = 0;

    uAmpsFilterTimer = self->_uAmpsFilterTimer;
    self->_uAmpsFilterTimer = 0;

    self->_isMIEActive = 0;
    uAmpsEntry = self->_uAmpsEntry;
    self->_uAmpsEntry = 0;

    self->_firstEntryOnInit = 1;
    goto LABEL_61;
  }

LABEL_2:
  v3 = 0;
LABEL_62:

  return v3;
}

void __22__PLDisplayAgent_init__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D00F58], "sharedBacklight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "backlightState");

  +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("Display"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastEntryForKey:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Active"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLastScreenState:", objc_msgSend(v6, "intValue"));

  objc_msgSend(*(id *)(a1 + 32), "initAODState:", v3);
}

uint64_t __22__PLDisplayAgent_init__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  init_classDebugEnabled_0 = result;
  return result;
}

void __22__PLDisplayAgent_init__block_invoke_989(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  PLEventForwardDisplayEntry *v7;
  void *v8;
  id v9;
  uint64_t v10;
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
  NSObject *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  _QWORD block[5];

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = (id *)(a1 + 32);
  objc_msgSend(v5, "pendingBacklightEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (objc_msgSend(*v4, "isDebugEnabled"))
    {
      v7 = [PLEventForwardDisplayEntry alloc];
      objc_msgSend(*v4, "pendingBacklightEntry");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PLEventForwardDisplayEntry initEntryWithRawData:](v7, "initEntryWithRawData:", v8);

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v10 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __22__PLDisplayAgent_init__block_invoke_2_991;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v10;
        if (kPRearNits_block_invoke_defaultOnce != -1)
          dispatch_once(&kPRearNits_block_invoke_defaultOnce, block);
        if (kPRearNits_block_invoke_classDebugEnabled)
        {
          v11 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Brightness"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)MEMORY[0x1E0D80088];
          objc_msgSend(*v4, "pendingBacklightEntryDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "formattedStringForDate:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("Writing backlight entry:%@ with date: %@"), v12, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "lastPathComponent");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent init]_block_invoke");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 1474);

          PLLogCommon();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }

    }
    PLLogDisplay();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      __22__PLDisplayAgent_init__block_invoke_989_cold_3(v4);

    v23 = *v4;
    objc_msgSend(*v4, "pendingBacklightEntry");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v4, "pendingBacklightEntryDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "logEventForwardDisplayWithRawData:withDate:", v24, v25);

    PLLogDisplay();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      __22__PLDisplayAgent_init__block_invoke_989_cold_2();

    objc_msgSend(*v4, "setPendingBacklightEntry:", 0);
    objc_msgSend(*v4, "setPendingBacklightEntryDate:", 0);
  }
  else
  {
    PLLogDisplay();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      __22__PLDisplayAgent_init__block_invoke_989_cold_1(v4, (uint64_t)v3);

    objc_msgSend(*v4, "backlightFilterTimer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTimerActive:", 0);

  }
}

uint64_t __22__PLDisplayAgent_init__block_invoke_2_991(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPRearNits_block_invoke_classDebugEnabled = result;
  return result;
}

uint64_t __22__PLDisplayAgent_init__block_invoke_999(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  init_classDebugEnabled_998 = result;
  return result;
}

uint64_t __22__PLDisplayAgent_init__block_invoke_1002(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBrightnessClientNotification:withValue:", a2, a3);
}

uint64_t __22__PLDisplayAgent_init__block_invoke_1006(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleAFKInterfaceIOServiceCallback:", a2);
}

void __22__PLDisplayAgent_init__block_invoke_2_1008(uint64_t a1)
{
  id *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;

  v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "currMonoTimestamp");
  v3 = v2;
  objc_msgSend(*v1, "currAFKSystemTimestamp");
  v5 = v4;
  objc_msgSend(*v1, "currMonoTimestamp");
  if (v6 <= 0.0
    || (objc_msgSend(*v1, "currAFKSystemTimestamp"), v7 <= 0.0)
    || (v8 = v3 - v5, objc_msgSend(*v1, "currAFKSystemTimeOffset"), v8 == v9))
  {
    objc_msgSend(*v1, "dcpTimeoffsetCalibTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimerActive:", 0);

    PLLogDisplay();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __22__PLDisplayAgent_init__block_invoke_2_1008_cold_2();

  }
  else
  {
    PLLogDisplay();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __22__PLDisplayAgent_init__block_invoke_2_1008_cold_1(v1, v10, v8);

    objc_msgSend(*v1, "setCurrAFKSystemTimeOffset:", v8);
  }
}

void __22__PLDisplayAgent_init__block_invoke_1011(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  PLEventForwardDisplayEntry *v25;
  void *v26;
  id v27;
  uint64_t v28;
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
  NSObject *v40;
  void *v41;
  char v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  _QWORD v53[5];
  _QWORD block[17];

  if (a3 == -536870608)
  {
    block[15] = v3;
    block[16] = v4;
    objc_msgSend(MEMORY[0x1E0D7FFE8], "snapshotFromIOEntry:forKey:", a2, CFSTR("IODisplayParameters"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[PLDisplayAgent shouldLogFromDCP](PLDisplayAgent, "shouldLogFromDCP");
    v8 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "pendingBacklightEntry");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
LABEL_26:

        return;
      }
      objc_msgSend(v6, "objectForKey:", CFSTR("brightness"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("value"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "longValue");

      objc_msgSend(v10, "objectForKey:", CFSTR("min"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "longValue");

      objc_msgSend(v10, "objectForKey:", CFSTR("max"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "longValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(v12 - v14) * 100.0 / (double)(v16 - v14));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "pendingBacklightEntry");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("Brightness"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "pendingBacklightEntry");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("SliderValue"));

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPendingBacklightEntry:", v21);

      objc_msgSend(*(id *)(a1 + 32), "pendingBacklightEntryDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setPendingBacklightEntryDate:", v23);

      }
      if (objc_msgSend(*(id *)(a1 + 32), "isDebugEnabled"))
      {
        v24 = -[PLEventForwardDisplayEntry initEntryWithRawData:]([PLEventForwardDisplayEntry alloc], "initEntryWithRawData:", v6);
        v25 = [PLEventForwardDisplayEntry alloc];
        objc_msgSend(*(id *)(a1 + 32), "pendingBacklightEntry");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[PLEventForwardDisplayEntry initEntryWithRawData:](v25, "initEntryWithRawData:", v26);

        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v28 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __22__PLDisplayAgent_init__block_invoke_2_1020;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v28;
          if (kPRearNits_block_invoke_2_defaultOnce != -1)
            dispatch_once(&kPRearNits_block_invoke_2_defaultOnce, block);
          if (kPRearNits_block_invoke_2_classDebugEnabled)
          {
            v29 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Brightness"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Brightness"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (void *)MEMORY[0x1E0D80088];
            objc_msgSend(*(id *)(a1 + 32), "pendingBacklightEntryDate");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "formattedStringForDate:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "stringWithFormat:", CFSTR("rawData.brightness=%@ self.pendingBacklightEntry.brightness=%@ self.pendingBacklightEntryDate=%@"), v30, v31, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            v36 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "lastPathComponent");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent init]_block_invoke");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 1556);

            PLLogCommon();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

          }
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "backlightFilterTimer");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "timerActive");

      if ((v42 & 1) != 0)
        goto LABEL_26;
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v43 = objc_opt_class();
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __22__PLDisplayAgent_init__block_invoke_1025;
        v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v53[4] = v43;
        if (kPRearNits_block_invoke_2_defaultOnce_1023 != -1)
          dispatch_once(&kPRearNits_block_invoke_2_defaultOnce_1023, v53);
        if (kPRearNits_block_invoke_2_classDebugEnabled_1024)
        {
          v44 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0D80088], "formattedStringForDate:", v10);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "stringWithFormat:", CFSTR("Start backlight entry filter timer fireDate=%@"), v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          v47 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "lastPathComponent");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent init]_block_invoke_2");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "logMessage:fromFile:fromFunction:fromLineNumber:", v46, v49, v50, 1561);

          PLLogCommon();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "backlightFilterTimer");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setFireDate:", v10);

    }
    goto LABEL_26;
  }
}

uint64_t __22__PLDisplayAgent_init__block_invoke_2_1020(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPRearNits_block_invoke_2_classDebugEnabled = result;
  return result;
}

uint64_t __22__PLDisplayAgent_init__block_invoke_1025(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPRearNits_block_invoke_2_classDebugEnabled_1024 = result;
  return result;
}

void __22__PLDisplayAgent_init__block_invoke_1031(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "getBacklightEnabledTimestamp:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "service"));
  +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("BacklightControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("backlightEnabledTimestamp"));

  v6 = *(void **)(a1 + 32);
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postEntries:", v7);

}

uint64_t __22__PLDisplayAgent_init__block_invoke_2_1034(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  _BOOL8 v5;

  v4 = result;
  switch(a3)
  {
    case -536788734:
      v5 = a4 != 0;
      objc_msgSend(*(id *)(result + 32), "logEventPointDisplayForBlock:isActive:", CFSTR("MIE"), v5);
      return objc_msgSend(*(id *)(v4 + 32), "setIsMIEActive:", v5);
    case -536788735:
      return objc_msgSend(*(id *)(result + 32), "logEventPointDisplayForBlock:isActive:", CFSTR("Backlight"), 0);
    case -536788736:
      objc_msgSend(*(id *)(result + 32), "logEventPointDisplayForBlock:isActive:", CFSTR("Backlight"), 1);
      return objc_msgSend(*(id *)(v4 + 32), "logEventBackwardTouch");
  }
  return result;
}

- (void)initTaskOperatorDependancies
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  if (objc_msgSend(MEMORY[0x1E0D80020], "hasCapability:", 8))
  {
    if (objc_msgSend(MEMORY[0x1E0D80020], "hasDCP"))
    {
      if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
      {
        v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:ifNotSet:", CFSTR("AZLFullMode"), 0);
        if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") || v3)
        {
          v4 = *MEMORY[0x1E0D80378];
          +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("AZLSnapshots"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode")
            || (v6 = (void *)MEMORY[0x1E0D7FFC0],
                -[PLOperator className](self, "className"),
                v7 = (void *)objc_claimAutoreleasedReturnValue(),
                LODWORD(v6) = objc_msgSend(v6, "isEntryKeySetup:forOperatorName:", v5, v7),
                v7,
                (_DWORD)v6))
          {
            +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", v4, CFSTR("AZLSnapshots"));
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLOperator storage](self, "storage");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLDisplayAgent setAZLSnapshotsEntries:](self, "setAZLSnapshotsEntries:", objc_msgSend(v9, "countOfEntriesForKey:", v8));

            v10 = objc_alloc(MEMORY[0x1E0D80070]);
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLOperator workQueue](self, "workQueue");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v14[0] = MEMORY[0x1E0C809B0];
            v14[1] = 3221225472;
            v14[2] = __46__PLDisplayAgent_initTaskOperatorDependancies__block_invoke;
            v14[3] = &unk_1EA16EB78;
            v14[4] = self;
            v13 = (void *)objc_msgSend(v10, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v11, 1, 0, v12, v14, 300.0, 0.0);
            -[PLDisplayAgent setAZLSnapshotsTimer:](self, "setAZLSnapshotsTimer:", v13);

          }
        }
      }
    }
  }
}

uint64_t __46__PLDisplayAgent_initTaskOperatorDependancies__block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;

  if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode")
    || (result = objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:", CFSTR("AZLFullMode")), (_DWORD)result))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode")
      && objc_msgSend(*(id *)(a1 + 32), "AZLSnapshotsEntries") >= 21600)
    {
      PLLogDisplay();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        __46__PLDisplayAgent_initTaskOperatorDependancies__block_invoke_cold_1();

      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "invalidate");
    }
    else
    {
      return objc_msgSend(*(id *)(a1 + 32), "__FrameBufferEventCallback:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512));
    }
  }
  return result;
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
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Initializing AZL Stats", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __42__PLDisplayAgent_initOperatorDependancies__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "logDisplayAPL");
  objc_msgSend(*(id *)(a1 + 32), "updateLastForegroundAppAPL:", v4);

}

uint64_t __42__PLDisplayAgent_initOperatorDependancies__block_invoke_1048(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleSBC");
}

uint64_t __42__PLDisplayAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logDisplayAZL");
}

uint64_t __42__PLDisplayAgent_initOperatorDependancies__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "modelDynamicDisplayPower:", a2);
}

void __42__PLDisplayAgent_initOperatorDependancies__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PLLogDisplay();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __42__PLDisplayAgent_initOperatorDependancies__block_invoke_4_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logAODChange");
}

uint64_t __42__PLDisplayAgent_initOperatorDependancies__block_invoke_1060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "logEventPointMultitouchWithPayload:", a5);
}

uint64_t __42__PLDisplayAgent_initOperatorDependancies__block_invoke_2_1063(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  initOperatorDependancies_classDebugEnabled_1 = result;
  return result;
}

void __42__PLDisplayAgent_initOperatorDependancies__block_invoke_1070(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  _QWORD v32[5];
  _QWORD block[5];

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__PLDisplayAgent_initOperatorDependancies__block_invoke_2_1071;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (kPRearNits_block_invoke_3_defaultOnce != -1)
      dispatch_once(&kPRearNits_block_invoke_3_defaultOnce, block);
    if (kPRearNits_block_invoke_3_classDebugEnabled)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      objc_msgSend(v6, "description");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v8, "stringWithFormat:", CFSTR("Keyboard brightness: %s=%s\n"), v9, objc_msgSend(v10, "UTF8String"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent initOperatorDependancies]_block_invoke");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 1919);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(*(id *)(a1 + 32), "setPendingKeyboardBrightnessValue:");
  objc_msgSend(*(id *)(a1 + 32), "pendingKeyboardBrightnessDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPendingKeyboardBrightnessDate:", v18);

  }
  objc_msgSend(*(id *)(a1 + 32), "keyboardBrightnessFilterTimer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "timerActive");

  if ((v20 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v22 = objc_opt_class();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __42__PLDisplayAgent_initOperatorDependancies__block_invoke_1076;
      v32[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v32[4] = v22;
      if (kPRearNits_block_invoke_3_defaultOnce_1074 != -1)
        dispatch_once(&kPRearNits_block_invoke_3_defaultOnce_1074, v32);
      if (kPRearNits_block_invoke_3_classDebugEnabled_1075)
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0D80088], "formattedStringForDate:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("Start keyboard brightness filter timer fireDate=%@"), v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "lastPathComponent");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent initOperatorDependancies]_block_invoke_2");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 1928);

        PLLogCommon();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "keyboardBrightnessFilterTimer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFireDate:", v21);

  }
}

uint64_t __42__PLDisplayAgent_initOperatorDependancies__block_invoke_2_1071(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPRearNits_block_invoke_3_classDebugEnabled = result;
  return result;
}

uint64_t __42__PLDisplayAgent_initOperatorDependancies__block_invoke_1076(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPRearNits_block_invoke_3_classDebugEnabled_1075 = result;
  return result;
}

void __42__PLDisplayAgent_initOperatorDependancies__block_invoke_1081(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "pendingKeyboardBrightnessDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingKeyboardBrightnessValue");
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "pendingKeyboardBrightnessDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logEventPointKeyboardBrightness:withDate:", v6, v5);

    objc_msgSend(*(id *)(a1 + 32), "setPendingKeyboardBrightnessDate:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "keyboardBrightnessFilterTimer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimerActive:", 0);

  }
}

void __42__PLDisplayAgent_initOperatorDependancies__block_invoke_2_1085(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PLLogDisplay();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __41__PLCameraAgent_initOperatorDependancies__block_invoke_121_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logDisplayAPL");
}

- (void)handleAFKInterfaceIOServiceCallback:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  CFTypeID v8;
  NSObject *v9;
  AFKEndpointInterfacePowerlogDisplay *v10;
  void *v11;
  AFKEndpointInterfacePowerlogDisplay *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  _QWORD v19[5];
  CFMutableDictionaryRef properties;
  uint64_t entryID;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v3 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  entryID = 0;
  IORegistryEntryGetRegistryEntryID(a3, &entryID);
  PLLogDisplay();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v23 = entryID;
    _os_log_impl(&dword_1DA9D6000, v5, OS_LOG_TYPE_DEFAULT, "Registry ID: %llu", buf, 0xCu);
  }

  properties = 0;
  if (IORegistryEntryCreateCFProperties(v3, &properties, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0))
    v6 = 1;
  else
    v6 = properties == 0;
  if (v6)
  {
    PLLogDisplay();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PLDisplayAgent handleAFKInterfaceIOServiceCallback:].cold.1();
  }
  else
  {
    v8 = CFGetTypeID(properties);
    if (v8 == CFDictionaryGetTypeID())
    {
      v7 = properties;
      PLLogDisplay();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = (uint64_t)v7;
        _os_log_impl(&dword_1DA9D6000, v9, OS_LOG_TYPE_DEFAULT, "IO object property: %@", buf, 0xCu);
      }

      v10 = [AFKEndpointInterfacePowerlogDisplay alloc];
      -[PLDisplayAgent iokitBacklightDCP](self, "iokitBacklightDCP");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[AFKEndpointInterfacePowerlogDisplay initWithService:andIOKitComposition:](v10, "initWithService:andIOKitComposition:", v3, v11);

      if (v12)
      {
        -[PLDisplayAgent afkEndpoints](self, "afkEndpoints");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v12);

        -[PLOperator workQueue](self, "workQueue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFKEndpointInterface setDispatchQueue:](v12, "setDispatchQueue:", v14);

        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke;
        v19[3] = &unk_1EA170AC0;
        v19[4] = self;
        -[AFKEndpointInterface setReportHandler:](v12, "setReportHandler:", v19);
        -[AFKEndpointInterface activate](v12, "activate");
        PLLogDisplay();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DA9D6000, v15, OS_LOG_TYPE_DEFAULT, "AFKInterface activated", buf, 2u);
        }

        -[PLDisplayAgent afkEndpoints](self, "afkEndpoints");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v17 >= 2)
          -[PLDisplayAgent cleanUpAFKInterfaces](self, "cleanUpAFKInterfaces");
      }
      else
      {
        PLLogDisplay();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[PLDisplayAgent handleAFKInterfaceIOServiceCallback:].cold.2();

      }
    }
    else
    {
      PLLogDisplay();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[PLDisplayAgent handleAFKInterfaceIOServiceCallback:].cold.3();
    }
  }

}

void __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, size_t a6)
{
  NSObject *v9;
  NSObject *v10;
  CFStringRef v11;
  __CFString *v12;
  NSObject *v13;
  CFTypeID v14;
  CFTypeID TypeID;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  CFStringRef errorString;

  PLLogDisplay();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_6();

  if (a5 && a6)
  {
    errorString = 0;
    v10 = IOCFUnserializeWithSize(a5, a6, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &errorString);
    v11 = errorString;
    v12 = (id)errorString;
    v13 = v12;
    if (v11)
    {

    }
    else if (v10)
    {
      v14 = CFGetTypeID(v10);
      TypeID = CFDictionaryGetTypeID();
      PLLogDisplay();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v14 == TypeID)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_3();

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "fillInBuiltinDisplayBrightnessParameters:", v18);
        PLLogDisplay();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_2();

        objc_msgSend(*(id *)(a1 + 32), "handleAFKInterfaceMsg:", v18);
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_4();
        v10 = v17;
      }
      goto LABEL_9;
    }
    PLLogDisplay();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_1();
LABEL_9:

    goto LABEL_12;
  }
  PLLogDisplay();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_5();
LABEL_12:

}

- (void)fillInBuiltinDisplayBrightnessParameters:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  NSObject *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;

  -[PLDisplayAgent lastBuiltinDisplayTime](self, "lastBuiltinDisplayTime");
  v9 = v8;
  -[PLDisplayAgent lastBuiltinDisplayTime](self, "lastBuiltinDisplayTime");
  if (v10 > 0.0)
  {
    v10 = v7 - v9;
    if (v7 - v9 > 0.0 && v10 < 0.6)
    {
      v11 = (void *)MEMORY[0x1E0CB37E8];
      -[PLDisplayAgent lastBuiltinDisplayLux](self, "lastBuiltinDisplayLux");
      objc_msgSend(v11, "numberWithDouble:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("lux"));

      -[PLDisplayAgent lastBuiltinDisplayBrightness](self, "lastBuiltinDisplayBrightness");
      if (v13 >= 0.0)
      {
        v14 = (void *)MEMORY[0x1E0CB37E8];
        -[PLDisplayAgent lastBuiltinDisplayBrightness](self, "lastBuiltinDisplayBrightness");
        objc_msgSend(v14, "numberWithDouble:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("Brightness"));

      }
      -[PLDisplayAgent lastBuiltinDisplaySliderValue](self, "lastBuiltinDisplaySliderValue");
      if (v16 >= 0.0)
      {
        v17 = (void *)MEMORY[0x1E0CB37E8];
        -[PLDisplayAgent lastBuiltinDisplaySliderValue](self, "lastBuiltinDisplaySliderValue");
        objc_msgSend(v17, "numberWithDouble:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("SliderValue"));

      }
      goto LABEL_23;
    }
  }
  -[PLDisplayAgent brightnessSystemClient](self, "brightnessSystemClient", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copyPropertyForKey:", CFSTR("TrustedLux"));
  objc_msgSend(v20, "doubleValue");
  -[PLDisplayAgent setLastBuiltinDisplayLux:](self, "setLastBuiltinDisplayLux:");

  -[PLDisplayAgent brightnessSystemClient](self, "brightnessSystemClient");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copyPropertyForKey:", CFSTR("DisplayBrightnessMin"));
  objc_msgSend(v22, "doubleValue");
  v24 = v23;

  -[PLDisplayAgent brightnessSystemClient](self, "brightnessSystemClient");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copyPropertyForKey:", CFSTR("DisplayBrightnessMax"));
  objc_msgSend(v26, "doubleValue");
  v28 = v27;

  -[PLDisplayAgent brightnessSystemClient](self, "brightnessSystemClient");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copyPropertyForKey:", CFSTR("DisplayBrightness"));

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v30, "doubleValue");
    v32 = v31;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_15:
      -[PLDisplayAgent setLastBuiltinDisplayBrightness:](self, "setLastBuiltinDisplayBrightness:", -1.0);
      -[PLDisplayAgent setLastBuiltinDisplaySliderValue:](self, "setLastBuiltinDisplaySliderValue:", -1.0);
      PLLogDisplay();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v44 = 138412290;
        v45 = v30;
        _os_log_impl(&dword_1DA9D6000, v35, OS_LOG_TYPE_DEFAULT, "Not logging brightness value: %@", (uint8_t *)&v44, 0xCu);
      }

      goto LABEL_18;
    }
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("Brightness"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "doubleValue");
    v32 = v34;

  }
  if (v32 < 0.0 || v28 - v24 <= 0.0)
    goto LABEL_15;
  -[PLDisplayAgent setLastBuiltinDisplayBrightness:](self, "setLastBuiltinDisplayBrightness:", (v32 - v24) * 100.0 / (v28 - v24));
  -[PLDisplayAgent setLastBuiltinDisplaySliderValue:](self, "setLastBuiltinDisplaySliderValue:", v32);
LABEL_18:
  -[PLDisplayAgent setLastBuiltinDisplayTime:](self, "setLastBuiltinDisplayTime:", v7);
  v36 = (void *)MEMORY[0x1E0CB37E8];
  -[PLDisplayAgent lastBuiltinDisplayLux](self, "lastBuiltinDisplayLux");
  objc_msgSend(v36, "numberWithDouble:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v37, CFSTR("lux"));

  -[PLDisplayAgent lastBuiltinDisplayBrightness](self, "lastBuiltinDisplayBrightness");
  if (v38 >= 0.0)
  {
    v39 = (void *)MEMORY[0x1E0CB37E8];
    -[PLDisplayAgent lastBuiltinDisplayBrightness](self, "lastBuiltinDisplayBrightness");
    objc_msgSend(v39, "numberWithDouble:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, CFSTR("Brightness"));

  }
  -[PLDisplayAgent lastBuiltinDisplaySliderValue](self, "lastBuiltinDisplaySliderValue");
  if (v41 >= 0.0)
  {
    v42 = (void *)MEMORY[0x1E0CB37E8];
    -[PLDisplayAgent lastBuiltinDisplaySliderValue](self, "lastBuiltinDisplaySliderValue");
    objc_msgSend(v42, "numberWithDouble:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v43, CFSTR("SliderValue"));

  }
LABEL_23:

}

- (void)cleanUpAFKInterfaces
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PLDisplayAgent afkEndpoints](self, "afkEndpoints", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "valid") & 1) == 0)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[PLDisplayAgent afkEndpoints](self, "afkEndpoints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectsInArray:", v3);

}

- (void)handleAFKInterfaceMsg:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  unint64_t v32;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  -[PLDisplayAgent currAFKSystemTimeOffset](self, "currAFKSystemTimeOffset");
  if (v8 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99D68];
    -[PLDisplayAgent currAFKSystemTimeOffset](self, "currAFKSystemTimeOffset");
    objc_msgSend(v9, "dateWithTimeIntervalSince1970:", v7 / 1000000.0 + v10);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDisplayAgent pendingBacklightEntry](self, "pendingBacklightEntry");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PLDisplayAgent pendingBacklightEntryDate](self, "pendingBacklightEntryDate");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[PLDisplayAgent pendingBacklightEntryDate](self, "pendingBacklightEntryDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", v16);
      v18 = v17;

      if (v18 < 1.0)
        goto LABEL_9;
      -[PLDisplayAgent pendingBacklightEntry](self, "pendingBacklightEntry");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDisplayAgent pendingBacklightEntryDate](self, "pendingBacklightEntryDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDisplayAgent logEventForwardDisplayWithRawData:withDate:](self, "logEventForwardDisplayWithRawData:withDate:", v13, v19);

    }
  }
LABEL_9:
  -[PLDisplayAgent setPendingBacklightEntry:](self, "setPendingBacklightEntry:", v4);
  -[PLDisplayAgent setPendingBacklightEntryDate:](self, "setPendingBacklightEntryDate:", v11);
  -[PLDisplayAgent backlightFilterTimer](self, "backlightFilterTimer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "timerActive");

  if ((v21 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDisplayAgent backlightFilterTimer](self, "backlightFilterTimer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFireDate:", v22);

  }
  -[PLDisplayAgent dcpTimeoffsetCalibTimer](self, "dcpTimeoffsetCalibTimer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "timerActive");

  if ((v25 & 1) == 0)
  {
    v31 = 0;
    v32 = 0;
    +[PLUtilities getCurrentMonotonicAndMachAbsTime:machAbsTime:machContTime:](PLUtilities, "getCurrentMonotonicAndMachAbsTime:machAbsTime:machContTime:", &v31, 0, &v32);
    v26 = v31;
    -[PLDisplayAgent setCurrAFKSystemTimestamp:](self, "setCurrAFKSystemTimestamp:", (double)v32 / 1000000000.0);
    objc_msgSend(v26, "timeIntervalSince1970");
    v28 = v27;

    -[PLDisplayAgent setCurrMonoTimestamp:](self, "setCurrMonoTimestamp:", v28);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 10.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDisplayAgent dcpTimeoffsetCalibTimer](self, "dcpTimeoffsetCalibTimer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFireDate:", v29);

  }
}

- (void)logEventPointMultitouchWithPayload:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PLDisplayAgent *v25;
  void *v26;
  id obj;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v25 = self;
  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("Multitouch"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v26 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("events"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v32;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v7);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v30, v29);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("fingerNum"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("fingerNum"));

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("touchStartTime"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("touchStartTime"));

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("touchStopTime"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("touchStopTime"));

        if (objc_msgSend(MEMORY[0x1E0D80020], "hasOrb"))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("peakForce"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("peak"));

          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("peakForceMillimetersFromEdge"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("peakMillimetersFromEdge"));

          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("peakForceProximity"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("peakProximity"));

          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("peakForceMajorRadius"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("peakMajorRadius"));

          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("peakForceMinorRadius"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v9;
          v19 = v17;
          v20 = CFSTR("peakMinorRadius");
        }
        else
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("peakProximity"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("peakProximity"));

          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("peakProximityMillimetersFromEdge"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, CFSTR("peakProximityMillimetersFromEdge"));

          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("peakProximityMajorRadius"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, CFSTR("peakProximityMajorRadius"));

          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("peakProximityMinorRadius"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v9;
          v19 = v17;
          v20 = CFSTR("peakProximityMinorRadius");
        }
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, v20, v25);

        objc_msgSend(v28, "addObject:", v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v5);
  }

  v35 = v30;
  v36 = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator logEntries:withGroupID:](v25, "logEntries:withGroupID:", v24, v30);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (+[PLDisplayAgent shouldLogFromDCP](PLDisplayAgent, "shouldLogFromDCP")
    && -[PLDisplayAgent frameBuffer](self, "frameBuffer"))
  {
    -[PLDisplayAgent frameBuffer](self, "frameBuffer");
    IOMobileFramebufferDisablePowerNotifications();
    CFRelease(-[PLDisplayAgent frameBuffer](self, "frameBuffer"));
  }
  if (self->_ambientLightSensorHIDClientRef)
  {
    IOHIDEventSystemClientUnregisterEventCallback();
    if (self->_alsPluginKeyRegistered)
      IOHIDEventSystemClientUnregisterDeviceMatchingCallback();
  }
  if (_os_feature_enabled_impl() && objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
  {
    objc_msgSend(MEMORY[0x1E0D00F58], "sharedBacklight");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

  }
  v4.receiver = self;
  v4.super_class = (Class)PLDisplayAgent;
  -[PLAgent dealloc](&v4, sel_dealloc);
}

- (BOOL)isAlsEnabled
{
  char v2;
  void *v3;
  void *v4;

  v2 = 1;
  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("BKEnableALS"), CFSTR("com.apple.backboardd"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v2 = objc_msgSend(v3, "BOOLValue");

  return v2;
}

- (int64_t)getBuiltInDisplayID:(id)a3
{
  return 0;
}

- (void)log
{
  -[PLDisplayAgent logEventForwardDisplay](self, "logEventForwardDisplay");
  -[PLDisplayAgent logEventPointDisplay](self, "logEventPointDisplay");
  -[PLDisplayAgent logEventForwardALSEnabled](self, "logEventForwardALSEnabled");
  -[PLDisplayAgent logEventForwardALSUserPreferences](self, "logEventForwardALSUserPreferences");
  -[PLDisplayAgent logEventForwardColorAdaptationMode](self, "logEventForwardColorAdaptationMode");
}

- (void)logEventNonePanelStats
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PLDisplayAgent brightnessSystemClient](self, "brightnessSystemClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_msgSend(MEMORY[0x1E0D80020], "isMac") & 1) == 0)
  {
    -[PLDisplayAgent brightnessSystemClient](self, "brightnessSystemClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v4, "copyPropertyForKey:", CFSTR("BrightnessGlobalScalar"));

    if (v7)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("PanelStats"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v5, v7);
        -[PLOperator logEntry:](self, "logEntry:", v6);

      }
    }

  }
}

- (void)logDisplayEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("DisplayMetrics"), CFSTR("DisplayState"), v5, v6);

  objc_msgSend(v4, "dictionary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("DisplayMetrics"), CFSTR("DisplayStateExtended"), v8, v7);
}

- (void)logEventPointDisplay
{
  -[PLDisplayAgent logEventPointDisplayBacklight](self, "logEventPointDisplayBacklight");
  -[PLDisplayAgent logEventPointDisplayMIE](self, "logEventPointDisplayMIE");
}

- (void)logEventPointDisplayBacklight
{
  void *v3;
  void *v4;
  id v5;

  if (!+[PLDisplayAgent shouldLogFromDCP](PLDisplayAgent, "shouldLogFromDCP"))
  {
    if (self->_iokitBacklight)
    {
      -[PLDisplayAgent iokitBacklight](self, "iokitBacklight");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "propertiesForKey:", CFSTR("IOPowerManagement"));
      v5 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CurrentPowerState"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDisplayAgent logEventPointDisplayForBlock:isActive:](self, "logEventPointDisplayForBlock:isActive:", CFSTR("Backlight"), objc_msgSend(v4, "BOOLValue"));

    }
  }
}

- (void)logEventPointDisplayMIE
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!+[PLDisplayAgent shouldLogFromDCP](PLDisplayAgent, "shouldLogFromDCP") && self->_iokitDisplay)
  {
    -[PLDisplayAgent iokitDisplay](self, "iokitDisplay");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "propertiesForKey:", CFSTR("IOMFB Debug Info"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MIE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MIE"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("enabled"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDisplayAgent logEventPointDisplayForBlock:isActive:](self, "logEventPointDisplayForBlock:isActive:", CFSTR("MIE"), objc_msgSend(v6, "BOOLValue"));

    }
  }
}

- (void)logEventPointDisplayBacklightWithState:(unint64_t)a3
{
  NSObject *v5;

  PLLogDisplay();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PLDisplayAgent logEventPointDisplayBacklightWithState:].cold.1();

  -[PLDisplayAgent logEventPointDisplayForBlock:isActive:](self, "logEventPointDisplayForBlock:isActive:", CFSTR("Backlight"), a3 != 0);
}

- (void)logEventPointDisplayForBlock:(id)a3 isActive:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
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
  _QWORD block[5];
  _QWORD v24[3];

  v4 = *(_QWORD *)&a4;
  v24[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (+[PLDisplayAgent shouldLogDisplay](PLDisplayAgent, "shouldLogDisplay")
    || +[PLDisplayAgent shouldLogLCD](PLDisplayAgent, "shouldLogLCD"))
  {
    +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("Display"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator storage](self, "storage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastEntryForKey:withSubEntryKey:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Active"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "intValue") == (_DWORD)v4)
    {
      v11 = -[PLDisplayAgent firstEntryOnInit](self, "firstEntryOnInit");

      if (!v11)
      {
        if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          goto LABEL_17;
        v12 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __56__PLDisplayAgent_logEventPointDisplayForBlock_isActive___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v12;
        if (logEventPointDisplayForBlock_isActive__defaultOnce != -1)
          dispatch_once(&logEventPointDisplayForBlock_isActive__defaultOnce, block);
        if (!logEventPointDisplayForBlock_isActive__classDebugEnabled)
          goto LABEL_17;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("filtering block %@ isActive %d due to lastEntry %@"), v6, v4, v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent logEventPointDisplayForBlock:isActive:]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 2534);

        PLLogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

LABEL_16:
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {

    }
    -[PLDisplayAgent setFirstEntryOnInit:](self, "setFirstEntryOnInit:", 0);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v7);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, CFSTR("Block"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("Active"));

    -[PLOperator logEntry:](self, "logEntry:", v13);
    -[PLDisplayAgent logDisplayEntry:](self, "logDisplayEntry:", v13);
    if (objc_msgSend(MEMORY[0x1E0D80020], "hasCapability:", 3))
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v20;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableArray addObject:](self->_displayStateChanges, "addObject:", v22);
    }
    -[PLDisplayAgent logDisplayAPL](self, "logDisplayAPL");
    goto LABEL_16;
  }
LABEL_18:

}

uint64_t __56__PLDisplayAgent_logEventPointDisplayForBlock_isActive___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointDisplayForBlock_isActive__classDebugEnabled = result;
  return result;
}

- (void)initAODState:(int64_t)a3
{
  NSObject *v5;

  PLLogDisplay();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PLDisplayAgent initAODState:].cold.1();

  if ((unint64_t)a3 <= 3)
    -[PLDisplayAgent logAODState:](self, "logAODState:", dword_1DABA2020[a3]);
}

- (void)logAODState:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v3 = *(_QWORD *)&a3;
  if (objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
  {
    PLLogDisplay();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PLDisplayAgent logAODState:].cold.2(v3, v5, v6);

    +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("Display"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[PLDisplayAgent lastScreenState](self, "lastScreenState")
      || -[PLDisplayAgent lastScreenState](self, "lastScreenState") != (_DWORD)v3)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v7);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("Active"));

      objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Backlight"), CFSTR("Block"));
      -[PLDisplayAgent setLastScreenState:](self, "setLastScreenState:", v3);
      PLLogDisplay();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLDisplayAgent logAODState:].cold.1();

      -[PLOperator logEntry:](self, "logEntry:", v8);
      -[PLDisplayAgent logDisplayEntry:](self, "logDisplayEntry:", v8);

    }
  }
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  _QWORD v7[6];

  if (_os_feature_enabled_impl())
  {
    if (objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __62__PLDisplayAgent_backlight_didCompleteUpdateToState_forEvent___block_invoke;
      v7[3] = &unk_1EA16D9E8;
      v7[4] = self;
      v7[5] = a4;
      dispatch_async(MEMORY[0x1E0C80D38], v7);
    }
  }
}

void __62__PLDisplayAgent_backlight_didCompleteUpdateToState_forEvent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  PLLogDisplay();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __62__PLDisplayAgent_backlight_didCompleteUpdateToState_forEvent___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  switch(*(_QWORD *)(a1 + 40))
  {
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "logAODState:", 0);
      if (_os_feature_enabled_impl())
        objc_msgSend(*(id *)(a1 + 32), "clearDisplayAccountingEvents");
      break;
    case 1:
      v9 = *(void **)(a1 + 32);
      v10 = 2;
      goto LABEL_8;
    case 2:
    case 3:
      v9 = *(void **)(a1 + 32);
      v10 = 1;
LABEL_8:
      objc_msgSend(v9, "logAODState:", v10);
      break;
    default:
      return;
  }
}

- (void)clearDisplayAccountingEvents
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, MEMORY[0x1E0C9AA70], v4);

  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 2, MEMORY[0x1E0C9AA60], v4);

}

- (void)logEventPointUserBrightnessCommitted:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  if (+[PLDisplayAgent shouldLogUserBrightness](PLDisplayAgent, "shouldLogUserBrightness"))
  {
    +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("UserBrightness"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v7);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("UserBrightness"));

    -[PLOperator logEntry:](self, "logEntry:", v5);
  }
}

- (void)logEventPointKeyboardBrightness:(double)a3
{
  -[PLDisplayAgent logEventPointKeyboardBrightness:withDate:](self, "logEventPointKeyboardBrightness:withDate:", 0, a3);
}

- (void)logEventPointKeyboardBrightness:(double)a3 withDate:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  if (+[PLDisplayAgent shouldLogKeyboardBrightness](PLDisplayAgent, "shouldLogKeyboardBrightness"))
  {
    +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("KeyboardBrightness"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v6);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)(a3 * 100.0));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("KeyboardBrightness"));

    if (v9)
      objc_msgSend(v7, "setEntryDate:", v9);
    -[PLOperator logEntry:](self, "logEntry:", v7);

  }
}

- (void)logEventForwardALSLux:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__PLDisplayAgent_logEventForwardALSLux___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (logEventForwardALSLux__defaultOnce != -1)
      dispatch_once(&logEventForwardALSLux__defaultOnce, block);
    if (logEventForwardALSLux__classDebugEnabled)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Got event ALSLux:%llu at %@\n"), a3, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent logEventForwardALSLux:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 2674);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  -[PLDisplayAgent setPendingALSLux:](self, "setPendingALSLux:", a3);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDisplayAgent setPendingALSLuxEntryDate:](self, "setPendingALSLuxEntryDate:", v14);

  -[PLDisplayAgent alsLuxFilterTimer](self, "alsLuxFilterTimer");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[PLDisplayAgent alsLuxFilterTimer](self, "alsLuxFilterTimer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "timerActive");

    if ((v18 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 10.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v20 = objc_opt_class();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __40__PLDisplayAgent_logEventForwardALSLux___block_invoke_1130;
        v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v30[4] = v20;
        if (logEventForwardALSLux__defaultOnce_1128 != -1)
          dispatch_once(&logEventForwardALSLux__defaultOnce_1128, v30);
        if (logEventForwardALSLux__classDebugEnabled_1129)
        {
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0D80088], "formattedStringForDate:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringWithFormat:", CFSTR("Start ALSLux entry filter timer fireDate=%@"), v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "lastPathComponent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent logEventForwardALSLux:]");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 2695);

          PLLogCommon();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      -[PLDisplayAgent alsLuxFilterTimer](self, "alsLuxFilterTimer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setFireDate:", v19);

    }
  }
}

uint64_t __40__PLDisplayAgent_logEventForwardALSLux___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventForwardALSLux__classDebugEnabled = result;
  return result;
}

uint64_t __40__PLDisplayAgent_logEventForwardALSLux___block_invoke_1130(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventForwardALSLux__classDebugEnabled_1129 = result;
  return result;
}

- (unint64_t)getBacklightEnabledTimestamp:(unsigned int)a3
{
  const __CFNumber *v3;
  const __CFNumber *v4;
  unint64_t valuePtr;

  v3 = (const __CFNumber *)IORegistryEntrySearchCFProperty(a3, "IOService", CFSTR("displayOnTimestamp"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1u);
  if (!v3)
    return mach_absolute_time();
  v4 = v3;
  valuePtr = 0;
  CFNumberGetValue(v3, kCFNumberSInt64Type, &valuePtr);
  CFRelease(v4);
  return valuePtr;
}

- (void)logEventForwardDisplay
{
  void *v3;
  void *v4;
  id v5;

  if (!+[PLDisplayAgent shouldLogFromDCP](PLDisplayAgent, "shouldLogFromDCP"))
  {
    if (self->_iokitBacklight)
    {
      -[PLDisplayAgent iokitBacklight](self, "iokitBacklight");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "propertiesForKey:", CFSTR("IODisplayParameters"));
      v5 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDisplayAgent logEventForwardDisplayWithRawData:withDate:](self, "logEventForwardDisplayWithRawData:withDate:", v5, v4);

    }
  }
}

- (void)logEventForwardDisplayBacklight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    -[PLDisplayAgent iokitBacklight](self, "iokitBacklight");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PLDisplayAgent iokitBacklight](self, "iokitBacklight");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "propertiesForKey:", CFSTR("IODisplayParameters"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("brightness"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("value"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BrightnessMicroAmps"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("value"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      if (v9 <= 0.0)
      {
        v15 = &unk_1EA1C1550;
      }
      else
      {
        v14 = (void *)MEMORY[0x1E0CB37E8];
        -[PLDisplayAgent uAmpsToDisplayPower:](self, "uAmpsToDisplayPower:", v13);
        objc_msgSend(v14, "numberWithDouble:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v15 = 0;
    }
    +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("DisplayBacklight"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v16);
    v18 = v17;
    if (v15)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("DisplayPower"));
    v20[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator postEntries:](self, "postEntries:", v19);

  }
}

- (void)logEventForwardDisplayWithRawData:(id)a3 withDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  NSObject *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  id v34;
  id location;

  v6 = a3;
  v7 = a4;
  -[PLDisplayAgent brightnessSystemClient](self, "brightnessSystemClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = -[PLEventForwardDisplayEntry initEntryWithRawData:]([PLEventForwardDisplayEntry alloc], "initEntryWithRawData:", v6);
    objc_msgSend(v9, "setEntryDate:", v7);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lux"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Brightness"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      if (v13 <= 0.0)
      {
        v10 = &unk_1EA1C1550;
      }
      else
      {
        -[PLDisplayAgent brightnessSystemClient](self, "brightnessSystemClient");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v14, "copyPropertyForKey:", CFSTR("TrustedLux"));

      }
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("lux"));
      PLLogDisplay();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[PLDisplayAgent logEventForwardDisplayWithRawData:withDate:].cold.2(v9, v15);

    }
    objc_msgSend(v10, "doubleValue");
    self->_displayLux = v16;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("mNits"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("mNits"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      -[PLDisplayAgent setDisplaymNits:](self, "setDisplaymNits:");

    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Brightness"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Brightness"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      v22 = v21;

      -[PLDisplayAgent setIsDisplayOnNow:](self, "setIsDisplayOnNow:", v22 > 0.0);
    }
    if (-[PLDisplayAgent isMIEActive](self, "isMIEActive"))
    {
      -[PLDisplayAgent uAmpsFilterTimer](self, "uAmpsFilterTimer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        objc_initWeak(&location, self);
        v24 = objc_alloc(MEMORY[0x1E0D80070]);
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 60.0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLOperator workQueue](self, "workQueue");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = MEMORY[0x1E0C809B0];
        v31 = 3221225472;
        v32 = __61__PLDisplayAgent_logEventForwardDisplayWithRawData_withDate___block_invoke;
        v33 = &unk_1EA170AE8;
        objc_copyWeak(&v34, &location);
        v27 = (void *)objc_msgSend(v24, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v25, 0, 0, v26, &v30, 0.0, 0.0);
        -[PLDisplayAgent setUAmpsFilterTimer:](self, "setUAmpsFilterTimer:", v27, v30, v31, v32, v33);

        -[PLDisplayAgent uAmpsFilterTimer](self, "uAmpsFilterTimer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "arm");

        objc_destroyWeak(&v34);
        objc_destroyWeak(&location);
      }
      -[PLDisplayAgent setUAmpsEntry:](self, "setUAmpsEntry:", v9);
    }
    else
    {
      PLLogDisplay();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[PLDisplayAgent logEventForwardDisplayWithRawData:withDate:].cold.1();

      -[PLOperator logEntry:](self, "logEntry:", v9);
      -[PLDisplayAgent modelDisplayPower:](self, "modelDisplayPower:", v9);
      -[PLDisplayAgent qualifyDisplayPower:](self, "qualifyDisplayPower:", v9);
    }

  }
}

void __61__PLDisplayAgent_logEventForwardDisplayWithRawData_withDate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reArmUAmpsCallback");

}

- (void)reArmUAmpsCallback
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLDisplayAgent uAmpsEntry](self, "uAmpsEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator logEntry:](self, "logEntry:", v3);

  -[PLDisplayAgent uAmpsEntry](self, "uAmpsEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDisplayAgent modelDisplayPower:](self, "modelDisplayPower:", v4);

  -[PLDisplayAgent uAmpsEntry](self, "uAmpsEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDisplayAgent qualifyDisplayPower:](self, "qualifyDisplayPower:", v5);

  -[PLDisplayAgent uAmpsFilterTimer](self, "uAmpsFilterTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[PLDisplayAgent setUAmpsFilterTimer:](self, "setUAmpsFilterTimer:", 0);
  -[PLDisplayAgent setUAmpsEntry:](self, "setUAmpsEntry:", 0);
}

- (void)logEventForwardALSUserPreferences
{
  -[PLDisplayAgent logEventForwardALSUserPreferencesEntryWithLux:](self, "logEventForwardALSUserPreferencesEntryWithLux:", 0);
}

- (void)logEventForwardColorAdaptationMode
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[PLDisplayAgent colorAdaptationClient](self, "colorAdaptationClient");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_msgSend(MEMORY[0x1E0D15718], "supportsAdaptation");

    if (v5)
    {
      +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("CAModeEnabled"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
      -[PLDisplayAgent colorAdaptationClient](self, "colorAdaptationClient");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "getEnabled");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("CAModeEnabled"));

      -[PLOperator logEntry:](self, "logEntry:", v6);
    }
  }
}

- (void)logEventForwardALSUserPreferencesEntryWithLux:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[PLDisplayAgent brightnessSystemClient](self, "brightnessSystemClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(MEMORY[0x1E0D80020], "isMac") & 1) == 0)
  {
    -[PLDisplayAgent brightnessSystemClient](self, "brightnessSystemClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copyPropertyForKey:", CFSTR("ALSUserPreference"));

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 != v7)
      {
        +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ALSUserPreferences"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v8, v6);
        v10 = v9;
        if (v13)
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("Lux"));
        objc_msgSend(v6, "objectForKey:", CFSTR("Prefs"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("thirdSlope"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("thirdSlope"));

        -[PLOperator logEntry:](self, "logEntry:", v10);
      }
    }

  }
}

- (void)logEventForwardExtendedALSUserPreferences:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
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
  float v24;
  void *v25;
  void *v26;
  void *v27;
  float v28;
  void *v29;
  void *v30;
  void *v31;
  float v32;
  void *v33;
  void *v34;
  void *v35;
  float v36;
  void *v37;
  void *v38;
  void *v39;
  float v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  float v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  float v54;
  void *v55;
  void *v56;
  void *v57;
  float v58;
  void *v59;
  void *v60;
  void *v61;
  float v62;
  void *v63;
  void *v64;
  void *v65;
  float v66;
  void *v67;
  void *v68;
  void *v69;
  float v70;
  void *v71;
  void *v72;
  void *v73;
  float v74;
  void *v75;
  void *v76;
  void *v77;
  float v78;
  void *v79;
  id v80;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", v4, CFSTR("ALSUserPreferences"));
  v80 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v80, v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertFromSystemToMonotonic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEntryDate:", v11);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("e0a"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("E0a"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("e0b"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("E0b"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("e0b"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("E0b"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("e1"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("E1"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("e2"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("E2"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("l0a"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("L0a"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("l0b"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("L0b"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("l1"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("L1"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("l2"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("L2"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("slider"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("S"));

  v22 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("frontLux"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  objc_msgSend(v22, "numberWithDouble:", roundf(v24));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, CFSTR("Lux"));

  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rearLux"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "floatValue");
  objc_msgSend(v26, "numberWithDouble:", roundf(v28));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v29, CFSTR("rearLux"));

  v30 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trustedLux"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "floatValue");
  objc_msgSend(v30, "numberWithDouble:", roundf(v32));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, CFSTR("trustedLux"));

  v34 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("delayedAPCE"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "floatValue");
  objc_msgSend(v34, "numberWithDouble:", roundf(v36 * 100.0));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, CFSTR("delayedAPCE"));

  v38 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ecoModeFactor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "floatValue");
  objc_msgSend(v38, "numberWithDouble:", roundf(v40 * 100.0));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v41, CFSTR("ecoModeFactor"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("aabParamsUpdateReason"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v42, CFSTR("aabParamsUpdateReason"));

  v43 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("inactiveLength"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "floatValue");
  objc_msgSend(v43, "numberWithDouble:", roundf(v45 * 100.0));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v46, CFSTR("inactiveLength"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("inactiveStart"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v47, CFSTR("inactiveStart"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alternativeE0a"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v48, CFSTR("alternativeE0a"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alternativeE0b"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v49, CFSTR("alternativeE0b"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alternativeE1"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v50, CFSTR("alternativeE1"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alternativeE2"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v51, CFSTR("alternativeE2"));

  v52 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alternativeL0a"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "floatValue");
  objc_msgSend(v52, "numberWithDouble:", roundf(v54 * 100.0));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v55, CFSTR("alternativeL0a"));

  v56 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alternativeL0b"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "floatValue");
  objc_msgSend(v56, "numberWithDouble:", roundf(v58 * 100.0));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v59, CFSTR("alternativeL0b"));

  v60 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alternativeL1"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "floatValue");
  objc_msgSend(v60, "numberWithDouble:", roundf(v62 * 100.0));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v63, CFSTR("alternativeL1"));

  v64 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alternativeL2"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "floatValue");
  objc_msgSend(v64, "numberWithDouble:", roundf(v66 * 100.0));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v67, CFSTR("alternativeL2"));

  v68 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alternativeThirdSlope"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "floatValue");
  objc_msgSend(v68, "numberWithDouble:", roundf(v70 * 10000.0));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v71, CFSTR("alternativeThirdSlope"));

  v72 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("nitsDelta"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "floatValue");
  objc_msgSend(v72, "numberWithDouble:", roundf(v74 * 100.0));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v75, CFSTR("nitsDelta"));

  v76 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("nitsDeltaAlternative"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v77, "floatValue");
  objc_msgSend(v76, "numberWithDouble:", roundf(v78 * 100.0));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v79, CFSTR("nitsDeltaAlternative"));

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardALSEnabled
{
  void *v3;
  void *v4;
  id v5;

  +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ALSEnabled"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLDisplayAgent alsOn](self, "alsOn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ALSEnabled"));

  -[PLOperator logEntry:](self, "logEntry:", v3);
}

- (void)logEventForwardALSUserPreferencesWithCurrLux
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[PLDisplayAgent brightnessSystemClient](self, "brightnessSystemClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLOperator workQueue](self, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__PLDisplayAgent_logEventForwardALSUserPreferencesWithCurrLux__block_invoke;
    block[3] = &unk_1EA16D040;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

void __62__PLDisplayAgent_logEventForwardALSUserPreferencesWithCurrLux__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "brightnessSystemClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "copyPropertyForKey:", CFSTR("TrustedLux"));

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardALSUserPreferencesEntryWithLux:", v3);
}

- (void)logEventForwardLuxStats:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  void *v16;

  v4 = a3;
  if (v4)
  {
    +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("LuxStats"));
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("rearLux"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    if (objc_msgSend(MEMORY[0x1E0D80020], "isiPhone"))
    {
      if ((int)objc_msgSend(MEMORY[0x1E0D80020], "kPLSoCClassOfDevice") >= 1001021)
      {
        objc_msgSend(v4, "valueForKey:", CFSTR("gainChanged"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "BOOLValue");

        if (v9)
        {
          PLLogDisplay();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            -[PLDisplayAgent logEventForwardLuxStats:].cold.2();

          goto LABEL_20;
        }
      }
    }
    if (-[PLDisplayAgent lastRearLuxValue](self, "lastRearLuxValue") != v7)
    {
      if (-[PLDisplayAgent lastRearLuxValue](self, "lastRearLuxValue") == -1)
      {
        v14 = 0.0;
        v12 = 0.0;
      }
      else
      {
        v11 = (double)-[PLDisplayAgent lastRearLuxValue](self, "lastRearLuxValue");
        v12 = v11 - (double)-[PLDisplayAgent lastRearLuxValue](self, "lastRearLuxValue") * 0.2;
        v13 = (double)-[PLDisplayAgent lastRearLuxValue](self, "lastRearLuxValue");
        v14 = v13 + (double)-[PLDisplayAgent lastRearLuxValue](self, "lastRearLuxValue") * 0.2;
      }
      if (-[PLDisplayAgent lastRearLuxValue](self, "lastRearLuxValue") == -1
        || (v12 <= (double)v7 ? (v15 = v14 < (double)v7) : (v15 = 1), v15))
      {
LABEL_20:
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v5, v4);
        -[PLOperator logEntry:](self, "logEntry:", v16);
        -[PLDisplayAgent setLastRearLuxValue:](self, "setLastRearLuxValue:", v7);

      }
    }
  }
  else
  {
    PLLogDisplay();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PLDisplayAgent logEventForwardLuxStats:].cold.1();
  }

}

- (void)logEventBackwardTouch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PLDisplayAgent iokitTouch](self, "iokitTouch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLDisplayAgent iokitTouch](self, "iokitTouch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertiesForKey:", CFSTR("PowerStates"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("Touch"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v5, v7);
      -[PLOperator logEntry:](self, "logEntry:", v6);

    }
  }
}

- (void)logEventBackwardUserTouch:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  _QWORD block[5];

  v3 = a3;
  if (-[PLDisplayAgent userTouch](self, "userTouch") != a3)
  {
    -[PLDisplayAgent setUserTouch:](self, "setUserTouch:", v3);
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      -[PLDisplayAgent setUserTouchDownTime:](self, "setUserTouchDownTime:", v19);
LABEL_6:

      return;
    }
    -[PLDisplayAgent userTouchDownTime](self, "userTouchDownTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0D7FFB0]);
      +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("UserTouch"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (id)objc_msgSend(v6, "initWithEntryKey:", v7);

      -[PLDisplayAgent userTouchDownTime](self, "userTouchDownTime");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceNow");
      v10 = -v9;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v11, CFSTR("UserTouchTime"));

      objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1EA1C1568, CFSTR("UserTouchCount"));
      -[PLOperator logEntry:](self, "logEntry:", v19);
      goto LABEL_6;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v12 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __44__PLDisplayAgent_logEventBackwardUserTouch___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v12;
      if (logEventBackwardUserTouch__defaultOnce != -1)
        dispatch_once(&logEventBackwardUserTouch__defaultOnce, block);
      if (logEventBackwardUserTouch__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERR: Don't have start time for touch"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent logEventBackwardUserTouch:]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 3064);

        PLLogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
  }
}

uint64_t __44__PLDisplayAgent_logEventBackwardUserTouch___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventBackwardUserTouch__classDebugEnabled = result;
  return result;
}

- (void)logEventBackwardRampInfo:(id)a3
{
  id v4;
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;

  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("RampInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AAPRampStats"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AAPRampStats"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NumberOfUpdates"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("AAP_NumberOfUpdates"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AAPRampStats"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RampFrequency"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("AAP_RampFrequency"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AAPRampStats"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("RampLength"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("AAP_RampLength"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AAPRampStats"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("RampOrigin"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("AAP_RampOrigin"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AAPRampStats"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("RampTarget"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("AAP_RampTarget"));

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ColourRampStats"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ColourRampStats"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("NumberOfUpdates"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("Colour_NumberOfUpdates"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ColourRampStats"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("RampFrequency"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("Colour_RampFrequency"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ColourRampStats"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("RampLength"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("Colour_RampLength"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ColourRampStats"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("RampOrigin"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("X"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, CFSTR("Colour_RampOrigin_X"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ColourRampStats"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("RampOrigin"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("Y"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v30, CFSTR("Colour_RampOrigin_Y"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ColourRampStats"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("RampTarget"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("X"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, CFSTR("Colour_RampTarget_X"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ColourRampStats"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("RampTarget"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Y"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v36, CFSTR("Colour_RampTarget_Y"));

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SDRRampStats"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SDRRampStats"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("NumberOfUpdates"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v39, CFSTR("SDR_NumberOfUpdates"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SDRRampStats"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("RampFrequency"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v41, CFSTR("SDR_RampFrequency"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SDRRampStats"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("RampLength"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v43, CFSTR("SDR_RampLength"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SDRRampStats"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("RampOrigin"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v45, CFSTR("SDR_RampOrigin"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SDRRampStats"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("RampTarget"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v47, CFSTR("SDR_RampTarget"));

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EDRRampStats"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EDRRampStats"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("NumberOfUpdates"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v50, CFSTR("EDR_NumberOfUpdates"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EDRRampStats"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("RampFrequency"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v52, CFSTR("EDR_RampFrequency"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EDRRampStats"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("RampLength"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v54, CFSTR("EDR_RampLength"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EDRRampStats"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("RampOrigin"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v56, CFSTR("EDR_RampOrigin"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EDRRampStats"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("RampTarget"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v58, CFSTR("EDR_RampTarget"));

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFlipbookActive"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v59, CFSTR("isFlipbookActive"));

    -[PLOperator logEntry:](self, "logEntry:", v6);
  }
  else
  {
    PLLogDisplay();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      -[PLDisplayAgent logEventBackwardRampInfo:].cold.1();

  }
}

- (void)logEventBackwardCurveUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
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
  unint64_t v28;
  id v29;
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
  unint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  PLDisplayAgent *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  NSObject *v58;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogDisplay();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    v52 = self;
    if (v6)
      -[PLDisplayAgent logEventBackwardCurveUpdate:].cold.2();

    v7 = 0x1EA16B000uLL;
    v8 = *MEMORY[0x1E0D80370];
    +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("CurveUpdate"));
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CurveLevelHigh"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = v5;
    v56 = v10;
    v57 = v9;
    if (v11)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CurveLevelHigh"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("lux"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v8;
      if (objc_msgSend(v13, "count"))
      {
        v15 = 0;
        do
        {
          v16 = objc_alloc(MEMORY[0x1E0D7FFB0]);
          +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", v14, CFSTR("CurveUpdate"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v16, "initWithEntryKey:withDate:", v17, v10);

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CurveLevelHigh"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("lux"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("lux"));

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CurveLevelHigh"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("nits"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", v15);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, CFSTR("nits"));

          v10 = v56;
          v7 = 0x1EA16B000uLL;

          v9 = v57;
          objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1EA1C1550, CFSTR("level"));
          objc_msgSend(v57, "addObject:", v18);

          ++v15;
        }
        while (objc_msgSend(v13, "count") > v15);
      }

      v5 = v54;
      v8 = v14;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CurveLevelMed"), v52);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = v8;
    if (v25)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CurveLevelHigh"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("lux"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v27, "count"))
      {
        v28 = 0;
        do
        {
          v29 = objc_alloc(MEMORY[0x1E0D7FFB0]);
          +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", v8, CFSTR("CurveUpdate"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)objc_msgSend(v29, "initWithEntryKey:withDate:", v30, v10);

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CurveLevelHigh"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("lux"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectAtIndexedSubscript:", v28);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v34, CFSTR("lux"));

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CurveLevelHigh"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("nits"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectAtIndexedSubscript:", v28);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v37, CFSTR("nits"));

          v10 = v56;
          v7 = 0x1EA16B000uLL;

          v9 = v57;
          objc_msgSend(v31, "setObject:forKeyedSubscript:", &unk_1EA1C1568, CFSTR("level"));
          objc_msgSend(v57, "addObject:", v31);

          v8 = v55;
          ++v28;
        }
        while (objc_msgSend(v27, "count") > v28);
      }

      v5 = v54;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CurveLevelLow"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CurveLevelHigh"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("lux"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v40, "count"))
      {
        v41 = 0;
        do
        {
          v42 = objc_alloc(MEMORY[0x1E0D7FFB0]);
          objc_msgSend(*(id *)(v7 + 2672), "entryKeyForType:andName:", v8, CFSTR("CurveUpdate"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = (void *)objc_msgSend(v42, "initWithEntryKey:withDate:", v43, v10);

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CurveLevelHigh"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("lux"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "objectAtIndexedSubscript:", v41);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKeyedSubscript:", v47, CFSTR("lux"));

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CurveLevelHigh"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("nits"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectAtIndexedSubscript:", v41);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKeyedSubscript:", v50, CFSTR("nits"));

          v10 = v56;
          v7 = 0x1EA16B000;

          v9 = v57;
          objc_msgSend(v44, "setObject:forKeyedSubscript:", &unk_1EA1C1580, CFSTR("level"));
          objc_msgSend(v57, "addObject:", v44);

          v8 = v55;
          ++v41;
        }
        while (objc_msgSend(v40, "count") > v41);
      }

      v5 = v54;
    }
    if (objc_msgSend(v9, "count"))
    {
      v58 = v5;
      v59[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "logEntries:withGroupID:", v51, v5);

    }
  }
  else if (v6)
  {
    -[PLDisplayAgent logEventBackwardCurveUpdate:].cold.1();
  }

}

- (void)logEventBackwardALSThreshold:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", v4, CFSTR("ALSThreshold"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventBackwardALSSamplesBeforeWake:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  PLDisplayAgent *v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v26 = self;
    v5 = *MEMORY[0x1E0D80370];
    +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("AmbientLight"));
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lux"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("color_x"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("color_y"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v12 = 0;
      v13 = v8;
      do
      {
        v14 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v29, "objectAtIndexedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_alloc(MEMORY[0x1E0D7FFB0]);
        +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", v5, CFSTR("ALSSamplesBeforeWake"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v17, "initWithEntryKey:withDate:", v18, v16);

        objc_msgSend(v9, "objectAtIndexedSubscript:", v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("Lux"));

        objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("colorX"));

        objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, CFSTR("colorY"));

        PLLogDisplay();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109634;
          v33 = v12;
          v34 = 2112;
          v35 = v16;
          v36 = 2112;
          v37 = v19;
          _os_log_debug_impl(&dword_1DA9D6000, v23, OS_LOG_TYPE_DEBUG, "ALSSamplesBeforeWake for the count=%d at the time=%@ is %@", buf, 0x1Cu);
        }

        objc_msgSend(v6, "addObject:", v19);
        ++v12;
      }
      while (v13 != v12);
    }
    v24 = v27;
    if (objc_msgSend(v6, "count"))
    {
      v30 = v27;
      v31 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator logEntries:withGroupID:](v26, "logEntries:withGroupID:", v25, v27);

    }
    v4 = v28;
  }
  else
  {
    PLLogDisplay();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[PLDisplayAgent logEventBackwardALSSamplesBeforeWake:].cold.1();
  }

}

- (void)logEventBackwardAmbientLight:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  PLDisplayAgent *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D80020], "internalBuild")
    && objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode")
    && self->_ShouldLogAmbient)
  {
    if (v4)
    {
      v25 = self;
      v5 = *MEMORY[0x1E0D80370];
      +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("AmbientLight"));
      v26 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedIntValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lux"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("color_x"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v4;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("color_y"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v11 = 0;
        v12 = v8;
        do
        {
          v13 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v29, "objectAtIndexedSubscript:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "doubleValue");
          objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = objc_alloc(MEMORY[0x1E0D7FFB0]);
          +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", v5, CFSTR("AmbientLight"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v16, "initWithEntryKey:withDate:", v17, v15);

          objc_msgSend(v28, "objectAtIndexedSubscript:", v11);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("Lux"));

          objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("colorX"));

          objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("colorY"));

          PLLogDisplay();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109634;
            v33 = v11;
            v34 = 2112;
            v35 = v15;
            v36 = 2112;
            v37 = v18;
            _os_log_debug_impl(&dword_1DA9D6000, v22, OS_LOG_TYPE_DEBUG, "AmbientLight for the count=%d at the time=%@ is %@", buf, 0x1Cu);
          }

          objc_msgSend(v6, "addObject:", v18);
          ++v11;
        }
        while (v12 != v11);
      }
      v23 = v26;
      if (objc_msgSend(v6, "count"))
      {
        v30 = v26;
        v31 = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLOperator logEntries:withGroupID:](v25, "logEntries:withGroupID:", v24, v26);

      }
      v4 = v27;
    }
    else
    {
      PLLogDisplay();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[PLDisplayAgent logEventBackwardAmbientLight:].cold.1();
    }

  }
}

- (void)handleBrightnessClientNotification:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  _QWORD v35[4];
  id v36;
  PLDisplayAgent *v37;
  _QWORD v38[5];
  _QWORD v39[4];
  id v40;
  PLDisplayAgent *v41;
  id v42;
  _QWORD v43[5];
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[4];
  id v49;
  PLDisplayAgent *v50;
  _QWORD v51[4];
  id v52;
  PLDisplayAgent *v53;
  _QWORD v54[4];
  id v55;
  PLDisplayAgent *v56;
  _QWORD v57[4];
  id v58;
  PLDisplayAgent *v59;
  _QWORD v60[4];
  id v61;
  PLDisplayAgent *v62;
  _QWORD v63[5];
  id v64;
  _QWORD block[5];
  id v66;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqual:", CFSTR("BacklightPowerMilliWatts")))
  {
    -[PLOperator workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke;
    block[3] = &unk_1EA16D948;
    block[4] = self;
    v66 = v7;
    dispatch_async_and_wait(v8, block);

    v9 = v66;
LABEL_36:

    goto LABEL_37;
  }
  if (objc_msgSend(v6, "isEqual:", CFSTR("BacklightPowerNits")))
  {
    -[PLOperator workQueue](self, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1228;
    v63[3] = &unk_1EA16D948;
    v63[4] = self;
    v64 = v7;
    dispatch_async_and_wait(v10, v63);

    v9 = v64;
    goto LABEL_36;
  }
  if (objc_msgSend(v6, "isEqual:", CFSTR("AODRampTelemetry")))
  {
    -[PLOperator workQueue](self, "workQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1236;
    v60[3] = &unk_1EA16D948;
    v61 = v7;
    v62 = self;
    dispatch_async_and_wait(v11, v60);

    v9 = v61;
    goto LABEL_36;
  }
  if (objc_msgSend(v6, "isEqual:", CFSTR("AODCurveUpdate")))
  {
    -[PLOperator workQueue](self, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1237;
    v57[3] = &unk_1EA16D948;
    v58 = v7;
    v59 = self;
    dispatch_async_and_wait(v12, v57);

    v9 = v58;
    goto LABEL_36;
  }
  if (objc_msgSend(v6, "isEqual:", CFSTR("AODWakeFromALSThreshold")))
  {
    -[PLOperator workQueue](self, "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1238;
    v54[3] = &unk_1EA16D948;
    v55 = v7;
    v56 = self;
    dispatch_async_and_wait(v13, v54);

    v9 = v55;
    goto LABEL_36;
  }
  if (objc_msgSend(MEMORY[0x1E0D80020], "internalBuild")
    && objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode")
    && objc_msgSend(v6, "isEqual:", CFSTR("CBAmbientLightTelemetry"))
    && self->_ShouldLogAmbient)
  {
    -[PLOperator workQueue](self, "workQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1239;
    v51[3] = &unk_1EA16D948;
    v52 = v7;
    v53 = self;
    dispatch_async_and_wait(v14, v51);

    v9 = v52;
    goto LABEL_36;
  }
  if (objc_msgSend(v6, "isEqual:", CFSTR("CBFinalBrightnessCommit"))
    && -[PLDisplayAgent supportsFinalBrightnessCommit](self, "supportsFinalBrightnessCommit"))
  {
    -[PLOperator workQueue](self, "workQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1240;
    v48[3] = &unk_1EA16D948;
    v49 = v7;
    v50 = self;
    dispatch_async_and_wait(v15, v48);

    v9 = v49;
    goto LABEL_36;
  }
  if (objc_msgSend(v6, "isEqual:", CFSTR("DisplayBrightness")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PLOperator workQueue](self, "workQueue");
      v16 = objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1241;
      v46[3] = &unk_1EA16D948;
      v46[4] = self;
      v47 = v7;
      dispatch_async_and_wait(v16, v46);

      v9 = v47;
      goto LABEL_36;
    }
  }
  if (objc_msgSend(v6, "isEqual:", CFSTR("DisplayBrightnessAuto")))
  {
    -[PLOperator workQueue](self, "workQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1246;
    v44[3] = &unk_1EA16D948;
    v44[4] = self;
    v45 = v7;
    dispatch_async_and_wait(v17, v44);

    v9 = v45;
    goto LABEL_36;
  }
  if (objc_msgSend(MEMORY[0x1E0D15718], "supportsAdaptation")
    && objc_msgSend(v6, "isEqual:", CFSTR("ColorAdaptationEnabled")))
  {
    +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("CAModeEnabled"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDisplayAgent logBrightnessDataWithEntryKey:withColName:withValue:](self, "logBrightnessDataWithEntryKey:withColName:withValue:", v18, CFSTR("CAModeEnabled"), v7);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v19 = objc_opt_class();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1250;
      v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v43[4] = v19;
      if (handleBrightnessClientNotification_withValue__defaultOnce != -1)
        dispatch_once(&handleBrightnessClientNotification_withValue__defaultOnce, v43);
      if (handleBrightnessClientNotification_withValue__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s-%d: property=%@, value=%@"), "-[PLDisplayAgent handleBrightnessClientNotification:withValue:]", 3472, v6, v7);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lastPathComponent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent handleBrightnessClientNotification:withValue:]");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 3472);

        PLLogCommon();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }

  }
  else
  {
    if (objc_msgSend(v6, "isEqual:", CFSTR("PowerLogReport")))
    {
      -[PLOperator workQueue](self, "workQueue");
      v26 = objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1253;
      v39[3] = &unk_1EA16DCE0;
      v40 = v7;
      v41 = self;
      v42 = v6;
      dispatch_async(v26, v39);

      v9 = v40;
      goto LABEL_36;
    }
    if (objc_msgSend(v6, "isEqual:", CFSTR("CBBlueReductionStatus")))
    {
      -[PLDisplayAgent logBlueLightDataWithDictionary:](self, "logBlueLightDataWithDictionary:", v7);
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v27 = objc_opt_class();
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1271;
        v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v38[4] = v27;
        if (handleBrightnessClientNotification_withValue__defaultOnce_1269 != -1)
          dispatch_once(&handleBrightnessClientNotification_withValue__defaultOnce_1269, v38);
        if (handleBrightnessClientNotification_withValue__classDebugEnabled_1270)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s-%d: property=%@, value=%@"), "-[PLDisplayAgent handleBrightnessClientNotification:withValue:]", 3534, v6, v7);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "lastPathComponent");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent handleBrightnessClientNotification:withValue:]");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 3534);

          PLLogCommon();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
    }
    else if (+[PLDisplayAgent shouldLogLuxStats](PLDisplayAgent, "shouldLogLuxStats")
           && objc_msgSend(v6, "isEqual:", CFSTR("RLuxStats")))
    {
      -[PLOperator workQueue](self, "workQueue");
      v34 = objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1272;
      v35[3] = &unk_1EA16D948;
      v36 = v7;
      v37 = self;
      dispatch_async_and_wait(v34, v35);

      v9 = v36;
      goto LABEL_36;
    }
  }
LABEL_37:

}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL4 v5;
  float v6;
  double v7;
  float v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  uint64_t v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  double v27;
  double v28;
  double v29;
  _BOOL4 v30;
  double v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  int v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[5];
  _QWORD v58[4];
  __CFString *v59;
  uint64_t v60;
  _QWORD v61[4];
  __CFString *v62;
  uint64_t v63;
  _QWORD block[4];
  __CFString *v65;
  uint64_t v66;

  if ((objc_msgSend(*(id *)(a1 + 32), "alsOn") & 1) == 0)
  {
    v2 = *(id *)(a1 + 40);
    objc_msgSend(v2, "valueForKey:", CFSTR("BacklightPowerMilliWattsRealSub"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "valueForKey:", CFSTR("BacklightPowerMilliWattsABSub"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[PLDisplayAgent shouldModelPowerFromIOMFB](PLDisplayAgent, "shouldModelPowerFromIOMFB");
    objc_msgSend(v3, "floatValue");
    if (v5)
    {
      v7 = v6;
      objc_msgSend(v4, "floatValue");
      v9 = v8;
    }
    else
    {
      v10 = (float)(v6 * 1000.0) / 1.8;
      objc_msgSend(v4, "floatValue");
      v12 = (float)(v11 * 1000.0) / 1.8;
      objc_msgSend(*(id *)(a1 + 32), "uAmpsToDisplayPower:", v10);
      v7 = v13;
      objc_msgSend(*(id *)(a1 + 32), "uAmpsToDisplayPower:", v12);
      v9 = v14;
    }
    v15 = v7 - v9;
    v16 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
    v17 = MEMORY[0x1E0C809B0];
    if (v16)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_2;
      block[3] = &unk_1EA170B10;
      v65 = CFSTR("ALS");
      v66 = objc_opt_class();
      if (kPRearNits_block_invoke_4_defaultOnce != -1)
        dispatch_once(&kPRearNits_block_invoke_4_defaultOnce, block);
      v18 = kPRearNits_block_invoke_4_classDebugEnabled;

      if (v18)
      {
        v19 = v4;
        v20 = v3;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PowerReal:%f PowerIfALSOn:%f alsPowerSaved:%f"), *(_QWORD *)&v7, *(_QWORD *)&v9, v7 - v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lastPathComponent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent handleBrightnessClientNotification:withValue:]_block_invoke");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 3296);

        PLLogCommon();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        v3 = v20;
        v4 = v19;
        v17 = MEMORY[0x1E0C809B0];
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "lastALSPowerSaved");
    v28 = v27;
    if (v15 == 0.0)
    {
      objc_msgSend(*(id *)(a1 + 32), "lastALSPowerSaved");
      v30 = v29 != 0.0;
    }
    else
    {
      v30 = 0;
    }
    v31 = vabdd_f64(v15, v28);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v61[0] = v17;
      v61[1] = 3221225472;
      v61[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1213;
      v61[3] = &unk_1EA170B10;
      v62 = CFSTR("ALS");
      v63 = objc_opt_class();
      if (kPRearNits_block_invoke_4_defaultOnce_1211 != -1)
        dispatch_once(&kPRearNits_block_invoke_4_defaultOnce_1211, v61);
      v32 = kPRearNits_block_invoke_4_classDebugEnabled_1212;

      if (v32)
      {
        v33 = v4;
        v34 = v3;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("significantChange:%d newlyZero:%d"), v31 >= 1.0, v30);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "lastPathComponent");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent handleBrightnessClientNotification:withValue:]_block_invoke_2");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 3304);

        PLLogCommon();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        v3 = v34;
        v4 = v33;
        v17 = MEMORY[0x1E0C809B0];
      }
    }
    v41 = v31 >= 1.0 || v30;
    if (v41 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "setLastALSPowerSaved:", v15);
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v58[0] = v17;
        v58[1] = 3221225472;
        v58[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1219;
        v58[3] = &unk_1EA170B10;
        v59 = CFSTR("ALS");
        v60 = objc_opt_class();
        if (kPRearNits_block_invoke_4_defaultOnce_1217 != -1)
          dispatch_once(&kPRearNits_block_invoke_4_defaultOnce_1217, v58);
        v42 = kPRearNits_block_invoke_4_classDebugEnabled_1218;

        if (v42)
        {
          v43 = v4;
          v44 = v3;
          v45 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(a1 + 32), "lastALSPowerSaved");
          objc_msgSend(v45, "stringWithFormat:", CFSTR("Setting lastALSPowerSaved=%f"), v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "lastPathComponent");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent handleBrightnessClientNotification:withValue:]_block_invoke_2");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "logMessage:fromFile:fromFunction:fromLineNumber:", v47, v50, v51, 3308);

          PLLogCommon();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

          v3 = v44;
          v4 = v43;
          v17 = MEMORY[0x1E0C809B0];
        }
      }
      v53 = (void *)MEMORY[0x1E0D80000];
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDateWithTimeIntervalSinceNow:", 2.0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "workQueue");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v17;
      v57[1] = 3221225472;
      v57[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1223;
      v57[3] = &unk_1EA16EEF0;
      v57[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v53, "scheduledTimerWithMonotonicFireDate:withInterval:withQueue:withBlock:", v54, v55, v57, 0.0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setLogLastALSPowerSavedTimer:", v56);

    }
  }
}

uint64_t __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  kPRearNits_block_invoke_4_classDebugEnabled = result;
  return result;
}

uint64_t __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1213(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  kPRearNits_block_invoke_4_classDebugEnabled_1212 = result;
  return result;
}

uint64_t __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1219(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  kPRearNits_block_invoke_4_classDebugEnabled_1218 = result;
  return result;
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1223(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
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
  _QWORD block[4];
  __CFString *v19;
  uint64_t v20;

  v3 = a2;
  if (+[PLDisplayAgent shouldLogALSPowerSaved](PLDisplayAgent, "shouldLogALSPowerSaved"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v4 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_2_1224;
      block[3] = &unk_1EA170B10;
      block[1] = 3221225472;
      v19 = CFSTR("ALS");
      v20 = v4;
      if (kPRearNits_block_invoke_5_defaultOnce != -1)
        dispatch_once(&kPRearNits_block_invoke_5_defaultOnce, block);
      v5 = kPRearNits_block_invoke_5_classDebugEnabled;

      if (v5)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 32), "lastALSPowerSaved");
        objc_msgSend(v6, "stringWithFormat:", CFSTR("Logging lastALSPowerSaved=%f"), v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent handleBrightnessClientNotification:withValue:]_block_invoke");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 3315);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ALSPowerSaved"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v14, v3);
    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "lastALSPowerSaved");
    objc_msgSend(v16, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("Power"));

    objc_msgSend(*(id *)(a1 + 32), "logEntry:", v15);
  }

}

uint64_t __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_2_1224(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  kPRearNits_block_invoke_5_classDebugEnabled = result;
  return result;
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1228(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  float v5;
  double v6;
  float v7;
  double v8;
  uint64_t v9;
  void *v10;
  float v11;
  double v12;
  float v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD block[5];

  if ((objc_msgSend(*(id *)(a1 + 32), "alsOn") & 1) == 0)
  {
    v2 = *(id *)(a1 + 40);
    objc_msgSend(v2, "valueForKey:", CFSTR("BacklightPowerNitsRealSub"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "valueForKey:", CFSTR("BacklightPowerNitsABSub"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "floatValue");
    *(float *)&v6 = v5 * 1000.0;
    objc_msgSend(*(id *)(a1 + 32), "setRealmNits:", v6);
    objc_msgSend(v4, "floatValue");
    *(float *)&v8 = v7 * 1000.0;
    objc_msgSend(*(id *)(a1 + 32), "setAutobrightnessmNits:", v8);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v9 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_2_1233;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v9;
      if (kPRearNits_block_invoke_6_defaultOnce != -1)
        dispatch_once(&kPRearNits_block_invoke_6_defaultOnce, block);
      if (kPRearNits_block_invoke_6_classDebugEnabled)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 32), "realmNits");
        v12 = v11;
        objc_msgSend(*(id *)(a1 + 32), "autobrightnessmNits");
        objc_msgSend(v10, "stringWithFormat:", CFSTR("BrightnessNotification - Real: %f Nits\tVirtual: %f Nits"), *(_QWORD *)&v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent handleBrightnessClientNotification:withValue:]_block_invoke");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 3341);

        PLLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }

  }
}

uint64_t __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_2_1233(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPRearNits_block_invoke_6_classDebugEnabled = result;
  return result;
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1236(uint64_t a1)
{
  id v2;
  NSObject *v3;

  v2 = *(id *)(a1 + 32);
  PLLogDisplay();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1236_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "logEventBackwardRampInfo:", v2);
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1237(uint64_t a1)
{
  id v2;
  NSObject *v3;

  v2 = *(id *)(a1 + 32);
  PLLogDisplay();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1237_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "logEventBackwardCurveUpdate:", v2);
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1238(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(id *)(a1 + 32);
  PLLogDisplay();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1238_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "logEventBackwardALSThreshold:", v2);
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ALSSamplesBeforeWake"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ALSSamplesBeforeWake"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logEventBackwardALSSamplesBeforeWake:", v6);

  }
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1239(uint64_t a1)
{
  id v2;
  NSObject *v3;

  v2 = *(id *)(a1 + 32);
  PLLogDisplay();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1239_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "logEventBackwardAmbientLight:", v2);
}

uint64_t __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1240(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  float v10;
  double v11;

  PLLogDisplay();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1240_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("slider"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10 * 100.0;

  objc_msgSend(*(id *)(a1 + 40), "logEventPointUserBrightnessCommitted:", v11);
  return objc_msgSend(*(id *)(a1 + 40), "logEventForwardExtendedALSUserPreferences:", *(_QWORD *)(a1 + 32));
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1241(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  float v5;
  double v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  id *v11;
  void *v12;
  NSObject *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  float v30;
  double v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  char v43;
  void *v44;
  NSObject *v45;
  void *v46;
  int v47;
  double v48;
  __int16 v49;
  double v50;
  __int16 v51;
  double v52;
  __int16 v53;
  double v54;
  __int16 v55;
  double v56;
  __int16 v57;
  double v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (+[PLDisplayAgent shouldLogUserBrightness](PLDisplayAgent, "shouldLogUserBrightness"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "supportsFinalBrightnessCommit") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("Commit"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "BOOLValue");

      if (v3)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("Brightness"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "floatValue");
        v6 = v5 * 100.0;

        objc_msgSend(*(id *)(a1 + 32), "logEventPointUserBrightnessCommitted:", v6);
        if (objc_msgSend(*(id *)(a1 + 32), "alsOn"))
          objc_msgSend(*(id *)(a1 + 32), "logEventForwardALSUserPreferencesWithCurrLux");
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("EDRHeadroom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = (int)(v8 * 1000.0);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "pendingBacklightEntry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("EDRHeadroom"));

  if (objc_msgSend(MEMORY[0x1E0D80020], "hasCapability:", 8))
  {
    PLLogDisplay();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(double *)(a1 + 40);
      v47 = 138412290;
      v48 = v14;
      _os_log_impl(&dword_1DA9D6000, v13, OS_LOG_TYPE_DEFAULT, "Received Brightness Notification: %@", (uint8_t *)&v47, 0xCu);
    }

    objc_msgSend(*v11, "pendingBacklightEntry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v16 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 40));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPendingBacklightEntry:", v17);

    }
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("NitsPhysical"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    v20 = v19;

    objc_msgSend(*(id *)(a1 + 32), "brightnessSystemClient");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copyPropertyForKey:", CFSTR("DisplayBrightnessMin"));
    objc_msgSend(v22, "doubleValue");
    v24 = v23;

    objc_msgSend(*(id *)(a1 + 32), "brightnessSystemClient");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copyPropertyForKey:", CFSTR("DisplayBrightnessMax"));
    objc_msgSend(v26, "doubleValue");
    v28 = v27;

    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("Brightness"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "floatValue");
    v31 = v30;

    PLLogDisplay();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v47 = 134219264;
      v48 = v20;
      v49 = 2048;
      v50 = v24;
      v51 = 2048;
      v52 = v28;
      v53 = 2048;
      v54 = v28 - v24;
      v55 = 2048;
      v56 = v31;
      v57 = 2048;
      v58 = (v31 - v24) * 100.0 / (v28 - v24);
      _os_log_debug_impl(&dword_1DA9D6000, v32, OS_LOG_TYPE_DEBUG, "Reported mNits:%f ,brightnessMin:%f ,brightnessMax:%f ,brightnessDiff:%f ,brightness:%f ,brightnessPercentage:%f ", (uint8_t *)&v47, 0x3Eu);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v31 - v24) * 100.0 / (v28 - v24));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v11, "pendingBacklightEntry");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, CFSTR("Brightness"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v11, "pendingBacklightEntry");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v35, CFSTR("SliderValue"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20 * 1000.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v11, "pendingBacklightEntry");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, CFSTR("mNits"));

    objc_msgSend(*v11, "pendingBacklightEntryDate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v39)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v11, "setPendingBacklightEntryDate:", v40);

    }
    PLLogDisplay();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1241_cold_2(v11);

    objc_msgSend(*v11, "backlightFilterTimer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "timerActive");

    if ((v43 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      PLLogDisplay();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1241_cold_1((uint64_t)v44, v45);

      objc_msgSend(*v11, "backlightFilterTimer");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setFireDate:", v44);

    }
  }
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1246(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  __CFString *v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "setAlsOn:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_2_1247;
    block[3] = &unk_1EA170B10;
    block[1] = 3221225472;
    v13 = CFSTR("ALS");
    v14 = v2;
    if (kPRearNits_block_invoke_7_defaultOnce != -1)
      dispatch_once(&kPRearNits_block_invoke_7_defaultOnce, block);
    v3 = kPRearNits_block_invoke_7_classDebugEnabled;

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Auto-brightness switched to alsOn=%i"), objc_msgSend(*(id *)(a1 + 32), "alsOn"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent handleBrightnessClientNotification:withValue:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 3453);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventForwardALSEnabled");
  if (objc_msgSend(*(id *)(a1 + 32), "alsOn"))
  {
    if (+[PLDisplayAgent shouldLogALSPowerSaved](PLDisplayAgent, "shouldLogALSPowerSaved"))
    {
      +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ALSPowerSaved"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1EA1C1550, CFSTR("Power"));
      objc_msgSend(*(id *)(a1 + 32), "logEntry:", v11);

    }
  }
}

uint64_t __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_2_1247(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  kPRearNits_block_invoke_7_classDebugEnabled = result;
  return result;
}

uint64_t __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1250(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBrightnessClientNotification_withValue__classDebugEnabled = result;
  return result;
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1253(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t block;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  uint64_t v37;

  v2 = *(id *)(a1 + 32);
  v3 = *MEMORY[0x1E0D80370];
  +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("BlueLightParameters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v4);
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("BlueLightReductionOffTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("BlueLightReductionOffTime"));

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("BlueLightReductionOnTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("BlueLightReductionOnTime"));

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AvgBacklightNits"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("AvgBacklightNits"));

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AvgLogicalBrightnessNits"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("AvgLogicalBrightnessNits"));

  objc_msgSend(*(id *)(a1 + 40), "logEntry:", v5);
  if (objc_msgSend(MEMORY[0x1E0D15718], "supportsAdaptation"))
  {
    +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", v3, CFSTR("HParameters"));
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
    v12 = *(void **)(a1 + 40);
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DisplayColorBins"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "extractDataWithEntry:withColName:withDataArray:", v11, CFSTR("DisplayColorBins"), v13);

    v14 = *(void **)(a1 + 40);
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AmbientColorBins"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "extractDataWithEntry:withColName:withDataArray:", v11, CFSTR("AmbientColorBins"), v15);

    v16 = *(void **)(a1 + 40);
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AdaptationStrengthBins"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "extractDataWithEntry:withColName:withDataArray:", v11, CFSTR("AdaptationStrengthBins"), v17);

    v18 = *(void **)(a1 + 40);
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AmbientColorBinsAnsi"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "extractDataWithEntry:withColName:withDataArray:", v11, CFSTR("AmbientColorBinsAnsi"), v19);

    v20 = *(void **)(a1 + 40);
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AmbientColorTransitionBins"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "extractDataWithEntry:withColName:withDataArray:", v11, CFSTR("AmbientColorTransitionBins"), v21);

    v22 = *(void **)(a1 + 40);
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DisplayColorTransitionBins"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "extractDataWithEntry:withColName:withDataArray:", v11, CFSTR("DisplayColorTransitionBins"), v23);

    objc_msgSend(v11, "allValues");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25)
      objc_msgSend(*(id *)(a1 + 40), "logEntry:", v11);

    v4 = (void *)v10;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v26 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v34 = 3221225472;
    v35 = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_2_1266;
    v36 = &__block_descriptor_40_e5_v8__0lu32l8;
    v37 = v26;
    if (kPRearNits_block_invoke_8_defaultOnce != -1)
      dispatch_once(&kPRearNits_block_invoke_8_defaultOnce, &block);
    if (kPRearNits_block_invoke_8_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s-%d: harmonyParametersEntry=%@, property=%@, value=%@"), "-[PLDisplayAgent handleBrightnessClientNotification:withValue:]_block_invoke", 3528, v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), block, v34, v35, v36, v37);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "lastPathComponent");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent handleBrightnessClientNotification:withValue:]_block_invoke");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 3528);

      PLLogCommon();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

uint64_t __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_2_1266(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPRearNits_block_invoke_8_classDebugEnabled = result;
  return result;
}

uint64_t __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1271(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBrightnessClientNotification_withValue__classDebugEnabled_1270 = result;
  return result;
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1272(uint64_t a1)
{
  id v2;
  NSObject *v3;

  v2 = *(id *)(a1 + 32);
  PLLogDisplay();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1272_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "logEventForwardLuxStats:", v2);
}

- (void)extractDataWithEntry:(id)a3 withColName:(id)a4 withDataArray:(id)a5
{
  id v7;
  __CFString *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD block[5];

  v7 = a3;
  v8 = (__CFString *)a4;
  v9 = a5;
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    v11 = v10;
    for (i = 0; i != v11; ++i)
    {
      v13 = CFSTR("ACBins");
      if ((-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("AmbientColorBins")) & 1) != 0
        || (v13 = CFSTR("DCBins"),
            (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("DisplayColorBins")) & 1) != 0)
        || (v13 = CFSTR("ASBins"),
            (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("AdaptationStrengthBins")) & 1) != 0)
        || (v13 = CFSTR("ACABins"),
            (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("AmbientColorBinsAnsi")) & 1) != 0)
        || (v13 = CFSTR("ACTBins"),
            (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("AmbientColorTransitionBins")) & 1) != 0)
        || (v13 = CFSTR("DCTBins"),
            -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("DisplayColorTransitionBins"))))
      {

        v8 = (__CFString *)v13;
      }
      objc_msgSend(v9, "objectAtIndexedSubscript:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%lu"), v8, i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v15);

    }
  }
  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled") & 1) != 0)
  {
    v16 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__PLDisplayAgent_extractDataWithEntry_withColName_withDataArray___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v16;
    if (extractDataWithEntry_withColName_withDataArray__defaultOnce != -1)
      dispatch_once(&extractDataWithEntry_withColName_withDataArray__defaultOnce, block);
    if (extractDataWithEntry_withColName_withDataArray__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s-%d: col=%@, data=%@, entry=%@"), "-[PLDisplayAgent extractDataWithEntry:withColName:withDataArray:]", 3573, v8, v9, v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent extractDataWithEntry:withColName:withDataArray:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 3573);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

uint64_t __65__PLDisplayAgent_extractDataWithEntry_withColName_withDataArray___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  extractDataWithEntry_withColName_withDataArray__classDebugEnabled = result;
  return result;
}

- (void)logBrightnessDataWithEntryKey:(id)a3 withColName:(id)a4 withValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t block;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v8);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v9);
  -[PLOperator logEntry:](self, "logEntry:", v11);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v12 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __70__PLDisplayAgent_logBrightnessDataWithEntryKey_withColName_withValue___block_invoke;
    v22 = &__block_descriptor_40_e5_v8__0lu32l8;
    v23 = v12;
    if (logBrightnessDataWithEntryKey_withColName_withValue__defaultOnce != -1)
      dispatch_once(&logBrightnessDataWithEntryKey_withColName_withValue__defaultOnce, &block);
    if (logBrightnessDataWithEntryKey_withColName_withValue__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s-%d: entryKey=%@, col=%@, value=%@"), "-[PLDisplayAgent logBrightnessDataWithEntryKey:withColName:withValue:]", 3580, v8, v9, v10, block, v20, v21, v22, v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent logBrightnessDataWithEntryKey:withColName:withValue:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 3580);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

uint64_t __70__PLDisplayAgent_logBrightnessDataWithEntryKey_withColName_withValue___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logBrightnessDataWithEntryKey_withColName_withValue__classDebugEnabled = result;
  return result;
}

+ (BOOL)shouldLogBLR
{
  if (shouldLogBLR_onceToken != -1)
    dispatch_once(&shouldLogBLR_onceToken, &__block_literal_global_1291);
  return shouldLogBLR_result;
}

uint64_t __30__PLDisplayAgent_shouldLogBLR__block_invoke()
{
  uint64_t result;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isiPod") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isiPhone") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isiPad") & 1) != 0)
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(MEMORY[0x1E0D80020], "isMac");
  }
  shouldLogBLR_result = result;
  return result;
}

+ (BOOL)shouldLogALSPowerSaved
{
  if (shouldLogALSPowerSaved_onceToken != -1)
    dispatch_once(&shouldLogALSPowerSaved_onceToken, &__block_literal_global_1292);
  return shouldLogALSPowerSaved_result;
}

uint64_t __40__PLDisplayAgent_shouldLogALSPowerSaved__block_invoke()
{
  uint64_t result;
  char v1;

  result = objc_msgSend(MEMORY[0x1E0D80020], "isiPod");
  if ((result & 1) != 0)
  {
    v1 = 0;
  }
  else
  {
    result = objc_msgSend(MEMORY[0x1E0D80020], "isMac");
    v1 = result ^ 1;
  }
  shouldLogALSPowerSaved_result = v1;
  return result;
}

+ (BOOL)shouldLogBacklightControl
{
  if (shouldLogBacklightControl_onceToken != -1)
    dispatch_once(&shouldLogBacklightControl_onceToken, &__block_literal_global_1293);
  return shouldLogBacklightControl_result;
}

uint64_t __43__PLDisplayAgent_shouldLogBacklightControl__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D80020], "isArchARM");
  shouldLogBacklightControl_result = result;
  return result;
}

+ (BOOL)shouldLogDisplay
{
  if (shouldLogDisplay_onceToken != -1)
    dispatch_once(&shouldLogDisplay_onceToken, &__block_literal_global_1294);
  return shouldLogDisplay_result;
}

uint64_t __34__PLDisplayAgent_shouldLogDisplay__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D80020], "isArchARM");
  shouldLogDisplay_result = result;
  return result;
}

+ (BOOL)shouldLogLCD
{
  if (shouldLogLCD_onceToken != -1)
    dispatch_once(&shouldLogLCD_onceToken, &__block_literal_global_1295);
  return shouldLogLCD_result;
}

uint64_t __30__PLDisplayAgent_shouldLogLCD__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D80020], "isMac");
  shouldLogLCD_result = result;
  return result;
}

+ (BOOL)shouldLogFromDCP
{
  if (shouldLogFromDCP_onceToken != -1)
    dispatch_once(&shouldLogFromDCP_onceToken, &__block_literal_global_1296);
  return shouldLogFromDCP_result;
}

uint64_t __34__PLDisplayAgent_shouldLogFromDCP__block_invoke()
{
  uint64_t result;
  char v1;

  result = objc_msgSend(MEMORY[0x1E0D80020], "hasDCP");
  if ((_DWORD)result)
  {
    result = objc_msgSend(MEMORY[0x1E0D80020], "kPLDeviceClassIsOneOf:", 102042, 0);
    v1 = result ^ 1;
  }
  else
  {
    v1 = 0;
  }
  shouldLogFromDCP_result = v1;
  return result;
}

+ (BOOL)shouldLogUserBrightness
{
  if (shouldLogUserBrightness_onceToken != -1)
    dispatch_once(&shouldLogUserBrightness_onceToken, &__block_literal_global_1297);
  return shouldLogUserBrightness_result;
}

uint64_t __41__PLDisplayAgent_shouldLogUserBrightness__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D80020], "isMac");
  shouldLogUserBrightness_result = result ^ 1;
  return result;
}

+ (BOOL)shouldLogKeyboardBrightness
{
  if (shouldLogKeyboardBrightness_onceToken != -1)
    dispatch_once(&shouldLogKeyboardBrightness_onceToken, &__block_literal_global_1298);
  return shouldLogKeyboardBrightness_result;
}

uint64_t __45__PLDisplayAgent_shouldLogKeyboardBrightness__block_invoke()
{
  char v0;
  uint64_t result;

  v0 = objc_msgSend(MEMORY[0x1E0D80020], "isiPad");
  result = objc_msgSend(MEMORY[0x1E0D80020], "isMac");
  shouldLogKeyboardBrightness_result = result | v0;
  return result;
}

+ (BOOL)shouldLogLuxStats
{
  if (shouldLogLuxStats_onceToken != -1)
    dispatch_once(&shouldLogLuxStats_onceToken, &__block_literal_global_1299);
  return shouldLogLuxStats_result;
}

uint64_t __35__PLDisplayAgent_shouldLogLuxStats__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D80020], "isiPhone");
  if ((_DWORD)result)
    result = MGGetBoolAnswer();
  shouldLogLuxStats_result = result;
  return result;
}

- (void)logBlueLightDataWithDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _QWORD block[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  id location;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLDisplayAgent bluelightFilterTimer](self, "bluelightFilterTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_initWeak(&location, self);
    v6 = objc_alloc(MEMORY[0x1E0D80070]);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator workQueue](self, "workQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __49__PLDisplayAgent_logBlueLightDataWithDictionary___block_invoke;
    v31[3] = &unk_1EA170AE8;
    objc_copyWeak(&v32, &location);
    v9 = (void *)objc_msgSend(v6, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v7, 0, 0, v8, v31, 0.0, 0.0);
    -[PLDisplayAgent setBluelightFilterTimer:](self, "setBluelightFilterTimer:", v9);

    -[PLDisplayAgent bluelightFilterTimer](self, "bluelightFilterTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arm");

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("BlueLightReductionStatus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
  objc_msgSend(v4, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, v17);

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v14);
  }
  -[PLDisplayAgent setBluelightStatusEntry:](self, "setBluelightStatusEntry:", v12);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v19 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__PLDisplayAgent_logBlueLightDataWithDictionary___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v19;
    if (logBlueLightDataWithDictionary__defaultOnce != -1)
      dispatch_once(&logBlueLightDataWithDictionary__defaultOnce, block);
    if (logBlueLightDataWithDictionary__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s-%d: entryKey=%@, entry=%@"), "-[PLDisplayAgent logBlueLightDataWithDictionary:]", 3699, v11, v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastPathComponent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent logBlueLightDataWithDictionary:]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 3699);

      PLLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

void __49__PLDisplayAgent_logBlueLightDataWithDictionary___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reArmCallback");

}

uint64_t __49__PLDisplayAgent_logBlueLightDataWithDictionary___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logBlueLightDataWithDictionary__classDebugEnabled = result;
  return result;
}

- (void)reArmCallback
{
  void *v3;
  void *v4;
  void *v5;

  -[PLDisplayAgent bluelightStatusEntry](self, "bluelightStatusEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator logEntry:](self, "logEntry:", v3);

  -[PLDisplayAgent bluelightFilterTimer](self, "bluelightFilterTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLDisplayAgent bluelightFilterTimer](self, "bluelightFilterTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

  }
  -[PLDisplayAgent setBluelightFilterTimer:](self, "setBluelightFilterTimer:", 0);
  -[PLDisplayAgent setBluelightStatusEntry:](self, "setBluelightStatusEntry:", 0);
}

+ (BOOL)shouldLogTouch
{
  if (shouldLogTouch_onceToken != -1)
    dispatch_once(&shouldLogTouch_onceToken, &__block_literal_global_1304);
  return shouldLogTouch_result;
}

uint64_t __32__PLDisplayAgent_shouldLogTouch__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D80020], "isiOS");
  shouldLogTouch_result = result;
  return result;
}

- (__IOHIDEventSystemClient)setUpIOHIDTouchSystemClient
{
  __IOHIDEventSystemClient *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (!+[PLDisplayAgent shouldLogTouch](PLDisplayAgent, "shouldLogTouch")
    || !objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
  {
    return 0;
  }
  v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("DeviceUsagePage"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("Built-In"));

    -[PLOperator workQueue](self, "workQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    IOHIDEventSystemClientScheduleWithDispatchQueue();

    IOHIDEventSystemClientRegisterEventCallback();
    IOHIDEventSystemClientSetMatching();

  }
  return v3;
}

- (BOOL)listenForAlsPluginMatchingKeys:(__IOHIDEventSystemClient *)a3 withKeys:(const void *)a4 withValues:(const void *)a5 withCount:(unint64_t)a6
{
  return 0;
}

- (__IOHIDEventSystemClient)setUpIOHIDAmbientLightSensorSystemClient
{
  return 0;
}

- (BOOL)updateDisplayIOReportStats:(id)a3 logZeroFramesOnlyOnce:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *Samples;
  void *v9;
  void *v10;
  void *v11;
  void *SamplesDelta;
  PLDisplayAPLStats *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  char v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  int v54;
  _QWORD v56[5];
  id v57;
  _QWORD v58[5];
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "subscription"))
  {
    objc_msgSend(v6, "subscription");
    objc_msgSend(v6, "subscribedChannels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    Samples = (void *)IOReportCreateSamples();

    if (!Samples)
    {
      LOBYTE(SamplesDelta) = 0;
LABEL_42:

      goto LABEL_43;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ioReportSample");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
LABEL_39:
      objc_msgSend(v6, "setIoReportSample:", Samples);
      objc_msgSend(v6, "sampleTime");
      SamplesDelta = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSampleTimePrevious:", SamplesDelta);

      objc_msgSend(v6, "setSampleTime:", v9);
      LOBYTE(SamplesDelta) = 1;
      goto LABEL_41;
    }
    objc_msgSend(v6, "ioReportSample");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SamplesDelta = (void *)IOReportCreateSamplesDelta();

    if (!SamplesDelta)
    {
LABEL_41:

      goto LABEL_42;
    }
    v72 = 0;
    v73 = &v72;
    v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__14;
    v76 = __Block_byref_object_dispose__14;
    v77 = 0;
    v66 = 0;
    v67 = &v66;
    v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__14;
    v70 = __Block_byref_object_dispose__14;
    v71 = 0;
    v60 = 0;
    v61 = &v60;
    v62 = 0x3032000000;
    v63 = __Block_byref_object_copy__14;
    v64 = __Block_byref_object_dispose__14;
    v65 = 0;
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x3032000000;
    v58[3] = __Block_byref_object_copy__14;
    v58[4] = __Block_byref_object_dispose__14;
    v59 = 0;
    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x3032000000;
    v56[3] = __Block_byref_object_copy__14;
    v56[4] = __Block_byref_object_dispose__14;
    v57 = 0;
    v13 = objc_alloc_init(PLDisplayAPLStats);
    IOReportIterate();
    objc_msgSend(v6, "sampleTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v14);
    v16 = v15;

    if (v16 <= 0.0 || (objc_msgSend((id)v61[5], "doubleValue"), v17 <= 0.0))
    {
      -[PLDisplayAPLStats setAvgPower:](v13, "setAvgPower:", &unk_1EA1DACC8);
    }
    else
    {
      if ((objc_msgSend(MEMORY[0x1E0D80020], "kPLDeviceClassIsOneOf:", 100078, 100079, 0) & 1) != 0)
      {
        v18 = 1.12014716;
      }
      else if (objc_msgSend(MEMORY[0x1E0D80020], "kPLDeviceClassIsOneOf:", 100080, 100081, 0))
      {
        v18 = 1.29084846;
      }
      else
      {
        v18 = 0.0;
      }
      objc_msgSend((id)v61[5], "doubleValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19 / v16 / 1000.0 + v18 * 1000.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDisplayAPLStats setAvgPower:](v13, "setAvgPower:", v20);

    }
    v21 = (void *)v67[5];
    if (v21 && (int)objc_msgSend(v21, "intValue") >= 1)
    {
      objc_msgSend((id)v73[5], "doubleValue");
      v23 = v22;
      objc_msgSend((id)v67[5], "doubleValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23 / v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDisplayAPLStats setAvgAPL:](v13, "setAvgAPL:", v25);

    }
    -[PLDisplayAPLStats frames](v13, "frames");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      -[PLDisplayAPLStats frames](v13, "frames");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "intValue");

      if (v28 >= 1)
      {
        -[PLDisplayAPLStats avgRed](v13, "avgRed");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "doubleValue");
        v31 = v30;
        -[PLDisplayAPLStats frames](v13, "frames");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "doubleValue");
        v34 = v31 / v33;

        v35 = 0;
        if (v34 < 0.0)
          goto LABEL_38;
        if (v34 > 255.0)
          goto LABEL_38;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLDisplayAPLStats setAvgRed:](v13, "setAvgRed:", v36);

        -[PLDisplayAPLStats avgGreen](v13, "avgGreen");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "doubleValue");
        v39 = v38;
        -[PLDisplayAPLStats frames](v13, "frames");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "doubleValue");
        v42 = v39 / v41;

        v35 = 0;
        if (v42 < 0.0)
          goto LABEL_38;
        if (v42 > 255.0)
          goto LABEL_38;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLDisplayAPLStats setAvgGreen:](v13, "setAvgGreen:", v43);

        -[PLDisplayAPLStats avgBlue](v13, "avgBlue");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "doubleValue");
        v46 = v45;
        -[PLDisplayAPLStats frames](v13, "frames");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "doubleValue");
        v49 = v46 / v48;

        v35 = 0;
        if (v49 < 0.0 || v49 > 255.0)
        {
LABEL_38:

          _Block_object_dispose(v56, 8);
          _Block_object_dispose(v58, 8);

          _Block_object_dispose(&v60, 8);
          _Block_object_dispose(&v66, 8);

          _Block_object_dispose(&v72, 8);
          if ((v35 & 1) == 0)
          {
            LOBYTE(SamplesDelta) = 0;
            goto LABEL_41;
          }
          goto LABEL_39;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLDisplayAPLStats setAvgBlue:](v13, "setAvgBlue:", v50);

        v51 = 0;
LABEL_37:
        updateDisplayIOReportStats_logZeroFramesOnlyOnce__gotZeroFrameAlready = v51;
        objc_msgSend(v6, "setDisplayAPLStats:", v13);
        v35 = 1;
        goto LABEL_38;
      }
    }
    -[PLDisplayAPLStats frames](v13, "frames");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      -[PLDisplayAPLStats frames](v13, "frames");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "intValue");

      if ((v54 & 0x80000000) == 0)
      {
        if (!v4 || updateDisplayIOReportStats_logZeroFramesOnlyOnce__gotZeroFrameAlready != 1)
        {
          v51 = 1;
          goto LABEL_37;
        }
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v35 = 0;
          updateDisplayIOReportStats_logZeroFramesOnlyOnce__gotZeroFrameAlready = 0;
          goto LABEL_38;
        }
      }
    }
    v35 = 0;
    goto LABEL_38;
  }
  LOBYTE(SamplesDelta) = 0;
LABEL_43:

  return (char)SamplesDelta;
}

void __67__PLDisplayAgent_updateDisplayIOReportStats_logZeroFramesOnlyOnce___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1DF0A47AC]();
  IOReportChannelGetChannelName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", IOReportSimpleGetIntegerValue());
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = &unk_1EA1C1550;
  v7 = v6;

  if (objc_msgSend(v3, "isEqualToString:", CFSTR("red")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAvgRed:", v7);
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("green")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAvgGreen:", v7);
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("blue")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAvgBlue:", v7);
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("frame_count")))
    {
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("nits_accum")))
      {
        v8 = *(_QWORD *)(a1 + 40);
      }
      else if (objc_msgSend(v3, "isEqualToString:", CFSTR("bl_frame_count")))
      {
        v8 = *(_QWORD *)(a1 + 48);
      }
      else if (objc_msgSend(v3, "isEqualToString:", CFSTR("power")))
      {
        v8 = *(_QWORD *)(a1 + 56);
      }
      else if (objc_msgSend(v3, "isEqualToString:", CFSTR("apl_sum")))
      {
        v8 = *(_QWORD *)(a1 + 64);
      }
      else
      {
        if (!objc_msgSend(v3, "isEqualToString:", CFSTR("apl_count")))
          goto LABEL_23;
        v8 = *(_QWORD *)(a1 + 72);
      }
      objc_storeStrong((id *)(*(_QWORD *)(v8 + 8) + 40), v6);
      goto LABEL_23;
    }
    objc_msgSend(*(id *)(a1 + 32), "setFrames:", v7);
  }
LABEL_23:

  objc_autoreleasePoolPop(v2);
}

- (void)__FrameBufferEventCallback:(__IOMobileFramebuffer *)a3
{
  int *v4;
  int *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  unint64_t v10;
  unsigned int v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  void *v34;
  __int128 v35;
  void *v36;
  PLDisplayAgent *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint8_t buf[4];
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = (int *)malloc_type_aligned_alloc(0x4000uLL, 0x4000uLL, 0xF1D51391uLL);
  v5 = v4;
  if (((unsigned __int16)v4 & 0x3FFF) != 0)
  {
    if (v4)
      free(v4);
  }
  else
  {
    v37 = self;
    IOMobileFramebufferGetBufBlock();
    PLLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PLDisplayAgent __FrameBufferEventCallback:].cold.1(v5, v6, v7);

    +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("AZLSnapshots"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (*v5)
    {
      v10 = 0;
      v11 = 7;
      v38 = *MEMORY[0x1E0D80370];
      *(_QWORD *)&v9 = 67110656;
      v35 = v9;
      v39 = v8;
      do
      {
        v12 = objc_alloc(MEMORY[0x1E0D7FFB0]);
        +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", v38, CFSTR("AZLSnapshots"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithEntryKey:withDate:", v13, v40);

        PLLogDisplay();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v27 = v5[v11];
          v16 = v11 - 6;
          v28 = v5[v16];
          v17 = v11 - 5;
          v29 = v5[v17];
          v18 = v11 - 4;
          v30 = v5[v18];
          v19 = v11 - 3;
          v31 = v5[v19];
          v41 = v11 - 2;
          v32 = v5[v41];
          v42 = v11 - 1;
          v33 = v5[v42];
          *(_DWORD *)buf = v35;
          v46 = v27;
          v47 = 1024;
          v48 = v28;
          v49 = 1024;
          v50 = v29;
          v51 = 1024;
          v52 = v30;
          v53 = 1024;
          v54 = v31;
          v55 = 1024;
          v56 = v32;
          v57 = 1024;
          v58 = v33;
          _os_log_debug_impl(&dword_1DA9D6000, v15, OS_LOG_TYPE_DEBUG, "packet_id[%d]: current_ma(u14.18): 0x%x, voltage_v(u4.10): 0x%x, system_nits(u0.20): 0x%x, azl(u0.20): 0x%x, max_zone_current(0.14): 0x%x, max_row_step_to_step_current(10.14): 0x%x \n", buf, 0x2Cu);
        }
        else
        {
          v16 = v11 - 6;
          v17 = v11 - 5;
          v18 = v11 - 4;
          v19 = v11 - 3;
          v41 = v11 - 2;
          v42 = v11 - 1;
        }

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5[v16]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("AverageCurrent"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5[v17]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, CFSTR("VLED"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5[v18]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, CFSTR("SystemNits"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5[v19]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, CFSTR("AZL"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5[v41]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v24, CFSTR("MaxRowCurrent"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5[v42]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v25, CFSTR("NitsAccum"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5[v11]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v26, CFSTR("PacketID"));

        v8 = v39;
        objc_msgSend(v39, "addObject:", v14);

        ++v10;
        v11 += 7;
      }
      while (v10 < *v5);
    }
    if (objc_msgSend(v8, "count", v35))
    {
      v43 = v36;
      v44 = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator logEntries:withGroupID:](v37, "logEntries:withGroupID:", v34, v36);

    }
    -[PLDisplayAgent setAZLSnapshotsEntries:](v37, "setAZLSnapshotsEntries:", -[PLDisplayAgent AZLSnapshotsEntries](v37, "AZLSnapshotsEntries") + *v5);
    free(v5);

  }
}

+ (BOOL)shouldLogAPL
{
  if (shouldLogAPL_onceToken != -1)
    dispatch_once(&shouldLogAPL_onceToken, &__block_literal_global_1332);
  return shouldLogAPL_result;
}

BOOL __30__PLDisplayAgent_shouldLogAPL__block_invoke()
{
  _BOOL8 result;

  shouldLogAPL_result = objc_msgSend(MEMORY[0x1E0D80020], "kPLDisplayClassIsOneOf:", 1002019, 1002020, 1002017, 1002018, 1002023, 1002022, 1002026, 1002027, 1002028, 1002031, 1002032, 1002041, 1002034, 1002035, 1002037, 1002038, 1002039,
                          0);
  result = (shouldLogAPL_result & 1) != 0
        || (objc_msgSend(MEMORY[0x1E0D80020], "hasCapability:", 0) & 1) != 0
        || +[PLDisplayAgent shouldModelPowerFromAPL](PLDisplayAgent, "shouldModelPowerFromAPL")
        || +[PLDisplayAgent shouldModelPowerFromIOMFB](PLDisplayAgent, "shouldModelPowerFromIOMFB");
  shouldLogAPL_result = result;
  return result;
}

+ (BOOL)shouldModelPowerFromAPL
{
  if (shouldModelPowerFromAPL_onceToken != -1)
    dispatch_once(&shouldModelPowerFromAPL_onceToken, &__block_literal_global_1333);
  return shouldModelPowerFromAPL_supportedTarget;
}

uint64_t __41__PLDisplayAgent_shouldModelPowerFromAPL__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D80020], "kPLDisplayClassIsOneOf:", 1002021, 1002024, 1002025, 0);
  shouldModelPowerFromAPL_supportedTarget = result;
  return result;
}

+ (BOOL)shouldModelPowerFromIOMFB
{
  if (shouldModelPowerFromIOMFB_onceToken != -1)
    dispatch_once(&shouldModelPowerFromIOMFB_onceToken, &__block_literal_global_1334);
  return shouldModelPowerFromIOMFB_supportedTarget;
}

uint64_t __43__PLDisplayAgent_shouldModelPowerFromIOMFB__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D80020], "kPLDisplayClassIsOneOf:", 1002030, 0);
  shouldModelPowerFromIOMFB_supportedTarget = result;
  return result;
}

- (void)updateLastForegroundAppAPL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a3;
  if (v4)
  {
    v20 = v4;
    objc_msgSend(v4, "objectForKey:", CFSTR("entry"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v20;
    if (v5)
    {
      objc_msgSend(v20, "objectForKey:", CFSTR("entry"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("AppRole"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToValue:", &unk_1EA1C1598);

      objc_msgSend(v20, "objectForKey:", CFSTR("entry"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("ScreenWeight"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToValue:", &unk_1EA1DAC18);

      objc_msgSend(v20, "objectForKey:", CFSTR("entry"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("bundleID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.lock-screen"));

      objc_msgSend(v20, "objectForKey:", CFSTR("entry"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("bundleID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.lock-screen.aod"));

      if (v8 && v11 || ((v14 | v17) & v11) == 1)
      {
        objc_msgSend(v20, "objectForKey:", CFSTR("entry"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", CFSTR("bundleID"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLDisplayAgent setLastForegroundAppAPL:](self, "setLastForegroundAppAPL:", v19);

      }
      else
      {
        -[PLDisplayAgent setLastForegroundAppAPL:](self, "setLastForegroundAppAPL:", 0);
      }
      v4 = v20;
    }
  }

}

- (void)logDisplayAPL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "iokitBacklight is nil; skipping power modeling", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)logDisplayAZL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "LogDisplayAZL  for entries %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleSBC
{
  if (objc_msgSend(MEMORY[0x1E0D80020], "hasCapability:", 8))
    -[PLDisplayAgent logDisplayAZL](self, "logDisplayAZL");
}

- (void)logAODChange
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "LogAODChange  for entries %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)modelDisplayPower:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD block[5];

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "hasCapability:", 0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Brightness"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uAmps"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    v12 = 0.0;
    if (v8 > 0.0)
    {
      -[PLDisplayAgent uAmpsToDisplayPower:](self, "uAmpsToDisplayPower:", v11);
      v12 = v13;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v14 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__PLDisplayAgent_modelDisplayPower___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v14;
      if (modelDisplayPower__defaultOnce != -1)
        dispatch_once(&modelDisplayPower__defaultOnce, block);
      if (modelDisplayPower__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("raw data %@, brightness %f, uAmps %f, power %f"), v4, *(_QWORD *)&v8, *(_QWORD *)&v11, *(_QWORD *)&v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent modelDisplayPower:]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 4528);

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 10, v5, v12);

  }
}

uint64_t __36__PLDisplayAgent_modelDisplayPower___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  modelDisplayPower__classDebugEnabled = result;
  return result;
}

- (void)qualifyDisplayPower:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  BOOL v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  __int16 v21;
  id v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Brightness"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PLDisplayAgent isFirstTimeModeling](self, "isFirstTimeModeling");
  v10 = (void *)MEMORY[0x1E0C9AA60];
  if (v9
    || (v11 = -[PLDisplayAgent wasDisplayOn](self, "wasDisplayOn"),
        v11 != -[PLDisplayAgent isDisplayOnNow](self, "isDisplayOnNow")))
  {
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PLDisplayAgent isDisplayOnNow](self, "isDisplayOnNow"))
      v13 = &unk_1EA1DCF88;
    else
      v13 = v10;
    objc_msgSend(v12, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 5, v13, v8);

    -[PLDisplayAgent setWasDisplayOn:](self, "setWasDisplayOn:", -[PLDisplayAgent isDisplayOnNow](self, "isDisplayOnNow"));
  }
  PLLogDisplay();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v19 = 134218754;
    v20 = v7;
    v21 = 2112;
    v22 = v4;
    v23 = 1024;
    v24 = v7 > 80.0;
    v25 = 1024;
    v26 = -[PLDisplayAgent isDisplayHighBrightness](self, "isDisplayHighBrightness");
    _os_log_debug_impl(&dword_1DA9D6000, v14, OS_LOG_TYPE_DEBUG, "brightness=%f, entry=%@, isHighBrightnessNow=%d, isHighBrightnessPrevious=%d", (uint8_t *)&v19, 0x22u);
  }

  if (-[PLDisplayAgent isFirstTimeModeling](self, "isFirstTimeModeling")
    || v7 > 80.0 != -[PLDisplayAgent isDisplayHighBrightness](self, "isDisplayHighBrightness"))
  {
    PLLogDisplay();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[PLDisplayAgent qualifyDisplayPower:].cold.1();

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v7 <= 80.0)
      v18 = v10;
    else
      v18 = &unk_1EA1DCFA0;
    objc_msgSend(v16, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 6, v18, v8, 80.0);

    -[PLDisplayAgent setIsDisplayHighBrightness:](self, "setIsDisplayHighBrightness:", v7 > 80.0);
  }
  -[PLDisplayAgent setIsFirstTimeModeling:](self, "setIsFirstTimeModeling:", 0);

}

- (double)uAmpsToDisplayPower:(double)a3
{
  double v3;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;

  v3 = 0.0;
  if (a3 > 0.0)
  {
    -[PLDisplayAgent displayPowerModel](self, "displayPowerModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("slope2"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8 * 0.0000001 * a3;
    -[PLDisplayAgent displayPowerModel](self, "displayPowerModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("slope"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12 * a3 + v9 * a3;
    -[PLDisplayAgent displayPowerModel](self, "displayPowerModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("intercept"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v3 = v13 + v16;

  }
  return fmax(v3, 0.0);
}

- (id)getIOMFBSubFrameMap
{
  if (getIOMFBSubFrameMap_onceToken != -1)
    dispatch_once(&getIOMFBSubFrameMap_onceToken, &__block_literal_global_1361);
  return (id)getIOMFBSubFrameMap_subFrameMap;
}

uint64_t __37__PLDisplayAgent_getIOMFBSubFrameMap__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)getIOMFBSubFrameMap_subFrameMap;
  getIOMFBSubFrameMap_subFrameMap = v0;

  objc_msgSend((id)getIOMFBSubFrameMap_subFrameMap, "setObject:forKeyedSubscript:", &unk_1EA1DACD8, CFSTR("subframes_0"));
  objc_msgSend((id)getIOMFBSubFrameMap_subFrameMap, "setObject:forKeyedSubscript:", &unk_1EA1DACE8, CFSTR("subframes_1"));
  objc_msgSend((id)getIOMFBSubFrameMap_subFrameMap, "setObject:forKeyedSubscript:", &unk_1EA1DACF8, CFSTR("subframes_2"));
  objc_msgSend((id)getIOMFBSubFrameMap_subFrameMap, "setObject:forKeyedSubscript:", &unk_1EA1DAD08, CFSTR("subframes_3"));
  objc_msgSend((id)getIOMFBSubFrameMap_subFrameMap, "setObject:forKeyedSubscript:", &unk_1EA1DAD18, CFSTR("subframes_4"));
  objc_msgSend((id)getIOMFBSubFrameMap_subFrameMap, "setObject:forKeyedSubscript:", &unk_1EA1DAD28, CFSTR("subframes_5"));
  objc_msgSend((id)getIOMFBSubFrameMap_subFrameMap, "setObject:forKeyedSubscript:", &unk_1EA1DAD38, CFSTR("subframes_6"));
  objc_msgSend((id)getIOMFBSubFrameMap_subFrameMap, "setObject:forKeyedSubscript:", &unk_1EA1DAD48, CFSTR("subframes_7"));
  objc_msgSend((id)getIOMFBSubFrameMap_subFrameMap, "setObject:forKeyedSubscript:", &unk_1EA1DAD58, CFSTR("subframes_8"));
  objc_msgSend((id)getIOMFBSubFrameMap_subFrameMap, "setObject:forKeyedSubscript:", &unk_1EA1DAD68, CFSTR("subframes_9"));
  return objc_msgSend((id)getIOMFBSubFrameMap_subFrameMap, "setObject:forKeyedSubscript:", &unk_1EA1DAD78, CFSTR("subframes_10"));
}

- (double)averageFrameRateFromIOMFBScanout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  if (v4)
  {
    -[PLDisplayAgent getIOMFBSubFrameMap](self, "getIOMFBSubFrameMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0.0;
    if (v5 && objc_msgSend(v5, "count") == 11)
    {
      v19 = 0;
      v20 = (double *)&v19;
      v21 = 0x2020000000;
      v22 = 0;
      v15 = 0;
      v16 = (double *)&v15;
      v17 = 0x2020000000;
      v18 = 0;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __51__PLDisplayAgent_averageFrameRateFromIOMFBScanout___block_invoke;
      v11[3] = &unk_1EA16DB00;
      v12 = v4;
      v13 = &v19;
      v14 = &v15;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);
      v8 = v16[3];
      if (v8 != 0.0)
      {
        v9 = v20[3];
        if (v9 != 0.0)
          v7 = 1.0 / (v8 / v9);
      }

      _Block_object_dispose(&v15, 8);
      _Block_object_dispose(&v19, 8);
    }

  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

double __51__PLDisplayAgent_averageFrameRateFromIOMFBScanout___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double result;

  v5 = (void *)a1[4];
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  if (v9 == 0.0)
    v10 = 0.0;
  else
    v10 = v9;
  *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = v10 + *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
  objc_msgSend(v6, "doubleValue");
  v12 = v11;

  v13 = *(_QWORD *)(a1[6] + 8);
  result = *(double *)(v13 + 24) + v10 * (1.0 / v12);
  *(double *)(v13 + 24) = result;
  return result;
}

- (void)modelDynamicDisplayPower:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  int v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  _QWORD v64[5];
  _QWORD block[5];

  v4 = a3;
  if (v4)
  {
    v62 = v4;
    objc_msgSend(v4, "objectForKey:", CFSTR("entry"));
    v5 = objc_claimAutoreleasedReturnValue();
    v63 = (void *)v5;
    if (v5)
    {
      v6 = (void *)v5;
      if (-[NSMutableArray count](self->_displayStateChanges, "count"))
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("timestamp"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "doubleValue");
        v9 = v8;

        if (v9 != 0.0)
        {
          objc_msgSend(v63, "objectForKey:", CFSTR("SampleTime"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "doubleValue");
          v12 = v11;

          -[PLDisplayAgent averageFrameRateFromIOMFBScanout:](self, "averageFrameRateFromIOMFBScanout:", v63);
          v14 = v13;
          -[PLDisplayAgent displayPowerModel](self, "displayPowerModel");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("dyn_slope"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 0.0;
          v18 = 0.0;
          if (v16)
          {
            -[PLDisplayAgent displayPowerModel](self, "displayPowerModel");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("dyn_slope"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "doubleValue");
            v18 = v21;

          }
          -[PLDisplayAgent displayPowerModel](self, "displayPowerModel");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("dyn_intercept"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            -[PLDisplayAgent displayPowerModel](self, "displayPowerModel");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("dyn_intercept"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "doubleValue");
            v17 = v26;

          }
          v27 = v9 - v12;

          if (v17 + v18 * v14 >= 0.0)
            v28 = v17 + v18 * v14;
          else
            v28 = 0.0;
          while (1)
          {
            if (!-[NSMutableArray count](self->_displayStateChanges, "count"))
              goto LABEL_50;
            v29 = (void *)MEMORY[0x1DF0A47AC]();
            v30 = -[NSMutableArray count](self->_displayStateChanges, "count");
            -[NSMutableArray objectAtIndexedSubscript:](self->_displayStateChanges, "objectAtIndexedSubscript:", 0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectAtIndex:", 0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "doubleValue");
            v34 = v33;

            if (v34 > v27)
              break;
            v34 = v27;
            v38 = v9;
            if (v30 < 2)
              goto LABEL_24;
            -[NSMutableArray objectAtIndexedSubscript:](self->_displayStateChanges, "objectAtIndexedSubscript:", 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectAtIndex:", 0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "doubleValue");
            v38 = v40;

            if (v38 > v27)
            {
              v34 = v27;
LABEL_20:
              if (v38 >= v9)
                v38 = v9;

              goto LABEL_24;
            }
            -[NSMutableArray removeObjectAtIndex:](self->_displayStateChanges, "removeObjectAtIndex:", 0);
            v49 = 2;
LABEL_33:

            objc_autoreleasePoolPop(v29);
            if (v49 == 3)
              goto LABEL_50;
          }
          if (v34 >= v9)
          {

            objc_autoreleasePoolPop(v29);
            goto LABEL_50;
          }
          if (v30 >= 2)
          {
            -[NSMutableArray objectAtIndexedSubscript:](self->_displayStateChanges, "objectAtIndexedSubscript:", 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectAtIndex:", 0);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "doubleValue");
            v38 = v37;

            goto LABEL_20;
          }
          v38 = v9;
LABEL_24:
          objc_msgSend(v31, "objectAtIndex:", 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v34);
          v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v38);
          if ((objc_msgSend(v35, "BOOLValue") & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", 56, v41, v42, 0.0);

          }
          if (objc_msgSend(v35, "BOOLValue"))
          {
            objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", 56, v41, v42, v28);

          }
          if (v30 < 2)
            goto LABEL_31;
          -[NSMutableArray objectAtIndexedSubscript:](self->_displayStateChanges, "objectAtIndexedSubscript:", 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectAtIndex:", 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "doubleValue");
          v48 = v47;

          if (v48 > v9)
          {
LABEL_31:
            v49 = 3;
          }
          else
          {
            -[NSMutableArray removeObjectAtIndex:](self->_displayStateChanges, "removeObjectAtIndex:", 0);
            v49 = 0;
          }

          goto LABEL_33;
        }
        goto LABEL_50;
      }
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_50;
      v57 = objc_opt_class();
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __43__PLDisplayAgent_modelDynamicDisplayPower___block_invoke_1400;
      v64[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v64[4] = v57;
      if (modelDynamicDisplayPower__defaultOnce_1398 != -1)
        dispatch_once(&modelDynamicDisplayPower__defaultOnce_1398, v64);
      if (!modelDynamicDisplayPower__classDebugEnabled_1399)
      {
LABEL_50:

        v4 = v62;
        goto LABEL_51;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: No display states recorded"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "lastPathComponent");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent modelDynamicDisplayPower:]");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "logMessage:fromFile:fromFunction:fromLineNumber:", v51, v60, v61, 4632);

      PLLogCommon();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    }
    else
    {
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_50;
      v50 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __43__PLDisplayAgent_modelDynamicDisplayPower___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v50;
      if (modelDynamicDisplayPower__defaultOnce != -1)
        dispatch_once(&modelDynamicDisplayPower__defaultOnce, block);
      if (!modelDynamicDisplayPower__classDebugEnabled)
        goto LABEL_50;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: No entry object in IOMFBScanout entry"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "lastPathComponent");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent modelDynamicDisplayPower:]");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "logMessage:fromFile:fromFunction:fromLineNumber:", v51, v54, v55, 4630);

      PLLogCommon();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    }

    goto LABEL_50;
  }
LABEL_51:

}

uint64_t __43__PLDisplayAgent_modelDynamicDisplayPower___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  modelDynamicDisplayPower__classDebugEnabled = result;
  return result;
}

uint64_t __43__PLDisplayAgent_modelDynamicDisplayPower___block_invoke_1400(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  modelDynamicDisplayPower__classDebugEnabled_1399 = result;
  return result;
}

- (double)calculatePowerFromAPL:(double)a3 withAvgRed:(double)a4 withAvgGreen:(double)a5 withAvgBlue:(double)a6
{
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  double v46;
  void *v47;
  void *v48;
  char isKindOfClass;
  void *v50;
  double v51;
  double v52;
  double v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  _QWORD block[5];

  -[NSDictionary objectForKeyedSubscript:](self->_displayPowerModel, "objectForKeyedSubscript:", CFSTR("static_power"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0.0;
  v11 = 0.0;
  if (v9)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_displayPowerModel, "objectForKeyedSubscript:", CFSTR("static_power"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v11 = v13;

  }
  -[NSDictionary objectForKeyedSubscript:](self->_displayPowerModel, "objectForKeyedSubscript:", CFSTR("touch_power"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_displayPowerModel, "objectForKeyedSubscript:", CFSTR("touch_power"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v10 = v16;

  }
  -[NSDictionary objectForKeyedSubscript:](self->_displayPowerModel, "objectForKeyedSubscript:", CFSTR("red_norm_slope"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0.0;
  v19 = 0.0;
  if (v17)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_displayPowerModel, "objectForKeyedSubscript:", CFSTR("red_norm_slope"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v19 = v21 * 0.000001 * a3;

  }
  -[NSDictionary objectForKeyedSubscript:](self->_displayPowerModel, "objectForKeyedSubscript:", CFSTR("green_norm_slope"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_displayPowerModel, "objectForKeyedSubscript:", CFSTR("green_norm_slope"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v18 = v24 * 0.000001 * a3;

  }
  -[NSDictionary objectForKeyedSubscript:](self->_displayPowerModel, "objectForKeyedSubscript:", CFSTR("blue_norm_slope"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_displayPowerModel, "objectForKeyedSubscript:", CFSTR("blue_norm_slope"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    v28 = v27 * 0.000001 * a3;

  }
  else
  {
    v28 = 0.0;
  }

  -[NSDictionary objectForKeyedSubscript:](self->_displayPowerModel, "objectForKeyedSubscript:", CFSTR("red_norm_intercept"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_displayPowerModel, "objectForKeyedSubscript:", CFSTR("red_norm_intercept"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "doubleValue");
    v32 = v19 + v31;

  }
  else
  {
    v32 = v19 + 0.0;
  }

  -[NSDictionary objectForKeyedSubscript:](self->_displayPowerModel, "objectForKeyedSubscript:", CFSTR("green_norm_intercept"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_displayPowerModel, "objectForKeyedSubscript:", CFSTR("green_norm_intercept"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "doubleValue");
    v36 = v18 + v35;

  }
  else
  {
    v36 = v18 + 0.0;
  }

  -[NSDictionary objectForKeyedSubscript:](self->_displayPowerModel, "objectForKeyedSubscript:", CFSTR("blue_norm_intercept"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_displayPowerModel, "objectForKeyedSubscript:", CFSTR("blue_norm_intercept"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "doubleValue");
    v40 = v28 + v39;

  }
  else
  {
    v40 = v28 + 0.0;
  }

  if (v32 >= 0.0)
    v41 = v32;
  else
    v41 = 0.0;
  if (v36 >= 0.0)
    v42 = v36;
  else
    v42 = 0.0;
  if (v40 >= 0.0)
    v43 = v40;
  else
    v43 = 0.0;
  if (v41 > 1.0)
    v41 = 1.0;
  if (v42 > 1.0)
    v42 = 1.0;
  if (v43 > 1.0)
    v43 = 1.0;
  v44 = v41 * a4 / 255.0 + v42 * a5 / 255.0 + v43 * a6 / 255.0;
  -[NSDictionary objectForKeyedSubscript:](self->_displayPowerModel, "objectForKeyedSubscript:", CFSTR("mnit_scale_values"));
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = 0.0;
  if (v45)
  {
    v47 = (void *)v45;
    -[NSDictionary objectForKeyedSubscript:](self->_displayPowerModel, "objectForKeyedSubscript:", CFSTR("mnit_scale_values"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_displayPowerModel, "objectForKeyedSubscript:", CFSTR("mnit_scale_values"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLUtilities scaledPowerBasedOnPoint:withPowerModel:](PLUtilities, "scaledPowerBasedOnPoint:withPowerModel:", v50, a3);
      v46 = v51;

    }
  }
  v52 = v44 * (v46 * a3);
  if (v52 > 5000.0 || v52 < 0.0)
    v52 = 0.0;
  v54 = v11 + v10 + v52;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v55 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__PLDisplayAgent_calculatePowerFromAPL_withAvgRed_withAvgGreen_withAvgBlue___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v55;
    if (calculatePowerFromAPL_withAvgRed_withAvgGreen_withAvgBlue__defaultOnce != -1)
      dispatch_once(&calculatePowerFromAPL_withAvgRed_withAvgGreen_withAvgBlue__defaultOnce, block);
    if (calculatePowerFromAPL_withAvgRed_withAvgGreen_withAvgBlue__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mNits: %f\tavgRed: %f\tavgGreen: %f\tavgBlue: %f\tnormalizedColorSum: %.2f\tPower: %.2f"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&v44, *(_QWORD *)&v54);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "lastPathComponent");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent calculatePowerFromAPL:withAvgRed:withAvgGreen:withAvgBlue:]");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "logMessage:fromFile:fromFunction:fromLineNumber:", v56, v59, v60, 4809);

      PLLogCommon();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  return v54;
}

uint64_t __76__PLDisplayAgent_calculatePowerFromAPL_withAvgRed_withAvgGreen_withAvgBlue___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  calculatePowerFromAPL_withAvgRed_withAvgGreen_withAvgBlue__classDebugEnabled = result;
  return result;
}

- (void)modelDisplayPowerFromIOMFB:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  uint64_t v32;
  _QWORD block[5];

  objc_msgSend(a3, "displayAPLStats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avgPower");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  v8 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PLDisplayAgent_modelDisplayPowerFromIOMFB___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (modelDisplayPowerFromIOMFB__defaultOnce != -1)
      dispatch_once(&modelDisplayPowerFromIOMFB__defaultOnce, block);
    if (modelDisplayPowerFromIOMFB__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Display power: %f"), *(_QWORD *)&v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent modelDisplayPowerFromIOMFB:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 4823);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v28 = v9;
    v29 = 3221225472;
    v30 = __45__PLDisplayAgent_modelDisplayPowerFromIOMFB___block_invoke_1433;
    v31 = &__block_descriptor_40_e5_v8__0lu32l8;
    v32 = objc_opt_class();
    if (modelDisplayPowerFromIOMFB__defaultOnce_1431 != -1)
      dispatch_once(&modelDisplayPowerFromIOMFB__defaultOnce_1431, &v28);
    if (modelDisplayPowerFromIOMFB__classDebugEnabled_1432)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      -[PLIOReportStats sampleTimePrevious](self->_displayIOReportStats, "sampleTimePrevious");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLIOReportStats sampleTime](self->_displayIOReportStats, "sampleTime");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("SampleTimePrevious: %@ sampleTime: %@,"), v17, v18, v28, v29, v30, v31, v32);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent modelDisplayPowerFromIOMFB:]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 4824);

      PLLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIOReportStats sampleTimePrevious](self->_displayIOReportStats, "sampleTimePrevious");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIOReportStats sampleTime](self->_displayIOReportStats, "sampleTime");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", 56, v26, v27, v7);

}

uint64_t __45__PLDisplayAgent_modelDisplayPowerFromIOMFB___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  modelDisplayPowerFromIOMFB__classDebugEnabled = result;
  return result;
}

uint64_t __45__PLDisplayAgent_modelDisplayPowerFromIOMFB___block_invoke_1433(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  modelDisplayPowerFromIOMFB__classDebugEnabled_1432 = result;
  return result;
}

- (void)modelDynamicDisplayPowerFromAPL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double displaymNits;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double realmNits;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double autobrightnessmNits;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD block[5];
  _QWORD v67[5];

  objc_msgSend(a3, "displayAPLStats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "avgRed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = 0.0;
      v8 = 0.0;
      if (-[PLDisplayAgent isDisplayOnNow](self, "isDisplayOnNow"))
      {
        displaymNits = self->_displaymNits;
        objc_msgSend(v5, "avgRed");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");
        v12 = v11;
        objc_msgSend(v5, "avgGreen");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        v15 = v14;
        objc_msgSend(v5, "avgBlue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        -[PLDisplayAgent calculatePowerFromAPL:withAvgRed:withAvgGreen:withAvgBlue:](self, "calculatePowerFromAPL:withAvgRed:withAvgGreen:withAvgBlue:", displaymNits, v12, v15, v17);
        v8 = v18;

        realmNits = self->_realmNits;
        objc_msgSend(v5, "avgRed");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "doubleValue");
        v22 = v21;
        objc_msgSend(v5, "avgGreen");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "doubleValue");
        v25 = v24;
        objc_msgSend(v5, "avgBlue");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "doubleValue");
        -[PLDisplayAgent calculatePowerFromAPL:withAvgRed:withAvgGreen:withAvgBlue:](self, "calculatePowerFromAPL:withAvgRed:withAvgGreen:withAvgBlue:", realmNits, v22, v25, v27);
        v29 = v28;

        autobrightnessmNits = self->_autobrightnessmNits;
        objc_msgSend(v5, "avgRed");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "doubleValue");
        v33 = v32;
        objc_msgSend(v5, "avgGreen");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "doubleValue");
        v36 = v35;
        objc_msgSend(v5, "avgBlue");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "doubleValue");
        -[PLDisplayAgent calculatePowerFromAPL:withAvgRed:withAvgGreen:withAvgBlue:](self, "calculatePowerFromAPL:withAvgRed:withAvgGreen:withAvgBlue:", autobrightnessmNits, v33, v36, v38);
        v40 = v39;

        v7 = v29 - v40;
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v41 = objc_opt_class();
          v67[0] = MEMORY[0x1E0C809B0];
          v67[1] = 3221225472;
          v67[2] = __50__PLDisplayAgent_modelDynamicDisplayPowerFromAPL___block_invoke;
          v67[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v67[4] = v41;
          if (modelDynamicDisplayPowerFromAPL__defaultOnce != -1)
            dispatch_once(&modelDynamicDisplayPowerFromAPL__defaultOnce, v67);
          if (modelDynamicDisplayPowerFromAPL__classDebugEnabled)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("displayPower: %f\trealPower: %f\tvirtualPower: %f\tsavedPower: %f"), *(_QWORD *)&v8, *(_QWORD *)&v29, *(_QWORD *)&v40, v29 - v40);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "lastPathComponent");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent modelDynamicDisplayPowerFromAPL:]");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "logMessage:fromFile:fromFunction:fromLineNumber:", v42, v45, v46, 4847);

            PLLogCommon();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

          }
        }
      }
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v48 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __50__PLDisplayAgent_modelDynamicDisplayPowerFromAPL___block_invoke_1440;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v48;
        if (modelDynamicDisplayPowerFromAPL__defaultOnce_1438 != -1)
          dispatch_once(&modelDynamicDisplayPowerFromAPL__defaultOnce_1438, block);
        if (modelDynamicDisplayPowerFromAPL__classDebugEnabled_1439)
        {
          v49 = (void *)MEMORY[0x1E0CB3940];
          -[PLIOReportStats sampleTimePrevious](self->_displayIOReportStats, "sampleTimePrevious");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLIOReportStats sampleTime](self->_displayIOReportStats, "sampleTime");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "stringWithFormat:", CFSTR("SampleTimePrevious: %@ sampleTime: %@,"), v50, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          v53 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "lastPathComponent");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDisplayAgent modelDynamicDisplayPowerFromAPL:]");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "logMessage:fromFile:fromFunction:fromLineNumber:", v52, v55, v56, 4849);

          PLLogCommon();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLIOReportStats sampleTimePrevious](self->_displayIOReportStats, "sampleTimePrevious");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLIOReportStats sampleTime](self->_displayIOReportStats, "sampleTime");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", 56, v59, v60, v8);

      if (+[PLDisplayAgent shouldLogALSPowerSaved](PLDisplayAgent, "shouldLogALSPowerSaved"))
      {
        +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ALSPowerSaved"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_alloc(MEMORY[0x1E0D7FFB0]);
        -[PLIOReportStats sampleTimePrevious](self->_displayIOReportStats, "sampleTimePrevious");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = (void *)objc_msgSend(v62, "initWithEntryKey:withDate:", v61, v63);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setObject:forKeyedSubscript:", v65, CFSTR("Power"));

        -[PLOperator logEntry:](self, "logEntry:", v64);
      }
    }
  }

}

uint64_t __50__PLDisplayAgent_modelDynamicDisplayPowerFromAPL___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  modelDynamicDisplayPowerFromAPL__classDebugEnabled = result;
  return result;
}

uint64_t __50__PLDisplayAgent_modelDynamicDisplayPowerFromAPL___block_invoke_1440(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  modelDynamicDisplayPowerFromAPL__classDebugEnabled_1439 = result;
  return result;
}

- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;

  v5 = a3;
  objc_msgSend(a4, "timeIntervalSince1970");
  v7 = v6;
  objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("Display"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqualToString:", v8);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is NULL OR %@<(SELECT max(%@) FROM '%@' WHERE %@<%f)"), CFSTR("timestamp"), CFSTR("timestamp"), CFSTR("timestamp"), v5, CFSTR("timestamp"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)dcpSubFrameMap
{
  int v2;
  int v3;
  id v4;
  _QWORD block[4];
  int v7;
  char v8;

  if (objc_msgSend(MEMORY[0x1E0D80020], "hasDCP"))
  {
    v2 = MGGetBoolAnswer();
    if (v2)
      v3 = 240;
    else
      v3 = 60;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__PLDisplayAgent_dcpSubFrameMap__block_invoke;
    block[3] = &__block_descriptor_37_e5_v8__0l;
    v7 = v3;
    v8 = v2;
    if (dcpSubFrameMap_onceToken != -1)
      dispatch_once(&dcpSubFrameMap_onceToken, block);
    v4 = (id)dcpSubFrameMap_subFrameMap;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

void __32__PLDisplayAgent_dcpSubFrameMap__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int i;
  void *v5;
  int v6;
  BOOL v7;
  double v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 25);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)dcpSubFrameMap_subFrameMap;
  dcpSubFrameMap_subFrameMap = v2;

  for (i = 1; i != 26; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("subframes(%d)"), (i - 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_DWORD *)(a1 + 32) / i;
    v7 = v6 >= 10 || *(_BYTE *)(a1 + 36) == 0;
    v8 = (double)v6;
    if (!v7)
      v8 = 10.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)dcpSubFrameMap_subFrameMap, "setObject:forKeyedSubscript:", v9, v5);

  }
}

- (PLIOKitOperatorComposition)iokitBacklight
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (PLIOKitOperatorComposition)iokitBacklightDCP
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (PLIOKitOperatorComposition)iokitBacklightControl
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (PLIOKitOperatorComposition)iokitDisplay
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (PLIOKitOperatorComposition)iokitTouch
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (PLIOKitOperatorComposition)iokitKeyboardBrightness
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (PLIOKitOperatorComposition)iokitLCD
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (BrightnessSystemClient)brightnessSystemClient
{
  return (BrightnessSystemClient *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBrightnessSystemClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (CBAdaptationClient)colorAdaptationClient
{
  return (CBAdaptationClient *)objc_getProperty(self, a2, 136, 1);
}

- (void)setColorAdaptationClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PLTimer)backlightFilterTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 144, 1);
}

- (void)setBacklightFilterTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (PLTimer)dcpTimeoffsetCalibTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDcpTimeoffsetCalibTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (PLTimer)bluelightFilterTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 160, 1);
}

- (void)setBluelightFilterTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (PLTimer)uAmpsFilterTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 168, 1);
}

- (void)setUAmpsFilterTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (PLTimer)alsLuxFilterTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAlsLuxFilterTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (PLTimer)AZLSnapshotsTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAZLSnapshotsTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSMutableDictionary)pendingBacklightEntry
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (void)setPendingBacklightEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSDate)pendingBacklightEntryDate
{
  return (NSDate *)objc_getProperty(self, a2, 200, 1);
}

- (void)setPendingBacklightEntryDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (double)currAFKSystemTimestamp
{
  return self->_currAFKSystemTimestamp;
}

- (void)setCurrAFKSystemTimestamp:(double)a3
{
  self->_currAFKSystemTimestamp = a3;
}

- (double)currMonoTimestamp
{
  return self->_currMonoTimestamp;
}

- (void)setCurrMonoTimestamp:(double)a3
{
  self->_currMonoTimestamp = a3;
}

- (double)currAFKSystemTimeOffset
{
  return self->_currAFKSystemTimeOffset;
}

- (void)setCurrAFKSystemTimeOffset:(double)a3
{
  self->_currAFKSystemTimeOffset = a3;
}

- (unint64_t)pendingALSLux
{
  return self->_pendingALSLux;
}

- (void)setPendingALSLux:(unint64_t)a3
{
  self->_pendingALSLux = a3;
}

- (unint64_t)lastALSLux
{
  return self->_lastALSLux;
}

- (void)setLastALSLux:(unint64_t)a3
{
  self->_lastALSLux = a3;
}

- (NSDate)pendingALSLuxEntryDate
{
  return (NSDate *)objc_getProperty(self, a2, 248, 1);
}

- (void)setPendingALSLuxEntryDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (BOOL)alsOn
{
  return self->_alsOn;
}

- (void)setAlsOn:(BOOL)a3
{
  self->_alsOn = a3;
}

- (double)lastALSPowerSaved
{
  return self->_lastALSPowerSaved;
}

- (void)setLastALSPowerSaved:(double)a3
{
  self->_lastALSPowerSaved = a3;
}

- (BOOL)userTouch
{
  return self->_userTouch;
}

- (void)setUserTouch:(BOOL)a3
{
  self->_userTouch = a3;
}

- (NSDate)userTouchDownTime
{
  return (NSDate *)objc_getProperty(self, a2, 264, 1);
}

- (void)setUserTouchDownTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (NSDictionary)displayPowerModel
{
  return (NSDictionary *)objc_getProperty(self, a2, 272, 1);
}

- (__IOHIDEventSystemClient)touchHIDClientRef
{
  return self->_touchHIDClientRef;
}

- (void)setTouchHIDClientRef:(__IOHIDEventSystemClient *)a3
{
  self->_touchHIDClientRef = a3;
}

- (__IOHIDEventSystemClient)ambientLightSensorHIDClientRef
{
  return self->_ambientLightSensorHIDClientRef;
}

- (void)setAmbientLightSensorHIDClientRef:(__IOHIDEventSystemClient *)a3
{
  self->_ambientLightSensorHIDClientRef = a3;
}

- (BOOL)alsPluginKeyRegistered
{
  return self->_alsPluginKeyRegistered;
}

- (void)setAlsPluginKeyRegistered:(BOOL)a3
{
  self->_alsPluginKeyRegistered = a3;
}

- (PLXPCListenerOperatorComposition)multitouchXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 296, 1);
}

- (void)setMultitouchXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (BOOL)isMultitouchLoggingEnabled
{
  return self->_isMultitouchLoggingEnabled;
}

- (void)setIsMultitouchLoggingEnabled:(BOOL)a3
{
  self->_isMultitouchLoggingEnabled = a3;
}

- (PLMonotonicTimer)logLastALSPowerSavedTimer
{
  return (PLMonotonicTimer *)objc_getProperty(self, a2, 304, 1);
}

- (void)setLogLastALSPowerSavedTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (PLEntry)bluelightStatusEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 312, 1);
}

- (void)setBluelightStatusEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (PLEventForwardDisplayEntry)uAmpsEntry
{
  return (PLEventForwardDisplayEntry *)objc_getProperty(self, a2, 320, 1);
}

- (void)setUAmpsEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (BOOL)isMIEActive
{
  return self->_isMIEActive;
}

- (void)setIsMIEActive:(BOOL)a3
{
  self->_isMIEActive = a3;
}

- (BOOL)firstEntryOnInit
{
  return self->_firstEntryOnInit;
}

- (void)setFirstEntryOnInit:(BOOL)a3
{
  self->_firstEntryOnInit = a3;
}

- (BOOL)wasDisplayOn
{
  return self->_wasDisplayOn;
}

- (void)setWasDisplayOn:(BOOL)a3
{
  self->_wasDisplayOn = a3;
}

- (BOOL)isDisplayOnNow
{
  return self->_isDisplayOnNow;
}

- (void)setIsDisplayOnNow:(BOOL)a3
{
  self->_isDisplayOnNow = a3;
}

- (BOOL)isDisplayHighBrightness
{
  return self->_isDisplayHighBrightness;
}

- (void)setIsDisplayHighBrightness:(BOOL)a3
{
  self->_isDisplayHighBrightness = a3;
}

- (BOOL)isFirstTimeModeling
{
  return self->_isFirstTimeModeling;
}

- (void)setIsFirstTimeModeling:(BOOL)a3
{
  self->_isFirstTimeModeling = a3;
}

- (PLEntryNotificationOperatorComposition)IOMFBScanoutNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 328, 1);
}

- (void)setIOMFBScanoutNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (PLEntryNotificationOperatorComposition)ApplicationNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 336, 1);
}

- (void)setApplicationNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (PLEntryNotificationOperatorComposition)aodstateChangedNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 344, 1);
}

- (void)setAodstateChangedNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (PLNSNotificationOperatorComposition)thermalMonitorListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 352, 1);
}

- (void)setThermalMonitorListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (NSMutableArray)displayStateChanges
{
  return (NSMutableArray *)objc_getProperty(self, a2, 360, 1);
}

- (void)setDisplayStateChanges:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (PLDisplayIOReportStats)displayIOReportStats
{
  return (PLDisplayIOReportStats *)objc_getProperty(self, a2, 368, 1);
}

- (void)setDisplayIOReportStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (PLDisplayIOReportStats)displayIOReportAZLStats
{
  return (PLDisplayIOReportStats *)objc_getProperty(self, a2, 376, 1);
}

- (void)setDisplayIOReportAZLStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (PLDisplayIOReportStats)displayIOReportAZLSnapshots
{
  return (PLDisplayIOReportStats *)objc_getProperty(self, a2, 384, 1);
}

- (void)setDisplayIOReportAZLSnapshots:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (BOOL)ShouldLogAmbient
{
  return self->_ShouldLogAmbient;
}

- (void)setShouldLogAmbient:(BOOL)a3
{
  self->_ShouldLogAmbient = a3;
}

- (PLDisplayIOReportAODStats)displayIOReportAODStats
{
  return (PLDisplayIOReportAODStats *)objc_getProperty(self, a2, 392, 1);
}

- (void)setDisplayIOReportAODStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (int)lastScreenState
{
  return self->_lastScreenState;
}

- (void)setLastScreenState:(int)a3
{
  self->_lastScreenState = a3;
}

- (int64_t)AZLSnapshotsEntries
{
  return self->_AZLSnapshotsEntries;
}

- (void)setAZLSnapshotsEntries:(int64_t)a3
{
  self->_AZLSnapshotsEntries = a3;
}

- (double)displayLux
{
  return self->_displayLux;
}

- (void)setDisplayLux:(double)a3
{
  self->_displayLux = a3;
}

- (double)displaymNits
{
  return self->_displaymNits;
}

- (void)setDisplaymNits:(double)a3
{
  self->_displaymNits = a3;
}

- (float)realmNits
{
  return self->_realmNits;
}

- (void)setRealmNits:(float)a3
{
  self->_realmNits = a3;
}

- (float)autobrightnessmNits
{
  return self->_autobrightnessmNits;
}

- (void)setAutobrightnessmNits:(float)a3
{
  self->_autobrightnessmNits = a3;
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 424, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (NSString)lastForegroundAppAPL
{
  return (NSString *)objc_getProperty(self, a2, 432, 1);
}

- (void)setLastForegroundAppAPL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (NSMutableArray)afkEndpoints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 440, 1);
}

- (void)setAfkEndpoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (double)lastBuiltinDisplayLux
{
  return self->_lastBuiltinDisplayLux;
}

- (void)setLastBuiltinDisplayLux:(double)a3
{
  self->_lastBuiltinDisplayLux = a3;
}

- (double)lastBuiltinDisplayBrightness
{
  return self->_lastBuiltinDisplayBrightness;
}

- (void)setLastBuiltinDisplayBrightness:(double)a3
{
  self->_lastBuiltinDisplayBrightness = a3;
}

- (double)lastBuiltinDisplaySliderValue
{
  return self->_lastBuiltinDisplaySliderValue;
}

- (void)setLastBuiltinDisplaySliderValue:(double)a3
{
  self->_lastBuiltinDisplaySliderValue = a3;
}

- (double)lastBuiltinDisplayTime
{
  return self->_lastBuiltinDisplayTime;
}

- (void)setLastBuiltinDisplayTime:(double)a3
{
  self->_lastBuiltinDisplayTime = a3;
}

- (KeyboardBrightnessClient)kbClient
{
  return (KeyboardBrightnessClient *)objc_getProperty(self, a2, 480, 1);
}

- (void)setKbClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
}

- (PLTimer)keyboardBrightnessFilterTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 488, 1);
}

- (void)setKeyboardBrightnessFilterTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 488);
}

- (double)pendingKeyboardBrightnessValue
{
  return self->_pendingKeyboardBrightnessValue;
}

- (void)setPendingKeyboardBrightnessValue:(double)a3
{
  self->_pendingKeyboardBrightnessValue = a3;
}

- (NSDate)pendingKeyboardBrightnessDate
{
  return (NSDate *)objc_getProperty(self, a2, 504, 1);
}

- (void)setPendingKeyboardBrightnessDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 504);
}

- (__IOMobileFramebuffer)frameBuffer
{
  return self->_frameBuffer;
}

- (void)setFrameBuffer:(__IOMobileFramebuffer *)a3
{
  self->_frameBuffer = a3;
}

- (int64_t)lastRearLuxValue
{
  return self->_lastRearLuxValue;
}

- (void)setLastRearLuxValue:(int64_t)a3
{
  self->_lastRearLuxValue = a3;
}

- (BOOL)supportsFinalBrightnessCommit
{
  return self->_supportsFinalBrightnessCommit;
}

- (void)setSupportsFinalBrightnessCommit:(BOOL)a3
{
  self->_supportsFinalBrightnessCommit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingKeyboardBrightnessDate, 0);
  objc_storeStrong((id *)&self->_keyboardBrightnessFilterTimer, 0);
  objc_storeStrong((id *)&self->_kbClient, 0);
  objc_storeStrong((id *)&self->_afkEndpoints, 0);
  objc_storeStrong((id *)&self->_lastForegroundAppAPL, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
  objc_storeStrong((id *)&self->_displayIOReportAODStats, 0);
  objc_storeStrong((id *)&self->_displayIOReportAZLSnapshots, 0);
  objc_storeStrong((id *)&self->_displayIOReportAZLStats, 0);
  objc_storeStrong((id *)&self->_displayIOReportStats, 0);
  objc_storeStrong((id *)&self->_displayStateChanges, 0);
  objc_storeStrong((id *)&self->_thermalMonitorListener, 0);
  objc_storeStrong((id *)&self->_aodstateChangedNotification, 0);
  objc_storeStrong((id *)&self->_ApplicationNotification, 0);
  objc_storeStrong((id *)&self->_IOMFBScanoutNotification, 0);
  objc_storeStrong((id *)&self->_uAmpsEntry, 0);
  objc_storeStrong((id *)&self->_bluelightStatusEntry, 0);
  objc_storeStrong((id *)&self->_logLastALSPowerSavedTimer, 0);
  objc_storeStrong((id *)&self->_multitouchXPCListener, 0);
  objc_storeStrong((id *)&self->_displayPowerModel, 0);
  objc_storeStrong((id *)&self->_userTouchDownTime, 0);
  objc_storeStrong((id *)&self->_pendingALSLuxEntryDate, 0);
  objc_storeStrong((id *)&self->_pendingBacklightEntryDate, 0);
  objc_storeStrong((id *)&self->_pendingBacklightEntry, 0);
  objc_storeStrong((id *)&self->_AZLSnapshotsTimer, 0);
  objc_storeStrong((id *)&self->_alsLuxFilterTimer, 0);
  objc_storeStrong((id *)&self->_uAmpsFilterTimer, 0);
  objc_storeStrong((id *)&self->_bluelightFilterTimer, 0);
  objc_storeStrong((id *)&self->_dcpTimeoffsetCalibTimer, 0);
  objc_storeStrong((id *)&self->_backlightFilterTimer, 0);
  objc_storeStrong((id *)&self->_colorAdaptationClient, 0);
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
  objc_storeStrong((id *)&self->_iokitLCD, 0);
  objc_storeStrong((id *)&self->_iokitKeyboardBrightness, 0);
  objc_storeStrong((id *)&self->_iokitTouch, 0);
  objc_storeStrong((id *)&self->_iokitDisplay, 0);
  objc_storeStrong((id *)&self->_iokitBacklightControl, 0);
  objc_storeStrong((id *)&self->_iokitBacklightDCP, 0);
  objc_storeStrong((id *)&self->_iokitBacklight, 0);
}

- (void)init
{
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4[0] = 67109120;
  v4[1] = objc_msgSend(a1, "supportsFinalBrightnessCommit");
  OUTLINED_FUNCTION_7_2(&dword_1DA9D6000, a2, v3, "Copied kCBSupportsFinalBrightnessCommit value: %d", (uint8_t *)v4);
  OUTLINED_FUNCTION_1();
}

void __22__PLDisplayAgent_init__block_invoke_989_cold_1(id *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  v3 = (void *)MEMORY[0x1E0D80088];
  objc_msgSend(*a1, "backlightFilterTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fireDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formattedStringForDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80088], "formattedStringForDate:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_10_2(&dword_1DA9D6000, v8, v9, "Stop backlight entry filter timer timer.fireDate=%@ fireDate=%@", v10, v11, v12, v13, v14);

}

void __22__PLDisplayAgent_init__block_invoke_989_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Setting pending backlight entry and date as nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __22__PLDisplayAgent_init__block_invoke_989_cold_3(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  objc_msgSend(*a1, "pendingBacklightEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D80088];
  objc_msgSend(*a1, "pendingBacklightEntryDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formattedStringForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_10_2(&dword_1DA9D6000, v6, v7, "BackLight entry not nill. Writing backlight entry:%@ with date: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_8();
}

void __22__PLDisplayAgent_init__block_invoke_2_1008_cold_1(id *a1, NSObject *a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  double v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "currMonoTimestamp");
  v7 = v6;
  objc_msgSend(*a1, "currAFKSystemTimestamp");
  v9 = 134218496;
  v10 = a3;
  v11 = 2048;
  v12 = v7;
  v13 = 2048;
  v14 = v8;
  _os_log_debug_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_DEBUG, "New AFK time offset: %f, from mono timestamp: %f, afk time: %f", (uint8_t *)&v9, 0x20u);
}

void __22__PLDisplayAgent_init__block_invoke_2_1008_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Canceling AFK time calibration timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __46__PLDisplayAgent_initTaskOperatorDependancies__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "AZLSnapShot table is full", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __42__PLDisplayAgent_initOperatorDependancies__block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Got callback for logAODChange: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleAFKInterfaceIOServiceCallback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "Error trying to get property IO object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)handleAFKInterfaceIOServiceCallback:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "Error getting AFK interface", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)handleAFKInterfaceIOServiceCallback:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "IO object property is not dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1DA9D6000, v0, OS_LOG_TYPE_ERROR, "Error unserializing buffer: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Final data to be logged: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "Msg is not a dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "Input buffer is empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Received msg at timestamp: %llu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)logEventPointDisplayBacklightWithState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "IOMFB received power state: %llu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initAODState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "initial screen state received by AOD is %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)logAODState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "AOD state we log is %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)logAODState:(uint64_t)a3 .cold.2(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_7_2(&dword_1DA9D6000, a2, a3, "AOD state received is %d", (uint8_t *)v3);
  OUTLINED_FUNCTION_6();
}

void __62__PLDisplayAgent_backlight_didCompleteUpdateToState_forEvent___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a2, a3, "screen state received by AOD is %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)logEventForwardDisplayWithRawData:withDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Event Forward display entry: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)logEventForwardDisplayWithRawData:(void *)a1 withDate:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("lux"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v6 = 134217984;
  v7 = v4;
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v5, "Value for Lux: %f", (uint8_t *)&v6);

  OUTLINED_FUNCTION_8_0();
}

- (void)logEventForwardLuxStats:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "empty payload for LuxStats", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)logEventForwardLuxStats:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "LuxStats gain changed, using last valid RearLux value %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)logEventBackwardRampInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "empty payload for RampInfo", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)logEventBackwardCurveUpdate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "empty payload for CurveUpdate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)logEventBackwardCurveUpdate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "CurveUpdate is %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)logEventBackwardALSSamplesBeforeWake:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "empty payload for ALSSamplesBeforeWake", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)logEventBackwardAmbientLight:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "empty payload for AmbientLight", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1236_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "We Recieved notification for AODRampTelemetry: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1237_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "We Recieved notification for AODCurveUpdate: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1238_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "We Recieved notification for AODWakeFromALSThreshold: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1239_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "We Recieved notification for CBAmbientLight: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1240_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a2, a3, "@kCBFinalBrightnessCommit: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1241_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D80088], "formattedStringForDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "Start backlight entry filter timer fireDate=%@", v5);

  OUTLINED_FUNCTION_8_0();
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1241_cold_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  objc_msgSend(*a1, "pendingBacklightEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D80088];
  objc_msgSend(*a1, "pendingBacklightEntryDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formattedStringForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_10_2(&dword_1DA9D6000, v6, v7, "Pending Backlight entry: %@, %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_8();
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1272_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Received notification for CBrLuxStats: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)__FrameBufferEventCallback:(uint64_t)a3 .cold.1(int *a1, NSObject *a2, uint64_t a3)
{
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4[0] = 67109120;
  v4[1] = v3;
  OUTLINED_FUNCTION_7_2(&dword_1DA9D6000, a2, a3, "Number of data entries retrieved %d \n", (uint8_t *)v4);
  OUTLINED_FUNCTION_6();
}

- (void)qualifyDisplayPower:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "creating high brightness qualification event", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
