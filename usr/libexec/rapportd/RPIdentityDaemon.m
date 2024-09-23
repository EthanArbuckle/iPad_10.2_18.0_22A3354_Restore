@implementation RPIdentityDaemon

- (RPIdentity)homeKitIdentity
{
  return self->_homeKitIdentity;
}

+ (id)sharedIdentityDaemon
{
  if (qword_1001320E8 != -1)
    dispatch_once(&qword_1001320E8, &stru_100112FD0);
  return (id)qword_1001320E0;
}

- (id)identitiesOfType:(int)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  int DeviceClass;
  NSArray *p_super;
  NSMutableArray *v11;
  NSMutableArray *sharedHomeDeviceIdentities;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v5 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  DeviceClass = GestaltGetDeviceClass(v7, v8);
  switch((_DWORD)v5)
  {
    case 9:
      sharedHomeDeviceIdentities = self->_sharedHomeDeviceIdentities;
      goto LABEL_11;
    case 8:
      sharedHomeDeviceIdentities = (NSMutableArray *)self->_pairedDeviceIdentities;
      goto LABEL_11;
    case 2:
      p_super = self->_sameAccountDeviceIdentities;
      if (!p_super)
      {
LABEL_5:
        v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon _identitiesOfType:error:](self, "_identitiesOfType:error:", v5, a4));
LABEL_14:
        p_super = &v11->super;
        return p_super;
      }
      return p_super;
  }
  if ((_DWORD)v5 == 12 && DeviceClass == 4)
  {
    sharedHomeDeviceIdentities = (NSMutableArray *)self->_sharedTVUserDeviceIdentities;
    goto LABEL_11;
  }
  if ((int)v5 > 12)
  {
    if ((_DWORD)v5 == 15)
    {
      sharedHomeDeviceIdentities = self->_adHocPairedDeviceIdentities;
    }
    else
    {
      if ((_DWORD)v5 != 13)
        goto LABEL_5;
      sharedHomeDeviceIdentities = self->_sessionPairedDeviceIdentities;
    }
LABEL_11:
    if (!sharedHomeDeviceIdentities)
      sharedHomeDeviceIdentities = (NSMutableArray *)&__NSArray0__struct;
    v11 = sharedHomeDeviceIdentities;
    goto LABEL_14;
  }
  if ((_DWORD)v5 == 4)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[RPPeopleDaemon sharedPeopleDaemon](RPPeopleDaemon, "sharedPeopleDaemon"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getFamilyDeviceIdentities"));
  }
  else
  {
    if ((_DWORD)v5 != 6)
      goto LABEL_5;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[RPPeopleDaemon sharedPeopleDaemon](RPPeopleDaemon, "sharedPeopleDaemon"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getFriendDeviceIdentities"));
  }
  v16 = (void *)v15;
  v17 = &__NSArray0__struct;
  if (v15)
    v17 = (void *)v15;
  p_super = v17;

  return p_super;
}

- (id)_identitiesOfType:(int)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v10;
  id v11;
  void *v12;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  unsigned int v43;
  id v44;
  id v45;
  void *v46;
  unsigned int v47;
  id v48;
  void *v49;
  unsigned __int8 v50;
  unsigned __int8 v51;
  id v52;
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
  uint64_t Int64Ranged;
  void *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  RPIdentityDaemon *v70;
  id v71;
  id v72;
  void *v73;
  id v74;
  id v75;
  int v76;
  void *v77;
  uint64_t v78;
  void *v79;
  id v80;
  id v81;

  v10 = a3 - 1;
  if ((a3 - 1) >= 0xC || ((0x8FFu >> v10) & 1) == 0)
  {
    v11 = RPErrorF(4294960540, (uint64_t)"Bad identity type (%d)", *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7, *(uint64_t *)&a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (dword_100130F48 <= 90
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _identitiesOfType:error:]", 90, "### Get identities failed: %{error}\n", v12);
    }
    if (a4)
      *a4 = objc_retainAutorelease(v12);

LABEL_14:
    v24 = 0;
    return v24;
  }
  v14 = off_100113138[v10];
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    if (a3 == 12 || a3 == 2)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "idsDeviceIDSelf"));

      v23 = 3;
    }
    else
    {
      v22 = 0;
      v23 = 1;
    }
    v26 = objc_alloc_init((Class)CUKeychainItem);
    objc_msgSend(v26, "setAccessGroup:", CFSTR("com.apple.rapport"));
    objc_msgSend(v26, "setSyncType:", v23);
    objc_msgSend(v26, "setType:", v14);
    v27 = objc_alloc_init((Class)CUKeychainManager);
    v81 = 0;
    v28 = objc_msgSend(v27, "copyItemsMatchingItem:flags:error:", v26, 1, &v81);
    v29 = v81;
    v30 = v29;
    v79 = v28;
    if (!v28 && objc_msgSend(v29, "code") != (id)-25300)
    {
      if (dword_100130F48 <= 90
        && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
      {
        LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _identitiesOfType:error:]", 90, "### Get identity keychain items failed: %@, %{error}\n", v14, v30);
      }
      if (a4)
      {
        v30 = objc_retainAutorelease(v30);
        v24 = 0;
        *a4 = v30;
      }
      else
      {
        v24 = 0;
      }
LABEL_78:

      return v24;
    }
    v71 = v27;
    v72 = v26;
    v74 = objc_alloc_init((Class)NSMutableArray);
    v31 = objc_msgSend(v28, "count");
    if (!v31)
      goto LABEL_77;
    v32 = v31;
    v70 = self;
    v76 = a3;
    v33 = 0;
    v78 = kSecAttrViewHintHome;
    v73 = v22;
    while (2)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectAtIndexedSubscript:", v33));
      v35 = v34;
      v77 = v34;
      if (v76 != 2
        || (v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "viewHint")),
            v37 = objc_msgSend(v36, "isEqual:", v78),
            v36,
            (v37 & 1) != 0))
      {
LABEL_43:
        v41 = objc_alloc_init((Class)RPIdentity);
        v80 = v30;
        v51 = objc_msgSend(v41, "updateWithKeychainItem:error:", v35, &v80);
        v52 = v80;

        if (objc_msgSend(v41, "type") == 2 || objc_msgSend(v41, "type") == 1)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[RPCompanionLinkDaemon sharedCompanionLinkDaemon](RPCompanionLinkDaemon, "sharedCompanionLinkDaemon"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localDeviceInfo"));
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "accountID"));

          if (v55)
          {
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "accountID"));

            if (!v56)
              objc_msgSend(v41, "setAccountID:", v55);
          }

          v35 = v77;
        }
        if ((v51 & 1) != 0)
        {
          if (dword_100130F48 <= 60
            && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 60)))
          {
            LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _identitiesOfType:error:]", 60, "### Update identity from keychain failed: %@, %{error}\n", v35, v52);
          }
        }
        else
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "idsDeviceID"));
          v58 = v57;
          if (!v22 || !v57 || objc_msgSend(v57, "caseInsensitiveCompare:", v22))
          {
            v59 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "idsDeviceMap"));
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectForKeyedSubscript:", v58));

            if (v61)
            {
              v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "modelIdentifier"));
              if (v62)
                objc_msgSend(v41, "setModel:", v62);

              v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "name"));
              if (v63)
                objc_msgSend(v41, "setName:", v63);

            }
            objc_msgSend(v74, "addObject:", v41);
            v35 = v77;
          }

        }
        v30 = v52;
        goto LABEL_66;
      }
      v75 = v30;
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "identifier"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "type"));
      v40 = 0;
      while (v33 == v40)
      {
LABEL_41:
        if (v32 == (id)++v40)
          goto LABEL_42;
      }
      v41 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectAtIndexedSubscript:", v40));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "viewHint"));
      v43 = objc_msgSend(v42, "isEqual:", v78);

      if (!v43)
      {
LABEL_40:

        goto LABEL_41;
      }
      v44 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "identifier"));
      v45 = v38;
      v46 = v45;
      if (v44 == v45)
      {

      }
      else
      {
        if ((v38 != 0) == (v44 == 0))
        {
LABEL_39:

          goto LABEL_40;
        }
        v47 = objc_msgSend(v44, "isEqual:", v45);

        if (!v47)
          goto LABEL_40;
      }
      v44 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "type"));
      v48 = v39;
      v49 = v48;
      if (v44 == v48)
      {

LABEL_69:
        if (!v41)
        {
LABEL_42:

          v22 = v73;
          v35 = v77;
          v30 = v75;
          goto LABEL_43;
        }
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "metadata"));
        Int64Ranged = CFDictionaryGetInt64Ranged(v64, CFSTR("revisionID"), 0, 0xFFFFFFFFLL, 0);

        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "metadata"));
        v67 = CFDictionaryGetInt64Ranged(v66, CFSTR("revisionID"), 0, 0xFFFFFFFFLL, 0);

        if (dword_100130F48 <= 30
          && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
        {
          LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _identitiesOfType:error:]", 30, "Skipping non-synced duplicate item: %@ vs %@ (rev %u vs %u)\n", v77, v41, Int64Ranged, v67);
        }
        v22 = v73;
        if (v67 < Int64Ranged)
          -[RPIdentityDaemon _triggerKeychainRefetch](v70, "_triggerKeychainRefetch");

        v35 = v77;
        v30 = v75;
LABEL_66:

        if ((id)++v33 == v32)
        {
LABEL_77:
          v24 = objc_msgSend(v74, "copy");

          v27 = v71;
          v26 = v72;
          goto LABEL_78;
        }
        continue;
      }
      break;
    }
    if ((v39 != 0) != (v44 == 0))
    {
      v50 = objc_msgSend(v44, "isEqual:", v48);

      if ((v50 & 1) != 0)
        goto LABEL_69;
      goto LABEL_40;
    }
    v46 = v48;
    goto LABEL_39;
  }
  if (dword_100130F48 <= 30 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _identitiesOfType:error:]", 30, "Deferring get identities until FirstUnlock\n");
  if (!a4)
    goto LABEL_14;
  v68 = RPErrorF(4294960593, (uint64_t)"Identities not accessible before FirstUnlock", v15, v16, v17, v18, v19, v20, v69);
  *a4 = (id)objc_claimAutoreleasedReturnValue(v68);
  return 0;
}

- (RPIdentityDaemon)init
{
  RPIdentityDaemon *v2;
  RPIdentityDaemon *v3;
  id v4;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v6;
  void *v7;
  void *v8;
  CBPeripheralManager *v9;
  CBPeripheralManager *peripheralManager;
  uint64_t v11;
  NSUUID *sessionPairingIdentifier;
  uint64_t v13;
  NSUUID *adHocPairingIdentifier;
  RPIdentityDaemon *v15;
  objc_super v17;
  void *v18;
  void *v19;

  v17.receiver = self;
  v17.super_class = (Class)RPIdentityDaemon;
  v2 = -[RPIdentityDaemon init](&v17, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    *(_QWORD *)&v3->_homeViewChangeToken = -1;
    v3->_pairedDevicesNotifier = -1;
    v3->_userIdentitiesChanged = 1;
    v4 = objc_alloc((Class)off_100130FB8[0]());
    dispatchQueue = v3->_dispatchQueue;
    v6 = off_100130FC0[0]();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v18 = v7;
    v19 = &__kCFBooleanTrue;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    v9 = (CBPeripheralManager *)objc_msgSend(v4, "initWithDelegate:queue:options:", 0, dispatchQueue, v8);
    peripheralManager = v3->_peripheralManager;
    v3->_peripheralManager = v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    sessionPairingIdentifier = v3->_sessionPairingIdentifier;
    v3->_sessionPairingIdentifier = (NSUUID *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    adHocPairingIdentifier = v3->_adHocPairingIdentifier;
    v3->_adHocPairingIdentifier = (NSUUID *)v13;

    v15 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSArray *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  RPIdentityDaemon *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  id v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  id v107;
  id v108;
  id v109;
  id v110;
  uint64_t v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  id v121;
  id v122;
  id v123;
  uint64_t v124;
  void *v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  id v130;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  RPIdentityDaemon *v141;
  void *v142;
  unsigned int v143;
  id v144;
  id v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  id v150;
  id v151;
  id v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  id v157;
  id v158;
  id v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  id v164;
  id v165;
  id v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  id v171;
  id v172;
  id v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  id v178;
  id v179;
  id v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  id v185;
  id v186;
  id v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  id v192;
  id v193;
  id v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  id v199;
  id v200;
  id v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  id v206;
  id v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  id v212;
  id v213;
  id v214;
  id v215;
  id v216;
  id v217;
  id v218;
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  _BYTE v222[128];
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];

  v218 = 0;
  NSAppendPrintF(&v218, "-- RPIdentityDaemon --\n");
  v5 = v218;
  if (a3 >= 0xBu)
    v6 = 50;
  else
    v6 = 30;
  v7 = v6 | a3 & 0x800000u;
  v217 = 0;
  v8 = objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identityOfSelfAndReturnError:](self, "identityOfSelfAndReturnError:", &v217));
  v9 = v217;
  v10 = v9;
  if (v8)
  {
    v216 = v5;
    v11 = CUDescriptionWithLevel(v8, v7);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    NSAppendPrintF(&v216, "%@\n", v12);
    v13 = v216;

    v5 = (id)v12;
  }
  else
  {
    v215 = v5;
    NSAppendPrintF(&v215, "No SelfIdentity: %{error}\n", v9);
    v13 = v215;
  }

  v214 = v10;
  v14 = objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identityOfTemporarySelfAndReturnError:](self, "identityOfTemporarySelfAndReturnError:", &v214));
  v15 = v214;

  v140 = (void *)v8;
  v143 = v7;
  if (v14)
  {
    v213 = v13;
    v16 = CUDescriptionWithLevel(v14, v7);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    NSAppendPrintF(&v213, "%@\n", v17);
    v18 = v213;

    v13 = (id)v17;
  }
  else
  {
    v212 = v13;
    NSAppendPrintF(&v212, "No TemporarySelfIdentity: %{error}\n", v15);
    v18 = v212;
  }
  v138 = (void *)v14;

  v210 = 0u;
  v211 = 0u;
  v208 = 0u;
  v209 = 0u;
  v141 = self;
  v19 = self->_sameAccountDeviceIdentities;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v208, v228, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v209;
    do
    {
      v23 = 0;
      v24 = v18;
      do
      {
        if (*(_QWORD *)v209 != v22)
          objc_enumerationMutation(v19);
        v25 = *(_QWORD *)(*((_QWORD *)&v208 + 1) + 8 * (_QWORD)v23);
        v207 = v24;
        v26 = CUDescriptionWithLevel(v25, v143);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        NSAppendPrintF(&v207, "%@\n", v27);
        v18 = v207;

        v23 = (char *)v23 + 1;
        v24 = v18;
      }
      while (v21 != v23);
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v208, v228, 16);
    }
    while (v21);
  }

  v206 = v15;
  v28 = v141;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](v141, "identitiesOfType:error:", 3, &v206));
  v30 = v206;

  v137 = v29;
  if (v29)
  {
    v204 = 0u;
    v205 = 0u;
    v202 = 0u;
    v203 = 0u;
    v31 = v29;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v202, v227, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v203;
      do
      {
        v35 = 0;
        v36 = v18;
        do
        {
          if (*(_QWORD *)v203 != v34)
            objc_enumerationMutation(v31);
          v37 = *(_QWORD *)(*((_QWORD *)&v202 + 1) + 8 * (_QWORD)v35);
          v201 = v36;
          v38 = CUDescriptionWithLevel(v37, v143);
          v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
          NSAppendPrintF(&v201, "%@\n", v39);
          v18 = v201;

          v35 = (char *)v35 + 1;
          v36 = v18;
        }
        while (v33 != v35);
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v202, v227, 16);
      }
      while (v33);
      v28 = v141;
    }
  }
  else
  {
    v200 = v18;
    NSAppendPrintF(&v200, "No family account identities: %{error}\n", v30);
    v31 = v18;
    v18 = v200;
  }

  v199 = v30;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](v28, "identitiesOfType:error:", 4, &v199));
  v41 = v199;

  v136 = v40;
  if (v40)
  {
    v197 = 0u;
    v198 = 0u;
    v195 = 0u;
    v196 = 0u;
    v42 = v40;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v195, v226, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v196;
      do
      {
        v46 = 0;
        v47 = v18;
        do
        {
          if (*(_QWORD *)v196 != v45)
            objc_enumerationMutation(v42);
          v48 = *(_QWORD *)(*((_QWORD *)&v195 + 1) + 8 * (_QWORD)v46);
          v194 = v47;
          v49 = CUDescriptionWithLevel(v48, v143);
          v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
          NSAppendPrintF(&v194, "%@\n", v50);
          v18 = v194;

          v46 = (char *)v46 + 1;
          v47 = v18;
        }
        while (v44 != v46);
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v195, v226, 16);
      }
      while (v44);
      v28 = v141;
    }
  }
  else
  {
    v193 = v18;
    NSAppendPrintF(&v193, "No family device identities: %{error}\n", v41);
    v42 = v18;
    v18 = v193;
  }

  v192 = v41;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](v28, "identitiesOfType:error:", 5, &v192));
  v52 = v192;

  v135 = v51;
  if (v51)
  {
    v190 = 0u;
    v191 = 0u;
    v188 = 0u;
    v189 = 0u;
    v53 = v51;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v188, v225, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v189;
      do
      {
        v57 = 0;
        v58 = v18;
        do
        {
          if (*(_QWORD *)v189 != v56)
            objc_enumerationMutation(v53);
          v59 = *(_QWORD *)(*((_QWORD *)&v188 + 1) + 8 * (_QWORD)v57);
          v187 = v58;
          v60 = CUDescriptionWithLevel(v59, v143);
          v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
          NSAppendPrintF(&v187, "%@\n", v61);
          v18 = v187;

          v57 = (char *)v57 + 1;
          v58 = v18;
        }
        while (v55 != v57);
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v188, v225, 16);
      }
      while (v55);
      v28 = v141;
    }
  }
  else
  {
    v186 = v18;
    NSAppendPrintF(&v186, "No friend account identities: %{error}\n", v52);
    v53 = v18;
    v18 = v186;
  }

  v185 = v52;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](v28, "identitiesOfType:error:", 6, &v185));
  v63 = v185;

  v134 = v62;
  if (v62)
  {
    v183 = 0u;
    v184 = 0u;
    v181 = 0u;
    v182 = 0u;
    v64 = v62;
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v181, v224, 16);
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v182;
      do
      {
        v68 = 0;
        v69 = v18;
        do
        {
          if (*(_QWORD *)v182 != v67)
            objc_enumerationMutation(v64);
          v70 = *(_QWORD *)(*((_QWORD *)&v181 + 1) + 8 * (_QWORD)v68);
          v180 = v69;
          v71 = CUDescriptionWithLevel(v70, v143);
          v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
          NSAppendPrintF(&v180, "%@\n", v72);
          v18 = v180;

          v68 = (char *)v68 + 1;
          v69 = v18;
        }
        while (v66 != v68);
        v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v181, v224, 16);
      }
      while (v66);
      v28 = v141;
    }
  }
  else
  {
    v179 = v18;
    NSAppendPrintF(&v179, "No friend device identities: %{error}\n", v63);
    v64 = v18;
    v18 = v179;
  }

  v178 = v63;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](v28, "identitiesOfType:error:", 8, &v178));
  v74 = v178;

  v139 = v73;
  if (v73)
  {
    v176 = 0u;
    v177 = 0u;
    v174 = 0u;
    v175 = 0u;
    v75 = v73;
    v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v174, v223, 16);
    if (v76)
    {
      v77 = v76;
      v78 = *(_QWORD *)v175;
      do
      {
        v79 = 0;
        v80 = v18;
        do
        {
          if (*(_QWORD *)v175 != v78)
            objc_enumerationMutation(v75);
          v81 = *(_QWORD *)(*((_QWORD *)&v174 + 1) + 8 * (_QWORD)v79);
          v173 = v80;
          v82 = CUDescriptionWithLevel(v81, v143);
          v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
          NSAppendPrintF(&v173, "%@\n", v83);
          v18 = v173;

          v79 = (char *)v79 + 1;
          v80 = v18;
        }
        while (v77 != v79);
        v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v174, v223, 16);
      }
      while (v77);
      v28 = v141;
    }
  }
  else
  {
    v172 = v18;
    NSAppendPrintF(&v172, "No paired device identities: %{error}\n", v74);
    v75 = v18;
    v18 = v172;
  }

  v171 = v74;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](v28, "identitiesOfType:error:", 9, &v171));
  v85 = v171;

  v133 = v84;
  if (v84)
  {
    v169 = 0u;
    v170 = 0u;
    v167 = 0u;
    v168 = 0u;
    v86 = v84;
    v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v167, v222, 16);
    if (v87)
    {
      v88 = v87;
      v89 = *(_QWORD *)v168;
      do
      {
        v90 = 0;
        v91 = v18;
        do
        {
          if (*(_QWORD *)v168 != v89)
            objc_enumerationMutation(v86);
          v92 = *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * (_QWORD)v90);
          v166 = v91;
          v93 = CUDescriptionWithLevel(v92, v143);
          v94 = (void *)objc_claimAutoreleasedReturnValue(v93);
          NSAppendPrintF(&v166, "%@\n", v94);
          v18 = v166;

          v90 = (char *)v90 + 1;
          v91 = v18;
        }
        while (v88 != v90);
        v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v167, v222, 16);
      }
      while (v88);
      v28 = v141;
    }
  }
  else
  {
    v165 = v18;
    NSAppendPrintF(&v165, "No SharedHome device identities: %{error}\n", v85);
    v86 = v18;
    v18 = v165;
  }

  v164 = v85;
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](v28, "identitiesOfType:error:", 12, &v164));
  v96 = v164;

  v132 = v95;
  if (v95)
  {
    v162 = 0u;
    v163 = 0u;
    v160 = 0u;
    v161 = 0u;
    v97 = v95;
    v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v160, v221, 16);
    if (v98)
    {
      v99 = v98;
      v100 = *(_QWORD *)v161;
      do
      {
        v101 = 0;
        v102 = v18;
        do
        {
          if (*(_QWORD *)v161 != v100)
            objc_enumerationMutation(v97);
          v103 = *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * (_QWORD)v101);
          v159 = v102;
          v104 = CUDescriptionWithLevel(v103, v143);
          v105 = (void *)objc_claimAutoreleasedReturnValue(v104);
          NSAppendPrintF(&v159, "%@\n", v105, v132, v133, v134, v135, v136, v137, v138);
          v18 = v159;

          v101 = (char *)v101 + 1;
          v102 = v18;
        }
        while (v99 != v101);
        v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v160, v221, 16);
      }
      while (v99);
    }
    v28 = v141;
  }
  else
  {
    v158 = v18;
    NSAppendPrintF(&v158, "No Shared TV user device identities: %{error}\n", v96, 0, v133, v134, v135, v136, v137, v138);
    v97 = v18;
    v18 = v158;
  }

  v157 = v96;
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](v28, "identitiesOfType:error:", 13, &v157));
  v107 = v157;

  if (v106)
  {
    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    v108 = v106;
    v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v153, v220, 16);
    if (v109)
    {
      v110 = v109;
      v111 = *(_QWORD *)v154;
      do
      {
        v112 = 0;
        v113 = v18;
        do
        {
          if (*(_QWORD *)v154 != v111)
            objc_enumerationMutation(v108);
          v114 = *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * (_QWORD)v112);
          v152 = v113;
          v115 = CUDescriptionWithLevel(v114, v143);
          v116 = (void *)objc_claimAutoreleasedReturnValue(v115);
          NSAppendPrintF(&v152, "%@\n", v116);
          v18 = v152;

          v112 = (char *)v112 + 1;
          v113 = v18;
        }
        while (v110 != v112);
        v110 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v153, v220, 16);
      }
      while (v110);
      v28 = v141;
    }
  }
  else
  {
    v151 = v18;
    NSAppendPrintF(&v151, "No session pairing identities: %{error}\n", v107);
    v108 = v18;
    v18 = v151;
  }

  v150 = v107;
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](v28, "identitiesOfType:error:", 15, &v150));
  v118 = v150;

  v120 = v139;
  v119 = v140;
  if (v117)
  {
    v148 = 0u;
    v149 = 0u;
    v146 = 0u;
    v147 = 0u;
    v121 = v117;
    v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v146, v219, 16);
    if (v122)
    {
      v123 = v122;
      v142 = v106;
      v124 = *(_QWORD *)v147;
      do
      {
        v125 = 0;
        v126 = v18;
        do
        {
          if (*(_QWORD *)v147 != v124)
            objc_enumerationMutation(v121);
          v127 = *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * (_QWORD)v125);
          v145 = v126;
          v128 = CUDescriptionWithLevel(v127, v143);
          v129 = (void *)objc_claimAutoreleasedReturnValue(v128);
          NSAppendPrintF(&v145, "%@\n", v129);
          v18 = v145;

          v125 = (char *)v125 + 1;
          v126 = v18;
        }
        while (v123 != v125);
        v123 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v146, v219, 16);
      }
      while (v123);
      v120 = v139;
      v119 = v140;
      v106 = v142;
    }
  }
  else
  {
    v144 = v18;
    NSAppendPrintF(&v144, "No ad-hoc paired identities: %{error}\n", v118);
    v121 = v18;
    v18 = v144;
  }

  v130 = v18;
  return v130;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005FBDC;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  CUSystemMonitor *v3;
  CUSystemMonitor *systemMonitor;
  CUSystemMonitor *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  if (dword_100130F48 <= 30 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _activate]", 30, "Activate\n");
  if (!self->_systemMonitor)
  {
    v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005FCFC;
    v7[3] = &unk_1001110F8;
    v7[4] = self;
    -[CUSystemMonitor setFirstUnlockHandler:](self->_systemMonitor, "setFirstUnlockHandler:", v7);
    v5 = self->_systemMonitor;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005FD04;
    v6[3] = &unk_1001110F8;
    v6[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }
  -[RPIdentityDaemon prefsChanged](self, "prefsChanged");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005FD64;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  CUSystemMonitor *systemMonitor;
  CBPeripheralManager *peripheralManager;

  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _invalidate]", 30, "Invalidating\n");
    }
    -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0;

    peripheralManager = self->_peripheralManager;
    self->_peripheralManager = 0;

    -[RPIdentityDaemon _ensureStopped](self, "_ensureStopped");
    -[RPIdentityDaemon _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _invalidated]", 30, "Invalidated\n");
    }
  }
}

- (void)daemonInfoChanged:(unint64_t)a3
{
  int v3;
  void *v5;
  RPIdentity *selfIdentityCache;
  void *v7;

  v3 = a3;
  if ((a3 & 0x10) != 0)
  {
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon daemonInfoChanged:]", 30, "Removing identities on sign out\n");
    }
    -[RPIdentityDaemon _ensureStopped](self, "_ensureStopped");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
    objc_msgSend(v5, "postDaemonInfoChanges:", 8);

    notify_post("com.apple.rapport.identitiesChanged");
    -[RPIdentityDaemon _update](self, "_update");
    if ((v3 & 0x40) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((a3 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  if (dword_100130F48 <= 30 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon daemonInfoChanged:]", 30, "Reloading identities on sign in\n");
  selfIdentityCache = self->_selfIdentityCache;
  self->_selfIdentityCache = 0;

  -[RPIdentityDaemon _loadSelfIdentity:](self, "_loadSelfIdentity:", 0);
  -[RPIdentityDaemon _updateSameAccountIdentities](self, "_updateSameAccountIdentities");
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 0x20000) == 0)
      return;
    goto LABEL_17;
  }
LABEL_16:
  -[RPIdentityDaemon _updateSameAccountIdentities](self, "_updateSameAccountIdentities");
  if ((v3 & 0x20000) == 0)
    return;
LABEL_17:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity idsDeviceID](self->_selfIdentityCache, "idsDeviceID"));

  if (v7)
    -[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:](self, "_saveSelfIdentityPublicWithPrivateIdentity:force:", self->_selfIdentityCache, 0);
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  id v6;
  id v7;
  RPIdentity *v8;
  unsigned __int8 v10;
  id v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (objc_msgSend(v6, "isEqual:", CFSTR("KeychainRefetch")))
  {
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon diagnosticCommand:params:]", 30, "Diag: KeychainRefetch\n");
    }
    -[RPIdentityDaemon _triggerKeychainRefetch](self, "_triggerKeychainRefetch");
    goto LABEL_37;
  }
  if (objc_msgSend(v6, "isEqual:", CFSTR("SelfIdentityLoad")))
  {
    -[RPIdentityDaemon _loadSelfIdentity:](self, "_loadSelfIdentity:", 0);
LABEL_37:
    LOBYTE(v8) = 1;
    goto LABEL_38;
  }
  if (objc_msgSend(v6, "isEqual:", CFSTR("SelfIdentitySave")))
  {
    v8 = self->_selfIdentityCache;
    if (v8)
    {
      if (dword_100130F48 <= 30
        && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
      {
        LogPrintF(&dword_100130F48, "-[RPIdentityDaemon diagnosticCommand:params:]", 30, "Diag: force SelfIdentity save\n");
      }
      -[RPIdentityDaemon _saveSelfIdentityPrivate:](self, "_saveSelfIdentityPrivate:", v8);
      -[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:](self, "_saveSelfIdentityPublicWithPrivateIdentity:force:", v8, 1);
    }
    else if (dword_100130F48 <= 30
           && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon diagnosticCommand:params:]", 30, "### Diag: force SelfIdentity save without SelfIdentity\n");
    }
    goto LABEL_36;
  }
  if (objc_msgSend(v6, "isEqual:", CFSTR("SelfIdentityRemove")))
  {
    v8 = self->_selfIdentityCache;
    if (v8)
    {
      if (dword_100130F48 <= 30
        && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
      {
        LogPrintF(&dword_100130F48, "-[RPIdentityDaemon diagnosticCommand:params:]", 30, "Diag: force SelfIdentity remove\n");
      }
      -[RPIdentityDaemon _removeSelfIdentityPublicWithPrivateIdentity:](self, "_removeSelfIdentityPublicWithPrivateIdentity:", v8);
    }
    goto LABEL_36;
  }
  if (objc_msgSend(v6, "isEqual:", CFSTR("SelfIdentityRotate")))
  {
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon diagnosticCommand:params:]", 30, "Diag: force SelfIdentity rotate\n");
    }
    LOBYTE(v8) = 1;
    -[RPIdentityDaemon _loadSelfIdentity:](self, "_loadSelfIdentity:", 1);
    goto LABEL_38;
  }
  if (!objc_msgSend(v6, "isEqual:", CFSTR("SameAccountIdentityRemove")))
  {
LABEL_50:
    LOBYTE(v8) = 0;
    goto LABEL_38;
  }
  v8 = (RPIdentity *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("idsIdentifier")));
  if (dword_100130F48 <= 30 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon diagnosticCommand:params:]", 30, "Diag: Remove SameAccountIdentity %@\n", v8);
  if (v8)
  {
    v13 = 0;
    v10 = -[RPIdentityDaemon _removeSameAccountIdentityWithIDSIdentifier:error:](self, "_removeSameAccountIdentityWithIDSIdentifier:error:", v8, &v13);
    v11 = v13;
    v12 = v11;
    if ((v10 & 1) != 0)
    {

LABEL_36:
      goto LABEL_37;
    }
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon diagnosticCommand:params:]", 30, "Diag: Remove SameAccountIdentity failed: %@\n", v8, v12);
    }

    goto LABEL_50;
  }
LABEL_38:

  return (char)v8;
}

- (void)prefsChanged
{
  uint64_t Int64;
  BOOL v4;
  _BOOL4 v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  BOOL v9;
  _BOOL4 v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  BOOL v14;
  _BOOL4 v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  BOOL v19;
  _BOOL4 v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  BOOL v24;
  _BOOL4 v25;
  const char *v26;
  const char *v27;
  int v28;

  v28 = 0;
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("idFamilyResolve"), &v28);
  if (v28)
    v4 = 0;
  else
    v4 = Int64 == 0;
  v5 = !v4;
  if (self->_prefFamilyResolve != v5)
  {
    if (dword_100130F48 <= 40
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 40)))
    {
      v6 = "yes";
      if (v5)
        v7 = "no";
      else
        v7 = "yes";
      if (!v5)
        v6 = "no";
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon prefsChanged]", 40, "Family resolve: %s -> %s\n", v7, v6);
    }
    self->_prefFamilyResolve = v5;
  }
  v8 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("idFriendResolve"), &v28);
  if (v28)
    v9 = 0;
  else
    v9 = v8 == 0;
  v10 = !v9;
  if (self->_prefFriendResolve != v10)
  {
    if (dword_100130F48 <= 40
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 40)))
    {
      v11 = "yes";
      if (v10)
        v12 = "no";
      else
        v12 = "yes";
      if (!v10)
        v11 = "no";
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon prefsChanged]", 40, "Friend resolve: %s -> %s\n", v12, v11);
    }
    self->_prefFriendResolve = v10;
  }
  v13 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("idOwnerResolve"), &v28);
  if (v28)
    v14 = 0;
  else
    v14 = v13 == 0;
  v15 = !v14;
  if (self->_prefOwnerResolve != v15)
  {
    if (dword_100130F48 <= 40
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 40)))
    {
      v16 = "yes";
      if (v15)
        v17 = "no";
      else
        v17 = "yes";
      if (!v15)
        v16 = "no";
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon prefsChanged]", 40, "Owner resolve: %s -> %s\n", v17, v16);
    }
    self->_prefOwnerResolve = v15;
  }
  v18 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("idPairedResolve"), &v28);
  if (v28)
    v19 = 0;
  else
    v19 = v18 == 0;
  v20 = !v19;
  if (self->_prefPairedResolve != v20)
  {
    if (dword_100130F48 <= 40
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 40)))
    {
      v21 = "yes";
      if (v20)
        v22 = "no";
      else
        v22 = "yes";
      if (!v20)
        v21 = "no";
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon prefsChanged]", 40, "Paired resolve: %s -> %s\n", v22, v21);
    }
    self->_prefPairedResolve = v20;
  }
  v23 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("idSharedHomeResolve"), &v28);
  if (v28)
    v24 = 0;
  else
    v24 = v23 == 0;
  v25 = !v24;
  if (self->_prefSharedHomeResolve != v25)
  {
    if (dword_100130F48 <= 40
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 40)))
    {
      v26 = "yes";
      if (v25)
        v27 = "no";
      else
        v27 = "yes";
      if (!v25)
        v26 = "no";
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon prefsChanged]", 40, "SharedHome resolve: %s -> %s\n", v27, v26);
    }
    self->_prefSharedHomeResolve = v25;
  }
  -[RPIdentityDaemon _update](self, "_update");
}

- (void)regenerateSelfIdentity:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100130F48 <= 30 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon regenerateSelfIdentity:]", 30, "Re-generate SelfIdentity: %@\n", v4);
  -[RPIdentityDaemon _loadSelfIdentity:](self, "_loadSelfIdentity:", 1);

}

- (void)_update
{
  -[RPIdentityDaemon _ensureStarted](self, "_ensureStarted");
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  return 0;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  return 0;
}

- (void)setHomeKitIdentity:(id)a3
{
  RPIdentity *v4;
  RPIdentity *homeKitIdentity;

  v4 = (RPIdentity *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  homeKitIdentity = self->_homeKitIdentity;
  self->_homeKitIdentity = v4;

}

- (void)resolvableAccessoriesUpdated:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
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
  unsigned __int8 v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  void *v29;
  id v30;
  const __CFString *v31;
  id v32;
  id v33;
  NSMutableArray *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *i;
  uint64_t v39;
  void *v40;
  RPIdentityDaemon *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
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
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];

  v4 = a3;
  v41 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = objc_alloc_init((Class)NSMutableArray);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  v42 = v6;
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v58;
    v46 = v5;
    v44 = *(_QWORD *)v58;
    do
    {
      v10 = 0;
      v43 = v8;
      do
      {
        if (*(_QWORD *)v58 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIdentifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "device"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rapportIRK"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "data"));

          if (objc_msgSend(v16, "length"))
          {
            v48 = v16;
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "home"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentUser"));
            if (!v18
              || (v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "homeAccessControlForUser:", v18)),
                  v20 = objc_msgSend(v19, "isOwner"),
                  v19,
                  (v20 & 1) == 0))
            {
              v47 = v13;
              v55 = 0u;
              v56 = 0u;
              v53 = 0u;
              v54 = 0u;
              v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "users"));
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
              if (v22)
              {
                v45 = v18;
                v23 = *(_QWORD *)v54;
LABEL_12:
                v24 = 0;
                while (1)
                {
                  if (*(_QWORD *)v54 != v23)
                    objc_enumerationMutation(v21);
                  v25 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v24);
                  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "homeAccessControlForUser:", v25));
                  v27 = objc_msgSend(v26, "isOwner");

                  if ((v27 & 1) != 0)
                    break;
                  if (v22 == (id)++v24)
                  {
                    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
                    if (v22)
                      goto LABEL_12;
                    v28 = 0;
                    v6 = v42;
                    v8 = v43;
LABEL_29:
                    v18 = v45;
                    goto LABEL_31;
                  }
                }
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "userID"));
                v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "uniqueIdentifier"));

                if (!v28)
                {
                  v6 = v42;
                  v8 = v43;
                  v18 = v45;
                  goto LABEL_32;
                }
                v21 = objc_alloc_init((Class)RPIdentity);
                objc_msgSend(v21, "setAccountID:", v28);
                objc_msgSend(v21, "setDeviceIRKData:", v48);
                objc_msgSend(v21, "setHomeKitUserIdentifier:", v22);
                objc_msgSend(v21, "setIdentifier:", v47);
                objc_msgSend(v21, "setIdsDeviceID:", v47);
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
                objc_msgSend(v21, "setName:", v29);

                objc_msgSend(v21, "setType:", 9);
                v30 = objc_msgSend(v11, "homePodVariant");
                v31 = CFSTR("AudioAccessory1,1");
                v6 = v42;
                v8 = v43;
                if (v30 == (id)1
                  || (v32 = objc_msgSend(v11, "homePodVariant", CFSTR("AudioAccessory1,1")),
                      v31 = CFSTR("AudioAccessory5,1"),
                      v32 == (id)2)
                  || (v33 = objc_msgSend(v11, "homePodVariant", CFSTR("AudioAccessory5,1")),
                      v31 = CFSTR("AudioAccessory6,1"),
                      v33 == (id)3))
                {
                  objc_msgSend(v21, "setModel:", v31);
                }
                objc_msgSend(v46, "addObject:", v21);
                if (dword_100130F48 > 30)
                  goto LABEL_29;
                v18 = v45;
                if (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30))
                  LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolvableAccessoriesUpdated:]", 30, "SharedHome identity added: %@\n", v21);
              }
              else
              {
                v28 = 0;
              }
LABEL_31:

LABEL_32:
              v9 = v44;
              v13 = v47;
            }

            v5 = v46;
            v16 = v48;
          }

        }
        v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    }
    while (v8);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v34 = v41->_sharedHomeExtraDeviceIdentities;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v37)
          objc_enumerationMutation(v34);
        v39 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v5, "addObject:", v39);
        if (dword_100130F48 <= 30
          && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
        {
          LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolvableAccessoriesUpdated:]", 30, "SharedHome identity added extra: %@\n", v39);
        }
      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    }
    while (v36);
  }

  objc_storeStrong((id *)&v41->_sharedHomeDeviceIdentities, v5);
  if (dword_100130F48 <= 30 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolvableAccessoriesUpdated:]", 30, "SharedHome peers updated: %d peer(s)\n", objc_msgSend(v5, "count"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
  objc_msgSend(v40, "postDaemonInfoChanges:", 512);

  -[RPIdentityDaemon _postIdentitiesChangedNotification](v41, "_postIdentitiesChangedNotification");
}

- (id)resolveIdentitiesForBonjourDevice:(id)a3 typeFlags:(unsigned int)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = 0;
  while (a4)
  {
    if ((a4 & -a4) == 0)
      break;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon resolveIdentityForBonjourDevice:typeFlags:](self, "resolveIdentityForBonjourDevice:typeFlags:", v6, a4 & -a4));
    if (v8)
    {
      if (!v7)
        v7 = objc_alloc_init((Class)NSMutableArray);
      objc_msgSend(v7, "addObject:", v8);
    }
    a4 ^= a4 & -a4;

  }
  return v7;
}

- (id)resolveIdentityForBonjourDevice:(id)a3 typeFlags:(unsigned int)a4
{
  __int16 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *j;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  _BYTE v66[6];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
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
  uint64_t v95;
  _BYTE v96[6];
  unsigned int v97;
  int v98;
  __int16 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "txtDictionary"));
    v99 = 0;
    v98 = 0;
    v97 = 0;
    CFDictionaryGetHardwareAddress(v7, CFSTR("rpBA"), &v98, 6, &v97);
    if (v97)
    {
      if (dword_100130F48 > 10
        || dword_100130F48 == -1 && !_LogCategory_Initialize(&dword_100130F48, 10))
      {
        goto LABEL_119;
      }
      v8 = CUDescriptionWithLevel(v6, 30);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForBonjourDevice:typeFlags:]", 10, "Ignoring device with no BLE address: %@, %#m\n", v9, v97);
LABEL_112:

LABEL_119:
      v48 = 0;
LABEL_120:

      goto LABEL_121;
    }
    v95 = 0;
    CFDictionaryGetData(v7, CFSTR("rpAD"), v96, 6, &v95, &v97);
    if (v95 != 6)
    {
      if (dword_100130F48 > 20
        || dword_100130F48 == -1 && !_LogCategory_Initialize(&dword_100130F48, 20))
      {
        goto LABEL_119;
      }
      v49 = CUDescriptionWithLevel(v6, 30);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v49);
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForBonjourDevice:typeFlags:]", 20, "Ignoring device with no DeviceAuthTag: %@, %#m\n", v9, v97);
      goto LABEL_112;
    }
    v10 = mach_absolute_time();
    if ((v4 & 2) != 0 && self->_prefOwnerResolve)
    {
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      v11 = self->_sameAccountDeviceIdentities;
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v92;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v92 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v16, "verifyAuthTagPtr:authTagLen:dataPtr:dataLen:type:error:", v96, v95, &v98, 6, 1, 0))
            {
              if (dword_100130F48 <= 20
                && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 20)))
              {
                v50 = CUDescriptionWithLevel(v6, 30);
                v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
                LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForBonjourDevice:typeFlags:]", 20, "Resolved DeviceAuthTag: owner, %@ -> %@\n", v51, v16);
LABEL_140:

              }
              goto LABEL_141;
            }
          }
          v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
          if (v13)
            continue;
          break;
        }
      }

    }
    if ((v4 & 0x100) != 0 && self->_prefSharedHomeResolve)
    {
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v11 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 9, 0));
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v87, v106, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v88;
LABEL_25:
        v20 = 0;
        while (1)
        {
          if (*(_QWORD *)v88 != v19)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v20);
          if (objc_msgSend(v16, "verifyAuthTagPtr:authTagLen:dataPtr:dataLen:type:error:", v96, v95, &v98, 6, 1, 0))break;
          if (v18 == (id)++v20)
          {
            v18 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v87, v106, 16);
            if (v18)
              goto LABEL_25;
            goto LABEL_31;
          }
        }
        if (dword_100130F48 <= 20
          && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 20)))
        {
          v53 = CUDescriptionWithLevel(v6, 30);
          v51 = (void *)objc_claimAutoreleasedReturnValue(v53);
          LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForBonjourDevice:typeFlags:]", 20, "Resolved DeviceAuthTag: shared home, %@ -> %@\n", v51, v16);
          goto LABEL_140;
        }
        goto LABEL_141;
      }
LABEL_31:

    }
    if ((v4 & 8) != 0 && self->_prefFamilyResolve)
    {
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v11 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 4, 0));
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v83, v105, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v84;
LABEL_36:
        v24 = 0;
        while (1)
        {
          if (*(_QWORD *)v84 != v23)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v24);
          if (objc_msgSend(v16, "verifyAuthTagPtr:authTagLen:dataPtr:dataLen:type:error:", v96, v95, &v98, 6, 1, 0))break;
          if (v22 == (id)++v24)
          {
            v22 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v83, v105, 16);
            if (v22)
              goto LABEL_36;
            goto LABEL_42;
          }
        }
        if (dword_100130F48 <= 20
          && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 20)))
        {
          v54 = CUDescriptionWithLevel(v6, 30);
          v51 = (void *)objc_claimAutoreleasedReturnValue(v54);
          LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForBonjourDevice:typeFlags:]", 20, "Resolved DeviceAuthTag: family, %@ -> %@\n", v51, v16);
          goto LABEL_140;
        }
        goto LABEL_141;
      }
LABEL_42:

    }
    if ((v4 & 0x20) != 0 && self->_prefFriendResolve)
    {
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v11 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 6, 0));
      v25 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v79, v104, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v80;
LABEL_47:
        v28 = 0;
        while (1)
        {
          if (*(_QWORD *)v80 != v27)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v28);
          if (objc_msgSend(v16, "verifyAuthTagPtr:authTagLen:dataPtr:dataLen:type:error:", v96, v95, &v98, 6, 1, 0))break;
          if (v26 == (id)++v28)
          {
            v26 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v79, v104, 16);
            if (v26)
              goto LABEL_47;
            goto LABEL_53;
          }
        }
        if (dword_100130F48 <= 20
          && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 20)))
        {
          v56 = CUDescriptionWithLevel(v6, 30);
          v51 = (void *)objc_claimAutoreleasedReturnValue(v56);
          LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForBonjourDevice:typeFlags:]", 20, "Resolved DeviceAuthTag: friend, %@ -> %@\n", v51, v16);
          goto LABEL_140;
        }
        goto LABEL_141;
      }
LABEL_53:

    }
    if ((v4 & 0x400) != 0)
    {
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v11 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 12, 0));
      v29 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v75, v103, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v76;
LABEL_57:
        v32 = 0;
        while (1)
        {
          if (*(_QWORD *)v76 != v31)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v32);
          if ((objc_msgSend(v16, "disabled") & 1) == 0
            && (unint64_t)objc_msgSend(v16, "disabledUntilTicks") <= v10
            && objc_msgSend(v16, "verifyAuthTagPtr:authTagLen:dataPtr:dataLen:type:error:", v96, v95, &v98, 6, 1, 0))
          {
            break;
          }
          if (v30 == (id)++v32)
          {
            v30 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v75, v103, 16);
            if (v30)
              goto LABEL_57;
            goto LABEL_65;
          }
        }
        if (dword_100130F48 <= 20
          && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 20)))
        {
          v55 = CUDescriptionWithLevel(v6, 30);
          v51 = (void *)objc_claimAutoreleasedReturnValue(v55);
          LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForBonjourDevice:typeFlags:]", 20, "Resolved DeviceAuthTag: SharedTVUser, %@ -> %@\n", v51, v16);
          goto LABEL_140;
        }
        goto LABEL_141;
      }
LABEL_65:

    }
    if ((v4 & 0x80) != 0 && self->_prefPairedResolve)
    {
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v11 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 8, 0));
      v33 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v71, v102, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v72;
LABEL_70:
        v36 = 0;
        while (1)
        {
          if (*(_QWORD *)v72 != v35)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v36);
          if ((objc_msgSend(v16, "disabled") & 1) == 0
            && (unint64_t)objc_msgSend(v16, "disabledUntilTicks") <= v10
            && objc_msgSend(v16, "verifyAuthTagPtr:authTagLen:dataPtr:dataLen:type:error:", v96, v95, &v98, 6, 1, 0))
          {
            break;
          }
          if (v34 == (id)++v36)
          {
            v34 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v71, v102, 16);
            if (v34)
              goto LABEL_70;
            goto LABEL_78;
          }
        }
        if (dword_100130F48 <= 20
          && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 20)))
        {
          v58 = CUDescriptionWithLevel(v6, 30);
          v51 = (void *)objc_claimAutoreleasedReturnValue(v58);
          LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForBonjourDevice:typeFlags:]", 20, "Resolved DeviceAuthTag: paired, %@ -> %@\n", v51, v16);
          goto LABEL_140;
        }
        goto LABEL_141;
      }
LABEL_78:

    }
    if ((v4 & 0x800) != 0)
    {
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v11 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 13, 0));
      v37 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v67, v101, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v68;
LABEL_82:
        v40 = 0;
        while (1)
        {
          if (*(_QWORD *)v68 != v39)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v40);
          if ((objc_msgSend(v16, "disabled") & 1) == 0
            && (unint64_t)objc_msgSend(v16, "disabledUntilTicks") <= v10
            && objc_msgSend(v16, "verifyAuthTagPtr:authTagLen:dataPtr:dataLen:type:error:", v96, v95, &v98, 6, 1, 0))
          {
            break;
          }
          if (v38 == (id)++v40)
          {
            v38 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v67, v101, 16);
            if (v38)
              goto LABEL_82;
            goto LABEL_90;
          }
        }
        if (dword_100130F48 <= 20
          && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 20)))
        {
          v57 = CUDescriptionWithLevel(v6, 30);
          v51 = (void *)objc_claimAutoreleasedReturnValue(v57);
          LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForBonjourDevice:typeFlags:]", 20, "Resolved DeviceAuthTag: SessionPaired, %@ -> %@\n", v51, v16);
          goto LABEL_140;
        }
LABEL_141:
        v48 = v16;

        goto LABEL_120;
      }
LABEL_90:

    }
    if ((v4 & 0x4000) != 0)
    {
      v65 = 0;
      CFDictionaryGetData(v7, CFSTR("rpTAD"), v66, 6, &v65, &v97);
      if (v65 == 6)
      {
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 15, 0));
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v61, v100, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v62;
          while (2)
          {
            for (j = 0; j != v43; j = (char *)j + 1)
            {
              if (*(_QWORD *)v62 != v44)
                objc_enumerationMutation(v41);
              v46 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j);
              if ((objc_msgSend(v46, "disabled") & 1) == 0
                && (unint64_t)objc_msgSend(v46, "disabledUntilTicks") <= v10
                && objc_msgSend(v46, "verifyAuthTagPtr:authTagLen:dataPtr:dataLen:type:error:", v66, v65, &v98, 6, 1, 0))
              {
                if (dword_100130F48 <= 20
                  && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 20)))
                {
                  v59 = CUDescriptionWithLevel(v6, 30);
                  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
                  LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForBonjourDevice:typeFlags:]", 20, "Resolved DeviceAuthTag: AdHocPaired, %@ -> %@\n", v60, v46);

                }
                v48 = v46;

                goto LABEL_120;
              }
            }
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v61, v100, 16);
            if (v43)
              continue;
            break;
          }
        }

      }
    }
    if (dword_100130F48 > 9 || dword_100130F48 == -1 && !_LogCategory_Initialize(&dword_100130F48, 9))
      goto LABEL_119;
    v47 = CUDescriptionWithLevel(v6, 30);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v47);
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForBonjourDevice:typeFlags:]", 9, "Ignoring unresolved DeviceAuthTag: %@\n", v9);
    goto LABEL_112;
  }
  if (dword_100130F48 <= 30 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForBonjourDevice:typeFlags:]", 30, "Deferring ResolveIdentity until FirstUnlock\n");
  v48 = 0;
LABEL_121:

  return v48;
}

- (id)resolveIdentityForSignature:(id)a3 data:(id)a4 typeFlags:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  id v28;
  id v29;
  uint64_t v30;
  void *k;
  id v32;
  id v33;
  uint64_t v34;
  void *m;
  id v36;
  id v37;
  uint64_t v38;
  void *n;
  id v40;
  id v41;
  uint64_t v42;
  void *ii;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  void *jj;
  void *v49;
  id v50;
  id v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v17 = a4;
  if ((v7 & 2) != 0 && self->_prefOwnerResolve)
  {
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v18 = self->_sameAccountDeviceIdentities;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v79;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v79 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v23, "verifySignature:data:error:", v10, v17, 0))
          {
            if (dword_100130F48 <= 30
              && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
            {
              LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForSignature:data:typeFlags:error:]", 30, "Resolved identity for signature: owner, %@\n", v23);
            }
LABEL_96:
            v50 = v23;

            goto LABEL_97;
          }
        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
        if (v20)
          continue;
        break;
      }
    }

  }
  if ((v7 & 8) != 0 && self->_prefFamilyResolve)
  {
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v18 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 4, 0));
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v75;
      while (2)
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(_QWORD *)v75 != v26)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)j);
          if (objc_msgSend(v23, "verifySignature:data:error:", v10, v17, 0))
          {
            if (dword_100130F48 <= 30
              && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
            {
              LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForSignature:data:typeFlags:error:]", 30, "Resolved identity for signature: family, %@\n", v23);
            }
            goto LABEL_96;
          }
        }
        v25 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
        if (v25)
          continue;
        break;
      }
    }

  }
  if ((v7 & 0x20) != 0 && self->_prefFriendResolve)
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v18 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 6, 0));
    v28 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v71;
      while (2)
      {
        for (k = 0; k != v29; k = (char *)k + 1)
        {
          if (*(_QWORD *)v71 != v30)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)k);
          if (objc_msgSend(v23, "verifySignature:data:error:", v10, v17, 0))
          {
            if (dword_100130F48 <= 30
              && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
            {
              LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForSignature:data:typeFlags:error:]", 30, "Resolved identity for signature: friend, %@\n", v23);
            }
            goto LABEL_96;
          }
        }
        v29 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
        if (v29)
          continue;
        break;
      }
    }

  }
  if ((v7 & 0x400) != 0)
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v18 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 12, 0));
    v32 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v67;
      while (2)
      {
        for (m = 0; m != v33; m = (char *)m + 1)
        {
          if (*(_QWORD *)v67 != v34)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)m);
          if (objc_msgSend(v23, "verifySignature:data:error:", v10, v17, 0))
          {
            if (dword_100130F48 <= 30
              && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
            {
              LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForSignature:data:typeFlags:error:]", 30, "Resolved identity for signature: SharedTVUserDevice, %@\n", v23);
            }
            goto LABEL_96;
          }
        }
        v33 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
        if (v33)
          continue;
        break;
      }
    }

  }
  if ((v7 & 0x80) != 0 && self->_prefPairedResolve)
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v18 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 8, 0));
    v36 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v62, v84, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v63;
      while (2)
      {
        for (n = 0; n != v37; n = (char *)n + 1)
        {
          if (*(_QWORD *)v63 != v38)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)n);
          if (objc_msgSend(v23, "verifySignature:data:error:", v10, v17, 0))
          {
            if (dword_100130F48 <= 30
              && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
            {
              LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForSignature:data:typeFlags:error:]", 30, "Resolved identity for signature: paired, %@\n", v23);
            }
            goto LABEL_96;
          }
        }
        v37 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v62, v84, 16);
        if (v37)
          continue;
        break;
      }
    }

  }
  if ((v7 & 0x800) != 0)
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v18 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 13, 0));
    v40 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v58, v83, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v59;
      while (2)
      {
        for (ii = 0; ii != v41; ii = (char *)ii + 1)
        {
          if (*(_QWORD *)v59 != v42)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)ii);
          if (objc_msgSend(v23, "verifySignature:data:error:", v10, v17, 0))
          {
            if (dword_100130F48 <= 30
              && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
            {
              LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForSignature:data:typeFlags:error:]", 30, "Resolved identity for signature: SessionPaired, %@\n", v23);
            }
            goto LABEL_96;
          }
        }
        v41 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v58, v83, 16);
        if (v41)
          continue;
        break;
      }
    }

  }
  if ((v7 & 0x4000) != 0)
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 15, 0));
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v54, v82, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v55;
      while (2)
      {
        for (jj = 0; jj != v46; jj = (char *)jj + 1)
        {
          if (*(_QWORD *)v55 != v47)
            objc_enumerationMutation(v44);
          v49 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)jj);
          if (objc_msgSend(v49, "verifySignature:data:error:", v10, v17, 0))
          {
            if (dword_100130F48 <= 30
              && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
            {
              LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForSignature:data:typeFlags:error:]", 30, "Resolved identity for signature: AdHocPaired, %@\n", v49);
            }
            v50 = v49;

            goto LABEL_97;
          }
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v54, v82, 16);
        if (v46)
          continue;
        break;
      }
    }

  }
  if (dword_100130F48 <= 90 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForSignature:data:typeFlags:error:]", 90, "### Resolve identity for signature failed: %#{flags}\n", v7, &unk_10010A720);
  if (a6)
  {
    v52 = RPErrorF(4294960569, (uint64_t)"Resolved identity not found", v11, v12, v13, v14, v15, v16, v53);
    v50 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue(v52);
  }
  else
  {
    v50 = 0;
  }
LABEL_97:

  return v50;
}

- (unsigned)resolveIdentityTypesForSignature:(id)a3 data:(id)a4 typeFlags:(unsigned int)a5
{
  __int16 v5;
  id v8;
  id v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *k;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *m;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *n;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
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
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ((v5 & 2) == 0 || !self->_prefOwnerResolve)
  {
    v11 = 0;
    if ((v5 & 8) == 0)
      goto LABEL_28;
    goto LABEL_16;
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v10 = self->_sameAccountDeviceIdentities;
  v11 = (uint64_t)-[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v52;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v52 != v12)
          objc_enumerationMutation(v10);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "verifySignature:data:error:", v8, v9, 0) & 1) != 0)
        {
          v11 = 2;
          goto LABEL_15;
        }
      }
      v11 = (uint64_t)-[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_15:

  if ((v5 & 8) != 0)
  {
LABEL_16:
    if (self->_prefFamilyResolve)
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 4, 0));
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v48;
        while (2)
        {
          for (j = 0; j != v16; j = (char *)j + 1)
          {
            if (*(_QWORD *)v48 != v17)
              objc_enumerationMutation(v14);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j), "verifySignature:data:error:", v8, v9, 0) & 1) != 0)
            {
              v11 = v11 | 8;
              goto LABEL_27;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
          if (v16)
            continue;
          break;
        }
      }
LABEL_27:

    }
  }
LABEL_28:
  if ((v5 & 0x20) != 0 && self->_prefFriendResolve)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 6, 0));
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v44;
      while (2)
      {
        for (k = 0; k != v21; k = (char *)k + 1)
        {
          if (*(_QWORD *)v44 != v22)
            objc_enumerationMutation(v19);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)k), "verifySignature:data:error:", v8, v9, 0) & 1) != 0)
          {
            v11 = v11 | 0x20;
            goto LABEL_40;
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
        if (v21)
          continue;
        break;
      }
    }
LABEL_40:

  }
  if ((v5 & 0x400) != 0)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 12, 0));
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v56, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v40;
      while (2)
      {
        for (m = 0; m != v26; m = (char *)m + 1)
        {
          if (*(_QWORD *)v40 != v27)
            objc_enumerationMutation(v24);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)m), "verifySignature:data:error:", v8, v9, 0) & 1) != 0)
          {
            v11 = v11 | 0x400;
            goto LABEL_52;
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v56, 16);
        if (v26)
          continue;
        break;
      }
    }
LABEL_52:

  }
  if ((v5 & 0x800) != 0)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 13, 0));
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v35, v55, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v36;
      while (2)
      {
        for (n = 0; n != v31; n = (char *)n + 1)
        {
          if (*(_QWORD *)v36 != v32)
            objc_enumerationMutation(v29);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)n), "verifySignature:data:error:", v8, v9, 0) & 1) != 0)
          {
            v11 = v11 | 0x800;
            goto LABEL_64;
          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v35, v55, 16);
        if (v31)
          continue;
        break;
      }
    }
LABEL_64:

  }
  if (dword_100130F48 <= 30 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityTypesForSignature:data:typeFlags:]", 30, "Resolved identity types: %#{flags}\n", v11, &unk_10010A720);

  return v11;
}

- (id)resolveIdentityForTempAuthTagData:(id)a3 bluetoothAddressData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 15, 0, 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v12, "verifyAuthTag:data:type:error:", v6, v7, 2, 0) & 1) != 0)
        {
          v9 = v12;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)resolveIdentityForNearFieldMessagePayload:(id)a3
{
  id v4;
  id v5;
  uint64_t *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10000F9B8;
  v27 = sub_10000F968;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10000F9B8;
  v21 = sub_10000F968;
  v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100062B88;
  v13[3] = &unk_100112FF8;
  v5 = v4;
  v14 = v5;
  v15 = &v23;
  v16 = &v17;
  -[RPIdentityDaemon _enumerateIdentitiesWithFlag:usingBlock:](self, "_enumerateIdentitiesWithFlag:usingBlock:", 19882, v13);
  if (dword_100130F48 <= 30 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon resolveIdentityForNearFieldMessagePayload:]", 30, "identity resolved:%@ - fallback identities:%ld", v24[5], objc_msgSend((id)v18[5], "count"));
  v6 = v24;
  v7 = (void *)v24[5];
  if (v7)
  {
    v8 = v7;
    v9 = (void *)v6[5];
    v6[5] = (uint64_t)v8;
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v18[5], "firstObject"));
    v9 = (void *)v24[5];
    v24[5] = v10;
  }

  v11 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v11;
}

- (unint64_t)resolveIdentityforSignature:(id)a3 data:(id)a4 flags:(unsigned int)a5 accountaltDSID:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void ***v16;
  unint64_t v17;
  void **v19;
  uint64_t v20;
  void (*v21)(_QWORD *, void *, _BYTE *);
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_100062D98;
  v22 = &unk_100113020;
  v13 = v10;
  v23 = v13;
  v14 = v11;
  v24 = v14;
  v15 = v12;
  v25 = v15;
  v26 = &v27;
  v16 = objc_retainBlock(&v19);
  -[RPIdentityDaemon _enumerateIdentitiesWithFlag:usingBlock:](self, "_enumerateIdentitiesWithFlag:usingBlock:", v7, v16, v19, v20, v21, v22);
  v17 = v28[3];

  _Block_object_dispose(&v27, 8);
  return v17;
}

- (void)isContactValidForIdentity:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  RPIdentityDaemon *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  if (v6
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contactID"))) != 0
    && (v9 = objc_msgSend(v6, "type"), v8, v9 == 6))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contactID"));
    v11 = objc_alloc_init((Class)off_100130FC8[0]());
    objc_msgSend(v11, "setContactIdentifier:", v10);
    v12 = objc_alloc_init((Class)off_100130FD0[0]());
    objc_msgSend(v12, "setDispatchQueue:", self->_dispatchQueue);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10006302C;
    v15[3] = &unk_100113048;
    v13 = v12;
    v16 = v13;
    v17 = v6;
    v14 = v11;
    v18 = v14;
    v19 = self;
    v21 = &v22;
    v20 = v7;
    objc_msgSend(v13, "findContact:completion:", v14, v15);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, *((unsigned __int8 *)v23 + 24));
  }
  _Block_object_dispose(&v22, 8);

}

- (id)identityOfSelfAndReturnError:(id *)a3
{
  RPIdentity *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  RPIdentity *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  RPIdentity *v19;
  id v20;
  id v21;
  uint64_t v23;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = self->_selfIdentityCache;
  if (!v5)
  {
    if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
    {
      -[RPIdentityDaemon _loadSelfIdentity:](self, "_loadSelfIdentity:", 0);
      v12 = self->_selfIdentityCache;
      v5 = v12;
      if (v12)
      {
        v19 = v12;
      }
      else if (a3)
      {
        v20 = RPErrorF(4294960534, (uint64_t)"SelfIdentity load failed", v13, v14, v15, v16, v17, v18, v23);
        *a3 = (id)objc_claimAutoreleasedReturnValue(v20);
      }

    }
    else
    {
      if (dword_100130F48 <= 30
        && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
      {
        LogPrintF(&dword_100130F48, "-[RPIdentityDaemon identityOfSelfAndReturnError:]", 30, "Deferring SelfIdentity get until FirstUnlock\n");
      }
      if (a3)
      {
        v21 = RPErrorF(4294960593, (uint64_t)"SelfIdentity not accessible before FirstUnlock", v6, v7, v8, v9, v10, v11, v23);
        v5 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue(v21);
      }
      else
      {
        v5 = 0;
      }
    }
  }
  return v5;
}

- (id)identityOfTemporarySelfAndReturnError:(id *)a3
{
  RPIdentity *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  RPIdentity *v12;
  RPIdentity *v13;
  id v14;
  uint64_t v16;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = self->_temporarySelfIdentityCache;
  v12 = v5;
  if (v5)
  {
    v13 = v5;
  }
  else if (a3)
  {
    v14 = RPErrorF(4294960534, (uint64_t)"SelfTemporaryIdentity not found", v6, v7, v8, v9, v10, v11, v16);
    *a3 = (id)objc_claimAutoreleasedReturnValue(v14);
  }

  return v12;
}

- (unint64_t)featureFlagsForIdentityMatchingIDSDeviceIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 4, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 6, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 2, 0));
  v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v5);
  objc_msgSend(v8, "addObjectsFromArray:", v6);
  objc_msgSend(v8, "addObjectsFromArray:", v7);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v17 = v5;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "idsDeviceID"));
        v15 = objc_msgSend(v14, "isEqualToString:", v4);

        if (v15)
        {
          v10 = objc_msgSend(v13, "featureFlags");
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
LABEL_11:
    v5 = v17;
  }

  return (unint64_t)v10;
}

- (void)regenerateTemporarySelfIdentity
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000639A8;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (id)loadFamilyDeviceIdentitiesWithError:(id *)a3
{
  return -[RPIdentityDaemon _identitiesOfType:error:](self, "_identitiesOfType:error:", 4, a3);
}

- (id)loadFriendDeviceIdentitiesWithError:(id *)a3
{
  return -[RPIdentityDaemon _identitiesOfType:error:](self, "_identitiesOfType:error:", 6, a3);
}

- (void)getPairedIdentityWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_alloc_init((Class)CUPairingManager);
  objc_msgSend(v5, "setDispatchQueue:", self->_dispatchQueue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100063AD4;
  v7[3] = &unk_100113070;
  v7[4] = v5;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getPairingIdentityWithOptions:completion:", 134, v7);

}

- (void)getPairingIdentityFromHomeWithAccessory:(id)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  v5 = (void (**)(id, _QWORD, void *))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPCompanionLinkDaemon sharedCompanionLinkDaemon](RPCompanionLinkDaemon, "sharedCompanionLinkDaemon"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rpHomeKitManager"));

  if (v7)
  {
    objc_msgSend(v7, "getPairingIdentityFromHomeWithAccessory:completionHandler:", v17, v5);
  }
  else
  {
    v14 = RPErrorF(4294960578, (uint64_t)"HomeKit manager not initialized", v8, v9, v10, v11, v12, v13, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v5[2](v5, 0, v15);

  }
}

- (void)addSelfIdentityInfoToMessage:(id)a3 flags:(unsigned int)a4
{
  char v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  id v21;

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v21 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identityOfSelfAndReturnError:](self, "identityOfSelfAndReturnError:", &v21));
  v8 = v21;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceIRKData"));
    if (v9)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("_dIRK"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "edPKData"));
    if (v10)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("_edPK"));

    if ((v4 & 1) != 0)
    {
      v19 = objc_msgSend(v7, "featureFlags");
      if ((v19 & 8) != 0)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v19 & 8));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("_ff"));

      }
      else
      {
        objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_10011AC08, CFSTR("_ff"));
      }
      objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("?"), CFSTR("model"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("?"), CFSTR("model"));
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "btIRKData"));
      if (v11)
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("_bIRK"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "btAddress"));
      if (v12)
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("_bAdd"));

      v13 = objc_msgSend(v7, "featureFlags");
      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v13));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("_ff"));

      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("model")));

      if (!v15)
      {
        v16 = (void *)GestaltCopyAnswer(CFSTR("ProductType"), 0, 0);
        if (v16)
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("model"));

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name")));

      if (!v17)
      {
        v18 = (void *)GestaltCopyAnswer(CFSTR("UserAssignedDeviceName"), 0, 0);
        if (v18)
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("name"));

      }
    }
  }
  else if (dword_100130F48 <= 90
         && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
  {
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon addSelfIdentityInfoToMessage:flags:]", 90, "### Add info failed with no SelfIdentity: %{error}\n", v8);
  }

}

- (void)addSharedHomeIdentityWithRPMessage:(id)a3
{
  id v4;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  NSMutableArray *sharedHomeExtraDeviceIdentities;
  NSMutableArray *v18;
  NSMutableArray *v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  id v29;
  id v30;
  RPIdentityDaemon *v31;
  id v32;
  NSMutableArray *sharedHomeDeviceIdentities;
  NSMutableArray *v34;
  NSMutableArray *v35;
  void *v36;
  RPIdentityDaemon *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v4, CFSTR("_idsID"), TypeID, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v7)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v8 = self->_sharedHomeExtraDeviceIdentities;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v43;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
        v15 = objc_msgSend(v14, "isEqual:", v7);

        if ((v15 & 1) != 0)
          break;
        if (v10 == (id)++v12)
        {
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
          if (v10)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v16 = v13;

      if (!v16)
        goto LABEL_13;
      objc_msgSend(v16, "updateWithRPMessage:error:", v4, 0);
    }
    else
    {
LABEL_10:

LABEL_13:
      v16 = objc_alloc_init((Class)RPIdentity);
      objc_msgSend(v16, "setIdentifier:", v7);
      objc_msgSend(v16, "setType:", 9);
      objc_msgSend(v16, "updateWithRPMessage:error:", v4, 0);
      sharedHomeExtraDeviceIdentities = self->_sharedHomeExtraDeviceIdentities;
      if (!sharedHomeExtraDeviceIdentities)
      {
        v18 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        v19 = self->_sharedHomeExtraDeviceIdentities;
        self->_sharedHomeExtraDeviceIdentities = v18;

        sharedHomeExtraDeviceIdentities = self->_sharedHomeExtraDeviceIdentities;
      }
      -[NSMutableArray addObject:](sharedHomeExtraDeviceIdentities, "addObject:", v16);
    }
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v37 = self;
    v20 = self->_sharedHomeDeviceIdentities;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v39;
LABEL_18:
      v24 = v4;
      v25 = 0;
      while (1)
      {
        if (*(_QWORD *)v39 != v23)
          objc_enumerationMutation(v20);
        v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier"));
        v28 = objc_msgSend(v27, "isEqual:", v7);

        if ((v28 & 1) != 0)
          break;
        if (v22 == (id)++v25)
        {
          v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          v4 = v24;
          if (v22)
            goto LABEL_18;
          goto LABEL_24;
        }
      }
      v29 = v26;

      v4 = v24;
      if (!v29)
        goto LABEL_30;
      v30 = objc_msgSend(v29, "updateWithRPMessage:error:", v24, 0);
      v31 = v37;
      if ((_DWORD)v30)
      {
        if (dword_100130F48 <= 30)
        {
          v32 = v30;
          if (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30))
            LogPrintF(&dword_100130F48, "-[RPIdentityDaemon addSharedHomeIdentityWithRPMessage:]", 30, "Updated SharedHome identity extra: %@, %#{flags}\n", v16, v32, &unk_10010A807);
        }
        goto LABEL_37;
      }
    }
    else
    {
LABEL_24:

LABEL_30:
      v31 = v37;
      sharedHomeDeviceIdentities = v37->_sharedHomeDeviceIdentities;
      if (!sharedHomeDeviceIdentities)
      {
        v34 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        v35 = v37->_sharedHomeDeviceIdentities;
        v37->_sharedHomeDeviceIdentities = v34;

        sharedHomeDeviceIdentities = v37->_sharedHomeDeviceIdentities;
      }
      -[NSMutableArray addObject:](sharedHomeDeviceIdentities, "addObject:", v16);
      if (dword_100130F48 <= 30
        && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
      {
        LogPrintF(&dword_100130F48, "-[RPIdentityDaemon addSharedHomeIdentityWithRPMessage:]", 30, "Added SharedHome identity extra: %@\n", v16);
      }
      v29 = 0;
LABEL_37:
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
      objc_msgSend(v36, "postDaemonInfoChanges:", 512);

      -[RPIdentityDaemon _postIdentitiesChangedNotification](v31, "_postIdentitiesChangedNotification");
    }

  }
}

- (BOOL)removeIdentity:(id)a3 error:(id *)a4
{
  id v6;
  unsigned int v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  unsigned int v21;
  __CFString *v22;
  id v23;
  unsigned __int8 v24;
  id v25;
  id v26;
  uint64_t v28;
  id v29;

  v6 = a3;
  v7 = objc_msgSend(v6, "type");
  if (v7 > 0x10)
    v8 = "?";
  else
    v8 = off_1001131F8[v7];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8));
  if (dword_100130F48 <= 30 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon removeIdentity:error:]", 30, "Remove identity %@", v6);
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    v16 = objc_msgSend(v6, "type");
    if (v16 == 2)
      v17 = 0;
    else
      v17 = 6;
    if (v16 == 2)
      v18 = 3;
    else
      v18 = 1;
    v19 = objc_alloc_init((Class)CUKeychainItem);
    objc_msgSend(v19, "setAccessGroup:", CFSTR("com.apple.rapport"));
    objc_msgSend(v19, "setAccessibleType:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    objc_msgSend(v19, "setIdentifier:", v20);

    objc_msgSend(v19, "setSyncType:", v18);
    v21 = objc_msgSend(v6, "type") - 1;
    if (v21 > 0xB)
      v22 = 0;
    else
      v22 = off_100113198[v21];
    objc_msgSend(v19, "setType:", v22);
    v23 = objc_alloc_init((Class)CUKeychainManager);
    v29 = 0;
    v24 = objc_msgSend(v23, "removeItemMatchingItem:error:", v19, &v29);
    v25 = v29;
    if ((v24 & 1) != 0)
    {
      -[RPIdentityDaemon _postIdentitiesChangedNotification](self, "_postIdentitiesChangedNotification");
    }
    else
    {
      if (dword_100130F48 <= 90
        && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
      {
        LogPrintF(&dword_100130F48, "-[RPIdentityDaemon removeIdentity:error:]", 90, "### RemoveIdentity keychain item failed: %@, %@, %{error}\n", v6, v19, v25);
      }
      if (a4)
        *a4 = objc_retainAutorelease(v25);
    }

  }
  else
  {
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon removeIdentity:error:]", 30, "Deferring RemoveIdentity until FirstUnlock (%@)\n", v9);
    }
    if (a4)
    {
      v26 = RPErrorF(4294960593, (uint64_t)"Account identity not removable before FirstUnlock", v10, v11, v12, v13, v14, v15, v28);
      v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v26);
    }
    else
    {
      v24 = 0;
    }
  }

  return v24;
}

- (BOOL)saveIdentity:(id)a3 error:(id *)a4
{
  id v6;
  unsigned int v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  unsigned __int8 v17;
  id v18;
  id v19;
  unsigned int v20;
  id v21;
  uint64_t v23;
  id v24;

  v6 = a3;
  v7 = objc_msgSend(v6, "type");
  if (v7 > 0x10)
    v8 = "?";
  else
    v8 = off_1001131F8[v7];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8));
  if (dword_100130F48 <= 30 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon saveIdentity:error:]", 30, "Save identity %@", v6);
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    v16 = objc_alloc_init((Class)CUKeychainItem);
    objc_msgSend(v16, "setAccessGroup:", CFSTR("com.apple.rapport"));
    objc_msgSend(v16, "setAccessibleType:", 6);
    objc_msgSend(v16, "setInvisible:", 1);
    objc_msgSend(v16, "setSyncType:", 1);
    v24 = 0;
    v17 = objc_msgSend(v16, "updateWithRPIdentity:revisionUpdate:error:", v6, 1, &v24);
    v18 = v24;
    if ((v17 & 1) != 0)
    {
      if (dword_100130F48 <= 90
        && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
      {
        LogPrintF(&dword_100130F48, "-[RPIdentityDaemon saveIdentity:error:]", 90, "### Convert to keychain item failed: %@, %{error}\n", v6, v18);
      }
      LOBYTE(v20) = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v18);
    }
    else
    {
      v19 = objc_alloc_init((Class)CUKeychainManager);
      v20 = objc_msgSend(v19, "addOrUpdateOrReAddItem:logCategory:logLabel:error:", v16, &dword_100130F48, v9, a4);
      if (v20)
      {
        if (objc_msgSend(v6, "type") == 2)
        {
          if (dword_100130F48 <= 30
            && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
          {
            LogPrintF(&dword_100130F48, "-[RPIdentityDaemon saveIdentity:error:]", 30, "Reloading same account identities on save identity\n");
          }
          -[RPIdentityDaemon _updateSameAccountIdentities](self, "_updateSameAccountIdentities");
        }
        else
        {
          -[RPIdentityDaemon _postIdentitiesChangedNotification](self, "_postIdentitiesChangedNotification");
        }
      }

    }
  }
  else
  {
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon saveIdentity:error:]", 30, "Deferring SaveIdentity until FirstUnlock (%@)\n", v9);
    }
    if (a4)
    {
      v21 = RPErrorF(4294960593, (uint64_t)"Account identity not save-able before FirstUnlock", v10, v11, v12, v13, v14, v15, v23);
      LOBYTE(v20) = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v21);
    }
    else
    {
      LOBYTE(v20) = 0;
    }
  }

  return v20;
}

- (BOOL)saveIdentityWithIDSDeviceID:(id)a3 message:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  int v18;
  int v19;
  id v20;
  id v21;
  void *v22;
  unsigned __int8 v23;
  BOOL v24;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v7 = a3;
  v8 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 2, 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
      v16 = objc_msgSend(v15, "isEqual:", v7);

      if ((v16 & 1) != 0)
        break;
      if (v11 == (id)++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v17 = v14;

    if (!v17)
      goto LABEL_12;
    v18 = 0;
  }
  else
  {
LABEL_9:

LABEL_12:
    v17 = objc_alloc_init((Class)RPIdentity);
    objc_msgSend(v17, "setIdentifier:", v7);
    objc_msgSend(v17, "setType:", 2);
    v18 = 1;
  }
  if (objc_msgSend(v17, "updateWithRPMessage:error:", v8, 0))
    v19 = 1;
  else
    v19 = v18;
  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "idsDeviceID"));
  v21 = v7;
  v22 = v21;
  if (v20 == v21)
  {

    if (!v19)
      goto LABEL_22;
LABEL_25:
    v24 = -[RPIdentityDaemon saveIdentity:error:](self, "saveIdentity:error:", v17, a5);
    goto LABEL_26;
  }
  if ((v21 != 0) == (v20 == 0))
  {

    goto LABEL_24;
  }
  v23 = objc_msgSend(v20, "isEqual:", v21);

  if ((v23 & 1) == 0)
  {
LABEL_24:
    objc_msgSend(v17, "setIdsDeviceID:", v22);
    goto LABEL_25;
  }
  if (v19)
    goto LABEL_25;
LABEL_22:
  v24 = 1;
LABEL_26:

  return v24;
}

- (void)addSessionPairedIdentity:(id)a3
{
  id v4;
  void *v5;
  NSObject *dispatchQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    dispatchQueue = self->_dispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100064CAC;
    v7[3] = &unk_100111928;
    v7[4] = self;
    v8 = v4;
    dispatch_async(dispatchQueue, v7);

  }
}

- (void)removeSessionPairedIdentityWithIdentifier:(id)a3
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
  v7[2] = sub_100064F3C;
  v7[3] = &unk_100111928;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)updateSessionPairedIdentity:(id)a3
{
  id v4;
  void *v5;
  NSObject *dispatchQueue;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  if (v5)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000651F4;
    block[3] = &unk_100111928;
    block[4] = self;
    v8 = v4;
    dispatch_async(dispatchQueue, block);

  }
  else if (dword_100130F48 <= 90
         && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
  {
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon updateSessionPairedIdentity:]", 90, "### Failed to update session paired identity, no identifeir: %@\n", v4);
  }

}

- (void)addOrUpdateAdHocPairedIdentity:(id)a3
{
  id v4;
  void *v5;
  NSObject *dispatchQueue;
  _QWORD v7[4];
  id v8;
  RPIdentityDaemon *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    dispatchQueue = self->_dispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000654F8;
    v7[3] = &unk_100111928;
    v8 = v4;
    v9 = self;
    dispatch_async(dispatchQueue, v7);

  }
}

- (void)_ensureStarted
{
  id v3;
  id v4;
  const char *v5;
  NSObject *dispatchQueue;
  id v7;
  id v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD handler[5];

  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    if (self->_homeViewChangeToken == -1)
    {
      if (dword_100130F48 <= 30
        && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
      {
        LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _ensureStarted]", 30, "Start\n");
      }
      v3 = objc_alloc((Class)NSString);
      v4 = objc_retainAutorelease(objc_msgSend(v3, "initWithFormat:", CFSTR("com.apple.security.view-change.%@"), kSecAttrViewHintHome));
      v5 = (const char *)objc_msgSend(v4, "UTF8String");
      dispatchQueue = self->_dispatchQueue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100065A00;
      handler[3] = &unk_1001115C8;
      handler[4] = self;
      notify_register_dispatch(v5, &self->_homeViewChangeToken, dispatchQueue, handler);
      -[RPIdentityDaemon _updateSameAccountIdentities](self, "_updateSameAccountIdentities");

    }
    if (self->_homeViewReadyToken == -1)
    {
      v7 = objc_alloc((Class)NSString);
      v8 = objc_retainAutorelease(objc_msgSend(v7, "initWithFormat:", CFSTR("com.apple.security.view-ready.%@"), kSecAttrViewHintHome));
      v9 = (const char *)objc_msgSend(v8, "UTF8String");
      v10 = self->_dispatchQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100065A8C;
      v13[3] = &unk_1001115C8;
      v13[4] = self;
      notify_register_dispatch(v9, &self->_homeViewReadyToken, v10, v13);

    }
    if (self->_pairedDevicesNotifier == -1)
    {
      v11 = self->_dispatchQueue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100065B24;
      v12[3] = &unk_1001115C8;
      v12[4] = self;
      notify_register_dispatch("com.apple.pairing.peerChanged", &self->_pairedDevicesNotifier, v11, v12);
      -[RPIdentityDaemon _updatePairedDeviceIdentities](self, "_updatePairedDeviceIdentities");
    }
    if (!self->_selfIdentityCache)
      -[RPIdentityDaemon _loadSelfIdentity:](self, "_loadSelfIdentity:", 0);
    if (!self->_temporarySelfIdentityCache)
      -[RPIdentityDaemon _loadTemporarySelfIdentity](self, "_loadTemporarySelfIdentity");
  }
  else if (dword_100130F48 <= 30
         && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
  {
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _ensureStarted]", 30, "Deferring start until FirstUnlock\n");
  }
}

- (void)_ensureStopped
{
  int homeViewChangeToken;
  int homeViewReadyToken;
  CUCoalescer *identitiesChangedCoalescer;
  NSArray *pairedDeviceIdentities;
  int pairedDevicesNotifier;
  NSArray *sameAccountDeviceIdentities;
  NSMutableArray *sharedHomeDeviceIdentities;
  NSMutableArray *sharedHomeExtraDeviceIdentities;
  NSArray *sharedTVUserDeviceIdentities;
  NSMutableArray *adHocPairedDeviceIdentities;
  RPIdentity *selfIdentityCache;
  RPIdentity *temporarySelfIdentityCache;
  OS_dispatch_source *temporarySelfIdentityTimer;
  OS_dispatch_source *v16;
  NSObject *v17;

  homeViewChangeToken = self->_homeViewChangeToken;
  if (homeViewChangeToken != -1)
  {
    if (dword_100130F48 > 30)
      goto LABEL_7;
    if (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30))
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _ensureStopped]", 30, "Stop\n");
    homeViewChangeToken = self->_homeViewChangeToken;
    if (homeViewChangeToken != -1)
    {
LABEL_7:
      notify_cancel(homeViewChangeToken);
      self->_homeViewChangeToken = -1;
    }
  }
  homeViewReadyToken = self->_homeViewReadyToken;
  if (homeViewReadyToken != -1)
  {
    if (dword_100130F48 > 30)
      goto LABEL_14;
    if (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30))
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _ensureStopped]", 30, "Cancel home view ready notification\n");
    homeViewReadyToken = self->_homeViewReadyToken;
    if (homeViewReadyToken != -1)
    {
LABEL_14:
      notify_cancel(homeViewReadyToken);
      self->_homeViewReadyToken = -1;
    }
  }
  -[CUCoalescer invalidate](self->_identitiesChangedCoalescer, "invalidate");
  identitiesChangedCoalescer = self->_identitiesChangedCoalescer;
  self->_identitiesChangedCoalescer = 0;

  pairedDeviceIdentities = self->_pairedDeviceIdentities;
  self->_pairedDeviceIdentities = 0;

  pairedDevicesNotifier = self->_pairedDevicesNotifier;
  if (pairedDevicesNotifier != -1)
  {
    notify_cancel(pairedDevicesNotifier);
    self->_pairedDevicesNotifier = -1;
  }
  sameAccountDeviceIdentities = self->_sameAccountDeviceIdentities;
  self->_sameAccountDeviceIdentities = 0;

  sharedHomeDeviceIdentities = self->_sharedHomeDeviceIdentities;
  self->_sharedHomeDeviceIdentities = 0;

  sharedHomeExtraDeviceIdentities = self->_sharedHomeExtraDeviceIdentities;
  self->_sharedHomeExtraDeviceIdentities = 0;

  sharedTVUserDeviceIdentities = self->_sharedTVUserDeviceIdentities;
  self->_sharedTVUserDeviceIdentities = 0;

  adHocPairedDeviceIdentities = self->_adHocPairedDeviceIdentities;
  self->_adHocPairedDeviceIdentities = 0;

  selfIdentityCache = self->_selfIdentityCache;
  self->_selfIdentityCache = 0;

  temporarySelfIdentityCache = self->_temporarySelfIdentityCache;
  self->_temporarySelfIdentityCache = 0;

  temporarySelfIdentityTimer = self->_temporarySelfIdentityTimer;
  if (temporarySelfIdentityTimer)
  {
    v17 = temporarySelfIdentityTimer;
    dispatch_source_cancel(v17);
    v16 = self->_temporarySelfIdentityTimer;
    self->_temporarySelfIdentityTimer = 0;

  }
}

- (void)_postIdentitiesChangedNotification
{
  CUCoalescer *identitiesChangedCoalescer;
  CUCoalescer *v4;
  CUCoalescer *v5;

  identitiesChangedCoalescer = self->_identitiesChangedCoalescer;
  if (!identitiesChangedCoalescer)
  {
    v4 = (CUCoalescer *)objc_alloc_init((Class)CUCoalescer);
    v5 = self->_identitiesChangedCoalescer;
    self->_identitiesChangedCoalescer = v4;

    -[CUCoalescer setDispatchQueue:](self->_identitiesChangedCoalescer, "setDispatchQueue:", self->_dispatchQueue);
    -[CUCoalescer setMinDelay:](self->_identitiesChangedCoalescer, "setMinDelay:", 0.3);
    -[CUCoalescer setMaxDelay:](self->_identitiesChangedCoalescer, "setMaxDelay:", 1.0);
    -[CUCoalescer setActionHandler:](self->_identitiesChangedCoalescer, "setActionHandler:", &stru_100113090);
    identitiesChangedCoalescer = self->_identitiesChangedCoalescer;
  }
  -[CUCoalescer trigger](identitiesChangedCoalescer, "trigger");
}

- (void)_triggerKeychainRefetch
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = mach_absolute_time();
  v4 = UpTicksToSeconds(v3 - self->_keychainRefetchTicks);
  if (v4 >> 5 > 0x2A2)
  {
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _triggerKeychainRefetch]", 30, "Keychain refetch start\n");
    }
    self->_keychainRefetchTicks = v3;
    v8 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSControl controlObject:](CKKSControl, "controlObject:", &v8));
    v7 = v8;
    if (v6)
    {
      objc_msgSend(v6, "rpcFetchAndProcessChanges:reply:", kSecAttrViewHintHome, &stru_1001130B0);
    }
    else if (dword_100130F48 <= 90
           && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _triggerKeychainRefetch]", 90, "### CKKSControl failed: %{error}\n", v7);
    }

  }
  else if (dword_100130F48 <= 30)
  {
    v5 = v4;
    if (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30))
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _triggerKeychainRefetch]", 30, "Triggering Keychain refetch too soon: %ll{dur} to go\n", 21600 - v5);
  }
}

- (void)_updatePairedDeviceIdentities
{
  id v3;
  _QWORD v4[6];

  if (dword_100130F48 <= 30 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _updatePairedDeviceIdentities]", 30, "Get paired peers\n");
  v3 = objc_alloc_init((Class)CUPairingManager);
  objc_msgSend(v3, "setDispatchQueue:", self->_dispatchQueue);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006615C;
  v4[3] = &unk_1001130D8;
  v4[4] = v3;
  v4[5] = self;
  objc_msgSend(v3, "getPairedPeersWithOptions:completion:", 134, v4);

}

- (void)_updateSameAccountIdentities
{
  void *v3;
  id v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  id v11;
  void *j;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *k;
  void *v19;
  unsigned int v20;
  unsigned int v21;
  id v22;
  id v23;
  id v24;
  int v25;
  uint64_t v26;
  void *m;
  void *v28;
  _BOOL4 v31;
  void *v32;
  RPIdentityDaemon *v33;
  void *v34;
  id obj;
  int v36;
  int v37;
  uint64_t v38;
  id *location;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];

  v56 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon _identitiesOfType:error:](self, "_identitiesOfType:error:", 2, &v56));
  v4 = v56;
  if (v4)
  {
    if (dword_100130F48 <= 90
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _updateSameAccountIdentities]", 90, "### Get same account device identities failed: %{error}\n", v4);
    }
    goto LABEL_84;
  }
  v33 = self;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  location = (id *)&self->_sameAccountDeviceIdentities;
  v5 = self->_sameAccountDeviceIdentities;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v53 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i), "setPresent:", 0);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v7);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v34 = v3;
  obj = v3;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
  if (v10)
  {
    v11 = v10;
    v36 = 0;
    v37 = 0;
    v38 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(_QWORD *)v49 != v38)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)j);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v14 = *location;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v45;
          while (2)
          {
            for (k = 0; k != v16; k = (char *)k + 1)
            {
              if (*(_QWORD *)v45 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)k);
              v20 = objc_msgSend(v19, "compareWithRPIdentity:", v13);
              if ((v20 & 0x220) == 0)
              {
                v21 = v20;
                objc_msgSend(v19, "setPresent:", 1);
                if (v21)
                {
                  ++v36;
                  if (dword_100130F48 <= 30
                    && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
                  {
                    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _updateSameAccountIdentities]", 30, "Updated same account identity: %@\n", v13);
                  }
                }

                goto LABEL_36;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
            if (v16)
              continue;
            break;
          }
        }

        ++v37;
        if (dword_100130F48 <= 30
          && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
        {
          LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _updateSameAccountIdentities]", 30, "Added same account identity: %@\n", v13);
        }
LABEL_36:
        ;
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    }
    while (v11);
  }
  else
  {
    v36 = 0;
    v37 = 0;
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v22 = *location;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
  if (v23)
  {
    v24 = v23;
    v25 = 0;
    v26 = *(_QWORD *)v41;
    do
    {
      for (m = 0; m != v24; m = (char *)m + 1)
      {
        if (*(_QWORD *)v41 != v26)
          objc_enumerationMutation(v22);
        v28 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)m);
        if ((objc_msgSend(v28, "present") & 1) == 0)
        {
          ++v25;
          if (dword_100130F48 <= 30
            && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
          {
            LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _updateSameAccountIdentities]", 30, "Removed same account identity: %@\n", v28);
          }
        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
    }
    while (v24);
  }
  else
  {
    v25 = 0;
  }

  v31 = v37 > 0 || v36 > 0 || v25 > 0;
  if (*location)
  {
    v4 = 0;
    v3 = v34;
    if (v31)
    {
      if (dword_100130F48 <= 30
        && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
      {
        LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _updateSameAccountIdentities]", 30, "Updated same account device identities: %d total, %d added, %d changed, %d removed\n", objc_msgSend(obj, "count"), v37, v36, v25);
      }
      objc_storeStrong(location, v34);
LABEL_81:
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
      objc_msgSend(v32, "postDaemonInfoChanges:", 8);

      -[RPIdentityDaemon _postIdentitiesChangedNotification](v33, "_postIdentitiesChangedNotification");
      goto LABEL_84;
    }
    if (dword_100130F48 <= 10
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 10)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _updateSameAccountIdentities]", 10, "Unchanged same account device identities: %d total\n", objc_msgSend(obj, "count"));
    }
    objc_storeStrong(location, v34);
  }
  else
  {
    v4 = 0;
    v3 = v34;
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _updateSameAccountIdentities]", 30, "Loaded same account device identities: %d total, %d added, %d changed, %d removed\n", objc_msgSend(obj, "count"), v37, v36, v25);
    }
    objc_storeStrong(location, v34);
    if (v31)
      goto LABEL_81;
  }
LABEL_84:

}

- (BOOL)_removeSameAccountIdentityWithIDSIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  unsigned int v18;
  unsigned __int8 v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  id v29;
  uint64_t v30;
  void *v31;
  id *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];

  v6 = a3;
  v38 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon _identitiesOfType:error:](self, "_identitiesOfType:error:", 2, &v38));
  v8 = v38;
  if (v8)
  {
    v9 = v8;
    if (dword_100130F48 <= 90
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _removeSameAccountIdentityWithIDSIdentifier:error:]", 90, "### Get same account device identities failed: %{error}\n", v9);
    }
    v20 = 0;
    v27 = 0;
    if (a4)
    {
LABEL_27:
      v9 = objc_retainAutorelease(v9);
      *a4 = v9;
      v27 = v20;
    }
  }
  else
  {
    v31 = v7;
    v32 = a4;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "idsDeviceID"));
          v18 = objc_msgSend(v17, "isEqualToString:", v6);

          if (v18)
          {
            v33 = v13;
            v19 = -[RPIdentityDaemon removeIdentity:error:](self, "removeIdentity:error:", v16, &v33);
            v9 = v33;

            if ((v19 & 1) != 0)
            {
              v20 = 1;
              v13 = v10;
              goto LABEL_31;
            }
            if (dword_100130F48 <= 90
              && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
            {
              LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _removeSameAccountIdentityWithIDSIdentifier:error:]", 90, "### Failed to remove matching same account device", v9);
            }
            v13 = v9;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        if (v12)
          continue;
        break;
      }
    }
    else
    {
      v13 = 0;
    }

    if (dword_100130F48 <= 90
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _removeSameAccountIdentityWithIDSIdentifier:error:]", 90, "### Failed to find matching same account device");
    }
    v29 = RPErrorF(4294960569, (uint64_t)"Identity not found", v21, v22, v23, v24, v25, v26, v30);
    v9 = (id)objc_claimAutoreleasedReturnValue(v29);
    v20 = 0;
LABEL_31:
    v7 = v31;
    a4 = v32;

    v27 = v20;
    if (v32)
      goto LABEL_27;
  }

  return v27;
}

- (void)_loadSelfIdentity:(BOOL)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  unsigned int v11;
  int v12;
  RPIdentity *selfIdentityCache;
  void *v14;
  id v15;
  id v16;

  if (a3)
    goto LABEL_31;
  if (dword_100130F48 <= 30 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _loadSelfIdentity:]", 30, "SelfIdentity load\n");
  v4 = objc_alloc_init((Class)CUKeychainItem);
  objc_msgSend(v4, "setAccessGroup:", CFSTR("com.apple.rapport"));
  objc_msgSend(v4, "setIdentifier:", CFSTR("SelfIdentity"));
  objc_msgSend(v4, "setSyncType:", 1);
  objc_msgSend(v4, "setType:", CFSTR("RPIdentity-Self"));
  v5 = objc_alloc_init((Class)CUKeychainManager);
  v16 = 0;
  v6 = objc_msgSend(v5, "copyItemMatchingItem:flags:error:", v4, 1, &v16);
  v7 = v16;
  v8 = v7;
  if (v6)
  {
    v9 = objc_alloc_init((Class)RPIdentity);
    v15 = v8;
    objc_msgSend(v9, "updateWithKeychainItem:error:", v6, &v15);
    v10 = v15;

    if (v10
      && dword_100130F48 <= 60
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 60)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _loadSelfIdentity:]", 60, "### Convert SelfIdentity from keychain failed: %{error}\n", v10);
    }
    v11 = -[RPIdentityDaemon _updateSelfIdentityPrivate:create:](self, "_updateSelfIdentityPrivate:create:", v9, 0);
    if ((v11 & 1) != 0)
    {

      v9 = 0;
    }
    else if (!v11)
    {
      if (dword_100130F48 <= 30
        && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
      {
        LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _loadSelfIdentity:]", 30, "SelfIdentity private unchanged\n");
      }
      v12 = 0;
      goto LABEL_27;
    }
    v12 = 1;
    goto LABEL_27;
  }
  if (objc_msgSend(v7, "code") != (id)-25300
    && dword_100130F48 <= 90
    && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
  {
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _loadSelfIdentity:]", 90, "### SelfIdentity find failed: %{error}\n", v8);
  }
  v9 = 0;
  v12 = 0;
  v10 = v8;
LABEL_27:

  if (!v9)
  {
LABEL_31:
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _loadSelfIdentity:]", 30, "SelfIdentity create\n");
    }
    v9 = objc_alloc_init((Class)RPIdentity);
    objc_msgSend(v9, "setIdentifier:", CFSTR("SelfIdentity"));
    objc_msgSend(v9, "setType:", 1);
    -[RPIdentityDaemon _updateSelfIdentityPrivate:create:](self, "_updateSelfIdentityPrivate:create:", v9, 1);
    goto LABEL_36;
  }
  if (v12)
  {
LABEL_36:
    objc_storeStrong((id *)&self->_selfIdentityCache, v9);
    -[RPIdentityDaemon _saveSelfIdentityPrivate:](self, "_saveSelfIdentityPrivate:", v9);
    -[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:](self, "_saveSelfIdentityPublicWithPrivateIdentity:force:", v9, 0);
LABEL_37:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
    objc_msgSend(v14, "postDaemonInfoChanges:", 4);

    -[RPIdentityDaemon _postIdentitiesChangedNotification](self, "_postIdentitiesChangedNotification");
    -[RPIdentityDaemon _update](self, "_update");
    goto LABEL_38;
  }
  selfIdentityCache = self->_selfIdentityCache;
  objc_storeStrong((id *)&self->_selfIdentityCache, v9);
  -[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:](self, "_saveSelfIdentityPublicWithPrivateIdentity:force:", v9, 0);
  if (!selfIdentityCache)
    goto LABEL_37;
LABEL_38:

}

- (void)_saveSelfIdentityPrivate:(id)a3
{
  id v3;
  id v4;
  unsigned __int8 v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a3;
  if (dword_100130F48 <= 30 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _saveSelfIdentityPrivate:]", 30, "SelfIdentity private save\n");
  v4 = objc_alloc_init((Class)CUKeychainItem);
  objc_msgSend(v4, "setAccessGroup:", CFSTR("com.apple.rapport"));
  objc_msgSend(v4, "setAccessibleType:", 6);
  objc_msgSend(v4, "setInvisible:", 1);
  objc_msgSend(v4, "setSyncType:", 1);
  v10 = 0;
  v5 = objc_msgSend(v4, "updateWithRPIdentity:revisionUpdate:error:", v3, 1, &v10);
  v6 = v10;
  if ((v5 & 1) != 0)
  {
    if (dword_100130F48 <= 90
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _saveSelfIdentityPrivate:]", 90, "### SelfIdentity private convert to keychain failed: %@, %{error}\n", v3, v6);
    }
    v8 = v6;
  }
  else
  {
    v7 = objc_alloc_init((Class)CUKeychainManager);
    v9 = v6;
    objc_msgSend(v7, "addOrUpdateOrReAddItem:logCategory:logLabel:error:", v4, &dword_100130F48, CFSTR("SelfIdentity private"), &v9);
    v8 = v9;

    if (v8)
    {
      if (dword_100130F48 <= 90
        && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
      {
        LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _saveSelfIdentityPrivate:]", 90, "### SelfIdentity private save failed: %@, %{error}\n", v4, v8);
      }
    }
    else if (dword_100130F48 <= 30
           && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _saveSelfIdentityPrivate:]", 30, "SelfIdentity private saved\n");
    }

  }
}

- (void)_saveSelfIdentityPublicWithPrivateIdentity:(id)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  unsigned int v15;
  uint64_t v16;
  id v17;
  unsigned __int8 v18;
  id v19;
  RPIdentityDaemon *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "idsDeviceID"));
  if (v7)
  {
    v8 = objc_alloc_init((Class)CUKeychainItem);
    objc_msgSend(v8, "setAccessGroup:", CFSTR("com.apple.rapport"));
    objc_msgSend(v8, "setIdentifier:", v7);
    objc_msgSend(v8, "setSyncType:", 2);
    objc_msgSend(v8, "setType:", CFSTR("RPIdentity-SameAccountDevice"));
    v9 = kSecAttrViewHintHome;
    objc_msgSend(v8, "setViewHint:", kSecAttrViewHintHome);
    v26 = 0;
    v22 = objc_alloc_init((Class)CUKeychainManager);
    v10 = objc_msgSend(v22, "copyItemMatchingItem:flags:error:", v8, 1, &v26);
    v11 = v26;
    v12 = v11;
    v21 = v10;
    if (v10)
    {
      v13 = objc_alloc_init((Class)RPIdentity);
      v25 = v12;
      objc_msgSend(v13, "updateWithKeychainItem:error:", v10, &v25);
      v14 = v25;

      if (v14
        && dword_100130F48 <= 60
        && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 60)))
      {
        LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:]", 60, "### Convert SelfIdentity public from keychain failed: %{error}\n", v14);
      }
      v15 = -[RPIdentityDaemon _updateSelfIdentityPublic:privateIdentity:](self, "_updateSelfIdentityPublic:privateIdentity:", v13, v6);
      if ((v15 & 1) != 0)
      {

        v12 = v14;
      }
      else
      {
        v12 = v14;
        if (v13)
        {
LABEL_26:
          v20 = self;
          if (v4)
            v16 = v15 | 0x1000;
          else
            v16 = v15;
          if ((_DWORD)v16)
          {
            v17 = objc_alloc_init((Class)CUKeychainItem);
            objc_msgSend(v17, "setAccessGroup:", CFSTR("com.apple.rapport"));
            objc_msgSend(v17, "setAccessibleType:", 2);
            objc_msgSend(v17, "setInvisible:", 1);
            objc_msgSend(v17, "setSyncType:", 2);
            objc_msgSend(v17, "setViewHint:", v9);
            v24 = v14;
            v18 = objc_msgSend(v17, "updateWithRPIdentity:revisionUpdate:error:", v13, 1, &v24);
            v19 = v24;

            if ((v18 & 1) != 0)
            {
              if (dword_100130F48 <= 90
                && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
              {
                LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:]", 90, "### SelfIdentity public convert to keychain failed: %@, %{error}\n", v13, v19);
              }
            }
            else
            {

              v23 = 0;
              objc_msgSend(v22, "addOrUpdateOrReAddItem:logCategory:logLabel:error:", v17, &dword_100130F48, CFSTR("SelfIdentity public"), &v23);
              v19 = v23;
              if (v19)
              {
                if (dword_100130F48 <= 90
                  && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
                {
                  LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:]", 90, "### SelfIdentity public save failed: %@, %{error}\n", v17, v19);
                }
              }
              else if (dword_100130F48 <= 30
                     && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
              {
                LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:]", 30, "SelfIdentity public saved: %#{flags}\n", v16, &unk_10010A807);
              }
              -[RPIdentityDaemon _updateSameAccountIdentities](v20, "_updateSameAccountIdentities");
            }

            v14 = v19;
          }
          else if (dword_100130F48 <= 30
                 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
          {
            LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:]", 30, "SelfIdentity public unchanged\n");
          }

          goto LABEL_56;
        }
      }
    }
    else if (objc_msgSend(v11, "code") != (id)-25300)
    {
      if (dword_100130F48 > 90)
      {
LABEL_25:
        v13 = objc_alloc_init((Class)RPIdentity);
        objc_msgSend(v13, "setIdentifier:", v7);
        objc_msgSend(v13, "setType:", 2);
        -[RPIdentityDaemon _updateSelfIdentityPublic:privateIdentity:](self, "_updateSelfIdentityPublic:privateIdentity:", v13, v6);
        v15 = 2048;
        v14 = v12;
        goto LABEL_26;
      }
      if (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90))
        LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:]", 90, "### SelfIdentity public find error: %{error}\n", v12);
    }
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:]", 30, "SelfIdentity public create\n");
    }
    goto LABEL_25;
  }
  if (dword_100130F48 <= 90 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _saveSelfIdentityPublicWithPrivateIdentity:force:]", 90, "### SelfIdentity save public failed without IDSDeviceID\n");
LABEL_56:

}

- (void)_removeSelfIdentityPublicWithPrivateIdentity:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "idsDeviceID"));
  if (v4)
  {
    v5 = objc_alloc_init((Class)CUKeychainItem);
    objc_msgSend(v5, "setAccessGroup:", CFSTR("com.apple.rapport"));
    objc_msgSend(v5, "setIdentifier:", v4);
    objc_msgSend(v5, "setSyncType:", 2);
    objc_msgSend(v5, "setType:", CFSTR("RPIdentity-SameAccountDevice"));
    objc_msgSend(v5, "setViewHint:", kSecAttrViewHintHome);
    v6 = objc_alloc_init((Class)CUKeychainManager);
    v8 = 0;
    objc_msgSend(v6, "removeItemMatchingItem:error:", v5, &v8);
    v7 = v8;
    if (objc_msgSend(v7, "code") == (id)-25300)
    {
      if (dword_100130F48 <= 30
        && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
      {
        LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _removeSelfIdentityPublicWithPrivateIdentity:]", 30, "SelfIdentity public removed: %s\n");
      }
    }
    else if (dword_100130F48 <= 90
           && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _removeSelfIdentityPublicWithPrivateIdentity:]", 90, "### SelfIdentity public find error: %{error}\n", v7);
    }
    -[RPIdentityDaemon _updateSameAccountIdentities](self, "_updateSameAccountIdentities");

  }
  else if (dword_100130F48 <= 90
         && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
  {
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _removeSelfIdentityPublicWithPrivateIdentity:]", 90, "### SelfIdentity save public failed without IDSDeviceID\n");
  }

}

- (void)_loadTemporarySelfIdentity
{
  RPIdentity *v3;
  RPIdentity *temporarySelfIdentityCache;
  void *v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *adHocPairedDeviceIdentities;
  void *v9;
  OS_dispatch_source *temporarySelfIdentityTimer;
  NSObject *v11;
  OS_dispatch_source *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  OS_dispatch_source *v22;
  OS_dispatch_source *v23;
  NSObject *v24;
  _QWORD handler[6];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (_os_feature_enabled_impl("Sharing", "AskToAirDrop"))
  {
    if (!self->_temporarySelfIdentityCache)
    {
      if (dword_100130F48 <= 30
        && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
      {
        LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _loadTemporarySelfIdentity]", 30, "Generating temporary self identity");
      }
      v3 = (RPIdentity *)objc_msgSend(objc_alloc((Class)RPIdentity), "initWithType:", 14);
      temporarySelfIdentityCache = self->_temporarySelfIdentityCache;
      self->_temporarySelfIdentityCache = v3;

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_adHocPairingIdentifier, "UUIDString"));
      -[RPIdentity setIdentifier:](self->_temporarySelfIdentityCache, "setIdentifier:", v5);

    }
    v6 = NSRandomData(16, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[RPIdentity setDeviceIRKData:](self->_temporarySelfIdentityCache, "setDeviceIRKData:", v7);

    if (-[NSMutableArray count](self->_adHocPairedDeviceIdentities, "count"))
    {
      if (dword_100130F48 <= 30
        && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
      {
        LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _loadTemporarySelfIdentity]", 30, "Removing %d ad-hoc paired identities", -[NSMutableArray count](self->_adHocPairedDeviceIdentities, "count"));
      }
      adHocPairedDeviceIdentities = self->_adHocPairedDeviceIdentities;
      self->_adHocPairedDeviceIdentities = 0;

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
      objc_msgSend(v9, "postDaemonInfoChanges:", 0x4000);

    }
    temporarySelfIdentityTimer = self->_temporarySelfIdentityTimer;
    if (temporarySelfIdentityTimer)
    {
      v11 = temporarySelfIdentityTimer;
      dispatch_source_cancel(v11);
      v12 = self->_temporarySelfIdentityTimer;
      self->_temporarySelfIdentityTimer = 0;

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startOfDayForDate:", v13));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dateByAddingUnit:value:toDate:options:", 16, 1, v15, 0));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startOfDayForDate:", v17));

      objc_msgSend(v19, "timeIntervalSinceDate:", v13);
      v21 = v20;

    }
    else
    {
      v21 = 7200.0;
      if (dword_100130F48 <= 90
        && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
      {
        LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _loadTemporarySelfIdentity]", 90, "Could not compute tomorrow's date, falling back to 2 hour expiration time.");
      }
    }
    v22 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    v23 = self->_temporarySelfIdentityTimer;
    self->_temporarySelfIdentityTimer = v22;
    v24 = v22;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100067DD8;
    handler[3] = &unk_100111928;
    handler[4] = v24;
    handler[5] = self;
    dispatch_source_set_event_handler(v24, handler);
    CUDispatchTimerSetEx(v24, 1, v21, -1.0, 1.0);
    dispatch_activate(v24);
    -[RPIdentityDaemon _postIdentitiesChangedNotification](self, "_postIdentitiesChangedNotification");

  }
}

- (BOOL)_stationaryDevice
{
  int DeviceClass;
  BOOL v3;
  void *v4;
  int v5;
  char v6;

  DeviceClass = GestaltGetDeviceClass(self, a2);
  v3 = sub_100018144(DeviceClass);
  v4 = (void *)GestaltCopyAnswer(CFSTR("ProductType"), 0, 0);
  if (objc_msgSend(v4, "containsString:", CFSTR("Mac")))
    v5 = MGGetBoolAnswer(CFSTR("pX2TxZTxWKS7QSXZDC/Z6A")) ^ 1;
  else
    LOBYTE(v5) = 0;
  v6 = v3 | v5;

  return v6;
}

- (unsigned)_updateSelfIdentityPrivate:(id)a3 create:(BOOL)a4
{
  id v5;
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
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  unsigned int DeviceClass;
  unsigned int v34;
  unsigned int v35;
  unint64_t v36;
  int v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  _BYTE v48[32];
  _BYTE v49[32];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPCompanionLinkDaemon sharedCompanionLinkDaemon](RPCompanionLinkDaemon, "sharedCompanionLinkDaemon"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localDeviceInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountAltDSID"));

  if (v8 && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountAltDSID")), v9, !v9))
  {
    objc_msgSend(v5, "setAccountAltDSID:", v8);
    v10 = 0x2000000;
  }
  else
  {
    v10 = 0;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RPCompanionLinkDaemon sharedCompanionLinkDaemon](RPCompanionLinkDaemon, "sharedCompanionLinkDaemon"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localDeviceInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountID"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountID"));

    if (!v14)
    {
      objc_msgSend(v5, "setAccountID:", v13);
      v10 = v10 | 0x2000;
    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsDeviceID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "idsDeviceIDSelf"));

  if (!v17)
  {
LABEL_15:
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceIRKData"));
    v23 = objc_msgSend(v22, "length");

    if (v23 != (id)16)
    {
      v24 = NSRandomData(16, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      objc_msgSend(v5, "setDeviceIRKData:", v25);

      v10 = v10 | 4;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "edPKData"));
    if (objc_msgSend(v26, "length") == (id)32)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "edSKData"));
      v28 = objc_msgSend(v27, "length");

      if (v28 == (id)32)
        goto LABEL_22;
    }
    else
    {

    }
    cced25519_make_key_pair_compat(v49, v48);
    v29 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v49, 32);
    objc_msgSend(v5, "setEdPKData:", v29);

    v30 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v48, 32);
    objc_msgSend(v5, "setEdSKData:", v30);

    v10 = v10 | 0x18;
LABEL_22:
    v31 = objc_msgSend(v5, "featureFlags");
    DeviceClass = GestaltGetDeviceClass(v31, v32);
    v34 = DeviceClass;
    v35 = DeviceClass - 1;
    v36 = DeviceClass - 1 < 3 || DeviceClass == 100;
    if (DeviceClass <= 6 && ((1 << DeviceClass) & 0x4E) != 0 || DeviceClass == 100)
      v36 |= 2uLL;
    if (DeviceClass <= 4 && ((1 << DeviceClass) & 0x1A) != 0)
      v36 |= 0x20uLL;
    v37 = _os_feature_enabled_impl("Sharing", "AirDropPrivateContactDiscovery");
    if (v35 < 3 || v34 == 100 && v37)
    {
      v38 = _os_feature_enabled_impl("Sharing", "AirDropFeatureFlags");
      v39 = 8;
      if (v38)
        v39 = 24;
      v36 |= v39;
    }
    if (v36 && (id)v36 != v31)
    {
      objc_msgSend(v5, "setFeatureFlags:", v36);
      v10 = v10 | 0x400;
    }
    if (-[RPIdentityDaemon _stationaryDevice](self, "_stationaryDevice"))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "btIRKData"));
      if (objc_msgSend(v40, "length") == (id)16)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "btAddress"));
        v42 = objc_msgSend(v41, "length");

        if (v42 == (id)7)
          goto LABEL_44;
      }
      else
      {

      }
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CBPeripheralManager getNonConnectableIdentity](self->_peripheralManager, "getNonConnectableIdentity"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIdentityIRK")));
      objc_msgSend(v5, "setBtIRKData:", v44);

      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIdentityAddress")));
      objc_msgSend(v5, "setBtAddress:", v45);

      v10 = v10 | 0xC00000;
LABEL_48:
      if (dword_100130F48 <= 30
        && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
      {
        LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _updateSelfIdentityPrivate:create:]", 30, "SelfIdentity updated: %#{flags}\n", v10, &unk_10010A807);
      }
      goto LABEL_60;
    }
LABEL_44:
    if (!(_DWORD)v10)
      goto LABEL_60;
    goto LABEL_48;
  }
  v18 = v17;
  v19 = v15;
  v20 = v19;
  if (v18 == v19)
  {

    goto LABEL_15;
  }
  if (v19)
  {
    v21 = objc_msgSend(v18, "isEqual:", v19);

    if ((v21 & 1) != 0)
      goto LABEL_15;
    if (a4)
      goto LABEL_13;
  }
  else
  {

    if (a4)
    {
LABEL_13:
      objc_msgSend(v5, "setIdsDeviceID:", v18);
      v10 = v10 | 0x40;
      goto LABEL_15;
    }
  }
  if (dword_100130F48 <= 60 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 60)))
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _updateSelfIdentityPrivate:create:]", 60, "SelfIdentity reset on IDSDeviceID change: %@ -> %@\n", v20, v18);
  LODWORD(v10) = 1;
LABEL_60:

  return v10;
}

- (unsigned)_updateSelfIdentityPublic:(id)a3 privateIdentity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  unsigned __int8 v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  unsigned __int8 v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  unsigned __int8 v45;
  void *v46;
  unsigned int v47;
  id v48;
  id v49;
  void *v50;
  unsigned __int8 v51;
  void *v52;
  unsigned int v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  unsigned __int8 v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPCompanionLinkDaemon sharedCompanionLinkDaemon](RPCompanionLinkDaemon, "sharedCompanionLinkDaemon"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localDeviceInfo"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountAltDSID"));
  if (v9
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountAltDSID")), v10, !v10))
  {
    objc_msgSend(v5, "setAccountAltDSID:", v9);
    v11 = 0x2000000;
  }
  else
  {
    v11 = 0;
  }
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountID"));
  if (v64)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountID"));

    if (!v12)
    {
      objc_msgSend(v5, "setAccountID:", v64);
      v11 |= 0x2000u;
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceIRKData"));
  if (v13)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceIRKData"));
    v15 = v13;
    v16 = v15;
    if (v14 == v15)
    {

      goto LABEL_16;
    }
    if (v14)
    {
      v17 = objc_msgSend(v14, "isEqual:", v15);

      if ((v17 & 1) != 0)
        goto LABEL_16;
    }
    else
    {

    }
    objc_msgSend(v5, "setDeviceIRKData:", v16);
    v11 |= 4u;
  }
LABEL_16:
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "edPKData"));
  if (v18)
  {
    v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "edPKData"));
    v20 = v18;
    v21 = v20;
    if (v19 == v20)
    {

    }
    else
    {
      if (v19)
      {
        v22 = objc_msgSend(v19, "isEqual:", v20);

        if ((v22 & 1) != 0)
          goto LABEL_24;
      }
      else
      {

      }
      objc_msgSend(v5, "setEdPKData:", v21);
      v11 |= 8u;
    }
  }
LABEL_24:
  v23 = objc_msgSend(v6, "featureFlags");
  if (v23)
  {
    v24 = v23;
    if (objc_msgSend(v5, "featureFlags") != v23)
    {
      objc_msgSend(v5, "setFeatureFlags:", v24);
      v11 |= 0x400u;
    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mediaRemoteIdentifier"));
  v66 = v25;
  if (objc_msgSend(v25, "length"))
  {
    v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaRemoteID"));
    v27 = v25;
    v28 = v27;
    if (v26 == v27)
    {

      goto LABEL_36;
    }
    if ((v27 != 0) == (v26 == 0))
    {

    }
    else
    {
      v29 = objc_msgSend(v26, "isEqual:", v27);

      if ((v29 & 1) != 0)
        goto LABEL_35;
    }
    objc_msgSend(v5, "setMediaRemoteID:", v28);
    v11 |= 0x10000u;
LABEL_35:
    v25 = v66;
  }
LABEL_36:
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mediaRouteIdentifier"));
  v65 = v30;
  if (!objc_msgSend(v30, "length"))
    goto LABEL_46;
  v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaRouteID"));
  v32 = v30;
  v33 = v32;
  if (v31 != v32)
  {
    if ((v32 != 0) == (v31 == 0))
    {

    }
    else
    {
      v34 = objc_msgSend(v31, "isEqual:", v32);

      if ((v34 & 1) != 0)
        goto LABEL_44;
    }
    objc_msgSend(v5, "setMediaRouteID:", v33);
    v11 |= 0x20000u;
LABEL_44:
    v25 = v66;
    goto LABEL_45;
  }

LABEL_45:
  v30 = v65;
LABEL_46:
  v35 = GestaltCopyAnswer(CFSTR("ProductType"), 0, 0);
  v63 = v13;
  v61 = (void *)v35;
  if (!v35)
    goto LABEL_55;
  v36 = (void *)v35;
  v37 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "model"));
  v38 = v36;
  v39 = v38;
  if (v37 == v38)
  {

    goto LABEL_55;
  }
  if (v37)
  {
    v40 = objc_msgSend(v37, "isEqual:", v38);

    if ((v40 & 1) != 0)
      goto LABEL_54;
  }
  else
  {

  }
  objc_msgSend(v5, "setModel:", v39);
  v11 |= 0x80u;
LABEL_54:
  v25 = v66;
LABEL_55:
  v41 = (void *)GestaltCopyAnswer(CFSTR("UserAssignedDeviceName"), 0, 0);
  v62 = v18;
  if (!v41)
    goto LABEL_64;
  v42 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v43 = v41;
  v44 = v43;
  if (v42 == v43)
  {

    goto LABEL_64;
  }
  if (v42)
  {
    v45 = objc_msgSend(v42, "isEqual:", v43);

    if ((v45 & 1) != 0)
      goto LABEL_63;
  }
  else
  {

  }
  objc_msgSend(v5, "setName:", v44);
  v11 |= 0x100u;
LABEL_63:
  v25 = v66;
LABEL_64:
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "btIRKData"));
  if (!v46)
    goto LABEL_74;
  v47 = v11;
  v48 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "btIRKData"));
  v49 = v46;
  v50 = v49;
  if (v48 != v49)
  {
    if (v48)
    {
      v51 = objc_msgSend(v48, "isEqual:", v49);

      if ((v51 & 1) != 0)
      {
        v11 = v47;
LABEL_72:
        v25 = v66;
        goto LABEL_73;
      }
    }
    else
    {

    }
    objc_msgSend(v5, "setBtIRKData:", v50);
    v11 = v47 | 0x400000;
    goto LABEL_72;
  }

  v11 = v47;
LABEL_73:
  v30 = v65;
LABEL_74:
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "btAddress"));
  if (v52)
  {
    v53 = v11;
    v54 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "btAddress"));
    v55 = v52;
    v56 = v55;
    if (v54 != v55)
    {
      v60 = v9;
      v57 = v6;
      if (v54)
      {
        v58 = objc_msgSend(v54, "isEqual:", v55);

        v25 = v66;
        if ((v58 & 1) != 0)
        {
          v6 = v57;
          v9 = v60;
          v11 = v53;
LABEL_82:
          v30 = v65;
          goto LABEL_83;
        }
      }
      else
      {

        v25 = v66;
      }
      objc_msgSend(v5, "setBtAddress:", v56);
      v11 = v53 | 0x800000;
      v6 = v57;
      v9 = v60;
      goto LABEL_82;
    }

    v11 = v53;
    v25 = v66;
    goto LABEL_82;
  }
LABEL_83:

  return v11;
}

- (void)_enumerateIdentitiesWithFlag:(unsigned int)a3 usingBlock:(id)a4
{
  __int16 v4;
  void (**v6)(id, _QWORD, char *);
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
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
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  char v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];

  v4 = a3;
  v6 = (void (**)(id, _QWORD, char *))a4;
  v72 = 0;
  if ((v4 & 2) != 0)
  {
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v7 = self->_sameAccountDeviceIdentities;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v69;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v69 != v10)
          objc_enumerationMutation(v7);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v11), &v72);
        if (v72)
          goto LABEL_80;
        if (v9 == (id)++v11)
        {
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  if ((v4 & 0x100) != 0)
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 9, 0));
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v65;
LABEL_14:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v65 != v14)
          objc_enumerationMutation(v7);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v15), &v72);
        if (v72)
          goto LABEL_80;
        if (v13 == (id)++v15)
        {
          v13 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
          if (v13)
            goto LABEL_14;
          break;
        }
      }
    }

  }
  if ((v4 & 8) != 0)
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 4, 0));
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v60, v78, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v61;
LABEL_24:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v61 != v18)
          objc_enumerationMutation(v7);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v19), &v72);
        if (v72)
          goto LABEL_80;
        if (v17 == (id)++v19)
        {
          v17 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v60, v78, 16);
          if (v17)
            goto LABEL_24;
          break;
        }
      }
    }

  }
  if ((v4 & 0x20) != 0)
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 6, 0));
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v56, v77, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v57;
LABEL_34:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v57 != v22)
          objc_enumerationMutation(v7);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v23), &v72);
        if (v72)
          goto LABEL_80;
        if (v21 == (id)++v23)
        {
          v21 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v56, v77, 16);
          if (v21)
            goto LABEL_34;
          break;
        }
      }
    }

  }
  if ((v4 & 0x400) != 0)
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 12, 0));
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v52, v76, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v53;
LABEL_44:
      v27 = 0;
      while (1)
      {
        if (*(_QWORD *)v53 != v26)
          objc_enumerationMutation(v7);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v27), &v72);
        if (v72)
          goto LABEL_80;
        if (v25 == (id)++v27)
        {
          v25 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v52, v76, 16);
          if (v25)
            goto LABEL_44;
          break;
        }
      }
    }

  }
  if ((v4 & 0x80) != 0)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 8, 0));
    v28 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v75, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v49;
LABEL_54:
      v31 = 0;
      while (1)
      {
        if (*(_QWORD *)v49 != v30)
          objc_enumerationMutation(v7);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v31), &v72);
        if (v72)
          goto LABEL_80;
        if (v29 == (id)++v31)
        {
          v29 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v75, 16);
          if (v29)
            goto LABEL_54;
          break;
        }
      }
    }

  }
  if ((v4 & 0x800) != 0)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 13, 0));
    v32 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v44, v74, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v45;
LABEL_64:
      v35 = 0;
      while (1)
      {
        if (*(_QWORD *)v45 != v34)
          objc_enumerationMutation(v7);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v35), &v72);
        if (v72)
          goto LABEL_80;
        if (v33 == (id)++v35)
        {
          v33 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v44, v74, 16);
          if (v33)
            goto LABEL_64;
          break;
        }
      }
    }

  }
  if ((v4 & 0x4000) != 0)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RPIdentityDaemon identitiesOfType:error:](self, "identitiesOfType:error:", 15, 0, 0));
    v36 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v40, v73, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v41;
LABEL_74:
      v39 = 0;
      while (1)
      {
        if (*(_QWORD *)v41 != v38)
          objc_enumerationMutation(v7);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v39), &v72);
        if (v72)
          break;
        if (v37 == (id)++v39)
        {
          v37 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v40, v73, 16);
          if (v37)
            goto LABEL_74;
          break;
        }
      }
    }
LABEL_80:

  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSUUID)sessionPairingIdentifier
{
  return self->_sessionPairingIdentifier;
}

- (NSUUID)adHocPairingIdentifier
{
  return self->_adHocPairingIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adHocPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitIdentity, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_temporarySelfIdentityTimer, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);
  objc_storeStrong((id *)&self->_adHocPairedDeviceIdentities, 0);
  objc_storeStrong((id *)&self->_sessionPairedDeviceIdentities, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_sharedTVUserDeviceIdentities, 0);
  objc_storeStrong((id *)&self->_sharedHomeExtraDeviceIdentities, 0);
  objc_storeStrong((id *)&self->_sharedHomeDeviceIdentities, 0);
  objc_storeStrong((id *)&self->_temporarySelfIdentityCache, 0);
  objc_storeStrong((id *)&self->_selfIdentityCache, 0);
  objc_storeStrong((id *)&self->_sameAccountDeviceIdentities, 0);
  objc_storeStrong((id *)&self->_pairedDeviceIdentities, 0);
  objc_storeStrong((id *)&self->_identitiesChangedCoalescer, 0);
}

@end
