@implementation UITextFormattingViewControllerComponentGroup

- (UITextFormattingViewControllerComponentGroup)initWithComponents:(id)a3
{
  id v5;
  UITextFormattingViewControllerComponentGroup *v6;
  id v7;
  uint64_t v8;
  NSString *identifier;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UITextFormattingViewControllerComponentGroup;
  v6 = -[UITextFormattingViewControllerComponentGroup init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v7, "UUIDString");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    objc_storeStrong((id *)&v6->_components, a3);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[UITextFormattingViewControllerComponentGroup components](self, "components");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  -[UITextFormattingViewControllerComponentGroup identifier](self, "identifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v4[2];
  v4[2] = v8;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  UITextFormattingViewControllerComponentGroup *v4;
  UITextFormattingViewControllerComponentGroup *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (UITextFormattingViewControllerComponentGroup *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[UITextFormattingViewControllerComponentGroup identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextFormattingViewControllerComponentGroup identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[UITextFormattingViewControllerComponentGroup components](self, "components");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextFormattingViewControllerComponentGroup components](v5, "components");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToArray:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[UITextFormattingViewControllerComponentGroup identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[UITextFormattingViewControllerComponentGroup components](self, "components");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UITextFormattingViewControllerComponentGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_Identifier"));

  -[UITextFormattingViewControllerComponentGroup components](self, "components");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_Components"));

}

- (UITextFormattingViewControllerComponentGroup)initWithCoder:(id)a3
{
  id v4;
  UITextFormattingViewControllerComponentGroup *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSArray *components;

  v4 = a3;
  v5 = -[UITextFormattingViewControllerComponentGroup init](self, "init");
  if (v5)
  {
    _UITextFormattingViewControllerComponentGroupClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_Identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    _UITextFormattingViewControllerComponentGroupClasses();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("_Components"));
    v10 = objc_claimAutoreleasedReturnValue();
    components = v5->_components;
    v5->_components = (NSArray *)v10;

  }
  return v5;
}

- (NSArray)components
{
  return self->_components;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

@end
