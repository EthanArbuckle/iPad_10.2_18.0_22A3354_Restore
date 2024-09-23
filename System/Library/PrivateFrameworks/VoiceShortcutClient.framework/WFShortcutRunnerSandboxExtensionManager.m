@implementation WFShortcutRunnerSandboxExtensionManager

- (WFShortcutRunnerSandboxExtensionManager)init
{
  WFShortcutRunnerSandboxExtensionManager *v2;
  WFShortcutRunnerSandboxExtensionManager *v3;
  uint64_t v4;
  NSMutableSet *issuedExtensionsAccessResources;
  uint64_t v6;
  NSMutableSet *issuedExtensionHandlers;
  uint64_t v8;
  NSMutableSet *resignedExtensionsAccessResources;
  WFShortcutRunnerSandboxExtensionManager *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFShortcutRunnerSandboxExtensionManager;
  v2 = -[WFShortcutRunnerSandboxExtensionManager init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_opt_new();
    issuedExtensionsAccessResources = v3->_issuedExtensionsAccessResources;
    v3->_issuedExtensionsAccessResources = (NSMutableSet *)v4;

    v6 = objc_opt_new();
    issuedExtensionHandlers = v3->_issuedExtensionHandlers;
    v3->_issuedExtensionHandlers = (NSMutableSet *)v6;

    v8 = objc_opt_new();
    resignedExtensionsAccessResources = v3->_resignedExtensionsAccessResources;
    v3->_resignedExtensionsAccessResources = (NSMutableSet *)v8;

    v10 = v3;
  }

  return v3;
}

- (void)performWithSandboxExtensions:(id)a3 asynchronousBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  os_signpost_id_t v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  getWFVoiceShortcutClientLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  getWFVoiceShortcutClientLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    objc_msgSend(v6, "accessResourceClassNames");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    *(_DWORD *)buf = 138412290;
    v21 = v13;
    _os_signpost_emit_with_name_impl(&dword_1AF681000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PerformWithSandboxExtension", "classNames=%{signpost.description:attribute}@", buf, 0xCu);

  }
  objc_msgSend(v6, "accessResourceClassNames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  os_unfair_lock_lock(&self->_lock);
  -[WFShortcutRunnerSandboxExtensionManager issuedExtensionsAccessResources](self, "issuedExtensionsAccessResources");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "minusSet:", v16);

  os_unfair_lock_unlock(&self->_lock);
  if (objc_msgSend(v15, "count"))
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __90__WFShortcutRunnerSandboxExtensionManager_performWithSandboxExtensions_asynchronousBlock___block_invoke_2;
    v17[3] = &unk_1E5FC6900;
    v19 = v9;
    v18 = v7;
    -[WFShortcutRunnerSandboxExtensionManager requestExtensionTokensForAccessResources:completion:](self, "requestExtensionTokensForAccessResources:completion:", v15, v17);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, &__block_literal_global_97);
  }

}

- (void)performWithSandboxExtensions:(id)a3 synchronousBlock:(id)a4
{
  id v6;
  void (**v7)(id, id, id);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id, id))a4;
  getWFVoiceShortcutClientLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  getWFVoiceShortcutClientLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    objc_msgSend(v6, "accessResourceClassNames");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    *(_DWORD *)buf = 138412290;
    v27 = v13;
    _os_signpost_emit_with_name_impl(&dword_1AF681000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PerformWithSandboxExtension", "classNames=%{signpost.description:attribute}@", buf, 0xCu);

  }
  objc_msgSend(v6, "accessResourceClassNames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  os_unfair_lock_lock(&self->_lock);
  -[WFShortcutRunnerSandboxExtensionManager issuedExtensionsAccessResources](self, "issuedExtensionsAccessResources");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "minusSet:", v16);

  os_unfair_lock_unlock(&self->_lock);
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v6, "accessResourceClassNames");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = 0;
    -[WFShortcutRunnerSandboxExtensionManager requestExtensionTokensForAccessResources:rejectedAccessResources:error:](self, "requestExtensionTokensForAccessResources:rejectedAccessResources:error:", v17, &v25, &v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v25;
    v20 = v24;

    objc_msgSend(v18, "if_compactMap:", &__block_literal_global_149);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v19, v20);

    objc_msgSend(v21, "enumerateObjectsUsingBlock:", &__block_literal_global_151);
    getWFVoiceShortcutClientLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AF681000, v23, OS_SIGNPOST_INTERVAL_END, v9, "PerformWithSandboxExtension", ", buf, 2u);
    }

  }
  else
  {
    v7[2](v7, 0, 0);
  }

}

- (void)resignIssuedExtensionsWithReason:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  getWFVoiceShortcutClientLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[WFShortcutRunnerSandboxExtensionManager issuedExtensionsAccessResources](self, "issuedExtensionsAccessResources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315650;
    v14 = "-[WFShortcutRunnerSandboxExtensionManager resignIssuedExtensionsWithReason:]";
    v15 = 2114;
    v16 = v4;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1AF681000, v6, OS_LOG_TYPE_DEFAULT, "%s Resigning issued extensions with reason: %{public}@, issued extensions: %@", (uint8_t *)&v13, 0x20u);

  }
  -[WFShortcutRunnerSandboxExtensionManager issuedExtensionHandlers](self, "issuedExtensionHandlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &__block_literal_global_101);

  -[WFShortcutRunnerSandboxExtensionManager resignedExtensionsAccessResources](self, "resignedExtensionsAccessResources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShortcutRunnerSandboxExtensionManager issuedExtensionsAccessResources](self, "issuedExtensionsAccessResources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v10);

  -[WFShortcutRunnerSandboxExtensionManager issuedExtensionHandlers](self, "issuedExtensionHandlers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  -[WFShortcutRunnerSandboxExtensionManager issuedExtensionsAccessResources](self, "issuedExtensionsAccessResources");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)retakeResignedExtensionsWithReason:(id)a3 error:(id *)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  id v22;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__WFShortcutRunnerSandboxExtensionManager_retakeResignedExtensionsWithReason_error___block_invoke;
  aBlock[3] = &unk_1E5FC7288;
  aBlock[4] = self;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  getWFVoiceShortcutClientLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[WFShortcutRunnerSandboxExtensionManager resignedExtensionsAccessResources](self, "resignedExtensionsAccessResources");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v25 = "-[WFShortcutRunnerSandboxExtensionManager retakeResignedExtensionsWithReason:error:]";
    v26 = 2114;
    v27 = v6;
    v28 = 2112;
    v29 = v9;
    _os_log_impl(&dword_1AF681000, v8, OS_LOG_TYPE_DEFAULT, "%s Retaking resigned extensions with reason: %{public}@, taking extensions for: %@", buf, 0x20u);

  }
  -[WFShortcutRunnerSandboxExtensionManager resignedExtensionsAccessResources](self, "resignedExtensionsAccessResources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = 0;
  -[WFShortcutRunnerSandboxExtensionManager requestExtensionTokensForAccessResources:rejectedAccessResources:error:](self, "requestExtensionTokensForAccessResources:rejectedAccessResources:error:", v10, &v22, &v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v22;
  v13 = v21;

  v14 = objc_msgSend(v12, "count");
  if (v14)
  {
    if (a4 && v13)
      *a4 = objc_retainAutorelease(v13);
    getWFVoiceShortcutClientLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v25 = "-[WFShortcutRunnerSandboxExtensionManager retakeResignedExtensionsWithReason:error:]";
      v26 = 2112;
      v27 = v12;
      v28 = 2112;
      v29 = v13;
      _os_log_impl(&dword_1AF681000, v15, OS_LOG_TYPE_DEFAULT, "%s The following access resources were rejected when requesting sandbox extensions for resign extensions: %@, error: %@", buf, 0x20u);
    }
  }
  else
  {
    objc_msgSend(v11, "if_compactMap:", &__block_literal_global_149);
    v15 = objc_claimAutoreleasedReturnValue();
    -[WFShortcutRunnerSandboxExtensionManager issuedExtensionHandlers](self, "issuedExtensionHandlers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "unionSet:", v15);

    -[WFShortcutRunnerSandboxExtensionManager issuedExtensionsAccessResources](self, "issuedExtensionsAccessResources");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFShortcutRunnerSandboxExtensionManager resignedExtensionsAccessResources](self, "resignedExtensionsAccessResources");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "unionSet:", v18);

    -[WFShortcutRunnerSandboxExtensionManager resignedExtensionsAccessResources](self, "resignedExtensionsAccessResources");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeAllObjects");

  }
  v7[2](v7);

  return v14 == 0;
}

- (id)asynchronousRemoteDataStoreWithErrorHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asynchronousRemoteDataStoreWithErrorHandler:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)synchronousRemoteDataStoreWithErrorHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteDataStoreWithErrorHandler:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)requestExtensionTokensForAccessResources:(id)a3 rejectedAccessResources:(id *)a4 error:(id *)a5
{
  char *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  _QWORD v20[4];
  char *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  char *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = (char *)a3;
  if (objc_msgSend(v8, "count"))
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__9232;
    v42 = __Block_byref_object_dispose__9233;
    v43 = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__9232;
    v36 = __Block_byref_object_dispose__9233;
    v37 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__9232;
    v30 = __Block_byref_object_dispose__9233;
    v31 = 0;
    getWFVoiceShortcutClientLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[WFShortcutRunnerSandboxExtensionManager requestExtensionTokensForAccessResources:rejectedAccessResources:error:]";
      v46 = 2114;
      v47 = v8;
      _os_log_impl(&dword_1AF681000, v9, OS_LOG_TYPE_DEFAULT, "%s Sandbox Extensions for shortcut execution needed. Requesting sandbox extensions for resources: %{public}@", buf, 0x16u);
    }

    getWFVoiceShortcutClientLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_generate(v10);

    getWFVoiceShortcutClientLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v8;
      _os_signpost_emit_with_name_impl(&dword_1AF681000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "RequestSandboxExtension", "classNames=%{signpost.description:attribute}@", buf, 0xCu);
    }

    v14 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __114__WFShortcutRunnerSandboxExtensionManager_requestExtensionTokensForAccessResources_rejectedAccessResources_error___block_invoke;
    v25[3] = &unk_1E5FC8460;
    v25[4] = &v26;
    -[WFShortcutRunnerSandboxExtensionManager synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __114__WFShortcutRunnerSandboxExtensionManager_requestExtensionTokensForAccessResources_rejectedAccessResources_error___block_invoke_2;
    v20[3] = &unk_1E5FC6948;
    v21 = v8;
    v22 = &v38;
    v23 = &v32;
    v24 = &v26;
    objc_msgSend(v15, "requestSandboxExtensionForAccessResources:completion:", v21, v20);

    if (a4)
      *a4 = objc_retainAutorelease((id)v33[5]);
    if (a5)
      *a5 = objc_retainAutorelease((id)v27[5]);
    getWFVoiceShortcutClientLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AF681000, v17, OS_SIGNPOST_INTERVAL_END, v11, "RequestSandboxExtension", ", buf, 2u);
    }

    v18 = (id)v39[5];
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v38, 8);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)requestExtensionTokensForAccessResources:(id)a3 completion:(id)a4
{
  char *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  char *v17;
  id v18;
  os_signpost_id_t v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    getWFVoiceShortcutClientLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[WFShortcutRunnerSandboxExtensionManager requestExtensionTokensForAccessResources:completion:]";
      v24 = 2114;
      v25 = v6;
      _os_log_impl(&dword_1AF681000, v8, OS_LOG_TYPE_DEFAULT, "%s Sandbox Extensions for shortcut execution needed. Requesting sandbox extensions for resources: %{public}@", buf, 0x16u);
    }

    getWFVoiceShortcutClientLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_generate(v9);

    getWFVoiceShortcutClientLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_signpost_emit_with_name_impl(&dword_1AF681000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RequestSandboxExtension", "classNames=%{signpost.description:attribute}@", buf, 0xCu);
    }

    v13 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __95__WFShortcutRunnerSandboxExtensionManager_requestExtensionTokensForAccessResources_completion___block_invoke;
    v20[3] = &unk_1E5FC88A0;
    v14 = v7;
    v21 = v14;
    -[WFShortcutRunnerSandboxExtensionManager asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __95__WFShortcutRunnerSandboxExtensionManager_requestExtensionTokensForAccessResources_completion___block_invoke_2;
    v16[3] = &unk_1E5FC6970;
    v17 = v6;
    v19 = v10;
    v18 = v14;
    objc_msgSend(v15, "requestSandboxExtensionForAccessResources:completion:", v17, v16);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0);
  }

}

- (void)requestSandboxExtensionForRunningActionWithAccessResources:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[WFShortcutRunnerSandboxExtensionManager issuedExtensionsAccessResources](self, "issuedExtensionsAccessResources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  os_unfair_lock_unlock(&self->_lock);
  if (objc_msgSend(v7, "count"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __113__WFShortcutRunnerSandboxExtensionManager_requestSandboxExtensionForRunningActionWithAccessResources_completion___block_invoke;
    v10[3] = &unk_1E5FC6998;
    v12 = v6;
    v10[4] = self;
    v11 = v7;
    -[WFShortcutRunnerSandboxExtensionManager requestExtensionTokensForAccessResources:completion:](self, "requestExtensionTokensForAccessResources:completion:", v11, v10);

  }
  else
  {
    v9 = (void *)objc_opt_new();
    (*((void (**)(id, void *, _QWORD))v6 + 2))(v6, v9, 0);

  }
}

- (BOOL)requestSandboxExtensionForRunningActionWithAccessResources:(id)a3 error:(id *)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  _QWORD aBlock[5];

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__WFShortcutRunnerSandboxExtensionManager_requestSandboxExtensionForRunningActionWithAccessResources_error___block_invoke;
  aBlock[3] = &unk_1E5FC7288;
  aBlock[4] = self;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShortcutRunnerSandboxExtensionManager issuedExtensionsAccessResources](self, "issuedExtensionsAccessResources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minusSet:", v9);

  if (objc_msgSend(v8, "count"))
  {
    v18 = 0;
    -[WFShortcutRunnerSandboxExtensionManager requestExtensionTokensForAccessResources:rejectedAccessResources:error:](self, "requestExtensionTokensForAccessResources:rejectedAccessResources:error:", v8, &v18, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;
    v12 = v10 != 0;
    if (v10)
    {
      objc_msgSend(v10, "if_compactMap:", &__block_literal_global_149);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFShortcutRunnerSandboxExtensionManager issuedExtensionsAccessResources](self, "issuedExtensionsAccessResources");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "unionSet:", v6);

      -[WFShortcutRunnerSandboxExtensionManager issuedExtensionsAccessResources](self, "issuedExtensionsAccessResources");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "minusSet:", v11);

      -[WFShortcutRunnerSandboxExtensionManager issuedExtensionHandlers](self, "issuedExtensionHandlers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "unionSet:", v13);

    }
  }
  else
  {
    v12 = 1;
  }

  v7[2](v7);
  return v12;
}

- (void)temporaryRequestSandboxExtensionWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  +[WFShortcutRunnerSandboxExtensionRequest all](WFShortcutRunnerSandboxExtensionRequest, "all");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__WFShortcutRunnerSandboxExtensionManager_temporaryRequestSandboxExtensionWithBlock___block_invoke;
  v7[3] = &unk_1E5FC69C0;
  v8 = v4;
  v6 = v4;
  -[WFShortcutRunnerSandboxExtensionManager performWithSandboxExtensions:asynchronousBlock:](self, "performWithSandboxExtensions:asynchronousBlock:", v5, v7);

}

- (void)requestSandboxExtensionForToolKitIndexingWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __106__WFShortcutRunnerSandboxExtensionManager_requestSandboxExtensionForToolKitIndexingWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E5FC88A0;
  v6 = v4;
  v12 = v6;
  -[WFShortcutRunnerSandboxExtensionManager asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __106__WFShortcutRunnerSandboxExtensionManager_requestSandboxExtensionForToolKitIndexingWithCompletionHandler___block_invoke_3;
  v9[3] = &unk_1E5FC6A08;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "requestSandboxExtensionForToolKitIndexingWithCompletion:", v9);

}

- (NSMutableSet)issuedExtensionsAccessResources
{
  return self->_issuedExtensionsAccessResources;
}

- (NSMutableSet)issuedExtensionHandlers
{
  return self->_issuedExtensionHandlers;
}

- (NSMutableSet)resignedExtensionsAccessResources
{
  return self->_resignedExtensionsAccessResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resignedExtensionsAccessResources, 0);
  objc_storeStrong((id *)&self->_issuedExtensionHandlers, 0);
  objc_storeStrong((id *)&self->_issuedExtensionsAccessResources, 0);
}

uint64_t __106__WFShortcutRunnerSandboxExtensionManager_requestSandboxExtensionForToolKitIndexingWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __106__WFShortcutRunnerSandboxExtensionManager_requestSandboxExtensionForToolKitIndexingWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void (*v9)(uint64_t, id, id, _QWORD *, _QWORD);
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "if_compactMap:", &__block_literal_global_149);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __106__WFShortcutRunnerSandboxExtensionManager_requestSandboxExtensionForToolKitIndexingWithCompletionHandler___block_invoke_4;
  v11[3] = &unk_1E5FC7288;
  v12 = v7;
  v9 = *(void (**)(uint64_t, id, id, _QWORD *, _QWORD))(v8 + 16);
  v10 = v7;
  v9(v8, v6, v5, v11, 0);

}

uint64_t __106__WFShortcutRunnerSandboxExtensionManager_requestSandboxExtensionForToolKitIndexingWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateObjectsUsingBlock:", &__block_literal_global_151);
}

uint64_t __85__WFShortcutRunnerSandboxExtensionManager_temporaryRequestSandboxExtensionWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __108__WFShortcutRunnerSandboxExtensionManager_requestSandboxExtensionForRunningActionWithAccessResources_error___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

void __113__WFShortcutRunnerSandboxExtensionManager_requestSandboxExtensionForRunningActionWithAccessResources_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v10, "if_compactMap:", &__block_literal_global_149);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "unionSet:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v7, "minusSet:", v5);
    objc_msgSend(*(id *)(a1 + 32), "issuedExtensionsAccessResources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unionSet:", v7);

    objc_msgSend(*(id *)(a1 + 32), "issuedExtensionHandlers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unionSet:", v6);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __95__WFShortcutRunnerSandboxExtensionManager_requestExtensionTokensForAccessResources_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __95__WFShortcutRunnerSandboxExtensionManager_requestExtensionTokensForAccessResources_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7)
  {
    getWFVoiceShortcutClientLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = a1[4];
      v21 = 136315394;
      v22 = "-[WFShortcutRunnerSandboxExtensionManager requestExtensionTokensForAccessResources:completion:]_block_invoke_2";
      v23 = 2114;
      v24 = v12;
      v13 = "%s Received sandbox extensions tokens for resources: %{public}@";
      v14 = v11;
      v15 = OS_LOG_TYPE_DEFAULT;
      v16 = 22;
LABEL_7:
      _os_log_impl(&dword_1AF681000, v14, v15, v13, (uint8_t *)&v21, v16);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v9)
  {
    getWFVoiceShortcutClientLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v17 = a1[4];
      v21 = 136315650;
      v22 = "-[WFShortcutRunnerSandboxExtensionManager requestExtensionTokensForAccessResources:completion:]_block_invoke";
      v23 = 2114;
      v24 = v17;
      v25 = 2114;
      v26 = v10;
      v13 = "%s Failed to request sandbox extensions for access resources %{public}@ with error %{public}@";
      v14 = v11;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 32;
      goto LABEL_7;
    }
LABEL_8:

  }
  getWFVoiceShortcutClientLogObject();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v20 = a1[6];
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF681000, v19, OS_SIGNPOST_INTERVAL_END, v20, "RequestSandboxExtension", ", (uint8_t *)&v21, 2u);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

void __114__WFShortcutRunnerSandboxExtensionManager_requestExtensionTokensForAccessResources_rejectedAccessResources_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __114__WFShortcutRunnerSandboxExtensionManager_requestExtensionTokensForAccessResources_rejectedAccessResources_error___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  int v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7)
  {
    getWFVoiceShortcutClientLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = a1[4];
      v26 = 136315394;
      v27 = "-[WFShortcutRunnerSandboxExtensionManager requestExtensionTokensForAccessResources:rejectedAccessResources:e"
            "rror:]_block_invoke_2";
      v28 = 2114;
      v29 = v12;
      v13 = "%s Received sandbox extensions tokens for resources: %{public}@";
      v14 = v11;
      v15 = OS_LOG_TYPE_DEFAULT;
      v16 = 22;
LABEL_7:
      _os_log_impl(&dword_1AF681000, v14, v15, v13, (uint8_t *)&v26, v16);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v9)
  {
    getWFVoiceShortcutClientLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v17 = a1[4];
      v26 = 136315650;
      v27 = "-[WFShortcutRunnerSandboxExtensionManager requestExtensionTokensForAccessResources:rejectedAccessResources:e"
            "rror:]_block_invoke";
      v28 = 2114;
      v29 = v17;
      v30 = 2114;
      v31 = v10;
      v13 = "%s Failed to request sandbox extensions for access resources %{public}@ with error %{public}@";
      v14 = v11;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 32;
      goto LABEL_7;
    }
LABEL_8:

  }
  v18 = *(_QWORD *)(a1[5] + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v7;
  v20 = v7;

  v21 = *(_QWORD *)(a1[6] + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v8;
  v23 = v8;

  v24 = *(_QWORD *)(a1[7] + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v10;

}

void __84__WFShortcutRunnerSandboxExtensionManager_retakeResignedExtensionsWithReason_error___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __76__WFShortcutRunnerSandboxExtensionManager_resignIssuedExtensionsWithReason___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "longLongValue");
  return sandbox_extension_release();
}

void __90__WFShortcutRunnerSandboxExtensionManager_performWithSandboxExtensions_asynchronousBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, id, id, _QWORD *);
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[16];

  v7 = a4;
  v8 = a3;
  objc_msgSend(a2, "if_compactMap:", &__block_literal_global_149);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  getWFVoiceShortcutClientLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 40);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF681000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PerformWithSandboxExtension", ", buf, 2u);
  }

  v13 = *(_QWORD *)(a1 + 32);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__WFShortcutRunnerSandboxExtensionManager_performWithSandboxExtensions_asynchronousBlock___block_invoke_98;
  v16[3] = &unk_1E5FC7288;
  v17 = v9;
  v14 = *(void (**)(uint64_t, id, id, _QWORD *))(v13 + 16);
  v15 = v9;
  v14(v13, v8, v7, v16);

}

uint64_t __90__WFShortcutRunnerSandboxExtensionManager_performWithSandboxExtensions_asynchronousBlock___block_invoke_98(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateObjectsUsingBlock:", &__block_literal_global_151);
}

+ (WFShortcutRunnerSandboxExtensionManager)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_9249);
  return (WFShortcutRunnerSandboxExtensionManager *)(id)sharedManager_result;
}

void __56__WFShortcutRunnerSandboxExtensionManager_sharedManager__block_invoke()
{
  WFShortcutRunnerSandboxExtensionManager *v0;
  void *v1;

  v0 = objc_alloc_init(WFShortcutRunnerSandboxExtensionManager);
  v1 = (void *)sharedManager_result;
  sharedManager_result = (uint64_t)v0;

}

@end
