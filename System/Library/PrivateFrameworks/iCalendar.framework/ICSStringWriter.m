@implementation ICSStringWriter

- (ICSStringWriter)init
{
  ICSStringWriter *v2;
  NSMutableString *v3;
  NSMutableString *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICSStringWriter;
  v2 = -[ICSStringWriter init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v4 = v2->_result;
    v2->_result = v3;

  }
  return v2;
}

- (ICSStringWriter)initWithString:(id)a3
{
  id v4;
  ICSStringWriter *v5;
  ICSStringWriter *v6;

  v4 = a3;
  v5 = -[ICSStringWriter init](self, "init");
  v6 = v5;
  if (v5)
    -[ICSStringWriter appendString:](v5, "appendString:", v4);

  return v6;
}

- (void)appendString:(id)a3
{
  -[NSMutableString appendString:](self->_result, "appendString:", a3);
}

- (void)appendFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:locale:arguments:", v5, 0, &v7);

  -[NSMutableString appendString:](self->_result, "appendString:", v6);
}

- (id)result
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", self->_result);
}

- (id)mutableResult
{
  return self->_result;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSStringWriter result](self, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p \"%@\">"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
}

@end
