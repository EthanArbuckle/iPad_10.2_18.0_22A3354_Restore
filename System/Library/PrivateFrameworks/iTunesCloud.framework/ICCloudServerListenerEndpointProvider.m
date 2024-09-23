@implementation ICCloudServerListenerEndpointProvider

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_listenerEndpointProviderConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ICCloudServerListenerEndpointProvider;
  -[ICCloudServerListenerEndpointProvider dealloc](&v3, sel_dealloc);
}

- (id)listenerEndpointForService:(int64_t)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id *v18;
  _QWORD v19[8];
  _QWORD v20[9];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  ICCloudServerListenerEndpointProvider *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  int64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v18 = a4;
  v47 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__20210;
  v35 = __Block_byref_object_dispose__20211;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__20210;
  v29 = __Block_byref_object_dispose__20211;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v6 = MEMORY[0x1E0C809B0];
  do
  {
    -[ICCloudServerListenerEndpointProvider _listenerEndpointProviderConnection](self, "_listenerEndpointProviderConnection", v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v6;
    v20[1] = 3221225472;
    v20[2] = __74__ICCloudServerListenerEndpointProvider_listenerEndpointForService_error___block_invoke;
    v20[3] = &unk_1E438D0B8;
    v20[4] = self;
    v20[5] = &v21;
    v20[7] = 10;
    v20[8] = a3;
    v20[6] = &v25;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __74__ICCloudServerListenerEndpointProvider_listenerEndpointForService_error___block_invoke_3;
    v19[3] = &unk_1E438D0E0;
    v19[4] = self;
    v19[5] = &v25;
    v19[6] = &v31;
    v19[7] = a3;
    objc_msgSend(v8, "getListenerEndpointForService:completion:", a3, v19);

  }
  while (!v32[5] && v22[3] < 10);
  v9 = (void *)v26[5];
  if (v9)
  {
    if (v18)
      *v18 = objc_retainAutorelease(v9);
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      ICCloudServerSupportedServiceGetName(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v32[5];
      v13 = v26[5];
      *(_DWORD *)buf = 138544386;
      v38 = self;
      v39 = 2114;
      v40 = v11;
      v41 = 2048;
      v42 = a3;
      v43 = 2114;
      v44 = v12;
      v45 = 2114;
      v46 = v13;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "%{public}@: listenerEndpointForService [done with error] - service=%{public}@[%ld] - endpoint=%{public}@ - error=%{public}@", buf, 0x34u);

    }
  }
  else
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      ICCloudServerSupportedServiceGetName(a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v32[5];
      *(_DWORD *)buf = 138544130;
      v38 = self;
      v39 = 2114;
      v40 = v14;
      v41 = 2048;
      v42 = a3;
      v43 = 2114;
      v44 = v15;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: listenerEndpointForService [done] - service=%{public}@[%ld] - endpoint=%{public}@", buf, 0x2Au);

    }
  }

  v16 = (id)v32[5];
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v16;
}

- (id)_listenerEndpointProviderConnection
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  NSXPCConnection *v5;
  NSXPCConnection *listenerEndpointProviderConnection;
  NSXPCConnection *v7;
  void *v8;
  NSObject *v9;
  NSXPCConnection *v10;
  NSXPCConnection *v11;
  int v13;
  ICCloudServerListenerEndpointProvider *v14;
  __int16 v15;
  NSXPCConnection *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_listenerEndpointProviderConnection)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = self;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: listenerEndpointProviderConnection [started]", (uint8_t *)&v13, 0xCu);
    }

    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.itunescloudd.xpc"), 0);
    listenerEndpointProviderConnection = self->_listenerEndpointProviderConnection;
    self->_listenerEndpointProviderConnection = v5;

    v7 = self->_listenerEndpointProviderConnection;
    objc_msgSend((id)objc_opt_class(), "_remoteObjectInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection resume](self->_listenerEndpointProviderConnection, "resume");
  }
  v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_listenerEndpointProviderConnection;
    v13 = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: listenerEndpointProviderConnection [done] - connection:%{public}@", (uint8_t *)&v13, 0x16u);
  }

  v11 = self->_listenerEndpointProviderConnection;
  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerEndpointProviderConnection, 0);
}

- (ICCloudServerListenerEndpointProvider)init
{
  ICCloudServerListenerEndpointProvider *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICCloudServerListenerEndpointProvider;
  result = -[ICCloudServerListenerEndpointProvider init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

void __74__ICCloudServerListenerEndpointProvider_listenerEndpointForService_error___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = a1[4];
      ICCloudServerSupportedServiceGetName(a1[7]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a1[7];
      v16 = 138544130;
      v17 = v9;
      v18 = 2114;
      v19 = v10;
      v20 = 2048;
      v21 = v11;
      v22 = 2114;
      v23 = v7;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@: listenerEndpointForService - XPC Error [no listener endpoint for service] - service=%{public}@[%ld] - error=%{public}@", (uint8_t *)&v16, 0x2Au);

    }
    v12 = objc_msgSend(v7, "copy");
    v13 = *(_QWORD *)(a1[5] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    v15 = *(_QWORD *)(a1[5] + 8);
    v14 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = 0;
  }

}

- (void)notifyDeviceSetupFinishedWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[ICCloudServerListenerEndpointProvider _listenerEndpointProviderConnection](self, "_listenerEndpointProviderConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__ICCloudServerListenerEndpointProvider_notifyDeviceSetupFinishedWithCompletion___block_invoke;
  v12[3] = &unk_1E438E500;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __81__ICCloudServerListenerEndpointProvider_notifyDeviceSetupFinishedWithCompletion___block_invoke_2;
  v10[3] = &unk_1E438E500;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "notifyDeviceSetupFinishedWithCompletion:", v10);

}

uint64_t __81__ICCloudServerListenerEndpointProvider_notifyDeviceSetupFinishedWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__ICCloudServerListenerEndpointProvider_notifyDeviceSetupFinishedWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__ICCloudServerListenerEndpointProvider_listenerEndpointForService_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = a1[4];
    v6 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
    v7 = a1[7];
    ICCloudServerSupportedServiceGetName(a1[8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a1[8];
    v13 = 138544642;
    v14 = v5;
    v15 = 2048;
    v16 = v6;
    v17 = 2048;
    v18 = v7;
    v19 = 2114;
    v20 = v8;
    v21 = 2048;
    v22 = v9;
    v23 = 2114;
    v24 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@: listenerEndpointForService - XPC Error retrieving endpoint [Attempt %ld of %ld] - service=%{public}@[%ld] - error=%{public}@", (uint8_t *)&v13, 0x3Eu);

  }
  v10 = objc_msgSend(v3, "copy");
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

+ (id)_remoteObjectInterface
{
  if (_remoteObjectInterface_sListenerEndpointProviderRemoteObjectInterfaceOnceToken != -1)
    dispatch_once(&_remoteObjectInterface_sListenerEndpointProviderRemoteObjectInterfaceOnceToken, &__block_literal_global_20222);
  return (id)_remoteObjectInterface_sListenerEndpointProviderRemoteObjectInterface;
}

void __63__ICCloudServerListenerEndpointProvider__remoteObjectInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5DDA88);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_remoteObjectInterface_sListenerEndpointProviderRemoteObjectInterface;
  _remoteObjectInterface_sListenerEndpointProviderRemoteObjectInterface = v0;

}

@end
