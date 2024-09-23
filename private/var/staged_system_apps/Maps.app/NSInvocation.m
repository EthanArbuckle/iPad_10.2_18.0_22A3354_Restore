@implementation NSInvocation

- (id)_maps_copy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t i;
  uint64_t v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation methodSignature](self, "methodSignature"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", v3));

  objc_msgSend(v4, "setSelector:", -[NSInvocation selector](self, "selector"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation target](self, "target"));
  objc_msgSend(v4, "setTarget:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation methodSignature](self, "methodSignature"));
  v7 = objc_msgSend(v6, "numberOfArguments");

  if ((unint64_t)v7 >= 3)
  {
    for (i = 2; (id)i != v7; ++i)
    {
      v10 = 0;
      -[NSInvocation getArgument:atIndex:](self, "getArgument:atIndex:", &v10, i);
      objc_msgSend(v4, "setArgument:atIndex:", &v10, i);
    }
  }
  objc_msgSend(v4, "retainArguments");
  return v4;
}

@end
