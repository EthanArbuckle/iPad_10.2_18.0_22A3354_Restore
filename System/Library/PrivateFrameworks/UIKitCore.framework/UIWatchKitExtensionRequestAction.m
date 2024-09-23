@implementation UIWatchKitExtensionRequestAction

- (UIWatchKitExtensionRequestAction)initWithRequest:(id)a3 withHandler:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  objc_super v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  if (a3)
  {
    v7 = (objc_class *)MEMORY[0x1E0D017D0];
    v8 = a3;
    v9 = objc_alloc_init(v7);
    objc_msgSend(v9, "setObject:forSetting:", v8, 1);

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__UIWatchKitExtensionRequestAction_initWithRequest_withHandler___block_invoke;
    v12[3] = &unk_1E16C6A58;
    v13 = v6;
    v11.receiver = self;
    v11.super_class = (Class)UIWatchKitExtensionRequestAction;
    self = -[UIWatchKitExtensionRequestAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v11, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v9, 0, v12, 0.0);

    a3 = self;
  }

  return (UIWatchKitExtensionRequestAction *)a3;
}

uint64_t __64__UIWatchKitExtensionRequestAction_initWithRequest_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (UIWatchKitExtensionRequestAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{

  return 0;
}

- (NSDictionary)request
{
  void *v2;
  void *v3;

  -[UIWatchKitExtensionRequestAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (int64_t)UIActionType
{
  return 14;
}

- (void)sendResponse:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  UIWatchKitExtensionRequestAction *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWatchKitExtensionRequestAction.m"), 86, CFSTR("you sent back the wrong response class -> %@"), v5);

  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__93;
  v20 = __Block_byref_object_dispose__93;
  v21 = 0;
  v6 = objc_alloc(MEMORY[0x1E0CFE308]);
  v7 = getpid();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__UIWatchKitExtensionRequestAction_sendResponse___block_invoke;
  v12[3] = &unk_1E16C7578;
  v14 = self;
  v15 = &v16;
  v13 = v5;
  v8 = v5;
  v9 = objc_msgSend(v6, "initWithPID:flags:reason:name:withHandler:", v7, 1, 4, CFSTR("UIWatchKitExtensionRequestAction action reply"), v12);
  v10 = (void *)v17[5];
  v17[5] = v9;

  _Block_object_dispose(&v16, 8);
}

id __49__UIWatchKitExtensionRequestAction_sendResponse___block_invoke(_QWORD *a1, char a2)
{
  uint64_t v3;
  void *v4;
  objc_super v6;
  _QWORD v7[5];

  if ((a2 & 1) == 0)
    NSLog(CFSTR("%s: Failed to acquire background task assertion for WatchKit response"), "-[UIWatchKitExtensionRequestAction sendResponse:]_block_invoke");
  v3 = a1[4];
  v4 = (void *)a1[5];
  v7[1] = 3221225472;
  v7[2] = __49__UIWatchKitExtensionRequestAction_sendResponse___block_invoke_2;
  v7[3] = &unk_1E16BFBF0;
  v7[4] = a1[6];
  v6.receiver = v4;
  v6.super_class = (Class)UIWatchKitExtensionRequestAction;
  v7[0] = MEMORY[0x1E0C809B0];
  return objc_msgSendSuper2(&v6, sel_sendResponse_withCompletion_, v3, v7);
}

uint64_t __49__UIWatchKitExtensionRequestAction_sendResponse___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "invalidate");
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("payload");
  else
    return 0;
}

@end
