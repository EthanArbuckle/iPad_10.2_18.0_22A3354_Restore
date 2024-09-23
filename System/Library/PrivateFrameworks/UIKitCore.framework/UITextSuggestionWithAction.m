@implementation UITextSuggestionWithAction

- (void)performActionWihSender:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  const char *v7;
  id v8;

  -[UITextSuggestionWithAction target](self, "target", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_9;
  v8 = v4;
  if (!-[UITextSuggestionWithAction action](self, "action"))
  {
LABEL_8:
    v4 = v8;
LABEL_9:

    return;
  }
  -[UITextSuggestionWithAction target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextSuggestionWithAction action](self, "action");
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[UITextSuggestionWithAction target](self, "target");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7 = -[UITextSuggestionWithAction action](self, "action");
    if (dyld_program_sdk_at_least())
      objc_msgSend(v8, v7, self);
    else
      objc_msgSend(v8, sel_performSelector_withObject_, v7, self);
    goto LABEL_8;
  }
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong(&self->_target, a3);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_target, 0);
}

@end
