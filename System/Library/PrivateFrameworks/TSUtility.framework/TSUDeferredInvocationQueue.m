@implementation TSUDeferredInvocationQueue

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSUDeferredInvocationQueue;
  -[TSUDeferredInvocationQueue dealloc](&v3, sel_dealloc);
}

- (id)prepareWithInvocationTarget:(id)a3
{
  *((_QWORD *)self + 2) = a3;
  return self;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)objc_msgSend(self->_target, "methodSignatureForSelector:", a3);
}

- (void)forwardInvocation:(id)a3
{
  if (!self->_invocations)
    self->_invocations = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(a3, "setTarget:", self->_target);
  self->_target = 0;
  -[NSMutableArray addObject:](self->_invocations, "addObject:", a3);
}

- (void)performInvocations
{
  NSMutableArray *invocations;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  invocations = self->_invocations;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](invocations, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(invocations);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "invoke");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](invocations, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  self->_invocations = 0;
}

@end
