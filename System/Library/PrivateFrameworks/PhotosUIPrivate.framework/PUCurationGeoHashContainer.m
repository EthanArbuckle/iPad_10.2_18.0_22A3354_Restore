@implementation PUCurationGeoHashContainer

- (PUCurationGeoHashContainer)initWithGeoHash:(id)a3 assetUUIDs:(id)a4 cityName:(id)a5
{
  id v9;
  id v10;
  id v11;
  PUCurationGeoHashContainer *v12;
  PUCurationGeoHashContainer *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PUCurationGeoHashContainer;
  v12 = -[PUCurationGeoHashContainer init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_geoHash, a3);
    objc_storeStrong((id *)&v13->_assetUUIDs, a4);
    v13->_assetCount = -[NSArray count](v13->_assetUUIDs, "count");
    objc_storeStrong((id *)&v13->_cityName, a5);
  }

  return v13;
}

- (NSString)geoHash
{
  return self->_geoHash;
}

- (int64_t)assetCount
{
  return self->_assetCount;
}

- (NSArray)assetUUIDs
{
  return self->_assetUUIDs;
}

- (NSString)cityName
{
  return self->_cityName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cityName, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
  objc_storeStrong((id *)&self->_geoHash, 0);
}

@end
