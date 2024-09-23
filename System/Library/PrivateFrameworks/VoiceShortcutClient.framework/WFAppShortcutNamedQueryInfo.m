@implementation WFAppShortcutNamedQueryInfo

- (WFAppShortcutNamedQueryInfo)initWithName:(id)a3 symbolName:(id)a4
{
  id v6;
  id v7;
  WFAppShortcutNamedQueryInfo *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSString *symbolName;
  WFAppShortcutNamedQueryInfo *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFAppShortcutNamedQueryInfo;
  v8 = -[WFAppShortcutNamedQueryInfo init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    symbolName = v8->_symbolName;
    v8->_symbolName = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (WFAppShortcutNamedQueryInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFAppShortcutNamedQueryInfo *v9;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("symbolName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[WFAppShortcutNamedQueryInfo initWithName:symbolName:](self, "initWithName:symbolName:", v6, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFAppShortcutNamedQueryInfo name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[WFAppShortcutNamedQueryInfo symbolName](self, "symbolName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("symbolName"));

}

- (BOOL)isEqual:(id)a3
{
  WFAppShortcutNamedQueryInfo *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v4 = (WFAppShortcutNamedQueryInfo *)a3;
  if (v4 != self)
  {
    -[WFAppShortcutNamedQueryInfo name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppShortcutNamedQueryInfo name](v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {

    }
    else
    {
      LOBYTE(v10) = 0;
      v11 = v8;
      v12 = v7;
      if (!v7 || !v8)
      {
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
      v10 = objc_msgSend(v7, "isEqualToString:", v8);

      if (!v10)
        goto LABEL_16;
    }
    -[WFAppShortcutNamedQueryInfo symbolName](self, "symbolName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppShortcutNamedQueryInfo symbolName](v4, "symbolName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;
    v15 = v14;
    v11 = v15;
    if (v12 == v15)
    {
      LOBYTE(v10) = 1;
    }
    else
    {
      LOBYTE(v10) = 0;
      if (v12 && v15)
        LOBYTE(v10) = objc_msgSend(v12, "isEqualToString:", v15);
    }

    goto LABEL_15;
  }
  LOBYTE(v10) = 1;
LABEL_17:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[WFAppShortcutNamedQueryInfo name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFAppShortcutNamedQueryInfo symbolName](self, "symbolName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
