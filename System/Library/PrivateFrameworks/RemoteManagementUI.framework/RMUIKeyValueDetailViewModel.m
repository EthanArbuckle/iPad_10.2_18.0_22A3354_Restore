@implementation RMUIKeyValueDetailViewModel

- (RMUIKeyValueDetailViewModel)init
{
  RMUIKeyValueDetailViewModel *v2;
  void *v3;
  uint64_t v4;
  NSString *viewID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RMUIKeyValueDetailViewModel;
  v2 = -[RMUIKeyValueDetailViewModel init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    viewID = v2->_viewID;
    v2->_viewID = (NSString *)v4;

  }
  return v2;
}

- (RMUIKeyValueDetailViewModel)initWithTitle:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  RMUIKeyValueDetailViewModel *v9;
  RMUIKeyValueDetailViewModel *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[RMUIKeyValueDetailViewModel init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

- (void)clearModel
{
  -[RMUIKeyValueDetailViewModel setTitle:](self, "setTitle:", 0);
  -[RMUIKeyValueDetailViewModel setValue:](self, "setValue:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[RMUIKeyValueDetailViewModel viewID](self, "viewID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("viewID"));

  -[RMUIKeyValueDetailViewModel title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("title"));

  -[RMUIKeyValueDetailViewModel value](self, "value");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("value"));

}

- (RMUIKeyValueDetailViewModel)initWithCoder:(id)a3
{
  id v4;
  RMUIKeyValueDetailViewModel *v5;
  void *v6;
  uint64_t v7;
  NSString *viewID;
  void *v9;
  uint64_t v10;
  NSString *title;
  void *v12;
  uint64_t v13;
  NSString *value;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RMUIKeyValueDetailViewModel;
  v5 = -[RMUIKeyValueDetailViewModel init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("viewID"));
    v7 = objc_claimAutoreleasedReturnValue();
    viewID = v5->_viewID;
    v5->_viewID = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("value"));
    v13 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v13;

  }
  return v5;
}

- (NSString)viewID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_viewID, 0);
}

@end
