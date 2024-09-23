@implementation SBUIPresentableHomeAffordanceThresholdAction

- (SBUIPresentableHomeAffordanceThresholdAction)initWithHandler:(id)a3
{
  id v5;
  id v6;
  SBUIPresentableHomeAffordanceThresholdAction *v7;
  void *v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIPresentableHomeAffordanceThresholdAction.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v11[1] = 3221225472;
  v11[2] = __64__SBUIPresentableHomeAffordanceThresholdAction_initWithHandler___block_invoke;
  v11[3] = &unk_1E4C3ED20;
  v12 = v5;
  v10.receiver = self;
  v10.super_class = (Class)SBUIPresentableHomeAffordanceThresholdAction;
  v11[0] = MEMORY[0x1E0C809B0];
  v6 = v5;
  v7 = -[SBUIPresentableHomeAffordanceThresholdAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v10, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, 0, 0, v11, 0.0);

  return v7;
}

void __64__SBUIPresentableHomeAffordanceThresholdAction_initWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "info");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(v3, "BOOLForSetting:", 1));

}

- (void)setSuccessful:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (-[SBUIPresentableHomeAffordanceThresholdAction isValid](self, "isValid"))
  {
    if (-[SBUIPresentableHomeAffordanceThresholdAction canSendResponse](self, "canSendResponse"))
    {
      v6 = objc_alloc_init(MEMORY[0x1E0D017D0]);
      objc_msgSend(v6, "setFlag:forSetting:", v3, 1);
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D016A8]), "initWithInfo:error:", v6, 0);
      -[SBUIPresentableHomeAffordanceThresholdAction sendResponse:](self, "sendResponse:", v5);

    }
  }
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("success");
  else
    return 0;
}

@end
