@implementation _AvailableExperimentsDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("Available Experiments");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_AvailableExperimentsDebugController;
  -[MapsDebugValuesViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10047E9AC;
  v5[3] = &unk_1011AD9D0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "_debug_fetchAllAvailableExperiments:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)prepareContent
{
  NSArray *v3;
  NSArray *v4;
  id v5;
  _QWORD v6[4];
  NSArray *v7;

  v3 = self->_availableExperiments;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10047EB34;
  v6[3] = &unk_1011B4BC0;
  v7 = v3;
  v4 = v3;
  v5 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableExperiments, 0);
}

@end
