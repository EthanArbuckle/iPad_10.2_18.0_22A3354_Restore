@implementation PLPersistentHistoryMarker

+ (id)markerWithToken:(id)a3
{
  id v3;
  PLPersistentHistoryMarkerToken *v4;

  v3 = a3;
  v4 = -[PLPersistentHistoryMarkerToken initWithToken:]([PLPersistentHistoryMarkerToken alloc], "initWithToken:", v3);

  return v4;
}

+ (id)markerWithDate:(id)a3
{
  id v3;
  PLPersistentHistoryMarkerDate *v4;

  v3 = a3;
  v4 = -[PLPersistentHistoryMarkerDate initWithDate:]([PLPersistentHistoryMarkerDate alloc], "initWithDate:", v3);

  return v4;
}

+ (id)markerWithTransaction:(id)a3
{
  id v3;
  PLPersistentHistoryMarkerTransaction *v4;

  v3 = a3;
  v4 = -[PLPersistentHistoryMarkerTransaction initWithTransaction:]([PLPersistentHistoryMarkerTransaction alloc], "initWithTransaction:", v3);

  return v4;
}

- (id)overrride_changeRequestForFetching
{
  PLPersistentHistoryMarker *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)overrride_shortDescription
{
  PLPersistentHistoryMarker *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end
