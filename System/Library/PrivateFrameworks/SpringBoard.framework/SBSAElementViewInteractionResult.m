@implementation SBSAElementViewInteractionResult

- (SBSAElementViewInteractionResult)initWithIdentity:(id)a3 interactionSource:(unint64_t)a4 viewInteractionResult:(int64_t)a5
{
  id v8;
  SBSAElementViewInteractionResult *v9;
  void *v10;
  uint64_t v11;
  NSString *clientIdentifier;
  void *v13;
  uint64_t v14;
  NSString *elementIdentifier;
  objc_super v17;

  v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBSAElementViewInteractionResult;
  v9 = -[SBSAElementViewInteractionResult init](&v17, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "clientIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    clientIdentifier = v9->_clientIdentifier;
    v9->_clientIdentifier = (NSString *)v11;

    objc_msgSend(v8, "elementIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    elementIdentifier = v9->_elementIdentifier;
    v9->_elementIdentifier = (NSString *)v14;

    v9->_interactionSource = a4;
    v9->_viewInteractionResult = a5;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSString *clientIdentifier;
  uint64_t v7;
  id v8;
  void *v9;
  NSString *elementIdentifier;
  id v11;
  void *v12;
  unint64_t interactionSource;
  id v14;
  void *v15;
  int64_t viewInteractionResult;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  clientIdentifier = self->_clientIdentifier;
  v7 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __44__SBSAElementViewInteractionResult_isEqual___block_invoke;
  v29[3] = &unk_1E8EA4320;
  v8 = v4;
  v30 = v8;
  objc_msgSend(v5, "appendObject:counterpart:", clientIdentifier, v29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  elementIdentifier = self->_elementIdentifier;
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __44__SBSAElementViewInteractionResult_isEqual___block_invoke_2;
  v27[3] = &unk_1E8EA4320;
  v11 = v8;
  v28 = v11;
  objc_msgSend(v9, "appendObject:counterpart:", elementIdentifier, v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  interactionSource = self->_interactionSource;
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __44__SBSAElementViewInteractionResult_isEqual___block_invoke_3;
  v25[3] = &unk_1E8EA3AB0;
  v14 = v11;
  v26 = v14;
  objc_msgSend(v12, "appendInteger:counterpart:", interactionSource, v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  viewInteractionResult = self->_viewInteractionResult;
  v20 = v7;
  v21 = 3221225472;
  v22 = __44__SBSAElementViewInteractionResult_isEqual___block_invoke_4;
  v23 = &unk_1E8EA3AB0;
  v24 = v14;
  v17 = v14;
  objc_msgSend(v15, "appendInteger:counterpart:", viewInteractionResult, &v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v18, "isEqual", v20, v21, v22, v23);

  return v7;
}

uint64_t __44__SBSAElementViewInteractionResult_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
}

uint64_t __44__SBSAElementViewInteractionResult_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "elementIdentifier");
}

uint64_t __44__SBSAElementViewInteractionResult_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "interactionSource");
}

uint64_t __44__SBSAElementViewInteractionResult_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "viewInteractionResult");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:", self->_clientIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:", self->_elementIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendInteger:", self->_interactionSource);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendInteger:", self->_viewInteractionResult);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  return v8;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  NSString *clientIdentifier;
  NSString *elementIdentifier;
  unint64_t interactionSource;
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  clientIdentifier = self->_clientIdentifier;
  elementIdentifier = self->_elementIdentifier;
  interactionSource = self->_interactionSource;
  if (interactionSource > 2)
    v8 = CFSTR("[Invalid]");
  else
    v8 = off_1E8EA4340[interactionSource];
  SAUIStringFromElementViewInteractionResult();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; clientIdentifier: %@; elementIdentifier: %@; interaction source: %@; view interaction result: %@>"),
    v4,
    self,
    clientIdentifier,
    elementIdentifier,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentity:interactionSource:viewInteractionResult:", self, self->_interactionSource, self->_viewInteractionResult);
}

+ (id)instanceWithBlock:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)objc_msgSend(v4, "copyWithBlock:", v3);

  return v5;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)-[SBSAElementViewInteractionResult copy](self, "copy");
  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithElementViewInteractionResult:", v5);
    v4[2](v4, v6);

  }
  return v5;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)_setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (void)_setElementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)interactionSource
{
  return self->_interactionSource;
}

- (void)_setInteractionSource:(unint64_t)a3
{
  self->_interactionSource = a3;
}

- (int64_t)viewInteractionResult
{
  return self->_viewInteractionResult;
}

- (void)_setViewInteractionResult:(int64_t)a3
{
  self->_viewInteractionResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
