@implementation OADLightRig

- (OADLightRig)init
{
  OADLightRig *v2;
  OADLightRig *v3;
  OADRotation3D *mRotation;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OADLightRig;
  v2 = -[OADLightRig init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    mRotation = v2->mRotation;
    v2->mRotation = 0;

    *(_QWORD *)&v3->mType = 0;
  }
  return v3;
}

- (void)setRotation:(id)a3
{
  objc_storeStrong((id *)&self->mRotation, a3);
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setDirection:(int)a3
{
  self->mDirection = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[OADRotation3D copyWithZone:](self->mRotation, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = *(_QWORD *)&self->mType;
  return v5;
}

- (id)rotation
{
  return self->mRotation;
}

- (int)type
{
  return self->mType;
}

- (int)direction
{
  return self->mDirection;
}

- (unint64_t)hash
{
  return -[OADRotation3D hash](self->mRotation, "hash") ^ self->mType ^ (unint64_t)self->mDirection;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  OADRotation3D *mRotation;
  void *v8;
  int mType;
  int mDirection;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v5 = v4) != 0)
  {
    v6 = v5;
    mRotation = self->mRotation;
    objc_msgSend(v5, "rotation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[OADRotation3D isEqual:](mRotation, "isEqual:", v8)
      && (mType = self->mType, mType == objc_msgSend(v6, "type")))
    {
      mDirection = self->mDirection;
      v11 = mDirection == objc_msgSend(v6, "direction");
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADLightRig;
  -[OADLightRig description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRotation, 0);
}

@end
