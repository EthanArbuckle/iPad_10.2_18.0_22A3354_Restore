@implementation PXMockAssistantContext

- (PXMockAssistantContext)init
{
  PXMockAssistantContext *v2;
  uint64_t v3;
  NSArray *stepContextIdentifiers;
  objc_super v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)PXMockAssistantContext;
  v2 = -[PXMockAssistantContext init](&v6, sel_init);
  if (v2)
  {
    v7[0] = CFSTR("PXMockStepContextIdentifier1");
    v7[1] = CFSTR("PXMockStepContextIdentifier2");
    v7[2] = CFSTR("PXMockStepContextIdentifier3");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
    v3 = objc_claimAutoreleasedReturnValue();
    stepContextIdentifiers = v2->_stepContextIdentifiers;
    v2->_stepContextIdentifiers = (NSArray *)v3;

  }
  return v2;
}

- (id)initialStepContextIdentifiers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[PXMockAssistantContext nextStepContextIdentifierFromStepContextIdentifier:](self, "nextStepContextIdentifierFromStepContextIdentifier:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nextStepContextIdentifierFromStepContextIdentifier:(id)a3
{
  NSArray *stepContextIdentifiers;
  uint64_t v6;
  void *v7;
  void *v9;

  stepContextIdentifiers = self->_stepContextIdentifiers;
  if (a3)
  {
    v6 = -[NSArray indexOfObject:](stepContextIdentifiers, "indexOfObject:");
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockAssistantContext.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("currentIndex != NSNotFound"));

    }
    -[NSArray objectAtIndexedSubscript:](self->_stepContextIdentifiers, "objectAtIndexedSubscript:", v6 + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSArray firstObject](stepContextIdentifiers, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)stepContextForStepContextIdentifier:(id)a3
{
  id v5;
  const __CFString *v6;
  const __CFString *v7;
  PXMockAssistantContext *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  void *v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockAssistantContext.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stepContextIdentifier"));

  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXMockStepContextIdentifier1")))
  {
    v6 = CFSTR("PXMockStepContextIdentifier1");
    v7 = CFSTR("1 - First Page");
LABEL_7:
    v8 = self;
    v9 = 0;
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXMockStepContextIdentifier2")))
  {
    v6 = CFSTR("PXMockStepContextIdentifier2");
    v7 = CFSTR("2 - Second Page");
    goto LABEL_7;
  }
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("PXMockStepContextIdentifier3")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockAssistantContext.m"), 78, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v6 = CFSTR("PXMockStepContextIdentifier3");
  v7 = CFSTR("3 - Last Page");
  v8 = self;
  v9 = 1;
LABEL_10:
  -[PXMockAssistantContext _stepContextWithIdentifier:viewTitle:firstButtonType:](v8, "_stepContextWithIdentifier:viewTitle:firstButtonType:", v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_stepContextWithIdentifier:(id)a3 viewTitle:(id)a4 firstButtonType:(int64_t)a5
{
  id v7;
  id v8;
  PXMockAssistantView *v9;
  void *v10;
  PXAssistantStepContext *v11;
  _QWORD v13[5];

  v7 = a4;
  v8 = a3;
  v9 = -[PXMockAssistantView initWithTitle:]([PXMockAssistantView alloc], "initWithTitle:", v7);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F20]), "initWithNibName:bundle:", 0, 0);
  objc_msgSend(v10, "setView:", v9);
  v11 = -[PXAssistantStepContext initWithIdentifier:viewController:]([PXAssistantStepContext alloc], "initWithIdentifier:viewController:", v8, v10);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__PXMockAssistantContext__stepContextWithIdentifier_viewTitle_firstButtonType___block_invoke;
  v13[3] = &__block_descriptor_40_e51_v16__0___PXAssistantViewControllerMutableContext__8l;
  v13[4] = a5;
  -[PXAssistantStepContext performChanges:](v11, "performChanges:", v13);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepContextIdentifiers, 0);
}

uint64_t __79__PXMockAssistantContext__stepContextWithIdentifier_viewTitle_firstButtonType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFirstButtonType:", *(_QWORD *)(a1 + 32));
}

@end
