@implementation UILinkConnectionAction

- (int64_t)UIActionType
{
  return 43;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3)
    return 0;
  else
    return CFSTR("connection action");
}

- (UILinkConnectionAction)initWithAction:(id)a3 responseHandler:(id)a4
{
  return -[UILinkConnectionAction initWithAction:responseQueue:responseHandler:](self, "initWithAction:responseQueue:responseHandler:", a3, 0, a4);
}

- (UILinkConnectionAction)initWithAction:(id)a3 responseQueue:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  UILinkConnectionAction *v16;
  _QWORD v18[4];
  id v19;

  v8 = a4;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E0D017D0];
  v11 = a3;
  v12 = objc_alloc_init(v10);
  objc_msgSend(v12, "setObject:forSetting:", v11, 0);

  if (v9)
  {
    v13 = (void *)MEMORY[0x1E0D016A0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __71__UILinkConnectionAction_initWithAction_responseQueue_responseHandler___block_invoke;
    v18[3] = &unk_1E16C6A58;
    v19 = v9;
    objc_msgSend(v13, "responderWithHandler:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v8)
      objc_msgSend(v14, "setQueue:", v8);
    objc_msgSend(v15, "setTimeout:", dispatch_time(0, 60000000000));

    v16 = -[UILinkConnectionAction initWithInfo:responder:](self, "initWithInfo:responder:", v12, v15);
  }
  else
  {
    v16 = -[UILinkConnectionAction initWithInfo:responder:](self, "initWithInfo:responder:", v12, 0);
  }

  return v16;
}

void __71__UILinkConnectionAction_initWithAction_responseQueue_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "actionResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
}

- (LNConnectionAction)action
{
  void *v2;
  void *v3;

  -[UILinkConnectionAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (LNConnectionAction *)v3;
}

@end
