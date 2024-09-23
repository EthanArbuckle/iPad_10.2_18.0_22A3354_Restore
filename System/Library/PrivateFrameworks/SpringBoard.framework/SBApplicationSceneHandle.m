@implementation SBApplicationSceneHandle

- (id)displayItemRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  -[SBApplicationSceneHandle application](self, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationSceneHandle sceneIdentifier](self, "sceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isWebApplication"))
  {
    +[SBDisplayItem webAppDisplayItemWithWebAppIdentifier:](SBDisplayItem, "webAppDisplayItemWithWebAppIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.PrintKit.Print-Center"));

    objc_msgSend(v3, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      +[SBDisplayItem switcherServiceDisplayItemWithServiceIdentifier:](SBDisplayItem, "switcherServiceDisplayItemWithServiceIdentifier:", v8);
    else
      +[SBDisplayItem displayItemWithType:bundleIdentifier:uniqueIdentifier:](SBDisplayItem, "displayItemWithType:bundleIdentifier:uniqueIdentifier:", 0, v8, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (SBApplication)application
{
  return self->_application;
}

- (void)setLayoutRole:(int64_t)a3
{
  self->_layoutRole = a3;
}

+ (id)lookupOrCreatePersistenceIDFromApplication:(id)a3 sceneID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "_dataStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneStoreForIdentifier:creatingIfNecessary:", v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safeObjectForKey:ofType:", CFSTR("persistenceIdentifier"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v5, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sceneID:%@-"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "length");
    if (v13 >= objc_msgSend(v12, "length") && objc_msgSend(v11, "hasPrefix:", v12))
    {
      objc_msgSend(v11, "substringFromIndex:", objc_msgSend(v12, "length"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v11;
    }
    v9 = v14;

    if (objc_msgSend(v9, "isEqualToString:", CFSTR("default")))
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v16;
    }
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("persistenceIdentifier"));
  }

  return v9;
}

- (id)_createProcessExecutionContextFromContext:(id)a3 entity:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  double v24;
  NSObject *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id obj;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  id v73;
  __int16 v74;
  uint64_t v75;
  _QWORD v76[4];
  _QWORD v77[6];

  v77[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationSceneHandle.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entity != nil"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForProcessSetting:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v9;
  objc_msgSend(v9, "addEntriesFromDictionary:", v10);

  objc_msgSend(v7, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v11;
  if (objc_msgSend(v11, "isMainWorkspaceTransitionRequest"))
    v12 = objc_msgSend(v11, "source");
  else
    v12 = 0;
  objc_msgSend(v8, "objectForActivationSetting:", 19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue");

  if (!v14)
  {
    SBLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SBApplicationSceneHandle _createProcessExecutionContextFromContext:entity:].cold.2();

    mach_continuous_time();
  }
  -[SBApplicationSceneHandle application](self, "application");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  SBMainWorkspaceTransitionSourceDescription(v12);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v17, "cStringUsingEncoding:", 4);

  objc_msgSend(v16, "info");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bundleVersion");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v19, "cStringUsingEncoding:", 4);

  objc_msgSend(v16, "info");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "shortVersionString");
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v21, "cStringUsingEncoding:", 4);

  obj = 0;
  objc_msgSend(v16, "bundleIdentifier");
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v22, "cStringUsingEncoding:", 4);

  objc_msgSend(v7, "isBackground");
  alm_app_will_launch_with_details_and_metrics_payload();
  objc_storeStrong((id *)&self->_launchMetricsPayload, 0);
  objc_msgSend(v8, "objectForActivationSetting:", 18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  self->_userLaunchEventTime = v24;

  if (BSFloatIsZero())
  {
    SBLogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SBApplicationSceneHandle _createProcessExecutionContextFromContext:entity:].cold.1();

    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->_userLaunchEventTime = v26;
  }
  if (__PPTTestInProgress)
  {
    v77[0] = MEMORY[0x1E0C9AAB0];
    v76[0] = CFSTR("__PPT_ForTesting");
    v76[1] = CFSTR("__PPT_SignpostID");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_userLaunchSignpostID);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v27;
    v76[2] = CFSTR("__PPT_LaunchTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_userLaunchEventTime);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v77[2] = v28;
    v76[3] = CFSTR("__PPT_BackgroundLaunch");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isBackground"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v77[3] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addEntriesFromDictionary:", v30);

    if (__PPTUserSpecifiedEnvironment)
    {
      objc_msgSend(v67, "addEntriesFromDictionary:");
      v31 = (void *)__PPTUserSpecifiedEnvironment;
      __PPTUserSpecifiedEnvironment = 0;

    }
  }
  v64 = v7;
  objc_msgSend(v8, "objectForProcessSetting:", 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForProcessSetting:", 3);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForProcessSetting:", 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v8, "BOOLForProcessSetting:", 5);
  v34 = objc_msgSend(v8, "BOOLForProcessSetting:", 6);
  v62 = objc_msgSend(v8, "BOOLForProcessSetting:", 7);
  objc_msgSend(v8, "objectForActivationSetting:", 33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_opt_class();
  v37 = v35;
  if (v36)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v38 = v37;
    else
      v38 = 0;
  }
  else
  {
    v38 = 0;
  }
  v39 = v38;

  if (v39)
  {
    v40 = objc_alloc(MEMORY[0x1E0CA5850]);
    objc_msgSend(v16, "bundleIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0;
    v42 = (void *)objc_msgSend(v40, "initWithBundleIdentifier:allowPlaceholder:personaUniqueString:error:", v41, 0, v39, &v68);
    v43 = v68;

    if (v42)
    {
      objc_msgSend(MEMORY[0x1E0D87D80], "identityForLSApplicationIdentity:", v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
        goto LABEL_30;
    }
    else
    {
      SBLogCommon();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v16, "bundleIdentifier");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "descriptionWithMultilinePrefix:", 0);
        v58 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v71 = v61;
        v72 = 2114;
        v73 = v39;
        v74 = 2114;
        v75 = v58;
        v59 = (void *)v58;
        _os_log_error_impl(&dword_1D0540000, v45, OS_LOG_TYPE_ERROR, "could not create LSApplicationIdentity for bundleID %{public}@ and persona %{public}@: %{public}@", buf, 0x20u);

      }
    }
  }
  objc_msgSend(v16, "info");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "processIdentity");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_30:
  v47 = objc_alloc_init(MEMORY[0x1E0D22918]);
  objc_msgSend(v47, "setIdentity:", v44);
  objc_msgSend(v47, "setEnvironment:", v67);
  objc_msgSend(v47, "setWaitForDebugger:", v33);
  objc_msgSend(v47, "setDisableASLR:", v34);
  objc_msgSend(v47, "setCheckForLeaks:", __CheckForLeaks);
  objc_msgSend(v47, "setArguments:", v66);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v65);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setStandardOutputURL:", v48);

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v32);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setStandardErrorURL:", v49);

  objc_msgSend(v8, "objectForActivationSetting:", 30);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (v50)
  {
    v52 = objc_msgSend(v50, "integerValue");
  }
  else
  {
    if (objc_msgSend(v8, "BOOLForActivationSetting:", 3))
    {
      objc_msgSend(v16, "info");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "hasViewServicesEntitlement");

      if (v54)
        v52 = 3;
      else
        v52 = 2;
    }
    else
    {
      v52 = 4;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v52);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forActivationSetting:", v55, 30);

  }
  objc_msgSend(v47, "setLaunchIntent:", v52);
  if (v62)
    +[SBSceneWatchdogProvider disabledSceneWatchdogProvider](SBSceneWatchdogProvider, "disabledSceneWatchdogProvider");
  else
    +[SBSceneWatchdogProvider defaultSceneWatchdogProvider](SBSceneWatchdogProvider, "defaultSceneWatchdogProvider");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setWatchdogProvider:", v56);

  -[SBApplicationSceneHandle _modifyProcessExecutionContext:fromRequestContext:entity:](self, "_modifyProcessExecutionContext:fromRequestContext:entity:", v47, v64, v8);
  return v47;
}

- (id)_createApplicationSceneTransitionContextFromContext:(id)a3 entity:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  Class v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  int v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  unint64_t *p_userLaunchSignpostID;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  int v49;
  void *v50;
  int v51;
  int v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  int v64;
  unint64_t *v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  _BOOL4 v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  unint64_t *v79;
  void *v80;
  int v81;
  void *v82;
  NSObject *v83;
  OS_xpc_object *launchMetricsPayload;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t i;
  void *v96;
  id v97;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  int v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint8_t v117[128];
  uint8_t buf[4];
  void *v119;
  __int16 v120;
  int v121;
  __int16 v122;
  _BOOL4 v123;
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationSceneHandle.m"), 287, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestContext"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationSceneHandle.m"), 288, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entity"));

LABEL_3:
  -[SBApplicationSceneHandle application](self, "application");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationSceneHandle _definition](self, "_definition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "specification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init((Class)objc_msgSend(v12, "transitionContextClass"));

  if (!v13)
    v13 = objc_alloc_init(MEMORY[0x1E0CEA350]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForActivationSetting:", 14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_class();
  v17 = v15;
  if (v16)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
  }
  else
  {
    v18 = 0;
  }
  v19 = v18;

  if (objc_msgSend(v19, "length")
    && objc_msgSend(v10, "shouldReceiveSourceApplicationContextFromOriginatingApplication:", v19))
  {
    objc_msgSend(v14, "setObject:forKey:", v19, *MEMORY[0x1E0CEB2B0]);
  }
  v107 = v19;
  objc_msgSend(v9, "objectForActivationSetting:", 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_class();
  v22 = v20;
  if (v21)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
  }
  else
  {
    v23 = 0;
  }
  v24 = v23;

  v109 = v24;
  objc_msgSend(v24, "relativeString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "length"))
    objc_msgSend(v14, "setObject:forKey:", v25, *MEMORY[0x1E0CEB2B8]);
  v106 = v25;
  objc_msgSend(v9, "objectForActivationSetting:", 34);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = NSClassFromString(CFSTR("UISPasteSharingToken"));
  v28 = v26;
  if (v27)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;
  }
  else
  {
    v29 = 0;
  }
  v30 = v29;

  if (v30)
    objc_msgSend(v14, "setObject:forKey:", v30, CFSTR("__PasteSharingToken"));
  v105 = v30;
  objc_msgSend(v7, "request");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v31;
  if (objc_msgSend(v31, "isMainWorkspaceTransitionRequest"))
  {
    v32 = v31;
    v33 = objc_msgSend(v32, "source");

  }
  else
  {
    v33 = 0;
  }
  v111 = v14;
  v112 = v10;
  objc_msgSend(v9, "objectForActivationSetting:", 19);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "unsignedIntegerValue");

  if (!v35)
  {
    SBLogCommon();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[SBApplicationSceneHandle _createProcessExecutionContextFromContext:entity:].cold.2();

    mach_continuous_time();
  }
  v37 = objc_msgSend(v7, "isBackground");
  SBMainWorkspaceTransitionSourceDescription(v33);
  v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v38, "cStringUsingEncoding:", 4);

  objc_msgSend(v112, "info");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bundleVersion");
  v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v40, "cStringUsingEncoding:", 4);

  objc_msgSend(v112, "info");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "shortVersionString");
  v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v42, "cStringUsingEncoding:", 4);

  p_userLaunchSignpostID = &self->_userLaunchSignpostID;
  v108 = v37;
  if (self->_userLaunchSignpostID)
  {
    alm_app_will_activate_with_signpost_id();
    v45 = v111;
    v44 = v112;
  }
  else
  {
    -[SBApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "scheme");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("test"));

    if (v46)
      v49 = objc_msgSend(v46, "isActive") ^ 1;
    else
      v49 = 1;
    objc_msgSend(v46, "settings");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "isForeground");

    v52 = objc_msgSend(v9, "BOOLForActivationSetting:", 51);
    if (((v48 | v49) & 1) != 0 || !(v51 | v108) || v52)
      alm_app_will_activate_with_details();

    v45 = v111;
    v44 = v112;
    p_userLaunchSignpostID = &self->_userLaunchSignpostID;
  }
  objc_msgSend(v9, "objectForActivationSetting:", 15);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_opt_class();
  v55 = v53;
  if (v54)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v56 = v55;
    else
      v56 = 0;
  }
  else
  {
    v56 = 0;
  }
  v57 = v56;

  if (objc_msgSend(v57, "count"))
    objc_msgSend(v45, "setObject:forKey:", v57, *MEMORY[0x1E0CEB2A0]);
  v104 = v57;
  objc_msgSend(v9, "objectForActivationSetting:", 16);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_opt_class();
  v60 = v58;
  if (v59)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v61 = v60;
    else
      v61 = 0;
  }
  else
  {
    v61 = 0;
  }
  v62 = v61;

  if (objc_msgSend(v62, "count"))
    objc_msgSend(v45, "addEntriesFromDictionary:", v62);
  v103 = v62;
  if (objc_msgSend(v45, "count"))
    objc_msgSend(v13, "setPayload:", v45);
  objc_msgSend(v9, "objectForActivationSetting:", 32);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setClickAttribution:", v63);

  objc_msgSend(v9, "translateActivationSettingsToActions");
  if (+[SBCaptureHardwareButton deviceSupportsCaptureButton]())
    v64 = +[SBCaptureHardwareButton isCaptureFeatureEnabled]();
  else
    v64 = 0;
  if ((LCSFeatureEnabled() & 1) != 0 || v64)
  {
    v65 = p_userLaunchSignpostID;
    objc_msgSend(v9, "activationSettings");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "BOOLForActivationSetting:", 36);

    objc_msgSend(v9, "application");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "bundleIdentifier");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBCaptureApplicationCenter sharedInstance](SBCaptureApplicationCenter, "sharedInstance");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "captureApplicationForBundleIdentifier:", v69);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    SBLogCommon();
    v72 = objc_claimAutoreleasedReturnValue();
    v73 = os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT);
    if (v67 && v71)
    {
      if (v73)
      {
        *(_DWORD *)buf = 138412290;
        v119 = v69;
        _os_log_impl(&dword_1D0540000, v72, OS_LOG_TYPE_DEFAULT, "Adding launch actions for the capture application (%@)", buf, 0xCu);
      }

      objc_msgSend(v71, "launchActions");
      v72 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addActions:", v72);
    }
    else if (v73)
    {
      *(_DWORD *)buf = 138412802;
      v119 = v69;
      v120 = 1024;
      v121 = v67;
      v122 = 1024;
      v123 = v71 != 0;
      _os_log_impl(&dword_1D0540000, v72, OS_LOG_TYPE_DEFAULT, "No capture application found for the %@, launchCameraCapture: %{BOOL}u, isCaptureApplication: %{BOOL}u", buf, 0x18u);
    }
    p_userLaunchSignpostID = v65;

    v44 = v112;
  }
  objc_msgSend(v9, "actions");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v74, "count"))
    objc_msgSend(v13, "setActions:", v74);
  objc_msgSend(v9, "removeAllActions");
  objc_msgSend(v7, "animationSettings");
  v75 = objc_claimAutoreleasedReturnValue();
  if (v75)
    objc_msgSend(v13, "setAnimationSettings:", v75);
  v101 = (void *)v75;
  v102 = v74;
  if ((v108 & 1) == 0)
  {
    objc_msgSend(v7, "animationFence");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "fencesAnimations") & 1) != 0 || v76)
    {
      objc_msgSend(v13, "animationFence");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (v77)
      {

      }
      else
      {
        -[SBApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "clientProcess");
        v79 = p_userLaunchSignpostID;
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v80, "isForeground");

        p_userLaunchSignpostID = v79;
        if (v81)
        {
          if (v76)
          {
            objc_msgSend(v13, "setAnimationFence:", v76);
          }
          else
          {
            objc_msgSend((id)*MEMORY[0x1E0CEB258], "_systemAnimationFenceCreatingIfNecessary:", 1);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setAnimationFence:", v82);

          }
        }
      }
    }

  }
  if ((objc_msgSend(v9, "BOOLForActivationSetting:", 48) & 1) != 0
    || objc_msgSend(v9, "BOOLForActivationSetting:", 61))
  {
    objc_msgSend(v13, "setShouldTakeKeyboardFocus:", 1);
  }
  if (__PPTTestInProgress)
  {
    objc_msgSend(v13, "setForTesting:", 1);
    objc_msgSend(v13, "setUserLaunchEventTime:", self->_userLaunchEventTime);
    __PPTTestInProgress = 0;
    if (BSFloatIsZero())
    {
      SBLogCommon();
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_FAULT))
        -[SBApplicationSceneHandle _createApplicationSceneTransitionContextFromContext:entity:].cold.1();

    }
  }
  if (*p_userLaunchSignpostID)
  {
    objc_msgSend(v13, "setUserLaunchEventTime:", self->_userLaunchEventTime);
    objc_msgSend(v13, "setSignpostID:", *p_userLaunchSignpostID);
    *p_userLaunchSignpostID = 0;
    objc_msgSend(v13, "setLaunchMetricsPayload:", self->_launchMetricsPayload);
    launchMetricsPayload = self->_launchMetricsPayload;
    self->_launchMetricsPayload = 0;

  }
  objc_msgSend(v44, "info");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v85, "isAppleApplication");

  if (v86)
  {
    objc_msgSend(v110, "originatingProcess");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOriginatingProcess:", v87);

  }
  objc_msgSend(v7, "watchdogScaleFactor");
  objc_msgSend(v13, "setWatchdogScaleFactor:");
  if (objc_msgSend(v7, "alwaysRunsWatchdog"))
  {
    objc_msgSend(v13, "watchdogTransitionContext");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setWatchdogBehavior:", 1);

  }
  objc_msgSend(v9, "objectForActivationSetting:", 30);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "integerValue");

  if (v90 == 1)
    objc_msgSend(v13, "setAllowCPUThrottling:", 1);
  -[SBApplicationSceneHandle _modifyApplicationTransitionContext:fromRequestContext:entity:](self, "_modifyApplicationTransitionContext:fromRequestContext:entity:", v13, v7, v9);
  -[NSHashTable allObjects](self->_sceneUpdateContributers, "allObjects");
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v91 = (id)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v113, v117, 16);
  if (v92)
  {
    v93 = v92;
    v94 = *(_QWORD *)v114;
    do
    {
      for (i = 0; i != v93; ++i)
      {
        if (*(_QWORD *)v114 != v94)
          objc_enumerationMutation(v91);
        v96 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v96, "applicationSceneHandle:appendToTransitionContext:fromRequestContext:entity:", self, v13, v7, v9);
      }
      v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v113, v117, 16);
    }
    while (v93);
  }

  v97 = v13;
  return v97;
}

- (void)setSceneUpdateInProgress:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (self->_sceneUpdateInProgress != a3)
  {
    self->_sceneUpdateInProgress = a3;
    v7 = CFSTR("SceneIdentifierKey");
    -[SBApplicationSceneHandle sceneIdentifier](self, "sceneIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("SBApplicationSceneHandleProgressNotification"), self, v5);

  }
}

- (id)_initWithApplication:(id)a3 sceneDefinition:(id)a4 displayIdentity:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  objc_super v14;

  objc_storeStrong((id *)&self->_application, a3);
  v9 = a3;
  v10 = a5;
  v11 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBApplicationSceneHandle;
  v12 = -[SBApplicationSceneHandle _initWithDefinition:displayIdentity:](&v14, sel__initWithDefinition_displayIdentity_, v11, v10);

  return v12;
}

- (id)_createParametersFromTransitionContext:(id)a3 entity:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = (void *)MEMORY[0x1E0D23148];
  v7 = a4;
  v8 = a3;
  -[SBApplicationSceneHandle _definition](self, "_definition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "specification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parametersForSpecification:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBApplicationSceneHandle _createApplicationSceneSettingsFromContext:entity:](self, "_createApplicationSceneSettingsFromContext:entity:", v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSettings:", v12);

  objc_msgSend(v11, "settings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationSceneHandle _createApplicationSceneClientSettingsFromContext:entity:initialSceneSettings:](self, "_createApplicationSceneClientSettingsFromContext:entity:initialSceneSettings:", v8, v7, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setClientSettings:", v14);
  return v11;
}

- (id)_createApplicationSceneClientSettingsFromContext:(id)a3 entity:(id)a4 initialSceneSettings:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationSceneHandle.m"), 614, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestContext"));

    if (v12)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationSceneHandle.m"), 615, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settings"));

    goto LABEL_3;
  }
  if (!v11)
    goto LABEL_5;
LABEL_3:
  -[SBApplicationSceneHandle _definition](self, "_definition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "specification");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v14, "clientSettingsClass"), "settings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  -[SBApplicationSceneHandle _modifyApplicationSceneClientSettings:fromRequestContext:entity:initialSceneSettings:](self, "_modifyApplicationSceneClientSettings:fromRequestContext:entity:initialSceneSettings:", v16, v9, v10, v12);
  return v16;
}

- (id)_createApplicationSceneSettingsFromContext:(id)a3 entity:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  int v20;
  double *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  void *v62;
  double v63;
  double v64;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  SEL v73;
  void *v74;
  void *v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t v81[128];
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  void *v91;
  uint64_t v92;
  CGRect v93;

  v92 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationSceneHandle.m"), 537, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestContext"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationSceneHandle.m"), 538, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entity"));

LABEL_3:
  objc_msgSend(v7, "request");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "displayConfiguration");
  v10 = objc_claimAutoreleasedReturnValue();
  -[SBApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
  }
  else
  {
    -[SBApplicationSceneHandle _definition](self, "_definition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "specification");
    v15 = v10;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_msgSend(v16, "settingsClass"), "settings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v17, "mutableCopy");

    v10 = v15;
  }

  v76 = (void *)v10;
  objc_msgSend(v14, "setDisplayConfiguration:", v10);
  objc_msgSend(v14, "setPersistenceIdentifier:", self->_persistenceIdentifier);
  if (_os_feature_enabled_impl())
    v18 = 2;
  else
    v18 = 0;
  objc_msgSend(v14, "setInterruptionPolicy:", v18);
  v19 = objc_msgSend(v7, "isBackground");
  v20 = v19;
  v21 = (double *)MEMORY[0x1E0C9D820];
  v73 = a2;
  v74 = v12;
  if (!v12 || (v19 & 1) == 0)
  {
    -[SBApplicationSceneHandle application](self, "application");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v20 ^ 1u;
    objc_msgSend(v14, "setForeground:", v23);
    objc_msgSend(v14, "setLevel:", 1.0);
    if ((v23 & 1) != 0
      || (objc_msgSend(v22, "info"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = objc_msgSend(v24, "hasHiddenTag"),
          v24,
          !v25))
    {
      objc_msgSend(v7, "frameForApplicationSceneEntity:", v9);
      v34 = v33;
      v36 = v35;
      v38 = v37;
      v39 = v32;
      if (v37 == *v21 && v32 == v21[1])
      {
        SBLogAppSwitcher();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          SBMainWorkspaceTransitionSourceDescription(objc_msgSend(v75, "source"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "identity");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "layoutState");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v83 = v74;
          v84 = 2114;
          v85 = v67;
          v86 = 2114;
          v87 = v68;
          v88 = 2114;
          v89 = v9;
          v90 = 2114;
          v91 = v69;
          _os_log_error_impl(&dword_1D0540000, v40, OS_LOG_TYPE_ERROR, "-_cASSFC:E: produced {0,0} with scene %{public}@, source %{public}@, display configuration %{public}@, entity %{public}@, request context %{public}@", buf, 0x34u);

        }
        v26 = v22;

        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v93.origin.x = v34;
        v93.origin.y = v36;
        v93.size.width = v38;
        v93.size.height = v39;
        NSStringFromCGRect(v93);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", v73, self, CFSTR("SBApplicationSceneHandle.m"), 576, CFSTR("frame (%@) isn't valid"), v42);

      }
      else
      {
        v26 = v22;
      }
      v31 = v14;
      v27 = v34;
      v28 = v36;
      v29 = v38;
      v30 = v39;
    }
    else
    {
      v26 = v22;
      objc_msgSend(v76, "bounds");
      v31 = v14;
    }
    objc_msgSend(v31, "setFrame:", v27, v28, v29, v30);
    objc_msgSend(v7, "layoutState");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationSceneHandle sceneIdentifier](self, "sceneIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "elementWithIdentifier:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = objc_msgSend(v14, "interfaceOrientation");
    if (v46 <= 1)
      v47 = 1;
    else
      v47 = v46;
    v48 = objc_msgSend(v7, "interfaceOrientation");
    v49 = v48;
    if (v45)
    {
      objc_msgSend(v7, "layoutState");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "interfaceOrientationForLayoutElement:unknownAllowed:", v45, 1);

      if (v49)
        v52 = v49;
      else
        v52 = v47;
      v53 = v26;
      if (!v51)
        v51 = v52;
    }
    else
    {
      if (v48)
        v51 = v48;
      else
        v51 = v47;
      v53 = v26;
    }
    objc_msgSend(v14, "setInterfaceOrientation:", v51);
    if (objc_msgSend(v53, "isMedusaCapable"))
      v54 = 2;
    else
      v54 = 1;
    objc_msgSend(v14, "setInterfaceOrientationMode:", v54);
    objc_msgSend(v14, "setInLiveResize:", objc_msgSend(v7, "isInLiveResize"));
    objc_msgSend(v9, "objectForActivationSetting:", 60);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      objc_msgSend(v14, "ignoreOcclusionReasons");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "addObject:", v55);

    }
    -[SBApplicationSceneHandle _modifyApplicationSceneSettings:fromRequestContext:entity:](self, "_modifyApplicationSceneSettings:fromRequestContext:entity:", v14, v7, v9);

  }
  -[NSHashTable allObjects](self->_sceneUpdateContributers, "allObjects");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v59; ++i)
      {
        if (*(_QWORD *)v78 != v60)
          objc_enumerationMutation(v57);
        v62 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v62, "applicationSceneHandle:appendToSceneSettings:fromRequestContext:entity:", self, v14, v7, v9);
      }
      v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
    }
    while (v59);
  }
  objc_msgSend(v14, "frame");
  if (v64 == *MEMORY[0x1E0C9D820] && v63 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", v73, self, CFSTR("SBApplicationSceneHandle.m"), 606, CFSTR("Application scene settings frame should never be 0!"));

  }
  return v14;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  SBApplication *application;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBApplicationSceneHandle;
  -[SBApplicationSceneHandle _commonInit](&v8, sel__commonInit);
  -[SBApplicationSceneHandle _definition](self, "_definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  application = self->_application;
  -[SBApplicationSceneHandle displayIdentity](self, "displayIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationSceneHandle _commonInitWithApplication:sceneIdentifier:displayIdentity:](self, "_commonInitWithApplication:sceneIdentifier:displayIdentity:", application, v5, v7);

}

- (void)_commonInitWithApplication:(id)a3 sceneIdentifier:(id)a4 displayIdentity:(id)a5
{
  id v8;
  id v9;
  NSString *v10;
  NSString *persistenceIdentifier;
  id v12;

  v8 = a4;
  v9 = a3;
  self->_isSecure = objc_msgSend(a5, "expectsSecureRendering");
  objc_msgSend((id)objc_opt_class(), "lookupOrCreatePersistenceIDFromApplication:sceneID:", v9, v8);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();

  persistenceIdentifier = self->_persistenceIdentifier;
  self->_persistenceIdentifier = v10;

  self->_layoutRole = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__applicationsDidChange_, CFSTR("SBInstalledApplicationsDidChangeNotification"), 0);

}

- (id)_initWithScene:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationSceneHandle.m"), 100, CFSTR("This initializer is unavailable."));

  return 0;
}

- (id)_initWithDefinition:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationSceneHandle.m"), 105, CFSTR("This initializer is unavailable."));

  return 0;
}

- (id)_initWithApplication:(id)a3 scene:(id)a4 displayIdentity:(id)a5
{
  SBApplication *v9;
  id v10;
  id v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  char v15;
  SBApplication *application;
  SBApplication *v17;
  id v18;
  void *v20;
  void *v21;
  objc_super v22;

  v9 = (SBApplication *)a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationSceneHandle.m"), 110, CFSTR("Cannot create an application scene handle with settings that aren't a type of UIApplicationSceneSettings."));

  }
  objc_msgSend(v10, "clientSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v15 = objc_opt_isKindOfClass();

  if ((v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationSceneHandle.m"), 111, CFSTR("Cannot create an application scene handle with settings that aren't a type of UIApplicationSceneClientSettings."));

  }
  application = self->_application;
  self->_application = v9;
  v17 = v9;

  v22.receiver = self;
  v22.super_class = (Class)SBApplicationSceneHandle;
  v18 = -[SBApplicationSceneHandle _initWithScene:displayIdentity:](&v22, sel__initWithScene_displayIdentity_, v10, v11);

  return v18;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBInstalledApplicationsDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)SBApplicationSceneHandle;
  -[SBApplicationSceneHandle dealloc](&v4, sel_dealloc);
}

- (id)_persistenceIdentifier
{
  return self->_persistenceIdentifier;
}

- (void)_applicationsDidChange:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SBApplication *v13;
  SBApplication *application;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("SBInstalledApplicationsReplacedBundleIDs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
    objc_msgSend(v5, "unionSet:", v7);
  objc_msgSend(v16, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("SBInstalledApplicationsAddedBundleIDs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
    objc_msgSend(v5, "unionSet:", v9);
  if (objc_msgSend(v5, "count"))
  {
    -[SBApplicationSceneHandle application](self, "application");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "containsObject:", v11))
    {
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "applicationWithBundleIdentifier:", v11);
      v13 = (SBApplication *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationSceneHandle.m"), 529, CFSTR("Application cannot be nil if we were told it's been modified."));

      }
      application = self->_application;
      self->_application = v13;

    }
  }

}

- (id)newSceneViewWithReferenceSize:(CGSize)a3 contentOrientation:(int64_t)a4 containerOrientation:(int64_t)a5 hostRequester:(id)a6
{
  double height;
  double width;
  id v11;
  SBApplicationSceneView *v12;

  height = a3.height;
  width = a3.width;
  v11 = a6;
  v12 = -[SBApplicationSceneView initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:]([SBApplicationSceneView alloc], "initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:", self, a4, a5, v11, width, height);

  return v12;
}

- (id)newScenePlaceholderContentContextWithActivationSettings:(id)a3
{
  return 0;
}

- (id)newSceneViewController
{
  return -[SBApplicationSceneViewController initWithSceneHandle:]([SBApplicationSceneViewController alloc], "initWithSceneHandle:", self);
}

- (void)addSceneUpdateContributer:(id)a3
{
  id v4;
  NSHashTable *sceneUpdateContributers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  sceneUpdateContributers = self->_sceneUpdateContributers;
  v8 = v4;
  if (!sceneUpdateContributers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sceneUpdateContributers;
    self->_sceneUpdateContributers = v6;

    v4 = v8;
    sceneUpdateContributers = self->_sceneUpdateContributers;
  }
  -[NSHashTable addObject:](sceneUpdateContributers, "addObject:", v4);

}

- (void)removeSceneUpdateContributer:(id)a3
{
  NSHashTable *sceneUpdateContributers;

  -[NSHashTable removeObject:](self->_sceneUpdateContributers, "removeObject:", a3);
  if (!-[NSHashTable count](self->_sceneUpdateContributers, "count"))
  {
    sceneUpdateContributers = self->_sceneUpdateContributers;
    self->_sceneUpdateContributers = 0;

  }
}

- (NSString)persistenceIdentifier
{
  return self->_persistenceIdentifier;
}

- (BOOL)isSecure
{
  return self->_isSecure;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (BOOL)isSceneUpdateInProgress
{
  return self->_sceneUpdateInProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchMetricsPayload, 0);
  objc_storeStrong((id *)&self->_sceneUpdateContributers, 0);
  objc_storeStrong((id *)&self->_persistenceIdentifier, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

- (void)_createProcessExecutionContextFromContext:entity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, v0, v1, "No UserLaunchEventTime", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_createProcessExecutionContextFromContext:entity:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, v0, v1, "No ContinuousUserLaunchEventTime", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_createApplicationSceneTransitionContextFromContext:entity:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6();
  _os_log_fault_impl(&dword_1D0540000, v0, OS_LOG_TYPE_FAULT, "UserLaunchEventTime was not configured while testing", v1, 2u);
  OUTLINED_FUNCTION_4();
}

@end
