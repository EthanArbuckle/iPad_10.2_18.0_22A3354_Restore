@implementation ICSPredefinedValue

+ (id)numberWithLong:(int64_t)a3
{
  return (id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithLong:", a3);
}

- (ICSPredefinedValue)initWithLong:(int64_t)a3
{
  ICSPredefinedValue *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICSPredefinedValue;
  result = -[ICSPredefinedValue init](&v5, sel_init);
  if (result)
    result->_value = a3;
  return result;
}

- (ICSPredefinedValue)initWithBytes:(const void *)a3 objCType:(const char *)a4
{
  ICSPredefinedValue *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICSPredefinedValue;
  result = -[ICSPredefinedValue init](&v6, sel_init, a3, a4);
  if (result)
    result->_value = *(_QWORD *)a3;
  return result;
}

- (const)objCType
{
  return "l";
}

- (void)getValue:(void *)a3
{
  *(_QWORD *)a3 = self->_value;
}

- (int64_t)longValue
{
  return self->_value;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  int64_t value;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  value = self->_value;
  v5 = a3;
  objc_msgSend(v3, "numberWithLong:", value);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("EnumValue"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICSPredefinedValue)initWithCoder:(id)a3
{
  id v4;
  ICSPredefinedValue *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICSPredefinedValue;
  v5 = -[ICSPredefinedValue init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EnumValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_value = objc_msgSend(v6, "longValue");

  }
  return v5;
}

@end
