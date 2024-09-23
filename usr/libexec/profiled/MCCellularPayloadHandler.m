@implementation MCCellularPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v30;
  uint8_t buf[8];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  _BYTE v38[128];

  if (MCCTHasCellular(self, a2, a3, a4, a5))
  {
    v37 = 0;
    MCCTGetManagedCellularProfile(&v37, 0);
    v8 = v37;
    if (v8)
    {
      v9 = MCCellularErrorDomain;
      v10 = MCErrorArray(CFSTR("CELLULAR_ALREADY_CONFIGURED"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v9, 36000, v11, MCErrorTypeFatal, 0));
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "attachAPN"));
      v17 = v16;
      if (v16)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "telephonyRepresentation"));
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("AttachAPN"));

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "APNs"));
      v20 = objc_msgSend(v19, "count");

      if (v20)
      {
        v30 = v17;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "APNs"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v21, "count")));

        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "APNs"));
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v25; i = (char *)i + 1)
            {
              if (*(_QWORD *)v34 != v26)
                objc_enumerationMutation(v23);
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1)
                                                                                 + 8 * (_QWORD)i), "telephonyRepresentation"));
              objc_msgSend(v22, "addObject:", v28);

            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
          }
          while (v25);
        }

        objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, CFSTR("APNs"));
        v17 = v30;
      }
      v32 = 0;
      MCCTSetManagedCellularProfile(v15, &v32);
      v12 = v32;

    }
    v14 = v12 != 0;
    if (a6 && v12)
    {
      v12 = objc_retainAutorelease(v12);
      *a6 = v12;
      v14 = 1;
    }
  }
  else
  {
    v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "APN payload was skipped because this device is not compatible with it.", buf, 2u);
    }
    v14 = 0;
    v12 = 0;
  }

  return !v14;
}

- (void)setAside
{
  int v3;
  id v4;
  id v5;
  os_log_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;

  v9 = 0;
  v10 = 0;
  v3 = MCCTGetManagedCellularProfile(&v10, &v9);
  v4 = v10;
  v5 = v9;
  if (v3)
  {
    -[MCCellularPayloadHandler setSetAsideDictionary:](self, "setSetAsideDictionary:", v4);
  }
  else
  {
    v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "MCVerboseDescription"));
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Could not set aside managed cellular settings. Error: %{public}@", buf, 0xCu);

    }
  }
  MCCTClearManagedCellularProfile(0);

}

- (void)unsetAside
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCCellularPayloadHandler setAsideDictionary](self, "setAsideDictionary"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MCCellularPayloadHandler setAsideDictionary](self, "setAsideDictionary"));
    MCCTSetManagedCellularProfile(v4, 0);

  }
}

- (void)remove
{
  void *v2;
  unsigned __int8 v3;
  char v4;
  id v5;
  os_log_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v3 = objc_msgSend(v2, "isSetAside");

  if ((v3 & 1) == 0)
  {
    v9 = 0;
    v4 = MCCTClearManagedCellularProfile(&v9);
    v5 = v9;
    if ((v4 & 1) == 0)
    {
      v6 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v7 = v6;
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "MCVerboseDescription"));
        *(_DWORD *)buf = 138543362;
        v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Could not clear managed cellular settings. Ignoring. Error: %{public}@", buf, 0xCu);

      }
    }

  }
}

- (NSDictionary)setAsideDictionary
{
  return self->_setAsideDictionary;
}

- (void)setSetAsideDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_setAsideDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setAsideDictionary, 0);
}

@end
