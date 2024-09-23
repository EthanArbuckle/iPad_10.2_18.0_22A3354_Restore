@implementation TPSAnalyticsEventTipTimeSpent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventTipTimeSpent)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventTipTimeSpent *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *tipID;
  uint64_t v9;
  NSString *collectionID;
  uint64_t v11;
  NSString *correlationID;
  double v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSAnalyticsEventTipTimeSpent;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("tip_ID"));
    v7 = objc_claimAutoreleasedReturnValue();
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("collection_ID"));
    v9 = objc_claimAutoreleasedReturnValue();
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("tip_correlation_ID"));
    v11 = objc_claimAutoreleasedReturnValue();
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v11;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("time_spent"));
    v5->_timeSpent = v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventTipTimeSpent;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, CFSTR("tip_ID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_collectionID, CFSTR("collection_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("time_spent"), self->_timeSpent);

}

- (id)_initWithTipID:(id)a3 collectionID:(id)a4 correlationID:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  TPSAnalyticsEventTipTimeSpent *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)TPSAnalyticsEventTipTimeSpent;
  v13 = -[TPSAnalyticsEvent initWithDate:](&v15, sel_initWithDate_, v12);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_tipID, a3);
    objc_storeStrong((id *)&v13->_collectionID, a4);
    objc_storeStrong((id *)&v13->_correlationID, a5);
    v13->_timeSpent = 0.0;
  }

  return v13;
}

+ (id)eventWithTipID:(id)a3 collectionID:(id)a4 correlationID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTipID:collectionID:correlationID:", v10, v9, v8);

  return v11;
}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("time_spent"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_tipID, CFSTR("tip_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_collectionID, CFSTR("collection_ID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("u65_flag"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)self->_timeSpent);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("time_spent"));

  return v3;
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
  objc_storeStrong((id *)&self->_collectionID, a3);
}

- (NSString)tipID
{
  return self->_tipID;
}

- (void)setTipID:(id)a3
{
  objc_storeStrong((id *)&self->_tipID, a3);
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (void)setCorrelationID:(id)a3
{
  objc_storeStrong((id *)&self->_correlationID, a3);
}

- (double)timeSpent
{
  return self->_timeSpent;
}

- (void)setTimeSpent:(double)a3
{
  self->_timeSpent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
}

@end
