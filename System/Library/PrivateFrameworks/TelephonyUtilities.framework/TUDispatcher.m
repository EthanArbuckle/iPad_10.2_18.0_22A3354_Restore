@implementation TUDispatcher

+ (id)dispatcherWithIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:", v3);

  return v4;
}

- (TUDispatcher)initWithIdentifier:(id)a3
{
  NSObject *v5;
  dispatch_queue_t v6;
  TUDispatcher *v7;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), v5);
  v7 = -[TUDispatcher initWithQueue:](self, "initWithQueue:", v6);

  return v7;
}

- (TUDispatcher)initWithQueue:(id)a3
{
  id v5;
  TUDispatcher *v6;
  TUDispatcher *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUDispatcher;
  v6 = -[TUDispatcher init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);

  return v7;
}

- (void)dispatchSynchronousBlock:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[TUDispatcher dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v5, v4);

}

- (void)dispatchAsynchronousBlock:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[TUDispatcher dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v4);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

+ (id)dispatcherWithQueue:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithQueue:", v3);

  return v4;
}

- (TUDispatcher)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is not available for use. To create an object instance use the designated initializer."), "-[TUDispatcher init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("** TUAssertion failure: %@"), v4);

  if (_TUAssertShouldCrashApplication())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUDispatcher.m"), 49, CFSTR("%s is not available for use. To create an object instance use the designated initializer."), "-[TUDispatcher init]");

  }
  return 0;
}

- (void)boostQualityOfService
{
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__TUDispatcher_boostQualityOfService__block_invoke;
  aBlock[3] = &unk_1E38A1360;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  -[TUDispatcher dispatchQueue](self, "dispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  -[TUDispatcher qosUserInteractiveDispatchBlockForBlock:](self, "qosUserInteractiveDispatchBlockForBlock:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v4, v5);

}

void __37__TUDispatcher_boostQualityOfService__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__TUDispatcher_boostQualityOfService__block_invoke_2;
  block[3] = &unk_1E38A1360;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __37__TUDispatcher_boostQualityOfService__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("TUDispatcherDidFinishBoostQualityOfServiceNotification"), *(_QWORD *)(a1 + 32));

}

- (id)qosUserInteractiveDispatchBlockForBlock:(id)a3
{
  return dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
