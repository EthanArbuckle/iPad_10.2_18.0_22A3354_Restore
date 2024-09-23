@implementation SBUIPresentableWantsHomeGestureAction

- (SBUIPresentableWantsHomeGestureAction)initWithWantsHomeGesture:(BOOL)a3 handler:(id)a4
{
  _BOOL4 v4;
  id v7;
  id v8;
  id v9;
  SBUIPresentableWantsHomeGestureAction *v10;
  void *v12;
  objc_super v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIPresentableWantsHomeGestureAction.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v8 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v8, "setFlag:forSetting:", v4, 1);
  v14[1] = 3221225472;
  v14[2] = __74__SBUIPresentableWantsHomeGestureAction_initWithWantsHomeGesture_handler___block_invoke;
  v14[3] = &unk_1E4C3ED20;
  v15 = v7;
  v13.receiver = self;
  v13.super_class = (Class)SBUIPresentableWantsHomeGestureAction;
  v14[0] = MEMORY[0x1E0C809B0];
  v9 = v7;
  v10 = -[SBUIPresentableWantsHomeGestureAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v13, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v8, 0, v14, 0.0);

  return v10;
}

void __74__SBUIPresentableWantsHomeGestureAction_initWithWantsHomeGesture_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "info");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(v3, "BOOLForSetting:", 2));

}

- (BOOL)wantsHomeGesture
{
  void *v2;
  char v3;

  -[SBUIPresentableWantsHomeGestureAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 1);

  return v3;
}

- (void)setSuccessful:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (-[SBUIPresentableWantsHomeGestureAction isValid](self, "isValid"))
  {
    if (-[SBUIPresentableWantsHomeGestureAction canSendResponse](self, "canSendResponse"))
    {
      v6 = objc_alloc_init(MEMORY[0x1E0D017D0]);
      objc_msgSend(v6, "setFlag:forSetting:", v3, 2);
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D016A8]), "initWithInfo:error:", v6, 0);
      -[SBUIPresentableWantsHomeGestureAction sendResponse:](self, "sendResponse:", v5);

    }
  }
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("success");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return CFSTR("wantsHomeGesture");
  else
    return (id)v3;
}

@end
