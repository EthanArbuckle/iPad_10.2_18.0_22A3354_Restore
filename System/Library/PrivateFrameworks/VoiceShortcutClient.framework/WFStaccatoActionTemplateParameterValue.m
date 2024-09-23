@implementation WFStaccatoActionTemplateParameterValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedState, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (WFStaccatoActionTemplateParameterValue)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  WFStaccatoActionTemplateParameterValue *v15;
  WFStaccatoActionTemplateParameterValue *v16;
  void *v17;
  uint64_t v19;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedSubtitle"));
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v13, CFSTR("serializedState"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  if (v4 && v5)
  {
    v17 = (void *)v19;
    v16 = self;
    if (v14)
    {
      v16 = -[WFStaccatoActionTemplateParameterValue initWithIdentifier:localizedTitle:localizedSubtitle:image:serializedState:](self, "initWithIdentifier:localizedTitle:localizedSubtitle:image:serializedState:", v4, v5, v19, v6, v14);
      v15 = v16;
    }
  }
  else
  {
    v17 = (void *)v19;
    v16 = self;
  }

  return v15;
}

- (WFStaccatoActionTemplateParameterValue)initWithIdentifier:(id)a3 localizedTitle:(id)a4 localizedSubtitle:(id)a5 image:(id)a6 serializedState:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  WFStaccatoActionTemplateParameterValue *v18;
  uint64_t v19;
  NSString *identifier;
  uint64_t v21;
  NSString *localizedTitle;
  uint64_t v23;
  NSString *localizedSubtitle;
  WFStaccatoActionTemplateParameterValue *v25;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

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
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStaccatoActionTemplateParameterValue.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localizedTitle"));

    if (v17)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStaccatoActionTemplateParameterValue.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  if (!v14)
    goto LABEL_8;
LABEL_3:
  if (v17)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStaccatoActionTemplateParameterValue.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serializedState"));

LABEL_4:
  v30.receiver = self;
  v30.super_class = (Class)WFStaccatoActionTemplateParameterValue;
  v18 = -[WFStaccatoActionTemplateParameterValue init](&v30, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v13, "copy");
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    localizedTitle = v18->_localizedTitle;
    v18->_localizedTitle = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    localizedSubtitle = v18->_localizedSubtitle;
    v18->_localizedSubtitle = (NSString *)v23;

    objc_storeStrong((id *)&v18->_image, a6);
    objc_storeStrong((id *)&v18->_serializedState, a7);
    v25 = v18;
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
  -[WFStaccatoActionTemplateParameterValue identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "combine:", v4);

  -[WFStaccatoActionTemplateParameterValue localizedTitle](self, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "combine:", v6);

  -[WFStaccatoActionTemplateParameterValue localizedSubtitle](self, "localizedSubtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "combine:", v8);

  -[WFStaccatoActionTemplateParameterValue image](self, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "combine:", v10);

  -[WFStaccatoActionTemplateParameterValue serializedState](self, "serializedState");
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
  -[WFStaccatoActionTemplateParameterValue identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[WFStaccatoActionTemplateParameterValue localizedTitle](self, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("localizedTitle"));

  -[WFStaccatoActionTemplateParameterValue localizedSubtitle](self, "localizedSubtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("localizedSubtitle"));

  -[WFStaccatoActionTemplateParameterValue image](self, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("image"));

  -[WFStaccatoActionTemplateParameterValue serializedState](self, "serializedState");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("serializedState"));

}

- (WFPropertyListObject)serializedState
{
  return self->_serializedState;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (WFImage)image
{
  return self->_image;
}

- (NSString)identifier
{
  return self->_identifier;
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
  v12.super_class = (Class)WFStaccatoActionTemplateParameterValue;
  -[WFStaccatoActionTemplateParameterValue description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoActionTemplateParameterValue identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoActionTemplateParameterValue localizedTitle](self, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoActionTemplateParameterValue localizedSubtitle](self, "localizedSubtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoActionTemplateParameterValue image](self, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoActionTemplateParameterValue serializedState](self, "serializedState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: id: %@, title: %@, subtitle: %@, image: %@, state: %@>"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqualToActionTemplateParameterValue:(id)a3
{
  WFStaccatoActionTemplateParameterValue *v4;
  WFStaccatoActionTemplateParameterValue *v5;
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

  v4 = (WFStaccatoActionTemplateParameterValue *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      -[WFStaccatoActionTemplateParameterValue identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFStaccatoActionTemplateParameterValue identifier](v5, "identifier");
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
      -[WFStaccatoActionTemplateParameterValue localizedTitle](self, "localizedTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFStaccatoActionTemplateParameterValue localizedTitle](v5, "localizedTitle");
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
      -[WFStaccatoActionTemplateParameterValue localizedSubtitle](self, "localizedSubtitle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFStaccatoActionTemplateParameterValue localizedSubtitle](v5, "localizedSubtitle");
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
      -[WFStaccatoActionTemplateParameterValue image](self, "image");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFStaccatoActionTemplateParameterValue image](v5, "image");
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
            v38 = objc_msgSend(v39, "isEqual:", v29);

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
      -[WFStaccatoActionTemplateParameterValue serializedState](self, "serializedState");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFStaccatoActionTemplateParameterValue serializedState](v5, "serializedState");
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
    && -[WFStaccatoActionTemplateParameterValue isEqualToActionTemplateParameterValue:](self, "isEqualToActionTemplateParameterValue:", v4);

  return v5;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setLocalizedSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setSerializedState:(id)a3
{
  objc_storeStrong((id *)&self->_serializedState, a3);
}

@end
