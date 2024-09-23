@implementation VKLabelMarker

- (unint64_t)_maps_numLines
{
  if (-[VKLabelMarker isTransitLine](self, "isTransitLine"))
    return (unint64_t)-[VKLabelMarker countFeatureIDs](self, "countFeatureIDs");
  else
    return 0;
}

- (NSArray)_maps_lineIdentifiers
{
  unint64_t v3;
  id v4;
  uint64_t i;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;

  if (-[VKLabelMarker isTransitLine](self, "isTransitLine"))
  {
    v3 = -[VKLabelMarker _maps_numLines](self, "_maps_numLines");
    v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v3);
    if (v3)
    {
      for (i = 0; i != v3; ++i)
      {
        v6 = *((_QWORD *)-[VKLabelMarker featureIDs](self, "featureIDs") + i);
        v7 = objc_alloc((Class)MKMapItemIdentifier);
        -[VKLabelMarker coordinate](self, "coordinate");
        v8 = objc_msgSend(v7, "initWithMUID:resultProviderID:coordinate:", v6, 0);
        if (v8)
          objc_msgSend(v4, "addObject:", v8);

      }
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v4));

  }
  else
  {
    v9 = 0;
  }
  return (NSArray *)v9;
}

- (void)_maps_loadLineInfoUsingTraits:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  id AssociatedObject;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(id, void *, _QWORD);
  void (**v14)(id, void *, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  if ((-[VKLabelMarker isTransitLine](self, "isTransitLine") & 1) != 0)
  {
    AssociatedObject = objc_getAssociatedObject(self, &unk_1014D1EA1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
    if (v9)
    {
      if (v7)
        v7[2](v7, v9, 0);
    }
    else
    {
      v10 = objc_getAssociatedObject(self, &unk_1014D1EA2);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (v11)
      {
        v12 = (id)v11;
        if (v7)
        {
          v13 = objc_retainBlock(v7);
          objc_msgSend(v12, "addObject:", v13);

        }
      }
      else
      {
        if (v7)
        {
          v14 = objc_retainBlock(v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v14));

        }
        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        }
        objc_setAssociatedObject(self, &unk_1014D1EA2, v15, (void *)1);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker _maps_lineIdentifiers](self, "_maps_lineIdentifiers"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ticketForTransitLines:traits:", v17, v6));

        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100276E7C;
        v19[3] = &unk_1011AE6F0;
        v19[4] = self;
        v12 = v15;
        v20 = v12;
        objc_msgSend(v18, "submitWithHandler:networkActivity:", v19, 0);

      }
    }

  }
  else if (v7)
  {
    v7[2](v7, 0, 0);
  }

}

- (id)_maps_analyticsEventValue
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker _maps_lineIdentifiers](self, "_maps_lineIdentifiers"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "muid")));
        objc_msgSend(v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(",")));
  return v10;
}

- (NSArray)_maps_loadedLineItems
{
  return (NSArray *)objc_getAssociatedObject(self, &unk_1014D1EA1);
}

- (BOOL)_maps_lineShouldZoomMapRegionOnSelection
{
  id AssociatedObject;
  void *v3;
  unsigned __int8 v4;

  AssociatedObject = objc_getAssociatedObject(self, &unk_1014D1EA0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)set_maps_lineShouldZoomMapRegionOnSelection:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, &unk_1014D1EA0, v4, (void *)3);

}

- (BOOL)_maps_hasCustomPOIAnnotation
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker featureAnnotation](self, "featureAnnotation"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___CustomPOIAnnotation);
  else
    v4 = 0;

  return v4;
}

- (CustomPOIAnnotation)_maps_customPOIAnnotation
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker featureAnnotation](self, "featureAnnotation"));
  v3 = v2;
  if (v2 && objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___CustomPOIAnnotation))
    v4 = v3;
  else
    v4 = 0;

  return (CustomPOIAnnotation *)v4;
}

- (BOOL)_maps_isOfflineAnnotation
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker featureAnnotation](self, "featureAnnotation"));
  if (v2)
  {
    v3 = objc_opt_class(_MKOfflineRegionCustomFeature);
    isKindOfClass = objc_opt_isKindOfClass(v2, v3);
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)_maps_isOfflineClusterAnnotation
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  uint64_t v7;

  if (-[VKLabelMarker isCluster](self, "isCluster"))
    v3 = -[VKLabelMarker clusterFeatureCount](self, "clusterFeatureCount") != 0;
  else
    v3 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker clusterFeatureAnnotations](self, "clusterFeatureAnnotations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  isKindOfClass = 0;
  if (v3 && v5)
  {
    v7 = objc_opt_class(_MKOfflineRegionCustomFeature);
    isKindOfClass = objc_opt_isKindOfClass(v5, v7);
  }

  return isKindOfClass & 1;
}

- (id)_maps_mapItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "poiSearchManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker identifier](self, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchResultForIdentifier:", v5));

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
  if (!v7)
    v7 = objc_msgSend(objc_alloc((Class)MKMapItem), "_initWithLabelMarker:", self);

  return v7;
}

- (id)_maps_selectableRouteAnnotations
{
  void *v3;
  id v4;
  void *v5;

  if (-[VKLabelMarker isRouteAnnotation](self, "isRouteAnnotation"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker routeAnnotations](self, "routeAnnotations"));
    v4 = sub_10039DCD4(v3, &stru_1011E2E10);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  }
  else
  {
    v5 = &__NSArray0__struct;
  }
  return v5;
}

@end
