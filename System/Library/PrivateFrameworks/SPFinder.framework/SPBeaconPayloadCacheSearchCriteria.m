@implementation SPBeaconPayloadCacheSearchCriteria

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPBeaconPayloadCacheSearchCriteria)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchResultMarker"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconPayloadCacheSearchCriteria setSearchResultMarker:](self, "setSearchResultMarker:", v5);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fetchLimit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPBeaconPayloadCacheSearchCriteria setFetchLimit:](self, "setFetchLimit:", v6);
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SPBeaconPayloadCacheSearchCriteria searchResultMarker](self, "searchResultMarker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("searchResultMarker"));

  -[SPBeaconPayloadCacheSearchCriteria fetchLimit](self, "fetchLimit");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("fetchLimit"));

}

- (SPSearchResultMarker)searchResultMarker
{
  return self->_searchResultMarker;
}

- (void)setSearchResultMarker:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultMarker, a3);
}

- (NSNumber)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchLimit, 0);
  objc_storeStrong((id *)&self->_searchResultMarker, 0);
}

@end
