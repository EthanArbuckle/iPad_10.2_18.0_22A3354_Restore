@implementation NUNIAegirRenderer

- (NUNIAegirRenderer)initWithPixelFormat:(unint64_t)a3 textureSuffix:(id)a4 rendererStyle:(unint64_t)a5
{
  id v8;
  NUNIAegirRenderer *v9;
  uint64_t v10;
  NUNIAegirResourceManager *resourceManager;
  uint64_t v12;
  MTLDevice *device;
  uint64_t v14;
  NUNIAegirTextureGroup *textureGroup;
  uint64_t i;
  uint64_t v17;
  NSMutableArray *v18;
  objc_super v20;

  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NUNIAegirRenderer;
  v9 = -[NUNIRenderer initWithPixelFormat:textureSuffix:rendererStyle:](&v20, sel_initWithPixelFormat_textureSuffix_rendererStyle_, a3, v8, a5);
  if (v9)
  {
    +[NUNIAegirResourceManager sharedInstanceWithDisplayPixelFormat:](NUNIAegirResourceManager, "sharedInstanceWithDisplayPixelFormat:", a3);
    v10 = objc_claimAutoreleasedReturnValue();
    resourceManager = v9->_resourceManager;
    v9->_resourceManager = (NUNIAegirResourceManager *)v10;

    -[NUNIAegirResourceManager addClient](v9->_resourceManager, "addClient");
    +[CLKUIMetalResourceManager sharedDevice](CLKUIMetalResourceManager, "sharedDevice");
    v12 = objc_claimAutoreleasedReturnValue();
    device = v9->_device;
    v9->_device = (MTLDevice *)v12;

    -[NUNIAegirResourceManager textureGroupWithSuffix:device:](v9->_resourceManager, "textureGroupWithSuffix:device:", v8, v9->_device);
    v14 = objc_claimAutoreleasedReturnValue();
    textureGroup = v9->_textureGroup;
    v9->_textureGroup = (NUNIAegirTextureGroup *)v14;

    for (i = 0; i != 3; ++i)
    {
      v17 = objc_opt_new();
      v18 = v9->_renderUniformsBuffers[i];
      v9->_renderUniformsBuffers[i] = (NSMutableArray *)v17;

    }
    v9->_supportsMTLGPUFamilyApple6 = -[MTLDevice supportsFamily:](v9->_device, "supportsFamily:", 1006);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NUNIAegirResourceManager removeClient](self->_resourceManager, "removeClient");
  v3.receiver = self;
  v3.super_class = (Class)NUNIAegirRenderer;
  -[NUNIRenderer dealloc](&v3, sel_dealloc);
}

+ (id)texturePreloadingQueue
{
  if (texturePreloadingQueue_onceToken != -1)
    dispatch_once(&texturePreloadingQueue_onceToken, &__block_literal_global_8);
  return (id)texturePreloadingQueue_queue;
}

void __43__NUNIAegirRenderer_texturePreloadingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.weather.aegir.preloading", v2);
  v1 = (void *)texturePreloadingQueue_queue;
  texturePreloadingQueue_queue = (uint64_t)v0;

}

- (void)prepareForRenderingSpheroids:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend((id)objc_opt_class(), "texturePreloadingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__NUNIAegirRenderer_prepareForRenderingSpheroids_completionHandler___block_invoke;
  v11[3] = &unk_1E6076400;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __68__NUNIAegirRenderer_prepareForRenderingSpheroids_completionHandler___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[5], "prepareForRendering");
    objc_msgSend(v3[6], "preloadTexturesForSpheroids:", *(_QWORD *)(a1 + 32));
    dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)setRendererOptions:(id)a3
{
  NUNIRendererOptions **p_rendererOptions;
  id v6;

  p_rendererOptions = &self->_rendererOptions;
  objc_storeStrong((id *)&self->_rendererOptions, a3);
  v6 = a3;
  LODWORD(p_rendererOptions) = -[NUNIRendererOptions changeSequence](*p_rendererOptions, "changeSequence");

  self->_rendererOptionsChangeSequence = (_DWORD)p_rendererOptions - 1;
}

- (void)purgeUnusedWithScene:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v4 = objc_msgSend(a3, "snap");
  +[CLKUIResourceManager sharedInstance](CLKUIResourceManager, "sharedInstance");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  +[CLKUITexture nullTexture2D](CLKUITexture, "nullTexture2D");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 24; ++i)
  {
    if (v4 != i)
    {
      -[NUNIAegirTextureGroup albedos](self->_textureGroup, "albedos");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 != v5)
      {
        objc_msgSend(v8, "atlas");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "purge:", v10);

      }
      -[NUNIAegirTextureGroup normals](self->_textureGroup, "normals");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 != v5)
      {
        objc_msgSend(v12, "atlas");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "purge:", v14);

      }
      -[NUNIAegirTextureGroup emissives](self->_textureGroup, "emissives");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 != v5)
      {
        objc_msgSend(v16, "atlas");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "purge:", v18);

      }
      -[NUNIAegirTextureGroup cloudsLo](self->_textureGroup, "cloudsLo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", i);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20 != v5)
      {
        objc_msgSend(v20, "atlas");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "uuid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "purge:", v22);

      }
      -[NUNIAegirTextureGroup cloudsMd](self->_textureGroup, "cloudsMd");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", i);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24 != v5)
      {
        objc_msgSend(v24, "atlas");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "uuid");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "purge:", v26);

      }
      -[NUNIAegirTextureGroup cloudsHi](self->_textureGroup, "cloudsHi");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", i);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28 != v5)
      {
        objc_msgSend(v28, "atlas");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "uuid");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "purge:", v30);

      }
      -[NUNIAegirTextureGroup gradients](self->_textureGroup, "gradients");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndexedSubscript:", i);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32 != v5)
      {
        objc_msgSend(v32, "atlas");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "uuid");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "purge:", v34);

      }
    }
  }

}

- (id)contentMaskLayer
{
  return self->_contentMaskLayer;
}

- (void)setContentMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_contentMaskLayer, a3);
}

- (void)_updateStateWithScene:(id)a3 viewport:(NUNIViewport)a4
{
  int width;
  int height;
  id v7;
  float32x4_t v8;
  float32x4_t v9;
  float v10;
  float v11;
  uint64_t v12;
  int32x4_t v20;
  int32x4_t v21;
  float32x4_t v22;
  float32x4_t v24;
  int32x4_t v29;
  float v33;
  float v34;
  float v35;
  simd_float4 v36;
  simd_float4 v37;
  simd_float4 v38;
  simd_float4 v39;
  __float2 v40;
  float32x2_t v41;
  simd_float4 v42;
  simd_float4 v43;
  simd_float4 v44;
  simd_float4 v45;
  simd_float4 v46;
  simd_float4 v47;
  simd_float4 v48;
  simd_float4 v49;
  simd_float4 v50;
  simd_float4 v51;
  simd_float4 v52;
  simd_float4 v53;
  simd_float4 v54;
  simd_float4 v55;
  simd_float4 v56;
  simd_float4 v57;
  simd_float4 v58;
  simd_float4 v59;
  simd_float4 v60;
  simd_float4 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  simd_float4 v66;
  simd_float4 v67;
  simd_float4 v68;
  simd_float4 v69;
  simd_float4 v70;
  simd_float4 v71;
  simd_float4 v72;
  simd_float4 v73;
  float32x4_t v74;
  int32x4_t v75;
  uint64_t v76;
  float32x4_t v77;
  simd_float4 v78;
  simd_float4 v79;
  simd_float4 v80;
  int32x4_t v81;
  simd_float4 v82;
  float32x4_t v83;
  float32x4_t v84;
  simd_float4x4 v85;
  simd_float4x4 v86;
  simd_float4x4 v87;
  simd_float4x4 v88;
  simd_float4x4 v89;
  simd_float4x4 v90;
  simd_float4x4 v91;
  simd_float4x4 v92;

  width = a4.width;
  height = a4.height;
  v7 = a3;
  objc_msgSend(v7, "cameraPosition");
  v83 = v8;
  objc_msgSend(v7, "cameraTarget");
  v77 = v9;
  objc_msgSend(v7, "cameraRoll");
  v11 = v10;
  objc_msgSend(v7, "cameraOffset");
  v76 = v12;
  _Q0 = vsubq_f32(v77, v83);
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  v84 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
  objc_msgSend(v7, "cameraUp");
  v81 = v20;

  v21 = (int32x4_t)v84;
  v22 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v21, (int8x16_t)v21, 0xCuLL), (int8x16_t)v21, 8uLL);
  _Q4 = v81;
  _Q3 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(_Q4, _Q4), (int8x16_t)_Q4, 0xCuLL);
  v24 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v21, v21), (int8x16_t)v21, 0xCuLL);
  _Q2 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)_Q4, (int8x16_t)_Q4, 0xCuLL), (int8x16_t)_Q4, 8uLL), vnegq_f32(v24)), _Q3, v22);
  _Q3.i32[0] = _Q2.i32[2];
  __asm { FMLA            S4, S3, V2.S[2] }
  _Q3.f32[0] = sqrtf(*(float *)_Q4.i32);
  if (_Q3.f32[0] < 0.00001)
  {
    _Q2 = vmlaq_f32(vmulq_f32(v24, (float32x4_t)xmmword_1B00245A0), (float32x4_t)xmmword_1B00245B0, v22);
    _Q3.i64[0] = _Q2.u32[2];
    __asm { FMLA            S4, S3, V2.S[2] }
    _Q3.f32[0] = sqrtf(_S4);
    if (_Q3.f32[0] < 0.00001)
    {
      _Q2 = vmlaq_f32(vmulq_f32(v24, (float32x4_t)xmmword_1B00245C0), (float32x4_t)xmmword_1B00245D0, v22);
      _Q3.i64[0] = _Q2.u32[2];
      __asm { FMLA            S4, S3, V2.S[2] }
      _Q3.f32[0] = sqrtf(_S4);
    }
  }
  v29 = (int32x4_t)vdivq_f32(_Q2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q3.f32, 0));
  _Q0 = vmlaq_f32(vmulq_f32(v22, vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v29, v29), (int8x16_t)v29, 0xCuLL))), v24, (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v29, (int8x16_t)v29, 0xCuLL), (int8x16_t)v29, 8uLL));
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  v74 = vnegq_f32(vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0)));
  v75 = v29;
  v33 = (float)width / (float)height;
  if (v33 >= 1.0)
  {
    v35 = 0.34907;
  }
  else
  {
    v34 = atanf(0.17633 / v33);
    v35 = v34 + v34;
  }
  *(__n64 *)v36.f32 = UMFloat4x4MakeLookAt(*(double *)v75.i64, v74.f32[0]);
  v80 = v37;
  v82 = v36;
  v78 = v39;
  v79 = v38;
  if (fabsf(v11) > 0.00001)
  {
    v40 = __sincosf_stret(v11 * 0.5);
    v41 = vmul_n_f32(*(float32x2_t *)v84.f32, v40.__sinval);
    *(__n64 *)v42.f32 = UMFloat4x4Make(v41.f32[0], v41.f32[1], vmuls_lane_f32(v40.__sinval, v84, 2), v40.__cosval);
    v89.columns[0] = v42;
    v89.columns[1] = v43;
    v89.columns[2] = v44;
    v89.columns[3] = v45;
    v85.columns[1] = v80;
    v85.columns[0] = v82;
    v85.columns[3] = v78;
    v85.columns[2] = v79;
    *(double *)v46.i64 = UMMul(v85, v89);
    v80 = v47;
    v82 = v46;
    v78 = v49;
    v79 = v48;
  }
  *(double *)v50.i64 = UMFloat4x4MakeTranslate();
  v90.columns[0] = v50;
  v90.columns[1] = v51;
  v90.columns[2] = v52;
  v90.columns[3] = v53;
  v86.columns[1] = v80;
  v86.columns[0] = v82;
  v86.columns[3] = v78;
  v86.columns[2] = v79;
  *(double *)v54.i64 = UMMul(v86, v90);
  v72 = v55;
  v73 = v54;
  v70 = v57;
  v71 = v56;
  v58.f32[0] = UMFloat4x4MakePerspective((float)(v35 * 180.0) / 3.1416, (float)width / (float)height, 0.001, 4.0);
  v68 = v59;
  v69 = v58;
  v66 = v61;
  v67 = v60;
  *(double *)v87.columns[0].i64 = UMFloat4x4MakeTranslate();
  v91.columns[1] = v68;
  v91.columns[0] = v69;
  v91.columns[3] = v66;
  v91.columns[2] = v67;
  *(double *)v88.columns[0].i64 = UMMul(v87, v91);
  v92.columns[1] = v72;
  v92.columns[0] = v73;
  v92.columns[3] = v70;
  v92.columns[2] = v71;
  *(double *)&v62 = UMMul(v88, v92);
  self->_state.viewport.width = width;
  self->_state.viewport.height = height;
  self->_state.cameraRoll = v11;
  self->_state.aspect = v33;
  self->_state.fovY = v35;
  *(_DWORD *)self->_anon_e4 = 0;
  *(_QWORD *)&self->_anon_e4[4] = v76;
  *(float32x4_t *)&self->_anon_e4[12] = v83;
  *(float32x4_t *)&self->_anon_e4[28] = v77;
  *(float32x4_t *)&self->_anon_e4[44] = v74;
  *(int32x4_t *)&self->_anon_e4[60] = v75;
  *(float32x4_t *)&self->_anon_e4[76] = v84;
  *(simd_float4 *)&self->_anon_e4[92] = v82;
  *(simd_float4 *)&self->_anon_e4[108] = v80;
  *(simd_float4 *)&self->_anon_e4[124] = v79;
  *(simd_float4 *)&self->_anon_e4[140] = v78;
  *(simd_float4 *)&self->_anon_e4[156] = v73;
  *(simd_float4 *)&self->_anon_e4[172] = v72;
  *(simd_float4 *)&self->_anon_e4[188] = v71;
  *(simd_float4 *)&self->_anon_e4[204] = v70;
  *(_OWORD *)&self->_anon_e4[220] = v62;
  *(_OWORD *)&self->_anon_e4[236] = v63;
  *(_OWORD *)&self->_anon_e4[252] = v64;
  *(_OWORD *)&self->_anon_e4[268] = v65;
}

- (void)_updateBaseUniformsForViewport:(NUNIViewport)a3
{
  int width;
  int height;
  unsigned int v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  double v11;
  NUNIAegirResourceManager *resourceManager;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  float aspect;
  float v24;
  float v26;
  float v29;
  float v31;
  __int32 v32;
  float16x4_t v33;
  float32x4_t v34;
  uint64_t v35;
  _OWORD v36[3];
  _OWORD v37[2];

  width = a3.width;
  height = a3.height;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * self->_frame, 2) <= 0x444444444444444uLL)
  {
    v6 = -[NUNIRendererOptions changeSequence](self->_rendererOptions, "changeSequence");
    if (v6 != self->_rendererOptionsChangeSequence)
    {
      v7 = 0;
      self->_rendererOptionsChangeSequence = v6;
      do
      {
        v8 = _updateBaseUniformsForViewport__optionKeys[v7];
        -[NUNIRendererOptions fractionValueForOption:](self->_rendererOptions, "fractionValueForOption:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "doubleValue");
          *(float *)&v11 = v11;
          _H1 = *(_WORD *)&self->_anon_3b4[2 * v7];
          __asm { FCVT            S1, H1 }
          if (*(float *)&v11 != _S1)
          {
            objc_msgSend(v10, "doubleValue");
            __asm { FCVT            H0, D0 }
            *(_WORD *)&self->_anon_3b4[2 * v7] = _D0;
          }
        }

        ++v7;
      }
      while (v7 != 35);
      resourceManager = self->_resourceManager;
      v20 = *(_OWORD *)&self->_anon_3b4[48];
      v36[2] = *(_OWORD *)&self->_anon_3b4[32];
      v37[0] = v20;
      *(_QWORD *)((char *)v37 + 14) = *(_QWORD *)&self->_anon_3b4[62];
      v21 = *(_OWORD *)&self->_anon_3b4[16];
      v36[0] = *(_OWORD *)self->_anon_3b4;
      v36[1] = v21;
      -[NUNIAegirResourceManager setPipelineConstants:](resourceManager, "setPipelineConstants:", v36);
    }
  }
  v22 = *(_QWORD *)&self->_anon_e4[4];
  aspect = self->_state.aspect;
  if (height <= width)
  {
    v24 = (float)height;
    __asm { FMOV            V2.2S, #1.0 }
    *(float *)&_D2 = (float)width / (float)height;
  }
  else
  {
    v24 = (float)width;
    __asm { FMOV            V2.2S, #1.0 }
    *((float *)&_D2 + 1) = (float)height / (float)width;
  }
  v35 = _D2;
  v26 = tanf(self->_state.fovY * 0.5);
  _H4 = *(_WORD *)&self->_anon_3b4[10];
  __asm { FCVT            S4, H4 }
  v29 = (float)(_S4 * 5.0) + 1.0;
  LOWORD(_S4) = *(_WORD *)&self->_anon_3b4[12];
  __asm { FCVT            S4, H4 }
  v31 = _S4 * -10.0;
  v32 = *(_DWORD *)&self->_anon_3b4[6];
  *(_OWORD *)&self->_baseUniforms.var5 = 0u;
  *(_OWORD *)&self->_baseUniforms.var9 = 0u;
  *(_OWORD *)&self->_baseUniforms.var13 = 0u;
  *(_OWORD *)&self->_baseUniforms.var17 = 0u;
  *(_OWORD *)&self->_baseUniforms.var21 = 0u;
  *(_OWORD *)self->_anon_250 = 0u;
  *(_OWORD *)&self->_anon_250[16] = 0u;
  *(_OWORD *)&self->_anon_250[32] = 0u;
  *(_OWORD *)&self->_anon_250[48] = 0u;
  *(_OWORD *)&self->_anon_250[64] = 0u;
  *(_OWORD *)&self->_anon_250[80] = 0u;
  *(_OWORD *)&self->_anon_250[96] = 0u;
  *(_OWORD *)&self->_anon_250[112] = 0u;
  *(_OWORD *)&self->_anon_250[128] = 0u;
  *(_OWORD *)&self->_anon_250[144] = 0u;
  *(_OWORD *)&self->_anon_250[160] = 0u;
  v33.i32[0] = v32;
  *(_OWORD *)&self->_anon_250[176] = 0u;
  *(_OWORD *)&self->_anon_250[192] = 0u;
  *(_OWORD *)&self->_anon_250[208] = 0u;
  *(_OWORD *)&self->_anon_250[224] = 0u;
  *(_OWORD *)&self->_anon_250[240] = 0u;
  v34 = vcvtq_f32_f16(v33);
  *(_QWORD *)&self->_anon_250[256] = v22;
  *(_QWORD *)&self->_anon_250[264] = v35;
  *(float *)&self->_anon_250[272] = 1.0 / v24;
  *(float *)&self->_anon_250[276] = (float)(-1.0 / v26) / aspect;
  *(_QWORD *)&self->_anon_250[280] = 0x3E31D0D400000000;
  *(_DWORD *)&self->_anon_250[288] = 0;
  *(float *)&self->_anon_250[292] = v31;
  *(float *)&self->_anon_250[296] = (float)((float)(-1.0 / v29) * v31) - v31;
  *(_QWORD *)&self->_anon_250[300] = vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(v34, v34))).u64[0];
  *(float *)&self->_anon_250[308] = v29;
  *(_OWORD *)&self->_anon_250[312] = 0u;
  *(_OWORD *)&self->_anon_250[328] = 0u;
  *(_QWORD *)&self->_anon_250[344] = 0;
}

- (id)getOrCreateUniformBufferforFrameBufferIndex:(unint64_t)a3
{
  NSMutableArray *v5;
  unint64_t v6;
  void *v7;

  v5 = self->_renderUniformsBuffers[a3];
  v6 = self->_renderUniformBuffersCounts[a3];
  self->_renderUniformBuffersCounts[a3] = v6 + 1;
  if (-[NSMutableArray count](v5, "count") <= v6)
  {
    v7 = (void *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 432, 1);
    -[NSMutableArray addObject:](v5, "addObject:", v7);
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)_renderOffscreenBackgroundWithRenderEncoder:(id)a3 frameBufferIndex:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  simd_float4 v8;
  simd_float4 v9;
  simd_float4 v10;
  simd_float4 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  id v16;
  simd_float4x4 v17;

  v6 = a3;
  -[NUNIAegirRenderer getOrCreateUniformBufferforFrameBufferIndex:](self, "getOrCreateUniformBufferforFrameBufferIndex:", a4);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v16, "contents");
  memcpy((void *)v7, &self->_baseUniforms, 0x1B0uLL);
  self = (NUNIAegirRenderer *)((char *)self + 208);
  *(simd_float4x4 *)(v7 + 144) = __invert_f4(*(simd_float4x4 *)&self->_contentMaskSurfaces[2]);
  *(double *)v8.i64 = UMFloat4x4MakeTranslate();
  v17.columns[0] = v8;
  v17.columns[1] = v9;
  v17.columns[2] = v10;
  v17.columns[3] = v11;
  *(double *)&v12 = UMMul(*(simd_float4x4 *)&self->_anon_e4[12], v17);
  *(_OWORD *)(v7 + 272) = v12;
  *(_OWORD *)(v7 + 288) = v13;
  *(_OWORD *)(v7 + 304) = v14;
  *(_OWORD *)(v7 + 320) = v15;
  objc_msgSend(v6, "setVertexBuffer:offset:atIndex:", v16, 0, 1);

}

- (void)_renderRaytraceSpheroid:(id)a3 uniPtr:(NUNIAegirRenderUniforms *)a4 renderEncoder:(id)a5
{
  id v8;
  uint64_t v9;
  float v16;
  float v17;
  _BOOL8 v18;
  _BOOL4 v19;
  void *v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  simd_float4 v27;
  simd_float4 v28;
  simd_float4 v29;
  simd_float4 v30;
  simd_float4 v31;
  simd_float4 v32;
  simd_float4 v33;
  simd_float4 v34;
  simd_float4 v35;
  simd_float4 v36;
  simd_float4 v37;
  simd_float4 v38;
  float32x4_t v39;
  simd_float4 v40;
  simd_float4 v41;
  simd_float4 v42;
  simd_float4 v43;
  simd_float4 v44;
  simd_float4 v45;
  simd_float4 v46;
  simd_float4 v47;
  float16x4_t v48;
  float16x4_t v50;
  float16x4_t v52;
  float16x4_t v54;
  float32x4_t v59;
  float v60;
  float v61;
  __float2 v62;
  __float2 v63;
  __int128 v64;
  __int128 v65;
  float v66;
  float32x2_t v67;
  float v68;
  float v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  float32x4_t v90;
  simd_float4 v91;
  simd_float4 v92;
  simd_float4 v93;
  simd_float4 v94;
  float32x4_t v95;
  float v96;
  float32x4_t v97;
  float32x4_t v98;
  float v99;
  simd_float4 v100;
  float32x4_t v101;
  simd_float4 v102;
  float32x4_t v103;
  simd_float4 v104;
  float32x4_t v105;
  simd_float4 v106;
  float32x4_t v107;
  id v108;
  simd_float4x4 v109;
  simd_float4x4 v110;
  simd_float4x4 v111;
  simd_float4x4 v112;
  simd_float4x4 v113;
  simd_float4x4 v114;
  simd_float4x4 v115;
  simd_float4x4 v116;
  simd_float4x4 v117;

  v108 = a3;
  v8 = a5;
  v9 = objc_msgSend(v108, "type");
  if (v9 == 3)
  {
    _H0 = *(_WORD *)&self->_anon_3b4[46];
    __asm { FCVT            S8, H0 }
    objc_msgSend(v108, "cloudOpacity");
    v17 = v16 * _S8;
    a4[5].var10 = v17;
    v18 = v17 > 0.00001;
    v19 = v17 > 0.00001;
  }
  else
  {
    v18 = 0;
    v19 = 0;
  }
  -[NUNIAegirResourceManager renderOffscreenPipelineForSpheroid:config:](self->_resourceManager, "renderOffscreenPipelineForSpheroid:config:", v9, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v8, "setLabel:", CFSTR("Ægir RaytraceSpheroid"));
    objc_msgSend(v8, "setRenderPipelineState:", v20);
    objc_msgSend(v108, "opacity");
    a4[4].var15 = v21;
    objc_msgSend(v108, "equatorRotation");
    v23 = v22;
    objc_msgSend(v108, "radius");
    v25 = v24;
    objc_msgSend(v108, "radiusScale");
    v99 = v25 * v26;
    UMFloat4x4MakeScale(v25 * v26);
    v104 = v28;
    v106 = v27;
    v100 = v30;
    v102 = v29;
    if (v23 != 0.0)
    {
      *(double *)v31.i64 = UMFloat4x4MakeRotateZ(v23 + 1.5708);
      v114.columns[0] = v31;
      v114.columns[1] = v32;
      v114.columns[2] = v33;
      v114.columns[3] = v34;
      v109.columns[1] = v104;
      v109.columns[0] = v106;
      v109.columns[3] = v100;
      v109.columns[2] = v102;
      *(double *)v35.i64 = UMMul(v109, v114);
      v104 = v36;
      v106 = v35;
      v100 = v38;
      v102 = v37;
    }
    objc_msgSend(v108, "position");
    v90 = v39;
    *(double *)v40.i64 = UMFloat4x4MakeTranslate();
    v93 = v41;
    v94 = v40;
    v91 = v43;
    v92 = v42;
    v115.columns[1] = v104;
    v115.columns[0] = v106;
    v115.columns[3] = v100;
    v115.columns[2] = v102;
    *(double *)v110.columns[0].i64 = UMMul(*(simd_float4x4 *)&self->_anon_e4[92], v115);
    v111 = __invert_f4(v110);
    v95 = (float32x4_t)v111.columns[0];
    v97 = (float32x4_t)v111.columns[1];
    v98 = (float32x4_t)v111.columns[2];
    v111.columns[1] = v93;
    v111.columns[0] = v94;
    v111.columns[3] = v91;
    v111.columns[2] = v92;
    v116.columns[1] = v104;
    v116.columns[0] = v106;
    v116.columns[3] = v100;
    v116.columns[2] = v102;
    *(double *)v44.i64 = UMMul(v111, v116);
    v117.columns[0] = v44;
    v117.columns[1] = v45;
    v117.columns[2] = v46;
    v117.columns[3] = v47;
    *(double *)v112.columns[0].i64 = UMMul(*(simd_float4x4 *)&self->_anon_e4[156], v117);
    v105 = (float32x4_t)v112.columns[1];
    v107 = (float32x4_t)v112.columns[0];
    v101 = (float32x4_t)v112.columns[3];
    v103 = (float32x4_t)v112.columns[2];
    v113 = __invert_f4(v112);
    v48 = vcvt_f16_f32(v95);
    _S5 = v95.i32[2];
    __asm { FCVT            H5, S5 }
    v48.i16[2] = _S5;
    v50 = vcvt_f16_f32(v97);
    _S6 = v97.i32[2];
    __asm { FCVT            H6, S6 }
    v50.i16[2] = _S6;
    v52 = vcvt_f16_f32(v98);
    _S7 = v98.i32[2];
    __asm { FCVT            H7, S7 }
    v52.i16[2] = _S7;
    v54 = vcvt_f16_f32((float32x4_t)v113.columns[3]);
    _S16 = v113.columns[3].i32[2];
    __asm { FCVT            H16, S16 }
    v54.i16[2] = _S16;
    *(float16x4_t *)&a4[1].var13 = v48;
    *(float16x4_t *)&a4[1].var15 = v50;
    *(float16x4_t *)&a4[1].var17 = v52;
    *(float16x4_t *)&a4[1].var19 = v54;
    *(simd_float4x4 *)&a4[1].var21 = v113;
    *(float32x4_t *)&a4[2].var17 = v107;
    *(float32x4_t *)&a4[2].var21 = v105;
    *(float32x4_t *)&a4[3].var5 = v103;
    *(float32x4_t *)&a4[3].var9 = v101;
    if (v9 == 4)
    {
      _Q0 = vaddq_f32(v90, (float32x4_t)xmmword_1B00245E0);
      _Q1 = vmulq_f32(_Q0, _Q0);
      _S2 = _Q0.i32[2];
      __asm { FMLA            S1, S2, V0.S[2] }
      _Q1.f32[0] = sqrtf(_Q1.f32[0]);
      v59 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
    }
    else
    {
      objc_msgSend(v108, "light", *(_OWORD *)&v90);
      v96 = v60;
      v62 = __sincosf_stret(v61);
      v63 = __sincosf_stret(v96);
      *(float32x2_t *)v59.f32 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v63.__sinval), LODWORD(v63.__cosval)), v62.__sinval);
      v59.i32[2] = LODWORD(v62.__cosval);
    }
    v59.i32[3] = 0;
    *(double *)&v64 = UMMul(*(float32x4_t *)&self->_anon_e4[156], *(float32x4_t *)&self->_anon_e4[172], *(float32x4_t *)&self->_anon_e4[188], *(float32x4_t *)&self->_anon_e4[204], v59);
    *(_OWORD *)&a4->var13 = v64;
    *(double *)&v65 = UMMul(v107, v105, v103, v101, (float32x4_t)xmmword_1B000C980);
    *((float *)&v65 + 3) = v99 * v99;
    *(_OWORD *)&a4->var9 = v65;
    if (v9 == 3)
    {
      if (a4->var15 < 0.0 && self->_supportsMTLGPUFamilyApple6)
        *(float32x2_t *)&a4[4].var23 = vmul_f32(vmul_n_f32((float32x2_t)0x42DA000046B73E00, v99), *(float32x2_t *)&a4[4].var20);
      v66 = v99 * 0.98;
      if (v19)
      {
        a4[5].var6 = v99 * v99;
        v67 = vcvt_f32_f64(vmulq_n_f64((float64x2_t)xmmword_1B00245F0, v99));
        *(float32x2_t *)&a4[5].var7 = vmul_f32(v67, v67);
        a4[5].var9 = v99 * 0.02;
      }
      v68 = v66 * 1.125;
      a4[5].var5 = v66 * v66;
      v69 = v66 * 0.95;
      a4[5].var11 = v68;
      a4[5].var12 = v69;
    }
    -[NUNIAegirTextureGroup albedos](self->_textureGroup, "albedos", *(_OWORD *)&v90);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "objectAtIndexedSubscript:", v9);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v71, "atlas");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "bind:slot:", v8, 1);

    -[NUNIAegirTextureGroup normals](self->_textureGroup, "normals");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "objectAtIndexedSubscript:", v9);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v74, "atlas");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "bind:slot:", v8, 2);

    -[NUNIAegirTextureGroup emissives](self->_textureGroup, "emissives");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "objectAtIndexedSubscript:", v9);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v77, "atlas");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "bind:slot:", v8, 3);

    if (v19)
    {
      -[NUNIAegirTextureGroup cloudsLo](self->_textureGroup, "cloudsLo");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "objectAtIndexedSubscript:", v9);
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v80, "atlas");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "bind:slot:", v8, 5);

      -[NUNIAegirTextureGroup cloudsMd](self->_textureGroup, "cloudsMd");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "objectAtIndexedSubscript:", v9);
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v83, "atlas");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "bind:slot:", v8, 6);

      -[NUNIAegirTextureGroup cloudsHi](self->_textureGroup, "cloudsHi");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "objectAtIndexedSubscript:", v9);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v77, "atlas");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "bind:slot:", v8, 7);

    }
    -[NUNIAegirTextureGroup gradients](self->_textureGroup, "gradients");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "objectAtIndexedSubscript:", v9);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v88, "atlas");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "bind:slot:", v8, 4);

    objc_msgSend(v8, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
  }

}

- (void)_renderLocationDot:(id)a3 uniPtr:(NUNIAegirRenderUniforms *)a4 viewport:(NUNIViewport)a5 renderEncoder:(id)a6
{
  id v10;
  void *v11;
  NUNIAegirRendererState *p_state;
  simd_float4 v13;
  simd_float4 v14;
  simd_float4 v15;
  simd_float4 v16;
  simd_float4 v17;
  simd_float4 v18;
  simd_float4 v19;
  simd_float4 v20;
  double v21;
  double v22;
  double v23;
  simd_float4 v24;
  simd_float4 v25;
  simd_float4 v26;
  simd_float4 v27;
  simd_float4 v28;
  simd_float4 v29;
  simd_float4 v30;
  simd_float4 v31;
  simd_float4 v32;
  simd_float4 v33;
  simd_float4 v34;
  simd_float4 v35;
  simd_float4 v36;
  simd_float4 v37;
  simd_float4 v38;
  simd_float4 v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  simd_float4 v45;
  float v46;
  simd_float4 v47;
  simd_float4 v48;
  simd_float4 v49;
  simd_float4 v50;
  simd_float4 v51;
  simd_float4 v52;
  simd_float4 v53;
  simd_float4 v54;
  simd_float4 v55;
  simd_float4 v56;
  simd_float4 v57;
  simd_float4 v58;
  simd_float4 v59;
  simd_float4 v60;
  simd_float4 v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  int32x4_t v66;
  int32x4_t v67;
  int32x4_t v68;
  float32x2_t v69;
  float32x2_t v70;
  float32x2_t v71;
  float32x2_t v72;
  int32x2_t v73;
  float32x2_t v74;
  float v75;
  void *v76;
  float v77;
  float v78;
  simd_float4 v79;
  simd_float4 v80;
  simd_float4 v81;
  simd_float4 v82;
  simd_float4 v83;
  simd_float4 v84;
  simd_float4 v85;
  simd_float4 v86;
  simd_float4 v87;
  simd_float4 v88;
  simd_float4 v89;
  simd_float4 v90;
  simd_float4 v91;
  simd_float4 v92;
  simd_float4 v93;
  simd_float4 v94;
  simd_float4 v95;
  simd_float4 v96;
  simd_float4 v97;
  simd_float4 v98;
  simd_float4x4 v99;
  simd_float4 v100;
  simd_float4 v101;
  simd_float4 v102;
  simd_float4 v103;
  simd_float4 v104;
  simd_float4 v105;
  simd_float4 v106;
  simd_float4 v107;
  float32x4_t v108;
  float32x4_t v109;
  float32x4_t v110;
  float32x4_t v111;
  simd_float4 v112;
  simd_float4 v113;
  simd_float4 v114;
  simd_float4 v115;
  simd_float4 v116;
  simd_float4 v117;
  simd_float4 v118;
  simd_float4 v119;
  simd_float4 v120;
  simd_float4 v121;
  simd_float4 v122;
  simd_float4 v123;
  simd_float4 v124;
  simd_float4 v125;
  simd_float4 v126;
  simd_float4 v127;
  simd_float4 v128;
  simd_float4 v129;
  simd_float4 v130;
  simd_float4 v131;
  int32x4_t v132;
  int32x4_t v133;
  simd_float4 v134;
  simd_float4 v135;
  simd_float4 v136;
  simd_float4 v137;
  simd_float4 v138;
  simd_float4 v139;
  simd_float4 v140;
  simd_float4 v141;
  simd_float4 v142;
  simd_float4 v143;
  simd_float4 v144;
  simd_float4 v145;
  float32x4_t v146;
  simd_float4 v147;
  simd_float4 v148;
  simd_float4 v149;
  simd_float4 v150;
  float32x4_t v151;
  simd_float4 v152;
  simd_float4 v153;
  simd_float4 v154;
  simd_float4 v155;
  float32x4_t v156;
  simd_float4 v157;
  simd_float4 v158;
  simd_float4 v159;
  simd_float4 v160;
  float32x4_t v161;
  id v162;
  simd_float4x4 v163;
  simd_float4x4 v164;
  simd_float4x4 v165;
  simd_float4x4 v166;
  simd_float4x4 v167;
  simd_float4x4 v168;
  simd_float4x4 v169;
  simd_float4x4 v170;
  simd_float4x4 v171;
  simd_float4x4 v172;
  simd_float4x4 v173;
  simd_float4x4 v174;
  simd_float4x4 v175;
  simd_float4x4 v176;
  simd_float4x4 v177;
  simd_float4x4 v178;
  simd_float4x4 v179;
  simd_float4x4 v180;
  simd_float4x4 v181;
  simd_float4x4 v182;
  simd_float4x4 v183;
  simd_float4x4 v184;
  simd_float4x4 v185;
  simd_float4x4 v186;

  v162 = a3;
  v10 = a6;
  -[NUNIAegirResourceManager renderOffscreenPipelineForLocationDot](self->_resourceManager, "renderOffscreenPipelineForLocationDot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    p_state = &self->_state;
    objc_msgSend(v10, "setLabel:", CFSTR("Ægir LocationDot"));
    objc_msgSend(v10, "setRenderPipelineState:", v11);
    UMFloat4x4MakeScale(0.11);
    v152 = v14;
    v157 = v13;
    v142 = v16;
    v147 = v15;
    *(double *)v163.columns[0].i64 = UMFloat4x4MakeTranslate();
    v126 = v163.columns[1];
    v127 = v163.columns[0];
    v124 = v163.columns[3];
    v125 = v163.columns[2];
    v175.columns[1] = v152;
    v175.columns[0] = v157;
    v175.columns[3] = v142;
    v175.columns[2] = v147;
    *(double *)v17.i64 = UMMul(v163, v175);
    v153 = v18;
    v158 = v17;
    v143 = v20;
    v148 = v19;
    objc_msgSend(v162, "homeCoordinate");
    v22 = v21;
    *(float *)&v23 = v23;
    *(double *)v24.i64 = UMFloat4x4MakeRotateX(*(float *)&v23 * -0.017453);
    v136 = v25;
    v137 = v24;
    v134 = v27;
    v135 = v26;
    v24.f32[0] = v22;
    *(double *)v28.i64 = UMFloat4x4MakeRotateZ(v24.f32[0] * 0.017453);
    v140 = v29;
    v141 = v28;
    v138 = v31;
    v139 = v30;
    v164.columns[1] = v136;
    v164.columns[0] = v137;
    v164.columns[3] = v134;
    v164.columns[2] = v135;
    v176.columns[1] = v153;
    v176.columns[0] = v158;
    v176.columns[3] = v143;
    v176.columns[2] = v148;
    *(double *)v32.i64 = UMMul(v164, v176);
    v177.columns[0] = v32;
    v177.columns[1] = v33;
    v177.columns[2] = v34;
    v177.columns[3] = v35;
    v165.columns[1] = v140;
    v165.columns[0] = v141;
    v165.columns[3] = v138;
    v165.columns[2] = v139;
    *(double *)v36.i64 = UMMul(v165, v177);
    v154 = v37;
    v159 = v36;
    v144 = v39;
    v149 = v38;
    objc_msgSend(v162, "equatorRotation");
    v41 = v40;
    objc_msgSend(v162, "radius");
    v43 = v42;
    objc_msgSend(v162, "radiusScale");
    UMFloat4x4MakeScale(v43 * v44);
    v122 = v166.columns[1];
    v123 = v166.columns[0];
    v120 = v166.columns[3];
    v121 = v166.columns[2];
    v178.columns[1] = v154;
    v178.columns[0] = v159;
    v178.columns[3] = v144;
    v178.columns[2] = v149;
    *(double *)v45.i64 = UMMul(v166, v178);
    v46 = fabsf(v41);
    v155 = v47;
    v160 = v45;
    v145 = v49;
    v150 = v48;
    if (v46 <= 0.00001)
    {
      UMFloat4x4MakeScale(1.0);
      v116 = v55;
      v118 = v54;
      v112 = v57;
      v114 = v56;
    }
    else
    {
      *(double *)v167.columns[0].i64 = UMFloat4x4MakeRotateZ(v41 + 1.5708);
      v116 = v167.columns[1];
      v118 = v167.columns[0];
      v112 = v167.columns[3];
      v114 = v167.columns[2];
      v179.columns[1] = v155;
      v179.columns[0] = v160;
      v179.columns[3] = v145;
      v179.columns[2] = v150;
      *(double *)v50.i64 = UMMul(v167, v179);
      v155 = v51;
      v160 = v50;
      v145 = v53;
      v150 = v52;
    }
    objc_msgSend(v162, "position", *(_OWORD *)&v112, *(_OWORD *)&v114, *(_OWORD *)&v116, *(_OWORD *)&v118);
    *(double *)v168.columns[0].i64 = UMFloat4x4MakeTranslate();
    v130 = v168.columns[1];
    v131 = v168.columns[0];
    v128 = v168.columns[3];
    v129 = v168.columns[2];
    v180.columns[1] = v155;
    v180.columns[0] = v160;
    v180.columns[3] = v145;
    v180.columns[2] = v150;
    *(double *)v58.i64 = UMMul(v168, v180);
    v181.columns[0] = v58;
    v181.columns[1] = v59;
    v181.columns[2] = v60;
    v181.columns[3] = v61;
    *(double *)v62.i64 = UMMul(*(simd_float4x4 *)&p_state[12].viewport.width, v181);
    v156 = v63;
    v161 = v62;
    v146 = v65;
    v151 = v64;
    *(double *)v66.i64 = UMMul(v62, v63, v64, v65, (float32x4_t)xmmword_1B00242A0);
    v133 = v66;
    *(double *)v67.i64 = UMMul(v161, v156, v151, v146, (float32x4_t)xmmword_1B0024610);
    v132 = v67;
    *(double *)v68.i64 = UMMul(v161, v156, v151, v146, (float32x4_t)xmmword_1B000C980);
    v69.f32[0] = (float)a5.width;
    v69.f32[1] = (float)a5.height;
    v70 = vmul_f32(v69, (float32x2_t)0x3F0000003F000000);
    v71 = vdiv_f32(vmul_f32(v70, *(float32x2_t *)v132.i8), (float32x2_t)vdup_laneq_s32(v132, 3));
    *(float32x2_t *)v68.i8 = vdiv_f32(vmul_f32(v70, *(float32x2_t *)v68.i8), (float32x2_t)vdup_laneq_s32(v68, 3));
    v72 = vsub_f32(vdiv_f32(vmul_f32(v70, *(float32x2_t *)v133.i8), (float32x2_t)vdup_laneq_s32(v133, 3)), *(float32x2_t *)v68.i8);
    v73 = (int32x2_t)vmul_f32(v72, v72);
    *(float32x2_t *)v68.i8 = vsub_f32(v71, *(float32x2_t *)v68.i8);
    *(float32x2_t *)v68.i8 = vmul_f32(*(float32x2_t *)v68.i8, *(float32x2_t *)v68.i8);
    v74 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v73, *(int32x2_t *)v68.i8), (float32x2_t)vzip2_s32(v73, *(int32x2_t *)v68.i8)));
    if (v74.f32[0] >= v74.f32[1])
      v74.f32[0] = v74.f32[1];
    v75 = v74.f32[0] * 0.23077;
    objc_msgSend(v162, "scene");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "locationDotMaximumRadius");
    v78 = v77;

    if (v75 <= v78)
    {
      v109 = v156;
      v108 = v161;
      v111 = v146;
      v110 = v151;
    }
    else
    {
      UMFloat4x4MakeScale((float)(v78 * 0.11) / v75);
      v182.columns[0] = v79;
      v182.columns[1] = v80;
      v182.columns[2] = v81;
      v182.columns[3] = v82;
      v169.columns[1] = v126;
      v169.columns[0] = v127;
      v169.columns[3] = v124;
      v169.columns[2] = v125;
      *(double *)v83.i64 = UMMul(v169, v182);
      v183.columns[0] = v83;
      v183.columns[1] = v84;
      v183.columns[2] = v85;
      v183.columns[3] = v86;
      v170.columns[1] = v136;
      v170.columns[0] = v137;
      v170.columns[3] = v134;
      v170.columns[2] = v135;
      *(double *)v87.i64 = UMMul(v170, v183);
      v184.columns[0] = v87;
      v184.columns[1] = v88;
      v184.columns[2] = v89;
      v184.columns[3] = v90;
      v171.columns[1] = v140;
      v171.columns[0] = v141;
      v171.columns[3] = v138;
      v171.columns[2] = v139;
      *(double *)v91.i64 = UMMul(v171, v184);
      v185.columns[0] = v91;
      v185.columns[1] = v92;
      v185.columns[2] = v93;
      v185.columns[3] = v94;
      v172.columns[1] = v122;
      v172.columns[0] = v123;
      v172.columns[3] = v120;
      v172.columns[2] = v121;
      *(double *)v95.i64 = UMMul(v172, v185);
      v99.columns[0] = v95;
      v99.columns[1] = v96;
      v99.columns[2] = v97;
      v99.columns[3] = v98;
      if (v46 > 0.00001)
      {
        v173.columns[1] = v117;
        v173.columns[0] = v119;
        v173.columns[3] = v113;
        v173.columns[2] = v115;
        *(double *)v100.i64 = UMMul(v173, v99);
        v99.columns[0] = v100;
        v99.columns[1] = v101;
        v99.columns[2] = v102;
        v99.columns[3] = v103;
      }
      v174.columns[1] = v130;
      v174.columns[0] = v131;
      v174.columns[3] = v128;
      v174.columns[2] = v129;
      *(double *)v104.i64 = UMMul(v174, v99);
      v186.columns[0] = v104;
      v186.columns[1] = v105;
      v186.columns[2] = v106;
      v186.columns[3] = v107;
      *(double *)v108.i64 = UMMul(*(simd_float4x4 *)&p_state[12].viewport.width, v186);
    }
    *(float32x4_t *)&a4[3].var13 = v108;
    *(float32x4_t *)&a4[3].var17 = v109;
    *(float32x4_t *)&a4[3].var21 = v110;
    *(float32x4_t *)&a4[4].var5 = v111;
    objc_msgSend(v10, "setCullMode:", 1);
    objc_msgSend(v10, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    objc_msgSend(v10, "setCullMode:", 0);
  }

}

- (void)_renderSpriteSpheroid:(id)a3 uniPtr:(NUNIAegirRenderUniforms *)a4 renderEncoder:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  NUNIAegirRendererState *p_state;
  float v12;
  float32x4_t v13;
  float32x4_t v15;
  int32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  int32x4_t v25;
  float32x4_t v26;
  float v27;
  float v28;
  float v29;
  float v30;
  simd_float4 v31;
  simd_float4 v32;
  simd_float4 v33;
  simd_float4 v34;
  simd_float4 v35;
  simd_float4 v36;
  simd_float4 v37;
  simd_float4 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  void *v44;
  void *v45;
  simd_float4 v46;
  simd_float4 v47;
  simd_float4 v48;
  simd_float4 v49;
  id v50;
  simd_float4x4 v51;
  simd_float4x4 v52;
  simd_float4x4 v53;

  v50 = a3;
  v8 = a5;
  v9 = objc_msgSend(v50, "type");
  -[NUNIAegirResourceManager renderOffscreenPipelineForSpheroid:config:](self->_resourceManager, "renderOffscreenPipelineForSpheroid:config:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    p_state = &self->_state;
    objc_msgSend(v8, "setLabel:", CFSTR("Ægir SpriteSpheroid"));
    objc_msgSend(v8, "setRenderPipelineState:", v10);
    *(_OWORD *)&a4->var5 = s_sprites[objc_msgSend(v50, "spriteType")];
    objc_msgSend(v50, "opacity");
    a4[4].var15 = v12;
    objc_msgSend(v50, "position");
    _Q3 = vsubq_f32(*(float32x4_t *)&self->_anon_e4[12], v13);
    v15 = v13;
    _Q1 = vmulq_f32(_Q3, _Q3);
    _S2 = _Q3.i32[2];
    __asm { FMLA            S1, S2, V3.S[2] }
    _Q1.f32[0] = sqrtf(_Q1.f32[0]);
    v22 = (int32x4_t)vdivq_f32(_Q3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
    v23 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v22, v22), (int8x16_t)v22, 0xCuLL);
    v24 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v22, (int8x16_t)v22, 0xCuLL), (int8x16_t)v22, 8uLL);
    v25 = (int32x4_t)vmlaq_f32(vmulq_f32(v24, vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(*(int32x4_t *)&p_state[3].viewport.height, *(int32x4_t *)&p_state[3].viewport.height), *(int8x16_t *)&p_state[3].viewport.height, 0xCuLL))), v23, (float32x4_t)vextq_s8(vextq_s8(*(int8x16_t *)&p_state[3].viewport.height, *(int8x16_t *)&p_state[3].viewport.height, 0xCuLL), *(int8x16_t *)&p_state[3].viewport.height, 8uLL));
    v26 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v25, (int8x16_t)v25, 0xCuLL), (int8x16_t)v25, 8uLL), vnegq_f32(v23)), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v25, v25), (int8x16_t)v25, 0xCuLL), v24);
    v25.i32[3] = 0;
    v26.i32[3] = 0;
    v48 = (simd_float4)v26;
    v49 = (simd_float4)v25;
    v22.i32[3] = 0;
    v15.i32[3] = 1.0;
    v46 = (simd_float4)v15;
    v47 = (simd_float4)v22;
    objc_msgSend(v50, "radius");
    v28 = v27;
    objc_msgSend(v50, "radiusScale");
    v30 = v28 * v29;
    if (v9 == 14)
      v30 = v30 + v30;
    UMFloat4x4MakeScale(v30);
    v52.columns[0] = v31;
    v52.columns[1] = v32;
    v52.columns[2] = v33;
    v52.columns[3] = v34;
    v51.columns[1] = v48;
    v51.columns[0] = v49;
    v51.columns[3] = v46;
    v51.columns[2] = v47;
    *(double *)v35.i64 = UMMul(v51, v52);
    v53.columns[0] = v35;
    v53.columns[1] = v36;
    v53.columns[2] = v37;
    v53.columns[3] = v38;
    *(double *)&v39 = UMMul(*(simd_float4x4 *)&self->_anon_e4[220], v53);
    *(_OWORD *)&a4[3].var13 = v39;
    *(_OWORD *)&a4[3].var17 = v40;
    *(_OWORD *)&a4[3].var21 = v41;
    *(_OWORD *)&a4[4].var5 = v42;
    -[NUNIAegirTextureGroup gradients](self->_textureGroup, "gradients");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectAtIndexedSubscript:", v9);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v44, "atlas");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "bind:slot:", v8, 4);

    objc_msgSend(v8, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
  }

}

- (void)_renderOffscreenSceneWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 frameBufferIndex:(unint64_t)a6 drawableTexture:(id)a7
{
  uint64_t height;
  id v13;
  id v14;
  id *v15;
  NUNAegirOffscreen *v16;
  NUNAegirOffscreen *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  IOSurface *v25;
  IOSurface *v26;
  MTLDevice *device;
  IOSurface *v28;
  MTLTexture *v29;
  MTLTexture *v30;
  MTLTexture *v31;
  NUNAegirOffscreen *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  float v42;
  float v43;
  int v44;
  float32x4_t v46;
  int *v52;
  void *v53;
  int *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  int v58;
  void *v59;
  id v60;
  void *v61;
  float v62;
  float v63;
  float v64;
  float v65;
  void *v66;
  id v67;
  uint64_t v68;
  float v69;
  int v70;
  uint64_t j;
  NUNAegirOffscreen *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  NUNIViewport v76;
  void *v77;
  float32x4_t v78;
  id v79;
  unint64_t v80;
  _QWORD v81[4];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE __base[4];
  int v89;
  _OWORD v90[12];
  _QWORD v91[4];
  _QWORD v92[6];

  v92[4] = *MEMORY[0x1E0C80C00];
  height = a4.height;
  v79 = a3;
  v13 = a5;
  v14 = a7;
  v80 = a6;
  v15 = (id *)&self->_offscreenScenes[a6];
  v16 = (NUNAegirOffscreen *)*v15;
  v17 = v16;
  v74 = v14;
  v75 = v13;
  v76 = a4;
  v73 = height;
  if (!v16
    || -[NUNAegirOffscreen width](v16, "width") != a4.width
    || -[NUNAegirOffscreen height](v17, "height") != (_DWORD)height)
  {
    +[CLKUIMetalResourceManager sharedNilTexture2D](CLKUIMetalResourceManager, "sharedNilTexture2D");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "setTextureType:", 2);
    objc_msgSend(v18, "setWidth:", a4.width);
    objc_msgSend(v18, "setHeight:", *(uint64_t *)&a4 >> 32);
    objc_msgSend(v18, "setDepth:", 1);
    objc_msgSend(v18, "setPixelFormat:", 10);
    objc_msgSend(v18, "setUsage:", 5);
    +[MetalDeviceInfo sharedInfo](MetalDeviceInfo, "sharedInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setResourceOptions:", objc_msgSend(v19, "defaultResourceOptionForDevice:", self->_device));

    v91[0] = *MEMORY[0x1E0CBBDD0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = v20;
    v91[1] = *MEMORY[0x1E0CBBD88];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", height);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0CBBD90];
    v92[1] = v21;
    v92[2] = &unk_1E60A3090;
    v23 = *MEMORY[0x1E0CBBD70];
    v91[2] = v22;
    v91[3] = v23;
    v92[3] = &unk_1E60A30A8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (IOSurface *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBBEA0]), "initWithProperties:", v24);
    v26 = self->_contentMaskSurfaces[v80];
    self->_contentMaskSurfaces[v80] = v25;

    device = self->_device;
    v28 = v25;
    v29 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](device, "newTextureWithDescriptor:iosurface:plane:", v18, v28, 0);
    v30 = self->_contentMaskTextures[v80];
    self->_contentMaskTextures[v80] = v29;

    v31 = v29;
    v32 = -[NUNAegirOffscreen initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:]([NUNAegirOffscreen alloc], "initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:", self->_device, a4, v73, v77, v31, 2, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0);

    objc_storeStrong(v15, v32);
    v13 = v75;

    v14 = v74;
    v17 = v32;
  }
  -[NUNAegirOffscreen setTexture0:](v17, "setTexture0:", v14);
  v72 = v17;
  -[NUNAegirOffscreen renderPassDescriptor](v17, "renderPassDescriptor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "renderCommandEncoderWithDescriptor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  memset(v90, 0, sizeof(v90));
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  objc_msgSend(v79, "spheroids");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
  if (v36)
  {
    v37 = v36;
    v38 = 0;
    v39 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v84 != v39)
          objc_enumerationMutation(v35);
        v41 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        objc_msgSend(v41, "radiusScale");
        if (v42 > 0.00001)
        {
          objc_msgSend(v41, "opacity");
          if (v43 > 0.00001)
          {
            if (objc_msgSend(v41, "isVisible"))
            {
              v44 = objc_msgSend(v41, "type");
              if (v44 == 10)
              {
                _S0 = 1258291200;
              }
              else if (v44 == 13)
              {
                _S0 = 1258291194;
              }
              else
              {
                _S0 = 1258291196;
                if (((1 << v44) & 0xFFC000) == 0)
                {
                  _S0 = 1258291198;
                  if (v44 != 12)
                  {
                    v78 = *(float32x4_t *)&self->_anon_e4[12];
                    objc_msgSend(v41, "position");
                    _S2 = vsubq_f32(v78, v46).i32[2];
                    __asm { FMLA            S0, S2, V1.S[2] }
                  }
                }
              }
              v52 = (int *)&__base[8 * v38];
              *v52 = _S0;
              v52[1] = v38;
              objc_storeStrong((id *)v90 + v38++, v41);
            }
          }
        }
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
    }
    while (v37);
  }
  else
  {
    v38 = 0;
  }

  qsort(__base, v38, 8uLL, (int (__cdecl *)(const void *, const void *))_NUNIAegirRenderCompareObject);
  objc_msgSend(v34, "setLabel:", CFSTR("Ægir Offscreen Scene"));
  v81[0] = 0;
  v81[1] = 0;
  *(double *)&v81[2] = (double)a4.width;
  *(double *)&v81[3] = (double)(int)v73;
  v82 = xmmword_1B0024620;
  objc_msgSend(v34, "setViewport:", v81);
  objc_msgSend(v34, "setCullMode:", 0);
  -[NUNIAegirRenderer _renderOffscreenBackgroundWithRenderEncoder:frameBufferIndex:](self, "_renderOffscreenBackgroundWithRenderEncoder:frameBufferIndex:", v34, v80);
  -[NUNIAegirResourceManager rectVerticesBuffer](self->_resourceManager, "rectVerticesBuffer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setVertexBuffer:offset:atIndex:", v53, 0, 0);

  if (v38 >= 1)
  {
    v54 = &v89;
    v55 = v38;
    do
    {
      v56 = *v54;
      v54 += 2;
      v57 = *((id *)v90 + v56);
      v58 = 1 << objc_msgSend(v57, "type");
      -[NUNIAegirRenderer getOrCreateUniformBufferforFrameBufferIndex:](self, "getOrCreateUniformBufferforFrameBufferIndex:", v80);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setVertexBuffer:offset:atIndex:", v59, 0, 1);
      objc_msgSend(v34, "setFragmentBuffer:offset:atIndex:", v59, 0, 0);
      v60 = objc_retainAutorelease(v59);
      v61 = (void *)objc_msgSend(v60, "contents");
      memcpy(v61, &self->_baseUniforms, 0x1B0uLL);
      if ((*(_QWORD *)&v58 & 0xFBF400) != 0)
      {
        -[NUNIAegirRenderer _renderSpriteSpheroid:uniPtr:renderEncoder:](self, "_renderSpriteSpheroid:uniPtr:renderEncoder:", v57, v61, v34);
      }
      else if ((v58 & 0x3FE) != 0)
      {
        -[NUNIAegirRenderer _renderRaytraceSpheroid:uniPtr:renderEncoder:](self, "_renderRaytraceSpheroid:uniPtr:renderEncoder:", v57, v61, v34);
      }

      if ((v58 & 8) != 0)
      {
        objc_msgSend(v79, "locationDotAlpha");
        if (v62 > 0.00001)
        {
          v63 = v62;
          objc_msgSend(v79, "locationDotPulse");
          v65 = v64;
          -[NUNIAegirRenderer getOrCreateUniformBufferforFrameBufferIndex:](self, "getOrCreateUniformBufferforFrameBufferIndex:", v80);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setVertexBuffer:offset:atIndex:", v66, 0, 1);
          objc_msgSend(v34, "setFragmentBuffer:offset:atIndex:", v66, 0, 0);
          v67 = objc_retainAutorelease(v66);
          v68 = objc_msgSend(v67, "contents");
          memcpy((void *)v68, &self->_baseUniforms, 0x1B0uLL);
          objc_msgSend(v57, "opacity");
          *(float *)(v68 + 360) = v63 * v69;
          *(float *)(v68 + 364) = v65 - floorf(v65);
          objc_msgSend(v79, "locationDotPulseOverrideAlpha");
          *(_DWORD *)(v68 + 368) = v70;
          -[NUNIAegirRenderer _renderLocationDot:uniPtr:viewport:renderEncoder:](self, "_renderLocationDot:uniPtr:viewport:renderEncoder:", v57, v68, v76, v34);

        }
      }

      --v55;
    }
    while (v55);
  }
  objc_msgSend(v34, "endEncoding");
  for (j = 184; j != -8; j -= 8)

}

- (void)_renderOffscreenBloomWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 frameBufferIndex:(unint64_t)a6
{
  NUNAegirOffscreen *v10;
  NUNAegirOffscreen *v11;
  id v12;
  id v13;
  int v14;
  uint64_t v15;
  NUNAegirOffscreen *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  __int128 v25;

  v10 = self->_offscreenScenes[a6];
  v11 = self->_offscreenBlooms;
  v12 = a5;
  -[NUNIAegirRenderer getOrCreateUniformBufferforFrameBufferIndex:](self, "getOrCreateUniformBufferforFrameBufferIndex:", a6);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  memcpy((void *)objc_msgSend(v13, "contents"), &self->_baseUniforms, 0x1B0uLL);
  v14 = a4.width >> 1;
  v15 = *(uint64_t *)&a4 >> 33;
  if (!v11
    || -[NUNAegirOffscreen width](v11, "width") != v14
    || -[NUNAegirOffscreen height](v11, "height") != (_DWORD)v15)
  {
    v16 = -[NUNAegirOffscreen initWithDevice:width:height:pixelFormat0:pixelFormat1:mipmaps:loadAction:clearColor0:clearColor1:]([NUNAegirOffscreen alloc], "initWithDevice:width:height:pixelFormat0:pixelFormat1:mipmaps:loadAction:clearColor0:clearColor1:", self->_device, (a4.width >> 1), *(uint64_t *)&a4 >> 33, 10, 0, 3, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0, 2);

    objc_storeStrong((id *)&self->_offscreenBlooms, v16);
    v11 = v16;
  }
  -[NUNAegirOffscreen renderPassDescriptor](v11, "renderPassDescriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "renderCommandEncoderWithDescriptor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUNIAegirResourceManager renderOffscreenPipelineForThreshold](self->_resourceManager, "renderOffscreenPipelineForThreshold");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLabel:", CFSTR("Ægir Threshold"));
  v24[0] = 0;
  v24[1] = 0;
  *(double *)&v24[2] = (double)v14;
  *(double *)&v24[3] = (double)(int)v15;
  v25 = xmmword_1B0024620;
  objc_msgSend(v18, "setViewport:", v24);
  objc_msgSend(v18, "setCullMode:", 0);
  objc_msgSend(v18, "setRenderPipelineState:", v19);
  -[NUNIAegirResourceManager rectVerticesBuffer](self->_resourceManager, "rectVerticesBuffer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setVertexBuffer:offset:atIndex:", v20, 0, 0);

  objc_msgSend(v18, "setVertexBuffer:offset:atIndex:", v13, 0, 1);
  objc_msgSend(v18, "setFragmentBuffer:offset:atIndex:", v13, 0, 0);
  -[NUNAegirOffscreen texture0](v10, "texture0");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFragmentTexture:atIndex:", v21, 1);

  objc_msgSend(v18, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
  objc_msgSend(v18, "endEncoding");
  objc_msgSend(v12, "blitCommandEncoder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUNAegirOffscreen texture0](v11, "texture0");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "generateMipmapsForTexture:", v23);

  objc_msgSend(v22, "endEncoding");
}

- (void)_renderOffscreenPostWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 frameBufferIndex:(unint64_t)a6
{
  NUNIViewport v8;
  uint64_t height;
  NUNAegirOffscreen *v11;
  NUNAegirOffscreen *v12;
  NUNAegirOffscreen *v13;
  id v14;
  id v15;
  void *v16;
  NUNIViewport v17;
  NUNAegirOffscreen *v18;
  NUNAegirOffscreen *v19;
  MTLDevice *device;
  NUNAegirOffscreen *v21;
  void *v22;
  NUNAegirOffscreen *v23;
  NUNAegirOffscreen *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NUNAegirOffscreen *v31;
  id v32;
  _QWORD v33[4];
  __int128 v34;

  v8 = a4;
  height = a4.height;
  v11 = self->_offscreenScenes[a6];
  v12 = self->_offscreenBlooms;
  v13 = self->_offscreenPosts;
  v14 = a5;
  -[NUNIAegirRenderer getOrCreateUniformBufferforFrameBufferIndex:](self, "getOrCreateUniformBufferforFrameBufferIndex:", a6);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  memcpy((void *)objc_msgSend(v15, "contents"), &self->_baseUniforms, 0x1B0uLL);
  if (!v13
    || -[NUNAegirOffscreen width](v13, "width") != v8.width
    || -[NUNAegirOffscreen height](v13, "height") != (_DWORD)height)
  {
    +[CLKUIMetalResourceManager sharedNilTexture2D](CLKUIMetalResourceManager, "sharedNilTexture2D");
    v31 = v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v8;
    v8 = (NUNIViewport)v15;
    v18 = v12;
    v19 = [NUNAegirOffscreen alloc];
    device = self->_device;
    -[NUNAegirOffscreen texture1](v11, "texture1");
    v32 = v14;
    v21 = v11;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v19;
    v12 = v18;
    v15 = (id)v8;
    v8.width = v17.width;
    v24 = -[NUNAegirOffscreen initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:](v23, "initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:", device, v17, height, v16, v22, 1, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0);

    objc_storeStrong((id *)&self->_offscreenPosts, v24);
    v11 = v21;
    v14 = v32;

    v13 = v24;
  }
  -[NUNAegirOffscreen texture0](v11, "texture0");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUNAegirOffscreen setTexture0:](v13, "setTexture0:", v25);

  -[NUNAegirOffscreen renderPassDescriptor](v13, "renderPassDescriptor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "renderCommandEncoderWithDescriptor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUNIAegirResourceManager renderOffscreenPipelineForPost](self->_resourceManager, "renderOffscreenPipelineForPost");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLabel:", CFSTR("Ægir Post"));
  objc_msgSend(v27, "setRenderPipelineState:", v28);
  v33[0] = 0;
  v33[1] = 0;
  *(double *)&v33[2] = (double)v8.width;
  *(double *)&v33[3] = (double)(int)height;
  v34 = xmmword_1B0024620;
  objc_msgSend(v27, "setViewport:", v33);
  objc_msgSend(v27, "setCullMode:", 0);
  -[NUNIAegirResourceManager rectVerticesBuffer](self->_resourceManager, "rectVerticesBuffer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setVertexBuffer:offset:atIndex:", v29, 0, 0);

  objc_msgSend(v27, "setVertexBuffer:offset:atIndex:", v15, 0, 1);
  objc_msgSend(v27, "setFragmentBuffer:offset:atIndex:", v15, 0, 0);
  -[NUNAegirOffscreen texture0](v12, "texture0");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFragmentTexture:atIndex:", v30, 1);

  objc_msgSend(v27, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
  objc_msgSend(v27, "endEncoding");

}

- (void)renderOffscreenWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5
{
  -[NUNIAegirRenderer _updateStateWithScene:viewport:](self, "_updateStateWithScene:viewport:", a3, a4, a5);
  -[NUNIAegirRenderer _updateBaseUniformsForViewport:](self, "_updateBaseUniformsForViewport:", a4);
}

- (void)renderWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 passDescriptor:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;

  v10 = a5;
  v11 = a3;
  objc_msgSend(a6, "colorAttachments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "texture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = self->_frame % 3;
  self->_renderUniformBuffersCounts[v14] = 0;
  -[NUNIAegirRenderer _renderOffscreenSceneWithScene:viewport:commandBuffer:frameBufferIndex:drawableTexture:](self, "_renderOffscreenSceneWithScene:viewport:commandBuffer:frameBufferIndex:drawableTexture:", v11, a4, v10, v14, v13);
  -[NUNIAegirRenderer _renderOffscreenBloomWithScene:viewport:commandBuffer:frameBufferIndex:](self, "_renderOffscreenBloomWithScene:viewport:commandBuffer:frameBufferIndex:", v11, a4, v10, v14);
  -[NUNIAegirRenderer _renderOffscreenPostWithScene:viewport:commandBuffer:frameBufferIndex:](self, "_renderOffscreenPostWithScene:viewport:commandBuffer:frameBufferIndex:", v11, a4, v10, v14);

  -[CALayer setContents:](self->_contentMaskLayer, "setContents:", self->_contentMaskSurfaces[v14]);
  ++self->_frame;

}

- (NUNIAegirResourceManager)resourceManager
{
  return self->_resourceManager;
}

- (NUNIRendererOptions)rendererOptions
{
  return self->_rendererOptions;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;

  objc_storeStrong((id *)&self->_rendererOptions, 0);
  objc_storeStrong((id *)&self->_contentMaskLayer, 0);
  for (i = 2; i != -1; --i)
    objc_storeStrong((id *)&self->_contentMaskSurfaces[i], 0);
  for (j = 2; j != -1; --j)
    objc_storeStrong((id *)&self->_contentMaskTextures[j], 0);
  objc_storeStrong((id *)&self->_offscreenPosts, 0);
  objc_storeStrong((id *)&self->_offscreenBlooms, 0);
  for (k = 2; k != -1; --k)
    objc_storeStrong((id *)&self->_offscreenScenes[k], 0);
  for (m = 2; m != -1; --m)
    objc_storeStrong((id *)&self->_renderUniformsBuffers[m], 0);
  objc_storeStrong((id *)&self->_textureGroup, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
