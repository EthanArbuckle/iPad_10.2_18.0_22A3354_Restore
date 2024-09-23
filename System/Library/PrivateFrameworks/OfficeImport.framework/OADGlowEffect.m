@implementation OADGlowEffect

- (OADGlowEffect)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADGlowEffect;
  return -[OADEffect initWithType:](&v3, sel_initWithType_, 4);
}

- (void)setRadius:(float)a3
{
  self->mRadius = a3;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->mColor, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  double v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)-[OADColor copy](self->mColor, "copy");
  objc_msgSend(v4, "setColor:", v5);
  *(float *)&v6 = self->mRadius;
  objc_msgSend(v4, "setRadius:", v6);

  return v4;
}

- (id)color
{
  return self->mColor;
}

- (float)radius
{
  return self->mRadius;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t mRadius;
  objc_super v6;

  v3 = -[OADColor hash](self->mColor, "hash");
  mRadius = (unint64_t)self->mRadius;
  v6.receiver = self;
  v6.super_class = (Class)OADGlowEffect;
  return v3 ^ -[OADEffect hash](&v6, sel_hash) ^ mRadius;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  OADColor *mColor;
  void *v6;
  float mRadius;
  float v8;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    mColor = self->mColor;
    objc_msgSend(v4, "color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[OADColor isEqual:](mColor, "isEqual:", v6)
      && (mRadius = self->mRadius, objc_msgSend(v4, "radius"), mRadius == v8))
    {
      v11.receiver = self;
      v11.super_class = (Class)OADGlowEffect;
      v9 = -[OADEffect isEqual:](&v11, sel_isEqual_, v4);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADGlowEffect;
  -[OADEffect description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColor, 0);
}

@end
