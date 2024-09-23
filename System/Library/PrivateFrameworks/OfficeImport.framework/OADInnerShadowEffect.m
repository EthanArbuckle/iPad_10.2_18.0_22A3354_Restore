@implementation OADInnerShadowEffect

- (OADInnerShadowEffect)init
{
  return -[OADShadowEffect initWithType:](self, "initWithType:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithShadowEffect:type:", self, 0);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADInnerShadowEffect;
  -[OADShadowEffect description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
