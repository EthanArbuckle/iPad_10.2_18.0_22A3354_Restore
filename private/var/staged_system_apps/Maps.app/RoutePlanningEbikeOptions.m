@implementation RoutePlanningEbikeOptions

- (void)_prepareForDrive
{
  -[RoutePlanningEbikeOptions doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)_prepareForTransit
{
  -[RoutePlanningEbikeOptions doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)_prepareForWalking
{
  -[RoutePlanningEbikeOptions doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)_prepareForCycling
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *countryObserver;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  if (!self->super._countryObserver)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v5 = GEOCountryConfigurationCountryCodeDidChangeNotification;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1006FC03C;
    v10[3] = &unk_1011AD288;
    objc_copyWeak(&v11, &location);
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v5, 0, v4, v10));
    countryObserver = self->super._countryObserver;
    self->super._countryObserver = v6;

    objc_destroyWeak(&v11);
  }
  if (sub_1003C76E0())
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1006FC068;
    v8[3] = &unk_1011AEAC8;
    objc_copyWeak(&v9, &location);
    -[PreferenceValuesDataSource addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, v8);
    objc_destroyWeak(&v9);
  }
  objc_destroyWeak(&location);
}

@end
