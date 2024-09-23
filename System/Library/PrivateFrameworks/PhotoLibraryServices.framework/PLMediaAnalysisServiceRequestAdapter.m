@implementation PLMediaAnalysisServiceRequestAdapter

+ (int64_t)invalidRequestID
{
  return 0;
}

+ (unint64_t)petVIPModelType
{
  return 1;
}

+ (unint64_t)faceAnalysisTaskID
{
  return 3;
}

+ (void)cancelRequest:(int64_t)a3
{
  id v4;

  objc_msgSend(getVCPMediaAnalysisServiceClass_39247(), "sharedAnalysisService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "cancelRequest:", a3);

}

+ (int64_t)requestQuickFaceIdentificationForPhotoLibraryURL:(id)a3 withOptions:(id)a4 andCompletionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t (**v11)(_QWORD);
  void *v12;
  int v13;
  NSObject *v14;
  int64_t v15;
  void *v16;
  uint8_t v18[8];
  _QWORD v19[4];
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __122__PLMediaAnalysisServiceRequestAdapter_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke;
  v19[3] = &unk_1E3669830;
  v10 = v9;
  v20 = v10;
  v11 = (uint64_t (**)(_QWORD))MEMORY[0x19AEC174C](v19);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLForKey:", CFSTR("DisableQuickFaceAnalysisRequests"));

  if (v13)
  {
    PLAssetAnalysisGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Not running Quick Face Analysis since default is set to disable", v18, 2u);
    }

    v15 = v11[2](v11);
  }
  else
  {
    objc_msgSend(getVCPMediaAnalysisServiceClass_39247(), "sharedAnalysisService");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (int)objc_msgSend(v16, "requestQuickFaceIdentificationForPhotoLibraryURL:withOptions:andCompletionHandler:", v7, v8, v10);
    else
      v15 = v11[2](v11);

  }
  return v15;
}

+ (int)queryProgressDetail:(id *)a3 forPhotoLibraryURL:(id)a4 andTaskID:(unint64_t)a5
{
  id v7;
  void *v8;
  int v9;

  v7 = a4;
  objc_msgSend(getVCPMediaAnalysisServiceClass_39247(), "sharedAnalysisService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend((id)objc_opt_class(), "queryProgressDetail:forPhotoLibraryURL:andTaskID:", a3, v7, a5);
  else
    v9 = -10000;

  return v9;
}

+ (id)currentSceneVersion
{
  return &unk_1E375E9A0;
}

+ (id)currentImageEmbeddingVersion
{
  return &unk_1E375E9B8;
}

+ (id)currentVideoEmbeddingVersion
{
  return &unk_1E375E9B8;
}

+ (id)currentFaceVersion
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  if (_os_feature_enabled_impl())
    v3 = 15;
  else
    v3 = 11;
  return (id)objc_msgSend(v2, "numberWithInt:", v3);
}

+ (id)currentMediaAnalysisVersion
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  getMediaAnalysisVersion();
  return (id)objc_msgSend(v2, "numberWithInt:", v3);
}

+ (id)currentMediaAnalysisImageVersion
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  getMediaAnalysisVersion();
  return (id)objc_msgSend(v2, "numberWithInt:", v3);
}

+ (id)currentCaptionGenerationVersion
{
  void *v2;
  unsigned int *v3;
  void *v4;
  id result;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = (unsigned int *)getVCPPhotosCaptionProcessingVersionSymbolLoc_ptr;
  v11 = getVCPPhotosCaptionProcessingVersionSymbolLoc_ptr;
  if (!getVCPPhotosCaptionProcessingVersionSymbolLoc_ptr)
  {
    v4 = MediaAnalysisLibrary();
    v3 = (unsigned int *)dlsym(v4, "VCPPhotosCaptionProcessingVersion");
    v9[3] = (uint64_t)v3;
    getVCPPhotosCaptionProcessingVersionSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v8, 8);
  if (v3)
  {
    objc_msgSend(v2, "numberWithInt:", *v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "const int32_t getVCPPhotosCaptionProcessingVersion(void)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PLMediaAnalysisServiceRequestAdapter.m"), 47, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

+ (id)currentVisualSearchAlgorithmVersion
{
  void *v2;
  void *v3;
  void *v4;
  id result;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = getVCPPhotosVisualSearchAlgorithmVersionSymbolLoc_ptr;
  v11 = getVCPPhotosVisualSearchAlgorithmVersionSymbolLoc_ptr;
  if (!getVCPPhotosVisualSearchAlgorithmVersionSymbolLoc_ptr)
  {
    v4 = MediaAnalysisLibrary();
    v3 = dlsym(v4, "VCPPhotosVisualSearchAlgorithmVersion");
    v9[3] = (uint64_t)v3;
    getVCPPhotosVisualSearchAlgorithmVersionSymbolLoc_ptr = v3;
  }
  _Block_object_dispose(&v8, 8);
  if (v3)
  {
    objc_msgSend(v2, "numberWithInt:", ((uint64_t (*)(void))v3)());
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int32_t getVCPPhotosVisualSearchAlgorithmVersion(void)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PLMediaAnalysisServiceRequestAdapter.m"), 48, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

+ (id)currentOCRAlgorithmVersion
{
  void *v2;
  unsigned int *v3;
  void *v4;
  id result;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = (unsigned int *)getVCPPhotosOCRProcessingVersionSymbolLoc_ptr;
  v11 = getVCPPhotosOCRProcessingVersionSymbolLoc_ptr;
  if (!getVCPPhotosOCRProcessingVersionSymbolLoc_ptr)
  {
    v4 = MediaAnalysisLibrary();
    v3 = (unsigned int *)dlsym(v4, "VCPPhotosOCRProcessingVersion");
    v9[3] = (uint64_t)v3;
    getVCPPhotosOCRProcessingVersionSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v8, 8);
  if (v3)
  {
    objc_msgSend(v2, "numberWithInt:", *v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "const int32_t getVCPPhotosOCRProcessingVersion(void)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PLMediaAnalysisServiceRequestAdapter.m"), 45, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

+ (id)currentStickerConfidenceAlgorithmVersion
{
  void *v2;
  void *v3;
  id result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = getVCPPhotosVisualSearchProcessingVersionSymbolLoc_ptr;
  v10 = getVCPPhotosVisualSearchProcessingVersionSymbolLoc_ptr;
  if (!getVCPPhotosVisualSearchProcessingVersionSymbolLoc_ptr)
  {
    v3 = MediaAnalysisLibrary();
    v2 = dlsym(v3, "VCPPhotosVisualSearchProcessingVersion");
    v8[3] = (uint64_t)v2;
    getVCPPhotosVisualSearchProcessingVersionSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (((unsigned int (*)(void))v2)() >> 16));
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int32_t getVCPPhotosVisualSearchProcessingVersion(void)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PLMediaAnalysisServiceRequestAdapter.m"), 49, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

+ (id)currentVaAnalysisAlgorithmVersion
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  getVCPPhotosPECProcessingVersion();
  return (id)objc_msgSend(v2, "numberWithInt:", v3);
}

+ (id)currentVaLocationAnalysisAlgorithmVersion
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  getVCPPhotosPECProcessingVersion();
  return (id)objc_msgSend(v2, "numberWithInt:", v3);
}

+ (id)currentUnifiedEmbeddingVersion
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(getVCPMediaAnalyzerClass(), "getUnifiedEmbeddingVersion"));
}

uint64_t __122__PLMediaAnalysisServiceRequestAdapter_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, 0);
  return -1;
}

+ (id)requestVUIndexURLForPhotoLibraryURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(getMADServiceClass(), "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestVUIndexURLForPhotoLibraryURL:error:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)queryVUIndexAssetCountForType:(int64_t)a3 photoLibraryURL:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(getMADServiceClass(), "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = 0;
    v9 = objc_msgSend(v8, "queryVUIndexAssetCountForType:photoLibraryURL:error:", a3, v7, &v17);
    v10 = v17;
    v11 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (!a5)
    {
      v15 = 0;
      goto LABEL_11;
    }
    v12 = objc_retainAutorelease(v10);
    v11 = v12;
LABEL_7:
    v15 = 0;
    *a5 = v12;
LABEL_11:

    goto LABEL_12;
  }
  if (a5)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D74498];
    v18 = *MEMORY[0x1E0CB2938];
    v19[0] = CFSTR("The MAD (queryVUIndexAssetCountForType:photoLibraryURL:error:) SPI is not supported in this build.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 46309, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v15 = 0;
LABEL_12:

  return v15;
}

+ (int64_t)requestPetsAnalysisForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;

  if (a4)
  {
    v10 = a6;
    v11 = a5;
    v12 = a3;
    v13 = (id)objc_msgSend(a4, "mutableCopy");
  }
  else
  {
    v14 = (objc_class *)MEMORY[0x1E0C99E08];
    v15 = a6;
    v16 = a5;
    v17 = a3;
    v13 = objc_alloc_init(v14);
  }
  v18 = v13;
  getVCPMediaAnalysisService_AllowOnDemandOption();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v19);

  objc_msgSend(getVCPMediaAnalysisServiceClass_39247(), "sharedAnalysisService");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "requestAnalysisTypes:forAssets:withOptions:progressHandler:andCompletionHandler:", 0x20000, a3, v18, a5, a6);

  return v21;
}

+ (int64_t)requestResetFaceClassificationModelForPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t (**v11)(_QWORD);
  void *v12;
  int64_t v13;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __162__PLMediaAnalysisServiceRequestAdapter_PersonBuilderAndPromoterRequests__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke;
  v15[3] = &unk_1E3669830;
  v10 = v9;
  v16 = v10;
  v11 = (uint64_t (**)(_QWORD))MEMORY[0x19AEC174C](v15);
  objc_msgSend(getVCPMediaAnalysisServiceClass_39247(), "sharedAnalysisService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v13 = (int)objc_msgSend(v12, "requestResetFaceClassificationModelForPhotoLibraryURL:progressHandler:completionHandler:", v7, v8, v10);
  else
    v13 = v11[2](v11);

  return v13;
}

+ (int64_t)requestPersonPromoterStatusWithAdvancedFlag:(BOOL)a3 photoLibraryURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t (**v13)(_QWORD);
  void *v14;
  int64_t v15;
  _QWORD v17[4];
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __168__PLMediaAnalysisServiceRequestAdapter_PersonBuilderAndPromoterRequests__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke;
  v17[3] = &unk_1E3669830;
  v12 = v11;
  v18 = v12;
  v13 = (uint64_t (**)(_QWORD))MEMORY[0x19AEC174C](v17);
  objc_msgSend(getVCPMediaAnalysisServiceClass_39247(), "sharedAnalysisService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v15 = (int)objc_msgSend(v14, "requestPersonPromoterStatusWithAdvancedFlag:photoLibraryURL:progressHandler:completionHandler:", v8, v9, v10, v12);
  else
    v15 = v13[2](v13);

  return v15;
}

+ (int64_t)requestResetPersons:(id)a3 photoLibraryURL:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t (**v11)(_QWORD);
  void *v12;
  int64_t v13;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __128__PLMediaAnalysisServiceRequestAdapter_PersonBuilderAndPromoterRequests__requestResetPersons_photoLibraryURL_completionHandler___block_invoke;
  v15[3] = &unk_1E3669830;
  v10 = v9;
  v16 = v10;
  v11 = (uint64_t (**)(_QWORD))MEMORY[0x19AEC174C](v15);
  objc_msgSend(getVCPMediaAnalysisServiceClass_39247(), "sharedAnalysisService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v13 = (int)objc_msgSend(v12, "requestResetPersons:forPhotoLibraryURL:completionHandler:", v7, v8, v10);
  else
    v13 = v11[2](v11);

  return v13;
}

uint64_t __128__PLMediaAnalysisServiceRequestAdapter_PersonBuilderAndPromoterRequests__requestResetPersons_photoLibraryURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v1 + 16))(v1, 1, 0);
  return -1;
}

uint64_t __168__PLMediaAnalysisServiceRequestAdapter_PersonBuilderAndPromoterRequests__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, MEMORY[0x1E0C9AA70], 0);
  return -1;
}

uint64_t __162__PLMediaAnalysisServiceRequestAdapter_PersonBuilderAndPromoterRequests__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v1 + 16))(v1, 1, 0);
  return -1;
}

+ (int64_t)requestVIPModelFilepathForPhotoLibraryURL:(id)a3 forModelType:(unint64_t)a4 andCompletionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a3;
  objc_msgSend(getVCPMediaAnalysisServiceClass_39247(), "sharedAnalysisService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v9, "requestVIPModelFilepathForPhotoLibraryURL:forModelType:completionHandler:", v8, a4, v7);

  return (int)a4;
}

+ (int64_t)requestSceneProcessingForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(getVCPMediaAnalysisServiceClass_39247(), "sharedAnalysisService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "requestSceneProcessingForAssets:withOptions:progressHandler:andCompletionHandler:", v12, v11, v10, v9);

  return v14;
}

+ (int64_t)requestProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  objc_msgSend(getVCPMediaAnalysisServiceClass_39247(), "sharedAnalysisService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v15, "requestProcessingTypes:forAssetsWithLocalIdentifiers:fromPhotoLibraryWithURL:progressHandler:completionHandler:", a3, v14, v13, v12, v11);

  return (int)a3;
}

+ (int64_t)requestMovieCurationForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;

  if (a4)
  {
    v10 = a6;
    v11 = a5;
    v12 = a3;
    v13 = (id)objc_msgSend(a4, "mutableCopy");
  }
  else
  {
    v14 = (objc_class *)MEMORY[0x1E0C99E08];
    v15 = a6;
    v16 = a5;
    v17 = a3;
    v13 = objc_alloc_init(v14);
  }
  v18 = v13;
  getVCPMediaAnalysisService_AllowOnDemandOption();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v19);

  objc_msgSend(getVCPMediaAnalysisServiceClass_39247(), "sharedAnalysisService");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "requestAnalysisTypes:forAssets:withOptions:progressHandler:andCompletionHandler:", 0x40000, a3, v18, a5, a6);

  return v21;
}

+ (int64_t)requestClusterCacheValidationWithPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t (**v11)(_QWORD);
  void *v12;
  int64_t v13;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __145__PLMediaAnalysisServiceRequestAdapter_InternalToolRequests__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke;
  v15[3] = &unk_1E3669830;
  v10 = v9;
  v16 = v10;
  v11 = (uint64_t (**)(_QWORD))MEMORY[0x19AEC174C](v15);
  objc_msgSend(getVCPMediaAnalysisServiceClass_39247(), "sharedAnalysisService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v13 = (int)objc_msgSend(v12, "requestClusterCacheValidationWithPhotoLibraryURL:progressHandler:completionHandler:", v7, v8, v10);
  else
    v13 = v11[2](v11);

  return v13;
}

+ (int64_t)requestResetFaceClusteringStateWithPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t (**v11)(_QWORD);
  void *v12;
  int64_t v13;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __147__PLMediaAnalysisServiceRequestAdapter_InternalToolRequests__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke;
  v15[3] = &unk_1E3669830;
  v10 = v9;
  v16 = v10;
  v11 = (uint64_t (**)(_QWORD))MEMORY[0x19AEC174C](v15);
  objc_msgSend(getVCPMediaAnalysisServiceClass_39247(), "sharedAnalysisService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v13 = (int)objc_msgSend(v12, "requestResetFaceClusteringStateWithPhotoLibraryURL:progressHandler:completionHandler:", v7, v8, v10);
  else
    v13 = v11[2](v11);

  return v13;
}

+ (int64_t)requestReclusterFacesWithPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t (**v11)(_QWORD);
  void *v12;
  int64_t v13;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __137__PLMediaAnalysisServiceRequestAdapter_InternalToolRequests__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke;
  v15[3] = &unk_1E3669830;
  v10 = v9;
  v16 = v10;
  v11 = (uint64_t (**)(_QWORD))MEMORY[0x19AEC174C](v15);
  objc_msgSend(getVCPMediaAnalysisServiceClass_39247(), "sharedAnalysisService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v13 = (int)objc_msgSend(v12, "requestReclusterFacesWithPhotoLibraryURL:progressHandler:completionHandler:", v7, v8, v10);
  else
    v13 = v11[2](v11);

  return v13;
}

+ (int64_t)requestRebuildPersonsWithLocalIdentifiers:(id)a3 photoLibraryURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t (**v14)(_QWORD);
  void *v15;
  int64_t v16;
  _QWORD v18[4];
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __154__PLMediaAnalysisServiceRequestAdapter_InternalToolRequests__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke;
  v18[3] = &unk_1E3669830;
  v13 = v12;
  v19 = v13;
  v14 = (uint64_t (**)(_QWORD))MEMORY[0x19AEC174C](v18);
  objc_msgSend(getVCPMediaAnalysisServiceClass_39247(), "sharedAnalysisService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16 = (int)objc_msgSend(v15, "requestRebuildPersonsWithLocalIdentifiers:photoLibraryURL:progressHandler:completionHandler:", v9, v10, v11, v13);
  else
    v16 = v14[2](v14);

  return v16;
}

uint64_t __154__PLMediaAnalysisServiceRequestAdapter_InternalToolRequests__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v1 + 16))(v1, 1, 0);
  return -1;
}

uint64_t __137__PLMediaAnalysisServiceRequestAdapter_InternalToolRequests__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v1 + 16))(v1, 1, 0);
  return -1;
}

uint64_t __147__PLMediaAnalysisServiceRequestAdapter_InternalToolRequests__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v1 + 16))(v1, 1, 0);
  return -1;
}

uint64_t __145__PLMediaAnalysisServiceRequestAdapter_InternalToolRequests__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, MEMORY[0x1E0C9AA70], 0);
  return -1;
}

+ (int64_t)requestSuggestedPersonsForPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 photoLibraryURL:(id)a6 progessHandler:(id)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t (**v20)(_QWORD);
  void *v21;
  int64_t v22;
  _QWORD v24[4];
  id v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __226__PLMediaAnalysisServiceRequestAdapter_FaceSuggestionRequests__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke;
  v24[3] = &unk_1E3669830;
  v19 = v18;
  v25 = v19;
  v20 = (uint64_t (**)(_QWORD))MEMORY[0x19AEC174C](v24);
  objc_msgSend(getVCPMediaAnalysisServiceClass_39247(), "sharedAnalysisService");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v22 = (int)objc_msgSend(v21, "requestSuggestedPersonsForPersonWithLocalIdentifier:toBeConfirmedPersonSuggestions:toBeRejectedPersonSuggestions:photoLibraryURL:progessHandler:completionHandler:", v13, v14, v15, v16, v17, v19);
  else
    v22 = v20[2](v20);

  return v22;
}

+ (int64_t)requestUpdateKeyFacesOfPersonsWithLocalIdentifiers:(id)a3 forceUpdate:(BOOL)a4 photoLibraryURL:(id)a5 progessHandler:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t (**v16)(_QWORD);
  void *v17;
  int64_t v18;
  _QWORD v20[4];
  id v21;

  v10 = a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __176__PLMediaAnalysisServiceRequestAdapter_FaceSuggestionRequests__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke;
  v20[3] = &unk_1E3669830;
  v15 = v14;
  v21 = v15;
  v16 = (uint64_t (**)(_QWORD))MEMORY[0x19AEC174C](v20);
  objc_msgSend(getVCPMediaAnalysisServiceClass_39247(), "sharedAnalysisService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = (int)objc_msgSend(v17, "requestUpdateKeyFacesOfPersonsWithLocalIdentifiers:forceUpdate:photoLibraryURL:progessHandler:completionHandler:", v11, v10, v12, v13, v15);
  else
    v18 = v16[2](v16);

  return v18;
}

+ (int64_t)requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers:(id)a3 photoLibraryURL:(id)a4 progessHandler:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t (**v14)(_QWORD);
  void *v15;
  int64_t v16;
  _QWORD v18[4];
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __175__PLMediaAnalysisServiceRequestAdapter_FaceSuggestionRequests__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke;
  v18[3] = &unk_1E3669830;
  v13 = v12;
  v19 = v13;
  v14 = (uint64_t (**)(_QWORD))MEMORY[0x19AEC174C](v18);
  objc_msgSend(getVCPMediaAnalysisServiceClass_39247(), "sharedAnalysisService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16 = (int)objc_msgSend(v15, "requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers:photoLibraryURL:progessHandler:completionHandler:", v9, v10, v11, v13);
  else
    v16 = v14[2](v14);

  return v16;
}

uint64_t __175__PLMediaAnalysisServiceRequestAdapter_FaceSuggestionRequests__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, MEMORY[0x1E0C9AA60], 0);
  return -1;
}

uint64_t __176__PLMediaAnalysisServiceRequestAdapter_FaceSuggestionRequests__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v1 + 16))(v1, 1, 0);
  return -1;
}

uint64_t __226__PLMediaAnalysisServiceRequestAdapter_FaceSuggestionRequests__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, MEMORY[0x1E0C9AA60], 0);
  return -1;
}

+ (int64_t)requestAssetHighlightCaptionsForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(getVCPMediaAnalyzerClass(), "sharedMediaAnalyzer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "requestAnalysis:forAssets:withOptions:andProgressHandler:andCompletionHandler:", 0x40000, v12, v11, v10, v9);

  return v14;
}

+ (id)mediaAnalysisMovieHighlightResultsKey
{
  id *v2;
  void *v3;
  id result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (id *)getMediaAnalysisMovieHighlightResultsKeySymbolLoc_ptr;
  v10 = getMediaAnalysisMovieHighlightResultsKeySymbolLoc_ptr;
  if (!getMediaAnalysisMovieHighlightResultsKeySymbolLoc_ptr)
  {
    v3 = MediaAnalysisLibrary();
    v2 = (id *)dlsym(v3, "MediaAnalysisMovieHighlightResultsKey");
    v8[3] = (uint64_t)v2;
    getMediaAnalysisMovieHighlightResultsKeySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return *v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisMovieHighlightResultsKey(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PLMediaAnalysisServiceRequestAdapter.m"), 56, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (id)mediaAnalysisResultStartKey
{
  id *v2;
  void *v3;
  id result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (id *)getMediaAnalysisResultStartKeySymbolLoc_ptr;
  v10 = getMediaAnalysisResultStartKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultStartKeySymbolLoc_ptr)
  {
    v3 = MediaAnalysisLibrary();
    v2 = (id *)dlsym(v3, "MediaAnalysisResultStartKey");
    v8[3] = (uint64_t)v2;
    getMediaAnalysisResultStartKeySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return *v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultStartKey(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PLMediaAnalysisServiceRequestAdapter.m"), 57, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (id)mediaAnalysisResultDurationKey
{
  id *v2;
  void *v3;
  id result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (id *)getMediaAnalysisResultDurationKeySymbolLoc_ptr;
  v10 = getMediaAnalysisResultDurationKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultDurationKeySymbolLoc_ptr)
  {
    v3 = MediaAnalysisLibrary();
    v2 = (id *)dlsym(v3, "MediaAnalysisResultDurationKey");
    v8[3] = (uint64_t)v2;
    getMediaAnalysisResultDurationKeySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return *v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultDurationKey(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PLMediaAnalysisServiceRequestAdapter.m"), 58, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (id)mediaAnalysisQualityKey
{
  id *v2;
  void *v3;
  id result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (id *)getMediaAnalysisQualityKeySymbolLoc_ptr;
  v10 = getMediaAnalysisQualityKeySymbolLoc_ptr;
  if (!getMediaAnalysisQualityKeySymbolLoc_ptr)
  {
    v3 = MediaAnalysisLibrary();
    v2 = (id *)dlsym(v3, "MediaAnalysisQualityKey");
    v8[3] = (uint64_t)v2;
    getMediaAnalysisQualityKeySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return *v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisQualityKey(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PLMediaAnalysisServiceRequestAdapter.m"), 59, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (id)mediaAnalysisResultsKey
{
  id *v2;
  void *v3;
  id result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (id *)getMediaAnalysisResultsKeySymbolLoc_ptr;
  v10 = getMediaAnalysisResultsKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultsKeySymbolLoc_ptr)
  {
    v3 = MediaAnalysisLibrary();
    v2 = (id *)dlsym(v3, "MediaAnalysisResultsKey");
    v8[3] = (uint64_t)v2;
    getMediaAnalysisResultsKeySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return *v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultsKey(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PLMediaAnalysisServiceRequestAdapter.m"), 60, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (id)mediaAnalyzerOptionSearchQueryString
{
  id *v2;
  void *v3;
  id result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (id *)getVCPMediaAnalyzerOption_SearchQueryStringSymbolLoc_ptr;
  v10 = getVCPMediaAnalyzerOption_SearchQueryStringSymbolLoc_ptr;
  if (!getVCPMediaAnalyzerOption_SearchQueryStringSymbolLoc_ptr)
  {
    v3 = MediaAnalysisLibrary();
    v2 = (id *)dlsym(v3, "VCPMediaAnalyzerOption_SearchQueryString");
    v8[3] = (uint64_t)v2;
    getVCPMediaAnalyzerOption_SearchQueryStringSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return *v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getVCPMediaAnalyzerOption_SearchQueryString(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PLMediaAnalysisServiceRequestAdapter.m"), 41, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (id)mediaAnalyzerOptionHighlightContexts
{
  id *v2;
  void *v3;
  id result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (id *)getVCPMediaAnalyzerOption_HighlightContextsSymbolLoc_ptr;
  v10 = getVCPMediaAnalyzerOption_HighlightContextsSymbolLoc_ptr;
  if (!getVCPMediaAnalyzerOption_HighlightContextsSymbolLoc_ptr)
  {
    v3 = MediaAnalysisLibrary();
    v2 = (id *)dlsym(v3, "VCPMediaAnalyzerOption_HighlightContexts");
    v8[3] = (uint64_t)v2;
    getVCPMediaAnalyzerOption_HighlightContextsSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return *v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getVCPMediaAnalyzerOption_HighlightContexts(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PLMediaAnalysisServiceRequestAdapter.m"), 42, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (id)mediaAnalyzerOptionCaptionWithHighlight
{
  id *v2;
  void *v3;
  id result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (id *)getVCPMediaAnalyzerOption_CaptionWithHighlightSymbolLoc_ptr;
  v10 = getVCPMediaAnalyzerOption_CaptionWithHighlightSymbolLoc_ptr;
  if (!getVCPMediaAnalyzerOption_CaptionWithHighlightSymbolLoc_ptr)
  {
    v3 = MediaAnalysisLibrary();
    v2 = (id *)dlsym(v3, "VCPMediaAnalyzerOption_CaptionWithHighlight");
    v8[3] = (uint64_t)v2;
    getVCPMediaAnalyzerOption_CaptionWithHighlightSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return *v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getVCPMediaAnalyzerOption_CaptionWithHighlight(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PLMediaAnalysisServiceRequestAdapter.m"), 43, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (unint64_t)mediaAnalysisTypeCaptionVideo
{
  return 0x200000000000;
}

+ (unint64_t)mediaAnalysisTypeCaptionImage
{
  return 0x2000000000000;
}

+ (int64_t)requestAssetCaptionsOfTypes:(unint64_t)a3 forAssets:(id)a4 withOptions:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  char v10;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int64_t v23;

  v10 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v13)
    v16 = (id)objc_msgSend(v13, "mutableCopy");
  else
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = v16;
  getVCPMediaAnalysisService_AllowOnDemandOption();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v18);

  getVCPMediaAnalysisService_AllowStreamingOption();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, v20);

  if ((v10 & 1) != 0)
  {
    v21 = objc_msgSend(a1, "mediaAnalysisTypeCaptionImage");
    if ((v10 & 2) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v21 = 0;
  if ((v10 & 2) != 0)
LABEL_8:
    v21 |= objc_msgSend(a1, "mediaAnalysisTypeCaptionVideo");
LABEL_9:
  if (v21)
  {
    objc_msgSend(getVCPMediaAnalysisServiceClass_39247(), "sharedAnalysisService");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (int)objc_msgSend(v22, "requestAnalysisTypes:forAssets:withOptions:progressHandler:andCompletionHandler:", v21, v12, v17, v14, v15);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, MEMORY[0x1E0C9AA70], 0);
    v23 = 0;
  }

  return v23;
}

+ (int64_t)requestVideoCaptionPreferenceForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  int64_t v21;
  void *v22;
  int64_t result;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
    v14 = (id)objc_msgSend(v11, "mutableCopy");
  else
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = v14;
  getVCPMediaAnalysisService_AllowOnDemandOption();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v16);

  getVCPMediaAnalysisService_AllowStreamingOption();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, v18);

  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v19 = (_QWORD *)getVCPMediaAnalysisService_InProcessOptionSymbolLoc_ptr;
  v29 = getVCPMediaAnalysisService_InProcessOptionSymbolLoc_ptr;
  if (!getVCPMediaAnalysisService_InProcessOptionSymbolLoc_ptr)
  {
    v20 = MediaAnalysisLibrary();
    v19 = dlsym(v20, "VCPMediaAnalysisService_InProcessOption");
    v27[3] = (uint64_t)v19;
    getVCPMediaAnalysisService_InProcessOptionSymbolLoc_ptr = (uint64_t)v19;
  }
  _Block_object_dispose(&v26, 8);
  if (v19)
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *v19);
    v21 = objc_msgSend(a1, "mediaAnalysisTypeCaptionVideo");
    if (v21)
    {
      objc_msgSend(getVCPMediaAnalysisServiceClass_39247(), "sharedAnalysisService");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (int)objc_msgSend(v22, "requestAnalysisTypes:forAssets:withOptions:progressHandler:andCompletionHandler:", v21, v10, v15, v12, v13);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, MEMORY[0x1E0C9AA70], 0);
    }

    return v21;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getVCPMediaAnalysisService_InProcessOption(void)");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("PLMediaAnalysisServiceRequestAdapter.m"), 40, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

+ (id)mediaAnalysisVideoCaptionPreferenceResultsKey
{
  id *v2;
  void *v3;
  id result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (id *)getMediaAnalysisVideoCaptionPreferenceResultsKeySymbolLoc_ptr;
  v10 = getMediaAnalysisVideoCaptionPreferenceResultsKeySymbolLoc_ptr;
  if (!getMediaAnalysisVideoCaptionPreferenceResultsKeySymbolLoc_ptr)
  {
    v3 = MediaAnalysisLibrary();
    v2 = (id *)dlsym(v3, "MediaAnalysisVideoCaptionPreferenceResultsKey");
    v8[3] = (uint64_t)v2;
    getMediaAnalysisVideoCaptionPreferenceResultsKeySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return *v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisVideoCaptionPreferenceResultsKey(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PLMediaAnalysisServiceRequestAdapter.m"), 53, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (id)mediaAnalysisResultVideoCaptionPreferenceAttributeKey
{
  id *v2;
  void *v3;
  id result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (id *)getMediaAnalysisResultVideoCaptionPreferenceAttributeKeySymbolLoc_ptr;
  v10 = getMediaAnalysisResultVideoCaptionPreferenceAttributeKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultVideoCaptionPreferenceAttributeKeySymbolLoc_ptr)
  {
    v3 = MediaAnalysisLibrary();
    v2 = (id *)dlsym(v3, "MediaAnalysisResultVideoCaptionPreferenceAttributeKey");
    v8[3] = (uint64_t)v2;
    getMediaAnalysisResultVideoCaptionPreferenceAttributeKeySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return *v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultVideoCaptionPreferenceAttributeKey(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PLMediaAnalysisServiceRequestAdapter.m"), 54, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (id)mediaAnalysisMiCaImageCaptionResultsKey
{
  id *v2;
  void *v3;
  id result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (id *)getMediaAnalysisMiCaImageCaptionResultsKeySymbolLoc_ptr;
  v10 = getMediaAnalysisMiCaImageCaptionResultsKeySymbolLoc_ptr;
  if (!getMediaAnalysisMiCaImageCaptionResultsKeySymbolLoc_ptr)
  {
    v3 = MediaAnalysisLibrary();
    v2 = (id *)dlsym(v3, "MediaAnalysisMiCaImageCaptionResultsKey");
    v8[3] = (uint64_t)v2;
    getMediaAnalysisMiCaImageCaptionResultsKeySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return *v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisMiCaImageCaptionResultsKey(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PLMediaAnalysisServiceRequestAdapter.m"), 51, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (id)mediaAnalysisResultAttributesKey
{
  id *v2;
  void *v3;
  id result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (id *)getMediaAnalysisResultAttributesKeySymbolLoc_ptr;
  v10 = getMediaAnalysisResultAttributesKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultAttributesKeySymbolLoc_ptr)
  {
    v3 = MediaAnalysisLibrary();
    v2 = (id *)dlsym(v3, "MediaAnalysisResultAttributesKey");
    v8[3] = (uint64_t)v2;
    getMediaAnalysisResultAttributesKeySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return *v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultAttributesKey(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PLMediaAnalysisServiceRequestAdapter.m"), 55, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (id)mediaAnalysisResultImageCaptionTextAttributeKey
{
  id *v2;
  void *v3;
  id result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (id *)getMediaAnalysisResultImageCaptionTextAttributeKeySymbolLoc_ptr;
  v10 = getMediaAnalysisResultImageCaptionTextAttributeKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultImageCaptionTextAttributeKeySymbolLoc_ptr)
  {
    v3 = MediaAnalysisLibrary();
    v2 = (id *)dlsym(v3, "MediaAnalysisResultImageCaptionTextAttributeKey");
    v8[3] = (uint64_t)v2;
    getMediaAnalysisResultImageCaptionTextAttributeKeySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return *v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultImageCaptionTextAttributeKey(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PLMediaAnalysisServiceRequestAdapter.m"), 63, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (id)mediaAnalysisMiCaVideoCaptionResultsKey
{
  id *v2;
  void *v3;
  id result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (id *)getMediaAnalysisMiCaVideoCaptionResultsKeySymbolLoc_ptr;
  v10 = getMediaAnalysisMiCaVideoCaptionResultsKeySymbolLoc_ptr;
  if (!getMediaAnalysisMiCaVideoCaptionResultsKeySymbolLoc_ptr)
  {
    v3 = MediaAnalysisLibrary();
    v2 = (id *)dlsym(v3, "MediaAnalysisMiCaVideoCaptionResultsKey");
    v8[3] = (uint64_t)v2;
    getMediaAnalysisMiCaVideoCaptionResultsKeySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return *v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisMiCaVideoCaptionResultsKey(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PLMediaAnalysisServiceRequestAdapter.m"), 52, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (id)mediaAnalysisResultVideoCaptionTextAttributeKey
{
  id *v2;
  void *v3;
  id result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (id *)getMediaAnalysisResultVideoCaptionTextAttributeKeySymbolLoc_ptr;
  v10 = getMediaAnalysisResultVideoCaptionTextAttributeKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultVideoCaptionTextAttributeKeySymbolLoc_ptr)
  {
    v3 = MediaAnalysisLibrary();
    v2 = (id *)dlsym(v3, "MediaAnalysisResultVideoCaptionTextAttributeKey");
    v8[3] = (uint64_t)v2;
    getMediaAnalysisResultVideoCaptionTextAttributeKeySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return *v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultVideoCaptionTextAttributeKey(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PLMediaAnalysisServiceRequestAdapter.m"), 64, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

@end
