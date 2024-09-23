@implementation UAPasteboardFileItemProvider

- (UAPasteboardFileItemProvider)initWithURL:(id)a3 sandboxExtension:(id)a4
{
  id v6;
  id v7;
  UAPasteboardFileItemProvider *v8;
  UAPasteboardFileItemProvider *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  id v19;
  id v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  id v29;
  id v30;
  NSObject *v31;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)UAPasteboardFileItemProvider;
  v8 = -[UAPasteboardFileItemProvider init](&v37, sel_init);
  v9 = v8;
  if (v8)
  {
    -[UAPasteboardFileItemProvider setFileURL:](v8, "setFileURL:", v6);
    -[UAPasteboardFileItemProvider setPreferFileRep:](v9, "setPreferFileRep:", 1);
    -[UAPasteboardFileItemProvider setSandboxExtension:](v9, "setSandboxExtension:", v7);
    -[UAPasteboardFileItemProvider fileURL](v9, "fileURL");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[UAPasteboardFileItemProvider fileURL](v9, "fileURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pathExtension");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithTag:tagClass:conformingToType:", v13, *MEMORY[0x1E0CEC400], *MEMORY[0x1E0CEC498]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UAPasteboardFileItemProvider setType:](v9, "setType:", v15);

      }
    }
    -[UAPasteboardFileItemProvider type](v9, "type");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      -[UAPasteboardFileItemProvider setType:](v9, "setType:", CFSTR("public.item"));
      v36 = 0;
      v17 = *MEMORY[0x1E0C999D0];
      v35 = 0;
      v18 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v36, v17, &v35);
      v19 = v36;
      v20 = v35;
      v21 = v20;
      if (v18)
      {
        -[UAPasteboardFileItemProvider setIsDir:](v9, "setIsDir:", objc_msgSend(v19, "BOOLValue"));
        if (-[UAPasteboardFileItemProvider isDir](v9, "isDir"))
          v22 = CFSTR("public.directory");
        else
          v22 = CFSTR("public.data");
        -[UAPasteboardFileItemProvider setType:](v9, "setType:", v22);
      }
      else
      {
        if (v20)
        {
          objc_msgSend(v20, "domain");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23 == (void *)*MEMORY[0x1E0CB28A8])
          {
            v25 = objc_msgSend(v21, "code");

            if (v25 == 260)
              goto LABEL_18;
          }
          else
          {

          }
        }
        _uaGetLogForCategory(CFSTR("pasteboard-client"));
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138478083;
          v39 = v6;
          v40 = 2112;
          v41 = v21;
          _os_log_impl(&dword_1AF7EB000, v26, OS_LOG_TYPE_ERROR, "Error checking if url %{private}@ is directory: %@", buf, 0x16u);
        }

      }
LABEL_18:
      v34 = 0;
      v27 = *MEMORY[0x1E0C998E0];
      v33 = 0;
      v28 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v34, v27, &v33);
      v29 = v34;
      v30 = v33;

      if (v28)
      {
        objc_msgSend(v29, "identifier");
        v31 = objc_claimAutoreleasedReturnValue();
        -[UAPasteboardFileItemProvider setType:](v9, "setType:", v31);
      }
      else
      {
        if (!v30)
        {
LABEL_24:

          goto LABEL_25;
        }
        _uaGetLogForCategory(0);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543619;
          v39 = v30;
          v40 = 2113;
          v41 = v6;
          _os_log_impl(&dword_1AF7EB000, v31, OS_LOG_TYPE_INFO, "Error %{public}@ getting content type for file item provider url=%{private}@", buf, 0x16u);
        }
      }

      goto LABEL_24;
    }
  }
LABEL_25:

  return v9;
}

+ (BOOL)conformsToProtocol:(id)a3
{
  id v3;
  unsigned __int8 v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___UAPasteboardFileItemProvider;
  v3 = a3;
  v4 = objc_msgSendSuper2(&v6, sel_conformsToProtocol_, v3);

  if (&unk_1EEE63170 == v3)
    return 0;
  else
    return v4;
}

- (id)getFileName
{
  void *v2;
  void *v3;

  -[UAPasteboardFileItemProvider fileURL](self, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)getDataWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__UAPasteboardFileItemProvider_getDataWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E6007F28;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[UAPasteboardFileItemProvider accessFileAtURLWithCompletion:](self, "accessFileAtURLWithCompletion:", v6);

}

void __59__UAPasteboardFileItemProvider_getDataWithCompletionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isDir"))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initWithURL:options:error:", v8, 1, 0);
      objc_msgSend(v5, "serializedRepresentation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithData:", v6);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithURL:", v8);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

- (void)accessFileAtURLWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[UAPasteboardFileItemProvider fileURL](self, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_DEBUG, "Accessing file at URL: %@", buf, 0xCu);

  }
  -[UAPasteboardFileItemProvider sandboxExtension](self, "sandboxExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UAPasteboardFileItemProvider sandboxExtension](self, "sandboxExtension");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "bytes");
    sandbox_extension_consume();

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", 0);
  -[UAPasteboardFileItemProvider fileURL](self, "fileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__UAPasteboardFileItemProvider_accessFileAtURLWithCompletion___block_invoke;
  v16[3] = &unk_1E6007F50;
  v16[4] = self;
  v11 = v4;
  v17 = v11;
  objc_msgSend(v9, "coordinateReadingItemAtURL:options:error:byAccessor:", v10, 0, &v18, v16);
  v12 = v18;

  if (v12)
  {
    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl(&dword_1AF7EB000, v13, OS_LOG_TYPE_ERROR, "Error coordinating file: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -124, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v14);

  }
  -[UAPasteboardFileItemProvider sandboxExtension](self, "sandboxExtension");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    sandbox_extension_release();

}

void __62__UAPasteboardFileItemProvider_accessFileAtURLWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_DEBUG, "Providing URL: %@", (uint8_t *)&v6, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)preferFileRep
{
  return self->_preferFileRep;
}

- (void)setPreferFileRep:(BOOL)a3
{
  self->_preferFileRep = a3;
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSData)sandboxExtension
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSandboxExtension:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)isDir
{
  return self->_isDir;
}

- (void)setIsDir:(BOOL)a3
{
  self->_isDir = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtension, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
