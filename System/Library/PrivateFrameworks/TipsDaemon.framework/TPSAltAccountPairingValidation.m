@implementation TPSAltAccountPairingValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void (**v30)(id, uint64_t, _QWORD);
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[TPSTargetingValidation value](self, "value");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = 0x1E0DBF000uLL;
  if (v5
    && (v7 = (void *)v5,
        -[TPSTargetingValidation value](self, "value"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        v7,
        (isKindOfClass & 1) != 0))
  {
    -[TPSTargetingValidation value](self, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "TPSSafeIntegerForKey:", CFSTR("matchingType"));

    -[TPSTargetingValidation value](self, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "TPSSafeBoolForKey:", CFSTR("value"));

    objc_msgSend((id)objc_opt_class(), "deviceSelectorBlockForMatchingType:", v11);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v18)
    {
      v19 = v18;
      v30 = v4;
      v20 = *(_QWORD *)v32;
      v21 = *MEMORY[0x1E0D516D8];
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "valueForProperty:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "BOOLValue");

          if (v13 == v24)
          {
            v25 = 1;
            goto LABEL_16;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v19)
          continue;
        break;
      }
      v25 = 0;
LABEL_16:
      v4 = v30;
      v6 = 0x1E0DBF000;
    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      -[TPSTargetingValidation value](self, "value");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPSTargetingValidation value](self, "value");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v36 = v26;
      v37 = 2112;
      v38 = (id)objc_opt_class();
      v28 = v38;
      _os_log_impl(&dword_1DAC2F000, v14, OS_LOG_TYPE_INFO, "Unexpected value: %@ with class %@.", buf, 0x16u);

    }
    v25 = 0;
  }

  objc_msgSend(*(id *)(v6 + 976), "targeting");
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(self, v25, v29);

  v4[2](v4, v25, 0);
}

+ (id)deviceSelectorBlockForMatchingType:(int64_t)a3
{
  void *v3;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D51838], "activeDeviceSelectorBlock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 2)
      objc_msgSend(MEMORY[0x1E0D51838], "pairedDevicesSelectorBlock");
    else
      objc_msgSend(MEMORY[0x1E0D51838], "activePairedDeviceSelectorBlock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
