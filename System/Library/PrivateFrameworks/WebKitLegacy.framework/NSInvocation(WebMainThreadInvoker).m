@implementation NSInvocation(WebMainThreadInvoker)

- (char)_webkit_invokeAndHandleException:()WebMainThreadInvoker
{
  char *result;
  id v3;

  objc_msgSend(a1, "invoke");
  result = strchr((char *)objc_msgSend((id)objc_msgSend(a1, "methodSignature"), "methodReturnType"), 64);
  if (result)
  {
    v3 = 0;
    objc_msgSend(a1, "getReturnValue:", &v3);
    return (char *)v3;
  }
  return result;
}

@end
