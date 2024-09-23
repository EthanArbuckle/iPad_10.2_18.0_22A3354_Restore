@implementation TLAlert

+ (void)playToneAndVibrationForType:(int64_t)a3
{
  +[TLAlert playAlertForType:](TLAlert, "playAlertForType:", a3);
}

- (TLAlert)initWithType:(int64_t)a3
{
  TLAlertConfiguration *v4;
  TLAlert *v5;

  v4 = -[TLAlertConfiguration initWithType:]([TLAlertConfiguration alloc], "initWithType:", a3);
  +[TLAlert alertWithConfiguration:](TLAlert, "alertWithConfiguration:", v4);
  v5 = (TLAlert *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (TLAlert)initWithType:(int64_t)a3 accountIdentifier:(id)a4
{
  id v6;
  TLAlertConfiguration *v7;
  TLAlert *v8;

  v6 = a4;
  v7 = -[TLAlertConfiguration initWithType:]([TLAlertConfiguration alloc], "initWithType:", a3);
  -[TLAlertConfiguration setTopic:](v7, "setTopic:", v6);

  +[TLAlert alertWithConfiguration:](TLAlert, "alertWithConfiguration:", v7);
  v8 = (TLAlert *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (TLAlert)initWithType:(int64_t)a3 toneIdentifier:(id)a4 vibrationIdentifier:(id)a5
{
  id v8;
  id v9;
  TLAlertConfiguration *v10;
  TLAlert *v11;

  v8 = a5;
  v9 = a4;
  v10 = -[TLAlertConfiguration initWithType:]([TLAlertConfiguration alloc], "initWithType:", a3);
  -[TLAlertConfiguration setToneIdentifier:](v10, "setToneIdentifier:", v9);

  -[TLAlertConfiguration setVibrationIdentifier:](v10, "setVibrationIdentifier:", v8);
  +[TLAlert alertWithConfiguration:](TLAlert, "alertWithConfiguration:", v10);
  v11 = (TLAlert *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)playWithCompletionHandler:(id)a3 targetQueue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__TLAlert_Deprecated__playWithCompletionHandler_targetQueue___block_invoke;
  v11[3] = &unk_1E952ACE8;
  v14 = &v16;
  v15 = &v20;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v12 = v9;
  -[TLAlert playWithCompletionHandler:](self, "playWithCompletionHandler:", v11);
  *((_BYTE *)v17 + 24) = 0;
  LOBYTE(self) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return (char)self;
}

void __61__TLAlert_Deprecated__playWithCompletionHandler_targetQueue___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  void (**v6)(_QWORD);
  NSObject *v7;
  id v8;

  v5 = a3;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    if (a2 == 5)
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
  }
  else
  {
    v6 = (void (**)(_QWORD))a1[5];
    if (v6)
    {
      v8 = v5;
      v7 = a1[4];
      if (v7)
        dispatch_async(v7, v6);
      else
        v6[2](v6);
      v5 = v8;
    }
  }

}

+ (void)playAlertForType:(int64_t)a3
{
  void *v3;
  TLAlertConfiguration *v4;

  v4 = -[TLAlertConfiguration initWithType:]([TLAlertConfiguration alloc], "initWithType:", a3);
  +[TLAlert alertWithConfiguration:](TLAlert, "alertWithConfiguration:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playWithCompletionHandler:", 0);

}

+ (TLAlert)alertWithConfiguration:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  objc_class *v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  uint8_t buf[4];
  NSObject *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSObject type](v4, "type");
  if ((unint64_t)(v5 - 1) > 0x1C)
  {
    v19 = 0;
    goto LABEL_27;
  }
  v6 = v5;
  v51 = (objc_class *)a1;
  -[NSObject toneIdentifier](v4, "toneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject externalToneFileURL](v4, "externalToneFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NSObject externalToneMediaLibraryItemIdentifier](v4, "externalToneMediaLibraryItemIdentifier");
  -[NSObject vibrationIdentifier](v4, "vibrationIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  -[NSObject externalVibrationPattern](v4, "externalVibrationPattern");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject externalVibrationPatternFileURL](v4, "externalVibrationPatternFileURL");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject topic](v4, "topic");
  v12 = objc_claimAutoreleasedReturnValue();
  v50 = -[NSObject targetDevice](v4, "targetDevice");
  +[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager");
  v13 = objc_claimAutoreleasedReturnValue();
  v52 = (void *)v13;
  v53 = (void *)v12;
  if (v8)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "path");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("externalTone:%@-%@"), v15, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v15;
LABEL_11:

    v7 = (void *)v18;
    goto LABEL_12;
  }
  if (v9)
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("mediaLibrary:%llu-%@"), v9, v22);
    v18 = objc_claimAutoreleasedReturnValue();

    v7 = v21;
    goto LABEL_11;
  }
  v23 = (void *)v13;
  if (!objc_msgSend(v7, "length") || !v50 && (objc_msgSend(v23, "toneWithIdentifierIsValid:", v7) & 1) == 0)
  {
    objc_msgSend(v23, "currentToneIdentifierForAlertType:topic:", v6, v12);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_12:
  +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "hasVibratorCapability");

  v26 = v11;
  if (!v25)
  {
    v34 = 0;
    v35 = 1;
    goto LABEL_20;
  }
  +[TLVibrationManager sharedVibrationManager](TLVibrationManager, "sharedVibrationManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if (v54)
    {
      v36 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v54, "path");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "UUIDString");
      v39 = v27;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringWithFormat:", CFSTR("externalVibration:%@-%@"), v37, v40);
      v33 = objc_claimAutoreleasedReturnValue();

      v27 = v39;
      goto LABEL_18;
    }
    if (!-[NSObject length](v10, "length") || (objc_msgSend(v27, "vibrationWithIdentifierIsValid:", v10) & 1) == 0)
    {
      if (v50 == 1)
        objc_msgSend(v27, "_synchronizedVibrationIdentifierForToneIdentifier:targetDevice:", v7, 1);
      else
        objc_msgSend(v27, "currentVibrationIdentifierForAlertType:topic:", v6, v53);
      v43 = objc_claimAutoreleasedReturnValue();

      v10 = v43;
      v26 = 0;
    }
    v55 = 1;
    objc_msgSend(v27, "_sanitizeVibrationIdentifier:forAlertType:topic:targetDevice:correspondingToneIdentifier:didFallbackToCurrentVibrationIdentifier:", v10, v6, 0, v50, v7, &v55);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "isEqualToString:", v10);
    if ((v45 & 1) != 0)
    {
      v34 = 0;
      if (!-[NSObject hasPrefix:](v10, "hasPrefix:", CFSTR("synchronizedvibration:")) || !v55)
        goto LABEL_43;
      TLLogPlayback();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v57 = v10;
        v58 = 2114;
        v59 = v7;
        _os_log_impl(&dword_1D33D5000, v46, OS_LOG_TYPE_DEFAULT, "Instantiating alert with synchronized vibration (%{public}@), which does not match the associated tone (%{public}@).", buf, 0x16u);
      }
    }
    else
    {
      TLLogPlayback();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromTLAlertType(v6);
        v48 = v45;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v57 = v10;
        v58 = 2114;
        v59 = v49;
        v60 = 2114;
        v61 = v7;
        v62 = 2114;
        v63 = v44;
        _os_log_impl(&dword_1D33D5000, v47, OS_LOG_TYPE_DEFAULT, "Sanitizing vibrationIdentifier: %{public}@, for alert type: %{public}@, toneIdentifier: %{public}@. Using instead vibrationIdentifier: %{public}@.", buf, 0x2Au);

        v45 = v48;
      }

      v46 = v10;
      v10 = v44;
    }

    v34 = v45;
    v26 = 0;
LABEL_43:

    goto LABEL_19;
  }
  v28 = (void *)MEMORY[0x1E0CB3940];
  v29 = objc_msgSend(v11, "hash");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "UUIDString");
  v31 = v27;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("externalVibration:%llu-%@"), v29, v32);
  v33 = objc_claimAutoreleasedReturnValue();

  v27 = v31;
LABEL_18:
  v34 = 0;
  v10 = v33;
LABEL_19:
  v35 = -[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("<none>")) ^ 1;

LABEL_20:
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("<none>")) || (v35 & 1) != 0)
  {
    v19 = (void *)objc_msgSend([v51 alloc], "_initWithConfiguration:toneIdentifier:vibrationIdentifier:hasSynchronizedVibrationUnmatchedWithTone:", v4, v7, v10, v34);
  }
  else
  {
    TLLogPlayback();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v57 = v4;
      _os_log_impl(&dword_1D33D5000, v41, OS_LOG_TYPE_DEFAULT, "Nothing to be played for alert configuration: %{public}@. Returning a nil alert.", buf, 0xCu);
    }

    v19 = 0;
  }

LABEL_27:
  return (TLAlert *)v19;
}

- (id)_initWithConfiguration:(id)a3 toneIdentifier:(id)a4 vibrationIdentifier:(id)a5 hasSynchronizedVibrationUnmatchedWithTone:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  TLAlert *v14;
  void *v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSString *toneIdentifier;
  uint64_t v21;
  NSString *vibrationIdentifier;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v24.receiver = self;
  v24.super_class = (Class)TLAlert;
  v14 = -[TLAlert init](&v24, sel_init);
  if (v14)
  {
    +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isInternalInstall");

    if (v16)
    {
      do
      {
        v17 = __ldaxr(&_initWithConfiguration_toneIdentifier_vibrationIdentifier_hasSynchronizedVibrationUnmatchedWithTone___TLAlertLastAllocatedInstanceIndex);
        v18 = v17 + 1;
      }
      while (__stlxr(v18, &_initWithConfiguration_toneIdentifier_vibrationIdentifier_hasSynchronizedVibrationUnmatchedWithTone___TLAlertLastAllocatedInstanceIndex));
      v14->_instanceIndex = v18;
    }
    objc_msgSend(v11, "_freeze");
    objc_storeStrong((id *)&v14->_configuration, a3);
    v14->_type = objc_msgSend(v11, "type");
    v19 = objc_msgSend(v12, "copy");
    toneIdentifier = v14->_toneIdentifier;
    v14->_toneIdentifier = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    vibrationIdentifier = v14->_vibrationIdentifier;
    v14->_vibrationIdentifier = (NSString *)v21;

    v14->_hasSynchronizedVibrationUnmatchedWithTone = a6;
  }

  return v14;
}

- (void)play
{
  -[TLAlert playWithCompletionHandler:](self, "playWithCompletionHandler:", 0);
}

- (void)playWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TLLogPlayback();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[TLAlert debugDescription](self, "debugDescription");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = "!= NULL";
    if (!v4)
      v8 = "== NULL";
    v10 = 138543618;
    v11 = v6;
    v12 = 2082;
    v13 = v8;
    _os_log_impl(&dword_1D33D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: -play…: completionHandler %{public}s.", (uint8_t *)&v10, 0x16u);

  }
  +[TLAlertController sharedAlertController](TLAlertController, "sharedAlertController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playAlert:withCompletionHandler:", self, v4);

}

- (void)stop
{
  -[TLAlert stopWithOptions:](self, "stopWithOptions:", 0);
}

- (void)stopWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  TLAlert *v9;
  uint8_t buf[4];
  TLAlert *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TLLogPlayback();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1D33D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: -stop…: options = %{public}@.", buf, 0x16u);
  }

  v6 = (void *)objc_msgSend(v4, "copy");
  +[TLAlertController sharedAlertController](TLAlertController, "sharedAlertController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopPlayingAlerts:withOptions:playbackCompletionType:", v8, v6, 2);

}

- (void)preheatWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[TLAlertController sharedAlertController](TLAlertController, "sharedAlertController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preheatForAlert:completionHandler:", self, v4);

}

+ (BOOL)_watchPrefersSalientToneAndVibration
{
  void *v2;
  char v3;

  +[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_watchPrefersSalientNotifications");

  return v3;
}

+ (void)_setWatchPrefersSalientToneAndVibration:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setWatchPrefersSalientNotifications:", v3);

}

+ (int64_t)_currentOverridePolicyForType:(int64_t)a3
{
  void *v4;
  int64_t v5;

  +[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_currentOverridePolicyForAlertType:", a3);

  return v5;
}

+ (void)_setCurrentOverridePolicy:(int64_t)a3 forType:(int64_t)a4
{
  id v6;

  +[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setCurrentOverridePolicy:forAlertType:", a3, a4);

}

+ (BOOL)_stopAllAlerts
{
  NSObject *v2;
  void *v3;
  char v4;
  uint8_t v6[16];

  TLLogPlayback();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D33D5000, v2, OS_LOG_TYPE_DEFAULT, "+[TLAlert _stopAllAlerts] was called.", v6, 2u);
  }

  +[TLAlertController sharedAlertController](TLAlertController, "sharedAlertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "stopAllAlerts");

  return v4;
}

- (void)_updateAudioVolumeDynamicallyToValue:(float)a3
{
  double v5;
  id v6;

  +[TLAlertController sharedAlertController](TLAlertController, "sharedAlertController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(v6, "updateAudioVolumeDynamicallyForAlert:toValue:", self, v5);

}

- (id)_descriptionForDebugging:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  TLAlertConfiguration *configuration;
  void *v14;

  v3 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("<%@: %p"), v7, self);

  if (self->_instanceIndex >= 1)
    objc_msgSend(v8, "appendFormat:", CFSTR(" [%ld]"), self->_instanceIndex);
  if (v3)
  {
    -[TLAlertConfiguration description](self->_configuration, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    configuration = self->_configuration;
    _TLAlertTypeGetHumanReadableDescription(self->_type);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p; type = %@>"), v12, configuration, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "appendFormat:", CFSTR("; configuration = %@"), v9);
  if (-[NSString length](self->_toneIdentifier, "length"))
    objc_msgSend(v8, "appendFormat:", CFSTR("; toneIdentifier = \"%@\"), self->_toneIdentifier);
  if (-[NSString length](self->_vibrationIdentifier, "length"))
    objc_msgSend(v8, "appendFormat:", CFSTR("; vibrationIdentifier = \"%@\"), self->_vibrationIdentifier);
  objc_msgSend(v8, "appendString:", CFSTR(">"));

  return v8;
}

- (id)description
{
  return -[TLAlert _descriptionForDebugging:](self, "_descriptionForDebugging:", 0);
}

- (id)debugDescription
{
  return -[TLAlert _descriptionForDebugging:](self, "_descriptionForDebugging:", 1);
}

- (BOOL)_hasSynchronizedVibrationUnmatchedWithTone
{
  return self->_hasSynchronizedVibrationUnmatchedWithTone;
}

- (TLAlertPlaybackObserver)playbackObserver
{
  return (TLAlertPlaybackObserver *)objc_loadWeakRetained((id *)&self->_playbackObserver);
}

- (void)setPlaybackObserver:(id)a3
{
  objc_storeWeak((id *)&self->_playbackObserver, a3);
}

- (TLAlertConfiguration)configuration
{
  return self->_configuration;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)toneIdentifier
{
  return self->_toneIdentifier;
}

- (NSString)vibrationIdentifier
{
  return self->_vibrationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_toneIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_playbackObserver);
}

@end
