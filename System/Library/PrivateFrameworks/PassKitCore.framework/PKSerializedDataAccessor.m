@implementation PKSerializedDataAccessor

- (PKSerializedDataAccessor)initWithFileURL:(id)a3 error:(id *)a4
{

  return 0;
}

- (PKSerializedDataAccessor)initWithFileURL:(id)a3 error:(id *)a4 coordinator:(id)a5
{

  return 0;
}

- (PKSerializedDataAccessor)initWithData:(id)a3 error:(id *)a4
{
  return -[PKSerializedDataAccessor initWithData:error:outputURL:](self, "initWithData:error:outputURL:", a3, a4, 0);
}

- (PKSerializedDataAccessor)initWithData:(id)a3 error:(id *)p_isa outputURL:(id)a5
{
  NSData *v8;
  NSURL *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  NSURL *v23;
  __int16 v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = (NSData *)a3;
  v9 = (NSURL *)a5;
  v10 = -[NSData length](v8, "length");
  if (v10)
  {
    if (v10 <= 0xF00000)
    {
      if (!v9)
      {
        PKTemporaryItemURLWithExtension(CFSTR("pkpass"), 1);
        v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
        PKTemporaryItemPrepareDirectory();
      }
      if ((PKUnarchiverZip(v8, v9) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        v17 = objc_msgSend(v16, "removeItemAtURL:error:", v9, &v21);
        v18 = v21;

        if ((v17 & 1) == 0)
        {
          PKLogFacilityTypeGetObject(0);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v23 = v9;
            v24 = 2112;
            v25 = v18;
            _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Couldn't remove disk representation at %@:%@", buf, 0x16u);
          }

        }
        v9 = 0;
      }
      self = (PKSerializedDataAccessor *)-[PKSerializedDataAccessor _initWithFileURL:data:error:](self, "_initWithFileURL:data:error:", v9, v8, p_isa);
      p_isa = (id *)&self->super.super.super.isa;
    }
    else if (p_isa)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Data exceeds maximum size of %g megabytes"), 0x402E000000000000);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2D50];
      v27 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v13);
      *p_isa = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
      p_isa = 0;
    }
  }
  else if (p_isa)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D50];
    v29[0] = CFSTR("No data supplied");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v15);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }

  return (PKSerializedDataAccessor *)p_isa;
}

- (PKSerializedDataAccessor)initWithFileDescriptor:(int)a3 error:(id *)a4
{
  return -[PKSerializedDataAccessor initWithFileDescriptor:error:outputURL:](self, "initWithFileDescriptor:error:outputURL:", *(_QWORD *)&a3, a4, 0);
}

- (PKSerializedDataAccessor)initWithFileDescriptor:(int)a3 error:(id *)p_isa outputURL:(id)a5
{
  NSURL *v8;
  void *v9;
  void *v10;
  const __CFString **v11;
  uint64_t *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  id v22;
  stat v23;
  uint8_t buf[4];
  NSURL *v25;
  __int16 v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v8 = (NSURL *)a5;
  if (a3 < 0)
  {
    if (p_isa)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB2D50];
      v33[0] = CFSTR("Invalid file descriptor");
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = (const __CFString **)v33;
      v12 = &v32;
      goto LABEL_7;
    }
  }
  else
  {
    memset(&v23, 0, sizeof(v23));
    if (fstat(a3, &v23))
    {
      if (p_isa)
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v30 = *MEMORY[0x1E0CB2D50];
        v31 = CFSTR("Unable to fstat file descriptor");
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = &v31;
        v12 = &v30;
LABEL_7:
        objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v13);
        *p_isa = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
        p_isa = 0;
      }
    }
    else
    {
      if (v23.st_size > 15728640)
      {
        if (!p_isa)
          goto LABEL_9;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fd exceeds maximum size of %g megabytes"), 0x402E000000000000);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v28 = *MEMORY[0x1E0CB2D50];
        v29 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v17);
        *p_isa = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      if (!v8)
      {
        PKTemporaryItemURLWithExtension(CFSTR("pkpass"), 1);
        v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
        PKTemporaryItemPrepareDirectory();
      }
      if ((PKUnarchiverZip(a3, v8, 0x600000uLL) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        v19 = objc_msgSend(v18, "removeItemAtURL:error:", v8, &v22);
        v20 = v22;

        if ((v19 & 1) == 0)
        {
          PKLogFacilityTypeGetObject(0);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v25 = v8;
            v26 = 2112;
            v27 = v20;
            _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Couldn't remove disk representation at %@:%@", buf, 0x16u);
          }

        }
        v8 = 0;
      }
      self = (PKSerializedDataAccessor *)-[PKSerializedDataAccessor _initWithFileURL:data:error:](self, "_initWithFileURL:data:error:", v8, 0, p_isa);
      p_isa = (id *)&self->super.super.super.isa;
    }
  }
LABEL_9:

  return (PKSerializedDataAccessor *)p_isa;
}

- (id)_initWithFileURL:(id)a3 data:(id)a4 error:(id *)a5
{
  id v9;
  PKSerializedDataAccessor *v10;
  PKSerializedDataAccessor *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKSerializedDataAccessor;
  v10 = -[PKFileDataAccessor initWithFileURL:error:coordinator:](&v13, sel_initWithFileURL_error_coordinator_, a3, a5, 0);
  v11 = v10;
  if (v10)
  {
    v10->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v10->_archiveData, a4);
    -[PKFileDataAccessor setOwnsFileURL:](v11, "setOwnsFileURL:", 1);
  }

  return v11;
}

- (void)_downloadRemoteAssetsWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__PKSerializedDataAccessor__downloadRemoteAssetsWithConfiguration_completion___block_invoke;
  v10[3] = &unk_1E2AC5C78;
  objc_copyWeak(&v12, &location);
  v8 = v7;
  v11 = v8;
  v9.receiver = self;
  v9.super_class = (Class)PKSerializedDataAccessor;
  -[PKFileDataAccessor _downloadRemoteAssetsWithConfiguration:completion:](&v9, sel__downloadRemoteAssetsWithConfiguration_completion_, v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __78__PKSerializedDataAccessor__downloadRemoteAssetsWithConfiguration_completion___block_invoke(uint64_t a1, int a2, void *a3, float a4)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!v10 && a2)
  {
    WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
    v8 = WeakRetained;
    if (WeakRetained)
    {
      os_unfair_lock_lock(WeakRetained + 16);
      v9 = *(void **)&v8[18]._os_unfair_lock_opaque;
      *(_QWORD *)&v8[18]._os_unfair_lock_opaque = 0;

      os_unfair_lock_unlock(v8 + 16);
    }

  }
  (*(void (**)(float))(*(_QWORD *)(a1 + 32) + 16))(a4);

}

- (id)archiveData
{
  os_unfair_lock_s *p_lock;
  NSData *archiveData;
  void *v5;
  objc_super v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  archiveData = self->_archiveData;
  if (!archiveData)
  {
    os_unfair_lock_unlock(p_lock);
LABEL_5:
    v7.receiver = self;
    v7.super_class = (Class)PKSerializedDataAccessor;
    -[PKFileDataAccessor archiveData](&v7, sel_archiveData);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  v5 = (void *)-[NSData copy](archiveData, "copy");
  os_unfair_lock_unlock(p_lock);
  if (!v5)
    goto LABEL_5;
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveData, 0);
}

@end
