@implementation SXJSONFontAttributes

- (int64_t)weightWithValue:(id)a3 withType:(int)a4
{
  if (a3 && a4 == 2)
    return objc_msgSend(a3, "integerValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)familyNameWithValue:(id)a3 withType:(int)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = v6;
  if (v6 && a4 == 3)
  {
    v8 = v6;
  }
  else
  {
    -[SXJSONFontAttributes fontFamily](self, "fontFamily");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (int64_t)widthWithValue:(id)a3 withType:(int)a4
{
  id v4;
  int64_t v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ultra-condensed")) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("extra-condensed")) & 1) != 0)
  {
    v5 = 4;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("condensed")) & 1) != 0)
  {
    v5 = 5;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("semi-condensed")) & 1) != 0)
  {
    v5 = 6;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("normal")) & 1) != 0)
  {
    v5 = 7;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("semi-expanded")) & 1) != 0)
  {
    v5 = 8;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("expanded")) & 1) != 0)
  {
    v5 = 9;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("extra-expanded")) & 1) != 0)
  {
    v5 = 10;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ultra-expanded")) & 1) != 0)
  {
    v5 = 11;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("compressed")) & 1) != 0)
  {
    v5 = 3;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("extra-compressed")) & 1) != 0)
  {
    v5 = 1;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("ultra-compressed")))
  {
    v5 = 0;
  }
  else
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (int64_t)styleWithValue:(id)a3 withType:(int)a4
{
  id v4;
  int64_t v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("italic")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("oblique")) & 1) != 0)
  {
    v5 = 2;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("normal")))
  {
    v5 = 0;
  }
  else
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[SXJSONFontAttributes weight](self, "weight");
  v5 = -[SXJSONFontAttributes style](self, "style");
  v6 = -[SXJSONFontAttributes width](self, "width");
  -[SXJSONFontAttributes grade](self, "grade");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; weight: %lu; style: %lu; width: %lu; grade: %@>"),
    self,
    self,
    v4,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[SXJSONFontAttributes weight](self, "weight");
  v4 = -[SXJSONFontAttributes width](self, "width") ^ v3;
  v5 = v4 ^ -[SXJSONFontAttributes style](self, "style");
  -[SXJSONFontAttributes familyName](self, "familyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[SXJSONFontAttributes grade](self, "grade");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  SXJSONFontAttributes *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (SXJSONFontAttributes *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    v5 = -[SXJSONFontAttributes weight](self, "weight");
    if (v5 == -[SXJSONFontAttributes weight](v4, "weight")
      && (v6 = -[SXJSONFontAttributes width](self, "width"), v6 == -[SXJSONFontAttributes width](v4, "width"))
      && (v7 = -[SXJSONFontAttributes style](self, "style"), v7 == -[SXJSONFontAttributes style](v4, "style")))
    {
      -[SXJSONFontAttributes familyName](self, "familyName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXJSONFontAttributes familyName](v4, "familyName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[SXJSONObject jsonDictionary](self, "jsonDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXJSONObject specificationVersion](self, "specificationVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithJSONObject:andVersion:", v5, v6);

  return v7;
}

@end
