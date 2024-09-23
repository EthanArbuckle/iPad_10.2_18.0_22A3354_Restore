@implementation SNTestChain

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkBlocks, 0);
}

- (void)addLink:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SNTestChain linkBlocks](self, "linkBlocks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = _Block_copy(v4);

  objc_msgSend(v6, "addObject:", v5);
}

- (void)popAndRunWithCompletion:(id)a3 testFailure:(id)a4
{
  void (**v6)(id, id);
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void (**v13)(id, id);
  _QWORD block[5];
  void (**v15)(id, id);
  void (**v16)(id, id);
  _QWORD v17[5];
  void (**v18)(id, id);

  v6 = (void (**)(id, id))a3;
  v7 = a4;
  -[SNTestChain linkBlocks](self, "linkBlocks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 || !v9)
  {
    if (v6)
      v6[2](v6, v7);
  }
  else
  {
    -[SNTestChain linkBlocks](self, "linkBlocks");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", 0);
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    -[SNTestChain linkBlocks](self, "linkBlocks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectAtIndex:", 0);

    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __51__SNTestChain_popAndRunWithCompletion_testFailure___block_invoke;
      v17[3] = &unk_1E9A1E9B0;
      v17[4] = self;
      v18 = v6;
      ((void (**)(_QWORD, _QWORD *))v11)[2](v11, v17);
      v13 = v18;
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__SNTestChain_popAndRunWithCompletion_testFailure___block_invoke_2;
      block[3] = &unk_1E9A1E9D8;
      block[4] = self;
      v15 = v11;
      v16 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v13 = v15;
    }

  }
}

- (NSMutableArray)linkBlocks
{
  return self->_linkBlocks;
}

uint64_t __51__SNTestChain_popAndRunWithCompletion_testFailure___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "popAndRunWithCompletion:testFailure:", *(_QWORD *)(a1 + 40), a2);
}

- (void)runWithCompletion:(id)a3
{
  -[SNTestChain popAndRunWithCompletion:testFailure:](self, "popAndRunWithCompletion:testFailure:", a3, 0);
}

- (SNTestChain)init
{
  SNTestChain *v2;
  NSMutableArray *v3;
  NSMutableArray *linkBlocks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SNTestChain;
  v2 = -[SNTestChain init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    linkBlocks = v2->_linkBlocks;
    v2->_linkBlocks = v3;

  }
  return v2;
}

void __51__SNTestChain_popAndRunWithCompletion_testFailure___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __51__SNTestChain_popAndRunWithCompletion_testFailure___block_invoke_3;
  v2[3] = &unk_1E9A1E9B0;
  v1 = *(_QWORD *)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, _QWORD *))(v1 + 16))(v1, v2);

}

uint64_t __51__SNTestChain_popAndRunWithCompletion_testFailure___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "popAndRunWithCompletion:testFailure:", *(_QWORD *)(a1 + 40), a2);
}

@end
