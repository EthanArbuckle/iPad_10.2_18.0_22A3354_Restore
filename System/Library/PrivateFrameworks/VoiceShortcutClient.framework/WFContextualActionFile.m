@implementation WFContextualActionFile

- (WFContextualActionFile)initWithFileURL:(id)a3 type:(id)a4
{
  id v8;
  id v9;
  WFContextualActionFile *v10;
  WFContextualActionFile *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  UTType *type;
  UTType *v25;
  WFContextualActionFile *v26;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;
  id v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualActionFile.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURL.isFileURL"));

  }
  v31.receiver = self;
  v31.super_class = (Class)WFContextualActionFile;
  v10 = -[WFContextualActionFile init](&v31, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_fileURL, a3);
    if (!v9)
    {
      type = v11->_type;
      v11->_type = 0;
LABEL_18:

      v26 = v11;
      goto LABEL_19;
    }
    v12 = v8;
    v13 = v9;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UTType * _Nonnull WFResolvedType(NSURL * _Nonnull __strong, UTType * _Nonnull __strong)");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("WFContextualActionFile.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURL"));

    }
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.icloud-file-fault"));

    if ((v15 & 1) == 0)
    {
      v25 = (UTType *)v13;
LABEL_17:

      type = v11->_type;
      v11->_type = v25;
      goto LABEL_18;
    }
    v33 = 0;
    v16 = *MEMORY[0x1E0C99AD0];
    v32 = 0;
    objc_msgSend(v12, "getPromisedItemResourceValue:forKey:error:", &v33, v16, &v32);
    v17 = v33;
    v18 = v32;
    getWFVoiceShortcutClientLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "WFResolvedType";
        v36 = 2112;
        v37 = v18;
        v21 = "%s File was made with a side fault type -- error fetching real type: %@";
        v22 = v20;
        v23 = OS_LOG_TYPE_ERROR;
LABEL_15:
        _os_log_impl(&dword_1AF681000, v22, v23, v21, buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "WFResolvedType";
      v36 = 2112;
      v37 = v17;
      v21 = "%s WFContextualActionFile was made with a side fault -- deduced actual type: %@";
      v22 = v20;
      v23 = OS_LOG_TYPE_INFO;
      goto LABEL_15;
    }

    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v17);
    v25 = (UTType *)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
LABEL_19:

  return v11;
}

- (void)dispose
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualActionFile fileURL](self, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v3, "removeItemAtURL:error:", v4, &v6);
  v5 = v6;

  if (v5)
    NSLog((NSString *)CFSTR("Error disposing contextual action file: %@"), v5);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualActionFile fileURL](self, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualActionFile type](self, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p url=%@, type=%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (WFContextualActionFile)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WFContextualActionFile *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", getFPSandboxingURLWrapperClass_8422(), CFSTR("SecurityScopedURLWrapper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v5, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WFContextualActionFile initWithFileURL:type:](self, "initWithFileURL:type:", v8, v6);

    v7 = self;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(getFPSandboxingURLWrapperClass_8422(), "wrapperWithURL:readonly:error:", self->_fileURL, 0, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SecurityScopedURLWrapper"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_type, CFSTR("type"));

}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (UTType)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
