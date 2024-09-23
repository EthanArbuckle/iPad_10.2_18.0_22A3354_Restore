@implementation SBFObliterationController

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global);
  return (id)sharedInstance_instance;
}

uint64_t __43__SBFObliterationController_sharedInstance__block_invoke()
{
  SBFObliterationController *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBFObliterationController);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

  return kdebug_trace();
}

- (void)_doObliterateWithType:(__CFString *)a3 eraseDataPlan:(BOOL)a4 showingProgress:(BOOL)a5 options:(id)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const void *v16;
  void *v17;
  void *v18;
  id *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void (*v24)(uint64_t, _QWORD);
  void (*v25)(uint64_t);
  void (*v26)(uint64_t);
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;

  v6 = a5;
  v7 = a4;
  v9 = a6;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v9);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", a3, *MEMORY[0x1E0D4E628]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D4E610]);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle", 0, 0, 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "bundleIdentifier");
  v28 = 0;
  v29 = (uint64_t)&v28;
  v30 = 0x2020000000;
  v14 = get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr;
  v31 = get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr;
  if (!get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr)
  {
    v15 = (void *)CoreTelephonyLibrary();
    v14 = dlsym(v15, "_CTServerConnectionCreateWithIdentifier");
    *(_QWORD *)(v29 + 24) = v14;
    get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr = v14;
  }
  _Block_object_dispose(&v28, 8);
  if (!v14)
    -[SBFObliterationController _doObliterateWithType:eraseDataPlan:showingProgress:options:].cold.1();
  v16 = (const void *)((uint64_t (*)(_QWORD, uint64_t, uint64_t (*)(), __int128 *))v14)(*MEMORY[0x1E0C9AE00], v13, _ResetCTServerConnectionCallback, &v27);

  if (v16)
  {
    if (v7)
    {
      v28 = 0;
      v29 = (uint64_t)&v28;
      v30 = 0x2020000000;
      v17 = get_CTServerConnectionEraseAllUserProfilesSymbolLoc_ptr;
      v31 = get_CTServerConnectionEraseAllUserProfilesSymbolLoc_ptr;
      if (!get_CTServerConnectionEraseAllUserProfilesSymbolLoc_ptr)
      {
        v18 = (void *)CoreTelephonyLibrary();
        v17 = dlsym(v18, "_CTServerConnectionEraseAllUserProfiles");
        *(_QWORD *)(v29 + 24) = v17;
        get_CTServerConnectionEraseAllUserProfilesSymbolLoc_ptr = v17;
      }
      _Block_object_dispose(&v28, 8);
      if (!v17)
        -[SBFObliterationController _doObliterateWithType:eraseDataPlan:showingProgress:options:].cold.5();
      ((void (*)(const void *))v17)(v16);
    }
    v28 = 0;
    v29 = (uint64_t)&v28;
    v30 = 0x2020000000;
    v19 = (id *)getkCTBasebandSettingsEraseEFSSymbolLoc_ptr;
    v31 = (void *)getkCTBasebandSettingsEraseEFSSymbolLoc_ptr;
    if (!getkCTBasebandSettingsEraseEFSSymbolLoc_ptr)
    {
      v20 = (void *)CoreTelephonyLibrary();
      v19 = (id *)dlsym(v20, "kCTBasebandSettingsEraseEFS");
      *(_QWORD *)(v29 + 24) = v19;
      getkCTBasebandSettingsEraseEFSSymbolLoc_ptr = (uint64_t)v19;
    }
    _Block_object_dispose(&v28, 8);
    if (!v19)
      -[SBFObliterationController _doObliterateWithType:eraseDataPlan:showingProgress:options:].cold.6();
    v21 = objc_retainAutorelease(*v19);
    v28 = 0;
    v29 = (uint64_t)&v28;
    v30 = 0x2020000000;
    v22 = get_CTServerConnectionEraseBasebandSettingsSymbolLoc_ptr;
    v31 = get_CTServerConnectionEraseBasebandSettingsSymbolLoc_ptr;
    if (!get_CTServerConnectionEraseBasebandSettingsSymbolLoc_ptr)
    {
      v23 = (void *)CoreTelephonyLibrary();
      v22 = dlsym(v23, "_CTServerConnectionEraseBasebandSettings");
      *(_QWORD *)(v29 + 24) = v22;
      get_CTServerConnectionEraseBasebandSettingsSymbolLoc_ptr = v22;
    }
    _Block_object_dispose(&v28, 8);
    if (!v22)
      -[SBFObliterationController _doObliterateWithType:eraseDataPlan:showingProgress:options:].cold.7();
    ((void (*)(const void *, id))v22)(v16, v21);
    CFRelease(v16);
  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v24 = (void (*)(uint64_t, _QWORD))getSOSCCBailFromCircle_BestEffortSymbolLoc_ptr;
  v36 = getSOSCCBailFromCircle_BestEffortSymbolLoc_ptr;
  if (!getSOSCCBailFromCircle_BestEffortSymbolLoc_ptr)
  {
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = (uint64_t)__getSOSCCBailFromCircle_BestEffortSymbolLoc_block_invoke;
    v31 = &unk_1E200E038;
    v32 = &v33;
    __getSOSCCBailFromCircle_BestEffortSymbolLoc_block_invoke((uint64_t)&v28);
    v24 = (void (*)(uint64_t, _QWORD))v34[3];
  }
  _Block_object_dispose(&v33, 8);
  if (!v24)
    -[SBFObliterationController _doObliterateWithType:eraseDataPlan:showingProgress:options:].cold.2();
  v24(5, 0);
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v25 = (void (*)(uint64_t))getIDSHardDeregisterSymbolLoc_ptr;
  v36 = getIDSHardDeregisterSymbolLoc_ptr;
  if (!getIDSHardDeregisterSymbolLoc_ptr)
  {
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = (uint64_t)__getIDSHardDeregisterSymbolLoc_block_invoke;
    v31 = &unk_1E200E038;
    v32 = &v33;
    __getIDSHardDeregisterSymbolLoc_block_invoke((uint64_t)&v28);
    v25 = (void (*)(uint64_t))v34[3];
  }
  _Block_object_dispose(&v33, 8);
  if (!v25)
    -[SBFObliterationController _doObliterateWithType:eraseDataPlan:showingProgress:options:].cold.3();
  v25(5);
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v26 = (void (*)(uint64_t))getAKUnregisterAllAppleIDsSymbolLoc_ptr;
  v36 = getAKUnregisterAllAppleIDsSymbolLoc_ptr;
  if (!getAKUnregisterAllAppleIDsSymbolLoc_ptr)
  {
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = (uint64_t)__getAKUnregisterAllAppleIDsSymbolLoc_block_invoke;
    v31 = &unk_1E200E038;
    v32 = &v33;
    __getAKUnregisterAllAppleIDsSymbolLoc_block_invoke((uint64_t)&v28);
    v26 = (void (*)(uint64_t))v34[3];
  }
  _Block_object_dispose(&v33, 8);
  if (!v26)
    -[SBFObliterationController _doObliterateWithType:eraseDataPlan:showingProgress:options:].cold.4();
  v26(5);
  Mobile_Obliterate();

}

- (void)wipeAndBrickShowingProgress:(BOOL)a3 reason:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v4 = a3;
  v10[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v9 = *MEMORY[0x1E0D4E620];
    v10[0] = a4;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = a4;
    objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[SBFObliterationController _doObliterateWithType:eraseDataPlan:showingProgress:options:](self, "_doObliterateWithType:eraseDataPlan:showingProgress:options:", *MEMORY[0x1E0D4E638], 1, v4, v8);

}

- (void)obliterateDataPartitionShowingProgress:(BOOL)a3 skipDataObliteration:(BOOL)a4 eraseDataPlan:(BOOL)a5 reason:(id)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  id v12;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v12 = a6;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = v10;
  if (v7)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D4E640]);
  if (v12)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D4E620]);
  -[SBFObliterationController _doObliterateWithType:eraseDataPlan:showingProgress:options:](self, "_doObliterateWithType:eraseDataPlan:showingProgress:options:", *MEMORY[0x1E0D4E618], v6, v8, v11);

}

- (void)markObliterationStart
{
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D4E628];
  v3[0] = *MEMORY[0x1E0D4E630];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  Mobile_Obliterate();
}

- (void)_doObliterateWithType:eraseDataPlan:showingProgress:options:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CTServerConnectionRef soft_CTServerConnectionCreateWithIdentifier(CFAllocatorRef, CFStringRef, CTServerConnectionCallback, _CTServerConnectionContext *)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFObliterationController.m"), 25, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)_doObliterateWithType:eraseDataPlan:showingProgress:options:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool soft_SOSCCBailFromCircle_BestEffort(uint64_t, CFErrorRef *)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFObliterationController.m"), 36, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)_doObliterateWithType:eraseDataPlan:showingProgress:options:.cold.3()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void soft_IDSHardDeregister(uint32_t)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFObliterationController.m"), 32, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)_doObliterateWithType:eraseDataPlan:showingProgress:options:.cold.4()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void soft_AKUnregisterAllAppleIDs(uint32_t)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFObliterationController.m"), 40, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)_doObliterateWithType:eraseDataPlan:showingProgress:options:.cold.5()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CTError soft_CTServerConnectionEraseAllUserProfiles(CTServerConnectionRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFObliterationController.m"), 27, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)_doObliterateWithType:eraseDataPlan:showingProgress:options:.cold.6()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkCTBasebandSettingsEraseEFS(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFObliterationController.m"), 23, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)_doObliterateWithType:eraseDataPlan:showingProgress:options:.cold.7()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CTError soft_CTServerConnectionEraseBasebandSettings(CTServerConnectionRef, CFStringRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBFObliterationController.m"), 26, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

@end
