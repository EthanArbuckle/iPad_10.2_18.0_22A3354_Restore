@implementation TrafficIncidentItemSource

- (TrafficIncidentItemSource)init
{
  TrafficIncidentItemSource *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  PlatformController *platformController;
  TrafficIncidentItemSource *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TrafficIncidentItemSource;
  v2 = -[TrafficIncidentItemSource init](&v10, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsSourceManager sharedInstance](TrafficIncidentsSourceManager, "sharedInstance"));
    objc_msgSend(v3, "addObserver:", v2);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appSessionController"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primaryPlatformController"));
    platformController = v2->_platformController;
    v2->_platformController = (PlatformController *)v6;

    -[PlatformController addObserver:](v2->_platformController, "addObserver:", v2);
    v8 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsSourceManager sharedInstance](TrafficIncidentsSourceManager, "sharedInstance"));
  objc_msgSend(v3, "removeObserver:", self);

  -[PlatformController removeObserver:](self->_platformController, "removeObserver:", self);
  v4.receiver = self;
  v4.super_class = (Class)TrafficIncidentItemSource;
  -[TrafficIncidentItemSource dealloc](&v4, "dealloc");
}

- (id)allItems
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController currentSession](self->_platformController, "currentSession"));
  v3 = objc_opt_class(NavigationSession);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  if ((isKindOfClass & 1) != 0)
  {
    v5 = &__NSArray0__struct;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsSourceManager sharedInstance](TrafficIncidentsSourceManager, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cachedIncidentsPersonalizedItems"));

  }
  return v5;
}

- (void)incidentsSourceManagerDidUpdate
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006CDBE0;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  char isKindOfClass;
  uint64_t v11;
  char v12;

  v7 = a5;
  v8 = a4;
  v9 = objc_opt_class(NavigationSession);
  isKindOfClass = objc_opt_isKindOfClass(v7, v9);

  v11 = objc_opt_class(NavigationSession);
  v12 = objc_opt_isKindOfClass(v8, v11);

  if ((v12 & 1) != 0 || (isKindOfClass & 1) != 0)
    -[TrafficIncidentItemSource incidentsSourceManagerDidUpdate](self, "incidentsSourceManagerDidUpdate");
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
  objc_storeStrong((id *)&self->_platformController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformController, 0);
}

@end
