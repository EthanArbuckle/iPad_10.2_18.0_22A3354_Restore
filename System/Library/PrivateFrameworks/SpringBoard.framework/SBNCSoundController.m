@implementation SBNCSoundController

- (SBNCSoundController)init
{
  -[SBNCSoundController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (SBNCSoundController)initWithLockScreenManager:(id)a3 lockStateAggregator:(id)a4
{
  id v7;
  id v8;
  SBNCSoundController *v9;
  AVSpeechSynthesizer *v10;
  AVSpeechSynthesizer *speechSynthesizer;
  uint64_t v12;
  NSMutableDictionary *playingSounds;
  uint64_t v14;
  NSMutableSet *requestsRequiringExplicitKill;
  void *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SBNCSoundController;
  v9 = -[SBNCSoundController init](&v18, sel_init);
  if (v9)
  {
    v10 = (AVSpeechSynthesizer *)objc_alloc_init(MEMORY[0x1E0C89B90]);
    speechSynthesizer = v9->_speechSynthesizer;
    v9->_speechSynthesizer = v10;

    -[AVSpeechSynthesizer setIsInternalSynth:](v9->_speechSynthesizer, "setIsInternalSynth:", 1);
    -[AVSpeechSynthesizer setUsesApplicationAudioSession:](v9->_speechSynthesizer, "setUsesApplicationAudioSession:", 0);
    v12 = objc_opt_new();
    playingSounds = v9->_playingSounds;
    v9->_playingSounds = (NSMutableDictionary *)v12;

    v14 = objc_opt_new();
    requestsRequiringExplicitKill = v9->_requestsRequiringExplicitKill;
    v9->_requestsRequiringExplicitKill = (NSMutableSet *)v14;

    objc_storeStrong((id *)&v9->_lockScreenManager, a3);
    objc_storeStrong((id *)&v9->_lockStateAggregator, a4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v9, sel__hardwareButtonPressed_, *MEMORY[0x1E0DAC350], 0);
    objc_msgSend(v16, "addObserver:selector:name:object:", v9, sel__hardwareButtonPressed_, *MEMORY[0x1E0DAC358], 0);
    objc_msgSend(v16, "addObserver:selector:name:object:", v9, sel__lockStateChanged_, CFSTR("SBAggregateLockStateDidChangeNotification"), 0);

  }
  return v9;
}

- (BOOL)canPlaySoundForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  _BOOL4 v19;
  void *v20;
  NSObject *log;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "sound");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 & objc_msgSend(v8, "canPlaySound");

  -[SBNCSoundController lockScreenManager](self, "lockScreenManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 & (objc_msgSend(v10, "isInLostMode") ^ 1);

  if (-[SBNCSoundController _isDeviceUILocked](self, "_isDeviceUILocked"))
  {
    objc_msgSend(v5, "options");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 &= objc_msgSend(v12, "alertsWhenLocked");

  }
  v13 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    objc_msgSend(v5, "notificationIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "un_logDigest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sound");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "options");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "canPlaySound");
    -[SBNCSoundController lockScreenManager](self, "lockScreenManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isInLostMode");
    v19 = -[SBNCSoundController _isDeviceUILocked](self, "_isDeviceUILocked");
    objc_msgSend(v5, "options");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545154;
    v26 = v14;
    v27 = 1024;
    v28 = v11;
    v29 = 1024;
    v30 = v5 != 0;
    v31 = 1024;
    v32 = v23 != 0;
    v33 = 1024;
    v34 = v16;
    v35 = 1024;
    v36 = v18;
    v37 = 1024;
    v38 = v19;
    v39 = 1024;
    v40 = objc_msgSend(v20, "alertsWhenLocked");
    _os_log_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEFAULT, "Sound can be played for notification %{public}@: %d [ hasRequest: %d hasSound: %d canPlaySound: %d isInLostMode: %d isDeviceUILocked: %d alertsWhenLocked: %d ]", buf, 0x36u);

  }
  return v11;
}

- (void)playSoundForNotificationRequest:(id)a3 presentingDestination:(id)a4
{
  -[SBNCSoundController _playSoundForNotificationRequest:presentingDestination:completion:](self, "_playSoundForNotificationRequest:presentingDestination:completion:", a3, a4, 0);
}

- (void)_playSoundForNotificationRequest:(id)a3 presentingDestination:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void (**v31)(id, uint64_t);
  NSMutableDictionary *playingSounds;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  void (**v43)(id, uint64_t);
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  if (v8 && (objc_msgSend(v8, "sound"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    -[SBNCSoundController playingSounds](self, "playingSounds");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "notificationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)*MEMORY[0x1E0DC5F70];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        objc_msgSend(v8, "notificationIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "un_logDigest");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v45 = v18;
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "Already playing sound for notification %{public}@", buf, 0xCu);

      }
      if (v10)
        v10[2](v10, 1);
    }
    else
    {
      objc_msgSend(v8, "sound");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "alertConfiguration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "copy");

      if (-[SBNCSoundController _preventVibrations](self, "_preventVibrations"))
        objc_msgSend(v21, "setVibrationIdentifier:", *MEMORY[0x1E0DBF790]);
      objc_msgSend(MEMORY[0x1E0DBF730], "alertWithConfiguration:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC2A0]), "initWithToneAlert:", v22);
      v24 = (void *)*MEMORY[0x1E0DC5F70];
      v25 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT);
      if (v23)
      {
        if (v25)
        {
          v26 = v24;
          objc_msgSend(v8, "notificationIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "un_logDigest");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v45 = v28;
          v46 = 2114;
          v47 = v22;
          _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_DEFAULT, "Play sound for notification %{public}@ : %{public}@", buf, 0x16u);

        }
        if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC60C0]))
          v29 = 3;
        else
          v29 = 1;
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __89__SBNCSoundController__playSoundForNotificationRequest_presentingDestination_completion___block_invoke;
        v41[3] = &unk_1E8E9F7B8;
        v41[4] = self;
        v30 = v8;
        v42 = v30;
        v31 = v10;
        v43 = v31;
        if (objc_msgSend(v23, "playInEvironments:completion:", v29, v41))
        {
          playingSounds = self->_playingSounds;
          objc_msgSend(v30, "notificationIdentifier");
          v33 = objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](playingSounds, "setObject:forKey:", v23, v33);

          objc_msgSend(v30, "options");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v33) = objc_msgSend(v34, "silencedByMenuButtonPress");

          if ((v33 & 1) == 0)
          {
            -[SBNCSoundController requestsRequiringExplicitKill](self, "requestsRequiringExplicitKill");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "notificationIdentifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObject:", v36);

          }
        }
        else if (v31)
        {
          v31[2](v31, 0);
        }

      }
      else
      {
        if (v25)
        {
          v37 = v24;
          objc_msgSend(v8, "notificationIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "un_logDigest");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "sound");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v45 = v39;
          v46 = 2112;
          v47 = v40;
          _os_log_impl(&dword_1D0540000, v37, OS_LOG_TYPE_DEFAULT, "cannot play sound for notification (failed to create SBUISound) %{public}@ : ncSound=%@", buf, 0x16u);

        }
        if (v10)
          v10[2](v10, 0);
      }

    }
  }
  else if (v10)
  {
    v10[2](v10, 0);
  }

}

uint64_t __89__SBNCSoundController__playSoundForNotificationRequest_presentingDestination_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "playingSounds");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "notificationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  objc_msgSend(*(id *)(a1 + 32), "requestsRequiringExplicitKill");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "notificationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v5);

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)playSoundIfPossibleForNotificationRequest:(id)a3 presentingDestination:(id)a4
{
  -[SBNCSoundController _playSoundIfPossibleForNotificationRequest:presentingDestination:completion:](self, "_playSoundIfPossibleForNotificationRequest:presentingDestination:completion:", a3, a4, 0);
}

- (void)_playSoundIfPossibleForNotificationRequest:(id)a3 presentingDestination:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  if (-[SBNCSoundController canPlaySoundForNotificationRequest:](self, "canPlaySoundForNotificationRequest:", v8))
  {
    objc_msgSend(v8, "alertOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "shouldSuppress");

    if (!v12)
    {
      -[SBNCSoundController _playSoundForNotificationRequest:presentingDestination:completion:](self, "_playSoundForNotificationRequest:presentingDestination:completion:", v8, v9, v10);
      goto LABEL_8;
    }
    v13 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      objc_msgSend(v8, "notificationIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "un_logDigest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Sound cannot be played for notification %{public}@ because DND suppressed it", (uint8_t *)&v17, 0xCu);

    }
  }
  if (v10)
    v10[2](v10, 0);
LABEL_8:

}

- (void)playSoundAndReadOutForNotificationRequest:(id)a3 presentingDestination:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__SBNCSoundController_playSoundAndReadOutForNotificationRequest_presentingDestination___block_invoke;
  v9[3] = &unk_1E8EA1598;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  -[SBNCSoundController _playSoundIfPossibleForNotificationRequest:presentingDestination:completion:](self, "_playSoundIfPossibleForNotificationRequest:presentingDestination:completion:", v8, v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __87__SBNCSoundController_playSoundAndReadOutForNotificationRequest_presentingDestination___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ((a2 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "sound");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "options");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "speechLanguage");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v7, "length"))
        {
          objc_msgSend(*(id *)(a1 + 32), "content");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "title");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "content");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "subtitle");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "content");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "message");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37A0], "string");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "length"))
            objc_msgSend(v14, "appendString:", v9);
          if (objc_msgSend(v11, "length"))
          {
            if (objc_msgSend(v14, "length"))
              objc_msgSend(v14, "appendString:", CFSTR(", "));
            objc_msgSend(v14, "appendString:", v11);
          }
          if (objc_msgSend(v13, "length"))
          {
            if (objc_msgSend(v14, "length"))
              objc_msgSend(v14, "appendString:", CFSTR(", "));
            objc_msgSend(v14, "appendString:", v13);
          }
          if (objc_msgSend(v14, "length"))
          {
            v15 = (void *)*MEMORY[0x1E0DC5F70];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
            {
              v16 = *(void **)(a1 + 32);
              v17 = v15;
              objc_msgSend(v16, "notificationIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "un_logDigest");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = 138543618;
              v24 = v19;
              v25 = 2114;
              v26 = v7;
              _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "Read out notification %{public}@ in language %{public}@", (uint8_t *)&v23, 0x16u);

            }
            objc_msgSend(MEMORY[0x1E0C89BA0], "speechUtteranceWithString:", v14);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C89B80], "voiceWithLanguage:", v7);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setVoice:", v21);

            objc_msgSend(WeakRetained, "speechSynthesizer");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "speakUtterance:", v20);

          }
        }

      }
    }
  }

}

- (void)stopSoundForNotificationRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SBNCSoundController playingSounds](self, "playingSounds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notificationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "stop");
    -[SBNCSoundController playingSounds](self, "playingSounds");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

  }
}

- (void)_killSounds
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SBNCSoundController playingSounds](self, "playingSounds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[SBNCSoundController playingSounds](self, "playingSounds");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v5, "mutableCopy");

    -[SBNCSoundController requestsRequiringExplicitKill](self, "requestsRequiringExplicitKill");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectsForKeys:", v7);

    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_394);
    -[SBNCSoundController playingSounds](self, "playingSounds");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectsForKeys:", v9);

  }
}

uint64_t __34__SBNCSoundController__killSounds__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "stop");
}

- (BOOL)_isDeviceUILocked
{
  void *v2;
  char v3;

  -[SBNCSoundController lockStateAggregator](self, "lockStateAggregator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasAnyLockState");

  return v3;
}

- (void)_hardwareButtonPressed:(id)a3
{
  id v4;

  objc_msgSend(a3, "name");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SBNCSoundController _isDeviceUILocked](self, "_isDeviceUILocked")
    && ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAC358]) & 1) != 0
     || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAC350])))
  {
    -[SBNCSoundController _killSounds](self, "_killSounds");
  }

}

- (void)_lockStateChanged:(id)a3
{
  if (!-[SBLockScreenManager isUILocked](self->_lockScreenManager, "isUILocked", a3))
    -[SBNCSoundController _killSounds](self, "_killSounds");
}

- (BOOL)_preventVibrations
{
  void *v2;
  char v3;

  -[SBNCSoundController _ambientPresentationController](self, "_ambientPresentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPresented");

  return v3;
}

- (id)_ambientPresentationController
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeDisplayWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ambientPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SBLockScreenManager)lockScreenManager
{
  return self->_lockScreenManager;
}

- (void)setLockScreenManager:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenManager, a3);
}

- (SBLockStateAggregator)lockStateAggregator
{
  return self->_lockStateAggregator;
}

- (void)setLockStateAggregator:(id)a3
{
  objc_storeStrong((id *)&self->_lockStateAggregator, a3);
}

- (AVSpeechSynthesizer)speechSynthesizer
{
  return self->_speechSynthesizer;
}

- (void)setSpeechSynthesizer:(id)a3
{
  objc_storeStrong((id *)&self->_speechSynthesizer, a3);
}

- (NSMutableDictionary)playingSounds
{
  return self->_playingSounds;
}

- (void)setPlayingSounds:(id)a3
{
  objc_storeStrong((id *)&self->_playingSounds, a3);
}

- (NSMutableSet)requestsRequiringExplicitKill
{
  return self->_requestsRequiringExplicitKill;
}

- (void)setRequestsRequiringExplicitKill:(id)a3
{
  objc_storeStrong((id *)&self->_requestsRequiringExplicitKill, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestsRequiringExplicitKill, 0);
  objc_storeStrong((id *)&self->_playingSounds, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_lockStateAggregator, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
}

@end
