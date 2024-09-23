@implementation PLAppTimeService

+ (id)defaults
{
  return &unk_1EA1DA498;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAppTimeService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryAggregateDefinitions
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
  v10[0] = CFSTR("AppRunTime");
  objc_msgSend(a1, "entryAggregateDefinitionAppRunTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("UsageTime");
  objc_msgSend(a1, "entryAggregateDefinitionUsageTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("Metrics");
  objc_msgSend(a1, "entryAggregateDefinitionMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("CellularCondition");
  objc_msgSend(a1, "entryAggregateDefinitionCellularCondition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("AppUsageEvents");
  objc_msgSend(a1, "entryAggregateDefinitionAppUsageEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryAggregateDefinitionAppRunTime
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  _QWORD v38[12];
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  _QWORD v43[2];
  _QWORD v44[2];
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  _QWORD v49[13];
  _QWORD v50[13];
  _QWORD v51[4];
  _QWORD v52[4];
  _QWORD v53[4];
  _QWORD v54[6];

  v54[4] = *MEMORY[0x1E0C80C00];
  v53[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80240];
  v51[0] = *MEMORY[0x1E0D80318];
  v51[1] = v2;
  v52[0] = &unk_1EA1DAFA8;
  v52[1] = MEMORY[0x1E0C9AAB0];
  v3 = *MEMORY[0x1E0D80340];
  v51[2] = *MEMORY[0x1E0D80250];
  v51[3] = v3;
  v52[2] = MEMORY[0x1E0C9AAB0];
  v52[3] = &unk_1EA1C2108;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v37;
  v53[1] = *MEMORY[0x1E0D802F0];
  v49[0] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "commonTypeDict_StringFormat_withBundleID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v35;
  v49[1] = CFSTR("ScreenOnTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "commonTypeDict_RealFormat");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v33;
  v49[2] = CFSTR("BackgroundTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_RealFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v31;
  v49[3] = CFSTR("ScreenOnPluggedInTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commonTypeDict_RealFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v29;
  v49[4] = CFSTR("BackgroundPluggedInTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonTypeDict_RealFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v50[4] = v27;
  v49[5] = CFSTR("BackgroundAudioNowPlayingTime");
  v47 = *MEMORY[0x1E0D80358];
  v4 = v47;
  v48 = &unk_1EA1C2120;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v50[5] = v26;
  v49[6] = CFSTR("BackgroundLocationTime");
  v45 = v4;
  v46 = &unk_1EA1C2120;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v50[6] = v25;
  v49[7] = CFSTR("BackgroundAudioNowPlayingPluggedInTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_RealFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v50[7] = v23;
  v49[8] = CFSTR("BackgroundLocationPluggedInTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_RealFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v50[8] = v21;
  v49[9] = CFSTR("BackgroundLocationAudioTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_RealFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v50[9] = v19;
  v49[10] = CFSTR("BackgroundLocationAudioPluggedInTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_RealFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v50[10] = v17;
  v49[11] = CFSTR("BackgroundAudioPlayingTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50[11] = v6;
  v49[12] = CFSTR("BackgroundAudioPlayingTimePluggedIn");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50[12] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v9;
  v53[2] = *MEMORY[0x1E0D80228];
  v43[0] = &unk_1EA1DAFB8;
  v41 = *MEMORY[0x1E0D80220];
  v10 = v41;
  v42 = &unk_1EA1DAFC8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = &unk_1EA1DAFD8;
  v44[0] = v11;
  v39 = v10;
  v40 = &unk_1EA1DAFE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v13;
  v53[3] = *MEMORY[0x1E0D80238];
  v38[0] = CFSTR("ScreenOnTime");
  v38[1] = CFSTR("BackgroundTime");
  v38[2] = CFSTR("BackgroundAudioNowPlayingTime");
  v38[3] = CFSTR("BackgroundLocationTime");
  v38[4] = CFSTR("ScreenOnPluggedInTime");
  v38[5] = CFSTR("BackgroundPluggedInTime");
  v38[6] = CFSTR("BackgroundAudioNowPlayingPluggedInTime");
  v38[7] = CFSTR("BackgroundLocationPluggedInTime");
  v38[8] = CFSTR("BackgroundLocationAudioTime");
  v38[9] = CFSTR("BackgroundLocationAudioPluggedInTime");
  v38[10] = CFSTR("BackgroundAudioPlayingTime");
  v38[11] = CFSTR("BackgroundAudioPlayingTimePluggedIn");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v54[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)entryAggregateDefinitionMetrics
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[4];
  _QWORD v25[6];

  v25[4] = *MEMORY[0x1E0C80C00];
  v24[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v22[0] = *MEMORY[0x1E0D80318];
  v22[1] = v2;
  v3 = *MEMORY[0x1E0D80340];
  v22[2] = *MEMORY[0x1E0D80240];
  v22[3] = v3;
  v23[0] = &unk_1EA1DAFF8;
  v23[1] = MEMORY[0x1E0C9AAB0];
  v23[2] = MEMORY[0x1E0C9AAB0];
  v23[3] = &unk_1EA1C2138;
  v22[4] = *MEMORY[0x1E0D80338];
  v23[4] = &unk_1EA1DB008;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  v24[1] = *MEMORY[0x1E0D802F0];
  v20[0] = CFSTR("BundleId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v5;
  v20[1] = CFSTR("byteswritten");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v7;
  v20[2] = CFSTR("bytesread");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v10;
  v24[2] = *MEMORY[0x1E0D80228];
  v18 = &unk_1EA1DAFB8;
  v16 = *MEMORY[0x1E0D80220];
  v17 = &unk_1EA1DAFC8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = *MEMORY[0x1E0D80238];
  v25[2] = v12;
  v25[3] = &unk_1EA1DDA98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryAggregateDefinitionCellularCondition
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
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[4];
  _QWORD v27[6];

  v27[4] = *MEMORY[0x1E0C80C00];
  v26[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80240];
  v24[0] = *MEMORY[0x1E0D80318];
  v24[1] = v2;
  v3 = *MEMORY[0x1E0D80340];
  v24[2] = *MEMORY[0x1E0D80250];
  v24[3] = v3;
  v25[0] = &unk_1EA1DB018;
  v25[1] = MEMORY[0x1E0C9AAB0];
  v25[2] = MEMORY[0x1E0C9AAB0];
  v25[3] = &unk_1EA1C2138;
  v24[4] = *MEMORY[0x1E0D80338];
  v25[4] = &unk_1EA1DB008;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v16;
  v26[1] = *MEMORY[0x1E0D802F0];
  v22[0] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat_withBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v4;
  v22[1] = CFSTR("SignalBars");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v6;
  v22[2] = CFSTR("CellUsageTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v9;
  v26[2] = *MEMORY[0x1E0D80228];
  v20 = &unk_1EA1DAFB8;
  v18 = *MEMORY[0x1E0D80220];
  v19 = &unk_1EA1DAFC8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v11;
  v26[3] = *MEMORY[0x1E0D80238];
  v17 = CFSTR("CellUsageTime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryAggregateDefinitionUsageTime
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
  _QWORD v16[3];
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[4];
  _QWORD v26[6];

  v26[4] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
    return MEMORY[0x1E0C9AA70];
  v25[0] = *MEMORY[0x1E0D80298];
  v3 = *MEMORY[0x1E0D80240];
  v23[0] = *MEMORY[0x1E0D80318];
  v23[1] = v3;
  v24[0] = &unk_1EA1DB028;
  v24[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  v25[1] = *MEMORY[0x1E0D802F0];
  v21[0] = CFSTR("ScreenOn");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat_withUnit_s");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v4;
  v21[1] = CFSTR("ScreenOff");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat_withUnit_s");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v6;
  v21[2] = CFSTR("PluggedIn");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat_withUnit_s");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v9;
  v25[2] = *MEMORY[0x1E0D80228];
  v19 = &unk_1EA1DAFB8;
  v17 = *MEMORY[0x1E0D80220];
  v18 = &unk_1EA1DB038;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v11;
  v25[3] = *MEMORY[0x1E0D80238];
  v16[0] = CFSTR("ScreenOn");
  v16[1] = CFSTR("ScreenOff");
  v16[2] = CFSTR("PluggedIn");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryAggregateDefinitionAppUsageEvents
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[2];
  uint64_t v32;
  _QWORD v33[3];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[4];
  _QWORD v37[4];
  _QWORD v38[4];
  _QWORD v39[6];

  v39[4] = *MEMORY[0x1E0C80C00];
  v38[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v36[0] = *MEMORY[0x1E0D80318];
  v36[1] = v2;
  v3 = MEMORY[0x1E0C9AAB0];
  v37[0] = &unk_1EA1DAFF8;
  v37[1] = MEMORY[0x1E0C9AAB0];
  v4 = *MEMORY[0x1E0D80338];
  v36[2] = *MEMORY[0x1E0D80340];
  v36[3] = v4;
  v37[2] = &unk_1EA1C2138;
  v37[3] = &unk_1EA1DB048;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v21;
  v38[1] = *MEMORY[0x1E0D802F0];
  v34[0] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_StringFormat_withBundleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v19;
  v34[1] = CFSTR("NotificationCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v5;
  v34[2] = CFSTR("HasWidgetActive");
  v7 = *MEMORY[0x1E0D802E0];
  v31[0] = *MEMORY[0x1E0D80358];
  v6 = v31[0];
  v31[1] = v7;
  v33[0] = &unk_1EA1C2150;
  v33[1] = v3;
  v32 = *MEMORY[0x1E0D80230];
  v8 = v32;
  v33[2] = &unk_1EA1C2150;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v31, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v9;
  v34[3] = CFSTR("HasCarPlayUsage");
  v29[0] = v6;
  v29[1] = v7;
  v30[0] = &unk_1EA1C2150;
  v30[1] = v3;
  v29[2] = v8;
  v30[2] = &unk_1EA1C2150;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v10;
  v34[4] = CFSTR("HasAudioUsage");
  v27[0] = v6;
  v27[1] = v7;
  v28[0] = &unk_1EA1C2150;
  v28[1] = v3;
  v27[2] = v8;
  v28[2] = &unk_1EA1C2150;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v12;
  v38[2] = *MEMORY[0x1E0D80228];
  v25 = &unk_1EA1DAFD8;
  v23 = *MEMORY[0x1E0D80220];
  v24 = &unk_1EA1DB048;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v14;
  v38[3] = *MEMORY[0x1E0D80238];
  v22[0] = CFSTR("NotificationCount");
  v22[1] = CFSTR("HasWidgetActive");
  v22[2] = CFSTR("HasCarPlayUsage");
  v22[3] = CFSTR("HasAudioUsage");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)loadWatchKitExtensionsSet
{
  NSMutableSet *v3;
  NSMutableSet *watchkitExtensions;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[3];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  watchkitExtensions = self->_watchkitExtensions;
  self->_watchkitExtensions = v3;

  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllPlugins"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("PluginType"), CFSTR("com.apple.watchkit"), 0);
  v21[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLOperator storage](self, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entriesForKey:withComparisons:", v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "objectForKeyedSubscript:", CFSTR("PluginId"), (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          -[NSMutableSet addObject:](self->_watchkitExtensions, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (PLAppTimeService)init
{
  PLAppTimeService *v3;
  objc_super v5;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0
    || +[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLAppTimeService;
    self = -[PLOperator init](&v5, sel_init);
    v3 = self;
  }

  return v3;
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
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Calling power out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCoalitionCallback:", a2);
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleScreenStateCallback:", a2);
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleApplicationCallback:", a2);
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBatteryCallback:", a2);
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleDisplayCallback:", a2);
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleInCallServiceCallback:", a2);
}

void __44__PLAppTimeService_initOperatorDependancies__block_invoke_158(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  PLLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412802;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_debug_impl(&dword_1DA9D6000, v10, OS_LOG_TYPE_DEBUG, "Calling power out with %@ %@ %@", (uint8_t *)&v11, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "handlePowerOutCallback:", v7);
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_160(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handlePluginCallback:", a2);
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_2_163(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleAudioCallback:", a2);
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_3_166(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNowPlayingCallback:", a2);
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_4_169(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleStatusBarCallback:", a2);
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_5_172(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBackgroundTransferCallback:", a2);
}

void __44__PLAppTimeService_initOperatorDependancies__block_invoke_6_174(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  __CFString *v16;
  uint64_t v17;

  v3 = a2;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    v12 = MEMORY[0x1E0C809B0];
    v14 = __44__PLAppTimeService_initOperatorDependancies__block_invoke_7;
    v15 = &unk_1EA170B10;
    v13 = 3221225472;
    v16 = CFSTR("AppTimeService");
    v17 = v4;
    if (kPLAppTimeServiceAggregateNameHasAudioUsage_block_invoke_defaultOnce != -1)
      dispatch_once(&kPLAppTimeServiceAggregateNameHasAudioUsage_block_invoke_defaultOnce, &v12);
    v5 = kPLAppTimeServiceAggregateNameHasAudioUsage_block_invoke_classDebugEnabled;

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Device Going to Sleep"), v12, v13, v14, v15);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAppTimeService initOperatorDependancies]_block_invoke_6");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 655);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "handleSleepCallBack:", v3, v12, v13, v14, v15);

}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_7(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  kPLAppTimeServiceAggregateNameHasAudioUsage_block_invoke_classDebugEnabled = result;
  return result;
}

void __44__PLAppTimeService_initOperatorDependancies__block_invoke_184(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  __CFString *v16;
  uint64_t v17;

  v3 = a2;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    v12 = MEMORY[0x1E0C809B0];
    v14 = __44__PLAppTimeService_initOperatorDependancies__block_invoke_2_185;
    v15 = &unk_1EA170B10;
    v13 = 3221225472;
    v16 = CFSTR("AppTimeService");
    v17 = v4;
    if (kPLAppTimeServiceAggregateNameHasAudioUsage_block_invoke_2_defaultOnce != -1)
      dispatch_once(&kPLAppTimeServiceAggregateNameHasAudioUsage_block_invoke_2_defaultOnce, &v12);
    v5 = kPLAppTimeServiceAggregateNameHasAudioUsage_block_invoke_2_classDebugEnabled;

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Device Woke Up"), v12, v13, v14, v15);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAppTimeService initOperatorDependancies]_block_invoke");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 659);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "handleWakeCallBack:", v3, v12, v13, v14, v15);

}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_2_185(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  kPLAppTimeServiceAggregateNameHasAudioUsage_block_invoke_2_classDebugEnabled = result;
  return result;
}

void __44__PLAppTimeService_initOperatorDependancies__block_invoke_189(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "periodicUpdateAppRunTimeWithDate:", v2);
  objc_msgSend(*(id *)(a1 + 32), "chunkScreenOnAggregationAtDate:", v2);
  objc_msgSend(*(id *)(a1 + 32), "updateAggregationsAtDate:withNewPluggedInState:", v2, objc_msgSend(*(id *)(a1 + 32), "deviceIsPluggedIn"));

}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_2_193(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCellularConditionCallback:", a2);
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_3_196(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleTelephonyRegistrationCallback:", a2);
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_4_198(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNotificationCallback:", a2);
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_5_199(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleWidgetCallback:", a2);
}

- (id)buildCallBack:(id)a3 withGroup:(BOOL)a4 withHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GroupID_%@"), v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v8;
  }
  v11 = v10;
  v12 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__PLAppTimeService_buildCallBack_withGroup_withHandler___block_invoke;
  v16[3] = &unk_1EA172858;
  v17 = v9;
  v13 = v9;
  v14 = (void *)objc_msgSend(v12, "initWithOperator:forEntryKey:withBlock:", self, v11, v16);

  return v14;
}

uint64_t __56__PLAppTimeService_buildCallBack_withGroup_withHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)debugAppTimeService
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x1E0C99E88]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "initWithFireDate:interval:target:selector:userInfo:repeats:", v4, self, sel_testService, 0, 1, 20.0);

  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTimer:forMode:", v6, *MEMORY[0x1E0C99748]);

}

- (void)handleWakeCallBack:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entryDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAppTimeService periodicUpdateAppRunTimeWithDate:](self, "periodicUpdateAppRunTimeWithDate:", v4);

  objc_msgSend(v6, "entryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAppTimeService updateAggregationsAtDate:withNewAPState:](self, "updateAggregationsAtDate:withNewAPState:", v5, 1);

  -[PLAppTimeService setIsAPOn:](self, "setIsAPOn:", 1);
}

- (void)handleSleepCallBack:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAppTimeService periodicUpdateAppRunTimeWithDate:](self, "periodicUpdateAppRunTimeWithDate:", v5);

  objc_msgSend(v4, "entryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAppTimeService updateAggregationsAtDate:withNewAPState:](self, "updateAggregationsAtDate:withNewAPState:", v6, 0);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PLAppTimeService handleSleepCallBack:].cold.1(self, v7);

  -[PLAppTimeService audioPlaybackBundleIDs](self, "audioPlaybackBundleIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[PLAppTimeService setIsAPOn:](self, "setIsAPOn:", 0);
  if (-[PLAppTimeService inCallNow](self, "inCallNow"))
  {
    objc_msgSend(v4, "entryDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAppTimeService lastCallTime](self, "lastCallTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);
    v12 = v11;

    -[PLAppTimeService lastCallBundleID](self, "lastCallBundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAppTimeService lastCallTime](self, "lastCallTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAppTimeService updateInCallServiceTimeInDBForBundleId:withTime:withDate:](self, "updateInCallServiceTimeInDBForBundleId:withTime:withDate:", v13, v14, v12);

    -[PLAppTimeService setInCallNow:](self, "setInCallNow:", 0);
  }

}

- (void)handleCoalitionCallback:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "monotonicDate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("group"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLAppTimeService entryKeyPLCoalitionAgentEventIntervalCoalition](self, "entryKeyPLCoalitionAgentEventIntervalCoalition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLAppTimeService handleCoalitionCallback:withNewCoalitionArray:](self, "handleCoalitionCallback:withNewCoalitionArray:", v9, v8);
}

- (void)handleScreenStateCallback:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "monotonicDate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PLAppTimeService addNowPlayingTimeAtDate:](self, "addNowPlayingTimeAtDate:", v9);
  -[PLAppTimeService addStatusBarTimeAtDate:](self, "addStatusBarTimeAtDate:", v9);
  -[PLAppTimeService addCellularConditionTimeAtDate:](self, "addCellularConditionTimeAtDate:", v9);
  -[PLAppTimeService addAudioTimeAtDate:](self, "addAudioTimeAtDate:", v9);
  objc_msgSend(v5, "objectForKey:", CFSTR("group"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLAppTimeService entryKeyPLScreenStateAgentScreenState](self, "entryKeyPLScreenStateAgentScreenState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLAppTimeService addForegroundTimeAtDate:withNewLayoutElementsArray:](self, "addForegroundTimeAtDate:withNewLayoutElementsArray:", v9, v8);
  -[PLAppTimeService addCarPlayUseFromLayoutEntry:AtDate:](self, "addCarPlayUseFromLayoutEntry:AtDate:", v8, v9);

}

- (void)handleApplicationCallback:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PLAppTimeService updateBackgroundTimeForAppStateEntry:](self, "updateBackgroundTimeForAppStateEntry:", v4);

}

- (void)handleBatteryCallback:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ExternalConnected"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("entry"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CurrentCapacity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("entry"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MaxCapacity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  v15 = 0.0;
  if (v14 > 0.0)
    v15 = v10 * 100.0 / v14;
  v16 = +[PLUtilities isPingPongChargingWith:andBatteryLevelPercent:](PLUtilities, "isPingPongChargingWith:andBatteryLevelPercent:", v6, v15);
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("entry"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("IsCharging"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue") | v16;

  if ((_DWORD)v19 != -[PLAppTimeService deviceIsPluggedIn](self, "deviceIsPluggedIn"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAppTimeService addForegroundTimeAtDate:withNewLayoutElementsArray:](self, "addForegroundTimeAtDate:withNewLayoutElementsArray:", v20, 0);
    -[PLAppTimeService updateInCallServiceTimeAtDate:](self, "updateInCallServiceTimeAtDate:", v20);
    -[PLAppTimeService addAudioTimeAtDate:](self, "addAudioTimeAtDate:", v20);
    -[PLAppTimeService addNowPlayingTimeAtDate:](self, "addNowPlayingTimeAtDate:", v20);
    -[PLAppTimeService addStatusBarTimeAtDate:](self, "addStatusBarTimeAtDate:", v20);
    -[PLAppTimeService updateAggregationsAtDate:withNewPluggedInState:](self, "updateAggregationsAtDate:withNewPluggedInState:", v20, v19);

  }
  -[PLAppTimeService setDeviceIsPluggedIn:](self, "setDeviceIsPluggedIn:", v19);

}

- (void)handleNotificationCallback:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "monotonicDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PLAppTimeService addNotificationCountFromUserInfo:AtDate:](self, "addNotificationCountFromUserInfo:AtDate:", v5, v6);

}

- (void)handleWidgetCallback:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "monotonicDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PLAppTimeService addWidgetUseFromUserInfo:AtDate:](self, "addWidgetUseFromUserInfo:AtDate:", v5, v6);

}

- (void)handleDisplayCallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
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
  NSObject *v26;
  uint64_t block;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  uint64_t v31;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("entry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Active"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  if ((_DWORD)v7 == 2)
  {
    if (_os_feature_enabled_impl())
      v7 = 2;
    else
      v7 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Block"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Backlight"));

  if (v9)
  {
    if (!(_DWORD)v7)
    {
      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAppTimeService handleDisplayCallback:].cold.4(v10);

      objc_msgSend(v5, "entryDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAppTimeService addCellularConditionTimeAtDate:](self, "addCellularConditionTimeAtDate:", v11);

      objc_msgSend(v5, "entryDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAppTimeService addForegroundTimeAtDate:withNewLayoutElementsArray:](self, "addForegroundTimeAtDate:withNewLayoutElementsArray:", v12, 0);

    }
    objc_msgSend(v5, "entryDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAppTimeService updateAggregationsAtDate:withNewScreenState:](self, "updateAggregationsAtDate:withNewScreenState:", v13, v7);

    if (_os_feature_enabled_impl() && objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
    {
      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLAppTimeService handleDisplayCallback:].cold.3(self, v7, v14);

      if (-[PLAppTimeService displayState](self, "displayState") || (v7 - 1) > 1)
        goto LABEL_21;
      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[PLAppTimeService handleDisplayCallback:].cold.2(v5, v15);

    }
    else if ((v7 - 1) > 1)
    {
      goto LABEL_21;
    }
    objc_msgSend(v5, "entryDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAppTimeService setLastScreenOnTime:](self, "setLastScreenOnTime:", v16);

LABEL_21:
    -[PLAppTimeService setDisplayState:](self, "setDisplayState:", v7);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v17 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __42__PLAppTimeService_handleDisplayCallback___block_invoke;
      v30 = &__block_descriptor_40_e5_v8__0lu32l8;
      v31 = v17;
      if (handleDisplayCallback__defaultOnce != -1)
        dispatch_once(&handleDisplayCallback__defaultOnce, &block);
      if (handleDisplayCallback__classDebugEnabled)
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Active"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLAppTimeService displayState](self, "displayState"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("Got display %@ %@ %@"), v4, v19, v20, block, v28, v29, v30, v31);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lastPathComponent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAppTimeService handleDisplayCallback:]");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 945);

        PLLogCommon();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
  }

}

uint64_t __42__PLAppTimeService_handleDisplayCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleDisplayCallback__classDebugEnabled = result;
  return result;
}

- (void)handlePowerOutCallback:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PLAppTimeService handlePowerOutCallback:].cold.1();

  objc_msgSend(v4, "objectForKey:", CFSTR("time"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAppTimeService updatePowerOutTimeInDBForBundleId:](self, "updatePowerOutTimeInDBForBundleId:", v6);

}

- (void)updatePowerOutTimeInDBForBundleId:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0D7FFB0]);
  -[PLAppTimeService aggregatedEntryKeyForAppRunTime](self, "aggregatedEntryKeyForAppRunTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithEntryKey:withDate:", v8, v11);

  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("PowerOutAccessories"), CFSTR("BundleID"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1EA1C2168, CFSTR("ScreenOnTime"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, CFSTR("BackgroundTime"));

  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1EA1C2168, CFSTR("BackgroundPluggedInTime"));
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v11, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator logProportionateAggregateEntry:withStartDate:withEndDate:](self, "logProportionateAggregateEntry:withStartDate:withEndDate:", v9, v11, v10);

}

- (void)handleInCallServiceCallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
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
  void *v30;
  NSObject *v31;
  _QWORD block[5];

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("entry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("callStart"));

  if (v7)
  {
    -[PLAppTimeService setInCallNow:](self, "setInCallNow:", 1);
    objc_msgSend(v5, "entryDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAppTimeService setLastCallTime:](self, "setLastCallTime:", v8);

    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleID"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = &stru_1EA174678;
    }
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@"), v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAppTimeService setLastCallBundleID:](self, "setLastCallBundleID:", v20);

    if (v10)
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("callStop"));

    if (v13)
    {
      objc_msgSend(v5, "entryDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAppTimeService lastCallTime](self, "lastCallTime");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", v15);
      v17 = v16;

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAppTimeService lastCallTime](self, "lastCallTime");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAppTimeService updateInCallServiceTimeInDBForBundleId:withTime:withDate:](self, "updateInCallServiceTimeInDBForBundleId:withTime:withDate:", v18, v19, v17);

      -[PLAppTimeService setInCallNow:](self, "setInCallNow:", 0);
    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v21 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PLAppTimeService_handleInCallServiceCallback___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v21;
    if (handleInCallServiceCallback__defaultOnce != -1)
      dispatch_once(&handleInCallServiceCallback__defaultOnce, block);
    if (handleInCallServiceCallback__classDebugEnabled)
    {
      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleID"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("callType"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("Got InCallService %@ %@ %@ %@"), v4, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "lastPathComponent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAppTimeService handleInCallServiceCallback:]");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v29, v30, 984);

      PLLogCommon();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

uint64_t __48__PLAppTimeService_handleInCallServiceCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleInCallServiceCallback__classDebugEnabled = result;
  return result;
}

- (void)handlePluginCallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSMutableSet *watchkitExtensions;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t block;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  uint64_t v22;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("entry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PluginType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.watchkit"));

  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PluginId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      watchkitExtensions = self->_watchkitExtensions;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PluginId"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](watchkitExtensions, "addObject:", v10);

    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v11 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __41__PLAppTimeService_handlePluginCallback___block_invoke;
    v21 = &__block_descriptor_40_e5_v8__0lu32l8;
    v22 = v11;
    if (handlePluginCallback__defaultOnce != -1)
      dispatch_once(&handlePluginCallback__defaultOnce, &block);
    if (handlePluginCallback__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Got Plugin %@"), v4, block, v19, v20, v21, v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAppTimeService handlePluginCallback:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 998);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

uint64_t __41__PLAppTimeService_handlePluginCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handlePluginCallback__classDebugEnabled = result;
  return result;
}

- (void)handleAudioCallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
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

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("entry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ApplicationName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Operation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("AudioPlayback_Start")))
    {
      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAppTimeService handleAudioCallback:].cold.2();

      -[PLAppTimeService audioPlaybackBundleIDs](self, "audioPlaybackBundleIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "entryDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v12, v6);

      objc_msgSend(v5, "entryDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAppTimeService addAudioTimeAtDate:](self, "addAudioTimeAtDate:", v13);
    }
    else
    {
      v14 = objc_msgSend(v8, "isEqualToString:", CFSTR("AudioPlayback_Stop"));
      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      v13 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[PLAppTimeService handleAudioCallback:].cold.3();

        objc_msgSend(v5, "entryDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAppTimeService addAudioTimeAtDate:](self, "addAudioTimeAtDate:", v16);

        -[PLAppTimeService audioPlaybackBundleIDs](self, "audioPlaybackBundleIDs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObjectForKey:", v6);
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        -[PLAppTimeService handleAudioCallback:].cold.4();
      }
    }

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v17 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __40__PLAppTimeService_handleAudioCallback___block_invoke;
      v27 = &__block_descriptor_40_e5_v8__0lu32l8;
      v28 = v17;
      if (handleAudioCallback__defaultOnce != -1)
        dispatch_once(&handleAudioCallback__defaultOnce, &block);
      if (handleAudioCallback__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Got Audio callback %@"), v4, block, v25, v26, v27, v28);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAppTimeService handleAudioCallback:]");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 1028);

        PLLogCommon();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
  }

}

uint64_t __40__PLAppTimeService_handleAudioCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleAudioCallback__classDebugEnabled = result;
  return result;
}

- (void)handleNowPlayingCallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t block;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  uint64_t v21;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("State"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  objc_msgSend(v5, "entryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAppTimeService addNowPlayingTimeAtDate:](self, "addNowPlayingTimeAtDate:", v8);

  if (v7 == 1)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BundleID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAppTimeService setNowPlayingBundleID:](self, "setNowPlayingBundleID:", v9);

  }
  else
  {
    -[PLAppTimeService setNowPlayingBundleID:](self, "setNowPlayingBundleID:", 0);
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v10 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __45__PLAppTimeService_handleNowPlayingCallback___block_invoke;
    v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    v21 = v10;
    if (handleNowPlayingCallback__defaultOnce != -1)
      dispatch_once(&handleNowPlayingCallback__defaultOnce, &block);
    if (handleNowPlayingCallback__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Got NowPlaying callback %@"), v4, block, v18, v19, v20, v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAppTimeService handleNowPlayingCallback:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 1042);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

uint64_t __45__PLAppTimeService_handleNowPlayingCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleNowPlayingCallback__classDebugEnabled = result;
  return result;
}

- (void)handleStatusBarCallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t block;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  uint64_t v21;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  objc_msgSend(v5, "entryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAppTimeService addStatusBarTimeAtDate:](self, "addStatusBarTimeAtDate:", v8);

  if (v7 == 1)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BundleID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAppTimeService setStatusBarBundleID:](self, "setStatusBarBundleID:", v9);

  }
  else
  {
    -[PLAppTimeService setStatusBarBundleID:](self, "setStatusBarBundleID:", 0);
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v10 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __44__PLAppTimeService_handleStatusBarCallback___block_invoke;
    v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    v21 = v10;
    if (handleStatusBarCallback__defaultOnce != -1)
      dispatch_once(&handleStatusBarCallback__defaultOnce, &block);
    if (handleStatusBarCallback__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Got NowPlaying callback %@"), v4, block, v18, v19, v20, v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAppTimeService handleStatusBarCallback:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 1056);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

uint64_t __44__PLAppTimeService_handleStatusBarCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleStatusBarCallback__classDebugEnabled = result;
  return result;
}

- (void)handleCellularConditionCallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t block;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  uint64_t v25;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subsId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subsId")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "integerValue"),
        v7,
        (v8 & 0xFFFFFFFFFFFFFFFDLL) == 0))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("signalBars"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("airplaneMode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("on"));

    if (v10 >= 4)
      v10 = 4;
    if (v10 != -[PLAppTimeService lastSignalBar](self, "lastSignalBar")
      || (_DWORD)v12 != -[PLAppTimeService lastAirplaneModeStatus](self, "lastAirplaneModeStatus"))
    {
      objc_msgSend(v5, "entryDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAppTimeService addCellularConditionTimeAtDate:](self, "addCellularConditionTimeAtDate:", v13);

    }
    -[PLAppTimeService setLastSignalBar:](self, "setLastSignalBar:", v10);
    -[PLAppTimeService setLastAirplaneModeStatus:](self, "setLastAirplaneModeStatus:", v12);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v14 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __52__PLAppTimeService_handleCellularConditionCallback___block_invoke;
      v24 = &__block_descriptor_40_e5_v8__0lu32l8;
      v25 = v14;
      if (handleCellularConditionCallback__defaultOnce != -1)
        dispatch_once(&handleCellularConditionCallback__defaultOnce, &block);
      if (handleCellularConditionCallback__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Got CellularCondition callback %@"), v4, block, v22, v23, v24, v25);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAppTimeService handleCellularConditionCallback:]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 1087);

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
  }

}

uint64_t __52__PLAppTimeService_handleCellularConditionCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleCellularConditionCallback__classDebugEnabled = result;
  return result;
}

- (void)handleTelephonyRegistrationCallback:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v13 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v13;
    if (v5)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("subsId"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v13;
      if (!v6
        || (objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("subsId")),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v8 = objc_msgSend(v7, "integerValue"),
            v7,
            v4 = v13,
            (v8 & 0xFFFFFFFFFFFFFFFDLL) == 0))
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RegisteredHome")) & 1) != 0)
        {
          v10 = 1;
        }
        else
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("status"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v11, "isEqualToString:", CFSTR("RegisteredRoaming"));

        }
        if ((_DWORD)v10 != -[PLAppTimeService lastTelephonyRegistrationStatus](self, "lastTelephonyRegistrationStatus"))
        {
          objc_msgSend(v13, "entryDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLAppTimeService addCellularConditionTimeAtDate:](self, "addCellularConditionTimeAtDate:", v12);

        }
        -[PLAppTimeService setLastTelephonyRegistrationStatus:](self, "setLastTelephonyRegistrationStatus:", v10);
        v4 = v13;
      }
    }
  }

}

- (id)remapCloudDocsBundleID:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = a3;
  if (!objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.clouddocs.")))
    goto LABEL_6;
  objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.clouddocs."), "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("."));
  if (v5 == 0x7FFFFFFFFFFFFFFFLL
    || (objc_msgSend(v4, "substringFromIndex:", v5 + v6), (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_6:
    v8 = v3;
    goto LABEL_7;
  }
  v8 = (id)v7;

LABEL_7:
  return v8;
}

- (void)handleBackgroundTransferCallback:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  char v22;
  PLBackgroundTransferEvent *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[5];
  _QWORD v69[5];
  _QWORD v70[5];
  _QWORD v71[5];
  _QWORD block[6];

  v4 = a3;
  if (handleBackgroundTransferCallback__onceToken != -1)
    dispatch_once(&handleBackgroundTransferCallback__onceToken, &__block_literal_global_34);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0x1E0D7F000uLL;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (handleBackgroundTransferCallback__defaultOnce != -1)
      dispatch_once(&handleBackgroundTransferCallback__defaultOnce, block);
    if (handleBackgroundTransferCallback__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("entry=%@"), v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAppTimeService handleBackgroundTransferCallback:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 1142);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originatingClientID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = CFSTR("originatingClientID");
  else
    v15 = CFSTR("bundleID");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLAppTimeService remapCloudDocsBundleID:](self, "remapCloudDocsBundleID:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("taskUUID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18
      || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("state")),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_msgSend(v19, "intValue"),
          v19,
          !v20))
    {
LABEL_47:

      goto LABEL_48;
    }
    if (v20 == 1)
    {
      -[PLAppTimeService coalitionsAppsOnScreen](self, "coalitionsAppsOnScreen");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "containsObject:", v17);

      if ((v22 & 1) != 0)
        goto LABEL_40;
      objc_msgSend((id)handleBackgroundTransferCallback__bundleIDToBackgroundTransferEvent, "objectForKeyedSubscript:", v17);
      v23 = (PLBackgroundTransferEvent *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v24 = objc_opt_class();
        v71[0] = MEMORY[0x1E0C809B0];
        v71[1] = 3221225472;
        v71[2] = __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke_295;
        v71[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v71[4] = v24;
        if (handleBackgroundTransferCallback__defaultOnce_293 != -1)
          dispatch_once(&handleBackgroundTransferCallback__defaultOnce_293, v71);
        if (handleBackgroundTransferCallback__classDebugEnabled_294)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Running: backgroundTransferEvent=%@"), v23);
          v25 = objc_claimAutoreleasedReturnValue();
          v65 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "lastPathComponent");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAppTimeService handleBackgroundTransferCallback:]");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v27, v28, 1159);

          v29 = (void *)v25;
          PLLogCommon();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

          v6 = 0x1E0D7F000;
        }
      }
      if (!v23)
      {
        v23 = objc_alloc_init(PLBackgroundTransferEvent);
        objc_msgSend(v5, "entryDate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBackgroundTransferEvent setStartDate:](v23, "setStartDate:", v31);

        -[PLBackgroundTransferEvent setBundleID:](v23, "setBundleID:", v17);
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBackgroundTransferEvent setTaskUUIDs:](v23, "setTaskUUIDs:", v32);

        objc_msgSend((id)handleBackgroundTransferCallback__bundleIDToBackgroundTransferEvent, "setObject:forKeyedSubscript:", v23, v17);
      }
      -[PLBackgroundTransferEvent taskUUIDs](v23, "taskUUIDs");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v18);
    }
    else
    {
      objc_msgSend((id)handleBackgroundTransferCallback__bundleIDToBackgroundTransferEvent, "objectForKeyedSubscript:", v17);
      v23 = (PLBackgroundTransferEvent *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v34 = objc_opt_class();
        v70[0] = MEMORY[0x1E0C809B0];
        v70[1] = 3221225472;
        v70[2] = __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke_301;
        v70[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v70[4] = v34;
        if (handleBackgroundTransferCallback__defaultOnce_299 != -1)
          dispatch_once(&handleBackgroundTransferCallback__defaultOnce_299, v70);
        if (handleBackgroundTransferCallback__classDebugEnabled_300)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cancelled, Completed, Failed: backgroundTransferEvent=%@"), v23);
          v35 = objc_claimAutoreleasedReturnValue();
          v66 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "lastPathComponent");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAppTimeService handleBackgroundTransferCallback:]");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v37, v38, 1176);

          v39 = (void *)v35;
          PLLogCommon();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

          v6 = 0x1E0D7F000uLL;
        }
      }
      if (!v23)
        goto LABEL_39;
      -[PLBackgroundTransferEvent taskUUIDs](v23, "taskUUIDs");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "removeObject:", v18);

      -[PLBackgroundTransferEvent taskUUIDs](v23, "taskUUIDs");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "count");

      if (v43)
        goto LABEL_39;
      objc_msgSend((id)handleBackgroundTransferCallback__bundleIDToBackgroundTransferEvent, "removeObjectForKey:", v17);
      -[PLAppTimeService coalitionsAppsOnScreen](self, "coalitionsAppsOnScreen");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "containsObject:", v17);

      if ((v45 & 1) != 0)
        goto LABEL_39;
      objc_msgSend(v5, "entryDate");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBackgroundTransferEvent startDate](v23, "startDate");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "timeIntervalSinceDate:", v54);
      v56 = v55;

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v57 = objc_opt_class();
        v69[0] = MEMORY[0x1E0C809B0];
        v69[1] = 3221225472;
        v69[2] = __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke_306;
        v69[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v69[4] = v57;
        if (handleBackgroundTransferCallback__defaultOnce_304 != -1)
          dispatch_once(&handleBackgroundTransferCallback__defaultOnce_304, v69);
        if (handleBackgroundTransferCallback__classDebugEnabled_305)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("duration=%f"), *(_QWORD *)&v56);
          v58 = objc_claimAutoreleasedReturnValue();
          v67 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "lastPathComponent");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAppTimeService handleBackgroundTransferCallback:]");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "logMessage:fromFile:fromFunction:fromLineNumber:", v58, v60, v61, 1188);

          v62 = (void *)v58;
          PLLogCommon();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

          v6 = 0x1E0D7F000;
        }
      }
      -[PLBackgroundTransferEvent bundleID](v23, "bundleID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBackgroundTransferEvent startDate](v23, "startDate");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAppTimeService updateBackgroundTimeInDBForBundleId:withTime:withDate:](self, "updateBackgroundTimeInDBForBundleId:withTime:withDate:", v33, v64, fmin(v56, 3600.0));

    }
LABEL_39:

LABEL_40:
    if (objc_msgSend(*(id *)(v6 + 4000), "debugEnabled"))
    {
      v46 = objc_opt_class();
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke_311;
      v68[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v68[4] = v46;
      if (handleBackgroundTransferCallback__defaultOnce_309 != -1)
        dispatch_once(&handleBackgroundTransferCallback__defaultOnce_309, v68);
      if (handleBackgroundTransferCallback__classDebugEnabled_310)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleIDToBackgroundTransferEvent=%@"), handleBackgroundTransferCallback__bundleIDToBackgroundTransferEvent);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "lastPathComponent");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAppTimeService handleBackgroundTransferCallback:]");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "logMessage:fromFile:fromFunction:fromLineNumber:", v47, v50, v51, 1196);

        PLLogCommon();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    goto LABEL_47;
  }
LABEL_48:

}

void __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)handleBackgroundTransferCallback__bundleIDToBackgroundTransferEvent;
  handleBackgroundTransferCallback__bundleIDToBackgroundTransferEvent = v0;

}

uint64_t __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBackgroundTransferCallback__classDebugEnabled = result;
  return result;
}

uint64_t __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke_295(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBackgroundTransferCallback__classDebugEnabled_294 = result;
  return result;
}

uint64_t __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke_301(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBackgroundTransferCallback__classDebugEnabled_300 = result;
  return result;
}

uint64_t __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke_306(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBackgroundTransferCallback__classDebugEnabled_305 = result;
  return result;
}

uint64_t __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke_311(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBackgroundTransferCallback__classDebugEnabled_310 = result;
  return result;
}

- (void)updateBackgroundTimeForAppStateEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  PLAppTimeService *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v4 = a3;
  if (v4)
  {
    v17 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Identifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("State"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");

    if (!v5)
      goto LABEL_17;
    -[PLAppTimeService excludedBGAppsSet](self, "excludedBGAppsSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "containsObject:", v5) & 1) != 0)
    {
LABEL_16:

      goto LABEL_17;
    }
    -[PLAppTimeService backgroundAppToBundleID](self, "backgroundAppToBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

      goto LABEL_16;
    }
    -[PLAppTimeService PiPModeApps](self, "PiPModeApps");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v5);

    if ((v12 & 1) != 0)
    {
LABEL_17:

      v4 = v17;
      goto LABEL_18;
    }
    objc_msgSend(v17, "entryDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAppTimeService updateBackgroundAppsForBundleID:withState:withDate:](self, "updateBackgroundAppsForBundleID:withState:withDate:", v5, v7, v13);

    if ((-[NSMutableSet containsObject:](self->_watchkitExtensions, "containsObject:", v5) & 1) != 0)
    {
      if ((_DWORD)v7 == 4 || (_DWORD)v7 == 8)
      {
        objc_msgSend(v17, "entryDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
        v14 = self;
        v15 = v5;
        v16 = 0;
LABEL_15:
        -[PLAppTimeService updateAppRunTimeForBundleId:withAppStateUpdateType:withNowDate:](v14, "updateAppRunTimeForBundleId:withAppStateUpdateType:withNowDate:", v15, v16, v8);
        goto LABEL_16;
      }
      objc_msgSend(v17, "entryDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v17, "entryDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_DWORD)v7 == 4)
        goto LABEL_12;
    }
    v14 = self;
    v15 = v5;
    v16 = 1;
    goto LABEL_15;
  }
LABEL_18:

}

- (void)updateAppRunTimeForBundleId:(id)a3 withAppStateUpdateType:(int)a4 withNowDate:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  -[PLAppTimeService inFlightBundleIDStartTime](self, "inFlightBundleIDStartTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a4)
  {
    if (v10)
      goto LABEL_9;
    goto LABEL_7;
  }
  if (!v10)
    goto LABEL_9;
  objc_msgSend(v8, "timeIntervalSinceDate:", v10);
  -[PLAppTimeService updateBackgroundTimeInDBForBundleId:withTime:withDate:](self, "updateBackgroundTimeInDBForBundleId:withTime:withDate:", v12, v10);
  if (a4 == 2)
  {
LABEL_7:
    -[PLAppTimeService inFlightBundleIDStartTime](self, "inFlightBundleIDStartTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v12);
    goto LABEL_8;
  }
  if (a4 == 1)
  {
    -[PLAppTimeService inFlightBundleIDStartTime](self, "inFlightBundleIDStartTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v12);
LABEL_8:

  }
LABEL_9:

}

- (void)updateBackgroundTimeInDBForBundleId:(id)a3 withTime:(double)a4 withDate:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _QWORD v35[5];
  _QWORD block[5];

  v8 = a3;
  v9 = a5;
  v10 = -[PLAppTimeService isAPOn](self, "isAPOn");
  if (a4 > 0.0 && v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0D7FFB0]);
    -[PLAppTimeService aggregatedEntryKeyForAppRunTime](self, "aggregatedEntryKeyForAppRunTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithEntryKey:withDate:", v12, v9);

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, CFSTR("BundleID"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("BackgroundTime"));

    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1EA1C2168, CFSTR("ScreenOnTime"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1EA1C2168, CFSTR("ScreenOnPluggedInTime"));
    if (-[PLAppTimeService deviceIsPluggedIn](self, "deviceIsPluggedIn"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("BackgroundPluggedInTime"));

    }
    else
    {
      objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1EA1C2168, CFSTR("BackgroundPluggedInTime"));
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v9, a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logProportionateAggregateEntry:withStartDate:withEndDate:](self, "logProportionateAggregateEntry:withStartDate:withEndDate:", v13, v9, v24);

    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_20;
    v25 = objc_opt_class();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __74__PLAppTimeService_updateBackgroundTimeInDBForBundleId_withTime_withDate___block_invoke_320;
    v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v35[4] = v25;
    if (updateBackgroundTimeInDBForBundleId_withTime_withDate__defaultOnce_318 != -1)
      dispatch_once(&updateBackgroundTimeInDBForBundleId_withTime_withDate__defaultOnce_318, v35);
    if (!updateBackgroundTimeInDBForBundleId_withTime_withDate__classDebugEnabled_319)
      goto LABEL_20;
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("BundleID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ScreenOnTime"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("BackgroundTime"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("Added Background %@ %@ %@"), v27, v28, v29);
    v23 = objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "lastPathComponent");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAppTimeService updateBackgroundTimeInDBForBundleId:withTime:withDate:]");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v32, v33, 1269);

    PLLogCommon();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

LABEL_19:
LABEL_20:

    goto LABEL_21;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v16 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PLAppTimeService_updateBackgroundTimeInDBForBundleId_withTime_withDate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v16;
    if (updateBackgroundTimeInDBForBundleId_withTime_withDate__defaultOnce != -1)
      dispatch_once(&updateBackgroundTimeInDBForBundleId_withTime_withDate__defaultOnce, block);
    if (updateBackgroundTimeInDBForBundleId_withTime_withDate__classDebugEnabled)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("Not adding time for %@, %@ %@"), v8, v18, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAppTimeService updateBackgroundTimeInDBForBundleId:withTime:withDate:]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v21, v22, 1255);

      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      goto LABEL_19;
    }
  }
LABEL_21:

}

uint64_t __74__PLAppTimeService_updateBackgroundTimeInDBForBundleId_withTime_withDate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateBackgroundTimeInDBForBundleId_withTime_withDate__classDebugEnabled = result;
  return result;
}

uint64_t __74__PLAppTimeService_updateBackgroundTimeInDBForBundleId_withTime_withDate___block_invoke_320(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateBackgroundTimeInDBForBundleId_withTime_withDate__classDebugEnabled_319 = result;
  return result;
}

- (void)periodicUpdateAppRunTimeWithDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLAppTimeService inFlightBundleIDStartTime](self, "inFlightBundleIDStartTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[PLAppTimeService updateAppRunTimeForBundleId:withAppStateUpdateType:withNowDate:](self, "updateAppRunTimeForBundleId:withAppStateUpdateType:withNowDate:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), 2, v4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  -[PLAppTimeService chunkAppsOnScreenAtDate:](self, "chunkAppsOnScreenAtDate:", v4);
  -[PLAppTimeService updateInCallServiceTimeAtDate:](self, "updateInCallServiceTimeAtDate:", v4);
  -[PLAppTimeService addAudioTimeAtDate:](self, "addAudioTimeAtDate:", v4);
  -[PLAppTimeService addNowPlayingTimeAtDate:](self, "addNowPlayingTimeAtDate:", v4);
  -[PLAppTimeService addStatusBarTimeAtDate:](self, "addStatusBarTimeAtDate:", v4);

}

- (void)chunkAppsOnScreenAtDate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  double v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLAppTimeService appsOnScreen](self, "appsOnScreen");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[PLAppTimeService appsOnScreen](self, "appsOnScreen"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6,
        v8))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[PLAppTimeService appsOnScreen](self, "appsOnScreen");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v23;
      *(_QWORD *)&v11 = 138412546;
      v21 = v11;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[PLAppTimeService lastScreenEventAccountingTime](self, "lastScreenEventAccountingTime", v21);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "timeIntervalSinceDate:", v16);
          v18 = v17;

          -[PLAppTimeService lastScreenEventAccountingTime](self, "lastScreenEventAccountingTime");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLAppTimeService updateScreenOnTimeInDBForBundleId:withTime:withDate:](self, "updateScreenOnTimeInDBForBundleId:withTime:withDate:", v15, v19, v18);

          -[PLAppTimeService setLastScreenEventAccountingTime:](self, "setLastScreenEventAccountingTime:", v4);
          PLLogCommon();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v21;
            v27 = v15;
            v28 = 2048;
            v29 = v18;
            _os_log_debug_impl(&dword_1DA9D6000, v20, OS_LOG_TYPE_DEBUG, "Screen On: Periodic Update - Updating On Screen time for %@ with %f added seconds", buf, 0x16u);
          }

        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v12);
    }
  }
  else
  {
    PLLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[PLAppTimeService chunkAppsOnScreenAtDate:].cold.1();
  }

}

- (void)addForegroundTimeAtDate:(id)a3 withNewLayoutElementsArray:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
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
  void *v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD block[5];
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  double v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PLAppTimeService lastScreenOnTime](self, "lastScreenOnTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAppTimeService lastScreenEventAccountingTime](self, "lastScreenEventAccountingTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v9);
  v11 = v10;

  if (v11 > 0.0)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v12 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __71__PLAppTimeService_addForegroundTimeAtDate_withNewLayoutElementsArray___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v12;
      if (addForegroundTimeAtDate_withNewLayoutElementsArray__defaultOnce != -1)
        dispatch_once(&addForegroundTimeAtDate_withNewLayoutElementsArray__defaultOnce, block);
      if (addForegroundTimeAtDate_withNewLayoutElementsArray__classDebugEnabled)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        -[PLAppTimeService lastScreenEventAccountingTime](self, "lastScreenEventAccountingTime");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAppTimeService lastScreenOnTime](self, "lastScreenOnTime");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("Pulling up last screen on time %@ %@"), v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAppTimeService addForegroundTimeAtDate:withNewLayoutElementsArray:]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 1307);

        PLLogCommon();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    PLLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService addForegroundTimeAtDate:withNewLayoutElementsArray:].cold.2(self, v22);

    -[PLAppTimeService lastScreenOnTime](self, "lastScreenOnTime");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAppTimeService setLastScreenEventAccountingTime:](self, "setLastScreenEventAccountingTime:", v23);

  }
  -[PLAppTimeService lastScreenEventAccountingTime](self, "lastScreenEventAccountingTime");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v24);
  v26 = v25;

  PLLogCommon();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    -[PLAppTimeService addForegroundTimeAtDate:withNewLayoutElementsArray:].cold.1(self, v27);
  v56 = v6;

  self->_musicPlayerForeground = 0;
  if (objc_msgSend(v7, "count"))
  {
    -[PLAppTimeService PiPModeApps](self, "PiPModeApps");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "removeAllObjects");

    -[PLAppTimeService appsOnScreen](self, "appsOnScreen");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "removeAllObjects");

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v30 = v7;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v62 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("bundleID"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v36)
          {
            objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("bundleID"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("AppRole"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLAppTimeService updatePiPModeAppsSet:withAppRole:](self, "updatePiPModeAppsSet:withAppRole:", v37, v38);

            -[PLAppTimeService appsOnScreen](self, "appsOnScreen");
            v39 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("bundleID"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v39, "addObject:", v40);

          }
          else
          {
            PLLogCommon();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v67 = v35;
              _os_log_fault_impl(&dword_1DA9D6000, v39, OS_LOG_TYPE_FAULT, "Failed to retrieve bundle id for app on screen, bundle id is nil for entry %@", buf, 0xCu);
            }
          }

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
      }
      while (v32);
    }

  }
  -[PLAppTimeService lastLayoutEntries](self, "lastLayoutEntries");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "count");

  if (v42)
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    -[PLAppTimeService lastLayoutEntries](self, "lastLayoutEntries");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v45; ++j)
        {
          if (*(_QWORD *)v58 != v46)
            objc_enumerationMutation(v43);
          v48 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
          objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("bundleID"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLAppTimeService lastScreenEventAccountingTime](self, "lastScreenEventAccountingTime");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLAppTimeService updateScreenOnTimeInDBForBundleId:withTime:withDate:](self, "updateScreenOnTimeInDBForBundleId:withTime:withDate:", v49, v50, v26);

          objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("bundleID"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLAppTimeService updateCoalitionsAppsOnScreenSet:](self, "updateCoalitionsAppsOnScreenSet:", v51);

          PLLogCommon();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("bundleID"));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v67 = v55;
            v68 = 2048;
            v69 = v26;
            _os_log_debug_impl(&dword_1DA9D6000, v52, OS_LOG_TYPE_DEBUG, "Screen On: Updating On Screen time for %@ with %f added seconds", buf, 0x16u);

          }
          objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("bundleID"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("com.apple.Music"));

          if (v54)
            self->_musicPlayerForeground = 1;
        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
      }
      while (v45);
    }

  }
  -[PLAppTimeService resetLayoutElementsPLEntryArray:withNowDate:](self, "resetLayoutElementsPLEntryArray:withNowDate:", v7, v56);

}

uint64_t __71__PLAppTimeService_addForegroundTimeAtDate_withNewLayoutElementsArray___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addForegroundTimeAtDate_withNewLayoutElementsArray__classDebugEnabled = result;
  return result;
}

- (void)updateScreenOnTimeInDBForBundleId:(id)a3 withTime:(double)a4 withDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _QWORD block[5];
  _QWORD v37[5];

  v8 = a3;
  v9 = a5;
  -[PLAppTimeService excludedFGAppsSet](self, "excludedFGAppsSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v8);
  if (!v8 || (v11 & 1) != 0 || !-[PLAppTimeService displayState](self, "displayState"))
  {
LABEL_26:

    goto LABEL_27;
  }

  if (a4 > 0.0)
  {
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D22C78]))
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v12 = objc_opt_class();
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __72__PLAppTimeService_updateScreenOnTimeInDBForBundleId_withTime_withDate___block_invoke;
        v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v37[4] = v12;
        if (updateScreenOnTimeInDBForBundleId_withTime_withDate__defaultOnce != -1)
          dispatch_once(&updateScreenOnTimeInDBForBundleId_withTime_withDate__defaultOnce, v37);
        if (updateScreenOnTimeInDBForBundleId_withTime_withDate__classDebugEnabled)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Lock screen diff was %f"), *(_QWORD *)&a4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lastPathComponent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAppTimeService updateScreenOnTimeInDBForBundleId:withTime:withDate:]");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 1348);

          PLLogCommon();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      a4 = fmin(a4, 60.0);
    }
    PLLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService updateScreenOnTimeInDBForBundleId:withTime:withDate:].cold.2();

    v20 = objc_alloc(MEMORY[0x1E0D7FFB0]);
    -[PLAppTimeService aggregatedEntryKeyForAppRunTime](self, "aggregatedEntryKeyForAppRunTime");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v20, "initWithEntryKey:withDate:", v21, v9);

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("BundleID"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, CFSTR("ScreenOnTime"));

    objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1EA1C2168, CFSTR("BackgroundTime"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1EA1C2168, CFSTR("BackgroundPluggedInTime"));
    if (-[PLAppTimeService deviceIsPluggedIn](self, "deviceIsPluggedIn"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, CFSTR("ScreenOnPluggedInTime"));

    }
    else
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1EA1C2168, CFSTR("ScreenOnPluggedInTime"));
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v9, a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logProportionateAggregateEntry:withStartDate:withEndDate:](self, "logProportionateAggregateEntry:withStartDate:withEndDate:", v10, v9, v24);

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v25 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __72__PLAppTimeService_updateScreenOnTimeInDBForBundleId_withTime_withDate___block_invoke_331;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v25;
      if (updateScreenOnTimeInDBForBundleId_withTime_withDate__defaultOnce_329 != -1)
        dispatch_once(&updateScreenOnTimeInDBForBundleId_withTime_withDate__defaultOnce_329, block);
      if (updateScreenOnTimeInDBForBundleId_withTime_withDate__classDebugEnabled_330)
      {
        v26 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BundleID"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ScreenOnTime"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BackgroundTime"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("Added Foreground %@ %@ %@"), v27, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "lastPathComponent");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAppTimeService updateScreenOnTimeInDBForBundleId:withTime:withDate:]");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v33, v34, 1365);

        PLLogCommon();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    goto LABEL_26;
  }
LABEL_27:

}

uint64_t __72__PLAppTimeService_updateScreenOnTimeInDBForBundleId_withTime_withDate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateScreenOnTimeInDBForBundleId_withTime_withDate__classDebugEnabled = result;
  return result;
}

uint64_t __72__PLAppTimeService_updateScreenOnTimeInDBForBundleId_withTime_withDate___block_invoke_331(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateScreenOnTimeInDBForBundleId_withTime_withDate__classDebugEnabled_330 = result;
  return result;
}

- (void)resetLayoutElementsPLEntryArray:(id)a3 withNowDate:(id)a4
{
  id v6;

  v6 = a4;
  if (a3)
    -[PLAppTimeService setLastLayoutEntries:](self, "setLastLayoutEntries:", a3);
  -[PLAppTimeService setLastScreenEventAccountingTime:](self, "setLastScreenEventAccountingTime:", v6);

}

- (void)updatePiPModeAppsSet:(id)a3 withAppRole:(id)a4
{
  id v6;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToValue:", &unk_1EA1C2180)
    && (-[NSMutableSet containsObject:](self->_PiPModeApps, "containsObject:", v6) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_PiPModeApps, "addObject:", v6);
  }

}

- (void)updateCoalitionsAppsOnScreenSet:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSDictionary objectForKey:](self->_backgroundAppToBundleID, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (-[NSMutableSet containsObject:](self->_coalitionsAppsOnScreen, "containsObject:", v5) & 1) == 0)
    -[NSMutableSet addObject:](self->_coalitionsAppsOnScreen, "addObject:", v5);

}

- (double)getCPUTime:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cpu_time"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cpu_time_billed_to_me"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v6 + v8;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cpu_time_billed_to_others"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v12 = v9 - v11;

  return v12;
}

- (double)convertCPUTimeToBackgroundTime:(double)a3 withDuration:(double)a4
{
  double result;

  result = a3 + a3;
  if (result > a4)
    result = a4;
  if (result < 0.0)
    return 0.0;
  return result;
}

- (void)handleCoalitionCallback:(id)a3 withNewCoalitionArray:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  uint64_t v46;
  void *v47;
  double v48;
  double v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id obj;
  uint64_t v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  void *v66;
  void *v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    +[PLOperator entryKeyForType:andName:](PLAppTimeService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("Metrics"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v50 = v7;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    if (v9)
    {
      v10 = v9;
      v53 = 0;
      v11 = 0;
      v55 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v62 != v55)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          +[PLUtilities getIdentifierFromEntry:](PLUtilities, "getIdentifierFromEntry:", v13, v50);
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = (void *)v14;
            v56 = v11;
            v16 = v8;
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("byteswritten"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "intValue");

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("bytesread"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "intValue");

            if ((int)v20 > 0 || (int)v18 >= 1)
            {
              v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v52, v6);
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v15, CFSTR("BundleId"));
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("byteswritten"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("bytesread"));

              objc_msgSend(v51, "addObject:", v22);
            }
            -[NSDictionary objectForKey:](self->_backgroundAppToBundleID, "objectForKey:", v15);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              -[NSDictionary objectForKeyedSubscript:](self->_backgroundAppToBundleID, "objectForKeyedSubscript:", v15);
              v26 = (id)objc_claimAutoreleasedReturnValue();

              v8 = v16;
              if ((-[NSMutableSet containsObject:](self->_coalitionsAppsOnScreen, "containsObject:", v26) & 1) != 0)
              {
                v11 = v56;
              }
              else
              {
                -[PLAppTimeService getCPUTime:](self, "getCPUTime:", v13);
                v28 = v27;
                objc_msgSend(v16, "objectForKey:", v26);
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                if (v29)
                {
                  objc_msgSend(v16, "objectForKeyedSubscript:", v26);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "doubleValue");
                  v32 = v31;

                  v33 = (void *)MEMORY[0x1E0CB37E8];
                  v34 = v28 + v32;
                }
                else
                {
                  v33 = (void *)MEMORY[0x1E0CB37E8];
                  v34 = v28;
                }
                objc_msgSend(v33, "numberWithDouble:", v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "setObject:forKeyedSubscript:", v35, v26);

                objc_msgSend(v13, "entryDate");
                v11 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
                v36 = objc_claimAutoreleasedReturnValue();

                v53 = (void *)v36;
              }

            }
            else
            {
              v26 = v15;
              v8 = v16;
              v11 = v56;
            }
          }
          else
          {
            v26 = 0;
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
      }
      while (v10);
    }
    else
    {
      v53 = 0;
      v11 = 0;
    }

    if (objc_msgSend(v51, "count"))
    {
      v66 = v52;
      v67 = v51;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v37, v52);

    }
    v38 = 0.0;
    v39 = 0.0;
    if (v11 && v53)
    {
      objc_msgSend(v53, "timeIntervalSinceDate:", v11);
      v39 = v40;
    }
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v41 = v8;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v58 != v44)
            objc_enumerationMutation(v41);
          v46 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
          objc_msgSend(v41, "objectForKeyedSubscript:", v46, v50);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "doubleValue");
          -[PLAppTimeService convertCPUTimeToBackgroundTime:withDuration:](self, "convertCPUTimeToBackgroundTime:withDuration:");
          v49 = v48;

          -[PLAppTimeService updateBackgroundTimeInDBForBundleId:withTime:withDate:](self, "updateBackgroundTimeInDBForBundleId:withTime:withDate:", v46, v11, v49);
          if (v49 > v38)
            v38 = v49;
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      }
      while (v43);
    }

    -[NSMutableSet removeAllObjects](self->_coalitionsAppsOnScreen, "removeAllObjects");
    -[PLAppTimeService updateAggregationsAtSBCWithDate:withLongestCoalitionBGTime:withCoalitionLength:](self, "updateAggregationsAtSBCWithDate:withLongestCoalitionBGTime:withCoalitionLength:", v6, v38, v39);

    v7 = v50;
  }

}

- (void)updateInCallServiceTimeAtDate:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[PLAppTimeService inCallNow](self, "inCallNow"))
  {
    -[PLAppTimeService lastCallTime](self, "lastCallTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v4);
    v6 = v5;

    -[PLAppTimeService lastCallBundleID](self, "lastCallBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAppTimeService lastCallTime](self, "lastCallTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAppTimeService updateInCallServiceTimeInDBForBundleId:withTime:withDate:](self, "updateInCallServiceTimeInDBForBundleId:withTime:withDate:", v7, v8, v6);

    -[PLAppTimeService setLastCallTime:](self, "setLastCallTime:", v9);
  }

}

- (void)updateInCallServiceTimeInDBForBundleId:(id)a3 withTime:(double)a4 withDate:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  id v13;
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
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t block;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  uint64_t v34;

  v8 = a3;
  v9 = a5;
  v10 = -[PLAppTimeService inCallNow](self, "inCallNow");
  if (a4 > 0.0 && v8 != 0 && v10)
  {
    v13 = objc_alloc(MEMORY[0x1E0D7FFB0]);
    -[PLAppTimeService aggregatedEntryKeyForAppRunTime](self, "aggregatedEntryKeyForAppRunTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithEntryKey:withDate:", v14, v9);

    objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, CFSTR("BundleID"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("ScreenOnTime"));

    objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1EA1C2168, CFSTR("BackgroundTime"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1EA1C2168, CFSTR("BackgroundPluggedInTime"));
    if (-[PLAppTimeService deviceIsPluggedIn](self, "deviceIsPluggedIn"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("ScreenOnPluggedInTime"));

    }
    else
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1EA1C2168, CFSTR("ScreenOnPluggedInTime"));
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v9, a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logProportionateAggregateEntry:withStartDate:withEndDate:](self, "logProportionateAggregateEntry:withStartDate:withEndDate:", v15, v9, v18);

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v19 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v31 = 3221225472;
      v32 = __77__PLAppTimeService_updateInCallServiceTimeInDBForBundleId_withTime_withDate___block_invoke;
      v33 = &__block_descriptor_40_e5_v8__0lu32l8;
      v34 = v19;
      if (updateInCallServiceTimeInDBForBundleId_withTime_withDate__defaultOnce != -1)
        dispatch_once(&updateInCallServiceTimeInDBForBundleId_withTime_withDate__defaultOnce, &block);
      if (updateInCallServiceTimeInDBForBundleId_withTime_withDate__classDebugEnabled)
      {
        v20 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("BundleID"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ScreenOnTime"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("BackgroundTime"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("Added InCallService Foreground %@ %@ %@"), v21, v22, v23, block, v31, v32, v33, v34);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastPathComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAppTimeService updateInCallServiceTimeInDBForBundleId:withTime:withDate:]");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 1518);

        PLLogCommon();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }

  }
}

uint64_t __77__PLAppTimeService_updateInCallServiceTimeInDBForBundleId_withTime_withDate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateInCallServiceTimeInDBForBundleId_withTime_withDate__classDebugEnabled = result;
  return result;
}

- (void)addAudioTimeAtDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E20];
  -[PLAppTimeService audioPlaybackBundleIDs](self, "audioPlaybackBundleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    PLLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService addAudioTimeAtDate:].cold.3(v8, v9);

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[PLAppTimeService appsOnScreen](self, "appsOnScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v40;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v40 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v14);
          -[PLAppTimeService audioPlaybackBundleIDs](self, "audioPlaybackBundleIDs");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            -[PLAppTimeService audioPlaybackBundleIDs](self, "audioPlaybackBundleIDs");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v4, v15);

            PLLogCommon();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v45 = v15;
              _os_log_debug_impl(&dword_1DA9D6000, v19, OS_LOG_TYPE_DEBUG, "audio: reset time for %@ due to being in the fg", buf, 0xCu);
            }

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v12);
    }

    -[PLAppTimeService appsOnScreen](self, "appsOnScreen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "minusSet:", v20);

    PLLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService addAudioTimeAtDate:].cold.2(self, v8, v21);

    -[PLAppTimeService statusBarBundleID](self, "statusBarBundleID");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      -[PLAppTimeService statusBarBundleID](self, "statusBarBundleID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v8, "containsObject:", v24);

      if (v25)
      {
        -[PLAppTimeService addAudioAndLocationTimeAtDate:](self, "addAudioAndLocationTimeAtDate:", v4);
        PLLogCommon();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[PLAppTimeService addAudioTimeAtDate:].cold.1(self, v26);

        -[PLAppTimeService audioPlaybackBundleIDs](self, "audioPlaybackBundleIDs");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAppTimeService statusBarBundleID](self, "statusBarBundleID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v4, v28);

        -[PLAppTimeService statusBarBundleID](self, "statusBarBundleID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObject:", v29);

      }
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v30 = v8;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v36 != v33)
            objc_enumerationMutation(v30);
          -[PLAppTimeService addAudioTimeAtDate:forBundleID:](self, "addAudioTimeAtDate:forBundleID:", v4, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v32);
    }

  }
}

- (void)addAudioTimeAtDate:(id)a3 forBundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  id v23;
  __int16 v24;
  double v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PLAppTimeService audioPlaybackBundleIDs](self, "audioPlaybackBundleIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    PLLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[PLAppTimeService addAudioTimeAtDate:forBundleID:].cold.1();
    goto LABEL_18;
  }
  objc_msgSend(v6, "timeIntervalSinceDate:", v9);
  v11 = v10;
  -[PLAppTimeService audioPlaybackBundleIDs](self, "audioPlaybackBundleIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, v7);

  if (v11 > 0.0)
  {
    v13 = objc_alloc(MEMORY[0x1E0D7FFB0]);
    -[PLAppTimeService aggregatedEntryKeyForAppRunTime](self, "aggregatedEntryKeyForAppRunTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithEntryKey:withDate:", v14, v6);

    -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v7, CFSTR("BundleID"));
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.Music")))
    {
      if (-[PLAppTimeService musicPlayerForeground](self, "musicPlayerForeground"))
      {
LABEL_18:

        goto LABEL_19;
      }
      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[PLAppTimeService addAudioTimeAtDate:forBundleID:].cold.2();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v17, CFSTR("BackgroundTime"));

      if (-[PLAppTimeService deviceIsPluggedIn](self, "deviceIsPluggedIn"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v18, CFSTR("BackgroundPluggedInTime"));

      }
      else
      {
        -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", &unk_1EA1C2168, CFSTR("BackgroundPluggedInTime"));
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v19, CFSTR("BackgroundAudioPlayingTime"));

    if (-[PLAppTimeService deviceIsPluggedIn](self, "deviceIsPluggedIn"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v20, CFSTR("BackgroundAudioPlayingTimePluggedIn"));

    }
    else
    {
      -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", &unk_1EA1C2168, CFSTR("BackgroundAudioPlayingTimePluggedIn"));
    }
    PLLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = 138412802;
      v23 = v7;
      v24 = 2048;
      v25 = v11;
      v26 = 1024;
      v27 = -[PLAppTimeService deviceIsPluggedIn](self, "deviceIsPluggedIn");
      _os_log_debug_impl(&dword_1DA9D6000, v21, OS_LOG_TYPE_DEBUG, "audio: adding to %@ playback time: %.2f pluggedIn:%d", (uint8_t *)&v22, 0x1Cu);
    }

    -[PLOperator logProportionateAggregateEntry:withStartDate:withEndDate:](self, "logProportionateAggregateEntry:withStartDate:withEndDate:", v15, v9, v6);
    -[PLAppTimeService addAudioUseFromforBundleID:AtDate:](self, "addAudioUseFromforBundleID:AtDate:", v7, v6);
    goto LABEL_18;
  }
LABEL_19:

}

- (void)addNowPlayingTimeAtDate:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[PLAppTimeService nowPlayingBundleID](self, "nowPlayingBundleID");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_6;
  v5 = (void *)v4;
  -[PLAppTimeService appsOnScreen](self, "appsOnScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAppTimeService nowPlayingBundleID](self, "nowPlayingBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8
    || (-[PLAppTimeService lastNowPlayingTime](self, "lastNowPlayingTime"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v19, "timeIntervalSinceDate:", v9),
        v11 = v10,
        v9,
        v11 <= 0.0))
  {
LABEL_6:
    -[PLAppTimeService setLastNowPlayingTime:](self, "setLastNowPlayingTime:", v19);
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x1E0D7FFB0]);
    -[PLAppTimeService aggregatedEntryKeyForAppRunTime](self, "aggregatedEntryKeyForAppRunTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithEntryKey:withDate:", v13, v19);

    -[PLAppTimeService nowPlayingBundleID](self, "nowPlayingBundleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("BundleID"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("BackgroundAudioNowPlayingTime"));

    if (-[PLAppTimeService deviceIsPluggedIn](self, "deviceIsPluggedIn"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("BackgroundAudioNowPlayingPluggedInTime"));

    }
    else
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1EA1C2168, CFSTR("BackgroundAudioNowPlayingPluggedInTime"));
    }
    -[PLAppTimeService lastNowPlayingTime](self, "lastNowPlayingTime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logProportionateAggregateEntry:withStartDate:withEndDate:](self, "logProportionateAggregateEntry:withStartDate:withEndDate:", v14, v18, v19);

    -[PLAppTimeService setLastNowPlayingTime:](self, "setLastNowPlayingTime:", v19);
  }

}

- (void)addStatusBarTimeAtDate:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  -[PLAppTimeService statusBarBundleID](self, "statusBarBundleID");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_11;
  v5 = (void *)v4;
  -[PLAppTimeService appsOnScreen](self, "appsOnScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAppTimeService statusBarBundleID](self, "statusBarBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
    goto LABEL_11;
  -[PLAppTimeService statusBarBundleID](self, "statusBarBundleID");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[PLAppTimeService audioPlaybackBundleIDs](self, "audioPlaybackBundleIDs");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      -[PLAppTimeService audioPlaybackBundleIDs](self, "audioPlaybackBundleIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAppTimeService statusBarBundleID](self, "statusBarBundleID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[PLAppTimeService addAudioAndLocationTimeAtDate:](self, "addAudioAndLocationTimeAtDate:", v26);
LABEL_11:
        -[PLAppTimeService setLastStatusBarTime:](self, "setLastStatusBarTime:", v26);
        goto LABEL_12;
      }
    }
    else
    {

    }
  }
  -[PLAppTimeService lastStatusBarTime](self, "lastStatusBarTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "timeIntervalSinceDate:", v16);
  v18 = v17;

  if (v18 <= 0.0)
    goto LABEL_11;
  v19 = objc_alloc(MEMORY[0x1E0D7FFB0]);
  -[PLAppTimeService aggregatedEntryKeyForAppRunTime](self, "aggregatedEntryKeyForAppRunTime");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithEntryKey:withDate:", v20, v26);

  -[PLAppTimeService statusBarBundleID](self, "statusBarBundleID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("BundleID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("BackgroundLocationTime"));

  if (-[PLAppTimeService deviceIsPluggedIn](self, "deviceIsPluggedIn"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("BackgroundLocationPluggedInTime"));

  }
  else
  {
    objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1EA1C2168, CFSTR("BackgroundLocationPluggedInTime"));
  }
  -[PLAppTimeService lastStatusBarTime](self, "lastStatusBarTime");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator logProportionateAggregateEntry:withStartDate:withEndDate:](self, "logProportionateAggregateEntry:withStartDate:withEndDate:", v21, v25, v26);

  -[PLAppTimeService setLastStatusBarTime:](self, "setLastStatusBarTime:", v26);
LABEL_12:

}

- (void)addAudioAndLocationTimeAtDate:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  -[PLAppTimeService statusBarBundleID](self, "statusBarBundleID");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PLAppTimeService appsOnScreen](self, "appsOnScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAppTimeService statusBarBundleID](self, "statusBarBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

    if ((v8 & 1) == 0)
    {
      -[PLAppTimeService audioPlaybackBundleIDs](self, "audioPlaybackBundleIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAppTimeService statusBarBundleID](self, "statusBarBundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[PLAppTimeService lastStatusBarTime](self, "lastStatusBarTime");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "laterDate:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "timeIntervalSinceDate:", v13);
        if (v14 > 0.0)
        {
          v15 = v14;
          v16 = objc_alloc(MEMORY[0x1E0D7FFB0]);
          -[PLAppTimeService aggregatedEntryKeyForAppRunTime](self, "aggregatedEntryKeyForAppRunTime");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v16, "initWithEntryKey:withDate:", v17, v22);

          -[PLAppTimeService statusBarBundleID](self, "statusBarBundleID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("BundleID"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("BackgroundLocationAudioTime"));

          if (-[PLAppTimeService deviceIsPluggedIn](self, "deviceIsPluggedIn"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("BackgroundLocationAudioPluggedInTime"));

          }
          else
          {
            objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1EA1C2168, CFSTR("BackgroundLocationAudioPluggedInTime"));
          }
          -[PLOperator logProportionateAggregateEntry:withStartDate:withEndDate:](self, "logProportionateAggregateEntry:withStartDate:withEndDate:", v18, v13, v22);

        }
      }

    }
  }

}

- (void)addCellularConditionTimeAtDate:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLAppTimeService lastCellularConditionTime](self, "lastCellularConditionTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && !-[PLAppTimeService lastAirplaneModeStatus](self, "lastAirplaneModeStatus"))
  {
    if (-[PLAppTimeService lastTelephonyRegistrationStatus](self, "lastTelephonyRegistrationStatus"))
    {
      v6 = -[PLAppTimeService lastSignalBar](self, "lastSignalBar");
      if (v6 == -1)
        goto LABEL_20;
    }
    else
    {
      v6 = 0;
    }
    +[PLOperator entryKeyForType:andName:](PLAppTimeService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("CellularCondition"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAppTimeService lastCellularConditionTime](self, "lastCellularConditionTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v8);
    v10 = v9;

    if (v10 <= 0.0)
    {

      goto LABEL_20;
    }
    -[PLAppTimeService bundleIDsInBackground](self, "bundleIDsInBackground");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    if (-[PLAppTimeService displayState](self, "displayState") == 1
      || -[PLAppTimeService displayState](self, "displayState") == 2)
    {
      -[PLAppTimeService appsOnScreen](self, "appsOnScreen");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "unionSet:", v13);

    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v12;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v7, v4);
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("BundleID"));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("SignalBars"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("CellUsageTime"));

          -[PLAppTimeService lastCellularConditionTime](self, "lastCellularConditionTime");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLOperator logProportionateAggregateEntry:withStartDate:withEndDate:](self, "logProportionateAggregateEntry:withStartDate:withEndDate:", v19, v22, v4);

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v15);
    }

  }
  -[PLAppTimeService setLastCellularConditionTime:](self, "setLastCellularConditionTime:", v4);
LABEL_20:

}

- (void)addNotificationCountFromUserInfo:(id)a3 AtDate:(id)a4
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NotificationBundleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PLAppTimeService addNotificationCountFromUserInfo:AtDate:].cold.1();

  objc_msgSend(v5, "entryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAppTimeService logAppUsageEventForKey:withBundleID:withDate:](self, "logAppUsageEventForKey:withBundleID:withDate:", CFSTR("NotificationCount"), v6, v8);

}

- (void)addWidgetUseFromUserInfo:(id)a3 AtDate:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAppTimeService getWidgetParentAppForBundleID:](self, "getWidgetParentAppForBundleID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    PLLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService addWidgetUseFromUserInfo:AtDate:].cold.1();

    objc_msgSend(v5, "entryDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAppTimeService logAppUsageEventForKey:withBundleID:withDate:](self, "logAppUsageEventForKey:withBundleID:withDate:", CFSTR("HasWidgetActive"), v7, v9);

  }
}

- (void)addCarPlayUseFromLayoutEntry:(id)a3 AtDate:(id)a4
{
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v19;
    *(_QWORD *)&v7 = 138412290;
    v17 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Display"), v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "intValue");

        if (v13 == 3)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bundleID"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          PLLogCommon();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v17;
            v23 = v11;
            _os_log_debug_impl(&dword_1DA9D6000, v15, OS_LOG_TYPE_DEBUG, "Added app usage event: Carplay %@", buf, 0xCu);
          }

          objc_msgSend(v11, "entryDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLAppTimeService logAppUsageEventForKey:withBundleID:withDate:](self, "logAppUsageEventForKey:withBundleID:withDate:", CFSTR("HasCarPlayUsage"), v14, v16);

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

}

- (id)getWidgetParentAppForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v17;
  NSObject *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLAppTimeService widgetParentBundleIDs](self, "widgetParentBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("PluginId"), v4, 0);
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "storage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "entriesForKey:withComparisons:", CFSTR("PLApplicationAgent_EventNone_AllPlugins"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v13, "firstObject");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("PluginParentApp"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = v14;
        _os_log_impl(&dword_1DA9D6000, v15, OS_LOG_TYPE_DEFAULT, "Added app usage event queryResult= %@", (uint8_t *)&v17, 0xCu);
      }

      if (v9)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetParentBundleIDs, "setObject:forKeyedSubscript:", v9, v4);
LABEL_14:

        goto LABEL_15;
      }

    }
    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[PLAppTimeService getWidgetParentAppForBundleID:].cold.1();
    v9 = 0;
    goto LABEL_14;
  }
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PLAppTimeService getWidgetParentAppForBundleID:].cold.2((uint64_t)self, (uint64_t)v4, v7);

  -[PLAppTimeService widgetParentBundleIDs](self, "widgetParentBundleIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v9;
}

- (void)addAudioUseFromforBundleID:(id)a3 AtDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a4;
  v7 = a3;
  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PLAppTimeService addAudioUseFromforBundleID:AtDate:].cold.1();

  -[PLAppTimeService logAppUsageEventForKey:withBundleID:withDate:](self, "logAppUsageEventForKey:withBundleID:withDate:", CFSTR("HasAudioUsage"), v7, v6);
}

- (void)logAppUsageEventForKey:(id)a3 withBundleID:(id)a4 withDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", self->_aggregatedEntryKeyForAppUsageEvents, v10);
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v9, CFSTR("BundleID"));
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v8);
    -[PLOperator logEntry:](self, "logEntry:", v11);
    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService logAppUsageEventForKey:withBundleID:withDate:].cold.2();

  }
  else
  {
    PLLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService logAppUsageEventForKey:withBundleID:withDate:].cold.1();
  }

}

- (id)backgroundAppToBundleIDmapping
{
  NSDictionary *backgroundAppToBundleID;

  backgroundAppToBundleID = self->_backgroundAppToBundleID;
  if (!backgroundAppToBundleID)
  {
    self->_backgroundAppToBundleID = (NSDictionary *)&unk_1EA1DA4C0;

    backgroundAppToBundleID = self->_backgroundAppToBundleID;
  }
  return backgroundAppToBundleID;
}

- (void)updateAggregationsAtSBCWithDate:(id)a3 withLongestCoalitionBGTime:(double)a4 withCoalitionLength:(double)a5
{
  id v7;
  char *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  char *v19;
  double *p_totalFGTimeSBC;
  double totalFGTimeSBC;
  double v22;
  double *p_totalBGTimeSBC;
  double *p_totalAPOnTimeSBC;
  double v25;
  double v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;

  v7 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    -[PLAppTimeService chunkScreenOnAggregationAtDate:](self, "chunkScreenOnAggregationAtDate:", v7);
    PLLogCommon();
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService updateAggregationsAtSBCWithDate:withLongestCoalitionBGTime:withCoalitionLength:].cold.11(self, v8);

    -[PLAppTimeService lastAPOnTimeSBC](self, "lastAPOnTimeSBC");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[PLAppTimeService lastAPOnTimeSBC](self, "lastAPOnTimeSBC");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v10);
      v12 = v11;

      if (v12 > 0.0)
      {
        -[PLAppTimeService setLastAPOnTimeSBC:](self, "setLastAPOnTimeSBC:", v7);
        -[PLAppTimeService totalAPOnTimeSBC](self, "totalAPOnTimeSBC");
        -[PLAppTimeService setTotalAPOnTimeSBC:](self, "setTotalAPOnTimeSBC:", v12 + v13);
      }
    }
    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService updateAggregationsAtSBCWithDate:withLongestCoalitionBGTime:withCoalitionLength:].cold.10(self, v14);

    -[PLAppTimeService firstBGAppTimeSBC](self, "firstBGAppTimeSBC");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v7, "timeIntervalSinceDate:", self->_firstBGAppTimeSBC);
      if (v16 > 0.0)
      {
        v17 = v16;
        -[PLAppTimeService setFirstBGAppTimeSBC:](self, "setFirstBGAppTimeSBC:", v7);
        -[PLAppTimeService totalBGTimeSBC](self, "totalBGTimeSBC");
        -[PLAppTimeService setTotalBGTimeSBC:](self, "setTotalBGTimeSBC:", v17 + v18);
      }
    }
    PLLogCommon();
    v19 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService updateAggregationsAtSBCWithDate:withLongestCoalitionBGTime:withCoalitionLength:].cold.9(self, v19);

    p_totalFGTimeSBC = &self->_totalFGTimeSBC;
    totalFGTimeSBC = self->_totalFGTimeSBC;
    v22 = a4 - totalFGTimeSBC;
    p_totalBGTimeSBC = &self->_totalBGTimeSBC;
    if (a4 - totalFGTimeSBC < self->_totalBGTimeSBC - totalFGTimeSBC)
      v22 = self->_totalBGTimeSBC - totalFGTimeSBC;
    p_totalAPOnTimeSBC = &self->_totalAPOnTimeSBC;
    v25 = self->_totalAPOnTimeSBC - totalFGTimeSBC;
    if (v22 < v25)
      v25 = v22;
    if (v25 >= 0.0)
      v26 = v25;
    else
      v26 = 0.0;
    PLLogCommon();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService updateAggregationsAtSBCWithDate:withLongestCoalitionBGTime:withCoalitionLength:].cold.8();

    PLLogCommon();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService updateAggregationsAtSBCWithDate:withLongestCoalitionBGTime:withCoalitionLength:].cold.7();

    PLLogCommon();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService updateAggregationsAtSBCWithDate:withLongestCoalitionBGTime:withCoalitionLength:].cold.6();

    PLLogCommon();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService updateAggregationsAtSBCWithDate:withLongestCoalitionBGTime:withCoalitionLength:].cold.5((uint64_t)&self->_totalFGTimeSBC, v30, v31, v32, v33, v34, v35, v36);

    PLLogCommon();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService updateAggregationsAtSBCWithDate:withLongestCoalitionBGTime:withCoalitionLength:].cold.4((uint64_t)&self->_totalBGTimeSBC, v37, v38, v39, v40, v41, v42, v43);

    PLLogCommon();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService updateAggregationsAtSBCWithDate:withLongestCoalitionBGTime:withCoalitionLength:].cold.3((uint64_t)&self->_totalAPOnTimeSBC, v44, v45, v46, v47, v48, v49, v50);

    PLLogCommon();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService updateAggregationsAtSBCWithDate:withLongestCoalitionBGTime:withCoalitionLength:].cold.2();

    -[PLAppTimeService updateScreenOffTimeAtDate:withDiff:](self, "updateScreenOffTimeAtDate:withDiff:", v7, v26);
    PLLogCommon();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService updateAggregationsAtSBCWithDate:withLongestCoalitionBGTime:withCoalitionLength:].cold.1();

    *p_totalAPOnTimeSBC = 0.0;
    *p_totalFGTimeSBC = 0.0;
    *p_totalBGTimeSBC = 0.0;
  }

}

- (void)chunkScreenOnAggregationAtDate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  double v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService chunkScreenOnAggregationAtDate:].cold.1();

    -[PLAppTimeService lastScreenOnTimeSBC](self, "lastScreenOnTimeSBC");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PLAppTimeService lastScreenOnTimeSBC](self, "lastScreenOnTimeSBC");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeIntervalSinceDate:", v7);
      v9 = v8;

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        -[PLAppTimeService lastScreenOnTimeSBC](self, "lastScreenOnTimeSBC");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412802;
        v14 = v11;
        v15 = 2112;
        v16 = v4;
        v17 = 2048;
        v18 = v9;
        _os_log_impl(&dword_1DA9D6000, v10, OS_LOG_TYPE_INFO, "[%@, %@] : %f", (uint8_t *)&v13, 0x20u);

      }
      if (v9 >= 0.0)
      {
        -[PLAppTimeService setLastScreenOnTimeSBC:](self, "setLastScreenOnTimeSBC:", v4);
        -[PLAppTimeService totalFGTimeSBC](self, "totalFGTimeSBC");
        -[PLAppTimeService setTotalFGTimeSBC:](self, "setTotalFGTimeSBC:", v9 + v12);
        -[PLAppTimeService updateScreenOnTimeAtDate:withDiff:](self, "updateScreenOnTimeAtDate:withDiff:", v4, v9);
      }
    }
  }

}

- (void)updateAggregationsAtDate:(id)a3 withNewScreenState:(int)a4
{
  id v6;
  char v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  double v15;
  char *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x1E0D80020], "isHomePod");
  if (v6 && (v7 & 1) == 0)
  {
    if (-[PLAppTimeService displayState](self, "displayState") == a4)
    {
      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
LABEL_10:

        goto LABEL_11;
      }
      LOWORD(v18) = 0;
      v9 = "No screen state change!";
LABEL_6:
      _os_log_impl(&dword_1DA9D6000, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v18, 2u);
      goto LABEL_10;
    }
    if (a4 == 1)
    {
      -[PLAppTimeService setLastScreenOnTimeSBC:](self, "setLastScreenOnTimeSBC:", v6);
      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLAppTimeService updateAggregationsAtDate:withNewScreenState:].cold.1();
      goto LABEL_10;
    }
    -[PLAppTimeService lastScreenOnTimeSBC](self, "lastScreenOnTimeSBC");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        goto LABEL_10;
      LOWORD(v18) = 0;
      v9 = "Screen turning off, but no open screen interval";
      goto LABEL_6;
    }
    -[PLAppTimeService lastScreenOnTimeSBC](self, "lastScreenOnTimeSBC");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v11);
    v13 = v12;

    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      -[PLAppTimeService lastScreenOnTimeSBC](self, "lastScreenOnTimeSBC");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v17;
      v20 = 2112;
      v21 = v6;
      v22 = 2048;
      v23 = v13;
      _os_log_debug_impl(&dword_1DA9D6000, v14, OS_LOG_TYPE_DEBUG, "Stopping FG interval [%@, %@] : %f", (uint8_t *)&v18, 0x20u);

    }
    -[PLAppTimeService setLastScreenOnTimeSBC:](self, "setLastScreenOnTimeSBC:", 0);
    if (v13 >= 0.0)
    {
      -[PLAppTimeService totalFGTimeSBC](self, "totalFGTimeSBC");
      -[PLAppTimeService setTotalFGTimeSBC:](self, "setTotalFGTimeSBC:", v13 + v15);
      PLLogCommon();
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG))
        -[PLAppTimeService updateAggregationsAtDate:withNewScreenState:].cold.2(self, v16);

      -[PLAppTimeService updateScreenOnTimeAtDate:withDiff:](self, "updateScreenOnTimeAtDate:withDiff:", v6, v13);
    }
  }
LABEL_11:

}

- (void)updateAggregationsAtDate:(id)a3 withNewAPState:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  char v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  char *v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  double v20;
  NSObject *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  NSObject *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v4 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x1E0D80020], "isHomePod");
  if (!v6 || (v7 & 1) != 0)
    goto LABEL_32;
  if (self->_isAPOn == v4)
  {
    PLLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PLAppTimeService updateAggregationsAtDate:withNewAPState:].cold.1();
LABEL_31:

    goto LABEL_32;
  }
  if (v4)
  {
    -[PLAppTimeService setLastAPOnTimeSBC:](self, "setLastAPOnTimeSBC:", v6);
    PLLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService updateAggregationsAtDate:withNewAPState:].cold.2();
    goto LABEL_31;
  }
  -[PLAppTimeService lastScreenOnTimeSBC](self, "lastScreenOnTimeSBC");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    PLLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PLAppTimeService updateAggregationsAtDate:withNewAPState:].cold.7();

    -[PLAppTimeService lastScreenOnTimeSBC](self, "lastScreenOnTimeSBC");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v11);
    v13 = v12;

    -[PLAppTimeService setLastScreenOnTimeSBC:](self, "setLastScreenOnTimeSBC:", 0);
    if (v13 >= 0.0)
    {
      -[PLAppTimeService totalFGTimeSBC](self, "totalFGTimeSBC");
      -[PLAppTimeService setTotalFGTimeSBC:](self, "setTotalFGTimeSBC:", v13 + v14);
      PLLogCommon();
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG))
        -[PLAppTimeService updateAggregationsAtDate:withNewScreenState:].cold.2(self, v15);

      -[PLAppTimeService updateScreenOnTimeAtDate:withDiff:](self, "updateScreenOnTimeAtDate:withDiff:", v6, v13);
    }
  }
  -[PLAppTimeService lastAPOnTimeSBC](self, "lastAPOnTimeSBC");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    PLLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[PLAppTimeService updateAggregationsAtDate:withNewAPState:].cold.4();
    goto LABEL_24;
  }
  objc_msgSend(v6, "timeIntervalSinceDate:", self->_lastAPOnTimeSBC);
  v18 = v17;
  PLLogCommon();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    -[PLAppTimeService lastAPOnTimeSBC](self, "lastAPOnTimeSBC");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412802;
    v32 = v29;
    v33 = 2112;
    v34 = v6;
    v35 = 2048;
    v36 = v18;
    _os_log_debug_impl(&dword_1DA9D6000, v19, OS_LOG_TYPE_DEBUG, "Stopping AP interval [%@, %@] : %f", (uint8_t *)&v31, 0x20u);

  }
  -[PLAppTimeService setLastAPOnTimeSBC:](self, "setLastAPOnTimeSBC:", 0);
  if (v18 > 0.0)
  {
    -[PLAppTimeService totalAPOnTimeSBC](self, "totalAPOnTimeSBC");
    -[PLAppTimeService setTotalAPOnTimeSBC:](self, "setTotalAPOnTimeSBC:", v18 + v20);
    PLLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService updateAggregationsAtDate:withNewAPState:].cold.5(self, v21);
LABEL_24:

  }
  -[PLAppTimeService firstBGAppTimeSBC](self, "firstBGAppTimeSBC");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[PLAppTimeService firstBGAppTimeSBC](self, "firstBGAppTimeSBC");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v23);
    v25 = v24;

    PLLogCommon();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      -[PLAppTimeService firstBGAppTimeSBC](self, "firstBGAppTimeSBC");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138412802;
      v32 = v30;
      v33 = 2112;
      v34 = v6;
      v35 = 2048;
      v36 = v25;
      _os_log_debug_impl(&dword_1DA9D6000, v26, OS_LOG_TYPE_DEBUG, "Stopping BG interval [%@, %@] : %f", (uint8_t *)&v31, 0x20u);

    }
    -[PLAppTimeService setFirstBGAppTimeSBC:](self, "setFirstBGAppTimeSBC:", 0);
    if (v25 > 0.0)
    {
      -[PLAppTimeService totalBGTimeSBC](self, "totalBGTimeSBC");
      -[PLAppTimeService setTotalBGTimeSBC:](self, "setTotalBGTimeSBC:", v25 + v27);
      -[PLAppTimeService addCellularConditionTimeAtDate:](self, "addCellularConditionTimeAtDate:", v6);
      -[PLAppTimeService bundleIDsInBackground](self, "bundleIDsInBackground");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "removeAllObjects");

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLAppTimeService updateAggregationsAtDate:withNewAPState:].cold.3(self, (char *)v8);
      goto LABEL_31;
    }
  }
LABEL_32:

}

- (void)updateAggregationsAtDate:(id)a3 withNewPluggedInState:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  NSObject *v13;
  PLAppTimeService *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;

  v4 = a4;
  v6 = a3;
  if (self->_deviceIsPluggedIn != v4)
  {
    if (v4)
    {
      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PLAppTimeService updateAggregationsAtDate:withNewPluggedInState:].cold.4();

      goto LABEL_13;
    }
    -[PLAppTimeService lastPluggedInTime](self, "lastPluggedInTime");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[PLAppTimeService lastPluggedInTime](self, "lastPluggedInTime");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSinceDate:", v18);
      v20 = v19;

      -[PLAppTimeService updatePluggedInTimeAtDate:withDiff:](self, "updatePluggedInTimeAtDate:withDiff:", v6, v20);
      PLLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[PLAppTimeService updateAggregationsAtDate:withNewPluggedInState:].cold.6();

      v14 = self;
      v15 = 0;
      goto LABEL_20;
    }
    PLLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PLAppTimeService updateAggregationsAtDate:withNewPluggedInState:].cold.5();
LABEL_23:

    goto LABEL_24;
  }
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PLAppTimeService updateAggregationsAtDate:withNewPluggedInState:].cold.3();

  if (!v4)
  {
    PLLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService updateAggregationsAtDate:withNewPluggedInState:].cold.2();
    goto LABEL_23;
  }
  -[PLAppTimeService lastPluggedInTime](self, "lastPluggedInTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PLAppTimeService lastPluggedInTime](self, "lastPluggedInTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v9);
    v11 = v10;

    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[PLAppTimeService updateAggregationsAtDate:withNewPluggedInState:].cold.1();

    -[PLAppTimeService updatePluggedInTimeAtDate:withDiff:](self, "updatePluggedInTimeAtDate:withDiff:", v6, v11);
  }
LABEL_13:
  v14 = self;
  v15 = v6;
LABEL_20:
  -[PLAppTimeService setLastPluggedInTime:](v14, "setLastPluggedInTime:", v15);
LABEL_24:

}

- (void)updatePluggedInTimeAtDate:(id)a3 withDiff:(double)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a3)
  {
    if (a4 >= 0.0)
    {
      v6 = (objc_class *)MEMORY[0x1E0D7FFB0];
      v7 = a3;
      v8 = [v6 alloc];
      -[PLAppTimeService entryKeyUsageTime](self, "entryKeyUsageTime");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v8, "initWithEntryKey:withDate:", v9, v7);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("PluggedIn"));

      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v7, -a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator logProportionateAggregateEntry:withStartDate:withEndDate:](self, "logProportionateAggregateEntry:withStartDate:withEndDate:", v12, v11, v7);

    }
  }
}

- (void)updateScreenOffTimeAtDate:(id)a3 withDiff:(double)a4
{
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = objc_msgSend(MEMORY[0x1E0D80020], "isHomePod");
  v7 = v13;
  if ((v6 & 1) == 0 && v13 && a4 >= 0.0)
  {
    v8 = objc_alloc(MEMORY[0x1E0D7FFB0]);
    -[PLAppTimeService entryKeyUsageTime](self, "entryKeyUsageTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithEntryKey:withDate:", v9, v13);

    objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1EA1C2168, CFSTR("ScreenOn"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("ScreenOff"));

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v13, -a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logProportionateAggregateEntry:withStartDate:withEndDate:](self, "logProportionateAggregateEntry:withStartDate:withEndDate:", v10, v12, v13);

    v7 = v13;
  }

}

- (void)updateScreenOnTimeAtDate:(id)a3 withDiff:(double)a4
{
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = objc_msgSend(MEMORY[0x1E0D80020], "isHomePod");
  v7 = v13;
  if ((v6 & 1) == 0 && v13 && a4 >= 0.0)
  {
    v8 = objc_alloc(MEMORY[0x1E0D7FFB0]);
    -[PLAppTimeService entryKeyUsageTime](self, "entryKeyUsageTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithEntryKey:withDate:", v9, v13);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("ScreenOn"));

    objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1EA1C2168, CFSTR("ScreenOff"));
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v13, -a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logProportionateAggregateEntry:withStartDate:withEndDate:](self, "logProportionateAggregateEntry:withStartDate:withEndDate:", v10, v12, v13);

    v7 = v13;
  }

}

- (void)updateBackgroundAppsForBundleID:(id)a3 withState:(unsigned int)a4 withDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  NSObject *v36;

  v8 = a3;
  v9 = a5;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0 && v8 && v9)
  {
    if (a4 == 4)
    {
      -[PLAppTimeService addCellularConditionTimeAtDate:](self, "addCellularConditionTimeAtDate:", v9);
      -[PLAppTimeService bundleIDsInBackground](self, "bundleIDsInBackground");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (!v11)
      {
        -[PLAppTimeService excludedBundleIDsInBackground](self, "excludedBundleIDsInBackground");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v8);

        if (v13)
        {
          PLLogCommon();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            -[PLAppTimeService updateBackgroundAppsForBundleID:withState:withDate:].cold.1();
        }
        else
        {
          -[PLAppTimeService setFirstBGAppTimeSBC:](self, "setFirstBGAppTimeSBC:", v9);
          PLLogCommon();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            -[PLAppTimeService updateBackgroundAppsForBundleID:withState:withDate:].cold.2();
        }

      }
      -[PLAppTimeService bundleIDsInBackground](self, "bundleIDsInBackground");
      v36 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v36, "addObject:", v8);
LABEL_30:

      goto LABEL_31;
    }
    -[PLAppTimeService bundleIDsInBackground](self, "bundleIDsInBackground");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", v8);

    if (v16)
      -[PLAppTimeService addCellularConditionTimeAtDate:](self, "addCellularConditionTimeAtDate:", v9);
    -[PLAppTimeService bundleIDsInBackground](self, "bundleIDsInBackground");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "containsObject:", v8);

    if (v18)
    {
      -[PLAppTimeService bundleIDsInBackground](self, "bundleIDsInBackground");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeObject:", v8);

      -[PLAppTimeService bundleIDsInBackground](self, "bundleIDsInBackground");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v21 == 1)
      {
        -[PLAppTimeService bundleIDsInBackground](self, "bundleIDsInBackground");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "anyObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          -[PLAppTimeService excludedBundleIDsInBackground](self, "excludedBundleIDsInBackground");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "containsObject:", v23);

          if (v25)
          {
            PLLogCommon();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              -[PLAppTimeService updateBackgroundAppsForBundleID:withState:withDate:].cold.7();

            -[PLAppTimeService bundleIDsInBackground](self, "bundleIDsInBackground");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "removeObject:", v23);

          }
        }

      }
      -[PLAppTimeService bundleIDsInBackground](self, "bundleIDsInBackground");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count");

      if (!v29)
      {
        PLLogCommon();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[PLAppTimeService updateBackgroundAppsForBundleID:withState:withDate:].cold.6();

        -[PLAppTimeService firstBGAppTimeSBC](self, "firstBGAppTimeSBC");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          -[PLAppTimeService firstBGAppTimeSBC](self, "firstBGAppTimeSBC");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "timeIntervalSinceDate:", v32);
          v34 = v33;

          -[PLAppTimeService setFirstBGAppTimeSBC:](self, "setFirstBGAppTimeSBC:", 0);
          if (v34 <= 0.0)
          {
            PLLogCommon();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              -[PLAppTimeService updateBackgroundAppsForBundleID:withState:withDate:].cold.5();
          }
          else
          {
            -[PLAppTimeService totalBGTimeSBC](self, "totalBGTimeSBC");
            -[PLAppTimeService setTotalBGTimeSBC:](self, "setTotalBGTimeSBC:", v34 + v35);
            PLLogCommon();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              -[PLAppTimeService updateBackgroundAppsForBundleID:withState:withDate:].cold.4(self, (char *)v36);
          }
        }
        else
        {
          PLLogCommon();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            -[PLAppTimeService updateBackgroundAppsForBundleID:withState:withDate:].cold.3();
        }
        goto LABEL_30;
      }
    }
  }
LABEL_31:

}

- (id)generateExcludedBGBundleIDs
{
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.Bridge"), CFSTR("com.apple.CloudKit.ShareBear"), CFSTR("com.apple.PassbookUIService"), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v4 = *MEMORY[0x1E0D80368];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLAppTimeService, "entryKeyForType:andName:", v4, CFSTR("AppRunTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "isEqualToString:", v6);

  if ((_DWORD)v4)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateByAddingTimeInterval:", -1209600.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateByAddingTimeInterval:", -1209600.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSince1970");
    v15 = v14;
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dateByAddingTimeInterval:", -2592000.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSince1970");
    objc_msgSend(v7, "stringWithFormat:", CFSTR("(timeInterval = %f AND timestamp < %f) OR (timeInterval = %f AND timestamp < %f AND (BundleID NOT IN (SELECT N.Name FROM PLAccountingOperator_Aggregate_RootNodeEnergy RNE JOIN PLAccountingOperator_EventNone_Nodes N WHERE N.ID = RNE.NodeID AND RNE.timeInterval = 86400.0 AND RNE.Energy > %f GROUP BY RNE.NodeID))) OR (timeInterval = %f AND timestamp < %f)"), 0x40AC200000000000, v11, 0x40F5180000000000, v15, 0x40F86A0000000000, 0x40F5180000000000, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
  return v19;
}

- (PLEntryNotificationOperatorComposition)coalitionCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCoalitionCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLEntryNotificationOperatorComposition)screenstateCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setScreenstateCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLEntryNotificationOperatorComposition)applicationCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setApplicationCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLEntryNotificationOperatorComposition)batteryCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBatteryCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLEntryNotificationOperatorComposition)displayCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDisplayCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PLEntryNotificationOperatorComposition)InCallServiceCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInCallServiceCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (PLEntryNotificationOperatorComposition)pluginCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPluginCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLEntryNotificationOperatorComposition)audioCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAudioCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PLEntryNotificationOperatorComposition)nowPlayingCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNowPlayingCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (PLEntryNotificationOperatorComposition)statusBarCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setStatusBarCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PLEntryNotificationOperatorComposition)backgroundTransferCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setBackgroundTransferCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (PLEntryNotificationOperatorComposition)cellularConditionCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setCellularConditionCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (PLEntryNotificationOperatorComposition)telephonyRegistrationCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTelephonyRegistrationCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (PLEntryNotificationOperatorComposition)notificationCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setNotificationCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (PLEntryNotificationOperatorComposition)widgetCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setWidgetCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (PLNSNotificationOperatorComposition)powerOutCallback
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 184, 1);
}

- (void)setPowerOutCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (PLEntryNotificationOperatorComposition)canSleepEntryNotifications
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 192, 1);
}

- (PLEntryNotificationOperatorComposition)wakeEntryNotifications
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 200, 1);
}

- (int)displayState
{
  return self->_displayState;
}

- (void)setDisplayState:(int)a3
{
  self->_displayState = a3;
}

- (BOOL)isAPOn
{
  return self->_isAPOn;
}

- (void)setIsAPOn:(BOOL)a3
{
  self->_isAPOn = a3;
}

- (BOOL)deviceIsPluggedIn
{
  return self->_deviceIsPluggedIn;
}

- (void)setDeviceIsPluggedIn:(BOOL)a3
{
  self->_deviceIsPluggedIn = a3;
}

- (NSDate)lastScreenOnTime
{
  return (NSDate *)objc_getProperty(self, a2, 208, 1);
}

- (void)setLastScreenOnTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSDate)lastScreenEventAccountingTime
{
  return (NSDate *)objc_getProperty(self, a2, 216, 1);
}

- (void)setLastScreenEventAccountingTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSMutableDictionary)inFlightBundleIDStartTime
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)setInFlightBundleIDStartTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (PLTimer)runTimeAggregatorTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 232, 1);
}

- (void)setRunTimeAggregatorTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSArray)lastLayoutEntries
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setLastLayoutEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSSet)excludedFGAppsSet
{
  return (NSSet *)objc_getProperty(self, a2, 248, 1);
}

- (NSSet)excludedBGAppsSet
{
  return (NSSet *)objc_getProperty(self, a2, 256, 1);
}

- (BOOL)inCallNow
{
  return self->_inCallNow;
}

- (void)setInCallNow:(BOOL)a3
{
  self->_inCallNow = a3;
}

- (NSDate)lastCallTime
{
  return (NSDate *)objc_getProperty(self, a2, 264, 1);
}

- (void)setLastCallTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (NSString)lastCallBundleID
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setLastCallBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSMutableSet)coalitionsAppsOnScreen
{
  return (NSMutableSet *)objc_getProperty(self, a2, 280, 1);
}

- (void)setCoalitionsAppsOnScreen:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSMutableSet)appsOnScreen
{
  return (NSMutableSet *)objc_getProperty(self, a2, 288, 1);
}

- (void)setAppsOnScreen:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (NSMutableSet)PiPModeApps
{
  return (NSMutableSet *)objc_getProperty(self, a2, 296, 1);
}

- (void)setPiPModeApps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (NSMutableSet)watchkitExtensions
{
  return (NSMutableSet *)objc_getProperty(self, a2, 304, 1);
}

- (void)setWatchkitExtensions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (NSMutableDictionary)widgetParentBundleIDs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 312, 1);
}

- (void)setWidgetParentBundleIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (NSString)nowPlayingBundleID
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setNowPlayingBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSString)statusBarBundleID
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (void)setStatusBarBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (BOOL)musicPlayerForeground
{
  return self->_musicPlayerForeground;
}

- (void)setMusicPlayerForeground:(BOOL)a3
{
  self->_musicPlayerForeground = a3;
}

- (NSDate)lastNowPlayingTime
{
  return (NSDate *)objc_getProperty(self, a2, 336, 1);
}

- (void)setLastNowPlayingTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (NSDate)lastStatusBarTime
{
  return (NSDate *)objc_getProperty(self, a2, 344, 1);
}

- (void)setLastStatusBarTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (NSDate)lastCellularConditionTime
{
  return (NSDate *)objc_getProperty(self, a2, 352, 1);
}

- (void)setLastCellularConditionTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (int64_t)lastSignalBar
{
  return self->_lastSignalBar;
}

- (void)setLastSignalBar:(int64_t)a3
{
  self->_lastSignalBar = a3;
}

- (BOOL)lastTelephonyRegistrationStatus
{
  return self->_lastTelephonyRegistrationStatus;
}

- (void)setLastTelephonyRegistrationStatus:(BOOL)a3
{
  self->_lastTelephonyRegistrationStatus = a3;
}

- (BOOL)lastAirplaneModeStatus
{
  return self->_lastAirplaneModeStatus;
}

- (void)setLastAirplaneModeStatus:(BOOL)a3
{
  self->_lastAirplaneModeStatus = a3;
}

- (NSMutableDictionary)audioPlaybackBundleIDs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 368, 1);
}

- (void)setAudioPlaybackBundleIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (NSString)aggregatedEntryKeyForAppRunTime
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (void)setAggregatedEntryKeyForAppRunTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (NSString)aggregatedEntryKeyForAppUsageEvents
{
  return (NSString *)objc_getProperty(self, a2, 384, 1);
}

- (void)setAggregatedEntryKeyForAppUsageEvents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (NSString)entryKeyPLScreenStateAgentScreenState
{
  return (NSString *)objc_getProperty(self, a2, 392, 1);
}

- (NSString)entryKeyPLCoalitionAgentEventIntervalCoalition
{
  return (NSString *)objc_getProperty(self, a2, 400, 1);
}

- (NSDictionary)backgroundAppToBundleID
{
  return (NSDictionary *)objc_getProperty(self, a2, 408, 1);
}

- (NSString)entryKeyUsageTime
{
  return (NSString *)objc_getProperty(self, a2, 416, 1);
}

- (void)setEntryKeyUsageTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (NSDate)lastAPOnTimeSBC
{
  return (NSDate *)objc_getProperty(self, a2, 424, 1);
}

- (void)setLastAPOnTimeSBC:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (double)totalAPOnTimeSBC
{
  return self->_totalAPOnTimeSBC;
}

- (void)setTotalAPOnTimeSBC:(double)a3
{
  self->_totalAPOnTimeSBC = a3;
}

- (NSDate)lastScreenOnTimeSBC
{
  return (NSDate *)objc_getProperty(self, a2, 440, 1);
}

- (void)setLastScreenOnTimeSBC:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (double)totalFGTimeSBC
{
  return self->_totalFGTimeSBC;
}

- (void)setTotalFGTimeSBC:(double)a3
{
  self->_totalFGTimeSBC = a3;
}

- (NSMutableSet)bundleIDsInBackground
{
  return (NSMutableSet *)objc_getProperty(self, a2, 456, 1);
}

- (void)setBundleIDsInBackground:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (NSDate)firstBGAppTimeSBC
{
  return (NSDate *)objc_getProperty(self, a2, 464, 1);
}

- (void)setFirstBGAppTimeSBC:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (double)totalBGTimeSBC
{
  return self->_totalBGTimeSBC;
}

- (void)setTotalBGTimeSBC:(double)a3
{
  self->_totalBGTimeSBC = a3;
}

- (NSSet)excludedBundleIDsInBackground
{
  return (NSSet *)objc_getProperty(self, a2, 480, 1);
}

- (void)setExcludedBundleIDsInBackground:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
}

- (NSDate)lastPluggedInTime
{
  return (NSDate *)objc_getProperty(self, a2, 488, 1);
}

- (void)setLastPluggedInTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 488);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPluggedInTime, 0);
  objc_storeStrong((id *)&self->_excludedBundleIDsInBackground, 0);
  objc_storeStrong((id *)&self->_firstBGAppTimeSBC, 0);
  objc_storeStrong((id *)&self->_bundleIDsInBackground, 0);
  objc_storeStrong((id *)&self->_lastScreenOnTimeSBC, 0);
  objc_storeStrong((id *)&self->_lastAPOnTimeSBC, 0);
  objc_storeStrong((id *)&self->_entryKeyUsageTime, 0);
  objc_storeStrong((id *)&self->_backgroundAppToBundleID, 0);
  objc_storeStrong((id *)&self->_entryKeyPLCoalitionAgentEventIntervalCoalition, 0);
  objc_storeStrong((id *)&self->_entryKeyPLScreenStateAgentScreenState, 0);
  objc_storeStrong((id *)&self->_aggregatedEntryKeyForAppUsageEvents, 0);
  objc_storeStrong((id *)&self->_aggregatedEntryKeyForAppRunTime, 0);
  objc_storeStrong((id *)&self->_audioPlaybackBundleIDs, 0);
  objc_storeStrong((id *)&self->_lastCellularConditionTime, 0);
  objc_storeStrong((id *)&self->_lastStatusBarTime, 0);
  objc_storeStrong((id *)&self->_lastNowPlayingTime, 0);
  objc_storeStrong((id *)&self->_statusBarBundleID, 0);
  objc_storeStrong((id *)&self->_nowPlayingBundleID, 0);
  objc_storeStrong((id *)&self->_widgetParentBundleIDs, 0);
  objc_storeStrong((id *)&self->_watchkitExtensions, 0);
  objc_storeStrong((id *)&self->_PiPModeApps, 0);
  objc_storeStrong((id *)&self->_appsOnScreen, 0);
  objc_storeStrong((id *)&self->_coalitionsAppsOnScreen, 0);
  objc_storeStrong((id *)&self->_lastCallBundleID, 0);
  objc_storeStrong((id *)&self->_lastCallTime, 0);
  objc_storeStrong((id *)&self->_excludedBGAppsSet, 0);
  objc_storeStrong((id *)&self->_excludedFGAppsSet, 0);
  objc_storeStrong((id *)&self->_lastLayoutEntries, 0);
  objc_storeStrong((id *)&self->_runTimeAggregatorTimer, 0);
  objc_storeStrong((id *)&self->_inFlightBundleIDStartTime, 0);
  objc_storeStrong((id *)&self->_lastScreenEventAccountingTime, 0);
  objc_storeStrong((id *)&self->_lastScreenOnTime, 0);
  objc_storeStrong((id *)&self->_wakeEntryNotifications, 0);
  objc_storeStrong((id *)&self->_canSleepEntryNotifications, 0);
  objc_storeStrong((id *)&self->_powerOutCallback, 0);
  objc_storeStrong((id *)&self->_widgetCallback, 0);
  objc_storeStrong((id *)&self->_notificationCallback, 0);
  objc_storeStrong((id *)&self->_telephonyRegistrationCallback, 0);
  objc_storeStrong((id *)&self->_cellularConditionCallback, 0);
  objc_storeStrong((id *)&self->_backgroundTransferCallback, 0);
  objc_storeStrong((id *)&self->_statusBarCallback, 0);
  objc_storeStrong((id *)&self->_nowPlayingCallback, 0);
  objc_storeStrong((id *)&self->_audioCallback, 0);
  objc_storeStrong((id *)&self->_pluginCallback, 0);
  objc_storeStrong((id *)&self->_InCallServiceCallback, 0);
  objc_storeStrong((id *)&self->_displayCallback, 0);
  objc_storeStrong((id *)&self->_batteryCallback, 0);
  objc_storeStrong((id *)&self->_applicationCallback, 0);
  objc_storeStrong((id *)&self->_screenstateCallback, 0);
  objc_storeStrong((id *)&self->_coalitionCallback, 0);
}

- (void)handleSleepCallBack:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "audioPlaybackBundleIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "audio: removing %lu objects", v5);

  OUTLINED_FUNCTION_8_0();
}

- (void)handleDisplayCallback:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "entryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "updating lastScreenOnTime to %@", v5);

  OUTLINED_FUNCTION_8_0();
}

- (void)handleDisplayCallback:(NSObject *)a3 .cold.3(void *a1, int a2, NSObject *a3)
{
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5[0] = 67109376;
  v5[1] = objc_msgSend(a1, "displayState");
  v6 = 1024;
  v7 = a2;
  _os_log_debug_impl(&dword_1DA9D6000, a3, OS_LOG_TYPE_DEBUG, "self.displayState=%d, newDisplayState=%d", (uint8_t *)v5, 0xEu);
  OUTLINED_FUNCTION_8_0();
}

- (void)handleDisplayCallback:(os_log_t)log .cold.4(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = 0;
  _os_log_debug_impl(&dword_1DA9D6000, log, OS_LOG_TYPE_DEBUG, "newDisplayState=%d, clearing layouts", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_6();
}

- (void)handlePowerOutCallback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Handle power out callback with payload %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleAudioCallback:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "audio: %@ started playing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleAudioCallback:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "audio: %@ stopped playing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleAudioCallback:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1DA9D6000, v1, OS_LOG_TYPE_ERROR, "audio: unknown operation for %@: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)chunkAppsOnScreenAtDate:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_11();
  _os_log_fault_impl(&dword_1DA9D6000, v0, OS_LOG_TYPE_FAULT, "Screen On: Tried updating On Screen time, but couldn't retrieve apps on screen", v1, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)addForegroundTimeAtDate:(void *)a1 withNewLayoutElementsArray:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "lastScreenEventAccountingTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "lastScreenEventAccountingTime=%@", v5);

  OUTLINED_FUNCTION_8_0();
}

- (void)addForegroundTimeAtDate:(void *)a1 withNewLayoutElementsArray:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "lastScreenOnTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "setting lastScreenEventAccountingTime to self.lastScreenOnTime=%@", v5);

  OUTLINED_FUNCTION_8_0();
}

- (void)updateScreenOnTimeInDBForBundleId:withTime:withDate:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_14_0();
  v4 = 2112;
  v5 = v0;
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, v1, v2, "adding timeDifference=%f for bundleID=%@", v3);
  OUTLINED_FUNCTION_1();
}

- (void)addAudioTimeAtDate:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "statusBarBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "audio: %@ is using audio+location", v5);

  OUTLINED_FUNCTION_8_0();
}

- (void)addAudioTimeAtDate:(NSObject *)a3 .cold.2(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "appsOnScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218240;
  v8 = objc_msgSend(v5, "count");
  v9 = 2048;
  v10 = objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, a3, v6, "audio: removing from %lu fg, %lu playing in bg", (uint8_t *)&v7);

}

- (void)addAudioTimeAtDate:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v3, "audio: found %lu playing", v4);
  OUTLINED_FUNCTION_8_0();
}

- (void)addAudioTimeAtDate:forBundleID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_3(&dword_1DA9D6000, v0, v1, "audio: missing last info for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)addAudioTimeAtDate:forBundleID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "audio: incrementing Music's BG time by %.2f", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)addNotificationCountFromUserInfo:AtDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Added app usage event: Notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)addWidgetUseFromUserInfo:AtDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Added app usage event: Widget for bundleid  %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getWidgetParentAppForBundleID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_3(&dword_1DA9D6000, v0, v1, "App usage event: unable to find widget's parent id for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getWidgetParentAppForBundleID:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 312), "objectForKeyedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a3, v5, "Added app usage event cached widget =%@", v6);

  OUTLINED_FUNCTION_8_0();
}

- (void)addAudioUseFromforBundleID:AtDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Added app usage event: Audio", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)logAppUsageEventForKey:withBundleID:withDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "App usage event: unable to log nil bundle id", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)logAppUsageEventForKey:withBundleID:withDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "App usage event: adding %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateAggregationsAtSBCWithDate:withLongestCoalitionBGTime:withCoalitionLength:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Resetting SBC AP/FG/BG counters", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)updateAggregationsAtSBCWithDate:withLongestCoalitionBGTime:withCoalitionLength:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "   Calculated Screen Off Usage:    %f", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateAggregationsAtSBCWithDate:(uint64_t)a3 withLongestCoalitionBGTime:(uint64_t)a4 withCoalitionLength:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a2, a3, "   AP On since last SBC:           %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)updateAggregationsAtSBCWithDate:(uint64_t)a3 withLongestCoalitionBGTime:(uint64_t)a4 withCoalitionLength:(uint64_t)a5 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a2, a3, "   BG since last SBC:              %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)updateAggregationsAtSBCWithDate:(uint64_t)a3 withLongestCoalitionBGTime:(uint64_t)a4 withCoalitionLength:(uint64_t)a5 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a2, a3, "   FG since last SBC:              %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)updateAggregationsAtSBCWithDate:withLongestCoalitionBGTime:withCoalitionLength:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "   Longest coalition CPU time:     %f", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateAggregationsAtSBCWithDate:withLongestCoalitionBGTime:withCoalitionLength:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "   Coalition interval length       %f", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateAggregationsAtSBCWithDate:withLongestCoalitionBGTime:withCoalitionLength:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Calculating screen off time from coalitions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)updateAggregationsAtSBCWithDate:(void *)a1 withLongestCoalitionBGTime:(char *)a2 withCoalitionLength:.cold.9(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_12_6(a1, a2);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v3, "SBC: BG %f", v4);
  OUTLINED_FUNCTION_8_0();
}

- (void)updateAggregationsAtSBCWithDate:(void *)a1 withLongestCoalitionBGTime:(NSObject *)a2 withCoalitionLength:.cold.10(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "totalAPOnTimeSBC");
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v3, "SBC: AP %f", v4);
  OUTLINED_FUNCTION_8_0();
}

- (void)updateAggregationsAtSBCWithDate:(void *)a1 withLongestCoalitionBGTime:(char *)a2 withCoalitionLength:.cold.11(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_11_5(a1, a2);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v3, "SBC: FG %f", v4);
  OUTLINED_FUNCTION_8_0();
}

- (void)chunkScreenOnAggregationAtDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Chunking screen on aggregation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)updateAggregationsAtDate:withNewScreenState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Starting FG interval at %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateAggregationsAtDate:(void *)a1 withNewScreenState:(char *)a2 .cold.2(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_11_5(a1, a2);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v3, "New FG time since SBC: %f", v4);
  OUTLINED_FUNCTION_8_0();
}

- (void)updateAggregationsAtDate:withNewAPState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "No AP state change!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)updateAggregationsAtDate:withNewAPState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Starting APOn interval at %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateAggregationsAtDate:(void *)a1 withNewAPState:(char *)a2 .cold.3(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_12_6(a1, a2);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v3, "New BG time since SBC: %f", v4);
  OUTLINED_FUNCTION_8_0();
}

- (void)updateAggregationsAtDate:withNewAPState:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "AP is going down, but AP interval isn't open", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)updateAggregationsAtDate:(void *)a1 withNewAPState:(NSObject *)a2 .cold.5(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "totalAPOnTimeSBC");
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v3, "New AP time since SBC: %f", v4);
  OUTLINED_FUNCTION_8_0();
}

- (void)updateAggregationsAtDate:withNewAPState:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "Screen on interval is open, but AP is going down!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)updateAggregationsAtDate:withNewPluggedInState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "device has been plugged in for %.2fs since last update", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateAggregationsAtDate:withNewPluggedInState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "device is not plugged in", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)updateAggregationsAtDate:withNewPluggedInState:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "periodic plugged in update", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)updateAggregationsAtDate:withNewPluggedInState:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "starting plugged in interval", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)updateAggregationsAtDate:withNewPluggedInState:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "unplugged without plugged in start", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)updateAggregationsAtDate:withNewPluggedInState:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "stopping plugged in interval %.2fs since last update", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateBackgroundAppsForBundleID:withState:withDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Ignoring BG bundleID %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateBackgroundAppsForBundleID:withState:withDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "%@ is first BG'd app, starting BG Timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateBackgroundAppsForBundleID:withState:withDate:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "Tried to stop BG time, but no first BG app time SBC!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)updateBackgroundAppsForBundleID:(void *)a1 withState:(char *)a2 withDate:.cold.4(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_12_6(a1, a2);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v3, "total BG time since SBC: %f", v4);
  OUTLINED_FUNCTION_8_0();
}

- (void)updateBackgroundAppsForBundleID:withState:withDate:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_3_3(&dword_1DA9D6000, v0, v1, "Got a negative BG time: %f", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateBackgroundAppsForBundleID:withState:withDate:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "%@ is last BG'd app, stopping BG Timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateBackgroundAppsForBundleID:withState:withDate:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Removing %@ from BG set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
