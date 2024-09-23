@implementation _UIQueueingProxy

+ (id)proxyWithTarget:(id)a3 shouldSuspendInvocationBlock:(id)a4
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS____UIQueueingProxy;
  v5 = a4;
  objc_msgSendSuper2(&v12, sel_proxyWithTarget_, a3);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v12.receiver, v12.super_class);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v6[4];
  v6[4] = v7;

  v9 = objc_msgSend(v5, "copy");
  v10 = (void *)v6[5];
  v6[5] = v9;

  return v6;
}

+ (id)proxyWithTarget:(id)a3
{
  return (id)objc_msgSend(a1, "proxyWithTarget:shouldSuspendInvocationBlock:", a3, 0);
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  uint64_t (**shouldSuspendInvocationBlock)(id, id);
  int v6;
  BOOL v7;
  id v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_suspensionCount
    || ((shouldSuspendInvocationBlock = (uint64_t (**)(id, id))self->_shouldSuspendInvocationBlock) == 0
      ? (v6 = 1)
      : (v6 = shouldSuspendInvocationBlock[2](shouldSuspendInvocationBlock, v4)),
        !self->_bypassSuspension ? (v7 = v6 == 0) : (v7 = 1),
        v7))
  {
    os_unfair_lock_unlock(&self->_lock);
    v13.receiver = self;
    v13.super_class = (Class)_UIQueueingProxy;
    -[_UITargetedProxy forwardInvocation:](&v13, sel_forwardInvocation_, v4);
  }
  else
  {
    objc_msgSend(v4, "retainArguments");
    -[NSMutableArray addObject:](self->_queuedInvocations, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v4, "methodSignature");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = strcmp((const char *)objc_msgSend(v8, "methodReturnType"), "v");

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0C99DA0];
      v11 = *MEMORY[0x1E0C99778];
      NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "raise:format:", v11, CFSTR("%@ can only handle messages which do not have a return value when it is suspended. (%@)"), self, v12);

    }
  }

}

- (void)suspend
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  ++self->_suspensionCount;
  os_unfair_lock_unlock(p_lock);
}

- (void)_dispatchSuspendedMessages
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_queuedInvocations, "copy");
  -[NSMutableArray removeAllObjects](self->_queuedInvocations, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v11.receiver = self;
        v11.super_class = (Class)_UIQueueingProxy;
        -[_UITargetedProxy forwardInvocation:](&v11, sel_forwardInvocation_, v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)resume
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_suspensionCount - 1;
  self->_suspensionCount = v4;
  os_unfair_lock_unlock(p_lock);
  if (!v4)
    -[_UIQueueingProxy _dispatchSuspendedMessages](self, "_dispatchSuspendedMessages");
}

- (BOOL)bypassSuspensionForSynchronousReply
{
  _UIQueueingProxy *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_bypassSuspension;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setBypassSuspensionForSynchronousReply:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_bypassSuspension = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)removeAllEnqueuedInvocations
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray removeAllObjects](self->_queuedInvocations, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v3;
  char v4;

  -[_UITargetedProxy _target](self, "_target");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITargetedProxy _target](self, "_target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; target: %@; suspension count: %ld>"),
    v5,
    self,
    v6,
    self->_suspensionCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldSuspendInvocationBlock, 0);
  objc_storeStrong((id *)&self->_queuedInvocations, 0);
}

@end
