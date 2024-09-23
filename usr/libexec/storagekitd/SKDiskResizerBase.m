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
  v8 = -[SKDiskResizerBase init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_disk, a3);
    v9->_requestedSize = a4;
    v9->_originalSize = -[SKDiskResizerBase currentSize](v9, "currentSize");
    v10 = objc_claimAutoreleasedReturnValue(+[SKProgress progressWithTotalUnitCount:](SKProgress, "progressWithTotalUnitCount:", 100));
    progress = v9->_progress;
    v9->_progress = (SKProgress *)v10;

  }
  return v9;
}

- (int64_t)completedUnitCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase progress](self, "progress"));
  v3 = objc_msgSend(v2, "completedUnitCount");

  return (int64_t)v3;
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase resizeError](self, "resizeError"));

  if (!v5)
  {
    if (a3 >= 100)
      a3 = 100;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase progress](self, "progress"));
    objc_msgSend(v6, "setCompletedUnitCount:", a3);

  }
}

- (unint64_t)currentSize
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase disk](self, "disk"));
  v3 = objc_msgSend(v2, "unformattedSize");

  return (unint64_t)v3;
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
  id v12;
  void *v13;
  BOOL v14;
  id v15;
  id v17;
  uint8_t buf[4];
  const char *v19;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase resizeStateMachine:](self, "resizeStateMachine:"));
  -[SKDiskResizerBase setActiveFSM:](self, "setActiveFSM:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase activeFSM](self, "activeFSM"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase activeFSM](self, "activeFSM"));
    v17 = 0;
    objc_msgSend(v7, "runWithError:", &v17);
    v8 = v17;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase resizeError](self, "resizeError"));
    if (v9)
    {
      v10 = objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase resizeError](self, "resizeError"));

      v8 = v10;
    }
    if (a3)
      *a3 = objc_retainAutorelease(v8);
    -[SKDiskResizerBase setActiveFSM:](self, "setActiveFSM:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase progress](self, "progress"));
    v12 = objc_msgSend(v11, "totalUnitCount");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase progress](self, "progress"));
    objc_msgSend(v13, "setCompletedUnitCount:", v12);

    v14 = v8 == 0;
  }
  else
  {
    v15 = sub_10000BA9C();
    v8 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[SKDiskResizerBase resizeWithError:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Can't create FSM for resize", buf, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

- (id)resizeStateMachine:(id *)a3
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("com.apple.storagekit.notimplemented"), CFSTR("A required method is not implemented"), 0));
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
  v5 = &off_100051810;
  if (v3 <= v4)
    v5 = &off_100051818;
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
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v13;
  NSObject *v14;
  unint64_t v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  unint64_t v24;

  if (a3 && (v5 = *a3) != 0)
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase resizeError](self, "resizeError"));

    v8 = sub_10000BA9C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase resizeError](self, "resizeError"));
        v17 = 136315650;
        v18 = "-[SKDiskResizerBase rollbackResize:]";
        v19 = 2112;
        v20 = v6;
        v21 = 2112;
        v22 = (unint64_t)v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s: Failing resize with %@ after attempt to recover from %@", (uint8_t *)&v17, 0x20u);

      }
      *a3 = (id)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase resizeError](self, "resizeError"));

      return 0;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315906;
        v18 = "-[SKDiskResizerBase rollbackResize:]";
        v19 = 2112;
        v20 = v6;
        v21 = 2048;
        v22 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
        v23 = 2048;
        v24 = -[SKDiskResizerBase originalSize](self, "originalSize");
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Rolling back resize after %@, reverting resize direction from %llu to %llu", (uint8_t *)&v17, 0x2Au);
      }

      -[SKDiskResizerBase setResizeError:](self, "setResizeError:", v6);
      v15 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
      -[SKDiskResizerBase setRequestedSize:](self, "setRequestedSize:", -[SKDiskResizerBase originalSize](self, "originalSize"));
      -[SKDiskResizerBase setOriginalSize:](self, "setOriginalSize:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase eventFromSize](self, "eventFromSize"));

      return v16;
    }
  }
  else
  {
    v13 = sub_10000BA9C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315138;
      v18 = "-[SKDiskResizerBase rollbackResize:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Reached resize rollback without setting any error", (uint8_t *)&v17, 0xCu);
    }

    return (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithSKErrorCode:error:](SKError, "nilWithSKErrorCode:error:", 102, a3));
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
