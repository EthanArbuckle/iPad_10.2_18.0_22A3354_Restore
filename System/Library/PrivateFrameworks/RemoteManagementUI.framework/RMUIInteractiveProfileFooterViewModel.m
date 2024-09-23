@implementation RMUIInteractiveProfileFooterViewModel

- (void)clearModel
{
  -[RMUIInteractiveProfileFooterViewModel setTitle:](self, "setTitle:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RMUIInteractiveProfileFooterViewModel title](self, "title");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

}

- (RMUIInteractiveProfileFooterViewModel)initWithCoder:(id)a3
{
  id v4;
  RMUIInteractiveProfileFooterViewModel *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RMUIInteractiveProfileFooterViewModel;
  v5 = -[RMUIInteractiveProfileFooterViewModel init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("title"));
    v7 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v7;

  }
  return v5;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
