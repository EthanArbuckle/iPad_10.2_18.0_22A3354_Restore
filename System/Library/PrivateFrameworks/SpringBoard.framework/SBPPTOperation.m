@implementation SBPPTOperation

- (id)markStartedTest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id startTestBlock;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__SBPPTOperation_markStartedTest___block_invoke;
  v9[3] = &unk_1E8E9F280;
  objc_copyWeak(&v11, &location);
  v10 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D17E5550](v9);
  startTestBlock = self->_startTestBlock;
  self->_startTestBlock = v6;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return self;
}

void __34__SBPPTOperation_markStartedTest___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startedTest:", *(_QWORD *)(a1 + 32));

  SBLogPPT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "operationName");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = *(_QWORD *)(a1 + 32);
    if (v5)
      v8 = v5;
    else
      v8 = (uint64_t)WeakRetained;
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' starting testname '%@'", (uint8_t *)&v9, 0x16u);

  }
}

- (id)markFinishedTest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id finishTestBlock;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__SBPPTOperation_markFinishedTest___block_invoke;
  v9[3] = &unk_1E8E9F280;
  objc_copyWeak(&v11, &location);
  v10 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D17E5550](v9);
  finishTestBlock = self->_finishTestBlock;
  self->_finishTestBlock = v6;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return self;
}

void __35__SBPPTOperation_markFinishedTest___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishedTest:", *(_QWORD *)(a1 + 32));

  SBLogPPT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "operationName");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = *(_QWORD *)(a1 + 32);
    if (v5)
      v8 = v5;
    else
      v8 = (uint64_t)WeakRetained;
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' finished testname '%@'", (uint8_t *)&v9, 0x16u);

  }
}

- (id)markStartSubTest:(id)a3 forTestName:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id startSubTestBlock;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__SBPPTOperation_markStartSubTest_forTestName___block_invoke;
  v13[3] = &unk_1E8EA5EB0;
  objc_copyWeak(&v16, &location);
  v14 = v6;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  v10 = (void *)MEMORY[0x1D17E5550](v13);
  startSubTestBlock = self->_startSubTestBlock;
  self->_startSubTestBlock = v10;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return self;
}

void __47__SBPPTOperation_markStartSubTest_forTestName___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startedSubTest:forTest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  SBLogPPT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "operationName");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = v5;
    else
      v7 = (uint64_t)WeakRetained;
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10 = 138412802;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' started testname '%@' / sub test %@", (uint8_t *)&v10, 0x20u);

  }
}

- (id)markFinishedSubTest:(id)a3 forTestName:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id finishSubTestBlock;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__SBPPTOperation_markFinishedSubTest_forTestName___block_invoke;
  v13[3] = &unk_1E8EA5EB0;
  objc_copyWeak(&v16, &location);
  v14 = v6;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  v10 = (void *)MEMORY[0x1D17E5550](v13);
  finishSubTestBlock = self->_finishSubTestBlock;
  self->_finishSubTestBlock = v10;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return self;
}

void __50__SBPPTOperation_markFinishedSubTest_forTestName___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishedSubTest:forTest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  SBLogPPT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "operationName");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = v5;
    else
      v7 = (uint64_t)WeakRetained;
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10 = 138412802;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' finished testname '%@' / sub test %@", (uint8_t *)&v10, 0x20u);

  }
}

- (void)operationWillStart
{
  NSObject *v3;
  SBPPTOperation *operationName;
  void (**startTestBlock)(void);
  id v6;
  void (**startSubTestBlock)(void);
  id v8;
  int v9;
  SBPPTOperation *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  self->_operationStartTime = CFAbsoluteTimeGetCurrent();
  SBLogPPT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    operationName = (SBPPTOperation *)self->_operationName;
    if (!operationName)
      operationName = self;
    v9 = 138412290;
    v10 = operationName;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' starting", (uint8_t *)&v9, 0xCu);
  }

  startTestBlock = (void (**)(void))self->_startTestBlock;
  if (startTestBlock)
  {
    startTestBlock[2]();
    v6 = self->_startTestBlock;
    self->_startTestBlock = 0;

  }
  startSubTestBlock = (void (**)(void))self->_startSubTestBlock;
  if (startSubTestBlock)
  {
    startSubTestBlock[2]();
    v8 = self->_startSubTestBlock;
    self->_startSubTestBlock = 0;

  }
}

- (void)operationDidFinish
{
  NSObject *v3;
  SBPPTOperation *operationName;
  double v5;
  void (**finishSubTestBlock)(void);
  id v7;
  void (**finishTestBlock)(void);
  id v9;
  int v10;
  SBPPTOperation *v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_operationEndTime = CFAbsoluteTimeGetCurrent();
  SBLogPPT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    operationName = (SBPPTOperation *)self->_operationName;
    if (!operationName)
      operationName = self;
    v5 = self->_operationEndTime - self->_operationStartTime;
    v10 = 138412546;
    v11 = operationName;
    v12 = 2048;
    v13 = v5;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' executed in %f seconds", (uint8_t *)&v10, 0x16u);
  }

  finishSubTestBlock = (void (**)(void))self->_finishSubTestBlock;
  if (finishSubTestBlock)
  {
    finishSubTestBlock[2]();
    v7 = self->_finishSubTestBlock;
    self->_finishSubTestBlock = 0;

  }
  finishTestBlock = (void (**)(void))self->_finishTestBlock;
  if (finishTestBlock)
  {
    finishTestBlock[2]();
    v9 = self->_finishTestBlock;
    self->_finishTestBlock = 0;

  }
}

+ (void)enqueueOperations:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB3828];
  v4 = a3;
  objc_msgSend(v3, "mainQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOperations:waitUntilFinished:", v4, 0);

}

+ (id)operationToUnlockInterface
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "operationToUnlockInterfaceFinishingUIUnlock:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v4);

  return v3;
}

+ (id)operationToUnlockInterfaceFinishingUIUnlock:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v7[4];
  BOOL v8;

  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__SBPPTOperation_operationToUnlockInterfaceFinishingUIUnlock___block_invoke;
  v7[3] = &__block_descriptor_33_e29_v16__0__SBPPTBlockOperation_8l;
  v8 = a3;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __62__SBPPTOperation_operationToUnlockInterfaceFinishingUIUnlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void (**v6)(_QWORD);
  void *v7;
  int v8;
  dispatch_time_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  char v15;

  v3 = a2;
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUILocked");

  if (v5)
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __62__SBPPTOperation_operationToUnlockInterfaceFinishingUIUnlock___block_invoke_3;
    v13 = &unk_1E8E9F508;
    v15 = *(_BYTE *)(a1 + 32);
    v14 = v3;
    v6 = (void (**)(_QWORD))MEMORY[0x1D17E5550](&v10);
    +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance", v10, v11, v12, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "screenIsOn");

    if (v8)
    {
      v6[2](v6);
    }
    else
    {
      __62__SBPPTOperation_operationToUnlockInterfaceFinishingUIUnlock___block_invoke_2();
      v9 = dispatch_time(0, 2000000000);
      dispatch_after(v9, MEMORY[0x1E0C80D38], v6);
    }

  }
  else
  {
    objc_msgSend(v3, "finish");
  }

}

void __62__SBPPTOperation_operationToUnlockInterfaceFinishingUIUnlock___block_invoke_2()
{
  void *v0;
  id v1;

  objc_msgSend((id)SBApp, "lockHardwareButton");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "buttonActions");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "performInitialButtonDownActions");
  objc_msgSend(v1, "performButtonUpPreActions");
  objc_msgSend(v1, "performSinglePressAction");

}

void __62__SBPPTOperation_operationToUnlockInterfaceFinishingUIUnlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__SBPPTOperation_operationToUnlockInterfaceFinishingUIUnlock___block_invoke_4;
  v4[3] = &unk_1E8EA46E8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "attemptUnlockWithPasscode:finishUIUnlock:completion:", CFSTR("1111"), v3, v4);

}

void __62__SBPPTOperation_operationToUnlockInterfaceFinishingUIUnlock___block_invoke_4(uint64_t a1, uint64_t a2, int a3)
{
  dispatch_time_t v4;
  _QWORD block[4];
  id v6;

  if (a3)
  {
    v4 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__SBPPTOperation_operationToUnlockInterfaceFinishingUIUnlock___block_invoke_5;
    block[3] = &unk_1E8E9DED8;
    v6 = *(id *)(a1 + 32);
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cancelAndFailTestWithReason:", CFSTR("Couldn't unlock user interface"));
  }
}

uint64_t __62__SBPPTOperation_operationToUnlockInterfaceFinishingUIUnlock___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)operationToLockInterface
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t v15;

  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBScreenWakeAnimationController backlightFadeDurationForSource:isWake:](SBScreenWakeAnimationController, "backlightFadeDurationForSource:isWake:", 1, objc_msgSend(v3, "screenIsOn"));
  v5 = v4;
  +[SBScreenWakeAnimationController backlightFadeDurationForSource:isWake:](SBScreenWakeAnimationController, "backlightFadeDurationForSource:isWake:", 1, 1);
  v7 = v6;
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__SBPPTOperation_operationToLockInterface__block_invoke;
  v12[3] = &unk_1E8EA9AA8;
  v13 = v3;
  v14 = v5;
  v15 = v7;
  v9 = v3;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v8, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __42__SBPPTOperation_operationToLockInterface__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__SBPPTOperation_operationToLockInterface__block_invoke_2;
  v5[3] = &unk_1E8EA1360;
  v8 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v4 = v3;
  SBPPTSynthesizeEventsForCommandString(CFSTR("b w"), v5);

}

void __42__SBPPTOperation_operationToLockInterface__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;
  id v5;
  uint64_t v6;

  v2 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SBPPTOperation_operationToLockInterface__block_invoke_3;
  block[3] = &unk_1E8EA0AF0;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 56);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

void __42__SBPPTOperation_operationToLockInterface__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  _QWORD v4[4];
  void (**v5)(_QWORD);
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v2 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__SBPPTOperation_operationToLockInterface__block_invoke_4;
  v7[3] = &unk_1E8E9DED8;
  v8 = *(id *)(a1 + 32);
  v3 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v7);
  if (objc_msgSend(*(id *)(a1 + 40), "screenIsOn"))
  {
    v3[2](v3);
  }
  else
  {
    v4[0] = v2;
    v4[1] = 3221225472;
    v4[2] = __42__SBPPTOperation_operationToLockInterface__block_invoke_5;
    v4[3] = &unk_1E8EA9A80;
    v6 = *(_QWORD *)(a1 + 48);
    v5 = v3;
    SBPPTSynthesizeEventsForCommandString(CFSTR("b w"), v4);

  }
}

uint64_t __42__SBPPTOperation_operationToLockInterface__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

void __42__SBPPTOperation_operationToLockInterface__block_invoke_5(uint64_t a1)
{
  dispatch_time_t v2;

  v2 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
  dispatch_after(v2, MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

+ (id)operationToSetInterfaceOrientation:(int64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SBPPTOperation_operationToSetInterfaceOrientation___block_invoke;
  v7[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  v7[4] = a3;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __53__SBPPTOperation_operationToSetInterfaceOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = (void *)*MEMORY[0x1E0CEB258];
  v5 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SBPPTOperation_operationToSetInterfaceOrientation___block_invoke_2;
  v7[3] = &unk_1E8E9E980;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "rotateIfNeeded:completion:", v5, v7);

}

void __53__SBPPTOperation_operationToSetInterfaceOrientation___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SBPPTOperation_operationToSetInterfaceOrientation___block_invoke_3;
  block[3] = &unk_1E8E9DED8;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

uint64_t __53__SBPPTOperation_operationToSetInterfaceOrientation___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)operationToMonitorCoverSheetTransitionWithTestName:(id)a3 execute:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__SBPPTOperation_operationToMonitorCoverSheetTransitionWithTestName_execute___block_invoke;
  v13[3] = &unk_1E8EA9AF0;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v8, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __77__SBPPTOperation_operationToMonitorCoverSheetTransitionWithTestName_execute___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__SBPPTOperation_operationToMonitorCoverSheetTransitionWithTestName_execute___block_invoke_2;
  v10[3] = &unk_1E8E9DED8;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v4, "setPpt_transitionBeginsCallback:", v10);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __77__SBPPTOperation_operationToMonitorCoverSheetTransitionWithTestName_execute___block_invoke_4;
  v7[3] = &unk_1E8E9E820;
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "setPpt_transitionEndsCallback:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __77__SBPPTOperation_operationToMonitorCoverSheetTransitionWithTestName_execute___block_invoke_2(uint64_t a1)
{
  id *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedTest:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("delay"), *(_QWORD *)(a1 + 32));
  v3 = *v2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__SBPPTOperation_operationToMonitorCoverSheetTransitionWithTestName_execute___block_invoke_3;
  v4[3] = &unk_1E8E9DED8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "installCACommitCompletionBlock:", v4);

}

uint64_t __77__SBPPTOperation_operationToMonitorCoverSheetTransitionWithTestName_execute___block_invoke_3(uint64_t a1)
{
  id *v2;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("delay"), *(_QWORD *)(a1 + 32));
  return objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("animation"), *(_QWORD *)(a1 + 32));
}

uint64_t __77__SBPPTOperation_operationToMonitorCoverSheetTransitionWithTestName_execute___block_invoke_4(uint64_t a1)
{
  id *v2;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("animation"), *(_QWORD *)(a1 + 32));
  objc_msgSend(*v2, "finishedTest:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "finish");
}

+ (id)operationToPreventSystemIdle
{
  void *v2;
  void *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v2, &__block_literal_global_24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __46__SBPPTOperation_operationToPreventSystemIdle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  SBWorkspaceSetPreventIdleSleepForReason(1, CFSTR("SBWorkspacePreventIdleSleepReasonPPT"));
  objc_msgSend(v2, "finish");

}

+ (id)operationToResumeSystemIdle
{
  void *v2;
  void *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v2, &__block_literal_global_25_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __45__SBPPTOperation_operationToResumeSystemIdle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  SBWorkspaceSetPreventIdleSleepForReason(0, CFSTR("SBWorkspacePreventIdleSleepReasonPPT"));
  objc_msgSend(v2, "finish");

}

+ (id)operationToWaitForTimeInterval:(double)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SBPPTOperation_operationToWaitForTimeInterval___block_invoke;
  v7[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  *(double *)&v7[4] = a3;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __49__SBPPTOperation_operationToWaitForTimeInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 32) * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SBPPTOperation_operationToWaitForTimeInterval___block_invoke_2;
  block[3] = &unk_1E8E9DED8;
  v7 = v3;
  v5 = v3;
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);

}

uint64_t __49__SBPPTOperation_operationToWaitForTimeInterval___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)operationToWaitForNotificationName:(id)a3 object:(id)a4 timeout:(double)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  double v18;

  v8 = a3;
  v9 = a4;
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__SBPPTOperation_operationToWaitForNotificationName_object_timeout___block_invoke;
  v15[3] = &unk_1E8EA9BA0;
  v16 = v8;
  v17 = v9;
  v18 = a5;
  v11 = v9;
  v12 = v8;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v10, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __68__SBPPTOperation_operationToWaitForNotificationName_object_timeout___block_invoke(double *a1, void *a2)
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__SBPPTOperation_operationToWaitForNotificationName_object_timeout___block_invoke_2;
  v8[3] = &unk_1E8EA9B78;
  v9 = v3;
  v6 = (void *)*((_QWORD *)a1 + 4);
  v5 = (void *)*((_QWORD *)a1 + 5);
  v10 = v6;
  v11 = *((_QWORD *)a1 + 6);
  v7 = v3;
  SBPPTObserveNotification(v6, v5, v8, v4);

}

void __68__SBPPTOperation_operationToWaitForNotificationName_object_timeout___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Didn't observe %@ within %f seconds"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelAndFailTestWithReason:", v3);

  }
}

+ (id)operationToTransitionToHomeScreen
{
  void *v2;
  void *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v2, &__block_literal_global_30_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __51__SBPPTOperation_operationToTransitionToHomeScreen__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v2 = a2;
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createRequestWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "modifyApplicationContext:", &__block_literal_global_33_0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__SBPPTOperation_operationToTransitionToHomeScreen__block_invoke_3;
  v8[3] = &unk_1E8E9E980;
  v9 = v2;
  v5 = v2;
  v6 = (id)objc_msgSend(v4, "addCompletionHandler:", v8);
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "executeTransitionRequest:", v4);

}

void __51__SBPPTOperation_operationToTransitionToHomeScreen__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActivatingEntity:", v3);

}

void __51__SBPPTOperation_operationToTransitionToHomeScreen__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D229B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SBPPTOperation_operationToTransitionToHomeScreen__block_invoke_4;
  v6[3] = &unk_1E8E9DED8;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v4, "eventWithName:handler:", CFSTR("PPTHomeScreenTransition"), v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeOrAppendEvent:", v5);

}

uint64_t __51__SBPPTOperation_operationToTransitionToHomeScreen__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)operationToSaveHomeScreenState
{
  void *v2;
  void *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v2, &__block_literal_global_39_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __48__SBPPTOperation_operationToSaveHomeScreenState__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v2 = a2;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v3, "_ppt_pushHomeScreenStateWithError:", &v8);
  v4 = v8;

  if (v4)
  {
    objc_msgSend(v4, "description");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelAndFailTestWithReason:", v5);

    v2 = (id)v5;
  }
  else
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "iconManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "relayout");

    objc_msgSend(v2, "finish");
  }

}

+ (id)operationToRestoreHomeScreenState
{
  void *v2;
  void *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v2, &__block_literal_global_43);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __51__SBPPTOperation_operationToRestoreHomeScreenState__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_ppt_popHomeScreenState");

  objc_msgSend(v3, "finish");
}

+ (id)operationToCreateFolderWithName:(id)a3 containingIconsForBundleIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__SBPPTOperation_operationToCreateFolderWithName_containingIconsForBundleIdentifiers___block_invoke;
  v13[3] = &unk_1E8EA9C48;
  v14 = v7;
  v15 = v6;
  v9 = v6;
  v10 = v7;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v8, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __86__SBPPTOperation_operationToCreateFolderWithName_containingIconsForBundleIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v25 = a2;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v4, "indexPathForNodeIdentifier:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "iconAtIndexPath:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 && objc_msgSend(v12, "isApplicationIcon"))
          objc_msgSend(v5, "addObject:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v8);
  }

  objc_msgSend(v3, "model");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "makeFolderWithDisplayName:", *(_QWORD *)(a1 + 40));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v4, "removeIcon:options:", v20, 0);
        v21 = (id)objc_msgSend(v14, "addIcon:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v17);
  }

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA3D8]), "initWithFolder:", v14);
  v23 = (id)objc_msgSend(v4, "addIcon:", v22);
  objc_msgSend(v3, "iconManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layoutIconListsWithAnimationType:forceRelayout:", -1, 1);
  objc_msgSend(v25, "finish");

}

+ (id)operationToOpenFolderWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__SBPPTOperation_operationToOpenFolderWithName___block_invoke;
  v9[3] = &unk_1E8EA9C70;
  v10 = v4;
  v6 = v4;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __48__SBPPTOperation_operationToOpenFolderWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  dispatch_time_t v17;
  _QWORD block[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allIcons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v12, "isFolderIcon"))
        {
          objc_msgSend(v12, "displayName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 32));

          if (v14)
          {
            objc_msgSend(v4, "iconManager");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "scrollToIconListContainingIcon:animate:", v12, 0);

            objc_msgSend(v12, "launchFromLocation:context:", *MEMORY[0x1E0DAA9E8], 0);
            v17 = dispatch_time(0, 1000000000);
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __48__SBPPTOperation_operationToOpenFolderWithName___block_invoke_2;
            block[3] = &unk_1E8E9DED8;
            v19 = v3;
            dispatch_after(v17, MEMORY[0x1E0C80D38], block);

            v15 = v7;
            goto LABEL_12;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't find folder named %@"), *(_QWORD *)(a1 + 32));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAndFailTestWithReason:", v15);
LABEL_12:

}

uint64_t __48__SBPPTOperation_operationToOpenFolderWithName___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)operationToPresentAppSwitcher
{
  void *v2;
  void *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v2, &__block_literal_global_48_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __47__SBPPTOperation_operationToPresentAppSwitcher__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v2 = a2;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "embeddedDisplayWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "switcherController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "unlockedEnvironmentMode") == 2)
  {
    objc_msgSend(v2, "finish");
  }
  else
  {
    objc_msgSend(v5, "activateMainSwitcherWithSource:animated:", 21, 1);
    +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eventQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D229B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__SBPPTOperation_operationToPresentAppSwitcher__block_invoke_2;
    v10[3] = &unk_1E8E9DED8;
    v11 = v2;
    objc_msgSend(v8, "eventWithName:handler:", CFSTR("PPTAppSwitcherPresentation"), v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executeOrAppendEvent:", v9);

  }
}

uint64_t __47__SBPPTOperation_operationToPresentAppSwitcher__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)operationToDismissAppSwitcherAndReturnToSource
{
  void *v2;
  void *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v2, &__block_literal_global_51);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __64__SBPPTOperation_operationToDismissAppSwitcherAndReturnToSource__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v2 = a2;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "embeddedDisplayWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "switcherController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "unlockedEnvironmentMode") == 2)
  {
    objc_msgSend(v5, "dismissMainSwitcherWithSource:animated:", 21, 1);
    +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eventQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D229B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__SBPPTOperation_operationToDismissAppSwitcherAndReturnToSource__block_invoke_2;
    v10[3] = &unk_1E8E9DED8;
    v11 = v2;
    objc_msgSend(v8, "eventWithName:handler:", CFSTR("PPTAppSwitcherDismissal"), v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executeOrAppendEvent:", v9);

  }
  else
  {
    objc_msgSend(v2, "finish");
  }

}

uint64_t __64__SBPPTOperation_operationToDismissAppSwitcherAndReturnToSource__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)operationToSaveAppSwitcherState
{
  void *v2;
  void *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v2, &__block_literal_global_54);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __49__SBPPTOperation_operationToSaveAppSwitcherState__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (!SBPPTOperationAppSwitcherStateStack)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = (void *)SBPPTOperationAppSwitcherStateStack;
    SBPPTOperationAppSwitcherStateStack = (uint64_t)v2;

  }
  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_recentAppLayoutsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ppt_currentModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend((id)SBPPTOperationAppSwitcherStateStack, "addObject:", v6);
    objc_msgSend(v7, "finish");
  }
  else
  {
    objc_msgSend(v7, "cancelAndFailTestWithReason:", CFSTR("Couldn't save app switcher state (nothing to save)"));
  }

}

+ (id)operationToRestoreAppSwitcherState
{
  void *v2;
  void *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v2, &__block_literal_global_58);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __52__SBPPTOperation_operationToRestoreAppSwitcherState__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend((id)SBPPTOperationAppSwitcherStateStack, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend((id)SBPPTOperationAppSwitcherStateStack, "removeLastObject");
    +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_recentAppLayoutsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_ppt_setModel:", v2);

    objc_msgSend(v5, "finish");
  }
  else
  {
    objc_msgSend(v5, "cancelAndFailTestWithReason:", CFSTR("Couldn't restore app switcher state (nothing to restore)"));
  }

}

+ (id)operationToLoadPPTAppSwitcherState
{
  void *v2;
  void *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v2, &__block_literal_global_61);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __52__SBPPTOperation_operationToLoadPPTAppSwitcherState__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_recentAppLayoutsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "_ppt_loadStashedModel");

  objc_msgSend(v5, "finish");
}

+ (id)operationToPresentCoverSheet
{
  void *v2;
  void *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v2, &__block_literal_global_62);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __46__SBPPTOperation_operationToPresentCoverSheet__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__SBPPTOperation_operationToPresentCoverSheet__block_invoke_2;
  v5[3] = &unk_1E8E9DED8;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "setCoverSheetPresented:animated:withCompletion:", 1, 1, v5);

}

uint64_t __46__SBPPTOperation_operationToPresentCoverSheet__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)operationToDismissCoverSheet
{
  void *v2;
  void *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v2, &__block_literal_global_63);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __46__SBPPTOperation_operationToDismissCoverSheet__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__SBPPTOperation_operationToDismissCoverSheet__block_invoke_2;
  v5[3] = &unk_1E8E9DED8;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "setCoverSheetPresented:animated:withCompletion:", 0, 1, v5);

}

uint64_t __46__SBPPTOperation_operationToDismissCoverSheet__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)operationToPresentFloatingDock
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__SBPPTOperation_operationToPresentFloatingDock__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  v6[4] = a1;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __48__SBPPTOperation_operationToPresentFloatingDock__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_mainDisplayWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatingDockController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__SBPPTOperation_operationToPresentFloatingDock__block_invoke_2;
    v6[3] = &unk_1E8E9E980;
    v7 = v3;
    objc_msgSend(v5, "presentFloatingDockIfDismissedAnimated:completionHandler:", 0, v6);

  }
  else
  {
    objc_msgSend(v3, "cancelAndFailTestWithReason:", CFSTR("Floating dock not supported"));
  }

}

void __48__SBPPTOperation_operationToPresentFloatingDock__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 48000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SBPPTOperation_operationToPresentFloatingDock__block_invoke_3;
  block[3] = &unk_1E8E9DED8;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

uint64_t __48__SBPPTOperation_operationToPresentFloatingDock__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)operationToDismissFloatingDock
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__SBPPTOperation_operationToDismissFloatingDock__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  v6[4] = a1;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __48__SBPPTOperation_operationToDismissFloatingDock__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_mainDisplayWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatingDockController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__SBPPTOperation_operationToDismissFloatingDock__block_invoke_2;
    v6[3] = &unk_1E8E9E980;
    v7 = v3;
    objc_msgSend(v5, "dismissFloatingDockIfPresentedAnimated:completionHandler:", 0, v6);

  }
  else
  {
    objc_msgSend(v3, "cancelAndFailTestWithReason:", CFSTR("Floating dock not supported"));
  }

}

void __48__SBPPTOperation_operationToDismissFloatingDock__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 48000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SBPPTOperation_operationToDismissFloatingDock__block_invoke_3;
  block[3] = &unk_1E8E9DED8;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

uint64_t __48__SBPPTOperation_operationToDismissFloatingDock__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)operationToPresentBannerNotification
{
  void *v2;
  void *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v2, &__block_literal_global_66_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __54__SBPPTOperation_operationToPresentBannerNotification__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  +[SBNotificationBannerDestination _test_notificationRequestForBannerWithIcon](SBNotificationBannerDestination, "_test_notificationRequestForBannerWithIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "notificationDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bannerDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SBPPTOperation_operationToPresentBannerNotification__block_invoke_2;
  v7[3] = &unk_1E8E9DED8;
  v8 = v2;
  v6 = v2;
  objc_msgSend(v5, "_test_postNotificationRequest:completion:", v3, v7);

}

uint64_t __54__SBPPTOperation_operationToPresentBannerNotification__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)operationToDismissBannerNotification
{
  void *v2;
  void *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v2, &__block_literal_global_68_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __54__SBPPTOperation_operationToDismissBannerNotification__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)SBApp;
  v3 = a2;
  objc_msgSend(v2, "notificationDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bannerDestination");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_test_dismissNotificationRequest:", 0);
  objc_msgSend(v3, "finish");

}

+ (id)operationToPublishExampleNotificationsWithNotificationCount:(unint64_t)a3 threadCount:(unint64_t)a4
{
  void *v6;
  void *v7;
  _QWORD v9[6];

  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90__SBPPTOperation_operationToPublishExampleNotificationsWithNotificationCount_threadCount___block_invoke;
  v9[3] = &__block_descriptor_48_e29_v16__0__SBPPTBlockOperation_8l;
  v9[4] = a3;
  v9[5] = a4;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTimeoutInterval:", 30.0);
  return v7;
}

void __90__SBPPTOperation_operationToPublishExampleNotificationsWithNotificationCount_threadCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  +[SBExampleUserNotificationCenter sharedInstance](SBExampleUserNotificationCenter, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__SBPPTOperation_operationToPublishExampleNotificationsWithNotificationCount_threadCount___block_invoke_2;
  v8[3] = &unk_1E8E9DED8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "publish:numberOfUniqueThreads:completion:", v6, v5, v8);

}

void __90__SBPPTOperation_operationToPublishExampleNotificationsWithNotificationCount_threadCount___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;

  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coverSheetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "mainPageContentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "combinedListViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__30;
  v12[4] = __Block_byref_object_dispose__30;
  v13 = 0;
  v6 = dispatch_queue_create("com.apple.springboard.ppt.ExampleUserNotificationCenter", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__SBPPTOperation_operationToPublishExampleNotificationsWithNotificationCount_threadCount___block_invoke_71;
  block[3] = &unk_1E8E9FD30;
  v11 = v12;
  v9 = v5;
  v10 = *(id *)(a1 + 32);
  v7 = v5;
  dispatch_async(v6, block);

  _Block_object_dispose(v12, 8);
}

void __90__SBPPTOperation_operationToPublishExampleNotificationsWithNotificationCount_threadCount___block_invoke_71(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  +[SBExampleUserNotificationCenter sharedInstance](SBExampleUserNotificationCenter, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "latestNotificationRequestIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v6 = MEMORY[0x1E0C80D38];
    do
    {
      usleep(0x186A0u);
      block[0] = v5;
      block[1] = 3221225472;
      block[2] = __90__SBPPTOperation_operationToPublishExampleNotificationsWithNotificationCount_threadCount___block_invoke_2_72;
      block[3] = &unk_1E8EA9150;
      v13 = *(_QWORD *)(a1 + 48);
      v10 = *(id *)(a1 + 32);
      v11 = v3;
      v12 = v4;
      dispatch_async(v6, block);

    }
    while (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __90__SBPPTOperation_operationToPublishExampleNotificationsWithNotificationCount_threadCount___block_invoke_3;
  v7[3] = &unk_1E8E9DED8;
  v8 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __90__SBPPTOperation_operationToPublishExampleNotificationsWithNotificationCount_threadCount___block_invoke_2_72(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_testingNotificationRequestWithIdentifier:sectionIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __90__SBPPTOperation_operationToPublishExampleNotificationsWithNotificationCount_threadCount___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)operationToRemoveExampleNotifications
{
  void *v2;
  void *v3;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v2, &__block_literal_global_74_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __55__SBPPTOperation_operationToRemoveExampleNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  +[SBExampleUserNotificationCenter sharedInstance](SBExampleUserNotificationCenter, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllNotifications");

  objc_msgSend(v3, "finish");
}

+ (id)operationToActivateApplicationWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__SBPPTOperation_operationToActivateApplicationWithBundleIdentifier___block_invoke;
  v9[3] = &unk_1E8EA9C70;
  v10 = v4;
  v6 = v4;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __69__SBPPTOperation_operationToActivateApplicationWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationWithBundleIdentifier:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__SBPPTOperation_operationToActivateApplicationWithBundleIdentifier___block_invoke_2;
    v7[3] = &unk_1E8EA9DF8;
    v8 = v3;
    v9 = *(id *)(a1 + 32);
    SBWorkspaceActivateApplicationWithActionsAndResult(v5, 0, v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't find application with bundle identifier: %@"), *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelAndFailTestWithReason:", v6);

  }
}

void __69__SBPPTOperation_operationToActivateApplicationWithBundleIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  dispatch_time_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't activate application with bundle identifier: %@"), *(_QWORD *)(a1 + 40));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelAndFailTestWithReason:", v5);

  }
  else
  {
    v4 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__SBPPTOperation_operationToActivateApplicationWithBundleIdentifier___block_invoke_3;
    block[3] = &unk_1E8E9E820;
    v7 = *(id *)(a1 + 40);
    v8 = *(id *)(a1 + 32);
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);

  }
}

void __69__SBPPTOperation_operationToActivateApplicationWithBundleIdentifier___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PPTApplicationActivation (%@)"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D229B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__SBPPTOperation_operationToActivateApplicationWithBundleIdentifier___block_invoke_4;
  v7[3] = &unk_1E8E9DED8;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v5, "eventWithName:handler:", v2, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeOrAppendEvent:", v6);

}

uint64_t __69__SBPPTOperation_operationToActivateApplicationWithBundleIdentifier___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)operationToTerminateApplicationWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__SBPPTOperation_operationToTerminateApplicationWithBundleIdentifier___block_invoke;
  v9[3] = &unk_1E8EA9C70;
  v10 = v4;
  v6 = v4;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __70__SBPPTOperation_operationToTerminateApplicationWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationWithBundleIdentifier:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__SBPPTOperation_operationToTerminateApplicationWithBundleIdentifier___block_invoke_2;
    v7[3] = &unk_1E8E9DEB0;
    v8 = v3;
    v9 = *(id *)(a1 + 32);
    SBWorkspaceTerminateApplication(v5, 7, 0, CFSTR("Terminating for PPT"), v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't find application with bundle identifier: %@"), *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelAndFailTestWithReason:", v6);

  }
}

void __70__SBPPTOperation_operationToTerminateApplicationWithBundleIdentifier___block_invoke_2(uint64_t a1, int a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't terminate application with bundle identifier: %@"), *(_QWORD *)(a1 + 40));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelAndFailTestWithReason:", v3);

  }
}

+ (id)operationToActivateNullOffscreenApp
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "operationToActivateApplicationWithBundleIdentifier:", CFSTR("com.apple.perf.NullOffscreen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOperationName:", v4);

  return v3;
}

+ (id)operationToTerminateNullOffscreenApp
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "operationToTerminateApplicationWithBundleIdentifier:", CFSTR("com.apple.perf.NullOffscreen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOperationName:", v4);

  return v3;
}

+ (id)operationToSetApplicationWithBundleIdentifier:(id)a3 blockedForScreenTime:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  BOOL v13;

  v6 = a3;
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__SBPPTOperation_operationToSetApplicationWithBundleIdentifier_blockedForScreenTime___block_invoke;
  v11[3] = &unk_1E8EA9E20;
  v12 = v6;
  v13 = a4;
  v8 = v6;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __85__SBPPTOperation_operationToSetApplicationWithBundleIdentifier_blockedForScreenTime___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBScreenTimeTestRecipe _setApplicationBundleIdentifiers:blockedForScreenTimeExpiration:](SBScreenTimeTestRecipe, "_setApplicationBundleIdentifiers:blockedForScreenTimeExpiration:", v5, *(unsigned __int8 *)(a1 + 40), v6, v7);

  objc_msgSend(v4, "finish");
}

+ (id)operationToSetAllApplicationsBlockedForScreenTime:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v7[4];
  BOOL v8;

  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__SBPPTOperation_operationToSetAllApplicationsBlockedForScreenTime___block_invoke;
  v7[3] = &__block_descriptor_33_e29_v16__0__SBPPTBlockOperation_8l;
  v8 = a3;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __68__SBPPTOperation_operationToSetAllApplicationsBlockedForScreenTime___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allBundleIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBScreenTimeTestRecipe _setApplicationBundleIdentifiers:blockedForScreenTimeExpiration:](SBScreenTimeTestRecipe, "_setApplicationBundleIdentifiers:blockedForScreenTimeExpiration:", v4, *(unsigned __int8 *)(a1 + 32));

  objc_msgSend(v5, "finish");
}

+ (id)operationToSynthesizeEventsForEventActions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__SBPPTOperation_operationToSynthesizeEventsForEventActions___block_invoke;
  v9[3] = &unk_1E8EA9E48;
  v10 = v4;
  v6 = v4;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __61__SBPPTOperation_operationToSynthesizeEventsForEventActions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SBPPTOperation_operationToSynthesizeEventsForEventActions___block_invoke_2;
  v6[3] = &unk_1E8E9DED8;
  v7 = v3;
  v5 = v3;
  SBPPTSynthesizeEventsForEventActions(v4, v6);

}

uint64_t __61__SBPPTOperation_operationToSynthesizeEventsForEventActions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)operationToSynthesizeEventsForCommandString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__SBPPTOperation_operationToSynthesizeEventsForCommandString___block_invoke;
  v9[3] = &unk_1E8EA9C70;
  v10 = v4;
  v6 = v4;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __62__SBPPTOperation_operationToSynthesizeEventsForCommandString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__SBPPTOperation_operationToSynthesizeEventsForCommandString___block_invoke_2;
  v6[3] = &unk_1E8E9DED8;
  v7 = v3;
  v5 = v3;
  SBPPTSynthesizeEventsForCommandString(v4, v6);

}

uint64_t __62__SBPPTOperation_operationToSynthesizeEventsForCommandString___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)operationToSynthesizeEventsForEventStream:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__SBPPTOperation_operationToSynthesizeEventsForEventStream___block_invoke;
  v9[3] = &unk_1E8EA9C70;
  v10 = v4;
  v6 = v4;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __60__SBPPTOperation_operationToSynthesizeEventsForEventStream___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__SBPPTOperation_operationToSynthesizeEventsForEventStream___block_invoke_2;
  v6[3] = &unk_1E8E9DED8;
  v7 = v3;
  v5 = v3;
  SBPPTSynthesizeEventsForEventStream(v4, v6);

}

uint64_t __60__SBPPTOperation_operationToSynthesizeEventsForEventStream___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)operationToSwipeUpInMiddleOfInterface
{
  void *v4;
  void *v5;
  void *v6;

  SBPPTEventActionsToSwipeUpInMiddleOfInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "operationToSynthesizeEventsForEventActions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v6);

  return v5;
}

+ (id)operationToSwipeDownInMiddleOfInterface
{
  void *v4;
  void *v5;
  void *v6;

  SBPPTEventActionsToSwipeDownInMiddleOfInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "operationToSynthesizeEventsForEventActions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v6);

  return v5;
}

+ (id)operationToSwipeLeftInMiddleOfInterface
{
  void *v4;
  void *v5;
  void *v6;

  SBPPTEventActionsToSwipeLeftInMiddleOfInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "operationToSynthesizeEventsForEventActions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v6);

  return v5;
}

+ (id)operationToSwipeRightInMiddleOfInterface
{
  void *v4;
  void *v5;
  void *v6;

  SBPPTEventActionsToSwipeRightInMiddleOfInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "operationToSynthesizeEventsForEventActions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v6);

  return v5;
}

+ (id)operationToStartTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", &__block_literal_global_91);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOperationName:", v8);

  v9 = (id)objc_msgSend(v5, "markStartedTest:", v4);
  return v5;
}

uint64_t __39__SBPPTOperation_operationToStartTest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "finish");
}

+ (id)operationToFinishTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", &__block_literal_global_94_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOperationName:", v8);

  v9 = (id)objc_msgSend(v5, "markFinishedTest:", v4);
  return v5;
}

uint64_t __40__SBPPTOperation_operationToFinishTest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "finish");
}

- (SBPPTOperation)init
{
  SBPPTOperation *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  NSString *operationName;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBPPTOperation;
  v2 = -[SBPPTOperation init](&v9, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), v5, v2);
    v6 = objc_claimAutoreleasedReturnValue();
    operationName = v2->_operationName;
    v2->_operationName = (NSString *)v6;

  }
  return v2;
}

+ (id)_mainDisplayWindowScene
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedWindowScenes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_firstObjectPassingTest:", &__block_literal_global_98_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __41__SBPPTOperation__mainDisplayWindowScene__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMainDisplayWindowScene");
}

- (NSString)operationName
{
  return self->_operationName;
}

- (void)setOperationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationName, 0);
  objc_storeStrong(&self->_startSubTestBlock, 0);
  objc_storeStrong(&self->_finishSubTestBlock, 0);
  objc_storeStrong(&self->_startTestBlock, 0);
  objc_storeStrong(&self->_finishTestBlock, 0);
}

+ (id)operationToUpdateHomeScreenPagesForActiveFocusModeForTestWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __105__SBPPTOperation_FocusModePPTSupport__operationToUpdateHomeScreenPagesForActiveFocusModeForTestWithName___block_invoke;
  v14 = &unk_1E8EA9C48;
  v15 = v4;
  v16 = v5;
  v6 = v5;
  v7 = v4;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setName:", v9, v11, v12, v13, v14);

  return v8;
}

void __105__SBPPTOperation_FocusModePPTSupport__operationToUpdateHomeScreenPagesForActiveFocusModeForTestWithName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  v4 = (id)objc_msgSend(v6, "markStartSubTest:forTestName:", CFSTR("UpdateHomeScreenPagesForActiveFocusMode"), v3);
  objc_msgSend(*(id *)(a1 + 40), "updateRootFolderWithCurrentDoNotDisturbState");
  v5 = (id)objc_msgSend(v6, "markFinishedSubTest:forTestName:", CFSTR("UpdateHomeScreenPagesForActiveFocusMode"), *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "finish");

}

+ (id)operationToPresentPageManagementForTestWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __92__SBPPTOperation_PageManagementPPTSupport__operationToPresentPageManagementForTestWithName___block_invoke;
  v15 = &unk_1E8EA9C48;
  v16 = v5;
  v17 = v4;
  v6 = v4;
  v7 = v5;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setName:", v9, v12, v13, v14, v15);

  v10 = (id)objc_msgSend(v8, "markStartSubTest:forTestName:", CFSTR("PresentPageManagement"), v6);
  return v8;
}

void __92__SBPPTOperation_PageManagementPPTSupport__operationToPresentPageManagementForTestWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __92__SBPPTOperation_PageManagementPPTSupport__operationToPresentPageManagementForTestWithName___block_invoke_2;
  v6[3] = &unk_1E8E9E820;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "_presentPageManagement:", v6);

}

uint64_t __92__SBPPTOperation_PageManagementPPTSupport__operationToPresentPageManagementForTestWithName___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "markFinishedSubTest:forTestName:", CFSTR("PresentPageManagement"), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)operationToDismissPageManagementForTestWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __92__SBPPTOperation_PageManagementPPTSupport__operationToDismissPageManagementForTestWithName___block_invoke;
  v15 = &unk_1E8EA9C48;
  v16 = v5;
  v17 = v4;
  v6 = v4;
  v7 = v5;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setName:", v9, v12, v13, v14, v15);

  v10 = (id)objc_msgSend(v8, "markStartSubTest:forTestName:", CFSTR("DismissPageManagement"), v6);
  return v8;
}

void __92__SBPPTOperation_PageManagementPPTSupport__operationToDismissPageManagementForTestWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __92__SBPPTOperation_PageManagementPPTSupport__operationToDismissPageManagementForTestWithName___block_invoke_2;
  v6[3] = &unk_1E8E9E820;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "_dismissPageManagementIfPresented:", v6);

}

uint64_t __92__SBPPTOperation_PageManagementPPTSupport__operationToDismissPageManagementForTestWithName___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "markFinishedSubTest:forTestName:", CFSTR("DismissPageManagement"), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)presentAppLibrary:(BOOL)a3 forTestWithName:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[5];
  BOOL v14;

  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__SBPPTOperation_SBAppLibrarySupport__presentAppLibrary_forTestWithName___block_invoke;
  v13[3] = &__block_descriptor_41_e29_v16__0__SBPPTBlockOperation_8l;
  v13[4] = a1;
  v14 = a3;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOperationName:", v9);

  objc_msgSend(v8, "setTimeoutInterval:", 30.0);
  v10 = (id)objc_msgSend(v8, "markStartSubTest:forTestName:", CFSTR("AppLibraryPresent"), v7);
  v11 = (id)objc_msgSend(v8, "markFinishedSubTest:forTestName:", CFSTR("AppLibraryPresent"), v7);

  return v8;
}

void __73__SBPPTOperation_SBAppLibrarySupport__presentAppLibrary_forTestWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__SBPPTOperation_SBAppLibrarySupport__presentAppLibrary_forTestWithName___block_invoke_2;
  v9[3] = &unk_1E8EA78D8;
  v6 = v3;
  v10 = v6;
  if (objc_msgSend(v5, "_isLibraryPresentationAllowedWithCompletion:", v9))
  {
    if (objc_msgSend(v4, "isModalAppLibrarySupported"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_mainDisplayWindowScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "modalLibraryController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "presentLibraryAnimated:completion:", *(unsigned __int8 *)(a1 + 40), 0);
    }
    else
    {
      objc_msgSend(v4, "presentLibraryFromOverlayControllerAnimated:completion:", *(unsigned __int8 *)(a1 + 40), 0);
    }
  }

}

void __73__SBPPTOperation_SBAppLibrarySupport__presentAppLibrary_forTestWithName___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(a2, "description");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelAndFailTestWithReason:", v3);

  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __73__SBPPTOperation_SBAppLibrarySupport__presentAppLibrary_forTestWithName___block_invoke_3;
    v4[3] = &unk_1E8E9DED8;
    v5 = *(id *)(a1 + 32);
    SBPPTPerformAfterCommitWithDelay(v4, 1.0);

  }
}

uint64_t __73__SBPPTOperation_SBAppLibrarySupport__presentAppLibrary_forTestWithName___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)dismissAppLibraryPad:(BOOL)a3 forTestWithName:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[5];
  BOOL v14;

  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryPad_forTestWithName___block_invoke;
  v13[3] = &__block_descriptor_41_e29_v16__0__SBPPTBlockOperation_8l;
  v13[4] = a1;
  v14 = a3;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOperationName:", v9);

  objc_msgSend(v8, "setTimeoutInterval:", 30.0);
  v10 = (id)objc_msgSend(v8, "markStartSubTest:forTestName:", CFSTR("AppLibraryPadDismiss"), v7);
  v11 = (id)objc_msgSend(v8, "markFinishedSubTest:forTestName:", CFSTR("AppLibraryPadDismiss"), v7);

  return v8;
}

void __76__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryPad_forTestWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryPad_forTestWithName___block_invoke_2;
  v9[3] = &unk_1E8EA78D8;
  v6 = v3;
  v10 = v6;
  if (objc_msgSend(v5, "_isLibraryDismissalAllowedWithCompletion:", v9))
  {
    if (objc_msgSend(v4, "isModalAppLibrarySupported"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_mainDisplayWindowScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "modalLibraryController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "dismissLibraryAnimated:completion:", *(unsigned __int8 *)(a1 + 40), 0);
    }
    else
    {
      objc_msgSend(v4, "dismissLibraryFromOverlayControllerAnimated:completion:", *(unsigned __int8 *)(a1 + 40), 0);
    }
  }

}

void __76__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryPad_forTestWithName___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(a2, "description");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelAndFailTestWithReason:", v3);

  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __76__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryPad_forTestWithName___block_invoke_3;
    v4[3] = &unk_1E8E9DED8;
    v5 = *(id *)(a1 + 32);
    SBPPTPerformAfterCommitWithDelay(v4, 1.0);

  }
}

uint64_t __76__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryPad_forTestWithName___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (BOOL)_isLibraryPresentationAllowedWithCompletion:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  int v6;
  void *v7;
  BOOL v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v3 = (void (**)(id, void *))a3;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isAppLibraryAllowed") & 1) == 0)
  {
    if (v3)
    {
LABEL_6:
      SBHLibraryPresentationErrorForCode();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3[2](v3, v7);

    }
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUILocked");

  if (v6)
  {
    if (v3)
      goto LABEL_6;
    goto LABEL_7;
  }
  objc_msgSend((id)SBApp, "windowSceneManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeDisplayWindowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutStateProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "unlockedEnvironmentMode") == 1)
  {

  }
  else
  {
    v14 = objc_msgSend(v4, "isModalAppLibrarySupported");

    if ((v14 & 1) == 0)
    {
      if (!v3)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  if (v3)
    v3[2](v3, 0);
  v8 = 1;
LABEL_8:

  return v8;
}

+ (BOOL)_isLibraryDismissalAllowedWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  void *v14;

  v4 = (void (**)(id, void *))a3;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mainDisplayWindowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isAppLibraryAllowed") & 1) == 0)
  {
    if (!v4)
      goto LABEL_18;
LABEL_17:
    SBHLibraryPresentationErrorForCode();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v14);

    goto LABEL_18;
  }
  if (objc_msgSend(v5, "isModalAppLibrarySupported"))
  {
    objc_msgSend(v6, "modalLibraryController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isPresentingLibrary");
  }
  else
  {
    objc_msgSend(v5, "iconManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isMainDisplayLibraryViewVisible");
  }
  v9 = v8;

  if ((v9 & 1) == 0)
  {
    if (!v4)
      goto LABEL_18;
    goto LABEL_17;
  }
  objc_msgSend(v6, "layoutStateProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "unlockedEnvironmentMode") != 1)
  {
    v12 = objc_msgSend(v5, "isModalAppLibrarySupported");

    if ((v12 & 1) != 0)
      goto LABEL_13;
    if (v4)
      goto LABEL_17;
LABEL_18:
    v13 = 0;
    goto LABEL_19;
  }

LABEL_13:
  if (v4)
    v4[2](v4, 0);
  v13 = 1;
LABEL_19:

  return v13;
}

+ (id)resetAndPrepareforNextTest
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__SBPPTOperation_SBAppLibrarySupport__resetAndPrepareforNextTest__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  v6[4] = a1;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOperationName:", v4);

  objc_msgSend(v3, "setTimeoutInterval:", 30.0);
  return v3;
}

void __65__SBPPTOperation_SBAppLibrarySupport__resetAndPrepareforNextTest__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootFolderController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_libraryViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissSearch");
  objc_msgSend(v7, "_dismissExpandedPods:completion:", 0, 0);
  objc_msgSend(v7, "podFolderViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentScrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_scrollToTopIfPossible:", 0);
  v10 = *(void **)(a1 + 32);
  v11 = objc_msgSend(v6, "firstIconPageIndex");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__SBPPTOperation_SBAppLibrarySupport__resetAndPrepareforNextTest__block_invoke_2;
  v13[3] = &unk_1E8E9E980;
  v14 = v3;
  v12 = v3;
  objc_msgSend(v10, "_dismissOverlaysAndResetHomeScreenToPage:animated:operation:completion:", v11, 0, 0, v13);

}

void __65__SBPPTOperation_SBAppLibrarySupport__resetAndPrepareforNextTest__block_invoke_2(uint64_t a1, char a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetCategories");

  if ((a2 & 1) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __65__SBPPTOperation_SBAppLibrarySupport__resetAndPrepareforNextTest__block_invoke_3;
    v5[3] = &unk_1E8E9DED8;
    v6 = *(id *)(a1 + 32);
    SBPPTPerformAfterCommitWithDelay(v5, 1.0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cancelAndFailTestWithReason:", CFSTR("unable to reset home screen"));
  }
}

uint64_t __65__SBPPTOperation_SBAppLibrarySupport__resetAndPrepareforNextTest__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)presentAppLibrarySearchByTappingSearchField
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  objc_msgSend(a1, "_libraryViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__SBPPTOperation_SBAppLibrarySupport__presentAppLibrarySearchByTappingSearchField__block_invoke;
  v13[3] = &unk_1E8EA9BA0;
  v14 = v7;
  v15 = v6;
  v16 = a1;
  v8 = v6;
  v9 = v7;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOperationName:", v11);

  return v10;
}

void __82__SBPPTOperation_SBAppLibrarySupport__presentAppLibrarySearchByTappingSearchField__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *MEMORY[0x1E0DAA850];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__SBPPTOperation_SBAppLibrarySupport__presentAppLibrarySearchByTappingSearchField__block_invoke_2;
  v13[3] = &unk_1E8EA1C98;
  v14 = v3;
  v7 = v3;
  objc_msgSend(v4, "installNotificationObserverForNotificationName:notificationCenter:forOneNotification:usingBlock:", v5, v6, 1, v13);

  objc_msgSend(*(id *)(a1 + 40), "searchTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "center");
  v10 = v9;
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 48), "_appLibrarySupport_performTapAtPoint:fromView:withCompletion:", *(_QWORD *)(a1 + 40), &__block_literal_global_70_1, v10, v12);
}

void __82__SBPPTOperation_SBAppLibrarySupport__presentAppLibrarySearchByTappingSearchField__block_invoke_2(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __82__SBPPTOperation_SBAppLibrarySupport__presentAppLibrarySearchByTappingSearchField__block_invoke_3;
  v1[3] = &unk_1E8E9DED8;
  v2 = *(id *)(a1 + 32);
  SBPPTPerformAfterCommitWithDelay(v1, 1.0);

}

uint64_t __82__SBPPTOperation_SBAppLibrarySupport__presentAppLibrarySearchByTappingSearchField__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)resetAppLibraryToTop
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__SBPPTOperation_SBAppLibrarySupport__resetAppLibraryToTop__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  v6[4] = a1;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOperationName:", v4);

  return v3;
}

void __59__SBPPTOperation_SBAppLibrarySupport__resetAppLibraryToTop__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_libraryViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "podFolderViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_scrollToTopIfPossible:", 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__SBPPTOperation_SBAppLibrarySupport__resetAppLibraryToTop__block_invoke_2;
  v8[3] = &unk_1E8E9DED8;
  v9 = v3;
  v7 = v3;
  SBPPTPerformAfterCommitWithDelay(v8, 0.0);

}

uint64_t __59__SBPPTOperation_SBAppLibrarySupport__resetAppLibraryToTop__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)dismissAppLibrarySearch
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__SBPPTOperation_SBAppLibrarySupport__dismissAppLibrarySearch__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  v6[4] = a1;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOperationName:", v4);

  objc_msgSend(v3, "setTimeoutInterval:", 30.0);
  return v3;
}

void __62__SBPPTOperation_SBAppLibrarySupport__dismissAppLibrarySearch__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v3 = a2;
  +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_defaultPPTNotificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTestName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0DAA858];
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __62__SBPPTOperation_SBAppLibrarySupport__dismissAppLibrarySearch__block_invoke_2;
  v20[3] = &unk_1E8EA1C98;
  v9 = v6;
  v21 = v9;
  objc_msgSend(v4, "installNotificationObserverForNotificationName:notificationCenter:forOneNotification:usingBlock:", v7, v5, 1, v20);
  v10 = *MEMORY[0x1E0DAA848];
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __62__SBPPTOperation_SBAppLibrarySupport__dismissAppLibrarySearch__block_invoke_3;
  v17[3] = &unk_1E8EAF9A8;
  v18 = v9;
  v19 = v3;
  v11 = v3;
  v12 = v9;
  objc_msgSend(v4, "installNotificationObserverForNotificationName:notificationCenter:forOneNotification:usingBlock:", v10, v5, 1, v17);
  objc_msgSend(*(id *)(a1 + 32), "_libraryViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "containerViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "searchBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "cancelButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendActionsForControlEvents:", 64);

}

uint64_t __62__SBPPTOperation_SBAppLibrarySupport__dismissAppLibrarySearch__block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("DeweyPullToLibrarySearchDismiss"), *(_QWORD *)(a1 + 32));
}

void __62__SBPPTOperation_SBAppLibrarySupport__dismissAppLibrarySearch__block_invoke_3(uint64_t a1)
{
  _QWORD v2[4];
  id v3;

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("DeweyPullToLibrarySearchDismiss"), *(_QWORD *)(a1 + 32));
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__SBPPTOperation_SBAppLibrarySupport__dismissAppLibrarySearch__block_invoke_4;
  v2[3] = &unk_1E8E9DED8;
  v3 = *(id *)(a1 + 40);
  SBPPTPerformAfterCommitWithDelay(v2, 1.0);

}

uint64_t __62__SBPPTOperation_SBAppLibrarySupport__dismissAppLibrarySearch__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)pullToAppLibrarySearch
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  v6[4] = a1;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOperationName:", v4);

  return v3;
}

void __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;

  v3 = a2;
  +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_defaultPPTNotificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTestName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_libraryViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contentScrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "center");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v11, "center");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v11, "size");
  v21 = v19 + v20 * 0.75;
  v22 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_2;
  v35[3] = &unk_1E8E9E820;
  v23 = v3;
  v36 = v23;
  v37 = v9;
  v24 = v9;
  +[SBPPTOperation _appLibrarySupport_performDragFromPoint:andDragTo:duration:fromView:withCompletion:](SBPPTOperation, "_appLibrarySupport_performDragFromPoint:andDragTo:duration:fromView:withCompletion:", 0, v35, v13, v15, v17, v21, 1.0);
  v25 = *MEMORY[0x1E0DAA860];
  v33[0] = v22;
  v33[1] = 3221225472;
  v33[2] = __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_4;
  v33[3] = &unk_1E8EA1C98;
  v26 = v6;
  v34 = v26;
  objc_msgSend(v4, "installNotificationObserverForNotificationName:notificationCenter:forOneNotification:usingBlock:", v25, v5, 1, v33);
  v27 = *MEMORY[0x1E0DAA850];
  v30[0] = v22;
  v30[1] = 3221225472;
  v30[2] = __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_5;
  v30[3] = &unk_1E8EAF9A8;
  v31 = v26;
  v32 = v23;
  v28 = v23;
  v29 = v26;
  objc_msgSend(v4, "installNotificationObserverForNotificationName:notificationCenter:forOneNotification:usingBlock:", v27, v5, 1, v30);

}

void __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = dispatch_time(0, 1000000000);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_3;
  v3[3] = &unk_1E8E9E820;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E0C80D38], v3);

}

void __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "searchTextField");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isFirstResponder");

    if ((v3 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "cancelAndFailTestWithReason:", CFSTR("Search bar still active; test failed."));
  }
}

uint64_t __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_4(uint64_t a1)
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("DeweyPullToLibrarySearchPresent"), *(_QWORD *)(a1 + 32));
}

void __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_5(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_6;
  v2[3] = &unk_1E8E9E820;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  SBPPTPerformAfterCommitWithDelay(v2, 0.75);

}

void __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_6(uint64_t a1)
{
  _QWORD v2[4];
  id v3;

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("DeweyPullToLibrarySearchPresent"), *(_QWORD *)(a1 + 32));
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_7;
  v2[3] = &unk_1E8E9DED8;
  v3 = *(id *)(a1 + 40);
  SBPPTPerformAfterCommitWithDelay(v2, 1.0);

}

uint64_t __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)presentAppLibraryForTestWithName:(id)a3
{
  return (id)objc_msgSend(a1, "presentAppLibrary:forTestWithName:", 1, a3);
}

+ (id)presentAppLibraryPhone
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SBPPTOperation_SBAppLibrarySupport__presentAppLibraryPhone__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  v6[4] = a1;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __61__SBPPTOperation_SBAppLibrarySupport__presentAppLibraryPhone__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SBPPTOperation_SBAppLibrarySupport__presentAppLibraryPhone__block_invoke_2;
  v6[3] = &unk_1E8E9E980;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_appLibrarySupport_performPanGesturesOnScreenUntilOnDeweyOverlayWithCompletion:", v6);

}

void __61__SBPPTOperation_SBAppLibrarySupport__presentAppLibraryPhone__block_invoke_2(uint64_t a1, int a2)
{
  _QWORD v2[4];
  id v3;

  if (a2)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __61__SBPPTOperation_SBAppLibrarySupport__presentAppLibraryPhone__block_invoke_3;
    v2[3] = &unk_1E8E9DED8;
    v3 = *(id *)(a1 + 32);
    SBPPTPerformAfterCommitWithDelay(v2, 0.0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cancelAndFailTestWithReason:", CFSTR("Unable to pan HomeScreen to App Library overlay"));
  }
}

uint64_t __61__SBPPTOperation_SBAppLibrarySupport__presentAppLibraryPhone__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)dismissOverlaysAndResetHomeScreenToPage:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  unint64_t v17;
  BOOL v18;

  v9 = a5;
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __99__SBPPTOperation_SBAppLibrarySupport__dismissOverlaysAndResetHomeScreenToPage_animated_completion___block_invoke;
  v14[3] = &unk_1E8EC0F70;
  v16 = a1;
  v17 = a3;
  v18 = a4;
  v15 = v9;
  v11 = v9;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v10, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __99__SBPPTOperation_SBAppLibrarySupport__dismissOverlaysAndResetHomeScreenToPage_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "_dismissOverlaysAndResetHomeScreenToPage:animated:operation:completion:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), a2, *(_QWORD *)(a1 + 32));
}

+ (void)_dismissOverlaysAndResetHomeScreenToPage:(unint64_t)a3 animated:(BOOL)a4 operation:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  unint64_t v47;

  v9 = a5;
  v10 = a6;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rootFolderController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "homeScreenOverlayController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentTestName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  SBDismissSpotlight();
  v35 = v12;
  v32 = a1;
  v16 = a3;
  if (objc_msgSend(v11, "isModalAppLibrarySupported"))
  {
    objc_msgSend(a1, "_mainDisplayWindowScene");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "modalLibraryController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "libraryViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v18;
    v20 = objc_msgSend(v18, "isPresentingLibrary");
  }
  else
  {
    objc_msgSend(v11, "overlayLibraryViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v12, "isMainDisplayLibraryViewVisible");
    v34 = 0;
  }
  v21 = v9;
  if (objc_msgSend(v19, "isPresentingSearch", v32))
    objc_msgSend(v19, "dismissSearch");
  objc_msgSend(v19, "_dismissExpandedPods:completion:", 0, 0);
  v36 = v15;
  objc_msgSend(v15, "setupKeyboardAnimationSubTestsForTestName:", v37);
  v22 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __110__SBPPTOperation_SBAppLibrarySupport___dismissOverlaysAndResetHomeScreenToPage_animated_operation_completion___block_invoke;
  v42[3] = &unk_1E8EBB028;
  v23 = v13;
  v43 = v23;
  v47 = v16;
  v24 = v14;
  v44 = v24;
  v25 = v10;
  v46 = v25;
  v26 = v21;
  v45 = v26;
  v27 = MEMORY[0x1D17E5550](v42);
  v28 = (void *)v27;
  if (v20)
  {
    v38[0] = v22;
    v38[1] = 3221225472;
    v38[2] = __110__SBPPTOperation_SBAppLibrarySupport___dismissOverlaysAndResetHomeScreenToPage_animated_operation_completion___block_invoke_4;
    v38[3] = &unk_1E8EC0F98;
    v40 = v25;
    v39 = v26;
    v41 = v28;
    v30 = v34;
    v29 = v35;
    if (objc_msgSend(v33, "_isLibraryDismissalAllowedWithCompletion:", v38))
    {
      if (v34)
        v31 = v34;
      else
        v31 = v11;
      objc_msgSend(v31, "dismissLibraryAnimated:completion:", 0, 0);
    }

  }
  else
  {
    (*(void (**)(uint64_t))(v27 + 16))(v27);
    v30 = v34;
    v29 = v35;
  }

}

void __110__SBPPTOperation_SBAppLibrarySupport___dismissOverlaysAndResetHomeScreenToPage_animated_operation_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __110__SBPPTOperation_SBAppLibrarySupport___dismissOverlaysAndResetHomeScreenToPage_animated_operation_completion___block_invoke_2;
  v6[3] = &unk_1E8EBB028;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 64);
  v7 = v4;
  v11 = v5;
  v8 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v4, "setCurrentPageIndex:animated:completion:", v3, 0, v6);

}

void __110__SBPPTOperation_SBAppLibrarySupport___dismissOverlaysAndResetHomeScreenToPage_animated_operation_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v2 = (void *)*MEMORY[0x1E0CEB258];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __110__SBPPTOperation_SBAppLibrarySupport___dismissOverlaysAndResetHomeScreenToPage_animated_operation_completion___block_invoke_3;
  v5[3] = &unk_1E8EBB028;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 64);
  v6 = v3;
  v10 = v4;
  v7 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_performBlockAfterCATransactionCommits:", v5);

}

uint64_t __110__SBPPTOperation_SBAppLibrarySupport___dismissOverlaysAndResetHomeScreenToPage_animated_operation_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  if (objc_msgSend(*(id *)(a1 + 32), "currentPageIndex") == *(_QWORD *)(a1 + 64)
    && (objc_msgSend(*(id *)(a1 + 40), "isPresented") & 1) == 0)
  {
    v4 = *(_QWORD *)(a1 + 56);
    if (v4)
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
    return objc_msgSend(*(id *)(a1 + 48), "finish");
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 56);
    if (v2)
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
    return objc_msgSend(*(id *)(a1 + 48), "cancelAndFailTestWithReason:", CFSTR("Unable to scroll to page!"));
  }
}

void __110__SBPPTOperation_SBAppLibrarySupport___dismissOverlaysAndResetHomeScreenToPage_animated_operation_completion___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = a1[5];
  v7 = v3;
  if (v3)
  {
    if (v4)
    {
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
      v3 = v7;
    }
    v5 = (void *)a1[4];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to dismiss home screen overlay controller: %@"), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelAndFailTestWithReason:", v6);

  }
  else
  {
    if (v4)
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
    (*(void (**)(void))(a1[6] + 16))();
  }

}

uint64_t __62__SBPPTOperation_SBAppLibrarySupport___mainDisplayWindowScene__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMainDisplayWindowScene");
}

+ (id)_libraryViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isModalAppLibrarySupported"))
  {
    objc_msgSend(a1, "_mainDisplayWindowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modalLibraryController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "libraryViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "overlayLibraryViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (BOOL)isLibraryPresented
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isModalAppLibrarySupported"))
  {
    objc_msgSend(a1, "_mainDisplayWindowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modalLibraryController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "isPresentingLibrary");
  }
  else
  {
    objc_msgSend(v3, "iconManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isMainDisplayLibraryViewVisible");
  }
  v7 = v6;

  return v7;
}

+ (id)dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rootFolderController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dismissOverlaysAndResetHomeScreenToPage:animated:completion:", objc_msgSend(v8, "lastIconPageIndex"), v3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeoutInterval:", 30.0);
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOperationName:", v10);

  return v9;
}

+ (id)dismissOverlaysAndResetHomeScreenToFirstIconPageAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rootFolderController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dismissOverlaysAndResetHomeScreenToPage:animated:completion:", objc_msgSend(v8, "firstIconPageIndex"), v3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeoutInterval:", 30.0);
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOperationName:", v10);

  return v9;
}

+ (id)appLibraryExpandFirstPod
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__SBPPTOperation_SBAppLibrarySupport__appLibraryExpandFirstPod__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  v6[4] = a1;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setTimeoutInterval:", 30.0);
  return v4;
}

void __63__SBPPTOperation_SBAppLibrarySupport__appLibraryExpandFirstPod__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_libraryViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__SBPPTOperation_SBAppLibrarySupport__appLibraryExpandFirstPod__block_invoke_2;
  v6[3] = &unk_1E8E9E980;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_expandPodAtIndex:animated:completion:", 0, 1, v6);

}

void __63__SBPPTOperation_SBAppLibrarySupport__appLibraryExpandFirstPod__block_invoke_2(uint64_t a1, int a2)
{
  _QWORD v2[4];
  id v3;

  if (a2)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __63__SBPPTOperation_SBAppLibrarySupport__appLibraryExpandFirstPod__block_invoke_3;
    v2[3] = &unk_1E8E9DED8;
    v3 = *(id *)(a1 + 32);
    SBPPTPerformAfterCommitWithDelay(v2, 1.0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cancelAndFailTestWithReason:", CFSTR("Unable to expand pod"));
  }
}

uint64_t __63__SBPPTOperation_SBAppLibrarySupport__appLibraryExpandFirstPod__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)appLibraryDismissExpandedPod
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__SBPPTOperation_SBAppLibrarySupport__appLibraryDismissExpandedPod__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  v6[4] = a1;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setTimeoutInterval:", 30.0);
  return v4;
}

void __67__SBPPTOperation_SBAppLibrarySupport__appLibraryDismissExpandedPod__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_libraryViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__SBPPTOperation_SBAppLibrarySupport__appLibraryDismissExpandedPod__block_invoke_2;
  v6[3] = &unk_1E8E9E980;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_dismissExpandedPods:completion:", 1, v6);

}

void __67__SBPPTOperation_SBAppLibrarySupport__appLibraryDismissExpandedPod__block_invoke_2(uint64_t a1, int a2)
{
  _QWORD v2[4];
  id v3;

  if (a2)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __67__SBPPTOperation_SBAppLibrarySupport__appLibraryDismissExpandedPod__block_invoke_3;
    v2[3] = &unk_1E8E9DED8;
    v3 = *(id *)(a1 + 32);
    SBPPTPerformAfterCommitWithDelay(v2, 1.0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cancelAndFailTestWithReason:", CFSTR("Unable to dismiss expanded pods."));
  }
}

uint64_t __67__SBPPTOperation_SBAppLibrarySupport__appLibraryDismissExpandedPod__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)performTapAtPointWithBlock:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  v5 = a3;
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __66__SBPPTOperation_SBAppLibrarySupport__performTapAtPointWithBlock___block_invoke;
  v13 = &unk_1E8EC0FE0;
  v14 = v5;
  v15 = a1;
  v7 = v5;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v6, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTimeoutInterval:", 30.0, v10, v11, v12, v13);
  return v8;
}

void __66__SBPPTOperation_SBAppLibrarySupport__performTapAtPointWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  v5 = (*(double (**)(void))(v4 + 16))();
  v7 = v6;
  v8 = v13;
  v9 = *(void **)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__SBPPTOperation_SBAppLibrarySupport__performTapAtPointWithBlock___block_invoke_2;
  v11[3] = &unk_1E8E9DED8;
  v12 = v3;
  v10 = v3;
  objc_msgSend(v9, "_appLibrarySupport_performTapAtPoint:fromView:withCompletion:", v8, v11, v5, v7);

}

uint64_t __66__SBPPTOperation_SBAppLibrarySupport__performTapAtPointWithBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)dismissAppLibraryOverlay
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryOverlay__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  v6[4] = a1;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setTimeoutInterval:", 30.0);
  return v4;
}

void __63__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryOverlay__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  void *v7;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isLibraryPresented") & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __63__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryOverlay__block_invoke_2;
    v5[3] = &unk_1E8E9DE88;
    v7 = v4;
    v6 = v3;
    objc_msgSend(v4, "_appLibrarySupport_performPanGestureTowardsUserInterfaceLayoutDirectionOnScreenWithDuration:completion:", v5, 0.25);

  }
  else
  {
    objc_msgSend(v3, "cancelAndFailTestWithReason:", CFSTR("Library isn't visible; cannot dismiss!"));
  }

}

void __63__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryOverlay__block_invoke_2(uint64_t a1)
{
  id v1;
  __int128 v2;
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryOverlay__block_invoke_3;
  v3[3] = &unk_1E8E9DE88;
  v2 = *(_OWORD *)(a1 + 32);
  v1 = (id)v2;
  v4 = v2;
  SBPPTPerformAfterCommitWithDelay(v3, 0.0);

}

uint64_t __63__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryOverlay__block_invoke_3(uint64_t a1)
{
  char v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 40), "isLibraryPresented");
  v3 = *(void **)(a1 + 32);
  if ((v2 & 1) != 0)
    return objc_msgSend(v3, "cancelAndFailTestWithReason:", CFSTR("Library was not dismissed!"));
  else
    return objc_msgSend(v3, "finish");
}

+ (id)configureAppLibraryForAllAppsInOnePod
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForAllAppsInOnePod__block_invoke;
  v8[3] = &unk_1E8EA9C70;
  v9 = v3;
  v5 = v3;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTimeoutInterval:", 30.0);
  return v6;
}

void __76__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForAllAppsInOnePod__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForAllAppsInOnePod__block_invoke_2;
  v5[3] = &unk_1E8E9E820;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  SBPPTPerformAfterCommitWithDelay(v5, 0.0);

}

void __76__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForAllAppsInOnePod__block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_configureDeweyOneCategoryWithAllApps");
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __76__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForAllAppsInOnePod__block_invoke_3;
  v2[3] = &unk_1E8E9DED8;
  v3 = *(id *)(a1 + 40);
  SBPPTPerformAfterCommitWithDelay(v2, 1.0);

}

uint64_t __76__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForAllAppsInOnePod__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (id)configureAppLibraryForEachAppHavingOwnPod
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForEachAppHavingOwnPod__block_invoke;
  v8[3] = &unk_1E8EA9C70;
  v9 = v3;
  v5 = v3;
  +[SBPPTBlockOperation operationWithName:block:](SBPPTBlockOperation, "operationWithName:block:", v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTimeoutInterval:", 30.0);
  return v6;
}

void __80__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForEachAppHavingOwnPod__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForEachAppHavingOwnPod__block_invoke_2;
  v5[3] = &unk_1E8E9E820;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  SBPPTPerformAfterCommitWithDelay(v5, 0.0);

}

void __80__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForEachAppHavingOwnPod__block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_configureDeweyEachAppHasItsOwnCategory:", 30);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __80__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForEachAppHavingOwnPod__block_invoke_3;
  v2[3] = &unk_1E8E9DED8;
  v3 = *(id *)(a1 + 40);
  SBPPTPerformAfterCommitWithDelay(v2, 1.0);

}

uint64_t __80__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForEachAppHavingOwnPod__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (void)_appLibrarySupport_performPanGestureTowardsUserInterfaceLayoutDirectionOnScreenWithDuration:(double)a3 completion:(id)a4
{
  void *v6;
  id v7;

  v6 = (void *)*MEMORY[0x1E0CEB258];
  v7 = a4;
  if (objc_msgSend(v6, "userInterfaceLayoutDirection") == 1)
    objc_msgSend(a1, "_appLibrarySupport_performRightToLeftPanGestureOnScreenWithDuration:completion:", v7, a3);
  else
    objc_msgSend(a1, "_appLibrarySupport_performLeftToRightPanGestureOnScreenWithDuration:completion:", v7, a3);

}

+ (void)_appLibrarySupport_performPanGestureAwayFromUserInterfaceLayoutDirectionOnScreenWithDuration:(double)a3 completion:(id)a4
{
  void *v6;
  id v7;

  v6 = (void *)*MEMORY[0x1E0CEB258];
  v7 = a4;
  if (objc_msgSend(v6, "userInterfaceLayoutDirection") == 1)
    objc_msgSend(a1, "_appLibrarySupport_performLeftToRightPanGestureOnScreenWithDuration:completion:", v7, a3);
  else
    objc_msgSend(a1, "_appLibrarySupport_performRightToLeftPanGestureOnScreenWithDuration:completion:", v7, a3);

}

+ (void)_appLibrarySupport_performRightToLeftPanGestureOnScreenWithDuration:(double)a3 completion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat MaxX;
  CGFloat MidY;
  CGFloat MinX;
  CGFloat v20;
  void *v21;
  id v22;
  _QWORD v23[10];
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v6 = (void *)MEMORY[0x1E0CEAC18];
  v7 = a4;
  objc_msgSend(v6, "_applicationKeyWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v24.origin.x = v10;
  v24.origin.y = v12;
  v24.size.width = v14;
  v24.size.height = v16;
  MaxX = CGRectGetMaxX(v24);
  v25.origin.x = v10;
  v25.origin.y = v12;
  v25.size.width = v14;
  v25.size.height = v16;
  MidY = CGRectGetMidY(v25);
  v26.origin.x = v10;
  v26.origin.y = v12;
  v26.size.width = v14;
  v26.size.height = v16;
  MinX = CGRectGetMinX(v26);
  v27.origin.x = v10;
  v27.origin.y = v12;
  v27.size.width = v14;
  v27.size.height = v16;
  v20 = CGRectGetMidY(v27);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __118__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performRightToLeftPanGestureOnScreenWithDuration_completion___block_invoke;
  v23[3] = &__block_descriptor_80_e34_v16__0___RCPEventStreamComposer__8l;
  v23[4] = a1;
  *(CGFloat *)&v23[5] = MaxX;
  *(CGFloat *)&v23[6] = MidY;
  *(CGFloat *)&v23[7] = MinX;
  *(CGFloat *)&v23[8] = v20;
  *(double *)&v23[9] = a3;
  objc_msgSend(MEMORY[0x1E0D83C40], "eventStreamWithEventActions:", v23);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D83C30], "playEventStream:options:completion:", v22, v21, v7);

}

uint64_t __118__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performRightToLeftPanGestureOnScreenWithDuration_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appLibrarySupport_performPanWithComposer:startLocation:endLocation:duration:", a2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

+ (void)_appLibrarySupport_performLeftToRightPanGestureOnScreenWithDuration:(double)a3 completion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat MinX;
  CGFloat MidY;
  CGFloat MaxX;
  CGFloat v20;
  void *v21;
  id v22;
  _QWORD v23[10];
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v6 = (void *)MEMORY[0x1E0CEAC18];
  v7 = a4;
  objc_msgSend(v6, "_applicationKeyWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v24.origin.x = v10;
  v24.origin.y = v12;
  v24.size.width = v14;
  v24.size.height = v16;
  MinX = CGRectGetMinX(v24);
  v25.origin.x = v10;
  v25.origin.y = v12;
  v25.size.width = v14;
  v25.size.height = v16;
  MidY = CGRectGetMidY(v25);
  v26.origin.x = v10;
  v26.origin.y = v12;
  v26.size.width = v14;
  v26.size.height = v16;
  MaxX = CGRectGetMaxX(v26);
  v27.origin.x = v10;
  v27.origin.y = v12;
  v27.size.width = v14;
  v27.size.height = v16;
  v20 = CGRectGetMidY(v27);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __118__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performLeftToRightPanGestureOnScreenWithDuration_completion___block_invoke;
  v23[3] = &__block_descriptor_80_e34_v16__0___RCPEventStreamComposer__8l;
  v23[4] = a1;
  *(CGFloat *)&v23[5] = MinX;
  *(CGFloat *)&v23[6] = MidY;
  *(CGFloat *)&v23[7] = MaxX;
  *(CGFloat *)&v23[8] = v20;
  *(double *)&v23[9] = a3;
  objc_msgSend(MEMORY[0x1E0D83C40], "eventStreamWithEventActions:", v23);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D83C30], "playEventStream:options:completion:", v22, v21, v7);

}

uint64_t __118__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performLeftToRightPanGestureOnScreenWithDuration_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appLibrarySupport_performPanWithComposer:startLocation:endLocation:duration:", a2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

+ (void)_appLibrarySupport_performPanWithComposer:(id)a3 startLocation:(CGPoint)a4 endLocation:(CGPoint)a5 duration:(double)a6
{
  double y;
  double x;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  v11 = (void *)*MEMORY[0x1E0CEB258];
  v12 = (void *)MEMORY[0x1E0CEA950];
  v13 = a3;
  objc_msgSend(v12, "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_keyWindowForScreen:", v14);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "convertPoint:toView:", 0, v10, v9);
  objc_msgSend(v21, "_convertPointToSceneReferenceSpace:");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v21, "convertPoint:toView:", 0, x, y);
  objc_msgSend(v21, "_convertPointToSceneReferenceSpace:");
  objc_msgSend(v13, "sendFlickWithStartPoint:endPoint:duration:", v16, v18, v19, v20, a6);

}

+ (void)_appLibrarySupport_performPanGesturesOnScreenUntilOnPage:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rootFolderController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_appLibrarySupport__performPanGesturesOnScreenFromPage:toPage:completion:", objc_msgSend(v8, "currentPageIndex"), a3, v6);

}

+ (void)_appLibrarySupport_performPanGesturesOnScreenUntilOnDefaultHomeScreenIconPageWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootFolderController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "currentPageIndex");
  objc_msgSend(v10, "iconManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rootFolderController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_appLibrarySupport__performPanGesturesOnScreenFromPage:toPage:completion:", v7, objc_msgSend(v9, "defaultPageIndex"), v4);

}

+ (void)_appLibrarySupport_performPanGesturesOnScreenUntilOnDeweyOverlayWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v4 = a3;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_rootFolderController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "currentPageIndex");

  objc_msgSend(v5, "_rootFolderController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "lastIconPageIndex");

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __118__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performPanGesturesOnScreenUntilOnDeweyOverlayWithCompletion___block_invoke;
  v12[3] = &unk_1E8EAAD08;
  v13 = v5;
  v14 = v4;
  v15 = a1;
  v10 = v4;
  v11 = v5;
  objc_msgSend(a1, "_appLibrarySupport__performPanGesturesOnScreenFromPage:toPage:completion:", v7, v9, v12);

}

void __118__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performPanGesturesOnScreenUntilOnDeweyOverlayWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id from;
  _QWORD v16[5];

  objc_msgSend(*(id *)(a1 + 32), "homeScreenOverlayController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPresented");

  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
  }
  else
  {
    v5 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __118__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performPanGesturesOnScreenUntilOnDeweyOverlayWithCompletion___block_invoke_2;
    v16[3] = &__block_descriptor_40_e14_v16__0___v___8l;
    v16[4] = *(_QWORD *)(a1 + 48);
    v6 = (void *)MEMORY[0x1D17E5550](v16);
    from = 0;
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __118__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performPanGesturesOnScreenUntilOnDeweyOverlayWithCompletion___block_invoke_3;
    v9[3] = &unk_1E8EC1048;
    objc_copyWeak(&v13, &from);
    v10 = *(id *)(a1 + 32);
    v14 = 0;
    v11 = *(id *)(a1 + 40);
    v7 = v6;
    v12 = v7;
    v8 = (void *)MEMORY[0x1D17E5550](v9);
    objc_storeWeak(&from, v8);
    (*((void (**)(id, void *))v7 + 2))(v7, v8);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);

  }
}

void __118__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performPanGesturesOnScreenUntilOnDeweyOverlayWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)*MEMORY[0x1E0CEB258];
  v6 = a2;
  v4 = objc_msgSend(v3, "userInterfaceLayoutDirection");
  v5 = *(void **)(a1 + 32);
  if (v4 == 1)
    objc_msgSend(v5, "_appLibrarySupport_performPanGestureTowardsUserInterfaceLayoutDirectionOnScreenWithDuration:completion:", v6, 0.25);
  else
    objc_msgSend(v5, "_appLibrarySupport_performPanGestureAwayFromUserInterfaceLayoutDirectionOnScreenWithDuration:completion:", v6, 0.25);

}

void __118__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performPanGesturesOnScreenUntilOnDeweyOverlayWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "homeScreenOverlayController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPresented");

  if (*(unsigned __int8 *)(a1 + 64) == v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
  }

}

+ (void)_appLibrarySupport__performPanGesturesOnScreenFromPage:(unint64_t)a3 toPage:(unint64_t)a4 completion:(id)a5
{
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  void (**v18)(id, uint64_t);
  unint64_t v19;
  unint64_t v20;
  id v21;
  char v22;

  v8 = (void (**)(id, uint64_t))a5;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rootFolderController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "homeScreenOverlayController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isPresented");

  if (objc_msgSend(v11, "currentPageIndex") == a4)
  {
    if (v8)
      v8[2](v8, 1);
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __112__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport__performPanGesturesOnScreenFromPage_toPage_completion___block_invoke;
    v15[3] = &unk_1E8EC1070;
    v16 = v9;
    v19 = a3;
    v22 = v13;
    v17 = v11;
    v20 = a4;
    v18 = v8;
    v21 = a1;
    v14 = (void *)MEMORY[0x1D17E5550](v15);
    if (a3 >= a4 || objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      objc_msgSend(a1, "_appLibrarySupport_performPanGestureAwayFromUserInterfaceLayoutDirectionOnScreenWithDuration:completion:", v14, 0.25);
    else
      objc_msgSend(a1, "_appLibrarySupport_performPanGestureTowardsUserInterfaceLayoutDirectionOnScreenWithDuration:completion:", v14, 0.25);

  }
}

uint64_t __112__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport__performPanGesturesOnScreenFromPage_toPage_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  BOOL v9;
  uint64_t result;
  uint64_t (*v12)(void);

  objc_msgSend(*(id *)(a1 + 32), "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentPageIndex");

  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "homeScreenOverlayController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPresented");
  v8 = *(unsigned __int8 *)(a1 + 80);

  v9 = v4 != v5;
  if (v4 == v5 && v8 != v7)
    v9 = *(_BYTE *)(a1 + 80) != 0;
  if (objc_msgSend(*(id *)(a1 + 40), "currentPageIndex") == *(_QWORD *)(a1 + 64))
  {
    result = *(_QWORD *)(a1 + 48);
    if (!result)
      return result;
    v12 = *(uint64_t (**)(void))(result + 16);
    return v12();
  }
  if (v9)
    return objc_msgSend(*(id *)(a1 + 72), "_appLibrarySupport__performPanGesturesOnScreenFromPage:toPage:completion:", v4);
  result = *(_QWORD *)(a1 + 48);
  if (result)
  {
    v12 = *(uint64_t (**)(void))(result + 16);
    return v12();
  }
  return result;
}

+ (void)_appLibrarySupport_performTapAtPoint:(CGPoint)a3 fromView:(id)a4 withCompletion:(id)a5
{
  double y;
  double x;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[6];

  y = a3.y;
  x = a3.x;
  v8 = (void *)*MEMORY[0x1E0CEB258];
  v9 = (void *)MEMORY[0x1E0CEA950];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_keyWindowForScreen:", v12);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "coordinateSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertPoint:fromCoordinateSpace:", v11, x, y);
  v16 = v15;
  v18 = v17;

  objc_msgSend(v23, "convertPoint:fromView:", 0, v16, v18);
  objc_msgSend(v23, "_convertPointToSceneReferenceSpace:");
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __100__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performTapAtPoint_fromView_withCompletion___block_invoke;
  v24[3] = &__block_descriptor_48_e34_v16__0___RCPEventStreamComposer__8l;
  v24[4] = v19;
  v24[5] = v20;
  objc_msgSend(MEMORY[0x1E0D83C40], "eventStreamWithEventActions:", v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D83C30], "playEventStream:options:completion:", v21, v22, v10);

}

uint64_t __100__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performTapAtPoint_fromView_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tap:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

+ (void)_appLibrarySupport_performDragFromPoint:(CGPoint)a3 andDragTo:(CGPoint)a4 duration:(double)a5 fromView:(id)a6 withCompletion:(id)a7
{
  double y;
  double x;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[9];

  y = a4.y;
  x = a4.x;
  v11 = a3.y;
  v12 = a3.x;
  v13 = (void *)*MEMORY[0x1E0CEB258];
  v14 = (void *)MEMORY[0x1E0CEA950];
  v15 = a7;
  v16 = a6;
  objc_msgSend(v14, "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_keyWindowForScreen:", v17);
  v38 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "coordinateSpace");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "convertPoint:fromCoordinateSpace:", v16, v12, v11);
  v21 = v20;
  v23 = v22;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "coordinateSpace");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "convertPoint:fromCoordinateSpace:", v16, x, y);
  v27 = v26;
  v29 = v28;

  objc_msgSend(v38, "convertPoint:fromView:", 0, v21, v23);
  objc_msgSend(v38, "_convertPointToSceneReferenceSpace:");
  v31 = v30;
  v33 = v32;
  objc_msgSend(v38, "convertPoint:fromView:", 0, v27, v29);
  objc_msgSend(v38, "_convertPointToSceneReferenceSpace:");
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __122__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performDragFromPoint_andDragTo_duration_fromView_withCompletion___block_invoke;
  v39[3] = &__block_descriptor_72_e34_v16__0___RCPEventStreamComposer__8l;
  v39[4] = v31;
  v39[5] = v33;
  v39[6] = v34;
  v39[7] = v35;
  *(double *)&v39[8] = a5;
  objc_msgSend(MEMORY[0x1E0D83C40], "eventStreamWithEventActions:", v39);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D83C30], "playEventStream:options:completion:", v36, v37, v15);

}

uint64_t __122__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performDragFromPoint_andDragTo_duration_fromView_withCompletion___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "sendFlickWithStartPoint:endPoint:duration:", a1[4], a1[5], a1[6], a1[7], a1[8]);
}

@end
