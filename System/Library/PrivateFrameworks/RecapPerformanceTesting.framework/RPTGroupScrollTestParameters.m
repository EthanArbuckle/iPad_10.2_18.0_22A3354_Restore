@implementation RPTGroupScrollTestParameters

- (NSArray)parameters
{
  return self->_parameters;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)composerBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__RPTGroupScrollTestParameters_composerBlock__block_invoke;
  v3[3] = &unk_1E635D210;
  v3[4] = self;
  return (id)MEMORY[0x1B5E1F6E0](v3, a2);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->testName, 0);
}

- (NSString)testName
{
  return self->testName;
}

- (void)prepareWithComposer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[RPTGroupScrollTestParameters parameters](self, "parameters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareWithComposer:", v4);

}

+ (id)newWithTestName:(id)a3 parameters:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setTestName:", v9);

  objc_msgSend(v10, "setParameters:", v8);
  objc_msgSend(v10, "setCompletionHandler:", v7);

  return v10;
}

void __45__RPTGroupScrollTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(*(id *)(a1 + 32), "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectAtIndex:", 0);
  objc_msgSend(*(id *)(a1 + 32), "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "composerBlock");
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v9)[2](v9, v3);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v15, "prepareWithComposer:", v3, (_QWORD)v17);
        objc_msgSend(v15, "composerBlock");
        v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id))v16)[2](v16, v3);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

}

@end
