@implementation SBFolderViewAssertion

- (SBFolderViewAssertion)initWithAssertionType:(int64_t)a3 folderView:(id)a4 extraInfo:(id)a5
{
  id v9;
  id v10;
  SBFolderViewAssertion *v11;
  SBFolderViewAssertion *v12;
  uint64_t v13;
  NSDictionary *extraInfo;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBFolderViewAssertion;
  v11 = -[SBFolderViewAssertion init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_assertionType = a3;
    objc_storeStrong((id *)&v11->_folderView, a4);
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

  if (!-[SBFolderViewAssertion isInvalidated](self, "isInvalidated"))
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "SBFolderViewAssertion deallocated but not invalidated!", buf, 2u);
    }

    -[SBFolderViewAssertion invalidate](self, "invalidate");
  }
  v4.receiver = self;
  v4.super_class = (Class)SBFolderViewAssertion;
  -[SBFolderViewAssertion dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  void *v3;

  if (!-[SBFolderViewAssertion isInvalidated](self, "isInvalidated"))
  {
    -[SBFolderViewAssertion folderView](self, "folderView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAssertion:", self);

    -[SBFolderViewAssertion setInvalidated:](self, "setInvalidated:", 1);
  }
}

- (NSString)description
{
  return (NSString *)-[SBFolderViewAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFolderViewAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBFolderViewAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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

  -[SBFolderViewAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBFolderViewAssertion assertionType](self, "assertionType"), CFSTR("assertionType"));
  -[SBFolderViewAssertion extraInfo](self, "extraInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("extraInfo"));

  -[SBFolderViewAssertion folderView](self, "folderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "appendPointer:withName:", v8, CFSTR("folderView"));

  return v4;
}

- (int64_t)assertionType
{
  return self->_assertionType;
}

- (SBFolderView)folderView
{
  return self->_folderView;
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
  objc_storeStrong((id *)&self->_folderView, 0);
}

@end
