@implementation PKPassRelevantDate

+ (id)findDateFromDates:(id)a3 option:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        switch(a4)
        {
          case 0uLL:
            v12 = 0;
            goto LABEL_11;
          case 1uLL:
            v12 = 1;
LABEL_11:
            objc_msgSend(v11, "relevantDateWithPriority:", v12);
            v13 = (id)objc_claimAutoreleasedReturnValue();
            if (!v8)
              goto LABEL_17;
            objc_msgSend(v8, "earlierDate:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 2uLL:
            objc_msgSend(v11, "relevantDateWithPriority:", 0);
            v13 = (id)objc_claimAutoreleasedReturnValue();
            if (!v8)
              goto LABEL_17;
            objc_msgSend(v8, "laterDate:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 3uLL:
            objc_msgSend(v11, "relevantDateWithPriority:", 1);
            v13 = (id)objc_claimAutoreleasedReturnValue();
            if (!v8)
              goto LABEL_17;
            objc_msgSend(v8, "laterDate:", v13);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqualToDate:", v13);

            if (v18)
              goto LABEL_17;
            goto LABEL_18;
          default:
            continue;
        }
        v15 = v14;
        v16 = objc_msgSend(v14, "isEqualToDate:", v13);

        if ((v16 & 1) != 0)
        {
LABEL_17:
          v13 = v13;

          v8 = v13;
        }
LABEL_18:

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PKPassRelevantDate)initWithEffectiveStartDate:(id)a3 effectiveEndDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  NSObject *v12;
  PKPassRelevantDate *v13;
  PKPassRelevantDate *v14;
  PKPassRelevantDate *v15;
  NSDate *date;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 || (v8 = v7) == 0)
    __break(1u);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v6, v7);
  v10 = v9;
  if (!v9)
    goto LABEL_8;
  objc_msgSend(v9, "duration");
  if (v11 > 86400.0)
  {
    PKLogFacilityTypeGetObject(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v6;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Dropping relevancy interval with start date: %@ end date: %@", buf, 0x16u);
    }

LABEL_8:
    v13 = 0;
    goto LABEL_12;
  }
  v18.receiver = self;
  v18.super_class = (Class)PKPassRelevantDate;
  v14 = -[PKPassRelevantDate init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_interval, v10);
    date = v15->_date;
    v15->_date = 0;

  }
  self = v15;
  v13 = self;
LABEL_12:

  return v13;
}

- (PKPassRelevantDate)initWithRelevantDate:(id)a3
{
  PKPassRelevantDate *result;
  PKPassRelevantDate *v6;
  PKPassRelevantDate *v7;
  PKPassRelevantDate *v8;
  NSDateInterval *interval;
  objc_super v10;

  result = (PKPassRelevantDate *)a3;
  if (result)
  {
    v6 = result;
    v10.receiver = self;
    v10.super_class = (Class)PKPassRelevantDate;
    v7 = -[PKPassRelevantDate init](&v10, sel_init);
    v8 = v7;
    if (v7)
    {
      interval = v7->_interval;
      v7->_interval = 0;

      objc_storeStrong((id *)&v8->_date, a3);
    }

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (PKPassRelevantDate)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  PKPassRelevantDate *v9;
  PKPassRelevantDate *v10;

  v4 = a3;
  objc_msgSend(v4, "PKDateForKey:", CFSTR("startDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKDateForKey:", CFSTR("endDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKDateForKey:", CFSTR("date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    if (!v7)
    {
      v10 = 0;
      goto LABEL_10;
    }
    v9 = -[PKPassRelevantDate initWithRelevantDate:](self, "initWithRelevantDate:", v7);
  }
  else
  {
    v9 = -[PKPassRelevantDate initWithEffectiveStartDate:effectiveEndDate:](self, "initWithEffectiveStartDate:effectiveEndDate:", v5, v6);
  }
  self = v9;
  v10 = self;
LABEL_10:

  return v10;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassRelevantDate;
  return -[PKPassRelevantDate init](&v3, sel_init);
}

- (PKPassRelevantDate)initWithCoder:(id)a3
{
  id v4;
  PKPassRelevantDate *v5;
  uint64_t v6;
  NSDateInterval *interval;
  uint64_t v8;
  NSDate *date;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassRelevantDate;
  v5 = -[PKPassRelevantDate init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relevantInterval"));
    v6 = objc_claimAutoreleasedReturnValue();
    interval = v5->_interval;
    v5->_interval = (NSDateInterval *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v8 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v8;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPassRelevantDate *v4;

  v4 = -[PKPassRelevantDate init](+[PKPassRelevantDate allocWithZone:](PKPassRelevantDate, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_interval, self->_interval);
  objc_storeStrong((id *)&v4->_date, self->_date);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSDateInterval *interval;
  id v5;

  interval = self->_interval;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", interval, CFSTR("relevantInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  PKPassRelevantDate *v4;
  PKPassRelevantDate *v5;
  BOOL v6;

  v4 = (PKPassRelevantDate *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPassRelevantDate _isEqualToRelevancyDate:](self, "_isEqualToRelevancyDate:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_date);
  objc_msgSend(v3, "safelyAddObject:", self->_interval);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)_isEqualToRelevancyDate:(id)a3
{
  id v4;
  NSDate *date;
  void *v6;
  NSDateInterval *interval;
  void *v8;
  BOOL v9;

  v4 = a3;
  date = self->_date;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSDate isEqualToDate:](date, "isEqualToDate:", v6))
  {
    interval = self->_interval;
    objc_msgSend(v4, "interval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSDateInterval isEqualToDateInterval:](interval, "isEqualToDateInterval:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSDate)effectiveStartDate
{
  return -[NSDateInterval startDate](self->_interval, "startDate");
}

- (NSDate)effectiveEndDate
{
  return -[NSDateInterval endDate](self->_interval, "endDate");
}

- (id)earliestDate
{
  void *date;
  void *v4;
  id v5;

  -[PKPassRelevantDate effectiveStartDate](self, "effectiveStartDate");
  date = (void *)objc_claimAutoreleasedReturnValue();
  v4 = date;
  if (!date)
    date = self->_date;
  v5 = date;

  return v5;
}

- (id)latestDate
{
  void *date;
  void *v4;
  id v5;

  -[PKPassRelevantDate effectiveEndDate](self, "effectiveEndDate");
  date = (void *)objc_claimAutoreleasedReturnValue();
  v4 = date;
  if (!date)
    date = self->_date;
  v5 = date;

  return v5;
}

- (PKPassRelevantDate)relevantDateWithPriority:(unint64_t)a3
{
  void *v3;

  if (a3 == 1)
  {
    -[PKPassRelevantDate latestDate](self, "latestDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    -[PKPassRelevantDate earliestDate](self, "earliestDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PKPassRelevantDate *)v3;
}

- (NSDateInterval)interval
{
  return self->_interval;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_interval, 0);
}

@end
