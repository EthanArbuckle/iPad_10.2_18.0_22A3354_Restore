@implementation OADAlphaModFixEffect

- (OADAlphaModFixEffect)init
{
  OADAlphaModFixEffect *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADAlphaModFixEffect;
  result = -[OADBlipEffect initWithType:](&v3, sel_initWithType_, 4);
  if (result)
    *(&result->super.mType + 1) = 1065353216;
  return result;
}

- (void)setAlpha:(float)a3
{
  *((float *)&self->super.mType + 1) = a3;
}

- (float)alpha
{
  return *((float *)&self->super.mType + 1);
}

- (unint64_t)hash
{
  unint64_t v2;
  objc_super v4;

  v2 = (unint64_t)*((float *)&self->super.mType + 1);
  v4.receiver = self;
  v4.super_class = (Class)OADAlphaModFixEffect;
  return -[OADBlipEffect hash](&v4, sel_hash) ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float v5;
  float v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = *((float *)&self->super.mType + 1), objc_msgSend(v4, "alpha"), v5 == v6))
  {
    v9.receiver = self;
    v9.super_class = (Class)OADAlphaModFixEffect;
    v7 = -[OADBlipEffect isEqual:](&v9, sel_isEqual_, v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  LODWORD(v5) = *(&self->super.mType + 1);
  objc_msgSend(v4, "setAlpha:", v5);
  return v4;
}

@end
