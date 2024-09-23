@implementation TUAudioSystemController

+ (id)filteredPickableRoutesFromPickableRoutes:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v21 = 0;
        v22 = &v21;
        v23 = 0x2020000000;
        v9 = (id *)getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr;
        v24 = getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr;
        if (!getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr)
        {
          v10 = (void *)MediaExperienceLibrary();
          v9 = (id *)dlsym(v10, "AVSystemController_RouteDescriptionKey_AVAudioRouteName");
          v22[3] = (uint64_t)v9;
          getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr = (uint64_t)v9;
        }
        _Block_object_dispose(&v21, 8);
        if (!v9)
          +[TUAudioSystemController filteredPickableRoutesFromPickableRoutes:].cold.1();
        v11 = *v9;
        if (v11)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("AirTunes"));

          if ((v13 & 1) == 0)
            objc_msgSend(v16, "addObject:", v8);
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v5);
  }

  v14 = (void *)objc_msgSend(v16, "copy");
  return v14;
}

void __62__TUAudioSystemController__handleVolumeDidChangeNotification___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("TUAudioSystemActiveCategoryVolumeChangedNotification"), 0);

}

- (void)_handleVolumeDidChangeNotification:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Volume changed: %@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_39);
}

id __32__TUAudioSystemController_isTTY__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  id v5;

  +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v0, "getActiveCategoryVolume:andName:", 0, &v5);
  v1 = v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = objc_msgSend(v1, "isEqualToString:", CFSTR("TTYCall"));

  objc_msgSend(v2, "numberWithBool:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __83__TUAudioSystemController__pickableRoutesForPlayAndRecordVideoWithForceNewRequest___block_invoke()
{
  void **v0;
  void *v1;
  void **v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (!__sharedController_block_invoke__kMXSessionAudioCategory_PlayAndRecord_NoBluetooth)
  {
    v0 = (void **)CUTWeakLinkSymbol();
    if (v0)
      v1 = *v0;
    else
      v1 = 0;
    objc_storeStrong((id *)&__sharedController_block_invoke__kMXSessionAudioCategory_PlayAndRecord_NoBluetooth, v1);
  }
  if (!__sharedController_block_invoke__kMXSessionAudioMode_VideoChat)
  {
    v2 = (void **)CUTWeakLinkSymbol();
    if (v2)
      v3 = *v2;
    else
      v3 = 0;
    objc_storeStrong((id *)&__sharedController_block_invoke__kMXSessionAudioMode_VideoChat, v3);
  }
  v4 = (void *)objc_opt_class();
  +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pickableRoutesForCategory:andMode:", __sharedController_block_invoke__kMXSessionAudioCategory_PlayAndRecord_NoBluetooth, __sharedController_block_invoke__kMXSessionAudioMode_VideoChat);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredPickableRoutesFromPickableRoutes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __74__TUAudioSystemController__pickableRoutesForVoiceMailWithForceNewRequest___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)objc_opt_class();
  +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pickableRoutesForCategory:andMode:", _pickableRoutesForVoiceMailWithForceNewRequest___kMXSessionAudioCategory_Voicemail, _pickableRoutesForVoiceMailWithForceNewRequest___kMXSessionAudioMode_VoiceChat);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "filteredPickableRoutesFromPickableRoutes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __89__TUAudioSystemController__pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasActiveAudioSession");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "pickableRoutesForActiveCall");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pickableRoutesForCategory:andMode:", _pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth, _pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___kMXSessionAudioMode_RemoteVoiceChat);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend((id)objc_opt_class(), "filteredPickableRoutesFromPickableRoutes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __74__TUAudioSystemController__pickableRoutesForPhoneCallWithForceNewRequest___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasActiveAudioSession");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "pickableRoutesForActiveCall");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pickableRoutesForCategory:", CFSTR("PhoneCall"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend((id)objc_opt_class(), "filteredPickableRoutesFromPickableRoutes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sharedSystemController
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v2 = (void *)getAVSystemControllerClass_softClass;
  v11 = getAVSystemControllerClass_softClass;
  if (!getAVSystemControllerClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getAVSystemControllerClass_block_invoke;
    v7[3] = &unk_1E38A1710;
    v7[4] = &v8;
    __getAVSystemControllerClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v3, "sharedAVSystemController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "[WARN] +[AVSystemController sharedAVSystemController] returned nil value", (uint8_t *)v7, 2u);
    }

  }
  return v4;
}

- (void)_handlePickableRoutesDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSArray *currentPickableRoutes;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Pickable Routes Changed: %@", (uint8_t *)&v13, 0xCu);
  }

  if (-[TUAudioSystemController isTTY](self, "isTTY"))
  {
    v6 = -[TUAudioSystemController _pickableRoutesForTTYWithForceNewRequest:](self, "_pickableRoutesForTTYWithForceNewRequest:", 1);
  }
  else
  {
    v7 = -[TUAudioSystemController _pickableRoutesForPhoneCallWithForceNewRequest:](self, "_pickableRoutesForPhoneCallWithForceNewRequest:", 1);
    v8 = -[TUAudioSystemController _pickableRoutesForPlayAndRecordVideoWithForceNewRequest:](self, "_pickableRoutesForPlayAndRecordVideoWithForceNewRequest:", 1);
    v9 = -[TUAudioSystemController _pickableRoutesForPlayAndRecordVoiceWithForceNewRequest:](self, "_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest:", 1);
    v10 = -[TUAudioSystemController _pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest:](self, "_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest:", 1);
    v11 = -[TUAudioSystemController _pickableRoutesForVoiceMailWithForceNewRequest:](self, "_pickableRoutesForVoiceMailWithForceNewRequest:", 1);
  }
  -[TUAudioController _acquireLock](self, "_acquireLock");
  currentPickableRoutes = self->_currentPickableRoutes;
  if (currentPickableRoutes)
  {
    self->_currentPickableRoutes = 0;

    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_40);
  }
  -[TUAudioController _releaseLock](self, "_releaseLock");

}

- (BOOL)isTTY
{
  BOOL v3;
  NSObject *v4;

  -[TUAudioController _acquireLock](self, "_acquireLock");
  -[TUAudioController _requestUpdatedValueWithBlock:object:isRequestingPointer:forceNewRequest:scheduleTimePointer:notificationString:queue:](self, "_requestUpdatedValueWithBlock:object:isRequestingPointer:forceNewRequest:scheduleTimePointer:notificationString:queue:", &__block_literal_global_50, &self->_isTTYCached, &self->_isRequestingTTY, 0, &self->_lastTTYRequestScheduleTime, CFSTR("TUAudioSystemTTYChangedNotification"), self->_ttyQueue);
  v3 = -[NSNumber BOOLValue](self->_isTTYCached, "BOOLValue");
  -[TUAudioController _releaseLock](self, "_releaseLock");
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[TUAudioSystemController isTTY].cold.1();

  return v3;
}

- (id)_pickableRoutesForVoiceMailWithForceNewRequest:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  void **v8;
  void *v9;
  void **v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  uint8_t buf[16];
  _QWORD aBlock[5];
  _QWORD v18[2];
  _QWORD v19[3];

  v3 = a3;
  v19[2] = *MEMORY[0x1E0C80C00];
  v5 = +[TUCallCapabilities supportsPrimaryCalling](TUCallCapabilities, "supportsPrimaryCalling");
  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[TUAudioSystemController _pickableRoutesForVoiceMailWithForceNewRequest:].cold.1();

    -[TUAudioController _acquireLock](self, "_acquireLock");
    if (!_pickableRoutesForVoiceMailWithForceNewRequest___kMXSessionAudioCategory_Voicemail)
    {
      v8 = (void **)CUTWeakLinkSymbol();
      if (v8)
        v9 = *v8;
      else
        v9 = 0;
      objc_storeStrong((id *)&_pickableRoutesForVoiceMailWithForceNewRequest___kMXSessionAudioCategory_Voicemail, v9);
    }
    if (!_pickableRoutesForVoiceMailWithForceNewRequest___kMXSessionAudioMode_VoiceChat)
    {
      v11 = (void **)CUTWeakLinkSymbol();
      if (v11)
        v12 = *v11;
      else
        v12 = 0;
      objc_storeStrong((id *)&_pickableRoutesForVoiceMailWithForceNewRequest___kMXSessionAudioMode_VoiceChat, v12);
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__TUAudioSystemController__pickableRoutesForVoiceMailWithForceNewRequest___block_invoke;
    aBlock[3] = &unk_1E38A2738;
    aBlock[4] = self;
    v13 = _Block_copy(aBlock);
    v14 = 0;
    if (_pickableRoutesForVoiceMailWithForceNewRequest___kMXSessionAudioCategory_Voicemail)
    {
      if (_pickableRoutesForVoiceMailWithForceNewRequest___kMXSessionAudioMode_VoiceChat)
      {
        v18[0] = CFSTR("TUAudioSystemCategoryKey");
        v18[1] = CFSTR("TUAudioSystemModeKey");
        v19[0] = _pickableRoutesForVoiceMailWithForceNewRequest___kMXSessionAudioCategory_Voicemail;
        v19[1] = _pickableRoutesForVoiceMailWithForceNewRequest___kMXSessionAudioMode_VoiceChat;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    -[TUAudioController _requestUpdatedValueWithBlock:object:isRequestingPointer:forceNewRequest:scheduleTimePointer:notificationString:notificationUserInfo:queue:](self, "_requestUpdatedValueWithBlock:object:isRequestingPointer:forceNewRequest:scheduleTimePointer:notificationString:notificationUserInfo:queue:", v13, &self->_pickableRoutesForVoicemail, &self->_isRequestingPickableRoutesForVoicemail, v3, &self->_lastVoicemailRoutesScheduleTime, CFSTR("TUAudioSystemAudioPickableRoutesChanged"), v14, self->_pickableRoutesQueue);
    v15 = self->_pickableRoutesForVoicemail;
    -[TUAudioController _releaseLock](self, "_releaseLock");

    return v15;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "_pickableRoutesForVoiceMailWithForceNewRequest is unsupported", buf, 2u);
    }

    return MEMORY[0x1E0C9AA60];
  }
}

- (id)_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void **v6;
  void *v7;
  void **v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  _QWORD aBlock[5];
  _QWORD v16[2];
  _QWORD v17[3];

  v3 = a3;
  v17[2] = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[TUAudioSystemController _pickableRoutesForPlayAndRecordVoiceWithForceNewRequest:].cold.1();

  -[TUAudioController _acquireLock](self, "_acquireLock");
  if (!_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth)
  {
    v6 = (void **)CUTWeakLinkSymbol();
    if (v6)
      v7 = *v6;
    else
      v7 = 0;
    objc_storeStrong((id *)&_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth, v7);
  }
  if (!_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___kMXSessionAudioMode_VoiceChat)
  {
    v8 = (void **)CUTWeakLinkSymbol();
    if (v8)
      v9 = *v8;
    else
      v9 = 0;
    objc_storeStrong((id *)&_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___kMXSessionAudioMode_VoiceChat, v9);
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__TUAudioSystemController__pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___block_invoke;
  aBlock[3] = &unk_1E38A2738;
  aBlock[4] = self;
  v10 = _Block_copy(aBlock);
  v11 = 0;
  if (_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth
    && _pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___kMXSessionAudioMode_VoiceChat)
  {
    v16[0] = CFSTR("TUAudioSystemCategoryKey");
    v16[1] = CFSTR("TUAudioSystemModeKey");
    v17[0] = _pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth;
    v17[1] = _pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___kMXSessionAudioMode_VoiceChat;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[TUAudioController _requestUpdatedValueWithBlock:object:isRequestingPointer:forceNewRequest:scheduleTimePointer:notificationString:notificationUserInfo:queue:](self, "_requestUpdatedValueWithBlock:object:isRequestingPointer:forceNewRequest:scheduleTimePointer:notificationString:notificationUserInfo:queue:", v10, &self->_pickableRoutesForPlayAndRecordVoice, &self->_isRequestingPickableRoutesForPlayAndRecordVoice, v3, &self->_lastPlayAndRecordVoiceRoutesScheduleTime, CFSTR("TUAudioSystemAudioPickableRoutesChanged"), v11, self->_pickableRoutesQueue);
  v12 = self->_pickableRoutesForPlayAndRecordVoice;
  -[TUAudioController _releaseLock](self, "_releaseLock");
  v13 = v12;

  return v13;
}

- (id)_pickableRoutesForPlayAndRecordVideoWithForceNewRequest:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void **v6;
  void *v7;
  void **v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  _QWORD aBlock[5];
  _QWORD v16[2];
  _QWORD v17[3];

  v3 = a3;
  v17[2] = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[TUAudioSystemController _pickableRoutesForPlayAndRecordVideoWithForceNewRequest:].cold.1();

  -[TUAudioController _acquireLock](self, "_acquireLock");
  if (!_pickableRoutesForPlayAndRecordVideoWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth)
  {
    v6 = (void **)CUTWeakLinkSymbol();
    if (v6)
      v7 = *v6;
    else
      v7 = 0;
    objc_storeStrong((id *)&_pickableRoutesForPlayAndRecordVideoWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth, v7);
  }
  if (!_pickableRoutesForPlayAndRecordVideoWithForceNewRequest___kMXSessionAudioMode_VideoChat)
  {
    v8 = (void **)CUTWeakLinkSymbol();
    if (v8)
      v9 = *v8;
    else
      v9 = 0;
    objc_storeStrong((id *)&_pickableRoutesForPlayAndRecordVideoWithForceNewRequest___kMXSessionAudioMode_VideoChat, v9);
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__TUAudioSystemController__pickableRoutesForPlayAndRecordVideoWithForceNewRequest___block_invoke;
  aBlock[3] = &unk_1E38A2738;
  aBlock[4] = self;
  v10 = _Block_copy(aBlock);
  v11 = 0;
  if (_pickableRoutesForPlayAndRecordVideoWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth
    && _pickableRoutesForPlayAndRecordVideoWithForceNewRequest___kMXSessionAudioMode_VideoChat)
  {
    v16[0] = CFSTR("TUAudioSystemCategoryKey");
    v16[1] = CFSTR("TUAudioSystemModeKey");
    v17[0] = _pickableRoutesForPlayAndRecordVideoWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth;
    v17[1] = _pickableRoutesForPlayAndRecordVideoWithForceNewRequest___kMXSessionAudioMode_VideoChat;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[TUAudioController _requestUpdatedValueWithBlock:object:isRequestingPointer:forceNewRequest:scheduleTimePointer:notificationString:notificationUserInfo:queue:](self, "_requestUpdatedValueWithBlock:object:isRequestingPointer:forceNewRequest:scheduleTimePointer:notificationString:notificationUserInfo:queue:", v10, &self->_pickableRoutesForPlayAndRecordVideo, &self->_isRequestingPickableRoutesForPlayAndRecordVideo, v3, &self->_lastPlayAndRecordVideoRoutesScheduleTime, CFSTR("TUAudioSystemAudioPickableRoutesChanged"), v11, self->_pickableRoutesQueue);
  v12 = self->_pickableRoutesForPlayAndRecordVideo;
  -[TUAudioController _releaseLock](self, "_releaseLock");
  v13 = v12;

  return v13;
}

- (id)_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void **v6;
  void *v7;
  void **v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  _QWORD aBlock[5];
  _QWORD v16[2];
  _QWORD v17[3];

  v3 = a3;
  v17[2] = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[TUAudioSystemController _pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest:].cold.1();

  -[TUAudioController _acquireLock](self, "_acquireLock");
  if (!_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth)
  {
    v6 = (void **)CUTWeakLinkSymbol();
    if (v6)
      v7 = *v6;
    else
      v7 = 0;
    objc_storeStrong((id *)&_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth, v7);
  }
  if (!_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___kMXSessionAudioMode_RemoteVoiceChat)
  {
    v8 = (void **)CUTWeakLinkSymbol();
    if (v8)
      v9 = *v8;
    else
      v9 = 0;
    objc_storeStrong((id *)&_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___kMXSessionAudioMode_RemoteVoiceChat, v9);
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__TUAudioSystemController__pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___block_invoke;
  aBlock[3] = &unk_1E38A2738;
  aBlock[4] = self;
  v10 = _Block_copy(aBlock);
  v11 = 0;
  if (_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth
    && _pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___kMXSessionAudioMode_RemoteVoiceChat)
  {
    v16[0] = CFSTR("TUAudioSystemCategoryKey");
    v16[1] = CFSTR("TUAudioSystemModeKey");
    v17[0] = _pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth;
    v17[1] = _pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___kMXSessionAudioMode_RemoteVoiceChat;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[TUAudioController _requestUpdatedValueWithBlock:object:isRequestingPointer:forceNewRequest:scheduleTimePointer:notificationString:notificationUserInfo:queue:](self, "_requestUpdatedValueWithBlock:object:isRequestingPointer:forceNewRequest:scheduleTimePointer:notificationString:notificationUserInfo:queue:", v10, &self->_pickableRoutesForPlayAndRecordRemoteVoice, &self->_isRequestingPickableRoutesForPlayAndRecordRemoteVoice, v3, &self->_lastPlayAndRecordRemoteVoiceRoutesScheduleTime, CFSTR("TUAudioSystemAudioPickableRoutesChanged"), v11, self->_pickableRoutesQueue);
  v12 = self->_pickableRoutesForPlayAndRecordRemoteVoice;
  -[TUAudioController _releaseLock](self, "_releaseLock");
  v13 = v12;

  return v13;
}

- (id)_pickableRoutesForPhoneCallWithForceNewRequest:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  id *v12;
  __CFString *v13;
  void *v14;
  NSArray *v15;
  _QWORD aBlock[5];
  uint8_t buf[8];
  uint64_t v19;
  void *(*v20)(uint64_t);
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  _QWORD v28[2];

  v3 = a3;
  v28[1] = *MEMORY[0x1E0C80C00];
  v5 = +[TUCallCapabilities supportsPrimaryCalling](TUCallCapabilities, "supportsPrimaryCalling");
  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[TUAudioSystemController _pickableRoutesForPhoneCallWithForceNewRequest:].cold.2();

    -[TUAudioController _acquireLock](self, "_acquireLock");
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__TUAudioSystemController__pickableRoutesForPhoneCallWithForceNewRequest___block_invoke;
    aBlock[3] = &unk_1E38A2738;
    aBlock[4] = self;
    v9 = _Block_copy(aBlock);
    -[TUAudioSystemController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasActiveAudioSession");

    if (v11)
    {
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v12 = (id *)getAVAudioSessionCategoryPhoneCallSymbolLoc_ptr;
      v26 = getAVAudioSessionCategoryPhoneCallSymbolLoc_ptr;
      if (!getAVAudioSessionCategoryPhoneCallSymbolLoc_ptr)
      {
        *(_QWORD *)buf = v8;
        v19 = 3221225472;
        v20 = __getAVAudioSessionCategoryPhoneCallSymbolLoc_block_invoke;
        v21 = &unk_1E38A1710;
        v22 = &v23;
        __getAVAudioSessionCategoryPhoneCallSymbolLoc_block_invoke((uint64_t)buf);
        v12 = (id *)v24[3];
      }
      _Block_object_dispose(&v23, 8);
      if (!v12)
        -[TUAudioSystemController _pickableRoutesForPhoneCallWithForceNewRequest:].cold.1();
      v13 = (__CFString *)*v12;
      if (!v13)
      {
        v14 = 0;
LABEL_15:
        -[TUAudioController _requestUpdatedValueWithBlock:object:isRequestingPointer:forceNewRequest:scheduleTimePointer:notificationString:notificationUserInfo:queue:](self, "_requestUpdatedValueWithBlock:object:isRequestingPointer:forceNewRequest:scheduleTimePointer:notificationString:notificationUserInfo:queue:", v9, &self->_pickableRoutesForPhoneCall, &self->_isRequestingPickableRoutesForPhoneCall, v3, &self->_lastPhoneCallCategoryRoutesScheduleTime, CFSTR("TUAudioSystemAudioPickableRoutesChanged"), v14, self->_pickableRoutesQueue);
        v15 = self->_pickableRoutesForPhoneCall;
        -[TUAudioController _releaseLock](self, "_releaseLock");

        return v15;
      }
    }
    else
    {
      v13 = CFSTR("PhoneCall");
    }
    v27 = CFSTR("TUAudioSystemCategoryKey");
    v28[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "_pickableRoutesForPhoneCall is unsupported", buf, 2u);
  }

  v15 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v15;
}

- (TUAudioSystemControllerDelegate)delegate
{
  return (TUAudioSystemControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

id __83__TUAudioSystemController__pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasActiveAudioSession");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "pickableRoutesForActiveCall");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pickableRoutesForCategory:andMode:", _pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth, _pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___kMXSessionAudioMode_VoiceChat);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend((id)objc_opt_class(), "filteredPickableRoutesFromPickableRoutes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __68__TUAudioSystemController__pickableRoutesForTTYWithForceNewRequest___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)objc_opt_class();
  +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  getAVSystemController_PickableRoutesAttribute();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "attributeForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "filteredPickableRoutesFromPickableRoutes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __54__TUAudioSystemController_sharedAudioSystemController__block_invoke()
{
  TUAudioSystemController *v0;
  void *v1;

  v0 = objc_alloc_init(TUAudioSystemController);
  v1 = (void *)__sharedController;
  __sharedController = (uint64_t)v0;

}

id __45__TUAudioSystemController__updateCachedState__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "isUplinkMuted");
  objc_msgSend(*(id *)(a1 + 32), "isDownlinkMuted");
  objc_msgSend(*(id *)(a1 + 32), "isTTY");
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "pickableRoutesForTTY");
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "_pickableRoutesForPhoneCallWithForceNewRequest:", 0);
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "_pickableRoutesForPlayAndRecordVideoWithForceNewRequest:", 0);
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest:", 0);
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest:", 0);
  return (id)objc_msgSend(*(id *)(a1 + 32), "_pickableRoutesForVoiceMailWithForceNewRequest:", 0);
}

id __42__TUAudioSystemController_isDownlinkMuted__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  getAVSystemController_DownlinkMuteAttribute();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "attributeForKey:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __40__TUAudioSystemController_isUplinkMuted__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  getAVSystemController_UplinkMuteAttribute();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "attributeForKey:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __31__TUAudioSystemController_init__block_invoke()
{
  return (id)objc_msgSend((id)CUTWeakLinkClass(), "sharedInstance");
}

- (NSArray)pickableRoutesForTTY
{
  return (NSArray *)-[TUAudioSystemController _pickableRoutesForTTYWithForceNewRequest:](self, "_pickableRoutesForTTYWithForceNewRequest:", 0);
}

- (BOOL)isUplinkMuted
{
  BOOL v3;
  NSObject *v4;

  -[TUAudioController _acquireLock](self, "_acquireLock");
  -[TUAudioController _requestUpdatedValueWithBlock:object:isRequestingPointer:forceNewRequest:scheduleTimePointer:notificationString:queue:](self, "_requestUpdatedValueWithBlock:object:isRequestingPointer:forceNewRequest:scheduleTimePointer:notificationString:queue:", &__block_literal_global_49, &self->_isUplinkMutedCached, &self->_isRequestingUplinkMuted, 0, &self->_lastUplinkMutedRequestScheduleTime, CFSTR("TUAudioSystemUplinkMuteStatusChangedNotification"), self->_uplinkMutedQueue);
  v3 = -[NSNumber BOOLValue](self->_isUplinkMutedCached, "BOOLValue");
  -[TUAudioController _releaseLock](self, "_releaseLock");
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[TUAudioSystemController isUplinkMuted].cold.1();

  return v3;
}

- (BOOL)isDownlinkMuted
{
  BOOL v3;
  NSObject *v4;

  -[TUAudioController _acquireLock](self, "_acquireLock");
  -[TUAudioController _requestUpdatedValueWithBlock:object:isRequestingPointer:forceNewRequest:scheduleTimePointer:notificationString:queue:](self, "_requestUpdatedValueWithBlock:object:isRequestingPointer:forceNewRequest:scheduleTimePointer:notificationString:queue:", &__block_literal_global_55_0, &self->_isDownlinkMutedCached, &self->_isRequestingDownlinkMuted, 0, &self->_lastDownlinkMutedRequestScheduleTime, CFSTR("TUAudioSystemDownlinkMuteStatusChangedNotification"), self->_downlinkMutedQueue);
  v3 = -[NSNumber BOOLValue](self->_isDownlinkMutedCached, "BOOLValue");
  -[TUAudioController _releaseLock](self, "_releaseLock");
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[TUAudioSystemController isDownlinkMuted].cold.1();

  return v3;
}

- (TUAudioSystemController)init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  dispatch_queue_t v7;
  void *v8;
  dispatch_queue_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void **v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  objc_super v36;
  uint8_t buf[4];
  const __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)TUAudioSystemController;
  v2 = -[TUAudioController init](&v36, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.TelephonyUtilities.TUAudioSystemController.UplinkMutedQueue", 0);
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    v5 = dispatch_queue_create("com.apple.TelephonyUtilities.TUAudioSystemController.DownlinkMutedQueue", 0);
    v6 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v5;

    v7 = dispatch_queue_create("com.apple.TelephonyUtilities.TUAudioSystemController.TTYQueue", 0);
    v8 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v7;

    v9 = dispatch_queue_create("com.apple.TelephonyUtilities.TUAudioSystemController.PickableRoutesQueue", 0);
    v10 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v9;

    v11 = *((_QWORD *)v2 + 2);
    dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v11, v12);

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 3), v12);
    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 4), v12);

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 5), v12);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v13;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v15;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v17;

    v19 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    v20 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v19;

    v21 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    v22 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v21;

    v23 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    v24 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v23;

    v25 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    v26 = (void *)*((_QWORD *)v2 + 12);
    *((_QWORD *)v2 + 12) = v25;

    v27 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    v28 = (void *)*((_QWORD *)v2 + 13);
    *((_QWORD *)v2 + 13) = v27;

    v29 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    v30 = (void *)*((_QWORD *)v2 + 14);
    *((_QWORD *)v2 + 14) = v29;

    *((_BYTE *)v2 + 128) = 0;
    *((_BYTE *)v2 + 129) = 0;
    *((_BYTE *)v2 + 130) = 0;
    *((_BYTE *)v2 + 131) = 0;
    *((_BYTE *)v2 + 132) = 0;
    *((_BYTE *)v2 + 133) = 0;
    *((_BYTE *)v2 + 134) = 0;
    *((_BYTE *)v2 + 135) = 0;
    *((_BYTE *)v2 + 136) = 0;
    *((_QWORD *)v2 + 18) = 0;
    *((_QWORD *)v2 + 19) = 0;
    *((_QWORD *)v2 + 20) = 0;
    *((_QWORD *)v2 + 21) = 0;
    *((_QWORD *)v2 + 22) = 0;
    *((_QWORD *)v2 + 23) = 0;
    *((_QWORD *)v2 + 24) = 0;
    *((_QWORD *)v2 + 25) = 0;
    *((_QWORD *)v2 + 26) = 0;
    objc_msgSend(v2, "_subscribeToNotificationAttributes");
    if (init__AVAudioSessionMediaServicesWereResetNotification
      || ((v31 = (void **)CUTWeakLinkSymbol()) == 0 ? (v32 = 0) : (v32 = *v31),
          objc_storeStrong((id *)&init__AVAudioSessionMediaServicesWereResetNotification, v32),
          init__AVAudioSessionMediaServicesWereResetNotification))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v33 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObserver:selector:name:object:](v33, "addObserver:selector:name:object:", v2, sel__mediaServicesWereReset_, init__AVAudioSessionMediaServicesWereResetNotification, 0);
    }
    else
    {
      TUDefaultLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v38 = CFSTR("AVAudioSessionMediaServicesWereResetNotification");
        _os_log_impl(&dword_19A50D000, v33, OS_LOG_TYPE_DEFAULT, "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.", buf, 0xCu);
      }
    }

    dispatch_get_global_queue(21, 0);
    v34 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v34, &__block_literal_global_28);

    objc_msgSend(v2, "_updateCachedState");
  }
  return (TUAudioSystemController *)v2;
}

- (void)_updateCachedState
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__TUAudioSystemController__updateCachedState__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_subscribeToNotificationAttributes
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_SubscribeToNotificationsAttribute(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioSystemController.m"), 43, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (id)_pickableRoutesForTTYWithForceNewRequest:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  _QWORD aBlock[5];

  v3 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[TUAudioSystemController _pickableRoutesForTTYWithForceNewRequest:].cold.1();

  -[TUAudioController _acquireLock](self, "_acquireLock");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__TUAudioSystemController__pickableRoutesForTTYWithForceNewRequest___block_invoke;
  aBlock[3] = &unk_1E38A2738;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  -[TUAudioController _requestUpdatedValueWithBlock:object:isRequestingPointer:forceNewRequest:scheduleTimePointer:notificationString:queue:](self, "_requestUpdatedValueWithBlock:object:isRequestingPointer:forceNewRequest:scheduleTimePointer:notificationString:queue:", v6, &self->_pickableRoutesForTTY, &self->_isRequestingPickableRoutesForTTY, v3, &self->_lastTTYPickableRoutesScheduleTime, CFSTR("TUAudioSystemAudioPickableRoutesChanged"), self->_pickableRoutesQueue);
  v7 = self->_pickableRoutesForTTY;
  -[TUAudioController _releaseLock](self, "_releaseLock");
  v8 = v7;

  return v8;
}

+ (TUAudioSystemController)sharedAudioSystemController
{
  if (sharedAudioSystemController_onceToken != -1)
    dispatch_once(&sharedAudioSystemController_onceToken, &__block_literal_global_20);
  return (TUAudioSystemController *)(id)__sharedController;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TUAudioSystemController;
  -[TUAudioSystemController dealloc](&v4, sel_dealloc);
}

- (void)_handleUplinkMuteDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Mute status changed: %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUAudioSystemController isUplinkMuted](self, "isUplinkMuted");
}

- (void)_handleDownlinkMuteDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Downlink mute status changed: %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUAudioSystemController isDownlinkMuted](self, "isDownlinkMuted");
}

void __70__TUAudioSystemController__handlePickableRoutesDidChangeNotification___block_invoke()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  TUDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_19A50D000, v0, OS_LOG_TYPE_DEFAULT, "Clearing cached current pickable routes and posting TUAudioSystemAudioPickableRoutesChanged", v2, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("TUAudioSystemAudioPickableRoutesChanged"), 0);

}

- (void)_mediaServicesWereReset:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Media services were reset: %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUAudioSystemController _subscribeToNotificationAttributes](self, "_subscribeToNotificationAttributes");
  -[TUAudioSystemController _updateCachedState](self, "_updateCachedState");

}

- (float)activeCategoryVolume
{
  void *v2;
  NSObject *v3;
  float v5;

  v5 = 0.0;
  +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getActiveCategoryVolume:andName:", &v5, 0);

  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[TUAudioSystemController activeCategoryVolume].cold.1(&v5, v3);

  return v5;
}

- (void)triggerEndInterruptionForAudioSessionID:(id)a3
{
  id v3;
  void **v4;
  void *v5;
  uint64_t v6;
  void **v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];
  __int128 buf;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!triggerEndInterruptionForAudioSessionID__kAVSystemController_PostInterruptionEndedNotificationKey_AudioSessionID)
  {
    v4 = (void **)CUTWeakLinkSymbol();
    if (v4)
      v5 = *v4;
    else
      v5 = 0;
    objc_storeStrong((id *)&triggerEndInterruptionForAudioSessionID__kAVSystemController_PostInterruptionEndedNotificationKey_AudioSessionID, v5);
  }
  v6 = triggerEndInterruptionForAudioSessionID__kAVSystemController_PostInterruptionEndedNotificationKey_IsResumable;
  if (!triggerEndInterruptionForAudioSessionID__kAVSystemController_PostInterruptionEndedNotificationKey_IsResumable)
  {
    v7 = (void **)CUTWeakLinkSymbol();
    if (v7)
      v8 = *v7;
    else
      v8 = 0;
    objc_storeStrong((id *)&triggerEndInterruptionForAudioSessionID__kAVSystemController_PostInterruptionEndedNotificationKey_IsResumable, v8);
    v6 = triggerEndInterruptionForAudioSessionID__kAVSystemController_PostInterruptionEndedNotificationKey_IsResumable;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1, triggerEndInterruptionForAudioSessionID__kAVSystemController_PostInterruptionEndedNotificationKey_AudioSessionID, v6, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  TUDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "Triggering an end of interruption for audio session with ID %@", (uint8_t *)&buf, 0xCu);
  }

  +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v18 = 0x2020000000;
  v13 = (_QWORD *)getAVSystemController_PostInterruptionEndedNotificationSymbolLoc_ptr;
  v19 = getAVSystemController_PostInterruptionEndedNotificationSymbolLoc_ptr;
  if (!getAVSystemController_PostInterruptionEndedNotificationSymbolLoc_ptr)
  {
    v14 = (void *)MediaExperienceLibrary();
    v13 = dlsym(v14, "AVSystemController_PostInterruptionEndedNotification");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v13;
    getAVSystemController_PostInterruptionEndedNotificationSymbolLoc_ptr = (uint64_t)v13;
  }
  _Block_object_dispose(&buf, 8);
  if (!v13)
    -[TUAudioSystemController triggerEndInterruptionForAudioSessionID:].cold.1();
  objc_msgSend(v12, "setAttribute:forKey:error:", v10, *v13, 0);

}

- (void)clearUplinkMutedCache
{
  void *v2;
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v6[16];
  uint8_t buf[16];

  +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Clearing uplink mute cache for AVSystemController", buf, 2u);
    }

    +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject clearUplinkMutedCache](v4, "clearUplinkMutedCache");
  }
  else if (v5)
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Not clearing uplink mute cache for AVSystemController since it does not conform to clearUplinkMutedCache", v6, 2u);
  }

}

- (void)setActiveCategoryVolume:(float)a3
{
  NSObject *v4;
  _QWORD block[4];
  float v6;

  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__TUAudioSystemController_setActiveCategoryVolume___block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v6 = a3;
  dispatch_async(v4, block);

}

void __51__TUAudioSystemController_setActiveCategoryVolume___block_invoke(uint64_t a1)
{
  NSObject *v2;
  double v3;
  void *v4;
  uint64_t v5;
  int v6;
  double v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(float *)(a1 + 32);
    v16 = 134217984;
    v17 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Setting active category volume to %f", (uint8_t *)&v16, 0xCu);
  }

  +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_DWORD *)(a1 + 32);
  v5 = a1 + 32;
  LODWORD(v7) = v6;
  v8 = objc_msgSend(v4, "setActiveCategoryVolumeTo:", v7);

  if ((v8 & 1) == 0)
  {
    TUDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __51__TUAudioSystemController_setActiveCategoryVolume___block_invoke_cold_1(v5, v9, v10, v11, v12, v13, v14, v15);

  }
}

- (void)setUplinkMuted:(BOOL)a3
{
  void *v5;
  void *v6;
  NSObject *uplinkMutedQueue;
  _QWORD block[5];
  id v9;
  BOOL v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!self->_isUplinkMutedCached || (objc_msgSend(v5, "isEqualToNumber:") & 1) == 0)
  {
    uplinkMutedQueue = self->_uplinkMutedQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__TUAudioSystemController_setUplinkMuted___block_invoke;
    block[3] = &unk_1E38A26F0;
    block[4] = self;
    v9 = v6;
    v10 = a3;
    dispatch_async(uplinkMutedQueue, block);

  }
}

void __42__TUAudioSystemController_setUplinkMuted___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_acquireLock");
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v21 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "setting isUplinkMuted value = %@", buf, 0xCu);
  }

  +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  getAVSystemController_UplinkMuteAttribute();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v7 = objc_msgSend(v4, "setAttribute:forKey:error:", v5, v6, &v19);
  v8 = v19;

  if ((v7 & 1) != 0)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", *(unsigned __int8 *)(a1 + 48));
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 48);
    *(_QWORD *)(v10 + 48) = v9;

    objc_msgSend(*(id *)(a1 + 32), "_releaseLock");
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_54);
  }
  else
  {
    TUDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __42__TUAudioSystemController_setUplinkMuted___block_invoke_cold_1((uint64_t)v8, v12, v13, v14, v15, v16, v17, v18);

    objc_msgSend(*(id *)(a1 + 32), "_releaseLock");
  }

}

void __42__TUAudioSystemController_setUplinkMuted___block_invoke_53()
{
  NSObject *v0;
  void *v1;

  TUDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __42__TUAudioSystemController_setUplinkMuted___block_invoke_53_cold_1();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("TUAudioSystemUplinkMuteStatusChangedNotification"), 0);

}

- (void)setDownlinkMuted:(BOOL)a3
{
  void *v5;
  void *v6;
  NSObject *downlinkMutedQueue;
  _QWORD block[5];
  id v9;
  BOOL v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!self->_isDownlinkMutedCached || (objc_msgSend(v5, "isEqualToNumber:") & 1) == 0)
  {
    downlinkMutedQueue = self->_downlinkMutedQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__TUAudioSystemController_setDownlinkMuted___block_invoke;
    block[3] = &unk_1E38A26F0;
    block[4] = self;
    v9 = v6;
    v10 = a3;
    dispatch_async(downlinkMutedQueue, block);

  }
}

void __44__TUAudioSystemController_setDownlinkMuted___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_acquireLock");
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v21 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "setting isDownlinkMuted value = %@", buf, 0xCu);
  }

  +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  getAVSystemController_DownlinkMuteAttribute();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v7 = objc_msgSend(v4, "setAttribute:forKey:error:", v5, v6, &v19);
  v8 = v19;

  if ((v7 & 1) != 0)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", *(unsigned __int8 *)(a1 + 48));
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 56);
    *(_QWORD *)(v10 + 56) = v9;

    objc_msgSend(*(id *)(a1 + 32), "_releaseLock");
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_57_0);
  }
  else
  {
    TUDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __44__TUAudioSystemController_setDownlinkMuted___block_invoke_cold_1((uint64_t)v8, v12, v13, v14, v15, v16, v17, v18);

    objc_msgSend(*(id *)(a1 + 32), "_releaseLock");
  }

}

void __44__TUAudioSystemController_setDownlinkMuted___block_invoke_56()
{
  NSObject *v0;
  void *v1;

  TUDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __44__TUAudioSystemController_setDownlinkMuted___block_invoke_56_cold_1();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("TUAudioSystemDownlinkMuteStatusChangedNotification"), 0);

}

- (NSDictionary)pickedRouteAttribute
{
  void *v2;
  void *v3;
  void *v4;

  +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getAVSystemController_PickedRouteAttribute();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (id)pickableRoutesForActiveCall
{
  void *v2;
  void *v3;
  void *v4;

  +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getAVSystemController_PickableRoutesAttribute();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)currentlyPickedRouteIdForCategory:(id)a3 andMode:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  int v14;
  _QWORD *v15;
  void *v16;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  -[TUAudioSystemController pickableRoutesForCategory:andMode:](self, "pickableRoutesForCategory:andMode:", v18);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v24 = 0;
        v25 = &v24;
        v26 = 0x2020000000;
        v11 = (_QWORD *)getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr;
        v27 = getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr;
        if (!getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr)
        {
          v12 = (void *)MediaExperienceLibrary();
          v11 = dlsym(v12, "AVSystemController_RouteDescriptionKey_RouteCurrentlyPicked");
          v25[3] = (uint64_t)v11;
          getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr = (uint64_t)v11;
        }
        _Block_object_dispose(&v24, 8);
        if (!v11)
          -[TUAudioSystemController currentlyPickedRouteIdForCategory:andMode:].cold.1();
        objc_msgSend(v10, "objectForKeyedSubscript:", *v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "BOOLValue");

        if (v14)
        {
          v24 = 0;
          v25 = &v24;
          v26 = 0x2020000000;
          v15 = (_QWORD *)getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr;
          v27 = getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr;
          if (!getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr)
          {
            v16 = (void *)MediaExperienceLibrary();
            v15 = dlsym(v16, "AVSystemController_RouteDescriptionKey_RouteUID");
            v25[3] = (uint64_t)v15;
            getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr = (uint64_t)v15;
          }
          _Block_object_dispose(&v24, 8);
          if (!v15)
            -[TUAudioSystemController currentlyPickedRouteIdForCategory:andMode:].cold.2();
          objc_msgSend(v10, "objectForKeyedSubscript:", *v15);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_17:

  return v7;
}

+ (id)sourceIdentifierForRouteID:(id)a3
{
  id v3;
  id *v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Speaker")) & 1) != 0)
  {
    v4 = (id *)&TUCallSourceIdentifierSpeakerRoute;
LABEL_5:
    v5 = *v4;

    goto LABEL_6;
  }
  v5 = v3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("CarAudioOutput")))
  {
    v4 = (id *)&TUCallSourceIdentifierCarPlay;
    goto LABEL_5;
  }
LABEL_6:

  return v5;
}

- (void)_loadCurrentPickableRoutesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *pickableRoutesQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    pickableRoutesQueue = self->_pickableRoutesQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__TUAudioSystemController__loadCurrentPickableRoutesWithCompletion___block_invoke;
    v7[3] = &unk_1E38A1838;
    v7[4] = self;
    v8 = v4;
    dispatch_async(pickableRoutesQueue, v7);

  }
}

void __68__TUAudioSystemController__loadCurrentPickableRoutesWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;

  +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getAVSystemController_PickableRoutesAttribute();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_acquireLock");
  objc_msgSend((id)objc_opt_class(), "filteredPickableRoutesFromPickableRoutes:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v5;

  objc_msgSend(*(id *)(a1 + 32), "_releaseLock");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__TUAudioSystemController__loadCurrentPickableRoutesWithCompletion___block_invoke_2;
  block[3] = &unk_1E38A1360;
  v10 = v4;
  v8 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __68__TUAudioSystemController__loadCurrentPickableRoutesWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Fetched current pickable routes %@ and posting TUAudioSystemAudioPickableRoutesChanged", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("TUAudioSystemAudioPickableRoutesChanged"), 0);

}

- (NSArray)bestGuessPickableRoutesForAnyCall
{
  if (+[TUCallCapabilities supportsPrimaryCalling](TUCallCapabilities, "supportsPrimaryCalling"))
    -[TUAudioSystemController _pickableRoutesForPhoneCallWithForceNewRequest:](self, "_pickableRoutesForPhoneCallWithForceNewRequest:", 0);
  else
    -[TUAudioSystemController _pickableRoutesForPlayAndRecordVoiceWithForceNewRequest:](self, "_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest:", 0);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)pickableRoutesForCategory:(id)a3 andMode:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v6 = a3;
  v7 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__TUAudioSystemController_pickableRoutesForCategory_andMode___block_invoke;
  v10[3] = &unk_1E38A2760;
  v10[4] = &v11;
  -[TUAudioSystemController _getPickableRoutesForCategory:mode:onlyKnownCombinations:completion:](self, "_getPickableRoutesForCategory:mode:onlyKnownCombinations:completion:", v6, v7, 1, v10);
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __61__TUAudioSystemController_pickableRoutesForCategory_andMode___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)getPickableRoutesForCategory:(id)a3 mode:(id)a4 completion:(id)a5
{
  -[TUAudioSystemController _getPickableRoutesForCategory:mode:onlyKnownCombinations:completion:](self, "_getPickableRoutesForCategory:mode:onlyKnownCombinations:completion:", a3, a4, 0, a5);
}

- (void)_getPickableRoutesForCategory:(id)a3 mode:(id)a4 onlyKnownCombinations:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, NSArray *);
  uint64_t v13;
  void **v14;
  void *v15;
  int v16;
  void **v17;
  void *v18;
  uint64_t v19;
  void **v20;
  void *v21;
  void **v22;
  void *v23;
  NSArray *v24;
  NSArray *v25;
  NSObject *v26;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, NSArray *))a6;
  if (!v12)
    goto LABEL_47;
  if (v10)
  {
    v13 = _getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth;
    if (!_getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth)
    {
      v14 = (void **)CUTWeakLinkSymbol();
      if (v14)
        v15 = *v14;
      else
        v15 = 0;
      objc_storeStrong((id *)&_getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth, v15);
      v13 = _getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth;
    }
    v16 = TUStringsAreEqualOrNil((unint64_t)v10, v13);
    if (v11 && v16)
    {
      if (!_getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioMode_VideoChat)
      {
        v17 = (void **)CUTWeakLinkSymbol();
        if (v17)
          v18 = *v17;
        else
          v18 = 0;
        objc_storeStrong((id *)&_getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioMode_VideoChat, v18);
      }
      if (!_getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioMode_VoiceChat)
      {
        v20 = (void **)CUTWeakLinkSymbol();
        if (v20)
          v21 = *v20;
        else
          v21 = 0;
        objc_storeStrong((id *)&_getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioMode_VoiceChat, v21);
      }
      if (!_getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioMode_RemoteVoiceChat)
      {
        v22 = (void **)CUTWeakLinkSymbol();
        if (v22)
          v23 = *v22;
        else
          v23 = 0;
        objc_storeStrong((id *)&_getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioMode_RemoteVoiceChat, v23);
      }
      if (TUStringsAreEqualOrNil((unint64_t)v11, _getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioMode_VideoChat))
      {
        -[TUAudioSystemController _pickableRoutesForPlayAndRecordVideoWithForceNewRequest:](self, "_pickableRoutesForPlayAndRecordVideoWithForceNewRequest:", 0);
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      if (TUStringsAreEqualOrNil((unint64_t)v11, _getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioMode_VoiceChat))
      {
        -[TUAudioSystemController _pickableRoutesForPlayAndRecordVoiceWithForceNewRequest:](self, "_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest:", 0);
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      if (TUStringsAreEqualOrNil((unint64_t)v11, _getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioMode_RemoteVoiceChat))
      {
        -[TUAudioSystemController _pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest:](self, "_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest:", 0);
        v19 = objc_claimAutoreleasedReturnValue();
LABEL_35:
        v24 = (NSArray *)v19;
        if (a5)
          goto LABEL_41;
LABEL_38:
        if (!v24)
        {
          -[TUAudioController _acquireLock](self, "_acquireLock");
          v25 = self->_currentPickableRoutes;
          -[TUAudioController _releaseLock](self, "_releaseLock");
          if (v25)
          {
            v12[2](v12, v25);

          }
          else
          {
            -[TUAudioSystemController _loadCurrentPickableRoutesWithCompletion:](self, "_loadCurrentPickableRoutesWithCompletion:", v12);
          }
          goto LABEL_47;
        }
        goto LABEL_41;
      }
    }
    else
    {
      if (objc_msgSend((id)objc_opt_class(), "isPhoneCallAudioCategory:", v10))
      {
        -[TUAudioSystemController _pickableRoutesForPhoneCallWithForceNewRequest:](self, "_pickableRoutesForPhoneCallWithForceNewRequest:", 0);
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("Voicemail")))
      {
        -[TUAudioSystemController _pickableRoutesForVoiceMailWithForceNewRequest:](self, "_pickableRoutesForVoiceMailWithForceNewRequest:", 0);
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
    }
  }
  v24 = 0;
  if (!a5)
    goto LABEL_38;
LABEL_41:
  if (!v24)
  {
    TUDefaultLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138412546;
      v28 = v10;
      v29 = 2112;
      v30 = v11;
      _os_log_impl(&dword_19A50D000, v26, OS_LOG_TYPE_DEFAULT, "Unknown category (%@) and mode (%@) combination, using default pickable routes", (uint8_t *)&v27, 0x16u);
    }

    -[TUAudioSystemController bestGuessPickableRoutesForAnyCall](self, "bestGuessPickableRoutesForAnyCall");
    v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  v12[2](v12, v24);

LABEL_47:
}

- (BOOL)pickRoute:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "route");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  getAVSystemController_PickedRouteAttribute();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "setAttribute:forKey:error:", v7, v8, a4);

  return (char)a4;
}

- (void)switchBluetoothAudioFormats
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Notifying AVSystemController to override to partner route", v4, 2u);
  }

  +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overrideToPartnerRoute");

}

- (id)pickableRouteWithUniqueIdentifier:(id)a3
{
  TUAudioRoute *v4;
  NSObject *v5;
  TUAudioRoute *v6;
  NSObject *v7;
  TUAudioRoute *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  TUAudioRoute *v14;
  TUAudioRoute *v15;
  void *v16;
  char v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  TUAudioRoute *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (TUAudioRoute *)a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "uniqueIdentifier: %@", buf, 0xCu);
  }

  -[TUAudioSystemController bestGuessPickableRoutesForAnyCall](self, "bestGuessPickableRoutesForAnyCall");
  v6 = (TUAudioRoute *)objc_claimAutoreleasedReturnValue();
  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "using pickable routes %@", buf, 0xCu);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = -[TUAudioRoute countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
LABEL_7:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
      v14 = [TUAudioRoute alloc];
      v15 = -[TUAudioRoute initWithDictionary:](v14, "initWithDictionary:", v13, (_QWORD)v20);
      -[TURoute uniqueIdentifier](v15, "uniqueIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", v4);

      if ((v17 & 1) != 0)
        break;

      if (v10 == ++v12)
      {
        v10 = -[TUAudioRoute countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v10)
          goto LABEL_7;
        v15 = 0;
        break;
      }
    }
  }
  else
  {
    v15 = 0;
  }

  TUDefaultLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v15;
    _os_log_impl(&dword_19A50D000, v18, OS_LOG_TYPE_DEFAULT, "returning route %@", buf, 0xCu);
  }

  return v15;
}

- (BOOL)shouldSuppressCallUsingRoute:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  BOOL v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "route: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(v3, "identifiersOfOtherConnectedDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

- (BOOL)otherSessionsRequestNoRingtoneInterruption
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[TUAudioSystemController sharedSystemController](TUAudioSystemController, "sharedSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v3 = (_QWORD *)getAVSystemController_SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlertsAttributeSymbolLoc_ptr;
  v12 = getAVSystemController_SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlertsAttributeSymbolLoc_ptr;
  if (!getAVSystemController_SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlertsAttributeSymbolLoc_ptr)
  {
    v4 = (void *)MediaExperienceLibrary();
    v3 = dlsym(v4, "AVSystemController_SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlertsAttribute");
    v10[3] = (uint64_t)v3;
    getAVSystemController_SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlertsAttributeSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v9, 8);
  if (!v3)
    -[TUAudioSystemController otherSessionsRequestNoRingtoneInterruption].cold.1();
  objc_msgSend(v2, "attributeForKey:", *v3, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v9) = 67109120;
    HIDWORD(v9) = v6;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "Other sessions request no ringtone interruption: %d", (uint8_t *)&v9, 8u);
  }

  return v6;
}

+ (BOOL)isPhoneCallAudioCategory:(id)a3
{
  id v3;
  void **v4;
  void *v5;
  char v6;

  v3 = a3;
  if (!isPhoneCallAudioCategory___AVAudioSessionCategoryPhoneCall)
  {
    v4 = (void **)CUTWeakLinkSymbol();
    if (v4)
      v5 = *v4;
    else
      v5 = 0;
    objc_storeStrong((id *)&isPhoneCallAudioCategory___AVAudioSessionCategoryPhoneCall, v5);
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PhoneCall")) & 1) != 0)
  {
    v6 = 1;
  }
  else if (isPhoneCallAudioCategory___AVAudioSessionCategoryPhoneCall)
  {
    v6 = objc_msgSend(v3, "isEqualToString:");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentPickableRoutes, 0);
  objc_storeStrong((id *)&self->_pickableRoutesForVoicemail, 0);
  objc_storeStrong((id *)&self->_pickableRoutesForPlayAndRecordRemoteVoice, 0);
  objc_storeStrong((id *)&self->_pickableRoutesForPlayAndRecordVoice, 0);
  objc_storeStrong((id *)&self->_pickableRoutesForPlayAndRecordVideo, 0);
  objc_storeStrong((id *)&self->_pickableRoutesForPhoneCall, 0);
  objc_storeStrong((id *)&self->_pickableRoutesForTTY, 0);
  objc_storeStrong((id *)&self->_isTTYCached, 0);
  objc_storeStrong((id *)&self->_isDownlinkMutedCached, 0);
  objc_storeStrong((id *)&self->_isUplinkMutedCached, 0);
  objc_storeStrong((id *)&self->_pickableRoutesQueue, 0);
  objc_storeStrong((id *)&self->_ttyQueue, 0);
  objc_storeStrong((id *)&self->_downlinkMutedQueue, 0);
  objc_storeStrong((id *)&self->_uplinkMutedQueue, 0);
}

- (void)activeCategoryVolume
{
  double v2;
  int v3;
  double v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_19A50D000, a2, OS_LOG_TYPE_DEBUG, "activeCategoryVolume = %f", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)triggerEndInterruptionForAudioSessionID:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_PostInterruptionEndedNotification(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioSystemController.m"), 47, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

void __51__TUAudioSystemController_setActiveCategoryVolume___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "Failed to set active category volume to %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)isUplinkMuted
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_19A50D000, v0, v1, "isUplinkMuted = %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)isTTY
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_19A50D000, v0, v1, "isTTY = %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __42__TUAudioSystemController_setUplinkMuted___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "Failed to set isUplinkMuted: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __42__TUAudioSystemController_setUplinkMuted___block_invoke_53_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19A50D000, v0, v1, "Dispatching changed notification in response to setUplinkMuted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)isDownlinkMuted
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_19A50D000, v0, v1, "isDownlinkMuted = %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __44__TUAudioSystemController_setDownlinkMuted___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "Failed to set isDownlinkMuted: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __44__TUAudioSystemController_setDownlinkMuted___block_invoke_56_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19A50D000, v0, v1, "Dispatching changed notification in response to setDownlinkMuted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_pickableRoutesForTTYWithForceNewRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19A50D000, v0, v1, "pickableRoutesForTTY", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_pickableRoutesForPhoneCallWithForceNewRequest:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "AVAudioSessionCategory getAVAudioSessionCategoryPhoneCall(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioSystemController.m"), 54, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)_pickableRoutesForPhoneCallWithForceNewRequest:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19A50D000, v0, v1, "_pickableRoutesForPhoneCallWithForceNewRequest", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)currentlyPickedRouteIdForCategory:andMode:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_RouteCurrentlyPicked(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioSystemController.m"), 40, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)currentlyPickedRouteIdForCategory:andMode:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_RouteUID(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioSystemController.m"), 41, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19A50D000, v0, v1, "_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_pickableRoutesForPlayAndRecordVideoWithForceNewRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19A50D000, v0, v1, "_pickableRoutesForPlayAndRecordVideoWithForceNewRequest", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19A50D000, v0, v1, "_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_pickableRoutesForVoiceMailWithForceNewRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19A50D000, v0, v1, "_pickableRoutesForVoiceMailWithForceNewRequest", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)filteredPickableRoutesFromPickableRoutes:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_AVAudioRouteName(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioSystemController.m"), 39, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)otherSessionsRequestNoRingtoneInterruption
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlertsAttribute(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioSystemController.m"), 42, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

@end
