@implementation _UIVisualEffectViewReversingEntry

- (_UIVisualEffectViewReversingEntry)initWithViewEntry:(id)a3
{
  id v5;
  _UIVisualEffectViewReversingEntry *v6;
  _UIVisualEffectViewReversingEntry *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIVisualEffectViewReversingEntry;
  v6 = -[_UIVisualEffectViewReversingEntry init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceEntry, a3);
    -[_UIVisualEffectViewEntry setRequirements:](v7, "setRequirements:", -[_UIVisualEffectViewEntry requirements](v7->_sourceEntry, "requirements"));
  }

  return v7;
}

- (BOOL)shouldAnimateProperty:(id)a3
{
  return -[_UIVisualEffectViewEntry shouldAnimateProperty:](self->_sourceEntry, "shouldAnimateProperty:", a3);
}

- (void)addEffectToView:(id)a3
{
  -[_UIVisualEffectViewEntry addEffectToView:](self->_sourceEntry, "addEffectToView:", a3);
}

- (void)applyRequestedEffectToView:(id)a3
{
  -[_UIVisualEffectViewEntry applyIdentityEffectToView:](self->_sourceEntry, "applyIdentityEffectToView:", a3);
}

- (void)applyIdentityEffectToView:(id)a3
{
  -[_UIVisualEffectViewEntry applyRequestedEffectToView:](self->_sourceEntry, "applyRequestedEffectToView:", a3);
}

- (void)removeEffectFromView:(id)a3
{
  -[_UIVisualEffectViewEntry removeEffectFromView:](self->_sourceEntry, "removeEffectFromView:", a3);
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
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIVisualEffectModel.m"), 179, CFSTR("Logic error: attempt to transition from a transitioning helper effect."));

  return 0;
}

- (id)copyForTransitionOut
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIVisualEffectModel.m"), 185, CFSTR("Logic error: attempt to transition from a transitioning helper effect."));

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIVisualEffectViewReversingEntry;
  -[_UIVisualEffectViewEntry description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" source=%@"), self->_sourceEntry);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEntry, 0);
}

@end
