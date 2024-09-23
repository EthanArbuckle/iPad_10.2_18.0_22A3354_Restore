@implementation BKDisplayAnnotationStringContent

+ (id)contentWithString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setString:", v4);

  return v5;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = objc_msgSend(v3, "appendObject:withName:", self->_string, CFSTR("string"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSString *string;
  void *v8;
  unsigned __int8 v9;

  v5 = a3;
  if (v5 && (v6 = objc_opt_class(self, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    string = self->_string;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "string"));
    v9 = -[NSString isEqual:](string, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_storeStrong((id *)&self->_string, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
