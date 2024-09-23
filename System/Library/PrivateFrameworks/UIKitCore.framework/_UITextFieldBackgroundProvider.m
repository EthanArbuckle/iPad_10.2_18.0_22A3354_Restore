@implementation _UITextFieldBackgroundProvider

- (BOOL)drawsContent
{
  return 0;
}

- (void)addToTextField:(id)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id obj;

  obj = a3;
  if (!obj)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextFieldBackgroundProvider.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("textField"), 0);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextFieldBackgroundProvider.m"), 57, CFSTR("Adding a background decorator that is already attached to a textfield."));

  }
  objc_storeWeak((id *)&self->_textField, obj);

}

- (id)preferredMetricsProvider
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  _UITextFieldBackgroundProvider *v4;
  id *p_isa;
  uint64_t v6;
  BOOL v7;
  id WeakRetained;
  id v9;
  BOOL v10;

  v4 = (_UITextFieldBackgroundProvider *)a3;
  p_isa = (id *)&v4->super.isa;
  if (!v4)
    goto LABEL_4;
  if (v4 == self)
  {
    v7 = 1;
    goto LABEL_16;
  }
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    WeakRetained = objc_loadWeakRetained(p_isa + 1);
    v9 = objc_loadWeakRetained((id *)&self->_textField);
    if (WeakRetained)
      v10 = v9 == 0;
    else
      v10 = 1;
    v7 = v10 || WeakRetained == v9;

  }
  else
  {
LABEL_4:
    v7 = 0;
  }
LABEL_16:

  return v7;
}

- (void)removeFromTextField
{
  objc_storeWeak((id *)&self->_textField, 0);
}

- (id)overridingGetBackgroundColor
{
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textField);
}

- (UITextField)textField
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_textField);
}

- (id)overridingSetBackgroundColor:(id)a3
{
  return a3;
}

- (int64_t)associatedBorderStyle
{
  return -1;
}

- (id)focusRingPathForBounds:(CGRect)a3
{
  return 0;
}

- (BOOL)hitTestView:(id)a3
{
  return 0;
}

- (BOOL)_isTV
{
  id WeakRetained;
  void *v3;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  objc_msgSend(WeakRetained, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "userInterfaceIdiom") == 2;
  else
    v4 = 0;

  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  id WeakRetained;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UITextFieldBackgroundProvider;
  v3 = -[_UITextFieldBackgroundProvider hash](&v7, sel_hash);
  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  v5 = objc_msgSend(WeakRetained, "hash") ^ v3;

  return v5;
}

- (id)description
{
  UIDescriptionBuilder *v3;
  id WeakRetained;
  id v5;
  void *v6;

  v3 = -[UIDescriptionBuilder initWithObject:]([UIDescriptionBuilder alloc], "initWithObject:", self);
  -[_UITextFieldBackgroundProvider _buildDescription:](self, "_buildDescription:", v3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  v5 = -[UIDescriptionBuilder appendName:object:usingLightweightDescription:](v3, "appendName:object:usingLightweightDescription:", CFSTR("textfield"), WeakRetained, 1);

  -[UIDescriptionBuilder string](v3, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
