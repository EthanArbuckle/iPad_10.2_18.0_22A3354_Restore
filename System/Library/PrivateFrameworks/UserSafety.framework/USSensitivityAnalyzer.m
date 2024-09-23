@implementation USSensitivityAnalyzer

+ (BOOL)isNudityDetectionEnabled
{
  id v2;
  void *v3;

  v2 = a1;
  objc_msgSend((id)objc_msgSend(a1, "settingsReaderClass"), "currentScanningPolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "_isNudityDetectionEnabled:", v3);

  return (char)v2;
}

+ (BOOL)isCommunicationSafetyEnabled
{
  id v2;
  void *v3;

  v2 = a1;
  objc_msgSend((id)objc_msgSend(a1, "settingsReaderClass"), "currentScanningPolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "_isCommunicationSafetyEnabled:", v3);

  return (char)v2;
}

+ (Class)settingsReaderClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_isNudityDetectionEnabled:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "entitlementsReaderClass"), "readCurrentServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(a1, "_isNudityDetectionEnabledForAnyOfServices:scanningPolicy:", v5, v4);
  }
  else
  {
    objc_msgSend((id)objc_msgSend(a1, "entitlementsReaderClass"), "readCurrentBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "_isNudityDetectionEnabledForApplication:scanningPolicy:", v7, v4);

  }
  return v6;
}

+ (Class)entitlementsReaderClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_isNudityDetectionEnabledForAnyOfServices:(id)a3 scanningPolicy:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(a1, "_isNudityDetectionEnabledForService:scanningPolicy:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), v7, (_QWORD)v15) & 1) != 0)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (BOOL)_isNudityDetectionEnabledForService:(id)a3 scanningPolicy:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "policy") == 1)
  {
    objc_msgSend(v6, "services");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)_isCommunicationSafetyEnabled:(id)a3
{
  return objc_msgSend(a3, "policy") == 2;
}

+ (id)subscribeForAnalysisEnabledChanges:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  USAnalysisEnablementSubscription *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDE96E8];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__USSensitivityAnalyzer_subscribeForAnalysisEnabledChanges___block_invoke;
  v9[3] = &unk_251B15E78;
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "subscribeForAnalysisAvailabilityChanges:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[USAnalysisEnablementSubscription initWithObserver:]([USAnalysisEnablementSubscription alloc], "initWithObserver:", v6);

  return v7;
}

- (USSensitivityAnalyzer)init
{
  dispatch_queue_t v3;
  USSensitivityAnalyzer *v4;

  v3 = dispatch_queue_create("com.apple.UserSafety.USSensitivityAnalyzer", 0);
  v4 = -[USSensitivityAnalyzer initWithQueue:](self, "initWithQueue:", v3);

  return v4;
}

- (USSensitivityAnalyzer)initWithQueue:(id)a3
{
  return -[USSensitivityAnalyzer initWithQueue:madService:](self, "initWithQueue:madService:", a3, 0);
}

- (USSensitivityAnalyzer)initWithQueue:(id)a3 madService:(id)a4
{
  id v7;
  id v8;
  USSensitivityAnalyzer *v9;
  USSensitivityAnalyzer *v10;
  uint64_t v11;
  uint64_t v12;
  SCMediaAnalysisService *madService;
  SCSensitivityAnalyzer *scsAnalyzer;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)USSensitivityAnalyzer;
  v9 = -[USSensitivityAnalyzer init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    if (v8)
    {
      objc_storeStrong((id *)&v10->_madService, a4);
      v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDE96E8]), "initWithQueue:madService:", v7, v8);
    }
    else
    {
      v12 = objc_opt_new();
      madService = v10->_madService;
      v10->_madService = (SCMediaAnalysisService *)v12;

      v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDE96E8]), "initWithQueue:", v7);
    }
    scsAnalyzer = v10->_scsAnalyzer;
    v10->_scsAnalyzer = (SCSensitivityAnalyzer *)v11;

  }
  return v10;
}

- (void)analyzeImageFile:(id)a3 completionHandler:(id)a4
{
  id v6;
  SCSensitivityAnalyzer *scsAnalyzer;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  scsAnalyzer = self->_scsAnalyzer;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__USSensitivityAnalyzer_analyzeImageFile_completionHandler___block_invoke;
  v9[3] = &unk_251B15E28;
  v10 = v6;
  v8 = v6;
  -[SCSensitivityAnalyzer analyzeImageFile:completionHandler:](scsAnalyzer, "analyzeImageFile:completionHandler:", a3, v9);

}

void __60__USSensitivityAnalyzer_analyzeImageFile_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, objc_msgSend(a2, "isSensitive"), v5);

  }
}

- (void)analyzeCGImage:(CGImage *)a3 withOrientation:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v5;
  id v8;
  SCSensitivityAnalyzer *scsAnalyzer;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  scsAnalyzer = self->_scsAnalyzer;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__USSensitivityAnalyzer_analyzeCGImage_withOrientation_completionHandler___block_invoke;
  v11[3] = &unk_251B15E28;
  v12 = v8;
  v10 = v8;
  -[SCSensitivityAnalyzer analyzeCGImage:orientation:completionHandler:](scsAnalyzer, "analyzeCGImage:orientation:completionHandler:", a3, v5, v11);

}

void __74__USSensitivityAnalyzer_analyzeCGImage_withOrientation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, objc_msgSend(a2, "isSensitive"), v5);

  }
}

- (void)analyzeVideoFile:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  SCSensitivityAnalyzer *scsAnalyzer;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  scsAnalyzer = self->_scsAnalyzer;
  v16 = v10;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __76__USSensitivityAnalyzer_analyzeVideoFile_progressHandler_completionHandler___block_invoke;
  v17[3] = &unk_251B15E50;
  v18 = v8;
  v19 = v9;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __76__USSensitivityAnalyzer_analyzeVideoFile_progressHandler_completionHandler___block_invoke_2;
  v15[3] = &unk_251B15E28;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  -[SCSensitivityAnalyzer analyzeVideoFile:progressHandler:completionHandler:](scsAnalyzer, "analyzeVideoFile:progressHandler:completionHandler:", v13, v17, v15);

}

uint64_t __76__USSensitivityAnalyzer_analyzeVideoFile_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __76__USSensitivityAnalyzer_analyzeVideoFile_progressHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, objc_msgSend(a2, "isSensitive"), v5);

  }
}

- (void)analyzeVideoFile:(id)a3 useBlastdoor:(BOOL)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  SCSensitivityAnalyzer *scsAnalyzer;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  scsAnalyzer = self->_scsAnalyzer;
  v18 = v12;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __89__USSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke;
  v19[3] = &unk_251B15E50;
  v20 = v10;
  v21 = v11;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __89__USSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke_2;
  v17[3] = &unk_251B15E28;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  -[SCSensitivityAnalyzer analyzeVideoFile:useBlastdoor:progressHandler:completionHandler:](scsAnalyzer, "analyzeVideoFile:useBlastdoor:progressHandler:completionHandler:", v15, v8, v19, v17);

}

uint64_t __89__USSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __89__USSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, objc_msgSend(a2, "isSensitive"), v5);

  }
}

- (void)analyzeImageWithLocalIdentifier:(id)a3 fromPhotoLibraryWithURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  SCSensitivityAnalyzer *scsAnalyzer;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  scsAnalyzer = self->_scsAnalyzer;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __99__USSensitivityAnalyzer_analyzeImageWithLocalIdentifier_fromPhotoLibraryWithURL_completionHandler___block_invoke;
  v11[3] = &unk_251B15E28;
  v12 = v8;
  v10 = v8;
  -[SCSensitivityAnalyzer analyzeImageWithLocalIdentifier:fromPhotoLibraryWithURL:completionHandler:](scsAnalyzer, "analyzeImageWithLocalIdentifier:fromPhotoLibraryWithURL:completionHandler:", a3, a4, v11);

}

void __99__USSensitivityAnalyzer_analyzeImageWithLocalIdentifier_fromPhotoLibraryWithURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, objc_msgSend(a2, "isSensitive"), v5);

  }
}

- (void)analyzeVideoWithLocalIdentifier:(id)a3 fromPhotoLibraryWithURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  SCSensitivityAnalyzer *scsAnalyzer;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  scsAnalyzer = self->_scsAnalyzer;
  v18 = v12;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __115__USSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke;
  v19[3] = &unk_251B15E50;
  v20 = v10;
  v21 = v11;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __115__USSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_2;
  v17[3] = &unk_251B15E28;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  -[SCSensitivityAnalyzer analyzeVideoWithLocalIdentifier:fromPhotoLibraryWithURL:progressHandler:completionHandler:](scsAnalyzer, "analyzeVideoWithLocalIdentifier:fromPhotoLibraryWithURL:progressHandler:completionHandler:", v15, a4, v19, v17);

}

uint64_t __115__USSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __115__USSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, objc_msgSend(a2, "isSensitive"), v5);

  }
}

+ (BOOL)isAnalysisEnabled
{
  id v2;
  void *v3;

  v2 = a1;
  objc_msgSend((id)objc_msgSend(a1, "settingsReaderClass"), "currentScanningPolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "_isAnalysisEnabled:", v3);

  return (char)v2;
}

+ (BOOL)isNudityDetectionEnabledForService:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "settingsReaderClass"), "currentScanningPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_isNudityDetectionEnabledForService:scanningPolicy:", v4, v5);

  return (char)a1;
}

+ (BOOL)isNudityDetectionEnabledForAnyOfServices:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "settingsReaderClass"), "currentScanningPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_isNudityDetectionEnabledForAnyOfServices:scanningPolicy:", v4, v5);

  return (char)a1;
}

uint64_t __60__USSensitivityAnalyzer_subscribeForAnalysisEnabledChanges___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, BOOL))(result + 16))(result, a2 == 2, a2 == 1);
  return result;
}

+ (BOOL)_isAnalysisEnabled:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_msgSend(a1, "_isCommunicationSafetyEnabled:", v4) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(a1, "_isNudityDetectionEnabled:", v4);

  return v5;
}

+ (BOOL)_isNudityDetectionEnabledForApplication:(id)a3 scanningPolicy:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "policy") == 1)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63F10]), "initWithBundleIdentifier:", v5);
    objc_msgSend(v6, "applications");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (SCMediaAnalysisService)madService
{
  return self->_madService;
}

- (void)setMadService:(id)a3
{
  objc_storeStrong((id *)&self->_madService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_madService, 0);
  objc_storeStrong((id *)&self->_scsAnalyzer, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
