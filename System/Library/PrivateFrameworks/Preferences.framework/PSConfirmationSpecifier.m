@implementation PSConfirmationSpecifier

+ (id)preferenceSpecifierNamed:(id)a3 target:(id)a4 set:(SEL)a5 get:(SEL)a6 detail:(Class)a7 cell:(int64_t)a8 edit:(Class)a9
{
  id v14;
  id v15;
  PSConfirmationSpecifier *v16;

  v14 = a4;
  v15 = a3;
  v16 = objc_alloc_init(PSConfirmationSpecifier);
  -[PSSpecifier setName:](v16, "setName:", v15);

  objc_storeWeak(&v16->super.target, v14);
  v16->super.getter = a6;
  v16->super.setter = a5;
  v16->super.detailControllerClass = a7;
  v16->super.cellType = a8;
  v16->super.editPaneClass = a9;
  return v16;
}

- (void)setupWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSConfirmationSpecifier setTitle:](self, "setTitle:", v5);

  objc_msgSend(v4, "objectForKey:", CFSTR("prompt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSConfirmationSpecifier setPrompt:](self, "setPrompt:", v6);

  objc_msgSend(v4, "objectForKey:", CFSTR("okTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSConfirmationSpecifier setOkButton:](self, "setOkButton:", v7);

  objc_msgSend(v4, "objectForKey:", CFSTR("altTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSConfirmationSpecifier setAlternateButton:](self, "setAlternateButton:", v8);

  objc_msgSend(v4, "objectForKey:", CFSTR("cancelTitle"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PSConfirmationSpecifier setCancelButton:](self, "setCancelButton:", v9);
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setPrompt:(id)a3
{
  objc_storeStrong((id *)&self->_prompt, a3);
}

- (void)setOkButton:(id)a3
{
  objc_storeStrong((id *)&self->_okButton, a3);
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (void)setAlternateButton:(id)a3
{
  objc_storeStrong((id *)&self->_alternateButton, a3);
}

+ (id)specifierWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___PSConfirmationSpecifier;
  objc_msgSendSuper2(&v13, sel_specifierWithSpecifier_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v7);

    objc_msgSend(v6, "prompt");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPrompt:", v8);

    objc_msgSend(v6, "okButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOkButton:", v9);

    objc_msgSend(v6, "alternateButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlternateButton:", v10);

    objc_msgSend(v6, "cancelButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setCancelButton:", v11);
  }

  return v5;
}

- (BOOL)isDestructive
{
  void *v2;
  char v3;

  -[PSSpecifier propertyForKey:](self, "propertyForKey:", CFSTR("isDestructive"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isAlternateDestructive
{
  void *v2;
  char v3;

  -[PSSpecifier propertyForKey:](self, "propertyForKey:", CFSTR("isAlternateDestructive"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isEqualToSpecifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  __CFString *title;
  void *v8;
  __CFString *prompt;
  void *v10;
  __CFString *okButton;
  void *v12;
  __CFString *alternateButton;
  void *v14;
  __CFString *cancelButton;
  void *v16;
  char v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PSConfirmationSpecifier;
  if (-[PSSpecifier isEqualToSpecifier:](&v19, sel_isEqualToSpecifier_, v4))
  {
    v5 = v4;
    v6 = v5;
    if (self->_title)
      title = (__CFString *)self->_title;
    else
      title = &stru_1E4A69238;
    objc_msgSend(v5, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](title, "isEqualToString:", v8))
    {
      if (self->_prompt)
        prompt = (__CFString *)self->_prompt;
      else
        prompt = &stru_1E4A69238;
      objc_msgSend(v6, "prompt");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[__CFString isEqualToString:](prompt, "isEqualToString:", v10))
      {
        if (self->_okButton)
          okButton = (__CFString *)self->_okButton;
        else
          okButton = &stru_1E4A69238;
        objc_msgSend(v6, "okButton");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[__CFString isEqualToString:](okButton, "isEqualToString:", v12))
        {
          if (self->_alternateButton)
            alternateButton = (__CFString *)self->_alternateButton;
          else
            alternateButton = &stru_1E4A69238;
          objc_msgSend(v6, "alternateButton");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[__CFString isEqualToString:](alternateButton, "isEqualToString:", v14))
          {
            if (self->_cancelButton)
              cancelButton = (__CFString *)self->_cancelButton;
            else
              cancelButton = &stru_1E4A69238;
            objc_msgSend(v6, "cancelButton");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[__CFString isEqualToString:](cancelButton, "isEqualToString:", v16);

          }
          else
          {
            v17 = 0;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (NSString)okButton
{
  return self->_okButton;
}

- (NSString)alternateButton
{
  return self->_alternateButton;
}

- (NSString)cancelButton
{
  return self->_cancelButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
