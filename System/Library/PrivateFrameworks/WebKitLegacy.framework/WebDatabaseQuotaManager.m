@implementation WebDatabaseQuotaManager

- (WebDatabaseQuotaManager)initWithOrigin:(id)a3
{
  WebDatabaseQuotaManager *result;
  objc_super v5;

  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)WebDatabaseQuotaManager;
    result = -[WebDatabaseQuotaManager init](&v5, sel_init);
    if (result)
      result->_origin = (WebSecurityOrigin *)a3;
  }
  else
  {

    return 0;
  }
  return result;
}

- (id)origin
{
  return self->_origin;
}

- (unint64_t)usage
{
  WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
  -[WebSecurityOrigin _core](self->_origin, "_core");
  return WebCore::DatabaseTracker::usage();
}

- (unint64_t)quota
{
  WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
  -[WebSecurityOrigin _core](self->_origin, "_core");
  return WebCore::DatabaseTracker::quota();
}

- (void)setQuota:(unint64_t)a3
{
  WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
  -[WebSecurityOrigin _core](self->_origin, "_core");
  WebCore::DatabaseTracker::setQuota();
}

@end
