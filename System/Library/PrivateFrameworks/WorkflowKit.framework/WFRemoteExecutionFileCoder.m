@implementation WFRemoteExecutionFileCoder

- (WFRemoteExecutionFileCoder)initWithCoordinator:(id)a3 requestIdentifier:(id)a4
{
  id v7;
  id v8;
  WFRemoteExecutionFileCoder *v9;
  uint64_t v10;
  NSMutableArray *transferIdentifiers;
  WFRemoteExecutionFileCoder *v12;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionFileCoder.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coordinator"));

  }
  v15.receiver = self;
  v15.super_class = (Class)WFRemoteExecutionFileCoder;
  v9 = -[WFRemoteExecutionFileCoder init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_opt_new();
    transferIdentifiers = v9->_transferIdentifiers;
    v9->_transferIdentifiers = (NSMutableArray *)v10;

    objc_storeWeak((id *)&v9->_coordinator, v7);
    objc_storeStrong((id *)&v9->_requestIdentifier, a4);
    v12 = v9;
  }

  return v9;
}

- (int64_t)targetPlatform
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 2 * (objc_msgSend(v2, "platform") == 0);

  return v3;
}

- (void)archiveFileAtURL:(id)a3 fileShouldBeDeletedOnDeallocation:(BOOL)a4 withCoder:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = (void *)MEMORY[0x1E0CB3A28];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v7, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[WFRemoteExecutionFileCoder coordinator](self, "coordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionFileCoder requestIdentifier](self, "requestIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendFileAtURL:transferIdentifier:requestIdentifier:error:", v9, v14, v12, 0);

  -[WFRemoteExecutionFileCoder transferIdentifiers](self, "transferIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v14);

  objc_msgSend(v8, "encodeObject:forKey:", v14, CFSTR("transferIdentifier"));
}

- (void)cancelOutstandingTransfers
{
  id v2;

  -[WFRemoteExecutionFileCoder coordinator](self, "coordinator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelPendingFileTransfers");

}

- (id)decodeFileWithCoder:(id)a3 fileShouldBeDeletedOnDeallocation:(BOOL *)a4 fileIsSecurityScoped:(BOOL *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  objc_msgSend(v8, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (-[NSMutableArray containsObject:](self->_transferIdentifiers, "containsObject:", v9) & 1) != 0)
  {
    -[WFRemoteExecutionFileCoder fileURL](self, "fileURL");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFRemoteExecutionFileCoder;
    -[WFFileCoder decodeFileWithCoder:fileShouldBeDeletedOnDeallocation:fileIsSecurityScoped:](&v13, sel_decodeFileWithCoder_fileShouldBeDeletedOnDeallocation_fileIsSecurityScoped_, v8, a4, a5);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  return v11;
}

- (void)fileAvailabilityChanged
{
  void *v3;
  void *v4;
  _QWORD block[5];

  -[WFRemoteExecutionFileCoder fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFRemoteExecutionFileCoder fileAvailabilityHandler](self, "fileAvailabilityHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__WFRemoteExecutionFileCoder_fileAvailabilityChanged__block_invoke;
      block[3] = &unk_1E7AF94B0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

- (void)waitForFileAvailabilityWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFRemoteExecutionFileCoder *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __75__WFRemoteExecutionFileCoder_waitForFileAvailabilityWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E7AF76F0;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFRemoteExecutionFileCoder;
  v5[0] = MEMORY[0x1E0C809B0];
  v3 = v7;
  -[WFFileCoder waitForFileAvailabilityWithCompletionHandler:](&v4, sel_waitForFileAvailabilityWithCompletionHandler_, v5);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSMutableArray *transferIdentifiers;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFRemoteExecutionFileCoder;
  v4 = a3;
  -[WFFileCoder encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  transferIdentifiers = self->_transferIdentifiers;
  NSStringFromSelector(sel_transferIdentifiers);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", transferIdentifiers, v6, v7.receiver, v7.super_class);

}

- (WFRemoteExecutionFileCoder)initWithCoder:(id)a3
{
  id v4;
  WFRemoteExecutionFileCoder *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *transferIdentifiers;
  WFRemoteExecutionFileCoder *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFRemoteExecutionFileCoder;
  v5 = -[WFFileCoder initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_4;
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_transferIdentifiers);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  transferIdentifiers = v5->_transferIdentifiers;
  v5->_transferIdentifiers = (NSMutableArray *)v10;

  if (v5->_transferIdentifiers)
    v12 = v5;
  else
LABEL_4:
    v12 = 0;

  return v12;
}

- (NSMutableArray)transferIdentifiers
{
  return self->_transferIdentifiers;
}

- (void)setTransferIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_transferIdentifiers, a3);
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (id)fileAvailabilityHandler
{
  return self->_fileAvailabilityHandler;
}

- (void)setFileAvailabilityHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (WFRemoteExecutionCoordinator)coordinator
{
  return (WFRemoteExecutionCoordinator *)objc_loadWeakRetained((id *)&self->_coordinator);
}

- (void)setCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_coordinator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong(&self->_fileAvailabilityHandler, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_transferIdentifiers, 0);
}

uint64_t __75__WFRemoteExecutionFileCoder_waitForFileAvailabilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "transferIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  getWFRemoteExecutionLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "transferIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[WFRemoteExecutionFileCoder waitForFileAvailabilityWithCompletionHandler:]_block_invoke";
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_INFO, "%s Files are already available with identifiers: %{public}@", (uint8_t *)&v10, 0x16u);

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "transferIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[WFRemoteExecutionFileCoder waitForFileAvailabilityWithCompletionHandler:]_block_invoke";
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_INFO, "%s Waiting for files to be available with identifiers: %{public}@", (uint8_t *)&v10, 0x16u);

    }
    return objc_msgSend(*(id *)(a1 + 32), "setFileAvailabilityHandler:", *(_QWORD *)(a1 + 40));
  }
}

uint64_t __53__WFRemoteExecutionFileCoder_fileAvailabilityChanged__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void (**v4)(void);
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  getWFRemoteExecutionLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "transferIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[WFRemoteExecutionFileCoder fileAvailabilityChanged]_block_invoke";
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_INFO, "%s Files became available with identifiers: %{public}@", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "fileAvailabilityHandler");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();

  return objc_msgSend(*(id *)(a1 + 32), "setFileAvailabilityHandler:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
