@implementation CHDErrorBar

+ (CHDErrorBar)errorBarWithChart:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithChart:", v3);

  return (CHDErrorBar *)v4;
}

- (CHDErrorBar)initWithChart:(id)a3
{
  id v5;
  CHDErrorBar *v6;
  CHDErrorBar *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHDErrorBar;
  v6 = -[CHDErrorBar init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mChart, a3);
    v7->mValue = 0.0;
    *(_QWORD *)&v7->mType = 0x200000000;
    v7->mDirection = 1;
    v7->mNoEndCap = 0;
  }

  return v7;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setDirection:(int)a3
{
  self->mDirection = a3;
}

- (void)setValueType:(int)a3
{
  self->mValueType = a3;
}

- (void)setNoEndCap:(BOOL)a3
{
  self->mNoEndCap = a3;
}

- (int)valueType
{
  return self->mValueType;
}

- (int)type
{
  return self->mType;
}

- (void)setPlusValues:(id)a3
{
  CHDData *v5;
  void *v6;
  CHDData *v7;

  v5 = (CHDData *)a3;
  if (self->mPlusValues != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->mPlusValues, a3);
    -[CHDChart processors](self->mChart, "processors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "markObject:processor:", v7, objc_opt_class());

    v5 = v7;
  }

}

- (void)setGraphicProperties:(id)a3
{
  OADGraphicProperties *v5;
  OADGraphicProperties **p_mGraphicProperties;
  OADGraphicProperties *mGraphicProperties;
  OADGraphicProperties *v8;

  v5 = (OADGraphicProperties *)a3;
  mGraphicProperties = self->mGraphicProperties;
  p_mGraphicProperties = &self->mGraphicProperties;
  if (mGraphicProperties != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mGraphicProperties, a3);
    v5 = v8;
  }

}

- (int)direction
{
  return self->mDirection;
}

- (id)minusValues
{
  return self->mMinusValues;
}

- (id)plusValues
{
  return self->mPlusValues;
}

- (void)setMinusValues:(id)a3
{
  CHDData *v5;
  void *v6;
  CHDData *v7;

  v5 = (CHDData *)a3;
  if (self->mMinusValues != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->mMinusValues, a3);
    -[CHDChart processors](self->mChart, "processors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "markObject:processor:", v7, objc_opt_class());

    v5 = v7;
  }

}

- (double)value
{
  return self->mValue;
}

- (void)setValue:(double)a3
{
  self->mValue = a3;
}

- (BOOL)isNoEndCap
{
  return self->mNoEndCap;
}

- (id)graphicProperties
{
  return self->mGraphicProperties;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDErrorBar;
  -[CHDErrorBar description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mGraphicProperties, 0);
  objc_storeStrong((id *)&self->mPlusValues, 0);
  objc_storeStrong((id *)&self->mMinusValues, 0);
  objc_storeStrong((id *)&self->mChart, 0);
}

@end
