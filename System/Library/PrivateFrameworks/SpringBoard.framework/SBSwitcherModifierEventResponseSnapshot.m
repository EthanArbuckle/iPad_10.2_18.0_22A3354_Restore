@implementation SBSwitcherModifierEventResponseSnapshot

- (SBSwitcherModifierEventResponseSnapshot)initWithEventResponse:(id)a3
{
  id v4;
  SBSwitcherModifierEventResponseSnapshot *v5;
  id v6;
  id v7;
  NSArray *v8;
  NSArray *v9;
  NSArray *responseNames;
  NSArray *v11;
  NSArray *responseDescriptions;
  NSArray *v13;
  SBSwitcherModifierEventResponseSnapshot *v14;
  _QWORD v16[4];
  NSArray *v17;
  NSArray *v18;
  objc_super v19;

  v4 = a3;
  if (v4)
  {
    v19.receiver = self;
    v19.super_class = (Class)SBSwitcherModifierEventResponseSnapshot;
    v5 = -[SBSwitcherModifierEventResponseSnapshot init](&v19, sel_init);
    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __65__SBSwitcherModifierEventResponseSnapshot_initWithEventResponse___block_invoke;
      v16[3] = &unk_1E8EBE830;
      v8 = (NSArray *)v6;
      v17 = v8;
      v9 = (NSArray *)v7;
      v18 = v9;
      objc_msgSend(v4, "enumerateResponseTreeUsingBlock:", v16);
      responseNames = v5->_responseNames;
      v5->_responseNames = v8;
      v11 = v8;

      responseDescriptions = v5->_responseDescriptions;
      v5->_responseDescriptions = v9;
      v13 = v9;

    }
    self = v5;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __65__SBSwitcherModifierEventResponseSnapshot_initWithEventResponse___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  NSStringFromSBSwitcherModifierEventResponseType(objc_msgSend(v4, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v4, "description");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v7);
}

- (NSArray)responseNames
{
  return self->_responseNames;
}

- (NSArray)responseDescriptions
{
  return self->_responseDescriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDescriptions, 0);
  objc_storeStrong((id *)&self->_responseNames, 0);
}

@end
