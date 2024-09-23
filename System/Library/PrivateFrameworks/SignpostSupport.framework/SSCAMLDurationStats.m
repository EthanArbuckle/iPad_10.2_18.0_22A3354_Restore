@implementation SSCAMLDurationStats

- (SSCAMLDurationStats)initWithCount:(unint64_t)a3 totalMs:(double)a4 minMs:(double)a5 maxMs:(double)a6 stddevMs:(double)a7
{
  SSCAMLDurationStats *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SSCAMLDurationStats;
  result = -[SSCAMLDurationStats init](&v13, sel_init);
  if (result)
  {
    result->_durationCount = a3;
    result->_totalMs = a4;
    result->_minMs = a5;
    result->_maxMs = a6;
    result->_stddevMs = a7;
  }
  return result;
}

- (SSCAMLDurationStats)initWithMeasuredValue:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  SSCAMLDurationStats *v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(v4, "total");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;
  objc_msgSend(v4, "min");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;
  objc_msgSend(v4, "max");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;
  objc_msgSend(v4, "stddev");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "doubleValue");
  v17 = -[SSCAMLDurationStats initWithCount:totalMs:minMs:maxMs:stddevMs:](self, "initWithCount:totalMs:minMs:maxMs:stddevMs:", v5, v8, v11, v14, v16);

  return v17;
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
  _QWORD v16[6];
  _QWORD v17[7];

  v17[6] = *MEMORY[0x1E0C80C00];
  v16[0] = kSSCAMLDurationStatsKey_Count;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SSCAMLDurationStats durationCount](self, "durationCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  v16[1] = kSSCAMLDurationStatsKey_Average;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMLDurationStats averageMs](self, "averageMs");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v5;
  v16[2] = kSSCAMLDurationStatsKey_Total;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMLDurationStats totalMs](self, "totalMs");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v7;
  v16[3] = kSSCAMLDurationStatsKey_Min;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMLDurationStats minMs](self, "minMs");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v9;
  v16[4] = kSSCAMLDurationStatsKey_Max;
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMLDurationStats maxMs](self, "maxMs");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v11;
  v16[5] = kSSCAMLDurationStatsKey_StdDev;
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMLDurationStats stddevMs](self, "stddevMs");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[SSCAMLDurationStats jsonDescription:](self, "jsonDescription:", 3);
}

- (double)averageMs
{
  double v3;

  if (!-[SSCAMLDurationStats durationCount](self, "durationCount"))
    return 0.0;
  -[SSCAMLDurationStats totalMs](self, "totalMs");
  return v3 / (double)-[SSCAMLDurationStats durationCount](self, "durationCount");
}

- (double)averageSec
{
  double v2;

  -[SSCAMLDurationStats averageMs](self, "averageMs");
  return v2 / 1000.0;
}

- (double)totalSec
{
  double v2;

  -[SSCAMLDurationStats totalMs](self, "totalMs");
  return v2 / 1000.0;
}

- (double)minSec
{
  double v2;

  -[SSCAMLDurationStats minMs](self, "minMs");
  return v2 / 1000.0;
}

- (double)maxSec
{
  double v2;

  -[SSCAMLDurationStats maxMs](self, "maxMs");
  return v2 / 1000.0;
}

- (double)stddevSec
{
  double v2;

  -[SSCAMLDurationStats stddevMs](self, "stddevMs");
  return v2 / 1000.0;
}

- (double)averageNs
{
  double v2;

  -[SSCAMLDurationStats averageMs](self, "averageMs");
  return v2 * 1000000.0;
}

- (double)totalNs
{
  double v2;

  -[SSCAMLDurationStats totalMs](self, "totalMs");
  return v2 * 1000000.0;
}

- (double)minNs
{
  double v2;

  -[SSCAMLDurationStats minMs](self, "minMs");
  return v2 * 1000000.0;
}

- (double)maxNs
{
  double v2;

  -[SSCAMLDurationStats maxMs](self, "maxMs");
  return v2 * 1000000.0;
}

- (double)stddevNs
{
  double v2;

  -[SSCAMLDurationStats stddevMs](self, "stddevMs");
  return v2 * 1000000.0;
}

- (unint64_t)durationCount
{
  return self->_durationCount;
}

- (double)totalMs
{
  return self->_totalMs;
}

- (double)minMs
{
  return self->_minMs;
}

- (double)maxMs
{
  return self->_maxMs;
}

- (double)stddevMs
{
  return self->_stddevMs;
}

@end
