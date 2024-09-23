@implementation PPSDataRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PPSDataRequest)initWithCoder:(id)a3
{
  id v4;
  PPSDataRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSSet *metrics;
  uint64_t v11;
  NSPredicate *predicate;
  uint64_t v13;
  NSDateInterval *timeFilter;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PPSDataRequest;
  v5 = -[PPSDataRequest init](&v16, sel_init);
  if (v5)
  {
    v5->_requestType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("metrics"));
    v9 = objc_claimAutoreleasedReturnValue();
    metrics = v5->_metrics;
    v5->_metrics = (NSSet *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
    v11 = objc_claimAutoreleasedReturnValue();
    predicate = v5->_predicate;
    v5->_predicate = (NSPredicate *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeFilter"));
    v13 = objc_claimAutoreleasedReturnValue();
    timeFilter = v5->_timeFilter;
    v5->_timeFilter = (NSDateInterval *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[PPSDataRequest requestType](self, "requestType"), CFSTR("type"));
  -[PPSDataRequest metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("metrics"));

  -[PPSDataRequest predicate](self, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("predicate"));

  -[PPSDataRequest timeFilter](self, "timeFilter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("timeFilter"));

}

- (PPSDataRequest)initWithRequestType:(int64_t)a3 metrics:(id)a4 predicate:(id)a5 timeFilter:(id)a6
{
  id v11;
  id v12;
  id v13;
  PPSDataRequest *v14;
  PPSDataRequest *v15;
  uint64_t v16;
  NSPredicate *predicate;
  objc_super v19;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PPSDataRequest;
  v14 = -[PPSDataRequest init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_requestType = a3;
    objc_storeStrong((id *)&v14->_metrics, a4);
    +[PPSPredicateUtilities predicateByReplacingNilWithEmptyString:](PPSPredicateUtilities, "predicateByReplacingNilWithEmptyString:", v12);
    v16 = objc_claimAutoreleasedReturnValue();
    predicate = v15->_predicate;
    v15->_predicate = (NSPredicate *)v16;

    objc_storeStrong((id *)&v15->_timeFilter, a6);
  }

  return v15;
}

- (NSString)category
{
  void *v2;
  void *v3;

  -[PPSDataRequest predicate](self, "predicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSPredicateUtilities constantValueForLeftKeyPath:inPredicate:](PPSPredicateUtilities, "constantValueForLeftKeyPath:inPredicate:", CFSTR("category"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)subsystem
{
  void *v2;
  void *v3;

  -[PPSDataRequest predicate](self, "predicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSPredicateUtilities constantValueForLeftKeyPath:inPredicate:](PPSPredicateUtilities, "constantValueForLeftKeyPath:inPredicate:", CFSTR("subsystem"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSPredicate)valueFilter
{
  void *v2;
  void *v3;
  void *v4;

  -[PPSDataRequest predicate](self, "predicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSPredicateUtilities predicateByRemovingSubpredicateWithLeftKeyPath:fromPredicate:](PPSPredicateUtilities, "predicateByRemovingSubpredicateWithLeftKeyPath:fromPredicate:", CFSTR("subsystem"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPSPredicateUtilities predicateByRemovingSubpredicateWithLeftKeyPath:fromPredicate:](PPSPredicateUtilities, "predicateByRemovingSubpredicateWithLeftKeyPath:fromPredicate:", CFSTR("category"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = -[PPSDataRequest requestType](self, "requestType");
  -[PPSDataRequest metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSDataRequest predicate](self, "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSDataRequest timeFilter](self, "timeFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { type: %ld, metrics: %@, predicate: %@, timeFilter: %@ }>"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (NSSet)metrics
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetrics:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 24, 1);
}

- (NSDateInterval)timeFilter
{
  return (NSDateInterval *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeFilter, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
