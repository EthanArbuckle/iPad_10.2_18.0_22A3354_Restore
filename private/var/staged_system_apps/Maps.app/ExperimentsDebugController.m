@implementation ExperimentsDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("A/B Experiments");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration"));
  objc_msgSend(v3, "removeExperimentObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ExperimentsDebugController;
  -[MapsDebugValuesViewController dealloc](&v4, "dealloc");
}

- (void)prepareContent
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration"));
  objc_msgSend(v3, "addExperimentObserver:queue:", self, &_dispatch_main_q);

  v4 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, &stru_1011B7DB8);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10047E44C;
  v10[3] = &unk_1011B4BC0;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration"));
  v5 = v11;
  v6 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, v10);
  v7 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, &stru_1011B7E38);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10047E704;
  v9[3] = &unk_1011B7EC0;
  v9[4] = self;
  objc_msgSend(v8, "_debug_forEachExperimentType:", v9);

}

@end
