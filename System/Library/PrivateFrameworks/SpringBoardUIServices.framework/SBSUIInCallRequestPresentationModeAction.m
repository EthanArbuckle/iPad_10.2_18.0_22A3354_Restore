@implementation SBSUIInCallRequestPresentationModeAction

- (SBSUIInCallRequestPresentationModeAction)initWithRequestedPresentationMode:(int64_t)a3 isUserInitiated:(BOOL)a4 analyticsSource:(id)a5 responseHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  SBSUIInCallRequestPresentationModeAction *v14;
  objc_super v16;
  _QWORD v17[4];
  id v18;

  v9 = a5;
  v10 = a6;
  v11 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forSetting:", v12, 1);

  objc_msgSend(v11, "setFlag:forSetting:", BSSettingFlagForBool(), 2);
  if (v9)
    objc_msgSend(v11, "setObject:forSetting:", v9, 3);
  v17[1] = 3221225472;
  v17[2] = __126__SBSUIInCallRequestPresentationModeAction_initWithRequestedPresentationMode_isUserInitiated_analyticsSource_responseHandler___block_invoke;
  v17[3] = &unk_1E4C3ED20;
  v18 = v10;
  v16.receiver = self;
  v16.super_class = (Class)SBSUIInCallRequestPresentationModeAction;
  v17[0] = MEMORY[0x1E0C809B0];
  v13 = v10;
  v14 = -[SBSUIInCallRequestPresentationModeAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v16, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v11, MEMORY[0x1E0C80D38], v17, 2.0);

  return v14;
}

void __126__SBSUIInCallRequestPresentationModeAction_initWithRequestedPresentationMode_isUserInitiated_analyticsSource_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "error");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL))(v2 + 16))(v2, v3 == 0);

}

- (void)sendCompletionResponseWithSuccess:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  v3 = a3;
  if (-[SBSUIInCallRequestPresentationModeAction canSendResponse](self, "canSendResponse"))
  {
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0D016A8], "response");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8.receiver = self;
      v8.super_class = (Class)SBSUIInCallRequestPresentationModeAction;
      -[SBSUIInCallRequestPresentationModeAction sendResponse:](&v8, sel_sendResponse_, v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBSUIInCallErrorDomain"), -1003, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D016A8], "responseForError:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7.receiver = self;
      v7.super_class = (Class)SBSUIInCallRequestPresentationModeAction;
      -[SBSUIInCallRequestPresentationModeAction sendResponse:](&v7, sel_sendResponse_, v6);

    }
  }
}

- (NSString)analyticsSource
{
  void *v2;
  void *v3;

  -[SBSUIInCallRequestPresentationModeAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)requestedPresentationMode
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SBSUIInCallRequestPresentationModeAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (BOOL)isUserInitiated
{
  void *v2;
  char v3;

  -[SBSUIInCallRequestPresentationModeAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 2);

  return v3;
}

@end
