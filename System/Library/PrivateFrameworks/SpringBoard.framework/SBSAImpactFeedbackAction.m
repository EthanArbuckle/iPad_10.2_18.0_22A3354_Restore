@implementation SBSAImpactFeedbackAction

- (SBSAImpactFeedbackAction)initWithImpactFeedbackStyle:(int64_t)a3 prepareOnly:(BOOL)a4 reasons:(id)a5
{
  id v8;
  SBSAImpactFeedbackAction *v9;
  SBSAImpactFeedbackAction *v10;
  uint64_t v11;
  NSArray *reasons;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBSAImpactFeedbackAction;
  v9 = -[SBSAImpactFeedbackAction init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_impactFeedbackStyle = a3;
    v9->_prepareOnly = a4;
    v11 = objc_msgSend(v8, "copy");
    reasons = v10->_reasons;
    v10->_reasons = (NSArray *)v11;

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t impactFeedbackStyle;
  uint64_t v7;
  id v8;
  void *v9;
  _BOOL8 prepareOnly;
  id v11;
  void *v12;
  NSArray *reasons;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  impactFeedbackStyle = self->_impactFeedbackStyle;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __36__SBSAImpactFeedbackAction_isEqual___block_invoke;
  v21[3] = &unk_1E8EA3AB0;
  v8 = v4;
  v22 = v8;
  objc_msgSend(v5, "appendInteger:counterpart:", impactFeedbackStyle, v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  prepareOnly = self->_prepareOnly;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __36__SBSAImpactFeedbackAction_isEqual___block_invoke_2;
  v19[3] = &unk_1E8EA3E78;
  v11 = v8;
  v20 = v11;
  objc_msgSend(v9, "appendBool:counterpart:", prepareOnly, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  reasons = self->_reasons;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __36__SBSAImpactFeedbackAction_isEqual___block_invoke_3;
  v17[3] = &unk_1E8EA4320;
  v18 = v11;
  v14 = v11;
  objc_msgSend(v12, "appendObject:counterpart:", reasons, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v15, "isEqual");

  return v7;
}

uint64_t __36__SBSAImpactFeedbackAction_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "impactFeedbackStyle");
}

uint64_t __36__SBSAImpactFeedbackAction_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareOnly");
}

uint64_t __36__SBSAImpactFeedbackAction_isEqual___block_invoke_3(uint64_t a1)
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
  objc_msgSend(v3, "appendInteger:", self->_impactFeedbackStyle);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendBool:", self->_prepareOnly);
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
  int64_t impactFeedbackStyle;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  impactFeedbackStyle = self->_impactFeedbackStyle;
  NSStringFromBOOL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; impactFeedbackStyle: %ld; prepareOnly: %@; reasons: %@>"),
    v4,
    self,
    impactFeedbackStyle,
    v6,
    self->_reasons);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImpactFeedbackStyle:prepareOnly:reasons:", self->_impactFeedbackStyle, self->_prepareOnly, self->_reasons);
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (int64_t)impactFeedbackStyle
{
  return self->_impactFeedbackStyle;
}

- (BOOL)prepareOnly
{
  return self->_prepareOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
}

@end
