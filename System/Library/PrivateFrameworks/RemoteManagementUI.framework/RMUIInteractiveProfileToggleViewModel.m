@implementation RMUIInteractiveProfileToggleViewModel

- (void)clearModel
{
  -[RMUIInteractiveProfileToggleViewModel setTitle:](self, "setTitle:", 0);
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
  -[RMUIInteractiveProfileToggleViewModel title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[RMUIInteractiveProfileToggleViewModel toggleState](self, "toggleState"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("toggleState"));

}

- (RMUIInteractiveProfileToggleViewModel)initWithCoder:(id)a3
{
  id v4;
  RMUIInteractiveProfileToggleViewModel *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMUIInteractiveProfileToggleViewModel;
  v5 = -[RMUIInteractiveProfileToggleViewModel init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("title"));
    v7 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("toggleState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_toggleState = objc_msgSend(v9, "BOOLValue");

  }
  return v5;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)toggleState
{
  return self->_toggleState;
}

- (void)setToggleState:(BOOL)a3
{
  self->_toggleState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
