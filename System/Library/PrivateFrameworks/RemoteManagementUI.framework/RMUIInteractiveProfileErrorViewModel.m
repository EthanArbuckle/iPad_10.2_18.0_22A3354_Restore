@implementation RMUIInteractiveProfileErrorViewModel

- (RMUIInteractiveProfileErrorViewModel)initWithError:(id)a3 isActivating:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  RMUIInteractiveProfileErrorViewModel *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a4;
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RMUIInteractiveProfileErrorViewModel;
  v7 = -[RMUIInteractiveProfileErrorViewModel init](&v13, sel_init);
  if (v7)
  {
    if (v4)
      v8 = CFSTR("RMUI_PROFILE_ACTIVATE_ERROR_TITLE");
    else
      v8 = CFSTR("RMUI_PROFILE_DEACTIVATE_ERROR_TITLE");
    +[RMUILocalizable string:](RMUILocalizable, "string:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RMUIInteractiveProfileErrorViewModel setTitle:](v7, "setTitle:", v9);

    objc_msgSend(v6, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RMUIInteractiveProfileErrorViewModel setMessage:](v7, "setMessage:", v10);

    +[RMUILocalizable string:](RMUILocalizable, "string:", CFSTR("RMUI_PROFILE_ERROR_OK"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RMUIInteractiveProfileErrorViewModel setOkText:](v7, "setOkText:", v11);

    -[RMUIInteractiveProfileErrorViewModel setError:](v7, "setError:", v6);
  }

  return v7;
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
  void *v7;
  id v8;

  v4 = a3;
  -[RMUIInteractiveProfileErrorViewModel title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[RMUIInteractiveProfileErrorViewModel message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("message"));

  -[RMUIInteractiveProfileErrorViewModel okText](self, "okText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("okText"));

  -[RMUIInteractiveProfileErrorViewModel error](self, "error");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("error"));

}

- (RMUIInteractiveProfileErrorViewModel)initWithCoder:(id)a3
{
  id v4;
  RMUIInteractiveProfileErrorViewModel *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  uint64_t v10;
  NSString *message;
  void *v12;
  uint64_t v13;
  NSString *okText;
  void *v15;
  uint64_t v16;
  NSError *error;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)RMUIInteractiveProfileErrorViewModel;
  v5 = -[RMUIInteractiveProfileErrorViewModel init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("title"));
    v7 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("message"));
    v10 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v10;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("okText"));
    v13 = objc_claimAutoreleasedReturnValue();
    okText = v5->_okText;
    v5->_okText = (NSString *)v13;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("error"));
    v16 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v16;

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

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)okText
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOkText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_okText, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
