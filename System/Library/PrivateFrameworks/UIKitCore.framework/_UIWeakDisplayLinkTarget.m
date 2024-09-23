@implementation _UIWeakDisplayLinkTarget

- (void)_displayLinkTick:(id)a3
{
  id *p_target;
  id v5;
  const char *action;
  id WeakRetained;

  p_target = &self->_target;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(p_target);
  action = self->_action;
  if (dyld_program_sdk_at_least())
    objc_msgSend(WeakRetained, action, v5);
  else
    objc_msgSend(WeakRetained, sel_performSelector_withObject_, action, v5);

}

- (_UIWeakDisplayLinkTarget)initWithTarget:(id)a3 action:(SEL)a4
{
  id v7;
  _UIWeakDisplayLinkTarget *v8;
  _UIWeakDisplayLinkTarget *v9;
  void *v11;
  void *v12;
  objc_super v13;

  v7 = a3;
  if (v7)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIWeakDisplayLinkTarget.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("target"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIWeakDisplayLinkTarget.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

LABEL_3:
  v13.receiver = self;
  v13.super_class = (Class)_UIWeakDisplayLinkTarget;
  v8 = -[_UIWeakDisplayLinkTarget init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_target, v7);
    v9->_action = a4;
  }

  return v9;
}

+ (SEL)displayLinkAction
{
  return sel__displayLinkTick_;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
}

@end
