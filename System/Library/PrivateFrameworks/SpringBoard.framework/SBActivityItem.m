@implementation SBActivityItem

- (SBActivityItem)initWithContentUpdate:(id)a3
{
  id v5;
  SBActivityItem *v6;
  SBActivityItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBActivityItem;
  v6 = -[SBActivityItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contentUpdate, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSString *identifier;
  uint64_t v7;
  id v8;
  id v9;
  double relevanceScore;
  id v11;
  id v12;
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
  identifier = self->_identifier;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __26__SBActivityItem_isEqual___block_invoke;
  v19[3] = &unk_1E8E9E6B0;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", identifier, v19);
  relevanceScore = self->_relevanceScore;
  v14 = v7;
  v15 = 3221225472;
  v16 = __26__SBActivityItem_isEqual___block_invoke_2;
  v17 = &unk_1E8EA8460;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendDouble:counterpart:", &v14, relevanceScore);
  LOBYTE(v8) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return (char)v8;
}

uint64_t __26__SBActivityItem_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "identifier");
}

uint64_t __26__SBActivityItem_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "relevanceScore");
}

- (void)setContentUpdate:(id)a3
{
  ACActivityContentUpdate *v5;
  ACActivityContentUpdate **p_contentUpdate;
  ACActivityContentUpdate *contentUpdate;
  ACActivityContentUpdate *v8;

  v5 = (ACActivityContentUpdate *)a3;
  contentUpdate = self->_contentUpdate;
  p_contentUpdate = &self->_contentUpdate;
  if (contentUpdate != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_contentUpdate, a3);
    v5 = v8;
  }

}

- (ACActivityContentUpdate)contentUpdate
{
  return self->_contentUpdate;
}

- (NSString)identifier
{
  return (NSString *)-[ACActivityContentUpdate identifier](self->_contentUpdate, "identifier");
}

- (ACActivityDescriptor)descriptor
{
  return (ACActivityDescriptor *)-[ACActivityContentUpdate descriptor](self->_contentUpdate, "descriptor");
}

- (double)relevanceScore
{
  void *v2;
  double v3;
  double v4;

  -[ACActivityContentUpdate content](self->_contentUpdate, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relevanceScore");
  v4 = v3;

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBActivityItem;
  -[SBActivityItem description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBActivityItem descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBActivityItem succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBActivityItem descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;

  -[SBActivityItem succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_descriptor, CFSTR("descriptor"));
  v7 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", CFSTR("relevanceScore"), 2, self->_relevanceScore);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contentUpdate, 0);
}

@end
