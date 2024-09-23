@implementation SKDiskResizerBase

- (SKDiskResizerBase)initWithDisk:(id)a3 requestedSize:(unint64_t)a4
{
  id v7;
  SKDiskResizerBase *v8;
  SKDiskResizerBase *v9;
  uint64_t v10;
  SKProgress *progress;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SKDiskResizerBase;
  v8 = -[SKDiskResizerBase init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_disk, a3);
    v9->_requestedSize = a4;
    v9->_originalSize = -[SKDiskResizerBase currentSize](v9, "currentSize");
    +[SKProgress progressWithTotalUnitCount:](SKProgress, "progressWithTotalUnitCount:", 100);
    v10 = objc_claimAutoreleasedReturnValue();
    progress = v9->_progress;
    v9->_progress = (SKProgress *)v10;

  }
  return v9;
}

- (int64_t)completedUnitCount
{
  void *v2;
  int64_t v3;

  -[SKDiskResizerBase progress](self, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "completedUnitCount");

  return v3;
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  void *v5;
  id v6;

  -[SKDiskResizerBase resizeError](self, "resizeError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (a3 >= 100)
      a3 = 100;
    -[SKDiskResizerBase progress](self, "progress");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCompletedUnitCount:", a3);

  }
}

- (unint64_t)currentSize
{
  void *v2;
  unint64_t v3;

  -[SKDiskResizerBase disk](self, "disk");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unformattedSize");

  return v3;
}

- (BOOL)resizeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[SKDiskResizerBase resizeStateMachine:](self, "resizeStateMachine:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKDiskResizerBase setActiveFSM:](self, "setActiveFSM:", v5);

  -[SKDiskResizerBase activeFSM](self, "activeFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SKDiskResizerBase activeFSM](self, "activeFSM");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v7, "runWithError:", &v16);
    v8 = v16;

    -[SKDiskResizerBase resizeError](self, "resizeError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SKDiskResizerBase resizeError](self, "resizeError");
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = v10;
    }
    if (a3)
      *a3 = objc_retainAutorelease(v8);
    -[SKDiskResizerBase setActiveFSM:](self, "setActiveFSM:", 0);
    -[SKDiskResizerBase progress](self, "progress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "totalUnitCount");
    -[SKDiskResizerBase progress](self, "progress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCompletedUnitCount:", v12);

    v14 = v8 == 0;
  }
  else
  {
    SKGetOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[SKDiskResizerBase resizeWithError:]";
      _os_log_impl(&dword_22FE50000, v8, OS_LOG_TYPE_ERROR, "%s: Can't create FSM for resize", buf, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

- (id)resizeStateMachine:(id *)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("com.apple.storagekit.notimplemented"), CFSTR("A required method is not implemented"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise");

  return 0;
}

- (id)eventFromSize
{
  unint64_t v3;
  unint64_t v4;
  __CFString **v5;

  v3 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
  v4 = -[SKDiskResizerBase originalSize](self, "originalSize");
  v5 = &kGrowEvent;
  if (v3 <= v4)
    v5 = &kShrinkEvent;
  return *v5;
}

- (id)cancelWithError:(id *)a3
{
  id v5;

  v5 = +[SKError errorWithPOSIXCode:error:](SKError, "errorWithPOSIXCode:error:", 89, a3);
  return -[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", a3);
}

- (id)rollbackResize:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (a3 && (v5 = *a3) != 0)
  {
    v6 = v5;
    -[SKDiskResizerBase resizeError](self, "resizeError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    SKGetOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[SKDiskResizerBase resizeError](self, "resizeError");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 136315650;
        v16 = "-[SKDiskResizerBase rollbackResize:]";
        v17 = 2112;
        v18 = v6;
        v19 = 2112;
        v20 = (unint64_t)v10;
        _os_log_impl(&dword_22FE50000, v9, OS_LOG_TYPE_ERROR, "%s: Failing resize with %@ after attempt to recover from %@", (uint8_t *)&v15, 0x20u);

      }
      -[SKDiskResizerBase resizeError](self, "resizeError");
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      return 0;
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315906;
        v16 = "-[SKDiskResizerBase rollbackResize:]";
        v17 = 2112;
        v18 = v6;
        v19 = 2048;
        v20 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
        v21 = 2048;
        v22 = -[SKDiskResizerBase originalSize](self, "originalSize");
        _os_log_impl(&dword_22FE50000, v9, OS_LOG_TYPE_DEFAULT, "%s: Rolling back resize after %@, reverting resize direction from %llu to %llu", (uint8_t *)&v15, 0x2Au);
      }

      -[SKDiskResizerBase setResizeError:](self, "setResizeError:", v6);
      v13 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
      -[SKDiskResizerBase setRequestedSize:](self, "setRequestedSize:", -[SKDiskResizerBase originalSize](self, "originalSize"));
      -[SKDiskResizerBase setOriginalSize:](self, "setOriginalSize:", v13);
      -[SKDiskResizerBase eventFromSize](self, "eventFromSize");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      return v14;
    }
  }
  else
  {
    SKGetOSLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315138;
      v16 = "-[SKDiskResizerBase rollbackResize:]";
      _os_log_impl(&dword_22FE50000, v12, OS_LOG_TYPE_ERROR, "%s: Reached resize rollback without setting any error", (uint8_t *)&v15, 0xCu);
    }

    +[SKError nilWithSKErrorCode:error:](SKError, "nilWithSKErrorCode:error:", 102, a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (SKDisk)disk
{
  return self->_disk;
}

- (void)setDisk:(id)a3
{
  objc_storeStrong((id *)&self->_disk, a3);
}

- (unint64_t)requestedSize
{
  return self->_requestedSize;
}

- (void)setRequestedSize:(unint64_t)a3
{
  self->_requestedSize = a3;
}

- (SKProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (SKStateMachine)activeFSM
{
  return self->_activeFSM;
}

- (void)setActiveFSM:(id)a3
{
  objc_storeStrong((id *)&self->_activeFSM, a3);
}

- (NSError)resizeError
{
  return self->_resizeError;
}

- (void)setResizeError:(id)a3
{
  objc_storeStrong((id *)&self->_resizeError, a3);
}

- (unint64_t)originalSize
{
  return self->_originalSize;
}

- (void)setOriginalSize:(unint64_t)a3
{
  self->_originalSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resizeError, 0);
  objc_storeStrong((id *)&self->_activeFSM, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_disk, 0);
}

@end
