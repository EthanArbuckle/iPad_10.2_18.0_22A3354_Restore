@implementation SPFinderInterface

- (SPAdvertisementCache)advertisementCache
{
  SPAdvertisementCache *advertisementCache;
  SPAdvertisementCache *v4;
  SPAdvertisementCache *v5;

  advertisementCache = self->_advertisementCache;
  if (!advertisementCache)
  {
    v4 = (SPAdvertisementCache *)objc_opt_new();
    v5 = self->_advertisementCache;
    self->_advertisementCache = v4;

    advertisementCache = self->_advertisementCache;
  }
  return advertisementCache;
}

- (id)beaconPayloadCache
{
  SPAdvertisementCache *advertisementCache;
  SPAdvertisementCache *v4;
  SPAdvertisementCache *v5;

  advertisementCache = self->_advertisementCache;
  if (!advertisementCache)
  {
    v4 = (SPAdvertisementCache *)objc_opt_new();
    v5 = self->_advertisementCache;
    self->_advertisementCache = v4;

    advertisementCache = self->_advertisementCache;
  }
  return advertisementCache;
}

- (id)finderStateManager
{
  return (id)objc_opt_new();
}

- (id)stateManager
{
  return (id)objc_opt_new();
}

- (void)setAdvertisementCache:(id)a3
{
  objc_storeStrong((id *)&self->_advertisementCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisementCache, 0);
}

@end
