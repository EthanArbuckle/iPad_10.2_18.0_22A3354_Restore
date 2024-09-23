@implementation _UIScreenBoundingPathUtilities

- (UIScreen)_screen
{
  return (UIScreen *)objc_loadWeakRetained((id *)&self->_screen);
}

+ (id)boundingPathUtilitiesForScreen:(id)a3
{
  id v3;
  _BOOL4 v4;
  __objc2_class **v5;
  void *v6;

  v3 = a3;
  v4 = +[_UIScreenComplexBoundingPathUtilities isScreenSupported:](_UIScreenComplexBoundingPathUtilities, "isScreenSupported:", v3);
  v5 = off_1E167CCF0;
  if (v4)
    v5 = off_1E167CCE8;
  v6 = (void *)objc_msgSend(objc_alloc(*v5), "initWithScreen:", v3);

  return v6;
}

- (_UIScreenBoundingPathUtilities)initWithScreen:(id)a3
{
  id v4;
  _UIScreenBoundingPathUtilities *v5;
  _UIScreenBoundingPathUtilities *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIScreenBoundingPathUtilities;
  v5 = -[_UIScreenBoundingPathUtilities init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_screen, v4);

  return v6;
}

- (id)boundingPathForWindow:(id)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScreenBoundingPathUtilities.m"), 44, CFSTR("%@ must provide a concrete implementation of %@"), v7, v8);

  return 0;
}

- (void)setScreen:(id)a3
{
  objc_storeWeak((id *)&self->_screen, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_screen);
}

@end
