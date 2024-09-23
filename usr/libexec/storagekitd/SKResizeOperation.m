@implementation SKResizeOperation

- (SKResizeOperation)initWithDisk:(id)a3 toSize:(unint64_t)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  SKResizeOperation *v10;
  SKResizeOperation *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SKResizeOperation;
  v10 = -[SKManagerOperation init](&v14, "init");
  v11 = v10;
  if (v10)
  {
    -[SKResizeOperation setTargetDisk:](v10, "setTargetDisk:", v8);
    -[SKResizeOperation setSize:](v11, "setSize:", a4);
    -[SKResizeOperation setCallbackBlock:](v11, "setCallbackBlock:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SKProgress progressWithTotalUnitCount:](SKProgress, "progressWithTotalUnitCount:", 100));
    -[SKManagerOperation setSkProgress:](v11, "setSkProgress:", v12);

  }
  return v11;
}

- (BOOL)run
{
  void *v3;
  unsigned int v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKResizeOperation targetDisk](self, "targetDisk"));
  v4 = objc_msgSend(v3, "isWholeDisk");

  if (v4)
  {
    v10 = 0;
    -[SKResizeOperation resizeLastPartitionWithError:](self, "resizeLastPartitionWithError:", &v10);
    v5 = v10;
  }
  else
  {
    v6 = sub_10000BA9C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[SKResizeOperation run]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: Resize operation (on iOS) is currently supported only for whole disks", buf, 0xCu);
    }

    v5 = (id)objc_claimAutoreleasedReturnValue(+[SKError errorWithPOSIXCode:error:](SKError, "errorWithPOSIXCode:error:", 45, 0));
  }
  v8 = v5;
  -[SKResizeOperation finishWithError:](self, "finishWithError:", v5);

  return 1;
}

- (void)finishWithError:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v8 = a3;
  if (!v8)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKManagerOperation skProgress](self, "skProgress"));
    v5 = objc_msgSend(v4, "totalUnitCount");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKManagerOperation skProgress](self, "skProgress"));
    objc_msgSend(v6, "setCompletedUnitCount:", v5);

  }
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SKResizeOperation callbackBlock](self, "callbackBlock"));
  ((void (**)(_QWORD, id))v7)[2](v7, v8);

  -[SKManagerOperation finished](self, "finished");
}

- (BOOL)resizeLastPartitionWithError:(id *)a3
{
  SKLastPartitionResizer *v5;
  void *v6;
  SKLastPartitionResizer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v5 = [SKLastPartitionResizer alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKResizeOperation targetDisk](self, "targetDisk"));
  v7 = -[SKDiskResizerBase initWithDisk:requestedSize:](v5, "initWithDisk:requestedSize:", v6, -[SKResizeOperation size](self, "size"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKManagerOperation skProgress](self, "skProgress"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase progress](v7, "progress"));
  objc_msgSend(v8, "chainChildProgress:withPendingUnitCount:", v9, 100);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitionResizer resizeStateMachine:](v7, "resizeStateMachine:", a3));
  v11 = v10;
  if (v10)
    v12 = objc_msgSend(v10, "runWithError:", a3);
  else
    v12 = 0;

  return v12;
}

- (SKDisk)targetDisk
{
  return (SKDisk *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTargetDisk:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (id)callbackBlock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setCallbackBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (SKLastPartitionResizer)lastPartResizer
{
  return self->_lastPartResizer;
}

- (void)setLastPartResizer:(id)a3
{
  objc_storeStrong((id *)&self->_lastPartResizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPartResizer, 0);
  objc_storeStrong(&self->_callbackBlock, 0);
  objc_storeStrong((id *)&self->_targetDisk, 0);
}

@end
