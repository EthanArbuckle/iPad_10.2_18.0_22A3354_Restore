@implementation SFCollaborationFileMetadataLoader

- (SFCollaborationFileMetadataLoader)initWithFileURL:(id)a3
{
  id v4;
  SFCollaborationFileMetadataLoader *v5;
  uint64_t v6;
  NSURL *presentedItemURL;
  NSOperationQueue *v8;
  NSOperationQueue *presentedItemOperationQueue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFCollaborationFileMetadataLoader;
  v5 = -[SFCollaborationFileMetadataLoader init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    presentedItemURL = v5->_presentedItemURL;
    v5->_presentedItemURL = (NSURL *)v6;

    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    presentedItemOperationQueue = v5->_presentedItemOperationQueue;
    v5->_presentedItemOperationQueue = v8;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_presentedItemOperationQueue, "setMaxConcurrentOperationCount:", 1);
    v5->_waitingForUbiquityChange = 0;
  }

  return v5;
}

- (void)loadMetadataWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(getFPItemManagerClass(), "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCollaborationFileMetadataLoader presentedItemURL](self, "presentedItemURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "itemForURL:error:", v6, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  if (v7)
  {
    if (SharedWithYouCoreLibrary()
      && (v9 = (void *)SharedWithYouCoreLibrary(), dlsym(v9, "SWCollaborationMetadataForDocumentURL")))
    {
      -[SFCollaborationFileMetadataLoader setLoadCompletionHandler:](self, "setLoadCompletionHandler:", v4);
      if (objc_msgSend(v7, "isKnownByTheProvider"))
      {
        -[SFCollaborationFileMetadataLoader _loadMetadata](self, "_loadMetadata");
      }
      else
      {
        -[SFCollaborationFileMetadataLoader setWaitingForUbiquityChange:](self, "setWaitingForUbiquityChange:", 1);
        share_sheet_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          -[SFCollaborationFileMetadataLoader presentedItemURL](self, "presentedItemURL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v16 = v13;
          _os_log_impl(&dword_1A2830000, v12, OS_LOG_TYPE_DEFAULT, "Collaboration: waiting to load metadata until document is synced with iCloud for documentURL:%@", buf, 0xCu);

        }
      }
    }
    else
    {
      share_sheet_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SFCollaborationFileMetadataLoader loadMetadataWithCompletionHandler:].cold.2();

      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    }
  }
  else
  {
    share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SFCollaborationFileMetadataLoader loadMetadataWithCompletionHandler:].cold.1();

    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v8);
  }

}

- (void)presentedItemUbiquityDidChange
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "presentedItemURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, a2, v4, "Collaboration: not loading metadata on presentedItemUbiquityDidChange because no completion handler was provided for documentURL:%@", v5);

  OUTLINED_FUNCTION_6_1();
}

- (void)_loadMetadata
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[SFCollaborationFileMetadataLoader presentedItemURL](self, "presentedItemURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__SFCollaborationFileMetadataLoader__loadMetadata__block_invoke;
  v4[3] = &unk_1E4831460;
  objc_copyWeak(&v5, &location);
  ((void (*)(void *, void *))softLinkSWCollaborationMetadataForDocumentURL[0])(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__SFCollaborationFileMetadataLoader__loadMetadata__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_loadCompletedWithCollaborationMetadata:error:", v6, v5);

}

- (void)_loadCompletedWithCollaborationMetadata:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SFCollaborationFileMetadataLoader _loadCompletedWithCollaborationMetadata:error:].cold.1();

  }
  -[SFCollaborationFileMetadataLoader loadCompletionHandler](self, "loadCompletionHandler");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[SFCollaborationFileMetadataLoader setLoadCompletionHandler:](self, "setLoadCompletionHandler:", 0);
  ((void (**)(_QWORD, id, id))v9)[2](v9, v6, v7);

}

- (NSOperationQueue)presentedItemOperationQueue
{
  return self->_presentedItemOperationQueue;
}

- (NSURL)presentedItemURL
{
  return self->_presentedItemURL;
}

- (BOOL)waitingForUbiquityChange
{
  return self->_waitingForUbiquityChange;
}

- (void)setWaitingForUbiquityChange:(BOOL)a3
{
  self->_waitingForUbiquityChange = a3;
}

- (id)loadCompletionHandler
{
  return self->_loadCompletionHandler;
}

- (void)setLoadCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadCompletionHandler, 0);
  objc_storeStrong((id *)&self->_presentedItemURL, 0);
  objc_storeStrong((id *)&self->_presentedItemOperationQueue, 0);
}

- (void)loadMetadataWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_5_1();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "presentedItemURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2830000, v0, v3, "error fetching item for URL:%@ : %@", v4);

  OUTLINED_FUNCTION_5_0();
}

- (void)loadMetadataWithCompletionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "Collaboration: cannot load metadata, Share Sheet was compiled without metadata support.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_loadCompletedWithCollaborationMetadata:error:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_5_1();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "presentedItemURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2830000, v0, v3, "Collaboration: error loading metadata for documentURL:%@ error:%@", v4);

  OUTLINED_FUNCTION_5_0();
}

@end
