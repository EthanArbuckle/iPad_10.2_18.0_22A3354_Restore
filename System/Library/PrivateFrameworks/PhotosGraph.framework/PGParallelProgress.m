@implementation PGParallelProgress

- (PGParallelProgress)initWithParallelOperationCount:(unint64_t)a3 progressBlock:(id)a4
{
  id v6;
  PGParallelProgress *v7;
  PGParallelProgress *v8;
  void *v9;
  id progressBlock;
  uint64_t v11;
  MAMutableFloatVector *progressValues;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGParallelProgress;
  v7 = -[PGParallelProgress init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_lock._os_unfair_lock_opaque = 0;
    v9 = _Block_copy(v6);
    progressBlock = v8->_progressBlock;
    v8->_progressBlock = v9;

    objc_msgSend(MEMORY[0x1E0D42A48], "zerosOfCount:", a3);
    v11 = objc_claimAutoreleasedReturnValue();
    progressValues = v8->_progressValues;
    v8->_progressValues = (MAMutableFloatVector *)v11;

  }
  return v8;
}

- (id)progressBlockForParallelOperationWithIndex:(unint64_t)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__PGParallelProgress_progressBlockForParallelOperationWithIndex___block_invoke;
  v4[3] = &unk_1E8431A28;
  v4[4] = self;
  v4[5] = a3;
  return _Block_copy(v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressValues, 0);
  objc_storeStrong(&self->_progressBlock, 0);
}

void __65__PGParallelProgress_progressBlockForParallelOperationWithIndex___block_invoke(uint64_t a1, double a2)
{
  unint64_t v4;
  double v5;
  float v6;
  unint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  if (*(_QWORD *)(a1 + 40) >= v4)
  {
    v7 = v4;
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = 134218240;
      v12 = v10;
      v13 = 2048;
      v14 = v7;
      _os_log_fault_impl(&dword_1CA237000, v9, OS_LOG_TYPE_FAULT, "Parallel progress index(%lu) out of bounds(%lu)", (uint8_t *)&v11, 0x16u);
    }

  }
  else
  {
    *(float *)&v5 = a2;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setFloat:atIndex:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "mean");
    a2 = v6;
  }
  (*(void (**)(double))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))(a2);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

@end
