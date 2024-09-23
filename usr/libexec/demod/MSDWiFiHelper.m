@implementation MSDWiFiHelper

+ (id)sharedInstance
{
  if (qword_1001755F8 != -1)
    dispatch_once(&qword_1001755F8, &stru_10013FD88);
  return (id)qword_1001755F0;
}

- (MSDWiFiHelper)init
{
  MSDWiFiHelper *v2;
  id v3;
  void *v4;
  void *v5;
  MSDWiFiHelper *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSDWiFiHelper;
  v2 = -[MSDWiFiHelper init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)CWFInterface);
    -[MSDWiFiHelper setWifiInterface:](v2, "setWifiInterface:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](v2, "wifiInterface"));
    objc_msgSend(v4, "activate");

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    -[MSDWiFiHelper setDevice:](v2, "setDevice:", v5);

    v6 = v2;
  }

  return v2;
}

- (BOOL)enableWiFi:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  id v7;
  id v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  id v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;

  v3 = a3;
  -[MSDWiFiHelper waitForWiFiInterface](self, "waitForWiFiInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
  v15 = 0;
  v6 = objc_msgSend(v5, "setPower:error:", v3, &v15);
  v7 = v15;

  if ((v6 & 1) == 0)
  {
    v13 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000CB5BC();

  }
  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = "Failed";
    if (v6)
      v10 = "Succeeded";
    v11 = "Enable";
    if (!v3)
      v11 = "Disable";
    *(_DWORD *)buf = 136446466;
    v17 = v10;
    v18 = 2082;
    v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "enableWiFi - Operation %{public}s: %{public}s", buf, 0x16u);
  }

  return v6;
}

- (BOOL)configureWiFi:(id)a3 password:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  __CFString *v14;
  void *v15;
  BOOL v16;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  uint8_t buf[16];

  v6 = a3;
  v7 = (__CFString *)a4;
  if (!-[MSDWiFiHelper enableWiFi:](self, "enableWiFi:", 1))
  {
    v18 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000CB674();
    goto LABEL_21;
  }
  if (!-[MSDWiFiHelper connectTo:password:](self, "connectTo:password:", v6, v7))
  {
    v19 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000CB648();
    goto LABEL_21;
  }
  -[MSDWiFiHelper forgetAllKnownWiFiNetworksExcept:](self, "forgetAllKnownWiFiNetworksExcept:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper device](self, "device"));
  v9 = objc_msgSend(v8, "isContentFrozen");

  if (!v9)
  {
    v16 = 1;
    goto LABEL_13;
  }
  v10 = sub_1000604F0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Saving wifi ssid and password to demo volume.", buf, 2u);
  }

  v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v6, CFSTR("SSID"), 0));
  if (!v7 || (v13 = -[__CFString length](v7, "length"), v14 = v7, !v13))
    v14 = &stru_100141020;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString dataUsingEncoding:](v14, "dataUsingEncoding:", 4));
  -[NSObject setObject:forKey:](v12, "setObject:forKey:", v15, CFSTR("Password"));

  if (!-[MSDWiFiHelper saveWiFiSettingsToPreferences:](self, "saveWiFiSettingsToPreferences:", v12))
  {
    v20 = sub_1000604F0();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1000CB61C();

LABEL_21:
    v16 = 0;
    goto LABEL_11;
  }
  v16 = 1;
LABEL_11:

LABEL_13:
  return v16;
}

- (void)configureWiFiWithPersistentSettings
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  unsigned __int8 v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  int v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper loadWiFiSettingsFromPreferences](self, "loadWiFiSettingsFromPreferences"));
  v4 = v3;
  if (!v3)
  {
    v15 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000CB6A0();
    v5 = 0;
    v9 = 0;
    v8 = 0;
    goto LABEL_23;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("SSID")));
  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138543362;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Enforcing WiFi settings to AP with SSID - %{public}@", (uint8_t *)&v19, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Password")));
  if (objc_msgSend(v8, "length"))
  {
    v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v8, 4);
    if (!v9)
    {
      v10 = sub_1000604F0();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1000CB724();
      v9 = 0;
LABEL_23:

      v18 = sub_1000604F0();
      v14 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "WiFi settings not enforced.", (uint8_t *)&v19, 2u);
      }
      goto LABEL_14;
    }
  }
  else
  {
    v9 = 0;
  }
  if (!-[MSDWiFiHelper enableWiFi:](self, "enableWiFi:", 1))
  {
    v16 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000CB6F8();
    goto LABEL_23;
  }
  if (!-[MSDWiFiHelper connectTo:password:](self, "connectTo:password:", v5, v9))
  {
    v17 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000CB6CC();
    goto LABEL_23;
  }
  -[MSDWiFiHelper forgetAllKnownWiFiNetworksExcept:](self, "forgetAllKnownWiFiNetworksExcept:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper device](self, "device"));
  v13 = objc_msgSend(v12, "isContentFrozen");

  if ((v13 & 1) == 0)
  {
    v14 = objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper device](self, "device"));
    -[NSObject setWifiSettings:](v14, "setWifiSettings:", 0);
LABEL_14:

  }
}

- (id)getCurrentWiFiSettings:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  NSObject *v30;
  id v31;
  uint8_t buf[16];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentKnownNetworkProfile"));

  if (!v6)
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to get current known network profile, fetching last joined wifi network...", buf, 2u);
    }

    v6 = objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper lastJoinedWiFiNetworksProfile](self, "lastJoinedWiFiNetworksProfile"));
    if (!v6)
    {
      v28 = sub_1000604F0();
      v6 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_1000CB750();
      goto LABEL_18;
    }
  }
  v9 = objc_claimAutoreleasedReturnValue(-[NSObject networkName](v6, "networkName"));
  if (!v9)
  {
    v29 = sub_1000604F0();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_1000CB77C();

    goto LABEL_18;
  }
  v10 = (void *)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v9, CFSTR("SSID"), 0));
  if (v3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject SSID](v6, "SSID"));
    v31 = 0;
    v13 = CWFSecItemQueryPassword(v12, &v31);
    v14 = (__CFString *)v31;

    if ((_DWORD)v13 == -25300 || !(_DWORD)v13)
    {
      if (!v14 || (v15 = -[__CFString length](v14, "length"), v16 = v14, !v15))
        v16 = &stru_100141020;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString dataUsingEncoding:](v16, "dataUsingEncoding:", 4));
      objc_msgSend(v11, "setObject:forKey:", v17, CFSTR("Password"));

      goto LABEL_13;
    }
    v20 = sub_1000604F0();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1000CB7A8(v13, v21, v22, v23, v24, v25, v26, v27);

LABEL_18:
    v18 = 0;
    goto LABEL_14;
  }
LABEL_13:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v11));

LABEL_14:
  return v18;
}

- (void)saveCurrentWiFiSettings
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Saving current wifi settings.", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper getCurrentWiFiSettings:](self, "getCurrentWiFiSettings:", 1));
  if (v5 && !-[MSDWiFiHelper saveWiFiSettingsToPreferences:](self, "saveWiFiSettingsToPreferences:", v5))
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000CB80C();

  }
}

- (id)getPersistentWiFiSsid
{
  void *v2;
  void *v3;
  void *v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper loadWiFiSettingsFromPreferences](self, "loadWiFiSettingsFromPreferences"));
  v3 = v2;
  if (!v2)
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000CB838(v7, v8, v9, v10, v11, v12, v13, v14);
    goto LABEL_8;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("SSID")));
  if (!v4)
  {
    v15 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000CB8A8(v7, v16, v17, v18, v19, v20, v21, v22);
LABEL_8:

    v4 = 0;
  }

  return v4;
}

- (id)getCurrentWiFiSsid
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper getCurrentWiFiSettings:](self, "getCurrentWiFiSettings:", 0));
  v3 = v2;
  if (v2)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("SSID")));
  else
    v4 = 0;

  return v4;
}

- (int64_t)getCurrentWiFiSignalStrength
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentKnownNetworkProfile"));

  if (!v4)
    return -100;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
  v6 = objc_msgSend(v5, "RSSI");

  return (int64_t)v6;
}

- (void)disassociateAndForgetWiFi
{
  void *v3;
  id v4;

  -[MSDWiFiHelper forgetAllKnownWiFiNetworksExcept:](self, "forgetAllKnownWiFiNetworksExcept:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
  objc_msgSend(v3, "disassociateWithReason:", 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper device](self, "device"));
  objc_msgSend(v4, "setWifiSettings:", 0);

}

- (BOOL)connectTo:(id)a3 password:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  id v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  id v50;
  void *v51;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  _BYTE v61[128];
  id v62;

  v5 = a3;
  v50 = a4;
  v6 = objc_alloc_init((Class)CWFScanParameters);
  objc_msgSend(v6, "setIncludeHiddenNetworks:", 1);
  v62 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v62, 1));
  objc_msgSend(v6, "setSSIDList:", v7);

  objc_msgSend(v6, "setMinimumRSSI:", -80);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10014E6F0));
  v51 = v6;
  objc_msgSend(v6, "setIncludeProperties:", v8);

  v9 = 0;
  v10 = 3;
  while (1)
  {
    v11 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
    v58 = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "performScanWithParameters:error:", v51, &v58));
    v9 = v58;

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    if (v15)
      break;
LABEL_11:

LABEL_15:
    sleep(3u);

    if (!--v10)
    {
      v27 = sub_1000604F0();
      v26 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_1000CB918(v26, v28, v29, v30, v31, v32, v33, v34);
      v35 = 0;
      v36 = v50;
      goto LABEL_29;
    }
  }
  v16 = v15;
  v17 = 0;
  v18 = *(_QWORD *)v55;
LABEL_4:
  v19 = 0;
  v20 = v17;
  while (1)
  {
    if (*(_QWORD *)v55 != v18)
      objc_enumerationMutation(v14);
    v17 = *(id *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "networkName"));
    v22 = objc_msgSend(v21, "isEqualToString:", v5);

    if (v22)
      break;
    v19 = (char *)v19 + 1;
    v20 = v17;
    if (v16 == v19)
    {
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
      if (v16)
        goto LABEL_4;

      goto LABEL_11;
    }
  }
  v23 = sub_1000604F0();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "networkName"));
    *(_DWORD *)buf = 138543362;
    v60 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Found the wifi with ssid '%{public}@'", buf, 0xCu);

  }
  v26 = v17;

  if (!v26)
    goto LABEL_15;

  v37 = objc_alloc_init((Class)CWFAssocParameters);
  objc_msgSend(v37, "setScanResult:", v26);
  objc_msgSend(v37, "setRememberUponSuccessfulAssociation:", 1);
  v36 = v50;
  objc_msgSend(v37, "setPassword:", v50);
  v38 = objc_alloc_init((Class)CWFNetworkProfile);
  objc_msgSend(v37, "setKnownNetworkProfile:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "knownNetworkProfile"));
  objc_msgSend(v39, "setHiddenState:", 1);

  v40 = -3;
  while (1)
  {
    v41 = v9;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
    v53 = v9;
    v43 = objc_msgSend(v42, "associateWithParameters:error:", v37, &v53);
    v9 = v53;

    if ((v43 & 1) != 0)
      break;
    sleep(3u);
    if (__CFADD__(v40++, 1))
    {
      v45 = sub_1000604F0();
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        sub_1000CB984();

      v35 = 0;
      goto LABEL_29;
    }
  }
  v47 = sub_1000604F0();
  v48 = objc_claimAutoreleasedReturnValue(v47);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Connected to wifi.", buf, 2u);
  }

  v35 = 1;
LABEL_29:

  return v35;
}

- (void)waitForWiFiInterface
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint8_t v18[16];
  id v19;
  _QWORD v20[4];
  id v21;

  v3 = objc_alloc_init((Class)NSCondition);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 5.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000AAC08;
  v20[3] = &unk_10013FDB0;
  v6 = v3;
  v21 = v6;
  objc_msgSend(v5, "setEventHandler:", v20);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
  v19 = 0;
  v8 = objc_msgSend(v7, "startMonitoringEventType:error:", 10, &v19);
  v9 = v19;

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v6, "lock");
    while (1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interfaceName"));

      if (v11)
        break;
      v12 = sub_1000604F0();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Wifi interface is not intialized, waiting for  CWFEventTypeInterfaceAdded event.", v18, 2u);
      }

      if ((objc_msgSend(v6, "waitUntilDate:", v4) & 1) == 0)
      {
        v14 = sub_1000604F0();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Wait for wifi interface initialization timed out after 5 seconds", v18, 2u);
        }

        break;
      }
    }
    objc_msgSend(v6, "unlock");
    v16 = objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
    -[NSObject stopMonitoringEventType:](v16, "stopMonitoringEventType:", 10);
  }
  else
  {
    v17 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000CB9E4();
  }

}

- (void)forgetAllKnownWiFiNetworksExcept:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Forgetting all known WiFi networks except: '%{public}@'...", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "knownNetworkProfilesWithProperties:", 0));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        if (v4
          && (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1)
                                                                                 + 8 * (_QWORD)i), "networkName")),
              v16 = objc_msgSend(v15, "isEqualToString:", v4),
              v15,
              v16))
        {
          v17 = sub_1000604F0();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Found known WiFi network with matching ssid!", buf, 2u);
          }
        }
        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
          v24 = 0;
          v20 = objc_msgSend(v19, "removeKnownNetworkProfile:reason:error:", v14, 0, &v24);
          v18 = v24;

          if ((v20 & 1) == 0)
          {
            v22 = sub_1000604F0();
            v23 = objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              sub_1000CBA44(v18, v23);

            goto LABEL_20;
          }
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "SSID"));
          CWFSecItemSetPassword(v21, 0);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_20:

}

- (id)lastJoinedWiFiNetworksProfile
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "knownNetworkProfilesWithProperties:", 0));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (v7
          || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "lastJoinedAt", (_QWORD)v20)), v15, !v15))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastJoinedAt", (_QWORD)v20));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastJoinedAt"));
          v13 = objc_msgSend(v11, "compare:", v12);

          if (v13 == (id)1)
          {
            v14 = v10;

            v7 = v14;
          }
        }
        else
        {
          v7 = v10;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  v16 = sub_1000604F0();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "networkName"));
    *(_DWORD *)buf = 138543362;
    v25 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Last joined WiFi network SSID: %{public}@", buf, 0xCu);

  }
  return v7;
}

- (BOOL)isValidWiFiSettings:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t v13[16];

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No WiFi settings found.", v13, 2u);
    }
    v6 = 0;
    goto LABEL_9;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("SSID")));
  v6 = v5;
  if (!v5
    || !objc_msgSend(v5, "length")
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Password")))) == 0)
  {
    v12 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000CBAD4();
LABEL_9:

    v7 = 0;
    v8 = 0;
    goto LABEL_10;
  }
  v8 = 1;
LABEL_10:

  return v8;
}

- (id)loadWiFiSettingsFromPreferences
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v12;
  id v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper device](self, "device"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wifiSettings"));
  v5 = objc_msgSend(v4, "mutableCopy");

  if (!v5)
  {
    v12 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Persistent WiFi settings does not exist", buf, 2u);
    }
    goto LABEL_8;
  }
  if (-[MSDWiFiHelper isValidWiFiSettings:](self, "isValidWiFiSettings:", v5))
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Password")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCryptoHandler sharedInstance](MSDCryptoHandler, "sharedInstance"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "performCryptoWithSecretKeyOnData:isDecipher:", v6, 1));

    if (v8)
    {
      objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("Password"));
      v9 = sub_1000604F0();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "WiFi settings successfully loaded.", v14, 2u);
      }

    }
    else
    {
      v13 = sub_1000604F0();
      v8 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1000CBB00();
    }

LABEL_8:
  }
  return v5;
}

- (BOOL)saveWiFiSettingsToPreferences:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t v18[16];

  v4 = a3;
  if (-[MSDWiFiHelper isValidWiFiSettings:](self, "isValidWiFiSettings:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCryptoHandler sharedInstance](MSDCryptoHandler, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Password")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "performCryptoWithSecretKeyOnData:isDecipher:", v6, 0));

    v8 = v7 != 0;
    if (v7)
    {
      v9 = objc_msgSend(v4, "mutableCopy");
      -[NSObject setObject:forKey:](v9, "setObject:forKey:", v7, CFSTR("Password"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper device](self, "device"));
      objc_msgSend(v10, "setWifiSettings:", v9);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper device](self, "device"));
      v12 = objc_msgSend(v11, "isContentFrozen");

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper device](self, "device"));
        objc_msgSend(v13, "setShouldForgetKnownNetworkUponUnlock:", 0);

      }
      v14 = sub_1000604F0();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "WiFi settings successfully saved.", v18, 2u);
      }

    }
    else
    {
      v17 = sub_1000604F0();
      v9 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1000CBB2C();
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CWFInterface)wifiInterface
{
  return self->_wifiInterface;
}

- (void)setWifiInterface:(id)a3
{
  objc_storeStrong((id *)&self->_wifiInterface, a3);
}

- (MSDTargetDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_wifiInterface, 0);
}

@end
