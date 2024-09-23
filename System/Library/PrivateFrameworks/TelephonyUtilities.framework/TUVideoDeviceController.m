@implementation TUVideoDeviceController

void __54__TUVideoDeviceController_didStartPreviewForProvider___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "didStartPreviewForProvider: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "setHasBeganRetryingAfterUninitializedClientError:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setHasRefreshedPreviewAfterError:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setRetryAfterLocalCameraUIDChange:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("TUVideoDeviceControllerDidStartPreview"), *(_QWORD *)(a1 + 40));

}

- (void)setHasRefreshedPreviewAfterError:(BOOL)a3
{
  self->_hasRefreshedPreviewAfterError = a3;
}

- (void)setHasBeganRetryingAfterUninitializedClientError:(BOOL)a3
{
  self->_hasBeganRetryingAfterUninitializedClientError = a3;
}

void __66__TUVideoDeviceController_provider_didChangeLocalVideoAttributes___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "videoAttributes: %@", buf, 0xCu);
  }

  v4 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(*(id *)(a1 + 32), "ratio", CFSTR("TUVideoDeviceControllerLocalAttributesChangedAspectRatio"));
  objc_msgSend(v4, "valueWithSize:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("TUVideoDeviceControllerLocalAttributesChanged"), *(_QWORD *)(a1 + 40), v6);

}

- (void)provider:(id)a3 didChangeLocalVideoAttributes:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  TUVideoDeviceController *v10;

  v5 = a4;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__TUVideoDeviceController_provider_didChangeLocalVideoAttributes___block_invoke;
  v8[3] = &unk_1E38A1388;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)provider:(id)a3 didReceiveFirstPreviewFrameFromCameraUniqueID:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  TUVideoDeviceController *v10;

  v5 = a4;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__TUVideoDeviceController_provider_didReceiveFirstPreviewFrameFromCameraUniqueID___block_invoke;
  v8[3] = &unk_1E38A1388;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)provider:(id)a3 cameraZoomAvailabilityDidChange:(BOOL)a4
{
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  -[TUVideoDeviceController serialQueue](self, "serialQueue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__TUVideoDeviceController_provider_cameraZoomAvailabilityDidChange___block_invoke;
  v7[3] = &unk_1E38A19E0;
  v8 = a4;
  v7[4] = self;
  dispatch_async(v6, v7);

}

- (void)didStartPreviewForProvider:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  TUVideoDeviceController *v9;

  v4 = a3;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__TUVideoDeviceController_didStartPreviewForProvider___block_invoke;
  v7[3] = &unk_1E38A1388;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setCurrentVideoOrientation:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v3 = *(_QWORD *)&a3;
  v11 = *MEMORY[0x1E0C80C00];
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Setting video orientation: %d", (uint8_t *)v10, 8u);
  }

  -[TUVideoDeviceController provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localVideoAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setOrientation:", objc_msgSend((id)objc_opt_class(), "_videoOrientationForTUOrientation:", v3));
  -[TUVideoDeviceController provider](self, "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocalVideoAttributes:", v8);

}

- (AVCaptureDevice)currentInputDevice
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUVideoDeviceController provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localCameraUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[TUVideoDeviceController inputDevices](self, "inputDevices", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "uniqueID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v5);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return (AVCaptureDevice *)v7;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (TUVideoDeviceControllerProvider)provider
{
  return self->_provider;
}

- (NSArray)inputDevices
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUVideoDeviceController provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

+ (int)_videoOrientationForTUOrientation:(int)a3
{
  if ((a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

- (void)startPreview
{
  NSObject *v3;
  BOOL v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[TUVideoDeviceController shouldIgnoreStartPreview](self, "shouldIgnoreStartPreview");
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      -[TUVideoDeviceController currentInputDevice](self, "currentInputDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring start preview with self.currentInputDevice: %@", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    if (v6)
    {
      -[TUVideoDeviceController currentInputDevice](self, "currentInputDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Starting preview with self.currentInputDevice: %@", (uint8_t *)&v9, 0xCu);

    }
    -[TUVideoDeviceController setWantsPreview:](self, "setWantsPreview:", 1);
    -[TUVideoDeviceController provider](self, "provider");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject startPreview](v5, "startPreview");
  }

}

- (BOOL)currentInputIsExternal
{
  void **v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  if (!currentInputIsExternal__AVCaptureDeviceTypeExternal)
  {
    v3 = (void **)CUTWeakLinkSymbol();
    if (v3)
      v4 = *v3;
    else
      v4 = 0;
    objc_storeStrong((id *)&currentInputIsExternal__AVCaptureDeviceTypeExternal, v4);
  }
  -[TUVideoDeviceController currentInputDevice](self, "currentInputDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TUVideoDeviceController currentInputDevice](self, "currentInputDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == (void *)currentInputIsExternal__AVCaptureDeviceTypeExternal;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)shouldIgnoreStartPreview
{
  return self->_ignoreStartPreview;
}

- (void)setWantsPreview:(BOOL)a3
{
  self->_wantsPreview = a3;
}

+ (void)prewarm
{
  +[TUVideoDeviceControllerProvider prewarm](TUVideoDeviceControllerProvider, "prewarm");
}

- (TUVideoDeviceController)initWithSerialQueue:(id)a3
{
  id v4;
  TUVideoDeviceControllerProvider *v5;
  TUFeatureFlags *v6;
  TUVideoDeviceController *v7;

  v4 = a3;
  v5 = objc_alloc_init(TUVideoDeviceControllerProvider);
  v6 = objc_alloc_init(TUFeatureFlags);
  v7 = -[TUVideoDeviceController initWithProvider:serialQueue:featureFlags:](self, "initWithProvider:serialQueue:featureFlags:", v5, v4, v6);

  return v7;
}

- (TUVideoDeviceController)initWithProvider:(id)a3 serialQueue:(id)a4 featureFlags:(id)a5
{
  id v9;
  id v10;
  id v11;
  TUVideoDeviceController *v12;
  TUVideoDeviceController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUVideoDeviceController;
  v12 = -[TUVideoDeviceController init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serialQueue, a4);
    objc_storeStrong((id *)&v13->_provider, a3);
    -[TUVideoDeviceControllerProvider setDelegate:](v13->_provider, "setDelegate:", v13);
    objc_storeStrong((id *)&v13->_featureFlags, a5);
    v13->_uninitializedClientRetrySeconds = 1;
  }

  return v13;
}

- (void)setLocalFrontLayer:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "localFrontLayer: %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUVideoDeviceController provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalVideoLayer:front:", v4, 1);

}

void __70__TUVideoDeviceController_provider_systemPreferredCameraUIDDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "systemPreferredCameraUIDDidChange: %@", buf, 0xCu);
  }

  v4 = (void *)MEMORY[0x1E0CB37C0];
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v9 = CFSTR("TUVideoDeviceControllerSystemPreferredCameraUIDKey");
    v10 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationWithName:object:userInfo:", CFSTR("TUVideoDeviceControllerSystemPreferredCameraChangedNotification"), 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("TUVideoDeviceControllerSystemPreferredCameraChangedNotification"), 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotification:", v7);

}

void __68__TUVideoDeviceController_provider_cameraZoomAvailabilityDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "isZoomAvailable: %d", (uint8_t *)v7, 8u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*(_BYTE *)(a1 + 40))
    v6 = CFSTR("TUVideoDeviceControllerZoomAvailable");
  else
    v6 = CFSTR("TUVideoDeviceControllerZoomUnavailable");
  objc_msgSend(v4, "postNotificationName:object:", v6, *(_QWORD *)(a1 + 32));

}

void __82__TUVideoDeviceController_provider_didReceiveFirstPreviewFrameFromCameraUniqueID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "cameraUID: %@", buf, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v7 = CFSTR("TUVideoDeviceControllerDidStartPreviewDeviceUniqueID");
    v8 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("TUVideoDeviceControllerReceivedFirstPreviewFrame"), *(_QWORD *)(a1 + 40), v5);

}

- (void)provider:(id)a3 systemPreferredCameraUIDDidChange:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__TUVideoDeviceController_provider_systemPreferredCameraUIDDidChange___block_invoke;
  block[3] = &unk_1E38A1360;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

- (TUVideoDeviceController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUVideoDeviceController.m"), 126, CFSTR("%s is not available. Use a designated initializer instead."), "-[TUVideoDeviceController init]");

  return 0;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUVideoDeviceController inputDevices](self, "inputDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" devices=%@"), v4);

  if (-[TUVideoDeviceController isFollowSystemCameraEnabled](self, "isFollowSystemCameraEnabled"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" followSystemCameraEnabled=%d"), -[TUVideoDeviceController isFollowSystemCameraEnabled](self, "isFollowSystemCameraEnabled"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

+ (int)_tuOrientationForVideoOrientation:(int)a3
{
  if ((a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

- (BOOL)currentInputSupportsCinematicFraming
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[TUVideoDeviceController currentInputDevice](self, "currentInputDevice", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isCenterStageSupported") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)currentInputSupportsReactionEffects
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[TUVideoDeviceController currentInputDevice](self, "currentInputDevice", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "reactionEffectsSupported") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)setCurrentInputDevice:(id)a3
{
  -[TUVideoDeviceController setCurrentInputDevice:isUserPreferred:](self, "setCurrentInputDevice:isUserPreferred:", a3, 1);
}

- (void)setCurrentInputDevice:(id)a3 isUserPreferred:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void **v11;
  void *v12;
  void **v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to set current input device to %@", buf, 0xCu);
  }

  if (v6)
  {
    objc_msgSend(v6, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.avfoundation.avcapturedevice.built-in_video:1")))
    {
      v10 = (void *)CUTWeakLinkClass();
      if (!setCurrentInputDevice_isUserPreferred___AVCaptureDeviceTypeBuiltInTrueDepthCamera)
      {
        v11 = (void **)CUTWeakLinkSymbol();
        if (v11)
          v12 = *v11;
        else
          v12 = 0;
        objc_storeStrong((id *)&setCurrentInputDevice_isUserPreferred___AVCaptureDeviceTypeBuiltInTrueDepthCamera, v12);
      }
      if (!setCurrentInputDevice_isUserPreferred___AVMediaTypeVideo)
      {
        v13 = (void **)CUTWeakLinkSymbol();
        if (v13)
          v14 = *v13;
        else
          v14 = 0;
        objc_storeStrong((id *)&setCurrentInputDevice_isUserPreferred___AVMediaTypeVideo, v14);
      }
      if (v10)
      {
        v23 = setCurrentInputDevice_isUserPreferred___AVCaptureDeviceTypeBuiltInTrueDepthCamera;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "discoverySessionWithDeviceTypes:mediaType:position:", v15, setCurrentInputDevice_isUserPreferred___AVMediaTypeVideo, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "devices");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "count"))
        {
          objc_msgSend(v17, "firstObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          TUDefaultLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v18;
            _os_log_impl(&dword_19A50D000, v19, OS_LOG_TYPE_DEFAULT, "Upgrading input device to depth camera device %@", buf, 0xCu);
          }

          objc_msgSend(v18, "uniqueID");
          v20 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v20;
          v6 = v18;
        }

      }
    }
    -[TUVideoDeviceController provider](self, "provider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLocalCameraWithUID:", v9);

    if (v4)
    {
      TUDefaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v6;
        _os_log_impl(&dword_19A50D000, v22, OS_LOG_TYPE_DEFAULT, "Setting userPreferred camera to %@", buf, 0xCu);
      }

      objc_msgSend((id)CUTWeakLinkClass(), "setUserPreferredCamera:forClientPreferenceDomain:", v6, CFSTR("com.apple.facetime"));
    }

  }
}

- (int)currentVideoOrientation
{
  TUVideoDeviceController *v2;
  NSObject *v3;
  void *v4;
  void *v5;

  v2 = self;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUVideoDeviceController provider](v2, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localVideoAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend((id)objc_opt_class(), "_tuOrientationForVideoOrientation:", objc_msgSend(v5, "orientation"));
  return (int)v2;
}

- (BOOL)isFollowSystemCameraEnabled
{
  NSObject *v3;
  void *v4;

  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUVideoDeviceController featureFlags](self, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "continuityCaptureEnabled");

  return 0;
}

- (void)setFollowSystemCameraEnabled:(BOOL)a3
{
  NSObject *v4;
  id v5;

  -[TUVideoDeviceController serialQueue](self, "serialQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[TUVideoDeviceController featureFlags](self, "featureFlags");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "continuityCaptureEnabled");

}

- (BOOL)hasAvailableDeskViewCameras
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  -[TUVideoDeviceController featureFlags](self, "featureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "screenSharingDeskViewEnabled");

  if (!v4)
    return 0;
  -[TUVideoDeviceController provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasAvailableDeskViewCameras");

  return v6;
}

- (BOOL)isPreviewRunning
{
  NSObject *v3;
  void *v4;

  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUVideoDeviceController provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isPreviewRunning");

  return (char)v3;
}

- (CALayer)localFrontLayer
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUVideoDeviceController provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localVideoLayer:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALayer *)v5;
}

- (void)setLocalFrontLayerHost:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "localFrontLayerHost: %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUVideoDeviceController provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalVideoLayerHost:front:", v4, 1);

}

- (CALayer)localBackLayer
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUVideoDeviceController provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localVideoLayer:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALayer *)v5;
}

- (void)setLocalBackLayer:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "localBackLayer: %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUVideoDeviceController provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalVideoLayer:front:", v4, 0);

}

- (void)setLocalBackLayerHost:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "localBackLayerHost: %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUVideoDeviceController provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalVideoLayerHost:front:", v4, 0);

}

- (void)setCurrentVideoEffect:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUVideoDeviceController provider](self, "provider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentVideoEffect:", v4);

}

- (TUVideoEffect)currentVideoEffect
{
  void *v2;
  void *v3;

  -[TUVideoDeviceController provider](self, "provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentVideoEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUVideoEffect *)v3;
}

- (NSArray)availableVideoEffects
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  TUVideoEffect *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[TUVideoDeviceController provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableVideoEffects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v19;
    *(_QWORD *)&v7 = 138412290;
    v17 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
        -[TUVideoDeviceController provider](self, "provider", v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "thumbnailImageForVideoEffectName:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = -[TUVideoEffect initWithName:thumbnailImage:]([TUVideoEffect alloc], "initWithName:thumbnailImage:", v11, v13);
          objc_msgSend(v3, "addObject:", v14);
        }
        else
        {
          TUDefaultLog();
          v14 = (TUVideoEffect *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v23 = v11;
            _os_log_impl(&dword_19A50D000, &v14->super, OS_LOG_TYPE_DEFAULT, "[WARN] Cannot create TUVideoEffect named %@ with nil thumbnailImage", buf, 0xCu);
          }
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v15;
}

- (void)stopPreview
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[TUVideoDeviceController currentInputDevice](self, "currentInputDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Stopping preview with self.currentInputDevice: %@", (uint8_t *)&v7, 0xCu);

  }
  -[TUVideoDeviceController setWantsPreview:](self, "setWantsPreview:", 0);
  -[TUVideoDeviceController provider](self, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopPreview");

}

- (void)pausePreview
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[TUVideoDeviceController currentInputDevice](self, "currentInputDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Pausing preview with self.currentInputDevice: %@", (uint8_t *)&v7, 0xCu);

  }
  -[TUVideoDeviceController setWantsPreview:](self, "setWantsPreview:", 0);
  -[TUVideoDeviceController provider](self, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pausePreview");

}

- (void)getSnapshot
{
  NSObject *v3;
  id v4;

  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUVideoDeviceController provider](self, "provider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getSnapshot");

}

- (BOOL)isCinematicFramingEnabled
{
  NSObject *v3;
  void *v4;

  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUVideoDeviceController provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isCinematicFramingEnabled");

  return (char)v3;
}

- (void)setCinematicFramingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  id v6;

  v3 = a3;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[TUVideoDeviceController provider](self, "provider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCinematicFramingEnabled:", v3);

}

- (BOOL)isReactionEffectGestureEnabled
{
  NSObject *v3;
  void *v4;

  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUVideoDeviceController provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isReactionEffectGestureEnabled");

  return (char)v3;
}

- (void)setReactionEffectGestureEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  id v6;

  v3 = a3;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[TUVideoDeviceController provider](self, "provider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReactionEffectGestureEnabled:", v3);

}

- (BOOL)isStudioLightEnabled
{
  NSObject *v3;
  void *v4;

  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUVideoDeviceController provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isStudioLightEnabled");

  return (char)v3;
}

- (void)setStudioLightEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  id v6;

  v3 = a3;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[TUVideoDeviceController provider](self, "provider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStudioLightEnabled:", v3);

}

- (BOOL)currentInputSupportsStudioLight
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[TUVideoDeviceController currentInputDevice](self, "currentInputDevice", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isStudioLightSupported") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)supportsCameraBlur
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;

  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUVideoDeviceController provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUVideoDeviceController currentInputDevice](self, "currentInputDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "supportsCameraBlurForDevice:", v5);

  return v6;
}

- (int)currentBackgroundBlurControlMode
{
  NSObject *v3;
  void *v4;

  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUVideoDeviceController provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v4, "currentBackgroundBlurControlMode");

  return (int)v3;
}

- (void)setCurrentBackgroundBlurControlMode:(int)a3
{
  NSObject *v5;
  id v6;

  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[TUVideoDeviceController provider](self, "provider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrentBackgroundBlurControlMode:", a3);

}

- (BOOL)cameraBlurEnabled
{
  NSObject *v3;
  void *v4;

  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUVideoDeviceController provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isCameraBlurEnabled");

  return (char)v3;
}

- (void)setCameraBlurEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  id v6;

  v3 = a3;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[TUVideoDeviceController provider](self, "provider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCameraBlurEnabled:", v3);

}

- (void)setCameraZoomFactor:(double)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = a3;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Setting back camera zoom factor: %f", (uint8_t *)&v8, 0xCu);
  }

  -[TUVideoDeviceController provider](self, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCameraZoomFactor:", a3);

}

- (void)rampCameraZoomFactor:(double)a3 withRate:(double)a4
{
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  double v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218240;
    v11 = a3;
    v12 = 2048;
    v13 = a4;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Setting ramp camera zoom factor: %f with rate: %f", (uint8_t *)&v10, 0x16u);
  }

  -[TUVideoDeviceController provider](self, "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rampCameraZoomFactor:withRate:", a3, a4);

}

- (void)noteBeginAnimationToPreview
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[TUVideoDeviceController currentInputDevice](self, "currentInputDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Beginning animation to preview with self.currentInputDevice: %@", (uint8_t *)&v7, 0xCu);

  }
  -[TUVideoDeviceController provider](self, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginPIPToPreviewAnimation");

}

- (void)flipCamera
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[TUVideoDeviceController inputDevices](self, "inputDevices", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (!v5)
  {
    v7 = 0;
    v8 = 0;
    goto LABEL_16;
  }
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v21 != v9)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      if (objc_msgSend(v11, "position") == 2)
      {
        v12 = v8;
        v13 = v7;
        v8 = v11;
LABEL_9:
        v14 = v11;

        v7 = v13;
        goto LABEL_10;
      }
      v12 = v7;
      v13 = v11;
      if (objc_msgSend(v11, "position") == 1)
        goto LABEL_9;
LABEL_10:
      if (v8 && v7)
        goto LABEL_16;
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  }
  while (v6);
LABEL_16:

  -[TUVideoDeviceController currentInputDevice](self, "currentInputDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "position");

  TUDefaultLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16 == 1)
  {
    v19 = v7;
    if (v18)
    {
      *(_DWORD *)buf = 138412290;
      v25 = v7;
      _os_log_impl(&dword_19A50D000, v17, OS_LOG_TYPE_DEFAULT, "Setting local camera to back facing device %@", buf, 0xCu);
      v19 = v7;
    }
  }
  else
  {
    v19 = v8;
    if (v18)
    {
      *(_DWORD *)buf = 138412290;
      v25 = v8;
      _os_log_impl(&dword_19A50D000, v17, OS_LOG_TYPE_DEFAULT, "Setting local camera to front facing device %@", buf, 0xCu);
      v19 = v8;
    }
  }

  -[TUVideoDeviceController setCurrentInputDevice:](self, "setCurrentInputDevice:", v19);
}

- (void)retryPreviewAfterError
{
  NSObject *v3;
  uint8_t v4[16];

  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Retrying preview after error", v4, 2u);
  }

  -[TUVideoDeviceController setHasRefreshedPreviewAfterError:](self, "setHasRefreshedPreviewAfterError:", 1);
  -[TUVideoDeviceController startPreview](self, "startPreview");
}

- (void)noteEndAnimationToPreview
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[TUVideoDeviceController currentInputDevice](self, "currentInputDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Ending animation to preview with self.currentInputDevice: %@", (uint8_t *)&v7, 0xCu);

  }
  -[TUVideoDeviceController provider](self, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endPIPToPreviewAnimation");

}

- (void)noteBeginAnimationToPIP
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[TUVideoDeviceController currentInputDevice](self, "currentInputDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Beginning animation to PIP with self.currentInputDevice: %@", (uint8_t *)&v7, 0xCu);

  }
  -[TUVideoDeviceController provider](self, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginPreviewToPIPAnimation");

}

- (void)noteEndAnimationToPIP
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[TUVideoDeviceController currentInputDevice](self, "currentInputDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Ending animation to PIP with self.currentInputDevice: %@", (uint8_t *)&v7, 0xCu);

  }
  -[TUVideoDeviceController provider](self, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endPreviewToPIPAnimation");

}

- (void)setLocalPortraitAspectRatio:(CGSize)a3 localLandscapeAspectRatio:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;
  NSSize v22;
  NSSize v23;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  v21 = *MEMORY[0x1E0C80C00];
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v22.width = v7;
    v22.height = v6;
    NSStringFromSize(v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23.width = width;
    v23.height = height;
    NSStringFromSize(v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Setting localPortraitAspectRatio: %@ localLandscapeAspectRatio: %@", (uint8_t *)&v17, 0x16u);

  }
  -[TUVideoDeviceController portraitScreenAttributes](self, "portraitScreenAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRatio:", v7, v6);
  -[TUVideoDeviceController provider](self, "provider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocalScreenAttributes:", v13);

  -[TUVideoDeviceController landscapeScreenAttributes](self, "landscapeScreenAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRatio:", width, height);
  -[TUVideoDeviceController provider](self, "provider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLocalScreenAttributes:", v15);

}

- (CGRect)localScreenContentsRect
{
  NSObject *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = objc_msgSend((id)objc_opt_class(), "_videoOrientationForTUOrientation:", -[TUVideoDeviceController currentVideoOrientation](self, "currentVideoOrientation"));
  v5 = objc_alloc_init((Class)CUTWeakLinkClass());
  objc_msgSend(v5, "setOrientation:", v4);
  -[TUVideoDeviceController provider](self, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localScreenAttributesForVideoAttributes:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentsRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGSize)localVideoPortraitAspectRatio
{
  NSObject *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUVideoDeviceController provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localVideoAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ratio");
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)localScreenPortraitAspectRatio
{
  NSObject *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUVideoDeviceController portraitScreenAttributes](self, "portraitScreenAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ratio");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)localVideoLandscapeAspectRatio
{
  NSObject *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUVideoDeviceController provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localVideoAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ratio");
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)localScreenLandscapeAspectRatio
{
  NSObject *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUVideoDeviceController landscapeScreenAttributes](self, "landscapeScreenAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ratio");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)portraitScreenAttributes
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init((Class)CUTWeakLinkClass());
  objc_msgSend(v3, "setOrientation:", 0);
  -[TUVideoDeviceController provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localScreenAttributesForVideoAttributes:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)landscapeScreenAttributes
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init((Class)CUTWeakLinkClass());
  objc_msgSend(v3, "setOrientation:", 3);
  -[TUVideoDeviceController provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localScreenAttributesForVideoAttributes:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)provider:(id)a3 didReceiveErrorFromCameraUniqueID:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  TUVideoDeviceController *v15;

  v7 = a4;
  v8 = a5;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__TUVideoDeviceController_provider_didReceiveErrorFromCameraUniqueID_error___block_invoke;
  block[3] = &unk_1E38A19B8;
  v13 = v7;
  v14 = v8;
  v15 = self;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

void __76__TUVideoDeviceController_provider_didReceiveErrorFromCameraUniqueID_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  BOOL v4;
  void *v5;
  dispatch_block_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  dispatch_time_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  _QWORD block[4];
  id v24;
  id location;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __76__TUVideoDeviceController_provider_didReceiveErrorFromCameraUniqueID_error___block_invoke_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 48), "previewStartBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "previewStartBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_block_cancel(v5);

    objc_msgSend(*(id *)(a1 + 48), "setPreviewStartBlock:", 0);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "code") == 32006)
  {
    if (objc_msgSend(*(id *)(a1 + 48), "wantsPreview"))
    {
      objc_initWeak(&location, *(id *)(a1 + 48));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __76__TUVideoDeviceController_provider_didReceiveErrorFromCameraUniqueID_error___block_invoke_98;
      block[3] = &unk_1E38A13D0;
      objc_copyWeak(&v24, &location);
      v6 = dispatch_block_create((dispatch_block_flags_t)0, block);
      objc_msgSend(*(id *)(a1 + 48), "setPreviewStartBlock:", v6);

      v7 = objc_msgSend(*(id *)(a1 + 48), "hasBeganRetryingAfterUninitializedClientError");
      v8 = *(void **)(a1 + 48);
      if (v7)
        v9 = 2 * objc_msgSend(v8, "uninitializedClientRetrySeconds");
      else
        v9 = objc_msgSend(v8, "uninitializedClientRetrySeconds");
      v15 = dispatch_time(0, 1000000000 * v9);
      objc_msgSend(*(id *)(a1 + 48), "serialQueue");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "previewStartBlock");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_after(v15, v16, v17);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("TUVideoDeviceControllerDeviceDidReceiveErrorCameraID"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("TUVideoDeviceControllerDeviceDidReceiveErrorError"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 48);
    v13 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("TUVideoDeviceControllerDeviceDidReceiveError"), v12, v13);

    if (objc_msgSend(*(id *)(a1 + 48), "hasRefreshedPreviewAfterError")
      && objc_msgSend(*(id *)(a1 + 40), "code") != 32032)
    {
      v14 = 0;
    }
    else
    {
      v14 = objc_msgSend(*(id *)(a1 + 48), "wantsPreview");
    }
    TUDefaultLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(*(id *)(a1 + 48), "hasRefreshedPreviewAfterError");
      v20 = objc_msgSend(*(id *)(a1 + 40), "code");
      v21 = objc_msgSend(*(id *)(a1 + 48), "wantsPreview");
      location = (id)__PAIR64__(v14, 67109888);
      v26 = 1024;
      v27 = v19;
      v28 = 2048;
      v29 = v20;
      v30 = 1024;
      v31 = v21;
      _os_log_impl(&dword_19A50D000, v18, OS_LOG_TYPE_DEFAULT, "Stopping preview due to error. shouldRetryPreview=%d because hasRefreshedPreviewAfterError=%d, error.code=%ld wantsPreview=%d", (uint8_t *)&location, 0x1Eu);
    }

    v22 = objc_msgSend(*(id *)(a1 + 48), "wantsPreview");
    objc_msgSend(*(id *)(a1 + 48), "stopPreview");
    if (v14)
    {
      if (v22 && objc_msgSend(*(id *)(a1 + 40), "code") == 32023)
        objc_msgSend(*(id *)(a1 + 48), "setRetryAfterLocalCameraUIDChange:", 1);
      else
        objc_msgSend(*(id *)(a1 + 48), "retryPreviewAfterError");
    }

  }
}

void __76__TUVideoDeviceController_provider_didReceiveErrorFromCameraUniqueID_error___block_invoke_98(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  intptr_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "previewStartBlock");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = dispatch_block_testcancel(v2);

    WeakRetained = v4;
    if (!v3)
    {
      objc_msgSend(v4, "setHasBeganRetryingAfterUninitializedClientError:", 1);
      objc_msgSend(v4, "setPreviewStartBlock:", 0);
      objc_msgSend(v4, "retryPreviewAfterError");
      objc_msgSend(v4, "setHasRefreshedPreviewAfterError:", 0);
      WeakRetained = v4;
    }
  }

}

- (void)provider:(id)a3 cameraDidBecomeAvailableForUniqueID:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  TUVideoDeviceController *v10;

  v5 = a4;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__TUVideoDeviceController_provider_cameraDidBecomeAvailableForUniqueID___block_invoke;
  v8[3] = &unk_1E38A1388;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __72__TUVideoDeviceController_provider_cameraDidBecomeAvailableForUniqueID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "wantsPreview");
    v5 = CFSTR("NO");
    if (v4)
      v5 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v13 = v3;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "cameraUID: %@, wantsPreview: %@", buf, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v10 = CFSTR("TUVideoDeviceControllerDeviceBecameAvailableDeviceUniqueID");
    v11 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("TUVideoDeviceControllerDeviceBecameAvailable"), *(_QWORD *)(a1 + 40), v7);

  if (objc_msgSend(*(id *)(a1 + 40), "wantsPreview"))
  {
    TUDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Starting preview because client wants preview and camera did become available", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "startPreview");
  }

}

- (void)provider:(id)a3 didChangeLocalCameraUID:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  TUVideoDeviceController *v10;

  v5 = a4;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__TUVideoDeviceController_provider_didChangeLocalCameraUID___block_invoke;
  v8[3] = &unk_1E38A1388;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __60__TUVideoDeviceController_provider_didChangeLocalCameraUID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Provider received notice that local camera UID changed to %@", buf, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v8 = CFSTR("TUVideoDeviceControllerDidChangeLocalCameraUIDDeviceUniqueIDKey");
    v9 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("TUVideoDeviceControllerDidChangeLocalCameraUIDNotification"), *(_QWORD *)(a1 + 40), v5);

  if (objc_msgSend(*(id *)(a1 + 40), "retryAfterLocalCameraUIDChange"))
  {
    objc_msgSend(*(id *)(a1 + 40), "setRetryAfterLocalCameraUIDChange:", 0);
    TUDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "Starting preview after local camera UID change", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "startPreview");
  }

}

- (void)didStopPreviewForProvider:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  TUVideoDeviceController *v9;

  v4 = a3;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__TUVideoDeviceController_didStopPreviewForProvider___block_invoke;
  v7[3] = &unk_1E38A1388;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __53__TUVideoDeviceController_didStopPreviewForProvider___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "didStopPreviewForProvider %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("TUVideoDeviceControllerDidStopPreview"), *(_QWORD *)(a1 + 40));

}

- (void)didPausePreviewForProvider:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  TUVideoDeviceController *v9;

  v4 = a3;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__TUVideoDeviceController_didPausePreviewForProvider___block_invoke;
  v7[3] = &unk_1E38A1388;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __54__TUVideoDeviceController_didPausePreviewForProvider___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "didPausePreviewForProvider %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("TUVideoDeviceControllerDidPausePreview"), *(_QWORD *)(a1 + 40));

}

- (void)captureDevicesChangedForProvider:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  TUVideoDeviceController *v9;

  v4 = a3;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__TUVideoDeviceController_captureDevicesChangedForProvider___block_invoke;
  v7[3] = &unk_1E38A1388;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __60__TUVideoDeviceController_captureDevicesChangedForProvider___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "captureDevicesChangedForProvider %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("TUVideoDeviceControllerInputDevicesChanged"), *(_QWORD *)(a1 + 40));

}

- (void)provider:(id)a3 cameraCinematicFramingAvailabilityDidChange:(BOOL)a4
{
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  -[TUVideoDeviceController serialQueue](self, "serialQueue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__TUVideoDeviceController_provider_cameraCinematicFramingAvailabilityDidChange___block_invoke;
  v7[3] = &unk_1E38A19E0;
  v7[4] = self;
  v8 = a4;
  dispatch_async(v6, v7);

}

uint64_t __80__TUVideoDeviceController_provider_cameraCinematicFramingAvailabilityDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postIsCinematicFramingAvailable:", *(unsigned __int8 *)(a1 + 40));
}

- (void)provider:(id)a3 cameraCinematicFramingEnabledDidChange:(BOOL)a4
{
  NSObject *v5;
  _QWORD block[4];
  BOOL v7;

  -[TUVideoDeviceController serialQueue](self, "serialQueue", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__TUVideoDeviceController_provider_cameraCinematicFramingEnabledDidChange___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v7 = a4;
  dispatch_async(v5, block);

}

void __75__TUVideoDeviceController_provider_cameraCinematicFramingEnabledDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 32);
    *(_DWORD *)buf = 67109120;
    v12 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "isCinematicFramingEnabled: %d", buf, 8u);
  }

  v4 = (void *)MEMORY[0x1E0CB37C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32), CFSTR("TUVideoDeviceControllerIsCinematicFramingEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationWithName:object:userInfo:", CFSTR("TUVideoDeviceControllerCinematicFramingEnabledChanged"), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotification:", v7);

}

- (void)_postIsCinematicFramingAvailable:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
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
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v13 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "isCinematicFramingAvailable: %d", buf, 8u);
  }

  v5 = (void *)MEMORY[0x1E0CB37C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3, CFSTR("TUVideoDeviceControllerIsCinematicFramingAvailable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationWithName:object:userInfo:", CFSTR("TUVideoDeviceControllerCinematicFramingAvailable"), 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotification:", v8);

}

- (void)provider:(id)a3 reactionEffectsEnabledDidChange:(BOOL)a4
{
  NSObject *v5;
  _QWORD block[4];
  BOOL v7;

  -[TUVideoDeviceController serialQueue](self, "serialQueue", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__TUVideoDeviceController_provider_reactionEffectsEnabledDidChange___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v7 = a4;
  dispatch_async(v5, block);

}

void __68__TUVideoDeviceController_provider_reactionEffectsEnabledDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 32);
    *(_DWORD *)buf = 67109120;
    v12 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "isReactionEffectGestureEnabled: %d", buf, 8u);
  }

  v4 = (void *)MEMORY[0x1E0CB37C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32), CFSTR("TUVideoDeviceControllerAreReactionEffectsEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationWithName:object:userInfo:", CFSTR("TUVideoDeviceControllerReactionEffectsEnabledChanged"), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotification:", v7);

}

- (void)provider:(id)a3 studioLightEnabledDidChange:(BOOL)a4
{
  NSObject *v5;
  _QWORD block[4];
  BOOL v7;

  -[TUVideoDeviceController serialQueue](self, "serialQueue", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__TUVideoDeviceController_provider_studioLightEnabledDidChange___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v7 = a4;
  dispatch_async(v5, block);

}

void __64__TUVideoDeviceController_provider_studioLightEnabledDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 32);
    *(_DWORD *)buf = 67109120;
    v12 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "isStudioLightEnabled: %d", buf, 8u);
  }

  v4 = (void *)MEMORY[0x1E0CB37C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32), CFSTR("TUVideoDeviceControllerIsStudioLightEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationWithName:object:userInfo:", CFSTR("TUVideoDeviceControllerStudioLightEnabledChanged"), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotification:", v7);

}

- (void)provider:(id)a3 cameraBlurEnabledDidChange:(BOOL)a4
{
  NSObject *v5;
  _QWORD block[4];
  BOOL v7;

  -[TUVideoDeviceController serialQueue](self, "serialQueue", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__TUVideoDeviceController_provider_cameraBlurEnabledDidChange___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v7 = a4;
  dispatch_async(v5, block);

}

void __63__TUVideoDeviceController_provider_cameraBlurEnabledDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 32);
    *(_DWORD *)buf = 67109120;
    v12 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "cameraBlurEnabledDidChange: %d", buf, 8u);
  }

  v4 = (void *)MEMORY[0x1E0CB37C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32), CFSTR("TUVideoDeviceControllerIsCameraBlurEnabledKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationWithName:object:userInfo:", CFSTR("TUVideoDeviceControllerCameraBlurEnabledChangedNotification"), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotification:", v7);

}

- (void)provider:(id)a3 userPreferredCameraUIDDidChange:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__TUVideoDeviceController_provider_userPreferredCameraUIDDidChange___block_invoke;
  block[3] = &unk_1E38A1360;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

void __68__TUVideoDeviceController_provider_userPreferredCameraUIDDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "userPreferredCameraUIDDidChange: %@", buf, 0xCu);
  }

  v4 = (void *)MEMORY[0x1E0CB37C0];
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v9 = CFSTR("TUVideoDeviceControllerUserPreferredCameraUIDKey");
    v10 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationWithName:object:userInfo:", CFSTR("TUVideoDeviceControllerUserPreferredCameraChangedNotification"), 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("TUVideoDeviceControllerUserPreferredCameraChangedNotification"), 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotification:", v7);

}

- (void)provider:(id)a3 didGetSnapshot:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  -[TUVideoDeviceController serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__TUVideoDeviceController_provider_didGetSnapshot___block_invoke;
  block[3] = &unk_1E38A1360;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

void __51__TUVideoDeviceController_provider_didGetSnapshot___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    v11 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "didGetSnapshot: %p", buf, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v8 = CFSTR("TUVideoDeviceControllerSnapshotDataKey");
    v9 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("TUVideoDeviceControllerDidGetSnapshotNotification"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotification:", v6);

}

- (CALayer)localFrontLayerHost
{
  return self->_localFrontLayerHost;
}

- (CALayer)localBackLayerHost
{
  return self->_localBackLayerHost;
}

- (void)setIgnoreStartPreview:(BOOL)a3
{
  self->_ignoreStartPreview = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (BOOL)wantsPreview
{
  return self->_wantsPreview;
}

- (BOOL)hasRefreshedPreviewAfterError
{
  return self->_hasRefreshedPreviewAfterError;
}

- (id)previewStartBlock
{
  return self->_previewStartBlock;
}

- (void)setPreviewStartBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)hasBeganRetryingAfterUninitializedClientError
{
  return self->_hasBeganRetryingAfterUninitializedClientError;
}

- (int64_t)uninitializedClientRetrySeconds
{
  return self->_uninitializedClientRetrySeconds;
}

- (void)setUninitializedClientRetrySeconds:(int64_t)a3
{
  self->_uninitializedClientRetrySeconds = a3;
}

- (BOOL)retryAfterLocalCameraUIDChange
{
  return self->_retryAfterLocalCameraUIDChange;
}

- (void)setRetryAfterLocalCameraUIDChange:(BOOL)a3
{
  self->_retryAfterLocalCameraUIDChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_previewStartBlock, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_localBackLayerHost, 0);
  objc_storeStrong((id *)&self->_localFrontLayerHost, 0);
}

void __76__TUVideoDeviceController_provider_didReceiveErrorFromCameraUniqueID_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412546;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_19A50D000, a2, OS_LOG_TYPE_ERROR, "cameraUID: %@, error: %@", (uint8_t *)&v4, 0x16u);
}

@end
