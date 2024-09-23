@implementation PUPickerOnDemandProcessor

- (PUPickerOnDemandProcessor)initWithConfiguration:(id)a3
{
  id v5;
  PUPickerOnDemandProcessor *v6;
  uint64_t v7;
  VCPMediaAnalysisService *service;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUPickerOnDemandProcessor;
  v6 = -[PUPickerOnDemandProcessor init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D475C0], "analysisService");
    v7 = objc_claimAutoreleasedReturnValue();
    service = v6->_service;
    v6->_service = (VCPMediaAnalysisService *)v7;

    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PUPickerOnDemandProcessor service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRequest:", -[PUPickerOnDemandProcessor stickerScoringRequestID](self, "stickerScoringRequestID"));

  v4.receiver = self;
  v4.super_class = (Class)PUPickerOnDemandProcessor;
  -[PUPickerOnDemandProcessor dealloc](&v4, sel_dealloc);
}

- (void)performOnDemandProcessingWithCanDisplayUserInterfaceHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  int v10;
  void (**v11)(_QWORD);
  dispatch_time_t v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;

  v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v5 = MEMORY[0x1E0C809B0];
  v21 = 1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PUPickerOnDemandProcessor_performOnDemandProcessingWithCanDisplayUserInterfaceHandler___block_invoke;
  aBlock[3] = &unk_1E58AA720;
  v19 = v20;
  v6 = v4;
  v18 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[PUPickerOnDemandProcessor configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generatedFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsStickersFilter");

  if (v10)
  {
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __89__PUPickerOnDemandProcessor_performOnDemandProcessingWithCanDisplayUserInterfaceHandler___block_invoke_2;
    v15[3] = &unk_1E58ABAC8;
    v11 = v7;
    v16 = v11;
    -[PUPickerOnDemandProcessor _performOnDemandStaticStickerScoringProcessingForRecentAssets:](self, "_performOnDemandStaticStickerScoringProcessingForRecentAssets:", v15);
    v12 = dispatch_time(0, 1000000000);
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __89__PUPickerOnDemandProcessor_performOnDemandProcessingWithCanDisplayUserInterfaceHandler___block_invoke_4;
    v13[3] = &unk_1E58ABAC8;
    v14 = v11;
    dispatch_after(v12, MEMORY[0x1E0C80D38], v13);

  }
  else
  {
    v7[2](v7);
  }

  _Block_object_dispose(v20, 8);
}

- (void)_performOnDemandStaticStickerScoringProcessingForRecentAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUPickerOnDemandProcessor service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelRequest:", -[PUPickerOnDemandProcessor stickerScoringRequestID](self, "stickerScoringRequestID"));

  PXSharedUserDefaults();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerForKey:", CFSTR("PickerStickerScoreOnDemandTarget"));

  if (v7 >= 1)
    v8 = v7;
  else
    v8 = 100;
  -[PUPickerOnDemandProcessor service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerOnDemandProcessor configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x1E0D47640];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __91__PUPickerOnDemandProcessor__performOnDemandStaticStickerScoringProcessingForRecentAssets___block_invoke;
  v19 = &unk_1E589E410;
  v20 = v4;
  v14 = v4;
  v15 = objc_msgSend(v9, "requestStaticStickerScoringForLibrary:options:completionHandler:", v11, v13, &v16);
  -[PUPickerOnDemandProcessor setStickerScoringRequestID:](self, "setStickerScoringRequestID:", v15, v16, v17, v18, v19);

}

- (PUPickerConfiguration)configuration
{
  return self->_configuration;
}

- (VCPMediaAnalysisService)service
{
  return self->_service;
}

- (int)stickerScoringRequestID
{
  return self->_stickerScoringRequestID;
}

- (void)setStickerScoringRequestID:(int)a3
{
  self->_stickerScoringRequestID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

void __91__PUPickerOnDemandProcessor__performOnDemandStaticStickerScoringProcessingForRecentAssets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  PLPickerGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v3;
      v6 = "Can't complete async on demand static sticker scoring processing with error: %@";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 12;
LABEL_6:
      _os_log_impl(&dword_1AAB61000, v7, v8, v6, (uint8_t *)&v10, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    v6 = "Finished async on demand static sticker scoring processing.";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEFAULT;
    v9 = 2;
    goto LABEL_6;
  }

}

uint64_t __89__PUPickerOnDemandProcessor_performOnDemandProcessingWithCanDisplayUserInterfaceHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
    v1 = *(_QWORD *)(*(_QWORD *)(v2 + 40) + 8);
  }
  *(_BYTE *)(v1 + 24) = 0;
  return result;
}

void __89__PUPickerOnDemandProcessor_performOnDemandProcessingWithCanDisplayUserInterfaceHandler___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PUPickerOnDemandProcessor_performOnDemandProcessingWithCanDisplayUserInterfaceHandler___block_invoke_3;
  block[3] = &unk_1E58ABAC8;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __89__PUPickerOnDemandProcessor_performOnDemandProcessingWithCanDisplayUserInterfaceHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__PUPickerOnDemandProcessor_performOnDemandProcessingWithCanDisplayUserInterfaceHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
