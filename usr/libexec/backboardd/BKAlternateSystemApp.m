@implementation BKAlternateSystemApp

- (BKAlternateSystemApp)initWithBundleId:(id)a3 options:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  BKAlternateSystemApp *v11;
  BKAlternateSystemApp *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BKAlternateSystemApp;
  v11 = -[BKAlternateSystemApp init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[BKAlternateSystemApp setBundleID:](v11, "setBundleID:", v8);
    -[BKAlternateSystemApp setOptions:](v12, "setOptions:", v9);
    -[BKAlternateSystemApp setQueue:](v12, "setQueue:", v10);
  }

  return v12;
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  BKAlternateSystemApp *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003E718;
  v5[3] = &unk_1000ECD80;
  v6 = a3;
  v7 = self;
  v4 = v6;
  objc_msgSend(v4, "appendProem:block:", self, v5);

}

- (BOOL)launchWithResultBlock:(id)a3 exitBlock:(id)a4
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id pendingExitBlock;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSString *bundleID;
  NSString *v19;
  BKAlternateSystemApp *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  BKAlternateSystemApp *v30;
  __CFString *v31;
  void *v32;
  BOOL v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  NSString *v37;
  NSString *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned __int8 v42;
  id v43;
  RBSProcessHandle *processHandle;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  RBSAssertion *v52;
  RBSAssertion *visibilityAssertion;
  RBSAssertion *v54;
  unsigned __int8 v55;
  id v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  NSObject *v64;
  uint64_t v65;
  NSObject *v66;
  BKAlternateSystemApp *v68;
  NSString *v69;
  BKAlternateSystemApp *v70;
  void *v71;
  NSString *v72;
  BKAlternateSystemApp *v73;
  uint64_t v74;
  objc_class *v75;
  NSString *v76;
  BKAlternateSystemApp *v77;
  id v78;
  id *location;
  id *locationa;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  _QWORD *v89;
  void *v90;
  id v91;
  void *v92;
  id v93;
  BKAlternateSystemApp *v94;
  void *v95;
  __CFString *v96;
  id v97;
  BKAlternateSystemApp *val;
  BSMutableMachServiceAliases *v99;
  id obj;
  id v101;
  _QWORD v102[4];
  id v103;
  id from;
  id v105;
  id v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  id v115;
  _QWORD v116[5];
  id v117;
  _QWORD v118[5];
  _BYTE v119[128];
  uint8_t v120[128];
  uint8_t buf[4];
  BKAlternateSystemApp *v122;
  __int16 v123;
  BKAlternateSystemApp *v124;
  __int16 v125;
  BKAlternateSystemApp *v126;
  __int16 v127;
  const __CFString *v128;
  __int16 v129;
  int v130;
  __int16 v131;
  void *v132;

  v7 = a3;
  v93 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  val = self;
  location = (id *)&self->_processHandle;
  if (self->_processHandle)
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_processHandle == nil")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v72 = NSStringFromSelector(a2);
      v73 = (BKAlternateSystemApp *)objc_claimAutoreleasedReturnValue(v72);
      v75 = (objc_class *)objc_opt_class(self, v74);
      v76 = NSStringFromClass(v75);
      v77 = (BKAlternateSystemApp *)objc_claimAutoreleasedReturnValue(v76);
      *(_DWORD *)buf = 138544642;
      v122 = v73;
      v123 = 2114;
      v124 = v77;
      v125 = 2048;
      v126 = self;
      v127 = 2114;
      v128 = CFSTR("BKAlternateSystemApp.m");
      v129 = 1024;
      v130 = 89;
      v131 = 2114;
      v132 = v71;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v71), "UTF8String"));
    __break(0);
    JUMPOUT(0x10003E1B0);
  }
  v8 = BKLogAlternateSystemApp();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v122 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "launchWithResultBlock: %{public}@", buf, 0xCu);
  }

  v116[0] = _NSConcreteStackBlock;
  v116[1] = 3221225472;
  v116[2] = sub_10003E58C;
  v116[3] = &unk_1000EBEF8;
  v116[4] = self;
  v88 = v7;
  v117 = v88;
  v89 = objc_retainBlock(v116);
  v10 = objc_msgSend(v93, "copy");
  pendingExitBlock = self->_pendingExitBlock;
  self->_pendingExitBlock = v10;

  v13 = objc_msgSend((id)objc_opt_class(self, v12), "_bundleInfoOverrides");
  v92 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectForKey:", self->_bundleID));
  v95 = v14;
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("OverrideURL")));
    v94 = (BKAlternateSystemApp *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v15));

    v96 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKey:", CFSTR("OverrideAppType")));
    v16 = BKLogAlternateSystemApp();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      bundleID = self->_bundleID;
      *(_DWORD *)buf = 134218754;
      v122 = self;
      v123 = 2114;
      v124 = (BKAlternateSystemApp *)bundleID;
      v125 = 2114;
      v126 = v94;
      v127 = 2114;
      v128 = v96;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "launchWithResultBlock %p: Using built-in information for bundle ID %{public}@: URL=\"%{public}@\" appType=\"%{public}@\", buf, 0x2Au);
    }

    goto LABEL_11;
  }
  v19 = self->_bundleID;
  v115 = 0;
  v96 = (__CFString *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:](LSBundleRecord, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v19, 0, &v115));
  v20 = (BKAlternateSystemApp *)v115;
  if (v96 && !v20)
  {
    v94 = (BKAlternateSystemApp *)objc_claimAutoreleasedReturnValue(-[__CFString URL](v96, "URL"));
LABEL_11:

    v96 = (__CFString *)objc_claimAutoreleasedReturnValue(-[BKAlternateSystemApp path](v94, "path"));
    v91 = objc_msgSend(objc_alloc((Class)BSCFBundle), "initWithPath:", v96);
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "executablePath"));
    if (v90)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v99 = +[BSMutableMachServiceAliases new](BSMutableMachServiceAliases, "new");
      v87 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](self->_bundleID, "stringByAppendingString:", CFSTR(".jail.")));
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "stringByAppendingString:", CFSTR("com.apple.frontboard.systemappservices")));
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "stringByAppendingString:", CFSTR("com.apple.frontboard.workspace")));
      objc_msgSend(v21, "setObject:forKey:", &__kCFBooleanTrue, v86);
      objc_msgSend(v21, "setObject:forKey:", &__kCFBooleanTrue, v85);
      -[BSMutableMachServiceAliases setService:forAlias:](v99, "setService:forAlias:", v86, CFSTR("com.apple.frontboard.systemappservices"));
      -[BSMutableMachServiceAliases setService:forAlias:](v99, "setService:forAlias:", v85, CFSTR("com.apple.frontboard.workspace"));
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "infoDictionary"));
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "bs_safeDictionaryForKey:", CFSTR("BKSLaunchdPlist")));
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "bs_safeDictionaryForKey:", CFSTR("MachServices")));
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v120, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v112;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(_QWORD *)v112 != v23)
              objc_enumerationMutation(obj);
            v25 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v25, "length"))
              objc_msgSend(v21, "setObject:forKey:", &__kCFBooleanTrue, v25);
          }
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v120, 16);
        }
        while (v22);
      }

      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "bs_safeDictionaryForKey:", CFSTR("AlternateMachServices")));
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v107, v119, 16);
      if (v27)
      {
        v28 = *(_QWORD *)v108;
        do
        {
          for (j = 0; j != v27; j = (char *)j + 1)
          {
            if (*(_QWORD *)v108 != v28)
              objc_enumerationMutation(v26);
            v30 = *(BKAlternateSystemApp **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)j);
            if (-[BKAlternateSystemApp length](v30, "length"))
            {
              v31 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bs_safeStringForKey:", v30));
              if (-[__CFString length](v31, "length"))
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", v31));
                v33 = v32 == 0;

                v34 = BKLogAlternateSystemApp();
                v35 = objc_claimAutoreleasedReturnValue(v34);
                v36 = v35;
                if (v33)
                {
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                  {
                    v38 = val->_bundleID;
                    *(_DWORD *)buf = 134218754;
                    v122 = val;
                    v123 = 2114;
                    v124 = (BKAlternateSystemApp *)v38;
                    v125 = 2114;
                    v126 = v30;
                    v127 = 2114;
                    v128 = v31;
                    _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "launchWithResultBlock %p: [%{public}@] Ignoring alternate mach service for \"%{public}@\" because mapped service \"%{public}@\" does not exist.", buf, 0x2Au);
                  }

                }
                else
                {
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                  {
                    v37 = val->_bundleID;
                    *(_DWORD *)buf = 134218754;
                    v122 = val;
                    v123 = 2114;
                    v124 = (BKAlternateSystemApp *)v37;
                    v125 = 2112;
                    v126 = (BKAlternateSystemApp *)v31;
                    v127 = 2112;
                    v128 = (const __CFString *)v30;
                    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "launchWithResultBlock %p: [%{public}@] Registering alternate mach service \"%@\" in place of \"%@\".", buf, 0x2Au);
                  }

                  -[BSMutableMachServiceAliases setService:forAlias:](v99, "setService:forAlias:", v31, v30);
                }
              }

            }
          }
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v107, v119, 16);
        }
        while (v27);
      }

      v82 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentity identityForEmbeddedApplicationIdentifier:](RBSProcessIdentity, "identityForEmbeddedApplicationIdentifier:", val->_bundleID));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[RBSLaunchContext contextWithIdentity:](RBSLaunchContext, "contextWithIdentity:", v82));
      objc_msgSend(v39, "setSpawnType:", 1);
      objc_msgSend(v39, "_setOverrideExecutablePath:", v90);
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableMachServiceAliases environmentRepresentation](v99, "environmentRepresentation"));
      objc_msgSend(v39, "_setAdditionalEnvironment:", v40);

      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allKeys"));
      objc_msgSend(v39, "_setAdditionalMachServices:", v41);

      v81 = objc_msgSend(objc_alloc((Class)RBSLaunchRequest), "initWithContext:", v39);
      v105 = 0;
      v106 = 0;
      v42 = objc_msgSend(v81, "execute:error:", &v106, &v105);
      v43 = v106;
      v78 = v106;
      v97 = v105;
      if ((v42 & 1) != 0)
      {
        objc_storeStrong(location, v43);
        objc_initWeak(&from, val);
        processHandle = val->_processHandle;
        v102[0] = _NSConcreteStackBlock;
        v102[1] = 3221225472;
        v102[2] = sub_10003E670;
        v102[3] = &unk_1000EA928;
        objc_copyWeak(&v103, &from);
        -[RBSProcessHandle monitorForDeath:](processHandle, "monitorForDeath:", v102);
        locationa = (id *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithPid:environmentIdentifier:](RBSTarget, "targetWithPid:environmentIdentifier:", objc_msgSend(*location, "pid"), CFSTR("com.apple.backboard.alternateSystemApp")));
        v45 = objc_alloc((Class)RBSAssertion);
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[RBSEndowmentGrant grantWithNamespace:endowment:](RBSEndowmentGrant, "grantWithNamespace:endowment:", CFSTR("com.apple.frontboard.visibility"), &__kCFBooleanTrue));
        v118[0] = v46;
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[RBSJetsamPriorityGrant grantWithForegroundPriority](RBSJetsamPriorityGrant, "grantWithForegroundPriority"));
        v118[1] = v47;
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[RBSCPUAccessGrant grantWithUserInteractivity](RBSCPUAccessGrant, "grantWithUserInteractivity"));
        v118[2] = v48;
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[RBSGPUAccessGrant grant](RBSGPUAccessGrant, "grant"));
        v118[3] = v49;
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[RBSResistTerminationGrant grantWithResistance:](RBSResistTerminationGrant, "grantWithResistance:", 40));
        v118[4] = v50;
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v118, 5));
        v52 = (RBSAssertion *)objc_msgSend(v45, "initWithExplanation:target:attributes:", CFSTR("Alternate system app"), locationa, v51);
        visibilityAssertion = val->_visibilityAssertion;
        val->_visibilityAssertion = v52;

        v54 = val->_visibilityAssertion;
        v101 = 0;
        v55 = -[RBSAssertion acquireWithError:](v54, "acquireWithError:", &v101);
        v56 = v101;

        if ((v55 & 1) != 0)
        {
          v57 = BKLogAlternateSystemApp();
          v58 = objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v122 = val;
            v123 = 2114;
            v124 = val;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "launchSucceeded %p: %{public}@", buf, 0x16u);
          }

          (*((void (**)(id, _QWORD))v88 + 2))(v88, 0);
        }
        else
        {
          v65 = BKLogAlternateSystemApp();
          v66 = objc_claimAutoreleasedReturnValue(v65);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            v70 = (BKAlternateSystemApp *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "descriptionWithMultilinePrefix:", 0));
            *(_DWORD *)buf = 134218242;
            v122 = val;
            v123 = 2114;
            v124 = v70;
            _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "launchWithResultBlock %p: launch succeeded but app was not made visible: %{public}@", buf, 0x16u);

          }
          -[BKAlternateSystemApp terminate](val, "terminate");
          ((void (*)(void))v89[2])();
        }

        objc_destroyWeak(&v103);
        objc_destroyWeak(&from);
        v97 = v56;
      }
      else
      {
        v61 = BKLogAlternateSystemApp();
        v62 = objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          v68 = (BKAlternateSystemApp *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "descriptionWithMultilinePrefix:", 0));
          *(_DWORD *)buf = 134218242;
          v122 = val;
          v123 = 2114;
          v124 = v68;
          _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "launchWithResultBlock %p: launch failed: %{public}@", buf, 0x16u);

        }
        ((void (*)(void))v89[2])();
        v55 = 0;
      }

    }
    else
    {
      v59 = BKLogAlternateSystemApp();
      v60 = objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v122 = self;
        v123 = 2114;
        v124 = (BKAlternateSystemApp *)v96;
        _os_log_error_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "launchWithResultBlock %p: launch failed: no executable path for bundle at path %{public}@", buf, 0x16u);
      }

      ((void (*)(void))v89[2])();
      v55 = 0;
    }

    goto LABEL_58;
  }
  v94 = v20;
  v63 = BKLogAlternateSystemApp();
  v64 = objc_claimAutoreleasedReturnValue(v63);
  if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
  {
    v69 = self->_bundleID;
    *(_DWORD *)buf = 134218498;
    v122 = self;
    v123 = 2114;
    v124 = (BKAlternateSystemApp *)v69;
    v125 = 2114;
    v126 = v94;
    _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "launchWithResultBlock %p: launch failed: error from LS %{public}@ -- %{public}@", buf, 0x20u);
  }

  ((void (*)(void))v89[2])();
  v55 = 0;
LABEL_58:

  return v55;
}

- (BOOL)terminate
{
  id pendingExitBlock;
  RBSAssertion *visibilityAssertion;
  RBSProcessHandle *processHandle;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  RBSProcessHandle *v15;
  NSString *bundleID;
  id v18;
  uint8_t buf[4];
  NSString *v20;
  __int16 v21;
  id v22;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  pendingExitBlock = self->_pendingExitBlock;
  self->_pendingExitBlock = 0;

  -[RBSAssertion invalidate](self->_visibilityAssertion, "invalidate");
  visibilityAssertion = self->_visibilityAssertion;
  self->_visibilityAssertion = 0;

  processHandle = self->_processHandle;
  if (processHandle)
  {
    v6 = -[RBSProcessHandle pid](processHandle, "pid");
    v7 = objc_msgSend(objc_alloc((Class)RBSTerminateContext), "initWithExplanation:", CFSTR("Alternate system app termination requested."));
    objc_msgSend(v7, "setReportType:", 0);
    objc_msgSend(v7, "setMaximumTerminationResistance:", 40);
    v8 = objc_alloc((Class)RBSTerminateRequest);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
    v10 = objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingIdentifier:](RBSProcessPredicate, "predicateMatchingIdentifier:", v9));
    v11 = objc_msgSend(v8, "initWithPredicate:context:", v10, v7);

    v18 = 0;
    LOBYTE(v10) = objc_msgSend(v11, "execute:", &v18);
    v12 = v18;
    if ((v10 & 1) == 0)
    {
      v13 = BKLogAlternateSystemApp();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        bundleID = self->_bundleID;
        *(_DWORD *)buf = 138543618;
        v20 = bundleID;
        v21 = 2114;
        v22 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to terminate %{public}@ with error: %{public}@", buf, 0x16u);
      }

    }
    v15 = self->_processHandle;
    self->_processHandle = 0;

  }
  return 1;
}

- (void)_noteExitedWithContext:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void (**pendingExitBlock)(id, id);
  id v8;
  RBSAssertion *visibilityAssertion;
  RBSProcessHandle *processHandle;
  int v11;
  BKAlternateSystemApp *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = BKLogAlternateSystemApp();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_noteExitedWithContext: app:%{public}@ exitContext:%{public}@", (uint8_t *)&v11, 0x16u);
  }

  pendingExitBlock = (void (**)(id, id))self->_pendingExitBlock;
  if (pendingExitBlock)
  {
    pendingExitBlock[2](pendingExitBlock, v4);
    v8 = self->_pendingExitBlock;
    self->_pendingExitBlock = 0;

  }
  -[RBSAssertion invalidate](self->_visibilityAssertion, "invalidate");
  visibilityAssertion = self->_visibilityAssertion;
  self->_visibilityAssertion = 0;

  processHandle = self->_processHandle;
  self->_processHandle = 0;

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (RBSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (void)setProcessHandle:(id)a3
{
  objc_storeStrong((id *)&self->_processHandle, a3);
}

- (RBSAssertion)visibilityAssertion
{
  return self->_visibilityAssertion;
}

- (void)setVisibilityAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_visibilityAssertion, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)pendingExitBlock
{
  return self->_pendingExitBlock;
}

- (void)setPendingExitBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingExitBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_visibilityAssertion, 0);
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

+ (id)_bundleInfoOverrides
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[2];
  const __CFString *v7;
  void *v8;

  v5[0] = CFSTR("OverrideURL");
  v5[1] = CFSTR("OverrideAppType");
  v6[0] = CFSTR("file:///Applications/PreBoard.app");
  v6[1] = CFSTR("System");
  v7 = CFSTR("com.apple.PreBoard");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2));
  v8 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));

  return v3;
}

@end
