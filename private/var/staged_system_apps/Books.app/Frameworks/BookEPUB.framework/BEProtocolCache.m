@implementation BEProtocolCache

- (void)dealloc
{
  objc_super v3;

  -[BEProtocolCacheItemProvider clearCache](self->_itemProvider, "clearCache");
  v3.receiver = self;
  v3.super_class = (Class)BEProtocolCache;
  -[BEProtocolCache dealloc](&v3, "dealloc");
}

+ (BEProtocolCache)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2B290;
  block[3] = &unk_377C50;
  block[4] = a1;
  if (qword_3C1B20 != -1)
    dispatch_once(&qword_3C1B20, block);
  return (BEProtocolCache *)(id)qword_3C1B18;
}

- (id)cacheItemForDatabaseKey:(id)a3
{
  return -[BEProtocolCacheItemProvider cacheItemForDatabaseKey:](self->_itemProvider, "cacheItemForDatabaseKey:", a3);
}

- (void)clearCache
{
  -[BEProtocolCacheItemProvider clearCache](self->_itemProvider, "clearCache");
}

- (void)clearCacheForDatabaseKey:(id)a3
{
  -[BEProtocolCacheItemProvider clearCacheForDatabaseKey:](self->_itemProvider, "clearCacheForDatabaseKey:", a3);
}

- (void)clearCacheForDatabaseKeys:(id)a3
{
  -[BEProtocolCacheItemProvider clearCacheForDatabaseKeys:](self->_itemProvider, "clearCacheForDatabaseKeys:", a3);
}

- (BEProtocolCacheItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_itemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

@end
