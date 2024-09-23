@implementation NSURLSessionTask

- (void)_nsurlsessionproxy_cancelWithError:(id)a3
{
  id v4;

  v4 = a3;
  objc_setAssociatedObject(self, "com.apple.nsurlsessionproxy.cancelError", v4, (void *)0x301);
  -[NSURLSessionTask cancel](self, "cancel");

}

- (void)_nsurlsessionproxy_clearError
{
  objc_setAssociatedObject(self, "com.apple.nsurlsessionproxy.cancelError", 0, (void *)0x301);
}

- (id)_nsurlsessionproxy_error
{
  return objc_getAssociatedObject(self, "com.apple.nsurlsessionproxy.cancelError");
}

@end
