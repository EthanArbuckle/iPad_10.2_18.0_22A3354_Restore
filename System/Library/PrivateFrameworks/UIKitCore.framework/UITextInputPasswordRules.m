@implementation UITextInputPasswordRules

- (id)initPasswordRulesWithDescriptor:(id)a3
{
  id v5;
  UITextInputPasswordRules *v6;
  UITextInputPasswordRules *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITextInputPasswordRules;
  v6 = -[UITextInputPasswordRules init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_passwordRulesDescriptor, a3);

  return v7;
}

+ (UITextInputPasswordRules)passwordRulesWithDescriptor:(NSString *)passwordRulesDescriptor
{
  NSString *v4;
  void *v5;

  v4 = passwordRulesDescriptor;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initPasswordRulesWithDescriptor:", v4);

  return (UITextInputPasswordRules *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UITextInputPasswordRules)initWithCoder:(id)a3
{
  id v4;
  UITextInputPasswordRules *v5;
  uint64_t v6;
  NSString *passwordRulesDescriptor;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITextInputPasswordRules;
  v5 = -[UITextInputPasswordRules init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passwordRulesDescriptor"));
    v6 = objc_claimAutoreleasedReturnValue();
    passwordRulesDescriptor = v5->_passwordRulesDescriptor;
    v5->_passwordRulesDescriptor = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *passwordRulesDescriptor;

  passwordRulesDescriptor = self->_passwordRulesDescriptor;
  if (passwordRulesDescriptor)
    objc_msgSend(a3, "encodeObject:forKey:", passwordRulesDescriptor, CFSTR("passwordRulesDescriptor"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;

  -[UITextInputPasswordRules passwordRulesDescriptor](self, "passwordRulesDescriptor", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextInputPasswordRules passwordRulesWithDescriptor:](UITextInputPasswordRules, "passwordRulesWithDescriptor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[UITextInputPasswordRules passwordRulesDescriptor](self, "passwordRulesDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passwordRulesDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[UITextInputPasswordRules passwordRulesDescriptor](self, "passwordRulesDescriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "passwordRulesDescriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[UITextInputPasswordRules passwordRulesDescriptor](self, "passwordRulesDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UITextInputPasswordRules passwordRulesDescriptor](self, "passwordRulesDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; passwordRulesDescriptor = %@"), v5);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSString)passwordRulesDescriptor
{
  return self->_passwordRulesDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordRulesDescriptor, 0);
}

@end
