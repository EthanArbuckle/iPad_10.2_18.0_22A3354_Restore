@implementation CHDSeriesCollection

- (CHDSeriesCollection)initWithChart:(id)a3
{
  id v4;
  CHDSeriesCollection *v5;
  CHDSeriesCollection *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CHDSeriesCollection;
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
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  CHDChart **p_mChart;
  id v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CHDSeriesCollection;
  v5 = -[EDSortedCollection addObject:](&v16, sel_addObject_, v4);
  if (v5 != (id)-1)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      objc_msgSend(v4, "lastCachedName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
        objc_msgSend(WeakRetained, "processors");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "markObject:processor:", v4, objc_opt_class());

      }
    }
    p_mChart = &self->mChart;
    v11 = objc_loadWeakRetained((id *)&self->mChart);
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

- (unint64_t)nonEmptySeriesCount
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;

  v3 = -[EDCollection count](self, "count");
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  for (i = 0; i != v4; ++i)
  {
    -[EDCollection objectAtIndex:](self, "objectAtIndex:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v5 += objc_msgSend(v7, "isEmpty") ^ 1;

  }
  return v5;
}

- (id)firstNonEmptySeries
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = -[EDCollection count](self, "count");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    while (1)
    {
      -[EDCollection objectAtIndex:](self, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        if ((objc_msgSend(v6, "isEmpty") & 1) == 0)
          break;
      }

      if (v4 == ++v5)
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    v7 = 0;
  }
  return v7;
}

+ (CHDSeriesCollection)seriesCollectionWithChart:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithChart:", v3);

  return (CHDSeriesCollection *)v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mChart);
}

@end
