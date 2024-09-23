@implementation CRTestSequencer

- (CRTestSequencer)initWithDelegate:(id)a3
{
  id v4;
  CRTestSequencer *v5;
  CRTestSequencer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRTestSequencer;
  v5 = -[CRTestSequencer init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[CRTestSequencer setDelegate:](v5, "setDelegate:", v4);
    -[CRTestSequencer setStarted:](v6, "setStarted:", 0);
    -[CRTestSequencer initTestSequence](v6, "initTestSequence");
  }

  return v6;
}

- (void)start
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  CRTestContext *v6;
  uint64_t v7;
  mach_header_64 *v8;
  _UNKNOWN **v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _UNKNOWN **v19;
  mach_header_64 *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  ASTSuiteResult *v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  id v48;

  v3 = (void *)os_transaction_create("com.apple.corerepair.testSequencer");
  if (-[CRTestSequencer started](self, "started"))
  {
    v4 = handleForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000377BC();

  }
  else
  {
    v46 = v3;
    -[CRTestSequencer setStarted:](self, "setStarted:", 1);
    v6 = objc_alloc_init(CRTestContext);
    -[CRTestSequencer setTestContext:](self, "setTestContext:", v6);

    v7 = 0;
    v8 = (mach_header_64 *)&_mh_execute_header;
    v9 = &AMFDRRegisterModuleChallengeCallback_ptr;
    do
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testSequence](self, "testSequence"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v7));

      v12 = handleForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
        *(_DWORD *)buf = 138412290;
        v48 = v14;
        _os_log_impl(v8, v13, OS_LOG_TYPE_DEFAULT, "Checking test: %@", buf, 0xCu);

      }
      v15 = v7 + 1;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer delegate](self, "delegate"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[140], "numberWithInteger:", (uint64_t)((double)(v7 + 1) * 0.0625 * 100.0)));
      objc_msgSend(v16, "updateTestSuiteProgress:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testContext](self, "testContext"));
      LODWORD(v16) = objc_msgSend(v11, "shouldRun:", v18);

      if ((_DWORD)v16)
      {
        v19 = v9;
        v20 = v8;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer delegate](self, "delegate"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testContext](self, "testContext"));
        v23 = objc_msgSend(v11, "promptContinue:withContext:", v21, v22);

        v24 = handleForCategory(0);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        if ((v23 & 1) != 0)
        {
          v8 = v20;
          if (v26)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
            *(_DWORD *)buf = 138412290;
            v48 = v27;
            _os_log_impl(v20, v25, OS_LOG_TYPE_DEFAULT, "Running test: %@", buf, 0xCu);

          }
          v28 = dispatch_semaphore_create(0);
          objc_msgSend(v11, "setRunningSemaphore:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer delegate](self, "delegate"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testContext](self, "testContext"));
          objc_msgSend(v11, "run:withContext:", v29, v30);

          dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
        }
        else
        {
          v8 = v20;
          if (v26)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
            *(_DWORD *)buf = 138412290;
            v48 = v31;
            _os_log_impl(v20, v25, OS_LOG_TYPE_DEFAULT, "Cancelling test: %@", buf, 0xCu);

          }
          v28 = objc_alloc_init((Class)ASTTestResult);
          -[NSObject setStatusCode:](v28, "setStatusCode:", &off_100058678);
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testContext](self, "testContext"));
          objc_msgSend(v11, "update:testIndex:testResult:", v32, v7, v28);

        }
        v9 = v19;

      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testContext](self, "testContext"));
      v34 = objc_msgSend(v33, "doRetry");

      if (v34)
      {
        v35 = handleForCategory(0);
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testContext](self, "testContext"));
          v38 = objc_msgSend(v37, "lastRunTestIndex");
          *(_DWORD *)buf = 134217984;
          v48 = v38;
          _os_log_impl(v8, v36, OS_LOG_TYPE_DEFAULT, "Retrying test index: %ld", buf, 0xCu);

        }
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testContext](self, "testContext"));
        v15 = (uint64_t)objc_msgSend(v39, "lastRunTestIndex");

        v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testContext](self, "testContext"));
        objc_msgSend(v40, "setDoRetry:", 0);

        v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testContext](self, "testContext"));
        objc_msgSend(v41, "setLastTestStatusCode:", &off_100058690);

      }
      v7 = v15;
    }
    while (v15 < 16);
    v42 = handleForCategory(0);
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Test sequencer completed", buf, 2u);
    }

    v44 = objc_opt_new(ASTSuiteResult);
    -[CRTestSequencer setSuiteResult:](self, "setSuiteResult:", v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer delegate](self, "delegate"));
    objc_msgSend(v45, "completeTestSuite:description:", CFSTR("Repair Assistant"), CFSTR("SSR suite"));

    -[CRTestSequencer setStarted:](self, "setStarted:", 0);
    -[CRTestSequencer setTestContext:](self, "setTestContext:", 0);
    v3 = v46;
  }

}

- (void)handleResult:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  v5 = 0;
  while (1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testSequence](self, "testSequence"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "runningSemaphore"));

    if (v8)
      break;
    if (++v5 == 16)
    {
      v9 = 0;
      goto LABEL_12;
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testSequence](self, "testSequence"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v5));

  if (!v9
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "runningSemaphore")), v11, !v11))
  {
LABEL_12:
    v20 = handleForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1000377E8();
    goto LABEL_14;
  }
  if (v4)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "testId"));
    if (v12
      && (v13 = (void *)v12,
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statusCode")),
          v14,
          v13,
          v14))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "testId"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "testId"));
      v17 = objc_msgSend(v15, "isEqualToNumber:", v16);

      if ((v17 & 1) != 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testContext](self, "testContext"));
        objc_msgSend(v9, "update:testIndex:testResult:", v18, v5, v4);

        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "runningSemaphore"));
        dispatch_semaphore_signal(v19);

        objc_msgSend(v9, "setRunningSemaphore:", 0);
        goto LABEL_15;
      }
      v24 = handleForCategory(0);
      v21 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_10003786C();
    }
    else
    {
      v22 = handleForCategory(0);
      v21 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_100037840();
    }
  }
  else
  {
    v23 = handleForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_100037814();
  }
LABEL_14:

LABEL_15:
}

- (void)initTestSequence
{
  id v3;
  CRTest_8262 *v4;
  void *v5;
  CRTest_8259 *v6;
  void *v7;
  CRTest_9006 *v8;
  void *v9;
  CRTest_9008 *v10;
  void *v11;
  CRTest_8340 *v12;
  void *v13;
  CRTest_8185_Staged *v14;
  void *v15;
  CRTest_8343 *v16;
  void *v17;
  CRTest_7004 *v18;
  void *v19;
  CRTest_6002 *v20;
  void *v21;
  CRTest_8185_Patch *v22;
  void *v23;
  CRTest_8276 *v24;
  void *v25;
  CRTest_8185_Update *v26;
  void *v27;
  CRTest_8268 *v28;
  void *v29;
  CRTest_8264 *v30;
  void *v31;
  CRTest_8185 *v32;
  void *v33;
  void *v34;
  CRTest_9010 *v35;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 16);
  -[CRTestSequencer setTestSequence:](self, "setTestSequence:", v3);

  v4 = objc_alloc_init(CRTest_8262);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testSequence](self, "testSequence"));
  objc_msgSend(v5, "setObject:atIndexedSubscript:", v4, 0);

  v6 = objc_alloc_init(CRTest_8259);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testSequence](self, "testSequence"));
  objc_msgSend(v7, "setObject:atIndexedSubscript:", v6, 1);

  v8 = objc_alloc_init(CRTest_9006);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testSequence](self, "testSequence"));
  objc_msgSend(v9, "setObject:atIndexedSubscript:", v8, 2);

  v10 = objc_alloc_init(CRTest_9008);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testSequence](self, "testSequence"));
  objc_msgSend(v11, "setObject:atIndexedSubscript:", v10, 3);

  v12 = objc_alloc_init(CRTest_8340);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testSequence](self, "testSequence"));
  objc_msgSend(v13, "setObject:atIndexedSubscript:", v12, 4);

  v14 = objc_alloc_init(CRTest_8185_Staged);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testSequence](self, "testSequence"));
  objc_msgSend(v15, "setObject:atIndexedSubscript:", v14, 5);

  v16 = objc_alloc_init(CRTest_8343);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testSequence](self, "testSequence"));
  objc_msgSend(v17, "setObject:atIndexedSubscript:", v16, 6);

  v18 = objc_alloc_init(CRTest_7004);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testSequence](self, "testSequence"));
  objc_msgSend(v19, "setObject:atIndexedSubscript:", v18, 7);

  v20 = objc_alloc_init(CRTest_6002);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testSequence](self, "testSequence"));
  objc_msgSend(v21, "setObject:atIndexedSubscript:", v20, 8);

  v22 = objc_alloc_init(CRTest_8185_Patch);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testSequence](self, "testSequence"));
  objc_msgSend(v23, "setObject:atIndexedSubscript:", v22, 9);

  v24 = objc_alloc_init(CRTest_8276);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testSequence](self, "testSequence"));
  objc_msgSend(v25, "setObject:atIndexedSubscript:", v24, 10);

  v26 = objc_alloc_init(CRTest_8185_Update);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testSequence](self, "testSequence"));
  objc_msgSend(v27, "setObject:atIndexedSubscript:", v26, 11);

  v28 = objc_alloc_init(CRTest_8268);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testSequence](self, "testSequence"));
  objc_msgSend(v29, "setObject:atIndexedSubscript:", v28, 12);

  v30 = objc_alloc_init(CRTest_8264);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testSequence](self, "testSequence"));
  objc_msgSend(v31, "setObject:atIndexedSubscript:", v30, 13);

  v32 = objc_alloc_init(CRTest_8185);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testSequence](self, "testSequence"));
  objc_msgSend(v33, "setObject:atIndexedSubscript:", v32, 14);

  v35 = objc_alloc_init(CRTest_9010);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRTestSequencer testSequence](self, "testSequence"));
  objc_msgSend(v34, "setObject:atIndexedSubscript:", v35, 15);

}

- (ASTSuiteResult)suiteResult
{
  return self->_suiteResult;
}

- (void)setSuiteResult:(id)a3
{
  objc_storeStrong((id *)&self->_suiteResult, a3);
}

- (ASTRepairSessionProvider)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (NSMutableArray)testSequence
{
  return self->_testSequence;
}

- (void)setTestSequence:(id)a3
{
  objc_storeStrong((id *)&self->_testSequence, a3);
}

- (CRTestContext)testContext
{
  return self->_testContext;
}

- (void)setTestContext:(id)a3
{
  objc_storeStrong((id *)&self->_testContext, a3);
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testContext, 0);
  objc_storeStrong((id *)&self->_testSequence, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_suiteResult, 0);
}

@end
