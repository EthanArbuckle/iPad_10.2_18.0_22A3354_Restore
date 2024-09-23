@implementation CACRecordedUserActionManager

+ (id)sharedManager
{
  if (sharedManager_singletonInit != -1)
    dispatch_once(&sharedManager_singletonInit, &__block_literal_global_2);
  return (id)sCACRecordedUserActionManager;
}

void __45__CACRecordedUserActionManager_sharedManager__block_invoke()
{
  CACRecordedUserActionManager *v0;
  void *v1;

  v0 = objc_alloc_init(CACRecordedUserActionManager);
  v1 = (void *)sCACRecordedUserActionManager;
  sCACRecordedUserActionManager = (uint64_t)v0;

}

- (CACRecordedUserActionManager)init
{
  CACRecordedUserActionManager *v2;
  uint64_t v3;
  NSMutableArray *recordedUserActions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CACRecordedUserActionManager;
  v2 = -[CACRecordedUserActionManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    recordedUserActions = v2->_recordedUserActions;
    v2->_recordedUserActions = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addRecognizedSpokenCommand:(id)a3
{
  void *v4;
  void *v5;
  NSMutableArray *recordedUserActions;
  CACRecordedUserAction *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_isRecording
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("System.StartRecordingCommands")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("System.StopRecordingCommands")) & 1) == 0)
  {
    recordedUserActions = self->_recordedUserActions;
    v7 = -[CACRecordedUserAction initWithSpokenCommand:]([CACRecordedUserAction alloc], "initWithSpokenCommand:", v8);
    -[NSMutableArray addObject:](recordedUserActions, "addObject:", v7);

  }
}

- (void)startRecordingUserActions
{
  CACRecordedUserActionManager *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSMutableArray removeAllObjects](obj->_recordedUserActions, "removeAllObjects");
  obj->_isRecording = 1;
  objc_sync_exit(obj);

}

- (void)stopRecordingUserActions
{
  CACRecordedUserActionManager *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_isRecording = 0;
  objc_sync_exit(obj);

}

- (id)recordedUserActionFlow
{
  return -[CACRecordedUserActionFlow initWithUserActions:]([CACRecordedUserActionFlow alloc], "initWithUserActions:", self->_recordedUserActions);
}

- (void)beginExecutingRecordedUserActionFlow:(id)a3 completionBlock:(id)a4
{
  id v7;
  id v8;
  CACRecordedUserActionManager *v9;
  _QWORD v10[5];
  id v11;

  v7 = a3;
  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  if (v9->_isExecuting)
  {
    objc_sync_exit(v9);

  }
  else
  {
    v9->_isExecuting = 1;
    objc_storeStrong((id *)&v9->_executingUserActionFlow, a3);
    objc_sync_exit(v9);

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __85__CACRecordedUserActionManager_beginExecutingRecordedUserActionFlow_completionBlock___block_invoke;
    v10[3] = &unk_24F2AB120;
    v10[4] = v9;
    v11 = v8;
    objc_msgSend(v7, "beginExecutingWithCompletionBlock:", v10);

  }
}

void __85__CACRecordedUserActionManager_beginExecutingRecordedUserActionFlow_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = *(id *)(a1 + 32);
  v7 = a2;
  objc_sync_enter(v4);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 0;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = 0;

  objc_sync_exit(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)cancelExecution
{
  CACRecordedUserActionFlow *executingUserActionFlow;
  CACRecordedUserActionManager *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->_isRecording && obj->_isExecuting)
  {
    executingUserActionFlow = obj->_executingUserActionFlow;
    if (executingUserActionFlow)
      -[CACRecordedUserActionFlow cancelExecution](executingUserActionFlow, "cancelExecution");
  }
  objc_sync_exit(obj);

}

- (BOOL)isRecording
{
  return self->_isRecording;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executingUserActionFlow, 0);
  objc_storeStrong((id *)&self->_recordedUserActions, 0);
}

@end
