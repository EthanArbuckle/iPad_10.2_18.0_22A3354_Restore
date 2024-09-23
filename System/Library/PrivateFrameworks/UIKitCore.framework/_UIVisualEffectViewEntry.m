@implementation _UIVisualEffectViewEntry

- (void)applyEffectAsRequested:(BOOL)a3 toView:(id)a4
{
  if (a3)
    -[_UIVisualEffectViewEntry applyRequestedEffectToView:](self, "applyRequestedEffectToView:", a4);
  else
    -[_UIVisualEffectViewEntry applyIdentityEffectToView:](self, "applyIdentityEffectToView:", a4);
}

- (void)setRequirements:(int64_t)a3
{
  self->_requirements = a3;
}

- (int64_t)requirements
{
  return self->_requirements;
}

- (BOOL)shouldAnimateProperty:(id)a3
{
  return 0;
}

- (BOOL)isSameTypeOfEffect:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (BOOL)canTransitionToEffect:(id)a3
{
  return 1;
}

- (id)copyForTransitionToEffect:(id)a3
{
  id v4;
  _UIVisualEffectViewTransitioningEntry *v5;

  v4 = a3;
  v5 = -[_UIVisualEffectViewTransitioningEntry initWithSourceEntry:destinationEntry:]([_UIVisualEffectViewTransitioningEntry alloc], "initWithSourceEntry:destinationEntry:", self, v4);

  return v5;
}

- (id)copyForTransitionOut
{
  return -[_UIVisualEffectViewReversingEntry initWithViewEntry:]([_UIVisualEffectViewReversingEntry alloc], "initWithViewEntry:", self);
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIVisualEffectViewEntry;
  -[_UIVisualEffectViewEntry description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" requirements=%li"), self->_requirements);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

@end
