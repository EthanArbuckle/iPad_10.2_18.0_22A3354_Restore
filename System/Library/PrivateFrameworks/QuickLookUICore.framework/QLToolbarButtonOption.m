@implementation QLToolbarButtonOption

- (QLToolbarButtonOption)initWithIdentifier:(id)a3
{
  id v5;
  QLToolbarButtonOption *v6;
  QLToolbarButtonOption *v7;
  QLToolbarButtonOption *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLToolbarButtonOption;
  v6 = -[QLToolbarButtonOption init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)cancelOption
{
  QLToolbarButtonOption *v2;
  void *v3;

  v2 = -[QLToolbarButtonOption initWithIdentifier:]([QLToolbarButtonOption alloc], "initWithIdentifier:", CFSTR("QLToolbarButtonOptionCancelIdentifier"));
  QLLocalizedString(CFSTR("Cancel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLToolbarButtonOption setTitle:](v2, "setTitle:", v3);

  -[QLToolbarButtonOption setStyle:](v2, "setStyle:", 1);
  return v2;
}

- (BOOL)isCancel
{
  void *v2;
  char v3;

  -[QLToolbarButtonOption identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("QLToolbarButtonOptionCancelIdentifier"));

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  int64_t v18;

  v4 = a3;
  -[QLToolbarButtonOption identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[QLToolbarButtonOption identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_7;
  }
  -[QLToolbarButtonOption title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

    goto LABEL_9;
  }
  v13 = (void *)v12;
  -[QLToolbarButtonOption title](self, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if (v16)
  {
LABEL_9:
    v18 = -[QLToolbarButtonOption style](self, "style");
    v17 = v18 == objc_msgSend(v4, "style");
    goto LABEL_10;
  }
LABEL_7:
  v17 = 0;
LABEL_10:

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[QLToolbarButtonOption identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[QLToolbarButtonOption identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("identifier"));

  }
  -[QLToolbarButtonOption title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[QLToolbarButtonOption title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("title"));

  }
  objc_msgSend(v8, "encodeInteger:forKey:", -[QLToolbarButtonOption style](self, "style"), CFSTR("style"));

}

- (QLToolbarButtonOption)initWithCoder:(id)a3
{
  id v4;
  QLToolbarButtonOption *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *title;
  QLToolbarButtonOption *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)QLToolbarButtonOption;
  v5 = -[QLToolbarButtonOption init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
    v10 = v5;
  }

  return v5;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
