@implementation _STKUSSDResponseProvider

- (_STKUSSDResponseProvider)initWithQueue:(id)a3 telephonyClient:(id)a4 options:(id)a5 logger:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  _STKUSSDResponseProvider *v16;
  _STKUSSDResponseProvider *v17;
  uint64_t v18;
  NSDictionary *options;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_STKUSSDResponseProvider.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("telephonyClient"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_STKUSSDResponseProvider.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

  if (!v13)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_STKUSSDResponseProvider.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

LABEL_4:
  v24.receiver = self;
  v24.super_class = (Class)_STKUSSDResponseProvider;
  v16 = -[_STKUSSDResponseProvider init](&v24, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_telephonyClient, a4);
    objc_storeStrong((id *)&v17->_queue, a3);
    v18 = objc_msgSend(v14, "copy");
    options = v17->_options;
    v17->_options = (NSDictionary *)v18;

    objc_storeStrong((id *)&v17->_logger, a6);
  }

  return v17;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_STKUSSDResponseProvider;
  -[_STKUSSDResponseProvider dealloc](&v2, sel_dealloc);
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (BOOL)hasSentResponse
{
  return self->_hasSentResponse;
}

- (void)sendResponse:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  self->_hasSentResponse = 1;
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41___STKUSSDResponseProvider_sendResponse___block_invoke;
  v4[3] = &unk_24D562FC8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)sendResponse:(int64_t)a3 withStringResult:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  self->_hasSentResponse = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58___STKUSSDResponseProvider_sendResponse_withStringResult___block_invoke;
  block[3] = &unk_24D562FF0;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
