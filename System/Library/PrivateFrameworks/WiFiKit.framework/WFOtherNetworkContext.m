@implementation WFOtherNetworkContext

- (WFOtherNetworkContext)initWithType:(unint64_t)a3
{
  return -[WFOtherNetworkContext initWithType:authTraits:supportRandomAddress:useRandomAddress:randomMACAddress:hardwareMACAddress:](self, "initWithType:authTraits:supportRandomAddress:useRandomAddress:randomMACAddress:hardwareMACAddress:", a3, 0, 0, 0, 0, 0);
}

- (WFOtherNetworkContext)initWithType:(unint64_t)a3 authTraits:(int64_t)a4 supportRandomAddress:(BOOL)a5 useRandomAddress:(BOOL)a6 randomMACAddress:(id)a7 hardwareMACAddress:(id)a8
{
  id v14;
  id v15;
  WFOtherNetworkContext *v16;
  WFOtherNetworkContext *v17;
  void *v18;
  void *v19;
  unint64_t type;
  uint64_t v21;
  uint64_t v22;
  NSString *hardwareMACAddress;
  uint64_t v24;
  NSString *randomMACAddress;
  void *v26;
  os_log_type_t v27;
  NSObject *v28;
  int v29;
  NSArray *availableTLSIdentities;
  OSStatus v32;
  objc_super v33;
  CFArrayRef v34;
  CFArrayRef theArray;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v14 = a7;
  v15 = a8;
  v34 = 0;
  theArray = 0;
  v33.receiver = self;
  v33.super_class = (Class)WFOtherNetworkContext;
  v16 = -[WFOtherNetworkContext init](&v33, sel_init);
  v17 = v16;
  if (!v16)
    goto LABEL_25;
  v16->_type = a3;
  v16->_availableAuthTraits = a4;
  if ((a4 & 1) != 0)
  {
    if (!WFWAPIRootCertificateListCreate((CFTypeRef *)&theArray) && CFArrayGetCount(theArray))
      objc_storeStrong((id *)&v17->_WAPIRootCertificates, theArray);
    if (!WFWAPIIdentityListCreate(&v34, 0) && CFArrayGetCount(v34))
      objc_storeStrong((id *)&v17->_WAPIIdentities, v34);
  }
  v32 = 0;
  WFAllIdentities(&v32);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v32 && objc_msgSend(v18, "count"))
    objc_storeStrong((id *)&v17->_availableTLSIdentities, v19);
  type = v17->_type;
  if (type)
  {
    if (type != 1)
      goto LABEL_17;
    v21 = 128;
  }
  else
  {
    v21 = 384;
  }
  v17->_requestedFields = v21;
LABEL_17:
  v17->_supportsRandomMACAddress = a5;
  v17->_isUsingRandomMACAddress = a6;
  objc_msgSend(v15, "formattedWiFiAddress");
  v22 = objc_claimAutoreleasedReturnValue();
  hardwareMACAddress = v17->_hardwareMACAddress;
  v17->_hardwareMACAddress = (NSString *)v22;

  objc_msgSend(v14, "formattedWiFiAddress");
  v24 = objc_claimAutoreleasedReturnValue();
  randomMACAddress = v17->_randomMACAddress;
  v17->_randomMACAddress = (NSString *)v24;

  WFLogForCategory(0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v26)
  {
    v28 = v26;
    if (os_log_type_enabled(v28, v27))
    {
      v29 = a4 & 1;
      availableTLSIdentities = v17->_availableTLSIdentities;
      if (availableTLSIdentities)
        LODWORD(availableTLSIdentities) = -[NSArray count](availableTLSIdentities, "count");
      *(_DWORD *)buf = 136315650;
      v37 = "-[WFOtherNetworkContext initWithType:authTraits:supportRandomAddress:useRandomAddress:randomMACAddress:hardwareMACAddress:]";
      v38 = 1024;
      v39 = v29;
      v40 = 1024;
      v41 = (int)availableTLSIdentities;
      _os_log_impl(&dword_219FC8000, v28, v27, "%s: WAPIEnabled: %d tlsIdentities %d", buf, 0x18u);
    }

  }
LABEL_25:

  return v17;
}

- (void)finishWithError:(id)a3 forNetwork:(id)a4 profile:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  WFNetworkScanRecord *network;
  unint64_t v14;
  void *v15;
  int v16;
  void *v17;
  os_log_type_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  os_log_type_t v22;
  NSObject *v23;
  int64_t requestedFields;
  void *v25;
  int v26;
  void *v27;
  os_log_type_t v28;
  NSObject *v29;
  void *v30;
  NSUInteger v31;
  NSObject *v32;
  os_log_type_t v33;
  NSObject *v34;
  os_log_type_t v35;
  objc_super v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  NSUInteger v40;
  __int16 v41;
  int64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFOtherNetworkContext setNetwork:](self, "setNetwork:", v9);
  -[WFOtherNetworkContext setProfile:](self, "setProfile:", v10);
  WFLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
  {
    network = self->_network;
    *(_DWORD *)buf = 136315650;
    v38 = "-[WFOtherNetworkContext finishWithError:forNetwork:profile:]";
    v39 = 2112;
    v40 = (NSUInteger)network;
    v41 = 2112;
    v42 = (int64_t)v10;
    _os_log_impl(&dword_219FC8000, v11, v12, "%s: network %@ profile %@", buf, 0x20u);
  }

  if (v8)
  {
    v14 = objc_msgSend(v8, "code");
    if (v14 <= 0x11)
    {
      if (((1 << v14) & 0x8B) != 0)
      {
        if (self->_type != 1)
        {
          requestedFields = 385;
          goto LABEL_44;
        }
        -[WFOtherNetworkContext network](self, "network");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEnterprise");

        if (v16)
        {
          WFLogForCategory(0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v17)
          {
            v19 = v17;
            if (os_log_type_enabled(v19, v18))
            {
              -[WFOtherNetworkContext network](self, "network");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v38 = "-[WFOtherNetworkContext finishWithError:forNetwork:profile:]";
              v39 = 2112;
              v40 = (NSUInteger)v20;
              _os_log_impl(&dword_219FC8000, v19, v18, "%s: network %@ is enterprise", buf, 0x16u);

            }
          }

          if (self->_availableTLSIdentities)
          {
            WFLogForCategory(0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = OSLogForWFLogLevel(4uLL);
            if ((unint64_t)WFCurrentLogLevel() < 4 || !v21)
              goto LABEL_35;
            v23 = v21;
            if (!os_log_type_enabled(v23, v22))
            {
LABEL_34:

LABEL_35:
              requestedFields = 15;
              goto LABEL_44;
            }
LABEL_33:
            v31 = -[NSArray count](self->_availableTLSIdentities, "count");
            *(_DWORD *)buf = 136315394;
            v38 = "-[WFOtherNetworkContext finishWithError:forNetwork:profile:]";
            v39 = 2048;
            v40 = v31;
            _os_log_impl(&dword_219FC8000, v23, v22, "%s: available TLS identities %lu", buf, 0x16u);
            goto LABEL_34;
          }
LABEL_43:
          requestedFields = 3;
LABEL_44:
          WFLogForCategory(0);
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v34 && os_log_type_enabled(v34, v35))
          {
            *(_DWORD *)buf = 136315650;
            v38 = "-[WFOtherNetworkContext finishWithError:forNetwork:profile:]";
            v39 = 2112;
            v40 = (NSUInteger)v8;
            v41 = 2048;
            v42 = requestedFields;
            _os_log_impl(&dword_219FC8000, v34, v35, "%s: error %@ newRequested fields %ld", buf, 0x20u);
          }

          self->_requestedFields = requestedFields;
          goto LABEL_49;
        }
        goto LABEL_36;
      }
      if (v14 == 17)
      {
        if (self->_type != 1)
        {
          requestedFields = 0;
          goto LABEL_44;
        }
        -[WFOtherNetworkContext network](self, "network");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEnterprise");

        if (v26)
        {
          WFLogForCategory(0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v27)
          {
            v29 = v27;
            if (os_log_type_enabled(v29, v28))
            {
              -[WFOtherNetworkContext network](self, "network");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v38 = "-[WFOtherNetworkContext finishWithError:forNetwork:profile:]";
              v39 = 2112;
              v40 = (NSUInteger)v30;
              _os_log_impl(&dword_219FC8000, v29, v28, "%s: network %@ is enterprise", buf, 0x16u);

            }
          }

          if (self->_availableTLSIdentities)
          {
            WFLogForCategory(0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = OSLogForWFLogLevel(4uLL);
            if ((unint64_t)WFCurrentLogLevel() < 4 || !v21)
              goto LABEL_35;
            v23 = v21;
            if (!os_log_type_enabled(v23, v22))
              goto LABEL_34;
            goto LABEL_33;
          }
          goto LABEL_43;
        }
LABEL_36:
        requestedFields = 1;
        goto LABEL_44;
      }
    }
    WFLogForCategory(0);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v32 && os_log_type_enabled(v32, v33))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[WFOtherNetworkContext finishWithError:forNetwork:profile:]";
      v39 = 2112;
      v40 = (NSUInteger)v8;
      _os_log_impl(&dword_219FC8000, v32, v33, "%s: unhandled error %@", buf, 0x16u);
    }

    requestedFields = self->_requestedFields;
    goto LABEL_44;
  }
LABEL_49:
  v36.receiver = self;
  v36.super_class = (Class)WFOtherNetworkContext;
  -[WFCredentialsContext finishWithError:forNetwork:profile:](&v36, sel_finishWithError_forNetwork_profile_, v8, v9, v10);

}

- (BOOL)validateCredentials
{
  void *v3;
  void *v4;
  int64_t requestedFields;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  objc_super v12;

  -[WFCredentialsContext provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_type != 1)
  {
    if (-[WFOtherNetworkContext securityMode](self, "securityMode"))
      goto LABEL_15;
    goto LABEL_10;
  }
  requestedFields = self->_requestedFields;
  if ((requestedFields & 0x80) == 0)
  {
LABEL_9:
    if (requestedFields != 128)
      goto LABEL_15;
LABEL_10:
    objc_msgSend(v4, "SSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEmpty") & 1) != 0)
    {

    }
    else
    {
      objc_msgSend(v4, "SSID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v9 = 1;
        goto LABEL_16;
      }
    }
LABEL_15:
    v12.receiver = self;
    v12.super_class = (Class)WFOtherNetworkContext;
    v9 = -[WFCredentialsContext validateCredentials](&v12, sel_validateCredentials);
    goto LABEL_16;
  }
  objc_msgSend(v3, "SSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEmpty"))
  {
    objc_msgSend(v4, "SSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_12;
    requestedFields = self->_requestedFields;
    goto LABEL_9;
  }

LABEL_12:
  v9 = 0;
LABEL_16:

  return v9;
}

- (BOOL)validatePassword
{
  void *v3;
  void *v4;
  int64_t requestedFields;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  objc_super v12;

  -[WFCredentialsContext provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_type != 1)
  {
    if (-[WFOtherNetworkContext securityMode](self, "securityMode"))
      goto LABEL_15;
    goto LABEL_10;
  }
  requestedFields = self->_requestedFields;
  if ((requestedFields & 0x80) == 0)
  {
LABEL_9:
    if (requestedFields != 128)
      goto LABEL_15;
LABEL_10:
    objc_msgSend(v4, "SSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEmpty") & 1) != 0)
    {

    }
    else
    {
      objc_msgSend(v4, "SSID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v9 = 1;
        goto LABEL_16;
      }
    }
LABEL_15:
    v12.receiver = self;
    v12.super_class = (Class)WFOtherNetworkContext;
    v9 = -[WFCredentialsContext validatePassword](&v12, sel_validatePassword);
    goto LABEL_16;
  }
  objc_msgSend(v3, "SSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEmpty"))
  {
    objc_msgSend(v4, "SSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_12;
    requestedFields = self->_requestedFields;
    goto LABEL_9;
  }

LABEL_12:
  v9 = 0;
LABEL_16:

  return v9;
}

- (void)_updateActivityStringForError:(id)a3 networkName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[WFCredentialsContext provider](self, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkFailedPromptFormat"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v11, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      WFLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
      {
        *(_DWORD *)buf = 136315650;
        v17 = "-[WFOtherNetworkContext _updateActivityStringForError:networkName:]";
        v18 = 2112;
        v19 = v6;
        v20 = 2112;
        v21 = v12;
        _os_log_impl(&dword_219FC8000, v13, v14, "%s: error %@ activityString %@", buf, 0x20u);
      }

    }
    else
    {
      v12 = 0;
    }
    -[WFCredentialsContext provider](self, "provider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActivityString:", v12);

  }
}

- (void)gatherCredentials:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  WFUserSuppliedNetwork *v23;
  void *v24;
  void *v25;
  os_log_type_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  uint64_t v33;
  void *v34;
  os_log_type_t v35;
  WFUserSuppliedNetwork *v36;
  WFOtherNetworkContext *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  os_log_type_t v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  WFOtherNetworkContext *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  const void *v61;
  void *v62;
  void *v63;
  BOOL v64;
  uint64_t v65;
  void *v66;
  __SecCertificate *v67;
  void *v68;
  void *v69;
  os_log_type_t v70;
  NSObject *v71;
  void *v72;
  void *v73;
  id v74;
  WFUserSuppliedNetwork *v75;
  void *v76;
  __CFArray *obj;
  objc_super v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __CFArray *v83;
  _BYTE v84[128];
  _BYTE buf[12];
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  uint64_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFCredentialsContext provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "SSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFOtherNetworkContext network](self, "network");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[WFOtherNetworkContext network](self, "network");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ssid");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v6;
  }

  if ((objc_msgSend(v6, "isEqualToString:", v9) & 1) == 0)
  {
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[WFOtherNetworkContext gatherCredentials:]";
      v86 = 2112;
      v87 = (uint64_t)v9;
      v88 = 2112;
      v89 = v6;
      _os_log_impl(&dword_219FC8000, v10, v11, "%s: network name changed from %@ -> %@", buf, 0x20u);
    }

    v12 = v6;
    v9 = v12;
  }
  -[WFCredentialsContext provider](self, "provider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[WFCredentialsContext provider](self, "provider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setJoining:", 1);

  }
  -[WFCredentialsContext provider](self, "provider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkJoiningPromptFormat"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v20, v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCredentialsContext provider](self, "provider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActivityString:", v21);

  }
  v23 = objc_alloc_init(WFUserSuppliedNetwork);
  v76 = v9;
  -[WFUserSuppliedNetwork setSsid:](v23, "setSsid:", v9);
  -[WFOtherNetworkContext network](self, "network");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    WFLogForCategory(0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v25)
    {
      v27 = v25;
      if (os_log_type_enabled(v27, v26))
      {
        -[WFOtherNetworkContext network](self, "network");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[WFOtherNetworkContext gatherCredentials:]";
        v86 = 2112;
        v87 = (uint64_t)v28;
        _os_log_impl(&dword_219FC8000, v27, v26, "%s: using security mode from network: %@", buf, 0x16u);

      }
    }

    -[WFOtherNetworkContext network](self, "network");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFUserSuppliedNetwork setSecurity:](v23, "setSecurity:", objc_msgSend(v29, "securityMode"));

  }
  -[WFCredentialsContext provider](self, "provider");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_opt_respondsToSelector();

  if ((v31 & 1) != 0)
  {
    -[WFCredentialsContext provider](self, "provider");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "securityMode");

    WFLogForCategory(0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v34)
    {
      v36 = v23;
      v37 = self;
      v38 = v34;
      if (os_log_type_enabled(v38, v35))
      {
        -[WFCredentialsContext provider](v37, "provider");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = WFWiFiSecurityModeFromOtherSecurityMode(v33);
        WFStringFromWFSecurityMode(v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[WFOtherNetworkContext gatherCredentials:]";
        v86 = 2112;
        v87 = (uint64_t)v39;
        v88 = 2112;
        v89 = v41;
        v90 = 2048;
        v91 = v33;
        _os_log_impl(&dword_219FC8000, v38, v35, "%s: using security mode from provider: %@ - %@ (%ld)", buf, 0x2Au);

      }
      self = v37;
      v23 = v36;
    }

    -[WFUserSuppliedNetwork setSecurity:](v23, "setSecurity:", WFWiFiSecurityModeFromOtherSecurityMode(v33));
  }
  -[WFCredentialsContext provider](self, "provider");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "username");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFUserSuppliedNetwork setUsername:](v23, "setUsername:", v43);

  -[WFCredentialsContext provider](self, "provider");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "password");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFUserSuppliedNetwork setPassword:](v23, "setPassword:", v45);

  -[WFCredentialsContext provider](self, "provider");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFUserSuppliedNetwork setTLSIdentity:](v23, "setTLSIdentity:", objc_msgSend(v46, "TLSIdentity"));

  WFLogForCategory(0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v47)
  {
    v49 = v47;
    if (os_log_type_enabled(v49, v48))
    {
      v50 = -[WFUserSuppliedNetwork security](v23, "security");
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFOtherNetworkContext gatherCredentials:]";
      v86 = 2048;
      v87 = v50;
      _os_log_impl(&dword_219FC8000, v49, v48, "%s: otherNetworkRecord.security: %ld", buf, 0x16u);
    }

  }
  v75 = v23;
  if (-[WFUserSuppliedNetwork security](v23, "security") == 128)
  {
    -[WFCredentialsContext provider](self, "provider");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[WFCredentialsContext provider](self, "provider");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_opt_respondsToSelector();

      if ((v53 & 1) != 0)
      {
        *(_QWORD *)buf = 0;
        v83 = 0;
        v54 = 0;
        if (!WFWAPIIdentityListCreate((__CFArray **)buf, &v83))
        {
          if (CFArrayGetCount(*(CFArrayRef *)buf))
          {
            v55 = self;
            v73 = v6;
            v74 = v4;
            v81 = 0u;
            v82 = 0u;
            v79 = 0u;
            v80 = 0u;
            obj = v83;
            v56 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
            if (v56)
            {
              v57 = v56;
              v54 = 0;
              v58 = *(_QWORD *)v80;
              do
              {
                for (i = 0; i != v57; ++i)
                {
                  if (*(_QWORD *)v80 != v58)
                    objc_enumerationMutation(obj);
                  v60 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
                  v61 = (const void *)objc_msgSend(v60, "valueForKey:", CFSTR("certRef"));
                  -[WFCredentialsContext provider](v55, "provider");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "WAPIIdentity");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v61)
                    v64 = v63 == 0;
                  else
                    v64 = 1;
                  if (!v64 && CFEqual(v61, v63))
                  {
                    objc_msgSend(v60, "valueForKey:", CFSTR("pemData"));
                    v65 = objc_claimAutoreleasedReturnValue();

                    v54 = (void *)v65;
                  }
                }
                v57 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
              }
              while (v57);
            }
            else
            {
              v54 = 0;
            }

            v6 = v73;
            v4 = v74;
            self = v55;
          }
          else
          {
            v54 = 0;
          }
        }
        -[WFCredentialsContext provider](self, "provider");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "WAPIRootCertificate");
        v67 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
        WFWAPICertificateBlobString(v67, v54);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFUserSuppliedNetwork setPassword:](v75, "setPassword:", v68);

      }
    }
    else
    {

    }
  }
  WFLogForCategory(0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v69)
  {
    v71 = v69;
    if (os_log_type_enabled(v71, v70))
    {
      WFStringFromWFSecurityMode(-[WFUserSuppliedNetwork security](v75, "security"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[WFOtherNetworkContext gatherCredentials:]";
      v86 = 2112;
      v87 = (uint64_t)v76;
      v88 = 2112;
      v89 = v72;
      _os_log_impl(&dword_219FC8000, v71, v70, "%s: user joining other network %@ (security %@)", buf, 0x20u);

    }
  }

  -[WFOtherNetworkContext setUserSuppliedNetwork:](self, "setUserSuppliedNetwork:", v75);
  v78.receiver = self;
  v78.super_class = (Class)WFOtherNetworkContext;
  -[WFCredentialsContext gatherCredentials:](&v78, sel_gatherCredentials_, v4);

}

- (int64_t)securityMode
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[WFOtherNetworkContext network](self, "network");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "securityMode");

  if (self->_type != 1)
  {
    -[WFCredentialsContext provider](self, "provider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "conformsToProtocol:", &unk_2550F25B8) & 1) == 0)
    {
LABEL_9:

      return v4;
    }
    -[WFCredentialsContext provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[WFCredentialsContext provider](self, "provider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = WFWiFiSecurityModeFromOtherSecurityMode(objc_msgSend(v8, "securityMode"));

      WFLogForCategory(0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v5)
      {
        v10 = v5;
        if (os_log_type_enabled(v10, v9))
        {
          -[WFCredentialsContext provider](self, "provider");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 136315650;
          v14 = "-[WFOtherNetworkContext securityMode]";
          v15 = 2112;
          v16 = v11;
          v17 = 2048;
          v18 = v4;
          _os_log_impl(&dword_219FC8000, v10, v9, "%s: using provider (%@) securityMode %ld", (uint8_t *)&v13, 0x20u);

        }
      }
      goto LABEL_9;
    }
  }
  return v4;
}

- (BOOL)isEnterprise
{
  void *v3;
  char v4;

  -[WFOtherNetworkContext network](self, "network");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnterprise");

  if (self->_type == 1)
    return v4;
  else
    return WFSecurityModeIsEnterprise(-[WFOtherNetworkContext securityMode](self, "securityMode"));
}

- (void)otherNetworkViewControllerUserDidTapJoin:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id from;
  id location;

  v4 = a3;
  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66__WFOtherNetworkContext_otherNetworkViewControllerUserDidTapJoin___block_invoke;
  v5[3] = &unk_24DC354B8;
  objc_copyWeak(&v6, &location);
  objc_copyWeak(&v7, &from);
  v5[4] = self;
  -[WFOtherNetworkContext gatherCredentials:](self, "gatherCredentials:", v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __66__WFOtherNetworkContext_otherNetworkViewControllerUserDidTapJoin___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  v4 = a1 + 5;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "setJoining:", 0);

  v9 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(a1[4], "network");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ssid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_updateActivityStringForError:networkName:", v5, v8);

}

- (BOOL)otherNetworkViewController:(id)a3 isValidPassword:(id)a4
{
  id v5;
  uint64_t v6;

  v5 = a4;
  v6 = WFWiFiSecurityModeFromOtherSecurityMode(objc_msgSend(a3, "securityMode"));
  LOBYTE(a3) = WFValidPasswordForSecurityMode(v6, v5);

  return (char)a3;
}

- (void)savePrivateAddressMode:(unint64_t)a3
{
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v9 = 134217984;
    v10 = a3;
    _os_log_impl(&dword_219FC8000, v5, v6, "User joining other network using private address mode: %ld", (uint8_t *)&v9, 0xCu);
  }

  -[WFOtherNetworkContext privateAddressModeChangeHandler](self, "privateAddressModeChangeHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFOtherNetworkContext privateAddressModeChangeHandler](self, "privateAddressModeChangeHandler");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8[2](v8, a3);

  }
}

- (NSArray)availableTLSIdentities
{
  return self->_availableTLSIdentities;
}

- (void)setAvailableTLSIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_availableTLSIdentities, a3);
}

- (BOOL)isPasswordSharingSupported
{
  return self->passwordSharingSupported;
}

- (int64_t)requestedFields
{
  return self->_requestedFields;
}

- (void)setRequestedFields:(int64_t)a3
{
  self->_requestedFields = a3;
}

- (NSString)username
{
  return self->username;
}

- (WFNetworkScanRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_network, a3);
}

- (int64_t)availableAuthTraits
{
  return self->_availableAuthTraits;
}

- (void)setAvailableAuthTraits:(int64_t)a3
{
  self->_availableAuthTraits = a3;
}

- (BOOL)supportsRandomMACAddress
{
  return self->_supportsRandomMACAddress;
}

- (void)setSupportsRandomMACAddress:(BOOL)a3
{
  self->_supportsRandomMACAddress = a3;
}

- (BOOL)isUsingRandomMACAddress
{
  return self->_isUsingRandomMACAddress;
}

- (void)setIsUsingRandomMACAddress:(BOOL)a3
{
  self->_isUsingRandomMACAddress = a3;
}

- (NSString)randomMACAddress
{
  return self->_randomMACAddress;
}

- (void)setRandomMACAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)hardwareMACAddress
{
  return self->_hardwareMACAddress;
}

- (void)setHardwareMACAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (WFUserSuppliedNetwork)userSuppliedNetwork
{
  return self->_userSuppliedNetwork;
}

- (void)setUserSuppliedNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_userSuppliedNetwork, a3);
}

- (id)privateAddressModeChangeHandler
{
  return self->_privateAddressModeChangeHandler;
}

- (void)setPrivateAddressModeChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSArray)WAPIRootCertificates
{
  return self->_WAPIRootCertificates;
}

- (void)setWAPIRootCertificates:(id)a3
{
  objc_storeStrong((id *)&self->_WAPIRootCertificates, a3);
}

- (NSArray)WAPIIdentities
{
  return self->_WAPIIdentities;
}

- (void)setWAPIIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_WAPIIdentities, a3);
}

- (WFNetworkProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_WAPIIdentities, 0);
  objc_storeStrong((id *)&self->_WAPIRootCertificates, 0);
  objc_storeStrong(&self->_privateAddressModeChangeHandler, 0);
  objc_storeStrong((id *)&self->_userSuppliedNetwork, 0);
  objc_storeStrong((id *)&self->_hardwareMACAddress, 0);
  objc_storeStrong((id *)&self->_randomMACAddress, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->username, 0);
  objc_storeStrong((id *)&self->_availableTLSIdentities, 0);
}

@end
