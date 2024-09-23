@implementation PKPayLaterSwitchRow

- (PKPayLaterSwitchRow)initWithTitle:(id)a3 on:(BOOL)a4 changeHandler:(id)a5
{
  id v8;
  id v9;
  PKPayLaterSwitchRow *v10;
  uint64_t v11;
  NSString *title;
  uint64_t v13;
  id changeHandler;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterSwitchRow;
  v10 = -[PKPayLaterSwitchRow init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    title = v10->_title;
    v10->_title = (NSString *)v11;

    v10->_on = a4;
    v13 = objc_msgSend(v9, "copy");
    changeHandler = v10->_changeHandler;
    v10->_changeHandler = (id)v13;

  }
  return v10;
}

- (NSCopying)identifier
{
  id v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  objc_msgSend(v3, "appendString:", self->_title);
  if (self->_on)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("on-%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  if (self->_disabled)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("disabled-%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v9);

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSCopying *)v10;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  id v4;
  id v5;
  _BOOL8 v6;
  _BOOL8 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPayLaterSwitchRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
    objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__switchValueChanged_, 4096);
    objc_msgSend(v5, "setOn:", self->_on);
    v6 = !self->_disabled && !self->_showSpinner;
    objc_msgSend(v4, "setUserInteractionEnabled:", v6);
    v7 = !self->_disabled && !self->_showSpinner;
    objc_msgSend(v5, "setEnabled:", v7);
    if (self->_showSpinner)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0DC3438]);
      objc_msgSend(v8, "startAnimating");
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v8, 1);
      v13[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v5, 1);
      v12 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v4, "setAccessories:", v10);
    objc_msgSend(v4, "defaultContentConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", self->_title);
    objc_msgSend(v4, "setContentConfiguration:", v11);

  }
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_title);
  v4 = _Block_copy(self->_changeHandler);
  objc_msgSend(v3, "safelyAddObject:", v4);

  PKCombinedHash();
  PKIntegerHash();
  PKIntegerHash();
  v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterSwitchRow *v4;
  PKPayLaterSwitchRow *v5;
  PKPayLaterSwitchRow *v6;
  NSString *title;
  NSString *v8;
  NSString *v9;
  void *v10;
  _BOOL4 v11;

  v4 = (PKPayLaterSwitchRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        title = v6->_title;
        v8 = self->_title;
        v9 = title;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          LOBYTE(v11) = 0;
          if (!v8 || !v9)
          {
LABEL_17:

LABEL_18:
            goto LABEL_19;
          }
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_18;
        }
        v8 = (NSString *)_Block_copy(self->_changeHandler);
        v10 = _Block_copy(v6->_changeHandler);
        LOBYTE(v11) = PKEqualObjects()
                   && self->_on == v6->_on
                   && self->_disabled == v6->_disabled
                   && self->_showSpinner == v6->_showSpinner;
        goto LABEL_17;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_19:

  return v11;
}

- (void)_switchValueChanged:(id)a3
{
  void *v4;
  void (**changeHandler)(void);
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "isOn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  changeHandler = (void (**)(void))self->_changeHandler;
  if (changeHandler)
  {
    v6 = v4;
    changeHandler[2]();
    v4 = v6;
  }

}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)isOn
{
  return self->_on;
}

- (void)setOn:(BOOL)a3
{
  self->_on = a3;
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void)setShowSpinner:(BOOL)a3
{
  self->_showSpinner = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_changeHandler, 0);
}

@end
