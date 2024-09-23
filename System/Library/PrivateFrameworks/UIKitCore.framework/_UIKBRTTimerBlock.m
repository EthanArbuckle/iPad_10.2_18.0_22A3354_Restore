@implementation _UIKBRTTimerBlock

- (_UIKBRTTimerBlock)initWithTimeInterval:(double)a3 onQueue:(id)a4 do:(id)a5 owner:(id)a6
{
  id v11;
  id v12;
  id v13;
  _UIKBRTTimerBlock *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *selfQueue;
  void *v17;
  id onTimer;
  uint64_t v19;
  NSTimer *timer;
  void *v21;
  objc_super v23;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)_UIKBRTTimerBlock;
  v14 = -[_UIKBRTTimerBlock init](&v23, sel_init);
  if (v14)
  {
    v15 = dispatch_queue_create("UIKBRTTouchInfoQueue", 0);
    selfQueue = v14->_selfQueue;
    v14->_selfQueue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v14->_queue, a4);
    v17 = _Block_copy(v12);
    onTimer = v14->_onTimer;
    v14->_onTimer = v17;

    objc_storeStrong(&v14->_owner, a6);
    objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", v14, sel_timerFired_, 0, 0, a3);
    v19 = objc_claimAutoreleasedReturnValue();
    timer = v14->_timer;
    v14->_timer = (NSTimer *)v19;

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addTimer:forMode:", v14->_timer, *MEMORY[0x1E0C99748]);

  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIKBRTTimerBlock invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_UIKBRTTimerBlock;
  -[_UIKBRTTimerBlock dealloc](&v3, sel_dealloc);
}

- (void)fireNow
{
  NSObject *selfQueue;
  _QWORD v3[6];

  selfQueue = self->_selfQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28___UIKBRTTimerBlock_fireNow__block_invoke;
  v3[3] = &unk_1E16B1888;
  v3[4] = self;
  v3[5] = a2;
  dispatch_sync(selfQueue, v3);
}

- (void)invalidate
{
  NSObject *selfQueue;
  _QWORD block[5];

  selfQueue = self->_selfQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31___UIKBRTTimerBlock_invalidate__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_sync(selfQueue, block);
}

- (void)timerFired:(id)a3
{
  id v4;
  NSObject *selfQueue;
  uint64_t v6;
  id v7;
  NSObject *v8;
  _QWORD v9[6];
  _QWORD block[4];
  id v11;
  _UIKBRTTimerBlock *v12;
  uint64_t *v13;
  uint64_t *v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *(*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__139;
  v28 = __Block_byref_object_dispose__139;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__106;
  v22 = __Block_byref_object_dispose__107;
  v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__139;
  v16[4] = __Block_byref_object_dispose__139;
  v17 = 0;
  selfQueue = self->_selfQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32___UIKBRTTimerBlock_timerFired___block_invoke;
  block[3] = &unk_1E16D8620;
  v7 = v4;
  v11 = v7;
  v12 = self;
  v13 = &v24;
  v14 = &v18;
  v15 = v16;
  dispatch_sync(selfQueue, block);
  if (v19[5])
  {
    v8 = v25[5];
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __32___UIKBRTTimerBlock_timerFired___block_invoke_2;
    v9[3] = &unk_1E16C2E60;
    v9[4] = &v18;
    v9[5] = v16;
    dispatch_async(v8, v9);
  }

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
}

- (OS_dispatch_queue)selfQueue
{
  return self->_selfQueue;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)onTimer
{
  return self->_onTimer;
}

- (id)owner
{
  return self->_owner;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_owner, 0);
  objc_storeStrong(&self->_onTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_selfQueue, 0);
}

@end
