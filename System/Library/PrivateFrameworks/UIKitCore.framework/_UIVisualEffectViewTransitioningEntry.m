@implementation _UIVisualEffectViewTransitioningEntry

- (_UIVisualEffectViewTransitioningEntry)initWithSourceEntry:(id)a3 destinationEntry:(id)a4
{
  id v7;
  id v8;
  _UIVisualEffectViewTransitioningEntry *v9;
  _UIVisualEffectViewTransitioningEntry *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UIVisualEffectViewTransitioningEntry;
  v9 = -[_UIVisualEffectViewTransitioningEntry init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceEntry, a3);
    objc_storeStrong((id *)&v10->_destinationEntry, a4);
    v11 = -[_UIVisualEffectViewEntry requirements](v10->_sourceEntry, "requirements");
    v12 = -[_UIVisualEffectViewEntry requirements](v10->_destinationEntry, "requirements");
    if (v11 == v12 || v12 == 0)
      goto LABEL_8;
    if (!v11)
    {
      v11 = v12;
LABEL_8:
      -[_UIVisualEffectViewEntry setRequirements:](v10, "setRequirements:", v11);
    }
  }

  return v10;
}

- (BOOL)shouldAnimateProperty:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[_UIVisualEffectViewEntry shouldAnimateProperty:](self->_sourceEntry, "shouldAnimateProperty:", v4)
    || -[_UIVisualEffectViewEntry shouldAnimateProperty:](self->_destinationEntry, "shouldAnimateProperty:", v4);

  return v5;
}

- (void)addEffectToView:(id)a3
{
  -[_UIVisualEffectViewEntry addEffectToView:](self->_sourceEntry, "addEffectToView:", a3);
}

- (void)applyIdentityEffectToView:(id)a3
{
  -[_UIVisualEffectViewEntry applyRequestedEffectToView:](self->_sourceEntry, "applyRequestedEffectToView:", a3);
}

- (void)applyRequestedEffectToView:(id)a3
{
  -[_UIVisualEffectViewEntry applyRequestedEffectToView:](self->_destinationEntry, "applyRequestedEffectToView:", a3);
}

- (void)removeEffectFromView:(id)a3
{
  -[_UIVisualEffectViewEntry removeEffectFromView:](self->_destinationEntry, "removeEffectFromView:", a3);
}

- (BOOL)isSameTypeOfEffect:(id)a3
{
  return 0;
}

- (BOOL)canTransitionToEffect:(id)a3
{
  return 0;
}

- (id)copyForTransitionToEffect:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIVisualEffectModel.m"), 257, CFSTR("Logic error: attempt to transition from a transitioning helper effect."));

  return 0;
}

- (id)copyForTransitionOut
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIVisualEffectModel.m"), 263, CFSTR("Logic error: attempt to transition from a transitioning helper effect."));

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIVisualEffectViewTransitioningEntry;
  -[_UIVisualEffectViewEntry description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" source=%@ destination=%@"), self->_sourceEntry, self->_destinationEntry);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationEntry, 0);
  objc_storeStrong((id *)&self->_sourceEntry, 0);
}

@end
