@implementation PXAssetVariationRenderingOperation

- (PXAssetVariationRenderingOperation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetVariationRenderingOperation.m"), 65, CFSTR("%s is not available as initializer"), "-[PXAssetVariationRenderingOperation init]");

  abort();
}

- (PXAssetVariationRenderingOperation)initWithEditSource:(id)a3 variationType:(int64_t)a4 analysisResult:(id)a5 baseCompositionController:(id)a6 outputImageURL:(id)a7 outputVideoURL:(id)a8 targetSize:(CGSize)a9 renderAllResources:(BOOL)a10
{
  double height;
  double width;
  id v20;
  id v21;
  id v22;
  id v23;
  PXAssetVariationRenderingOperation *v24;
  PXAssetVariationRenderingOperation *v25;
  uint64_t v26;
  NSDictionary *analysisResult;
  uint64_t v28;
  PICompositionController *baseCompositionController;
  uint64_t v30;
  NSProgress *progress;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id location;
  objc_super v38;

  height = a9.height;
  width = a9.width;
  v34 = a3;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  if (width <= 0.0 || height <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetVariationRenderingOperation.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetSize.width > 0 && targetSize.height > 0"));

  }
  v38.receiver = self;
  v38.super_class = (Class)PXAssetVariationRenderingOperation;
  v24 = -[PXAssetVariationRenderingOperation init](&v38, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_editSource, a3);
    v25->_variationType = a4;
    v26 = objc_msgSend(v20, "copy");
    analysisResult = v25->_analysisResult;
    v25->_analysisResult = (NSDictionary *)v26;

    v28 = objc_msgSend(v21, "copy");
    baseCompositionController = v25->_baseCompositionController;
    v25->_baseCompositionController = (PICompositionController *)v28;

    objc_storeStrong((id *)&v25->_outputImageURL, a7);
    v25->_targetSize.width = width;
    v25->_targetSize.height = height;
    objc_storeStrong((id *)&v25->_outputVideoURL, a8);
    v25->_renderAllResources = a10;
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 50);
    v30 = objc_claimAutoreleasedReturnValue();
    progress = v25->_progress;
    v25->_progress = (NSProgress *)v30;

    objc_initWeak(&location, v25);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __172__PXAssetVariationRenderingOperation_initWithEditSource_variationType_analysisResult_baseCompositionController_outputImageURL_outputVideoURL_targetSize_renderAllResources___block_invoke;
    v35[3] = &unk_1E5148D30;
    objc_copyWeak(&v36, &location);
    -[NSProgress setCancellationHandler:](v25->_progress, "setCancellationHandler:", v35);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

  return v25;
}

- (void)_timeout
{
  void *v3;
  void *v4;
  NSError *v5;
  NSError *error;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if ((-[PXAssetVariationRenderingOperation isFinished](self, "isFinished") & 1) == 0)
  {
    self->_succeeded = 0;
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB2D50];
    v8[0] = CFSTR("Rendering timed out");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("PXAssetVariationRenderingOperationErrorDomain"), 0, v4);
    v5 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v5;

    -[PXAssetVariationRenderingOperation cancel](self, "cancel");
  }
}

- (void)cancel
{
  objc_super v3;

  if ((-[PXAssetVariationRenderingOperation isFinished](self, "isFinished") & 1) == 0)
    kdebug_trace();
  v3.receiver = self;
  v3.super_class = (Class)PXAssetVariationRenderingOperation;
  -[PXAssetVariationRenderingOperation cancel](&v3, sel_cancel);
}

- (void)main
{
  dispatch_time_t v3;
  int64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void (**v11)(void);
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  dispatch_time_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id *v23;
  AVVideoComposition *v24;
  void *outputVideoComposition;
  uint64_t v26;
  NSObject *v27;
  id v28;
  dispatch_time_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  dispatch_time_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  dispatch_time_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  dispatch_time_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  NSNumber *v69;
  NSNumber *duration;
  PXAssetVariationRenderingOperation *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id obj;
  void *v80;
  _QWORD v81[5];
  NSObject *v82;
  uint64_t *v83;
  _QWORD v84[4];
  id v85;
  NSObject *v86;
  uint64_t *v87;
  _QWORD v88[4];
  id v89;
  NSObject *v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  char v95;
  _QWORD v96[5];
  _QWORD v97[4];
  NSObject *v98;
  uint64_t *v99;
  uint64_t *v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t (*v109)(uint64_t, uint64_t);
  void (*v110)(uint64_t);
  id v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t);
  id v117;
  _QWORD v118[4];
  _QWORD v119[3];
  _QWORD v120[4];
  _QWORD v121[5];
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  uint64_t (*v125)(uint64_t, uint64_t);
  void (*v126)(uint64_t);
  id v127;
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t (*v131)(uint64_t, uint64_t);
  void (*v132)(uint64_t);
  id v133;
  _QWORD v134[4];
  id v135;
  int64_t v136;
  uint64_t v137;
  uint64_t *v138;
  uint64_t v139;
  uint64_t (*v140)(uint64_t, uint64_t);
  void (*v141)(uint64_t);
  id v142;
  uint64_t v143;
  uint64_t *v144;
  uint64_t v145;
  char v146;
  _QWORD block[4];
  id v148;
  id location;
  uint64_t v150;
  const __CFString *v151;
  uint64_t v152;
  const __CFString *v153;
  uint64_t v154;
  const __CFString *v155;
  uint64_t v156;
  const __CFString *v157;
  uint64_t v158;
  const __CFString *v159;
  uint64_t v160;
  const __CFString *v161;
  uint64_t v162;
  _QWORD v163[3];

  v163[1] = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 20000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PXAssetVariationRenderingOperation_main__block_invoke;
  block[3] = &unk_1E5148D30;
  objc_copyWeak(&v148, &location);
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
  v4 = -[PXAssetVariationRenderingOperation variationType](self, "variationType");
  -[PXAssetVariationRenderingOperation baseCompositionController](self, "baseCompositionController");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetVariationRenderingOperation editSource](self, "editSource");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetVariationRenderingOperation outputImageURL](self, "outputImageURL");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetVariationRenderingOperation outputVideoURL](self, "outputVideoURL");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetVariationRenderingOperation analysisResult](self, "analysisResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetVariationRenderingOperation targetSize](self, "targetSize");
  v7 = v6;
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71660], "adjustmentConstants");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetVariationRenderingOperation startHandler](self, "startHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PXAssetVariationRenderingOperation startHandler](self, "startHandler");
    v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v11[2]();

  }
  -[PXAssetVariationRenderingOperation _incrementProgressWithStartDate:](self, "_incrementProgressWithStartDate:", v78);
  v143 = 0;
  v144 = &v143;
  v145 = 0x2020000000;
  v146 = 1;
  v137 = 0;
  v138 = &v137;
  v139 = 0x3032000000;
  v140 = __Block_byref_object_copy__72362;
  v141 = __Block_byref_object_dispose__72363;
  v142 = 0;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71990]), "initWithEditSource:renderPriority:", v80, 2);
  obj = (id)objc_msgSend(v77, "copy");
  v134[0] = MEMORY[0x1E0C809B0];
  v134[1] = 3221225472;
  v134[2] = __42__PXAssetVariationRenderingOperation_main__block_invoke_150;
  v134[3] = &unk_1E5121350;
  v136 = v4;
  v72 = v5;
  v135 = v72;
  objc_msgSend(v12, "applySourceChangesToCompositionSynchronously:source:withBlock:", obj, v80, v134);
  objc_storeStrong((id *)&self->_adjustedCompositionController, obj);
  objc_msgSend(v12, "setCompositionController:", self->_adjustedCompositionController);
  v128 = 0;
  v129 = &v128;
  v130 = 0x3032000000;
  v131 = __Block_byref_object_copy__72362;
  v132 = __Block_byref_object_dispose__72363;
  v133 = 0;
  v122 = 0;
  v123 = &v122;
  v124 = 0x3032000000;
  v125 = __Block_byref_object_copy__72362;
  v126 = __Block_byref_object_dispose__72363;
  v127 = 0;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = dispatch_group_create();
  if ((unint64_t)(v4 - 1) >= 2
    && !-[PXAssetVariationRenderingOperation renderAllResources](self, "renderAllResources"))
  {
    goto LABEL_19;
  }
  +[PXAssetVariationsSettings sharedInstance](PXAssetVariationsSettings, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "useLiveRenderedPreviews"))
  {
    v16 = -[PXAssetVariationRenderingOperation renderAllResources](self, "renderAllResources");

    if (!v16)
    {
      dispatch_group_enter(v14);
      v120[0] = MEMORY[0x1E0C809B0];
      v120[2] = __42__PXAssetVariationRenderingOperation_main__block_invoke_2;
      v120[3] = &unk_1E513E740;
      v121[1] = &v143;
      v121[2] = &v128;
      v121[3] = &v122;
      v121[4] = &v137;
      v120[1] = 3221225472;
      v17 = v14;
      v121[0] = v17;
      objc_msgSend(v12, "renderVideoWithTargetSize:contentMode:name:completion:", 0, CFSTR("PXAssetVariationRenderingOperation-renderVideo"), v120, v7, v9);
      v18 = dispatch_time(0, 20000000000);
      if (dispatch_group_wait(v17, v18))
      {
        *((_BYTE *)v144 + 24) = 0;
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v162 = *MEMORY[0x1E0CB2D50];
        v163[0] = CFSTR("Video rendering timed out.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v163, &v162, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("PXAssetVariationRenderingOperationErrorDomain"), 0, v20);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v138[5];
        v138[5] = v21;

      }
      objc_storeStrong((id *)&self->_outputAVAsset, (id)v129[5]);
      v23 = (id *)v121;
      v24 = (AVVideoComposition *)(id)v123[5];
      outputVideoComposition = self->_outputVideoComposition;
      self->_outputVideoComposition = v24;
      goto LABEL_13;
    }
  }
  else
  {

  }
  dispatch_group_enter(v14);
  v26 = *MEMORY[0x1E0C89E28];
  v118[0] = MEMORY[0x1E0C809B0];
  v118[1] = 3221225472;
  v118[2] = __42__PXAssetVariationRenderingOperation_main__block_invoke_3;
  v118[3] = &unk_1E5121378;
  v119[1] = &v143;
  v119[2] = &v137;
  v27 = v14;
  v119[0] = v27;
  v28 = (id)objc_msgSend(v12, "exportVideoToURL:preset:livePhotoPairingIdentifier:completion:", v75, v26, v76, v118);
  v23 = (id *)v119;
  v29 = dispatch_time(0, 20000000000);
  if (dispatch_group_wait(v27, v29))
  {
    *((_BYTE *)v144 + 24) = 0;
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v160 = *MEMORY[0x1E0CB2D50];
    v161 = CFSTR("Video rendering timed out.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v161, &v160, 1);
    outputVideoComposition = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("PXAssetVariationRenderingOperationErrorDomain"), 0, outputVideoComposition);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v138[5];
    v138[5] = v31;

LABEL_13:
  }

  if (*((_BYTE *)v144 + 24) && !-[PXAssetVariationRenderingOperation isCancelled](self, "isCancelled"))
  {
    if ((unint64_t)(v4 - 3) >= 0xFFFFFFFFFFFFFFFELL
      && !-[PXAssetVariationRenderingOperation renderAllResources](self, "renderAllResources"))
    {
LABEL_45:
      self->_succeeded = *((_BYTE *)v144 + 24);
      objc_storeStrong((id *)&self->_error, (id)v138[5]);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "timeIntervalSinceDate:", v78);
      v68 = v67;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v68);
      v69 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      duration = self->_duration;
      self->_duration = v69;

      -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", -[NSProgress totalUnitCount](self->_progress, "totalUnitCount"));
      v71 = self;
      kdebug_trace();

      goto LABEL_46;
    }
LABEL_19:
    if (self->_variationType == 3
      && -[PXAssetVariationRenderingOperation renderAllResources](self, "renderAllResources"))
    {
      dispatch_group_enter(v14);
      v112 = 0;
      v113 = &v112;
      v114 = 0x3032000000;
      v115 = __Block_byref_object_copy__72362;
      v116 = __Block_byref_object_dispose__72363;
      v117 = 0;
      v106 = 0;
      v107 = &v106;
      v108 = 0x3032000000;
      v109 = __Block_byref_object_copy__72362;
      v110 = __Block_byref_object_dispose__72363;
      v111 = 0;
      v102 = 0;
      v103 = &v102;
      v104 = 0x2020000000;
      v105 = 0;
      v97[0] = MEMORY[0x1E0C809B0];
      v97[1] = 3221225472;
      v97[2] = __42__PXAssetVariationRenderingOperation_main__block_invoke_4;
      v97[3] = &unk_1E51213A0;
      v99 = &v102;
      v100 = &v112;
      v101 = &v106;
      v33 = v14;
      v98 = v33;
      objc_msgSend(v12, "calculateLongExposureFusionParametersWithCompletionHandler:", v97);
      v34 = dispatch_time(0, 20000000000);
      if (dispatch_group_wait(v33, v34))
      {
        *((_BYTE *)v144 + 24) = 0;
        v35 = (void *)MEMORY[0x1E0CB35C8];
        v158 = *MEMORY[0x1E0CB2D50];
        v159 = CFSTR("Long exposure fusion calculation timed out.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v159, &v158, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("PXAssetVariationRenderingOperationErrorDomain"), 0, v36);
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = (void *)v138[5];
        v138[5] = v37;

      }
      if (*((_BYTE *)v103 + 24))
      {
        if (objc_msgSend((id)v113[5], "count"))
        {
          objc_msgSend(v74, "PIHighResFusionAdjustmentKey");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v96[0] = MEMORY[0x1E0C809B0];
          v96[1] = 3221225472;
          v96[2] = __42__PXAssetVariationRenderingOperation_main__block_invoke_5;
          v96[3] = &unk_1E51213C8;
          v96[4] = &v112;
          objc_msgSend(v77, "modifyAdjustmentWithKey:modificationBlock:", v39, v96);

        }
        dispatch_group_enter(v33);
        v92 = 0;
        v93 = &v92;
        v94 = 0x2020000000;
        v95 = 0;
        v88[0] = MEMORY[0x1E0C809B0];
        v88[1] = 3221225472;
        v88[2] = __42__PXAssetVariationRenderingOperation_main__block_invoke_6;
        v88[3] = &unk_1E51213F0;
        v91 = &v92;
        v89 = v73;
        v40 = v33;
        v90 = v40;
        objc_msgSend(v12, "generateJPEGImageDataWithCompressionQuality:livePhotoPairingIdentifier:completionHandler:", v76, v88, 0.899999976);
        v41 = dispatch_time(0, 20000000000);
        if (dispatch_group_wait(v40, v41))
        {
          *((_BYTE *)v144 + 24) = 0;
          v42 = (void *)MEMORY[0x1E0CB35C8];
          v156 = *MEMORY[0x1E0CB2D50];
          v157 = CFSTR("Long exposure fusion rendering timed out.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v157, &v156, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("PXAssetVariationRenderingOperationErrorDomain"), 0, v43);
          v44 = objc_claimAutoreleasedReturnValue();
          v45 = (void *)v138[5];
          v138[5] = v44;

        }
        if (!*((_BYTE *)v93 + 24))
        {
          *((_BYTE *)v144 + 24) = 0;
          v46 = (void *)MEMORY[0x1E0CB35C8];
          v154 = *MEMORY[0x1E0CB2D50];
          v155 = CFSTR("Long exposure fusion rendering failed.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("PXAssetVariationRenderingOperationErrorDomain"), 0, v47);
          v48 = objc_claimAutoreleasedReturnValue();
          v49 = (void *)v138[5];
          v138[5] = v48;

        }
        _Block_object_dispose(&v92, 8);
      }
      else
      {
        v62 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v62, "setObject:forKeyedSubscript:", CFSTR("Long exposure fusion calculation failed."), *MEMORY[0x1E0CB2D50]);
        v63 = v107[5];
        if (v63)
          objc_msgSend(v62, "setObject:forKeyedSubscript:", v63, *MEMORY[0x1E0CB3388]);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PXAssetVariationRenderingOperationErrorDomain"), 0, v62);
        v64 = objc_claimAutoreleasedReturnValue();
        v65 = (void *)v138[5];
        v138[5] = v64;

      }
      _Block_object_dispose(&v102, 8);
      _Block_object_dispose(&v106, 8);

      _Block_object_dispose(&v112, 8);
    }
    else
    {
      objc_msgSend(v74, "PIHighResFusionAdjustmentKey");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "removeAdjustmentWithKey:", v50);

      if (!v4)
      {
        objc_msgSend(v74, "PIAutoLoopAdjustmentKey");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "removeAdjustmentWithKey:", v51);

      }
      v112 = 0;
      v113 = &v112;
      v114 = 0x2020000000;
      LOBYTE(v115) = 0;
      v52 = -[PXAssetVariationRenderingOperation renderAllResources](self, "renderAllResources");
      dispatch_group_enter(v14);
      if (v52)
      {
        v84[0] = MEMORY[0x1E0C809B0];
        v84[1] = 3221225472;
        v84[2] = __42__PXAssetVariationRenderingOperation_main__block_invoke_7;
        v84[3] = &unk_1E51213F0;
        v87 = &v112;
        v85 = v73;
        v86 = v14;
        objc_msgSend(v12, "generateJPEGImageDataWithCompressionQuality:livePhotoPairingIdentifier:completionHandler:", v76, v84, 0.899999976);

      }
      else
      {
        v81[0] = MEMORY[0x1E0C809B0];
        v81[1] = 3221225472;
        v81[2] = __42__PXAssetVariationRenderingOperation_main__block_invoke_8;
        v81[3] = &unk_1E5121418;
        v83 = &v112;
        v81[4] = self;
        v82 = v14;
        objc_msgSend(v12, "renderImageWithTargetSize:contentMode:name:completion:", 0, CFSTR("PXAssetVariationRenderingOperation-renderImage"), v81, v7, v9);

      }
      v53 = dispatch_time(0, 20000000000);
      if (dispatch_group_wait(v14, v53))
      {
        *((_BYTE *)v144 + 24) = 0;
        v54 = (void *)MEMORY[0x1E0CB35C8];
        v152 = *MEMORY[0x1E0CB2D50];
        v153 = CFSTR("Image rendering timed out.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v153, &v152, 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "errorWithDomain:code:userInfo:", CFSTR("PXAssetVariationRenderingOperationErrorDomain"), 0, v55);
        v56 = objc_claimAutoreleasedReturnValue();
        v57 = (void *)v138[5];
        v138[5] = v56;

      }
      if (!*((_BYTE *)v113 + 24))
      {
        v58 = (void *)MEMORY[0x1E0CB35C8];
        v150 = *MEMORY[0x1E0CB2D50];
        v151 = CFSTR("Image rendering failed.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v151, &v150, 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "errorWithDomain:code:userInfo:", CFSTR("PXAssetVariationRenderingOperationErrorDomain"), 0, v59);
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = (void *)v138[5];
        v138[5] = v60;

      }
      _Block_object_dispose(&v112, 8);
    }
    goto LABEL_45;
  }
  objc_storeStrong((id *)&self->_error, (id)v138[5]);
LABEL_46:

  _Block_object_dispose(&v122, 8);
  _Block_object_dispose(&v128, 8);

  _Block_object_dispose(&v137, 8);
  _Block_object_dispose(&v143, 8);

  objc_destroyWeak(&v148);
  objc_destroyWeak(&location);
}

- (void)_incrementProgressWithStartDate:(id)a3
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PXAssetVariationRenderingOperation__incrementProgressWithStartDate___block_invoke;
  block[3] = &unk_1E5147280;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (int64_t)variationType
{
  return self->_variationType;
}

- (PLLivePhotoEditSource)editSource
{
  return self->_editSource;
}

- (NSDictionary)analysisResult
{
  return self->_analysisResult;
}

- (PICompositionController)baseCompositionController
{
  return self->_baseCompositionController;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)renderAllResources
{
  return self->_renderAllResources;
}

- (id)startHandler
{
  return self->_startHandler;
}

- (void)setStartHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSURL)outputImageURL
{
  return self->_outputImageURL;
}

- (UIImage)outputImage
{
  return self->_outputImage;
}

- (NSURL)outputVideoURL
{
  return self->_outputVideoURL;
}

- (PICompositionController)adjustedCompositionController
{
  return self->_adjustedCompositionController;
}

- (AVAsset)outputAVAsset
{
  return self->_outputAVAsset;
}

- (AVVideoComposition)outputVideoComposition
{
  return self->_outputVideoComposition;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (NSError)error
{
  return self->_error;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_outputVideoComposition, 0);
  objc_storeStrong((id *)&self->_outputAVAsset, 0);
  objc_storeStrong((id *)&self->_adjustedCompositionController, 0);
  objc_storeStrong((id *)&self->_outputVideoURL, 0);
  objc_storeStrong((id *)&self->_outputImage, 0);
  objc_storeStrong((id *)&self->_outputImageURL, 0);
  objc_storeStrong(&self->_startHandler, 0);
  objc_storeStrong((id *)&self->_baseCompositionController, 0);
  objc_storeStrong((id *)&self->_analysisResult, 0);
  objc_storeStrong((id *)&self->_editSource, 0);
}

void __70__PXAssetVariationRenderingOperation__incrementProgressWithStartDate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "progress");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v6 = v5;

    if (v6 + v6 <= 1.0)
      v7 = v6 + v6;
    else
      v7 = 1.0;
    objc_msgSend(v3, "setCompletedUnitCount:", (uint64_t)(v7 * (double)objc_msgSend(v3, "totalUnitCount")));
    objc_msgSend(v8, "_incrementProgressWithStartDate:", *(_QWORD *)(a1 + 32));

    WeakRetained = v8;
  }

}

void __42__PXAssetVariationRenderingOperation_main__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_timeout");

}

void __42__PXAssetVariationRenderingOperation_main__block_invoke_150(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D71660];
  v4 = *(unsigned __int16 *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "compositionController:applyAssetVariation:withRecipe:", v5, v4, *(_QWORD *)(a1 + 32));

}

void __42__PXAssetVariationRenderingOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  BOOL v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v9)
    v13 = *(_BYTE *)(v12 + 24) == 0;
  else
    v13 = 1;
  v14 = !v13;
  *(_BYTE *)(v12 + 24) = v14;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  if (v11)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB3388];
    v21[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("PXAssetVariationRenderingOperationErrorDomain"), 0, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __42__PXAssetVariationRenderingOperation_main__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v7 + 24))
    v8 = a2;
  else
    v8 = 0;
  *(_BYTE *)(v7 + 24) = v8;
  if (v5)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB3388];
    v15[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PXAssetVariationRenderingOperationErrorDomain"), 0, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __42__PXAssetVariationRenderingOperation_main__block_invoke_4(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v14 = v7;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;
  v13 = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__PXAssetVariationRenderingOperation_main__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = a2;
  objc_msgSend(v3, "setAlignment:", v2);
  objc_msgSend(v3, "setEnabled:", 1);

}

void __42__PXAssetVariationRenderingOperation_main__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3 != 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "writeToURL:atomically:", *(_QWORD *)(a1 + 32), 1);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __42__PXAssetVariationRenderingOperation_main__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3 != 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "writeToURL:atomically:", *(_QWORD *)(a1 + 32), 1);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __42__PXAssetVariationRenderingOperation_main__block_invoke_8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2 != 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", a2);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 304);
    *(_QWORD *)(v4 + 304) = v3;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __172__PXAssetVariationRenderingOperation_initWithEditSource_variationType_analysisResult_baseCompositionController_outputImageURL_outputVideoURL_targetSize_renderAllResources___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancel");

}

@end
