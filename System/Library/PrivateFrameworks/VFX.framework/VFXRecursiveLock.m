@implementation VFXRecursiveLock

- (VFXRecursiveLock)init
{
  VFXRecursiveLock *v2;
  objc_super v4;
  pthread_mutexattr_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VFXRecursiveLock;
  v2 = -[VFXRecursiveLock init](&v4, sel_init);
  if (v2)
  {
    v5.__sig = 0;
    *(_QWORD *)v5.__opaque = 0;
    pthread_mutexattr_init(&v5);
    pthread_mutexattr_settype(&v5, 2);
    pthread_mutexattr_setpolicy_np(&v5, 1);
    pthread_mutex_init(&v2->_mutex, &v5);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_mutex);
  v3.receiver = self;
  v3.super_class = (Class)VFXRecursiveLock;
  -[VFXRecursiveLock dealloc](&v3, sel_dealloc);
}

- (void)lock
{
  pthread_mutex_lock(&self->_mutex);
}

- (void)unlock
{
  pthread_mutex_unlock(&self->_mutex);
}

@end
