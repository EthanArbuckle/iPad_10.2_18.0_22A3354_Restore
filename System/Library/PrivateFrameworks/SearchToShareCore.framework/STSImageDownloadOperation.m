@implementation STSImageDownloadOperation

- (STSImageDownloadOperation)initWithRequest:(id)a3 session:(id)a4 begin:(id)a5 progress:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  STSImageDownloadOperation *v18;
  STSImageDownloadOperation *v19;
  uint64_t v20;
  id begin;
  uint64_t v22;
  id progress;
  uint64_t v24;
  id completion;
  uint64_t v26;
  NSURLSessionDownloadTask *task;
  objc_super v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)STSImageDownloadOperation;
  v18 = -[STSImageDownloadOperation init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_request, a3);
    v20 = objc_msgSend(v15, "copy");
    begin = v19->_begin;
    v19->_begin = (id)v20;

    v22 = objc_msgSend(v16, "copy");
    progress = v19->_progress;
    v19->_progress = (id)v22;

    v24 = MEMORY[0x227672A18](v17);
    completion = v19->_completion;
    v19->_completion = (id)v24;

    objc_msgSend(v14, "downloadTaskWithRequest:", v13);
    v26 = objc_claimAutoreleasedReturnValue();
    task = v19->_task;
    v19->_task = (NSURLSessionDownloadTask *)v26;

  }
  return v19;
}

- (void)start
{
  if (-[STSImageDownloadOperation isCancelled](self, "isCancelled"))
  {
    -[STSImageDownloadOperation setFinished:](self, "setFinished:", 1);
  }
  else
  {
    -[STSImageDownloadOperation setExecuting:](self, "setExecuting:", 1);
    -[STSImageDownloadOperation main](self, "main");
  }
}

- (void)main
{
  void (**begin)(id, SEL);

  begin = (void (**)(id, SEL))self->_begin;
  if (begin)
    begin[2](begin, a2);
  -[NSURLSessionDownloadTask resume](self->_task, "resume");
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  STSImageDownloadOperation *v2;
  BOOL executing;

  v2 = self;
  objc_sync_enter(v2);
  executing = v2->_executing;
  objc_sync_exit(v2);

  return executing;
}

- (void)setExecuting:(BOOL)a3
{
  STSImageDownloadOperation *v5;

  if (-[STSImageDownloadOperation isExecuting](self, "isExecuting") != a3)
  {
    -[STSImageDownloadOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    v5 = self;
    objc_sync_enter(v5);
    v5->_executing = a3;
    objc_sync_exit(v5);

    -[STSImageDownloadOperation didChangeValueForKey:](v5, "didChangeValueForKey:", CFSTR("isExecuting"));
  }
}

- (void)cancel
{
  objc_super v3;

  -[NSURLSessionDownloadTask cancel](self->_task, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)STSImageDownloadOperation;
  -[STSImageDownloadOperation cancel](&v3, sel_cancel);
}

- (BOOL)isFinished
{
  STSImageDownloadOperation *v2;
  BOOL finished;

  v2 = self;
  objc_sync_enter(v2);
  finished = v2->_finished;
  objc_sync_exit(v2);

  return finished;
}

- (void)setFinished:(BOOL)a3
{
  STSImageDownloadOperation *v5;

  if (-[STSImageDownloadOperation isFinished](self, "isFinished") != a3)
  {
    -[STSImageDownloadOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    v5 = self;
    objc_sync_enter(v5);
    v5->_finished = a3;
    objc_sync_exit(v5);

    -[STSImageDownloadOperation didChangeValueForKey:](v5, "didChangeValueForKey:", CFSTR("isFinished"));
  }
}

- (void)updateProgressWithTotalBytesWritten:(int64_t)a3 totalBytesExpectedToWrite:(int64_t)a4
{
  void (**progress)(id, int64_t, int64_t);

  progress = (void (**)(id, int64_t, int64_t))self->_progress;
  if (progress)
    progress[2](progress, a3, a4);
}

- (void)completedWithResponse:(id)a3 location:(id)a4 timingData:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void (**completion)(id, id, id, void *, id);
  id v23;
  _QWORD v24[3];
  _QWORD v25[3];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_msgSend(v10, "statusCode");
    v15 = v14;
    if (v11 && v14 == 200)
      goto LABEL_8;
  }
  else
  {
    v15 = -1;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v13;
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "image downloaded error %@", buf, 0xCu);
  }
LABEL_8:
  v23 = 0;
  objc_msgSend(v11, "getResourceValue:forKey:error:", &v23, *MEMORY[0x24BDBCC48], 0);
  v16 = v23;
  v24[0] = CFSTR("STSImageDownloadOperationStatusCode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v15);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  v19 = &unk_24E7570B8;
  if (v16)
    v19 = v16;
  v25[0] = v17;
  v25[1] = v19;
  v24[1] = CFSTR("STSImageDownloadOperationSize");
  v24[2] = CFSTR("STSImageDownloadOperationTimingData");
  if (v12)
    v20 = v12;
  else
    v20 = (id)MEMORY[0x24BDBD1B8];
  v25[2] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  completion = (void (**)(id, id, id, void *, id))self->_completion;
  if (completion)
    completion[2](completion, v10, v11, v21, v13);
  -[STSImageDownloadOperation _markAsCompleted](self, "_markAsCompleted");

}

- (void)_markAsCompleted
{
  if (-[STSImageDownloadOperation isExecuting](self, "isExecuting"))
  {
    -[STSImageDownloadOperation setExecuting:](self, "setExecuting:", 0);
    -[STSImageDownloadOperation setFinished:](self, "setFinished:", 1);
  }
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_progress, 0);
  objc_storeStrong(&self->_begin, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end
