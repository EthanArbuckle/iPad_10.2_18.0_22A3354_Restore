@implementation PLRebuildUserNotification

- (PLRebuildUserNotification)initWithMessage:(id)a3
{
  id v5;
  PLRebuildUserNotification *v6;
  PLRebuildUserNotification *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLRebuildUserNotification;
  v6 = -[PLRebuildUserNotification init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_message, a3);

  return v7;
}

- (int64_t)showAlertAndWaitForResponse
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFDictionary *v10;
  __CFUserNotification *v11;
  NSObject *v12;
  NSObject *v13;
  NSString *message;
  CFOptionFlags v15;
  NSObject *v16;
  NSString *v17;
  int64_t v18;
  CFOptionFlags v20;
  SInt32 error;
  uint8_t buf[4];
  NSString *v23;
  _QWORD v24[7];
  _QWORD v25[8];

  v25[7] = *MEMORY[0x1E0C80C00];
  if (-[PLRebuildUserNotification _shouldShowUserNotification](self, "_shouldShowUserNotification"))
  {
    v3 = *MEMORY[0x1E0C9B800];
    v25[0] = CFSTR("Photos Library Rebuild");
    v4 = *MEMORY[0x1E0C9B810];
    v24[0] = v3;
    v24[1] = v4;
    -[PLRebuildUserNotification message](self, "message");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0C9B838];
    v25[1] = v5;
    v25[2] = CFSTR("Not now");
    v7 = *MEMORY[0x1E0C9B830];
    v24[2] = v6;
    v24[3] = v7;
    v8 = *MEMORY[0x1E0C9B868];
    v25[3] = CFSTR("Rebuild");
    v25[4] = CFSTR("Ignore for 1 hour");
    v9 = *MEMORY[0x1E0C9B820];
    v24[4] = v8;
    v24[5] = v9;
    v24[6] = *MEMORY[0x1E0DABB98];
    v25[5] = MEMORY[0x1E0C9AAB0];
    v25[6] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 7);
    v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    error = 0;
    v11 = CFUserNotificationCreate(0, 60.0, 3uLL, &error, v10);
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        message = self->_message;
        *(_DWORD *)buf = 138412290;
        v23 = message;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "PLRebuildUserNotification waiting for response to message: %@", buf, 0xCu);
      }

      v20 = 0;
      CFUserNotificationReceiveResponse(v11, 60.0, &v20);
      CFRelease(v11);
      v15 = v20 & 3;
      PLBackendGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v15);
        v17 = (NSString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v17;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_INFO, "PLRebuildUserNotification buttonPressed is %@", buf, 0xCu);

      }
      switch(v15)
      {
        case 2uLL:
          -[PLRebuildUserNotification _snoozeForHours:](self, "_snoozeForHours:", 1);
LABEL_17:
          v18 = 2;
          goto LABEL_19;
        case 1uLL:
          v18 = 1;
          goto LABEL_19;
        case 0uLL:
          goto LABEL_17;
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = error;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Could not create user notification for rebuild: %d", buf, 8u);
      }

    }
    v18 = 0;
LABEL_19:

    return v18;
  }
  return 2;
}

- (BOOL)_shouldShowUserNotification
{
  NSObject *v3;
  BOOL v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (+[PLDeviceRestoreMigrationSupport isDataMigrationInProgress](PLDeviceRestoreMigrationSupport, "isDataMigrationInProgress"))
  {
    PLBackendGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "PLRebuildUserNotification: Data migration is in progress. Not showing the alert.", (uint8_t *)&v13, 2u);
    }
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject doubleForKey:](v3, "doubleForKey:", CFSTR("PLRebuildUserNotificationSnoozeUntilTime"));
    v6 = v5;
    -[NSObject stringForKey:](v3, "stringForKey:", CFSTR("PLRebuildUserNotificationSnoozeLastMessageKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", self->_message)
      && (objc_msgSend(v8, "timeIntervalSinceReferenceDate"), v9 < v6))
    {
      PLBackendGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v11;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "Should NOT show PLRebuildUserNotification because of snooze until %@", (uint8_t *)&v13, 0xCu);

      }
      v4 = 0;
    }
    else
    {
      v4 = 1;
    }

  }
  return v4;
}

- (void)_snoozeForHours:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  unint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)a3 * 60.0 * 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLBackendGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 134218242;
    v9 = a3;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "PLRebuildUserNotification snooze for %tu hour(s) until %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setDouble:forKey:", CFSTR("PLRebuildUserNotificationSnoozeUntilTime"));
  objc_msgSend(v5, "setObject:forKey:", self->_message, CFSTR("PLRebuildUserNotificationSnoozeLastMessageKey"));

}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
