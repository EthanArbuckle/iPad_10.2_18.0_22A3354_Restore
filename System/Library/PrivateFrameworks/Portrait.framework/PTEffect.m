@implementation PTEffect

- (PTEffect)initWithDescriptor:(id)a3
{
  id v4;
  void *v5;
  PTEffect *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[PTEffect initWithDescriptor:sharedResources:](self, "initWithDescriptor:sharedResources:", v4, v5);

  return v6;
}

- (PTEffect)initWithDescriptor:(id)a3 sharedResources:(id)a4
{
  id v6;
  id v7;
  PTEffect *v8;
  uint64_t v9;
  PTEffectDescriptor *effectDescriptor;
  dispatch_queue_t v11;
  OS_dispatch_queue *asyncInitQueue;
  void *v13;
  PTMetalContext *v14;
  void *v15;
  uint64_t v16;
  PTMetalContext *metalContext;
  id v18;
  PTMetalContext *v19;
  void *v20;
  uint64_t v21;
  PTMetalContext *v22;
  void *v23;
  void *v24;
  PTHumanDetections *v25;
  PTHumanDetections *humanDetections;
  int v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  PTEffect *v38;
  objc_super v40;

  v6 = a3;
  v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)PTEffect;
  v8 = -[PTEffect init](&v40, sel_init);
  if (v8)
  {
    PTKTraceInit();
    if (objc_msgSend(v6, "prewarmOnly") && (objc_msgSend(v6, "availableEffectTypes") & 4) != 0)
      objc_msgSend(v6, "setSyncInitialization:", 1);
    v9 = objc_msgSend(v6, "copy");
    effectDescriptor = v8->_effectDescriptor;
    v8->_effectDescriptor = (PTEffectDescriptor *)v9;

    v8->_frameId = 0;
    v8->_debugType = 0;
    v8->_delegateLock._os_unfair_lock_opaque = 0;
    v11 = dispatch_queue_create("com.apple.portrait.effect_init", 0);
    asyncInitQueue = v8->_asyncInitQueue;
    v8->_asyncInitQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v8->_resources, a4);
    -[PTEffectDescriptor setAvailableEffectTypes:](v8->_effectDescriptor, "setAvailableEffectTypes:", -[PTEffectDescriptor availableEffectTypes](v8->_effectDescriptor, "availableEffectTypes") | -[PTEffectDescriptor activeEffectType](v8->_effectDescriptor, "activeEffectType"));
    -[PTEffectDescriptor metalCommandQueue](v8->_effectDescriptor, "metalCommandQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = [PTMetalContext alloc];
      -[PTEffectDescriptor metalCommandQueue](v8->_effectDescriptor, "metalCommandQueue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[PTMetalContext initWithCommandQueue:bundleClass:](v14, "initWithCommandQueue:bundleClass:", v15, objc_opt_class());
      metalContext = v8->_metalContext;
      v8->_metalContext = (PTMetalContext *)v16;

      v8->_hasExternalCommandQueue = 1;
    }
    else
    {
      v18 = MTLCreateSystemDefaultDevice();
      v19 = [PTMetalContext alloc];
      v20 = (void *)objc_msgSend(v18, "newCommandQueue");
      v21 = -[PTMetalContext initWithCommandQueue:bundleClass:](v19, "initWithCommandQueue:bundleClass:", v20, objc_opt_class());
      v22 = v8->_metalContext;
      v8->_metalContext = (PTMetalContext *)v21;

      -[PTMetalContext commandQueue](v8->_metalContext, "commandQueue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setGPUPriority:", 4);

      -[PTMetalContext commandQueue](v8->_metalContext, "commandQueue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTEffectDescriptor setMetalCommandQueue:](v8->_effectDescriptor, "setMetalCommandQueue:", v24);

      v8->_hasExternalCommandQueue = 0;
    }
    -[PTMetalContext setAllowCommandbufferAllocation:](v8->_metalContext, "setAllowCommandbufferAllocation:", 0);
    v25 = -[PTHumanDetections initWithMetalContext:]([PTHumanDetections alloc], "initWithMetalContext:", v8->_metalContext);
    humanDetections = v8->_humanDetections;
    v8->_humanDetections = v25;

    if (v8->_humanDetections)
    {
      v27 = -[PTEffect reconfigure:](v8, "reconfigure:", v6);
      if (!v27)
      {
        v38 = v8;
        goto LABEL_17;
      }
      v28 = v27;
      _PTLogSystem();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[PTEffect initWithDescriptor:sharedResources:].cold.2(v28, v29);

    }
    else
    {
      _PTLogSystem();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[PTEffect initWithDescriptor:sharedResources:].cold.1(v30, v31, v32, v33, v34, v35, v36, v37);

    }
  }
  v38 = 0;
LABEL_17:

  return v38;
}

- (BOOL)isRenderRequiredForRequest:(id)a3
{
  id v4;
  PTEffectRenderer *v5;
  BOOL v6;
  unint64_t v7;
  void *v8;

  v4 = a3;
  os_unfair_lock_lock(&self->_delegateLock);
  v5 = self->_delegate;
  os_unfair_lock_unlock(&self->_delegateLock);
  if (-[PTEffectRenderer isRenderRequiredForRequest:](v5, "isRenderRequiredForRequest:", v4))
  {
    v6 = 1;
  }
  else
  {
    v7 = -[PTEffectDescriptor activeEffectType](self->_effectDescriptor, "activeEffectType");
    v6 = v7 != objc_msgSend(v4, "effectType");
  }
  objc_msgSend(v4, "frameTimeSeconds");
  objc_msgSend(v4, "effectType");
  objc_msgSend(v4, "reactions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "count");
  kdebug_trace();

  return v6;
}

- (id)activeReactions
{
  os_unfair_lock_s *p_delegateLock;
  void *v4;

  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  -[PTEffectRenderer activeReactions](self->_delegate, "activeReactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_delegateLock);
  return v4;
}

- (int)updateEffectDelegate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  PTEffectRenderer *v7;
  BOOL v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  char v23;
  void *v24;
  uint64_t v25;
  id v26;
  void (**v27)(_QWORD);
  id v28;
  id v29;
  id v30;
  void *v31;
  PTEffectRenderer *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  PTEffect *v39;
  BOOL v40;
  char v41;
  BOOL v42;
  char v43;
  _QWORD v44[5];
  id v45;
  uint64_t v46;
  PTEffect *v47;
  BOOL v48;
  char v49;
  BOOL v50;
  char v51;
  uint8_t buf[4];
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  _BOOL4 v57;
  uint64_t v58;

  v3 = a3;
  v58 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[PTEffectDescriptor copy](self->_effectDescriptor, "copy");
  v6 = objc_msgSend(v5, "activeEffectType");
  os_unfair_lock_lock(&self->_delegateLock);
  v7 = self->_delegate;
  os_unfair_lock_unlock(&self->_delegateLock);
  v8 = -[PTEffectDescriptor syncInitialization](self->_effectDescriptor, "syncInitialization");
  v9 = (v8 | sForceSynchronousInitialization) & 1;
  _PTLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    v53 = objc_msgSend(v5, "activeEffectType");
    v54 = 1024;
    v55 = v9;
    v56 = 1024;
    v57 = v3;
    _os_log_debug_impl(&dword_1C9281000, v10, OS_LOG_TYPE_DEBUG, "Schedule set effect type: %i sync: %i forceImmediatePassthrough: %i", buf, 0x14u);
  }

  v11 = 0;
  if (v7 && !v3)
  {
    -[PTMetalContext commandQueue](self->_metalContext, "commandQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "commandBuffer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      _PTLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[PTEffect updateEffectDelegate:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

    }
    v11 = -[PTEffectRenderer copyTemporalState:](v7, "copyTemporalState:", v13);
    objc_msgSend(v13, "commit");
    objc_msgSend(v13, "waitUntilScheduled");

  }
  v33 = v7;
  v22 = objc_msgSend(v5, "effectQuality") > 109;
  v23 = objc_msgSend(v5, "prewarmOnly");
  v24 = (void *)-[PTMetalContext copy](self->_metalContext, "copy");
  objc_msgSend(v24, "setAllowCommandbufferAllocation:", 1);
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __33__PTEffect_updateEffectDelegate___block_invoke;
  v44[3] = &unk_1E822A4B0;
  v48 = v22;
  v49 = v9;
  v50 = v3;
  v46 = v6;
  v44[4] = self;
  v25 = v6;
  v26 = v5;
  v45 = v26;
  v47 = self;
  v51 = v23;
  v27 = (void (**)(_QWORD))MEMORY[0x1CAA3AE80](v44);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __33__PTEffect_updateEffectDelegate___block_invoke_2;
  v34[3] = &unk_1E822A4D8;
  v40 = v22;
  v41 = v9;
  v42 = v3;
  v43 = v23;
  v34[4] = self;
  v35 = v26;
  v36 = v24;
  v37 = v11;
  v38 = v25;
  v39 = self;
  v28 = v11;
  v29 = v24;
  v30 = v26;
  v31 = (void *)MEMORY[0x1CAA3AE80](v34);
  if (v3)
    v27[2](v27);
  dispatch_async((dispatch_queue_t)self->_asyncInitQueue, v31);
  self->_rebuildEffect = 0;

  return 0;
}

- (int)validateRenderRequest:(id)a3 reactionOnly:(BOOL)a4
{
  return 0;
}

- (BOOL)validPixelBuffer:(__CVBuffer *)a3
{
  signed int PixelFormatType;
  unsigned int v5;
  BOOL v6;
  int v7;
  NSObject *v8;
  int v10;

  if (!CVPixelBufferGetIOSurface(a3))
  {
    _PTLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PTEffect validPixelBuffer:].cold.1();
    goto LABEL_10;
  }
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v5 = PixelFormatType;
  v6 = 1;
  if (PixelFormatType > 875704421)
  {
    if (PixelFormatType > 2019963439)
    {
      if (PixelFormatType > 2084075055)
      {
        if (PixelFormatType == 2084075056)
          return v6;
        if (PixelFormatType == 2088269360)
          goto LABEL_25;
        v7 = 2088265264;
        goto LABEL_24;
      }
      if (PixelFormatType != 2019963440)
      {
        v10 = 2084070960;
LABEL_37:
        if (PixelFormatType == v10)
          return v6;
LABEL_38:
        _PTLogSystem();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[PTEffect validPixelBuffer:].cold.2(v5, v8);
LABEL_10:
        v6 = 0;
LABEL_27:

        return v6;
      }
    }
    else
    {
      if (PixelFormatType <= 1882468911)
      {
        if (PixelFormatType == 875704422)
          return v6;
        v10 = 875704438;
        goto LABEL_37;
      }
      if (PixelFormatType != 1882468912 && PixelFormatType != 1885745712)
      {
        v7 = 2016686640;
        goto LABEL_24;
      }
    }
LABEL_25:
    _PTLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PTEffect validPixelBuffer:].cold.3();
    goto LABEL_27;
  }
  if (PixelFormatType > 762869295)
  {
    if (PixelFormatType > 792229423)
    {
      if (PixelFormatType == 792229424)
        return v6;
      if (PixelFormatType == 796419632)
        goto LABEL_25;
      v7 = 796423728;
LABEL_24:
      if (PixelFormatType == v7)
        goto LABEL_25;
      goto LABEL_38;
    }
    if (PixelFormatType != 762869296)
    {
      v10 = 792225328;
      goto LABEL_37;
    }
    goto LABEL_25;
  }
  if (PixelFormatType <= 758670895)
  {
    if (PixelFormatType == 641230384)
      return v6;
    v10 = 641234480;
    goto LABEL_37;
  }
  if (PixelFormatType != 758670896 && PixelFormatType != 758674992)
  {
    v7 = 762865200;
    goto LABEL_24;
  }
  return v6;
}

- (int)render:(id)a3
{
  id v4;
  NSObject *v5;
  OSStatus v6;
  __CVBuffer *v7;
  uint64_t v8;
  __CVBuffer *v9;
  double v10;
  double v11;
  int v12;
  PTEffectRenderer *v13;
  int v14;
  int frameId;
  uint64_t v16;
  uint64_t v17;
  PTHumanDetections *humanDetections;
  uint64_t v19;
  _BOOL8 v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD v26[4];
  id v27;
  PTEffectRenderer *v28;
  int v29;
  _QWORD block[6];

  v4 = a3;
  if (-[PTMetalContext isCommandBufferCommitted](self->_metalContext, "isCommandBufferCommitted"))
  {
    CMRemoveAttachment((CMAttachmentBearerRef)objc_msgSend(v4, "outColorBuffer"), CFSTR("ReactionEffectComplexity"));
    if (objc_msgSend(v4, "effectQuality") == -1)
      objc_msgSend(v4, "setEffectQuality:", -[PTEffectDescriptor effectQuality](self->_effectDescriptor, "effectQuality"));
    else
      -[PTEffect _setEffectQuality:](self, "_setEffectQuality:", objc_msgSend(v4, "effectQuality"));
    if (objc_msgSend(v4, "effectType") == -1)
      objc_msgSend(v4, "setEffectType:", -[PTEffectDescriptor activeEffectType](self->_effectDescriptor, "activeEffectType"));
    else
      -[PTEffect _setEffectType:](self, "_setEffectType:", objc_msgSend(v4, "effectType"));
    v7 = (__CVBuffer *)objc_msgSend(v4, "inColorBuffer");
    v8 = objc_msgSend(v4, "detectedObjects");
    v9 = (__CVBuffer *)objc_msgSend(v4, "outColorBuffer");
    objc_msgSend(v4, "frameTimeSeconds");
    v11 = v10;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __19__PTEffect_render___block_invoke;
    block[3] = &unk_1E822A500;
    block[4] = self;
    *(double *)&block[5] = v10;
    if (render__onceToken != -1)
      dispatch_once(&render__onceToken, block);
    if (self->_rebuildEffect
      && (v12 = -[PTEffect updateEffectDelegate:](self, "updateEffectDelegate:", v11 - self->_lastFrameTime > 0.5)) != 0)
    {
      v6 = v12;
      _PTLogSystem();
      v13 = (PTEffectRenderer *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
        -[PTEffect render:].cold.5();
    }
    else
    {
      os_unfair_lock_lock(&self->_delegateLock);
      v13 = self->_delegate;
      os_unfair_lock_unlock(&self->_delegateLock);
      -[PTEffectRenderer setEffectQuality:](v13, "setEffectQuality:", objc_msgSend(v4, "effectQuality"));
      if (v13
        && (v14 = -[PTEffect validateRenderRequest:reactionOnly:](self, "validateRenderRequest:reactionOnly:", v4, 0)) != 0)
      {
        v6 = v14;
      }
      else
      {
        frameId = self->_frameId;
        CVPixelBufferGetWidth(v7);
        CVPixelBufferGetHeight(v7);
        objc_msgSend(v4, "effectType");
        kdebug_trace();
        CVBufferPropagateAttachments(v7, v9);
        if (v8)
          v16 = v8;
        else
          v16 = 0;
        -[PTHumanDetections unpackDetections:](self->_humanDetections, "unpackDetections:", v16, frameId % 3);
        v17 = MEMORY[0x1E0C809B0];
        humanDetections = self->_humanDetections;
        if (self->_frameId && v11 - self->_lastDetectionUpdate <= 1.0)
          v19 = -[PTHumanDetections filterDetections](humanDetections, "filterDetections");
        else
          v19 = -[PTHumanDetections clearFilterDetections](humanDetections, "clearFilterDetections");
        self->_lastDetectionUpdate = self->_lastFrameTime;
        if (v13)
        {
          v20 = !self->_hasExternalCommandQueue;
          v26[0] = v17;
          v26[1] = 3221225472;
          v26[2] = __19__PTEffect_render___block_invoke_119;
          v26[3] = &unk_1E822A528;
          v27 = v4;
          v29 = frameId;
          v28 = v13;
          v6 = -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:](v28, "render:waitUntilCompleted:gpuCompleted:", v27, v20, v26);
          if (v6)
          {
            _PTLogSystem();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              -[PTEffect render:].cold.2();

          }
        }
        else
        {
          PTDefaultsFlush(v19);
          objc_msgSend(v4, "setOutColorBufferWriteSkipped:", -[PTEffectDescriptor allowSkipOutColorBufferWrite](self->_effectDescriptor, "allowSkipOutColorBufferWrite"));
          if (-[PTEffectDescriptor allowSkipOutColorBufferWrite](self->_effectDescriptor, "allowSkipOutColorBufferWrite"))
          {
            v6 = 0;
          }
          else
          {
            if (!self->_pixelTransferSession && VTPixelTransferSessionCreate(0, &self->_pixelTransferSession))
            {
              _PTLogSystem();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                -[PTEffect render:].cold.2();

            }
            v6 = VTPixelTransferSessionTransferImage(self->_pixelTransferSession, v7, v9);
            if (v6)
            {
              _PTLogSystem();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                -[PTEffect render:].cold.2();

            }
          }
          objc_msgSend(v4, "setOutPersonSegmentationMatteBuffer:", 0);
          -[PTMetalContext commit](self->_metalContext, "commit");
          objc_msgSend(v4, "outColorBufferWriteSkipped");
          kdebug_trace();
        }
        if (!-[PTMetalContext isCommandBufferCommitted](self->_metalContext, "isCommandBufferCommitted"))
        {
          _PTLogSystem();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[PTEffect render:].cold.1();

          v6 = -9;
        }
        self->_lastFrameTime = v11;
        ++self->_frameId;
      }
    }

  }
  else
  {
    _PTLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[PTEffect render:].cold.1();

    v6 = -9;
  }

  return v6;
}

- (void)keepOldDelegateAlive:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  if (v4)
  {
    -[PTMetalContext commandQueue](self->_metalContext, "commandQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "commandBuffer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      _PTLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[PTEffect updateEffectDelegate:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __33__PTEffect_keepOldDelegateAlive___block_invoke;
    v15[3] = &unk_1E822A0B0;
    v16 = v4;
    objc_msgSend(v6, "addCompletedHandler:", v15);
    objc_msgSend(v6, "commit");

  }
}

- (int)_setEffectType:(unint64_t)a3
{
  if (-[PTEffectDescriptor activeEffectType](self->_effectDescriptor, "activeEffectType") != a3)
    -[PTEffectDescriptor setActiveEffectType:](self->_effectDescriptor, "setActiveEffectType:", a3);
  return 0;
}

- (void)_setEffectQuality:(int64_t)a3
{
  if (-[PTEffectDescriptor effectQuality](self->_effectDescriptor, "effectQuality") != a3)
  {
    self->_rebuildEffect |= (a3 > 109) ^ (-[PTEffectDescriptor effectQuality](self->_effectDescriptor, "effectQuality") > 109);
    -[PTEffectDescriptor setEffectQuality:](self->_effectDescriptor, "setEffectQuality:", a3);
  }
}

- (PTEffect)initWithFormat:(opaqueCMFormatDescription *)a3 metalCommandQueue:(id)a4 availableEffectTypes:(unint64_t)a5 activeEffectType:(unint64_t)a6 effectQuality:(int64_t)a7
{
  return -[PTEffect initWithFormat:metalCommandQueue:availableEffectTypes:activeEffectType:prewarmOnly:effectQuality:](self, "initWithFormat:metalCommandQueue:availableEffectTypes:activeEffectType:prewarmOnly:effectQuality:", a3, a4, a5, a6, 0, a7);
}

- (int)reconfigure:(id)a3
{
  id v4;
  NSObject *v5;
  PTEffectDescriptor *v6;
  PTEffectDescriptor *effectDescriptor;
  PTEffectRenderer *delegate;
  int v9;
  int v11;
  PTEffect *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _PTLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218752;
    v12 = self;
    v13 = 2048;
    v14 = objc_msgSend(v4, "activeEffectType");
    v15 = 2048;
    v16 = objc_msgSend(v4, "availableEffectTypes");
    v17 = 2048;
    v18 = objc_msgSend(v4, "effectQuality");
    _os_log_impl(&dword_1C9281000, v5, OS_LOG_TYPE_DEFAULT, "Configure PTEffect (ptr %p). Type: %lu AvailableTypes: %lu quality: %lu", (uint8_t *)&v11, 0x2Au);
  }

  os_unfair_lock_lock(&self->_delegateLock);
  v6 = (PTEffectDescriptor *)objc_msgSend(v4, "copy");
  effectDescriptor = self->_effectDescriptor;
  self->_effectDescriptor = v6;

  delegate = self->_delegate;
  self->_delegate = 0;

  os_unfair_lock_unlock(&self->_delegateLock);
  v9 = -[PTEffect updateEffectDelegate:](self, "updateEffectDelegate:", 0);
  if (-[PTEffectDescriptor syncInitialization](self->_effectDescriptor, "syncInitialization")
    || sForceSynchronousInitialization == 1)
  {
    dispatch_sync((dispatch_queue_t)self->_asyncInitQueue, &__block_literal_global_3);
    if (sForceSynchronousInitialization == 1)
      dispatch_sync((dispatch_queue_t)self->_asyncInitQueue, &__block_literal_global_110);
  }

  return v9;
}

- (PTEffect)initWithFormat:(opaqueCMFormatDescription *)a3 metalCommandQueue:(id)a4 availableEffectTypes:(unint64_t)a5 activeEffectType:(unint64_t)a6 prewarmOnly:(BOOL)a7 effectQuality:(int64_t)a8
{
  _BOOL8 v9;
  id v14;
  void *v15;
  unint64_t Dimensions;
  unint64_t v17;
  PTEffect *v18;

  v9 = a7;
  v14 = a4;
  v15 = (void *)objc_opt_new();
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3);
  LODWORD(a3) = Dimensions;
  v17 = HIDWORD(Dimensions);
  objc_msgSend(v15, "setMetalCommandQueue:", v14);

  objc_msgSend(v15, "setColorSize:", (double)(int)a3, (double)(int)v17);
  objc_msgSend(v15, "setAvailableEffectTypes:", a5);
  objc_msgSend(v15, "setActiveEffectType:", a6);
  objc_msgSend(v15, "setPrewarmOnly:", v9);
  objc_msgSend(v15, "setEffectQuality:", a8);
  v18 = -[PTEffect initWithDescriptor:](self, "initWithDescriptor:", v15);

  return v18;
}

+ (PTEffectPixelBufferDescriptor)personSegmentationMatteFormatForColorSize:(SEL)a3
{
  return +[PTEffectRenderer segmentationMatteFormatForColorSize:](PTEffectRenderer, "segmentationMatteFormatForColorSize:", a4.width, a4.height);
}

uint64_t __33__PTEffect_updateEffectDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  kdebug_trace();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(*(id *)(a1 + 32), "keepOldDelegateAlive:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(*(id *)(a1 + 40), "availableEffectTypes");
  objc_msgSend(*(id *)(a1 + 40), "laguna");
  return kdebug_trace();
}

uint64_t __33__PTEffect_updateEffectDelegate___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  PTEffectRenderer *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  PTEffectRenderer *v9;

  kdebug_trace();
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) && !*(_BYTE *)(a1 + 83))
  {
    v2 = objc_opt_new();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = v2;

  }
  v5 = -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]([PTEffectRenderer alloc], "initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  if (!v5)
  {
    _PTLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __33__PTEffect_updateEffectDelegate___block_invoke_2_cold_1();

  }
  -[PTEffectRenderer setDebug:](v5, "setDebug:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(*(id *)(a1 + 32), "keepOldDelegateAlive:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 8);
  *(_QWORD *)(v7 + 8) = v5;
  v9 = v5;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(*(id *)(a1 + 40), "availableEffectTypes");
  objc_msgSend(*(id *)(a1 + 40), "laguna");

  return kdebug_trace();
}

void __33__PTEffect_keepOldDelegateAlive___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = a1 + 32;
  v2 = *(_QWORD *)(a1 + 32);
  _PTLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __33__PTEffect_keepOldDelegateAlive___block_invoke_cold_2(v1, v4, v5, v6, v7, v8, v9, v10);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __33__PTEffect_keepOldDelegateAlive___block_invoke_cold_1();
  }

}

- (void)dealloc
{
  OpaqueVTPixelTransferSession *pixelTransferSession;
  objc_super v4;

  pixelTransferSession = self->_pixelTransferSession;
  if (pixelTransferSession)
    CFRelease(pixelTransferSession);
  v4.receiver = self;
  v4.super_class = (Class)PTEffect;
  -[PTEffect dealloc](&v4, sel_dealloc);
}

+ (int)prewarmWithFormat:(opaqueCMFormatDescription *)a3 metalCommandQueue:(id)a4 effectType:(unint64_t)a5 sharedResources:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t Dimensions;
  unint64_t v14;
  PTEffect *v15;
  int v16;

  v9 = a4;
  v10 = a6;
  v11 = (void *)MEMORY[0x1CAA3ACDC]();
  v12 = (void *)objc_opt_new();
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3);
  LODWORD(a3) = Dimensions;
  v14 = HIDWORD(Dimensions);
  objc_msgSend(v12, "setMetalCommandQueue:", v9);
  objc_msgSend(v12, "setColorSize:", (double)(int)a3, (double)(int)v14);
  objc_msgSend(v12, "setAvailableEffectTypes:", a5);
  objc_msgSend(v12, "setActiveEffectType:", a5);
  objc_msgSend(v12, "setPrewarmOnly:", 1);
  objc_msgSend(v12, "setSyncInitialization:", 1);
  objc_msgSend(v12, "setEffectQuality:", 100);
  v15 = -[PTEffect initWithDescriptor:sharedResources:]([PTEffect alloc], "initWithDescriptor:sharedResources:", v12, v10);
  -[PTEffect waitForInitialization](v15, "waitForInitialization");
  if (v15)
    v16 = 0;
  else
    v16 = -1;

  objc_autoreleasePoolPop(v11);
  return v16;
}

+ (int)prewarmForMediaserverd
{
  return +[PTEffect prewarmForCameraCaptured](PTEffect, "prewarmForCameraCaptured");
}

+ (int)prewarmForCameraCaptured
{
  double v2;
  void *v3;
  void *v4;
  int v5;
  const __CFAllocator *v6;
  int v7;
  int v8;
  int32_t v9;
  int32_t v10;
  int v11;
  NSObject *v12;
  CFTimeInterval v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v31;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  uint8_t buf[4];
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = CACurrentMediaTime();
  v31 = MTLCreateSystemDefaultDevice();
  v3 = (void *)objc_msgSend(v31, "newCommandQueue");
  v4 = (void *)objc_opt_new();
  v5 = 0;
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  do
  {
    if (v5 == 1)
      v7 = 1280;
    else
      v7 = 960;
    if (v5 == 1)
      v8 = 720;
    else
      v8 = 540;
    if (v5)
      v9 = v7;
    else
      v9 = 1920;
    if (v5)
      v10 = v8;
    else
      v10 = 1080;
    formatDescriptionOut = 0;
    CMVideoFormatDescriptionCreate(v6, 0x34323076u, v9, v10, 0, &formatDescriptionOut);
    v11 = +[PTEffect prewarmWithFormat:metalCommandQueue:effectType:sharedResources:](PTEffect, "prewarmWithFormat:metalCommandQueue:effectType:sharedResources:", formatDescriptionOut, v3, 83, v4);
    if (v11)
    {
      _PTLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v34 = v11;
        _os_log_error_impl(&dword_1C9281000, v12, OS_LOG_TYPE_ERROR, "Failed to prewarm PTEffect SL+SDOF (%d)", buf, 8u);
      }

    }
    if (formatDescriptionOut)
      CFRelease(formatDescriptionOut);
    ++v5;
  }
  while (v5 != 3);
  v13 = CACurrentMediaTime() - v2;
  _PTLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 <= 1.0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[PTEffect prewarmForCameraCaptured].cold.2(v15, v23, v24, v25, v26, v27, v28, v29);
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    +[PTEffect prewarmForCameraCaptured].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
  }

  return v11;
}

double __19__PTEffect_render___block_invoke(uint64_t a1)
{
  double result;

  *(double *)(*(_QWORD *)(a1 + 32) + 96) = *(double *)(a1 + 40) + -0.0333333333;
  result = *(double *)(a1 + 40) + -0.0333333333;
  *(double *)(*(_QWORD *)(a1 + 32) + 104) = result;
  return result;
}

uint64_t __19__PTEffect_render___block_invoke_119(uint64_t a1)
{
  void *v2;
  _OWORD v4[3];

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "transform");
  else
    memset(v4, 0, sizeof(v4));
  +[PTUtil getRotationDegreesFromAffineTransform:](PTUtil, "getRotationDegreesFromAffineTransform:", v4);
  objc_msgSend(*(id *)(a1 + 40), "effectQuality");
  objc_msgSend(*(id *)(a1 + 32), "outColorBufferWriteSkipped");
  return kdebug_trace();
}

- (int)renderReaction:(id)a3 effectRenderRequest:(id)a4
{
  id v6;
  id v7;
  int v8;
  PTEffectRenderer *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  CMRemoveAttachment((CMAttachmentBearerRef)objc_msgSend(v7, "outColorBuffer"), CFSTR("ReactionEffectComplexity"));
  -[PTMetalContext setCommandBuffer:](self->_metalContext, "setCommandBuffer:", v6);
  v8 = -[PTEffect validateRenderRequest:reactionOnly:](self, "validateRenderRequest:reactionOnly:", v7, 1);
  if (!v8)
  {
    os_unfair_lock_lock(&self->_delegateLock);
    v9 = self->_delegate;
    os_unfair_lock_unlock(&self->_delegateLock);
    v8 = -[PTEffectRenderer renderReaction:effectRenderRequest:](v9, "renderReaction:effectRenderRequest:", v6, v7);
    if (-[PTMetalContext isCommandBufferCommitted](self->_metalContext, "isCommandBufferCommitted"))
    {
      _PTLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[PTEffect renderReaction:effectRenderRequest:].cold.1();

      v8 = -14;
    }
    -[PTMetalContext setCommandBuffer:](self->_metalContext, "setCommandBuffer:", 0);

  }
  return v8;
}

- (void)reset
{
  os_unfair_lock_s *p_delegateLock;
  void *v4;
  id v5;

  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  -[PTMetalContext commandQueue](self->_metalContext, "commandQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commandBuffer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PTEffectRenderer reset:](self->_delegate, "reset:", v5);
  -[PTHumanDetections reset](self->_humanDetections, "reset");
  objc_msgSend(v5, "commit");
  objc_msgSend(v5, "waitUntilScheduled");
  os_unfair_lock_unlock(p_delegateLock);

}

- (void)removeAllActiveReactions
{
  os_unfair_lock_s *p_delegateLock;

  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  -[PTEffectRenderer removeAllActiveReactions](self->_delegate, "removeAllActiveReactions");
  os_unfair_lock_unlock(p_delegateLock);
}

- (void)setDebug:(int64_t)a3
{
  os_unfair_lock_s *p_delegateLock;

  self->_debugType = a3;
  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  -[PTEffectRenderer setDebug:](self->_delegate, "setDebug:", self->_debugType);
  os_unfair_lock_unlock(p_delegateLock);
}

+ (void)disableAsynchronousWork
{
  sForceSynchronousInitialization = 1;
  +[PTSyntheticLight disableAsynchronousWork](PTSyntheticLight, "disableAsynchronousWork");
}

- (int)waitForInitialization
{
  dispatch_async_and_wait((dispatch_queue_t)self->_asyncInitQueue, &__block_literal_global_122);
  return 0;
}

- (int64_t)effectQuality
{
  return -[PTEffectDescriptor effectQuality](self->_effectDescriptor, "effectQuality");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_humanDetections, 0);
  objc_storeStrong((id *)&self->_effectDescriptor, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_faceAttributesNetwork, 0);
  objc_storeStrong((id *)&self->_asyncInitQueue, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)initWithDescriptor:(uint64_t)a3 sharedResources:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(int)a1 sharedResources:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "updateEffectDelegate failed %i", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_12();
}

- (void)updateEffectDelegate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __33__PTEffect_updateEffectDelegate___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "PTEffectRendererSDOF is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __33__PTEffect_keepOldDelegateAlive___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Should never happen", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __33__PTEffect_keepOldDelegateAlive___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9281000, a2, a3, "Releasing reference to %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)prewarmForCameraCaptured
{
  OUTLINED_FUNCTION_0_0(&dword_1C9281000, a1, a3, "Prewarm pteffect took %f seconds", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)validPixelBuffer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Pixelbuffer not backed by iosurface", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)validPixelBuffer:(unsigned int)a1 .cold.2(unsigned int a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromFourCharCode(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "Unexpected pixelformat %@", (uint8_t *)&v4, 0xCu);

}

- (void)validPixelBuffer:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "10 bit YUV is unexpected", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)render:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Commandbuffer is not committed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)render:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_0(&dword_1C9281000, v0, v1, "Assertion failed %s %i", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)render:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Error updateEffectDelegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)renderReaction:effectRenderRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Commandbuffer is committed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

@end
