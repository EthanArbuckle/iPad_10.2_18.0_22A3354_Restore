@implementation UIPreviewInteraction

- (UIPreviewInteraction)initWithView:(UIView *)view
{
  UIView *v4;
  UIPreviewInteraction *v5;
  int v6;
  __objc2_class *v7;
  uint64_t v8;
  _UIPreviewInteractionImpl *interactionImpl;
  int v11;
  objc_super v12;

  v4 = view;
  v12.receiver = self;
  v12.super_class = (Class)UIPreviewInteraction;
  v5 = -[UIPreviewInteraction init](&v12, sel_init);
  if (v5)
  {
    if (_UIInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
    v6 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar < 1)
      goto LABEL_5;
    v11 = _UIInternalPreference_UseClickBasedPreviewInteraction;
    if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_UseClickBasedPreviewInteraction)
      goto LABEL_5;
    while (v6 >= v11)
    {
      _UIInternalPreferenceSync(v6, &_UIInternalPreference_UseClickBasedPreviewInteraction, (uint64_t)CFSTR("UseClickBasedPreviewInteraction"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      v11 = _UIInternalPreference_UseClickBasedPreviewInteraction;
      if (v6 == _UIInternalPreference_UseClickBasedPreviewInteraction)
        goto LABEL_5;
    }
    if (!byte_1EDDA7D74)
LABEL_5:
      v7 = _UIPreviewInteractionClassicImpl;
    else
      v7 = _UIPreviewInteractionClickImpl;
    v8 = objc_msgSend([v7 alloc], "initWithView:previewInteraction:", v4, v5);
    interactionImpl = v5->_interactionImpl;
    v5->_interactionImpl = (_UIPreviewInteractionImpl *)v8;

  }
  return v5;
}

- (id)initClickBasedImplementationWithView:(id)a3
{
  id v4;
  UIPreviewInteraction *v5;
  _UIPreviewInteractionClickImpl *v6;
  _UIPreviewInteractionImpl *interactionImpl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIPreviewInteraction;
  v5 = -[UIPreviewInteraction init](&v9, sel_init);
  if (v5)
  {
    v6 = -[_UIPreviewInteractionClickImpl initWithView:previewInteraction:]([_UIPreviewInteractionClickImpl alloc], "initWithView:previewInteraction:", v4, v5);
    interactionImpl = v5->_interactionImpl;
    v5->_interactionImpl = (_UIPreviewInteractionImpl *)v6;

  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIPreviewInteraction;
  if (-[UIPreviewInteraction respondsToSelector:](&v5, sel_respondsToSelector_))
    v3 = 1;
  else
    v3 = objc_opt_respondsToSelector();
  return v3 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIPreviewInteraction;
  -[UIPreviewInteraction methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[_UIPreviewInteractionImpl methodSignatureForSelector:](self->_interactionImpl, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_interactionImpl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionImpl, 0);
}

@end
