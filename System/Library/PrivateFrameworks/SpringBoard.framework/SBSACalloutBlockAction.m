@implementation SBSACalloutBlockAction

- (SBSACalloutBlockAction)initWithCalloutBlock:(id)a3 reasons:(id)a4
{
  id v6;
  id v7;
  SBSACalloutBlockAction *v8;
  uint64_t v9;
  id calloutBlock;
  uint64_t v11;
  NSArray *reasons;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBSACalloutBlockAction;
  v8 = -[SBSACalloutBlockAction init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    calloutBlock = v8->_calloutBlock;
    v8->_calloutBlock = (id)v9;

    v11 = objc_msgSend(v7, "copy");
    reasons = v8->_reasons;
    v8->_reasons = (NSArray *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSArray *reasons;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17E5550](self->_calloutBlock);
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __34__SBSACalloutBlockAction_isEqual___block_invoke;
  v19[3] = &unk_1E8EA4320;
  v8 = v4;
  v20 = v8;
  objc_msgSend(v5, "appendObject:counterpart:", v6, v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  reasons = self->_reasons;
  v14 = v7;
  v15 = 3221225472;
  v16 = __34__SBSACalloutBlockAction_isEqual___block_invoke_2;
  v17 = &unk_1E8EA4320;
  v18 = v8;
  v11 = v8;
  objc_msgSend(v9, "appendObject:counterpart:", reasons, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v12, "isEqual", v14, v15, v16, v17);

  return v7;
}

uint64_t __34__SBSACalloutBlockAction_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "calloutBlock");
}

uint64_t __34__SBSACalloutBlockAction_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reasons");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1D17E5550](self->_calloutBlock);
  objc_msgSend(v3, "appendObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendObject:", self->_reasons);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  return v7;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x1D17E5550](self->_calloutBlock);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; calloutBlock: %@; reasons: %@>"), v4, self, v5, self->_reasons);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCalloutBlock:reasons:", self->_calloutBlock, self->_reasons);
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (id)calloutBlock
{
  return self->_calloutBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_calloutBlock, 0);
  objc_storeStrong((id *)&self->_reasons, 0);
}

@end
