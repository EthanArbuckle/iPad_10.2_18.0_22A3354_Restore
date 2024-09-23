@implementation CLFallLogger

- (CLFallLogger)init
{
  CLFallLogger *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLFallLogger;
  v2 = -[CLFallLogger init](&v4, "init");
  if (v2)
    v2->fQueue = (OS_dispatch_queue *)dispatch_queue_create("CLFallLogger", 0);
  return v2;
}

- (id)initToDirectory:(id)a3 prefix:(id)a4 rotation:(int64_t)a5
{
  CLFallLogger *v8;

  v8 = -[CLFallLogger init](self, "init");
  if (v8)
  {
    v8->fLogDirectory = (NSString *)a3;
    v8->fLogFilePrefix = (NSString *)a4;
    v8->fRotation = a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[CLFallLogger _stopLoggingOnQueue](self, "_stopLoggingOnQueue");
  dispatch_release((dispatch_object_t)self->fQueue);

  v3.receiver = self;
  v3.super_class = (Class)CLFallLogger;
  -[CLFallLogger dealloc](&v3, "dealloc");
}

- (id)logDirectory
{
  return self->fLogDirectory;
}

- (id)_currentFilename
{
  id v3;
  NSNumber *v4;
  NSNumber *v5;

  if (!self->fHour && !self->fDate)
    return &stru_1021D8FB8;
  v3 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyyMMdd"));
  if (self->fRotation)
    v4 = (NSNumber *)objc_msgSend(v3, "stringFromDate:", self->fDate);
  else
    v4 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->fHour);
  v5 = v4;

  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.v%d.%@.%@"), self->fLogFilePrefix, 11, v5, CFSTR("bin"));
}

- (id)currentFilename
{
  NSObject *fQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_100207318;
  v10 = sub_100207E28;
  v11 = 0;
  fQueue = self->fQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1012DD590;
  v5[3] = &unk_10215ABC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(fQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_stopLoggingOnQueue
{
  -[NSOutputStream close](self->fOutputStream, "close");

  self->fOutputStream = 0;
  self->fHour = 0;

  self->fDate = 0;
}

- (BOOL)_shouldRotate
{
  return -[CLFallLogger _shouldRotateToHour:date:](self, "_shouldRotateToHour:date:", 0, 0);
}

- (BOOL)_shouldRotateToHour:(int64_t *)a3 date:(id *)a4
{
  NSDate *v7;
  int64_t v8;

  if (!self->fLogDirectory)
    return 0;
  if (!self->fRotation)
  {
    v8 = (uint64_t)CFAbsoluteTimeGetCurrent() / 3600;
    if (self->fHour != v8)
    {
      v7 = 0;
      if (!a3)
        goto LABEL_6;
      goto LABEL_5;
    }
    return 0;
  }
  v7 = +[NSDate date](NSDate, "date");
  if (-[NSCalendar isDate:inSameDayAsDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "isDate:inSameDayAsDate:", self->fDate, v7))
  {
    return 0;
  }
  v8 = 0;
  if (a3)
LABEL_5:
    *a3 = v8;
LABEL_6:
  if (a4)
    *a4 = v7;
  return 1;
}

- (void)stopLogging
{
  NSObject *fQueue;
  _QWORD block[5];

  fQueue = self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1012DD728;
  block[3] = &unk_10212BB58;
  block[4] = self;
  dispatch_sync(fQueue, block);
}

- (void)clearLogs
{
  NSObject *fQueue;
  _QWORD block[5];

  fQueue = self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1012DD788;
  block[3] = &unk_10212BB58;
  block[4] = self;
  dispatch_async(fQueue, block);
}

- (void)flushToFile
{
  NSObject *fQueue;
  _QWORD block[5];

  fQueue = self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1012DD834;
  block[3] = &unk_10212BB58;
  block[4] = self;
  dispatch_sync(fQueue, block);
}

- (void)flushInMemoryDataWithCompletionQueue:(id)a3 completionBlock:(id)a4
{
  NSObject *fQueue;
  _QWORD block[7];

  fQueue = self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1012DD8C8;
  block[3] = &unk_102180A50;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(fQueue, block);
}

- (id)_outputStream
{
  unsigned int v3;
  BOOL v4;
  NSObject *v5;
  const char *v6;
  NSOutputStream *v7;
  NSObject *v8;
  uint8_t *v9;
  NSString *v10;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  uint64_t v15;
  char v16;
  id v17;
  int64_t v18;
  _QWORD v19[2];
  int v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;

  if (!self->fLogDirectory)
  {
    if (self->fOutputStream)
      return self->fOutputStream;
    v7 = (NSOutputStream *)objc_msgSend(objc_alloc((Class)NSOutputStream), "initToMemory");
    goto LABEL_32;
  }
  v17 = 0;
  v18 = 0;
  if (!-[CLFallLogger _shouldRotateToHour:date:](self, "_shouldRotateToHour:date:", &v18, &v17))
    return self->fOutputStream;
  -[CLFallLogger _stopLoggingOnQueue](self, "_stopLoggingOnQueue");
  v16 = 1;
  v3 = -[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", self->fLogDirectory, &v16);
  if (v3)
    v4 = v16 == 0;
  else
    v4 = 0;
  if (!v4)
  {
    if ((v3 & 1) == 0)
    {
      v15 = 0;
      -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", self->fLogDirectory, 1, 0, &v15);
      if (v15)
      {
        if (qword_10229FD90 != -1)
          dispatch_once(&qword_10229FD90, &stru_1021AD708);
        v5 = qword_10229FD98;
        if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v15;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Directory creation failed: %@", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FD90 != -1)
            dispatch_once(&qword_10229FD90, &stru_1021AD708);
          v20 = 138412290;
          v21 = v15;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 17, "Directory creation failed: %@", &v20, 12);
LABEL_27:
          v9 = (uint8_t *)v6;
          sub_100512490("Generic", 1, 0, 0, "-[CLFallLogger _outputStream]", "%s\n", v6);
          if (v9 != buf)
            free(v9);
          return self->fOutputStream;
        }
        return self->fOutputStream;
      }
    }
    self->fHour = v18;
    self->fDate = (NSDate *)v17;
    v19[0] = self->fLogDirectory;
    v19[1] = -[CLFallLogger _currentFilename](self, "_currentFilename");
    v10 = +[NSString pathWithComponents:](NSString, "pathWithComponents:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
    if (!-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v10)&& !-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v10, 0, 0))
    {
      if (qword_10229FD90 != -1)
        dispatch_once(&qword_10229FD90, &stru_1021AD708);
      v12 = qword_10229FD98;
      if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "File creation failed", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FD90 != -1)
          dispatch_once(&qword_10229FD90, &stru_1021AD708);
        LOWORD(v20) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 17, "File creation failed", &v20, 2);
        v14 = (uint8_t *)v13;
        sub_100512490("Generic", 1, 0, 0, "-[CLFallLogger _outputStream]", "%s\n", v13);
        if (v14 != buf)
          free(v14);
      }
      -[CLFallLogger _stopLoggingOnQueue](self, "_stopLoggingOnQueue");
      return self->fOutputStream;
    }
    v7 = (NSOutputStream *)objc_msgSend(objc_alloc((Class)NSOutputStream), "initToFileAtPath:append:", v10, 1);
LABEL_32:
    self->fOutputStream = v7;
    -[NSOutputStream open](v7, "open");
    return self->fOutputStream;
  }
  if (qword_10229FD90 != -1)
    dispatch_once(&qword_10229FD90, &stru_1021AD708);
  v8 = qword_10229FD98;
  if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "Unable to create directory. There is a file with the same name.", buf, 2u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021AD708);
    LOWORD(v20) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 17, "Unable to create directory. There is a file with the same name.", &v20, 2);
    goto LABEL_27;
  }
  return self->fOutputStream;
}

- (void)logData:(id)a3
{
  NSObject *fQueue;
  _QWORD v4[6];

  fQueue = self->fQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1012DDED8;
  v4[3] = &unk_10212BB30;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fQueue, v4);
}

@end
