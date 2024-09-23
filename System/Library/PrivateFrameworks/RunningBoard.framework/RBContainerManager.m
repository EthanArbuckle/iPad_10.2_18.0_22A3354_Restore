@implementation RBContainerManager

- (RBContainerManager)initWithPersonaManager:(id)a3
{
  id v5;
  RBContainerManager *v6;
  RBContainerManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBContainerManager;
  v6 = -[RBContainerManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_personaManager, a3);

  return v7;
}

- (OptionalUID)_fetchCacheUIDChoice:(id)a3
{
  uint64_t foreground_uid;
  uint64_t v4;

  foreground_uid = xpc_user_sessions_enabled();
  if ((_DWORD)foreground_uid)
  {
    foreground_uid = xpc_user_sessions_get_foreground_uid();
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  return (OptionalUID)(v4 | (foreground_uid << 32));
}

- (void)_fetchCache:(id)a3
{
  OptionalUID v4;
  unsigned int v5;
  unint64_t v6;
  _BOOL8 set;
  _BOOL4 v9;
  NSObject *v11;
  uint8_t v12[16];

  v4 = -[RBContainerManager _fetchCacheUIDChoice:](self, "_fetchCacheUIDChoice:", a3);
  v5 = *(_DWORD *)&v4.set;
  v6 = HIDWORD(*(unint64_t *)&v4);
  set = v4.set;
  v9 = self->_queryUID.set && set && self->_queryUID.uid != v4.uid;
  if (self->_queryUID.set != set || v9)
  {
    container_query_free();
    self->_queryForApps = 0;
    container_query_free();
    self->_queryForPlugins = 0;
    rbs_job_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_21A8B4000, v11, OS_LOG_TYPE_DEFAULT, "Discarded container cache on UID change", v12, 2u);
    }

  }
  if (!self->_queryForApps)
  {
    self->_queryForApps = (container_query_s *)container_query_create();
    container_query_set_class();
    container_query_operation_set_flags();
    container_query_set_include_other_owners();
    if (set)
      container_query_set_uid();
    self->_queryUID.set = v5;
    *(&self->_queryUID.set + 3) = HIBYTE(v5);
    *(_WORD *)(&self->_queryUID.set + 1) = v5 >> 8;
    self->_queryUID.uid = v6;
  }
}

- (id)_retryLookupAfterCacheMissForIdentity:(id)a3 context:(id)a4 persona:(id)a5 containerIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  xpc_object_t v15;
  uint64_t path;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _BYTE v23[12];
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_msgSend(objc_retainAutorelease(a5), "UTF8String");
  container_query_create();
  container_query_set_class();
  container_query_operation_set_flags();
  container_query_set_include_other_owners();
  if (xpc_user_sessions_enabled())
  {
    *(_DWORD *)v23 = 0;
    xpc_user_sessions_get_foreground_uid();
    container_query_set_uid();
  }
  v14 = objc_retainAutorelease(v12);
  v15 = xpc_string_create((const char *)objc_msgSend(v14, "UTF8String"));
  container_query_set_identifiers();
  if (v13)
    container_query_set_persona_unique_string();
  objc_msgSend(v10, "platform", *(_QWORD *)v23);
  container_query_operation_set_platform();
  if (container_query_get_single_result() && (path = container_get_path()) != 0)
  {
    v17 = path;
    container_query_free();
    self->_queryForApps = 0;
    container_query_free();
    self->_queryForPlugins = 0;
    rbs_job_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_21A8B4000, v18, OS_LOG_TYPE_DEFAULT, "Discarded container cache after retry", v23, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    rbs_job_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "bundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v23 = 138543874;
      *(_QWORD *)&v23[4] = v10;
      v24 = 2114;
      v25 = v14;
      v26 = 2114;
      v27 = v21;
      _os_log_impl(&dword_21A8B4000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Container path could not be computed for identifier '%{public}@', will not be passed to launch of %{public}@", v23, 0x20u);

    }
    v19 = 0;
  }
  container_query_free();

  return v19;
}

- (void)_probeCacheSubqueryIterationEvaluate:(container_object_s *)a3 withAccummulatedState:(ProbeCacheSubqueryIterationAccumulatedState *)a4
{
  const char *path;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id var1;
  const char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  ++a4->var2;
  if (!a4->var0)
  {
    path = (const char *)container_get_path();
    v6 = container_copy_sandbox_token();
    v7 = (void *)v6;
    if (path && v6)
    {
      v8 = sandbox_extension_consume();
      v9 = *__error();
      free(v7);
      if ((v8 & 0x8000000000000000) == 0)
      {
        if (access(path, 0))
        {
          if (*__error() == 2 || a4->var1)
            goto LABEL_19;
          v10 = *__error();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("access test failed while computing process container path"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          _posixErrorWithCodeAndDescription(v10, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          var1 = a4->var1;
          a4->var1 = v12;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFileSystemRepresentation:length:", path, strlen(path));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          var1 = a4->var0;
          a4->var0 = v27;
        }

LABEL_19:
        sandbox_extension_release();
        return;
      }
      if (!a4->var1)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Container token could not be consumed: errno %d"), v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x24BDD1540];
        v23 = *MEMORY[0x24BDD1128];
        v28 = *MEMORY[0x24BDD0FC8];
        v29[0] = v21;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 22, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = a4->var1;
        a4->var1 = v25;

      }
    }
    else
    {
      if (!a4->var1)
      {
        v14 = "path";
        if (path)
          v14 = "token";
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Container did not have a %s"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x24BDD1540];
        v17 = *MEMORY[0x24BDD1128];
        v28 = *MEMORY[0x24BDD0FC8];
        v29[0] = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 22, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = a4->var1;
        a4->var1 = v19;

      }
      free(v7);
    }
  }
}

- (void)_probeCache:(const void *)a3 withContainerIdentifier:(id)a4 persona:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  id v11;
  xpc_object_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = (void (**)(id, _QWORD, void *))a6;
  container_query_create();
  v11 = objc_retainAutorelease(v8);
  v12 = xpc_string_create((const char *)objc_msgSend(v11, "UTF8String"));
  container_query_set_identifiers();
  v13 = objc_retainAutorelease(v9);
  if (objc_msgSend(v13, "UTF8String"))
    container_query_set_persona_unique_string();
  v22 = 0;
  if ((container_query_iterate_results_with_subquery_sync() & 1) == 0)
  {
    container_query_get_last_error();
    v14 = (void *)container_error_copy_unlocalized_description();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("container_query_iterate_results_with_subquery_sync failed. Container Manager error = %s"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDD1540];
    v23 = *MEMORY[0x24BDD0FC8];
    v24[0] = v15;
    v17 = (void *)MEMORY[0x24BDBCE70];
    v18 = v15;
    objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v20;
    free(v14);
  }
  container_query_free();
  if (v22)
  {

    v21 = v22;
  }
  else
  {
    v21 = 0;
  }
  v10[2](v10, 0, v21);

}

uint64_t __84__RBContainerManager__probeCache_withContainerIdentifier_persona_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_probeCacheSubqueryIterationEvaluate:withAccummulatedState:", a2, *(_QWORD *)(a1 + 40));
  return 1;
}

- (id)_lookupContainerPathForIdentity:(id)a3 context:(id)a4 persona:(id)a5 containerIdentifier:(id)a6 retry:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  container_query_s *queryForApps;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  container_query_s *queryForPlugins;
  NSObject *v22;
  id v23;
  void *v24;
  id v25;
  void *v27;
  const char *v28;
  id v29;
  _QWORD v30[6];
  _QWORD v31[6];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v9 = a7;
  v45 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v29 = a4;
  v15 = a5;
  v16 = a6;
  v38 = 0;
  v39[0] = &v38;
  v39[1] = 0x3032000000;
  v39[2] = __Block_byref_object_copy__3;
  v39[3] = __Block_byref_object_dispose__3;
  v40 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__3;
  v36 = __Block_byref_object_dispose__3;
  v37 = 0;
  queryForApps = self->_queryForApps;
  v18 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __102__RBContainerManager__lookupContainerPathForIdentity_context_persona_containerIdentifier_retry_error___block_invoke;
  v31[3] = &unk_24DD46CF8;
  v31[4] = &v32;
  v31[5] = &v38;
  -[RBContainerManager _probeCache:withContainerIdentifier:persona:completionHandler:](self, "_probeCache:withContainerIdentifier:persona:completionHandler:", queryForApps, v16, v15, v31);
  v19 = v39[0];
  if (!v33[5] && !*(_QWORD *)(v39[0] + 40) && self->_queryForPlugins)
  {
    rbs_job_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v42 = v14;
      v43 = 2114;
      v44 = v16;
      _os_log_impl(&dword_21A8B4000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Attempting lookup in plugin cache of container path for container identifier (%{public}@)", buf, 0x16u);
    }

    queryForPlugins = self->_queryForPlugins;
    v30[0] = v18;
    v30[1] = 3221225472;
    v30[2] = __102__RBContainerManager__lookupContainerPathForIdentity_context_persona_containerIdentifier_retry_error___block_invoke_12;
    v30[3] = &unk_24DD46CF8;
    v30[4] = &v32;
    v30[5] = &v38;
    -[RBContainerManager _probeCache:withContainerIdentifier:persona:completionHandler:](self, "_probeCache:withContainerIdentifier:persona:completionHandler:", queryForPlugins, v16, v15, v30);
    v19 = v39[0];
  }
  if (*(_QWORD *)(v19 + 40))
  {
    rbs_job_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[RBContainerManager _lookupContainerPathForIdentity:context:persona:containerIdentifier:retry:error:].cold.1((uint64_t)v14, (uint64_t)v39, v22);
    v23 = 0;
LABEL_11:

    if (!a8)
      goto LABEL_14;
    goto LABEL_12;
  }
  v27 = (void *)v33[5];
  if (v27)
  {
    v23 = v27;
    rbs_job_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_DWORD *)buf = 138543618;
    v42 = v14;
    v43 = 2114;
    v44 = v23;
    v28 = "%{public}@ Found container path (%{public}@)";
LABEL_21:
    _os_log_impl(&dword_21A8B4000, v22, OS_LOG_TYPE_DEFAULT, v28, buf, 0x16u);
    goto LABEL_11;
  }
  if (v9)
  {
    -[RBContainerManager _retryLookupAfterCacheMissForIdentity:context:persona:containerIdentifier:](self, "_retryLookupAfterCacheMissForIdentity:context:persona:containerIdentifier:", v14, v29, v15, v16);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    rbs_job_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_DWORD *)buf = 138543618;
    v42 = v14;
    v43 = 2114;
    v44 = v23;
    v28 = "%{public}@ Found container path on retry (%{public}@)";
    goto LABEL_21;
  }
  v23 = 0;
  if (!a8)
    goto LABEL_14;
LABEL_12:
  v24 = *(void **)(v39[0] + 40);
  if (v24)
    *a8 = objc_retainAutorelease(v24);
LABEL_14:
  v25 = v23;
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  return v25;
}

void __102__RBContainerManager__lookupContainerPathForIdentity_context_persona_containerIdentifier_retry_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __102__RBContainerManager__lookupContainerPathForIdentity_context_persona_containerIdentifier_retry_error___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)containerPathForIdentity:(id)a3 context:(id)a4 persona:(id)a5 error:(id *)a6
{
  char *v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  double Current;
  double v20;
  NSObject *v21;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  double v27;
  __int16 v28;
  NSObject *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = (char *)a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v11, "containerIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13 || (objc_msgSend(v11, "bundleIdentifier"), (v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    rbs_job_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v25 = v10;
      v26 = 2114;
      v27 = *(double *)&v12;
      v28 = 2114;
      v29 = v13;
      _os_log_impl(&dword_21A8B4000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Looking up container path with persona %{public}@ using container identifier '%{public}@'", buf, 0x20u);
    }

    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      if (v12 && -[RBPersonaManager isConcretePersona:](self->_personaManager, "isConcretePersona:", v12))
        goto LABEL_13;
      rbs_job_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v25 = v10;
        v26 = 2114;
        v27 = *(double *)&v12;
        _os_log_impl(&dword_21A8B4000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Persona (%{public}@) for launch context is not a concrete persona - converting to Personal", buf, 0x16u);
      }

      -[RBPersonaManager personalPersonaUniqueString](self->_personaManager, "personalPersonaUniqueString");
      v16 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v16;
    }
    if (!v12)
    {
      v17 = 0;
      v18 = 0;
      if (-[RBPersonaManager personasAreSupported](self->_personaManager, "personasAreSupported"))
      {
LABEL_18:

        goto LABEL_19;
      }
    }
LABEL_13:
    Current = CFAbsoluteTimeGetCurrent();
    -[RBContainerManager _fetchCache:](self, "_fetchCache:", v11);
    v23 = 0;
    -[RBContainerManager _lookupContainerPathForIdentity:context:persona:containerIdentifier:retry:error:](self, "_lookupContainerPathForIdentity:context:persona:containerIdentifier:retry:error:", v10, v11, v12, v13, 1, &v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v23;
    -[RBContainerManager _clearCache](self, "_clearCache");
    v20 = CFAbsoluteTimeGetCurrent();
    rbs_job_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[RBContainerManager containerPathForIdentity:context:persona:error:]";
      v26 = 2048;
      v27 = v20 - Current;
      _os_log_impl(&dword_21A8B4000, v21, OS_LOG_TYPE_DEFAULT, "%s: containermanager query required %f seconds wall clock time.", buf, 0x16u);
    }

    if (a6 && v17)
    {
      v17 = objc_retainAutorelease(v17);
      *a6 = v17;
    }
    goto LABEL_18;
  }
  rbs_job_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = v10;
    v26 = 2114;
    v27 = *(double *)&v12;
    _os_log_impl(&dword_21A8B4000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Missing container identifier during container path look up, persona %{public}@", buf, 0x16u);
  }
  v18 = 0;
LABEL_19:

  return v18;
}

- (id)_sandboxContainerURLForExtensionContext:(id)a3 containerOverrideIdentifier:(id)a4
{
  id v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  xpc_object_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  v8 = (char)-[RBContainerManager _fetchCacheUIDChoice:](self, "_fetchCacheUIDChoice:", v6);
  container_query_create();
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v6, "identity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "xpcServiceIdentifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "personaString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "identity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "personaString");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v14, "UTF8String");
    container_query_set_persona_unique_string();

  }
  v15 = objc_retainAutorelease(v9);
  v16 = xpc_string_create((const char *)objc_msgSend(v15, "UTF8String"));
  container_query_set_identifiers();

  container_query_set_class();
  container_query_set_include_other_owners();
  container_query_operation_set_flags();
  dyld_get_active_platform();
  container_query_operation_set_platform();
  if ((v8 & 1) != 0)
    container_query_set_uid();
  if (container_query_get_single_result())
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", container_get_path(), 1, 0);
  }
  else
  {
    container_query_get_last_error();
    v18 = (void *)container_error_copy_unlocalized_description();
    rbs_job_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[RBContainerManager _sandboxContainerURLForExtensionContext:containerOverrideIdentifier:].cold.1((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);

    free(v18);
    v17 = 0;
  }
  container_query_free();

  return v17;
}

- (id)_allowedContainerOverrideIdentifiers
{
  if (_allowedContainerOverrideIdentifiers_onceToken != -1)
    dispatch_once(&_allowedContainerOverrideIdentifiers_onceToken, &__block_literal_global_11);
  return (id)_allowedContainerOverrideIdentifiers_allowed;
}

void __58__RBContainerManager__allowedContainerOverrideIdentifiers__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", &unk_24DD5FCD8);
  v1 = (void *)_allowedContainerOverrideIdentifiers_allowed;
  _allowedContainerOverrideIdentifiers_allowed = v0;

}

- (id)sandboxContainerURLForExtensionContext:(id)a3 containerOverrideIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  if (v7
    && (-[RBContainerManager _allowedContainerOverrideIdentifiers](self, "_allowedContainerOverrideIdentifiers"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "containsObject:", v7),
        v8,
        (v9 & 1) == 0))
  {
    rbs_job_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[RBContainerManager sandboxContainerURLForExtensionContext:containerOverrideIdentifier:].cold.1((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);

    v10 = 0;
  }
  else
  {
    voucher_adopt();
    -[RBContainerManager _sandboxContainerURLForExtensionContext:containerOverrideIdentifier:](self, "_sandboxContainerURLForExtensionContext:containerOverrideIdentifier:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (BOOL)containerRequiredForServiceDict:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  xpc_dictionary_get_value(v3, "_SandboxContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    xpc_dictionary_get_value(v3, "_MultipleInstances");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 == 0;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  container_query_free();
  container_query_free();
  v3.receiver = self;
  v3.super_class = (Class)RBContainerManager;
  -[RBContainerManager dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaManager, 0);
}

- (void)_fetchCacheUIDChoice:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_9(&dword_21A8B4000, v0, v1, "xpc_user_sessions_get_foreground_uid() failed with error %d - %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_lookupContainerPathForIdentity:(os_log_t)log context:persona:containerIdentifier:retry:error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_21A8B4000, log, OS_LOG_TYPE_ERROR, "%{public}@ Error during container manager lookup: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_sandboxContainerURLForExtensionContext:(uint64_t)a3 containerOverrideIdentifier:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21A8B4000, a2, a3, "Failed to get container path; error = %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)sandboxContainerURLForExtensionContext:(uint64_t)a3 containerOverrideIdentifier:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21A8B4000, a2, a3, "container-required entitlement value not allowed (%@) please use a group container instead", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

@end
