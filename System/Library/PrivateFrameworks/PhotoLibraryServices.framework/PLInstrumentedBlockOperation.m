@implementation PLInstrumentedBlockOperation

- (PLInstrumentedBlockOperation)init
{
  PLInstrumentedBlockOperation *v2;
  PLInstrumentedBlockOperation *v3;
  PLInstrumentedBlockOperation *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[5];
  _QWORD v9[5];
  PLInstrumentedBlockOperation *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLInstrumentedBlockOperation;
  v2 = -[NSBlockOperation init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x3032000000;
    v9[3] = __Block_byref_object_copy__86886;
    v9[4] = __Block_byref_object_dispose__86887;
    v4 = v2;
    v10 = v4;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __36__PLInstrumentedBlockOperation_init__block_invoke;
    v8[3] = &unk_1E3677580;
    v8[4] = v9;
    v5 = (void *)MEMORY[0x19AEC174C](v8);
    v7.receiver = v4;
    v7.super_class = (Class)PLInstrumentedBlockOperation;
    -[NSBlockOperation addExecutionBlock:](&v7, sel_addExecutionBlock_, v5);

    _Block_object_dispose(v9, 8);
  }
  return v3;
}

- (void)addExecutionBlock:(id)a3
{
  id v5;
  PLInstrumentedBlockOperation *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[5];
  _QWORD v13[5];
  PLInstrumentedBlockOperation *v14;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLInstrumentedBlockOperation;
  -[NSBlockOperation addExecutionBlock:](&v15, sel_addExecutionBlock_, v5);
  if (-[PLInstrumentedBlockOperation postambleAdded](self, "postambleAdded"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLInstrumentedBlockOperation.m"), 57, CFSTR("adding multiple execution blocks is not supported on %@"), v10);

  }
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__86886;
  v13[4] = __Block_byref_object_dispose__86887;
  v6 = self;
  v14 = v6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__PLInstrumentedBlockOperation_addExecutionBlock___block_invoke;
  v12[3] = &unk_1E3677580;
  v12[4] = v13;
  v7 = (void *)MEMORY[0x19AEC174C](v12);
  v11.receiver = v6;
  v11.super_class = (Class)PLInstrumentedBlockOperation;
  -[NSBlockOperation addExecutionBlock:](&v11, sel_addExecutionBlock_, v7);
  -[PLInstrumentedBlockOperation setPostambleAdded:](v6, "setPostambleAdded:", 1);

  _Block_object_dispose(v13, 8);
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v10.receiver = self;
  v10.super_class = (Class)PLInstrumentedBlockOperation;
  -[PLInstrumentedBlockOperation description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLInstrumentedBlockOperation executionTime](self, "executionTime");
  v6 = v5;
  -[PLInstrumentedBlockOperation timeSpentWaitingInQueue](self, "timeSpentWaitingInQueue");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ execution time: %.4f, time waiting in queue: %.4f"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)executionTime
{
  double v3;
  double v4;
  double result;
  double Current;

  -[PLInstrumentedBlockOperation executionStartTime](self, "executionStartTime");
  v4 = v3;
  result = 0.0;
  if (v4 != 0.0)
  {
    -[PLInstrumentedBlockOperation executionEndTime](self, "executionEndTime", 0.0);
    if (Current == 0.0)
      Current = CFAbsoluteTimeGetCurrent();
    return Current - v4;
  }
  return result;
}

- (double)timeSpentWaitingInQueue
{
  double v3;
  double v4;
  double result;
  double Current;

  -[PLInstrumentedBlockOperation creationTime](self, "creationTime");
  v4 = v3;
  result = 0.0;
  if (v4 != 0.0)
  {
    -[PLInstrumentedBlockOperation executionStartTime](self, "executionStartTime", 0.0);
    if (Current == 0.0)
      Current = CFAbsoluteTimeGetCurrent();
    return Current - v4;
  }
  return result;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (void)setCreationTime:(double)a3
{
  self->_creationTime = a3;
}

- (double)executionStartTime
{
  return self->_executionStartTime;
}

- (void)setExecutionStartTime:(double)a3
{
  self->_executionStartTime = a3;
}

- (double)executionEndTime
{
  return self->_executionEndTime;
}

- (void)setExecutionEndTime:(double)a3
{
  self->_executionEndTime = a3;
}

- (BOOL)postambleAdded
{
  return self->_postambleAdded;
}

- (void)setPostambleAdded:(BOOL)a3
{
  self->_postambleAdded = a3;
}

void __50__PLInstrumentedBlockOperation_addExecutionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setExecutionEndTime:", CFAbsoluteTimeGetCurrent());
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __36__PLInstrumentedBlockOperation_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setExecutionStartTime:", CFAbsoluteTimeGetCurrent());
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

+ (id)blockOperationWithBlock:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "addExecutionBlock:", v3);

  return v4;
}

@end
