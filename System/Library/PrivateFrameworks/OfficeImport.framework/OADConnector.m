@implementation OADConnector

- (OADConnector)init
{
  uint64_t v3;
  objc_super v5;

  v3 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)OADConnector;
  return -[OADDrawable initWithPropertiesClass:](&v5, sel_initWithPropertiesClass_, v3);
}

- (id)connectorProperties
{
  return self->super.super.super.mDrawableProperties;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADConnector;
  -[OADShape description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
