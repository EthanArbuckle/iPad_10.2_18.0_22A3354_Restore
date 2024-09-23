@implementation TLAttentionAwarenessEffectCoordinator

- (TLAttentionAwarenessEffectCoordinator)initWithEffectParameters:(id)a3 audioSession:(id)a4
{
  float var2;
  uint64_t v6;
  id v8;
  TLAttentionAwarenessEffectCoordinator *v9;
  TLAttentionAwarenessEffectCoordinator *v10;
  NSMutableSet *v11;
  NSMutableSet *effectAudioTapContexts;
  objc_super v14;

  var2 = a3.var2;
  v6 = *(_QWORD *)&a3.var0;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TLAttentionAwarenessEffectCoordinator;
  v9 = -[TLAttentionAwarenessEffectCoordinator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_audioSession, a4);
    os_unfair_lock_lock(&v10->_lock);
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    effectAudioTapContexts = v10->_effectAudioTapContexts;
    v10->_effectAudioTapContexts = v11;

    *(_QWORD *)&v10->_effectParameters.shouldBypassLowPassFilter = v6;
    v10->_effectParameters.effectMix = var2;
    os_unfair_lock_unlock(&v10->_lock);
  }

  return v10;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  NSMutableSet *effectAudioTapContexts;
  objc_super v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  effectAudioTapContexts = self->_effectAudioTapContexts;
  self->_effectAudioTapContexts = 0;

  os_unfair_lock_unlock(p_lock);
  v5.receiver = self;
  v5.super_class = (Class)TLAttentionAwarenessEffectCoordinator;
  -[TLAttentionAwarenessEffectCoordinator dealloc](&v5, sel_dealloc);
}

- (id)audioMixForAsset:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  TLAttentionAwarenessEffectAudioTapContext *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v21;
  CFTypeRef cf;
  int v23;
  TLAttentionAwarenessEffectAudioTapContext *v24;
  void (*v25)(const opaqueMTAudioProcessingTap *, void *, void **);
  void (*v26)(const opaqueMTAudioProcessingTap *);
  void (*v27)(const opaqueMTAudioProcessingTap *, uint64_t, const AudioStreamBasicDescription *);
  void (*v28)(const opaqueMTAudioProcessingTap *);
  void (*v29)(const opaqueMTAudioProcessingTap *, uint64_t, unsigned int, AudioBufferList *, uint64_t *, unsigned int *);
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v21 = v4;
  objc_msgSend(v4, "tracks");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v31;
    v8 = *MEMORY[0x1E0C8A7A0];
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v7)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v9);
      objc_msgSend(v10, "mediaType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v8);

      if ((v12 & 1) != 0)
        break;
      if (v6 == (id)++v9)
      {
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v6 = v10;

    if (!v6)
    {
      v13 = 0;
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x1E0C8B258], "audioMix");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_21;
    objc_msgSend(MEMORY[0x1E0C8B260], "audioMixInputParametersWithTrack:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = objc_alloc_init(TLAttentionAwarenessEffectAudioTapContext);
      -[TLAttentionAwarenessEffectAudioTapContext setEffectCoordinator:](v15, "setEffectCoordinator:", self);
      os_unfair_lock_lock(&self->_lock);
      -[NSMutableSet addObject:](self->_effectAudioTapContexts, "addObject:", v15);
      os_unfair_lock_unlock(&self->_lock);
      v23 = 0;
      v24 = v15;
      v25 = _TLAttentionAwarenessEffectAudioTapInitialize;
      v26 = _TLAttentionAwarenessEffectAudioTapFinalize;
      v27 = _TLAttentionAwarenessEffectAudioTapPrepare;
      v28 = _TLAttentionAwarenessEffectAudioTapUnprepare;
      v29 = _TLAttentionAwarenessEffectAudioTapProcess;
      cf = 0;
      v34 = 0;
      v35 = &v34;
      v36 = 0x2020000000;
      v16 = getMTAudioProcessingTapCreateSymbolLoc(void)::ptr;
      v37 = getMTAudioProcessingTapCreateSymbolLoc(void)::ptr;
      if (!getMTAudioProcessingTapCreateSymbolLoc(void)::ptr)
      {
        v17 = (void *)MediaToolboxLibrary();
        v16 = dlsym(v17, "MTAudioProcessingTapCreate");
        v35[3] = (uint64_t)v16;
        getMTAudioProcessingTapCreateSymbolLoc(void)::ptr = v16;
      }
      _Block_object_dispose(&v34, 8);
      if (!v16)
      {
        dlerror();
        abort_report_np();
        __break(1u);
      }
      if (!((unsigned int (*)(_QWORD, int *, uint64_t, CFTypeRef *))v16)(*MEMORY[0x1E0C9AE00], &v23, 1, &cf))
      {
        objc_msgSend(v14, "setAudioTapProcessor:", cf);
        CFRelease(cf);
        v38 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setInputParameters:", v18);

      }
    }
  }
  else
  {
LABEL_9:
    v13 = 0;
    v14 = v5;
  }

LABEL_21:
  v19 = v13;

  return v19;
}

- ($8F739DADA627152431EF347AE70D5328)effectParameters
{
  TLAttentionAwarenessEffectCoordinator *v2;
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  _BOOL8 v5;
  float v6;
  $8F739DADA627152431EF347AE70D5328 result;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = *(_QWORD *)&v2->_effectParameters.shouldBypassLowPassFilter;
  *(float *)&v2 = v2->_effectParameters.effectMix;
  os_unfair_lock_unlock(p_lock);
  v5 = v4;
  v6 = *(float *)&v2;
  result.var0 = v5;
  result.var1 = *((float *)&v5 + 1);
  result.var2 = v6;
  return result;
}

- (void)setEffectParameters:(id)a3
{
  float var2;
  uint64_t v4;
  os_unfair_lock_s *p_lock;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  var2 = a3.var2;
  v4 = *(_QWORD *)&a3.var0;
  v18 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  *(_QWORD *)&self->_effectParameters.shouldBypassLowPassFilter = v4;
  self->_effectParameters.effectMix = var2;
  v7 = (void *)-[NSMutableSet copy](self->_effectAudioTapContexts, "copy");
  os_unfair_lock_unlock(p_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "effectProcessor", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setEffectParameters:", v4, LODWORD(var2));

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)setEffectParameters:(id)a3 effectMixFadeDuration:(double)a4
{
  float var2;
  uint64_t v6;
  os_unfair_lock_s *p_lock;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  var2 = a3.var2;
  v6 = *(_QWORD *)&a3.var0;
  v20 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  *(_QWORD *)&self->_effectParameters.shouldBypassLowPassFilter = v6;
  self->_effectParameters.effectMix = var2;
  v9 = (void *)-[NSMutableSet copy](self->_effectAudioTapContexts, "copy");
  os_unfair_lock_unlock(p_lock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "effectProcessor", (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setEffectParameters:effectMixFadeDuration:", v6, LODWORD(var2), a4);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (void)_prepareAudioProcessingWithEffectAudioTapContext:(id)a3 maximumNumberOfFrames:(unsigned int)a4 processingFormat:(const AudioStreamBasicDescription *)a5
{
  uint64_t v6;
  id v8;
  TLAttentionAwarenessEffectProcessor *effectProcessor;
  void *v10;
  TLAttentionAwarenessEffectProcessor *v11;
  AVAudioSession *audioSession;
  uint64_t v13;
  unsigned int v14;
  TLAttentionAwarenessEffectProcessor *v15;
  TLAttentionAwarenessEffectProcessor *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  effectProcessor = self->_effectProcessor;
  if (!effectProcessor)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initWithStreamDescription:", a5);
    v11 = [TLAttentionAwarenessEffectProcessor alloc];
    audioSession = self->_audioSession;
    v13 = -[TLAttentionAwarenessEffectCoordinator effectParameters](self, "effectParameters");
    v15 = -[TLAttentionAwarenessEffectProcessor initWithProcessingFormat:framesPerRender:audioSession:effectParameters:](v11, "initWithProcessingFormat:framesPerRender:audioSession:effectParameters:", v10, v6, audioSession, v13, v14);
    v16 = self->_effectProcessor;
    self->_effectProcessor = v15;

    objc_msgSend(v8, "setEffectProcessor:", self->_effectProcessor);
    effectProcessor = self->_effectProcessor;
  }
  if (!-[TLAttentionAwarenessEffectProcessor isStarted](effectProcessor, "isStarted"))
  {
    TLLogPlayback();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[TLAttentionAwarenessEffectCoordinator _prepareAudioProcessingWithEffectAudioTapContext:maximumNumberOfFrames:processingFormat:].cold.1((uint64_t)self, v17, v18, v19, v20, v21, v22, v23);

    -[TLAttentionAwarenessEffectProcessor start](self->_effectProcessor, "start");
  }

}

- (void)_unprepareAudioProcessingWithEffectAudioTapContext:(id)a3
{
  id v4;
  TLAttentionAwarenessEffectProcessor *effectProcessor;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  effectProcessor = self->_effectProcessor;
  if (effectProcessor && -[TLAttentionAwarenessEffectProcessor isStarted](effectProcessor, "isStarted"))
  {
    TLLogPlayback();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[TLAttentionAwarenessEffectCoordinator _unprepareAudioProcessingWithEffectAudioTapContext:].cold.1((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);

    objc_msgSend(v4, "effectProcessor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stop");

  }
}

- (void)_finalizeAudioProcessingWithEffectAudioTapContext:(id)a3
{
  os_unfair_lock_s *p_lock;
  TLAttentionAwarenessEffectCoordinator *v5;
  id v6;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  objc_msgSend(v6, "setEffectProcessor:", 0);
  v5 = self;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](v5->_effectAudioTapContexts, "removeObject:", v6);
  os_unfair_lock_unlock(p_lock);

}

- (void)_processAudioWithEffectAudioTapContext:(id)a3 bufferList:(AudioBufferList *)a4 numberOfFramesRequested:(unsigned int)a5 numberOfFramesToProcess:(unsigned int)a6
{
  uint64_t v6;
  id v10;
  void *v11;
  unsigned int *v12;
  unsigned int *v13;
  unint64_t v14;
  unint64_t v15;
  size_t v16;
  void **p_mData;
  size_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint8_t buf[4];
  TLAttentionAwarenessEffectCoordinator *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  size_t v27;
  __int16 v28;
  size_t v29;
  uint64_t v30;

  v6 = *(_QWORD *)&a6;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(v10, "effectProcessor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (unsigned int *)objc_msgSend(v11, "render:numberOfFrames:", a4, v6);
  v13 = v12;
  if (v12)
  {
    if (*v12)
    {
      v14 = 0;
      v15 = 0;
      v16 = 4 * a5;
      v21 = a5;
      p_mData = &a4->mBuffers[0].mData;
      do
      {
        v18 = v13[v14 / 4 + 3];
        if (v16 <= v18)
        {
          memcpy(p_mData[v14 / 8], *(const void **)&v13[v14 / 4 + 4], v16);
        }
        else
        {
          TLLogPlayback();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138544130;
            v23 = self;
            v24 = 2048;
            v25 = v21;
            v26 = 2048;
            v27 = v16;
            v28 = 2048;
            v29 = v18;
            _os_log_error_impl(&dword_1D33D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Requested more frames (%lu, with size %zu) than available in the buffer (of size %zu).", buf, 0x2Au);
          }

        }
        ++v15;
        v14 += 16;
      }
      while (v15 < *v13);
    }
  }
  else
  {
    TLLogPlayback();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[TLAttentionAwarenessEffectCoordinator _processAudioWithEffectAudioTapContext:bufferList:numberOfFramesRequested:numberOfFramesToProcess:].cold.1(a5, v6, v20);

  }
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_effectProcessor, 0);
  objc_storeStrong((id *)&self->_effectAudioTapContexts, 0);
}

- (void)_prepareAudioProcessingWithEffectAudioTapContext:(uint64_t)a3 maximumNumberOfFrames:(uint64_t)a4 processingFormat:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D33D5000, a2, a3, "%{public}@: starting TLAttentionAwarenessEffectProcessor", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)_unprepareAudioProcessingWithEffectAudioTapContext:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D33D5000, a2, a3, "%{public}@: stopping TLAttentionAwarenessEffectProcessor", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)_processAudioWithEffectAudioTapContext:(os_log_t)log bufferList:numberOfFramesRequested:numberOfFramesToProcess:.cold.1(unsigned int a1, unsigned int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_error_impl(&dword_1D33D5000, log, OS_LOG_TYPE_ERROR, "{public}@: Failed to process and render AudioBufferList. { requestedFrames=%lu, framesToProcess=%lu }", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_7();
}

@end
