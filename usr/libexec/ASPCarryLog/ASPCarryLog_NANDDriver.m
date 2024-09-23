@implementation ASPCarryLog_NANDDriver

- (int)iolog_enable
{
  int result;

  if (sub_100028BA0(15, 0, 0))
    return 1;
  result = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100041B30();
    return 0;
  }
  return result;
}

- (int)iolog_disable
{
  int result;

  if (sub_100028BA0(0, 0, 0))
    return 1;
  result = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100041B5C();
    return 0;
  }
  return result;
}

- (unint64_t)iolog_export:(id)a3 max_export_size:(unint64_t)a4
{
  id v5;
  const char *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  int v11;
  unint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v21;
  size_t v22;
  void *v23;

  v22 = 0;
  v23 = 0;
  v5 = objc_retainAutorelease(a3);
  v6 = (const char *)objc_msgSend(v5, "UTF8String");
  v21 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (!objc_msgSend(v7, "fileExistsAtPath:", v5))
  {
    v11 = open(v6, 522, 438);
    if ((v11 & 0x80000000) == 0)
      goto LABEL_6;
LABEL_12:
    v13 = oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_100041B88((uint64_t)v6, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_17;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attributesOfItemAtPath:error:", v5, 0));
  v9 = objc_msgSend(v8, "fileSize");

  v10 = open(v6, 522, 438);
  if (v10 < 0)
    goto LABEL_12;
  v11 = v10;
  if (v9)
    goto LABEL_8;
LABEL_6:
  if (!sub_1000288FC(4u, &v23, &v22))
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_100041BEC();
    close(v11);
LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  write(v11, v23, v22);
  free(v23);
LABEL_8:
  if (!sub_100028A20(v11, a4, &v21))
  {
    v21 = 0;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_100041C18();
  }
  close(v11);
  v12 = v21;
LABEL_18:

  return v12;
}

- (id)nandCounters_get
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return CopyWhitelistedNANDFTLInfo(1, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

- (int)nandCounters_save:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v4, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_NANDDriver nandCounters_get](self, "nandCounters_get"));
  v8 = v7;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_100041C44();
    goto LABEL_8;
  }
  if ((objc_msgSend(v7, "writeToURL:error:", v6, 0) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_100041C70();
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v9 = 1;
LABEL_9:

  objc_autoreleasePoolPop(v5);
  return v9;
}

- (id)nandStats_get_hoursAgo:(unsigned int)a3
{
  id v3;
  uint64_t v5;
  void *v6;

  v5 = 0;
  v6 = 0;
  if (sub_100029130(0, a3, 0, &v6, &v5))
  {
    v3 = objc_alloc_init((Class)NSMutableDictionary);
    NSDictFromStatsBuffer((uint64_t *)v6, v5, v3);
    free(v6);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_100041C9C();
    v3 = 0;
  }
  return v3;
}

- (int)nandStats_save:(id)a3
{
  char *v3;
  int result;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = (char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (print_all_stats(v3) == 1)
  {
    result = print_band_stats(v3);
    if (result != 1)
    {
      v5 = oslog;
      result = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_100041CC8((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
        return 0;
      }
    }
  }
  else
  {
    v12 = oslog;
    result = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_100041D2C((uint64_t)v3, v12, v13, v14, v15, v16, v17, v18);
      return 0;
    }
  }
  return result;
}

- (void)getSpdHdrWithSize:(unint64_t *)a3 gcIdle:(BOOL *)a4 totalLbaCnt:(unint64_t *)a5 estSpdSize:(unsigned int *)a6
{
  int v7;
  void *result;
  void *v9;

  v9 = 0;
  v7 = sub_100028C88(&v9, a3, a4, a5, a6);
  result = v9;
  if (!v7)
  {
    if (v9)
    {
      free(v9);
      result = 0;
      *a3 = 0;
    }
  }
  return result;
}

- (void)addSpdEstSizeExceedLimitToFile:(__sFILE *)a3 limit:(unsigned int)a4
{
  uint64_t v5;
  unsigned int __ptr;

  __ptr = a4;
  v5 = 0x4FBFF00000001;
  fwrite(&v5, 8uLL, 1uLL, a3);
  fwrite(&__ptr, 4uLL, 1uLL, a3);
}

- (int)writeFullSpdToFileWithHdrBuf:(void *)a3 hdrSize:(unint64_t)a4 totalLbaCnt:(unint64_t)a5 filePtr:(__sFILE *)a6 spdSizeLimit:(unint64_t)a7
{
  _BOOL4 v10;
  void *v11;
  size_t __size;
  void *__ptr;

  __size = 0;
  __ptr = 0;
  if (!a6 || !fwrite(a3, a4, 1uLL, a6) || !sub_100028F58(a6, a5, a7))
    return 0;
  sub_100028F40(&__ptr, &__size);
  v10 = 0;
  v11 = __ptr;
  if (__ptr && __size)
  {
    v10 = fwrite(__ptr, __size, 1uLL, a6) != 0;
    v11 = __ptr;
  }
  if (v11)
    free(v11);
  return v10;
}

@end
