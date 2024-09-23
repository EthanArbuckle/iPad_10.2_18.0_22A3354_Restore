@implementation OS_axr_encoder

- (NSString)debugDescription
{
  return 0;
}

- (NSString)description
{
  return (NSString *)CFSTR("axr_encoder_t");
}

- (void)dealloc
{
  void *v2;
  objc_super v3;

  axr_encoder::~axr_encoder((axr_encoder *)self);
  v3.receiver = v2;
  v3.super_class = (Class)OS_axr_encoder;
  -[OS_axr_encoder dealloc](&v3, sel_dealloc);
}

@end
