@implementation ATXTrendPlot

- (ATXTrendPlot)initWithStartDate:(id)a3 endDate:(id)a4 granularity:(int64_t)a5 binInitialDataProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  ATXTrendPlot *v13;
  ATXTrendPlot *v14;
  void *v15;
  void *v16;
  void *v17;
  ATXTrendPlotBin *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  NSArray *v23;
  NSArray *bins;
  NSArray *v25;
  _QWORD v27[4];
  NSArray *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  objc_super v34;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v34.receiver = self;
  v34.super_class = (Class)ATXTrendPlot;
  v13 = -[ATXTrendPlot init](&v34, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_granularity = a5;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXTrendPlot _dateComponentsForGranularity:](v14, "_dateComponentsForGranularity:", v14->_granularity);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0C99DE8];
    v18 = -[ATXTrendPlotBin initWithStartDate:]([ATXTrendPlotBin alloc], "initWithStartDate:", v10);
    objc_msgSend(v17, "arrayWithObject:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __77__ATXTrendPlot_initWithStartDate_endDate_granularity_binInitialDataProvider___block_invoke;
    v31[3] = &unk_1E57CFCB0;
    v21 = v11;
    v32 = v21;
    v22 = v19;
    v33 = v22;
    objc_msgSend(v15, "enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:", v10, v16, 2, v31);
    v27[0] = v20;
    v27[1] = 3221225472;
    v27[2] = __77__ATXTrendPlot_initWithStartDate_endDate_granularity_binInitialDataProvider___block_invoke_2;
    v27[3] = &unk_1E57CFCD8;
    v23 = (NSArray *)v22;
    v28 = v23;
    v29 = v21;
    v30 = v12;
    -[NSArray enumerateObjectsUsingBlock:](v23, "enumerateObjectsUsingBlock:", v27);
    bins = v14->_bins;
    v14->_bins = v23;
    v25 = v23;

  }
  return v14;
}

void __77__ATXTrendPlot_initWithStartDate_endDate_granularity_binInitialDataProvider___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  ATXTrendPlotBin *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "laterDate:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v10;
  if (v6 == v10)
  {
    *a4 = 1;
  }
  else
  {
    v8 = *(void **)(a1 + 40);
    v9 = -[ATXTrendPlotBin initWithStartDate:]([ATXTrendPlotBin alloc], "initWithStartDate:", v10);
    objc_msgSend(v8, "addObject:", v9);

    v7 = v10;
  }

}

void __77__ATXTrendPlot_initWithStartDate_endDate_granularity_binInitialDataProvider___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3 + 1;
  if (v5 >= objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(v10, "setEndDate:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNext:", v6);

    objc_msgSend(v10, "next");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEndDate:", v8);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setData:", v9);

}

- (NSDate)startDate
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_bins, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  void *v2;
  void *v3;

  -[NSArray lastObject](self->_bins, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (id)binAtDate:(id)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[ATXTrendPlot _binIndexForDate:](self, "_binIndexForDate:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_bins, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)_binIndexForDate:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  ATXTrendPlotBin *v20;
  NSUInteger v21;
  void *v22;
  void *v23;
  int v24;
  unint64_t v25;

  v4 = a3;
  if (!-[NSArray count](self->_bins, "count"))
    goto LABEL_7;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;
  -[ATXTrendPlot startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  if (v6 < v8)
  {

LABEL_7:
    v25 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_8;
  }
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v10 = v9;
  -[ATXTrendPlot endDate](self, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  if (v10 >= v13)
    goto LABEL_7;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v15 = v14;
  -[NSArray lastObject](self->_bins, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceReferenceDate");
  v19 = v18;

  if (v15 >= v19)
  {
    v25 = -[NSArray count](self->_bins, "count") - 1;
  }
  else
  {
    v20 = -[ATXTrendPlotBin initWithStartDate:]([ATXTrendPlotBin alloc], "initWithStartDate:", v4);
    v21 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](self->_bins, "indexOfObject:inSortedRange:options:usingComparator:", v20, 0, -[NSArray count](self->_bins, "count") - 1, 1024, &__block_literal_global_20);
    -[NSArray objectAtIndexedSubscript:](self->_bins, "objectAtIndexedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "startDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToDate:", v4);

    v25 = v21 - (v24 ^ 1u);
  }
LABEL_8:

  return v25;
}

uint64_t __33__ATXTrendPlot__binIndexForDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_dateComponentsForGranularity:(int64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_new();
  v5 = v4;
  switch(a3)
  {
    case 3:
      objc_msgSend(v4, "setWeekday:", 2);
      break;
    case 2:
      objc_msgSend(v4, "setHour:", 0);
      break;
    case 1:
      objc_msgSend(v4, "setMinute:", 0);
      break;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  ATXTrendPlot *v4;
  ATXTrendPlot *v5;
  BOOL v6;

  v4 = (ATXTrendPlot *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXTrendPlot isEqualToATXTrendPlot:](self, "isEqualToATXTrendPlot:", v5);

  return v6;
}

- (BOOL)isEqualToATXTrendPlot:(id)a3
{
  id *v4;
  NSUInteger v5;
  NSArray *bins;
  BOOL v7;
  _QWORD v9[4];
  id *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = (id *)a3;
  if ((id)self->_granularity == v4[1]
    && (v5 = -[NSArray count](self->_bins, "count"), v5 == objc_msgSend(v4[2], "count")))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 1;
    bins = self->_bins;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __38__ATXTrendPlot_isEqualToATXTrendPlot___block_invoke;
    v9[3] = &unk_1E57CFD20;
    v10 = v4;
    v11 = &v12;
    -[NSArray enumerateObjectsUsingBlock:](bins, "enumerateObjectsUsingBlock:", v9);
    v7 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __38__ATXTrendPlot_isEqualToATXTrendPlot___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToDate:", v9) & 1) != 0)
  {
    objc_msgSend(v13, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if ((v12 & 1) != 0)
      goto LABEL_6;
  }
  else
  {

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  *a4 = 1;
LABEL_6:

}

- (unint64_t)hash
{
  unint64_t granularity;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  granularity = self->_granularity;
  v3 = self->_bins;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "startDate", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "hash") - granularity + 32 * granularity;

        objc_msgSend(v8, "data");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        granularity = objc_msgSend(v11, "hash") - v10 + 32 * v10;

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return granularity;
}

- (int64_t)granularity
{
  return self->_granularity;
}

- (NSArray)bins
{
  return self->_bins;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bins, 0);
}

@end
