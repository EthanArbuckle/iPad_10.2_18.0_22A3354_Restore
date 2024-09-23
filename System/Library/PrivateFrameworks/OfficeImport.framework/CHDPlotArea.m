@implementation CHDPlotArea

- (CHDPlotArea)initWithChart:(id)a3
{
  id v4;
  CHDPlotArea *v5;
  CHDChartTypesCollection *v6;
  CHDChartTypesCollection *mChartTypes;
  CHDAxesCollection *v8;
  CHDAxesCollection *mAxes;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHDPlotArea;
  v5 = -[CHDPlotArea init](&v11, sel_init);
  if (v5)
  {
    v6 = -[CHDChartTypesCollection initWithChart:]([CHDChartTypesCollection alloc], "initWithChart:", v4);
    mChartTypes = v5->mChartTypes;
    v5->mChartTypes = v6;

    v8 = objc_alloc_init(CHDAxesCollection);
    mAxes = v5->mAxes;
    v5->mAxes = v8;

    *(_WORD *)&v5->mCategoryAxesReversed = 0;
    v5->mContainsVolumeStockType = 0;
  }

  return v5;
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

- (id)axes
{
  return self->mAxes;
}

- (id)chartTypes
{
  return self->mChartTypes;
}

- (BOOL)isCategoryAxesReversed:(BOOL)a3
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;

  if (!self->mCategoryAxesReversedOverridden)
  {
    v4 = a3;
    -[CHDPlotArea axes](self, "axes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    if (v6)
    {
      for (i = 0; i != v6; ++i)
      {
        objc_msgSend(v5, "objectAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && !self->mCategoryAxesReversed)
        {
          self->mCategoryAxesReversed = objc_msgSend(v8, "isReverseOrder");
          self->mCategoryAxesReversedOverridden = 1;
          if (v4)
          {
            if (objc_msgSend(v8, "isReverseOrder"))
              objc_msgSend(v8, "setReverseOrderOverridden:", 1);
            objc_msgSend(v8, "setReverseOrder:", 0);
          }
        }

      }
    }

  }
  return self->mCategoryAxesReversed;
}

- (id)graphicProperties
{
  return self->mGraphicProperties;
}

- (BOOL)hasSecondaryAxis
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;

  v3 = -[EDCollection count](self->mAxes, "count");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 1;
    while (1)
    {
      -[EDCollection objectAtIndex:](self->mAxes, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        if ((objc_msgSend(v7, "isSecondary") & 1) != 0)
          break;
      }

      v6 = ++v5 < v4;
      if (v4 == v5)
        return 0;
    }

  }
  else
  {
    return 0;
  }
  return v6;
}

- (BOOL)hasSecondaryYAxisDeleted
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v3 = -[EDCollection count](self->mAxes, "count");
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  while (1)
  {
    -[EDCollection objectAtIndex:](self->mAxes, "objectAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if (objc_msgSend(v6, "isSecondary") && objc_msgSend(v7, "axisType") == 4)
        break;
    }

    if (v4 == ++v5)
      return 0;
  }
  v8 = objc_msgSend(v7, "isDeleted");

  return v8;
}

- (void)markSecondaryAxes
{
  unint64_t v3;
  void *v4;
  void *v5;
  unint64_t i;
  void *v7;
  void *v8;

  if (-[EDCollection count](self->mChartTypes, "count"))
  {
    v3 = 0;
    do
    {
      -[EDCollection objectAtIndex:](self->mChartTypes, "objectAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "axisIds");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; i < objc_msgSend(v5, "count"); ++i)
      {
        objc_msgSend(v5, "objectAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDKeyedCollection objectWithKey:](self->mAxes, "objectWithKey:", (int)objc_msgSend(v7, "intValue"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setSecondary:", v3 != 0);

      }
      ++v3;
    }
    while (v3 < -[EDCollection count](self->mChartTypes, "count"));
  }
}

- (BOOL)containsVolumeStockType
{
  return self->mContainsVolumeStockType;
}

- (void)setContainsVolumeStockType:(BOOL)a3
{
  self->mContainsVolumeStockType = a3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDPlotArea;
  -[CHDPlotArea description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mGraphicProperties, 0);
  objc_storeStrong((id *)&self->mAxes, 0);
  objc_storeStrong((id *)&self->mChartTypes, 0);
}

@end
