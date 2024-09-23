@implementation _UIForcedOrientationTransactionToken

- (_UIForcedOrientationTransactionToken)initWithOriginalOrientation:(int64_t)a3 handler:(id)a4 reason:(id)a5
{
  return -[_UIForcedOrientationTransactionToken initWithOriginalOrientation:handler:reason:disablingInterfaceAutorotation:](self, "initWithOriginalOrientation:handler:reason:disablingInterfaceAutorotation:", a3, a4, a5, 1);
}

- (_UIForcedOrientationTransactionToken)initWithOriginalOrientation:(int64_t)a3 handler:(id)a4 reason:(id)a5 disablingInterfaceAutorotation:(BOOL)a6
{
  id v10;
  id v11;
  _UIForcedOrientationTransactionToken *v12;
  _UIForcedOrientationTransactionToken *v13;
  uint64_t v14;
  NSString *transactionReason;
  unint64_t v16;
  NSObject *v18;
  objc_super v19;
  uint8_t buf[4];
  _UIForcedOrientationTransactionToken *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_UIForcedOrientationTransactionToken;
  v12 = -[_UIForcedOrientationTransactionToken init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_originalInterfaceOrientation = a3;
    objc_storeWeak((id *)&v12->_transactionHandler, v10);
    v14 = objc_msgSend(v11, "copy");
    transactionReason = v13->_transactionReason;
    v13->_transactionReason = (NSString *)v14;

    v13->_state = 1;
    v13->_disablesInterfaceAutorotation = a6;
  }
  v16 = initWithOriginalOrientation_handler_reason_disablingInterfaceAutorotation____s_category;
  if (!initWithOriginalOrientation_handler_reason_disablingInterfaceAutorotation____s_category)
  {
    v16 = __UILogCategoryGetNode("OrientationTransaction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v16, (unint64_t *)&initWithOriginalOrientation_handler_reason_disablingInterfaceAutorotation____s_category);
  }
  if ((*(_BYTE *)v16 & 1) != 0)
  {
    v18 = *(NSObject **)(v16 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Created new orientation transaction token: %@", buf, 0xCu);
    }
  }

  return v13;
}

- (void)commitAnimated:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL8 v4;
  id v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  NSObject *v12;
  int v13;
  _UIForcedOrientationTransactionToken *v14;
  __int16 v15;
  _UIForcedOrientationTransactionToken *v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[_UIForcedOrientationTransactionToken state](self, "state") == 1)
  {
    self->_state = 2;
    -[_UIForcedOrientationTransactionToken setCommitCompletionBlock:](self, "setCommitCompletionBlock:", v6);
    v7 = _MergedGlobals_1119;
    if (!_MergedGlobals_1119)
    {
      v7 = __UILogCategoryGetNode("OrientationTransaction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&_MergedGlobals_1119);
    }
    if ((*(_BYTE *)v7 & 1) != 0)
    {
      v10 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = CFSTR("non-animated");
        if (v4)
          v11 = CFSTR("animated");
        v13 = 138412546;
        v14 = (_UIForcedOrientationTransactionToken *)v11;
        v15 = 2112;
        v16 = self;
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Beginning %@ commit of orientation transaction token: %@", (uint8_t *)&v13, 0x16u);
      }
    }
    -[_UIForcedOrientationTransactionToken transactionHandler](self, "transactionHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "commitOrientationTransaction:animated:", self, v4);

  }
  else
  {
    v9 = qword_1ECD7EDB0;
    if (!qword_1ECD7EDB0)
    {
      v9 = __UILogCategoryGetNode("OrientationTransaction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&qword_1ECD7EDB0);
    }
    if ((*(_BYTE *)v9 & 1) != 0)
    {
      v12 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412290;
        v14 = self;
        _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Commit called on an inactive orientation transaction token: %@", (uint8_t *)&v13, 0xCu);
      }
    }
  }

}

- (void)didCommitOrientation
{
  unint64_t v3;
  void (**v4)(_QWORD);
  NSObject *v5;
  int v6;
  _UIForcedOrientationTransactionToken *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[_UIForcedOrientationTransactionToken state](self, "state") == 2)
  {
    self->_state = 0;
    v3 = didCommitOrientation___s_category;
    if (!didCommitOrientation___s_category)
    {
      v3 = __UILogCategoryGetNode("OrientationTransaction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&didCommitOrientation___s_category);
    }
    if ((*(_BYTE *)v3 & 1) != 0)
    {
      v5 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = 138412290;
        v7 = self;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Commit finished for orientation transaction token: %@", (uint8_t *)&v6, 0xCu);
      }
    }
    -[_UIForcedOrientationTransactionToken commitCompletionBlock](self, "commitCompletionBlock");
    v4 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    -[_UIForcedOrientationTransactionToken setCommitCompletionBlock:](self, "setCommitCompletionBlock:", 0);
    if (v4)
      v4[2](v4);

  }
}

- (void)cancel
{
  unint64_t v3;
  void *v4;
  NSObject *v5;
  int v6;
  _UIForcedOrientationTransactionToken *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[_UIForcedOrientationTransactionToken state](self, "state") == 1)
  {
    self->_state = 0;
    v3 = cancel___s_category;
    if (!cancel___s_category)
    {
      v3 = __UILogCategoryGetNode("OrientationTransaction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&cancel___s_category);
    }
    if ((*(_BYTE *)v3 & 1) != 0)
    {
      v5 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = 138412290;
        v7 = self;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Cancelling orientation transaction token: %@", (uint8_t *)&v6, 0xCu);
      }
    }
    -[_UIForcedOrientationTransactionToken transactionHandler](self, "transactionHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelOrientationTransaction:", self);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[_UIForcedOrientationTransactionToken cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)_UIForcedOrientationTransactionToken;
  -[_UIForcedOrientationTransactionToken dealloc](&v3, sel_dealloc);
}

- (NSString)debugDescription
{
  return (NSString *)-[_UIForcedOrientationTransactionToken debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIForcedOrientationTransactionToken succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIForcedOrientationTransactionToken state](self, "state");
  if (v4 > 2)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E16D3F20[v4];
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("state"));
  v6 = (id)objc_msgSend(v3, "ui_appendInterfaceOrientation:withName:", -[_UIForcedOrientationTransactionToken originalInterfaceOrientation](self, "originalInterfaceOrientation"), CFSTR("originalOrientation"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIForcedOrientationTransactionToken descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIForcedOrientationTransactionToken descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _UIForcedOrientationTransactionToken *v13;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveMultilinePrefix:", v5);

  objc_msgSend(v6, "activeMultilinePrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78___UIForcedOrientationTransactionToken_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E16B1B50;
  v8 = v6;
  v12 = v8;
  v13 = self;
  objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", 0, v7, v11);

  v9 = v8;
  return v9;
}

- (id)_orientationDebugDescription
{
  return -[_UIForcedOrientationTransactionToken descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (int64_t)originalInterfaceOrientation
{
  return self->_originalInterfaceOrientation;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)transactionReason
{
  return self->_transactionReason;
}

- (id)commitCompletionBlock
{
  return self->_commitCompletionBlock;
}

- (void)setCommitCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (_UIForcedOrientationTransactionHandler)transactionHandler
{
  return (_UIForcedOrientationTransactionHandler *)objc_loadWeakRetained((id *)&self->_transactionHandler);
}

- (void)setTransactionHandler:(id)a3
{
  objc_storeWeak((id *)&self->_transactionHandler, a3);
}

- (BOOL)disablesInterfaceAutorotation
{
  return self->_disablesInterfaceAutorotation;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transactionHandler);
  objc_storeStrong(&self->_commitCompletionBlock, 0);
  objc_storeStrong((id *)&self->_transactionReason, 0);
}

@end
