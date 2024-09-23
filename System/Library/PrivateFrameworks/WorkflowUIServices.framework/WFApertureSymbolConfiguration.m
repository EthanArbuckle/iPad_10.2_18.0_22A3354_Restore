@implementation WFApertureSymbolConfiguration

- (WFApertureSymbolConfiguration)initWithPointSize:(double)a3 weight:(int64_t)a4
{
  WFApertureSymbolConfiguration *v6;
  WFApertureSymbolConfiguration *v7;
  WFApertureSymbolConfiguration *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFApertureSymbolConfiguration;
  v6 = -[WFApertureSymbolConfiguration init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_pointSize = a3;
    v6->_weight = a4;
    v8 = v6;
  }

  return v7;
}

- (int64_t)weight
{
  return self->_weight;
}

- (double)pointSize
{
  return self->_pointSize;
}

+ (id)configurationWithPointSize:(double)a3 weight:(int64_t)a4
{
  return -[WFApertureSymbolConfiguration initWithPointSize:weight:]([WFApertureSymbolConfiguration alloc], "initWithPointSize:weight:", a4, a3);
}

@end
