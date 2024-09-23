@implementation CHDChartTypesCollection

- (CHDChartTypesCollection)initWithChart:(id)a3
{
  id v4;
  CHDChartTypesCollection *v5;
  CHDChartTypesCollection *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CHDChartTypesCollection;
  v5 = -[EDCollection init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->mChart, v4);

  return v6;
}

- (unint64_t)addObject:(id)a3
{
  id v4;
  id v5;
  CHDChart **p_mChart;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CHDChartTypesCollection;
  v5 = -[EDCollection addObject:](&v16, sel_addObject_, v4);
  if (v5 != (id)-1)
  {
    p_mChart = &self->mChart;
    WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
    objc_msgSend(WeakRetained, "processors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markObject:processor:", v4, objc_opt_class());

    if (-[EDCollection count](self, "count") == 1)
    {
      v9 = objc_loadWeakRetained((id *)&self->mChart);
      objc_msgSend(v9, "processors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "markObject:processor:", v4, objc_opt_class());

    }
    v11 = objc_loadWeakRetained((id *)p_mChart);
    objc_msgSend(v11, "processors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "markObject:processor:", v4, objc_opt_class());

    v13 = objc_loadWeakRetained((id *)p_mChart);
    objc_msgSend(v13, "processors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "markObject:processor:", v4, objc_opt_class());

  }
  return (unint64_t)v5;
}

- (void)resetSeriesOrder
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  if (-[EDCollection count](self, "count") >= 2)
  {
    v3 = -[EDCollection count](self, "count");
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      for (i = 0; i != v4; ++i)
      {
        -[EDCollection objectAtIndex:](self, "objectAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          objc_msgSend(v7, "seriesCollection");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "count");
          if (v10)
          {
            v11 = 0;
            do
            {
              objc_msgSend(v9, "objectAtIndex:", v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = v12;
              if (v12)
                objc_msgSend(v12, "setOrder:", v5++);

              ++v11;
            }
            while (v10 != v11);
          }

        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mChart);
}

@end
