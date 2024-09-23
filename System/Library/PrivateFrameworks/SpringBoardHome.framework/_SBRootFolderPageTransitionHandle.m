@implementation _SBRootFolderPageTransitionHandle

- (_SBRootFolderPageTransitionHandle)initWithFolderController:(id)a3 destinationPageState:(int64_t)a4 reason:(id)a5
{
  id v9;
  id v10;
  _SBRootFolderPageTransitionHandle *v11;
  _SBRootFolderPageTransitionHandle *v12;
  uint64_t v13;
  NSString *reason;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_SBRootFolderPageTransitionHandle;
  v11 = -[_SBRootFolderPageTransitionHandle init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_folderController, a3);
    v13 = objc_msgSend(v10, "copy");
    reason = v12->_reason;
    v12->_reason = (NSString *)v13;

    v12->_sourcePageState = objc_msgSend(v9, "pageState");
    v12->_destinationPageState = a4;
    v12->_valid = 1;
  }

  return v12;
}

- (void)setTransitionProgress:(double)a3
{
  NSObject *v5;
  id v6;

  if (-[_SBRootFolderPageTransitionHandle isValid](self, "isValid"))
  {
    -[_SBRootFolderPageTransitionHandle setPageTransitionProgress:](self, "setPageTransitionProgress:", a3);
    -[_SBRootFolderPageTransitionHandle folderController](self, "folderController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pageTransitionHandle:updateCurrentPageStateTransitionToProgress:", self, a3);

  }
  else
  {
    SBLogRootController();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_SBRootFolderPageTransitionHandle setTransitionProgress:].cold.1(self, v5, a3);

  }
}

- (void)endTransitionSuccessfully:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  NSObject *v6;
  id v7;

  v3 = a3;
  if (-[_SBRootFolderPageTransitionHandle isValid](self, "isValid"))
  {
    v5 = 0.0;
    if (v3)
      v5 = 1.0;
    -[_SBRootFolderPageTransitionHandle setPageTransitionProgress:](self, "setPageTransitionProgress:", v5);
    -[_SBRootFolderPageTransitionHandle folderController](self, "folderController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pageTransitionHandle:endPageStateTransitionSuccessfully:", self, v3);

  }
  else
  {
    SBLogRootController();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_SBRootFolderPageTransitionHandle endTransitionSuccessfully:].cold.1(self, v3, v6);

  }
}

- (NSString)description
{
  return (NSString *)-[_SBRootFolderPageTransitionHandle descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_SBRootFolderPageTransitionHandle succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[_SBRootFolderPageTransitionHandle descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  -[_SBRootFolderPageTransitionHandle succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBRootFolderPageTransitionHandle reason](self, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("reason"));

  SBStringForRootFolderPageState(-[_SBRootFolderPageTransitionHandle sourcePageState](self, "sourcePageState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("sourcePageState"));

  SBStringForRootFolderPageState(-[_SBRootFolderPageTransitionHandle destinationPageState](self, "destinationPageState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("destinationPageState"));

  -[_SBRootFolderPageTransitionHandle pageTransitionProgress](self, "pageTransitionProgress");
  v11 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("pageTransitionProgress"));
  -[_SBRootFolderPageTransitionHandle folderController](self, "folderController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v4, "appendPointer:withName:", v12, CFSTR("folderController"));

  v14 = (id)objc_msgSend(v4, "appendBool:withName:", -[_SBRootFolderPageTransitionHandle isValid](self, "isValid"), CFSTR("valid"));
  -[_SBRootFolderPageTransitionHandle customIconImageViewControllerCancelTouchesAssertion](self, "customIconImageViewControllerCancelTouchesAssertion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v15, CFSTR("customIconImageViewControllerCancelTouchesAssertion"), 1);

  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (SBRootFolderController)folderController
{
  return self->_folderController;
}

- (int64_t)sourcePageState
{
  return self->_sourcePageState;
}

- (void)setSourcePageState:(int64_t)a3
{
  self->_sourcePageState = a3;
}

- (int64_t)destinationPageState
{
  return self->_destinationPageState;
}

- (void)setDestinationPageState:(int64_t)a3
{
  self->_destinationPageState = a3;
}

- (double)pageTransitionProgress
{
  return self->_pageTransitionProgress;
}

- (void)setPageTransitionProgress:(double)a3
{
  self->_pageTransitionProgress = a3;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BSInvalidatable)customIconImageViewControllerCancelTouchesAssertion
{
  return self->_customIconImageViewControllerCancelTouchesAssertion;
}

- (void)setCustomIconImageViewControllerCancelTouchesAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_customIconImageViewControllerCancelTouchesAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customIconImageViewControllerCancelTouchesAssertion, 0);
  objc_storeStrong((id *)&self->_folderController, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (void)setTransitionProgress:(double)a3 .cold.1(void *a1, NSObject *a2, double a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  SBStringForRootFolderPageState(objc_msgSend(a1, "sourcePageState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBStringForRootFolderPageState(objc_msgSend(a1, "destinationPageState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "reason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138544130;
  v10 = v6;
  v11 = 2114;
  v12 = v7;
  v13 = 2114;
  v14 = v8;
  v15 = 2048;
  v16 = a3;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "Trying to update a page state transition that has ended (%{public}@ -> %{public}@, %{public}@), progress: %g", (uint8_t *)&v9, 0x2Au);

}

- (void)endTransitionSuccessfully:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  SBStringForRootFolderPageState(objc_msgSend(a1, "sourcePageState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBStringForRootFolderPageState(objc_msgSend(a1, "destinationPageState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "reason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138544130;
  v10 = v6;
  v11 = 2114;
  v12 = v7;
  v13 = 2114;
  v14 = v8;
  v15 = 1024;
  v16 = a2 & 1;
  _os_log_error_impl(&dword_1CFEF3000, a3, OS_LOG_TYPE_ERROR, "Trying to end a page state transition that has already ended (%{public}@ -> %{public}@, %{public}@, successful: %{BOOL}u)", (uint8_t *)&v9, 0x26u);

}

@end
