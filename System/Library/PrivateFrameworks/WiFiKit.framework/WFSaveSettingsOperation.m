@implementation WFSaveSettingsOperation

- (WFSaveSettingsOperation)initWithSSID:(id)a3 interfaceName:(id)a4 settings:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFSaveSettingsOperation *v11;
  WFSaveSettingsOperation *v12;
  uint64_t v13;
  NSString *ssid;
  uint64_t v15;
  NSString *interfaceName;
  SCPreferencesRef v17;
  uint64_t v18;
  WFSaveSettingsOperation *name;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)WFSaveSettingsOperation;
  v11 = -[WFSaveSettingsOperation init](&v21, sel_init);
  v12 = v11;
  if (!v8)
    goto LABEL_8;
  if (!v11)
  {
    name = 0;
    goto LABEL_7;
  }
  v13 = objc_msgSend(v8, "copy");
  ssid = v12->_ssid;
  v12->_ssid = (NSString *)v13;

  if (!v9)
    goto LABEL_8;
  v15 = objc_msgSend(v9, "copy");
  interfaceName = v12->_interfaceName;
  v12->_interfaceName = (NSString *)v15;

  if (v10
    && (objc_storeStrong((id *)&v12->_settings, a5),
        v17 = SCPreferencesCreateWithAuthorization(0, CFSTR("com.apple.wifikit"), 0, 0),
        (v12->_prefs = v17) != 0))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Save settings for '%@'"), v12->_ssid);
    v18 = objc_claimAutoreleasedReturnValue();
    name = (WFSaveSettingsOperation *)v12->_name;
    v12->_name = (NSString *)v18;
  }
  else
  {
LABEL_8:
    name = v12;
    v12 = 0;
  }
LABEL_7:

  return v12;
}

- (void)dealloc
{
  __SCPreferences *prefs;
  objc_super v4;

  prefs = self->_prefs;
  if (prefs)
  {
    CFRelease(prefs);
    self->_prefs = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WFSaveSettingsOperation;
  -[WFSaveSettingsOperation dealloc](&v4, sel_dealloc);
}

- (void)start
{
  WFSaveSettingsOperation *v2;
  void *v3;
  os_log_type_t v4;
  NSObject *v5;
  char *v6;
  void *v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  const __CFArray *v16;
  const __CFArray *v17;
  NSString *v18;
  CFIndex Count;
  CFIndex v20;
  CFIndex v21;
  const __SCNetworkSet *ValueAtIndex;
  void *v23;
  os_log_type_t v24;
  NSObject *v25;
  NSString *v26;
  char *v27;
  const __SCNetworkSet *v28;
  NSObject *v29;
  os_log_type_t v30;
  void *v31;
  void *v32;
  const __SCNetworkSet *v33;
  NSString *v34;
  const __SCNetworkSet *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  char *v41;
  id v42;
  void *v43;
  void *v44;
  char v45;
  const __CFArray *v46;
  NSObject *v47;
  os_log_type_t v48;
  NSObject *v49;
  os_log_type_t v50;
  BOOL v51;
  int v52;
  void *v53;
  const __CFArray *v54;
  const __CFArray *v55;
  CFIndex v56;
  const __SCNetworkService *v57;
  const __SCNetworkInterface *Interface;
  void *v59;
  int v60;
  const __CFArray *v61;
  NSObject *v62;
  os_log_type_t v63;
  void *v64;
  const __CFArray *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i;
  void *v70;
  __CFString *v71;
  const __SCNetworkProtocol *v72;
  void *v73;
  int v74;
  void *v75;
  os_log_type_t v76;
  NSObject *v77;
  char *v78;
  const __CFArray *v79;
  const __CFDictionary *v80;
  int v81;
  void *v82;
  os_log_type_t v83;
  NSObject *v84;
  char *v85;
  const __CFArray *v86;
  int v87;
  const char *v88;
  void *v89;
  os_log_type_t v90;
  NSObject *v91;
  int v92;
  const char *v93;
  NSObject *v94;
  os_log_type_t v95;
  NSObject *v96;
  os_log_type_t v97;
  void *v98;
  os_log_type_t v99;
  NSObject *v100;
  int v101;
  const char *v102;
  void *v103;
  os_log_type_t v104;
  NSObject *v105;
  int v106;
  const char *v107;
  const char *v108;
  os_log_type_t v109;
  const __SCNetworkSet *v110;
  NSObject *v111;
  int v112;
  const char *v113;
  void *v114;
  os_log_type_t v115;
  NSObject *v116;
  int v117;
  const char *v118;
  const __CFArray *v119;
  NSString *v120;
  const __SCNetworkSet *set;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  WFSaveSettingsOperation *v127;
  uint64_t v128;
  id obj;
  uint64_t v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  id v135;
  objc_super v136;
  uint8_t buf[4];
  const char *v138;
  __int16 v139;
  const __CFArray *v140;
  __int16 v141;
  const char *v142;
  _BYTE v143[128];
  uint64_t v144;
  _QWORD v145[3];

  v2 = self;
  v145[1] = *MEMORY[0x24BDAC8D0];
  v136.receiver = self;
  v136.super_class = (Class)WFSaveSettingsOperation;
  -[WFOperation start](&v136, sel_start);
  WFLogForCategory(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      -[WFSaveSettingsOperation ssid](v2, "ssid");
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v138 = v6;
      _os_log_impl(&dword_219FC8000, v5, v4, "Starting persisting settings for ssid: %@", buf, 0xCu);

    }
  }

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE29F18]), "initWithServiceType:", 1);
  objc_msgSend(v7, "activate");
  v8 = v2->_interfaceName;
  v125 = v7;
  objc_msgSend(v7, "userSettings");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "OSSpecificAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BE67E48];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE67E48]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v126 = v11;
  if (!v11
    || (-[WFSaveSettingsOperation ssid](v2, "ssid"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "objectForKey:", v12),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
    WFLogForCategory(0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v23)
    {
      v25 = v23;
      if (os_log_type_enabled(v25, v24))
      {
        -[WFSaveSettingsOperation ssid](v2, "ssid");
        v26 = v8;
        v27 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v138 = v27;
        _os_log_impl(&dword_219FC8000, v25, v24, "No existing custom network settings for ssid: %@", buf, 0xCu);

        v8 = v26;
      }

    }
    v13 = 0;
LABEL_30:
    if (SCPreferencesLock(v2->_prefs, 0) || (SCPreferencesSynchronize(v2->_prefs), SCPreferencesLock(v2->_prefs, 1u)))
    {
      v31 = (void *)objc_msgSend(v11, "mutableCopy");
      if (!v31)
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[WFSaveSettingsOperation ssid](v2, "ssid");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[WFSaveSettingsOperation _createNewSetForNetworkNamed:interfaceName:](v2, "_createNewSetForNetworkNamed:interfaceName:", v32, v8);

      if (v33)
      {
        v34 = v8;
        v35 = v33;
        SCNetworkSetGetSetID(v33);
        v36 = objc_claimAutoreleasedReturnValue();

        -[WFSaveSettingsOperation ssid](v2, "ssid");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKey:", v36, v37);

        SCPreferencesCommitChanges(v2->_prefs);
        SCPreferencesApplyChanges(v2->_prefs);
        v13 = (void *)v36;
      }
      else
      {
        v35 = 0;
        v34 = v8;
        WFLogForCategory(0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v38)
        {
          v40 = v38;
          if (os_log_type_enabled(v40, (os_log_type_t)v39))
          {
            -[WFSaveSettingsOperation ssid](v2, "ssid");
            v123 = v13;
            v41 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v138 = v41;
            _os_log_impl(&dword_219FC8000, v40, (os_log_type_t)v39, "Failed to create new set for network named %{public}@", buf, 0xCu);

            v13 = v123;
          }

        }
      }
      SCPreferencesUnlock(v2->_prefs);
      SCPreferencesSynchronize(v2->_prefs);
      v42 = objc_alloc_init(MEMORY[0x24BE29F38]);
      v144 = v10;
      v145[0] = v31;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v145, &v144, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setOSSpecificAttributes:", v43);

      v135 = 0;
      v44 = v125;
      v45 = objc_msgSend(v125, "applyUserSettings:properties:error:", v42, 0, &v135);
      v46 = (const __CFArray *)v135;
      if ((v45 & 1) == 0)
      {
        WFLogForCategory(0);
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v47 && os_log_type_enabled(v47, v48))
        {
          *(_DWORD *)buf = 138412546;
          v138 = (const char *)v31;
          v139 = 2112;
          v140 = v46;
          _os_log_impl(&dword_219FC8000, v47, v48, "failed to apply custom network set %@, error='%@'", buf, 0x16u);
        }

        v44 = v125;
      }

      v8 = v34;
      if (v35)
      {
        v28 = v35;
        goto LABEL_50;
      }
    }
    else
    {
      WFLogForCategory(0);
      v94 = objc_claimAutoreleasedReturnValue();
      v95 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v94 && os_log_type_enabled(v94, v95))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219FC8000, v94, v95, "Failed to get SCPreferencesLock", buf, 2u);
      }

      v44 = v125;
    }
    WFLogForCategory(0);
    v96 = objc_claimAutoreleasedReturnValue();
    v97 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v96 && os_log_type_enabled(v96, v97))
    {
      *(_DWORD *)buf = 138543362;
      v138 = (const char *)v13;
      _os_log_impl(&dword_219FC8000, v96, v97, "Failed to get SCNetworkSetRef for UUID %{public}@", buf, 0xCu);
    }
    v124 = v13;

    v28 = 0;
    v65 = 0;
    LOBYTE(v55) = 1;
    v64 = v122;
    v53 = v126;
    goto LABEL_133;
  }
  WFLogForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
  {
    *(_DWORD *)buf = 138543362;
    v138 = (const char *)v13;
    _os_log_impl(&dword_219FC8000, v14, v15, "Using existing UUID for network settings %{public}@", buf, 0xCu);
  }

  v16 = SCNetworkSetCopyAll(v2->_prefs);
  if (!v16)
  {
LABEL_25:
    WFLogForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v29 && os_log_type_enabled(v29, v30))
    {
      *(_DWORD *)buf = 138543362;
      v138 = (const char *)v13;
      _os_log_impl(&dword_219FC8000, v29, v30, "Unable to find networkSet matching UUID: %{public}@", buf, 0xCu);
    }

    goto LABEL_30;
  }
  v17 = v16;
  v18 = v8;
  Count = CFArrayGetCount(v16);
  if (Count < 1)
  {
LABEL_17:
    CFRelease(v17);
    v8 = v18;
    goto LABEL_25;
  }
  v20 = Count;
  v21 = 0;
  while (1)
  {
    ValueAtIndex = (const __SCNetworkSet *)CFArrayGetValueAtIndex(v17, v21);
    if (objc_msgSend(v13, "isEqualToString:", SCNetworkSetGetSetID(ValueAtIndex)))
      break;
    if (v20 == ++v21)
      goto LABEL_17;
  }
  v28 = (const __SCNetworkSet *)CFRetain(ValueAtIndex);
  CFRelease(v17);
  v8 = v18;
  if (!v28)
    goto LABEL_25;
  v44 = v125;
LABEL_50:
  v124 = v13;
  WFLogForCategory(0);
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v51 = v49 == 0;
  else
    v51 = 1;
  v52 = !v51;
  if (!v44)
  {
    v53 = v126;
    if (!v52 || !os_log_type_enabled(v49, v50))
      goto LABEL_151;
    *(_DWORD *)buf = 136315138;
    v138 = "-[WFSaveSettingsOperation start]";
    v108 = "%s: failed to CWFInterface";
    goto LABEL_145;
  }
  v53 = v126;
  if (v52 && os_log_type_enabled(v49, v50))
  {
    *(_DWORD *)buf = 136315394;
    v138 = "-[WFSaveSettingsOperation start]";
    v139 = 2112;
    v140 = (const __CFArray *)v8;
    _os_log_impl(&dword_219FC8000, v49, v50, "%s: interfaceName %@", buf, 0x16u);
  }

  if (!v8)
  {
    WFLogForCategory(0);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v49 || !os_log_type_enabled(v49, v50))
      goto LABEL_151;
    *(_DWORD *)buf = 136315138;
    v138 = "-[WFSaveSettingsOperation start]";
    v108 = "%s: failed to get interface name for device";
LABEL_145:
    _os_log_impl(&dword_219FC8000, v49, v50, v108, buf, 0xCu);
LABEL_151:

    LOBYTE(v55) = 0;
    goto LABEL_152;
  }
  if (!SCPreferencesLock(v2->_prefs, 0))
  {
    SCPreferencesSynchronize(v2->_prefs);
    if (!SCPreferencesLock(v2->_prefs, 1u))
    {
      WFLogForCategory(0);
      v49 = objc_claimAutoreleasedReturnValue();
      v109 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v49)
      {
        v110 = v28;
        v111 = v49;
        if (os_log_type_enabled(v111, v109))
        {
          v112 = SCError();
          v113 = SCErrorString(v112);
          *(_DWORD *)buf = 136446210;
          v138 = v113;
          _os_log_impl(&dword_219FC8000, v111, v109, "SCPreferencesLock failed %{public}s", buf, 0xCu);
        }

        v28 = v110;
      }
      goto LABEL_151;
    }
  }
  v54 = SCNetworkSetCopyServices(v28);
  v55 = v54;
  if (!v54)
  {
LABEL_152:
    v65 = 0;
    v64 = v122;
    goto LABEL_133;
  }
  set = v28;
  if (CFArrayGetCount(v54) < 1)
    goto LABEL_68;
  v56 = 0;
  while (1)
  {
    v57 = (const __SCNetworkService *)CFArrayGetValueAtIndex(v55, v56);
    Interface = SCNetworkServiceGetInterface(v57);
    SCNetworkInterfaceGetBSDName(Interface);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "isEqualToString:", v8);

    if (v60)
      break;
    if (++v56 >= CFArrayGetCount(v55))
      goto LABEL_68;
  }
  if (v57)
  {
    v119 = v55;
    v120 = v8;
    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    -[WFSaveSettingsOperation settings](v2, "settings");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v143, 16);
    v127 = v2;
    if (v66)
    {
      v67 = v66;
      v68 = *(_QWORD *)v132;
      v130 = *MEMORY[0x24BDF5A28];
      v128 = *(_QWORD *)v132;
      do
      {
        for (i = 0; i != v67; ++i)
        {
          if (*(_QWORD *)v132 != v68)
            objc_enumerationMutation(obj);
          v70 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * i);
          objc_msgSend(v70, "protocol");
          v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v72 = SCNetworkServiceCopyProtocol(v57, v71);

          if (v72)
          {
            objc_msgSend(v70, "protocol");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = objc_msgSend(v73, "isEqualToString:", v130);

            if (v74)
            {
              -[WFSaveSettingsOperation _applyProxySettings:service:](v2, "_applyProxySettings:service:", v70, v72);
            }
            else
            {
              WFLogForCategory(0);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = OSLogForWFLogLevel(4uLL);
              if ((unint64_t)WFCurrentLogLevel() >= 4 && v75)
              {
                v77 = v75;
                if (os_log_type_enabled(v77, v76))
                {
                  objc_msgSend(v70, "protocol");
                  v78 = (char *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v70, "items");
                  v79 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v138 = v78;
                  v139 = 2112;
                  v140 = v79;
                  _os_log_impl(&dword_219FC8000, v77, v76, "%@ saving to SC %@", buf, 0x16u);

                  v2 = v127;
                }

                v68 = v128;
              }

              objc_msgSend(v70, "items");
              v80 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              v81 = SCNetworkProtocolSetConfiguration(v72, v80);

              if (!v81)
              {
                WFLogForCategory(0);
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                v83 = OSLogForWFLogLevel(1uLL);
                if (WFCurrentLogLevel() && v82)
                {
                  v84 = v82;
                  if (os_log_type_enabled(v84, v83))
                  {
                    objc_msgSend(v70, "protocol");
                    v85 = (char *)objc_claimAutoreleasedReturnValue();
                    -[WFSaveSettingsOperation ssid](v2, "ssid");
                    v86 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
                    v87 = SCError();
                    v88 = SCErrorString(v87);
                    *(_DWORD *)buf = 138412802;
                    v138 = v85;
                    v139 = 2112;
                    v140 = v86;
                    v141 = 2080;
                    v142 = v88;
                    _os_log_impl(&dword_219FC8000, v84, v83, "WiFi: Couldn't set configuration for %@ for %@: %s", buf, 0x20u);

                  }
                }

                v68 = v128;
              }
            }
            CFRelease(v72);
          }
        }
        v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v143, 16);
      }
      while (v67);
    }

    v28 = set;
    if (-[WFSaveSettingsOperation isCurrentNetwork](v2, "isCurrentNetwork") && !SCNetworkSetSetCurrent(set))
    {
      WFLogForCategory(0);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v114)
      {
        v116 = v114;
        if (os_log_type_enabled(v116, v115))
        {
          v117 = SCError();
          v118 = SCErrorString(v117);
          *(_DWORD *)buf = 136446210;
          v138 = v118;
          _os_log_impl(&dword_219FC8000, v116, v115, "SCNetworkSetSetCurrent failed: %{public}s", buf, 0xCu);
        }

        v2 = v127;
      }

      LOBYTE(v55) = 0;
      v44 = v125;
      v53 = v126;
      v8 = v120;
      v28 = set;
      v64 = v122;
    }
    else
    {
      v44 = v125;
      v53 = v126;
      v8 = v120;
      if (SCPreferencesCommitChanges(v2->_prefs))
      {
        if (SCPreferencesApplyChanges(v2->_prefs))
        {
          if (!SCPreferencesUnlock(v2->_prefs))
          {
            WFLogForCategory(0);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v89)
            {
              v91 = v89;
              if (os_log_type_enabled(v91, v90))
              {
                v92 = SCError();
                v93 = SCErrorString(v92);
                *(_DWORD *)buf = 136446210;
                v138 = v93;
                _os_log_impl(&dword_219FC8000, v91, v90, "WiFi: SCPreferencesUnlock failed: %{public}s", buf, 0xCu);
              }

              v28 = set;
            }

          }
          SCPreferencesSynchronize(v2->_prefs);
        }
        else
        {
          WFLogForCategory(0);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v103)
          {
            v105 = v103;
            if (os_log_type_enabled(v105, v104))
            {
              v106 = SCError();
              v107 = SCErrorString(v106);
              *(_DWORD *)buf = 136446210;
              v138 = v107;
              _os_log_impl(&dword_219FC8000, v105, v104, "WiFi: SCPreferencesApplyChanges failed: %{public}s", buf, 0xCu);
            }

            v28 = set;
          }

          SCPreferencesUnlock(v2->_prefs);
        }
      }
      else
      {
        WFLogForCategory(0);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v98)
        {
          v100 = v98;
          if (os_log_type_enabled(v100, v99))
          {
            v101 = SCError();
            v102 = SCErrorString(v101);
            *(_DWORD *)buf = 136446210;
            v138 = v102;
            _os_log_impl(&dword_219FC8000, v100, v99, "WiFi: SCPreferencesCommitChanges failed: %{public}s", buf, 0xCu);
          }

          v28 = set;
        }

      }
      LOBYTE(v55) = 0;
      v64 = v122;
    }
    v65 = v119;
  }
  else
  {
LABEL_68:
    v61 = v55;
    WFLogForCategory(0);
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v62 && os_log_type_enabled(v62, v63))
    {
      *(_DWORD *)buf = 136315394;
      v138 = "-[WFSaveSettingsOperation start]";
      v139 = 2114;
      v140 = v55;
      _os_log_impl(&dword_219FC8000, v62, v63, "%s: failed to get airport service from interfaces %{public}@", buf, 0x16u);
    }

    LOBYTE(v55) = 0;
    v28 = set;
    v64 = v122;
    v53 = v126;
    v65 = v61;
  }
LABEL_133:
  SCPreferencesUnlock(v2->_prefs);
  if (v65)
    CFRelease(v65);
  if ((v55 & 1) == 0)
    CFRelease(v28);
  -[WFOperation finish](v2, "finish");

}

- (void)_applyProxySettings:(id)a3 service:(__SCNetworkProtocol *)a4
{
  id v5;
  void *v6;
  WFSettingsProxy *v7;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  os_log_type_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  char *v24;
  void *v25;
  void *v26;
  os_log_type_t v27;
  void *v28;
  void *v29;
  char *v30;
  void *v31;
  os_log_type_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  const __CFDictionary *v36;
  _BOOL4 v37;
  void *v38;
  os_log_type_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  int v43;
  const char *v44;
  WFSaveSettingsOperation *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  NSObject *v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  const char *v55;
  uint64_t v56;

  v45 = self;
  v56 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  SCNetworkProtocolGetConfiguration(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFSettingsProxy initWithDictionary:]([WFSettingsProxy alloc], "initWithDictionary:", v6);
  if (-[WFSettingsProxy customProxy](v7, "customProxy")
    && -[WFSettingsProxy authenticated](v7, "authenticated")
    && !objc_msgSend(v5, "authenticated")
    || objc_msgSend(v5, "authenticated", v45))
  {
    if (v7 && (objc_msgSend(v5, "authenticated") & 1) == 0)
    {
      WFLogForCategory(0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v19)
      {
        v21 = v19;
        if (os_log_type_enabled(v21, v20))
        {
          -[WFSettingsProxy server](v7, "server");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFSettingsProxy port](v7, "port");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFSettingsProxy username](v7, "username");
          v24 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v51 = v22;
          v52 = 2112;
          v53 = v23;
          v54 = 2112;
          v55 = v24;
          _os_log_impl(&dword_219FC8000, v21, v20, "Removing HTTP proxy password in KC server %@, port %@, username %@", buf, 0x20u);

        }
      }

      -[WFSettingsProxy server](v7, "server");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSettingsProxy port](v7, "port");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSettingsProxy username](v7, "username");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFProxyKeychainOperation removePasswordOperationForHost:port:username:](WFProxyKeychainOperation, "removePasswordOperationForHost:port:username:", v14, v15, v16);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v5, "authenticated", v45))
        goto LABEL_22;
      WFLogForCategory(0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v8)
      {
        v10 = v8;
        if (os_log_type_enabled(v10, v9))
        {
          objc_msgSend(v5, "server");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "port");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "username");
          v13 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v51 = v11;
          v52 = 2112;
          v53 = v12;
          v54 = 2112;
          v55 = v13;
          _os_log_impl(&dword_219FC8000, v10, v9, "Saving new HTTP proxy password in KC server %@, port %@, username %@", buf, 0x20u);

        }
      }

      objc_msgSend(v5, "server");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "port");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "username");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "password");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFProxyKeychainOperation savePassswordOperationForHost:port:username:password:](WFProxyKeychainOperation, "savePassswordOperationForHost:port:username:password:", v14, v15, v16, v17);
      v18 = objc_claimAutoreleasedReturnValue();

    }
    if (v18)
    {
      objc_initWeak((id *)buf, v18);
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __55__WFSaveSettingsOperation__applyProxySettings_service___block_invoke;
      v46[3] = &unk_24DC34750;
      objc_copyWeak(&v48, (id *)buf);
      v47 = v5;
      -[NSObject setCompletionBlock:](v18, "setCompletionBlock:", v46);
      -[WFSaveSettingsOperation addDependency:](v45, "addDependency:", v18);
      -[WFSaveSettingsOperation keychainQueue](v45, "keychainQueue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v18;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addOperations:waitUntilFinished:", v26, 1);

      objc_destroyWeak(&v48);
      objc_destroyWeak((id *)buf);
LABEL_27:

      goto LABEL_28;
    }
LABEL_22:
    WFLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    v27 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v18)
    {
      v18 = v18;
      if (os_log_type_enabled(v18, v27))
      {
        objc_msgSend(v5, "server");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "port");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "username");
        v30 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v51 = v28;
        v52 = 2112;
        v53 = v29;
        v54 = 2112;
        v55 = v30;
        _os_log_impl(&dword_219FC8000, v18, v27, "Failed to create WFProxyKeychainOperation for host: %@, port: %@, user: %@", buf, 0x20u);

      }
    }
    goto LABEL_27;
  }
LABEL_28:
  WFLogForCategory(0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v31)
  {
    v33 = v31;
    if (os_log_type_enabled(v33, v32))
    {
      objc_msgSend(v5, "protocol");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "items");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v51 = v34;
      v52 = 2112;
      v53 = v35;
      _os_log_impl(&dword_219FC8000, v33, v32, "%@ saving to SC %@", buf, 0x16u);

    }
  }

  objc_msgSend(v5, "items");
  v36 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v37 = SCNetworkProtocolSetConfiguration(a4, v36) == 0;

  if (v37)
  {
    WFLogForCategory(0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v38)
    {
      v40 = v38;
      if (os_log_type_enabled(v40, v39))
      {
        objc_msgSend(v5, "protocol");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFSaveSettingsOperation ssid](v45, "ssid");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = SCError();
        v44 = SCErrorString(v43);
        *(_DWORD *)buf = 138412802;
        v51 = v41;
        v52 = 2112;
        v53 = v42;
        v54 = 2080;
        v55 = v44;
        _os_log_impl(&dword_219FC8000, v40, v39, "WiFi: Couldn't set configuration for %@ for %@: %s", buf, 0x20u);

      }
    }

  }
}

void __55__WFSaveSettingsOperation__applyProxySettings_service___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    WFLogForCategory(0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4)
    {
      v6 = v4;
      if (os_log_type_enabled(v6, v5))
      {
        objc_msgSend(*(id *)(a1 + 32), "server");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "port");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "username");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412802;
        v11 = v7;
        v12 = 2112;
        v13 = v8;
        v14 = 2112;
        v15 = v9;
        _os_log_impl(&dword_219FC8000, v6, v5, "Error saving password to the keychain for host: %@, port: %@, user: %@", (uint8_t *)&v10, 0x20u);

      }
    }

  }
}

- (__SCNetworkSet)_createNewSetForNetworkNamed:(id)a3 interfaceName:(id)a4
{
  __CFString *v6;
  id v7;
  __SCNetworkSet *v8;
  const __SCNetworkSet *v9;
  SCNetworkSetRef v10;
  const __SCNetworkSet *v11;
  const __CFArray *ServiceOrder;
  const __CFArray *v13;
  const __CFArray *v14;
  CFIndex Count;
  CFIndex v16;
  void *v17;
  CFIndex v18;
  const __SCNetworkService *ValueAtIndex;
  SCNetworkInterfaceRef Interface;
  const __SCNetworkInterface *v21;
  void *v22;
  const __SCNetworkService *v23;
  const __CFArray *v24;
  NSObject *v25;
  os_log_type_t v26;
  const __SCNetworkService *v27;
  const __SCNetworkService *v28;
  const __CFArray *v29;
  const __CFArray *MutableCopy;
  void *v31;
  os_log_type_t v32;
  NSObject *v33;
  int v34;
  void *v35;
  os_log_type_t v36;
  NSObject *v37;
  int v38;
  void *v39;
  os_log_type_t v40;
  NSObject *v41;
  int v42;
  const char *v43;
  const __CFArray *v45;
  CFIndex v46;
  CFStringRef ServiceID;
  CFIndex FirstIndexOfValue;
  CFIndex v49;
  CFStringRef v50;
  void *v51;
  os_log_type_t v52;
  NSObject *v53;
  int v54;
  const char *v55;
  void *v56;
  os_log_type_t v57;
  NSObject *v58;
  int v59;
  const char *v60;
  const __SCNetworkSet *v61;
  __CFString *v62;
  const __SCNetworkService *v63;
  const __SCNetworkSet *v64;
  const __SCNetworkService *service;
  uint8_t buf[4];
  const char *v67;
  __int16 v68;
  const __SCNetworkInterface *v69;
  __int16 v70;
  id v71;
  uint64_t v72;
  CFRange v73;

  v72 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = a4;
  v8 = -[WFSaveSettingsOperation _defaultSetRetained](self, "_defaultSetRetained");
  if (!v8)
  {
    v11 = 0;
    goto LABEL_54;
  }
  v9 = v8;
  v10 = SCNetworkSetCreate(self->_prefs);
  if (!v10)
  {
    WFLogForCategory(0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v31)
    {
      v33 = v31;
      if (os_log_type_enabled(v33, v32))
      {
        v34 = SCError();
        *(_DWORD *)buf = 136446210;
        v67 = SCErrorString(v34);
        _os_log_impl(&dword_219FC8000, v33, v32, "WiFi: SCNetworkSetCreate() failed: %{public}s\n", buf, 0xCu);
      }

    }
LABEL_52:
    v11 = 0;
    goto LABEL_53;
  }
  v11 = v10;
  if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Automatic")) & 1) == 0)
    SCNetworkSetSetName(v11, v6);
  ServiceOrder = SCNetworkSetGetServiceOrder(v9);
  if (!SCNetworkSetSetServiceOrder(v11, ServiceOrder))
  {
    WFLogForCategory(0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v35)
    {
      v37 = v35;
      if (os_log_type_enabled(v37, v36))
      {
        v38 = SCError();
        *(_DWORD *)buf = 136446210;
        v67 = SCErrorString(v38);
        _os_log_impl(&dword_219FC8000, v37, v36, "WiFi: SCNetworkSetSetServiceOrder() failed: %{public}s\n", buf, 0xCu);
      }

    }
    v14 = 0;
LABEL_50:
    SCNetworkSetRemove(v11);
    CFRelease(v11);
    if (v14)
      CFRelease(v14);
    goto LABEL_52;
  }
  v13 = SCNetworkSetCopyServices(v9);
  if (!v13)
    goto LABEL_53;
  v14 = v13;
  Count = CFArrayGetCount(v13);
  if (Count < 1)
    goto LABEL_60;
  v16 = Count;
  v63 = 0;
  v61 = v9;
  v62 = v6;
  service = 0;
  v17 = 0;
  v18 = 0;
  v64 = v11;
  do
  {
    ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v14, v18);
    Interface = SCNetworkServiceGetInterface(ValueAtIndex);
    if (Interface)
    {
      v21 = Interface;
      while (1)
      {
        v22 = v17;
        SCNetworkInterfaceGetBSDName(v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v17, "isEqualToString:", v7))
          break;
        v21 = SCNetworkInterfaceGetInterface(v21);
        if (!v21)
          goto LABEL_13;
      }
      v24 = v14;
      WFLogForCategory(0);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v25 && os_log_type_enabled(v25, v26))
      {
        *(_DWORD *)buf = 136315650;
        v67 = "-[WFSaveSettingsOperation _createNewSetForNetworkNamed:interfaceName:]";
        v68 = 2112;
        v69 = v21;
        v70 = 2112;
        v71 = v7;
        _os_log_impl(&dword_219FC8000, v25, v26, "%s: found interface='%@' matching name='%@'", buf, 0x20u);
      }

      if (service)
      {
        v23 = ValueAtIndex;
        v14 = v24;
        v11 = v64;
      }
      else
      {
        v27 = SCNetworkServiceCreate(self->_prefs, v21);
        v14 = v24;
        if (!v27)
        {
          WFLogForCategory(0);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = OSLogForWFLogLevel(1uLL);
          v9 = v61;
          v11 = v64;
          if (WFCurrentLogLevel() && v51)
          {
            v53 = v51;
            if (os_log_type_enabled(v53, v52))
            {
              v54 = SCError();
              v55 = SCErrorString(v54);
              *(_DWORD *)buf = 136446210;
              v67 = v55;
              _os_log_impl(&dword_219FC8000, v53, v52, "WiFi: SCNetworkServiceCreate() failed: %{public}s\n", buf, 0xCu);
            }

          }
          goto LABEL_49;
        }
        v23 = v27;
        v11 = v64;
        if (!SCNetworkServiceEstablishDefaultConfiguration(v27))
        {
          WFLogForCategory(0);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = OSLogForWFLogLevel(1uLL);
          v9 = v61;
          if (WFCurrentLogLevel() && v56)
          {
            v58 = v56;
            if (os_log_type_enabled(v58, v57))
            {
              v59 = SCError();
              v60 = SCErrorString(v59);
              *(_DWORD *)buf = 136446210;
              v67 = v60;
              _os_log_impl(&dword_219FC8000, v58, v57, "WiFi: SCNetworkServiceEstablishDefaultConfiguration() failed: %{public}s\n", buf, 0xCu);
            }

          }
LABEL_48:
          SCNetworkServiceRemove(v23);
          CFRelease(v23);
LABEL_49:
          v6 = v62;
          goto LABEL_50;
        }
        SCNetworkServiceSetName(v23, CFSTR("Wi-Fi by wifikit"));
        service = v23;
        v63 = ValueAtIndex;
      }
    }
    else
    {
LABEL_13:
      v23 = ValueAtIndex;
    }
    if (!SCNetworkSetAddService(v11, v23))
    {
      WFLogForCategory(0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = OSLogForWFLogLevel(1uLL);
      v9 = v61;
      if (WFCurrentLogLevel() && v39)
      {
        v41 = v39;
        if (os_log_type_enabled(v41, v40))
        {
          v42 = SCError();
          v43 = SCErrorString(v42);
          *(_DWORD *)buf = 136446210;
          v67 = v43;
          _os_log_impl(&dword_219FC8000, v41, v40, "WiFi: SCNetworkSetAddService() failed: %{public}s\n", buf, 0xCu);
        }

      }
      v23 = service;
      if (service)
        goto LABEL_48;
      goto LABEL_49;
    }
    ++v18;
  }
  while (v18 != v16);

  v9 = v61;
  v6 = v62;
  v28 = service;
  if (service)
  {
    if (v63)
    {
      v29 = SCNetworkSetGetServiceOrder(v61);
      if (v29)
        MutableCopy = CFArrayCreateMutableCopy(0, 0, v29);
      else
        MutableCopy = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
      v45 = MutableCopy;
      v46 = CFArrayGetCount(MutableCopy);
      ServiceID = SCNetworkServiceGetServiceID(v63);
      v73.location = 0;
      v73.length = v46;
      FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v45, v73, ServiceID);
      if (FirstIndexOfValue != -1)
      {
        v49 = FirstIndexOfValue;
        v50 = SCNetworkServiceGetServiceID(service);
        CFArraySetValueAtIndex(v45, v49, v50);
        SCNetworkSetSetServiceOrder(v11, v45);
      }
      CFRelease(v45);
      v28 = service;
    }
    CFRelease(v28);
  }
LABEL_60:
  CFRelease(v14);
LABEL_53:
  CFRelease(v9);
LABEL_54:

  return v11;
}

- (__SCNetworkSet)_defaultSetRetained
{
  const __CFArray *v3;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  const __SCNetworkSet *ValueAtIndex;
  void *v9;

  v3 = SCNetworkSetCopyAll(self->_prefs);
  v4 = v3;
  if (!v3)
    goto LABEL_8;
  Count = CFArrayGetCount(v3);
  if (Count < 1)
    goto LABEL_8;
  v6 = Count;
  v7 = 0;
  while (1)
  {
    ValueAtIndex = (const __SCNetworkSet *)CFArrayGetValueAtIndex(v4, v7);
    SCNetworkSetGetName(ValueAtIndex);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Automatic")) & 1) != 0)
      break;

    if (v6 == ++v7)
      goto LABEL_8;
  }
  CFRetain(ValueAtIndex);

  if (!ValueAtIndex)
LABEL_8:
    ValueAtIndex = SCNetworkSetCopyCurrent(self->_prefs);
  if (v4)
    CFRelease(v4);
  return ValueAtIndex;
}

- (NSOperationQueue)keychainQueue
{
  NSOperationQueue *keychainQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  keychainQueue = self->_keychainQueue;
  if (!keychainQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    v5 = self->_keychainQueue;
    self->_keychainQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_keychainQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](self->_keychainQueue, "setQualityOfService:", 17);
    keychainQueue = self->_keychainQueue;
  }
  return keychainQueue;
}

- (id)name
{
  return objc_getProperty(self, a2, 280, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 280);
}

- (BOOL)isCurrentNetwork
{
  return self->_currentNetwork;
}

- (void)setCurrentNetwork:(BOOL)a3
{
  self->_currentNetwork = a3;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (__SCPreferences)prefs
{
  return self->_prefs;
}

- (void)setPrefs:(__SCPreferences *)a3
{
  self->_prefs = a3;
}

- (NSArray)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (void)setKeychainQueue:(id)a3
{
  objc_storeStrong((id *)&self->_keychainQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainQueue, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
