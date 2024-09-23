@implementation SDSetupAgent

+ (SDSetupAgent)sharedSetupAgent
{
  if (qword_1007C6548 != -1)
    dispatch_once(&qword_1007C6548, &stru_100714EA0);
  return (SDSetupAgent *)gSDSetupAgent;
}

- (SDSetupAgent)init
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SDSetupAgent;
  v2 = -[SDSetupAgent init](&v7, "init");
  if (v2)
  {
    v3 = SFMainQueue();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)*((_QWORD *)v2 + 46);
    *((_QWORD *)v2 + 46) = v4;

    *(_QWORD *)(v2 + 252) = -1;
    *((_DWORD *)v2 + 18) = -1;
    *((_DWORD *)v2 + 69) = -1;
    *((_DWORD *)v2 + 85) = -1;
  }
  return (SDSetupAgent *)v2;
}

- (void)dealloc
{
  SDSetupAgent *v2;
  SEL v3;
  BOOL v4;
  objc_super v5;

  if (self->_deviceDiscovery)
  {
    FatalErrorF("Discovery still active during dealloc", a2);
    goto LABEL_6;
  }
  if (self->_scanTimer)
  {
LABEL_6:
    FatalErrorF("Scan timer still active during dealloc", a2);
    goto LABEL_7;
  }
  if (!self->_pinPairService)
  {
    v5.receiver = self;
    v5.super_class = (Class)SDSetupAgent;
    -[SDSetupAgent dealloc](&v5, "dealloc");
    return;
  }
LABEL_7:
  v2 = (SDSetupAgent *)FatalErrorF("PINPair still active during dealloc", a2);
  -[SDSetupAgent setPreventRepair:](v2, v3, v4);
}

- (void)setPreventRepair:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  const char *v6;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_preventRepair != v3)
  {
    if (dword_1007B0708 <= 30
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    {
      v5 = "yes";
      if (v3)
        v6 = "no";
      else
        v6 = "yes";
      if (!v3)
        v5 = "no";
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent setPreventRepair:]", 30, "Prevent repair changed: %s -> %s\n", v6, v5);
    }
    self->_preventRepair = v3;
    -[SDSetupAgent _update](self, "_update");
  }
}

- (NSString)description
{
  return (NSString *)-[SDSetupAgent descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  SFDeviceDiscovery *deviceDiscovery;
  id v6;
  NSMutableDictionary **p_triggeredDevices;
  int scanSeconds;
  const char *v9;
  id v10;
  id v11;
  NSMutableDictionary **p_devices;
  NSMutableDictionary *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  SFService *pinPairService;
  id v25;
  SFPINPairSession *pinPairSession;
  id v27;
  id v28;
  id v29;
  SFWiFiHealthMonitor *wifiHealthMonitor;
  id v31;
  SFDeviceRepairSession *repairSession;
  void *v33;
  void *v34;
  id v35;
  SFBLEScanner *watchSetupScanner;
  id v37;
  NSMutableDictionary *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  const char *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  uint64_t v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v96;
  SDSetupAgent *v97;
  NSMutableDictionary *obj;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  id v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  id v110;
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  id v116;
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  id v122;
  id v123;
  id v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  id v142;
  id v143;
  id v144;
  id v145;
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];

  v145 = 0;
  NSAppendPrintF(&v145, "-- SDSetupAgent --\n");
  v4 = v145;
  v144 = v4;
  if (self->_deviceDiscovery)
    deviceDiscovery = self->_deviceDiscovery;
  else
    deviceDiscovery = (SFDeviceDiscovery *)CFSTR("off");
  NSAppendPrintF(&v144, "Discovery: %@, %ld needSetup, %ld triggered\n", deviceDiscovery, -[NSMutableDictionary count](self->_devices, "count"), -[NSMutableDictionary count](self->_triggeredDevices, "count"));
  v6 = v144;

  p_triggeredDevices = &self->_triggeredDevices;
  scanSeconds = self->_scanSeconds;
  if (scanSeconds >= 1)
  {
    v143 = v6;
    if (self->_scanTimer)
      v9 = "on";
    else
      v9 = "off";
    NSAppendPrintF(&v143, "ScanTimer: %s, %d seconds\n", v9, scanSeconds);
    v10 = v143;

    v6 = v10;
  }
  if (self->_remoteAlertHandle)
  {
    v142 = v6;
    NSAppendPrintF(&v142, "Client UI Active: %s\n", "yes");
    v11 = v142;

    v6 = v11;
  }
  v97 = self;
  if (-[NSMutableDictionary count](self->_devices, "count"))
    p_devices = &self->_devices;
  else
    p_devices = &self->_triggeredDevices;
  v13 = *p_devices;
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  obj = v13;
  v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v138, v151, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v139;
    do
    {
      v17 = 0;
      v18 = v6;
      do
      {
        if (*(_QWORD *)v139 != v16)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * (_QWORD)v17);
        v137 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](*p_triggeredDevices, "objectForKeyedSubscript:", v19));
        if (v20)
          v21 = "TRIG";
        else
          v21 = "----";
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v19));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "description"));
        NSAppendPrintF(&v137, "    %s %@\n", v21, v23);
        v6 = v137;

        v17 = (char *)v17 + 1;
        v18 = v6;
      }
      while (v15 != v17);
      v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v138, v151, 16);
    }
    while (v15);
  }
  pinPairService = v97->_pinPairService;
  if (pinPairService)
  {
    v136 = v6;
    NSAppendPrintF(&v136, "PINPair service: %@\n", pinPairService);
    v25 = v136;

    v6 = v25;
  }
  pinPairSession = v97->_pinPairSession;
  if (pinPairSession)
  {
    v135 = v6;
    NSAppendPrintF(&v135, "PINPair session: %@, UUID %@\n", pinPairSession, v97->_pinPairUUID);
    v27 = v135;

    v6 = v27;
  }
  if (v97->_repairEnabled)
  {
    v134 = v6;
    NSAppendPrintF(&v134, "Problems: %#ll{flags}", v97->_problemFlags, &unk_1005CC0D1);
    v28 = v134;

    if (v97->_repairService)
    {
      v133 = v28;
      NSAppendPrintF(&v133, ", RepairService On");
      v29 = v133;

      v28 = v29;
    }
    wifiHealthMonitor = v97->_wifiHealthMonitor;
    if (wifiHealthMonitor)
    {
      v132 = v28;
      NSAppendPrintF(&v132, ", %@", wifiHealthMonitor);
      v31 = v132;

      v28 = v31;
    }
    v131 = v28;
    NSAppendPrintF(&v131, "\n");
    v6 = v131;

  }
  repairSession = v97->_repairSession;
  if (repairSession)
  {
    v130 = v6;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceRepairSession peerDevice](repairSession, "peerDevice"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "identifier"));
    NSAppendPrintF(&v130, "RepairSession: Yes, %@\n", v34);
    v35 = v130;

    v6 = v35;
  }
  watchSetupScanner = v97->_watchSetupScanner;
  if (watchSetupScanner)
  {
    v129 = v6;
    NSAppendPrintF(&v129, "WatchScanner: %@\n", watchSetupScanner);
    v37 = v129;

    v6 = v37;
  }
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v38 = v97->_watchSetupDevices;
  v39 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v125, v150, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v126;
    do
    {
      v42 = 0;
      v43 = v6;
      do
      {
        if (*(_QWORD *)v126 != v41)
          objc_enumerationMutation(v38);
        v44 = *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * (_QWORD)v42);
        v124 = v43;
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v97->_watchSetupDevices, "objectForKeyedSubscript:", v44));
        NSAppendPrintF(&v124, "    %@\n", v45);
        v6 = v124;

        v42 = (char *)v42 + 1;
        v43 = v6;
      }
      while (v40 != v42);
      v40 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v125, v150, 16);
    }
    while (v40);
  }

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v47 = objc_msgSend(v46, "wifiPasswordSharingAvailability");

  v123 = v6;
  if (v97->_pwsGrantingEnabled)
    v48 = "enabled";
  else
    v48 = "disabled";
  NSAppendPrintF(&v123, "Wi-Fi Password Sharing: granting %s, requesting availability: %#{flags}\n", v48, v47, &unk_1005CC1E9);
  v49 = v123;

  if (a3 <= 10)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](SDAppleIDAgent, "sharedAgent"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "myAccount"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "validationRecord"));

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDPhoneHash](v97->_statusMonitor, "myAppleIDPhoneHash"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "componentsSeparatedByString:", CFSTR(",")));

    if (objc_msgSend(v53, "count"))
    {
      v122 = v49;
      NSAppendPrintF(&v122, "Status Monitor Phone Hashes:\n");
      v54 = v122;

      v120 = 0u;
      v121 = 0u;
      v118 = 0u;
      v119 = 0u;
      v55 = v53;
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v118, v149, 16);
      if (v56)
      {
        v57 = v56;
        v58 = *(_QWORD *)v119;
        do
        {
          v59 = 0;
          v60 = v54;
          do
          {
            if (*(_QWORD *)v119 != v58)
              objc_enumerationMutation(v55);
            v61 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)v59);
            v117 = v60;
            v62 = SFHexStringForBase64EncodedString(v61);
            v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
            NSAppendPrintF(&v117, "    %@\n", v63);
            v54 = v117;

            v59 = (char *)v59 + 1;
            v60 = v54;
          }
          while (v57 != v59);
          v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v118, v149, 16);
        }
        while (v57);
      }

      v49 = v54;
    }
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "validatedPhoneHashes"));

    if (objc_msgSend(v64, "count"))
    {
      v116 = v49;
      NSAppendPrintF(&v116, "Validation Record Phone Hashes:\n");
      v65 = v116;

      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v66 = v64;
      v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v112, v148, 16);
      if (v67)
      {
        v68 = v67;
        v69 = *(_QWORD *)v113;
        do
        {
          v70 = 0;
          v71 = v65;
          do
          {
            if (*(_QWORD *)v113 != v69)
              objc_enumerationMutation(v66);
            v72 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * (_QWORD)v70);
            v111 = v71;
            NSAppendPrintF(&v111, "    %@\n", v72);
            v65 = v111;

            v70 = (char *)v70 + 1;
            v71 = v65;
          }
          while (v68 != v70);
          v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v112, v148, 16);
        }
        while (v68);
      }

      v49 = v65;
    }
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDEmailHash](v97->_statusMonitor, "myAppleIDEmailHash"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "componentsSeparatedByString:", CFSTR(",")));

    if (objc_msgSend(v74, "count"))
    {
      v110 = v49;
      NSAppendPrintF(&v110, "Status Monitor Email Hashes:\n");
      v75 = v110;

      v109 = 0u;
      v107 = 0u;
      v108 = 0u;
      v106 = 0u;
      v76 = v74;
      v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v106, v147, 16);
      if (v77)
      {
        v78 = v77;
        v79 = *(_QWORD *)v107;
        do
        {
          v80 = 0;
          v81 = v75;
          do
          {
            if (*(_QWORD *)v107 != v79)
              objc_enumerationMutation(v76);
            v82 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)v80);
            v105 = v81;
            v83 = SFHexStringForBase64EncodedString(v82);
            v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
            NSAppendPrintF(&v105, "    %@\n", v84);
            v75 = v105;

            v80 = (char *)v80 + 1;
            v81 = v75;
          }
          while (v78 != v80);
          v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v106, v147, 16);
        }
        while (v78);
      }

      v49 = v75;
    }
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "validatedEmailHashes"));

    if (objc_msgSend(v85, "count"))
    {
      v104 = v49;
      NSAppendPrintF(&v104, "Validation Record Email Hashes:\n");
      v86 = v104;

      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v87 = v85;
      v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v100, v146, 16);
      if (v88)
      {
        v89 = v88;
        v90 = *(_QWORD *)v101;
        do
        {
          v91 = 0;
          v92 = v86;
          do
          {
            if (*(_QWORD *)v101 != v90)
              objc_enumerationMutation(v87);
            v93 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)v91);
            v99 = v92;
            NSAppendPrintF(&v99, "    %@\n", v93);
            v86 = v99;

            v91 = (char *)v91 + 1;
            v92 = v86;
          }
          while (v89 != v91);
          v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v100, v146, 16);
        }
        while (v89);
      }

      v49 = v86;
    }

  }
  return v49;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100053FF4;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  NSObject *dispatchQueue;
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B0708 <= 30 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent _activate]", 30, "Activate\n");
  if (self->_profilesNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000540D4;
    handler[3] = &unk_100714EC8;
    handler[4] = self;
    notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", &self->_profilesNotifyToken, dispatchQueue, handler);
  }
  -[SDSetupAgent prefsChanged](self, "prefsChanged");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000541B8;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  int profilesNotifyToken;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B0708 <= 30 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent _invalidate]", 30, "Invalidate\n");
  profilesNotifyToken = self->_profilesNotifyToken;
  if (profilesNotifyToken != -1)
  {
    notify_cancel(profilesNotifyToken);
    self->_profilesNotifyToken = -1;
  }
  -[SDSetupAgent _ensureClientStopped](self, "_ensureClientStopped");
  -[SDSetupAgent _ensureServerStopped](self, "_ensureServerStopped");
}

- (void)nfcTagReaderUIActivateWithEndpoint:(id)a3 params:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005432C;
  v15[3] = &unk_100714EF0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(dispatchQueue, v15);

}

- (void)openSetupURL:(id)a3
{
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_remoteAlertHandle)
  {
    if (dword_1007B0708 <= 30
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent openSetupURL:]", 30, "Deferring open setup URL until setup UI dismisses: %@\n", v5);
    }
    objc_storeStrong((id *)&self->_setupURL, a3);
  }
  else
  {
    -[SDSetupAgent _openSetupURL:](self, "_openSetupURL:", v5);
  }

}

- (void)_openSetupURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  id v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v3 = a3;
  v9[0] = FBSOpenApplicationOptionKeyUnlockDevice;
  v9[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v10[0] = &__kCFBooleanTrue;
  v10[1] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v8 = 0;
  v6 = objc_msgSend(v5, "openSensitiveURL:withOptions:error:", v3, v4, &v8);
  v7 = v8;

  if (v6)
  {
    if (dword_1007B0708 <= 30
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _openSetupURL:]", 30, "Opened setup URL: %@\n", v3);
    }
  }
  else if (dword_1007B0708 <= 60
         && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 60)))
  {
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent _openSetupURL:]", 60, "### Open setup URL failed: %@, %{error}\n", v3, v7);
  }

}

- (void)prefsChanged
{
  id v3;
  id v4;
  NSData *bleAuthTagFilter;
  NSData *v6;
  NSData *v7;
  NSData *v8;
  unsigned __int8 v9;
  NSData *v10;
  NSData *v11;
  uint64_t Int64;
  BOOL v13;
  _BOOL4 v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  _BOOL4 v18;
  uint64_t v19;
  int v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  _BOOL4 v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  _BOOL4 v28;
  uint64_t v29;
  int v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  _BOOL4 v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  char v38;
  uint64_t v39;
  BOOL v40;
  _BOOL4 v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t scanSeconds;
  uint64_t v48;
  _BOOL4 v49;
  uint64_t v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  _BOOL4 v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  _BOOL4 v58;
  uint64_t v59;
  int v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  int v64;
  uint64_t v65;

  v64 = 0;
  v65 = 0;
  v63 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  CFPrefs_GetData(CFSTR("com.apple.Sharing"), CFSTR("nearbyAuthTagFilter"), &v65, 8, &v63, &v64);
  v3 = 0;
  if (!v64)
  {
    v4 = objc_alloc((Class)NSData);
    v3 = objc_msgSend(v4, "initWithBytes:length:", &v65, v63);
  }
  bleAuthTagFilter = self->_bleAuthTagFilter;
  v6 = (NSData *)v3;
  v7 = bleAuthTagFilter;
  if (v6 == v7)
  {

    v10 = v6;
LABEL_14:

    goto LABEL_15;
  }
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_9:
    if (dword_1007B0708 <= 40
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 40)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent prefsChanged]", 40, "AuthTag filter: %@ -> %@\n", self->_bleAuthTagFilter, v6);
    }
    v11 = v6;
    v10 = self->_bleAuthTagFilter;
    self->_bleAuthTagFilter = v11;
    goto LABEL_14;
  }
  v9 = -[NSData isEqual:](v6, "isEqual:", v7);

  if ((v9 & 1) == 0)
    goto LABEL_9;
LABEL_15:
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("saCDP"), &v64);
  if (v64)
    v13 = 0;
  else
    v13 = Int64 == 0;
  v14 = !v13;
  if (self->_cdpEnabled != v14)
  {
    if (dword_1007B0708 <= 40
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 40)))
    {
      v15 = "yes";
      if (v14)
        v16 = "no";
      else
        v16 = "yes";
      if (!v14)
        v15 = "no";
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent prefsChanged]", 40, "Repair CDP enabled: %s -> %s\n", v16, v15);
    }
    self->_cdpEnabled = v14;
  }
  v17 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("saClientEnabled"), &v64);
  v18 = v17 != 0;
  if (v64)
  {
    v19 = v17;
    v20 = SFIsDeviceAudioAccessory(v17) ^ 1;
    if (v19)
      v18 = 1;
    else
      v18 = v20;
  }
  if (self->_clientEnabled != v18)
  {
    if (dword_1007B0708 <= 40
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 40)))
    {
      v21 = "yes";
      if (v18)
        v22 = "no";
      else
        v22 = "yes";
      if (!v18)
        v21 = "no";
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent prefsChanged]", 40, "Client enabled: %s -> %s\n", v22, v21);
    }
    self->_clientEnabled = v18;
  }
  v23 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("pwsAutoGrant"), &v64);
  if (v64 || (v24 = v23 != 0, !IsAppleInternalBuild()))
    v24 = 0;
  if (self->_pwsAutoGrantingEnabled != v24)
  {
    if (dword_1007B0708 <= 40
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 40)))
    {
      v25 = "yes";
      if (v24)
        v26 = "no";
      else
        v26 = "yes";
      if (!v24)
        v25 = "no";
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent prefsChanged]", 40, "Wi-Fi password sharing autoGranting enabled: %s -> %s\n", v26, v25);
    }
    self->_pwsAutoGrantingEnabled = v24;
  }
  v27 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("pwsGrantingEnabled"), &v64);
  v28 = v27 != 0;
  if (v64)
  {
    v29 = v27;
    v30 = SFIsDeviceAudioAccessory(v27) ^ 1;
    if (v29)
      v28 = 1;
    else
      v28 = v30;
  }
  if (self->_pwsGrantingEnabled != v28)
  {
    if (dword_1007B0708 <= 40
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 40)))
    {
      v31 = "yes";
      if (v28)
        v32 = "no";
      else
        v32 = "yes";
      if (!v28)
        v31 = "no";
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent prefsChanged]", 40, "Wi-Fi password sharing granting enabled: %s -> %s\n", v32, v31);
    }
    self->_pwsGrantingEnabled = v28;
  }
  v33 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("saRepairEnabled"), &v64);
  v34 = v33 != 0;
  if (v64)
  {
    v35 = v33;
    v33 = SFIsDeviceAudioAccessory(v33);
    if (v35)
      v34 = 1;
    else
      v34 = v33;
  }
  if (self->_repairEnabled != v34)
  {
    if (dword_1007B0708 <= 40)
    {
      if (dword_1007B0708 != -1 || (v33 = _LogCategory_Initialize(&dword_1007B0708, 40), (_DWORD)v33))
      {
        v36 = "yes";
        if (v34)
          v37 = "no";
        else
          v37 = "yes";
        if (!v34)
          v36 = "no";
        v33 = LogPrintF(&dword_1007B0708, "-[SDSetupAgent prefsChanged]", 40, "Repair enabled: %s -> %s\n", v37, v36);
      }
    }
    self->_repairEnabled = v34;
  }
  *(_WORD *)&self->_prefRepairAccounts = 0;
  v38 = SFIsDeviceAudioAccessory(v33);
  self->_prefRepairVPN = v38;
  self->_prefRepairWiFi = v38;
  v39 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("saRepairSilent"), &v64);
  if (v64)
    v40 = 0;
  else
    v40 = v39 == 0;
  v41 = !v40;
  if (self->_repairSilent != v41)
  {
    if (dword_1007B0708 <= 40
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 40)))
    {
      v42 = "yes";
      if (v41)
        v43 = "no";
      else
        v43 = "yes";
      if (!v41)
        v42 = "no";
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent prefsChanged]", 40, "Repair silent: %s -> %s\n", v43, v42);
    }
    self->_repairSilent = v41;
  }
  v44 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("saScanSeconds"), &v64);
  if (v44 < 0)
    v45 = -1;
  else
    v45 = v44;
  if (v45 >= 100000)
    v45 = 100000;
  if (v64)
    v46 = -1;
  else
    v46 = v45;
  scanSeconds = self->_scanSeconds;
  if (v46 != scanSeconds)
  {
    if (dword_1007B0708 <= 40)
    {
      if (dword_1007B0708 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B0708, 40))
          goto LABEL_121;
        LODWORD(scanSeconds) = self->_scanSeconds;
      }
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent prefsChanged]", 40, "Scan seconds: %d -> %lld\n", scanSeconds, v46);
    }
LABEL_121:
    self->_scanSeconds = v46;
  }
  v48 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("saServerEnabled"), &v64);
  v49 = v48 != 0;
  if (self->_serverEnabled != v49)
  {
    if (dword_1007B0708 <= 40)
    {
      v50 = v48;
      if (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 40))
      {
        v51 = "yes";
        if (v50)
          v52 = "no";
        else
          v52 = "yes";
        if (!v50)
          v51 = "no";
        LogPrintF(&dword_1007B0708, "-[SDSetupAgent prefsChanged]", 40, "Server enabled: %s -> %s\n", v52, v51);
      }
    }
    self->_serverEnabled = v49;
  }
  v53 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("saWatchMigration"), &v64);
  v54 = v53 != 0;
  if (v64)
    v54 = (v53 != 0) & ~SFIsDevicePhone();
  if (self->_watchMigrationEnabled != v54)
  {
    if (dword_1007B0708 <= 40
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 40)))
    {
      v55 = "yes";
      if (v54)
        v56 = "no";
      else
        v56 = "yes";
      if (!v54)
        v55 = "no";
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent prefsChanged]", 40, "WatchMigration enabled: %s -> %s\n", v56, v55);
    }
    self->_watchMigrationEnabled = v54;
  }
  v57 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("saWatch"), &v64);
  v58 = v57 != 0;
  if (v64)
  {
    v59 = v57;
    v60 = SFIsDevicePhone();
    if (v59)
      v58 = 1;
    else
      v58 = v60;
  }
  if (self->_watchSetupEnabled != v58)
  {
    if (dword_1007B0708 <= 40
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 40)))
    {
      v61 = "yes";
      if (v58)
        v62 = "no";
      else
        v62 = "yes";
      if (!v58)
        v61 = "no";
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent prefsChanged]", 40, "WatchSetup enabled: %s -> %s\n", v62, v61);
    }
    self->_watchSetupEnabled = v58;
  }
  -[SDSetupAgent _update](self, "_update");

}

- (BOOL)reenableProxCardType:(unsigned __int8)a3
{
  int v3;
  BOOL result;
  uint64_t v6;
  const char *v7;

  v3 = a3;
  result = 0;
  if ((int)a3 > 24)
  {
    switch(a3)
    {
      case 0x19u:
      case 0x1Eu:
        v6 = 158;
        goto LABEL_18;
      case 0x1Au:
      case 0x1Bu:
      case 0x1Cu:
      case 0x1Du:
      case 0x1Fu:
      case 0x22u:
      case 0x23u:
        return result;
      case 0x20u:
        goto LABEL_12;
      case 0x21u:
LABEL_11:
        v6 = 155;
        goto LABEL_18;
      case 0x24u:
        v6 = 170;
        goto LABEL_18;
      default:
        if (a3 == 43)
        {
LABEL_12:
          v6 = 171;
LABEL_18:
          *((_BYTE *)&self->super.isa + v6) = 0;
          if (dword_1007B0708 <= 30
            && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
          {
            v7 = sub_10005511C(v3);
            LogPrintF(&dword_1007B0708, "-[SDSetupAgent reenableProxCardType:]", 30, "Re-enabled prox card type %s\n", v7);
          }
          result = 1;
        }
        else if (a3 == 100)
        {
          if (dword_1007B0708 <= 30
            && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
          {
            LogPrintF(&dword_1007B0708, "-[SDSetupAgent reenableProxCardType:]", 30, "Re-enable B238Setup after WiFi Connects\n");
          }
          result = 1;
          self->_renableB238SetupAfterWiFi = 1;
        }
        break;
    }
  }
  else
  {
    v6 = 152;
    switch(a3)
    {
      case 1u:
        v6 = 153;
        goto LABEL_18;
      case 5u:
        v6 = 168;
        goto LABEL_18;
      case 6u:
        goto LABEL_18;
      case 9u:
        v6 = 156;
        goto LABEL_18;
      case 0xAu:
        v6 = 157;
        goto LABEL_18;
      case 0xBu:
        goto LABEL_11;
      case 0xDu:
        v6 = 169;
        goto LABEL_18;
      default:
        return result;
    }
  }
  return result;
}

- (void)repairDevice:(id)a3 flags:(unsigned int)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned int v16;

  v8 = a3;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100055408;
  v13[3] = &unk_100714F18;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

- (void)retriggerProximitySetup:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000554BC;
  v7[3] = &unk_100714F40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)setupDevice:(id)a3 homeIdentifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *dispatchQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005589C;
  block[3] = &unk_100714F68;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(dispatchQueue, block);

}

- (void)showDevicePickerWithInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055980;
  block[3] = &unk_100714F90;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

- (void)triggerHomeKitDeviceDetectedWithURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055BA0;
  block[3] = &unk_100714F90;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

- (void)_update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_clientEnabled)
    -[SDSetupAgent _ensureClientStarted](self, "_ensureClientStarted");
  else
    -[SDSetupAgent _ensureClientStopped](self, "_ensureClientStopped");
  if (self->_serverEnabled)
    -[SDSetupAgent _ensureServerStarted](self, "_ensureServerStarted");
  else
    -[SDSetupAgent _ensureServerStopped](self, "_ensureServerStopped");
  if (self->_repairEnabled && !self->_preventRepair)
    -[SDSetupAgent _repairEnsuredStarted](self, "_repairEnsuredStarted");
  else
    -[SDSetupAgent _repairEnsuredStopped](self, "_repairEnsuredStopped");
}

- (void)_ensureClientStarted
{
  NSObject *dispatchQueue;
  void *v4;
  SDStatusMonitor *v5;
  SDStatusMonitor *statusMonitor;
  CUSystemMonitor *v7;
  CUSystemMonitor *systemMonitor;
  CUSystemMonitor *v9;
  unsigned int scanEligible;
  unsigned int v11;
  unsigned int v12;
  const char *v13;
  const char *v14;
  OS_dispatch_source *scanTimer;
  NSObject *v16;
  OS_dispatch_source *v17;
  uint64_t scanSeconds;
  OS_dispatch_source *v19;
  OS_dispatch_source *v20;
  NSObject *v21;
  unint64_t v22;
  NSObject *v23;
  dispatch_time_t v24;
  OS_dispatch_source *v25;
  NSObject *v26;
  OS_dispatch_source *v27;
  SFDeviceDiscovery *v28;
  SFDeviceDiscovery *deviceDiscovery;
  SFDeviceDiscovery *v30;
  NSMutableDictionary *devices;
  CUUserNotificationSession *unoteTVLatencySetup;
  OS_dispatch_source *watchFastScanTimer;
  NSObject *v34;
  OS_dispatch_source *v35;
  SFBLEScanner *v36;
  NSMutableDictionary *watchSetupDevices;
  SFBLEScanner *v38;
  SFBLEScanner *watchSetupScanner;
  SDProximityController *v40;
  SDProximityController *proximityController;
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_iTunesNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100056644;
    handler[3] = &unk_100714EC8;
    handler[4] = self;
    notify_register_dispatch("com.apple.itunesstored.accountschanged", &self->_iTunesNotifyToken, dispatchQueue, handler);
  }
  if (!self->_statusMonitor)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "_appleAccountSignIn:", CFSTR("com.apple.sharingd.AppleAccountSignIn"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "_screenStateChanged", CFSTR("com.apple.sharingd.ScreenStateChanged"), 0);
    v5 = (SDStatusMonitor *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = v5;

  }
  if (!self->_systemMonitor)
  {
    v7 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v7;

    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1000566D0;
    v51[3] = &unk_1007146D8;
    v51[4] = self;
    -[CUSystemMonitor setPrimaryAppleIDChangedHandler:](self->_systemMonitor, "setPrimaryAppleIDChangedHandler:", v51);
    -[CUSystemMonitor setCallChangedHandler:](self->_systemMonitor, "setCallChangedHandler:", &stru_100714FB0);
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1000566DC;
    v50[3] = &unk_1007146D8;
    v50[4] = self;
    -[CUSystemMonitor setScreenLockedChangedHandler:](self->_systemMonitor, "setScreenLockedChangedHandler:", v50);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1000566E4;
    v49[3] = &unk_1007146D8;
    v49[4] = self;
    -[CUSystemMonitor setWifiStateChangedHandler:](self->_systemMonitor, "setWifiStateChangedHandler:", v49);
    v9 = self->_systemMonitor;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1000566EC;
    v48[3] = &unk_1007146D8;
    v48[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v9, "activateWithCompletion:", v48);
  }
  scanEligible = self->_scanEligible;
  v11 = -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn");
  self->_scanEligible = v11;
  v12 = scanEligible;
  if (scanEligible != v11)
  {
    if (dword_1007B0708 <= 30)
    {
      if (dword_1007B0708 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B0708, 30))
          goto LABEL_26;
        v11 = self->_scanEligible;
      }
      v13 = "yes";
      if (scanEligible)
        v14 = "yes";
      else
        v14 = "no";
      if (!v11)
        v13 = "no";
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _ensureClientStarted]", 30, "ScanEligible: %s -> %s\n", v14, v13);
LABEL_26:
      if (!self->_scanEligible)
        goto LABEL_27;
      goto LABEL_18;
    }
    v12 = v11;
  }
  if (!v12)
  {
LABEL_27:
    self->_shouldScan = 0;
    goto LABEL_30;
  }
LABEL_18:
  if (!scanEligible)
  {
    self->_shouldScan = 1;
    scanTimer = self->_scanTimer;
    if (scanTimer)
    {
      v16 = scanTimer;
      dispatch_source_cancel(v16);
      v17 = self->_scanTimer;
      self->_scanTimer = 0;

    }
    scanSeconds = self->_scanSeconds;
    if ((int)scanSeconds >= 1)
    {
      if (dword_1007B0708 <= 30)
      {
        if (dword_1007B0708 == -1)
        {
          if (!_LogCategory_Initialize(&dword_1007B0708, 30))
            goto LABEL_29;
          scanSeconds = self->_scanSeconds;
        }
        LogPrintF(&dword_1007B0708, "-[SDSetupAgent _ensureClientStarted]", 30, "Start scan timer for %{dur}\n", scanSeconds);
      }
LABEL_29:
      v19 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      v20 = self->_scanTimer;
      self->_scanTimer = v19;

      v21 = self->_scanTimer;
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_100056714;
      v47[3] = &unk_1007146D8;
      v47[4] = self;
      dispatch_source_set_event_handler(v21, v47);
      v22 = 1000000000 * self->_scanSeconds;
      v23 = self->_scanTimer;
      v24 = dispatch_time(0, v22);
      dispatch_source_set_timer(v23, v24, 0xFFFFFFFFFFFFFFFFLL, v22 / 0xA);
      dispatch_resume((dispatch_object_t)self->_scanTimer);
    }
  }
LABEL_30:
  if (self->_shouldScan)
  {
    if (!self->_deviceDiscovery)
    {
      if (dword_1007B0708 <= 30
        && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
      {
        LogPrintF(&dword_1007B0708, "-[SDSetupAgent _ensureClientStarted]", 30, "Discovery start\n");
      }
      v28 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
      deviceDiscovery = self->_deviceDiscovery;
      self->_deviceDiscovery = v28;

      -[SFDeviceDiscovery setChangeFlags:](self->_deviceDiscovery, "setChangeFlags:", 5);
      -[SFDeviceDiscovery setDiscoveryFlags:](self->_deviceDiscovery, "setDiscoveryFlags:", 100794240);
      -[SFDeviceDiscovery setFastScanMode:](self->_deviceDiscovery, "setFastScanMode:", 2);
      -[SFDeviceDiscovery setPurpose:](self->_deviceDiscovery, "setPurpose:", CFSTR("SetupAgent"));
      -[SFDeviceDiscovery setScanRate:](self->_deviceDiscovery, "setScanRate:", 20);
      -[SFDeviceDiscovery setRssiThreshold:](self->_deviceDiscovery, "setRssiThreshold:", -70);
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_10005671C;
      v46[3] = &unk_100714FD8;
      v46[4] = self;
      -[SFDeviceDiscovery setDeviceFoundHandler:](self->_deviceDiscovery, "setDeviceFoundHandler:", v46);
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100056728;
      v45[3] = &unk_100714FD8;
      v45[4] = self;
      -[SFDeviceDiscovery setDeviceLostHandler:](self->_deviceDiscovery, "setDeviceLostHandler:", v45);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100056734;
      v44[3] = &unk_100715000;
      v44[4] = self;
      -[SFDeviceDiscovery setDeviceChangedHandler:](self->_deviceDiscovery, "setDeviceChangedHandler:", v44);
      -[SFDeviceDiscovery activateWithCompletion:](self->_deviceDiscovery, "activateWithCompletion:", &stru_100715020);
    }
    if (self->_watchSetupEnabled && !self->_watchSetupScanner)
    {
      if (dword_1007B0708 <= 30
        && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
      {
        LogPrintF(&dword_1007B0708, "-[SDSetupAgent _ensureClientStarted]", 30, "WatchScan start\n");
      }
      v38 = (SFBLEScanner *)objc_msgSend(objc_alloc((Class)SFBLEScanner), "initWithType:", 17);
      watchSetupScanner = self->_watchSetupScanner;
      self->_watchSetupScanner = v38;

      -[SFBLEScanner setDispatchQueue:](self->_watchSetupScanner, "setDispatchQueue:", self->_dispatchQueue);
      -[SFBLEScanner setChangeFlags:](self->_watchSetupScanner, "setChangeFlags:", 13);
      -[SFBLEScanner setRssiThreshold:](self->_watchSetupScanner, "setRssiThreshold:", -60);
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100056814;
      v43[3] = &unk_100715048;
      v43[4] = self;
      -[SFBLEScanner setDeviceFoundHandler:](self->_watchSetupScanner, "setDeviceFoundHandler:", v43);
      -[SFBLEScanner setDeviceLostHandler:](self->_watchSetupScanner, "setDeviceLostHandler:", &stru_100715088);
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_10005692C;
      v42[3] = &unk_1007150B0;
      v42[4] = self;
      -[SFBLEScanner setDeviceChangedHandler:](self->_watchSetupScanner, "setDeviceChangedHandler:", v42);
      -[SFBLEScanner activateWithCompletion:](self->_watchSetupScanner, "activateWithCompletion:", &stru_1007150D0);
      if (!self->_proximityController)
      {
        v40 = (SDProximityController *)objc_claimAutoreleasedReturnValue(+[SDProximityController sharedController](SDProximityController, "sharedController"));
        proximityController = self->_proximityController;
        self->_proximityController = v40;

      }
    }
  }
  else
  {
    v25 = self->_scanTimer;
    if (v25)
    {
      v26 = v25;
      dispatch_source_cancel(v26);
      v27 = self->_scanTimer;
      self->_scanTimer = 0;

    }
    if (self->_deviceDiscovery)
    {
      if (dword_1007B0708 <= 30
        && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
      {
        LogPrintF(&dword_1007B0708, "-[SDSetupAgent _ensureClientStarted]", 30, "Discovery stop (shouldn't scan)\n");
      }
      -[SFDeviceDiscovery invalidate](self->_deviceDiscovery, "invalidate");
      v30 = self->_deviceDiscovery;
      self->_deviceDiscovery = 0;

      -[NSMutableDictionary removeAllObjects](self->_devices, "removeAllObjects");
      devices = self->_devices;
      self->_devices = 0;

      -[SDSetupAgent _resetTriggers](self, "_resetTriggers");
    }
    -[CUUserNotificationSession invalidate](self->_unoteTVLatencySetup, "invalidate");
    unoteTVLatencySetup = self->_unoteTVLatencySetup;
    self->_unoteTVLatencySetup = 0;

    watchFastScanTimer = self->_watchFastScanTimer;
    if (watchFastScanTimer)
    {
      v34 = watchFastScanTimer;
      dispatch_source_cancel(v34);
      v35 = self->_watchFastScanTimer;
      self->_watchFastScanTimer = 0;

    }
    if (self->_watchSetupScanner)
    {
      if (dword_1007B0708 <= 30
        && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
      {
        LogPrintF(&dword_1007B0708, "-[SDSetupAgent _ensureClientStarted]", 30, "WatchScan stop (shouldn't scan)\n");
      }
      -[SFBLEScanner invalidate](self->_watchSetupScanner, "invalidate");
      v36 = self->_watchSetupScanner;
      self->_watchSetupScanner = 0;

      -[NSMutableDictionary removeAllObjects](self->_watchSetupDevices, "removeAllObjects");
      watchSetupDevices = self->_watchSetupDevices;
      self->_watchSetupDevices = 0;

      self->_triggeredUIWatchSetup = 0;
    }
  }
}

- (void)_ensureClientStopped
{
  int iTunesNotifyToken;
  void *v4;
  SDStatusMonitor *statusMonitor;
  CUSystemMonitor *systemMonitor;
  SFDeviceDiscovery *deviceDiscovery;
  NSMutableDictionary *devices;
  OS_dispatch_source *scanTimer;
  NSObject *v10;
  OS_dispatch_source *v11;
  SBSRemoteAlertHandle *remoteAlertHandle;
  SBSRemoteAlertHandle *v13;
  SFDeviceRepairSession *repairSession;
  NSURL *setupURL;
  CUUserNotificationSession *unoteTVLatencySetup;
  OS_dispatch_source *watchFastScanTimer;
  NSObject *v18;
  OS_dispatch_source *v19;
  SFBLEScanner *watchSetupScanner;
  NSMutableDictionary *watchSetupDevices;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  iTunesNotifyToken = self->_iTunesNotifyToken;
  if (iTunesNotifyToken != -1)
  {
    notify_cancel(iTunesNotifyToken);
    self->_iTunesNotifyToken = -1;
  }
  if (self->_statusMonitor)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.AppleAccountSignIn"), 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.ScreenStateChanged"), 0);
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = 0;

  }
  -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0;

  if (self->_deviceDiscovery)
  {
    if (dword_1007B0708 <= 30
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _ensureClientStopped]", 30, "Discovery stop (stopped)\n");
    }
    -[SFDeviceDiscovery invalidate](self->_deviceDiscovery, "invalidate");
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = 0;

  }
  -[NSMutableDictionary removeAllObjects](self->_devices, "removeAllObjects");
  devices = self->_devices;
  self->_devices = 0;

  self->_scanEligible = 0;
  scanTimer = self->_scanTimer;
  if (scanTimer)
  {
    v10 = scanTimer;
    dispatch_source_cancel(v10);
    v11 = self->_scanTimer;
    self->_scanTimer = 0;

  }
  self->_shouldScan = 0;
  -[SDSetupAgent _resetTriggers](self, "_resetTriggers");
  remoteAlertHandle = self->_remoteAlertHandle;
  if (remoteAlertHandle)
  {
    -[SBSRemoteAlertHandle removeObserver:](remoteAlertHandle, "removeObserver:", self);
    -[SBSRemoteAlertHandle invalidate](self->_remoteAlertHandle, "invalidate");
    v13 = self->_remoteAlertHandle;
    self->_remoteAlertHandle = 0;

  }
  -[SFDeviceRepairSession invalidate](self->_repairSession, "invalidate");
  repairSession = self->_repairSession;
  self->_repairSession = 0;

  setupURL = self->_setupURL;
  self->_setupURL = 0;

  -[CUUserNotificationSession invalidate](self->_unoteTVLatencySetup, "invalidate");
  unoteTVLatencySetup = self->_unoteTVLatencySetup;
  self->_unoteTVLatencySetup = 0;

  watchFastScanTimer = self->_watchFastScanTimer;
  if (watchFastScanTimer)
  {
    v18 = watchFastScanTimer;
    dispatch_source_cancel(v18);
    v19 = self->_watchFastScanTimer;
    self->_watchFastScanTimer = 0;

  }
  if (self->_watchSetupScanner)
  {
    if (dword_1007B0708 <= 30
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _ensureClientStopped]", 30, "WatchScan stop (stopped)\n");
    }
    -[SFBLEScanner invalidate](self->_watchSetupScanner, "invalidate");
    watchSetupScanner = self->_watchSetupScanner;
    self->_watchSetupScanner = 0;

  }
  -[NSMutableDictionary removeAllObjects](self->_watchSetupDevices, "removeAllObjects");
  watchSetupDevices = self->_watchSetupDevices;
  self->_watchSetupDevices = 0;

  self->_triggeredUIWatchSetup = 0;
}

- (void)_deviceFound:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *devices;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  CUUserNotificationSession *unoteTVLatencySetup;
  void *v13;
  void *v14;
  unsigned int v15;
  CUUserNotificationSession *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  unsigned int v21;
  double v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v28;
  NSData *bleAuthTagFilter;
  NSData *v30;
  NSData *v31;
  NSData *v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  NSMutableDictionary *triggeredDevices;
  NSMutableDictionary *v37;
  NSMutableDictionary *v38;
  void *v39;
  unsigned __int8 v40;
  void *v41;
  unsigned __int8 v42;
  void *v43;
  unsigned __int8 v44;
  void *v45;
  unsigned __int8 v46;
  void *v47;
  unsigned __int8 v48;
  void *v49;
  unsigned __int8 v50;
  const char *v51;
  void *v52;
  unsigned __int8 v53;
  void *v54;
  unsigned __int8 v55;
  SDSetupAgent *v56;
  id v57;
  uint64_t v58;
  void *v59;
  unsigned __int8 v60;
  const char *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[4];
  _QWORD v74[4];

  v4 = a3;
  v5 = objc_msgSend(v4, "deviceActionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v8 = 0;
  if (!self->_deviceDiscovery || !v7)
    goto LABEL_168;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v7));
  if (!objc_msgSend(v4, "needsSetup"))
  {
    if (v8)
      -[SDSetupAgent _postDeviceSetupNotificationForDevice:present:](self, "_postDeviceSetupNotificationForDevice:present:", v4, 1);
    -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v7);
    if (objc_msgSend(v8, "deviceActionType") == 12
      || objc_msgSend(v8, "deviceActionType") == 17)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_triggeredDevices, "removeObjectForKey:", v7);
    }
    else if (objc_msgSend(v8, "deviceActionType") == 27)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
      objc_msgSend(v20, "setBoostNearbyInfo:", 0);

    }
    else if (objc_msgSend(v8, "deviceActionType") == 8)
    {
      -[SDSetupAgent _uiStopIfNeededWithDevice:](self, "_uiStopIfNeededWithDevice:", v7);
    }
    unoteTVLatencySetup = self->_unoteTVLatencySetup;
    if (unoteTVLatencySetup)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CUUserNotificationSession identifier](unoteTVLatencySetup, "identifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if (v15)
      {
        -[CUUserNotificationSession invalidate](self->_unoteTVLatencySetup, "invalidate");
        v16 = self->_unoteTVLatencySetup;
        self->_unoteTVLatencySetup = 0;

      }
    }
    goto LABEL_168;
  }
  devices = self->_devices;
  if (!devices)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v11 = self->_devices;
    self->_devices = v10;

    devices = self->_devices;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v4, v7);
  if (!gSDProxCardsSuppressed && !-[SDSetupAgent _uiShowing](self, "_uiShowing"))
  {
    if ((_DWORD)v5 == 30 || (_DWORD)v5 == 25)
    {
      if ((-[SDStatusMonitor systemUIFlags](self->_statusMonitor, "systemUIFlags") & 0x7C808) != 0)
        goto LABEL_168;
    }
    else
    {
      if ((-[SDStatusMonitor systemUIFlags](self->_statusMonitor, "systemUIFlags") & 0x7C809) != 0)
        goto LABEL_168;
      if (v5 <= 0x1B && ((1 << (char)v5) & 0x8021100) != 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggeredDevices, "objectForKeyedSubscript:", v7));

        if (v17)
          goto LABEL_168;
      }
    }
    -[SDProximityController sender:notifyBluetoothSample:](self->_proximityController, "sender:notifyBluetoothSample:", self, v4);
    if (objc_msgSend(v6, "triggered"))
    {
      if (dword_1007B0708 <= 50
        && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
      {
        v18 = objc_msgSend(v4, "deviceActionType");
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
        LogPrintF(&dword_1007B0708, "-[SDSetupAgent _deviceFound:]", 50, "#ni_estimator SDSetupAgent trigger launched with actiontype: %d for device: %@", v18, v19);

      }
      if ((_DWORD)v5 != 33 && (_DWORD)v5 != 11
        || !-[CUSystemMonitor activeCallCount](self->_systemMonitor, "activeCallCount"))
      {
        v21 = -[SDSetupAgent _screenLocked](self, "_screenLocked");
        if (v5 <= 0x24 && ((1 << (char)v5) & 0x1042000200) != 0)
        {
          if (v21)
          {
            v22 = CACurrentMediaTime();
            if (v22 - BKSHIDServicesLastUserEventTime() > 30.0)
            {
              if (dword_1007B0708 <= 30
                && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
              {
                v70 = v6;
                v23 = "Ignoring proximity for non-user initiated lock screen: %@\n";
                v24 = 30;
LABEL_41:
                LogPrintF(&dword_1007B0708, "-[SDSetupAgent _deviceFound:]", v24, v23, v70);
                goto LABEL_168;
              }
              goto LABEL_168;
            }
          }
        }
        else if ((v21 & 1) != 0)
        {
          goto LABEL_168;
        }
        if (self->_bleAuthTagFilter)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "advertisementFields"));
          TypeID = CFDataGetTypeID();
          TypedValue = CFDictionaryGetTypedValue(v25, CFSTR("at"), TypeID, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

          bleAuthTagFilter = self->_bleAuthTagFilter;
          v30 = v28;
          v31 = bleAuthTagFilter;
          if (v30 == v31)
          {

          }
          else
          {
            v32 = v31;
            if ((v30 == 0) == (v31 != 0))
            {

              goto LABEL_168;
            }
            v33 = -[NSData isEqual:](v30, "isEqual:", v31);

            if (!v33)
              goto LABEL_168;
          }
        }
        v34 = SFStoreDemoMode();
        if ((v34 & 1) != 0 || (SFLostMode(v34, v35) & 1) != 0)
          goto LABEL_168;
        triggeredDevices = self->_triggeredDevices;
        if (!triggeredDevices)
        {
          v37 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v38 = self->_triggeredDevices;
          self->_triggeredDevices = v37;

          triggeredDevices = self->_triggeredDevices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](triggeredDevices, "setObject:forKeyedSubscript:", v4, v7);
        -[SDSetupAgent _postDeviceSetupNotificationForDevice:present:](self, "_postDeviceSetupNotificationForDevice:present:", v4, 1);
        -[SFDeviceDiscovery fastScanCancel:](self->_deviceDiscovery, "fastScanCancel:", CFSTR("Triggered"));
        switch((int)v5)
        {
          case 1:
            if (self->_triggeredUIAppleTVSetup)
            {
              if (dword_1007B0708 <= 50
                && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
              {
                v70 = v6;
                v23 = "Ignoring proximity AppleTVSetup with another %@\n";
                goto LABEL_100;
              }
            }
            else
            {
              v43 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
              v44 = objc_msgSend(v43, "isProximitySetupToNewDeviceAllowed");

              if ((v44 & 1) != 0)
              {
                self->_triggeredUIAppleTVSetup = 1;
                if (dword_1007B0708 <= 50
                  && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
                {
                  LogPrintF(&dword_1007B0708, "-[SDSetupAgent _deviceFound:]", 50, "Triggering proximity AppleTVSetup with %@\n", v6);
                }
                -[SDSetupAgent _uiStartAppleTVSetup:extraInfo:](self, "_uiStartAppleTVSetup:extraInfo:", v4, 0);
                goto LABEL_166;
              }
              if (dword_1007B0708 <= 50
                && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
              {
                v70 = v6;
                v23 = "Ignoring proximity AppleTVSetup when not allowed for %@\n";
                goto LABEL_100;
              }
            }
            break;
          case 2:
          case 3:
          case 4:
          case 5:
          case 7:
          case 14:
          case 15:
          case 16:
          case 18:
          case 19:
          case 20:
          case 21:
          case 22:
          case 23:
          case 24:
          case 26:
          case 28:
          case 29:
          case 31:
          case 34:
          case 35:
            break;
          case 6:
            if (self->_triggeredUIAppleTVPair)
            {
              if (dword_1007B0708 <= 50
                && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
              {
                v70 = v6;
                v23 = "Ignoring proximity AppleTVPair with another %@\n";
                goto LABEL_100;
              }
            }
            else
            {
              v45 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
              v46 = objc_msgSend(v45, "isProximitySetupToNewDeviceAllowed");

              if ((v46 & 1) != 0)
              {
                self->_triggeredUIAppleTVPair = 1;
                if (dword_1007B0708 <= 50
                  && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
                {
                  LogPrintF(&dword_1007B0708, "-[SDSetupAgent _deviceFound:]", 50, "Triggering proximity AppleTVPair with %@\n", v6);
                }
                -[SDSetupAgent _uiStartPair:extraInfo:](self, "_uiStartPair:extraInfo:", v4, 0);
                goto LABEL_166;
              }
              if (dword_1007B0708 <= 50
                && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
              {
                v70 = v6;
                v23 = "Ignoring proximity AppleTVPair when not allowed for %@\n";
                goto LABEL_100;
              }
            }
            break;
          case 8:
            v47 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
            v48 = objc_msgSend(v47, "isWiFiPasswordSharingAllowed");

            if ((v48 & 1) != 0)
            {
              if (self->_pwsGrantingEnabled && -[SDSetupAgent _shouldOfferPassword:](self, "_shouldOfferPassword:", v4))
              {
                if (dword_1007B0708 <= 50
                  && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
                {
                  LogPrintF(&dword_1007B0708, "-[SDSetupAgent _deviceFound:]", 50, "WPS: Triggering Wi-Fi Password Sharing with %@\n", v6);
                }
                -[SDSetupAgent _uiStartWiFiPasswordSharing:](self, "_uiStartWiFiPasswordSharing:", v4);
              }
              else if (dword_1007B0708 <= 30
                     && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
              {
                LogPrintF(&dword_1007B0708, "-[SDSetupAgent _deviceFound:]", 30, "WPS: Shouldn't offer password, ignoring triggered device: %@\n", v6);
              }
              goto LABEL_166;
            }
            if (dword_1007B0708 <= 50
              && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
            {
              v70 = v6;
              v23 = "WPS: Ignoring Wi-Fi Password Sharing request when not allowed for %@";
              goto LABEL_100;
            }
            break;
          case 9:
            if (self->_triggeredUIiOSSetup)
            {
              if (dword_1007B0708 <= 50
                && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
              {
                v70 = v6;
                v23 = "Ignoring proximity iOSSetup with another %@\n";
                goto LABEL_100;
              }
            }
            else
            {
              v49 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
              v50 = objc_msgSend(v49, "isProximitySetupToNewDeviceAllowed");

              if ((v50 & 1) != 0)
              {
                if ((objc_msgSend(v4, "deviceFlags") & 0x100) == 0)
                {
                  if (-[SDStatusMonitor eduModeEnabled](self->_statusMonitor, "eduModeEnabled"))
                  {
                    if (dword_1007B0708 <= 50
                      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
                    {
                      v51 = "Ignoring proximity iOSSetup in EDU mode\n";
                      goto LABEL_138;
                    }
                  }
                  else
                  {
                    if (dword_1007B0708 <= 50
                      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
                    {
                      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _deviceFound:]", 50, "Triggering proximity iOSSetup with %@\n", v6);
                    }
                    self->_triggeredUIiOSSetup = 1;
                    -[SDSetupAgent _uiStartSetupiOS:autoStart:](self, "_uiStartSetupiOS:autoStart:", v4, 0);
                  }
                  goto LABEL_166;
                }
                if (dword_1007B0708 <= 50
                  && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
                {
                  v70 = v6;
                  v23 = "Ignoring proximity iOSSetup during resume: %@\n";
                  goto LABEL_100;
                }
              }
              else if (dword_1007B0708 <= 50
                     && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
              {
                v70 = v6;
                v23 = "Ignoring proximity iOSSetup when not allowed for %@\n";
                goto LABEL_100;
              }
            }
            break;
          case 10:
            if (self->_triggeredUIRepair)
            {
              if (dword_1007B0708 <= 50
                && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
              {
                v70 = v6;
                v23 = "Ignoring proximity Repair with another %@\n";
                goto LABEL_100;
              }
            }
            else
            {
              v52 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
              v53 = objc_msgSend(v52, "isProximitySetupToNewDeviceAllowed");

              if ((v53 & 1) != 0)
              {
                if ((objc_msgSend(v4, "paired") & 1) != 0
                  || objc_msgSend(v4, "systemPairState") > 0x13)
                {
                  self->_triggeredUIRepair = 1;
                  if (self->_repairSilent)
                  {
                    if (dword_1007B0708 <= 50
                      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
                    {
                      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _deviceFound:]", 50, "Triggering proximity Repair silent with %@\n", v6);
                    }
                    -[SDSetupAgent _repairSilentStart:](self, "_repairSilentStart:", v4);
                  }
                  goto LABEL_166;
                }
                if (dword_1007B0708 <= 50
                  && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
                {
                  v70 = v6;
                  v23 = "Ignoring unpaired proximity Repair with %@\n";
                  goto LABEL_100;
                }
              }
              else if (dword_1007B0708 <= 50
                     && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
              {
                v70 = v6;
                v23 = "Ignoring proximity Repair when not allowed for %@\n";
                goto LABEL_100;
              }
            }
            break;
          case 11:
          case 33:
            if (self->_triggeredUIB238Setup)
            {
              if (dword_1007B0708 <= 50
                && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
              {
                v70 = v6;
                v23 = "Ignoring proximity HomePodSetup with another %@\n";
                goto LABEL_100;
              }
            }
            else
            {
              v39 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
              v40 = objc_msgSend(v39, "isProximitySetupToNewDeviceAllowed");

              if ((v40 & 1) != 0)
              {
                self->_triggeredUIB238Setup = 1;
                if (dword_1007B0708 <= 50)
                {
                  if (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50))
                    LogPrintF(&dword_1007B0708, "-[SDSetupAgent _deviceFound:]", 50, "Triggering proximity HomePodSetup with %@\n", v6);
                  if (dword_1007B0708 <= 50
                    && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
                  {
                    v61 = sub_10005511C((int)v5);
                    LogPrintF(&dword_1007B0708, "-[SDSetupAgent _deviceFound:]", 50, "HomePodSetup action type is %s\n", v61);
                  }
                }
                -[SDSetupAgent _uiStartSetupB238:extraInfo:](self, "_uiStartSetupB238:extraInfo:", v4, 0);
                goto LABEL_166;
              }
              if (dword_1007B0708 <= 50
                && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
              {
                v70 = v6;
                v23 = "Ignoring proximity HomePodSetup when not allowed for %@\n";
                goto LABEL_100;
              }
            }
            break;
          case 12:
            if (dword_1007B0708 <= 50
              && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
            {
              LogPrintF(&dword_1007B0708, "-[SDSetupAgent _deviceFound:]", 50, "Triggering proximity ApplePay with %@\n", v6);
            }
            notify_post("com.apple.applepay.proximity");
            goto LABEL_166;
          case 13:
            if (self->_triggeredUIWHASetup)
            {
              if (dword_1007B0708 <= 50
                && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
              {
                v70 = v6;
                v23 = "Ignoring proximity WHASetup with another %@\n";
                goto LABEL_100;
              }
            }
            else
            {
              v54 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
              v55 = objc_msgSend(v54, "isProximitySetupToNewDeviceAllowed");

              if ((v55 & 1) != 0)
              {
                self->_triggeredUIWHASetup = 1;
                if (dword_1007B0708 <= 50
                  && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
                {
                  LogPrintF(&dword_1007B0708, "-[SDSetupAgent _deviceFound:]", 50, "Triggering proximity WHASetup with %@\n", v6);
                }
                -[SDSetupAgent _uiStartSetupWHA:](self, "_uiStartSetupWHA:", v4);
                goto LABEL_166;
              }
              if (dword_1007B0708 <= 50
                && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
              {
                v70 = v6;
                v23 = "Ignoring proximity WHASetup when not allowed for %@\n";
                goto LABEL_100;
              }
            }
            break;
          case 17:
            if (dword_1007B0708 <= 50
              && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
            {
              LogPrintF(&dword_1007B0708, "-[SDSetupAgent _deviceFound:]", 50, "Triggering proximity DeviceDiagnostics with %@\n", v6);
            }
            -[SDSetupAgent _launchAppWithMachServiceName:](self, "_launchAppWithMachServiceName:", CFSTR("com.apple.diagnosticextensionsd.sharing-wakeup"));
            goto LABEL_166;
          case 25:
            if (!self->_triggeredUITVLatencySetup)
            {
              v56 = self;
              v57 = v4;
              v58 = 25;
              goto LABEL_119;
            }
            if (dword_1007B0708 > 50
              || dword_1007B0708 == -1 && !_LogCategory_Initialize(&dword_1007B0708, 50))
            {
              break;
            }
            v70 = v6;
            v23 = "Ignoring proximity TVLatency with another %@\n";
            goto LABEL_100;
          case 27:
            if (dword_1007B0708 <= 50
              && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
            {
              LogPrintF(&dword_1007B0708, "-[SDSetupAgent _deviceFound:]", 50, "Triggering proximity ShareAudio: %@\n", v6);
            }
            v62 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
            objc_msgSend(v62, "setBoostNearbyInfo:", 1);

            goto LABEL_166;
          case 30:
            if (!self->_triggeredUITVLatencySetup)
            {
              v56 = self;
              v57 = v4;
              v58 = 30;
LABEL_119:
              -[SDSetupAgent _uiStartTVLatencySetup:forActionType:withBLEDevice:](v56, "_uiStartTVLatencySetup:forActionType:withBLEDevice:", v57, v58, v6);
              goto LABEL_166;
            }
            if (dword_1007B0708 <= 50
              && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
            {
              v70 = v6;
              v23 = "Ignoring proximity TVColorCalibration with another %@\n";
              goto LABEL_100;
            }
            break;
          case 32:
            goto LABEL_65;
          case 36:
            if (-[SDSetupAgent _deviceHandlesDovePeaceSetup](self, "_deviceHandlesDovePeaceSetup"))
            {
              if (self->_triggeredUIDovePeace)
              {
                if (dword_1007B0708 > 50
                  || dword_1007B0708 == -1 && !_LogCategory_Initialize(&dword_1007B0708, 50))
                {
                  break;
                }
                v70 = v6;
                v23 = "Ignoring proximity dovePeace setup with another %@\n";
              }
              else
              {
                v59 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
                v60 = objc_msgSend(v59, "isProximitySetupToNewDeviceAllowed");

                if ((v60 & 1) != 0)
                {
                  if ((objc_msgSend(v4, "deviceFlags") & 0x100) == 0)
                  {
                    if (-[SDStatusMonitor eduModeEnabled](self->_statusMonitor, "eduModeEnabled"))
                    {
                      if (dword_1007B0708 <= 50
                        && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
                      {
                        v51 = "Ignoring proximity dovePeace setup in EDU mode\n";
LABEL_138:
                        LogPrintF(&dword_1007B0708, "-[SDSetupAgent _deviceFound:]", 50, v51, v69);
                        goto LABEL_166;
                      }
                    }
                    else if (_os_feature_enabled_impl("TDGSharingViewService", "Setup"))
                    {
                      if (dword_1007B0708 <= 50
                        && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
                      {
                        LogPrintF(&dword_1007B0708, "-[SDSetupAgent _deviceFound:]", 50, "Triggering proximity dovePeace setup with %@\n", v6);
                      }
                      self->_triggeredUIDovePeace = 1;
                      -[SDSetupAgent _uiStartSetupDovePeace:autoStart:](self, "_uiStartSetupDovePeace:autoStart:", v4, 0);
                    }
                    goto LABEL_166;
                  }
                  if (dword_1007B0708 > 50
                    || dword_1007B0708 == -1 && !_LogCategory_Initialize(&dword_1007B0708, 50))
                  {
                    break;
                  }
                  v70 = v6;
                  v23 = "Ignoring proximity dovePeace setup during resume: %@\n";
                }
                else
                {
                  if (dword_1007B0708 > 50
                    || dword_1007B0708 == -1 && !_LogCategory_Initialize(&dword_1007B0708, 50))
                  {
                    break;
                  }
                  v70 = v6;
                  v23 = "Ignoring proximity dovePeace setup when not allowed for %@\n";
                }
              }
LABEL_100:
              v24 = 50;
              goto LABEL_41;
            }
            if (dword_1007B0708 <= 50
              && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
            {
              v51 = "Ignoring proximity dovePeace setup on this type of device\n";
              goto LABEL_138;
            }
LABEL_166:
            if (!arc4random_uniform(0xAu))
            {
              v73[0] = CFSTR("_cat");
              v73[1] = CFSTR("_op");
              v74[0] = CFSTR("Setup");
              v74[1] = CFSTR("Triggered");
              v73[2] = CFSTR("action");
              v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v5));
              v74[2] = v63;
              v73[3] = CFSTR("rssi");
              v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v6, "rssiEstimate")));
              v74[3] = v64;
              v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v74, v73, 4));
              SFDashboardLogJSON();

              v71[0] = CFSTR("action");
              v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v5));
              v71[1] = CFSTR("rssi");
              v72[0] = v66;
              v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v6, "rssiEstimate")));
              v72[1] = v67;
              v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v72, v71, 2));
              SFMetricsLog(CFSTR("com.apple.sharing.SetupTriggered"), v68);

            }
            break;
          default:
            if ((_DWORD)v5 != 43)
              break;
LABEL_65:
            if (self->_triggeredUIAuthenticateAccounts)
            {
              if (dword_1007B0708 <= 50
                && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
              {
                v70 = v6;
                v23 = "Ignoring proximity AuthenticateAccounts with another %@\n";
                goto LABEL_100;
              }
            }
            else
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
              v42 = objc_msgSend(v41, "isProximitySetupToNewDeviceAllowed");

              if ((v42 & 1) != 0)
              {
                self->_triggeredUIAuthenticateAccounts = 1;
                if (dword_1007B0708 <= 50
                  && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
                {
                  LogPrintF(&dword_1007B0708, "-[SDSetupAgent _deviceFound:]", 50, "Triggering proximity AuthenticateAccounts with %@\n", v6);
                }
                -[SDSetupAgent _uiStartAuthenticateAccounts:](self, "_uiStartAuthenticateAccounts:", v4);
                goto LABEL_166;
              }
              if (dword_1007B0708 <= 50
                && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
              {
                v70 = v6;
                v23 = "Ignoring proximity AuthenticateAccounts when not allowed for %@\n";
                goto LABEL_100;
              }
            }
            break;
        }
      }
    }
  }
LABEL_168:

}

- (void)_deviceLost:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CUUserNotificationSession *unoteTVLatencySetup;
  void *v9;
  void *v10;
  unsigned int v11;
  CUUserNotificationSession *v12;
  void *v13;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = v13;
  if (v13)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v13));
    v4 = v13;
    if (v5)
    {
      v6 = (void *)v5;
      -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v13);
      if (objc_msgSend(v6, "deviceActionType") == 17)
        -[NSMutableDictionary removeObjectForKey:](self->_triggeredDevices, "removeObjectForKey:", v13);
      if (objc_msgSend(v6, "deviceActionType") == 27)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
        objc_msgSend(v7, "setBoostNearbyInfo:", 0);

      }
      unoteTVLatencySetup = self->_unoteTVLatencySetup;
      if (unoteTVLatencySetup)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUUserNotificationSession identifier](unoteTVLatencySetup, "identifier"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (v11)
        {
          -[CUUserNotificationSession invalidate](self->_unoteTVLatencySetup, "invalidate");
          v12 = self->_unoteTVLatencySetup;
          self->_unoteTVLatencySetup = 0;

        }
      }
      -[SDSetupAgent _postDeviceSetupNotificationForDevice:present:](self, "_postDeviceSetupNotificationForDevice:present:", v6, 0);

      v4 = v13;
    }
  }

}

- (void)_launchAppWithMachServiceName:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  _xpc_connection_s *mach_service;
  xpc_object_t v8;
  _xpc_connection_s *v9;
  _QWORD barrier[4];
  _xpc_connection_s *v11;
  id v12;

  v4 = a3;
  if (dword_1007B0708 <= 30 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent _launchAppWithMachServiceName:]", 30, "Launch XPC '%@' start\n", v4);
  v5 = objc_retainAutorelease(v4);
  v6 = (const char *)objc_msgSend(v5, "UTF8String");
  if (v6)
  {
    mach_service = xpc_connection_create_mach_service(v6, (dispatch_queue_t)self->_dispatchQueue, 0);
    xpc_connection_set_event_handler(mach_service, &stru_100715110);
    xpc_connection_activate(mach_service);
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v8, "SharingXPCLaunch", 1);
    xpc_connection_send_message(mach_service, v8);
    barrier[0] = _NSConcreteStackBlock;
    barrier[1] = 3221225472;
    barrier[2] = sub_10005858C;
    barrier[3] = &unk_100714860;
    v11 = mach_service;
    v12 = v5;
    v9 = mach_service;
    xpc_connection_send_barrier(v9, barrier);

  }
}

- (void)_postDeviceSetupNotificationForDevice:(id)a3 present:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

  if (v7)
  {
    v11[0] = CFSTR("deviceID");
    v11[1] = CFSTR("needsSetup");
    v12[0] = v7;
    v8 = &__kCFBooleanFalse;
    if (v4 && objc_msgSend(v5, "needsSetup"))
      v8 = &__kCFBooleanTrue;
    v12[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.sharing.DeviceSetup"), CFSTR("com.apple.sharingd"), v9, 1);
    if (dword_1007B0708 <= 50
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _postDeviceSetupNotificationForDevice:present:]", 50, "Posted %@: %##@\n", CFSTR("com.apple.sharing.DeviceSetup"), v9);
    }

  }
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SDSetupAgent *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005880C;
  v7[3] = &unk_100714860;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SDSetupAgent *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100058940;
  v7[3] = &unk_100714860;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SDSetupAgent *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058AA0;
  block[3] = &unk_100715138;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_appleAccountSignIn:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058C14;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_primaryAccountChanged
{
  CUSystemMonitor *systemMonitor;
  id v4;
  id v5;

  systemMonitor = self->_systemMonitor;
  if (systemMonitor)
  {
    v4 = -[CUSystemMonitor manateeAvailable](systemMonitor, "manateeAvailable");
    if (self->_d2dEncryptionAvailable != (_DWORD)v4)
    {
      v5 = v4;
      self->_d2dEncryptionAvailable = (char)v4;
      if (dword_1007B0708 <= 30
        && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
      {
        LogPrintF(&dword_1007B0708, "-[SDSetupAgent _primaryAccountChanged]", 30, "D2D Encryption availability changed to %{BOOL}\n", v5);
      }
      -[SDSetupAgent _resetTriggers](self, "_resetTriggers");
    }
  }
}

- (void)_iTunesAccountsChanged
{
  if (self->_triggeredUIB238Setup || self->_triggeredUIRepair)
  {
    if (dword_1007B0708 <= 30
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _iTunesAccountsChanged]", 30, "Resetting prox card triggers on iTunes\n");
    }
    -[SDSetupAgent _resetTriggers](self, "_resetTriggers");
  }
}

- (void)_resetTriggers
{
  NSMutableDictionary *triggeredDevices;

  -[NSMutableDictionary removeAllObjects](self->_triggeredDevices, "removeAllObjects");
  triggeredDevices = self->_triggeredDevices;
  self->_triggeredDevices = 0;

  *(_WORD *)&self->_triggeredUIWHASetup = 0;
  self->_triggeredUIAuthenticateAccounts = 0;
  *(_DWORD *)&self->_triggeredUIAppleTVPair = 0;
  *(_DWORD *)&self->_triggeredUIB238Setup = 0;
}

- (void)_scanTimerFired
{
  OS_dispatch_source *scanTimer;
  NSObject *v4;
  OS_dispatch_source *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B0708 <= 30 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent _scanTimerFired]", 30, "Scan stop timer fired\n");
  scanTimer = self->_scanTimer;
  if (scanTimer)
  {
    v4 = scanTimer;
    dispatch_source_cancel(v4);
    v5 = self->_scanTimer;
    self->_scanTimer = 0;

  }
  self->_shouldScan = 0;
  -[SDSetupAgent _update](self, "_update");
}

- (BOOL)_screenLocked
{
  void *v2;
  unsigned __int8 v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v3 = objc_msgSend(v2, "deviceKeyBagLocked");

  return v3;
}

- (void)_screenStateChanged
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058F50;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)_shouldOfferPassword:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  int Int64Ranged;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  BOOL v25;
  int v27;
  const __CFString *v28;
  const char *v29;
  unsigned int v30;
  unsigned int v31;
  NSErrorUserInfoKey v32;
  const __CFString *v33;
  const __CFString *v34;
  __CFString *v35;

  v3 = a3;
  v31 = 0;
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestSSID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contactIdentifier"));

  if (!v5)
  {
    if (dword_1007B0708 <= 30
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _shouldOfferPassword:]", 30, "WPS: Ignoring pw request from non-contact peer\n");
    }
    goto LABEL_38;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contactIdentifier"));
  v8 = objc_msgSend(v6, "contactIdentifierIsBlocked:", v7);

  if (v8)
  {
    if (dword_1007B0708 <= 30
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _shouldOfferPassword:]", 30, "WPS: Ignoring pw request from blocked-contact peer\n");
    }
    goto LABEL_38;
  }
  if (!v4)
  {
    if (dword_1007B0708 <= 30
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _shouldOfferPassword:]", 30, "WPS: Ignoring pw request without requestSSID\n");
    }
LABEL_38:
    v9 = 0;
    goto LABEL_27;
  }
  v34 = CFSTR("ssid");
  v35 = v4;
  v9 = (void *)WiFiCopyNetworkInfo(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1), 3, &v31);
  v10 = v31;
  if (v31 != -6727)
  {
    if (v31)
    {
      if (dword_1007B0708 <= 60)
      {
        if (dword_1007B0708 == -1)
        {
          if (!_LogCategory_Initialize(&dword_1007B0708, 60))
            goto LABEL_27;
          v10 = v31;
          if (!v31)
          {
            LogPrintF(&dword_1007B0708, "-[SDSetupAgent _shouldOfferPassword:]", 60, "### WPS: Unexpected error checking pws sharable: %@\n", 0);
            goto LABEL_27;
          }
        }
        v18 = (int)v10;
        v32 = NSLocalizedDescriptionKey;
        v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v10, 0, 0));
        v20 = objc_claimAutoreleasedReturnValue(v19);
        v21 = (void *)v20;
        v22 = CFSTR("?");
        if (v20)
          v22 = (const __CFString *)v20;
        v33 = v22;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v18, v23));
        LogPrintF(&dword_1007B0708, "-[SDSetupAgent _shouldOfferPassword:]", 60, "### WPS: Unexpected error checking pws sharable: %@\n", v24);

      }
    }
    else
    {
      v30 = 0;
      Int64Ranged = CFDictionaryGetInt64Ranged(v9, CFSTR("shareMode"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, &v30);
      v12 = v30;
      if (!v30)
      {
        if (Int64Ranged == 3)
        {
          v13 = SFShareablePasswordForSSID(v4);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          v15 = v14 != 0;

        }
        else
        {
          v15 = 0;
        }
        goto LABEL_19;
      }
      if (dword_1007B0708 <= 60)
      {
        if (dword_1007B0708 == -1)
        {
          if (!_LogCategory_Initialize(&dword_1007B0708, 60))
            goto LABEL_27;
          v12 = v30;
        }
        LogPrintF(&dword_1007B0708, "-[SDSetupAgent _shouldOfferPassword:]", 60, "### WPS: Get network share mode failed: %#m\n", v12);
      }
    }
LABEL_27:
    v25 = 0;
    goto LABEL_28;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDHotspotAgent sharedAgent](SDHotspotAgent, "sharedAgent"));
  if (objc_msgSend(v16, "isTetheringInUse"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "hotspotName"));
    v15 = -[__CFString isEqualToString:](v4, "isEqualToString:", v17);

  }
  else
  {
    v15 = 0;
  }

LABEL_19:
  if (dword_1007B0708 >= 31)
  {
    v25 = v15 != 0;
    goto LABEL_28;
  }
  if (dword_1007B0708 == -1)
  {
    v25 = v15 != 0;
    if (!_LogCategory_Initialize(&dword_1007B0708, 30))
      goto LABEL_28;
  }
  else
  {
    v25 = v15 != 0;
  }
  v27 = IsAppleInternalBuild();
  v28 = CFSTR("*");
  if (v27)
    v28 = v4;
  v29 = "yes";
  if (!v15)
    v29 = "no";
  LogPrintF(&dword_1007B0708, "-[SDSetupAgent _shouldOfferPassword:]", 30, "WPS: Should share network \"%@\": %s", v28, v29);
LABEL_28:

  return v25;
}

- (void)_uiLockStatusChanged
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100059554;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)_uiShowing
{
  return self->_remoteAlertHandle != 0;
}

- (void)_uiStartAppleTVSetup:(id)a3 extraInfo:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  if (a4)
  {
    v7 = a3;
    v8 = objc_msgSend(a4, "mutableCopy");
  }
  else
  {
    v9 = a3;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  }
  v12 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(a3, "deviceModelCode")));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("deviceModelCode"));

  v11 = objc_msgSend(v12, "copy");
  -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:](self, "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:", a3, CFSTR("TVSetupUIService.TVSetupAlertViewController"), CFSTR("AppleTVSetupUI"), 0, v11);

}

- (void)_uiStartHomeKitDeviceDetectedWithURL:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "absoluteString"));
  if (v4)
  {
    v5 = objc_alloc_init((Class)SFDevice);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    objc_msgSend(v5, "setIdentifier:", v6);

    v8 = CFSTR("urlStr");
    v9 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:](self, "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:", v5, CFSTR("HomeKitDeviceDetectedMainController"), CFSTR("HomeKitDeviceDetected"), 0, v7);

  }
}

- (void)_uiStartPair:(id)a3 extraInfo:(id)a4
{
  -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:](self, "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:", a3, CFSTR("PINPairMainController"), CFSTR("PairUI"), &off_10074F9B8, a4);
}

- (void)_uiStartRepair:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v4 = *(_QWORD *)&a4;
  v9 = CFSTR("repairFlags");
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4));
  v10 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:](self, "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:", v6, CFSTR("RepairMainController"), CFSTR("RepairUI"), 0, v8);

}

- (void)_uiStartSetupB238:(id)a3 extraInfo:(id)a4
{
  id v7;
  NSMutableDictionary *v8;
  id v9;
  void *v10;
  id v11;
  NSMutableDictionary *v12;

  if (a4)
  {
    v7 = a3;
    v8 = (NSMutableDictionary *)objc_msgSend(a4, "mutableCopy");
  }
  else
  {
    v9 = a3;
    v8 = objc_opt_new(NSMutableDictionary);
  }
  v12 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(a3, "deviceModelCode")));
  -[NSMutableDictionary setValue:forKey:](v12, "setValue:forKey:", v10, CFSTR("deviceModelCode"));

  objc_msgSend(a3, "setDeviceActionType:", 33);
  v11 = -[NSMutableDictionary copy](v12, "copy");
  -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:](self, "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:", a3, CFSTR("HDSViewService.HomePodSetupFlowViewController"), CFSTR("B238SetupUI"), 0, v11);

}

- (void)_uiStartSetupiOS:(id)a3 autoStart:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[3];

  v4 = a4;
  v6 = a3;
  v7 = _os_feature_enabled_impl("Sharing", "DeviceToDeviceSetup_PRX");
  v8 = CFSTR("iOSSetupMainController");
  if (v7)
    v8 = CFSTR("SharingViewService.D2DSetupFlowViewController");
  v14[0] = CFSTR("autoStart");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  v15[0] = v10;
  v14[1] = CFSTR("deviceClassCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v6, "deviceClassCode")));
  v15[1] = v11;
  v14[2] = CFSTR("deviceModelCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v6, "deviceModelCode")));
  v15[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 3));
  -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:](self, "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:", v6, v9, CFSTR("iOSSetupUI"), 0, v13);

}

- (void)_uiStartSetupDovePeace:(id)a3 autoStart:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];

  v4 = a4;
  v6 = a3;
  if (-[SDSetupAgent _deviceHandlesDovePeaceSetup](self, "_deviceHandlesDovePeaceSetup"))
  {
    v11[0] = CFSTR("autoStart");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    v12[0] = v7;
    v11[1] = CFSTR("deviceClassCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v6, "deviceClassCode")));
    v12[1] = v8;
    v11[2] = CFSTR("deviceModelCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v6, "deviceModelCode")));
    v12[2] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3));
    -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:](self, "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:", v6, CFSTR("BYDovePeaceRemoteViewController"), CFSTR("dovePeaceSetupUI"), 0, v10);

  }
}

- (BOOL)_deviceHandlesDovePeaceSetup
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = SFDeviceClassCodeGet(self, a2);
  if ((_DWORD)v2 == 3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v4 = SFDeviceClassCodeGet(v2, v3);
    if ((_DWORD)v4 != 1)
      LOBYTE(v4) = SFDeviceClassCodeGet(v4, v5) == 2;
  }
  return v4;
}

- (void)_uiStartSetupWatch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  if (v5)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("advertisingName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bleDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "advertisementFields"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("wpv")));

  if (v8)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("pairingVersion"));
  -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:](self, "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:", v9, CFSTR("WatchSetupViewControllerProxy"), CFSTR("WatchSetupUI"), &off_10074F9D0, v4);

}

- (void)_uiStartSetupWHA:(id)a3
{
  -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:](self, "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:", a3, CFSTR("WHASetupMainController"), CFSTR("WHASetupUI"), 0, 0);
}

- (void)_uiStartProxCardKitTest:(id)a3 extraInfo:(id)a4
{
  -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:](self, "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:", a3, CFSTR("ProxCardKitTestRemoteViewController"), CFSTR("Test"), 0, a4);
}

- (void)_uiStartAuthenticateAccounts:(id)a3
{
  const __CFString *v4;
  id v5;

  v5 = a3;
  v4 = CFSTR("SharingViewService.AuthenticateAccountsFlowViewController");
  if (_os_feature_enabled_impl("AppleIDSetup", "Sandstone")
    && objc_msgSend(v5, "osVersion") > 0xC)
  {
    v4 = CFSTR("AppleIDSetupUIService.SetupAlertViewController");
  }
  -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:](self, "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:", v5, v4, CFSTR("AuthenticateAccountsUI"), 0, 0);

}

- (void)_uiStartTVLatencySetup:(id)a3 forActionType:(unsigned __int8)a4 withBLEDevice:(id)a5
{
  uint64_t v6;
  id v8;
  uint64_t v9;
  int DeviceClass;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  unsigned __int8 v14;
  CUUserNotificationSession *unoteTVLatencySetup;
  id v16;

  v6 = a4;
  v16 = a3;
  v8 = a5;
  DeviceClass = GestaltGetDeviceClass(v8, v9);
  v11 = CFSTR("ColorCalibration");
  if ((_DWORD)v6 == 25)
    v11 = &stru_10072FE60;
  v12 = v11;
  if ((DeviceClass - 3) <= 0xFFFFFFFD)
  {
    if (dword_1007B0708 <= 50
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _uiStartTVLatencySetup:forActionType:withBLEDevice:]", 50, "Ignoring proximity TVLatency%@Setup: unsupported, %@\n", v8, v12);
    }
  }
  else if (-[SDSetupAgent _screenLocked](self, "_screenLocked")
         || (v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor")),
             v14 = objc_msgSend(v13, "deviceUIUnlocked"),
             v13,
             (v14 & 1) == 0))
  {
    if (self->_triggeredUITVLatencySetup || self->_unoteTVLatencySetup)
    {
      if (dword_1007B0708 <= 50
        && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
      {
        LogPrintF(&dword_1007B0708, "-[SDSetupAgent _uiStartTVLatencySetup:forActionType:withBLEDevice:]", 50, "Ignoring proximity TVLatency%@Setup with another %@\n", v12, v8);
      }
    }
    else
    {
      -[SDSetupAgent _uiStartTVLatencyBanner:forActionType:](self, "_uiStartTVLatencyBanner:forActionType:", v16, v6);
    }
  }
  else if (self->_triggeredUITVLatencySetup)
  {
    if (dword_1007B0708 <= 50
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _uiStartTVLatencySetup:forActionType:withBLEDevice:]", 50, "Ignoring proximity TVLatency%@ with another %@\n", v12, v8);
    }
  }
  else
  {
    if (dword_1007B0708 <= 50
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _uiStartTVLatencySetup:forActionType:withBLEDevice:]", 50, "Triggering proximity TVLatency%@ with %@\n", v12, v8);
    }
    self->_triggeredUITVLatencySetup = 1;
    -[CUUserNotificationSession invalidate](self->_unoteTVLatencySetup, "invalidate");
    unoteTVLatencySetup = self->_unoteTVLatencySetup;
    self->_unoteTVLatencySetup = 0;

    -[SDSetupAgent _uiStartTVLatencySetup:extraInfo:forActionType:](self, "_uiStartTVLatencySetup:extraInfo:forActionType:", v16, 0, v6);
  }

}

- (void)_uiStartTVLatencyBanner:(id)a3 forActionType:(unsigned __int8)a4
{
  int v4;
  uint64_t v6;
  id v7;
  CUUserNotificationSession *unoteTVLatencySetup;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  char v29;

  v4 = a4;
  v7 = a3;
  unoteTVLatencySetup = self->_unoteTVLatencySetup;
  if (!unoteTVLatencySetup
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUUserNotificationSession identifier](unoteTVLatencySetup, "identifier")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString")),
        v12 = objc_msgSend(v9, "isEqual:", v11),
        v11,
        v10,
        v9,
        (v12 & 1) == 0))
  {
    if (GestaltGetDeviceClass(unoteTVLatencySetup, v6) == 1
      && MGIsQuestionValid(CFSTR("8S7ydMJ4DlCUF38/hI/fJA")))
    {
      v13 = MGGetBoolAnswer(CFSTR("8S7ydMJ4DlCUF38/hI/fJA")) ^ 1;
    }
    else
    {
      v13 = 1;
    }
    if (v4 == 30 && v13)
    {
      if (dword_1007B0708 <= 50
        && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
      {
        LogPrintF(&dword_1007B0708, "-[SDSetupAgent _uiStartTVLatencyBanner:forActionType:]", 50, "Unsupported device for ColorCalibration");
      }
    }
    else
    {
      -[CUUserNotificationSession invalidate](self->_unoteTVLatencySetup, "invalidate");
      v14 = objc_alloc_init((Class)CUUserNotificationSession);
      objc_storeStrong((id *)&self->_unoteTVLatencySetup, v14);
      objc_msgSend(v14, "setBundleID:", CFSTR("com.apple.SFUserNotificationTVLatency"));
      objc_msgSend(v14, "setCategoryID:", CFSTR("SFUserNotificationTVLatency"));
      objc_msgSend(v14, "setDispatchQueue:", self->_dispatchQueue);
      v16 = SFLocalizedStringForKey(CFSTR("Apple TV"), v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      objc_msgSend(v14, "setHeader:", v17);

      objc_msgSend(v14, "setFlags:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
      objc_msgSend(v14, "setIdentifier:", v19);

      if (v4 == 25)
      {
        objc_msgSend(v14, "setTitleKey:", CFSTR("TV_LATENCY_TITLE"));
        v20 = SFAddSuffixForCurrentDeviceClass(CFSTR("TV_LATENCY_BODY"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        objc_msgSend(v14, "setBodyKey:", v21);
      }
      else
      {
        v22 = SFLocalizedStringForKeyInStringsFileNamed(CFSTR("ADJUST_DISPLAY_TITLE"), CFSTR("Localizable-Colorimeter"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        objc_msgSend(v14, "setTitleKey:", v23);

        v24 = SFAddSuffixForCurrentDeviceClass(CFSTR("ADJUST_DISPLAY_BODY"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(v24);
        v25 = SFLocalizedStringForKeyInStringsFileNamed(v21, CFSTR("Localizable-Colorimeter"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        objc_msgSend(v14, "setBodyKey:", v26);

      }
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10005A404;
      v27[3] = &unk_100715160;
      v27[4] = self;
      v28 = v7;
      v29 = v4;
      objc_msgSend(v14, "setActionHandler:", v27);
      objc_msgSend(v14, "activate");

    }
  }

}

- (void)_uiStartTVLatencySetup:(id)a3 extraInfo:(id)a4 forActionType:(unsigned __int8)a5
{
  const __CFString *v6;

  if (a5 == 25)
    v6 = CFSTR("TVLatencySetupMainController");
  else
    v6 = CFSTR("TVLatencyColorimeterSetupMainController");
  -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:](self, "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:", a3, v6, CFSTR("TVLatencySetupUI"), 0, a4);
}

- (void)_uiStartWiFiPasswordSharing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  __CFString *v20;
  __CFString *v21;
  NSString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSErrorUserInfoKey v30;
  const __CFString *v31;
  _OWORD v32[4];
  char v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDHotspotAgent sharedAgent](SDHotspotAgent, "sharedAgent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactIdentifier"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestSSID"));
  v8 = (void *)v7;
  if (v6)
  {
    if (v7)
    {
      v9 = objc_alloc_init((Class)NSMutableDictionary);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor computerName](self->_statusMonitor, "computerName"));
      v11 = objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDEmailHash](self->_statusMonitor, "myAppleIDEmailHash"));
      v12 = objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDPhoneHash](self->_statusMonitor, "myAppleIDPhoneHash"));
      if (!(v11 | v12)
        && dword_1007B0708 <= 60
        && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 60)))
      {
        LogPrintF(&dword_1007B0708, "-[SDSetupAgent _uiStartWiFiPasswordSharing:]", 60, "### WPS: Neither email nor phone hashes found\n");
      }
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("cid"));
      if (v10)
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("dn"));
      if (v11)
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("eh"));
      if (v12)
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("ph"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("nw"));
      if (!objc_msgSend(v5, "isTetheringInUse"))
        goto LABEL_19;
      v29 = v5;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hotspotName"));
      v14 = objc_msgSend(v8, "isEqualToString:", v13);

      v5 = v29;
      if (!v14)
        goto LABEL_19;
      v28 = v6;
      v33 = 0;
      memset(v32, 0, sizeof(v32));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "hotspotName"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "hotspotPassword"));
      v17 = WPAHashPSK(v15, v16, 0, v32);

      if ((_DWORD)v17)
      {
        if (dword_1007B0708 <= 60
          && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 60)))
        {
          v30 = NSLocalizedDescriptionKey;
          v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v17, 0, 0));
          v23 = objc_claimAutoreleasedReturnValue(v22);
          v24 = (void *)v23;
          v25 = CFSTR("?");
          if (v23)
            v25 = (const __CFString *)v23;
          v31 = v25;
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, (int)v17, v26));
          LogPrintF(&dword_1007B0708, "-[SDSetupAgent _uiStartWiFiPasswordSharing:]", 60, "WPS: Error generating PSK: %@", v27);

        }
        v18 = 0;
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v32));
        if (objc_msgSend(v18, "length") == (id)64)
        {
          objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("hs"));
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("psk"));

          v6 = v28;
          v5 = v29;
LABEL_19:
          v19 = _os_feature_enabled_impl("Sharing", "PasswordSharing_PRX");
          v20 = CFSTR("PasswordSharingViewControllerProxy");
          if (v19)
            v20 = CFSTR("SharingViewService.PasswordSharingFlowViewController");
          v21 = v20;
          -[SDSetupAgent _uiStartWithDevice:viewControllerName:xpcEndpoint:label:extraInfo:](self, "_uiStartWithDevice:viewControllerName:xpcEndpoint:label:extraInfo:", v4, v21, 0, CFSTR("WiFiPasswordSharing"), v9);

          goto LABEL_22;
        }
      }
      v6 = v28;

      v5 = v29;
      goto LABEL_22;
    }
    if (dword_1007B0708 <= 60
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 60)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _uiStartWiFiPasswordSharing:]", 60, "### WPS: Not showing UI, no request SSID\n");
    }
  }
  else if (dword_1007B0708 <= 50
         && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
  {
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent _uiStartWiFiPasswordSharing:]", 50, "WPS: Not showing UI for non-contact peer\n");
  }
LABEL_22:

}

- (void)_uiStartWithDevice:(id)a3 viewControllerName:(id)a4 label:(id)a5 unlessApps:(id)a6 extraInfo:(id)a7
{
  -[SDSetupAgent _uiStartWithDevice:viewControllerName:xpcEndpoint:label:unlessApps:extraInfo:](self, "_uiStartWithDevice:viewControllerName:xpcEndpoint:label:unlessApps:extraInfo:", a3, a4, 0, a5, a6, a7);
}

- (void)_uiStartWithDevice:(id)a3 viewControllerName:(id)a4 xpcEndpoint:(id)a5 label:(id)a6 unlessApps:(id)a7 extraInfo:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  uint64_t v27;
  NSObject *dispatchQueue;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  _QWORD block[5];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD *v42;
  _QWORD v43[4];
  id v44;
  uint64_t v45;
  NSObject *v46;
  _QWORD *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[3];
  char v53;
  _BYTE v54[128];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v32 = v14;
  v33 = v16;
  v31 = v18;
  if (v18)
  {
    v20 = v17;
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x2020000000;
    v53 = 0;
    if (dword_1007B0708 <= 30
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _uiStartWithDevice:viewControllerName:xpcEndpoint:label:unlessApps:extraInfo:]", 30, "%@: Checking if apps are frontmost: %##@\n", v17, v18);
    }
    v21 = dispatch_group_create();
    v22 = objc_alloc((Class)BKSApplicationStateMonitor);
    v23 = objc_msgSend(v22, "initWithBundleIDs:states:", v18, BKSApplicationStateAll);
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v18;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    v30 = v19;
    if (v24)
    {
      v25 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(_QWORD *)v49 != v25)
            objc_enumerationMutation(obj);
          v27 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
          dispatch_group_enter(v21);
          if (dword_1007B0708 <= 20
            && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 20)))
          {
            LogPrintF(&dword_1007B0708, "-[SDSetupAgent _uiStartWithDevice:viewControllerName:xpcEndpoint:label:unlessApps:extraInfo:]", 20, "%@: Checking frontmost state of %@\n", v20, v27);
          }
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v43[2] = sub_10005AE40;
          v43[3] = &unk_100715188;
          v44 = v20;
          v45 = v27;
          v47 = v52;
          v46 = v21;
          objc_msgSend(v23, "applicationInfoForApplication:completion:", v27, v43);

        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      }
      while (v24);
    }

    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005AF10;
    block[3] = &unk_1007151B0;
    v42 = v52;
    block[4] = self;
    v36 = v32;
    v37 = v15;
    v38 = v33;
    v39 = v20;
    v40 = v30;
    v41 = v23;
    v29 = v23;
    dispatch_group_notify(v21, dispatchQueue, block);

    _Block_object_dispose(v52, 8);
    v19 = v30;
  }
  else
  {
    v20 = v17;
    -[SDSetupAgent _uiStartWithDevice:viewControllerName:xpcEndpoint:label:extraInfo:](self, "_uiStartWithDevice:viewControllerName:xpcEndpoint:label:extraInfo:", v14, v15, v16, v17, v19);
  }

}

- (void)_uiStartWithDevice:(id)a3 viewControllerName:(id)a4 xpcEndpoint:(id)a5 label:(id)a6 extraInfo:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unsigned __int8 Int64Ranged;
  void *v20;
  id v21;
  uint64_t v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  const __CFString *v37;
  id v38;
  id v39;
  void *v40;
  SBSRemoteAlertHandle *remoteAlertHandle;
  SBSRemoteAlertHandle *v42;
  SBSRemoteAlertHandle *v43;
  SBSRemoteAlertHandle *v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  _QWORD v53[8];
  _QWORD v54[8];

  v12 = a3;
  v50 = a4;
  v13 = a5;
  v14 = a6;
  v51 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bleDevice"));
  v49 = objc_msgSend(v15, "smoothedRSSI");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));

  v48 = (void *)v17;
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "advertisementFields"));
    Int64Ranged = CFDictionaryGetInt64Ranged(v18, CFSTR("cc"), 0, 255, 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUIDString"));

    v46 = v15;
    v47 = v14;
    v21 = v13;
    if (objc_msgSend(v15, "foundTicks"))
    {
      v22 = mach_absolute_time();
      v23 = UpTicksToSecondsF(v22 - (_QWORD)objc_msgSend(v15, "foundTicks"));
    }
    else
    {
      v23 = 0.0;
    }
    v53[0] = CFSTR("colorCode");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", Int64Ranged));
    v54[0] = v24;
    v53[1] = CFSTR("deviceActionType");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v12, "deviceActionType")));
    v54[1] = v25;
    v54[2] = v17;
    v53[2] = CFSTR("deviceIdentifier");
    v53[3] = CFSTR("name");
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
    v27 = (void *)v26;
    v28 = &stru_10072FE60;
    if (v26)
      v28 = (const __CFString *)v26;
    v54[3] = v28;
    v53[4] = CFSTR("osVersion");
    v29 = v12;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v12, "osVersion")));
    v54[4] = v30;
    v53[5] = CFSTR("rssi");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v49));
    v54[5] = v31;
    v54[6] = v52;
    v53[6] = CFSTR("sessionUUID");
    v53[7] = CFSTR("triggerSecs");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v23));
    v54[7] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v54, v53, 8));

    v34 = v51;
    if (v34)
    {
      v35 = objc_msgSend(v33, "mutableCopy");
      objc_msgSend(v35, "addEntriesFromDictionary:", v34);

      v33 = v35;
    }
    v36 = v50;
    if (objc_msgSend(v50, "isEqualToString:", CFSTR("HDSViewService.HomePodSetupFlowViewController")))
      v37 = CFSTR("com.apple.HDSViewService");
    else
      v37 = CFSTR("com.apple.SharingViewService");
    v13 = v21;
    v12 = v29;
    if (objc_msgSend(v50, "isEqualToString:", CFSTR("BYDovePeaceRemoteViewController")))
    {
      v15 = v46;
      v14 = v47;
      if (-[SDSetupAgent _deviceHandlesDovePeaceSetup](self, "_deviceHandlesDovePeaceSetup"))
      {
        v37 = CFSTR("com.apple.TDGSharingViewService");
        if (dword_1007B0708 <= 50
          && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
        {
          LogPrintF(&dword_1007B0708, "-[SDSetupAgent _uiStartWithDevice:viewControllerName:xpcEndpoint:label:extraInfo:]", 50, "Setting view service name to %@", CFSTR("com.apple.TDGSharingViewService"));
        }
      }
    }
    else
    {
      v15 = v46;
      v14 = v47;
    }
    if (objc_msgSend(v50, "isEqualToString:", CFSTR("TVSetupUIService.TVSetupAlertViewController")))
      v37 = CFSTR("com.apple.TVSetupUIService");
    if (objc_msgSend(v50, "isEqualToString:", CFSTR("AppleIDSetupUIService.SetupAlertViewController")))
      v37 = CFSTR("com.apple.AppleIDSetupUIService");
    if (dword_1007B0708 <= 50
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _uiStartWithDevice:viewControllerName:xpcEndpoint:label:extraInfo:]", 50, "Service name is %@", v37);
    }
    v38 = objc_msgSend(objc_alloc((Class)SBSRemoteAlertDefinition), "initWithServiceName:viewControllerClassName:", v37, v50);
    v39 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
    if (v13)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_endpoint"));
      objc_msgSend(v39, "setXpcEndpoint:", v40);

      v36 = v50;
    }
    objc_msgSend(v39, "setUserInfo:", v33);
    remoteAlertHandle = self->_remoteAlertHandle;
    if (remoteAlertHandle)
    {
      -[SBSRemoteAlertHandle removeObserver:](remoteAlertHandle, "removeObserver:", self);
      -[SBSRemoteAlertHandle invalidate](self->_remoteAlertHandle, "invalidate");
    }
    v42 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v38, v39);
    v43 = self->_remoteAlertHandle;
    self->_remoteAlertHandle = v42;

    v44 = self->_remoteAlertHandle;
    if (v44)
    {
      -[SBSRemoteAlertHandle addObserver:](v44, "addObserver:", self);
      -[SBSRemoteAlertHandle activateWithContext:](self->_remoteAlertHandle, "activateWithContext:", 0);
      if (dword_1007B0708 <= 50
        && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
      {
        LogPrintF(&dword_1007B0708, "-[SDSetupAgent _uiStartWithDevice:viewControllerName:xpcEndpoint:label:extraInfo:]", 50, "%@: StartRemoteAlert SID %@, RSSI %ld", v14, v52, v49);
      }
      goto LABEL_35;
    }
    if (dword_1007B0708 <= 60
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 60)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _uiStartWithDevice:viewControllerName:xpcEndpoint:label:extraInfo:]", 60, "%# ### Create remote alert handle failed\n", v14);
    }
    v45 = 4294960556;
  }
  else
  {
    if (dword_1007B0708 <= 60
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 60)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _uiStartWithDevice:viewControllerName:xpcEndpoint:label:extraInfo:]", 60, "%@: ### No device identifier for %@\n", v14, v12);
    }
    v52 = 0;
    v33 = 0;
    v34 = 0;
    v38 = 0;
    v39 = 0;
    v45 = 4294960535;
  }
  if (dword_1007B0708 <= 60 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 60)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent _uiStartWithDevice:viewControllerName:xpcEndpoint:label:extraInfo:]", 60, "%@: ### Start UI failed: %#m\n", v14, v45);
  v36 = v50;
LABEL_35:

}

- (void)_uiStartForMacWithDevice:(id)a3 label:(id)a4 extraInfo:(id)a5
{
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v7 = a4;
  v8 = a5;
  if (dword_1007B0708 <= 30 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent _uiStartForMacWithDevice:label:extraInfo:]", 30, "%@ not supported\n", v7, v9);

}

- (void)_uiStopIfNeededWithDevice:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (dword_1007B0708 <= 30
    && ((v6 = v3, dword_1007B0708 != -1) || (v5 = _LogCategory_Initialize(&dword_1007B0708, 30), v4 = v6, v5)))
  {
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent _uiStopIfNeededWithDevice:]", 30, "Stop UI not supported\n");

  }
  else
  {

  }
}

- (void)_watchFastScanStartIfAllowed:(id)a3
{
  id v4;
  uint64_t v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *watchFastScanTimer;
  NSObject *v8;
  _QWORD handler[5];

  v4 = a3;
  v5 = mach_absolute_time();
  if ((unint64_t)UpTicksToSeconds(v5 - self->_watchFastScanLastEndTicks) >= 0x64
    && -[SFBLEScanner scanRate](self->_watchSetupScanner, "scanRate") != (id)50)
  {
    if (dword_1007B0708 <= 50
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _watchFastScanStartIfAllowed:]", 50, "Fast scan rate start for %@\n", v4);
    }
    -[SFBLEScanner setScanRate:](self->_watchSetupScanner, "setScanRate:", 50);
    if (!self->_watchFastScanTimer)
    {
      v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      watchFastScanTimer = self->_watchFastScanTimer;
      self->_watchFastScanTimer = v6;

      v8 = self->_watchFastScanTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10005B8C8;
      handler[3] = &unk_1007146D8;
      handler[4] = self;
      dispatch_source_set_event_handler(v8, handler);
      SFDispatchTimerSet(self->_watchFastScanTimer, 10.0, -1.0, -10.0);
      dispatch_resume((dispatch_object_t)self->_watchFastScanTimer);
    }
  }

}

- (void)_watchFastScanStop
{
  OS_dispatch_source *watchFastScanTimer;
  OS_dispatch_source *v4;
  NSObject *v5;

  if (-[SFBLEScanner scanRate](self->_watchSetupScanner, "scanRate") != (id)20)
  {
    if (dword_1007B0708 <= 50
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _watchFastScanStop]", 50, "Fast scan rate stop\n");
    }
    -[SFBLEScanner setScanRate:](self->_watchSetupScanner, "setScanRate:", 20);
    self->_watchFastScanLastEndTicks = mach_absolute_time();
    watchFastScanTimer = self->_watchFastScanTimer;
    if (watchFastScanTimer)
    {
      v5 = watchFastScanTimer;
      dispatch_source_cancel(v5);
      v4 = self->_watchFastScanTimer;
      self->_watchFastScanTimer = 0;

    }
  }
}

- (void)_watchFound:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableDictionary *watchSetupDevices;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[3];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_watchSetupScanner)
    v6 = gSDProxCardsSuppressed == 0;
  else
    v6 = 0;
  if (!v6
    || -[SDSetupAgent _uiShowing](self, "_uiShowing")
    || (-[SDStatusMonitor systemUIFlags](self->_statusMonitor, "systemUIFlags") & 0x7C809) != 0)
  {
    goto LABEL_48;
  }
  v7 = 0;
  v8 = 0;
  v9 = 0;
  if (-[SDSetupAgent _screenLocked](self, "_screenLocked") || !v5)
    goto LABEL_47;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_watchSetupDevices, "objectForKeyedSubscript:", v5));

  if (v10)
  {
LABEL_48:
    v7 = 0;
    v8 = 0;
LABEL_42:
    v9 = 0;
    goto LABEL_47;
  }
  -[SDSetupAgent _watchFastScanStartIfAllowed:](self, "_watchFastScanStartIfAllowed:", v4);
  v7 = objc_alloc_init((Class)SFDevice);
  objc_msgSend(v7, "updateWithBLEDevice:", v4);
  objc_msgSend(v7, "setDeviceActionType:", 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "setupProximityEstimator"));
  if (!v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bleProximityEstimatorForActionType:device:", 5, v7));

    objc_msgSend(v4, "setSetupProximityEstimator:", v8);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v5));

  if (!v12)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", v7, v5);
  -[SDProximityController sender:notifyBluetoothSample:](self->_proximityController, "sender:notifyBluetoothSample:", self, v7);
  v13 = -[SDProximityController checkDeviceRegion:](self->_proximityController, "checkDeviceRegion:", v7);
  if (v13 == 2
    && dword_1007B0708 <= 50
    && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
  {
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent _watchFound:]", 50, "#ni_estimator watch triggered");
  }
  if (_os_feature_enabled_impl("Sharing", "ni_estimator"))
    objc_msgSend(v4, "setTriggered:", v13 == 2);
  else
    objc_msgSend(v8, "updateWithSFBLEDevice:", v4);
  if (!objc_msgSend(v4, "triggered"))
    goto LABEL_42;
  v14 = SFStoreDemoMode();
  if ((v14 & 1) != 0 || (SFLostMode(v14, v15) & 1) != 0)
    goto LABEL_42;
  watchSetupDevices = self->_watchSetupDevices;
  if (!watchSetupDevices)
  {
    v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v18 = self->_watchSetupDevices;
    self->_watchSetupDevices = v17;

    watchSetupDevices = self->_watchSetupDevices;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](watchSetupDevices, "setObject:forKeyedSubscript:", v4, v5);
  if (self->_triggeredUIWatchSetup)
  {
    if (dword_1007B0708 <= 50
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _watchFound:]", 50, "Ignoring proximity WatchSetup with another %@\n", v4);
    }
    goto LABEL_42;
  }
  self->_triggeredUIWatchSetup = 1;
  v19 = objc_claimAutoreleasedReturnValue(-[SDSetupAgent _watchMigrating:](self, "_watchMigrating:", v5));
  if (!v19)
  {
    if (dword_1007B0708 <= 50
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _watchFound:]", 50, "Triggering proximity WatchSetup with %@\n", v4);
    }
    -[SDSetupAgent _watchFastScanStop](self, "_watchFastScanStop");
    -[SDSetupAgent _uiStartSetupWatch:](self, "_uiStartSetupWatch:", v7);
    v25[0] = CFSTR("_cat");
    v25[1] = CFSTR("_op");
    v26[0] = CFSTR("WatchSetup");
    v26[1] = CFSTR("Triggered");
    v25[2] = CFSTR("rssi");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v8, "estimatedRSSI")));
    v26[2] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 3));
    SFDashboardLogJSON();

    goto LABEL_42;
  }
  v9 = (void *)v19;
  v20 = mach_absolute_time();
  v21 = v20 - self->_watchMigrationLastTicks;
  if (v21 >= SecondsToUpTicks(14400))
  {
    if (dword_1007B0708 <= 50
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _watchFound:]", 50, "Triggering proximity WatchMigration with %@\n", v4);
    }
    -[SDSetupAgent _watchFastScanStop](self, "_watchFastScanStop");
    self->_watchMigrationLastTicks = v20;
    -[SDSetupAgent _watchStartMigration:](self, "_watchStartMigration:", v9);
  }
  else if (dword_1007B0708 <= 50
         && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
  {
    v22 = UpTicksToSeconds(v21);
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent _watchFound:]", 50, "Ignoring WatchMigration...too soon (%llu < %d secs)\n", v22, 14400);
  }
LABEL_47:

}

- (id)_watchMigrating:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  if (self->_watchMigrationEnabled)
  {
    v5 = -[objc_class sharedInstance](off_1007B0778(), "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getDevicesMatching:", &stru_1007151F0));

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v13 = off_1007B0790();
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForProperty:", v14, (_QWORD)v17));

          if ((objc_msgSend(v15, "isEqual:", v4) & 1) != 0)
          {
            v9 = v12;

            goto LABEL_12;
          }

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_watchStartMigration:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = -[objc_class sharedMigrator](off_1007B0798(), "sharedMigrator");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005C1A0;
  v7[3] = &unk_1007147C8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "beginMigrationWithDevice:withCompletion:", v6, v7);

}

- (void)_wifiStateChanged
{
  if (-[CUSystemMonitor wifiState](self->_systemMonitor, "wifiState") == 40
    && (self->_renableB238SetupAfterWiFi || self->_triggeredUIRepair))
  {
    if (dword_1007B0708 <= 30
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _wifiStateChanged]", 30, "Resetting prox card triggers now that WiFi is connected\n");
    }
    -[SDSetupAgent _resetTriggers](self, "_resetTriggers");
  }
}

- (void)_ensureServerStarted
{
  SFService *v3;
  SFService *pinPairService;
  SFService *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];

  if (!self->_pinPairService)
  {
    if (dword_1007B0708 <= 30
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _ensureServerStarted]", 30, "PINPair start\n");
    }
    v3 = (SFService *)objc_alloc_init((Class)SFService);
    pinPairService = self->_pinPairService;
    self->_pinPairService = v3;

    -[SFService setIdentifier:](self->_pinPairService, "setIdentifier:", SFServiceIdentifierPINPair);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10005C47C;
    v8[3] = &unk_1007147C8;
    v8[4] = self;
    -[SFService setErrorHandler:](self->_pinPairService, "setErrorHandler:", v8);
    -[SFService setInvalidationHandler:](self->_pinPairService, "setInvalidationHandler:", &stru_100715210);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005C58C;
    v7[3] = &unk_100715238;
    v7[4] = self;
    -[SFService setRequestMessageHandler:](self->_pinPairService, "setRequestMessageHandler:", v7);
    v5 = self->_pinPairService;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005C624;
    v6[3] = &unk_1007147C8;
    v6[4] = self;
    -[SFService activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }
}

- (void)_ensureServerStopped
{
  SFService *pinPairService;
  SFPINPairSession *pinPairSession;
  NSUUID *pinPairUUID;

  if (self->_pinPairService)
  {
    if (dword_1007B0708 <= 30
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _ensureServerStopped]", 30, "PINPair service stop\n");
    }
    -[SFService invalidate](self->_pinPairService, "invalidate");
    pinPairService = self->_pinPairService;
    self->_pinPairService = 0;

  }
  if (self->_pinPairSession)
  {
    if (dword_1007B0708 <= 30
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _ensureServerStopped]", 30, "PINPair session stop\n");
    }
    -[SFPINPairSession invalidate](self->_pinPairSession, "invalidate");
    pinPairSession = self->_pinPairSession;
    self->_pinPairSession = 0;

  }
  pinPairUUID = self->_pinPairUUID;
  self->_pinPairUUID = 0;

}

- (void)_pinPairHandleRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t UUIDEx;
  id v7;
  void *v8;
  SFPINPairSession *pinPairSession;
  SFPINPairSession *v10;
  SFPINPairSession *v11;
  SFPINPairSession *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[2];

  v4 = a3;
  v16[0] = 0;
  v16[1] = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "headerFields"));
  UUIDEx = CFDictionaryGetUUIDEx(v5, CFSTR("sid"), 0, v16);

  if ((_DWORD)UUIDEx)
  {
    if (dword_1007B0708 <= 60
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 60)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _pinPairHandleRequest:]", 60, "### PINPair request no UUID: %#m\n", UUIDEx);
    }
  }
  else
  {
    v7 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v16);
    if (v7)
    {
      v8 = v7;
      if ((-[NSUUID isEqual:](self->_pinPairUUID, "isEqual:", v7) & 1) == 0 && self->_pinPairSession)
      {
        if (dword_1007B0708 <= 30
          && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
        {
          LogPrintF(&dword_1007B0708, "-[SDSetupAgent _pinPairHandleRequest:]", 30, "PINPair session %@ ending for %@\n", self->_pinPairUUID, v8);
        }
        -[SFPINPairSession invalidate](self->_pinPairSession, "invalidate");
        pinPairSession = self->_pinPairSession;
        self->_pinPairSession = 0;

      }
      v10 = self->_pinPairSession;
      if (!v10)
      {
        if (dword_1007B0708 <= 30
          && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
        {
          LogPrintF(&dword_1007B0708, "-[SDSetupAgent _pinPairHandleRequest:]", 30, "PINPair session create %@\n", v8);
        }
        objc_storeStrong((id *)&self->_pinPairUUID, v8);
        v11 = (SFPINPairSession *)objc_alloc_init((Class)SFPINPairSession);
        v12 = self->_pinPairSession;
        self->_pinPairSession = v11;

        -[SFPINPairSession setDispatchQueue:](self->_pinPairSession, "setDispatchQueue:", self->_dispatchQueue);
        -[SFPINPairSession setSfService:](self->_pinPairSession, "setSfService:", self->_pinPairService);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10005CB40;
        v15[3] = &unk_1007147C8;
        v15[4] = self;
        -[SFPINPairSession setCompletionHandler:](self->_pinPairSession, "setCompletionHandler:", v15);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10005CBEC;
        v14[3] = &unk_100715260;
        v14[4] = self;
        -[SFPINPairSession setShowPINHandler:](self->_pinPairSession, "setShowPINHandler:", v14);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10005CBF4;
        v13[3] = &unk_1007146D8;
        v13[4] = self;
        -[SFPINPairSession setHidePINHandler:](self->_pinPairSession, "setHidePINHandler:", v13);
        -[SFPINPairSession activate](self->_pinPairSession, "activate");
        v10 = self->_pinPairSession;
      }
      -[SFPINPairSession handleServerRequest:](v10, "handleServerRequest:", v4);

    }
    else if (dword_1007B0708 <= 60
           && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 60)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _pinPairHandleRequest:]", 60, "### PINPair request UUID failed\n");
    }
  }

}

- (void)_pwsHandleUserResponse:(int)a3 device:(id)a4 info:(id)a5
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a5;
  if (dword_1007B0708 <= 60 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 60)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent _pwsHandleUserResponse:device:info:]", 60, "### pwsHandleUserResponse not supported on current platform\n");

}

- (void)_pwsHandleProgressEvent:(unsigned int)a3 info:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  int v8;
  const __CFString *v9;
  __CFString *v10;

  v5 = (__CFString *)a4;
  v6 = v5;
  if (dword_1007B0708 > 30)
    goto LABEL_38;
  v10 = v5;
  if (dword_1007B0708 == -1)
  {
    v8 = _LogCategory_Initialize(&dword_1007B0708, 30);
    v6 = v10;
    if (!v8)
      goto LABEL_38;
  }
  if ((int)a3 <= 49)
  {
    if ((int)a3 > 29)
    {
      switch(a3)
      {
        case 0x1Eu:
          v7 = "Error";
          break;
        case 0x1Fu:
          v7 = "SessionStarted";
          break;
        case 0x20u:
          v7 = "SessionEnded";
          break;
        case 0x21u:
          v7 = "SessionSecured";
          break;
        case 0x28u:
          v7 = "PreAuthStart";
          break;
        default:
          goto LABEL_34;
      }
      goto LABEL_35;
    }
    switch(a3)
    {
      case 0u:
        v7 = "Invalid";
        goto LABEL_35;
      case 0xAu:
        v7 = "Start";
        goto LABEL_35;
      case 0x14u:
        v7 = "Final";
        goto LABEL_35;
    }
LABEL_34:
    v7 = "?";
    goto LABEL_35;
  }
  if ((int)a3 > 79)
  {
    switch(a3)
    {
      case 'P':
        v7 = "PasswordSending";
        break;
      case 'Q':
      case 'U':
        goto LABEL_34;
      case 'R':
        v7 = "PasswordSent";
        break;
      case 'S':
        v7 = "PasswordReceived";
        break;
      case 'T':
        v7 = "PasswordAccepted";
        break;
      case 'V':
        v7 = "PasswordDeclined";
        break;
      default:
        if (a3 != 100)
          goto LABEL_34;
        v7 = "Finished";
        break;
    }
    goto LABEL_35;
  }
  if (a3 == 50)
  {
    v7 = "PreAuthFinish";
    goto LABEL_35;
  }
  if (a3 == 60)
  {
    v7 = "SecurityStart";
    goto LABEL_35;
  }
  if (a3 != 70)
    goto LABEL_34;
  v7 = "SecurityFinished";
LABEL_35:
  v9 = &stru_10072FE60;
  if (v6)
    v9 = v6;
  LogPrintF(&dword_1007B0708, "-[SDSetupAgent _pwsHandleProgressEvent:info:]", 30, "PWS progress: %s, %@", v7, v9);
  v6 = v10;
LABEL_38:

}

- (void)_repairEnsuredStarted
{
  SDSetupAgent *v2;
  int *p_cfuNotifyToken;
  NSObject *dispatchQueue;
  CUSystemMonitor *v5;
  CUSystemMonitor *manateeMonitor;
  CUSystemMonitor *v7;
  NEVPNConnection *v8;
  NEVPNConnection *vpnCnx;
  void *v10;
  SFWiFiHealthMonitor *v11;
  SFWiFiHealthMonitor *wifiHealthMonitor;
  NSObject *v13;
  SFDeviceRepairService *v14;
  SFDeviceRepairService *repairService;
  void *v16;
  void *v17;
  dispatch_source_t v18;
  OS_dispatch_source *repairTimer;
  NSObject *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD handler[5];

  v2 = self;
  if (self->_problemNotifyToken == -1)
  {
    if (dword_1007B0708 <= 30
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _repairEnsuredStarted]", 30, "TTF: Problem monitoring start\n");
    }
    self = (SDSetupAgent *)notify_register_check("com.apple.sharing.problems", &v2->_problemNotifyToken);
  }
  p_cfuNotifyToken = &v2->_cfuNotifyToken;
  if (v2->_cfuNotifyToken == -1 && (v2->_prefRepairAccounts || v2->_prefRepairHomeKit))
  {
    dispatchQueue = v2->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10005D38C;
    handler[3] = &unk_100714EC8;
    handler[4] = v2;
    notify_register_dispatch("com.apple.corefollowup.items_changed", p_cfuNotifyToken, dispatchQueue, handler);
    self = (SDSetupAgent *)-[SDSetupAgent _repairHandleCFUItemsChanged](v2, "_repairHandleCFUItemsChanged");
  }
  if (!v2->_manateeMonitor && v2->_cdpEnabled)
  {
    v5 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    manateeMonitor = v2->_manateeMonitor;
    v2->_manateeMonitor = v5;

    -[CUSystemMonitor setDispatchQueue:](v2->_manateeMonitor, "setDispatchQueue:", v2->_dispatchQueue);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10005D418;
    v27[3] = &unk_1007146D8;
    v27[4] = v2;
    -[CUSystemMonitor setManateeChangedHandler:](v2->_manateeMonitor, "setManateeChangedHandler:", v27);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10005D420;
    v26[3] = &unk_1007146D8;
    v26[4] = v2;
    -[CUSystemMonitor setPrimaryAppleIDChangedHandler:](v2->_manateeMonitor, "setPrimaryAppleIDChangedHandler:", v26);
    v7 = v2->_manateeMonitor;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10005D428;
    v25[3] = &unk_1007146D8;
    v25[4] = v2;
    self = (SDSetupAgent *)-[CUSystemMonitor activateWithCompletion:](v7, "activateWithCompletion:", v25);
  }
  if (!v2->_vpnCnx && v2->_prefRepairVPN)
  {
    v8 = (NEVPNConnection *)-[objc_class createConnectionForEnabledEnterpriseConfiguration](off_1007B07A0(), "createConnectionForEnabledEnterpriseConfiguration");
    vpnCnx = v2->_vpnCnx;
    v2->_vpnCnx = v8;

    -[NEVPNConnection addObserver:forKeyPath:options:context:](v2->_vpnCnx, "addObserver:forKeyPath:options:context:", v2, CFSTR("lastDisconnectError"), 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NEVPNConnection lastDisconnectError](v2->_vpnCnx, "lastDisconnectError"));
    if (dword_1007B0708 <= 40
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 40)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _repairEnsuredStarted]", 40, "TTF: VPN initial: %{error}\n", v10);
    }
    -[SDSetupAgent _repairVPNError:](v2, "_repairVPNError:", v10);

  }
  if (!v2->_wifiHealthMonitor && v2->_prefRepairWiFi)
  {
    v11 = (SFWiFiHealthMonitor *)objc_alloc_init((Class)SFWiFiHealthMonitor);
    wifiHealthMonitor = v2->_wifiHealthMonitor;
    v2->_wifiHealthMonitor = v11;

    -[SFWiFiHealthMonitor setDispatchQueue:](v2->_wifiHealthMonitor, "setDispatchQueue:", v2->_dispatchQueue);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10005D430;
    v24[3] = &unk_100715288;
    v24[4] = v2;
    -[SFWiFiHealthMonitor setStatusHandler:](v2->_wifiHealthMonitor, "setStatusHandler:", v24);
    self = (SDSetupAgent *)-[SFWiFiHealthMonitor activate](v2->_wifiHealthMonitor, "activate");
  }
  if (SFDeviceClassCodeGet(self, p_cfuNotifyToken) == 4 && v2->_cnsNotifyToken == -1)
  {
    v13 = v2->_dispatchQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10005D558;
    v23[3] = &unk_100714EC8;
    v23[4] = v2;
    notify_register_dispatch(kCNUserInteractionRequirementNotifyKey, &v2->_cnsNotifyToken, v13, v23);
    -[SDSetupAgent _repairHandleCNSStateChanged](v2, "_repairHandleCNSStateChanged");
  }
  if (!v2->_repairService)
  {
    if (dword_1007B0708 <= 30
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _repairEnsuredStarted]", 30, "TTF: RepairService start\n");
    }
    v14 = (SFDeviceRepairService *)objc_alloc_init((Class)SFDeviceRepairService);
    repairService = v2->_repairService;
    v2->_repairService = v14;

    -[SFDeviceRepairService setDispatchQueue:](v2->_repairService, "setDispatchQueue:", v2->_dispatchQueue);
    -[SFDeviceRepairService setProblemFlags:](v2->_repairService, "setProblemFlags:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "myAltDSID"));
    -[SFDeviceRepairService setAltDSID:](v2->_repairService, "setAltDSID:", v17);

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10005D5E4;
    v22[3] = &unk_1007152B0;
    v22[4] = v2;
    -[SFDeviceRepairService setProgressHandler:](v2->_repairService, "setProgressHandler:", v22);
    -[SFDeviceRepairService activate](v2->_repairService, "activate");
  }
  if (!v2->_repairTimer)
  {
    v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v2->_dispatchQueue);
    repairTimer = v2->_repairTimer;
    v2->_repairTimer = (OS_dispatch_source *)v18;

    v20 = v2->_repairTimer;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10005DE14;
    v21[3] = &unk_1007146D8;
    v21[4] = v2;
    dispatch_source_set_event_handler(v20, v21);
    SFDispatchTimerSet(v2->_repairTimer, 300.0, 300.0, -4.0);
    dispatch_activate((dispatch_object_t)v2->_repairTimer);
  }
  -[SDSetupAgent _repairProblemFlagsChanged](v2, "_repairProblemFlagsChanged");
}

- (void)_repairEnsuredStopped
{
  int cfuNotifyToken;
  CUSystemMonitor *manateeMonitor;
  OS_dispatch_source *repairTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  NEVPNConnection *vpnCnx;
  NEVPNConnection *v9;
  SFWiFiHealthMonitor *wifiHealthMonitor;
  int cnsNotifyToken;
  SFDeviceRepairService *repairService;
  int problemNotifyToken;

  cfuNotifyToken = self->_cfuNotifyToken;
  if (cfuNotifyToken != -1)
  {
    notify_cancel(cfuNotifyToken);
    self->_cfuNotifyToken = -1;
  }
  -[CUSystemMonitor invalidate](self->_manateeMonitor, "invalidate");
  manateeMonitor = self->_manateeMonitor;
  self->_manateeMonitor = 0;

  self->_manateeProblem = 0;
  repairTimer = self->_repairTimer;
  if (repairTimer)
  {
    v6 = repairTimer;
    dispatch_source_cancel(v6);
    v7 = self->_repairTimer;
    self->_repairTimer = 0;

  }
  vpnCnx = self->_vpnCnx;
  if (vpnCnx)
  {
    -[NEVPNConnection removeObserver:forKeyPath:](vpnCnx, "removeObserver:forKeyPath:", self, CFSTR("lastDisconnectError"));
    v9 = self->_vpnCnx;
    self->_vpnCnx = 0;

  }
  -[SFWiFiHealthMonitor invalidate](self->_wifiHealthMonitor, "invalidate");
  wifiHealthMonitor = self->_wifiHealthMonitor;
  self->_wifiHealthMonitor = 0;

  *(_WORD *)&self->_wifiBad = 0;
  cnsNotifyToken = self->_cnsNotifyToken;
  if (cnsNotifyToken != -1)
  {
    notify_cancel(cnsNotifyToken);
    self->_cnsNotifyToken = -1;
  }
  self->_cnsNeedsUI = 0;
  self->_problemFlags = 0;
  -[SDSetupAgent _repairProblemFlagsChanged](self, "_repairProblemFlagsChanged");
  if (self->_repairService)
  {
    if (dword_1007B0708 <= 30
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _repairEnsuredStopped]", 30, "TTF: RepairService stop\n");
    }
    -[SFDeviceRepairService invalidateWithFlags:](self->_repairService, "invalidateWithFlags:", 1);
    repairService = self->_repairService;
    self->_repairService = 0;

  }
  problemNotifyToken = self->_problemNotifyToken;
  if (problemNotifyToken != -1)
  {
    notify_cancel(problemNotifyToken);
    self->_problemNotifyToken = -1;
    if (dword_1007B0708 <= 30
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _repairEnsuredStopped]", 30, "TTF: Problem monitoring stop\n");
    }
  }
}

- (void)_renewAccountIfNecessaryForCFUItems:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSDate *v20;
  NSDate *lastRenewalAttempt;
  _QWORD v22[4];
  id v23;
  id v24;
  void (**v25)(_QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (self->_prefRepairAccounts)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexesOfObjectsPassingTest:", &stru_1007152F0));
    if (objc_msgSend(v9, "count"))
    {
      if (!self->_lastRenewalAttempt)
        goto LABEL_6;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      objc_msgSend(v10, "timeIntervalSinceDate:", self->_lastRenewalAttempt);
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      objc_msgSend(v13, "timeIntervalSinceDate:", self->_lastRenewalAttempt);
      v15 = v14;

      if (v12 >= 0.0)
      {
        if (v15 >= 86400.0)
        {
LABEL_6:
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
          v17 = sub_10019B264(v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          v19 = v18;
          if (v18)
          {
            if (!objc_msgSend(v18, "isWarmingUp"))
            {
              if (dword_1007B0708 <= 30
                && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
              {
                LogPrintF(&dword_1007B0708, "-[SDSetupAgent _renewAccountIfNecessaryForCFUItems:completion:]", 30, "Attempting to renew accounts instead of posting a problem\n");
              }
              v20 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
              lastRenewalAttempt = self->_lastRenewalAttempt;
              self->_lastRenewalAttempt = v20;

              v22[0] = _NSConcreteStackBlock;
              v22[1] = 3221225472;
              v22[2] = sub_10005E474;
              v22[3] = &unk_100715318;
              v25 = v8;
              v23 = v6;
              v24 = v9;
              objc_msgSend(v16, "renewCredentialsForAccount:completion:", v19, v22);

              goto LABEL_30;
            }
            if (dword_1007B0708 <= 30
              && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
            {
              LogPrintF(&dword_1007B0708, "-[SDSetupAgent _renewAccountIfNecessaryForCFUItems:completion:]", 30, "Primary account is warming up, not renewing credentials\n");
            }
          }
          else if (dword_1007B0708 <= 90
                 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 90)))
          {
            LogPrintF(&dword_1007B0708, "-[SDSetupAgent _renewAccountIfNecessaryForCFUItems:completion:]", 90, "No primary account found to renew\n");
          }
          ((void (**)(_QWORD, id))v8)[2](v8, v6);
LABEL_30:

          goto LABEL_31;
        }
      }
      else if (v15 <= -86400.0)
      {
        goto LABEL_6;
      }
      if (dword_1007B0708 <= 30
        && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
      {
        LogPrintF(&dword_1007B0708, "-[SDSetupAgent _renewAccountIfNecessaryForCFUItems:completion:]", 30, "Already attempted a repair today\n");
      }
    }
    ((void (**)(_QWORD, id))v8)[2](v8, v6);
LABEL_31:

    goto LABEL_32;
  }
  (*((void (**)(id, id))v7 + 2))(v7, v6);
LABEL_32:

}

- (void)_repairHandleCFUItemsChanged
{
  id v3;
  _QWORD v4[5];

  v3 = objc_msgSend(objc_alloc(off_1007B07A8()), "initWithClientIdentifier:", 0);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005E620;
  v4[3] = &unk_100715340;
  v4[4] = self;
  objc_msgSend(v3, "pendingFollowUpItemsWithCompletion:", v4);

}

- (void)_repairHandleCFUItems:(id)a3
{
  id v4;
  unint64_t problemFlags;
  uint64_t v6;
  unint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  NSObject *dispatchQueue;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  id obj;
  _QWORD block[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a3;
  problemFlags = self->_problemFlags;
  if (-[SDSetupAgent _useSymptomsReport](self, "_useSymptomsReport"))
  {
    v6 = problemFlags & 0xFFBAFFA7;
  }
  else
  {
    v6 = problemFlags & 0xFFB8FFA1;
    if (self->_manateeProblem)
      v6 = problemFlags & 0xFFB8FFA1 | 0x20000;
  }
  if (self->_wifiBad || self->_cnsNeedsUI)
    v6 |= 0x10uLL;
  if (self->_wifiBad8021x)
    v7 = v6 | 0x10000;
  else
    v7 = v6;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueIdentifier"));
        if (v13)
        {
          if (dword_1007B0708 <= 50
            && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
          {
            LogPrintF(&dword_1007B0708, "-[SDSetupAgent _repairHandleCFUItems:]", 50, "TTF: CFU item reported: '%@'\n", v13);
          }
          if (self->_prefRepairHomeKit)
          {
            v14 = off_1007B07B0();
            v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
            v16 = objc_msgSend(v13, "isEqual:", v15);

            if (v16)
            {
LABEL_26:
              v7 |= 8uLL;
              goto LABEL_58;
            }
          }
          if (objc_msgSend(v13, "isEqual:", CFSTR("com.apple.homekit.PrimaryResident")))
          {
            v7 |= 0x400000uLL;
            goto LABEL_58;
          }
          if (self->_prefRepairAccounts)
          {
            if (sub_10005E2F8(v12) && !-[SDSetupAgent _useSymptomsReport](self, "_useSymptomsReport"))
            {
              -[CUSystemMonitor forceManateeStateRefresh](self->_manateeMonitor, "forceManateeStateRefresh");
              if ((SFIsDeviceAppleTV(-[SDSetupAgent _fetchSymptomsReport](self, "_fetchSymptomsReport")) & 1) != 0)
              {
                v18 = 0;
              }
              else
              {
                v19 = -[objc_class defaultStore](off_1007B07B8(), "defaultStore");
                v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "activeAccount"));

              }
              v21 = 6;
              if (!v18)
                v21 = 2;
              v7 |= v21;
              goto LABEL_58;
            }
            if (self->_prefRepairAccounts
              && objc_msgSend(v13, "isEqual:", CFSTR("com.apple.SSFollowUpIdentifier.RenewCredentials"))
              && !-[SDSetupAgent _useSymptomsReport](self, "_useSymptomsReport"))
            {
              goto LABEL_57;
            }
          }
          if (objc_msgSend(v13, "isEqual:", CFSTR("RepairCDPState")))
          {
            dispatchQueue = self->_dispatchQueue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10005EDEC;
            block[3] = &unk_1007146D8;
            block[4] = self;
            dispatch_async(dispatchQueue, block);
            goto LABEL_58;
          }
          if (objc_msgSend(v13, "isEqual:", CFSTR("x-bt")))
          {
            v7 |= 0x200uLL;
            goto LABEL_58;
          }
          if (objc_msgSend(v13, "isEqual:", CFSTR("x-cdp")))
          {
            v7 |= 0x20000uLL;
            goto LABEL_58;
          }
          if (objc_msgSend(v13, "isEqual:", CFSTR("x-homekit")))
            goto LABEL_26;
          if (objc_msgSend(v13, "isEqual:", CFSTR("x-hw")))
          {
            v7 |= 0x100uLL;
            goto LABEL_58;
          }
          if (objc_msgSend(v13, "isEqual:", CFSTR("x-icloud")))
          {
            v7 |= 2uLL;
            goto LABEL_58;
          }
          if (objc_msgSend(v13, "isEqual:", CFSTR("x-inet")))
          {
            v7 |= 0x80uLL;
            goto LABEL_58;
          }
          if (objc_msgSend(v13, "isEqual:", CFSTR("x-itunes")))
          {
LABEL_57:
            v7 |= 4uLL;
            goto LABEL_58;
          }
          if (objc_msgSend(v13, "isEqual:", CFSTR("x-profile")))
          {
            v7 |= 0x40000uLL;
          }
          else if (objc_msgSend(v13, "isEqual:", CFSTR("x-recovery")))
          {
            v7 |= 0x800uLL;
          }
          else if (objc_msgSend(v13, "isEqual:", CFSTR("x-StereoError")))
          {
            v7 |= 0x4000uLL;
          }
          else if (objc_msgSend(v13, "isEqual:", CFSTR("x-StereoNotFound")))
          {
            v7 |= 0x1000uLL;
          }
          else if (objc_msgSend(v13, "isEqual:", CFSTR("x-StereoVersion")))
          {
            v7 |= 0x2000uLL;
          }
          else if (objc_msgSend(v13, "isEqual:", CFSTR("x-thermal")))
          {
            v7 |= 0x400uLL;
          }
          else if (objc_msgSend(v13, "isEqual:", CFSTR("x-wifi")))
          {
            v7 |= 0x10uLL;
          }
          else if (objc_msgSend(v13, "isEqual:", CFSTR("x-wifi8021x")))
          {
            v7 |= 0x10000uLL;
          }
          else if (objc_msgSend(v13, "isEqual:", CFSTR("x-wifiperf")))
          {
            v7 |= 0x40uLL;
          }
          else if (objc_msgSend(v13, "isEqual:", CFSTR("x-vpn")))
          {
            v7 |= 0x8000uLL;
          }
          else if (objc_msgSend(v13, "isEqual:", CFSTR("x-netnoshare")))
          {
            v7 |= 0x80000uLL;
          }
          else if (objc_msgSend(v13, "isEqual:", CFSTR("x-netneedprofile")))
          {
            v7 |= 0x100000uLL;
          }
          else if (objc_msgSend(v13, "isEqual:", CFSTR("x-captivenetwork")))
          {
            v7 |= 0x200000uLL;
          }
          else if (objc_msgSend(v13, "isEqual:", CFSTR("x-hkprimary")))
          {
            v7 |= 0x400000uLL;
          }
        }
        else if (dword_1007B0708 <= 60
               && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 60)))
        {
          LogPrintF(&dword_1007B0708, "-[SDSetupAgent _repairHandleCFUItems:]", 60, "TTF: ### CFU item without identifier: %@\n", v12);
        }
LABEL_58:

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v9 = v22;
    }
    while (v22);
  }

  if (v7 != self->_problemFlags)
  {
    self->_problemFlags = v7;
    -[SDSetupAgent _repairProblemFlagsChanged](self, "_repairProblemFlagsChanged");
  }

}

- (BOOL)_useSymptomsReport
{
  uint64_t v2;
  uint64_t v3;

  v2 = _os_feature_enabled_impl("AppleIDSetup", "SandstoneRepair");
  if ((_DWORD)v2)
    LOBYTE(v2) = SFDeviceClassCodeGet(v2, v3) == 6;
  return v2;
}

- (void)_fetchSymptomsReport
{
  void *v3;
  void *v4;
  AISRepairController *v5;
  AISRepairController *repairController;
  id v7;
  void *v8;
  AISRepairController *v9;
  _QWORD v10[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "myAltDSID"));

  if (v4)
  {
    if (!self->_repairController)
    {
      v5 = (AISRepairController *)objc_alloc_init(off_1007B07C0());
      repairController = self->_repairController;
      self->_repairController = v5;

    }
    if (dword_1007B0708 <= 30
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _fetchSymptomsReport]", 30, "TTF: Fetching symptoms report\n");
    }
    v7 = objc_msgSend(objc_alloc(off_1007B07C8()), "initWithAltDSID:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", AIDAServiceTypeCloud, AIDAServiceTypeStore, 0));
    objc_msgSend(v7, "setRequiredServiceTypes:", v8);

    v9 = self->_repairController;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10005EFE8;
    v10[3] = &unk_100715368;
    v10[4] = self;
    -[AISRepairController generateSymptomReportWithContext:completionHandler:](v9, "generateSymptomReportWithContext:completionHandler:", v7, v10);

  }
  else if (dword_1007B0708 <= 30
         && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
  {
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent _fetchSymptomsReport]", 30, "No altDSID\n");
  }

}

- (void)_repairHandleCompletion
{
  OS_dispatch_source *repairTimer;

  if (dword_1007B0708 <= 30 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent _repairHandleCompletion]", 30, "TTF: Repair complete\n");
  repairTimer = self->_repairTimer;
  if (repairTimer)
    SFDispatchTimerSet(repairTimer, 300.0, 300.0, -4.0);
  self->_problemFlags = 0;
  -[SDSetupAgent _repairProblemFlagsChanged](self, "_repairProblemFlagsChanged");
  -[SFWiFiHealthMonitor reset](self->_wifiHealthMonitor, "reset");
}

- (void)_repairHandleManateeChanged
{
  CUSystemMonitor *manateeMonitor;
  unsigned int v4;
  unint64_t problemFlags;
  unint64_t v6;

  manateeMonitor = self->_manateeMonitor;
  if (manateeMonitor && -[CUSystemMonitor primaryAppleIDIsHSA2](manateeMonitor, "primaryAppleIDIsHSA2"))
  {
    if (-[SDSetupAgent _useSymptomsReport](self, "_useSymptomsReport"))
    {
      -[SDSetupAgent _fetchSymptomsReport](self, "_fetchSymptomsReport");
    }
    else
    {
      v4 = -[CUSystemMonitor manateeState](self->_manateeMonitor, "manateeState");
      self->_manateeProblem = v4 == 1;
      problemFlags = self->_problemFlags;
      v6 = problemFlags | 0x20000;
      if (v4 != 1)
        v6 = self->_problemFlags & 0xFFFDFFFF;
      if (v6 != problemFlags)
      {
        self->_problemFlags = v6;
        -[SDSetupAgent _repairProblemFlagsChanged](self, "_repairProblemFlagsChanged");
      }
    }
  }
}

- (void)_repairHandleCNSStateChanged
{
  unint64_t problemFlags;
  int IsRequired;

  problemFlags = self->_problemFlags;
  IsRequired = CNUserInteractionIsRequired();
  if (dword_1007B0708 <= 30 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent _repairHandleCNSStateChanged]", 30, "TTF: Captive state changed (needsUI: %d -> %d)", self->_cnsNeedsUI, IsRequired != 0);
  if (IsRequired)
  {
    self->_cnsNeedsUI = 1;
    problemFlags |= 0x10uLL;
  }
  else if (self->_cnsNeedsUI)
  {
    self->_cnsNeedsUI = 0;
    if (self->_wifiBad)
      problemFlags |= 0x10uLL;
    else
      problemFlags = problemFlags & 0xFFFFFFEF;
  }
  if (problemFlags != self->_problemFlags)
  {
    self->_problemFlags = problemFlags;
    -[SDSetupAgent _repairProblemFlagsChanged](self, "_repairProblemFlagsChanged");
  }
}

- (void)_repairProblemCheck
{
  unsigned int v3;
  const char *v4;

  -[CUSystemMonitor forceManateeStateRefresh](self->_manateeMonitor, "forceManateeStateRefresh");
  if (dword_1007B0708 <= 30 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
  {
    v3 = -[CUSystemMonitor manateeState](self->_manateeMonitor, "manateeState");
    if (v3 > 2)
      v4 = "?";
    else
      v4 = off_1007154D8[v3];
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent _repairProblemCheck]", 30, "Repair periodic check: CDP %s\n", v4);
  }
  -[SDSetupAgent _repairHandleManateeChanged](self, "_repairHandleManateeChanged");
}

- (void)_repairProblemFlagsChanged
{
  unint64_t problemFlags;
  uint64_t v4;
  int problemNotifyToken;

  problemFlags = self->_problemFlags;
  if (dword_1007B0708 <= 30 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent _repairProblemFlagsChanged]", 30, "TTF: Problem flags changed: %#ll{flags}\n", problemFlags, &unk_1005CC0D1);
  if (problemFlags)
    v4 = problemFlags | 1;
  else
    v4 = 0;
  -[SFDeviceRepairService setProblemFlags:](self->_repairService, "setProblemFlags:", v4);
  problemNotifyToken = self->_problemNotifyToken;
  if (problemNotifyToken != -1)
  {
    notify_set_state(problemNotifyToken, v4);
    notify_post("com.apple.sharing.problems");
  }
}

- (void)_repairSilentStart:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  SFDeviceRepairSession *v8;
  SFDeviceRepairSession *repairSession;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];

  v4 = a3;
  if ((objc_msgSend(v4, "problemFlags") & 0x10000) != 0)
  {
    if (dword_1007B0708 <= 50
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _repairSilentStart:]", 50, "Ignoring proximity repair for WiFi 802.1x (needs user)\n");
    }
  }
  else
  {
    if ((objc_msgSend(v4, "problemFlags") & 0x10) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
      v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("AudioAccessory"));

      if (v6)
      {
        v7 = (void *)WiFiCopyCurrentNetworkInfo(0);
        if (CFDictionaryGetInt64(v7, CFSTR("likelyCaptive"), 0))
        {
          if (dword_1007B0708 <= 50
            && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
          {
            LogPrintF(&dword_1007B0708, "-[SDSetupAgent _repairSilentStart:]", 50, "Ignoring proximity repair for captive WiFi (needs user)\n");
          }
LABEL_26:

          goto LABEL_27;
        }

      }
    }
    if (((unint64_t)objc_msgSend(v4, "problemFlags") & 0x22001E) != 0)
    {
      -[SFDeviceRepairSession invalidate](self->_repairSession, "invalidate");
      v8 = (SFDeviceRepairSession *)objc_alloc_init((Class)SFDeviceRepairSession);
      repairSession = self->_repairSession;
      self->_repairSession = v8;

      -[SFDeviceRepairSession setPeerDevice:](self->_repairSession, "setPeerDevice:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "myAltDSID"));
      -[SFDeviceRepairSession setAltDSID:](self->_repairSession, "setAltDSID:", v11);

      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10005F84C;
      v19[3] = &unk_1007152B0;
      v19[4] = self;
      -[SFDeviceRepairSession setProgressHandler:](self->_repairSession, "setProgressHandler:", v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
      v13 = objc_msgSend(v12, "foundTicks");

      if (v13)
      {
        v14 = mach_absolute_time();
        v15 = UpTicksToMilliseconds(v14 - (_QWORD)v13);
      }
      else
      {
        v15 = 0;
      }
      -[SFDeviceRepairSession setTriggerMs:](self->_repairSession, "setTriggerMs:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](IDSServerBag, "sharedInstance"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("SDDisableRepairSilentAuth")));

      v18 = objc_opt_class(NSNumber, v17);
      if ((objc_opt_isKindOfClass(v7, v18) & 1) != 0 && objc_msgSend(v7, "BOOLValue"))
        -[SFDeviceRepairSession setDisableSilentAuth:](self->_repairSession, "setDisableSilentAuth:", 1);
      -[SFDeviceRepairSession activate](self->_repairSession, "activate");
      goto LABEL_26;
    }
    if (dword_1007B0708 <= 50
      && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    {
      LogPrintF(&dword_1007B0708, "-[SDSetupAgent _repairSilentStart:]", 50, "Ignoring device that has problems that are not silently fixable %#ll{flags}\n", objc_msgSend(v4, "problemFlags"), &unk_1005CC0D1);
    }
  }
LABEL_27:

}

- (void)_repairSilentProgress:(unsigned int)a3 info:(id)a4
{
  const char *v6;
  const __CFString *v7;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v10;
  SFDeviceRepairSession *v11;
  SFDeviceRepairSession *repairSession;
  __CFString *v13;

  v13 = (__CFString *)a4;
  if (dword_1007B0708 <= 30 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
  {
    v6 = sub_10005D698(a3);
    v7 = &stru_10072FE60;
    if (v13)
      v7 = v13;
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent _repairSilentProgress:info:]", 30, "Repair silent progress: %s %##@\n", v6, v7);
  }
  switch(a3)
  {
    case 0x14u:
      if (dword_1007B0708 <= 30
        && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
      {
        LogPrintF(&dword_1007B0708, "-[SDSetupAgent _repairSilentProgress:info:]", 30, "Repair Finalized\n");
      }
      break;
    case 0x60u:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceRepairSession peerDevice](self->_repairSession, "peerDevice"));
      if (dword_1007B0708 <= 30
        && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
      {
        LogPrintF(&dword_1007B0708, "-[SDSetupAgent _repairSilentProgress:info:]", 30, "Repair completed: %@\n", v10);
      }
      -[SFDeviceRepairSession invalidate](self->_repairSession, "invalidate");
      repairSession = self->_repairSession;
      self->_repairSession = 0;

      self->_triggeredUIRepair = 0;
      goto LABEL_25;
    case 0x1Eu:
      TypeID = CFErrorGetTypeID();
      TypedValue = CFDictionaryGetTypedValue(v13, CFSTR("eo"), TypeID, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
      -[SDSetupAgent _repairUpdateIDSCache](self, "_repairUpdateIDSCache");
      -[SFDeviceRepairSession invalidate](self->_repairSession, "invalidate");
      v11 = self->_repairSession;
      self->_repairSession = 0;

      if (dword_1007B0708 <= 30
        && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
      {
        LogPrintF(&dword_1007B0708, "-[SDSetupAgent _repairSilentProgress:info:]", 30, "Repair silent done: %{error}\n", v10);
      }
LABEL_25:

      break;
  }

}

- (void)_repairUpdateIDSCache
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceRepairSession idsIdentifier](self->_repairSession, "idsIdentifier"));
  if (v3)
  {
    v6 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceRepairSession peerDevice](self->_repairSession, "peerDevice"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
      objc_msgSend(v5, "idsAddCachedIDSIdentifier:device:", v6, v4);

    }
    v3 = v6;
  }

}

- (void)_repairVPNError:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;
  unint64_t problemFlags;
  unint64_t v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
  v5 = objc_msgSend(v4, "isEqual:", CFSTR("NEVPNConnectionErrorDomainIPSec"));

  if ((v5 & 1) != 0)
  {
    v6 = objc_msgSend(v9, "code");
    problemFlags = self->_problemFlags;
    v8 = problemFlags | 0x8000;
    if (v6 != (id)21)
      v8 = self->_problemFlags & 0xFFFF7FFF;
  }
  else
  {
    problemFlags = self->_problemFlags;
    v8 = problemFlags & 0xFFFF7FFF;
  }
  if (v8 != problemFlags)
  {
    self->_problemFlags = v8;
    -[SDSetupAgent _repairProblemFlagsChanged](self, "_repairProblemFlagsChanged");
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("lastDisconnectError"), a4, a5, a6))
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005FC0C;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)proximityDeviceDidTrigger:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005FD40;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)testHomeKitDeviceDetected:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = a3;
  if (dword_1007B0708 <= 50 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent testHomeKitDeviceDetected:]", 50, "Testing HomeKit Device Detected (%@)\n", v4);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060038;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);

}

- (void)testNFCUI:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = a3;
  if (dword_1007B0708 <= 50 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent testNFCUI:]", 50, "Testing NFC UI (%@)\n", v4);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060150;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);

}

- (void)testPairUI:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v4 = a3;
  if (dword_1007B0708 <= 50 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent testPairUI:]", 50, "Testing pair UI (%@)\n", v4);
  v5 = objc_alloc_init((Class)SFDevice);
  v6 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000001"));
  objc_msgSend(v5, "setIdentifier:", v6);

  v7 = objc_alloc_init((Class)SFBLEDevice);
  objc_msgSend(v5, "setBleDevice:", v7);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006032C;
  block[3] = &unk_100715138;
  block[4] = self;
  v12 = v5;
  v13 = v4;
  v9 = v4;
  v10 = v5;
  dispatch_async(dispatchQueue, block);

}

- (void)testRepairUI:(id)a3
{
  id v4;
  id v5;
  id v6;
  const __CFString *v7;
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  if (dword_1007B0708 <= 50 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent testRepairUI:]", 50, "Testing pair UI (%@)\n", v4);
  v5 = objc_alloc_init((Class)SFDevice);
  v6 = objc_alloc((Class)NSUUID);
  if ((objc_msgSend(v4, "isEqual:", CFSTR("-fail")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000002");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-nowifi")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000003");
  }
  else if (objc_msgSend(v4, "isEqual:", CFSTR("-badwifi")))
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000004");
  }
  else
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000001");
  }
  v8 = objc_msgSend(v6, "initWithUUIDString:", v7);
  objc_msgSend(v5, "setIdentifier:", v8);

  objc_msgSend(v5, "setName:", CFSTR("Living Room"));
  v9 = objc_alloc_init((Class)SFBLEDevice);
  objc_msgSend(v5, "setBleDevice:", v9);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006059C;
  block[3] = &unk_100714860;
  block[4] = self;
  v13 = v5;
  v11 = v5;
  dispatch_async(dispatchQueue, block);

}

- (void)testSetupUIB238:(id)a3
{
  id v4;
  id v5;
  id v6;
  const __CFString *v7;
  id v8;
  id v9;
  unsigned __int8 v10;
  int64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *dispatchQueue;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  const __CFString *v21;
  void *v22;

  v4 = a3;
  if (dword_1007B0708 <= 50 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent testSetupUIB238:]", 50, "Testing Setup UI B238 (%@)\n", v4);
  v5 = objc_alloc_init((Class)SFDevice);
  v6 = objc_alloc((Class)NSUUID);
  if ((objc_msgSend(v4, "isEqual:", CFSTR("-fail")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000002");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-code")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000003");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-nowifi")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000004");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-badwifi")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000005");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-noicloud")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000006");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-nohsa2")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000007");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-noitunes")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000008");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-nohome")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000009");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-nokeychain")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-00000000000A");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-sharesplit")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-00000000000B");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-audio")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-00000000000C");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-siri")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-00000000000D");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-AppleMusic")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-00000000000E");
  }
  else if (objc_msgSend(v4, "isEqual:", CFSTR("-WiFiBadEnterprise")))
  {
    v7 = CFSTR("00000000-0000-0000-0000-00000000000F");
  }
  else
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000001");
  }
  v8 = objc_msgSend(v6, "initWithUUIDString:", v7);
  objc_msgSend(v5, "setIdentifier:", v8);

  objc_msgSend(v5, "setOsVersion:", 13);
  v9 = objc_alloc_init((Class)SFBLEDevice);
  objc_msgSend(v5, "setBleDevice:", v9);
  objc_msgSend(v5, "setDeviceClassCode:", 4);
  v10 = -[SDSetupAgent extractParameter:inString:](self, "extractParameter:inString:", CFSTR("device"), v4);
  objc_msgSend(v5, "setDeviceModelCode:", v10);
  v11 = -[SDSetupAgent extractParameter:inString:](self, "extractParameter:inString:", CFSTR("color"), v4);
  if (v11)
    v12 = v11;
  else
    v12 = 2;
  objc_msgSend(v5, "setDeviceActionType:", 33);
  v21 = CFSTR("cc");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12));
  v22 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  objc_msgSend(v9, "setAdvertisementFields:", v14);

  if (dword_1007B0708 <= 50 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent testSetupUIB238:]", 50, "Testing Setup UI HomePod action=%d device=%d color=%d\n", objc_msgSend(v5, "deviceActionType"), v10, v12);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060A30;
  block[3] = &unk_100715138;
  block[4] = self;
  v19 = v5;
  v20 = v4;
  v16 = v4;
  v17 = v5;
  dispatch_async(dispatchQueue, block);

}

- (int64_t)extractParameter:(id)a3 inString:(id)a4
{
  id v5;
  id v6;
  int64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "componentsSeparatedByString:", CFSTR(",")));
  v7 = (int64_t)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v10, "hasPrefix:", v5, (_QWORD)v14) & 1) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("=")));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
          v7 = (int)objc_msgSend(v12, "intValue");

          goto LABEL_11;
        }
      }
      v7 = (int64_t)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)testSetupUIiOS:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const __CFString *v9;
  id v10;
  id v11;
  NSObject *dispatchQueue;
  id v13;
  _QWORD block[5];
  id v15;

  v4 = a3;
  if (dword_1007B0708 <= 50 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent testSetupUIiOS:]", 50, "Testing Setup UI iOS (%@)\n", v4);
  v5 = objc_alloc_init((Class)SFDevice);
  if ((objc_msgSend(v4, "hasSuffix:", CFSTR("-ipad")) & 1) != 0)
  {
    v6 = 3;
LABEL_9:
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringToIndex:", (char *)objc_msgSend(v4, "length") - 5));

    v4 = (id)v7;
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "hasSuffix:", CFSTR("-ipod")))
  {
    v6 = 2;
    goto LABEL_9;
  }
  v6 = 1;
LABEL_11:
  objc_msgSend(v5, "setDeviceClassCode:", v6);
  v8 = objc_alloc((Class)NSUUID);
  if (objc_msgSend(v4, "isEqual:", CFSTR("-fail")))
    v9 = CFSTR("00000000-0000-0000-0000-000000000002");
  else
    v9 = CFSTR("00000000-0000-0000-0000-000000000001");
  v10 = objc_msgSend(v8, "initWithUUIDString:", v9);
  objc_msgSend(v5, "setIdentifier:", v10);

  v11 = objc_alloc_init((Class)SFBLEDevice);
  objc_msgSend(v5, "setBleDevice:", v11);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060E14;
  block[3] = &unk_100714860;
  block[4] = self;
  v15 = v5;
  v13 = v5;
  dispatch_async(dispatchQueue, block);

}

- (void)testSetupUIPasswordSharing:(id)a3
{
  id v4;
  id v5;
  id v6;
  const __CFString *v7;
  id v8;
  NSObject *dispatchQueue;
  id v10;
  _QWORD block[5];
  id v12;

  v4 = a3;
  if (dword_1007B0708 <= 50 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent testSetupUIPasswordSharing:]", 50, "WPS: Testing Setup UI Password Sharing (%@)\n", v4);
  v5 = objc_alloc_init((Class)SFDevice);
  objc_msgSend(v5, "setContactIdentifier:", CFSTR("00000000-0000-0000-0000-000000000000"));
  objc_msgSend(v5, "setRequestSSID:", CFSTR("WiFiNetwork"));
  v6 = objc_alloc((Class)NSUUID);
  if ((objc_msgSend(v4, "isEqual:", CFSTR("-rich")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000002");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-fail")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000003");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-hs")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000004");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-hsfail")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000005");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-device")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000006");
  }
  else if (objc_msgSend(v4, "isEqual:", CFSTR("-long")))
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000007");
  }
  else
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000001");
  }
  v8 = objc_msgSend(v6, "initWithUUIDString:", v7);
  objc_msgSend(v5, "setIdentifier:", v8);

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061024;
  block[3] = &unk_100714860;
  block[4] = self;
  v12 = v5;
  v10 = v5;
  dispatch_async(dispatchQueue, block);

}

- (void)testSetupUIWatch:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;

  v4 = a3;
  if (dword_1007B0708 <= 50 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent testSetupUIWatch:]", 50, "Testing Setup UI Watch (%@)\n", v4);
  v5 = objc_alloc_init((Class)SFDevice);
  v6 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000001"));
  objc_msgSend(v5, "setIdentifier:", v6);

  objc_msgSend(v5, "setName:", CFSTR("05938CDC"));
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006115C;
  block[3] = &unk_100714860;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(dispatchQueue, block);

}

- (void)testSetupUIWHA:(id)a3
{
  id v4;
  id v5;
  id v6;
  const __CFString *v7;
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  if (dword_1007B0708 <= 50 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent testSetupUIWHA:]", 50, "Testing Setup UI WHA (%@)\n", v4);
  v5 = objc_alloc_init((Class)SFDevice);
  v6 = objc_alloc((Class)NSUUID);
  if ((objc_msgSend(v4, "isEqual:", CFSTR("-fail")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000002");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-code")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000003");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-nowifi")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000004");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-badwifi")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000005");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-noicloud")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000006");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-nohsa2")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000007");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-noitunes")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000008");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-nohome")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000009");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("-mismatch")) & 1) != 0)
  {
    v7 = CFSTR("00000000-0000-0000-0000-00000000000A");
  }
  else if (objc_msgSend(v4, "isEqual:", CFSTR("-keychain")))
  {
    v7 = CFSTR("00000000-0000-0000-0000-00000000000B");
  }
  else
  {
    v7 = CFSTR("00000000-0000-0000-0000-000000000001");
  }
  v8 = objc_msgSend(v6, "initWithUUIDString:", v7);
  objc_msgSend(v5, "setIdentifier:", v8);

  v9 = objc_alloc_init((Class)SFBLEDevice);
  objc_msgSend(v5, "setBleDevice:", v9);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000613F4;
  block[3] = &unk_100714860;
  block[4] = self;
  v13 = v5;
  v11 = v5;
  dispatch_async(dispatchQueue, block);

}

- (void)testUIAppleTVSetup:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v4 = a3;
  if (dword_1007B0708 <= 50 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent testUIAppleTVSetup:]", 50, "Testing AppleTVSetup UI (%@)\n", v4);
  v5 = objc_alloc_init((Class)SFDevice);
  v6 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000001"));
  objc_msgSend(v5, "setIdentifier:", v6);

  v7 = objc_alloc_init((Class)SFBLEDevice);
  objc_msgSend(v5, "setBleDevice:", v7);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061558;
  block[3] = &unk_100715138;
  block[4] = self;
  v12 = v5;
  v13 = v4;
  v9 = v4;
  v10 = v5;
  dispatch_async(dispatchQueue, block);

}

- (void)testUIShareAudio:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  const __CFString *v9;
  id v10;

  v3 = a3;
  if (dword_1007B0708 <= 30 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 30)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent testUIShareAudio:]", 30, "TestShareAudio start: '%@'\n", v3);
  v4 = objc_alloc_init((Class)SFProxCardSessionClient);
  objc_msgSend(v4, "setViewControllerClassName:", CFSTR("ShareAudioAcceptMainController"));
  v5 = v3;
  v6 = v5;
  if (v5)
  {
    v9 = CFSTR("_proxTestParams");
    v10 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    objc_msgSend(v4, "setUserInfo:", v7);

  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100061784;
  v8[3] = &unk_1007147C8;
  v8[4] = v4;
  objc_msgSend(v4, "setErrorHandler:", v8);
  objc_msgSend(v4, "setInvalidationHandler:", &stru_100715388);
  objc_msgSend(v4, "activateWithCompletion:", &stru_1007153A8);

}

- (void)testUITVLatencySetup:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v4 = a3;
  if (dword_1007B0708 <= 50 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent testUITVLatencySetup:]", 50, "Testing TVLatencySetup UI (%@)\n", v4);
  v5 = objc_alloc_init((Class)SFDevice);
  v6 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000001"));
  objc_msgSend(v5, "setIdentifier:", v6);

  v7 = objc_alloc_init((Class)SFBLEDevice);
  objc_msgSend(v5, "setBleDevice:", v7);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061A4C;
  block[3] = &unk_100715138;
  block[4] = self;
  v12 = v5;
  v13 = v4;
  v9 = v4;
  v10 = v5;
  dispatch_async(dispatchQueue, block);

}

- (void)testUITVLatencyColorimeterSetup:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v4 = a3;
  if (dword_1007B0708 <= 50 && (dword_1007B0708 != -1 || _LogCategory_Initialize(&dword_1007B0708, 50)))
    LogPrintF(&dword_1007B0708, "-[SDSetupAgent testUITVLatencyColorimeterSetup:]", 50, "Testing TVLatencySetup UI (%@)\n", v4);
  v5 = objc_alloc_init((Class)SFDevice);
  v6 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000001"));
  objc_msgSend(v5, "setIdentifier:", v6);

  v7 = objc_alloc_init((Class)SFBLEDevice);
  objc_msgSend(v5, "setBleDevice:", v7);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061C54;
  block[3] = &unk_100715138;
  block[4] = self;
  v12 = v5;
  v13 = v4;
  v9 = v4;
  v10 = v5;
  dispatch_async(dispatchQueue, block);

}

- (void)testProxCardKit:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = objc_alloc_init((Class)SFDevice);
  v5 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000001"));
  objc_msgSend(v4, "setIdentifier:", v5);

  v6 = objc_alloc_init((Class)SFBLEDevice);
  objc_msgSend(v4, "setBleDevice:", v6);
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100061DE0;
  v9[3] = &unk_100714860;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(dispatchQueue, v9);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BOOL)preventRepair
{
  return self->_preventRepair;
}

- (unint64_t)problemFlags
{
  return self->_problemFlags;
}

- (void)setProblemFlags:(unint64_t)a3
{
  self->_problemFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_lastRenewalAttempt, 0);
  objc_storeStrong((id *)&self->_wifiHealthMonitor, 0);
  objc_storeStrong((id *)&self->_repairTimer, 0);
  objc_storeStrong((id *)&self->_repairSession, 0);
  objc_storeStrong((id *)&self->_repairService, 0);
  objc_storeStrong((id *)&self->_repairController, 0);
  objc_storeStrong((id *)&self->_manateeMonitor, 0);
  objc_storeStrong((id *)&self->_proximityController, 0);
  objc_storeStrong((id *)&self->_watchSetupScanner, 0);
  objc_storeStrong((id *)&self->_watchSetupDevices, 0);
  objc_storeStrong((id *)&self->_watchFastScanTimer, 0);
  objc_storeStrong((id *)&self->_vpnCnx, 0);
  objc_storeStrong((id *)&self->_unoteTVLatencySetup, 0);
  objc_storeStrong((id *)&self->_triggeredDevices, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong((id *)&self->_setupURL, 0);
  objc_storeStrong((id *)&self->_scanTimer, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong((id *)&self->_pinPairUUID, 0);
  objc_storeStrong((id *)&self->_pinPairSession, 0);
  objc_storeStrong((id *)&self->_pinPairService, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_storeStrong((id *)&self->_bleAuthTagFilter, 0);
}

@end
