@implementation REFeatureTransformer

+ (BOOL)supportsPersistence
{
  return 0;
}

+ (BOOL)supportsInvalidation
{
  return 0;
}

- (void)setInvalidationDelegate:(id)a3
{
  id obj;

  obj = a3;
  if (objc_msgSend((id)objc_opt_class(), "supportsInvalidation"))
    objc_storeWeak((id *)&self->_invalidationDelegate, obj);

}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)readFromURL:(id)a3 error:(id *)a4
{
  return 1;
}

+ (id)functionName
{
  return 0;
}

+ (id)featureTransformerClasses
{
  if (featureTransformerClasses_onceToken != -1)
    dispatch_once(&featureTransformerClasses_onceToken, &__block_literal_global_398);
  return (id)featureTransformerClasses_Classes;
}

void __49__REFeatureTransformer_featureTransformerClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];

  v2[7] = *MEMORY[0x24BDAC8D0];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)featureTransformerClasses_Classes;
  featureTransformerClasses_Classes = v0;

}

+ (id)bucketTransformerWithCount:(unint64_t)a3 minValue:(id)a4 maxValue:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t i;
  _REBucketFeatureTransformer *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v13 = RECreateIntegerFeatureValueTaggedPointer(a3);
  v14 = RECreateFeatureValueTaggedPointer(v7);
  v15 = RECreateFeatureValueTaggedPointer(v8);
  +[RETransformerInvocation invocationWithArguments:count:](RETransformerInvocation, "invocationWithArguments:count:", &v13, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 24; i += 8)
    REReleaseFeatureValueTaggedPointer(*(CFTypeRef *)((char *)&v13 + i));
  v11 = objc_alloc_init(_REBucketFeatureTransformer);
  -[_REBucketFeatureTransformer configureWithInvocation:](v11, "configureWithInvocation:", v9, v13, v14);

  return v11;
}

+ (id)bucketTransformerWithBitWidth:(unint64_t)a3
{
  char v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bucketTransformerWithCount:minValue:maxValue:", 1 << v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)logTransformerWithBase:(id)a3
{
  id v3;
  _RELogFeatureTransformer *v4;

  v3 = a3;
  v4 = -[_RELogFeatureTransformer initWithBase:]([_RELogFeatureTransformer alloc], "initWithBase:", v3);

  return v4;
}

+ (id)binaryTransformerWithThreshold:(id)a3
{
  void *v3;
  _REBinaryFeatureTransformer *v4;
  CFTypeRef v6[2];

  v6[1] = *(CFTypeRef *)MEMORY[0x24BDAC8D0];
  v6[0] = (CFTypeRef)RECreateFeatureValueTaggedPointer(a3);
  +[RETransformerInvocation invocationWithArguments:count:](RETransformerInvocation, "invocationWithArguments:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  REReleaseFeatureValueTaggedPointer(v6[0]);
  v4 = objc_alloc_init(_REBinaryFeatureTransformer);
  -[_REBinaryFeatureTransformer configureWithInvocation:](v4, "configureWithInvocation:", v3);

  return v4;
}

+ (id)roundTransformer
{
  return objc_alloc_init(_RERoundFeatureTransformer);
}

+ (id)hashTransform
{
  return objc_alloc_init(_REHashFeatureTransformer);
}

+ (id)maskTransformWithWidth:(unint64_t)a3
{
  return -[_REWidthFeatureTransformer initWithWidth:shift:]([_REWidthFeatureTransformer alloc], "initWithWidth:shift:", a3, 0);
}

+ (id)changedTransform
{
  return (id)objc_msgSend(a1, "changedTransformWithImpulseDuration:", 900.0);
}

+ (id)changedTransformWithImpulseDuration:(double)a3
{
  void *v3;
  _REChangeFeatureTransformer *v4;
  CFTypeRef v6[2];

  v6[1] = *(CFTypeRef *)MEMORY[0x24BDAC8D0];
  v6[0] = (CFTypeRef)RECreateDoubleFeatureValueTaggedPointer();
  +[RETransformerInvocation invocationWithArguments:count:](RETransformerInvocation, "invocationWithArguments:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  REReleaseFeatureValueTaggedPointer(v6[0]);
  v4 = objc_alloc_init(_REChangeFeatureTransformer);
  -[_REChangeFeatureTransformer configureWithInvocation:](v4, "configureWithInvocation:", v3);

  return v4;
}

+ (id)maskAndShiftTransformWithStartIndex:(unint64_t)a3 endIndex:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 - a3;
  if (a4 < a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("End index %lu must come after start index %lu"), a4, a3);
  return -[_REWidthFeatureTransformer initWithWidth:shift:]([_REWidthFeatureTransformer alloc], "initWithWidth:shift:", v5 + 1, a3);
}

+ (id)recentTransformerWithCount:(unint64_t)a3
{
  void *v3;
  _RERecentFeatureTransformer *v4;
  CFTypeRef v6[2];

  v6[1] = *(CFTypeRef *)MEMORY[0x24BDAC8D0];
  v6[0] = (CFTypeRef)RECreateIntegerFeatureValueTaggedPointer(a3);
  +[RETransformerInvocation invocationWithArguments:count:](RETransformerInvocation, "invocationWithArguments:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  REReleaseFeatureValueTaggedPointer(v6[0]);
  v4 = objc_alloc_init(_RERecentFeatureTransformer);
  -[_RERecentFeatureTransformer configureWithInvocation:](v4, "configureWithInvocation:", v3);

  return v4;
}

+ (id)customCategoricalTransformerWithName:(id)a3 block:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __67__REFeatureTransformer_customCategoricalTransformerWithName_block___block_invoke;
    v10[3] = &unk_24CF8E5F0;
    v11 = v6;
    objc_msgSend(a1, "customTransformerWithName:outputType:block:", a3, 1, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

REFeatureValue *__67__REFeatureTransformer_customCategoricalTransformerWithName_block___block_invoke(uint64_t a1)
{
  return +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))());
}

+ (id)customCategoricalTransformerWithName:(id)a3 featureCount:(unint64_t)a4 transformation:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __89__REFeatureTransformer_customCategoricalTransformerWithName_featureCount_transformation___block_invoke;
    v12[3] = &unk_24CF8E618;
    v13 = v8;
    objc_msgSend(a1, "customTransformerWithName:outputType:featureCount:transformation:", a3, 1, a4, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

REFeatureValue *__89__REFeatureTransformer_customCategoricalTransformerWithName_featureCount_transformation___block_invoke(uint64_t a1)
{
  return +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))());
}

+ (id)customTransformerWithName:(id)a3 outputType:(unint64_t)a4 block:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __67__REFeatureTransformer_customTransformerWithName_outputType_block___block_invoke;
    v12[3] = &unk_24CF8E618;
    v13 = v8;
    objc_msgSend(a1, "customTransformerWithName:outputType:featureCount:transformation:", a3, a4, 1, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __67__REFeatureTransformer_customTransformerWithName_outputType_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)customTransformerWithName:(id)a3 outputType:(unint64_t)a4 featureCount:(unint64_t)a5 transformation:(id)a6
{
  id v9;
  id v10;
  _REBlockFeatureTransformer *v11;

  if (a6)
  {
    v9 = a6;
    v10 = a3;
    v11 = -[_REBlockFeatureTransformer initWithFeatureCount:outputFeatureType:transformation:]([_REBlockFeatureTransformer alloc], "initWithFeatureCount:outputFeatureType:transformation:", a5, a4, v9);

    -[REFeatureTransformer setName:](v11, "setName:", v10);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (REFeatureTransformer)init
{
  REFeatureTransformer *v2;
  REPriorityQueue *v3;
  REPriorityQueue *scheduledUpdates;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REFeatureTransformer;
  v2 = -[REFeatureTransformer init](&v6, sel_init);
  if (v2 && objc_msgSend((id)objc_opt_class(), "supportsInvalidation"))
  {
    v3 = -[REPriorityQueue initWithComparator:]([REPriorityQueue alloc], "initWithComparator:", &__block_literal_global_419);
    scheduledUpdates = v2->_scheduledUpdates;
    v2->_scheduledUpdates = v3;

  }
  return v2;
}

uint64_t __28__REFeatureTransformer_init__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)configureWithInvocation:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (objc_msgSend(a3, "numberOfArguments"))
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Expected no arguments with invoaction"), v3, v4, v5, v6, v7, v8, v9);
}

- (id)_invalidationQueue
{
  if (_invalidationQueue_onceToken != -1)
    dispatch_once(&_invalidationQueue_onceToken, &__block_literal_global_422);
  return (id)_invalidationQueue_Queue;
}

void __42__REFeatureTransformer__invalidationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.REFeatureTransformer.Invalidation", v2);
  v1 = (void *)_invalidationQueue_Queue;
  _invalidationQueue_Queue = (uint64_t)v0;

}

- (id)invalidationDelegate
{
  return objc_loadWeakRetained((id *)&self->_invalidationDelegate);
}

- (void)invalidateWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  REFeatureTransformer *v8;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "supportsInvalidation"))
  {
    -[REFeatureTransformer _invalidationQueue](self, "_invalidationQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __46__REFeatureTransformer_invalidateWithContext___block_invoke;
    v6[3] = &unk_24CF8AB18;
    v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);

  }
}

void __46__REFeatureTransformer_invalidateWithContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "invalidationDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = (id)v2;
  if (v2)
    objc_msgSend(v3, "_invalidationQueue_scheduleInvalidation:", v2);
  else
    objc_msgSend(v3, "_invalidate");

}

- (void)_invalidationQueue_scheduleInvalidation:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[REPriorityQueue containsObject:](self->_scheduledUpdates, "containsObject:"))
    -[REPriorityQueue insertObject:](self->_scheduledUpdates, "insertObject:", v4);
  -[REFeatureTransformer _performAndScheduleTimer](self, "_performAndScheduleTimer");

}

- (void)_performAndScheduleTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  REUpNextTimer *v9;
  REUpNextTimer *updateTimer;
  REUpNextTimer *v11;
  _QWORD v12[4];
  id v13;
  id location;

  -[REFeatureTransformer _invalidationQueue](self, "_invalidationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REPriorityQueue minimumObject](self->_scheduledUpdates, "minimumObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    do
    {
      if (objc_msgSend(v5, "compare:", v4) == 1)
        break;
      -[REFeatureTransformer _invalidate](self, "_invalidate");
      -[REPriorityQueue removeMinimumObject](self->_scheduledUpdates, "removeMinimumObject");
      -[REPriorityQueue minimumObject](self->_scheduledUpdates, "minimumObject");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    while (v6);
  }
  if (-[REPriorityQueue count](self->_scheduledUpdates, "count"))
  {
    -[REPriorityQueue minimumObject](self->_scheduledUpdates, "minimumObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    -[REFeatureTransformer _invalidationQueue](self, "_invalidationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __48__REFeatureTransformer__performAndScheduleTimer__block_invoke;
    v12[3] = &unk_24CF8ABD0;
    objc_copyWeak(&v13, &location);
    +[REUpNextTimer timerWithFireDate:queue:block:](REUpNextTimer, "timerWithFireDate:queue:block:", v7, v8, v12);
    v9 = (REUpNextTimer *)objc_claimAutoreleasedReturnValue();
    updateTimer = self->_updateTimer;
    self->_updateTimer = v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
  else
  {
    -[REUpNextTimer invalidate](self->_updateTimer, "invalidate");
    v11 = self->_updateTimer;
    self->_updateTimer = 0;

  }
}

void __48__REFeatureTransformer__performAndScheduleTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performAndScheduleTimer");

}

- (void)_invalidate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_invalidationDelegate);
  objc_msgSend(WeakRetained, "featureTransformerDidInvalidate:", self);

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_invalidationDelegate);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_scheduledUpdates, 0);
}

@end
