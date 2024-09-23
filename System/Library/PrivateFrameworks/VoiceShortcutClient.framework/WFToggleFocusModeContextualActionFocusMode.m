@implementation WFToggleFocusModeContextualActionFocusMode

- (WFToggleFocusModeContextualActionFocusMode)initWithIdentifier:(id)a3 name:(id)a4 symbolName:(id)a5
{
  return -[WFToggleFocusModeContextualActionFocusMode initWithIdentifier:name:symbolName:colorName:](self, "initWithIdentifier:name:symbolName:colorName:", a3, a4, a5, 0);
}

- (WFToggleFocusModeContextualActionFocusMode)initWithIdentifier:(id)a3 name:(id)a4 symbolName:(id)a5 colorName:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFToggleFocusModeContextualActionFocusMode *v15;
  uint64_t v16;
  NSString *identifier;
  uint64_t v18;
  NSString *name;
  uint64_t v20;
  NSString *symbolName;
  uint64_t v22;
  NSString *colorName;
  WFToggleFocusModeContextualActionFocusMode *v24;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFToggleFocusModeContextualAction.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v13)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFToggleFocusModeContextualAction.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  if (!v12)
    goto LABEL_8;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFToggleFocusModeContextualAction.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("symbolName"));

LABEL_4:
  v29.receiver = self;
  v29.super_class = (Class)WFToggleFocusModeContextualActionFocusMode;
  v15 = -[WFToggleFocusModeContextualActionFocusMode init](&v29, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    name = v15->_name;
    v15->_name = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    symbolName = v15->_symbolName;
    v15->_symbolName = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    colorName = v15->_colorName;
    v15->_colorName = (NSString *)v22;

    v24 = v15;
  }

  return v15;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFToggleFocusModeContextualActionFocusMode identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFToggleFocusModeContextualActionFocusMode name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFToggleFocusModeContextualActionFocusMode symbolName](self, "symbolName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFToggleFocusModeContextualActionFocusMode colorName](self, "colorName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> Identifier: %@, Name: %@, Symbol Name: %@, Color Name: %@"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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
  unint64_t v12;

  v3 = (void *)objc_opt_new();
  -[WFToggleFocusModeContextualActionFocusMode identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v4);

  -[WFToggleFocusModeContextualActionFocusMode name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v6);

  -[WFToggleFocusModeContextualActionFocusMode symbolName](self, "symbolName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v8);

  -[WFToggleFocusModeContextualActionFocusMode colorName](self, "colorName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v10);

  v12 = objc_msgSend(v3, "finalize");
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  WFToggleFocusModeContextualActionFocusMode *v4;
  WFToggleFocusModeContextualActionFocusMode *v5;
  WFToggleFocusModeContextualActionFocusMode *v6;
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
  id v30;
  void *v31;

  v4 = (WFToggleFocusModeContextualActionFocusMode *)a3;
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
    -[WFToggleFocusModeContextualActionFocusMode identifier](v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFToggleFocusModeContextualActionFocusMode identifier](self, "identifier");
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
    -[WFToggleFocusModeContextualActionFocusMode name](v6, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFToggleFocusModeContextualActionFocusMode name](self, "name");
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
    -[WFToggleFocusModeContextualActionFocusMode symbolName](v6, "symbolName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFToggleFocusModeContextualActionFocusMode symbolName](self, "symbolName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v30 = v20;
    v31 = v24;
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
            v19 = v31;
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

      v20 = v30;
      v19 = v31;
      goto LABEL_32;
    }

LABEL_24:
    -[WFToggleFocusModeContextualActionFocusMode colorName](v6, "colorName", v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFToggleFocusModeContextualActionFocusMode colorName](self, "colorName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v26;
    v28 = v27;
    v25 = v28;
    if (v20 == v28)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v28)
        LOBYTE(v12) = objc_msgSend(v20, "isEqualToString:", v28);
    }

    goto LABEL_31;
  }
  LOBYTE(v12) = 1;
LABEL_36:

  return v12;
}

- (WFColor)color
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[WFToggleFocusModeContextualActionFocusMode colorName](self, "colorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFToggleFocusModeContextualActionFocusMode colorName](self, "colorName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFColor colorWithFocusColorName:](WFColor, "colorWithFocusColorName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      +[WFColor colorWithSystemColor:](WFColor, "colorWithSystemColor:", 14);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

  }
  else
  {
    +[WFColor colorWithSystemColor:](WFColor, "colorWithSystemColor:", 14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (WFColor *)v8;
}

- (WFToggleFocusModeContextualActionFocusMode)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  WFToggleFocusModeContextualActionFocusMode *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("colorName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v7 == 0)
  {
    v11 = 0;
  }
  else
  {
    self = -[WFToggleFocusModeContextualActionFocusMode initWithIdentifier:name:symbolName:colorName:](self, "initWithIdentifier:name:symbolName:colorName:", v5, v6, v7, v8);
    v11 = self;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_symbolName, CFSTR("symbolName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_colorName, CFSTR("colorName"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorName, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
