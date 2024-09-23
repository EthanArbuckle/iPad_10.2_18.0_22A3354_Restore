@implementation PXInlineVideoStabilizationDiagnosticsViewController

- (PXInlineVideoStabilizationDiagnosticsViewController)initWithInputAsset:(id)a3
{
  PXInlineVideoStabilizationDiagnosticsViewController *v3;
  NSOperationQueue *v4;
  NSOperationQueue *operationQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXInlineVideoStabilizationDiagnosticsViewController;
  v3 = -[PXVideoComparisonViewController initWithInputAsset:](&v7, sel_initWithInputAsset_, a3);
  if (v3)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v3->_operationQueue;
    v3->_operationQueue = v4;

  }
  return v3;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXInlineVideoStabilizationDiagnosticsViewController;
  -[PXVideoComparisonViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PXInlineVideoStabilizationDiagnosticsViewController setTitle:](self, "setTitle:", CFSTR("Inline Stabilization"));
}

- (id)settings
{
  return +[PXInlineVideoStabilizationSettings sharedInstance](PXInlineVideoStabilizationSettings, "sharedInstance");
}

- (BOOL)useVariantVideoByDefaultInToggle
{
  return 1;
}

- (id)inputVideoButtonsTitle
{
  return CFSTR("Original");
}

- (id)variantVideoButtonsTitle
{
  return CFSTR("Stabilized");
}

- (id)variantVideoDescription
{
  void *v2;
  void *v3;

  -[PXVideoStabilizeResult dictionaryRepresentation](self->_result, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)extraAlertAction
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__PXInlineVideoStabilizationDiagnosticsViewController_extraAlertAction__block_invoke;
  v3[3] = &unk_1E5144530;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Export Analysis Result"), 0, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)radarTitle
{
  return CFSTR("[Stabilization] Feedback: ");
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

- (void)invalidateInputAndVariantReferences
{
  PXVideoStabilizeResult *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXInlineVideoStabilizationDiagnosticsViewController;
  -[PXVideoComparisonViewController invalidateInputAndVariantReferences](&v4, sel_invalidateInputAndVariantReferences);
  result = self->_result;
  self->_result = 0;

}

- (void)prepareVariantVideoWithProgress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PXVideoStabilizeOperation *v8;
  PXVideoStabilizeOperation *stabilizeOperation;
  PXVideoStabilizeOperation *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[PXInlineVideoStabilizationDiagnosticsViewController _newStabilizeOperation](self, "_newStabilizeOperation");
  stabilizeOperation = self->_stabilizeOperation;
  self->_stabilizeOperation = v8;

  v10 = self->_stabilizeOperation;
  if (v10)
  {
    -[PXVideoProcessingOperation spec](v10, "spec");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPerformStabilization:", 1);

    objc_initWeak(&location, self);
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __98__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoWithProgress_completion___block_invoke;
    v18[3] = &unk_1E5146480;
    objc_copyWeak(&v20, &location);
    v19 = v7;
    -[PXVideoStabilizeOperation setCompletionBlock:](self->_stabilizeOperation, "setCompletionBlock:", v18);
    v13 = v12;
    v14 = 3221225472;
    v15 = __98__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoWithProgress_completion___block_invoke_3;
    v16 = &unk_1E5119A78;
    v17 = v6;
    -[PXVideoProcessingOperation setProgressHandler:](self->_stabilizeOperation, "setProgressHandler:", &v13);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", self->_stabilizeOperation, v13, v14, v15, v16);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

}

- (void)prepareVariantVideoForExportWithProgress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PXVideoStabilizeOperation *v8;
  PXVideoStabilizeOperation *exportOperation;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id location;
  _QWORD v35[4];
  id v36;

  v6 = a3;
  v7 = a4;
  v8 = -[PXInlineVideoStabilizationDiagnosticsViewController _newStabilizeOperation](self, "_newStabilizeOperation");
  exportOperation = self->_exportOperation;
  self->_exportOperation = v8;

  -[PXVideoComparisonViewController inputVideoURL](self, "inputVideoURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "temporaryDirectory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v10;
  objc_msgSend(v10, "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByDeletingPathExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "stringByAppendingString:", CFSTR("_render"));
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingString:", CFSTR("_info"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)v15;
  objc_msgSend(v12, "URLByAppendingPathComponent:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "URLByAppendingPathExtension:", CFSTR("mov"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "URLByAppendingPathComponent:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "URLByAppendingPathExtension:", CFSTR("plist"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXVideoProcessingOperation spec](self->_exportOperation, "spec");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setOutputURL:", v18);

  v22 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __107__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoForExportWithProgress_completion___block_invoke;
  v35[3] = &unk_1E5119A78;
  v23 = v6;
  v36 = v23;
  -[PXVideoProcessingOperation setProgressHandler:](self->_exportOperation, "setProgressHandler:", v35);
  objc_initWeak(&location, self->_exportOperation);
  v29[0] = v22;
  v29[1] = 3221225472;
  v29[2] = __107__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoForExportWithProgress_completion___block_invoke_3;
  v29[3] = &unk_1E5147230;
  objc_copyWeak(&v33, &location);
  v24 = v20;
  v30 = v24;
  v25 = v7;
  v32 = v25;
  v26 = v18;
  v31 = v26;
  -[PXVideoStabilizeOperation setCompletionBlock:](self->_exportOperation, "setCompletionBlock:", v29);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", self->_exportOperation);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

}

- (void)_exportRecipe
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[PXVideoStabilizeResult dictionaryRepresentation](self->_result, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVideoComparisonViewController inputVideoURL](self, "inputVideoURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Error"), CFSTR("Unable to retrieve recipe or input video URL"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v8);

    -[PXInlineVideoStabilizationDiagnosticsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "temporaryDirectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByAppendingString:", CFSTR("_info"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathExtension:", CFSTR("plist"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "writeToURL:error:", v13, 0);
    v14 = objc_alloc(MEMORY[0x1E0D96D28]);
    v17[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithActivityItems:applicationActivities:", v15, 0);

    -[PXInlineVideoStabilizationDiagnosticsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);
  }

}

- (void)_handleStabilizeOperationCompletedWithCompletionHandler:(id)a3
{
  PXVideoStabilizeOperation *stabilizeOperation;
  void (**v5)(id, void *, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PXVideoStabilizeResult *result;
  CMTimeRange v15;
  CMTime duration;
  CMTimeRange v17;
  CMTime start;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  stabilizeOperation = self->_stabilizeOperation;
  v5 = (void (**)(id, void *, void *))a3;
  -[PXVideoProcessingOperation result](stabilizeOperation, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outputVideoAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B300]), "initWithAsset:", v7);
    objc_msgSend(v6, "outputVideoComposition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setVideoComposition:", v9);

    objc_msgSend(v6, "outputAudioMix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAudioMix:", v10);

    objc_msgSend(v8, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "duration");
    else
      memset(&duration, 0, sizeof(duration));
    start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    CMTimeRangeMake(&v17, &start, &duration);
    v15 = v17;
    objc_msgSend(v8, "setLoopTimeRange:", &v15);

    v13 = 0;
  }
  else
  {
    objc_msgSend(v6, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LODWORD(start.value) = 138412290;
      *(CMTimeValue *)((char *)&start.value + 4) = (CMTimeValue)v13;
      _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "FAILED to stabilized video for diagnostics: %@", (uint8_t *)&start, 0xCu);
    }
    v8 = 0;
  }
  result = self->_result;
  self->_result = (PXVideoStabilizeResult *)v6;

  v5[2](v5, v8, v13);
}

- (id)_newStabilizeOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PXVideoStabilizeOperation *v7;
  CMTime *v8;
  void *v9;
  __int128 v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  PXMediaAnalysisVideoStabilizationRecipeSource *v23;
  PXMediaAnalysisVideoStabilizationRecipeSource *v24;
  PXVideoStabilizeOperationSpec *v25;
  __int128 v27;
  uint64_t v28;
  _OWORD v29[3];
  __int128 v30;
  uint64_t v31;
  CMTime time2;
  CMTime time1;
  __int128 v34;
  _OWORD v35[2];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  -[PXVideoComparisonViewController inputAsset](self, "inputAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVideoComparisonViewController inputVideoURL](self, "inputVideoURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v39 = 0uLL;
    v40 = 0;
    objc_msgSend(v3, "photoIrisProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "photoIrisStillDisplayTime");
    }
    else
    {
      v39 = 0uLL;
      v40 = 0;
    }

    v8 = (CMTime *)MEMORY[0x1E0CA2E68];
    if ((BYTE12(v39) & 0x1D) != 1)
    {
      v39 = *MEMORY[0x1E0CA2E68];
      v40 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    }
    +[PXInlineVideoStabilizationSettings sharedInstance](PXInlineVideoStabilizationSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    v36 = *MEMORY[0x1E0CA2E40];
    v37 = v10;
    v38 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
    if (objc_msgSend(v9, "timeRangeEnabled"))
    {
      memset(v35, 0, sizeof(v35));
      v34 = 0u;
      objc_msgSend(v3, "mediaAnalysisProperties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "bestVideoTimeRange");
      }
      else
      {
        memset(v35, 0, sizeof(v35));
        v34 = 0u;
      }

      if ((BYTE12(v34) & 1) != 0
        && (BYTE4(v35[1]) & 1) != 0
        && !*((_QWORD *)&v35[1] + 1)
        && (*((_QWORD *)&v35[0] + 1) & 0x8000000000000000) == 0)
      {
        time1 = *(CMTime *)((char *)v35 + 8);
        time2 = *v8;
        if (CMTimeCompare(&time1, &time2))
        {
          v36 = v34;
          v37 = v35[0];
          v38 = v35[1];
        }
      }
    }
    v34 = 0uLL;
    *(_QWORD *)&v35[0] = 0;
    if (objc_msgSend(v9, "crossfadeEnabled"))
    {
      CMTimeMakeWithSeconds((CMTime *)&v34, 0.25, 600);
    }
    else
    {
      v34 = *(_OWORD *)&v8->value;
      *(_QWORD *)&v35[0] = v8->epoch;
    }
    if (objc_msgSend(v9, "useMediaAnalysisRecipe"))
    {
      v13 = (void *)MEMORY[0x1E0D75130];
      v14 = *MEMORY[0x1E0C8A808];
      v15 = objc_alloc(MEMORY[0x1E0C8B3C0]);
      v16 = (void *)objc_msgSend(v15, "initWithURL:options:", v4, MEMORY[0x1E0C9AA70]);
      objc_msgSend(v13, "tracksWithMediaType:forAsset:", v14, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "naturalSize");
      v20 = v19;
      v22 = v21;

      v23 = -[PXMediaAnalysisVideoStabilizationRecipeSource initWithAsset:videoDimensions:]([PXMediaAnalysisVideoStabilizationRecipeSource alloc], "initWithAsset:videoDimensions:", v3, v20, v22);
    }
    else
    {
      v23 = -[PXURLVideoStabilizationRecipeSource initWithVideoURL:]([PXURLVideoStabilizationRecipeSource alloc], "initWithVideoURL:", v4);
    }
    v24 = v23;
    -[PXVideoStabilizationRecipeSource setAllowsOnDemandPixelAnalysis:](v23, "setAllowsOnDemandPixelAnalysis:", 1);
    -[PXVideoStabilizationRecipeSource setAllowedAnalysisTypes:](v24, "setAllowedAnalysisTypes:", objc_msgSend(v9, "allowedAnalysisTypes"));
    v25 = objc_alloc_init(PXVideoStabilizeOperationSpec);
    -[PXVideoProcessingOperationSpec setInputVideoURL:](v25, "setInputVideoURL:", v4);
    v30 = v39;
    v31 = v40;
    -[PXVideoStabilizeOperationSpec setStartTime:](v25, "setStartTime:", &v30);
    v29[0] = v36;
    v29[1] = v37;
    v29[2] = v38;
    -[PXVideoStabilizeOperationSpec setTimeRange:](v25, "setTimeRange:", v29);
    v27 = v34;
    v28 = *(_QWORD *)&v35[0];
    -[PXVideoStabilizeOperationSpec setCrossfadeDuration:](v25, "setCrossfadeDuration:", &v27);
    -[PXVideoStabilizeOperationSpec setRecipeSource:](v25, "setRecipeSource:", v24);
    v7 = -[PXVideoStabilizeOperation initWithSpec:]([PXVideoStabilizeOperation alloc], "initWithSpec:", v25);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_exportOperation, 0);
  objc_storeStrong((id *)&self->_stabilizeOperation, 0);
}

void __107__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoForExportWithProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  px_dispatch_on_main_queue();

}

void __107__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoForExportWithProgress_completion___block_invoke_3(id *a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "error");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[4];
    v11 = 0;
    objc_msgSend(v5, "writeToURL:error:", v6, &v11);
    v4 = v11;

  }
  v10 = a1[6];
  v8 = a1[5];
  v9 = a1[4];
  v7 = v4;
  px_dispatch_on_main_queue();

}

uint64_t __107__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoForExportWithProgress_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __107__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoForExportWithProgress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, float))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(float *)(a1 + 48));
}

void __98__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoWithProgress_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_copyWeak(&v3, (id *)(a1 + 40));
  v2 = *(id *)(a1 + 32);
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v3);
}

void __98__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoWithProgress_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  px_dispatch_on_main_queue();

}

uint64_t __98__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoWithProgress_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, float))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(float *)(a1 + 48));
}

void __98__PXInlineVideoStabilizationDiagnosticsViewController_prepareVariantVideoWithProgress_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleStabilizeOperationCompletedWithCompletionHandler:", *(_QWORD *)(a1 + 32));

}

uint64_t __71__PXInlineVideoStabilizationDiagnosticsViewController_extraAlertAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_exportRecipe");
}

@end
