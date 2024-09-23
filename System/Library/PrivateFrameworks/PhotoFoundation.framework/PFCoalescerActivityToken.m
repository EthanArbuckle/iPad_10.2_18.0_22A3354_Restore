@implementation PFCoalescerActivityToken

- (PFCoalescerActivityToken)initWithDispatchGroup:(id)a3 reason:(id)a4
{
  NSObject *v7;
  id v8;
  PFCoalescerActivityToken *v9;
  PFCoalescerActivityToken *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *isolationQueue;
  uint64_t v14;
  NSArray *callStackReturnAddresses;
  uint64_t v16;
  NSDate *creationDate;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PFCoalescerActivityToken;
  v9 = -[PFCoalescerActivityToken init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reason, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("activity token isolation", v11);
    isolationQueue = v10->_isolationQueue;
    v10->_isolationQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_group, a3);
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackReturnAddresses");
    v14 = objc_claimAutoreleasedReturnValue();
    callStackReturnAddresses = v10->_callStackReturnAddresses;
    v10->_callStackReturnAddresses = (NSArray *)v14;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = objc_claimAutoreleasedReturnValue();
    creationDate = v10->_creationDate;
    v10->_creationDate = (NSDate *)v16;

    dispatch_group_enter(v7);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[PFCoalescerActivityToken endActivity](self, "endActivity");
  v3.receiver = self;
  v3.super_class = (Class)PFCoalescerActivityToken;
  -[PFCoalescerActivityToken dealloc](&v3, sel_dealloc);
}

- (void)endActivity
{
  NSObject *isolationQueue;
  _QWORD block[5];

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PFCoalescerActivityToken_endActivity__block_invoke;
  block[3] = &unk_1E6B772D0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSString *reason;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_creationDate);
  v5 = v4;

  v6 = (void *)MEMORY[0x1E0CB3940];
  reason = self->_reason;
  -[NSArray componentsJoinedByString:](self->_callStackReturnAddresses, "componentsJoinedByString:", CFSTR(" "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<PFCoalescerActivityToken %p '%@' age: %.1fs (\n%@\n)>"), self, reason, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (OS_dispatch_group)group
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 8, 1);
}

- (void)setGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_dispatch_queue)isolationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIsolationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReason:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)callStackReturnAddresses
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCallStackReturnAddresses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_callStackReturnAddresses, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

void __39__PFCoalescerActivityToken_endActivity__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = 0;

  }
}

@end
