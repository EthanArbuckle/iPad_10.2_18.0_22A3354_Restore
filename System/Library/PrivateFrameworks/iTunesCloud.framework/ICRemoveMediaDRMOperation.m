@implementation ICRemoveMediaDRMOperation

- (ICRemoveMediaDRMOperation)initWithFilePath:(id)a3 sinfs:(id)a4
{
  id v7;
  id v8;
  ICRemoveMediaDRMOperation *v9;
  ICRemoveMediaDRMOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICRemoveMediaDRMOperation;
  v9 = -[ICRequestOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaFilePath, a3);
    objc_storeStrong((id *)&v10->_sinfs, a4);
  }

  return v10;
}

- (void)removeDRMWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__ICRemoveMediaDRMOperation_removeDRMWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E43915E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICRequestOperation performRequestWithCompletionHandler:](self, "performRequestWithCompletionHandler:", v6);

}

- (void)execute
{
  id v3;
  void *v4;
  NSArray *sinfs;
  void *v6;
  NSString *mediaFilePath;
  void *v8;
  id v9;
  NSObject *v10;
  NSString *v11;
  NSString *newFileExtension;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  sinfs = self->_sinfs;
  if (sinfs)
    objc_msgSend(v3, "setObject:forKey:", sinfs, *MEMORY[0x1E0D0D538]);
  objc_msgSend(MEMORY[0x1E0D0D558], "fileProcessor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  mediaFilePath = self->_mediaFilePath;
  v13[4] = self;
  v14 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __36__ICRemoveMediaDRMOperation_execute__block_invoke;
  v13[3] = &unk_1E438CF00;
  objc_msgSend(v6, "processPurchasedItem:withAttributes:resultInfo:progressBlock:", mediaFilePath, v4, &v14, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;

  v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "RemoveDRM operation complete. err=%{public}@, resultInfo=%{public}@", buf, 0x16u);
  }

  if (!v8)
  {
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D0D528]);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    newFileExtension = self->_newFileExtension;
    self->_newFileExtension = v11;

  }
  -[ICRequestOperation finishWithError:](self, "finishWithError:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newFileExtension, 0);
  objc_storeStrong((id *)&self->_sinfs, 0);
  objc_storeStrong((id *)&self->_mediaFilePath, 0);
}

void __36__ICRemoveMediaDRMOperation_execute__block_invoke(uint64_t a1, float a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "progress");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompletedUnitCount:", 100 * (uint64_t)a2);

}

uint64_t __60__ICRemoveMediaDRMOperation_removeDRMWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320), a2);
}

@end
