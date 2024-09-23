@implementation SSPlistCacheObject

+ (id)cacheObjectTypeIdentifier
{
  return CFSTR("bplist");
}

- (void)setPlist:(id)a3
{
  NSDictionary *plist;

  plist = self->_plist;
  if (plist != a3)
  {

    self->_plist = (NSDictionary *)a3;
  }
}

- (id)plist
{
  return self->_plist;
}

- (id)cacheObjectTypeIdentifier
{
  return +[SSPlistCacheObject cacheObjectTypeIdentifier](SSPlistCacheObject, "cacheObjectTypeIdentifier");
}

- (id)cacheObjectDataRepresentation
{
  return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", self->_plist, 100, 0, 0);
}

- (SSPlistCacheObject)initWithCacheObjectDataRepresentation:(id)a3
{
  SSPlistCacheObject *v4;

  v4 = -[SSPlistCacheObject init](self, "init");
  if (v4)
    v4->_plist = (NSDictionary *)(id)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSPlistCacheObject;
  -[SSPlistCacheObject dealloc](&v3, sel_dealloc);
}

@end
