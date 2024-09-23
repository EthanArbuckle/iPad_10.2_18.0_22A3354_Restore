@implementation OspreyDeferredObject

- (OspreyDeferredObject)initWithFulfillmentQueue:(id)a3
{
  id v5;
  OspreyDeferredObject *v6;
  OspreyDeferredObject *v7;
  dispatch_group_t v8;
  OS_dispatch_group *fulfillmentGroup;
  dispatch_queue_t v10;
  OS_dispatch_queue *deferralQueue;
  NSObject *v12;
  NSObject *fulfillmentQueue;
  _QWORD block[4];
  OspreyDeferredObject *v16;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)OspreyDeferredObject;
  v6 = -[OspreyDeferredObject init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fulfillmentQueue, a3);
    v8 = dispatch_group_create();
    fulfillmentGroup = v7->_fulfillmentGroup;
    v7->_fulfillmentGroup = (OS_dispatch_group *)v8;

    v10 = dispatch_queue_create("OspreyDeferredObject.deferral", 0);
    deferralQueue = v7->_deferralQueue;
    v7->_deferralQueue = (OS_dispatch_queue *)v10;

    dispatch_suspend((dispatch_object_t)v7->_deferralQueue);
    dispatch_group_enter((dispatch_group_t)v7->_fulfillmentGroup);
    fulfillmentQueue = v7->_fulfillmentQueue;
    v12 = v7->_fulfillmentGroup;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__OspreyDeferredObject_initWithFulfillmentQueue___block_invoke;
    block[3] = &unk_1E7097F90;
    v16 = v7;
    dispatch_group_notify(v12, fulfillmentQueue, block);

  }
  return v7;
}

void __49__OspreyDeferredObject_initWithFulfillmentQueue___block_invoke(uint64_t a1)
{
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)fulfill:(id)a3
{
  id v4;
  NSObject *fulfillmentQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  fulfillmentQueue = self->_fulfillmentQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__OspreyDeferredObject_fulfill___block_invoke;
  v7[3] = &unk_1E7098180;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(fulfillmentQueue, v7);

}

void __32__OspreyDeferredObject_fulfill___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)fulfilledWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *deferralQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    deferralQueue = self->_deferralQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__OspreyDeferredObject_fulfilledWithCompletion___block_invoke;
    v7[3] = &unk_1E70981A8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(deferralQueue, v7);

  }
}

uint64_t __48__OspreyDeferredObject_fulfilledWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fulfillmentGroup, 0);
  objc_storeStrong((id *)&self->_fulfillmentQueue, 0);
  objc_storeStrong((id *)&self->_deferralQueue, 0);
  objc_storeStrong(&self->_promised, 0);
}

@end
