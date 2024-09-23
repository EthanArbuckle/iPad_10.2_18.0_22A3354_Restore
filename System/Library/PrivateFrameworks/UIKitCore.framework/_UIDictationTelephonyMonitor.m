@implementation _UIDictationTelephonyMonitor

- (BOOL)telephonyActivity
{
  return self->_telephonyActivity;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37___UIDictationTelephonyMonitor_start__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setActivityChanged:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (_UIDictationTelephonyMonitor)init
{
  _UIDictationTelephonyMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDictationTelephonyMonitor;
  v2 = -[_UIDictationTelephonyMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create(0, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)_backgroundInit
{
  void *v3;
  objc_class *v4;
  CXCallObserver *v5;
  CXCallObserver *callObserver;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)qword_1ECD79778;
  v11 = qword_1ECD79778;
  if (!qword_1ECD79778)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getCXCallObserverClass_block_invoke;
    v7[3] = &unk_1E16B14C0;
    v7[4] = &v8;
    __getCXCallObserverClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  v5 = (CXCallObserver *)objc_alloc_init(v4);
  callObserver = self->_callObserver;
  self->_callObserver = v5;

  -[CXCallObserver setDelegate:queue:](self->_callObserver, "setDelegate:queue:", self, self->_queue);
  -[_UIDictationTelephonyMonitor _backgroundReset](self, "_backgroundReset");
}

- (void)_backgroundReset
{
  _BOOL4 telephonyActivity;
  CXCallObserver *callObserver;
  void *v5;
  void *v6;
  void *v7;
  _QWORD block[4];
  id v10;

  telephonyActivity = self->_telephonyActivity;
  callObserver = self->_callObserver;
  if (callObserver)
  {
    -[CXCallObserver calls](callObserver, "calls");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_telephonyActivity = objc_msgSend(v5, "count") != 0;

  }
  else
  {
    self->_telephonyActivity = 0;
  }
  -[_UIDictationTelephonyMonitor activityChanged](self, "activityChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (telephonyActivity != self->_telephonyActivity && v6 != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48___UIDictationTelephonyMonitor__backgroundReset__block_invoke;
    block[3] = &unk_1E16B1BF8;
    v10 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (id)activityChanged
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activityChanged, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
