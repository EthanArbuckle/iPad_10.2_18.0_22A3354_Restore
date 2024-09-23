@implementation APCacheableSynchronizedObject

- (APCacheableSynchronizedObject)initWithIdentifier:(id)a3
{
  APCacheableSynchronizedObject *v3;
  APUnfairRecursiveLock *v4;
  APUnfairRecursiveLock *lock;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)APCacheableSynchronizedObject;
  v3 = -[APCacheableBaseObject initWithIdentifier:](&v7, "initWithIdentifier:", a3);
  if (v3)
  {
    v4 = (APUnfairRecursiveLock *)objc_alloc_init((Class)APUnfairRecursiveLock);
    lock = v3->_lock;
    v3->_lock = v4;

  }
  return v3;
}

- (void)lockObject
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[APCacheableSynchronizedObject lock](self, "lock"));
  objc_msgSend(v2, "lock");

}

- (void)unlockObject
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[APCacheableSynchronizedObject lock](self, "lock"));
  objc_msgSend(v2, "unlock");

}

- (APUnfairRecursiveLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APCacheableSynchronizedObject)initWithCoder:(id)a3
{
  APCacheableSynchronizedObject *v3;
  APUnfairRecursiveLock *v4;
  APUnfairRecursiveLock *lock;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)APCacheableSynchronizedObject;
  v3 = -[APCacheableBaseObject initWithCoder:](&v7, "initWithCoder:", a3);
  if (v3)
  {
    v4 = (APUnfairRecursiveLock *)objc_alloc_init((Class)APUnfairRecursiveLock);
    lock = v3->_lock;
    v3->_lock = v4;

  }
  return v3;
}

@end
