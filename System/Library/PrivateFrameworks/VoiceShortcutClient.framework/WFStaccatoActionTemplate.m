@implementation WFStaccatoActionTemplate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (WFStaccatoActionTemplate)initWithCoder:(id)a3
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
  void *v13;
  WFStaccatoActionTemplate *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sectionIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDescription"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("parameters"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  if (v5 && v6 && v7 && v8 && v13)
  {
    self = -[WFStaccatoActionTemplate initWithIdentifier:sectionIdentifier:actionIdentifier:localizedTitle:localizedDescription:parameters:](self, "initWithIdentifier:sectionIdentifier:actionIdentifier:localizedTitle:localizedDescription:parameters:", v5, v6, v7, v8, v9, v13);
    v14 = self;
  }

  return v14;
}

- (WFStaccatoActionTemplate)initWithIdentifier:(id)a3 sectionIdentifier:(id)a4 actionIdentifier:(id)a5 localizedTitle:(id)a6 localizedDescription:(id)a7 parameters:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  WFStaccatoActionTemplate *v21;
  uint64_t v22;
  NSString *identifier;
  uint64_t v24;
  NSString *sectionIdentifier;
  uint64_t v26;
  NSString *actionIdentifier;
  uint64_t v28;
  NSString *localizedTitle;
  uint64_t v30;
  NSString *localizedDescription;
  WFStaccatoActionTemplate *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStaccatoActionTemplate.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v16)
    {
LABEL_3:
      if (v17)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStaccatoActionTemplate.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

  if (v17)
  {
LABEL_4:
    if (v18)
      goto LABEL_5;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStaccatoActionTemplate.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localizedTitle"));

    if (v20)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStaccatoActionTemplate.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionIdentifier"));

  if (!v18)
    goto LABEL_12;
LABEL_5:
  if (v20)
    goto LABEL_6;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStaccatoActionTemplate.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameters"));

LABEL_6:
  v39.receiver = self;
  v39.super_class = (Class)WFStaccatoActionTemplate;
  v21 = -[WFStaccatoActionTemplate init](&v39, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    sectionIdentifier = v21->_sectionIdentifier;
    v21->_sectionIdentifier = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    actionIdentifier = v21->_actionIdentifier;
    v21->_actionIdentifier = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    localizedTitle = v21->_localizedTitle;
    v21->_localizedTitle = (NSString *)v28;

    v30 = objc_msgSend(v19, "copy");
    localizedDescription = v21->_localizedDescription;
    v21->_localizedDescription = (NSString *)v30;

    objc_storeStrong((id *)&v21->_parameters, a8);
    v32 = v21;
  }

  return v21;
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
  -[WFStaccatoActionTemplate identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "combine:", v4);

  -[WFStaccatoActionTemplate sectionIdentifier](self, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "combine:", v6);

  -[WFStaccatoActionTemplate actionIdentifier](self, "actionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "combine:", v8);

  -[WFStaccatoActionTemplate localizedTitle](self, "localizedTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "combine:", v10);

  -[WFStaccatoActionTemplate parameters](self, "parameters");
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
  void *v9;
  id v10;

  v4 = a3;
  -[WFStaccatoActionTemplate identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[WFStaccatoActionTemplate sectionIdentifier](self, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sectionIdentifier"));

  -[WFStaccatoActionTemplate actionIdentifier](self, "actionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("actionIdentifier"));

  -[WFStaccatoActionTemplate localizedTitle](self, "localizedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("localizedTitle"));

  -[WFStaccatoActionTemplate localizedDescription](self, "localizedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("localizedDescription"));

  -[WFStaccatoActionTemplate parameters](self, "parameters");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("parameters"));

}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[WFStaccatoActionTemplate isEqualToActionTemplate:](self, "isEqualToActionTemplate:", v4);

  return v5;
}

- (BOOL)isEqualToActionTemplate:(id)a3
{
  WFStaccatoActionTemplate *v4;
  WFStaccatoActionTemplate *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
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
  id v25;
  int v26;
  void *v27;
  void *v28;
  id v29;
  void *v31;

  v4 = (WFStaccatoActionTemplate *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    if (v4)
    {
      -[WFStaccatoActionTemplate identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFStaccatoActionTemplate identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {

      }
      else
      {
        v11 = 0;
        v12 = v9;
        v13 = v8;
        if (!v8 || !v9)
          goto LABEL_33;
        v14 = objc_msgSend(v8, "isEqualToString:", v9);

        if (!v14)
        {
          v11 = 0;
LABEL_34:

          goto LABEL_35;
        }
      }
      -[WFStaccatoActionTemplate sectionIdentifier](self, "sectionIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFStaccatoActionTemplate sectionIdentifier](v5, "sectionIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v15;
      v17 = v16;
      v12 = v17;
      if (v13 == v17)
      {

      }
      else
      {
        v11 = 0;
        v18 = v17;
        v19 = v13;
        if (!v13 || !v17)
          goto LABEL_32;
        v20 = objc_msgSend(v13, "isEqualToString:", v17);

        if (!v20)
        {
          v11 = 0;
LABEL_33:

          goto LABEL_34;
        }
      }
      -[WFStaccatoActionTemplate localizedTitle](self, "localizedTitle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFStaccatoActionTemplate localizedTitle](v5, "localizedTitle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v21;
      v23 = v22;
      v31 = v23;
      if (v19 != v23)
      {
        v11 = 0;
        if (v19)
        {
          v24 = v23;
          v25 = v19;
          if (v23)
          {
            v26 = objc_msgSend(v19, "isEqualToString:", v23);

            if (!v26)
            {
              v11 = 0;
LABEL_31:
              v18 = v31;
LABEL_32:

              goto LABEL_33;
            }
            goto LABEL_23;
          }
        }
        else
        {
          v24 = v23;
          v25 = 0;
        }
LABEL_30:

        goto LABEL_31;
      }

LABEL_23:
      -[WFStaccatoActionTemplate parameters](self, "parameters");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFStaccatoActionTemplate parameters](v5, "parameters");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v27;
      v29 = v28;
      v24 = v29;
      if (v25 == v29)
      {
        v11 = 1;
      }
      else
      {
        v11 = 0;
        if (v25 && v29)
          v11 = objc_msgSend(v25, "isEqualToArray:", v29);
      }

      goto LABEL_30;
    }
    v11 = 0;
  }
LABEL_35:

  return v11;
}

- (id)tintColor
{
  void *v2;
  void *v3;

  -[WFStaccatoActionTemplate sectionIdentifier](self, "sectionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFStaccatoTintColorForSectionIdentifier(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  v12.super_class = (Class)WFStaccatoActionTemplate;
  -[WFStaccatoActionTemplate description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoActionTemplate identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoActionTemplate sectionIdentifier](self, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoActionTemplate actionIdentifier](self, "actionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoActionTemplate localizedTitle](self, "localizedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoActionTemplate parameters](self, "parameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: id: %@ section: %@, action: %@ title: %@, parameters: %@>"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (void)setActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

@end
