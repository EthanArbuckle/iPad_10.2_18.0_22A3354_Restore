@implementation WFStaccatoActionTemplateParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedLabel, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (WFStaccatoActionTemplateParameter)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WFStaccatoActionTemplateParameter *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDescription"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (v5 && v6 && v7)
  {
    self = -[WFStaccatoActionTemplateParameter initWithKey:actionIdentifier:localizedLabel:localizedDescription:defaultValue:](self, "initWithKey:actionIdentifier:localizedLabel:localizedDescription:defaultValue:", v5, v6, v7, v8, v9);
    v10 = self;
  }

  return v10;
}

- (WFStaccatoActionTemplateParameter)initWithKey:(id)a3 actionIdentifier:(id)a4 localizedLabel:(id)a5 localizedDescription:(id)a6 defaultValue:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  WFStaccatoActionTemplateParameter *v18;
  uint64_t v19;
  NSString *key;
  uint64_t v21;
  NSString *actionIdentifier;
  uint64_t v23;
  NSString *localizedLabel;
  uint64_t v25;
  NSString *localizedDescription;
  WFStaccatoActionTemplateParameter *v27;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStaccatoActionTemplateParameter.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionIdentifier"));

    if (v15)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStaccatoActionTemplateParameter.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  if (!v14)
    goto LABEL_8;
LABEL_3:
  if (v15)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStaccatoActionTemplateParameter.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localizedLabel"));

LABEL_4:
  v32.receiver = self;
  v32.super_class = (Class)WFStaccatoActionTemplateParameter;
  v18 = -[WFStaccatoActionTemplateParameter init](&v32, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v13, "copy");
    key = v18->_key;
    v18->_key = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    actionIdentifier = v18->_actionIdentifier;
    v18->_actionIdentifier = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    localizedLabel = v18->_localizedLabel;
    v18->_localizedLabel = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    localizedDescription = v18->_localizedDescription;
    v18->_localizedDescription = (NSString *)v25;

    objc_storeStrong((id *)&v18->_defaultValue, a7);
    v27 = v18;
  }

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  unint64_t v14;

  v3 = (void *)objc_opt_new();
  -[WFStaccatoActionTemplateParameter key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "combine:", v4);

  -[WFStaccatoActionTemplateParameter actionIdentifier](self, "actionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "combine:", v6);

  -[WFStaccatoActionTemplateParameter localizedLabel](self, "localizedLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "combine:", v8);

  -[WFStaccatoActionTemplateParameter localizedDescription](self, "localizedDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "combine:", v10);

  -[WFStaccatoActionTemplateParameter defaultValue](self, "defaultValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "combine:", v12);

  v14 = objc_msgSend(v3, "finalize");
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[WFStaccatoActionTemplateParameter key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("key"));

  -[WFStaccatoActionTemplateParameter actionIdentifier](self, "actionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("actionIdentifier"));

  -[WFStaccatoActionTemplateParameter localizedLabel](self, "localizedLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("localizedLabel"));

  -[WFStaccatoActionTemplateParameter localizedDescription](self, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("localizedDescription"));

  -[WFStaccatoActionTemplateParameter defaultValue](self, "defaultValue");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("defaultValue"));

}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)localizedLabel
{
  return self->_localizedLabel;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (WFStaccatoActionTemplateParameterValue)defaultValue
{
  return self->_defaultValue;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)WFStaccatoActionTemplateParameter;
  -[WFStaccatoActionTemplateParameter description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoActionTemplateParameter key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoActionTemplateParameter actionIdentifier](self, "actionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoActionTemplateParameter localizedLabel](self, "localizedLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoActionTemplateParameter localizedDescription](self, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoActionTemplateParameter defaultValue](self, "defaultValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: key: %@, action: %@, label: %@, description: %@, default: %@>"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqualToActionTemplateParameter:(id)a3
{
  WFStaccatoActionTemplateParameter *v4;
  WFStaccatoActionTemplateParameter *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  int v38;
  void *v39;
  void *v40;

  v4 = (WFStaccatoActionTemplateParameter *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      -[WFStaccatoActionTemplateParameter key](self, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFStaccatoActionTemplateParameter key](v5, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {

      }
      else
      {
        LOBYTE(v11) = 0;
        v12 = v9;
        v13 = v8;
        if (!v8 || !v9)
          goto LABEL_40;
        v14 = objc_msgSend(v8, "isEqualToString:", v9);

        if (!v14)
        {
          LOBYTE(v11) = 0;
LABEL_41:

          goto LABEL_42;
        }
      }
      -[WFStaccatoActionTemplateParameter actionIdentifier](self, "actionIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFStaccatoActionTemplateParameter actionIdentifier](v5, "actionIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v15;
      v17 = v16;
      v12 = v17;
      if (v13 == v17)
      {

      }
      else
      {
        LOBYTE(v11) = 0;
        v18 = v17;
        v19 = v13;
        if (!v13 || !v17)
          goto LABEL_39;
        v20 = objc_msgSend(v13, "isEqualToString:", v17);

        if (!v20)
        {
          LOBYTE(v11) = 0;
LABEL_40:

          goto LABEL_41;
        }
      }
      -[WFStaccatoActionTemplateParameter localizedLabel](self, "localizedLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFStaccatoActionTemplateParameter localizedLabel](v5, "localizedLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v21;
      v23 = v22;
      v18 = v23;
      if (v19 == v23)
      {

      }
      else
      {
        LOBYTE(v11) = 0;
        v24 = v23;
        v25 = v19;
        if (!v19 || !v23)
          goto LABEL_38;
        v11 = objc_msgSend(v19, "isEqualToString:", v23);

        if (!v11)
          goto LABEL_39;
      }
      -[WFStaccatoActionTemplateParameter localizedDescription](self, "localizedDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFStaccatoActionTemplateParameter localizedDescription](v5, "localizedDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v26;
      v29 = v27;
      v30 = v28;
      v39 = v28;
      v40 = v29;
      if (v28 != v29)
      {
        LOBYTE(v11) = 0;
        if (v30)
        {
          v31 = v29;
          if (v29)
          {
            v25 = v39;
            v38 = objc_msgSend(v39, "isEqualToString:", v29);

            if (!v38)
            {
              LOBYTE(v11) = 0;
LABEL_37:
              v24 = v40;
LABEL_38:

LABEL_39:
              goto LABEL_40;
            }
            goto LABEL_29;
          }
        }
        else
        {
          v31 = v29;
        }
LABEL_36:

        v25 = v39;
        goto LABEL_37;
      }

LABEL_29:
      -[WFStaccatoActionTemplateParameter defaultValue](self, "defaultValue");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFStaccatoActionTemplateParameter defaultValue](v5, "defaultValue");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v32;
      v35 = v33;
      v36 = v35;
      if (v34 == v35)
      {
        LOBYTE(v11) = 1;
      }
      else
      {
        LOBYTE(v11) = 0;
        if (v34 && v35)
          LOBYTE(v11) = objc_msgSend(v34, "isEqual:", v35);
      }

      v31 = v36;
      v30 = v34;
      goto LABEL_36;
    }
    LOBYTE(v11) = 0;
  }
LABEL_42:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[WFStaccatoActionTemplateParameter isEqualToActionTemplateParameter:](self, "isEqualToActionTemplateParameter:", v4);

  return v5;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setLocalizedLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setDefaultValue:(id)a3
{
  objc_storeStrong((id *)&self->_defaultValue, a3);
}

@end
