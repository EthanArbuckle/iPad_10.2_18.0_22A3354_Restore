@implementation SNTestSuite

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentTestSuite);
  objc_storeStrong((id *)&self->_subTestSuites, 0);
  objc_storeStrong((id *)&self->_testCases, 0);
}

- (SNTestSuite)init
{
  SNTestSuite *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *testCases;
  NSMutableArray *v5;
  NSMutableArray *subTestSuites;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SNTestSuite;
  v2 = -[SNTestSuite init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    testCases = v2->_testCases;
    v2->_testCases = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    subTestSuites = v2->_subTestSuites;
    v2->_subTestSuites = v5;

  }
  return v2;
}

- (void)addSubTestSuite:(id)a3
{
  id v4;
  id v5;

  if (a3 != self)
  {
    v4 = a3;
    objc_msgSend(v4, "setParentTestSuite:", self);
    -[SNTestSuite subTestSuites](self, "subTestSuites");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (NSMutableArray)subTestSuites
{
  return self->_subTestSuites;
}

- (void)setParentTestSuite:(id)a3
{
  objc_storeWeak((id *)&self->_parentTestSuite, a3);
}

- (void)addTestCase:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SNTestSuite testCases](self, "testCases");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "testName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (NSMutableDictionary)testCases
{
  return self->_testCases;
}

- (id)testRunForTestName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SNTestRun *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SNTestSuite testCases](self, "testCases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[SNTestRun initWithTestCase:testSuite:]([SNTestRun alloc], "initWithTestCase:testSuite:", v6, self);
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[SNTestSuite subTestSuites](self, "subTestSuites", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "testRunForTestName:", v4);
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v7 = (SNTestRun *)v13;

            goto LABEL_13;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          continue;
        break;
      }
    }

    v7 = 0;
  }
LABEL_13:

  return v7;
}

- (id)testSetupList
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[SNTestSuite conformsToProtocol:](self, "conformsToProtocol:", &unk_1EFF481E0))
    objc_msgSend(v3, "addObject:", self);
  -[SNTestSuite parentTestSuite](self, "parentTestSuite");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EFF481E0))
        objc_msgSend(v3, "insertObject:atIndex:", v5, 0);
      objc_msgSend(v5, "parentTestSuite");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    while (v6);
  }
  return v3;
}

- (SNTestSuite)parentTestSuite
{
  return (SNTestSuite *)objc_loadWeakRetained((id *)&self->_parentTestSuite);
}

@end
