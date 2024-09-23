@implementation SPCoreSpotlightExtensionsTask

- (void)_performWithExtensionsEnumerator:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  NSObject *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  NSObject *v13;
  _QWORD block[5];
  id v15;
  void (**v16)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (!v7)
    -[SPCoreSpotlightExtensionsTask _performWithExtensionsEnumerator:completionBlock:].cold.1();
  v8 = v7;
  -[SPCoreSpotlightExtensionsTask performBlock](self, "performBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    -[SPCoreSpotlightExtensionsTask _performWithExtensionsEnumerator:completionBlock:].cold.2();

  objc_msgSend(v6, "nextObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = dispatch_group_create();
    -[SPCoreSpotlightExtensionsTask performBlock](self, "performBlock");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, NSObject *))v12)[2](v12, v10, v11);

    dispatch_get_global_queue(9, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__SPCoreSpotlightExtensionsTask__performWithExtensionsEnumerator_completionBlock___block_invoke;
    block[3] = &unk_24D0EB758;
    block[4] = self;
    v15 = v6;
    v16 = v8;
    dispatch_group_notify(v11, v13, block);

  }
  else
  {
    v8[2](v8);
  }

}

void __82__SPCoreSpotlightExtensionsTask__performWithExtensionsEnumerator_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x2199C2D78]();
  objc_msgSend(*(id *)(a1 + 32), "_performWithExtensionsEnumerator:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_autoreleasePoolPop(v2);
}

- (void)start
{
  __assert_rtn("-[SPCoreSpotlightExtensionsTask start]", "SPCoreSpotlightExtensionsTask.m", 36, "self.completionBlock");
}

void __38__SPCoreSpotlightExtensionsTask_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "filterBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "filterBlock");
      v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v8)[2](v8, v5);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v9;
    }

    v10 = *(void **)(a1 + 40);
    objc_msgSend(v5, "objectEnumerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __38__SPCoreSpotlightExtensionsTask_start__block_invoke_2;
    v12[3] = &unk_24D0EA758;
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v10, "_performWithExtensionsEnumerator:completionBlock:", v11, v12);

  }
}

void __38__SPCoreSpotlightExtensionsTask_start__block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __38__SPCoreSpotlightExtensionsTask_start__block_invoke_3(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);

  v2 = (void *)MEMORY[0x2199C2D78]();
  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  SDTransactionDone(*(void **)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setPerformBlock:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setFilterBlock:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", 0);
  objc_autoreleasePoolPop(v2);
}

- (id)filterBlock
{
  return self->_filterBlock;
}

- (void)setFilterBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)performBlock
{
  return self->_performBlock;
}

- (void)setPerformBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_performBlock, 0);
  objc_storeStrong(&self->_filterBlock, 0);
}

- (void)_performWithExtensionsEnumerator:completionBlock:.cold.1()
{
  __assert_rtn("-[SPCoreSpotlightExtensionsTask _performWithExtensionsEnumerator:completionBlock:]", "SPCoreSpotlightExtensionsTask.m", 18, "completionBlock");
}

- (void)_performWithExtensionsEnumerator:completionBlock:.cold.2()
{
  __assert_rtn("-[SPCoreSpotlightExtensionsTask _performWithExtensionsEnumerator:completionBlock:]", "SPCoreSpotlightExtensionsTask.m", 19, "self.performBlock");
}

@end
