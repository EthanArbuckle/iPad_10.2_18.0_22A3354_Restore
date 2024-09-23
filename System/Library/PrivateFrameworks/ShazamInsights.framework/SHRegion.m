@implementation SHRegion

- (SHRegion)initWithGeohash:(id)a3
{
  id v5;
  SHRegion *v6;
  SHRegion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHRegion;
  v6 = -[SHRegion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_geohash, a3);

  return v7;
}

- (SHRegion)initWithLocation:(id)a3
{
  id v5;
  SHRegion *v6;
  SHRegion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHRegion;
  v6 = -[SHRegion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_location, a3);

  return v7;
}

- (NSString)geohash
{
  return self->_geohash;
}

- (CLLocation)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_geohash, 0);
}

@end
