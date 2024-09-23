@implementation PDIterate

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (int)type
{
  return self->mType;
}

- (BOOL)isBackwards
{
  return self->mIsBackwards;
}

- (void)setIsBackwards:(BOOL)a3
{
  self->mIsBackwards = a3;
}

- (BOOL)isValuePercentage
{
  return self->mIsPercentage;
}

- (void)setIsValuePercentage:(BOOL)a3
{
  self->mIsPercentage = a3;
}

- (double)value
{
  return self->mValue;
}

- (void)setValue:(double)a3
{
  self->mValue = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int mType;
  int mIsBackwards;
  int mIsPercentage;
  double mValue;
  double v12;
  BOOL v13;

  v4 = a3;
  v5 = objc_opt_class();
  TSUDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6
    && (mType = self->mType, mType == objc_msgSend(v6, "type"))
    && (mIsBackwards = self->mIsBackwards, mIsBackwards == objc_msgSend(v7, "isBackwards"))
    && (mIsPercentage = self->mIsPercentage, mIsPercentage == objc_msgSend(v7, "isValuePercentage")))
  {
    mValue = self->mValue;
    objc_msgSend(v7, "value");
    v13 = mValue == v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v2;
  objc_super v4;

  v2 = ((unint64_t)self->mValue << 8) + (self->mType << 16);
  v4.receiver = self;
  v4.super_class = (Class)PDIterate;
  return -[PDIterate hash](&v4, sel_hash) + v2;
}

@end
