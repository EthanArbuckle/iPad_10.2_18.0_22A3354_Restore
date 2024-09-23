@implementation SSPlistCacheObjectFactory

- (BOOL)supportsTypeIdentifier:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", +[SSPlistCacheObject cacheObjectTypeIdentifier](SSPlistCacheObject, "cacheObjectTypeIdentifier"));
}

- (id)cachedObjectWithDataRepresentation:(id)a3 typeIdentifier:(id)a4
{
  return -[SSPlistCacheObject initWithCacheObjectDataRepresentation:]([SSPlistCacheObject alloc], "initWithCacheObjectDataRepresentation:", a3);
}

@end
