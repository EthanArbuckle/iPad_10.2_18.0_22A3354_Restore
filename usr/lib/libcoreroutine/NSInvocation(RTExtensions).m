@implementation NSInvocation(RTExtensions)

- (uint64_t)blockArgumentIndex
{
  void *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  objc_msgSend(a1, "methodSignature");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "numberOfArguments");
  if (v2 < 3)
  {
LABEL_5:
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v3 = v2;
    v4 = 2;
    while (strcmp((const char *)objc_msgSend(objc_retainAutorelease(v1), "getArgumentTypeAtIndex:", v4), "@?"))
    {
      if (v3 == ++v4)
        goto LABEL_5;
    }
  }

  return v4;
}

@end
