@implementation WFStaccatoActionTemplateParameterValueSection

- (WFStaccatoActionTemplateParameterValueSection)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WFStaccatoActionTemplateParameterValueSection *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("values"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    self = -[WFStaccatoActionTemplateParameterValueSection initWithTitle:subtitle:image:values:](self, "initWithTitle:subtitle:image:values:", v5, v6, v7, v11);
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WFStaccatoActionTemplateParameterValueSection)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 values:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFStaccatoActionTemplateParameterValueSection *v15;
  uint64_t v16;
  NSString *title;
  uint64_t v18;
  NSString *subtitle;
  uint64_t v20;
  NSArray *values;
  WFStaccatoActionTemplateParameterValueSection *v22;
  void *v24;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStaccatoActionTemplateParameterValueSection.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("values"));

  }
  v25.receiver = self;
  v25.super_class = (Class)WFStaccatoActionTemplateParameterValueSection;
  v15 = -[WFStaccatoActionTemplateParameterValueSection init](&v25, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    title = v15->_title;
    v15->_title = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    subtitle = v15->_subtitle;
    v15->_subtitle = (NSString *)v18;

    objc_storeStrong((id *)&v15->_image, a5);
    v20 = objc_msgSend(v14, "copy");
    values = v15->_values;
    v15->_values = (NSArray *)v20;

    v22 = v15;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFStaccatoActionTemplateParameterValueSection title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[WFStaccatoActionTemplateParameterValueSection subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("subtitle"));

  -[WFStaccatoActionTemplateParameterValueSection image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("image"));

  -[WFStaccatoActionTemplateParameterValueSection values](self, "values");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("values"));

}

- (NSArray)values
{
  return self->_values;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (WFImage)image
{
  return self->_image;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)WFStaccatoActionTemplateParameterValueSection;
  -[WFStaccatoActionTemplateParameterValueSection description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoActionTemplateParameterValueSection title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoActionTemplateParameterValueSection values](self, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@ [%lu values]>"), v4, v5, objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqualToActionTemplateParameterValueSection:(id)a3
{
  WFStaccatoActionTemplateParameterValueSection *v4;
  WFStaccatoActionTemplateParameterValueSection *v5;
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

  v4 = (WFStaccatoActionTemplateParameterValueSection *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    if (v4)
    {
      -[WFStaccatoActionTemplateParameterValueSection title](self, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFStaccatoActionTemplateParameterValueSection title](v5, "title");
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
      -[WFStaccatoActionTemplateParameterValueSection subtitle](self, "subtitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFStaccatoActionTemplateParameterValueSection subtitle](v5, "subtitle");
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
      -[WFStaccatoActionTemplateParameterValueSection image](self, "image");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFStaccatoActionTemplateParameterValueSection image](v5, "image");
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
            v26 = objc_msgSend(v19, "isEqual:", v23);

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
      -[WFStaccatoActionTemplateParameterValueSection values](self, "values");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFStaccatoActionTemplateParameterValueSection values](v5, "values");
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

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[WFStaccatoActionTemplateParameterValueSection isEqualToActionTemplateParameterValueSection:](self, "isEqualToActionTemplateParameterValueSection:", v4);

  return v5;
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
  -[WFStaccatoActionTemplateParameterValueSection title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "combine:", v4);

  -[WFStaccatoActionTemplateParameterValueSection subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "combine:", v6);

  -[WFStaccatoActionTemplateParameterValueSection image](self, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "combine:", v8);

  -[WFStaccatoActionTemplateParameterValueSection values](self, "values");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "combine:", v10);

  v12 = objc_msgSend(v3, "finalize");
  return v12;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void)setValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
