@implementation SBChainableModifierEvent

- (NSString)description
{
  return (NSString *)-[SBChainableModifierEvent descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handledReason, 0);
}

- (BOOL)isHandled
{
  return self->_handled;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_handled, CFSTR("handled"), 1);
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", self->_handledReason, CFSTR("reason"), 1);
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBChainableModifierEvent descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)handleWithReason:(id)a3
{
  id v5;
  NSString *v6;
  NSString *handledReason;
  NSObject *v8;
  void *v9;
  NSString *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_handled)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBChainableModifierEvent.m"), 18, CFSTR("Can't handle an event that has already been handled."));

  }
  self->_handled = 1;
  v6 = (NSString *)objc_msgSend(v5, "copy");
  handledReason = self->_handledReason;
  self->_handledReason = v6;

  -[SBChainableModifierEvent loggingCategory](self, "loggingCategory");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[SBChainableModifierEvent description](self, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_handledReason;
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Handling event: %@ for reason: %@", (uint8_t *)&v12, 0x16u);

  }
}

- (id)unhandledCopy
{
  uint64_t v2;
  void *v3;

  v2 = -[SBChainableModifierEvent copy](self, "copy");
  *(_BYTE *)(v2 + 8) = 0;
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  return (id)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  uint64_t v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[8] = self->_handled;
  v5 = -[NSString copy](self->_handledReason, "copy");
  v6 = (void *)*((_QWORD *)v4 + 2);
  *((_QWORD *)v4 + 2) = v5;

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBChainableModifierEvent succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (NSString)handledReason
{
  return self->_handledReason;
}

@end
