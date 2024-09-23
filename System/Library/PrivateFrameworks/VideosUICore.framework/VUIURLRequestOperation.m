@implementation VUIURLRequestOperation

- (VUIURLRequestOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VUIURLRequestOperation)initWithRequest:(id)a3
{
  return -[VUIURLRequestOperation initWithRequest:session:](self, "initWithRequest:session:", a3, 0);
}

- (VUIURLRequestOperation)initWithRequest:(id)a3 session:(id)a4
{
  id v7;
  id v8;
  VUIURLRequestOperation *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("request"));
  v11.receiver = self;
  v11.super_class = (Class)VUIURLRequestOperation;
  v9 = -[VUIURLRequestOperation init](&v11, sel_init);
  if (v9)
  {
    if (initWithRequest_session__onceToken != -1)
      dispatch_once(&initWithRequest_session__onceToken, &__block_literal_global_10);
    objc_storeStrong((id *)&v9->_request, a3);
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v9->_session, v8);
  }

  return v9;
}

uint64_t __50__VUIURLRequestOperation_initWithRequest_session___block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&__TimebaseInfo);
}

- (unint64_t)elapsedTimeInMilliseconds
{
  unint64_t result;
  uint64_t v4;
  unint64_t v5;

  result = -[VUIURLRequestOperation taskStartTime](self, "taskStartTime");
  if (result)
  {
    v4 = mach_absolute_time();
    v5 = -[VUIURLRequestOperation taskStartTime](self, "taskStartTime");
    return (v4 - v5) * (__TimebaseInfo / *(_DWORD *)algn_1F01D0B64) / 0xF4240;
  }
  return result;
}

- (void)executionDidBegin
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, void *, void *);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  -[VUIURLRequestOperation session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIURLRequestOperation request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __43__VUIURLRequestOperation_executionDidBegin__block_invoke;
  v9 = &unk_1E9F2BE30;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "dataTaskWithRequest:completionHandler:", v4, &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIURLRequestOperation setTaskStartTime:](self, "setTaskStartTime:", mach_absolute_time(), v6, v7, v8, v9);
  objc_msgSend(v5, "resume");

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __43__VUIURLRequestOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setData:", v11);
    objc_msgSend(v10, "setResponse:", v7);
    objc_msgSend(v10, "setError:", v8);
    objc_msgSend(v10, "_handleResponse:responseData:error:", v7, v11, v8);
    objc_msgSend(v10, "finishExecutionIfPossible");
  }

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIURLRequestOperation;
  -[VUIURLRequestOperation cancel](&v4, sel_cancel);
  -[VUIURLRequestOperation task](self, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[VUIAsynchronousOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSURLResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSURLSessionDataTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (unint64_t)taskStartTime
{
  return self->_taskStartTime;
}

- (void)setTaskStartTime:(unint64_t)a3
{
  self->_taskStartTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
