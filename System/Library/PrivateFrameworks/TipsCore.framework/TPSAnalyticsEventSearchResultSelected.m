@implementation TPSAnalyticsEventSearchResultSelected

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventSearchResultSelected)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventSearchResultSelected *v5;
  uint64_t v6;
  NSString *searchID;
  uint64_t v8;
  NSString *searchTerm;
  uint64_t v10;
  NSString *tipID;
  uint64_t v12;
  NSString *collectionID;
  uint64_t v14;
  NSString *correlationID;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TPSAnalyticsEventSearchResultSelected;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v17, sel_initWithCoder_, v4);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_id"));
    v10 = objc_claimAutoreleasedReturnValue();
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collection_id"));
    v12 = objc_claimAutoreleasedReturnValue();
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_correlation_id"));
    v14 = objc_claimAutoreleasedReturnValue();
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventSearchResultSelected;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchID, CFSTR("search_id"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchTerm, CFSTR("search_term"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, CFSTR("tip_id"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_collectionID, CFSTR("collection_id"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_correlationID, CFSTR("tip_correlation_id"));

}

- (id)_initWithSearchID:(id)a3 searchTerm:(id)a4 tipID:(id)a5 collectionID:(id)a6 correlationID:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  TPSAnalyticsEventSearchResultSelected *v17;
  id v19;
  id v20;
  objc_super v21;

  v20 = a3;
  v19 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)TPSAnalyticsEventSearchResultSelected;
  v17 = -[TPSAnalyticsEvent initWithDate:](&v21, sel_initWithDate_, v16);

  if (v17)
  {
    objc_storeStrong((id *)&v17->_searchID, a3);
    objc_storeStrong((id *)&v17->_searchTerm, a4);
    objc_storeStrong((id *)&v17->_tipID, a5);
    objc_storeStrong((id *)&v17->_collectionID, a6);
    objc_storeStrong((id *)&v17->_correlationID, a7);
  }

  return v17;
}

+ (id)eventWithSearchID:(id)a3 searchTerm:(id)a4 tipID:(id)a5 collectionID:(id)a6 correlationID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithSearchID:searchTerm:tipID:collectionID:correlationID:", v16, v15, v14, v13, v12);

  return v17;
}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("search_result_selected"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_searchID, CFSTR("search_id"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_searchTerm, CFSTR("search_term"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_tipID, CFSTR("tip_id"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_collectionID, CFSTR("collection_id"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_correlationID, CFSTR("tip_correlation_id"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("u65_flag"));

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

- (NSString)tipID
{
  return self->_tipID;
}

- (void)setTipID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_searchID, 0);
}

@end
