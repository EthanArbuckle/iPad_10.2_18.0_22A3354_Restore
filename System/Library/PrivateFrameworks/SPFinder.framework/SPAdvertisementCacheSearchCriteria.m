@implementation SPAdvertisementCacheSearchCriteria

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPAdvertisementCacheSearchCriteria)initWithCoder:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchResultMarker"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPAdvertisementCacheSearchCriteria setSearchResultMarker:](self, "setSearchResultMarker:", v5);
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPAdvertisementCacheSearchCriteria searchResultMarker](self, "searchResultMarker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("searchResultMarker"));

}

- (SPSearchResultMarker)searchResultMarker
{
  return self->_searchResultMarker;
}

- (void)setSearchResultMarker:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultMarker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultMarker, 0);
}

@end
