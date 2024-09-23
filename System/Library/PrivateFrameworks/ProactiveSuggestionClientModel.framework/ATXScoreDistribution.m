@implementation ATXScoreDistribution

- (ATXScoreDistribution)init
{
  ATXScoreDistribution *v2;
  uint64_t v3;
  NSMutableArray *scores;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXScoreDistribution;
  v2 = -[ATXScoreDistribution init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    scores = v2->_scores;
    v2->_scores = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)recordScore:(double)a3
{
  NSMutableArray *scores;
  id v6;

  if (!-[NSMutableArray count](self->_scores, "count") || self->_min > a3)
    self->_min = a3;
  if (!-[NSMutableArray count](self->_scores, "count") || self->_max < a3)
    self->_max = a3;
  self->_sum = self->_sum + a3;
  scores = self->_scores;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](scores, "addObject:", v6);

}

- (double)mean
{
  double sum;

  if (!-[NSMutableArray count](self->_scores, "count"))
    return 0.0;
  sum = self->_sum;
  return sum / (double)(unint64_t)-[NSMutableArray count](self->_scores, "count");
}

- (double)standardDeviation
{
  double v3;
  double v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_scores, "count"))
    return 0.0;
  -[ATXScoreDistribution mean](self, "mean");
  v4 = v3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_scores;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "doubleValue", (_QWORD)v13);
        v9 = v9 + (v11 - v4) * (v11 - v4);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  return sqrt(v9 / (double)(unint64_t)-[NSMutableArray count](self->_scores, "count"));
}

- (void)enumerateAsHistogramWithNumberOfBins:(unint64_t)a3 binHandler:(id)a4
{
  void (**v6)(_QWORD, __n128, __n128, __n128);
  __n128 v7;
  __n128 v8;
  __n128 v9;
  void *v10;
  unint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(_QWORD, __n128, __n128, __n128);
  NSMutableArray *obj;
  _QWORD v25[5];
  void (**v26)(_QWORD, __n128, __n128, __n128);
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD, __n128, __n128, __n128))a4;
  if (a3 && -[NSMutableArray count](self->_scores, "count"))
  {
    v8.n128_u64[0] = *(_QWORD *)&self->_min;
    v9.n128_u64[0] = *(_QWORD *)&self->_max;
    if (v8.n128_f64[0] == v9.n128_f64[0])
    {
      v7.n128_u64[0] = 1.0;
      v6[2](v6, v7, v8, v9);
    }
    else
    {
      v23 = v6;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a3;
      do
      {
        objc_msgSend(v10, "addObject:", &unk_1E57EC290);
        --v11;
      }
      while (v11);
      v12 = (self->_max - self->_min) / (double)a3;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      obj = self->_scores;
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v29;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v29 != v15)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v16), "doubleValue");
            v18 = (v17 - self->_min) / v12;
            if ((unint64_t)v18 >= a3)
              v19 = a3 - 1;
            else
              v19 = (unint64_t)v18;
            v20 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v10, "objectAtIndexedSubscript:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "unsignedIntegerValue") + 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:atIndexedSubscript:", v22, v19);

            ++v16;
          }
          while (v14 != v16);
          v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v14);
      }

      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __72__ATXScoreDistribution_enumerateAsHistogramWithNumberOfBins_binHandler___block_invoke;
      v25[3] = &unk_1E57CEBE8;
      v27 = v12;
      v25[4] = self;
      v6 = v23;
      v26 = v23;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v25);

    }
  }
  else
  {
    v7.n128_u64[0] = 0;
    v8.n128_u64[0] = 0;
    v9.n128_u64[0] = 0;
    v6[2](v6, v7, v8, v9);
  }

}

uint64_t __72__ATXScoreDistribution_enumerateAsHistogramWithNumberOfBins_binHandler___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;

  v4 = *(double *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(double *)(*(_QWORD *)(a1 + 32) + 24) + (double)a3 * v4;
  v7 = v4 + v6;
  objc_msgSend(a2, "doubleValue");
  return (*(uint64_t (**)(uint64_t, double, double, double))(v5 + 16))(v5, v8 / (double)(unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"), v6, v7);
}

- (BOOL)isEqual:(id)a3
{
  ATXScoreDistribution *v4;
  ATXScoreDistribution *v5;
  BOOL v6;

  v4 = (ATXScoreDistribution *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXScoreDistribution isEqualToATXDeviceLevelMetricsScoreDistribution:](self, "isEqualToATXDeviceLevelMetricsScoreDistribution:", v5);

  return v6;
}

- (BOOL)isEqualToATXDeviceLevelMetricsScoreDistribution:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *v5;
  char v6;

  v4 = self->_scores;
  v5 = v4;
  if (v4 == *((NSMutableArray **)a3 + 1))
    v6 = 1;
  else
    v6 = -[NSMutableArray isEqual:](v4, "isEqual:");

  return v6;
}

- (unint64_t)hash
{
  return -[NSMutableArray hash](self->_scores, "hash");
}

- (double)min
{
  return self->_min;
}

- (double)max
{
  return self->_max;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scores, 0);
}

@end
