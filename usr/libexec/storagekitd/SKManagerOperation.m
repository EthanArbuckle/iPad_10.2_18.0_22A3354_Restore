@implementation SKManagerOperation

- (SKManagerOperation)init
{
  SKManagerOperation *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *finishedSemaphore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKManagerOperation;
  v2 = -[SKManagerOperation init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_semaphore_create(0);
    finishedSemaphore = v2->_finishedSemaphore;
    v2->_finishedSemaphore = (OS_dispatch_semaphore *)v3;

  }
  return v2;
}

- (BOOL)run
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("No implementation provided for generic base class."), 0));
  objc_exception_throw(v2);
}

- (void)finished
{
  void *v3;
  NSObject *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  objc_msgSend(v3, "_advanceOperationQueue");

  v4 = objc_claimAutoreleasedReturnValue(-[SKManagerOperation finishedSemaphore](self, "finishedSemaphore"));
  dispatch_semaphore_signal(v4);

}

- (void)dmAsyncStartedForDisk:(__DADisk *)a3
{
  double v3;
  void *v5;
  void (**v6)(id, _QWORD, float);

  LODWORD(v3) = 0;
  -[SKManagerOperation setProgress:](self, "setProgress:", a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKManagerOperation progressHandler](self, "progressHandler"));

  if (v5)
  {
    v6 = (void (**)(id, _QWORD, float))objc_claimAutoreleasedReturnValue(-[SKManagerOperation progressHandler](self, "progressHandler"));
    v6[2](v6, 0, 0.0);

  }
}

- (void)dmAsyncProgressForDisk:(__DADisk *)a3 barberPole:(BOOL)a4 percent:(float)a5
{
  void *v7;
  double v8;
  void (**v9)(id, _QWORD, float);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKManagerOperation progressHandler](self, "progressHandler", a3, a4));

  if (v7)
  {
    *(float *)&v8 = a5;
    -[SKManagerOperation setProgress:](self, "setProgress:", v8);
    v9 = (void (**)(id, _QWORD, float))objc_claimAutoreleasedReturnValue(-[SKManagerOperation progressHandler](self, "progressHandler"));
    v9[2](v9, 0, a5);

  }
}

- (void)dmAsyncMessageForDisk:(__DADisk *)a3 string:(id)a4 dictionary:(id)a5
{
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v8 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKManagerOperation progressHandler](self, "progressHandler"));

  if (v6)
  {
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SKManagerOperation progressHandler](self, "progressHandler"));
    -[SKManagerOperation progress](self, "progress");
    ((void (**)(_QWORD, id))v7)[2](v7, v8);

  }
}

- (void)dmAsyncFinishedForDisk:(__DADisk *)a3 mainError:(int)a4 detailError:(int)a5 dictionary:(id)a6
{
  void *v7;
  double v8;
  void (**v9)(id, _QWORD);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKManagerOperation progressHandler](self, "progressHandler", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6));

  if (v7)
  {
    LODWORD(v8) = 1120403456;
    -[SKManagerOperation setProgress:](self, "setProgress:", v8);
    v9 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue(-[SKManagerOperation progressHandler](self, "progressHandler"));
    -[SKManagerOperation progress](self, "progress");
    v9[2](v9, 0);

  }
}

- (id)validateWithRecachedDisk:(id)a3 error:(id)a4
{
  SKManagerOperation *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  SKManagerOperation *v18;

  v6 = (SKManagerOperation *)a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
LABEL_3:
    v10 = v9;
    goto LABEL_8;
  }
  v11 = sub_10000BA9C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (!v6)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315394;
      v16 = "-[SKManagerOperation validateWithRecachedDisk:error:]";
      v17 = 2112;
      v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: Disk recache failed, failing %@", (uint8_t *)&v15, 0x16u);
    }

    v9 = (id)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 117, 0));
    goto LABEL_3;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "-[SKManagerOperation validateWithRecachedDisk:error:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Disk recached successfully: %@", (uint8_t *)&v15, 0x16u);
  }

  v10 = 0;
LABEL_8:

  return v10;
}

- (id)redactedDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self);
  return NSStringFromClass(v2);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SKProgress)skProgress
{
  return self->_skProgress;
}

- (void)setSkProgress:(id)a3
{
  objc_storeStrong((id *)&self->_skProgress, a3);
}

- (OS_dispatch_semaphore)finishedSemaphore
{
  return self->_finishedSemaphore;
}

- (void)setFinishedSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_finishedSemaphore, a3);
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedSemaphore, 0);
  objc_storeStrong((id *)&self->_skProgress, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

@end
