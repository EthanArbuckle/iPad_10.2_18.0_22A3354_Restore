@implementation SNTestRunner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testStore, 0);
  objc_storeStrong((id *)&self->_testCoordinator, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

- (SNTestRunner)initWithApplication:(id)a3 testCoordinator:(id)a4 testStore:(id)a5
{
  id v9;
  id v10;
  id v11;
  SNTestRunner *v12;
  SNTestRunner *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SNTestRunner;
  v12 = -[SNTestRunner init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_application, a3);
    objc_storeStrong((id *)&v13->_testCoordinator, a4);
    objc_storeStrong((id *)&v13->_testStore, a5);
  }

  return v13;
}

- (BOOL)runExtendedLaunchTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[SNTestRunner testStore](self, "testStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedLaunchTestRun");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[SNTestRunner testStore](self, "testStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedLaunchTestRun");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SNTestRunner testCoordinator](self, "testCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "launchTestName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SNTestRunner runTestRun:testName:options:fallingBackWith:](self, "runTestRun:testName:options:fallingBackWith:", v6, v8, 0, 0);

  return v9;
}

- (SNTestStore)testStore
{
  return self->_testStore;
}

void __60__SNTestRunner_runTestRun_testName_options_fallingBackWith___block_invoke_3(id *a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v3 = a2;
  objc_msgSend(a1[4], "testCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "requiresRotationForOrientation:", objc_msgSend(a1[5], "orientation"));

  if (v5)
  {
    objc_msgSend(a1[4], "testCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(a1[5], "orientation");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__SNTestRunner_runTestRun_testName_options_fallingBackWith___block_invoke_4;
    v14[3] = &unk_1E9A1EB18;
    v15 = a1[5];
    v16 = a1[6];
    v8 = a1[7];
    v9 = a1[4];
    v17 = v8;
    v18 = v9;
    v19 = v3;
    objc_msgSend(v6, "rotateToOrientation:beforeRotation:afterRotation:", v7, 0, v14);

  }
  else
  {
    v10 = a1[6];
    v11 = a1[7];
    v12 = a1[5];
    objc_msgSend(a1[4], "testCoordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "runTestWithContext:testName:testCoordinator:completion:", v10, v11, v13, v3);

  }
}

- (SNTestCoordinating)testCoordinator
{
  return self->_testCoordinator;
}

- (BOOL)runTestRun:(id)a3 testName:(id)a4 options:(id)a5 fallingBackWith:(id)a6
{
  id v9;
  id v10;
  id v11;
  SNTestChain *v12;
  SNTestContext *v13;
  void *v14;
  SNTestContext *v15;
  uint64_t v16;
  id v17;
  SNTestContext *v18;
  id v19;
  id v20;
  SNTestContext *v21;
  id v22;
  id v23;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  SNTestContext *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  SNTestContext *v33;
  id v34;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = objc_alloc_init(SNTestChain);
  v13 = [SNTestContext alloc];
  -[SNTestRunner application](self, "application");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SNTestContext initWithApplication:testName:](v13, "initWithApplication:testName:", v14, v10);

  v16 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __60__SNTestRunner_runTestRun_testName_options_fallingBackWith___block_invoke;
  v31[3] = &unk_1E9A1EAF0;
  v17 = v9;
  v32 = v17;
  v18 = v15;
  v33 = v18;
  v34 = v11;
  v19 = v11;
  -[SNTestChain addLink:](v12, "addLink:", v31);
  v27[0] = v16;
  v27[1] = 3221225472;
  v27[2] = __60__SNTestRunner_runTestRun_testName_options_fallingBackWith___block_invoke_3;
  v27[3] = &unk_1E9A1EAA0;
  v27[4] = self;
  v28 = v17;
  v29 = v18;
  v20 = v10;
  v30 = v20;
  v21 = v18;
  v22 = v17;
  -[SNTestChain addLink:](v12, "addLink:", v27);
  v25[0] = v16;
  v25[1] = 3221225472;
  v25[2] = __60__SNTestRunner_runTestRun_testName_options_fallingBackWith___block_invoke_5;
  v25[3] = &unk_1E9A1EB40;
  v25[4] = self;
  v26 = v20;
  v23 = v20;
  -[SNTestChain runWithCompletion:](v12, "runWithCompletion:", v25);

  return 1;
}

void __60__SNTestRunner_runTestRun_testName_options_fallingBackWith___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "testCoordinator");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "failedTestWithTestName:failureMessage:", v5, v6);
  }
}

void __60__SNTestRunner_runTestRun_testName_options_fallingBackWith___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (v3 && (v4 = *(_QWORD *)(a1 + 32)) != 0)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __60__SNTestRunner_runTestRun_testName_options_fallingBackWith___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__SNTestRunner_runTestRun_testName_options_fallingBackWith___block_invoke_2;
  v7[3] = &unk_1E9A1EAC8;
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "setupWithContext:completion:", v5, v7);

}

- (UIApplication)application
{
  return self->_application;
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  return -[SNTestRunner runTest:options:fallingBackWith:](self, "runTest:options:fallingBackWith:", a3, a4, 0);
}

- (BOOL)runTest:(id)a3 options:(id)a4 fallingBackWith:(id)a5
{
  id v8;
  id v9;
  uint64_t (**v10)(_QWORD);
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v8 = a3;
  v9 = a4;
  v10 = (uint64_t (**)(_QWORD))a5;
  -[SNTestRunner testStore](self, "testStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "testRunForTestName:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = -[SNTestRunner runTestRun:testName:options:fallingBackWith:](self, "runTestRun:testName:options:fallingBackWith:", v12, v8, v9, v10);
  }
  else
  {
    if (!v10)
    {
      v14 = 0;
      goto LABEL_6;
    }
    v13 = v10[2](v10);
  }
  v14 = v13;
LABEL_6:

  return v14;
}

void __60__SNTestRunner_runTestRun_testName_options_fallingBackWith___block_invoke_4(uint64_t a1, int a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  SNTestFailure *v6;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "testCoordinator");
    v6 = (SNTestFailure *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "runTestWithContext:testName:testCoordinator:completion:", v3, v4);
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 64);
    v6 = -[SNTestFailure initWithMessage:]([SNTestFailure alloc], "initWithMessage:", CFSTR("Failed to rotate to expected orientation before running test case"));
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }

}

@end
