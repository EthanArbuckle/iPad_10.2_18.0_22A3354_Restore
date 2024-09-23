@implementation _SBFolderControllerIconImageViewControllerKeepSnapshotAssertion

- (_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion)initWithFolderController:(id)a3 snapshotType:(unint64_t)a4 pageIndexesToExclude:(id)a5 reason:(id)a6
{
  id v10;
  id v11;
  id v12;
  _SBFolderControllerIconImageViewControllerKeepSnapshotAssertion *v13;
  _SBFolderControllerIconImageViewControllerKeepSnapshotAssertion *v14;
  uint64_t v15;
  NSIndexSet *pageIndexesToExclude;
  uint64_t v17;
  NSString *reason;
  objc_super v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion;
  v13 = -[_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_folderController, v10);
    v14->_snapshotType = a4;
    v15 = objc_msgSend(v11, "copy");
    pageIndexesToExclude = v14->_pageIndexesToExclude;
    v14->_pageIndexesToExclude = (NSIndexSet *)v15;

    v17 = objc_msgSend(v12, "copy");
    reason = v14->_reason;
    v14->_reason = (NSString *)v17;

  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  if (!-[_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion isInvalidated](self, "isInvalidated"))
    NSLog(CFSTR("Assertion released without invalidation!"));
  -[_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion;
  -[_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  id v3;

  if (!-[_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion isInvalidated](self, "isInvalidated"))
  {
    -[_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion setInvalidated:](self, "setInvalidated:", 1);
    -[_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion folderController](self, "folderController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_removeIconImageViewControllerKeepStaticAssertion:", self);

  }
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  void *v9;
  id v10;
  id v11;

  -[_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion folderController](self, "folderController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendPointer:withName:", v5, CFSTR("folderController"));

  -[_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion pageIndexesToExclude](self, "pageIndexesToExclude");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("pageIndexesToExclude"));

  -[_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion reason](self, "reason");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("reason"));

  v11 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion isInvalidated](self, "isInvalidated"), CFSTR("isInvalidated"), 1);
  return v4;
}

- (NSIndexSet)pageIndexesToExclude
{
  return self->_pageIndexesToExclude;
}

- (NSString)reason
{
  return self->_reason;
}

- (unint64_t)snapshotType
{
  return self->_snapshotType;
}

- (SBFolderController)folderController
{
  return (SBFolderController *)objc_loadWeakRetained((id *)&self->_folderController);
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
  objc_destroyWeak((id *)&self->_folderController);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_pageIndexesToExclude, 0);
}

@end
