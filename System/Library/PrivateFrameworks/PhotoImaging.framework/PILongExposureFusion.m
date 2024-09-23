@implementation PILongExposureFusion

- (id)outputImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  const char *v45;
  NSObject *v46;
  const char *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  CGAffineTransform v59;
  uint8_t buf[16];
  __int128 v61;
  __int128 v62;
  CGAffineTransform v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  -[PILongExposureFusion inputImage](self, "inputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PILongExposureFusion inputMaskImage](self, "inputMaskImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_98);
      v40 = *MEMORY[0x1E0D523A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D523A0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6382000, v40, OS_LOG_TYPE_ERROR, "Missing inputMaskImage", buf, 2u);
      }
      v34 = 0;
      goto LABEL_61;
    }
    -[PILongExposureFusion inputStillImage](self, "inputStillImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_98);
      v41 = *MEMORY[0x1E0D523A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D523A0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6382000, v41, OS_LOG_TYPE_ERROR, "Missing inputStillImage", buf, 2u);
      }
      v34 = 0;
      goto LABEL_60;
    }
    -[PILongExposureFusion inputRenderScale](self, "inputRenderScale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_98);
      v42 = *MEMORY[0x1E0D523A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D523A0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6382000, v42, OS_LOG_TYPE_ERROR, "Missing inputRenderScale", buf, 2u);
      }
      v34 = 0;
      goto LABEL_59;
    }
    objc_msgSend(v6, "doubleValue");
    v9 = v8;
    -[PILongExposureFusion inputVideoScale](self, "inputVideoScale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_98);
      v43 = *MEMORY[0x1E0D523A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D523A0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6382000, v43, OS_LOG_TYPE_ERROR, "Missing inputVideoScale", buf, 2u);
      }
      v34 = 0;
      goto LABEL_58;
    }
    objc_msgSend(v10, "doubleValue");
    v13 = v12;
    -[PILongExposureFusion inputAlignmentExtent](self, "inputAlignmentExtent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      if (objc_msgSend(v14, "count") == 4)
      {
        objc_msgSend(v15, "CGRectValue");
        -[PILongExposureFusion inputAlignmentTransform](self, "inputAlignmentTransform");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          if (objc_msgSend(v16, "count") == 9)
          {
            v54 = v15;
            v55 = v11;
            v56 = v7;
            v18 = 0;
            v19 = 0;
            v20 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
            *(_OWORD *)buf = *MEMORY[0x1E0C83FE8];
            v61 = v20;
            v62 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 32);
            do
            {
              v21 = 0;
              v22 = v18;
              do
              {
                objc_msgSend(v17, "valueAtIndex:", v22);
                *(float *)&v23 = v23;
                *(_DWORD *)&buf[4 * v19 + v21] = LODWORD(v23);
                v21 += 16;
                ++v22;
              }
              while (v21 != 48);
              ++v19;
              v18 += 3;
            }
            while (v19 != 3);
            NUScaleRect();
            v25 = v24;
            *(float *)&v24 = v9;
            -[PILongExposureFusion alignImage:transform:extent:](self, "alignImage:transform:extent:", v5, *(double *)buf, *(double *)&v61, COERCE_DOUBLE(vmul_n_f32(*(float32x2_t *)&v62, *(float *)&v24)), v25, v26, v27, v28);
            v29 = objc_claimAutoreleasedReturnValue();
            memset(&v59, 0, sizeof(v59));
            CGAffineTransformMakeScale(&v59, v9 / v13, v9 / v13);
            objc_msgSend(v3, "imageByClampingToExtent");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = v59;
            objc_msgSend(v30, "imageByApplyingTransform:highQualityDownsample:", &v63, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            -[PILongExposureFusion _computeNCCMapFromImage:toImage:scale:](self, "_computeNCCMapFromImage:toImage:scale:", v31, v29, v9);
            v32 = objc_claimAutoreleasedReturnValue();
            -[PILongExposureFusion _refineMaskImage:guideImage:scale:](self, "_refineMaskImage:guideImage:scale:", v4, v3, v9);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = v59;
            objc_msgSend(v33, "imageByApplyingTransform:highQualityDownsample:", &v63, 1);
            v57 = (void *)v29;
            v58 = (void *)v32;
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            -[PILongExposureFusion _fuseImage:withGuideImage:weightImage:maskImage:](self, "_fuseImage:withGuideImage:weightImage:maskImage:", v31, v29, v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v55;
            v7 = v56;
            v15 = v54;
            if (+[PILongExposureFusion debugDumpIntermediateImages](PILongExposureFusion, "debugDumpIntermediateImages"))
            {
              v50 = v33;
              v51 = v31;
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              NURenderLogger_16584();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v52, "currentDirectoryPath");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v63.a) = 138412290;
                *(_QWORD *)((char *)&v63.a + 4) = v49;
                _os_log_debug_impl(&dword_1A6382000, v35, OS_LOG_TYPE_DEBUG, "Writing intermediate long exposure fusion images to : %@", (uint8_t *)&v63, 0xCu);

              }
              objc_msgSend(v3, "writeToTIFF:", CFSTR("long-exp-input-image.tiff"));
              objc_msgSend(v4, "writeToTIFF:", CFSTR("long-exp-mask-image.tiff"));
              objc_msgSend(v5, "writeToTIFF:", CFSTR("long-exp-still-image.tiff"));
              objc_msgSend(v34, "extent");
              objc_msgSend(v57, "imageByCroppingToRect:");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "writeToTIFF:", CFSTR("long-exp-guide-image.tiff"));

              objc_msgSend(v34, "extent");
              objc_msgSend(v58, "imageByCroppingToRect:");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "writeToTIFF:", CFSTR("long-exp-ncc-map-image.tiff"));

              objc_msgSend(v4, "extent");
              v33 = v50;
              objc_msgSend(v50, "imageByCroppingToRect:");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "writeToTIFF:", CFSTR("long-exp-refined-mask-image.tiff"));

              objc_msgSend(v34, "writeToTIFF:", CFSTR("long-exp-fusion-image.tiff"));
              v31 = v51;
            }

            goto LABEL_56;
          }
          NURenderLogger_16584();
          v46 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
LABEL_55:

            v34 = 0;
LABEL_56:

            goto LABEL_57;
          }
          *(_WORD *)buf = 0;
          v47 = "Malformed inputAlignmentTransform vector";
        }
        else
        {
          NURenderLogger_16584();
          v46 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            goto LABEL_55;
          *(_WORD *)buf = 0;
          v47 = "Missing inputAlignmentTransform";
        }
        _os_log_error_impl(&dword_1A6382000, v46, OS_LOG_TYPE_ERROR, v47, buf, 2u);
        goto LABEL_55;
      }
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_98);
      v44 = *MEMORY[0x1E0D523A0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D523A0], OS_LOG_TYPE_ERROR))
      {
LABEL_51:
        v34 = 0;
LABEL_57:

LABEL_58:
LABEL_59:

LABEL_60:
LABEL_61:

        goto LABEL_62;
      }
      *(_WORD *)buf = 0;
      v45 = "Malformed inputAlignmentExtent vector";
    }
    else
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_98);
      v44 = *MEMORY[0x1E0D523A0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D523A0], OS_LOG_TYPE_ERROR))
        goto LABEL_51;
      *(_WORD *)buf = 0;
      v45 = "Missing inputAlignmentExtent";
    }
    _os_log_error_impl(&dword_1A6382000, v44, OS_LOG_TYPE_ERROR, v45, buf, 2u);
    goto LABEL_51;
  }
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_98);
  v39 = *MEMORY[0x1E0D523A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D523A0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A6382000, v39, OS_LOG_TYPE_ERROR, "Missing inputImage", buf, 2u);
  }
  v34 = 0;
LABEL_62:

  return v34;
}

- (id)alignImage:(__n128)a3 transform:(double)a4 extent:(double)a5
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v23[4];
  __n128 v24;
  __n128 v25;
  __n128 v26;
  _QWORD v27[6];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v27[0] = 0x3FF0000000000000;
  v27[1] = 0;
  v27[2] = 0;
  v27[3] = 0x3FF0000000000000;
  *(double *)&v27[4] = -a4;
  *(double *)&v27[5] = -a5;
  objc_msgSend(a10, "imageByApplyingTransform:highQualityDownsample:", v27, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIAutoLoopKernels homographyKernel](PIAutoLoopKernels, "homographyKernel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __52__PILongExposureFusion_alignImage_transform_extent___block_invoke;
  v23[3] = &__block_descriptor_80_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v24 = a1;
  v25 = a2;
  v26 = a3;
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:", a1.n128_f32[0], a2.n128_f32[0], a3.n128_f32[0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v14;
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:", a1.n128_f32[1], a2.n128_f32[1], a3.n128_f32[1]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v15;
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:", a1.n128_f32[2], a2.n128_f32[2], a3.n128_f32[2]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "applyWithExtent:roiCallback:inputImage:arguments:", v23, v12, v17, 0.0, 0.0, a6, a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_computeNCCMapFromImage:(id)a3 toImage:(id)a4 scale:(double)a5
{
  CGFloat v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  void *v39;
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v6 = fmin(1.0 / (a5 * 8.0), 1.0);
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "extent");
  NUScaleRect();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  memset(&v38, 0, sizeof(v38));
  CGAffineTransformMakeScale(&v38, v6, v6);
  objc_msgSend(v8, "imageByClampingToExtent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v38;
  objc_msgSend(v17, "imageByApplyingTransform:highQualityDownsample:", &v37, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "imageByClampingToExtent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v38;
  objc_msgSend(v19, "imageByApplyingTransform:highQualityDownsample:", &v37, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[PIAutoLoopKernels nccKernel](PIAutoLoopKernels, "nccKernel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v18;
  v41[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_39, v22, v10, v12, v14, v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", *(float *)&kNCCEdge0, *(float *)&kNCCEdge1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIAutoLoopKernels nccCoarseKernel](PIAutoLoopKernels, "nccCoarseKernel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v23;
  v40[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "applyWithExtent:arguments:", v26, v10, v12, v14, v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  switch(kNCCBlurHalfSize)
  {
    case 1:
      +[PIAutoLoopKernels blur3x3Kernel](PIAutoLoopKernels, "blur3x3Kernel");
      v28 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      +[PIAutoLoopKernels blur5x5Kernel](PIAutoLoopKernels, "blur5x5Kernel");
      v28 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      +[PIAutoLoopKernels blur7x7Kernel](PIAutoLoopKernels, "blur7x7Kernel");
      v28 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v29 = 0;
      goto LABEL_9;
  }
  v29 = (void *)v28;
LABEL_9:
  objc_msgSend(v27, "imageByClampingToExtent");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_40_16574, v31, v10, v12, v14, v16);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v38;
  memset(&v37, 0, sizeof(v37));
  CGAffineTransformInvert(&v37, &v36);
  objc_msgSend(v32, "imageByClampingToExtent");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v37;
  objc_msgSend(v33, "imageByApplyingTransform:highQualityDownsample:", &v36, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (id)_refineMaskImage:(id)a3 guideImage:(id)a4 scale:(double)a5
{
  CGFloat v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  float v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  _QWORD v34[5];

  v34[4] = *MEMORY[0x1E0C80C00];
  v6 = fmin(1.0 / (a5 * 8.0), 1.0);
  v7 = (void *)MEMORY[0x1E0C9DDF8];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "vectorWithX:Y:", v6 * 15.0, v6 * 15.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:", (float)(-0.5 / (float)((float)(v11 * 7.0) * (float)(v11 * 7.0))), -0.00499999989, -49.9999962);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extent");
  NUScaleRect();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  memset(&v33, 0, sizeof(v33));
  CGAffineTransformMakeScale(&v33, v6, v6);
  objc_msgSend(v9, "imageByClampingToExtent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v33;
  objc_msgSend(v21, "imageByApplyingTransform:highQualityDownsample:", &v32, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "imageByClampingToExtent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v33;
  objc_msgSend(v23, "imageByApplyingTransform:highQualityDownsample:", &v32, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  +[PIAutoLoopKernels dynamismMapRefineKernel](PIAutoLoopKernels, "dynamismMapRefineKernel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v22;
  v34[1] = v24;
  v34[2] = v10;
  v34[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_41_16573, v26, v14, v16, v18, v20);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v33;
  memset(&v32, 0, sizeof(v32));
  CGAffineTransformInvert(&v32, &v31);
  objc_msgSend(v27, "imageByClampingToExtent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v32;
  objc_msgSend(v28, "imageByApplyingTransform:highQualityDownsample:", &v31, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)_fuseImage:(id)a3 withGuideImage:(id)a4 weightImage:(id)a5 maskImage:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  _QWORD v38[6];
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[PIAutoLoopKernels blur7x7Kernel](PIAutoLoopKernels, "blur7x7Kernel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "extent");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v11, "imageByClampingToExtent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_42_16570, v23, v15, v17, v19, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", *(float *)&kBlendMaskThreshold0, *(float *)&kBlendMaskThreshold1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIAutoLoopKernels fusionKernel](PIAutoLoopKernels, "fusionKernel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "extent");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v38[0] = v12;
  v38[1] = v11;
  v38[2] = v24;
  v38[3] = v10;
  v38[4] = v9;
  v38[5] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_43_16572, v35, v28, v30, v32, v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (CIImage)inputStillImage
{
  return self->_inputStillImage;
}

- (void)setInputStillImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputStillImage, a3);
}

- (CIImage)inputMaskImage
{
  return self->_inputMaskImage;
}

- (void)setInputMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputMaskImage, a3);
}

- (NSNumber)inputRenderScale
{
  return self->_inputRenderScale;
}

- (void)setInputRenderScale:(id)a3
{
  objc_storeStrong((id *)&self->_inputRenderScale, a3);
}

- (NSNumber)inputVideoScale
{
  return self->_inputVideoScale;
}

- (void)setInputVideoScale:(id)a3
{
  objc_storeStrong((id *)&self->_inputVideoScale, a3);
}

- (CIVector)inputAlignmentExtent
{
  return self->_inputAlignmentExtent;
}

- (void)setInputAlignmentExtent:(id)a3
{
  objc_storeStrong((id *)&self->_inputAlignmentExtent, a3);
}

- (CIVector)inputAlignmentTransform
{
  return self->_inputAlignmentTransform;
}

- (void)setInputAlignmentTransform:(id)a3
{
  objc_storeStrong((id *)&self->_inputAlignmentTransform, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputAlignmentTransform, 0);
  objc_storeStrong((id *)&self->_inputAlignmentExtent, 0);
  objc_storeStrong((id *)&self->_inputVideoScale, 0);
  objc_storeStrong((id *)&self->_inputRenderScale, 0);
  objc_storeStrong((id *)&self->_inputMaskImage, 0);
  objc_storeStrong((id *)&self->_inputStillImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

double __72__PILongExposureFusion__fuseImage_withGuideImage_weightImage_maskImage___block_invoke(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -3.0, -3.0);
  return result;
}

double __62__PILongExposureFusion__computeNCCMapFromImage_toImage_scale___block_invoke_2(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, (double)-kNCCBlurHalfSize, (double)-kNCCBlurHalfSize);
  return result;
}

double __62__PILongExposureFusion__computeNCCMapFromImage_toImage_scale___block_invoke(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -3.0, -3.0);
  return result;
}

void __52__PILongExposureFusion_alignImage_transform_extent___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGRect v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  CGRectGetMinX(*(CGRect *)&a1);
  v8.origin.x = a1;
  v8.origin.y = a2;
  v8.size.width = a3;
  v8.size.height = a4;
  CGRectGetMaxY(v8);
  v9.origin.x = a1;
  v9.origin.y = a2;
  v9.size.width = a3;
  v9.size.height = a4;
  CGRectGetMaxX(v9);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMaxY(v10);
  v11.origin.x = a1;
  v11.origin.y = a2;
  v11.size.width = a3;
  v11.size.height = a4;
  CGRectGetMinX(v11);
  v12.origin.x = a1;
  v12.origin.y = a2;
  v12.size.width = a3;
  v12.size.height = a4;
  CGRectGetMinY(v12);
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  CGRectGetMaxX(v13);
  v14.origin.x = a1;
  v14.origin.y = a2;
  v14.size.width = a3;
  v14.size.height = a4;
  CGRectGetMinY(v14);
}

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PILongExposureFusion_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken_16632 != -1)
    dispatch_once(&initialize_onceToken_16632, block);
}

+ (void)loadFusionTuningParameters
{
  void *v2;
  void *v3;
  _QWORD *v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  _BYTE v26[14];
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D52108], "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringSettingForKey:defaultValue:", CFSTR("PI_LONG_EXPOSURE_FUSION_PARAMS"), &__block_literal_global_16615);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (_QWORD *)MEMORY[0x1E0D52390];
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_98);
    v5 = (os_log_t *)MEMORY[0x1E0D523A0];
    v6 = *MEMORY[0x1E0D523A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D523A0], OS_LOG_TYPE_INFO))
    {
      v25 = 138412290;
      *(_QWORD *)v26 = v3;
      _os_log_impl(&dword_1A6382000, v6, OS_LOG_TYPE_INFO, "Loading long-exposure fusion tuning parameters from file: %@", (uint8_t *)&v25, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kNCCBlurHalfSize"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kNCCBlurHalfSize"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        kNCCBlurHalfSize = objc_msgSend(v10, "intValue");

      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kNCCEdge0"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kNCCEdge0"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "floatValue");
        kNCCEdge0 = v13;

      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kNCCEdge1"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kNCCEdge1"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "floatValue");
        kNCCEdge1 = v16;

      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kBlendMaskThreshold0"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kBlendMaskThreshold0"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "floatValue");
        kBlendMaskThreshold0 = v19;

      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kBlendMaskThreshold1"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kBlendMaskThreshold1"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "floatValue");
        kBlendMaskThreshold1 = v22;

      }
    }
    else
    {
      if (*v4 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_98);
      v23 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v25) = 0;
        _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Failed to load fusion tuning parameters.", (uint8_t *)&v25, 2u);
      }
    }
    if (*v4 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_98);
    v24 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      v25 = 67110144;
      *(_DWORD *)v26 = kNCCBlurHalfSize;
      *(_WORD *)&v26[4] = 2048;
      *(double *)&v26[6] = *(float *)&kNCCEdge0;
      v27 = 2048;
      v28 = *(float *)&kNCCEdge1;
      v29 = 2048;
      v30 = *(float *)&kBlendMaskThreshold0;
      v31 = 2048;
      v32 = *(float *)&kBlendMaskThreshold1;
      _os_log_impl(&dword_1A6382000, v24, OS_LOG_TYPE_INFO, "Using fusion tuning parameters: {kNCCBlurHalfSize=%d, kNCCEdge0=%f, kNCCEdge1=%f, kBlendMaskThreshold0=%f, kBlendMaskThreshold1=%f}", (uint8_t *)&v25, 0x30u);
    }

  }
}

+ (BOOL)debugDumpIntermediateImages
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PILongExposureFusion_debugDumpIntermediateImages__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (debugDumpIntermediateImages_onceToken != -1)
    dispatch_once(&debugDumpIntermediateImages_onceToken, block);
  return debugDumpIntermediateImages_s_debugDumpIntermediateImages;
}

+ (BOOL)_debugDumpIntermediateImages
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D52108], "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("PI_LONG_EXPOSURE_DUMP_INTERMEDIATES"), &__block_literal_global_17_16612);

  return v3;
}

uint64_t __52__PILongExposureFusion__debugDumpIntermediateImages__block_invoke()
{
  return 0;
}

uint64_t __51__PILongExposureFusion_debugDumpIntermediateImages__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_debugDumpIntermediateImages");
  debugDumpIntermediateImages_s_debugDumpIntermediateImages = result;
  return result;
}

uint64_t __50__PILongExposureFusion_loadFusionTuningParameters__block_invoke()
{
  return 0;
}

uint64_t __34__PILongExposureFusion_initialize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadFusionTuningParameters");
}

@end
