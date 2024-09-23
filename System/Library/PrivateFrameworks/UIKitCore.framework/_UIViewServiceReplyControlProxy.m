@implementation _UIViewServiceReplyControlProxy

+ (id)proxyWithTarget:(id)a3
{
  id v3;
  _UIViewServiceReplyControlProxy *v4;
  id target;
  id v6;
  NSLock *v7;
  NSLock *lock;

  v3 = a3;
  v4 = objc_alloc_init(_UIViewServiceReplyControlProxy);
  target = v4->_target;
  v4->_target = v3;
  v6 = v3;

  v7 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
  lock = v4->_lock;
  v4->_lock = v7;

  return v4;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)objc_msgSend(self->_target, "methodSignatureForSelector:", a3);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_target;
}

- (id)_awaitingReply
{
  _UIViewServiceReplyAwaitingTrampoline *v3;
  _UIViewServiceReplyAwaitingTrampoline *awaitingTrampoline;

  -[NSLock lock](self->_lock, "lock");
  if (!self->_awaitingTrampoline)
  {
    +[_UITargetedProxy proxyWithTarget:](_UIViewServiceReplyAwaitingTrampoline, "proxyWithTarget:", self->_target);
    v3 = (_UIViewServiceReplyAwaitingTrampoline *)objc_claimAutoreleasedReturnValue();
    awaitingTrampoline = self->_awaitingTrampoline;
    self->_awaitingTrampoline = v3;

  }
  -[NSLock unlock](self->_lock, "unlock");
  return objc_retainAutorelease(self->_awaitingTrampoline);
}

- (id)_deliveringRepliesAsynchronously
{
  _UIViewServiceReplyControlTrampoline *v3;
  _UIViewServiceReplyControlTrampoline *controlTrampoline;

  -[NSLock lock](self->_lock, "lock");
  if (!self->_controlTrampoline)
  {
    +[_UITargetedProxy proxyWithTarget:](_UIViewServiceReplyControlTrampoline, "proxyWithTarget:", self->_target);
    v3 = (_UIViewServiceReplyControlTrampoline *)objc_claimAutoreleasedReturnValue();
    controlTrampoline = self->_controlTrampoline;
    self->_controlTrampoline = v3;

  }
  -[NSLock unlock](self->_lock, "unlock");
  return objc_retainAutorelease(self->_controlTrampoline);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_awaitingTrampoline, 0);
  objc_storeStrong((id *)&self->_controlTrampoline, 0);
  objc_storeStrong(&self->_target, 0);
}

@end
