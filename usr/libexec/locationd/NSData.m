@implementation NSData

- (id)cl_hexadecimalString
{
  id v3;
  uint64_t v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  unsigned int v7;

  v3 = +[NSMutableString string](NSMutableString, "string");
  v4 = -[NSData length](self, "length");
  v5 = -[NSData bytes](self, "bytes");
  if (v4 >= 1)
  {
    v6 = v5;
    do
    {
      v7 = *v6++;
      objc_msgSend(v3, "appendFormat:", CFSTR("%02X"), v7);
      --v4;
    }
    while (v4);
  }
  return v3;
}

- (id)_cl_initWithFileDescriptor:(int)a3
{
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  const char *v8;
  void *v10;
  NSObject *v11;
  stat v12;
  uint64_t buf;
  __int16 v14;
  const char *v15;

  memset(&v12, 0, sizeof(v12));
  if (fstat(a3, &v12))
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102194C58);
    v5 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_ERROR))
    {
      buf = 68289026;
      v14 = 2082;
      v15 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"fstat failed\"}", (uint8_t *)&buf, 0x12u);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_102194C58);
    }
    v6 = qword_1022A0208;
    if (!os_signpost_enabled((os_log_t)qword_1022A0208))
      goto LABEL_10;
    buf = 68289026;
    v14 = 2082;
    v15 = "";
    v7 = "fstat failed";
    v8 = "{\"msg%{public}.0s\":\"fstat failed\"}";
LABEL_9:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v7, v8, (uint8_t *)&buf, 0x12u);
LABEL_10:

    return 0;
  }
  v10 = mmap(0, v12.st_size, 1, 2, a3, 0);
  if (v10 == (void *)-1)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_102194C58);
    v11 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_ERROR))
    {
      buf = 68289026;
      v14 = 2082;
      v15 = "";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"mmap failed\"}", (uint8_t *)&buf, 0x12u);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_102194C58);
    }
    v6 = qword_1022A0208;
    if (!os_signpost_enabled((os_log_t)qword_1022A0208))
      goto LABEL_10;
    buf = 68289026;
    v14 = 2082;
    v15 = "";
    v7 = "mmap failed";
    v8 = "{\"msg%{public}.0s\":\"mmap failed\"}";
    goto LABEL_9;
  }
  return -[NSData initWithBytesNoCopy:length:deallocator:](self, "initWithBytesNoCopy:length:deallocator:", v10, v12.st_size, NSDataDeallocatorUnmap);
}

@end
