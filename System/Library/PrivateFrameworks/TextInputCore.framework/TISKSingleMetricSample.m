@implementation TISKSingleMetricSample

- (TISKSingleMetricSample)init
{
  TISKSingleMetricSample *v2;
  uint64_t v3;
  NSMutableArray *samples;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TISKSingleMetricSample;
  v2 = -[TISKSingleMetricSample init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    samples = v2->_samples;
    v2->_samples = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addSample:(id)a3
{
  -[NSMutableArray addObject:](self->_samples, "addObject:", a3);
}

- (double)average
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_samples;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "doubleValue", (_QWORD)v11);
        v7 = v7 + v9;
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7 / (double)(unint64_t)-[NSMutableArray count](self->_samples, "count");
}

- (double)variance
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  unint64_t v10;
  double v11;
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
  v3 = self->_samples;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "doubleValue", (_QWORD)v13);
        v7 = v7 + v9 * v9;
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  v10 = -[NSMutableArray count](self->_samples, "count");
  -[TISKSingleMetricSample average](self, "average");
  return v7 / (double)v10 - v11 * v11;
}

- (double)sum
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_samples;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "doubleValue", (_QWORD)v10);
        v6 = v6 + v8;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  NSMutableArray *samples;
  void *v4;

  if (self == a3)
    return 1;
  samples = self->_samples;
  objc_msgSend(a3, "samples");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(samples) = -[NSMutableArray isEqual:](samples, "isEqual:", v4);

  return (char)samples;
}

- (id)description
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_samples;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "floatValue");
        objc_msgSend(v3, "appendFormat:", CFSTR("%f,"), v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (unint64_t)size
{
  return -[NSMutableArray count](self->_samples, "count");
}

- (BOOL)isEmpty
{
  return -[NSMutableArray count](self->_samples, "count") == 0;
}

- (void)merge:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *v6;
  void *v7;
  void *v8;
  NSMutableArray *samples;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    IXADefaultLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      samples = self->_samples;
      objc_msgSend(v4, "samples");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%s [SensorKit] SingleMetricSample merge: other doesn't respond to sample selector %@ : %@"), "-[TISKSingleMetricSample merge:]", samples, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v11;
      _os_log_error_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
  v6 = self->_samples;
  objc_msgSend(v4, "samples");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", v7);

}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_samples, CFSTR("SingleMetricSample"));
}

- (TISKSingleMetricSample)initWithCoder:(id)a3
{
  id v4;
  TISKSingleMetricSample *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *samples;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TISKSingleMetricSample;
  v5 = -[TISKSingleMetricSample init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("SingleMetricSample"));
    v10 = objc_claimAutoreleasedReturnValue();
    samples = v5->_samples;
    v5->_samples = (NSMutableArray *)v10;

  }
  return v5;
}

- (id)generateDataForSR:(id)a3
{
  double v4;
  id v5;
  NSMutableArray *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  float v17;
  void *v18;
  double v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = *(double *)objc_msgSend(a3, "metricDefinition");
  v5 = objc_alloc_init((Class)getSRKeyboardProbabilityMetricClass());
  v6 = self->_samples;
  v7 = -[NSMutableArray count](v6, "count");
  if (v7 >= 2)
  {
    v8 = v7;
    v9 = 0;
    do
    {
      -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](v6, "exchangeObjectAtIndex:withObjectAtIndex:", v9, v9 + arc4random_uniform(v8));
      ++v9;
      --v8;
    }
    while (v8 != 1);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = self->_samples;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = v4;
    v14 = *(_QWORD *)v23;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v15), "floatValue", (_QWORD)v22);
        v17 = roundf(v16 / v13) * v13;
        objc_msgSend(v5, "mutableSampleValues");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v19 = v17;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v20);

        ++v15;
      }
      while (v12 != v15);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  return v5;
}

- (NSMutableArray)samples
{
  return self->_samples;
}

- (void)setSamples:(id)a3
{
  objc_storeStrong((id *)&self->_samples, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samples, 0);
}

+ (id)makeMetric
{
  return objc_alloc_init(TISKSingleMetricSample);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
