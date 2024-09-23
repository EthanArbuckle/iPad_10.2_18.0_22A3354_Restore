@implementation PGTitle

- (BOOL)isEqual:(id)a3
{
  PGTitle *v4;
  uint64_t v5;
  char v6;
  PGTitle *v7;
  NSString *v8;
  int64_t category;
  NSString *stringValue;

  v4 = (PGTitle *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      -[PGTitle stringValue](v7, "stringValue");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      category = self->_category;
      if (category == -[PGTitle category](v7, "category"))
      {
        stringValue = self->_stringValue;
        if (stringValue == v8)
          v6 = 1;
        else
          v6 = -[NSString isEqualToString:](stringValue, "isEqualToString:", v8);
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_category ^ -[NSString hash](self->_stringValue, "hash");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> \"%@\" (%lu)"), v5, self, self->_stringValue, self->_category);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (int64_t)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

+ (PGTitle)titleWithString:(id)a3 category:(int64_t)a4
{
  NSString *v5;
  PGTitle *v6;
  NSString *stringValue;

  v5 = (NSString *)a3;
  v6 = objc_alloc_init(PGTitle);
  stringValue = v6->_stringValue;
  v6->_stringValue = v5;

  v6->_category = a4;
  return v6;
}

@end
