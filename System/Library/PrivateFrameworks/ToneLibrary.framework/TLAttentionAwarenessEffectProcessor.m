@implementation TLAttentionAwarenessEffectProcessor

- (TLAttentionAwarenessEffectProcessor)initWithProcessingFormat:(id)a3 framesPerRender:(unsigned int)a4 audioSession:(id)a5 effectParameters:(id)a6
{
  id v8;
  TLAttentionAwarenessEffectProcessor *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *accessQueueLabel;
  dispatch_queue_t v17;
  OS_dispatch_queue *accessQueue;
  AVAudioEngine *v19;
  AVAudioEngine *engine;
  AVAudioEngine *v21;
  char v22;
  id v23;
  char v24;
  uint64_t v25;
  AVAudioInputNode *inputNode;
  AVAudioUnitEQ *v27;
  AVAudioUnitEQ *lowPassFilter;
  AVAudioUnitReverb *v29;
  AVAudioUnitReverb *reverb;
  AVAudioEngine *v31;
  AVAudioUnitReverb *v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *v36;
  AVAudioEngine *v37;
  AVAudioInputNode *v38;
  void *v39;
  AVAudioUnitEQ *v40;
  id v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  TLAttentionAwarenessEffectProcessor *v45;
  void *v46;
  AVAudioUnitReverb *v47;
  char v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  double v52;
  uint64_t v53;
  AVAudioPCMBuffer *destinationPCMBuffer;
  void *v55;
  void *v57;
  void *v58;
  int v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  float var2;
  uint64_t v65;
  void *v66;
  id v67;
  _QWORD v69[4];
  id v70;
  id v71;
  _QWORD v72[4];
  TLAttentionAwarenessEffectProcessor *v73;
  id v74;
  id v75;
  objc_super v76;
  _QWORD v77[2];
  _BYTE location[12];
  __int16 v79;
  _BYTE v80[18];
  uint64_t v81;

  var2 = a6.var2;
  v65 = *(_QWORD *)&a6.var0;
  v81 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v67 = a5;
  v76.receiver = self;
  v76.super_class = (Class)TLAttentionAwarenessEffectProcessor;
  v9 = -[TLAttentionAwarenessEffectProcessor init](&v76, sel_init);
  if (v9)
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.%@-%@"), v13, v14, CFSTR("AccessQueue"));
    v15 = objc_claimAutoreleasedReturnValue();
    accessQueueLabel = v9->_accessQueueLabel;
    v9->_accessQueueLabel = (NSString *)v15;

    v17 = dispatch_queue_create(-[NSString UTF8String](v9->_accessQueueLabel, "UTF8String"), 0);
    accessQueue = v9->_accessQueue;
    v9->_accessQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v9->_audioSession, a5);
    v19 = (AVAudioEngine *)objc_alloc_init(MEMORY[0x1E0C89A88]);
    engine = v9->_engine;
    v9->_engine = v19;

    v21 = v9->_engine;
    v75 = 0;
    v22 = -[AVAudioEngine enableManualRenderingMode:format:maximumFrameCount:error:](v21, "enableManualRenderingMode:format:maximumFrameCount:error:", 1, v8, a4, &v75);
    v23 = v75;
    if (v23)
      v24 = v22;
    else
      v24 = 1;
    if ((v24 & 1) != 0)
    {
      -[AVAudioEngine inputNode](v9->_engine, "inputNode");
      v25 = objc_claimAutoreleasedReturnValue();
      inputNode = v9->_inputNode;
      v9->_inputNode = (AVAudioInputNode *)v25;

      v27 = (AVAudioUnitEQ *)objc_alloc_init(MEMORY[0x1E0C89B30]);
      lowPassFilter = v9->_lowPassFilter;
      v9->_lowPassFilter = v27;

      v29 = (AVAudioUnitReverb *)objc_alloc_init(MEMORY[0x1E0C89B40]);
      reverb = v9->_reverb;
      v9->_reverb = v29;

      -[AVAudioEngine attachNode:](v9->_engine, "attachNode:", v9->_lowPassFilter);
      -[AVAudioEngine attachNode:](v9->_engine, "attachNode:", v9->_reverb);
      -[AVAudioEngine connect:to:format:](v9->_engine, "connect:to:format:", v9->_lowPassFilter, v9->_reverb, v8);
      v31 = v9->_engine;
      v32 = v9->_reverb;
      -[AVAudioEngine mainMixerNode](v31, "mainMixerNode");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioEngine connect:to:fromBus:toBus:format:](v31, "connect:to:fromBus:toBus:format:", v32, v33, 0, 1, v8);

      v34 = objc_alloc(MEMORY[0x1E0C89A70]);
      -[AVAudioEngine mainMixerNode](v9->_engine, "mainMixerNode");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v34, "initWithNode:bus:", v35, 0);

      v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0C89A70]), "initWithNode:bus:", v9->_lowPassFilter, 0);
      v37 = v9->_engine;
      v38 = v9->_inputNode;
      v77[0] = v62;
      v77[1] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioEngine connect:toConnectionPoints:fromBus:format:](v37, "connect:toConnectionPoints:fromBus:format:", v38, v39, 0, v8);

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "URLForResource:withExtension:", CFSTR("PearlID_Equalizer"), CFSTR("aupreset"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v9->_lowPassFilter;
      v74 = v23;
      LOBYTE(v37) = -[AVAudioUnitEQ loadAudioUnitPresetAtURL:error:](v40, "loadAudioUnitPresetAtURL:error:", v61, &v74);
      v41 = v74;

      if ((v37 & 1) == 0)
      {
        TLLogPlayback();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          -[TLAttentionAwarenessEffectProcessor initWithProcessingFormat:framesPerRender:audioSession:effectParameters:].cold.3((uint64_t)v9, v41);

      }
      -[AVAudioUnitEQ bands](v9->_lowPassFilter, "bands");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      TLLogPlayback();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        v59 = -[AVAudioUnitEQ bypass](v9->_lowPassFilter, "bypass");
        v60 = objc_msgSend(v63, "count");
        *(_DWORD *)location = 138543874;
        *(_QWORD *)&location[4] = v9;
        v79 = 1024;
        *(_DWORD *)v80 = v59;
        *(_WORD *)&v80[4] = 2048;
        *(_QWORD *)&v80[6] = v60;
        _os_log_debug_impl(&dword_1D33D5000, v43, OS_LOG_TYPE_DEBUG, "%{public}@: -init. Equalizer bypass: %{BOOL}d. Number of bands: %lu.", location, 0x1Cu);
      }

      v44 = MEMORY[0x1E0C809B0];
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __110__TLAttentionAwarenessEffectProcessor_initWithProcessingFormat_framesPerRender_audioSession_effectParameters___block_invoke;
      v72[3] = &unk_1E952B410;
      v45 = v9;
      v73 = v45;
      objc_msgSend(v63, "enumerateObjectsUsingBlock:", v72);
      objc_msgSend(v66, "URLForResource:withExtension:", CFSTR("PearlID_Reverb"), CFSTR("aupreset"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v9->_reverb;
      v71 = v41;
      v48 = -[AVAudioUnitReverb loadAudioUnitPresetAtURL:error:](v47, "loadAudioUnitPresetAtURL:error:", v46, &v71);
      v23 = v71;

      if ((v48 & 1) == 0)
      {
        TLLogPlayback();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          -[TLAttentionAwarenessEffectProcessor initWithProcessingFormat:framesPerRender:audioSession:effectParameters:].cold.2((uint64_t)v45, v23);

      }
      TLLogPlayback();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        -[TLAttentionAwarenessEffectProcessor initWithProcessingFormat:framesPerRender:audioSession:effectParameters:].cold.1((uint64_t)v45, (id *)&v9->_reverb, v50);

      -[AVAudioEngine mainMixerNode](v9->_engine, "mainMixerNode");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v52) = 1.0;
      objc_msgSend(v51, "setOutputVolume:", v52);

      v53 = objc_msgSend(objc_alloc(MEMORY[0x1E0C89AC0]), "initWithPCMFormat:frameCapacity:", v8, a4);
      destinationPCMBuffer = v45->_destinationPCMBuffer;
      v45->_destinationPCMBuffer = (AVAudioPCMBuffer *)v53;

      -[AVAudioPCMBuffer setFrameLength:](v45->_destinationPCMBuffer, "setFrameLength:", a4);
      objc_initWeak((id *)location, v45);
      v69[0] = v44;
      v69[1] = 3221225472;
      v69[2] = __110__TLAttentionAwarenessEffectProcessor_initWithProcessingFormat_framesPerRender_audioSession_effectParameters___block_invoke_17;
      v69[3] = &unk_1E952B438;
      objc_copyWeak(&v70, (id *)location);
      v55 = (void *)MEMORY[0x1D824F08C](v69);
      if (-[AVAudioInputNode setManualRenderingInputPCMFormat:inputBlock:](v9->_inputNode, "setManualRenderingInputPCMFormat:inputBlock:", v8, v55))
      {
        *(_QWORD *)&v45->_effectParameters.shouldBypassLowPassFilter = v65;
        v45->_effectParameters.effectMix = var2;
        -[TLAttentionAwarenessEffectProcessor _applyEffectParameters:includingEffectMix:](v45, "_applyEffectParameters:includingEffectMix:");
      }
      else
      {

        v45 = 0;
      }

      objc_destroyWeak(&v70);
      objc_destroyWeak((id *)location);

      v9 = (TLAttentionAwarenessEffectProcessor *)v62;
    }
    else
    {
      TLLogPlayback();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v23, "tl_nonRedundantDescription");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "description");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138543874;
        *(_QWORD *)&location[4] = v57;
        v79 = 2114;
        *(_QWORD *)v80 = v58;
        *(_WORD *)&v80[8] = 2048;
        *(_QWORD *)&v80[10] = a4;
        _os_log_error_impl(&dword_1D33D5000, v36, OS_LOG_TYPE_ERROR, "Could not switch engine to offline mode, error %{public}@, format = %{public}@, maximumNumberOfFrames = %ld.", location, 0x20u);

      }
      v45 = 0;
    }

  }
  else
  {
    v45 = 0;
  }

  return v45;
}

void __110__TLAttentionAwarenessEffectProcessor_initWithProcessingFormat_framesPerRender_audioSession_effectParameters___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  double v10;
  float v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  TLLogPlayback();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_msgSend(v5, "filterType");
    objc_msgSend(v5, "gain");
    v10 = v9;
    objc_msgSend(v5, "frequency");
    v12 = 138544642;
    v13 = v7;
    v14 = 2048;
    v15 = a3;
    v16 = 2048;
    v17 = v8;
    v18 = 2048;
    v19 = v10;
    v20 = 2048;
    v21 = v11;
    v22 = 1024;
    v23 = objc_msgSend(v5, "bypass");
    _os_log_debug_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: -init. Equalizer band #%lu: filterType = %ld, gain = %f, frequency = %f, bypass = %{BOOL}d.", (uint8_t *)&v12, 0x3Au);
  }

}

uint64_t __110__TLAttentionAwarenessEffectProcessor_initWithProcessingFormat_framesPerRender_audioSession_effectParameters___block_invoke_17(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = WeakRetained[7];
  else
    v2 = 0;

  return v2;
}

- (void)dealloc
{
  OS_dispatch_queue *accessQueue;
  NSObject *v4;
  objc_super v5;

  accessQueue = self->_accessQueue;
  self->_accessQueue = 0;
  v4 = accessQueue;

  dispatch_sync(v4, &__block_literal_global_4);
  v5.receiver = self;
  v5.super_class = (Class)TLAttentionAwarenessEffectProcessor;
  -[TLAttentionAwarenessEffectProcessor dealloc](&v5, sel_dealloc);
}

- ($8F739DADA627152431EF347AE70D5328)effectParameters
{
  NSObject *accessQueue;
  uint64_t v3;
  float v4;
  _BOOL8 v5;
  float v6;
  _QWORD v7[6];
  uint64_t v8;
  float *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  $8F739DADA627152431EF347AE70D5328 result;

  v8 = 0;
  v9 = (float *)&v8;
  v10 = 0x3010000000;
  v11 = &unk_1D342FF15;
  v12 = 0;
  v13 = 0;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__TLAttentionAwarenessEffectProcessor_effectParameters__block_invoke;
  v7[3] = &unk_1E952A6F8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(accessQueue, v7);
  v3 = *((_QWORD *)v9 + 4);
  v4 = v9[10];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.var0 = v5;
  result.var1 = *((float *)&v5 + 1);
  result.var2 = v6;
  return result;
}

uint64_t __55__TLAttentionAwarenessEffectProcessor_effectParameters__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v3 = *(_QWORD *)(v1 + 80);
  *(_DWORD *)(v2 + 40) = *(_DWORD *)(v1 + 88);
  *(_QWORD *)(v2 + 32) = v3;
  return result;
}

- (void)setEffectParameters:(id)a3
{
  -[TLAttentionAwarenessEffectProcessor setEffectParameters:effectMixFadeDuration:](self, "setEffectParameters:effectMixFadeDuration:", *(_QWORD *)&a3.var0, LODWORD(a3.var2), 0.0);
}

- (void)setEffectParameters:(id)a3 effectMixFadeDuration:(double)a4
{
  NSObject *accessQueue;
  _QWORD v5[6];
  $8F739DADA627152431EF347AE70D5328 v6;

  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__TLAttentionAwarenessEffectProcessor_setEffectParameters_effectMixFadeDuration___block_invoke;
  v5[3] = &unk_1E952B488;
  v5[4] = self;
  v6 = a3;
  *(double *)&v5[5] = a4;
  dispatch_sync(accessQueue, v5);
}

void __81__TLAttentionAwarenessEffectProcessor_setEffectParameters_effectMixFadeDuration___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v5;
  double v6;
  float v7;
  float v8;
  double v9;
  float v10;
  float v11;
  double v12;
  void *v13;
  float v14;
  float v15;
  float v16;
  float v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  dispatch_source_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD handler[5];
  id v27[2];
  float v28;
  float v29;
  _QWORD v30[4];
  id location;

  TLLogPlayback();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __81__TLAttentionAwarenessEffectProcessor_setEffectParameters_effectMixFadeDuration___block_invoke_cold_1(a1, v2);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(v3 + 88);
  v5 = *(_DWORD *)(a1 + 56);
  *(_QWORD *)(v3 + 80) = *(_QWORD *)(a1 + 48);
  *(_DWORD *)(v3 + 88) = v5;
  objc_msgSend(*(id *)(a1 + 32), "_applyEffectParameters:includingEffectMix:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56), 0);
  LODWORD(v6) = v4;
  objc_msgSend(*(id *)(a1 + 32), "_sanitizeEffectMix:", v6);
  v8 = v7;
  LODWORD(v9) = *(_DWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "_sanitizeEffectMix:", v9);
  v11 = v10;
  if (llroundf(v8 * 8388600.0) != llroundf(v10 * 8388600.0))
  {
    v12 = *(double *)(a1 + 40);
    v13 = *(void **)(a1 + 32);
    if (v12 >= 0.00000011920929)
    {
      objc_msgSend(v13, "_currentEffectMix");
      v15 = v14;
      v16 = v11 - v14;
      v17 = *(double *)(a1 + 40) / 0.00499999989;
      v18 = (void *)llroundf(ceilf(v17));
      v19 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
      if (v19)
        dispatch_source_cancel(v19);
      dispatch_get_global_queue(2, 0);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v20);
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(void **)(v22 + 96);
      *(_QWORD *)(v22 + 96) = v21;

      dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 96), 0, 0x4C4B40uLL, 0xC350uLL);
      objc_initWeak(&location, *(id *)(a1 + 32));
      v30[0] = 0;
      v30[1] = v30;
      v30[2] = 0x2020000000;
      v30[3] = 0;
      v24 = *(_QWORD *)(a1 + 32);
      handler[0] = MEMORY[0x1E0C809B0];
      v25 = *(NSObject **)(v24 + 96);
      handler[2] = __81__TLAttentionAwarenessEffectProcessor_setEffectParameters_effectMixFadeDuration___block_invoke_22;
      handler[3] = &unk_1E952B460;
      handler[1] = 3221225472;
      objc_copyWeak(v27, &location);
      handler[4] = v30;
      v27[1] = v18;
      v28 = v15;
      v29 = v16;
      dispatch_source_set_event_handler(v25, handler);
      dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 96));
      objc_destroyWeak(v27);
      _Block_object_dispose(v30, 8);
      objc_destroyWeak(&location);
    }
    else
    {
      *(float *)&v12 = v11;
      objc_msgSend(v13, "_applyEffectMix:", v12);
    }
  }
}

void __81__TLAttentionAwarenessEffectProcessor_setEffectParameters_effectMixFadeDuration___block_invoke_22(uint64_t a1)
{
  _QWORD *WeakRetained;
  double v3;
  _QWORD *v4;
  NSObject *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    *(float *)&v3 = *(float *)(a1 + 56)
                  + (float)((float)((float)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 1)
                                  / (float)*(uint64_t *)(a1 + 48))
                          * *(float *)(a1 + 60));
    objc_msgSend(WeakRetained, "_applyEffectMix:", v3);
    if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == *(_QWORD *)(a1 + 48))
    {
      v7 = 0;
      v8 = &v7;
      v9 = 0x3032000000;
      v10 = __Block_byref_object_copy__2;
      v11 = __Block_byref_object_dispose__2;
      v12 = 0;
      v5 = v4[1];
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __81__TLAttentionAwarenessEffectProcessor_setEffectParameters_effectMixFadeDuration___block_invoke_23;
      v6[3] = &unk_1E952A6F8;
      v6[4] = v4;
      v6[5] = &v7;
      dispatch_sync(v5, v6);
      dispatch_source_cancel((dispatch_source_t)v8[5]);
      _Block_object_dispose(&v7, 8);

    }
  }

}

void __81__TLAttentionAwarenessEffectProcessor_setEffectParameters_effectMixFadeDuration___block_invoke_23(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 96));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 96);
  *(_QWORD *)(v2 + 96) = 0;

}

- (BOOL)start
{
  AVAudioEngine *engine;
  BOOL v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v9;

  if (-[AVAudioEngine isInManualRenderingMode](self->_engine, "isInManualRenderingMode"))
  {
    engine = self->_engine;
    v9 = 0;
    v4 = -[AVAudioEngine startAndReturnError:](engine, "startAndReturnError:", &v9);
    v5 = v9;
    v6 = v5;
    if (!v4 && v5)
    {
      TLLogPlayback();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[TLAttentionAwarenessEffectProcessor start].cold.1(v6, v7);

    }
  }
  else
  {
    v4 = 0;
  }
  self->_started = 1;
  return v4;
}

- (AudioBufferList)render:(AudioBufferList *)a3 numberOfFrames:(unsigned int)a4
{
  uint64_t v4;
  AudioBufferList *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v10;

  v4 = *(_QWORD *)&a4;
  if (-[AVAudioPCMBuffer frameCapacity](self->_destinationPCMBuffer, "frameCapacity") < a4)
    return 0;
  v10 = 0;
  self->_inputNodeInputBufferList = a3;
  -[AVAudioEngine manualRenderingBlock](self->_engine, "manualRenderingBlock");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, uint64_t, uint64_t, int *))v8)[2](v8, v4, -[AVAudioPCMBuffer mutableAudioBufferList](self->_destinationPCMBuffer, "mutableAudioBufferList"), &v10);
  v7 = (AudioBufferList *)-[AVAudioPCMBuffer mutableAudioBufferList](self->_destinationPCMBuffer, "mutableAudioBufferList");

  return v7;
}

- (void)stop
{
  -[AVAudioEngine stop](self->_engine, "stop");
  self->_started = 0;
}

- (void)_applyEffectMix:(float)a3
{
  AVAudioInputNode *inputNode;
  void *v6;
  double v7;
  AVAudioInputNode *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;

  inputNode = self->_inputNode;
  -[AVAudioEngine mainMixerNode](self->_engine, "mainMixerNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioInputNode destinationForMixer:bus:](inputNode, "destinationForMixer:bus:", v6, 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  *(float *)&v7 = a3;
  objc_msgSend(v12, "setVolume:", v7);
  v8 = self->_inputNode;
  -[AVAudioEngine mainMixerNode](self->_engine, "mainMixerNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioInputNode destinationForMixer:bus:](v8, "destinationForMixer:bus:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v11 = 1.0 - a3;
  objc_msgSend(v10, "setVolume:", v11);

}

- (float)_currentEffectMix
{
  AVAudioInputNode *inputNode;
  void *v3;
  void *v4;
  float v5;
  float v6;

  inputNode = self->_inputNode;
  -[AVAudioEngine mainMixerNode](self->_engine, "mainMixerNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioInputNode destinationForMixer:bus:](inputNode, "destinationForMixer:bus:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "volume");
  v6 = v5;

  return v6;
}

- (float)_sanitizeEffectMix:(float)a3
{
  double v3;

  v3 = a3;
  if (v3 < 0.0)
    v3 = 0.0;
  return fmin(v3, 1.0);
}

- (void)_applyEffectParameters:(id)a3 includingEffectMix:(BOOL)a4
{
  _BOOL4 v4;
  float var2;
  float var1;
  _BOOL8 var0;
  NSObject *v9;
  void *v10;
  float v11;
  BOOL v12;
  float v13;
  float v14;
  double v15;
  NSObject *v16;
  double v17;
  int v18;
  TLAttentionAwarenessEffectProcessor *v19;
  __int16 v20;
  double v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v4 = a4;
  var2 = a3.var2;
  v24 = *MEMORY[0x1E0C80C00];
  var1 = a3.var1;
  var0 = a3.var0;
  if (-[AVAudioUnitEQ bypass](self->_lowPassFilter, "bypass") != a3.var0)
    -[AVAudioUnitEQ setBypass:](self->_lowPassFilter, "setBypass:", var0);
  TLLogPlayback();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[TLAttentionAwarenessEffectProcessor _applyEffectParameters:includingEffectMix:].cold.2((uint64_t)self);

  -[AVAudioSession category](self->_audioSession, "category");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C896A8]))
  {
    if (var1 > 1.0 || (v11 = -20.0, var1 <= 0.875))
    {
      if (var1 > 0.875 || (v11 = -16.0, var1 <= 0.75))
      {
        if (var1 > 0.75 || (v11 = -14.0, var1 <= 0.625))
        {
          if (var1 > 0.625 || (v11 = -11.0, var1 <= 0.5))
          {
            v12 = var1 <= 0.25 || var1 > 0.5;
            v13 = -3.0;
            v14 = -6.0;
LABEL_31:
            if (v12)
              v11 = v13;
            else
              v11 = v14;
          }
        }
      }
    }
  }
  else
  {
    v11 = 0.0;
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C89658]))
    {
      if (var1 > 1.0 || (v11 = -28.0, var1 <= 0.875))
      {
        if (var1 > 0.875 || (v11 = -24.0, var1 <= 0.75))
        {
          if (var1 > 0.75 || (v11 = -22.0, var1 <= 0.625))
          {
            if (var1 > 0.625 || (v11 = -20.0, var1 <= 0.5))
            {
              v12 = var1 <= 0.25 || var1 > 0.5;
              v13 = -12.0;
              v14 = -16.0;
              goto LABEL_31;
            }
          }
        }
      }
    }
  }
  -[AVAudioUnitEQ globalGain](self->_lowPassFilter, "globalGain");
  if (llroundf(*(float *)&v15 * 8388600.0) == llroundf(v11 * 8388600.0))
  {
    TLLogPlayback();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[TLAttentionAwarenessEffectProcessor _applyEffectParameters:includingEffectMix:].cold.1((uint64_t)self);
  }
  else
  {
    *(float *)&v15 = v11;
    -[AVAudioUnitEQ setGlobalGain:](self->_lowPassFilter, "setGlobalGain:", v15);
    TLLogPlayback();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v18 = 138543874;
      v19 = self;
      v20 = 2048;
      v21 = v11;
      v22 = 2114;
      v23 = v10;
      _os_log_debug_impl(&dword_1D33D5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: -_applyEffectParameters:. Set low pass filter global gain to %0.2f for audio session category %{public}@.", (uint8_t *)&v18, 0x20u);
    }
  }

  if (v4)
  {
    *(float *)&v17 = var2;
    -[TLAttentionAwarenessEffectProcessor _applyEffectMix:](self, "_applyEffectMix:", v17);
  }

}

- (void)_assertRunningOnAccessQueue
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1D33D5000, v0, v1, "Expected to be running in access queue.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)_assertNotRunningOnAccessQueue
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1D33D5000, v0, v1, "Expected not to be running in access queue.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectMixFadingTimer, 0);
  objc_storeStrong((id *)&self->_reverb, 0);
  objc_storeStrong((id *)&self->_lowPassFilter, 0);
  objc_storeStrong((id *)&self->_inputNode, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_destinationPCMBuffer, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_accessQueueLabel, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)initWithProcessingFormat:(NSObject *)a3 framesPerRender:audioSession:effectParameters:.cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a2, "wetDryMix");
  v6 = 138543618;
  v7 = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_1D33D5000, a3, v5, "%{public}@: -init. Reverb wet dry mix: %f.", (uint8_t *)&v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProcessingFormat:(uint64_t)a1 framesPerRender:(void *)a2 audioSession:effectParameters:.cold.2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "tl_nonRedundantDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(&dword_1D33D5000, v3, v4, "%{public}@: -init. Error loading reverb preset: %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

- (void)initWithProcessingFormat:(uint64_t)a1 framesPerRender:(void *)a2 audioSession:effectParameters:.cold.3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "tl_nonRedundantDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(&dword_1D33D5000, v3, v4, "%{public}@: -init. Error loading equalizer preset: %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

void __81__TLAttentionAwarenessEffectProcessor_setEffectParameters_effectMixFadeDuration___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v3 + 64), "globalGain");
  v5 = 138543618;
  v6 = v3;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_1D33D5000, a2, v4, "%{public}@: -setEffectParameters:. Current low pass filter global gain: %0.2f.", (uint8_t *)&v5);
  OUTLINED_FUNCTION_2();
}

- (void)start
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "tl_nonRedundantDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1D33D5000, a2, OS_LOG_TYPE_ERROR, "Could not start engine: %{public}@.", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_2();
}

- (void)_applyEffectParameters:(uint64_t)a1 includingEffectMix:.cold.1(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_1D33D5000, v1, v2, "%{public}@: -_applyEffectParameters:. Low pass filter global gain is already set to %0.2f.", (uint8_t *)&v3);
}

- (void)_applyEffectParameters:(uint64_t)a1 includingEffectMix:.cold.2(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_1D33D5000, v1, v2, "%{public}@: -_applyEffectParameters:. Volume for low pass filter global gain: %0.2f.", (uint8_t *)&v3);
}

@end
