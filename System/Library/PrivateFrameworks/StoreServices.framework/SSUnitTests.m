@implementation SSUnitTests

+ (BOOL)isRunningUnitTests
{
  Class v2;
  SEL v3;
  void *v4;
  void *v5;
  char v7;

  v2 = NSClassFromString(CFSTR("XCTestProbe"));
  if (v2)
  {
    v3 = NSSelectorFromString(CFSTR("isTesting"));
    -[objc_class methodSignatureForSelector:](v2, "methodSignatureForSelector:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelector:", v3);
    objc_msgSend(v5, "invokeWithTarget:", v2);
    v7 = 0;
    objc_msgSend(v5, "getReturnValue:", &v7);
    LOBYTE(v2) = v7 != 0;

  }
  return (char)v2;
}

@end
