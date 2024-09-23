@implementation PSTextFieldSpecifier

+ (id)preferenceSpecifierNamed:(id)a3 target:(id)a4 set:(SEL)a5 get:(SEL)a6 detail:(Class)a7 cell:(int64_t)a8 edit:(Class)a9
{
  id v14;
  id v15;
  PSTextFieldSpecifier *v16;

  v14 = a4;
  v15 = a3;
  v16 = objc_alloc_init(PSTextFieldSpecifier);
  -[PSSpecifier setName:](v16, "setName:", v15);

  objc_storeWeak(&v16->super.target, v14);
  v16->super.getter = a6;
  v16->super.setter = a5;
  v16->super.detailControllerClass = a7;
  v16->super.cellType = a8;
  v16->super.editPaneClass = a9;
  return v16;
}

+ (id)specifierWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___PSTextFieldSpecifier;
  objc_msgSendSuper2(&v8, sel_specifierWithSpecifier_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "placeholder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlaceholder:", v6);

  }
  return v5;
}

- (void)setPlaceholder:(id)a3
{
  objc_storeStrong((id *)&self->_placeholder, a3);
}

- (id)placeholder
{
  return self->_placeholder;
}

- (BOOL)isEqualToSpecifier:(id)a3
{
  id v4;
  __CFString *placeholder;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSTextFieldSpecifier;
  if (-[PSSpecifier isEqualToSpecifier:](&v9, sel_isEqualToSpecifier_, v4))
  {
    if (self->_placeholder)
      placeholder = (__CFString *)self->_placeholder;
    else
      placeholder = &stru_1E4A69238;
    objc_msgSend(v4, "placeholder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[__CFString isEqualToString:](placeholder, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholder, 0);
}

@end
