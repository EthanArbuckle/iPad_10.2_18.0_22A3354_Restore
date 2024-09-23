@implementation SBAlertItemPresentation

- (SBAlertItemPresentation)initWithAlertItem:(id)a3 presenter:(id)a4
{
  id v7;
  id v8;
  SBAlertItemPresentation *v9;
  SBAlertItemPresentation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBAlertItemPresentation;
  v9 = -[SBAlertItemPresentation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_alertItem, a3);
    objc_storeStrong((id *)&v10->_presenter, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  return -[SBAlertItem hash](self->_alertItem, "hash") + 7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  SBAlertItem *alertItem;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  alertItem = self->_alertItem;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35__SBAlertItemPresentation_isEqual___block_invoke;
  v10[3] = &unk_1E8E9E6B0;
  v11 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "appendObject:counterpart:", alertItem, v10);
  LOBYTE(alertItem) = objc_msgSend(v5, "isEqual");

  return (char)alertItem;
}

id __35__SBAlertItemPresentation_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

- (NSString)description
{
  return (NSString *)-[SBAlertItemPresentation descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBAlertItemPresentation succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_alertItem, CFSTR("alertItem"), 1);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_presenter, CFSTR("presenter"), 1);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBAlertItemPresentation descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SBAlertItem)alertItem
{
  return self->_alertItem;
}

- (void)setAlertItem:(id)a3
{
  objc_storeStrong((id *)&self->_alertItem, a3);
}

- (SBAlertItemPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_presenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_alertItem, 0);
}

@end
