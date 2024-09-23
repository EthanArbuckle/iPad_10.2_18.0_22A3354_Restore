@implementation _PSFeatureStatistics

- (_PSFeatureStatistics)initWithList:(id)a3
{
  id v4;
  _PSFeatureStatistics *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PSFeatureStatistics;
  v5 = -[_PSFeatureStatistics init](&v8, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v4);
    -[_PSFeatureStatistics setList:](v5, "setList:", v6);

    -[_PSFeatureStatistics calculateStats](v5, "calculateStats");
  }

  return v5;
}

- (void)calculateStats
{
  double v3;
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id obj;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  -[_PSFeatureStatistics setMax:](self, "setMax:", 0.0);
  -[_PSFeatureStatistics setMin:](self, "setMin:", 100.0);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  -[_PSFeatureStatistics list](self, "list");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
  v6 = 0.0;
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v64 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "doubleValue");
        v11 = v10;
        -[_PSFeatureStatistics max](self, "max");
        if (v11 > v12)
          -[_PSFeatureStatistics setMax:](self, "setMax:", v11);
        -[_PSFeatureStatistics min](self, "min");
        if (v11 < v13)
          -[_PSFeatureStatistics setMin:](self, "setMin:", v11);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.01f"), *(_QWORD *)&v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "valueForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = (void *)MEMORY[0x1E0CB37E8];
        if (v15)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "numberWithInt:", objc_msgSend(v17, "intValue") + 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v14);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setValue:forKey:", v17, v14);
        }
        v6 = v6 + v11;
        v3 = v3 + v11 * v11;

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    }
    while (v7);
  }

  -[_PSFeatureStatistics setMode:](self, "setMode:", 0.0);
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v19 = v4;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v60 != v23)
          objc_enumerationMutation(v19);
        v25 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
        objc_msgSend(v19, "valueForKey:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "intValue");

        if (v27 > v22)
        {
          objc_msgSend(v25, "doubleValue");
          -[_PSFeatureStatistics setMode:](self, "setMode:");
          v22 = v27;
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    }
    while (v21);
  }

  -[_PSFeatureStatistics list](self, "list");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");

  if (!v29)
  {
    -[_PSFeatureStatistics setMax:](self, "setMax:", 0.0);
    -[_PSFeatureStatistics setMin:](self, "setMin:", 0.0);
  }
  -[_PSFeatureStatistics setAvg:](self, "setAvg:", 0.0);
  -[_PSFeatureStatistics setStdev:](self, "setStdev:", 0.0);
  -[_PSFeatureStatistics list](self, "list");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count");

  if (v31)
  {
    -[_PSFeatureStatistics list](self, "list");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSFeatureStatistics setAvg:](self, "setAvg:", v6 / (double)(unint64_t)objc_msgSend(v32, "count"));

    -[_PSFeatureStatistics list](self, "list");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v3 - v6 * v6 / (double)(unint64_t)objc_msgSend(v33, "count");
    -[_PSFeatureStatistics list](self, "list");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v34 / (double)(unint64_t)(objc_msgSend(v35, "count") - 1);

    -[_PSFeatureStatistics setStdev:](self, "setStdev:", sqrt(v36));
  }
  -[_PSFeatureStatistics list](self, "list");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "sortedArrayUsingSelector:", sel_compare_);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v38, "mutableCopy");
  -[_PSFeatureStatistics setList:](self, "setList:", v39);

  v40 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[_PSFeatureStatistics list](self, "list");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "count");

  if (v42)
  {
    -[_PSFeatureStatistics list](self, "list");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSFeatureStatistics list](self, "list");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectAtIndexedSubscript:", (int)(ceil((double)(unint64_t)objc_msgSend(v44, "count") * 0.1) + -1.0));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v45, CFSTR("10%"));

    -[_PSFeatureStatistics list](self, "list");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSFeatureStatistics list](self, "list");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectAtIndexedSubscript:", (int)(ceil((double)(unint64_t)objc_msgSend(v47, "count") * 0.25) + -1.0));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v48, CFSTR("25%"));

    -[_PSFeatureStatistics list](self, "list");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSFeatureStatistics list](self, "list");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectAtIndexedSubscript:", (int)(ceil((double)(unint64_t)objc_msgSend(v50, "count") * 0.5) + -1.0));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v51, CFSTR("50%"));

    -[_PSFeatureStatistics list](self, "list");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSFeatureStatistics list](self, "list");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectAtIndexedSubscript:", (int)(ceil((double)(unint64_t)objc_msgSend(v53, "count") * 0.75) + -1.0));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v54, CFSTR("75%"));

    -[_PSFeatureStatistics list](self, "list");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSFeatureStatistics list](self, "list");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "objectAtIndexedSubscript:", (int)(ceil((double)(unint64_t)objc_msgSend(v56, "count") * 0.9) + -1.0));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v57, CFSTR("90%"));

  }
  -[_PSFeatureStatistics setPercentiles:](self, "setPercentiles:", v40);

}

- (void)addValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_PSFeatureStatistics list](self, "list");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[_PSFeatureStatistics calculateStats](self, "calculateStats");
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

- (double)mode
{
  return self->_mode;
}

- (void)setMode:(double)a3
{
  self->_mode = a3;
}

- (NSDictionary)percentiles
{
  return self->_percentiles;
}

- (void)setPercentiles:(id)a3
{
  objc_storeStrong((id *)&self->_percentiles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentiles, 0);
  objc_storeStrong((id *)&self->_list, 0);
}

@end
