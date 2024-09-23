@implementation _UIStatusBarDataConverter

+ (id)_cellularEntryWithData:(id *)a3 signalStrengthEnabled:(BOOL)a4 serviceEnabled:(BOOL)a5 dataNetworkEnabled:(BOOL)a6 serviceString:(const char *)a7 serviceCrossfadeString:(const char *)a8 serviceBadgeString:(const char *)a9 serviceContentType:(unsigned int)a10 dataNetworkType:(unsigned int)a11 gsmSignalStrengthRaw:(int)a12 gsmSignalStrengthBars:(int)a13 callForwardingType:(int)a14 lowDataModeActive:(BOOL)a15
{
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _UIStatusBarDataCellularEntry *v19;
  _BOOL4 v20;
  _BOOL8 v24;
  int v25;
  int v26;
  const char *v27;
  _BYTE *v28;
  _UIStatusBarDataCellularEntry *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  _BYTE *v37;
  _BOOL4 v38;

  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = objc_alloc_init(_UIStatusBarDataCellularEntry);
  v38 = v16;
  -[_UIStatusBarDataEntry setEnabled:](v19, "setEnabled:", (v17 || v16) | v18);
  v20 = -[_UIStatusBarDataEntry isEnabled](v19, "isEnabled");
  if (a10 == 2 && v20 && !v18 && v17)
    -[_UIStatusBarDataEntry setEnabled:](v19, "setEnabled:", 0);
  if (-[_UIStatusBarDataEntry isEnabled](v19, "isEnabled", a8))
  {
    if (!v17)
    {
      -[_UIStatusBarDataNetworkEntry setStatus:](v19, "setStatus:", 0);
      v24 = a15;
      v25 = a14;
      v26 = a13;
LABEL_38:
      if (v38)
      {
        if (a11 > 0xE)
          v34 = 5;
        else
          v34 = qword_186683F68[a11];
      }
      else
      {
        v34 = 0;
      }
      -[_UIStatusBarDataCellularEntry setType:](v19, "setType:", v34);
      -[_UIStatusBarDataIntegerEntry setRawValue:](v19, "setRawValue:", a12);
      -[_UIStatusBarDataIntegerEntry setDisplayValue:](v19, "setDisplayValue:", v26);
      -[_UIStatusBarDataIntegerEntry setDisplayRawValue:](v19, "setDisplayRawValue:", (*((unsigned __int8 *)a3 + 2529) >> 1) & 1);
      -[_UIStatusBarDataCellularEntry setShowsSOSWhenDisabled:](v19, "setShowsSOSWhenDisabled:", *((_BYTE *)a3 + 3160) & 1);
      -[_UIStatusBarDataCellularEntry setSosAvailable:](v19, "setSosAvailable:", (*((unsigned __int8 *)a3 + 3160) >> 1) & 1);
      -[_UIStatusBarDataCellularEntry setCallForwardingEnabled:](v19, "setCallForwardingEnabled:", a3->var0[v25]);
      -[_UIStatusBarDataNetworkEntry setLowDataModeActive:](v19, "setLowDataModeActive:", v24);
      return v19;
    }
    if (v18)
    {
      v24 = a15;
      v25 = a14;
      v26 = a13;
      v27 = a9;
      v28 = v37;
      switch(a10)
      {
        case 0u:
        case 2u:
        case 3u:
        case 4u:
          goto LABEL_28;
        case 1u:
          goto LABEL_30;
        case 5u:
          v29 = v19;
          v30 = 3;
          goto LABEL_31;
        case 6u:
          v29 = v19;
          v30 = 4;
          goto LABEL_31;
        case 7u:
          -[_UIStatusBarDataCellularEntry setIsBootstrapCellular:](v19, "setIsBootstrapCellular:", 1);
LABEL_28:
          v29 = v19;
          v30 = 5;
          goto LABEL_31;
        case 8u:
          -[_UIStatusBarDataCellularEntry setIsBootstrapCellular:](v19, "setIsBootstrapCellular:", 1);
LABEL_30:
          v29 = v19;
          v30 = 2;
LABEL_31:
          -[_UIStatusBarDataNetworkEntry setStatus:](v29, "setStatus:", v30);
          break;
        default:
          goto LABEL_32;
      }
      goto LABEL_32;
    }
    if (a10 - 7 < 2)
    {
      -[_UIStatusBarDataCellularEntry setIsBootstrapCellular:](v19, "setIsBootstrapCellular:", 1);
      v24 = a15;
      v25 = a14;
    }
    else
    {
      if (a10 == 5)
      {
        -[_UIStatusBarDataNetworkEntry setStatus:](v19, "setStatus:", 3);
        v24 = a15;
        v25 = a14;
        goto LABEL_25;
      }
      v24 = a15;
      v25 = a14;
      if (!a10)
      {
        -[_UIStatusBarDataNetworkEntry setStatus:](v19, "setStatus:", 2);
        -[_UIStatusBarDataCellularEntry setWifiCallingEnabled:](v19, "setWifiCallingEnabled:", 1);
LABEL_25:
        v26 = a13;
        v27 = a9;
        v28 = v37;
LABEL_32:
        if (*a7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a7);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIStatusBarDataCellularEntry setString:](v19, "setString:", v31);

        }
        if (*v28)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v28);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIStatusBarDataCellularEntry setCrossfadeString:](v19, "setCrossfadeString:", v32);

        }
        if (*v27)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v27);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIStatusBarDataCellularEntry setBadgeString:](v19, "setBadgeString:", v33);

        }
        goto LABEL_38;
      }
    }
    -[_UIStatusBarDataNetworkEntry setStatus:](v19, "setStatus:", 1);
    goto LABEL_25;
  }
  return v19;
}

+ (id)convertData:(id *)a3 fromReferenceData:(id)a4
{
  id v6;
  _UIStatusBarData *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _UIStatusBarDataStringEntry *v12;
  _UIStatusBarDataStringEntry *v13;
  void *v14;
  void *v15;
  void *v16;
  _UIStatusBarDataCellularEntry *v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _BOOL8 v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  _UIStatusBarDataTetheringEntry *v34;
  id v35;
  id v36;
  _UIStatusBarDataQuietModeEntry *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[4];
  id v69;
  const $6C45178016D353444451090973A2A97F *v70;

  v6 = a4;
  v7 = objc_alloc_init(_UIStatusBarData);
  v8 = -[_UIStatusBarDataStringEntry initFromData:type:string:maxLength:]([_UIStatusBarDataStringEntry alloc], "initFromData:type:string:maxLength:", a3, 0, a3->var1, 64);
  -[_UIStatusBarData setTimeEntry:](v7, "setTimeEntry:", v8);

  v9 = -[_UIStatusBarDataStringEntry initFromData:type:string:maxLength:]([_UIStatusBarDataStringEntry alloc], "initFromData:type:string:maxLength:", a3, 0, a3->var2, 64);
  -[_UIStatusBarData setShortTimeEntry:](v7, "setShortTimeEntry:", v9);

  v10 = -[_UIStatusBarDataStringEntry initFromData:type:string:maxLength:]([_UIStatusBarDataStringEntry alloc], "initFromData:type:string:maxLength:", a3, 1, a3->var3, 256);
  -[_UIStatusBarData setDateEntry:](v7, "setDateEntry:", v10);

  v11 = -[_UIStatusBarDataStringEntry initFromData:type:string:maxLength:]([_UIStatusBarDataStringEntry alloc], "initFromData:type:string:maxLength:", a3, 8, a3->var44, 100);
  -[_UIStatusBarData setPersonNameEntry:](v7, "setPersonNameEntry:", v11);

  v12 = objc_alloc_init(_UIStatusBarDataStringEntry);
  v13 = v12;
  if (a3->var14 == 2 && a3->var8[0])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->var8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarDataStringEntry setStringValue:](v13, "setStringValue:", v14);

  }
  else
  {
    -[_UIStatusBarDataEntry setEnabled:](v12, "setEnabled:", 0);
  }
  -[_UIStatusBarData setDeviceNameEntry:](v7, "setDeviceNameEntry:", v13);

  BYTE4(v66) = *((_BYTE *)a3 + 2080) & 1;
  HIDWORD(v64) = a3->var6;
  LODWORD(v66) = 30;
  HIDWORD(v62) = a3->var21;
  LODWORD(v64) = a3->var4;
  LODWORD(v62) = a3->var14;
  objc_msgSend(a1, "_cellularEntryWithData:signalStrengthEnabled:serviceEnabled:dataNetworkEnabled:serviceString:serviceCrossfadeString:serviceBadgeString:serviceContentType:dataNetworkType:gsmSignalStrengthRaw:gsmSignalStrengthBars:callForwardingType:lowDataModeActive:", a3, a3->var0[4], a3->var0[6], a3->var0[9], a3->var8, a3->var10, a3->var54, v62, v64, v66);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarData setCellularEntry:](v7, "setCellularEntry:", v15);

  BYTE4(v67) = (*((_BYTE *)a3 + 2080) & 2) != 0;
  HIDWORD(v65) = a3->var7;
  LODWORD(v67) = 31;
  HIDWORD(v63) = a3->var22;
  LODWORD(v65) = a3->var5;
  LODWORD(v63) = a3->var15;
  objc_msgSend(a1, "_cellularEntryWithData:signalStrengthEnabled:serviceEnabled:dataNetworkEnabled:serviceString:serviceCrossfadeString:serviceBadgeString:serviceContentType:dataNetworkType:gsmSignalStrengthRaw:gsmSignalStrengthBars:callForwardingType:lowDataModeActive:", a3, a3->var0[5], a3->var0[7], a3->var0[10], a3->var9, a3->var11, a3->var55, v63, v65, v67);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarData setSecondaryCellularEntry:](v7, "setSecondaryCellularEntry:", v16);

  -[_UIStatusBarData secondaryCellularEntry](v7, "secondaryCellularEntry");
  v17 = (_UIStatusBarDataCellularEntry *)objc_claimAutoreleasedReturnValue();
  if (!-[_UIStatusBarDataEntry isEnabled](v17, "isEnabled"))
  {
    v18 = *((_BYTE *)a3 + 3160);

    if ((v18 & 4) == 0)
      goto LABEL_9;
    v17 = objc_alloc_init(_UIStatusBarDataCellularEntry);
    -[_UIStatusBarData setSecondaryCellularEntry:](v7, "setSecondaryCellularEntry:", v17);
  }

LABEL_9:
  +[_UIStatusBarDataEntry disabledEntry](_UIStatusBarDataWifiEntry, "disabledEntry");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __59___UIStatusBarDataConverter_convertData_fromReferenceData___block_invoke;
  v68[3] = &unk_1E16E2740;
  v20 = v19;
  v69 = v20;
  v70 = a3;
  __59___UIStatusBarDataConverter_convertData_fromReferenceData___block_invoke((uint64_t)v68, 9u, a3->var21);
  __59___UIStatusBarDataConverter_convertData_fromReferenceData___block_invoke((uint64_t)v68, 0xAu, a3->var22);
  if (objc_msgSend(v20, "isEnabled"))
  {
    v21 = 3;
    if ((*((_BYTE *)a3 + 3149) & 0x10) == 0)
      v21 = 5;
    if ((*((_BYTE *)a3 + 3149) & 8) != 0)
      v22 = 4;
    else
      v22 = v21;
    objc_msgSend(v20, "setStatus:", v22);
    objc_msgSend(v20, "setRawValue:", a3->var18);
    objc_msgSend(v20, "setDisplayValue:", a3->var19);
    objc_msgSend(v20, "setDisplayRawValue:", (*((unsigned __int8 *)a3 + 2529) >> 2) & 1);
    objc_msgSend(v20, "setLowDataModeActive:", *((_BYTE *)a3 + 2092) & 1);
  }

  -[_UIStatusBarData setWifiEntry:](v7, "setWifiEntry:", v20);
  v23 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataBatteryEntry alloc], "initFromData:type:", a3, 12);
  if (objc_msgSend(v23, "isEnabled"))
  {
    objc_msgSend(v23, "setCapacity:", a3->var23);
    if (a3->var0[14])
    {
      objc_msgSend(v23, "setState:", 3);
      v24 = 1;
    }
    else
    {
      objc_msgSend(v23, "setState:", a3->var24);
      v24 = a3->var0[13];
    }
    objc_msgSend(v23, "setProminentlyShowsDetailString:", v24);
    objc_msgSend(v23, "setSaverModeActive:", *((_BYTE *)a3 + 2536) & 1);
    if (a3->var25[0])
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->var25);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setDetailString:", v25);

    }
  }
  -[_UIStatusBarData setMainBatteryEntry:](v7, "setMainBatteryEntry:", v23);

  v26 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataBluetoothEntry alloc], "initFromData:type:", a3, 16);
  if (objc_msgSend(v26, "isEnabled"))
  {
    if (a3->var0[42])
      v27 = 2;
    else
      v27 = *((_BYTE *)a3 + 2529) & 1;
    objc_msgSend(v26, "setState:", v27);
    v28 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataBatteryEntry alloc], "initFromData:type:", a3, 15);
    if (objc_msgSend(v28, "isEnabled"))
    {
      objc_msgSend(v28, "setCapacity:", a3->var26);
      objc_msgSend(v28, "setState:", 0);
    }
    objc_msgSend(v26, "setBatteryEntry:", v28);

  }
  -[_UIStatusBarData setBluetoothEntry:](v7, "setBluetoothEntry:", v26);

  v29 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataThermalEntry alloc], "initFromData:type:", a3, 33);
  v30 = v29;
  switch(a3->var27)
  {
    case 0:
      objc_msgSend(v29, "setEnabled:", 0);
      break;
    case 1:
      v31 = 0;
      goto LABEL_37;
    case 2:
      v31 = 1;
      goto LABEL_37;
    case 3:
      v31 = 2;
      goto LABEL_37;
    case 4:
      v31 = 3;
      goto LABEL_37;
    case 5:
      v31 = 4;
      goto LABEL_37;
    case 6:
      v31 = 5;
LABEL_37:
      objc_msgSend(v29, "setColor:", v31);
      break;
    default:
      break;
  }
  objc_msgSend(v30, "setSunlightMode:", *((_BYTE *)a3 + 2272) & 1);
  -[_UIStatusBarData setThermalEntry:](v7, "setThermalEntry:", v30);

  v32 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataActivityEntry alloc], "initFromData:type:", a3, 32);
  objc_msgSend(v32, "setType:", ((unint64_t)*((unsigned __int8 *)a3 + 2272) >> 2) & 1);
  if ((*((_BYTE *)a3 + 2272) & 2) != 0)
    objc_msgSend(v32, "setType:", objc_msgSend(v32, "type") | 2);
  if (a3->var31[0])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->var31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setDisplayId:", v33);

  }
  -[_UIStatusBarData setActivityEntry:](v7, "setActivityEntry:", v32);

  v34 = objc_alloc_init(_UIStatusBarDataTetheringEntry);
  -[_UIStatusBarDataEntry setEnabled:](v34, "setEnabled:", a3->var38 != 0);
  -[_UIStatusBarDataTetheringEntry setConnectionCount:](v34, "setConnectionCount:", a3->var38);
  -[_UIStatusBarData setTetheringEntry:](v7, "setTetheringEntry:", v34);

  v35 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataLocationEntry alloc], "initFromData:type:", a3, 21);
  objc_msgSend(v35, "setType:", ((unint64_t)*((unsigned __int8 *)a3 + 2529) >> 3) & 3);
  -[_UIStatusBarData setLocationEntry:](v7, "setLocationEntry:", v35);

  v36 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataLockEntry alloc], "initFromData:type:", a3, 39);
  -[_UIStatusBarData setLockEntry:](v7, "setLockEntry:", v36);

  v37 = [_UIStatusBarDataQuietModeEntry alloc];
  LOBYTE(v61) = (~*((unsigned __int8 *)a3 + 2529) & 0x80) != 0;
  v38 = -[_UIStatusBarDataQuietModeEntry initFromData:type:focusName:maxFocusLength:imageName:maxImageLength:BOOLValue:](v37, "initFromData:type:focusName:maxFocusLength:imageName:maxImageLength:BOOLValue:", a3, 2, a3->var57, 256, a3->var56, 256, v61);
  -[_UIStatusBarData setQuietModeEntry:](v7, "setQuietModeEntry:", v38);

  v39 = -[_UIStatusBarDataBoolEntry initFromData:type:BOOLValue:]([_UIStatusBarDataBoolEntry alloc], "initFromData:type:BOOLValue:", a3, 35, *((_BYTE *)a3 + 3149) & 1);
  -[_UIStatusBarData setElectronicTollCollectionEntry:](v7, "setElectronicTollCollectionEntry:", v39);

  v40 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataEntry alloc], "initFromData:type:", a3, 22);
  -[_UIStatusBarData setRotationLockEntry:](v7, "setRotationLockEntry:", v40);

  v41 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataEntry alloc], "initFromData:type:", a3, 3);
  -[_UIStatusBarData setAirplaneModeEntry:](v7, "setAirplaneModeEntry:", v41);

  v42 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataEntry alloc], "initFromData:type:", a3, 17);
  -[_UIStatusBarData setTtyEntry:](v7, "setTtyEntry:", v42);

  v43 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataEntry alloc], "initFromData:type:", a3, 19);
  -[_UIStatusBarData setNikeEntry:](v7, "setNikeEntry:", v43);

  v44 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataEntry alloc], "initFromData:type:", a3, 25);
  -[_UIStatusBarData setAssistantEntry:](v7, "setAssistantEntry:", v44);

  v45 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataEntry alloc], "initFromData:type:", a3, 27);
  -[_UIStatusBarData setStudentEntry:](v7, "setStudentEntry:", v45);

  v46 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataEntry alloc], "initFromData:type:", a3, 29);
  -[_UIStatusBarData setVpnEntry:](v7, "setVpnEntry:", v46);

  v47 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataEntry alloc], "initFromData:type:", a3, 40);
  -[_UIStatusBarData setLiquidDetectionEntry:](v7, "setLiquidDetectionEntry:", v47);

  v48 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataEntry alloc], "initFromData:type:", a3, 44);
  -[_UIStatusBarData setDisplayWarningEntry:](v7, "setDisplayWarningEntry:", v48);

  v49 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataEntry alloc], "initFromData:type:", a3, 24);
  -[_UIStatusBarData setAirPlayEntry:](v7, "setAirPlayEntry:", v49);

  v50 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataEntry alloc], "initFromData:type:", a3, 26);
  -[_UIStatusBarData setCarPlayEntry:](v7, "setCarPlayEntry:", v50);

  v51 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataEntry alloc], "initFromData:type:", a3, 18);
  -[_UIStatusBarData setAlarmEntry:](v7, "setAlarmEntry:", v51);

  v52 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataEntry alloc], "initFromData:type:", a3, 45);
  -[_UIStatusBarData setSatelliteEntry:](v7, "setSatelliteEntry:", v52);

  v53 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataEntry alloc], "initFromData:type:", a3, 28);
  -[_UIStatusBarData setSensorActivityEntry:](v7, "setSensorActivityEntry:", v53);

  v54 = -[_UIStatusBarDataBoolEntry initFromData:type:BOOLValue:]([_UIStatusBarDataBoolEntry alloc], "initFromData:type:BOOLValue:", a3, 34, (*((unsigned __int8 *)a3 + 3149) >> 1) & 1);
  -[_UIStatusBarData setRadarEntry:](v7, "setRadarEntry:", v54);

  v55 = -[_UIStatusBarDataBoolEntry initFromData:type:BOOLValue:]([_UIStatusBarDataBoolEntry alloc], "initFromData:type:BOOLValue:", a3, 38, (*((unsigned __int8 *)a3 + 3149) >> 2) & 1);
  -[_UIStatusBarData setAnnounceNotificationsEntry:](v7, "setAnnounceNotificationsEntry:", v55);

  v56 = -[_UIStatusBarDataEntry initFromData:type:]([_UIStatusBarDataVoiceControlEntry alloc], "initFromData:type:", a3, 41);
  objc_msgSend(v56, "setType:", ((unint64_t)*((unsigned __int8 *)a3 + 2529) >> 5) & 3);
  -[_UIStatusBarData setVoiceControlEntry:](v7, "setVoiceControlEntry:", v56);

  v57 = -[_UIStatusBarDataStringEntry initFromData:type:string:maxLength:]([_UIStatusBarDataStringEntry alloc], "initFromData:type:string:maxLength:", a3, 50, a3->var42, 256);
  objc_msgSend(v57, "stringValue");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setEnabled:", objc_msgSend(v58, "length") != 0);

  -[_UIStatusBarData setBackNavigationEntry:](v7, "setBackNavigationEntry:", v57);
  v59 = -[_UIStatusBarDataStringEntry initFromData:type:string:maxLength:]([_UIStatusBarDataStringEntry alloc], "initFromData:type:string:maxLength:", a3, 51, a3->var43, 256);
  -[_UIStatusBarData setForwardNavigationEntry:](v7, "setForwardNavigationEntry:", v59);

  -[_UIStatusBarData makeUpdateFromData:](v7, "makeUpdateFromData:", v6);
  return v7;
}

@end
