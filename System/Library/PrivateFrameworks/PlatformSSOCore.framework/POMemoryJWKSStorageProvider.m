@implementation POMemoryJWKSStorageProvider

- (POMemoryJWKSStorageProvider)init
{
  POMemoryJWKSStorageProvider *v2;
  uint64_t v3;
  NSMutableDictionary *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)POMemoryJWKSStorageProvider;
  v2 = -[POMemoryJWKSStorageProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)jwksCacheForExtensionIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", a3);
}

- (void)setJwksCache:(id)a3 forExtensionIdentifier:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", a3, a4);
}

- (NSMutableDictionary)cache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
