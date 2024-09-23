@implementation PIPortraitVideoDebugDetectionsRenderNode

- (PIPortraitVideoDebugDetectionsRenderNode)initWithInput:(id)a3 assetURL:(id)a4 cinematographyState:(id)a5 monochrome:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  PIPortraitVideoDebugDetectionsRenderNode *v18;
  objc_super v20;
  uint64_t v21;
  id v22;
  _QWORD v23[3];
  _QWORD v24[4];

  v6 = a6;
  v24[3] = *MEMORY[0x1E0C80C00];
  v10 = (id)MEMORY[0x1E0C9AA70];
  if (a5)
    v10 = a5;
  v24[0] = v10;
  v23[0] = CFSTR("cinematographyState");
  v23[1] = CFSTR("monochrome");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v11, "numberWithBool:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = CFSTR("assetURL");
  v24[1] = v15;
  v24[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = *MEMORY[0x1E0C9E1F8];
  v22 = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)PIPortraitVideoDebugDetectionsRenderNode;
  v18 = -[NURenderNode initWithSettings:inputs:](&v20, sel_initWithSettings_inputs_, v16, v17);

  return v18;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  id v3;
  double v4;
  unsigned int v5;
  unint64_t v6;

  v3 = a3;
  objc_msgSend(v3, "scale");
  NUScaleToDouble();
  if (v4 >= 0.15)
  {
    v6 = objc_msgSend(v3, "evaluationMode");
    if (v6 <= 3)
      v5 = (0xBu >> (v6 & 0xF)) & 1;
    else
      LOBYTE(v5) = 0;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v36;
  void *v37;
  const void **v38;
  void *specific;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  _QWORD v53[4];
  NSObject *v54;
  _BYTE *v55;
  objc_super v56;
  _BYTE buf[24];
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!a6)
  {
    NUAssertLogger_12827();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v37;
      _os_log_error_impl(&dword_1A6382000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v38 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_12827();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v41)
      {
        v44 = dispatch_get_specific(*v38);
        v45 = (void *)MEMORY[0x1E0CB3978];
        v46 = v44;
        objc_msgSend(v45, "callStackSymbols");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v48;
        _os_log_error_impl(&dword_1A6382000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v41)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v43;
      _os_log_error_impl(&dword_1A6382000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    __break(1u);
  }
  v13 = v12;
  v56.receiver = self;
  v56.super_class = (Class)PIPortraitVideoDebugDetectionsRenderNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v56, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, v10, v11, v12, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "evaluationMode") & 0xFFFFFFFFFFFFFFFDLL) != 1)
    goto LABEL_14;
  -[PIPortraitVideoDebugDetectionsRenderNode cinematographyScript](self, "cinematographyScript");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (!v16)
  {
LABEL_4:
    -[PIPortraitVideoDebugDetectionsRenderNode labelImageCache](self, "labelImageCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 == 0;

    if (v18)
    {
      v19 = objc_alloc_init(MEMORY[0x1E0C99D38]);
      -[PIPortraitVideoDebugDetectionsRenderNode setLabelImageCache:](self, "setLabelImageCache:", v19);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-labelImageCache"), objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PIPortraitVideoDebugDetectionsRenderNode labelImageCache](self, "labelImageCache");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setName:", v20);

    }
    if (v13)
    {
      objc_msgSend(v13, "time");
    }
    else
    {
      v51 = 0uLL;
      v52 = 0;
    }
    v49 = v51;
    v50 = v52;
    objc_msgSend(v14, "setRenderTime:", &v49);
    -[PIPortraitVideoDebugDetectionsRenderNode cinematographyScript](self, "cinematographyScript");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCinematographyScript:", v33);

    -[PIPortraitVideoDebugDetectionsRenderNode labelImageCache](self, "labelImageCache");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLabelImageCache:", v34);

LABEL_14:
    v32 = v14;
    goto LABEL_15;
  }
  v22 = (void *)MEMORY[0x1E0C8B3C0];
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("assetURL"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "assetWithURL:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = dispatch_group_create();
  dispatch_group_enter(v25);
  v26 = objc_alloc_init(MEMORY[0x1E0D7F548]);
  -[PIPortraitVideoDebugDetectionsRenderNode setCinematographyScript:](self, "setCinematographyScript:", v26);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v58 = __Block_byref_object_copy__12895;
  v59 = __Block_byref_object_dispose__12896;
  v60 = 0;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("cinematographyState"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v27, "count"))
  {

    v27 = 0;
  }
  -[PIPortraitVideoDebugDetectionsRenderNode cinematographyScript](self, "cinematographyScript");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __102__PIPortraitVideoDebugDetectionsRenderNode_resolvedNodeWithCachedInputs_settings_pipelineState_error___block_invoke;
  v53[3] = &unk_1E5018078;
  v55 = buf;
  v29 = v25;
  v54 = v29;
  v30 = (id)objc_msgSend(v28, "loadWithAsset:changesDictionary:completion:", v24, v27, v53);

  dispatch_group_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
  v31 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (!v31)
  {

    _Block_object_dispose(buf, 8);
    goto LABEL_4;
  }
  *a6 = objc_retainAutorelease(v31);

  _Block_object_dispose(buf, 8);
  v32 = 0;
LABEL_15:

  return v32;
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (id)_imageByAddingDetection:(id)a3 toImage:(id)a4 isPrimary:(BOOL)a5 canvasSize:(CGSize)a6 inverseOrientation:(int64_t)a7
{
  double height;
  double width;
  _BOOL4 v10;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v70;
  void *v71;
  CGAffineTransform v72;
  _OWORD v73[3];
  CGAffineTransform v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  void *v78;
  uint64_t v79;

  height = a6.height;
  width = a6.width;
  v10 = a5;
  v79 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = v13;
  v16 = v15;
  if (v10)
  {
    v17 = (void *)MEMORY[0x1E0C9DD80];
    v18 = 0.0;
    v19 = 1.0;
    v20 = 0.0;
  }
  else if (objc_msgSend(v15, "detectionType") == 100)
  {
    v17 = (void *)MEMORY[0x1E0C9DD80];
    v18 = 0.5;
    v19 = 0.5;
    v20 = 0.5;
  }
  else
  {
    objc_msgSend(v16, "groupIdentifier");
    v21 = PTGroupIDIsValid();
    v17 = (void *)MEMORY[0x1E0C9DD80];
    if ((v21 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 1.0, 0.584313725, 0.0);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v75 = v71;
      objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 1.0, 0.8, 0.0);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&v75 + 1) = v70;
      objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 1.0, 0.176470588, 0.333333333);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v76 = v22;
      objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 0.68627451, 0.321568627, 0.870588235);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&v76 + 1) = v23;
      objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 0.352941176, 0.784313725, 0.980392157);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v77 = v24;
      objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 0.345098039, 0.337254902, 0.839215686);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&v77 + 1) = v25;
      objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 0.635294118, 0.517647059, 0.368627451);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 7);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "objectAtIndexedSubscript:", objc_msgSend(v16, "groupIdentifier") % (unint64_t)objc_msgSend(v27, "count"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    v18 = 1.0;
    v19 = 0.0;
    v20 = 1.0;
  }
  objc_msgSend(v17, "colorWithRed:green:blue:", v18, v19, v20);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  objc_msgSend(v16, "rect");
  v32 = width * v31;
  v33 = height * (1.0 - v29 - v30);
  v35 = width * v34;
  v36 = height * v30;
  +[PICoreImageUtilities framedRectImageWithCGRect:color:borderWidth:](PICoreImageUtilities, "framedRectImageWithCGRect:color:borderWidth:", v28, v32, v33, v35, v36, 4.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "imageByCompositingOverImage:", v14);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[PIPortraitVideoDebugDetectionsRenderNode labelImageCache](self, "labelImageCache");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v40, "trackIdentifier"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v75 = v41;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v40, "groupIdentifier"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v75 + 1) = v42;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v40, "detectionType"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v76 = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "objectForKey:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v45)
  {
    v46 = objc_msgSend(v40, "detectionType");
    v47 = CFSTR("Face");
    switch(v46)
    {
      case 1:
        break;
      case 2:
        v47 = CFSTR("Head");
        break;
      case 3:
        v47 = CFSTR("Torso");
        break;
      case 4:
        v47 = CFSTR("Cat Body");
        break;
      case 5:
        v47 = CFSTR("Dog Body");
        break;
      case 6:
      case 7:
      case 8:
        goto LABEL_14;
      case 9:
        v47 = CFSTR("Cat Head");
        break;
      case 10:
        v47 = CFSTR("Dog Head");
        break;
      case 11:
        v47 = CFSTR("Sports Ball");
        break;
      default:
        if (v46 == 100)
          v47 = CFSTR("AutoFocus");
        else
LABEL_14:
          v47 = CFSTR("Unknown");
        break;
    }
    objc_msgSend(v40, "trackIdentifier");
    if (PTTrackIDIsValid() && objc_msgSend(v40, "detectionType") != 100)
    {
      v48 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v40, "trackIdentifier"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "stringWithFormat:", CFSTR("%@ %@"), v47, v49);
      v47 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v40, "groupIdentifier");
    if (PTGroupIDIsValid())
    {
      v50 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v40, "groupIdentifier"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "stringWithFormat:", CFSTR("%@ G:%@"), v47, v51);
      v52 = objc_claimAutoreleasedReturnValue();

      v47 = (__CFString *)v52;
    }
    objc_msgSend(MEMORY[0x1E0C9DDB8], "textImageGeneratorFilter");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setText:", v47);
    objc_msgSend(v53, "setFontName:", CFSTR("Helvetica"));
    LODWORD(v54) = 1109393408;
    objc_msgSend(v53, "setFontSize:", v54);
    objc_msgSend(v53, "outputImage");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setObject:forKey:", v45, v44);

  }
  objc_msgSend(MEMORY[0x1E0C9DDB8], "roundedRectangleGeneratorFilter");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "extent");
  v57 = v56 + 4.0;
  objc_msgSend(v45, "extent");
  objc_msgSend(v55, "setExtent:", 0.0, 0.0, v57, v58 + 4.0);
  objc_msgSend(v55, "setColor:", v28);
  LODWORD(v59) = 0;
  objc_msgSend(v55, "setRadius:", v59);
  CGAffineTransformMakeTranslation(&v74, 2.0, 2.0);
  objc_msgSend(v45, "imageByApplyingTransform:", &v74);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v55, "outputImage");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "imageByCompositingOverImage:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = 0u;
  v77 = 0u;
  v75 = 0u;
  objc_msgSend(v62, "extent");
  NUPixelSizeFromCGSize();
  NUOrientationMakeTransformWithSize();
  v73[0] = v75;
  v73[1] = v76;
  v73[2] = v77;
  objc_msgSend(v62, "imageByApplyingTransform:", v73);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a7)
  {
    case 3:
      objc_msgSend(v63, "extent");
      v32 = v32 + v35 - v65;
      goto LABEL_32;
    case 6:
LABEL_32:
      objc_msgSend(v63, "extent");
      v33 = v33 + v36 - v66;
      break;
    case 8:
      objc_msgSend(v63, "extent");
      v32 = v32 + v35 - v64;
      break;
  }
  CGAffineTransformMakeTranslation(&v72, v32, v33);
  objc_msgSend(v63, "imageByApplyingTransform:", &v72);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v67, "imageByCompositingOverImage:", v38);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  return v68;
}

- (id)_evaluateImage:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v48;
  void *v49;
  const void **v50;
  void *specific;
  NSObject *v52;
  _BOOL4 v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[24];
  id v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _QWORD v82[3];
  _QWORD v83[3];
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  void *v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_12827();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v85 = v49;
      _os_log_error_impl(&dword_1A6382000, v48, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v50 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_12827();
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v53)
      {
        v56 = dispatch_get_specific(*v50);
        v57 = (void *)MEMORY[0x1E0CB3978];
        v58 = v56;
        objc_msgSend(v57, "callStackSymbols");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "componentsJoinedByString:", CFSTR("\n"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v85 = v56;
        v86 = 2114;
        v87 = v60;
        _os_log_error_impl(&dword_1A6382000, v52, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v53)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v85 = v55;
      _os_log_error_impl(&dword_1A6382000, v52, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0;
  objc_msgSend(v5, "outputImage:", &v78);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v78;
  if (v6)
  {
    -[NURenderNode settings](self, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("monochrome"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.2125, 0.7154, 0.0721, 0.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v82[0] = CFSTR("inputRVector");
      v82[1] = CFSTR("inputGVector");
      v83[0] = v11;
      v83[1] = v11;
      v82[2] = CFSTR("inputBVector");
      v83[2] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v13;
    }
    -[PIPortraitVideoDebugDetectionsRenderNode cinematographyScript](self, "cinematographyScript");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[NURenderNode outputImageGeometry:](self, "outputImageGeometry:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v63 = v7;
        v64 = v5;
        v62 = v15;
        objc_msgSend(v15, "orientation");
        v16 = NUOrientationInverse();
        objc_msgSend(v6, "extent");
        v18 = v17;
        v20 = v19;
        -[PIPortraitVideoDebugDetectionsRenderNode cinematographyScript](self, "cinematographyScript");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PIPortraitVideoDebugDetectionsRenderNode renderTime](self, "renderTime");
        objc_msgSend(v21, "frameNearestTime:", v77);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "focusDetection");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v22;
        objc_msgSend(v22, "allDetections");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v74;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v74 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
              if (objc_msgSend(v29, "detectionType") == 100)
              {
                -[PIPortraitVideoDebugDetectionsRenderNode _imageByAddingDetection:toImage:isPrimary:canvasSize:inverseOrientation:](self, "_imageByAddingDetection:toImage:isPrimary:canvasSize:inverseOrientation:", v29, v6, objc_msgSend(v29, "trackIdentifier") == objc_msgSend(v23, "trackIdentifier"), v16, v18, v20);
                v30 = objc_claimAutoreleasedReturnValue();

                v6 = (void *)v30;
              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
          }
          while (v26);
        }
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v31 = v24;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v70;
          do
          {
            for (j = 0; j != v33; ++j)
            {
              if (*(_QWORD *)v70 != v34)
                objc_enumerationMutation(v31);
              v36 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
              if (objc_msgSend(v36, "detectionType") != 100)
              {
                v37 = objc_msgSend(v36, "trackIdentifier");
                if (v37 != objc_msgSend(v23, "trackIdentifier"))
                {
                  -[PIPortraitVideoDebugDetectionsRenderNode _imageByAddingDetection:toImage:isPrimary:canvasSize:inverseOrientation:](self, "_imageByAddingDetection:toImage:isPrimary:canvasSize:inverseOrientation:", v36, v6, 0, v16, v18, v20);
                  v38 = objc_claimAutoreleasedReturnValue();

                  v6 = (void *)v38;
                }
              }
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
          }
          while (v33);
        }

        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v39 = v31;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v66;
          do
          {
            for (k = 0; k != v41; ++k)
            {
              if (*(_QWORD *)v66 != v42)
                objc_enumerationMutation(v39);
              v44 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * k);
              if (objc_msgSend(v44, "detectionType") != 100)
              {
                v45 = objc_msgSend(v44, "trackIdentifier");
                if (v45 == objc_msgSend(v23, "trackIdentifier"))
                {
                  -[PIPortraitVideoDebugDetectionsRenderNode _imageByAddingDetection:toImage:isPrimary:canvasSize:inverseOrientation:](self, "_imageByAddingDetection:toImage:isPrimary:canvasSize:inverseOrientation:", v44, v6, 1, v16, v18, v20);
                  v46 = objc_claimAutoreleasedReturnValue();

                  v6 = (void *)v46;
                }
              }
            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
          }
          while (v41);
        }

        v7 = v63;
        v5 = v64;
      }
      else
      {

        v6 = 0;
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Could not get the input image"), self, v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (PTCinematographyScript)cinematographyScript
{
  return self->_cinematographyScript;
}

- (void)setCinematographyScript:(id)a3
{
  objc_storeStrong((id *)&self->_cinematographyScript, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)renderTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 184);
  return self;
}

- (void)setRenderTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_renderTime.value = *(_OWORD *)&a3->var0;
  self->_renderTime.epoch = var3;
}

- (NSCache)labelImageCache
{
  return self->_labelImageCache;
}

- (void)setLabelImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_labelImageCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelImageCache, 0);
  objc_storeStrong((id *)&self->_cinematographyScript, 0);
}

void __102__PIPortraitVideoDebugDetectionsRenderNode_resolvedNodeWithCachedInputs_settings_pipelineState_error___block_invoke(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

@end
