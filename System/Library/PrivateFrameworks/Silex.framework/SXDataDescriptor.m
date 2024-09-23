@implementation SXDataDescriptor

- (id)formatWithValue:(id)a3 withType:(int)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc(+[SXClassFactory classForBaseClass:type:](SXClassFactory, "classForBaseClass:type:", objc_opt_class(), v6));
      -[SXJSONObject specificationVersion](self, "specificationVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithJSONObject:andVersion:", v5, v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)labelWithValue:(id)a3 withType:(int)a4
{
  void *v5;
  SXFormattedText *v6;
  __CFString *v7;
  SXFormattedText *v8;
  SXFormattedText *v9;

  -[SXJSONObject valueForLookupKey:](self, "valueForLookupKey:", CFSTR("label"), *(_QWORD *)&a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = [SXFormattedText alloc];
    -[SXJSONObject specificationVersion](self, "specificationVersion");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = -[SXJSONObject initWithJSONObject:andVersion:](v6, "initWithJSONObject:andVersion:", v5, v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v5;
    else
      v7 = &stru_24D68E0F8;
    v8 = -[SXFormattedText initWithText:]([SXFormattedText alloc], "initWithText:", v7);
  }
  v9 = v8;

  return v9;
}

- (unint64_t)dataTypeWithValue:(id)a3 withType:(int)a4
{
  id v5;
  void *v6;
  unint64_t v7;

  v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("string")) & 1) != 0)
    {
      v7 = 1;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("text")) & 1) != 0)
    {
      v7 = 2;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("number")) & 1) != 0)
    {
      v7 = 3;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("integer")) & 1) != 0)
    {
      v7 = 4;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("float")) & 1) != 0)
    {
      v7 = 5;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("image")))
    {
      v7 = 6;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p;"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataDescriptor key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" key: %@"), v4);

  -[SXJSONObject valueForLookupKey:](self, "valueForLookupKey:", CFSTR("dataType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" dataType: %@"), v5);

  -[SXDataDescriptor identifier](self, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (__CFString *)v6;
  else
    v8 = CFSTR("(undefined)");
  v9 = v8;

  objc_msgSend(v3, "appendFormat:", CFSTR(" identifier: %@;"), v9);
  -[SXDataDescriptor label](self, "label");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (__CFString *)v10;
  else
    v12 = CFSTR("(undefined)");
  v13 = v12;

  objc_msgSend(v3, "appendFormat:", CFSTR(" label: %@>"), v13);
  return v3;
}

@end
