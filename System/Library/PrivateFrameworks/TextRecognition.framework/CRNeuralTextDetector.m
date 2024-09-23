@implementation CRNeuralTextDetector

+ (id)detectorForRevision:(unint64_t)a3 imageReaderOptions:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  CRDetectorConfiguration *v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  CRNeuralTextDetectorV3 *v16;
  __int16 v18;
  __int16 v19;

  v7 = a4;
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v7, "objectForKey:", CFSTR("CRImageReaderRevisionKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  if (v10 != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("CRImageReaderRevisionKey"));

  }
  v12 = -[CRDetectorConfiguration initWithImageReaderOptions:error:]([CRDetectorConfiguration alloc], "initWithImageReaderOptions:error:", v8, a5);
  if (!v12)
    goto LABEL_16;
  if (a3 != 3)
  {
    if (a3 == 2)
    {
      CROSLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v18 = 0;
        v14 = "Unexpected attempt to load V2 detector";
        v15 = (uint8_t *)&v18;
        goto LABEL_11;
      }
LABEL_12:

      goto LABEL_13;
    }
    if (a3 == 1)
    {
      CROSLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v19 = 0;
        v14 = "Unexpected attempt to load V1 detector";
        v15 = (uint8_t *)&v19;
LABEL_11:
        _os_log_impl(&dword_1D4FB8000, v13, OS_LOG_TYPE_FAULT, v14, v15, 2u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if (a5)
    {
      +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -4);
      v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_16:
    v16 = 0;
    goto LABEL_17;
  }
LABEL_13:
  v16 = -[CRNeuralTextDetectorV3 initWithConfiguration:error:]([CRNeuralTextDetectorV3 alloc], "initWithConfiguration:error:", v12, a5);
LABEL_17:

  return v16;
}

- (CRNeuralTextDetector)init
{
  CRNeuralTextDetector *v2;
  CRPerformanceStatistics *v3;
  CRPerformanceStatistics *v4;
  CRPerformanceStatistics *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRNeuralTextDetector;
  v2 = -[CRNeuralTextDetector init](&v7, sel_init);
  if (v2)
  {
    v3 = -[CRPerformanceStatistics initWithName:measureRecentPeak:]([CRPerformanceStatistics alloc], "initWithName:measureRecentPeak:", CFSTR("Detection"), 0);
    -[CRNeuralTextDetector setDetectorStats:](v2, "setDetectorStats:", v3);

    v4 = -[CRPerformanceStatistics initWithName:measureRecentPeak:]([CRPerformanceStatistics alloc], "initWithName:measureRecentPeak:", CFSTR("Post Processing"), 0);
    -[CRNeuralTextDetector setPostProcStats:](v2, "setPostProcStats:", v4);

    v5 = -[CRPerformanceStatistics initWithName:measureRecentPeak:]([CRPerformanceStatistics alloc], "initWithName:measureRecentPeak:", CFSTR("Detector Inference"), 0);
    -[CRNeuralTextDetector setInferenceStats:](v2, "setInferenceStats:", v5);

    -[CRNeuralTextDetector setShouldCancel:](v2, "setShouldCancel:", 0);
  }
  return v2;
}

- (void)cancel
{
  -[CRNeuralTextDetector setShouldCancel:](self, "setShouldCancel:", 1);
}

- (BOOL)preheatWithError:(id *)a3
{
  return 1;
}

- (id)enumerateTilesForImage:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _BYTE *, double, double, double, double);
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  float v18;
  uint64_t v19;
  float v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double x;
  double y;
  double width;
  double height;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  BOOL v32;
  char v33;
  void *v34;
  double v36;
  uint64_t v37;
  void *v38;
  double rect;
  char v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _BYTE *, double, double, double, double))a4;
  if (v7)
  {
    -[CRNeuralTextDetector configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tileOverlap");
    v10 = v9;

    -[CRNeuralTextDetector configuration](self, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tileSize");
    rect = v12;
    v14 = v13;

    v15 = objc_msgSend(v6, "width");
    v16 = objc_msgSend(v6, "height");
    v17 = rect - v10;
    v18 = ((double)v15 - v10) / (rect - v10);
    v19 = vcvtps_s32_f32(v18);
    v36 = v14 - v10;
    v20 = ((double)v16 - v10) / (v14 - v10);
    v21 = vcvtps_s32_f32(v20);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v21 * v19);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    if (v21 >= 1)
    {
      v22 = 0;
      v37 = v21;
      do
      {
        if (v19 >= 1)
        {
          v23 = 0;
          while (1)
          {
            x = v17 * (double)(int)v23;
            if (x >= 0.0)
            {
              height = v14;
              width = rect;
              y = v36 * (double)(int)v22;
            }
            else
            {
              v41.origin.x = v17 * (double)(int)v23;
              v41.origin.y = v36 * (double)(int)v22;
              v41.size.width = rect;
              v41.size.height = v14;
              v42 = CGRectOffset(v41, -x, 0.0);
              x = v42.origin.x;
              y = v42.origin.y;
              width = v42.size.width;
              height = v42.size.height;
            }
            if (width + x >= (double)(unint64_t)objc_msgSend(v6, "width"))
            {
              v28 = objc_msgSend(v6, "width");
              v43.origin.x = x;
              v43.origin.y = y;
              v43.size.width = width;
              v43.size.height = height;
              v44 = CGRectOffset(v43, (double)v28 - (width + x), 0.0);
              x = v44.origin.x;
              y = v44.origin.y;
              width = v44.size.width;
              height = v44.size.height;
            }
            if (y < 0.0)
            {
              v45.origin.x = x;
              v45.origin.y = y;
              v45.size.width = width;
              v45.size.height = height;
              v46 = CGRectOffset(v45, 0.0, -y);
              x = v46.origin.x;
              y = v46.origin.y;
              width = v46.size.width;
              height = v46.size.height;
            }
            if (height + y >= (double)(unint64_t)objc_msgSend(v6, "height"))
            {
              v29 = objc_msgSend(v6, "height");
              v47.origin.x = x;
              v47.origin.y = y;
              v47.size.width = width;
              v47.size.height = height;
              v48 = CGRectOffset(v47, 0.0, (double)v29 - (height + y));
              x = v48.origin.x;
              y = v48.origin.y;
              width = v48.size.width;
              height = v48.size.height;
            }
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", x / (double)(unint64_t)objc_msgSend(v6, "width"), y / (double)(unint64_t)objc_msgSend(v6, "height"), width / (double)(unint64_t)objc_msgSend(v6, "width"), height / (double)(unint64_t)objc_msgSend(v6, "height"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "addObject:", v30);

            objc_msgSend(v6, "imageByCroppingRectangle:", x, y, width, height);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v7[2](v7, objc_msgSend(v31, "pixelBuffer"), &v40, x, y, width, height);
            if (v40 || -[CRNeuralTextDetector shouldCancel](self, "shouldCancel"))
              break;

            if (v19 == ++v23)
              goto LABEL_20;
          }

        }
LABEL_20:
        if (v40)
          break;
        v32 = -[CRNeuralTextDetector shouldCancel](self, "shouldCancel");
        v33 = ++v22 == v37 || v32;
      }
      while ((v33 & 1) == 0);
    }
    v34 = v38;
  }
  else
  {
    v34 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v34;
}

+ (CGSize)scaledImageSizeForOptions:(id)a3 imageSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  CRDetectorConfiguration *v15;
  double v16;
  double v17;
  NSObject *v18;
  double v19;
  double v20;
  int v21;
  unint64_t v22;
  uint64_t v23;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = +[CRImageReader defaultRevisionNumber](CRImageReader, "defaultRevisionNumber");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderRevisionKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("CRImageReaderRevisionKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "unsignedIntegerValue");

  }
  v10 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v6, "objectForKey:", CFSTR("CRImageReaderRevisionKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  if (v12 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("CRImageReaderRevisionKey"));

  }
  if (v7 > 2)
  {
    if (v7 == 3)
    {
      v15 = -[CRDetectorConfiguration initWithImageReaderOptions:error:]([CRDetectorConfiguration alloc], "initWithImageReaderOptions:error:", v10, 0);
      +[CRNeuralTextDetectorV3 scaledImageSizeForConfiguration:imageSize:](CRNeuralTextDetectorV3, "scaledImageSizeForConfiguration:imageSize:", v15, width, height);
      width = v16;
      height = v17;

    }
    else
    {
      CROSLogForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        v21 = 134217984;
        v22 = v7;
        _os_log_impl(&dword_1D4FB8000, v18, OS_LOG_TYPE_FAULT, "scaledImageSizeForOptions: not implemented for revision %lu", (uint8_t *)&v21, 0xCu);
      }

    }
  }
  else
  {
    CROSLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1D4FB8000, v14, OS_LOG_TYPE_DEFAULT, "detectorImageSizeForOptions is only supported on V3 onwards", (uint8_t *)&v21, 2u);
    }

  }
  v19 = width;
  v20 = height;
  result.height = v20;
  result.width = v19;
  return result;
}

+ (id)textFeaturesFromPolygons:(void *)a3 withScale:(const float *)a4 withNMSOutputScale:(unint64_t)a5
{
  uint64_t v7;
  uint64_t v8;
  CGPoint *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  CRTextFeature *v13;
  double v14;
  CRTextFeature *v15;
  CRTextFeature *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float64x2_t v22;
  CRNormalizedPolyline *v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  CGPoint *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double *v34;
  CRTextFeature *v35;
  double v36;
  CRTextFeature *v37;
  double v38;
  uint64_t v39;
  double v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  float64x2_t v48;
  CRNormalizedPolyline *v49;
  double v50;
  id v52;
  unint64_t v53;
  id v54;
  uint64_t v55;

  v53 = a5;
  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v52 = (id)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)a3;
  if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
  {
    v11 = 0;
    do
    {
      v12 = v10 + 168 * v11;
      CRDetectorUtils::sortQuadWithRotation(v12, v7, v8, v9);
      v13 = [CRTextFeature alloc];
      v14 = *a4;
      v15 = -[CRTextFeature initWithTopLeft:topRight:bottomLeft:bottomRight:](v13, "initWithTopLeft:topRight:bottomLeft:bottomRight:", *(double *)v12 / v14, *(double *)(v12 + 8) / a4[1], *(double *)(v12 + 16) / v14, *(double *)(v12 + 24) / a4[1], *(double *)(v12 + 48) / v14, *(double *)(v12 + 56) / a4[1], *(double *)(v12 + 32) / v14, *(double *)(v12 + 40) / a4[1]);
      v16 = v15;
      v17 = *(_QWORD *)(*(_QWORD *)a3 + 168 * v11 + 72) - *(_QWORD *)(*(_QWORD *)a3 + 168 * v11 + 64);
      if ((int)(v17 >> 4) < 1)
      {
        -[CRTextFeature setPolygon:](v15, "setPolygon:", 0);
      }
      else
      {
        v18 = (v17 >> 4);
        MEMORY[0x1E0C80A78](v15);
        v20 = 0;
        v21 = *(_QWORD *)(*(_QWORD *)a3 + 168 * v11 + 64);
        v22 = vcvtq_f64_f32(*(float32x2_t *)a4);
        do
        {
          *(float64x2_t *)((char *)&v52 + v20 + -16 * v18) = vdivq_f64(*(float64x2_t *)(v21 + v20), v22);
          v20 += 16;
        }
        while (v19 != v20);
        v23 = -[CRNormalizedPolyline initWithNormalizedPoints:count:size:]([CRNormalizedPolyline alloc], "initWithNormalizedPoints:count:size:", &v52 - 2 * v18, v18, *a4, a4[1]);
        -[CRTextFeature setPolygon:](v16, "setPolygon:", v23);

      }
      -[CRTextFeature bounds](v16, "bounds", v52);
      if (v24 > 0.0)
      {
        -[CRTextFeature bounds](v16, "bounds");
        if (v25 > 0.0)
        {
          v26 = *(double *)(v12 + 104);
          *(float *)&v26 = v26;
          -[CRTextFeature setBaselineAngle:](v16, "setBaselineAngle:", v26);
          -[CRTextFeature setIsCurved:](v16, "setIsCurved:", *(unsigned __int8 *)(v12 + 136));
          -[CRTextFeature setFeatureID:](v16, "setFeatureID:", *(unsigned int *)(v12 + 140));
          -[CRTextFeature setNmsOutputScale:](v16, "setNmsOutputScale:", v53);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v54 = (id)objc_claimAutoreleasedReturnValue();
          v30 = *(_QWORD *)a3;
          if (0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3) <= v11)
LABEL_26:
            std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
          v31 = 0;
          while (1)
          {
            v32 = v30 + 168 * v11;
            v33 = *(_QWORD *)(v32 + 144);
            if (0x8E38E38E38E38E39 * ((*(_QWORD *)(v32 + 152) - v33) >> 4) <= v31)
              break;
            v34 = (double *)(v33 + 144 * v31);
            CRDetectorUtils::sortQuadWithRotation((uint64_t)v34, v27, v28, v29);
            v35 = [CRTextFeature alloc];
            v36 = *a4;
            v37 = -[CRTextFeature initWithTopLeft:topRight:bottomLeft:bottomRight:](v35, "initWithTopLeft:topRight:bottomLeft:bottomRight:", *v34 / v36, v34[1] / a4[1], v34[2] / v36, v34[3] / a4[1], v34[6] / v36, v34[7] / a4[1], v34[4] / v36, v34[5] / a4[1]);
            -[CRTextFeature bounds](v37, "bounds");
            if (v38 > 0.0)
            {
              v39 = -[CRTextFeature bounds](v37, "bounds");
              if (v40 > 0.0)
              {
                v41 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a3 + 168 * v11 + 144) + 144 * v31 + 72)
                    - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a3 + 168 * v11 + 144) + 144 * v31 + 64);
                if ((int)(v41 >> 4) < 1)
                {
                  -[CRTextFeature setPolygon:](v37, "setPolygon:", 0);
                }
                else
                {
                  v42 = (v41 >> 4);
                  MEMORY[0x1E0C80A78](v39);
                  v44 = 0;
                  v47 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a3 + v11 * v45 + 144) + v31 * v46 + 64);
                  v48 = vcvtq_f64_f32(*(float32x2_t *)a4);
                  do
                  {
                    *(float64x2_t *)((char *)&v52 + v44 + -16 * v42) = vdivq_f64(*(float64x2_t *)(v47 + v44), v48);
                    v44 += 16;
                  }
                  while (v43 != v44);
                  v49 = -[CRNormalizedPolyline initWithNormalizedPoints:count:size:]([CRNormalizedPolyline alloc], "initWithNormalizedPoints:count:size:", &v52 - 2 * v42, v42, *a4, a4[1]);
                  -[CRTextFeature setPolygon:](v37, "setPolygon:", v49);

                }
                v50 = *(double *)(v33 + 144 * v31 + 104);
                *(float *)&v50 = v50;
                -[CRTextFeature setBaselineAngle:](v37, "setBaselineAngle:", v50);
                -[CRTextFeature setIsCurved:](v37, "setIsCurved:", *(unsigned __int8 *)(v33 + 144 * v31 + 136));
                -[CRTextFeature setFeatureID:](v37, "setFeatureID:", *(unsigned int *)(v33 + 144 * v31 + 140));
                -[CRTextFeature setNmsOutputScale:](v37, "setNmsOutputScale:", v53);
                objc_msgSend(v54, "addObject:", v37);
              }
            }

            ++v31;
            v30 = *(_QWORD *)a3;
            if (0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3) <= v11)
              goto LABEL_26;
          }
          -[CRTextFeature setSubFeatures:](v16, "setSubFeatures:", v54);
          objc_msgSend(v52, "addObject:", v16);

        }
      }

      ++v11;
      v10 = *(_QWORD *)a3;
    }
    while (0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3) > v11);
  }
  return v52;
}

+ (BOOL)_supportsFragmentedLines
{
  return 0;
}

+ (id)_lineRegionFromLineTextFeature:(id)a3 imageSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  CRNormalizedQuad *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CRNormalizedQuad *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  height = a4.height;
  width = a4.width;
  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend(a1, "_supportsFragmentedLines"))
  {
    v8 = (void *)objc_opt_new();
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v7, "subFeatures");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v43 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(a1, "_lineRegionFromLineTextFeature:imageSize:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i), width, height);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v13);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v10);
    }

    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setRegionFragments:", v8);

  }
  else
  {
    v15 = objc_opt_new();
    objc_msgSend(v7, "subFeatures");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17 == 1)
    {
      objc_msgSend(v7, "subFeatures");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
      v7 = (id)v19;
    }
    else
    {
      v14 = (void *)v15;
    }
  }
  v20 = [CRNormalizedQuad alloc];
  objc_msgSend(v7, "topLeft");
  v22 = v21;
  v24 = v23;
  objc_msgSend(v7, "topRight");
  v26 = v25;
  v28 = v27;
  objc_msgSend(v7, "bottomRight");
  v30 = v29;
  v32 = v31;
  objc_msgSend(v7, "bottomLeft");
  v35 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v20, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v22, v24, v26, v28, v30, v32, v33, v34, *(_QWORD *)&width, *(_QWORD *)&height);
  objc_msgSend(v14, "setBoundingQuad:", v35);

  objc_msgSend(v14, "setLayoutDirection:", 1);
  objc_msgSend(v14, "setIsCurved:", objc_msgSend(v7, "isCurved"));
  objc_msgSend(v7, "polygon");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPolygon:", v36);

  objc_msgSend(v7, "scriptCategoryResults");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setScriptCategoryResults:", v37);

  objc_msgSend(v7, "selectedScriptCategory");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTopScriptCategory:", v38);

  objc_msgSend(v7, "scriptCounts");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setScriptCategoryCounts:", v39);

  objc_msgSend(v14, "setShouldRunSequenceScript:", objc_msgSend(v7, "useSequenceScriptLocale"));
  objc_msgSend(v14, "setNmsOutputScale:", objc_msgSend(v7, "nmsOutputScale"));
  if (objc_msgSend(v7, "isVerticalLayout"))
    v40 = 5;
  else
    v40 = 1;
  objc_msgSend(v14, "setLayoutDirection:", v40);
  if (objc_msgSend(v7, "shouldRotate180"))
    objc_msgSend(v14, "rotate180");
  objc_msgSend(v14, "setShouldRotate180DetectorOrientationFallback:", objc_msgSend(v7, "shouldRotate180DetectorOrientationFallBack"));
  objc_msgSend(v14, "setShouldRunSequenceOrientation:", objc_msgSend(v7, "useSequenceOrientation"));
  objc_msgSend(v14, "setTextType:", objc_msgSend(v7, "textType"));

  return v14;
}

- (id)detectInImage:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)detectInImage:(id)a3 trackingSession:(id)a4 error:(id *)a5
{
  -[CRNeuralTextDetector detectInImage:error:](self, "detectInImage:error:", a3, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGSize)smallestImageSizeForTextWithRelativeHeight:(double)a3 originalImageSize:(CGSize)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CRDetectorConfiguration)configuration
{
  return (CRDetectorConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CRPerformanceStatistics)detectorStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDetectorStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CRPerformanceStatistics)postProcStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPostProcStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CRPerformanceStatistics)inferenceStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInferenceStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)shouldCancel
{
  return self->_shouldCancel;
}

- (void)setShouldCancel:(BOOL)a3
{
  self->_shouldCancel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inferenceStats, 0);
  objc_storeStrong((id *)&self->_postProcStats, 0);
  objc_storeStrong((id *)&self->_detectorStats, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
