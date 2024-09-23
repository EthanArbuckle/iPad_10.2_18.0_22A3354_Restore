@implementation OADRotation3D

- (OADRotation3D)initWithLatitude:(float)a3 longitude:(float)a4 revolution:(float)a5
{
  OADRotation3D *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OADRotation3D;
  result = -[OADRotation3D init](&v9, sel_init);
  if (result)
  {
    result->mLatitude = a3;
    result->mLongitude = a4;
    result->mRevolution = a5;
  }
  return result;
}

- (float)latitude
{
  return self->mLatitude;
}

- (float)longitude
{
  return self->mLongitude;
}

- (float)revolution
{
  return self->mRevolution;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *(float *)&v5 = self->mLatitude;
  *(float *)&v6 = self->mLongitude;
  *(float *)&v7 = self->mRevolution;
  return (id)objc_msgSend(v4, "initWithLatitude:longitude:revolution:", v5, v6, v7);
}

- (unint64_t)hash
{
  return (unint64_t)self->mLongitude ^ (unint64_t)self->mLatitude ^ (unint64_t)self->mRevolution;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  float mLatitude;
  float v8;
  float mLongitude;
  float v10;
  float mRevolution;
  float v12;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v5 = v4;
  v6 = v5;
  if (!v5)
    goto LABEL_7;
  mLatitude = self->mLatitude;
  objc_msgSend(v5, "latitude");
  if (mLatitude != v8)
    goto LABEL_7;
  mLongitude = self->mLongitude;
  objc_msgSend(v6, "longitude");
  if (mLongitude != v10)
    goto LABEL_7;
  mRevolution = self->mRevolution;
  objc_msgSend(v6, "revolution");
  v13 = mRevolution == v12;
LABEL_8:

  return v13;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADRotation3D;
  -[OADRotation3D description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
