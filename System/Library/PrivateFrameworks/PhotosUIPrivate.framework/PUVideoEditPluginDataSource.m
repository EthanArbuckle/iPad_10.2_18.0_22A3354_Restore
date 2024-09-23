@implementation PUVideoEditPluginDataSource

- (PUVideoEditPluginDataSource)init
{
  return -[PUVideoEditPluginDataSource initWithVideoAsset:](self, "initWithVideoAsset:", 0);
}

- (PUVideoEditPluginDataSource)initWithVideoAsset:(id)a3
{
  id v5;
  PUVideoEditPluginDataSource *v6;
  PUVideoEditPluginDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUVideoEditPluginDataSource;
  v6 = -[PUVideoEditPluginDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_videoAsset, a3);
    -[PUVideoEditPluginDataSource setAllowsRevertInSession:](v7, "setAllowsRevertInSession:", 0);
  }

  return v7;
}

- (void)editPluginSession:(id)a3 loadAdjustmentDataWithHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  -[PUVideoEditPluginDataSource videoAsset](self, "videoAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v7, "setVersion:", 16);
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__PUVideoEditPluginDataSource_editPluginSession_loadAdjustmentDataWithHandler___block_invoke;
  v12[3] = &unk_1E58AA608;
  v13 = v5;
  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v11 = v5;
  objc_msgSend(v8, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v6, 0, v7, v12, v9, v10);

}

- (void)editPluginSession:(id)a3 loadPlaceholderImageWithHandler:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v9 = fmax(v7, v8);
  objc_msgSend(v6, "scale");
  v11 = v10 * v9;
  v12 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v12, "setResizeMode:", 1);
  objc_msgSend(v12, "setDeliveryMode:", 1);
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUVideoEditPluginDataSource videoAsset](self, "videoAsset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__PUVideoEditPluginDataSource_editPluginSession_loadPlaceholderImageWithHandler___block_invoke;
  v16[3] = &unk_1E58AA608;
  v17 = v5;
  v15 = v5;
  objc_msgSend(v13, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v14, 0, v12, v16, v11, v11);

}

- (void)editPluginSession:(id)a3 loadVideoURLWithHandler:(id)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  SEL v19;
  char v20;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUVideoEditPluginDataSource.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("loadHandler"));

  }
  v9 = objc_alloc_init(MEMORY[0x1E0CD1808]);
  v10 = objc_msgSend(v7, "adjustmentType");
  if (v10 != 2)
  {
    v11 = v10;
    if (v10 == 1)
    {
      v12 = 1;
      goto LABEL_8;
    }
    if (v10)
    {
      v12 = 0;
      goto LABEL_10;
    }
  }
  v11 = 0;
  v12 = 0;
LABEL_8:
  objc_msgSend(v9, "setVersion:", v11);
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUVideoEditPluginDataSource videoAsset](self, "videoAsset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__PUVideoEditPluginDataSource_editPluginSession_loadVideoURLWithHandler___block_invoke;
  v17[3] = &unk_1E58AA658;
  v18 = v8;
  v19 = a2;
  v20 = v12;
  v17[4] = self;
  v15 = v8;
  objc_msgSend(v13, "requestURLForVideo:options:resultHandler:", v14, v9, v17);

}

- (void)_requestRenderedVideoForVideoURL:(id)a3 adjustmentData:(id)a4 canHandleAdjustmentData:(BOOL)a5 resultHandler:(id)a6
{
  id v10;
  void (**v11)(id, id, _QWORD);
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(id, id, _QWORD);

  v10 = a3;
  v11 = (void (**)(id, id, _QWORD))a6;
  v12 = (objc_class *)MEMORY[0x1E0D75308];
  v13 = a4;
  v14 = [v12 alloc];
  objc_msgSend(v13, "formatIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "formatVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(v14, "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", v15, v16, v17, 0, 0, 0);
  if (a5 || (objc_msgSend(v18, "isRecognizedFormat") & 1) == 0)
  {
    v11[2](v11, v10, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", v19, v18);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __117__PUVideoEditPluginDataSource__requestRenderedVideoForVideoURL_adjustmentData_canHandleAdjustmentData_resultHandler___block_invoke;
    v21[3] = &unk_1E58AA630;
    v22 = v11;
    -[PUVideoEditPluginDataSource _renderTemporaryVideoForObjectBuilder:resultHandler:](self, "_renderTemporaryVideoForObjectBuilder:resultHandler:", v20, v21);

  }
}

- (void)_renderTemporaryVideoForObjectBuilder:(id)a3 resultHandler:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = *MEMORY[0x1E0C89E98];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__PUVideoEditPluginDataSource__renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke;
  v8[3] = &unk_1E58AA680;
  v9 = v5;
  v7 = v5;
  objc_msgSend(a3, "requestExportSessionWithExportPreset:resultHandler:", v6, v8);

}

- (void)editPluginSession:(id)a3 commitContentEditingOutput:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(a3, "adjustmentType");
  if (v10 <= 2)
    objc_msgSend(v8, "setBaseVersion:", qword_1AB0F0198[v10]);
  -[PUVideoEditPluginDataSource videoAsset](self, "videoAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __98__PUVideoEditPluginDataSource_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke;
  v18[3] = &unk_1E58ABCA8;
  v19 = v11;
  v20 = v8;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __98__PUVideoEditPluginDataSource_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_2;
  v16[3] = &unk_1E58AA6A8;
  v13 = v9;
  v14 = v8;
  v15 = v11;
  objc_msgSend(v12, "performChanges:completionHandler:", v18, v16);

}

- (BOOL)editPluginSessionCanRevertToOriginal:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (-[PUVideoEditPluginDataSource allowsRevertInSession](self, "allowsRevertInSession"))
  {
    -[PUVideoEditPluginDataSource videoAsset](self, "videoAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__PUVideoEditPluginDataSource_editPluginSessionCanRevertToOriginal___block_invoke;
    v8[3] = &unk_1E58AA6D0;
    v8[4] = &v9;
    -[PUVideoEditPluginDataSource _fetchCanRevertAsset:asynchronously:handler:](self, "_fetchCanRevertAsset:asynchronously:handler:", v5, 0, v8);

  }
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)editPluginSession:(id)a3 revertToOriginalWithCompletionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  -[PUVideoEditPluginDataSource videoAsset](self, "videoAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__PUVideoEditPluginDataSource_editPluginSession_revertToOriginalWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E58ABD10;
  v13 = v6;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__PUVideoEditPluginDataSource_editPluginSession_revertToOriginalWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E58AA6A8;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "performChanges:completionHandler:", v12, v10);

}

- (void)_fetchCanRevertAsset:(id)a3 asynchronously:(BOOL)a4 handler:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD block[4];
  id v16;
  uint64_t *v17;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUVideoEditPluginDataSource.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler != NULL"));

  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v24 = objc_msgSend(v9, "hasAdjustments");
  v11 = dispatch_group_create();
  if (*((_BYTE *)v22 + 24) && objc_msgSend(v9, "isHighFrameRateVideo"))
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
    objc_msgSend(v12, "setVersion:", 16);
    dispatch_group_enter(v11);
    objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __75__PUVideoEditPluginDataSource__fetchCanRevertAsset_asynchronously_handler___block_invoke;
    v18[3] = &unk_1E58AA6F8;
    v20 = &v21;
    v19 = v11;
    objc_msgSend(v13, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v9, 0, v12, v18, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

  }
  if (v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__PUVideoEditPluginDataSource__fetchCanRevertAsset_asynchronously_handler___block_invoke_2;
    block[3] = &unk_1E58AA720;
    v16 = v10;
    v17 = &v21;
    dispatch_group_notify(v11, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    (*((void (**)(id, _QWORD))v10 + 2))(v10, *((unsigned __int8 *)v22 + 24));
  }

  _Block_object_dispose(&v21, 8);
}

- (PHAsset)videoAsset
{
  return self->_videoAsset;
}

- (void)setVideoAsset:(id)a3
{
  objc_storeStrong((id *)&self->_videoAsset, a3);
}

- (BOOL)allowsRevertInSession
{
  return self->_allowsRevertInSession;
}

- (void)setAllowsRevertInSession:(BOOL)a3
{
  self->_allowsRevertInSession = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoAsset, 0);
}

void __75__PUVideoEditPluginDataSource__fetchCanRevertAsset_asynchronously_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1820]);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D75308]);
  objc_msgSend(v9, "formatIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "formatVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", v5, v6, v7, 0, 0, 0);

  if (objc_msgSend(v8, "isRecognizedFormat"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __75__PUVideoEditPluginDataSource__fetchCanRevertAsset_asynchronously_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __87__PUVideoEditPluginDataSource_editPluginSession_revertToOriginalWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "revertAssetContentToOriginal");

}

void __87__PUVideoEditPluginDataSource_editPluginSession_revertToOriginalWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __87__PUVideoEditPluginDataSource_editPluginSession_revertToOriginalWithCompletionHandler___block_invoke_3;
    v6[3] = &unk_1E58AB968;
    v8 = v5;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __87__PUVideoEditPluginDataSource_editPluginSession_revertToOriginalWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __68__PUVideoEditPluginDataSource_editPluginSessionCanRevertToOriginal___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __98__PUVideoEditPluginDataSource_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContentEditingOutput:", *(_QWORD *)(a1 + 40));

}

void __98__PUVideoEditPluginDataSource_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __98__PUVideoEditPluginDataSource_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_3;
    v6[3] = &unk_1E58AB968;
    v8 = v5;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __98__PUVideoEditPluginDataSource_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __83__PUVideoEditPluginDataSource__renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RenderedContent-%@.MOV"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSTemporaryDirectory();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOutputFileType:", *MEMORY[0x1E0C8A2E8]);
    objc_msgSend(v3, "setOutputURL:", v9);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __83__PUVideoEditPluginDataSource__renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke_2;
    v12[3] = &unk_1E58ABAF0;
    v13 = v3;
    v10 = *(id *)(a1 + 32);
    v14 = v9;
    v15 = v10;
    v11 = v9;
    objc_msgSend(v13, "exportAsynchronouslyWithCompletionHandler:", v12);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __83__PUVideoEditPluginDataSource__renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString **v5;
  uint64_t *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 4)
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = *MEMORY[0x1E0CB28A8];
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = CFSTR("Rendering video failed");
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = (const __CFString **)v12;
    v6 = &v11;
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "status") != 5)
      goto LABEL_7;
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = *MEMORY[0x1E0CB28A8];
    v9 = *MEMORY[0x1E0CB2D50];
    v10 = CFSTR("Rendering video cancelled");
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = &v10;
    v6 = &v9;
  }
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 2047, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    return;
  }
LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __117__PUVideoEditPluginDataSource__requestRenderedVideoForVideoURL_adjustmentData_canHandleAdjustmentData_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__PUVideoEditPluginDataSource_editPluginSession_loadVideoURLWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("PUVideoEditPluginDataSource.m"), 82, CFSTR("missing URL"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1820]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(unsigned __int8 *)(a1 + 56);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PUVideoEditPluginDataSource_editPluginSession_loadVideoURLWithHandler___block_invoke_2;
  v11[3] = &unk_1E58AA630;
  v9 = *(void **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v9, "_requestRenderedVideoForVideoURL:adjustmentData:canHandleAdjustmentData:resultHandler:", v5, v7, v8, v11);

}

void __73__PUVideoEditPluginDataSource_editPluginSession_loadVideoURLWithHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (a3)
    NSLog(CFSTR("Error: %@"), a3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __81__PUVideoEditPluginDataSource_editPluginSession_loadPlaceholderImageWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__PUVideoEditPluginDataSource_editPluginSession_loadAdjustmentDataWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1820]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
