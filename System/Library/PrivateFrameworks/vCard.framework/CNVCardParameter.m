@implementation CNVCardParameter

+ (id)parameterWithName:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:value:", v7, v6);

  return v8;
}

- (CNVCardParameter)initWithName:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  NSString *name;
  NSString *v10;
  NSString *value;
  CNVCardParameter *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0
    || (v14.receiver = self,
        v14.super_class = (Class)CNVCardParameter,
        (self = -[CNVCardParameter init](&v14, sel_init)) == 0))
  {
    v12 = 0;
  }
  else
  {
    v8 = (NSString *)objc_msgSend(v6, "copy");
    name = self->_name;
    self->_name = v8;

    v10 = (NSString *)objc_msgSend(v7, "copy");
    value = self->_value;
    self->_value = v10;

    self = self;
    v12 = self;
  }

  return v12;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)value
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
