@implementation UIGestureRecognizerTarget

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
}

- (void)_sendActionWithGestureRecognizer:(uint64_t)a1
{
  const char *v4;
  id WeakRetained;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v4 = *(const char **)(a1 + 16);
    if (dyld_program_sdk_at_least())
      objc_msgSend(WeakRetained, v4, a2);
    else
      objc_msgSend(WeakRetained, sel_performSelector_withObject_, v4, a2);

  }
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (id)description
{
  UIGestureRecognizerTarget *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  objc_class *v6;
  void *v7;
  id v8;
  void *v9;

  v2 = self;
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(self->_action);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (UIGestureRecognizerTarget *)((char *)v2 + 8);
  WeakRetained = objc_loadWeakRetained((id *)&v2->super.isa);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)&v2->super.isa);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(action=%@, target=<%@ %p>)"), v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (SEL)action
{
  return self->_action;
}

@end
