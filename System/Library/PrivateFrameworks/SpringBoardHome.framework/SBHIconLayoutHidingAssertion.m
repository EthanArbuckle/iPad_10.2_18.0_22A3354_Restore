@implementation SBHIconLayoutHidingAssertion

- (SBHIconLayoutHidingAssertion)initWithDelegate:(id)a3 icons:(id)a4 reason:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  SBHIconLayoutHidingAssertion *v13;
  uint64_t v14;
  NSMutableSet *icons;
  uint64_t v16;
  NSString *reason;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBHIconLayoutHidingAssertion;
  v13 = -[SBHIconLayoutHidingAssertion init](&v19, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v11, "mutableCopy");
    icons = v13->_icons;
    v13->_icons = (NSMutableSet *)v14;

    objc_storeWeak((id *)&v13->_delegate, v10);
    v16 = objc_msgSend(v12, "copy");
    reason = v13->_reason;
    v13->_reason = (NSString *)v16;

    v13->_options = a6;
  }

  return v13;
}

- (void)dealloc
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_fault_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_FAULT, "SBHIconLayoutHidingAssertion deallocated but not invalidated! Reason: %@", (uint8_t *)&v3, 0xCu);
}

- (NSArray)icons
{
  return (NSArray *)(id)-[NSMutableSet copy](self->_icons, "copy");
}

- (BOOL)referencesIcon:(id)a3
{
  return -[NSMutableSet containsObject:](self->_icons, "containsObject:", a3);
}

- (BOOL)referencesIconInListModel:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__SBHIconLayoutHidingAssertion_referencesIconInListModel___block_invoke;
  v4[3] = &unk_1E8D87A40;
  v4[4] = self;
  return objc_msgSend(a3, "directlyContainsIconPassingTest:", v4);
}

uint64_t __58__SBHIconLayoutHidingAssertion_referencesIconInListModel___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "containsObject:", a2);
}

- (void)addIcon:(id)a3
{
  id v4;

  -[NSMutableSet addObject:](self->_icons, "addObject:", a3);
  -[SBHIconLayoutHidingAssertion delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutHidingAssertionDidChange:", self);

}

- (void)setOptions:(unint64_t)a3
{
  id v4;

  if (self->_options != a3)
  {
    self->_options = a3;
    -[SBHIconLayoutHidingAssertion delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutHidingAssertionDidChange:", self);

  }
}

- (unint64_t)listMutationOptions
{
  return (-[SBHIconLayoutHidingAssertion options](self, "options") << 19) & 0x200000;
}

- (unint64_t)folderMutationOptions
{
  unint64_t v2;

  v2 = -[SBHIconLayoutHidingAssertion options](self, "options");
  return ((_DWORD)v2 << 22) & 0x1000000 | (((v2 >> 4) & 1) << 20) & 0xFFFFFFFFFBFFFFFFLL | (((v2 >> 5) & 1) << 26);
}

- (NSString)description
{
  return (NSString *)-[SBHIconLayoutHidingAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)invalidate
{
  id v3;

  if (!-[SBHIconLayoutHidingAssertion isInvalidated](self, "isInvalidated"))
  {
    -[SBHIconLayoutHidingAssertion delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutHidingAssertionDidInvalidate:", self);
    -[SBHIconLayoutHidingAssertion setInvalidated:](self, "setInvalidated:", 1);

  }
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHIconLayoutHidingAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBHIconLayoutHidingAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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

  -[SBHIconLayoutHidingAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconLayoutHidingAssertion icons](self, "icons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("icons"));

  -[SBHIconLayoutHidingAssertion reason](self, "reason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("reason"));

  -[SBHIconLayoutHidingAssertion delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendPointer:withName:", v9, CFSTR("delegate"));

  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (SBHIconLayoutHidingAssertionDelegate)delegate
{
  return (SBHIconLayoutHidingAssertionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_icons, 0);
}

@end
