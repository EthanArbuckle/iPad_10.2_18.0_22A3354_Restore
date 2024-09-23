@implementation SCRDFileReader

- (SCRDFileReader)initWithDelegate:(id)a3 fileHandle:(id)a4
{
  id v6;
  id v7;
  SCRDFileReader *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSThread *readerThread;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCRDFileReader;
  v8 = -[SCRDFileReader init](&v14, sel_init);
  if (v8)
  {
    if (v6 && v7 && (objc_msgSend(v7, "fileDescriptor") & 0x80000000) == 0)
    {
      objc_storeWeak((id *)&v8->_delegate, v6);
      objc_storeStrong((id *)&v8->_fileHandle, a4);
      v15[1] = CFSTR("fd");
      v16[0] = v6;
      v15[0] = CFSTR("delegate");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSFileHandle fileDescriptor](v8->_fileHandle, "fileDescriptor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17F0]), "initWithTarget:selector:object:", v8, sel__readHandler_, v10);
      readerThread = v8->_readerThread;
      v8->_readerThread = (NSThread *)v11;

    }
    else
    {
      v10 = v8;
      v8 = 0;
    }

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[NSThread cancel](self->_readerThread, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)SCRDFileReader;
  -[SCRDFileReader dealloc](&v3, sel_dealloc);
}

- (void)start
{
  int *p_threadStartCount;

  p_threadStartCount = &self->_threadStartCount;
  while (!__ldxr((unsigned int *)p_threadStartCount))
  {
    if (!__stxr(1u, (unsigned int *)p_threadStartCount))
    {
      -[NSThread start](self->_readerThread, "start");
      return;
    }
  }
  __clrex();
}

- (BOOL)hasStarted
{
  return self->_threadStartCount > 0;
}

- (void)invalidate
{
  -[SCRDFileReader invalidateWithWait:](self, "invalidateWithWait:", 0);
}

- (void)invalidateWithWait:(BOOL)a3
{
  NSThread *readerThread;
  _BOOL4 v5;

  readerThread = self->_readerThread;
  if (a3)
  {
    v5 = -[NSThread isExecuting](readerThread, "isExecuting");
    -[NSThread cancel](self->_readerThread, "cancel");
    if (v5 && !-[NSThread isFinished](self->_readerThread, "isFinished"))
    {
      do
        objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 0.100000001);
      while (!-[NSThread isFinished](self->_readerThread, "isFinished"));
    }
  }
  else
  {
    -[NSThread cancel](readerThread, "cancel");
  }
}

- (BOOL)isValid
{
  if (-[NSThread isCancelled](self->_readerThread, "isCancelled"))
    return !-[SCRDFileReader hasStarted](self, "hasStarted");
  else
    return 1;
}

- (void)_readHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  ssize_t v10;
  timeval v11;
  fd_set v12;
  _BYTE v13[1024];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("fd"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");
  if (!v6)
    goto LABEL_12;
  v8 = v7;
  if ((v7 & 0x80000000) != 0)
    goto LABEL_12;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread", 0, 100000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isCancelled") & 1) != 0)
    goto LABEL_11;
  while (1)
  {
    memset(&v12, 0, sizeof(v12));
    if (__darwin_check_fd_set_overflow(v8, &v12, 0))
      v12.fds_bits[v8 >> 5] |= 1 << v8;
    if (select(v8 + 1, &v12, 0, 0, &v11) != 1)
      goto LABEL_10;
    v10 = read(v8, v13, 0x400uLL);
    if (v10 < 1)
      break;
    objc_msgSend(v5, "fileReader:data:length:", self, v13, v10);
LABEL_10:
    if (objc_msgSend(v9, "isCancelled"))
      goto LABEL_11;
  }
  if ((v10 & 0x8000000000000000) == 0)
    goto LABEL_10;
  NSLog(CFSTR("Error: Read thread failure"));
LABEL_11:

LABEL_12:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_readerThread, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
