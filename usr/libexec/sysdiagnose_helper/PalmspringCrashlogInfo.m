@implementation PalmspringCrashlogInfo

+ (unsigned)maxInfoReportSize
{
  return 1029;
}

- (PalmspringCrashlogInfo)initWithData:(id)a3
{
  id v5;
  PalmspringCrashlogInfo *v6;
  PalmspringCrashlogInfo *v7;
  objc_class *v8;
  NSString *v9;
  id v10;
  os_log_t v11;
  OS_os_log *log;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _BYTE *v16;
  NSObject *v17;
  int v18;
  int v19;
  id v20;
  NSMutableArray *v21;
  NSMutableArray *entries;
  unint64_t v23;
  char *v24;
  void *v25;
  PalmspringCrashlogInfoEntry *v26;
  PalmspringCrashlogInfo *v27;
  NSObject *v28;
  objc_super v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  int v34;

  v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PalmspringCrashlogInfo;
  v6 = -[PalmspringCrashlogInfo init](&v30, "init");
  v7 = v6;
  if (!v6)
  {
LABEL_16:
    v27 = 0;
    goto LABEL_17;
  }
  v8 = (objc_class *)objc_opt_class(v6);
  v9 = NSStringFromClass(v8);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v9));
  v11 = os_log_create("com.apple.hid.AppleTopCase", (const char *)objc_msgSend(v10, "UTF8String"));
  log = v7->_log;
  v7->_log = (OS_os_log *)v11;

  v13 = v7->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    sub_1000345B0(v13, a2);
  if ((unint64_t)objc_msgSend(v5, "length") <= 4)
  {
    v14 = v7->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100034484(v14, v5);
    goto LABEL_16;
  }
  v15 = objc_retainAutorelease(v5);
  v16 = objc_msgSend(v15, "bytes");
  v17 = v7->_log;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v16[1];
    v19 = v16[2];
    *(_DWORD *)buf = 67109376;
    v32 = v18;
    v33 = 1024;
    v34 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Crashlog info report header extracted: version %d, # of crashlogs %d", buf, 0xEu);
  }
  v20 = (id)((32 * v16[2]) | 5);
  if (objc_msgSend(v15, "length") != v20)
  {
    v28 = v7->_log;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_100034514(v28, v15, (int)v20);
    goto LABEL_16;
  }
  v7->_version = v16[1];
  v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  entries = v7->_entries;
  v7->_entries = v21;

  if (v16[2])
  {
    v23 = 0;
    v24 = v16 + 11;
    do
    {
      __strlcpy_chk(buf, v24, 27, 27);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", buf, 4));
      v26 = -[PalmspringCrashlogInfoEntry initWithUniqueID:type:headerAndRawBlobSize:name:]([PalmspringCrashlogInfoEntry alloc], "initWithUniqueID:type:headerAndRawBlobSize:name:", *(v24 - 6), *(v24 - 5), *((unsigned int *)v24 - 1), v25);
      -[NSMutableArray addObject:](v7->_entries, "addObject:", v26);

      ++v23;
      v24 += 32;
    }
    while (v23 < v16[2]);
  }
  v27 = v7;
LABEL_17:

  return v27;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return (unint64_t)-[NSMutableArray countByEnumeratingWithState:objects:count:](self->_entries, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (unsigned)version
{
  return self->_version;
}

- (NSMutableArray)entries
{
  return self->_entries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
