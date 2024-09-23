@implementation _UIFeedbackCoreHapticsHighPriorityEngine

+ (id)sharedEngine
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56___UIFeedbackCoreHapticsHighPriorityEngine_sharedEngine__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7AA10 != -1)
    dispatch_once(&qword_1ECD7AA10, block);
  return (id)qword_1ECD7AA18;
}

+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL result;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a3;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_feedbackSupportLevel") < 2)
  {

LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  v5 = objc_msgSend(v3, "_effectiveFeedbackTypes");

  if (v5 != 2)
    goto LABEL_10;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_10;
  objc_msgSend(v3, "pattern");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_10;
  v7 = v6;
  objc_msgSend(v6, "configurationDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v9 = (_QWORD *)getCHHapticPatternKeyPrioritySymbolLoc_ptr;
  v20 = getCHHapticPatternKeyPrioritySymbolLoc_ptr;
  if (!getCHHapticPatternKeyPrioritySymbolLoc_ptr)
  {
    v10 = CoreHapticsLibrary_1();
    v9 = dlsym(v10, "CHHapticPatternKeyPriority");
    v18[3] = (uint64_t)v9;
    getCHHapticPatternKeyPrioritySymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v17, 8);
  if (v9)
  {
    objc_msgSend(v8, "valueForKey:", *v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    getCHHapticPriorityHigh();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

LABEL_11:
    return v13;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticPatternKey getCHHapticPatternKeyPriority(void)");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 98, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (id)_internal_createCoreHapticsEngine
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFeedbackCoreHapticsHighPriorityEngine;
  -[_UIFeedbackCoreHapticsEngine _internal_createCoreHapticsEngine](&v7, sel__internal_createCoreHapticsEngine);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[_UIFeedbackCoreHapticsEngine coreHapticsEngine](self, "coreHapticsEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMuteHapticsWhileRecordingAudio:", 0);

    -[_UIFeedbackCoreHapticsEngine coreHapticsEngine](self, "coreHapticsEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlaysHapticsOnly:", 1);

  }
  return v3;
}

+ (id)_additionalEngineOptions
{
  id *v2;
  void *v3;
  id v4;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  id *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];
  id v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v2 = (id *)qword_1ECD7AAA0;
  v29 = qword_1ECD7AAA0;
  if (!qword_1ECD7AAA0)
  {
    v3 = CoreHapticsLibrary_1();
    v2 = (id *)dlsym(v3, "CHHapticEngineOptionKeyHapticPowerUsage");
    v27[3] = (uint64_t)v2;
    qword_1ECD7AAA0 = (uint64_t)v2;
  }
  _Block_object_dispose(&v26, 8);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticEngineOptionKey getCHHapticEngineOptionKeyHapticPowerUsage(void)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 35, CFSTR("%s"), dlerror(), v26);

    goto LABEL_18;
  }
  v4 = *v2;
  v30[0] = v4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v5 = (id *)qword_1ECD7AAA8;
  v29 = qword_1ECD7AAA8;
  if (!qword_1ECD7AAA8)
  {
    v6 = CoreHapticsLibrary_1();
    v5 = (id *)dlsym(v6, "CHHapticPowerUsageLow");
    v27[3] = (uint64_t)v5;
    qword_1ECD7AAA8 = (uint64_t)v5;
  }
  _Block_object_dispose(&v26, 8);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticPowerUsage getCHHapticPowerUsageLow(void)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 36, CFSTR("%s"), dlerror(), v26);

    goto LABEL_18;
  }
  v7 = *v5;
  v32[0] = v7;
  getCHHapticEngineOptionKeyLocality();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v8;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v9 = (id *)qword_1ECD7AAB0;
  v29 = qword_1ECD7AAB0;
  if (!qword_1ECD7AAB0)
  {
    v10 = CoreHapticsLibrary_1();
    v9 = (id *)dlsym(v10, "CHHapticLocalityDefaultWithFullStrength");
    v27[3] = (uint64_t)v9;
    qword_1ECD7AAB0 = (uint64_t)v9;
  }
  _Block_object_dispose(&v26, 8);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticLocality getCHHapticLocalityDefaultWithFullStrength(void)");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 30, CFSTR("%s"), dlerror(), v26);

    goto LABEL_18;
  }
  v11 = *v9;
  v32[1] = v11;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v12 = (id *)qword_1ECD7AAB8;
  v29 = qword_1ECD7AAB8;
  if (!qword_1ECD7AAB8)
  {
    v13 = CoreHapticsLibrary_1();
    v12 = (id *)dlsym(v13, "CHHapticEngineOptionKeyPriority");
    v27[3] = (uint64_t)v12;
    qword_1ECD7AAB8 = (uint64_t)v12;
  }
  _Block_object_dispose(&v26, 8);
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticEngineOptionKey getCHHapticEngineOptionKeyPriority(void)");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 33, CFSTR("%s"), dlerror(), v26);

LABEL_18:
    __break(1u);
  }
  v31 = *v12;
  v14 = v31;
  getCHHapticPriorityHigh();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v30, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
