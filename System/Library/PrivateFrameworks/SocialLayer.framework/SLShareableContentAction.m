@implementation SLShareableContentAction

+ (id)actionWithBSAction:(id)a3
{
  id v3;
  void *v4;
  NSString *v5;
  objc_class *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 30295);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v6 = NSClassFromString(v5),
        -[objc_class isSubclassOfClass:](v6, "isSubclassOfClass:", objc_opt_class()))
    && -[objc_class instancesRespondToSelector:](v6, "instancesRespondToSelector:", sel_initWithAction_))
  {
    v7 = (void *)objc_msgSend([v6 alloc], "initWithAction:", v3);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (SLShareableContentAction)initWithAction:(id)a3
{
  id v5;
  SLShareableContentAction *v6;
  SLShareableContentAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SLShareableContentAction;
  v6 = -[SLShareableContentAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_action, a3);

  return v7;
}

- (SLShareableContentAction)initWithInfo:(id)a3 responseHandler:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  SLShareableContentAction *v16;
  _QWORD v18[4];
  id v19;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0D017D0];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v9, "applySettings:", v8);

  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forSetting:", v11, 30295);

  v12 = (void *)MEMORY[0x1E0D016A0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __57__SLShareableContentAction_initWithInfo_responseHandler___block_invoke;
  v18[3] = &unk_1E37954E0;
  v19 = v6;
  v13 = v6;
  objc_msgSend(v12, "responderWithHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01698]), "initWithInfo:responder:", v9, v14);
  v16 = -[SLShareableContentAction initWithAction:](self, "initWithAction:", v15);

  return v16;
}

void __57__SLShareableContentAction_initWithInfo_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "error");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v7);
  }
  else
  {
    objc_msgSend(v3, "info");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForSetting:", 2);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD, id, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v7, 0);
  }

}

- (SLShareableContentAction)initWithSceneIdentifier:(id)a3 responseHandler:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  SLShareableContentAction *v10;

  v6 = (objc_class *)MEMORY[0x1E0D017D0];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setObject:forSetting:", v8, 1);

  v10 = -[SLShareableContentAction initWithInfo:responseHandler:](self, "initWithInfo:responseHandler:", v9, v7);
  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLShareableContentAction sceneIdentifier](self, "sceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" sceneIdentifier=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (NSString)sceneIdentifier
{
  NSString *sceneIdentifier;
  NSString **p_sceneIdentifier;
  void *v5;
  void *v6;
  void *v7;

  p_sceneIdentifier = &self->_sceneIdentifier;
  sceneIdentifier = self->_sceneIdentifier;
  if (!sceneIdentifier)
  {
    -[SLShareableContentAction action](self, "action");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "info");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForSetting:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)p_sceneIdentifier, v7);

    sceneIdentifier = *p_sceneIdentifier;
  }
  return sceneIdentifier;
}

- (void)fulfillWithResponse:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0D017D0];
  v5 = a3;
  v8 = objc_alloc_init(v4);
  objc_msgSend(v8, "setObject:forSetting:", v5, 2);

  -[SLShareableContentAction action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D016A8], "responseWithInfo:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendResponse:", v7);

}

- (void)failWithError:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 1, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  -[SLShareableContentAction action](self, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D016A8], "responseForError:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendResponse:", v8);

}

- (void)fail
{
  -[SLShareableContentAction failWithError:](self, "failWithError:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLShareableContentAction)initWithCoder:(id)a3
{
  id v4;
  SLShareableContentAction *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *sceneIdentifier;

  v4 = a3;
  v5 = -[SLShareableContentAction init](self, "init");
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_sceneIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    sceneIdentifier = v5->_sceneIdentifier;
    v5->_sceneIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SLShareableContentAction sceneIdentifier](self, "sceneIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sceneIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (BSAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
}

@end
