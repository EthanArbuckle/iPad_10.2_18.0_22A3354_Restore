@implementation _UIReusePool

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseSetAccessQueue, 0);
  objc_storeStrong((id *)&self->_reuseSet, 0);
}

- (_UIReusePool)initWithPolicy:(unint64_t)a3
{
  _UIReusePool *v4;
  NSMutableSet *v5;
  NSMutableSet *reuseSet;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *reuseSetAccessQueue;
  _UIReusePool *v10;
  NSObject *v11;
  _UIReusePool *v12;
  objc_super v14;
  _QWORD block[4];
  _UIReusePool *v16;

  v14.receiver = self;
  v14.super_class = (Class)_UIReusePool;
  v4 = -[_UIReusePool init](&v14, sel_init);
  if (v4)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    reuseSet = v4->_reuseSet;
    v4->_reuseSet = v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.UIKit._UIReusePool.reuseSetAccess", v7);
    reuseSetAccessQueue = v4->_reuseSetAccessQueue;
    v4->_reuseSetAccessQueue = (OS_dispatch_queue *)v8;

    v4->_purgePolicy = a3;
    v10 = v4;
    if (qword_1ECD7A678 != -1)
      dispatch_once(&qword_1ECD7A678, &__block_literal_global_31_2);
    v11 = qword_1ECD7A670;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ____registerReusePool_block_invoke;
    block[3] = &unk_1E16B1B28;
    v16 = v10;
    v12 = v10;
    dispatch_sync(v11, block);

  }
  return v4;
}

- (id)reusableObject
{
  NSObject *reuseSetAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__107;
  v10 = __Block_byref_object_dispose__107;
  v11 = 0;
  reuseSetAccessQueue = self->_reuseSetAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30___UIReusePool_reusableObject__block_invoke;
  v5[3] = &unk_1E16BACE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(reuseSetAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)addObject:(id)a3
{
  id v4;
  unint64_t purgePolicy;
  unsigned __int8 v6;
  unsigned __int8 v7;
  NSObject *reuseSetAccessQueue;
  id v9;
  _QWORD block[5];
  id v11;

  v4 = a3;
  purgePolicy = self->_purgePolicy;
  if ((purgePolicy & 1) != 0)
  {
    v6 = atomic_load(byte_1ECD75E09);
    if ((purgePolicy & 2) == 0 || (v6 & 1) == 0)
    {
      if ((v6 & 1) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((purgePolicy & 2) == 0)
  {
    goto LABEL_7;
  }
  v7 = atomic_load((unsigned __int8 *)&_MergedGlobals_897);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    reuseSetAccessQueue = self->_reuseSetAccessQueue;
    block[1] = 3221225472;
    block[2] = __26___UIReusePool_addObject___block_invoke;
    block[3] = &unk_1E16B1B50;
    block[4] = self;
    v9 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v11 = v4;
    dispatch_sync(reuseSetAccessQueue, block);

    v4 = v9;
  }
LABEL_8:

}

+ (void)__applicationWillEnterForeground:(id)a3
{
  atomic_store(1u, (unsigned __int8 *)&_MergedGlobals_897);
}

+ (void)initialize
{
  dispatch_queue_t v3;
  void *v4;
  const dispatch_source_type_s *v5;
  dispatch_source_t v6;
  void *v7;
  dispatch_source_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS____UIReusePool;
  objc_msgSendSuper2(&v11, sel_initialize);
  if ((id)objc_opt_class() == a1)
  {
    v3 = dispatch_queue_create("com.apple.UIKit._UIReusePool.memoryPressureResponse", 0);
    v4 = (void *)qword_1ECD7A668;
    qword_1ECD7A668 = (uint64_t)v3;

    v5 = (const dispatch_source_type_s *)MEMORY[0x1E0C80DA8];
    v6 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 6uLL, (dispatch_queue_t)qword_1ECD7A668);
    v7 = (void *)_MergedGlobals_3_15;
    _MergedGlobals_3_15 = (uint64_t)v6;

    dispatch_source_set_event_handler((dispatch_source_t)_MergedGlobals_3_15, &__block_literal_global_279);
    dispatch_resume((dispatch_object_t)_MergedGlobals_3_15);
    v8 = dispatch_source_create(v5, 0, 1uLL, (dispatch_queue_t)qword_1ECD7A668);
    v9 = (void *)qword_1ECD7A660;
    qword_1ECD7A660 = (uint64_t)v8;

    dispatch_source_set_event_handler((dispatch_source_t)qword_1ECD7A660, &__block_literal_global_2_7);
    dispatch_resume((dispatch_object_t)qword_1ECD7A660);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", a1, sel___applicationDidEnterBackground_, CFSTR("UIApplicationDidEnterBackgroundNotification"), UIApp);
    objc_msgSend(v10, "addObserver:selector:name:object:", a1, sel___applicationWillEnterForeground_, CFSTR("UIApplicationWillEnterForegroundNotification"), UIApp);
    if (objc_msgSend((id)UIApp, "applicationState") == 2)
      objc_msgSend(a1, "__applicationDidEnterBackground:", 0);

  }
}

+ (void)__applicationDidEnterBackground:(id)a3
{
  atomic_store(0, (unsigned __int8 *)&_MergedGlobals_897);
  __purgeReusePools();
}

- (_UIReusePool)init
{
  return -[_UIReusePool initWithPolicy:](self, "initWithPolicy:", 3);
}

- (unint64_t)purgePolicy
{
  return self->_purgePolicy;
}

- (void)drainPool
{
  NSObject *reuseSetAccessQueue;
  _QWORD block[5];

  reuseSetAccessQueue = self->_reuseSetAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25___UIReusePool_drainPool__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_sync(reuseSetAccessQueue, block);
}

@end
