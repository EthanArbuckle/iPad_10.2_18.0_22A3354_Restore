@implementation SignpostSupportValueStats

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[SignpostSupportValueStats jsonDescription:](self, "jsonDescription:", 3);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  _QWORD v25[11];
  _QWORD v26[13];

  v26[11] = *MEMORY[0x1E0C80C00];
  v25[0] = CFSTR("Count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SignpostSupportValueStats count](self, "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v24;
  v25[1] = CFSTR("Sum");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostSupportValueStats sum](self, "sum");
  objc_msgSend(v3, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v23;
  v25[2] = CFSTR("Average");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostSupportValueStats average](self, "average");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v5;
  v25[3] = CFSTR("Min");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostSupportValueStats min](self, "min");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v7;
  v25[4] = CFSTR("Max");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostSupportValueStats max](self, "max");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v9;
  v25[5] = CFSTR("StdDev");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostSupportValueStats stddev](self, "stddev");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v11;
  v25[6] = CFSTR("P50");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostSupportValueStats p50](self, "p50");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v13;
  v25[7] = CFSTR("P90");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostSupportValueStats p90](self, "p90");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[7] = v15;
  v25[8] = CFSTR("P95");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostSupportValueStats p95](self, "p95");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[8] = v17;
  v25[9] = CFSTR("P99");
  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostSupportValueStats p99](self, "p99");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[9] = v19;
  v25[10] = CFSTR("Units");
  -[SignpostSupportValueStats unitsLabel](self, "unitsLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[10] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (SignpostSupportValueStats)initWithValues:(id)a3 unitsLabel:(id)a4 supportsDynamicPercentiles:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t i;
  double v22;
  double v23;
  SignpostSupportValueStats *v24;
  SignpostSupportValueStats *v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  objc_super v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v5 = a5;
  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "count");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  v14 = 0.0;
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v37;
    v17 = 0.0;
    v18 = 1.79769313e308;
    v19 = 0.0;
    v20 = 0.0;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "doubleValue");
        v20 = v20 + v22;
        if (v18 >= v22)
          v18 = v22;
        if (v19 < v22)
          v19 = v22;
        v17 = v17 + v22 * v22;
      }
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v15);
  }
  else
  {
    v18 = 1.79769313e308;
    v17 = 0.0;
    v19 = 0.0;
    v20 = 0.0;
  }

  v23 = 0.0;
  if (objc_msgSend(v10, "count"))
  {
    v14 = sqrt((v17 - v20 * v20 / (double)v11) / (double)v11);
    v23 = v18;
  }
  v35.receiver = self;
  v35.super_class = (Class)SignpostSupportValueStats;
  v24 = -[SignpostSupportValueStats init](&v35, sel_init);
  v25 = v24;
  if (v24)
  {
    if (v5)
    {
      if (!v10)
        v10 = (void *)MEMORY[0x1E0C9AA60];
      objc_storeStrong((id *)&v24->_sortedValues, v10);
    }
    objc_storeStrong((id *)&v25->_unitsLabel, a4);
    v25->_count = v11;
    v25->_sum = v20;
    v25->_min = v23;
    v25->_max = v19;
    v25->_stddev = v14;
    _valueForPercentile(v10, 50.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    v25->_p50 = v27;

    _valueForPercentile(v10, 90.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v25->_p90 = v29;

    _valueForPercentile(v10, 95.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "doubleValue");
    v25->_p95 = v31;

    _valueForPercentile(v10, 99.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValue");
    v25->_p99 = v33;

  }
  return v25;
}

- (double)average
{
  double v3;

  if (!-[SignpostSupportValueStats count](self, "count"))
    return 0.0;
  -[SignpostSupportValueStats sum](self, "sum");
  return v3 / (double)-[SignpostSupportValueStats count](self, "count");
}

- (id)valueForPercentile:(double)a3
{
  void *v4;
  void *v5;

  -[SignpostSupportValueStats sortedValues](self, "sortedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _valueForPercentile(v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)supportsDynamicPercentiles
{
  void *v2;
  BOOL v3;

  -[SignpostSupportValueStats sortedValues](self, "sortedValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (unint64_t)count
{
  return self->_count;
}

- (double)sum
{
  return self->_sum;
}

- (double)min
{
  return self->_min;
}

- (double)max
{
  return self->_max;
}

- (double)stddev
{
  return self->_stddev;
}

- (double)p50
{
  return self->_p50;
}

- (double)p90
{
  return self->_p90;
}

- (double)p95
{
  return self->_p95;
}

- (double)p99
{
  return self->_p99;
}

- (NSString)unitsLabel
{
  return self->_unitsLabel;
}

- (NSArray)sortedValues
{
  return self->_sortedValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedValues, 0);
  objc_storeStrong((id *)&self->_unitsLabel, 0);
}

@end
