@implementation PLConfigAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLConfigAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)railDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)accountingGroupDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
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
  _QWORD v11[7];
  _QWORD v12[8];

  v12[7] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("KeyboardClicks");
  objc_msgSend((id)objc_opt_class(), "entryEventForwardDefinitionKeyboardClicks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v11[1] = CFSTR("KeyboardHaptics");
  objc_msgSend((id)objc_opt_class(), "entryEventForwardDefinitionKeyboardHaptics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  v11[2] = CFSTR("Ringer");
  objc_msgSend((id)objc_opt_class(), "entryEventForwardDefintionRinger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v4;
  v11[3] = CFSTR("PhotoSharing");
  objc_msgSend((id)objc_opt_class(), "entryEventForwardDefinitionPhotoSharing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v5;
  v11[4] = CFSTR("ContinuityCamera");
  objc_msgSend((id)objc_opt_class(), "entryEventForwardDefinitionContinuityCamera");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v6;
  v11[5] = CFSTR("AmbientModeEnabled");
  objc_msgSend((id)objc_opt_class(), "entryEventForwardDefinitionAmbientMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v7;
  v11[6] = CFSTR("FeatureFlags");
  objc_msgSend((id)objc_opt_class(), "entryEventForwardDefinitionFeatureFlag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventForwardDefinitionFeatureFlag
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
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
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];
  _QWORD v25[5];

  v25[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0D80020], "internalBuild");
  v3 = (void *)MEMORY[0x1E0C9AA70];
  if (v2)
  {
    v24[0] = *MEMORY[0x1E0D80298];
    v4 = *MEMORY[0x1E0D802A8];
    v22[0] = *MEMORY[0x1E0D80318];
    v22[1] = v4;
    v23[0] = &unk_1E8652B30;
    v23[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v17;
    v25[1] = v3;
    v5 = *MEMORY[0x1E0D802B0];
    v24[1] = *MEMORY[0x1E0D802F0];
    v24[2] = v5;
    v20[0] = CFSTR("key");
    v18[0] = CFSTR("Domain");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "commonTypeDict_StringFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v6;
    v18[1] = CFSTR("FeatureName");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "commonTypeDict_StringFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v8;
    v18[2] = CFSTR("TargetRelease");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "commonTypeDict_StringFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = CFSTR("value");
    v21[0] = v11;
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "commonTypeDict_IntegerFormat");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)entryEventForwardDefinitionKeyboardClicks
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
  v12[0] = &unk_1E8652B40;
  v12[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("Enabled");
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

+ (id)entryEventForwardDefinitionKeyboardHaptics
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
  v12[0] = &unk_1E8652B40;
  v12[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("Enabled");
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

+ (id)entryEventForwardDefintionRinger
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
  v12[0] = &unk_1E8652B40;
  v12[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("Enabled");
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

+ (id)entryEventForwardDefinitionPhotoSharing
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
  v12[0] = &unk_1E8652B40;
  v12[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("PhotoSharingEnabled");
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

+ (id)entryEventForwardDefinitionContinuityCamera
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
  v12[0] = &unk_1E8652B40;
  v12[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("Enabled");
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

+ (id)entryEventForwardDefinitionAmbientMode
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
  v12[0] = &unk_1E8652B40;
  v12[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("Enabled");
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

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventNoneDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("Config");
  objc_msgSend((id)objc_opt_class(), "entryEventNoneDefinitionConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("PairedDeviceConfig");
  objc_msgSend((id)objc_opt_class(), "entryEventNoneDefinitionPairedDeviceConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("AdapterInformation");
  objc_msgSend(a1, "entryEventNoneDefinitionAdapterInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventNoneDefinitionAdapterInformation
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventNoneDefinitionConfig
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
  _QWORD v79[36];
  _QWORD v80[36];
  _QWORD v81[3];
  _QWORD v82[3];
  _QWORD v83[2];
  _QWORD v84[4];

  v84[2] = *MEMORY[0x1E0C80C00];
  v83[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80340];
  v81[0] = *MEMORY[0x1E0D80318];
  v81[1] = v2;
  v82[0] = &unk_1E8652B50;
  v82[1] = &unk_1E8632688;
  v81[2] = *MEMORY[0x1E0D80338];
  v82[2] = &unk_1E8652B60;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 3);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v78;
  v83[1] = *MEMORY[0x1E0D802F0];
  v79[0] = CFSTR("Build");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "commonTypeDict_StringFormat");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v76;
  v79[1] = CFSTR("SupplementalBuild");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "commonTypeDict_StringFormat");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v74;
  v79[2] = CFSTR("CustomerOS");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "commonTypeDict_BoolFormat");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v80[2] = v72;
  v79[3] = CFSTR("Device");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "commonTypeDict_StringFormat");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v80[3] = v70;
  v79[4] = CFSTR("DevBoard");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "commonTypeDict_BoolFormat");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v80[4] = v68;
  v79[5] = CFSTR("CRKey");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "commonTypeDict_StringFormat");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v80[5] = v66;
  v79[6] = CFSTR("CRKey2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "commonTypeDict_StringFormat");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v80[6] = v64;
  v79[7] = CFSTR("DeviceName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "commonTypeDict_StringFormat");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v80[7] = v62;
  v79[8] = CFSTR("BootArgs");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "commonTypeDict_StringFormat");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v80[8] = v60;
  v79[9] = CFSTR("DeviceType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v80[9] = v58;
  v79[10] = CFSTR("DeviceBootTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "commonTypeDict_DateFormat");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v80[10] = v56;
  v79[11] = CFSTR("LastBuild");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "commonTypeDict_StringFormat");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v80[11] = v54;
  v79[12] = CFSTR("LastUpgradeTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "commonTypeDict_RealFormat");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v80[12] = v52;
  v79[13] = CFSTR("DeviceDiskSize");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v80[13] = v50;
  v79[14] = CFSTR("MachTimeBaseRatio");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "commonTypeDict_RealFormat");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v80[14] = v48;
  v79[15] = CFSTR("AutoLockTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v80[15] = v46;
  v79[16] = CFSTR("Baseband");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v80[16] = v44;
  v79[17] = CFSTR("BasebandFirmware");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commonTypeDict_StringFormat");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v80[17] = v42;
  v79[18] = CFSTR("BKNoWatchdogs");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_BoolFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v80[18] = v40;
  v79[19] = CFSTR("SBDisableCABlanking");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "commonTypeDict_BoolFormat");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v80[19] = v38;
  v79[20] = CFSTR("AutomatedDeviceGroup");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "commonTypeDict_StringFormat");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v80[20] = v36;
  v79[21] = CFSTR("SeedGroup");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_StringFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v80[21] = v34;
  v79[22] = CFSTR("ConfigNumber");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_StringFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v80[22] = v32;
  v79[23] = CFSTR("DebugBoardRevision");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_StringFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v80[23] = v30;
  v79[24] = CFSTR("LastBackupTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_DateFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v80[24] = v28;
  v79[25] = CFSTR("DeviceBootReasons");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_StringFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v80[25] = v26;
  v79[26] = CFSTR("IcloudAccountType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_StringFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v80[26] = v24;
  v79[27] = CFSTR("OSVariant");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v80[27] = v22;
  v79[28] = CFSTR("RemainingDiskSpace");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v80[28] = v20;
  v79[29] = CFSTR("DeviceSerialNumber");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_StringFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v80[29] = v18;
  v79[30] = CFSTR("MDMStatus");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_BoolFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v80[30] = v16;
  v79[31] = CFSTR("InstalledSplat");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v80[31] = v14;
  v79[32] = CFSTR("Device_SoC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v80[32] = v4;
  v79[33] = CFSTR("RootInstalled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v80[33] = v6;
  v79[34] = CFSTR("LastUpgradeSystemTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v80[34] = v8;
  v79[35] = CFSTR("InstallType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v80[35] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 36);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventNoneDefinitionPairedDeviceConfig
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
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isiOS") & 1) == 0
    && !objc_msgSend(MEMORY[0x1E0D80020], "isWatch"))
  {
    return MEMORY[0x1E0C9AA70];
  }
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80340];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1E8652B30;
  v20[1] = &unk_1E8632688;
  v19[2] = *MEMORY[0x1E0D80338];
  v20[2] = &unk_1E8652B70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("Build");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("Device");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("HWModel");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("PairingID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("PMode");
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

+ (id)defaults
{
  return &unk_1E864B748;
}

- (PLConfigAgent)init
{
  PLConfigAgent *v2;
  uint64_t v3;
  PLIOKitOperatorComposition *iokitExpertDevice;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLConfigAgent;
  v2 = -[PLAgent init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFE8]), "initWithOperator:forService:", v2, CFSTR("IOPlatformExpertDevice"));
    iokitExpertDevice = v2->_iokitExpertDevice;
    v2->_iokitExpertDevice = (PLIOKitOperatorComposition *)v3;

  }
  return v2;
}

- (unint64_t)volumeFreespace:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  int *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  unint64_t v13;
  _QWORD block[5];
  uint8_t buf[4];
  void *v17;
  statfs v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  memset(&v18, 0, 512);
  v3 = objc_retainAutorelease(a3);
  if (statfs((const char *)objc_msgSend(v3, "fileSystemRepresentation"), &v18))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v4 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __33__PLConfigAgent_volumeFreespace___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (qword_1ED882970 != -1)
        dispatch_once(&qword_1ED882970, block);
      if (_MergedGlobals_1_19)
      {
        v5 = (void *)MEMORY[0x1E0CB3940];
        v6 = __error();
        objc_msgSend(v5, "stringWithFormat:", CFSTR("statfs failed for %@ : %s"), v3, strerror(*v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLConfigAgent.m");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLConfigAgent volumeFreespace:]");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 564);

        PLLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v7;
          _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v13 = -1;
  }
  else
  {
    v13 = (unint64_t)((double)(v18.f_bavail * v18.f_bsize) / 1000000000.0);
  }

  return v13;
}

uint64_t __33__PLConfigAgent_volumeFreespace___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_19 = result;
  return result;
}

- (id)bootArgs
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v19;
  _QWORD v20[5];
  _QWORD block[5];
  size_t size;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  size = 0;
  if (sysctlbyname("kern.bootargs", 0, &size, 0, 0))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v2 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __25__PLConfigAgent_bootArgs__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v2;
      if (qword_1ED882978 != -1)
        dispatch_once(&qword_1ED882978, block);
      if (byte_1ED882969)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to retrieve size of kern.bootargs"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLConfigAgent.m");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastPathComponent");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLConfigAgent bootArgs]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 581);

        PLLogCommon();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v3;
          _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  else
  {
    v9 = malloc_type_malloc(size, 0x100004077774924uLL);
    if (!sysctlbyname("kern.bootargs", v9, &size, 0, 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "strip");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      free(v9);
      return v17;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v10 = objc_opt_class();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __25__PLConfigAgent_bootArgs__block_invoke_163;
      v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v20[4] = v10;
      if (qword_1ED882980 != -1)
        dispatch_once(&qword_1ED882980, v20);
      if (byte_1ED88296A)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to retrieve kern.bootargs"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLConfigAgent.m");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLConfigAgent bootArgs]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 588);

        PLLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v11;
          _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    free(v9);
  }
  v17 = 0;
  return v17;
}

uint64_t __25__PLConfigAgent_bootArgs__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882969 = result;
  return result;
}

uint64_t __25__PLConfigAgent_bootArgs__block_invoke_163(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88296A = result;
  return result;
}

- (unint64_t)rootInstalled
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  int v6;
  size_t v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 8;
  v8 = 0;
  v2 = sysctlbyname("kern.roots_installed", &v8, &v7, 0, 0);
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v6 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v10) = v6;
      _os_log_error_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_ERROR, "Unable to get Installed root info kern.roots_installed: %{errno}d", buf, 8u);
    }

    return -1;
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v10 = v8;
      _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "Installed root info kern.roots_installed: %llu", buf, 0xCu);
    }

    return v8 != 0;
  }
}

- (int)getDeviceType
{
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isiPad") & 1) != 0)
    return 1;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isiPhone") & 1) != 0)
    return 0;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isiPod") & 1) != 0)
    return 2;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isWatch") & 1) != 0)
    return 3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isMac") & 1) != 0)
    return 4;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
    return 5;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isAppleTV") & 1) != 0)
    return 6;
  if (objc_msgSend(MEMORY[0x1E0D80020], "isAppleVision"))
    return 86;
  return 1000;
}

- (BOOL)noWatchdogs
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("BKNoWatchdogs"), CFSTR("com.apple.backboardd"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)disableCABlanking
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("SBDisableCABlanking"), CFSTR("com.apple.springboard"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (int64_t)autolockTime
{
  void *v2;
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveValueForSetting:", *MEMORY[0x1E0D46F68]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

+ (void)resetRAPIDTaskingConfig
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D803F0];
  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:", *MEMORY[0x1E0D803F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    PLLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEFAULT, "Resetting RAPID Tasking config: %@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:saveToDisk:", 0, v2, 1);
    objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:saveToDisk:", 0, *MEMORY[0x1E0D803E8], 1);
    objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:saveToDisk:", 0, *MEMORY[0x1E0D80400], 1);
  }

}

+ (int64_t)getOSVersionNumber
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  return 0;
}

- (int64_t)checkAndUpdateOSVersion:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD block[5];
  uint8_t buf[4];
  int64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D7FFA0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PLConfigAgent_checkAndUpdateOSVersion___block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  if (qword_1ED882988 != -1)
    dispatch_once(&qword_1ED882988, block);
  v6 = objc_msgSend(v5, "longForKey:ifNotSet:", CFSTR("LastOSVersion"), qword_1ED882990);
  v7 = +[PLConfigAgent getOSVersionNumber](PLConfigAgent, "getOSVersionNumber");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLConfigAgent logInstallType:](self, "logInstallType:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:saveToDisk:", v8, CFSTR("InstallType"), 1);
  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7 < 1 || v7 == v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "OS version did not change", buf, 2u);
    }
    v6 = -1;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v15 = v6;
      v16 = 2048;
      v17 = v7;
      _os_log_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_INFO, "OS version changed from: %ld to: %ld", buf, 0x16u);
    }

    v11 = (void *)MEMORY[0x1E0D7FFA0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:saveToDisk:", v10, CFSTR("LastOSVersion"), 1);
  }

  return v6;
}

uint64_t __41__PLConfigAgent_checkAndUpdateOSVersion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultLongForKey:", CFSTR("DefaultOSVersion"));
  qword_1ED882990 = result;
  return result;
}

+ (id)getVersionDirectory:(int64_t)a3
{
  int64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  int v12;
  int64_t v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = +[PLConfigAgent getOSVersionNumber](PLConfigAgent, "getOSVersionNumber");
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (a3 / 10000 == v4 / 10000)
  {
    if (v6)
    {
      v12 = 134218240;
      v13 = a3;
      v14 = 2048;
      v15 = v4;
      _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Minor OS upgrade: %ld -> %ld", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("/Library/BatteryLife/UpgradeLogs/MinorVersion");
  }
  else
  {
    if (v6)
    {
      v12 = 134218240;
      v13 = a3;
      v14 = 2048;
      v15 = v4;
      _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Major OS upgrade: %ld -> %ld", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("/Library/BatteryLife/UpgradeLogs/MajorVersion");
  }
  objc_msgSend(v7, "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)copyPowerlogsForPreUpgradeOSVersion:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  char v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id obj;
  uint64_t v38;
  os_log_t log;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLConfigAgent getVersionDirectory:](PLConfigAgent, "getVersionDirectory:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v62 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Copy logs to dir: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v9 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v58);
  v10 = v58;
  if (v9)
  {
    v35 = v5;
    v36 = v4;
    v11 = 0x1E0D80000uLL;
    objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Archives/"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v13, 0);
    log = (os_log_t)objc_claimAutoreleasedReturnValue();

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(MEMORY[0x1E0D7FF78], "archiveEntriesFinished");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    if (!v40)
      goto LABEL_29;
    v38 = *(_QWORD *)v55;
    v44 = *MEMORY[0x1E0CB2AD8];
    v43 = *MEMORY[0x1E0CB2AB8];
    while (1)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v55 != v38)
          objc_enumerationMutation(obj);
        v42 = v14;
        v15 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(v15, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "predicateWithFormat:", CFSTR("SELF CONTAINS %@"), v17);
        v18 = objc_claimAutoreleasedReturnValue();

        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v41 = (void *)v18;
        -[NSObject filteredArrayUsingPredicate:](log, "filteredArrayUsingPredicate:", v18);
        v46 = (id)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
        if (v47)
        {
          v19 = *(_QWORD *)v51;
          v45 = *(_QWORD *)v51;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v51 != v19)
                objc_enumerationMutation(v46);
              v21 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v20);
              objc_msgSend(*(id *)(v11 + 120), "containerPath");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Archives/"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "stringByAppendingPathComponent:", v21);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v6, "stringByAppendingPathComponent:", v21);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              PLLogCommon();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v62 = v24;
                v63 = 2112;
                v64 = v25;
                _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "Copying log at path: %@ to path: %@", buf, 0x16u);
              }

              v49 = v10;
              v27 = objc_msgSend(v8, "copyItemAtPath:toPath:error:", v24, v25, &v49);
              v28 = v49;

              if ((v27 & 1) != 0)
              {
                v29 = v8;
                v30 = v6;
                objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = v44;
                v60 = v43;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = v28;
                v33 = objc_msgSend(v31, "setAttributes:ofItemAtPath:error:", v32, v25, &v48);
                v10 = v48;

                if ((v33 & 1) != 0)
                {
                  v6 = v30;
                  v8 = v29;
                  v11 = 0x1E0D80000;
                  v19 = v45;
                  goto LABEL_25;
                }
                PLLogCommon();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v62 = v25;
                  v63 = 2112;
                  v64 = v10;
                  _os_log_error_impl(&dword_1CAF47000, v34, OS_LOG_TYPE_ERROR, "Failed to set file protection key for file at path: %@ with error: %@", buf, 0x16u);
                }
                v28 = v10;
                v6 = v30;
                v8 = v29;
                v11 = 0x1E0D80000;
                v19 = v45;
              }
              else
              {
                PLLogCommon();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412802;
                  v62 = v24;
                  v63 = 2112;
                  v64 = v25;
                  v65 = 2112;
                  v66 = v28;
                  _os_log_error_impl(&dword_1CAF47000, v34, OS_LOG_TYPE_ERROR, "Failed to copy file at path: %@ to path: %@ with error: %@", buf, 0x20u);
                }
              }

              v10 = v28;
LABEL_25:

              ++v20;
            }
            while (v47 != v20);
            v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
          }
          while (v47);
        }

        v14 = v42 + 1;
      }
      while (v42 + 1 != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
      if (!v40)
      {
LABEL_29:

        v5 = v35;
        v4 = v36;
        goto LABEL_32;
      }
    }
  }
  PLLogCommon();
  log = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v62 = v6;
    v63 = 2112;
    v64 = v10;
    _os_log_error_impl(&dword_1CAF47000, log, OS_LOG_TYPE_ERROR, "Failed to create directory at path: %@ with error: %@", buf, 0x16u);
  }
LABEL_32:

}

+ (void)removeFilesFromPath:(id)a3 withMaxFiles:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  int64_t v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v16 = v5;
    v17 = 2048;
    v18 = objc_msgSend(v7, "count");
    v19 = 2048;
    v20 = a4;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "Remove files from path: %@ currFiles: %ld maxFiles:%ld", buf, 0x20u);
  }

  if (objc_msgSend(v7, "count") > (unint64_t)a4)
  {
    objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compareInt_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__PLConfigAgent_removeFilesFromPath_withMaxFiles___block_invoke;
    v10[3] = &unk_1E8579DC0;
    v11 = v7;
    v14 = a4;
    v12 = v6;
    v13 = v5;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

  }
}

void __50__PLConfigAgent_removeFilesFromPath_withMaxFiles___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") - a3 == *(_QWORD *)(a1 + 56))
  {
    *a4 = 1;
  }
  else
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "stringByAppendingPathComponent:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v10 = objc_msgSend(v8, "removeItemAtPath:error:", v9, &v14);
    v11 = v14;

    if ((v10 & 1) == 0)
    {
      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 48), "stringByAppendingPathComponent:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v16 = v13;
        v17 = 2112;
        v18 = v11;
        _os_log_error_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_ERROR, "Failed to remove file at path: %@ with error: %@", buf, 0x16u);

      }
    }

  }
}

- (void)cleanupOldPowerlogs
{
  int64_t v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[PLOperator defaultLongForKey:](self, "defaultLongForKey:", CFSTR("MaxMajorVersionDirectories"));
  v4 = -[PLOperator defaultLongForKey:](self, "defaultLongForKey:", CFSTR("MaxMinorVersionDirectories"));
  objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs/MajorVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLConfigAgent removeFilesFromPath:withMaxFiles:](PLConfigAgent, "removeFilesFromPath:withMaxFiles:", v6, v3);

  objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs/MinorVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLConfigAgent removeFilesFromPath:withMaxFiles:](PLConfigAgent, "removeFilesFromPath:withMaxFiles:", v7, v4);

}

- (void)fileSizeSafeguards
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  unint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D80078];
  objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "directorySize:", v5);

  if (v6 > -[PLOperator defaultLongForKey:](self, "defaultLongForKey:", CFSTR("MaxUpgradeFolderSize")))
  {
    PLLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v6;
      _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Total folder size: %ld exceeds max limit", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v11 = objc_msgSend(v8, "removeItemAtPath:error:", v10, &v16);
    v12 = v16;

    if ((v11 & 1) == 0)
    {
      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v18 = (unint64_t)v15;
        v19 = 2112;
        v20 = v12;
        _os_log_error_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_ERROR, "Failed to remove file at path: %@ with error: %@", buf, 0x16u);

      }
    }

  }
}

- (void)maintainPreUpgradePowerlogs:(int64_t)a3
{
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "liteMode"))
  {
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Maintain pre-upgrade logs", buf, 2u);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PLConfigAgent_maintainPreUpgradePowerlogs___block_invoke;
    block[3] = &unk_1E85780C8;
    block[4] = self;
    if (qword_1ED882998 != -1)
      dispatch_once(&qword_1ED882998, block);
    if (qword_1ED8829A0 <= a3)
    {
      -[PLConfigAgent copyPowerlogsForPreUpgradeOSVersion:](self, "copyPowerlogsForPreUpgradeOSVersion:", a3);
      -[PLConfigAgent cleanupOldPowerlogs](self, "cleanupOldPowerlogs");
      -[PLConfigAgent fileSizeSafeguards](self, "fileSizeSafeguards");
    }
  }
}

uint64_t __45__PLConfigAgent_maintainPreUpgradePowerlogs___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultLongForKey:", CFSTR("DefaultOSVersion"));
  qword_1ED8829A0 = result;
  return result;
}

- (unint64_t)getUpgradeType
{
  void *v2;
  uint64_t v3;
  int64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  unint64_t v7;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D7FFA0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PLConfigAgent_getUpgradeType__block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  if (qword_1ED8829A8 != -1)
    dispatch_once(&qword_1ED8829A8, block);
  v3 = objc_msgSend(v2, "longForKey:ifNotSet:", CFSTR("LastOSVersion"), qword_1ED8829B0);
  v4 = +[PLConfigAgent getOSVersionNumber](PLConfigAgent, "getOSVersionNumber");
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v3 / 10000 == v4 / 10000)
  {
    if (v6)
    {
      *(_DWORD *)buf = 134218240;
      v11 = v3;
      v12 = 2048;
      v13 = v4;
      _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Minor OS upgrade: %ld -> %ld", buf, 0x16u);
    }
    v7 = 1;
  }
  else if (v6)
  {
    *(_DWORD *)buf = 134218240;
    v11 = v3;
    v12 = 2048;
    v13 = v4;
    v7 = 2;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Major OS upgrade: %ld -> %ld", buf, 0x16u);
  }
  else
  {
    v7 = 2;
  }

  return v7;
}

uint64_t __31__PLConfigAgent_getUpgradeType__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultLongForKey:", CFSTR("DefaultOSVersion"));
  qword_1ED8829B0 = result;
  return result;
}

- (id)logAndUpdateLastBuild:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("LastBuild"), CFSTR("com.apple.powerlogd"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    PLLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v4;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_INFO, "Update detected - Current Build %@ -> Last Build %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:saveToDisk:", v4, CFSTR("LastBuild"), 1);
    +[PLConfigAgent resetRAPIDTaskingConfig](PLConfigAgent, "resetRAPIDTaskingConfig");
    -[PLConfigAgent maintainPreUpgradePowerlogs:](self, "maintainPreUpgradePowerlogs:", -[PLConfigAgent checkAndUpdateOSVersion:](self, "checkAndUpdateOSVersion:", v5));
    v8 = MEMORY[0x1E0C809B0];
    if (v5)
    {
      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v5;
        v24 = 2112;
        v25 = v4;
        _os_log_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_INFO, "The device has been updated from build version %@ to build version %@", buf, 0x16u);
      }

      v10 = dispatch_time(0, 60000000000);
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __39__PLConfigAgent_logAndUpdateLastBuild___block_invoke;
      block[3] = &unk_1E85791E0;
      v11 = v5;
      v20 = v11;
      v21 = v4;
      dispatch_after(v10, MEMORY[0x1E0C80D38], block);
      objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:saveToDisk:", v11, CFSTR("PreviousUpdateBuild"), 1);
      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_INFO, "Set the previous update build to last build", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:ifNotSet:", CFSTR("InstallType"), &unk_1E86326E8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unsignedLongLongValue");

    v17 = v5;
    v18 = v4;
    AnalyticsSendEventLazy();

    v6 = v17;
  }
  else
  {
    PLLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "Not an update case - logging at powerlog init", buf, 2u);
    }
  }

  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("PreviousUpdateBuild"), CFSTR("com.apple.powerlogd"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v14;
    v24 = 2112;
    v25 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "Sending lastBuild value - prev update build %@ and last %@", buf, 0x16u);
  }

  return v14;
}

void __39__PLConfigAgent_logAndUpdateLastBuild___block_invoke(uint64_t a1)
{
  void *v1;
  char v2;
  NSObject *v3;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_%@"), CFSTR("Upgrade"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = PLGenerateBatteryUIPlist();

  if ((v2 & 1) == 0)
  {
    PLLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_ERROR, "Failed to generate a new BUI upgrade plist", buf, 2u);
    }

  }
}

id __39__PLConfigAgent_logAndUpdateLastBuild___block_invoke_208(_QWORD *a1)
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (a1[4])
    v4 = (const __CFString *)a1[4];
  else
    v4 = CFSTR("None");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("LastBuild"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", a1[5], CFSTR("Build"));
  if (a1[4])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[6]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Type"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E86326A0, CFSTR("Type"));
  }
  return v3;
}

- (id)logAndUpdateLastUpgradeTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("LastBuild"), CFSTR("com.apple.powerlogd"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("LastUpgradeTimestamp"), CFSTR("com.apple.powerlogd"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("LastUpgradeSystemTimestamp"), CFSTR("com.apple.powerlogd"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject convertFromSystemToMonotonic](v8, "convertFromSystemToMonotonic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[NSObject timeIntervalSince1970](v8, "timeIntervalSince1970");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0D7FFA0];
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:saveToDisk:", v14, CFSTR("LastUpgradeTimestamp"), 1);

    objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:saveToDisk:", v11, CFSTR("LastUpgradeSystemTimestamp"), 1);
    PLLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v21 = v4;
      v22 = 2112;
      v23 = v5;
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_INFO, "Update detected - Current Build %@ -> Last Build %@ and timestamp %@", buf, 0x20u);
    }

    -[PLConfigAgent logToPPSBuild:atDate:](self, "logToPPSBuild:atDate:", v4, v9);
    v7 = (void *)v11;
  }
  else
  {
    PLLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "Not an update case - logging upgrade timestamp at powerlog init", buf, 2u);
    }
  }

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      ADClientSetValueForScalarKey();
      v19 = v7;
      AnalyticsSendEventLazy();

    }
  }
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16 = v6;
  }
  else
  {
    PLLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_INFO, "Returning lastUpgradeTimestamp as nil", buf, 2u);
    }

    v16 = 0;
  }

  return v16;
}

id __45__PLConfigAgent_logAndUpdateLastUpgradeTime___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("lastUpgradeSystemTimestamp");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)logLastUpgradeSystemTimestamp
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t v9[16];

  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("LastUpgradeSystemTimestamp"), CFSTR("com.apple.powerlogd"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "doubleValue");
  objc_msgSend(v3, "numberWithDouble:", floor(v4 / 3600.0) * 3600.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
  }
  else
  {
    PLLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_INFO, "Returning lastUpgradeSystemTimestamp as nil", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (unint64_t)logInstallType:(id)a3
{
  if (a3)
    return -[PLConfigAgent getUpgradeType](self, "getUpgradeType");
  else
    return 0;
}

- (void)logToPPSBuild:(id)a3 atDate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = CFSTR("build");
  v12[0] = a3;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "nearestMidnightBeforeDate:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("PPTStorageOperator"), CFSTR("Config"), v9, v10);
}

- (double)logDeviceDiskSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)MGCopyAnswer();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0DE2CC0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = (double)(int)(v4 / 1000000000.0);

  return v5;
}

- (id)logLastBackupTime
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("LastBackupTimestamp"), CFSTR("com.apple.powerlogd"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v2, "doubleValue");
    objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)logIcloudAccountType
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_lastKnownQuota");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", objc_msgSend(v4, "longLongValue"), 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)seedGroup
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D7FFA0], "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedPrefsObjectForKey:forApplicationID:synchronize:", CFSTR("SeedGroup"), CFSTR(".GlobalPreferences"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)deviceShutdownReasons
{
  CFMutableDictionaryRef v2;
  CFMutableDictionaryRef v3;
  const __CFAllocator *v4;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  uint64_t MatchingService;
  io_object_t v8;
  void *v9;
  id v11;
  void *v12;
  void *v13;
  CFTypeRef cf;
  int valuePtr;

  v2 = IOServiceMatching("IOService");
  if (!v2)
    return 0;
  v3 = v2;
  valuePtr = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  cf = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
  v5 = CFDictionaryCreate(v4, (const void **)&deviceShutdownReasons_tmp, &cf, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!v5)
  {
    CFRelease(v3);
    if (deviceShutdownReasons_tmp)
      CFRelease((CFTypeRef)deviceShutdownReasons_tmp);
    if (cf)
      CFRelease(cf);
    return 0;
  }
  v6 = v5;
  CFDictionarySetValue(v3, CFSTR("IOPropertyMatch"), v5);
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAB8], v3);
  if ((_DWORD)MatchingService)
  {
    v8 = MatchingService;
    objc_msgSend(MEMORY[0x1E0D7FFE8], "snapshotFromIOEntry:", MatchingService);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    IOObjectRelease(v8);
  }
  else
  {
    v9 = 0;
  }
  CFRelease(v6);
  if (deviceShutdownReasons_tmp)
    CFRelease((CFTypeRef)deviceShutdownReasons_tmp);
  if (cf)
    CFRelease(cf);
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("IOPMUBootErrorFaults"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("IOPMUBootErrorFaults"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)getMDMStatus
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installedMDMProfileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)getSplatVersionString
{
  if (qword_1ED8829C0 != -1)
    dispatch_once(&qword_1ED8829C0, &__block_literal_global_16);
  return (id)qword_1ED8829B8;
}

void __38__PLConfigAgent_getSplatVersionString__block_invoke()
{
  uint64_t v0;
  void *v1;

  CFCopySystemVersionString();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED8829B8;
  qword_1ED8829B8 = v0;

}

- (id)deviceName
{
  void *v2;

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
    v2 = (void *)MGCopyAnswer();
  else
    v2 = 0;
  return v2;
}

- (int)getOSVariant
{
  int v2;

  if (os_variant_has_internal_diagnostics())
    v2 = 2;
  else
    v2 = 0;
  if (os_variant_has_internal_content())
    v2 |= 4u;
  if (os_variant_has_internal_ui())
    return v2 | 8;
  else
    return v2;
}

- (id)baseband
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(MEMORY[0x1E0D80020], "kPLBasebandClassOfDevice"));
}

- (id)basebandFirmware
{
  return (id)MGCopyAnswer();
}

- (id)getCoverGlass
{
  return (id)MGCopyAnswer();
}

- (int)getPerfLevelsCount
{
  NSObject *v2;
  uint8_t v4[16];
  size_t v5;
  int v6;

  v6 = 0;
  v5 = 4;
  if (!sysctlbyname("hw.nperflevels", &v6, &v5, 0, 0))
    return v6;
  PLLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_ERROR, "Unable to retrieve hw.nperflevels", v4, 2u);
  }

  return 0;
}

- (int)getCoreCount:(int)a3
{
  const char *v4;
  NSObject *v5;
  size_t v7;
  int v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = "hw.perflevel1.physicalcpu";
  else
    v4 = "hw.perflevel0.physicalcpu";
  v8 = 0;
  v7 = 4;
  if (!sysctlbyname(v4, &v8, &v7, 0, 0))
    return v8;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v10 = a3;
    _os_log_error_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_ERROR, "Unable to retrieve hw.perflevel%d.physicalcpu", buf, 8u);
  }

  return 0;
}

- (id)getShutdownBootReason:(BOOL)a3
{
  const char *v3;
  char *v4;
  NSObject *v5;
  void *v7;
  uint64_t v8;
  size_t v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
    v3 = "kern.shutdownreason";
  else
    v3 = "kern.bootreason";
  v9 = 0;
  sysctlbyname(v3, 0, &v9, 0, 0);
  if (!v9)
    return 0;
  v4 = (char *)&v8 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v4, v9);
  if (sysctlbyname(v3, v4, &v9, 0, 0))
  {
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_error_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_ERROR, "Unable to retrieve %@", buf, 0xCu);

    }
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)hwConfig
{
  if (hwConfig_onceToken != -1)
    dispatch_once(&hwConfig_onceToken, &__block_literal_global_258);
  return (id)hwConfig___config;
}

void __25__PLConfigAgent_hwConfig__block_invoke()
{
  const void *v0;
  const void *v1;
  CFTypeID v2;
  CFTypeID v3;
  const UInt8 *BytePtr;
  size_t Length;
  void *v6;
  uint64_t v7;
  void *v8;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFDataGetTypeID())
    {
      v3 = CFGetTypeID(v1);
      if (v3 == CFDataGetTypeID())
      {
        BytePtr = CFDataGetBytePtr((CFDataRef)v1);
        Length = CFDataGetLength((CFDataRef)v1);
        v6 = malloc_type_malloc(Length + 1, 0xAD64E7C6uLL);
        bzero(v6, Length + 1);
        memcpy(v6, BytePtr, Length);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
        v7 = objc_claimAutoreleasedReturnValue();
        free(v6);
      }
      else
      {
        v7 = 0;
      }
      v8 = (void *)hwConfig___config;
      hwConfig___config = v7;

    }
  }
}

- (id)hwBoardRevision
{
  if (hwBoardRevision_onceToken != -1)
    dispatch_once(&hwBoardRevision_onceToken, &__block_literal_global_259);
  return (id)hwBoardRevision___revision;
}

void __32__PLConfigAgent_hwBoardRevision__block_invoke()
{
  const void *v0;
  const void *v1;
  CFTypeID v2;
  CFTypeID v3;
  const UInt8 *BytePtr;
  CFIndex Length;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFDataGetTypeID())
    {
      v3 = CFGetTypeID(v1);
      if (v3 == CFDataGetTypeID())
      {
        BytePtr = CFDataGetBytePtr((CFDataRef)v1);
        Length = CFDataGetLength((CFDataRef)v1);
        v6 = malloc_type_malloc(2 * Length + 3, 0xA96B9612uLL);
        bzero(v6, 2 * Length + 3);
        strcpy((char *)v6, "0x");
        if (Length >= 1)
        {
          v7 = 2;
          do
          {
            v8 = *BytePtr++;
            v7 += snprintf((char *)v6 + v7, 3uLL, "%02x", v8);
            --Length;
          }
          while (Length);
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
        v9 = objc_claimAutoreleasedReturnValue();
        free(v6);
      }
      else
      {
        v9 = 0;
      }
      v10 = (void *)hwBoardRevision___revision;
      hwBoardRevision___revision = v9;

    }
  }
}

- (id)getDeviceSerialNumber
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D7FFE8];
  -[PLConfigAgent iokitExpertDevice](self, "iokitExpertDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshotFromIOEntry:forKey:", objc_msgSend(v3, "service"), CFSTR("IOPlatformSerialNumber"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)initOperatorDependancies
{
  id v3;
  uint64_t v4;
  PLCFNotificationOperatorComposition *v5;
  PLCFNotificationOperatorComposition *sysdiagnoseStartListener;
  PLCFNotificationOperatorComposition *v7;
  PLCFNotificationOperatorComposition *sysdiagnoseStopListener;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  PLCFNotificationOperatorComposition *v15;
  PLCFNotificationOperatorComposition *notificationKeyboardHaptics;
  PLCFNotificationOperatorComposition *v17;
  PLCFNotificationOperatorComposition *notificationKeyboardClicks;
  id v19;
  void *v20;
  id v21;
  void *v22;
  PLXPCListenerOperatorComposition *v23;
  PLXPCListenerOperatorComposition *continuityCameraNotification;
  PLXPCListenerOperatorComposition *v25;
  PLXPCListenerOperatorComposition *ambientModeListener;
  PLXPCListenerOperatorComposition *v27;
  PLXPCListenerOperatorComposition *buddyDataListener;
  NSObject *v29;
  PPSFeatureFlagReaderHelper *v30;
  void *v31;
  uint8_t v32[16];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD handler[4];
  id v38;
  id location;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[2];
  _QWORD v46[3];

  v46[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D7FF80]);
  v4 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __41__PLConfigAgent_initOperatorDependancies__block_invoke;
  v44[3] = &unk_1E8577F48;
  v44[4] = self;
  v5 = (PLCFNotificationOperatorComposition *)objc_msgSend(v3, "initWithOperator:forNotification:requireState:withBlock:", self, CFSTR("com.apple.sysdiagnose.sysdiagnoseStarted"), 0, v44);
  sysdiagnoseStartListener = self->_sysdiagnoseStartListener;
  self->_sysdiagnoseStartListener = v5;

  v43[0] = v4;
  v43[1] = 3221225472;
  v43[2] = __41__PLConfigAgent_initOperatorDependancies__block_invoke_264;
  v43[3] = &unk_1E8577F48;
  v43[4] = self;
  v7 = (PLCFNotificationOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FF80]), "initWithOperator:forNotification:requireState:withBlock:", self, CFSTR("com.apple.sysdiagnose.sysdiagnoseStopped"), 0, v43);
  sysdiagnoseStopListener = self->_sysdiagnoseStopListener;
  self->_sysdiagnoseStopListener = v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_pairStatusDidChange_, *MEMORY[0x1E0D517C0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_pairStatusDidChange_, *MEMORY[0x1E0D517D0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_pairStatusDidChange_, *MEMORY[0x1E0D517E8], 0);

  v12 = objc_alloc(MEMORY[0x1E0D7FF80]);
  -[PLOperator workQueue](self, "workQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v4;
  v42[1] = 3221225472;
  v42[2] = __41__PLConfigAgent_initOperatorDependancies__block_invoke_270;
  v42[3] = &unk_1E8577F48;
  v42[4] = self;
  v14 = (void *)objc_msgSend(v12, "initWithWorkQueue:forNotification:requireState:withBlock:", v13, CFSTR("com.apple.system.console_mode_changed"), 1, v42);
  -[PLConfigAgent setConsoleModeListener:](self, "setConsoleModeListener:", v14);

  v41[0] = v4;
  v41[1] = 3221225472;
  v41[2] = __41__PLConfigAgent_initOperatorDependancies__block_invoke_273;
  v41[3] = &unk_1E8577F48;
  v41[4] = self;
  v15 = (PLCFNotificationOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FF80]), "initWithOperator:forNotification:requireState:withBlock:", self, CFSTR("com.apple.keyboard.preferences.haptic-feedback.changed"), 0, v41);
  notificationKeyboardHaptics = self->_notificationKeyboardHaptics;
  self->_notificationKeyboardHaptics = v15;

  v40[0] = v4;
  v40[1] = 3221225472;
  v40[2] = __41__PLConfigAgent_initOperatorDependancies__block_invoke_276;
  v40[3] = &unk_1E8577F48;
  v40[4] = self;
  v17 = (PLCFNotificationOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FF80]), "initWithOperator:forNotification:requireState:withBlock:", self, CFSTR("com.apple.preferences.sounds.keyboard-audio.changed"), 0, v40);
  notificationKeyboardClicks = self->_notificationKeyboardClicks;
  self->_notificationKeyboardClicks = v17;

  _ringerStateNotifyToken = -1;
  objc_initWeak(&location, self);
  v19 = MEMORY[0x1E0C80D38];
  handler[0] = v4;
  handler[1] = 3221225472;
  handler[2] = __41__PLConfigAgent_initOperatorDependancies__block_invoke_278;
  handler[3] = &unk_1E8579E70;
  objc_copyWeak(&v38, &location);
  notify_register_dispatch("com.apple.springboard.ringerstate", &_ringerStateNotifyToken, MEMORY[0x1E0C80D38], handler);

  if (_ringerStateNotifyToken != -1)
    -[PLConfigAgent logEventForwardRingerState](self, "logEventForwardRingerState");
  v36[0] = v4;
  v36[1] = 3221225472;
  v36[2] = __41__PLConfigAgent_initOperatorDependancies__block_invoke_289;
  v36[3] = &unk_1E8578610;
  v36[4] = self;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B770, v36);
  -[PLConfigAgent setPhotoSharingListener:](self, "setPhotoSharingListener:", v20);

  v21 = objc_alloc(MEMORY[0x1E0D80090]);
  v45[0] = CFSTR("clientID");
  v45[1] = CFSTR("event");
  v46[0] = &unk_1E8632718;
  v46[1] = CFSTR("ContinuityCamera");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v4;
  v35[1] = 3221225472;
  v35[2] = __41__PLConfigAgent_initOperatorDependancies__block_invoke_292;
  v35[3] = &unk_1E8578610;
  v35[4] = self;
  v23 = (PLXPCListenerOperatorComposition *)objc_msgSend(v21, "initWithOperator:withRegistration:withBlock:", self, v22, v35);
  continuityCameraNotification = self->_continuityCameraNotification;
  self->_continuityCameraNotification = v23;

  v34[0] = v4;
  v34[1] = 3221225472;
  v34[2] = __41__PLConfigAgent_initOperatorDependancies__block_invoke_297;
  v34[3] = &unk_1E8578610;
  v34[4] = self;
  v25 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B798, v34);
  ambientModeListener = self->_ambientModeListener;
  self->_ambientModeListener = v25;

  v33[0] = v4;
  v33[1] = 3221225472;
  v33[2] = __41__PLConfigAgent_initOperatorDependancies__block_invoke_304;
  v33[3] = &unk_1E8578610;
  v33[4] = self;
  v27 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B7C0, v33);
  buddyDataListener = self->_buddyDataListener;
  self->_buddyDataListener = v27;

  if (objc_msgSend(MEMORY[0x1E0D80078], "deviceRebooted")
    && objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
  {
    PLLogCommon();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v32 = 0;
      _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "Device rebooted, spinning up PPSFeatureFlagReaderHelper", v32, 2u);
    }

    v30 = objc_alloc_init(PPSFeatureFlagReaderHelper);
    -[PPSFeatureFlagReaderHelper getFeatureFlags](v30, "getFeatureFlags");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLConfigAgent logEventPointFeatureFlags:](self, "logEventPointFeatureFlags:", v31);

  }
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

uint64_t __41__PLConfigAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PLLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEBUG, "Sysdiagnose started", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "logEventForwardSysdiagnoseEvent:", 1);
}

uint64_t __41__PLConfigAgent_initOperatorDependancies__block_invoke_264(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PLLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEBUG, "Sysdiagnose stopped", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "logEventForwardSysdiagnoseEvent:", 0);
}

uint64_t __41__PLConfigAgent_initOperatorDependancies__block_invoke_270(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PLLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEBUG, "Console Mode changed", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "logEventForwardConsoleMode");
}

void __41__PLConfigAgent_initOperatorDependancies__block_invoke_273(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Keyboard Haptics Changed: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardKeyboardHaptics");
}

void __41__PLConfigAgent_initOperatorDependancies__block_invoke_276(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Keyboard Clicks Changed: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardKeyboardClicks");
}

void __41__PLConfigAgent_initOperatorDependancies__block_invoke_278(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "logEventForwardRingerState");

}

void __41__PLConfigAgent_initOperatorDependancies__block_invoke_289(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Photo Sharing Changed: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardPhotoSharing:", v6);
}

void __41__PLConfigAgent_initOperatorDependancies__block_invoke_292(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Continuity Camera payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardContinuityCamera:", v6);
}

void __41__PLConfigAgent_initOperatorDependancies__block_invoke_297(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "AmbientModeEnabled Changed: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardAmbientModeEnabled:", v6);
}

void __41__PLConfigAgent_initOperatorDependancies__block_invoke_304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Buddy data payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventNoneBuddyData:", v6);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D517C0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D517D0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0D517E8], 0);

  v6.receiver = self;
  v6.super_class = (Class)PLConfigAgent;
  -[PLAgent dealloc](&v6, sel_dealloc);
}

- (void)log
{
  -[PLConfigAgent logEventNoneConfig](self, "logEventNoneConfig");
  -[PLConfigAgent logEventNonePairedDeviceConfig](self, "logEventNonePairedDeviceConfig");
  -[PLConfigAgent logEventForwardKeyboardHaptics](self, "logEventForwardKeyboardHaptics");
  -[PLConfigAgent logEventForwardKeyboardClicks](self, "logEventForwardKeyboardClicks");
  -[PLConfigAgent logEventForwardRingerState](self, "logEventForwardRingerState");
  -[PLConfigAgent logEventForwardConsoleMode](self, "logEventForwardConsoleMode");
  -[PLConfigAgent logDeviceCapability](self, "logDeviceCapability");
  -[PLConfigAgent logCPUCoreConfig](self, "logCPUCoreConfig");
}

- (void)logEventPointFeatureFlags:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  NSObject *v25;
  PLConfigAgent *v26;
  void *v27;
  void *v28;
  id obj;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  const __CFString *v38;
  void *v39;
  _QWORD v40[4];
  _QWORD v41[4];
  _QWORD v42[3];
  _QWORD v43[3];
  _BYTE v44[128];
  const __CFString *v45;
  void *v46;
  uint8_t buf[4];
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLConfigAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("FeatureFlags"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80078], "deviceBootTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "PPSFeatureFlagReader currFeatureFlags set : %@", buf, 0xCu);
  }

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v5, v6);
  if (objc_msgSend(v4, "count"))
  {
    v31 = v9;
    v32 = v7;
    v26 = self;
    v27 = v6;
    v28 = v5;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v4;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    v10 = 0;
    if (v33)
    {
      v30 = *(_QWORD *)v35;
      do
      {
        v11 = 0;
        v12 = v10;
        do
        {
          if (*(_QWORD *)v35 != v30)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v11);
          v42[0] = CFSTR("Domain");
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Domain"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v43[0] = v14;
          v42[1] = CFSTR("FeatureName");
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("FeatureName"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v43[1] = v15;
          v42[2] = CFSTR("TargetRelease");
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TargetRelease"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v43[2] = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("State"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v17, v10);

          v40[0] = CFSTR("Domain");
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Domain"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v41[0] = v18;
          v40[1] = CFSTR("FeatureName");
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("FeatureName"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v41[1] = v19;
          v40[2] = CFSTR("TargetRelease");
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TargetRelease"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v41[2] = v20;
          v40[3] = CFSTR("State");
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("State"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v41[3] = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v22);

          ++v11;
          v12 = v10;
        }
        while (v33 != v11);
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      }
      while (v33);
    }

    v9 = v31;
    -[PLOperator logEntry:](v26, "logEntry:", v31);
    v7 = v32;
    v38 = CFSTR("__PPSKVPairs__");
    v39 = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "entryDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logForSubsystem:category:data:date:](v26, "logForSubsystem:category:data:date:", CFSTR("BackgroundProcessing"), CFSTR("FeatureFlag"), v23, v24);
    v5 = v28;
    v6 = v27;
  }
  else
  {
    PLLogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "PPSFeatureFlagReader currFeatureFlags set is empty, all Feature Flags are in Default State", buf, 2u);
    }

    v10 = &unk_1E864B7E8;
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E8632760, &unk_1E864B7E8);
    -[PLOperator logEntry:](self, "logEntry:", v9);
    objc_msgSend(v7, "addObject:", &unk_1E864B810);
    v45 = CFSTR("__PPSKVPairs__");
    v46 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "entryDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("BackgroundProcessing"), CFSTR("FeatureFlag"), v23, v24);
  }

}

- (void)logEventForwardSysdiagnoseEvent:(BOOL)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("Start");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("ConfigMetrics"), CFSTR("SysdiagnoseEvent"), v5);
}

- (void)logEventForwardKeyboardHaptics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[PLOperator entryKeyForType:andName:](PLConfigAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("KeyboardHaptics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v3);
  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("KeyboardVisceral"), CFSTR("com.apple.keyboard.preferences"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "BOOLValue");
  else
    v7 = 0;
  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109120;
    v10[1] = v7;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "Keyboard Haptics state: %d", (uint8_t *)v10, 8u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("Enabled"));

  -[PLOperator logEntry:](self, "logEntry:", v4);
}

- (void)logEventForwardKeyboardClicks
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[PLOperator entryKeyForType:andName:](PLConfigAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("KeyboardClicks"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v3);
  v5 = 1;
  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("keyboard-audio"), CFSTR("com.apple.preferences.sounds"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v5 = objc_msgSend(v6, "BOOLValue");
  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109120;
    v10[1] = v5;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "Keyboard Clicks state: %d", (uint8_t *)v10, 8u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("Enabled"));

  -[PLOperator logEntry:](self, "logEntry:", v4);
}

- (void)logEventForwardRingerState
{
  NSObject *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11[2];
  uint8_t buf[4];
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11[0]) = 0;
    _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "Ringer State changed", (uint8_t *)v11, 2u);
  }

  v4 = _ringerStateNotifyToken;
  if (_ringerStateNotifyToken == -1)
  {
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11[0]) = 0;
      _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Ringer NOTIFY_TOKEN_INVALID", (uint8_t *)v11, 2u);
    }

    v4 = _ringerStateNotifyToken;
  }
  v11[0] = 0;
  notify_get_state(v4, v11);
  v6 = v11[0];
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v13 = v6 != 0;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Ringer state: %d", buf, 8u);
  }

  +[PLOperator entryKeyForType:andName:](PLConfigAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Ringer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6 != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("Enabled"));

  -[PLOperator logEntry:](self, "logEntry:", v9);
}

- (void)logEventForwardAmbientModeEnabled:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLConfigAgent, "entryKeyForType:andName:", v4, CFSTR("AmbientModeEnabled"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardPhotoSharing:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLConfigAgent, "entryKeyForType:andName:", v4, CFSTR("PhotoSharing"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardContinuityCamera:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ContinuityCamera"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v6, v4);

  -[PLOperator logEntry:](self, "logEntry:", v5);
}

- (void)logEventNoneBuddyData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("ConfigMetrics"), CFSTR("BuddyData"), v4);
  -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("BackgroundProcessing"), CFSTR("BuddyData"), v4);

  -[PLOperator storage](self, "storage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flushCachesWithReason:", CFSTR("BuddyData"));

}

- (void)logEventForwardConsoleMode
{
  void *v3;
  uint32_t state;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t state64;
  const __CFString *v10;
  void *v11;
  uint8_t buf[4];
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  -[PLConfigAgent consoleModeListener](self, "consoleModeListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  state = notify_get_state(objc_msgSend(v3, "stateToken"), &state64);

  if (state)
  {
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Console Mode state Unavailable", buf, 2u);
    }
  }
  else
  {
    v6 = state64;
    PLLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      v13 = v6 != 0;
      _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Console Mode state: %d", buf, 8u);
    }

    v10 = CFSTR("Enabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6 != 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v5 = objc_claimAutoreleasedReturnValue();

    -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("ConfigMetrics"), CFSTR("ConsoleModeEnabled"), v5);
  }

}

- (void)logDeviceCapability
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D800A8], "deviceCapabilityMapping");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__PLConfigAgent_logDeviceCapability__block_invoke;
  v6[3] = &unk_1E8579E98;
  v7 = v3;
  v4 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);
  -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("ConfigMetrics"), CFSTR("DeviceCapability"), v4);

}

void __36__PLConfigAgent_logDeviceCapability__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Capability%@"), v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v7);

}

- (void)logCPUCoreConfig
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  id v10;

  v10 = (id)objc_opt_new();
  v3 = -[PLConfigAgent getPerfLevelsCount](self, "getPerfLevelsCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v4, CFSTR("numCoreTypes"));

  if ((int)v3 >= 1)
  {
    v5 = 0;
    do
    {
      if ((_DWORD)v5)
        v6 = CFSTR("numEcpuCores");
      else
        v6 = CFSTR("numPcpuCores");
      v7 = (void *)MEMORY[0x1E0CB37E8];
      v8 = v6;
      objc_msgSend(v7, "numberWithInt:", -[PLConfigAgent getCoreCount:](self, "getCoreCount:", v5));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v8);

      v5 = (v5 + 1);
    }
    while ((_DWORD)v3 != (_DWORD)v5);
  }
  -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("ConfigMetrics"), CFSTR("CPUCoreConfig"), v10);

}

- (void)logConfigToBGSQL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("LastUpgradeSystemTimestamp"), CFSTR("com.apple.powerlogd"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeviceBootTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertFromMonotonicToSystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v6, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEFAULT, "Config - Device upgrade timestamp is %@ and system boot time is %@", (uint8_t *)&v15, 0x16u);
  }

  if (v5 >= v9)
    v11 = v9;
  else
    v11 = v5;
  v12 = v11;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("LastUpgradeSystemTimestamp"));

  objc_msgSend(v4, "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("BackgroundProcessing"), CFSTR("Config"), v13, v14);

}

- (void)logConfigEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "dictionary");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[PLConfigAgent getCoverGlass](self, "getCoverGlass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, CFSTR("DeviceCoverGlassCoating"));

  -[PLConfigAgent getShutdownBootReason:](self, "getShutdownBootReason:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, CFSTR("ShutdownReason"));

  -[PLConfigAgent getShutdownBootReason:](self, "getShutdownBootReason:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, CFSTR("BootReason"));

  objc_msgSend(v4, "entryDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("ConfigMetrics"), CFSTR("DeviceConfig"), v14, v9);
  if (objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
  {
    v10 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("DeviceSerialNumber"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithObject:forKey:", v11, CFSTR("DeviceSerialNumber"));
    v12 = objc_claimAutoreleasedReturnValue();

    -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("XcodeMetrics"), CFSTR("DeviceConfig"), v12);
    v13 = (id)v12;
  }
  else
  {
    v13 = v14;
  }
  v15 = v13;
  -[PLConfigAgent logConfigEntryToCA:](self, "logConfigEntryToCA:", v13);

}

- (void)logEventNoneConfig
{
  void *v3;
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
  _BOOL8 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  +[PLOperator entryKeyForType:andName:](PLConfigAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("Config"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D7FFB0]);
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "launchDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithEntryKey:withDate:", v3, v6);

  objc_msgSend(MEMORY[0x1E0D80078], "buildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("Build"));

  objc_msgSend(MEMORY[0x1E0D80078], "supplementalBuildVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("SupplementalBuild"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(MEMORY[0x1E0D80020], "internalBuild") ^ 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("CustomerOS"));

  objc_msgSend(MEMORY[0x1E0D80078], "hardwareModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("Device"));

  objc_msgSend(MEMORY[0x1E0D80078], "crashReporterKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("CRKey"));

  if (objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
  {
    objc_msgSend(MEMORY[0x1E0D80078], "crashReporterKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("CRKey2"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLConfigAgent rootInstalled](self, "rootInstalled"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("RootInstalled"));

  }
  -[PLConfigAgent deviceName](self, "deviceName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("DeviceName"));

  -[PLConfigAgent bootArgs](self, "bootArgs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("BootArgs"));

  objc_msgSend(MEMORY[0x1E0D80078], "deviceBootTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("DeviceBootTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLConfigAgent getDeviceType](self, "getDeviceType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("DeviceType"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Build"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLConfigAgent logAndUpdateLastUpgradeTime:](self, "logAndUpdateLastUpgradeTime:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("LastUpgradeTimestamp"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Build"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLConfigAgent logAndUpdateLastBuild:](self, "logAndUpdateLastBuild:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("LastBuild"));

  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0D80078], "getMachbaseTimeRatio");
  objc_msgSend(v23, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, CFSTR("MachTimeBaseRatio"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PLConfigAgent autolockTime](self, "autolockTime"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, CFSTR("AutoLockTime"));

  -[PLConfigAgent baseband](self, "baseband");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, CFSTR("Baseband"));

  -[PLConfigAgent basebandFirmware](self, "basebandFirmware");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, CFSTR("BasebandFirmware"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLConfigAgent noWatchdogs](self, "noWatchdogs"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, CFSTR("BKNoWatchdogs"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLConfigAgent disableCABlanking](self, "disableCABlanking"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, CFSTR("SBDisableCABlanking"));

  objc_msgSend(MEMORY[0x1E0D80078], "automatedDeviceGroup");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v30, CFSTR("AutomatedDeviceGroup"));

  -[PLConfigAgent seedGroup](self, "seedGroup");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v31, CFSTR("SeedGroup"));

  if (objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
  {
    -[PLConfigAgent hwConfig](self, "hwConfig");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v32, CFSTR("ConfigNumber"));

    -[PLConfigAgent hwBoardRevision](self, "hwBoardRevision");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v33, CFSTR("DebugBoardRevision"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(MEMORY[0x1E0D80078], "devBoardDevice"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v34, CFSTR("DevBoard"));

  }
  -[PLConfigAgent logLastBackupTime](self, "logLastBackupTime");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, CFSTR("LastBackupTimestamp"));

  -[PLConfigAgent deviceShutdownReasons](self, "deviceShutdownReasons");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v36, CFSTR("DeviceBootReasons"));

  -[PLConfigAgent logIcloudAccountType](self, "logIcloudAccountType");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v37, CFSTR("IcloudAccountType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLConfigAgent getOSVariant](self, "getOSVariant"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v38, CFSTR("OSVariant"));

  v39 = (void *)MEMORY[0x1E0CB37E8];
  -[PLConfigAgent logDeviceDiskSize](self, "logDeviceDiskSize");
  objc_msgSend(v39, "numberWithDouble:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v40, CFSTR("DeviceDiskSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLConfigAgent volumeFreespace:](self, "volumeFreespace:", CFSTR("/")));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v41, CFSTR("RemainingDiskSpace"));

  if (objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
  {
    -[PLConfigAgent getDeviceSerialNumber](self, "getDeviceSerialNumber");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v42, CFSTR("DeviceSerialNumber"));

  }
  v43 = -[PLConfigAgent getMDMStatus](self, "getMDMStatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v44, CFSTR("MDMStatus"));

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isiOS") & 1) != 0 || objc_msgSend(MEMORY[0x1E0D80020], "isMac"))
    AnalyticsSendEventLazy();
  -[PLConfigAgent getSplatVersionString](self, "getSplatVersionString");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v45, CFSTR("InstalledSplat"));

  -[PLConfigAgent logLastUpgradeSystemTimestamp](self, "logLastUpgradeSystemTimestamp");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v46, CFSTR("LastUpgradeSystemTimestamp"));

  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:ifNotSet:", CFSTR("InstallType"), &unk_1E8632778);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v47, CFSTR("InstallType"));

  objc_msgSend(MEMORY[0x1E0D80078], "getDeviceSoC");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v48, CFSTR("Device_SoC"));

  -[PLOperator logEntry:](self, "logEntry:", v7);
  -[PLConfigAgent logConfigEntry:](self, "logConfigEntry:", v7);
  -[PLConfigAgent logEntryToCA:](self, "logEntryToCA:", v7);
  -[PLConfigAgent logConfigToBGSQL:](self, "logConfigToBGSQL:", v7);
  -[PLOperator storage](self, "storage");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "flushCachesWithReason:", CFSTR("DeviceConfig"));

}

id __35__PLConfigAgent_logEventNoneConfig__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("MDMStatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)pairStatusDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[PLOperator workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PLConfigAgent_pairStatusDidChange___block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __37__PLConfigAgent_pairStatusDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__PLConfigAgent_pairStatusDidChange___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (qword_1ED8829C8 != -1)
      dispatch_once(&qword_1ED8829C8, block);
    if (byte_1ED88296B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Gizmo pairStatusDidChange:"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLConfigAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLConfigAgent pairStatusDidChange:]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 1804);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v3;
        _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "logEventNonePairedDeviceConfig");
}

uint64_t __37__PLConfigAgent_pairStatusDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88296B = result;
  return result;
}

- (void)logEventNonePairedDeviceConfig
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  int v49;
  void *v50;
  PLConfigAgent *v51;
  _QWORD v52[10];
  _QWORD block[5];
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getActivePairedDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLOperator entryKeyForType:andName:](PLConfigAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("PairedDeviceConfig"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = self;
  -[PLOperator storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastEntryForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x1E0D51760];
  objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E0D51760]);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v50 = (void *)v10;
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Build"));
    v2 = objc_claimAutoreleasedReturnValue();
    if (!(v2 | v11))
    {
      v2 = 0;
      v49 = 1;
LABEL_6:

      goto LABEL_7;
    }
LABEL_5:
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Build"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend((id)v11, "isEqualToString:", v12);

    if (!v8)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (v10)
    goto LABEL_5;
  v49 = 1;
LABEL_7:
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v13 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLConfigAgent_logEventNonePairedDeviceConfig__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v13;
    if (qword_1ED8829D0 != -1)
      dispatch_once(&qword_1ED8829D0, block);
    if (byte_1ED88296C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PairedDeviceConfig: build changed = %d)\n"), v49 ^ 1u);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLConfigAgent.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLConfigAgent logEventNonePairedDeviceConfig]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 1840);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v14;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v6);
  if (v5)
  {
    if (objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
    {
      objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E0D51730]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("PairingID"));

    }
    objc_msgSend(v5, "valueForProperty:", v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("Build"));

    objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E0D51738]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, CFSTR("Device"));

    objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E0D516B8]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v25, CFSTR("HWModel"));

    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("C5DDE5DD-2FF7-4735-80A3-0108488556DE"));
    v27 = objc_msgSend(v5, "supportsCapability:", v26);

    v28 = v27;
  }
  else
  {
    v28 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D51838], "activePairedDeviceSelectorBlock");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "firstObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v32, "valueForProperty:", *MEMORY[0x1E0D516D8]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "BOOLValue");

    if (v34)
      v28 |= 2uLL;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v35, CFSTR("PMode"));

  if (objc_msgSend(MEMORY[0x1E0D80020], "isWatch"))
  {
    ADClientSetValueForScalarKey();
    v52[5] = MEMORY[0x1E0C809B0];
    v52[6] = 3221225472;
    v52[7] = __47__PLConfigAgent_logEventNonePairedDeviceConfig__block_invoke_376;
    v52[8] = &__block_descriptor_40_e19___NSDictionary_8__0l;
    v52[9] = v28;
    AnalyticsSendEventLazy();
  }
  if (!v8)
    goto LABEL_41;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PMode"));
  v36 = objc_claimAutoreleasedReturnValue();
  if (!v36)
    goto LABEL_41;
  v37 = (void *)v36;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PMode"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "unsignedIntegerValue");

  if (v39 == v28)
  {
    if ((v49 & 1) != 0)
      goto LABEL_37;
  }
  else
  {
LABEL_41:
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v40 = objc_opt_class();
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __47__PLConfigAgent_logEventNonePairedDeviceConfig__block_invoke_2;
      v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v52[4] = v40;
      if (qword_1ED8829D8 != -1)
        dispatch_once(&qword_1ED8829D8, v52);
      if (byte_1ED88296D)
      {
        v41 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PMode"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "stringWithFormat:", CFSTR("PairedDeviceConfig: mode changed = %d (0x%x -> 0x%x)\n"), 1, objc_msgSend(v42, "unsignedIntegerValue"), v28);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLConfigAgent.m");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "lastPathComponent");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLConfigAgent logEventNonePairedDeviceConfig]");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "logMessage:fromFile:fromFunction:fromLineNumber:", v43, v46, v47, 1880);

        PLLogCommon();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v55 = v43;
          _os_log_debug_impl(&dword_1CAF47000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  -[PLOperator logEntry:](v51, "logEntry:", v20);
LABEL_37:

}

uint64_t __47__PLConfigAgent_logEventNonePairedDeviceConfig__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88296C = result;
  return result;
}

id __47__PLConfigAgent_logEventNonePairedDeviceConfig__block_invoke_376(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("mode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __47__PLConfigAgent_logEventNonePairedDeviceConfig__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88296D = result;
  return result;
}

- (unint64_t)getEnclosureMaterial
{
  return 0;
}

- (void)logEntryToCA:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0D80078], "deviceRebooted"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DeviceBootReasons"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      if (objc_msgSend(v4, "rangeOfString:", CFSTR("vdd_under")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        MEMORY[0x1D179B7DC](CFSTR("com.apple.power.boot.vdd_under"), 1);
        AnalyticsSendEventLazy();
      }
      v6 = v5;
      AnalyticsSendEventLazy();

    }
  }

}

void *__30__PLConfigAgent_logEntryToCA___block_invoke()
{
  return &unk_1E864B838;
}

id __30__PLConfigAgent_logEntryToCA___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("deviceBootReasons");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)logConfigEntryToCA:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0D80078], "deviceRebooted"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ShutdownReason"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BootReason"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v4 && v5)
    {
      v7 = v4;
      v8 = v6;
      AnalyticsSendEventLazy();

    }
  }

}

id __36__PLConfigAgent_logConfigEntryToCA___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("ShutdownReason"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("BootReason"));
  return v2;
}

- (PLCFNotificationOperatorComposition)notificationKeyboardClicks
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (PLCFNotificationOperatorComposition)notificationKeyboardHaptics
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (PLXPCListenerOperatorComposition)photoSharingListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPhotoSharingListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLXPCListenerOperatorComposition)continuityCameraNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (PLXPCListenerOperatorComposition)ambientModeListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (PLXPCListenerOperatorComposition)buddyDataListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (PLCFNotificationOperatorComposition)consoleModeListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setConsoleModeListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PLIOKitOperatorComposition)iokitExpertDevice
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (PLCFNotificationOperatorComposition)sysdiagnoseStartListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSysdiagnoseStartListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLCFNotificationOperatorComposition)sysdiagnoseStopListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSysdiagnoseStopListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sysdiagnoseStopListener, 0);
  objc_storeStrong((id *)&self->_sysdiagnoseStartListener, 0);
  objc_storeStrong((id *)&self->_iokitExpertDevice, 0);
  objc_storeStrong((id *)&self->_consoleModeListener, 0);
  objc_storeStrong((id *)&self->_buddyDataListener, 0);
  objc_storeStrong((id *)&self->_ambientModeListener, 0);
  objc_storeStrong((id *)&self->_continuityCameraNotification, 0);
  objc_storeStrong((id *)&self->_photoSharingListener, 0);
  objc_storeStrong((id *)&self->_notificationKeyboardHaptics, 0);
  objc_storeStrong((id *)&self->_notificationKeyboardClicks, 0);
}

@end
