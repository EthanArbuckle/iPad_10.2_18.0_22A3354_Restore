@implementation VKCRemoveBackgroundVideoRequestHandler

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

- (VKCRemoveBackgroundVideoRequestHandler)init
{
  VKCRemoveBackgroundVideoRequestHandler *v2;
  uint64_t v3;
  MADService *service;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VKCRemoveBackgroundVideoRequestHandler;
  v2 = -[VKCRemoveBackgroundVideoRequestHandler init](&v10, sel_init);
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

    v7 = dispatch_queue_create("VKCRemoveBackgroundVideoRequestHandlerQueue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (BOOL)isValidRequest:(id)a3 error:(id *)a4
{
  return 1;
}

- (void)performRequest:(id)a3 previewResultAvailable:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  id v15;
  MADService *v16;
  NSObject *queue;
  MADService *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD block[4];
  id v33;
  VKCRemoveBackgroundVideoRequestHandler *v34;
  MADService *v35;
  id v36;
  id v37;
  id v38;
  id v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((vk_deviceSupportsRemoveBackground() & 1) != 0)
  {
    v39 = 0;
    v14 = -[VKCRemoveBackgroundVideoRequestHandler isValidRequest:error:](self, "isValidRequest:error:", v10, &v39);
    v15 = v39;
    if (v14)
    {
      -[VKCRemoveBackgroundVideoRequestHandler _willBeginForRequest:]((uint64_t)self);
      v16 = self->_service;
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke;
      block[3] = &unk_1E94642C0;
      v33 = v10;
      v34 = self;
      v36 = v13;
      v37 = v12;
      v38 = v11;
      v35 = v16;
      v18 = v16;
      dispatch_async(queue, block);

      goto LABEL_12;
    }
    v19 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[VKCRemoveBackgroundVideoRequestHandler performRequest:previewResultAvailable:progress:completion:].cold.1((uint64_t)v15, v19, v26, v27, v28, v29, v30, v31);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.VisionKit.RemoveBackground"), -8, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v19 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[VKCRemoveBackgroundVideoRequestHandler performRequest:previewResultAvailable:progress:completion:].cold.2((uint64_t)v15, v19, v20, v21, v22, v23, v24, v25);
  }

  if (v11)
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
  if (v13)
    (*((void (**)(id, _QWORD, id))v13 + 2))(v13, 0, v15);
LABEL_12:

}

- (void)_willBeginForRequest:(uint64_t)a1
{
  NSObject *v1;
  NSObject *v2;
  uint8_t v3[16];
  uint8_t buf[16];

  if (a1)
  {
    _VKSignpostLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v1))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D2E0D000, v1, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionKit Remove Background Movie Request", (const char *)&unk_1D2EDB5E1, buf, 2u);
    }

    v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1D2E0D000, v2, OS_LOG_TYPE_INFO, "Signpost Begin: \"VisionKit Remove Background Movie Request\", v3, 2u);
    }

  }
}

void __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
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
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  __int128 *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1D2E0D000, v2, OS_LOG_TYPE_DEFAULT, "Beginning RemoveBGVideoRequest: %@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "createMADRequest");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v28);
  objc_msgSend(*(id *)(a1 + 32), "createMADPreviewRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vk_addNonNilObject:", v5);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "photosRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__7;
    v46 = __Block_byref_object_dispose__7;
    v47 = 0;
    v8 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke_29;
    v35[3] = &unk_1E9464248;
    v26 = v7;
    v36 = v26;
    v37 = v28;
    p_buf = &buf;
    v38 = *(id *)(a1 + 32);
    v9 = v27;
    v10 = *(_QWORD *)(a1 + 40);
    v39 = v9;
    v40 = v10;
    v41 = *(id *)(a1 + 56);
    v11 = (void *)MEMORY[0x1D8249E20](v35);
    v33[0] = v8;
    v33[1] = 3221225472;
    v33[2] = __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke_33;
    v33[3] = &unk_1E9464270;
    v34 = *(id *)(a1 + 64);
    v12 = (void *)MEMORY[0x1D8249E20](v33);
    v29[0] = v8;
    v29[1] = 3221225472;
    v29[2] = __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke_2;
    v29[3] = &unk_1E9464298;
    v30 = v5;
    v32 = &buf;
    v31 = *(id *)(a1 + 72);
    v13 = (void *)MEMORY[0x1D8249E20](v29);
    v14 = *(void **)(a1 + 48);
    objc_msgSend(v6, "localIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setMadRequestID:", objc_msgSend(v14, "performRequests:assetLocalIdentifier:photoLibraryURL:progressHandler:resultHandler:completionHandler:", v4, v15, v16, v12, v13, v11));

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.VisionKit.RemoveBackground"), -9, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke_cold_1((uint64_t)v6, v17, v18, v19, v20, v21, v22, v23);

    -[VKCRemoveBackgroundVideoRequestHandler _didEndForRequest:](*(_QWORD *)(a1 + 40));
    v24 = *(_QWORD *)(a1 + 72);
    if (v24)
      (*(void (**)(uint64_t, _QWORD))(v24 + 16))(v24, 0);
    v25 = *(_QWORD *)(a1 + 56);
    if (v25)
      (*(void (**)(uint64_t, _QWORD, void *))(v25 + 16))(v25, 0, v6);
  }

}

void __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke_29(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  VKCRemoveBackgroundVideoResult *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
  VKCheckedDynamicCast(v8, (uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    if (v12)
      v4 = v12;
    else
      v4 = 0;
  }
  v13 = objc_msgSend(*(id *)(a1 + 48), "madRequestID");
  objc_msgSend(*(id *)(a1 + 48), "setMadRequestID:", 0xFFFFFFFFLL);
  v14 = 0;
  if (v11 && !v4)
    v14 = -[VKCRemoveBackgroundVideoResult initWithMADVideoResult:request:]([VKCRemoveBackgroundVideoResult alloc], "initWithMADVideoResult:request:", v11, *(_QWORD *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
  v17 = v16;

  v18 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 48);
    v21 = 134218754;
    v22 = v17;
    v23 = 2048;
    v24 = v7;
    v25 = 2112;
    v26 = v19;
    v27 = 1024;
    v28 = v13;
    _os_log_impl(&dword_1D2E0D000, v18, OS_LOG_TYPE_DEFAULT, "RemoveBG video request completed with duration: %f\n madDuration: %f\n%@\n MadID: %d", (uint8_t *)&v21, 0x26u);
  }

  -[VKCRemoveBackgroundVideoRequestHandler _didEndForRequest:](*(_QWORD *)(a1 + 64));
  v20 = *(_QWORD *)(a1 + 72);
  if (v20)
    (*(void (**)(uint64_t, VKCRemoveBackgroundVideoResult *, id))(v20 + 16))(v20, v14, v4);

}

- (void)_didEndForRequest:(uint64_t)a1
{
  NSObject *v1;
  NSObject *v2;
  uint8_t v3[16];
  uint8_t buf[16];

  if (a1)
  {
    _VKSignpostLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v1))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D2E0D000, v1, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionKit Remove Background Movie Request", (const char *)&unk_1D2EDB5E1, buf, 2u);
    }

    v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1D2E0D000, v2, OS_LOG_TYPE_INFO, "Signpost End: \"VisionKit Remove Background Movie Request\", v3, 2u);
    }

  }
}

uint64_t __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke_33(uint64_t a1, int a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, a2);
  return result;
}

void __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  VKCRemoveBackgroundVideoPreviewResult *v15;
  void *v16;
  VKCRemoveBackgroundVideoPreviewResult *v17;
  uint64_t v18;

  v4 = a3;
  v5 = v4;
  if ((id)a1[4] == v4)
  {
    objc_msgSend(v4, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v6);
      v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke_2_cold_1((uint64_t)(a1 + 6), v8, v9, v10, v11, v12, v13, v14);

    }
    v15 = [VKCRemoveBackgroundVideoPreviewResult alloc];
    objc_msgSend(v5, "result");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[VKCRemoveBackgroundVideoPreviewResult initWithMADVideoPreviewResult:error:](v15, "initWithMADVideoPreviewResult:error:", v16, v6);

    v18 = a1[5];
    if (v18)
      (*(void (**)(uint64_t, VKCRemoveBackgroundVideoPreviewResult *))(v18 + 16))(v18, v17);

  }
}

- (void)cancelRequest:(id)a3
{
  -[MADService cancelRequestID:](self->_service, "cancelRequestID:", objc_msgSend(a3, "madRequestID"));
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

- (void)performRequest:(uint64_t)a3 previewResultAvailable:(uint64_t)a4 progress:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, a2, a3, "Request to remove video background with an invalid image. %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)performRequest:(uint64_t)a3 previewResultAvailable:(uint64_t)a4 progress:(uint64_t)a5 completion:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, a2, a3, "Request to remove video background on an unsupported device. %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, a2, a3, "Could not perform remove background video due to nil request or inability to create a MAD request. %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __100__VKCRemoveBackgroundVideoRequestHandler_performRequest_previewResultAvailable_progress_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, a2, a3, "RemoveBG video request result handler error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
