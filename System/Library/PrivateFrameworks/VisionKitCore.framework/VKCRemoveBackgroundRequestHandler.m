@implementation VKCRemoveBackgroundRequestHandler

+ (double)maxResolution
{
  return 12582912.0;
}

+ (double)maxLength
{
  return 16000.0;
}

+ (double)minAspectRatio
{
  return 0.2;
}

+ (double)maxAspectRatio
{
  return 5.0;
}

- (VKCRemoveBackgroundRequestHandler)init
{
  VKCRemoveBackgroundRequestHandler *v2;
  uint64_t v3;
  MADService *service;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VKCRemoveBackgroundRequestHandler;
  v2 = -[VKCRemoveBackgroundRequestHandler init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D47780], "service");
    v3 = objc_claimAutoreleasedReturnValue();
    service = v2->_service;
    v2->_service = (MADService *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = dispatch_queue_create("VKCRemoveBackgroundRequestHandlerQueue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (BOOL)isValidRequest:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  BOOL v7;
  double v8;
  double v9;

  v5 = a3;
  objc_msgSend(v5, "photosRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v5, "size");
    v7 = vk_cgImageRemoveBackgroundIsValidSize(a4, v8, v9);
  }

  return v7;
}

- (void)performRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  BOOL v8;
  id v9;
  MADService *v10;
  NSObject *queue;
  MADService *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD block[4];
  id v27;
  VKCRemoveBackgroundRequestHandler *v28;
  MADService *v29;
  void (**v30)(id, _QWORD, id);
  id v31;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if ((vk_deviceSupportsRemoveBackground() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.VisionKit.RemoveBackground"), -8, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[VKCRemoveBackgroundRequestHandler performRequest:completion:].cold.2((uint64_t)v9, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_8;
  }
  v31 = 0;
  v8 = -[VKCRemoveBackgroundRequestHandler isValidRequest:error:](self, "isValidRequest:error:", v6, &v31);
  v9 = v31;
  if (!v8)
  {
    v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[VKCRemoveBackgroundRequestHandler performRequest:completion:].cold.1((uint64_t)v9, v13, v20, v21, v22, v23, v24, v25);
LABEL_8:

    v7[2](v7, 0, v9);
    goto LABEL_9;
  }
  -[VKCRemoveBackgroundRequestHandler _willBeginForRequest:]((uint64_t)self, v6);
  v10 = self->_service;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__VKCRemoveBackgroundRequestHandler_performRequest_completion___block_invoke;
  block[3] = &unk_1E9465020;
  v27 = v6;
  v28 = self;
  v29 = v10;
  v30 = v7;
  v12 = v10;
  dispatch_async(queue, block);

LABEL_9:
}

- (void)_willBeginForRequest:(uint64_t)a1
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v11;
  uint8_t v12[16];
  __int16 v13;
  uint8_t buf[16];

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "maskOnly");
    _VKSignpostLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_enabled(v6);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D2E0D000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionKit Remove Background Mask Request", (const char *)&unk_1D2EDB5E1, buf, 2u);
      }

      v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      v13 = 0;
      v9 = "Signpost Begin: \"VisionKit Remove Background Mask Request\";
      v10 = (uint8_t *)&v13;
    }
    else
    {
      if (v7)
      {
        *(_WORD *)v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D2E0D000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionKit Remove Background Request", (const char *)&unk_1D2EDB5E1, v12, 2u);
      }

      v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      v11 = 0;
      v9 = "Signpost Begin: \"VisionKit Remove Background Request\";
      v10 = (uint8_t *)&v11;
    }
    _os_log_impl(&dword_1D2E0D000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
LABEL_12:

  }
}

void __63__VKCRemoveBackgroundRequestHandler_performRequest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v37 = v3;
    _os_log_impl(&dword_1D2E0D000, v2, OS_LOG_TYPE_DEFAULT, "Beginning RemoveBGRequest: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "createMADRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "pixelBuffer");
    objc_msgSend(*(id *)(a1 + 32), "photosRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __63__VKCRemoveBackgroundRequestHandler_performRequest_completion___block_invoke_5;
    v27[3] = &unk_1E9464FF8;
    v10 = v9;
    v28 = v10;
    v11 = v4;
    v29 = v11;
    v30 = *(id *)(a1 + 32);
    v26 = v5;
    v12 = v5;
    v13 = *(_QWORD *)(a1 + 40);
    v31 = v12;
    v32 = v13;
    v33 = *(id *)(a1 + 56);
    v14 = (void *)MEMORY[0x1D8249E20](v27);
    v15 = *(void **)(a1 + 48);
    if (v6)
    {
      v35 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setMADRequestID:", objc_msgSend(v15, "performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:", v16, v6, 0, v8, v14));
    }
    else
    {
      v34 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setMADRequestID:", objc_msgSend(v15, "performRequests:onAssetWithLocalIdentifier:fromPhotoLibraryWithURL:completionHandler:", v16, v24, v25, v14));

    }
    v5 = v26;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.VisionKit.RemoveBackground"), -9, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __63__VKCRemoveBackgroundRequestHandler_performRequest_completion___block_invoke_cold_1((uint64_t)v7, v17, v18, v19, v20, v21, v22, v23);

    -[VKCRemoveBackgroundRequestHandler _didEndForRequest:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __63__VKCRemoveBackgroundRequestHandler_performRequest_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  VKCRemoveBackgroundResult *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v7 = v6;

  v8 = objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  VKDynamicCast(v8, (uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "error");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "error");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v12 = objc_msgSend(*(id *)(a1 + 48), "MADRequestID");
  objc_msgSend(*(id *)(a1 + 48), "setMADRequestID:", 0xFFFFFFFFLL);
  v13 = 0;
  if (v11 && !v4)
    v13 = -[VKCRemoveBackgroundResult initWithMADResult:request:]([VKCRemoveBackgroundResult alloc], "initWithMADResult:request:", v11, *(_QWORD *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
  v16 = v15;

  v17 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(_QWORD *)(a1 + 48);
    v19 = 134218754;
    v20 = v16;
    v21 = 2048;
    v22 = v7;
    v23 = 2112;
    v24 = v18;
    v25 = 1024;
    v26 = v12;
    _os_log_impl(&dword_1D2E0D000, v17, OS_LOG_TYPE_DEFAULT, "RemoveBG request completed with duration: %f\n madDuration: %f\n%@\n MadID: %d", (uint8_t *)&v19, 0x26u);
  }

  -[VKCRemoveBackgroundRequestHandler _didEndForRequest:](*(_QWORD *)(a1 + 64), *(void **)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

- (void)_didEndForRequest:(uint64_t)a1
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v11;
  uint8_t v12[16];
  __int16 v13;
  uint8_t buf[16];

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "maskOnly");
    _VKSignpostLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_enabled(v6);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D2E0D000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionKit Remove Background Mask Request", (const char *)&unk_1D2EDB5E1, buf, 2u);
      }

      v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      v13 = 0;
      v9 = "Signpost End: \"VisionKit Remove Background Mask Request\";
      v10 = (uint8_t *)&v13;
    }
    else
    {
      if (v7)
      {
        *(_WORD *)v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D2E0D000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionKit Remove Background Request", (const char *)&unk_1D2EDB5E1, v12, 2u);
      }

      v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      v11 = 0;
      v9 = "Signpost End: \"VisionKit Remove Background Request\";
      v10 = (uint8_t *)&v11;
    }
    _os_log_impl(&dword_1D2E0D000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
LABEL_12:

  }
}

- (void)cancelRequest:(id)a3
{
  -[MADService cancelRequestID:](self->_service, "cancelRequestID:", objc_msgSend(a3, "MADRequestID"));
}

- (void)cancelAllRequests
{
  -[MADService cancelAllRequests](self->_service, "cancelAllRequests");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)performRequest:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, a2, a3, "Request to remove background with an invalid image. %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)performRequest:(uint64_t)a3 completion:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, a2, a3, "Request to remove background on an unsupported device. %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __63__VKCRemoveBackgroundRequestHandler_performRequest_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, a2, a3, "Could not perform remove background due to nil request or inability to create a MAD request. %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
