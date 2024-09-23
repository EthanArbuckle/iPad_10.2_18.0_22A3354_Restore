@implementation PUImageEditPluginSession

- (void)setAllowLivePhotoExtensions:(BOOL)a3
{
  if (self->_allowLivePhotoExtensions != a3)
  {
    self->_allowLivePhotoExtensions = a3;
    -[PUEditPluginSession updatePluginManager](self, "updatePluginManager");
  }
}

- (void)setAllowSpatialPhotoExtensions:(BOOL)a3
{
  if (self->_allowSpatialPhotoExtensions != a3)
  {
    self->_allowSpatialPhotoExtensions = a3;
    -[PUEditPluginSession updatePluginManager](self, "updatePluginManager");
  }
}

- (unint64_t)pluginManagerMediaType
{
  return -[PUImageEditPluginSession allowLivePhotoExtensions](self, "allowLivePhotoExtensions");
}

- (id)imageDataSource
{
  void *v4;
  void *v6;

  -[PUEditPluginSession dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EECD9C00) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImageEditPluginSession.m"), 53, CFSTR("data source must conform to PUImageEditPluginSessionDataSource"));

  }
  return v4;
}

- (void)shouldLaunchPlugin:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;

  v6 = a3;
  v7 = a4;
  if (-[PUImageEditPluginSession allowSpatialPhotoExtensions](self, "allowSpatialPhotoExtensions"))
  {
    PULocalizedString(CFSTR("PLUGIN_DISABLES_SPATIAL_PHOTO_TITLE_FORMAT"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    PUStringWithValidatedFormat();
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0DC3450];
    PULocalizedString(CFSTR("PLUGIN_DISABLES_SPATIAL_PHOTO_MESSAGE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v38, v9, 1, v36);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("OK"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __58__PUImageEditPluginSession_shouldLaunchPlugin_completion___block_invoke;
    v47[3] = &unk_1E58AB6C0;
    v14 = v7;
    v15 = v7;
    v48 = v15;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v47);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v16);

    v17 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("CANCEL"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v13;
    v45[1] = 3221225472;
    v45[2] = __58__PUImageEditPluginSession_shouldLaunchPlugin_completion___block_invoke_2;
    v45[3] = &unk_1E58AB6C0;
    v19 = v15;
    v7 = v14;
    v46 = v19;
    objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, v45);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v20);

    -[PUEditPluginSession presentAlertController:](self, "presentAlertController:", v10);
    v21 = v48;
LABEL_7:

    goto LABEL_8;
  }
  if (-[PUImageEditPluginSession allowLivePhotoExtensions](self, "allowLivePhotoExtensions"))
  {
    objc_msgSend(v6, "extension");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "pu_supportsMediaType:", 1);

    if ((v23 & 1) == 0)
    {
      PULocalizedString(CFSTR("PLUGIN_DISABLES_LIVE_PHOTO_TITLE_FORMAT"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "title");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      PUStringWithValidatedFormat();
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)MEMORY[0x1E0DC3450];
      PULocalizedString(CFSTR("PLUGIN_DISABLES_LIVE_PHOTO_MESSAGE"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "alertControllerWithTitle:message:preferredStyle:", v38, v25, 1, v37);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = (void *)MEMORY[0x1E0DC3448];
      PULocalizedString(CFSTR("OK"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = MEMORY[0x1E0C809B0];
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __58__PUImageEditPluginSession_shouldLaunchPlugin_completion___block_invoke_3;
      v43[3] = &unk_1E58AB6C0;
      v29 = v7;
      v30 = v7;
      v44 = v30;
      objc_msgSend(v26, "actionWithTitle:style:handler:", v27, 0, v43);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v31);

      v32 = (void *)MEMORY[0x1E0DC3448];
      PULocalizedString(CFSTR("CANCEL"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v28;
      v41[1] = 3221225472;
      v41[2] = __58__PUImageEditPluginSession_shouldLaunchPlugin_completion___block_invoke_4;
      v41[3] = &unk_1E58AB6C0;
      v34 = v30;
      v7 = v29;
      v42 = v34;
      objc_msgSend(v32, "actionWithTitle:style:handler:", v33, 1, v41);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v35);

      -[PUEditPluginSession presentAlertController:](self, "presentAlertController:", v10);
      v21 = v44;
      goto LABEL_7;
    }
  }
  v40.receiver = self;
  v40.super_class = (Class)PUImageEditPluginSession;
  -[PUEditPluginSession shouldLaunchPlugin:completion:](&v40, sel_shouldLaunchPlugin_completion_, v6, v7);
LABEL_8:

}

- (void)loadItemProviderWithSupportedAdjustmentData:(id)a3 loadHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  PUImageEditPluginSession *v26;
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD v32[4];
  NSObject *v33;
  _QWORD *v34;
  _QWORD v35[4];
  NSObject *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD v39[4];
  NSObject *v40;
  _QWORD *v41;
  _QWORD v42[4];
  __int128 v43;
  uint64_t v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[5];
  id v50;

  v6 = a3;
  v7 = a4;
  -[PUImageEditPluginSession imageDataSource](self, "imageDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUEditPluginSession asset](self, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__33937;
  v49[4] = __Block_byref_object_dispose__33938;
  v50 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__33937;
  v47[4] = __Block_byref_object_dispose__33938;
  v48 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__33937;
  v45[4] = __Block_byref_object_dispose__33938;
  v46 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3810000000;
  v42[3] = &unk_1AB197D4B;
  v43 = *MEMORY[0x1E0CA2E18];
  v44 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v11 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke;
  v39[3] = &unk_1E58AA770;
  v41 = v49;
  v12 = v10;
  v40 = v12;
  objc_msgSend(v8, "editPluginSession:loadPlaceholderImageWithHandler:", self, v39);
  -[PUEditPluginSession currentPlugin](self, "currentPlugin");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "extension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "pu_supportsMediaType:", 1);

  if (v15 && -[PUImageEditPluginSession allowLivePhotoExtensions](self, "allowLivePhotoExtensions"))
  {
    dispatch_group_enter(v12);
    v35[0] = v11;
    v35[1] = 3221225472;
    v35[2] = __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_2;
    v35[3] = &unk_1E589FF00;
    v37 = v45;
    v38 = v42;
    v36 = v12;
    objc_msgSend(v8, "editPluginSession:loadVideoComplementURLWithHandler:", self, v35);

  }
  dispatch_group_enter(v12);
  v32[0] = v11;
  v32[1] = 3221225472;
  v32[2] = __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_3;
  v32[3] = &unk_1E58AA770;
  v34 = v47;
  v16 = v12;
  v33 = v16;
  objc_msgSend(v8, "editPluginSession:loadDisplaySizeImageWithHandler:", self, v32);
  dispatch_get_global_queue(0, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_4;
  v22[3] = &unk_1E589FF78;
  v29 = v42;
  v30 = v49;
  v31 = v47;
  v23 = v9;
  v24 = v6;
  v25 = v8;
  v26 = self;
  v27 = v7;
  v28 = v45;
  v18 = v7;
  v19 = v8;
  v20 = v6;
  v21 = v9;
  dispatch_group_notify(v16, v17, v22);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v49, 8);

}

- (BOOL)allowLivePhotoExtensions
{
  return self->_allowLivePhotoExtensions;
}

- (BOOL)allowSpatialPhotoExtensions
{
  return self->_allowSpatialPhotoExtensions;
}

void __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_2(uint64_t a1, void *a2, __int128 *a3)
{
  uint64_t v6;
  __int128 v7;
  id v8;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v8 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *a3;
  *(_QWORD *)(v6 + 48) = *((_QWORD *)a3 + 2);
  *(_OWORD *)(v6 + 32) = v7;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_4(uint64_t a1)
{
  id v2;
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  char v20;

  v2 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "isFileURL")
    && (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 44) & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PLGetSandboxExtensionToken();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = 1;
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  v6 = *MEMORY[0x1E0CD2240];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_5;
  v12[3] = &unk_1E589FF50;
  v18 = *(_OWORD *)(a1 + 88);
  v13 = *(id *)(a1 + 32);
  v20 = v3;
  v14 = *(id *)(a1 + 40);
  v15 = v4;
  v19 = *(_OWORD *)(a1 + 72);
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v16 = v7;
  v17 = v8;
  v9 = v4;
  objc_msgSend(v2, "registerItemForTypeIdentifier:loadHandler:", v6, v12);
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v2, v10, v11);

}

void __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 v19;
  uint64_t v20;

  v3 = a2;
  UIImageJPEGRepresentation(*(UIImage **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), 0.899999976);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIImageJPEGRepresentation(*(UIImage **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), 0.899999976);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "mediaSubtypes") | (8 * *(unsigned __int8 *)(a1 + 104));
  v7 = objc_alloc_init(MEMORY[0x1E0CD2198]);
  objc_msgSend(v7, "setMediaType:", 1);
  objc_msgSend(v7, "setMediaSubtypes:", v6);
  objc_msgSend(v7, "setPlaybackStyle:", objc_msgSend(*(id *)(a1 + 32), "playbackStyle"));
  objc_msgSend(*(id *)(a1 + 32), "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCreationDate:", v8);

  objc_msgSend(*(id *)(a1 + 32), "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocation:", v9);

  objc_msgSend(v7, "setAdjustmentData:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "setPlaceholderImageData:", v4);
  objc_msgSend(v7, "setDisplaySizeImageData:", v5);
  objc_msgSend(v7, "setVideoURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
  objc_msgSend(v7, "setVideoPathSandboxExtensionToken:", *(_QWORD *)(a1 + 48));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v19 = *(_OWORD *)(v10 + 32);
  v20 = *(_QWORD *)(v10 + 48);
  objc_msgSend(v7, "setLivePhotoStillDisplayTime:", &v19);
  objc_msgSend(*(id *)(a1 + 32), "accessibilityDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityDescription:", v11);

  v13 = *(void **)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 64);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_6;
  v16[3] = &unk_1E589FF28;
  v17 = v7;
  v18 = v3;
  v14 = v3;
  v15 = v7;
  objc_msgSend(v13, "editPluginSession:loadFullSizeImageWithHandler:", v12, v16);

}

uint64_t __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;

  v6 = a4;
  v7 = a2;
  v8 = PLExifOrientationFromImageOrientation();
  objc_msgSend(*(id *)(a1 + 32), "setFullSizeImageURL:", v7);

  objc_msgSend(*(id *)(a1 + 32), "setFullSizeImageURLSandboxExtensionToken:", v6);
  objc_msgSend(*(id *)(a1 + 32), "setFullSizeImageExifOrientation:", v8);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __58__PUImageEditPluginSession_shouldLaunchPlugin_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__PUImageEditPluginSession_shouldLaunchPlugin_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__PUImageEditPluginSession_shouldLaunchPlugin_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__PUImageEditPluginSession_shouldLaunchPlugin_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
