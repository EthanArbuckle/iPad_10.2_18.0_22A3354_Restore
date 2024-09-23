@implementation TURepeatingAction

- (TURepeatingAction)initWithAction:(id)a3
{
  id v4;
  TURepeatingAction *v5;
  void *v6;
  id action;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TURepeatingAction;
  v5 = -[TURepeatingAction init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    action = v5->_action;
    v5->_action = v6;

  }
  return v5;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)remainingIterations
{
  return self->_remainingIterations;
}

- (void)setRemainingIterations:(unint64_t)a3
{
  self->_remainingIterations = a3;
}

- (double)pauseDuration
{
  return self->_pauseDuration;
}

- (void)setPauseDuration:(double)a3
{
  self->_pauseDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_action, 0);
}

@end
