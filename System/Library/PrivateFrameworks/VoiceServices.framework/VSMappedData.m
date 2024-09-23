@implementation VSMappedData

- (VSMappedData)initWithFilePath:(id)a3 initialSize:(unint64_t)a4
{
  id v7;
  VSMappedData *v8;
  VSMappedData *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *filePath;
  uint64_t v16;
  NSMutableData *fallbackInMemoryData;
  objc_super v19;

  v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VSMappedData;
  v8 = -[VSMappedData init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_filePath, a3);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "fileExistsAtPath:", v9->_filePath);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "createFileAtPath:contents:attributes:", v9->_filePath, 0, 0);

      v9->_shouldCleanFile = 1;
    }
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForUpdatingAtPath:", v9->_filePath);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 && (v9->_mappedLength = a4, !ftruncate(objc_msgSend(v13, "fileDescriptor"), v9->_mappedLength)))
    {
      v9->_mmappedData = mmap(0, v9->_mappedLength, 3, 1, objc_msgSend(v14, "fileDescriptor"), 0);
      objc_msgSend(v14, "closeFile");
    }
    else
    {
      v9->_mappedLength = 0;
      filePath = v9->_filePath;
      v9->_filePath = 0;

    }
    if ((unint64_t)v9->_mmappedData + 1 <= 1)
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "data");
      v16 = objc_claimAutoreleasedReturnValue();
      fallbackInMemoryData = v9->_fallbackInMemoryData;
      v9->_fallbackInMemoryData = (NSMutableData *)v16;

      v9->_mmappedData = 0;
    }

  }
  return v9;
}

- (VSMappedData)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  VSMappedData *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VSMappedData%p"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathWithComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[VSMappedData initWithFilePath:initialSize:](self, "initWithFilePath:initialSize:", v7, 512000);
  return v8;
}

- (void)dealloc
{
  void *mmappedData;
  void *v4;
  objc_super v5;

  mmappedData = self->_mmappedData;
  if (mmappedData)
    munmap(mmappedData, self->_mappedLength);
  if (self->_shouldCleanFile)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtPath:error:", self->_filePath, 0);

  }
  v5.receiver = self;
  v5.super_class = (Class)VSMappedData;
  -[VSMappedData dealloc](&v5, sel_dealloc);
}

- (void)_appendToFallbackMemory:(id)a3
{
  -[NSMutableData appendData:](self->_fallbackInMemoryData, "appendData:", a3);
}

- (void)_convertToFallbackMemory
{
  void **p_mmappedData;
  NSMutableData *v4;
  NSMutableData *fallbackInMemoryData;

  p_mmappedData = &self->_mmappedData;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", self->_mmappedData, self->_totalLength);
  v4 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
  fallbackInMemoryData = self->_fallbackInMemoryData;
  self->_fallbackInMemoryData = v4;

  if (*p_mmappedData)
    munmap(*p_mmappedData, self->_mappedLength);
  *p_mmappedData = 0;
  self->_mappedLength = 0;
}

- (void)_appendToMappedMemory:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t totalLength;
  unint64_t mappedLength;
  void *v8;
  char *v9;
  char *v10;
  id v11;
  unint64_t v12;
  NSObject *v13;
  char *v14;
  void *mmappedData;
  int v16;
  int *v17;
  char *v18;
  const char *v19;
  int v20;
  int *v21;
  char *v22;
  int v23;
  int v24;
  __int16 v25;
  char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  totalLength = self->_totalLength;
  mappedLength = self->_mappedLength;
  if (totalLength + v5 >= mappedLength)
  {
    v12 = (unint64_t)((double)(objc_msgSend(v4, "length") + mappedLength) * 1.5);
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForUpdatingAtPath:", self->_filePath);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (ftruncate(objc_msgSend(v8, "fileDescriptor"), v12))
    {
      VSGetLogDefault();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_6;
      v20 = *__error();
      v21 = __error();
      v22 = strerror(*v21);
      v23 = 67109378;
      v24 = v20;
      v25 = 2080;
      v26 = v22;
      v19 = "Unable to resize mapped file, errno: %d, error: %s";
    }
    else
    {
      v14 = (char *)mmap(0, v12, 3, 1, objc_msgSend(v8, "fileDescriptor"), 0);
      if (v14 != (char *)-1)
      {
        v9 = v14;
        mmappedData = self->_mmappedData;
        if (mmappedData)
          munmap(mmappedData, self->_mappedLength);
        self->_mmappedData = v9;
        self->_mappedLength = v12;
        totalLength = self->_totalLength;
        goto LABEL_3;
      }
      VSGetLogDefault();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
LABEL_6:

        -[VSMappedData _convertToFallbackMemory](self, "_convertToFallbackMemory");
        -[VSMappedData _appendToFallbackMemory:](self, "_appendToFallbackMemory:", v4);
        goto LABEL_7;
      }
      v16 = *__error();
      v17 = __error();
      v18 = strerror(*v17);
      v23 = 67109378;
      v24 = v16;
      v25 = 2080;
      v26 = v18;
      v19 = "Unable to mmap file, errno: %d, error: %s";
    }
    _os_log_error_impl(&dword_1DE15E000, v13, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v23, 0x12u);
    goto LABEL_6;
  }
  v8 = 0;
  v9 = (char *)self->_mmappedData;
LABEL_3:
  v10 = &v9[totalLength];
  v11 = objc_retainAutorelease(v4);
  memcpy(v10, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
LABEL_7:

}

- (_NSRange)appendData:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t totalLength;
  unint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v4 = a3;
  if (v4)
  {
    if (self->_mmappedData)
      -[VSMappedData _appendToMappedMemory:](self, "_appendToMappedMemory:", v4);
    else
      -[VSMappedData _appendToFallbackMemory:](self, "_appendToFallbackMemory:", v4);
    v7 = self->_totalLength + objc_msgSend(v4, "length");
    self->_totalLength = v7;
    totalLength = v7 - objc_msgSend(v4, "length");
    v5 = objc_msgSend(v4, "length");
  }
  else
  {
    v5 = 0;
    totalLength = self->_totalLength;
  }

  v8 = totalLength;
  v9 = v5;
  result.length = v9;
  result.location = v8;
  return result;
}

- (void)bytesAtOffset:(unint64_t)a3
{
  NSMutableData *fallbackInMemoryData;
  char *mmappedData;

  fallbackInMemoryData = self->_fallbackInMemoryData;
  if (fallbackInMemoryData)
    return -[NSMutableData mutableBytes](fallbackInMemoryData, "mutableBytes") + a3;
  mmappedData = (char *)self->_mmappedData;
  if (mmappedData)
    return &mmappedData[a3];
  else
    return 0;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_filePath, a3);
}

- (unint64_t)totalLength
{
  return self->_totalLength;
}

- (void)setTotalLength:(unint64_t)a3
{
  self->_totalLength = a3;
}

- (void)mmappedData
{
  return self->_mmappedData;
}

- (void)setMmappedData:(void *)a3
{
  self->_mmappedData = a3;
}

- (unint64_t)mappedLength
{
  return self->_mappedLength;
}

- (void)setMappedLength:(unint64_t)a3
{
  self->_mappedLength = a3;
}

- (NSMutableData)fallbackInMemoryData
{
  return self->_fallbackInMemoryData;
}

- (void)setFallbackInMemoryData:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackInMemoryData, a3);
}

- (BOOL)shouldCleanFile
{
  return self->_shouldCleanFile;
}

- (void)setShouldCleanFile:(BOOL)a3
{
  self->_shouldCleanFile = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackInMemoryData, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
