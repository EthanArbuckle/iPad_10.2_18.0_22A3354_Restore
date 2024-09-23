@implementation FeatureConfig

- (FeatureConfig)init
{
  FeatureConfig *v2;
  FeatureConfig *v3;
  NSString *name;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FeatureConfig;
  v2 = -[FeatureConfig init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = 0;

  }
  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
