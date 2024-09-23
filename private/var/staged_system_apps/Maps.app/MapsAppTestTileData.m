@implementation MapsAppTestTileData

- (MapsAppTestTileData)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v8;
  MapsAppTestTileData *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL *p_hasRequiredOptions;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  float v20;
  id v21;
  int v22;
  objc_super v24;

  v8 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MapsAppTestTileData;
  v9 = -[MapsAppTest initWithApplication:testName:options:](&v24, "initWithApplication:testName:options:", a3, a4, v8);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("latitude")));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("longitude")));
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("zoom")));
        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mapType")));
          p_hasRequiredOptions = &v9->_hasRequiredOptions;
          v9->_hasRequiredOptions = v13 != 0;

        }
        else
        {
          p_hasRequiredOptions = &v9->_hasRequiredOptions;
          v9->_hasRequiredOptions = 0;
        }

      }
      else
      {
        p_hasRequiredOptions = &v9->_hasRequiredOptions;
        v9->_hasRequiredOptions = 0;
      }

    }
    else
    {
      p_hasRequiredOptions = &v9->_hasRequiredOptions;
      v9->_hasRequiredOptions = 0;
    }

    if (*p_hasRequiredOptions)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("latitude")));
      objc_msgSend(v15, "doubleValue");
      v9->_latitude = v16;

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("longitude")));
      objc_msgSend(v17, "doubleValue");
      v9->_longitude = v18;

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("zoom")));
      objc_msgSend(v19, "floatValue");
      v9->_zoom = v20;

      v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mapType")));
      if ((objc_msgSend(v21, "isEqualToString:", CFSTR("VKMapTypeStandard")) & 1) != 0)
      {
        v22 = 0;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("VKMapTypeSatellite")) & 1) != 0)
      {
        v22 = 1;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("VKMapTypeHybrid")) & 1) != 0)
      {
        v22 = 2;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("VKMapTypeSatelliteGlobe")) & 1) != 0)
      {
        v22 = 3;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("VKMapTypeHybridGlobe")) & 1) != 0)
      {
        v22 = 4;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("VKMapTypeNavigation")) & 1) != 0)
      {
        v22 = 5;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("VKMapTypeStandardGrid")) & 1) != 0)
      {
        v22 = 6;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("VKMapTypeSatelliteGrid")) & 1) != 0)
      {
        v22 = 7;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("VKMapTypeTransit")) & 1) != 0)
      {
        v22 = 8;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("VKMapTypeARGlobe")) & 1) != 0)
      {
        v22 = 10;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("VKMapTypeMunin")) & 1) != 0)
      {
        v22 = 11;
      }
      else if (objc_msgSend(v21, "isEqualToString:", CFSTR("VKMapTypeARWalking")))
      {
        v22 = 9;
      }
      else
      {
        v22 = 0;
      }

      v9->_mapType = v22;
    }
  }

  return v9;
}

- (BOOL)runTest
{
  void *v3;
  CLLocationCoordinate2D v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  double v20;

  -[MapsAppTest startedTest](self, "startedTest");
  if (self->_hasRequiredOptions)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
    v4 = CLLocationCoordinate2DMake(self->_latitude, self->_longitude);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainMKMapView](self, "mainMKMapView"));
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;

    v11 = MKCoordinateRegionMakeWithZoomLevel(v10, v4.latitude, v4.longitude, self->_zoom, v7, v9);
    v12 = GEOMapRectForCoordinateRegion(v11);
    v20 = v13;
    *(float *)&v13 = self->_zoom;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pptTileStatisticsForMapType:latitude:longitude:zoom:width:height:rect:", self->_mapType, self->_latitude, self->_longitude, v13, v7, v9, *(_QWORD *)&v12, v14, *(_QWORD *)&v20, v15));
    v17 = v16 != 0;
    if (v16)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest results](self, "results"));
      objc_msgSend(v18, "addEntriesFromDictionary:", v16);

      -[MapsAppTest finishedTest](self, "finishedTest");
    }
    else
    {
      -[MapsAppTest failedTest](self, "failedTest");
    }

  }
  else
  {
    -[MapsAppTest failedTest](self, "failedTest");
    return 0;
  }
  return v17;
}

@end
