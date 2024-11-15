@implementation ICQRetryController

- (ICQRetryController)initWithMaxNumberOfRetries:(unint64_t)a3 block:(id)a4
{
  id v5;
  ICQRetryController *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  void *v9;
  id executionBlock;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICQRetryController;
  v5 = a4;
  v6 = -[ICQRetryController init](&v12, sel_init);
  v6->_numberOfAttempts = 0;
  v6->_maxNumberOfRetries = a3;
  v7 = dispatch_queue_create("com.apple.icq.retrycontroller", 0);
  queue = v6->_queue;
  v6->_queue = (OS_dispatch_queue *)v7;

  v9 = _Block_copy(v5);
  executionBlock = v6->_executionBlock;
  v6->_executionBlock = v9;

  return v6;
}

- (BOOL)executeBlock
{
  return -[ICQRetryController retryAfterSeconds:](self, "retryAfterSeconds:", 0);
}

- (BOOL)retryAfterSeconds:(unint64_t)a3
{
  unint64_t numberOfAttempts;
  unint64_t maxNumberOfRetries;
  dispatch_time_t v7;
  NSObject *queue;
  _QWORD block[5];
  _QWORD v11[5];
  id v12;

  numberOfAttempts = self->_numberOfAttempts;
  maxNumberOfRetries = self->_maxNumberOfRetries;
  if (numberOfAttempts <= maxNumberOfRetries)
  {
    self->_numberOfAttempts = numberOfAttempts + 1;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__1;
    v11[4] = __Block_byref_object_dispose__1;
    v12 = _Block_copy(self->_executionBlock);
    v7 = dispatch_time(0, 1000000000 * a3);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__ICQRetryController_retryAfterSeconds___block_invoke;
    block[3] = &unk_1E8B384E8;
    block[4] = v11;
    dispatch_after(v7, queue, block);
    _Block_object_dispose(v11, 8);

  }
  return numberOfAttempts <= maxNumberOfRetries;
}

uint64_t __40__ICQRetryController_retryAfterSeconds___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
}

- (unint64_t)numberOfAttempts
{
  return self->_numberOfAttempts;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_executionBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
