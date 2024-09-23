@implementation APOdmlAllowListReader

- (void)dealloc
{
  FILE *file;
  objc_super v4;

  file = self->_file;
  if (file)
  {
    fclose(file);
    self->_file = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)APOdmlAllowListReader;
  -[APOdmlAllowListReader dealloc](&v4, sel_dealloc);
}

- (id)openForReadingContentsOfURL:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  FILE *v8;
  FILE *v9;
  const char *v10;
  const char *v11;
  id v12;
  NSObject *v13;
  id v14;
  const char *v15;
  NSObject *v16;
  void *v17;
  id v18;
  const char *v19;
  NSObject *v20;
  void *v21;
  id v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t __ptr;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  v7 = (const char *)objc_msgSend_fileSystemRepresentation(v4, v5, v6);
  v8 = fopen(v7, "r");
  if (!v8)
  {
    OdmlLogForCategory(7uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = (id)objc_opt_class();
      v14 = v29;
      _os_log_impl(&dword_1B69D6000, v13, OS_LOG_TYPE_ERROR, "[%@] ERROR: Unable to open file.", buf, 0xCu);

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v15, (uint64_t)CFSTR("APOdmlFeatureCalculatorErrorDomain"), 3001, 0);
    goto LABEL_20;
  }
  v9 = v8;
  __ptr = 0;
  if (fread(&__ptr, 8uLL, 1uLL, v8) != 1)
  {
    if (feof(v9))
    {
      OdmlLogForCategory(7uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v29 = v17;
        v18 = v17;
        v19 = "[%@] Reached EOF reading header of file.";
LABEL_17:
        _os_log_impl(&dword_1B69D6000, v16, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);

      }
    }
    else
    {
      if (!ferror(v9))
      {
LABEL_19:
        fclose(v9);
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v25, (uint64_t)CFSTR("APOdmlFeatureCalculatorErrorDomain"), 3002, 0);
LABEL_20:
        v12 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      OdmlLogForCategory(7uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v24 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v29 = v24;
        v18 = v24;
        v19 = "[%@] Internal inconsistency reading file. Failed to read header.";
        goto LABEL_17;
      }
    }

    goto LABEL_19;
  }
  if ((_DWORD)__ptr != 1447253107)
  {
    OdmlLogForCategory(7uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v29 = v21;
      v22 = v21;
      _os_log_impl(&dword_1B69D6000, v20, OS_LOG_TYPE_ERROR, "[%@] Internal inconsistency reading file. Invalid header for file.", buf, 0xCu);

    }
    fclose(v9);
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v23, (uint64_t)CFSTR("APOdmlFeatureCalculatorErrorDomain"), 3003, 0);
    goto LABEL_20;
  }
  objc_msgSend_setFile_(self, v10, (uint64_t)v9);
  objc_msgSend_setNumberOfIDs_(self, v11, HIDWORD(__ptr));
  v12 = 0;
LABEL_21:

  return v12;
}

- (id)readFile
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend_nextLine(self, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9 = (void *)v6;
    do
    {
      objc_msgSend_addObject_(v3, v7, (uint64_t)v9);
      objc_msgSend_nextLine(self, v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v12;
    }
    while (v12);
  }
  v13 = (void *)objc_msgSend_copy(v3, v7, v8);

  return v13;
}

- (void)setNumberOfIDs:(unint64_t)a3
{
  self->_numberOfIDs = a3;
}

- (void)setFile:(__sFILE *)a3
{
  FILE *file;

  file = self->_file;
  if (file)
    fclose(file);
  self->_file = a3;
}

- (unint64_t)numberOfIDs
{
  return self->_numberOfIDs;
}

- (id)nextLine
{
  uint64_t v2;
  unsigned int Index;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  FILE *v9;
  const char *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  const char *v14;
  void *v15;
  FILE *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  const char *v22;
  void *v23;
  NSObject *v24;
  os_log_type_t v25;
  FILE *v26;
  void *v27;
  uint64_t __ptr;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  Index = objc_msgSend_nextIndex(self, a2, v2);
  if (objc_msgSend_numberOfIDs(self, v5, v6) <= (unint64_t)Index)
    goto LABEL_16;
  __ptr = 0;
  v30 = 0;
  v9 = (FILE *)objc_msgSend_file(self, v7, v8);
  if (fread(&__ptr, 0x10uLL, 1uLL, v9) != 1)
  {
    v16 = (FILE *)objc_msgSend_file(self, v10, v11);
    if (feof(v16))
    {
      OdmlLogForCategory(7uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      v20 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v32 = v20;
      v21 = v20;
      v22 = "[%@] Reached EOF reading ID.";
    }
    else
    {
      v26 = (FILE *)objc_msgSend_file(self, v17, v18);
      if (!ferror(v26))
      {
LABEL_16:
        v15 = 0;
        return v15;
      }
      OdmlLogForCategory(7uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      v27 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v32 = v27;
      v21 = v27;
      v22 = "[%@] Internal inconsistency reading file. Failed to read header for ID.";
    }
    v24 = v19;
    v25 = OS_LOG_TYPE_ERROR;
    goto LABEL_14;
  }
  if ((_DWORD)__ptr != 1447253074)
  {
    OdmlLogForCategory(7uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v32 = v23;
      v21 = v23;
      v22 = "[%@] Internal inconsistency reading file. Missing signature for start of next ID.";
      v24 = v19;
      v25 = OS_LOG_TYPE_DEFAULT;
LABEL_14:
      _os_log_impl(&dword_1B69D6000, v24, v25, v22, buf, 0xCu);

    }
LABEL_15:

    goto LABEL_16;
  }
  v12 = objc_msgSend_nextIndex(self, v10, v11);
  objc_msgSend_setNextIndex_(self, v13, (v12 + 1));
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v14, (uint64_t)CFSTR("%llu"), v30);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  return v15;
}

- (unsigned)nextIndex
{
  return self->_nextIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vectorVersion, 0);
}

- (NSString)vectorVersion
{
  return self->_vectorVersion;
}

- (void)setVectorVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (__sFILE)file
{
  return self->_file;
}

- (void)setNextIndex:(unsigned int)a3
{
  self->_nextIndex = a3;
}

@end
