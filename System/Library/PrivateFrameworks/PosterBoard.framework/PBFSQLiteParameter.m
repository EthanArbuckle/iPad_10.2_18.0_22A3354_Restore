@implementation PBFSQLiteParameter

+ (id)unnamedParameter
{
  if (unnamedParameter_onceToken != -1)
    dispatch_once(&unnamedParameter_onceToken, &__block_literal_global_35);
  return (id)unnamedParameter_unnamedParameter;
}

void __38__PBFSQLiteParameter_unnamedParameter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)unnamedParameter_unnamedParameter;
  unnamedParameter_unnamedParameter = v0;

}

- (PBFSQLiteParameter)initWithParameterName:(id)a3
{
  id v4;
  PBFSQLiteParameter *v5;
  uint64_t v6;
  NSString *parameterName;
  PBFSQLiteParameter *v8;
  PBFSQLiteParameter *v9;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v11.receiver = self;
    v11.super_class = (Class)PBFSQLiteParameter;
    v5 = -[PBFSQLiteParameter init](&v11, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      parameterName = v5->_parameterName;
      v5->_parameterName = (NSString *)v6;

    }
    v8 = v5;
    self = v8;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "unnamedParameter");
    v8 = (PBFSQLiteParameter *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "parameterName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFSQLiteParameter parameterName](self, "parameterName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = BSEqualObjects();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  __CFString *v2;
  __CFString *v3;
  unint64_t v4;

  -[PBFSQLiteParameter parameterName](self, "parameterName");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("UNNAMED_PARAMETER_VALUE_WHICH_I_WILL_HASH");
  v4 = -[__CFString hash](v2, "hash");

  return v4;
}

- (id)pbf_valueForSQLiteQuery
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;

  -[PBFSQLiteParameter parameterName](self, "parameterName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[PBFSQLiteParameter parameterName](self, "parameterName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("?%@"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("?");
  }
  return v7;
}

- (NSString)parameterName
{
  return self->_parameterName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterName, 0);
}

@end
