@implementation UITextFormattingViewControllerComponent

- (UITextFormattingViewControllerComponent)initWithComponentKey:(id)a3 preferredSize:(int64_t)a4
{
  id v7;
  UITextFormattingViewControllerComponent *v8;
  UITextFormattingViewControllerComponent *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UITextFormattingViewControllerComponent;
  v8 = -[UITextFormattingViewControllerComponent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_componentKey, a3);
    v9->_preferredSize = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[UITextFormattingViewControllerComponent componentKey](self, "componentKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithComponentKey:preferredSize:", v5, -[UITextFormattingViewControllerComponent preferredSize](self, "preferredSize"));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  UITextFormattingViewControllerComponent *v4;
  UITextFormattingViewControllerComponent *v5;
  void *v6;
  void *v7;
  BOOL v8;
  int64_t v9;

  v4 = (UITextFormattingViewControllerComponent *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[UITextFormattingViewControllerComponent componentKey](self, "componentKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextFormattingViewControllerComponent componentKey](v5, "componentKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v9 = -[UITextFormattingViewControllerComponent preferredSize](self, "preferredSize");
        v8 = v9 == -[UITextFormattingViewControllerComponent preferredSize](v5, "preferredSize");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[UITextFormattingViewControllerComponent componentKey](self, "componentKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[UITextFormattingViewControllerComponent preferredSize](self, "preferredSize") ^ v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UITextFormattingViewControllerComponent componentKey](self, "componentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("_ComponentKey"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[UITextFormattingViewControllerComponent preferredSize](self, "preferredSize"), CFSTR("_PreferredSize"));
}

- (UITextFormattingViewControllerComponent)initWithCoder:(id)a3
{
  id v4;
  UITextFormattingViewControllerComponent *v5;
  uint64_t v6;
  NSString *componentKey;

  v4 = a3;
  v5 = -[UITextFormattingViewControllerComponent init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_ComponentKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    componentKey = v5->_componentKey;
    v5->_componentKey = (NSString *)v6;

    v5->_preferredSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_PreferredSize"));
  }

  return v5;
}

- (NSString)componentKey
{
  return self->_componentKey;
}

- (int64_t)preferredSize
{
  return self->_preferredSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentKey, 0);
}

@end
