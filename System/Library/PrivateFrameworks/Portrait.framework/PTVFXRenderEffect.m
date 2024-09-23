@implementation PTVFXRenderEffect

- (id)activeReactions
{
  return self->_activeReactions;
}

void __44__PTVFXRenderEffect_initVFX_asyncInitQueue___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  unint64_t v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  kdebug_trace();
  v2 = (void *)objc_opt_new();
  v4 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v5 = 0;
    do
    {
      if (v5 == 2)
      {
        objc_msgSend(v2, "lastObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v6);
      }
      else
      {
        gotLoadHelper_x8__OBJC_CLASS___VFXSceneLoadOptions(v3);
        v6 = (void *)objc_opt_new();
        objc_msgSend(*(id *)(a1 + 40), "setupCommonVFXSceneLoadOptions:metalLibraryURL:", v6, *(_QWORD *)(a1 + 48));
        objc_msgSend(v6, "setSetupAsTemplate:", 1);
        gotLoadHelper_x8__OBJC_CLASS____TtC3VFX8VFXScene(v7);
        v9 = (void *)objc_msgSend(objc_alloc(*(Class *)(v8 + 976)), "initWithOptions:", v6);
        v10 = *(void **)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "pathForResource:ofType:", v11, CFSTR("vfx"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v4;
        v14 = (id)objc_msgSend(v9, "addEffectFrom:error:", v13, &v18);
        v15 = v18;

        objc_msgSend(v9, "prepare");
        objc_msgSend(v2, "addObject:", v9);

        v4 = v15;
      }

      ++v5;
    }
    while (v5 < objc_msgSend(*(id *)(a1 + 32), "count"));
  }
  v16 = *(void **)(a1 + 40);
  v17 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v16, "setReactionTemplates:", v17);

  kdebug_trace();
}

- (void)setupCommonVFXSceneLoadOptions:(id)a3 metalLibraryURL:(id)a4
{
  id v6;
  PTMetalContext *metalContext;
  id v8;
  void *v9;
  void *v10;
  SEL v11;
  void *v12;
  void *v13;
  char v14;

  v6 = a3;
  metalContext = self->_metalContext;
  v8 = a4;
  -[PTMetalContext device](metalContext, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDevice:", v9);

  -[PTMetalContext commandQueue](self->_metalContext, "commandQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCommandQueue:", v10);

  objc_msgSend(v6, "setMetalLibraryURL:", v8);
  objc_msgSend(v6, "setAutomaticallyPrepareScene:", 0);
  objc_msgSend(v6, "setColorPixelFormat:", self->rgbaOutputPixelFormat);
  objc_msgSend(v6, "setDepthPixelFormat:", self->depthOutputPixelFormat);
  objc_msgSend(v6, "setInternalPixelFormatDepth:", 0);
  objc_msgSend(v6, "setEnableDeferredRendering:", 0);
  v11 = NSSelectorFromString(CFSTR("setDoNotClearRenderOutput:"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "methodSignatureForSelector:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSelector:", v11);
    objc_msgSend(v13, "setTarget:", v6);
    v14 = 1;
    objc_msgSend(v13, "setArgument:atIndex:", &v14, 2);
    objc_msgSend(v13, "invoke");

  }
}

- (int)initVFX:(BOOL)a3 asyncInitQueue:(id)a4
{
  void *v6;
  double v7;
  uint64_t v8;
  id v9;
  void *v10;
  VFXRenderer *v11;
  VFXRenderer *vfxRenderer;
  uint64_t v13;
  double v14;
  void *v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _TtC3VFX9VFXEffect *v21;
  id v22;
  _TtC3VFX9VFXEffect *lighting;
  _TtC3VFX9VFXEffect **p_lighting;
  NSObject *v25;
  _TtC3VFX9VFXEffect *v26;
  int v27;
  _TtP3VFX10VFXBinding_ *v28;
  _TtP3VFX10VFXBinding_ *lightBinding;
  void *v30;
  NSMutableDictionary *v31;
  NSMutableDictionary *effectBindings;
  void *v33;
  _TtC3VFX9VFXCamera *v34;
  _TtC3VFX9VFXCamera *camera;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  float32x2_t v39;
  float v40;
  float v41;
  float v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v51;
  void *v52;
  NSObject *queue;
  _QWORD block[4];
  id v55;
  PTVFXRenderEffect *v56;
  id v57;
  id v58;
  id v59;

  queue = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  gotLoadHelper_x8__OBJC_CLASS___VFXRenderer(v7);
  v9 = objc_alloc(*(Class *)(v8 + 936));
  -[PTMetalContext commandQueue](self->_metalContext, "commandQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (VFXRenderer *)objc_msgSend(v9, "initWithCommandQueue:", v10);
  vfxRenderer = self->_vfxRenderer;
  self->_vfxRenderer = v11;

  objc_msgSend(v6, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
  v13 = objc_claimAutoreleasedReturnValue();
  gotLoadHelper_x8__OBJC_CLASS___VFXSceneLoadOptions(v14);
  v15 = (void *)objc_opt_new();
  v52 = (void *)v13;
  -[PTVFXRenderEffect setupCommonVFXSceneLoadOptions:metalLibraryURL:](self, "setupCommonVFXSceneLoadOptions:metalLibraryURL:", v15, v13);
  gotLoadHelper_x8__OBJC_CLASS____TtC3VFX8VFXScene(v16);
  v51 = (void *)objc_msgSend(objc_alloc(*(Class *)(v17 + 976)), "initWithOptions:", v15);
  -[VFXRenderer setScene:](self->_vfxRenderer, "setScene:");
  objc_msgSend(v6, "pathForResource:ofType:", CFSTR("lighting"), CFSTR("vfx"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VFXRenderer scene](self->_vfxRenderer, "scene");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  objc_msgSend(v19, "addEffectFrom:error:", v20, &v59);
  v21 = (_TtC3VFX9VFXEffect *)objc_claimAutoreleasedReturnValue();
  v22 = v59;
  p_lighting = &self->_lighting;
  lighting = self->_lighting;
  self->_lighting = v21;

  if (v22 || (v26 = *p_lighting) == 0)
  {
    _PTLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[PTVFXRenderEffect initVFX:asyncInitQueue:].cold.3((uint64_t)v18, (uint64_t)v22, v25);

    v26 = *p_lighting;
    v27 = -1;
  }
  else
  {
    v27 = 0;
  }
  -[_TtC3VFX9VFXEffect bindingOf:named:](v26, "bindingOf:named:", CFSTR("Skybox"), CFSTR("intensity"));
  v28 = (_TtP3VFX10VFXBinding_ *)objc_claimAutoreleasedReturnValue();
  lightBinding = self->_lightBinding;
  self->_lightBinding = v28;

  -[VFXRenderer scene](self->_vfxRenderer, "scene");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "prepare");

  if (!a3)
  {
    -[PTVFXRenderEffect setReactionTemplates:](self, "setReactionTemplates:", MEMORY[0x1E0C9AA60]);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PTVFXRenderEffect_initVFX_asyncInitQueue___block_invoke;
    block[3] = &unk_1E822A0D8;
    v55 = &unk_1E8252DF0;
    v56 = self;
    v57 = v52;
    v58 = v6;
    dispatch_async(queue, block);

  }
  v31 = (NSMutableDictionary *)objc_opt_new();
  effectBindings = self->_effectBindings;
  self->_effectBindings = v31;

  -[_TtC3VFX9VFXEffect cameras](self->_lighting, "cameras");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "firstObject");
  v34 = (_TtC3VFX9VFXCamera *)objc_claimAutoreleasedReturnValue();
  camera = self->_camera;
  self->_camera = v34;

  -[_TtC3VFX9VFXEffect cameras](self->_lighting, "cameras");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "count");

  if (v37 != 1)
  {
    _PTLogSystem();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[PTVFXRenderEffect initVFX:asyncInitQueue:].cold.2((id *)&self->_lighting, v38);

    v27 = -2;
  }
  self->_cameraRotationDegrees = -1;
  v39 = *(float32x2_t *)self->depthNearFar;
  v40 = vmuls_lane_f32(v39.f32[0], v39, 1);
  v41 = -(float)(v40 + (float)(v39.f32[1] * -0.5));
  v42 = vmlas_n_f32(v40, -0.5, v39.f32[0]);
  if (!self->reverseZ)
    v42 = v41;
  self->_emitZValue = v42 / (float)((float)(v39.f32[0] - v39.f32[1]) * -0.5);
  if (v22)
  {
    _PTLogSystem();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      -[PTVFXRenderEffect initVFX:asyncInitQueue:].cold.1((uint64_t)v22, v43, v44, v45, v46, v47, v48, v49);

    v27 = -1;
  }

  return v27;
}

- (void)setReactionTemplates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (unint64_t)rgbaOutputPixelFormat
{
  return self->rgbaOutputPixelFormat;
}

- (NSArray)reactionTemplates
{
  return (NSArray *)objc_getProperty(self, a2, 368, 1);
}

- (BOOL)emitNewReaction
{
  return self->_emitNewReaction;
}

- (unint64_t)depthOutputPixelFormat
{
  return self->depthOutputPixelFormat;
}

- (PTVFXRenderEffect)initWithMetalContext:(id)a3 colorSize:(id *)a4 colorConversion:(id)a5 prewarmOnly:(BOOL)a6 humanDetections:(id)a7 asyncInitQueue:(id)a8
{
  id v15;
  id v16;
  id v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  PTVFXSoftAlphaMask *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  PTEffectReactionBackgroundDimming *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  char *v30;
  uint64_t v31;
  void *v32;
  int v33;
  PTVFXRenderEffect *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  id v53;
  __int128 v54;
  unint64_t var2;
  objc_super v56;

  v15 = a3;
  v16 = a5;
  v53 = a7;
  v17 = a8;
  v56.receiver = self;
  v56.super_class = (Class)PTVFXRenderEffect;
  v18 = -[PTVFXRenderEffect init](&v56, sel_init);
  if (v18)
  {
    kdebug_trace();
    objc_storeStrong((id *)v18 + 1, a3);
    objc_storeStrong((id *)v18 + 2, a5);
    v19 = *(_OWORD *)&a4->var0;
    *((_QWORD *)v18 + 13) = a4->var2;
    *(_OWORD *)(v18 + 88) = v19;
    v20 = *(_OWORD *)&a4->var0;
    *((_QWORD *)v18 + 16) = a4->var2;
    *((_OWORD *)v18 + 7) = v20;
    *((_QWORD *)v18 + 43) = 81;
    *((_QWORD *)v18 + 44) = 260;
    v18[76] = 0;
    v21 = [PTVFXSoftAlphaMask alloc];
    v22 = *((_QWORD *)v18 + 1);
    v54 = *(_OWORD *)&a4->var0;
    var2 = a4->var2;
    v23 = -[PTVFXSoftAlphaMask initWithMetalContext:colorSize:](v21, "initWithMetalContext:colorSize:", v22, &v54);
    v24 = (void *)*((_QWORD *)v18 + 7);
    *((_QWORD *)v18 + 7) = v23;

    *((_QWORD *)v18 + 20) = +[PTEffectUtil aspectRatio:](PTEffectUtil, "aspectRatio:", (double)a4->var0, (double)a4->var1);
    objc_storeStrong((id *)v18 + 4, a7);
    *((_QWORD *)v18 + 45) = 0x461C40003DCCCCCDLL;
    v18[336] = 1;
    v18[244] = 0;
    v25 = -[PTEffectReactionBackgroundDimming initWithMetalContext:]([PTEffectReactionBackgroundDimming alloc], "initWithMetalContext:", v15);
    v26 = (void *)*((_QWORD *)v18 + 3);
    *((_QWORD *)v18 + 3) = v25;

    if (*((_QWORD *)v18 + 3))
    {
      v27 = objc_opt_new();
      v28 = (void *)*((_QWORD *)v18 + 32);
      *((_QWORD *)v18 + 32) = v27;

      v29 = objc_opt_new();
      LODWORD(v54) = 0;
      v30 = v18 + 264;
      do
      {
        -[NSObject reset](v29, "reset");
        -[NSObject setConstantValue:type:withName:](v29, "setConstantValue:type:withName:", &v54, 29, CFSTR("kColorTransferFunction"));
        objc_msgSend(v15, "computePipelineStateFor:withConstants:", CFSTR("convertRGBAlpha"), v29);
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = *(void **)&v30[8 * (int)v54];
        *(_QWORD *)&v30[8 * (int)v54] = v31;

        v33 = v54;
        if (!*(_QWORD *)&v30[8 * (int)v54])
        {
          _PTLogSystem();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            -[PTVFXRenderEffect initWithMetalContext:colorSize:colorConversion:prewarmOnly:humanDetections:asyncInitQueue:].cold.2(v43, v44, v45, v46, v47, v48, v49, v50);

          goto LABEL_15;
        }
        LODWORD(v54) = v54 + 1;
      }
      while (v33 <= 7);
      if (a6)
      {
        kdebug_trace();
      }
      else
      {
        v51 = objc_msgSend(v18, "initVFX:asyncInitQueue:", 0, v17);
        kdebug_trace();
        if (v51)
          goto LABEL_15;
      }
      v34 = v18;
    }
    else
    {
      _PTLogSystem();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[PTVFXRenderEffect initWithMetalContext:colorSize:colorConversion:prewarmOnly:humanDetections:asyncInitQueue:].cold.1(v29, v36, v37, v38, v39, v40, v41, v42);
LABEL_15:
      v34 = 0;
    }
    v35 = v53;

  }
  else
  {
    v34 = 0;
    v35 = v53;
  }

  return v34;
}

- (void)removeEffectBindingWithKey:(id)a3
{
  NSMutableDictionary *effectBindings;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  effectBindings = self->_effectBindings;
  v5 = a3;
  -[NSMutableDictionary objectForKey:](effectBindings, "objectForKey:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "effect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[VFXRenderer scene](self->_vfxRenderer, "scene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "effect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeEffect:", v8);

    -[VFXRenderer scene](self->_vfxRenderer, "scene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clearCaches");

    objc_msgSend(v10, "setEffect:", 0);
  }
  -[NSMutableDictionary removeObjectForKey:](self->_effectBindings, "removeObjectForKey:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_activeReactions, "removeObjectForKey:", v5);

}

- (BOOL)useSoftAlphaMask:(unint64_t)a3
{
  return a3 == 7;
}

- (BOOL)computeSoftAlphaMask
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allValues](self->_effectBindings, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (-[PTVFXRenderEffect useSoftAlphaMask:](self, "useSoftAlphaMask:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "effectType")))
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (void)updateCameraProjection
{
  double v3;
  double v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  unsigned int cameraRotationDegrees;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  simd_float4x4 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;

  self->_dimmingFactor = 0.0;
  -[PTVFXRenderEffect removeAllActiveReactions](self, "removeAllActiveReactions");
  *(float *)&v3 = (float)self->_colorSizeROI.width / (float)self->_colorSizeROI.height;
  LODWORD(v4) = 1055994548;
  +[PTUtil perspectiveProjectionFieldOfView:aspectRatio:depthNearFar:reverseZ:](PTUtil, "perspectiveProjectionFieldOfView:aspectRatio:depthNearFar:reverseZ:", self->reverseZ, v4, v3, *(double *)self->depthNearFar);
  v9 = v5;
  cameraRotationDegrees = self->_cameraRotationDegrees;
  switch(cameraRotationDegrees)
  {
    case 0x10Eu:
      v12 = 0;
      v15 = xmmword_1C9322B30;
      v16 = xmmword_1C9322B40;
      v17 = xmmword_1C9322B50;
      v18 = xmmword_1C9322B60;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v19 + v12) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*(__int128 *)((char *)&v15 + v12))), v6, *(float32x2_t *)((char *)&v15 + v12), 1), v7, *(float32x4_t *)((char *)&v15 + v12), 2), v8, *(float32x4_t *)((char *)&v15 + v12), 3);
        v12 += 16;
      }
      while (v12 != 64);
      goto LABEL_12;
    case 0xB4u:
      v13 = 0;
      v15 = xmmword_1C9322B70;
      v16 = xmmword_1C9322B30;
      v17 = xmmword_1C9322B50;
      v18 = xmmword_1C9322B60;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v19 + v13) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*(__int128 *)((char *)&v15 + v13))), v6, *(float32x2_t *)((char *)&v15 + v13), 1), v7, *(float32x4_t *)((char *)&v15 + v13), 2), v8, *(float32x4_t *)((char *)&v15 + v13), 3);
        v13 += 16;
      }
      while (v13 != 64);
      goto LABEL_12;
    case 0x5Au:
      v11 = 0;
      v15 = xmmword_1C9322B80;
      v16 = xmmword_1C9322B70;
      v17 = xmmword_1C9322B50;
      v18 = xmmword_1C9322B60;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v19 + v11) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*(__int128 *)((char *)&v15 + v11))), v6, *(float32x2_t *)((char *)&v15 + v11), 1), v7, *(float32x4_t *)((char *)&v15 + v11), 2), v8, *(float32x4_t *)((char *)&v15 + v11), 3);
        v11 += 16;
      }
      while (v11 != 64);
LABEL_12:
      v9 = v19;
      v6 = v20;
      v7 = v21;
      v8 = v22;
      break;
  }
  -[_TtC3VFX9VFXCamera setProjection:](self->_camera, "setProjection:", *(double *)v9.i64, *(_OWORD *)&v9, *(_OWORD *)&v6, *(_OWORD *)&v7, *(_OWORD *)&v8, v15, v16, v17, v18);
  *(simd_float4x4 *)self->_anon_b0 = __invert_f4(v14);
}

- (id)addNewEffectFromEvent:(id)a3 renderRequest:(id)a4 time:(double)a5 presenterOverlaySmall:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  NSMutableDictionary *activeReactions;
  void *v16;
  PTVFXRenderEffectBinding *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  double v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int cameraRotationDegrees;
  unsigned int v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  float v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  unsigned int *p_cameraRotationDegrees;
  int v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  unint64_t width;
  unint64_t height;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  int *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint8_t v91;
  _BYTE v92[15];
  uint8_t v93;
  _BYTE v94[15];
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  BOOL v99;
  _BYTE v100[4];
  int v101;
  _BYTE v102[16];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v99 = a6;
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setStartTime:", a5);
  v13 = objc_msgSend(v10, "effectType");
  v14 = v13 % -[NSArray count](self->_reactionTemplates, "count");
  objc_msgSend(v12, "setEffectType:", v14);
  objc_msgSend(v12, "setUiTriggeredReaction:", objc_msgSend(v10, "uiTriggeredReaction"));
  activeReactions = self->_activeReactions;
  v89 = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "triggerID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](activeReactions, "setObject:forKeyedSubscript:", v12, v16);

  v17 = -[PTVFXRenderEffectBinding initWithHumanDetections:]([PTVFXRenderEffectBinding alloc], "initWithHumanDetections:", self->_humanDetections);
  -[VFXRenderer scene](self->_vfxRenderer, "scene");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_reactionTemplates, "objectAtIndexedSubscript:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addEffectFromTemplate:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTVFXRenderEffectBinding setEffect:](v17, "setEffect:", v20);

  -[PTVFXRenderEffectBinding effect](v17, "effect");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    _PTLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[PTVFXRenderEffect addNewEffectFromEvent:renderRequest:time:presenterOverlaySmall:].cold.7(v14, v22, v23);

  }
  if (-[PTVFXRenderEffect useSoftAlphaMask:](self, "useSoftAlphaMask:", v14))
  {
    v24 = objc_msgSend(v21, "fetchClientTextureIDWithNamed:", CFSTR("texAlpha"));
    -[PTVFXSoftAlphaMask lazyInstantiateAlphaMaskForRenderRequest:](self->_softAlphaMask, "lazyInstantiateAlphaMaskForRenderRequest:", v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setClientTextureWithId:texture:", v24, v25);

  }
  -[PTVFXRenderEffectBinding setEffectType:](v17, "setEffectType:", v14);
  v87 = v12;
  v88 = v11;
  switch(v14)
  {
    case 0uLL:
      cameraRotationDegrees = self->_cameraRotationDegrees;
      if (cameraRotationDegrees == 180 || !cameraRotationDegrees)
      {
        LODWORD(v26) = 1083388723;
        goto LABEL_35;
      }
      _ZF = self->_aspectRatio == 2;
      LODWORD(v26) = 1084437299;
      v46 = 5.0;
      goto LABEL_33;
    case 1uLL:
    case 2uLL:
      objc_msgSend(v21, "bindingOf:named:", CFSTR("Emitter"), CFSTR("left"));
      v27 = objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v102[0] = objc_msgSend(v10, "orientation") == 0;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v102, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[PTVFXRenderEffectBinding setRawValue:onBinding:](PTVFXRenderEffectBinding, "setRawValue:onBinding:", v28, v27);

      }
      objc_msgSend(v21, "bindingOf:named:", CFSTR("Emitter"), CFSTR("up"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v102[0] = v14 == 1;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v102, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[PTVFXRenderEffectBinding setRawValue:onBinding:](PTVFXRenderEffectBinding, "setRawValue:onBinding:", v30, v29);

      }
      goto LABEL_16;
    case 3uLL:
      v38 = self->_cameraRotationDegrees;
      if (v38 != 180 && v38)
        LODWORD(v26) = dword_1C9322AF8[self->_aspectRatio == 2];
      else
        LODWORD(v26) = 1082340147;
      goto LABEL_35;
    case 4uLL:
    case 5uLL:
    case 7uLL:
      -[PTVFXRenderEffectBinding setUseBackgroundDimming:](v17, "setUseBackgroundDimming:", 1);
      break;
    case 6uLL:
      objc_msgSend(v21, "bindingOf:named:", CFSTR("Emitter"), CFSTR("position"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTVFXRenderEffectBinding setPositionBinding:](v17, "setPositionBinding:", v39);

      -[PTVFXRenderEffectBinding positionBinding](v17, "positionBinding");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v40)
      {
        _PTLogSystem();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          -[PTVFXRenderEffect addNewEffectFromEvent:renderRequest:time:presenterOverlaySmall:].cold.6(v41, v42, v43);

      }
      v44 = self->_cameraRotationDegrees;
      if (v44 != 180 && v44)
      {
        _ZF = self->_aspectRatio == 2;
        LODWORD(v26) = 1087163597;
        v46 = 6.0;
LABEL_33:
        if (_ZF)
          *(float *)&v26 = v46;
      }
      else
      {
        LODWORD(v26) = 1084647014;
      }
LABEL_35:
      -[PTVFXRenderEffectBinding setDuration:](v17, "setDuration:", v26);
      break;
    default:
      _PTLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[PTVFXRenderEffect addNewEffectFromEvent:renderRequest:time:presenterOverlaySmall:].cold.5(v14, v27, v31, v32, v33, v34, v35, v36);
LABEL_16:

      break;
  }
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v86 = v21;
  objc_msgSend(v21, "bindings");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
  if (v48)
  {
    v49 = v48;
    v84 = &v101;
    v50 = *(_QWORD *)v96;
    __asm { FMOV            V0.2S, #1.0 }
    v85 = _D0;
    do
    {
      v55 = 0;
      do
      {
        if (*(_QWORD *)v96 != v50)
          objc_enumerationMutation(v47);
        v56 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v55);
        objc_msgSend(v56, "bindingName", v84);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v57, "isEqualToString:", CFSTR("headPosition")))
        {
          -[PTVFXRenderEffectBinding setHeadPositionBinding:](v17, "setHeadPositionBinding:", v56);
          goto LABEL_58;
        }
        if (objc_msgSend(v57, "isEqualToString:", CFSTR("seed")))
        {
          LODWORD(v90) = 0;
          v58 = kVFXRandomizationSeed;
          if (kVFXRandomizationSeed == -1)
            v58 = mach_absolute_time();
          LODWORD(v90) = v58;
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v90, 4);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          +[PTVFXRenderEffectBinding setRawValue:onBinding:](PTVFXRenderEffectBinding, "setRawValue:onBinding:", v59, v56);

        }
        else
        {
          if (objc_msgSend(v57, "isEqualToString:", CFSTR("orientation")))
          {
            v60 = (void *)MEMORY[0x1E0C99D50];
            p_cameraRotationDegrees = &self->_cameraRotationDegrees;
LABEL_54:
            v63 = 4;
            goto LABEL_55;
          }
          if (objc_msgSend(v57, "isEqualToString:", CFSTR("aspectRatio")))
          {
            if (self->_aspectRatio == 2)
              v62 = 4;
            else
              v62 = 9;
            LODWORD(v90) = v62;
            v60 = (void *)MEMORY[0x1E0C99D50];
            p_cameraRotationDegrees = (unsigned int *)&v90;
            goto LABEL_54;
          }
          if (objc_msgSend(v57, "isEqualToString:", CFSTR("opacity")))
          {
            -[PTVFXRenderEffectBinding opacityValue](v17, "opacityValue");
            v66 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v66)
            {
              LODWORD(v90) = 1065353216;
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v90, 4);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              -[PTVFXRenderEffectBinding setOpacityValue:](v17, "setOpacityValue:", v67);

              v68 = (void *)objc_opt_new();
              -[PTVFXRenderEffectBinding setOpacityBindings:](v17, "setOpacityBindings:", v68);

            }
            -[PTVFXRenderEffectBinding opacityBindings](v17, "opacityBindings");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "addObject:", v56);

            -[PTVFXRenderEffectBinding opacityValue](v17, "opacityValue");
            v64 = objc_claimAutoreleasedReturnValue();
            goto LABEL_56;
          }
          if (objc_msgSend(v57, "isEqualToString:", CFSTR("duration")))
          {
            -[PTVFXRenderEffectBinding durationBinding](v17, "durationBinding");
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            if (v70)
            {
              _PTLogSystem();
              v71 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                -[PTVFXRenderEffect addNewEffectFromEvent:renderRequest:time:presenterOverlaySmall:].cold.2(&v93, v94, v71);

            }
            objc_msgSend(v56, "rawValue");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v65, "length") == 4)
            {
              -[PTVFXRenderEffectBinding setDurationBinding:](v17, "setDurationBinding:", v56);
              goto LABEL_57;
            }
            _PTLogSystem();
            v72 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
              -[PTVFXRenderEffect addNewEffectFromEvent:renderRequest:time:presenterOverlaySmall:].cold.1((uint64_t)v102, v65);
LABEL_76:

            goto LABEL_57;
          }
          if (objc_msgSend(v57, "isEqualToString:", CFSTR("gestureTrigger")))
          {
            LOBYTE(v90) = 0;
            LOBYTE(v90) = objc_msgSend(v89, "uiTriggeredReaction") ^ 1;
            v60 = (void *)MEMORY[0x1E0C99D50];
            p_cameraRotationDegrees = (unsigned int *)&v90;
LABEL_73:
            v63 = 1;
            goto LABEL_55;
          }
          if (objc_msgSend(v57, "isEqualToString:", CFSTR("backgroundDimming")))
          {
            objc_msgSend(v56, "rawValue");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            -[PTVFXRenderEffectBinding backgroundDimmingBinding](v17, "backgroundDimmingBinding");
            v73 = (void *)objc_claimAutoreleasedReturnValue();

            if (v73)
            {
              v74 = v65;
              _PTLogSystem();
              v75 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                -[PTVFXRenderEffect addNewEffectFromEvent:renderRequest:time:presenterOverlaySmall:].cold.4(&v91, v92, v75);

              v65 = v74;
            }
            if (objc_msgSend(v65, "length") == 4)
            {
              -[PTVFXRenderEffectBinding setBackgroundDimmingBinding:](v17, "setBackgroundDimmingBinding:", v56);
              goto LABEL_57;
            }
            _PTLogSystem();
            v72 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
              -[PTVFXRenderEffect addNewEffectFromEvent:renderRequest:time:presenterOverlaySmall:].cold.3((uint64_t)v100, v65);
            goto LABEL_76;
          }
          if (objc_msgSend(v57, "isEqualToString:", CFSTR("bilbyFloating")))
          {
            v60 = (void *)MEMORY[0x1E0C99D50];
            p_cameraRotationDegrees = (unsigned int *)&v99;
            goto LABEL_73;
          }
          if (objc_msgSend(v57, "isEqualToString:", CFSTR("viewportScale")))
          {
            width = self->_colorSizeROI.width;
            height = self->_colorSizeROI.height;
            HIDWORD(v78) = HIDWORD(v85);
            LODWORD(v79) = v85;
            if (width > height)
            {
              *(float *)&v78 = (float)width / (float)height;
              v80 = v78;
            }
            else
            {
              *((float *)&v79 + 1) = (float)height / (float)width;
              v80 = v79;
            }
            v90 = v80;
            v60 = (void *)MEMORY[0x1E0C99D50];
            p_cameraRotationDegrees = (unsigned int *)&v90;
            v63 = 8;
LABEL_55:
            objc_msgSend(v60, "dataWithBytes:length:", p_cameraRotationDegrees, v63);
            v64 = objc_claimAutoreleasedReturnValue();
LABEL_56:
            v65 = (void *)v64;
            +[PTVFXRenderEffectBinding setRawValue:onBinding:](PTVFXRenderEffectBinding, "setRawValue:onBinding:", v64, v56);
LABEL_57:

          }
        }
LABEL_58:

        ++v55;
      }
      while (v49 != v55);
      v81 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
      v49 = v81;
    }
    while (v81);
  }

  -[PTVFXRenderEffectBinding setUseBackgroundDimming:](v17, "setUseBackgroundDimming:", -[PTVFXRenderEffectBinding useBackgroundDimming](v17, "useBackgroundDimming"));
  -[PTVFXRenderEffectBinding setCreationTimeSeconds:](v17, "setCreationTimeSeconds:", a5);
  -[PTVFXRenderEffectBinding setInverseCameraProjection:](v17, "setInverseCameraProjection:", *(double *)self->_anon_b0, *(double *)&self->_anon_b0[16], *(double *)&self->_anon_b0[32], *(double *)&self->_anon_b0[48]);
  *(float *)&v82 = self->_emitZValue;
  -[PTVFXRenderEffectBinding setEmitZValue:](v17, "setEmitZValue:", v82);

  return v17;
}

- (int)maxReactionEffectComplexity
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary keyEnumerator](self->_activeReactions, "keyEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v4)
  {
    v6 = 0;
    goto LABEL_19;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v14;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(v3);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_activeReactions, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "effectType");
      if (v10 > 7)
        goto LABEL_14;
      if (((1 << v10) & 0xB1) != 0)
      {
        v6 = 100;
        goto LABEL_9;
      }
      if (v10 == 3)
      {
        if (v6 <= 50)
          v6 = 50;
      }
      else
      {
LABEL_14:
        if (v6 <= 25)
          v6 = 25;
      }
LABEL_9:

      ++v8;
    }
    while (v5 != v8);
    v11 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    v5 = v11;
  }
  while (v11);
LABEL_19:

  return v6;
}

- (void)removeAllActiveReactions
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allKeys](self->_effectBindings, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[PTVFXRenderEffect removeEffectBindingWithKey:](self, "removeEffectBindingWithKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)updateWithRenderRequest:(id)a3 lastFrameTime:(double)a4
{
  id v6;
  double v7;
  double v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  double v21;
  double width;
  double v23;
  void *v24;
  unint64_t v25;
  double height;
  double v27;
  unint64_t v28;
  int v29;
  int v30;
  float v31;
  _BOOL4 v32;
  double v33;
  id v34;
  void *v35;
  PTVFXRenderEffect *v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  uint64_t v54;
  void *v55;
  _BOOL4 v56;
  _BOOL8 v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  float dimmingFactor;
  float v64;
  void *v65;
  uint64_t v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t k;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  uint64_t m;
  uint64_t v77;
  void *v78;
  float v79;
  float v80;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  float v90;
  void *v91;
  _BOOL4 v93;
  id obj;
  _BOOL4 v95;
  uint64_t v96;
  int v97;
  void *v98;
  void *v99;
  uint64_t v100;
  int v101;
  PTVFXRenderEffect *v102;
  float v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[56];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "frameTimeSeconds");
  v8 = v7;
  v9 = objc_msgSend(v6, "presenterOverlayMode") == 3 || objc_msgSend(v6, "presenterOverlayMode") == 4;
  v95 = v9;
  -[PTVFXRenderEffect reactionTemplates](self, "reactionTemplates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v102 = self;
  if (-[NSMutableDictionary count](self->_activeReactions, "count"))
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v6, "reactions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "count") == 0;

  }
  v14 = 0;
  if (!v11 || v12)
    goto LABEL_95;
  objc_msgSend(v6, "inReactionColorSize");
  if (v15 != (double)v102->_colorSize.width
    || (objc_msgSend(v6, "inReactionColorSize"), v16 != (double)v102->_colorSize.height))
  {
    objc_msgSend(v6, "inReactionColorSize");
    if (v17 != 0.0)
    {
      objc_msgSend(v6, "inReactionColorSize");
      if (v18 != 0.0)
      {
        objc_msgSend(v6, "inReactionColorSize");
        v20 = (unint64_t)v19;
        objc_msgSend(v6, "inReactionColorSize");
        v102->_colorSize.width = v20;
        v102->_colorSize.height = (unint64_t)v21;
        v102->_colorSize.depth = 0;
      }
    }
  }
  width = (double)v102->_colorSize.width;
  objc_msgSend(v6, "outColorROI");
  v24 = v6;
  v25 = (unint64_t)(v23 * width);
  height = (double)v102->_colorSize.height;
  v99 = v24;
  objc_msgSend(v24, "outColorROI");
  v28 = (unint64_t)(v27 * height);
  if (v102->_colorSizeROI.width == v25 && v102->_colorSizeROI.height == v28)
  {
    v29 = 0;
  }
  else
  {
    v102->_colorSizeROI.width = v25;
    v102->_colorSizeROI.height = v28;
    v29 = 1;
    v102->_colorSizeROI.depth = 1;
    v102->_aspectRatio = +[PTEffectUtil aspectRatio:](PTEffectUtil, "aspectRatio:", (double)v25, (double)v28);
  }
  if (v99)
    objc_msgSend(v99, "transform");
  else
    memset(v124, 0, 48);
  v30 = +[PTUtil getRotationDegreesFromAffineTransform:](PTUtil, "getRotationDegreesFromAffineTransform:", v124);
  if (v30 == v102->_cameraRotationDegrees)
  {
    if (!v29)
      goto LABEL_26;
  }
  else
  {
    v102->_cameraRotationDegrees = v30;
  }
  -[PTVFXRenderEffect updateCameraProjection](v102, "updateCameraProjection");
LABEL_26:
  v31 = v8 - a4;
  v32 = v31 > 0.25 && !v102->_simulationWasSkippedForPreviousFrame;
  if (v31 <= 0.0166666667)
    v31 = 0.016667;
  if (v31 > 0.25)
    v31 = 0.25;
  v33 = v31;
  v93 = v32;
  kdebug_trace();
  v34 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[NSMutableDictionary allKeys](v102->_effectBindings, "allKeys");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = (void *)objc_msgSend(v34, "initWithArray:", v35);

  v36 = v102;
  v102->_emitNewReaction = 0;
  v102->_dimmingFactor = 0.0;
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  objc_msgSend(v99, "reactions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
  if (v100)
  {
    v101 = 0;
    v96 = *(_QWORD *)v121;
    v97 = 0;
    do
    {
      for (i = 0; i != v100; ++i)
      {
        if (*(_QWORD *)v121 != v96)
          objc_enumerationMutation(obj);
        v38 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v38, "triggerID"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = 0u;
        v117 = 0u;
        v118 = 0u;
        v119 = 0u;
        -[NSMutableDictionary allValues](v36->_effectBindings, "allValues");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v117;
LABEL_40:
          v44 = 0;
          while (1)
          {
            if (*(_QWORD *)v117 != v43)
              objc_enumerationMutation(v40);
            v45 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * v44);
            v46 = objc_msgSend(v45, "effectType");
            if (v46 == objc_msgSend(v38, "effectType"))
              break;
            if (v42 == ++v44)
            {
              v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
              if (v42)
                goto LABEL_40;
              goto LABEL_46;
            }
          }
          v47 = v45;

          if (!v47)
            goto LABEL_49;
          v48 = v99;
          v36 = v102;
        }
        else
        {
LABEL_46:

LABEL_49:
          v114 = 0u;
          v115 = 0u;
          v112 = 0u;
          v113 = 0u;
          -[NSMutableDictionary allValues](v102->_effectBindings, "allValues");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v112, v127, 16);
          if (v50)
          {
            v51 = v50;
            v52 = *(_QWORD *)v113;
            do
            {
              for (j = 0; j != v51; ++j)
              {
                if (*(_QWORD *)v113 != v52)
                  objc_enumerationMutation(v49);
                objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * j), "forceFadeOut:", v8);
              }
              v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v112, v127, 16);
            }
            while (v51);
          }

          ++v101;
          v54 = objc_msgSend(v38, "effectType");
          v36 = v102;
          v48 = v99;
          -[PTVFXRenderEffect addNewEffectFromEvent:renderRequest:time:presenterOverlaySmall:](v102, "addNewEffectFromEvent:renderRequest:time:presenterOverlaySmall:", v38, v99, v95, v8);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v55;
          v56 = v54 << 32 != 0x100000000 && v95;
          v57 = v54 << 32 != 0x200000000 && v56;
          objc_msgSend(v55, "setUseCircularGradient:", v57);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v102->_effectBindings, "setObject:forKeyedSubscript:", v47, v39);
          v102->_emitNewReaction |= v47 != 0;
        }
        objc_msgSend(v48, "inReactionVideoRect");
        objc_msgSend(v47, "updateWithEvent:renderRequest:videoRect:time:", v38, v48);
        if (objc_msgSend(v47, "active"))
        {
          ++v97;
        }
        else
        {
          objc_msgSend(v47, "effect");
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          if (v58)
          {
            -[VFXRenderer scene](v36->_vfxRenderer, "scene");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "effect");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "removeEffect:", v60);

            -[VFXRenderer scene](v36->_vfxRenderer, "scene");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "clearCaches");

            objc_msgSend(v47, "setEffect:", 0);
            -[NSMutableDictionary removeObjectForKey:](v36->_activeReactions, "removeObjectForKey:", v39);
          }
        }
        objc_msgSend(v98, "removeObject:", v39);
        objc_msgSend(v47, "effect");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setIsEnabled:", 1);

        dimmingFactor = v36->_dimmingFactor;
        objc_msgSend(v47, "dimmingFactor");
        if (dimmingFactor >= v64)
          v64 = dimmingFactor;
        v36->_dimmingFactor = v64;

      }
      v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
    }
    while (v100);
  }

  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  -[NSMutableDictionary allValues](v36->_effectBindings, "allValues");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v108, v126, 16);
  if (v66)
  {
    v68 = v66;
    v69 = *(_QWORD *)v109;
    do
    {
      for (k = 0; k != v68; ++k)
      {
        if (*(_QWORD *)v109 != v69)
          objc_enumerationMutation(v65);
        *(float *)&v67 = v36->_dimmingFactor;
        objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * k), "updateBackgroundDimming:", v67);
      }
      v68 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v108, v126, 16);
    }
    while (v68);
  }

  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v71 = (void *)objc_msgSend(v98, "copy");
  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v104, v125, 16);
  if (v72)
  {
    v73 = v72;
    v74 = 0;
    v75 = *(_QWORD *)v105;
    do
    {
      for (m = 0; m != v73; ++m)
      {
        if (*(_QWORD *)v105 != v75)
          objc_enumerationMutation(v71);
        v77 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * m);
        -[NSMutableDictionary objectForKey:](v36->_effectBindings, "objectForKey:", v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "inReactionVideoRect");
        objc_msgSend(v78, "updateWithEvent:renderRequest:videoRect:time:", 0, v99);
        v79 = v36->_dimmingFactor;
        objc_msgSend(v78, "dimmingFactor");
        if (v79 >= v80)
          v80 = v79;
        v36->_dimmingFactor = v80;
        if ((objc_msgSend(v78, "active") & 1) == 0)
        {
          -[PTVFXRenderEffect removeEffectBindingWithKey:](v36, "removeEffectBindingWithKey:", v77);
          ++v74;
        }

      }
      v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v104, v125, 16);
    }
    while (v73);
  }

  if (v93)
  {
    _PTLogSystem();
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      -[PTVFXRenderEffect updateWithRenderRequest:lastFrameTime:].cold.1(v81, v82, v83, v84, v85, v86, v87, v88);
    v89 = 1;
  }
  else
  {
    -[VFXRenderer scene](v36->_vfxRenderer, "scene");
    v81 = objc_claimAutoreleasedReturnValue();
    -[NSObject updateWithDeltaTime:](v81, "updateWithDeltaTime:", v33);
    v89 = 0;
  }

  v36->_simulationWasSkippedForPreviousFrame = v89;
  v90 = v36->_dimmingFactor * -0.95 + 1.0;
  v103 = v90;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v103, 4);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTVFXRenderEffectBinding setRawValue:onBinding:](PTVFXRenderEffectBinding, "setRawValue:onBinding:", v91, v36->_lightBinding);

  kdebug_trace();
  v14 = -[NSMutableDictionary count](v36->_activeReactions, "count") != 0;

  v6 = v99;
LABEL_95:

  return v14;
}

- (int)render:(id)a3 effectRGBA:(id)a4 effectDepth:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (a4 && v9)
  {
    -[VFXRenderer setTexture:](self->_vfxRenderer, "setTexture:", a4);
    -[VFXRenderer setDepthTexture:](self->_vfxRenderer, "setDepthTexture:", v10);
    -[VFXRenderer encodeWithCommandBuffer:](self->_vfxRenderer, "encodeWithCommandBuffer:", v8);
    -[VFXRenderer finalizeEncoding](self->_vfxRenderer, "finalizeEncoding");
    v11 = 0;
  }
  else
  {
    _PTLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[PTVFXRenderEffect render:effectRGBA:effectDepth:].cold.1(v12, v13, v14);

    v11 = -10;
  }

  return v11;
}

- (int)renderWithBackgroundDimming:(id)a3 effectRGBA:(id)a4 inCenteredDisparity:(id)a5 inSegmentation:(id)a6 effectDepth:(id)a7 disparityFiltered:(id)a8 focusDisparityModifiers:(id)a9 renderRequest:(id)a10 debugType:(int64_t)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
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
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  PTVFXSoftAlphaMask *softAlphaMask;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t i;
  uint64_t v50;
  uint64_t v51;
  uint64x2_t v52;
  float64x2_t v53;
  PTColorConversion *colorConversion;
  __int16 v55;
  __int16 v56;
  double v57;
  int v58;
  id v59;
  void *v60;
  void *v61;
  int v63;
  int v64;
  void *v65;
  void *v66;
  id v67;
  float64_t v68;
  float64_t v69;
  id v70;
  id v71;
  int32x2_t v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v67 = a9;
  v23 = a10;
  v24 = objc_msgSend(v23, "outColorBuffer");
  objc_msgSend(v23, "inBilbyAlphaMaskTexture");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "inReactionVideoRect");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  objc_msgSend(v23, "outColorROI");
  v68 = v34;
  v69 = v33;
  v36 = v35;
  v38 = v37;
  if (-[PTVFXRenderEffect computeSoftAlphaMask](self, "computeSoftAlphaMask"))
  {
    softAlphaMask = self->_softAlphaMask;
    if (v20)
      -[PTVFXSoftAlphaMask updateSoftAlphaMask:inSegmentation:effectRenderRequest:](softAlphaMask, "updateSoftAlphaMask:inSegmentation:effectRenderRequest:", v17, v20, v23);
    else
      -[PTVFXSoftAlphaMask updateSoftAlphaMask:inDisparity:focusDisparityModifiers:effectRenderRequest:](softAlphaMask, "updateSoftAlphaMask:inDisparity:focusDisparityModifiers:effectRenderRequest:", v17, v22, v67, v23);
  }
  v65 = v22;
  v71 = v21;
  -[PTMetalContext device](self->_metalContext, "device");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTTexture createFromPixelbuffer:device:read:write:](PTTexture, "createFromPixelbuffer:device:read:write:", v24, v40, 1, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v73)
  {
    self->_dimmingFactor = 0.0;
    LODWORD(v42) = 0;
  }
  else
  {
    *(float *)&v42 = self->_dimmingFactor;
  }
  v43 = v71;
  v64 = -[PTEffectReactionBackgroundDimming backgroundDimAndConvertRGBLinearFromPTTexture:inPTTexture:inCenteredDisparity:inSegmentation:outRGBA:dimmingFactor:disparityRemapping:outColorROI:](self->_reactionBackground, "backgroundDimAndConvertRGBLinearFromPTTexture:inPTTexture:inCenteredDisparity:inSegmentation:outRGBA:dimmingFactor:disparityRemapping:outColorROI:", v17, v41, v19, v20, v18, v42, v26, v28, v30, v32, *(_QWORD *)&v69, *(_QWORD *)&v68, v36, v38);
  v63 = -[PTVFXRenderEffect render:effectRGBA:effectDepth:](self, "render:effectRGBA:effectDepth:", v17, v18, v71);
  v44 = objc_msgSend(v41, "isRGB");
  v66 = v20;
  if (v73 && v44)
  {
    v70 = v19;
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    -[NSMutableDictionary allValues](self->_effectBindings, "allValues");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
    if (v46)
    {
      v47 = 0;
      v48 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v75 != v48)
            objc_enumerationMutation(v45);
          v47 |= objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "useCircularGradient");
        }
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
      }
      while (v46);

      if ((v47 & 1) != 0)
        v46 = (uint64_t)v73;
      else
        v46 = 0;
    }
    else
    {

    }
    v59 = v41;
    objc_msgSend(v59, "texRGBA");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "transferFunction");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = -[PTVFXRenderEffect convertRGB:inRGBA:inAlphaMask:outRGBA:toLinear:transferFunction:](self, "convertRGB:inRGBA:inAlphaMask:outRGBA:toLinear:transferFunction:", v17, v18, v46, v60, 0, v61);
    v19 = v70;
    v43 = v71;
  }
  else
  {
    v50 = objc_msgSend(v41, "width");
    v51 = objc_msgSend(v41, "height");
    v52.i64[0] = v50;
    v52.i64[1] = v51;
    v53.f64[0] = v69;
    v53.f64[1] = v68;
    v72 = vcvt_s32_f32(vrnda_f32(vcvt_f32_f64(vmulq_f64(v53, vcvtq_f64_u64(v52)))));
    colorConversion = self->_colorConversion;
    v55 = objc_msgSend(v18, "width");
    v56 = objc_msgSend(v18, "height");
    LOWORD(v57) = v72.i16[0];
    WORD1(v57) = v72.i16[2];
    WORD2(v57) = v55;
    HIWORD(v57) = v56;
    v58 = -[PTColorConversion convertRGBLinearToPTTexture:inRGBA:outPTTexture:outRect:](colorConversion, "convertRGBLinearToPTTexture:inRGBA:outPTTexture:outRect:", v17, v18, v41, v57);
  }

  return v63 | v64 | v58;
}

- (int)convertRGB:(id)a3 inRGBA:(id)a4 inAlphaMask:(id)a5 outRGBA:(id)a6 toLinear:(BOOL)a7 transferFunction:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  int v18;
  PTImageblockConfig *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[3];
  _QWORD v31[3];

  v9 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:", a8, v9);
  v19 = -[PTImageblockConfig initWithTexture:]([PTImageblockConfig alloc], "initWithTexture:", v14);
  objc_msgSend(v17, "computeCommandEncoder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    _PTLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);

  }
  objc_msgSend(v20, "setComputePipelineState:", self->_convertRGBAlpha[v18]);
  objc_msgSend(v20, "setImageblockWidth:height:", -[PTImageblockConfig imageblockSize](v19, "imageblockSize"), -[PTImageblockConfig imageblockSize](v19, "imageblockSize"));
  objc_msgSend(v20, "setTexture:atIndex:", v16, 0);

  objc_msgSend(v20, "setTexture:atIndex:", v15, 1);
  objc_msgSend(v20, "setTexture:atIndex:", v14, 2);
  if (v19)
  {
    -[PTImageblockConfig threads](v19, "threads");
    -[PTImageblockConfig threadsPerGroup](v19, "threadsPerGroup");
  }
  else
  {
    memset(v31, 0, sizeof(v31));
    memset(v30, 0, sizeof(v30));
  }
  objc_msgSend(v20, "dispatchThreads:threadsPerThreadgroup:", v31, v30);
  objc_msgSend(v20, "endEncoding");

  return 0;
}

+ (void)setRandomizationSeed:(int)a3
{
  kVFXRandomizationSeed = a3;
}

- (float)dimmingFactor
{
  return self->_dimmingFactor;
}

+ (uint64_t)transformVideoPositionToCropCoordinates:(uint64_t)a3 effectRenderRequest:(uint64_t)a4 flipYAxis:(char)a5
{
  if ((a5 & 1) != 0)
    *((float *)&a2 + 1) = 1.0 - *((float *)&a2 + 1);
  return objc_msgSend(a1, "transformVideoRectToCropCoordinates:effectRenderRequest:", a2);
}

+ (uint64_t)transformVideoRectToCropCoordinates:(uint64_t)a3 effectRenderRequest:(void *)a4
{
  double v4;

  objc_msgSend(a4, "reactionsCombinedCropRect");
  return +[PTEffectUtil transformRect:intoCropCoordinates:](PTEffectUtil, "transformRect:intoCropCoordinates:", a1, v4);
}

- (double)depthNearFar
{
  return *(double *)(a1 + 360);
}

- (void)setDepthNearFar:(PTVFXRenderEffect *)self
{
  uint64_t v2;

  *(_QWORD *)self->depthNearFar = v2;
}

- (BOOL)reverseZ
{
  return self->reverseZ;
}

- (void)setReverseZ:(BOOL)a3
{
  self->reverseZ = a3;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_reactionTemplates, 0);
  for (i = 0; i != -9; --i)
    objc_storeStrong((id *)&self->_convertRGBAlpha[i + 8], 0);
  objc_storeStrong((id *)&self->_activeReactions, 0);
  objc_storeStrong((id *)&self->_effectBindings, 0);
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_vfxRenderer, 0);
  objc_storeStrong((id *)&self->_renderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_util, 0);
  objc_storeStrong((id *)&self->_softAlphaMask, 0);
  objc_storeStrong((id *)&self->_lightBinding, 0);
  objc_storeStrong((id *)&self->_lighting, 0);
  objc_storeStrong((id *)&self->_humanDetections, 0);
  objc_storeStrong((id *)&self->_reactionBackground, 0);
  objc_storeStrong((id *)&self->_colorConversion, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 colorConversion:(uint64_t)a5 prewarmOnly:(uint64_t)a6 humanDetections:(uint64_t)a7 asyncInitQueue:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 colorConversion:(uint64_t)a5 prewarmOnly:(uint64_t)a6 humanDetections:(uint64_t)a7 asyncInitQueue:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initVFX:(uint64_t)a3 asyncInitQueue:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a2, a3, "Error initializing VFX %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initVFX:(id *)a1 asyncInitQueue:(NSObject *)a2 .cold.2(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "cameras");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 67109120;
  v5[1] = objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_6_0(&dword_1C9281000, a2, v4, "Expected 1 camera was %i", (uint8_t *)v5);

  OUTLINED_FUNCTION_1();
}

- (void)initVFX:(os_log_t)log asyncInitQueue:.cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "addEffectFrom %@ error %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)addNewEffectFromEvent:(uint64_t)a1 renderRequest:(void *)a2 time:presenterOverlaySmall:.cold.1(uint64_t a1, void *a2)
{
  uint64_t *v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = OUTLINED_FUNCTION_3_0(a1, a2);
  *v3 = 134217984;
  *v2 = v4;
  OUTLINED_FUNCTION_4(&dword_1C9281000, v5, v6, "Unexpected length of duration: %lu");
  OUTLINED_FUNCTION_5();
}

- (void)addNewEffectFromEvent:(NSObject *)a3 renderRequest:time:presenterOverlaySmall:.cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_2_0(&dword_1C9281000, a3, (uint64_t)a3, "Multiple duration bindings found", a1);
}

- (void)addNewEffectFromEvent:(uint64_t)a1 renderRequest:(void *)a2 time:presenterOverlaySmall:.cold.3(uint64_t a1, void *a2)
{
  uint64_t *v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = OUTLINED_FUNCTION_3_0(a1, a2);
  *v3 = 134217984;
  *v2 = v4;
  OUTLINED_FUNCTION_4(&dword_1C9281000, v5, v6, "Unexpected length of backgroundDimming: %lu");
  OUTLINED_FUNCTION_5();
}

- (void)addNewEffectFromEvent:(NSObject *)a3 renderRequest:time:presenterOverlaySmall:.cold.4(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_2_0(&dword_1C9281000, a3, (uint64_t)a3, "Already bound", a1);
}

- (void)addNewEffectFromEvent:(uint64_t)a3 renderRequest:(uint64_t)a4 time:(uint64_t)a5 presenterOverlaySmall:(uint64_t)a6 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a2, a3, "PTEffectReactionType found %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)addNewEffectFromEvent:(uint64_t)a3 renderRequest:time:presenterOverlaySmall:.cold.6(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_2_0(&dword_1C9281000, a1, a3, "Position binding not found", v3);
  OUTLINED_FUNCTION_12();
}

- (void)addNewEffectFromEvent:(uint64_t)a3 renderRequest:time:presenterOverlaySmall:.cold.7(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_6_0(&dword_1C9281000, a2, a3, "Cannot create effect %i", (uint8_t *)v3);
  OUTLINED_FUNCTION_12();
}

- (void)updateWithRenderRequest:(uint64_t)a3 lastFrameTime:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "VFX: Skip simulation step due to large delta time %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)render:(NSObject *)a1 effectRGBA:(uint64_t)a2 effectDepth:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_2_0(&dword_1C9281000, a1, a3, "tex is nil", v3);
  OUTLINED_FUNCTION_12();
}

@end
