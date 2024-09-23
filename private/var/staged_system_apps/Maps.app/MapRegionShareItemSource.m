@implementation MapRegionShareItemSource

- (MapRegionShareItemSource)initWithMapView:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  char *v8;
  id v9;
  void *v10;
  MapRegionURLActivityItemSource *v11;
  void *v12;
  MapRegionTextActivityItemSource *v13;
  void *v14;
  objc_super v16;
  MKMapRect v17;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MapRegionShareItemSource;
  v8 = -[MapRegionShareItemSource init](&v16, "init");
  if (v8)
  {
    objc_msgSend(v6, "visibleMapRect");
    *(MKCoordinateRegion *)(v8 + 48) = MKCoordinateRegionForMapRect(v17);
    objc_storeStrong((id *)v8 + 3, a4);
    v9 = objc_msgSend(objc_alloc((Class)_MKURLBuilder), "initForCoordinate:label:", v7, *((double *)v8 + 6), *((double *)v8 + 7));
    objc_msgSend(v9, "setDisplayRegion:", *((double *)v8 + 6), *((double *)v8 + 7), *((double *)v8 + 8), *((double *)v8 + 9));
    objc_msgSend(v9, "setMapType:", objc_msgSend(v6, "mapType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "buildForWeb"));
    v11 = objc_alloc_init(MapRegionURLActivityItemSource);
    v12 = (void *)*((_QWORD *)v8 + 4);
    *((_QWORD *)v8 + 4) = v11;

    objc_msgSend(*((id *)v8 + 4), "setUrl:", v10);
    v13 = objc_alloc_init(MapRegionTextActivityItemSource);
    v14 = (void *)*((_QWORD *)v8 + 5);
    *((_QWORD *)v8 + 5) = v13;

    objc_msgSend(*((id *)v8 + 5), "setText:", v7);
  }

  return (MapRegionShareItemSource *)v8;
}

- (NSData)pushSubmissionData
{
  SyncedBookmarkRepr *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  v3 = objc_alloc_init(SyncedBookmarkRepr);
  -[SyncedBookmarkRepr setType:](v3, "setType:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapRegionShareItemSource title](self, "title"));
  -[SyncedBookmarkRepr setTitle:](v3, "setTitle:", v4);

  -[MapRegionShareItemSource region](self, "region");
  -[SyncedBookmarkRepr setRegionLatitude:](v3, "setRegionLatitude:");
  -[MapRegionShareItemSource region](self, "region");
  -[SyncedBookmarkRepr setRegionLongitude:](v3, "setRegionLongitude:", v5);
  -[MapRegionShareItemSource region](self, "region");
  -[SyncedBookmarkRepr setRegionLatitudeDelta:](v3, "setRegionLatitudeDelta:", v6);
  -[MapRegionShareItemSource region](self, "region");
  -[SyncedBookmarkRepr setRegionLongitudeDelta:](v3, "setRegionLongitudeDelta:", v7);
  -[MapRegionShareItemSource region](self, "region");
  -[SyncedBookmarkRepr setLatitude:](v3, "setLatitude:");
  -[MapRegionShareItemSource region](self, "region");
  -[SyncedBookmarkRepr setLongitude:](v3, "setLongitude:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SyncedBookmarkRepr data](v3, "data"));

  return (NSData *)v9;
}

- (NSArray)activityProviders
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapRegionShareItemSource textSource](self, "textSource"));
  v7[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapRegionShareItemSource urlSource](self, "urlSource"));
  v7[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));

  return (NSArray *)v5;
}

- (NSArray)applicationActivities
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  PushToDeviceActivity *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == (id)5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapRegionShareItemSource pushSubmissionData](self, "pushSubmissionData"));
    if (v6)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsPushManager defaultManager](MapsPushManager, "defaultManager", 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "devices"));

      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            v13 = -[PushToDeviceActivity initWithDevice:place:]([PushToDeviceActivity alloc], "initWithDevice:place:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), self);
            objc_msgSend(v3, "addObject:", v13);

            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v10);
      }

    }
  }
  return (NSArray *)v3;
}

- (NSArray)excludedActivityTypes
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)includedActivityTypes
{
  return 0;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- ($04D47FADD0355EF96E203C25856C2375)region
{
  return self;
}

- (void)setRegion:(id *)a3
{
  CLLocationDegrees v3;
  CLLocationDegrees v4;
  double v5;
  double v6;

  self->_region.center.latitude = v3;
  self->_region.center.longitude = v4;
  self->_region.span.latitudeDelta = v5;
  self->_region.span.longitudeDelta = v6;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (MapRegionURLActivityItemSource)urlSource
{
  return self->_urlSource;
}

- (void)setUrlSource:(id)a3
{
  objc_storeStrong((id *)&self->_urlSource, a3);
}

- (MapRegionTextActivityItemSource)textSource
{
  return self->_textSource;
}

- (void)setTextSource:(id)a3
{
  objc_storeStrong((id *)&self->_textSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSource, 0);
  objc_storeStrong((id *)&self->_urlSource, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end
