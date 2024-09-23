@implementation STMutableStatusBarData(Testing)

+ (id)orderedEntryKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _QWORD v31[32];

  v31[31] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0DB0D70];
  v31[0] = *MEMORY[0x1E0DB0D00];
  v31[1] = v2;
  v3 = *MEMORY[0x1E0DB0CB0];
  v31[2] = *MEMORY[0x1E0DB0CC0];
  v31[3] = v3;
  v4 = *MEMORY[0x1E0DB0CF8];
  v31[4] = *MEMORY[0x1E0DB0D38];
  v31[5] = v4;
  v5 = *MEMORY[0x1E0DB0CD8];
  v31[6] = *MEMORY[0x1E0DB0D10];
  v31[7] = v5;
  v6 = *MEMORY[0x1E0DB0C88];
  v31[8] = *MEMORY[0x1E0DB0C70];
  v31[9] = v6;
  v7 = *MEMORY[0x1E0DB0C68];
  v31[10] = *MEMORY[0x1E0DB0CA8];
  v31[11] = v7;
  v8 = *MEMORY[0x1E0DB0D58];
  v31[12] = *MEMORY[0x1E0DB0D68];
  v31[13] = v8;
  v9 = *MEMORY[0x1E0DB0D28];
  v31[14] = *MEMORY[0x1E0DB0D90];
  v31[15] = v9;
  v10 = *MEMORY[0x1E0DB0C60];
  v31[16] = *MEMORY[0x1E0DB0CA0];
  v31[17] = v10;
  v11 = *MEMORY[0x1E0DB0CF0];
  v31[18] = *MEMORY[0x1E0DB0C78];
  v31[19] = v11;
  v12 = *MEMORY[0x1E0DB0D60];
  v31[20] = *MEMORY[0x1E0DB0D78];
  v31[21] = v12;
  v13 = *MEMORY[0x1E0DB0CC8];
  v31[22] = *MEMORY[0x1E0DB0D08];
  v31[23] = v13;
  v14 = *MEMORY[0x1E0DB0D88];
  v31[24] = *MEMORY[0x1E0DB0D50];
  v31[25] = v14;
  v15 = *MEMORY[0x1E0DB0D80];
  v31[26] = *MEMORY[0x1E0DB0C98];
  v31[27] = v15;
  v16 = *MEMORY[0x1E0DB0C90];
  v31[28] = *MEMORY[0x1E0DB0D40];
  v31[29] = v16;
  v31[30] = *MEMORY[0x1E0DB0CE0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 31);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(a1, "entryKeys", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        if ((objc_msgSend(v18, "containsObject:", v24) & 1) == 0)
          objc_msgSend(v18, "addObject:", v24);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v21);
  }

  return v18;
}

+ (id)subsetOfEntryKeys:()Testing withPercentage:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v6 = a4;
  objc_msgSend(a1, "orderedEntryKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = llroundf((float)(unint64_t)objc_msgSend(v7, "count") * a2);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 >= 1)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__STMutableStatusBarData_Testing__subsetOfEntryKeys_withPercentage___block_invoke;
    v11[3] = &unk_1E8D62D28;
    v12 = v6;
    v13 = v9;
    v14 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  }
  return v9;
}

+ (id)_sampleCellularEntryWithSeed:()Testing key:entryKeys:enabledEntryKeys:
{
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  float v18;
  const __CFString *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v9 = (int)(float)(roundf(a1 * 25.0) + 97.0);
  v10 = (void *)MEMORY[0x1E0DB09A8];
  v11 = (uint64_t)(roundf(a1 * 5.0) + 1.0);
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = llroundf(a1 * 9.0) + 1;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  objc_msgSend(v12, "stringWithFormat:", CFSTR("Carrier Name %ld"), v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = a1 * 4.0;
  if ((float)(a1 * 4.0) >= 1.5 || v18 <= 1.25)
    v20 = 0;
  else
    v20 = CFSTR("SOS Only");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c"), v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = llroundf(v18);
  LOBYTE(v28) = a1 > 0.9;
  LOBYTE(v27) = a1 < 0.2;
  BYTE2(v26) = a1 < 0.1;
  BYTE1(v26) = a1 < 0.4;
  LOBYTE(v26) = v18 > 1.0;
  objc_msgSend(v10, "entryWithType:stringValue:crossfadeStringValue:badgeStringValue:wifiCalling:callForwarding:showsSOSWhenDisabled:sosAvailable:isBootstrapCellular:status:lowDataMode:rawValue:displayValue:displayRawValue:", v11, v17, v20, v21, a1 > 0.75, a1 < 0.3, v26, v22, v27, llroundf(a1 * 1000.0), v22, v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DB09A8], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", v16, v15, v14, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)sampleDataWithSeed:()Testing entryKeys:enabledEntryKeys:
{
  id v8;
  id v9;
  id v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
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
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  _BOOL8 v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  uint64_t v60;
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
  __CFString *v71;
  __CFString *v72;
  char v73;
  BOOL v74;
  __CFString *v75;
  __CFString *v76;
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
  unint64_t v97;
  void *v98;
  void *v99;
  const __CFString *v100;
  void *v101;
  double v102;
  void *v103;
  double v104;
  const __CFString *v105;
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
  void *v117;
  void *v118;
  unint64_t v119;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(a1);
  if (!v8)
  {
    -[objc_class entryKeys](a1, "entryKeys");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v102 = a2;
    -[objc_class subsetOfEntryKeys:withPercentage:](a1, "subsetOfEntryKeys:withPercentage:", v101, v102);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_3;
LABEL_40:
    *(float *)&v11 = a2;
    -[objc_class subsetOfEntryKeys:withPercentage:](a1, "subsetOfEntryKeys:withPercentage:", v8, v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_40;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (float)(a2 * 86400.0));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB09F0], "entryWithStringValue:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB09F0], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0D70], v8, v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setTimeEntry:", v14);
  if ((objc_msgSend(v12, "hasSuffix:", CFSTR(" AM")) & 1) != 0
    || objc_msgSend(v12, "hasSuffix:", CFSTR(" PM")))
  {
    objc_msgSend(v12, "substringToIndex:", objc_msgSend(v12, "length") - 3);
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v15;
  }
  v117 = v12;
  objc_msgSend(MEMORY[0x1E0DB09F0], "entryWithStringValue:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB09F0], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0D48], v8, v9, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setShortTimeEntry:", v17);
  v18 = (void *)MEMORY[0x1E0DB09F0];
  v19 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (float)((float)(a2 * 604800.0) + 1513700000.0));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringFromDate:dateStyle:timeStyle:", v20, 1, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "entryWithStringValue:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DB09F0], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0CC0], v8, v9, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setDateEntry:", v23);
  v24 = (void *)MEMORY[0x1E0DB09F0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Person Name %ld"), llroundf(a2 * 999.0) + 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "entryWithStringValue:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DB09F0], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0D08], v8, v9, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPersonNameEntry:", v27);
  objc_msgSend(MEMORY[0x1E0DB09F0], "entryWithStringValue:", CFSTR("iPod"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB09F0], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0CC8], v8, v9, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setDeviceNameEntry:", v29);
  *(float *)&v30 = a2;
  -[objc_class _sampleCellularEntryWithSeed:key:entryKeys:enabledEntryKeys:](a1, "_sampleCellularEntryWithSeed:key:entryKeys:enabledEntryKeys:", *MEMORY[0x1E0DB0CB0], v8, v9, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCellularEntry:", v31);

  v32 = a2;
  v33 = -0.5;
  if (a2 < 0.5)
    v33 = 0.5;
  v34 = v33 + v32;
  *(float *)&v34 = v34;
  -[objc_class _sampleCellularEntryWithSeed:key:entryKeys:enabledEntryKeys:](a1, "_sampleCellularEntryWithSeed:key:entryKeys:enabledEntryKeys:", *MEMORY[0x1E0DB0D38], v8, v9, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSecondaryCellularEntry:", v35);

  v36 = llroundf(a2 * 4.0);
  v37 = llroundf(a2 * 1000.0);
  v38 = llroundf(a2 * 3.0);
  v39 = v32 > 0.2 && a2 < 0.5;
  objc_msgSend(MEMORY[0x1E0DB0A10], "entryWithType:status:lowDataMode:rawValue:displayValue:displayRawValue:", v32 > 0.9, v36, v32 < 0.2, v37, v38, v32 > 0.9);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB0A10], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0D90], v8, v9, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setWifiEntry:", v41);
  v42 = 0x1E0DB0000uLL;
  v43 = (void *)MEMORY[0x1E0DB0988];
  v44 = llroundf(a2 * 100.0);
  v45 = llroundf(a2 + a2);
  v119 = v44;
  if (a2 <= 0.5)
  {
    objc_msgSend(MEMORY[0x1E0DB0988], "entryWithCapacity:state:saverMode:prominentlyShowsDetailString:detailString:", 0.6);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = v45;
    v47 = v44;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld%%"), 0.6, v44);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v47;
    v45 = v46;
    v42 = 0x1E0DB0000;
    objc_msgSend(v43, "entryWithCapacity:state:saverMode:prominentlyShowsDetailString:detailString:", v49, v45, v39, v32 > 0.6, v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(v42 + 2440), "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0D00], v8, v9, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setMainBatteryEntry:", v51);
  v52 = *(void **)(v42 + 2440);
  if (v32 <= 0.7)
    objc_msgSend(v52, "disabledEntry");
  else
    objc_msgSend(v52, "entryWithCapacity:state:saverMode:prominentlyShowsDetailString:detailString:", v119, v32 > 0.9, 0, 0, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB0990], "entryWithState:batteryEntry:", v45, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB0990], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0CA0], v8, v9, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setBluetoothEntry:", v55);
  v56 = llroundf(a2 * 5.0);
  objc_msgSend(MEMORY[0x1E0DB0A00], "entryWithColor:isSunlightMode:", v56, a2 > 0.5);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB0A00], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0D68], v8, v9, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setThermalEntry:", v58);
  if (a2 >= 0.25 && a2 <= 0.75)
    v60 = a2 > 0.5;
  else
    v60 = (a2 > 0.5) | 2;
  objc_msgSend(MEMORY[0x1E0DB0978], "entryWithType:displayID:", v60, 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB0978], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0C60], v8, v9, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setActivityEntry:", v62);
  if (a2 <= 0.5)
    objc_msgSend(MEMORY[0x1E0DB09F8], "disabledEntry");
  else
    objc_msgSend(MEMORY[0x1E0DB09F8], "entryWithConnectionCount:", v56);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB09F8], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0D60], v8, v9, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setTetheringEntry:", v64);
  objc_msgSend(MEMORY[0x1E0DB09D0], "entryWithType:", a2 > 0.5);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB09D0], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0CF0], v8, v9, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setLocationEntry:", v66);
  objc_msgSend(MEMORY[0x1E0DB09D8], "entryWithUnlockFailureCount:", llround(v32));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB09D8], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0CF8], v8, v9, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setLockEntry:", v68);
  objc_msgSend(MEMORY[0x1E0DB0A08], "entryWithType:", v45);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB0A08], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0D80], v8, v9, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setVoiceControlEntry:", v70);
  if (((int)(float)(a2 * 4.0) & 1) != 0)
  {
    v73 = vcvts_n_s32_f32(a2, 3uLL);
    v74 = (v73 & 1) == 0;
    if ((v73 & 1) != 0)
      v75 = CFSTR("lanyardcard.fill");
    else
      v75 = CFSTR("car.fill");
    if (v74)
      v76 = CFSTR("Car");
    else
      v76 = CFSTR("Work");
    v72 = v75;
    v71 = v76;
  }
  else
  {
    v71 = 0;
    v72 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DB09E0], "entryWithFocusName:imageNamed:BOOLValue:", v71, v72, a2 > 0.5);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB09E0], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0D10], v8, v9, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setQuietModeEntry:", v78);
  objc_msgSend(MEMORY[0x1E0DB0998], "entryWithBoolValue:", a2 < 0.5);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB0998], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0CD8], v8, v9, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setElectronicTollCollectionEntry:", v80);
  objc_msgSend(MEMORY[0x1E0DB0998], "entryWithBoolValue:", a2 > 0.5);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB0998], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0D18], v8, v9, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setRadarEntry:", v82);
  objc_msgSend(MEMORY[0x1E0DB0998], "entryWithBoolValue:", a2 > 0.5);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB0998], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0C80], v8, v9, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAnnounceNotificationsEntry:", v84);
  objc_msgSend(MEMORY[0x1E0DB09B8], "entryWithKey:updatedKeys:enabledKeys:", *MEMORY[0x1E0DB0D28], v8, v9);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRotationLockEntry:", v85);

  objc_msgSend(MEMORY[0x1E0DB09B8], "entryWithKey:updatedKeys:enabledKeys:", *MEMORY[0x1E0DB0C70], v8, v9);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAirplaneModeEntry:", v86);

  objc_msgSend(MEMORY[0x1E0DB09B8], "entryWithKey:updatedKeys:enabledKeys:", *MEMORY[0x1E0DB0D58], v8, v9);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTtyEntry:", v87);

  objc_msgSend(MEMORY[0x1E0DB09B8], "entryWithKey:updatedKeys:enabledKeys:", *MEMORY[0x1E0DB0C88], v8, v9);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAssistantEntry:", v88);

  objc_msgSend(MEMORY[0x1E0DB09B8], "entryWithKey:updatedKeys:enabledKeys:", *MEMORY[0x1E0DB0D50], v8, v9);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStudentEntry:", v89);

  objc_msgSend(MEMORY[0x1E0DB09B8], "entryWithKey:updatedKeys:enabledKeys:", *MEMORY[0x1E0DB0D78], v8, v9);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setVpnEntry:", v90);

  objc_msgSend(MEMORY[0x1E0DB09B8], "entryWithKey:updatedKeys:enabledKeys:", *MEMORY[0x1E0DB0CD0], v8, v9);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDisplayWarningEntry:", v91);

  objc_msgSend(MEMORY[0x1E0DB09B8], "entryWithKey:updatedKeys:enabledKeys:", *MEMORY[0x1E0DB0C68], v8, v9);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAirPlayEntry:", v92);

  objc_msgSend(MEMORY[0x1E0DB09B8], "entryWithKey:updatedKeys:enabledKeys:", *MEMORY[0x1E0DB0CA8], v8, v9);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCarPlayEntry:", v93);

  objc_msgSend(MEMORY[0x1E0DB09B8], "entryWithKey:updatedKeys:enabledKeys:", *MEMORY[0x1E0DB0C78], v8, v9);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlarmEntry:", v94);

  objc_msgSend(MEMORY[0x1E0DB09B8], "entryWithKey:updatedKeys:enabledKeys:", *MEMORY[0x1E0DB0D40], v8, v9);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSensorActivityEntry:", v95);

  STUIBackgroundActivityIdentifiersForStyleOverrides(-1);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = vcvtas_u32_f32((float)(unint64_t)objc_msgSend(v96, "count") * a2);
  objc_msgSend(v96, "allObjects");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "objectAtIndexedSubscript:", v97);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend((id)*MEMORY[0x1E0DB0B58], "isEqualToString:", v99) & 1) != 0)
  {
    v100 = CFSTR("Touch to return to Phone");
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0B60], "isEqualToString:", v99) & 1) != 0)
  {
    v100 = CFSTR("Touch to return to FaceTime");
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0B88], "isEqualToString:", v99) & 1) != 0
         || (objc_msgSend((id)*MEMORY[0x1E0DB0B80], "isEqualToString:", v99) & 1) != 0)
  {
    v100 = CFSTR("Touch to return to Navigation");
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0BA0], "isEqualToString:", v99) & 1) != 0)
  {
    v100 = CFSTR("Touch to return to Voice Memos");
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0BB8], "isEqualToString:", v99) & 1) != 0)
  {
    v100 = CFSTR("Touch to stop screen recording");
  }
  else if (objc_msgSend((id)*MEMORY[0x1E0DB0AD8], "isEqualToString:", v99))
  {
    v100 = 0;
  }
  else
  {
    v100 = CFSTR("Touch to return to activity");
  }
  v103 = (void *)MEMORY[0x1E0DB0980];
  if (a2 <= 0.5)
  {
    v105 = &stru_1E8D64C18;
    v104 = CACurrentMediaTime();
  }
  else
  {
    v104 = 0.0;
    v105 = CFSTR("Long Named ");
  }
  objc_msgSend(v103, "entryWithBackgroundActivityIdentifier:displayStartDate:detailString:", v99, v100, v104);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB0980], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0C98], v8, v9, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setBackgroundActivityEntry:", v107);
  v108 = (void *)MEMORY[0x1E0DB09F0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@App %ld"), v105, v119);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "entryWithStringValue:", v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DB09F0], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0C90], v8, v9, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setBackNavigationEntry:", v111);
  v112 = (void *)MEMORY[0x1E0DB09F0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Safari %ld"), v119);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "entryWithStringValue:", v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DB09F0], "entryWithKey:updatedKeys:enabledKeys:populatedEntry:", *MEMORY[0x1E0DB0CE0], v8, v9, v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setForwardNavigationEntry:", v115);
  return v10;
}

- (id)subDataWithSupportedLegacyEntries
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DB0D70], *MEMORY[0x1E0DB0D48], *MEMORY[0x1E0DB0CC0], *MEMORY[0x1E0DB0D08], *MEMORY[0x1E0DB0D00], *MEMORY[0x1E0DB0CA0], *MEMORY[0x1E0DB0D68], *MEMORY[0x1E0DB0C60], *MEMORY[0x1E0DB0D60], *MEMORY[0x1E0DB0CF8], *MEMORY[0x1E0DB0D10], *MEMORY[0x1E0DB0CD8], *MEMORY[0x1E0DB0D18], *MEMORY[0x1E0DB0D28], *MEMORY[0x1E0DB0CF0], *MEMORY[0x1E0DB0C70], *MEMORY[0x1E0DB0D58],
    *MEMORY[0x1E0DB0C88],
    *MEMORY[0x1E0DB0D50],
    *MEMORY[0x1E0DB0D78],
    *MEMORY[0x1E0DB0D80],
    *MEMORY[0x1E0DB0C68],
    *MEMORY[0x1E0DB0CA8],
    *MEMORY[0x1E0DB0C78],
    *MEMORY[0x1E0DB0C80],
    0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataByApplyingUpdate:keys:", a1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lockEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEnabled");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DB09D8], "entryWithUnlockFailureCount:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLockEntry:", v6);

  }
  objc_msgSend(v3, "bluetoothEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "batteryEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEnabled");

  if (v9)
  {
    v25 = (void *)MEMORY[0x1E0DB0988];
    objc_msgSend(v3, "bluetoothEntry");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "batteryEntry");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v26, "capacity");
    objc_msgSend(v3, "bluetoothEntry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "batteryEntry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "saverModeActive");
    objc_msgSend(v3, "bluetoothEntry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "batteryEntry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "prominentlyShowsDetailString");
    objc_msgSend(v3, "bluetoothEntry");
    v28 = v2;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "batteryEntry");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "detailString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "entryWithCapacity:state:saverMode:prominentlyShowsDetailString:detailString:", v24, 0, v12, v15, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0DB0990];
    objc_msgSend(v3, "bluetoothEntry");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "entryWithState:batteryEntry:", objc_msgSend(v21, "state"), v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBluetoothEntry:", v22);

    v2 = v28;
  }

  return v3;
}

- (uint64_t)legacyData
{
  uint64_t (**v2)(void *, _QWORD, void *);
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  BOOL v25;
  uint64_t v26;
  int v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  int v38;
  int v39;
  char v40;
  char v41;
  char v42;
  char v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  int v50;
  int v51;
  int v52;
  char v53;
  void *v54;
  int v55;
  void *v56;
  int v57;
  void *v58;
  int v59;
  void *v60;
  char v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  int v68;
  void *v69;
  uint64_t v70;
  uint64_t *v71;
  void *v72;
  void *v73;
  char v74;
  int v75;
  void *v76;
  int v77;
  void *v78;
  unint64_t v79;
  void *v80;
  char v81;
  void *v82;
  int v83;
  void *v84;
  char v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  int v93;
  void *v94;
  int v95;
  void *v96;
  char v97;
  void *v98;
  int v99;
  void *v100;
  char v101;
  void *v102;
  int v103;
  void *v104;
  char v105;
  void *v106;
  int v107;
  void *v108;
  char v109;
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
  uint64_t v130;
  uint64_t v131;
  id v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  id v138;
  uint64_t v139;
  _QWORD aBlock[5];
  uint64_t v142;
  uint64_t *v143;
  uint64_t v144;
  void *v145;

  v142 = 0;
  v143 = &v142;
  v144 = 0x2020000000;
  v145 = 0;
  v145 = malloc_type_calloc(1uLL, 0xF28uLL, 0x100004080157F5AuLL);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__STMutableStatusBarData_Testing__legacyData__block_invoke;
  aBlock[3] = &unk_1E8D62D50;
  aBlock[4] = &v142;
  v2 = (uint64_t (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  objc_msgSend(a1, "shortTimeEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2[2](v2, 0, v3);

  if (v4)
  {
    v5 = v143[3];
    objc_msgSend(a1, "timeEntry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    strncpy((char *)(v5 + 46), (const char *)objc_msgSend(v7, "UTF8String"), 0x40uLL);

    v8 = v143[3];
    objc_msgSend(a1, "shortTimeEntry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    strncpy((char *)(v8 + 110), (const char *)objc_msgSend(v10, "UTF8String"), 0x40uLL);

  }
  objc_msgSend(a1, "dateEntry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v2[2](v2, 1, v11);

  if (v12)
  {
    v13 = v143[3];
    objc_msgSend(a1, "dateEntry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringValue");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    strncpy((char *)(v13 + 174), (const char *)objc_msgSend(v15, "UTF8String"), 0x100uLL);

  }
  objc_msgSend(a1, "personNameEntry");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v2[2](v2, 8, v16);

  if (v17)
  {
    v18 = v143[3];
    objc_msgSend(a1, "personNameEntry");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringValue");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    strncpy((char *)(v18 + 3049), (const char *)objc_msgSend(v20, "UTF8String"), 0x64uLL);

  }
  objc_msgSend(a1, "cellularEntry");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21 || !objc_msgSend(v21, "isEnabled"))
  {
    v25 = 0;
    goto LABEL_36;
  }
  *(_BYTE *)(v143[3] + 4) = 1;
  switch(objc_msgSend(v22, "status"))
  {
    case 0:
      *(_BYTE *)(v143[3] + 4) = 0;
      break;
    case 1:
    case 2:
      v23 = v143[3];
      v24 = 1;
      goto LABEL_15;
    case 3:
      v23 = v143[3];
      v24 = 5;
      goto LABEL_15;
    case 4:
      v23 = v143[3];
      v24 = 6;
LABEL_15:
      *(_DWORD *)(v23 + 2072) = v24;
      break;
    case 5:
      *(_DWORD *)(v143[3] + 2072) = 0;
      break;
    default:
      break;
  }
  if (objc_msgSend(v22, "isBootstrapCellular"))
  {
    v26 = objc_msgSend(v22, "status");
    if (v26 == 2)
    {
      v27 = 8;
      goto LABEL_21;
    }
    if (v26 == 5)
    {
      v27 = 7;
LABEL_21:
      *(_DWORD *)(v143[3] + 2072) = v27;
    }
  }
  v28 = objc_msgSend(v22, "type") - 1;
  v25 = v28 < 0xD;
  if (v28 <= 0xC)
    *(_DWORD *)(v143[3] + 2096) = dword_1CFEBED5C[v28];
  objc_msgSend(v22, "string");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    *(_BYTE *)(v143[3] + 6) = 1;
    v30 = v143[3];
    objc_msgSend(v22, "string");
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    strncpy((char *)(v30 + 448), (const char *)objc_msgSend(v31, "UTF8String"), 0x64uLL);

    objc_msgSend(v22, "crossfadeString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = v143[3];
      objc_msgSend(v22, "crossfadeString");
      v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      strncpy((char *)(v33 + 648), (const char *)objc_msgSend(v34, "UTF8String"), 0x64uLL);

    }
    objc_msgSend(v22, "badgeString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v36 = v143[3];
      objc_msgSend(v22, "badgeString");
      v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      strncpy((char *)(v36 + 3161), (const char *)objc_msgSend(v37, "UTF8String"), 0x64uLL);

    }
  }
  v38 = objc_msgSend(v22, "rawValue");
  *(_DWORD *)(v143[3] + 432) = v38;
  v39 = objc_msgSend(v22, "displayValue");
  *(_DWORD *)(v143[3] + 440) = v39;
  if (objc_msgSend(v22, "displayRawValue"))
    v40 = 2;
  else
    v40 = 0;
  *(_BYTE *)(v143[3] + 2529) = *(_BYTE *)(v143[3] + 2529) & 0xFD | v40;
  v41 = objc_msgSend(v22, "showsSOSWhenDisabled");
  *(_BYTE *)(v143[3] + 3160) = *(_BYTE *)(v143[3] + 3160) & 0xFE | v41;
  if (objc_msgSend(v22, "sosAvailable"))
    v42 = 2;
  else
    v42 = 0;
  *(_BYTE *)(v143[3] + 3160) = *(_BYTE *)(v143[3] + 3160) & 0xFD | v42;
  v43 = objc_msgSend(v22, "callForwardingEnabled");
  *(_BYTE *)(v143[3] + 30) = v43;
LABEL_36:
  objc_msgSend(a1, "wifiEntry");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (!v44 || !objc_msgSend(v44, "isEnabled"))
    goto LABEL_55;
  v46 = objc_msgSend(v45, "status");
  switch(v46)
  {
    case 3:
      v47 = v143[3];
      v48 = *(_BYTE *)(v47 + 3149) | 0x10;
LABEL_44:
      *(_BYTE *)(v47 + 3149) = v48;
      goto LABEL_45;
    case 4:
      v47 = v143[3];
      v48 = *(_BYTE *)(v47 + 3149) | 8;
      goto LABEL_44;
    case 5:
LABEL_45:
      v25 = 1;
      break;
  }
  v49 = objc_msgSend(v45, "type");
  if (!v49)
  {
    v50 = 5;
    goto LABEL_50;
  }
  if (v49 == 1)
  {
    v50 = 6;
LABEL_50:
    *(_DWORD *)(v143[3] + 2096) = v50;
  }
  v51 = objc_msgSend(v45, "rawValue");
  *(_DWORD *)(v143[3] + 2084) = v51;
  v52 = objc_msgSend(v45, "displayValue");
  *(_DWORD *)(v143[3] + 2088) = v52;
  if (objc_msgSend(v45, "displayRawValue"))
    v53 = 4;
  else
    v53 = 0;
  *(_BYTE *)(v143[3] + 2529) = *(_BYTE *)(v143[3] + 2529) & 0xFB | v53;
LABEL_55:
  *(_BYTE *)(v143[3] + 9) = v25;
  objc_msgSend(a1, "mainBatteryEntry");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v2[2](v2, 12, v54);

  if (v55)
  {
    objc_msgSend(a1, "mainBatteryEntry");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "capacity");
    *(_DWORD *)(v143[3] + 2104) = v57;

    objc_msgSend(a1, "mainBatteryEntry");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "state");
    *(_DWORD *)(v143[3] + 2108) = v59;

    objc_msgSend(a1, "mainBatteryEntry");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "saverModeActive");
    *(_BYTE *)(v143[3] + 2536) = *(_BYTE *)(v143[3] + 2536) & 0xFE | v61;

    objc_msgSend(a1, "mainBatteryEntry");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "detailString");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (v63)
    {
      v64 = v143[3];
      objc_msgSend(a1, "mainBatteryEntry");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "detailString");
      v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      strncpy((char *)(v64 + 2112), (const char *)objc_msgSend(v66, "UTF8String"), 0x96uLL);

    }
  }
  objc_msgSend(a1, "bluetoothEntry");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v2[2](v2, 16, v67);

  if (v68)
  {
    objc_msgSend(a1, "bluetoothEntry");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v69, "state");

    if (v70 == 2)
    {
      v71 = v143;
      *(_BYTE *)(v143[3] + 2529) |= 1u;
      *(_BYTE *)(v71[3] + 42) = 1;
    }
    else if (v70 == 1)
    {
      *(_BYTE *)(v143[3] + 2529) |= 1u;
    }
    objc_msgSend(a1, "bluetoothEntry");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "batteryEntry");
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      v74 = objc_msgSend(v73, "isEnabled");
      *(_BYTE *)(v143[3] + 15) = v74;
      v75 = objc_msgSend(v73, "capacity");
      *(_DWORD *)(v143[3] + 2264) = v75;
    }

  }
  objc_msgSend(a1, "thermalEntry");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v2[2](v2, 33, v76);

  if (v77)
  {
    objc_msgSend(a1, "thermalEntry");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v78, "color");

    if (v79 <= 5)
      *(_DWORD *)(v143[3] + 2268) = v79 + 1;
    objc_msgSend(a1, "thermalEntry");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "sunlightMode");
    *(_BYTE *)(v143[3] + 2272) = *(_BYTE *)(v143[3] + 2272) & 0xFE | v81;

  }
  objc_msgSend(a1, "activityEntry");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v2[2](v2, 32, v82);

  if (v83)
  {
    objc_msgSend(a1, "activityEntry");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v84, "type");

    if ((v85 & 2) != 0)
      *(_BYTE *)(v143[3] + 2272) |= 2u;
    if ((v85 & 1) != 0)
      *(_BYTE *)(v143[3] + 2272) |= 4u;
    objc_msgSend(a1, "activityEntry");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "displayId");
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    if (v87)
    {
      v88 = v143[3];
      objc_msgSend(a1, "activityEntry");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "displayId");
      v90 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      strncpy((char *)(v88 + 2273), (const char *)objc_msgSend(v90, "UTF8String"), 0x100uLL);

    }
  }
  objc_msgSend(a1, "tetheringEntry");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v91, "isEnabled"))
  {
    objc_msgSend(a1, "tetheringEntry");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "connectionCount");
    *(_DWORD *)(v143[3] + 2532) = v93;

  }
  else
  {
    *(_DWORD *)(v143[3] + 2532) = 0;
  }

  objc_msgSend(a1, "locationEntry");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v2[2](v2, 21, v94);

  if (v95)
  {
    objc_msgSend(a1, "locationEntry");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v96, "type");
    *(_BYTE *)(v143[3] + 2529) = *(_BYTE *)(v143[3] + 2529) & 0xE7 | (8 * (v97 & 3));

  }
  objc_msgSend(a1, "quietModeEntry");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v2[2](v2, 2, v98);

  if (v99)
  {
    objc_msgSend(a1, "quietModeEntry");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v100, "BOOLValue"))
      v101 = 0;
    else
      v101 = 0x80;
    *(_BYTE *)(v143[3] + 2529) = v101 & 0x80 | *(_BYTE *)(v143[3] + 2529) & 0x7F;

  }
  objc_msgSend(a1, "electronicTollCollectionEntry");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v2[2](v2, 35, v102);

  if (v103)
  {
    objc_msgSend(a1, "electronicTollCollectionEntry");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(v104, "BOOLValue");
    *(_BYTE *)(v143[3] + 3149) = *(_BYTE *)(v143[3] + 3149) & 0xFE | v105;

  }
  objc_msgSend(a1, "radarEntry");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v2[2](v2, 34, v106);

  if (v107)
  {
    objc_msgSend(a1, "radarEntry");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v108, "BOOLValue"))
      v109 = 2;
    else
      v109 = 0;
    *(_BYTE *)(v143[3] + 3149) = *(_BYTE *)(v143[3] + 3149) & 0xFD | v109;

  }
  objc_msgSend(a1, "lockEntry");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 39, v110);

  objc_msgSend(a1, "rotationLockEntry");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 22, v111);

  objc_msgSend(a1, "airplaneModeEntry");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 3, v112);

  objc_msgSend(a1, "ttyEntry");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 17, v113);

  objc_msgSend(a1, "nikeEntry");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 19, v114);

  objc_msgSend(a1, "assistantEntry");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 25, v115);

  objc_msgSend(a1, "studentEntry");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 27, v116);

  objc_msgSend(a1, "vpnEntry");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 29, v117);

  objc_msgSend(a1, "liquidDetectionEntry");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 40, v118);

  objc_msgSend(a1, "displayWarningEntry");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 44, v119);

  objc_msgSend(a1, "voiceControlEntry");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 41, v120);

  objc_msgSend(a1, "airPlayEntry");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 24, v121);

  objc_msgSend(a1, "carPlayEntry");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 26, v122);

  objc_msgSend(a1, "alarmEntry");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 18, v123);

  objc_msgSend(a1, "satelliteEntry");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 45, v124);

  objc_msgSend(a1, "sensorActivityEntry");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 28, v125);

  objc_msgSend(a1, "announceNotificationsEntry");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 38, v126);

  objc_msgSend(a1, "backNavigationEntry");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v127, "isEnabled"))
  {
    objc_msgSend(a1, "backNavigationEntry");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "stringValue");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = objc_msgSend(v129, "length");

    if (!v130)
      goto LABEL_98;
    v131 = v143[3];
    objc_msgSend(a1, "backNavigationEntry");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "stringValue");
    v132 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    strncpy((char *)(v131 + 2537), (const char *)objc_msgSend(v132, "UTF8String"), 0x100uLL);

  }
LABEL_98:
  objc_msgSend(a1, "forwardNavigationEntry");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v133, "isEnabled"))
  {
LABEL_101:

    goto LABEL_102;
  }
  objc_msgSend(a1, "forwardNavigationEntry");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "stringValue");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = objc_msgSend(v135, "length");

  if (v136)
  {
    v137 = v143[3];
    objc_msgSend(a1, "forwardNavigationEntry");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "stringValue");
    v138 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    strncpy((char *)(v137 + 2793), (const char *)objc_msgSend(v138, "UTF8String"), 0x100uLL);

    goto LABEL_101;
  }
LABEL_102:
  v139 = v143[3];

  _Block_object_dispose(&v142, 8);
  return v139;
}

@end
