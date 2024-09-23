@implementation PKPassShareInitiationActivationConfiguration

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("defaultOptions: '%@'; "), self->_defaultOptions);
  objc_msgSend(v6, "appendFormat:", CFSTR("availableOptions: '%@'; "), self->_availableOptions);
  if (self->_allowUserEdit)
    v7 = CFSTR("Yes");
  else
    v7 = CFSTR("No");
  objc_msgSend(v6, "appendFormat:", CFSTR("allowUserEdit: '%@'; "), v7);
  if (self->_isBlocked)
    v8 = CFSTR("Yes");
  else
    v8 = CFSTR("No");
  objc_msgSend(v6, "appendFormat:", CFSTR("isBlocked: '%@'; "), v8);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PKPassShareActivationOptions)defaultOptions
{
  return self->_defaultOptions;
}

- (void)setDefaultOptions:(id)a3
{
  objc_storeStrong((id *)&self->_defaultOptions, a3);
}

- (PKPassShareActivationOptions)availableOptions
{
  return self->_availableOptions;
}

- (void)setAvailableOptions:(id)a3
{
  objc_storeStrong((id *)&self->_availableOptions, a3);
}

- (BOOL)allowUserEdit
{
  return self->_allowUserEdit;
}

- (void)setAllowUserEdit:(BOOL)a3
{
  self->_allowUserEdit = a3;
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (void)setIsBlocked:(BOOL)a3
{
  self->_isBlocked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableOptions, 0);
  objc_storeStrong((id *)&self->_defaultOptions, 0);
}

@end
