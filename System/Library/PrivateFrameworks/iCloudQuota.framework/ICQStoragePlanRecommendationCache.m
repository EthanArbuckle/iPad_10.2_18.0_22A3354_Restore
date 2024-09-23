@implementation ICQStoragePlanRecommendationCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_21);
  return (id)sharedInstance_recommendationCache;
}

void __51__ICQStoragePlanRecommendationCache_sharedInstance__block_invoke()
{
  ICQStoragePlanRecommendationCache *v0;
  void *v1;

  v0 = objc_alloc_init(ICQStoragePlanRecommendationCache);
  v1 = (void *)sharedInstance_recommendationCache;
  sharedInstance_recommendationCache = (uint64_t)v0;

}

- (ICQStoragePlanRecommendationCache)init
{
  ICQStoragePlanRecommendationCache *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICQStoragePlanRecommendationCache;
  result = -[ICQStoragePlanRecommendationCache init](&v3, sel_init);
  if (result)
    result->_cacheLock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)setExtraQuotaNeeded:(id)a3 expiry:(id)a4
{
  NSNumber *v6;
  NSDate *v7;
  NSNumber *extraQuotaNeeded;
  NSNumber *v9;
  NSDate *expiry;

  v6 = (NSNumber *)a3;
  v7 = (NSDate *)a4;
  os_unfair_lock_lock(&self->_cacheLock);
  extraQuotaNeeded = self->_extraQuotaNeeded;
  self->_extraQuotaNeeded = v6;
  v9 = v6;

  expiry = self->_expiry;
  self->_expiry = v7;

  os_unfair_lock_unlock(&self->_cacheLock);
}

- (id)extraQuotaNeeded
{
  os_unfair_lock_s *p_cacheLock;
  NSDate *expiry;
  void *v5;
  double v6;
  double v7;
  NSNumber *v8;

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  expiry = self->_expiry;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceDate:](expiry, "timeIntervalSinceDate:", v5);
  v7 = v6;

  if (v7 <= 0.0)
    v8 = 0;
  else
    v8 = self->_extraQuotaNeeded;
  os_unfair_lock_unlock(p_cacheLock);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiry, 0);
  objc_storeStrong((id *)&self->_extraQuotaNeeded, 0);
}

@end
