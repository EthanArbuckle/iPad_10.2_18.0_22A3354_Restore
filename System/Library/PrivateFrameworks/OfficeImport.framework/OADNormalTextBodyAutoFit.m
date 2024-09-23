@implementation OADNormalTextBodyAutoFit

- (OADNormalTextBodyAutoFit)initWithFontScalePercent:(float)a3 lineSpacingReductionPercent:(float)a4
{
  OADNormalTextBodyAutoFit *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OADNormalTextBodyAutoFit;
  result = -[OADTextBodyAutoFit initWithType:](&v7, sel_initWithType_, 2);
  if (result)
  {
    *((float *)&result->super.mType + 1) = a3;
    result->mFontScalePercent = a4;
  }
  return result;
}

- (float)fontScalePercent
{
  return *((float *)&self->super.mType + 1);
}

- (float)lineSpacingReductionPercent
{
  return self->mFontScalePercent;
}

- (unint64_t)hash
{
  unint64_t v2;
  objc_super v4;

  v2 = (unint64_t)self->mFontScalePercent ^ (unint64_t)*((float *)&self->super.mType + 1);
  v4.receiver = self;
  v4.super_class = (Class)OADNormalTextBodyAutoFit;
  return v2 ^ -[OADTextBodyAutoFit hash](&v4, sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float v5;
  float v6;
  float mFontScalePercent;
  float v8;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = *((float *)&self->super.mType + 1), objc_msgSend(v4, "fontScalePercent"), v5 == v6)
    && (mFontScalePercent = self->mFontScalePercent,
        objc_msgSend(v4, "lineSpacingReductionPercent"),
        mFontScalePercent == v8))
  {
    v11.receiver = self;
    v11.super_class = (Class)OADNormalTextBodyAutoFit;
    v9 = -[OADTextBodyAutoFit isEqual:](&v11, sel_isEqual_, v4);
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
  v3.super_class = (Class)OADNormalTextBodyAutoFit;
  -[OADTextBodyAutoFit description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
