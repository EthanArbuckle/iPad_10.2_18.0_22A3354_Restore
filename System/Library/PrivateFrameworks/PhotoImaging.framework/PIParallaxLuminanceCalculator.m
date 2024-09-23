@implementation PIParallaxLuminanceCalculator

- (id)calculateLuminanceValuesForImage:(id)a3 renderer:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  id v27;
  void *v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  _QWORD v35[4];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  id obj;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  uint64_t *v47;
  uint64_t *v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  id *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  __int128 v63;
  __int128 v64;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D52220], "BGRA8");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D52068], "sRGBColorSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v63 = 0u;
  objc_msgSend(v6, "extent");
  NUPixelRectFromCGRect();
  objc_msgSend(MEMORY[0x1E0D520B0], "sharedFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "surfaceStoragePool");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)v8;
  v12 = (void *)objc_msgSend(v11, "newStorageWithSize:format:", 0, 0, v8);
  v57 = 0;
  v58 = (id *)&v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__11067;
  v61 = __Block_byref_object_dispose__11068;
  v62 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__11067;
  v55 = __Block_byref_object_dispose__11068;
  v56 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __81__PIParallaxLuminanceCalculator_calculateLuminanceValuesForImage_renderer_error___block_invoke;
  v43[3] = &unk_1E5017C50;
  v14 = v9;
  v44 = v14;
  v47 = &v51;
  v15 = v7;
  v45 = v15;
  v16 = v6;
  v49 = v63;
  v50 = v64;
  v46 = v16;
  v48 = &v57;
  objc_msgSend(v12, "useAsCIRenderDestinationWithRenderer:block:", v15, v43);
  v17 = (void *)v52[5];
  v18 = v58;
  if (!v17)
  {
    v27 = objc_retainAutorelease(v58[5]);
    v19 = 0;
LABEL_7:
    *a5 = v27;
    goto LABEL_10;
  }
  obj = 0;
  objc_msgSend(v17, "nu_waitUntilCompletedAndReturnError:", &obj);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v18 + 5, obj);

  if (!v19)
  {
    v27 = objc_retainAutorelease(v58[5]);
    goto LABEL_7;
  }
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__11067;
  v40 = __Block_byref_object_dispose__11068;
  v41 = 0;
  v20 = objc_alloc_init(MEMORY[0x1E0D52110]);
  memset(v35, 0, sizeof(v35));
  objc_msgSend(MEMORY[0x1E0D52240], "regionWithRect:", v35);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v13;
  v31[1] = 3221225472;
  v31[2] = __81__PIParallaxLuminanceCalculator_calculateLuminanceValuesForImage_renderer_error___block_invoke_2;
  v31[3] = &unk_1E5017C78;
  v33 = &v36;
  v22 = v20;
  v32 = v22;
  v34 = &v57;
  objc_msgSend(v12, "readBufferInRegion:block:", v21, v31);

  v23 = (void *)v37[5];
  if (v23)
  {
    objc_msgSend(v23, "luminance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "median");
    v26 = v25;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
    *a5 = objc_retainAutorelease(v58[5]);
  }

  _Block_object_dispose(&v36, 8);
LABEL_10:

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  return v19;
}

- (id)_imageToAnalyzeForLayerStack:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v5 = a3;
  objc_msgSend(v5, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clockLayerOrder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D75680]);

  v9 = objc_msgSend(v5, "hasMainLayers");
  if ((v9 & 1) != 0)
    objc_msgSend(v5, "backgroundLayer");
  else
    objc_msgSend(v5, "backgroundBackfillLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[PISegmentationHelper imageFromImageLayer:](PISegmentationHelper, "imageFromImageLayer:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if ((v9 & 1) != 0)
      objc_msgSend(v5, "foregroundLayer");
    else
      objc_msgSend(v5, "foregroundBackfillLayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      v14 = v8;
    else
      v14 = 0;
    if (v14 == 1)
    {
      +[PISegmentationHelper imageFromImageLayer:](PISegmentationHelper, "imageFromImageLayer:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageByCompositingOverImage:", v11);
      v16 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v16;
    }
    objc_msgSend(v6, "parallaxVisibleFrame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(v6, "parallaxInactiveFrame");
    v77.origin.x = v25;
    v77.origin.y = v26;
    v77.size.width = v27;
    v77.size.height = v28;
    v73.origin.x = v18;
    v73.origin.y = v20;
    v73.size.width = v22;
    v73.size.height = v24;
    CGRectUnion(v73, v77);
    objc_msgSend(v6, "timeFrame");
    if (!v9)
    {
      objc_msgSend(v6, "extendedImageExtent");
      NURectNormalize();
      NURectDenormalize();
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;
      objc_msgSend(v6, "extendedImageSize");
      v38 = v37;
      objc_msgSend(v6, "imageSize");
      v40 = v38 - v39;
      objc_msgSend(v6, "extendedImageSize");
      v42 = v41;
      objc_msgSend(v6, "imageSize");
      v44 = v42 - v43;
      objc_msgSend(v6, "parallaxPadding");
      v46 = -(v44 - v45);
      v74.origin.x = v30;
      v74.origin.y = v32;
      v74.size.width = v34;
      v74.size.height = v36;
      CGRectOffset(v74, -v40, v46);
    }
    NURectNormalize();
    objc_msgSend(v11, "extent");
    NURectDenormalize();
    v48 = v47;
    v50 = v49;
    v52 = v51;
    v54 = v53;
    objc_msgSend(v11, "extent");
    v58 = v57;
    v59 = v55;
    v60 = v48 + v52;
    v61 = v50 + v54;
    v63 = v57 + v62;
    if (v48 + v52 >= v63)
    {
      v64 = v58;
      if (v58 <= v63)
        v64 = v63;
    }
    else
    {
      v64 = v58;
      if (v58 <= v60)
        v64 = v48 + v52;
    }
    v65 = v55 + v56;
    if (v61 >= v59 + v56)
    {
      v66 = v59;
      if (v59 <= v65)
        v66 = v65;
    }
    else
    {
      v66 = v59;
      if (v59 <= v61)
        v66 = v50 + v54;
    }
    v67 = v64 - v60;
    v68 = v66 - v61;
    v69 = v48 + v67;
    v70 = v50 + v68;
    if (v69 >= v63)
    {
      if (v58 <= v63)
        v58 = v63;
    }
    else if (v58 <= v69)
    {
      v58 = v69;
    }
    if (v70 >= v65)
    {
      if (v59 <= v65)
        v59 = v65;
    }
    else if (v59 <= v70)
    {
      v59 = v50 + v68;
    }
    v75.origin.x = v58;
    v75.origin.y = v59;
    v75.size.width = v52;
    v75.size.height = v54;
    if (CGRectIsEmpty(v75))
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("clockArea is empty after mapping to image extent"), v11);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v11, "imageByCroppingToRect:", v58, v59, v52, v54);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v71, "extent");
      if (CGRectIsEmpty(v76))
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("image extent is empty after cropping to text area"), v71);
        v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        v11 = v71;
      }
      else
      {
        v11 = v71;
        v12 = v11;
      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("layer stack has no background layer"), v5);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)calculateClockLuminanceValuesForLayerStack:(id)a3 style:(id)a4 renderer:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  CGFloat v22;
  void *v23;
  void *v24;
  double v25;
  CGAffineTransform v27;
  CGRect v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "layout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "normalizedVisibleFrame");
  if (CGRectGetMaxY(v28) <= 1.0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v10, "layout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "canApplyHeadroom");

  if (!v15)
    goto LABEL_6;
  if (!objc_msgSend(v11, "hasHeadroomLook"))
  {
    if (objc_msgSend(v11, "hasTonalityMode"))
    {
      v16 = objc_msgSend(v11, "tonality") == 3;
      goto LABEL_11;
    }
LABEL_6:
    -[PIParallaxLuminanceCalculator _imageToAnalyzeForLayerStack:error:](self, "_imageToAnalyzeForLayerStack:error:", v10, a6);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", 0x80000);
      objc_msgSend(v18, "extent");
      v20 = NUPixelSizeFromCGSize();
      objc_msgSend(v19, "scaleForImageSize:", v20, v21);
      NUScaleToDouble();
      CGAffineTransformMakeScale(&v27, v22, v22);
      objc_msgSend(v18, "imageByApplyingTransform:", &v27);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[PIParallaxLuminanceCalculator calculateLuminanceValuesForImage:renderer:error:](self, "calculateLuminanceValuesForImage:renderer:error:", v23, v12, a6);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = 0;
    }
    goto LABEL_14;
  }
  v16 = objc_msgSend(v11, "headroomLook") == 2;
LABEL_11:
  v25 = 0.0;
  if (v16)
    v25 = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v24;
}

BOOL __81__PIParallaxLuminanceCalculator_calculateLuminanceValuesForImage_renderer_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _OWORD v13[2];
  id obj;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setColorSpace:", objc_msgSend(v3, "CGColorSpace"));
  objc_msgSend(v4, "setClamped:", 1);
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  obj = 0;
  v8 = *(_OWORD *)(a1 + 88);
  v13[0] = *(_OWORD *)(a1 + 72);
  v13[1] = v8;
  objc_msgSend(v5, "renderImage:rect:toDestination:atPoint:error:", v6, v13, v4, *MEMORY[0x1E0D51E30], *(_QWORD *)(MEMORY[0x1E0D51E30] + 8), &obj);
  v9 = objc_claimAutoreleasedReturnValue();

  objc_storeStrong(v7, obj);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) != 0;
}

void __81__PIParallaxLuminanceCalculator_calculateLuminanceValuesForImage_renderer_error___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v3;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v3 = (void *)a1[4];
  v4 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  obj = 0;
  objc_msgSend(v3, "computeHistogramFromBuffer:error:", a2, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

@end
