@implementation _ResetURLHandlingTask

- (void)performTask
{
  MapsActivity *v3;
  id v4;
  void *v5;
  RichMapsActivity *v6;
  ResetAction *v7;
  RichMapsActivity *v8;
  objc_super v9;

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  v3 = objc_alloc_init(MapsActivity);
  v4 = objc_alloc_init((Class)GEOURLOptions);
  -[MapsActivity setDisplayOptions:](v3, "setDisplayOptions:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity displayOptions](v3, "displayOptions"));
  objc_msgSend(v5, "setMapType:", 0);

  v6 = [RichMapsActivity alloc];
  v7 = objc_alloc_init(ResetAction);
  v8 = -[RichMapsActivity initWithMapsActivity:mapsAction:](v6, "initWithMapsActivity:mapsAction:", v3, v7);

  v9.receiver = self;
  v9.super_class = (Class)_ResetURLHandlingTask;
  -[URLHandlingTask taskFinished:](&v9, "taskFinished:", v8);

}

@end
