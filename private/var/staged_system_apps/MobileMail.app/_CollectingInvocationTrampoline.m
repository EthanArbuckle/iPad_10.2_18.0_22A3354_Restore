@implementation _CollectingInvocationTrampoline

- (_CollectingInvocationTrampoline)initWithCollection:(id)a3 allMustMatch:(BOOL)a4
{
  id v7;
  _CollectingInvocationTrampoline *v8;
  _CollectingInvocationTrampoline *v9;
  NSFastEnumeration *v10;
  _CollectingInvocationTrampoline *v11;
  objc_super v13[4];
  objc_super v14;
  _BYTE v15[128];

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_CollectingInvocationTrampoline;
  v8 = -[_CollectingInvocationTrampoline init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_collection, a3);
    v9->_allMustMatch = a4;
    memset(v13, 0, sizeof(v13));
    v10 = v9->_collection;
    if (-[NSFastEnumeration countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", v13, v15, 16))
    {
      objc_storeStrong(&v9->_first, *(id *)v13[0].super_class);
    }

    v11 = v9;
  }

  return v9;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  _CollectingInvocationTrampoline *v4;
  objc_super v6;

  v4 = self;
  v6.receiver = self;
  v6.super_class = (Class)_CollectingInvocationTrampoline;
  if (!-[_CollectingInvocationTrampoline respondsToSelector:](&v6, "respondsToSelector:"))
    v4 = (_CollectingInvocationTrampoline *)v4->_first;
  return (id)objc_claimAutoreleasedReturnValue(-[_CollectingInvocationTrampoline methodSignatureForSelector:](v4, "methodSignatureForSelector:", a3));
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CollectingInvocationTrampoline;
  if (-[_CollectingInvocationTrampoline respondsToSelector:](&v7, "respondsToSelector:"))
    v5 = 1;
  else
    v5 = objc_opt_respondsToSelector(self->_first, a3);
  return v5 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  char allMustMatch;
  NSFastEnumeration *v6;
  id v7;
  uint64_t v8;
  void *i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  _BYTE v16[128];

  v4 = a3;
  allMustMatch = self->_allMustMatch;
  v15 = allMustMatch;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_collection;
  v7 = -[NSFastEnumeration countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(v4, "invokeWithTarget:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i));
        v10 = -86;
        objc_msgSend(v4, "getReturnValue:", &v10);
        if (self->_allMustMatch)
          allMustMatch &= v10;
        else
          allMustMatch |= v10;
        v15 = allMustMatch;
      }
      v7 = -[NSFastEnumeration countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "setReturnValue:", &v15);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong(&self->_first, 0);
}

@end
