@implementation ICURLAggregatedPerformanceMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlMetrics, 0);
}

- (NSArray)urlMetrics
{
  return self->_urlMetrics;
}

+ (id)aggregatedMetricsFromAggregatedMetrics:(id)a3 addingMetrics:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  ICURLAggregatedPerformanceMetrics *v11;
  ICURLAggregatedPerformanceMetrics *v12;
  ICURLAggregatedPerformanceMetrics *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(v5, "urlMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      objc_msgSend(v5, "urlMetrics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayByAddingObject:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = [ICURLAggregatedPerformanceMetrics alloc];
    }
    else
    {
      v13 = [ICURLAggregatedPerformanceMetrics alloc];
      v15[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v13;
    }
    v12 = -[ICURLAggregatedPerformanceMetrics initWithURLMetrics:](v11, "initWithURLMetrics:", v10);

  }
  else
  {
    v12 = (ICURLAggregatedPerformanceMetrics *)v5;
  }

  return v12;
}

- (ICURLAggregatedPerformanceMetrics)initWithURLMetrics:(id)a3
{
  id v4;
  ICURLAggregatedPerformanceMetrics *v5;
  ICURLAggregatedPerformanceMetrics *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICURLAggregatedPerformanceMetrics;
  v5 = -[ICURLAggregatedPerformanceMetrics init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICURLAggregatedPerformanceMetrics setUrlMetrics:](v5, "setUrlMetrics:", v4);

  return v6;
}

- (void)setUrlMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_urlMetrics, a3);
}

- (BOOL)isNotEmpty
{
  void *v2;
  BOOL v3;

  -[ICURLAggregatedPerformanceMetrics urlMetrics](self, "urlMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (double)networkTime
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;

  -[ICURLAggregatedPerformanceMetrics urlMetrics](self, "urlMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = 0.0;
  while (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchStartTime");
    v7 = v6;
    objc_msgSend(v5, "endTime");
    if (v7 >= v8)
      v9 = v7;
    else
      v9 = v8;
    objc_msgSend(v3, "removeLastObject");
    v10 = objc_msgSend(v3, "count");
    if (v10 - 1 >= 1)
    {
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", --v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fetchStartTime");
        if (v12 <= v9)
        {
          objc_msgSend(v11, "responseEndTime");
          if (v13 >= v7)
          {
            objc_msgSend(v11, "fetchStartTime");
            if (v14 < v7)
              v7 = v14;
            objc_msgSend(v11, "endTime");
            if (v15 >= v9)
              v9 = v15;
            objc_msgSend(v3, "removeObjectAtIndex:", v10);
          }
        }

      }
      while (v10 > 1);
    }
    v4 = v4 + v9 - v7;

  }
  return v4;
}

+ (id)aggregatedMetricsFromAggregatedMetrics:(id)a3 addingAggregatedMetrics:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  ICURLAggregatedPerformanceMetrics *v14;
  ICURLAggregatedPerformanceMetrics *v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "urlMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    v15 = (ICURLAggregatedPerformanceMetrics *)v6;
LABEL_6:
    v14 = v15;
    goto LABEL_7;
  }
  objc_msgSend(v6, "urlMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
    v15 = (ICURLAggregatedPerformanceMetrics *)v5;
    goto LABEL_6;
  }
  objc_msgSend(v5, "urlMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "urlMetrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[ICURLAggregatedPerformanceMetrics initWithURLMetrics:]([ICURLAggregatedPerformanceMetrics alloc], "initWithURLMetrics:", v13);
LABEL_7:

  return v14;
}

@end
