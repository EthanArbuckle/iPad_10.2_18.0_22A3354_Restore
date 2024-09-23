@implementation ICSMultiValueProperty

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  objc_super v15;

  v6 = a4;
  v7 = -[ICSProperty type](self, "type");
  if (v7 == 5010 || v7 == 5007)
  {
    -[ICSProperty parameters](self, "parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[ICSProperty _ICSStringWithOptions:appendingToString:additionalParameters:](self, "_ICSStringWithOptions:appendingToString:additionalParameters:", a3, v6, 0);
    -[ICSMultiValueProperty values](self, "values");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[ICSMultiValueProperty values](self, "values");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        -[ICSMultiValueProperty value](self, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("PropertyValue should be NSArray, got %@"), v13);

      }
    }
    objc_msgSend(v6, "appendString:", CFSTR(":"));
    -[ICSMultiValueProperty values](self, "values");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_ICSStringsForPropertyValuesWithOptions:appendingToString:", a3, v6);

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)ICSMultiValueProperty;
    -[ICSProperty _ICSStringWithOptions:appendingToString:](&v15, sel__ICSStringWithOptions_appendingToString_, a3, v6);
  }

}

- (ICSMultiValueProperty)initWithValue:(id)a3 type:(unint64_t)a4
{
  id v6;
  ICSMultiValueProperty *v7;
  ICSMultiValueProperty *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICSMultiValueProperty;
  v7 = -[ICSMultiValueProperty init](&v10, sel_init);
  v8 = v7;
  if (v7)
    -[ICSMultiValueProperty setValue:type:](v7, "setValue:type:", v6, a4);

  return v8;
}

- (BOOL)isMultiValued
{
  return 1;
}

- (id)value
{
  void *v2;
  void *v3;

  -[ICSMultiValueProperty values](self, "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setValue:(id)a3 type:(unint64_t)a4
{
  uint64_t v6;
  id v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = (id)v6;
  -[ICSMultiValueProperty setValues:valueType:](self, "setValues:valueType:", v6, a4);

}

- (id)values
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICSMultiValueProperty;
  -[ICSProperty value](&v3, sel_value);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setValues:(id)a3 valueType:(unint64_t)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICSMultiValueProperty;
  -[ICSProperty setValue:type:](&v4, sel_setValue_type_, a3, a4);
}

@end
