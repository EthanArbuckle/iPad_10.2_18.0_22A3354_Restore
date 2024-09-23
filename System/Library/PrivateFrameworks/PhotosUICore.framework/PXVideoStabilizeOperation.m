@implementation PXVideoStabilizeOperation

- (PXVideoStabilizeOperation)initWithSpec:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXVideoStabilizeOperation;
  return -[PXVideoProcessingOperation initWithSpec:](&v4, sel_initWithSpec_, a3);
}

- (id)performProcessing
{
  _PXVideoStabilizeResult *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD, float);
  id PIPhotoEditHelperClass_249362;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PXVideoStabilizeOperation *v13;
  void *v14;
  PXVideoStabilizeOperation *v15;
  _PXVideoStabilizeResult *v16;
  _PXVideoStabilizeResult *v17;
  id v18;
  void *v19;
  uint64_t v20;
  NUImagePropertiesRequest *imagePropertiesRequest;
  NUImagePropertiesRequest *v22;
  id v23;
  void *v24;
  id NUVideoUtilitiesClass;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PXVideoStabilizeOperation *v33;
  id v34;
  void *v35;
  void *v36;
  PXVideoStabilizeOperation *v37;
  uint64_t v38;
  PLPhotoEditRenderer *renderer;
  void *v40;
  char v41;
  PLPhotoEditRenderer *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  char v49;
  id v50;
  PLPhotoEditRenderer *v51;
  uint64_t v52;
  id v53;
  NSObject *v54;
  PLPhotoEditRenderer *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  double v60;
  PXVideoStabilizeOperation *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  id v72;
  NSObject *v73;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  dispatch_group_t group;
  NSObject *groupa;
  void *v83;
  uint64_t v84;
  void *v85;
  id v86;
  int v87;
  PXVideoStabilizeOperation *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  _QWORD v95[4];
  NSObject *v96;
  __int128 *p_buf;
  uint64_t *v98;
  uint64_t *v99;
  uint64_t *v100;
  _QWORD v101[4];
  NSObject *v102;
  uint64_t *v103;
  id v104;
  _QWORD v105[4];
  id v106;
  id v107;
  PXVideoStabilizeOperation *v108;
  id v109;
  __int128 v110;
  __int128 v111;
  char v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t (*v116)(uint64_t, uint64_t);
  void (*v117)(uint64_t);
  id v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t (*v122)(uint64_t, uint64_t);
  void (*v123)(uint64_t);
  id v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t (*v128)(uint64_t, uint64_t);
  void (*v129)(uint64_t);
  id v130;
  PXVideoStabilizeOperation *v131;
  id v132;
  uint64_t v133;
  __int128 v134;
  __int128 v135;
  id v136;
  id v137;
  uint8_t v138[4];
  PXVideoStabilizeOperation *v139;
  __int16 v140;
  id v141;
  __int128 buf;
  uint64_t v143;
  uint64_t (*v144)(uint64_t, uint64_t);
  void (*v145)(uint64_t);
  id v146;
  uint64_t v147;
  _QWORD v148[4];

  v148[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(_PXVideoStabilizeResult);
  -[PXVideoProcessingOperation spec](self, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputVideoURL");
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXVideoProcessingOperation spec](self, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v5, "performStabilization");

  v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71BC8]), "initWithVideoURL:", v93);
  -[PXVideoProcessingOperation progressHandler](self, "progressHandler");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void (**)(_QWORD, _QWORD, float))v6;
  if (v6)
    (*(void (**)(uint64_t, const __CFString *, float))(v6 + 16))(v6, CFSTR("Preparing NUComposition"), 0.0);
  PIPhotoEditHelperClass_249362 = getPIPhotoEditHelperClass_249362();
  v9 = (void *)objc_msgSend(getPIPhotoEditHelperClass_249362(), "newComposition");
  v10 = (void *)objc_msgSend(PIPhotoEditHelperClass_249362, "newCompositionControllerWithComposition:", v9);

  objc_msgSend(v92, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSource:mediaType:", v11, 2);

  objc_msgSend(v10, "adjustmentConstants");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "copy");
  v13 = self;
  objc_sync_enter(v13);
  v89 = v12;
  if (!-[PXVideoStabilizeOperation isCancelled](v13, "isCancelled"))
  {
    v18 = getPIPhotoEditHelperClass_249362();
    objc_msgSend(v12, "composition");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imagePropertiesRequestWithComposition:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    imagePropertiesRequest = v13->_imagePropertiesRequest;
    v13->_imagePropertiesRequest = (NUImagePropertiesRequest *)v20;

    -[NUImagePropertiesRequest setName:](v13->_imagePropertiesRequest, "setName:", CFSTR("PXStabilizedPlayerItemWithVideoURL-imageProperties"));
    v22 = v13->_imagePropertiesRequest;
    v137 = 0;
    -[NUImagePropertiesRequest submitSynchronous:](v22, "submitSynchronous:", &v137);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v137;
    objc_sync_exit(v13);

    v17 = v3;
    if ((-[PXVideoStabilizeOperation isCancelled](v13, "isCancelled") & 1) != 0)
    {
      v15 = 0;
      v16 = 0;
LABEL_70:
      v14 = v86;
      goto LABEL_71;
    }
    v23 = objc_alloc(MEMORY[0x1E0C8B3C0]);
    v147 = *MEMORY[0x1E0C8AD90];
    v148[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v148, &v147, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = (void *)objc_msgSend(v23, "initWithURL:options:", v93, v24);

    v136 = 0;
    objc_msgSend(getNUVideoUtilitiesClass(), "firstEnabledVideoTrackInAsset:error:", v83, &v136);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v136;
    v134 = 0u;
    v135 = 0u;
    NUVideoUtilitiesClass = getNUVideoUtilitiesClass();
    if (NUVideoUtilitiesClass)
    {
      objc_msgSend(NUVideoUtilitiesClass, "cleanApertureOfTrack:oriented:", v80, 0);
      group = (dispatch_group_t)*((_QWORD *)&v135 + 1);
      v84 = v135;
    }
    else
    {
      group = 0;
      v84 = 0;
      v134 = 0u;
      v135 = 0u;
    }
    if (v91)
    {
      objc_msgSend(v91, "properties");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "orientation");

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v143 = 0x2020000000;
      v28 = getNUOrientationIsValidSymbolLoc_ptr_249366;
      v144 = (uint64_t (*)(uint64_t, uint64_t))getNUOrientationIsValidSymbolLoc_ptr_249366;
      if (!getNUOrientationIsValidSymbolLoc_ptr_249366)
      {
        v29 = NeutrinoCoreLibrary();
        v28 = dlsym(v29, "NUOrientationIsValid");
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v28;
        getNUOrientationIsValidSymbolLoc_ptr_249366 = v28;
      }
      _Block_object_dispose(&buf, 8);
      if (!v28)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NUOrientation SOFT_LINKED_NUOrientationIsValid(NUOrientation)");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "handleFailureInFunction:file:lineNumber:description:", v76, CFSTR("PXVideoStabilizeOperation.m"), 38, CFSTR("%s"), dlerror(), v79);

        goto LABEL_74;
      }
      if (((uint64_t (*)(uint64_t))v28)(v27))
      {
        objc_msgSend(MEMORY[0x1E0D71660], "compositionController:setInputOrientation:", v10, v27);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 67109120;
        DWORD1(buf) = v27;
        _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "image orientation from the image properties is invalid: %d", (uint8_t *)&buf, 8u);
      }
      v15 = 0;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v86;
        _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error encountered determining image properties for stabilized video composition: %@", (uint8_t *)&buf, 0xCu);
      }
      v15 = (PXVideoStabilizeOperation *)v86;
    }
    v133 = 0;
    if (!v87)
    {
      v85 = 0;
      goto LABEL_36;
    }
    -[PXVideoProcessingOperation spec](v13, "spec");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "recipeSource");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = 0;
    objc_msgSend(v31, "loadStabilizationRecipe:analysisType:", &v132, &v133);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (PXVideoStabilizeOperation *)v132;

    if (!v32)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v33;
        _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error encountered loading stabilization recipe: %@", (uint8_t *)&buf, 0xCu);
      }
      v37 = v33;
      goto LABEL_34;
    }
    v131 = v33;
    v34 = v32;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v143 = 0x2020000000;
    v35 = getPIVideoStabilizeResultFromHomographiesSymbolLoc_ptr;
    v144 = (uint64_t (*)(uint64_t, uint64_t))getPIVideoStabilizeResultFromHomographiesSymbolLoc_ptr;
    if (!getPIVideoStabilizeResultFromHomographiesSymbolLoc_ptr)
    {
      v36 = PhotoImagingLibrary_249376();
      v35 = dlsym(v36, "PIVideoStabilizeResultFromHomographies");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v35;
      getPIVideoStabilizeResultFromHomographiesSymbolLoc_ptr = v35;
    }
    _Block_object_dispose(&buf, 8);
    if (v35)
    {
      v17 = v3;
      ((void (*)(id, uint64_t, dispatch_group_t, PXVideoStabilizeOperation **))v35)(v34, v84, group, &v131);
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = v131;
      if (v85)
      {
LABEL_35:

LABEL_36:
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v143 = 0x3032000000;
        v144 = __Block_byref_object_copy__249380;
        v145 = __Block_byref_object_dispose__249381;
        v146 = 0;
        v125 = 0;
        v126 = &v125;
        v127 = 0x3032000000;
        v128 = __Block_byref_object_copy__249380;
        v129 = __Block_byref_object_dispose__249381;
        v130 = 0;
        v119 = 0;
        v120 = &v119;
        v121 = 0x3032000000;
        v122 = __Block_byref_object_copy__249380;
        v123 = __Block_byref_object_dispose__249381;
        v124 = 0;
        v113 = 0;
        v114 = &v113;
        v115 = 0x3032000000;
        v116 = __Block_byref_object_copy__249380;
        v117 = __Block_byref_object_dispose__249381;
        v118 = 0;
        groupa = dispatch_group_create();
        if ((-[PXVideoStabilizeOperation isCancelled](v13, "isCancelled") & 1) != 0)
        {
          v16 = 0;
LABEL_69:

          _Block_object_dispose(&v113, 8);
          _Block_object_dispose(&v119, 8);

          _Block_object_dispose(&v125, 8);
          _Block_object_dispose(&buf, 8);

          goto LABEL_70;
        }
        if (v7)
          ((void (**)(_QWORD, const __CFString *, float))v7)[2](v7, CFSTR("Rendering"), 0.9);
        v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71990]), "initWithEditSource:", v92);
        renderer = v13->_renderer;
        v13->_renderer = (PLPhotoEditRenderer *)v38;

        -[PLPhotoEditRenderer setCompositionController:](v13->_renderer, "setCompositionController:", v10);
        if (v85
          || (-[PXVideoProcessingOperation spec](v13, "spec"),
              v40 = (void *)objc_claimAutoreleasedReturnValue(),
              v41 = objc_msgSend(v40, "abortIfStabilizationFails"),
              v40,
              (v41 & 1) == 0))
        {
          v42 = v13->_renderer;
          v105[0] = MEMORY[0x1E0C809B0];
          v105[1] = 3221225472;
          v105[2] = __46__PXVideoStabilizeOperation_performProcessing__block_invoke;
          v105[3] = &unk_1E513E6F0;
          v106 = v90;
          v43 = v85;
          v112 = v87;
          v110 = v134;
          v111 = v135;
          v107 = v43;
          v108 = v13;
          v109 = v83;
          -[PLPhotoEditRenderer applySourceChangesToCompositionSynchronously:source:withBlock:](v42, "applySourceChangesToCompositionSynchronously:source:withBlock:", v10, v92, v105);

        }
        -[PXVideoProcessingOperation spec](v13, "spec");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "outputURL");
        v88 = (PXVideoStabilizeOperation *)objc_claimAutoreleasedReturnValue();

        if (!v88)
        {
          dispatch_group_enter(groupa);
          v55 = v13->_renderer;
          objc_msgSend(v91, "properties");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v56, "size");
          objc_msgSend(v91, "properties");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "size");
          v60 = (double)v59;
          v95[0] = MEMORY[0x1E0C809B0];
          v95[1] = 3221225472;
          v95[2] = __46__PXVideoStabilizeOperation_performProcessing__block_invoke_2_24;
          v95[3] = &unk_1E513E740;
          p_buf = &buf;
          v98 = &v125;
          v99 = &v119;
          v100 = &v113;
          v96 = groupa;
          -[PLPhotoEditRenderer renderVideoWithTargetSize:contentMode:name:completion:](v55, "renderVideoWithTargetSize:contentMode:name:completion:", 0, CFSTR("PXVideoStabilizeOperation-video"), v95, (double)v57, v60);

          v45 = v96;
LABEL_53:

          dispatch_group_wait(groupa, 0xFFFFFFFFFFFFFFFFLL);
          if (v7)
            ((void (**)(_QWORD, const __CFString *, float))v7)[2](v7, CFSTR("Finished!"), 1.0);
          if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v138 = 138412290;
              v139 = v15;
              _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error encountered rendering stabilized video: %@", v138, 0xCu);
            }
            v61 = (PXVideoStabilizeOperation *)(id)v114[5];

            v15 = v61;
          }
          -[PXVideoProcessingOperation spec](v13, "spec");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PXVideoStabilizeResult setSpec:](v17, "setSpec:", v62);

          -[_PXVideoStabilizeResult setOutputVideoAsset:](v17, "setOutputVideoAsset:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
          -[_PXVideoStabilizeResult setOutputVideoComposition:](v17, "setOutputVideoComposition:", v126[5]);
          -[_PXVideoStabilizeResult setOutputAudioMix:](v17, "setOutputAudioMix:", v120[5]);
          if (v85)
            v63 = v133;
          else
            v63 = 4;
          -[_PXVideoStabilizeResult setAnalysisType:](v17, "setAnalysisType:", v63);
          -[_PXVideoStabilizeResult setError:](v17, "setError:", v15);
          objc_msgSend(v85, "rawHomographies");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PXVideoStabilizeResult setStabilizationRecipe:](v17, "setStabilizationRecipe:", v64);

          -[PXVideoProcessingOperation spec](v13, "spec");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "recipeSource");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "debugInfo");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PXVideoStabilizeResult setDebugInfo:](v17, "setDebugInfo:", v67);

          -[PXVideoProcessingOperation spec](v13, "spec");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "debugInfoOutputURL");
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          if (v69)
          {
            -[_PXVideoStabilizeResult dictionaryRepresentation](v17, "dictionaryRepresentation");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = 0;
            v71 = objc_msgSend(v70, "writeToURL:error:", v69, &v94);
            v72 = v94;

            if ((v71 & 1) == 0)
            {
              PLUIGetLog();
              v73 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v138 = 138412546;
                v139 = v13;
                v140 = 2112;
                v141 = v72;
                _os_log_impl(&dword_1A6789000, v73, OS_LOG_TYPE_ERROR, "%@: Unable to write debug plist to disk. Error: %@", v138, 0x16u);
              }

            }
          }
          v16 = v17;

          goto LABEL_69;
        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXVideoStabilizeOperation path](v88, "path");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v45, "fileExistsAtPath:", v46);

        if (v47)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = 0;
          v49 = objc_msgSend(v48, "removeItemAtURL:error:", v88, &v104);
          v50 = v104;

          if ((v49 & 1) == 0)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v138 = 138412546;
              v139 = v88;
              v140 = 2112;
              v141 = v50;
              _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error encountered deleting existing file before exporting to %@: %@", v138, 0x16u);
            }
            v54 = v114[5];
            v114[5] = (uint64_t)v50;
            goto LABEL_52;
          }

        }
        dispatch_group_enter(groupa);
        v51 = v13->_renderer;
        v52 = *MEMORY[0x1E0C89E28];
        v101[0] = MEMORY[0x1E0C809B0];
        v101[1] = 3221225472;
        v101[2] = __46__PXVideoStabilizeOperation_performProcessing__block_invoke_20;
        v101[3] = &unk_1E513E718;
        v103 = &v113;
        v102 = groupa;
        v53 = (id)-[PLPhotoEditRenderer exportVideoToURL:preset:livePhotoPairingIdentifier:completion:](v51, "exportVideoToURL:preset:livePhotoPairingIdentifier:completion:", v88, v52, 0, v101);
        v54 = v102;
LABEL_52:

        goto LABEL_53;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v37;
        _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error encountered loading stabilization recipe: %@", (uint8_t *)&buf, 0xCu);
      }
LABEL_34:
      v37 = v37;

      v85 = 0;
      v15 = v37;
      goto LABEL_35;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<PIVideoStabilizeResult>  _Nullable SOFT_LINKED_PIVideoStabilizeResultFromHomographies(NSDictionary *__strong, NUPixelSize, NSError *__autoreleasing *)");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "handleFailureInFunction:file:lineNumber:description:", v78, CFSTR("PXVideoStabilizeOperation.m"), 37, CFSTR("%s"), dlerror(), v79);

LABEL_74:
    __break(1u);
  }
  objc_sync_exit(v13);

  v91 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = v3;
LABEL_71:

  return v16;
}

- (void)cancel
{
  PXVideoStabilizeOperation *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXVideoStabilizeOperation;
  -[PXVideoStabilizeOperation cancel](&v6, sel_cancel);
  v3 = self;
  objc_sync_enter(v3);
  -[PLPhotoEditRenderer cancelAllRenders](v3->_renderer, "cancelAllRenders");
  -[PIVideoStabilizeRequest renderContext](v3->_stabilizeRequest, "renderContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAllRequests");

  -[NUImagePropertiesRequest renderContext](v3->_imagePropertiesRequest, "renderContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAllRequests");

  objc_sync_exit(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagePropertiesRequest, 0);
  objc_storeStrong((id *)&self->_stabilizeRequest, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

void __46__PXVideoStabilizeOperation_performProcessing__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  __int128 v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t *v20;
  void *v21;
  __int128 v22;
  CMTimeEpoch epoch;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  __int128 v28;
  CMTimeEpoch v29;
  CMTime v30;
  CMTimeRange v31;
  CMTime time;
  CMTimeRange start;
  CMTime end;
  CMTime v35;
  CMTime v36;
  CMTime duration;
  CMTimeRange time2;
  CMTimeRange time1;
  CMTime v40;
  CMTime v41;
  __int128 v42;
  CMTimeEpoch v43;
  _QWORD v44[4];
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  char v49;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "PIVideoStabilizeAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __46__PXVideoStabilizeOperation_performProcessing__block_invoke_2;
  v47[3] = &unk_1E513E608;
  v48 = *(id *)(a1 + 40);
  v49 = *(_BYTE *)(a1 + 96);
  objc_msgSend(v3, "modifyAdjustmentWithKey:modificationBlock:", v4, v47);

  if (!*(_BYTE *)(a1 + 96) || !*(_QWORD *)(a1 + 40))
  {
    v6 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)&time1.start.value = *(_OWORD *)(a1 + 64);
    *(_OWORD *)&time1.start.epoch = v6;
    if ((NUPixelRectIsEmpty() & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "PICropAdjustmentKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v5;
      v44[1] = 3221225472;
      v44[2] = __46__PXVideoStabilizeOperation_performProcessing__block_invoke_3;
      v44[3] = &__block_descriptor_64_e36_v16__0__PICropAdjustmentController_8l;
      v8 = *(_OWORD *)(a1 + 80);
      v45 = *(_OWORD *)(a1 + 64);
      v46 = v8;
      objc_msgSend(v3, "modifyAdjustmentWithKey:modificationBlock:", v7, v44);

    }
  }
  objc_msgSend(*(id *)(a1 + 48), "spec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "wantsAudio");

  if ((v10 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "PIMuteAdjustmentKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "modifyAdjustmentWithKey:modificationBlock:", v11, &__block_literal_global_249394);

  }
  v42 = 0uLL;
  v43 = 0;
  objc_msgSend(*(id *)(a1 + 48), "spec");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "crossfadeDuration");
  }
  else
  {
    v42 = 0uLL;
    v43 = 0;
  }

  memset(&v41, 0, sizeof(v41));
  objc_msgSend(*(id *)(a1 + 48), "spec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "startTime");
  else
    memset(&v41, 0, sizeof(v41));

  if ((BYTE12(v42) & 0x1D) == 1
    && (*(_OWORD *)&time1.start.value = v42,
        time1.start.epoch = v43,
        v16 = MEMORY[0x1E0CA2E68],
        *(_OWORD *)&time2.start.value = *MEMORY[0x1E0CA2E68],
        time2.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16),
        CMTimeCompare(&time1.start, &time2.start) >= 1))
  {
    memset(&time1, 0, sizeof(time1));
    objc_msgSend(*(id *)(a1 + 48), "spec");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      objc_msgSend(v17, "timeRange");
    else
      memset(&time1, 0, sizeof(time1));

    if ((time1.start.flags & 1) == 0
      || (time1.duration.flags & 1) == 0
      || time1.duration.epoch
      || time1.duration.value < 0)
    {
      v21 = *(void **)(a1 + 56);
      if (v21)
        objc_msgSend(v21, "duration");
      else
        memset(&time2, 0, 24);
      v40 = time2.start;
      *(_OWORD *)&start.start.value = *(_OWORD *)v16;
      start.start.epoch = *(_QWORD *)(v16 + 16);
      duration = time2.start;
      CMTimeRangeMake(&time2, &start.start, &duration);
      time1 = time2;
    }
    else
    {
      v40 = time1.duration;
    }
    time2.start = v40;
    CMTimeMultiplyByRatio(&v36, &time2.start, 1, 2);
    *(_OWORD *)&start.start.value = v42;
    start.start.epoch = v43;
    CMTimeMinimum(&time2.start, &start.start, &v36);
    v22 = *(_OWORD *)&time2.start.value;
    v42 = *(_OWORD *)&time2.start.value;
    epoch = time2.start.epoch;
    v43 = time2.start.epoch;
    memset(&time2, 0, sizeof(time2));
    *(_OWORD *)&start.start.value = *(_OWORD *)&time1.start.value;
    start.start.epoch = time1.start.epoch;
    *(_OWORD *)&duration.value = v22;
    duration.epoch = epoch;
    CMTimeAdd(&v35, &start.start, &duration);
    start = time1;
    CMTimeRangeGetEnd(&end, &start);
    CMTimeRangeFromTimeToTime(&time2, &v35, &end);
    time = v41;
    start = time2;
    CMTimeClampToRange(&duration, &time, &start);
    v41 = duration;
    objc_msgSend(*(id *)(a1 + 32), "PIVideoCrossfadeLoopAdjustmentKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v5;
    v25 = 3221225472;
    v26 = __46__PXVideoStabilizeOperation_performProcessing__block_invoke_5;
    v27 = &__block_descriptor_128_e50_v16__0__PIVideoCrossfadeLoopAdjustmentController_8l;
    v28 = v42;
    v29 = v43;
    v30 = v41;
    v31 = time1;
    v20 = &v24;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "PIVideoCrossfadeLoopAdjustmentKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (uint64_t *)&__block_literal_global_17_249395;
  }
  objc_msgSend(v3, "modifyAdjustmentWithKey:modificationBlock:", v19, v20, v24, v25, v26, v27, v28, v29, *(_OWORD *)&v30.value, v30.epoch, *(_OWORD *)&v31.start.value, *(_OWORD *)&v31.start.epoch, *(_OWORD *)&v31.duration.timescale);

}

void __46__PXVideoStabilizeOperation_performProcessing__block_invoke_20(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __46__PXVideoStabilizeOperation_performProcessing__block_invoke_2_24(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v9;
  v24 = v9;

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v10;
  v17 = v10;

  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v11;
  v20 = v11;

  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v12;
  v23 = v12;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__PXVideoStabilizeOperation_performProcessing__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "keyframes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setKeyframes:", v4);

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v5, "stabCropRect");
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  v7[0] = v8;
  v7[1] = v9;
  objc_msgSend(v3, "setStabCropRect:", v7);
  if (*(_BYTE *)(a1 + 40))
    v6 = *(_QWORD *)(a1 + 32) != 0;
  else
    v6 = 0;
  objc_msgSend(v3, "setEnabled:", v6);

}

void __46__PXVideoStabilizeOperation_performProcessing__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 48);
  v2 = a2;
  NUPixelRectToCGRect();
  objc_msgSend(v2, "setCropRect:", v3, v4);

}

void __46__PXVideoStabilizeOperation_performProcessing__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _OWORD v5[3];
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v8 = *(_OWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v3 = a2;
  objc_msgSend(v3, "setCrossfadeDuration:", &v8);
  v6 = *(_OWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v3, "setStartTime:", &v6);
  v4 = *(_OWORD *)(a1 + 96);
  v5[0] = *(_OWORD *)(a1 + 80);
  v5[1] = v4;
  v5[2] = *(_OWORD *)(a1 + 112);
  objc_msgSend(v3, "setLoopTimeRange:", v5);
  objc_msgSend(v3, "setEnabled:", 1);

}

void __46__PXVideoStabilizeOperation_performProcessing__block_invoke_6(uint64_t a1, void *a2)
{
  __int128 *v2;
  id v3;
  __int128 v4;
  _OWORD v5[3];
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v2 = (__int128 *)MEMORY[0x1E0CA2E68];
  v8 = *MEMORY[0x1E0CA2E68];
  v9 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v3 = a2;
  objc_msgSend(v3, "setCrossfadeDuration:", &v8);
  v6 = *v2;
  v7 = *((_QWORD *)v2 + 2);
  objc_msgSend(v3, "setStartTime:", &v6);
  v4 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
  v5[0] = *MEMORY[0x1E0CA2E50];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
  objc_msgSend(v3, "setLoopTimeRange:", v5);
  objc_msgSend(v3, "setEnabled:", 0);

}

uint64_t __46__PXVideoStabilizeOperation_performProcessing__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEnabled:", 1);
}

@end
