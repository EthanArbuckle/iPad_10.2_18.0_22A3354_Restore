@implementation TPSAnalyticsEventSearchPerformed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventSearchPerformed)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventSearchPerformed *v5;
  uint64_t v6;
  NSString *searchID;
  uint64_t v8;
  NSString *searchTerm;
  uint64_t v10;
  NSString *invocationMethod;
  uint64_t v12;
  NSString *tipID;
  uint64_t v14;
  NSString *correlationID;
  uint64_t v16;
  NSString *collectionID;
  double v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TPSAnalyticsEventSearchPerformed;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("search_id"));
    v6 = objc_claimAutoreleasedReturnValue();
    searchID = v5->_searchID;
    v5->_searchID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("search_term"));
    v8 = objc_claimAutoreleasedReturnValue();
    searchTerm = v5->_searchTerm;
    v5->_searchTerm = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invocation_method"));
    v10 = objc_claimAutoreleasedReturnValue();
    invocationMethod = v5->_invocationMethod;
    v5->_invocationMethod = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_id"));
    v12 = objc_claimAutoreleasedReturnValue();
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_correlation_id"));
    v14 = objc_claimAutoreleasedReturnValue();
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collection_id"));
    v16 = objc_claimAutoreleasedReturnValue();
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v16;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("relevance"));
    v5->_relevance = v18;
    v5->_resultOrder = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("result_place"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventSearchPerformed;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchID, CFSTR("search_id"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchTerm, CFSTR("search_term"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_invocationMethod, CFSTR("invocation_method"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, CFSTR("tip_id"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_correlationID, CFSTR("tip_correlation_id"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_collectionID, CFSTR("collection_id"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("relevance"), self->_relevance);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_resultOrder, CFSTR("result_place"));

}

- (id)_initWithSearchID:(id)a3 searchTerm:(id)a4 invocationMethod:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  TPSAnalyticsEventSearchPerformed *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)TPSAnalyticsEventSearchPerformed;
  v13 = -[TPSAnalyticsEvent initWithDate:](&v15, sel_initWithDate_, v12);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_searchID, a3);
    objc_storeStrong((id *)&v13->_searchTerm, a4);
    objc_storeStrong((id *)&v13->_invocationMethod, a5);
  }

  return v13;
}

+ (id)eventWithSearchID:(id)a3 searchTerm:(id)a4 invocationMethod:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithSearchID:searchTerm:invocationMethod:", v10, v9, v8);

  return v11;
}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("search_performed"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_searchID, CFSTR("search_id"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_searchTerm, CFSTR("search_term"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_invocationMethod, CFSTR("invocation_method"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_tipID, CFSTR("tip_id"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_correlationID, CFSTR("tip_correlation_id"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_collectionID, CFSTR("collection_id"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_relevance);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("relevance"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_resultOrder);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("result_place"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("u65_flag"));

  return v3;
}

- (NSString)searchID
{
  return self->_searchID;
}

- (void)setSearchID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)invocationMethod
{
  return self->_invocationMethod;
}

- (void)setInvocationMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)tipID
{
  return self->_tipID;
}

- (void)setTipID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (void)setCorrelationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (double)relevance
{
  return self->_relevance;
}

- (void)setRelevance:(double)a3
{
  self->_relevance = a3;
}

- (int64_t)resultOrder
{
  return self->_resultOrder;
}

- (void)setResultOrder:(int64_t)a3
{
  self->_resultOrder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
  objc_storeStrong((id *)&self->_invocationMethod, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_searchID, 0);
}

@end
