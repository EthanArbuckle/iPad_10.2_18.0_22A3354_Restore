@implementation OZShaderParameter

- (OZShaderParameter)initWithName:(id)a3 type:(int64_t)a4
{
  OZShaderParameter *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OZShaderParameter;
  v6 = -[OZShaderParameter init](&v8, sel_init);
  if (v6)
  {
    v6->_name = (NSString *)objc_msgSend(a3, "copy");
    v6->_type = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OZShaderParameter;
  -[OZShaderParameter dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)type
{
  return self->_type;
}

@end
