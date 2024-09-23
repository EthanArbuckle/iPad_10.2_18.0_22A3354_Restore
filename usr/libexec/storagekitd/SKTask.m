@implementation SKTask

- (SKTask)initWithExecutable:(id)a3 arguments:(id)a4
{
  id v6;
  id v7;
  SKTask *v8;
  NSTask *v9;
  NSTask *task;
  NSTask *v11;
  void *v12;
  NSTask *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSFileHandle *stdoutHandle;
  void *v18;
  uint64_t v19;
  NSFileHandle *stderrHandle;
  SKTaskNOOPParser *v21;
  SKTaskNOOPParser *v22;
  uint64_t v23;
  NSProgress *progress;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SKTask;
  v8 = -[SKTask init](&v26, "init");
  if (v8)
  {
    v9 = (NSTask *)objc_alloc_init((Class)NSTask);
    task = v8->_task;
    v8->_task = v9;

    -[NSTask setExecutableURL:](v8->_task, "setExecutableURL:", v6);
    -[NSTask setArguments:](v8->_task, "setArguments:", v7);
    v11 = v8->_task;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPipe pipe](NSPipe, "pipe"));
    -[NSTask setStandardOutput:](v11, "setStandardOutput:", v12);

    v13 = v8->_task;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPipe pipe](NSPipe, "pipe"));
    -[NSTask setStandardError:](v13, "setStandardError:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSTask standardOutput](v8->_task, "standardOutput"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fileHandleForReading"));
    stdoutHandle = v8->_stdoutHandle;
    v8->_stdoutHandle = (NSFileHandle *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSTask standardError](v8->_task, "standardError"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fileHandleForReading"));
    stderrHandle = v8->_stderrHandle;
    v8->_stderrHandle = (NSFileHandle *)v19;

    v21 = objc_opt_new(SKTaskNOOPParser);
    -[SKTask setStderrParser:](v8, "setStderrParser:", v21);

    v22 = objc_opt_new(SKTaskNOOPParser);
    -[SKTask setStdoutParser:](v8, "setStdoutParser:", v22);

    v23 = objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](NSProgress, "progressWithTotalUnitCount:", 100));
    progress = v8->_progress;
    v8->_progress = (NSProgress *)v23;

  }
  return v8;
}

- (SKTask)initWithExecutable:(id)a3
{
  return -[SKTask initWithExecutable:arguments:](self, "initWithExecutable:arguments:", a3, &__NSArray0__struct);
}

- (BOOL)endedSuccessfully
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask task](self, "task"));
  if ((objc_msgSend(v3, "isRunning") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask task](self, "task"));
    v4 = objc_msgSend(v5, "terminationStatus") == 0;

  }
  return v4;
}

- (BOOL)waitWithError:(id *)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  BOOL v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask task](self, "task"));
  objc_msgSend(v5, "waitUntilExit");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask task](self, "task"));
  v7 = objc_msgSend(v6, "terminationStatus");

  if (a3 && v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask task](self, "task"));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, (int)objc_msgSend(v8, "terminationStatus"), 0));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask task](self, "task"));
  v10 = objc_msgSend(v9, "terminationStatus") == 0;

  return v10;
}

- (SKTaskDataParser)stdoutParser
{
  return self->_stdoutParser;
}

- (void)setStdoutParser:(id)a3
{
  objc_storeStrong((id *)&self->_stdoutParser, a3);
}

- (SKTaskDataParser)stderrParser
{
  return self->_stderrParser;
}

- (void)setStderrParser:(id)a3
{
  objc_storeStrong((id *)&self->_stderrParser, a3);
}

- (NSFileHandle)stdoutHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 24, 1);
}

- (NSFileHandle)stderrHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 32, 1);
}

- (NSTask)task
{
  return (NSTask *)objc_getProperty(self, a2, 40, 1);
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_stderrHandle, 0);
  objc_storeStrong((id *)&self->_stdoutHandle, 0);
  objc_storeStrong((id *)&self->_stderrParser, 0);
  objc_storeStrong((id *)&self->_stdoutParser, 0);
}

@end
