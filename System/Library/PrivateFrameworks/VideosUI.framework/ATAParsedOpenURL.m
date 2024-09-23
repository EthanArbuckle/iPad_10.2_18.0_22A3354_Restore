@implementation ATAParsedOpenURL

+ (id)parsedOpenURLWithURL:(id)a3 andOptions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "host");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[ATAParsedOpenURL _initWithURL:options:type:]([ATAParsedOpenURL alloc], "_initWithURL:options:type:", v5, v6, 0);
      objc_msgSend(v9, "setTabBarItemIdentifier:", v8);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (ATAParsedOpenURL)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (id)_initWithURL:(id)a3 options:(id)a4 type:(unint64_t)a5
{
  id v8;
  id v9;
  ATAParsedOpenURL *v10;
  uint64_t v11;
  NSURL *URL;
  uint64_t v13;
  NSDictionary *options;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATAParsedOpenURL;
  v10 = -[ATAParsedOpenURL init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    URL = v10->_URL;
    v10->_URL = (NSURL *)v11;

    v13 = objc_msgSend(v9, "copy");
    options = v10->_options;
    v10->_options = (NSDictionary *)v13;

    v10->_type = a5;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[ATAParsedOpenURL type](self, "type");
  -[ATAParsedOpenURL URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  -[ATAParsedOpenURL options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  -[ATAParsedOpenURL tabBarItemIdentifier](self, "tabBarItemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  ATAParsedOpenURL *v4;
  ATAParsedOpenURL *v5;
  ATAParsedOpenURL *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  char v18;
  void *v19;
  void *v20;
  id v21;

  v4 = (ATAParsedOpenURL *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        v7 = -[ATAParsedOpenURL type](self, "type");
        if (v7 != -[ATAParsedOpenURL type](v6, "type"))
        {
LABEL_17:
          v13 = 0;
LABEL_25:

          goto LABEL_26;
        }
        -[ATAParsedOpenURL URL](self, "URL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATAParsedOpenURL URL](v6, "URL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v8;
        v11 = v9;
        if (v10 == v11)
        {

        }
        else
        {
          v12 = v11;
          v13 = 0;
          if (!v10 || !v11)
            goto LABEL_24;
          v14 = objc_msgSend(v10, "isEqual:", v11);

          if ((v14 & 1) == 0)
            goto LABEL_17;
        }
        -[ATAParsedOpenURL options](self, "options");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATAParsedOpenURL options](v6, "options");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v15;
        v17 = v16;
        if (v10 == v17)
        {

LABEL_19:
          -[ATAParsedOpenURL tabBarItemIdentifier](self, "tabBarItemIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATAParsedOpenURL tabBarItemIdentifier](v6, "tabBarItemIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v19;
          v21 = v20;
          v12 = v21;
          if (v10 == v21)
          {
            v13 = 1;
          }
          else
          {
            v13 = 0;
            if (v10 && v21)
              v13 = objc_msgSend(v10, "isEqual:", v21);
          }
          goto LABEL_24;
        }
        v12 = v17;
        v13 = 0;
        if (v10 && v17)
        {
          v18 = objc_msgSend(v10, "isEqual:", v17);

          if ((v18 & 1) == 0)
            goto LABEL_17;
          goto LABEL_19;
        }
LABEL_24:

        goto LABEL_25;
      }
    }
    v13 = 0;
  }
LABEL_26:

  return v13;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21.receiver = self;
  v21.super_class = (Class)ATAParsedOpenURL;
  -[ATAParsedOpenURL description](&v21, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[ATAParsedOpenURL URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("URL"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[ATAParsedOpenURL options](self, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("options"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "_logStringForType:", -[ATAParsedOpenURL type](self, "type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("type"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[ATAParsedOpenURL tabBarItemIdentifier](self, "tabBarItemIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("tabBarItemIdentifier"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@>"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_logStringForType:(unint64_t)a3
{
  if (a3)
    return 0;
  else
    return CFSTR("ATAParsedOpenURLTypeSwitchToTabBarItem");
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)tabBarItemIdentifier
{
  return self->_tabBarItemIdentifier;
}

- (void)setTabBarItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_tabBarItemIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabBarItemIdentifier, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
