@implementation SPAdvertisementCacheSearchResult

- (SPAdvertisementCacheSearchResult)initWithBeaconAdvertisements:(id)a3 searchResultMarker:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  SPAdvertisementCacheSearchResult *v11;
  SPAdvertisementCacheSearchResult *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SPAdvertisementCacheSearchResult;
  v11 = -[SPAdvertisementCacheSearchResult init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[SPAdvertisementCacheSearchResult setBeaconAdvertisements:](v11, "setBeaconAdvertisements:", v8);
    -[SPAdvertisementCacheSearchResult setSearchResultMarker:](v12, "setSearchResultMarker:", v9);
    -[SPAdvertisementCacheSearchResult setError:](v12, "setError:", v10);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPAdvertisementCacheSearchResult)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("beaconAdvertisements"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPAdvertisementCacheSearchResult setBeaconAdvertisements:](self, "setBeaconAdvertisements:", v8);

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchResultMarker"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPAdvertisementCacheSearchResult setSearchResultMarker:](self, "setSearchResultMarker:", v9);

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPAdvertisementCacheSearchResult setError:](self, "setError:", v10);
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SPAdvertisementCacheSearchResult beaconAdvertisements](self, "beaconAdvertisements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("beaconAdvertisements"));

  -[SPAdvertisementCacheSearchResult searchResultMarker](self, "searchResultMarker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("searchResultMarker"));

  -[SPAdvertisementCacheSearchResult error](self, "error");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("error"));

}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSArray)beaconAdvertisements
{
  return self->_beaconAdvertisements;
}

- (void)setBeaconAdvertisements:(id)a3
{
  objc_storeStrong((id *)&self->_beaconAdvertisements, a3);
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
  objc_storeStrong((id *)&self->_beaconAdvertisements, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
