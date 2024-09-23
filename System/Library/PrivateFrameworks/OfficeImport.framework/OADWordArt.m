@implementation OADWordArt

- (OADWordArt)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADWordArt;
  return -[OADShape init](&v3, sel_init);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADWordArt;
  -[OADShape description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
