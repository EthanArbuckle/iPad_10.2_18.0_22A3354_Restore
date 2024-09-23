@implementation SBUIPresentableButtonEventsAction

- (SBUIPresentableButtonEventsAction)initWithButtonEvent:(int64_t)a3 reason:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  NSString *v11;
  NSString *reason;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  SBUIPresentableButtonEventsAction *v19;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  SBUIPresentableButtonEventsAction *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (a3 == 1)
  {
    if (v9)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIPresentableButtonEventsAction.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    if (v10)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIPresentableButtonEventsAction.m"), 48, CFSTR("Invalid button evemt: %ld'"), a3);

  if (!v9)
    goto LABEL_8;
LABEL_3:
  if (v10)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIPresentableButtonEventsAction.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

LABEL_4:
  v11 = (NSString *)objc_msgSend(v9, "copy");
  reason = self->_reason;
  self->_reason = v11;

  SBLogBanners();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = self;
    _os_log_impl(&dword_1A471F000, v13, OS_LOG_TYPE_DEFAULT, "Acquired button events assertion: %{public}@", buf, 0xCu);
  }

  v14 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forSetting:", v15, 1);

  v16 = (void *)MEMORY[0x1E0D016A0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __72__SBUIPresentableButtonEventsAction_initWithButtonEvent_reason_handler___block_invoke;
  v25[3] = &unk_1E4C3ED20;
  v26 = v10;
  v17 = v10;
  objc_msgSend(v16, "responderWithHandler:", v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)SBUIPresentableButtonEventsAction;
  v19 = -[SBUIPresentableButtonEventsAction initWithInfo:responder:](&v24, sel_initWithInfo_responder_, v14, v18);

  return v19;
}

void __72__SBUIPresentableButtonEventsAction_initWithButtonEvent_reason_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "info");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(v3, "BOOLForSetting:", 2));

}

- (void)handleButtonEvent
{
  void *v3;
  id v4;

  if (-[SBUIPresentableButtonEventsAction isValid](self, "isValid"))
  {
    if (-[SBUIPresentableButtonEventsAction canSendResponse](self, "canSendResponse"))
    {
      v4 = objc_alloc_init(MEMORY[0x1E0D017D0]);
      objc_msgSend(v4, "setFlag:forSetting:", 1, 2);
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D016A8]), "initWithInfo:error:", v4, 0);
      -[SBUIPresentableButtonEventsAction sendResponse:](self, "sendResponse:", v3);

    }
  }
}

- (BOOL)_expectsResponse
{
  return 1;
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 debug:(BOOL)a4
{
  void *v5;
  int64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBUIPresentableButtonEventsAction;
  -[SBUIPresentableButtonEventsAction _descriptionBuilderWithMultilinePrefix:debug:](&v10, sel__descriptionBuilderWithMultilinePrefix_debug_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBUIPresentableButtonEventsAction presentableButtonEvent](self, "presentableButtonEvent");
  v7 = CFSTR("[INVALID]");
  if (v6 == 1)
    v7 = CFSTR("homeButtonPress");
  if (v6)
    v8 = v7;
  else
    v8 = CFSTR("noEvent");
  objc_msgSend(v5, "appendString:withName:", v8, CFSTR("presentableButtonEvent"));
  objc_msgSend(v5, "appendString:withName:", self->_reason, CFSTR("reason"));
  return v5;
}

- (int64_t)presentableButtonEvent
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SBUIPresentableButtonEventsAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)invalidate
{
  int v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  SBUIPresentableButtonEventsAction *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = -[SBUIPresentableButtonEventsAction isValid](self, "isValid");
  v5.receiver = self;
  v5.super_class = (Class)SBUIPresentableButtonEventsAction;
  -[SBUIPresentableButtonEventsAction invalidate](&v5, sel_invalidate);
  if (v3)
  {
    SBLogBanners();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v7 = self;
      _os_log_impl(&dword_1A471F000, v4, OS_LOG_TYPE_DEFAULT, "Invalidated button events assertion: %{public}@", buf, 0xCu);
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
    return CFSTR("buttonEvent");
  else
    return (id)v3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
