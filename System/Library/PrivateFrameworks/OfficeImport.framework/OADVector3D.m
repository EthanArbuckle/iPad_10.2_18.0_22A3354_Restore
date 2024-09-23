@implementation OADVector3D

- (OADVector3D)initWithDx:(float)a3 dy:(float)a4 dz:(float)a5
{
  OADVector3D *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OADVector3D;
  result = -[OADVector3D init](&v9, sel_init);
  if (result)
  {
    result->mDx = a3;
    result->mDy = a4;
    result->mDz = a5;
  }
  return result;
}

- (float)dx
{
  return self->mDx;
}

- (float)dy
{
  return self->mDy;
}

- (float)dz
{
  return self->mDz;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *(float *)&v5 = self->mDx;
  *(float *)&v6 = self->mDy;
  *(float *)&v7 = self->mDz;
  return (id)objc_msgSend(v4, "initWithDx:dy:dz:", v5, v6, v7);
}

- (unint64_t)hash
{
  return (unint64_t)self->mDy ^ (unint64_t)self->mDx ^ (unint64_t)self->mDz;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  float mDx;
  float v8;
  float mDy;
  float v10;
  float mDz;
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
  mDx = self->mDx;
  objc_msgSend(v5, "dx");
  if (mDx != v8)
    goto LABEL_7;
  mDy = self->mDy;
  objc_msgSend(v6, "dy");
  if (mDy != v10)
    goto LABEL_7;
  mDz = self->mDz;
  objc_msgSend(v6, "dz");
  v13 = mDz == v12;
LABEL_8:

  return v13;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADVector3D;
  -[OADVector3D description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
