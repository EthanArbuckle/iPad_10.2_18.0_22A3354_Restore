@implementation PLDeferredProcessingServiceHandler

- (void)prewarmWithCapturePhotoSettings:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, PLCaptureDeferredPhotoProcessor *);
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  PLCaptureDeferredPhotoProcessor *v15;
  _QWORD v16[4];
  void (**v17)(id, PLCaptureDeferredPhotoProcessor *);
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, PLCaptureDeferredPhotoProcessor *))a4;
  PLBackendGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Received prewarm with PLCapturePhotoSettings: %@", buf, 0xCu);
  }

  objc_opt_class();
  v8 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "photoSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Ignoring fake AVCaptureDeferredPhotoSettings: %@", buf, 0xCu);
    }

    v13 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "successWithResult:", v14);
    v15 = (PLCaptureDeferredPhotoProcessor *)objc_claimAutoreleasedReturnValue();

    v6[2](v6, v15);
  }
  else
  {
    v15 = objc_alloc_init(PLCaptureDeferredPhotoProcessor);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __88__PLDeferredProcessingServiceHandler_prewarmWithCapturePhotoSettings_completionHandler___block_invoke;
    v16[3] = &unk_1E3676CD8;
    v17 = v6;
    -[PLCaptureDeferredPhotoProcessor prewarmWithSettings:completionHandler:](v15, "prewarmWithSettings:completionHandler:", v11, v16);

  }
}

- (void)cancelAllPrewarmingWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  PLCaptureDeferredPhotoProcessor *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v3 = a3;
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Received cancelAllPrewarming", buf, 2u);
  }

  v5 = objc_alloc_init(PLCaptureDeferredPhotoProcessor);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__PLDeferredProcessingServiceHandler_cancelAllPrewarmingWithCompletion___block_invoke;
  v7[3] = &unk_1E3676CD8;
  v8 = v3;
  v6 = v3;
  -[PLCaptureDeferredPhotoProcessor cancelAllPrewarmingWithCompletionHandler:](v5, "cancelAllPrewarmingWithCompletionHandler:", v7);

}

void __72__PLDeferredProcessingServiceHandler_cancelAllPrewarmingWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D732B8];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "successWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Completed cancelAllPrewarming", v6, 2u);
  }

}

void __88__PLDeferredProcessingServiceHandler_prewarmWithCapturePhotoSettings_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Completed prewarm with PLCapturePhotoSettings", v7, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0D732B8];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "successWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v6);
}

@end
