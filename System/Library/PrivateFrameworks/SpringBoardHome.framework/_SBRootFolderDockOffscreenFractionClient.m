@implementation _SBRootFolderDockOffscreenFractionClient

- (_SBRootFolderDockOffscreenFractionClient)initWithFolderView:(id)a3 reason:(id)a4
{
  id v7;
  id v8;
  _SBRootFolderDockOffscreenFractionClient *v9;
  _SBRootFolderDockOffscreenFractionClient *v10;
  uint64_t v11;
  NSString *reason;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SBRootFolderDockOffscreenFractionClient;
  v9 = -[_SBRootFolderDockOffscreenFractionClient init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_folderView, a3);
    v11 = objc_msgSend(v8, "copy");
    reason = v10->_reason;
    v10->_reason = (NSString *)v11;

  }
  return v10;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *reason;
  SBRootFolderView *folderView;
  objc_super v6;
  uint8_t buf[4];
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_folderView)
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      reason = self->_reason;
      *(_DWORD *)buf = 138543362;
      v8 = reason;
      _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "_SBRootFolderDockOffscreenFractionClient deallocated but not invalidated! Reason: %{public}@", buf, 0xCu);
    }

    folderView = self->_folderView;
  }
  else
  {
    folderView = 0;
  }
  -[SBRootFolderView removeDockOffscreenFractionClient:](folderView, "removeDockOffscreenFractionClient:", self);
  v6.receiver = self;
  v6.super_class = (Class)_SBRootFolderDockOffscreenFractionClient;
  -[_SBRootFolderDockOffscreenFractionClient dealloc](&v6, sel_dealloc);
}

- (void)setDockOffscreenFraction:(double)a3
{
  double v5;
  id v6;

  -[_SBRootFolderDockOffscreenFractionClient desiredOffscreenFraction](self, "desiredOffscreenFraction");
  if (v5 != a3)
  {
    -[_SBRootFolderDockOffscreenFractionClient folderView](self, "folderView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[_SBRootFolderDockOffscreenFractionClient setDesiredOffscreenFraction:](self, "setDesiredOffscreenFraction:", a3);
    objc_msgSend(v6, "clientDidChangeDockOffScreenFraction:", self);

  }
}

- (void)layoutIfNeededForDockOffscreenFractionChanged
{
  -[SBRootFolderView layoutIfNeeded](self->_folderView, "layoutIfNeeded");
}

- (void)invalidate
{
  void *v3;

  -[_SBRootFolderDockOffscreenFractionClient folderView](self, "folderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeDockOffscreenFractionClient:", self);

  -[_SBRootFolderDockOffscreenFractionClient setFolderView:](self, "setFolderView:", 0);
}

- (NSString)description
{
  return (NSString *)-[_SBRootFolderDockOffscreenFractionClient descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_SBRootFolderDockOffscreenFractionClient succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[_SBRootFolderDockOffscreenFractionClient descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  id v7;
  void *v8;
  id v9;

  -[_SBRootFolderDockOffscreenFractionClient succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBRootFolderDockOffscreenFractionClient reason](self, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("reason"));

  -[_SBRootFolderDockOffscreenFractionClient desiredOffscreenFraction](self, "desiredOffscreenFraction");
  v7 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("desiredOffscreenFraction"));
  -[_SBRootFolderDockOffscreenFractionClient folderView](self, "folderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "appendPointer:withName:", v8, CFSTR("folderView"));

  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (SBRootFolderView)folderView
{
  return self->_folderView;
}

- (void)setFolderView:(id)a3
{
  objc_storeStrong((id *)&self->_folderView, a3);
}

- (double)desiredOffscreenFraction
{
  return self->_desiredOffscreenFraction;
}

- (void)setDesiredOffscreenFraction:(double)a3
{
  self->_desiredOffscreenFraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderView, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
