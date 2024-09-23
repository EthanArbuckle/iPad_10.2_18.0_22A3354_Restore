@implementation UIToolbarAppearance

- (void)_setupDefaults
{
  UIBarButtonItemAppearance *v3;
  UIBarButtonItemAppearance *buttonAppearance;
  UIBarButtonItemAppearance *v5;
  UIBarButtonItemAppearance *doneButtonAppearance;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIToolbarAppearance;
  -[UIBarAppearance _setupDefaults](&v7, sel__setupDefaults);
  if (!self->_buttonAppearance)
  {
    v3 = -[UIBarButtonItemAppearance initWithStyle:]([UIBarButtonItemAppearance alloc], "initWithStyle:", 0);
    buttonAppearance = self->_buttonAppearance;
    self->_buttonAppearance = v3;

  }
  if (!self->_doneButtonAppearance)
  {
    v5 = -[UIBarButtonItemAppearance initWithStyle:]([UIBarButtonItemAppearance alloc], "initWithStyle:", 2);
    doneButtonAppearance = self->_doneButtonAppearance;
    self->_doneButtonAppearance = v5;

  }
}

- (void)_completeInit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIToolbarAppearance;
  -[UIBarAppearance _completeInit](&v3, sel__completeInit);
  -[UIBarButtonItemAppearance _setChangeObserver:](self->_buttonAppearance, "_setChangeObserver:", self);
  -[UIBarButtonItemAppearance _setChangeObserver:](self->_doneButtonAppearance, "_setChangeObserver:", self);
}

- (void)_copyFromAppearance:(id)a3
{
  id v4;
  void *v5;
  UIBarButtonItemAppearance *v6;
  UIBarButtonItemAppearance *buttonAppearance;
  void *v8;
  UIBarButtonItemAppearance *v9;
  UIBarButtonItemAppearance *doneButtonAppearance;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIToolbarAppearance;
  v4 = a3;
  -[UIBarAppearance _copyFromAppearance:](&v11, sel__copyFromAppearance_, v4);
  objc_msgSend(v4, "_plainButtonAppearance", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (UIBarButtonItemAppearance *)objc_msgSend(v5, "copy");
  buttonAppearance = self->_buttonAppearance;
  self->_buttonAppearance = v6;

  objc_msgSend(v4, "_doneButtonAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (UIBarButtonItemAppearance *)objc_msgSend(v8, "copy");
  doneButtonAppearance = self->_doneButtonAppearance;
  self->_doneButtonAppearance = v9;

}

- (id)_plainButtonAppearance
{
  return self->_buttonAppearance;
}

- (id)_doneButtonAppearance
{
  return self->_doneButtonAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButtonAppearance, 0);
  objc_storeStrong((id *)&self->_buttonAppearance, 0);
}

- (id)_plainButtonAppearanceData
{
  return -[UIBarButtonItemAppearance _data](self->_buttonAppearance, "_data");
}

- (id)_doneButtonAppearanceData
{
  return -[UIBarButtonItemAppearance _data](self->_doneButtonAppearance, "_data");
}

- (BOOL)_checkEqualTo:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  objc_super v18;

  v4 = (id *)a3;
  v18.receiver = self;
  v18.super_class = (Class)UIToolbarAppearance;
  if (!-[UIBarAppearance _checkEqualTo:](&v18, sel__checkEqualTo_, v4))
    goto LABEL_8;
  -[UIBarButtonItemAppearance _data](self->_buttonAppearance, "_data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4[6], "_data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  if (v7 == v8)
  {

    goto LABEL_10;
  }
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
    goto LABEL_16;
  v11 = objc_msgSend(v7, "isEqual:", v8);

  if ((v11 & 1) != 0)
  {
LABEL_10:
    -[UIBarButtonItemAppearance _data](self->_doneButtonAppearance, "_data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[7], "_data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    v15 = v14;
    if (v7 == v15)
    {
      v12 = 1;
      v9 = v7;
      goto LABEL_18;
    }
    v9 = v15;
    if (v7)
      v16 = v15 == 0;
    else
      v16 = 1;
    if (!v16)
    {
      v12 = objc_msgSend(v7, "isEqual:", v15);
LABEL_18:

      goto LABEL_19;
    }
LABEL_16:
    v12 = 0;
    goto LABEL_18;
  }
LABEL_8:
  v12 = 0;
LABEL_19:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIToolbarAppearance;
  v4 = a3;
  -[UIBarAppearance encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_buttonAppearance, CFSTR("PlainButtons"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_doneButtonAppearance, CFSTR("DoneButtons"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_decodeFromCoder:(id)a3
{
  id v4;
  UIBarButtonItemAppearance *v5;
  UIBarButtonItemAppearance *buttonAppearance;
  UIBarButtonItemAppearance *v7;
  UIBarButtonItemAppearance *doneButtonAppearance;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIToolbarAppearance;
  v4 = a3;
  -[UIBarAppearance _decodeFromCoder:](&v9, sel__decodeFromCoder_, v4);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PlainButtons"), v9.receiver, v9.super_class);
  v5 = (UIBarButtonItemAppearance *)objc_claimAutoreleasedReturnValue();
  buttonAppearance = self->_buttonAppearance;
  self->_buttonAppearance = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DoneButtons"));
  v7 = (UIBarButtonItemAppearance *)objc_claimAutoreleasedReturnValue();

  doneButtonAppearance = self->_doneButtonAppearance;
  self->_doneButtonAppearance = v7;

}

- (void)_describeInto:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIToolbarAppearance;
  v4 = a3;
  -[UIBarAppearance _describeInto:](&v5, sel__describeInto_, v4);
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tPlain BarButtonItems(%p):"), self->_buttonAppearance);
  -[UIBarButtonItemAppearance _describeInto:](self->_buttonAppearance, "_describeInto:", v4);
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tDone BarButtonItems(%p):"), self->_doneButtonAppearance);
  -[UIBarButtonItemAppearance _describeInto:](self->_doneButtonAppearance, "_describeInto:", v4);

}

- (unint64_t)_hashInto:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIToolbarAppearance;
  v4 = 3 * -[UIBarAppearance _hashInto:](&v10, sel__hashInto_, a3);
  -[UIBarButtonItemAppearance _data](self->_buttonAppearance, "_data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + v4;

  -[UIBarButtonItemAppearance _data](self->_doneButtonAppearance, "_data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") + 3 * v6;

  return v8;
}

- (void)setButtonAppearance:(UIBarButtonItemAppearance *)buttonAppearance
{
  UIBarButtonItemAppearance *v5;
  UIBarButtonItemAppearance *v6;
  UIBarButtonItemAppearance *v7;
  BOOL v8;
  UIBarButtonItemAppearance *v9;
  UIBarButtonItemAppearance *v10;
  void *v11;
  UIBarButtonItemAppearance *v12;

  v5 = buttonAppearance;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIToolbarAppearance.m"), 114, CFSTR("use -[UIBarButtonItemAppearance setupDefaultAppearanceForStyle:] to reset appearance values"));

  }
  v6 = self->_buttonAppearance;
  v7 = v5;
  v12 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[UIBarButtonItemAppearance isEqual:](v6, "isEqual:", v7);

      if (v8)
        goto LABEL_11;
    }
    else
    {

    }
    -[UIBarButtonItemAppearance _setChangeObserver:](self->_buttonAppearance, "_setChangeObserver:", 0);
    v9 = -[UIBarButtonItemAppearance copy](v12, "copy");
    v10 = self->_buttonAppearance;
    self->_buttonAppearance = v9;

    -[UIBarButtonItemAppearance _setChangeObserver:](self->_buttonAppearance, "_setChangeObserver:", self);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 8);
  }
LABEL_11:

}

- (void)setDoneButtonAppearance:(UIBarButtonItemAppearance *)doneButtonAppearance
{
  UIBarButtonItemAppearance *v5;
  UIBarButtonItemAppearance *v6;
  UIBarButtonItemAppearance *v7;
  BOOL v8;
  UIBarButtonItemAppearance *v9;
  UIBarButtonItemAppearance *v10;
  void *v11;
  UIBarButtonItemAppearance *v12;

  v5 = doneButtonAppearance;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIToolbarAppearance.m"), 125, CFSTR("use -[UIBarButtonItemAppearance setupDefaultAppearanceForStyle:] to reset appearance values"));

  }
  v6 = self->_doneButtonAppearance;
  v7 = v5;
  v12 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[UIBarButtonItemAppearance isEqual:](v6, "isEqual:", v7);

      if (v8)
        goto LABEL_11;
    }
    else
    {

    }
    -[UIBarButtonItemAppearance _setChangeObserver:](self->_doneButtonAppearance, "_setChangeObserver:", 0);
    v9 = -[UIBarButtonItemAppearance copy](v12, "copy");
    v10 = self->_doneButtonAppearance;
    self->_doneButtonAppearance = v9;

    -[UIBarButtonItemAppearance _setChangeObserver:](self->_doneButtonAppearance, "_setChangeObserver:", self);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 16);
  }
LABEL_11:

}

- (void)_barButtonItemDataChanged:(id)a3
{
  UIBarButtonItemAppearance *v4;
  UIBarButtonItemAppearance *v5;
  unint64_t v6;
  NSObject *v7;
  UIToolbarAppearance *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  UIBarButtonItemAppearance *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (UIBarButtonItemAppearance *)a3;
  v5 = v4;
  if (self->_buttonAppearance == v4)
  {
    v8 = self;
    v9 = 8;
LABEL_10:
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)v8, v9);
    goto LABEL_11;
  }
  if (self->_doneButtonAppearance == v4)
  {
    v8 = self;
    v9 = 16;
    goto LABEL_10;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Signal from unknown apperance object %@", (uint8_t *)&v11, 0xCu);
    }

  }
  else
  {
    v6 = _barButtonItemDataChanged____s_category;
    if (!_barButtonItemDataChanged____s_category)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&_barButtonItemDataChanged____s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Signal from unknown apperance object %@", (uint8_t *)&v11, 0xCu);
    }
  }
LABEL_11:

}

- (UIBarButtonItemAppearance)buttonAppearance
{
  return self->_buttonAppearance;
}

- (UIBarButtonItemAppearance)doneButtonAppearance
{
  return self->_doneButtonAppearance;
}

@end
