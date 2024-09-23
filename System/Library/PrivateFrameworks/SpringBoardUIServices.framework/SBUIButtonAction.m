@implementation SBUIButtonAction

- (SBUIButtonAction)initWithButtonEvents:(unint64_t)a3
{
  return -[SBUIButtonAction initWithButtonEvents:withHandler:](self, "initWithButtonEvents:withHandler:", a3, &__block_literal_global_8);
}

- (SBUIButtonAction)initWithButtonEvents:(unint64_t)a3 withHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  SBUIButtonAction *v11;
  void *v13;
  objc_super v14;
  _QWORD v15[4];
  id v16;
  unint64_t v17;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIButtonAction.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v8 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v9, 1);

  v15[1] = 3221225472;
  v15[2] = __53__SBUIButtonAction_initWithButtonEvents_withHandler___block_invoke;
  v15[3] = &unk_1E4C3EFC0;
  v16 = v7;
  v17 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBUIButtonAction;
  v15[0] = MEMORY[0x1E0C809B0];
  v10 = v7;
  v11 = -[SBUIButtonAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v14, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v8, MEMORY[0x1E0C80D38], v15, 10.0);

  return v11;
}

void __53__SBUIButtonAction_initWithButtonEvents_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = objc_opt_class();
  v11 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v11;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (!v6)
  {
    objc_msgSend(v11, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v11, "error");
    else
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D010D0], 4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[BSActionResponse responseForError:](SBUIButtonActionResponse, "responseForError:", v8);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if ((objc_msgSend(v6, "unHandledButtonEvents") & ~v7) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D010D0], 4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[BSActionResponse responseForError:](SBUIButtonActionResponse, "responseForError:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v9;
LABEL_13:

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)sendResponse:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  objc_super v10;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIButtonAction.m"), 93, CFSTR("SBUIButtonAction responses must be SBUIButtonActionResponse instances"));

  }
  v10.receiver = self;
  v10.super_class = (Class)SBUIButtonAction;
  -[SBUIButtonAction sendResponse:withCompletion:](&v10, sel_sendResponse_withCompletion_, v7, v8);

}

- (unint64_t)buttonEvents
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[SBUIButtonAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = __eventsFromObject(v3);

  return v4;
}

- (void)sendResponseWithUnHandledButtonEvents:(unint64_t)a3
{
  SBUIButtonActionResponse *v6;
  void *v7;
  objc_super v8;

  if ((a3 & ~-[SBUIButtonAction buttonEvents](self, "buttonEvents")) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIButtonAction.m"), 111, CFSTR("sendResponseWithUnHandledEvents: cannot be passed events that you were not originally given %d"), a3);

  }
  if (-[SBUIButtonAction _expectsResponse](self, "_expectsResponse"))
  {
    v6 = -[SBUIButtonActionResponse initWithUnHandledButtonEvents:]([SBUIButtonActionResponse alloc], "initWithUnHandledButtonEvents:", a3);
    v8.receiver = self;
    v8.super_class = (Class)SBUIButtonAction;
    -[SBUIButtonAction sendResponse:](&v8, sel_sendResponse_, v6);

  }
}

- (id)settings:(id)a3 keyDescriptionForSetting:(unint64_t)a4
{
  if (a4 == 1)
    return CFSTR("events");
  else
    return 0;
}

- (id)settings:(id)a3 valueDescriptionForFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6
{
  uint64_t v6;

  if (a6 != 1)
    return 0;
  v6 = __eventsFromObject(a5);
  SBUIServiceButtonEventDescription(v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
