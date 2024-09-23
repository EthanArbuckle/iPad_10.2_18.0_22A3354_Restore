@implementation CLHRequestArchive

- (void)writeSecondaryObject:(id)a3 toField:(unsigned int)a4
{
  -[CLHRequestArchive writeSecondaryData:toField:](self, "writeSecondaryData:toField:", objc_msgSend(a3, "data"), *(_QWORD *)&a4);
}

- (void)writeSecondaryData:(id)a3 toField:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  NSObject *v8;
  const char *v9;
  id v10;
  NSObject *v11;
  const char *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;

  v4 = *(_QWORD *)&a4;
  v7 = objc_alloc_init((Class)PBDataWriter);
  objc_msgSend(v7, "writeData:forTag:", a3, v4);
  v14 = 0;
  -[NSFileHandle writeData:error:](-[CLHRequestArchive secondaryFileHandle](self, "secondaryFileHandle"), "writeData:error:", objc_msgSend(v7, "immutableData"), &v14);

  if (v14)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    v8 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_ERROR))
    {
      v9 = -[NSString UTF8String](self->_secondaryPath, "UTF8String");
      v10 = objc_msgSend(objc_msgSend(v14, "description"), "UTF8String");
      *(_DWORD *)buf = 68289538;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2082;
      v20 = v9;
      v21 = 2082;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLHRequestArchive secondary-data write failed\", \"secondaryFilePath\":%{public, location:escape_only}s, \"Error\":%{public, location:escape_only}s}", buf, 0x26u);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    }
    v11 = qword_1022A0208;
    if (os_signpost_enabled((os_log_t)qword_1022A0208))
    {
      v12 = -[NSString UTF8String](self->_secondaryPath, "UTF8String");
      v13 = objc_msgSend(objc_msgSend(v14, "description"), "UTF8String");
      *(_DWORD *)buf = 68289538;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2082;
      v20 = v12;
      v21 = 2082;
      v22 = v13;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLHRequestArchive secondary-data write failed", "{\"msg%{public}.0s\":\"CLHRequestArchive secondary-data write failed\", \"secondaryFilePath\":%{public, location:escape_only}s, \"Error\":%{public, location:escape_only}s}", buf, 0x26u);
    }
  }
  else
  {
    -[CLHRequestArchive incrementCountBy:](self, "incrementCountBy:", 1);
  }
}

- (NSFileHandle)secondaryFileHandle
{
  double Current;
  double lastRotationTime;
  double rotationInterval;
  _BOOL4 v6;
  BOOL v7;

  Current = CFAbsoluteTimeGetCurrent();
  rotationInterval = self->_rotationInterval;
  lastRotationTime = self->_lastRotationTime;
  v6 = rotationInterval >= 0.0;
  if (lastRotationTime <= 0.0)
    v6 = 1;
  if (Current <= lastRotationTime + rotationInterval)
    v6 = 0;
  if (self->_secondaryPath)
    v7 = !v6;
  else
    v7 = 0;
  if (!v7)
    -[CLHRequestArchive rotateSecondaryFile](self, "rotateSecondaryFile");
  return self->_secondaryFileHandle;
}

- (void)incrementCountBy:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  NSObject *v9;
  NSString *secondaryPath;
  NSObject *v11;
  NSString *v12;
  NSObject *v13;
  NSString *v14;
  uint64_t v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  uint64_t v25;

  sub_10019EB74(self->_secondaryPath);
  v6 = v5;
  -[CLHRequestArchive setCount:](self, "setCount:", self->_count + a3);
  *(double *)&v7 = CFAbsoluteTimeGetCurrent();
  v15 = 0;
  v8 = -[NSString stringByAppendingPathComponent:](self->_directory, "stringByAppendingPathComponent:", sub_10019EBF8(v7, v6 + a3));
  -[NSFileManager moveItemAtPath:toPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "moveItemAtPath:toPath:error:", self->_secondaryPath, v8, &v15);
  if (v15)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    v9 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_ERROR))
    {
      secondaryPath = self->_secondaryPath;
      *(_DWORD *)buf = 68289795;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2113;
      v21 = secondaryPath;
      v22 = 2113;
      v23 = v8;
      v24 = 2113;
      v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"failed to update secondary filename\", \"from\":%{private, location:escape_only}@, \"to\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x30u);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    }
    v11 = qword_1022A0208;
    if (os_signpost_enabled((os_log_t)qword_1022A0208))
    {
      v12 = self->_secondaryPath;
      *(_DWORD *)buf = 68289795;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2113;
      v21 = v12;
      v22 = 2113;
      v23 = v8;
      v24 = 2113;
      v25 = v15;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "failed to update secondary filename", "{\"msg%{public}.0s\":\"failed to update secondary filename\", \"from\":%{private, location:escape_only}@, \"to\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x30u);
    }
  }
  else
  {
    -[CLHRequestArchive setSecondaryPath:](self, "setSecondaryPath:", v8);
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    v13 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
    {
      v14 = self->_secondaryPath;
      *(_DWORD *)buf = 68289283;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2113;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"updated secondary filename\", \"to\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
  }
}

- (void)setSecondaryPath:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (void)setCount:(unint64_t)a3
{
  unint64_t totalCount;
  unint64_t count;
  unint64_t v6;
  NSObject *v7;
  NSString *directory;
  unint64_t v9;
  unint64_t v10;
  NSString *v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  int v15;
  NSString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint8_t buf[4];
  NSString *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;

  count = self->_count;
  totalCount = self->_totalCount;
  self->_count = a3;
  if (-[CLHRequestArchive isActiveSubArchive](self, "isActiveSubArchive"))
  {
    v6 = self->_count - count + self->_totalCount;
    if ((v6 & 0x80000000) == 0)
      self->_totalCount = v6;
  }
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_1021A93A0);
  v7 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
  {
    directory = self->_directory;
    v9 = self->_count;
    v10 = self->_totalCount;
    *(_DWORD *)buf = 138413314;
    v26 = directory;
    v27 = 1024;
    v28 = count;
    v29 = 1024;
    v30 = v9;
    v31 = 1024;
    v32 = totalCount;
    v33 = 1024;
    v34 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "#update-count: archive:%@, oldCount:%d, newCount:%d, oldTotalCount:%d, newTotalCount:%d", buf, 0x24u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    v11 = self->_directory;
    v12 = self->_count;
    v13 = self->_totalCount;
    v15 = 138413314;
    v16 = v11;
    v17 = 1024;
    v18 = count;
    v19 = 1024;
    v20 = v12;
    v21 = 1024;
    v22 = totalCount;
    v23 = 1024;
    v24 = v13;
    v14 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0208, 2, "#update-count: archive:%@, oldCount:%d, newCount:%d, oldTotalCount:%d, newTotalCount:%d", &v15, 36);
    sub_100512490("Generic", 1, 0, 2, "-[CLHRequestArchive setCount:]", "%s\n", v14);
    if (v14 != (char *)buf)
      free(v14);
  }
}

- (BOOL)isActiveSubArchive
{
  return -[NSString hasPrefix:](-[NSString lastPathComponent](-[CLHRequestArchive directory](self, "directory"), "lastPathComponent"), "hasPrefix:", CFSTR("sub_"));
}

- (NSString)directory
{
  return self->_directory;
}

- (CLHRequestArchive)init
{
  -[CLHRequestArchive doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CLHRequestArchive)initWithDirectory:(id)a3
{
  return -[CLHRequestArchive initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:](self, "initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:", a3, 0, 0xFFFFFFFFLL);
}

- (CLHRequestArchive)initWithDirectory:(id)a3 requestCode:(int)a4
{
  return -[CLHRequestArchive initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:](self, "initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:", a3, *(_QWORD *)&a4, 0xFFFFFFFFLL);
}

- (CLHRequestArchive)initWithDirectory:(id)a3 itemCountThresholdForAutoCleanUp:(int)a4
{
  return -[CLHRequestArchive initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:](self, "initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:", a3, 0, *(_QWORD *)&a4);
}

- (CLHRequestArchive)initWithDirectory:(id)a3 requestCode:(int)a4 itemCountThresholdForAutoCleanUp:(int)a5
{
  CLHRequestArchive *v8;
  CLHRequestArchive *v9;
  NSString *v10;
  _UNKNOWN **v11;
  NSURL *v12;
  NSURL *v13;
  NSFileManager *v14;
  NSDirectoryEnumerator *v15;
  id v16;
  id v17;
  int v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *j;
  uint64_t v37;
  uint64_t v39;
  const char *v40;
  NSObject *v41;
  const char *v42;
  _BOOL4 v43;
  NSObject *v44;
  const char *v45;
  NSObject *v46;
  const char *v47;
  NSObject *v48;
  const char *v49;
  NSURL *v50;
  id v51;
  NSString *v52;
  int v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t v64[8];
  __int16 v65;
  const char *v66;
  __int16 v67;
  _BYTE v68[14];
  __int16 v69;
  int v70;
  uint64_t buf;
  __int16 v72;
  const char *v73;
  __int16 v74;
  id v75;
  __int16 v76;
  uint64_t v77;
  NSURLResourceKey v78;

  v58.receiver = self;
  v58.super_class = (Class)CLHRequestArchive;
  v8 = -[CLHRequestArchive init](&v58, "init");
  v9 = v8;
  if (!v8)
    return v9;
  v8->_rotationInterval = 1800.0;
  v8->_lastRotationTime = CFAbsoluteTimeGetCurrent();
  v10 = (NSString *)a3;
  v9->_directory = v10;
  v9->_requestCode = a4;
  v11 = CLPContext_ptr;
  if (a5 == -1)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    v23 = qword_1022A0208;
    if (!os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
      goto LABEL_26;
    v24 = -[NSString UTF8String](v10, "UTF8String");
    buf = 68289282;
    v72 = 2082;
    v73 = "";
    v74 = 2082;
    v75 = (id)v24;
    v25 = "{\"msg%{public}.0s\":\"CLHRequestArchive auto clean-up, threshold none\", \"dir\":%{public, location:escape_only}s}";
LABEL_24:
    v27 = v23;
    v28 = OS_LOG_TYPE_DEBUG;
    goto LABEL_25;
  }
  if (!-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v10))
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    v23 = qword_1022A0208;
    if (!os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
      goto LABEL_26;
    v26 = -[NSString UTF8String](v10, "UTF8String");
    buf = 68289282;
    v72 = 2082;
    v73 = "";
    v74 = 2082;
    v75 = (id)v26;
    v25 = "{\"msg%{public}.0s\":\"CLHRequestArchive auto clean-up. dir not exists\", \"dir\":%{public, location:escape_only}s}";
    goto LABEL_24;
  }
  v12 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v10);
  if (v12)
  {
    v13 = v12;
    v53 = a5;
    v51 = a3;
    v52 = v10;
    v14 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    v78 = NSURLNameKey;
    v50 = v13;
    v15 = -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](v14, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v13, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v78, 1), 5, &stru_1021A93E0);
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v16 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v59, &buf, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v60 != v19)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
          v22 = objc_autoreleasePoolPush();
          *(_QWORD *)v64 = 0;
          objc_msgSend(v21, "getResourceValue:forKey:error:", v64, NSURLNameKey, 0);
          if ((objc_msgSend(*(id *)v64, "hasPrefix:", CFSTR("secondary")) & 1) != 0
            || objc_msgSend(*(id *)v64, "hasPrefix:", CFSTR("sub")))
          {
            ++v18;
          }
          objc_autoreleasePoolPop(v22);
        }
        v17 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v59, &buf, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    a3 = v51;
    v11 = CLPContext_ptr;
    v41 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
    {
      v42 = -[NSString UTF8String](v52, "UTF8String");
      *(_DWORD *)v64 = 68289794;
      *(_DWORD *)&v64[4] = 0;
      v65 = 2082;
      v66 = "";
      v67 = 1026;
      *(_DWORD *)v68 = v53;
      *(_WORD *)&v68[4] = 2082;
      *(_QWORD *)&v68[6] = v42;
      v69 = 1026;
      v70 = v18;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLHRequestArchive auto clean-up completed\", \"threshold\":%{public}u, \"dir\":%{public, location:escape_only}s, \"total-items\":%{public}u}", v64, 0x28u);
    }
    if (v18 >= v53)
    {
      v43 = sub_101210738(v50);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_1021A93A0);
      v44 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
      {
        v45 = -[NSString UTF8String](v52, "UTF8String");
        *(_DWORD *)v64 = 68289538;
        *(_DWORD *)&v64[4] = 0;
        v65 = 2082;
        v66 = "";
        v67 = 2082;
        *(_QWORD *)v68 = v45;
        *(_WORD *)&v68[8] = 1026;
        *(_DWORD *)&v68[10] = v43;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLHRequestArchive auto clean-up. dir deleted.\", \"dir\":%{public, location:escape_only}s, \"status\":%{public}hhd}", v64, 0x22u);
        if (qword_1022A0200 != -1)
          dispatch_once(&qword_1022A0200, &stru_1021A93A0);
      }
      v46 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_FAULT))
      {
        v47 = -[NSString UTF8String](v52, "UTF8String");
        *(_DWORD *)v64 = 68289794;
        *(_DWORD *)&v64[4] = 0;
        v65 = 2082;
        v66 = "";
        v67 = 1026;
        *(_DWORD *)v68 = v53;
        *(_WORD *)&v68[4] = 2082;
        *(_QWORD *)&v68[6] = v47;
        v69 = 1026;
        v70 = v18;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLHRequestArchive auto clean-up threshold crossed\", \"threshold\":%{public}u, \"dir\":%{public, location:escape_only}s, \"total-items\":%{public}u}", v64, 0x28u);
        if (qword_1022A0200 != -1)
          dispatch_once(&qword_1022A0200, &stru_1021A93A0);
      }
      v48 = qword_1022A0208;
      if (os_signpost_enabled((os_log_t)qword_1022A0208))
      {
        v49 = -[NSString UTF8String](v52, "UTF8String");
        *(_DWORD *)v64 = 68289794;
        *(_DWORD *)&v64[4] = 0;
        v65 = 2082;
        v66 = "";
        v67 = 1026;
        *(_DWORD *)v68 = v53;
        *(_WORD *)&v68[4] = 2082;
        *(_QWORD *)&v68[6] = v49;
        v69 = 1026;
        v70 = v18;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLHRequestArchive auto clean-up threshold crossed", "{\"msg%{public}.0s\":\"CLHRequestArchive auto clean-up threshold crossed\", \"threshold\":%{public}u, \"dir\":%{public, location:escape_only}s, \"total-items\":%{public}u}", v64, 0x28u);
      }
    }
    goto LABEL_26;
  }
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_1021A93A0);
  v39 = qword_1022A0208;
  if (!os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
    goto LABEL_26;
  v40 = -[NSString UTF8String](v10, "UTF8String");
  buf = 68289282;
  v72 = 2082;
  v73 = "";
  v74 = 2082;
  v75 = (id)v40;
  v25 = "{\"msg%{public}.0s\":\"#warning CLHRequestArchive auto clean-up, directory-url nil\", \"dir\":%{public, location:escape_only}s}";
  v27 = v39;
  v28 = OS_LOG_TYPE_DEFAULT;
LABEL_25:
  _os_log_impl((void *)&_mh_execute_header, v27, v28, v25, (uint8_t *)&buf, 0x1Cu);
LABEL_26:
  *(_QWORD *)&v59 = 0;
  objc_msgSend(objc_msgSend(v11[217], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", a3, 1, 0, &v59);
  if ((_QWORD)v59)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    v29 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_FAULT))
    {
      buf = 68289539;
      v72 = 2082;
      v73 = "";
      v74 = 2113;
      v75 = a3;
      v76 = 2113;
      v77 = v59;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"failed to create archive dir\", \"path\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    }
    v30 = qword_1022A0208;
    if (os_signpost_enabled((os_log_t)qword_1022A0208))
    {
      buf = 68289539;
      v72 = 2082;
      v73 = "";
      v74 = 2113;
      v75 = a3;
      v76 = 2113;
      v77 = v59;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "failed to create archive dir", "{\"msg%{public}.0s\":\"failed to create archive dir\", \"path\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
    }
  }
  else
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    v31 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
    {
      buf = 68289283;
      v72 = 2082;
      v73 = "";
      v74 = 2113;
      v75 = a3;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"archive dir now exists\", \"path\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v32 = -[CLHRequestArchive secondaryFileURLs](v9, "secondaryFileURLs");
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v34; j = (char *)j + 1)
      {
        if (*(_QWORD *)v55 != v35)
          objc_enumerationMutation(v32);
        sub_10088761C(*(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)j));
        v9->_count += v37;
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    }
    while (v34);
  }
  v9->_totalCount = -[CLHRequestArchive totalSecondaryPointsUnderAllSubArchives](v9, "totalSecondaryPointsUnderAllSubArchives");
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLHRequestArchive;
  -[CLHRequestArchive dealloc](&v3, "dealloc");
}

- (void)rotateSecondaryFile
{
  id v3;
  NSObject *v4;
  NSString *secondaryPath;
  uint64_t v6;
  NSObject *v7;
  NSString *v8;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  NSString *v14;
  __int16 v15;
  id v16;

  v3 = -[CLHRequestArchive pathForSecondaryData](self, "pathForSecondaryData");
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_1021A93A0);
  v4 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    secondaryPath = self->_secondaryPath;
    v9 = 68289539;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2113;
    v14 = secondaryPath;
    v15 = 2113;
    v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"rotating secondary file\", \"from\":%{private, location:escape_only}@, \"to\":%{private, location:escape_only}@}", (uint8_t *)&v9, 0x26u);
  }
  -[CLHRequestArchive setSecondaryPath:](self, "setSecondaryPath:", v3);
  v6 = sub_1008876A0(self->_secondaryPath);
  if ((_DWORD)v6 == -1)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    v7 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_INFO))
    {
      v8 = self->_secondaryPath;
      v9 = 68289283;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2113;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Warning could not open file\", \"path\":%{private, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);
    }
  }
  else
  {
    -[CLHRequestArchive setSecondaryFileHandle:](self, "setSecondaryFileHandle:", objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:closeOnDealloc:", v6, 1));
    self->_lastRotationTime = CFAbsoluteTimeGetCurrent();
  }
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)totalCountIncludingAllSubArchives
{
  unsigned int v3;
  uint64_t v4;

  v3 = -[CLHRequestArchive isActiveSubArchive](self, "isActiveSubArchive");
  v4 = 40;
  if (v3)
    v4 = 48;
  return *(unint64_t *)((char *)&self->super.isa + v4);
}

- (unint64_t)fileCount
{
  return (unint64_t)objc_msgSend(-[CLHRequestArchive secondaryFileURLs](self, "secondaryFileURLs"), "count");
}

- (unsigned)primaryDataSize
{
  id v3;

  v3 = 0;
  -[NSURL getResourceValue:forKey:error:](+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", -[CLHRequestArchive pathForPrimaryData](self, "pathForPrimaryData")), "getResourceValue:forKey:error:", &v3, NSURLFileSizeKey, 0);
  return objc_msgSend(v3, "unsignedIntValue");
}

- (unsigned)secondaryDataSize
{
  id v2;
  id v3;
  id v4;
  unsigned int v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = -[CLHRequestArchive secondaryFileURLs](self, "secondaryFileURLs");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v12;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(v2);
      v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
      v10 = 0;
      objc_msgSend(v8, "getResourceValue:forKey:error:", &v10, NSURLFileSizeKey, 0);
      v5 += objc_msgSend(v10, "unsignedIntValue");
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  }
  while (v4);
  return v5;
}

- (id)mappedDataByDestructivelyCombiningPrimaryAndSecondaryData
{
  id v3;
  NSString *v4;
  NSURL *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  const char *v9;
  id v10;
  NSObject *v11;
  const char *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  uint64_t buf;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  id v33;

  v3 = objc_alloc_init((Class)PBDataWriter);
  objc_msgSend(v3, "writeData:", sub_101449ADC());
  objc_msgSend(v3, "writeBigEndianFixed32:", self->_requestCode);
  objc_msgSend(v3, "writeBigEndianFixed32:", -[CLHRequestArchive secondaryDataSize](self, "secondaryDataSize")+ -[CLHRequestArchive primaryDataSize](self, "primaryDataSize"));
  v4 = -[NSString stringByAppendingPathComponent:](self->_directory, "stringByAppendingPathComponent:", CFSTR("conglomerate"));
  v5 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4);
  if (v5)
    sub_101210738(v5);
  v6 = sub_1008876A0(v4);
  if ((_DWORD)v6 == -1)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    v20 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_INFO))
    {
      buf = 68289283;
      v28 = 2082;
      v29 = "";
      v30 = 2113;
      v31 = (const char *)v4;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Warning could not open file\", \"path\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }

    return 0;
  }
  else
  {
    v7 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:closeOnDealloc:", v6, 1);
    v25 = 0;
    objc_msgSend(v7, "writeData:error:", objc_msgSend(v3, "immutableData"), &v25);
    if (v25)
    {
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_1021A93A0);
      v8 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_ERROR))
      {
        v9 = -[NSString UTF8String](v4, "UTF8String");
        v10 = objc_msgSend(objc_msgSend(v25, "description"), "UTF8String");
        buf = 68289538;
        v28 = 2082;
        v29 = "";
        v30 = 2082;
        v31 = v9;
        v32 = 2082;
        v33 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLHRequestArchive error writing conglomerate(parimary and secondaries)\", \"file\":%{public, location:escape_only}s, \"Error\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
        if (qword_1022A0200 != -1)
          dispatch_once(&qword_1022A0200, &stru_1021A93A0);
      }
      v11 = qword_1022A0208;
      if (os_signpost_enabled((os_log_t)qword_1022A0208))
      {
        v12 = -[NSString UTF8String](v4, "UTF8String");
        v13 = objc_msgSend(objc_msgSend(v25, "description"), "UTF8String");
        buf = 68289538;
        v28 = 2082;
        v29 = "";
        v30 = 2082;
        v31 = v12;
        v32 = 2082;
        v33 = v13;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLHRequestArchive error writing conglomerate(parimary and secondaries)", "{\"msg%{public}.0s\":\"CLHRequestArchive error writing conglomerate(parimary and secondaries)\", \"file\":%{public, location:escape_only}s, \"Error\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
      }
    }

    sub_1008878E8(v4, -[CLHRequestArchive pathForPrimaryData](self, "pathForPrimaryData"), 1);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = -[CLHRequestArchive secondaryFileURLs](self, "secondaryFileURLs", 0);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          sub_1008878E8(v4, objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "path"), 1);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v16);
    }
    -[CLHRequestArchive rotateSecondaryFile](self, "rotateSecondaryFile");
    -[CLHRequestArchive updateCount](self, "updateCount");
    return sub_10121027C(v4, 1);
  }
}

- (void)overwritePrimaryData:(id)a3
{
  NSURL *v5;
  NSURL *v6;
  NSObject *v7;
  NSURL *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  NSURL *v12;
  id v13;
  NSObject *v14;
  NSURL *v15;
  id v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  NSURL *v24;
  __int16 v25;
  id v26;

  v5 = +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", -[CLHRequestArchive pathForPrimaryData](self, "pathForPrimaryData"), 0);
  if (v5)
  {
    v6 = v5;
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    v7 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2113;
      v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"removing primary file\", \"url\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    sub_101210738(v6);
  }
  v8 = -[CLHRequestArchive pathForPrimaryData](self, "pathForPrimaryData");
  v9 = sub_1008876A0(v8);
  if ((_DWORD)v9 == -1)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    v17 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289283;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2113;
      v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Warning could not open file\", \"path\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  else
  {
    v10 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:closeOnDealloc:", v9, 1);
    v18 = 0;
    objc_msgSend(v10, "writeData:error:", a3, &v18);
    if (v18)
    {
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_1021A93A0);
      v11 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_ERROR))
      {
        v12 = (NSURL *)-[NSURL UTF8String](v8, "UTF8String");
        v13 = objc_msgSend(objc_msgSend(v18, "description"), "UTF8String");
        *(_DWORD *)buf = 68289538;
        v20 = 0;
        v21 = 2082;
        v22 = "";
        v23 = 2082;
        v24 = v12;
        v25 = 2082;
        v26 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLHRequestArchive error over-writing primary data\", \"file\":%{public, location:escape_only}s, \"Error\":%{public, location:escape_only}s}", buf, 0x26u);
        if (qword_1022A0200 != -1)
          dispatch_once(&qword_1022A0200, &stru_1021A93A0);
      }
      v14 = qword_1022A0208;
      if (os_signpost_enabled((os_log_t)qword_1022A0208))
      {
        v15 = (NSURL *)-[NSURL UTF8String](v8, "UTF8String");
        v16 = objc_msgSend(objc_msgSend(v18, "description"), "UTF8String");
        *(_DWORD *)buf = 68289538;
        v20 = 0;
        v21 = 2082;
        v22 = "";
        v23 = 2082;
        v24 = v15;
        v25 = 2082;
        v26 = v16;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLHRequestArchive error over-writing primary data", "{\"msg%{public}.0s\":\"CLHRequestArchive error over-writing primary data\", \"file\":%{public, location:escape_only}s, \"Error\":%{public, location:escape_only}s}", buf, 0x26u);
      }
    }

  }
}

- (void)overwritePrimaryObject:(id)a3
{
  -[CLHRequestArchive overwritePrimaryData:](self, "overwritePrimaryData:", objc_msgSend(a3, "data"));
}

- (id)mappedPrimaryData
{
  return sub_10121027C(-[CLHRequestArchive pathForPrimaryData](self, "pathForPrimaryData"), 0);
}

- (BOOL)primaryDataExists
{
  return -[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", -[CLHRequestArchive pathForPrimaryData](self, "pathForPrimaryData"));
}

- (id)mappedSecondaryDataByDestructivelyCombiningAllSecondaryData
{
  NSString *v3;
  NSURL *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = -[NSString stringByAppendingPathComponent:](self->_directory, "stringByAppendingPathComponent:", CFSTR("allSecondaryCombined"));
  v4 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3);
  if (v4)
    sub_101210738(v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = -[CLHRequestArchive secondaryFileURLs](self, "secondaryFileURLs", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        sub_1008878E8(v3, objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "path"), 1);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  -[CLHRequestArchive rotateSecondaryFile](self, "rotateSecondaryFile");
  -[CLHRequestArchive updateCount](self, "updateCount");
  return sub_10121027C(v3, 1);
}

- (id)mappedSecondaryData
{
  NSString *v3;
  NSURL *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = -[NSString stringByAppendingPathComponent:](self->_directory, "stringByAppendingPathComponent:", CFSTR("allSecondaryCombined"));
  v4 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3);
  if (v4)
    sub_101210738(v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = -[CLHRequestArchive secondaryFileURLs](self, "secondaryFileURLs", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        sub_1008878E8(v3, objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "path"), 0);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  return sub_10121027C(v3, 1);
}

- (void)pruneSecondaryDataOlderThan:(double)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  double v11;
  unint64_t count;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = -[CLHRequestArchive secondaryFileURLs](self, "secondaryFileURLs");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = COERCE_DOUBLE(sub_10088761C(v10));
        if (v11 < a3 && sub_101210738(v10))
        {
          count = self->_count;
          sub_10088761C(v10);
          -[CLHRequestArchive setCount:](self, "setCount:", count - v13);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16, v11);
    }
    while (v7);
  }
}

- (id)pruneAndGetSecondaryDataOlderThan:(double)a3
{
  NSString *v5;
  NSURL *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  double v13;
  unint64_t count;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = -[NSString stringByAppendingPathComponent:](self->_directory, "stringByAppendingPathComponent:", CFSTR("prunedSecondaryCombined"));
  v6 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v5);
  if (v6)
    sub_101210738(v6);
  v7 = -[CLHRequestArchive secondaryFileURLs](self, "secondaryFileURLs");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v13 = COERCE_DOUBLE(sub_10088761C(v12));
        if (v13 < a3)
        {
          sub_1008878E8(v5, objc_msgSend(v12, "path", v13), 0);
          if (sub_101210738(v12))
          {
            count = self->_count;
            sub_10088761C(v12);
            -[CLHRequestArchive setCount:](self, "setCount:", count - v15);
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16, v13);
    }
    while (v9);
  }
  return sub_10121027C(v5, 1);
}

- (void)iterateSecondaryData:(id)a3 forField:(unsigned int)a4 withHandler:(id)a5
{
  id v8;
  void *v9;
  id v11;
  char v12;
  int v13;

  if (objc_msgSend(a3, "length"))
  {
    v8 = objc_msgSend(objc_alloc((Class)PBDataReader), "initWithData:", a3);
    if (objc_msgSend(v8, "hasMoreData"))
    {
      do
      {
        v9 = objc_autoreleasePoolPush();
        v13 = 0;
        v12 = 0;
        objc_msgSend(v8, "readTag:type:", &v13, &v12);
        if (v13 == a4 && v12 == 2)
        {
          v11 = objc_msgSend(v8, "readData");
          if (v11)
            (*((void (**)(id, id))a5 + 2))(a5, v11);
        }
        objc_autoreleasePoolPop(v9);
      }
      while ((objc_msgSend(v8, "hasMoreData") & 1) != 0);
    }

  }
}

- (void)generateNewSubArchive
{
  id v3;
  NSObject *v4;
  NSString *directory;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  unsigned int v10;
  NSString *v11;
  NSString *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  NSString *v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];

  if (!-[CLHRequestArchive isActiveSubArchive](self, "isActiveSubArchive"))
  {
    v3 = -[CLHRequestArchive secondaryFileURLs](self, "secondaryFileURLs");
    if (objc_msgSend(v3, "count"))
    {
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_1021A93A0);
      v4 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
      {
        directory = self->_directory;
        *(_DWORD *)buf = 68289283;
        v21 = 0;
        v22 = 2082;
        v23 = "";
        v24 = 2113;
        v25 = directory;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning Turning on sub-archiving on an archive with existing data erases existing data.\", \"directory\":%{private, location:escape_only}@}", buf, 0x1Cu);
      }
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v28, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v17 != v8)
              objc_enumerationMutation(v3);
            sub_101210738(*(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i));
          }
          v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v28, 16);
        }
        while (v7);
      }
    }
  }
  v10 = -[CLHRequestArchive isActiveSubArchive](self, "isActiveSubArchive");
  v11 = self->_directory;
  if (v10)
    v11 = -[NSString stringByDeletingLastPathComponent](self->_directory, "stringByDeletingLastPathComponent");
  v12 = -[NSString stringByAppendingPathComponent:](v11, "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sub_%@"), -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString")));
  v15 = 0;
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v15);
  if (v15)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    v13 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2113;
      v25 = v12;
      v26 = 2113;
      v27 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"failed to create sub-archive\", \"path\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    }
    v14 = qword_1022A0208;
    if (os_signpost_enabled((os_log_t)qword_1022A0208))
    {
      *(_DWORD *)buf = 68289539;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2113;
      v25 = v12;
      v26 = 2113;
      v27 = v15;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "failed to create sub-archive", "{\"msg%{public}.0s\":\"failed to create sub-archive\", \"path\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
    }
  }
  self->_rotationInterval = 1800.0;
  self->_lastRotationTime = CFAbsoluteTimeGetCurrent();
  -[CLHRequestArchive setSecondaryPath:](self, "setSecondaryPath:", 0);

  self->_directory = v12;
  self->_count = 0;
}

- (void)iterateSubArchivesWithHandler:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  _BYTE *v11;
  unint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = -[CLHRequestArchive inactiveSubArchives](self, "inactiveSubArchives", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "count");
        (*((void (**)(id, void *))a3 + 2))(a3, v10);
        v12 = self->_totalCount + (_BYTE *)objc_msgSend(v10, "count") - v11;
        if ((v12 & 0x80000000) == 0)
          self->_totalCount = v12;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  (*((void (**)(id, CLHRequestArchive *))a3 + 2))(a3, self);
}

- (BOOL)deleteSubArchiveIfInactive:(id)a3
{
  NSURL *v5;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  const char *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  int v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;

  if (!-[NSString hasPrefix:](-[NSString lastPathComponent](self->_directory, "lastPathComponent"), "hasPrefix:", CFSTR("sub")))
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    v7 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_FAULT))
    {
      v8 = -[NSString UTF8String](self->_directory, "UTF8String");
      v17 = 68289282;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SubArchiving delete inactive. receiver not sub-archive\", \"receiver\":%{public, location:escape_only}s}", (uint8_t *)&v17, 0x1Cu);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    }
    v9 = qword_1022A0208;
    if (!os_signpost_enabled((os_log_t)qword_1022A0208))
      return 0;
    v10 = -[NSString UTF8String](self->_directory, "UTF8String");
    v17 = 68289282;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2082;
    v22 = v10;
    v11 = "#SubArchiving delete inactive. receiver not sub-archive";
    v12 = "{\"msg%{public}.0s\":\"#SubArchiving delete inactive. receiver not sub-archive\", \"receiver\":%{public, locat"
          "ion:escape_only}s}";
    v13 = v9;
LABEL_20:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v11, v12, (uint8_t *)&v17, 0x1Cu);
    return 0;
  }
  if ((objc_msgSend(objc_msgSend(objc_msgSend(a3, "directory"), "lastPathComponent"), "hasPrefix:", CFSTR("sub")) & 1) == 0)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    v14 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_FAULT))
    {
      v17 = 68289282;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = (const char *)objc_msgSend(objc_msgSend(a3, "directory"), "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SubArchiving delete inactive. archiveToDelete not sub-archive\", \"archiveToDelete\":%{public, location:escape_only}s}", (uint8_t *)&v17, 0x1Cu);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_1021A93A0);
    }
    v15 = qword_1022A0208;
    if (!os_signpost_enabled((os_log_t)qword_1022A0208))
      return 0;
    v16 = (const char *)objc_msgSend(objc_msgSend(a3, "directory"), "UTF8String");
    v17 = 68289282;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2082;
    v22 = v16;
    v11 = "#SubArchiving delete inactive. archiveToDelete not sub-archive";
    v12 = "{\"msg%{public}.0s\":\"#SubArchiving delete inactive. archiveToDelete not sub-archive\", \"archiveToDelete\":%"
          "{public, location:escape_only}s}";
    v13 = v15;
    goto LABEL_20;
  }
  if (!-[NSString isEqualToString:](-[NSString lastPathComponent](self->_directory, "lastPathComponent"), "isEqualToString:", objc_msgSend(objc_msgSend(a3, "directory"), "lastPathComponent")))
  {
    v5 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(a3, "directory"));
    if (v5)
      return sub_101210738(v5);
  }
  return 0;
}

- (id)inactiveSubArchives
{
  NSArray *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CLHRequestArchive *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (!-[CLHRequestArchive isActiveSubArchive](self, "isActiveSubArchive"))
    sub_101947670();
  v3 = -[NSArray filteredArrayUsingPredicate:](sub_101211B7C((uint64_t)-[NSString stringByDeletingLastPathComponent](self->_directory, "stringByDeletingLastPathComponent")), "filteredArrayUsingPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self.lastPathComponent BEGINSWITH 'sub_'")));
  v4 = objc_alloc_init((Class)NSMutableArray);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
        if (!-[NSString isEqualToString:](-[NSString lastPathComponent](self->_directory, "lastPathComponent"), "isEqualToString:", objc_msgSend(v9, "lastPathComponent")))
        {
          v10 = -[CLHRequestArchive initWithDirectory:requestCode:]([CLHRequestArchive alloc], "initWithDirectory:requestCode:", objc_msgSend(v9, "path"), self->_requestCode);
          objc_msgSend(v4, "addObject:", v10);

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  return v4;
}

- (void)updateCount
{
  id v3;
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  void *i;
  int v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = -[CLHRequestArchive secondaryFileURLs](self, "secondaryFileURLs", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        sub_10088761C(*(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i));
        v6 += v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
    v10 = v6;
  }
  else
  {
    v10 = 0;
  }
  -[CLHRequestArchive setCount:](self, "setCount:", v10);
}

- (id)pathForPrimaryData
{
  return -[NSString stringByAppendingPathComponent:](self->_directory, "stringByAppendingPathComponent:", CFSTR("primary"));
}

- (id)pathForSecondaryData
{
  uint64_t v3;

  *(double *)&v3 = CFAbsoluteTimeGetCurrent();
  return -[NSString stringByAppendingPathComponent:](self->_directory, "stringByAppendingPathComponent:", sub_10019EBF8(v3, 0));
}

- (id)secondaryFileURLs
{
  return -[NSArray sortedArrayUsingComparator:](-[NSArray filteredArrayUsingPredicate:](sub_101211B7C((uint64_t)self->_directory), "filteredArrayUsingPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self.lastPathComponent BEGINSWITH 'secondary-'"))), "sortedArrayUsingComparator:", &stru_1021A9320);
}

- (unint64_t)totalSecondaryPointsUnderAllSubArchives
{
  NSPredicate *v3;
  NSPredicate *v4;
  NSArray *v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *i;
  NSArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  uint64_t v16;
  NSObject *v17;
  NSString *directory;
  CLHRequestArchive *v20;
  void *context;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  NSString *v35;
  __int16 v36;
  int v37;
  _BYTE v38[128];
  _BYTE v39[128];

  context = objc_autoreleasePoolPush();
  v3 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self.lastPathComponent BEGINSWITH 'sub_'"));
  v4 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self.lastPathComponent BEGINSWITH 'secondary-'"));
  v20 = self;
  v5 = -[NSArray filteredArrayUsingPredicate:](sub_101211B7C((uint64_t)self->_directory), "filteredArrayUsingPredicate:", v3);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v5);
        v11 = -[NSArray filteredArrayUsingPredicate:](sub_101211B7C((uint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "path", v20)), "filteredArrayUsingPredicate:", v4);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v38, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(_QWORD *)v23 != v14)
                objc_enumerationMutation(v11);
              sub_10088761C(*(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j));
              v8 += v16;
            }
            v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v38, 16);
          }
          while (v13);
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  objc_autoreleasePoolPop(context);
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_1021A93A0);
  v17 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
  {
    directory = v20->_directory;
    *(_DWORD *)buf = 68289538;
    v31 = 0;
    v32 = 2082;
    v33 = "";
    v34 = 2114;
    v35 = directory;
    v36 = 1026;
    v37 = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"totalSecondaryPointsUnderAllSubArchives\", \"archive\":%{public, location:escape_only}@, \"totalCount\":%{public}d}", buf, 0x22u);
  }
  return v8;
}

- (void)eraseAllData
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = sub_101211B7C((uint64_t)self->_directory);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        sub_101210738(*(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[CLHRequestArchive setCount:](self, "setCount:", 0, (_QWORD)v8);
}

- (id)jsonObject
{
  NSString *v3;
  _QWORD v5[2];
  _QWORD v6[2];

  v5[0] = CFSTR("identifier");
  v3 = -[NSString lastPathComponent](self->_directory, "lastPathComponent");
  v5[1] = CFSTR("count");
  v6[0] = v3;
  v6[1] = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", self->_count);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
}

- (double)rotationInterval
{
  return self->_rotationInterval;
}

- (void)setRotationInterval:(double)a3
{
  self->_rotationInterval = a3;
}

- (unsigned)requestCode
{
  return self->_requestCode;
}

- (NSString)secondaryPath
{
  return self->_secondaryPath;
}

- (void)setSecondaryFileHandle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (unint64_t)totalCount
{
  return self->_totalCount;
}

- (void)setTotalCount:(unint64_t)a3
{
  self->_totalCount = a3;
}

@end
