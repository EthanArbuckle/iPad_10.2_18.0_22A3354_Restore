@implementation PalmspringCrashlog

+ (OS_os_log)log
{
  if (qword_10006D378 != -1)
    dispatch_once(&qword_10006D378, &stru_100068D58);
  return (OS_os_log *)(id)qword_10006D370;
}

- (PalmspringCrashlog)initWithInfoEntry:(id)a3 data:(id)a4
{
  id v7;
  id v8;
  PalmspringCrashlog *v9;
  PalmspringCrashlog *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  PalmspringCrashlog *v15;
  id v16;
  unsigned __int16 *v17;
  id v18;
  NSObject *v19;
  char *v20;
  id v21;
  int v22;
  NSData *v23;
  NSData *data;
  PalmspringCrashlogInfoEntry *v25;
  PalmspringCrashlogInfoEntry *info;
  id v27;
  int v29;
  id v30;
  NSObject *v31;
  id v32;
  unsigned int v33;
  int v34;
  void *v35;
  int v36;
  objc_super v37;
  uint8_t buf[4];
  _BYTE v39[14];
  __int16 v40;
  char *v41;
  __int16 v42;
  int v43;

  v7 = a3;
  v8 = a4;
  v37.receiver = self;
  v37.super_class = (Class)PalmspringCrashlog;
  v9 = -[PalmspringCrashlog init](&v37, "init");
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend((id)objc_opt_class(v9), "log");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_1000347AC(a2, v12);

    if ((unint64_t)objc_msgSend(v8, "length") > 7)
    {
      v16 = objc_retainAutorelease(v8);
      v17 = (unsigned __int16 *)objc_msgSend(v16, "bytes");
      v18 = objc_msgSend((id)objc_opt_class(v10), "log");
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        sub_1000346EC(v7, (unsigned __int8 *)v17, v19);

      v20 = (char *)objc_msgSend(v16, "length") - 8;
      v21 = objc_msgSend(v16, "length");
      if (v21 == (id)objc_msgSend(v7, "headerAndRawBlobSize")
        && v20 == (char *)*(unsigned int *)(v17 + 1))
      {
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "subdataWithRange:", 8, v20)));
        v22 = crc16_compute((char *)-[NSObject bytes](v14, "bytes"), (int)-[NSObject length](v14, "length"));
        if (v22 == v17[3])
        {
          v23 = -[NSObject copy](v14, "copy");
          data = v10->_data;
          v10->_data = v23;

          v25 = (PalmspringCrashlogInfoEntry *)objc_msgSend(v7, "copy");
          info = v10->_info;
          v10->_info = v25;

          v10->_blobVersion = *(_BYTE *)v17;
          v15 = v10;
LABEL_17:

          goto LABEL_18;
        }
        v29 = v22;
        v30 = objc_msgSend((id)objc_opt_class(v10), "log");
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
          v36 = v17[3];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v39 = v29;
          *(_WORD *)&v39[4] = 2112;
          *(_QWORD *)&v39[6] = v35;
          v40 = 1024;
          LODWORD(v41) = v36;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "CRC (0x%04x) of crashlog %@ did not match CRC in header (0x%04x)", buf, 0x18u);

        }
      }
      else
      {
        v27 = objc_msgSend((id)objc_opt_class(v10), "log");
        v14 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v32 = objc_msgSend(v16, "length");
          v33 = objc_msgSend(v7, "headerAndRawBlobSize");
          v34 = *(_DWORD *)(v17 + 1);
          *(_DWORD *)buf = 134218752;
          *(_QWORD *)v39 = v32;
          *(_WORD *)&v39[8] = 1024;
          *(_DWORD *)&v39[10] = v33;
          v40 = 2048;
          v41 = v20;
          v42 = 1024;
          v43 = v34;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Size of crashlog did not match expected size: header+blob (expected: %ld / actual: %d), blob (expected: %ld, actual %d)", buf, 0x22u);
        }
      }
    }
    else
    {
      v13 = objc_msgSend((id)objc_opt_class(v10), "log");
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10003463C(v7, v14);
    }
    v15 = 0;
    goto LABEL_17;
  }
  v15 = 0;
LABEL_18:

  return v15;
}

- (BOOL)writeToDirectory:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PalmspringCrashlog data](self, "data"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PalmspringCrashlog info](self, "info"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  LOBYTE(a5) = +[PalmspringCrashlog writeToDirectory:crashlogData:name:options:error:](PalmspringCrashlog, "writeToDirectory:crashlogData:name:options:error:", v8, v9, v11, a4, a5);

  return (char)a5;
}

+ (BOOL)writeToDirectory:(id)a3 crashlogData:(id)a4 name:(id)a5 options:(unint64_t)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  unsigned __int8 v19;
  NSObject *v20;
  id v21;
  id *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  id v31;
  NSObject *v32;
  const __CFString *v33;
  id v34;
  id v35;
  NSString *v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  id v50;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = objc_msgSend((id)objc_opt_class(a1), "log");
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v37 = NSStringFromSelector(a2);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    *(_DWORD *)buf = 138412802;
    v44 = v38;
    v45 = 2112;
    v46 = v13;
    v47 = 2048;
    v48 = a6;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%@, directory %@, options %lu", buf, 0x20u);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v19 = objc_msgSend(v18, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, a7);

  if ((v19 & 1) != 0)
  {
    v20 = objc_alloc_init((Class)NSDateFormatter);
    -[NSObject setDateFormat:](v20, "setDateFormat:", CFSTR("yyyy-MM-dd-HH:mm:ss"));
    v42 = v15;
    v21 = a1;
    v22 = a7;
    v23 = v13;
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("-")));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v40 = a6;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject stringFromDate:](v20, "stringFromDate:", v25));
    v27 = v14;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[PalmspringCrashlog crashlogPathExtension](PalmspringCrashlog, "crashlogPathExtension"));
    v39 = v24;
    v41 = (void *)v24;
    v13 = v23;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/PalmspringCrashlog_%@_%@.%@"), v23, v26, v39, v28));

    v14 = v27;
    v30 = objc_msgSend(v27, "writeToFile:options:error:", v29, v40, v22);
    v31 = objc_msgSend((id)objc_opt_class(v21), "log");
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = CFSTR("failed");
      if (v30)
        v33 = CFSTR("succeeded");
      if (v22)
        v34 = *v22;
      else
        v34 = 0;
      *(_DWORD *)buf = 138413058;
      v44 = v21;
      v45 = 2112;
      v46 = v29;
      v47 = 2112;
      v48 = (unint64_t)v33;
      v49 = 2112;
      v50 = v34;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Writing crashlog %@ to %@ %@, error %@", buf, 0x2Au);
    }

    v15 = v42;
  }
  else
  {
    v35 = objc_msgSend((id)objc_opt_class(a1), "log");
    v20 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10003482C();
    LOBYTE(v30) = 0;
  }

  return v30;
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PalmspringCrashlog info](self, "info"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@, Palmspring Crashlog Header: [blob version: %d])"), v3, -[PalmspringCrashlog blobVersion](self, "blobVersion")));

  return v4;
}

+ (NSString)crashlogPathExtension
{
  return (NSString *)CFSTR("crash");
}

- (PalmspringCrashlogInfoEntry)info
{
  return self->_info;
}

- (unsigned)blobVersion
{
  return self->_blobVersion;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end
