@implementation SSRollableLog

- (SSRollableLog)initWithLogOptions:(id)a3
{
  SSRollableLog *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSRollableLog;
  v4 = -[SSRollableLog init](&v6, sel_init);
  if (v4)
  {
    v4->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StoreServices.SSRollableLog", 0);
    v4->_lastFileStatTime = -1.79769313e308;
    v4->_options = (SSLogFileOptions *)objc_msgSend(a3, "copy");
    -[SSRollableLog _openLogFile](v4, "_openLogFile");
  }
  return v4;
}

- (void)dealloc
{
  NSObject *fileObserverSource;
  objc_super v4;

  fileObserverSource = self->_fileObserverSource;
  if (fileObserverSource)
  {
    dispatch_source_cancel(fileObserverSource);
    dispatch_release((dispatch_object_t)self->_fileObserverSource);
  }
  dispatch_release((dispatch_object_t)self->_dispatchQueue);

  v4.receiver = self;
  v4.super_class = (Class)SSRollableLog;
  -[SSRollableLog dealloc](&v4, sel_dealloc);
}

- (SSLogFileOptions)logOptions
{
  return (SSLogFileOptions *)(id)-[SSLogFileOptions copy](self->_options, "copy");
}

- (void)writeString:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__SSRollableLog_writeString___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __29__SSRollableLog_writeString___block_invoke(uint64_t a1)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[3])
  {
    objc_msgSend(v2, "_openLogFile");
    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "_checkLogFileSize");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "writeData:", objc_msgSend(*(id *)(a1 + 40), "dataUsingEncoding:", 4));
}

- (id)_activeLogFilePath
{
  return -[SSRollableLog _logFilePathWithIndex:](self, "_logFilePathWithIndex:", 0);
}

- (void)_checkLogFileSize
{
  unint64_t v3;
  unint64_t v4;
  stat v5;

  v3 = -[SSLogFileOptions maxLogFileSize](self->_options, "maxLogFileSize");
  if (v3)
  {
    v4 = v3;
    if (-[SSLogFileOptions maxNumberOfLogFiles](self->_options, "maxNumberOfLogFiles") >= 2
      && CFAbsoluteTimeGetCurrent() - self->_lastFileStatTime >= 60.0)
    {
      memset(&v5.st_size, 0, 48);
      if (!stat((const char *)objc_msgSend(-[SSRollableLog _activeLogFilePath](self, "_activeLogFilePath", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), "fileSystemRepresentation"), &v5)&& v5.st_size >= v4)
      {
        -[SSRollableLog _rollLogFiles](self, "_rollLogFiles");
      }
    }
  }
}

- (void)_closeLogFile
{
  NSObject *fileObserverSource;

  fileObserverSource = self->_fileObserverSource;
  if (fileObserverSource)
  {
    dispatch_source_cancel(fileObserverSource);
    dispatch_release((dispatch_object_t)self->_fileObserverSource);
    self->_fileObserverSource = 0;
  }

  self->_fileHandle = 0;
}

- (id)_logFilePathWithIndex:(int64_t)a3
{
  NSString *v5;
  __CFString *v6;
  NSString *v7;
  NSString *v8;
  const __CFString *v9;

  v5 = -[SSLogFileOptions logFileBaseName](self->_options, "logFileBaseName");
  v6 = -[NSString pathExtension](v5, "pathExtension");
  if (!-[__CFString length](v6, "length"))
  {
    if (a3 >= 1)
      v5 = -[NSString stringByAppendingPathExtension:](v5, "stringByAppendingPathExtension:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a3));
    v9 = CFSTR("log");
    v8 = v5;
    goto LABEL_7;
  }
  if (a3 >= 1)
  {
    v7 = -[NSString stringByDeletingPathExtension](v5, "stringByDeletingPathExtension");
    v8 = -[NSString stringByAppendingPathExtension:](v7, "stringByAppendingPathExtension:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a3));
    v9 = v6;
LABEL_7:
    v5 = -[NSString stringByAppendingPathExtension:](v8, "stringByAppendingPathExtension:", v9);
  }
  return -[NSString stringByAppendingPathComponent:](-[SSLogFileOptions logDirectoryPath](self->_options, "logDirectoryPath"), "stringByAppendingPathComponent:", v5);
}

- (void)_openLogFile
{
  id v3;
  char v4;
  SSMutableLogConfig *v5;
  SSMutableLogConfig *v6;
  int v7;
  int v8;
  NSString *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  NSFileHandle *v21;
  int v22;
  OS_dispatch_source *v23;
  uint64_t v24;
  NSObject *fileObserverSource;
  int *v26;
  uint64_t v27;
  _QWORD v28[4];
  int v29;
  _QWORD handler[5];
  uint64_t v31;
  int v32;
  NSString *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v31 = 0;
  v4 = objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", -[SSLogFileOptions logDirectoryPath](self->_options, "logDirectoryPath"), 1, 0, &v31);

  if ((v4 & 1) == 0)
  {
    v5 = objc_alloc_init(SSMutableLogConfig);
    -[SSLogConfig setSubsystem:](v5, "setSubsystem:", CFSTR("SSRollableLog"));
    -[SSLogConfig setSubsystem:](v5, "setSubsystem:", CFSTR("com.apple.StoreServices"));
    v6 = v5;
    if (!v5)
      v6 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v7 = -[SSLogConfig shouldLog](v6, "shouldLog");
    if (-[SSLogConfig shouldLogToDisk](v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    if (!os_log_type_enabled((os_log_t)-[SSLogConfig OSLogObject](v6, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v8 &= 2u;
    if (v8)
    {
      v9 = -[SSLogFileOptions logDirectoryPath](self->_options, "logDirectoryPath");
      v32 = 138412546;
      v33 = v9;
      v34 = 2112;
      v35 = v31;
      LODWORD(v27) = 22;
      v26 = &v32;
      v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        v11 = (void *)v10;
        v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v32, v27);
        free(v11);
        SSFileLog(v6, CFSTR("%@"), v13, v14, v15, v16, v17, v18, v12);
      }
    }

  }
  v19 = open((const char *)objc_msgSend(-[SSRollableLog _activeLogFilePath](self, "_activeLogFilePath", v26), "fileSystemRepresentation"), 522, 384);
  if ((v19 & 0x80000000) == 0)
  {
    v20 = v19;
    v21 = (NSFileHandle *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v19, 1);
    self->_fileHandle = v21;
    -[NSFileHandle seekToEndOfFile](v21, "seekToEndOfFile");
    v22 = dup(v20);
    v23 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DE8], v22, 0x61uLL, (dispatch_queue_t)self->_dispatchQueue);
    v24 = MEMORY[0x1E0C809B0];
    self->_fileObserverSource = v23;
    handler[0] = v24;
    handler[1] = 3221225472;
    handler[2] = __29__SSRollableLog__openLogFile__block_invoke;
    handler[3] = &unk_1E47B8B68;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v23, handler);
    fileObserverSource = self->_fileObserverSource;
    v28[0] = v24;
    v28[1] = 3221225472;
    v28[2] = __29__SSRollableLog__openLogFile__block_invoke_2;
    v28[3] = &__block_descriptor_36_e5_v8__0l;
    v29 = v22;
    dispatch_source_set_cancel_handler(fileObserverSource, v28);
    dispatch_resume((dispatch_object_t)self->_fileObserverSource);
  }
}

uint64_t __29__SSRollableLog__openLogFile__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_closeLogFile");
  return objc_msgSend(*(id *)(a1 + 32), "_openLogFile");
}

uint64_t __29__SSRollableLog__openLogFile__block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)_rollLogFiles
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  -[SSRollableLog _closeLogFile](self, "_closeLogFile");
  v3 = -[SSLogFileOptions maxNumberOfLogFiles](self->_options, "maxNumberOfLogFiles");
  objc_msgSend(v6, "removeItemAtPath:error:", -[SSRollableLog _logFilePathWithIndex:](self, "_logFilePathWithIndex:", v3 - 1), 0);
  v4 = v3 - 2;
  if (v3 >= 2)
  {
    do
    {
      v5 = v4;
      objc_msgSend(v6, "moveItemAtPath:toPath:error:", -[SSRollableLog _logFilePathWithIndex:](self, "_logFilePathWithIndex:", v4), -[SSRollableLog _logFilePathWithIndex:](self, "_logFilePathWithIndex:", v4 + 1), 0);
      v4 = v5 - 1;
    }
    while (v5);
  }
  -[SSRollableLog _openLogFile](self, "_openLogFile");

}

@end
