@implementation _SBRootFolderViewElementBorrowedAssertion

- (_SBRootFolderViewElementBorrowedAssertion)initWithFolderView:(id)a3 reason:(id)a4
{
  id v7;
  id v8;
  _SBRootFolderViewElementBorrowedAssertion *v9;
  _SBRootFolderViewElementBorrowedAssertion *v10;
  uint64_t v11;
  NSString *reason;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SBRootFolderViewElementBorrowedAssertion;
  v9 = -[_SBRootFolderViewElementBorrowedAssertion init](&v14, sel_init);
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
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 8);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "_SBRootFolderViewElementBorrowedAssertion deallocated but not invalidated! Reason: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)invalidate
{
  void *v3;

  -[_SBRootFolderViewElementBorrowedAssertion folderView](self, "folderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elementBorrowedAssertionDidInvalidate:", self);

  -[_SBRootFolderViewElementBorrowedAssertion setFolderView:](self, "setFolderView:", 0);
}

- (NSString)description
{
  return (NSString *)-[_SBRootFolderViewElementBorrowedAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_SBRootFolderViewElementBorrowedAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[_SBRootFolderViewElementBorrowedAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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

  -[_SBRootFolderViewElementBorrowedAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBRootFolderViewElementBorrowedAssertion reason](self, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("reason"));

  -[_SBRootFolderViewElementBorrowedAssertion folderView](self, "folderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendPointer:withName:", v7, CFSTR("folderView"));

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderView, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
