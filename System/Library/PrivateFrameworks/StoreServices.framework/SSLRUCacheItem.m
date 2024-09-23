@implementation SSLRUCacheItem

- (SSLRUCacheItem)initWithKey:(id)a3 object:(id)a4
{
  id v6;
  SSLRUCacheItem *v7;
  SSLRUCacheItem *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSLRUCacheItem;
  v7 = -[SSDoubleLinkedListNode initWithObject:](&v10, sel_initWithObject_, a4);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_key, v6);

  return v8;
}

- (NSCopying)key
{
  return (NSCopying *)objc_loadWeakRetained((id *)&self->_key);
}

- (void)setKey:(id)a3
{
  objc_storeWeak((id *)&self->_key, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_key);
}

@end
