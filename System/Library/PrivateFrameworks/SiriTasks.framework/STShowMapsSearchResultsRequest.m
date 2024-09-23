@implementation STShowMapsSearchResultsRequest

- (id)_initWithLocation:(id)a3 extSessionGuid:(id)a4 extSessionGuidCreatedTimestamp:(id)a5
{
  id v9;
  id v10;
  id v11;
  STShowMapsSearchResultsRequest *v12;
  id *p_isa;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)STShowMapsSearchResultsRequest;
  v12 = -[AFSiriRequest init](&v15, sel_init);
  p_isa = (id *)&v12->super.super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_searchResults, a3);
    objc_storeStrong(p_isa + 6, a4);
    objc_storeStrong(p_isa + 7, a5);
  }

  return p_isa;
}

- (id)searchResults
{
  return self->_searchResults;
}

- (id)extSessionGuid
{
  return self->_extSessionGuid;
}

- (id)extSessionGuidCreatedTimestamp
{
  return self->_extSessionGuidCreatedTimestamp;
}

- (id)createResponse
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE092F0]), "_initWithRequest:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STShowMapsSearchResultsRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchResults, CFSTR("kSTShowMapsSearchResultsRequestResultsKey"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_extSessionGuid, CFSTR("kSTShowMapsSearchResultsRequestExtSessionGuidKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_extSessionGuidCreatedTimestamp, CFSTR("kSTShowMapsSearchResultsRequestExtSessionGuidCreatedTimestampKey"));

}

- (STShowMapsSearchResultsRequest)initWithCoder:(id)a3
{
  id v4;
  STShowMapsSearchResultsRequest *v5;
  uint64_t v6;
  STSiriLocation *searchResults;
  uint64_t v8;
  NSString *extSessionGuid;
  uint64_t v10;
  NSDate *extSessionGuidCreatedTimestamp;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STShowMapsSearchResultsRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSTShowMapsSearchResultsRequestResultsKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    searchResults = v5->_searchResults;
    v5->_searchResults = (STSiriLocation *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSTShowMapsSearchResultsRequestExtSessionGuidKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    extSessionGuid = v5->_extSessionGuid;
    v5->_extSessionGuid = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSTShowMapsSearchResultsRequestExtSessionGuidCreatedTimestampKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    extSessionGuidCreatedTimestamp = v5->_extSessionGuidCreatedTimestamp;
    v5->_extSessionGuidCreatedTimestamp = (NSDate *)v10;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extSessionGuidCreatedTimestamp, 0);
  objc_storeStrong((id *)&self->_extSessionGuid, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
