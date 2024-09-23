@implementation OADLuminanceEffect

- (OADLuminanceEffect)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADLuminanceEffect;
  return -[OADBlipEffect initWithType:](&v3, sel_initWithType_, 2);
}

- (void)setContrast:(float)a3
{
  self->mBrightness = a3;
}

- (void)setBrightness:(float)a3
{
  *((float *)&self->super.mType + 1) = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  LODWORD(v5) = *(&self->super.mType + 1);
  objc_msgSend(v4, "setBrightness:", v5);
  *(float *)&v6 = self->mBrightness;
  objc_msgSend(v4, "setContrast:", v6);
  return v4;
}

- (float)brightness
{
  return *((float *)&self->super.mType + 1);
}

- (float)contrast
{
  return self->mBrightness;
}

- (unint64_t)hash
{
  unint64_t v2;
  objc_super v4;

  v2 = (unint64_t)self->mBrightness ^ (unint64_t)*((float *)&self->super.mType + 1);
  v4.receiver = self;
  v4.super_class = (Class)OADLuminanceEffect;
  return v2 ^ -[OADBlipEffect hash](&v4, sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float v5;
  float v6;
  float mBrightness;
  float v8;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = *((float *)&self->super.mType + 1), objc_msgSend(v4, "brightness"), v5 == v6)
    && (mBrightness = self->mBrightness, objc_msgSend(v4, "contrast"), mBrightness == v8))
  {
    v11.receiver = self;
    v11.super_class = (Class)OADLuminanceEffect;
    v9 = -[OADBlipEffect isEqual:](&v11, sel_isEqual_, v4);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
