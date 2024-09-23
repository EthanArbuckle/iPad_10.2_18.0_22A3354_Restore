@implementation ICCloudContentTasteRequestListener

- (id)_init
{
  ICCloudContentTasteRequestListener *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICCloudContentTasteRequestListener;
  v2 = -[ICCloudContentTasteRequestListener init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesCloud.ICCloudContentTasteRequestListener.MediaContentTaste", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    -[ICCloudContentTasteRequestListener _setupContentTasteServiceConnection](v2, "_setupContentTasteServiceConnection");
  }
  return v2;
}

- (ICCloudContentTasteRequestListener)init
{
  NSObject *v3;
  uint8_t v5[16];

  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "-init is not supported - use sharedCloudContentTasteRequestListener", v5, 2u);
  }

  return 0;
}

- (void)setContentTaste:(int64_t)a3 forMediaItem:(int64_t)a4 storeIdentifier:(int64_t)a5 configuration:(id)a6 timeStamp:(id)a7 withCompletionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  NSObject *accessQueue;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  int64_t v24;
  int64_t v25;

  v13 = a6;
  v14 = a7;
  v15 = a8;
  accessQueue = self->_accessQueue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __129__ICCloudContentTasteRequestListener_setContentTaste_forMediaItem_storeIdentifier_configuration_timeStamp_withCompletionHandler___block_invoke;
  v20[3] = &unk_1E438E3C0;
  v24 = a5;
  v25 = a3;
  v20[4] = self;
  v21 = v13;
  v22 = v14;
  v23 = v15;
  v17 = v14;
  v18 = v13;
  v19 = v15;
  dispatch_async(accessQueue, v20);

}

- (void)setContentTaste:(int64_t)a3 forMediaItem:(int64_t)a4 storeIdentifier:(int64_t)a5 persistentID:(int64_t)a6 timeStamp:(id)a7 configuration:(id)a8 withCompletionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  NSObject *accessQueue;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  int64_t v26;
  int64_t v27;
  int64_t v28;
  int64_t v29;

  v15 = a7;
  v16 = a8;
  v17 = a9;
  accessQueue = self->_accessQueue;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __142__ICCloudContentTasteRequestListener_setContentTaste_forMediaItem_storeIdentifier_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke;
  v22[3] = &unk_1E438E3E8;
  v26 = a5;
  v27 = a3;
  v28 = a4;
  v29 = a6;
  v22[4] = self;
  v23 = v15;
  v24 = v16;
  v25 = v17;
  v19 = v16;
  v20 = v15;
  v21 = v17;
  dispatch_async(accessQueue, v22);

}

- (void)setContentTaste:(int64_t)a3 forPlaylistGlobalID:(id)a4 configuration:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *accessQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__ICCloudContentTasteRequestListener_setContentTaste_forPlaylistGlobalID_configuration_withCompletionHandler___block_invoke;
  block[3] = &unk_1E438E410;
  block[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a3;
  v19 = v11;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  dispatch_async(accessQueue, block);

}

- (void)setContentTaste:(int64_t)a3 forPlaylistGlobalID:(id)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 configuration:(id)a7 withCompletionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *accessQueue;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  int64_t v28;
  int64_t v29;

  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __133__ICCloudContentTasteRequestListener_setContentTaste_forPlaylistGlobalID_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke;
  block[3] = &unk_1E438E460;
  block[4] = self;
  v24 = v14;
  v27 = v17;
  v28 = a3;
  v29 = a5;
  v25 = v15;
  v26 = v16;
  v19 = v16;
  v20 = v15;
  v21 = v17;
  v22 = v14;
  dispatch_async(accessQueue, block);

}

- (void)setContentTaste:(int64_t)a3 forAlbumStoreID:(int64_t)a4 configuration:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *accessQueue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  int64_t v19;

  v10 = a5;
  v11 = a6;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__ICCloudContentTasteRequestListener_setContentTaste_forAlbumStoreID_configuration_withCompletionHandler___block_invoke;
  block[3] = &unk_1E438E488;
  v17 = v11;
  v18 = a4;
  v19 = a3;
  block[4] = self;
  v16 = v10;
  v13 = v10;
  v14 = v11;
  dispatch_async(accessQueue, block);

}

- (void)setContentTaste:(int64_t)a3 forAlbumStoreID:(int64_t)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 configuration:(id)a7 withCompletionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *accessQueue;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  int64_t v25;
  int64_t v26;
  int64_t v27;

  v14 = a6;
  v15 = a7;
  v16 = a8;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __129__ICCloudContentTasteRequestListener_setContentTaste_forAlbumStoreID_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke;
  block[3] = &unk_1E438E4D8;
  v25 = a4;
  v26 = a3;
  v27 = a5;
  block[4] = self;
  v22 = v14;
  v23 = v15;
  v24 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v16;
  dispatch_async(accessQueue, block);

}

- (void)setContentTaste:(int64_t)a3 forArtistStoreID:(int64_t)a4 configuration:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *accessQueue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  int64_t v19;

  v10 = a5;
  v11 = a6;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__ICCloudContentTasteRequestListener_setContentTaste_forArtistStoreID_configuration_withCompletionHandler___block_invoke;
  block[3] = &unk_1E438E488;
  v17 = v11;
  v18 = a4;
  v19 = a3;
  block[4] = self;
  v16 = v10;
  v13 = v10;
  v14 = v11;
  dispatch_async(accessQueue, block);

}

- (void)setContentTaste:(int64_t)a3 forArtistStoreID:(int64_t)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 configuration:(id)a7 withCompletionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *accessQueue;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  int64_t v25;
  int64_t v26;
  int64_t v27;

  v14 = a6;
  v15 = a7;
  v16 = a8;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __130__ICCloudContentTasteRequestListener_setContentTaste_forArtistStoreID_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke;
  block[3] = &unk_1E438E4D8;
  v25 = a4;
  v26 = a3;
  v27 = a5;
  block[4] = self;
  v22 = v14;
  v23 = v15;
  v24 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v16;
  dispatch_async(accessQueue, block);

}

- (void)updateContentTasteForMediaItemsAndInvalidateLocalCache:(BOOL)a3 configuration:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *accessQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  accessQueue = self->_accessQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __129__ICCloudContentTasteRequestListener_updateContentTasteForMediaItemsAndInvalidateLocalCache_configuration_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E4390B20;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v13[4] = self;
  v11 = v8;
  v12 = v9;
  dispatch_async(accessQueue, v13);

}

- (void)setContentTaste:(int64_t)a3 forMediaItem:(int64_t)a4 storeIdentifier:(int64_t)a5 timeStamp:(id)a6 withCompletionHandler:(id)a7
{
  id v12;
  id v13;
  ICConnectionConfiguration *v14;
  void *v15;
  void *v16;
  ICConnectionConfiguration *v17;

  v12 = a7;
  v13 = a6;
  v14 = [ICConnectionConfiguration alloc];
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[ICConnectionConfiguration initWithUserIdentity:userIdentityStore:](v14, "initWithUserIdentity:userIdentityStore:", v15, v16);

  -[ICCloudContentTasteRequestListener setContentTaste:forMediaItem:storeIdentifier:configuration:timeStamp:withCompletionHandler:](self, "setContentTaste:forMediaItem:storeIdentifier:configuration:timeStamp:withCompletionHandler:", a3, a4, a5, v17, v13, v12);
}

- (void)setContentTaste:(int64_t)a3 forPlaylistGlobalID:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  ICConnectionConfiguration *v10;
  void *v11;
  void *v12;
  ICConnectionConfiguration *v13;

  v8 = a5;
  v9 = a4;
  v10 = [ICConnectionConfiguration alloc];
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ICConnectionConfiguration initWithUserIdentity:userIdentityStore:](v10, "initWithUserIdentity:userIdentityStore:", v11, v12);

  -[ICCloudContentTasteRequestListener setContentTaste:forPlaylistGlobalID:configuration:withCompletionHandler:](self, "setContentTaste:forPlaylistGlobalID:configuration:withCompletionHandler:", a3, v9, v13, v8);
}

- (void)setContentTaste:(int64_t)a3 forAlbumStoreID:(int64_t)a4 withCompletionHandler:(id)a5
{
  id v8;
  ICConnectionConfiguration *v9;
  void *v10;
  void *v11;
  ICConnectionConfiguration *v12;

  v8 = a5;
  v9 = [ICConnectionConfiguration alloc];
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ICConnectionConfiguration initWithUserIdentity:userIdentityStore:](v9, "initWithUserIdentity:userIdentityStore:", v10, v11);

  -[ICCloudContentTasteRequestListener setContentTaste:forAlbumStoreID:configuration:withCompletionHandler:](self, "setContentTaste:forAlbumStoreID:configuration:withCompletionHandler:", a3, a4, v12, v8);
}

- (void)setContentTaste:(int64_t)a3 forArtistStoreID:(int64_t)a4 withCompletionHandler:(id)a5
{
  id v8;
  ICConnectionConfiguration *v9;
  void *v10;
  void *v11;
  ICConnectionConfiguration *v12;

  v8 = a5;
  v9 = [ICConnectionConfiguration alloc];
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ICConnectionConfiguration initWithUserIdentity:userIdentityStore:](v9, "initWithUserIdentity:userIdentityStore:", v10, v11);

  -[ICCloudContentTasteRequestListener setContentTaste:forArtistStoreID:configuration:withCompletionHandler:](self, "setContentTaste:forArtistStoreID:configuration:withCompletionHandler:", a3, a4, v12, v8);
}

- (void)updateContentTasteForMediaItemsAndInvalidateLocalCache:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  ICConnectionConfiguration *v7;
  void *v8;
  void *v9;
  ICConnectionConfiguration *v10;

  v4 = a3;
  v6 = a4;
  v7 = [ICConnectionConfiguration alloc];
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ICConnectionConfiguration initWithUserIdentity:userIdentityStore:](v7, "initWithUserIdentity:userIdentityStore:", v8, v9);

  -[ICCloudContentTasteRequestListener updateContentTasteForMediaItemsAndInvalidateLocalCache:configuration:withCompletionHandler:](self, "updateContentTasteForMediaItemsAndInvalidateLocalCache:configuration:withCompletionHandler:", v4, v10, v6);
}

- (void)_setupContentTasteServiceConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcConnection;
  id v5;

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.itunescloud.contenttaste"), 0);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v3;

  -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5DDC08);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v5);
  -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_81);
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", &__block_literal_global_83);
  -[NSXPCConnection resume](self->_xpcConnection, "resume");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __73__ICCloudContentTasteRequestListener__setupContentTasteServiceConnection__block_invoke_82()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A03E3000, v0, OS_LOG_TYPE_DEFAULT, "Connection to media content taste service invalidated", v1, 2u);
  }

}

void __73__ICCloudContentTasteRequestListener__setupContentTasteServiceConnection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A03E3000, v0, OS_LOG_TYPE_DEFAULT, "Connection to media content taste service interrupted", v1, 2u);
  }

}

void __129__ICCloudContentTasteRequestListener_updateContentTasteForMediaItemsAndInvalidateLocalCache_configuration_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __129__ICCloudContentTasteRequestListener_updateContentTasteForMediaItemsAndInvalidateLocalCache_configuration_withCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E438E500;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned __int8 *)(a1 + 56);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __129__ICCloudContentTasteRequestListener_updateContentTasteForMediaItemsAndInvalidateLocalCache_configuration_withCompletionHandler___block_invoke_11;
  v7[3] = &unk_1E438E500;
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v4, "updateContentTasteForMediaItemsAndInvalidateLocalCache:configuration:withCompletionHandler:", v5, v6, v7);

}

void __129__ICCloudContentTasteRequestListener_updateContentTasteForMediaItemsAndInvalidateLocalCache_configuration_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Error %{public}@ setting running content taste operation", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __129__ICCloudContentTasteRequestListener_updateContentTasteForMediaItemsAndInvalidateLocalCache_configuration_withCompletionHandler___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Finished running content taste update operation with error %{public}@.", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __130__ICCloudContentTasteRequestListener_setContentTaste_forArtistStoreID_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v16[2] = __130__ICCloudContentTasteRequestListener_setContentTaste_forArtistStoreID_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke_2;
  v16[3] = &unk_1E438E398;
  v3 = *(void **)(a1 + 56);
  v18 = *(_QWORD *)(a1 + 64);
  v4 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v17 = v3;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 80);
  v9 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __130__ICCloudContentTasteRequestListener_setContentTaste_forArtistStoreID_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke_10;
  v11[3] = &unk_1E438E4B0;
  v14 = v7;
  v15 = v8;
  v12 = v9;
  v13 = *(id *)(a1 + 56);
  objc_msgSend(v5, "setContentTaste:forArtistStoreID:persistentID:timeStamp:configuration:withCompletionHandler:", v6, v7, v8, v12, v10, v11);

}

void __130__ICCloudContentTasteRequestListener_setContentTaste_forArtistStoreID_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v3;
    v9 = 2048;
    v10 = v5;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Error %{public}@ setting content taste type on artist %lld.", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __130__ICCloudContentTasteRequestListener_setContentTaste_forArtistStoreID_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke_10(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[6];
    v6 = a1[7];
    v7 = a1[4];
    v9 = 134218754;
    v10 = v5;
    v11 = 2048;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Set content taste type on artist storeID %lld, persistentID %lld, timeStamp %{public}@ with error %{public}@.", (uint8_t *)&v9, 0x2Au);
  }

  v8 = a1[5];
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

void __107__ICCloudContentTasteRequestListener_setContentTaste_forArtistStoreID_configuration_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v4 = *(void **)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 56);
  v12[2] = __107__ICCloudContentTasteRequestListener_setContentTaste_forArtistStoreID_configuration_withCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E438E398;
  v13 = v4;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __107__ICCloudContentTasteRequestListener_setContentTaste_forArtistStoreID_configuration_withCompletionHandler___block_invoke_9;
  v9[3] = &unk_1E438E398;
  v11 = v7;
  v8 = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v5, "setContentTaste:forArtistStoreID:configuration:withCompletionHandler:", v6, v7, v8, v9);

}

void __107__ICCloudContentTasteRequestListener_setContentTaste_forArtistStoreID_configuration_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v3;
    v9 = 2048;
    v10 = v5;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Error %{public}@ setting content taste type on artist %lld.", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __107__ICCloudContentTasteRequestListener_setContentTaste_forArtistStoreID_configuration_withCompletionHandler___block_invoke_9(uint64_t a1, void *a2)
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
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 134218242;
    v8 = v5;
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Set content taste type on artist %lld with error %{public}@.", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __129__ICCloudContentTasteRequestListener_setContentTaste_forAlbumStoreID_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v16[2] = __129__ICCloudContentTasteRequestListener_setContentTaste_forAlbumStoreID_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke_2;
  v16[3] = &unk_1E438E398;
  v3 = *(void **)(a1 + 56);
  v18 = *(_QWORD *)(a1 + 64);
  v4 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v17 = v3;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 80);
  v9 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __129__ICCloudContentTasteRequestListener_setContentTaste_forAlbumStoreID_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke_8;
  v11[3] = &unk_1E438E4B0;
  v14 = v7;
  v15 = v8;
  v12 = v9;
  v13 = *(id *)(a1 + 56);
  objc_msgSend(v5, "setContentTaste:forAlbumStoreID:persistentID:timeStamp:configuration:withCompletionHandler:", v6, v7, v8, v12, v10, v11);

}

void __129__ICCloudContentTasteRequestListener_setContentTaste_forAlbumStoreID_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v3;
    v9 = 2048;
    v10 = v5;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Error %{public}@ setting content taste type on album %lld.", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __129__ICCloudContentTasteRequestListener_setContentTaste_forAlbumStoreID_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke_8(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[6];
    v6 = a1[7];
    v7 = a1[4];
    v9 = 134218754;
    v10 = v5;
    v11 = 2048;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Set content taste type on album storeID %lld, persistentID %lld, timeStamp %{public}@ with error %{public}@.", (uint8_t *)&v9, 0x2Au);
  }

  v8 = a1[5];
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

void __106__ICCloudContentTasteRequestListener_setContentTaste_forAlbumStoreID_configuration_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v4 = *(void **)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 56);
  v12[2] = __106__ICCloudContentTasteRequestListener_setContentTaste_forAlbumStoreID_configuration_withCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E438E398;
  v13 = v4;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __106__ICCloudContentTasteRequestListener_setContentTaste_forAlbumStoreID_configuration_withCompletionHandler___block_invoke_7;
  v9[3] = &unk_1E438E398;
  v11 = v7;
  v8 = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v5, "setContentTaste:forAlbumStoreID:configuration:withCompletionHandler:", v6, v7, v8, v9);

}

void __106__ICCloudContentTasteRequestListener_setContentTaste_forAlbumStoreID_configuration_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v3;
    v9 = 2048;
    v10 = v5;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Error %{public}@ setting content taste type on album %lld.", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __106__ICCloudContentTasteRequestListener_setContentTaste_forAlbumStoreID_configuration_withCompletionHandler___block_invoke_7(uint64_t a1, void *a2)
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
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 134218242;
    v8 = v5;
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Set content taste type on album %lld with error %{public}@.", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __133__ICCloudContentTasteRequestListener_setContentTaste_forPlaylistGlobalID_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __133__ICCloudContentTasteRequestListener_setContentTaste_forPlaylistGlobalID_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke_2;
  v17[3] = &unk_1E43915E8;
  v18 = v2;
  v19 = *(id *)(a1 + 64);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __133__ICCloudContentTasteRequestListener_setContentTaste_forPlaylistGlobalID_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke_6;
  v13[3] = &unk_1E438E438;
  v11 = v8;
  v12 = *(_QWORD *)(a1 + 80);
  v14 = v11;
  v16 = v12;
  v15 = *(id *)(a1 + 64);
  objc_msgSend(v5, "setContentTaste:forPlaylistGlobalID:persistentID:timeStamp:configuration:withCompletionHandler:", v6, v11, v7, v9, v10, v13);

}

void __133__ICCloudContentTasteRequestListener_setContentTaste_forPlaylistGlobalID_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v3;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Error %{public}@ setting content taste type on playlist %{public}@", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __133__ICCloudContentTasteRequestListener_setContentTaste_forPlaylistGlobalID_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke_6(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[6];
    v8 = 138543874;
    v9 = v5;
    v10 = 2048;
    v11 = v6;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Set content taste type on global playlist %{public}@, persistentID %lld with error %{public}@.", (uint8_t *)&v8, 0x20u);
  }

  v7 = a1[5];
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

void __110__ICCloudContentTasteRequestListener_setContentTaste_forPlaylistGlobalID_configuration_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __110__ICCloudContentTasteRequestListener_setContentTaste_forPlaylistGlobalID_configuration_withCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E43915E8;
  v13 = v2;
  v14 = *(id *)(a1 + 56);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __110__ICCloudContentTasteRequestListener_setContentTaste_forPlaylistGlobalID_configuration_withCompletionHandler___block_invoke_5;
  v9[3] = &unk_1E43915E8;
  v10 = v7;
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v5, "setContentTaste:forPlaylistGlobalID:configuration:withCompletionHandler:", v6, v10, v8, v9);

}

void __110__ICCloudContentTasteRequestListener_setContentTaste_forPlaylistGlobalID_configuration_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v3;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Error %{public}@ setting content taste type on playlist %{public}@", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __110__ICCloudContentTasteRequestListener_setContentTaste_forPlaylistGlobalID_configuration_withCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
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
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Set content taste type on global playlist %{public}@ with error %{public}@.", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __142__ICCloudContentTasteRequestListener_setContentTaste_forMediaItem_storeIdentifier_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  v2 = *(void **)(a1[4] + 16);
  v3 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v4 = (void *)a1[7];
  v17 = a1[8];
  v15[2] = __142__ICCloudContentTasteRequestListener_setContentTaste_forMediaItem_storeIdentifier_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke_2;
  v15[3] = &unk_1E438E398;
  v16 = v4;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1[9];
  v7 = a1[10];
  v8 = a1[11];
  v9 = a1[5];
  v10 = a1[6];
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __142__ICCloudContentTasteRequestListener_setContentTaste_forMediaItem_storeIdentifier_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke_4;
  v12[3] = &unk_1E438E398;
  v11 = (void *)a1[7];
  v14 = a1[8];
  v13 = v11;
  objc_msgSend(v5, "setContentTaste:forMediaItem:storeIdentifier:persistentID:timeStamp:configuration:withCompletionHandler:", v6, v7, v14, v8, v9, v10, v12);

}

void __142__ICCloudContentTasteRequestListener_setContentTaste_forMediaItem_storeIdentifier_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v3;
    v9 = 2048;
    v10 = v5;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Error %{public}@ setting content taste type on item %lld.", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __142__ICCloudContentTasteRequestListener_setContentTaste_forMediaItem_storeIdentifier_persistentID_timeStamp_configuration_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
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
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 134218242;
    v8 = v5;
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Set content taste type on media item with storeID %lld with error %{public}@.", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __129__ICCloudContentTasteRequestListener_setContentTaste_forMediaItem_storeIdentifier_configuration_timeStamp_withCompletionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v2 = *(void **)(a1[4] + 16);
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v4 = (void *)a1[7];
  v15 = a1[8];
  v13[2] = __129__ICCloudContentTasteRequestListener_setContentTaste_forMediaItem_storeIdentifier_configuration_timeStamp_withCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E438E398;
  v14 = v4;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1[5];
  v7 = a1[6];
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __129__ICCloudContentTasteRequestListener_setContentTaste_forMediaItem_storeIdentifier_configuration_timeStamp_withCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E438E398;
  v8 = a1[9];
  v9 = (void *)a1[7];
  v12 = a1[8];
  v11 = v9;
  objc_msgSend(v5, "setContentTaste:forMediaItem:storeIdentifier:configuration:timeStamp:withCompletionHandler:", v8, 0, v12, v6, v7, v10);

}

void __129__ICCloudContentTasteRequestListener_setContentTaste_forMediaItem_storeIdentifier_configuration_timeStamp_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v3;
    v9 = 2048;
    v10 = v5;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Error %{public}@ setting content taste type on item %lld.", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __129__ICCloudContentTasteRequestListener_setContentTaste_forMediaItem_storeIdentifier_configuration_timeStamp_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
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
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 134218242;
    v8 = v5;
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Set content taste type on item %lld with error %{public}@.", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

+ (id)sharedCloudContentTasteRequestListener
{
  if (sharedCloudContentTasteRequestListener_onceToken != -1)
    dispatch_once(&sharedCloudContentTasteRequestListener_onceToken, &__block_literal_global_26055);
  return (id)sharedCloudContentTasteRequestListener__sharedInstance;
}

void __76__ICCloudContentTasteRequestListener_sharedCloudContentTasteRequestListener__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ICCloudContentTasteRequestListener _init]([ICCloudContentTasteRequestListener alloc], "_init");
  v1 = (void *)sharedCloudContentTasteRequestListener__sharedInstance;
  sharedCloudContentTasteRequestListener__sharedInstance = (uint64_t)v0;

}

@end
