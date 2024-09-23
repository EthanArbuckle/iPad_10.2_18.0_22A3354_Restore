@implementation SBMainStatusBarContentAssertion

- (SBMainStatusBarContentAssertion)initWithIdentifier:(id)a3 forReason:(id)a4
{
  SBMainStatusBarContentAssertion *v4;
  SBMainStatusBarContentAssertion *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBMainStatusBarContentAssertion;
  v4 = -[BSSimpleAssertion initWithIdentifier:forReason:invalidationBlock:](&v8, sel_initWithIdentifier_forReason_invalidationBlock_, a3, a4, &__block_literal_global_135_0);
  v5 = v4;
  if (v4)
  {
    v4->_dateAndTimeVisible = 1;
    v4->_animated = 1;
    v4->_duration = 0.3;
    +[SBMainStatusBarStateProvider sharedInstance](SBMainStatusBarStateProvider, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "acquireContentAssertion:", v5);

  }
  return v5;
}

void __64__SBMainStatusBarContentAssertion_initWithIdentifier_forReason___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = a2;
  v3 = objc_opt_class();
  SBSafeCast(v3, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  +[SBMainStatusBarStateProvider sharedInstance](SBMainStatusBarStateProvider, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relinquishContentAssertion:", v5);

}

- (void)setDateAndTimeVisible:(BOOL)a3
{
  id v4;

  if (self->_dateAndTimeVisible != a3)
  {
    self->_dateAndTimeVisible = a3;
    +[SBMainStatusBarStateProvider sharedInstance](SBMainStatusBarStateProvider, "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didUpdateContentAssertion:", self);

  }
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)dateAndTimeVisible
{
  return self->_dateAndTimeVisible;
}

@end
