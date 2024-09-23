@implementation SYBacklinkMonitorOperation

- (void)_showOrHideBacklinkIndicatorForDomainIdentifiers:(id)a3 linkedIdentifiers:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  SYShowBacklinkIndicatorCommand *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  -[SYBacklinkMonitorOperation processingQueue](self, "processingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[SYBacklinkMonitorOperation _setOperationState:](self, "_setOperationState:", 2);
  -[SYBacklinkMonitorOperation _testingForcedFoundLinkedIdentifiers](self, "_testingForcedFoundLinkedIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = dispatch_time(0, 100000000);
    -[SYBacklinkMonitorOperation processingQueue](self, "processingQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__SYBacklinkMonitorOperation__showOrHideBacklinkIndicatorForDomainIdentifiers_linkedIdentifiers___block_invoke;
    block[3] = &unk_1E757B758;
    block[4] = self;
    dispatch_after(v10, v11, block);

  }
  else
  {
    v12 = v7;
    v13 = v6;
    v14 = v13;
    if (!v12)
    {

      v12 = (id)MEMORY[0x1E0C9AA60];
      v14 = (void *)MEMORY[0x1E0C9AA60];
    }
    v15 = -[SYShowBacklinkIndicatorCommand initWithDomainIdentifiers:linkIdentifiers:]([SYShowBacklinkIndicatorCommand alloc], "initWithDomainIdentifiers:linkIdentifiers:", v14, v12);
    -[SYBacklinkMonitorOperation set_indicatorCommand:](self, "set_indicatorCommand:", v15);

    -[SYBacklinkMonitorOperation _indicatorCommand](self, "_indicatorCommand");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __97__SYBacklinkMonitorOperation__showOrHideBacklinkIndicatorForDomainIdentifiers_linkedIdentifiers___block_invoke_2;
    v17[3] = &unk_1E757B758;
    v17[4] = self;
    objc_msgSend(v16, "runWithCompletion:", v17);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__indicatorCommand, 0);
  objc_destroyWeak((id *)&self->__testingDelegate);
  objc_storeStrong((id *)&self->__testingForcedFoundLinkedIdentifiers, 0);
  objc_storeStrong((id *)&self->__testingForcedFoundDomainIdentifiers, 0);
  objc_storeStrong((id *)&self->_inputUserActivityInfo, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (SYBacklinkMonitorOperationDelegate)delegate
{
  return (SYBacklinkMonitorOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SYUserActivityInfo)inputUserActivityInfo
{
  return self->_inputUserActivityInfo;
}

- (void)beginProcessing
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  SYBacklinkMonitorOperation *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[SYBacklinkMonitorOperation processingQueue](self, "processingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_1BCC38000, v4, OS_LOG_TYPE_DEFAULT, "BacklinkOperation %p: Begin processing.", (uint8_t *)&v5, 0xCu);
  }

  -[SYBacklinkMonitorOperation _searchBacklinksForInputUserActivity](self, "_searchBacklinksForInputUserActivity");
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)_searchBacklinksForInputUserActivity
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  SYBacklinkMonitorOperation *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SYBacklinkMonitorOperation processingQueue](self, "processingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SYBacklinkMonitorOperation _setOperationState:](self, "_setOperationState:", 1);
  -[SYBacklinkMonitorOperation inputUserActivityInfo](self, "inputUserActivityInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && SYIsLinkableUserActivity(v4))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__SYBacklinkMonitorOperation__searchBacklinksForInputUserActivity__block_invoke;
    v9[3] = &unk_1E757BBF8;
    v9[5] = v6;
    v9[4] = self;
    +[SYItemIndexingManager fetchIdentifiersLinkedToUserActivity:completion:](SYItemIndexingManager, "fetchIdentifiersLinkedToUserActivity:completion:", v5, v9);
  }
  else
  {
    v7 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("not linkable");
      if (!v5)
        v8 = CFSTR("nil");
      *(_DWORD *)buf = 134218242;
      v11 = self;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1BCC38000, v7, OS_LOG_TYPE_DEFAULT, "BacklinkOperation %p: Skipping query, input activity is %@.", buf, 0x16u);
    }

    -[SYBacklinkMonitorOperation _showOrHideBacklinkIndicatorForDomainIdentifiers:linkedIdentifiers:](self, "_showOrHideBacklinkIndicatorForDomainIdentifiers:linkedIdentifiers:", 0, 0);
  }

}

- (void)_setOperationState:(int64_t)a3
{
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;

  v6 = CFSTR("Finished");
  switch(self->__operationState)
  {
    case 0:
      if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 1)
      {
        v6 = CFSTR("Initial");
        goto LABEL_8;
      }
      break;
    case 1:
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
      {
        v6 = CFSTR("SearchingBacklinks");
        goto LABEL_8;
      }
      break;
    case 2:
      if (a3 != 3)
      {
        v6 = CFSTR("PreparingResults");
        goto LABEL_8;
      }
      break;
    case 3:
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((unint64_t)a3 > 3)
        v9 = &stru_1E757CA18;
      else
        v9 = off_1E757BC68[a3];
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYBacklinkMonitorOperation.m"), 205, CFSTR("Invalid state transition %@ -> %@ for backlink monitor operation %@"), v6, v9, self);

      break;
    default:
      break;
  }
  self->__operationState = a3;
  -[SYBacklinkMonitorOperation _testingDelegate](self, "_testingDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backlinkMonitorOperationDidChangeState:", self);

}

- (SYBacklinkMonitorOperationDelegate_Testing)_testingDelegate
{
  return (SYBacklinkMonitorOperationDelegate_Testing *)objc_loadWeakRetained((id *)&self->__testingDelegate);
}

- (SYBacklinkMonitorOperation)initWithDelegate:(id)a3 processingQueue:(id)a4 inputUserActivityInfo:(id)a5 processIdentifier:(int)a6
{
  id v10;
  id v11;
  id v12;
  SYBacklinkMonitorOperation *v13;
  SYBacklinkMonitorOperation *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SYBacklinkMonitorOperation;
  v13 = -[SYBacklinkMonitorOperation init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v14->_processingQueue, a4);
    objc_storeStrong((id *)&v14->_inputUserActivityInfo, a5);
    v14->_processIdentifier = a6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_storeWeak((id *)&v14->__testingDelegate, v10);
  }

  return v14;
}

- (int64_t)type
{
  void *v3;
  void *v4;
  int64_t v5;

  -[SYBacklinkMonitorOperation _indicatorCommand](self, "_indicatorCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[SYBacklinkMonitorOperation _indicatorCommand](self, "_indicatorCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isActive"))
    v5 = 1;
  else
    v5 = 2;

  return v5;
}

- (SYShowBacklinkIndicatorCommand)_indicatorCommand
{
  return self->__indicatorCommand;
}

uint64_t __97__SYBacklinkMonitorOperation__showOrHideBacklinkIndicatorForDomainIdentifiers_linkedIdentifiers___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishProcessingAndNotify");
}

void __97__SYBacklinkMonitorOperation__showOrHideBacklinkIndicatorForDomainIdentifiers_linkedIdentifiers___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "processingQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__SYBacklinkMonitorOperation__showOrHideBacklinkIndicatorForDomainIdentifiers_linkedIdentifiers___block_invoke_3;
  block[3] = &unk_1E757B758;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void __66__SYBacklinkMonitorOperation__searchBacklinksForInputUserActivity__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v8 = v7;
  v9 = *(double *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  objc_msgSend(*(id *)(a1 + 32), "_testingForcedFoundLinkedIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v11;
  v14 = v10;
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "_testingForcedFoundDomainIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_testingForcedFoundLinkedIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218496;
    v24 = v16;
    v25 = 2048;
    v26 = objc_msgSend(v13, "count");
    v27 = 2048;
    v28 = (v8 - v9) * 1000.0;
    _os_log_impl(&dword_1BCC38000, v15, OS_LOG_TYPE_DEFAULT, "BacklinkOperation %p: Found %ld item(s) linked to current activity. Query duration: %0.0f ms.", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "processingQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SYBacklinkMonitorOperation__searchBacklinksForInputUserActivity__block_invoke_23;
  block[3] = &unk_1E757B410;
  block[4] = *(_QWORD *)(a1 + 32);
  v21 = v14;
  v22 = v13;
  v18 = v13;
  v19 = v14;
  dispatch_async(v17, block);

}

- (void)set_indicatorCommand:(id)a3
{
  objc_storeStrong((id *)&self->__indicatorCommand, a3);
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (NSArray)_testingForcedFoundLinkedIdentifiers
{
  return self->__testingForcedFoundLinkedIdentifiers;
}

- (void)_finishProcessingAndNotify
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  SYBacklinkMonitorOperation *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[SYBacklinkMonitorOperation processingQueue](self, "processingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SYBacklinkMonitorOperation _setOperationState:](self, "_setOperationState:", 3);
  v4 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = self;
    _os_log_impl(&dword_1BCC38000, v4, OS_LOG_TYPE_DEFAULT, "BacklinkOperation %p: Finished, notifying delegate.", (uint8_t *)&v6, 0xCu);
  }

  -[SYBacklinkMonitorOperation delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backlinkMonitorOperationDidFinish:", self);

}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SYBacklinkMonitorOperation;
  -[SYBacklinkMonitorOperation description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SYBacklinkMonitorOperation _operationState](self, "_operationState");
  if (v4 > 3)
    v5 = &stru_1E757CA18;
  else
    v5 = off_1E757BC68[v4];
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" state: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __66__SYBacklinkMonitorOperation__searchBacklinksForInputUserActivity__block_invoke_23(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showOrHideBacklinkIndicatorForDomainIdentifiers:linkedIdentifiers:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __97__SYBacklinkMonitorOperation__showOrHideBacklinkIndicatorForDomainIdentifiers_linkedIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishProcessingAndNotify");
}

- (int64_t)_operationState
{
  return self->__operationState;
}

- (NSArray)_testingForcedFoundDomainIdentifiers
{
  return self->__testingForcedFoundDomainIdentifiers;
}

- (void)set_testingForcedFoundDomainIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->__testingForcedFoundDomainIdentifiers, a3);
}

- (void)set_testingForcedFoundLinkedIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->__testingForcedFoundLinkedIdentifiers, a3);
}

- (void)setInputUserActivityInfo:(id)a3
{
  objc_storeStrong((id *)&self->_inputUserActivityInfo, a3);
}

@end
