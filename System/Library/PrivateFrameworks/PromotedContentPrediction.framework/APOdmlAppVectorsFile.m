@implementation APOdmlAppVectorsFile

- (id)initForReadingContentsOfURL:(id)a3 version:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  FILE *v12;
  FILE *v13;
  APOdmlAppVectorsFile *v14;
  APOdmlAppVectorsFile *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  const char *v21;
  void *v22;
  NSObject *v23;
  os_log_type_t v24;
  void *v25;
  APOdmlAppVectorsFile *v26;
  objc_super v28;
  uint64_t __ptr;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_retainAutorelease(v6);
  v11 = (const char *)objc_msgSend_fileSystemRepresentation(v8, v9, v10);
  v12 = fopen(v11, "r");
  if (!v12)
  {
    OdmlLogForCategory(2uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v31 = (id)objc_opt_class();
      v32 = 2112;
      v33 = v8;
      v17 = v31;
      _os_log_impl(&dword_1B69D6000, v16, OS_LOG_TYPE_DEFAULT, "[%@] Could not open file for reading at %@.", buf, 0x16u);

    }
    goto LABEL_21;
  }
  v13 = v12;
  __ptr = 0;
  if (fread(&__ptr, 8uLL, 1uLL, v12) != 1)
  {
    if (feof(v13))
    {
      OdmlLogForCategory(2uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      v19 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v31 = v19;
      v20 = v19;
      v21 = "[%@] Reached EOF reading header of AppVectorFile.";
    }
    else
    {
      if (!ferror(v13))
      {
LABEL_20:
        fclose(v13);
LABEL_21:
        v26 = 0;
        goto LABEL_22;
      }
      OdmlLogForCategory(2uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      v25 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v31 = v25;
      v20 = v25;
      v21 = "[%@] Internal inconsistency reading AppVectorFile.  Failed to read header.";
    }
    v23 = v18;
    v24 = OS_LOG_TYPE_ERROR;
    goto LABEL_18;
  }
  if ((_DWORD)__ptr != 1447253107)
  {
    OdmlLogForCategory(2uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v31 = v22;
      v20 = v22;
      v21 = "[%@] Internal inconsistency reading AppVectorFile.  Invalid header for vector file.";
      v23 = v18;
      v24 = OS_LOG_TYPE_DEFAULT;
LABEL_18:
      _os_log_impl(&dword_1B69D6000, v23, v24, v21, buf, 0xCu);

    }
LABEL_19:

    goto LABEL_20;
  }
  v28.receiver = self;
  v28.super_class = (Class)APOdmlAppVectorsFile;
  v14 = -[APOdmlAppVectorsFile init](&v28, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_numberOfVectors = HIDWORD(__ptr);
    objc_storeStrong((id *)&v14->_vectorVersion, a4);
    v15->_file = v13;
    v15->_nextIndex = 0;
  }
  else
  {
    fclose(v13);
  }
  self = v15;
  v26 = self;
LABEL_22:

  return v26;
}

- (void)dealloc
{
  FILE *file;
  objc_super v4;

  file = self->_file;
  if (file)
    fclose(file);
  v4.receiver = self;
  v4.super_class = (Class)APOdmlAppVectorsFile;
  -[APOdmlAppVectorsFile dealloc](&v4, sel_dealloc);
}

- (id)nextVector
{
  uint64_t v2;
  unint64_t nextIndex;
  size_t v5;
  void *v6;
  void *v7;
  APOdmlAppVector *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  NSObject *v15;
  void *v16;
  id v17;
  const char *v18;
  void *v19;
  NSObject *v20;
  os_log_type_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  nextIndex = self->_nextIndex;
  if (objc_msgSend_numberOfVectors(self, a2, v2) <= nextIndex)
    return 0;
  v24 = 0;
  v25 = 0;
  if (fread(&v24, 0x10uLL, 1uLL, self->_file) != 1)
  {
    if (feof(self->_file))
    {
      OdmlLogForCategory(2uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      v16 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v27 = v16;
      v17 = v16;
      v18 = "[%@] Reached EOF reading vector.";
    }
    else
    {
      if (!ferror(self->_file))
        return 0;
      OdmlLogForCategory(2uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

        return 0;
      }
      v22 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v27 = v22;
      v17 = v22;
      v18 = "[%@] Internal inconsistency reading AppVectorFile.  Failed to read header for vector.";
    }
LABEL_17:
    v20 = v15;
    v21 = OS_LOG_TYPE_ERROR;
    goto LABEL_18;
  }
  if ((_DWORD)v25 != *(_DWORD *)"RTCV")
  {
    OdmlLogForCategory(2uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v27 = v19;
      v17 = v19;
      v18 = "[%@] Internal inconsistency reading AppVectorFile.  Missing signature for start of next vector.";
      v20 = v15;
      v21 = OS_LOG_TYPE_DEFAULT;
LABEL_18:
      _os_log_impl(&dword_1B69D6000, v20, v21, v18, buf, 0xCu);

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  v5 = 4 * HIDWORD(v25);
  v6 = malloc_type_malloc(v5, 0x444E3FF4uLL);
  if (v6)
  {
    v7 = v6;
    if (fread(v6, 1uLL, v5, self->_file) == v5)
    {
      v8 = [APOdmlAppVector alloc];
      objc_msgSend_vectorVersion(self, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend_initWithVersion_header_floats_(v8, v12, (uint64_t)v11, &v24, v7);

      free(v7);
      ++self->_nextIndex;
      return v13;
    }
    OdmlLogForCategory(2uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v23 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v27 = v23;
    v17 = v23;
    v18 = "[%@] Internal inconsistency reading AppVectorFile.  Couldn't read required number of bytes.";
    goto LABEL_17;
  }
  return 0;
}

- (unint64_t)numberOfVectors
{
  return self->_numberOfVectors;
}

- (void)setNumberOfVectors:(unint64_t)a3
{
  self->_numberOfVectors = a3;
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

- (void)setFile:(__sFILE *)a3
{
  self->_file = a3;
}

- (unsigned)nextIndex
{
  return self->_nextIndex;
}

- (void)setNextIndex:(unsigned int)a3
{
  self->_nextIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vectorVersion, 0);
}

@end
