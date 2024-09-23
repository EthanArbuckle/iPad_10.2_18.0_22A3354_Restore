@implementation SXDataTableBorderSides

- (id)borderForValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SXDataTableBorder *v7;
  void *v8;
  SXDataTableBorder *v9;
  id v10;
  SXDataTableBorder *v11;
  SXDataTableBorder *v12;
  void *v13;

  v4 = a3;
  -[SXJSONObject jsonDictionary](self, "jsonDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("all"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = [SXDataTableBorder alloc];
    -[SXJSONObject specificationVersion](self, "specificationVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v6;
  }
  else
  {
    v11 = [SXDataTableBorder alloc];
    -[SXJSONObject specificationVersion](self, "specificationVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    v10 = v4;
  }
  v12 = -[SXJSONObject initWithJSONObject:andVersion:](v9, "initWithJSONObject:andVersion:", v10, v8);

  -[SXDataTableBorderSides unitConverter](self, "unitConverter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableBorder setUnitConverter:](v12, "setUnitConverter:", v13);

  return v12;
}

- (void)setUnitConverter:(id)a3
{
  SXUnitConverter *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SXUnitConverter *unitConverter;

  v4 = (SXUnitConverter *)a3;
  -[SXDataTableBorderSides top](self, "top");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUnitConverter:", v4);

  -[SXDataTableBorderSides right](self, "right");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUnitConverter:", v4);

  -[SXDataTableBorderSides bottom](self, "bottom");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUnitConverter:", v4);

  -[SXDataTableBorderSides left](self, "left");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUnitConverter:", v4);

  unitConverter = self->_unitConverter;
  self->_unitConverter = v4;

}

- (SXUnitConverter)unitConverter
{
  return self->_unitConverter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitConverter, 0);
}

@end
