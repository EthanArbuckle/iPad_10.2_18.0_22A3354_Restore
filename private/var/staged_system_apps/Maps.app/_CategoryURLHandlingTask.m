@implementation _CategoryURLHandlingTask

- (void)performTask
{
  void *v3;
  SearchFieldItem *v4;
  SearchAction *v5;
  MapsActivity *v6;
  id v7;
  void *v8;
  RichMapsActivity *v9;
  id v10;

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[URLHandlingTask url](self, "url"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[GEOSearchCategory categoryForURL:](GEOSearchCategory, "categoryForURL:", v3));

  v4 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setSearchCategory:](v4, "setSearchCategory:", v10);
  v5 = -[SearchAction initWithSearchItem:alongRoute:]([SearchAction alloc], "initWithSearchItem:alongRoute:", v4, 0);
  -[MapsAction setUserLocationAccuracy:](v5, "setUserLocationAccuracy:", kCLLocationAccuracyKilometer);
  v6 = objc_alloc_init(MapsActivity);
  v7 = objc_alloc_init((Class)GEOURLOptions);
  -[MapsActivity setDisplayOptions:](v6, "setDisplayOptions:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity displayOptions](v6, "displayOptions"));
  objc_msgSend(v8, "setUserTrackingMode:", 1);

  v9 = -[RichMapsActivity initWithMapsActivity:mapsAction:]([RichMapsActivity alloc], "initWithMapsActivity:mapsAction:", v6, v5);
  -[URLHandlingTask taskFinished:](self, "taskFinished:", v9);

}

@end
