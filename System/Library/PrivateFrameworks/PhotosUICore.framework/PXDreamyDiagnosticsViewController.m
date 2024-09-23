@implementation PXDreamyDiagnosticsViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDreamyDiagnosticsViewController;
  -[PXVideoComparisonViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PXDreamyDiagnosticsViewController setTitle:](self, "setTitle:", CFSTR("Dreamy"));
}

- (id)radarTitle
{
  return CFSTR("[Dreamy] Feedback: ");
}

- (id)radarComponentID
{
  return CFSTR("659839");
}

- (id)radarComponentName
{
  return CFSTR("Photos UI Live Photos");
}

- (id)radarComponentVersion
{
  return CFSTR("iOS");
}

- (BOOL)useVariantVideoByDefaultInToggle
{
  return 0;
}

- (id)inputVideoButtonsTitle
{
  void *v2;
  uint64_t v3;

  -[PXVideoComparisonViewController inputAsset](self, "inputAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sourceType");

  if (v3 == 16)
    return CFSTR("Dreamy");
  else
    return CFSTR("Original");
}

- (id)variantVideoButtonsTitle
{
  void *v2;
  uint64_t v3;

  -[PXVideoComparisonViewController inputAsset](self, "inputAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sourceType");

  if (v3 == 16)
    return CFSTR("Original");
  else
    return CFSTR("Dreamy");
}

- (id)variantVideoDescription
{
  void *v2;
  void *v3;

  -[PXDreamyDiagnosticsViewController variantAsset](self, "variantAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)prepareVariantVideoWithProgress:(id)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD, id);
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  void (**v10)(id, _QWORD, id);
  id v11;

  v5 = (void (**)(id, _QWORD, id))a4;
  v11 = 0;
  -[PXDreamyDiagnosticsViewController _loadAndCacheVariantAssetWithError:](self, "_loadAndCacheVariantAssetWithError:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  v8 = v7;
  if (!v6 || v7)
  {
    v5[2](v5, 0, v7);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __80__PXDreamyDiagnosticsViewController_prepareVariantVideoWithProgress_completion___block_invoke;
    v9[3] = &unk_1E5134878;
    v10 = v5;
    -[PXDreamyDiagnosticsViewController _loadAndCacheVariantVideoURLFromAsset:completion:](self, "_loadAndCacheVariantVideoURLFromAsset:completion:", v6, v9);

  }
}

- (void)prepareVariantVideoForExportWithProgress:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a4;
  v11 = 0;
  -[PXDreamyDiagnosticsViewController _loadAndCacheVariantAssetWithError:](self, "_loadAndCacheVariantAssetWithError:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  v8 = v7;
  if (!v6 || v7)
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v5 + 2))(v5, 0, 0, v7);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __89__PXDreamyDiagnosticsViewController_prepareVariantVideoForExportWithProgress_completion___block_invoke;
    v9[3] = &unk_1E5134878;
    v10 = v5;
    -[PXDreamyDiagnosticsViewController _loadAndCacheVariantVideoURLFromAsset:completion:](self, "_loadAndCacheVariantVideoURLFromAsset:completion:", v6, v9);

  }
}

- (void)invalidateInputAndVariantReferences
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXDreamyDiagnosticsViewController;
  -[PXVideoComparisonViewController invalidateInputAndVariantReferences](&v4, sel_invalidateInputAndVariantReferences);
  -[PXDreamyDiagnosticsViewController setVariantAsset:](self, "setVariantAsset:", 0);
  -[PXDreamyDiagnosticsViewController setVariantVideoURL:](self, "setVariantVideoURL:", 0);
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelImageRequest:", -[PXDreamyDiagnosticsViewController variantVideoRequestID](self, "variantVideoRequestID"));

  -[PXDreamyDiagnosticsViewController setVariantVideoRequestID:](self, "setVariantVideoRequestID:", 0);
}

- (void)_loadAndCacheVariantVideoURLFromAsset:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  void (**v18)(id, void *);
  uint64_t *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  id location;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[PXDreamyDiagnosticsViewController variantVideoURL](self, "variantVideoURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v7[2](v7, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cancelImageRequest:", -[PXDreamyDiagnosticsViewController variantVideoRequestID](self, "variantVideoRequestID"));

    v10 = objc_alloc_init(MEMORY[0x1E0CD1808]);
    objc_msgSend(v10, "setNetworkAccessAllowed:", 1);
    objc_msgSend(v10, "setVideoComplementAllowed:", 1);
    objc_msgSend(v10, "setStreamingAllowed:", 0);
    objc_initWeak(&location, self);
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __86__PXDreamyDiagnosticsViewController__loadAndCacheVariantVideoURLFromAsset_completion___block_invoke;
    v17 = &unk_1E51348A0;
    v19 = &v21;
    objc_copyWeak(&v20, &location);
    v18 = v7;
    v12 = objc_msgSend(v11, "requestURLForVideo:options:resultHandler:", v6, v10, &v14);

    *((_DWORD *)v22 + 6) = v12;
    v13 = objc_loadWeakRetained(&location);
    objc_msgSend(v13, "setVariantVideoRequestID:", v12, v14, v15, v16, v17);

    _Block_object_dispose(&v21, 8);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
}

- (id)_loadAndCacheVariantAssetWithError:(id *)a3
{
  void *v5;
  void *v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  NSObject *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  -[PXDreamyDiagnosticsViewController variantAsset](self, "variantAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[PXVideoComparisonViewController inputAsset](self, "inputAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchPropertySetsIfNeeded");
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__197111;
    v27 = __Block_byref_object_dispose__197112;
    v28 = 0;
    v7 = dispatch_semaphore_create(0);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __72__PXDreamyDiagnosticsViewController__loadAndCacheVariantAssetWithError___block_invoke;
    v20 = &unk_1E51348C8;
    v22 = &v23;
    v8 = v7;
    v21 = v8;
    objc_msgSend(v6, "getMasterFingerPrintWithCompletionHandler:", &v17);
    v9 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v8, v9);
    if (!v24[5])
    {
      if (!a3)
      {
        v5 = 0;
LABEL_18:

        _Block_object_dispose(&v23, 8);
        return v5;
      }
      v13 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v6, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "px_genericErrorWithDebugDescription:", CFSTR("Unable to load master fingerprint for Asset with UUID: %@"), v11);
      v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "librarySpecificFetchOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "sourceType") == 16)
    {
      v12 = 1;
    }
    else
    {
      if (objc_msgSend(v6, "sourceType") != 1)
      {
LABEL_10:
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("additionalAttributes.originalStableHash"), v24[5], v17, v18, v19, v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setInternalPredicate:", v14);

        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "count"))
        {
          objc_msgSend(v15, "firstObject");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else if (a3)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("No asset was found with a matching master fingerprint"));
          v5 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v5 = 0;
        }
        -[PXDreamyDiagnosticsViewController setVariantAsset:](self, "setVariantAsset:", v5);

        goto LABEL_17;
      }
      v12 = 16;
    }
    objc_msgSend(v11, "setIncludeAssetSourceTypes:", v12);
    goto LABEL_10;
  }
  return v5;
}

- (PHAsset)variantAsset
{
  return self->_variantAsset;
}

- (void)setVariantAsset:(id)a3
{
  objc_storeStrong((id *)&self->_variantAsset, a3);
}

- (NSURL)variantVideoURL
{
  return self->_variantVideoURL;
}

- (void)setVariantVideoURL:(id)a3
{
  objc_storeStrong((id *)&self->_variantVideoURL, a3);
}

- (int)variantVideoRequestID
{
  return self->_variantVideoRequestID;
}

- (void)setVariantVideoRequestID:(int)a3
{
  self->_variantVideoRequestID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantVideoURL, 0);
  objc_storeStrong((id *)&self->_variantAsset, 0);
}

void __72__PXDreamyDiagnosticsViewController__loadAndCacheVariantAssetWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __86__PXDreamyDiagnosticsViewController__loadAndCacheVariantVideoURLFromAsset_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v7 = v5;
  v8 = *(id *)(a1 + 32);
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v9);
}

void __86__PXDreamyDiagnosticsViewController__loadAndCacheVariantVideoURLFromAsset_completion___block_invoke_2(uint64_t a1)
{
  int v2;
  id *v3;
  id WeakRetained;
  int v5;
  id v6;
  uint64_t v7;
  id v8;

  v2 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v3 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = objc_msgSend(WeakRetained, "variantVideoRequestID");

  if (v2 == v5)
  {
    v6 = objc_loadWeakRetained(v3);
    objc_msgSend(v6, "setVariantVideoRequestID:", 0);

    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_loadWeakRetained(v3);
    objc_msgSend(v8, "setVariantVideoURL:", v7);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __89__PXDreamyDiagnosticsViewController_prepareVariantVideoForExportWithProgress_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__PXDreamyDiagnosticsViewController_prepareVariantVideoWithProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CMTimeRange v8;
  CMTime start;
  CMTime duration;
  CMTimeRange v11;

  v3 = (objc_class *)MEMORY[0x1E0C8B300];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithURL:", v4);

  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "duration");
  else
    memset(&duration, 0, sizeof(duration));
  start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  CMTimeRangeMake(&v11, &start, &duration);
  v8 = v11;
  objc_msgSend(v5, "setLoopTimeRange:", &v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
