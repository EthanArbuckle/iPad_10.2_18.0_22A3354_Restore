@implementation APPersistentCacheStoreProvider

+ (APPersistentCachedStoreTransactionalProtocol)persistentCacheStore
{
  return (APPersistentCachedStoreTransactionalProtocol *)objc_loadWeakRetained(&qword_10026D108);
}

+ (void)assignPersistentCacheStore:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained(&qword_10026D108);

  if (!WeakRetained)
    objc_storeWeak(&qword_10026D108, obj);

}

@end
