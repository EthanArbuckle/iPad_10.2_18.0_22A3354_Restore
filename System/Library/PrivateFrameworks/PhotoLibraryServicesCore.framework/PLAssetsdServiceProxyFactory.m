@implementation PLAssetsdServiceProxyFactory

void __61__PLAssetsdServiceProxyFactory_serviceProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_inq_createServiceProxyWithErrorHandler:", *(_QWORD *)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (id)_inq_createServiceProxyWithErrorHandler:(id)a3
{
  return -[PLAssetsdServiceProxyFactory _inq_createServiceProxyWithCallStackSymbols:errorHandler:](self, "_inq_createServiceProxyWithCallStackSymbols:errorHandler:", 0, a3);
}

void __74__PLAssetsdServiceProxyFactory_remoteObjectProxyWithErrorHandler_handler___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  if (v2
    || (objc_msgSend(*(id *)(a1 + 32), "_inq_createServiceProxyWithCallStackSymbols:errorHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)), (v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = v2;
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

- (void)remoteObjectProxyWithErrorHandler:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PLAssetsdServiceProxyFactory_remoteObjectProxyWithErrorHandler_handler___block_invoke;
  block[3] = &unk_1E376A2F0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

- (id)_inq_createServiceProxyWithCallStackSymbols:(id)a3 errorHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  PLXPCProxyCreating *proxyCreating;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  SEL proxyGetterSelector;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  PLXPCProxyCreating *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  os_signpost_id_t v37;
  const char *Name;
  _QWORD v40[5];
  id v41;
  __int128 *v42;
  _QWORD v43[6];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[2];
  _QWORD v48[2];
  uint8_t buf[4];
  void *v50;
  const __CFString *v51;
  void *v52;
  __int128 v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v46 = 0u;
  v44 = 0u;
  v45 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v44) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: _inq_createServiceProxyWithCallStackSymbols:errorHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v44 + 1);
    *((_QWORD *)&v44 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v45 + 8));
  }
  *(_QWORD *)&v53 = 0;
  *((_QWORD *)&v53 + 1) = &v53;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__4995;
  v56 = __Block_byref_object_dispose__4996;
  v57 = 0;
  proxyCreating = self->_proxyCreating;
  v12 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __89__PLAssetsdServiceProxyFactory__inq_createServiceProxyWithCallStackSymbols_errorHandler___block_invoke;
  v43[3] = &unk_1E376C268;
  v43[4] = self;
  v43[5] = &v53;
  -[PLXPCProxyCreating synchronousRemoteObjectProxyWithErrorHandler:](proxyCreating, "synchronousRemoteObjectProxyWithErrorHandler:", v43);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if ((_BYTE)v44)
    {
      PLRequestGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_signpost_id_generate(v14);
      v51 = CFSTR("SignpostId");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "set_userInfo:", v17);

      v18 = v14;
      v19 = v18;
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        NSStringFromSelector(self->_proxyGetterSelector);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v50 = v20;
        _os_signpost_emit_with_name_impl(&dword_199DF7000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PLXPC Async", "%{public}@", buf, 0xCu);

      }
    }
    proxyGetterSelector = self->_proxyGetterSelector;
    v40[0] = v12;
    v40[1] = 3221225472;
    v40[2] = __89__PLAssetsdServiceProxyFactory__inq_createServiceProxyWithCallStackSymbols_errorHandler___block_invoke_3;
    v40[3] = &unk_1E376A278;
    v40[4] = self;
    v42 = &v53;
    v41 = v6;
    v22 = (void *)MEMORY[0x19AEC3014](v40);
    objc_msgSend(v13, "performSelector:withObject:", proxyGetterSelector, v22);

  }
  v23 = *(void **)(*((_QWORD *)&v53 + 1) + 40);
  if (v23)
  {
    objc_msgSend(v23, "domain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.photos.error"));

    if (v25)
    {
      v26 = *(id *)(*((_QWORD *)&v53 + 1) + 40);
    }
    else
    {
      v28 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(self->_proxyGetterSelector);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", CFSTR("Unable to obtain %@ XPC proxy for %@. %@ could have crashed"), CFSTR("assetsd"), v29, CFSTR("assetsd"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB3388];
      v47[0] = *MEMORY[0x1E0CB2D50];
      v47[1] = v32;
      v33 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 40);
      v48[0] = v30;
      v48[1] = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 41002, v34);
      v26 = (id)objc_claimAutoreleasedReturnValue();

    }
    v7[2](v7, v26);

    v27 = 0;
  }
  else
  {
    v27 = self->_serviceProxy;
  }

  _Block_object_dispose(&v53, 8);
  if ((_BYTE)v44)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v45 + 8));
  if ((_QWORD)v45)
  {
    PLRequestGetLog();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v35;
    v37 = v45;
    if ((unint64_t)(v45 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      Name = sel_getName(*((SEL *)&v46 + 1));
      LODWORD(v53) = 136446210;
      *(_QWORD *)((char *)&v53 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v36, OS_SIGNPOST_INTERVAL_END, v37, "PLXPC Sync", "%{public}s", (uint8_t *)&v53, 0xCu);
    }

  }
  return v27;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PLAssetsdServiceProxyFactory serviceProxyWithErrorHandler:](self, "serviceProxyWithErrorHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PLAssetsdServiceProxyFactory serviceProxyWithErrorHandler:](self, "serviceProxyWithErrorHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)serviceProxyWithErrorHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4995;
  v16 = __Block_byref_object_dispose__4996;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PLAssetsdServiceProxyFactory_serviceProxyWithErrorHandler___block_invoke;
  block[3] = &unk_1E376A2A0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (PLAssetsdServiceProxyFactory)initWithQueue:(id)a3 proxyCreating:(id)a4 proxyGetter:(SEL)a5
{
  id v9;
  id v10;
  PLAssetsdServiceProxyFactory *v11;
  PLAssetsdServiceProxyFactory *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLAssetsdServiceProxyFactory;
  v11 = -[PLAssetsdServiceProxyFactory init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a3);
    v12->_proxyGetterSelector = a5;
    objc_storeStrong((id *)&v12->_proxyCreating, a4);
  }

  return v12;
}

void __74__PLAssetsdServiceProxyFactory_remoteObjectProxyWithErrorHandler_handler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v8 = *(NSObject **)(v6 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__PLAssetsdServiceProxyFactory_remoteObjectProxyWithErrorHandler_handler___block_invoke_2;
    v10[3] = &unk_1E376A2C8;
    v10[4] = v6;
    v11 = v5;
    v12 = v7;
    v13 = *(id *)(a1 + 48);
    v9 = v5;
    dispatch_async(v8, v10);

  }
}

- (void)_logReplyError:(id)a3 withCallStackSymbols:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLGatekeeperXPCGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_FAULT);
  if (v7)
  {
    if (v9)
    {
      NSStringFromSelector(self->_proxyGetterSelector);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v10;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_FAULT, "Unable to get XPC service from assetsd %{public}@: %@, callstack:\n%@", (uint8_t *)&v12, 0x20u);

LABEL_6:
    }
  }
  else if (v9)
  {
    NSStringFromSelector(self->_proxyGetterSelector);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v10;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_FAULT, "Unable to get XPC service from assetsd %{public}@: %@@", (uint8_t *)&v12, 0x16u);
    goto LABEL_6;
  }

}

- (id)_unboostingRemoteObjectProxy
{
  void *v2;
  void *v3;

  -[PLAssetsdServiceProxyFactory serviceProxyWithErrorHandler:](self, "serviceProxyWithErrorHandler:", &__block_literal_global_4990);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_unboostingRemoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addBarrierBlock:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PLXPCProxyCreating addBarrierBlock:](self->_proxyCreating, "addBarrierBlock:", v4);
  }
  else
  {
    PLGatekeeperXPCGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_ERROR, "Underlying proxy creating object does not respond to addBarrierBlock:", v6, 2u);
    }

  }
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_proxyCreating, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

void __60__PLAssetsdServiceProxyFactory__unboostingRemoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Unable to get the service proxy with error: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __89__PLAssetsdServiceProxyFactory__inq_createServiceProxyWithCallStackSymbols_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    NSStringFromSelector(*(SEL *)(*(_QWORD *)(a1 + 32) + 8));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_FAULT, "XPC connection error to assetsd %@ : %@", (uint8_t *)&v8, 0x16u);

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __89__PLAssetsdServiceProxyFactory__inq_createServiceProxyWithCallStackSymbols_errorHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    objc_msgSend(*(id *)(a1 + 32), "_logReplyError:withCallStackSymbols:", v6, *(_QWORD *)(a1 + 40));
  }

}

@end
