@implementation PLScreenStateAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLScreenStateAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("BacklightEvent");
  objc_msgSend(a1, "entryEventPointBacklightEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventPointBacklightEvent
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
  v13 = &unk_1EA1DA6C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("TransitionReason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("BacklightLevel");
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

+ (id)entryEventForwardDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("ScreenState");
  objc_msgSend(a1, "entryEventForwardScreenState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("WindowMode");
  v8[0] = v3;
  objc_msgSend(a1, "entryEventForwardWindowMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryEventForwardScreenState
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
  v22[0] = &unk_1EA1DA6D8;
  v22[1] = MEMORY[0x1E0C9AAB0];
  v21[2] = *MEMORY[0x1E0D80250];
  v22[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E0D802F0];
  v19[0] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat_withBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v19[1] = CFSTR("ScreenWeight");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_RealFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  v19[2] = CFSTR("AppRole");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v4;
  v19[3] = CFSTR("Display");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v6;
  v19[4] = CFSTR("Level");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v8;
  v19[5] = CFSTR("Orientation");
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

+ (id)entryEventForwardWindowMode
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
  if (!objc_msgSend(MEMORY[0x1E0D80020], "isiPad"))
    return MEMORY[0x1E0C9AA70];
  v18[0] = *MEMORY[0x1E0D80298];
  v16 = *MEMORY[0x1E0D80318];
  v17 = &unk_1EA1DA6C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("displayType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_StringFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("zoomLevel");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("windowingMode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("canvasRatio");
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

+ (id)entryEventBackwardDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("IconDragging");
  objc_msgSend(a1, "entryEventBackwardDefinitionIconDragging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("AlwaysOnEnableState");
  objc_msgSend(a1, "entryEventBackwardDefinitionAlwaysOnEnableState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("BacklightStateChange");
  objc_msgSend(a1, "entryEventBackwardDefinitionBacklightStateChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("FlipbookStatistics");
  objc_msgSend(a1, "entryEventBackwardDefinitionFlipbookStatistics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)GetBacklightState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("off")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("suppressed")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("inactiveOnFlipbook")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("inactiveOnLiveFlipbook")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("inactiveOnLive")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("activeDimmed")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("active")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 7;
  }

  return v4;
}

+ (id)entryEventBackwardDefinitionIconDragging
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
  v11 = &unk_1EA1DA6C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("Duration");
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

+ (id)entryEventBackwardDefinitionAlwaysOnEnableState
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
  if (!objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
    return MEMORY[0x1E0C9AA70];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80340];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1EA1DA6E8;
  v18[1] = &unk_1EA1BFF90;
  v17[2] = *MEMORY[0x1E0D80338];
  v18[2] = &unk_1EA1DA6F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("alwaysOnResolvedEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("alwaysOnEnabledSetting");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("lowPowerMode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_BoolFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("focusMode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_BoolFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionBacklightStateChange
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
  if ((objc_msgSend(MEMORY[0x1E0D80020], "hasAOD") & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 102040) & 1) == 0
    && !objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 102041))
  {
    return MEMORY[0x1E0C9AA70];
  }
  v18[0] = *MEMORY[0x1E0D80298];
  v16 = *MEMORY[0x1E0D80318];
  v17 = &unk_1EA1DA6E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("explanation");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("suppressionChangeType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("suppressionReasons");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
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

+ (id)entryEventBackwardDefinitionFlipbookStatistics
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
  _QWORD v54[24];
  _QWORD v55[24];
  uint64_t v56;
  void *v57;
  _QWORD v58[2];
  _QWORD v59[4];

  v59[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
    return MEMORY[0x1E0C9AA70];
  v58[0] = *MEMORY[0x1E0D80298];
  v56 = *MEMORY[0x1E0D80318];
  v57 = &unk_1EA1DA6C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v53;
  v58[1] = *MEMORY[0x1E0D802F0];
  v54[0] = CFSTR("invalidatedFramesUpTo2mStale");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "commonTypeDict_IntegerFormat");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v51;
  v54[1] = CFSTR("invalidatedFramesUpTo3mStale");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v49;
  v54[2] = CFSTR("invalidatedFramesUpTo4mStale");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "commonTypeDict_IntegerFormat");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v47;
  v54[3] = CFSTR("invalidatedFramesUpTo5mStale");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "commonTypeDict_IntegerFormat");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v45;
  v54[4] = CFSTR("invalidatedFramesUpTo6mStale");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "commonTypeDict_IntegerFormat");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v43;
  v54[5] = CFSTR("discardedFramesUpTo2mStale");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "commonTypeDict_IntegerFormat");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v41;
  v54[6] = CFSTR("discardedFramesUpTo3mStale");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "commonTypeDict_IntegerFormat");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v55[6] = v39;
  v54[7] = CFSTR("discardedFramesUpTo4mStale");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "commonTypeDict_IntegerFormat");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v55[7] = v37;
  v54[8] = CFSTR("discardedFramesUpTo5mStale");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "commonTypeDict_IntegerFormat");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v55[8] = v35;
  v54[9] = CFSTR("discardedFramesUpTo6mStale");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v55[9] = v33;
  v54[10] = CFSTR("renderedFramesLessThan1Min");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_IntegerFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v55[10] = v31;
  v54[11] = CFSTR("renderedFrames1to2Min");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v55[11] = v29;
  v54[12] = CFSTR("renderedFrames2to3Min");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v55[12] = v27;
  v54[13] = CFSTR("renderedFrames3to4Min");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v55[13] = v25;
  v54[14] = CFSTR("renderedFrames4to5Min");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v55[14] = v23;
  v54[15] = CFSTR("renderedFrames5to6Min");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v55[15] = v21;
  v54[16] = CFSTR("renderedFramesMoreThan6Min");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v55[16] = v19;
  v54[17] = CFSTR("renderedFrameCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v55[17] = v17;
  v54[18] = CFSTR("renderedPartialMinuteCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v55[18] = v15;
  v54[19] = CFSTR("millisecondsDisplayOff");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v55[19] = v13;
  v54[20] = CFSTR("millisecondsDisplayOn");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v55[20] = v3;
  v54[21] = CFSTR("millisecondsDisplayDimmed");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v55[21] = v5;
  v54[22] = CFSTR("millisecondsShowingAOT");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v55[22] = v7;
  v54[23] = CFSTR("millisecondsSuppressed");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v55[23] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("WidgetAdditionAnimation");
  objc_msgSend(a1, "entryAggregateDefinitionWidgetAdditionAnimation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("WidgetFlipAnimation");
  v8[0] = v3;
  objc_msgSend(a1, "entryAggregateDefinitionWidgetFlipAnimation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryAggregateDefinitionWidgetAdditionAnimation
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80330];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1EA1DA6C8;
  v18[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15 = CFSTR("Count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  v19[2] = *MEMORY[0x1E0D80228];
  v13 = &unk_1EA1DA708;
  v11 = *MEMORY[0x1E0D80220];
  v12 = &unk_1EA1DA6F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = *MEMORY[0x1E0D80238];
  v20[2] = v8;
  v20[3] = &unk_1EA1DBC38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryAggregateDefinitionWidgetFlipAnimation
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80330];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1EA1DA6C8;
  v18[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15 = CFSTR("Count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  v19[2] = *MEMORY[0x1E0D80228];
  v13 = &unk_1EA1DA708;
  v11 = *MEMORY[0x1E0D80220];
  v12 = &unk_1EA1DA6F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = *MEMORY[0x1E0D80238];
  v20[2] = v8;
  v20[3] = &unk_1EA1DBC50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryAggregateDefinitionForeground
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLScreenStateAgent)init
{
  PLScreenStateAgent *v3;
  PLScreenStateAgent *v4;
  PLScreenStateAgent *v5;
  uint64_t v6;
  PLScreenStateAgent *v7;
  void *v8;
  id *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id *v23;
  _QWORD v24[4];
  PLScreenStateAgent *v25;
  objc_super v26;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0
    || +[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    v3 = 0;
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)PLScreenStateAgent;
    v4 = -[PLAgent init](&v26, sel_init);
    v5 = v4;
    if (v4)
    {
      v6 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __26__PLScreenStateAgent_init__block_invoke_2;
      v24[3] = &unk_1EA16E6C8;
      v7 = v4;
      v25 = v7;
      v8 = (void *)MEMORY[0x1DF0A4968](v24);
      v19 = v6;
      v20 = 3221225472;
      v21 = __26__PLScreenStateAgent_init__block_invoke_4;
      v22 = &unk_1EA16E6C8;
      v9 = v7;
      v23 = v9;
      v10 = (void *)MEMORY[0x1DF0A4968](&v19);
      v11 = objc_alloc(MEMORY[0x1E0D230D0]);
      v12 = objc_msgSend(v11, "initWithDisplayType:qualityOfService:handler:", 0, 17, &__block_literal_global_148, v19, v20, v21, v22);
      v13 = v9[7];
      v9[7] = (id)v12;

      objc_msgSend(v9[7], "addObserver:", v9);
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D230D0]), "initWithDisplayType:qualityOfService:handler:", 3, 17, v8);
      v15 = v9[9];
      v9[9] = (id)v14;

      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D230D0]), "initWithDisplayType:qualityOfService:handler:", 1, 17, v10);
      v17 = v9[8];
      v9[8] = (id)v16;

    }
    self = v5;
    v3 = self;
  }

  return v3;
}

void __26__PLScreenStateAgent_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __26__PLScreenStateAgent_init__block_invoke_3;
    v5[3] = &unk_1EA16D948;
    v6 = *(id *)(a1 + 32);
    v7 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __26__PLScreenStateAgent_init__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logEventForwardCarScreenState:", *(_QWORD *)(a1 + 40));
}

void __26__PLScreenStateAgent_init__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __26__PLScreenStateAgent_init__block_invoke_5;
    v5[3] = &unk_1EA16D948;
    v6 = *(id *)(a1 + 32);
    v7 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __26__PLScreenStateAgent_init__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logEventForwardAirPlayScreenState:", *(_QWORD *)(a1 + 40));
}

- (void)initOperatorDependancies
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = a1 & 1;
  OUTLINED_FUNCTION_7_2(&dword_1DA9D6000, a2, a3, "initial state for EnableAlwaysOn is %d", (uint8_t *)v3);
  OUTLINED_FUNCTION_6();
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogScreenState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardWindowMode:", v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogScreenState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_168_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardIconDragging:", v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_172(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogScreenState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_172_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logAggregateWidgetAdditionAnimation:", v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_176(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogScreenState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_176_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logAggregateWidgetFlipAnimation:", v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogScreenState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_180_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardAlwaysOnEnableState:", v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogScreenState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_184_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardBacklightStateChange:", v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogScreenState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_188_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardFlipbookStatistics:", v6);
}

id __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_193(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v6 = a5;
  PLLogScreenState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_193_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "processQuery:withEntryKey:", v6, CFSTR("PLScreenStateAgent_EventBackward_AlwaysOnEnableState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("AlwaysOnEnableState"));
    PLLogScreenState();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_193_cold_2();
  }
  else
  {
    PLLogScreenState();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_193_cold_1();
    v10 = 0;
  }

  return v10;
}

id __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_201(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v6 = a5;
  PLLogScreenState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_201_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "processQuery:withEntryKey:", v6, CFSTR("PLScreenStateAgent_EventBackward_BacklightStateChange"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("BacklightStateChange"));
    PLLogScreenState();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_201_cold_2();
  }
  else
  {
    PLLogScreenState();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_201_cold_1();
    v10 = 0;
  }

  return v10;
}

id __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_207(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v6 = a5;
  PLLogScreenState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_207_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "processQuery:withEntryKey:", v6, CFSTR("PLScreenStateAgent_EventBackward_FlipbookStatistics"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("FlipbookStatistics"));
    PLLogScreenState();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_207_cold_2();
  }
  else
  {
    PLLogScreenState();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_207_cold_1();
    v10 = 0;
  }

  return v10;
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_220(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    PLLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_220_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "handleDisplayCallback:", v3);
  }

}

- (void)dealloc
{
  FBSDisplayLayoutMonitor *carPlayDisplayMonitor;
  FBSDisplayLayoutMonitor *airPlayDisplayMonitor;
  FBSDisplayLayoutMonitor *mainDisplayMonitor;
  objc_super v6;

  carPlayDisplayMonitor = self->_carPlayDisplayMonitor;
  if (carPlayDisplayMonitor)
    -[FBSDisplayLayoutMonitor invalidate](carPlayDisplayMonitor, "invalidate");
  airPlayDisplayMonitor = self->_airPlayDisplayMonitor;
  if (airPlayDisplayMonitor)
    -[FBSDisplayLayoutMonitor invalidate](airPlayDisplayMonitor, "invalidate");
  mainDisplayMonitor = self->_mainDisplayMonitor;
  if (mainDisplayMonitor)
    -[FBSDisplayLayoutMonitor invalidate](mainDisplayMonitor, "invalidate");
  v6.receiver = self;
  v6.super_class = (Class)PLScreenStateAgent;
  -[PLAgent dealloc](&v6, sel_dealloc);
}

- (void)log
{
  void *v3;
  id v4;

  -[PLScreenStateAgent mainDisplayMonitor](self, "mainDisplayMonitor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLScreenStateAgent logEventForwardMainScreenState:](self, "logEventForwardMainScreenState:", v3);

}

- (void)logEventPointMainBacklightEvent:(id)a3 withContext:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t block;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  uint64_t v28;

  v6 = *MEMORY[0x1E0D80390];
  v7 = a4;
  v8 = a3;
  +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", v6, CFSTR("BacklightEvent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v9);
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "transitionReason");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "numberWithInteger:", SBSBacklightChangeSourceForDisplayLayoutTransitionReason());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("TransitionReason"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = objc_msgSend(v8, "displayBacklightLevel");

  objc_msgSend(v14, "numberWithInteger:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("BacklightLevel"));

  -[PLOperator logEntry:](self, "logEntry:", v10);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v17 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __66__PLScreenStateAgent_logEventPointMainBacklightEvent_withContext___block_invoke;
    v27 = &__block_descriptor_40_e5_v8__0lu32l8;
    v28 = v17;
    if (logEventPointMainBacklightEvent_withContext__defaultOnce != -1)
      dispatch_once(&logEventPointMainBacklightEvent_withContext__defaultOnce, &block);
    if (logEventPointMainBacklightEvent_withContext__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BacklightEvent: %@"), v10, block, v25, v26, v27, v28);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLScreenStateAgent.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLScreenStateAgent logEventPointMainBacklightEvent:withContext:]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 559);

      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

uint64_t __66__PLScreenStateAgent_logEventPointMainBacklightEvent_withContext___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointMainBacklightEvent_withContext__classDebugEnabled = result;
  return result;
}

- (void)ioReportingNotification:(id)a3 currentLayout:(id)a4
{
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = objc_msgSend(a3, "isEqualToDictionary:", a4);
  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if ((v5 & 1) != 0)
  {
    if (v7)
      -[PLScreenStateAgent ioReportingNotification:currentLayout:].cold.1();
  }
  else
  {
    if (v7)
      -[PLScreenStateAgent ioReportingNotification:currentLayout:].cold.3();

    ++ioReportingNotification_currentLayout__enhancedScreenStateCounter;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.powerlog.EnhancedScreenState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUtilities postNotificationName:object:userInfo:](PLUtilities, "postNotificationName:object:userInfo:", v8, self, 0);

    PLLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PLScreenStateAgent ioReportingNotification:currentLayout:].cold.2(v6, v9, v10);
  }

}

- (void)logEventForwardMainScreenState:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PLScreenStateAgent *v9;

  v4 = a3;
  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke;
  v7[3] = &unk_1EA16D948;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  double v21;
  double v22;
  double v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  NSObject *v60;
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
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  int v87;
  id *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  id obj;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  uint8_t v109;
  _BYTE v110[15];
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  uint8_t v119[4];
  int v120[3];
  _QWORD v121[5];
  _QWORD v122[5];
  _QWORD v123[5];
  _QWORD v124[5];
  uint8_t buf[4];
  void *v126;
  __int16 v127;
  void *v128;
  __int16 v129;
  void *v130;
  _QWORD v131[5];
  _QWORD v132[5];
  int v133;
  uint64_t v134;
  int v135;
  uint64_t v136;
  _BYTE v137[128];
  _QWORD v138[5];

  v138[2] = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_10(a1, v2, v3, v4, v5, v6, v7, v8);

  if (!*(_QWORD *)(a1 + 32))
    return;
  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_9(v9);

  if ((!_os_feature_enabled_impl() || (objc_msgSend(MEMORY[0x1E0D80020], "hasAOD") & 1) == 0)
    && objc_msgSend(*(id *)(a1 + 32), "displayBacklightLevel") < 1)
  {
    return;
  }
  +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ScreenState"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v13 = v12;
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("level"), 0);
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("layoutRole"), 0);
  objc_msgSend(*(id *)(a1 + 32), "elements");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = (void *)v15;
  v99 = (void *)v14;
  v138[0] = v14;
  v138[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sortedArrayUsingDescriptors:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_8();

  if (_os_feature_enabled_impl() && objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
    objc_msgSend(*(id *)(a1 + 40), "setLastDisplayLayoutContainsLockScreen:", 0);
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  obj = v18;
  v106 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v137, 16);
  if (!v106)
    goto LABEL_62;
  v21 = v11 * v13;
  v105 = *(_QWORD *)v112;
  v100 = *MEMORY[0x1E0D22C78];
  v22 = -1.0;
  v23 = 0.0;
  v103 = a1;
  v101 = v19;
  while (2)
  {
    for (i = 0; i != v106; ++i)
    {
      if (*(_QWORD *)v112 != v105)
        objc_enumerationMutation(obj);
      v25 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v108, v107);
      objc_msgSend(v25, "bundleIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        objc_msgSend(v25, "bundleIdentifier");
      else
        objc_msgSend(v25, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, CFSTR("bundleID"));

      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("bundleID"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        PLLogCommon();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_4(&v109, v110, v54);
        goto LABEL_45;
      }
      if (_os_feature_enabled_impl())
      {
        if (objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
        {
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("bundleID"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "isEqualToString:", v100);

          if (v31)
          {
            objc_msgSend(*(id *)(a1 + 40), "setLastDisplayLayoutContainsLockScreen:", 1);
            PLLogCommon();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("bundleID"));
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              v80 = objc_msgSend(*(id *)(a1 + 40), "displayState");
              *(_DWORD *)buf = 138412802;
              v126 = v79;
              v127 = 2112;
              v128 = v26;
              v129 = 1024;
              LODWORD(v130) = v80;
              _os_log_debug_impl(&dword_1DA9D6000, v32, OS_LOG_TYPE_DEBUG, "element bundleID=%@, entry=%@, displayState=%d", buf, 0x1Cu);

            }
            if (objc_msgSend(*(id *)(a1 + 40), "displayState") == 2)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v100, CFSTR("aod"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v33, CFSTR("bundleID"));

              PLLogCommon();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v126 = v26;
                _os_log_debug_impl(&dword_1DA9D6000, v34, OS_LOG_TYPE_DEBUG, "entry after transformation = %@", buf, 0xCu);
              }

            }
          }
        }
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v25, "layoutRole"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v35, CFSTR("AppRole"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "displayType"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v36, CFSTR("Display"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "interfaceOrientation"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v37, CFSTR("Orientation"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v25, "level"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v38, CFSTR("Level"));

      objc_msgSend(v25, "frame");
      v40 = v39;
      objc_msgSend(v25, "frame");
      v42 = v40 * v41 / v21;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v43, CFSTR("ScreenWeight"));

      if (_os_feature_enabled_impl())
      {
        PLLogCommon();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_7(&v135, v26, &v136);

        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "count"))
        {
          PLLogCommon();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_6(&v133, v26, &v134);

          v46 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("bundleID"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "objectForKey:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          if (v48)
          {
            v131[0] = CFSTR("AppRole");
            objc_msgSend(v26, "objectForKeyedSubscript:");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v132[0] = v49;
            v131[1] = CFSTR("Display");
            objc_msgSend(v26, "objectForKeyedSubscript:");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v132[1] = v50;
            v131[2] = CFSTR("Orientation");
            objc_msgSend(v26, "objectForKeyedSubscript:");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v132[2] = v51;
            v131[3] = CFSTR("Level");
            objc_msgSend(v26, "objectForKeyedSubscript:");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v132[3] = v52;
            v131[4] = CFSTR("ScreenWeight");
            objc_msgSend(v26, "objectForKeyedSubscript:");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v132[4] = v53;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v132, v131, 5);
            v54 = objc_claimAutoreleasedReturnValue();

            a1 = v103;
            v55 = *(void **)(*(_QWORD *)(v103 + 40) + 88);
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("bundleID"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "objectForKey:", v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v51) = objc_msgSend(v57, "isEqualToDictionary:", v54);

            if ((_DWORD)v51)
            {
              PLLogCommon();
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("bundleID"));
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ScreenWeight"));
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("Level"));
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v126 = v81;
                v127 = 2112;
                v128 = v82;
                v129 = 2112;
                v130 = v83;
                _os_log_debug_impl(&dword_1DA9D6000, v58, OS_LOG_TYPE_DEBUG, "current FBSDisplayLayoutElement entry was already logged, skipping logging for  %@ with screenWeight %@ and Level: %@", buf, 0x20u);

              }
              objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("bundleID"));
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v104, "setObject:forKeyedSubscript:", v54, v59);

              v19 = v101;
LABEL_45:

              goto LABEL_58;
            }

          }
        }
        PLLogCommon();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("bundleID"));
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ScreenWeight"));
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("Level"));
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v126 = v76;
          v127 = 2112;
          v128 = v77;
          v129 = 2112;
          v130 = v78;
          _os_log_debug_impl(&dword_1DA9D6000, v60, OS_LOG_TYPE_DEBUG, "FBSDisplayLayoutElement entries was not logged, logging %@ with screenWeight %@ and Level: %@", buf, 0x20u);

        }
        v123[0] = CFSTR("AppRole");
        objc_msgSend(v26, "objectForKeyedSubscript:");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v124[0] = v61;
        v123[1] = CFSTR("Display");
        objc_msgSend(v26, "objectForKeyedSubscript:");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v124[1] = v62;
        v123[2] = CFSTR("Orientation");
        objc_msgSend(v26, "objectForKeyedSubscript:");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v124[2] = v63;
        v123[3] = CFSTR("Level");
        objc_msgSend(v26, "objectForKeyedSubscript:");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v124[3] = v64;
        v123[4] = CFSTR("ScreenWeight");
        objc_msgSend(v26, "objectForKeyedSubscript:");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v124[4] = v65;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v124, v123, 5);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("bundleID"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "setObject:forKeyedSubscript:", v66, v67);

        a1 = v103;
        v19 = v101;
      }
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode"))
      {
        v121[0] = CFSTR("AppRole");
        objc_msgSend(v26, "objectForKeyedSubscript:");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v122[0] = v68;
        v121[1] = CFSTR("Display");
        objc_msgSend(v26, "objectForKeyedSubscript:");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v122[1] = v69;
        v121[2] = CFSTR("Orientation");
        objc_msgSend(v26, "objectForKeyedSubscript:");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v122[2] = v70;
        v121[3] = CFSTR("Level");
        objc_msgSend(v26, "objectForKeyedSubscript:");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v122[3] = v71;
        v121[4] = CFSTR("ScreenWeight");
        objc_msgSend(v26, "objectForKeyedSubscript:");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v122[4] = v72;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, v121, 5);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("bundleID"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "setObject:forKeyedSubscript:", v73, v74);

        a1 = v103;
        v19 = v101;

      }
      objc_msgSend(v19, "addObject:", v26);
      ++displaySync_block_invoke_screenStateEntriesCounter;
      PLLogCommon();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
        __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_5(v119, v120, v75);

      if (v22 == (double)objc_msgSend(v25, "level"))
        v42 = v23 + v42;
      else
        v22 = (double)objc_msgSend(v25, "level");
      v23 = v42;
      if (v42 >= 1.0)
      {

        goto LABEL_62;
      }
LABEL_58:

    }
    v106 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v137, 16);
    if (v106)
      continue;
    break;
  }
LABEL_62:

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode"))
  {
    objc_msgSend(*(id *)(a1 + 40), "ioReportingNotification:currentLayout:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96), v104);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "removeAllObjects");
    v84 = objc_msgSend(v104, "mutableCopy");
    v85 = *(_QWORD *)(a1 + 40);
    v86 = *(void **)(v85 + 96);
    *(_QWORD *)(v85 + 96) = v84;

  }
  v87 = _os_feature_enabled_impl();
  v88 = *(id **)(a1 + 40);
  if (!v87)
  {
    v115 = v108;
    v116 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "logEntries:withGroupID:", v95, v108);

    PLLogCommon();
    v94 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
      goto LABEL_69;
    goto LABEL_70;
  }
  objc_msgSend(v88[11], "removeAllObjects");
  v89 = objc_msgSend(v104, "mutableCopy");
  v90 = *(_QWORD *)(a1 + 40);
  v91 = *(void **)(v90 + 88);
  *(_QWORD *)(v90 + 88) = v89;

  if (objc_msgSend(v19, "count"))
  {
    v92 = *(void **)(a1 + 40);
    v117 = v108;
    v118 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "logEntries:withGroupID:", v93, v108);

    PLLogCommon();
    v94 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
LABEL_69:
      __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_2();
LABEL_70:
    v97 = v98;
    v96 = v99;
  }
  else
  {
    PLLogCommon();
    v94 = objc_claimAutoreleasedReturnValue();
    v97 = v98;
    v96 = v99;
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
      __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_1();
  }

  objc_msgSend(*(id *)(a1 + 40), "accountWithLayoutEntries:", v19);
  if (_os_feature_enabled_impl())
  {
    if (objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
      objc_msgSend(*(id *)(a1 + 40), "setLastDisplayLayout:", *(_QWORD *)(a1 + 32));
  }

}

- (void)logEventForwardCarScreenState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ScreenState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v4, "bounds");
    v10 = v9;
    objc_msgSend(v4, "bounds");
    v12 = v11;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v4, "elements");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v32)
    {
      v13 = v10 * v12;
      v31 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v34 != v31)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v16 = v5;
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
          v18 = v6;
          objc_msgSend(v17, "setEntryDate:", v6);
          objc_msgSend(v15, "bundleIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v15, "bundleIdentifier");
          else
            objc_msgSend(v15, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("bundleID"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "layoutRole"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, CFSTR("AppRole"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "displayType"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, CFSTR("Display"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "level"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, CFSTR("Level"));

          objc_msgSend(v15, "frame");
          v25 = v24;
          objc_msgSend(v15, "frame");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25 * v26 / v13);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v27, CFSTR("ScreenWeight"));

          -[PLOperator logEntry:](self, "logEntry:", v17);
          -[PLScreenStateAgent createCarPlayAccountingEvents:](self, "createCarPlayAccountingEvents:", v17);

          v5 = v16;
          v6 = v18;
        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v32);
    }

  }
  else
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
    objc_msgSend(v28, "setEntryDate:", v6);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", 0, CFSTR("bundleID"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", &unk_1EA1BFFC0, CFSTR("AppRole"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "displayType"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, CFSTR("Display"));

    objc_msgSend(v28, "setObject:forKeyedSubscript:", &unk_1EA1DA6C8, CFSTR("ScreenWeight"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", &unk_1EA1BFFD8, CFSTR("Level"));
    -[PLOperator logEntry:](self, "logEntry:", v28);
    -[PLScreenStateAgent createCarPlayAccountingEvents:](self, "createCarPlayAccountingEvents:", v28);

  }
}

- (void)logEventForwardAirPlayScreenState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t i;
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
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ScreenState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v4, "bounds");
    v10 = v9;
    objc_msgSend(v4, "bounds");
    v12 = v11;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v4, "elements");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v33)
    {
      v13 = v10 * v12;
      v32 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v35 != v32)
            objc_enumerationMutation(obj);
          v15 = v4;
          v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v17 = v5;
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
          v19 = v6;
          objc_msgSend(v18, "setEntryDate:", v6);
          objc_msgSend(v16, "bundleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v16, "bundleIdentifier");
          else
            objc_msgSend(v16, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("bundleID"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v16, "layoutRole"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("AppRole"));

          v4 = v15;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "displayType"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("Display"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v16, "level"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, CFSTR("Level"));

          objc_msgSend(v16, "frame");
          v26 = v25;
          objc_msgSend(v16, "frame");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26 * v27 / v13);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v28, CFSTR("ScreenWeight"));

          -[PLScreenStateAgent createAirPlayWiFiAccountingEvent:](self, "createAirPlayWiFiAccountingEvent:", v18);
          v5 = v17;
          v6 = v19;
        }
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v33);
    }

  }
  else
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
    objc_msgSend(v29, "setEntryDate:", v6);
    objc_msgSend(v29, "setObject:forKeyedSubscript:", 0, CFSTR("bundleID"));
    objc_msgSend(v29, "setObject:forKeyedSubscript:", &unk_1EA1BFFC0, CFSTR("AppRole"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "displayType"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, CFSTR("Display"));

    objc_msgSend(v29, "setObject:forKeyedSubscript:", &unk_1EA1DA6C8, CFSTR("ScreenWeight"));
    objc_msgSend(v29, "setObject:forKeyedSubscript:", &unk_1EA1BFFD8, CFSTR("Level"));
    -[PLScreenStateAgent createAirPlayWiFiAccountingEvent:](self, "createAirPlayWiFiAccountingEvent:", v29);

  }
}

- (unint64_t)convertWindowingMode:(id)a3
{
  id v3;
  unint64_t v4;
  NSObject *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Invalid")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Mirroring")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Medusa")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Chamois")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NonInteractive")) & 1) != 0)
  {
    v4 = 4;
  }
  else
  {
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PLScreenStateAgent convertWindowingMode:].cold.1();

    v4 = 5;
  }

  return v4;
}

- (unint64_t)convertZoomLevel:(id)a3
{
  id v3;
  unint64_t v4;
  NSObject *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Invalid")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LargerText")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Standard")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Dense")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Denser")) & 1) != 0)
  {
    v4 = 4;
  }
  else
  {
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PLScreenStateAgent convertZoomLevel:].cold.1();

    v4 = 5;
  }

  return v4;
}

- (void)logEventForwardWindowMode:(id)a3
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
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  id v22;

  v22 = a3;
  if (objc_msgSend(MEMORY[0x1E0D80020], "isiPad"))
  {
    +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("WindowMode"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v22);
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("displayName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("displayType"));

    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("windowingMode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithUnsignedInteger:", -[PLScreenStateAgent convertWindowingMode:](self, "convertWindowingMode:", v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("windowingMode"));

    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("zoomLevel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithUnsignedInteger:", -[PLScreenStateAgent convertZoomLevel:](self, "convertZoomLevel:", v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("zoomLevel"));

    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("canvasSizeHeight"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "intValue");
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("canvasSizeWidth"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "intValue") * v14;

    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("nativeSizeHeight"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "intValue");
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("nativeSizeWidth"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "intValue");

    if (v16 >= 1 && v20 * v18 >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v16 / (double)(v20 * v18));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("canvasRatio"));

    }
    -[PLOperator logEntry:](self, "logEntry:", v5);

  }
}

- (void)logEventBackwardIconDragging:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertFromSystemToMonotonic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Durations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("IconDragging"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __51__PLScreenStateAgent_logEventBackwardIconDragging___block_invoke;
  v18 = &unk_1EA16E6F0;
  v11 = v9;
  v19 = v11;
  v12 = v7;
  v20 = v12;
  v13 = v10;
  v21 = v13;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v15);
  if (objc_msgSend(v13, "count", v15, v16, v17, v18))
  {
    v22 = v11;
    v23[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v14, v11);

  }
}

void __51__PLScreenStateAgent_logEventBackwardIconDragging___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D7FFB0];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithEntryKey:withDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("Duration"));

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
}

- (void)logEventBackwardAlwaysOnEnableState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
  {
    +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("AlwaysOnEnableState"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v8);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("focusMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1EA1BFFF0, CFSTR("focusMode"));
    -[PLOperator logEntry:](self, "logEntry:", v5);

  }
}

- (void)logEventBackwardBacklightStateChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "hasAOD") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 102040) & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 102041))
  {
    +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("BacklightStateChange"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v9);
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("state"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithUnsignedInt:", -[PLScreenStateAgent GetBacklightState:](self, "GetBacklightState:", v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("state"));

    -[PLOperator logEntry:](self, "logEntry:", v5);
  }

}

- (void)logEventBackwardFlipbookStatistics:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
  {
    +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("FlipbookStatistics"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v6);
    -[PLOperator logEntry:](self, "logEntry:", v5);

  }
}

- (id)processQuery:(id)a3 withEntryKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
  {
    v7 = (void *)MEMORY[0x1DF0A47AC]();
    PLLogScreenState();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PLScreenStateAgent processQuery:withEntryKey:].cold.5();

    if (!v5
      || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("StartEpochTime")),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = v9 == 0,
          v9,
          v10))
    {
      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[PLScreenStateAgent processQuery:withEntryKey:].cold.1();
      v26 = 0;
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("StartEpochTime"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      objc_msgSend(v11, "dateWithTimeIntervalSince1970:");
      v13 = objc_claimAutoreleasedReturnValue();

      -[NSObject convertFromSystemToMonotonic](v13, "convertFromSystemToMonotonic");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PLLogScreenState();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[PLScreenStateAgent processQuery:withEntryKey:].cold.4();

      v16 = objc_alloc(MEMORY[0x1E0D80080]);
      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v14, "timeIntervalSince1970");
      objc_msgSend(v17, "numberWithDouble:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithKey:withValue:withComparisonOperation:", CFSTR("timestamp"), v18, 3);

      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "storage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "entriesForKey:withComparisons:", v6, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      PLLogScreenState();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[PLScreenStateAgent processQuery:withEntryKey:].cold.3();

      v31 = 0;
      v32 = &v31;
      v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__7;
      v35 = __Block_byref_object_dispose__7;
      v36 = (id)objc_opt_new();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __48__PLScreenStateAgent_processQuery_withEntryKey___block_invoke;
      v28[3] = &unk_1EA16E718;
      v29 = v6;
      v30 = &v31;
      objc_msgSend(v23, "enumerateObjectsUsingBlock:", v28);
      PLLogScreenState();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[PLScreenStateAgent processQuery:withEntryKey:].cold.2();

      v26 = (id)v32[5];
      _Block_object_dispose(&v31, 8);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

void __48__PLScreenStateAgent_processQuery_withEntryKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "entryID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("ID"));

  objc_msgSend(v3, "entryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertFromMonotonicToSystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("timestamp"));

  PLLogScreenState();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "entryDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    v18 = 2112;
    v19 = v8;
    _os_log_debug_impl(&dword_1DA9D6000, v11, OS_LOG_TYPE_DEBUG, "process for query related to %@ is NSDates=%@ and correctedTimeStamp=%@", (uint8_t *)&v14, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v5);

}

- (void)logAggregateWidgetAdditionAnimation:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80368];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", v4, CFSTR("WidgetAdditionAnimation"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logAggregateWidgetFlipAnimation:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80368];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", v4, CFSTR("WidgetFlipAnimation"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)createCarPlayAccountingEvents:(id)a3
{
  id v3;
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
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v5;
    v18[0] = &unk_1EA1DA6C8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "entryDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 27, v6, v7);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v9;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ScreenWeight"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "entryDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 43, v11, v12);
  }
  else
  {
    objc_msgSend(v3, "entryDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 43, MEMORY[0x1E0C9AA70], v13);
  }
}

- (void)createAirPlayWiFiAccountingEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    v10[0] = &unk_1EA1DA6C8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "entryDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 36, v7, v8);

  }
}

- (void)accountWithLayoutEntries:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  v9 = v7;
  if (!v8)
  {
LABEL_20:

    goto LABEL_21;
  }
  v10 = v8;
  v31 = v6;
  v11 = *(_QWORD *)v37;
  v12 = 0.0;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v37 != v11)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("bundleID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ScreenWeight"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v15);

        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ScreenWeight"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v12 = v12 + v18;

      }
    }
    v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  }
  while (v10);

  if (v12 > 0.0 && v12 != 1.0)
  {
    objc_msgSend(v4, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v9);
          v23 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
          v24 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v4, "objectForKeyedSubscript:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "doubleValue");
          objc_msgSend(v24, "numberWithDouble:", v26 / v12);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, v23);

        }
        v20 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v20);
      v6 = v31;
    }
    goto LABEL_20;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, v4, v6);

  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 2, v30, v6);

}

- (void)handleDisplayCallback:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;

  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_220_cold_1();

  objc_msgSend(v4, "objectForKey:", CFSTR("entry"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Active"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLScreenStateAgent setDisplayState:](self, "setDisplayState:", objc_msgSend(v7, "intValue"));

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PLScreenStateAgent handleDisplayCallback:].cold.2(self, v8);

  if ((-[PLScreenStateAgent displayState](self, "displayState") == 2
     || -[PLScreenStateAgent displayState](self, "displayState") == 1)
    && -[PLScreenStateAgent lastDisplayLayoutContainsLockScreen](self, "lastDisplayLayoutContainsLockScreen"))
  {
    PLLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[PLScreenStateAgent handleDisplayCallback:].cold.1(self);

    -[PLScreenStateAgent lastDisplayLayout](self, "lastDisplayLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLScreenStateAgent logEventForwardMainScreenState:](self, "logEventForwardMainScreenState:", v10);

  }
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;

  v7 = a4;
  v8 = a5;
  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PLScreenStateAgent layoutMonitor:didUpdateDisplayLayout:withContext:].cold.1((uint64_t)v7, v8, v9);

  objc_msgSend(v8, "transitionReason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = SBSBacklightChangeSourceForDisplayLayoutTransitionReason();

  if (!v11
    || (-[PLScreenStateAgent logEventPointMainBacklightEvent:withContext:](self, "logEventPointMainBacklightEvent:withContext:", v7, v8), v11 > 0x1C)|| ((1 << v11) & 0x1A000050) == 0)
  {
    -[PLScreenStateAgent logEventForwardMainScreenState:](self, "logEventForwardMainScreenState:", v7);
  }

}

- (FBSDisplayLayoutMonitor)mainDisplayMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMainDisplayMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (FBSDisplayLayoutMonitor)airPlayDisplayMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAirPlayDisplayMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (FBSDisplayLayoutMonitor)carPlayDisplayMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCarPlayDisplayMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLXPCListenerOperatorComposition)windowModeListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWindowModeListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableDictionary)lastScreenStateEntries
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastScreenStateEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableDictionary)lastLayoutMonitorEntries
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastLayoutMonitorEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PLXPCListenerOperatorComposition)iconDraggingListner
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setIconDraggingListner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (PLXPCListenerOperatorComposition)widgetAdditionAnimationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setWidgetAdditionAnimationListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLXPCListenerOperatorComposition)widgetFlipAnimationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setWidgetFlipAnimationListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PLXPCListenerOperatorComposition)springBoardAlwaysOnEnableStateListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSpringBoardAlwaysOnEnableStateListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (PLXPCListenerOperatorComposition)springBoardBacklightStateChangeListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSpringBoardBacklightStateChangeListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PLXPCListenerOperatorComposition)springBoardFlipbookStatisticsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSpringBoardFlipbookStatisticsListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (PLXPCResponderOperatorComposition)springBoardAlwaysOnEnableStateResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSpringBoardAlwaysOnEnableStateResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (PLXPCResponderOperatorComposition)springBoardBacklightStateChangeResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSpringBoardBacklightStateChangeResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (PLXPCResponderOperatorComposition)springBoardFlipbookStatisticsResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setSpringBoardFlipbookStatisticsResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (PLEntryNotificationOperatorComposition)displayCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDisplayCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (int)displayState
{
  return self->_displayState;
}

- (void)setDisplayState:(int)a3
{
  self->_displayState = a3;
}

- (FBSDisplayLayout)lastDisplayLayout
{
  return (FBSDisplayLayout *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLastDisplayLayout:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (BOOL)lastDisplayLayoutContainsLockScreen
{
  return self->_lastDisplayLayoutContainsLockScreen;
}

- (void)setLastDisplayLayoutContainsLockScreen:(BOOL)a3
{
  self->_lastDisplayLayoutContainsLockScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDisplayLayout, 0);
  objc_storeStrong((id *)&self->_displayCallback, 0);
  objc_storeStrong((id *)&self->_springBoardFlipbookStatisticsResponder, 0);
  objc_storeStrong((id *)&self->_springBoardBacklightStateChangeResponder, 0);
  objc_storeStrong((id *)&self->_springBoardAlwaysOnEnableStateResponder, 0);
  objc_storeStrong((id *)&self->_springBoardFlipbookStatisticsListener, 0);
  objc_storeStrong((id *)&self->_springBoardBacklightStateChangeListener, 0);
  objc_storeStrong((id *)&self->_springBoardAlwaysOnEnableStateListener, 0);
  objc_storeStrong((id *)&self->_widgetFlipAnimationListener, 0);
  objc_storeStrong((id *)&self->_widgetAdditionAnimationListener, 0);
  objc_storeStrong((id *)&self->_iconDraggingListner, 0);
  objc_storeStrong((id *)&self->_lastLayoutMonitorEntries, 0);
  objc_storeStrong((id *)&self->_lastScreenStateEntries, 0);
  objc_storeStrong((id *)&self->_windowModeListener, 0);
  objc_storeStrong((id *)&self->_carPlayDisplayMonitor, 0);
  objc_storeStrong((id *)&self->_airPlayDisplayMonitor, 0);
  objc_storeStrong((id *)&self->_mainDisplayMonitor, 0);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Got callback for PLScreenStateAgent_EventForward_WindowMode: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_168_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Got callback for PLScreenStateAgent_EventBackward_IconDragging: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_172_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Got callback for PLScreenStateAgent_Aggregate_WidgetAdditionAnimation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_176_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Got callback for PLScreenStateAgent_Aggregate_WidgetFlipAnimation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_180_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Got callback for PLScreenStateAgent_EventBackward_AlwaysOnEnableState: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_184_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Got callback for PLScreenStateAgent_EventBackward_BacklightStateChange: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_188_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Got callback for PLScreenStateAgent_EventBackward_FlipbookStatistics: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_193_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_2(&dword_1DA9D6000, v0, v1, "AlwaysOnEnableState query did not succeed", v2);
  OUTLINED_FUNCTION_6();
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_193_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "AlwaysOnEnableState query received with info: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_201_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_2(&dword_1DA9D6000, v0, v1, "BacklightStateChange query did not succeed", v2);
  OUTLINED_FUNCTION_6();
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_201_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "BacklightStateChange query received with info: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_207_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_2(&dword_1DA9D6000, v0, v1, "FlipbookStatistics query did not succeed", v2);
  OUTLINED_FUNCTION_6();
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_207_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "FlipbookStatistics query received with info: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_220_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "userInfo=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)ioReportingNotification:currentLayout:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "current FBSDisplayLayoutElement dictionary is the same than the last, not sending a notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)ioReportingNotification:(uint64_t)a3 currentLayout:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = ioReportingNotification_currentLayout__enhancedScreenStateCounter;
  OUTLINED_FUNCTION_7_2(&dword_1DA9D6000, a1, a3, "FBSDisplayLayoutElement notification notified, count is now %d", (uint8_t *)v3);
  OUTLINED_FUNCTION_6();
}

- (void)ioReportingNotification:currentLayout:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "current FBSDisplayLayoutElement dictionary is different than the last, notifying EnhancedScreenState Listener", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "LayoutEntries is empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "LayoutEntries: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_4(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_6_2(&dword_1DA9D6000, a3, (uint64_t)a3, "Screen State element's bundleID/identifier is nil", a1);
}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_5(uint8_t *a1, int *a2, NSObject *a3)
{
  int v3;

  v3 = displaySync_block_invoke_screenStateEntriesCounter;
  *(_DWORD *)a1 = 67109120;
  *a2 = v3;
  OUTLINED_FUNCTION_7_2(&dword_1DA9D6000, a3, (uint64_t)a3, "Logged %d FBSDisplayLayoutElement entries", a1);
}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_6(_DWORD *a1, void *a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *a1 = 138412290;
  *a3 = v5;
  OUTLINED_FUNCTION_9(&dword_1DA9D6000, v6, v7, "FBSDisplayLayoutElement searching for currentEntry bundleID in last Dictionary: %@");

  OUTLINED_FUNCTION_14();
}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_7(_DWORD *a1, void *a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *a1 = 138412290;
  *a3 = v5;
  OUTLINED_FUNCTION_9(&dword_1DA9D6000, v6, v7, "FBSDisplayLayoutElement currentEntry bundleID: %@");

  OUTLINED_FUNCTION_14();
}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  _os_feature_enabled_impl();
  objc_msgSend(MEMORY[0x1E0D80020], "hasAOD");
  OUTLINED_FUNCTION_11_1(&dword_1DA9D6000, v0, v1, "dts runtime ff enabled=%d, [PLPlatform hasAOD]=%d]", v2, v3, v4, v5, 0);
}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_9(NSObject *a1)
{
  uint64_t v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = objc_msgSend(MEMORY[0x1E0D80020], "hasAOD");
  OUTLINED_FUNCTION_7_2(&dword_1DA9D6000, a1, v2, "screenState - hasAOD=%d", (uint8_t *)v3);
  OUTLINED_FUNCTION_1();
}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_10(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a2, a3, "calling logEventForwardMainScreenState with displayLayout=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)convertWindowingMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, " Unknown windowingMode %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)convertZoomLevel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, " Unknown zoomLevel %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)processQuery:withEntryKey:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1DA9D6000, v0, OS_LOG_TYPE_ERROR, "process for %@ Invalid payload!", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)processQuery:withEntryKey:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_2(&dword_1DA9D6000, v0, v1, "process for %@ output response is =%@.");
  OUTLINED_FUNCTION_1();
}

- (void)processQuery:withEntryKey:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_2(&dword_1DA9D6000, v0, v1, "selected query entries for %@ are selectedEntries =%@.");
  OUTLINED_FUNCTION_1();
}

- (void)processQuery:withEntryKey:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_2(&dword_1DA9D6000, v0, v1, "process for %@ queryStartDate is =%@.");
  OUTLINED_FUNCTION_1();
}

- (void)processQuery:withEntryKey:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_2(&dword_1DA9D6000, v0, v1, "process for %@ Received query with payload=%@.");
  OUTLINED_FUNCTION_1();
}

- (void)handleDisplayCallback:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "displayState");
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_11_1(&dword_1DA9D6000, v1, v2, "self.displayState=%d, self.lastDisplayLayoutContainsLockScreen=%d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)handleDisplayCallback:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  int v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[10];
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "displayState");
  v4 = OUTLINED_FUNCTION_15_1();
  objc_msgSend(a1, "lastDisplayLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_1();
  v8 = v4;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_DEBUG, "self.displayState=%d, self.lastDisplayLayoutContainsLockScreen=%d,  self.lastDisplayLayout=%@", v7, 0x18u);

  OUTLINED_FUNCTION_8();
}

- (void)layoutMonitor:(uint64_t)a1 didUpdateDisplayLayout:(void *)a2 withContext:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "transitionReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "transitionReasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138413058;
  v9 = a1;
  v10 = 2112;
  v11 = a2;
  v12 = 2112;
  v13 = v6;
  v14 = 2112;
  v15 = v7;
  _os_log_debug_impl(&dword_1DA9D6000, a3, OS_LOG_TYPE_DEBUG, "calling didUpdateDisplayLayout=%@ with context=%@, transitionReason=%@, transitionReasons=%@", (uint8_t *)&v8, 0x2Au);

}

@end
