@implementation _UIPhysicalButtonBSAction

- (_UIPhysicalButtonBSAction)initWithPhysicalButton:(unint64_t)a3 behavior:(unint64_t)a4 generation:(unint64_t)a5 completion:(id)a6
{
  return -[_UIPhysicalButtonBSAction initWithPhysicalButton:behavior:state:generation:completion:](self, "initWithPhysicalButton:behavior:state:generation:completion:", a3, a4, 2, a5, a6);
}

- (_UIPhysicalButtonBSAction)initWithPhysicalButton:(unint64_t)a3 behavior:(unint64_t)a4 state:(unint64_t)a5 generation:(unint64_t)a6 completion:(id)a7
{
  void *v14;
  _UIPhysicalButtonBSAction *v15;
  void *v17;
  objc_super v18;

  if ((_UIPhysicalButtonBehaviorIsValidForButton(a4, a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonBSAction.m"), 50, CFSTR("Invalid behavior: %lu; for button: %lu"),
      a4,
      a3);

  }
  _UIPhysicalButtonBSActionSettings(a3, a4, a5, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0D016A0], "responderWithHandler:", a7);
    a7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a7, "setQueue:", MEMORY[0x1E0C80D38]);
  }
  v18.receiver = self;
  v18.super_class = (Class)_UIPhysicalButtonBSAction;
  v15 = -[_UIPhysicalButtonBSAction initWithInfo:responder:](&v18, sel_initWithInfo_responder_, v14, a7);

  return v15;
}

- (int64_t)UIActionType
{
  return 51;
}

- (unint64_t)button
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_UIPhysicalButtonBSAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (unint64_t)behavior
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_UIPhysicalButtonBSAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (unint64_t)state
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_UIPhysicalButtonBSAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (unint64_t)generation
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_UIPhysicalButtonBSAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIPhysicalButtonBSAction succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _NSStringFromUIPhysicalButtonActionSetting(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _NSStringFromUIPhysicalButton(-[_UIPhysicalButtonBSAction button](self, "button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, v4);
  _NSStringFromUIPhysicalButtonActionSetting(1uLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _NSStringFromUIPhysicalButtonBehavior(-[_UIPhysicalButtonBSAction behavior](self, "behavior"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v7, v6);
  _NSStringFromUIPhysicalButtonActionSetting(3uLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _NSStringFromUIPhysicalButtonState(-[_UIPhysicalButtonBSAction state](self, "state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v9, v8);
  v10 = -[_UIPhysicalButtonBSAction generation](self, "generation");
  _NSStringFromUIPhysicalButtonActionSetting(2uLL);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendUInt64:withName:", v10, v11);

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIPhysicalButtonBSAction descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIPhysicalButtonBSAction descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _UIPhysicalButtonBSAction *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67___UIPhysicalButtonBSAction_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v6 = v5;
  v11 = v6;
  v12 = self;
  v7 = (id)objc_msgSend(v6, "modifyBody:", v10);
  v8 = v6;

  return v8;
}

- (BOOL)settings:(id)a3 appendDescriptionToBuilder:(id)a4 forFlag:(int64_t)a5 object:(id)a6 ofSetting:(unint64_t)a7
{
  void *v10;
  uint64_t v11;
  BOOL v12;
  id v13;
  void *v14;

  _NSStringFromUIPhysicalButtonActionSetting(a7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a7)
  {
    case 0uLL:
      _NSStringFromUIPhysicalButton(objc_msgSend(a6, "unsignedIntegerValue"));
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      _NSStringFromUIPhysicalButtonBehavior(objc_msgSend(a6, "unsignedIntegerValue"));
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      v13 = (id)objc_msgSend(a4, "appendUInt64:withName:", objc_msgSend(a6, "longLongValue"), v10);
      goto LABEL_8;
    case 3uLL:
      _NSStringFromUIPhysicalButtonState(objc_msgSend(a6, "unsignedIntegerValue"));
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v14 = (void *)v11;
      objc_msgSend(a4, "appendString:withName:", v11, v10);

LABEL_8:
      v12 = 1;
      break;
    default:
      v12 = 0;
      break;
  }

  return v12;
}

@end
