@implementation RTStoredLocationOfInterestEnumerationOptions

- (RTStoredLocationOfInterestEnumerationOptions)init
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  RTStoredLocationOfInterestEnumerationOptions *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v4, v5);

  v7 = -[RTStoredLocationOfInterestEnumerationOptions initWithAscendingVisitEntryDate:batchSize:dateInterval:singleVisit:](self, "initWithAscendingVisitEntryDate:batchSize:dateInterval:singleVisit:", 1, 0, v6, 0);
  return v7;
}

- (RTStoredLocationOfInterestEnumerationOptions)initWithAscendingVisitEntryDate:(BOOL)a3 batchSize:(unint64_t)a4 dateInterval:(id)a5 singleVisit:(BOOL)a6
{
  id v10;
  RTStoredLocationOfInterestEnumerationOptions *v11;
  RTStoredLocationOfInterestEnumerationOptions *v12;
  NSDateInterval *v13;
  void *dateInterval;
  id v15;
  void *v16;
  uint64_t v17;
  NSDateInterval *v18;
  objc_super v20;

  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)RTStoredLocationOfInterestEnumerationOptions;
  v11 = -[RTStoredLocationOfInterestEnumerationOptions init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_ascendingVisitEntryDate = a3;
    if (v10)
    {
      v13 = (NSDateInterval *)v10;
      dateInterval = v12->_dateInterval;
      v12->_dateInterval = v13;
    }
    else
    {
      v15 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      dateInterval = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithStartDate:endDate:", dateInterval, v16);
      v18 = v12->_dateInterval;
      v12->_dateInterval = (NSDateInterval *)v17;

    }
    v12->_batchSize = a4;
    v12->_singleVisit = a6;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  RTStoredLocationOfInterestEnumerationOptions *v4;
  RTStoredLocationOfInterestEnumerationOptions *v5;
  int v6;
  int v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  _BOOL4 v13;
  _BOOL4 v14;
  BOOL v15;

  v4 = (RTStoredLocationOfInterestEnumerationOptions *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[RTStoredLocationOfInterestEnumerationOptions ascendingVisitEntryDate](self, "ascendingVisitEntryDate");
      v7 = -[RTStoredLocationOfInterestEnumerationOptions ascendingVisitEntryDate](v5, "ascendingVisitEntryDate");
      v8 = -[RTStoredLocationOfInterestEnumerationOptions batchSize](self, "batchSize");
      v9 = -[RTStoredLocationOfInterestEnumerationOptions batchSize](v5, "batchSize");
      -[RTStoredLocationOfInterestEnumerationOptions dateInterval](self, "dateInterval");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTStoredLocationOfInterestEnumerationOptions dateInterval](v5, "dateInterval");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToDateInterval:", v11);

      v13 = -[RTStoredLocationOfInterestEnumerationOptions singleVisit](self, "singleVisit");
      v14 = v12 & (v13 ^ -[RTStoredLocationOfInterestEnumerationOptions singleVisit](v5, "singleVisit") ^ 1);
      if (v8 != v9)
        LOBYTE(v14) = 0;
      v15 = v6 == v7 && v14;

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ascendingVisitEntryDate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_batchSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[NSDateInterval hash](self->_dateInterval, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_singleVisit);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAscendingVisitEntryDate:batchSize:dateInterval:singleVisit:", self->_ascendingVisitEntryDate, self->_batchSize, self->_dateInterval, self->_singleVisit);
}

- (BOOL)ascendingVisitEntryDate
{
  return self->_ascendingVisitEntryDate;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (BOOL)singleVisit
{
  return self->_singleVisit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
