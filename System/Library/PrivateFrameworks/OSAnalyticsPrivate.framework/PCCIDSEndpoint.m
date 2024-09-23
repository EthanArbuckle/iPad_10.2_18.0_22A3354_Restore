@implementation PCCIDSEndpoint

- (PCCIDSEndpoint)init
{
  PCCIDSEndpoint *v3;
  uint64_t v4;
  NSMutableDictionary *serviceByDevice;
  objc_super v7;

  if (objc_opt_class())
  {
    v7.receiver = self;
    v7.super_class = (Class)PCCIDSEndpoint;
    v3 = -[PCCIDSEndpoint init](&v7, sel_init);
    if (v3)
    {
      v4 = objc_opt_new();
      serviceByDevice = v3->_serviceByDevice;
      v3->_serviceByDevice = (NSMutableDictionary *)v4;

    }
  }
  else
  {

    return 0;
  }
  return v3;
}

- (void)runWithDelegate:(id)a3
{
  IDSService *v4;
  IDSService *pairedWatchService;
  IDSService *v6;
  IDSService *homeDeviceService;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PCCIDSEndpoint;
  -[PCCEndpoint runWithDelegate:](&v9, sel_runWithDelegate_, a3);
  -[PCCIDSEndpoint startService:](self, "startService:", CFSTR("com.apple.private.alloy.proxiedcrashcopier"));
  v4 = (IDSService *)objc_claimAutoreleasedReturnValue();
  pairedWatchService = self->_pairedWatchService;
  self->_pairedWatchService = v4;

  -[PCCIDSEndpoint startService:](self, "startService:", CFSTR("com.apple.private.alloy.proxiedcrashcopier.icloud"));
  v6 = (IDSService *)objc_claimAutoreleasedReturnValue();
  homeDeviceService = self->_homeDeviceService;
  self->_homeDeviceService = v6;

  v8 = -[PCCIDSEndpoint deviceIds](self, "deviceIds");
  if (*(_OWORD *)&self->_pairedWatchService == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    -[PCCIDSEndpoint runWithDelegate:].cold.1();
}

- (id)startService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  int v12;
  id v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34360]), "initWithService:", v4);
  objc_msgSend(v5, "accounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(v5, "addDelegate:queue:", self, MEMORY[0x1E0C80D38]);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "accounts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");
      objc_msgSend(v5, "devices");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v4;
      v14 = 1024;
      v15 = v9;
      v16 = 1024;
      v17 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "IDS(%@) connected with %d accounts and %d devices", (uint8_t *)&v12, 0x18u);

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "IDS(%@) connected with no accounts.", (uint8_t *)&v12, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

- (id)deviceIds
{
  void *v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  int v20;
  const __CFString *v21;
  PCCIDSEndpoint *v22;
  void *v23;
  NSObject *v24;
  uint64_t j;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  PCCIDSEndpoint *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  int v41;
  const __CFString *v42;
  uint64_t v44;
  id obj;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  PCCIDSEndpoint *v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[6];
  _QWORD v67[6];
  uint8_t v68[128];
  uint8_t buf[4];
  _BYTE v70[14];
  __int16 v71;
  id v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  const __CFString *v76;
  __int16 v77;
  const __CFString *v78;
  __int16 v79;
  const __CFString *v80;
  __int16 v81;
  const __CFString *v82;
  __int16 v83;
  const __CFString *v84;
  _QWORD v85[6];
  _QWORD v86[6];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary removeAllObjects](self->_serviceByDevice, "removeAllObjects");
  if (*(_OWORD *)&self->_pairedWatchService == 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v57 = (id)objc_claimAutoreleasedReturnValue();
  -[IDSService devices](self->_pairedWatchService, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, " # Name/DeviceID        Model                Build      Near Pair Cntd Actv iCld", buf, 2u);
  }
  v56 = self;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v70 = CFSTR("com.apple.private.alloy.proxiedcrashcopier");
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@:", buf, 0xCu);
  }
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v3;
  v4 = v57;
  v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v87, 16);
  if (v54)
  {
    v51 = *(_QWORD *)v63;
    v44 = 138412290;
    do
    {
      for (i = 0; i != v54; ++i)
      {
        if (*(_QWORD *)v63 != v51)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        v7 = (void *)IDSCopyIDForDevice();
        v8 = objc_msgSend(v4, "count");
        v86[0] = v7;
        v85[0] = CFSTR("id");
        v85[1] = CFSTR("name");
        objc_msgSend(v6, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v86[1] = v9;
        v85[2] = CFSTR("model");
        objc_msgSend(v6, "modelIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v86[2] = v10;
        v85[3] = CFSTR("build");
        objc_msgSend(v6, "productBuildVersion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v86[3] = v11;
        v85[4] = CFSTR("nearby");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "isNearby"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v85[5] = CFSTR("service");
        v86[4] = v12;
        v86[5] = CFSTR("com.apple.private.alloy.proxiedcrashcopier");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

        -[NSMutableDictionary setObject:forKeyedSubscript:](v56->_serviceByDevice, "setObject:forKeyedSubscript:", v56->_pairedWatchService, v7);
        v14 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "name");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "modelIdentifier");
          v46 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "productBuildVersion");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v6, "isNearby"))
            v16 = CFSTR("YES");
          else
            v16 = CFSTR(" NO");
          if (objc_msgSend(v6, "isLocallyPaired", v44))
            v17 = CFSTR("YES");
          else
            v17 = CFSTR(" NO");
          if (objc_msgSend(v6, "isConnected"))
            v18 = CFSTR("YES");
          else
            v18 = CFSTR(" NO");
          if (objc_msgSend(v6, "isActive"))
            v19 = CFSTR("YES");
          else
            v19 = CFSTR(" NO");
          v20 = objc_msgSend(v6, "isCloudConnected");
          *(_DWORD *)buf = 67111170;
          if (v20)
            v21 = CFSTR("YES");
          else
            v21 = CFSTR(" NO");
          *(_DWORD *)v70 = v8 + 1;
          *(_WORD *)&v70[4] = 2112;
          *(_QWORD *)&v70[6] = v48;
          v71 = 2112;
          v72 = v46;
          v73 = 2112;
          v74 = v15;
          v75 = 2112;
          v76 = v16;
          v77 = 2112;
          v78 = v17;
          v79 = 2112;
          v80 = v18;
          v4 = v57;
          v81 = 2112;
          v82 = v19;
          v14 = MEMORY[0x1E0C81028];
          v83 = 2112;
          v84 = v21;
          _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%2d %-20@ %-20@ %-10@ %@  %@  %@  %@  %@", buf, 0x58u);

        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v44;
          *(_QWORD *)v70 = v7;
          _os_log_impl(&dword_1D3A90000, v14, OS_LOG_TYPE_DEFAULT, "   %@", buf, 0xCu);
        }

      }
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v87, 16);
    }
    while (v54);
  }

  v22 = v56;
  -[IDSService devices](v56->_homeDeviceService, "devices");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v70 = CFSTR("com.apple.private.alloy.proxiedcrashcopier.icloud");
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@:", buf, 0xCu);
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v47 = v23;
  v53 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  if (v53)
  {
    v52 = *(_QWORD *)v59;
    v24 = MEMORY[0x1E0C81028];
    do
    {
      for (j = 0; j != v53; ++j)
      {
        if (*(_QWORD *)v59 != v52)
          objc_enumerationMutation(v47);
        v26 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
        v27 = (void *)IDSCopyIDForDevice();
        v28 = objc_msgSend(v57, "count");
        -[NSMutableDictionary objectForKeyedSubscript:](v22->_serviceByDevice, "objectForKeyedSubscript:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          v55 = -1;
        }
        else
        {
          v55 = v28 + 1;
          v67[0] = v27;
          v66[0] = CFSTR("id");
          v66[1] = CFSTR("name");
          objc_msgSend(v26, "name");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v67[1] = v30;
          v66[2] = CFSTR("model");
          objc_msgSend(v26, "modelIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v67[2] = v31;
          v66[3] = CFSTR("build");
          objc_msgSend(v26, "productBuildVersion");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v67[3] = v32;
          v66[4] = CFSTR("nearby");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v26, "isNearby"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v66[5] = CFSTR("service");
          v67[4] = v33;
          v67[5] = CFSTR("com.apple.private.alloy.proxiedcrashcopier.icloud");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 6);
          v34 = v22;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "addObject:", v35);

          v22 = v34;
          v24 = MEMORY[0x1E0C81028];

          -[NSMutableDictionary setObject:forKeyedSubscript:](v22->_serviceByDevice, "setObject:forKeyedSubscript:", v22->_homeDeviceService, v27);
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v26, "name");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "modelIdentifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "productBuildVersion");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v26, "isNearby"))
            v37 = CFSTR("YES");
          else
            v37 = CFSTR(" NO");
          if (objc_msgSend(v26, "isLocallyPaired"))
            v38 = CFSTR("YES");
          else
            v38 = CFSTR(" NO");
          if (objc_msgSend(v26, "isConnected"))
            v39 = CFSTR("YES");
          else
            v39 = CFSTR(" NO");
          if (objc_msgSend(v26, "isActive"))
            v40 = CFSTR("YES");
          else
            v40 = CFSTR(" NO");
          v41 = objc_msgSend(v26, "isCloudConnected");
          *(_DWORD *)buf = 67111170;
          if (v41)
            v42 = CFSTR("YES");
          else
            v42 = CFSTR(" NO");
          *(_DWORD *)v70 = v55;
          *(_WORD *)&v70[4] = 2112;
          *(_QWORD *)&v70[6] = v50;
          v71 = 2112;
          v72 = v49;
          v73 = 2112;
          v74 = v36;
          v75 = 2112;
          v76 = v37;
          v77 = 2112;
          v78 = v38;
          v79 = 2112;
          v80 = v39;
          v81 = 2112;
          v82 = v40;
          v24 = MEMORY[0x1E0C81028];
          v22 = v56;
          v83 = 2112;
          v84 = v42;
          _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%2d %-20@ %-20@ %-10@ %@  %@  %@  %@  %@", buf, 0x58u);

        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v70 = v27;
          _os_log_impl(&dword_1D3A90000, v24, OS_LOG_TYPE_DEFAULT, "   %@", buf, 0xCu);
        }

      }
      v53 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    }
    while (v53);
  }

  return v57;
}

- (id)serviceByDeviceID:(id)a3
{
  id v4;
  void *v5;
  IDSService *homeDeviceService;
  IDSService *v7;
  IDSService *v8;

  v4 = a3;
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D34010]))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_serviceByDevice, "objectForKeyedSubscript:", v5);
    homeDeviceService = (IDSService *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    homeDeviceService = self->_pairedWatchService;
  }
  v7 = homeDeviceService;
  if (!homeDeviceService)
    homeDeviceService = self->_homeDeviceService;
  v8 = homeDeviceService;

  return v8;
}

- (BOOL)isDeviceNearby:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PCCIDSEndpoint serviceByDeviceID:](self, "serviceByDeviceID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "devices");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (v4)
          {
            objc_msgSend(v11, "uniqueID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v4, "isEqualToString:", v12);

            if ((v13 & 1) != 0)
              goto LABEL_14;
          }
          else if ((objc_msgSend(v11, "isDefaultPairedDevice", (_QWORD)v15) & 1) != 0)
          {
LABEL_14:
            LOBYTE(v8) = objc_msgSend(v11, "isNearby", (_QWORD)v15);
            goto LABEL_15;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_15:

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)send:(id)a3 message:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  IDSService *v10;
  id v11;
  void *v12;
  IDSService *pairedWatchService;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PCCIDSEndpoint serviceByDeviceID:](self, "serviceByDeviceID:", v8);
  v10 = (IDSService *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v8)
      v11 = v8;
    else
      v11 = (id)*MEMORY[0x1E0D34010];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    pairedWatchService = self->_pairedWatchService;
    if (v10 == pairedWatchService)
      v14 = 200;
    else
      v14 = 300;
    if (v10 == pairedWatchService)
    {
      v17 = *MEMORY[0x1E0D34128];
      v29[0] = *MEMORY[0x1E0D34170];
      v29[1] = v17;
      v30[0] = MEMORY[0x1E0C9AAB0];
      v30[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0C9AA70];
    }
    v23 = 0;
    v24 = 0;
    v18 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](v10, "sendMessage:toDestinations:priority:options:identifier:error:", v9, v12, v14, v15, &v24, &v23);
    v16 = v24;
    v19 = v23;
    if (v18)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("messageType"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = v20;
        v27 = 2112;
        v28 = v16;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "sent %@, tracking: %@", buf, 0x16u);

      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("messageType"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = v21;
        v27 = 2112;
        v28 = v19;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "sendMessage FAILED for %@: %@", buf, 0x16u);

      }
      if (a5)
        *a5 = objc_retainAutorelease(v19);
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Attempted to send message before connecting", buf, 2u);
    }
    v16 = 0;
  }

  return v16;
}

- (id)send:(id)a3 file:(id)a4 metadata:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  IDSService *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  _BOOL4 v24;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[PCCIDSEndpoint serviceByDeviceID:](self, "serviceByDeviceID:", v10);
  v13 = (IDSService *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (v10)
      v14 = v10;
    else
      v14 = (id)*MEMORY[0x1E0D34010];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == self->_pairedWatchService)
      v16 = 200;
    else
      v16 = 300;
    v32 = *MEMORY[0x1E0D341F0];
    v33[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    if (v13 == self->_pairedWatchService)
    {
      v19 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D34170]);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D34128]);
      if (-[PCCEndpoint fileTimeout](self, "fileTimeout"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PCCEndpoint fileTimeout](self, "fileTimeout"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D341D0]);

      }
    }
    v26 = 0;
    v27 = 0;
    v21 = -[IDSService sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:](v13, "sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:", v11, v12, v15, v16, v18, &v27, &v26);
    v22 = v27;
    v23 = v26;
    v24 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      if (v24)
      {
        *(_DWORD *)buf = 138543618;
        v29 = v11;
        v30 = 2114;
        v31 = v22;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "sent %{public}@, tracking: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (v24)
      {
        *(_DWORD *)buf = 138543618;
        v29 = v11;
        v30 = 2114;
        v31 = v23;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "sendFile FAILED for %{public}@: %{public}@", buf, 0x16u);
      }
      if (a6)
        *a6 = objc_retainAutorelease(v23);
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Attempted to send file before connecting", buf, 2u);
    }
    v22 = 0;
  }

  return v22;
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v11;
  id v12;
  id v13;
  id WeakRetained;

  v11 = a5;
  v12 = a6;
  v13 = a7;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[PCCIDSEndpoint service:account:incomingResourceAtURL:metadata:fromID:context:].cold.1(v11);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  objc_msgSend(WeakRetained, "handleFile:from:metadata:", v11, v13, v12);

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id WeakRetained;

  v7 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[PCCIDSEndpoint service:account:identifier:hasBeenDeliveredWithContext:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  objc_msgSend(WeakRetained, "ack:result:error:", v7, 1, 0);

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id WeakRetained;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_serviceByDevice, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_serviceByDevice, "setObject:forKeyedSubscript:", v10, v13);
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("messageType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[PCCIDSEndpoint service:account:incomingMessage:fromID:].cold.1((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  objc_msgSend(WeakRetained, "handleMessage:from:", v12, v13);

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL8 v8;
  id v10;
  __CFString *v11;
  id WeakRetained;

  v8 = a6;
  v10 = a5;
  v11 = (__CFString *)a7;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[PCCIDSEndpoint service:account:identifier:didSendWithSuccess:error:].cold.1(v8, (uint64_t)v10, v11);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  objc_msgSend(WeakRetained, "ack:result:error:", v10, v8, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceByDevice, 0);
  objc_storeStrong((id *)&self->_homeDeviceService, 0);
  objc_storeStrong((id *)&self->_pairedWatchService, 0);
}

- (void)runWithDelegate:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "FAIL: no IDS accounts. Ensure the service plist is in place and try restarting identityservicesd.", v0, 2u);
}

- (void)service:(void *)a1 account:incomingResourceAtURL:metadata:fromID:context:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1D3A90000, MEMORY[0x1E0C81028], v3, "received file '%@'", v4, v5, v6, v7, 2u);

}

- (void)service:(uint64_t)a3 account:(uint64_t)a4 identifier:(uint64_t)a5 hasBeenDeliveredWithContext:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D3A90000, MEMORY[0x1E0C81028], a3, "delivery receipt tracked %@", a5, a6, a7, a8, 2u);
}

- (void)service:(uint64_t)a3 account:(uint64_t)a4 incomingMessage:(uint64_t)a5 fromID:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D3A90000, MEMORY[0x1E0C81028], a3, "received message '%@'", a5, a6, a7, a8, 2u);
}

- (void)service:(const __CFString *)a3 account:identifier:didSendWithSuccess:error:.cold.1(char a1, uint64_t a2, const __CFString *a3)
{
  const char *v3;
  const __CFString *v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = "OK";
  if ((a1 & 1) == 0)
    v3 = "FAILED";
  v4 = &stru_1E954D0B0;
  v5 = 136315650;
  v6 = v3;
  v7 = 2112;
  v8 = a2;
  if (a3)
    v4 = a3;
  v9 = 2112;
  v10 = v4;
  _os_log_debug_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "msg callback %s tracked %@ %@", (uint8_t *)&v5, 0x20u);
}

@end
