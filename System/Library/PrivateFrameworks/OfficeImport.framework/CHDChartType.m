@implementation CHDChartType

- (CHDChartType)initWithChart:(id)a3
{
  id v4;
  CHDChartType *v5;
  CHDChartType *v6;
  EDCollection *v7;
  EDCollection *mAxisIds;
  CHDSeriesCollection *v9;
  CHDSeriesCollection *mSeries;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CHDChartType;
  v5 = -[CHDChartType init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mChart, v4);
    v7 = objc_alloc_init(EDCollection);
    mAxisIds = v6->mAxisIds;
    v6->mAxisIds = v7;

    v9 = -[CHDSeriesCollection initWithChart:]([CHDSeriesCollection alloc], "initWithChart:", v4);
    mSeries = v6->mSeries;
    v6->mSeries = v9;

    v6->mVaryColors = 1;
  }

  return v6;
}

- (void)setVaryColors:(BOOL)a3
{
  self->mVaryColors = a3;
}

- (id)axisIds
{
  return self->mAxisIds;
}

- (id)seriesCollection
{
  return self->mSeries;
}

- (void)setDefaultDataLabel:(id)a3
{
  CHDDataLabel *v5;
  CHDDataLabel **p_mDefaultDataLabel;
  CHDDataLabel *mDefaultDataLabel;
  CHDDataLabel *v8;

  v5 = (CHDDataLabel *)a3;
  mDefaultDataLabel = self->mDefaultDataLabel;
  p_mDefaultDataLabel = &self->mDefaultDataLabel;
  if (mDefaultDataLabel != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mDefaultDataLabel, a3);
    v5 = v8;
  }

}

- (id)chart
{
  return objc_loadWeakRetained((id *)&self->mChart);
}

- (id)axes
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
  objc_msgSend(WeakRetained, "plotArea");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[EDCollection count](self->mAxisIds, "count");
  if (v7)
  {
    v8 = 0;
    do
    {
      -[EDCollection objectAtIndex:](self->mAxisIds, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "intValue");

      objc_msgSend(v6, "objectWithKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v3, "addObject:", v11);

      ++v8;
    }
    while (v7 != v8);
  }

  return v3;
}

- (BOOL)isHorizontal
{
  return 0;
}

- (BOOL)isVaryColors
{
  return self->mVaryColors;
}

- (void)setSeriesCollection:(id)a3
{
  CHDSeriesCollection *v5;
  CHDSeriesCollection **p_mSeries;
  CHDSeriesCollection *mSeries;
  CHDSeriesCollection *v8;

  v5 = (CHDSeriesCollection *)a3;
  mSeries = self->mSeries;
  p_mSeries = &self->mSeries;
  if (mSeries != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mSeries, a3);
    v5 = v8;
  }

}

+ (id)chartTypeWithChart:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithChart:", v3);

  return v4;
}

- (unint64_t)seriesCount
{
  return -[EDCollection count](self->mSeries, "count");
}

- (unint64_t)categoryCount
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  unint64_t v9;

  v3 = -[EDCollection count](self->mSeries, "count");
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  for (i = 0; i != v4; ++i)
  {
    -[EDCollection objectAtIndex:](self->mSeries, "objectAtIndex:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if ((objc_msgSend(v7, "isEmpty") & 1) == 0)
      {
        v9 = objc_msgSend(v8, "categoryCount");
        if (v9 > v5)
          v5 = v9;
      }
    }

  }
  return v5;
}

+ (BOOL)is3DType
{
  return 0;
}

- (id)defaultTitleWithResources:(id)a3
{
  EDResources *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  EDValue v10;

  v4 = (EDResources *)a3;
  if (-[EDCollection count](self->mSeries, "count") == 1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[EDCollection objectAtIndex:](self->mSeries, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastCachedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      EDValue::EDValue(&v10, (const EDValue *)objc_msgSend(v6, "value"));
      if (EDValue::isStringType(&v10))
      {
        EDValue::resolvedEDStringValue(&v10, v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v7, "copy");

      }
      else
      {
        v8 = 0;
      }
      EDValue::~EDValue(&v10);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isPlotedOnSecondaryAxis
{
  CHDChart **p_mChart;
  id WeakRetained;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  BOOL v16;

  p_mChart = &self->mChart;
  WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
  objc_msgSend(WeakRetained, "plotArea");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSecondaryAxis");

  if (!v6)
    return 0;
  v7 = objc_loadWeakRetained((id *)p_mChart);
  objc_msgSend(v7, "plotArea");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "axes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[EDCollection count](self->mAxisIds, "count");
  if (v10)
  {
    v11 = 0;
    while (1)
    {
      -[EDCollection objectAtIndex:](self->mAxisIds, "objectAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "intValue");

      objc_msgSend(v9, "objectWithKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        if ((objc_msgSend(v14, "isSecondary") & 1) != 0)
          break;
      }

      if (v10 == ++v11)
        goto LABEL_7;
    }

    v16 = 1;
  }
  else
  {
LABEL_7:
    v16 = 0;
  }

  return v16;
}

- (void)switchAxes:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;

  v17 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
  objc_msgSend(WeakRetained, "plotArea");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  v8 = objc_msgSend(v17, "count");
  if (v7 == 4 && v8 == 2)
  {
    objc_msgSend(v17, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

    objc_msgSend(v17, "objectAtIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");

    for (i = 0; i != 4; ++i)
    {
      objc_msgSend(v6, "objectAtIndex:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = objc_msgSend(v14, "axisId");
        if (v16 != v10 && v16 != v12)
          objc_msgSend(v15, "setSecondary:", 1);
      }

    }
  }

}

- (id)axisForClass:(Class)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
  objc_msgSend(WeakRetained, "plotArea");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[EDCollection count](self->mAxisIds, "count");
  if (v7)
  {
    v8 = 0;
    while (1)
    {
      -[EDCollection objectAtIndex:](self->mAxisIds, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectWithKey:", (int)objc_msgSend(v9, "intValue"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
      }

      if (v7 == ++v8)
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    v10 = 0;
  }

  return v10;
}

- (id)defaultDataLabel
{
  return self->mDefaultDataLabel;
}

- (id)contentFormat
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
  objc_msgSend(WeakRetained, "defaultContentFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)defaultLabelPosition
{
  CHDDataLabel *mDefaultDataLabel;

  mDefaultDataLabel = self->mDefaultDataLabel;
  if (mDefaultDataLabel)
    LODWORD(mDefaultDataLabel) = -[CHDDataLabel position](mDefaultDataLabel, "position");
  return (int)mDefaultDataLabel;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDChartType;
  -[CHDChartType description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDefaultDataLabel, 0);
  objc_storeStrong((id *)&self->mSeries, 0);
  objc_storeStrong((id *)&self->mAxisIds, 0);
  objc_destroyWeak((id *)&self->mChart);
}

@end
