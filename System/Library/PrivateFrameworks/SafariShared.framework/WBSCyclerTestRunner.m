@implementation WBSCyclerTestRunner

- (WBSCyclerTestRunner)init
{

  return 0;
}

- (WBSCyclerTestRunner)initWithTestSuite:(id)a3 target:(id)a4
{
  id v7;
  id v8;
  WBSCyclerTestRunner *v9;
  WBSCyclerTestRunner *v10;
  uint64_t v11;
  NSMutableArray *pendingRequestQueue;
  uint64_t v13;
  NSMutableArray *pendingRequestCompletionHandlerQueue;
  WBSCyclerTestRunner *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WBSCyclerTestRunner;
  v9 = -[WBSCyclerTestRunner init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_testSuite, a3);
    objc_storeStrong((id *)&v10->_target, a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    pendingRequestQueue = v10->_pendingRequestQueue;
    v10->_pendingRequestQueue = (NSMutableArray *)v11;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    pendingRequestCompletionHandlerQueue = v10->_pendingRequestCompletionHandlerQueue;
    v10->_pendingRequestCompletionHandlerQueue = (NSMutableArray *)v13;

    v15 = v10;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_running)
    -[WBSCyclerTestRunner _stop](self, "_stop");
  v3.receiver = self;
  v3.super_class = (Class)WBSCyclerTestRunner;
  -[WBSCyclerTestRunner dealloc](&v3, sel_dealloc);
}

- (void)runWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__WBSCyclerTestRunner_runWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E4B2A708;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __48__WBSCyclerTestRunner_runWithCompletionHandler___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setUp");
  return objc_msgSend(*(id *)(a1 + 32), "_performNextIterationWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)requestStop
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__WBSCyclerTestRunner_requestStop__block_invoke;
  block[3] = &unk_1E4B2A078;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __34__WBSCyclerTestRunner_requestStop__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 32))
    *(_BYTE *)(v1 + 8) = 1;
  return result;
}

- (void)handleRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__WBSCyclerTestRunner_handleRequest_completionHandler___block_invoke;
  block[3] = &unk_1E4B2A0F0;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __55__WBSCyclerTestRunner_handleRequest_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1[4] + 16), "addObject:", a1[5]);
  v2 = *(void **)(a1[4] + 24);
  v3 = (id)MEMORY[0x1A8599ED0](a1[6]);
  objc_msgSend(v2, "addObject:", v3);

}

- (void)_stop
{
  self->_running = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[WBSCyclerTestSuite tearDown](self->_testSuite, "tearDown");
}

- (void)_performNextIterationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  WBSCyclerTestSuite *testSuite;
  WBSCyclerTestTarget *target;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[WBSCyclerTestSuite isFinished](self->_testSuite, "isFinished") & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    && (-[WBSCyclerTestSuite iterationCounter](self->_testSuite, "iterationCounter"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "hasReachedMaximumIterationCount"),
        v5,
        v6))
  {
    -[WBSCyclerTestRunner _stop](self, "_stop");
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }
  else if (self->_stopRequested)
  {
    -[WBSCyclerTestRunner _stop](self, "_stop");
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 2, 0);
  }
  else
  {
    if (-[NSMutableArray count](self->_pendingRequestQueue, "count"))
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __66__WBSCyclerTestRunner__performNextIterationWithCompletionHandler___block_invoke;
      v12[3] = &unk_1E4B2B768;
      v12[4] = self;
      v13 = v4;
      -[WBSCyclerTestRunner _handleNextPendingRequestWithCompletionHandler:](self, "_handleNextPendingRequestWithCompletionHandler:", v12);
      v7 = v13;
    }
    else
    {
      testSuite = self->_testSuite;
      target = self->_target;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __66__WBSCyclerTestRunner__performNextIterationWithCompletionHandler___block_invoke_2;
      v10[3] = &unk_1E4B2B768;
      v10[4] = self;
      v11 = v4;
      -[WBSCyclerTestSuite runWithTarget:completionHandler:](testSuite, "runWithTarget:completionHandler:", target, v10);
      v7 = v11;
    }

  }
}

void __66__WBSCyclerTestRunner__performNextIterationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v4, "_stop");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v4, "_performNextIterationWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  }

}

void __66__WBSCyclerTestRunner__performNextIterationWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__WBSCyclerTestRunner__performNextIterationWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E4B2A0F0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __66__WBSCyclerTestRunner__performNextIterationWithCompletionHandler___block_invoke_3(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (!v3)
    return objc_msgSend(v2, "_performNextIterationWithCompletionHandler:", a1[6]);
  objc_msgSend(v2, "_stop");
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)_handleNextPendingRequestWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  WBSCyclerTestTarget *target;
  WBSCyclerTestSuite *testSuite;
  void *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD, _QWORD);
  id v12;

  v4 = a3;
  -[NSMutableArray firstObject](self->_pendingRequestQueue, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray firstObject](self->_pendingRequestCompletionHandlerQueue, "firstObject");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectAtIndex:](self->_pendingRequestQueue, "removeObjectAtIndex:", 0);
  -[NSMutableArray removeObjectAtIndex:](self->_pendingRequestCompletionHandlerQueue, "removeObjectAtIndex:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[WBSCyclerTestSuite canHandleRequest:](self->_testSuite, "canHandleRequest:", v5) & 1) != 0)
  {
    testSuite = self->_testSuite;
    target = self->_target;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__WBSCyclerTestRunner__handleNextPendingRequestWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E4B38B70;
    v11 = v6;
    v12 = v4;
    -[WBSCyclerTestSuite handleRequest:withTarget:completionHandler:](testSuite, "handleRequest:withTarget:completionHandler:", v5, target, v10);

  }
  else
  {
    -[WBSCyclerTestRunner _errorWithCode:](self, "_errorWithCode:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v6)[2](v6, v9);

    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __70__WBSCyclerTestRunner__handleNextPendingRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_errorWithCode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  -[WBSCyclerTestRunner _descriptionForErrorCode:](self, "_descriptionForErrorCode:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("WBSCyclerTestRunnerErrorDomain"), a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_descriptionForErrorCode:(int64_t)a3
{
  return CFSTR("Unrecognized request for test suite");
}

- (WBSCyclerTestSuite)testSuite
{
  return self->_testSuite;
}

- (WBSCyclerTestTarget)target
{
  return self->_target;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_testSuite, 0);
  objc_storeStrong((id *)&self->_pendingRequestCompletionHandlerQueue, 0);
  objc_storeStrong((id *)&self->_pendingRequestQueue, 0);
}

@end
