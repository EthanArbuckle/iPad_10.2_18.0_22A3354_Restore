@implementation MSDSessionTask

- (id)initFromTaskInfo:(id)a3
{
  id v4;
  MSDSessionTask *v5;
  MSDSessionTask *v6;
  MSDSessionTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSDSessionTask;
  v5 = -[MSDSessionTask init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[MSDSessionTask setInfo:](v5, "setInfo:", v4);
    -[MSDSessionTask resetFileHandle](v6, "resetFileHandle");
    -[MSDSessionTask resetData](v6, "resetData");
    v7 = v6;
  }

  return v6;
}

- (void)resetFileHandle
{
  void *v3;
  void *v4;
  MSDPartialDownload *v5;
  void *v6;
  void *v7;
  MSDPartialDownload *v8;
  void *v9;
  void *v10;
  MSDPartialDownload *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTask info](self, "info"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "savePath"));

  if (v4)
  {
    v5 = [MSDPartialDownload alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTask info](self, "info"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "savePath"));
    v8 = -[MSDPartialDownload initWithFilePath:](v5, "initWithFilePath:", v7);
    -[MSDSessionTask setContentRange:](self, "setContentRange:", v8);

    v11 = (MSDPartialDownload *)objc_claimAutoreleasedReturnValue(-[MSDSessionTask info](self, "info"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPartialDownload savePath](v11, "savePath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTask prepareToWrite:](self, "prepareToWrite:", v9));
    -[MSDSessionTask setFileHandle:](self, "setFileHandle:", v10);

  }
  else
  {
    v11 = objc_alloc_init(MSDPartialDownload);
    -[MSDSessionTask setContentRange:](self, "setContentRange:");
  }

}

- (void)resetData
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 0));
  -[MSDSessionTask setOutData:](self, "setOutData:", v3);

}

- (id)prepareToWrite:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) != 0)
  {
    v6 = 0;
    goto LABEL_6;
  }
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByDeletingLastPathComponent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v19 = 0;
  v9 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v19);
  v6 = v19;

  if ((v9 & 1) == 0)
  {
    v16 = sub_1000604F0();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1000BE224((uint64_t)v7, v6);
    goto LABEL_15;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = objc_msgSend(v10, "createFileAtPath:contents:attributes:", v3, 0, 0);

  if ((v11 & 1) == 0)
  {
    v18 = sub_1000604F0();
    v17 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1000BE17C();
LABEL_15:

LABEL_16:
    v13 = 0;
    goto LABEL_8;
  }

LABEL_6:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForWritingAtPath:](NSFileHandle, "fileHandleForWritingAtPath:", v3));
  if (!v12)
  {
    v15 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000BE118();
    goto LABEL_16;
  }
  v13 = v12;
  objc_msgSend(v12, "seekToEndOfFile");
  fcntl((int)objc_msgSend(v13, "fileDescriptor"), 48, 1);
LABEL_8:

  return v13;
}

- (NSURLSessionTask)task
{
  return (NSURLSessionTask *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (MSDSessionTaskInfo)info
{
  return (MSDSessionTaskInfo *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (MSDPartialDownload)contentRange
{
  return (MSDPartialDownload *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContentRange:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int64_t)currentRetry
{
  return self->_currentRetry;
}

- (void)setCurrentRetry:(int64_t)a3
{
  self->_currentRetry = a3;
}

- (NSMutableData)outData
{
  return (NSMutableData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOutData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSFileHandle)fileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFileHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (BOOL)redirected
{
  return self->_redirected;
}

- (void)setRedirected:(BOOL)a3
{
  self->_redirected = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_outData, 0);
  objc_storeStrong((id *)&self->_contentRange, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end
