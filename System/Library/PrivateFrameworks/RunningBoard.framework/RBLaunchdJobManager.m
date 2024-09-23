@implementation RBLaunchdJobManager

- (void)_addSharedPropertiesToData:(id)a3 forIdentity:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  char v9;
  void *v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  xpc_object_t v17;
  id v18;
  const char *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  id v26;
  xpc_object_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  const char *v37;
  id v38;
  NSObject *v39;
  char v40;
  void *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v43 = a5;
  v9 = objc_msgSend(v43, "executionOptions");
  xpc_dictionary_set_string(v7, "_ManagedBy", "com.apple.runningboard");
  objc_msgSend(v8, "applicationJobLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "applicationJobLabel");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v12 = v8;
  if (objc_msgSend(v12, "isEmbeddedApplication"))
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v12, "embeddedApplicationIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("UIKitApplication:%@[%04x][rb-legacy]"), v14, arc4random() % 0xFFFF);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v12, "hasConsistentLaunchdJob"))
    {
      objc_msgSend(v12, "consistentLaunchdJobLabel");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v12, "isApplication"))
    {
      objc_msgSend(v12, "applicationJobLabel");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v12, "isDext"))
      {
        v11 = &stru_24DD48378;
        goto LABEL_12;
      }
      objc_msgSend(v12, "dextLabel");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (__CFString *)v15;
  }
LABEL_12:

LABEL_13:
  v16 = objc_retainAutorelease(v11);
  xpc_dictionary_set_string(v7, "Label", (const char *)-[__CFString UTF8String](v16, "UTF8String"));

  v17 = xpc_array_create(0, 0);
  objc_msgSend(v43, "_overrideExecutablePath");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = (const char *)objc_msgSend(v18, "fileSystemRepresentation");

  v40 = v9;
  v41 = v8;
  if (v19)
  {
    xpc_array_set_string(v17, 0xFFFFFFFFFFFFFFFFLL, v19);
    xpc_dictionary_set_string(v7, "Program", v19);
  }
  else
  {
    rbs_process_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[RBLaunchdJobManager _addSharedPropertiesToData:forIdentity:context:].cold.1(v43, v20);

  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v43, "arguments");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v49 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "description");
        v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        xpc_array_set_string(v17, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v26, "UTF8String"));

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    }
    while (v23);
  }

  v42 = v7;
  xpc_dictionary_set_value(v7, "ProgramArguments", v17);
  v27 = xpc_dictionary_create(0, 0, 0);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v43, "_additionalEnvironment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v45 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend(v43, "_additionalEnvironment");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKey:", v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "description");
        v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v37 = (const char *)objc_msgSend(v36, "UTF8String");
        objc_msgSend(v35, "description");
        v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        xpc_dictionary_set_string(v27, v37, (const char *)objc_msgSend(v38, "UTF8String"));

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    }
    while (v30);
  }

  if ((v40 & 4) != 0)
  {
    rbs_job_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v53 = v41;
      _os_log_impl(&dword_21A8B4000, v39, OS_LOG_TYPE_DEFAULT, "Launching %{public}@ to build DYLD closure. The new process will exit as soon as the operation completes.", buf, 0xCu);
    }

    xpc_dictionary_set_string(v27, "DYLD_JUST_BUILD_CLOSURE", "1");
  }
  xpc_dictionary_set_value(v42, "EnvironmentVariables", v27);
  if (v40 < 0)
    xpc_dictionary_set_BOOL(v42, "RunAtLoad", 1);

}

- (void)invokeOnProcessDeath:(id)a3 handler:(id)a4 onQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  RBLaunchdJobManager *v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_lock_monitoredJobsByIdentifier, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    rbs_process_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[RBLaunchdJobManager invokeOnProcessDeath:handler:onQueue:].cold.1(v8, v13);

  }
  -[NSMutableDictionary objectForKey:](self->_lock_jobsByIdentifier, "objectForKey:", v11);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    if ((int)objc_msgSend(v11, "pid") <= 0)
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      v15 = (void *)-[RBLaunchdInterfacing copyJobWithPid:](self->_launchdInterface, "copyJobWithPid:", objc_msgSend(v11, "pid"));
      os_unfair_lock_unlock(&self->_lock);
      if (v15)
        goto LABEL_7;
    }
    objc_msgSend(v8, "invokeHandlerOnProcessDeath:onQueue:", v9, v10);
    goto LABEL_13;
  }
  v15 = (void *)v14;
  -[NSMutableDictionary setObject:forKey:](self->_lock_monitoredJobsByIdentifier, "setObject:forKey:", v14, v11);
  -[NSMutableDictionary removeObjectForKey:](self->_lock_jobsByIdentifier, "removeObjectForKey:", v11);
  os_unfair_lock_unlock(&self->_lock);
LABEL_7:
  v16 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke;
  v25[3] = &unk_24DD46718;
  v26 = v8;
  v29 = v9;
  v17 = v15;
  v27 = v17;
  v28 = self;
  v18 = (void *)MEMORY[0x22074BF04](v25);
  block[0] = v16;
  block[1] = 3221225472;
  block[2] = __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_120;
  block[3] = &unk_24DD46480;
  v22 = v17;
  v23 = v10;
  v24 = v18;
  v19 = v18;
  v20 = v17;
  dispatch_async(v23, block);

LABEL_13:
}

void __63__RBLaunchdJobManager__createAndSubmitExtensionJob_UUID_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  rbs_job_oversize_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "hostPid");
    v5 = *(_QWORD *)(a1 + 48);
    _describeXPCObject();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138544130;
    v8 = v3;
    v9 = 1024;
    v10 = v4;
    v11 = 2114;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_21A8B4000, v2, OS_LOG_TYPE_DEFAULT, "'%{public}@' Submitting extension overlay (host PID %d, path %{public}@):\n%{public}@", (uint8_t *)&v7, 0x26u);

  }
}

void __82__RBLaunchdJobManager__createLaunchdJobWithIdentity_context_actualIdentity_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  rbs_job_oversize_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    _describeXPCObject();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_21A8B4000, v2, OS_LOG_TYPE_DEFAULT, "'%{public}@' Constructed job description:\n%{public}@", (uint8_t *)&v5, 0x16u);

  }
}

- (id)_createLaunchdJobWithIdentity:(id)a3 context:(id)a4 actualIdentity:(id *)a5 error:(id *)a6
{
  id v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  char v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  NSObject *logQueue;
  id v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  void *v72;
  NSObject *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  NSObject *v90;
  NSObject *v91;
  NSObject *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  void *v97;
  NSObject *v98;
  void *v99;
  void *v100;
  void *v101;
  NSObject *v102;
  NSObject *v103;
  void *v104;
  NSObject *v105;
  id *v106;
  RBLaunchdJobManager *v107;
  void *v108;
  void *v109;
  void *v110;
  _QWORD block[4];
  id v113;
  id v114;
  id v115;
  _BYTE buf[12];
  __int16 v117;
  void *v118;
  __int16 v119;
  void *v120;
  __int16 v121;
  NSObject *v122;
  __int16 v123;
  void *v124;
  _QWORD v125[3];

  v125[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = objc_msgSend(v9, "isApplication");
  if (!v10 && v11)
  {
    objc_msgSend(MEMORY[0x24BE80BE8], "contextWithIdentity:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v9, "isApplication"))
  {
    v19 = 0;
    goto LABEL_52;
  }
  if (!v10)
    -[RBLaunchdJobManager _createLaunchdJobWithIdentity:context:actualIdentity:error:].cold.1();
  v12 = v10;
  objc_msgSend(v12, "bundleIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
  rbs_general_log();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  v110 = (void *)v13;
  if (!v13)
  {
    if (v15)
    {
      objc_msgSend(v12, "identity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v20;
      _os_log_impl(&dword_21A8B4000, v14, OS_LOG_TYPE_DEFAULT, "Bailing out of _mutateContextIfNeeded for %{public}@", buf, 0xCu);

    }
    v21 = 0;
    v22 = 1;
    goto LABEL_50;
  }
  if (v15)
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v13;
    _os_log_impl(&dword_21A8B4000, v14, OS_LOG_TYPE_DEFAULT, "_mutateContextIfNeeded called for %{public}@", buf, 0xCu);
  }
  v107 = self;

  objc_msgSend(v12, "_additionalEnvironment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDBCED8];
  v106 = a5;
  if (v16)
  {
    objc_msgSend(v12, "_additionalEnvironment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryWithDictionary:", v18);
    v14 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "_overrideExecutablePath");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_content())
    v24 = objc_msgSend(v12, "isTesting");
  else
    v24 = 0;
  objc_msgSend(v12, "_additionalMachServices");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x24BDBCEB8];
  if (v25)
  {
    objc_msgSend(v12, "_additionalMachServices");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "arrayWithArray:", v27);
    v28 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "_setAdditionalMachServices:", v28);
  v29 = _os_feature_enabled_impl();
  if (v29)
    v29 = _os_feature_enabled_impl();
  v108 = (void *)v28;
  if (((v29 | v24) & 1) == 0)
    objc_msgSend(v12, "setPreventContainerization:", MEMORY[0x24BDBD1C8]);
  if (v23)
  {
    objc_msgSend(v12, "preventContainerization");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "BOOLValue");

    if (((v31 | v24) & 1) == 0)
    {
      rbs_job_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "bundleIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v33;
        v117 = 2114;
        v118 = v23;
        _os_log_impl(&dword_21A8B4000, v32, OS_LOG_TYPE_DEFAULT, "Not pre-containerizing %{public}@ because executable file specified (%{public}@)", buf, 0x16u);

      }
      objc_msgSend(v12, "setPreventContainerization:", MEMORY[0x24BDBD1C8]);
    }
  }
  objc_msgSend(v12, "requiredCacheUUID");
  v34 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requiredSequenceNumber");
  v35 = objc_claimAutoreleasedReturnValue();
  rbs_general_log();
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
  v109 = (void *)v35;
  if (v23 && !v34 && !v35)
  {
    if (v37)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A8B4000, v36, OS_LOG_TYPE_DEFAULT, "_mutateContextIfNeeded No proxy needed", buf, 2u);
    }
    v21 = 0;
    v22 = 1;
    goto LABEL_49;
  }
  v105 = v14;
  if (v37)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A8B4000, v36, OS_LOG_TYPE_DEFAULT, "_mutateContextIfNeeded using proxy", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v13);
  v36 = objc_claimAutoreleasedReturnValue();
  -[NSObject appState](v36, "appState");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v104, "isInstalled") & 1) == 0)
  {
    v47 = v34;
    v48 = (void *)MEMORY[0x24BDD1540];
    v49 = *MEMORY[0x24BDD1128];
    v125[0] = *MEMORY[0x24BDD0FC8];
    *(_QWORD *)buf = CFSTR("Unable to load a valid LSApplicationProxy.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v125, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "errorWithDomain:code:userInfo:", v49, 22, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v51;
    rbs_general_log();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A8B4000, v44, OS_LOG_TYPE_DEFAULT, "_mutateContextIfNeeded unable to load a valid LSApplicationProxy.", buf, 2u);
    }
    v22 = 0;
    v34 = v47;
    goto LABEL_47;
  }
  -[NSObject correspondingApplicationRecord](v36, "correspondingApplicationRecord");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "jobLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v39)
  {
    -[NSObject environmentVariables](v36, "environmentVariables");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addEntriesFromDictionary:](v14, "addEntriesFromDictionary:", v68);

    objc_msgSend(v12, "_setAdditionalEnvironment:", v14);
    -[NSObject canonicalExecutablePath](v36, "canonicalExecutablePath");
    v69 = objc_claimAutoreleasedReturnValue();

    if (!v69)
    {
      _posixErrorWithCodeAndDescription(22, CFSTR("Unable to find executable path"));
      v21 = (id)objc_claimAutoreleasedReturnValue();
      rbs_general_log();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A8B4000, v44, OS_LOG_TYPE_DEFAULT, "_mutateContextIfNeeded unable to find xecutable path.", buf, 2u);
      }
      v23 = 0;
      v22 = 0;
      goto LABEL_48;
    }
    v23 = (void *)v69;
    objc_msgSend(v12, "_setOverrideExecutablePath:", v69);
    if (v34)
    {
      -[NSObject cacheGUID](v36, "cacheGUID");
      v44 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v44 = 0;
    }
    if (v109)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSObject sequenceNumber](v36, "sequenceNumber"));
      v70 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v70 = 0;
    }
    v101 = (void *)v70;
    if (v34 != v44 && (!v34 || !v44 || !-[NSObject isEqual:](v34, "isEqual:", v44))
      || v109 != (void *)v70 && (!v109 || !v70 || (objc_msgSend(v109, "isEqual:", v70) & 1) == 0))
    {
      rbs_job_log();
      v92 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "bundleIdentifier");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject UUIDString](v34, "UUIDString");
        v96 = v34;
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        *(_QWORD *)&buf[4] = v95;
        v117 = 2114;
        v118 = v97;
        v119 = 2114;
        v120 = v109;
        v121 = 2114;
        v122 = v44;
        v123 = 2114;
        v124 = v101;
        _os_log_error_impl(&dword_21A8B4000, v92, OS_LOG_TYPE_ERROR, "LaunchServices database mismatch: Failed to lookup executable path for app %{public}@ with {UUID: %{public}@, Sequence: %{public}@} vs {UUID: %{public}@, Sequence: %{public}@", buf, 0x34u);

        v34 = v96;
        v14 = v105;

      }
      _posixErrorWithCodeAndDescription(22, CFSTR("Failed to lookup executable path."));
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      goto LABEL_117;
    }
    v71 = v44;
    v103 = v34;
    -[NSObject applicationType](v36, "applicationType");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    rbs_general_log();
    v73 = objc_claimAutoreleasedReturnValue();
    v100 = v72;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      v74 = objc_opt_class();
      -[NSObject objectForInfoDictionaryKey:ofClass:valuesOfClass:](v36, "objectForInfoDictionaryKey:ofClass:valuesOfClass:", CFSTR("SBMachServices"), v74, objc_opt_class());
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v100;
      v117 = 2114;
      v118 = v75;
      _os_log_impl(&dword_21A8B4000, v73, OS_LOG_TYPE_DEFAULT, "_mutateContextIfNeeded bundleType %{public}@ SBMachServices %{public}@", buf, 0x16u);

      v72 = v100;
    }

    if ((objc_msgSend(v72, "isEqualToString:", *MEMORY[0x24BDC1508]) & 1) != 0
      || (objc_msgSend(v72, "isEqualToString:", *MEMORY[0x24BDC14E0]) & 1) != 0
      || objc_msgSend(v72, "isEqualToString:", *MEMORY[0x24BDC14E8]))
    {
      objc_msgSend(v12, "setSpawnType:", 1);
      v76 = objc_opt_class();
      -[NSObject objectForInfoDictionaryKey:ofClass:valuesOfClass:](v36, "objectForInfoDictionaryKey:ofClass:valuesOfClass:", CFSTR("SBMachServices"), v76, objc_opt_class());
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v77, "count"))
        objc_msgSend(v108, "addObjectsFromArray:", v77);

    }
    -[NSObject correspondingApplicationRecord](v36, "correspondingApplicationRecord");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v78, "wasBuiltWithThreadSanitizer");

    if (v79)
      objc_msgSend(v12, "setExecutionOptions:", objc_msgSend(v12, "executionOptions") | 0x10);
    objc_msgSend(v12, "_setAdditionalMachServices:", v108);
    objc_msgSend(v12, "preventContainerization");
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v80)
    {
      v81 = -[NSObject isContainerized](v36, "isContainerized");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v81 ^ 1u);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPreventContainerization:", v82);

    }
    objc_msgSend(v12, "preventContainerization");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v83, "BOOLValue") & 1) == 0)
    {
      objc_msgSend(v12, "containerIdentifier");
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      if (v84)
        goto LABEL_102;
      objc_opt_self();
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject entitlementValueForKey:ofClass:](v36, "entitlementValueForKey:ofClass:", CFSTR("com.apple.private.security.container-required"), v85);
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setContainerIdentifier:", v83);
      objc_msgSend(v12, "setCalculatedContainerIdentifier:", 1);
    }

LABEL_102:
    -[NSObject managedPersonas](v36, "managedPersonas");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v86, "count");
    v99 = v86;
    if (v87)
    {
      v88 = v87;
      objc_msgSend(v86, "objectAtIndexedSubscript:", 0);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_job_log();
      v90 = objc_claimAutoreleasedReturnValue();
      v34 = v103;
      if (v88 != 1)
      {
        v98 = v90;
        v44 = v71;
        if (!os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          v14 = v105;
          v94 = v100;
          v93 = v98;
          goto LABEL_116;
        }
        -[RBLaunchdJobManager _createLaunchdJobWithIdentity:context:actualIdentity:error:].cold.2();
        v93 = v98;
        v14 = v105;
LABEL_113:
        v94 = v100;
LABEL_116:

        objc_msgSend(v12, "setManagedPersona:", v89);
        v21 = 0;
        v22 = 1;
LABEL_117:

        goto LABEL_48;
      }
      v91 = v90;
      v44 = v71;
      if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v89;
        _os_log_impl(&dword_21A8B4000, v91, OS_LOG_TYPE_INFO, "Persona chosen for bundle identifier: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      rbs_job_log();
      v91 = objc_claimAutoreleasedReturnValue();
      v34 = v103;
      if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v110;
        _os_log_impl(&dword_21A8B4000, v91, OS_LOG_TYPE_INFO, "No personas found for bundle identifier: %{public}@", buf, 0xCu);
      }
      v89 = 0;
    }
    v14 = v105;
    v93 = v91;
    goto LABEL_113;
  }
  v102 = v34;
  v40 = (void *)MEMORY[0x24BDD1540];
  v41 = *MEMORY[0x24BDD1128];
  v125[0] = *MEMORY[0x24BDD0FC8];
  *(_QWORD *)buf = CFSTR("Trying to launch a daemon, agent, or angel as an app.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v125, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "errorWithDomain:code:userInfo:", v41, 22, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v43;
  rbs_general_log();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    -[NSObject correspondingApplicationRecord](v36, "correspondingApplicationRecord");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "jobLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v46;
    _os_log_impl(&dword_21A8B4000, v44, OS_LOG_TYPE_DEFAULT, "_mutateContextIfNeeded Trying to launch %{public}@ as an app", buf, 0xCu);

  }
  v22 = 0;
  v34 = v102;
LABEL_47:
  v14 = v105;
LABEL_48:

LABEL_49:
  a5 = v106;
  self = v107;
LABEL_50:

  v52 = v21;
  v53 = v52;
  if ((v22 & 1) == 0)
  {
    if (a6)
    {
      v53 = objc_retainAutorelease(v52);
      v61 = 0;
      *a6 = v53;
    }
    else
    {
      v61 = 0;
    }
    goto LABEL_67;
  }
  v19 = v52;
LABEL_52:
  objc_msgSend(v10, "_overrideExecutablePath", v98);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    v115 = v19;
    -[RBLaunchdJobManager _generateDataWithIdentity:context:actualIdentity:error:](self, "_generateDataWithIdentity:context:actualIdentity:error:", v9, v10, a5, &v115);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v115;

    if (v55)
    {
      v56 = *a5;
      if (!*a5)
        v56 = v9;
      v57 = v56;
      logQueue = self->_logQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __82__RBLaunchdJobManager__createLaunchdJobWithIdentity_context_actualIdentity_error___block_invoke;
      block[3] = &unk_24DD45FF0;
      v113 = v57;
      v59 = v55;
      v114 = v59;
      v60 = v57;
      dispatch_async(logQueue, block);
      -[RBLaunchdInterfacing jobWithPlist:](self->_launchdInterface, "jobWithPlist:", v59);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v61 = 0;
      if (a6)
        *a6 = objc_retainAutorelease(v53);
    }

  }
  else
  {
    if (a6)
    {
      v62 = (void *)MEMORY[0x24BDD1540];
      v63 = *MEMORY[0x24BDD1128];
      v125[0] = *MEMORY[0x24BDD0FC8];
      *(_QWORD *)buf = CFSTR("Unable to determine executable path.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v125, 1);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "errorWithDomain:code:userInfo:", v63, 22, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      v66 = v65;
      v61 = 0;
      *a6 = v66;
    }
    else
    {
      v61 = 0;
    }
    v53 = v19;
  }
LABEL_67:

  return v61;
}

- (id)_generateDataWithIdentity:(id)a3 context:(id)a4 actualIdentity:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  xpc_object_t v12;
  void *v13;
  id v14;
  id v15;
  BOOL v16;
  id v17;
  id v18;
  id v19;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = xpc_dictionary_create(0, 0, 0);
  v13 = (void *)MEMORY[0x22074BD78]();
  _addRBProperties(v12, v10, v11);
  -[RBLaunchdJobManager _addSharedPropertiesToData:forIdentity:context:](self, "_addSharedPropertiesToData:forIdentity:context:", v12, v10, v11);
  if (objc_msgSend(v10, "isDext"))
  {
    -[RBLaunchdJobManager _addDextPropertiesToData:forIdentity:context:](self, "_addDextPropertiesToData:forIdentity:context:", v12, v10, v11);
    objc_autoreleasePoolPop(v13);
    v14 = 0;
LABEL_3:
    v15 = 0;
LABEL_7:
    v19 = v12;
    v17 = v15;
    goto LABEL_8;
  }
  v21 = 0;
  v22 = 0;
  v16 = -[RBLaunchdJobManager _addAppPropertiesToData:forIdentity:context:actualIdentity:error:](self, "_addAppPropertiesToData:forIdentity:context:actualIdentity:error:", v12, v10, v11, &v22, &v21);
  v17 = v22;
  v14 = v21;
  objc_autoreleasePoolPop(v13);
  if (v17)
  {
    v18 = objc_retainAutorelease(v17);
    *a5 = v18;
    if (v16)
    {
      v15 = v18;
      goto LABEL_7;
    }
  }
  else if (v16)
  {
    goto LABEL_3;
  }
  if (a6)
  {
    v14 = objc_retainAutorelease(v14);
    v19 = 0;
    *a6 = v14;
  }
  else
  {
    v19 = 0;
  }
LABEL_8:

  return v19;
}

- (BOOL)_addAppPropertiesToData:(id)a3 forIdentity:(id)a4 context:(id)a5 actualIdentity:(id *)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  char v14;
  int v15;
  int v16;
  const char *v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  NSObject *v29;
  xpc_object_t v30;
  void *v31;
  id v32;
  void *v33;
  RBLaunchdJobManager *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  xpc_object_t v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  void *v48;
  xpc_object_t v49;
  void *v50;
  unint64_t v51;
  void *v52;
  void *v53;
  int64_t v54;
  void *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  RBPersonaManager *personaManager;
  _BOOL4 v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  char v69;
  NSObject *v70;
  RBContainerManager *containerManager;
  void *v72;
  NSObject *v73;
  const char *v74;
  NSObject *v75;
  NSObject *v76;
  id *v78;
  char v79;
  xpc_object_t v80;
  void *v81;
  id obj;
  xpc_object_t xdict;
  id v84;
  id v85;
  _DWORD value[5];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t v94[128];
  uint8_t buf[4];
  id v96;
  __int16 v97;
  void *v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = objc_msgSend(v13, "executionOptions");
  v78 = a6;
  *a6 = 0;
  -[RBLaunchdJobManager _addStandardAppPropertiesToData:](self, "_addStandardAppPropertiesToData:", v11);
  if ((objc_msgSend(v13, "lsSpawnFlags") & 4) == 0)
  {
    v15 = objc_msgSend(v13, "spawnType");
    if (v15)
    {
      v16 = v15;
      if (v15 == 1)
      {
        v17 = "SystemApp";
      }
      else
      {
        rbs_general_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          -[RBLaunchdJobManager _addAppPropertiesToData:forIdentity:context:actualIdentity:error:].cold.2(v16, v18);

        v17 = 0;
      }
    }
    else
    {
      v17 = "App";
    }
    xpc_dictionary_set_string(v11, "ProcessType", v17);
    xpc_dictionary_set_int64(v11, "_LaunchType", 3);
  }
  objc_msgSend(v12, "description");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v11, "_ResourceCoalition", (const char *)objc_msgSend(v19, "UTF8String"));

  objc_msgSend(v13, "bundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v13, "bundleIdentifier");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v11, "CFBundleIdentifier", (const char *)objc_msgSend(v21, "UTF8String"));

  }
  objc_msgSend(v13, "_additionalMachServices");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 & 0x10) != 0)
    xpc_dictionary_set_BOOL(v11, "NSBuiltWithThreadSanitizer", 1);
  v81 = v13;
  v79 = v14;
  v80 = v11;
  v23 = v12;
  if ((v14 & 4) != 0)
  {

    v22 = 0;
  }
  xdict = xpc_dictionary_create(0, 0, 0);
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  obj = v22;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v91 != v26)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
        rbs_general_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v96 = v28;
          v97 = 2114;
          v98 = v23;
          _os_log_impl(&dword_21A8B4000, v29, OS_LOG_TYPE_DEFAULT, "Inserting mach service %{public}@ into job for %{public}@", buf, 0x16u);
        }

        v30 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_BOOL(v30, "ResetAtClose", 1);
        xpc_dictionary_set_value(xdict, (const char *)objc_msgSend(objc_retainAutorelease(v28), "UTF8String"), v30);

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
    }
    while (v25);
  }

  xpc_dictionary_set_value(v80, "MachServices", xdict);
  objc_msgSend(v81, "standardOutputPath");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v81, "standardOutputPath");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v80, "StandardOutPath", (const char *)objc_msgSend(v32, "UTF8String"));

  }
  objc_msgSend(v81, "standardErrorPath");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = self;
  if (v33)
  {
    objc_msgSend(v81, "standardErrorPath");
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v80, "StandardErrorPath", (const char *)objc_msgSend(v35, "UTF8String"));

  }
  objc_msgSend(v81, "standardInPath");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v81, "standardInPath");
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v80, "StandardInPath", (const char *)objc_msgSend(v37, "UTF8String"));

  }
  v38 = v23;
  if ((v79 & 5) == 1)
    xpc_dictionary_set_BOOL(v80, "WaitForDebugger", 1);
  if ((v79 & 6) == 2)
    xpc_dictionary_set_BOOL(v80, "DisableASLR", 1);
  if ((objc_msgSend(v81, "lsSpawnFlags") & 1) != 0)
    xpc_dictionary_set_BOOL(v80, "WaitForDebugger", 1);
  if (objc_msgSend(v81, "initialRole"))
  {
    objc_msgSend(v81, "initialRole");
    v39 = RBSDarwinRoleFromRBSRole();
    xpc_dictionary_set_int64(v80, "InitialTaskRole", v39);
  }
  objc_msgSend(v81, "lsBinpref");
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40
    && (v41 = (void *)v40,
        objc_msgSend(v81, "lsBinprefSubtype"),
        v42 = (void *)objc_claimAutoreleasedReturnValue(),
        v42,
        v41,
        v42))
  {
    v43 = xpc_array_create(0, 0);
    objc_msgSend(v81, "lsBinpref");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "count");

    if (v45)
    {
      v46 = 0;
      do
      {
        objc_msgSend(v81, "lsBinpref");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectAtIndex:", v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_int64(v49, "CPUType", objc_msgSend(v48, "integerValue"));
        objc_msgSend(v81, "lsBinprefSubtype");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "count");

        if (v51 <= v46)
        {
          v54 = -1;
        }
        else
        {
          objc_msgSend(v81, "lsBinprefSubtype");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectAtIndex:", v46);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "integerValue");

        }
        xpc_dictionary_set_int64(v49, "CPUSubtype", v54);
        xpc_array_set_value(v43, 0xFFFFFFFFFFFFFFFFLL, v49);

        ++v46;
        objc_msgSend(v81, "lsBinpref");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "count");

      }
      while (v56 > v46);
      v38 = v23;
      v34 = self;
    }
  }
  else
  {
    objc_msgSend(v81, "lsBinpref");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v57)
      goto LABEL_58;
    v43 = xpc_array_create(0, 0);
    *(_OWORD *)&value[1] = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    objc_msgSend(v81, "lsBinpref");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &value[1], v94, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v87;
      do
      {
        for (j = 0; j != v60; ++j)
        {
          if (*(_QWORD *)v87 != v61)
            objc_enumerationMutation(v58);
          xpc_array_set_int64(v43, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*(_QWORD *)&value[3] + 8 * j), "unsignedIntegerValue"));
        }
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &value[1], v94, 16);
      }
      while (v60);
    }

  }
  xpc_dictionary_set_value(v80, "BinaryOrderPreference", v43);

LABEL_58:
  if (objc_msgSend(v81, "lsUMask"))
    xpc_dictionary_set_int64(v80, "Umask", objc_msgSend(v81, "lsUMask"));
  if (objc_msgSend(v38, "platform"))
    xpc_dictionary_set_int64(v80, "Platform", (int)objc_msgSend(v38, "platform"));
  os_unfair_lock_lock(&v34->_lock);
  if (-[NSMutableOrderedSet containsObject:](v34->_lock_reslideIdentities, "containsObject:", v38))
    xpc_dictionary_set_BOOL(v80, "ReslideSharedCache", 1);
  os_unfair_lock_unlock(&v34->_lock);
  value[0] = 0;
  personaManager = v34->_personaManager;
  v85 = 0;
  v64 = -[RBPersonaManager personaForIdentity:context:personaUID:personaUniqueString:](personaManager, "personaForIdentity:context:personaUID:personaUniqueString:", v38, v81, value, &v85);
  v65 = v85;
  if (v64)
  {
    xpc_dictionary_set_int64(v80, "PersonaEnterprise", value[0]);
    v66 = (void *)objc_msgSend(v38, "copyWithPersonaString:", v65);

    v38 = objc_retainAutorelease(v66);
    *v78 = v38;
    objc_msgSend(v38, "description");
    v67 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v80, "_ResourceCoalition", (const char *)objc_msgSend(v67, "UTF8String"));

    _addRBProperties(v80, v38, v81);
  }
  objc_msgSend(v81, "preventContainerization");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "BOOLValue");

  if ((v69 & 1) == 0)
  {
    containerManager = v34->_containerManager;
    v84 = 0;
    -[RBContainerManager containerPathForIdentity:context:persona:error:](containerManager, "containerPathForIdentity:context:persona:error:", v38, v81, v65, &v84);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v84;
    v70 = v73;
    if (v72)
    {
      v74 = (const char *)objc_msgSend(objc_retainAutorelease(v72), "fileSystemRepresentation");
      xpc_dictionary_set_string(v80, "SandboxContainer", v74);
      xpc_dictionary_get_value(v80, "EnvironmentVariables");
      v75 = objc_claimAutoreleasedReturnValue();
      v76 = v75;
      if (v75)
      {
        xpc_dictionary_set_value(v75, "HOME", 0);
        xpc_dictionary_set_value(v76, "CFFIXED_USER_HOME", 0);
        xpc_dictionary_set_value(v76, "TMPDIR", 0);
        xpc_dictionary_set_value(v76, "_DYLD_CLOSURE_HOME", 0);
        xpc_dictionary_set_string(v76, "HOME", v74);
      }
    }
    else
    {
      if (!v73)
      {
LABEL_76:

        goto LABEL_77;
      }
      rbs_job_log();
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
        -[RBLaunchdJobManager _addAppPropertiesToData:forIdentity:context:actualIdentity:error:].cold.1();
    }

    goto LABEL_76;
  }
  rbs_job_log();
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v96 = v38;
    v97 = 2114;
    v98 = v81;
    _os_log_impl(&dword_21A8B4000, v70, OS_LOG_TYPE_DEFAULT, "'%{public}@' Skipping container path lookup because containerization was prevented (%{public}@)", buf, 0x16u);
  }
LABEL_77:

  return 1;
}

- (void)_addStandardAppPropertiesToData:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  xpc_dictionary_set_string(xdict, "UserName", "mobile");
  xpc_dictionary_set_BOOL(xdict, "MaterializeDatalessFiles", 1);
  xpc_dictionary_set_BOOL(xdict, "EnablePressuredExit", 0);
  xpc_dictionary_set_BOOL(xdict, "EnableTransactions", 0);
  xpc_dictionary_set_int64(xdict, "ThrottleInterval", 0x7FFFFFFFLL);
  xpc_dictionary_set_int64(xdict, "ExitTimeOut", 1);

}

- (id)createAndLaunchWithIdentity:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  RBLaunchdInterfacing *launchdInterface;
  void *v14;
  NSObject *v15;
  RBLaunchdInterfacing *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void **v21;
  uint64_t *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  id *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  id *v39;
  int v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t *v46;
  uint64_t *v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  NSObject *v71;
  char v72;
  id v73;
  NSObject *v74;
  NSObject *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  RBLaunchdJobManager *v83;
  uint64_t v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  void *v103;
  _BYTE buf[12];
  __int16 v105;
  id v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  _QWORD v115[4];

  v115[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  rbs_job_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v8;
    _os_log_impl(&dword_21A8B4000, v10, OS_LOG_TYPE_DEFAULT, "Creating and launching job for: %{public}@", buf, 0xCu);
  }

  v11 = objc_msgSend(v8, "hasConsistentLaunchdJob");
  if (v11)
  {
    objc_msgSend(v8, "consistentLaunchdJobLabel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      launchdInterface = self->_launchdInterface;
      objc_msgSend(MEMORY[0x24BE043B0], "currentDomain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[RBLaunchdInterfacing copyJobWithLabel:domain:](launchdInterface, "copyJobWithLabel:domain:", v12, v14);

      if (v15)
      {
        v16 = self->_launchdInterface;
        v93 = 0;
        -[RBLaunchdInterfacing propertiesForJob:error:](v16, "propertiesForJob:error:", v15, &v93);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v93;
        if (!v17)
        {
          rbs_process_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.7();
          goto LABEL_30;
        }
        if (objc_msgSend(v8, "osServiceType") == 3 && objc_msgSend(v17, "serviceType") != 3)
        {
          rbs_process_log();
          v76 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
            -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.9();

          v82 = (void *)MEMORY[0x24BDD1540];
          v80 = *MEMORY[0x24BE80E58];
          v111 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Launchd could not find angel job"));
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = v85;
          v20 = (void *)MEMORY[0x24BDBCE70];
          v21 = &v112;
          v22 = &v111;
        }
        else
        {
          if (objc_msgSend(v8, "osServiceType") != 2 || objc_msgSend(v17, "serviceType") != 3)
            goto LABEL_31;
          rbs_process_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.8();

          v82 = (void *)MEMORY[0x24BDD1540];
          v80 = *MEMORY[0x24BE80E58];
          v109 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Launchd found an angel job for requested daemon launch"));
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = v85;
          v20 = (void *)MEMORY[0x24BDBCE70];
          v21 = &v110;
          v22 = &v109;
        }
        objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 1);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "errorWithDomain:code:userInfo:", v80, 4, v77);
        v84 = objc_claimAutoreleasedReturnValue();

        v32 = v15;
        v18 = (id)v84;
LABEL_29:
        v15 = 0;
LABEL_30:

        goto LABEL_31;
      }
      v36 = (void *)MEMORY[0x24BDD1540];
      v37 = *MEMORY[0x24BE80E58];
      v113 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Launchd could not find job"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v36;
      v34 = v37;
      v35 = 4;
    }
    else
    {
      v30 = (void *)MEMORY[0x24BDD1540];
      v31 = *MEMORY[0x24BE80E58];
      v107 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Identity doesn't have required label"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v30;
      v34 = v31;
      v35 = 3;
    }
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, v35, v32);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  if (objc_msgSend(v8, "isExtension"))
  {
    objc_msgSend(v8, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = 0;
    -[RBLaunchdJobManager _createAndSubmitExtensionJob:UUID:error:](self, "_createAndSubmitExtensionJob:UUID:error:", v9, v23, &v92);
    v15 = objc_claimAutoreleasedReturnValue();
    v18 = v92;

    rbs_general_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      goto LABEL_32;
    -[NSObject handle](v15, "handle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v17;
    _os_log_impl(&dword_21A8B4000, v12, OS_LOG_TYPE_INFO, "submitted extension job %{public}@", buf, 0xCu);
LABEL_31:

LABEL_32:
    if (v15)
    {
      v86 = v9;
      v29 = v11 ^ 1;
      v88 = v18;
      v27 = &v88;
      -[NSObject start:](v15, "start:", &v88);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:
      v38 = *v27;

      if (v28)
      {
        if (objc_msgSend(v28, "state") == 2)
        {
          if ((int)objc_msgSend(v28, "pid") > 0)
            goto LABEL_62;
          v83 = self;
          v39 = a5;
          v40 = v29;
          rbs_general_log();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.5(v28);

          v42 = (void *)MEMORY[0x24BDD1540];
          v43 = *MEMORY[0x24BE80E58];
          v94 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Launchd job spawn failed for unknown reason"));
          v44 = objc_claimAutoreleasedReturnValue();
          v95 = v44;
          v45 = (void *)MEMORY[0x24BDBCE70];
          v46 = &v95;
          v47 = &v94;
        }
        else
        {
          v83 = self;
          v39 = a5;
          v40 = v29;
          switch(objc_msgSend(v28, "state"))
          {
            case 1:
              goto LABEL_58;
            case 2:
              abort();
            case 3:
              v55 = (int)objc_msgSend(v28, "lastSpawnError");
              v56 = (void *)MEMORY[0x24BDD1540];
              v57 = *MEMORY[0x24BDD1128];
              v115[0] = *MEMORY[0x24BDD0FC8];
              *(_QWORD *)buf = CFSTR("Launchd job spawn failed");
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v115, 1);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "errorWithDomain:code:userInfo:", v57, v55, v58);
              v54 = objc_claimAutoreleasedReturnValue();

              goto LABEL_61;
            case 4:
              v79 = (void *)MEMORY[0x24BDD1540];
              v78 = *MEMORY[0x24BE80E58];
              v98 = *MEMORY[0x24BDD0FC8];
              v65 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v28, "lastExitStatus");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = objc_msgSend(v81, "os_reason_namespace");
              objc_msgSend(v28, "lastExitStatus");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "stringWithFormat:", CFSTR("Launchd job spawn immediately exited with namespace %d code %lld"), v66, objc_msgSend(v67, "os_reason_code"));
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v99 = v68;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "errorWithDomain:code:userInfo:", v78, 0, v69);
              v54 = objc_claimAutoreleasedReturnValue();

              v38 = v81;
              goto LABEL_61;
            default:
              rbs_general_log();
              v63 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.6(v28);
              v40 = v29;

LABEL_58:
              v42 = (void *)MEMORY[0x24BDD1540];
              v43 = *MEMORY[0x24BE80E58];
              v96 = *MEMORY[0x24BDD0FC8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Launchd job spawn failed for unknown reason"));
              v44 = objc_claimAutoreleasedReturnValue();
              v97 = v44;
              v45 = (void *)MEMORY[0x24BDBCE70];
              v46 = &v97;
              v47 = &v96;
              break;
          }
        }
        objc_msgSend(v45, "dictionaryWithObjects:forKeys:count:", v46, v47, 1);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "errorWithDomain:code:userInfo:", v43, 0, v64);
        v54 = objc_claimAutoreleasedReturnValue();

        v38 = (id)v44;
      }
      else
      {
        if (v38)
          goto LABEL_63;
        v83 = self;
        v39 = a5;
        v40 = v29;
        rbs_general_log();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.4(v50);

        v51 = (void *)MEMORY[0x24BDD1540];
        v52 = *MEMORY[0x24BE80E58];
        v100 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Launchd job spawn failed for unknown reason"));
        v38 = (id)objc_claimAutoreleasedReturnValue();
        v101 = v38;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "errorWithDomain:code:userInfo:", v52, 0, v53);
        v54 = objc_claimAutoreleasedReturnValue();

      }
LABEL_61:

      v38 = (id)v54;
      v29 = v40;
      a5 = v39;
      self = v83;
LABEL_62:
      if (!v38)
      {
        objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", objc_msgSend(v28, "pid"));
        v74 = objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          os_unfair_lock_lock(&self->_lock);
          -[NSMutableDictionary setObject:forKey:](self->_lock_jobsByIdentifier, "setObject:forKey:", v15, v74);
          os_unfair_lock_unlock(&self->_lock);
        }
        objc_msgSend(MEMORY[0x24BE80CB0], "instanceWithIdentifier:identity:", v74, v8);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = 0;
        v9 = v86;
        goto LABEL_79;
      }
LABEL_63:
      rbs_general_log();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.3();

      v9 = v86;
      if (a5)
        *a5 = objc_retainAutorelease(v38);
      if (!v29)
      {
        v49 = 0;
        goto LABEL_80;
      }
      rbs_general_log();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A8B4000, v71, OS_LOG_TYPE_INFO, "Removing job after failed start", buf, 2u);
      }

      v87 = v38;
      v72 = -[NSObject remove:](v15, "remove:", &v87);
      v73 = v87;

      if ((v72 & 1) != 0)
      {
        v49 = 0;
        v38 = v73;
        v9 = v86;
LABEL_80:

        v18 = v38;
        goto LABEL_81;
      }
      rbs_general_log();
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.2();
      v49 = 0;
      v9 = v86;
LABEL_79:

      v38 = v73;
      goto LABEL_80;
    }
    goto LABEL_40;
  }
  v90 = 0;
  v91 = 0;
  -[RBLaunchdJobManager _createLaunchdJobWithIdentity:context:actualIdentity:error:](self, "_createLaunchdJobWithIdentity:context:actualIdentity:error:", v8, v9, &v91, &v90);
  v15 = objc_claimAutoreleasedReturnValue();
  v24 = v91;
  v18 = v90;
  if (_os_feature_enabled_impl() && v24 && v24 != v8 && (objc_msgSend(v24, "isEqual:", v8) & 1) == 0)
  {
    rbs_job_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v8;
      v105 = 2114;
      v106 = v24;
      _os_log_impl(&dword_21A8B4000, v25, OS_LOG_TYPE_DEFAULT, "Adjusting identity of job from %{public}@ to %{public}@", buf, 0x16u);
    }

    v26 = v24;
    v8 = v26;
  }

  if (v15)
  {
    v86 = v9;
    v89 = v18;
    v27 = &v89;
    -[NSObject submitAndStart:](v15, "submitAndStart:", &v89);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 1;
    goto LABEL_34;
  }
LABEL_40:
  rbs_general_log();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.1();

  if (!a5)
    goto LABEL_52;
  if (!v18)
  {
    v59 = (void *)MEMORY[0x24BDD1540];
    v60 = *MEMORY[0x24BE80E58];
    v102 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Launchd job spawn failed to create job"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v61;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "errorWithDomain:code:userInfo:", v60, 0, v62);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v18 = 0;
LABEL_52:
    v49 = 0;
    goto LABEL_81;
  }
  v18 = objc_retainAutorelease(v18);
  v49 = 0;
  *a5 = v18;
LABEL_81:

  return v49;
}

void __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  int v7;
  id *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  const char *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  id v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "pid"))
    {
      v7 = objc_msgSend(v6, "pid");
      v8 = (id *)(a1 + 32);
      if (v7 != objc_msgSend(*(id *)(a1 + 32), "rbs_pid"))
      {
        objc_msgSend(*v8, "identity");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isApplication");

        rbs_general_log();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v10)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
            __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_4((uint64_t *)(a1 + 32), v6, v12);
        }
        else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v22 = *v8;
          v35 = 138543618;
          v36 = v22;
          v37 = 1024;
          v38 = objc_msgSend(v6, "pid");
          _os_log_impl(&dword_21A8B4000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ reported with incorrect pid %d", (uint8_t *)&v35, 0x12u);
        }

      }
    }
    v14 = 0;
    switch(objc_msgSend(v6, "state"))
    {
      case 1:
        rbs_general_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v23 = *(void **)(a1 + 32);
          v35 = 138543362;
          v36 = v23;
          v24 = "%{public}@ reported to RB as never ran";
          goto LABEL_21;
        }
        break;
      case 2:
        rbs_general_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v25 = *(void **)(a1 + 32);
          v35 = 138543362;
          v36 = v25;
          v24 = "%{public}@ reported to RB as running";
LABEL_21:
          _os_log_impl(&dword_21A8B4000, v14, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v35, 0xCu);
        }
        break;
      case 3:
        goto LABEL_26;
      case 4:
        objc_msgSend(v6, "lastExitStatus");
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          rbs_general_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_3(a1, v26, v27, v28, v29, v30, v31, v32);

          v14 = 0;
        }
LABEL_26:
        v33 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 32), "identity");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "_addReslideIdentityIfNeeded:exitStatus:", v34, v14);

        _handleDeath(*(void **)(a1 + 32), *(void **)(a1 + 56), v14);
        objc_msgSend(*(id *)(a1 + 40), "cancelMonitor");
        break;
      default:
        rbs_general_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_2(a1, v6, v14);
        break;
    }
LABEL_29:

    goto LABEL_30;
  }
  rbs_general_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (a3 != 113)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_1(a1, v14, v16, v17, v18, v19, v20, v21);
    goto LABEL_29;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(void **)(a1 + 32);
    v35 = 138543362;
    v36 = v15;
    _os_log_impl(&dword_21A8B4000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ job reported to RB as removed", (uint8_t *)&v35, 0xCu);
  }

  _handleDeath(*(void **)(a1 + 32), *(void **)(a1 + 56), 0);
  objc_msgSend(*(id *)(a1 + 40), "cancelMonitor");
LABEL_30:

}

- (id)_createAndSubmitExtensionJob:(id)a3 UUID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *logQueue;
  id v36;
  id v37;
  uint64_t v38;
  RBLaunchdInterfacing *launchdInterface;
  void *v40;
  id v41;
  id v42;
  NSObject *v43;
  void *v44;
  RBLaunchdInterfacing *v45;
  id v46;
  __CFString *v47;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  _QWORD block[4];
  id v57;
  id v58;
  id v59;
  id v60;
  uint8_t buf[16];
  _QWORD v62[4];

  v62[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "extensionOverlay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = _CFXPCCreateXPCObjectFromCFObject();
    v12 = (void *)v11;
    if (!v11 || (v13 = MEMORY[0x22074C57C](v11), v14 = MEMORY[0x24BDACFA0], v13 != MEMORY[0x24BDACFA0]))
    {
      if (a5)
      {
        v15 = (void *)MEMORY[0x24BDD1540];
        v16 = *MEMORY[0x24BDD1128];
        *(_QWORD *)buf = *MEMORY[0x24BDD0FC8];
        v62[0] = CFSTR("Unable to launch extension using invalid overlay (not a dictionary)");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, buf, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 22, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = 0;
        *a5 = v18;
      }
      else
      {
        v19 = 0;
      }
      goto LABEL_44;
    }
    xpc_dictionary_get_dictionary(v12, "XPCService");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (!v24 || MEMORY[0x22074C57C](v24) != v14)
    {
      if (a5)
      {
        v26 = (void *)MEMORY[0x24BDD1540];
        v27 = *MEMORY[0x24BDD1128];
        *(_QWORD *)buf = *MEMORY[0x24BDD0FC8];
        v62[0] = CFSTR("Unable to launch extension using invalid overlay (missing XPCService dict)");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, buf, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 22, v28);
        v29 = objc_claimAutoreleasedReturnValue();

        v30 = (void *)v29;
LABEL_13:
        v19 = 0;
        *a5 = v30;
LABEL_43:

LABEL_44:
        goto LABEL_45;
      }
LABEL_35:
      v19 = 0;
      goto LABEL_43;
    }
    xpc_dictionary_set_string(v25, "_ManagedBy", "com.apple.runningboard");
    objc_msgSend(v8, "identity");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    _addRBProperties(v25, v31, v8);

    objc_msgSend(v8, "identity");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "personaString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      if (-[RBLaunchdJobManager _addPersonaFromExtensionContext:toServiceDict:](self, "_addPersonaFromExtensionContext:toServiceDict:", v8, v25))
      {
        if (-[RBLaunchdJobManager _addContainerPropertiesFromExtensionContext:toServiceDict:](self, "_addContainerPropertiesFromExtensionContext:toServiceDict:", v8, v25))
        {
          goto LABEL_18;
        }
        if (!a5)
          goto LABEL_35;
        v47 = CFSTR("Unable to launch extension (could not add container path to overlay)");
      }
      else
      {
        if (!a5)
          goto LABEL_35;
        v47 = CFSTR("Unable to launch extension (could not get persona values for overlay)");
      }
      _posixErrorWithCodeAndDescription(22, v47);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_18:
    objc_msgSend(v8, "_overrideExecutablePath");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      logQueue = self->_logQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __63__RBLaunchdJobManager__createAndSubmitExtensionJob_UUID_error___block_invoke;
      block[3] = &unk_24DD466C8;
      v9 = v9;
      v57 = v9;
      v36 = v8;
      v58 = v36;
      v50 = v34;
      v51 = v34;
      v59 = v51;
      v37 = v12;
      v60 = v37;
      dispatch_async(logQueue, block);
      v49 = v36;
      -[RBLaunchdInterfacing domainForPid:](self->_launchdInterface, "domainForPid:", objc_msgSend(v36, "hostPid"));
      v38 = objc_claimAutoreleasedReturnValue();
      launchdInterface = self->_launchdInterface;
      v55 = 0;
      -[RBLaunchdInterfacing submitExtension:overlay:domain:error:](launchdInterface, "submitExtension:overlay:domain:error:", v51, v37, v38, &v55);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v55;
      v42 = v41;
      v53 = (void *)v38;
      if (v40)
      {
        if (v9 || (objc_msgSend(v49, "oneShotUUID"), (v9 = (id)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v52 = v42;
          v62[0] = 0;
          v62[1] = 0;
          objc_msgSend(v9, "getUUIDBytes:", v62);
          rbs_job_log();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v9;
            _os_log_impl(&dword_21A8B4000, v43, OS_LOG_TYPE_INFO, "Setting one-shot instance on launch: %{public}@", buf, 0xCu);
          }

          -[RBLaunchdInterfacing instancePropertiesFromOverlay:](self->_launchdInterface, "instancePropertiesFromOverlay:", v10);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = self->_launchdInterface;
          v54 = 0;
          -[RBLaunchdInterfacing forJob:createInstance:properties:error:](v45, "forJob:createInstance:properties:error:", v40, v62, v44, &v54);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v54;

          if (a5 && !v19)
            *a5 = objc_retainAutorelease(v46);

        }
        else
        {
          v46 = v42;
          v19 = v40;
        }
      }
      else if (a5)
      {
        v46 = objc_retainAutorelease(v41);
        v19 = 0;
        *a5 = v46;
      }
      else
      {
        v19 = 0;
        v46 = v41;
      }
      v34 = v50;

    }
    else if (a5)
    {
      _posixErrorWithCodeAndDescription(22, CFSTR("Unable to launch extension without path"));
      v19 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }

    goto LABEL_43;
  }
  if (a5)
  {
    v20 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDD1128];
    *(_QWORD *)buf = *MEMORY[0x24BDD0FC8];
    v62[0] = CFSTR("Unable to launch extension without overlay");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, buf, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 22, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    *a5 = v23;
  }
  else
  {
    v19 = 0;
  }
LABEL_45:

  return v19;
}

- (void)_addReslideIdentityIfNeeded:(id)a3 exitStatus:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v7, "isApplication") && (objc_msgSend(v6, "os_reason_flags") & 0x400) != 0)
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableOrderedSet removeObject:](self->_lock_reslideIdentities, "removeObject:", v7);
    -[NSMutableOrderedSet addObject:](self->_lock_reslideIdentities, "addObject:", v7);
    if ((unint64_t)-[NSMutableOrderedSet count](self->_lock_reslideIdentities, "count") >= 0x1A)
      -[NSMutableOrderedSet removeObjectAtIndex:](self->_lock_reslideIdentities, "removeObjectAtIndex:", 0);
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (BOOL)removeJobWithInstance:(id)a3 error:(id *)a4
{
  return -[RBLaunchdJobManager _removeJobWithInstance:orJob:error:](self, "_removeJobWithInstance:orJob:error:", a3, 0, a4);
}

- (BOOL)_removeJobWithInstance:(id)a3 orJob:(id)a4 error:(id *)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSMutableDictionary *lock_monitoredJobsByIdentifier;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  NSMutableDictionary *lock_jobsByIdentifier;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  char v22;
  id v23;
  void *v24;
  NSObject *v25;
  BOOL v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  id v43;
  uint8_t buf[16];
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBLaunchdJobManager.m"), 1166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("instance"));

  }
  rbs_job_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v9;
    _os_log_impl(&dword_21A8B4000, v11, OS_LOG_TYPE_INFO, "Cleaning out %{public}@ from job manager", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  if (v10)
  {
LABEL_9:
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v9, "identity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "isApplication") & 1) == 0 && !objc_msgSend(v20, "isDext"))
    {
      v26 = 1;
LABEL_32:

      goto LABEL_33;
    }
    if ((objc_msgSend(v20, "isXPCService") & 1) != 0
      || -[RBLaunchdJobManager _isRunningBoardLaunched:](self, "_isRunningBoardLaunched:", v10))
    {
      rbs_job_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v9;
        _os_log_impl(&dword_21A8B4000, v21, OS_LOG_TYPE_DEFAULT, "Removing launch job for: %{public}@", buf, 0xCu);
      }

      v43 = 0;
      v22 = -[NSObject remove:](v10, "remove:", &v43);
      v23 = v43;
      v24 = v23;
      if ((v22 & 1) != 0 || objc_msgSend(v23, "code") == 36)
      {
        rbs_job_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v9;
          _os_log_impl(&dword_21A8B4000, v25, OS_LOG_TYPE_DEFAULT, "Removed job for %{public}@", buf, 0xCu);
        }
        v26 = 1;
        goto LABEL_30;
      }
      rbs_general_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
        -[RBLaunchdJobManager _removeJobWithInstance:orJob:error:].cold.1();

      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to delete job with label %@"), v9);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v24, "code");
        v36 = (void *)MEMORY[0x24BDD1540];
        v37 = *MEMORY[0x24BDD1128];
        v45[0] = *MEMORY[0x24BDD0FC8];
        *(_QWORD *)buf = v34;
        v38 = (void *)MEMORY[0x24BDBCE70];
        v25 = v34;
        objc_msgSend(v38, "dictionaryWithObjects:forKeys:count:", buf, v45, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "errorWithDomain:code:userInfo:", v37, v35, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = v40;
        goto LABEL_29;
      }
    }
    else
    {
      rbs_general_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        -[RBLaunchdJobManager _removeJobWithInstance:orJob:error:].cold.2();

      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to delete job not submitted by RunningBoard"));
        v25 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x24BDD1540];
        v29 = *MEMORY[0x24BDD1128];
        v45[0] = *MEMORY[0x24BDD0FC8];
        *(_QWORD *)buf = v25;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v45, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, -1, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = v31;
        v24 = 0;
LABEL_29:
        v26 = 0;
        *a5 = v32;
LABEL_30:

LABEL_31:
        goto LABEL_32;
      }
      v24 = 0;
    }
    v26 = 0;
    goto LABEL_31;
  }
  lock_monitoredJobsByIdentifier = self->_lock_monitoredJobsByIdentifier;
  objc_msgSend(v9, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](lock_monitoredJobsByIdentifier, "objectForKey:", v13);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10
    || (v14 = self->_lock_jobsByIdentifier,
        objc_msgSend(v9, "identifier"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NSMutableDictionary objectForKey:](v14, "objectForKey:", v15),
        v10 = objc_claimAutoreleasedReturnValue(),
        v15,
        v10))
  {
    lock_jobsByIdentifier = self->_lock_jobsByIdentifier;
    objc_msgSend(v9, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](lock_jobsByIdentifier, "removeObjectForKey:", v17);

    v18 = self->_lock_monitoredJobsByIdentifier;
    objc_msgSend(v9, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v18, "removeObjectForKey:", v19);

    goto LABEL_9;
  }
  os_unfair_lock_unlock(&self->_lock);
  rbs_general_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v9;
    _os_log_impl(&dword_21A8B4000, v10, OS_LOG_TYPE_DEFAULT, "removeJobWithInstance called for identity without existing job %{public}@", buf, 0xCu);
  }
  v26 = 1;
LABEL_33:

  return v26;
}

+ (id)lastExitStatusForLabel:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  int last_exit_reason_4SB;
  int v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v7, "UTF8String");
  last_exit_reason_4SB = _launch_get_last_exit_reason_4SB();
  if (!last_exit_reason_4SB)
  {
    rbs_job_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v7;
      _os_log_impl(&dword_21A8B4000, v19, OS_LOG_TYPE_DEFAULT, "Launchd says label %{public}@ has never exited", buf, 0xCu);
    }

    goto LABEL_10;
  }
  v9 = last_exit_reason_4SB;
  objc_msgSend(MEMORY[0x24BE80C70], "statusWithDomain:code:", 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = xpc_strerror();
  rbs_job_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    v24 = v7;
    v25 = 2080;
    v26 = v11;
    v27 = 1024;
    v28 = v9;
    _os_log_error_impl(&dword_21A8B4000, v12, OS_LOG_TYPE_ERROR, "failed to get process exit details for %{public}@ : %s (%d)", buf, 0x1Cu);
  }

  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to get process exit details for label %@"), v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD1128];
    v17 = *MEMORY[0x24BDD0FD8];
    v21[0] = *MEMORY[0x24BDD0FC8];
    v21[1] = v17;
    v22[0] = v13;
    v22[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v9, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_11:

  return v10;
}

- (RBLaunchdJobManager)initWithLaunchdInterface:(id)a3 personaManager:(id)a4 containerManager:(id)a5 bundlePropertiesManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  RBLaunchdJobManager *v15;
  uint64_t v16;
  NSMutableDictionary *lock_jobsByIdentifier;
  uint64_t v18;
  NSMutableDictionary *lock_monitoredJobsByIdentifier;
  NSMutableOrderedSet *v20;
  NSMutableOrderedSet *lock_reslideIdentities;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *logQueue;
  RBLaunchdJobManager *v25;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)RBLaunchdJobManager;
  v15 = -[RBLaunchdJobManager init](&v27, sel_init);
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    lock_jobsByIdentifier = v15->_lock_jobsByIdentifier;
    v15->_lock_jobsByIdentifier = (NSMutableDictionary *)v16;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    lock_monitoredJobsByIdentifier = v15->_lock_monitoredJobsByIdentifier;
    v15->_lock_monitoredJobsByIdentifier = (NSMutableDictionary *)v18;

    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_launchdInterface, a3);
    objc_storeStrong((id *)&v15->_personaManager, a4);
    objc_storeStrong((id *)&v15->_containerManager, a5);
    objc_storeStrong((id *)&v15->_bundlePropertiesManager, a6);
    v20 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
    lock_reslideIdentities = v15->_lock_reslideIdentities;
    v15->_lock_reslideIdentities = v20;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create("com.apple.runningboard.launchdLogging", v22);
    logQueue = v15->_logQueue;
    v15->_logQueue = (OS_dispatch_queue *)v23;

    v25 = v15;
  }

  return v15;
}

- (void)_addDextPropertiesToData:(id)a3 forIdentity:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  char v9;
  xpc_object_t v10;
  void *v11;
  id v12;
  xpc_object_t xdict;

  xdict = a3;
  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v8, "executionOptions");
  xpc_dictionary_set_string(xdict, "ProcessType", "Driver");
  xpc_dictionary_set_BOOL(xdict, "RunAtLoad", 1);
  xpc_dictionary_set_BOOL(xdict, "LaunchOnlyOnce", 1);
  xpc_dictionary_set_string(xdict, "UserName", "_driverkit");
  xpc_dictionary_set_string(xdict, "SandboxProfile", "com.apple.dext");
  xpc_dictionary_set_BOOL(xdict, "_NullBootstrapPort", 1);
  if ((v9 & 0x40) != 0)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "Core", 0x7FFFFFFFFFFFFFFFuLL);
    xpc_dictionary_set_value(xdict, "HardResourceLimits", v10);
    xpc_dictionary_set_value(xdict, "SoftResourceLimits", v10);

  }
  objc_msgSend(v7, "dextServerName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v7, "dextServerName");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(xdict, "_JetsamPropertiesIdentifier", (const char *)objc_msgSend(v12, "UTF8String"));

  }
  if ((v9 & 0x20) != 0)
    xpc_dictionary_set_BOOL(xdict, "ReslideSharedCache", 1);
  objc_msgSend(v8, "dextCheckInPort");
  xpc_dictionary_set_mach_send();

}

- (BOOL)_addPersonaFromExtensionContext:(id)a3 toServiceDict:(id)a4
{
  id v6;
  id v7;
  RBPersonaManager *personaManager;
  void *v9;
  _BOOL4 v10;
  int64_t value;

  v6 = a3;
  v7 = a4;
  if (!-[RBPersonaManager personaRequiredForExtensionContext:serviceDict:](self->_personaManager, "personaRequiredForExtensionContext:serviceDict:", v6, v7))goto LABEL_4;
  LODWORD(value) = -1;
  personaManager = self->_personaManager;
  objc_msgSend(v6, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[RBPersonaManager personaForIdentity:context:personaUID:personaUniqueString:](personaManager, "personaForIdentity:context:personaUID:personaUniqueString:", v9, v6, &value, 0);

  if (v10)
  {
    xpc_dictionary_set_int64(v7, "PersonaEnterprise", value);
LABEL_4:
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (void)_addExtensionEnvironmentFromContainerURL:(id)a3 toServiceDict:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  void *v8;
  id v9;
  id v10;

  v5 = a3;
  v6 = a4;
  v10 = objc_retainAutorelease(v5);
  v7 = (const char *)objc_msgSend(v10, "fileSystemRepresentation");
  xpc_dictionary_get_dictionary(v6, "EnvironmentVariables");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v6, "EnvironmentVariables", v8);
  }
  if (!xpc_dictionary_get_string(v8, "HOME"))
  {
    xpc_dictionary_set_string(v8, "HOME", v7);
    xpc_dictionary_set_string(v8, "CFFIXED_USER_HOME", v7);
    objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("tmp"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v8, "TMPDIR", (const char *)objc_msgSend(v9, "fileSystemRepresentation"));

  }
}

- (void)_addExtensionContainerURL:(id)a3 toServiceDict:(id)a4
{
  id v5;
  xpc_object_t xdict;

  v5 = objc_retainAutorelease(a3);
  xdict = a4;
  xpc_dictionary_set_string(xdict, "_SandboxContainer", (const char *)objc_msgSend(v5, "fileSystemRepresentation"));

}

- (id)_containerURLForExtensionContext:(id)a3
{
  id v4;
  RBBundlePropertiesManaging *bundlePropertiesManager;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  bundlePropertiesManager = self->_bundlePropertiesManager;
  objc_msgSend(v4, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBBundlePropertiesManaging propertiesForIdentity:identifier:](bundlePropertiesManager, "propertiesForIdentity:identifier:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "containerOverrideIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personaString");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10 | v8;

  if (v11)
    -[RBContainerManager sandboxContainerURLForExtensionContext:containerOverrideIdentifier:](self->_containerManager, "sandboxContainerURLForExtensionContext:containerOverrideIdentifier:", v4, v8);
  else
    objc_msgSend(v7, "dataContainerURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)_addContainerPropertiesFromExtensionContext:(id)a3 toServiceDict:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  if (-[RBContainerManager containerRequiredForServiceDict:](self->_containerManager, "containerRequiredForServiceDict:", v7))
  {
    -[RBContainerManager sandboxContainerURLForExtensionContext:containerOverrideIdentifier:](self->_containerManager, "sandboxContainerURLForExtensionContext:containerOverrideIdentifier:", v6, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v10 = 0;
      goto LABEL_6;
    }
    v9 = (void *)v8;
    -[RBLaunchdJobManager _addExtensionContainerURL:toServiceDict:](self, "_addExtensionContainerURL:toServiceDict:", v8, v7);
    -[RBLaunchdJobManager _addExtensionEnvironmentFromContainerURL:toServiceDict:](self, "_addExtensionEnvironmentFromContainerURL:toServiceDict:", v9, v7);

  }
  v10 = 1;
LABEL_6:

  return v10;
}

- (BOOL)_isRunningBoardLaunched:(id)a3
{
  RBLaunchdInterfacing *launchdInterface;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  launchdInterface = self->_launchdInterface;
  v15 = 0;
  -[RBLaunchdInterfacing propertiesForJob:error:](launchdInterface, "propertiesForJob:error:", a3, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  if (v4)
  {
    objc_msgSend(v4, "additionalProperties");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && (v8 = MEMORY[0x22074C57C](v6), v9 = MEMORY[0x24BDACFA0], v8 == MEMORY[0x24BDACFA0]))
    {
      xpc_dictionary_get_value(v7, "RunningBoard");
      v12 = objc_claimAutoreleasedReturnValue();
      v10 = v12;
      if (v12 && MEMORY[0x22074C57C](v12) == v9)
      {
        v11 = xpc_dictionary_get_BOOL(v10, "RunningBoardLaunched");
        goto LABEL_15;
      }
      rbs_general_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A8B4000, v13, OS_LOG_TYPE_INFO, "_isRunningBoardLaunched has no RBProperties", buf, 2u);
      }

    }
    else
    {
      rbs_general_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A8B4000, v10, OS_LOG_TYPE_INFO, "_isRunningBoardLaunched has no additionalProperties", buf, 2u);
      }
    }
    v11 = 0;
LABEL_15:

    goto LABEL_16;
  }
  rbs_general_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v5;
    _os_log_impl(&dword_21A8B4000, v7, OS_LOG_TYPE_DEFAULT, "propertiesForJob failed for _isRunningBoardLaunched %{public}@", buf, 0xCu);
  }
  v11 = 1;
LABEL_16:

  return v11;
}

- (id)synchronizeJobs
{
  RBLaunchdInterfacing *launchdInterface;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  RBLaunchdInterfacing *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v27;
  NSObject *v28;
  id v29;
  os_unfair_lock_t lock;
  uint64_t v31;
  void *v32;
  NSObject *obj;
  uint64_t v34;
  char v36;
  char v37[15];
  char v38;
  char v39[15];
  char v40;
  char v41[7];
  id v42;
  _QWORD v43[6];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  uint8_t v53[4];
  uint64_t v54;
  uint8_t v55[4];
  uint64_t v56;
  uint8_t buf[4];
  id v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  launchdInterface = self->_launchdInterface;
  v52 = 0;
  v27 = (void *)-[RBLaunchdInterfacing copyJobsManagedBy:error:](launchdInterface, "copyJobsManagedBy:error:", CFSTR("com.apple.runningboard"), &v52);
  v3 = v52;
  if (v27)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v27;
    v4 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    if (v4)
    {
      lock = &self->_lock;
      v34 = *(_QWORD *)v49;
      do
      {
        v5 = 0;
        v6 = v3;
        do
        {
          if (*(_QWORD *)v49 != v34)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v5);
          v44 = 0;
          v45 = &v44;
          v46 = 0x2020000000;
          v47 = 0;
          if (_synchronizeJobsQueue_onceToken != -1)
            dispatch_once(&_synchronizeJobsQueue_onceToken, &__block_literal_global_6);
          v8 = (id)_synchronizeJobsQueue_queue;
          v43[0] = MEMORY[0x24BDAC760];
          v43[1] = 3221225472;
          v43[2] = __38__RBLaunchdJobManager_synchronizeJobs__block_invoke;
          v43[3] = &unk_24DD466F0;
          v43[4] = v7;
          v43[5] = &v44;
          objc_msgSend(v7, "monitorOnQueue:withHandler:", v8, v43);

          objc_msgSend(v7, "cancelMonitor");
          v9 = self->_launchdInterface;
          v42 = 0;
          -[RBLaunchdInterfacing propertiesForJob:error:](v9, "propertiesForJob:error:", v7, &v42);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = v42;

          if (v10)
          {
            objc_msgSend(v10, "additionalProperties");
            v11 = objc_claimAutoreleasedReturnValue();
            v12 = v11;
            if (v11 && MEMORY[0x22074C57C](v11) == MEMORY[0x24BDACFA0])
            {
              xpc_dictionary_get_value(v12, "RunningBoard");
              v14 = objc_claimAutoreleasedReturnValue();
              v13 = v14;
              if (v14 && MEMORY[0x22074C57C](v14) == MEMORY[0x24BDACFA0])
              {
                xpc_dictionary_get_value(v13, "RunningBoardLaunchedIdentity");
                v15 = objc_claimAutoreleasedReturnValue();
                if (v15)
                {
                  v16 = objc_alloc(MEMORY[0x24BE80C90]);
                  v17 = *((unsigned int *)v45 + 6);
                  if (!(_DWORD)v17)
                    v17 = getpid();
                  v31 = objc_msgSend(v16, "initWithPid:", v17);
                  v18 = (void *)MEMORY[0x24BE80C98];
                  objc_msgSend(v10, "instance");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "decodeFromJob:uuid:", v15, v19);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();

                  v20 = v31;
                  if (v32)
                  {
                    objc_msgSend(MEMORY[0x24BE80CB0], "instanceWithIdentifier:identity:", v31);
                    v21 = objc_claimAutoreleasedReturnValue();
                    if (*((_DWORD *)v45 + 6))
                    {
                      objc_msgSend(v29, "addObject:", v21);
                      os_unfair_lock_lock(lock);
                      -[NSMutableDictionary setObject:forKey:](self->_lock_jobsByIdentifier, "setObject:forKey:", v7, v31);
                      os_unfair_lock_unlock(lock);
                    }
                    else
                    {
                      rbs_general_log();
                      v28 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                      {
                        objc_msgSend(v7, "handle");
                        v23 = (void *)objc_claimAutoreleasedReturnValue();
                        -[RBLaunchdJobManager synchronizeJobs].cold.6(v23, v53, &v54, v28);
                      }

                      -[RBLaunchdJobManager _removeJobWithInstance:orJob:error:](self, "_removeJobWithInstance:orJob:error:", v21, v7, 0);
                    }
                  }
                  else
                  {
                    rbs_general_log();
                    v21 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                    {
                      objc_msgSend(v7, "handle");
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      -[RBLaunchdJobManager synchronizeJobs].cold.5(v22, v55, &v56, v21);
                    }
                  }

                }
                else
                {
                  rbs_general_log();
                  v20 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
                    -[RBLaunchdJobManager synchronizeJobs].cold.4(&v36, v37);
                }

              }
              else
              {
                rbs_general_log();
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
                  -[RBLaunchdJobManager synchronizeJobs].cold.3(&v38, v39);
              }

            }
            else
            {
              rbs_general_log();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
                -[RBLaunchdJobManager synchronizeJobs].cold.2(&v40, v41);
            }

          }
          else
          {
            rbs_general_log();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543362;
              v58 = v3;
              _os_log_fault_impl(&dword_21A8B4000, v12, OS_LOG_TYPE_FAULT, "propertiesForPid failed for job %{public}@", buf, 0xCu);
            }
          }

          _Block_object_dispose(&v44, 8);
          ++v5;
          v6 = v3;
        }
        while (v4 != v5);
        v4 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
      }
      while (v4);
    }
    v24 = obj;
  }
  else
  {
    rbs_general_log();
    v25 = objc_claimAutoreleasedReturnValue();
    v24 = v25;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      -[RBLaunchdJobManager synchronizeJobs].cold.1();
      v24 = v25;
    }
  }

  return v29;
}

void __38__RBLaunchdJobManager_synchronizeJobs__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;

  if (a2)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "pid");
  }
  else
  {
    rbs_general_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __38__RBLaunchdJobManager_synchronizeJobs__block_invoke_cold_1(a1);

  }
}

uint64_t __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_120(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "monitorOnQueue:withHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (unint64_t)test_trackedJobCount
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  unint64_t v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMutableDictionary count](self->_lock_monitoredJobsByIdentifier, "count");
  v5 = -[NSMutableDictionary count](self->_lock_jobsByIdentifier, "count") + v4;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logQueue, 0);
  objc_storeStrong((id *)&self->_lock_reslideIdentities, 0);
  objc_storeStrong((id *)&self->_bundlePropertiesManager, 0);
  objc_storeStrong((id *)&self->_containerManager, 0);
  objc_storeStrong((id *)&self->_personaManager, 0);
  objc_storeStrong((id *)&self->_launchdInterface, 0);
  objc_storeStrong((id *)&self->_lock_monitoredJobsByIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_jobsByIdentifier, 0);
}

+ (void)lastExitStatusForLabel:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 2048;
  v4 = v0;
  _os_log_error_impl(&dword_21A8B4000, v1, OS_LOG_TYPE_ERROR, "Unexpected exit reason from launchd %{public}@: %llu", v2, 0x16u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_addSharedPropertiesToData:(void *)a1 forIdentity:(NSObject *)a2 context:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_21A8B4000, a2, v4, "During job creation, executable path NULL for %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

- (void)_addAppPropertiesToData:forIdentity:context:actualIdentity:error:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_13(&dword_21A8B4000, v1, (uint64_t)v1, "'%{public}@' container path lookup failed: %{public}@", v2);
  OUTLINED_FUNCTION_1_1();
}

- (void)_addAppPropertiesToData:(int)a1 forIdentity:(NSObject *)a2 context:actualIdentity:error:.cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_FAULT, "Unrecognized RBSLaunchSpawnType %d", (uint8_t *)v2, 8u);
}

- (void)_createLaunchdJobWithIdentity:context:actualIdentity:error:.cold.1()
{
  __assert_rtn("-[RBLaunchdJobManager _createLaunchdJobWithIdentity:context:actualIdentity:error:]", "RBLaunchdJobManager.m", 813, "context");
}

- (void)_createLaunchdJobWithIdentity:context:actualIdentity:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Multiple personas available for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)createAndLaunchWithIdentity:context:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Process start failed to launch/find job with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)createAndLaunchWithIdentity:context:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Job remove after failed start failed with %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)createAndLaunchWithIdentity:context:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Process start failed with %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)createAndLaunchWithIdentity:(os_log_t)log context:error:.cold.4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21A8B4000, log, OS_LOG_TYPE_ERROR, "Process start failed to return either error or jobInfo", v1, 2u);
}

- (void)createAndLaunchWithIdentity:(void *)a1 context:error:.cold.5(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(a1, "pid");
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9_0();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x18u);
  OUTLINED_FUNCTION_8();
}

- (void)createAndLaunchWithIdentity:(void *)a1 context:error:.cold.6(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(a1, "pid");
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9_0();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0xEu);
  OUTLINED_FUNCTION_8();
}

- (void)createAndLaunchWithIdentity:context:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_6(&dword_21A8B4000, v0, v1, "Failed to fetch properties for job for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)createAndLaunchWithIdentity:context:error:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_6(&dword_21A8B4000, v0, v1, "Attempted to launch daemon found an angel job: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)createAndLaunchWithIdentity:context:error:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_6(&dword_21A8B4000, v0, v1, "Attempted to launch angel found a non-angel job: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_removeJobWithInstance:orJob:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_6(&dword_21A8B4000, v0, v1, "Job removal failed with %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_removeJobWithInstance:orJob:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_6(&dword_21A8B4000, v0, v1, "About to attempt job removal for job not submitted by RunningBoard: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)synchronizeJobs
{
  *(_DWORD *)a2 = 138543362;
  *a3 = a1;
  OUTLINED_FUNCTION_0_4(&dword_21A8B4000, a4, (uint64_t)a3, "Skipping recovery for already exited process %{public}@", a2);

}

void __38__RBLaunchdJobManager_synchronizeJobs__block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_msgSend(*(id *)(a1 + 32), "handle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_0();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x12u);

  OUTLINED_FUNCTION_8();
}

- (void)invokeOnProcessDeath:(void *)a1 handler:(NSObject *)a2 onQueue:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_21A8B4000, a2, v4, "%{public}@ had monitoring configured twice", v5);

  OUTLINED_FUNCTION_1();
}

void __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_21A8B4000, a2, a3, "OSLaunchdJob monitor called with nil info for %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

void __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  v6 = 138543618;
  v7 = v4;
  v8 = 2048;
  v9 = objc_msgSend(a2, "state");
  OUTLINED_FUNCTION_13(&dword_21A8B4000, a3, v5, "%{public}@ reported to RB in an invalid state %ld", (uint8_t *)&v6);
  OUTLINED_FUNCTION_1();
}

void __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_21A8B4000, a2, a3, "%{public}@ termination reported but no exit status is present", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

void __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_4(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v5 = 138543618;
  v6 = v4;
  v7 = 1024;
  v8 = objc_msgSend(a2, "pid");
  _os_log_fault_impl(&dword_21A8B4000, a3, OS_LOG_TYPE_FAULT, "%{public}@ reported with incorrect pid %d", (uint8_t *)&v5, 0x12u);
  OUTLINED_FUNCTION_1();
}

@end
