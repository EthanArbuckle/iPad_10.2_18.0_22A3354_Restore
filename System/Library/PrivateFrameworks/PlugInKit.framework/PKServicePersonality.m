@implementation PKServicePersonality

- (PKServicePersonality)initWithConnection:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKServicePersonality *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id from;
  id location;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "external");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29.receiver = self;
  v29.super_class = (Class)PKServicePersonality;
  v9 = -[PKPlugInCore initWithExternalProviders:](&v29, sel_initWithExternalProviders_, v8);

  if (v9)
  {
    objc_storeStrong((id *)&v9->_service, a4);
    -[PKServicePersonality setConnection:](v9, "setConnection:", v6);
    -[PKServicePersonality connection](v9, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setExportedObject:", v9);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE3B3F8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKServicePersonality connection](v9, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setExportedInterface:", v11);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE404A8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKServicePersonality connection](v9, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRemoteObjectInterface:", v13);

    objc_initWeak(&location, v9);
    objc_initWeak(&from, v9->_connection);
    v15 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_1AF269DBC;
    v24[3] = &unk_1E5F40E00;
    objc_copyWeak(&v25, &location);
    objc_copyWeak(&v26, &from);
    -[PKServicePersonality connection](v9, "connection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setInterruptionHandler:", v24);

    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = sub_1AF269EF0;
    v20[3] = &unk_1E5F40E28;
    objc_copyWeak(&v22, &location);
    objc_copyWeak(&v23, &from);
    v21 = v7;
    -[PKServicePersonality connection](v9, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setInvalidationHandler:", v20);

    -[PKServicePersonality connection](v9, "connection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "resume");

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (id)setupWithIdentifier:(id)a3 extensionPointPlatform:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PKServiceDefaults *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v24;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[PKPlugInCore external](self, "external");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filesystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "infoDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1AF26628C(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = -[PKPlugInCore setupWithName:extensionPointPlatform:url:bundleInfo:uuid:discoveryInstanceUUID:extensionPointCache:](self, "setupWithName:extensionPointPlatform:url:bundleInfo:uuid:discoveryInstanceUUID:extensionPointCache:", v6, v4, v13, v11, 0, 0, v12);

  if ((v4 & 1) != 0)
  {
    -[PKServicePersonality service](self, "service");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "registerPersonality:", self);

    v15 = -[PKServiceDefaults initWithPersonality:]([PKServiceDefaults alloc], "initWithPersonality:", self);
    -[PKServicePersonality setPreferences:](self, "setPreferences:", v15);
    v16 = 0;
  }
  else
  {
    objc_msgSend(v9, "bundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    pkErrorf(4, CFSTR("failed to initialize personality %@ for pluginkit plugin %@"), v17, v18, v19, v20, v21, v22, (uint64_t)v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    pklog_handle_for_category(7);
    v15 = (PKServiceDefaults *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v15->super.super, OS_LOG_TYPE_ERROR))
      sub_1AF2769E0();
  }

  return v16;
}

- (void)prepareUsing:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t current_persona;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uid_t v31;
  uid_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  objc_class *v55;
  void *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  unsigned int v69;
  void *v70;
  void *v71;
  id v72;
  os_signpost_id_t spid;
  void *v74;
  PKServicePersonality *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  const char *v81;
  const char *v82;
  uint8_t v83[128];
  uint8_t v84[4];
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  uid_t v91;
  __int16 v92;
  uid_t v93;
  __int16 v94;
  int v95;
  __int16 v96;
  const char *v97;
  __int16 v98;
  const char *v99;
  uint8_t buf[32];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[28];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  pklog_handle_for_category(7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, v6);

  pklog_handle_for_category(7);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  spid = v9;
  v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF254000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ExtensionPrepareUsing", ", buf, 2u);
  }
  v72 = v7;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hostProtocol"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("epPlatform"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v15, "unsignedIntValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isRBManaged"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v71, "BOOLValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("version"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPlugInCore setHubProtocolVersion:](self, "setHubProtocolVersion:", objc_msgSend(v17, "unsignedIntegerValue"));

  if (!-[PKPlugInCore hubProtocolVersion](self, "hubProtocolVersion"))
    -[PKPlugInCore setHubProtocolVersion:](self, "setHubProtocolVersion:", 1);
  -[PKPlugInCore setIsRBManaged:](self, "setIsRBManaged:", v16);
  pklog_handle_for_category(7);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = "will not";
    if ((_DWORD)v16)
      v19 = "will";
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v19;
    _os_log_impl(&dword_1AF254000, v18, OS_LOG_TYPE_INFO, "%@: %s be managed by runningboard", buf, 0x16u);
  }

  v20 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uuid"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "initWithUUIDString:", v21);

  if (v22)
    -[PKPlugInCore setUuid:](self, "setUuid:", v22);
  v74 = (void *)v22;
  v75 = self;
  v118 = 0u;
  memset(v119, 0, sizeof(v119));
  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v101 = 0u;
  memset(buf, 0, sizeof(buf));
  v81 = 0;
  v82 = 0;
  current_persona = voucher_get_current_persona();
  v24 = current_persona;
  memset(buf, 0, sizeof(buf));
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  memset(v119, 0, sizeof(v119));
  *(_DWORD *)buf = 1;
  pklog_get_persona_type_and_name(current_persona, (uint64_t)buf, &v82, &v81);
  pklog_handle_for_category(7);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPlugInCore uuid](self, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore identifier](self, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore version](v75, "version");
    v67 = v13;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v15;
    v30 = v14;
    v31 = geteuid();
    v32 = getuid();
    *(_DWORD *)v84 = 138545154;
    v85 = v26;
    v86 = 2112;
    v87 = v27;
    v88 = 2112;
    v89 = v28;
    v90 = 1024;
    v91 = v31;
    v14 = v30;
    v15 = v29;
    v92 = 1024;
    v93 = v32;
    v94 = 1024;
    v95 = v24;
    v96 = 2080;
    v97 = v82;
    v98 = 2080;
    v99 = v81;
    _os_log_impl(&dword_1AF254000, v25, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] Prepare received as euid = %d, uid = %d, personaid = %d, type = %s, name = %s", v84, 0x46u);

    v13 = v67;
  }

  -[PKServicePersonality setupWithIdentifier:extensionPointPlatform:](v75, "setupWithIdentifier:extensionPointPlatform:", v13, v69);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v72;
  if (v33)
  {
    v35 = (void *)v33;
    pklog_handle_for_category(7);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    v38 = v74;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      v39 = objc_msgSend(v35, "code");
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v74;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 0;
      *(_WORD *)&buf[18] = 2050;
      *(_QWORD *)&buf[20] = v39;
      _os_signpost_emit_with_name_impl(&dword_1AF254000, v37, OS_SIGNPOST_INTERVAL_END, spid, "ExtensionPrepareUsing", " uuid=%{public, signpost.description:attribute}@  success=%{public, signpost.description:attribute}d  error=%{public, signpost.description:attribute}llu ", buf, 0x1Cu);
    }

    (*((void (**)(id, void *, _QWORD))v72 + 2))(v72, v35, 0);
  }
  else
  {
    v66 = v6;
    v68 = v13;
    v65 = v15;
    if (v14)
    {
      v80 = 0;
      sub_1AF26693C(v14, &v80);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v80;
      v42 = v41;
      if (v40)
      {
        objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", v40);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKServicePersonality connection](v75, "connection");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "exportedInterface");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setInterface:forSelector:argumentIndex:ofReply:", v43, sel_beginUsingPlugIn_ready_, 0, 0);

      }
      else
      {
        v46 = (void *)MEMORY[0x1E0C99DA0];
        v47 = *MEMORY[0x1E0C99768];
        objc_msgSend(v41, "localizedDescription");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "raise:format:", v47, CFSTR("%@"), v43);
      }
      v70 = v42;

    }
    else
    {
      v70 = 0;
    }
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    -[PKServicePersonality service](v75, "service");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "subsystems");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v76, v83, 16);
    if (v50)
    {
      v51 = *(_QWORD *)v77;
      do
      {
        v52 = 0;
        if (v50 <= 1)
          v53 = 1;
        else
          v53 = v50;
        do
        {
          if (*(_QWORD *)v77 != v51)
            objc_enumerationMutation(v49);
          v54 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v52);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v55 = (objc_class *)objc_opt_class();
            NSStringFromClass(v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            pklog_handle_for_category(7);
            v57 = objc_claimAutoreleasedReturnValue();
            v58 = v57;
            if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
            {
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v74;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v56;
              _os_signpost_emit_with_name_impl(&dword_1AF254000, v58, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ExtensionSubsystemBeginUsing", " uuid=%{public, signpost.description:attribute}@  name=%{public, signpost.description:attribute}@ ", buf, 0x16u);
            }

            objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            __PLUGINKIT_CALLING_OUT_TO_CLIENT_SUBSYSTEM_FOR_BEGINUSING__(v54);

            pklog_handle_for_category(7);
            v60 = objc_claimAutoreleasedReturnValue();
            v61 = v60;
            if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
            {
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v74;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v56;
              _os_signpost_emit_with_name_impl(&dword_1AF254000, v61, OS_SIGNPOST_INTERVAL_END, spid, "ExtensionSubsystemBeginUsing", " uuid=%{public, signpost.description:attribute}@  name=%{public, signpost.description:attribute}@ ", buf, 0x16u);
            }

          }
          ++v52;
        }
        while (v53 != v52);
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v76, v83, 16);
      }
      while (v50);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    pklog_handle_for_category(7);
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = v63;
    v38 = v74;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v74;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 1;
      *(_WORD *)&buf[18] = 2050;
      *(_QWORD *)&buf[20] = 0;
      _os_signpost_emit_with_name_impl(&dword_1AF254000, v64, OS_SIGNPOST_INTERVAL_END, spid, "ExtensionPrepareUsing", " uuid=%{public, signpost.description:attribute}@  success=%{public, signpost.description:attribute}d  error=%{public, signpost.description:attribute}llu ", buf, 0x1Cu);
    }

    v34 = v72;
    (*((void (**)(id, _QWORD, void *))v72 + 2))(v72, 0, v62);

    v6 = v66;
    v13 = v68;
    v15 = v65;
    v35 = v70;
  }

}

- (void)prepareUsingPlugIn:(id)a3 hostProtocol:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C99E08];
  v11 = a3;
  objc_msgSend(v10, "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("identifier"));

  if (v8)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("hostProtocol"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AF26AC78;
  v14[3] = &unk_1E5F40E50;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  -[PKServicePersonality prepareUsing:reply:](self, "prepareUsing:reply:", v12, v14);

}

- (void)beginUsingPlugIn:(id)a3 ready:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v9;
  id v10;
  uint64_t current_persona;
  int v12;
  NSObject *v13;
  void *v14;
  uid_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  const char *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  uid_t v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  _OWORD v48[22];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v30 = 0;
  v31 = 0;
  current_persona = voucher_get_current_persona();
  v12 = current_persona;
  memset(v48, 0, 348);
  LODWORD(v48[0]) = 1;
  pklog_get_persona_type_and_name(current_persona, (uint64_t)v48, &v31, &v30);
  pklog_handle_for_category(7);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPlugInCore uuid](self, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore version](self, "version");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = geteuid();
    v15 = getuid();
    *(_DWORD *)buf = 138545154;
    v33 = v14;
    v34 = 2112;
    v35 = v4;
    v36 = 2112;
    v37 = v5;
    v38 = 1024;
    v39 = v6;
    v40 = 1024;
    v41 = v15;
    v42 = 1024;
    v43 = v12;
    v44 = 2080;
    v45 = v31;
    v46 = 2080;
    v47 = v30;
    _os_log_impl(&dword_1AF254000, v13, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] Begin using received as euid = %d, uid = %d, personaid = %d, type = %s, name = %s", buf, 0x46u);

  }
  -[PKServicePersonality service](self, "service");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[PKServicePersonality service](self, "service");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore identifier](self, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rootObjectForPlugIn:", v6);
  }
  else
  {
    -[PKServicePersonality defaultPrincipalObject](self, "defaultPrincipalObject");
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
  {

    v18 = v4;
  }

  if (v19)
  {
    -[PKServicePersonality setPlugInPrincipal:](self, "setPlugInPrincipal:", v19);
    v20 = (void *)MEMORY[0x1E0CB3B50];
    -[PKPlugInCore protocolSpec](self, "protocolSpec");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKServicePersonality findProtocol:](self, "findProtocol:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "interfaceWithProtocol:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKServicePersonality connection](self, "connection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "exportedInterface");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setInterface:forSelector:argumentIndex:ofReply:", v23, sel_beginUsingPlugIn_ready_, 1, 1);

    -[PKPlugInCore augmentInterface:](self, "augmentInterface:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      pklog_handle_for_category(7);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_1AF276BB0();

      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
      -[PKServicePersonality service](self, "service");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "beganUsingServicePersonality:", self);
    }
    else
    {
      -[PKServicePersonality setHostPrincipal:](self, "setHostPrincipal:", v9);
      -[PKServicePersonality plugInPrincipal](self, "plugInPrincipal");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v28);
    }

  }
  else
  {
    pklog_handle_for_category(7);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_1AF276B14(self);

    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    -[PKServicePersonality service](self, "service");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "beganUsingServicePersonality:", self);
  }

}

- (id)findProtocol:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v18 = 0;
    sub_1AF266A10(v4, &v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v18;
    if (!v6)
    {
      pklog_handle_for_category(7);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[PKPlugInCore uuid](self, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPlugInCore identifier](self, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPlugInCore version](self, "version");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v20 = v14;
        v21 = 2112;
        v22 = v15;
        v23 = 2112;
        v24 = v16;
        v25 = 2112;
        v26 = v5;
        v27 = 2112;
        v28 = v17;
        _os_log_error_impl(&dword_1AF254000, v8, OS_LOG_TYPE_ERROR, "[u %{public}@] [%@(%@)] failed to find protocol for [%@]: %@", buf, 0x34u);

      }
      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99768];
      objc_msgSend(v7, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "raise:format:", v10, CFSTR("unable to start plug-in: %@"), v11);

    }
  }
  else
  {
    pklog_handle_for_category(7);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1AF276C44(self);

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("missing protocol specification in Info.plist"));
    v6 = 0;
  }

  return v6;
}

- (void)hostHasControl
{
  id v3;

  -[PKServicePersonality service](self, "service");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beganUsingServicePersonality:", self);

}

- (id)defaultPrincipalObject
{
  void *v3;
  void *v4;
  objc_class *Class;
  id v6;
  NSObject *v7;

  -[PKPlugInCore principalSpec](self, "principalSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    pklog_handle_for_category(7);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1AF276CE0(self);
    goto LABEL_10;
  }
  Class = objc_getClass((const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
  if (!Class)
  {
    pklog_handle_for_category(7);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1AF276D7C();
LABEL_10:
    v6 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v6 = objc_alloc_init(Class);
  if (!v6)
  {
    pklog_handle_for_category(7);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1AF276E10();
    goto LABEL_11;
  }
LABEL_12:

  return v6;
}

- (double)cleanExitTimeout
{
  double v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[PKPlugInCore isRBManaged](self, "isRBManaged"))
    v3 = -1.0;
  else
    v3 = 15.0;
  -[PKPlugInCore pluginKey:](self, "pluginKey:", CFSTR("CleanTimeout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pklog_handle_for_category(7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      -[PKPlugInCore uuid](self, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore version](self, "version");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = *(double *)&v4;
      _os_log_impl(&dword_1AF254000, v5, OS_LOG_TYPE_INFO, "[u %{public}@] [%@(%@)] got CleanExit value:%@", (uint8_t *)&v15, 0x2Au);

    }
    objc_msgSend(v4, "doubleValue");
    v3 = v10;
  }
  else
  {
    if (v6)
    {
      -[PKPlugInCore uuid](self, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore identifier](self, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore version](self, "version");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      v21 = 2048;
      v22 = v3;
      _os_log_impl(&dword_1AF254000, v5, OS_LOG_TYPE_INFO, "[u %{public}@] [%@(%@)] setting delta:%g", (uint8_t *)&v15, 0x2Au);

    }
  }

  return v3;
}

- (void)shutdownPlugIn
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PKServicePersonality service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unregisterPersonality:", self);

  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[PKServicePersonality service](self, "service", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subsystems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        if (v7 <= 1)
          v10 = 1;
        else
          v10 = v7;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "endUsing:", self);
          ++v9;
        }
        while (v10 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    -[PKServicePersonality setPlugInPrincipal:](self, "setPlugInPrincipal:", 0);
    -[PKServicePersonality setEmbeddedPrincipal:](self, "setEmbeddedPrincipal:", 0);
    -[PKServicePersonality setHostPrincipal:](self, "setHostPrincipal:", 0);
  }
}

- (void)prefsObjectForKey:(id)a3 inPlugIn:(id)a4 result:(id)a5
{
  void (**v7)(id, id);
  id v8;
  void *v9;
  id v10;

  v7 = (void (**)(id, id))a5;
  v8 = a3;
  -[PKServicePersonality preferences](self, "preferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v10);
}

- (void)prefsSetObject:(id)a3 forKey:(id)a4 inPlugIn:(id)a5 result:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void (**v12)(void);

  v12 = (void (**)(void))a6;
  v9 = a4;
  v10 = a3;
  -[PKServicePersonality preferences](self, "preferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v10, v9);

  v12[2]();
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PKServicePersonality;
  -[PKPlugInCore description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKServicePersonality connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<PKServicePersonality: %p; core = %@, host pid = %d>"),
    self,
    v4,
    objc_msgSend(v5, "processIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)plugInPrincipal
{
  return objc_getProperty(self, a2, 216, 1);
}

- (void)setPlugInPrincipal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (id)hostPrincipal
{
  return objc_getProperty(self, a2, 224, 1);
}

- (void)setHostPrincipal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (id)embeddedPrincipal
{
  return objc_getProperty(self, a2, 232, 1);
}

- (void)setEmbeddedPrincipal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 240, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSUserDefaults)preferences
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 248, 1);
}

- (void)setPreferences:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (PKService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_embeddedPrincipal, 0);
  objc_storeStrong(&self->_hostPrincipal, 0);
  objc_storeStrong(&self->_plugInPrincipal, 0);
}

@end
