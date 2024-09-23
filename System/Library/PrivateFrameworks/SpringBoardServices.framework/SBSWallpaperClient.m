@implementation SBSWallpaperClient

- (SBSWallpaperClient)initWithIdentifier:(id)a3 calloutQueue:(id)a4
{
  return -[SBSWallpaperClient initWithCalloutQueue:](self, "initWithCalloutQueue:", a4);
}

- (SBSWallpaperClient)initWithCalloutQueue:(id)a3
{
  id v4;
  SBSWallpaperClient *v5;
  objc_super v7;
  _QWORD v8[4];
  id v9;

  v8[1] = 3221225472;
  v8[2] = __43__SBSWallpaperClient_initWithCalloutQueue___block_invoke;
  v8[3] = &unk_1E288E330;
  v9 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBSWallpaperClient;
  v8[0] = MEMORY[0x1E0C809B0];
  v4 = v9;
  v5 = -[FBSServiceFacilityClient initWithConfigurator:](&v7, sel_initWithConfigurator_, v8);

  return v5;
}

void __43__SBSWallpaperClient_initWithCalloutQueue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0D23260], "defaultShellEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEndpoint:", v3);

  objc_msgSend(v5, "setIdentifier:", CFSTR("com.apple.springboardservices.wallpaper"));
  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v4);

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v5, "setCalloutQueue:");

}

- (void)handleQuickActionConfigurationRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0D232D0];
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __78__SBSWallpaperClient_handleQuickActionConfigurationRequest_completionHandler___block_invoke;
    v14[3] = &unk_1E288E358;
    v15 = v6;
    v10 = v7;
    v16 = v10;
    objc_msgSend(v8, "messageWithPacker:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __78__SBSWallpaperClient_handleQuickActionConfigurationRequest_completionHandler___block_invoke_2;
    v12[3] = &unk_1E288E380;
    v13 = v10;
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v11, 16, v12, 1, 0.0);

  }
}

void __78__SBSWallpaperClient_handleQuickActionConfigurationRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = objc_retainAutorelease(v5);
    xpc_dictionary_set_data(v3, "quickActionConfigurationRequest", (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  }

}

void __78__SBSWallpaperClient_handleQuickActionConfigurationRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  const char *string;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "payload");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3 && MEMORY[0x193FF8A34](v3) == MEMORY[0x1E0C812F8])
  {
    string = xpc_dictionary_get_string(v4, "quickActionConfigurationErrorResponse");
    if (string)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("SBSWallpaperServiceErrorDomain"), 0, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)fetchThumbnailForVariant:(unsigned int)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  unsigned int v12;

  v6 = a4;
  if (v6)
  {
    v7 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__SBSWallpaperClient_fetchThumbnailForVariant_completionHandler___block_invoke;
    v11[3] = &__block_descriptor_36_e33_v16__0__NSObject_OS_xpc_object__8l;
    v12 = a3;
    objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __65__SBSWallpaperClient_fetchThumbnailForVariant_completionHandler___block_invoke_2;
    v9[3] = &unk_1E288E380;
    v10 = v6;
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v8, 0, v9, 0, 0.0);

  }
}

void __65__SBSWallpaperClient_fetchThumbnailForVariant_completionHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_uint64(xdict, "variant", *(unsigned int *)(a1 + 32));
}

void __65__SBSWallpaperClient_fetchThumbnailForVariant_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const void *bytes_ptr;
  xpc_object_t xdict;

  objc_msgSend(a2, "payload");
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  if (xdict && MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(xdict, "imageData");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4 && MEMORY[0x193FF8A34](v4) == MEMORY[0x1E0C812E8])
    {
      v6 = (void *)MEMORY[0x1E0C99D50];
      bytes_ptr = xpc_data_get_bytes_ptr(v5);
      objc_msgSend(v6, "dataWithBytes:length:", bytes_ptr, xpc_data_get_length(v5));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchOriginalImageForVariant:(unsigned int)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  unsigned int v12;

  v6 = a4;
  if (v6)
  {
    v7 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__SBSWallpaperClient_fetchOriginalImageForVariant_completionHandler___block_invoke;
    v11[3] = &__block_descriptor_36_e33_v16__0__NSObject_OS_xpc_object__8l;
    v12 = a3;
    objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __69__SBSWallpaperClient_fetchOriginalImageForVariant_completionHandler___block_invoke_2;
    v9[3] = &unk_1E288E380;
    v10 = v6;
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v8, 1, v9, 0, 0.0);

  }
}

void __69__SBSWallpaperClient_fetchOriginalImageForVariant_completionHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_uint64(xdict, "variant", *(unsigned int *)(a1 + 32));
}

void __69__SBSWallpaperClient_fetchOriginalImageForVariant_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const void *bytes_ptr;
  xpc_object_t xdict;

  objc_msgSend(a2, "payload");
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  if (xdict && MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(xdict, "imageData");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4 && MEMORY[0x193FF8A34](v4) == MEMORY[0x1E0C812E8])
    {
      v6 = (void *)MEMORY[0x1E0C99D50];
      bytes_ptr = xpc_data_get_bytes_ptr(v5);
      objc_msgSend(v6, "dataWithBytes:length:", bytes_ptr, xpc_data_get_length(v5));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchOriginalVideoURLForVariant:(unsigned int)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  unsigned int v12;

  v6 = a4;
  if (v6)
  {
    v7 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__SBSWallpaperClient_fetchOriginalVideoURLForVariant_completionHandler___block_invoke;
    v11[3] = &__block_descriptor_36_e33_v16__0__NSObject_OS_xpc_object__8l;
    v12 = a3;
    objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __72__SBSWallpaperClient_fetchOriginalVideoURLForVariant_completionHandler___block_invoke_2;
    v9[3] = &unk_1E288E380;
    v10 = v6;
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v8, 2, v9, 0, 0.0);

  }
}

void __72__SBSWallpaperClient_fetchOriginalVideoURLForVariant_completionHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_uint64(xdict, "variant", *(unsigned int *)(a1 + 32));
}

void __72__SBSWallpaperClient_fetchOriginalVideoURLForVariant_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const void *bytes_ptr;
  void *v8;
  xpc_object_t xdict;

  objc_msgSend(a2, "payload");
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  if (xdict && MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(xdict, "videoURL");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4 && MEMORY[0x193FF8A34](v4) == MEMORY[0x1E0C812E8])
    {
      v6 = (void *)MEMORY[0x1E0C99D50];
      bytes_ptr = xpc_data_get_bytes_ptr(v5);
      objc_msgSend(v6, "dataWithBytes:length:", bytes_ptr, xpc_data_get_length(v5));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithDataRepresentation:relativeToURL:", v3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchContentCutoutBoundsForVariant:(unsigned int)a3 orientation:(unsigned int)a4 completionHandler:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  unsigned int v14;
  unsigned int v15;

  v8 = a5;
  if (v8)
  {
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __87__SBSWallpaperClient_fetchContentCutoutBoundsForVariant_orientation_completionHandler___block_invoke;
    v13[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
    v14 = a3;
    v15 = a4;
    objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __87__SBSWallpaperClient_fetchContentCutoutBoundsForVariant_orientation_completionHandler___block_invoke_2;
    v11[3] = &unk_1E288E380;
    v12 = v8;
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v10, 3, v11, 0, 0.0);

  }
}

void __87__SBSWallpaperClient_fetchContentCutoutBoundsForVariant_orientation_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  xpc_object_t xdict;

  v3 = *(unsigned int *)(a1 + 32);
  xdict = a2;
  xpc_dictionary_set_uint64(xdict, "variant", v3);
  xpc_dictionary_set_uint64(xdict, "orientation", *(unsigned int *)(a1 + 36));

}

void __87__SBSWallpaperClient_fetchContentCutoutBoundsForVariant_orientation_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  BOOL v4;
  id v5;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    v4 = MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8];
    v3 = v5;
    if (v4)
    {
      BSDeserializeCGRectFromXPCDictionaryWithKey();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v3 = v5;
    }
  }

}

- (void)fetchLockScreenContentCutoutBoundsForOrientation:(unsigned int)a3 completionHandler:(id)a4
{
  -[SBSWallpaperClient _fetchLockScreenBoundsCheckOfType:orientation:completionHandler:](self, "_fetchLockScreenBoundsCheckOfType:orientation:completionHandler:", 4, *(_QWORD *)&a3, a4);
}

- (void)fetchMaximalLockScreenContentCutoutBoundsForOrientation:(unsigned int)a3 completionHandler:(id)a4
{
  -[SBSWallpaperClient _fetchLockScreenBoundsCheckOfType:orientation:completionHandler:](self, "_fetchLockScreenBoundsCheckOfType:orientation:completionHandler:", 5, *(_QWORD *)&a3, a4);
}

- (void)fetchObscurableBoundsForOrientation:(unsigned int)a3 completionHandler:(id)a4
{
  -[SBSWallpaperClient _fetchLockScreenBoundsCheckOfType:orientation:completionHandler:](self, "_fetchLockScreenBoundsCheckOfType:orientation:completionHandler:", 6, *(_QWORD *)&a3, a4);
}

- (void)fetchLimitedOcclusionBoundsForOrientation:(unsigned int)a3 completionHandler:(id)a4
{
  -[SBSWallpaperClient _fetchLockScreenBoundsCheckOfType:orientation:completionHandler:](self, "_fetchLockScreenBoundsCheckOfType:orientation:completionHandler:", 7, *(_QWORD *)&a3, a4);
}

- (void)fetchLockScreenTimeBoundsForOrientation:(unsigned int)a3 completionHandler:(id)a4
{
  -[SBSWallpaperClient _fetchLockScreenBoundsCheckOfType:orientation:completionHandler:](self, "_fetchLockScreenBoundsCheckOfType:orientation:completionHandler:", 8, *(_QWORD *)&a3, a4);
}

- (void)_fetchLockScreenBoundsCheckOfType:(int64_t)a3 orientation:(unsigned int)a4 completionHandler:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  unsigned int v14;

  v8 = a5;
  if (v8)
  {
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __86__SBSWallpaperClient__fetchLockScreenBoundsCheckOfType_orientation_completionHandler___block_invoke;
    v13[3] = &__block_descriptor_36_e33_v16__0__NSObject_OS_xpc_object__8l;
    v14 = a4;
    objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __86__SBSWallpaperClient__fetchLockScreenBoundsCheckOfType_orientation_completionHandler___block_invoke_2;
    v11[3] = &unk_1E288E380;
    v12 = v8;
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v10, a3, v11, 0, 0.0);

  }
}

void __86__SBSWallpaperClient__fetchLockScreenBoundsCheckOfType_orientation_completionHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_uint64(xdict, "orientation", *(unsigned int *)(a1 + 32));
}

void __86__SBSWallpaperClient__fetchLockScreenBoundsCheckOfType_orientation_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  BOOL v4;
  id v5;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    v4 = MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8];
    v3 = v5;
    if (v4)
    {
      BSDeserializeCGRectFromXPCDictionaryWithKey();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v3 = v5;
    }
  }

}

- (BOOL)setWallpaperWithVideoWithWallpaperMode:(id)a3 cropRect:(CGRect)a4 wallpaperMode:(unsigned __int8)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  unsigned __int8 v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = v11;
  if (v11)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v13 = (void *)MEMORY[0x1E0D232D0];
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __84__SBSWallpaperClient_setWallpaperWithVideoWithWallpaperMode_cropRect_wallpaperMode___block_invoke;
    v19[3] = &unk_1E288E3E8;
    v20 = v11;
    v21 = x;
    v22 = y;
    v23 = width;
    v24 = height;
    v25 = a5;
    objc_msgSend(v13, "messageWithPacker:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __84__SBSWallpaperClient_setWallpaperWithVideoWithWallpaperMode_cropRect_wallpaperMode___block_invoke_2;
    v18[3] = &unk_1E288E410;
    v18[4] = &v26;
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v15, 9, v18, 1, 0.0);

    v16 = *((_BYTE *)v27 + 24) != 0;
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __84__SBSWallpaperClient_setWallpaperWithVideoWithWallpaperMode_cropRect_wallpaperMode___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  xdict = a2;
  BSSerializeStringToXPCDictionaryWithKey();
  BSSerializeCGRectToXPCDictionaryWithKey();
  xpc_dictionary_set_uint64(xdict, "wallpaperMode", *(unsigned __int8 *)(a1 + 72));

}

void __84__SBSWallpaperClient_setWallpaperWithVideoWithWallpaperMode_cropRect_wallpaperMode___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v5, "payload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(v4, "result");

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

- (BOOL)setWallpaperColorName:(id)a3 forVariants:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v8 = (void *)MEMORY[0x1E0D232D0];
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__SBSWallpaperClient_setWallpaperColorName_forVariants___block_invoke;
    v14[3] = &unk_1E288E438;
    v15 = v6;
    v16 = a4;
    objc_msgSend(v8, "messageWithPacker:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __56__SBSWallpaperClient_setWallpaperColorName_forVariants___block_invoke_2;
    v13[3] = &unk_1E288E410;
    v13[4] = &v17;
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v10, 10, v13, 1, 0.0);

    v11 = *((_BYTE *)v18 + 24) != 0;
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __56__SBSWallpaperClient_setWallpaperColorName_forVariants___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  BSSerializeStringToXPCDictionaryWithKey();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

}

void __56__SBSWallpaperClient_setWallpaperColorName_forVariants___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v5, "payload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(v4, "result");

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

- (BOOL)setWallpaperColor:(id)a3 darkColor:(id)a4 forVariants:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v10 = (void *)MEMORY[0x1E0D232D0];
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__SBSWallpaperClient_setWallpaperColor_darkColor_forVariants___block_invoke;
    v16[3] = &unk_1E288E460;
    v17 = v8;
    v18 = v9;
    v19 = a5;
    objc_msgSend(v10, "messageWithPacker:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __62__SBSWallpaperClient_setWallpaperColor_darkColor_forVariants___block_invoke_2;
    v15[3] = &unk_1E288E410;
    v15[4] = &v20;
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v12, 11, v15, 1, 0.0);

    v13 = *((_BYTE *)v21 + 24) != 0;
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __62__SBSWallpaperClient_setWallpaperColor_darkColor_forVariants___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  if (*(_QWORD *)(a1 + 40))
    BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

}

void __62__SBSWallpaperClient_setWallpaperColor_darkColor_forVariants___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v5, "payload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(v4, "result");

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

- (BOOL)setWallpaperGradient:(id)a3 forVariants:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v8 = (void *)MEMORY[0x1E0D232D0];
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__SBSWallpaperClient_setWallpaperGradient_forVariants___block_invoke;
    v14[3] = &unk_1E288E438;
    v15 = v6;
    v16 = a4;
    objc_msgSend(v8, "messageWithPacker:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __55__SBSWallpaperClient_setWallpaperGradient_forVariants___block_invoke_2;
    v13[3] = &unk_1E288E410;
    v13[4] = &v17;
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v10, 12, v13, 1, 0.0);

    v11 = *((_BYTE *)v18 + 24) != 0;
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __55__SBSWallpaperClient_setWallpaperGradient_forVariants___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

}

void __55__SBSWallpaperClient_setWallpaperGradient_forVariants___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v5, "payload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(v4, "result");

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

- (void)restoreDefaultWallpaperWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__SBSWallpaperClient_restoreDefaultWallpaperWithCompletion___block_invoke;
  v7[3] = &unk_1E288E380;
  v8 = v4;
  v6 = v4;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v5, 13, v7, 1, 0.0);

}

uint64_t __60__SBSWallpaperClient_restoreDefaultWallpaperWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)triggerPosterSignificantEventWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__SBSWallpaperClient_triggerPosterSignificantEventWithCompletion___block_invoke;
  v7[3] = &unk_1E288E380;
  v8 = v4;
  v6 = v4;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v5, 14, v7, 1, 0.0);

}

uint64_t __66__SBSWallpaperClient_triggerPosterSignificantEventWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)significantEventsCounterForPosterWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = (void *)MEMORY[0x1E0D232D0];
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__SBSWallpaperClient_significantEventsCounterForPosterWithIdentifier___block_invoke;
  v12[3] = &unk_1E288E488;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "messageWithPacker:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __70__SBSWallpaperClient_significantEventsCounterForPosterWithIdentifier___block_invoke_2;
  v11[3] = &unk_1E288E410;
  v11[4] = &v14;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v8, 15, v11, 1, 0.0);

  v9 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v9;
}

uint64_t __70__SBSWallpaperClient_significantEventsCounterForPosterWithIdentifier___block_invoke()
{
  return BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
}

void __70__SBSWallpaperClient_significantEventsCounterForPosterWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(v3, "result");
    v3 = v4;
  }

}

- (unint64_t)posterSignificantEventsCounter
{
  void *v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SBSWallpaperClient_posterSignificantEventsCounter__block_invoke;
  v6[3] = &unk_1E288E410;
  v6[4] = &v7;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v3, 15, v6, 1, 0.0);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __52__SBSWallpaperClient_posterSignificantEventsCounter__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(v3, "result");
    v3 = v4;
  }

}

- (void)fetchPosterSignificantEventsCounterWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__SBSWallpaperClient_fetchPosterSignificantEventsCounterWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E288E380;
  v8 = v4;
  v6 = v4;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v5, 15, v7, 0, 0.0);

}

void __79__SBSWallpaperClient_fetchPosterSignificantEventsCounterWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    xpc_dictionary_get_uint64(v3, "result");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
