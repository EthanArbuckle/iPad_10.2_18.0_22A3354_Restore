@implementation CKKSSelves

- (CKKSSelves)initWithCurrent:(id)a3 allSelves:(id)a4
{
  id v7;
  id v8;
  CKKSSelves *v9;
  CKKSSelves *v10;
  uint64_t v11;
  NSSet *allSelves;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKKSSelves;
  v9 = -[CKKSSelves init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_currentSelf, a3);
    if (v8)
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "setByAddingObject:", v7));
    }
    else if (v7)
    {
      v11 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v7));
    }
    else
    {
      v11 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    }
    allSelves = v10->_allSelves;
    v10->_allSelves = (NSSet *)v11;

  }
  return v10;
}

- (id)description
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSelves allSelves](self, "allSelves"));
  v4 = (__CFString *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSelves currentSelf](self, "currentSelf"));
  -[__CFString removeObject:](v4, "removeObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSelves currentSelf](self, "currentSelf"));
  v7 = -[__CFString count](v4, "count");
  v8 = CFSTR("(no past selves)");
  if (v7)
    v8 = v4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKKSSelves: %@ %@>"), v6, v8));

  return v9;
}

- (CKKSSelfPeer)currentSelf
{
  return (CKKSSelfPeer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCurrentSelf:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSSet)allSelves
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAllSelves:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSelves, 0);
  objc_storeStrong((id *)&self->_currentSelf, 0);
}

@end
