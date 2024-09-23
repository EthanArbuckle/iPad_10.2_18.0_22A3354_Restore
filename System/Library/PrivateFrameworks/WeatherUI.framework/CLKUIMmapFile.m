@implementation CLKUIMmapFile

+ (CLKUIMmapFile)mmapFileWithPath:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  off_t st_size;
  void *v7;
  CLKUIMmapFile *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  stat v29;

  v3 = objc_retainAutorelease(a3);
  v4 = open((const char *)objc_msgSend(v3, "UTF8String"), 0, 0);
  if ((v4 & 0x80000000) != 0)
  {
    CLKLoggingObjectForDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[CLKUIMmapFile mmapFileWithPath:].cold.1((uint64_t)v3, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_11;
  }
  v5 = v4;
  memset(&v29, 0, sizeof(v29));
  fstat(v4, &v29);
  st_size = v29.st_size;
  if (!v29.st_size)
  {
    CLKLoggingObjectForDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[CLKUIMmapFile mmapFileWithPath:].cold.2((uint64_t)v3, v9, v16, v17, v18, v19, v20, v21);
    goto LABEL_11;
  }
  v7 = mmap(0, v29.st_size, 1, 1, v5, 0);
  if (v7 == (void *)-1)
  {
    CLKLoggingObjectForDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[CLKUIMmapFile mmapFileWithPath:].cold.3((uint64_t)v3, v9, v22, v23, v24, v25, v26, v27);
LABEL_11:

    v8 = 0;
    goto LABEL_12;
  }
  v8 = -[CLKUIMmapFile initWithPath:descriptor:length:bytes:]([CLKUIMmapFile alloc], "initWithPath:descriptor:length:bytes:", v3, v5, st_size, v7);
LABEL_12:

  return v8;
}

- (CLKUIMmapFile)initWithPath:(id)a3 descriptor:(int)a4 length:(unint64_t)a5 bytes:(const void *)a6
{
  id v11;
  CLKUIMmapFile *v12;
  CLKUIMmapFile *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLKUIMmapFile;
  v12 = -[CLKUIMmapFile init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_path, a3);
    v13->_descriptor = a4;
    v13->_length = a5;
    v13->_bytes = a6;
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  munmap((void *)self->_bytes, self->_length);
  close(self->_descriptor);
  v3.receiver = self;
  v3.super_class = (Class)CLKUIMmapFile;
  -[CLKUIMmapFile dealloc](&v3, sel_dealloc);
}

- (NSString)path
{
  return self->_path;
}

- (int)descriptor
{
  return self->_descriptor;
}

- (unint64_t)length
{
  return self->_length;
}

- (const)bytes
{
  return self->_bytes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

+ (void)mmapFileWithPath:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_13(&dword_1AFABF000, a2, a3, "Failed to open image %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)mmapFileWithPath:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_13(&dword_1AFABF000, a2, a3, "Invalid file length %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)mmapFileWithPath:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_13(&dword_1AFABF000, a2, a3, "Failed to mmap image %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
