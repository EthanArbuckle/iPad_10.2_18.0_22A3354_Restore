@implementation PPSourceStats

- (PPSourceStats)initWithMinRefCount:(int64_t)a3 maxRefCount:(int64_t)a4 avgRefCount:(double)a5 medianRefCount:(double)a6 earliestDate:(id)a7 latestDate:(id)a8 uniqueBundleIdCount:(int64_t)a9 uniqueDocIdCount:(int64_t)a10 recordCount:(unint64_t)a11
{
  id v20;
  id v21;
  PPSourceStats *v22;
  PPSourceStats *v23;
  objc_super v25;

  v20 = a7;
  v21 = a8;
  v25.receiver = self;
  v25.super_class = (Class)PPSourceStats;
  v22 = -[PPSourceStats init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_minRefCount = a3;
    v22->_maxRefCount = a4;
    v22->_avgRefCount = a5;
    v22->_medianRefCount = a6;
    objc_storeStrong((id *)&v22->_earliestDate, a7);
    objc_storeStrong((id *)&v23->_latestDate, a8);
    v23->_uniqueBundleIdCount = a9;
    v23->_uniqueDocIdCount = a10;
    v23->_recordCount = a11;
  }

  return v23;
}

- (id)toDictionary
{
  void *v3;
  double medianRefCount;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[4];
  _QWORD v27[6];

  v27[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setFormatOptions:", 275);
  v26[0] = CFSTR("ref_count");
  v24[0] = CFSTR("min");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_minRefCount);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18;
  v24[1] = CFSTR("max");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_maxRefCount);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v17;
  v24[2] = CFSTR("median");
  medianRefCount = self->_medianRefCount;
  if (medianRefCount < 0.0)
  {
    v5 = CFSTR("<no-info>");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_medianRefCount);
    v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  v25[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v6;
  v26[1] = CFSTR("date");
  v22[0] = CFSTR("earliest");
  if (self->_earliestDate)
    objc_msgSend(v3, "stringFromDate:");
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = CFSTR("latest");
  v23[0] = v7;
  v19 = v3;
  if (self->_latestDate)
    objc_msgSend(v3, "stringFromDate:");
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v9;
  v26[2] = CFSTR("unique_field_count");
  v20[0] = CFSTR("bundleId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_uniqueBundleIdCount);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = CFSTR("docId");
  v21[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_uniqueDocIdCount);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v12;
  v26[3] = CFSTR("recordCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_recordCount);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (medianRefCount >= 0.0)
  return v14;
}

- (NSSet)featureNames
{
  if (featureNames__pasOnceToken43 != -1)
    dispatch_once(&featureNames__pasOnceToken43, &__block_literal_global_676);
  return (NSSet *)(id)featureNames__pasExprOnceResult;
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  unint64_t minRefCount;
  uint64_t v7;
  void *v8;
  double avgRefCount;
  void *v10;
  NSDate *earliestDate;
  void *v12;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("minRefCount")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    minRefCount = self->_minRefCount;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("maxRefCount")))
    {
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("meanRefCount")))
      {
        v8 = (void *)MEMORY[0x1E0C9E918];
        avgRefCount = self->_avgRefCount;
      }
      else if (objc_msgSend(v4, "isEqualToString:", CFSTR("medianRefCount")))
      {
        v8 = (void *)MEMORY[0x1E0C9E918];
        avgRefCount = self->_medianRefCount;
      }
      else
      {
        if (objc_msgSend(v4, "isEqualToString:", CFSTR("earliestDate")))
        {
          v10 = (void *)MEMORY[0x1E0C9E918];
          earliestDate = self->_earliestDate;
        }
        else
        {
          if (!objc_msgSend(v4, "isEqualToString:", CFSTR("latestDate")))
          {
            if (objc_msgSend(v4, "isEqualToString:", CFSTR("bundleIdCount")))
            {
              v5 = (void *)MEMORY[0x1E0C9E918];
              minRefCount = self->_uniqueBundleIdCount;
            }
            else if (objc_msgSend(v4, "isEqualToString:", CFSTR("docIdCount")))
            {
              v5 = (void *)MEMORY[0x1E0C9E918];
              minRefCount = self->_uniqueDocIdCount;
            }
            else
            {
              if (!objc_msgSend(v4, "isEqualToString:", CFSTR("recordCount")))
              {
                v12 = 0;
                goto LABEL_17;
              }
              v5 = (void *)MEMORY[0x1E0C9E918];
              minRefCount = self->_recordCount;
            }
            goto LABEL_5;
          }
          v10 = (void *)MEMORY[0x1E0C9E918];
          earliestDate = self->_latestDate;
        }
        -[NSDate timeIntervalSince1970](earliestDate, "timeIntervalSince1970");
        v8 = v10;
      }
      objc_msgSend(v8, "featureValueWithDouble:", avgRefCount);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    v5 = (void *)MEMORY[0x1E0C9E918];
    minRefCount = self->_maxRefCount;
  }
LABEL_5:
  objc_msgSend(v5, "featureValueWithInt64:", minRefCount);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_16:
  v12 = (void *)v7;
LABEL_17:

  return v12;
}

- (int64_t)minRefCount
{
  return self->_minRefCount;
}

- (int64_t)maxRefCount
{
  return self->_maxRefCount;
}

- (double)avgRefCount
{
  return self->_avgRefCount;
}

- (double)medianRefCount
{
  return self->_medianRefCount;
}

- (NSDate)earliestDate
{
  return self->_earliestDate;
}

- (NSDate)latestDate
{
  return self->_latestDate;
}

- (int64_t)uniqueBundleIdCount
{
  return self->_uniqueBundleIdCount;
}

- (int64_t)uniqueDocIdCount
{
  return self->_uniqueDocIdCount;
}

- (unint64_t)recordCount
{
  return self->_recordCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestDate, 0);
  objc_storeStrong((id *)&self->_earliestDate, 0);
}

void __29__PPSourceStats_featureNames__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = (void *)MEMORY[0x1C3BD6630]();
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("minRefCount"), CFSTR("maxRefCount"), CFSTR("meanRefCount"), CFSTR("medianRefCount"), CFSTR("earliestDate"), CFSTR("latestDate"), CFSTR("bundleIdCount"), CFSTR("docIdCount"), CFSTR("recordCount"), 0);
  objc_autoreleasePoolPop(v1);
  v3 = (void *)featureNames__pasExprOnceResult;
  featureNames__pasExprOnceResult = v2;

  objc_autoreleasePoolPop(v0);
}

@end
