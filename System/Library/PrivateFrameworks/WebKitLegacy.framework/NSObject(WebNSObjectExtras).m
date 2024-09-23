@implementation NSObject(WebNSObjectExtras)

+ (CFTypeRef)_webkit_invokeOnMainThread
{
  return (id)CFMakeCollectable(-[WebMainThreadInvoker initWithTarget:]([WebMainThreadInvoker alloc], "initWithTarget:", a1));
}

- (CFTypeRef)_webkit_invokeOnMainThread
{
  return (id)CFMakeCollectable(-[WebMainThreadInvoker initWithTarget:]([WebMainThreadInvoker alloc], "initWithTarget:", a1));
}

@end
