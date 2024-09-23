@implementation SMTriggerDestinationStateEnumerationOptions

- (SMTriggerDestinationStateEnumerationOptions)init
{
  return -[SMTriggerDestinationStateEnumerationOptions initWithBatchSize:fetchLimit:sortByStateStartDate:ascending:dateInterval:sessionIdentifier:](self, "initWithBatchSize:fetchLimit:sortByStateStartDate:ascending:dateInterval:sessionIdentifier:", 0, 0, 0, 0, 0, 0);
}

- (SMTriggerDestinationStateEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 sortByStateStartDate:(BOOL)a5 ascending:(BOOL)a6 dateInterval:(id)a7 sessionIdentifier:(id)a8
{
  id v15;
  id v16;
  SMTriggerDestinationStateEnumerationOptions *v17;
  SMTriggerDestinationStateEnumerationOptions *v18;
  objc_super v20;

  v15 = a7;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)SMTriggerDestinationStateEnumerationOptions;
  v17 = -[SMTriggerDestinationStateEnumerationOptions init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_batchSize = a3;
    v17->_fetchLimit = a4;
    v17->_sortByStateStartDate = a5;
    v17->_ascending = a6;
    objc_storeStrong((id *)&v17->_dateInterval, a7);
    objc_storeStrong((id *)&v18->_sessionIdentifier, a8);
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBatchSize:fetchLimit:sortByStateStartDate:ascending:dateInterval:sessionIdentifier:", self->_batchSize, self->_fetchLimit, self->_sortByStateStartDate, self->_ascending, self->_dateInterval, self->_sessionIdentifier);
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionIdentifier, CFSTR("sessionIdentifier"));

}

- (SMTriggerDestinationStateEnumerationOptions)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  SMTriggerDestinationStateEnumerationOptions *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("batchSize"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fetchLimit"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sortByStateStartDate"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ascending"));
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("dateInterval"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("sessionIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[SMTriggerDestinationStateEnumerationOptions initWithBatchSize:fetchLimit:sortByStateStartDate:ascending:dateInterval:sessionIdentifier:](self, "initWithBatchSize:fetchLimit:sortByStateStartDate:ascending:dateInterval:sessionIdentifier:", v5, v6, v7, v8, v9, v10);
  return v11;
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

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
