@implementation TRISubjectRotationNotification

+ (id)registerSubjectRotationWithQueue:(id)a3 usingBlock:(id)a4
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint32_t v10;
  uint32_t v11;
  NSObject *v12;
  TRINotificationState *v13;
  TRINotificationState *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  int out_token;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.trial.SubjectRotation", v8);
  }
  out_token = 0;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __78__TRISubjectRotationNotification_registerSubjectRotationWithQueue_usingBlock___block_invoke;
  v19 = &unk_1E3BFEA40;
  v20 = v6;
  v9 = v6;
  v10 = notify_register_dispatch("com.apple.trial.SubjectRotation", &out_token, v5, &v16);
  if (v10)
  {
    v11 = v10;
    TRILogCategory_ClientFramework();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v23 = v11;
      _os_log_error_impl(&dword_19B89C000, v12, OS_LOG_TYPE_ERROR, "notify_register_dispatch error: %lu", buf, 0xCu);
    }

    v13 = 0;
  }
  else
  {
    v14 = [TRINotificationState alloc];
    v13 = -[TRINotificationState initWithToken:](v14, "initWithToken:", out_token, v16, v17, v18, v19, v20);
  }

  return v13;
}

uint64_t __78__TRISubjectRotationNotification_registerSubjectRotationWithQueue_usingBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  TRILogCategory_ClientFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_19B89C000, v2, OS_LOG_TYPE_DEBUG, "received notification for subject rotation", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)deregisterUpdateWithToken:(id)a3
{
  if (a3)
    notify_cancel(objc_msgSend(a3, "token"));
}

+ (BOOL)notifySubjectRotation
{
  uint32_t v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = notify_post("com.apple.trial.SubjectRotation");
  if (v2)
  {
    TRILogCategory_ClientFramework();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 134217984;
      v6 = v2;
      _os_log_error_impl(&dword_19B89C000, v3, OS_LOG_TYPE_ERROR, "notify_register_dispatch error: %lu", (uint8_t *)&v5, 0xCu);
    }

  }
  return v2 == 0;
}

@end
