@implementation FBScene(PRScene)

+ (uint64_t)pr_createPosterSceneWithRole:()PRScene path:
{
  return objc_msgSend(a1, "pr_createPosterSceneWithRole:path:provider:", a3, a4, 0);
}

+ (id)pr_createPosterSceneWithRole:()PRScene path:provider:
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v27;
  _QWORD v28[4];
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  NSClassFromString(CFSTR("PFServerPosterPath"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBScene(PRScene) pr_createPosterSceneWithRole:path:provider:].cold.1();
LABEL_20:
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6DAE88);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBScene(PRScene) pr_createPosterSceneWithRole:path:provider:].cold.1();
    goto LABEL_20;
  }

  if (v10)
  {
LABEL_4:
    v12 = objc_alloc(MEMORY[0x1E0D7F8C0]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "pf_defaultInstanceIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithExtension:instanceIdentifier:", v10, v13);

    objc_msgSend(a1, "pr_createPosterSceneWithRole:path:instance:", v8, v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v15, "instance", v14, (void *)1);

    goto LABEL_14;
  }
  v16 = (void *)MEMORY[0x1E0CAA568];
  v17 = objc_alloc(MEMORY[0x1E0CAA560]);
  v18 = (void *)MEMORY[0x1E0CB3880];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __63__FBScene_PRScene__pr_createPosterSceneWithRole_path_provider___block_invoke;
  v28[3] = &unk_1E2185C78;
  v19 = v11;
  v29 = v19;
  objc_msgSend(v18, "predicateWithBlock:", v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v17, "initWithExtensionPointIdentifier:predicate:", CFSTR("com.apple.posterkit.provider"), v20);
  objc_msgSend(v16, "executeQuery:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v22, "count"))
  {
    v23 = (void *)MEMORY[0x1E0D7F8B8];
    objc_msgSend(v22, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "extensionWithIdentity:", v24);
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_4;
  }
  else
  {
    PRLogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      +[FBScene(PRScene) pr_createPosterSceneWithRole:path:provider:].cold.3(v19);

  }
  PRLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    +[FBScene(PRScene) pr_createPosterSceneWithRole:path:provider:].cold.2(v19);
  v15 = 0;
LABEL_14:

  return v15;
}

+ (id)pr_createPosterSceneWithRole:()PRScene path:instance:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("role"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBScene(PRScene) pr_createPosterSceneWithRole:path:instance:].cold.1();
LABEL_13:
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6DB064);
  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("path"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBScene(PRScene) pr_createPosterSceneWithRole:path:instance:].cold.2();
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6DB0C8);
  }
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("instance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBScene(PRScene) pr_createPosterSceneWithRole:path:instance:].cold.3();
    goto LABEL_13;
  }
  objc_msgSend(v10, "processIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pr_createPosterSceneWithRole:path:processIdentity:", v8, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)pr_createPosterSceneWithinCurrentProcessForRole:()PRScene path:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0D87D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "identityOfCurrentProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pr_createPosterSceneWithRole:path:processIdentity:", v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_pr_createPosterSceneWithRole:()PRScene path:processIdentity:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  unsigned int v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  _QWORD *v49;
  _QWORD v50[5];
  id v51;
  _QWORD v52[4];
  id v53;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("role"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBScene(PRScene) _pr_createPosterSceneWithRole:path:processIdentity:].cold.1(a2);
LABEL_16:
    objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6DB598);
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("path"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBScene(PRScene) _pr_createPosterSceneWithRole:path:processIdentity:].cold.2(a2);
    objc_msgSend(objc_retainAutorelease(v41), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6DB5FCLL);
  }
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identity"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBScene(PRScene) _pr_createPosterSceneWithRole:path:processIdentity:].cold.3(a2);
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0D22988], "pui_posterWorkspace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __71__FBScene_PRScene___pr_createPosterSceneWithRole_path_processIdentity___block_invoke;
  v52[3] = &unk_1E2184858;
  v43 = v12;
  v53 = v43;
  objc_msgSend(v13, "createScene:", v52);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "pr_setupSceneExtensionsForRole:", v9);
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__3;
  v50[4] = __Block_byref_object_dispose__3;
  v51 = 0;
  v45[0] = v14;
  v45[1] = 3221225472;
  v45[2] = __71__FBScene_PRScene___pr_createPosterSceneWithRole_path_processIdentity___block_invoke_315;
  v45[3] = &unk_1E2185CF0;
  v42 = v9;
  v46 = v42;
  v16 = v10;
  v47 = v16;
  v17 = v15;
  v48 = v17;
  v49 = v50;
  objc_msgSend(v17, "configureParameters:", v45);
  v18 = objc_alloc(MEMORY[0x1E0CA5848]);
  objc_msgSend(v16, "serverIdentity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "provider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithBundleIdentifier:error:", v20, 0);

  objc_msgSend(v21, "infoDictionary");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "entitlements");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "serverIdentity");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "provider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "componentsSeparatedByString:", CFSTR("."));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "lastObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v17, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "componentsSeparatedByString:", CFSTR("-"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "lastObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v26, a1, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pui_setShortDescription:", v31);

  if (objc_msgSend(v44, "pf_wantsLocation"))
    v32 = 2;
  else
    v32 = 0;
  objc_msgSend(v22, "objectForKey:ofClass:", CFSTR("com.apple.posterkit.enhanced-memory-limits"), objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "BOOLValue");
  v35 = objc_alloc(MEMORY[0x1E0D7FD08]);
  objc_msgSend(v21, "bundleIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v35, "initWithScene:bundleIdentifier:processIdentity:options:", v17, v36, v43, v32 | v34);

  objc_msgSend(v17, "pui_setPosterComponent:", v37);
  v38 = v17;

  _Block_object_dispose(v50, 8);
  return v38;
}

- (void)pr_applyPosterPath:()PRScene toSettings:
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  NSClassFromString(CFSTR("PFServerPosterPath"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene(PRScene) pr_applyPosterPath:toSettings:].cold.1();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
LABEL_28:
    JUMPOUT(0x18B6DBBBCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene(PRScene) pr_applyPosterPath:toSettings:].cold.1();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6DBC20);
  }

  v9 = v7;
  NSClassFromString(CFSTR("FBSMutableSceneSettings"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene(PRScene) pr_applyPosterPath:toSettings:].cold.2();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6DBC84);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSMutableSceneSettingsClass]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene(PRScene) pr_applyPosterPath:toSettings:].cold.2();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6DBCE8);
  }

  v24 = 0;
  objc_msgSend(v8, "extendContentsReadAccessToAuditToken:error:", 0, &v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v24;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to create path for scene settings of %@ : %@"), a1, v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene(PRScene) pr_applyPosterPath:toSettings:].cold.3();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_28;
  }
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  -[NSObject configuredProperties](v12, "configuredProperties");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    v15 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v23 = 0;
  +[PRPosterPathUtilities loadConfiguredPropertiesForPath:error:](PRPosterPathUtilities, "loadConfiguredPropertiesForPath:error:", v10, &v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v23;

  if (v15)
  {
    PRLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[FBScene(PRScene) pr_applyPosterPath:toSettings:].cold.4((uint64_t)v8, (uint64_t)v15, v12);
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v9, "pui_setPosterContents:", v10);
  objc_msgSend(v9, "pr_setPosterConfiguredProperties:", v14);
  objc_msgSend(v14, "titleStyleConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pr_setPosterTitleStyleConfiguration:", v16);

  objc_msgSend(v14, "ambientConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pr_setPosterAmbientConfiguration:", v17);

  objc_msgSend(a1, "pui_setPosterPath:", v8);
}

- (void)pr_updateWithPath:()PRScene inSettings:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(a1, "pui_posterPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "posterUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "serverIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "posterUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqual:", v11) & 1) != 0)
  {
    objc_msgSend(a1, "pr_applyPosterPath:toSettings:", v13, v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("new path is not the same poster as the current path"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene(PRScene) pr_updateWithPath:inSettings:].cold.1();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)pr_setupSceneExtensionsForRole:()PRScene
{
  id v4;
  int v5;

  v4 = a3;
  objc_msgSend(a1, "addExtension:", objc_opt_class());
  v5 = objc_msgSend(v4, "isEqual:", CFSTR("PRPosterRoleAmbient"));

  if (v5)
    objc_msgSend(a1, "addExtension:", objc_opt_class());
}

+ (void)pr_createPosterSceneWithRole:()PRScene path:provider:.cold.1()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)pr_createPosterSceneWithRole:()PRScene path:provider:.cold.2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "serverIdentity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1(&dword_18B634000, v3, v4, "cannot create a scene without a provider \"%{public}@\", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_1();
}

+ (void)pr_createPosterSceneWithRole:()PRScene path:provider:.cold.3(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "serverIdentity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1(&dword_18B634000, v3, v4, "No poster providers were found for \"%{public}@\", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_1();
}

+ (void)pr_createPosterSceneWithRole:()PRScene path:instance:.cold.1()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)pr_createPosterSceneWithRole:()PRScene path:instance:.cold.2()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)pr_createPosterSceneWithRole:()PRScene path:instance:.cold.3()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)_pr_createPosterSceneWithRole:()PRScene path:processIdentity:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)_pr_createPosterSceneWithRole:()PRScene path:processIdentity:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)_pr_createPosterSceneWithRole:()PRScene path:processIdentity:.cold.3(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)pr_applyPosterPath:()PRScene toSettings:.cold.1()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)pr_applyPosterPath:()PRScene toSettings:.cold.2()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)pr_applyPosterPath:()PRScene toSettings:.cold.3()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)pr_applyPosterPath:()PRScene toSettings:.cold.4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_18B634000, log, OS_LOG_TYPE_ERROR, "Error loading configured properties for %@: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)pr_updateWithPath:()PRScene inSettings:.cold.1()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
