@implementation WBSCyclerOperation

- (WBSCyclerOperation)init
{

  return 0;
}

- (WBSCyclerOperation)initWithMaximumNumberOfAttempts:(unint64_t)a3 backoffRatio:(float)a4
{
  WBSCyclerOperation *v6;
  WBSCyclerOperation *v7;
  WBSCyclerOperation *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WBSCyclerOperation;
  v6 = -[WBSCyclerOperation init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_numberOfRemainingAttempts = a3;
    v6->_backoffRatio = a4;
    v8 = v6;
  }

  return v7;
}

- (void)executeWithResultHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__WBSCyclerOperation_executeWithResultHandler___block_invoke;
  v6[3] = &unk_1E4B2A708;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __47__WBSCyclerOperation_executeWithResultHandler___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 21) = 1;
  v2 = dispatch_time(0, (uint64_t)(*(double *)(*(_QWORD *)(a1 + 32) + 32) * 1000000000.0));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__WBSCyclerOperation_executeWithResultHandler___block_invoke_2;
  v4[3] = &unk_1E4B2A708;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_after(v2, MEMORY[0x1E0C80D38], v4);

}

void __47__WBSCyclerOperation_executeWithResultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(v1 + 24);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__WBSCyclerOperation_executeWithResultHandler___block_invoke_3;
  v4[3] = &unk_1E4B38980;
  v4[4] = v1;
  v5 = v2;
  (*(void (**)(uint64_t, _QWORD *))(v3 + 16))(v3, v4);

}

void __47__WBSCyclerOperation_executeWithResultHandler___block_invoke_3(uint64_t a1, char a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  char v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__WBSCyclerOperation_executeWithResultHandler___block_invoke_4;
  block[3] = &unk_1E4B38958;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = a2;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __47__WBSCyclerOperation_executeWithResultHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  double v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 21) = 0;
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 48) || (v2 = *(_QWORD *)(v1 + 8) - 1, *(_QWORD *)(v1 + 8) = v2, v1 = *(_QWORD *)(a1 + 32), !v2))
  {
    *(_BYTE *)(v1 + 20) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = *(double *)(v1 + 32);
    if (v3 == 0.0)
      v3 = 1.0;
    *(double *)(v1 + 32) = v3 * *(float *)(v1 + 16);
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (double)nextBackoffTimeInterval
{
  return self->_nextBackoffTimeInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
