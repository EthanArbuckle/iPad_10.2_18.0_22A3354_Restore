@implementation CHDTrendline

- (CHDTrendline)init
{
  CHDTrendline *v2;
  CHDTrendline *v3;
  OADGraphicProperties *mGraphicProperties;
  CHDTrendlineLabel *mLabel;
  EDString *mName;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CHDTrendline;
  v2 = -[CHDTrendline init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->mDisplayEquation = 0;
    v2->mForward = 0.0;
    v2->mInterceptYAxis = 0.0;
    v2->mBackward = 0.0;
    v2->mPolynomialOrder = 2;
    v2->mMovingAveragePeriod = 0;
    v2->mType = 1;
    mGraphicProperties = v2->mGraphicProperties;
    v2->mGraphicProperties = 0;

    mLabel = v3->mLabel;
    v3->mLabel = 0;

    mName = v3->mName;
    v3->mName = 0;

  }
  return v3;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setLabel:(id)a3
{
  CHDTrendlineLabel *v5;
  CHDTrendlineLabel **p_mLabel;
  CHDTrendlineLabel *mLabel;
  CHDTrendlineLabel *v8;

  v5 = (CHDTrendlineLabel *)a3;
  mLabel = self->mLabel;
  p_mLabel = &self->mLabel;
  if (mLabel != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mLabel, a3);
    v5 = v8;
  }

}

- (void)setDisplayEquation:(BOOL)a3
{
  self->mDisplayEquation = a3;
}

- (void)setDisplayRSquaredValue:(BOOL)a3
{
  self->mDisplayRSquaredValue = a3;
}

- (void)setBackward:(double)a3
{
  self->mBackward = a3;
}

- (void)setForward:(double)a3
{
  self->mForward = a3;
}

- (void)setInterceptYAxis:(double)a3
{
  self->mInterceptYAxis = a3;
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

+ (id)trendline
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (id)graphicProperties
{
  return self->mGraphicProperties;
}

- (void)setPolynomialOrder:(int)a3
{
  self->mPolynomialOrder = a3;
}

- (void)setMovingAveragePeriod:(int64_t)a3
{
  self->mMovingAveragePeriod = a3;
}

- (BOOL)isDisplayEquation
{
  return self->mDisplayEquation;
}

- (BOOL)isDisplayRSquaredValue
{
  return self->mDisplayRSquaredValue;
}

- (double)backward
{
  return self->mBackward;
}

- (double)forward
{
  return self->mForward;
}

- (double)interceptYAxis
{
  return self->mInterceptYAxis;
}

- (int)polynomialOrder
{
  return self->mPolynomialOrder;
}

- (int64_t)movingAveragePeriod
{
  return self->mMovingAveragePeriod;
}

- (int)type
{
  return self->mType;
}

- (id)label
{
  return self->mLabel;
}

- (id)name
{
  return self->mName;
}

- (void)setName:(id)a3
{
  EDString *v5;
  EDString **p_mName;
  EDString *mName;
  EDString *v8;

  v5 = (EDString *)a3;
  mName = self->mName;
  p_mName = &self->mName;
  if (mName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mName, a3);
    v5 = v8;
  }

}

- (id)defaultNameWithSeriesName:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  switch(self->mType)
  {
    case 0:
      v5 = CFSTR("Expon.");
      break;
    case 1:
      v5 = CFSTR("Linear.");
      break;
    case 2:
      v5 = CFSTR("Log.");
      break;
    case 3:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld per. Mov. Avg."), self->mMovingAveragePeriod);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      v5 = CFSTR("Poly.");
      break;
    case 5:
      v5 = CFSTR("Power.");
      break;
    default:
      v5 = &stru_24F3BFFF8;
      break;
  }
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@(%@)"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDString edStringWithString:](EDString, "edStringWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDTrendline;
  -[CHDTrendline description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
  objc_storeStrong((id *)&self->mLabel, 0);
  objc_storeStrong((id *)&self->mGraphicProperties, 0);
}

@end
