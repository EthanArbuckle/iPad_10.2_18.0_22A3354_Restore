@implementation OS_at_encoder

- (void)dealloc
{
  objc_super v3;

  ATEncoder_dtor((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_at_encoder;
  -[OS_at_encoder dealloc](&v3, sel_dealloc);
}

- (NSString)debugDescription
{
  NSString *result;
  NSString *v4;
  _BYTE v5[4096];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  result = (NSString *)objc_lookUpClass("NSString");
  if (result)
  {
    v4 = result;
    v5[0] = 0;
    ATEncoder_GetDescription((uint64_t)self);
    return -[NSString stringWithCString:encoding:](v4, "stringWithCString:encoding:", v5, 1);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (self && a3)
    return ATEncoder_IsEqual((uint64_t)self, (uint64_t)a3);
  else
    return 0;
}

@end
