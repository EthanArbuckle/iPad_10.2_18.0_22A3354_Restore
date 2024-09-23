@implementation PPSpotlightWritebackDissectorCacheEntry

- (PPSpotlightWritebackDissectorCacheEntry)initWithCachingDate:(id)a3 score:(double)a4
{
  id v7;
  PPSpotlightWritebackDissectorCacheEntry *v8;
  PPSpotlightWritebackDissectorCacheEntry *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPSpotlightWritebackDissectorCacheEntry;
  v8 = -[PPSpotlightWritebackDissectorCacheEntry init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_cachingDate, a3);
    v9->_score = a4;
  }

  return v9;
}

- (NSDate)cachingDate
{
  return self->_cachingDate;
}

- (double)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachingDate, 0);
}

@end
