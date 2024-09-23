@implementation NSData

+ (id)dmd_dataWithMappedContentsOfFileHandle:(id)a3 error:(id *)a4
{
  int v5;
  size_t st_size;
  void *v7;
  dispatch_data_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  stat v27;

  v5 = objc_msgSend(a3, "fileDescriptor");
  memset(&v27, 0, sizeof(v27));
  if (fstat(v5, &v27) == -1)
  {
    v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      sub_100079EDC(v9, v10, v11, v12, v13, v14, v15, v16);
      if (!a4)
        goto LABEL_9;
    }
    else if (!a4)
    {
LABEL_9:
      v8 = 0;
      return v8;
    }
LABEL_6:
    v17 = DMFErrorWithCodeAndUserInfo(2004, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v17);
    return 0;
  }
  st_size = v27.st_size;
  v7 = mmap(0, v27.st_size, 1, 2, v5, 0);
  if (v7 == (void *)-1)
  {
    v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      sub_100079F14(v19, v20, v21, v22, v23, v24, v25, v26);
      if (!a4)
        goto LABEL_9;
    }
    else if (!a4)
    {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  v8 = dispatch_data_create(v7, st_size, 0, _dispatch_data_destructor_munmap);
  return v8;
}

- (NSData)dmd_sha1Hash
{
  NSData *v3;
  CC_SHA1_CTX v5;
  unsigned __int8 md[20];

  memset(&v5, 0, sizeof(v5));
  CC_SHA1_Init(&v5);
  v3 = objc_retainAutorelease(self);
  CC_SHA1_Update(&v5, -[NSData bytes](v3, "bytes"), (CC_LONG)-[NSData length](v3, "length"));
  CC_SHA1_Final(md, &v5);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", md, 20));
}

@end
