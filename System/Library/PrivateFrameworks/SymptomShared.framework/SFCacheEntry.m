@implementation SFCacheEntry

- (SFCacheEntry)initWithCacheItem:(id)a3
{
  id v5;
  SFCacheEntry *v6;
  SFCacheEntry *v7;
  uint64_t v8;
  NSDate *lastUsed;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFCacheEntry;
  v6 = -[SFCacheEntry init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_item, a3);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    lastUsed = v7->_lastUsed;
    v7->_lastUsed = (NSDate *)v8;

  }
  return v7;
}

- (NSObject)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (NSDate)lastUsed
{
  return self->_lastUsed;
}

- (void)setLastUsed:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsed, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
