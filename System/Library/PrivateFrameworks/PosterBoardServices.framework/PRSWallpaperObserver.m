@implementation PRSWallpaperObserver

- (PRSWallpaperObserver)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  PRSWallpaperObserver *result;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  PRSWallpaperObserver *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;

  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is not allowed on %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v14 = v9;
    v15 = 2114;
    v16 = v11;
    v17 = 2048;
    v18 = self;
    v19 = 2114;
    v20 = CFSTR("PRSWallpaperObserver.m");
    v21 = 1024;
    v22 = 197;
    v23 = 2114;
    v24 = v8;
    _os_log_error_impl(&dword_1A4996000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  result = (PRSWallpaperObserver *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (PRSWallpaperObserver)initWithExplanation:(id)a3
{
  id v4;
  void *v5;
  PRSWallpaperObserver *v6;
  uint64_t v7;
  NSString *explanation;
  uint64_t v9;
  NSMutableDictionary *conn_configurationByIdentity;
  uint64_t v11;
  NSMutableDictionary *conn_roleToActivePosterConfiguration;
  PRSWallpaperObserver *result;
  void *v14;
  objc_super v15;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v15.receiver = self;
    v15.super_class = (Class)PRSWallpaperObserver;
    v6 = -[PRSWallpaperObserver init](&v15, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      explanation = v6->_explanation;
      v6->_explanation = (NSString *)v7;

      v6->_lock._os_unfair_lock_opaque = 0;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = objc_claimAutoreleasedReturnValue();
      conn_configurationByIdentity = v6->_conn_configurationByIdentity;
      v6->_conn_configurationByIdentity = (NSMutableDictionary *)v9;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = objc_claimAutoreleasedReturnValue();
      conn_roleToActivePosterConfiguration = v6->_conn_roleToActivePosterConfiguration;
      v6->_conn_roleToActivePosterConfiguration = (NSMutableDictionary *)v11;

    }
    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("explanation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSWallpaperObserver initWithExplanation:].cold.1();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    result = (PRSWallpaperObserver *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)dealloc
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_lock_invalidate
{
  id lock_pathHandler;
  id lock_snapshotHandler;
  RBSAssertion *lock_initialUpdateAssertion;

  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_lock_invalidated)
  {
    self->_lock_invalidated = 1;
    -[BSServiceConnectionClient invalidate](self->_lock_connection, "invalidate");
    lock_pathHandler = self->_lock_pathHandler;
    self->_lock_pathHandler = 0;

    lock_snapshotHandler = self->_lock_snapshotHandler;
    self->_lock_snapshotHandler = 0;

    -[RBSAssertion invalidate](self->_lock_initialUpdateAssertion, "invalidate");
    lock_initialUpdateAssertion = self->_lock_initialUpdateAssertion;
    self->_lock_initialUpdateAssertion = 0;

  }
}

- (void)activateWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *active_observedDescription;
  void *v12;
  void *v13;
  id lock_pathHandler;
  void *v15;
  void *v16;
  id lock_snapshotHandler;
  PRSPosterRoleActivePosterObserver *v18;
  PRSPosterRoleActivePosterObserver *lock_roleActivePosterObserver;
  PRSPosterRoleCollectionObserver *v20;
  PRSPosterRoleCollectionObserver *lock_rolePosterCollectionObserver;
  NSString *v22;
  NSString *conn_knownPostersCollectionRole;
  void *v24;
  void *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  uint64_t v29;
  id v30;
  BSServiceConnectionClient *v31;
  BSServiceConnectionClient *lock_connection;
  BSServiceConnectionClient *v33;
  id v34;
  NSString *v35;
  NSString *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  RBSAssertion *v42;
  RBSAssertion *lock_initialUpdateAssertion;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  void *v51;
  objc_class *v52;
  void *v53;
  void *v54;
  void *v55;
  objc_class *v56;
  void *v57;
  void *v58;
  void *v59;
  objc_class *v60;
  void *v61;
  void *v62;
  void *v63;
  objc_class *v64;
  void *v65;
  void *v66;
  void *v67;
  objc_class *v68;
  void *v69;
  NSString *v70;
  void *v71;
  BOOL v72;
  void *v73;
  void *v74;
  os_unfair_lock_t lock;
  _QWORD v76[4];
  id v77;
  id v78;
  PRSWallpaperObserver *v79;
  id v80;
  NSString *v81;
  NSString *v82;
  id v83;
  BOOL v84;
  BOOL v85;
  BOOL v86;
  _QWORD v87[5];
  id v88;
  BOOL v89;
  BOOL v90;
  BOOL v91;
  BOOL v92;
  id location;
  _QWORD v94[3];

  v94[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  NSClassFromString(CFSTR("PRSWallpaperObserverConfiguration"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSWallpaperObserver activateWithConfiguration:].cold.1();
LABEL_53:
    objc_msgSend(objc_retainAutorelease(v45), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49AE05CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSWallpaperObserverConfigurationClass]"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSWallpaperObserver activateWithConfiguration:].cold.9();
    objc_msgSend(objc_retainAutorelease(v46), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49AE0C0);
  }

  if ((objc_msgSend(v4, "isValid") & 1) == 0)
  {
    v47 = (void *)MEMORY[0x1E0CB3940];
    v48 = (objc_class *)objc_opt_class();
    NSStringFromClass(v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringWithFormat:", CFSTR("<%@:%@:%p> cannot be activated with an invalid configuration"), v49, self->_explanation, self);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSWallpaperObserver activateWithConfiguration:].cold.8();
    objc_msgSend(objc_retainAutorelease(v50), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49AE140);
  }
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_clientInvalidated)
  {
    os_unfair_lock_unlock(lock);
    v55 = (void *)MEMORY[0x1E0CB3940];
    v56 = (objc_class *)objc_opt_class();
    NSStringFromClass(v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "stringWithFormat:", CFSTR("<%@:%@:%p> cannot be activated after invalidation"), v57, self->_explanation, self);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSWallpaperObserver activateWithConfiguration:].cold.7();
    objc_msgSend(objc_retainAutorelease(v58), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49AE258);
  }
  if (self->_lock_clientActivated)
  {
    -[PRSWallpaperObserver _lock_invalidate](self, "_lock_invalidate");
    os_unfair_lock_unlock(lock);
    v59 = (void *)MEMORY[0x1E0CB3940];
    v60 = (objc_class *)objc_opt_class();
    NSStringFromClass(v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "stringWithFormat:", CFSTR("<%@:%@:%p> cannot be activated twice"), v61, self->_explanation, self);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSWallpaperObserver activateWithConfiguration:].cold.6();
    objc_msgSend(objc_retainAutorelease(v62), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49AE2E8);
  }
  objc_msgSend(v4, "locationStateObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "snapshotObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v6 != 0;

  objc_msgSend(v4, "activePosterRoleObserver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "postersCollectionRoleObserver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "locationStateObserver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_observed = objc_msgSend(v9, "locations");

    PRSWallpaperObserverLocationsDescription(self->_observed);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    active_observedDescription = self->_active_observedDescription;
    self->_active_observedDescription = v10;

    objc_msgSend(v4, "locationStateObserver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    lock_pathHandler = self->_lock_pathHandler;
    self->_lock_pathHandler = v13;

    if ((self->_observed & 0xF) == 0 || !self->_lock_pathHandler)
    {
      -[PRSWallpaperObserver _lock_invalidate](self, "_lock_invalidate");
      os_unfair_lock_unlock(lock);
      v51 = (void *)MEMORY[0x1E0CB3940];
      v52 = (objc_class *)objc_opt_class();
      NSStringFromClass(v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "stringWithFormat:", CFSTR("<%@:%@:%p> activated location state observer without observing anything"), v53, self->_explanation, self);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRSWallpaperObserver activateWithConfiguration:].cold.2();
      objc_msgSend(objc_retainAutorelease(v54), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A49AE1D0);
    }
  }
  if (v6)
  {
    objc_msgSend(v4, "snapshotObserver");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    lock_snapshotHandler = self->_lock_snapshotHandler;
    self->_lock_snapshotHandler = v16;

    if (!self->_lock_snapshotHandler)
    {
      -[PRSWallpaperObserver _lock_invalidate](self, "_lock_invalidate");
      os_unfair_lock_unlock(lock);
      v63 = (void *)MEMORY[0x1E0CB3940];
      v64 = (objc_class *)objc_opt_class();
      NSStringFromClass(v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "stringWithFormat:", CFSTR("<%@:%@:%p> activated snapshot observer without observing anything"), v65, self->_explanation, self);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRSWallpaperObserver activateWithConfiguration:].cold.3();
      objc_msgSend(objc_retainAutorelease(v66), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A49AE37CLL);
    }
  }
  if (v7)
  {
    objc_msgSend(v4, "activePosterRoleObserver");
    v18 = (PRSPosterRoleActivePosterObserver *)objc_claimAutoreleasedReturnValue();
    lock_roleActivePosterObserver = self->_lock_roleActivePosterObserver;
    self->_lock_roleActivePosterObserver = v18;

  }
  if (v8)
  {
    objc_msgSend(v4, "postersCollectionRoleObserver");
    v20 = (PRSPosterRoleCollectionObserver *)objc_claimAutoreleasedReturnValue();
    lock_rolePosterCollectionObserver = self->_lock_rolePosterCollectionObserver;
    self->_lock_rolePosterCollectionObserver = v20;

    -[PRSPosterRoleCollectionObserver role](self->_lock_rolePosterCollectionObserver, "role");
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    conn_knownPostersCollectionRole = self->_conn_knownPostersCollectionRole;
    self->_conn_knownPostersCollectionRole = v22;

    goto LABEL_18;
  }
  if (!v6 && !v5 && !v7)
  {
    -[PRSWallpaperObserver _lock_invalidate](self, "_lock_invalidate");
    os_unfair_lock_unlock(lock);
    v67 = (void *)MEMORY[0x1E0CB3940];
    v68 = (objc_class *)objc_opt_class();
    NSStringFromClass(v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "stringWithFormat:", CFSTR("<%@:%@:%p> activated without observing anything"), v69, self->_explanation, self);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSWallpaperObserver activateWithConfiguration:].cold.5();
    goto LABEL_53;
  }
LABEL_18:
  self->_lock_clientActivated = 1;
  if (!self->_lock_invalidated)
  {
    PRSWallpaperObserverInterface();
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0D03458];
    objc_msgSend(v74, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "endpointForMachName:service:instance:", CFSTR("com.apple.posterboardservices.services"), v25, 0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      objc_initWeak(&location, self);
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = self->_explanation;
      v27 = self->_active_observedDescription;
      v28 = (void *)MEMORY[0x1E0D03448];
      v29 = MEMORY[0x1E0C809B0];
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke;
      v87[3] = &unk_1E4D42B18;
      v87[4] = self;
      v89 = v72;
      v90 = v7 != 0;
      v91 = v8 != 0;
      v92 = v5 != 0;
      v30 = v4;
      v88 = v30;
      objc_msgSend(v28, "connectionWithEndpoint:clientContextBuilder:", v73, v87);
      v31 = (BSServiceConnectionClient *)objc_claimAutoreleasedReturnValue();
      lock_connection = self->_lock_connection;
      self->_lock_connection = v31;

      v33 = self->_lock_connection;
      v76[0] = v29;
      v76[1] = 3221225472;
      v76[2] = __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke_2;
      v76[3] = &unk_1E4D42BE0;
      v77 = v30;
      v78 = v74;
      v79 = self;
      objc_copyWeak(&v83, &location);
      v84 = v5 != 0;
      v85 = v7 != 0;
      v86 = v8 != 0;
      v34 = v71;
      v80 = v34;
      v35 = v70;
      v81 = v35;
      v36 = v27;
      v82 = v36;
      -[BSServiceConnectionClient configureConnection:](v33, "configureConnection:", v76);
      if (v5 || v7 || v8)
      {
        v37 = objc_alloc(MEMORY[0x1E0D87C98]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("initializing PRSWallpaperObserver-%@"), self->_explanation);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[BSServiceConnectionClient remoteAssertionTarget](self->_lock_connection, "remoteAssertionTarget");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v94[0] = v40;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (RBSAssertion *)objc_msgSend(v37, "initWithExplanation:target:attributes:", v38, v39, v41);
        lock_initialUpdateAssertion = self->_lock_initialUpdateAssertion;
        self->_lock_initialUpdateAssertion = v42;

        -[RBSAssertion acquireWithInvalidationHandler:](self->_lock_initialUpdateAssertion, "acquireWithInvalidationHandler:", 0);
      }
      -[BSServiceConnectionClient activate](self->_lock_connection, "activate");

      objc_destroyWeak(&v83);
      objc_destroyWeak(&location);
    }
    else
    {
      PRSLogObserver();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        -[PRSWallpaperObserver activateWithConfiguration:].cold.4((uint64_t)self, v44);

      -[PRSWallpaperObserver _lock_invalidate](self, "_lock_invalidate");
    }

  }
  os_unfair_lock_unlock(lock);

}

void __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), CFSTR("explanation"));
  objc_msgSend(v6, "encodeUInt64:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), CFSTR("observedLocations"));
  objc_msgSend(v6, "encodeBool:forKey:", *(unsigned __int8 *)(a1 + 48), CFSTR("snapshotObservation"));
  objc_msgSend(v6, "encodeBool:forKey:", *(unsigned __int8 *)(a1 + 49), CFSTR("roleObservation"));
  if (*(_BYTE *)(a1 + 49))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "roles");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeCollection:forKey:", v3, CFSTR("observedRoles"));

    objc_msgSend(v6, "encodeBool:forKey:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "needsSandboxExtensions"), CFSTR("observedRolesNeedSandboxExtensions"));
  }
  objc_msgSend(v6, "encodeBool:forKey:", *(unsigned __int8 *)(a1 + 50), CFSTR("collectionObserving"));
  if (*(_BYTE *)(a1 + 50))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "role");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("collectionObservingRole"));

    objc_msgSend(v6, "encodeBool:forKey:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "needsSandboxExtensions"), CFSTR("collectionObservingNeedsSandboxExtensions"));
  }
  if (*(_BYTE *)(a1 + 51))
  {
    objc_msgSend(*(id *)(a1 + 40), "locationStateObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeBool:forKey:", objc_msgSend(v5, "needsSandboxExtensions"), CFSTR("needsSandboxExtensions"));

  }
}

void __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  char v22;
  __int16 v23;

  v3 = a2;
  PRSDefaultServiceQuality();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v3, "setInterface:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 48));
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke_3;
  v17[3] = &unk_1E4D42B68;
  objc_copyWeak(&v21, (id *)(a1 + 80));
  v22 = *(_BYTE *)(a1 + 88);
  v6 = *(void **)(a1 + 56);
  v17[4] = *(_QWORD *)(a1 + 48);
  v23 = *(_WORD *)(a1 + 89);
  v18 = v6;
  v19 = *(id *)(a1 + 64);
  v20 = *(id *)(a1 + 72);
  objc_msgSend(v3, "setActivationHandler:", v17);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke_145;
  v12[3] = &unk_1E4D42B90;
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  objc_copyWeak(&v16, (id *)(a1 + 80));
  v15 = *(id *)(a1 + 72);
  objc_msgSend(v3, "setInterruptionHandler:", v12);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke_146;
  v7[3] = &unk_1E4D42BB8;
  objc_copyWeak(&v11, (id *)(a1 + 80));
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 72);
  objc_msgSend(v3, "setInvalidationHandler:", v7);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&v21);
}

void __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke_3(id *a1, void *a2)
{
  id v3;
  char *WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  PRSPosterRoleCollectionObserverUpdate *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  PRSWallpaperObserverPathUpdate *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  PRSPosterRoleCollectionObserverUpdate *v24;
  void *v25;
  void *v26;
  PRSPosterRoleCollectionObserverUpdate *v27;
  id v28;
  uint64_t v29;
  void *v30;
  PRSPosterRoleCollectionObserverUpdate *v31;
  PRSPosterRoleCollectionObserverUpdate *v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  NSObject *v37;
  id v38;
  id v39;
  id v40;
  NSObject *v41;
  id v42;
  id v43;
  id v44;
  NSObject *v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  char *v50;
  id v51;
  id *v52;
  _QWORD v53[4];
  PRSPosterRoleCollectionObserverUpdate *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  char *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  PRSPosterRoleCollectionObserverUpdate *v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (char *)objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    objc_msgSend(v3, "remoteTarget");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
    {
      v52 = a1;
      if (*((_BYTE *)a1 + 72))
      {
        v49 = (void *)v5;
        v51 = v3;
        v7 = 0;
        v8 = WeakRetained + 80;
        v9 = 4;
        v10 = 80;
        do
        {
          if (*(_QWORD *)((char *)a1[4] + v10))
          {
            if (!v7)
            {
              objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v9);
              v7 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v7, "addObject:", *(_QWORD *)&WeakRetained[v10]);
          }
          v10 += 8;
          --v9;
        }
        while (v9);
        v50 = WeakRetained;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v11 = v7;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
        if (v12)
        {
          v13 = v12;
          v14 = 0;
          v15 = *(_QWORD *)v56;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v56 != v15)
                objc_enumerationMutation(v11);
              v17 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
              v18 = objc_alloc_init(PRSWallpaperObserverPathUpdate);
              -[PRSWallpaperObserverPathUpdate setIdentity:](v18, "setIdentity:", v17);
              v19 = 0;
              v20 = 0;
              do
              {
                if (objc_msgSend(v17, "isEqual:", *(_QWORD *)&v8[8 * v19]))
                  v20 |= PRSWallpaperObserverLocationsFromIndex(v19);
                ++v19;
              }
              while (v19 != 4);
              -[PRSWallpaperObserverPathUpdate setLocations:](v18, "setLocations:", v20);
              if (!v14)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
                v14 = (PRSPosterRoleCollectionObserverUpdate *)objc_claimAutoreleasedReturnValue();
              }
              -[PRSPosterRoleCollectionObserverUpdate addObject:](v14, "addObject:", v18);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
          }
          while (v13);
        }
        else
        {
          v14 = 0;
        }

        WeakRetained = v50;
        v3 = v51;
        v6 = v49;
        a1 = v52;
      }
      else
      {
        v14 = 0;
      }
      if (*((_BYTE *)a1 + 73))
      {
        v21 = (void *)objc_opt_new();
        v22 = v6;
        v23 = (void *)*((_QWORD *)a1[4] + 17);
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke_4;
        v53[3] = &unk_1E4D42B40;
        v24 = v21;
        v54 = v24;
        v25 = v23;
        v6 = v22;
        objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v53);

      }
      else
      {
        v24 = 0;
      }
      if (*((_BYTE *)a1 + 74) && objc_msgSend(*((id *)a1[4] + 15), "count") && *((_QWORD *)a1[4] + 16))
      {
        v26 = v6;
        v27 = [PRSPosterRoleCollectionObserverUpdate alloc];
        v28 = a1[4];
        v29 = *((_QWORD *)v28 + 16);
        v30 = (void *)objc_msgSend(*((id *)v28 + 15), "copy");
        v31 = v27;
        v6 = v26;
        v32 = -[PRSPosterRoleCollectionObserverUpdate initWithRole:posterCollection:](v31, "initWithRole:posterCollection:", v29, v30);

      }
      else
      {
        v32 = 0;
      }
      PRSLogObserver();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = v52[5];
        v35 = v52[6];
        v36 = v52[7];
        *(_DWORD *)buf = 138544130;
        v60 = v34;
        v61 = 2114;
        v62 = v35;
        v63 = 2048;
        v64 = WeakRetained;
        v65 = 2114;
        v66 = v36;
        _os_log_impl(&dword_1A4996000, v33, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> received activation reply - sending known data...", buf, 0x2Au);
      }

      if (v14)
      {
        PRSLogObserver();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = v52[5];
          v39 = v52[6];
          v40 = v52[7];
          *(_DWORD *)buf = 138544386;
          v60 = v38;
          v61 = 2114;
          v62 = v39;
          v63 = 2048;
          v64 = WeakRetained;
          v65 = 2114;
          v66 = v40;
          v67 = 2114;
          v68 = v14;
          _os_log_impl(&dword_1A4996000, v37, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> known identities of %{public}@", buf, 0x34u);
        }

      }
      if (v24)
      {
        PRSLogObserver();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          v42 = v52[5];
          v43 = v52[6];
          v44 = v52[7];
          *(_DWORD *)buf = 138544386;
          v60 = v42;
          v61 = 2114;
          v62 = v43;
          v63 = 2048;
          v64 = WeakRetained;
          v65 = 2114;
          v66 = v44;
          v67 = 2114;
          v68 = v24;
          _os_log_impl(&dword_1A4996000, v41, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> known roles of %{public}@", buf, 0x34u);
        }

      }
      if (v32)
      {
        PRSLogObserver();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          v46 = v52[5];
          v47 = v52[6];
          v48 = v52[7];
          *(_DWORD *)buf = 138544386;
          v60 = v46;
          v61 = 2114;
          v62 = v47;
          v63 = 2048;
          v64 = WeakRetained;
          v65 = 2114;
          v66 = v48;
          v67 = 2114;
          v68 = v32;
          _os_log_impl(&dword_1A4996000, v45, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> known posters for role of %{public}@", buf, 0x34u);
        }

      }
      objc_msgSend(v6, "initializeWithKnownIdentities:knownRoles:knownCollection:", v14, v24, v32);

    }
  }

}

void __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  PRSRoleActivePosterObserverUpdate *v7;
  PRSRoleActivePosterObserverUpdate *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  v7 = [PRSRoleActivePosterObserverUpdate alloc];
  objc_msgSend(v5, "_path");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = -[PRSRoleActivePosterObserverUpdate initWithRole:activePath:](v7, "initWithRole:activePath:", v6, v9);
  objc_msgSend(v4, "addObject:", v8);

}

void __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke_145(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PRSLogObserver();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v8 = *(_QWORD *)(a1 + 48);
    v9 = 138544130;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    v13 = 2048;
    v14 = WeakRetained;
    v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_1A4996000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> reactivating after interrupt", (uint8_t *)&v9, 0x2Au);

  }
  objc_msgSend(v3, "activate");

}

void __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke_146(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  os_unfair_lock_s *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 56));
  PRSLogObserver();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = 138544130;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    v11 = 2048;
    v12 = WeakRetained;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1A4996000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> remotely invalidated", (uint8_t *)&v7, 0x2Au);
  }

  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 36);
    -[os_unfair_lock_s _lock_invalidate](WeakRetained, "_lock_invalidate");
    os_unfair_lock_unlock(WeakRetained + 36);
  }

}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  NSString *explanation;
  int v8;
  void *v9;
  __int16 v10;
  NSString *v11;
  __int16 v12;
  PRSWallpaperObserver *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_clientInvalidated)
  {
    self->_lock_clientInvalidated = 1;
    PRSLogObserver();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      explanation = self->_explanation;
      v8 = 138543874;
      v9 = v6;
      v10 = 2114;
      v11 = explanation;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1A4996000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p> client invalidated", (uint8_t *)&v8, 0x20u);

    }
    -[PRSWallpaperObserver _lock_invalidate](self, "_lock_invalidate");
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)notifyWallpaperUpdates:(id)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  NSString *explanation;
  NSString *active_observedDescription;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  NSMutableDictionary *conn_configurationByIdentity;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _QWORD *v24;
  uint8x8_t v25;
  int v26;
  unint64_t v27;
  BOOL v28;
  int v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t j;
  NSMutableDictionary *v35;
  void *v36;
  NSObject *v37;
  PRSWallpaperObserverState *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  PRSWallpaperObserverTransition *v43;
  RBSAssertion *lock_initialUpdateAssertion;
  objc_class *v45;
  void *v46;
  NSString *v47;
  NSString *v48;
  objc_class *v49;
  id v50;
  NSString *v51;
  NSString *v52;
  void *v53;
  void *v54;
  objc_class *v55;
  void *v56;
  void *v57;
  id obj;
  uint64_t v59;
  id v60;
  _QWORD v61[2];
  void (*v62)(_QWORD *);
  void *v63;
  PRSWallpaperObserver *v64;
  id v65;
  void *v66;
  _QWORD *v67;
  uint64_t *v68;
  uint64_t *v69;
  uint64_t *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  char v78;
  _QWORD v79[4];
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  char v87;
  uint8_t buf[4];
  id v89;
  __int16 v90;
  NSString *v91;
  __int16 v92;
  PRSWallpaperObserver *v93;
  __int16 v94;
  NSString *v95;
  __int16 v96;
  id v97;
  __int16 v98;
  id v99;
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v60 = a3;
  PRSLogObserver();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    explanation = self->_explanation;
    active_observedDescription = self->_active_observedDescription;
    *(_DWORD *)buf = 138544386;
    v89 = v6;
    v90 = 2114;
    v91 = explanation;
    v92 = 2048;
    v93 = self;
    v94 = 2114;
    v95 = active_observedDescription;
    v96 = 2114;
    v97 = v60;
    _os_log_impl(&dword_1A4996000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> received updates=%{public}@", buf, 0x34u);

  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    os_unfair_lock_unlock(&self->_lock);
    v9 = 0;
    v10 = 0;
    v11 = 0;
    goto LABEL_53;
  }
  if (!self->_lock_pathHandler)
  {
    v54 = (void *)MEMORY[0x1E0CB3940];
    v55 = (objc_class *)objc_opt_class();
    NSStringFromClass(v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "stringWithFormat:", CFSTR("<%@:%@:%p observed=(%@)> it should be impossible for us to have an nil path handler at this point"), v56, self->_explanation, self, self->_active_observedDescription);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSWallpaperObserver notifyWallpaperUpdates:].cold.1();
    objc_msgSend(objc_retainAutorelease(v57), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49AF998);
  }
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v87 = 0;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v83 = 0;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x2020000000;
  v79[3] = 0;
  v75 = 0;
  v76 = &v75;
  v77 = 0x2020000000;
  v78 = 0;
  if (!objc_msgSend(v60, "count"))
  {
    LOBYTE(v29) = 0;
    v30 = 0;
    *((_BYTE *)v85 + 24) = 1;
    goto LABEL_40;
  }
  v74 = 0u;
  v72 = 0u;
  v73 = 0u;
  v71 = 0u;
  obj = v60;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v100, 16);
  if (!v12)
  {
    v29 = 0;
    goto LABEL_34;
  }
  v59 = *(_QWORD *)v72;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v72 != v59)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
      objc_msgSend(v14, "path");
      v15 = objc_claimAutoreleasedReturnValue();
      -[NSObject identity](v15, "identity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        objc_msgSend(v14, "identity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          v29 = 0;
          *((_BYTE *)v85 + 24) = 1;
          goto LABEL_33;
        }
      }
      conn_configurationByIdentity = self->_conn_configurationByIdentity;
      if (v15)
      {
        v18 = -[PRSPosterConfiguration _initWithPath:]([PRSPosterConfiguration alloc], "_initWithPath:", v15);
        -[NSMutableDictionary setObject:forKey:](conn_configurationByIdentity, "setObject:forKey:", v18, v16);

        *((_BYTE *)v76 + 24) = 1;
      }
      else
      {
        -[NSMutableDictionary objectForKey:](self->_conn_configurationByIdentity, "objectForKey:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_path");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "serverIdentity");
        v21 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v21;
        if (!v21)
        {
          PRSLogObserver();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            v49 = (objc_class *)objc_opt_class();
            NSStringFromClass(v49);
            v50 = (id)objc_claimAutoreleasedReturnValue();
            v51 = self->_explanation;
            v52 = self->_active_observedDescription;
            objc_msgSend(v14, "identity");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v89 = v50;
            v90 = 2114;
            v91 = v51;
            v92 = 2048;
            v93 = self;
            v94 = 2114;
            v95 = v52;
            v96 = 2114;
            v97 = v53;
            v98 = 2114;
            v99 = obj;
            _os_log_fault_impl(&dword_1A4996000, v15, OS_LOG_TYPE_FAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> received update that assumes a previous update for %{public}@ that we don't have : updates=%{public}@", buf, 0x3Eu);

          }
          v29 = 1;
          goto LABEL_33;
        }
      }
      v22 = objc_msgSend(v14, "locations") & 0xF;
      if (!v22)
      {
        *((_BYTE *)v85 + 24) = 1;

LABEL_32:
        v29 = 0;
LABEL_33:

        goto LABEL_34;
      }
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v62 = (void (*)(_QWORD *))__47__PRSWallpaperObserver_notifyWallpaperUpdates___block_invoke;
      v63 = &unk_1E4D42C08;
      v68 = &v84;
      v67 = v79;
      v64 = self;
      v23 = v16;
      v69 = &v75;
      v70 = &v80;
      v65 = v23;
      v66 = v14;
      v24 = v61;
      buf[0] = 0;
      v25 = (uint8x8_t)vcnt_s8((int8x8_t)v22);
      v25.i16[0] = vaddlv_u8(v25);
      v26 = v25.i32[0];
      if (v25.i32[0])
      {
        v27 = 0;
        do
        {
          if (((1 << v27) & v22) != 0)
          {
            v62(v24);
            if (buf[0])
              break;
            --v26;
          }
          if (v27 > 0x3E)
            break;
          ++v27;
        }
        while (v26 > 0);
      }

      v28 = *((_BYTE *)v85 + 24) == 0;
      if (!v28)
        goto LABEL_32;

    }
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v100, 16);
    v29 = 0;
    if (v12)
      continue;
    break;
  }
LABEL_34:

  v31 = (void *)MEMORY[0x1E0C99E20];
  -[NSMutableDictionary allKeys](self->_conn_configurationByIdentity, "allKeys");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithArray:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  for (j = 0; j != 4; ++j)
  {
    if (self->_conn_identityLocations[j])
      objc_msgSend(v33, "removeObject:");
  }
  v35 = self->_conn_configurationByIdentity;
  objc_msgSend(v33, "allObjects");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](v35, "removeObjectsForKeys:", v36);

  v30 = *((_BYTE *)v85 + 24) == 0;
  if (v29 || *((_BYTE *)v85 + 24))
  {
LABEL_40:
    if ((v29 & 1) == 0 && !v30)
    {
      PRSLogObserver();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      {
        v45 = (objc_class *)objc_opt_class();
        NSStringFromClass(v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = self->_explanation;
        v48 = self->_active_observedDescription;
        *(_DWORD *)buf = 138544386;
        v89 = v46;
        v90 = 2114;
        v91 = v47;
        v92 = 2048;
        v93 = self;
        v94 = 2114;
        v95 = v48;
        v96 = 2114;
        v97 = v60;
        _os_log_fault_impl(&dword_1A4996000, v37, OS_LOG_TYPE_FAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> received incoherent updates : updates=%{public}@", buf, 0x34u);

      }
    }
    -[PRSWallpaperObserver _lock_invalidate](self, "_lock_invalidate");
  }
  if (self->_lock_pathHandler && (*((_BYTE *)v76 + 24) || v81[3]))
  {
    self->_lock_initialLocationStateUpdateWasSent = 1;
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A85A457C]();
    v38 = [PRSWallpaperObserverState alloc];
    -[NSMutableDictionary objectForKey:](self->_conn_configurationByIdentity, "objectForKey:", self->_conn_identityLocations[0]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_conn_configurationByIdentity, "objectForKey:", self->_conn_identityLocations[1]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_conn_configurationByIdentity, "objectForKey:", self->_conn_identityLocations[2]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_conn_configurationByIdentity, "objectForKey:", self->_conn_identityLocations[3]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PRSWallpaperObserverState _initWithSelectedLock:selectedHome:activeLock:activeHome:](v38, "_initWithSelectedLock:selectedHome:activeLock:activeHome:", v39, v40, v41, v42);

    v43 = [PRSWallpaperObserverTransition alloc];
    v11 = -[PRSWallpaperObserverTransition _initWithChanged:](v43, "_initWithChanged:", v81[3]);
  }
  else
  {
    v11 = 0;
    v10 = 0;
    v9 = 0;
  }
  -[RBSAssertion invalidate](self->_lock_initialUpdateAssertion, "invalidate");
  lock_initialUpdateAssertion = self->_lock_initialUpdateAssertion;
  self->_lock_initialUpdateAssertion = 0;

  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(v79, 8);
  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v84, 8);
  os_unfair_lock_unlock(&self->_lock);
  if (v9)
    ((void (**)(_QWORD, id, id))v9)[2](v9, v10, v11);
LABEL_53:

}

uint64_t __47__PRSWallpaperObserver_notifyWallpaperUpdates___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  int v6;
  void *v7;
  uint64_t v8;
  id *v9;
  void *v10;

  v4 = result;
  if ((a2 & ~*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24)) != 0)
  {
    v6 = PRSWallpaperObserverLocationsToIndex(a2);
    v7 = *(void **)(v4 + 40);
    v8 = *(_QWORD *)(v4 + 32) + 8 * v6;
    v10 = *(void **)(v8 + 80);
    v9 = (id *)(v8 + 80);
    if (v10 != v7)
    {
      objc_storeStrong(v9, v7);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 72) + 8) + 24) = 1;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 80) + 8) + 24) |= a2;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 56) + 8) + 24) |= a2;
    result = objc_msgSend(*(id *)(v4 + 48), "changed");
    if ((a2 & ~result) == 0)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 80) + 8) + 24) |= a2;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)notifySnapshotUpdates:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  NSString *explanation;
  NSString *active_observedDescription;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  RBSAssertion *lock_initialUpdateAssertion;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  PRSPosterConfiguration *v18;
  void *v19;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  NSString *v30;
  __int16 v31;
  PRSWallpaperObserver *v32;
  __int16 v33;
  NSString *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PRSLogObserver();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    explanation = self->_explanation;
    active_observedDescription = self->_active_observedDescription;
    *(_DWORD *)buf = 138544386;
    v28 = v7;
    v29 = 2114;
    v30 = explanation;
    v31 = 2048;
    v32 = self;
    v33 = 2114;
    v34 = active_observedDescription;
    v35 = 2114;
    v36 = v4;
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> received snapshot updates=%{public}@", buf, 0x34u);

  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
    v10 = 0;
  else
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A85A457C](self->_lock_snapshotHandler);
  -[RBSAssertion invalidate](self->_lock_initialUpdateAssertion, "invalidate");
  lock_initialUpdateAssertion = self->_lock_initialUpdateAssertion;
  self->_lock_initialUpdateAssertion = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (v10)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v4;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v18 = [PRSPosterConfiguration alloc];
          objc_msgSend(v17, "path", (_QWORD)v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[PRSPosterConfiguration _initWithPath:](v18, "_initWithPath:", v19);

          objc_msgSend(v17, "snapshotType");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id, void *))v10)[2](v10, v20, v21);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);
    }

  }
}

- (void)notifyRoleActivePosterUpdates:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  NSString *explanation;
  NSString *active_observedDescription;
  os_unfair_lock_s *p_lock;
  void *v11;
  PRSPosterRoleActivePosterObserver *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  PRSPosterRoleActivePosterObserverState *v25;
  RBSAssertion *lock_initialUpdateAssertion;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  PRSPosterRoleActivePosterObserver *v32;
  id v33;
  id obj;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  NSString *v49;
  __int16 v50;
  PRSWallpaperObserver *v51;
  __int16 v52;
  NSString *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PRSLogObserver();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    explanation = self->_explanation;
    active_observedDescription = self->_active_observedDescription;
    *(_DWORD *)buf = 138544386;
    v47 = v7;
    v48 = 2114;
    v49 = explanation;
    v50 = 2048;
    v51 = self;
    v52 = 2114;
    v53 = active_observedDescription;
    v54 = 2114;
    v55 = v4;
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> received role updates=%{public}@", buf, 0x34u);

  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    v11 = 0;
    v12 = 0;
  }
  else
  {
    v32 = self->_lock_roleActivePosterObserver;
    v33 = v4;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = v4;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v13)
    {
      v14 = v13;
      v11 = 0;
      v35 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v41 != v35)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v16, "role");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "activePath");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](self->_conn_roleToActivePosterConfiguration, "objectForKey:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "_path");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20
            || (objc_msgSend(v20, "serverIdentity"),
                v21 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v18, "serverIdentity"),
                v22 = (void *)objc_claimAutoreleasedReturnValue(),
                v23 = objc_msgSend(v21, "isEqual:", v22),
                v22,
                v21,
                (v23 & 1) == 0))
          {
            v24 = -[PRSPosterConfiguration _initWithPath:]([PRSPosterConfiguration alloc], "_initWithPath:", v18);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_conn_roleToActivePosterConfiguration, "setObject:forKeyedSubscript:", v24, v17);
            v25 = -[PRSPosterRoleActivePosterObserverState initWithRole:activePoster:]([PRSPosterRoleActivePosterObserverState alloc], "initWithRole:activePoster:", v17, v24);
            if (!v11)
              v11 = (void *)objc_opt_new();
            objc_msgSend(v11, "addObject:", v25);

          }
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v14);
    }
    else
    {
      v11 = 0;
    }

    v12 = v32;
    v4 = v33;
    p_lock = &self->_lock;
  }
  -[RBSAssertion invalidate](self->_lock_initialUpdateAssertion, "invalidate");
  lock_initialUpdateAssertion = self->_lock_initialUpdateAssertion;
  self->_lock_initialUpdateAssertion = 0;

  os_unfair_lock_unlock(p_lock);
  if (v12)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v27 = v11;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v37 != v30)
            objc_enumerationMutation(v27);
          -[PRSPosterRoleActivePosterObserver issueUpdatedState:](v12, "issueUpdatedState:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v29);
    }

  }
}

- (void)notifyRolePosterCollectionUpdates:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  NSString *explanation;
  NSString *active_observedDescription;
  PRSPosterRoleCollectionObserver *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  NSArray *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  NSArray *v29;
  NSArray *conn_knownPostersCollection;
  PRSPosterRoleCollectionObserverUpdate *v31;
  RBSAssertion *lock_initialUpdateAssertion;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  os_unfair_lock_t lock;
  id v40;
  id v41;
  PRSWallpaperObserver *v42;
  PRSPosterRoleCollectionObserver *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  NSString *v60;
  __int16 v61;
  PRSWallpaperObserver *v62;
  __int16 v63;
  NSString *v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PRSLogObserver();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    explanation = self->_explanation;
    active_observedDescription = self->_active_observedDescription;
    *(_DWORD *)buf = 138544386;
    v58 = v7;
    v59 = 2114;
    v60 = explanation;
    v61 = 2048;
    v62 = self;
    v63 = 2114;
    v64 = active_observedDescription;
    v65 = 2114;
    v66 = v4;
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> received role updates=%{public}@", buf, 0x34u);

  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    os_unfair_lock_unlock(&self->_lock);
    v10 = 0;
    v11 = 0;
    goto LABEL_5;
  }
  lock = &self->_lock;
  v10 = self->_lock_rolePosterCollectionObserver;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v40 = v4;
  v12 = v4;
  v46 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  v11 = 0;
  if (v46)
  {
    v13 = *(_QWORD *)v52;
    v42 = self;
    v43 = v10;
    v41 = v12;
    v45 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v52 != v13)
          objc_enumerationMutation(v12);
        v15 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v15, "role", lock);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRSPosterRoleCollectionObserver role](v10, "role");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if (v18)
        {
          objc_msgSend(v15, "posterCollection");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = self->_conn_knownPostersCollection;
          v21 = objc_msgSend(v19, "count");
          if (v21 != -[NSArray count](v20, "count"))
            goto LABEL_21;
          if (objc_msgSend(v19, "count"))
          {
            v44 = v11;
            v22 = 0;
            do
            {
              -[NSArray objectAtIndexedSubscript:](v20, "objectAtIndexedSubscript:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectAtIndexedSubscript:", v22);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "serverIdentity");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "serverIdentity");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = BSEqualObjects();

              if ((v27 & 1) == 0)
                break;
              ++v22;
            }
            while (v22 < objc_msgSend(v19, "count"));
            v28 = v27 ^ 1;
            self = v42;
            v10 = v43;
            v11 = v44;
            v12 = v41;
            if (!v19)
            {
LABEL_21:
              v29 = (NSArray *)objc_msgSend(v19, "copy");
              conn_knownPostersCollection = self->_conn_knownPostersCollection;
              self->_conn_knownPostersCollection = v29;

              v31 = -[PRSPosterRoleCollectionObserverUpdate initWithRole:posterCollection:]([PRSPosterRoleCollectionObserverUpdate alloc], "initWithRole:posterCollection:", v16, v19);
              if (!v11)
                v11 = (void *)objc_opt_new();
              objc_msgSend(v11, "addObject:", v31);

              goto LABEL_24;
            }
          }
          else
          {
            v28 = 0;
            if (!v19)
              goto LABEL_21;
          }
          if (v28)
            goto LABEL_21;
LABEL_24:

          v13 = v45;
        }

      }
      v46 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v46);
  }

  -[RBSAssertion invalidate](self->_lock_initialUpdateAssertion, "invalidate");
  lock_initialUpdateAssertion = self->_lock_initialUpdateAssertion;
  self->_lock_initialUpdateAssertion = 0;

  os_unfair_lock_unlock(lock);
  if (v10)
  {
    v4 = v40;
    if (objc_msgSend(v11, "count"))
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v33 = v11;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v48;
        do
        {
          for (j = 0; j != v35; ++j)
          {
            if (*(_QWORD *)v48 != v36)
              objc_enumerationMutation(v33);
            objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "posterCollection", lock);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[PRSPosterRoleCollectionObserver issueUpdatedState:](v10, "issueUpdatedState:", v38);

          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        }
        while (v35);
      }
      v11 = v33;

    }
  }
  else
  {
    v4 = v40;
  }
LABEL_5:

}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_conn_roleToActivePosterConfiguration, 0);
  objc_storeStrong((id *)&self->_conn_knownPostersCollectionRole, 0);
  objc_storeStrong((id *)&self->_conn_knownPostersCollection, 0);
  objc_storeStrong((id *)&self->_conn_configurationByIdentity, 0);
  for (i = 0; i != -4; --i)
    objc_storeStrong((id *)&self->_conn_identityLocations[i + 3], 0);
  objc_storeStrong((id *)&self->_lock_initialUpdateAssertion, 0);
  objc_storeStrong((id *)&self->_active_observedDescription, 0);
  objc_storeStrong((id *)&self->_lock_rolePosterCollectionObserver, 0);
  objc_storeStrong((id *)&self->_lock_roleActivePosterObserver, 0);
  objc_storeStrong(&self->_lock_snapshotHandler, 0);
  objc_storeStrong(&self->_lock_pathHandler, 0);
  objc_storeStrong((id *)&self->_lock_connection, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
}

- (void)initWithExplanation:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)activateWithConfiguration:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_6_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)activateWithConfiguration:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_6_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)activateWithConfiguration:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_6_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)activateWithConfiguration:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = 138544130;
  v9 = v5;
  v10 = 2114;
  v11 = v6;
  v12 = 2048;
  v13 = a1;
  v14 = 2114;
  v15 = v7;
  _os_log_error_impl(&dword_1A4996000, a2, OS_LOG_TYPE_ERROR, "<%{public}@:%{public}@:%p observed=(%{public}@)> failed to lookup endpoint", (uint8_t *)&v8, 0x2Au);

}

- (void)activateWithConfiguration:.cold.5()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_6_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)activateWithConfiguration:.cold.6()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_6_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)activateWithConfiguration:.cold.7()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_6_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)activateWithConfiguration:.cold.8()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_6_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)activateWithConfiguration:.cold.9()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_6_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)notifyWallpaperUpdates:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
