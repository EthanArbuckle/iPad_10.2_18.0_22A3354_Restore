@implementation NSInvocation(TSUAdditions)

+ (void)tsu_invocationWithBlock:()TSUAdditions
{
  void *v4;
  id v6;

  v6 = (id)objc_msgSend(a3, "copy");
  v4 = (void *)objc_msgSend(a1, "invocationWithMethodSignature:", objc_msgSend(a1, "methodSignatureForSelector:", sel_executeBlock_));
  objc_msgSend(v4, "setTarget:", a1);
  objc_msgSend(v4, "setSelector:", sel_tsu_executeBlock_);
  objc_msgSend(v4, "setArgument:atIndex:", &v6, 2);
  objc_msgSend(v4, "retainArguments");

  return v4;
}

@end
