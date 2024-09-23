@implementation SBIconViewAssertion

- (SBIconViewAssertion)initWithAssertionType:(int64_t)a3 iconView:(id)a4 extraInfo:(id)a5
{
  id v9;
  id v10;
  SBIconViewAssertion *v11;
  SBIconViewAssertion *v12;
  uint64_t v13;
  NSDictionary *extraInfo;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBIconViewAssertion;
  v11 = -[SBIconViewAssertion init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_assertionType = a3;
    objc_storeStrong((id *)&v11->_iconView, a4);
    v13 = objc_msgSend(v10, "copy");
    extraInfo = v12->_extraInfo;
    v12->_extraInfo = (NSDictionary *)v13;

  }
  return v12;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (!-[SBIconViewAssertion isInvalidated](self, "isInvalidated"))
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "SBIconViewAssertion deallocated but not invalidated!", buf, 2u);
    }

    -[SBIconViewAssertion invalidate](self, "invalidate");
  }
  v4.receiver = self;
  v4.super_class = (Class)SBIconViewAssertion;
  -[SBIconViewAssertion dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  void *v3;

  if (!-[SBIconViewAssertion isInvalidated](self, "isInvalidated"))
  {
    -[SBIconViewAssertion iconView](self, "iconView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAssertion:", self);

    -[SBIconViewAssertion setInvalidated:](self, "setInvalidated:", 1);
  }
}

- (NSString)description
{
  return (NSString *)-[SBIconViewAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconViewAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBIconViewAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  -[SBIconViewAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBIconViewAssertion assertionType](self, "assertionType"), CFSTR("assertionType"));
  -[SBIconViewAssertion extraInfo](self, "extraInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("extraInfo"));

  -[SBIconViewAssertion iconView](self, "iconView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "appendPointer:withName:", v8, CFSTR("iconView"));

  return v4;
}

- (int64_t)assertionType
{
  return self->_assertionType;
}

- (SBIconView)iconView
{
  return self->_iconView;
}

- (NSDictionary)extraInfo
{
  return self->_extraInfo;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraInfo, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
