@implementation CLDurianDeviceManager

- (void)checkMaintainableDevices:(unint64_t)a3
{
  unsigned int v5;
  int v6;
  _BOOL4 v7;
  NSObject *v8;
  int maintainableDeviceCount;
  _BOOL4 isMaintainableHeleOnly;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  _DWORD v15[2];
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  unsigned int v33;

  if (-[CLDurianMaintenanceUtilities isWatch](self->_maintUtils, "isWatch"))
    v5 = -[CLDurianDeviceManager countLeashableDevices](self, "countLeashableDevices");
  else
    v5 = -[CLDurianDeviceManager countMaintainableDevices](self, "countMaintainableDevices");
  v6 = v5;
  v7 = -[CLDurianDeviceManager onlyHeleMaintainableDevices](self, "onlyHeleMaintainableDevices");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    maintainableDeviceCount = self->_maintainableDeviceCount;
    isMaintainableHeleOnly = self->_isMaintainableHeleOnly;
    v11 = -[CLDurianDeviceManager ready](self, "ready");
    v12 = -[CLDurianMaintenanceUtilities isTinkerWatch](self->_maintUtils, "isTinkerWatch");
    v13 = -[NSMutableDictionary count](self->_devices, "count");
    v15[0] = 68291074;
    v15[1] = 0;
    v16 = 2082;
    v17 = "";
    v18 = 1026;
    v19 = a3;
    v20 = 1026;
    v21 = v6;
    v22 = 1026;
    v23 = maintainableDeviceCount;
    v24 = 1026;
    v25 = v7;
    v26 = 1026;
    v27 = isMaintainableHeleOnly;
    v28 = 1026;
    v29 = v11;
    v30 = 1026;
    v31 = v12;
    v32 = 1026;
    v33 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint countcheck\", \"event\":%{public}d, \"current\":%{public}d, \"prior\":%{public}d, \"heleonly\":%{public}d, \"prior\":%{public}d, \"bt\":%{public}hhd, \"tinker\":%{public}hhd, \"devices\":%{public}d}", (uint8_t *)v15, 0x42u);
  }
  if (!-[CLDurianMaintenanceUtilities isTinkerWatch](self->_maintUtils, "isTinkerWatch"))
  {
    if (a3)
    {
      if (a3 == 1 && v6 >= 1)
        goto LABEL_22;
      v14 = self->_maintainableDeviceCount;
      if (!v14 && v6 >= 1)
      {
        if (-[CLDurianDeviceManager ready](self, "ready"))
        {
LABEL_22:
          -[CLDurianDeviceManager startMaintenanceTimer](self, "startMaintenanceTimer");
          goto LABEL_23;
        }
        if (self->_maintainableDeviceCount <= 0)
          goto LABEL_23;
LABEL_21:
        if (self->_isMaintainableHeleOnly != v7)
          goto LABEL_22;
LABEL_23:
        self->_maintainableDeviceCount = v6;
        self->_isMaintainableHeleOnly = v7;
        return;
      }
      if (v14 < 1 || v6)
      {
        if (v14 < 1)
          goto LABEL_23;
        goto LABEL_21;
      }
    }
    -[CLDurianDeviceManager stopMaintenanceTimer](self, "stopMaintenanceTimer");
    goto LABEL_23;
  }
}

- (unsigned)countMaintainableDevices
{
  id v2;
  id v3;
  id v4;
  unsigned int v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v10;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v2);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "ownership") == (id)1)
        ++v5;
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  }
  while (v4);
  return v5;
}

- (void)checkforLeashEligibilityChanges
{
  _BOOL8 v3;
  uint64_t *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  NSObject *v12;
  id v13;
  _BOOL8 v14;
  uint64_t *v15;
  int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  unsigned int v25;
  NSObject *v26;
  id v27;
  unsigned int v28;
  NSObject *v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  id obj;
  uint64_t v34;
  id v35;
  CLDurianDeviceManager *v36;
  uint64_t v37;
  unsigned int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  _BYTE v48[10];
  _BYTE v49[6];
  _BYTE v50[6];
  unsigned int v51;
  __int16 v52;
  unsigned int v53;
  _BYTE v54[128];

  v3 = +[CLDurianSettings forceEnableLeash](CLDurianSettings, "forceEnableLeash");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v36 = self;
  obj = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator");
  v4 = &qword_1022A0000;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v54, 16);
  v5 = 0;
  v6 = 0;
  if (v35)
  {
    v34 = *(_QWORD *)v40;
    v32 = SPTagSeparationStateLeashDropped;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v40 != v34)
          objc_enumerationMutation(obj);
        v37 = v7;
        v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v7);
        if (+[CLDurianSettings lastKnownLocationEnabled](CLDurianSettings, "lastKnownLocationEnabled"))
          v9 = objc_msgSend(v8, "connectionAllowed");
        else
          v9 = 0;
        v38 = objc_msgSend(v8, "isLeashable");
        v10 = -[NSMutableSet containsObject:](self->_leashableUUIDs, "containsObject:", objc_msgSend(v8, "uuid"));
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
        v11 = v10 & v9 | v3;
        v12 = v4[7];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = objc_msgSend(v8, "uuid");
          v14 = v3;
          v15 = v4;
          v16 = v6;
          v17 = v5;
          v18 = objc_msgSend(v8, "connectionAllowed");
          v19 = objc_msgSend(v8, "isConnected");
          *(_DWORD *)buf = 68290307;
          v44 = 0;
          v45 = 2082;
          v46 = "";
          v47 = 2113;
          *(_QWORD *)v48 = v13;
          *(_WORD *)&v48[8] = 1026;
          *(_DWORD *)v49 = v11;
          *(_WORD *)&v49[4] = 1026;
          *(_DWORD *)v50 = v38;
          *(_WORD *)&v50[4] = 1026;
          v51 = v18;
          v5 = v17;
          v6 = v16;
          v4 = v15;
          v3 = v14;
          v52 = 1026;
          v53 = v19;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #leash eligibility update check\", \"deviceId\":%{private, location:escape_only}@, \"curr\":%{public}hhd, \"prev\":%{public}hhd, \"allowed\":%{public}hhd, \"connected\":%{public}hhd}", buf, 0x34u);
        }
        v20 = v38;
        if (((v38 ^ 1 | v11) & 1) == 0)
        {
          if (objc_msgSend(v8, "isConnected"))
          {
            v21 = -[CLDurianDeviceManager getNearOwnerTimeoutForDevice:checkingForNetwork:checkingHele:](self, "getNearOwnerTimeoutForDevice:checkingForNetwork:checkingHele:", v8, 1, 1);
            objc_msgSend(v8, "setDisconnectionReason:", CFSTR("NotLeashable"));
            -[CLDurianDeviceManager sendSeparationStateForDevice:state:includeLocation:](self, "sendSeparationStateForDevice:state:includeLocation:", v8, v32, 0);
            v22 = v21;
            v20 = v38;
            objc_msgSend(v8, "enqueueTask:", objc_msgSend(v8, "createSetNearOwnerTimeoutTaskInSeconds:", v22));
            objc_msgSend(v8, "enqueueTask:", objc_msgSend(v8, "createSetPersistentConnectionTaskWithState:", 0));
          }
          objc_msgSend(v8, "setLeashState:", 0);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BCA48);
          v23 = v4[7];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = objc_msgSend(objc_msgSend(objc_msgSend(v8, "uuid"), "description"), "substringToIndex:", 8);
            v25 = objc_msgSend(v8, "leashState");
            *(_DWORD *)buf = 68289539;
            v44 = 0;
            v45 = 2082;
            v46 = "";
            v47 = 2113;
            *(_QWORD *)v48 = v24;
            v20 = v38;
            *(_WORD *)&v48[8] = 1026;
            *(_DWORD *)v49 = v25;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #leash eligibility lost\", \"item\":%{private, location:escape_only}@, \"state\":%{public}d}", buf, 0x22u);
          }
        }
        if (((v11 ^ 1 | v20) & 1) == 0)
        {
          objc_msgSend(v8, "setLeashState:", 1);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BCA48);
          v26 = v4[7];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = objc_msgSend(objc_msgSend(objc_msgSend(v8, "uuid"), "description"), "substringToIndex:", 8);
            v28 = objc_msgSend(v8, "leashState");
            *(_DWORD *)buf = 68289539;
            v44 = 0;
            v45 = 2082;
            v46 = "";
            v47 = 2113;
            *(_QWORD *)v48 = v27;
            v20 = v38;
            *(_WORD *)&v48[8] = 1026;
            *(_DWORD *)v49 = v28;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #leash eligibility added\", \"item\":%{private, location:escape_only}@, \"state\":%{public}d}", buf, 0x22u);
          }
        }
        v5 += v20;
        v6 += v11;
        v7 = v37 + 1;
      }
      while (v35 != (id)(v37 + 1));
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v54, 16);
    }
    while (v35);
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v29 = v4[7];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = -[NSMutableDictionary count](v36->_devices, "count");
    v31 = -[NSMutableSet count](v36->_leashableUUIDs, "count");
    *(_DWORD *)buf = 68290051;
    v44 = 0;
    v45 = 2082;
    v46 = "";
    v47 = 1025;
    *(_DWORD *)v48 = v30;
    *(_WORD *)&v48[4] = 1026;
    *(_DWORD *)&v48[6] = v31;
    *(_WORD *)v49 = 1026;
    *(_DWORD *)&v49[2] = v6;
    *(_WORD *)v50 = 1026;
    *(_DWORD *)&v50[2] = v5;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #leash list update\", \"devices\":%{private}d, \"leashset\":%{public}d, \"curr\":%{public}d, \"prior\":%{public}d}", buf, 0x2Au);
  }
}

- (void)didFetchAllDurians:(id)a3
{
  NSObject *v3;
  __int128 v4;
  void *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unsigned int v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  unsigned int v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  int v31;
  id v32;
  int v33;
  NSObject *v34;
  id v35;
  unsigned int v36;
  unsigned int v37;
  unsigned __int8 v38;
  NSObject *v39;
  id v40;
  id v41;
  unsigned int v42;
  id v43;
  NSObject *v44;
  id v45;
  unsigned int v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  NSObject *v51;
  id v52;
  id v53;
  id v54;
  const char *v55;
  unsigned int v56;
  unsigned int v57;
  const char *v58;
  const char *v59;
  NSObject *v60;
  id v61;
  id v62;
  CLDurianLocationMonitor *locationMonitor;
  NSObject *v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  int v76;
  id v77;
  uint64_t v78;
  int v79;
  int v81;
  int v82;
  _QWORD v84[6];
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  char v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint8_t v97[128];
  uint8_t buf[4];
  int v99;
  __int16 v100;
  const char *v101;
  __int16 v102;
  _BYTE v103[10];
  _BYTE v104[30];
  const char *v105;
  __int16 v106;
  unsigned int v107;
  _BYTE v108[128];

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v99 = 0;
    v100 = 2082;
    v101 = "";
    v102 = 1026;
    *(_DWORD *)v103 = objc_msgSend(a3, "count");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian fetchall beacons\", \"count\":%{public}d}", buf, 0x18u);
  }
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v77 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v93, v108, 16);
  if (!v77)
  {
    v79 = 0;
    v70 = 0;
    v72 = 0;
    v76 = 0;
    v81 = 0;
    v82 = 256;
    goto LABEL_72;
  }
  v81 = 0;
  v79 = 0;
  v70 = 0;
  v72 = 0;
  v76 = 0;
  v82 = 256;
  v74 = *(_QWORD *)v94;
  v73 = SPBeaconTypeDurian;
  v71 = SPBeaconTypeAccessory;
  v69 = SPBeaconTypeHele;
  *(_QWORD *)&v4 = 68290563;
  v68 = v4;
  do
  {
    v5 = 0;
    do
    {
      if (*(_QWORD *)v94 != v74)
        objc_enumerationMutation(a3);
      v6 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)v5);
      if (objc_msgSend(objc_msgSend(v6, "type", v68), "isEqual:", v73))
      {
        ++v76;
      }
      else if (objc_msgSend(objc_msgSend(v6, "type"), "isEqual:", v71))
      {
        ++v72;
      }
      else
      {
        if (!objc_msgSend(objc_msgSend(v6, "type"), "isEqual:", v69))
        {
          LODWORD(v70) = v70 + 1;
          goto LABEL_68;
        }
        ++HIDWORD(v70);
      }
      if (-[NSMutableDictionary objectForKey:](self->_devices, "objectForKey:", objc_msgSend(v6, "identifier")))
        goto LABEL_21;
      v7 = (const char *)objc_msgSend(v6, "systemVersion");
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      v8 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_msgSend(objc_msgSend(objc_msgSend(v6, "identifier"), "description"), "substringToIndex:", 8);
        v10 = objc_msgSend(v6, "identifier");
        v11 = objc_msgSend(v6, "name");
        v12 = objc_msgSend(v6, "systemVersion");
        v13 = objc_msgSend(v6, "connectableDeviceCount");
        *(_DWORD *)buf = v68;
        v99 = 0;
        v100 = 2082;
        v101 = "";
        v102 = 2113;
        *(_QWORD *)v103 = v9;
        *(_WORD *)&v103[8] = 2113;
        *(_QWORD *)v104 = v10;
        *(_WORD *)&v104[8] = 2114;
        *(_QWORD *)&v104[10] = v11;
        *(_WORD *)&v104[18] = 2114;
        *(_QWORD *)&v104[20] = v12;
        *(_WORD *)&v104[28] = 2114;
        v105 = v7;
        v106 = 1026;
        v107 = v13;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetchall update add\", \"item\":%{private, location:escape_only}@, \"full\":%{private, location:escape_only}@, \"name\":%{public, location:escape_only}@, \"systemVersion\":%{public, location:escape_only}@, \"aisVersion\":%{public, location:escape_only}@, \"conn\":%{public}d}", buf, 0x4Au);
LABEL_21:
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      }
      v14 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(objc_msgSend(objc_msgSend(v6, "identifier"), "description"), "substringToIndex:", 8);
        v16 = objc_msgSend(v6, "identifier");
        v17 = objc_msgSend(v6, "name");
        v18 = objc_msgSend(v6, "type");
        v19 = +[CLDurianSettings forceEnablePosh](CLDurianSettings, "forceEnablePosh");
        *(_DWORD *)buf = 68290307;
        v99 = 0;
        v100 = 2082;
        v101 = "";
        v102 = 2113;
        *(_QWORD *)v103 = v15;
        *(_WORD *)&v103[8] = 2113;
        *(_QWORD *)v104 = v16;
        *(_WORD *)&v104[8] = 2114;
        *(_QWORD *)&v104[10] = v17;
        *(_WORD *)&v104[18] = 2114;
        *(_QWORD *)&v104[20] = v18;
        *(_WORD *)&v104[28] = 1025;
        LODWORD(v105) = v19;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetchall update creating durian device for\", \"item\":%{private, location:escape_only}@, \"full\":%{private, location:escape_only}@, \"name\":%{public, location:escape_only}@, \"type\":%{public, location:escape_only}@, \"posh\":%{private}hhd}", buf, 0x40u);
      }
      v20 = -[CLDurianDeviceManager deviceWithUUID:beaconType:isPosh:](self, "deviceWithUUID:beaconType:isPosh:", objc_msgSend(v6, "identifier"), objc_msgSend(v6, "type"), +[CLDurianSettings forceEnablePosh](CLDurianSettings, "forceEnablePosh"));
      if (objc_msgSend(v20, "pendingDisconnect"))
      {
        -[CLDurianDeviceManager cancelDisconnectionOnMissingBeaconWithUUID:](self, "cancelDisconnectionOnMissingBeaconWithUUID:", objc_msgSend(v20, "uuid"));
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
        v21 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          v22 = objc_msgSend(objc_msgSend(objc_msgSend(v20, "uuid"), "description"), "substringToIndex:", 8);
          v23 = objc_msgSend(objc_msgSend(v20, "beacon"), "name");
          v24 = objc_msgSend(v20, "isConnected");
          *(_DWORD *)buf = 68289795;
          v25 = "NO";
          if (v24)
            v25 = "YES";
          v99 = 0;
          v100 = 2082;
          v101 = "";
          v102 = 2113;
          *(_QWORD *)v103 = v22;
          *(_WORD *)&v103[8] = 2114;
          *(_QWORD *)v104 = v23;
          *(_WORD *)&v104[8] = 2082;
          *(_QWORD *)&v104[10] = v25;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetchall, missing owned beacon has been found, cancelled disconnection backstop\", \"item\":%{private, location:escape_only}@, \"name\":%{public, location:escape_only}@, \"isConnected\":%{public, location:escape_only}s}", buf, 0x30u);
        }
      }
      v26 = (uint64_t)objc_msgSend(objc_msgSend(v20, "beacon"), "connectableDeviceCount");
      if (v26 >= 255)
        v27 = 255;
      else
        v27 = v26;
      v28 = (uint64_t)objc_msgSend(v6, "connectableDeviceCount");
      if (v28 >= 255)
        v29 = 255;
      else
        v29 = v28;
      v30 = objc_msgSend(v6, "connectableDeviceCount");
      v31 = v82;
      if ((uint64_t)v30 < v82)
        v31 = (int)v30;
      v82 = v31;
      v32 = objc_msgSend(v6, "connectableDeviceCount");
      if ((uint64_t)v32 <= v81)
        v33 = v81;
      else
        v33 = (int)v32;
      v81 = v33;
      if (v27 == v29)
      {
        objc_msgSend(v20, "isConnected");
      }
      else
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
        v34 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          v35 = objc_msgSend(objc_msgSend(objc_msgSend(v20, "uuid"), "description"), "substringToIndex:", 8);
          v36 = objc_msgSend(v20, "isConnected");
          v37 = objc_msgSend(v20, "isMultiConnectionEnabled");
          *(_DWORD *)buf = 68290307;
          v99 = 0;
          v100 = 2082;
          v101 = "";
          v102 = 2113;
          *(_QWORD *)v103 = v35;
          *(_WORD *)&v103[8] = 1026;
          *(_DWORD *)v104 = v36;
          *(_WORD *)&v104[4] = 1026;
          *(_DWORD *)&v104[6] = v29;
          *(_WORD *)&v104[10] = 1026;
          *(_DWORD *)&v104[12] = v27;
          *(_WORD *)&v104[16] = 1026;
          *(_DWORD *)&v104[18] = v37;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #multi connectable check\", \"item\":%{private, location:escape_only}@, \"connected\":%{public}d, \"connectable\":%{public}d, \"prior\":%{public}d, \"multion\":%{public}hhd}", buf, 0x34u);
        }
        if (!objc_msgSend(v20, "isConnected"))
          goto LABEL_56;
        v38 = objc_msgSend(v20, "isMultiConnectionEnabled");
        if (v29 < 2)
        {
          if ((v38 & 1) == 0)
            goto LABEL_56;
LABEL_55:
          objc_msgSend(v20, "enqueueTask:", +[CLDurianTask setMaxConnectionsTaskWithCount:](CLDurianTask, "setMaxConnectionsTaskWithCount:", v29));
          goto LABEL_56;
        }
        if ((v38 & 1) == 0)
          goto LABEL_55;
      }
LABEL_56:
      objc_msgSend(v20, "setBeacon:", v6);
      if (objc_msgSend(v20, "groupUuid"))
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
        v39 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          v40 = objc_msgSend(objc_msgSend(objc_msgSend(v6, "identifier"), "description"), "substringToIndex:", 8);
          v41 = objc_msgSend(objc_msgSend(objc_msgSend(v20, "groupUuid"), "description"), "substringToIndex:", 8);
          v42 = objc_msgSend(v20, "groupPartNumber");
          v43 = objc_msgSend(v20, "prettyBeaconType");
          *(_DWORD *)buf = 68290051;
          v99 = 0;
          v100 = 2082;
          v101 = "";
          v102 = 2113;
          *(_QWORD *)v103 = v40;
          *(_WORD *)&v103[8] = 2113;
          *(_QWORD *)v104 = v41;
          *(_WORD *)&v104[8] = 1026;
          *(_DWORD *)&v104[10] = v42;
          *(_WORD *)&v104[14] = 2114;
          *(_QWORD *)&v104[16] = v43;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian grouped beacon\", \"item\":%{private, location:escape_only}@, \"group\":%{private, location:escape_only}@, \"part\":%{public}d, \"type\":%{public, location:escape_only}@}", buf, 0x36u);
        }
        ++v79;
      }
      if (objc_msgSend(v20, "isHawkeyeAccessory"))
      {
        -[CLDurianDeviceDelegate startMonitoringDeviceForFirmwareUpdate:](self->_deviceDelegate, "startMonitoringDeviceForFirmwareUpdate:", v20);
      }
      else
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
        v44 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
        {
          v45 = objc_msgSend(objc_msgSend(objc_msgSend(v20, "uuid"), "description"), "substringToIndex:", 8);
          v46 = objc_msgSend(v20, "isHawkeyeAccessory");
          *(_DWORD *)buf = 68289539;
          v99 = 0;
          v100 = 2082;
          v101 = "";
          v102 = 2113;
          *(_QWORD *)v103 = v45;
          *(_WORD *)&v103[8] = 1025;
          *(_DWORD *)v104 = v46;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Not going to monitoring device for firmware updates\", \"item\":%{private, location:escape_only}@, \"isHawkeyeAcessory\":%{private}hhd}", buf, 0x22u);
        }
      }
LABEL_68:
      v5 = (char *)v5 + 1;
    }
    while (v77 != v5);
    v77 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v93, v108, 16);
  }
  while (v77);
LABEL_72:
  v75 = objc_alloc_init((Class)NSMutableArray);
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v47 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator");
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
  if (v48)
  {
    v78 = *(_QWORD *)v90;
    do
    {
      v49 = 0;
      do
      {
        if (*(_QWORD *)v90 != v78)
          objc_enumerationMutation(v47);
        v50 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)v49);
        v85 = 0;
        v86 = &v85;
        v87 = 0x2020000000;
        v88 = 0;
        v84[0] = _NSConcreteStackBlock;
        v84[1] = 3221225472;
        v84[2] = sub_10151C1B0;
        v84[3] = &unk_1021BC810;
        v84[4] = v50;
        v84[5] = &v85;
        objc_msgSend(a3, "enumerateObjectsUsingBlock:", v84);
        if (!*((_BYTE *)v86 + 24) && objc_msgSend(v50, "ownership") == (id)1)
        {
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BCA48);
          v51 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v52 = v47;
            v53 = objc_msgSend(objc_msgSend(objc_msgSend(v50, "uuid"), "description"), "substringToIndex:", 8);
            v54 = objc_msgSend(objc_msgSend(v50, "beacon"), "name");
            if (objc_msgSend(v50, "isConnected"))
              v55 = "YES";
            else
              v55 = "NO";
            v56 = objc_msgSend(v50, "pendingDisconnect");
            v57 = objc_msgSend(v50, "pendingDisconnect");
            *(_DWORD *)buf = 68290307;
            v58 = "NO";
            if (v56)
              v59 = "YES";
            else
              v59 = "NO";
            v99 = 0;
            if (v57)
              v58 = "YES";
            v100 = 2082;
            v101 = "";
            v102 = 2113;
            *(_QWORD *)v103 = v53;
            *(_WORD *)&v103[8] = 2114;
            *(_QWORD *)v104 = v54;
            *(_WORD *)&v104[8] = 2082;
            *(_QWORD *)&v104[10] = v55;
            *(_WORD *)&v104[18] = 2082;
            *(_QWORD *)&v104[20] = v59;
            *(_WORD *)&v104[28] = 2082;
            v105 = v58;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetchall update remove\", \"item\":%{private, location:escape_only}@, \"name\":%{public, location:escape_only}@, \"isConnected\":%{public, location:escape_only}s, \"isTaskQueueEmpty\":%{public, location:escape_only}s, \"pendingDisconnect\":%{public, location:escape_only}s}", buf, 0x44u);
            v47 = v52;
          }
          if (objc_msgSend(v50, "isConnected"))
          {
            objc_msgSend(v50, "setPendingDisconnect:", 1);
            if (objc_msgSend(v50, "isTaskQueueEmpty"))
              -[CLDurianDeviceManager scheduleDisconnectionOnMissingBeaconWithUUID:](self, "scheduleDisconnectionOnMissingBeaconWithUUID:", objc_msgSend(v50, "uuid"));
          }
          else
          {
            objc_msgSend(v75, "addObject:", objc_msgSend(v50, "uuid"));
          }
          if (objc_msgSend(v50, "isHawkeyeAccessory"))
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BCA48);
            v60 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v61 = objc_msgSend(objc_msgSend(objc_msgSend(v50, "uuid"), "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289283;
              v99 = 0;
              v100 = 2082;
              v101 = "";
              v102 = 2113;
              *(_QWORD *)v103 = v61;
              _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Stop monitoring device for firmware updates\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
            -[CLDurianDeviceDelegate stopMonitoringDeviceForFirmwareUpdate:](self->_deviceDelegate, "stopMonitoringDeviceForFirmwareUpdate:", v50);
          }
        }
        _Block_object_dispose(&v85, 8);
        v49 = (char *)v49 + 1;
      }
      while (v48 != v49);
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
    }
    while (v48);
  }
  -[NSMutableDictionary removeObjectsForKeys:](self->_devices, "removeObjectsForKeys:", v75);
  if (objc_msgSend(v75, "count"))
    sub_1015365D0((uint64_t)objc_msgSend(v75, "count"));
  if (!-[CLDurianMaintenanceUtilities isWatch](self->_maintUtils, "isWatch"))
    -[CLDurianDeviceManager checkMaintainableDevices:](self, "checkMaintainableDevices:", 2);
  if (!self->_initialBeaconsFetched)
  {
    self->_initialBeaconsFetched = 1;
    -[CLDurianDeviceManager resetDeviceConnections:](self, "resetDeviceConnections:", CFSTR("1stfetch"));
  }
  v62 = objc_msgSend(a3, "count");
  locationMonitor = self->_locationMonitor;
  if (v62)
    -[CLDurianLocationMonitor startLeechingLocation](locationMonitor, "startLeechingLocation");
  else
    -[CLDurianLocationMonitor stopLeechingLocation](locationMonitor, "stopLeechingLocation");
  -[CLDurianDeviceManager checkforLeashEligibilityChanges](self, "checkforLeashEligibilityChanges");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v64 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v65 = objc_msgSend(a3, "count");
    v66 = -[NSMutableDictionary count](self->_devices, "count");
    v67 = objc_msgSend(v75, "count");
    v100 = 2082;
    *(_DWORD *)buf = 68290818;
    v99 = 0;
    v101 = "";
    v102 = 1026;
    *(_DWORD *)v103 = v65;
    *(_WORD *)&v103[4] = 1026;
    *(_DWORD *)&v103[6] = v66;
    *(_WORD *)v104 = 1026;
    *(_DWORD *)&v104[2] = 1000000 * v70 + 10000 * HIDWORD(v70) + 100 * v72 + v76;
    *(_WORD *)&v104[6] = 1026;
    *(_DWORD *)&v104[8] = v79;
    *(_WORD *)&v104[12] = 1026;
    *(_DWORD *)&v104[14] = v67;
    *(_WORD *)&v104[18] = 1026;
    *(_DWORD *)&v104[20] = v82;
    *(_WORD *)&v104[24] = 1026;
    *(_DWORD *)&v104[26] = v81;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetchall end\", \"beacons\":%{public}d, \"devices\":%{public}d, \"types\":%{public}d, \"grouped\":%{public}d, \"removed\":%{public}d, \"minconn\":%{public}d, \"maxconn\":%{public}d}", buf, 0x3Cu);
  }

}

- (void)didReceiveBeaconDifference:(id)a3
{
  NSSet *v4;
  id v5;
  id v6;
  uint64_t *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t *v14;
  id v15;
  id v16;
  NSObject *v17;
  unsigned int v18;
  unsigned int v19;
  CLDurianDeviceManager *v20;
  uint64_t v21;
  uint64_t v22;
  NSSet *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  _BYTE v33[10];
  id v34;
  _BYTE v35[128];

  -[CLDurianDeviceManager setSimpleBeacons:](self, "setSimpleBeacons:", -[NSArray arrayByApplyingDifference:](-[CLDurianDeviceManager simpleBeacons](self, "simpleBeacons"), "arrayByApplyingDifference:", a3));
  v20 = self;
  v4 = +[NSSet setWithArray:](NSSet, "setWithArray:", -[CLDurianDeviceManager simpleBeacons](self, "simpleBeacons"));
  v5 = objc_alloc_init((Class)NSMutableSet);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
  v7 = &qword_1022A0000;
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v25;
    v10 = SPBeaconTypeDurian;
    v22 = SPBeaconTypeAccessory;
    v21 = SPBeaconTypeHele;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v11);
        if ((objc_msgSend(objc_msgSend(v12, "type"), "isEqual:", v10) & 1) != 0
          || (objc_msgSend(objc_msgSend(v12, "type"), "isEqual:", v22) & 1) != 0
          || objc_msgSend(objc_msgSend(v12, "type"), "isEqual:", v21))
        {
          objc_msgSend(v5, "addObject:", v12);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BCA48);
          v13 = v7[7];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = v7;
            v15 = objc_msgSend(objc_msgSend(objc_msgSend(v12, "identifier"), "description"), "substringToIndex:", 8);
            v16 = objc_msgSend(v12, "name");
            *(_DWORD *)buf = 68289539;
            v29 = 0;
            v30 = 2082;
            v31 = "";
            v32 = 2113;
            *(_QWORD *)v33 = v15;
            v7 = v14;
            *(_WORD *)&v33[8] = 2114;
            v34 = v16;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian simplebeacon diff\", \"item\":%{private, location:escape_only}@, \"name\":%{public, location:escape_only}@}", buf, 0x26u);
          }
        }
        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      v8 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
    }
    while (v8);
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v17 = v7[7];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(v5, "count");
    v19 = -[NSSet count](obj, "count");
    *(_DWORD *)buf = 68289538;
    v29 = 0;
    v30 = 2082;
    v31 = "";
    v32 = 1026;
    *(_DWORD *)v33 = v18;
    *(_WORD *)&v33[4] = 1026;
    *(_DWORD *)&v33[6] = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian simplebeacon counts\", \"durians\":%{public}d, \"beacons\":%{public}d}", buf, 0x1Eu);
  }
  -[CLDurianDeviceManager didFetchAllDurians:](v20, "didFetchAllDurians:", objc_msgSend(v5, "copy"));

}

- (NSArray)simpleBeacons
{
  return (NSArray *)objc_getProperty(self, a2, 280, 1);
}

- (void)setSimpleBeacons:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (BOOL)ready
{
  id v2;

  v2 = -[CBCentralManager state](self->_centralManager, "state");
  return v2 == (id)5 || v2 == (id)10;
}

- (BOOL)onlyHeleMaintainableDevices
{
  unsigned int v3;

  v3 = -[CLDurianDeviceManager countMaintainableDevices](self, "countMaintainableDevices");
  return v3 == -[CLDurianDeviceManager countHeleMaintainableDevices](self, "countHeleMaintainableDevices");
}

- (unsigned)countHeleMaintainableDevices
{
  id v2;
  id v3;
  id v4;
  unsigned int v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(v2);
      v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v8, "ownership") == (id)1)
        v5 += objc_msgSend(v8, "isHeleAccessory");
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v5;
}

- (void)addScanResultAtDate:(id)a3 address:(id)a4 advertisementData:(id)a5 rssi:(int64_t)a6 maintenanceReason:(int64_t)a7 reserved:(id)a8 reconciledInformation:(id)a9
{
  id v15;
  void *v16;
  id v17;
  unsigned int v18;
  NSObject *v19;
  NSObject *v20;
  NSString *v21;
  unint64_t v22;
  unsigned int v23;
  const __CFString *v24;
  __CFString *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  unsigned int v30;
  unsigned int v31;
  NSObject *v32;
  NSString *v33;
  unsigned int v34;
  int v35;
  id v36;
  id v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  NSString *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  NSNumber *v52;

  v15 = objc_msgSend(a9, "uuid", a3, a4, a5, a6);
  if (v15)
  {
    v16 = v15;
    v17 = -[CLDurianDeviceManager deviceWithUUID:](self, "deviceWithUUID:", v15);
    if (objc_msgSend(v17, "ownership") == (id)1)
    {
      v18 = -[CLDurianDeviceManager isMaintenanceActive](self, "isMaintenanceActive");
      if (a7
        && v18
        && (id)-[CLDurianDeviceManager getMaintReasonForDevice:](self, "getMaintReasonForDevice:", v17) == (id)3)
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
        v19 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289539;
          v39 = 0;
          v40 = 2082;
          v41 = "";
          v42 = 2113;
          v43 = sub_10024882C(a4);
          v44 = 2113;
          v45 = objc_msgSend(objc_msgSend(v16, "description"), "substringToIndex:", 8);
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint reconciling\", \"address\":%{private, location:escape_only}@, \"item\":%{private, location:escape_only}@}", buf, 0x26u);
        }
      }
      else
      {
        -[CLDurianScanCache addScanResultAtDate:address:maintenanceReason:reconciledUUID:](self->_scanCache, "addScanResultAtDate:address:maintenanceReason:reconciledUUID:", a3, a4, a7, v16);
        objc_msgSend(objc_msgSend(a4, "mutableCopy"), "appendData:", a5);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
        v20 = qword_1022A0038;
        v37 = a3;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          v21 = (NSString *)objc_msgSend(objc_msgSend(v16, "description"), "substringToIndex:", 8);
          v22 = objc_msgSend(a9, "matchedIndex");
          v23 = objc_msgSend(a9, "sequence");
          v24 = CFSTR("<Invalid>");
          if (v23 == 2)
            v24 = CFSTR("Secondary");
          if (v23 == 1)
            v25 = CFSTR("Primary");
          else
            v25 = (__CFString *)v24;
          *(_DWORD *)buf = 68289795;
          v39 = 0;
          v40 = 2082;
          v41 = "";
          v42 = 2113;
          v43 = v21;
          v44 = 2049;
          v45 = (id)v22;
          v46 = 2081;
          v47 = -[__CFString UTF8String](v25, "UTF8String");
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian reconciled advertisement\", \"item\":%{private, location:escape_only}@, \"index\":%{private}lu, \"sequence\":%{private, location:escape_only}s}", buf, 0x30u);
        }
        if ((unint64_t)objc_msgSend(a8, "length") < 2)
        {
          v52 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(a9, "matchedIndex"));
          v28 = +[SPCommandKeysCriteria matchPrimaryIndices:](SPCommandKeysCriteria, "matchPrimaryIndices:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
        }
        else
        {
          buf[0] = 0;
          objc_msgSend(a8, "getBytes:range:", buf, 1, 1);
          v26 = objc_msgSend(a9, "sequence");
          v27 = objc_msgSend(a9, "matchedIndex");
          v28 = +[SPCommandKeysCriteria matchSequence:index:hint:](SPCommandKeysCriteria, "matchSequence:index:hint:", v26, v27, buf[0]);
        }
        v29 = v28;
        v36 = objc_msgSend(v17, "lastReconciledCriteria");
        v30 = objc_msgSend(v29, "_cl_isEqual:");
        objc_msgSend(v17, "setLastReconciledCriteria:", v29);
        objc_msgSend(v17, "setLastReconciledAddress:", a4);
        objc_msgSend(v17, "setLastReconciliationTime:", mach_continuous_time());
        if (objc_msgSend(v17, "isAttemptingConnection"))
          v31 = objc_msgSend(v17, "isConnected") ^ 1;
        else
          v31 = 0;
        if (-[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", objc_msgSend(v17, "uuid"))&& a7 <= 0)
        {
          v31 = 0;
        }
        if (((v31 ^ 1 | v30) & 1) == 0)
        {
          if (a7)
            -[CLDurianScanCache addScanResultAtDate:address:maintenanceReason:reconciledUUID:](self->_scanCache, "addScanResultAtDate:address:maintenanceReason:reconciledUUID:", v37, a4, 3, v16);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BCA48);
          v32 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v33 = (NSString *)objc_msgSend(objc_msgSend(v16, "description"), "substringToIndex:", 8);
            v34 = -[CLDurianDeviceManager isMaintenanceActive](self, "isMaintenanceActive");
            *(_DWORD *)buf = 68290307;
            if (v34)
              v35 = 6;
            else
              v35 = 0;
            v39 = 0;
            v40 = 2082;
            v41 = "";
            v42 = 2113;
            v43 = v33;
            v44 = 2114;
            v45 = v36;
            v46 = 2114;
            v47 = v29;
            v48 = 1026;
            v49 = v35;
            v50 = 1026;
            v51 = a7;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection new reconciled criteria\", \"item\":%{private, location:escape_only}@, \"oldCriteria\":%{public, location:escape_only}@, \"newMaterial\":%{public, location:escape_only}@, \"maintdelay\":%{public}d, \"needsmaint\":%{public}d}", buf, 0x3Cu);
          }
          -[CLDurianDeviceManager fetchConnectionTokensForDevice:usingReconciledUUID:andCriteria:](self, "fetchConnectionTokensForDevice:usingReconciledUUID:andCriteria:", v17, objc_msgSend(a9, "uuid"), v29);
        }
        -[CLDurianDeviceManager dispatchProactiveMaintenanceOnDevice:maintenanceReason:](self, "dispatchProactiveMaintenanceOnDevice:maintenanceReason:", v17, a7);
      }
    }
  }
}

- (CLDurianDeviceManager)init
{
  -[CLDurianDeviceManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CLDurianDeviceManager)initWithUniverse:(id)a3
{
  id v4;
  id v5;
  SEL v6;
  SEL v7;
  SEL v8;
  id v9;
  uint64_t v10;
  CLDurianLocationMonitor *v11;
  NSObject *v12;
  NSObject *v13;
  CLDurianMaintenanceUtilities *v14;
  _QWORD v16[5];
  _QWORD handler[5];
  _QWORD v18[5];
  objc_super v19;
  _QWORD v20[3];
  _QWORD v21[3];

  v19.receiver = self;
  v19.super_class = (Class)CLDurianDeviceManager;
  v4 = -[CLDurianDeviceManager init](&v19, "init");
  if (v4)
  {
    *((_QWORD *)v4 + 33) = objc_msgSend(objc_msgSend(a3, "silo"), "queue");
    *((_QWORD *)v4 + 2) = objc_alloc_init((Class)SPBeaconManager);
    *((_QWORD *)v4 + 3) = objc_opt_new(SPOwnerSession);
    v5 = objc_alloc_init((Class)SPOwnerInterface);
    v6 = NSSelectorFromString(CFSTR("persistentConnectionSession"));
    if ((objc_opt_respondsToSelector(v5, v6) & 1) != 0)
    {
      *((_QWORD *)v4 + 4) = objc_msgSend(v5, "performSelector:", v6);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10151AF24;
      v18[3] = &unk_1021BC738;
      v18[4] = v4;
      v7 = NSSelectorFromString(CFSTR("beaconsToMaintainPersistentConnection:"));
      v8 = NSSelectorFromString(CFSTR("startRefreshingPersistentConnectionWithBlock:"));
      objc_msgSend(*((id *)v4 + 4), "performSelector:withObject:", v7, v18);
      objc_msgSend(*((id *)v4 + 4), "performSelector:withObject:", v8, v18);
    }
    *((_QWORD *)v4 + 6) = objc_msgSend(v5, "tagSeparationSession");
    *((_QWORD *)v4 + 8) = 0;
    v9 = objc_alloc((Class)CBCentralManager);
    v10 = *((_QWORD *)v4 + 33);
    v20[0] = CBCentralManagerOptionReceiveIncomingObjectDiscoveryData;
    v20[1] = CBCentralManagerOptionReceiveSystemEvents;
    v21[0] = &__kCFBooleanTrue;
    v21[1] = &__kCFBooleanTrue;
    v20[2] = CBManagerNeedsRestrictedStateOperation;
    v21[2] = &__kCFBooleanTrue;
    *((_QWORD *)v4 + 26) = objc_msgSend(v9, "initWithDelegate:queue:options:", v4, v10, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 3));
    *((_QWORD *)v4 + 1) = 0;
    *((_QWORD *)v4 + 27) = objc_alloc_init((Class)NSMutableDictionary);
    *((_QWORD *)v4 + 28) = objc_alloc_init((Class)NSMutableDictionary);
    *((_QWORD *)v4 + 32) = objc_alloc_init((Class)NSMutableDictionary);
    *((_QWORD *)v4 + 31) = objc_alloc_init((Class)NSMutableDictionary);
    v11 = -[CLDurianLocationMonitor initWithUniverse:]([CLDurianLocationMonitor alloc], "initWithUniverse:", a3);
    *((_QWORD *)v4 + 7) = v11;
    *((_BYTE *)v4 + 135) = 0;
    -[CLDurianLocationMonitor setDelegate:](v11, "setDelegate:", v4);
    *((_QWORD *)v4 + 21) = objc_alloc_init((Class)NSMutableDictionary);
    *((_QWORD *)v4 + 35) = objc_alloc_init((Class)NSArray);
    *((_QWORD *)v4 + 34) = objc_alloc_init((Class)NSMutableSet);
    *((_QWORD *)v4 + 20) = objc_alloc_init((Class)NSMutableSet);
    *((_QWORD *)v4 + 22) = objc_alloc_init((Class)NSMutableSet);
    *((_QWORD *)v4 + 23) = objc_alloc_init((Class)NSMutableDictionary);
    *((_QWORD *)v4 + 9) = objc_alloc_init(CLDurianMaintenanceMetrics);
    *((_QWORD *)v4 + 30) = -[CLDurianMetricManager initWithQueue:]([CLDurianMetricManager alloc], "initWithQueue:", *((_QWORD *)v4 + 33));
    *((_QWORD *)v4 + 24) = objc_alloc_init(CLDurianScanCache);
    *((_QWORD *)v4 + 11) = -[CLDurianZoneMonitorWrapper initWithTimeZone:zoneBoundary:]([CLDurianZoneMonitorWrapper alloc], "initWithTimeZone:zoneBoundary:", CFSTR("Asia/Seoul"), 32.4738662, 38.7975409, 123.760521, 132.275637);
    if (qword_10230F908 != -1)
      dispatch_once(&qword_10230F908, &stru_1021BCA28);
    *((_BYTE *)v4 + 96) = byte_10230F900;
    *((_BYTE *)v4 + 137) = +[CLDurianSettings maintenanceOnWildObservationEnabled](CLDurianSettings, "maintenanceOnWildObservationEnabled");
    objc_msgSend(*((id *)v4 + 9), "resetWithTime:", 0.0);
    v12 = *((_QWORD *)v4 + 33);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10151AF88;
    handler[3] = &unk_10213F4C0;
    handler[4] = v4;
    notify_register_dispatch(GEOCountryConfigurationCountryCodeChangedDarwinNotification, (int *)v4 + 25, v12, handler);
    v13 = *((_QWORD *)v4 + 33);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10151AFBC;
    v16[3] = &unk_10213F4C0;
    v16[4] = v4;
    notify_register_dispatch("com.apple.locationd.durian.restart-connection", (int *)v4 + 28, v13, v16);
    *((_WORD *)v4 + 66) = 0;
    objc_msgSend(v4, "hydrateBeacons");
    v14 = -[CLDurianMaintenanceUtilities initWithQueue:]([CLDurianMaintenanceUtilities alloc], "initWithQueue:", *((_QWORD *)v4 + 33));
    *((_QWORD *)v4 + 25) = v14;
    -[CLDurianMaintenanceUtilities setIntervalOverride:](v14, "setIntervalOverride:", (double)+[CLDurianSettings maintenanceIntervalOverride](CLDurianSettings, "maintenanceIntervalOverride"));
    objc_msgSend(*((id *)v4 + 25), "setDelegate:", v4);
    objc_msgSend(v4, "setLoiType:", CFSTR("Unknown"));
  }
  return (CLDurianDeviceManager *)v4;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_countryCodeNotificationToken);
  notify_cancel(self->_beaconsChangedNotificationToken);
  notify_cancel(self->_unknownBeaconsSetChangedNotificationToken);
  -[SPBeaconManager stopUpdatingSimpleBeaconsWithCompletion:](self->_beaconManager, "stopUpdatingSimpleBeaconsWithCompletion:", &stru_1021BC758);

  -[CLDurianLocationMonitor stopLeechingLocation](self->_locationMonitor, "stopLeechingLocation");
  v3.receiver = self;
  v3.super_class = (Class)CLDurianDeviceManager;
  -[CLDurianDeviceManager dealloc](&v3, "dealloc");
}

- (double)getDeltaSecondsFromMachTime:(unint64_t)a3
{
  return TMConvertTicksToSeconds((char *)-[CLDurianDeviceManager getMachContinuousTime](self, "getMachContinuousTime") - a3);
}

- (CLLocation)lastLocation
{
  return self->_lastLocation;
}

- (void)resetDeviceConnections:(id)a3
{
  NSObject *v5;
  id v6;
  unsigned int v7;
  _BOOL4 initialBeaconsFetched;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  id v14;
  id v15;
  __int128 v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  _BOOL8 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t buf;
  __int16 v38;
  const char *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  unsigned int v45;
  __int16 v46;
  _BOOL4 v47;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[NSMutableDictionary count](self->_devices, "count");
    v7 = -[NSMutableDictionary count](self->_connectionTimeoutBlocks, "count");
    initialBeaconsFetched = self->_initialBeaconsFetched;
    buf = 68290051;
    v38 = 2082;
    v39 = "";
    v40 = 2114;
    v41 = a3;
    v42 = 2049;
    v43 = v6;
    v44 = 1026;
    v45 = v7;
    v46 = 1026;
    v47 = initialBeaconsFetched;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian resetDeviceConnections\", \"reason\":%{public, location:escape_only}@, \"count\":%{private}lld, \"timeoutblocks\":%{public}d, \"fetched\":%{public}hhd}", (uint8_t *)&buf, 0x32u);
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = -[NSMutableDictionary allValues](self->_connectionTimeoutBlocks, "allValues");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v9);
        dispatch_block_cancel(*(dispatch_block_t *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v11);
  }
  -[NSMutableDictionary removeAllObjects](self->_connectionTimeoutBlocks, "removeAllObjects");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator");
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v28;
    v19 = SPTagSeparationStateNone;
    *(_QWORD *)&v16 = 68289539;
    v26 = v16;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v14);
        v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v20);
        v22 = objc_msgSend(v21, "connectionState", v26);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
        v23 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          v24 = objc_msgSend(objc_msgSend(objc_msgSend(v21, "uuid"), "description"), "substringToIndex:", 8);
          buf = v26;
          v38 = 2082;
          v39 = "";
          v40 = 2113;
          v41 = v24;
          v42 = 2049;
          v43 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian resetDeviceConnections\", \"item\":%{private, location:escape_only}@, \"connstate\":%{private}lld}", (uint8_t *)&buf, 0x26u);
        }
        v25 = objc_msgSend(v21, "isConnected")
           && objc_msgSend(v21, "isLeashable")
           && +[CLDurianSettings lastKnownLocationEnabled](CLDurianSettings, "lastKnownLocationEnabled");
        -[CLDurianDeviceManager sendObservationForDevice:type:includeLocation:](self, "sendObservationForDevice:type:includeLocation:", v21, 3, v25);
        -[CLDurianDeviceManager sendSeparationStateForDevice:state:includeLocation:](self, "sendSeparationStateForDevice:state:includeLocation:", v21, v19, 0);
        -[CLDurianDeviceManager cancelConnectionEvaluationForDevice:](self, "cancelConnectionEvaluationForDevice:", v21);
        -[CLDurianDeviceDelegate onConnectionStateChangeForDeviceWithUUID:fromState:toState:](self->_deviceDelegate, "onConnectionStateChangeForDeviceWithUUID:fromState:toState:", objc_msgSend(v21, "uuid"), 2, 0);
        v20 = (char *)v20 + 1;
      }
      while (v17 != v20);
      v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v17);
  }
  -[NSMutableSet removeAllObjects](self->_devicesBeingMaintained, "removeAllObjects");
}

- (void)onGeoCountryConfigurationChanged:(id)a3
{
  self->_isRestrictedCountryCode = objc_msgSend(a3, "isEqualToString:", CFSTR("KR"));
}

- (unsigned)countLeashableDevices
{
  id v2;
  id v3;
  id v4;
  unsigned int v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v10;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v2);
      v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "isLeashable");
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  }
  while (v4);
  return v5;
}

- (BOOL)checkIfAllDevicesLastRecentlyDisconnected
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v6), "secondsSinceLastDisconnection");
        if (v7 > 21600.0)
          return 0;
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  return 1;
}

- (BOOL)isMaintenanceActive
{
  return -[NSMutableSet count](self->_devicesBeingMaintained, "count") != 0;
}

- (BOOL)isNonHeleMaintenanceActive
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7);
        if (-[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", objc_msgSend(v8, "uuid"))&& !objc_msgSend(v8, "isHeleAccessory"))
        {
          LOBYTE(v4) = 1;
          return (char)v4;
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v5 = v4;
      if (v4)
        continue;
      break;
    }
  }
  return (char)v4;
}

- (BOOL)isMaintenancePowerAsserted
{
  return -[CLDurianMaintenanceUtilities isPowerAssertionAsserted](self->_maintUtils, "isPowerAssertionAsserted");
}

- (void)hydrateBeacons
{
  NSObject *v3;
  _BOOL4 initialBeaconsFetched;
  SPBeaconManager *beaconManager;
  NSObject *queue;
  _QWORD handler[5];
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  _BOOL4 v15;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    initialBeaconsFetched = self->_initialBeaconsFetched;
    *(_DWORD *)buf = 68289282;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 1026;
    v15 = initialBeaconsFetched;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian simplebeacon hydrate\", \"fetched\":%{public}hhd}", buf, 0x18u);
  }
  if (!self->_initialBeaconsFetched)
  {
    beaconManager = self->_beaconManager;
    v8[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10020FCF4;
    v9[3] = &unk_1021BC780;
    v9[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10151BA2C;
    v8[3] = &unk_1021BC7A8;
    -[SPBeaconManager startUpdatingSimpleBeaconsWithContext:collectionDifference:completion:](beaconManager, "startUpdatingSimpleBeaconsWithContext:collectionDifference:completion:", +[SPSimpleBeaconContext deviceManagerContext](SPSimpleBeaconContext, "deviceManagerContext"), v9, v8);
  }
  CFStringGetCString(SPUnknownBeaconsSetChangedNotification, (char *)buf, 256, 0x8000100u);
  queue = self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10151BD34;
  handler[3] = &unk_10213F4C0;
  handler[4] = self;
  notify_register_dispatch((const char *)buf, &self->_unknownBeaconsSetChangedNotificationToken, queue, handler);
  if (!self->_initialUnknownBeaconsFetched)
    -[CLDurianDeviceManager fetchAllUnknownBeaconsWithCompletion:](self, "fetchAllUnknownBeaconsWithCompletion:", &stru_1021BC7E8);
}

- (void)fetchAllDuriansWithCompletion:(id)a3
{
  NSObject *v5;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #simplebeacon skipfetchall\"}", buf, 0x12u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10151BE6C;
  block[3] = &unk_102162918;
  block[4] = a3;
  dispatch_async(queue, block);
}

- (void)fetchAllUnknownBeaconsWithCompletion:(id)a3
{
  NSObject *v5;
  SPOwnerSession *ownerSession;
  _QWORD v7[6];
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetching unknown beacons\"}", buf, 0x12u);
  }
  ownerSession = self->_ownerSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10151BFA0;
  v7[3] = &unk_102159D70;
  v7[4] = self;
  v7[5] = a3;
  -[SPOwnerSession unknownBeaconsForUUIDs:completion:](ownerSession, "unknownBeaconsForUUIDs:completion:", &__NSArray0__struct, v7);
}

- (void)fetchAllBeaconsWithCompletion:(id)a3
{
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[4];
  int v8;
  __int16 v9;
  const char *v10;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetching all beacons\"}", buf, 0x12u);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10151C14C;
  v6[3] = &unk_102159978;
  v6[4] = self;
  v6[5] = a3;
  -[CLDurianDeviceManager fetchAllDuriansWithCompletion:](self, "fetchAllDuriansWithCompletion:", v6);
}

- (void)didFetchUnknownBeacons:(id)a3
{
  id v4;
  __int128 v5;
  uint64_t *v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  SEL v11;
  NSObject *v12;
  id v13;
  id v14;
  const char *v15;
  const char *v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  unsigned int v21;
  const char *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  id v30;
  id v31;
  __int128 v32;
  id v33;
  uint64_t v34;
  void *j;
  void *v36;
  NSObject *v37;
  const char *v38;
  const char *v39;
  unsigned int v40;
  const char *v41;
  __int128 v42;
  __int128 v43;
  id v44;
  const char *v45;
  CLDurianDeviceManager *v46;
  uint64_t v47;
  id v48;
  id obja;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  int v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  const char *v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];

  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v59, v79, 16);
  v6 = &qword_1022A0000;
  v46 = self;
  if (v4)
  {
    v7 = v4;
    v47 = *(_QWORD *)v60;
    *(_QWORD *)&v5 = 68289795;
    v42 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v60 != v47)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)v8);
        v10 = +[CLDurianSettings forceEnablePosh](CLDurianSettings, "forceEnablePosh", v42);
        v11 = NSSelectorFromString(CFSTR("isPosh"));
        if ((objc_opt_respondsToSelector(v9, v11) & 1) != 0)
          v10 = objc_msgSend(v9, "performSelector:", v11) != 0;
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
        v12 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          v13 = objc_msgSend(objc_msgSend(objc_msgSend(v9, "identifier"), "description"), "substringToIndex:", 8);
          v14 = objc_msgSend(v9, "identifier");
          v15 = (const char *)objc_msgSend(v9, "name");
          v16 = (const char *)objc_msgSend(v9, "type");
          *(_DWORD *)buf = 68290307;
          v64 = 0;
          v65 = 2082;
          v66 = "";
          v67 = 2113;
          v68 = v13;
          v6 = &qword_1022A0000;
          v69 = 2113;
          v70 = v14;
          self = v46;
          v71 = 2114;
          v72 = v15;
          v73 = 2114;
          v74 = v16;
          v75 = 1025;
          LODWORD(v76) = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetchall unknown beacon update creating durian device for\", \"item\":%{private, location:escape_only}@, \"full\":%{private, location:escape_only}@, \"name\":%{public, location:escape_only}@, \"type\":%{public, location:escape_only}@, \"posh\":%{private}hhd}", buf, 0x40u);
        }
        v17 = -[CLDurianDeviceManager deviceWithUUID:beaconType:isPosh:](self, "deviceWithUUID:beaconType:isPosh:", objc_msgSend(v9, "identifier"), objc_msgSend(v9, "type"), v10);
        if (objc_msgSend(v17, "pendingDisconnect"))
        {
          -[CLDurianDeviceManager cancelDisconnectionOnMissingBeaconWithUUID:](self, "cancelDisconnectionOnMissingBeaconWithUUID:", objc_msgSend(v17, "uuid"));
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BCA48);
          v18 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v19 = objc_msgSend(objc_msgSend(objc_msgSend(v17, "uuid"), "description"), "substringToIndex:", 8);
            v20 = objc_msgSend(objc_msgSend(v17, "beacon"), "name");
            v21 = objc_msgSend(v17, "isConnected");
            *(_DWORD *)buf = v42;
            v22 = "NO";
            if (v21)
              v22 = "YES";
            v64 = 0;
            v65 = 2082;
            v66 = "";
            v67 = 2113;
            v68 = v19;
            v69 = 2114;
            v70 = v20;
            v6 = &qword_1022A0000;
            v71 = 2082;
            v72 = v22;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetchall, missing non-owned beacon has been found, cancel disconnection backstop\", \"item\":%{private, location:escape_only}@, \"name\":%{public, location:escape_only}@, \"isConnected\":%{public, location:escape_only}s}", buf, 0x30u);
          }
        }
        objc_msgSend(v17, "setUnownedBeacon:", v9);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
        v23 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
        {
          v24 = objc_msgSend(objc_msgSend(objc_msgSend(v17, "uuid"), "description"), "substringToIndex:", 8);
          *(_DWORD *)buf = 68289283;
          v64 = 0;
          v65 = 2082;
          v66 = "";
          v67 = 2113;
          v68 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian got unknown beacon\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
        }
        v8 = (char *)v8 + 1;
      }
      while (v7 != v8);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v59, v79, 16);
    }
    while (v7);
  }
  v44 = objc_alloc_init((Class)NSMutableSet);
  v25 = objc_alloc_init((Class)NSMutableSet);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v26 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v55, v78, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(_QWORD *)v56 != v28)
          objc_enumerationMutation(a3);
        objc_msgSend(v25, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i), "identifier"));
      }
      v27 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v55, v78, 16);
    }
    while (v27);
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v30 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator");
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v77, 16);
  if (v31)
  {
    v33 = v31;
    v34 = *(_QWORD *)v52;
    *(_QWORD *)&v32 = 68290307;
    v43 = v32;
    do
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(_QWORD *)v52 != v34)
          objc_enumerationMutation(v30);
        v36 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)j);
        if ((objc_msgSend(v36, "isTAAISDevice", v43) & 1) == 0
          && objc_msgSend(v36, "ownership") == (id)2
          && (objc_msgSend(v25, "containsObject:", objc_msgSend(v36, "uuid")) & 1) == 0)
        {
          if (v6[6] != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BCA48);
          v37 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            obja = objc_msgSend(objc_msgSend(objc_msgSend(v36, "uuid"), "description"), "substringToIndex:", 8);
            v48 = objc_msgSend(objc_msgSend(v36, "beacon"), "name");
            if (objc_msgSend(v36, "isConnected"))
              v38 = "YES";
            else
              v38 = "NO";
            v45 = v38;
            if (objc_msgSend(v36, "isTaskQueueEmpty"))
              v39 = "YES";
            else
              v39 = "NO";
            v40 = objc_msgSend(v36, "pendingDisconnect");
            *(_DWORD *)buf = v43;
            if (v40)
              v41 = "YES";
            else
              v41 = "NO";
            v64 = 0;
            v65 = 2082;
            v66 = "";
            v67 = 2113;
            v68 = obja;
            v69 = 2114;
            v70 = v48;
            v6 = &qword_1022A0000;
            v71 = 2082;
            v72 = v45;
            v73 = 2082;
            v74 = v39;
            v75 = 2082;
            v76 = v41;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian removing unowned device\", \"item\":%{private, location:escape_only}@, \"name\":%{public, location:escape_only}@, \"isConnected\":%{public, location:escape_only}s, \"isTaskQueueEmpty\":%{public, location:escape_only}s, \"pendingDisconnect\":%{public, location:escape_only}s}", buf, 0x44u);
          }
          if (objc_msgSend(v36, "isConnected"))
          {
            objc_msgSend(v36, "setPendingDisconnect:", 1);
            if (objc_msgSend(v36, "isTaskQueueEmpty"))
              -[CLDurianDeviceManager scheduleDisconnectionOnMissingBeaconWithUUID:](v46, "scheduleDisconnectionOnMissingBeaconWithUUID:", objc_msgSend(v36, "uuid"));
          }
          else
          {
            objc_msgSend(v44, "addObject:", objc_msgSend(v36, "uuid"));
          }
        }
      }
      v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v77, 16);
    }
    while (v33);
  }
  -[NSMutableDictionary removeObjectsForKeys:](v46->_devices, "removeObjectsForKeys:", objc_msgSend(v44, "allObjects"));

  v46->_initialUnknownBeaconsFetched = 1;
}

- (void)didUpdatePersistentConnectionList:(id)a3
{
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  unsigned int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  unsigned int v26;
  _BYTE v27[128];

  -[NSMutableSet removeAllObjects](self->_leashableUUIDs, "removeAllObjects");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v16;
    *(_QWORD *)&v6 = 68289539;
    v14 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9);
        -[NSMutableSet addObject:](self->_leashableUUIDs, "addObject:", objc_msgSend(v10, "identifier", v14));
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
        v11 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          v12 = objc_msgSend(objc_msgSend(objc_msgSend(v10, "identifier"), "description"), "substringToIndex:", 8);
          v13 = -[NSMutableSet count](self->_leashableUUIDs, "count");
          *(_DWORD *)buf = v14;
          v20 = 0;
          v21 = 2082;
          v22 = "";
          v23 = 2113;
          v24 = v12;
          v25 = 1026;
          v26 = v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #leash eligible\", \"item\":%{private, location:escape_only}@, \"n\":%{public}d}", buf, 0x22u);
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
    }
    while (v7);
  }
  -[CLDurianDeviceManager checkforLeashEligibilityChanges](self, "checkforLeashEligibilityChanges");
  if (-[CLDurianMaintenanceUtilities isWatch](self->_maintUtils, "isWatch"))
    -[CLDurianDeviceManager checkMaintainableDevices:](self, "checkMaintainableDevices:", 3);
}

- (void)removeTAUnknownBeaconBackedDevice:(id)a3
{
  id v5;
  void *v6;
  _BOOL8 v7;
  SEL v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  int v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  _BOOL4 v25;

  if (a3)
  {
    v5 = -[CLDurianDeviceManager deviceWithUUID:](self, "deviceWithUUID:");
    v6 = v5;
    if (v5 && objc_msgSend(v5, "ownership") != (id)2)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      v12 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
      {
        v16 = 68289539;
        v17 = 0;
        v18 = 2082;
        v19 = "";
        v20 = 2113;
        v21 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
        v22 = 2049;
        v23 = objc_msgSend(v6, "ownership");
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian remove device for owner device\", \"item\":%{private, location:escape_only}@, \"ownership\":%{private}lu}", (uint8_t *)&v16, 0x26u);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      }
      v13 = qword_1022A0038;
      if (os_signpost_enabled((os_log_t)qword_1022A0038))
      {
        v14 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
        v15 = objc_msgSend(v6, "ownership");
        v16 = 68289539;
        v17 = 0;
        v18 = 2082;
        v19 = "";
        v20 = 2113;
        v21 = v14;
        v22 = 2049;
        v23 = v15;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian remove device for owner device", "{\"msg%{public}.0s\":\"#durian remove device for owner device\", \"item\":%{private, location:escape_only}@, \"ownership\":%{private}lu}", (uint8_t *)&v16, 0x26u);
      }
    }
    else
    {
      v7 = +[CLDurianSettings forceEnablePosh](CLDurianSettings, "forceEnablePosh");
      v8 = NSSelectorFromString(CFSTR("isPoshAccessory"));
      if ((objc_opt_respondsToSelector(objc_msgSend(v6, "taUnknownBeacon"), v8) & 1) != 0)
        v7 = objc_msgSend(objc_msgSend(v6, "taUnknownBeacon"), "performSelector:", v8) != 0;
      if (objc_msgSend(v6, "isTAAISDevice") && objc_msgSend(v6, "unownedBeacon"))
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
        v9 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 68289795;
          v17 = 0;
          v18 = 2082;
          v19 = "";
          v20 = 2113;
          v21 = objc_msgSend(objc_msgSend(v6, "unownedBeacon"), "identifier");
          v22 = 2114;
          v23 = objc_msgSend(objc_msgSend(v6, "unownedBeacon"), "type");
          v24 = 1025;
          v25 = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian remove durian device backed by TA unknown beacon\", \"ta-device\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@, \"posh\":%{private}hhd}", (uint8_t *)&v16, 0x2Cu);
        }
        objc_msgSend(-[CLDurianDeviceManager deviceWithUUID:beaconType:isPosh:](self, "deviceWithUUID:beaconType:isPosh:", objc_msgSend(objc_msgSend(v6, "unownedBeacon"), "identifier"), objc_msgSend(objc_msgSend(v6, "unownedBeacon"), "type"), v7), "setTaUnknownBeacon:", 0);
      }
      -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", a3);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      v10 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
        v16 = 68289283;
        v17 = 0;
        v18 = 2082;
        v19 = "";
        v20 = 2113;
        v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian remove device\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v16, 0x1Cu);
      }
    }
  }
}

- (BOOL)deviceBackedWithBeacon:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char isKindOfClass;
  uint64_t v12;

  v4 = objc_opt_class(CLAirtagDevice, a2);
  if ((objc_opt_isKindOfClass(a3, v4) & 1) != 0
    || (v6 = objc_opt_class(CLHawkeyeDevice, v5), (objc_opt_isKindOfClass(a3, v6) & 1) != 0)
    || (v8 = objc_opt_class(CLHeleDevice, v7), (objc_opt_isKindOfClass(a3, v8) & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    v12 = objc_opt_class(CLPoshDevice, v9);
    isKindOfClass = objc_opt_isKindOfClass(a3, v12);
  }
  return isKindOfClass & 1;
}

- (id)deviceWithUUID:(id)a3
{
  CLDurianDevice *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  int v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;

  if (!a3)
    return 0;
  v5 = (CLDurianDevice *)-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:");
  if (!v5)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v6 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
    {
      v10 = 68289283;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2113;
      v15 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian creating device for unknown beacon type\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v10, 0x1Cu);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    }
    v7 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v8 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
      v10 = 68289283;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2113;
      v15 = v8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian creating device for unknown beacon type", "{\"msg%{public}.0s\":\"#durian creating device for unknown beacon type\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v10, 0x1Cu);
    }
    v5 = -[CLDurianDevice initWithUUID:queue:centralManager:]([CLDurianDevice alloc], "initWithUUID:queue:centralManager:", a3, self->_queue, self->_centralManager);
    -[CLDurianDevice setDelegate:](v5, "setDelegate:", self->_deviceDelegate);
    -[NSMutableDictionary setObject:forKey:](self->_devices, "setObject:forKey:", v5, a3);
  }
  return v5;
}

- (id)createPoshDeviceWithUUID:(id)a3
{
  NSObject *v5;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289283;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2113;
    v11 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh creating durian device for \", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)v7, 0x1Cu);
  }
  return -[CLDurianDevice initWithUUID:queue:centralManager:]([CLPoshDevice alloc], "initWithUUID:queue:centralManager:", a3, self->_queue, self->_centralManager);
}

- (id)createNonPoshDeviceWithUUID:(id)a3 beaconType:(id)a4
{
  NSObject *v7;
  __objc2_class **v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;

  if (objc_msgSend(a4, "isEqual:", SPBeaconTypeDurian))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 68289283;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2113;
      v19 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating durian device for \", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v14, 0x1Cu);
    }
    v8 = &off_102125D10;
  }
  else if (objc_msgSend(a4, "isEqual:", SPBeaconTypeHele))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 68289283;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2113;
      v19 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating durian device for \", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v14, 0x1Cu);
    }
    v8 = &off_102125E78;
  }
  else if (objc_msgSend(a4, "isEqual:", SPBeaconTypeAccessory))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v10 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 68289283;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2113;
      v19 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating durian device for \", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v14, 0x1Cu);
    }
    v8 = &off_102125E68;
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v11 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
    {
      v14 = 68289282;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2114;
      v19 = a4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian creating a device for unknown beacon type \", \"type\":%{public, location:escape_only}@}", (uint8_t *)&v14, 0x1Cu);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    }
    v12 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v14 = 68289282;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2114;
      v19 = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian creating a device for unknown beacon type ", "{\"msg%{public}.0s\":\"#durian creating a device for unknown beacon type \", \"type\":%{public, location:escape_only}@}", (uint8_t *)&v14, 0x1Cu);
    }
    v8 = &off_102125DD0;
  }
  return objc_msgSend(objc_alloc(*v8), "initWithUUID:queue:centralManager:", a3, self->_queue, self->_centralManager);
}

- (id)deviceWithUUID:(id)a3 beaconType:(id)a4 isPosh:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  unsigned int v10;
  unsigned int v11;
  NSObject *v12;
  BOOL v13;
  id v14;
  _DWORD v16[2];
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;

  if (!a3)
    return 0;
  v5 = a5;
  v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:");
  v10 = -[CLDurianDeviceManager deviceBackedWithBeacon:](self, "deviceBackedWithBeacon:", v9);
  v11 = v10;
  if (v9 && (v10 & 1) == 0)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", a3);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v12 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v16[0] = 68289283;
      v16[1] = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian removing device which was not backed with a valid beacon\", \"item\":%{private, location:escape_only}@}", (uint8_t *)v16, 0x1Cu);
    }
  }
  if (v9)
    v13 = v11 == 1;
  else
    v13 = 0;
  if (!v13)
  {
    if (v5 && _os_feature_enabled_impl("CoreLocation", "StandardUT"))
      v14 = -[CLDurianDeviceManager createPoshDeviceWithUUID:](self, "createPoshDeviceWithUUID:", a3);
    else
      v14 = -[CLDurianDeviceManager createNonPoshDeviceWithUUID:beaconType:](self, "createNonPoshDeviceWithUUID:beaconType:", a3, a4);
    v9 = v14;
    objc_msgSend(v14, "setDelegate:", self->_deviceDelegate);
    -[NSMutableDictionary setObject:forKey:](self->_devices, "setObject:forKey:", v9, a3);
  }
  return v9;
}

- (void)deviceWithUUID:(id)a3 withCompletion:(id)a4
{
  id v6;
  _QWORD v7[7];

  v6 = -[CLDurianDeviceManager deviceWithUUID:](self, "deviceWithUUID:", a3);
  if (objc_msgSend(v6, "beacon") || objc_msgSend(v6, "unownedBeacon"))
  {
    (*((void (**)(id, id))a4 + 2))(a4, v6);
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10151D9C8;
    v7[3] = &unk_10213E388;
    v7[5] = v6;
    v7[6] = a4;
    v7[4] = self;
    -[CLDurianDeviceManager fetchAllBeaconsWithCompletion:](self, "fetchAllBeaconsWithCompletion:", v7);
  }
}

- (void)deviceWithUUID:(id)a3 beaconType:(id)a4 isPosh:(BOOL)a5 withCompletion:(id)a6
{
  id v8;
  _QWORD v9[7];

  v8 = -[CLDurianDeviceManager deviceWithUUID:beaconType:isPosh:](self, "deviceWithUUID:beaconType:isPosh:", a3, a4, a5);
  if (objc_msgSend(v8, "beacon") || objc_msgSend(v8, "unownedBeacon"))
  {
    (*((void (**)(id, id))a6 + 2))(a6, v8);
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10151DAE4;
    v9[3] = &unk_10213E388;
    v9[5] = v8;
    v9[6] = a6;
    v9[4] = self;
    -[CLDurianDeviceManager fetchAllBeaconsWithCompletion:](self, "fetchAllBeaconsWithCompletion:", v9);
  }
}

- (id)deviceWithActivePeripheral:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend(objc_msgSend(objc_msgSend(v9, "activePeripheral"), "identifier"), "isEqual:", objc_msgSend(a3, "identifier")) & 1) != 0)return v9;
    if (v6 == (id)++v8)
    {
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)recheckDevicesAfterDiscovery
{
  CLDurianDeviceManager *v2;
  NSObject *v3;
  unsigned int v4;
  __int128 v5;
  id v6;
  id v7;
  CLDurianDeviceManager *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  char *v20;
  id v21;
  id v22;
  unint64_t v23;
  _BOOL4 v24;
  void *v25;
  unsigned int v26;
  BOOL v27;
  CLDurianMaintenanceMetrics *maintMetrics;
  NSObject *v29;
  id v30;
  unsigned int v31;
  unsigned int v32;
  char *v33;
  NSObject *v34;
  char *v35;
  unsigned __int8 v36;
  char v37;
  __int128 v38;
  id v39;
  id obj;
  uint64_t v41;
  id v42;
  CLDurianDeviceManager *v43;
  unint64_t v44;
  char *v45;
  char *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  int v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  char *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  _BYTE v65[10];
  __int16 v66;
  unsigned int v67;
  __int16 v68;
  unsigned int v69;
  _BYTE v70[128];
  _BYTE v71[128];

  v2 = self;
  self->_maintDiscoveryPending = 0;
  -[CLDurianDeviceManager pruneScanCacheToQuarterHour](self, "pruneScanCacheToQuarterHour");
  v39 = objc_alloc_init((Class)NSMutableArray);
  obj = -[NSMutableSet copy](v2->_devicesBeingMaintained, "copy");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[NSMutableSet count](v2->_devicesBeingMaintained, "count");
    *(_DWORD *)buf = 68289282;
    v57 = 0;
    v58 = 2082;
    v59 = "";
    v60 = 1026;
    LODWORD(v61) = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint recheck discovery\", \"devices\":%{public}d}", buf, 0x18u);
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
  if (v42)
  {
    v41 = *(_QWORD *)v53;
    *(_QWORD *)&v5 = 68289283;
    v38 = v5;
    v43 = v2;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v53 != v41)
          objc_enumerationMutation(obj);
        v45 = (char *)v6;
        v7 = -[NSMutableDictionary objectForKeyedSubscript:](v2->_devices, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v6), v38);
        v46 = -[CLDurianDeviceManager getMaintReasonForDevice:](v2, "getMaintReasonForDevice:", v7);
        v44 = (unint64_t)objc_msgSend(v7, "maintenanceOnlyCondition");
        v8 = v2;
        v9 = v7;
        v10 = -[CLDurianDeviceManager getAddressForDevice:](v8, "getAddressForDevice:", v7);
        v11 = objc_msgSend(v7, "activeConnectionAttempt");
        v12 = v11;
        v47 = v7;
        if (v10)
        {
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v13 = objc_msgSend(v11, "possiblePeripherals");
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v70, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v49;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v49 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v17);
                if ((objc_msgSend(v12, "doesPeripheral:haveAddress:", v18, v10) & 1) == 0)
                {
                  if (qword_1022A0030 != -1)
                    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
                  v19 = qword_1022A0038;
                  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
                  {
                    v20 = (char *)objc_msgSend(objc_msgSend(objc_msgSend(v9, "uuid"), "description"), "substringToIndex:", 8);
                    v21 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v47, "activeConnectionAttempt"), "identifier"), "description"), "substringToIndex:", 8);
                    v22 = objc_msgSend(objc_msgSend(objc_msgSend(v18, "identifier"), "description"), "substringToIndex:", 8);
                    *(_DWORD *)buf = 68289795;
                    v57 = 0;
                    v58 = 2082;
                    v59 = "";
                    v60 = 2113;
                    v61 = v20;
                    v9 = v47;
                    v62 = 2113;
                    v63 = v21;
                    v64 = 2113;
                    *(_QWORD *)v65 = v22;
                    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt periph nodiscovery\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@}", buf, 0x30u);
                  }
                  objc_msgSend(v9, "removePossiblePeripheral:", v18);
                }
                v17 = (char *)v17 + 1;
              }
              while (v15 != v17);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v70, 16);
            }
            while (v15);
          }
        }
        v23 = v44 & 0xFFFFFFFFFFFFFFFELL;
        v24 = (v44 & 0xFFFFFFFFFFFFFFFELL) == 2;
        v25 = v9;
        v2 = v43;
        v26 = -[CLDurianDeviceManager shouldAttemptForcedHeleMaintenanceOnDevice:](v43, "shouldAttemptForcedHeleMaintenanceOnDevice:", v25);
        if (v26)
          v27 = v44 == 3;
        else
          v27 = 1;
        if (!v27)
        {
          objc_msgSend(v47, "setMaintenanceOnlyCondition:", 3);
          if (!-[CLDurianDeviceManager isNonHeleMaintenanceActive](v43, "isNonHeleMaintenanceActive"))
          {
            -[CLDurianMaintenanceUtilities releaseMaintenancePowerAssertion:](v43->_maintUtils, "releaseMaintenancePowerAssertion:", CFSTR("complete"));
            maintMetrics = v43->_maintMetrics;
            -[CLDurianMaintenanceUtilities getMaintenanceAssertionDuration](v43->_maintUtils, "getMaintenanceAssertionDuration");
            -[CLDurianMaintenanceMetrics setAssertionDuration:](maintMetrics, "setAssertionDuration:");
          }
        }
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
        v29 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          v30 = objc_msgSend(objc_msgSend(objc_msgSend(v47, "uuid"), "description"), "substringToIndex:", 8);
          v31 = objc_msgSend(objc_msgSend(v12, "possiblePeripherals"), "count");
          v32 = objc_msgSend(v47, "isAttemptingConnection");
          *(_DWORD *)buf = 68290563;
          v57 = 0;
          v58 = 2082;
          v59 = "";
          v60 = 2050;
          v61 = v46;
          v62 = 2113;
          v63 = v30;
          v64 = 1026;
          *(_DWORD *)v65 = v31;
          v2 = v43;
          *(_WORD *)&v65[4] = 1026;
          *(_DWORD *)&v65[6] = v23 == 2;
          v66 = 1026;
          v67 = v26;
          v68 = 1026;
          v69 = v32;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint decision\", \"reason\":%{public}ld, \"item\":%{private, location:escape_only}@, \"possible\":%{public}d, \"forced\":%{public}d, \"heleforced\":%{public}d, \"attempting\":%{public}d}", buf, 0x3Eu);
        }
        if (v46 == (char *)-1)
        {
          v33 = v45;
          if (((v26 | +[CLDurianSettings forceMaintenanceConnectionsOverride](CLDurianSettings, "forceMaintenanceConnectionsOverride")) & 1) == 0)
          {
            v36 = objc_msgSend(v47, "isAttemptingConnection");
            if (!v10 || (v36 & 1) == 0)
            {
              -[CLDurianDeviceManager finishMaintainingDevice:withReason:andCategory:](v2, "finishMaintainingDevice:withReason:andCategory:", v47, CFSTR("nodiscovery"), 0);
              -[CLDurianDeviceManager cancelConnectionAttemptToDevice:](v2, "cancelConnectionAttemptToDevice:", v47);
              objc_msgSend(v47, "removeAllPossiblePeripherals");
            }
            goto LABEL_54;
          }
        }
        else if (v23 == 2)
        {
          v33 = v45;
        }
        else
        {
          v33 = v45;
          if (!v46)
          {
            if (-[CLDurianDeviceManager shouldConnectUsingLeashToDevice:](v2, "shouldConnectUsingLeashToDevice:", v47))
            {
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BCA48);
              v34 = qword_1022A0038;
              if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
              {
                v35 = (char *)objc_msgSend(objc_msgSend(objc_msgSend(v47, "uuid"), "description"), "substringToIndex:", 8);
                *(_DWORD *)buf = v38;
                v57 = 0;
                v58 = 2082;
                v59 = "";
                v60 = 2113;
                v61 = v35;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint capped forcing leash\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
              }
LABEL_53:
              objc_msgSend(v39, "addObject:", v47);
              goto LABEL_54;
            }
            -[CLDurianDeviceManager finishMaintainingDevice:withReason:andCategory:](v2, "finishMaintainingDevice:withReason:andCategory:", v47, CFSTR("maintained:advscan"), 2);
            -[CLDurianDeviceManager cancelConnectionAttemptToDevice:](v2, "cancelConnectionAttemptToDevice:", v47);
            objc_msgSend(v47, "removeAllPossiblePeripherals");
            v24 = 0;
          }
        }
        if ((unint64_t)(v46 - 1) < 2)
          v37 = 1;
        else
          v37 = v26;
        if ((v37 & 1) != 0 || v24)
          goto LABEL_53;
LABEL_54:
        v6 = v33 + 1;
      }
      while (v6 != v42);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
    }
    while (v42);
  }

  -[CLDurianDeviceManager connectToDevices:](v2, "connectToDevices:", -[CLDurianDeviceManager sortDevicesBasedOnConnectionlikelihood:](v2, "sortDevicesBasedOnConnectionlikelihood:", v39));
}

- (id)sortDevicesBasedOnConnectionlikelihood:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &stru_1021BC850);
  return a3;
}

- (void)connectToDevices:(id)a3
{
  id v4;
  id v5;
  void *i;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  uint64_t v14;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v16 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(a3);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v8 = -[CLDurianDeviceManager getAddressForDevice:](self, "getAddressForDevice:", v7);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v9 = objc_msgSend(objc_msgSend(v7, "activeConnectionAttempt"), "possiblePeripherals");
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(_QWORD *)v18 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j);
              if (v8
                && !objc_msgSend(objc_msgSend(v7, "activeConnectionAttempt"), "doesPeripheral:haveAddress:", v14, v8))
              {
                objc_msgSend(objc_msgSend(v7, "activeConnectionAttempt"), "removePossiblePeripheral:", v14);
              }
              else
              {
                -[CLDurianDeviceManager connectToDevice:withPeripheral:forcedTimeout:](self, "connectToDevice:withPeripheral:forcedTimeout:", v7, v14, 0);
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v11);
        }
      }
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }
}

- (void)dispatchRecheckDevicesAfterDiscovery
{
  dispatch_time_t v3;
  NSObject *queue;
  _QWORD block[5];

  v3 = dispatch_time(0, 6000000000);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10151E688;
  block[3] = &unk_10212BB58;
  block[4] = self;
  dispatch_after(v3, queue, block);
}

- (BOOL)shouldAttemptForcedHeleMaintenanceOnDevice:(id)a3
{
  unsigned int v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  _BOOL4 v15;

  v5 = objc_msgSend(a3, "isHeleAccessory");
  if (v5)
  {
    if (-[CLDurianDeviceManager onlyHeleMaintainableDevices](self, "onlyHeleMaintainableDevices"))
      v6 = 1;
    else
      v6 = 4 * ((-[CLDurianDeviceManager getQuarterHour](self, "getQuarterHour") & 3) == 0);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 68289539;
      v9[1] = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2113;
      v13 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      v14 = 1026;
      v15 = v6 != 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint hele\", \"item\":%{private, location:escape_only}@, \"force\":%{public}hhd}", (uint8_t *)v9, 0x22u);
    }
    LOBYTE(v5) = v6 != 0;
  }
  return v5;
}

- (int64_t)getMaintReasonForDevice:(id)a3
{
  return -[CLDurianScanCache getMaintenanceReasonForUuid:](self->_scanCache, "getMaintenanceReasonForUuid:", objc_msgSend(a3, "uuid"));
}

- (id)getAddressForDevice:(id)a3
{
  return -[CLDurianScanCache getAddressForUuid:](self->_scanCache, "getAddressForUuid:", objc_msgSend(a3, "uuid"));
}

- (BOOL)isDiscoveryRequiredForDevice:(id)a3 onCondition:(unint64_t)a4 withPeripheral:(id)a5
{
  id v9;
  int64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  int v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  _BYTE v28[10];
  _BYTE v29[10];
  int v30;

  v9 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "connectionMaterialsForPeripheral:", a5), "firstObject"), "address");
  if (v9)
  {
    if ((-[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", objc_msgSend(a3, "uuid")) & 1) != 0)
    {
      v10 = -[CLDurianDeviceManager getMaintReasonForDevice:](self, "getMaintReasonForDevice:", a3);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      v11 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 68290051;
        v23 = 2082;
        v22 = 0;
        v24 = "";
        v25 = 2113;
        v26 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
        v27 = 2113;
        *(_QWORD *)v28 = sub_10024882C(v9);
        *(_WORD *)&v28[8] = 2113;
        *(_QWORD *)v29 = objc_msgSend(a5, "identifier");
        *(_WORD *)&v29[8] = 1026;
        v30 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint check\", \"item\":%{private, location:escape_only}@, \"address\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"reason\":%{public}d}", (uint8_t *)&v21, 0x36u);
      }
      v12 = 1;
      if (a4 != 1
        || v10
        || -[CLDurianDeviceManager shouldConnectUsingLeashToDevice:](self, "shouldConnectUsingLeashToDevice:", a3))
      {
        goto LABEL_21;
      }
      -[CLDurianDeviceManager finishMaintainingDevice:withReason:andCategory:](self, "finishMaintainingDevice:withReason:andCategory:", a3, CFSTR("maintained:cache"), 2);
LABEL_20:
      v12 = 0;
LABEL_21:
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      goto LABEL_23;
    }
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v17 = qword_1022A0038;
    if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      v12 = 0;
      goto LABEL_23;
    }
    v21 = 68289283;
    v22 = 0;
    v23 = 2082;
    v24 = "";
    v25 = 2113;
    v26 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v14 = "{\"msg%{public}.0s\":\"#durian #maint offlist\", \"item\":%{private, location:escape_only}@}";
    v15 = v17;
    v16 = OS_LOG_TYPE_DEBUG;
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, (uint8_t *)&v21, 0x1Cu);
    goto LABEL_20;
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v13 = qword_1022A0038;
  v12 = 0;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 68289283;
    v22 = 0;
    v23 = 2082;
    v24 = "";
    v25 = 2113;
    v26 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v14 = "{\"msg%{public}.0s\":\"#durian no discovery address\", \"item\":%{private, location:escape_only}@}";
    v15 = v13;
    v16 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_19;
  }
LABEL_23:
  v18 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v21 = 68290051;
    v23 = 2082;
    v22 = 0;
    v24 = "";
    v25 = 2113;
    v26 = v19;
    v27 = 1026;
    *(_DWORD *)v28 = v12;
    *(_WORD *)&v28[4] = 1026;
    *(_DWORD *)&v28[6] = a4;
    *(_WORD *)v29 = 2113;
    *(_QWORD *)&v29[2] = v9;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint needs discovery\", \"item\":%{private, location:escape_only}@, \"required\":%{public}d, \"condition\":%{public}d, \"possibleAddress\":%{private, location:escape_only}@}", (uint8_t *)&v21, 0x32u);
  }
  return v12;
}

- (void)attemptConnectionToDevice:(id)a3
{
  -[CLDurianDeviceManager attemptConnectToDevice:onCondition:](self, "attemptConnectToDevice:onCondition:", a3, 0);
}

- (void)attemptMaintenanceOnDevice:(id)a3 onCondition:(unint64_t)a4
{
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  int v14;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289539;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2113;
    v12 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v13 = 1026;
    v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint attempt\", \"item\":%{private, location:escape_only}@, \"condition\":%{public}d}", (uint8_t *)v8, 0x22u);
  }
  -[CLDurianDeviceManager attemptConnectToDevice:onCondition:](self, "attemptConnectToDevice:onCondition:", a3, a4);
  if (-[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", objc_msgSend(a3, "uuid")))objc_msgSend(a3, "setMaintenanceOnlyCondition:", a4);
}

- (BOOL)attemptConnectToDevice:(id)a3 onCondition:(unint64_t)a4
{
  __CFString *v7;
  NSObject *v8;
  id v9;
  const __CFString *v10;
  CLDurianDeviceManager *v11;
  id v12;
  uint64_t v13;
  NSObject *v15;
  id v16;
  CLDurianConnectionAttempt *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  _BYTE v31[18];
  __int16 v32;
  int v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;

  if (!-[CLDurianDeviceManager ready](self, "ready"))
  {
    -[CLDurianDeviceDelegate didFailToConnectDevice:withError:](self->_deviceDelegate, "didFailToConnectDevice:withError:", a3, 19);
    objc_msgSend(a3, "failAllTasksWithError:", 19);
    v7 = CFSTR("nomanager");
    goto LABEL_9;
  }
  if ((objc_msgSend(a3, "connectionAllowed") & 1) == 0)
  {
    -[CLDurianDeviceManager sendObservationForDevice:type:includeLocation:](self, "sendObservationForDevice:type:includeLocation:", a3, 3, 0);
    -[CLDurianDeviceDelegate didFailToConnectDevice:withError:](self->_deviceDelegate, "didFailToConnectDevice:withError:", a3, 17);
    objc_msgSend(a3, "failAllTasksWithError:", 17);
    v7 = CFSTR("notallowed");
    goto LABEL_9;
  }
  if (objc_msgSend(a3, "isConnected"))
  {
    -[CLDurianDeviceManager sendObservationForDevice:type:includeLocation:](self, "sendObservationForDevice:type:includeLocation:", a3, 2, 1);
    v7 = CFSTR("connected");
LABEL_9:
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289795;
      v25 = 0;
      v26 = 2082;
      v27 = "";
      v28 = 2113;
      v29 = v9;
      v30 = 2114;
      *(_QWORD *)v31 = v7;
      *(_WORD *)&v31[8] = 1026;
      *(_DWORD *)&v31[10] = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt skipped\", \"item\":%{private, location:escape_only}@, \"reason\":%{public, location:escape_only}@, \"condition\":%{public}d}", buf, 0x2Cu);
    }
    if (a4)
    {
      if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("connected")))
      {
        if (objc_msgSend(a3, "isLeashSlotInUse"))
          v10 = CFSTR("maintained:leashed");
        else
          v10 = CFSTR("maintained:connected");
        v11 = self;
        v12 = a3;
        v13 = 2;
      }
      else
      {
        v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("skip:%@"), v7);
        v11 = self;
        v12 = a3;
        v13 = 0;
      }
      -[CLDurianDeviceManager finishMaintainingDevice:withReason:andCategory:](v11, "finishMaintainingDevice:withReason:andCategory:", v12, v10, v13);
    }
    return 0;
  }
  if (-[NSMutableDictionary objectForKey:](self->_keyFetchTimeoutBlocks, "objectForKey:", objc_msgSend(a3, "uuid")))
  {
    v7 = CFSTR("fetchingkeys");
    goto LABEL_9;
  }
  if (objc_msgSend(a3, "isAttemptingConnection"))
  {
    if (!a4
      && -[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", objc_msgSend(a3, "uuid")))
    {
      v7 = CFSTR("wasmaint");
      -[CLDurianDeviceManager finishMaintainingDevice:withReason:andCategory:](self, "finishMaintainingDevice:withReason:andCategory:", a3, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("skip:%@"), CFSTR("wasmaint")), 0);
      objc_msgSend(a3, "setMaintenanceOnlyCondition:", 0);
      -[CLDurianDeviceManager restartConnectionAttemptToDevice:](self, "restartConnectionAttemptToDevice:", a3);
      goto LABEL_9;
    }
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v15 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289795;
      v25 = 0;
      v26 = 2082;
      v27 = "";
      v28 = 2113;
      v29 = objc_msgSend(a3, "uuid");
      v30 = 1025;
      *(_DWORD *)v31 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "possiblePeripherals"), "count");
      *(_WORD *)&v31[4] = 2113;
      *(_QWORD *)&v31[6] = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "possiblePeripherals"), "firstObject"), "identifier");
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt prior peripherals\", \"deviceId\":%{private, location:escape_only}@, \"periphs\":%{private}d, \"head\":%{private, location:escape_only}@}", buf, 0x2Cu);
    }
    if (!+[CLDurianSettings forceMaintenanceConnectionsOverride](CLDurianSettings, "forceMaintenanceConnectionsOverride"))
    {
      v7 = CFSTR("inprogress");
      goto LABEL_9;
    }
  }
  else if (objc_msgSend(a3, "reconnecting"))
  {
    v7 = CFSTR("reconnecting");
    goto LABEL_9;
  }
  v16 = objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "identifier");
  v17 = objc_alloc_init(CLDurianConnectionAttempt);
  objc_msgSend(a3, "setActiveConnectionAttempt:", v17);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v18 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v20 = objc_msgSend(-[NSUUID description](-[CLDurianConnectionAttempt identifier](v17, "identifier"), "description"), "substringToIndex:", 8);
    v21 = objc_msgSend(objc_msgSend(a3, "beacon"), "name");
    v22 = objc_msgSend(a3, "getConnectionReason");
    v23 = objc_msgSend(objc_msgSend(v16, "description"), "substringToIndex:", 8);
    *(_DWORD *)buf = 68290563;
    v25 = 0;
    v26 = 2082;
    v27 = "";
    v28 = 2113;
    v29 = v19;
    v30 = 2113;
    *(_QWORD *)v31 = v20;
    *(_WORD *)&v31[8] = 2113;
    *(_QWORD *)&v31[10] = v21;
    v32 = 1026;
    v33 = a4;
    v34 = 2114;
    v35 = v22;
    v36 = 2113;
    v37 = v23;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt new\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"name\":%{private, location:escape_only}@, \"condition\":%{public}d, \"reason\":%{public, location:escape_only}@, \"oldId\":%{private, location:escape_only}@}", buf, 0x4Au);
  }
  -[CLDurianDeviceManager fetchConnectionTokensForDevice:onCondition:](self, "fetchConnectionTokensForDevice:onCondition:", a3, a4);
  return 1;
}

- (BOOL)isMaintTimerOn
{
  return -[CLDurianMaintenanceUtilities isTimerOn](self->_maintUtils, "isTimerOn");
}

- (void)startMaintenanceTimer
{
  -[CLDurianMaintenanceUtilities startTimer:](self->_maintUtils, "startTimer:", -[CLDurianDeviceManager onlyHeleMaintainableDevices](self, "onlyHeleMaintainableDevices"));
}

- (void)stopMaintenanceTimer
{
  -[CLDurianMaintenanceUtilities stopTimer](self->_maintUtils, "stopTimer");
}

- (void)maintainAllDevices:(unint64_t)a3
{
  CLDurianDeviceManager *v3;
  NSObject *v4;
  NSMutableSet *devicesBeingMaintained;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  id v13;
  id v14;
  const __CFString *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  int v23;
  id v24;
  unsigned int v25;
  unsigned int v26;
  NSObject *v27;
  double v28;
  int v29;
  int coexImpactState;
  NSString *loiType;
  unsigned int v32;
  const __CFString *v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  double v42;
  double v43;
  NSObject *v44;
  id v45;
  uint64_t v46;
  double v47;
  unsigned __int8 v48;
  double v49;
  uint64_t v50;
  uint64_t *v51;
  unint64_t v52;
  NSObject *v53;
  unsigned int v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  void *j;
  void *v60;
  unsigned __int8 v61;
  unsigned int v62;
  NSObject *v63;
  id v64;
  unsigned int v65;
  unsigned int v66;
  id v67;
  const __CFString *v68;
  uint64_t v69;
  void *v70;
  char v72;
  id *p_isa;
  int v74;
  char v75;
  int v76;
  id obj;
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  uint8_t v97[128];
  uint8_t buf[4];
  int v99;
  __int16 v100;
  const char *v101;
  __int16 v102;
  _BYTE v103[10];
  _BYTE v104[28];
  __int16 v105;
  unsigned int v106;
  __int16 v107;
  unsigned int v108;
  _BYTE v109[128];
  _BYTE v110[128];

  v3 = self;
  if (!-[CLDurianDeviceManager isMaintenanceActive](self, "isMaintenanceActive"))
    goto LABEL_16;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    devicesBeingMaintained = v3->_devicesBeingMaintained;
    *(_DWORD *)buf = 68289283;
    v99 = 0;
    v100 = 2082;
    v101 = "";
    v102 = 2113;
    *(_QWORD *)v103 = devicesBeingMaintained;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint active\", \"list\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v6 = -[NSMutableDictionary objectEnumerator](v3->_devices, "objectEnumerator");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v92, v110, 16);
  if (v7)
  {
    v8 = v7;
    v76 = 0;
    v9 = *(_QWORD *)v93;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v93 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)i);
        if (-[NSMutableSet containsObject:](v3->_devicesBeingMaintained, "containsObject:", objc_msgSend(v11, "uuid")))
        {
          -[CLDurianDeviceManager finishMaintainingDevice:withReason:andCategory:](v3, "finishMaintainingDevice:withReason:andCategory:", v11, CFSTR("nextmaint"), 1);
          -[CLDurianDeviceManager cancelConnectionAttemptToDevice:](v3, "cancelConnectionAttemptToDevice:", v11);
          objc_msgSend(v11, "removeAllPossiblePeripherals");
          ++v76;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v92, v110, 16);
    }
    while (v8);
  }
  else
  {
LABEL_16:
    v76 = 0;
  }
  v12 = -[NSMutableDictionary count](v3->_devices, "count");
  v13 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", &stru_1021D8FB8);
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  obj = -[NSMutableDictionary objectEnumerator](v3->_devices, "objectEnumerator");
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v109, 16);
  v15 = CFSTR("na");
  p_isa = (id *)&v3->super.isa;
  if (!v14)
  {
    v17 = 0;
    goto LABEL_42;
  }
  v16 = v14;
  v70 = v13;
  LODWORD(v17) = 0;
  v74 = 0;
  v75 = 0;
  v72 = 0;
  v18 = *(id *)v89;
  do
  {
    v19 = 0;
    do
    {
      if (*(id *)v89 != v18)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)v19);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      v21 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v79 = objc_msgSend(objc_msgSend(objc_msgSend(v20, "uuid"), "description"), "substringToIndex:", 8);
        v22 = objc_msgSend(v20, "uuid");
        v78 = objc_msgSend(objc_msgSend(v20, "beacon"), "name");
        v23 = (int)v12;
        v12 = v18;
        v24 = objc_msgSend(objc_msgSend(objc_msgSend(v20, "groupUuid"), "description"), "substringToIndex:", 8);
        v25 = objc_msgSend(v20, "isHeleAccessory");
        v26 = objc_msgSend(v20, "ownership");
        *(_DWORD *)buf = 68290563;
        v99 = 0;
        v100 = 2082;
        v101 = "";
        v102 = 2113;
        *(_QWORD *)v103 = v79;
        *(_WORD *)&v103[8] = 2113;
        *(_QWORD *)v104 = v22;
        *(_WORD *)&v104[8] = 2114;
        *(_QWORD *)&v104[10] = v78;
        *(_WORD *)&v104[18] = 2113;
        *(_QWORD *)&v104[20] = v24;
        v18 = v12;
        LODWORD(v12) = v23;
        v105 = 1026;
        v106 = v25;
        v107 = 1026;
        v108 = v26;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian maint list\", \"item\":%{private, location:escape_only}@, \"full\":%{private, location:escape_only}@, \"name\":%{public, location:escape_only}@, \"group\":%{private, location:escape_only}@, \"hele\":%{public}hhd, \"ownership\":%{public}d}", buf, 0x46u);
      }
      if ((objc_msgSend(v20, "isAirTag", v70) & 1) != 0)
      {
        v75 = 1;
      }
      else if ((objc_msgSend(v20, "isHeleAccessory") & 1) != 0)
      {
        v72 = 1;
      }
      else
      {
        v74 |= objc_msgSend(v20, "isHawkeyeAccessory");
      }
      v17 = v17 + objc_msgSend(v20, "isLeashable");
      v12 = (id)(v12 - (objc_msgSend(v20, "ownership") != (id)1));
      v19 = (char *)v19 + 1;
    }
    while (v16 != v19);
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v109, 16);
  }
  while (v16);
  v13 = v70;
  if ((v75 & 1) != 0)
    objc_msgSend(v70, "appendString:", CFSTR("D"));
  if ((v74 & 1) != 0)
  {
    objc_msgSend(v70, "appendString:", CFSTR("H"));
    v3 = (CLDurianDeviceManager *)p_isa;
    if ((v72 & 1) == 0)
      goto LABEL_43;
    v15 = CFSTR("L");
    goto LABEL_42;
  }
  v15 = CFSTR("na");
  if ((v72 & 1) != 0)
    v15 = CFSTR("L");
  v3 = (CLDurianDeviceManager *)p_isa;
  if (v72 & 1 | ((v75 & 1) == 0))
LABEL_42:
    objc_msgSend(v13, "appendString:", v15);
LABEL_43:
  -[CLDurianMaintenanceMetrics startNewMaintEventWithCount:leashable:deviceTypes:coex:loiType:](v3->_maintMetrics, "startNewMaintEventWithCount:leashable:deviceTypes:coex:loiType:", v12, v17, objc_msgSend(v13, "copy"), v3->_coexImpactState, -[CLDurianDeviceManager loiType](v3, "loiType"));
  v3->_maintDutyCycleUpgrade = 0;
  v3->_maintDiscoveryPending = 0;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v27 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    -[CLDurianMaintenanceMetrics timeBetweenTriggers](v3->_maintMetrics, "timeBetweenTriggers");
    v29 = (int)v28;
    coexImpactState = v3->_coexImpactState;
    loiType = v3->_loiType;
    v32 = -[NSMutableDictionary count](v3->_devices, "count");
    *(_DWORD *)buf = 68290818;
    v99 = 0;
    v100 = 2082;
    v101 = "";
    v102 = 1026;
    *(_DWORD *)v103 = a3;
    *(_WORD *)&v103[4] = 1026;
    *(_DWORD *)&v103[6] = (_DWORD)v12;
    *(_WORD *)v104 = 1026;
    *(_DWORD *)&v104[2] = v29;
    *(_WORD *)&v104[6] = 1026;
    *(_DWORD *)&v104[8] = coexImpactState;
    *(_WORD *)&v104[12] = 2114;
    *(_QWORD *)&v104[14] = loiType;
    *(_WORD *)&v104[22] = 1026;
    *(_DWORD *)&v104[24] = v76;
    v105 = 1026;
    v106 = v32;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint all\", \"trigger\":%{public}d, \"count\":%{public}d, \"tbm\":%{public}d, \"coex\":%{public}d, \"loiType\":%{public, location:escape_only}@, \"leftover\":%{public}d, \"totalDevices\":%{public}d}", buf, 0x40u);
  }
  if ((_DWORD)v12)
  {
    v33 = 0;
  }
  else
  {
    -[CLDurianDeviceManager stopMaintenanceTimer](v3, "stopMaintenanceTimer");
    v33 = CFSTR("devices");
  }
  if (-[NSString isEqualToString:](+[CLDurianSettings testMode](CLDurianSettings, "testMode"), "isEqualToString:", CFSTR("NoMaintenance")))
  {
    v33 = CFSTR("defaultsdisable");
  }
  if (v33)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v34 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      v99 = 0;
      v100 = 2082;
      v101 = "";
      v102 = 2114;
      *(_QWORD *)v103 = v33;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint done\", \"skip all\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    -[CLDurianMaintenanceMetrics setAssertionDuration:](v3->_maintMetrics, "setAssertionDuration:", 0.0);
    -[CLDurianDeviceManager submitCompletedMaintenanceMetrics:](v3, "submitCompletedMaintenanceMetrics:", v3->_maintMetrics);
    -[CLDurianMaintenanceMetrics resetWithTime:](v3->_maintMetrics, "resetWithTime:", CFAbsoluteTimeGetCurrent());
  }
  else
  {
    -[CLDurianMaintenanceUtilities takeMaintenancePowerAssertion](v3->_maintUtils, "takeMaintenancePowerAssertion");
    -[CLDurianDeviceManager pruneScanCacheToQuarterHour](v3, "pruneScanCacheToQuarterHour");
    -[NSMutableSet removeAllObjects](v3->_maintenanceEvictionCandidates, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](v3->_maintenanceEvictionMap, "removeAllObjects");
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v35 = -[NSMutableDictionary objectEnumerator](v3->_devices, "objectEnumerator");
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v85;
      do
      {
        v39 = 0;
        do
        {
          if (*(_QWORD *)v85 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)v39);
          if (objc_msgSend(v40, "ownership") == (id)1)
          {
            if (objc_msgSend(v40, "groupUuid") && objc_msgSend(v40, "lastGroupMaintenance"))
            {
              v41 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CLDurianMaintenanceMetrics groupMaintDeltas](v3->_maintMetrics, "groupMaintDeltas"), "objectForKeyedSubscript:", objc_msgSend(v40, "groupUuid")), "intValue");
              -[CLDurianDeviceManager getDeltaSecondsFromMachTime:](v3, "getDeltaSecondsFromMachTime:", objc_msgSend(v40, "lastGroupMaintenance"));
              v43 = v42;
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BCA48);
              v44 = qword_1022A0038;
              if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
              {
                v45 = objc_msgSend(objc_msgSend(objc_msgSend(v40, "uuid"), "description"), "substringToIndex:", 8);
                *(_DWORD *)buf = 68289795;
                v99 = 0;
                v100 = 2082;
                v101 = "";
                v102 = 2113;
                *(_QWORD *)v103 = v45;
                *(_WORD *)&v103[8] = 1026;
                *(_DWORD *)v104 = (int)v43;
                *(_WORD *)&v104[4] = 1026;
                *(_DWORD *)&v104[6] = v41;
                _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint groupdeltas\", \"item\":%{private, location:escape_only}@, \"delta\":%{public}d, \"dict\":%{public}d}", buf, 0x28u);
              }
              v3 = (CLDurianDeviceManager *)p_isa;
              if (!v41 || v41 > (int)v43)
                objc_msgSend(p_isa[9], "setGroupMaintDelta:forUUID:", (int)v43, objc_msgSend(v40, "groupUuid"));
            }
            if (objc_msgSend(v40, "lastReconciliationTime"))
            {
              v46 = mach_continuous_time();
              v47 = TMConvertTicksToSeconds(v46 - (_QWORD)objc_msgSend(v40, "lastReconciliationTime"));
            }
            else
            {
              v47 = -1.0;
            }
            objc_msgSend(v40, "setLastAdvertisementDelta:", (unint64_t)v47);
            v48 = objc_msgSend(v40, "isClassicallyConnected");
            v49 = 0.0;
            if ((v48 & 1) == 0)
            {
              if (objc_msgSend(v40, "lastGroupClassicDisconnectionTime", 0.0))
              {
                v50 = mach_continuous_time();
                v49 = TMConvertTicksToSeconds(v50 - (_QWORD)objc_msgSend(v40, "lastGroupClassicDisconnectionTime"))
                    / 60.0;
              }
              else
              {
                v49 = -1.0;
              }
            }
            objc_msgSend(v40, "setLastGroupClassicDisconnectionDelta:", v49);
            -[NSMutableSet addObject:](v3->_devicesBeingMaintained, "addObject:", objc_msgSend(v40, "uuid"));
            if (objc_msgSend(v40, "isLeashSlotInUse"))
              -[NSMutableSet addObject:](v3->_maintenanceEvictionCandidates, "addObject:", objc_msgSend(v40, "uuid"));
          }
          v39 = (char *)v39 + 1;
        }
        while (v37 != v39);
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
      }
      while (v37);
    }
    v51 = &qword_1022A0000;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v52 = a3;
    v53 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v54 = -[NSMutableSet count](v3->_maintenanceEvictionCandidates, "count");
      *(_DWORD *)buf = 68289282;
      v99 = 0;
      v100 = 2082;
      v101 = "";
      v102 = 1026;
      *(_DWORD *)v103 = v54;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint capped\", \"candidates\":%{public}d}", buf, 0x18u);
    }
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v55 = -[NSMutableDictionary objectEnumerator](v3->_devices, "objectEnumerator");
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v80, v96, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v81;
      do
      {
        for (j = 0; j != v57; j = (char *)j + 1)
        {
          if (*(_QWORD *)v81 != v58)
            objc_enumerationMutation(v55);
          v60 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)j);
          if (-[NSMutableSet containsObject:](v3->_devicesBeingMaintained, "containsObject:", objc_msgSend(v60, "uuid")))
          {
            objc_msgSend(v60, "setConnectionReason:", CFSTR("Maintenance:Timer"));
            v61 = -[CLDurianDeviceManager isSameMaintQuarterHourForDevice:](v3, "isSameMaintQuarterHourForDevice:", v60);
            v62 = 1;
            if (v52 && (v61 & 1) == 0)
              v62 = +[CLDurianSettings forceMaintenanceConnectionsOverride](CLDurianSettings, "forceMaintenanceConnectionsOverride");
            if (v51[6] != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BCA48);
            v63 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v64 = objc_msgSend(objc_msgSend(objc_msgSend(v60, "uuid"), "description"), "substringToIndex:", 8);
              v65 = objc_msgSend(v60, "quarterHourDisconnect");
              v66 = +[CLDurianSettings forceMaintenanceConnectionsOverride](CLDurianSettings, "forceMaintenanceConnectionsOverride");
              *(_DWORD *)buf = 68290051;
              v99 = 0;
              v100 = 2082;
              v101 = "";
              v102 = 2113;
              *(_QWORD *)v103 = v64;
              *(_WORD *)&v103[8] = 1026;
              *(_DWORD *)v104 = v62;
              *(_WORD *)&v104[4] = 1026;
              *(_DWORD *)&v104[6] = v65;
              v52 = a3;
              *(_WORD *)&v104[10] = 1026;
              *(_DWORD *)&v104[12] = v66;
              _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint force check\", \"item\":%{private, location:escape_only}@, \"force\":%{public}d, \"quarterdis\":%{public}d, \"override\":%{public}d}", buf, 0x2Eu);
            }
            objc_msgSend(v60, "setQuarterHourDisconnect:", 0xFFFFFFFFLL);
            if (v62)
            {
              v67 = p_isa[9];
              if (v52)
              {
                if (objc_msgSend(v60, "quarterHourDisconnect"))
                  v68 = CFSTR("quarterhour");
                else
                  v68 = CFSTR("override");
              }
              else
              {
                v68 = CFSTR("setup");
              }
              v51 = &qword_1022A0000;
              objc_msgSend(v67, "setForceReason:", v68);
              v69 = 2;
            }
            else
            {
              v69 = 1;
              v51 = &qword_1022A0000;
            }
            v3 = (CLDurianDeviceManager *)p_isa;
            objc_msgSend(p_isa, "attemptMaintenanceOnDevice:onCondition:", v60, v69);
          }
        }
        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v80, v96, 16);
      }
      while (v57);
    }
    if (!-[CLDurianDeviceManager isMaintenanceActive](v3, "isMaintenanceActive"))
      -[CLDurianMaintenanceUtilities releaseMaintenancePowerAssertion:](v3->_maintUtils, "releaseMaintenancePowerAssertion:", CFSTR("none"));
  }
}

- (void)finishMaintainingDevice:(id)a3 withReason:(id)a4 andCategory:(unint64_t)a5
{
  double Current;
  double v10;
  double v11;
  NSObject *v12;
  id v13;
  unsigned int v14;
  id v15;
  CLDurianMaintenanceMetrics *maintMetrics;
  CLDurianMaintenanceMetrics *v17;
  double v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  int v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  int v32;

  if (-[CLDurianDeviceManager isMaintenanceActive](self, "isMaintenanceActive"))
  {
    if (-[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", objc_msgSend(a3, "uuid")))
    {
      -[NSMutableSet removeObject:](self->_devicesBeingMaintained, "removeObject:", objc_msgSend(a3, "uuid"));
      Current = CFAbsoluteTimeGetCurrent();
      -[CLDurianMaintenanceMetrics referenceTime](self->_maintMetrics, "referenceTime");
      if (qword_1022A0030 != -1)
      {
        v18 = v10;
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
        v10 = v18;
      }
      v11 = Current - v10;
      v12 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
        v14 = -[NSMutableSet count](self->_devicesBeingMaintained, "count");
        *(_DWORD *)buf = 68290307;
        v20 = 0;
        v21 = 2082;
        v22 = "";
        v23 = 2113;
        v24 = v13;
        v25 = 2114;
        v26 = a4;
        v27 = 1026;
        v28 = a5;
        v29 = 1026;
        v30 = v14;
        v31 = 1026;
        v32 = (int)v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint done\", \"item\":%{private, location:escape_only}@, \"reason\":%{public, location:escape_only}@, \"category\":%{public}d, \"left\":%{public}d, \"duration\":%{public}d}", buf, 0x38u);
      }
      v15 = objc_msgSend(a4, "componentsSeparatedByString:", CFSTR(":"));
      -[CLDurianMetricManager submitMaintenanceMetrics:forDevice:withReason:andCategory:andDuration:leashable:](self->_metricManager, "submitMaintenanceMetrics:forDevice:withReason:andCategory:andDuration:leashable:", self->_maintMetrics, a3, a4, a5, objc_msgSend(a3, "leashState") != 0, v11);
      -[CLDurianMaintenanceMetrics accumulateMaintainedReasonCountWithReason:andCategory:](self->_maintMetrics, "accumulateMaintainedReasonCountWithReason:andCategory:", objc_msgSend(v15, "firstObject"), a5);
      if (!objc_msgSend(a3, "activePeripheral") && objc_msgSend(a3, "activeConnectionAttempt"))
        objc_msgSend(a3, "setMaintenanceOnlyCondition:", 0);
      objc_msgSend(a3, "resetHeleMaintMetrics");
    }
    if (!-[CLDurianDeviceManager isNonHeleMaintenanceActive](self, "isNonHeleMaintenanceActive"))
    {
      -[CLDurianMaintenanceUtilities releaseMaintenancePowerAssertion:](self->_maintUtils, "releaseMaintenancePowerAssertion:", CFSTR("complete"));
      maintMetrics = self->_maintMetrics;
      -[CLDurianMaintenanceUtilities getMaintenanceAssertionDuration](self->_maintUtils, "getMaintenanceAssertionDuration");
      -[CLDurianMaintenanceMetrics setAssertionDuration:](maintMetrics, "setAssertionDuration:");
    }
    if (!-[CLDurianDeviceManager isMaintenanceActive](self, "isMaintenanceActive"))
    {
      -[CLDurianScanCache clearData](self->_scanCache, "clearData");
      -[CLDurianDeviceManager submitCompletedMaintenanceMetrics:](self, "submitCompletedMaintenanceMetrics:", self->_maintMetrics);
      v17 = self->_maintMetrics;
      -[CLDurianMaintenanceMetrics referenceTime](v17, "referenceTime");
      -[CLDurianMaintenanceMetrics resetWithTime:](v17, "resetWithTime:");
      self->_maintDutyCycleUpgrade = 0;
    }
  }
}

- (void)pruneScanCacheToQuarterHour
{
  -[CLDurianScanCache pruneAggregatedResults](self->_scanCache, "pruneAggregatedResults");
}

- (BOOL)isSameMaintQuarterHourForDevice:(id)a3
{
  unsigned int v4;

  v4 = -[CLDurianDeviceManager getQuarterHour](self, "getQuarterHour");
  return v4 == objc_msgSend(a3, "quarterHourDisconnect");
}

- (void)submitCompletedMaintenanceMetrics:(id)a3
{
  -[CLDurianMetricManager submitMaintenanceMetrics:](self->_metricManager, "submitMaintenanceMetrics:", a3);
}

- (void)scheduleConnectionEvaluationForDevice:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  int v15;

  -[CLDurianDeviceManager cancelConnectionEvaluationForDevice:](self, "cancelConnectionEvaluationForDevice:");
  if (objc_msgSend(a3, "maintenanceOnlyCondition"))
    v5 = 0;
  else
    v5 = 30;
  if (objc_msgSend(a3, "isTAAISDevice"))
    v5 = 0;
  if (objc_msgSend(a3, "firmwareUpdateMode"))
    v5 = 60;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289795;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2113;
    v11 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v12 = 2113;
    v13 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "activePeripheral"), "identifier"), "description"), "substringToIndex:", 8);
    v14 = 1026;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection scheduling connection evaluation\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"timeout\":%{public}d}", (uint8_t *)v7, 0x2Cu);
  }
  -[CLDurianDeviceManager dispatchConnectionEvaluationOnDevice:withConnectionEvaluationTimeout:](self, "dispatchConnectionEvaluationOnDevice:withConnectionEvaluationTimeout:", a3, v5);
}

- (void)dispatchConnectionEvaluationOnDevice:(id)a3 withConnectionEvaluationTimeout:(int64_t)a4
{
  dispatch_time_t v6;
  dispatch_block_t v7;
  _QWORD v8[6];

  v6 = dispatch_time(0, 1000000000 * a4);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_101520570;
  v8[3] = &unk_10212BB30;
  v8[4] = self;
  v8[5] = a3;
  v7 = dispatch_block_create((dispatch_block_flags_t)0, v8);
  dispatch_after(v6, (dispatch_queue_t)self->_queue, v7);
  -[NSMutableDictionary setObject:forKey:](self->_scheduledConnectionEvaluationBlocks, "setObject:forKey:", v7, objc_msgSend(a3, "uuid"));
  _Block_release(v7);
}

- (void)cancelConnectionEvaluationForDevice:(id)a3
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  _BOOL4 v15;

  v5 = -[NSMutableDictionary objectForKey:](self->_scheduledConnectionEvaluationBlocks, "objectForKey:", objc_msgSend(a3, "uuid"));
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289795;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2113;
    v11 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v12 = 2113;
    v13 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "activePeripheral"), "identifier"), "description"), "substringToIndex:", 8);
    v14 = 1026;
    v15 = v5 != 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection cancelling connection evaluation\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"exists\":%{public}hhd}", (uint8_t *)v7, 0x2Cu);
  }
  if (v5)
  {
    dispatch_block_cancel(v5);
    -[NSMutableDictionary removeObjectForKey:](self->_scheduledConnectionEvaluationBlocks, "removeObjectForKey:", objc_msgSend(a3, "uuid"));
  }
}

- (void)disconnectDevice:(id)a3
{
  if (objc_msgSend(a3, "activePeripheral"))
  {
    objc_msgSend(a3, "setDisconnectionReason:", CFSTR("ManagerDisconnect"));
    -[CLDurianDeviceManager cancelPeripheralConnection:forUUID:](self, "cancelPeripheralConnection:forUUID:", objc_msgSend(a3, "activePeripheral"), objc_msgSend(a3, "uuid"));
  }
}

- (void)handleSystemSleep
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "isLeashSlotInUse") & 1) == 0 && objc_msgSend(v8, "activePeripheral"))
        {
          -[CLDurianDeviceManager disconnectDevice:](self, "disconnectDevice:", v8);
          objc_msgSend(v8, "removeAllPossiblePeripherals");
          -[CLDurianDeviceManager finishMaintainingDevice:withReason:andCategory:](self, "finishMaintainingDevice:withReason:andCategory:", v8, CFSTR("maintained:sleep"), 2);
        }
        if (objc_msgSend(v8, "isAttemptingConnection")
          && objc_msgSend(v8, "maintenanceOnlyCondition") != (id)3)
        {
          -[CLDurianDeviceManager finishMaintainingDevice:withReason:andCategory:](self, "finishMaintainingDevice:withReason:andCategory:", v8, CFSTR("error:sleep"), 1);
          -[CLDurianDeviceManager cancelConnectionAttemptToDevice:](self, "cancelConnectionAttemptToDevice:", v8);
        }
        if (objc_msgSend(v8, "isConnected"))
        {
          -[CLDurianDeviceManager cancelConnectionEvaluationForDevice:](self, "cancelConnectionEvaluationForDevice:", v8);
          -[CLDurianDeviceManager evaluateConnectionStateForDevice:](self, "evaluateConnectionStateForDevice:", v8);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
}

- (void)networkConnectivity:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;

  v3 = a3;
  self->_networkAvailable = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289283;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 1025;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian networkConnectivity\", \"connected\":%{private}d}", (uint8_t *)v5, 0x18u);
  }
}

- (void)coexImpactState:(int)a3
{
  _BOOL4 v5;
  NSObject *v6;
  unint64_t maintDutyCycleUpgrade;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  int v16;

  if (-[CLDurianDeviceManager isMaintenanceActive](self, "isMaintenanceActive"))
    v5 = (self->_coexImpactState & 3) != 0 && (a3 & 3) == 0;
  else
    v5 = 0;
  self->_coexImpactState = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    maintDutyCycleUpgrade = self->_maintDutyCycleUpgrade;
    v8[0] = 68289795;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 1025;
    v12 = a3;
    v13 = 1025;
    v14 = v5;
    v15 = 1025;
    v16 = maintDutyCycleUpgrade;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint coex\", \"state\":%{private}d, \"updateDutyCycle\":%{private}d, \"upgrade\":%{private}d}", (uint8_t *)v8, 0x24u);
  }
  if (v5 && !self->_maintDutyCycleUpgrade)
    -[CLDurianDeviceManager restartMaintenanceConnections](self, "restartMaintenanceConnections");
}

- (void)metricHeartbeat
{
  NSObject *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t buf;
  __int16 v16;
  const char *v17;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289026;
    v16 = 2082;
    v17 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metric heartbeat\"}", (uint8_t *)&buf, 0x12u);
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        -[CLDurianMetricManager submitNonTimerMaintenanceMetricsForDevice:proactive:](self->_metricManager, "submitNonTimerMaintenanceMetricsForDevice:proactive:", v9, objc_msgSend(v9, "proactiveMaintenanceCount"));
        objc_msgSend(v9, "setProactiveMaintenanceCount:", 0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

- (void)updateLoiType:(unint64_t)a3 isEntry:(BOOL)a4
{
  id v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  NSString *v12;

  v6 = -[CLDurianDeviceManager convertLoiTypeToString:](self, "convertLoiTypeToString:", a3);
  if (!a4)
    v6 = objc_msgSend(CFSTR("departedFrom"), "stringByAppendingString:", v6);
  -[CLDurianDeviceManager setLoiType:](self, "setLoiType:", v6);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289283;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2113;
    v12 = -[CLDurianDeviceManager loiType](self, "loiType");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system update loiType\", \"loiType\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
  }
}

- (id)convertLoiTypeToString:(unint64_t)a3
{
  int v3;
  NSObject *v5;
  NSObject *v6;
  int v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;

  v3 = a3;
  if (a3 < 5)
    return off_1021BCA80[a3];
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
  {
    v7 = 68289282;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    v11 = 1026;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian received unknown place type, please update convertLoiTypeToString\", \"label\":%{public}d}", (uint8_t *)&v7, 0x18u);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  }
  v6 = qword_1022A0038;
  if (os_signpost_enabled((os_log_t)qword_1022A0038))
  {
    v7 = 68289282;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    v11 = 1026;
    v12 = v3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian received unknown place type, please update convertLoiTypeToString", "{\"msg%{public}.0s\":\"#durian received unknown place type, please update convertLoiTypeToString\", \"label\":%{public}d}", (uint8_t *)&v7, 0x18u);
  }
  return CFSTR("Unknown");
}

- (void)updateDeviceConnectionState:(id)a3 state:(unint64_t)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  SPOwnerSession *ownerSession;
  id v14;
  _QWORD v15[8];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "isHeleAccessory"))
        {
          if (objc_msgSend(v12, "groupUuid"))
          {
            ownerSession = self->_ownerSession;
            v14 = objc_msgSend(v12, "groupUuid");
            v15[0] = _NSConcreteStackBlock;
            v15[1] = 3221225472;
            v15[2] = sub_101521100;
            v15[3] = &unk_1021BC878;
            v15[4] = self;
            v15[5] = a3;
            v15[6] = v12;
            v15[7] = a4;
            -[SPOwnerSession beaconGroupForIdentifier:completion:](ownerSession, "beaconGroupForIdentifier:completion:", v14, v15);
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
}

- (void)didFetchBeaconGroup:(id)a3 connectedDeviceAddress:(id)a4 device:(id)a5 state:(unint64_t)a6
{
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;

  if (objc_msgSend(a4, "isEqualToString:", objc_msgSend(objc_msgSend(a3, "macAddress"), "fm_hexString")))
  {
    if (a6 == 2)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      v11 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 68289539;
        v15 = 0;
        v16 = 2082;
        v17 = "";
        v18 = 2113;
        v19 = objc_msgSend(a5, "uuid");
        v20 = 2113;
        v21 = a4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system update last classic connection with disconnect event\", \"device\":%{private, location:escape_only}@, \"macAddress\":%{private, location:escape_only}@}", (uint8_t *)&v14, 0x26u);
      }
      objc_msgSend(a5, "setLastGroupClassicDisconnectionTime:", mach_continuous_time());
    }
    else
    {
      if (a6 == 1)
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
        v9 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 68289539;
          v15 = 0;
          v16 = 2082;
          v17 = "";
          v18 = 2113;
          v19 = objc_msgSend(a5, "uuid");
          v20 = 2113;
          v21 = a4;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system update last classic connection with connect event\", \"device\":%{private, location:escape_only}@, \"macAddress\":%{private, location:escape_only}@}", (uint8_t *)&v14, 0x26u);
        }
        v10 = 1;
        goto LABEL_22;
      }
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      v12 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
      {
        v14 = 68289283;
        v15 = 0;
        v16 = 2082;
        v17 = "";
        v18 = 2049;
        v19 = (id)a6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #system update last classic connection received unhandled bluetooth service notification\", \"state\":%{private}ld}", (uint8_t *)&v14, 0x1Cu);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      }
      v13 = qword_1022A0038;
      if (os_signpost_enabled((os_log_t)qword_1022A0038))
      {
        v14 = 68289283;
        v15 = 0;
        v16 = 2082;
        v17 = "";
        v18 = 2049;
        v19 = (id)a6;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #system update last classic connection received unhandled bluetooth service notification", "{\"msg%{public}.0s\":\"#durian #system update last classic connection received unhandled bluetooth service notification\", \"state\":%{private}ld}", (uint8_t *)&v14, 0x1Cu);
      }
    }
    v10 = 0;
LABEL_22:
    objc_msgSend(a5, "setIsClassicallyConnected:", v10);
  }
}

- (unint64_t)totalConnectionCount
{
  id v2;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v10;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v2);
      v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "isConnected");
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  }
  while (v4);
  return v5;
}

- (unint64_t)leashSlotsInUse
{
  id v2;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v10;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v2);
      v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "isLeashSlotInUse");
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  }
  while (v4);
  return v5;
}

- (BOOL)shouldConnectUsingLeashToDevice:(id)a3
{
  unsigned int v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  int v12;
  NSObject *v13;
  _DWORD v15[2];
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  int v27;
  __int16 v28;
  unsigned int v29;

  v5 = objc_msgSend(a3, "isLeashable");
  v6 = objc_msgSend(a3, "reconnecting");
  v7 = sub_100E0087C() - v6;
  v8 = -[CLDurianDeviceManager leashSlotsInUse](self, "leashSlotsInUse");
  v9 = objc_msgSend(a3, "isLeashSlotInUse");
  v10 = v9;
  if (v8 < v7)
    v11 = 1;
  else
    v11 = v9;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v12 = v5 & v11;
  v13 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 68290563;
    v15[1] = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2113;
    v19 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v20 = 1026;
    v21 = v12;
    v22 = 1026;
    v23 = v5;
    v24 = 1026;
    v25 = v8 < v7;
    v26 = 1026;
    v27 = v7;
    v28 = 1026;
    v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #leash connect\", \"item\":%{private, location:escape_only}@, \"decision\":%{public}hhd, \"eligible\":%{public}hhd, \"slotAvail\":%{public}hhd, \"leashesAllowed\":%{public}d, \"slotInUse\":%{public}hhd}", (uint8_t *)v15, 0x3Au);
  }
  return v12;
}

- (BOOL)shouldHoldLeashForDevice:(id)a3
{
  id v4;
  unsigned int v5;
  _BOOL4 v6;
  NSObject *v7;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  _BOOL4 v19;

  v4 = -[NSMutableDictionary objectForKey:](self->_maintenanceEvictionMap, "objectForKey:", objc_msgSend(a3, "uuid"));
  v5 = objc_msgSend(a3, "isLeashSlotInUse");
  if (v4)
    v6 = 0;
  else
    v6 = v5;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68290051;
    v10 = 2082;
    v9[1] = 0;
    v11 = "";
    v12 = 2113;
    v13 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v14 = 1026;
    v15 = v6;
    v16 = 1026;
    v17 = objc_msgSend(a3, "isLeashSlotInUse");
    v18 = 1026;
    v19 = v4 == 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #leash hold\", \"item\":%{private, location:escape_only}@, \"decision\":%{public}hhd, \"leashslot\":%{public}hhd, \"notevicting\":%{public}hhd}", (uint8_t *)v9, 0x2Eu);
  }
  return v6;
}

- (unsigned)getNearOwnerTimeoutForDevice:(id)a3 checkingForNetwork:(BOOL)a4 checkingHele:(BOOL)a5
{
  _BOOL4 v5;
  unsigned __int16 v8;
  unsigned int v9;
  NSObject *v10;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unsigned int v20;

  v5 = a4;
  v8 = 960;
  if (a5)
  {
    v9 = objc_msgSend(a3, "isHeleAccessory");
    if (v9)
      v8 = 3660;
    else
      v8 = 960;
    if (!v5)
      goto LABEL_10;
  }
  else
  {
    v9 = 0;
    if (!a4)
      goto LABEL_10;
  }
  if (!self->_networkAvailable)
  {
    v9 = 2;
    v8 = 15;
  }
LABEL_10:
  if (objc_msgSend(a3, "nearOwnerTimeoutOverride"))
  {
    v8 = (unsigned __int16)objc_msgSend(a3, "nearOwnerTimeoutOverride");
    v9 = 3;
  }
  else if (+[CLDurianSettings nearOwnerTimeoutOverride](CLDurianSettings, "nearOwnerTimeoutOverride"))
  {
    v8 = (unsigned __int16)-[NSNumber unsignedIntValue](+[CLDurianSettings nearOwnerTimeoutOverride](CLDurianSettings, "nearOwnerTimeoutOverride"), "unsignedIntValue");
    objc_msgSend(a3, "setNearOwnerTimeoutOverride:", v8);
    v9 = 4;
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v10 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 68289795;
    v12[1] = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2113;
    v16 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v17 = 1026;
    v18 = v8;
    v19 = 1026;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian nearowner timeout\", \"item\":%{private, location:escape_only}@, \"timeout\":%{public}d, \"path\":%{public}d}", (uint8_t *)v12, 0x28u);
  }
  return v8;
}

- (void)setKeyRollIntervalForDevice:(id)a3
{
  unsigned int v4;
  int v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;

  if (objc_msgSend(a3, "keyRollInterval") != 900)
  {
    v4 = objc_msgSend(a3, "keyRollInterval");
    v5 = 1;
LABEL_5:
    if (v4 >= 0x3C)
      v6 = v5;
    else
      v6 = 3;
    goto LABEL_8;
  }
  if (+[CLDurianSettings alignmentIntervalOverride](CLDurianSettings, "alignmentIntervalOverride"))
  {
    v4 = -[NSNumber unsignedIntValue](+[CLDurianSettings alignmentIntervalOverride](CLDurianSettings, "alignmentIntervalOverride"), "unsignedIntValue");
    v5 = 2;
    goto LABEL_5;
  }
  v6 = 0;
  v4 = 900;
LABEL_8:
  if (v4 <= 0x3C)
    v7 = 60;
  else
    v7 = v4;
  if ((_DWORD)v7 != 900)
    objc_msgSend(a3, "setKeyRollInterval:", v7);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289795;
    v9[1] = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2113;
    v13 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v14 = 1026;
    v15 = v7;
    v16 = 1026;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian keyroll interval\", \"item\":%{private, location:escape_only}@, \"interval\":%{public}d, \"path\":%{public}d}", (uint8_t *)v9, 0x28u);
  }
}

- (void)evaluateConnectionStateForDevice:(id)a3
{
  unsigned int v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  char v9;
  NSObject *v10;
  id v11;
  int v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  unsigned int v25;

  v5 = -[CLDurianDeviceManager shouldHoldLeashForDevice:](self, "shouldHoldLeashForDevice:");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 68290307;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2113;
    v17 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v18 = 1026;
    v19 = objc_msgSend(a3, "numPendingTasks");
    v20 = 1026;
    v21 = v5;
    v22 = 1026;
    v23 = objc_msgSend(a3, "firmwareUpdateMode");
    v24 = 1026;
    v25 = objc_msgSend(a3, "btFindingState");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection evaluation\", \"item\":%{private, location:escape_only}@, \"tasks\":%{public}d, \"shouldHoldLeash\":%{public}hhd, \"fwdl\":%{public}hhd, \"btfind\":%{public}d}", (uint8_t *)&v12, 0x34u);
  }
  if (objc_msgSend(a3, "btFindingState") == (id)2)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      v12 = 68289283;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2113;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection aggadv\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x1Cu);
    }
  }
  else
  {
    if (objc_msgSend(a3, "numPendingTasks"))
      v9 = 1;
    else
      v9 = v5;
    if ((v9 & 1) != 0 || objc_msgSend(a3, "firmwareUpdateMode"))
    {
      objc_msgSend(a3, "setDesiredConnectionLatency");
    }
    else
    {
      objc_msgSend(a3, "setDisconnectionReason:", CFSTR("Debounce"));
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      v10 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
        v12 = 68289283;
        v13 = 0;
        v14 = 2082;
        v15 = "";
        v16 = 2113;
        v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian disconnecting peripheral\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x1Cu);
      }
      -[CLDurianDeviceManager disconnectDevice:](self, "disconnectDevice:", a3);
    }
  }
}

- (char)getQuarterHour
{
  NSInteger v2;
  uint64_t v3;

  v2 = -[NSDateComponents minute](-[NSCalendar components:fromDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "components:fromDate:", 64, +[NSDate date](NSDate, "date")), "minute");
  v3 = ((unsigned __int128)(v2 * (__int128)(uint64_t)0x8888888888888889) >> 64) + v2;
  return 15 * ((v3 < 0) + (v3 >> 3));
}

- (void)maintenanceTimerFiredWithInterval:(double)a3
{
  CLDurianMetricManager *metricManager;

  -[CLDurianDeviceManager maintainAllDevices:](self, "maintainAllDevices:", a3 != -1.0);
  metricManager = self->_metricManager;
  -[CLDurianMaintenanceUtilities interval](self->_maintUtils, "interval");
  -[CLDurianMetricManager submitMaintenanceTimerFiredMetrics:actualInterval:](metricManager, "submitMaintenanceTimerFiredMetrics:actualInterval:");
}

- (BOOL)shouldEvictForDevice:(id)a3
{
  unsigned int v4;
  uint64_t *v5;
  uint64_t *v6;
  NSObject *v7;
  id v8;
  unsigned int v9;
  NSMutableDictionary *maintenanceEvictionMap;
  _BOOL4 v11;
  id v12;
  id v13;
  __int128 v14;
  id v15;
  void *i;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  uint64_t *v22;
  uint64_t *v23;
  id v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  id v31;
  unsigned int v32;
  id v33;
  id v34;
  uint64_t v35;
  void *j;
  NSObject *v37;
  id v38;
  unsigned int v39;
  unsigned int v40;
  __int128 v42;
  NSMutableSet *obj;
  id v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t buf;
  __int16 v58;
  const char *v59;
  __int16 v60;
  id v61;
  __int16 v62;
  _BYTE v63[10];
  _DWORD v64[4];

  v4 = objc_msgSend(-[NSMutableDictionary allValues](self->_maintenanceEvictionMap, "allValues"), "containsObject:", objc_msgSend(a3, "uuid"));
  v5 = &qword_1022A0000;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v6 = &qword_1022A0000;
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v9 = -[NSMutableSet count](self->_maintenanceEvictionCandidates, "count");
    maintenanceEvictionMap = self->_maintenanceEvictionMap;
    buf = 68290051;
    v58 = 2082;
    v59 = "";
    v60 = 2113;
    v61 = v8;
    v62 = 1026;
    *(_DWORD *)v63 = v4;
    *(_WORD *)&v63[4] = 1026;
    *(_DWORD *)&v63[6] = v9;
    LOWORD(v64[0]) = 2114;
    *(_QWORD *)((char *)v64 + 2) = maintenanceEvictionMap;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint capped shouldEvict\", \"item\":%{private, location:escape_only}@, \"inprogress\":%{public}hhd, \"candidates\":%{public}d, \"evictMap\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x32u);
  }
  if ((v4 & 1) != 0)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v12 = objc_alloc_init((Class)NSMutableArray);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = self->_maintenanceEvictionCandidates;
    v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v13)
    {
      v15 = v13;
      v46 = *(_QWORD *)v52;
      *(_QWORD *)&v14 = 68289795;
      v42 = v14;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v52 != v46)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
          v18 = -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v17, v42);
          if (!objc_msgSend(v18, "connectionPriority"))
          {
            v26 = -[CLDurianDeviceManager getNearOwnerTimeoutForDevice:checkingForNetwork:checkingHele:](self, "getNearOwnerTimeoutForDevice:checkingForNetwork:checkingHele:", a3, 1, 1);
            v27 = v17;
            if (v5[6] != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BCA48);
            v28 = v6[7];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              v29 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
              buf = 68289539;
              v58 = 2082;
              v59 = "";
              v60 = 2113;
              v61 = v29;
              v62 = 1026;
              *(_DWORD *)v63 = v26;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian disable leash\", \"item\":%{private, location:escape_only}@, \"nearowner\":%{public}d}", (uint8_t *)&buf, 0x22u);
            }
            objc_msgSend(v18, "enqueueTask:", objc_msgSend(v18, "createSetNearOwnerTimeoutTaskInSeconds:", v26));
            objc_msgSend(v18, "enqueueTask:", objc_msgSend(v18, "createSetPersistentConnectionTaskWithState:", 0));
            objc_msgSend(v18, "setMaintenanceOnlyCondition:", 1);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_maintenanceEvictionMap, "setObject:forKeyedSubscript:", objc_msgSend(a3, "uuid"), v27);
            objc_msgSend(v12, "addObject:", v27);
            if (v5[6] != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BCA48);
            v30 = v6[7];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v31 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
              v32 = -[NSMutableDictionary count](self->_maintenanceEvictionMap, "count");
              buf = v42;
              v58 = 2082;
              v59 = "";
              v60 = 2113;
              v61 = v31;
              v62 = 2113;
              *(_QWORD *)v63 = v27;
              *(_WORD *)&v63[8] = 1026;
              v64[0] = v32;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint capped\", \"item\":%{private, location:escape_only}@, \"evict\":%{private, location:escape_only}@, \"evictcount\":%{public}d}", (uint8_t *)&buf, 0x2Cu);
            }
            v11 = 1;
            goto LABEL_29;
          }
          if (v5[6] != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BCA48);
          v19 = v6[7];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v45 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
            v20 = objc_msgSend(objc_msgSend(v17, "description"), "substringToIndex:", 8);
            v21 = v17;
            v22 = v6;
            v23 = v5;
            v24 = v20;
            v25 = objc_msgSend(v18, "connectionPriority");
            buf = v42;
            v58 = 2082;
            v59 = "";
            v60 = 2113;
            v61 = v45;
            v62 = 2113;
            *(_QWORD *)v63 = v24;
            v5 = v23;
            v6 = v22;
            v17 = v21;
            *(_WORD *)&v63[8] = 1025;
            v64[0] = v25;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint capped notidle\", \"item\":%{private, location:escape_only}@, \"evict\":%{private, location:escape_only}@, \"connectionPriority\":%{private}d}", (uint8_t *)&buf, 0x2Cu);
          }
          objc_msgSend(v12, "addObject:", v17);
        }
        v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        if (v15)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_29:
    if (objc_msgSend(v12, "count"))
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v33 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v48;
        do
        {
          for (j = 0; j != v34; j = (char *)j + 1)
          {
            if (*(_QWORD *)v48 != v35)
              objc_enumerationMutation(v12);
            -[NSMutableSet removeObject:](self->_maintenanceEvictionCandidates, "removeObject:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j));
          }
          v34 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        }
        while (v34);
      }
    }
    if (v5[6] != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v37 = v6[7];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = objc_msgSend(a3, "uuid");
      v39 = -[NSMutableSet count](self->_maintenanceEvictionCandidates, "count");
      v40 = objc_msgSend(v12, "count");
      buf = 68290051;
      v58 = 2082;
      v59 = "";
      v60 = 2113;
      v61 = v38;
      v62 = 1026;
      *(_DWORD *)v63 = v11;
      *(_WORD *)&v63[4] = 1025;
      *(_DWORD *)&v63[6] = v39;
      LOWORD(v64[0]) = 1026;
      *(_DWORD *)((char *)v64 + 2) = v40;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint eviction\", \"device\":%{private, location:escape_only}@, \"evicting\":%{public}hhd, \"candidates\":%{private}d, \"removed\":%{public}d}", (uint8_t *)&buf, 0x2Eu);
    }

  }
  return v11;
}

- (void)evaluateDisconnectedDevices
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "isConnected") & 1) == 0)
        {
          if (objc_msgSend(v8, "isLeashSlotInUse"))
          {
            objc_msgSend(v8, "setConnectionReason:", CFSTR("Leash:Releash"));
            -[CLDurianDeviceManager attemptConnectionToDevice:](self, "attemptConnectionToDevice:", v8);
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
}

- (void)dispatchProactiveMaintenanceOnDevice:(id)a3 maintenanceReason:(int64_t)a4
{
  id v7;
  dispatch_time_t v8;
  NSObject *queue;
  _QWORD v10[6];

  v7 = objc_msgSend(a3, "activePeripheral");
  if (a4 == 2
    && !v7
    && self->_maintenanceOnWildObservationEnabled
    && !-[CLDurianDeviceManager isMaintenanceActive](self, "isMaintenanceActive")
    && !-[CLDurianMaintenanceUtilities isTinkerWatch](self->_maintUtils, "isTinkerWatch")
    && (objc_msgSend(a3, "isAttemptingConnection") & 1) == 0
    && -[CLDurianDeviceManager sufficientTimeElapsedSinceDisconnectionOfDevice:](self, "sufficientTimeElapsedSinceDisconnectionOfDevice:", a3))
  {
    if (-[CLDurianDeviceManager sufficientTimeElapsedSinceLastProactiveMaintenanceOfDevice:](self, "sufficientTimeElapsedSinceLastProactiveMaintenanceOfDevice:", a3))
    {
      v8 = dispatch_time(0, 1000000000);
      queue = self->_queue;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10152294C;
      v10[3] = &unk_10212BB30;
      v10[4] = self;
      v10[5] = a3;
      dispatch_after(v8, queue, v10);
    }
  }
}

- (void)performProactiveMaintenanceOnDevice:(id)a3
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  double Current;
  double v9;
  double v10;
  const __CFString *v11;
  double v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  unsigned int v24;

  v5 = -[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", objc_msgSend(a3, "uuid"));
  v6 = objc_msgSend(a3, "isAttemptingConnection");
  v7 = v6;
  if ((v5 & 1) != 0 || (v6 & 1) != 0)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v14 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 68289795;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      v21 = 1026;
      v22 = v5;
      v23 = 1026;
      v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint proactive skipped\", \"item\":%{private, location:escape_only}@, \"maint\":%{public}hhd, \"connect\":%{public}hhd}", (uint8_t *)&v15, 0x28u);
    }
  }
  else
  {
    Current = CFAbsoluteTimeGetCurrent();
    -[CLDurianDeviceManager requestCarScanTimeViaDevice:](self, "requestCarScanTimeViaDevice:", a3);
    v10 = vabdd_f64(Current, v9);
    if (v10 > 18.0)
      v11 = CFSTR("Maintenance:Proactive");
    else
      v11 = CFSTR("Maintenance:ProactiveVehicular");
    objc_msgSend(a3, "setConnectionReason:", v11);
    sub_101536DD8();
    objc_msgSend(a3, "setLastProactiveMaintenanceTime:", (unint64_t)v12);
    objc_msgSend(a3, "setProactiveMaintenanceCount:", objc_msgSend(a3, "proactiveMaintenanceCount") + 1);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v13 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint proactive\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
    objc_msgSend(a3, "setMaintenanceOnlyCondition:", 1);
    objc_msgSend(a3, "setNumProactiveAttempts:", (objc_msgSend(a3, "numProactiveAttempts") + 1));
    if (-[CLDurianDeviceManager attemptConnectToDevice:onCondition:](self, "attemptConnectToDevice:onCondition:", a3, 1))
    {
      objc_msgSend(a3, "setIsProactiveAttempt:", 1);
      if (v10 <= 18.0)
        -[CLDurianMetricManager submitCarMaintConnectionMetrics:](self->_metricManager, "submitCarMaintConnectionMetrics:", 1);
    }
  }
}

- (BOOL)sufficientTimeElapsedSinceDisconnectionOfDevice:(id)a3
{
  double v5;
  double v6;
  unsigned int v7;
  NSObject *v8;
  _DWORD v10[2];
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unsigned int v18;

  objc_msgSend(a3, "secondsSinceLastDisconnection");
  v6 = v5;
  v7 = -[CLDurianDeviceManager getNearOwnerTimeoutForDevice:checkingForNetwork:checkingHele:](self, "getNearOwnerTimeoutForDevice:checkingForNetwork:checkingHele:", a3, 0, 0);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 68289795;
    v10[1] = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2113;
    v14 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v15 = 1026;
    v16 = (int)v6;
    v17 = 1026;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #sufficientTimeElapsedSinceDisconnectionOf\", \"item\":%{private, location:escape_only}@, \"sinceDisconnect\":%{public}d, \"nearOwnerTimeout\":%{public}d}", (uint8_t *)v10, 0x28u);
  }
  return v6 > (double)v7;
}

- (BOOL)sufficientTimeElapsedSinceLastProactiveMaintenanceOfDevice:(id)a3
{
  double v4;
  double v5;
  NSObject *v6;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  int v14;

  objc_msgSend(a3, "secondsSinceLastProactiveMaintenanceAttempt");
  v5 = v4;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289539;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2113;
    v12 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v13 = 1026;
    v14 = (int)v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #sufficientTimeElapsedSinceLastProactiveMaintenanceOf\", \"item\":%{private, location:escape_only}@, \"secondsSinceLastProactiveMaintenanceAttempt\":%{public}d}", (uint8_t *)v8, 0x22u);
  }
  return v5 > 60.0;
}

- (void)connectToDevice:(id)a3 withPeripheral:(id)a4 forcedTimeout:(int64_t)a5
{
  id v6;
  NSObject *v9;
  const char *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  unsigned int v16;
  unsigned int v17;
  NSObject *v18;
  NSString *v19;
  int coexImpactState;
  const __CFString *v21;
  int64_t v22;
  uint64_t v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  char v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  int v33;
  NSObject *v34;
  id v35;
  NSNumber *v36;
  __CFString *v37;
  unsigned __int8 v38;
  unsigned int v39;
  uint64_t v40;
  id v41;
  unsigned int v42;
  unsigned int v43;
  int v44;
  const char *v45;
  NSObject *v46;
  id v47;
  NSString *v48;
  NSString *v49;
  id v50;
  id v51;
  int v52;
  unsigned int v53;
  unint64_t maintDutyCycleUpgrade;
  id v55;
  __CFString *v56;
  const char *v57;
  id v58;
  int v59;
  const __CFString *v60;
  void *v61;
  unsigned int v62;
  uint8_t buf[4];
  int v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  _BYTE v70[10];
  _BYTE v71[10];
  NSString *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  __CFString *v76;
  __int16 v77;
  int v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  int v82;
  __int16 v83;
  unsigned int v84;
  __int16 v85;
  unsigned int v86;
  __int16 v87;
  int v88;
  __int16 v89;
  const __CFString *v90;

  v6 = a4;
  if (-[NSMutableDictionary objectForKey:](self->_connectionTimeoutBlocks, "objectForKey:", a4))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289539;
      v64 = 0;
      v65 = 2082;
      v66 = "";
      v67 = 2113;
      v68 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      v69 = 2113;
      *(_QWORD *)v70 = objc_msgSend(objc_msgSend(objc_msgSend(v6, "identifier"), "description"), "substringToIndex:", 8);
      v10 = "{\"msg%{public}.0s\":\"#durian #connection defering, peripheral pending\", \"item\":%{private, location:esca"
            "pe_only}@, \"periph\":%{private, location:escape_only}@}";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0x26u);
      return;
    }
    return;
  }
  v11 = objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "nextConnectionMaterialForPeripheral:", v6);
  if (v11)
  {
    v12 = v11;
    v13 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CBConnectPeripheralOptionHideFromBTSettings);
    v14 = CBConnectPeripheralOptionConnectionUseCase;
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_10221DF40, CBConnectPeripheralOptionConnectionUseCase);
    if ((unint64_t)objc_msgSend(objc_msgSend(v12, "ltk"), "length") >= 0x10)
    {
      v15 = objc_msgSend(objc_msgSend(v12, "ltk"), "subdataWithRange:", 0, 16);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CBConnectPeripheralOptionUseTempLTK);
    }
    v61 = v12;
    v16 = -[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", objc_msgSend(a3, "uuid"));
    v17 = -[CLDurianDeviceManager shouldConnectUsingLeashToDevice:](self, "shouldConnectUsingLeashToDevice:", a3);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v18 = qword_1022A0038;
    v62 = v17;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68290307;
      v64 = 0;
      v65 = 2082;
      v66 = "";
      v67 = 2113;
      v68 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      v69 = 2113;
      *(_QWORD *)v70 = objc_msgSend(objc_msgSend(objc_msgSend(v6, "identifier"), "description"), "substringToIndex:", 8);
      *(_WORD *)&v70[8] = 1026;
      *(_DWORD *)v71 = v16;
      *(_WORD *)&v71[4] = 1026;
      *(_DWORD *)&v71[6] = v17;
      LOWORD(v72) = 1026;
      *(_DWORD *)((char *)&v72 + 2) = -[CLDurianDeviceManager leashSlotsInUse](self, "leashSlotsInUse");
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection usecase\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"maint\":%{public}hhd, \"shouldLeash\":%{public}hhd, \"slotsInUse\":%{public}d}", buf, 0x38u);
    }
    if (v17)
    {
      objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_10221DF58, v14);
      objc_msgSend(a3, "setLeashState:", 2);
    }
    v19 = +[CLDurianSettings testMode](CLDurianSettings, "testMode");
    coexImpactState = self->_coexImpactState;
    if (-[NSString isEqualToString:](v19, "isEqualToString:", CFSTR("User3060")))
    {
      v21 = CFSTR("testUser3060");
      v22 = 10;
      v23 = 3;
      goto LABEL_77;
    }
    if (objc_msgSend(a3, "maintenanceOnlyCondition")
      && -[NSString isEqualToString:](v19, "isEqualToString:", CFSTR("Maintenance30300")))
    {
      v21 = CFSTR("testMaint30300");
LABEL_49:
      v22 = 600;
      v23 = 6;
      goto LABEL_77;
    }
    v24 = coexImpactState & 5;
    v25 = objc_msgSend(a3, "isTAAISDevice");
    v26 = objc_msgSend(a3, "isHeleAccessory");
    v27 = v26;
    if (v25)
    {
      if (v24)
        v28 = v26;
      else
        v28 = 1;
      if (v26)
        v23 = 6;
      else
        v23 = 1;
      if (v26)
        v21 = CFSTR("AIShele");
      else
        v21 = CFSTR("AIS5g");
      if (v26)
        v22 = 600;
      else
        v22 = 10;
      if ((v28 & 1) == 0)
      {
        v29 = (self->_coexImpactState & 3) == 0;
        if ((self->_coexImpactState & 3) != 0)
          v23 = 6;
        else
          v23 = 4;
        if ((self->_coexImpactState & 3) != 0)
          v21 = CFSTR("AIScoex");
        else
          v21 = CFSTR("AIS2g");
        v30 = 600;
        v31 = 20;
LABEL_59:
        if (v29)
          v22 = v31;
        else
          v22 = v30;
      }
    }
    else
    {
      v32 = objc_msgSend(a3, "maintenanceOnlyCondition");
      if (v27)
      {
        if (v32)
        {
          v21 = CFSTR("mainthele");
          goto LABEL_49;
        }
        if ((self->_coexImpactState & 2) != 0)
          v23 = 3;
        else
          v23 = 1;
        if ((self->_coexImpactState & 2) != 0)
          v21 = CFSTR("userhelewc");
        else
          v21 = CFSTR("userhele");
        v22 = 60;
      }
      else
      {
        v33 = self->_coexImpactState;
        if (v32 && v24)
        {
          v21 = CFSTR("maint2g");
          if ((v33 & 3) == 0)
          {
            v22 = 20;
            v23 = 4;
            goto LABEL_77;
          }
          v29 = self->_maintDutyCycleUpgrade == 0;
          if (self->_maintDutyCycleUpgrade)
            v23 = 4;
          else
            v23 = 6;
          if (!self->_maintDutyCycleUpgrade)
            v21 = CFSTR("maintcoex");
          v30 = 20;
          v31 = 600;
          goto LABEL_59;
        }
        if ((v33 & 2) != 0)
          v23 = 3;
        else
          v23 = 1;
        if ((v33 & 2) != 0)
          v21 = CFSTR("usercoex");
        else
          v21 = CFSTR("userOr5g");
        v22 = 10;
      }
    }
LABEL_77:
    v60 = v21;
    if (a5)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      v34 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v35 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
        *(_DWORD *)buf = 68289795;
        v64 = 0;
        v65 = 2082;
        v66 = "";
        v67 = 2113;
        v68 = v35;
        v69 = 1026;
        *(_DWORD *)v70 = v22;
        *(_WORD *)&v70[4] = 1026;
        *(_DWORD *)&v70[6] = a5;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection forcedTimeout\", \"item\":%{private, location:escape_only}@, \"timeout\":%{public}d, \"forced\":%{public}d}", buf, 0x28u);
      }
    }
    else
    {
      a5 = v22;
    }
    v36 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v23);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v36, CBConnectPeripheralOptionSetConnectScanDutyCycle);
    v37 = off_1021BCAA8[v23 - 1];
    v59 = sub_101536EC0();
    if (!v59)
      goto LABEL_103;
    v38 = objc_msgSend(a3, "isHeleAccessory");
    v39 = objc_msgSend(a3, "isLeashSlotInUse");
    if ((v38 & 1) != 0)
    {
      if (v39)
      {
        if (objc_msgSend(a3, "maintenanceOnlyCondition"))
          v40 = 65539;
        else
          v40 = 65538;
        goto LABEL_102;
      }
      if ((objc_msgSend(a3, "isTAAISDevice") & 1) != 0)
      {
        v40 = 65561;
LABEL_102:
        objc_msgSend(v13, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v40), v14);
        a5 *= 2;
LABEL_103:
        v44 = objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", v14), "intValue");
        if (v44 >= 0x20000)
        {
          if (v44 >= 327680)
          {
            if (v44 >= 589824)
            {
              if (v44 <= 2147418111)
              {
                switch(v44)
                {
                  case 589824:
                    v45 = "FindNearbyRemote";
                    break;
                  case 589825:
                    v45 = "FindNearbyPencil";
                    break;
                  case 655360:
                    v45 = "AccessDigitalHomeKey";
                    break;
                  default:
LABEL_216:
                    v45 = "?";
                    break;
                }
              }
              else
              {
                switch(v44)
                {
                  case 2147418112:
                    v45 = "InternalTestNoLockScan";
                    break;
                  case 2147418113:
                    v45 = "InternalTestNoScreenOffScan";
                    break;
                  case 2147418114:
                    v45 = "InternalTestScanWithNoDups";
                    break;
                  case 2147418115:
                    v45 = "InternalTestScanWithDups";
                    break;
                  case 2147418116:
                    v45 = "InternalTestScanFor20Seconds";
                    break;
                  case 2147418117:
                    v45 = "InternalTestActiveScan";
                    break;
                  case 2147418118:
                    v45 = "InternalTestUUIDScan";
                    break;
                  case 2147418119:
                    v45 = "InternalTestScanFor10ClockSeconds";
                    break;
                  case 2147418120:
                    v45 = "InternalTestScanBoost";
                    break;
                  default:
                    goto LABEL_216;
                }
              }
            }
            else if (v44 > 458752)
            {
              switch(v44)
              {
                case 524288:
                  v45 = "ADPD";
                  break;
                case 524289:
                  v45 = "ADPDBuffer";
                  break;
                case 524290:
                  v45 = "MicroLocation";
                  break;
                case 524291:
                  v45 = "MicroLocationLeech";
                  break;
                default:
                  if (v44 == 458753)
                  {
                    v45 = "PrecisionFindingFindee";
                  }
                  else
                  {
                    if (v44 != 458754)
                      goto LABEL_216;
                    v45 = "PrecisionFindingFindeeHighPriority";
                  }
                  break;
              }
            }
            else
            {
              switch(v44)
              {
                case 393216:
                  v45 = "CaptiveNetworkJoin";
                  break;
                case 393217:
                  v45 = "UseCaseSIMTransfer";
                  break;
                case 393218:
                  v45 = "MacSetup";
                  break;
                case 393219:
                  v45 = "AppleIDSignIn";
                  break;
                case 393220:
                  v45 = "AppleIDSignInSettings";
                  break;
                default:
                  if (v44 == 327680)
                  {
                    v45 = "RapportThirdParty";
                  }
                  else
                  {
                    if (v44 != 458752)
                      goto LABEL_216;
                    v45 = "PrecisionFindingFinder";
                  }
                  break;
              }
            }
          }
          else
          {
            switch(v44)
            {
              case 131072:
                v45 = "SharingDefault";
                break;
              case 131073:
                v45 = "SharingPhoneAutoUnlock";
                break;
              case 131074:
                v45 = "SharingSiriWatchAuth";
                break;
              case 131075:
                v45 = "SharingMacAutoUnlock";
                break;
              case 131076:
                v45 = "SharingEDTScreenOn";
                break;
              case 131077:
                v45 = "SharingEDTWiFiDisabled";
                break;
              case 131078:
                v45 = "SharingEDTWombatEligibleAsDefaultCamera";
                break;
              case 131079:
                v45 = "SharingEDTWombatCameraPicker";
                break;
              case 131080:
                v45 = "SharingWombatBackground";
                break;
              case 131081:
                v45 = "SharingUniversalControl";
                break;
              case 131082:
                v45 = "SharingPeopleProximity";
                break;
              case 131083:
                v45 = "SharingEDTEnsembleOpenDisplayPrefs";
                break;
              case 131084:
                v45 = "SharingEDTNearbydMotionStopped";
                break;
              case 131085:
                v45 = "SharingDoubleBoostGenericScan";
                break;
              case 131086:
                v45 = "SharingEDTIncomingAdvertisement ";
                break;
              case 131087:
                v45 = "SharingEDTWombatStreamStart";
                break;
              case 131088:
                v45 = "SharingOYAutoUnlock";
                break;
              case 131089:
                goto LABEL_216;
              case 131090:
                v45 = "SharingAirDrop";
                break;
              case 131091:
                v45 = "SharingNearbyInvitationHost";
                break;
              case 131092:
                v45 = "SharingNearbyInvitationParticipant";
                break;
              case 131093:
                v45 = "SharingAirDropAskToAirDrop";
                break;
              case 131094:
                v45 = "SharingAirDropTempIdentity";
                break;
              case 131095:
                v45 = "SharingAirDropNeedsCLink";
                break;
              case 131096:
                v45 = "SharingRemoteWidgetUpdate";
                break;
              case 131097:
                v45 = "SharingCountryCodeUpdate";
                break;
              case 131098:
                v45 = "SharingMacPhoneAutoUnlock";
                break;
              case 131099:
                v45 = "SharingVisionProDiscovery";
                break;
              case 131100:
                v45 = "SharingVisionProStateChange";
                break;
              case 131101:
                v45 = "SharingContinuityScreen";
                break;
              case 131102:
                v45 = "SharingEDTRemoteDisplay";
                break;
              default:
                if (v44 == 196608)
                {
                  v45 = "DigitalIDTSA";
                }
                else
                {
                  if (v44 != 0x40000)
                    goto LABEL_216;
                  v45 = "DigitalCarKeyThirdParty";
                }
                break;
            }
          }
        }
        else
        {
          v45 = "Unspecified";
          switch(v44)
          {
            case 0:
              break;
            case 1:
              v45 = "HealthKit";
              break;
            case 2:
              v45 = "HomeKit";
              break;
            case 3:
              v45 = "FindMyObjectConnection";
              break;
            case 4:
              v45 = "FindMyObjectConnectionTransient";
              break;
            case 5:
              v45 = "MIDI";
              break;
            case 6:
              v45 = "Continuity";
              break;
            case 7:
              v45 = "InstantHotSpot";
              break;
            case 8:
              v45 = "NearBy";
              break;
            case 9:
              v45 = "Sharing";
              break;
            case 10:
              v45 = "HearingSupport";
              break;
            case 11:
              v45 = "Magnet";
              break;
            case 12:
              v45 = "HID";
              break;
            case 13:
              v45 = "LEA";
              break;
            case 14:
              v45 = "External";
              break;
            case 15:
              v45 = "ExternalMedical";
              break;
            case 16:
              v45 = "ExternalLock";
              break;
            case 17:
              v45 = "ExternalWatch";
              break;
            case 18:
              v45 = "SmartRouting";
              break;
            case 19:
              v45 = "DigitalID";
              break;
            case 20:
              v45 = "DigitalKey";
              break;
            case 21:
              v45 = "DigitalCarKey";
              break;
            case 22:
              v45 = "HeySiri";
              break;
            case 23:
              v45 = "ThirdPartyApp";
              break;
            case 24:
              v45 = "CNJ";
              break;
            default:
              switch(v44)
              {
                case 256:
                  v45 = "DevicePresenceDetection";
                  break;
                case 257:
                  v45 = "AudioBox";
                  break;
                case 258:
                  v45 = "SIMTransfer";
                  break;
                case 259:
                  v45 = "ProximityScreenOnLeechScan";
                  break;
                case 260:
                  v45 = "MacMigrate";
                  break;
                case 263:
                  v45 = "HIDUARTService";
                  break;
                case 264:
                  v45 = "AccessibilitySwitchControlPairing";
                  break;
                case 265:
                  v45 = "BaseBandFastConnect";
                  break;
                case 266:
                  v45 = "SafetyAlerts";
                  break;
                case 267:
                  v45 = "LECarPlay";
                  break;
                case 268:
                  v45 = "TCCBluetooth";
                  break;
                case 269:
                  v45 = "AOPBufferLeech";
                  break;
                default:
                  goto LABEL_216;
              }
              break;
          }
        }
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
        v46 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          v58 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
          v47 = objc_msgSend(objc_msgSend(objc_msgSend(v6, "identifier"), "description"), "substringToIndex:", 8);
          v57 = v45;
          v56 = v37;
          v48 = sub_10024882C(objc_msgSend(v61, "address"));
          v49 = sub_101536D20(objc_msgSend(v61, "ltk"));
          v50 = v6;
          v51 = v13;
          v52 = self->_coexImpactState;
          v53 = objc_msgSend(a3, "maintenanceOnlyCondition");
          maintDutyCycleUpgrade = self->_maintDutyCycleUpgrade;
          *(_DWORD *)buf = 68292355;
          v64 = 0;
          v65 = 2082;
          v66 = "";
          v67 = 2113;
          v68 = v58;
          v69 = 2113;
          *(_QWORD *)v70 = v47;
          *(_WORD *)&v70[8] = 2113;
          *(_QWORD *)v71 = v48;
          *(_WORD *)&v71[8] = 2113;
          v72 = v49;
          v73 = 1026;
          v74 = v59;
          v75 = 2114;
          v76 = v56;
          v77 = 1026;
          v78 = a5;
          v79 = 2082;
          v80 = v57;
          v81 = 1026;
          v82 = v52;
          v13 = v51;
          v6 = v50;
          v83 = 1026;
          v84 = v62;
          v85 = 1026;
          v86 = v53;
          v87 = 1026;
          v88 = maintDutyCycleUpgrade;
          v89 = 2113;
          v90 = v60;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection create\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"address\":%{private, location:escape_only}@, \"LTK\":%{private, location:escape_only}@, \"sentinel\":%{public}d, \"dutyCycle\":%{public, location:escape_only}@, \"timeout\":%{public}d, \"useCase\":%{public, location:escape_only}s, \"coex\":%{public}d, \"shouldLeash\":%{public}hhd, \"maintOnly\":%{public}d, \"maintUpgrade\":%{public}d, \"path\":%{private, location:escape_only}@}", buf, 0x7Cu);
        }
        -[CLDurianDeviceManager scheduleConnectionTimeout:toDevice:forPeripeheral:](self, "scheduleConnectionTimeout:toDevice:forPeripeheral:", a5, a3, v6);
        v55 = objc_msgSend(a3, "activeConnectionAttempt");
        objc_msgSend(v55, "setConnectionAttemptCount:", (char *)objc_msgSend(v55, "connectionAttemptCount") + 1);
        -[CLDurianDeviceManager connectToPeripheral:withOptions:andTimeout:](self, "connectToPeripheral:withOptions:andTimeout:", v6, v13, a5);
        return;
      }
      v41 = objc_msgSend(a3, "maintenanceOnlyCondition");
      v42 = 65542;
      v43 = 65543;
    }
    else
    {
      if (v39)
      {
        if (objc_msgSend(a3, "maintenanceOnlyCondition"))
          v40 = 65537;
        else
          v40 = 0x10000;
        goto LABEL_102;
      }
      if ((objc_msgSend(a3, "isTAAISDevice") & 1) != 0)
      {
        v40 = 65560;
        goto LABEL_102;
      }
      v41 = objc_msgSend(a3, "maintenanceOnlyCondition");
      v42 = 65540;
      v43 = 65541;
    }
    if (v41)
      v40 = v43;
    else
      v40 = v42;
    goto LABEL_102;
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v9 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    v64 = 0;
    v65 = 2082;
    v66 = "";
    v67 = 2113;
    v68 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v69 = 2113;
    *(_QWORD *)v70 = objc_msgSend(objc_msgSend(objc_msgSend(v6, "identifier"), "description"), "substringToIndex:", 8);
    v10 = "{\"msg%{public}.0s\":\"#durian #connection failed to retrieve token\", \"item\":%{private, location:escape_onl"
          "y}@, \"periph\":%{private, location:escape_only}@}";
    goto LABEL_6;
  }
}

- (void)connectToPeripheral:(id)a3 withOptions:(id)a4 andTimeout:(unint64_t)a5
{
  -[CBCentralManager connectPeripheral:options:](self->_centralManager, "connectPeripheral:options:", a3, a4, a5);
}

- (void)cancelPeripheralConnection:(id)a3 forUUID:(id)a4
{
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289539;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2113;
    v12 = objc_msgSend(objc_msgSend(a4, "description"), "substringToIndex:", 8);
    v13 = 2113;
    v14 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "identifier"), "description"), "substringToIndex:", 8);
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection cancelling peripheral\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x26u);
  }
  -[CBCentralManager cancelPeripheralConnection:](self->_centralManager, "cancelPeripheralConnection:", a3);
}

- (void)cancelConnectionAttemptToDevice:(id)a3
{
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  void *i;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  id v18;
  id v19;
  id v20;
  __int128 v21;
  CLDurianDeviceManager *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];

  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "possiblePeripherals");
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v25;
    v9 = &qword_1022A0000;
    v10 = &qword_1022A0000;
    *(_QWORD *)&v6 = 68289795;
    v21 = v6;
    v22 = self;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if (v9[6] != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
        v13 = v10[7];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = v7;
          v15 = v8;
          v16 = v10;
          v17 = v9;
          v18 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
          v19 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "identifier"), "description"), "substringToIndex:", 8);
          v20 = objc_msgSend(objc_msgSend(objc_msgSend(v12, "identifier"), "description"), "substringToIndex:", 8);
          *(_DWORD *)buf = v21;
          v29 = 0;
          v30 = 2082;
          v31 = "";
          v32 = 2113;
          v33 = v18;
          v9 = v17;
          v10 = v16;
          v8 = v15;
          v7 = v14;
          self = v22;
          v34 = 2113;
          v35 = v19;
          v36 = 2113;
          v37 = v20;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt periph cancelall\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@}", buf, 0x30u);
        }
        -[CLDurianDeviceManager cancelPeripheralConnection:forUUID:](self, "cancelPeripheralConnection:forUUID:", v12, objc_msgSend(a3, "uuid", v21, v22));
        -[CLDurianDeviceManager cancelConnectionTimeoutForPeripheral:](self, "cancelConnectionTimeoutForPeripheral:", v12);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
    }
    while (v7);
  }
}

- (void)cancelActiveConnectionAttemptsExcludingHele:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  id v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];

  v3 = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    v26 = 1026;
    LODWORD(v27) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection cancelling active attempts\", \"excludeHele\":%{public}hhd}", buf, 0x18u);
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v19;
    *(_QWORD *)&v8 = 68289283;
    v17 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11);
        if (!v3
          || (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11), "isHeleAccessory") & 1) == 0)
        {
          if (objc_msgSend(objc_msgSend(v12, "activeConnectionAttempt", v17), "state") == (id)1)
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BCA48);
            v13 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v14 = objc_msgSend(objc_msgSend(objc_msgSend(v12, "uuid"), "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = v17;
              v23 = 0;
              v24 = 2082;
              v25 = "";
              v26 = 2113;
              v27 = v14;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection cancelling ongoing connection attempt\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
            -[CLDurianDeviceManager cancelConnectionAttemptToDevice:](self, "cancelConnectionAttemptToDevice:", v12);
          }
          else
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BCA48);
            v15 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v16 = objc_msgSend(objc_msgSend(objc_msgSend(v12, "uuid"), "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = v17;
              v23 = 0;
              v24 = 2082;
              v25 = "";
              v26 = 2113;
              v27 = v16;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection not cancelling attempt, none pending\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
          }
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v9);
  }
}

- (void)reconnectDevice:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  unsigned int v8;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  unsigned int v16;

  if (a3)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v5 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 68289283;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2113;
      v14 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection reconnect device\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);
    }
    if (objc_msgSend(a3, "isConnected"))
    {
      objc_msgSend(a3, "setReconnecting:", 1);
      -[CLDurianDeviceManager disconnectDevice:](self, "disconnectDevice:", a3);
    }
    else
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      v6 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
        v8 = objc_msgSend(a3, "reconnecting");
        v9 = 68289539;
        v10 = 0;
        v11 = 2082;
        v12 = "";
        v13 = 2113;
        v14 = v7;
        v15 = 1025;
        v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection device to be reconnected has already disconnected\", \"item\":%{private, location:escape_only}@, \"reconnect\":%{private}hhd}", (uint8_t *)&v9, 0x22u);
      }
    }
  }
}

- (void)restartMaintenanceConnections
{
  NSObject *v3;
  NSMutableSet *devicesBeingMaintained;
  _BOOL4 maintDiscoveryPending;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t buf;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSMutableSet *v20;
  __int16 v21;
  _BOOL4 v22;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    devicesBeingMaintained = self->_devicesBeingMaintained;
    maintDiscoveryPending = self->_maintDiscoveryPending;
    buf = 68289539;
    v17 = 2082;
    v18 = "";
    v19 = 2113;
    v20 = devicesBeingMaintained;
    v21 = 1025;
    v22 = maintDiscoveryPending;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint restart\", \"devices\":%{private, location:escape_only}@, \"discovery\":%{private}hhd}", (uint8_t *)&buf, 0x22u);
  }
  if (!self->_maintDiscoveryPending)
  {
    self->_maintDutyCycleUpgrade = 1;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_devicesBeingMaintained;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          -[CLDurianDeviceManager restartConnectionAttemptToDevice:](self, "restartConnectionAttemptToDevice:", -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i)));
        }
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
    -[CLDurianMaintenanceUtilities takeMaintenancePowerAssertion](self->_maintUtils, "takeMaintenancePowerAssertion");
  }
}

- (void)restartConnectionAttemptToDevice:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  unsigned int v17;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 68289539;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2113;
    v15 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v16 = 1026;
    v17 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "possiblePeripherals"), "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection restart, cancelling peripherals\", \"item\":%{private, location:escape_only}@, \"periphs\":%{public}d}", (uint8_t *)&v10, 0x22u);
  }
  if (objc_msgSend(a3, "activeConnectionAttempt"))
  {
    objc_msgSend(a3, "setPendingConnectionAttempt:", objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "inertCopy"));
    if (-[NSMutableDictionary count](self->_connectionTimeoutBlocks, "count"))
      -[CLDurianDeviceManager cancelConnectionAttemptToDevice:](self, "cancelConnectionAttemptToDevice:", a3);
    else
      -[CLDurianDeviceManager activatePendingConnectionAttemptForDevice:](self, "activatePendingConnectionAttemptForDevice:", a3);
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v6 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      v10 = 68289283;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2113;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #connection tried to restart nil active attempt\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v10, 0x1Cu);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    }
    v8 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v9 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      v10 = 68289283;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2113;
      v15 = v9;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #connection tried to restart nil active attempt", "{\"msg%{public}.0s\":\"#durian #connection tried to restart nil active attempt\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (void)scheduleConnectionTimeout:(int64_t)a3 toDevice:(id)a4 forPeripeheral:(id)a5
{
  dispatch_time_t v8;
  dispatch_block_t v9;
  _QWORD block[7];

  v8 = dispatch_walltime(0, 1000000000 * a3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_101524E98;
  block[3] = &unk_10212BBA8;
  block[4] = a4;
  block[5] = a5;
  block[6] = self;
  v9 = dispatch_block_create((dispatch_block_flags_t)0, block);
  dispatch_after(v8, (dispatch_queue_t)self->_queue, v9);
  -[NSMutableDictionary setObject:forKey:](self->_connectionTimeoutBlocks, "setObject:forKey:", v9, a5);
  _Block_release(v9);
}

- (void)cancelConnectionTimeoutForPeripheral:(id)a3
{
  id v5;

  v5 = -[NSMutableDictionary objectForKey:](self->_connectionTimeoutBlocks, "objectForKey:");
  if (v5)
  {
    dispatch_block_cancel(v5);
    -[NSMutableDictionary removeObjectForKey:](self->_connectionTimeoutBlocks, "removeObjectForKey:", a3);
  }
}

- (id)deviceWithPossiblePeripheral:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend(objc_msgSend(objc_msgSend(v9, "activeConnectionAttempt"), "possiblePeripherals"), "containsObject:", a3) & 1) != 0)return v9;
    if (v6 == (id)++v8)
    {
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)activatePendingConnectionAttemptForDevice:(id)a3
{
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *queue;
  _QWORD v8[6];
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2113;
    v14 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection activate pending\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  objc_msgSend(a3, "setActiveConnectionAttempt:", objc_msgSend(a3, "pendingConnectionAttempt"));
  objc_msgSend(a3, "setPendingConnectionAttempt:", 0);
  v6 = dispatch_time(0, 1000000000);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_101525290;
  v8[3] = &unk_10212BB30;
  v8[4] = self;
  v8[5] = a3;
  dispatch_after(v6, queue, v8);
}

- (void)failedToConnectToPossiblePeripheral:(id)a3 withErrorCode:(int64_t)a4
{
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  _BOOL4 v13;
  NSObject *v14;
  id v15;
  _BOOL4 v17;
  dispatch_time_t v18;
  NSObject *queue;
  CLDurianDeviceManager *v20;
  void *v21;
  uint64_t v22;
  _QWORD block[7];
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  unsigned int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  _BOOL4 v43;
  __int16 v44;
  _BOOL4 v45;
  __int16 v46;
  int v47;

  v7 = -[CLDurianDeviceManager deviceWithPossiblePeripheral:](self, "deviceWithPossiblePeripheral:");
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, "activeConnectionAttempt");
    if (objc_msgSend(v8, "pendingConnectionAttempt"))
      v10 = objc_msgSend(v8, "pendingConnectionAttempt");
    else
      v10 = objc_msgSend(v8, "activeConnectionAttempt");
    v12 = objc_msgSend(objc_msgSend(v10, "possiblePeripherals"), "count");
    if (-[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", objc_msgSend(v8, "uuid")))v13 = self->_maintDutyCycleUpgrade != 1;
    else
      v13 = 0;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v14 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68291587;
      v26 = 2082;
      v25 = 0;
      v27 = "";
      v28 = 2113;
      v29 = objc_msgSend(objc_msgSend(objc_msgSend(v8, "uuid"), "description"), "substringToIndex:", 8);
      v30 = 2113;
      v31 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v8, "activeConnectionAttempt"), "identifier"), "description"), "substringToIndex:", 8);
      v32 = 2113;
      v33 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "identifier"), "description"), "substringToIndex:", 8);
      v34 = 1026;
      v35 = objc_msgSend(v8, "isConnected");
      v36 = 1026;
      v37 = objc_msgSend(v9, "state");
      v38 = 1026;
      v39 = (int)v12;
      v40 = 1026;
      v41 = objc_msgSend(v8, "pendingConnectionAttempt") != 0;
      v42 = 1026;
      v43 = a4 == 14;
      v44 = 1026;
      v45 = v13;
      v46 = 1026;
      v47 = a4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt periph failure\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"connected\":%{public}hhd, \"state\":%{public}d, \"periphs\":%{public}d, \"pending\":%{public}hhd, \"capped\":%{public}hhd, \"maint\":%{public}hhd, \"error\":%{public}d}", buf, 0x5Au);
    }
    v15 = objc_msgSend(v8, "pendingConnectionAttempt");
    v17 = a4 == 14 && v15 == 0 && v13;
    if (!v17 || v12 != (id)1 || !-[CLDurianDeviceManager shouldEvictForDevice:](self, "shouldEvictForDevice:", v8))
    {
      if (objc_msgSend(v8, "pendingConnectionAttempt"))
        objc_msgSend(v8, "removePossiblePeripheral:", a3);
      else
        objc_msgSend(v9, "popConnectionMaterialForPeripheral:", a3);
      if ((objc_msgSend(v8, "isConnected") & 1) == 0 && objc_msgSend(v9, "state") != (id)3)
      {
        v18 = dispatch_time(0, 1250000000);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1015257B4;
        block[3] = &unk_10212BBA8;
        block[4] = self;
        block[5] = v8;
        block[6] = a3;
        dispatch_after(v18, queue, block);
        return;
      }
      objc_msgSend(v8, "setReconnecting:", 0);
      if ((objc_msgSend(v8, "isConnected") & 1) == 0 && objc_msgSend(v9, "state") == (id)3)
      {
        if (objc_msgSend(v8, "pendingConnectionAttempt"))
        {
          -[CLDurianDeviceManager activatePendingConnectionAttemptForDevice:](self, "activatePendingConnectionAttemptForDevice:", v8);
          return;
        }
        -[CLDurianDeviceManager sendObservationForDevice:type:includeLocation:](self, "sendObservationForDevice:type:includeLocation:", v8, 3, 0);
        if (v13)
        {
          if (a4 == 14)
          {
            -[CLDurianDeviceManager finishMaintainingDevice:withReason:andCategory:](self, "finishMaintainingDevice:withReason:andCategory:", v8, CFSTR("capped"), 0);
            v20 = self;
            v21 = v8;
            v22 = 18;
LABEL_45:
            -[CLDurianDeviceManager connectFailedToDevice:withError:](v20, "connectFailedToDevice:withError:", v21, v22);
            return;
          }
          if (a4 == 47)
          {
            -[CLDurianDeviceManager finishMaintainingDevice:withReason:andCategory:](self, "finishMaintainingDevice:withReason:andCategory:", v8, CFSTR("limitExceeded"), 1);
            goto LABEL_42;
          }
          -[CLDurianDeviceManager finishMaintainingDevice:withReason:andCategory:](self, "finishMaintainingDevice:withReason:andCategory:", v8, CFSTR("cantconnect"), 1);
        }
        else if (a4 == 47)
        {
LABEL_42:
          v20 = self;
          v21 = v8;
          v22 = 47;
          goto LABEL_45;
        }
        v20 = self;
        v21 = v8;
        v22 = 3;
        goto LABEL_45;
      }
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v11 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289539;
      v25 = 0;
      v26 = 2082;
      v27 = "";
      v28 = 2113;
      v29 = objc_msgSend(objc_msgSend(objc_msgSend(0, "uuid"), "description"), "substringToIndex:", 8);
      v30 = 2113;
      v31 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "identifier"), "description"), "substringToIndex:", 8);
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection failed to connect unrecognized peripheral\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@}", buf, 0x26u);
    }
  }
}

- (void)restartActiveConnectionAttempts
{
  NSObject *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t buf;
  __int16 v16;
  const char *v17;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289026;
    v16 = 2082;
    v17 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection restarting all active attempts\"}", (uint8_t *)&buf, 0x12u);
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isAttemptingConnection"))
          -[CLDurianDeviceManager restartConnectionAttemptToDevice:](self, "restartConnectionAttemptToDevice:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

- (void)connectFailedToDevice:(id)a3 withError:(int64_t)a4
{
  objc_msgSend(a3, "handleFailureToConnectWithError:", a4);
}

- (int64_t)getStateForCentral:(id)a3
{
  return (int64_t)objc_msgSend(a3, "state");
}

- (void)centralManagerDidUpdateState:(id)a3
{
  -[CLDurianDeviceManager handleCentralManagerStateUpdate:](self, "handleCentralManagerStateUpdate:", -[CLDurianDeviceManager getStateForCentral:](self, "getStateForCentral:", a3));
}

- (void)handleCentralManagerStateUpdate:(int64_t)a3
{
  int64_t lastCentralManagerState;
  NSObject *v6;
  int v8;
  int v10;
  BOOL v12;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int64_t v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;

  lastCentralManagerState = self->_lastCentralManagerState;
  self->_lastCentralManagerState = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290051;
    v26 = 0;
    v27 = 2082;
    v28 = "";
    v29 = 2049;
    v30 = a3;
    v31 = 2049;
    v32 = lastCentralManagerState;
    v33 = 2049;
    v34 = -[CLDurianDeviceManager countMaintainableDevices](self, "countMaintainableDevices");
    v35 = 2049;
    v36 = -[CLDurianDeviceManager onlyHeleMaintainableDevices](self, "onlyHeleMaintainableDevices");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian CBCentralManager updated state\", \"state\":%{private}ld, \"prev\":%{private}ld, \"devices\":%{private}ld, \"heleonly\":%{private}ld}", buf, 0x3Au);
  }
  v8 = lastCentralManagerState == 5 || lastCentralManagerState == 10;
  v10 = a3 == 5 || a3 == 10;
  if (v10 != v8)
    -[CLDurianDeviceManager checkMaintainableDevices:](self, "checkMaintainableDevices:");
  v12 = a3 == 5 && lastCentralManagerState == 10;
  if ((lastCentralManagerState != 5 || a3 != 10) && !v12)
  {
    -[CLDurianDeviceManager resetDeviceConnections:](self, "resetDeviceConnections:", CFSTR("cbstate"));
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator", 0);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          if (lastCentralManagerState == 10 || lastCentralManagerState == 5)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "setActivePeripheral:", 0);
            objc_msgSend(v19, "setDisconnectionReason:", CFSTR("Reset"));
            objc_msgSend(v19, "failAllTasksWithError:", 5);
            objc_msgSend(v19, "removeAllPossiblePeripherals");
            objc_msgSend(v19, "setLastDisconnectionTime:", -[CLDurianDeviceManager getMachContinuousTime](self, "getMachContinuousTime"));
          }
          if (a3 != 5)
          {
            if (objc_msgSend(v19, "firmwareUpdateMode"))
              objc_msgSend(v19, "handleDisconnectionDuringFirmwareUpdate");
            if (objc_msgSend(v19, "isHeleAccessory"))
            {
              if (objc_msgSend(v19, "isClassicallyConnected"))
              {
                objc_msgSend(v19, "setLastGroupClassicDisconnectionTime:", mach_continuous_time());
                objc_msgSend(v19, "setIsClassicallyConnected:", 0);
              }
            }
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v16);
    }
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  NSObject *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator", a3, 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(objc_msgSend(objc_msgSend(v11, "activeConnectionAttempt"), "possiblePeripherals"), "containsObject:", a4) & 1) != 0)
        {
          -[CLDurianDeviceManager handleConnectedPeripheral:forDevice:](self, "handleConnectedPeripheral:forDevice:", a4, v11);
          return;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
      if (v8)
        continue;
      break;
    }
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v12 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "identifier"), "description"), "substringToIndex:", 8);
    *(_DWORD *)buf = 68289283;
    v19 = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2113;
    v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian unable to find device for connected peripheral!\", \"periph\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
}

- (void)handleConnectedPeripheral:(id)a3 forDevice:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  NSString *v15;
  NSObject *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  unint64_t v26;
  NSObject *v27;
  id v28;
  unsigned int v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  _BYTE v47[10];
  const char *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  _BYTE v55[128];

  v7 = objc_msgSend(a4, "activeConnectionAttempt");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = objc_msgSend(v7, "possiblePeripherals");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v55, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(objc_msgSend(a3, "identifier"), "isEqual:", objc_msgSend(v13, "identifier")) & 1) == 0)
        {
          -[CLDurianDeviceManager cancelPeripheralConnection:forUUID:](self, "cancelPeripheralConnection:forUUID:", v13, objc_msgSend(a4, "uuid"));
          -[CLDurianDeviceManager cancelConnectionTimeoutForPeripheral:](self, "cancelConnectionTimeoutForPeripheral:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v55, 16);
    }
    while (v10);
  }
  v14 = objc_msgSend(v7, "nextConnectionMaterialForPeripheral:", a3);
  objc_msgSend(a4, "setActivePeripheralMaterial:", v14);
  v15 = sub_10024882C(objc_msgSend(v14, "address"));
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v16 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v33 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "uuid"), "description"), "substringToIndex:", 8);
    v32 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "identifier"), "description"), "substringToIndex:", 8);
    v17 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "identifier"), "description"), "substringToIndex:", 8);
    v18 = -[NSString UTF8String](v15, "UTF8String");
    v19 = objc_msgSend(objc_msgSend(v14, "primaryIndex"), "unsignedIntValue");
    v20 = objc_msgSend(objc_msgSend(v14, "secondaryIndex"), "unsignedIntValue");
    objc_msgSend(v7, "attemptDuration");
    *(_DWORD *)buf = 68290819;
    v39 = 0;
    v40 = 2082;
    v41 = "";
    v42 = 2113;
    v43 = v33;
    v44 = 2113;
    v45 = (unint64_t)v32;
    v46 = 2113;
    *(_QWORD *)v47 = v17;
    *(_WORD *)&v47[8] = 2082;
    v48 = v18;
    v49 = 2050;
    v50 = v19;
    v51 = 2050;
    v52 = v20;
    v53 = 2050;
    v54 = v21;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt success\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"address\":%{public, location:escape_only}s, \"primaryIndex\":%{public}lu, \"secondaryIndex\":%{public}lu, \"ttc\":\"%{public}.1f\"}", buf, 0x58u);
  }
  objc_msgSend(a4, "intervalSinceLastSearchPartyKeyObservation");
  +[CLDurianMetricManager submitConnectionAttemptSuccessEvent:krMaterial:connectionReason:deviceType:](CLDurianMetricManager, "submitConnectionAttemptSuccessEvent:krMaterial:connectionReason:deviceType:", objc_msgSend(objc_msgSend(objc_msgSend(a4, "activeConnectionAttempt"), "krMaterials"), "containsObject:", v14), objc_msgSend(a4, "getConnectionReason"), objc_msgSend(a4, "prettyBeaconType"), v22);
  objc_msgSend(a4, "transitionToState:event:task:", 3, 6, 0);
  objc_msgSend(a4, "setActivePeripheral:", a3);
  objc_msgSend(a4, "setReconnecting:", 0);
  -[CLDurianDeviceManager scheduleConnectionEvaluationForDevice:](self, "scheduleConnectionEvaluationForDevice:", a4);
  -[CLDurianDeviceManager sendObservationForDevice:type:includeLocation:](self, "sendObservationForDevice:type:includeLocation:", a4, 1, 1);
  v23 = objc_msgSend(a4, "isLeashSlotInUse");
  v24 = -[CLDurianDeviceManager getNearOwnerTimeoutForDevice:checkingForNetwork:checkingHele:](self, "getNearOwnerTimeoutForDevice:checkingForNetwork:checkingHele:", a4, 1, 1);
  objc_msgSend(a4, "setNearOwnerTimeout:", v24);
  -[CLDurianDeviceManager setKeyRollIntervalForDevice:](self, "setKeyRollIntervalForDevice:", a4);
  if (v23)
  {
    -[CLDurianDeviceManager finishMaintainingDevice:withReason:andCategory:](self, "finishMaintainingDevice:withReason:andCategory:", a4, CFSTR("leashed"), 3);
    -[CLDurianDeviceManager sendSeparationStateForDevice:state:includeLocation:](self, "sendSeparationStateForDevice:state:includeLocation:", a4, SPTagSeparationStateLeashConnected, 0);
    -[CLDurianDeviceDelegate onConnectionStateChangeForDeviceWithUUID:fromState:toState:](self->_deviceDelegate, "onConnectionStateChangeForDeviceWithUUID:fromState:toState:", objc_msgSend(a4, "uuid"), 0, 4);
    v25 = -[CLDurianDeviceManager shouldHoldLeashForDevice:](self, "shouldHoldLeashForDevice:", a4);
    v26 = -[CLDurianDeviceManager totalConnectionCount](self, "totalConnectionCount");
    if (objc_msgSend(a4, "leashNeedsConfiguring"))
    {
      if (objc_msgSend(a4, "nearOwnerTimeoutOverride"))
        v24 = v24;
      else
        v24 = 15;
    }
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v27 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v28 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "uuid"), "description"), "substringToIndex:", 8);
      v29 = objc_msgSend(a4, "leashState");
      *(_DWORD *)buf = 68290307;
      v39 = 0;
      v40 = 2082;
      v41 = "";
      v42 = 2113;
      v43 = v28;
      v44 = 2050;
      v45 = v26;
      v46 = 1026;
      *(_DWORD *)v47 = v25;
      *(_WORD *)&v47[4] = 1026;
      *(_DWORD *)&v47[6] = v29 != 0;
      LOWORD(v48) = 1026;
      *(_DWORD *)((char *)&v48 + 2) = v24;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #leash configuring\", \"item\":%{private, location:escape_only}@, \"totalConnectionCount\":%{public}lu, \"shouldHoldLeash\":%{public}hhd, \"leashstate\":%{public}hhd, \"nearowner\":%{public}d}", buf, 0x38u);
    }
    if (objc_msgSend(a4, "leashNeedsConfiguring"))
    {
      objc_msgSend(a4, "enqueueTask:", objc_msgSend(a4, "createSetNearOwnerTimeoutTaskInSeconds:", v24));
      objc_msgSend(a4, "enqueueTask:", objc_msgSend(a4, "createSetPersistentConnectionTaskWithState:", 1));
      objc_msgSend(a4, "setLeashState:", 3);
    }
  }
  else
  {
    -[CLDurianDeviceManager finishMaintainingDevice:withReason:andCategory:](self, "finishMaintainingDevice:withReason:andCategory:", a4, CFSTR("performed"), 3);
    -[CLDurianDeviceManager sendSeparationStateForDevice:state:includeLocation:](self, "sendSeparationStateForDevice:state:includeLocation:", a4, SPTagSeparationStateConnected, 0);
    -[CLDurianDeviceDelegate onConnectionStateChangeForDeviceWithUUID:fromState:toState:](self->_deviceDelegate, "onConnectionStateChangeForDeviceWithUUID:fromState:toState:", objc_msgSend(a4, "uuid"), 0, 2);
  }
  if (objc_msgSend(a4, "shouldDiscoverHawkeyeServices"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v30 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v39 = 0;
      v40 = 2082;
      v41 = "";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian cancelling connection timeout and discovering #hawkeye services\"}", buf, 0x12u);
    }
    objc_msgSend(a4, "discoverHawkeyeService");
  }
  if (objc_msgSend(a4, "shouldDiscoverPoshServices"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v31 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v39 = 0;
      v40 = 2082;
      v41 = "";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian cancelling connection timeout and discovering #posh services\"}", buf, 0x12u);
    }
    objc_msgSend(a4, "discoverPoshService");
  }
}

- (void)centralManager:(id)a3 canSendDataToPeripheral:(id)a4
{
  NSObject *v6;
  id v7;
  NSObject *v8;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;

  if (objc_msgSend(-[CLDurianDeviceManager deviceWithActivePeripheral:](self, "deviceWithActivePeripheral:", a4), "isHawkeyeAccessory"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v6 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 68289026;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye canSendDataToPeripheral, unexpected\"}", (uint8_t *)&v9, 0x12u);
    }
  }
  else
  {
    v7 = -[CLDurianDeviceManager deviceWithActivePeripheral:](self, "deviceWithActivePeripheral:", a4);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 68289539;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2113;
      v14 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "uuid"), "description"), "substringToIndex:", 8);
      v15 = 2113;
      v16 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "identifier"), "description"), "substringToIndex:", 8);
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian canSendDataToPeripheral\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@}", (uint8_t *)&v9, 0x26u);
    }
    if (objc_msgSend(v7, "shouldActivateDevicePostConnection"))
      objc_msgSend(v7, "activate");
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8;
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;

  v8 = -[CLDurianDeviceManager deviceWithActivePeripheral:](self, "deviceWithActivePeripheral:", a4);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v9 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 68289795;
    v10[1] = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2113;
    v14 = objc_msgSend(objc_msgSend(objc_msgSend(v8, "uuid"), "description"), "substringToIndex:", 8);
    v15 = 2113;
    v16 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "identifier"), "description"), "substringToIndex:", 8);
    v17 = 2113;
    v18 = objc_msgSend(a5, "localizedDescription");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection failed\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)v10, 0x30u);
  }
  -[CLDurianDeviceManager handleConnectionFailureForPeripheral:withErrorCode:](self, "handleConnectionFailureForPeripheral:withErrorCode:", a4, objc_msgSend(a5, "code"));
}

- (void)handleConnectionFailureForPeripheral:(id)a3 withErrorCode:(int64_t)a4
{
  -[CLDurianDeviceManager cancelConnectionTimeoutForPeripheral:](self, "cancelConnectionTimeoutForPeripheral:");
  -[CLDurianDeviceManager failedToConnectToPossiblePeripheral:withErrorCode:](self, "failedToConnectToPossiblePeripheral:withErrorCode:", a3, a4);
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  -[CLDurianDeviceManager handleDisconnectedPeripheral:withError:](self, "handleDisconnectedPeripheral:withError:", a4, a5);
}

- (void)handleDisconnectedPeripheral:(id)a3 withError:(id)a4
{
  id v7;
  NSObject *v8;
  CLDurianDeviceDelegate *deviceDelegate;
  id v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint64_t v13;
  NSDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  char v25;
  id v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  unsigned int v31;
  NSErrorUserInfoKey v32;
  const __CFString *v33;
  NSErrorUserInfoKey v34;
  const __CFString *v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;

  -[CLDurianDeviceManager cancelConnectionTimeoutForPeripheral:](self, "cancelConnectionTimeoutForPeripheral:");
  v7 = -[CLDurianDeviceManager deviceWithActivePeripheral:](self, "deviceWithActivePeripheral:", a3);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289795;
    v37 = 0;
    v38 = 2082;
    v39 = "";
    v40 = 2113;
    v41 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "uuid"), "description"), "substringToIndex:", 8);
    v42 = 2113;
    v43 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "identifier"), "description"), "substringToIndex:", 8);
    v44 = 2113;
    v45 = objc_msgSend(a4, "localizedDescription");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection disconnected peripheral\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x30u);
  }
  if (!v7)
  {
    -[CLDurianDeviceManager failedToConnectToPossiblePeripheral:withErrorCode:](self, "failedToConnectToPossiblePeripheral:withErrorCode:", a3, 5);
    return;
  }
  deviceDelegate = self->_deviceDelegate;
  v10 = objc_msgSend(v7, "uuid");
  if (objc_msgSend(v7, "isLeashSlotInUse"))
    v11 = 4;
  else
    v11 = 2;
  -[CLDurianDeviceDelegate onConnectionStateChangeForDeviceWithUUID:fromState:toState:](deviceDelegate, "onConnectionStateChangeForDeviceWithUUID:fromState:toState:", v10, v11, 0);
  v12 = objc_msgSend(v7, "activePeripheralReady");
  if (a4 || (v12 & 1) != 0)
  {
    if (a4)
      goto LABEL_16;
    v17 = kCLErrorDomainPrivate;
    v32 = NSLocalizedDescriptionKey;
    v33 = sub_101536DEC(5uLL);
    v14 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v15 = v17;
    v16 = 5;
  }
  else
  {
    v13 = kCLErrorDomainPrivate;
    v34 = NSLocalizedDescriptionKey;
    v35 = sub_101536DEC(0x14uLL);
    v14 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v15 = v13;
    v16 = 20;
  }
  a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v15, v16, v14);
LABEL_16:
  -[CLDurianDeviceManager cancelConnectionEvaluationForDevice:](self, "cancelConnectionEvaluationForDevice:", v7);
  -[CLDurianDeviceManager sendObservationForDevice:type:includeLocation:](self, "sendObservationForDevice:type:includeLocation:", v7, 3, 1);
  objc_msgSend(v7, "transitionToState:event:task:", 0, 10, 0);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v18 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "uuid"), "description"), "substringToIndex:", 8);
    v20 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "identifier"), "description"), "substringToIndex:", 8);
    *(_DWORD *)buf = 68289539;
    v37 = 0;
    v38 = 2082;
    v39 = "";
    v40 = 2113;
    v41 = v19;
    v42 = 2113;
    v43 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian ensuring event counter off for peripheral upon stop\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@}", buf, 0x26u);
  }
  objc_msgSend(v7, "stopEventCounter");
  objc_msgSend(v7, "setActivePeripheral:withError:", 0, a4);
  objc_msgSend(v7, "removeAllPossiblePeripherals");
  if (objc_msgSend(v7, "reconnecting"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v21 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "uuid"), "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289283;
      v37 = 0;
      v38 = 2082;
      v39 = "";
      v40 = 2113;
      v41 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection disconnected reconnecting peripheral, kicking off reconnect\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    objc_msgSend(v7, "setReconnecting:", 0);
    -[CLDurianDeviceManager attemptConnectionToDevice:](self, "attemptConnectionToDevice:", v7);
  }
  if (!objc_msgSend(v7, "firmwareUpdateMode"))
    goto LABEL_30;
  if (!objc_msgSend(v7, "firmwareUpdateReboot"))
  {
    objc_msgSend(v7, "setDisconnectionReason:", CFSTR("FWDL:Failure"));
    objc_msgSend(v7, "handleDisconnectionDuringFirmwareUpdate");
LABEL_30:
    objc_msgSend(v7, "sendDisconnectionMetric");
    objc_msgSend(v7, "setQuarterHourDisconnect:", -[CLDurianDeviceManager getQuarterHour](self, "getQuarterHour"));
    goto LABEL_31;
  }
  objc_msgSend(v7, "setDisconnectionReason:", CFSTR("FWDL:Success"));
  -[CLDurianDeviceManager attemptConnectionToDevice:](self, "attemptConnectionToDevice:", v7);
  objc_msgSend(v7, "sendDisconnectionMetric");
  objc_msgSend(v7, "setQuarterHourDisconnect:", -[CLDurianDeviceManager getQuarterHour](self, "getQuarterHour"));
  objc_msgSend(v7, "setConnectionReason:", CFSTR("FWDL:Reboot"));
LABEL_31:
  objc_msgSend(v7, "failAllTasksWithError:", 5);
  if (objc_msgSend(v7, "isLeashSlotInUse"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v23 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "uuid"), "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289283;
      v37 = 0;
      v38 = 2082;
      v39 = "";
      v40 = 2113;
      v41 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian leashing enabled, so enqueuing leash task after disconnect\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    -[CLDurianDeviceManager sendSeparationStateForDevice:state:includeLocation:](self, "sendSeparationStateForDevice:state:includeLocation:", v7, SPTagSeparationStateLeashInterrupted, 0);
    +[NSDate date](NSDate, "date");
    -[CLDurianLocationMonitor fetchEstimatedLocationAtDate:handler:](self->_locationMonitor, "fetchEstimatedLocationAtDate:handler:");
    v25 = 0;
    if (+[CLDurianSettings reconnectAfterLeashFailure](CLDurianSettings, "reconnectAfterLeashFailure"))
    {
      objc_msgSend(v7, "setConnectionReason:", CFSTR("Leash:Defaults"));
      -[CLDurianDeviceManager attemptConnectionToDevice:](self, "attemptConnectionToDevice:", v7);
      v25 = 1;
      objc_msgSend(v7, "enqueueTask:", objc_msgSend(v7, "createSetPersistentConnectionTaskWithState:", 1));
    }
  }
  else
  {
    -[CLDurianDeviceManager sendSeparationStateForDevice:state:includeLocation:](self, "sendSeparationStateForDevice:state:includeLocation:", v7, SPTagSeparationStateNone, 0);
    v25 = 0;
  }
  objc_msgSend(v7, "setLastProactiveMaintenanceTime:", mach_continuous_time());
  v26 = -[NSMutableDictionary objectForKeyedSubscript:](self->_maintenanceEvictionMap, "objectForKeyedSubscript:", objc_msgSend(v7, "uuid"));
  if ((v25 & 1) == 0)
  {
    v27 = v26;
    if (v26)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_maintenanceEvictionMap, "removeObjectForKey:", objc_msgSend(v7, "uuid"));
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      v28 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v29 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "uuid"), "description"), "substringToIndex:", 8);
        v30 = objc_msgSend(objc_msgSend(v27, "description"), "substringToIndex:", 8);
        v31 = -[NSMutableDictionary count](self->_maintenanceEvictionMap, "count");
        *(_DWORD *)buf = 68289795;
        v37 = 0;
        v38 = 2082;
        v39 = "";
        v40 = 2113;
        v41 = v29;
        v42 = 2113;
        v43 = v30;
        v44 = 1026;
        LODWORD(v45) = v31;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint capped evicting\", \"item\":%{private, location:escape_only}@, \"retry\":%{private, location:escape_only}@, \"evictcount\":%{public}d}", buf, 0x2Cu);
      }
      -[CLDurianDeviceManager dispatchCompleteTokenFetchOnUUID:](self, "dispatchCompleteTokenFetchOnUUID:", v27);
    }
  }
}

- (void)dispatchCompleteTokenFetchOnUUID:(id)a3
{
  dispatch_time_t v5;
  NSObject *queue;
  _QWORD v7[6];

  v5 = dispatch_time(0, 1250000000);
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10152733C;
  v7[3] = &unk_10212BB30;
  v7[4] = self;
  v7[5] = a3;
  dispatch_after(v5, queue, v7);
}

- (void)scheduleDisconnectionOnMissingBeaconWithUUID:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  const char *v8;
  const char *v9;
  const char *v10;
  unsigned int v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  const char *v16;
  const char *v17;
  NSObject *v18;
  dispatch_time_t v19;
  dispatch_block_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  _QWORD block[7];
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  unsigned int v49;

  v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v30 = objc_msgSend(objc_msgSend(objc_msgSend(v5, "uuid"), "description"), "substringToIndex:", 8);
    v29 = objc_msgSend(objc_msgSend(objc_msgSend(v5, "uuid"), "description"), "substringToIndex:", 8);
    v7 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v5, "activePeripheral"), "identifier"), "description"), "substringToIndex:", 8);
    v8 = "NO";
    if (objc_msgSend(v5, "isConnected"))
      v9 = "YES";
    else
      v9 = "NO";
    if (objc_msgSend(v5, "isTaskQueueEmpty"))
      v10 = "YES";
    else
      v10 = "NO";
    if (objc_msgSend(v5, "pendingDisconnect"))
      v8 = "YES";
    v11 = -[NSMutableDictionary count](self->_scheduledDisconnectionBlocks, "count");
    *(_DWORD *)buf = 68290819;
    v33 = 0;
    v34 = 2082;
    v35 = "";
    v36 = 2113;
    v37 = v30;
    v38 = 2113;
    v39 = v29;
    v40 = 2113;
    v41 = v7;
    v42 = 2082;
    v43 = v9;
    v44 = 2082;
    v45 = v10;
    v46 = 2082;
    v47 = v8;
    v48 = 1026;
    v49 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #disconnectbackstop schedule missing beacon disconnection backstop\", \"item\":%{private, location:escape_only}@, \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"isConnected\":%{public, location:escape_only}s, \"isTaskQueueEmpty\":%{public, location:escape_only}s, \"pendingDisconnect\":%{public, location:escape_only}s, \"devicesScheduledDisconnection\":%{public}d}", buf, 0x54u);
  }
  if (-[NSMutableDictionary objectForKey:](self->_scheduledDisconnectionBlocks, "objectForKey:", a3))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v12 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(objc_msgSend(objc_msgSend(v5, "uuid"), "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289283;
      v33 = 0;
      v34 = 2082;
      v35 = "";
      v36 = 2113;
      v37 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #disconnectbackstop already scheduled for disconnection\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    }
    v14 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v15 = objc_msgSend(objc_msgSend(objc_msgSend(v5, "uuid"), "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289283;
      v33 = 0;
      v34 = 2082;
      v35 = "";
      v36 = 2113;
      v37 = v15;
      v16 = "#durian #disconnectbackstop already scheduled for disconnection";
      v17 = "{\"msg%{public}.0s\":\"#durian #disconnectbackstop already scheduled for disconnection\", \"item\":%{private"
            ", location:escape_only}@}";
      v18 = v14;
LABEL_21:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v16, v17, buf, 0x1Cu);
    }
  }
  else if (v5)
  {
    if ((objc_msgSend(v5, "pendingDisconnect") & 1) != 0)
    {
      if ((objc_msgSend(v5, "isConnected") & 1) != 0)
      {
        v19 = dispatch_time(0, 10000000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1015279F4;
        block[3] = &unk_10212BBA8;
        block[4] = v5;
        block[5] = self;
        block[6] = a3;
        v20 = dispatch_block_create((dispatch_block_flags_t)0, block);
        dispatch_after(v19, (dispatch_queue_t)self->_queue, v20);
        -[NSMutableDictionary setObject:forKey:](self->_scheduledDisconnectionBlocks, "setObject:forKey:", v20, a3);
        _Block_release(v20);
      }
      else
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
        v27 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
        {
          v28 = objc_msgSend(objc_msgSend(objc_msgSend(v5, "uuid"), "description"), "substringToIndex:", 8);
          *(_DWORD *)buf = 68289283;
          v33 = 0;
          v34 = 2082;
          v35 = "";
          v36 = 2113;
          v37 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #disconnectbackstop device already disconnected device\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
        }
        -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", a3);
      }
    }
    else
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      v25 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
      {
        v26 = objc_msgSend(objc_msgSend(objc_msgSend(v5, "uuid"), "description"), "substringToIndex:", 8);
        *(_DWORD *)buf = 68289283;
        v33 = 0;
        v34 = 2082;
        v35 = "";
        v36 = 2113;
        v37 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #disconnectbackstop disconnection cancelled\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
      }
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v21 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(objc_msgSend(objc_msgSend(0, "uuid"), "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289283;
      v33 = 0;
      v34 = 2082;
      v35 = "";
      v36 = 2113;
      v37 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #disconnectbackstop scheduling disconnection for a non-existent device\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    }
    v23 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v24 = objc_msgSend(objc_msgSend(objc_msgSend(0, "uuid"), "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289283;
      v33 = 0;
      v34 = 2082;
      v35 = "";
      v36 = 2113;
      v37 = v24;
      v16 = "#durian #disconnectbackstop scheduling disconnection for a non-existent device";
      v17 = "{\"msg%{public}.0s\":\"#durian #disconnectbackstop scheduling disconnection for a non-existent device\", \"i"
            "tem\":%{private, location:escape_only}@}";
      v18 = v23;
      goto LABEL_21;
    }
  }
}

- (void)cancelDisconnectionOnMissingBeaconWithUUID:(id)a3
{
  id v5;
  id v6;
  BOOL v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  id v11;
  const char *v12;
  const char *v13;
  const char *v14;
  unsigned int v15;
  _DWORD v16[2];
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  unsigned int v32;

  v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:");
  v6 = -[NSMutableDictionary objectForKey:](self->_scheduledDisconnectionBlocks, "objectForKey:", a3);
  objc_msgSend(v5, "setPendingDisconnect:", 0);
  if (v6)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    dispatch_block_cancel(v6);
    -[NSMutableDictionary removeObjectForKey:](self->_scheduledDisconnectionBlocks, "removeObjectForKey:", objc_msgSend(v5, "uuid"));
  }
  -[CLDurianMetricManager submitUnexpectedMissingBeaconMetrics:disconnected:](self->_metricManager, "submitUnexpectedMissingBeaconMetrics:disconnected:", v5, 0);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v6 != 0;
    v10 = objc_msgSend(objc_msgSend(objc_msgSend(v5, "uuid"), "description"), "substringToIndex:", 8);
    v11 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v5, "activePeripheral"), "identifier"), "description"), "substringToIndex:", 8);
    if (objc_msgSend(v5, "isConnected"))
      v12 = "YES";
    else
      v12 = "NO";
    if (objc_msgSend(v5, "isTaskQueueEmpty"))
      v13 = "YES";
    else
      v13 = "NO";
    if (objc_msgSend(v5, "pendingDisconnect"))
      v14 = "YES";
    else
      v14 = "NO";
    v15 = -[NSMutableDictionary count](self->_scheduledDisconnectionBlocks, "count");
    v16[0] = 68290819;
    v16[1] = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2113;
    v20 = v10;
    v21 = 2113;
    v22 = v11;
    v23 = 1026;
    v24 = v9;
    v25 = 2082;
    v26 = v12;
    v27 = 2082;
    v28 = v13;
    v29 = 2082;
    v30 = v14;
    v31 = 1026;
    v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #disconnectbackstop cancelled missing beacon disconnection backstop timer\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"exists\":%{public}hhd, \"isConnected\":%{public, location:escape_only}s, \"isTaskQueueEmpty\":%{public, location:escape_only}s, \"pendingDisconnect\":%{public, location:escape_only}s, \"devicesScheduledDisconnection\":%{public}d}", (uint8_t *)v16, 0x50u);
  }
}

- (void)centralManager:(id)a3 didSendBytes:(id)a4 toPeripheral:(id)a5 withError:(id)a6
{
  id v8;

  v8 = -[CLDurianDeviceManager deviceWithActivePeripheral:](self, "deviceWithActivePeripheral:", a5);
  if (a6)
    _objc_msgSend(v8, "failedToSendBytes:", a4);
}

- (void)centralManager:(id)a3 didReceiveData:(id)a4 fromPeripheral:(id)a5
{
  id v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;

  v6 = -[CLDurianDeviceManager deviceWithActivePeripheral:](self, "deviceWithActivePeripheral:", a5);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289539;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2113;
    v12 = objc_msgSend(objc_msgSend(objc_msgSend(v6, "uuid"), "description"), "substringToIndex:", 8);
    v13 = 2113;
    v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian received bytes\", \"item\":%{private, location:escape_only}@, \"data\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x26u);
  }
  objc_msgSend(v6, "didReceiveData:", a4);
}

- (void)centralManager:(id)a3 didUpdateConnectionParameters:(id)a4 interval:(id)a5 latency:(id)a6 supervisionTimeout:(id)a7
{
  id v12;
  NSObject *v13;
  _DWORD v14[2];
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  v12 = -[CLDurianDeviceManager deviceWithActivePeripheral:](self, "deviceWithActivePeripheral:", a4);
  if (!v12)
    v12 = -[CLDurianDeviceManager deviceWithPossiblePeripheral:](self, "deviceWithPossiblePeripheral:", a4);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v13 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 68289795;
    v14[1] = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2113;
    v18 = objc_msgSend(objc_msgSend(objc_msgSend(v12, "uuid"), "description"), "substringToIndex:", 8);
    v19 = 2113;
    v20 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "identifier"), "description"), "substringToIndex:", 8);
    v21 = 2114;
    v22 = a5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian didUpdateConnectionParameters\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"latency\":%{public, location:escape_only}@}", (uint8_t *)v14, 0x30u);
  }
  objc_msgSend(v12, "didUpdateConnectionInterval:latency:supervisionTimeout:", a5, a6, a7);
}

- (void)handleKeyFetchTimeoutForDevice:(id)a3
{
  _BOOL4 v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSDictionary *v9;
  id v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  _BOOL4 v20;

  if (a3)
  {
    v5 = (objc_msgSend(a3, "isConnected") & 1) != 0 || (int)objc_msgSend(a3, "numPossiblePeripherals") > 0;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v6 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289539;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2113;
      v18 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      v19 = 1026;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection token fetch timeout fired\", \"item\":%{private, location:escape_only}@, \"skipError\":%{public}hhd}", buf, 0x22u);
    }
    if (!v5)
    {
      v7 = objc_alloc((Class)NSError);
      v8 = kCLErrorDomainPrivate;
      v11 = NSLocalizedDescriptionKey;
      v12 = sub_101536DEC(0x29uLL);
      v9 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
      v10 = objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, 41, v9, v11);
      -[CLDurianDeviceManager didFetchConnectionMaterial:criteria:forDevice:error:](self, "didFetchConnectionMaterial:criteria:forDevice:error:", 0, 0, a3, v10);
      -[NSMutableDictionary removeObjectForKey:](self->_keyFetchTimeoutBlocks, "removeObjectForKey:", objc_msgSend(a3, "uuid"));

    }
  }
}

- (void)centralManager:(id)a3 didUpdateMTUForPeripheral:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;

  v5 = -[CLDurianDeviceManager deviceWithActivePeripheral:](self, "deviceWithActivePeripheral:", a4);
  if (v5)
  {
    v6 = v5;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 68289795;
      v8[1] = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2113;
      v12 = objc_msgSend(objc_msgSend(objc_msgSend(v6, "uuid"), "description"), "substringToIndex:", 8);
      v13 = 2113;
      v14 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "identifier"), "description"), "substringToIndex:", 8);
      v15 = 2049;
      v16 = objc_msgSend(a4, "maximumWriteValueLengthForType:", 1);
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian didUpdateMTUForPeripheral\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"MTUSize\":%{private}lu}", (uint8_t *)v8, 0x30u);
    }
    objc_msgSend(v6, "didUpdateMTUForDevice");
  }
}

- (void)scheduleTokenFetchTimeoutForDevice:(id)a3
{
  NSObject *v5;
  dispatch_time_t v6;
  dispatch_block_t v7;
  _QWORD v8[6];
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2113;
    v14 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection scheduling token fetch timeout\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  -[CLDurianDeviceManager cancelTokenFetchTimeoutForDevice:](self, "cancelTokenFetchTimeoutForDevice:", a3);
  v6 = dispatch_time(0, 2000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1015288F0;
  v8[3] = &unk_10212BB30;
  v8[4] = self;
  v8[5] = a3;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v8);
  -[NSMutableDictionary setObject:forKey:](self->_keyFetchTimeoutBlocks, "setObject:forKey:", v7, objc_msgSend(a3, "uuid"));
  dispatch_after(v6, (dispatch_queue_t)self->_queue, v7);
  _Block_release(v7);
}

- (void)cancelTokenFetchTimeoutForDevice:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  int v14;

  v5 = -[NSMutableDictionary objectForKey:](self->_keyFetchTimeoutBlocks, "objectForKey:", objc_msgSend(a3, "uuid"));
  if (v5)
  {
    v6 = v5;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 68289539;
      v8[1] = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2113;
      v12 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      v13 = 1026;
      v14 = 1;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection cancelling token fetch timeout\", \"item\":%{private, location:escape_only}@, \"scheduledBlock\":%{public}hhd}", (uint8_t *)v8, 0x22u);
    }
    dispatch_block_cancel(v6);
    -[NSMutableDictionary removeObjectForKey:](self->_keyFetchTimeoutBlocks, "removeObjectForKey:", objc_msgSend(a3, "uuid"));
  }
}

- (BOOL)checkIfTwoDevicesHaveSamePeripheral:(id)a3 device:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  _BOOL4 v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *j;
  uint64_t v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  id v39;
  const char *v40;
  const char *v41;
  NSObject *v42;
  id v43;
  id v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  int v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];

  v7 = objc_alloc_init((Class)NSMutableArray);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v8 = -[NSMutableDictionary objectEnumerator](self->_devices, "objectEnumerator");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(objc_msgSend(objc_msgSend(v13, "activeConnectionAttempt"), "possiblePeripherals"), "containsObject:", a3) & 1) == 0)
        {
          v14 = objc_msgSend(objc_msgSend(v13, "activePeripheral"), "identifier");
          if (v14 != objc_msgSend(a3, "identifier"))
            continue;
        }
        objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
    }
    while (v10);
  }
  if (objc_msgSend(v7, "count") != (id)2)
  {
    if ((unint64_t)objc_msgSend(v7, "count") >= 3)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      v17 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
      {
        v18 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "identifier"), "description"), "substringToIndex:", 8);
        *(_DWORD *)buf = 68289283;
        v56 = 0;
        v57 = 2082;
        v58 = "";
        v59 = 2113;
        v60 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian found more than two devices for connected peripheral\", \"periph\":%{private, location:escape_only}@}", buf, 0x1Cu);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      }
      v19 = qword_1022A0038;
      if (os_signpost_enabled((os_log_t)qword_1022A0038))
      {
        v20 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "identifier"), "description"), "substringToIndex:", 8);
        *(_DWORD *)buf = 68289283;
        v56 = 0;
        v57 = 2082;
        v58 = "";
        v59 = 2113;
        v60 = v20;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian found more than two devices for connected peripheral", "{\"msg%{public}.0s\":\"#durian found more than two devices for connected peripheral\", \"periph\":%{private, location:escape_only}@}", buf, 0x1Cu);
      }
      goto LABEL_22;
    }
LABEL_61:
    LOBYTE(v21) = 0;
    return v21;
  }
  if ((objc_msgSend(objc_msgSend(v7, "objectAtIndexedSubscript:", 0), "isTAAISDevice") & 1) != 0)
  {
    v15 = 0;
    v16 = 1;
  }
  else
  {
    v15 = 1;
    if (!objc_msgSend(objc_msgSend(v7, "objectAtIndexedSubscript:", 1), "isTAAISDevice"))
      goto LABEL_46;
    v16 = 0;
  }
  v22 = objc_msgSend(v7, "objectAtIndexedSubscript:", v15);
  v23 = objc_msgSend(v7, "objectAtIndexedSubscript:", v16);
  if (v22)
  {
    v24 = v23;
    if (v23)
    {
      if (objc_msgSend(v22, "taUnknownBeacon") && objc_msgSend(v24, "unownedBeacon"))
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
        v25 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          v26 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "identifier"), "description"), "substringToIndex:", 8);
          v27 = objc_msgSend(v22, "uuid");
          v28 = objc_msgSend(v24, "uuid");
          *(_DWORD *)buf = 68289795;
          v56 = 0;
          v57 = 2082;
          v58 = "";
          v59 = 2113;
          v60 = v26;
          v61 = 2113;
          v62 = v27;
          v63 = 2113;
          v64 = v28;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian found two devices for same peripheral\", \"periph\":%{private, location:escape_only}@, \"AISFetch\":%{private, location:escape_only}@, \"userAction\":%{private, location:escape_only}@}", buf, 0x30u);
        }
        if (objc_msgSend(v22, "isAttemptingConnection"))
          objc_msgSend(v22, "setActiveConnectionAttempt:", 0);
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v29 = objc_msgSend(v22, "getPendingTasks", 0);
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v47;
          do
          {
            for (j = 0; j != v31; j = (char *)j + 1)
            {
              if (*(_QWORD *)v47 != v32)
                objc_enumerationMutation(v29);
              v34 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
              if ((objc_msgSend(objc_msgSend(v24, "getPendingTasks"), "containsObject:", v34) & 1) == 0)
                objc_msgSend(v24, "enqueueTask:", v34);
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
          }
          while (v31);
        }
        objc_msgSend(v24, "setTaUnknownBeacon:", objc_msgSend(v22, "taUnknownBeacon"));
        objc_msgSend(v22, "setUnownedBeacon:", objc_msgSend(v24, "unownedBeacon"));
        v35 = objc_msgSend(v22, "uuid");
        if (v35 == objc_msgSend(a4, "uuid"))
        {
LABEL_22:
          LOBYTE(v21) = 1;
          return v21;
        }
        goto LABEL_61;
      }
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      v42 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
      {
        v43 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "identifier"), "description"), "substringToIndex:", 8);
        *(_DWORD *)buf = 68289283;
        v56 = 0;
        v57 = 2082;
        v58 = "";
        v59 = 2113;
        v60 = v43;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian unexpected scenario when attempt to connect - missing backed unknownBeacon\", \"periph\":%{private, location:escape_only}@}", buf, 0x1Cu);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      }
      v38 = qword_1022A0038;
      v21 = os_signpost_enabled((os_log_t)qword_1022A0038);
      if (v21)
      {
        v44 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "identifier"), "description"), "substringToIndex:", 8);
        *(_DWORD *)buf = 68289283;
        v56 = 0;
        v57 = 2082;
        v58 = "";
        v59 = 2113;
        v60 = v44;
        v40 = "#durian unexpected scenario when attempt to connect - missing backed unknownBeacon";
        v41 = "{\"msg%{public}.0s\":\"#durian unexpected scenario when attempt to connect - missing backed unknownBeacon\"
              ", \"periph\":%{private, location:escape_only}@}";
        goto LABEL_60;
      }
      return v21;
    }
  }
LABEL_46:
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v36 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
  {
    v37 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "identifier"), "description"), "substringToIndex:", 8);
    *(_DWORD *)buf = 68289283;
    v56 = 0;
    v57 = 2082;
    v58 = "";
    v59 = 2113;
    v60 = v37;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian unexpected scenario when attempt to connect - invalid devices\", \"periph\":%{private, location:escape_only}@}", buf, 0x1Cu);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  }
  v38 = qword_1022A0038;
  v21 = os_signpost_enabled((os_log_t)qword_1022A0038);
  if (v21)
  {
    v39 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "identifier"), "description"), "substringToIndex:", 8);
    *(_DWORD *)buf = 68289283;
    v56 = 0;
    v57 = 2082;
    v58 = "";
    v59 = 2113;
    v60 = v39;
    v40 = "#durian unexpected scenario when attempt to connect - invalid devices";
    v41 = "{\"msg%{public}.0s\":\"#durian unexpected scenario when attempt to connect - invalid devices\", \"periph\":%{p"
          "rivate, location:escape_only}@}";
LABEL_60:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v40, v41, buf, 0x1Cu);
    goto LABEL_61;
  }
  return v21;
}

- (void)fetchConnectionTokensForDevice:(id)a3 onCondition:(unint64_t)a4
{
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void **p_vtable;
  id v12;
  SPBeaconManager *beaconManager;
  id v14;
  SPBeaconManager *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  SPBeaconManager *v20;
  unint64_t v21;
  NSObject *v22;
  id v23;
  id v24;
  NSObject *queue;
  _QWORD block[8];
  _QWORD v27[8];
  _QWORD v28[8];
  id v29;
  uint64_t buf;
  __int16 v31;
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  _BOOL4 v40;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68290051;
    v31 = 2082;
    v32 = "";
    v33 = 2113;
    v34 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v35 = 2113;
    v36 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "identifier"), "description"), "substringToIndex:", 8);
    v37 = 1026;
    v38 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "possiblePeripherals"), "count");
    v39 = 1026;
    v40 = objc_msgSend(a3, "lastReconciledCriteria") != 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt fetching tokens\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"periphs\":%{public}d, \"lastReconciled\":%{public}hhd}", (uint8_t *)&buf, 0x32u);
  }
  objc_msgSend(a3, "transitionToState:event:task:", 1, 0, 0);
  if (objc_msgSend(a3, "isTAAISDevice"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      buf = 68289283;
      v31 = 2082;
      v32 = "";
      v33 = 2113;
      v34 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt fetch unknown beacon before UT alert\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }
    v29 = objc_msgSend(objc_alloc((Class)CLFindMyAccessoryConnectionMaterial), "initWithAddress:ltk:primaryIndex:secondaryIndex:", objc_msgSend(objc_msgSend(a3, "taUnknownBeacon"), "address"), 0, 0, 0);
    -[CLDurianDeviceManager addPossiblePeripheralsForDevice:usingMaterials:](self, "addPossiblePeripheralsForDevice:usingMaterials:", a3, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
    -[CLDurianDeviceManager handleTokenFetchForDevice:onCondition:](self, "handleTokenFetchForDevice:onCondition:", a3, a4);
  }
  else
  {
    -[CLDurianDeviceManager scheduleTokenFetchTimeoutForDevice:](self, "scheduleTokenFetchTimeoutForDevice:", a3);
    v10 = dispatch_group_create();
    p_vtable = TRANSITPbTransitMac.vtable;
    if (+[CLDurianSettings driftModelConnectionEnabled](CLDurianSettings, "driftModelConnectionEnabled"))
    {
      dispatch_group_enter(v10);
      v12 = +[SPCommandKeysCriteria driftModeledCriteria](SPCommandKeysCriteria, "driftModeledCriteria");
      beaconManager = self->_beaconManager;
      v14 = objc_msgSend(a3, "uuid");
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1015297D4;
      v28[3] = &unk_1021BC8F0;
      v28[4] = self;
      v28[5] = v10;
      v28[6] = a3;
      v28[7] = v12;
      v15 = beaconManager;
      p_vtable = (void **)(TRANSITPbTransitMac + 24);
      -[SPBeaconManager connectionTokensForBeaconUUID:criteria:completion:](v15, "connectionTokensForBeaconUUID:criteria:completion:", v14, v12, v28);
    }
    else
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      v16 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
        v18 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "identifier"), "description"), "substringToIndex:", 8);
        buf = 68289539;
        v31 = 2082;
        v32 = "";
        v33 = 2113;
        v34 = v17;
        p_vtable = TRANSITPbTransitMac.vtable;
        v35 = 2113;
        v36 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt skip driftmodel fetch\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
      }
    }
    if (objc_msgSend(p_vtable + 482, "reconciledConnectionEnabled")
      && objc_msgSend(a3, "lastReconciledCriteria"))
    {
      dispatch_group_enter(v10);
      v19 = objc_msgSend(a3, "lastReconciledCriteria");
      v20 = self->_beaconManager;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1015298C0;
      v27[3] = &unk_1021BC8F0;
      v27[4] = self;
      v27[5] = v10;
      v27[6] = a3;
      v27[7] = v19;
      -[SPBeaconManager connectionTokensForBeaconUUID:criteria:completion:](v20, "connectionTokensForBeaconUUID:criteria:completion:", objc_msgSend(a3, "uuid"), v19, v27);
      v21 = a4;
    }
    else
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      v21 = a4;
      v22 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
        v24 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "identifier"), "description"), "substringToIndex:", 8);
        buf = 68289539;
        v31 = 2082;
        v32 = "";
        v33 = 2113;
        v34 = v23;
        v35 = 2113;
        v36 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt skip reconciliation fetch\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
      }
    }
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1015299AC;
    block[3] = &unk_10214A1B0;
    block[4] = v10;
    block[5] = self;
    block[6] = a3;
    block[7] = v21;
    dispatch_group_notify(v10, queue, block);
  }
}

- (void)handleTokenFetchForDevice:(id)a3 onCondition:(unint64_t)a4
{
  -[CLDurianDeviceManager cancelTokenFetchTimeoutForDevice:](self, "cancelTokenFetchTimeoutForDevice:");
  if (-[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", objc_msgSend(a3, "uuid")))-[CLDurianDeviceManager checkMaintenanceDiscoveryForDevice:onCondition:](self, "checkMaintenanceDiscoveryForDevice:onCondition:", a3, a4);
  else
    -[CLDurianDeviceManager completeTokenFetchForDevice:](self, "completeTokenFetchForDevice:", a3);
}

- (void)fetchConnectionTokensForDevice:(id)a3 usingReconciledUUID:(id)a4 andCriteria:(id)a5
{
  SPBeaconManager *beaconManager;
  dispatch_time_t v10;
  NSObject *queue;
  _QWORD block[6];
  _QWORD v13[7];

  -[CLDurianDeviceManager scheduleTokenFetchTimeoutForDevice:](self, "scheduleTokenFetchTimeoutForDevice:");
  beaconManager = self->_beaconManager;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_101529B38;
  v13[3] = &unk_1021BC918;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a5;
  -[SPBeaconManager connectionTokensForBeaconUUID:criteria:completion:](beaconManager, "connectionTokensForBeaconUUID:criteria:completion:", a4, a5, v13);
  if (-[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", objc_msgSend(a3, "uuid")))
  {
    v10 = dispatch_time(0, 6000000000);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_101529C5C;
    block[3] = &unk_10212BB30;
    block[4] = self;
    block[5] = a3;
    dispatch_after(v10, queue, block);
  }
}

- (void)didFetchConnectionMaterial:(id)a3 criteria:(id)a4 forDevice:(id)a5 error:(id)a6
{
  NSError *v6;
  NSObject *v8;
  id v9;
  NSString *v10;
  NSString *v11;
  NSObject *v12;
  id v13;
  NSString *v14;
  NSString *v15;
  NSObject *v19;
  NSObject *v20;
  id v21;
  NSString *v22;
  NSString *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  NSString *v27;
  NSObject *v28;
  id v29;
  NSString *v30;
  NSString *v31;
  NSMutableArray *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *i;
  id v37;
  id v38;
  void *v39;
  CLDurianDeviceManager *v40;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t buf;
  __int16 v49;
  const char *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  NSString *v54;
  __int16 v55;
  NSString *v56;
  __int16 v57;
  id v58;
  NSErrorUserInfoKey v59;
  const __CFString *v60;
  NSErrorUserInfoKey v61;
  const __CFString *v62;

  v6 = (NSError *)a6;
  if (a6)
    goto LABEL_2;
  if (objc_msgSend(a3, "count"))
  {
    if ((unint64_t)objc_msgSend(a3, "count") < 0x121
      || !objc_msgSend(a4, "_cl_isEqual:", +[SPCommandKeysCriteria driftModeledCriteria](SPCommandKeysCriteria, "driftModeledCriteria")))
    {
      goto LABEL_30;
    }
    v59 = NSLocalizedDescriptionKey;
    v60 = CFSTR("Token count return exceeds the max allowed");
    v6 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 2, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v19 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      buf = 68289795;
      v49 = 2082;
      v50 = "";
      v51 = 2113;
      v52 = objc_msgSend(a5, "uuid");
      v53 = 2050;
      v54 = (NSString *)objc_msgSend(a3, "count");
      v55 = 2113;
      v56 = -[NSError localizedDescription](v6, "localizedDescription");
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #connection material count exceeded \", \"deviceId\":%{private, location:escape_only}@, \"count\":%{public}lu, \"error\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    }
    v20 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v21 = objc_msgSend(a5, "uuid");
      v22 = (NSString *)objc_msgSend(a3, "count");
      v23 = -[NSError localizedDescription](v6, "localizedDescription");
      buf = 68289795;
      v49 = 2082;
      v50 = "";
      v51 = 2113;
      v52 = v21;
      v53 = 2050;
      v54 = v22;
      v55 = 2113;
      v56 = v23;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #connection material count exceeded ", "{\"msg%{public}.0s\":\"#durian #connection material count exceeded \", \"deviceId\":%{private, location:escape_only}@, \"count\":%{public}lu, \"error\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
      if (!v6)
        goto LABEL_30;
LABEL_2:
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      v8 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
      {
        v9 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "uuid"), "description"), "substringToIndex:", 8);
        v10 = (NSString *)objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a5, "activeConnectionAttempt"), "identifier"), "description"), "substringToIndex:", 8);
        v11 = -[NSError localizedDescription](v6, "localizedDescription");
        buf = 68289795;
        v49 = 2082;
        v50 = "";
        v51 = 2113;
        v52 = v9;
        v53 = 2113;
        v54 = v10;
        v55 = 2113;
        v56 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #connectattempt material fetch error\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      }
      v12 = qword_1022A0038;
      if (os_signpost_enabled((os_log_t)qword_1022A0038))
      {
        v13 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "uuid"), "description"), "substringToIndex:", 8);
        v14 = (NSString *)objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a5, "activeConnectionAttempt"), "identifier"), "description"), "substringToIndex:", 8);
        v15 = -[NSError localizedDescription](v6, "localizedDescription");
        buf = 68289795;
        v49 = 2082;
        v50 = "";
        v51 = 2113;
        v52 = v13;
        v53 = 2113;
        v54 = v14;
        v55 = 2113;
        v56 = v15;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #connectattempt material fetch error", "{\"msg%{public}.0s\":\"#durian #connectattempt material fetch error\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
      }
      return;
    }
LABEL_27:
    if (!v6)
      goto LABEL_30;
    goto LABEL_2;
  }
  v61 = NSLocalizedDescriptionKey;
  v62 = CFSTR("Failed to Retrieve tokens for tag");
  v6 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 2, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1));
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v24 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
  {
    buf = 68289539;
    v49 = 2082;
    v50 = "";
    v51 = 2113;
    v52 = objc_msgSend(a5, "uuid");
    v53 = 2113;
    v54 = -[NSError localizedDescription](v6, "localizedDescription");
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #connection no errors returned with no materials\", \"deviceId\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  }
  v25 = qword_1022A0038;
  if (os_signpost_enabled((os_log_t)qword_1022A0038))
  {
    v26 = objc_msgSend(a5, "uuid");
    v27 = -[NSError localizedDescription](v6, "localizedDescription");
    buf = 68289539;
    v49 = 2082;
    v50 = "";
    v51 = 2113;
    v52 = v26;
    v53 = 2113;
    v54 = v27;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #connection no errors returned with no materials", "{\"msg%{public}.0s\":\"#durian #connection no errors returned with no materials\", \"deviceId\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
    goto LABEL_27;
  }
  if (v6)
    goto LABEL_2;
LABEL_30:
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v40 = self;
  v28 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v29 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "uuid"), "description"), "substringToIndex:", 8);
    v30 = (NSString *)objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a5, "activeConnectionAttempt"), "identifier"), "description"), "substringToIndex:", 8);
    v31 = (NSString *)objc_msgSend(a3, "count");
    buf = 68290051;
    v49 = 2082;
    v50 = "";
    v51 = 2113;
    v52 = v29;
    v53 = 2113;
    v54 = v30;
    v55 = 2049;
    v56 = v31;
    v57 = 2113;
    v58 = a4;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt material fetched\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"count\":%{private}lu, \"criteria\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x3Au);
  }
  v32 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(a3, "count", a4));
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = a3;
  v33 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v35)
          objc_enumerationMutation(obj);
        -[NSMutableArray addObject:](v32, "addObject:", objc_msgSend(objc_alloc((Class)CLFindMyAccessoryConnectionMaterial), "initWithAddress:ltk:primaryIndex:secondaryIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i), "address"), objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i), "connectionToken"), objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i), "primaryIndex"), objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i), "secondaryIndex")));
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v34);
  }
  if ((objc_msgSend(v39, "_cl_isEqual:", +[SPCommandKeysCriteria driftModeledCriteria](SPCommandKeysCriteria, "driftModeledCriteria")) & 1) == 0)
  {
    v37 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "activeConnectionAttempt"), "krMaterials"), "count");
    v38 = objc_msgSend(a5, "activeConnectionAttempt");
    if (v37)
      objc_msgSend(objc_msgSend(v38, "krMaterials"), "addObjectsFromArray:", v32);
    else
      objc_msgSend(v38, "setKrMaterials:", v32);
  }
  -[CLDurianDeviceManager addPossiblePeripheralsForDevice:usingMaterials:](v40, "addPossiblePeripheralsForDevice:usingMaterials:", a5, v32);
}

- (void)addPossiblePeripheralsForDevice:(id)a3 usingMaterials:(id)a4
{
  id v5;
  __int128 v6;
  id v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSString *v13;
  id v14;
  NSObject *v15;
  id v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  id v21;
  id v22;
  const char *v23;
  const char *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  id v28;
  __int128 v29;
  id v30;
  id v32;
  id v33;
  id v34;
  id v36;
  NSString *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  const char *v59;
  _BYTE v60[128];

  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v5 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v38, v60, 16);
  if (v5)
  {
    v7 = v5;
    v8 = &qword_1022A0000;
    v9 = &qword_1022A0000;
    v10 = *(_QWORD *)v39;
    *(_QWORD *)&v6 = 68289283;
    v29 = v6;
    do
    {
      v11 = 0;
      v30 = v7;
      do
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(a4);
        v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v11);
        v37 = sub_101536D20(objc_msgSend(v12, "ltk", v29));
        v13 = sub_10024882C(objc_msgSend(v12, "address"));
        v14 = -[CLDurianDeviceManager _retrievePeripheralForMaterial:isFindMyNetwork:](self, "_retrievePeripheralForMaterial:isFindMyNetwork:", v12, objc_msgSend(a3, "isFindMyNetwork"));
        if (objc_msgSend(v12, "secondaryIndex"))
          v36 = 0;
        else
          v36 = objc_msgSend(v12, "primaryIndex");
        if (v8[6] != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BCA48);
        v15 = v9[7];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v33 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
          v32 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "identifier"), "description"), "substringToIndex:", 8);
          v16 = objc_msgSend(objc_msgSend(objc_msgSend(v14, "identifier"), "description"), "substringToIndex:", 8);
          v34 = v14;
          v17 = v8;
          v18 = v16;
          v19 = v10;
          v20 = v9;
          v21 = a3;
          v22 = objc_msgSend(v12, "secondaryIndex");
          v23 = -[NSString UTF8String](v13, "UTF8String");
          v24 = -[NSString UTF8String](v37, "UTF8String");
          *(_DWORD *)buf = 68290819;
          v43 = 0;
          v44 = 2082;
          v45 = "";
          v46 = 2113;
          v47 = v33;
          v48 = 2113;
          v49 = v32;
          v50 = 2113;
          v51 = v18;
          v8 = v17;
          v14 = v34;
          v52 = 2114;
          v53 = v36;
          v54 = 2114;
          v55 = v22;
          a3 = v21;
          v9 = v20;
          v10 = v19;
          v7 = v30;
          v56 = 2082;
          v57 = v23;
          v58 = 2082;
          v59 = v24;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt add peripheral\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"primaryIndex\":%{public, location:escape_only}@, \"secondaryIndex\":%{public, location:escape_only}@, \"address\":%{public, location:escape_only}s, \"LTK\":%{public, location:escape_only}s}", buf, 0x58u);
        }
        if (v14)
        {
          objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "addPossiblePeripheral:withConnectionMaterial:", v14, v12);
        }
        else
        {
          if (v8[6] != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BCA48);
          v25 = v9[7];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v26 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = v29;
            v43 = 0;
            v44 = 2082;
            v45 = "";
            v46 = 2113;
            v47 = v26;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian failed to create CBPeripheral\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            if (v8[6] != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BCA48);
          }
          v27 = v9[7];
          if (os_signpost_enabled(v27))
          {
            v28 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = v29;
            v43 = 0;
            v44 = 2082;
            v45 = "";
            v46 = 2113;
            v47 = v28;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian failed to create CBPeripheral", "{\"msg%{public}.0s\":\"#durian failed to create CBPeripheral\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
          }
        }
        v11 = (char *)v11 + 1;
      }
      while (v7 != v11);
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v38, v60, 16);
    }
    while (v7);
  }
}

- (void)handleKeyFetchFailureForDevice:(id)a3 withError:(id)a4
{
  NSError *v4;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSString *v10;
  NSObject *v11;
  id v12;
  NSString *v13;
  NSObject *v14;
  id v15;
  NSString *v16;
  int v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  NSString *v24;
  NSErrorUserInfoKey v25;
  const __CFString *v26;

  v4 = (NSError *)a4;
  if (a4)
  {
LABEL_9:
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    goto LABEL_11;
  }
  v25 = NSLocalizedDescriptionKey;
  v26 = CFSTR("Failed to Retrieve tokens for tag");
  v4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 2, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
  {
    v17 = 68289539;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2113;
    v22 = objc_msgSend(a3, "uuid");
    v23 = 2113;
    v24 = -[NSError localizedDescription](v4, "localizedDescription");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian #connection no error in handleKeyFetchFailureForDevice:withError:\", \"deviceId\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v17, 0x26u);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  }
  v8 = qword_1022A0038;
  if (os_signpost_enabled((os_log_t)qword_1022A0038))
  {
    v9 = objc_msgSend(a3, "uuid");
    v10 = -[NSError localizedDescription](v4, "localizedDescription");
    v17 = 68289539;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2113;
    v22 = v9;
    v23 = 2113;
    v24 = v10;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #connection no error in handleKeyFetchFailureForDevice:withError:", "{\"msg%{public}.0s\":\"#durian #connection no error in handleKeyFetchFailureForDevice:withError:\", \"deviceId\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v17, 0x26u);
    goto LABEL_9;
  }
LABEL_11:
  v11 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
  {
    v12 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v13 = -[NSError localizedDescription](v4, "localizedDescription");
    v17 = 68289539;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2113;
    v22 = v12;
    v23 = 2113;
    v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #connectattempt token fetch error\", \"item\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v17, 0x26u);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  }
  v14 = qword_1022A0038;
  if (os_signpost_enabled((os_log_t)qword_1022A0038))
  {
    v15 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v16 = -[NSError localizedDescription](v4, "localizedDescription");
    v17 = 68289539;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2113;
    v22 = v15;
    v23 = 2113;
    v24 = v16;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #connectattempt token fetch error", "{\"msg%{public}.0s\":\"#durian #connectattempt token fetch error\", \"item\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v17, 0x26u);
  }
  -[CLDurianDeviceManager sendObservationForDevice:type:includeLocation:](self, "sendObservationForDevice:type:includeLocation:", a3, 3, 0);
  objc_msgSend(a3, "transitionToState:event:task:", 0, 1, 0);
  -[CLDurianDeviceManager connectFailedToDevice:withError:](self, "connectFailedToDevice:withError:", a3, -[NSError code](v4, "code"));
}

- (void)completeTokenFetchForDevice:(id)a3
{
  unsigned int v5;
  unsigned int v6;
  NSObject *v7;
  id v8;
  id v9;
  __int128 v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  NSErrorUserInfoKey v25;
  const __CFString *v26;
  uint64_t buf;
  __int16 v28;
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  unsigned int v37;

  if (a3)
  {
    v5 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "possiblePeripherals"), "count");
    v6 = objc_msgSend(a3, "isConnected");
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68290051;
      v28 = 2082;
      v29 = "";
      v30 = 2113;
      v31 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      v32 = 2113;
      v33 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "identifier"), "description"), "substringToIndex:", 8);
      v34 = 1026;
      v35 = v5;
      v36 = 1026;
      v37 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt fetch complete\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"periphs\":%{public}d, \"connected\":%{public}hhd}", (uint8_t *)&buf, 0x32u);
    }
    if ((v6 & 1) == 0)
    {
      if (v5)
      {
        objc_msgSend(a3, "transitionToState:event:task:", 2, 3, 0);
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v8 = objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "possiblePeripherals");
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v9)
        {
          v11 = v9;
          v12 = *(_QWORD *)v21;
          *(_QWORD *)&v10 = 68289283;
          v19 = v10;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v21 != v12)
                objc_enumerationMutation(v8);
              v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v13);
              v15 = objc_msgSend(a3, "firmwareUpdateReboot", v19);
              if (-[CLDurianDeviceManager checkIfTwoDevicesHaveSamePeripheral:device:](self, "checkIfTwoDevicesHaveSamePeripheral:device:", v14, a3))
              {
                if (qword_1022A0030 != -1)
                  dispatch_once(&qword_1022A0030, &stru_1021BCA48);
                v16 = qword_1022A0038;
                if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
                {
                  v17 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
                  buf = v19;
                  v28 = 2082;
                  v29 = "";
                  v30 = 2113;
                  v31 = v17;
                  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian skip connect to device\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
                }
              }
              else
              {
                if (v15)
                  v18 = 60;
                else
                  v18 = 0;
                -[CLDurianDeviceManager connectToDevice:withPeripheral:forcedTimeout:](self, "connectToDevice:withPeripheral:forcedTimeout:", a3, v14, v18);
              }
              v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          }
          while (v11);
        }
      }
      else
      {
        v25 = NSLocalizedDescriptionKey;
        v26 = CFSTR("Failed to Retrieve tokens for tag");
        -[CLDurianDeviceManager handleKeyFetchFailureForDevice:withError:](self, "handleKeyFetchFailureForDevice:withError:", a3, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 2, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1)));
      }
    }
  }
}

- (void)checkMaintenanceDiscoveryForDevice:(id)a3 onCondition:(unint64_t)a4
{
  unsigned int v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  void *i;
  BOOL v15;
  int v16;
  NSObject *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t buf;
  __int16 v25;
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  int v32;

  v7 = objc_msgSend(a3, "numPossiblePeripherals");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289795;
    v25 = 2082;
    v26 = "";
    v27 = 2113;
    v28 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v29 = 1026;
    v30 = v7;
    v31 = 1026;
    v32 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint check discovery\", \"item\":%{private, location:escape_only}@, \"periphs\":%{public}d, \"condition\":%{public}d}", (uint8_t *)&buf, 0x28u);
  }
  if (v7)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt", 0), "possiblePeripherals");
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v9);
          v12 += -[CLDurianDeviceManager isDiscoveryRequiredForDevice:onCondition:withPeripheral:](self, "isDiscoveryRequiredForDevice:onCondition:withPeripheral:", a3, a4, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i));
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }
    else
    {
      LOBYTE(v12) = 0;
    }
    if ((_BYTE)v12)
      v15 = v7 == (char)v12;
    else
      v15 = 0;
    v16 = v15;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v17 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      buf = 68289795;
      v25 = 2082;
      v26 = "";
      v27 = 2113;
      v28 = v18;
      v29 = 1026;
      v30 = v16;
      v31 = 1026;
      v32 = (char)v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint discovery\", \"item\":%{private, location:escape_only}@, \"request\":%{public}d, \"count\":%{public}d}", (uint8_t *)&buf, 0x28u);
    }
    if (v16)
    {
      -[CLDurianMaintenanceMetrics setNeededDiscovery:](self->_maintMetrics, "setNeededDiscovery:", 1);
      if (!self->_maintDiscoveryPending)
      {
        self->_maintDiscoveryPending = 1;
        -[CLDurianDeviceManager requestDiscoveryViaDevice:](self, "requestDiscoveryViaDevice:", a3);
        -[CLDurianDeviceManager dispatchRecheckDevicesAfterDiscovery](self, "dispatchRecheckDevicesAfterDiscovery");
      }
    }
    else if ((-[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", objc_msgSend(a3, "uuid")) & 1) == 0)
    {
      objc_msgSend(a3, "removeAllPossiblePeripherals");
    }
  }
  else
  {
    -[CLDurianDeviceManager connectFailedToDevice:withError:](self, "connectFailedToDevice:withError:", a3, 19);
    -[CLDurianDeviceManager finishMaintainingDevice:withReason:andCategory:](self, "finishMaintainingDevice:withReason:andCategory:", a3, CFSTR("error:fetch"), 0);
  }
}

- (double)requestCarScanTimeViaDevice:(id)a3
{
  double result;

  _objc_msgSend(a3, "getLastCarScanTime");
  return result;
}

- (void)requestDiscoveryViaDevice:(id)a3
{
  objc_msgSend(a3, "requestDiscoveryScan");
}

- (void)setCurrentKeyIndex:(unint64_t)a3 forDevice:(id)a4
{
  -[SPBeaconManager connectedToBeacon:withIndex:](self->_beaconManager, "connectedToBeacon:withIndex:", objc_msgSend(a4, "uuid"), a3);
}

- (void)setCurrentWildKeyIndex:(unint64_t)a3 forDevice:(id)a4 forEvent:(id)a5
{
  SPBeaconManager *beaconManager;
  _QWORD v10[7];

  if ((objc_opt_respondsToSelector(self->_beaconManager, "setCurrentWildKeyIndex:forBeacon:completion:") & 1) != 0)
  {
    beaconManager = self->_beaconManager;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10152B618;
    v10[3] = &unk_1021B5940;
    v10[4] = a4;
    v10[5] = a5;
    v10[6] = a3;
    -[SPBeaconManager setCurrentWildKeyIndex:forBeacon:completion:](beaconManager, "setCurrentWildKeyIndex:forBeacon:completion:", a3, objc_msgSend(a4, "uuid"), v10);
  }
}

- (void)setKeyRollTimeout:(unint64_t)a3 forDevice:(id)a4
{
  SPBeaconManager *beaconManager;
  _QWORD v8[6];

  if ((objc_opt_respondsToSelector(self->_beaconManager, "setKeyRollInterval:forBeacon:completion:") & 1) != 0)
  {
    beaconManager = self->_beaconManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10152B7DC;
    v8[3] = &unk_1021B5968;
    v8[4] = a4;
    v8[5] = a3;
    -[SPBeaconManager setKeyRollInterval:forBeacon:completion:](beaconManager, "setKeyRollInterval:forBeacon:completion:", a3, objc_msgSend(a4, "uuid"), v8);
  }
}

- (void)setWildKeyBase:(unint64_t)a3 interval:(unint64_t)a4 fallback:(unint64_t)a5 forDevice:(id)a6
{
  SPBeaconManager *beaconManager;
  _QWORD v12[8];

  if ((objc_opt_respondsToSelector(self->_beaconManager, "setWildKeyBase:interval:fallback:forBeacon:completion:") & 1) != 0)
  {
    beaconManager = self->_beaconManager;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10152B9B0;
    v12[3] = &unk_1021BC940;
    v12[4] = a6;
    v12[5] = a3;
    v12[6] = a4;
    v12[7] = a5;
    -[SPBeaconManager setWildKeyBase:interval:fallback:forBeacon:completion:](beaconManager, "setWildKeyBase:interval:fallback:forBeacon:completion:", a3, a4, a5, objc_msgSend(a6, "uuid"), v12);
  }
}

- (void)setAlignmentUncertainty:(double)a3 atIndex:(unint64_t)a4 date:(id)a5 forDevice:(id)a6
{
  SPBeaconManager *beaconManager;
  _QWORD v12[7];

  if ((objc_opt_respondsToSelector(self->_beaconManager, "setAlignmentUncertainty:atIndex:date:forBeacon:completion:") & 1) != 0)
  {
    beaconManager = self->_beaconManager;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10152BBB8;
    v12[3] = &unk_1021B5940;
    *(double *)&v12[6] = a3;
    v12[4] = a6;
    v12[5] = a5;
    -[SPBeaconManager setAlignmentUncertainty:atIndex:date:forBeacon:completion:](beaconManager, "setAlignmentUncertainty:atIndex:date:forBeacon:completion:", a4, a5, objc_msgSend(a6, "uuid"), v12, a3);
  }
}

- (void)updateBatteryStatus:(unint64_t)a3 forDevice:(id)a4
{
  SPOwnerSession *ownerSession;
  _QWORD v8[6];

  if ((objc_opt_respondsToSelector(self->_ownerSession, "updateBatteryStatus:beaconUUID:completion:") & 1) != 0)
  {
    ownerSession = self->_ownerSession;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10152BD78;
    v8[3] = &unk_1021BC968;
    v8[4] = a4;
    v8[5] = a3;
    -[SPOwnerSession updateBatteryStatus:beaconUUID:completion:](ownerSession, "updateBatteryStatus:beaconUUID:completion:", a3, objc_msgSend(a4, "uuid"), v8);
  }
}

- (void)setAirplaneModeEnabled:(BOOL)a3
{
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (self->_airplaneModeEnabled != a3)
  {
    self->_airplaneModeEnabled = a3;
    if (a3)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      v4 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v5[0] = 68289026;
        v5[1] = 0;
        v6 = 2082;
        v7 = "";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian airplane mode enabled\"}", (uint8_t *)v5, 0x12u);
      }
      -[CLDurianDeviceManager evaluateDisconnectedDevices](self, "evaluateDisconnectedDevices");
    }
  }
}

- (void)requestDisconnectionForDevice:(id)a3
{
  -[CLDurianDeviceManager disconnectDevice:](self, "disconnectDevice:");
  -[CLDurianDeviceManager cancelConnectionEvaluationForDevice:](self, "cancelConnectionEvaluationForDevice:", a3);
}

- (BOOL)sendSeparationStateForDevice:(id)a3 state:(id)a4 includeLocation:(BOOL)a5
{
  SPTagSeparationProtocol *separationSession;
  _QWORD v10[6];

  if ((objc_opt_respondsToSelector(self->_separationSession, "tagSeparationStateChanged:beaconUUID:completion:") & 1) != 0)
  {
    separationSession = self->_separationSession;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10152C054;
    v10[3] = &unk_1021BC990;
    v10[4] = a3;
    v10[5] = a4;
    -[SPTagSeparationProtocol tagSeparationStateChanged:beaconUUID:completion:](separationSession, "tagSeparationStateChanged:beaconUUID:completion:", a4, objc_msgSend(a3, "uuid"), v10);
  }
  return 0;
}

- (void)sendObservationForDevice:(id)a3 type:(int64_t)a4 includeLocation:(BOOL)a5
{
  _BOOL8 v5;
  NSDate *v9;
  NSDate *v10;
  _BOOL4 v11;
  NSDate *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[7];
  BOOL v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  double v34;
  __int16 v35;
  uint64_t v36;

  v5 = a5;
  v9 = +[NSDate date](NSDate, "date");
  v10 = v9;
  v11 = a4 == 3 && v5;
  v12 = v9;
  if (v11)
  {
    -[NSDate timeIntervalSinceReferenceDate](v9, "timeIntervalSinceReferenceDate");
    v14 = v13;
    objc_msgSend(a3, "lastObservationTime");
    v16 = v14 - v15;
    if (v16 <= 6.0)
      v17 = v16;
    else
      v17 = 6.0;
    v12 = -[NSDate dateByAddingTimeInterval:](v10, "dateByAddingTimeInterval:", -v17);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v18 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      v19 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      -[NSDate timeIntervalSinceReferenceDate](v10, "timeIntervalSinceReferenceDate");
      v21 = v20;
      objc_msgSend(a3, "lastObservationTime");
      *(_DWORD *)buf = 68290051;
      v27 = 2082;
      v26 = 0;
      v28 = "";
      v29 = 2113;
      v30 = v19;
      v31 = 2050;
      v32 = v21;
      v33 = 2050;
      v34 = v17;
      v35 = 2050;
      v36 = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #lastObservationTime disconnection\", \"item\":%{private, location:escape_only}@, \"disconnectionTime\":\"%{public}f\", \"interval\":\"%{public}f\", \"lastObservationTime\":\"%{public}f\"}", buf, 0x3Au);
    }
  }
  objc_msgSend(a3, "setLastObservationTime:", CFAbsoluteTimeGetCurrent());
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10152C3C0;
  v23[3] = &unk_1021BC9B8;
  v23[5] = a3;
  v23[6] = a4;
  v24 = v11;
  v23[4] = self;
  -[CLDurianDeviceManager sendObservationForIdentifier:type:date:locationDate:includeLocation:locationHandler:](self, "sendObservationForIdentifier:type:date:locationDate:includeLocation:locationHandler:", objc_msgSend(a3, "uuid"), a4, v10, v12, v5, v23);
  if ((objc_opt_respondsToSelector(self->_deviceDelegate, "onObservationForDeviceWithUUID:type:") & 1) != 0)
    -[CLDurianDeviceDelegate onObservationForDeviceWithUUID:type:](self->_deviceDelegate, "onObservationForDeviceWithUUID:type:", objc_msgSend(a3, "uuid"), a4);
}

- (void)sendObservationForIdentifier:(id)a3 type:(int64_t)a4 date:(id)a5 locationDate:(id)a6 includeLocation:(BOOL)a7 locationHandler:(id)a8
{
  _BOOL4 v8;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  const char *v22;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  int64_t v31;
  __int16 v32;
  _BYTE v33[14];
  __int16 v34;
  uint64_t v35;

  v8 = a7;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
  v13 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
    objc_msgSend(a6, "timeIntervalSinceReferenceDate");
    v16 = v15;
    objc_msgSend(a5, "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 68290307;
    v25 = 0;
    v26 = 2082;
    v27 = "";
    v28 = 2113;
    v29 = v14;
    v30 = 2049;
    v31 = a4;
    v32 = 1025;
    *(_DWORD *)v33 = v8;
    *(_WORD *)&v33[4] = 2049;
    *(_QWORD *)&v33[6] = v16;
    v34 = 2049;
    v35 = v17;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian updating beacon observation\", \"item\":%{private, location:escape_only}@, \"type\":%{private}ld, \"includeLocation\":%{private}hhd, \"locationDate\":\"%{private}f\", \"now\":\"%{private}f\"}", buf, 0x40u);
  }
  if (self->_isRestrictedSKU)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v18 = qword_1022A0038;
    v8 = 0;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v25 = 0;
      v26 = 2082;
      v27 = "";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian - device SKU is restricted; sending nil location\"}",
        buf,
        0x12u);
      v8 = 0;
    }
  }
  if (self->_isRestrictedCountryCode)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v19 = qword_1022A0038;
    if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 68289026;
    v25 = 0;
    v26 = 2082;
    v27 = "";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian - device country code is restricted; sending nil location\"}",
      buf,
      0x12u);
  }
  else if (v8)
  {
    -[CLDurianLocationMonitor fetchEstimatedLocationAtDate:handler:](self->_locationMonitor, "fetchEstimatedLocationAtDate:handler:");
    return;
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCA48);
LABEL_19:
  v20 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
  {
    v21 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
    v22 = -[NSString UTF8String](+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", a5, 1, 4), "UTF8String");
    *(_DWORD *)buf = 68289795;
    v25 = 0;
    v26 = 2082;
    v27 = "";
    v28 = 2113;
    v29 = v21;
    v30 = 2050;
    v31 = a4;
    v32 = 2082;
    *(_QWORD *)v33 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian sendObservationForDevice includeLocation, NO\", \"item\":%{private, location:escape_only}@, \"type\":%{public}ld, \"date\":%{public, location:escape_only}s}", buf, 0x30u);
  }
  -[CLDurianDeviceManager sendObservationForIdentifier:type:date:location:](self, "sendObservationForIdentifier:type:date:location:", a3, a4, a5, 0);
}

- (void)sendObservationForIdentifier:(id)a3 type:(int64_t)a4 date:(id)a5 location:(id)a6
{
  id v6;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  SPOwnerSession *ownerSession;
  _QWORD v35[6];
  id v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;

  v6 = a6;
  if (a6)
  {
    if (-[CLDurianZoneMonitorWrapper isInZone:](self->_zoneMonitor, "isInZone:", a6))
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      v11 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
        objc_msgSend(v6, "coordinate");
        v14 = v13;
        objc_msgSend(v6, "coordinate");
        *(_DWORD *)buf = 68289795;
        v38 = 0;
        v39 = 2082;
        v40 = "";
        v41 = 2113;
        v42 = v12;
        v43 = 2049;
        v44 = v14;
        v45 = 2049;
        v46 = v15;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #location is inside Korea time zone; sending nil location\", \"item\":%{private"
          ", location:escape_only}@, \"latitude\":\"%{private}f\", \"longitude\":\"%{private}f\"}",
          buf,
          0x30u);
      }
      v6 = 0;
    }
    else
    {
      v16 = objc_alloc((Class)SPObservationLocation);
      v17 = objc_msgSend(v6, "timestamp");
      objc_msgSend(v6, "coordinate");
      v19 = v18;
      objc_msgSend(v6, "coordinate");
      v21 = v20;
      objc_msgSend(v6, "horizontalAccuracy");
      v23 = v22;
      objc_msgSend(v6, "altitude");
      v25 = v24;
      objc_msgSend(v6, "verticalAccuracy");
      v27 = v26;
      objc_msgSend(v6, "speed");
      v29 = v28;
      objc_msgSend(v6, "speedAccuracy");
      v31 = v30;
      objc_msgSend(v6, "course");
      v6 = objc_msgSend(v16, "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floorLevel:", v17, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(objc_msgSend(v6, "floor"), "level")), v19, v21, v23, v25, v27, v29, v31, v32, 0);
    }
  }
  v33 = objc_msgSend(objc_alloc((Class)SPBeaconObservation), "initWithBeaconIdentifier:type:date:location:", a3, a4, a5, v6);
  ownerSession = self->_ownerSession;
  v36 = v33;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10152CDA8;
  v35[3] = &unk_1021BC990;
  v35[4] = a3;
  v35[5] = v33;
  -[SPOwnerSession updateBeaconObservations:completion:](ownerSession, "updateBeaconObservations:completion:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1), v35);
}

- (id)_retrievePeripheralForMaterial:(id)a3
{
  return -[CLDurianDeviceManager _retrievePeripheralForMaterial:isFindMyNetwork:](self, "_retrievePeripheralForMaterial:isFindMyNetwork:", a3, 1);
}

- (id)_retrievePeripheralForMaterial:(id)a3 isFindMyNetwork:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  NSObject *v9;
  const char *v10;
  id v11;
  id v12;
  NSObject *v13;
  NSString *v14;
  id v15;
  const char *v16;
  NSString *v17;
  id v18;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  NSString *v25;
  __int16 v26;
  id v27;

  v4 = a4;
  v6 = objc_msgSend(objc_msgSend(a3, "address"), "mutableCopy");
  v7 = (unsigned __int8 *)objc_msgSend(v6, "mutableBytes");
  v8 = v7;
  if (v4)
  {
    *v7 |= 0xC0u;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289283;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2113;
      v25 = sub_10024882C(v6);
      v10 = "{\"msg%{public}.0s\":\"#durian exercising connection to Apple accessories, using: \", \"address\":%{private,"
            " location:escape_only}@}";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v10, buf, 0x1Cu);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289283;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2113;
      v25 = sub_10024882C(v6);
      v10 = "{\"msg%{public}.0s\":\"#durian exercising connection to non-Apple accessories, using: \", \"address\":%{priv"
            "ate, location:escape_only}@}";
      goto LABEL_10;
    }
  }
  v11 = -[CBCentralManager createPeripheralWithAddress:andIdentifier:](self->_centralManager, "createPeripheralWithAddress:andIdentifier:", v6, 0);
  if (v11)
  {
    v12 = v11;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCA48);
    v13 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      v14 = sub_10024882C(v6);
      v15 = objc_msgSend(v12, "identifier");
      *(_DWORD *)buf = 68289539;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2113;
      v25 = v14;
      v26 = 2114;
      v27 = v15;
      v16 = "{\"msg%{public}.0s\":\"#durian createPeripheral succeeeded\", \"address\":%{private, location:escape_only}@,"
            " \"peripheralUUID\":%{public, location:escape_only}@}";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, v16, buf, 0x26u);
    }
  }
  else
  {
    v12 = -[CBCentralManager retrievePeripheralWithAddress:](self->_centralManager, "retrievePeripheralWithAddress:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Random %hhX:%hhX:%hhX:%hhX:%hhX:%hhX"), *v8, v8[1], v8[2], v8[3], v8[4], v8[5]));
    if (v12)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCA48);
      v13 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
      {
        v17 = sub_10024882C(v6);
        v18 = objc_msgSend(v12, "identifier");
        *(_DWORD *)buf = 68289539;
        v21 = 0;
        v22 = 2082;
        v23 = "";
        v24 = 2113;
        v25 = v17;
        v26 = 2114;
        v27 = v18;
        v16 = "{\"msg%{public}.0s\":\"#durian retrievePeripheral succeeded\", \"address\":%{private, location:escape_only"
              "}@, \"peripheralUUID\":%{public, location:escape_only}@}";
        goto LABEL_21;
      }
    }
  }
  return v12;
}

- (void)onObservationForDeviceWithIdentifier:(id)a3 type:(int64_t)a4 date:(id)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10152D280;
  v6[3] = &unk_10214A1B0;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a5;
  v6[7] = a4;
  dispatch_async(queue, v6);
}

- (CLDurianDeviceDelegate)deviceDelegate
{
  return self->_deviceDelegate;
}

- (void)setDeviceDelegate:(id)a3
{
  self->_deviceDelegate = (CLDurianDeviceDelegate *)a3;
}

- (NSMutableSet)devicesBeingMaintained
{
  return (NSMutableSet *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDevicesBeingMaintained:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSMutableDictionary)devices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSMutableSet)maintenanceEvictionCandidates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 176, 1);
}

- (NSMutableDictionary)maintenanceEvictionMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 184, 1);
}

- (void)setMaintenanceEvictionMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (CLDurianScanCache)scanCache
{
  return self->_scanCache;
}

- (CLDurianMaintenanceUtilities)maintUtils
{
  return (CLDurianMaintenanceUtilities *)objc_getProperty(self, a2, 200, 1);
}

- (void)setMaintUtils:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (CBCentralManager)centralManager
{
  return (CBCentralManager *)objc_getProperty(self, a2, 208, 1);
}

- (void)setCentralManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSMutableDictionary)keyFetchTimeoutBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setKeyFetchTimeoutBlocks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSMutableDictionary)connectionTimeoutBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)setConnectionTimeoutBlocks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (unint64_t)maintDutyCycleUpgrade
{
  return self->_maintDutyCycleUpgrade;
}

- (void)setMaintDutyCycleUpgrade:(unint64_t)a3
{
  self->_maintDutyCycleUpgrade = a3;
}

- (int)coexImpactState
{
  return self->_coexImpactState;
}

- (void)setCoexImpactState:(int)a3
{
  self->_coexImpactState = a3;
}

- (CLDurianMetricManager)metricManager
{
  return (CLDurianMetricManager *)objc_getProperty(self, a2, 240, 1);
}

- (void)setMetricManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSMutableDictionary)scheduledDisconnectionBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 248, 1);
}

- (void)setScheduledDisconnectionBlocks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSMutableDictionary)scheduledConnectionEvaluationBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 256, 1);
}

- (void)setScheduledConnectionEvaluationBlocks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (BOOL)maintDiscoveryPending
{
  return self->_maintDiscoveryPending;
}

- (void)setMaintDiscoveryPending:(BOOL)a3
{
  self->_maintDiscoveryPending = a3;
}

- (CLDurianMaintenanceMetrics)maintMetrics
{
  return (CLDurianMaintenanceMetrics *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMaintMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)airplaneModeEnabled
{
  return self->_airplaneModeEnabled;
}

- (int64_t)lastCentralManagerState
{
  return self->_lastCentralManagerState;
}

- (void)setLastCentralManagerState:(int64_t)a3
{
  self->_lastCentralManagerState = a3;
}

- (BOOL)networkAvailable
{
  return self->_networkAvailable;
}

- (void)setNetworkAvailable:(BOOL)a3
{
  self->_networkAvailable = a3;
}

- (BOOL)maintenanceOnWildObservationEnabled
{
  return self->_maintenanceOnWildObservationEnabled;
}

- (void)setMaintenanceOnWildObservationEnabled:(BOOL)a3
{
  self->_maintenanceOnWildObservationEnabled = a3;
}

- (int)maintainableDeviceCount
{
  return self->_maintainableDeviceCount;
}

- (void)setMaintainableDeviceCount:(int)a3
{
  self->_maintainableDeviceCount = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 264, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (NSMutableSet)leashableUUIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 272, 1);
}

- (void)setLeashableUUIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSString)loiType
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (void)setLoiType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (unint64_t)lastFetchLogTime
{
  return self->_lastFetchLogTime;
}

- (void)setLastFetchLogTime:(unint64_t)a3
{
  self->_lastFetchLogTime = a3;
}

- (id)connectToDeviceWithAddress:(id)a3
{
  id v5;
  CLDurianMockConnectionMaterial *v6;
  CLDurianMockConnectionMaterial *v8;

  v5 = -[CLDurianDeviceManager deviceWithUUID:](self, "deviceWithUUID:", +[NSUUID UUID](NSUUID, "UUID"));
  v6 = -[CLDurianMockConnectionMaterial initWithAddress:connectionToken:]([CLDurianMockConnectionMaterial alloc], "initWithAddress:connectionToken:", a3, +[NSData data](NSData, "data"));
  v8 = v6;
  -[CLDurianDeviceManager didFetchConnectionMaterial:criteria:forDevice:error:](self, "didFetchConnectionMaterial:criteria:forDevice:error:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1), 0, v5, 0);
  -[CLDurianDeviceManager completeTokenFetchForDevice:](self, "completeTokenFetchForDevice:", v5);

  return v5;
}

@end
