@implementation OADShadowEffect

- (OADShadowEffect)initWithType:(int)a3
{
  OADShadowEffect *v3;
  OADShadowEffect *v4;
  OADColor *mColor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OADShadowEffect;
  v3 = -[OADEffect initWithType:](&v7, sel_initWithType_, *(_QWORD *)&a3);
  v4 = v3;
  if (v3)
  {
    mColor = v3->mColor;
    v3->mColor = 0;

    v4->mBlurRadius = 0.0;
    v4->mDistance = 0.0;
    v4->mAngle = 0.0;
  }
  return v4;
}

- (void)setBlurRadius:(float)a3
{
  self->mBlurRadius = a3;
}

- (void)setDistance:(float)a3
{
  self->mDistance = a3;
}

- (void)setAngle:(float)a3
{
  self->mAngle = a3;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->mColor, a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADShadowEffect;
  if (-[OADEffect isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = (float *)v4;
    v6 = -[OADColor isEqual:](self->mColor, "isEqual:", *((_QWORD *)v5 + 2))
      && self->mBlurRadius == v5[6]
      && self->mDistance == v5[7]
      && self->mAngle == v5[8];

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v3 = -[OADColor hash](self->mColor, "hash") ^ (unint64_t)self->mBlurRadius ^ (unint64_t)self->mDistance ^ (unint64_t)self->mAngle;
  v5.receiver = self;
  v5.super_class = (Class)OADShadowEffect;
  return v3 ^ -[OADEffect hash](&v5, sel_hash);
}

- (OADShadowEffect)initWithShadowEffect:(id)a3 type:(int)a4
{
  uint64_t v4;
  id v6;
  OADShadowEffect *v7;
  void *v8;
  uint64_t v9;
  OADColor *mColor;
  float v11;
  float v12;
  float v13;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = -[OADShadowEffect initWithType:](self, "initWithType:", v4);
  if (v7)
  {
    objc_msgSend(v6, "color");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    mColor = v7->mColor;
    v7->mColor = (OADColor *)v9;

    objc_msgSend(v6, "blurRadius");
    v7->mBlurRadius = v11;
    objc_msgSend(v6, "distance");
    v7->mDistance = v12;
    objc_msgSend(v6, "angle");
    v7->mAngle = v13;
  }

  return v7;
}

- (id)color
{
  return self->mColor;
}

- (float)blurRadius
{
  return self->mBlurRadius;
}

- (float)distance
{
  return self->mDistance;
}

- (float)angle
{
  return self->mAngle;
}

- (void)setStyleColor:(id)a3
{
  id v4;

  -[OADColor colorForStyleColor:](self->mColor, "colorForStyleColor:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[OADShadowEffect setColor:](self, "setColor:");

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADShadowEffect;
  -[OADEffect description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColor, 0);
}

@end
