@implementation RPTInteractionTestParameters

- (void)setDurations:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *v8;
  NSArray *durations;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (1)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(v4);
      if (!--v6)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (!v6)
          break;
      }
    }
  }
  v8 = (NSArray *)objc_msgSend(v4, "copy");
  durations = self->_durations;
  self->_durations = v8;

}

- (void)setDelays:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *v8;
  NSArray *delays;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (1)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(v4);
      if (!--v6)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (!v6)
          break;
      }
    }
  }
  v8 = (NSArray *)objc_msgSend(v4, "copy");
  delays = self->_delays;
  self->_delays = v8;

}

- (RPTInteractionTestParameters)initWithTestName:(id)a3 interactions:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  RPTInteractionTestParameters *v11;
  uint64_t v12;
  NSString *testName;
  uint64_t v14;
  NSArray *interactions;
  uint64_t v16;
  id completionHandler;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RPTInteractionTestParameters;
  v11 = -[RPTInteractionTestParameters init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    testName = v11->_testName;
    v11->_testName = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    interactions = v11->_interactions;
    v11->_interactions = (NSArray *)v14;

    v16 = MEMORY[0x1B5E1F6E0](v10);
    completionHandler = v11->_completionHandler;
    v11->_completionHandler = (id)v16;

  }
  return v11;
}

+ (id)interactionTestParametersWithTestName:(id)a3 interaction:(id)a4 duration:(double)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = a3;
  v13 = objc_alloc((Class)a1);
  v20[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithTestName:interactions:completionHandler:", v12, v14, v11);

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDurations:", v17);

  }
  return v15;
}

- (id)composerBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__RPTInteractionTestParameters_composerBlock__block_invoke;
  v3[3] = &unk_1E635D210;
  v3[4] = self;
  return (id)MEMORY[0x1B5E1F6E0](v3, a2);
}

void __45__RPTInteractionTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "interactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__RPTInteractionTestParameters_composerBlock__block_invoke_2;
  v6[3] = &unk_1E635D1E8;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __45__RPTInteractionTestParameters_composerBlock__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  unint64_t v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;

  v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "durations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = 1.0;
  if (v6 > a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "durations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v7 = v10;

  }
  objc_msgSend(v17, "invokeWithComposer:duration:", *(_QWORD *)(a1 + 40), v7);
  objc_msgSend(*(id *)(a1 + 32), "delays");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 > a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "delays");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    if (v16 > 0.0)
      objc_msgSend(*(id *)(a1 + 40), "advanceTime:", v16);
  }

}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSArray)interactions
{
  return self->_interactions;
}

- (NSArray)durations
{
  return self->_durations;
}

- (NSArray)delays
{
  return self->_delays;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delays, 0);
  objc_storeStrong((id *)&self->_durations, 0);
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end
