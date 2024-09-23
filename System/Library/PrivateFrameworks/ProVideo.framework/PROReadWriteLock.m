@implementation PROReadWriteLock

- (PROReadWriteLock)init
{
  PROReadWriteLock *v2;
  PROReadWriteLock *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PROReadWriteLock;
  v2 = -[PROReadWriteLock init](&v5, sel_init);
  v3 = v2;
  if (v2)
    pthread_rwlock_init(&v2->lock, 0);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  pthread_rwlock_destroy(&self->lock);
  v3.receiver = self;
  v3.super_class = (Class)PROReadWriteLock;
  -[PROReadWriteLock dealloc](&v3, sel_dealloc);
}

- (void)lockForWriting
{
  pthread_rwlock_wrlock(&self->lock);
}

- (void)lockForReading
{
  pthread_rwlock_rdlock(&self->lock);
}

- (void)unlock
{
  pthread_rwlock_unlock(&self->lock);
}

@end
