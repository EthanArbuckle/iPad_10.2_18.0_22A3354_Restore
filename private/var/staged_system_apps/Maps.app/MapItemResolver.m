@implementation MapItemResolver

- (MapItemResolver)init
{
  MapItemResolver *v2;
  dispatch_group_t v3;
  OS_dispatch_group *resolveGroup;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapItemResolver;
  v2 = -[MapItemResolver init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_group_create();
    resolveGroup = v2->_resolveGroup;
    v2->_resolveGroup = (OS_dispatch_group *)v3;

  }
  return v2;
}

- (MapItemResolver)initWithLabelMarker:(id)a3
{
  id v4;
  MapItemResolver *v5;
  _QWORD *v6;
  id resolveBlock;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = -[MapItemResolver init](self, "init");
  if (v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1005C9D40;
    v9[3] = &unk_1011BCC88;
    v10 = v4;
    v6 = objc_retainBlock(v9);
    resolveBlock = v5->_resolveBlock;
    v5->_resolveBlock = v6;

  }
  return v5;
}

- (MapItemResolver)initWithAddress:(id)a3
{
  id v4;
  MapItemResolver *v5;
  _QWORD *v6;
  id resolveBlock;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = -[MapItemResolver init](self, "init");
  if (v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1005C9DE0;
    v9[3] = &unk_1011BCC88;
    v10 = v4;
    v6 = objc_retainBlock(v9);
    resolveBlock = v5->_resolveBlock;
    v5->_resolveBlock = v6;

  }
  return v5;
}

- (MapItemResolver)initWithAddressString:(id)a3
{
  id v4;
  MapItemResolver *v5;
  _QWORD *v6;
  id resolveBlock;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = -[MapItemResolver init](self, "init");
  if (v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1005C9E80;
    v9[3] = &unk_1011BCC88;
    v10 = v4;
    v6 = objc_retainBlock(v9);
    resolveBlock = v5->_resolveBlock;
    v5->_resolveBlock = v6;

  }
  return v5;
}

- (MapItemResolver)initWithMapItem:(id)a3
{
  id v4;
  MapItemResolver *v5;
  _QWORD *v6;
  id resolveBlock;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = -[MapItemResolver init](self, "init");
  if (v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1005C9F20;
    v9[3] = &unk_1011BCC88;
    v10 = v4;
    v6 = objc_retainBlock(v9);
    resolveBlock = v5->_resolveBlock;
    v5->_resolveBlock = v6;

  }
  return v5;
}

- (id)traits
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapItemResolver delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "traitsForMapItemResolver:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapItemResolver delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitsForMapItemResolver:", self));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)startWithCompletion:(id)a3
{
  id v4;
  int *p_hasStarted;
  void (**resolveBlock)(id, MapItemResolver *);
  NSObject *resolveGroup;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  p_hasStarted = &self->_hasStarted;
  do
  {
    if (__ldxr((unsigned int *)p_hasStarted))
    {
      __clrex();
      goto LABEL_9;
    }
  }
  while (__stxr(1u, (unsigned int *)p_hasStarted));
  resolveBlock = (void (**)(id, MapItemResolver *))self->_resolveBlock;
  if (resolveBlock)
    resolveBlock[2](resolveBlock, self);
  if (v4)
  {
    resolveGroup = self->_resolveGroup;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1005CA068;
    v9[3] = &unk_1011ACAD0;
    v9[4] = self;
    v10 = v4;
    dispatch_group_notify(resolveGroup, (dispatch_queue_t)&_dispatch_main_q, v9);

  }
LABEL_9:

}

- (void)cancel
{
  MapItemResolver *v2;
  NSMutableArray *v3;
  NSMutableArray *cancelHandlers;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_cancelHandlers;
  cancelHandlers = v2->_cancelHandlers;
  v2->_cancelHandlers = 0;

  -[MapItemResolver setCanceled:](v2, "setCanceled:", 1);
  objc_sync_exit(v2);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = v3;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_addCancelationHandler:(id)a3
{
  MapItemResolver *v4;
  void *v5;
  NSMutableArray *cancelHandlers;
  uint64_t v7;
  NSMutableArray *v8;
  id v9;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = v10;
  cancelHandlers = v4->_cancelHandlers;
  if (!cancelHandlers)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v8 = v4->_cancelHandlers;
    v4->_cancelHandlers = (NSMutableArray *)v7;

    cancelHandlers = v4->_cancelHandlers;
    v5 = v10;
  }
  v9 = objc_msgSend(v5, "copy");
  -[NSMutableArray addObject:](cancelHandlers, "addObject:", v9);

  objc_sync_exit(v4);
}

- (void)resolveLabelMarker:(id)a3
{
  id v4;
  double v5;
  CLLocationDegrees v6;
  CLLocationDegrees v7;
  CLLocationCoordinate2D v8;
  id v9;
  id v10;
  id v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  OS_dispatch_group *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  OS_dispatch_group *v25;
  _QWORD v26[5];
  OS_dispatch_group *v27;

  v4 = a3;
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  objc_msgSend(v4, "coordinate");
  v8 = CLLocationCoordinate2DMake(v6, v7);
  v9 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", v8.latitude, v8.longitude);
  v10 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithCLLocation:", v9);
  v11 = v4;
  v12 = objc_msgSend(v11, "featureType");
  if (v12 <= 9 && ((1 << v12) & 0x2C0) != 0)
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
  else
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
  v14 = (void *)v13;

  objc_msgSend(v10, "setName:", v14);
  if (objc_msgSend(v11, "isTransitLine"))
  {
    if (objc_msgSend(v11, "_maps_numLines") == (id)1)
      -[MapItemResolver resolveNearestTransitStationForLabelMarker:](self, "resolveNearestTransitStationForLabelMarker:", v11);
    else
      -[MapItemResolver setResolvedMapItem:](self, "setResolvedMapItem:", v10);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureAnnotation"));
    v16 = v15;
    if (v15 && objc_msgSend(v15, "conformsToProtocol:", &OBJC_PROTOCOL___CustomPOIAnnotation))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "personalizedItem"));
      if (objc_msgSend(v17, "mustRefineMapItem")
        && (v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mapItem")), v18, v18))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mapItem"));
        -[MapItemResolver resolveMapItem:](self, "resolveMapItem:", v19);
      }
      else
      {
        -[MapItemResolver setResolvedPlace:](self, "setResolvedPlace:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mapItem"));
        -[MapItemResolver setResolvedMapItem:](self, "setResolvedMapItem:", v19);
      }

    }
    else if (objc_msgSend(v11, "businessID"))
    {
      v20 = self->_resolveGroup;
      dispatch_group_enter((dispatch_group_t)v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "poiSearchManager"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapItemResolver traits](self, "traits"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1005CA52C;
      v26[3] = &unk_1011BCCB0;
      v26[4] = self;
      v27 = v20;
      v25 = v20;
      objc_msgSend(v22, "searchForIdentifier:allowExpired:traits:completionHandler:", v23, 1, v24, v26);

    }
  }

}

- (void)resolveMapItem:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  OS_dispatch_group *v15;
  OS_dispatch_group *v16;
  id v17;
  id v18;
  OS_dispatch_group *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  OS_dispatch_group *v23;
  _QWORD *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  OS_dispatch_group *v31;
  _QWORD *v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[3];
  int v36;
  void *v37;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_identifier"));

  v6 = v5 == 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  if (v6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapItemResolver traits](self, "traits"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ticketForMapItemToRefine:traits:", v4, v14));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "phoneNumber"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_identifier"));
    v37 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapItemResolver traits](self, "traits"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ticketForIdentifiers:traits:", v9, v10));

    v12 = 0;
    v13 = 0;
    v20 = 0;
  }
  v15 = self->_resolveGroup;
  v16 = v15;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = sub_1005CA92C;
  v33[4] = sub_1005CA93C;
  v34 = 0;
  if (v11)
  {
    dispatch_group_enter((dispatch_group_t)v15);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1005CA944;
    v26[3] = &unk_1011BCCD8;
    v26[4] = self;
    v27 = v4;
    v28 = v20;
    v29 = v13;
    v30 = v12;
    v32 = v35;
    v31 = v16;
    v17 = &_dispatch_main_q;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1005CAA58;
    v25[3] = &unk_1011AEF80;
    v25[4] = v33;
    objc_msgSend(v11, "submitWithHandler:queue:networkActivity:", v26, &_dispatch_main_q, v25);

  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1005CAAE0;
  v21[3] = &unk_1011AE630;
  v18 = v11;
  v22 = v18;
  v24 = v35;
  v19 = v16;
  v23 = v19;
  -[MapItemResolver _addCancelationHandler:](self, "_addCancelationHandler:", v21);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);

}

- (void)resolveNearestTransitStationForLabelMarker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  OS_dispatch_group *v7;
  void *v8;
  OS_dispatch_group *v9;
  id v10;
  void *v11;
  id v12;
  OS_dispatch_group *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  OS_dispatch_group *v19;
  _QWORD *v20;
  _QWORD v21[5];
  OS_dispatch_group *v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD v26[3];
  int v27;
  _QWORD v28[3];
  int v29;

  v4 = a3;
  if (objc_msgSend(v4, "_maps_numLines") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_lineIdentifiers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

    v7 = self->_resolveGroup;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v29 = 0;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    v27 = 0;
    dispatch_group_enter((dispatch_group_t)v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1005CAD28;
    v21[3] = &unk_1011BCD28;
    v21[4] = self;
    v9 = v7;
    v22 = v9;
    v10 = v6;
    v23 = v10;
    v24 = v28;
    v25 = v26;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "singleLocationUpdateWithHandler:", v21));

    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_1005CB110;
    v17 = &unk_1011AE630;
    v12 = v11;
    v18 = v12;
    v20 = v26;
    v13 = v9;
    v19 = v13;
    -[MapItemResolver _addCancelationHandler:](self, "_addCancelationHandler:", &v14);
    objc_msgSend(v12, "start", v14, v15, v16, v17);

    _Block_object_dispose(v26, 8);
    _Block_object_dispose(v28, 8);

  }
}

- (void)resolveAddress:(id)a3
{
  NSObject *resolveGroup;
  id v5;
  _QWORD v6[5];

  resolveGroup = self->_resolveGroup;
  v5 = a3;
  dispatch_group_enter(resolveGroup);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1005CB1E8;
  v6[3] = &unk_1011AF308;
  v6[4] = self;
  objc_msgSend(v5, "forwardGeocodeAddress:", v6);

}

- (void)resolveAddressString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  OS_dispatch_group *v9;
  void *v10;
  OS_dispatch_group *v11;
  OS_dispatch_group *v12;
  _QWORD v13[4];
  OS_dispatch_group *v14;
  uint64_t *v15;
  _QWORD *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  OS_dispatch_group *v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[3];
  int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_1005CA92C;
  v29 = sub_1005CA93C;
  v30 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapItemResolver traits](self, "traits"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ticketForForwardGeocodeString:traits:", v4, v6));
  v8 = (void *)v26[5];
  v26[5] = v7;

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_1005CA92C;
  v21[4] = sub_1005CA93C;
  v22 = 0;
  v9 = self->_resolveGroup;
  dispatch_group_enter((dispatch_group_t)v9);
  v10 = (void *)v26[5];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1005CB484;
  v18[3] = &unk_1011BCD50;
  v18[4] = self;
  v20 = v23;
  v11 = v9;
  v19 = v11;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1005CB528;
  v17[3] = &unk_1011AEF80;
  v17[4] = v21;
  objc_msgSend(v10, "submitWithRefinedHandler:networkActivity:", v18, v17);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1005CB5B0;
  v13[3] = &unk_1011BCD78;
  v15 = &v25;
  v16 = v23;
  v12 = v11;
  v14 = v12;
  -[MapItemResolver _addCancelationHandler:](self, "_addCancelationHandler:", v13);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (MKMapItem)resolvedMapItem
{
  return self->_resolvedMapItem;
}

- (void)setResolvedMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedMapItem, a3);
}

- (PersonalizedItem)resolvedPlace
{
  return self->_resolvedPlace;
}

- (void)setResolvedPlace:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedPlace, a3);
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (MapItemResolverDelegate)delegate
{
  return (MapItemResolverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasNearestStation
{
  return self->_hasNearestStation;
}

- (void)setHasNearestStation:(BOOL)a3
{
  self->_hasNearestStation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_resolvedPlace, 0);
  objc_storeStrong((id *)&self->_resolvedMapItem, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cancelHandlers, 0);
  objc_storeStrong((id *)&self->_locationOperation, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong(&self->_resolveBlock, 0);
  objc_storeStrong((id *)&self->_resolveGroup, 0);
}

@end
