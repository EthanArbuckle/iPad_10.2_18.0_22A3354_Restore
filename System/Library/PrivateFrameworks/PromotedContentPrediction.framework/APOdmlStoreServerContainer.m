@implementation APOdmlStoreServerContainer

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B69FA594;
  block[3] = &unk_1E6A291E0;
  block[4] = a1;
  if (qword_1ED532F60 != -1)
    dispatch_once(&qword_1ED532F60, block);
  return (id)qword_1ED532F48;
}

- (APOdmlStoreServerContainer)init
{
  APOdmlStoreServerContainer *v2;
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  NSURL *modelURL;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSXPCStoreServer *storeServer;
  NSError *listeningError;
  APOdmlUnfairLock *v21;
  const char *v22;
  uint64_t v23;
  APOdmlUnfairLock *listeningLock;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)APOdmlStoreServerContainer;
  v2 = -[APOdmlStoreServerContainer init](&v26, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB34D0];
    v4 = objc_opt_class();
    objc_msgSend_bundleForClass_(v3, v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLForResource_withExtension_(v6, v7, (uint64_t)CFSTR("FeatureModel"), CFSTR("momd"));
    v8 = objc_claimAutoreleasedReturnValue();
    modelURL = v2->_modelURL;
    v2->_modelURL = (NSURL *)v8;

    v11 = (uint64_t)v2->_modelURL;
    if (!v11)
    {
      OdmlLogForCategory(4uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138477827;
        v28 = v13;
        v14 = v13;
        _os_log_impl(&dword_1B69D6000, v12, OS_LOG_TYPE_ERROR, "[%{private}@] Error: CoreData model not found.", buf, 0xCu);

      }
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v15, (uint64_t)CFSTR("APOdmlFeatureStorageErrorDomain"), 5010, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v17, (uint64_t)v16, 0);

      v11 = (uint64_t)v2->_modelURL;
    }
    objc_msgSend_storeServerForModelURL_(v2, v10, v11);
    v18 = objc_claimAutoreleasedReturnValue();
    storeServer = v2->_storeServer;
    v2->_storeServer = (NSXPCStoreServer *)v18;

    v2->_isListening = 0;
    listeningError = v2->_listeningError;
    v2->_listeningError = 0;

    v21 = [APOdmlUnfairLock alloc];
    v23 = objc_msgSend_initWithOptions_(v21, v22, 1);
    listeningLock = v2->_listeningLock;
    v2->_listeningLock = (APOdmlUnfairLock *)v23;

  }
  return v2;
}

- (id)storeServerForModelURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  APOdmlStoreServerPolicy *v12;
  const char *v13;
  void *v14;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C97900];
  v16[0] = *MEMORY[0x1E0C97A50];
  v16[1] = v3;
  v17[0] = MEMORY[0x1E0C9AAB0];
  v17[1] = MEMORY[0x1E0C9AAB0];
  v4 = *MEMORY[0x1E0C97A60];
  v16[2] = *MEMORY[0x1E0C97A40];
  v16[3] = v4;
  v17[2] = MEMORY[0x1E0C9AAB0];
  v17[3] = CFSTR("com.apple.ap.adprivacyd.store");
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v5, v7, (uint64_t)v17, v16, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v9, (uint64_t)CFSTR("/private/var/mobile/Library/Application Support/com.apple.ap.adprivacyd/FeatureModel.sqlite"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0C97C30]);
  v12 = objc_alloc_init(APOdmlStoreServerPolicy);
  v14 = (void *)objc_msgSend_initForStoreWithURL_usingModelAtURL_options_policy_(v11, v13, (uint64_t)v10, v6, v8, v12);

  return v14;
}

- (void)startListening
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(9, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B69FA978;
  block[3] = &unk_1E6A29570;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_startListening:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  const char *v25;
  void *v26;
  const char *v27;
  id v28;
  const char *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C97B98]);
  objc_msgSend_modelURL(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithContentsOfURL_(v5, v9, (uint64_t)v8);

  v11 = objc_alloc(MEMORY[0x1E0C97BC8]);
  v13 = (void *)objc_msgSend_initWithName_managedObjectModel_(v11, v12, (uint64_t)CFSTR("FeatureModel"), v10);
  objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v14, (uint64_t)CFSTR("/private/var/mobile/Library/Application Support/com.apple.ap.adprivacyd/FeatureModel.sqlite"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0C97C08]);
  v18 = (void *)objc_msgSend_initWithURL_(v16, v17, (uint64_t)v15);
  objc_msgSend_setType_(v18, v19, *MEMORY[0x1E0C979E8]);
  objc_msgSend_setShouldInferMappingModelAutomatically_(v18, v20, 1);
  objc_msgSend_setShouldMigrateStoreAutomatically_(v18, v21, 1);
  v22 = MEMORY[0x1E0C9AAB0];
  objc_msgSend_setOption_forKey_(v18, v23, MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97978]);
  objc_msgSend_setOption_forKey_(v18, v24, v22, *MEMORY[0x1E0C97900]);
  v32[0] = v18;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v25, (uint64_t)v32, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPersistentStoreDescriptions_(v13, v27, (uint64_t)v26);

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1B69FAE94;
  v30[3] = &unk_1E6A29E28;
  v30[4] = self;
  v31 = v4;
  v28 = v4;
  objc_msgSend_loadPersistentStoresWithCompletionHandler_(v13, v29, (uint64_t)v30);

}

- (NSXPCStoreServer)storeServer
{
  return self->_storeServer;
}

- (void)setStoreServer:(id)a3
{
  objc_storeStrong((id *)&self->_storeServer, a3);
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (NSError)listeningError
{
  return self->_listeningError;
}

- (void)setListeningError:(id)a3
{
  objc_storeStrong((id *)&self->_listeningError, a3);
}

- (APOdmlUnfairLock)listeningLock
{
  return self->_listeningLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeningLock, 0);
  objc_storeStrong((id *)&self->_listeningError, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_storeServer, 0);
}

@end
