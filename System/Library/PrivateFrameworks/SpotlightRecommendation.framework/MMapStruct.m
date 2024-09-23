@implementation MMapStruct

- (MMapStruct)initWithBuffer:(void *)a3 size:(unint64_t)a4
{
  MMapStruct *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MMapStruct;
  result = -[MMapStruct init](&v7, sel_init);
  if (result)
  {
    result->_buffer = a3;
    result->_size = a4;
  }
  return result;
}

+ (id)mMapStructWithFilepath:(id)a3
{
  id v3;
  int v4;
  int v5;
  off_t st_size;
  void *v7;
  void *v8;
  MMapStruct *v9;
  NSObject *v10;
  NSObject *v11;
  stat v13;

  v3 = objc_retainAutorelease(a3);
  v4 = open((const char *)objc_msgSend(v3, "UTF8String"), 0);
  if (v4 < 0)
  {
    logForCSLogCategoryRecs();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[MMapStruct mMapStructWithFilepath:].cold.1();

    goto LABEL_13;
  }
  v5 = v4;
  memset(&v13, 0, sizeof(v13));
  if (fstat(v4, &v13) < 0)
  {
    logForCSLogCategoryRecs();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[MMapStruct mMapStructWithFilepath:].cold.2();
    goto LABEL_12;
  }
  st_size = v13.st_size;
  v7 = mmap(0, v13.st_size, 1, 1, v5, 0);
  if (v7 == (void *)-1)
  {
    logForCSLogCategoryRecs();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[MMapStruct mMapStructWithFilepath:].cold.3();
LABEL_12:

    close(v5);
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  v8 = v7;
  close(v5);
  v9 = -[MMapStruct initWithBuffer:size:]([MMapStruct alloc], "initWithBuffer:size:", v8, st_size);
LABEL_14:

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  munmap(self->_buffer, self->_size);
  v3.receiver = self;
  v3.super_class = (Class)MMapStruct;
  -[MMapStruct dealloc](&v3, sel_dealloc);
}

- (void)buffer
{
  return self->_buffer;
}

- (unint64_t)size
{
  return self->_size;
}

+ (void)mMapStructWithFilepath:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4();
  v0 = OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_247974000, v1, v2, "open file failed. MMap process stopped. File path=%@ errno:%d(%s)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

+ (void)mMapStructWithFilepath:.cold.2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4();
  v0 = OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_247974000, v1, v2, "fstat failed. MMap process stopped. File path=%@ errno:%d(%s)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

+ (void)mMapStructWithFilepath:.cold.3()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4();
  v0 = OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_247974000, v1, v2, "mmap failed. File path=%@ errno:%d(%s)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

@end
