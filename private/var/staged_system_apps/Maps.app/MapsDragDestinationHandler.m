@implementation MapsDragDestinationHandler

- (MapsDragDestinationHandler)init
{
  MapsDragDestinationHandler *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *validDropTypes;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MapsDragDestinationHandler;
  v2 = -[MapsDragDestinationHandler init](&v13, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem readableTypeIdentifiersForItemProvider](MKMapItem, "readableTypeIdentifiersForItemProvider"));
    objc_msgSend(v3, "addObjectsFromArray:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDropVCardReader readableTypeIdentifiersForItemProvider](MapsDropVCardReader, "readableTypeIdentifiersForItemProvider"));
    objc_msgSend(v3, "addObjectsFromArray:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDropCalendarEventReader readableTypeIdentifiersForItemProvider](MapsDropCalendarEventReader, "readableTypeIdentifiersForItemProvider"));
    objc_msgSend(v3, "addObjectsFromArray:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL readableTypeIdentifiersForItemProvider](NSURL, "readableTypeIdentifiersForItemProvider"));
    objc_msgSend(v3, "addObjectsFromArray:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString readableTypeIdentifiersForItemProvider](NSString, "readableTypeIdentifiersForItemProvider"));
    objc_msgSend(v3, "addObjectsFromArray:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeVCard, "identifier"));
    objc_msgSend(v3, "addObject:", v9);

    v10 = (NSArray *)objc_msgSend(v3, "copy");
    validDropTypes = v2->_validDropTypes;
    v2->_validDropTypes = v10;

  }
  return v2;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "chromeViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topIOSBasedContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appCoordinator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "baseModeController"));

  if (v10 == v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localDragSession"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localDragSession"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localContext"));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "window"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "windowScene"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "windowScene"));
      v21 = v19 != v20;

    }
    else
    {
      v21 = 0;
    }
    if (-[MapsDragDestinationHandler allowsSameSceneDrops](self, "allowsSameSceneDrops") || !v14 || v21)
      v13 = objc_msgSend(v7, "hasItemsConformingToTypeIdentifiers:", self->_validDropTypes);
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  -[MapsDragDestinationHandler beginDrop:](self, "beginDrop:", a4);
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topIOSBasedContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appCoordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "baseModeController"));
  v9 = v6 == v8;

  v10 = objc_msgSend(objc_alloc((Class)UIDropProposal), "initWithDropOperation:", 2 * v9);
  return v10;
}

- (void)beginDrop:(id)a3
{
  OS_dispatch_group *v4;
  OS_dispatch_group *analyticsGroup;
  id v6;

  v4 = (OS_dispatch_group *)dispatch_group_create();
  analyticsGroup = self->_analyticsGroup;
  self->_analyticsGroup = v4;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v6, "captureUserAction:onTarget:eventValue:placeActionDetails:", 17004, 0, 0, 0);

}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v6, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  -[MapsDragDestinationHandler performDrop:finishingAtLocation:inView:](self, "performDrop:finishingAtLocation:inView:", v6, v13, v10, v12);

}

- (void)performDrop:(id)a3 finishingAtLocation:(CGPoint)a4 inView:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  OS_dispatch_group *analyticsGroup;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  _QWORD block[8];
  _QWORD v28[4];
  NSObject *v29;
  MapsDragDestinationHandler *v30;
  NSObject *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD v35[4];
  NSObject *v36;
  MapsDragDestinationHandler *v37;
  NSObject *v38;
  NSObject *v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD v43[4];
  NSObject *v44;
  MapsDragDestinationHandler *v45;
  NSObject *v46;
  NSObject *v47;
  _QWORD *v48;
  _QWORD *v49;
  _QWORD *v50;
  _QWORD v51[4];
  NSObject *v52;
  MapsDragDestinationHandler *v53;
  NSObject *v54;
  NSObject *v55;
  _QWORD *v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD v59[5];
  NSObject *v60;
  NSObject *v61;
  _QWORD *v62;
  _QWORD *v63;
  _QWORD *v64;
  _QWORD v65[5];
  id v66;
  _QWORD v67[3];
  char v68;
  _QWORD v69[5];
  id v70;
  _QWORD v71[5];
  id v72;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = a5;
  analyticsGroup = self->_analyticsGroup;
  if (analyticsGroup)
  {
    self->_dropLocation.x = x;
    self->_dropLocation.y = y;
    self->_dropConcluded = 1;
    v12 = analyticsGroup;
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x3032000000;
    v71[3] = sub_1004A2B48;
    v71[4] = sub_1004A2B58;
    v72 = 0;
    v69[0] = 0;
    v69[1] = v69;
    v69[2] = 0x3032000000;
    v69[3] = sub_1004A2B48;
    v69[4] = sub_1004A2B58;
    v70 = 0;
    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x2020000000;
    v68 = 0;
    v65[0] = 0;
    v65[1] = v65;
    v65[2] = 0x3032000000;
    v65[3] = sub_1004A2B48;
    v65[4] = sub_1004A2B58;
    v66 = 0;
    v13 = dispatch_group_create();
    if (objc_msgSend(v9, "canLoadObjectsOfClass:", objc_opt_class(MKMapItem)))
    {
      dispatch_group_enter(v13);
      dispatch_group_enter(v12);
      v14 = objc_opt_class(MKMapItem);
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_1004A2B60;
      v59[3] = &unk_1011B85A0;
      v62 = v67;
      v59[4] = self;
      v63 = v71;
      v64 = v69;
      v60 = v13;
      v61 = v12;
      v15 = objc_msgSend(v9, "loadObjectsOfClass:completion:", v14, v59);

    }
    v16 = dispatch_group_create();
    if (objc_msgSend(v9, "canLoadObjectsOfClass:", objc_opt_class(MapsDropVCardReader)))
    {
      dispatch_group_enter(v16);
      dispatch_group_enter(v12);
      v17 = objc_opt_class(MapsDropVCardReader);
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_1004A2C20;
      v51[3] = &unk_1011B8550;
      v52 = v13;
      v53 = self;
      v56 = v67;
      v57 = v69;
      v58 = v65;
      v54 = v16;
      v55 = v12;
      v18 = objc_msgSend(v9, "loadObjectsOfClass:completion:", v17, v51);

    }
    v19 = dispatch_group_create();
    if (objc_msgSend(v9, "canLoadObjectsOfClass:", objc_opt_class(MapsDropCalendarEventReader)))
    {
      dispatch_group_enter(v19);
      dispatch_group_enter(v12);
      v20 = objc_opt_class(MapsDropCalendarEventReader);
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1004A2DC0;
      v43[3] = &unk_1011B8550;
      v44 = v16;
      v45 = self;
      v48 = v67;
      v49 = v69;
      v50 = v65;
      v46 = v19;
      v47 = v12;
      v21 = objc_msgSend(v9, "loadObjectsOfClass:completion:", v20, v43);

    }
    v22 = dispatch_group_create();
    if (objc_msgSend(v9, "canLoadObjectsOfClass:", objc_opt_class(NSURL)))
    {
      dispatch_group_enter(v22);
      dispatch_group_enter(v12);
      v23 = objc_opt_class(NSURL);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1004A2F5C;
      v35[3] = &unk_1011B8550;
      v36 = v19;
      v37 = self;
      v40 = v67;
      v41 = v69;
      v42 = v65;
      v38 = v22;
      v39 = v12;
      v24 = objc_msgSend(v9, "loadObjectsOfClass:completion:", v23, v35);

    }
    if (objc_msgSend(v9, "canLoadObjectsOfClass:", objc_opt_class(NSString)))
    {
      dispatch_group_enter(v12);
      v25 = objc_opt_class(NSString);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1004A30FC;
      v28[3] = &unk_1011B85A0;
      v32 = v67;
      v33 = v65;
      v29 = v22;
      v30 = self;
      v34 = v69;
      v31 = v12;
      v26 = objc_msgSend(v9, "loadObjectsOfClass:completion:", v25, v28);

    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004A323C;
    block[3] = &unk_1011B85C8;
    block[4] = v65;
    block[5] = v67;
    block[6] = v69;
    block[7] = v71;
    dispatch_group_notify(v12, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v65, 8);
    _Block_object_dispose(v67, 8);
    _Block_object_dispose(v69, 8);

    _Block_object_dispose(v71, 8);
  }

}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  -[MapsDragDestinationHandler endDrop:](self, "endDrop:", a4);
}

- (void)endDrop:(id)a3
{
  NSObject *analyticsGroup;
  OS_dispatch_group *v5;
  id v6;

  v6 = a3;
  if (!self->_dropConcluded)
  {
    analyticsGroup = self->_analyticsGroup;
    if (analyticsGroup)
      dispatch_group_notify(analyticsGroup, (dispatch_queue_t)&_dispatch_main_q, &stru_1011B85E8);
  }
  self->_dropLocation = CGPointZero;
  self->_dropConcluded = 0;
  v5 = self->_analyticsGroup;
  self->_analyticsGroup = 0;

}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  return 0;
}

- (BOOL)handleMapItems:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "firstObject"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDragDestinationHandler delegate](self, "delegate"));
    objc_msgSend(v5, "mapsDragDestinationHandler:didReceiveMapItem:", self, v4);

  }
  return v4 != 0;
}

- (BOOL)handleVCards:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "contacts", (_QWORD)v14));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

        if (v10)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDragDestinationHandler delegate](self, "delegate"));
          v11 = objc_msgSend(v12, "mapsDragDestinationHandler:didReceiveVCard:", self, v10);

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)handleCalendarEvents:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  double longitude;
  _UNKNOWN **v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  BOOL v41;
  MapsDragDestinationHandler *v42;
  uint64_t v43;
  void *v44;
  MapsDragDestinationHandler *v46;
  uint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  _QWORD *v54;
  id obj;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[5];
  _BYTE v69[128];
  id v70;
  _BYTE v71[128];
  _BYTE v72[128];

  v4 = a3;
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_1004A3B14;
  v68[3] = &unk_1011B8610;
  v68[4] = self;
  v54 = objc_retainBlock(v68);
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v5 = v4;
  v48 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
  if (v48)
  {
    v46 = self;
    v6 = *(_QWORD *)v65;
    longitude = kCLLocationCoordinate2DInvalid.longitude;
    v8 = CPLaneGuidance_ptr;
    v51 = v5;
    v47 = *(_QWORD *)v65;
    while (1)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v65 != v6)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v9);
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v49 = v10;
        v50 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "calendar"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "components"));

        obj = v12;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v61;
          v52 = *(_QWORD *)v61;
          do
          {
            v16 = 0;
            v53 = v14;
            do
            {
              if (*(_QWORD *)v61 != v15)
                objc_enumerationMutation(obj);
              v17 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)v16);
              v18 = objc_opt_class(v8[401]);
              if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
              {
                v19 = v17;
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "x_apple_activity"));
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));

                if (v21)
                {
                  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "value"));
                  if (v22
                    && (+[_MKURLParser isValidMapURL:](_MKURLParser, "isValidMapURL:", v22) & 1) != 0)
                  {
                    v70 = v22;
                    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v70, 1));
                    -[MapsDragDestinationHandler handleURLs:](v46, "handleURLs:", v44);
                    goto LABEL_46;
                  }

                }
                v58 = 0u;
                v59 = 0u;
                v56 = 0u;
                v57 = 0u;
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "components"));
                v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
                if (v24)
                {
                  v25 = v24;
                  v26 = *(_QWORD *)v57;
LABEL_18:
                  v27 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v57 != v26)
                      objc_enumerationMutation(v23);
                    v28 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v27);
                    v29 = objc_opt_class(ICSAlarm);
                    if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0)
                    {
                      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "x_apple_structured_location"));
                      if (v30)
                        break;
                    }
                    if (v25 == (id)++v27)
                    {
                      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
                      if (v25)
                        goto LABEL_18;
                      goto LABEL_25;
                    }
                  }
                  v22 = (id)v30;

                  if ((((uint64_t (*)(_QWORD *, id))v54[2])(v54, v22) & 1) != 0)
                    goto LABEL_47;
                }
                else
                {
LABEL_25:

                  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "summary"));
                  v22 = objc_msgSend(v31, "length");

                  if (v22)
                  {
                    v42 = v46;
                    v22 = (id)objc_claimAutoreleasedReturnValue(-[MapsDragDestinationHandler delegate](v46, "delegate"));
                    v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "summary"));
LABEL_45:
                    v44 = (void *)v43;
                    objc_msgSend(v22, "mapsDragDestinationHandler:didReceiveString:nearCoordinate:", v42, v43, kCLLocationCoordinate2DInvalid.latitude, longitude);
LABEL_46:

LABEL_47:
LABEL_48:

                    v41 = 1;
                    v5 = v51;
                    goto LABEL_49;
                  }
                }

                v8 = CPLaneGuidance_ptr;
                v15 = v52;
                v14 = v53;
              }
              else
              {
                v32 = objc_opt_class(ICSEvent);
                if ((objc_opt_isKindOfClass(v17, v32) & 1) == 0)
                  goto LABEL_34;
                v33 = v17;
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "x_apple_structured_location"));
                if (v21)
                {
                  if ((((uint64_t (*)(_QWORD *, void *))v54[2])(v54, v21) & 1) != 0)
                    goto LABEL_48;
                }
                else
                {
                  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "location"));
                  v35 = objc_msgSend(v34, "length");

                  if (v35)
                  {
                    v42 = v46;
                    v22 = (id)objc_claimAutoreleasedReturnValue(-[MapsDragDestinationHandler delegate](v46, "delegate"));
                    v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "location"));
                    goto LABEL_45;
                  }
                  v21 = 0;
                }
              }

LABEL_34:
              v16 = (char *)v16 + 1;
            }
            while (v16 != v14);
            v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
            v14 = v36;
          }
          while (v36);
        }

        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "data"));
        v38 = objc_alloc((Class)NSString);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "data"));
        v40 = objc_msgSend(v38, "initWithData:encoding:", v39, 4);
        NSLog(CFSTR("No calendar data was found in this .ics data:\n%@\n%@"), v37, v40);

        v5 = v51;
        v9 = v50 + 1;
        v6 = v47;
      }
      while ((id)(v50 + 1) != v48);
      v41 = 0;
      v48 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      if (!v48)
        goto LABEL_49;
    }
  }
  v41 = 0;
LABEL_49:

  return v41;
}

- (BOOL)handleURLs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDragDestinationHandler delegate](self, "delegate", (_QWORD)v13));
        LOBYTE(v9) = objc_msgSend(v10, "mapsDragDestinationHandler:didReceiveURL:", self, v9);

        if ((v9 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)handleStrings:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  double longitude;
  uint64_t v10;
  uint64_t v11;
  const __CFArray *v12;
  CFIndex Count;
  CFIndex v14;
  CFIndex v15;
  const void *ValueAtIndex;
  uint64_t MatchedString;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  BOOL v23;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[128];

  v4 = a3;
  v34 = 0;
  v5 = DDScannerCreate(0, 0, &v34);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (!v6)
  {
    v23 = 0;
    goto LABEL_24;
  }
  v7 = v6;
  v8 = *(_QWORD *)v31;
  v28 = DDScannerCopyResultsOptionsForActiveUse;
  longitude = kCLLocationCoordinate2DInvalid.longitude;
  v25 = *(_QWORD *)v31;
  v26 = v5;
LABEL_3:
  v10 = 0;
  v27 = v7;
  while (1)
  {
    if (*(_QWORD *)v31 != v8)
      objc_enumerationMutation(obj);
    v11 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v10);
    if (!v5 || !DDScannerScanString(v5, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v10)))
      goto LABEL_17;
    v12 = (const __CFArray *)DDScannerCopyResultsWithOptions(v5, v28);
    Count = CFArrayGetCount(v12);
    if (Count >= 1)
      break;
LABEL_16:
    CFRelease(v12);
    v8 = v25;
    v5 = v26;
    v7 = v27;
LABEL_17:
    if (-[MapsDragDestinationHandler _handleString:nearCoordinate:](self, "_handleString:nearCoordinate:", v11, kCLLocationCoordinate2DInvalid.latitude, longitude))
    {
      goto LABEL_23;
    }
    if ((id)++v10 == v7)
    {
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      v23 = 0;
      if (!v7)
        goto LABEL_24;
      goto LABEL_3;
    }
  }
  v14 = Count;
  v15 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v12, v15);
    MatchedString = DDResultGetMatchedString();
    v18 = (void *)objc_claimAutoreleasedReturnValue(MatchedString);
    if (DDResultGetCategory(ValueAtIndex) != 1 || !objc_msgSend(v18, "length"))
      goto LABEL_15;
    v19 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v18));
    v20 = (void *)v19;
    if (v19)
    {
      v35 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
      v22 = -[MapsDragDestinationHandler handleURLs:](self, "handleURLs:", v21);

      if ((v22 & 1) != 0)
        break;
    }

LABEL_15:
    if (v14 == ++v15)
      goto LABEL_16;
  }

  CFRelease(v12);
LABEL_23:
  v23 = 1;
LABEL_24:

  return v23;
}

- (BOOL)_handleString:(id)a3 nearCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  id v7;
  void *v8;
  unint64_t UInteger;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  UInteger = GEOConfigGetUInteger(MapsConfig_DragAndDropMaxTextLength, off_1014B2FB8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8));

  if ((unint64_t)objc_msgSend(v10, "length") > UInteger)
  {
    v11 = objc_msgSend(v10, "rangeOfComposedCharacterSequencesForRange:", 0, UInteger);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringWithRange:", v11, v12));

    v10 = (void *)v13;
  }
  v14 = objc_msgSend(v10, "length");
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDragDestinationHandler delegate](self, "delegate"));
    objc_msgSend(v15, "mapsDragDestinationHandler:didReceiveString:nearCoordinate:", self, v10, latitude, longitude);

  }
  return v14 != 0;
}

- (MapsDragDestinationHandlerDelegate)delegate
{
  return (MapsDragDestinationHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)allowsSameSceneDrops
{
  return self->_allowsSameSceneDrops;
}

- (void)setAllowsSameSceneDrops:(BOOL)a3
{
  self->_allowsSameSceneDrops = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_analyticsGroup, 0);
  objc_storeStrong((id *)&self->_validDropTypes, 0);
}

@end
