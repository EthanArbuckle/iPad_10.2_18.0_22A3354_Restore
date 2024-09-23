@implementation TUAudioDeviceController

- (TUAudioDeviceController)initWithActionsDelegate:(id)a3 serialQueue:(id)a4
{
  id v6;
  id v7;
  TUAudioDeviceController *v8;
  TUAudioDeviceController *v9;
  uint64_t v10;
  NSHashTable *delegates;
  void *v12;
  void *v13;
  void *v14;
  id registerForMutedTalkerNotificationCallback;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TUAudioDeviceController;
  v8 = -[TUAudioDeviceController init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_actionsDelegate, v6);
    objc_storeStrong((id *)&v9->_serialQueue, a4);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    delegates = v9->_delegates;
    v9->_delegates = (NSHashTable *)v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__handleCallStatusChangedNotification_, CFSTR("TUCallCenterCallStatusChangedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v9, sel__handleCallStatusChangedNotification_, CFSTR("TUCallCenterVideoCallStatusChangedNotification"), 0);

    objc_initWeak(&location, v9);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __63__TUAudioDeviceController_initWithActionsDelegate_serialQueue___block_invoke;
    v17[3] = &unk_1E38A13D0;
    objc_copyWeak(&v18, &location);
    v14 = _Block_copy(v17);
    registerForMutedTalkerNotificationCallback = v9->_registerForMutedTalkerNotificationCallback;
    v9->_registerForMutedTalkerNotificationCallback = v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __63__TUAudioDeviceController_initWithActionsDelegate_serialQueue___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__TUAudioDeviceController_initWithActionsDelegate_serialQueue___block_invoke_2;
  block[3] = &unk_1E38A13D0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  if (AAFMediaTypeXML_block_invoke_once != -1)
    dispatch_once(&AAFMediaTypeXML_block_invoke_once, block);
  objc_destroyWeak(&v2);
}

void __63__TUAudioDeviceController_initWithActionsDelegate_serialQueue___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[8];
  _QWORD v5[4];
  id v6;

  v2 = (void *)CUTWeakLinkClass();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__TUAudioDeviceController_initWithActionsDelegate_serialQueue___block_invoke_3;
  v5[3] = &unk_1E38A21F0;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  objc_msgSend(v2, "registerForMutedTalkerNotifications:", v5);
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Registered for registerForMutedTalkerNotification", v4, 2u);
  }

  objc_destroyWeak(&v6);
}

void __63__TUAudioDeviceController_initWithActionsDelegate_serialQueue___block_invoke_3(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  int v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "serialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__TUAudioDeviceController_initWithActionsDelegate_serialQueue___block_invoke_4;
    v6[3] = &unk_1E38A2178;
    v8 = a2;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __63__TUAudioDeviceController_initWithActionsDelegate_serialQueue___block_invoke_4(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t j;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 40);
  if (v2 == 1)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "delegates", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v3);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v13, "audioDeviceControllerMutedTalkerDidEnd:", *(_QWORD *)(a1 + 32));
        }
        v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v10);
    }
  }
  else
  {
    if (v2)
      return;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "delegates");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v5; ++j)
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v8, "audioDeviceControllerMutedTalkerDidStart:", *(_QWORD *)(a1 + 32));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v5);
    }
  }

}

- (void)_handleCallStatusChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void (**v10)(void);
  int v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v12, 0xCu);
  }

  if (_TUIsInternalInstall())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "tu_defaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("shouldSuppressMutedTalkerNotification")) ^ 1;

  }
  else
  {
    v7 = 1;
  }
  objc_msgSend(v4, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 && v8)
  {
    objc_msgSend(v8, "provider");
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "isSystemProvider"))
    {
LABEL_11:

      goto LABEL_12;
    }
    v11 = objc_msgSend(v9, "isActive");

    if (v11)
    {
      -[TUAudioDeviceController registerForMutedTalkerNotificationCallback](self, "registerForMutedTalkerNotificationCallback");
      v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v10[2]();
      goto LABEL_11;
    }
  }
LABEL_12:

}

- (void)notifyDelegatesOfDeviceListChange
{
  NSObject *v3;
  _QWORD block[5];

  -[TUAudioDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__TUAudioDeviceController_notifyDelegatesOfDeviceListChange__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(v3, block);

}

void __60__TUAudioDeviceController_notifyDelegatesOfDeviceListChange__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[8];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Audio devices changed", buf, 2u);
  }

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegates", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "audioDeviceControllerDeviceListChanged:", *(_QWORD *)(a1 + 32));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  objc_msgSend((id)CUTWeakLinkClass(), "unregisterFromMutedTalkerNotifications");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.facetime.audioInputChangedNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)TUAudioDeviceController;
  -[TUAudioDeviceController dealloc](&v4, sel_dealloc);
}

- (TUAudioDeviceController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUAudioDeviceController.m"), 173, CFSTR("%s is not available. Use a designated initializer instead."), "-[TUAudioDeviceController init]");

  return 0;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TUAudioDeviceController devices](self, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p devices=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setMixesVoiceWithMedia:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Setting mixesVoiceWithMedia: %d", (uint8_t *)v7, 8u);
  }

  -[TUAudioDeviceController audioClient](self, "audioClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "setMixingVoiceWithMediaEnabled:", v3);

}

- (void)setMediaPlaybackOnExternalDevice:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v13 = v3;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Setting mediaPlaybackOnExternalDevice: %d", buf, 8u);
  }

  -[TUAudioDeviceController audioClient](self, "audioClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3, CFSTR("kAUVoiceIOProperty_MediaPlaybackOnExternalDevice"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAudioSessionProperties:", v9);

}

- (void)addDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[TUAudioDeviceController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[TUAudioDeviceController delegates](self, "delegates");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[TUAudioDeviceController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[TUAudioDeviceController delegates](self, "delegates");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

}

- (AVAudioDevice)currentInputDevice
{
  void *v2;
  void *v3;

  -[TUAudioDeviceController audioClient](self, "audioClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "currentInputDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVAudioDevice *)v3;
}

- (void)setCurrentAudioInputDeviceToDeviceWithUID:(id)a3
{
  NSObject *v3;

  -[TUAudioDeviceController serialQueue](self, "serialQueue", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

}

- (AVAudioDevice)currentOutputDevice
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[TUAudioDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUAudioDeviceController audioClient](self, "audioClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "currentOutputDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVAudioDevice *)v5;
}

- (void)setCurrentOutputDevice:(id)a3
{
  NSObject *v3;

  -[TUAudioDeviceController serialQueue](self, "serialQueue", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

}

- (void)setCurrentAudioOutputDeviceToDeviceWithUID:(id)a3
{
  NSObject *v3;

  -[TUAudioDeviceController serialQueue](self, "serialQueue", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

}

- (BOOL)isFollowingSystemInputSetting
{
  __CFString *v2;
  void *v3;
  BOOL v4;

  TUPreferredFaceTimeBundleIdentifier();
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)CFPreferencesCopyValue(CFSTR("PreferredAudioInputDeviceUID"), v2, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  v4 = objc_msgSend(v3, "length") == 0;

  return v4;
}

- (void)setFollowsSystemInputSetting:(BOOL)a3
{
  NSObject *v3;

  -[TUAudioDeviceController serialQueue](self, "serialQueue", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

}

- (BOOL)isFollowingSystemOutputSetting
{
  __CFString *v2;
  void *v3;
  BOOL v4;

  TUPreferredFaceTimeBundleIdentifier();
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)CFPreferencesCopyValue(CFSTR("PreferredAudioOutputDeviceUID"), v2, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  v4 = objc_msgSend(v3, "length") == 0;

  return v4;
}

- (void)setFollowsSystemOutputSetting:(BOOL)a3
{
  NSObject *v3;

  -[TUAudioDeviceController serialQueue](self, "serialQueue", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

}

- (NSArray)devices
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[TUAudioDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUAudioDeviceController audioClient](self, "audioClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)inputDevices
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[TUAudioDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUAudioDeviceController audioClient](self, "audioClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)outputDevices
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[TUAudioDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUAudioDeviceController audioClient](self, "audioClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (AVAudioClient)audioClient
{
  return self->_audioClient;
}

- (void)setAudioClient:(id)a3
{
  objc_storeStrong((id *)&self->_audioClient, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (TUAudioDeviceControllerActions)actionsDelegate
{
  return (TUAudioDeviceControllerActions *)objc_loadWeakRetained((id *)&self->_actionsDelegate);
}

- (void)setActionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionsDelegate, a3);
}

- (id)registerForMutedTalkerNotificationCallback
{
  return self->_registerForMutedTalkerNotificationCallback;
}

- (void)setRegisterForMutedTalkerNotificationCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_registerForMutedTalkerNotificationCallback, 0);
  objc_destroyWeak((id *)&self->_actionsDelegate);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_audioClient, 0);
}

@end
