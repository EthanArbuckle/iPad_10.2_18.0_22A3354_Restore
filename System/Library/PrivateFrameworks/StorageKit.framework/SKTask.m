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
  void *v21;
  void *v22;
  uint64_t v23;
  NSProgress *progress;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SKTask;
  v8 = -[SKTask init](&v26, sel_init);
  if (v8)
  {
    v9 = (NSTask *)objc_alloc_init(MEMORY[0x24BDD17D8]);
    task = v8->_task;
    v8->_task = v9;

    -[NSTask setExecutableURL:](v8->_task, "setExecutableURL:", v6);
    -[NSTask setArguments:](v8->_task, "setArguments:", v7);
    v11 = v8->_task;
    objc_msgSend(MEMORY[0x24BDD1740], "pipe");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSTask setStandardOutput:](v11, "setStandardOutput:", v12);

    v13 = v8->_task;
    objc_msgSend(MEMORY[0x24BDD1740], "pipe");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSTask setStandardError:](v13, "setStandardError:", v14);

    -[NSTask standardOutput](v8->_task, "standardOutput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fileHandleForReading");
    v16 = objc_claimAutoreleasedReturnValue();
    stdoutHandle = v8->_stdoutHandle;
    v8->_stdoutHandle = (NSFileHandle *)v16;

    -[NSTask standardError](v8->_task, "standardError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fileHandleForReading");
    v19 = objc_claimAutoreleasedReturnValue();
    stderrHandle = v8->_stderrHandle;
    v8->_stderrHandle = (NSFileHandle *)v19;

    v21 = (void *)objc_opt_new();
    -[SKTask setStderrParser:](v8, "setStderrParser:", v21);

    v22 = (void *)objc_opt_new();
    -[SKTask setStdoutParser:](v8, "setStdoutParser:", v22);

    objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", 100);
    v23 = objc_claimAutoreleasedReturnValue();
    progress = v8->_progress;
    v8->_progress = (NSProgress *)v23;

  }
  return v8;
}

- (SKTask)initWithExecutable:(id)a3
{
  return -[SKTask initWithExecutable:arguments:](self, "initWithExecutable:arguments:", a3, MEMORY[0x24BDBD1A8]);
}

- (BOOL)endedSuccessfully
{
  void *v3;
  BOOL v4;
  void *v5;

  -[SKTask task](self, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isRunning") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[SKTask task](self, "task");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "terminationStatus") == 0;

  }
  return v4;
}

- (BOOL)waitWithError:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;

  -[SKTask task](self, "task");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "waitUntilExit");

  -[SKTask task](self, "task");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "terminationStatus");

  if (a3 && v7)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BDD1128];
    -[SKTask task](self, "task");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, (int)objc_msgSend(v10, "terminationStatus"), 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[SKTask task](self, "task");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "terminationStatus") == 0;

  return v12;
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
