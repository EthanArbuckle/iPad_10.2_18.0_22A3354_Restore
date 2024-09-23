@implementation _UITextFieldVisualStyle

+ (id)inferredVisualStyleWithStyleSubject:(id)a3
{
  id v3;
  _UITextFieldVisualStyle_iOS *v4;

  v3 = a3;
  v4 = -[_UITextFieldVisualStyle initWithStyleSubject:]([_UITextFieldVisualStyle_iOS alloc], "initWithStyleSubject:", v3);

  return v4;
}

- (_UITextFieldVisualStyle)initWithStyleSubject:(id)a3
{
  id v4;
  _UITextFieldVisualStyle *v5;
  _UITextFieldVisualStyle *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UITextFieldVisualStyle;
  v5 = -[_UITextFieldVisualStyle init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_styleSubject, v4);

  return v6;
}

- (_UITextFieldVisualStyleSubject)styleSubject
{
  return (_UITextFieldVisualStyleSubject *)objc_loadWeakRetained((id *)&self->_styleSubject);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_styleSubject);
}

- (id)defaultTextColor
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextFieldVisualStyle.m"), 42, CFSTR("%@ should provide an implementation for %@"), v6, v7);

  return 0;
}

- (id)defaultTextColorForKeyboardAppearance
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextFieldVisualStyle.m"), 48, CFSTR("%@ should provide an implementation for %@"), v6, v7);

  return 0;
}

- (id)defaultFocusedTextColor
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextFieldVisualStyle.m"), 54, CFSTR("%@ should provide an implementation for %@"), v6, v7);

  return 0;
}

- (id)placeholderColor
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextFieldVisualStyle.m"), 60, CFSTR("%@ should provide an implementation for %@"), v6, v7);

  return 0;
}

- (id)parentViewForTextContentView
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextFieldVisualStyle.m"), 66, CFSTR("%@ should provide an implementation for %@"), v6, v7);

  return 0;
}

- (BOOL)textShouldUseVibrancy
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextFieldVisualStyle.m"), 72, CFSTR("%@ should provide an implementation for %@"), v6, v7);

  return 0;
}

- (void)handleTextVibrancy
{
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextFieldVisualStyle.m"), 78, CFSTR("%@ should provide an implementation for %@"), v5, v6);

}

- (void)setStyleSubject:(id)a3
{
  objc_storeWeak((id *)&self->_styleSubject, a3);
}

@end
