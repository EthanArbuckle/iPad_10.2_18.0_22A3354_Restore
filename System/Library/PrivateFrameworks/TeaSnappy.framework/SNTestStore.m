@implementation SNTestStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testCases, 0);
  objc_storeStrong((id *)&self->_testSuites, 0);
  objc_storeStrong((id *)&self->_extendedLaunchTest, 0);
}

- (void)addTestSuite:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SNTestStore testSuites](self, "testSuites");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSMutableArray)testSuites
{
  return self->_testSuites;
}

- (SNTestStore)init
{
  SNTestStore *v2;
  NSMutableArray *v3;
  NSMutableArray *testSuites;
  NSMutableDictionary *v5;
  NSMutableDictionary *testCases;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SNTestStore;
  v2 = -[SNTestStore init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    testSuites = v2->_testSuites;
    v2->_testSuites = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    testCases = v2->_testCases;
    v2->_testCases = v5;

  }
  return v2;
}

- (SNTestRun)extendedLaunchTestRun
{
  void *v3;
  SNTestRun *v4;
  void *v5;
  SNTestRun *v6;

  -[SNTestStore extendedLaunchTest](self, "extendedLaunchTest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [SNTestRun alloc];
    -[SNTestStore extendedLaunchTest](self, "extendedLaunchTest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SNTestRun initWithTestCase:testSuite:](v4, "initWithTestCase:testSuite:", v5, 0);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (SNTestCase)extendedLaunchTest
{
  return self->_extendedLaunchTest;
}

- (void)setExtendedLaunchTest:(id)a3
{
  objc_storeStrong((id *)&self->_extendedLaunchTest, a3);
}

- (void)addTestCase:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SNTestStore testCases](self, "testCases");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "testName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

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
  -[SNTestStore testCases](self, "testCases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[SNTestRun initWithTestCase:testSuite:]([SNTestRun alloc], "initWithTestCase:testSuite:", v6, 0);
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[SNTestStore testSuites](self, "testSuites", 0);
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

- (NSMutableDictionary)testCases
{
  return self->_testCases;
}

@end
