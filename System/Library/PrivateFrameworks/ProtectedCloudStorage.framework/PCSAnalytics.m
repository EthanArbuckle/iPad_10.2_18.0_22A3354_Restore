@implementation PCSAnalytics

+ (id)databasePath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/com.apple.ProtectedCloudStorage"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v7 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v12);
    v8 = v12;

    if ((v7 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PCSAnalytics.db"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingPathComponent:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v8;
        _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to create ApplicationSupport directory: %@", buf, 0xCu);
      }
      v10 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to get ApplicationSupport directory", buf, 2u);
    }
    v10 = 0;
  }

  return v10;
}

+ (id)logger
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___PCSAnalytics;
  objc_msgSendSuper2(&v3, sel_logger);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)logSuccessForEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAnalytics logSuccessForEventNamed:](self, "logSuccessForEventNamed:", v6);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("last_success_%@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFAnalytics setDateProperty:forKey:](self, "setDateProperty:forKey:", v8, v7);
}

- (void)logRecoverableError:(id)a3 forEvent:(id)a4 withAttributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (a3)
  {
    v19[0] = MEMORY[0x1E0C9AAB0];
    v18[0] = CFSTR("recoverableError");
    v18[1] = CFSTR("errorDomain");
    v10 = a3;
    objc_msgSend(v10, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v11;
    v18[2] = CFSTR("errorCode");
    v12 = (void *)MEMORY[0x1E0CB37E8];
    v13 = objc_msgSend(v10, "code");

    objc_msgSend(v12, "numberWithInteger:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v16 = (void *)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(v16, "setValuesForKeysWithDictionary:", v15);

      v15 = v16;
    }
    v17.receiver = self;
    v17.super_class = (Class)PCSAnalytics;
    -[SFAnalytics logSoftFailureForEventNamed:withAttributes:](&v17, sel_logSoftFailureForEventNamed_withAttributes_, v8, v15);

  }
}

- (void)logUnrecoverableError:(id)a3 forEvent:(id)a4 withAttributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (a3)
  {
    v18[0] = MEMORY[0x1E0C9AAA0];
    v17[0] = CFSTR("recoverableError");
    v17[1] = CFSTR("errorDomain");
    v10 = a3;
    objc_msgSend(v10, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v11;
    v17[2] = CFSTR("errorCode");
    v12 = (void *)MEMORY[0x1E0CB37E8];
    v13 = objc_msgSend(v10, "code");

    objc_msgSend(v12, "numberWithInteger:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v16 = (void *)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(v16, "setValuesForKeysWithDictionary:", v15);

      v15 = v16;
    }
    -[SFAnalytics logHardFailureForEventNamed:withAttributes:](self, "logHardFailureForEventNamed:withAttributes:", v8, v15);

  }
}

- (void)noteEvent:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SFAnalytics noteEventNamed:](self, "noteEventNamed:", v4);

}

- (id)dateOfLastSuccessForEvent:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("last_success_%@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAnalytics datePropertyForKey:](self, "datePropertyForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
