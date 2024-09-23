@implementation OADAdjustedColor

- (OADAdjustedColor)initWithBaseColor:(id)a3 adjustmentType:(int)a4 adjustmentParam:(unsigned __int8)a5 invert:(BOOL)a6 invert128:(BOOL)a7 gray:(BOOL)a8
{
  id v15;
  OADAdjustedColor *v16;
  OADAdjustedColor *v17;
  objc_super v19;

  v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)OADAdjustedColor;
  v16 = -[OADAdjustedColor init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->mBaseColor, a3);
    v17->mAdjustmentType = a4;
    v17->mAdjustmentParam = a5;
    v17->mInvert = a6;
    v17->mInvert128 = a7;
    v17->mGray = a8;
  }

  return v17;
}

- (id)baseColor
{
  return self->mBaseColor;
}

- (BOOL)gray
{
  return self->mGray;
}

- (unsigned)adjustmentParam
{
  return self->mAdjustmentParam;
}

- (int)adjustmentType
{
  return self->mAdjustmentType;
}

- (BOOL)invert
{
  return self->mInvert;
}

- (BOOL)invert128
{
  return self->mInvert128;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  OADColor *mBaseColor;
  void *v7;
  int mAdjustmentType;
  int mAdjustmentParam;
  int mInvert;
  int mInvert128;
  int mGray;
  BOOL v13;
  objc_super v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    mBaseColor = self->mBaseColor;
    objc_msgSend(v5, "baseColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[OADColor isEqual:](mBaseColor, "isEqual:", v7)
      && (mAdjustmentType = self->mAdjustmentType, mAdjustmentType == objc_msgSend(v5, "adjustmentType"))
      && (mAdjustmentParam = self->mAdjustmentParam,
          mAdjustmentParam == objc_msgSend(v5, "adjustmentParam"))
      && (mInvert = self->mInvert, mInvert == objc_msgSend(v5, "invert"))
      && (mInvert128 = self->mInvert128, mInvert128 == objc_msgSend(v5, "invert128"))
      && (mGray = self->mGray, mGray == objc_msgSend(v5, "gray")))
    {
      v15.receiver = self;
      v15.super_class = (Class)OADAdjustedColor;
      v13 = -[OADColor isEqual:](&v15, sel_isEqual_, v5);
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v3 = -[OADColor hash](self->mBaseColor, "hash") ^ self->mAdjustmentType ^ (unint64_t)self->mAdjustmentParam ^ self->mInvert ^ (unint64_t)self->mInvert128 ^ self->mGray;
  v5.receiver = self;
  v5.super_class = (Class)OADAdjustedColor;
  return v3 ^ -[OADColor hash](&v5, sel_hash);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = -[OADColor copyWithZone:](self->mBaseColor, "copyWithZone:");
  v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBaseColor:adjustmentType:adjustmentParam:invert:invert128:gray:", v5, self->mAdjustmentType, self->mAdjustmentParam, self->mInvert, self->mInvert128, self->mGray);
  -[OADColor transforms](self, "transforms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithZone:", a3);

  objc_msgSend(v6, "setTransforms:", v8);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBaseColor, 0);
}

@end
