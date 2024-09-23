@implementation SSSoftwareUpdatesRequest

- (SSSoftwareUpdatesRequest)initWithUpdateQueueContext:(id)a3
{
  SSSoftwareUpdatesRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSSoftwareUpdatesRequest;
  v4 = -[SSRequest init](&v6, sel_init);
  if (v4)
    v4->_context = (SSSoftwareUpdatesContext *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSSoftwareUpdatesRequest;
  -[SSRequest dealloc](&v3, sel_dealloc);
}

- (void)startWithUpdatesResponseBlock:(id)a3
{
  NSObject *global_queue;
  _QWORD block[5];

  if (a3)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__SSSoftwareUpdatesRequest_startWithUpdatesResponseBlock___block_invoke;
    block[3] = &unk_1E47B8E90;
    block[4] = a3;
    dispatch_async(global_queue, block);
  }
}

uint64_t __58__SSSoftwareUpdatesRequest_startWithUpdatesResponseBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = SSError((uint64_t)CFSTR("SSErrorDomain"), 106, 0, 0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v1 + 16))(v1, 0, v2);
}

- (SSSoftwareUpdatesContext)updateQueueContext
{
  return self->_context;
}

- (BOOL)start
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__SSSoftwareUpdatesRequest_start__block_invoke;
  v3[3] = &unk_1E47BB628;
  v3[4] = self;
  -[SSSoftwareUpdatesRequest startWithUpdatesResponseBlock:](self, "startWithUpdatesResponseBlock:", v3);
  return 1;
}

void __33__SSSoftwareUpdatesRequest_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD block[7];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SSSoftwareUpdatesRequest_start__block_invoke_2;
  block[3] = &unk_1E47B9E88;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = a2;
  block[6] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __33__SSSoftwareUpdatesRequest_start__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
  if (*(_QWORD *)(a1 + 40))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "updateQueueRequest:didReceiveResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(v2, "requestDidFinish:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(v2, "request:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  return result;
}

- (void)startWithCompletionBlock:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__SSSoftwareUpdatesRequest_startWithCompletionBlock___block_invoke;
  v3[3] = &unk_1E47BB650;
  v3[4] = a3;
  -[SSSoftwareUpdatesRequest startWithUpdatesResponseBlock:](self, "startWithUpdatesResponseBlock:", v3);
}

uint64_t __53__SSSoftwareUpdatesRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "50", (__CFString *)self->_context);
  return v3;
}

- (SSSoftwareUpdatesRequest)initWithXPCEncoding:(id)a3
{
  SSSoftwareUpdatesRequest *v5;
  SSSoftwareUpdatesRequest *v7;
  objc_super v8;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v8.receiver = self;
    v8.super_class = (Class)SSSoftwareUpdatesRequest;
    v7 = -[SSRequest init](&v8, sel_init);
    v5 = v7;
    if (v7)
    {

      v5->_context = -[SSSoftwareUpdatesContext initWithXPCEncoding:]([SSSoftwareUpdatesContext alloc], "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "50"));
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

@end
