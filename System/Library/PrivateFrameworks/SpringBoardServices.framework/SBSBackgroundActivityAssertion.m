@implementation SBSBackgroundActivityAssertion

+ (id)backgroundLocationAssertionForPID:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  getSTBackgroundActivityIdentifierBackgroundLocation();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSBackgroundActivityAssertion assertionWithBackgroundActivityIdentifier:forPID:exclusive:showsWhenForeground:](SBSBackgroundActivityAssertion, "assertionWithBackgroundActivityIdentifier:forPID:exclusive:showsWhenForeground:", v4, v3, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)assertionWithBackgroundActivityIdentifier:(id)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a6;
  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithBackgroundActivityIdentifiers:forPID:exclusive:showsWhenForeground:", v12, v8, v7, v6);
  return v13;
}

+ (id)assertionWithBackgroundActivityIdentifiers:(id)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  id v10;
  void *v11;

  v6 = a6;
  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBackgroundActivityIdentifiers:forPID:exclusive:showsWhenForeground:", v10, v8, v7, v6);

  return v11;
}

- (SBSBackgroundActivityAssertion)initWithBackgroundActivityIdentifiers:(id)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  id v10;
  SBSBackgroundActivityAssertionData *v11;
  SBSBackgroundActivityAssertion *v12;

  v6 = a6;
  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = -[SBSBackgroundActivityAssertionData initWithBackgroundActivityIdentifiers:forPID:exclusive:showsWhenForeground:]([SBSBackgroundActivityAssertionData alloc], "initWithBackgroundActivityIdentifiers:forPID:exclusive:showsWhenForeground:", v10, v8, v7, v6);

  v12 = -[SBSBackgroundActivityAssertion initWithBackgroundActivityAssertionData:](self, "initWithBackgroundActivityAssertionData:", v11);
  return v12;
}

- (SBSBackgroundActivityAssertion)initWithBackgroundActivityAssertionData:(id)a3
{
  id v5;
  SBSBackgroundActivityAssertion *v6;
  SBSBackgroundActivityAssertion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSBackgroundActivityAssertion;
  v6 = -[SBSBackgroundActivityAssertion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_assertionData, a3);

  return v7;
}

- (void)dealloc
{
  void *v3;
  id invalidationHandler;
  objc_super v5;

  +[SBSBackgroundActivityAssertionManager sharedInstance](SBSBackgroundActivityAssertionManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeBackgroundActivityAssertion:", self);

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBSBackgroundActivityAssertion;
  -[SBSBackgroundActivityAssertion dealloc](&v5, sel_dealloc);
}

- (NSSet)backgroundActivityIdentifiers
{
  return -[SBSBackgroundActivityAssertionData backgroundActivityIdentifiers](self->_assertionData, "backgroundActivityIdentifiers");
}

- (int)pid
{
  return -[SBSBackgroundActivityAssertionData pid](self->_assertionData, "pid");
}

- (BOOL)isExclusive
{
  return -[SBSBackgroundActivityAssertionData isExclusive](self->_assertionData, "isExclusive");
}

- (BOOL)showsWhenForeground
{
  return -[SBSBackgroundActivityAssertionData showsWhenForeground](self->_assertionData, "showsWhenForeground");
}

- (NSString)statusString
{
  return -[SBSBackgroundActivityAssertionData statusString](self->_assertionData, "statusString");
}

- (void)setStatusString:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SBSBackgroundActivityAssertionData statusString](self->_assertionData, "statusString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v7);

  if ((v5 & 1) == 0)
  {
    -[SBSBackgroundActivityAssertionData setStatusString:](self->_assertionData, "setStatusString:", v7);
    +[SBSBackgroundActivityAssertionManager sharedInstance](SBSBackgroundActivityAssertionManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateStatusStringForAssertion:", self);

  }
}

- (NSString)uniqueIdentifier
{
  return -[SBSBackgroundActivityAssertionData uniqueIdentifier](self->_assertionData, "uniqueIdentifier");
}

- (void)acquireWithHandler:(id)a3 invalidationHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id invalidationHandler;
  NSObject *v11;
  _QWORD block[4];
  id v13;

  v6 = a3;
  v7 = a4;
  +[SBSBackgroundActivityAssertionManager sharedInstance](SBSBackgroundActivityAssertionManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(v7, "copy");
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = v9;

    objc_msgSend(v8, "addBackgroundActivityAssertion:withHandler:onQueue:", self, v6, 0);
  }
  else if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__SBSBackgroundActivityAssertion_acquireWithHandler_invalidationHandler___block_invoke;
    block[3] = &unk_1E288D310;
    v13 = v6;
    dispatch_async(v11, block);

  }
}

uint64_t __73__SBSBackgroundActivityAssertion_acquireWithHandler_invalidationHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)acquireWithHandler:(id)a3 onQueue:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;

  v6 = a3;
  v7 = a4;
  +[SBSBackgroundActivityAssertionManager sharedInstance](SBSBackgroundActivityAssertionManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "addBackgroundActivityAssertion:withHandler:onQueue:", self, v6, v7);
  }
  else if (v6)
  {
    v10 = v7;
    if (!v7)
    {
      dispatch_get_global_queue(0, 0);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__SBSBackgroundActivityAssertion_acquireWithHandler_onQueue___block_invoke;
    block[3] = &unk_1E288D310;
    v12 = v6;
    dispatch_async(v10, block);
    if (!v7)

  }
}

uint64_t __61__SBSBackgroundActivityAssertion_acquireWithHandler_onQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  id v3;

  +[SBSBackgroundActivityAssertionManager sharedInstance](SBSBackgroundActivityAssertionManager, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeBackgroundActivityAssertion:", self);

}

- (NSString)description
{
  return (NSString *)-[SBSBackgroundActivityAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSBackgroundActivityAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBSBackgroundActivityAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBSBackgroundActivityAssertion assertionData](self, "assertionData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionBuilderWithMultilinePrefix:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SBSBackgroundActivityAssertionData)assertionData
{
  return self->_assertionData;
}

- (void)setAssertionData:(id)a3
{
  objc_storeStrong((id *)&self->_assertionData, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_assertionData, 0);
}

@end
