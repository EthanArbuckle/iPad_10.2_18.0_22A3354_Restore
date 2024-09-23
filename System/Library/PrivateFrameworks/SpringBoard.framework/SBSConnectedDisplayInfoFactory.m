@implementation SBSConnectedDisplayInfoFactory

- (id)connectedDisplayInfoForDisplayConfiguration:(id)a3 externalDisplayDefaults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  NSObject *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hardwareIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2728], "displays");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __102__SBSConnectedDisplayInfoFactory_connectedDisplayInfoForDisplayConfiguration_externalDisplayDefaults___block_invoke;
  v27[3] = &unk_1E8EB9498;
  v25 = v8;
  v28 = v25;
  objc_msgSend(v9, "bs_firstObjectPassingTest:", v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0DAAF48]);
  v12 = objc_msgSend(v7, "arrangementEdge");
  objc_msgSend(v7, "arrangementOffset");
  v26 = (void *)objc_msgSend(v11, "initWithDisplayIdentifier:edge:offset:", 0, v12);
  if (v10)
  {
    v13 = -[SBSConnectedDisplayInfoFactory _supportedScalesForDisplayConfiguration:defaults:error:](self, "_supportedScalesForDisplayConfiguration:defaults:error:", v6, v7, 0);
    -[SBSConnectedDisplayInfoFactory _effectiveSettingsForDisplayConfiguration:defaults:](self, "_effectiveSettingsForDisplayConfiguration:defaults:", v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
    v13 = 0;
  }
  v15 = (void *)objc_msgSend(v10, "immutableCopy");
  objc_msgSend(v15, "productName");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v16, "length"))
  {
    objc_msgSend(v6, "deviceName");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (-[__CFString length](v17, "length"))
    {
      v16 = v17;
    }
    else
    {
      SBLogDisplayControlling();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543874;
        v30 = v15;
        v31 = 2114;
        v32 = v10;
        v33 = 2114;
        v34 = v6;
        _os_log_fault_impl(&dword_1D0540000, v18, OS_LOG_TYPE_FAULT, "failed to retrieve productName and deviceName for display. immutableCADisplay: %{public}@; caDisplay: %{public"
          "}@; displayConfiguration: %{public}@",
          buf,
          0x20u);
      }

      v16 = CFSTR("External Display");
    }
  }
  v19 = objc_alloc(MEMORY[0x1E0DAAE20]);
  objc_msgSend(v6, "deviceName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v23 = (void *)objc_msgSend(v19, "initWithIdentifier:deviceName:displayName:size:mirrored:supportedScales:displayModeSettings:arrangement:", v25, v20, v16, objc_msgSend(v7, "isMirroringEnabled"), v13, v14, v21, v22, v26);

  return v23;
}

uint64_t __102__SBSConnectedDisplayInfoFactory_connectedDisplayInfoForDisplayConfiguration_externalDisplayDefaults___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (unint64_t)_supportedScalesForDisplayConfiguration:(id)a3 defaults:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  NSObject *v21;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSConnectedDisplayInfoFactory.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayConfiguration"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSConnectedDisplayInfoFactory.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("defaults"));

LABEL_3:
  objc_msgSend(MEMORY[0x1E0DA9D58], "withDisplay:useNativeSize:", v9, objc_msgSend(v11, "chamois"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "supportedScales");

  if (v13)
  {
    v14 = 0;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0DAB710];
    v30 = CFSTR("displayHardwareIdentifier");
    objc_msgSend(v9, "hardwareIdentifier");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v19 = CFSTR("<nil>");
    if (v17)
      v19 = (const __CFString *)v17;
    v31[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 2, v20);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (a5 && v14)
    {
      SBLogDisplayControlling();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        _SBFLoggingMethodProem();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v23;
        v28 = 2114;
        v29 = v14;
        _os_log_error_impl(&dword_1D0540000, v21, OS_LOG_TYPE_ERROR, "[%{public}@] error:%{public}@", buf, 0x16u);

      }
      v14 = objc_retainAutorelease(v14);
      *a5 = v14;
    }
  }

  return v13;
}

- (id)_effectiveSettingsForDisplayConfiguration:(id)a3 defaults:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSConnectedDisplayInfoFactory.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayConfiguration"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSConnectedDisplayInfoFactory.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("defaults"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v9, "displayModeSettingsForDisplay:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
