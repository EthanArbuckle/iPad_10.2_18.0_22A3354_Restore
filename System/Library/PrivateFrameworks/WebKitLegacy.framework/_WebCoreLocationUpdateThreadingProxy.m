@implementation _WebCoreLocationUpdateThreadingProxy

- (_WebCoreLocationUpdateThreadingProxy)initWithProvider:(id)a3
{
  _WebCoreLocationUpdateThreadingProxy *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_WebCoreLocationUpdateThreadingProxy;
  result = -[_WebCoreLocationUpdateThreadingProxy init](&v5, sel_init);
  if (result)
    result->_provider = (WebGeolocationProviderIOS *)a3;
  return result;
}

- (void)geolocationAuthorizationGranted
{
  WebThreadRun();
}

- (void)geolocationAuthorizationDenied
{
  WebThreadRun();
}

- (void)positionChanged:(void *)a3
{
  WebGeolocationPosition *v3;
  WebGeolocationPosition *v4;
  WebGeolocationPosition *cf;

  v3 = -[WebGeolocationPosition initWithGeolocationPosition:]([WebGeolocationPosition alloc], "initWithGeolocationPosition:", a3);
  v4 = v3;
  cf = v3;
  if (v3)
    CFRetain(v3);
  WebThreadRun();
  if (cf)
    CFRelease(cf);
  if (v4)
    CFRelease(v4);
}

- (void)errorOccurred:(id)a3
{
  WebThreadRun();
}

- (void)resetGeolocation
{
  WebThreadRun();
}

@end
