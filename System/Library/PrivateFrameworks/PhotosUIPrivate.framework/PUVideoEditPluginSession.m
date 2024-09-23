@implementation PUVideoEditPluginSession

- (void)setAllowLoopingVideoExtensions:(BOOL)a3
{
  if (self->_allowLoopingVideoExtensions != a3)
  {
    self->_allowLoopingVideoExtensions = a3;
    -[PUEditPluginSession updatePluginManager](self, "updatePluginManager");
  }
}

- (unint64_t)pluginManagerMediaType
{
  if (-[PUVideoEditPluginSession allowLoopingVideoExtensions](self, "allowLoopingVideoExtensions"))
    return 3;
  else
    return 2;
}

- (id)videoDataSource
{
  void *v4;
  void *v6;

  -[PUEditPluginSession dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EECDA608) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUVideoEditPluginSession.m"), 51, CFSTR("data source must conform to PUVideoEditPluginSessionDataSource"));

  }
  return v4;
}

- (void)loadItemProviderWithSupportedAdjustmentData:(id)a3 loadHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD *v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;

  v6 = a3;
  v7 = a4;
  -[PUVideoEditPluginSession videoDataSource](self, "videoDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__100944;
  v29[4] = __Block_byref_object_dispose__100945;
  v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__100944;
  v27[4] = __Block_byref_object_dispose__100945;
  v28 = 0;
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v10 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __84__PUVideoEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke;
  v24[3] = &unk_1E58AA770;
  v26 = v29;
  v11 = v9;
  v25 = v11;
  objc_msgSend(v8, "editPluginSession:loadPlaceholderImageWithHandler:", self, v24);
  dispatch_group_enter(v11);
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __84__PUVideoEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_2;
  v21[3] = &unk_1E58AA798;
  v23 = v27;
  v12 = v11;
  v22 = v12;
  objc_msgSend(v8, "editPluginSession:loadVideoURLWithHandler:", self, v21);
  dispatch_get_global_queue(0, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __84__PUVideoEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_3;
  block[3] = &unk_1E58AA7E8;
  v19 = v27;
  v20 = v29;
  block[4] = self;
  v17 = v6;
  v18 = v7;
  v14 = v7;
  v15 = v6;
  dispatch_group_notify(v12, v13, block);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);

}

- (BOOL)allowLoopingVideoExtensions
{
  return self->_allowLoopingVideoExtensions;
}

void __84__PUVideoEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __84__PUVideoEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __84__PUVideoEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  int8x16_t v13;

  objc_msgSend(*(id *)(a1 + 32), "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isFileURL"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PLGetSandboxExtensionToken();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  v5 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  v6 = *MEMORY[0x1E0CD2240];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__PUVideoEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_4;
  v9[3] = &unk_1E58AA7C0;
  v10 = v2;
  v13 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
  v11 = *(id *)(a1 + 40);
  v12 = v4;
  v7 = v4;
  v8 = v2;
  objc_msgSend(v5, "registerItemForTypeIdentifier:loadHandler:", v6, v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __84__PUVideoEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_4(uint64_t a1, void *a2)
{
  UIImage *v3;
  void (**v4)(id, id, _QWORD);
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v3 = *(UIImage **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v4 = a2;
  UIImageJPEGRepresentation(v3, 0.899999976);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CD2198]);
  objc_msgSend(v5, "setMediaType:", objc_msgSend(*(id *)(a1 + 32), "mediaType"));
  objc_msgSend(v5, "setMediaSubtypes:", objc_msgSend(*(id *)(a1 + 32), "mediaSubtypes"));
  if (objc_msgSend(*(id *)(a1 + 32), "isAdjusted"))
  {
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 32), "mediaSubtypes");
    v8 = objc_msgSend(MEMORY[0x1E0D71880], "isHFRVideoAVAsset:", v6);
    v9 = 0x20000;
    if (!v8)
      v9 = 0;
    objc_msgSend(v5, "setMediaSubtypes:", v7 & 0xFFFFFFFFFFFDFFFFLL | v9);

  }
  objc_msgSend(v5, "setPlaybackStyle:", objc_msgSend(*(id *)(a1 + 32), "playbackStyle"));
  objc_msgSend(*(id *)(a1 + 32), "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCreationDate:", v10);

  objc_msgSend(*(id *)(a1 + 32), "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocation:", v11);

  objc_msgSend(v5, "setAdjustmentData:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setPlaceholderImageData:", v12);
  objc_msgSend(v5, "setVideoURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(v5, "setVideoPathSandboxExtensionToken:", *(_QWORD *)(a1 + 48));
  v4[2](v4, v5, 0);

}

@end
