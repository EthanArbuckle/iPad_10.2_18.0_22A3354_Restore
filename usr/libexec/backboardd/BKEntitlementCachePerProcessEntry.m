@implementation BKEntitlementCachePerProcessEntry

- (NSMutableDictionary)entitlementCache
{
  return self->_entitlementCache;
}

- (void)setEntitlementCache:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementCache, a3);
}

- (void)setDeathWatcher:(id)a3
{
  objc_storeStrong((id *)&self->_deathWatcher, a3);
}

- (BSProcessDeathWatcher)deathWatcher
{
  return self->_deathWatcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deathWatcher, 0);
  objc_storeStrong((id *)&self->_entitlementCache, 0);
}

@end
