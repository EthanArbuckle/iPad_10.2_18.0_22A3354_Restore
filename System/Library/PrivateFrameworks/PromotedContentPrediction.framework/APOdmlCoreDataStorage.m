@implementation APOdmlCoreDataStorage

- (APOdmlCoreDataStorage)init
{
  APOdmlCoreDataStorage *v2;
  const char *v3;
  uint64_t v4;
  APOdmlCoreDataStorage *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  int isDaemonProcess;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)APOdmlCoreDataStorage;
  v2 = -[APOdmlCoreDataStorage init](&v21, sel_init);
  v5 = v2;
  if (v2)
  {
    v2->_numLaunchesAttempted = 0;
    v2->_coreDataIsInitialized = 0;
    objc_msgSend_sharedInstance(APOdmlDatabaseConfiguration, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    isDaemonProcess = objc_msgSend_isDaemonProcess(v6, v7, v8);

    OdmlLogForCategory(4uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (isDaemonProcess)
    {
      if (v11)
      {
        v12 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138477827;
        v23 = v12;
        v13 = v12;
        _os_log_impl(&dword_1B69D6000, v10, OS_LOG_TYPE_DEFAULT, "[%{private}@] Initializing CoreData for daemon.", buf, 0xCu);

      }
      objc_msgSend_initializeCoreDataStackForDaemon(v5, v14, v15);
    }
    else
    {
      if (v11)
      {
        v16 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138477827;
        v23 = v16;
        v17 = v16;
        _os_log_impl(&dword_1B69D6000, v10, OS_LOG_TYPE_DEFAULT, "[%{private}@] Initializing CoreData for client.", buf, 0xCu);

      }
      objc_msgSend_initializeCoreDataStackForClient(v5, v18, v19);
    }
  }
  return v5;
}

- (void)launchContainer
{
  uint64_t v2;
  int v4;
  const char *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend_numLaunchesAttempted(self, a2, v2);
  objc_msgSend_setNumLaunchesAttempted_(self, v5, (v4 + 1));
  OdmlLogForCategory(4uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v11 = (id)objc_opt_class();
    v7 = v11;
    _os_log_impl(&dword_1B69D6000, v6, OS_LOG_TYPE_DEFAULT, "[%{private}@] Launching CoreData Container", buf, 0xCu);

  }
  dispatch_get_global_queue(17, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B69D766C;
  block[3] = &unk_1E6A29570;
  block[4] = self;
  dispatch_async(v8, block);

}

- (void)setNumLaunchesAttempted:(int)a3
{
  self->_numLaunchesAttempted = a3;
}

- (void)initializeCoreDataStackForClient
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend_createContainer(self, a2, v2);
  objc_msgSend_setContainerDescriptionClient(self, v4, v5);
  MEMORY[0x1E0DE7D20](self, sel_launchContainer, v6);
}

- (void)setContainerDescriptionClient
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C97C08]);
  objc_msgSend_setOption_forKey_(v3, v4, (uint64_t)CFSTR("com.apple.ap.adprivacyd.store"), *MEMORY[0x1E0C97A60]);
  v5 = MEMORY[0x1E0C9AAB0];
  objc_msgSend_setOption_forKey_(v3, v6, MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97A40]);
  objc_msgSend_setOption_forKey_(v3, v7, v5, *MEMORY[0x1E0C97900]);
  objc_msgSend_setType_(v3, v8, *MEMORY[0x1E0C97A70]);
  v12[0] = v3;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPersistentStoreDescriptions_(self->_persistentContainer, v11, (uint64_t)v10);

}

- (void)createContainer
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  NSPersistentContainer *v16;
  NSPersistentContainer *persistentContainer;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = objc_opt_class();
  objc_msgSend_bundleForClass_(v3, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLForResource_withExtension_(v6, v7, (uint64_t)CFSTR("FeatureModel"), CFSTR("momd"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OdmlLogForCategory(4uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138478083;
    v19 = (id)objc_opt_class();
    v20 = 2112;
    v21 = v8;
    v10 = v19;
    _os_log_impl(&dword_1B69D6000, v9, OS_LOG_TYPE_DEFAULT, "[%{private}@] Model URL: %@", (uint8_t *)&v18, 0x16u);

  }
  v11 = objc_alloc(MEMORY[0x1E0C97B98]);
  v13 = (void *)objc_msgSend_initWithContentsOfURL_(v11, v12, (uint64_t)v8);
  v14 = objc_alloc(MEMORY[0x1E0C97BC8]);
  v16 = (NSPersistentContainer *)objc_msgSend_initWithName_managedObjectModel_(v14, v15, (uint64_t)CFSTR("FeatureModel"), v13);
  persistentContainer = self->_persistentContainer;
  self->_persistentContainer = v16;

}

- (int)numLaunchesAttempted
{
  return self->_numLaunchesAttempted;
}

- (void)setCoreDataIsInitialized:(BOOL)a3
{
  self->_coreDataIsInitialized = a3;
}

- (void)makeApplicationSupportDirectory
{
  id v3;
  __CFString *v4;
  const char *v5;
  const char *v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  const char *v17;
  const char *v18;
  void *v19;
  id v20;
  id v21;
  char v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v4 = CFSTR("/private/var/mobile/Library/Application Support/com.apple.ap.adprivacyd/");
  v22 = 1;
  if ((objc_msgSend_fileExistsAtPath_isDirectory_(v3, v5, (uint64_t)v4, &v22) & 1) != 0)
  {
    OdmlLogForCategory(4uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138477827;
      v24 = v8;
      v9 = v8;
      _os_log_impl(&dword_1B69D6000, v7, OS_LOG_TYPE_DEFAULT, "[%{private}@] Directory already exists.", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v6, (uint64_t)v4);
    v10 = objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v3, v11, (uint64_t)v10, 1, 0, &v21);
    v12 = v21;
    v7 = v21;
    OdmlLogForCategory(4uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v7)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v15 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138478083;
        v24 = v15;
        v25 = 2112;
        v26 = v7;
        v16 = v15;
        _os_log_impl(&dword_1B69D6000, v14, OS_LOG_TYPE_ERROR, "[%{private}@] Failed to make appropriate directory with error: %@", buf, 0x16u);

      }
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v17, (uint64_t)CFSTR("APOdmlFeatureStorageErrorDomain"), 5001, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v18, (uint64_t)v14, 0);
      objc_storeStrong((id *)&self->_coreDataError, v12);
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138478083;
      v24 = v19;
      v25 = 2112;
      v26 = v10;
      v20 = v19;
      _os_log_impl(&dword_1B69D6000, v14, OS_LOG_TYPE_DEFAULT, "[%{private}@] Created directory at %@", buf, 0x16u);

    }
  }

}

- (void)initializeCoreDataStackForDaemon
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  objc_msgSend_makeApplicationSupportDirectory(self, a2, v2);
  objc_msgSend_createContainer(self, v4, v5);
  objc_msgSend_setContainerDescriptionDaemon_(self, v6, *MEMORY[0x1E0C979E8]);
  MEMORY[0x1E0DE7D20](self, sel_launchContainer, v7);
}

- (void)setContainerDescriptionDaemon:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E98];
  v5 = a3;
  objc_msgSend_fileURLWithPath_(v4, v6, (uint64_t)CFSTR("/private/var/mobile/Library/Application Support/com.apple.ap.adprivacyd/FeatureModel.sqlite"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0C97C08]);
  v10 = (void *)objc_msgSend_initWithURL_(v8, v9, (uint64_t)v7);
  objc_msgSend_setOption_forKey_(v10, v11, MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97900]);
  objc_msgSend_setType_(v10, v12, (uint64_t)v5);

  v16[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v13, (uint64_t)v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPersistentStoreDescriptions_(self->_persistentContainer, v15, (uint64_t)v14);

}

- (id)storePrecheck
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;

  objc_msgSend_coreDataError(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_coreDataError(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_msgSend_coreDataIsInitialized(self, v5, v6) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v7 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v8, v9, (uint64_t)CFSTR("APOdmlFeatureStorageErrorDomain"), 5002, 0);
  }
  return v7;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_persistentContainer, a3);
}

- (NSError)coreDataError
{
  return self->_coreDataError;
}

- (void)setCoreDataError:(id)a3
{
  objc_storeStrong((id *)&self->_coreDataError, a3);
}

- (BOOL)coreDataIsInitialized
{
  return self->_coreDataIsInitialized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreDataError, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

@end
