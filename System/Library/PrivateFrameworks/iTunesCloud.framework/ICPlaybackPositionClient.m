@implementation ICPlaybackPositionClient

- (ICPlaybackPositionClient)init
{
  ICPlaybackPositionClient *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serialQueue;
  ICCloudServerListenerEndpointProvider *v5;
  ICCloudServerListenerEndpointProvider *listenerEndpointProvider;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICPlaybackPositionClient;
  v2 = -[ICPlaybackPositionClient init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesCloud.ICPlaybackPositionClient.serialQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(ICCloudServerListenerEndpointProvider);
    listenerEndpointProvider = v2->_listenerEndpointProvider;
    v2->_listenerEndpointProvider = v5;

  }
  return v2;
}

- (void)synchronizePlaybackPositions
{
  void *v3;
  id v4;

  objc_msgSend(getML3MusicLibraryClass_19702(), "autoupdatingSharedLibrary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPlaybackPositionClient synchronizePlaybackPositionsForLibraryWithIdentifier:forDomain:isCheckpoint:](self, "synchronizePlaybackPositionsForLibraryWithIdentifier:forDomain:isCheckpoint:", v3, CFSTR("com.apple.upp"), 0);

}

- (void)deletePlaybackPositionEntities
{
  void *v3;
  id v4;

  objc_msgSend(getML3MusicLibraryClass_19702(), "autoupdatingSharedLibrary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPlaybackPositionClient deletePlaybackPositionEntitiesFromLibraryWithIdentifier:](self, "deletePlaybackPositionEntitiesFromLibraryWithIdentifier:", v3);

}

- (void)getLocalPlaybackPositionForEntityIdentifiers:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(getML3MusicLibraryClass_19702(), "autoupdatingSharedLibrary");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "libraryUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPlaybackPositionClient getLocalPlaybackPositionForEntityIdentifiers:forDomain:fromLibraryWithIdentifier:completionBlock:](self, "getLocalPlaybackPositionForEntityIdentifiers:forDomain:fromLibraryWithIdentifier:completionBlock:", v7, CFSTR("com.apple.upp"), v8, v6);

}

- (void)synchronizePlaybackPositionsForLibraryWithIdentifier:(id)a3 forDomain:(id)a4 isCheckpoint:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  ICPlaybackPositionClient *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v5 = a5;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[ICPlaybackPositionClient connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __104__ICPlaybackPositionClient_synchronizePlaybackPositionsForLibraryWithIdentifier_forDomain_isCheckpoint___block_invoke;
  v13[3] = &unk_1E43902A0;
  v13[4] = self;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "synchronizePlaybackPositionsForLibraryWithIdentifier:forDomain:isCheckpoint:", v8, v9, v5);

  v12 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v15 = self;
    v16 = 2114;
    v17 = v8;
    v18 = 1024;
    v19 = v5;
    _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@ synchronizePlaybackPositionsForLibraryWithIdentifier:] Completed sync for library with identifier %{public}@. checkpoint=%{BOOL}u", buf, 0x1Cu);
  }

}

- (void)deletePlaybackPositionEntitiesFromLibraryWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  ICPlaybackPositionClient *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICPlaybackPositionClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__ICPlaybackPositionClient_deletePlaybackPositionEntitiesFromLibraryWithIdentifier___block_invoke;
  v8[3] = &unk_1E43902A0;
  v8[4] = self;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deletePlaybackPositionEntitiesFromLibraryWithIdentifier:", v4);

  v7 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@ deletePlaybackPositionEntitiesFromLibraryWithIdentifier:] Completed for library with identifier %{public}@", buf, 0x16u);
  }

}

- (void)deletePlaybackPositionEntity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  ICPlaybackPositionClient *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICPlaybackPositionClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__ICPlaybackPositionClient_deletePlaybackPositionEntity___block_invoke;
  v8[3] = &unk_1E43902A0;
  v8[4] = self;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deletePlaybackPositionEntity:", v4);

  v7 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@ deletePlaybackPositionEntity:] Completed for entity %{public}@", buf, 0x16u);
  }

}

- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[ICPlaybackPositionClient connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __87__ICPlaybackPositionClient_persistPlaybackPositionEntity_isCheckpoint_completionBlock___block_invoke;
  v17[3] = &unk_1E43915E8;
  v17[4] = self;
  v12 = v8;
  v18 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __87__ICPlaybackPositionClient_persistPlaybackPositionEntity_isCheckpoint_completionBlock___block_invoke_4;
  v15[3] = &unk_1E438F330;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "persistPlaybackPositionEntity:isCheckpoint:completionBlock:", v9, v5, v15);

}

- (void)getLocalPlaybackPositionForEntityIdentifiers:(id)a3 forDomain:(id)a4 fromLibraryWithIdentifier:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  -[ICPlaybackPositionClient connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __125__ICPlaybackPositionClient_getLocalPlaybackPositionForEntityIdentifiers_forDomain_fromLibraryWithIdentifier_completionBlock___block_invoke;
  v25[3] = &unk_1E43915E8;
  v25[4] = self;
  v16 = v12;
  v26 = v16;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __125__ICPlaybackPositionClient_getLocalPlaybackPositionForEntityIdentifiers_forDomain_fromLibraryWithIdentifier_completionBlock___block_invoke_6;
  v21[3] = &unk_1E438CFA8;
  v21[4] = self;
  v22 = v10;
  v23 = v11;
  v24 = v16;
  v18 = v16;
  v19 = v11;
  v20 = v10;
  objc_msgSend(v17, "getLocalPlaybackPositionForEntityIdentifiers:forDomain:fromLibraryWithIdentifier:completionBlock:", v13, v20, v19, v21);

}

- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  ICPlaybackPositionClient *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICPlaybackPositionClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__ICPlaybackPositionClient_updateForeignDatabaseWithValuesFromPlaybackPositionEntity___block_invoke;
  v8[3] = &unk_1E43902A0;
  v8[4] = self;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateForeignDatabaseWithValuesFromPlaybackPositionEntity:", v4);

  v7 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@ updateForeignDatabaseWithValuesFromPlaybackPositionEntity:] Completed for entity %{public}@", buf, 0x16u);
  }

}

- (void)pullPlaybackPositionEntity:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[ICPlaybackPositionClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__ICPlaybackPositionClient_pullPlaybackPositionEntity_completionBlock___block_invoke;
  v15[3] = &unk_1E438E500;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __71__ICPlaybackPositionClient_pullPlaybackPositionEntity_completionBlock___block_invoke_8;
  v13[3] = &unk_1E438CFD0;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "pullPlaybackPositionEntity:completionBlock:", v7, v13);

}

- (void)pushPlaybackPositionEntity:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[ICPlaybackPositionClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__ICPlaybackPositionClient_pushPlaybackPositionEntity_completionBlock___block_invoke;
  v15[3] = &unk_1E438E500;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __71__ICPlaybackPositionClient_pushPlaybackPositionEntity_completionBlock___block_invoke_10;
  v13[3] = &unk_1E438CFD0;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "pushPlaybackPositionEntity:completionBlock:", v7, v13);

}

- (NSXPCConnection)connection
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__19668;
  v10 = __Block_byref_object_dispose__19669;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__ICPlaybackPositionClient_connection__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSXPCConnection *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerEndpointProvider, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __38__ICPlaybackPositionClient_connection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _BYTE location[12];
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  if (v3)
    goto LABEL_4;
  v4 = *(void **)(v2 + 24);
  v36 = 0;
  objc_msgSend(v4, "listenerEndpointForService:error:", 6, &v36);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v36;
  if (v5)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v5);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 16);
    *(_QWORD *)(v8 + 16) = v7;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5BF348);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_pushPlaybackPositionEntity_completionBlock_, 0, 0);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_pushPlaybackPositionEntity_completionBlock_, 1, 1);

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_pushPlaybackPositionEntity_completionBlock_, 2, 1);

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_persistPlaybackPositionEntity_isCheckpoint_completionBlock_, 0, 0);

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_pushPlaybackPositionEntity_completionBlock_, 0, 1);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setRemoteObjectInterface:", v10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setExportedObject:");
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    v25 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v26 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __38__ICPlaybackPositionClient_connection__block_invoke_79;
    v34[3] = &unk_1E4391400;
    objc_copyWeak(&v35, (id *)location);
    objc_msgSend(v25, "setInterruptionHandler:", v34);
    v27 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v32[0] = v26;
    v32[1] = 3221225472;
    v32[2] = __38__ICPlaybackPositionClient_connection__block_invoke_80;
    v32[3] = &unk_1E4391400;
    objc_copyWeak(&v33, (id *)location);
    objc_msgSend(v27, "setInvalidationHandler:", v32);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume");
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)location);

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
LABEL_4:
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v29 = v3;
    v6 = *(id *)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v29;
    goto LABEL_5;
  }
  v30 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v31 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)location = 138543618;
    *(_QWORD *)&location[4] = v31;
    v38 = 2114;
    v39 = v6;
    _os_log_impl(&dword_1A03E3000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve listener endpoint. error=%{public}@", location, 0x16u);
  }

LABEL_5:
}

void __38__ICPlaybackPositionClient_connection__block_invoke_79(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138543362;
    v4 = WeakRetained;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection interrupted", (uint8_t *)&v3, 0xCu);
  }

}

void __38__ICPlaybackPositionClient_connection__block_invoke_80(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = WeakRetained;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection invalidated", (uint8_t *)&v4, 0xCu);
  }

  v3 = (void *)WeakRetained[2];
  WeakRetained[2] = 0;

}

void __71__ICPlaybackPositionClient_pushPlaybackPositionEntity_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "ICPlaybackPositionClient - pushPlaybackPositionEntity: Failed to get remote object proxy. error=%{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v5 + 16))(v5, 0, v3, 0);

}

void __71__ICPlaybackPositionClient_pushPlaybackPositionEntity_completionBlock___block_invoke_10(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "msv_description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 67109634;
      v14 = a2;
      v15 = 2114;
      v16 = v8;
      v17 = 2114;
      v18 = v11;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "ICPlaybackPositionClient - pushPlaybackPositionEntity: Completed. success=%{BOOL}u cloudEntity=%{public}@ error=%{public}@", (uint8_t *)&v13, 0x1Cu);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 67109378;
    v14 = a2;
    v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "ICPlaybackPositionClient - pushPlaybackPositionEntity: Completed. success=%{BOOL}u cloudEntity=%{public}@", (uint8_t *)&v13, 0x12u);
  }

  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, id, id))(v12 + 16))(v12, a2, v7, v8);

}

void __71__ICPlaybackPositionClient_pullPlaybackPositionEntity_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "ICPlaybackPositionClient - pullPlaybackPositionEntity: Failed to get remote object proxy. error=%{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v5 + 16))(v5, 0, v3, 0);

}

void __71__ICPlaybackPositionClient_pullPlaybackPositionEntity_completionBlock___block_invoke_8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "msv_description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 67109634;
      v14 = a2;
      v15 = 2114;
      v16 = v8;
      v17 = 2114;
      v18 = v11;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "ICPlaybackPositionClient - pullPlaybackPositionEntity: Completed. success=%{BOOL}u cloudEntity=%{public}@ error=%{public}@", (uint8_t *)&v13, 0x1Cu);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 67109378;
    v14 = a2;
    v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "ICPlaybackPositionClient - pullPlaybackPositionEntity: Completed. success=%{BOOL}u cloudEntity=%{public}@", (uint8_t *)&v13, 0x12u);
  }

  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, id, id))(v12 + 16))(v12, a2, v7, v8);

}

void __86__ICPlaybackPositionClient_updateForeignDatabaseWithValuesFromPlaybackPositionEntity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "[%{publie}@ updateForeignDatabaseWithValuesFromPlaybackPositionEntity:] Failed to get remote object proxy. error=%{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __125__ICPlaybackPositionClient_getLocalPlaybackPositionForEntityIdentifiers_forDomain_fromLibraryWithIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "[%{publie}@ getLocalPlaybackPositionForEntityIdentifiers:] Failed to get remote object proxy. error=%{public}@", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v6 + 16))(v6, 0, v3, 0);

}

void __125__ICPlaybackPositionClient_getLocalPlaybackPositionForEntityIdentifiers_forDomain_fromLibraryWithIdentifier_completionBlock___block_invoke_6(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = a1[4];
      v12 = objc_msgSend(v8, "count");
      v13 = a1[5];
      v14 = a1[6];
      objc_msgSend(v7, "msv_description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138544642;
      v22 = v11;
      v23 = 2048;
      v24 = v12;
      v25 = 2114;
      v26 = v13;
      v27 = 2114;
      v28 = v14;
      v29 = 1024;
      v30 = a2;
      v31 = 2114;
      v32 = v15;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "[%{public}@ getLocalPlaybackPositionForEntityIdentifiers:] Completed with %llu entities for domain %{public}@ with library (%{public}@). success=%{BOOL}u error=%{public}@", (uint8_t *)&v21, 0x3Au);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v16 = a1[4];
    v17 = objc_msgSend(v8, "count");
    v18 = a1[5];
    v19 = a1[6];
    v21 = 138544386;
    v22 = v16;
    v23 = 2048;
    v24 = v17;
    v25 = 2114;
    v26 = v18;
    v27 = 2114;
    v28 = v19;
    v29 = 1024;
    v30 = a2;
    _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@ getLocalPlaybackPositionForEntityIdentifiers:] Completed with %llu entities for domain %{public}@ with library (%{public}@). success=%{BOOL}u", (uint8_t *)&v21, 0x30u);
  }

  v20 = a1[7];
  if (v20)
    (*(void (**)(uint64_t, uint64_t, id, id))(v20 + 16))(v20, a2, v7, v8);

}

void __87__ICPlaybackPositionClient_persistPlaybackPositionEntity_isCheckpoint_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "[%{public}@ persistPlaybackPositionEntity:] Failed to get remote object proxy. error=%{public}@", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

void __87__ICPlaybackPositionClient_persistPlaybackPositionEntity_isCheckpoint_completionBlock___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "msv_description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 67109378;
      v11 = a2;
      v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "ICPlaybackPositionClient - persistPlaybackPositionEntity: Completed. success=%{BOOL}u error=%{public}@", (uint8_t *)&v10, 0x12u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 67109120;
    v11 = a2;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "ICPlaybackPositionClient - persistPlaybackPositionEntity: Completed. success=%{BOOL}u", (uint8_t *)&v10, 8u);
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);

}

void __57__ICPlaybackPositionClient_deletePlaybackPositionEntity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "[%{public}@ deletePlaybackPositionEntity:] Failed to get remote object proxy. error=%{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __84__ICPlaybackPositionClient_deletePlaybackPositionEntitiesFromLibraryWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "[%{public}@ deletePlaybackPositionEntitiesFromLibraryWithIdentifier:] Failed to get remote object proxy. error=%{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __104__ICPlaybackPositionClient_synchronizePlaybackPositionsForLibraryWithIdentifier_forDomain_isCheckpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "[%{public}@ synchronizePlaybackPositionsForLibraryWithIdentifier:] Failed to get remote object proxy. error=%{public}@", (uint8_t *)&v6, 0x16u);
  }

}

+ (id)sharedService
{
  if (sharedService_onceToken != -1)
    dispatch_once(&sharedService_onceToken, &__block_literal_global_19723);
  return (id)sharedService___sharedService;
}

void __41__ICPlaybackPositionClient_sharedService__block_invoke()
{
  ICPlaybackPositionClient *v0;
  void *v1;

  v0 = objc_alloc_init(ICPlaybackPositionClient);
  v1 = (void *)sharedService___sharedService;
  sharedService___sharedService = (uint64_t)v0;

}

@end
