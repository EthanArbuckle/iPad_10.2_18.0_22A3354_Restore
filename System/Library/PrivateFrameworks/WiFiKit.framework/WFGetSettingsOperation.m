@implementation WFGetSettingsOperation

- (WFGetSettingsOperation)initWithSSID:(id)a3 interfaceName:(id)a4
{
  id v6;
  id v7;
  WFGetSettingsOperation *v8;
  uint64_t v9;
  NSString *ssid;
  uint64_t v11;
  NSString *interfaceName;
  SCPreferencesRef v13;
  uint64_t v14;
  WFGetSettingsOperation *name;
  NSObject *v17;
  os_log_type_t v18;
  const char *v19;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)WFGetSettingsOperation;
  v8 = -[WFGetSettingsOperation init](&v20, sel_init);
  if (!v8)
  {
    name = 0;
    goto LABEL_6;
  }
  if (!v6)
  {
    WFLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v17 || !os_log_type_enabled(v17, v18))
      goto LABEL_17;
    *(_DWORD *)buf = 136315138;
    v22 = "-[WFGetSettingsOperation initWithSSID:interfaceName:]";
    v19 = "%s: missing ssid";
    goto LABEL_16;
  }
  v9 = objc_msgSend(v6, "copy");
  ssid = v8->_ssid;
  v8->_ssid = (NSString *)v9;

  if (!v7)
  {
    WFLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v17 || !os_log_type_enabled(v17, v18))
      goto LABEL_17;
    *(_DWORD *)buf = 136315138;
    v22 = "-[WFGetSettingsOperation initWithSSID:interfaceName:]";
    v19 = "%s: missing interfaceName";
LABEL_16:
    _os_log_impl(&dword_219FC8000, v17, v18, v19, buf, 0xCu);
LABEL_17:

    goto LABEL_18;
  }
  v11 = objc_msgSend(v7, "copy");
  interfaceName = v8->_interfaceName;
  v8->_interfaceName = (NSString *)v11;

  v13 = SCPreferencesCreateWithAuthorization(0, CFSTR("com.apple.wifikit"), 0, 0);
  v8->_prefs = v13;
  if (!v13)
  {
LABEL_18:
    name = v8;
    v8 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Get settings for '%@'"), v8->_ssid);
  v14 = objc_claimAutoreleasedReturnValue();
  name = (WFGetSettingsOperation *)v8->_name;
  v8->_name = (NSString *)v14;
LABEL_6:

  return v8;
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
  v4.super_class = (Class)WFGetSettingsOperation;
  -[WFGetSettingsOperation dealloc](&v4, sel_dealloc);
}

- (void)start
{
  void *v3;
  os_log_type_t v4;
  NSObject *v5;
  char *v6;
  NSString *interfaceName;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  void *v16;
  const __CFArray *v17;
  const __CFArray *v18;
  CFIndex Count;
  CFIndex v20;
  CFIndex v21;
  const __SCNetworkSet *ValueAtIndex;
  NSObject *v23;
  os_log_type_t v24;
  NSArray *v25;
  void *v26;
  const __SCNetworkSet *v27;
  CFArrayRef v28;
  const __CFArray *v29;
  NSObject *v30;
  os_log_type_t v31;
  CFIndex v32;
  const __SCNetworkService *v33;
  const __SCNetworkInterface *Interface;
  void *v35;
  int v36;
  NSObject *p_super;
  os_log_type_t v38;
  const __SCNetworkProtocol *v39;
  const __SCNetworkProtocol *v40;
  char *v41;
  NSObject *v42;
  WFSettingsIPV4 *v43;
  NSObject *v44;
  const __SCNetworkProtocol *v45;
  const __SCNetworkProtocol *v46;
  char *v47;
  WFSettingsIPV6 *v48;
  NSObject *v49;
  WFSettingsIPV6 *v50;
  NSObject *v51;
  const __SCNetworkProtocol *v52;
  const __SCNetworkProtocol *v53;
  uint64_t v54;
  WFSettingsDNS *v55;
  NSObject *v56;
  char *v57;
  NSObject *v58;
  const __SCNetworkProtocol *v59;
  const __SCNetworkProtocol *v60;
  NSObject *v61;
  os_log_type_t v62;
  WFSettingsProxy *v63;
  NSObject *v64;
  os_log_type_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  os_log_type_t v74;
  void *v75;
  void *v76;
  NSObject *v77;
  os_log_type_t v78;
  os_log_type_t v79;
  os_log_type_t v80;
  NSObject *v81;
  char *v82;
  os_log_type_t v83;
  os_log_type_t v84;
  void *v85;
  void *v86;
  char *v87;
  os_log_type_t type;
  os_log_type_t typea;
  os_log_type_t typeb;
  os_log_type_t typec;
  os_log_type_t typed;
  os_log_type_t typee;
  os_log_type_t typef[8];
  WFSettingsIPV4 *v95;
  const char *v96;
  const char *v97;
  WFSettingsProxy *v98;
  void *v99;
  void *v100;
  const __SCNetworkSet *cf;
  objc_super v102;
  uint8_t buf[4];
  const char *v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  void *v108;
  _QWORD v109[2];

  v109[1] = *MEMORY[0x24BDAC8D0];
  v102.receiver = self;
  v102.super_class = (Class)WFGetSettingsOperation;
  -[WFOperation start](&v102, sel_start);
  WFLogForCategory(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      -[WFGetSettingsOperation ssid](self, "ssid");
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      interfaceName = self->_interfaceName;
      *(_DWORD *)buf = 138412546;
      v104 = v6;
      v105 = 2112;
      v106 = interfaceName;
      _os_log_impl(&dword_219FC8000, v5, v4, "Getting custom network settings for '%@' using interface='%@'", buf, 0x16u);

    }
  }

  v8 = self->_interfaceName;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE29F18]), "initWithServiceType:", 1);
  objc_msgSend(v9, "activate");
  objc_msgSend(v9, "userSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "OSSpecificAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE67E48]);
  v12 = (char *)objc_claimAutoreleasedReturnValue();

  WFLogForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v79 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v79))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v13, v79, "No custom settings exist in WiFiManager", buf, 2u);
    }
    goto LABEL_129;
  }
  v14 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v13 && os_log_type_enabled(v13, v14))
  {
    *(_DWORD *)buf = 138412290;
    v104 = v12;
    _os_log_impl(&dword_219FC8000, v13, v14, "Existing custom network settings %@", buf, 0xCu);
  }

  -[WFGetSettingsOperation ssid](self, "ssid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    WFLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    v80 = OSLogForWFLogLevel(2uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 2 && v13)
    {
      v81 = v13;
      if (os_log_type_enabled(v81, v80))
      {
        -[WFGetSettingsOperation ssid](self, "ssid");
        v82 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v104 = v82;
        _os_log_impl(&dword_219FC8000, v81, v80, "No custom settings exist for network named %@", buf, 0xCu);

      }
    }
LABEL_129:

    v25 = 0;
    v26 = 0;
    v16 = 0;
    goto LABEL_23;
  }
  v17 = SCNetworkSetCopyAll(self->_prefs);
  if (v17)
  {
    v18 = v17;
    Count = CFArrayGetCount(v17);
    if (Count < 1)
    {
LABEL_17:
      CFRelease(v18);
    }
    else
    {
      v20 = Count;
      v21 = 0;
      while (1)
      {
        ValueAtIndex = (const __SCNetworkSet *)CFArrayGetValueAtIndex(v18, v21);
        if (objc_msgSend(v16, "isEqualToString:", SCNetworkSetGetSetID(ValueAtIndex)))
          break;
        if (v20 == ++v21)
          goto LABEL_17;
      }
      v27 = (const __SCNetworkSet *)CFRetain(ValueAtIndex);
      CFRelease(v18);
      if (v27)
      {
        v28 = SCNetworkSetCopyServices(v27);
        cf = v27;
        if (!v28)
        {
          v25 = 0;
          v26 = 0;
LABEL_139:
          CFRelease(cf);
          goto LABEL_23;
        }
        v29 = v28;
        WFLogForCategory(0);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v30 && os_log_type_enabled(v30, v31))
        {
          *(_DWORD *)buf = 136315394;
          v104 = "-[WFGetSettingsOperation start]";
          v105 = 2112;
          v106 = v8;
          _os_log_impl(&dword_219FC8000, v30, v31, "%s: interfaceName %@", buf, 0x16u);
        }
        v100 = v10;

        if (v8)
        {
          if (CFArrayGetCount(v29) >= 1)
          {
            v32 = 0;
            while (1)
            {
              v33 = (const __SCNetworkService *)CFArrayGetValueAtIndex(v29, v32);
              Interface = SCNetworkServiceGetInterface(v33);
              SCNetworkInterfaceGetBSDName(Interface);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "isEqualToString:", v8);

              if (v36)
                break;
              if (++v32 >= CFArrayGetCount(v29))
                goto LABEL_35;
            }
            if (v33)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = SCNetworkServiceCopyProtocol(v33, (CFStringRef)*MEMORY[0x24BDF59F0]);
              if (v39)
              {
                v40 = v39;
                SCNetworkProtocolGetConfiguration(v39);
                v41 = (char *)objc_claimAutoreleasedReturnValue();
                if (v41)
                {
                  v95 = -[WFSettingsIPV4 initWithDictionary:]([WFSettingsIPV4 alloc], "initWithDictionary:", v41);
                  WFLogForCategory(0);
                  v42 = objc_claimAutoreleasedReturnValue();
                  type = OSLogForWFLogLevel(4uLL);
                  if ((unint64_t)WFCurrentLogLevel() >= 4 && v42 && os_log_type_enabled(v42, type))
                  {
                    *(_DWORD *)buf = 136315394;
                    v104 = "-[WFGetSettingsOperation start]";
                    v105 = 2112;
                    v106 = v95;
                    _os_log_impl(&dword_219FC8000, v42, type, "%s: ipv4 %@", buf, 0x16u);
                  }

                  v43 = v95;
                  if (v95)
                  {
                    objc_msgSend(v99, "addObject:", v95);
                  }
                  else
                  {
                    WFLogForCategory(0);
                    v44 = objc_claimAutoreleasedReturnValue();
                    typea = OSLogForWFLogLevel(1uLL);
                    if (WFCurrentLogLevel() && v44 && os_log_type_enabled(v44, typea))
                    {
                      *(_DWORD *)buf = 138412290;
                      v104 = v41;
                      _os_log_impl(&dword_219FC8000, v44, typea, "Failed to create WFSettingsIPV4 from protocolDict %@", buf, 0xCu);
                    }

                    v43 = 0;
                  }

                }
                CFRelease(v40);
              }
              else
              {
                v41 = 0;
              }
              v45 = SCNetworkServiceCopyProtocol(v33, (CFStringRef)*MEMORY[0x24BDF59F8]);
              if (v45)
              {
                v46 = v45;
                SCNetworkProtocolGetConfiguration(v45);
                v47 = (char *)objc_claimAutoreleasedReturnValue();

                if (v47)
                {
                  v96 = v47;
                  v48 = -[WFSettingsIPV6 initWithDictionary:]([WFSettingsIPV6 alloc], "initWithDictionary:", v47);
                  WFLogForCategory(0);
                  v49 = objc_claimAutoreleasedReturnValue();
                  typeb = OSLogForWFLogLevel(4uLL);
                  if ((unint64_t)WFCurrentLogLevel() >= 4 && v49 && os_log_type_enabled(v49, typeb))
                  {
                    *(_DWORD *)buf = 136315394;
                    v104 = "-[WFGetSettingsOperation start]";
                    v105 = 2112;
                    v106 = v48;
                    _os_log_impl(&dword_219FC8000, v49, typeb, "%s: ipv6 %@", buf, 0x16u);
                  }

                  if (v48)
                  {
                    v50 = v48;
                    objc_msgSend(v99, "addObject:", v48);
                  }
                  else
                  {
                    WFLogForCategory(0);
                    v51 = objc_claimAutoreleasedReturnValue();
                    typec = OSLogForWFLogLevel(1uLL);
                    if (WFCurrentLogLevel() && v51 && os_log_type_enabled(v51, typec))
                    {
                      *(_DWORD *)buf = 138412290;
                      v104 = v96;
                      _os_log_impl(&dword_219FC8000, v51, typec, "Failed to create WFSettingsIPV6 from protocolDict %@", buf, 0xCu);
                    }

                    v50 = 0;
                  }

                  v47 = (char *)v96;
                }
                CFRelease(v46);
              }
              else
              {
                v47 = v41;
              }
              v52 = SCNetworkServiceCopyProtocol(v33, (CFStringRef)*MEMORY[0x24BDF59D8]);
              if (v52)
              {
                v53 = v52;
                SCNetworkProtocolGetConfiguration(v52);
                v54 = objc_claimAutoreleasedReturnValue();

                v97 = (const char *)v54;
                if (v54)
                {
                  v55 = -[WFSettingsDNS initWithDictionary:]([WFSettingsDNS alloc], "initWithDictionary:", v54);
                  WFLogForCategory(0);
                  v56 = objc_claimAutoreleasedReturnValue();
                  typed = OSLogForWFLogLevel(4uLL);
                  if ((unint64_t)WFCurrentLogLevel() >= 4 && v56 && os_log_type_enabled(v56, typed))
                  {
                    *(_DWORD *)buf = 136315394;
                    v104 = "-[WFGetSettingsOperation start]";
                    v105 = 2112;
                    v106 = v55;
                    _os_log_impl(&dword_219FC8000, v56, typed, "%s: dns %@", buf, 0x16u);
                  }

                  if (v55)
                  {
                    objc_msgSend(v99, "addObject:", v55);
                  }
                  else
                  {
                    WFLogForCategory(0);
                    v58 = objc_claimAutoreleasedReturnValue();
                    typee = OSLogForWFLogLevel(1uLL);
                    if (WFCurrentLogLevel() && v58 && os_log_type_enabled(v58, typee))
                    {
                      *(_DWORD *)buf = 138412290;
                      v104 = v97;
                      _os_log_impl(&dword_219FC8000, v58, typee, "Failed to create WFSettingsDNS from protocolDict %@", buf, 0xCu);
                    }

                  }
                }
                CFRelease(v53);
                v57 = (char *)v97;
              }
              else
              {
                v57 = v47;
              }
              v59 = SCNetworkServiceCopyProtocol(v33, (CFStringRef)*MEMORY[0x24BDF5A28]);
              if (v59)
              {
                v60 = v59;
                SCNetworkProtocolGetConfiguration(v59);
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                if (v26)
                {
                  *(_QWORD *)typef = v60;
                  objc_msgSend(v26, "objectForKey:", CFSTR("HTTPProxyType"));

                  v98 = -[WFSettingsProxy initWithDictionary:]([WFSettingsProxy alloc], "initWithDictionary:", v26);
                  WFLogForCategory(0);
                  v61 = objc_claimAutoreleasedReturnValue();
                  v62 = OSLogForWFLogLevel(4uLL);
                  if ((unint64_t)WFCurrentLogLevel() >= 4 && v61 && os_log_type_enabled(v61, v62))
                  {
                    *(_DWORD *)buf = 136315394;
                    v104 = "-[WFGetSettingsOperation start]";
                    v105 = 2112;
                    v106 = v98;
                    _os_log_impl(&dword_219FC8000, v61, v62, "%s: proxy %@", buf, 0x16u);
                  }

                  v63 = v98;
                  if (v98)
                  {
                    if (-[WFSettingsProxy authenticated](v98, "authenticated"))
                    {
                      WFLogForCategory(0);
                      v64 = objc_claimAutoreleasedReturnValue();
                      v65 = OSLogForWFLogLevel(1uLL);
                      if (WFCurrentLogLevel() && v64 && os_log_type_enabled(v64, v65))
                      {
                        *(_DWORD *)buf = 136315138;
                        v104 = "-[WFGetSettingsOperation start]";
                        _os_log_impl(&dword_219FC8000, v64, v65, "%s: proxy is authenticated, getting password from keychain", buf, 0xCu);
                      }

                      -[WFSettingsProxy server](v98, "server");
                      v85 = (void *)objc_claimAutoreleasedReturnValue();
                      -[WFSettingsProxy port](v98, "port");
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      -[WFSettingsProxy username](v98, "username");
                      v67 = (void *)objc_claimAutoreleasedReturnValue();
                      +[WFProxyKeychainOperation getPasswordOperationForHost:port:username:](WFProxyKeychainOperation, "getPasswordOperationForHost:port:username:", v85, v66, v67);
                      v68 = objc_claimAutoreleasedReturnValue();

                      v69 = (void *)v68;
                      -[WFGetSettingsOperation addDependency:](self, "addDependency:", v68);
                      -[WFGetSettingsOperation keychainQueue](self, "keychainQueue");
                      v70 = (void *)objc_claimAutoreleasedReturnValue();
                      v109[0] = v68;
                      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v109, 1);
                      v71 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v70, "addOperations:waitUntilFinished:", v71, 1);

                      objc_msgSend(v69, "error");
                      v72 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v72)
                      {
                        WFLogForCategory(0);
                        v73 = objc_claimAutoreleasedReturnValue();
                        v74 = OSLogForWFLogLevel(1uLL);
                        if (WFCurrentLogLevel() && v73)
                        {
                          v73 = v73;
                          if (os_log_type_enabled(v73, v74))
                          {
                            v84 = v74;
                            -[WFSettingsProxy server](v98, "server");
                            v87 = (char *)objc_claimAutoreleasedReturnValue();
                            -[WFSettingsProxy port](v98, "port");
                            v86 = v69;
                            v75 = (void *)objc_claimAutoreleasedReturnValue();
                            -[WFSettingsProxy username](v98, "username");
                            v76 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138412802;
                            v104 = v87;
                            v105 = 2112;
                            v106 = v75;
                            v107 = 2112;
                            v108 = v76;
                            _os_log_impl(&dword_219FC8000, v73, v84, "Error getting password from the keychain for host: %@, port: %@, user: %@", buf, 0x20u);

                            v69 = v86;
                          }

                        }
                      }
                      else
                      {
                        objc_msgSend(v69, "password");
                        v73 = objc_claimAutoreleasedReturnValue();
                        -[WFSettingsProxy setPassword:](v98, "setPassword:", v73);
                      }

                      NSLog(CFSTR("keychain op completion block!"));
                      v63 = v98;
                    }
                    objc_msgSend(v99, "addObject:", v63);
                  }
                  else
                  {
                    WFLogForCategory(0);
                    v77 = objc_claimAutoreleasedReturnValue();
                    v78 = OSLogForWFLogLevel(1uLL);
                    if (WFCurrentLogLevel() && v77 && os_log_type_enabled(v77, v78))
                    {
                      *(_DWORD *)buf = 138412290;
                      v104 = (const char *)v26;
                      _os_log_impl(&dword_219FC8000, v77, v78, "Failed to create WFSettingsProxy from protocolDict %@", buf, 0xCu);
                    }

                    v63 = 0;
                  }

                  v60 = *(const __SCNetworkProtocol **)typef;
                }
                CFRelease(v60);
              }
              else
              {
                v26 = v57;
              }
              v25 = v99;
              p_super = &self->_settings->super;
              self->_settings = v25;
              goto LABEL_137;
            }
          }
LABEL_35:
          WFLogForCategory(0);
          p_super = objc_claimAutoreleasedReturnValue();
          v38 = OSLogForWFLogLevel(1uLL);
          v25 = 0;
          if (WFCurrentLogLevel())
          {
            v10 = v100;
            if (p_super)
            {
              if (os_log_type_enabled(p_super, v38))
              {
                *(_DWORD *)buf = 136315394;
                v104 = "-[WFGetSettingsOperation start]";
                v105 = 2114;
                v106 = v29;
                _os_log_impl(&dword_219FC8000, p_super, v38, "%s: failed to get airport service from interfaces %{public}@", buf, 0x16u);
              }
              v25 = 0;
              v26 = 0;
            }
            else
            {
              v26 = 0;
            }
            goto LABEL_138;
          }
        }
        else
        {
          WFLogForCategory(0);
          p_super = objc_claimAutoreleasedReturnValue();
          v83 = OSLogForWFLogLevel(1uLL);
          v25 = 0;
          if (WFCurrentLogLevel() && p_super)
          {
            if (os_log_type_enabled(p_super, v83))
            {
              *(_DWORD *)buf = 136315138;
              v104 = "-[WFGetSettingsOperation start]";
              _os_log_impl(&dword_219FC8000, p_super, v83, "%s: failed to get interface name for device", buf, 0xCu);
            }
            v25 = 0;
            v26 = 0;
            goto LABEL_137;
          }
        }
        v26 = 0;
LABEL_137:
        v10 = v100;
LABEL_138:

        CFRelease(v29);
        goto LABEL_139;
      }
    }
  }
  WFLogForCategory(0);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v23 && os_log_type_enabled(v23, v24))
  {
    *(_DWORD *)buf = 138543362;
    v104 = (const char *)v16;
    _os_log_impl(&dword_219FC8000, v23, v24, "Failed to get SCNetworkSetRef but network had a valid set UUID %{public}@", buf, 0xCu);
  }

  v25 = 0;
  v26 = 0;
LABEL_23:
  -[WFOperation finish](self, "finish");

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
  return objc_getProperty(self, a2, 272, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 272);
}

- (NSArray)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
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

- (void)setKeychainQueue:(id)a3
{
  objc_storeStrong((id *)&self->_keychainQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainQueue, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
