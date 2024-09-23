@implementation _UIActivityItemCustomizationGroup

- (id)_initGroupWithName:(id)a3 identifier:(id)a4 customizations:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIActivityItemCustomizationGroup *v11;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  NSArray *customizations;
  _UIActivityItemCustomizationGroup *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_UIActivityItemCustomizationGroup;
  v11 = -[_UIActivityItemCustomizationGroup init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    customizations = v11->_customizations;
    v11->_customizations = (NSArray *)v16;

    v18 = v11;
  }

  return v11;
}

- (_UIActivityItemCustomizationGroup)initWithCoder:(id)a3
{
  id v4;
  _UIActivityItemCustomizationGroup *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSArray *customizations;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIActivityItemCustomizationGroup;
  v5 = -[_UIActivityItemCustomizationGroup init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("customizations"));
    v10 = objc_claimAutoreleasedReturnValue();
    customizations = v5->_customizations;
    v5->_customizations = (NSArray *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_UIActivityItemCustomizationGroup name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[_UIActivityItemCustomizationGroup identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

  -[_UIActivityItemCustomizationGroup customizations](self, "customizations");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("customizations"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_UIActivityItemCustomizationGroup name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[_UIActivityItemCustomizationGroup identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

  -[_UIActivityItemCustomizationGroup customizations](self, "customizations");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v7, CFSTR("customizations"));

}

- (_UIActivityItemCustomizationGroup)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _UIActivityItemCustomizationGroup *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v7, objc_opt_class(), CFSTR("customizations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[_UIActivityItemCustomizationGroup _initGroupWithName:identifier:customizations:](self, "_initGroupWithName:identifier:customizations:", v5, v6, v8);
  return v9;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  _UIActivityItemCustomizationGroup *v4;
  _UIActivityItemCustomizationGroup *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;

  v4 = (_UIActivityItemCustomizationGroup *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_UIActivityItemCustomizationGroup name](v5, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIActivityItemCustomizationGroup name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {

      }
      else
      {
        if ((v8 == 0) == (v9 != 0))
        {
          v12 = 0;
          v17 = v9;
          v15 = v8;
          goto LABEL_24;
        }
        v11 = objc_msgSend(v8, "isEqual:", v9);

        if (!v11)
        {
          v12 = 0;
LABEL_25:

          goto LABEL_26;
        }
      }
      -[_UIActivityItemCustomizationGroup identifier](v5, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIActivityItemCustomizationGroup identifier](self, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13;
      v16 = v14;
      v17 = v16;
      if (v15 == v16)
      {

      }
      else
      {
        if ((v15 == 0) == (v16 != 0))
        {
          v12 = 0;
          v23 = v16;
          v21 = v15;
LABEL_23:

          goto LABEL_24;
        }
        v18 = objc_msgSend(v15, "isEqual:", v16);

        if (!v18)
        {
          v12 = 0;
LABEL_24:

          goto LABEL_25;
        }
      }
      -[_UIActivityItemCustomizationGroup customizations](v5, "customizations");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIActivityItemCustomizationGroup customizations](self, "customizations");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v19;
      v22 = v20;
      v23 = v22;
      if (v21 == v22)
      {
        v12 = 1;
      }
      else if ((v21 == 0) == (v22 != 0))
      {
        v12 = 0;
      }
      else
      {
        v12 = objc_msgSend(v21, "isEqual:", v22);
      }

      goto LABEL_23;
    }
    v12 = 0;
  }
LABEL_26:

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)customizations
{
  return self->_customizations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customizations, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
