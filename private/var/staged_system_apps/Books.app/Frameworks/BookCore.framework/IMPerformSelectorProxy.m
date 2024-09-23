@implementation IMPerformSelectorProxy

- (IMPerformSelectorProxy)initWithTarget:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *signatures;

  objc_storeWeak(&self->_weakTarget, a3);
  v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  signatures = self->_signatures;
  self->_signatures = v4;

  return self;
}

- (void)performSelector:(SEL)a3 withObject:(id)a4 afterDelay:(double)a5
{
  id v8;
  id v9;

  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", NSDefaultRunLoopMode));
  -[IMPerformSelectorProxy performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", a3, v8, v9, a5);

}

- (void)performSelector:(SEL)a3 withObject:(id)a4 afterDelay:(double)a5 inModes:(id)a6
{
  id v11;
  id v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v11 = a6;
  v12 = a4;
  v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sel_getName(a3));
  v17 = (id)objc_claimAutoreleasedReturnValue(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_signatures, "objectForKey:"));

  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IMPerformSelectorProxy target](self, "target"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "methodSignatureForSelector:", a3));

    -[NSMutableDictionary setObject:forKey:](self->_signatures, "setObject:forKey:", v16, v17);
  }
  ((void (*)(IMPerformSelectorProxy *, SEL, SEL, id, id, double))+[NSObject instanceMethodForSelector:](NSObject, "instanceMethodForSelector:", a2))(self, a2, a3, v12, v11, a5);

}

- (void)teardown
{
  objc_storeWeak(&self->_weakTarget, 0);
  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  uint64_t v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;

  if ((objc_opt_respondsToSelector(self, a3) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(-[IMPerformSelectorProxy target](self, "target"));
    v7 = (void *)v6;
    if (v6)
    {
      v5 = objc_opt_respondsToSelector(v6, a3);
    }
    else
    {
      v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sel_getName(a3));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_signatures, "objectForKey:", v9));
      v5 = v10 != 0;

    }
  }
  return v5 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  NSString *v4;
  void *v5;
  void *v6;

  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sel_getName(a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_signatures, "objectForKey:", v5));

  return v6;
}

- (void)forwardInvocation:(id)a3
{
  id v3;
  id v4;
  int v5;
  uint64_t v6;

  v3 = a3;
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "methodSignature")));
  v5 = strcmp((const char *)objc_msgSend(v4, "methodReturnType"), "@");

  if (!v5)
  {
    v6 = 0;
    objc_msgSend(v3, "setReturnValue:", &v6);
  }

}

- (id)target
{
  return objc_loadWeakRetained(&self->_weakTarget);
}

- (id)weakTarget
{
  return objc_loadWeakRetained(&self->_weakTarget);
}

- (void)setWeakTarget:(id)a3
{
  objc_storeWeak(&self->_weakTarget, a3);
}

- (NSMutableDictionary)signatures
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSignatures:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatures, 0);
  objc_destroyWeak(&self->_weakTarget);
}

@end
