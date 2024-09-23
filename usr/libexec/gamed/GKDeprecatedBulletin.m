@implementation GKDeprecatedBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKDeprecatedBulletin)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKDeprecatedBulletin;
  return -[GKBulletin initWithCoder:](&v4, "initWithCoder:", a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKDeprecatedBulletin;
  -[GKBulletin encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

@end
