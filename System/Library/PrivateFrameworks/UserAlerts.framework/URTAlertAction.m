@implementation URTAlertAction

+ (id)actionWithTitle:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:handler:", v7, v6);

  return v8;
}

- (URTAlertAction)initWithTitle:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  URTAlertAction *v9;
  URTAlertAction *v10;
  uint64_t v11;
  id handler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)URTAlertAction;
  v9 = -[URTAlertAction init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    v11 = MEMORY[0x22073C880](v8);
    handler = v10->_handler;
    v10->_handler = (id)v11;

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (URTAlertAction)initWithCoder:(id)a3
{
  id v4;
  URTAlertAction *v5;
  uint64_t v6;
  NSString *title;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)URTAlertAction;
  v5 = -[URTAlertAction init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URTAlertActionTitleKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[URTAlertAction title](self, "title");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("URTAlertActionTitleKey"));

}

- (NSString)title
{
  return self->_title;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
