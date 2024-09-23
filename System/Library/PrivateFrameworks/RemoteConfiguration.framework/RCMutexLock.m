@implementation RCMutexLock

- (void)unlock
{
  pthread_mutex_unlock(&self->_lock);
}

- (void)lock
{
  pthread_mutex_lock(&self->_lock);
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)RCMutexLock;
  -[RCMutexLock dealloc](&v3, sel_dealloc);
}

- (void)performWithLockSync:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  -[RCMutexLock lock](self, "lock");
  if (v4)
    v4[2]();
  -[RCMutexLock unlock](self, "unlock");

}

- (RCMutexLock)init
{
  return -[RCMutexLock initWithOptions:](self, "initWithOptions:", 0);
}

- (RCMutexLock)initWithOptions:(unint64_t)a3
{
  char v3;
  RCMutexLock *v4;
  objc_super v6;
  pthread_mutexattr_t v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)RCMutexLock;
  v4 = -[RCMutexLock init](&v6, sel_init);
  if (v4)
  {
    v7.__sig = 0;
    *(_QWORD *)v7.__opaque = 0;
    pthread_mutexattr_init(&v7);
    pthread_mutexattr_settype(&v7, 2 * (v3 & 1));
    pthread_mutex_init(&v4->_lock, &v7);
  }
  return v4;
}

@end
