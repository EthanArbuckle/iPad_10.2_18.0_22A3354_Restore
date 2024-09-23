@implementation SMSessionMonitorStateEnumerationOptions

- (SMSessionMonitorStateEnumerationOptions)init
{
  return -[SMSessionMonitorStateEnumerationOptions initWithBatchSize:fetchLimit:sortByStateStartDate:ascending:dateInterval:](self, "initWithBatchSize:fetchLimit:sortByStateStartDate:ascending:dateInterval:", 0, 0, 0, 0, 0);
}

- (SMSessionMonitorStateEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 sortByStateStartDate:(BOOL)a5 ascending:(BOOL)a6 dateInterval:(id)a7
{
  id v13;
  SMSessionMonitorStateEnumerationOptions *v14;
  SMSessionMonitorStateEnumerationOptions *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)SMSessionMonitorStateEnumerationOptions;
  v14 = -[SMSessionMonitorStateEnumerationOptions init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_batchSize = a3;
    v14->_fetchLimit = a4;
    v14->_sortByStateStartDate = a5;
    v14->_ascending = a6;
    objc_storeStrong((id *)&v14->_dateInterval, a7);
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBatchSize:fetchLimit:sortByStateStartDate:ascending:dateInterval:", self->_batchSize, self->_fetchLimit, self->_sortByStateStartDate, self->_ascending, self->_dateInterval);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t batchSize;
  id v5;

  batchSize = self->_batchSize;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", batchSize, CFSTR("batchSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_fetchLimit, CFSTR("fetchLimit"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_sortByStateStartDate, CFSTR("sortByStateStartDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_ascending, CFSTR("ascending"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));

}

- (SMSessionMonitorStateEnumerationOptions)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  SMSessionMonitorStateEnumerationOptions *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("batchSize"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fetchLimit"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sortByStateStartDate"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ascending"));
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("dateInterval"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SMSessionMonitorStateEnumerationOptions initWithBatchSize:fetchLimit:sortByStateStartDate:ascending:dateInterval:](self, "initWithBatchSize:fetchLimit:sortByStateStartDate:ascending:dateInterval:", v5, v6, v7, v8, v9);
  return v10;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (BOOL)sortByStateStartDate
{
  return self->_sortByStateStartDate;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
