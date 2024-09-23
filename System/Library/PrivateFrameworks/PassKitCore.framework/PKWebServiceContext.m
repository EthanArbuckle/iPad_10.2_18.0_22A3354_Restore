@implementation PKWebServiceContext

+ (id)contextWithArchive:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  objc_msgSend(a1, "contextWithArchive:error:", a3, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v4)
  {
    PKLogFacilityTypeGetObject(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v4;
      v7 = v6;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "%@: failed to unarchive web service context with error: %@", buf, 0x16u);

    }
  }

  return v3;
}

+ (id)contextWithArchive:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v18;
  id v19;
  id v20;

  v5 = a3;
  if (a4)
    *a4 = 0;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v5, 1, &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  if (!v7)
  {
    v19 = 0;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v6, &v19);
    v12 = v19;
    if (v12)
    {
      v8 = v12;
      v10 = 0;
      v13 = CFSTR("Failed to initialize archived context data for reading");
    }
    else
    {
      v14 = objc_opt_class();
      v15 = *MEMORY[0x1E0CB2CD0];
      v18 = 0;
      objc_msgSend(v11, "decodeTopLevelObjectOfClass:forKey:error:", v14, v15, &v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v18;
      objc_msgSend(v11, "finishDecoding");
      if (!v8)
      {
        v9 = 0;
LABEL_11:

        if (!a4)
          goto LABEL_14;
        goto LABEL_12;
      }
      v13 = CFSTR("Failed to decode archived context data");
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to read contents of archived context"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (!a4)
    goto LABEL_14;
LABEL_12:
  if (v8)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB3388]);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB2D68]);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CB2AA0]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_14:

  return v10;
}

- (void)archiveAtPath:(id)a3
{
  BOOL v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  PKAutoBugCaptureReporter *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v3 = -[PKWebServiceContext archiveAtPath:error:](self, "archiveAtPath:error:", a3, &v19);
  v4 = v19;
  if (!v3)
  {
    PKLogFacilityTypeGetObject(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2112;
      v23 = v4;
      v7 = v6;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "%@: failed to archive web service context: %@", buf, 0x16u);

    }
    objc_msgSend(v4, "underlyingErrors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v10 = v9;
    else
      v10 = v4;
    v11 = (objc_class *)MEMORY[0x1E0C99E08];
    v12 = v10;
    v13 = objc_alloc_init(v11);
    objc_msgSend(v12, "localizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CB2D50]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "code"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("ErrorCode"));

    v17 = objc_alloc_init(PKAutoBugCaptureReporter);
    objc_msgSend(v12, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKAutoBugCaptureReporter reportIssueWithDomain:type:subtype:subtypeContext:payload:](v17, "reportIssueWithDomain:type:subtype:subtypeContext:payload:", CFSTR("Wallet"), CFSTR("PKWebServiceContext"), CFSTR("ContextArchiveFailed"), v18, v13);
  }

}

- (BOOL)archiveAtPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v11;
  id v12;

  v6 = a3;
  if (a4)
    *a4 = 0;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v8 || (v11 = 0, objc_msgSend(v7, "writeToFile:options:error:", v6, 1, &v11), (v8 = v11) != 0))
  {
    if (a4)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB3388]);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB2AA0]);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    PKExcludePathFromBackup((uint64_t)v6);
  }

  return v8 == 0;
}

- (PKWebServiceContext)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKWebServiceContext;
  return -[PKWebServiceContext init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
