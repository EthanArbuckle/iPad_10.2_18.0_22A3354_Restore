@implementation SKWaitableAggregate

- (SKWaitableAggregate)initWithWaitables:(id)a3
{
  id v5;
  SKWaitableAggregate *v6;
  SKWaitableAggregate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKWaitableAggregate;
  v6 = -[SKWaitableAggregate init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_waitables, a3);

  return v7;
}

- (BOOL)waitWithError:(id *)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  char v9;
  void *i;
  void *v11;
  unsigned __int8 v12;
  id v13;
  void *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKWaitableAggregate waitables](self, "waitables"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    v9 = 1;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v16 = 0;
        v12 = objc_msgSend(v11, "waitWithError:", &v16);
        v13 = v16;
        v14 = v13;
        if (!v7 && v13)
          v7 = v13;
        v9 &= v12;

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v9 = 1;
  }

  if (a3)
    *a3 = objc_retainAutorelease(v7);

  return v9;
}

- (NSArray)waitables
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setWaitables:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitables, 0);
}

@end
