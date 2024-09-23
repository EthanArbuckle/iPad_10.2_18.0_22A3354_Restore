@implementation SWDatastore

+ (SWDatastore)emptyDatastore
{
  return (SWDatastore *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithJSONString:", CFSTR("{}"));
}

- (SWDatastore)initWithJSONString:(id)a3
{
  id v4;
  SWDatastore *v5;
  uint64_t v6;
  NSString *JSONString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWDatastore;
  v5 = -[SWDatastore init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    JSONString = v5->_JSONString;
    v5->_JSONString = (NSString *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SWDatastore *v4;
  SWDatastore *v5;
  NSString *JSONString;
  void *v7;
  char v8;

  v4 = (SWDatastore *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v8 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    JSONString = self->_JSONString;
    -[SWDatastore JSONString](v5, "JSONString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSString isEqualToString:](JSONString, "isEqualToString:", v7);

  }
  else
  {
LABEL_5:
    v8 = 0;
  }
LABEL_7:

  return v8;
}

- (NSString)JSONString
{
  return self->_JSONString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_JSONString, 0);
}

@end
