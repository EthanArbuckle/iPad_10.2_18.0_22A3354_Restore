@implementation NSMethodSignature(RTExtensions)

- (uint64_t)argumentIndexForClass:()RTExtensions
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass(aClass);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("@\"%@\"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "numberOfArguments"))
  {
    v7 = 0;
    while (1)
    {
      v8 = objc_retainAutorelease(a1);
      if (!strcmp((const char *)objc_msgSend(v8, "getArgumentTypeAtIndex:", v7), (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String")))break;
      if (++v7 >= (unint64_t)objc_msgSend(v8, "numberOfArguments"))
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

@end
