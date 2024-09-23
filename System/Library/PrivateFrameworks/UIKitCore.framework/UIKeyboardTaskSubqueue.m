@implementation UIKeyboardTaskSubqueue

+ (UIKeyboardTaskSubqueue)subqueueWithExecutionContext:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithExecutionContext:", v3);

  return (UIKeyboardTaskSubqueue *)v4;
}

- (UIKeyboardTaskSubqueue)initWithExecutionContext:(id)a3
{
  id v5;
  UIKeyboardTaskSubqueue *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *internalQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardTaskSubqueue;
  v6 = -[UIKeyboardTaskSubqueue init](&v11, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.UIKit.UIKeyboardTaskSubqueue.Internal", v7);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v6;
}

- (void)dispatchAsync:(id)a3
{
  id v4;
  void *v5;
  NSObject *internalQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    internalQueue = self->_internalQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__UIKeyboardTaskSubqueue_dispatchAsync___block_invoke;
    v7[3] = &unk_1E16B1D18;
    v7[4] = self;
    v8 = v4;
    dispatch_async(internalQueue, v7);

  }
}

void __40__UIKeyboardTaskSubqueue_dispatchAsync___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  if (v2)
  {
    v4 = *(NSObject **)(v1 + 8);
    v5 = v2;
    dispatch_suspend(v4);
    v6 = *(void **)(a1 + 40);
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__UIKeyboardTaskSubqueue_dispatchAsync___block_invoke_2;
    v9[3] = &unk_1E16BB6B8;
    v8 = v6;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v8;
    objc_msgSend(v7, "transferExecutionToMainThreadWithTask:", v9);

  }
}

void __40__UIKeyboardTaskSubqueue_dispatchAsync___block_invoke_2(uint64_t a1)
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)returnExecutionToParentQueue
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__UIKeyboardTaskSubqueue_returnExecutionToParentQueue__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __54__UIKeyboardTaskSubqueue_returnExecutionToParentQueue__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = 0;

  if (v2)
  {
    dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__UIKeyboardTaskSubqueue_returnExecutionToParentQueue__block_invoke_2;
    v5[3] = &unk_1E16BAF98;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v2, "transferExecutionToMainThreadWithTask:", v5);
  }

}

void __54__UIKeyboardTaskSubqueue_returnExecutionToParentQueue__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v3, "returnExecutionToParent");

  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
