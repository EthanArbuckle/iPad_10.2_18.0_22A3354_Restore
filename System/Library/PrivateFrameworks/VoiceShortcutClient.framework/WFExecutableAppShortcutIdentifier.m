@implementation WFExecutableAppShortcutIdentifier

- (WFExecutableAppShortcutIdentifier)initWithBundleIdentifier:(id)a3 basePhraseTemplate:(id)a4 actionIdentifier:(id)a5 parameterIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFExecutableAppShortcutIdentifier *v15;
  WFExecutableAppShortcutIdentifier *v16;
  WFExecutableAppShortcutIdentifier *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)WFExecutableAppShortcutIdentifier;
  v15 = -[WFExecutableAppShortcutIdentifier init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v16->_basePhraseTemplate, a4);
    objc_storeStrong((id *)&v16->_actionIdentifier, a5);
    objc_storeStrong((id *)&v16->_parameterIdentifier, a6);
    v17 = v16;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  WFExecutableAppShortcutIdentifier *v4;
  WFExecutableAppShortcutIdentifier *v5;
  WFExecutableAppShortcutIdentifier *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v31;
  void *v32;

  v4 = (WFExecutableAppShortcutIdentifier *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_35:

      goto LABEL_36;
    }
    -[WFExecutableAppShortcutIdentifier bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFExecutableAppShortcutIdentifier bundleIdentifier](v6, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_33;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    -[WFExecutableAppShortcutIdentifier basePhraseTemplate](self, "basePhraseTemplate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFExecutableAppShortcutIdentifier basePhraseTemplate](v6, "basePhraseTemplate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
        goto LABEL_32;
      v21 = objc_msgSend(v14, "isEqualToString:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    -[WFExecutableAppShortcutIdentifier actionIdentifier](self, "actionIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFExecutableAppShortcutIdentifier actionIdentifier](v6, "actionIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v31 = v20;
    v32 = v24;
    if (v20 != v24)
    {
      LOBYTE(v12) = 0;
      if (v20)
      {
        v25 = v24;
        if (v24)
        {
          v12 = objc_msgSend(v20, "isEqualToString:", v24);

          if (!v12)
          {
            v19 = v32;
LABEL_32:

            goto LABEL_33;
          }
          goto LABEL_24;
        }
      }
      else
      {
        v25 = v24;
      }
LABEL_31:

      v20 = v31;
      v19 = v32;
      goto LABEL_32;
    }

LABEL_24:
    -[WFExecutableAppShortcutIdentifier parameterIdentifier](self, "parameterIdentifier", v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFExecutableAppShortcutIdentifier parameterIdentifier](v6, "parameterIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v29 = v27;
    v25 = v29;
    if (v28 == v29)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v28 && v29)
        LOBYTE(v12) = objc_msgSend(v28, "isEqual:", v29);
    }

    v20 = v28;
    goto LABEL_31;
  }
  LOBYTE(v12) = 1;
LABEL_36:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[WFExecutableAppShortcutIdentifier bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFExecutableAppShortcutIdentifier basePhraseTemplate](self, "basePhraseTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[WFExecutableAppShortcutIdentifier actionIdentifier](self, "actionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[WFExecutableAppShortcutIdentifier parameterIdentifier](self, "parameterIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (WFExecutableAppShortcutIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WFExecutableAppShortcutIdentifier *v13;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("basePhraseTemplate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("actionIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, CFSTR("parameterIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[WFExecutableAppShortcutIdentifier initWithBundleIdentifier:basePhraseTemplate:actionIdentifier:parameterIdentifier:](self, "initWithBundleIdentifier:basePhraseTemplate:actionIdentifier:parameterIdentifier:", v6, v8, v10, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFExecutableAppShortcutIdentifier bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

  -[WFExecutableAppShortcutIdentifier basePhraseTemplate](self, "basePhraseTemplate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("basePhraseTemplate"));

  -[WFExecutableAppShortcutIdentifier actionIdentifier](self, "actionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("actionIdentifier"));

  -[WFExecutableAppShortcutIdentifier parameterIdentifier](self, "parameterIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("parameterIdentifier"));

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)basePhraseTemplate
{
  return self->_basePhraseTemplate;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSUUID)parameterIdentifier
{
  return self->_parameterIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_basePhraseTemplate, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
