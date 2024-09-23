@implementation FMDBLEAudioAdvertisementParser

+ (id)primaryBeaconForBeacons:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100067A2C;
  v18 = sub_100067A3C;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_100067A2C;
  v12 = sub_100067A3C;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100067A44;
  v7[3] = &unk_1002C3CC8;
  v7[4] = &v8;
  v7[5] = &v14;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
  v4 = (void *)v15[5];
  if (!v4)
    v4 = (void *)v9[5];
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

+ (id)configurationDictWithBleDevice:(id)a3 supportedAccessoryProfile:(int64_t)a4
{
  NSDictionary *v4;
  id v6;
  NSDictionary *v7;

  v6 = a3;
  switch(a4)
  {
    case 2:
      v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[FMDBLEAudioAdvertisementParser stereoPairConfigurationDictWithBleDevice:](FMDBLEAudioAdvertisementParser, "stereoPairConfigurationDictWithBleDevice:", v6));
      goto LABEL_7;
    case 1:
      v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[FMDBLEAudioAdvertisementParser airPodsConfigurationDictWithBleDevice:](FMDBLEAudioAdvertisementParser, "airPodsConfigurationDictWithBleDevice:", v6));
      goto LABEL_7;
    case 0:
      v7 = objc_opt_new(NSDictionary);
LABEL_7:
      v4 = v7;
      break;
  }

  return v4;
}

+ (id)airPodsConfigurationDictWithBleDevice:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _UNKNOWN **v11;
  _UNKNOWN **v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  BOOL v38;
  char v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  __CFString *v44;
  __CFString *v45;
  FMDBluetoothDiscoveryAdvertisementConfiguration *v46;
  FMDBLEBeaconIdentifier *v47;
  void *v48;
  void *v49;
  __CFString *v50;
  void *v51;
  uint64_t v52;
  __CFString *v53;
  FMDBluetoothDiscoveryAdvertisementConfiguration *v54;
  uint64_t v55;
  FMDBLEBeaconIdentifier *v56;
  void *v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint8_t buf[4];
  _BOOL4 v74;
  __int16 v75;
  _BOOL4 v76;
  __int16 v77;
  _BOOL4 v78;
  __int16 v79;
  _BOOL4 v80;
  __int16 v81;
  _BOOL4 v82;
  __int16 v83;
  _BOOL4 v84;
  __int16 v85;
  _BOOL4 v86;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "rssi")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothAddress"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fm_MACAddressString"));

  v62 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "advertisementFields"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cc")));
  v72 = v7;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("aState")));
  v10 = (void *)v9;
  if (v9)
    v11 = (_UNKNOWN **)v9;
  else
    v11 = &off_1002D8158;
  v12 = v11;

  v71 = (void *)v8;
  v67 = v12;
  if ((objc_msgSend(v12, "isEqualToNumber:", &off_1002D8158) & 1) != 0)
    v13 = 2;
  else
    v13 = objc_msgSend(v12, "isEqualToNumber:", &off_1002D8170);
  v64 = (void *)v6;
  v65 = v13;
  v63 = (void *)v4;
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("hsStatus")));
  v14 = objc_msgSend(v66, "unsignedIntValue");
  v15 = dword_100304C2C & v14;
  v16 = dword_100304C18 & v14;
  v17 = dword_100304C1C & v14;
  v18 = dword_100304C24 & v14;
  v19 = dword_100304C20 & v14;
  v20 = dword_100304C28 & v14;
  v21 = dword_100304C30 & v14;
  v22 = sub_1000031B8();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110656;
    v74 = v15 != 0;
    v75 = 1024;
    v76 = v21 != 0;
    v77 = 1024;
    v78 = v16 != 0;
    v79 = 1024;
    v80 = v17 != 0;
    v81 = 1024;
    v82 = v18 != 0;
    v83 = 1024;
    v84 = v19 != 0;
    v85 = 1024;
    v86 = v20 != 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "MainHSSTATUS L %i P %i U %i C %i OC %i E %i OE %i", buf, 0x2Cu);
  }
  if (v17)
    v24 = 1;
  else
    v24 = 2;
  if (v19)
    v25 = 1;
  else
    v25 = 2;
  if (v20)
    v26 = 1;
  else
    v26 = 2;
  if (v21)
    v27 = v25;
  else
    v27 = v26;
  if (v21)
    v25 = v26;
  v68 = v25;
  v69 = v27;
  if (v18)
    v28 = 1;
  else
    v28 = 2;
  if (v21)
    v29 = v17 != 0;
  else
    v29 = v18 != 0;
  if (v21)
    v30 = v24;
  else
    v30 = v28;
  if (v21)
    v31 = v28;
  else
    v31 = v24;
  v70 = v31;

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("lc")));
  v33 = objc_msgSend(v32, "BOOLValue");

  v34 = v30;
  if (v33)
    v35 = 2;
  else
    v35 = 1;
  if (v29)
    v36 = v35;
  else
    v36 = 0;
  v61 = v30;
  if (!v16)
    goto LABEL_54;
  v37 = v18 != 0;
  if (!v21)
    v37 = v17 != 0;
  v38 = v30 == 2 && v70 == 2;
  v39 = v29 && v37;
  if (v38)
    v39 = 1;
  if (v69 == 2 && v68 == 2 && (v39 & 1) != 0)
  {
    v40 = v62;
    v60 = 1;
    v41 = 1;
  }
  else
  {
LABEL_54:
    v40 = v62;
    v41 = 1;
    if (v34 == 2)
      v42 = 1;
    else
      v42 = 2;
    v60 = v42;
    if (v70 != 2)
      v41 = 2;
  }
  v59 = v41;
  v43 = objc_alloc_init((Class)NSMutableDictionary);
  v44 = CFSTR("left");
  if (!v15)
    v44 = CFSTR("right");
  v45 = v44;
  v46 = objc_alloc_init(FMDBluetoothDiscoveryAdvertisementConfiguration);
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setName:](v46, "setName:", v45);

  -[FMDBluetoothDiscoveryAdvertisementConfiguration setRssi:](v46, "setRssi:", v63);
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setAddress:](v46, "setAddress:", v64);
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setColorCode:](v46, "setColorCode:", v71);
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setAudioStateStatus:](v46, "setAudioStateStatus:", v65);
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setLidClosedStatus:](v46, "setLidClosedStatus:", v36);
  v47 = -[FMDBLEBeaconIdentifier initWithBLEDevice:other:]([FMDBLEBeaconIdentifier alloc], "initWithBLEDevice:other:", v40, 0);
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setBeaconIdentifier:](v46, "setBeaconIdentifier:", v47);

  -[FMDBluetoothDiscoveryAdvertisementConfiguration setPrimary:](v46, "setPrimary:", v21 != 0);
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setUtpConnected:](v46, "setUtpConnected:", v16 != 0);
  v48 = v64;
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setInCaseStatus:](v46, "setInCaseStatus:", v61);
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setInEarStatus:](v46, "setInEarStatus:", v69);
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setOnHeadStatus:](v46, "setOnHeadStatus:", 500);
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setAvailability:](v46, "setAvailability:", v60);
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryAdvertisementConfiguration name](v46, "name"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v46, v49);

  if (v16)
  {
    v50 = CFSTR("left");
    if (v15)
      v50 = CFSTR("right");
    v51 = v40;
    v52 = v36;
    v53 = v50;
    v54 = objc_alloc_init(FMDBluetoothDiscoveryAdvertisementConfiguration);
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setName:](v54, "setName:", v53);

    -[FMDBluetoothDiscoveryAdvertisementConfiguration setRssi:](v54, "setRssi:", v63);
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setAddress:](v54, "setAddress:", v64);
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setColorCode:](v54, "setColorCode:", v71);
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setAudioStateStatus:](v54, "setAudioStateStatus:", v65);
    v55 = v52;
    v40 = v51;
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setLidClosedStatus:](v54, "setLidClosedStatus:", v55);
    v56 = -[FMDBLEBeaconIdentifier initWithBLEDevice:other:]([FMDBLEBeaconIdentifier alloc], "initWithBLEDevice:other:", v51, 1);
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setBeaconIdentifier:](v54, "setBeaconIdentifier:", v56);

    -[FMDBluetoothDiscoveryAdvertisementConfiguration setPrimary:](v54, "setPrimary:", v21 == 0);
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setUtpConnected:](v54, "setUtpConnected:", 1);
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setInCaseStatus:](v54, "setInCaseStatus:", v70);
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setInEarStatus:](v54, "setInEarStatus:", v68);
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setOnHeadStatus:](v54, "setOnHeadStatus:", 500);
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setAvailability:](v54, "setAvailability:", v59);
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryAdvertisementConfiguration name](v54, "name"));
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v54, v57);

    v48 = v64;
  }

  return v43;
}

+ (id)stereoPairConfigurationDictWithBleDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FMDAccessoryStyleDescriptor *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  _UNKNOWN **v25;
  _UNKNOWN **v26;
  uint64_t v27;
  void *v28;
  void *v29;
  unsigned int v30;
  _BOOL4 v31;
  uint64_t v32;
  _BOOL4 v33;
  _BOOL4 v34;
  id v35;
  NSObject *v36;
  id v37;
  _BOOL4 v38;
  FMDBluetoothDiscoveryAdvertisementConfiguration *v39;
  FMDBLEBeaconIdentifier *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  _BOOL4 v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint8_t buf[4];
  _BOOL4 v59;
  __int16 v60;
  _BOOL4 v61;
  __int16 v62;
  int v63;
  __int16 v64;
  _BOOL4 v65;

  v3 = a3;
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "rssi")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothAddress"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fm_MACAddressString"));

  v55 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "advertisementFields"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cc")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cc")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ccR")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ccC")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hbT")));
  v10 = objc_opt_new(FMDAccessoryStyleDescriptor);
  v53 = v6;
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_1002CD590;
  -[FMDAccessoryStyleDescriptor setColorCodeLeft:](v10, "setColorCodeLeft:", v13);

  v52 = v7;
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = &stru_1002CD590;
  -[FMDAccessoryStyleDescriptor setColorCodeRight:](v10, "setColorCodeRight:", v16);

  v51 = v8;
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = &stru_1002CD590;
  -[FMDAccessoryStyleDescriptor setColorCodeCase:](v10, "setColorCodeCase:", v19);

  v50 = v9;
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
  v21 = (void *)v20;
  if (v20)
    v22 = (const __CFString *)v20;
  else
    v22 = &stru_1002CD590;
  -[FMDAccessoryStyleDescriptor setHeadbandType:](v10, "setHeadbandType:", v22);

  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("aState")));
  v24 = (void *)v23;
  if (v23)
    v25 = (_UNKNOWN **)v23;
  else
    v25 = &off_1002D8158;
  v26 = v25;

  if ((objc_msgSend(v26, "isEqualToNumber:", &off_1002D8158) & 1) != 0)
    v27 = 2;
  else
    v27 = objc_msgSend(v26, "isEqualToNumber:", &off_1002D8170);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hsStatus")));
  v29 = v28;
  if (v28)
  {
    v30 = objc_msgSend(v28, "unsignedIntValue");
    v31 = (dword_100304C1C & v30) != 0;
    v32 = 1;
    if ((dword_100304C1C & v30) != 0)
      v32 = 2;
    v48 = v32;
    v33 = (dword_100304C20 & v30) != 0;
    v34 = (dword_100304C34 & v30) != 0;
  }
  else
  {
    v33 = 0;
    v34 = 0;
    v31 = 0;
    v48 = 0;
  }
  v49 = v26;
  v35 = sub_1000031B8();
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    v59 = v31;
    v60 = 1024;
    v61 = v33;
    v62 = 1024;
    v63 = 0;
    v64 = 1024;
    v65 = v34;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "StereoPair MainHSSTATUS Case %i Ear %i Neck %i TableTop %i", buf, 0x1Au);
  }

  v47 = v34;
  v37 = objc_alloc_init((Class)NSMutableDictionary);
  v38 = v31;
  v39 = objc_alloc_init(FMDBluetoothDiscoveryAdvertisementConfiguration);
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setName:](v39, "setName:", CFSTR("monaural"));
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setRssi:](v39, "setRssi:", v57);
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setAddress:](v39, "setAddress:", v56);
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setColorCode:](v39, "setColorCode:", v54);
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setAudioStateStatus:](v39, "setAudioStateStatus:", v27);
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setLidClosedStatus:](v39, "setLidClosedStatus:", 0);
  v40 = -[FMDBLEBeaconIdentifier initWithBLEDevice:other:]([FMDBLEBeaconIdentifier alloc], "initWithBLEDevice:other:", v55, 0);
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setBeaconIdentifier:](v39, "setBeaconIdentifier:", v40);

  -[FMDBluetoothDiscoveryAdvertisementConfiguration setPrimary:](v39, "setPrimary:", 1);
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setUtpConnected:](v39, "setUtpConnected:", 0);
  if (v38)
    v41 = 1;
  else
    v41 = 2;
  v42 = v37;
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setInCaseStatus:](v39, "setInCaseStatus:", v41);
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setInEarStatus:](v39, "setInEarStatus:", 500);
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setAvailability:](v39, "setAvailability:", v48);
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setStyleDescriptor:](v39, "setStyleDescriptor:", v10);
  v43 = 2;
  if (v47)
    v43 = 4;
  if (v33)
    v43 = 1;
  if (v29)
    v44 = v43;
  else
    v44 = 0;
  -[FMDBluetoothDiscoveryAdvertisementConfiguration setOnHeadStatus:](v39, "setOnHeadStatus:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryAdvertisementConfiguration name](v39, "name"));
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v39, v45);

  return v42;
}

@end
