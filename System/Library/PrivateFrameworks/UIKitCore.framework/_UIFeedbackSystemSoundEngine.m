@implementation _UIFeedbackSystemSoundEngine

+ (id)_internalQueue
{
  if (qword_1ECD7B150 != -1)
    dispatch_once(&qword_1ECD7B150, &__block_literal_global_195);
  return (id)_MergedGlobals_7_4;
}

+ (id)sharedEngine
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___UIFeedbackSystemSoundEngine_sharedEngine__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7B158 != -1)
    dispatch_once(&qword_1ECD7B158, block);
  return (id)qword_1ECD7B160;
}

+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "_allSystemSoundIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)_internal_prepareSystemSoundID:(unsigned int)a3 forBeingActive:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  BOOL result;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;

  v4 = a4;
  HIDWORD(v10) = a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  LODWORD(v10) = v4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v5 = getAudioServicesSetPropertySymbolLoc_ptr;
  v14 = getAudioServicesSetPropertySymbolLoc_ptr;
  if (!getAudioServicesSetPropertySymbolLoc_ptr)
  {
    v6 = AudioToolboxLibrary();
    v5 = dlsym(v6, "AudioServicesSetProperty");
    v12[3] = (uint64_t)v5;
    getAudioServicesSetPropertySymbolLoc_ptr = v5;
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
    return ((unsigned int (*)(uint64_t, uint64_t, char *, uint64_t, uint64_t *))v5)(1633907828, 4, (char *)&v10 + 4, 4, &v10) == 0;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "OSStatus __AudioServicesSetProperty(AudioServicesPropertyID, UInt32, const void * _Nullable, UInt32, const void *)");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("_UIFeedbackSystemSoundEngine.m"), 26, CFSTR("%s"), dlerror(), v10, v11);

  __break(1u);
  return result;
}

- (void)_internal_performForEachSSIDsInFeedbacks:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "_allSystemSoundIDs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addIndexes:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79___UIFeedbackSystemSoundEngine__internal_performForEachSSIDsInFeedbacks_block___block_invoke;
  v15[3] = &unk_1E16C5EB0;
  v16 = v6;
  v14 = v6;
  objc_msgSend(v7, "enumerateIndexesUsingBlock:", v15);

}

- (void)_internal_startWarmingFeedbacks:(id)a3
{
  NSCountedSet *v4;
  NSCountedSet *warmSSIDs;
  id v6;
  id v7;
  _QWORD v8[5];

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  if (!self->_warmSSIDs)
  {
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v4 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
    warmSSIDs = self->_warmSSIDs;
    self->_warmSSIDs = v4;

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64___UIFeedbackSystemSoundEngine__internal_startWarmingFeedbacks___block_invoke;
  v8[3] = &unk_1E16C5ED8;
  v8[4] = self;
  -[_UIFeedbackSystemSoundEngine _internal_performForEachSSIDsInFeedbacks:block:](self, "_internal_performForEachSSIDsInFeedbacks:block:", v6, v8, v6);

}

- (void)_internal_stopWarmingFeedbacks:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63___UIFeedbackSystemSoundEngine__internal_stopWarmingFeedbacks___block_invoke;
  v5[3] = &unk_1E16C5ED8;
  v5[4] = self;
  -[_UIFeedbackSystemSoundEngine _internal_performForEachSSIDsInFeedbacks:block:](self, "_internal_performForEachSSIDsInFeedbacks:block:", v4, v5);

}

- (void)_internal_updateSuspension
{
  NSCountedSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSCountedSet *v8;
  NSCountedSet *suspendedSSIDs;
  NSCountedSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSCountedSet *v15;
  NSCountedSet *warmSSIDs;
  NSCountedSet *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  v26.receiver = self;
  v26.super_class = (Class)_UIFeedbackSystemSoundEngine;
  -[_UIFeedbackEngine _internal_updateSuspension](&v26, sel__internal_updateSuspension);
  if (-[_UIFeedbackEngine _internal_isSuspended](self, "_internal_isSuspended"))
  {
    if (-[NSCountedSet count](self->_warmSSIDs, "count"))
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v3 = self->_warmSSIDs;
      v4 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v23;
        do
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v23 != v6)
              objc_enumerationMutation(v3);
            -[_UIFeedbackSystemSoundEngine _internal_prepareSystemSoundID:forBeingActive:](self, "_internal_prepareSystemSoundID:forBeingActive:", objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v7++), "unsignedIntValue"), 0);
          }
          while (v5 != v7);
          v5 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
        }
        while (v5);
      }

      v8 = (NSCountedSet *)-[NSCountedSet copy](self->_warmSSIDs, "copy");
      suspendedSSIDs = self->_suspendedSSIDs;
      self->_suspendedSSIDs = v8;

      -[NSCountedSet removeAllObjects](self->_warmSSIDs, "removeAllObjects");
    }
  }
  else if (-[NSCountedSet count](self->_suspendedSSIDs, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = self->_suspendedSSIDs;
    v11 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          -[_UIFeedbackSystemSoundEngine _internal_prepareSystemSoundID:forBeingActive:](self, "_internal_prepareSystemSoundID:forBeingActive:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14++), "unsignedIntValue", (_QWORD)v18), 1);
        }
        while (v12 != v14);
        v12 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      }
      while (v12);
    }

    v15 = (NSCountedSet *)-[NSCountedSet copy](self->_suspendedSSIDs, "copy");
    warmSSIDs = self->_warmSSIDs;
    self->_warmSSIDs = v15;

    v17 = self->_suspendedSSIDs;
    self->_suspendedSSIDs = 0;

  }
}

- (void)_internal_dequeueReusableFeedbackPlayerWithCompletionBlock:(id)a3
{
  void (**v4)(id, _UIFeedbackSystemSoundEngine *);

  v4 = (void (**)(id, _UIFeedbackSystemSoundEngine *))a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  v4[2](v4, self);
}

- (void)_playFeedback:(id)a3 atTime:(double)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  double v17;

  v6 = a3;
  objc_msgSend(v6, "_effectiveFeedbackData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53___UIFeedbackSystemSoundEngine__playFeedback_atTime___block_invoke;
  v14[3] = &unk_1E16C5CA0;
  v14[4] = self;
  v15 = v7;
  v16 = v6;
  v17 = a4;
  v9 = v8;
  if (!v8)
  {
    v9 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
  }
  v11 = v8;
  v12 = v6;
  v13 = v7;
  dispatch_async(v9, v14);

}

- (BOOL)_internal_playFeedbackData:(id)a3 forFeedback:(id)a4 atTime:(double)a5
{
  id v8;
  id v9;
  int has_internal_diagnostics;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  float v21;
  float v22;
  id *v23;
  void *v24;
  id v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v36;
  unint64_t v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  __int128 *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _QWORD v55[2];
  void (*v56)(uint64_t, void *, void *);
  void *v57;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v11 = objc_msgSend(v8, "count");
  if (has_internal_diagnostics)
  {
    if (v11 != 1)
    {
      __UIFaultDebugAssertLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v8, "count");
        _os_log_fault_impl(&dword_185066000, v36, OS_LOG_TYPE_FAULT, "_UIFeedbackSystemSoundEngine only supports playing single feedbacks. Instead got: %lu", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  else if (v11 != 1)
  {
    v37 = qword_1ECD7B168;
    if (!qword_1ECD7B168)
    {
      v37 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v37, (unint64_t *)&qword_1ECD7B168);
    }
    v38 = *(NSObject **)(v37 + 8);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = v38;
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v8, "count");
      _os_log_impl(&dword_185066000, v39, OS_LOG_TYPE_ERROR, "_UIFeedbackSystemSoundEngine only supports playing single feedbacks. Instead got: %lu", (uint8_t *)&buf, 0xCu);

    }
  }
  objc_msgSend(v8, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "effectiveEnabledFeedbackTypes");
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__80;
  v62 = __Block_byref_object_dispose__80;
  v63 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v56 = __78___UIFeedbackSystemSoundEngine__internal_playFeedbackData_forFeedback_atTime___block_invoke;
  v57 = &unk_1E16C5F00;
  p_buf = &buf;
  v55[1] = 3221225472;
  v15 = (v13 & 2 | ((v13 & 1) == 0)) ^ 2u;
  if ((_DWORD)v15)
  {
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v16 = (id *)qword_1ECD7B178;
    v52 = (uint64_t (*)(uint64_t, uint64_t))qword_1ECD7B178;
    if (!qword_1ECD7B178)
    {
      v17 = AudioToolboxLibrary();
      v16 = (id *)dlsym(v17, "kAudioServicesPlaySystemSoundOptionFlagsKey");
      v50[3] = (uint64_t)v16;
      qword_1ECD7B178 = (uint64_t)v16;
    }
    _Block_object_dispose(&v49, 8);
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkAudioServicesPlaySystemSoundOptionFlagsKey(void)");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, CFSTR("_UIFeedbackSystemSoundEngine.m"), 27, CFSTR("%s"), dlerror());

      goto LABEL_27;
    }
    v18 = *v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v56((uint64_t)v55, v18, v19);

  }
  objc_msgSend(v12, "audioParameters");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_effectiveVolume");
  v22 = v21;

  if (v22 >= 1.0)
    goto LABEL_13;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v23 = (id *)qword_1ECD7B180;
  v52 = (uint64_t (*)(uint64_t, uint64_t))qword_1ECD7B180;
  if (!qword_1ECD7B180)
  {
    v24 = AudioToolboxLibrary();
    v23 = (id *)dlsym(v24, "kAudioServicesPlaySystemSoundOptionVolumeKey");
    v50[3] = (uint64_t)v23;
    qword_1ECD7B180 = (uint64_t)v23;
  }
  _Block_object_dispose(&v49, 8);
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkAudioServicesPlaySystemSoundOptionVolumeKey(void)");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, CFSTR("_UIFeedbackSystemSoundEngine.m"), 28, CFSTR("%s"), dlerror());

LABEL_27:
    __break(1u);
  }
  v25 = *v23;
  *(float *)&v26 = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v56((uint64_t)v55, v25, v27);

LABEL_13:
  -[_UIFeedbackEngine currentTime](self, "currentTime");
  v29 = a5 - v28;
  if (v29 <= 0.0)
  {
    -[_UIFeedbackSystemSoundEngine _internal_playFeedbackDataNow:forFeedback:withOptions:](self, "_internal_playFeedbackDataNow:forFeedback:withOptions:", v12, v9, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
  }
  else
  {
    v49 = 0;
    v50 = &v49;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__80;
    v53 = __Block_byref_object_dispose__80;
    v54 = 0;
    objc_msgSend((id)objc_opt_class(), "_internalQueue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v14;
    v44[1] = 3221225472;
    v44[2] = __78___UIFeedbackSystemSoundEngine__internal_playFeedbackData_forFeedback_atTime___block_invoke_2;
    v44[3] = &unk_1E16C5F28;
    v44[4] = self;
    v45 = v12;
    v31 = v9;
    v46 = v31;
    v47 = &buf;
    v48 = &v49;
    _UIFeedbackPreciseDispatchAfter(v30, v44, v29);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v50[5];
    v50[5] = v32;

    objc_msgSend(v31, "systemSoundSources");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v50[5]);

    _Block_object_dispose(&v49, 8);
  }
  _Block_object_dispose(&buf, 8);

  return 1;
}

- (void)_internal_playFeedbackDataNow:(id)a3 forFeedback:(id)a4 withOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  v11 = objc_msgSend(v8, "effectiveSystemSoundID");
  -[_UIFeedbackEngine currentTime](self, "currentTime");
  -[_UIFeedbackEngine _internal_willPlayFeedback:atTime:](self, "_internal_willPlayFeedback:atTime:", v9);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v12 = getAudioServicesPlaySystemSoundWithOptionsSymbolLoc_ptr;
  v19 = getAudioServicesPlaySystemSoundWithOptionsSymbolLoc_ptr;
  if (!getAudioServicesPlaySystemSoundWithOptionsSymbolLoc_ptr)
  {
    v13 = AudioToolboxLibrary();
    v12 = dlsym(v13, "AudioServicesPlaySystemSoundWithOptions");
    v17[3] = (uint64_t)v12;
    getAudioServicesPlaySystemSoundWithOptionsSymbolLoc_ptr = v12;
  }
  _Block_object_dispose(&v16, 8);
  if (v12)
  {
    ((void (*)(uint64_t, id, _QWORD))v12)(v11, v10, 0);
    kdebug_trace();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void __AudioServicesPlaySystemSoundWithOptions(SystemSoundID, CFDictionaryRef, __strong dispatch_block_t)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("_UIFeedbackSystemSoundEngine.m"), 24, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (void)_stopFeedback:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "_effectiveFeedbackData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_internalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46___UIFeedbackSystemSoundEngine__stopFeedback___block_invoke;
  block[3] = &unk_1E16B47A8;
  block[4] = self;
  v13 = v5;
  v14 = v4;
  v7 = v6;
  if (!v6)
  {
    v7 = MEMORY[0x1E0C80D38];
    v8 = MEMORY[0x1E0C80D38];
  }
  v9 = v6;
  v10 = v4;
  v11 = v5;
  dispatch_async(v7, block);

}

- (void)_internal_stopFeedbackData:(id)a3 forFeedback:(id)a4
{
  id v5;
  id v6;
  __int128 *p_buf;
  int has_internal_diagnostics;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  __int128 buf;
  uint64_t v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");
  p_buf = &buf;

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v9 = objc_msgSend(v5, "count");
  if (has_internal_diagnostics)
  {
    if (v9 != 1)
    {
      __UIFaultDebugAssertLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v24 = objc_msgSend(v5, "count");
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v24;
        _os_log_fault_impl(&dword_185066000, v19, OS_LOG_TYPE_FAULT, "_UIFeedbackSystemSoundEngine only supports playing single feedbacks. Instead got: %lu", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  else if (v9 != 1)
  {
    goto LABEL_19;
  }
  while (1)
  {
    objc_msgSend(v5, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v6, "systemSoundSources");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v11);
          dispatch_source_cancel(*(dispatch_source_t *)(*((_QWORD *)&v25 + 1) + 8 * i));
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v12);
    }

    objc_msgSend(v6, "systemSoundSources");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeAllObjects");

    p_buf = (__int128 *)objc_msgSend(v10, "effectiveSystemSoundID");
    +[_UIFeedbackSystemSoundEngine sharedEngine](_UIFeedbackSystemSoundEngine, "sharedEngine");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_internal_willCancelFeedback:", v6);

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v31 = 0x2020000000;
    v17 = off_1ECD7B188;
    v32 = off_1ECD7B188;
    if (!off_1ECD7B188)
    {
      v18 = AudioToolboxLibrary();
      v17 = dlsym(v18, "AudioServicesStopSystemSound");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v17;
      off_1ECD7B188 = v17;
    }
    _Block_object_dispose(&buf, 8);
    if (v17)
      break;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void __AudioServicesStopSystemSound(SystemSoundID, Boolean)");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIFeedbackSystemSoundEngine.m"), 25, CFSTR("%s"), dlerror());

    __break(1u);
LABEL_19:
    v20 = qword_1ECD7B170;
    if (!qword_1ECD7B170)
    {
      v20 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v20, (unint64_t *)&qword_1ECD7B170);
    }
    v21 = *(NSObject **)(v20 + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = v21;
      v23 = objc_msgSend(v5, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)p_buf + 4) = v23;
      _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "_UIFeedbackSystemSoundEngine only supports playing single feedbacks. Instead got: %lu", (uint8_t *)&buf, 0xCu);

    }
  }
  ((void (*)(__int128 *, uint64_t))v17)(p_buf, 1);

}

- (id)_stats_key
{
  return CFSTR("systemSound");
}

- (id)invalidationBlock
{
  return self->_invalidationBlock;
}

- (void)setInvalidationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSCountedSet)warmSSIDs
{
  return self->_warmSSIDs;
}

- (NSCountedSet)suspendedSSIDs
{
  return self->_suspendedSSIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suspendedSSIDs, 0);
  objc_storeStrong((id *)&self->_warmSSIDs, 0);
  objc_storeStrong(&self->_invalidationBlock, 0);
}

@end
