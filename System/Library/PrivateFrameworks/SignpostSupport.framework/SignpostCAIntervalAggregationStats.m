@implementation SignpostCAIntervalAggregationStats

- (id)copyWithZone:(_NSZone *)a3
{
  SignpostCAIntervalAggregationStats *v4;

  v4 = -[SignpostCAIntervalAggregationStats init](+[SignpostCAIntervalAggregationStats allocWithZone:](SignpostCAIntervalAggregationStats, "allocWithZone:", a3), "init");
  -[SignpostCAIntervalAggregationStats _addAggregationStats:](v4, "_addAggregationStats:", self);
  return v4;
}

- (void)_addAggregationStats:(id)a3
{
  float v4;
  float v5;
  float v6;
  float v7;
  id v8;

  v8 = a3;
  self->_intervalCount += objc_msgSend(v8, "intervalCount");
  self->_totalIntervalDurationNs += objc_msgSend(v8, "totalIntervalDurationNs");
  objc_msgSend(v8, "maxIntervalDurationNs");
  v5 = v4;
  -[SignpostCAIntervalAggregationStats maxIntervalDurationNs](self, "maxIntervalDurationNs");
  if (v5 > v6)
  {
    objc_msgSend(v8, "maxIntervalDurationNs");
    self->_maxIntervalDurationNs = v7;
  }

}

- (float)averageIntervalDurationNs
{
  float v3;

  if (!-[SignpostCAIntervalAggregationStats intervalCount](self, "intervalCount"))
    return 0.0;
  v3 = (float)-[SignpostCAIntervalAggregationStats totalIntervalDurationNs](self, "totalIntervalDurationNs");
  return v3 / (float)-[SignpostCAIntervalAggregationStats intervalCount](self, "intervalCount");
}

- (void)_addDurationNsToAggregation:(unint64_t)a3
{
  unint64_t v4;
  float v5;
  float v6;

  v4 = self->_totalIntervalDurationNs + a3;
  ++self->_intervalCount;
  self->_totalIntervalDurationNs = v4;
  v5 = (float)a3;
  -[SignpostCAIntervalAggregationStats maxIntervalDurationNs](self, "maxIntervalDurationNs");
  if (v6 < v5)
    self->_maxIntervalDurationNs = v5;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  float v5;
  double v6;
  float v7;
  __CFString *v8;

  if (-[SignpostCAIntervalAggregationStats intervalCount](self, "intervalCount"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = -[SignpostCAIntervalAggregationStats intervalCount](self, "intervalCount");
    -[SignpostCAIntervalAggregationStats averageIntervalDurationNs](self, "averageIntervalDurationNs");
    v6 = v5 / 1000000.0;
    -[SignpostCAIntervalAggregationStats maxIntervalDurationNs](self, "maxIntervalDurationNs");
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Count: %llu, Average: %.1f ms, Max: %.1f ms"), v4, *(_QWORD *)&v6, v7 / 1000000.0);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("No stalls");
  }
  return v8;
}

- (unint64_t)intervalCount
{
  return self->_intervalCount;
}

- (unint64_t)totalIntervalDurationNs
{
  return self->_totalIntervalDurationNs;
}

- (float)maxIntervalDurationNs
{
  return self->_maxIntervalDurationNs;
}

@end
