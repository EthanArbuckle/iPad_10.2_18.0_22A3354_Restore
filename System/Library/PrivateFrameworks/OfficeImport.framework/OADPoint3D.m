@implementation OADPoint3D

- (OADPoint3D)initWithX:(float)a3 y:(float)a4 z:(float)a5
{
  OADPoint3D *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OADPoint3D;
  result = -[OADPoint3D init](&v9, sel_init);
  if (result)
  {
    result->mX = a3;
    result->mY = a4;
    result->mZ = a5;
  }
  return result;
}

- (float)x
{
  return self->mX;
}

- (float)y
{
  return self->mY;
}

- (float)z
{
  return self->mZ;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *(float *)&v5 = self->mX;
  *(float *)&v6 = self->mY;
  *(float *)&v7 = self->mZ;
  return (id)objc_msgSend(v4, "initWithX:y:z:", v5, v6, v7);
}

- (unint64_t)hash
{
  return (unint64_t)self->mY ^ (unint64_t)self->mX ^ (unint64_t)self->mZ;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  float mX;
  float v8;
  float mY;
  float v10;
  float mZ;
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
  mX = self->mX;
  objc_msgSend(v5, "x");
  if (mX != v8)
    goto LABEL_7;
  mY = self->mY;
  objc_msgSend(v6, "y");
  if (mY != v10)
    goto LABEL_7;
  mZ = self->mZ;
  objc_msgSend(v6, "z");
  v13 = mZ == v12;
LABEL_8:

  return v13;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADPoint3D;
  -[OADPoint3D description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
