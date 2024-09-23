@implementation SBInAppStatusBarHiddenAssertion

- (SBInAppStatusBarHiddenAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 invalidationBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBInAppStatusBarHiddenAssertion *v12;
  uint64_t v13;
  NSString *identifier;
  uint64_t v15;
  NSString *reason;
  uint64_t v17;
  id invalidationBlock;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBInAppStatusBarHiddenAssertion.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBInAppStatusBarHiddenAssertion.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBInAppStatusBarHiddenAssertion.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invalidationBlock"));

LABEL_4:
  v23.receiver = self;
  v23.super_class = (Class)SBInAppStatusBarHiddenAssertion;
  v12 = -[SBInAppStatusBarHiddenAssertion init](&v23, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    reason = v12->_reason;
    v12->_reason = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    invalidationBlock = v12->_invalidationBlock;
    v12->_invalidationBlock = (id)v17;

  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[SBInAppStatusBarHiddenAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBInAppStatusBarHiddenAssertion;
  -[SBInAppStatusBarHiddenAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[SBInAppStatusBarHiddenAssertion invalidateWithAnimation:](self, "invalidateWithAnimation:", 0);
}

- (void)invalidateWithAnimation:(BOOL)a3
{
  void (**invalidationBlock)(id, SBInAppStatusBarHiddenAssertion *, BOOL);
  id v5;

  invalidationBlock = (void (**)(id, SBInAppStatusBarHiddenAssertion *, BOOL))self->_invalidationBlock;
  if (invalidationBlock)
  {
    invalidationBlock[2](invalidationBlock, self, a3);
    v5 = self->_invalidationBlock;
    self->_invalidationBlock = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationBlock, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
