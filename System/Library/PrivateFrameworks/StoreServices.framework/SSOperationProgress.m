@implementation SSOperationProgress

- (SSOperationProgress)init
{
  SSOperationProgress *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSOperationProgress;
  v2 = -[SSOperationProgress init](&v4, sel_init);
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StoreServices.SSOperationProgress", 0);
    v2->_estimatedTimeRemaining = -1.0;
    v2->_changeRate = -1.0;
    v2->_normalizedCurrentValue = -1;
    v2->_normalizedMaxValue = -1;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_dispatchQueue);

  v3.receiver = self;
  v3.super_class = (Class)SSOperationProgress;
  -[SSOperationProgress dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  NSObject *dispatchQueue;
  _QWORD v7[6];

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__SSOperationProgress_copyWithZone___block_invoke;
  v7[3] = &unk_1E47B8BB8;
  v7[4] = v4;
  v7[5] = self;
  dispatch_sync(dispatchQueue, v7);
  return v4;
}

double __36__SSOperationProgress_copyWithZone___block_invoke(uint64_t a1)
{
  double result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
  result = *(double *)(*(_QWORD *)(a1 + 40) + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 40) = result;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
  return result;
}

- (BOOL)canPause
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__SSOperationProgress_canPause__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__SSOperationProgress_canPause__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (double)changeRate
{
  NSObject *dispatchQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__SSOperationProgress_changeRate__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __33__SSOperationProgress_changeRate__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 16);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)currentValue
{
  NSObject *dispatchQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__SSOperationProgress_currentValue__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__SSOperationProgress_currentValue__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (double)estimatedTimeRemaining
{
  NSObject *dispatchQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  unint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0xBFF0000000000000;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__SSOperationProgress_estimatedTimeRemaining__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __45__SSOperationProgress_estimatedTimeRemaining__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 40);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)maxValue
{
  NSObject *dispatchQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__SSOperationProgress_maxValue__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__SSOperationProgress_maxValue__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

- (int64_t)normalizedCurrentValue
{
  NSObject *dispatchQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__SSOperationProgress_normalizedCurrentValue__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__SSOperationProgress_normalizedCurrentValue__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 56);
  if (v2 < 0)
    v2 = *(_QWORD *)(v1 + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (int64_t)normalizedMaxValue
{
  NSObject *dispatchQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__SSOperationProgress_normalizedMaxValue__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__SSOperationProgress_normalizedMaxValue__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 64);
  if (v2 < 0)
    v2 = *(_QWORD *)(v1 + 48);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (int64_t)operationType
{
  NSObject *dispatchQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__SSOperationProgress_operationType__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__SSOperationProgress_operationType__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

- (void)resetSnapshots
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SSOperationProgress_resetSnapshots__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __37__SSOperationProgress_resetSnapshots__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeAllObjects");
}

- (void)setCanPause:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__SSOperationProgress_setCanPause___block_invoke;
  v4[3] = &unk_1E47B9C78;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __35__SSOperationProgress_setCanPause___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setChangeRate:(double)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__SSOperationProgress_setChangeRate___block_invoke;
  v4[3] = &unk_1E47B9CA0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

double __37__SSOperationProgress_setChangeRate___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 16) = result;
  return result;
}

- (void)setCurrentValue:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__SSOperationProgress_setCurrentValue___block_invoke;
  v4[3] = &unk_1E47B9CA0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __39__SSOperationProgress_setCurrentValue___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 24) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setEstimatedTimeRemaining:(double)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__SSOperationProgress_setEstimatedTimeRemaining___block_invoke;
  v4[3] = &unk_1E47B9CA0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

double __49__SSOperationProgress_setEstimatedTimeRemaining___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 40) = result;
  return result;
}

- (void)setMaxValue:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__SSOperationProgress_setMaxValue___block_invoke;
  v4[3] = &unk_1E47B9CA0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __35__SSOperationProgress_setMaxValue___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 48) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setNormalizedCurrentValue:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__SSOperationProgress_setNormalizedCurrentValue___block_invoke;
  v4[3] = &unk_1E47B9CA0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __49__SSOperationProgress_setNormalizedCurrentValue___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 56) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setNormalizedMaxValue:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__SSOperationProgress_setNormalizedMaxValue___block_invoke;
  v4[3] = &unk_1E47B9CA0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __45__SSOperationProgress_setNormalizedMaxValue___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 64) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setOperationType:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__SSOperationProgress_setOperationType___block_invoke;
  v4[3] = &unk_1E47B9CA0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __40__SSOperationProgress_setOperationType___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 72) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setUnits:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__SSOperationProgress_setUnits___block_invoke;
  v4[3] = &unk_1E47B9CA0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __32__SSOperationProgress_setUnits___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 96) = *(_QWORD *)(result + 40);
  return result;
}

- (void)snapshot
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SSOperationProgress_snapshot__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __31__SSOperationProgress_snapshot__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  }
  if ((unint64_t)objc_msgSend(v2, "count") >= 0x78)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObjectAtIndex:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeObjectAtIndex:", 0);
  }
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", CFAbsoluteTimeGetCurrent());
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addObject:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "addObject:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "_updateStatisticsFromSnapshots");
}

- (int64_t)units
{
  NSObject *dispatchQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__SSOperationProgress_units__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__SSOperationProgress_units__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 96);
  return result;
}

- (NSString)description
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SSOperationProgress_description__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__SSOperationProgress_description__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t result;
  objc_super v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)SSOperationProgress;
  result = objc_msgSend(v2, "initWithFormat:", CFSTR("%@: %lld / %lld @ %.3f (%.2f seconds)"), objc_msgSendSuper2(&v4, sel_description), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, "0", self->_canPause);
  xpc_dictionary_set_double(v3, "1", self->_changeRate);
  xpc_dictionary_set_int64(v3, "2", self->_currentValue);
  xpc_dictionary_set_double(v3, "3", self->_estimatedTimeRemaining);
  xpc_dictionary_set_int64(v3, "4", self->_maxValue);
  xpc_dictionary_set_int64(v3, "5", self->_normalizedCurrentValue);
  xpc_dictionary_set_int64(v3, "6", self->_normalizedMaxValue);
  xpc_dictionary_set_int64(v3, "7", self->_operationType);
  xpc_dictionary_set_int64(v3, "8", self->_units);
  return v3;
}

- (SSOperationProgress)initWithXPCEncoding:(id)a3
{
  SSOperationProgress *v5;
  objc_super v7;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSOperationProgress;
    v5 = -[SSOperationProgress init](&v7, sel_init);
    if (v5)
    {
      v5->_canPause = xpc_dictionary_get_BOOL(a3, "0");
      v5->_changeRate = xpc_dictionary_get_double(a3, "1");
      v5->_currentValue = xpc_dictionary_get_int64(a3, "2");
      v5->_estimatedTimeRemaining = xpc_dictionary_get_double(a3, "3");
      v5->_maxValue = xpc_dictionary_get_int64(a3, "4");
      v5->_normalizedCurrentValue = xpc_dictionary_get_int64(a3, "5");
      v5->_normalizedMaxValue = xpc_dictionary_get_int64(a3, "6");
      v5->_operationType = xpc_dictionary_get_int64(a3, "7");
      v5->_units = xpc_dictionary_get_int64(a3, "8");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (void)_updateStatisticsFromSnapshots
{
  unint64_t v3;
  double v4;
  unint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  int64_t v14;

  v3 = -[NSMutableArray count](self->_snapshotTimes, "count");
  v4 = -1.0;
  if (v3 < 6)
  {
    v13 = -1.0;
  }
  else
  {
    v5 = v3;
    v6 = 0.0;
    for (i = 1; i != v5; ++i)
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_snapshotTimes, "objectAtIndex:", i), "doubleValue");
      v9 = v8;
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_snapshotTimes, "objectAtIndex:", i - 1), "doubleValue");
      v11 = v9 - v10;
      v12 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_snapshotValues, "objectAtIndex:", i), "longLongValue");
      v6 = v6
         + (double)(v12
                  - objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_snapshotValues, "objectAtIndex:", i - 1), "longLongValue"))/ v11;
    }
    v13 = v6 / (double)v5;
    if (v13 > 0.00000011920929)
    {
      v14 = self->_maxValue - self->_currentValue;
      if ((v14 & 0x8000000000000000) == 0)
        v4 = (double)v14 / v13;
    }
  }
  self->_changeRate = v13;
  self->_estimatedTimeRemaining = v4;
}

@end
