@implementation RCOnce

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

- (BOOL)trigger
{
  BOOL v3;

  -[RCMutexLock lock](self->_lock, "lock");
  v3 = !-[RCOnce finished](self, "finished");
  -[RCOnce setFinished:](self, "setFinished:", 1);
  -[RCMutexLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (RCOnce)initWithOptions:(unint64_t)a3
{
  char v3;
  RCOnce *v4;
  RCOnce *v5;
  RCMutexLock *v6;
  RCMutexLock *lock;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RCOnce;
  v4 = -[RCOnce init](&v9, sel_init);
  v5 = v4;
  if ((v3 & 1) != 0 && v4)
  {
    v6 = objc_alloc_init(RCMutexLock);
    lock = v5->_lock;
    v5->_lock = v6;

  }
  return v5;
}

- (RCOnce)init
{
  return -[RCOnce initWithOptions:](self, "initWithOptions:", 0);
}

- (void)executeOnce:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  -[RCMutexLock lock](self->_lock, "lock");
  if (!-[RCOnce finished](self, "finished"))
  {
    if (v4)
      v4[2]();
    -[RCOnce setFinished:](self, "setFinished:", 1);
  }
  -[RCMutexLock unlock](self->_lock, "unlock");

}

- (BOOL)hasBeenTriggered
{
  BOOL v3;

  -[RCMutexLock lock](self->_lock, "lock");
  v3 = -[RCOnce finished](self, "finished");
  -[RCMutexLock unlock](self->_lock, "unlock");
  return v3;
}

- (RCMutexLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

@end
