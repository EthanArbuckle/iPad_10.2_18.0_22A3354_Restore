@implementation MCCellularPrivateNetworkPayloadHandler

- (id)_ctPrivateNetworkProfile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new(CTGeofenceProfile);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSetName"));
  objc_msgSend(v4, "setDataSetName:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "versionNumber"));
  objc_msgSend(v4, "setVersionNumber:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "csgNetworkIdentifier"));
  objc_msgSend(v4, "setCsgNetworkIdentifier:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "networkIdentifier"));
  objc_msgSend(v4, "setNetworkIdentifier:", v8);

  return v4;
}

- (id)_installPrivateNetworkProfile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  os_log_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];

  v38 = objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCCellularPrivateNetworkPayloadHandler _ctPrivateNetworkProfile:](self, "_ctPrivateNetworkProfile:", v3));
  objc_msgSend(v4, "setCellularDataPreferred:", objc_msgSend(v3, "cellularDataPreferred"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enableNRStandalone"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enableNRStandalone"));
    v7 = objc_msgSend(v6, "BOOLValue");

    if ((v7 & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enableNRStandalone"));
      v10 = objc_msgSend(v9, "BOOLValue");

      if ((v10 & 1) != 0)
        goto LABEL_8;
      v8 = 2;
    }
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v4, "setNRStandaloneMode:", v8);
LABEL_8:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geofenceList"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_opt_new(CTGeofenceInfo);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "longitude"));
        objc_msgSend(v18, "setLongitude:", v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "latitude"));
        objc_msgSend(v18, "setLatitude:", v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "radius"));
        objc_msgSend(v18, "setRadius:", v21);

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "geofenceId"));
        objc_msgSend(v18, "setGeofenceId:", v22);

        objc_msgSend(v11, "addObject:", v18);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v14);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v11));
  objc_msgSend(v4, "setGeofenceList:", v23);

  v24 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSetName"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "versionNumber"));
    *(_DWORD *)buf = 138412546;
    v44 = v26;
    v45 = 2112;
    v46 = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Attempting to install new private network payload %@ - %@", buf, 0x16u);

  }
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "installPrivateNetworkProfile:", v4));
  if (v28)
  {
    v29 = (void *)v28;
    v30 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v29;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Installing private network payload failed with error %@", buf, 0xCu);
    }
    v31 = objc_msgSend(v29, "code");
    v32 = MCPrivateNetworkErrorDomain;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v31));
    v34 = MCErrorArray(CFSTR("PRIVATE_NETWORK_INSTALLATION_FAILED_P_CODE"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v32, 64000, v35, MCErrorTypeFatal, v33, 0));

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (void)_uninstallPrivateNetworkProfile
{
  id v3;
  void *v4;
  void *v5;
  os_log_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  os_log_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;

  v3 = objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCCellularPrivateNetworkPayloadHandler _ctPrivateNetworkProfile:](self, "_ctPrivateNetworkProfile:", v4));
  v6 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataSetName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "versionNumber"));
    v15 = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Attempting to uninstall private network payload %@ - %@", (uint8_t *)&v15, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "removePrivateNetworkProfile:", v5));
  if (v10)
  {
    v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataSetName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "versionNumber"));
      v15 = 138412802;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      v19 = 2112;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Uninstall private network payload %@ - %@ failed with error %@", (uint8_t *)&v15, 0x20u);

    }
  }

}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  void *v7;
  void *v8;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCCellularPrivateNetworkPayloadHandler _installPrivateNetworkProfile](self, "_installPrivateNetworkProfile", a3, a4, a5));
  v8 = v7;
  if (a6 && v7)
    *a6 = objc_retainAutorelease(v7);

  return v8 == 0;
}

- (void)remove
{
  -[MCCellularPrivateNetworkPayloadHandler _uninstallPrivateNetworkProfile](self, "_uninstallPrivateNetworkProfile");
}

- (void)setAside
{
  id v3;
  void *v4;
  void *v5;
  os_log_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  os_log_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;

  v3 = objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCCellularPrivateNetworkPayloadHandler _ctPrivateNetworkProfile:](self, "_ctPrivateNetworkProfile:", v4));
  v6 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataSetName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "versionNumber"));
    v15 = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting aside private network payload %@ - %@ aside", (uint8_t *)&v15, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "updatePrivateNetworkProfile:setProfileAside:", v5, 1));
  if (v10)
  {
    v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataSetName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "versionNumber"));
      v15 = 138412802;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      v19 = 2112;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Setting aside private network payload %@ - %@ failed with error %@", (uint8_t *)&v15, 0x20u);

    }
  }

}

- (void)unsetAside
{
  id v3;
  void *v4;
  void *v5;
  os_log_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  os_log_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;

  v3 = objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCCellularPrivateNetworkPayloadHandler _ctPrivateNetworkProfile:](self, "_ctPrivateNetworkProfile:", v4));
  v6 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataSetName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "versionNumber"));
    v15 = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unsetting aside private network payload %@ - %@ aside", (uint8_t *)&v15, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "updatePrivateNetworkProfile:setProfileAside:", v5, 0));
  if (v10)
  {
    v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataSetName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "versionNumber"));
      v15 = 138412802;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      v19 = 2112;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unsetting aside private network payload %@ - %@ failed with error %@", (uint8_t *)&v15, 0x20u);

    }
  }

}

@end
