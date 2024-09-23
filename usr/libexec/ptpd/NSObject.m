@implementation NSObject

- (int64_t)returnNSIntegerPrimitiveFromSelector:(SEL)a3
{
  int64_t v5;
  id v6;
  void *v7;
  void *v8;
  int64_t v10;

  v5 = 170;
  v10 = 170;
  if ((objc_opt_respondsToSelector(self, a3) & 1) != 0)
  {
    v6 = objc_msgSend((id)objc_opt_class(self), "instanceMethodSignatureForSelector:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", v7));

    objc_msgSend(v8, "setSelector:", a3);
    objc_msgSend(v8, "invokeWithTarget:", self);
    objc_msgSend(v8, "getReturnValue:", &v10);

    return v10;
  }
  return v5;
}

@end
