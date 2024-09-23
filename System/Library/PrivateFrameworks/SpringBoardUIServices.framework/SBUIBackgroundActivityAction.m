@implementation SBUIBackgroundActivityAction

- (SBUIBackgroundActivityAction)initWithBackgroundActivityIdentifier:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  SBUIBackgroundActivityAction *v14;
  void *v16;
  void *v17;
  objc_super v18;
  _QWORD v19[4];
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIBackgroundActivityAction.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIBackgroundActivityAction.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v10, "setObject:forSetting:", v7, 2);
  v11 = (void *)MEMORY[0x1E0D016A0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __77__SBUIBackgroundActivityAction_initWithBackgroundActivityIdentifier_handler___block_invoke;
  v19[3] = &unk_1E4C3ED20;
  v20 = v9;
  v12 = v9;
  objc_msgSend(v11, "responderWithHandler:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)SBUIBackgroundActivityAction;
  v14 = -[SBUIBackgroundActivityAction initWithInfo:responder:](&v18, sel_initWithInfo_responder_, v10, v13);

  return v14;
}

void __77__SBUIBackgroundActivityAction_initWithBackgroundActivityIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
  }
  else
  {
    objc_msgSend(v6, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, objc_msgSend(v5, "BOOLForSetting:", 1));

  }
}

- (void)setProceed:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (-[SBUIBackgroundActivityAction isValid](self, "isValid"))
  {
    if (-[SBUIBackgroundActivityAction canSendResponse](self, "canSendResponse"))
    {
      v6 = objc_alloc_init(MEMORY[0x1E0D017D0]);
      objc_msgSend(v6, "setFlag:forSetting:", v3, 1);
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D016A8]), "initWithInfo:error:", v6, 0);
      -[SBUIBackgroundActivityAction sendResponse:](self, "sendResponse:", v5);

    }
  }
}

- (NSString)backgroundActivityIdentifier
{
  void *v2;
  void *v3;

  -[SBUIBackgroundActivityAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("backgroundActivityIdentifier");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return CFSTR("proceed");
  else
    return (id)v3;
}

@end
