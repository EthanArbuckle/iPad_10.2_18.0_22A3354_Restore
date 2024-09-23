@implementation UIDefaultFocusSoundPlayer

void __65___UIDefaultFocusSoundPlayer__registerForSystemSoundsIfNecessary__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_unregisterForSystemSounds:", WeakRetained);

    v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;

  }
}

void __44___UIDefaultFocusSoundPlayer_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[_UIDefaultFocusSoundPlayer _init]([_UIDefaultFocusSoundPlayer alloc], "_init");
  v1 = (void *)qword_1ECD7DB90;
  qword_1ECD7DB90 = (uint64_t)v0;

}

void __71___UIDefaultFocusSoundPlayer__playSystemSound_behavior_withVolume_pan___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id *v5;
  void *v6;
  id v7;
  void **v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
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
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];
  _QWORD v36[3];
  _BYTE buf[24];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v2 = (id *)qword_1ECD7DBC0;
  v38 = (void *)qword_1ECD7DBC0;
  if (!qword_1ECD7DBC0)
  {
    v3 = AudioToolboxLibrary_0();
    v2 = (id *)dlsym(v3, "kAudioServicesPlaySystemSoundOptionVolumeKey");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v2;
    qword_1ECD7DBC0 = (uint64_t)v2;
  }
  _Block_object_dispose(buf, 8);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkAudioServicesPlaySystemSoundOptionVolumeKey(void)");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("_UIFocusSoundGenerator.m"), 34, CFSTR("%s"), dlerror());

    goto LABEL_25;
  }
  v4 = *v2;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v5 = (id *)qword_1ECD7DBC8;
  v38 = (void *)qword_1ECD7DBC8;
  if (!qword_1ECD7DBC8)
  {
    v6 = AudioToolboxLibrary_0();
    v5 = (id *)dlsym(v6, "kAudioServicesPlaySystemSoundOptionPanKey");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v5;
    qword_1ECD7DBC8 = (uint64_t)v5;
  }
  _Block_object_dispose(buf, 8);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkAudioServicesPlaySystemSoundOptionPanKey(void)");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("_UIFocusSoundGenerator.m"), 35, CFSTR("%s"), dlerror());

    goto LABEL_25;
  }
  v7 = *v5;
  if (*(_DWORD *)(a1 + 48))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v8 = (void **)qword_1ECD7DBD0;
    v38 = (void *)qword_1ECD7DBD0;
    if (!qword_1ECD7DBD0)
    {
      v9 = AudioToolboxLibrary_0();
      v8 = (void **)dlsym(v9, "kAudioServicesPlaySystemSoundOptionBehaviorKey");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v8;
      qword_1ECD7DBD0 = (uint64_t)v8;
    }
    _Block_object_dispose(buf, 8);
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkAudioServicesPlaySystemSoundOptionBehaviorKey(void)");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("_UIFocusSoundGenerator.m"), 36, CFSTR("%s"), dlerror());

LABEL_25:
      __break(1u);
    }
    v10 = *v8;
    v35[0] = v4;
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = *(double *)(a1 + 32);
    v13 = v10;
    objc_msgSend(v11, "numberWithDouble:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v14;
    v35[1] = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v15;
    v35[2] = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33[0] = v4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v33[1] = v7;
    v34[0] = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v18 = qword_1ECD7DB98;
  if (!qword_1ECD7DB98)
  {
    v18 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v18, (unint64_t *)&qword_1ECD7DB98);
  }
  v19 = *(NSObject **)(v18 + 8);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v21;
    _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_DEFAULT, "Playing focus system sound at volume: %f, pan: %f.", buf, 0x16u);
  }
  v22 = *(unsigned int *)(a1 + 52);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v23 = off_1ECD7DBD8;
  v38 = off_1ECD7DBD8;
  if (!off_1ECD7DBD8)
  {
    v24 = AudioToolboxLibrary_0();
    v23 = dlsym(v24, "AudioServicesPlaySystemSoundWithOptions");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v23;
    off_1ECD7DBD8 = v23;
  }
  _Block_object_dispose(buf, 8);
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void __AudioServicesPlaySystemSoundWithOptions(SystemSoundID, CFDictionaryRef, __strong dispatch_block_t)");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("_UIFocusSoundGenerator.m"), 33, CFSTR("%s"), dlerror());

    goto LABEL_25;
  }
  ((void (*)(uint64_t, void *, _QWORD))v23)(v22, v17, 0);

}

@end
