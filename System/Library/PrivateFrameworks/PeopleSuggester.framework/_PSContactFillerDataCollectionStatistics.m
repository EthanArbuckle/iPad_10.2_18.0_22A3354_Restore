@implementation _PSContactFillerDataCollectionStatistics

- (_PSContactFillerDataCollectionStatistics)initWithList:(id)a3
{
  id v4;
  _PSContactFillerDataCollectionStatistics *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PSContactFillerDataCollectionStatistics;
  v5 = -[_PSContactFillerDataCollectionStatistics init](&v8, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v4);
    -[_PSContactFillerDataCollectionStatistics setList:](v5, "setList:", v6);

    -[_PSContactFillerDataCollectionStatistics calculateStats](v5, "calculateStats");
  }

  return v5;
}

- (void)calculateStats
{
  double v3;
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  -[_PSContactFillerDataCollectionStatistics setMax:](self, "setMax:", 0.0);
  -[_PSContactFillerDataCollectionStatistics setMin:](self, "setMin:", 100.0);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[_PSContactFillerDataCollectionStatistics list](self, "list", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  v6 = 0.0;
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v9), "doubleValue");
        v11 = v10;
        -[_PSContactFillerDataCollectionStatistics max](self, "max");
        if (v11 > v12)
          -[_PSContactFillerDataCollectionStatistics setMax:](self, "setMax:", v11);
        -[_PSContactFillerDataCollectionStatistics min](self, "min");
        if (v11 < v13)
          -[_PSContactFillerDataCollectionStatistics setMin:](self, "setMin:", v11);
        v6 = v6 + v11;
        v3 = v3 + v11 * v11;
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  -[_PSContactFillerDataCollectionStatistics list](self, "list");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v15)
  {
    -[_PSContactFillerDataCollectionStatistics setMax:](self, "setMax:", 0.0);
    -[_PSContactFillerDataCollectionStatistics setMin:](self, "setMin:", 0.0);
  }
  -[_PSContactFillerDataCollectionStatistics setAvg:](self, "setAvg:", 0.0);
  -[_PSContactFillerDataCollectionStatistics setStdev:](self, "setStdev:", 0.0);
  -[_PSContactFillerDataCollectionStatistics list](self, "list");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    -[_PSContactFillerDataCollectionStatistics list](self, "list");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSContactFillerDataCollectionStatistics setAvg:](self, "setAvg:", v6 / (double)(unint64_t)objc_msgSend(v18, "count"));

    -[_PSContactFillerDataCollectionStatistics list](self, "list");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v3 - v6 * v6 / (double)(unint64_t)objc_msgSend(v19, "count");
    -[_PSContactFillerDataCollectionStatistics list](self, "list");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v20 / (double)(unint64_t)(objc_msgSend(v21, "count") - 1);

    -[_PSContactFillerDataCollectionStatistics setStdev:](self, "setStdev:", sqrt(v22));
  }
  -[_PSContactFillerDataCollectionStatistics max](self, "max");
  +[_PSContactFillerDataCollectionUtilities enforceOneSignificantFigureForDouble:](_PSContactFillerDataCollectionUtilities, "enforceOneSignificantFigureForDouble:");
  -[_PSContactFillerDataCollectionStatistics setMax:](self, "setMax:");
  -[_PSContactFillerDataCollectionStatistics min](self, "min");
  +[_PSContactFillerDataCollectionUtilities enforceOneSignificantFigureForDouble:](_PSContactFillerDataCollectionUtilities, "enforceOneSignificantFigureForDouble:");
  -[_PSContactFillerDataCollectionStatistics setMin:](self, "setMin:");
  -[_PSContactFillerDataCollectionStatistics avg](self, "avg");
  +[_PSContactFillerDataCollectionUtilities enforceOneSignificantFigureForDouble:](_PSContactFillerDataCollectionUtilities, "enforceOneSignificantFigureForDouble:");
  -[_PSContactFillerDataCollectionStatistics setAvg:](self, "setAvg:");
  -[_PSContactFillerDataCollectionStatistics stdev](self, "stdev");
  +[_PSContactFillerDataCollectionUtilities enforceOneSignificantFigureForDouble:](_PSContactFillerDataCollectionUtilities, "enforceOneSignificantFigureForDouble:");
  -[_PSContactFillerDataCollectionStatistics setStdev:](self, "setStdev:");
}

- (void)addValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_PSContactFillerDataCollectionStatistics list](self, "list");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[_PSContactFillerDataCollectionStatistics calculateStats](self, "calculateStats");
}

- (NSMutableArray)list
{
  return self->_list;
}

- (void)setList:(id)a3
{
  objc_storeStrong((id *)&self->_list, a3);
}

- (double)min
{
  return self->_min;
}

- (void)setMin:(double)a3
{
  self->_min = a3;
}

- (double)max
{
  return self->_max;
}

- (void)setMax:(double)a3
{
  self->_max = a3;
}

- (double)avg
{
  return self->_avg;
}

- (void)setAvg:(double)a3
{
  self->_avg = a3;
}

- (double)stdev
{
  return self->_stdev;
}

- (void)setStdev:(double)a3
{
  self->_stdev = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_list, 0);
}

@end
