@implementation SBWallpaperServer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_39 != -1)
    dispatch_once(&sharedInstance_onceToken_39, &__block_literal_global_261);
  return (id)sharedInstance___sharedInstance_20;
}

uint64_t __35__SBWallpaperServer_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  kdebug_trace();
  v0 = -[SBWallpaperServer _init]([SBWallpaperServer alloc], "_init");
  v1 = (void *)sharedInstance___sharedInstance_20;
  sharedInstance___sharedInstance_20 = (uint64_t)v0;

  return kdebug_trace();
}

- (id)_init
{
  void *v3;
  void *Serial;
  void *v5;
  uint64_t v6;
  SBWallpaperServer *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0D23258];
  Serial = (void *)BSDispatchQueueCreateSerial();
  objc_msgSend(v3, "queueWithDispatchQueue:", Serial);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x1E0DABA80];
  v9.receiver = self;
  v9.super_class = (Class)SBWallpaperServer;
  v7 = -[FBSServiceFacility initWithIdentifier:queue:](&v9, sel_initWithIdentifier_queue_, v6, v5);

  return v7;
}

- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;

  v8 = a3;
  v9 = a5;
  switch(a4)
  {
    case 0:
      -[SBWallpaperServer _handleFetchThumbnailMessage:fromClient:](self, "_handleFetchThumbnailMessage:fromClient:", v8, v9);
      break;
    case 1:
      -[SBWallpaperServer _handleFetchOriginalImageMessage:fromClient:](self, "_handleFetchOriginalImageMessage:fromClient:", v8, v9);
      break;
    case 2:
      -[SBWallpaperServer _handleFetchOriginalVideoURLMessage:fromClient:](self, "_handleFetchOriginalVideoURLMessage:fromClient:", v8, v9);
      break;
    case 3:
      -[SBWallpaperServer _handleFetchContentCutoutBoundsMessage:fromClient:](self, "_handleFetchContentCutoutBoundsMessage:fromClient:", v8, v9);
      break;
    case 4:
      -[SBWallpaperServer _handleFetchLockScreenContentCutoutBoundsMessage:fromClient:](self, "_handleFetchLockScreenContentCutoutBoundsMessage:fromClient:", v8, v9);
      break;
    case 5:
      -[SBWallpaperServer _handleFetchLockScreenMaximalContentCutoutBoundsMessage:fromClient:](self, "_handleFetchLockScreenMaximalContentCutoutBoundsMessage:fromClient:", v8, v9);
      break;
    case 6:
      -[SBWallpaperServer _handleFetchLockScreenForegroundBoundsMessage:fromClient:](self, "_handleFetchLockScreenForegroundBoundsMessage:fromClient:", v8, v9);
      break;
    case 7:
      -[SBWallpaperServer _handleFetchLimitedOcclusionBoundsMessage:fromClient:](self, "_handleFetchLimitedOcclusionBoundsMessage:fromClient:", v8, v9);
      break;
    case 8:
      -[SBWallpaperServer _handleFetchLockScreenTimeBoundsMessage:fromClient:](self, "_handleFetchLockScreenTimeBoundsMessage:fromClient:", v8, v9);
      break;
    case 9:
      -[SBWallpaperServer _handleSetVideoMessageWithWallpaperMode:fromClient:](self, "_handleSetVideoMessageWithWallpaperMode:fromClient:", v8, v9);
      break;
    case 10:
      -[SBWallpaperServer _handleSetColorNameMessage:fromClient:](self, "_handleSetColorNameMessage:fromClient:", v8, v9);
      break;
    case 11:
      -[SBWallpaperServer _handleSetColorMessage:fromClient:](self, "_handleSetColorMessage:fromClient:", v8, v9);
      break;
    case 12:
      -[SBWallpaperServer _handleSetGradientMessage:fromClient:](self, "_handleSetGradientMessage:fromClient:", v8, v9);
      break;
    case 13:
      -[SBWallpaperServer _handleRestoreDefaultWallpaperMessage:fromClient:](self, "_handleRestoreDefaultWallpaperMessage:fromClient:", v8, v9);
      break;
    case 14:
      -[SBWallpaperServer _handleTriggerPosterSignificantEventMessage:fromClient:](self, "_handleTriggerPosterSignificantEventMessage:fromClient:", v8, v9);
      break;
    case 15:
      -[SBWallpaperServer _handleFetchPosterSignificantEventsCounterMessage:fromClient:](self, "_handleFetchPosterSignificantEventsCounterMessage:fromClient:", v8, v9);
      break;
    case 16:
      -[SBWallpaperServer _handleQuickActionConfigurationRequest:fromClient:](self, "_handleQuickActionConfigurationRequest:fromClient:", v8, v9);
      break;
    default:
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SBApplicationServer noteDidReceiveMessage:withType:fromClient:].cold.1((uint64_t)self, v9, v10);

      break;
  }

}

- (int64_t)_wallpaperVariantFromXPCDictionary:(id)a3
{
  int64_t result;

  LODWORD(result) = xpc_dictionary_get_uint64(a3, (const char *)*MEMORY[0x1E0DAC1C0]);
  if ((result & 0xFFFFFFFE) != 0)
    return -1;
  else
    return result;
}

- (int64_t)_deviceOrientationFromXPCDictionary:(id)a3
{
  int64_t result;

  LODWORD(result) = xpc_dictionary_get_uint64(a3, (const char *)*MEMORY[0x1E0DAC198]);
  if ((unint64_t)result - 1 >= 4)
    return 0;
  else
    return result;
}

- (void)_handleFetchThumbnailMessage:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__SBWallpaperServer__handleFetchThumbnailMessage_fromClient___block_invoke;
  v17[3] = &unk_1E8EB6420;
  v8 = v6;
  v18 = v8;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v17);
  objc_msgSend(v8, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_8;
  if (object_getClass(v10) != (Class)MEMORY[0x1E0C812F8])
    goto LABEL_8;
  objc_msgSend(v7, "processHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasEntitlement:", *MEMORY[0x1E0DABA78]);

  if (!v13)
    goto LABEL_8;
  v14 = -[SBWallpaperServer _wallpaperVariantFromXPCDictionary:](self, "_wallpaperVariantFromXPCDictionary:", v11);
  -[SBWallpaperServer delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15 || v14 == -1)
  {

LABEL_8:
    v9[2](v9, 0);
    goto LABEL_9;
  }
  objc_msgSend(v15, "wallpaperServer:fetchThumbnailDataForVariant:completionHandler:", self, v14, v9);

LABEL_9:
}

void __61__SBWallpaperServer__handleFetchThumbnailMessage_fromClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SBWallpaperServer__handleFetchThumbnailMessage_fromClient___block_invoke_2;
  v6[3] = &unk_1E8EA7108;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "sendReplyMessageWithPacker:", v6);

}

void __61__SBWallpaperServer__handleFetchThumbnailMessage_fromClient___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  xpc_object_t v5;
  void *v6;
  size_t length;
  xpc_object_t v8;
  xpc_object_t xdict;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    xdict = v3;
    v5 = xpc_data_create_with_dispatch_data(v4);
    v6 = v5;
    if (!v5 || (length = xpc_data_get_length(v5), length != objc_msgSend(*(id *)(a1 + 32), "length")))
    {
      v8 = xpc_data_create((const void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes"), objc_msgSend(*(id *)(a1 + 32), "length"));

      v6 = v8;
    }
    xpc_dictionary_set_value(xdict, (const char *)*MEMORY[0x1E0DAC190], v6);

    v3 = xdict;
  }

}

- (void)_handleFetchOriginalImageMessage:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__SBWallpaperServer__handleFetchOriginalImageMessage_fromClient___block_invoke;
  v17[3] = &unk_1E8EB6420;
  v8 = v6;
  v18 = v8;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v17);
  objc_msgSend(v8, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_8;
  if (object_getClass(v10) != (Class)MEMORY[0x1E0C812F8])
    goto LABEL_8;
  objc_msgSend(v7, "processHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasEntitlement:", *MEMORY[0x1E0DABA78]);

  if (!v13)
    goto LABEL_8;
  v14 = -[SBWallpaperServer _wallpaperVariantFromXPCDictionary:](self, "_wallpaperVariantFromXPCDictionary:", v11);
  -[SBWallpaperServer delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15 || v14 == -1)
  {

LABEL_8:
    v9[2](v9, 0);
    goto LABEL_9;
  }
  objc_msgSend(v15, "wallpaperServer:fetchOriginalImageDataForVariant:completionHandler:", self, v14, v9);

LABEL_9:
}

void __65__SBWallpaperServer__handleFetchOriginalImageMessage_fromClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__SBWallpaperServer__handleFetchOriginalImageMessage_fromClient___block_invoke_2;
  v6[3] = &unk_1E8EA7108;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "sendReplyMessageWithPacker:", v6);

}

void __65__SBWallpaperServer__handleFetchOriginalImageMessage_fromClient___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  xpc_object_t v5;
  void *v6;
  size_t length;
  xpc_object_t v8;
  xpc_object_t xdict;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    xdict = v3;
    v5 = xpc_data_create_with_dispatch_data(v4);
    v6 = v5;
    if (!v5 || (length = xpc_data_get_length(v5), length != objc_msgSend(*(id *)(a1 + 32), "length")))
    {
      v8 = xpc_data_create((const void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes"), objc_msgSend(*(id *)(a1 + 32), "length"));

      v6 = v8;
    }
    xpc_dictionary_set_value(xdict, (const char *)*MEMORY[0x1E0DAC190], v6);

    v3 = xdict;
  }

}

- (void)_handleFetchOriginalVideoURLMessage:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__SBWallpaperServer__handleFetchOriginalVideoURLMessage_fromClient___block_invoke;
  v17[3] = &unk_1E8EB6420;
  v8 = v6;
  v18 = v8;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v17);
  objc_msgSend(v8, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_8;
  if (object_getClass(v10) != (Class)MEMORY[0x1E0C812F8])
    goto LABEL_8;
  objc_msgSend(v7, "processHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasEntitlement:", *MEMORY[0x1E0DABA78]);

  if (!v13)
    goto LABEL_8;
  v14 = -[SBWallpaperServer _wallpaperVariantFromXPCDictionary:](self, "_wallpaperVariantFromXPCDictionary:", v11);
  -[SBWallpaperServer delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15 || v14)
  {

LABEL_8:
    v9[2](v9, 0);
    goto LABEL_9;
  }
  objc_msgSend(v15, "wallpaperServer:fetchOriginalVideoURLDataForVariant:completionHandler:", self, 0, v9);

LABEL_9:
}

void __68__SBWallpaperServer__handleFetchOriginalVideoURLMessage_fromClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__SBWallpaperServer__handleFetchOriginalVideoURLMessage_fromClient___block_invoke_2;
  v6[3] = &unk_1E8EA7108;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "sendReplyMessageWithPacker:", v6);

}

void __68__SBWallpaperServer__handleFetchOriginalVideoURLMessage_fromClient___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  xpc_object_t v5;
  void *v6;
  size_t length;
  xpc_object_t v8;
  xpc_object_t xdict;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    xdict = v3;
    v5 = xpc_data_create_with_dispatch_data(v4);
    v6 = v5;
    if (!v5 || (length = xpc_data_get_length(v5), length != objc_msgSend(*(id *)(a1 + 32), "length")))
    {
      v8 = xpc_data_create((const void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes"), objc_msgSend(*(id *)(a1 + 32), "length"));

      v6 = v8;
    }
    xpc_dictionary_set_value(xdict, (const char *)*MEMORY[0x1E0DAC1C8], v6);

    v3 = xdict;
  }

}

- (void)_handleFetchContentCutoutBoundsMessage:(id)a3 fromClient:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __71__SBWallpaperServer__handleFetchContentCutoutBoundsMessage_fromClient___block_invoke;
  v22[3] = &unk_1E8EB7098;
  v7 = v5;
  v23 = v7;
  v8 = (void *)MEMORY[0x1D17E5550](v22);
  v17 = v6;
  v18 = 3221225472;
  v19 = __71__SBWallpaperServer__handleFetchContentCutoutBoundsMessage_fromClient___block_invoke_3;
  v20 = &unk_1E8E9DED8;
  v9 = v7;
  v21 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x1D17E5550](&v17);
  objc_msgSend(v9, "payload", v17, v18, v19, v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11 || object_getClass(v11) != (Class)MEMORY[0x1E0C812F8])
    goto LABEL_8;
  v13 = -[SBWallpaperServer _wallpaperVariantFromXPCDictionary:](self, "_wallpaperVariantFromXPCDictionary:", v12);
  v14 = -[SBWallpaperServer _deviceOrientationFromXPCDictionary:](self, "_deviceOrientationFromXPCDictionary:", v12);
  -[SBWallpaperServer delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15 || v13 || (unint64_t)(v14 - 1) > 3)
  {

LABEL_8:
    v10[2](v10);
    goto LABEL_9;
  }
  objc_msgSend(v15, "wallpaperServer:fetchContentCutoutBoundsForVariant:orientation:completionHandler:", self, 0, v14, v8);

LABEL_9:
}

uint64_t __71__SBWallpaperServer__handleFetchContentCutoutBoundsMessage_fromClient___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v5;
  _QWORD v7[8];

  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__SBWallpaperServer__handleFetchContentCutoutBoundsMessage_fromClient___block_invoke_2;
  v7[3] = &__block_descriptor_64_e33_v16__0__NSObject_OS_xpc_object__8l;
  *(double *)&v7[4] = a2;
  *(double *)&v7[5] = a3;
  *(double *)&v7[6] = a4;
  *(double *)&v7[7] = a5;
  return objc_msgSend(v5, "sendReplyMessageWithPacker:", v7);
}

uint64_t __71__SBWallpaperServer__handleFetchContentCutoutBoundsMessage_fromClient___block_invoke_2()
{
  return BSSerializeCGRectToXPCDictionaryWithKey();
}

uint64_t __71__SBWallpaperServer__handleFetchContentCutoutBoundsMessage_fromClient___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendReplyMessageWithPacker:", &__block_literal_global_6_6);
}

- (void)_handleFetchLockScreenContentCutoutBoundsMessage:(id)a3 fromClient:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __81__SBWallpaperServer__handleFetchLockScreenContentCutoutBoundsMessage_fromClient___block_invoke;
  v21[3] = &unk_1E8EB7098;
  v7 = v5;
  v22 = v7;
  v8 = (void *)MEMORY[0x1D17E5550](v21);
  v16 = v6;
  v17 = 3221225472;
  v18 = __81__SBWallpaperServer__handleFetchLockScreenContentCutoutBoundsMessage_fromClient___block_invoke_3;
  v19 = &unk_1E8E9DED8;
  v9 = v7;
  v20 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x1D17E5550](&v16);
  objc_msgSend(v9, "payload", v16, v17, v18, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11 || object_getClass(v11) != (Class)MEMORY[0x1E0C812F8])
    goto LABEL_7;
  v13 = -[SBWallpaperServer _deviceOrientationFromXPCDictionary:](self, "_deviceOrientationFromXPCDictionary:", v12);
  -[SBWallpaperServer delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14 || (unint64_t)(v13 - 1) > 3)
  {

LABEL_7:
    v10[2](v10);
    goto LABEL_8;
  }
  objc_msgSend(v14, "wallpaperServer:fetchLockScreenContentCutoutBoundsForOrientation:completionHandler:", self, v13, v8);

LABEL_8:
}

uint64_t __81__SBWallpaperServer__handleFetchLockScreenContentCutoutBoundsMessage_fromClient___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v5;
  _QWORD v7[8];

  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__SBWallpaperServer__handleFetchLockScreenContentCutoutBoundsMessage_fromClient___block_invoke_2;
  v7[3] = &__block_descriptor_64_e33_v16__0__NSObject_OS_xpc_object__8l;
  *(double *)&v7[4] = a2;
  *(double *)&v7[5] = a3;
  *(double *)&v7[6] = a4;
  *(double *)&v7[7] = a5;
  return objc_msgSend(v5, "sendReplyMessageWithPacker:", v7);
}

uint64_t __81__SBWallpaperServer__handleFetchLockScreenContentCutoutBoundsMessage_fromClient___block_invoke_2()
{
  return BSSerializeCGRectToXPCDictionaryWithKey();
}

uint64_t __81__SBWallpaperServer__handleFetchLockScreenContentCutoutBoundsMessage_fromClient___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendReplyMessageWithPacker:", &__block_literal_global_7_0);
}

- (void)_handleFetchLockScreenMaximalContentCutoutBoundsMessage:(id)a3 fromClient:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __88__SBWallpaperServer__handleFetchLockScreenMaximalContentCutoutBoundsMessage_fromClient___block_invoke;
  v21[3] = &unk_1E8EB7098;
  v7 = v5;
  v22 = v7;
  v8 = (void *)MEMORY[0x1D17E5550](v21);
  v16 = v6;
  v17 = 3221225472;
  v18 = __88__SBWallpaperServer__handleFetchLockScreenMaximalContentCutoutBoundsMessage_fromClient___block_invoke_3;
  v19 = &unk_1E8E9DED8;
  v9 = v7;
  v20 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x1D17E5550](&v16);
  objc_msgSend(v9, "payload", v16, v17, v18, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11 || object_getClass(v11) != (Class)MEMORY[0x1E0C812F8])
    goto LABEL_7;
  v13 = -[SBWallpaperServer _deviceOrientationFromXPCDictionary:](self, "_deviceOrientationFromXPCDictionary:", v12);
  -[SBWallpaperServer delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14 || (unint64_t)(v13 - 1) > 3)
  {

LABEL_7:
    v10[2](v10);
    goto LABEL_8;
  }
  objc_msgSend(v14, "wallpaperServer:fetchLockScreenMaximalContentCutoutBoundsForOrientation:completionHandler:", self, v13, v8);

LABEL_8:
}

uint64_t __88__SBWallpaperServer__handleFetchLockScreenMaximalContentCutoutBoundsMessage_fromClient___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v5;
  _QWORD v7[8];

  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__SBWallpaperServer__handleFetchLockScreenMaximalContentCutoutBoundsMessage_fromClient___block_invoke_2;
  v7[3] = &__block_descriptor_64_e33_v16__0__NSObject_OS_xpc_object__8l;
  *(double *)&v7[4] = a2;
  *(double *)&v7[5] = a3;
  *(double *)&v7[6] = a4;
  *(double *)&v7[7] = a5;
  return objc_msgSend(v5, "sendReplyMessageWithPacker:", v7);
}

uint64_t __88__SBWallpaperServer__handleFetchLockScreenMaximalContentCutoutBoundsMessage_fromClient___block_invoke_2()
{
  return BSSerializeCGRectToXPCDictionaryWithKey();
}

uint64_t __88__SBWallpaperServer__handleFetchLockScreenMaximalContentCutoutBoundsMessage_fromClient___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendReplyMessageWithPacker:", &__block_literal_global_8_3);
}

- (void)_handleFetchLockScreenForegroundBoundsMessage:(id)a3 fromClient:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __78__SBWallpaperServer__handleFetchLockScreenForegroundBoundsMessage_fromClient___block_invoke;
  v21[3] = &unk_1E8EB7098;
  v7 = v5;
  v22 = v7;
  v8 = (void *)MEMORY[0x1D17E5550](v21);
  v16 = v6;
  v17 = 3221225472;
  v18 = __78__SBWallpaperServer__handleFetchLockScreenForegroundBoundsMessage_fromClient___block_invoke_3;
  v19 = &unk_1E8E9DED8;
  v9 = v7;
  v20 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x1D17E5550](&v16);
  objc_msgSend(v9, "payload", v16, v17, v18, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11 || object_getClass(v11) != (Class)MEMORY[0x1E0C812F8])
    goto LABEL_7;
  v13 = -[SBWallpaperServer _deviceOrientationFromXPCDictionary:](self, "_deviceOrientationFromXPCDictionary:", v12);
  -[SBWallpaperServer delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14 || (unint64_t)(v13 - 1) > 3)
  {

LABEL_7:
    v10[2](v10);
    goto LABEL_8;
  }
  objc_msgSend(v14, "wallpaperServer:fetchObscurableBoundsForOrientation:completionHandler:", self, v13, v8);

LABEL_8:
}

uint64_t __78__SBWallpaperServer__handleFetchLockScreenForegroundBoundsMessage_fromClient___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v5;
  _QWORD v7[8];

  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__SBWallpaperServer__handleFetchLockScreenForegroundBoundsMessage_fromClient___block_invoke_2;
  v7[3] = &__block_descriptor_64_e33_v16__0__NSObject_OS_xpc_object__8l;
  *(double *)&v7[4] = a2;
  *(double *)&v7[5] = a3;
  *(double *)&v7[6] = a4;
  *(double *)&v7[7] = a5;
  return objc_msgSend(v5, "sendReplyMessageWithPacker:", v7);
}

uint64_t __78__SBWallpaperServer__handleFetchLockScreenForegroundBoundsMessage_fromClient___block_invoke_2()
{
  return BSSerializeCGRectToXPCDictionaryWithKey();
}

uint64_t __78__SBWallpaperServer__handleFetchLockScreenForegroundBoundsMessage_fromClient___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendReplyMessageWithPacker:", &__block_literal_global_9_4);
}

- (void)_handleFetchLimitedOcclusionBoundsMessage:(id)a3 fromClient:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __74__SBWallpaperServer__handleFetchLimitedOcclusionBoundsMessage_fromClient___block_invoke;
  v21[3] = &unk_1E8EB7098;
  v7 = v5;
  v22 = v7;
  v8 = (void *)MEMORY[0x1D17E5550](v21);
  v16 = v6;
  v17 = 3221225472;
  v18 = __74__SBWallpaperServer__handleFetchLimitedOcclusionBoundsMessage_fromClient___block_invoke_3;
  v19 = &unk_1E8E9DED8;
  v9 = v7;
  v20 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x1D17E5550](&v16);
  objc_msgSend(v9, "payload", v16, v17, v18, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11 || object_getClass(v11) != (Class)MEMORY[0x1E0C812F8])
    goto LABEL_7;
  v13 = -[SBWallpaperServer _deviceOrientationFromXPCDictionary:](self, "_deviceOrientationFromXPCDictionary:", v12);
  -[SBWallpaperServer delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14 || (unint64_t)(v13 - 1) > 3)
  {

LABEL_7:
    v10[2](v10);
    goto LABEL_8;
  }
  objc_msgSend(v14, "wallpaperServer:fetchLimitedOcclusionBoundsForOrientation:completionHandler:", self, v13, v8);

LABEL_8:
}

uint64_t __74__SBWallpaperServer__handleFetchLimitedOcclusionBoundsMessage_fromClient___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v5;
  _QWORD v7[8];

  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__SBWallpaperServer__handleFetchLimitedOcclusionBoundsMessage_fromClient___block_invoke_2;
  v7[3] = &__block_descriptor_64_e33_v16__0__NSObject_OS_xpc_object__8l;
  *(double *)&v7[4] = a2;
  *(double *)&v7[5] = a3;
  *(double *)&v7[6] = a4;
  *(double *)&v7[7] = a5;
  return objc_msgSend(v5, "sendReplyMessageWithPacker:", v7);
}

uint64_t __74__SBWallpaperServer__handleFetchLimitedOcclusionBoundsMessage_fromClient___block_invoke_2()
{
  return BSSerializeCGRectToXPCDictionaryWithKey();
}

uint64_t __74__SBWallpaperServer__handleFetchLimitedOcclusionBoundsMessage_fromClient___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendReplyMessageWithPacker:", &__block_literal_global_10_4);
}

- (void)_handleFetchLockScreenTimeBoundsMessage:(id)a3 fromClient:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __72__SBWallpaperServer__handleFetchLockScreenTimeBoundsMessage_fromClient___block_invoke;
  v21[3] = &unk_1E8EB7098;
  v7 = v5;
  v22 = v7;
  v8 = (void *)MEMORY[0x1D17E5550](v21);
  v16 = v6;
  v17 = 3221225472;
  v18 = __72__SBWallpaperServer__handleFetchLockScreenTimeBoundsMessage_fromClient___block_invoke_3;
  v19 = &unk_1E8E9DED8;
  v9 = v7;
  v20 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x1D17E5550](&v16);
  objc_msgSend(v9, "payload", v16, v17, v18, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11 || object_getClass(v11) != (Class)MEMORY[0x1E0C812F8])
    goto LABEL_7;
  v13 = -[SBWallpaperServer _deviceOrientationFromXPCDictionary:](self, "_deviceOrientationFromXPCDictionary:", v12);
  -[SBWallpaperServer delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14 || (unint64_t)(v13 - 1) > 3)
  {

LABEL_7:
    v10[2](v10);
    goto LABEL_8;
  }
  objc_msgSend(v14, "wallpaperServer:fetchLockScreenTimeBoundsForOrientation:completionHandler:", self, v13, v8);

LABEL_8:
}

uint64_t __72__SBWallpaperServer__handleFetchLockScreenTimeBoundsMessage_fromClient___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v5;
  _QWORD v7[8];

  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__SBWallpaperServer__handleFetchLockScreenTimeBoundsMessage_fromClient___block_invoke_2;
  v7[3] = &__block_descriptor_64_e33_v16__0__NSObject_OS_xpc_object__8l;
  *(double *)&v7[4] = a2;
  *(double *)&v7[5] = a3;
  *(double *)&v7[6] = a4;
  *(double *)&v7[7] = a5;
  return objc_msgSend(v5, "sendReplyMessageWithPacker:", v7);
}

uint64_t __72__SBWallpaperServer__handleFetchLockScreenTimeBoundsMessage_fromClient___block_invoke_2()
{
  return BSSerializeCGRectToXPCDictionaryWithKey();
}

uint64_t __72__SBWallpaperServer__handleFetchLockScreenTimeBoundsMessage_fromClient___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendReplyMessageWithPacker:", &__block_literal_global_11_3);
}

- (int64_t)_wallpaperModeFromXPCDictionary:(id)a3
{
  int64_t result;

  LOBYTE(result) = xpc_dictionary_get_uint64(a3, (const char *)*MEMORY[0x1E0DAC1D0]);
  if ((unint64_t)result - 1 >= 2)
    return 0;
  else
    return result;
}

- (void)_handleSetVideoMessageWithWallpaperMode:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int64_t v20;
  int64_t v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  -[SBWallpaperServer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBWallpaperServer _clientPermittedToModifyWallpaper:](self, "_clientPermittedToModifyWallpaper:", v7);

  if (v10 && -[SBWallpaperServer _xpcObjectIsDictionary:](self, "_xpcObjectIsDictionary:", v9))
  {
    BSDeserializeStringFromXPCDictionaryWithKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    BSDeserializeCGRectFromXPCDictionaryWithKey();
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = -[SBWallpaperServer _wallpaperModeFromXPCDictionary:](self, "_wallpaperModeFromXPCDictionary:", v9);
    if (v11)
    {
      v21 = v20;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __72__SBWallpaperServer__handleSetVideoMessageWithWallpaperMode_fromClient___block_invoke;
      v22[3] = &unk_1E8E9E980;
      v23 = v6;
      objc_msgSend(v8, "wallpaperServer:setWallpaperVideoWithWallpaperMode:cropRect:wallpaperMode:completionHandler:", self, v11, v21, v22, v13, v15, v17, v19);

    }
    else
    {
      objc_msgSend(v6, "sendReplyMessageWithPacker:", &__block_literal_global_17_3);
    }

  }
  else
  {
    objc_msgSend(v6, "sendReplyMessageWithPacker:", &__block_literal_global_18_3);
  }

}

uint64_t __72__SBWallpaperServer__handleSetVideoMessageWithWallpaperMode_fromClient___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  char v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__SBWallpaperServer__handleSetVideoMessageWithWallpaperMode_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5 = a2;
  return objc_msgSend(v2, "sendReplyMessageWithPacker:", v4);
}

void __72__SBWallpaperServer__handleSetVideoMessageWithWallpaperMode_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "result", *(_BYTE *)(a1 + 32));
}

void __72__SBWallpaperServer__handleSetVideoMessageWithWallpaperMode_fromClient___block_invoke_3(int a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "result", 0);
}

void __72__SBWallpaperServer__handleSetVideoMessageWithWallpaperMode_fromClient___block_invoke_4(int a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "result", 0);
}

- (void)_handleSetColorNameMessage:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  -[SBWallpaperServer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBWallpaperServer _clientPermittedToModifyWallpaper:](self, "_clientPermittedToModifyWallpaper:", v7);

  if (v10 && -[SBWallpaperServer _xpcObjectIsDictionary:](self, "_xpcObjectIsDictionary:", v9))
  {
    BSDeserializeStringFromXPCDictionaryWithKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    if (v11)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __59__SBWallpaperServer__handleSetColorNameMessage_fromClient___block_invoke;
      v15[3] = &unk_1E8E9E980;
      v16 = v6;
      objc_msgSend(v8, "wallpaperServer:setWallpaperColorName:forVariants:completionHandler:", self, v11, v14, v15);

    }
    else
    {
      objc_msgSend(v6, "sendReplyMessageWithPacker:", &__block_literal_global_22_3);
    }

  }
  else
  {
    objc_msgSend(v6, "sendReplyMessageWithPacker:", &__block_literal_global_23_6);
  }

}

uint64_t __59__SBWallpaperServer__handleSetColorNameMessage_fromClient___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  char v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__SBWallpaperServer__handleSetColorNameMessage_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5 = a2;
  return objc_msgSend(v2, "sendReplyMessageWithPacker:", v4);
}

void __59__SBWallpaperServer__handleSetColorNameMessage_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "result", *(_BYTE *)(a1 + 32));
}

void __59__SBWallpaperServer__handleSetColorNameMessage_fromClient___block_invoke_3(int a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "result", 0);
}

void __59__SBWallpaperServer__handleSetColorNameMessage_fromClient___block_invoke_4(int a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "result", 0);
}

- (void)_handleSetColorMessage:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  -[SBWallpaperServer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBWallpaperServer _clientPermittedToModifyWallpaper:](self, "_clientPermittedToModifyWallpaper:", v7);

  if (v10 && -[SBWallpaperServer _xpcObjectIsDictionary:](self, "_xpcObjectIsDictionary:", v9))
  {
    objc_opt_class();
    BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntegerValue");

    if (v11)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __55__SBWallpaperServer__handleSetColorMessage_fromClient___block_invoke;
      v16[3] = &unk_1E8E9E980;
      v17 = v6;
      objc_msgSend(v8, "wallpaperServer:setWallpaperColor:darkColor:forVariants:completionHandler:", self, v11, v12, v15, v16);

    }
    else
    {
      objc_msgSend(v6, "sendReplyMessageWithPacker:", &__block_literal_global_27_2);
    }

  }
  else
  {
    objc_msgSend(v6, "sendReplyMessageWithPacker:", &__block_literal_global_28_2);
  }

}

uint64_t __55__SBWallpaperServer__handleSetColorMessage_fromClient___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  char v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__SBWallpaperServer__handleSetColorMessage_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5 = a2;
  return objc_msgSend(v2, "sendReplyMessageWithPacker:", v4);
}

void __55__SBWallpaperServer__handleSetColorMessage_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "result", *(_BYTE *)(a1 + 32));
}

void __55__SBWallpaperServer__handleSetColorMessage_fromClient___block_invoke_3(int a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "result", 0);
}

void __55__SBWallpaperServer__handleSetColorMessage_fromClient___block_invoke_4(int a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "result", 0);
}

- (void)_handleSetGradientMessage:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  -[SBWallpaperServer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBWallpaperServer _clientPermittedToModifyWallpaper:](self, "_clientPermittedToModifyWallpaper:", v7);

  if (v10 && -[SBWallpaperServer _xpcObjectIsDictionary:](self, "_xpcObjectIsDictionary:", v9))
  {
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntegerValue");

    if (v12)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __58__SBWallpaperServer__handleSetGradientMessage_fromClient___block_invoke;
      v16[3] = &unk_1E8E9E980;
      v17 = v6;
      objc_msgSend(v8, "wallpaperServer:setWallpaperGradient:forVariants:completionHandler:", self, v12, v15, v16);

    }
    else
    {
      objc_msgSend(v6, "sendReplyMessageWithPacker:", &__block_literal_global_31_3);
    }

  }
  else
  {
    objc_msgSend(v6, "sendReplyMessageWithPacker:", &__block_literal_global_32_3);
  }

}

uint64_t __58__SBWallpaperServer__handleSetGradientMessage_fromClient___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  char v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__SBWallpaperServer__handleSetGradientMessage_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5 = a2;
  return objc_msgSend(v2, "sendReplyMessageWithPacker:", v4);
}

void __58__SBWallpaperServer__handleSetGradientMessage_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "result", *(_BYTE *)(a1 + 32));
}

void __58__SBWallpaperServer__handleSetGradientMessage_fromClient___block_invoke_3(int a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "result", 0);
}

void __58__SBWallpaperServer__handleSetGradientMessage_fromClient___block_invoke_4(int a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "result", 0);
}

- (void)_handleRestoreDefaultWallpaperMessage:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  -[SBWallpaperServer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBWallpaperServer _clientPermittedToModifyWallpaper:](self, "_clientPermittedToModifyWallpaper:", v7);

  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__SBWallpaperServer__handleRestoreDefaultWallpaperMessage_fromClient___block_invoke;
    v10[3] = &unk_1E8E9E980;
    v11 = v6;
    objc_msgSend(v8, "wallpaperServer:restoreDefaultWallpaperWithCompletionHandler:", self, v10);

  }
  else
  {
    objc_msgSend(v6, "sendReplyMessageWithPacker:", &__block_literal_global_33_5);
  }

}

uint64_t __70__SBWallpaperServer__handleRestoreDefaultWallpaperMessage_fromClient___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  char v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__SBWallpaperServer__handleRestoreDefaultWallpaperMessage_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5 = a2;
  return objc_msgSend(v2, "sendReplyMessageWithPacker:", v4);
}

void __70__SBWallpaperServer__handleRestoreDefaultWallpaperMessage_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "result", *(_BYTE *)(a1 + 32));
}

void __70__SBWallpaperServer__handleRestoreDefaultWallpaperMessage_fromClient___block_invoke_3(int a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "result", 0);
}

- (void)_handleTriggerPosterSignificantEventMessage:(id)a3 fromClient:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  -[SBWallpaperServer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__SBWallpaperServer__handleTriggerPosterSignificantEventMessage_fromClient___block_invoke;
  v8[3] = &unk_1E8E9E980;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "wallpaperServer:triggerPosterSignificantEventCompletionHandler:", self, v8);

}

uint64_t __76__SBWallpaperServer__handleTriggerPosterSignificantEventMessage_fromClient___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  char v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__SBWallpaperServer__handleTriggerPosterSignificantEventMessage_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5 = a2;
  return objc_msgSend(v2, "sendReplyMessageWithPacker:", v4);
}

void __76__SBWallpaperServer__handleTriggerPosterSignificantEventMessage_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "result", *(_BYTE *)(a1 + 32));
}

- (void)_handleFetchPosterSignificantEventsCounterMessage:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  -[SBWallpaperServer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && object_getClass(v9) == (Class)MEMORY[0x1E0C812F8])
  {
    objc_msgSend(v7, "processHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasEntitlement:", *MEMORY[0x1E0DABA78]);

    if (v12)
    {
      objc_opt_self();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __82__SBWallpaperServer__handleFetchPosterSignificantEventsCounterMessage_fromClient___block_invoke;
      v15[3] = &unk_1E8EA3A88;
      v16 = v6;
      objc_msgSend(v8, "wallpaperServer:fetchSignificantEventsCounterForPosterWithIdentifier:completionHandler:", self, v14, v15);

    }
  }
  else
  {
    objc_msgSend(v6, "sendReplyMessageWithPacker:", &__block_literal_global_37_3);
  }

}

uint64_t __82__SBWallpaperServer__handleFetchPosterSignificantEventsCounterMessage_fromClient___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __82__SBWallpaperServer__handleFetchPosterSignificantEventsCounterMessage_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v4[4] = a2;
  return objc_msgSend(v2, "sendReplyMessageWithPacker:", v4);
}

void __82__SBWallpaperServer__handleFetchPosterSignificantEventsCounterMessage_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_uint64(xdict, "result", *(_QWORD *)(a1 + 32));
}

- (void)_handleQuickActionConfigurationRequest:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "processHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasEntitlement:", *MEMORY[0x1E0DABA78]);

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v6, "payload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && object_getClass(v10) == (Class)MEMORY[0x1E0C812F8])
    {
      -[SBWallpaperServer delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      BSDeserializeDataFromXPCDictionaryWithKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB3710];
      v15 = (void *)MEMORY[0x1E0C99E60];
      v23[0] = objc_opt_class();
      v23[1] = objc_opt_class();
      v23[2] = objc_opt_class();
      v23[3] = objc_opt_class();
      v23[4] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "unarchivedObjectOfClasses:fromData:error:", v17, v13, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __71__SBWallpaperServer__handleQuickActionConfigurationRequest_fromClient___block_invoke_2;
        v19[3] = &unk_1E8EA78D8;
        v20 = v6;
        objc_msgSend(v12, "wallpaperServer:handleQuickActionConfigurationRequest:completionHandler:", self, v18, v19);

      }
    }
    else
    {
      objc_msgSend(v6, "sendReplyMessageWithPacker:", &__block_literal_global_48_3);
    }

  }
  else
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __71__SBWallpaperServer__handleQuickActionConfigurationRequest_fromClient___block_invoke;
    v21[3] = &unk_1E8EA7108;
    v22 = v7;
    objc_msgSend(v6, "sendReplyMessageWithPacker:", v21);

  }
}

void __71__SBWallpaperServer__handleQuickActionConfigurationRequest_fromClient___block_invoke(uint64_t a1, void *a2)
{
  const char *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v2 = (const char *)*MEMORY[0x1E0DAC1A8];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "processHandle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("client %@ does not have the right entitlement"), v7);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v5, v2, (const char *)objc_msgSend(v6, "UTF8String"));

}

void __71__SBWallpaperServer__handleQuickActionConfigurationRequest_fromClient___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__SBWallpaperServer__handleQuickActionConfigurationRequest_fromClient___block_invoke_3;
  v6[3] = &unk_1E8EA7108;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "sendReplyMessageWithPacker:", v6);

}

void __71__SBWallpaperServer__handleQuickActionConfigurationRequest_fromClient___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  const char *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = (const char *)*MEMORY[0x1E0DAC1A8];
    v4 = a2;
    objc_msgSend(v2, "localizedDescription");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v4, v3, (const char *)objc_msgSend(v5, "UTF8String"));

  }
}

void __71__SBWallpaperServer__handleQuickActionConfigurationRequest_fromClient___block_invoke_4(uint64_t a1, void *a2)
{
  const char *v2;
  xpc_object_t xdict;

  v2 = (const char *)*MEMORY[0x1E0DAC1A8];
  xdict = a2;
  xpc_dictionary_set_string(xdict, v2, (const char *)objc_msgSend(CFSTR("payload is nil or payload != XPC_TYPE_DICTIONARY"), "UTF8String"));

}

- (BOOL)_clientPermittedToModifyWallpaper:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  -[SBWallpaperServer accessAuthenticator](self, "accessAuthenticator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "authenticateClient:", v4);

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "isWallpaperModificationAllowed");

  return v6 & v4;
}

- (BOOL)_xpcObjectIsDictionary:(id)a3
{
  return a3 && object_getClass(a3) == (Class)MEMORY[0x1E0C812F8];
}

- (SBWallpaperServerDelegate)delegate
{
  return (SBWallpaperServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FBServiceClientAuthenticator)accessAuthenticator
{
  return self->_accessAuthenticator;
}

- (void)setAccessAuthenticator:(id)a3
{
  objc_storeStrong((id *)&self->_accessAuthenticator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessAuthenticator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
