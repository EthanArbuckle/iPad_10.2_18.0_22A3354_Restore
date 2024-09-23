@implementation RPCompanionLinkXPCConnection

- (BOOL)_entitledAndReturnError:(id *)a3
{
  BOOL result;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;

  if (self->_entitled)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.CompanionLink")));
  v7 = objc_msgSend(v6, "isEqual:", &__kCFBooleanTrue);

  if (v7)
  {
    result = 1;
    self->_entitled = 1;
  }
  else
  {
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection _entitledAndReturnError:]", 90, "### %#{pid} missing entitlement '%@'\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), CFSTR("com.apple.CompanionLink"));
    }
    if (a3)
    {
      v14 = RPErrorF(4294896128, (uint64_t)"Missing entitlement '%@'", v8, v9, v10, v11, v12, v13, (uint64_t)CFSTR("com.apple.CompanionLink"));
      v15 = (id)objc_claimAutoreleasedReturnValue(v14);
      result = 0;
      *a3 = v15;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)updateErrorFlags:(unint64_t)a3
{
  RPCompanionLinkClient *v5;
  void *v6;
  unint64_t v7;
  id v8;
  int v9;
  void *v10;
  RPCompanionLinkClient *v11;

  v5 = self->_client;
  if (v5)
  {
    v11 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
    v7 = (unint64_t)objc_msgSend(v6, "errorFlags") | a3;

    v8 = -[RPCompanionLinkClient errorFlags](v11, "errorFlags");
    v5 = v11;
    if (v8 != (id)v7)
    {
      if (dword_100130248 <= 20)
      {
        if (dword_100130248 != -1 || (v9 = _LogCategory_Initialize(&dword_100130248, 20), v5 = v11, v9))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection updateErrorFlags:]", 20, "Updating error flags to %#ll{flags} and notifying %@\n", v7, &unk_100109F8F, self->_appID);
          v5 = v11;
        }
      }
      -[RPCompanionLinkClient setErrorFlags:](v5, "setErrorFlags:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
      objc_msgSend(v10, "companionLinkUpdateErrorFlags:", a3);

      v5 = v11;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_storeStrong((id *)&self->_registeredRequests, 0);
  objc_storeStrong((id *)&self->_registeredProfileIDs, 0);
  objc_storeStrong((id *)&self->_registeredEvents, 0);
  objc_storeStrong((id *)&self->_personaUUID, 0);
  objc_storeStrong((id *)&self->_launchInstanceID, 0);
  objc_storeStrong((id *)&self->_discoveryTimer, 0);
  objc_storeStrong((id *)&self->_discoveryClient, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_daemonDevice, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_bonjourDevice, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_netCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (RPCompanionLinkXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4
{
  id v7;
  id v8;
  RPCompanionLinkXPCConnection *v9;
  RPCompanionLinkXPCConnection *v10;
  RPCompanionLinkXPCConnection *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RPCompanionLinkXPCConnection;
  v9 = -[RPCompanionLinkXPCConnection init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemon, a3);
    v10->_startTicks = mach_absolute_time();
    objc_storeStrong((id *)&v10->_xpcCnx, a4);
    v11 = v10;
  }

  return v10;
}

- (id)_devicesForClient:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSMutableDictionary *activeDevices;
  id v9;
  NSMutableDictionary *unauthDevices;
  NSMutableDictionary *bleDevices;
  id v12;
  NSMutableDictionary *nearbyInfoV2Devices;
  NSMutableDictionary *homeHubDevices;
  NSMutableDictionary *authenticatedAWDLPairingModeDevices;
  id v16;
  _QWORD v18[4];
  id v19;
  RPCompanionLinkXPCConnection *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  RPCompanionLinkXPCConnection *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  RPCompanionLinkXPCConnection *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  RPCompanionLinkXPCConnection *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  RPCompanionLinkXPCConnection *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  RPCompanionLinkXPCConnection *v40;
  id v41;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationDevice"));

  if (v6)
  {
    v7 = v5;
  }
  else
  {
    activeDevices = self->_daemon->_activeDevices;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10003BD68;
    v38[3] = &unk_100112258;
    v9 = v4;
    v39 = v9;
    v40 = self;
    v41 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activeDevices, "enumerateKeysAndObjectsUsingBlock:", v38);
    if ((objc_msgSend(v9, "flags") & 1) != 0)
    {
      unauthDevices = self->_daemon->_unauthDevices;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10003BDDC;
      v34[3] = &unk_100112258;
      v35 = v9;
      v36 = self;
      v37 = v5;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](unauthDevices, "enumerateKeysAndObjectsUsingBlock:", v34);

    }
    if (((unint64_t)objc_msgSend(v9, "controlFlags") & 0x2104000002) != 0)
    {
      bleDevices = self->_daemon->_bleDevices;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000077A8;
      v30[3] = &unk_100112258;
      v12 = v9;
      v31 = v12;
      v32 = self;
      v33 = v5;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](bleDevices, "enumerateKeysAndObjectsUsingBlock:", v30);
      nearbyInfoV2Devices = self->_daemon->_nearbyInfoV2Devices;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10003BE50;
      v26[3] = &unk_100112258;
      v27 = v12;
      v28 = self;
      v29 = v5;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](nearbyInfoV2Devices, "enumerateKeysAndObjectsUsingBlock:", v26);

    }
    if (((unint64_t)objc_msgSend(v9, "controlFlags") & 0x400000000) != 0
      && (objc_msgSend(v9, "flags") & 0x2000) != 0)
    {
      homeHubDevices = self->_daemon->_homeHubDevices;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10003BEC4;
      v22[3] = &unk_100112258;
      v23 = v9;
      v24 = self;
      v25 = v5;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](homeHubDevices, "enumerateKeysAndObjectsUsingBlock:", v22);

    }
    if (((unint64_t)objc_msgSend(v9, "controlFlags") & 0x1000000000000) != 0)
    {
      authenticatedAWDLPairingModeDevices = self->_daemon->_authenticatedAWDLPairingModeDevices;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10003BF38;
      v18[3] = &unk_100112258;
      v19 = v9;
      v20 = self;
      v21 = v5;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](authenticatedAWDLPairingModeDevices, "enumerateKeysAndObjectsUsingBlock:", v18);

    }
    v16 = v5;

  }
  return v5;
}

- (void)reportChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  RPCompanionLinkClient *client;
  void *v9;
  unsigned int v10;
  void *v11;
  NSMutableDictionary *devices;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;

  v4 = *(_QWORD *)&a4;
  v15 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
  if (v6 || (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "publicIdentifier"))) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v6));
    client = self->_client;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkXPCConnection launchInstanceID](self, "launchInstanceID"));
    LODWORD(client) = -[RPCompanionLinkClient shouldReportDevice:toXPCConnectionWithLaunchInstanceID:outReason:](client, "shouldReportDevice:toXPCConnectionWithLaunchInstanceID:outReason:", v15, v9, 0);

    if ((_DWORD)client)
    {
      v10 = -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
      if (v10 == getpid())
        objc_msgSend(v15, "setEncodeSensitiveProperties:", -[RPCompanionLinkClient encodeSensitiveProperties](self->_client, "encodeSensitiveProperties"));
      if (v7)
      {
        if ((_DWORD)v4 != 32)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", v15, v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
          objc_msgSend(v11, "companionLinkChangedDevice:changes:", v15, v4);
LABEL_15:

        }
      }
      else if (-[RPCompanionLinkXPCConnection _checkRSSIThresholdForDevice:](self, "_checkRSSIThresholdForDevice:", v15))
      {
        devices = self->_devices;
        if (!devices)
        {
          v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v14 = self->_devices;
          self->_devices = v13;

          devices = self->_devices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v15, v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
        objc_msgSend(v11, "companionLinkFoundDevice:", v15);
        goto LABEL_15;
      }
    }
    else if (v7)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", 0, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
      objc_msgSend(v11, "companionLinkLostDevice:", v15);
      goto LABEL_15;
    }

  }
}

- (void)companionLinkActivateClient:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  NSString *appID;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  RPCompanionLinkDaemon *daemon;
  void *v37;
  uint64_t v38;
  void *v39;
  BOOL v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  RPCompanionLinkDaemon *v48;
  id *v49;
  void *v50;
  unint64_t v51;
  void *v52;
  RPCompanionLinkDaemon *v53;
  id *v54;
  void *v55;
  RPCompanionLinkDaemon *v56;
  id *v57;
  void *v58;
  RPCompanionLinkDaemon *v59;
  id *v60;
  __CFString *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  RPCompanionLinkDaemon *v69;
  id *v70;
  id v71;
  uint64_t v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  uint64_t v77;
  void *v78;
  id v79;
  uint64_t v80;
  id v81;
  RPCompanionLinkDaemon *v82;
  id *v83;
  void *v84;
  void *v85;
  _BOOL4 v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  uint64_t v91;
  void *i;
  void *v93;
  void *v94;
  void *v95;
  unsigned int v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  __CFString *v101;
  uint64_t v102;
  void *v103;
  __CFString *v104;
  const char *v105;
  OS_os_transaction *v106;
  OS_os_transaction *osTransaction;
  void *v108;
  uint64_t v109;
  id v110;
  RPCompanionLinkDaemon *v111;
  id v112;
  uint64_t xpcID;
  void *v114;
  id v115;
  uint64_t v116;
  void *j;
  uint64_t v118;
  void *v119;
  id v120;
  _QWORD *v121;
  id v122;
  unint64_t v123;
  id v124;
  id v125;
  void *v126;
  __CFString *v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _QWORD v132[5];
  id v133;
  void *v134;
  id v135;
  void *v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id location;
  id obj;
  _QWORD v149[4];
  id v150;
  RPCompanionLinkXPCConnection *v151;
  id v152;
  uint64_t *v153;
  uint64_t v154;
  uint64_t *v155;
  uint64_t v156;
  uint64_t (*v157)(uint64_t, uint64_t);
  void (*v158)(uint64_t);
  id v159;
  _BYTE v160[128];
  _BYTE v161[128];

  v7 = a3;
  v8 = a4;
  v154 = 0;
  v155 = &v154;
  v156 = 0x3032000000;
  v157 = sub_10000F988;
  v158 = sub_10000F950;
  v159 = 0;
  v149[0] = _NSConcreteStackBlock;
  v149[1] = 3221225472;
  v149[2] = sub_10000F9F8;
  v149[3] = &unk_100112280;
  v153 = &v154;
  v125 = v7;
  v150 = v125;
  v151 = self;
  v122 = v8;
  v152 = v122;
  v121 = objc_retainBlock(v149);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v9 = (id *)(v155 + 5);
  obj = (id)v155[5];
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v9, obj);
  if (!v155[5])
  {
    if (!self->_client)
    {
      if (!self->_appID)
      {
        v16 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("application-identifier")));
        appID = self->_appID;
        self->_appID = v16;

      }
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        v120 = v125;
        -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
        LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection companionLinkActivateClient:completion:]", 30, "Activate: %@, from %#{pid}\n");
      }
      objc_msgSend(v125, "setDispatchQueue:", self->_dispatchQueue);
      objc_storeStrong((id *)&self->_client, a3);
      v123 = (unint64_t)objc_msgSend(v125, "controlFlags");
      if (sub_100017404())
      {
        v123 = v123 & 0xFFFFFDFFFF9DFEFFLL | 0x20000400000;
        if (dword_100130248 < 31
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          v120 = objc_msgSend(v125, "clientID");
          LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection companionLinkActivateClient:completion:]", 30, "Updated CID 0x%X control flags due to current supported virtualized transports: CF %#ll{flags}\n");
        }
      }
      location = 0;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "destinationDevice"));
      v124 = v18;
      if (!v18)
        goto LABEL_78;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
      if (v19)
      {
        v20 = v19;

      }
      else
      {
        v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "publicIdentifier"));

        if (!v20)
        {
          v79 = RPErrorF(4294960569, (uint64_t)"No destination device identifier", v21, v22, v23, v24, v25, v26, (uint64_t)v120);
          v80 = objc_claimAutoreleasedReturnValue(v79);
          v74 = (void *)v155[5];
          v155[5] = v80;
          goto LABEL_117;
        }
      }
      if ((objc_msgSend(v124, "statusFlags") & 0x10000000) != 0)
      {
        objc_msgSend(v125, "setControlFlags:", (unint64_t)objc_msgSend(v125, "controlFlags") | 0x400000000);
        objc_msgSend(v125, "setFlags:", objc_msgSend(v125, "flags") | 0x2000);
        v123 = (unint64_t)objc_msgSend(v125, "controlFlags");
      }
      v126 = v20;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon findConnectedDeviceForIdentifier:controlFlags:cnx:](self->_daemon, "findConnectedDeviceForIdentifier:controlFlags:cnx:", v20, v123, &location));
      if (v27)
        goto LABEL_60;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "idsDeviceIdentifier"));
      v29 = v28 == 0;

      if (v29)
      {
        v38 = 0;
      }
      else
      {
        daemon = self->_daemon;
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "idsDeviceIdentifier"));
        v38 = objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon findConnectedDeviceForIdentifier:controlFlags:cnx:](daemon, "findConnectedDeviceForIdentifier:controlFlags:cnx:", v37, v123, &location));

      }
      if ((v123 & 0x400000000) != 0 && !v38)
      {
        v81 = RPErrorF(4294960569, (uint64_t)"HomeHub device is not found %@", v30, v31, v32, v33, v34, v35, (uint64_t)v124);
        v72 = objc_claimAutoreleasedReturnValue(v81);
      }
      else
      {
        v27 = (void *)v38;
        if (v38)
        {
LABEL_60:
          v84 = v27;
          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "idsDeviceIdentifier"));
          v86 = v85 == 0;

          if (v86)
          {
            v87 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
            v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "idsDeviceArray"));

            v139 = 0u;
            v140 = 0u;
            v137 = 0u;
            v138 = 0u;
            v89 = v88;
            v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v137, v161, 16);
            if (v90)
            {
              v91 = *(_QWORD *)v138;
              do
              {
                for (i = 0; i != v90; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v138 != v91)
                    objc_enumerationMutation(v89);
                  v93 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * (_QWORD)i);
                  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "nsuuid"));
                  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "UUIDString"));
                  v96 = objc_msgSend(v95, "isEqualToString:", v126);

                  if (v96)
                  {
                    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "uniqueIDOverride"));
                    objc_msgSend(v84, "setIdsDeviceIdentifier:", v97);

                    if (dword_100130248 <= 30
                      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
                    {
                      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "idsDeviceIdentifier"));
                      LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection companionLinkActivateClient:completion:]", 30, "Found IDS identifier %@ for device %@", v98, v126);

                    }
                  }
                }
                v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v137, v161, 16);
              }
              while (v90);
            }

          }
          objc_storeStrong((id *)&self->_daemonDevice, v84);
          if (!self->_netCnx && (objc_msgSend(location, "controlFlags") & 0x200) != 0)
            objc_storeStrong((id *)&self->_netCnx, location);

LABEL_78:
          if ((v123 & 0x800000000) != 0)
            -[RPCompanionLinkDaemon _clientOnDemandAWDLDiscoveryStartForXPC:](self->_daemon, "_clientOnDemandAWDLDiscoveryStartForXPC:", self);
          if (!self->_osTransaction)
          {
            v136 = 0;
            v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "identifier"));
            v100 = v99;
            if (v99)
            {
              v101 = v99;
            }
            else
            {
              v102 = objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "publicIdentifier"));
              v103 = (void *)v102;
              v104 = CFSTR("Discovery");
              if (v102)
                v104 = (__CFString *)v102;
              v101 = v104;

            }
            ASPrintF(&v136, "com.apple.rapport.client-%#{pid}-%@", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), v101);
            if (v136)
              v105 = (const char *)v136;
            else
              v105 = "com.apple.rapport.client-?";
            v106 = (OS_os_transaction *)os_transaction_create(v105);
            osTransaction = self->_osTransaction;
            self->_osTransaction = v106;

            if (!self->_osTransaction
              && dword_100130248 <= 90
              && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
            {
              LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection companionLinkActivateClient:completion:]", 90, "### Create OS transaction failed: %s\n", (const char *)v136);
            }
            if (v136)
              free(v136);

          }
          if (!location)
            objc_storeStrong(&location, self->_netCnx);
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            v108 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection label](self->_netCnx, "label"));
            LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection companionLinkActivateClient:completion:]", 30, "Activating using connection %@\n", v108);

          }
          v109 = objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "serviceType"));
          v74 = (void *)v109;
          if (v109 && location)
          {
            v110 = objc_alloc_init((Class)RPSession);
            objc_msgSend(v110, "setCnx:", location);
            objc_msgSend(v110, "setServiceType:", v109);
            objc_msgSend(v110, "setStartTicks:", mach_absolute_time());
            objc_storeStrong((id *)&self->_session, v110);
            v111 = self->_daemon;
            v112 = location;
            xpcID = self->_xpcID;
            v132[0] = _NSConcreteStackBlock;
            v132[1] = 3221225472;
            v132[2] = sub_10003C228;
            v132[3] = &unk_1001122A8;
            v132[4] = self;
            v133 = v125;
            v134 = v74;
            v135 = v122;
            -[RPCompanionLinkDaemon sessionStartSend:session:xpcID:completion:](v111, "sessionStartSend:session:xpcID:completion:", v112, v110, xpcID, v132);

          }
          else
          {
            v114 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkXPCConnection _devicesForClient:](self, "_devicesForClient:", v125));
            if (v122)
              (*((void (**)(id, void *, uint64_t))v122 + 2))(v122, v114, v155[5]);
            v130 = 0u;
            v131 = 0u;
            v128 = 0u;
            v129 = 0u;
            v110 = v114;
            v115 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v128, v160, 16);
            if (v115)
            {
              v116 = *(_QWORD *)v129;
              do
              {
                for (j = 0; j != v115; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v129 != v116)
                    objc_enumerationMutation(v110);
                  v118 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * (_QWORD)j);
                  v127 = CFSTR("success");
                  -[RPCompanionLinkXPCConnection reportFoundDevice:outReason:](self, "reportFoundDevice:outReason:", v118, &v127);

                }
                v115 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v128, v160, 16);
              }
              while (v115);
            }

            v119 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
            -[RPCompanionLinkXPCConnection updateErrorFlags:](self, "updateErrorFlags:", objc_msgSend(v119, "errorFlags"));

          }
          -[RPCompanionLinkDaemon _updateForXPCClientChange](self->_daemon, "_updateForXPCClientChange");
          goto LABEL_117;
        }
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "ipAddress"));
        v40 = v39 == 0;

        if (!v40)
        {
          v47 = v124;
          v48 = self->_daemon;
          v49 = (id *)(v155 + 5);
          v146 = (id)v155[5];
          v50 = v47;
          -[RPCompanionLinkDaemon _clientConnectionStartOnDemand:xpcCnx:error:](v48, "_clientConnectionStartOnDemand:xpcCnx:error:");
          objc_storeStrong(v49, v146);
          goto LABEL_59;
        }
        v51 = v123;
        if ((v123 & 0x10000000) == 0)
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkXPCConnection _findMatchingDevice:inDeviceDictionary:](self, "_findMatchingDevice:inDeviceDictionary:", v124, self->_daemon->_bleDevices));
          if (v52
            || (v52 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkXPCConnection _findMatchingDevice:inDeviceDictionary:](self, "_findMatchingDevice:inDeviceDictionary:", v124, self->_daemon->_nearbyInfoV2Devices))) != 0)
          {
            v50 = v52;
            objc_storeStrong((id *)&self->_daemonDevice, v52);
            v53 = self->_daemon;
            v54 = (id *)(v155 + 5);
            v145 = (id)v155[5];
            -[RPCompanionLinkDaemon _clientConnectionStartOnDemand:xpcCnx:error:](v53, "_clientConnectionStartOnDemand:xpcCnx:error:", v50, self, &v145);
            objc_storeStrong(v54, v145);
            goto LABEL_59;
          }
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon findUnauthDeviceForIdentifier:](self->_daemon, "findUnauthDeviceForIdentifier:", v126));
          v50 = v55;
          v51 = v123;
          if (v55)
          {
            objc_storeStrong((id *)&self->_daemonDevice, v55);
            v56 = self->_daemon;
            v57 = (id *)(v155 + 5);
            v144 = (id)v155[5];
            -[RPCompanionLinkDaemon _clientConnectionStartUnauth:client:publicID:xpcCnx:error:](v56, "_clientConnectionStartUnauth:client:publicID:xpcCnx:error:", v50, v125, v126, self, &v144);
            objc_storeStrong(v57, v144);
            goto LABEL_59;
          }
        }
        if ((v51 & 0x1000010000000) == 0x1000000000000)
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon findAuthAWDLPairingModeDeviceForIdentifier:](self->_daemon, "findAuthAWDLPairingModeDeviceForIdentifier:", v126));
          v50 = v58;
          if (v58)
          {
            objc_msgSend(v58, "setIdentifier:", v126);
            objc_storeStrong((id *)&self->_daemonDevice, v50);
            v59 = self->_daemon;
            v60 = (id *)(v155 + 5);
            v143 = (id)v155[5];
            -[RPCompanionLinkDaemon _clientConnectionStartOnDemand:xpcCnx:error:](v59, "_clientConnectionStartOnDemand:xpcCnx:error:", v50, self, &v143);
            objc_storeStrong(v60, v143);
            goto LABEL_59;
          }
        }
        if ((v123 & 0x10800000) != 0)
        {
          v61 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "cloudServiceID"));
          if (v61)
            goto LABEL_43;
          if ((-[NSString isEqual:](self->_appID, "isEqual:", CFSTR("com.apple.coreduetd")) & 1) != 0
            || -[NSString isEqual:](self->_appID, "isEqual:", CFSTR("com.apple.knowledge-agent")))
          {
            v61 = CFSTR("com.apple.private.alloy.coreduet.sync");
            objc_msgSend(v125, "setCloudServiceID:", v61);
LABEL_43:
            v68 = v124;
            objc_msgSend(v68, "setStatusFlags:", (unint64_t)objc_msgSend(v68, "statusFlags") | 0x100000);
            objc_storeStrong((id *)&self->_daemonDevice, v124);
            objc_msgSend(v125, "setControlFlags:", (unint64_t)objc_msgSend(v125, "controlFlags") | 0x10000000);
            v69 = self->_daemon;
            v70 = (id *)(v155 + 5);
            v142 = (id)v155[5];
            -[RPCompanionLinkDaemon _clientConnectionStartOnDemand:xpcCnx:error:](v69, "_clientConnectionStartOnDemand:xpcCnx:error:", v68, self, &v142);
            objc_storeStrong(v70, v142);
            LOBYTE(v70) = v155[5] == 0;

            v27 = v68;
            if ((v70 & 1) != 0)
              goto LABEL_60;
            goto LABEL_52;
          }
          v75 = RPErrorF(4294960591, (uint64_t)"No cloudServiceID", v62, v63, v64, v65, v66, v67, (uint64_t)v120);
          v72 = objc_claimAutoreleasedReturnValue(v75);
        }
        else
        {
          if ((~(_DWORD)v123 & 0x220000) == 0)
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon findConnectedDeviceForIdentifier:controlFlags:cnx:](self->_daemon, "findConnectedDeviceForIdentifier:controlFlags:cnx:", v126, v123 & 0xFFFFFFFFFFDFFFFFLL, 0));
            if (v50)
            {
              if (dword_100130248 <= 30
                && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
              {
                LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection companionLinkActivateClient:completion:]", 30, "Found WiFi device destination for ForceAWDL client: %@\n", v124);
              }
              objc_storeStrong((id *)&self->_daemonDevice, v124);
              v82 = self->_daemon;
              v83 = (id *)(v155 + 5);
              v141 = (id)v155[5];
              -[RPCompanionLinkDaemon _clientConnectionStartOnDemand:xpcCnx:error:](v82, "_clientConnectionStartOnDemand:xpcCnx:error:", v124, self, &v141);
              objc_storeStrong(v83, v141);
LABEL_59:
              v27 = v50;
              if (!v155[5])
                goto LABEL_60;
              goto LABEL_52;
            }
          }
          v71 = RPErrorF(4294960569, (uint64_t)"Destination device not found: %@", v41, v42, v43, v44, v45, v46, (uint64_t)v124);
          v72 = objc_claimAutoreleasedReturnValue(v71);
        }
      }
      v73 = (void *)v155[5];
      v155[5] = v72;

      v27 = 0;
LABEL_52:

      v74 = v126;
LABEL_117:

      goto LABEL_118;
    }
    v76 = RPErrorF(4294960575, (uint64_t)"Client already activated", v10, v11, v12, v13, v14, v15, (uint64_t)v120);
    v77 = objc_claimAutoreleasedReturnValue(v76);
    v78 = (void *)v155[5];
    v155[5] = v77;

  }
LABEL_118:
  ((void (*)(_QWORD *))v121[2])(v121);

  _Block_object_dispose(&v154, 8);
}

- (RPCompanionLinkClient)client
{
  return self->_client;
}

- (BOOL)_checkRSSIThresholdForDevice:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  BOOL v10;

  v4 = a3;
  if (-[RPCompanionLinkClient rssiThreshold](self->_client, "rssiThreshold"))
    v5 = (uint64_t)-[RPCompanionLinkClient rssiThreshold](self->_client, "rssiThreshold");
  else
    v5 = -60;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bleDevice"));
  v8 = objc_msgSend(v7, "rssi");

  if (v8)
    v9 = (uint64_t)v8 < v5;
  else
    v9 = 0;
  v10 = !v9;

  return v10;
}

- (void)reportLostDevice:(id)a3
{
  void *v4;
  void *v5;
  RPCompanionLinkClient *client;
  void *v7;
  NSMutableDictionary *devices;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  if (v4 || (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "publicIdentifier"))) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4));

    if (v5)
    {
      client = self->_client;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkXPCConnection launchInstanceID](self, "launchInstanceID"));
      LODWORD(client) = -[RPCompanionLinkClient shouldReportDevice:toXPCConnectionWithLaunchInstanceID:outReason:](client, "shouldReportDevice:toXPCConnectionWithLaunchInstanceID:outReason:", v10, v7, 0);

      devices = self->_devices;
      if ((_DWORD)client)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v10, v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
        objc_msgSend(v9, "companionLinkChangedDevice:changes:", v10, 2);
      }
      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", 0, v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
        objc_msgSend(v9, "companionLinkLostDevice:", v10);
      }

    }
  }

}

- (BOOL)reportFoundDevice:(id)a3 outReason:(id *)a4
{
  id v6;
  RPCompanionLinkClient *client;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *devices;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  BOOL v17;
  __CFString *v18;

  v6 = a3;
  client = self->_client;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkXPCConnection launchInstanceID](self, "launchInstanceID"));
  LOBYTE(client) = -[RPCompanionLinkClient shouldReportDevice:toXPCConnectionWithLaunchInstanceID:outReason:](client, "shouldReportDevice:toXPCConnectionWithLaunchInstanceID:outReason:", v6, v8, a4);

  if ((client & 1) == 0)
  {
    v17 = 0;
    if (!a4 || self->_client)
      goto LABEL_22;
    v17 = 0;
    v18 = CFSTR("nilClientCnx");
    goto LABEL_16;
  }
  if (!-[RPCompanionLinkXPCConnection _checkRSSIThresholdForDevice:](self, "_checkRSSIThresholdForDevice:", v6))
  {
    if (!a4)
      goto LABEL_21;
    v17 = 0;
    v18 = CFSTR("RSSI.tooLow");
LABEL_16:
    *a4 = v18;
    goto LABEL_22;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  if (!v9)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publicIdentifier"));
    if (!v9)
    {
      if (a4)
      {
        v17 = 0;
        v18 = CFSTR("missingDeviceIdentifier");
        goto LABEL_16;
      }
LABEL_21:
      v17 = 0;
      goto LABEL_22;
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v9));

  devices = self->_devices;
  if (!devices)
  {
    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v13 = self->_devices;
    self->_devices = v12;

    devices = self->_devices;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v6, v9);
  v14 = -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
  if (v14 == getpid())
    objc_msgSend(v6, "setEncodeSensitiveProperties:", -[RPCompanionLinkClient encodeSensitiveProperties](self->_client, "encodeSensitiveProperties"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  v16 = v15;
  if (v10)
    objc_msgSend(v15, "companionLinkChangedDevice:changes:", v6, 2);
  else
    objc_msgSend(v15, "companionLinkFoundDevice:", v6);

  v17 = 1;
LABEL_22:

  return v17;
}

- (NSUUID)launchInstanceID
{
  return self->_launchInstanceID;
}

- (RPSession)session
{
  return self->_session;
}

- (RPConnection)netCnx
{
  return self->_netCnx;
}

- (BOOL)localDeviceUpdated
{
  return self->_localDeviceUpdated;
}

- (BOOL)needsCLink
{
  return self->_needsCLink;
}

- (BOOL)needsNearbyActionV2
{
  return self->_needsNearbyActionV2;
}

- (void)connectionInvalidatedCore
{
  RPConnection *netCnx;
  RPCompanionLinkClient *client;
  RPDiscovery *discoveryClient;
  int v6;
  RPDiscovery *v7;
  RPServer *server;
  RPServer *v9;
  void *v10;
  void *v11;
  RPServer *v12;
  RPSession *session;
  RPSession *v14;
  RPSession *v15;
  OS_dispatch_source *discoveryTimer;
  NSObject *v17;
  OS_dispatch_source *v18;
  RPConnection *v19;
  NSMutableDictionary *registeredEvents;
  NSMutableSet *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  uint64_t v26;
  OS_os_transaction *osTransaction;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  _BYTE v33[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100130248 <= 20 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 20)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection connectionInvalidatedCore]", 20, "XPC connection invalidated from %#{pid}\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  if (self->_client)
  {
    -[RPCompanionLinkXPCConnection _invalidateConnectionInList:listDescription:](self, "_invalidateConnectionInList:listDescription:", self->_daemon->_tcpClientConnections, CFSTR("tcp client connections"));
    -[RPCompanionLinkXPCConnection _invalidateConnectionInList:listDescription:](self, "_invalidateConnectionInList:listDescription:", self->_daemon->_tcpOnDemandClientConnections, CFSTR("tcp on-demand client connections"));
    -[RPCompanionLinkXPCConnection _invalidateConnectionInList:listDescription:](self, "_invalidateConnectionInList:listDescription:", self->_daemon->_bleClientConnections, CFSTR("ble client connections"));
    netCnx = self->_netCnx;
    self->_netCnx = 0;

    -[RPCompanionLinkClient invalidate](self->_client, "invalidate");
    client = self->_client;
    self->_client = 0;

  }
  discoveryClient = self->_discoveryClient;
  if (discoveryClient)
  {
    if (dword_100130248 <= 30)
    {
      if (dword_100130248 != -1
        || (v6 = _LogCategory_Initialize(&dword_100130248, 30), discoveryClient = self->_discoveryClient, v6))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection connectionInvalidatedCore]", 30, "Invalidate: %@, from %#{pid}\n", discoveryClient, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
        discoveryClient = self->_discoveryClient;
      }
    }
    -[RPDiscovery invalidate](discoveryClient, "invalidate");
    v7 = self->_discoveryClient;
    self->_discoveryClient = 0;

  }
  server = self->_server;
  if (server)
  {
    v9 = server;
    -[RPServer invalidate](v9, "invalidate");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon activeServers](self->_daemon, "activeServers"));
    objc_msgSend(v10, "removeObject:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon localDeviceInfo](self->_daemon, "localDeviceInfo"));
    objc_msgSend(v11, "setServersChangedState:", 6);

    v12 = self->_server;
    self->_server = 0;

    -[RPCompanionLinkDaemon _updateForXPCServerChange](self->_daemon, "_updateForXPCServerChange");
  }
  session = self->_session;
  if (session)
  {
    v14 = session;
    -[RPSession invalidate](v14, "invalidate");
    v15 = self->_session;
    self->_session = 0;

  }
  discoveryTimer = self->_discoveryTimer;
  if (discoveryTimer)
  {
    v17 = discoveryTimer;
    dispatch_source_cancel(v17);
    v18 = self->_discoveryTimer;
    self->_discoveryTimer = 0;

  }
  *(_WORD *)&self->_needsCLink = 0;
  if (-[RPConnection clientMode](self->_netCnx, "clientMode"))
    -[RPConnection invalidate](self->_netCnx, "invalidate");
  v19 = self->_netCnx;
  self->_netCnx = 0;

  registeredEvents = self->_registeredEvents;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10003BB28;
  v32[3] = &unk_100112210;
  v32[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](registeredEvents, "enumerateKeysAndObjectsUsingBlock:", v32);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = self->_registeredProfileIDs;
  v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection connectionInvalidatedCore]", 30, "Deregister profileID on XPC disconnect: '%@'\n", v26);
        }
        -[NSMutableSet removeObject:](self->_daemon->_registeredProfileIDs, "removeObject:", v26);
      }
      v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v23);
  }

  -[NSMutableDictionary removeAllObjects](self->_devices, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_registeredProfileIDs, "removeAllObjects");
  osTransaction = self->_osTransaction;
  self->_osTransaction = 0;

  if (self->_isContextCollector)
    -[RPCompanionLinkXPCConnection companionLinkRemoveLocalDeviceAsContextCollector:](self, "companionLinkRemoveLocalDeviceAsContextCollector:", &stru_100112230);
}

- (void)_invalidateConnectionInList:(id)a3 listDescription:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon dispatchQueue](self->_daemon, "dispatchQueue"));
  dispatch_assert_queue_V2(v8);

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10000F988;
  v14 = sub_10000F950;
  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003BA64;
  v9[3] = &unk_1001121E8;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);
  if (objc_msgSend((id)v11[5], "count"))
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection _invalidateConnectionInList:listDescription:]", 30, "Removing connection from %@ with unique ID: %@", v7, v11[5]);
    }
    objc_msgSend(v6, "removeObjectsForKeys:", v11[5]);
  }
  _Block_object_dispose(&v10, 8);

}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcID:(unsigned int)a3
{
  self->_xpcID = a3;
}

- (void)setLocalDeviceUpdated:(BOOL)a3
{
  self->_localDeviceUpdated = a3;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void)connectionInvalidated
{
  RPSession *v3;
  RPSession *v4;
  RPCompanionLinkDaemon *daemon;
  void *v6;
  uint64_t xpcID;
  _QWORD v8[6];

  v3 = self->_session;
  if (v3)
  {
    v4 = v3;
    daemon = self->_daemon;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession cnx](v3, "cnx"));
    xpcID = self->_xpcID;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003B8BC;
    v8[3] = &unk_1001121C0;
    v8[4] = v4;
    v8[5] = self;
    -[RPCompanionLinkDaemon sessionStopSend:session:xpcID:completion:](daemon, "sessionStopSend:session:xpcID:completion:", v6, v4, xpcID, v8);

  }
  else
  {
    -[RPCompanionLinkXPCConnection connectionInvalidatedCore](self, "connectionInvalidatedCore");
  }
}

- (id)description
{
  return -[RPCompanionLinkXPCConnection descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  void *v3;
  id v5;
  RPCompanionLinkClient *v6;
  unsigned int v7;
  id v8;
  RPServer *server;
  RPServer *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
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

  v56 = 0;
  NSAppendPrintF(&v56, "    %#{pid}", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier", *(_QWORD *)&a3));
  v5 = v56;
  v6 = self->_client;
  v7 = -[RPCompanionLinkClient clientID](v6, "clientID");
  if (v7)
  {
    v55 = v5;
    NSAppendPrintF(&v55, ", CID 0x%X", v7);
    v8 = v55;

    v5 = v8;
  }
  server = self->_server;
  if (server)
  {
    v54 = v5;
    v10 = server;
    NSAppendPrintF(&v54, ", %@", v10);
    v11 = v54;

    v5 = v11;
  }
  v12 = -[NSMutableDictionary count](self->_registeredEvents, "count");
  if (v12)
  {
    v53 = v5;
    NSAppendPrintF(&v53, ", %d event(s)", (_DWORD)v12);
    v13 = v53;

    v5 = v13;
  }
  v14 = -[NSMutableDictionary count](self->_registeredRequests, "count");
  if (v14)
  {
    v52 = v5;
    NSAppendPrintF(&v52, ", %d request(s)", (_DWORD)v14);
    v15 = v52;

    v5 = v15;
  }
  v16 = -[NSMutableSet count](self->_registeredProfileIDs, "count");
  if (v16)
  {
    v51 = v5;
    NSAppendPrintF(&v51, ", %d profile(s)", (_DWORD)v16);
    v17 = v51;

    v5 = v17;
  }
  v18 = -[RPCompanionLinkClient controlFlags](v6, "controlFlags");
  if (v18)
  {
    v50 = v5;
    NSAppendPrintF(&v50, ", CF %ll{flags}", v18, &unk_100109B96);
    v19 = v50;

    v5 = v19;
  }
  if ((-[RPCompanionLinkClient flags](v6, "flags") & 1) != 0)
  {
    v49 = v5;
    NSAppendPrintF(&v49, ", Unauth");
    v20 = v49;

    v5 = v20;
  }
  if (self->_needsCLink)
  {
    v48 = v5;
    NSAppendPrintF(&v48, ", nCL");
    v21 = v48;

    v5 = v21;
  }
  if (self->_needsNearbyActionV2)
  {
    v47 = v5;
    NSAppendPrintF(&v47, ", nAV2");
    v22 = v47;

    v5 = v22;
  }
  v23 = objc_claimAutoreleasedReturnValue(-[RPConnection label](self->_netCnx, "label"));
  v24 = (void *)v23;
  if (v23)
  {
    v46 = v5;
    NSAppendPrintF(&v46, ", %@", v23);
    v25 = v46;

    v5 = v25;
  }

  if ((-[RPCompanionLinkClient flags](v6, "flags") & 0x2000) != 0)
  {
    v45 = v5;
    NSAppendPrintF(&v45, ", HHDevice");
    v26 = v45;

    v5 = v26;
  }
  if ((-[RPCompanionLinkClient flags](v6, "flags") & 0x4000) != 0)
  {
    v44 = v5;
    NSAppendPrintF(&v44, ", NoAPChecks");
    v27 = v44;

    v5 = v27;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient destinationDevice](v6, "destinationDevice"));
  v29 = v28;
  if (v28)
  {
    v43 = v5;
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "idsDeviceIdentifier"));
    v31 = (void *)v30;
    if (v30)
    {
      v32 = 0;
      v33 = (void *)v30;
    }
    else
    {
      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identifier"));
      v3 = (void *)v34;
      if (v34)
      {
        v32 = 0;
        v33 = (void *)v34;
      }
      else
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "publicIdentifier"));
        v32 = 1;
      }
    }
    NSAppendPrintF(&v43, ", device %@", v33);
    v35 = v43;

    if (v32)
    if (!v31)

    v5 = v35;
  }

  v36 = mach_absolute_time();
  v42 = v5;
  v37 = UpTicksToSeconds(v36 - self->_startTicks);
  NSAppendPrintF(&v42, ", %ll{dur}", v37);
  v38 = v42;

  v41 = v38;
  NSAppendPrintF(&v41, "\n");
  v39 = v41;

  return v39;
}

- (BOOL)_connectionHasActiveSessions:(id)a3
{
  RPConnection *v4;
  uint64_t v5;
  RPCompanionLinkClient *v6;
  RPCompanionLinkClient *client;
  void *v8;

  v4 = (RPConnection *)a3;
  v5 = -[RPCompanionLinkDaemon _sessionsActiveOnConnection:xpcConnection:](self->_daemon, "_sessionsActiveOnConnection:xpcConnection:", v4, self);
  if (v5 >= 1)
  {
    v6 = (RPCompanionLinkClient *)objc_claimAutoreleasedReturnValue(-[RPConnection client](v4, "client"));
    client = self->_client;

    if (v6 == client)
    {
      if (dword_100130248 <= 40
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection label](v4, "label"));
        LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection _connectionHasActiveSessions:]", 40, "Connection %@ has %llu active sessions in progress, skip invalidating", v8, v5);

      }
      -[RPConnection setClient:](v4, "setClient:", 0);
      if (self->_netCnx == v4)
      {
        self->_netCnx = 0;

      }
    }
  }

  return v5 > 0;
}

- (void)authCompletion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection authCompletion:]", 30, "Client auth completion: %{error}\n", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  objc_msgSend(v4, "companionLinkAuthCompleted:", v5);

}

- (void)handleDisconnect
{
  id v3;

  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection handleDisconnect]", 30, "Client disconnect handler");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  objc_msgSend(v3, "companionLinkHandleDisconnect");

}

- (void)promptForPasswordType:(int)a3 flags:(unsigned int)a4 throttleSeconds:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v9;
  id v10;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    if (v7 > 0xB)
      v9 = "?";
    else
      v9 = off_1001124B8[(int)v7];
    LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection promptForPasswordType:flags:throttleSeconds:]", 30, "Client prompt for password with type %s, flags %#{flags}, throttle seconds %d\n", v9, v6, &unk_100109E1B, v5);
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  objc_msgSend(v10, "companionLinkPromptForPasswordType:flags:throttleSeconds:", v7, v6, v5);

}

- (void)receivedEventID:(id)a3 event:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RPMetrics sharedMetrics](RPMetrics, "sharedMetrics"));
  objc_msgSend(v11, "logReceivedMessageType:identifier:options:appID:ctx:", 1, v10, v8, self->_appID, &self->_metricsCtx);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  objc_msgSend(v12, "companionLinkReceivedEventID:event:options:", v10, v9, v8);

}

- (void)receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[RPMetrics sharedMetrics](RPMetrics, "sharedMetrics"));
  objc_msgSend(v14, "logReceivedMessageType:identifier:options:appID:ctx:", 2, v13, v11, self->_appID, &self->_metricsCtx);

  v15 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  objc_msgSend(v15, "companionLinkReceivedRequestID:request:options:responseHandler:", v13, v12, v11, v10);

}

- (void)companionLinkActivateAssertion:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)companionLinkUpdateClient:(id)a3
{
  unsigned int v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  RPCompanionLinkDaemon *daemon;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  const __CFString *v26;
  id v27;
  void *v28;
  id v29;

  v29 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", 0);
  v5 = v29;
  if (v4)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection companionLinkUpdateClient:]", 30, "Update client from %#{pid}\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }
    v6 = -[RPCompanionLinkClient controlFlags](self->_client, "controlFlags");
    v7 = objc_msgSend(v29, "controlFlags");
    if (v7 != v6)
      -[RPCompanionLinkClient setControlFlags:](self->_client, "setControlFlags:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient serviceType](self->_client, "serviceType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "serviceType"));
    v10 = v8;
    v11 = v9;
    v12 = v11;
    if (v10 == v11)
    {

    }
    else
    {
      if ((v10 == 0) != (v11 != 0))
      {
        v13 = objc_msgSend(v10, "isEqual:", v11);

        if ((v13 & 1) != 0)
          goto LABEL_15;
      }
      else
      {

      }
      -[RPCompanionLinkClient setServiceType:](self->_client, "setServiceType:", v12);
    }
LABEL_15:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon localDeviceInfo](self->_daemon, "localDeviceInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkXPCConnection launchInstanceID](self, "launchInstanceID"));

    if (v15)
    {
      daemon = self->_daemon;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkXPCConnection launchInstanceID](self, "launchInstanceID"));
      v18 = objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon homeHubDeviceForLaunchInstanceID:](daemon, "homeHubDeviceForLaunchInstanceID:", v17));

      v14 = (void *)v18;
      if (!v18)
      {
        if (dword_100130248 > 90
          || dword_100130248 == -1 && !_LogCategory_Initialize(&dword_100130248, 90))
        {
          goto LABEL_42;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkXPCConnection launchInstanceID](self, "launchInstanceID"));
        LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection companionLinkUpdateClient:]", 90, "### Unable to find local HomeHub device for launch instance %@, failed to update the client\n", v14);
LABEL_41:

LABEL_42:
        v5 = v29;
        goto LABEL_43;
      }
    }
    v27 = v6;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "siriInfo"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "siriInfo"));
    v20 = v19;
    if (v19)
    {
      v21 = v19;
      v22 = v28;
      v23 = v22;
      if (v21 == v22)
      {

      }
      else
      {
        if (v22)
        {
          v24 = objc_msgSend(v21, "isEqual:", v22);

          if ((v24 & 1) != 0)
            goto LABEL_38;
        }
        else
        {

        }
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection companionLinkUpdateClient:]", 30, "Siri info changed: %d items -> %d items\n", objc_msgSend(v23, "count"), objc_msgSend(v21, "count"));
        }
        objc_msgSend(v14, "setSiriInfo:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v21, CFSTR("_siriInfo"));
        if (v15)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, CFSTR("_i"));

          v26 = CFSTR("_proxyUpdate");
        }
        else
        {
          v26 = CFSTR("_systemInfoUpdate");
        }
        -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:](self->_daemon, "sendEventID:event:destinationID:options:completion:", v26, v23, CFSTR("rapport:rdid:SameHome"), 0, 0);
      }

    }
LABEL_38:
    if (v7 != v27)
      -[RPCompanionLinkDaemon _updateForXPCClientChange](self->_daemon, "_updateForXPCClientChange");

    goto LABEL_41;
  }
LABEL_43:

}

- (void)companionLinkTriggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, id);
  unsigned __int8 v10;
  id v11;
  RPCompanionLinkDaemon *daemon;
  id v13;
  id v14;
  id v15;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void (**)(id, id))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v15 = 0;
  v10 = -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v15);
  v11 = v15;
  if ((v10 & 1) != 0)
  {
    daemon = self->_daemon;
    v14 = v11;
    -[RPCompanionLinkDaemon triggerEnhancedDiscoveryForReason:useCase:error:](daemon, "triggerEnhancedDiscoveryForReason:useCase:error:", v8, v6, &v14);
    v13 = v14;

    v11 = v13;
  }
  if (v9)
    v9[2](v9, v11);

}

- (void)companionLinkCreateDeviceToEndpointMappingForDeviceID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id, id);
  unsigned __int8 v8;
  id v9;
  RPCompanionLinkDaemon *daemon;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = (void (**)(id, id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v15 = 0;
  v8 = -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v15);
  v9 = v15;
  if ((v8 & 1) != 0)
  {
    daemon = self->_daemon;
    v13 = v9;
    v14 = 0;
    -[RPCompanionLinkDaemon createDeviceToEndpointMappingForDeviceID:endpointUUID:error:](daemon, "createDeviceToEndpointMappingForDeviceID:endpointUUID:error:", v6, &v14, &v13);
    v11 = v14;
    v12 = v13;

    if (v7)
      v7[2](v7, v11, v12);

  }
  else
  {
    if (v7)
      v7[2](v7, 0, v9);
    v12 = v9;
  }

}

- (void)companionLinkRegisterEventID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableDictionary *registeredEvents;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v27 = 0;
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v27);
  v11 = v27;
  if (v11)
  {
    v12 = v11;
LABEL_3:
    if (v10)
      v10[2](v10, v12);
    goto LABEL_17;
  }
  if (CFDictionaryGetInt64(v9, CFSTR("interest"), 0))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice identifier](self->_daemonDevice, "identifier"));
    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient destinationDevice](self->_client, "destinationDevice"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));

      if (!v13)
      {
        v25 = RPErrorF(4294960588, (uint64_t)"Interest with no peer identifier", v15, v16, v17, v18, v19, v20, v26);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v25);
        if (dword_100130248 <= 90
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection companionLinkRegisterEventID:options:completion:]", 90, "### Register interest event failed: '%@', %{error}\n", v8, v12);
        }
        goto LABEL_3;
      }
    }
    -[RPCompanionLinkDaemon interestRegisterEventID:peerIdentifier:owner:](self->_daemon, "interestRegisterEventID:peerIdentifier:owner:", v8, v13, self);

  }
  registeredEvents = self->_registeredEvents;
  if (!registeredEvents)
  {
    v22 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v23 = self->_registeredEvents;
    self->_registeredEvents = v22;

    registeredEvents = self->_registeredEvents;
  }
  if (v9)
    v24 = v9;
  else
    v24 = &__NSDictionary0__struct;
  -[NSMutableDictionary setObject:forKeyedSubscript:](registeredEvents, "setObject:forKeyedSubscript:", v24, v8);
  if (v10)
    v10[2](v10, 0);
  v12 = 0;
LABEL_17:

}

- (void)companionLinkDeregisterEventID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v11 = 0;
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v11);
  v8 = v11;
  if (v8)
  {
    if (v7)
      v7[2](v7, v8);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice identifier](self->_daemonDevice, "identifier"));
    if (v9
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient destinationDevice](self->_client, "destinationDevice")),
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier")),
          v10,
          v9))
    {
      -[RPCompanionLinkDaemon interestDeregisterEventID:peerIdentifier:owner:](self->_daemon, "interestDeregisterEventID:peerIdentifier:owner:", v6, v9, self);

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredEvents, "setObject:forKeyedSubscript:", 0, v6);
    if (v7)
      v7[2](v7, 0);
  }

}

- (void)companionLinkSendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, id);
  id v17;
  RPConnection *v18;
  RPConnection *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, id))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v31 = 0;
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v31);
  v17 = v31;
  if (!v17)
  {
    if (!objc_msgSend(v14, "isEqual:", CFSTR("rapport:rdid:DirectPeer")))
    {
LABEL_8:
      -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:](self->_daemon, "sendEventID:event:destinationID:options:completion:", v12, v13, v14, v15, v16);
      goto LABEL_9;
    }
    v18 = self->_netCnx;
    if (v18)
    {
      v19 = v18;
      -[RPConnection sendEncryptedEventID:event:options:completion:](v18, "sendEncryptedEventID:event:options:completion:", v12, v13, v15, v16);

LABEL_9:
      v28 = 0;
      goto LABEL_10;
    }
    v20 = objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice identifier](self->_daemonDevice, "identifier"));
    if (v20
      || (v21 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient destinationDevice](self->_client, "destinationDevice")),
          v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier")),
          v21,
          v20))
    {

      v14 = (id)v20;
      goto LABEL_8;
    }
    v29 = RPErrorF(4294960591, (uint64_t)"DirectPeer with no destination device", v22, v23, v24, v25, v26, v27, v30);
    v17 = (id)objc_claimAutoreleasedReturnValue(v29);
  }
  v28 = v17;
  if (v16 && v17)
    v16[2](v16, v17);
LABEL_10:

}

- (void)companionLinkRegisterProfileID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSMutableSet *registeredProfileIDs;
  NSMutableSet *v18;
  NSMutableSet *v19;
  NSMutableSet *v20;
  NSMutableSet *v21;
  RPCompanionLinkDaemon *daemon;
  NSMutableSet *v23;
  uint64_t v24;
  id v25;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v25 = 0;
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v25);
  v8 = v25;
  if (v8)
  {
    v9 = v8;
LABEL_3:
    if (v7)
      v7[2](v7, v9);
    goto LABEL_5;
  }
  if ((-[NSMutableSet containsObject:](self->_registeredProfileIDs, "containsObject:", v6) & 1) != 0
    || -[NSMutableSet containsObject:](self->_daemon->_registeredProfileIDs, "containsObject:", v6))
  {
    v16 = RPErrorF(4294960566, (uint64_t)"Profile already registered", v10, v11, v12, v13, v14, v15, v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection companionLinkRegisterProfileID:completion:]", 90, "### Register profileID failed: '%@', %{error}\n", v6, v9);
    }
    goto LABEL_3;
  }
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection companionLinkRegisterProfileID:completion:]", 30, "Register profileID '%@'\n", v6);
  registeredProfileIDs = self->_registeredProfileIDs;
  if (!registeredProfileIDs)
  {
    v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v19 = self->_registeredProfileIDs;
    self->_registeredProfileIDs = v18;

    registeredProfileIDs = self->_registeredProfileIDs;
  }
  -[NSMutableSet addObject:](registeredProfileIDs, "addObject:", v6);
  v20 = self->_daemon->_registeredProfileIDs;
  if (!v20)
  {
    v21 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    daemon = self->_daemon;
    v23 = daemon->_registeredProfileIDs;
    daemon->_registeredProfileIDs = v21;

    v20 = self->_daemon->_registeredProfileIDs;
  }
  -[NSMutableSet addObject:](v20, "addObject:", v6);
  if (v7)
    v7[2](v7, 0);
  -[RPCompanionLinkDaemon _update](self->_daemon, "_update");
  v9 = 0;
LABEL_5:

}

- (void)companionLinkDeregisterProfileID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  id v8;
  id v9;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v9 = 0;
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v9);
  v8 = v9;
  if (v8)
  {
    if (v7)
      v7[2](v7, v8);
  }
  else
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection companionLinkDeregisterProfileID:completion:]", 30, "Deregister profileID '%@'\n", v6);
    }
    -[NSMutableSet removeObject:](self->_registeredProfileIDs, "removeObject:", v6);
    -[NSMutableSet removeObject:](self->_daemon->_registeredProfileIDs, "removeObject:", v6);
    if (v7)
      v7[2](v7, 0);
    -[RPCompanionLinkDaemon _update](self->_daemon, "_update");
  }

}

- (void)companionLinkRegisterRequestID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  id v11;
  NSMutableDictionary *registeredRequests;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v16 = 0;
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v16);
  v11 = v16;
  if (!v11)
  {
    registeredRequests = self->_registeredRequests;
    if (!registeredRequests)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v14 = self->_registeredRequests;
      self->_registeredRequests = v13;

      registeredRequests = self->_registeredRequests;
    }
    if (v9)
      v15 = v9;
    else
      v15 = &__NSDictionary0__struct;
    -[NSMutableDictionary setObject:forKeyedSubscript:](registeredRequests, "setObject:forKeyedSubscript:", v15, v8);
  }
  if (v10)
    v10[2](v10, v11);

}

- (void)companionLinkDeregisterRequestID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  id v8;
  id v9;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v9 = 0;
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v9);
  v8 = v9;
  if (!v8)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredRequests, "setObject:forKeyedSubscript:", 0, v6);
  if (v7)
    v7[2](v7, v8);

}

- (void)companionLinkSendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  RPConnection *v18;
  RPConnection *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v31 = 0;
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v31);
  v17 = v31;
  if (!v17)
  {
    if (!objc_msgSend(v14, "isEqual:", CFSTR("rapport:rdid:DirectPeer")))
    {
LABEL_8:
      -[RPCompanionLinkDaemon sendRequestID:request:destinationID:xpcID:options:responseHandler:](self->_daemon, "sendRequestID:request:destinationID:xpcID:options:responseHandler:", v12, v13, v14, self->_xpcID, v15, v16);
      goto LABEL_9;
    }
    v18 = self->_netCnx;
    if (v18)
    {
      v19 = v18;
      -[RPConnection sendEncryptedRequestID:request:xpcID:options:responseHandler:](v18, "sendEncryptedRequestID:request:xpcID:options:responseHandler:", v12, v13, self->_xpcID, v15, v16);

LABEL_9:
      v28 = 0;
      goto LABEL_10;
    }
    v20 = objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice identifier](self->_daemonDevice, "identifier"));
    if (v20
      || (v21 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient destinationDevice](self->_client, "destinationDevice")),
          v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier")),
          v21,
          v20))
    {

      v14 = (id)v20;
      goto LABEL_8;
    }
    v29 = RPErrorF(4294960591, (uint64_t)"DirectPeer with no destination device", v22, v23, v24, v25, v26, v27, v30);
    v17 = (id)objc_claimAutoreleasedReturnValue(v29);
  }
  v28 = v17;
  if (v16 && v17)
    (*((void (**)(id, _QWORD, _QWORD, id))v16 + 2))(v16, 0, 0, v17);
LABEL_10:

}

- (void)companionLinkTryPassword:(id)a3
{
  unsigned int v4;
  void *v5;
  RPConnection *v6;
  RPConnection *v7;
  id v8;

  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", 0);
  v5 = v8;
  if (v4)
  {
    v6 = self->_netCnx;
    v7 = v6;
    if (v6)
    {
      -[RPConnection tryPassword:](v6, "tryPassword:", v8);
    }
    else if (dword_100130248 <= 90
           && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection companionLinkTryPassword:]", 90, "### No connection to try password from %#{pid}\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }

    v5 = v8;
  }

}

- (void)companionLinkSetLocalDeviceAsContextCollector:(id)a3
{
  void (**v4)(id, _QWORD);
  unsigned __int8 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = (void (**)(id, _QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v11 = 0;
  v5 = -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v11);
  v6 = v11;
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    v10 = v6;
    if (!v4)
      goto LABEL_11;
    goto LABEL_10;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon localDeviceInfo](self->_daemon, "localDeviceInfo"));
  objc_msgSend(v8, "setStatusFlags:", (unint64_t)objc_msgSend(v8, "statusFlags") | 0x400000000);

  self->_isContextCollector = 1;
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon localDeviceInfo](self->_daemon, "localDeviceInfo"));
    LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection companionLinkSetLocalDeviceAsContextCollector:]", 30, "Setting local device as context collector: '%@'\n", v9);

  }
  -[RPCompanionLinkDaemon _update](self->_daemon, "_update");
  if (v4)
  {
    v10 = 0;
LABEL_10:
    ((void (**)(id, id))v4)[2](v4, v10);
  }
LABEL_11:

}

- (void)companionLinkRemoveLocalDeviceAsContextCollector:(id)a3
{
  void (**v4)(id, _QWORD);
  unsigned __int8 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = (void (**)(id, _QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v11 = 0;
  v5 = -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v11);
  v6 = v11;
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    v10 = v6;
    if (!v4)
      goto LABEL_11;
    goto LABEL_10;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon localDeviceInfo](self->_daemon, "localDeviceInfo"));
  objc_msgSend(v8, "setStatusFlags:", (unint64_t)objc_msgSend(v8, "statusFlags") & 0xFFFFFFFBFFFFFFFFLL);

  self->_isContextCollector = 0;
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon localDeviceInfo](self->_daemon, "localDeviceInfo"));
    LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection companionLinkRemoveLocalDeviceAsContextCollector:]", 30, "Removing local device as context collector: '%@'\n", v9);

  }
  -[RPCompanionLinkDaemon _update](self->_daemon, "_update");
  if (v4)
  {
    v10 = 0;
LABEL_10:
    ((void (**)(id, id))v4)[2](v4, v10);
  }
LABEL_11:

}

- (void)xpcDiscoveryActivate:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, id);
  id v9;
  id v10;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v10 = 0;
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v10);
  v9 = v10;
  if (v9)
  {
    if (v8)
      v8[2](v8, 0, v9);
  }
  else
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection xpcDiscoveryActivate:completion:]", 30, "Activate: %@, from %#{pid}\n", v7, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }
    objc_msgSend(v7, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)&self->_discoveryClient, a3);
  }

}

- (void)xpcDiscoveryUpdate:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", 0)
    && dword_100130248 <= 30
    && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection xpcDiscoveryUpdate:]", 30, "Update: %@, from %#{pid}\n", v4, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  }

}

- (void)xpcServerActivate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  _QWORD *v38;
  _QWORD v39[5];
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id obj;
  _QWORD v46[4];
  id v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _BYTE v55[128];

  v37 = a3;
  v6 = a3;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = sub_10000F988;
  v53 = sub_10000F950;
  v54 = 0;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10003DC88;
  v46[3] = &unk_1001120F8;
  v48 = &v49;
  v7 = a4;
  v47 = v7;
  v38 = objc_retainBlock(v46);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v8 = (id *)(v50 + 5);
  obj = (id)v50[5];
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v8, obj);
  if (!v50[5])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serviceType"));
    if (objc_msgSend(v9, "length"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon activeServers](self->_daemon, "activeServers"));
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v42;
        while (2)
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v42 != v19)
              objc_enumerationMutation(v17);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i), "serviceType"));
            v22 = objc_msgSend(v21, "isEqual:", v9);

            if (v22)
            {
              v30 = RPErrorF(4294960575, (uint64_t)"Service type already in use: '%@'", v23, v24, v25, v26, v27, v28, (uint64_t)v9);
              v31 = objc_claimAutoreleasedReturnValue(v30);
              v32 = (void *)v50[5];
              v50[5] = v31;

              goto LABEL_23;
            }
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
          if (v18)
            continue;
          break;
        }
      }

      v29 = objc_msgSend(v6, "internalAuthFlags");
      if ((v29 & 1) != 0)
      {
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_10003DD44;
        v40[3] = &unk_100111C48;
        v40[4] = self;
        objc_msgSend(v6, "setShowPasswordHandler:", v40);
      }
      if ((v29 & 2) != 0)
      {
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_10003DDA4;
        v39[3] = &unk_100111C70;
        v39[4] = self;
        objc_msgSend(v6, "setHidePasswordHandler:", v39);
      }
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection xpcServerActivate:completion:]", 30, "Activate: %@, from %#{pid}\n", v6, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), v37);
      }
      objc_msgSend(v6, "setDispatchQueue:", self->_dispatchQueue);
      objc_storeStrong((id *)&self->_server, v37);
      if (!v17)
      {
        v17 = objc_alloc_init((Class)NSMutableSet);
        -[RPCompanionLinkDaemon setActiveServers:](self->_daemon, "setActiveServers:", v17);
      }
      objc_msgSend(v17, "addObject:", v6);
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon localDeviceInfo](self->_daemon, "localDeviceInfo"));
      objc_msgSend(v33, "setServersChangedState:", 6);

      -[RPCompanionLinkDaemon _updateForXPCServerChange](self->_daemon, "_updateForXPCServerChange");
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }
    else
    {
      v34 = RPErrorF(4294960591, (uint64_t)"No service type", v10, v11, v12, v13, v14, v15, v36);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      v17 = (id)v50[5];
      v50[5] = v35;
    }
LABEL_23:

  }
  ((void (*)(_QWORD *))v38[2])(v38);

  _Block_object_dispose(&v49, 8);
}

- (void)xpcServerUpdate:(id)a3
{
  RPServer *server;
  id v5;
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  const char *v16;
  id v17;

  v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!-[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", 0))
    goto LABEL_23;
  server = self->_server;
  if (server)
  {
    v5 = -[RPServer controlFlags](server, "controlFlags");
    v6 = objc_msgSend(v17, "controlFlags");
    v7 = v6 != v5;
    if (v6 != v5)
      -[RPServer setControlFlags:](self->_server, "setControlFlags:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "password"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPServer password](self->_server, "password"));
    v10 = v8;
    v11 = v9;
    if (v10 == v11)
    {

    }
    else
    {
      v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        v13 = objc_msgSend(v10, "isEqual:", v11);

        if ((v13 & 1) != 0)
          goto LABEL_12;
      }
      else
      {

      }
      -[RPServer setPassword:](self->_server, "setPassword:", v10);
      v7 = 1;
    }
LABEL_12:
    v14 = objc_msgSend(v17, "passwordType");
    if ((_DWORD)v14 != -[RPServer passwordType](self->_server, "passwordType"))
    {
      -[RPServer setPasswordType:](self->_server, "setPasswordType:", v14);
      v7 = 1;
    }
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      v15 = -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
      v16 = "no changes";
      if (v7)
        v16 = "changed";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection xpcServerUpdate:]", 30, "Update server: %@, from %#{pid}, %s\n", v17, v15, v16);
    }
    if (v7)
      -[RPCompanionLinkDaemon _updateForXPCServerChange](self->_daemon, "_updateForXPCServerChange");

    goto LABEL_23;
  }
  if (dword_100130248 <= 90 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection xpcServerUpdate:]", 90, "### Server update failed: no server, %@, from %#{pid}\n", v17, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
LABEL_23:

}

- (void)xpcSessionActivate:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, id);
  id v9;
  id v10;

  v7 = a3;
  v8 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v10 = 0;
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v10);
  v9 = v10;
  if (v9)
  {
    if (v8)
      v8[2](v8, v9);
  }
  else
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection xpcSessionActivate:completion:]", 30, "Activate: %@, from %#{pid}\n", v7, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }
    objc_msgSend(v7, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)&self->_session, a3);
  }

}

- (id)_findMatchingDevice:(id)a3 inDeviceDictionary:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v5 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "allValues", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "isEqualToDevice:", v5) & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (BOOL)clientNeedsWiFiAssertion
{
  return self->_clientNeedsWiFiAssertion;
}

- (void)setClientNeedsWiFiAssertion:(BOOL)a3
{
  self->_clientNeedsWiFiAssertion = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BOOL)isContextCollector
{
  return self->_isContextCollector;
}

- (void)setIsContextCollector:(BOOL)a3
{
  self->_isContextCollector = a3;
}

- (void)setNetCnx:(id)a3
{
  objc_storeStrong((id *)&self->_netCnx, a3);
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
  objc_storeStrong((id *)&self->_appID, a3);
}

- (CUBonjourDevice)bonjourDevice
{
  return self->_bonjourDevice;
}

- (void)setBonjourDevice:(id)a3
{
  objc_storeStrong((id *)&self->_bonjourDevice, a3);
}

- (RPCompanionLinkDaemon)daemon
{
  return self->_daemon;
}

- (RPCompanionLinkDevice)daemonDevice
{
  return self->_daemonDevice;
}

- (NSMutableDictionary)devices
{
  return self->_devices;
}

- (RPDiscovery)discoveryClient
{
  return self->_discoveryClient;
}

- (void)setDiscoveryClient:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryClient, a3);
}

- (OS_dispatch_source)discoveryTimer
{
  return self->_discoveryTimer;
}

- (void)setDiscoveryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryTimer, a3);
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setLaunchInstanceID:(id)a3
{
  objc_storeStrong((id *)&self->_launchInstanceID, a3);
}

- (void)setNeedsCLink:(BOOL)a3
{
  self->_needsCLink = a3;
}

- (void)setNeedsNearbyActionV2:(BOOL)a3
{
  self->_needsNearbyActionV2 = a3;
}

- (NSString)personaUUID
{
  return self->_personaUUID;
}

- (void)setPersonaUUID:(id)a3
{
  objc_storeStrong((id *)&self->_personaUUID, a3);
}

- (NSMutableDictionary)registeredEvents
{
  return self->_registeredEvents;
}

- (NSMutableSet)registeredProfileIDs
{
  return self->_registeredProfileIDs;
}

- (NSMutableDictionary)registeredRequests
{
  return self->_registeredRequests;
}

- (OS_os_transaction)osTransaction
{
  return self->_osTransaction;
}

- (void)setOsTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_osTransaction, a3);
}

- (RPServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (unint64_t)startTicks
{
  return self->_startTicks;
}

- (void)setStartTicks:(unint64_t)a3
{
  self->_startTicks = a3;
}

- (unsigned)xpcID
{
  return self->_xpcID;
}

@end
