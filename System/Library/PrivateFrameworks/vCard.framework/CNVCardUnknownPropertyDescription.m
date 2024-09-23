@implementation CNVCardUnknownPropertyDescription

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CNVCardUnknownPropertyDescription propertyName](self, "propertyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardUnknownPropertyDescription originalLine](self, "originalLine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@='%@'>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  char v17;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v6 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    -[CNVCardUnknownPropertyDescription propertyName](self, "propertyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 || (objc_msgSend(v8, "propertyName"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CNVCardUnknownPropertyDescription propertyName](self, "propertyName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "propertyName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (v9)
      {

        if (v12)
          goto LABEL_9;
      }
      else
      {

        if ((v12 & 1) != 0)
          goto LABEL_9;
      }
      v17 = 0;
LABEL_19:

      goto LABEL_20;
    }
LABEL_9:
    -[CNVCardUnknownPropertyDescription originalLine](self, "originalLine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || (objc_msgSend(v8, "originalLine"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CNVCardUnknownPropertyDescription originalLine](self, "originalLine");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "originalLine");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15) ^ 1;

      if (v13)
      {
LABEL_18:

        v17 = v16 ^ 1;
        goto LABEL_19;
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }

    goto LABEL_18;
  }
  v17 = 0;
LABEL_20:

  return v17;
}

- (NSString)propertyName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPropertyName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)originalLine
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOriginalLine:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalLine, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
}

@end
