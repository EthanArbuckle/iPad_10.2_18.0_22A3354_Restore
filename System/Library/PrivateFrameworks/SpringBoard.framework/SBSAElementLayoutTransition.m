@implementation SBSAElementLayoutTransition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetElementContexts, 0);
  objc_storeStrong((id *)&self->_initialElementContexts, 0);
}

- (SBSAElementLayoutTransition)initWithInitialElementContexts:(id)a3 targetElementContext:(id)a4
{
  id v6;
  id v7;
  SBSAElementLayoutTransition *v8;
  SBSAElementLayoutTransition *v9;
  uint64_t v10;
  NSArray *initialElementContexts;
  uint64_t v12;
  NSArray *targetElementContexts;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBSAElementLayoutTransition;
  v8 = -[SBSAElementLayoutTransition init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      v10 = objc_msgSend(v6, "copy");
      initialElementContexts = v9->_initialElementContexts;
      v9->_initialElementContexts = (NSArray *)v10;
    }
    else
    {
      initialElementContexts = v8->_initialElementContexts;
      v8->_initialElementContexts = (NSArray *)MEMORY[0x1E0C9AA60];
    }

    if (v7)
    {
      v12 = objc_msgSend(v7, "copy");
      targetElementContexts = v9->_targetElementContexts;
      v9->_targetElementContexts = (NSArray *)v12;
    }
    else
    {
      targetElementContexts = v9->_targetElementContexts;
      v9->_targetElementContexts = (NSArray *)MEMORY[0x1E0C9AA60];
    }

  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInitialElementContexts:targetElementContext:", self->_initialElementContexts, self->_targetElementContexts);
}

BOOL __39__SBSAElementLayoutTransition_isEqual___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "targetElementContexts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SBSAAreElementLayoutsEqualToLayouts(v1, v2);

  return v3;
}

BOOL __39__SBSAElementLayoutTransition_isEqual___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "initialElementContexts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SBSAAreElementLayoutsEqualToLayouts(v1, v2);

  return v3;
}

- (NSArray)targetElementContexts
{
  return self->_targetElementContexts;
}

- (NSArray)initialElementContexts
{
  return self->_initialElementContexts;
}

- (BOOL)isLayoutChange
{
  return !SBSAAreElementLayoutsEqualToLayouts(self->_initialElementContexts, self->_targetElementContexts);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v12;
  uint64_t v13;
  BOOL (*v14)(uint64_t);
  void *v15;
  SBSAElementLayoutTransition *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __39__SBSAElementLayoutTransition_isEqual___block_invoke;
  v18[3] = &unk_1E8E9EA50;
  v18[4] = self;
  v19 = v4;
  v12 = v6;
  v13 = 3221225472;
  v14 = __39__SBSAElementLayoutTransition_isEqual___block_invoke_2;
  v15 = &unk_1E8E9EA50;
  v16 = self;
  v17 = v19;
  v7 = v19;
  v8 = (void *)MEMORY[0x1D17E5550](&v12);
  objc_msgSend(v5, "appendEqualsBlocks:", v18, v8, 0, v12, v13, v14, v15, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual");

  return v10;
}

- (BOOL)isCollisionRequired
{
  NSUInteger v3;
  NSUInteger v4;
  int v5;
  _BOOL4 v6;
  void *v9;
  void *v10;

  v3 = -[NSArray count](self->_initialElementContexts, "count");
  v4 = -[NSArray count](self->_targetElementContexts, "count");
  v5 = (v3 != 0) & ~SBSAAreElementLayoutsEqualToLayouts(self->_initialElementContexts, self->_targetElementContexts);
  if (v4)
    v6 = v5;
  else
    v6 = 0;
  if (v6 && v3 == 1 && v4 == 1)
  {
    -[NSArray firstObject](self->_initialElementContexts, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray firstObject](self->_targetElementContexts, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (SAElementIdentityEqualToIdentity())
      LOBYTE(v6) = objc_msgSend(v9, "layoutMode") == 3 && objc_msgSend(v10, "layoutMode") != 3;
    else
      LOBYTE(v6) = 1;

  }
  return v6;
}

- (BOOL)isSingleElementExpansion
{
  void *v3;
  void *v4;
  int v5;
  char v6;
  BOOL v7;

  if (-[NSArray count](self->_initialElementContexts, "count") != 1
    || -[NSArray count](self->_targetElementContexts, "count") != 1)
  {
    return 0;
  }
  -[NSArray firstObject](self->_initialElementContexts, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray firstObject](self->_targetElementContexts, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SAElementIdentityEqualToIdentity();
  v6 = SBSAIsElementLayoutEqualToLayout(v3, v4);
  v7 = 0;
  if (v5 && (v6 & 1) == 0)
    v7 = objc_msgSend(v4, "layoutMode") == 3;

  return v7;
}

- (BOOL)isTransitionFromCustom
{
  void *v3;
  _BOOL4 v4;

  -[NSArray sbsa_onlyObjectOrNil](self->_initialElementContexts, "sbsa_onlyObjectOrNil");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "layoutMode") == 3)
    v4 = !SBSAAreElementLayoutsEqualToLayouts(self->_initialElementContexts, self->_targetElementContexts);
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)isTransitionToSingleCompact
{
  void *v3;
  BOOL v4;

  if (-[NSArray count](self->_targetElementContexts, "count") != 1)
    return 0;
  -[NSArray firstObject](self->_targetElementContexts, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBSAElementLayoutTransition isLayoutChange](self, "isLayoutChange"))
    v4 = objc_msgSend(v3, "layoutMode") == 2;
  else
    v4 = 0;

  return v4;
}

- (BOOL)elementWithIdentityWasOrIsSensorAttached:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;

  if (!a3)
    return 0;
  v4 = a3;
  -[SBSAElementLayoutTransition initialElementContexts](self, "initialElementContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBSAElementIdentityOfSensorAttachedElementInCollection(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = SAElementIdentityEqualToIdentity();

  -[SBSAElementLayoutTransition targetElementContexts](self, "targetElementContexts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBSAElementIdentityOfSensorAttachedElementInCollection(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = SAElementIdentityEqualToIdentity();

  return v7 | v6;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:", self->_initialElementContexts);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:", self->_targetElementContexts);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; initialElementContexts: %@; targetElementContexts: %@>"),
               objc_opt_class(),
               self,
               self->_initialElementContexts,
               self->_targetElementContexts);
}

@end
