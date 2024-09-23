@implementation SPFinderStateInfo

- (SPFinderStateInfo)initWithState:(BOOL)a3 optInScreenOffScan:(BOOL)a4 lastUpdated:(id)a5 lastPublishDate:(id)a6 lastScheduledPublishActivityDate:(id)a7 activeCache:(int64_t)a8 disabledReasons:(id)a9
{
  _BOOL8 v12;
  _BOOL8 v13;
  id v15;
  id v16;
  id v17;
  id v18;
  SPFinderStateInfo *v19;
  SPFinderStateInfo *v20;
  void *v21;
  objc_super v23;

  v12 = a4;
  v13 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a9;
  v23.receiver = self;
  v23.super_class = (Class)SPFinderStateInfo;
  v19 = -[SPFinderStateInfo init](&v23, sel_init);
  v20 = v19;
  if (v19)
  {
    -[SPFinderStateInfo setState:](v19, "setState:", v13);
    -[SPFinderStateInfo setOptInScreenOffScan:](v20, "setOptInScreenOffScan:", v12);
    -[SPFinderStateInfo setLastUpdated:](v20, "setLastUpdated:", v15);
    -[SPFinderStateInfo setLastPublishDate:](v20, "setLastPublishDate:", v16);
    -[SPFinderStateInfo setLastScheduledPublishActivityDate:](v20, "setLastScheduledPublishActivityDate:", v17);
    -[SPFinderStateInfo setActiveCache:](v20, "setActiveCache:", a8);
    objc_msgSend(v18, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPFinderStateInfo setDisabledReasonsArray:](v20, "setDisabledReasonsArray:", v21);

  }
  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeBool:forKey:", -[SPFinderStateInfo state](self, "state"), CFSTR("state"));
  -[SPFinderStateInfo lastUpdated](self, "lastUpdated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("lastUpdated"));

  -[SPFinderStateInfo lastPublishDate](self, "lastPublishDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("lastPublishDate"));

  -[SPFinderStateInfo lastScheduledPublishActivityDate](self, "lastScheduledPublishActivityDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("lastScheduledPublishActivityDate"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[SPFinderStateInfo activeCache](self, "activeCache"), CFSTR("activeCache"));
  -[SPFinderStateInfo disabledReasonsArray](self, "disabledReasonsArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("disabledReasonsArray"));

  objc_msgSend(v8, "encodeBool:forKey:", -[SPFinderStateInfo optInScreenOffScan](self, "optInScreenOffScan"), CFSTR("optInScreenOffScan"));
}

- (SPFinderStateInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SPFinderStateInfo setState:](self, "setState:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("state")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdated"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPFinderStateInfo setLastUpdated:](self, "setLastUpdated:", v5);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastPublishDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPFinderStateInfo setLastPublishDate:](self, "setLastPublishDate:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastScheduledPublishActivityDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPFinderStateInfo setLastScheduledPublishActivityDate:](self, "setLastScheduledPublishActivityDate:", v7);

  -[SPFinderStateInfo setActiveCache:](self, "setActiveCache:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activeCache")));
  v8 = (void *)MEMORY[0x24BDBCF20];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("disabledReasonsArray"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPFinderStateInfo setDisabledReasonsArray:](self, "setDisabledReasonsArray:", v11);

  v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("optInScreenOffScan"));
  -[SPFinderStateInfo setOptInScreenOffScan:](self, "setOptInScreenOffScan:", v12);
  return self;
}

- (NSSet)disabledReasons
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[SPFinderStateInfo disabledReasonsArray](self, "disabledReasonsArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (id)description
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[SPFinderStateInfo state](self, "state");
  v5 = -[SPFinderStateInfo optInScreenOffScan](self, "optInScreenOffScan");
  -[SPFinderStateInfo lastUpdated](self, "lastUpdated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPFinderStateInfo lastPublishDate](self, "lastPublishDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPFinderStateInfo lastScheduledPublishActivityDate](self, "lastScheduledPublishActivityDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SPFinderStateInfo activeCache](self, "activeCache");
  -[SPFinderStateInfo disabledReasonsArray](self, "disabledReasonsArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SPFinderStateInfo state: %i, optInScreenOffScan: %i, lastUpdated: %@, lastPublishDate: %@, lastScheduledPublishActivityDate: %@, activeCache: %li, disabledReasons: %@"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)canPublishAnonymously
{
  return 1;
}

- (BOOL)state
{
  return self->_state;
}

- (void)setState:(BOOL)a3
{
  self->_state = a3;
}

- (BOOL)optInScreenOffScan
{
  return self->_optInScreenOffScan;
}

- (void)setOptInScreenOffScan:(BOOL)a3
{
  self->_optInScreenOffScan = a3;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)lastPublishDate
{
  return self->_lastPublishDate;
}

- (void)setLastPublishDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)lastScheduledPublishActivityDate
{
  return self->_lastScheduledPublishActivityDate;
}

- (void)setLastScheduledPublishActivityDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)activeCache
{
  return self->_activeCache;
}

- (void)setActiveCache:(int64_t)a3
{
  self->_activeCache = a3;
}

- (NSArray)disabledReasonsArray
{
  return self->_disabledReasonsArray;
}

- (void)setDisabledReasonsArray:(id)a3
{
  objc_storeStrong((id *)&self->_disabledReasonsArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledReasonsArray, 0);
  objc_storeStrong((id *)&self->_lastScheduledPublishActivityDate, 0);
  objc_storeStrong((id *)&self->_lastPublishDate, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
}

@end
