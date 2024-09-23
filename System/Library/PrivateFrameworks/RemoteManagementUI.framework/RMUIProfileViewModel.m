@implementation RMUIProfileViewModel

- (RMUIProfileViewModel)init
{
  RMUIProfileViewModel *v2;
  uint64_t v3;
  RMUIInteractiveProfileToggleViewModel *toggleViewModel;
  uint64_t v5;
  RMUIInteractiveProfileFooterViewModel *footerViewModel;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RMUIProfileViewModel;
  v2 = -[RMUIProfileViewModel init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    toggleViewModel = v2->_toggleViewModel;
    v2->_toggleViewModel = (RMUIInteractiveProfileToggleViewModel *)v3;

    v5 = objc_opt_new();
    footerViewModel = v2->_footerViewModel;
    v2->_footerViewModel = (RMUIInteractiveProfileFooterViewModel *)v5;

  }
  return v2;
}

- (void)setInteractiveProfileActive:(BOOL)a3 profileIdentifier:(id)a4
{
  _BOOL8 v4;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[RMUIProfileViewModel setProfileIdentifier:](self, "setProfileIdentifier:", a4);
  if (v4)
    v6 = CFSTR("RMUI_PROFILE_ON");
  else
    v6 = CFSTR("RMUI_PROFILE_OFF");
  +[RMUILocalizable string:](RMUILocalizable, "string:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMUIProfileViewModel setValue:](self, "setValue:", v7);

  -[RMUIProfileViewModel toggleViewModel](self, "toggleViewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setToggleState:", v4);

  if (v4)
  {
    +[RMUILocalizable string:](RMUILocalizable, "string:", CFSTR("RMUI_PROFILE_DETAILS"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RMUIProfileViewModel setInteractiveDetailsText:](self, "setInteractiveDetailsText:", v9);

    -[RMUIProfileViewModel footerViewModel](self, "footerViewModel");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", 0);

  }
  else
  {
    +[RMUILocalizable string:](RMUILocalizable, "string:", CFSTR("RMUI_PROFILE_INSTALL_MESSAGE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RMUIProfileViewModel footerViewModel](self, "footerViewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v10);

    -[RMUIProfileViewModel setInteractiveDetailsText:](self, "setInteractiveDetailsText:", 0);
  }
}

- (void)clearModel
{
  -[RMUIProfileViewModel setTitle:](self, "setTitle:", 0);
  -[RMUIProfileViewModel setSymbol:](self, "setSymbol:", 0);
  -[RMUIProfileViewModel setValue:](self, "setValue:", 0);
  -[RMUIProfileViewModel setProfileIdentifier:](self, "setProfileIdentifier:", 0);
  -[RMUIProfileViewModel setDeclaration:](self, "setDeclaration:", 0);
  -[RMUIProfileViewModel setIsInteractiveProfile:](self, "setIsInteractiveProfile:", 0);
}

- (BOOL)isInteractiveProfile
{
  return self->_isInteractiveProfile;
}

- (void)setIsInteractiveProfile:(BOOL)a3
{
  void *v4;
  id v5;

  self->_isInteractiveProfile = a3;
  if (!a3)
  {
    -[RMUIProfileViewModel setInteractiveDetailsText:](self, "setInteractiveDetailsText:", 0);
    -[RMUIProfileViewModel toggleViewModel](self, "toggleViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearModel");

    -[RMUIProfileViewModel footerViewModel](self, "footerViewModel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clearModel");

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithShort:", -[RMUIProfileViewModel symbol](self, "symbol"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("symbol"));

  -[RMUIProfileViewModel title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("title"));

  -[RMUIProfileViewModel value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("value"));

  -[RMUIProfileViewModel profileIdentifier](self, "profileIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("profileIdentifier"));

  -[RMUIProfileViewModel declaration](self, "declaration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("declaration"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[RMUIProfileViewModel isInteractiveProfile](self, "isInteractiveProfile"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("isInteractiveProfile"));

  -[RMUIProfileViewModel interactiveDetailsText](self, "interactiveDetailsText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("interactiveDetailsText"));

  -[RMUIProfileViewModel toggleViewModel](self, "toggleViewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("toggleViewModel"));

  -[RMUIProfileViewModel footerViewModel](self, "footerViewModel");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("footerViewModel"));

}

- (RMUIProfileViewModel)initWithCoder:(id)a3
{
  id v4;
  RMUIProfileViewModel *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *title;
  void *v10;
  uint64_t v11;
  NSString *value;
  void *v13;
  uint64_t v14;
  NSString *profileIdentifier;
  void *v16;
  uint64_t v17;
  RMModelDeclarationBase *declaration;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *interactiveDetailsText;
  void *v23;
  uint64_t v24;
  RMUIInteractiveProfileToggleViewModel *toggleViewModel;
  void *v26;
  uint64_t v27;
  RMUIInteractiveProfileFooterViewModel *footerViewModel;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)RMUIProfileViewModel;
  v5 = -[RMUIProfileViewModel init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbol"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_symbol = objc_msgSend(v6, "integerValue");

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("value"));
    v11 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v11;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("profileIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    profileIdentifier = v5->_profileIdentifier;
    v5->_profileIdentifier = (NSString *)v14;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("declaration"));
    v17 = objc_claimAutoreleasedReturnValue();
    declaration = v5->_declaration;
    v5->_declaration = (RMModelDeclarationBase *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isInteractiveProfile"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isInteractiveProfile = objc_msgSend(v19, "BOOLValue");

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("interactiveDetailsText"));
    v21 = objc_claimAutoreleasedReturnValue();
    interactiveDetailsText = v5->_interactiveDetailsText;
    v5->_interactiveDetailsText = (NSString *)v21;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("toggleViewModel"));
    v24 = objc_claimAutoreleasedReturnValue();
    toggleViewModel = v5->_toggleViewModel;
    v5->_toggleViewModel = (RMUIInteractiveProfileToggleViewModel *)v24;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("footerViewModel"));
    v27 = objc_claimAutoreleasedReturnValue();
    footerViewModel = v5->_footerViewModel;
    v5->_footerViewModel = (RMUIInteractiveProfileFooterViewModel *)v27;

  }
  return v5;
}

- (signed)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(signed __int16)a3
{
  self->_symbol = a3;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)value
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)profileIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProfileIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (RMModelDeclarationBase)declaration
{
  return (RMModelDeclarationBase *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeclaration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)interactiveDetailsText
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInteractiveDetailsText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (RMUIInteractiveProfileToggleViewModel)toggleViewModel
{
  return (RMUIInteractiveProfileToggleViewModel *)objc_getProperty(self, a2, 56, 1);
}

- (void)setToggleViewModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (RMUIInteractiveProfileFooterViewModel)footerViewModel
{
  return (RMUIInteractiveProfileFooterViewModel *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFooterViewModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerViewModel, 0);
  objc_storeStrong((id *)&self->_toggleViewModel, 0);
  objc_storeStrong((id *)&self->_interactiveDetailsText, 0);
  objc_storeStrong((id *)&self->_declaration, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
