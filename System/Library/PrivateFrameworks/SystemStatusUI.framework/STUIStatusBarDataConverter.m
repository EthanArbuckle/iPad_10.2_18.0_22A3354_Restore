@implementation STUIStatusBarDataConverter

+ (id)convertData:(id *)a3 fromReferenceData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  char v18;
  unsigned int var21;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  _BOOL8 v25;
  uint64_t var24;
  void *v27;
  void *v28;
  uint64_t var23;
  char v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
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
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD v78[2];
  uint64_t (*v79)(uint64_t, unsigned int, int);
  void *v80;
  id v81;
  uint64_t *v82;
  uint64_t *v83;
  const $6C45178016D353444451090973A2A97F *v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  char v92;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0DB0950]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB09F0]), "initFromData:type:string:maxLength:", a3, 0, a3->var1, 64);
  objc_msgSend(v7, "setTimeEntry:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB09F0]), "initFromData:type:string:maxLength:", a3, 0, a3->var2, 64);
  objc_msgSend(v7, "setShortTimeEntry:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB09F0]), "initFromData:type:string:maxLength:", a3, 1, a3->var3, 256);
  objc_msgSend(v7, "setDateEntry:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB09F0]), "initFromData:type:string:maxLength:", a3, 8, a3->var44, 100);
  objc_msgSend(v7, "setPersonNameEntry:", v11);

  if (a3->var14 == 2 && a3->var8[0])
  {
    v12 = (void *)MEMORY[0x1E0DB09F0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->var8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "entryWithStringValue:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DB09F0], "disabledEntry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setDeviceNameEntry:", v14);

  BYTE4(v76) = *((_BYTE *)a3 + 2080) & 1;
  HIDWORD(v74) = a3->var6;
  LODWORD(v76) = 30;
  HIDWORD(v72) = a3->var21;
  LODWORD(v74) = a3->var4;
  LODWORD(v72) = a3->var14;
  objc_msgSend(a1, "_cellularEntryWithData:signalStrengthEnabled:serviceEnabled:dataNetworkEnabled:serviceString:serviceCrossfadeString:serviceBadgeString:serviceContentType:dataNetworkType:gsmSignalStrengthRaw:gsmSignalStrengthBars:callForwardingType:lowDataModeActive:", a3, a3->var0[4], a3->var0[6], a3->var0[9], a3->var8, a3->var10, a3->var54, v72, v74, v76);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCellularEntry:", v15);

  BYTE4(v77) = (*((_BYTE *)a3 + 2080) & 2) != 0;
  HIDWORD(v75) = a3->var7;
  LODWORD(v77) = 31;
  HIDWORD(v73) = a3->var22;
  LODWORD(v75) = a3->var5;
  LODWORD(v73) = a3->var15;
  objc_msgSend(a1, "_cellularEntryWithData:signalStrengthEnabled:serviceEnabled:dataNetworkEnabled:serviceString:serviceCrossfadeString:serviceBadgeString:serviceContentType:dataNetworkType:gsmSignalStrengthRaw:gsmSignalStrengthBars:callForwardingType:lowDataModeActive:", a3, a3->var0[5], a3->var0[7], a3->var0[10], a3->var9, a3->var11, a3->var55, v73, v75, v77);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSecondaryCellularEntry:", v16);

  objc_msgSend(v7, "secondaryCellularEntry");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isEnabled") & 1) != 0)
    goto LABEL_8;
  v18 = *((_BYTE *)a3 + 3160);

  if ((v18 & 4) != 0)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0DB09A8]);
    objc_msgSend(v7, "setSecondaryCellularEntry:", v17);
LABEL_8:

  }
  v89 = 0;
  v90 = &v89;
  v91 = 0x2020000000;
  v92 = 0;
  v85 = 0;
  v86 = &v85;
  v87 = 0x2020000000;
  v88 = 0;
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v79 = __60__STUIStatusBarDataConverter_convertData_fromReferenceData___block_invoke;
  v80 = &unk_1E8D633B8;
  v81 = 0;
  v82 = &v89;
  v83 = &v85;
  v84 = a3;
  var21 = a3->var21;
  if ((objc_msgSend(0, "isEnabled") & 1) == 0 && v84->var0[9])
  {
    if (var21 != 5)
    {
      if (var21 != 6)
        goto LABEL_15;
      *(_QWORD *)(v83[1] + 24) = 1;
    }
    *(_BYTE *)(v82[1] + 24) = 1;
  }
LABEL_15:
  v79((uint64_t)v78, 10u, a3->var22);
  if (*((_BYTE *)v90 + 24))
  {
    v20 = 3;
    if ((*((_BYTE *)a3 + 3149) & 0x10) == 0)
      v20 = 5;
    if ((*((_BYTE *)a3 + 3149) & 8) != 0)
      v21 = 4;
    else
      v21 = v20;
    objc_msgSend(MEMORY[0x1E0DB0A10], "entryWithType:status:lowDataMode:rawValue:displayValue:displayRawValue:", v86[3], v21, *((_BYTE *)a3 + 2092) & 1, a3->var18, a3->var19, (*((unsigned __int8 *)a3 + 2529) >> 2) & 1);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DB0A10], "disabledEntry");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v22;

  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v89, 8);
  objc_msgSend(v7, "setWifiEntry:", v23);

  if (a3->var0[12])
  {
    v24 = v6;
    if (a3->var0[14])
    {
      v25 = 1;
      var24 = 3;
    }
    else
    {
      var24 = a3->var24;
      v25 = a3->var0[13];
    }
    v28 = (void *)MEMORY[0x1E0DB0988];
    var23 = a3->var23;
    v30 = *((_BYTE *)a3 + 2536);
    if (a3->var25[0])
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->var25);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = 0;
    }
    objc_msgSend(v28, "entryWithCapacity:state:saverMode:prominentlyShowsDetailString:detailString:", var23, var24, v30 & 1, v25, v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v24;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DB0988], "disabledEntry");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setMainBatteryEntry:", v27);

  if (a3->var0[16])
  {
    if (a3->var0[42])
      v32 = 2;
    else
      v32 = *((_BYTE *)a3 + 2529) & 1;
    if (a3->var0[15])
      objc_msgSend(MEMORY[0x1E0DB0988], "entryWithCapacity:state:saverMode:prominentlyShowsDetailString:detailString:", a3->var26, 0, 0, 0, 0);
    else
      objc_msgSend(MEMORY[0x1E0DB0988], "disabledEntry");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB0990], "entryWithState:batteryEntry:", v32, v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DB0990], "disabledEntry");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setBluetoothEntry:", v33);

  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0A00]), "initFromData:type:", a3, 33);
  if (a3->var0[33])
  {
    v36 = 0;
    switch(a3->var27)
    {
      case 0:
        goto LABEL_43;
      case 2:
        v36 = 1;
        break;
      case 3:
        v36 = 2;
        break;
      case 4:
        v36 = 3;
        break;
      case 5:
        v36 = 4;
        break;
      case 6:
        v36 = 5;
        break;
      default:
        break;
    }
    objc_msgSend(MEMORY[0x1E0DB0A00], "entryWithColor:isSunlightMode:", v36, *((_BYTE *)a3 + 2272) & 1);
    v37 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_43:
    objc_msgSend(MEMORY[0x1E0DB0A00], "disabledEntry");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v37;

  objc_msgSend(v7, "setThermalEntry:", v38);
  if (a3->var0[32])
  {
    v39 = *((_BYTE *)a3 + 2272) & 2 | ((unint64_t)*((unsigned __int8 *)a3 + 2272) >> 2) & 1;
    v40 = (void *)MEMORY[0x1E0DB0978];
    if (a3->var31[0])
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->var31);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = 0;
    }
    objc_msgSend(v40, "entryWithType:displayID:", v39, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DB0978], "disabledEntry");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setActivityEntry:", v42);

  if (a3->var38)
    objc_msgSend(MEMORY[0x1E0DB09F8], "entryWithConnectionCount:");
  else
    objc_msgSend(MEMORY[0x1E0DB09F8], "disabledEntry");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTetheringEntry:", v43);

  if (a3->var0[21])
    objc_msgSend(MEMORY[0x1E0DB09D0], "entryWithType:", ((unint64_t)*((unsigned __int8 *)a3 + 2529) >> 3) & 3);
  else
    objc_msgSend(MEMORY[0x1E0DB09D0], "disabledEntry");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocationEntry:", v44);

  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB09D8]), "initFromData:type:", a3, 39);
  objc_msgSend(v7, "setLockEntry:", v45);

  v46 = objc_alloc(MEMORY[0x1E0DB09E0]);
  LOBYTE(v71) = (~*((unsigned __int8 *)a3 + 2529) & 0x80) != 0;
  v47 = (void *)objc_msgSend(v46, "initFromData:type:focusName:maxFocusLength:imageName:maxImageLength:BOOLValue:", a3, 2, a3->var57, 256, a3->var56, 256, v71);
  objc_msgSend(v7, "setQuietModeEntry:", v47);

  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0998]), "initFromData:type:BOOLValue:", a3, 35, *((_BYTE *)a3 + 3149) & 1);
  objc_msgSend(v7, "setElectronicTollCollectionEntry:", v48);

  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB09B8]), "initFromData:type:", a3, 22);
  objc_msgSend(v7, "setRotationLockEntry:", v49);

  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB09B8]), "initFromData:type:", a3, 3);
  objc_msgSend(v7, "setAirplaneModeEntry:", v50);

  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB09B8]), "initFromData:type:", a3, 17);
  objc_msgSend(v7, "setTtyEntry:", v51);

  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB09B8]), "initFromData:type:", a3, 19);
  objc_msgSend(v7, "setNikeEntry:", v52);

  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB09B8]), "initFromData:type:", a3, 25);
  objc_msgSend(v7, "setAssistantEntry:", v53);

  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB09B8]), "initFromData:type:", a3, 27);
  objc_msgSend(v7, "setStudentEntry:", v54);

  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB09B8]), "initFromData:type:", a3, 29);
  objc_msgSend(v7, "setVpnEntry:", v55);

  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB09B8]), "initFromData:type:", a3, 40);
  objc_msgSend(v7, "setLiquidDetectionEntry:", v56);

  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB09B8]), "initFromData:type:", a3, 44);
  objc_msgSend(v7, "setDisplayWarningEntry:", v57);

  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB09B8]), "initFromData:type:", a3, 24);
  objc_msgSend(v7, "setAirPlayEntry:", v58);

  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB09B8]), "initFromData:type:", a3, 26);
  objc_msgSend(v7, "setCarPlayEntry:", v59);

  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB09B8]), "initFromData:type:", a3, 18);
  objc_msgSend(v7, "setAlarmEntry:", v60);

  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB09E8]), "initFromData:type:", a3, 45);
  objc_msgSend(v7, "setSatelliteEntry:", v61);

  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB09B8]), "initFromData:type:", a3, 28);
  objc_msgSend(v7, "setSensorActivityEntry:", v62);

  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0998]), "initFromData:type:BOOLValue:", a3, 34, (*((unsigned __int8 *)a3 + 3149) >> 1) & 1);
  objc_msgSend(v7, "setRadarEntry:", v63);

  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0998]), "initFromData:type:BOOLValue:", a3, 38, (*((unsigned __int8 *)a3 + 3149) >> 2) & 1);
  objc_msgSend(v7, "setAnnounceNotificationsEntry:", v64);

  if (a3->var0[41])
    objc_msgSend(MEMORY[0x1E0DB0A08], "entryWithType:", ((unint64_t)*((unsigned __int8 *)a3 + 2529) >> 5) & 3);
  else
    objc_msgSend(MEMORY[0x1E0DB0A08], "disabledEntry");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVoiceControlEntry:", v65);

  if (a3->var42[0])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->var42);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v66 = 0;
  }
  if (objc_msgSend(v66, "length"))
    objc_msgSend(MEMORY[0x1E0DB09F0], "entryWithStringValue:", v66);
  else
    objc_msgSend(MEMORY[0x1E0DB09F0], "disabledEntry");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setBackNavigationEntry:", v67);
  v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB09F0]), "initFromData:type:string:maxLength:", a3, 51, a3->var43, 256);
  objc_msgSend(v7, "setForwardNavigationEntry:", v68);

  objc_msgSend(v7, "makeUpdateFromData:", v6);
  objc_msgSend(v7, "immutableCopy");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  return v69;
}

+ (id)_cellularEntryWithData:(id *)a3 signalStrengthEnabled:(BOOL)a4 serviceEnabled:(BOOL)a5 dataNetworkEnabled:(BOOL)a6 serviceString:(const char *)a7 serviceCrossfadeString:(const char *)a8 serviceBadgeString:(const char *)a9 serviceContentType:(unsigned int)a10 dataNetworkType:(unsigned int)a11 gsmSignalStrengthRaw:(int)a12 gsmSignalStrengthBars:(int)a13 callForwardingType:(int)a14 lowDataModeActive:(BOOL)a15
{
  _BOOL4 v15;
  int v17;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  char v36;

  if (((a10 == 2) & ~a4 & a5) == 0)
  {
    v15 = a6;
    if (a5 || a6 || a4)
    {
      v17 = a14;
      if (!a5)
      {
        v21 = 0;
        v22 = 0;
        v23 = 0;
        v24 = 0;
        v25 = 0;
        v26 = 0;
        if (a6)
        {
LABEL_34:
          if (a11 > 0xE)
            v27 = 5;
          else
            v27 = qword_1CFEBEF30[a11];
          goto LABEL_37;
        }
LABEL_9:
        v27 = 0;
LABEL_37:
        v29 = *((_BYTE *)a3 + 3160);
        LOBYTE(v33) = (*((_BYTE *)a3 + 2529) & 2) != 0;
        LOBYTE(v32) = a15;
        BYTE2(v31) = v26;
        BYTE1(v31) = (v29 & 2) != 0;
        LOBYTE(v31) = v29 & 1;
        objc_msgSend(MEMORY[0x1E0DB09A8], "entryWithType:stringValue:crossfadeStringValue:badgeStringValue:wifiCalling:callForwarding:showsSOSWhenDisabled:sosAvailable:isBootstrapCellular:status:lowDataMode:rawValue:displayValue:displayRawValue:", v27, v21, v22, v23, v25, a3->var0[v17], v31, v24, v32, a12, a13, v33);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        return v20;
      }
      if (a4)
      {
        switch(a10)
        {
          case 0u:
          case 2u:
          case 3u:
          case 4u:
            v35 = 0;
            v19 = 0;
            goto LABEL_21;
          case 1u:
            v35 = 0;
            v19 = 0;
            goto LABEL_23;
          case 5u:
            goto LABEL_13;
          case 6u:
            v35 = 0;
            v19 = 0;
            v28 = 4;
            break;
          case 7u:
            v35 = 0;
            v19 = 1;
LABEL_21:
            v28 = 5;
            break;
          case 8u:
            v35 = 0;
            v19 = 1;
            goto LABEL_23;
          default:
            v28 = 0;
            v35 = 0;
            v19 = 0;
            break;
        }
LABEL_24:
        v34 = v28;
        v36 = v19;
        HIDWORD(v33) = a14;
        if (*a7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a7);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = 0;
        }
        if (*a8)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a8);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
        if (*a9)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a9);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = 0;
        }
        v17 = a14;
        v25 = v35;
        v26 = v36;
        v24 = v34;
        if (v15)
          goto LABEL_34;
        goto LABEL_9;
      }
      if (a10 - 7 < 2)
      {
        v19 = 1;
      }
      else
      {
        v19 = 0;
        if (!a10)
        {
          v35 = 1;
LABEL_23:
          v28 = 2;
          goto LABEL_24;
        }
        if (a10 == 5)
        {
LABEL_13:
          v35 = 0;
          v19 = 0;
          v28 = 3;
          goto LABEL_24;
        }
      }
      v35 = 0;
      v28 = 1;
      goto LABEL_24;
    }
  }
  objc_msgSend(MEMORY[0x1E0DB09A8], "disabledEntry", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  return v20;
}

uint64_t __60__STUIStatusBarDataConverter_convertData_fromReferenceData___block_invoke(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEnabled");
  if ((result & 1) == 0 && *(_BYTE *)(*(_QWORD *)(a1 + 56) + a2))
  {
    if (a3 != 5)
    {
      if (a3 != 6)
        return result;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

@end
