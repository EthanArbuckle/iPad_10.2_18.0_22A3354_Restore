@implementation NavDebugLocationManager

- (NavDebugLocationManager)init
{
  NavDebugLocationManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *overlays;
  NSMutableArray *v5;
  NSMutableArray *annotations;
  void *v7;
  NavDebugLocationManager *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NavDebugLocationManager;
  v2 = -[NavDebugLocationManager init](&v10, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    overlays = v2->_overlays;
    v2->_overlays = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    annotations = v2->_annotations;
    v2->_annotations = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v2, CFSTR("NavigationShowRawGPSTrail"), 0, 0);

    v8 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  MKMapView *mapView;
  void *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("NavigationShowRawGPSTrail"));

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_overlays, "allValues"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        mapView = self->_mapView;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v8), "overlay"));
        -[MKMapView removeOverlay:](mapView, "removeOverlay:", v10);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_annotations;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        -[MKMapView removeAnnotation:](self->_mapView, "removeAnnotation:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v15));
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  v16.receiver = self;
  v16.super_class = (Class)NavDebugLocationManager;
  -[NavDebugLocationManager dealloc](&v16, "dealloc");
}

- (void)setMapView:(id)a3
{
  MKMapView *v5;
  id *p_mapView;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  uint64_t v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v5 = (MKMapView *)a3;
  p_mapView = (id *)&self->_mapView;
  if (self->_mapView != v5)
  {
    obj = a3;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_overlays, "allValues"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v13 = *p_mapView;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "overlay"));
          objc_msgSend(v13, "removeOverlay:", v14);

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "overlay"));
          -[MKMapView addOverlay:](v5, "addOverlay:", v15);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v9);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = self->_annotations;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j);
          objc_msgSend(*p_mapView, "removeAnnotation:", v21);
          -[MKMapView addAnnotation:](v5, "addAnnotation:", v21);
        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v18);
    }

    if (!v5)
    {
      -[NSMutableDictionary removeAllObjects](self->_overlays, "removeAllObjects");
      -[NSMutableArray removeAllObjects](self->_annotations, "removeAllObjects");
    }
    objc_storeStrong((id *)&self->_mapView, obj);
  }

}

- (void)addLocation:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  DebugLocationAnnotation *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("NavigationShowRawGPSTrail"));

  if (v5)
  {
    if ((unint64_t)-[NSMutableArray count](self->_annotations, "count") >= 3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_annotations, "firstObject"));
      -[NSMutableArray removeObjectAtIndex:](self->_annotations, "removeObjectAtIndex:", 0);
      -[MKMapView removeAnnotation:](self->_mapView, "removeAnnotation:", v6);

    }
    v7 = objc_alloc_init(DebugLocationAnnotation);
    -[DebugLocationAnnotation setLocation:](v7, "setLocation:", v8);
    -[DebugLocationAnnotation setLocationType:](v7, "setLocationType:", 0);
    -[NSMutableArray addObject:](self->_annotations, "addObject:", v7);
    -[MKMapView addAnnotation:](self->_mapView, "addAnnotation:", v7);

  }
}

- (id)rendererForOverlay:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_overlays, "allValues", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "overlay"));

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)viewForAnnotation:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  DebugLocationAnnotationView *v7;
  DebugLocationAnnotationView *v8;

  v4 = a3;
  v5 = objc_opt_class(DebugLocationAnnotation);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (DebugLocationAnnotationView *)objc_claimAutoreleasedReturnValue(-[MKMapView dequeueReusableAnnotationViewWithIdentifier:](self->_mapView, "dequeueReusableAnnotationViewWithIdentifier:", CFSTR("NavDebugLocationManager")));
    if (v7)
    {
      v8 = v7;
      -[DebugLocationAnnotationView setDebugLocationAnnotation:](v7, "setDebugLocationAnnotation:", v6);
    }
    else
    {
      v8 = -[DebugLocationAnnotationView initWithAnnotation:debugLocationAnnotation:reuseIdentifier:]([DebugLocationAnnotationView alloc], "initWithAnnotation:debugLocationAnnotation:reuseIdentifier:", v6, v6, CFSTR("NavDebugLocationManager"));
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("NavigationShowRawGPSTrail"))
    && (objc_msgSend(v9, "BOOLForKey:", v8) & 1) == 0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = self->_annotations;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          -[MKMapView removeAnnotation:](self->_mapView, "removeAnnotation:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), (_QWORD)v15);
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

    -[NSMutableArray removeAllObjects](self->_annotations, "removeAllObjects");
  }

}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_overlays, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
