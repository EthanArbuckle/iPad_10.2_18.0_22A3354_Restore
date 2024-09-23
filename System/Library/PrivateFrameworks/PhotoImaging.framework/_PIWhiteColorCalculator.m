@implementation _PIWhiteColorCalculator

- (_PIWhiteColorCalculator)initWithComposition:(id)a3 useSushi:(BOOL)a4
{
  NUComposition *v6;
  _PIWhiteColorCalculator *v7;
  NUComposition *composition;
  NUComposition *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *q;
  uint64_t v12;
  NUBufferRenderClient *bufferRenderClient;
  uint64_t v14;
  NUImageDataClient *imageDataClient;
  objc_super v17;

  v6 = (NUComposition *)a3;
  v17.receiver = self;
  v17.super_class = (Class)_PIWhiteColorCalculator;
  v7 = -[_PIWhiteColorCalculator init](&v17, sel_init);
  composition = v7->_composition;
  v7->_composition = v6;
  v9 = v6;

  v7->_useSushi = a4;
  v10 = dispatch_queue_create("PIWhiteBalanceAutoCalculator", 0);
  q = v7->_q;
  v7->_q = (OS_dispatch_queue *)v10;

  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D52018]), "initWithName:responseQueue:", CFSTR("PIWhiteBalanceAutoCalculator"), v7->_q);
  bufferRenderClient = v7->_bufferRenderClient;
  v7->_bufferRenderClient = (NUBufferRenderClient *)v12;

  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D52138]), "initWithName:responseQueue:", CFSTR("PIWhiteBalanceAutoCalculator"), v7->_q);
  imageDataClient = v7->_imageDataClient;
  v7->_imageDataClient = (NUImageDataClient *)v14;

  return v7;
}

- (void)readBufferFromImage:(id)a3 withRGBAfBufferBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "validRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68___PIWhiteColorCalculator_readBufferFromImage_withRGBAfBufferBlock___block_invoke;
  v9[3] = &unk_1E5016368;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "readBufferRegion:withBlock:", v7, v9);

}

- (void)calculateColorWithProperties:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  BOOL useSushi;
  void *v11;
  OS_dispatch_queue *q;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _PIWhiteColorCalculator *v19;
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  BOOL v25;
  _QWORD v26[6];
  _QWORD v27[6];
  _QWORD v28[4];
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[4];
  _QWORD v37[5];
  id v38;

  v6 = a3;
  v7 = a4;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__5351;
  v37[4] = __Block_byref_object_dispose__5352;
  v38 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__5351;
  v34[4] = __Block_byref_object_dispose__5352;
  v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__5351;
  v32[4] = __Block_byref_object_dispose__5352;
  v33 = 0;
  -[_PIWhiteColorCalculator _brightnessMultiplierFromImageProperties:](self, "_brightnessMultiplierFromImageProperties:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D52290], "begin");
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __67___PIWhiteColorCalculator_calculateColorWithProperties_completion___block_invoke;
    v28[3] = &unk_1E5018E60;
    v30 = v37;
    v29 = v8;
    v31 = v36;
    -[_PIWhiteColorCalculator _computeGreenPercentage:](self, "_computeGreenPercentage:", v28);

  }
  useSushi = self->_useSushi;
  v27[0] = v9;
  v27[1] = 3221225472;
  v27[2] = __67___PIWhiteColorCalculator_calculateColorWithProperties_completion___block_invoke_2;
  v27[3] = &unk_1E5016390;
  v27[4] = v34;
  v27[5] = v37;
  -[_PIWhiteColorCalculator _submitGERenderRequest:](self, "_submitGERenderRequest:", v27);
  v26[0] = v9;
  v26[1] = 3221225472;
  v26[2] = __67___PIWhiteColorCalculator_calculateColorWithProperties_completion___block_invoke_3;
  v26[3] = &unk_1E5016390;
  v26[4] = v32;
  v26[5] = v37;
  -[_PIWhiteColorCalculator _submitGWRenderRequest:](self, "_submitGWRenderRequest:", v26);
  v11 = (void *)MEMORY[0x1E0D52290];
  q = self->_q;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __67___PIWhiteColorCalculator_calculateColorWithProperties_completion___block_invoke_4;
  v16[3] = &unk_1E50163B8;
  v21 = v37;
  v13 = v8;
  v17 = v13;
  v22 = v36;
  v25 = useSushi;
  v14 = v6;
  v18 = v14;
  v19 = self;
  v23 = v34;
  v24 = v32;
  v15 = v7;
  v20 = v15;
  objc_msgSend(v11, "commitAndNotifyOnQueue:withBlock:", q, v16);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v37, 8);

}

- (id)_brightnessMultiplierFromImageProperties:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  long double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  NSObject *v31;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  int v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB50]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = flashFired(v5);
  apertureValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  shutterSpeedValue(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isoValue(v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10 || v7 == 0)
    goto LABEL_14;
  objc_msgSend(v7, "doubleValue");
  if (v12 <= 0.0)
    goto LABEL_14;
  if (self->_useSushi)
  {
    if ((v6 & 1) == 0)
    {
      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "doubleValue");
      v15 = v14;
      objc_msgSend(v7, "doubleValue");
      v17 = v15 * v16;
      objc_msgSend(v8, "doubleValue");
      v19 = log2(v17 / v18);
      objc_msgSend(v9, "doubleValue");
      v21 = v19 - log2(v20 * 0.319999993);
      v22 = 0.0;
      if (v21 > 0.0)
      {
        objc_msgSend(v7, "doubleValue", 0.0);
        v24 = v23;
        objc_msgSend(v7, "doubleValue");
        v26 = v24 * v25;
        objc_msgSend(v8, "doubleValue");
        v28 = log2(v26 / v27);
        objc_msgSend(v9, "doubleValue");
        v22 = v28 - log2(v29 * 0.319999993);
      }
      goto LABEL_21;
    }
LABEL_14:
    v30 = 0;
    goto LABEL_15;
  }
  if ((v6 & 1) != 0)
    goto LABEL_14;
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "doubleValue");
  v34 = v33;
  objc_msgSend(v7, "doubleValue");
  v36 = v34 * v35;
  objc_msgSend(v9, "doubleValue");
  v38 = v37;
  objc_msgSend(v8, "doubleValue");
  v22 = v36 / (v38 * v39);
LABEL_21:
  objc_msgSend(v13, "numberWithDouble:", v22);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_253);
  v31 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
  {
    v40 = 138412802;
    v41 = v7;
    v42 = 2112;
    v43 = v8;
    v44 = 2112;
    v45 = v9;
    _os_log_debug_impl(&dword_1A6382000, v31, OS_LOG_TYPE_DEBUG, "aperture=%@, shutterSpeed=%@, iso=%@", (uint8_t *)&v40, 0x20u);
  }

  return v30;
}

- ($16AC8E0751FB0D973080BA9EA013DD21)_computeWhitePointColorWithGrayEdgesBuffer:(SEL)a3 grayWorldBuffer:(id)a4 greenChannelPercentage:(id)a5 RAWCameraSpaceProperties:(double)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  float v28;
  void *v29;
  int v30;
  int v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  unint64_t v39;
  float v40;
  float v41;
  float v42;
  BOOL v45;
  double v46;
  double v47;
  double v48;
  int v49;
  float v50;
  float v51;
  float v52;
  float v53;
  double v55;
  void *v57;
  NSObject *v58;
  double v59;
  _QWORD *v60;
  os_log_t *v61;
  NSObject *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  NSObject *v77;
  $16AC8E0751FB0D973080BA9EA013DD21 *result;
  NSObject *v79;
  void *v80;
  uint64_t v81;
  const __CFString *v82;
  _BOOL4 useSushi;
  id v84;
  id v86;
  uint8_t buf[4];
  _BYTE v88[10];
  double v89;
  __int16 v90;
  double v91;
  __int16 v92;
  double v93;
  __int16 v94;
  double v95;
  __int16 v96;
  double v97;
  __int16 v98;
  double v99;
  __int16 v100;
  uint64_t v101;
  __int16 v102;
  const __CFString *v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a7;
  *(_OWORD *)retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var0[2] = 0u;
  *(_OWORD *)retstr->var1.var0 = 0u;
  *(_OWORD *)&retstr->var1.var0[2] = 0u;
  retstr->var2 = 0.0;
  v14 = objc_msgSend(v11, "rowBytes");
  v15 = objc_msgSend(v12, "rowBytes");
  if (v13)
  {
    objc_msgSend(v13, "whiteValue");
    v17 = v16;
    objc_msgSend(v13, "whiteFactor");
    v19 = 65535.0;
    if (v17 != 0.0 && v18 != 0.0)
      v19 = 65535.0 / (v17 * v18);
    v20 = 0.800000012 / v19;
  }
  else
  {
    v20 = 0.98039;
  }
  v21 = objc_msgSend(v12, "bytes");
  v22 = objc_msgSend(v11, "bytes");
  v86 = v11;
  v23 = objc_msgSend(v11, "size");
  v25 = v24;
  objc_msgSend(v12, "size");
  v26 = NUPixelSizeEqualToSize();
  v27 = *MEMORY[0x1E0D52390];
  if ((v26 & 1) != 0)
  {
    v84 = v12;
    if (v27 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_253);
    v28 = flt_1A64D65D0[v13 == 0];
    v29 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
    {
      v79 = v29;
      NSStringFromNUPixelSize();
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v81 = 0x3FA99999A0000000;
      *(_QWORD *)v88 = v80;
      if (!v13)
        v81 = 0x3FA4141420000000;
      *(_WORD *)&v88[8] = 2048;
      v89 = *(double *)&v14;
      v90 = 2048;
      v91 = v28;
      v92 = 2048;
      v93 = v20;
      v94 = 2048;
      v95 = *(double *)&v81;
      _os_log_debug_impl(&dword_1A6382000, v79, OS_LOG_TYPE_DEBUG, "Buffer size is %@, bytes per row is %ld, dark_thr=%f, sat_thr=%f, noise_thr=%f", buf, 0x34u);

    }
    if (v25 < 1)
    {
      v31 = 0;
      v30 = 0;
      v37 = 0.0;
      v36 = 0.0;
      v35 = 0.0;
      v34 = 0.0;
      v33 = 0.0;
      v32 = 0.0;
    }
    else
    {
      v30 = 0;
      v31 = 0;
      v32 = 0.0;
      v33 = 0.0;
      v34 = 0.0;
      v35 = 0.0;
      v36 = 0.0;
      v37 = 0.0;
      do
      {
        if (v23 >= 1)
        {
          v38 = 0;
          v39 = v23 + 1;
          do
          {
            v40 = *(float *)(v21 + v38);
            v41 = *(float *)(v21 + v38 + 4);
            v42 = *(float *)(v21 + v38 + 8);
            v45 = (float)((float)((float)(v41 + v40) + v42) / 3.0) > v28 && v40 < v20 && v41 < v20 && v42 < v20;
            if (v45 && ((v46 = v41, v47 = v40, v48 = v42, v46 * a6 < v47) || v46 * a6 < v48))
            {
              v34 = v34 + v47;
              v33 = v33 + v46;
              v32 = v32 + v48;
              ++v31;
              v49 = 1;
            }
            else
            {
              v49 = 0;
            }
            v51 = *(float *)(v22 + v38);
            v50 = *(float *)(v22 + v38 + 4);
            v52 = *(float *)(v22 + v38 + 8);
            v53 = (float)((float)(v50 + v51) + v52) / 3.0;
            if (v53 > flt_1A64D65F0[v13 == 0] && v53 < (float)(v20 * v20))
            {
              v55 = v50 * a6;
              if (v55 < v51 || v55 < v52)
              {
                if (v49)
                {
                  v37 = v37 + sqrtf(fabsf(v51));
                  v36 = v36 + sqrtf(fabsf(v50));
                  v35 = v35 + sqrtf(fabsf(v52));
                  ++v30;
                }
              }
            }
            --v39;
            v38 += 16;
          }
          while (v39 > 1);
        }
        v21 += v15;
        v22 += v14;
      }
      while (v25-- > 1);
    }
    v59 = v35;
    v60 = (_QWORD *)MEMORY[0x1E0D52390];
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_253);
    v57 = v86;
    v61 = (os_log_t *)MEMORY[0x1E0D52398];
    v62 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v88 = v31;
      *(_WORD *)&v88[4] = 1024;
      *(_DWORD *)&v88[6] = v30;
      _os_log_debug_impl(&dword_1A6382000, v62, OS_LOG_TYPE_DEBUG, "all done summing, np_gw is %d, np_ge is %d", buf, 0xEu);
    }
    v63 = 1.0;
    v64 = 1.0;
    v65 = 1.0;
    v66 = 1.0;
    if (v31 >= 1)
    {
      v64 = v34 / (double)v31;
      v65 = v33 / (double)v31;
      v66 = v32 / (double)v31;
    }
    v67 = v64 + v65 + v66;
    v68 = v64 / v67;
    v69 = v65 / v67;
    v70 = 1.0;
    v71 = 1.0;
    v72 = v66 / v67;
    if (v30 >= 1)
    {
      v63 = v37 / (double)v30;
      v70 = v36 / (double)v30;
      v71 = v59 / (double)v30;
    }
    v73 = v63 + v70 + v71;
    v74 = v63 / v73;
    v75 = v70 / v73;
    v76 = v71 / v73;
    retstr->var0.var0[0] = v63 / v73;
    retstr->var0.var0[1] = v70 / v73;
    retstr->var0.var0[2] = v71 / v73;
    retstr->var0.var0[3] = 1.0;
    retstr->var1.var0[0] = v68;
    retstr->var1.var0[1] = v69;
    retstr->var1.var0[2] = v72;
    retstr->var1.var0[3] = 1.0;
    v12 = v84;
    if (*v60 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_253);
    v77 = *v61;
    if (os_log_type_enabled(*v61, OS_LOG_TYPE_DEBUG))
    {
      v82 = CFSTR("YES");
      useSushi = self->_useSushi;
      *(_DWORD *)buf = 134220034;
      if (!useSushi)
        v82 = CFSTR("NO");
      *(double *)v88 = v74;
      *(_WORD *)&v88[8] = 2048;
      v89 = v75;
      v90 = 2048;
      v91 = v76;
      v92 = 2048;
      v93 = 1.0;
      v94 = 2048;
      v95 = v68;
      v96 = 2048;
      v97 = v69;
      v98 = 2048;
      v99 = v72;
      v100 = 2048;
      v101 = 0x3FF0000000000000;
      v102 = 2112;
      v103 = v82;
      _os_log_debug_impl(&dword_1A6382000, v77, OS_LOG_TYPE_DEBUG, "wp_ge {%f, %f, %f, %f} wp_gw {%f, %f, %f, %f}, Sushi? %@", buf, 0x5Cu);
    }
  }
  else
  {
    if (v27 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_253);
    v57 = v86;
    v58 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v88 = v86;
      *(_WORD *)&v88[8] = 2114;
      v89 = *(double *)&v12;
      _os_log_impl(&dword_1A6382000, v58, OS_LOG_TYPE_INFO, "Buffer sizes are not the same: %{public}@ vs %{public}@", buf, 0x16u);
    }
    retstr->var2 = 0.0;
    *(_OWORD *)retstr->var1.var0 = 0u;
    *(_OWORD *)&retstr->var1.var0[2] = 0u;
    *(_OWORD *)retstr->var0.var0 = 0u;
    *(_OWORD *)&retstr->var0.var0[2] = 0u;
  }

  return result;
}

- ($16AC8E0751FB0D973080BA9EA013DD21)_whitePointColorFromGrayEdgesImage:(SEL)a3 grayWorldImage:(id)a4 greenChannelPercentage:(id)a5 RAWCameraSpaceProperties:(double)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t *v17;
  __int128 v18;
  __int128 v19;
  $16AC8E0751FB0D973080BA9EA013DD21 *result;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t *v24;
  double v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  const char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v26 = 0;
  v27 = &v26;
  v28 = 0x6810000000;
  v29 = "";
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __125___PIWhiteColorCalculator__whitePointColorFromGrayEdgesImage_grayWorldImage_greenChannelPercentage_RAWCameraSpaceProperties___block_invoke;
  v21[3] = &unk_1E50163E0;
  v21[4] = self;
  v15 = v13;
  v22 = v15;
  v24 = &v26;
  v25 = a6;
  v16 = v14;
  v23 = v16;
  -[_PIWhiteColorCalculator readBufferFromImage:withRGBAfBufferBlock:](self, "readBufferFromImage:withRGBAfBufferBlock:", v12, v21);
  v17 = v27;
  v18 = *((_OWORD *)v27 + 5);
  *(_OWORD *)retstr->var1.var0 = *((_OWORD *)v27 + 4);
  *(_OWORD *)&retstr->var1.var0[2] = v18;
  *(_QWORD *)&retstr->var2 = v17[12];
  v19 = *((_OWORD *)v17 + 3);
  *(_OWORD *)retstr->var0.var0 = *((_OWORD *)v17 + 2);
  *(_OWORD *)&retstr->var0.var0[2] = v19;

  _Block_object_dispose(&v26, 8);
  return result;
}

- (void)_configureRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(MEMORY[0x1E0D52220], "RGBAh");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPixelFormat:", v4);

  objc_msgSend(MEMORY[0x1E0D52068], "genericRGBLinearColorSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColorSpace:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", 0x40000);
  objc_msgSend(v10, "setScalePolicy:", v6);

  objc_msgSend(v10, "setSampleMode:", 3);
  objc_msgSend(v10, "setTileSize:", 0x40000, 0x40000);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->_useSushi)
  {
    +[PIPipelineFilters rawSourceFilterIncludingOrientation](PIPipelineFilters, "rawSourceFilterIncludingOrientation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    +[PIPipelineFilters sushiLevel1Filter](PIPipelineFilters, "sushiLevel1Filter");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D52260], "stopAtTagFilter:", CFSTR("/Master/Source"));
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v9);

  objc_msgSend(v10, "setPipelineFilters:", v7);
}

- (void)_computeGreenPercentage:(id)a3
{
  id v4;
  void *v5;
  NUImageDataClient *imageDataClient;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52140]), "initWithComposition:dataExtractor:options:", self->_composition, CFSTR("CIAreaAverage"), 0);
  objc_msgSend(v5, "setName:", CFSTR("PIWhiteColorCalculator-computeGreenPercentage"));
  -[_PIWhiteColorCalculator _configureRequest:](self, "_configureRequest:", v5);
  imageDataClient = self->_imageDataClient;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51___PIWhiteColorCalculator__computeGreenPercentage___block_invoke;
  v8[3] = &unk_1E5019A68;
  v9 = v4;
  v7 = v4;
  -[NUImageDataClient submitRequest:completion:](imageDataClient, "submitRequest:completion:", v5, v8);

}

- (void)_submitGWRenderRequest:(id)a3
{
  id v4;
  void *v5;
  NUBufferRenderClient *bufferRenderClient;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52020]), "initWithComposition:", self->_composition);
  objc_msgSend(v5, "setName:", CFSTR("PIWhiteColorCalculator-grayWorld"));
  -[_PIWhiteColorCalculator _configureRequest:](self, "_configureRequest:", v5);
  bufferRenderClient = self->_bufferRenderClient;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50___PIWhiteColorCalculator__submitGWRenderRequest___block_invoke;
  v8[3] = &unk_1E5019A68;
  v9 = v4;
  v7 = v4;
  -[NUBufferRenderClient setCompletionBlock:](bufferRenderClient, "setCompletionBlock:", v8);
  -[NUBufferRenderClient submitRequest:](self->_bufferRenderClient, "submitRequest:", v5);
  -[NUBufferRenderClient setCompletionBlock:](self->_bufferRenderClient, "setCompletionBlock:", &__block_literal_global_5429);

}

- (void)_submitGERenderRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NUBufferRenderClient *bufferRenderClient;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52020]), "initWithComposition:", self->_composition);
  objc_msgSend(v5, "setName:", CFSTR("PIWhiteColorCalculator-grayEdges"));
  -[_PIWhiteColorCalculator _configureRequest:](self, "_configureRequest:", v5);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->_useSushi)
  {
    +[PIPipelineFilters rawSourceFilterIncludingOrientation](PIPipelineFilters, "rawSourceFilterIncludingOrientation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    +[PIPipelineFilters sushiLevel1Filter](PIPipelineFilters, "sushiLevel1Filter");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D52260], "stopAtTagFilter:", CFSTR("/Master/Source"));
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_218);
  objc_msgSend(v6, "addObject:", v9);

  objc_msgSend(v5, "setPipelineFilters:", v6);
  bufferRenderClient = self->_bufferRenderClient;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50___PIWhiteColorCalculator__submitGERenderRequest___block_invoke_2;
  v12[3] = &unk_1E5019A68;
  v13 = v4;
  v11 = v4;
  -[NUBufferRenderClient setCompletionBlock:](bufferRenderClient, "setCompletionBlock:", v12);
  -[NUBufferRenderClient submitRequest:](self->_bufferRenderClient, "submitRequest:", v5);
  -[NUBufferRenderClient setCompletionBlock:](self->_bufferRenderClient, "setCompletionBlock:", &__block_literal_global_224_5420);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_q, 0);
  objc_storeStrong((id *)&self->_imageDataClient, 0);
  objc_storeStrong((id *)&self->_bufferRenderClient, 0);
  objc_storeStrong((id *)&self->_composition, 0);
}

@end
