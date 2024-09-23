@implementation TPSURLSessionItem

- (TPSURLSessionTask)sessionTask
{
  return self->_sessionTask;
}

- (TPSURLSessionItem)initWithSessionTask:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  TPSURLSessionItem *v9;
  TPSURLSessionItem *v10;
  uint64_t v11;
  id completionHanlder;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TPSURLSessionItem;
  v9 = -[TPSURLSessionItem init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sessionTask, a3);
    v11 = objc_msgSend(v8, "copy");
    completionHanlder = v10->_completionHanlder;
    v10->_completionHanlder = (id)v11;

    -[TPSURLSessionTask registerDelegate:](v10->_sessionTask, "registerDelegate:", v10);
  }

  return v10;
}

- (int64_t)state
{
  void *v2;
  int64_t v3;

  -[TPSURLSessionTask task](self->_sessionTask, "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  return v3;
}

- (void)resume
{
  -[TPSURLSessionTask resume](self->_sessionTask, "resume");
}

- (void)dealloc
{
  objc_super v3;

  -[TPSURLSessionItem cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)TPSURLSessionItem;
  -[TPSURLSessionItem dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  self->_cancelled = 1;
  -[TPSURLSessionTask unregisterDelegate:](self->_sessionTask, "unregisterDelegate:", self);
  v5 = *MEMORY[0x1E0CB2D50];
  v6[0] = CFSTR("Cancelled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("Request"), -1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSURLSessionItem notifyWithSessionTask:error:](self, "notifyWithSessionTask:error:", 0, v4);

}

- (void)notifyWithSessionTask:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void (**completionHanlder)(id, id, void *, uint64_t, void *, id);
  uint64_t v11;
  id v12;
  id v13;

  if (self->_completionHanlder)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(v7, "formattedData");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataTaskData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastModified");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    completionHanlder = (void (**)(id, id, void *, uint64_t, void *, id))self->_completionHanlder;
    v11 = objc_msgSend(v7, "isCacheData");

    completionHanlder[2](completionHanlder, v13, v8, v11, v9, v6);
    v12 = self->_completionHanlder;
    self->_completionHanlder = 0;

  }
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void)setSessionTask:(id)a3
{
  objc_storeStrong((id *)&self->_sessionTask, a3);
}

- (id)completionHanlder
{
  return self->_completionHanlder;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHanlder, 0);
  objc_storeStrong((id *)&self->_sessionTask, 0);
}

@end
