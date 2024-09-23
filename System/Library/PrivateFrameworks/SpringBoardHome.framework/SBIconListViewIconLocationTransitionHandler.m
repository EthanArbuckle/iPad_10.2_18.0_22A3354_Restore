@implementation SBIconListViewIconLocationTransitionHandler

- (SBIconListViewIconLocationTransitionHandler)initWithIconLocation:(id)a3 reason:(id)a4 iconListView:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBIconListViewIconLocationTransitionHandler *v11;
  SBIconListViewIconLocationTransitionHandler *v12;
  uint64_t v13;
  NSString *reason;
  uint64_t v15;
  NSString *iconLocation;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBIconListViewIconLocationTransitionHandler;
  v11 = -[SBIconListViewIconLocationTransitionHandler init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_iconListView, v10);
    v13 = objc_msgSend(v9, "copy");
    reason = v12->_reason;
    v12->_reason = (NSString *)v13;

    v15 = objc_msgSend(v8, "copy");
    iconLocation = v12->_iconLocation;
    v12->_iconLocation = (NSString *)v15;

  }
  return v12;
}

- (void)setProgress:(double)a3
{
  id v5;

  self->_progress = a3;
  -[SBIconListViewIconLocationTransitionHandler iconListView](self, "iconListView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconLocationTransitionHandler:setProgress:", self, a3);

}

- (void)completeTransition:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[SBIconListViewIconLocationTransitionHandler iconListView](self, "iconListView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconLocationTransitionHandler:completeTransition:", self, v3);

}

- (NSString)description
{
  return (NSString *)-[SBIconListViewIconLocationTransitionHandler descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconListViewIconLocationTransitionHandler succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBIconListViewIconLocationTransitionHandler descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  -[SBIconListViewIconLocationTransitionHandler succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListViewIconLocationTransitionHandler iconLocation](self, "iconLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("iconLocation"));

  -[SBIconListViewIconLocationTransitionHandler reason](self, "reason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("reason"));

  -[SBIconListViewIconLocationTransitionHandler progress](self, "progress");
  v9 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("progress"));
  -[SBIconListViewIconLocationTransitionHandler iconListView](self, "iconListView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v4, "appendPointer:withName:", v10, CFSTR("iconListView"));

  return v4;
}

- (NSString)iconLocation
{
  return self->_iconLocation;
}

- (NSString)reason
{
  return self->_reason;
}

- (SBIconListView)iconListView
{
  return (SBIconListView *)objc_loadWeakRetained((id *)&self->_iconListView);
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconListView);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_iconLocation, 0);
}

@end
