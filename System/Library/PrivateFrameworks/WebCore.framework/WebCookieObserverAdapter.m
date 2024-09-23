@implementation WebCookieObserverAdapter

- (WebCookieObserverAdapter)initWithObserver:(void *)a3
{
  WebCookieObserverAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WebCookieObserverAdapter;
  result = -[WebCookieObserverAdapter init](&v5, sel_init);
  if (result)
    result->observer = a3;
  return result;
}

- (void)cookiesChangedNotificationHandler:(id)a3
{
  WebCore::CookieStorageObserver::cookiesDidChange((WebCore::CookieStorageObserver *)self->observer);
}

@end
