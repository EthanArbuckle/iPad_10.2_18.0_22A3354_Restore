@implementation OADPointBulletSize

- (OADPointBulletSize)initWithPoints:(int)a3
{
  OADPointBulletSize *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OADPointBulletSize;
  result = -[OADPointBulletSize init](&v5, sel_init);
  if (result)
    result->mPoints = a3;
  return result;
}

- (int)points
{
  return self->mPoints;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int mPoints;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    mPoints = self->mPoints;
    v6 = mPoints == objc_msgSend(v4, "points");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->mPoints;
}

@end
