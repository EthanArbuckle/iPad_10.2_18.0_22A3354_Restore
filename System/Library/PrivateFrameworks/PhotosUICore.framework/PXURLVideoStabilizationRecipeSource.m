@implementation PXURLVideoStabilizationRecipeSource

- (PXURLVideoStabilizationRecipeSource)initWithVideoURL:(id)a3
{
  id v4;
  PXURLVideoStabilizationRecipeSource *v5;
  uint64_t v6;
  NSURL *inputVideoURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXURLVideoStabilizationRecipeSource;
  v5 = -[PXVideoStabilizationRecipeSource init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    inputVideoURL = v5->_inputVideoURL;
    v5->_inputVideoURL = (NSURL *)v6;

  }
  return v5;
}

- (id)analyticsPayload
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)_loadStabilizationRecipe:(id *)a3 analysisType:(unint64_t *)a4
{
  void *v5;
  id PIPhotoEditHelperClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  id PIVideoStabilizeRequestClass;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  PIVideoStabilizeRequest *v31;
  PIVideoStabilizeRequest *stabilizeRequest;
  void *v33;
  PIVideoStabilizeRequest *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  unint64_t v39;
  void *v40;
  void *v41;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSURL *v51;
  _QWORD v52[4];
  NSObject *v53;
  __int128 *p_buf;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  id v62;
  const __CFString *v63;
  void *v64;
  uint8_t v65[4];
  uint64_t v66;
  __int128 buf;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v51 = self->_inputVideoURL;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71BC8]), "initWithVideoURL:", v51);
  PIPhotoEditHelperClass = getPIPhotoEditHelperClass();
  v7 = (void *)objc_msgSend(getPIPhotoEditHelperClass(), "newComposition");
  v8 = (void *)objc_msgSend(PIPhotoEditHelperClass, "newCompositionControllerWithComposition:", v7);

  v47 = v5;
  objc_msgSend(v5, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSource:mediaType:", v9, 2);

  v10 = (void *)objc_msgSend(v8, "copy");
  v11 = getPIPhotoEditHelperClass();
  v48 = v10;
  objc_msgSend(v10, "composition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imagePropertiesRequestWithComposition:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setName:", CFSTR("PXStabilizedPlayerItemWithVideoURL-imageProperties"));
  v62 = 0;
  objc_msgSend(v13, "submitSynchronous:", &v62);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v62;
  v46 = v15;
  if (v14)
  {
    objc_msgSend(v14, "properties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "orientation");

    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v18 = (uint64_t (*)(uint64_t))getNUOrientationIsValidSymbolLoc_ptr;
    v59 = (uint64_t (*)(uint64_t, uint64_t))getNUOrientationIsValidSymbolLoc_ptr;
    if (!getNUOrientationIsValidSymbolLoc_ptr)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v68 = (uint64_t)__getNUOrientationIsValidSymbolLoc_block_invoke;
      v69 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E51482E0;
      v70 = (void (*)(uint64_t))&v56;
      __getNUOrientationIsValidSymbolLoc_block_invoke(&buf);
      v18 = (uint64_t (*)(uint64_t))v57[3];
    }
    _Block_object_dispose(&v56, 8);
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NUOrientation SOFT_LINKED_NUOrientationIsValid(NUOrientation)");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("PXVideoStabilizationRecipeSource.m"), 40, CFSTR("%s"), dlerror());

      __break(1u);
    }
    if (v18(v17))
    {
      objc_msgSend(MEMORY[0x1E0D71660], "compositionController:setInputOrientation:", v8, v17);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v17;
      _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "image orientation from the image properties is invalid: %d", (uint8_t *)&buf, 8u);
    }
    v20 = 0;
  }
  else
  {
    v19 = v15;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v19;
      _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error encountered determining image properties for stabilized video composition: %@", (uint8_t *)&buf, 0xCu);
    }
    v20 = v19;
  }
  PIVideoStabilizeRequestClass = getPIVideoStabilizeRequestClass();
  objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v51);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(PIVideoStabilizeRequestClass, "canPerformGyroBasedStabilizationForAsset:", v22);

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__198171;
  v70 = __Block_byref_object_dispose__198172;
  v71 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__198171;
  v60 = __Block_byref_object_dispose__198172;
  v61 = 0;
  v24 = dispatch_group_create();
  if ((-[PXVideoStabilizationRecipeSource allowedAnalysisTypes](self, "allowedAnalysisTypes") & 1) != 0)
    v25 = -[PXVideoStabilizationRecipeSource allowsOnDemandPixelAnalysis](self, "allowsOnDemandPixelAnalysis");
  else
    v25 = 0;
  v26 = -[PXVideoStabilizationRecipeSource allowedAnalysisTypes](self, "allowedAnalysisTypes");
  v27 = v25 | 2;
  if (!(_DWORD)v23)
    v27 = v25;
  if ((v26 & 2) != 0)
    v28 = v27;
  else
    v28 = v25;
  v29 = objc_alloc((Class)getPIVideoStabilizeRequestClass());
  objc_msgSend(v8, "composition");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (PIVideoStabilizeRequest *)objc_msgSend(v29, "initWithComposition:", v30);
  stabilizeRequest = self->_stabilizeRequest;
  self->_stabilizeRequest = v31;

  +[PXInlineVideoStabilizationSettings sharedInstance](PXInlineVideoStabilizationSettings, "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "allowedCropFraction");
  -[PIVideoStabilizeRequest setAllowedCropFraction:](self->_stabilizeRequest, "setAllowedCropFraction:");

  -[PIVideoStabilizeRequest setAllowedAnalysisTypes:](self->_stabilizeRequest, "setAllowedAnalysisTypes:", v28);
  -[PIVideoStabilizeRequest setName:](self->_stabilizeRequest, "setName:", CFSTR("PXStabilizedPlayerItemWithVideoURL-stabilize"));
  dispatch_group_enter(v24);
  v34 = self->_stabilizeRequest;
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __77__PXURLVideoStabilizationRecipeSource__loadStabilizationRecipe_analysisType___block_invoke;
  v52[3] = &unk_1E5134A20;
  p_buf = &buf;
  v55 = &v56;
  v35 = v24;
  v53 = v35;
  -[PIVideoStabilizeRequest submit:](v34, "submit:", v52);
  dispatch_group_wait(v35, 0xFFFFFFFFFFFFFFFFLL);
  v36 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (v36)
  {
    objc_msgSend(v36, "rawHomographies");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v43 = v57[5];
      *(_DWORD *)v65 = 138412290;
      v66 = v43;
      _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error encountered generating stabilization data: %@", v65, 0xCu);
    }
    v38 = (id)v57[5];

    v37 = 0;
    v20 = v38;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v20);
  if (a4)
  {
    v39 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "analysisType");
    if (v39 <= 2)
      *a4 = v39;
  }
  v63 = CFSTR("InputVideoHasGyro");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVideoStabilizationRecipeSource setDebugInfo:](self, "setDebugInfo:", v41);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&buf, 8);

  return v37;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stabilizeRequest, 0);
  objc_storeStrong((id *)&self->_inputVideoURL, 0);
}

void __77__PXURLVideoStabilizationRecipeSource__loadStabilizationRecipe_analysisType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(a2, "result:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
