@implementation SNTestRun

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testSuite, 0);
  objc_storeStrong((id *)&self->_testCase, 0);
}

uint64_t __68__SNTestRun_runTestWithContext_testName_testCoordinator_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedTestWithTestName:waitForCommit:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "waitForCommitToFinish"));
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  return v3();
}

- (BOOL)waitForCommitToFinish
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  -[SNTestRun testCase](self, "testCase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EFF47AC8);

  if (!v4)
    return 0;
  -[SNTestRun testCase](self, "testCase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "waitForCommitToFinish");

  return v6;
}

- (SNTestRun)initWithTestCase:(id)a3 testSuite:(id)a4
{
  id v7;
  id v8;
  SNTestRun *v9;
  SNTestRun *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SNTestRun;
  v9 = -[SNTestRun init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_testCase, a3);
    objc_storeStrong((id *)&v10->_testSuite, a4);
  }

  return v10;
}

- (void)setupWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SNTestChain *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(SNTestChain);
  -[SNTestRun testSuite](self, "testSuite");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v20 = v7;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[SNTestRun testSuite](self, "testSuite");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "testSetupList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      v15 = MEMORY[0x1E0C809B0];
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v16);
          v23[0] = v15;
          v23[1] = 3221225472;
          v23[2] = __41__SNTestRun_setupWithContext_completion___block_invoke;
          v23[3] = &unk_1E9A1EA00;
          v23[4] = v17;
          v24 = v6;
          -[SNTestChain addLink:](v8, "addLink:", v23);

          ++v16;
        }
        while (v13 != v16);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v13);
    }

    v7 = v20;
  }
  -[SNTestRun testCase](self, "testCase");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __41__SNTestRun_setupWithContext_completion___block_invoke_2;
    v21[3] = &unk_1E9A1EA00;
    v21[4] = self;
    v22 = v6;
    -[SNTestChain addLink:](v8, "addLink:", v21);

  }
  -[SNTestChain runWithCompletion:](v8, "runWithCompletion:", v7);

}

- (SNTestSuite)testSuite
{
  return self->_testSuite;
}

- (void)runTestWithContext:(id)a3 testName:(id)a4 testCoordinator:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SNTestChain *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  SNTestRun *v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(SNTestChain);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __68__SNTestRun_runTestWithContext_testName_testCoordinator_completion___block_invoke;
  v21 = &unk_1E9A1EAA0;
  v22 = self;
  v23 = v10;
  v24 = v12;
  v25 = v11;
  v15 = v11;
  v16 = v12;
  v17 = v10;
  -[SNTestChain addLink:](v14, "addLink:", &v18);
  -[SNTestChain runWithCompletion:](v14, "runWithCompletion:", v13, v18, v19, v20, v21, v22);

}

- (int64_t)orientation
{
  void *v3;
  int v4;
  void *v5;
  int64_t v6;

  -[SNTestRun testCase](self, "testCase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EFF47AC8);

  if (!v4)
    return 1;
  -[SNTestRun testCase](self, "testCase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "orientation");

  return v6;
}

void __68__SNTestRun_runTestWithContext_testName_testCoordinator_completion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, _QWORD);
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  SNTestFailure *v22;
  char v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  SNTestFailure *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t v32;
  void (**v33)(id, _QWORD);
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t v37;
  void (**v38)(id, _QWORD);
  _QWORD v39[4];
  id v40;
  id v41;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "testCase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EFF48708);

  objc_msgSend(*(id *)(a1 + 32), "testCase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "scrollViewWithContext:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = objc_msgSend(v7, "scrollDirection");
      else
        v9 = 0;
      if (objc_msgSend(MEMORY[0x1E0D83C80], "isRecapAvailable"))
      {
        objc_msgSend(*(id *)(a1 + 48), "recapScrollTestWithTestName:scrollView:", *(_QWORD *)(a1 + 56), v8);
      }
      else
      {
        v23 = objc_opt_respondsToSelector();
        v25 = *(void **)(a1 + 48);
        v24 = *(_QWORD *)(a1 + 56);
        v26 = objc_msgSend(v7, "iterations");
        v27 = objc_msgSend(v7, "offset");
        if ((v23 & 1) != 0)
          objc_msgSend(v25, "scrollTestWithTestName:scrollView:iterations:offset:numberOfScreens:direction:", v24, v8, v26, v27, objc_msgSend(v7, "numberOfScreens"), v9);
        else
          objc_msgSend(v25, "scrollTestWithTestName:scrollView:iterations:offset:direction:", v24, v8, v26, v27, v9);
      }
      v3[2](v3, 0);
    }
    else
    {
      v22 = -[SNTestFailure initWithMessage:]([SNTestFailure alloc], "initWithMessage:", CFSTR("Failed to retrieve UIScrollView for test"));
      ((void (**)(id, SNTestFailure *))v3)[2](v3, v22);

    }
    goto LABEL_20;
  }
  v10 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EFF48768);

  objc_msgSend(*(id *)(a1 + 32), "testCase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v10)
  {
    v12 = *(void **)(a1 + 48);
    v13 = objc_msgSend(v11, "rotateOrientation");
    v14 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __68__SNTestRun_runTestWithContext_testName_testCoordinator_completion___block_invoke_2;
    v39[3] = &unk_1E9A1EA28;
    v40 = *(id *)(a1 + 48);
    v41 = *(id *)(a1 + 56);
    v34[0] = v14;
    v34[1] = 3221225472;
    v34[2] = __68__SNTestRun_runTestWithContext_testName_testCoordinator_completion___block_invoke_3;
    v34[3] = &unk_1E9A1EA50;
    v35 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 32);
    v36 = v15;
    v37 = v16;
    v38 = v3;
    objc_msgSend(v12, "rotateToOrientation:beforeRotation:afterRotation:", v13, v39, v34);

    v17 = v40;
LABEL_9:

LABEL_20:
    goto LABEL_21;
  }
  v18 = objc_msgSend(v11, "conformsToProtocol:", &unk_1EFF487C8);

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 32), "testCase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "startedTestWithTestName:", *(_QWORD *)(a1 + 56));
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __68__SNTestRun_runTestWithContext_testName_testCoordinator_completion___block_invoke_4;
    v29[3] = &unk_1E9A1EA78;
    v19 = *(_QWORD *)(a1 + 40);
    v30 = *(id *)(a1 + 48);
    v20 = *(id *)(a1 + 56);
    v21 = *(_QWORD *)(a1 + 32);
    v31 = v20;
    v32 = v21;
    v33 = v3;
    objc_msgSend(v7, "runTestWithContext:completion:", v19, v29);

    v17 = v30;
    goto LABEL_9;
  }
  v28 = -[SNTestFailure initWithMessage:]([SNTestFailure alloc], "initWithMessage:", CFSTR("Unsupported test case; Requires specific SNTestCase type"));
  ((void (**)(id, SNTestFailure *))v3)[2](v3, v28);

LABEL_21:
}

- (SNTestCase)testCase
{
  return self->_testCase;
}

uint64_t __41__SNTestRun_setupWithContext_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setupTestWithContext:completion:", *(_QWORD *)(a1 + 40), a2);
}

void __41__SNTestRun_setupWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "testCase");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setupTestWithContext:completion:", *(_QWORD *)(a1 + 40), v4);

}

- (void)runTestWithContext:(id)a3 testCoordinator:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SNTestRun testCase](self, "testCase");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "testName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SNTestRun runTestWithContext:testName:testCoordinator:completion:](self, "runTestWithContext:testName:testCoordinator:completion:", v10, v11, v9, v8);

}

uint64_t __68__SNTestRun_runTestWithContext_testName_testCoordinator_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startedTestWithTestName:", *(_QWORD *)(a1 + 40));
}

void __68__SNTestRun_runTestWithContext_testName_testCoordinator_completion___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v3;
  SNTestFailure *v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedTestWithTestName:waitForCommit:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "waitForCommitToFinish"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 56);
    v4 = -[SNTestFailure initWithMessage:]([SNTestFailure alloc], "initWithMessage:", CFSTR("Failed to rotate to expected orientation"));
    (*(void (**)(uint64_t, SNTestFailure *))(v3 + 16))(v3, v4);

  }
}

@end
