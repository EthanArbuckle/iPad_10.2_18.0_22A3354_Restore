@implementation TRIDownloadNotification

- (TRIDownloadNotification)initWithType:(unint64_t)a3 progress:(unint64_t)a4 error:(id)a5
{
  id v9;
  TRIDownloadNotification *v10;
  TRIDownloadNotification *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TRIDownloadNotification;
  v10 = -[TRIDownloadNotification init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v10->_progress = a4;
    objc_storeStrong((id *)&v10->_error, a5);
  }

  return v11;
}

- (unint64_t)progressMaxValue
{
  return 100;
}

+ (id)registerDownloadNotificationForKey:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  const char *v12;
  id v13;
  id v14;
  uint32_t v15;
  uint32_t v16;
  NSObject *v17;
  TRINotificationState *v18;
  TRINotificationState *v19;
  _QWORD handler[4];
  id v22;
  id v23;
  int out_token;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[TRIDownloadNotification notificationNameForKey:](TRIDownloadNotification, "notificationNameForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[TRIDownloadNotification _dispatchQueue](TRIDownloadNotification, "_dispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  out_token = 0;
  v11 = objc_retainAutorelease(v10);
  v12 = (const char *)objc_msgSend(v11, "UTF8String");
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __79__TRIDownloadNotification_registerDownloadNotificationForKey_queue_usingBlock___block_invoke;
  handler[3] = &unk_1E3BFF138;
  v13 = v7;
  v22 = v13;
  v14 = v9;
  v23 = v14;
  v15 = notify_register_dispatch(v12, &out_token, v8, handler);
  if (v15)
  {
    v16 = v15;
    TRILogCategory_ClientFramework();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v26 = v16;
      _os_log_error_impl(&dword_19B89C000, v17, OS_LOG_TYPE_ERROR, "notify_register_dispatch error: %lu", buf, 0xCu);
    }

    v18 = 0;
  }
  else
  {
    v19 = [TRINotificationState alloc];
    v18 = -[TRINotificationState initWithToken:](v19, "initWithToken:", out_token);
  }

  return v18;
}

void __79__TRIDownloadNotification_registerDownloadNotificationForKey_queue_usingBlock___block_invoke(uint64_t a1, uint64_t token)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  TRINotificationState *v10;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  notify_get_state(token, &state64);
  +[TRIDownloadNotification _notificationWithState:](TRIDownloadNotification, "_notificationWithState:", state64);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TRILogCategory_ClientFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = objc_msgSend(v4, "type");
    v8 = objc_msgSend(v4, "progress");
    *(_DWORD *)buf = 138412802;
    v13 = v6;
    v14 = 2048;
    v15 = v7;
    v16 = 2048;
    v17 = v8;
    _os_log_impl(&dword_19B89C000, v5, OS_LOG_TYPE_DEFAULT, "received download notification for notification key %@, with type %lu and progress: %lu", buf, 0x20u);
  }

  v9 = *(_QWORD *)(a1 + 40);
  v10 = -[TRINotificationState initWithToken:]([TRINotificationState alloc], "initWithToken:", token);
  (*(void (**)(uint64_t, TRINotificationState *, void *))(v9 + 16))(v9, v10, v4);

}

+ (void)deregisterNotificationWithToken:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    notify_cancel(objc_msgSend(v3, "token"));

}

+ (BOOL)notifyDownloadProgressForKey:(id)a3 withProgress:(unint64_t)a4
{
  return a3
      && +[TRIDownloadNotification _notifyDownloadUpdateForKey:withState:](TRIDownloadNotification, "_notifyDownloadUpdateForKey:withState:");
}

+ (BOOL)notifyDownloadCompletedForKey:(id)a3
{
  return a3
      && +[TRIDownloadNotification _notifyDownloadUpdateForKey:withState:](TRIDownloadNotification, "_notifyDownloadUpdateForKey:withState:", a3, 0x1000000000000000);
}

+ (BOOL)notifyDownloadFailedForKey:(id)a3 withError:(unint64_t)a4
{
  return a3
      && +[TRIDownloadNotification _notifyDownloadUpdateForKey:withState:](TRIDownloadNotification, "_notifyDownloadUpdateForKey:withState:", a3, a4 | 0x2000000000000000);
}

+ (BOOL)notifyDownloadFailedForKey:(id)a3 withCloudKitError:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_msgSend(a1, "_errorIsInsufficientDiskSpaceCloudKitError:", v7);
    if (v7)
    {
      objc_msgSend(v7, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CKPartialErrors"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v21;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v21 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(v11, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(a1, "_errorIsInsufficientDiskSpaceCloudKitError:", v16))
                LOBYTE(v8) = 1;

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          }
          while (v13);
        }

        v8 &= 1u;
      }
    }
    if (v8)
      v17 = 4;
    else
      v17 = 1;
    v18 = +[TRIDownloadNotification notifyDownloadFailedForKey:withError:](TRIDownloadNotification, "notifyDownloadFailedForKey:withError:", v6, v17, (_QWORD)v20);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)notifyDownloadStalledForKey:(id)a3 withProgress:(unint64_t)a4
{
  return a3
      && +[TRIDownloadNotification _notifyDownloadUpdateForKey:withState:](TRIDownloadNotification, "_notifyDownloadUpdateForKey:withState:");
}

+ (BOOL)_errorIsInsufficientDiskSpaceCloudKitError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("CKErrorDomain")))
      v6 = objc_msgSend(v4, "code") == 140;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)immediateDownloadNotificationKeyForNamespaceNames:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("SIRI_DICTATION_ASSETS"), CFSTR("SIRI_UNDERSTANDING_ASR_ASSISTANT"), CFSTR("SIRI_TEXT_TO_SPEECH"), CFSTR("TRIAL_INTEGRATION_TEST1"), CFSTR("TRIAL_INTEGRATION_TEST2"), CFSTR("BIFROST_DEV_1"), CFSTR("BIFROST_DEV_2"), CFSTR("BIFROST_PROD_1"), CFSTR("BIFROST_PROD_2"), CFSTR("SPRINGBOARD_HOME"), CFSTR("HEALTH_FEATURE_AVAILABILITY"), CFSTR("SIRI_TTS_DEVICE_TRAINING"), CFSTR("REMINDERS_GROCERY"), CFSTR("BLACKPEARL_SPARROW"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v4, "containsObject:", v9) & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ImmediateDownload-%@"), v9);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (BOOL)_notifyDownloadUpdateForKey:(id)a3 withState:(unint64_t)a4
{
  id v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  uint32_t v12;
  BOOL v13;
  int out_token;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[TRIDownloadNotification notificationNameForKey:](TRIDownloadNotification, "notificationNameForKey:", a3);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "UTF8String");
  out_token = 0;
  +[TRIDownloadNotification _dispatchQueue](TRIDownloadNotification, "_dispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = notify_register_dispatch(v6, &out_token, v7, &__block_literal_global_21);

  notify_set_state(out_token, a4);
  notify_cancel(out_token);
  if (v8)
  {
    TRILogCategory_ClientFramework();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v17 = v8;
      v10 = "notify_register_dispatch error: %lu";
LABEL_10:
      _os_log_error_impl(&dword_19B89C000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);
    }
  }
  else
  {
    v11 = notify_post(v6);
    if (!v11)
    {
      v13 = 1;
      goto LABEL_7;
    }
    v12 = v11;
    TRILogCategory_ClientFramework();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v17 = v12;
      v10 = "notify_post error: %lu";
      goto LABEL_10;
    }
  }

  v13 = 0;
LABEL_7:

  return v13;
}

+ (id)notificationNameForKey:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.trial.Download"), v4);

  return v5;
}

+ (id)_dispatchQueue
{
  return (id)objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", objc_msgSend(CFSTR("com.apple.trial.Download"), "UTF8String"), 17);
}

+ (id)_descriptionForErrorCode:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("Unknown error.");
  else
    return off_1E3BFFDA8[a3 - 1];
}

+ (id)_notificationWithState:(unint64_t)a3
{
  unint64_t v3;
  TRIDownloadNotification *v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  TRIDownloadNotification *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3 & 0xFFFFFFFFFFFFFFFLL;
  switch(a3 >> 60)
  {
    case 0uLL:
      v4 = [TRIDownloadNotification alloc];
      v5 = 0;
      goto LABEL_7;
    case 1uLL:
      v4 = [TRIDownloadNotification alloc];
      v5 = 1;
      v7 = 100;
      goto LABEL_8;
    case 2uLL:
      v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v14 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(a1, "_descriptionForErrorCode:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", CFSTR("com.apple.trial"), v3, v11);

      v13 = -[TRIDownloadNotification initWithType:progress:error:]([TRIDownloadNotification alloc], "initWithType:progress:error:", 2, 0, v12);
      return v13;
    case 3uLL:
      v4 = [TRIDownloadNotification alloc];
      v5 = 3;
LABEL_7:
      v7 = v3;
LABEL_8:
      result = -[TRIDownloadNotification initWithType:progress:error:](v4, "initWithType:progress:error:", v5, v7, 0);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (id)generalErrorFromDownloadNotificationError:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    switch(objc_msgSend(v4, "code"))
    {
      case 0:
      case 2:
        goto LABEL_3;
      case 1:
        v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v18 = *MEMORY[0x1E0CB2D50];
        v19 = CFSTR("Download encountered a network error.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v11;
        v9 = 15;
        goto LABEL_4;
      case 3:
        v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v16 = *MEMORY[0x1E0CB2D50];
        v17 = CFSTR("Download cancelled.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v12;
        v9 = 14;
        goto LABEL_4;
      case 4:
        v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v20 = *MEMORY[0x1E0CB2D50];
        v21[0] = CFSTR("System does not have enough disk space available.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v13;
        v9 = 4;
        goto LABEL_4;
      default:
        break;
    }
  }
  else
  {
LABEL_3:
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v14 = *MEMORY[0x1E0CB2D50];
    v15 = CFSTR("Unknown download error.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = 1;
LABEL_4:
    v3 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), v9, v7);

  }
  return v3;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)progress
{
  return self->_progress;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
