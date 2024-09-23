@implementation DragAndDropMapItem

+ (id)dragAndDropItemWithObject:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v4 = a3;
  if (!v4)
    goto LABEL_5;
  v5 = objc_opt_class(PersonalizedCompoundItem);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "autocompleteObject"));

    v4 = (id)v6;
  }
  v7 = objc_opt_class(GEOSearchCategory);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
    goto LABEL_5;
  v10 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v4, v10) & 1) != 0)
  {
    v4 = v4;
    v11 = objc_alloc((Class)a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));

    v8 = objc_msgSend(v11, "initWithMapItem:", v12);
    goto LABEL_6;
  }
  v13 = objc_opt_class(MKLocalSearchCompletion);
  if ((objc_opt_isKindOfClass(v4, v13) & 1) != 0)
  {
    v4 = v4;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));

    if (v14)
    {
      v15 = objc_alloc((Class)a1);
      v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
      v17 = v15;
LABEL_12:
      v8 = objc_msgSend(v17, "initWithMapItem:", v16);

LABEL_31:
      goto LABEL_6;
    }
LABEL_30:
    v8 = 0;
    goto LABEL_31;
  }
  v18 = objc_opt_class(AddressBookAddress);
  if ((objc_opt_isKindOfClass(v4, v18) & 1) != 0)
  {
    v4 = v4;
    v19 = objc_msgSend(objc_alloc((Class)a1), "initWithAddress:", v4);
LABEL_15:
    v8 = v19;
    goto LABEL_31;
  }
  v20 = objc_opt_class(HistoryEntryRecentsItem);
  if ((objc_opt_isKindOfClass(v4, v20) & 1) != 0)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = sub_1002195D0;
    v37 = sub_1002195E0;
    v38 = 0;
    v4 = v4;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "historyEntry"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1002195F0;
    v32[3] = &unk_1011AC9C8;
    v32[4] = &v33;
    v32[5] = a1;
    objc_msgSend(v21, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", &stru_1011AC960, &stru_1011AC9A0, v32, &stru_1011ACA08);

    v8 = (id)v34[5];
    _Block_object_dispose(&v33, 8);

    goto LABEL_6;
  }
  v22 = objc_opt_class(CRRecentContact);
  if ((objc_opt_isKindOfClass(v4, v22) & 1) != 0)
  {
    v23 = objc_msgSend(objc_alloc((Class)a1), "initWithRecentContact:", v4);
LABEL_20:
    v8 = v23;
    goto LABEL_6;
  }
  v24 = objc_opt_class(MapsSuggestionsEntry);
  if ((objc_opt_isKindOfClass(v4, v24) & 1) != 0)
  {
    v4 = v4;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geoMapItem"));

    if (!v25)
      goto LABEL_30;
LABEL_23:
    v26 = objc_alloc((Class)MKMapItem);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geoMapItem"));
    v16 = objc_msgSend(v26, "initWithGeoMapItem:isPlaceHolderPlace:", v27, 1);

    v17 = objc_alloc((Class)a1);
    goto LABEL_12;
  }
  v28 = objc_opt_class(VKLabelMarker);
  if ((objc_opt_isKindOfClass(v4, v28) & 1) != 0)
  {
    v4 = v4;
    v19 = objc_msgSend(objc_alloc((Class)a1), "initWithLabelMarker:", v4);
    goto LABEL_15;
  }
  v29 = objc_opt_class(MKMapItem);
  if ((objc_opt_isKindOfClass(v4, v29) & 1) != 0)
  {
    v23 = objc_msgSend(objc_alloc((Class)a1), "initWithMapItem:", v4);
    goto LABEL_20;
  }
  v30 = objc_opt_class(_TtC4Maps16MapsFavoriteItem);
  if ((objc_opt_isKindOfClass(v4, v30) & 1) != 0)
  {
    v4 = v4;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geoMapItem"));

    if (!v31)
      goto LABEL_30;
    goto LABEL_23;
  }
LABEL_5:
  v8 = 0;
LABEL_6:

  return v8;
}

- (DragAndDropMapItem)init
{
  -[DragAndDropMapItem doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (DragAndDropMapItem)initWithLabelMarker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  DragAndDropMapItem *v11;
  MapsAnalyticsHelper *v12;
  MapsAnalyticsHelper *analyticsHelper;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "featureAnnotation"));
  if (objc_msgSend(v4, "isCluster"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterFeatureAnnotations"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

    v5 = (void *)v7;
  }
  if (!v5 || !objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___CustomPOIAnnotation))
    goto LABEL_9;
  v8 = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "personalizedItem"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));

  if (v9)
  {
    v11 = -[DragAndDropMapItem initWithPersonalizedItem:](self, "initWithPersonalizedItem:", v9);

    if (!v11)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (!v10)
LABEL_9:
    v10 = objc_msgSend(objc_alloc((Class)MKMapItem), "_initWithLabelMarker:", v4);
  v11 = -[DragAndDropMapItem initWithMapItem:](self, "initWithMapItem:", v10);
  if (v11)
  {
LABEL_11:
    v12 = -[MapsAnalyticsHelper initWithLabelMarker:]([MapsAnalyticsHelper alloc], "initWithLabelMarker:", v4);
    analyticsHelper = v11->_analyticsHelper;
    v11->_analyticsHelper = v12;

  }
LABEL_12:

  return v11;
}

- (DragAndDropMapItem)initWithMapItem:(id)a3
{
  id v5;
  DragAndDropMapItem *v6;
  DragAndDropMapItem *v7;
  uint64_t v8;
  NSString *name;
  MapsAnalyticsHelper *v10;
  MapsAnalyticsHelper *analyticsHelper;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DragAndDropMapItem;
  v6 = -[DragAndDropMapItem init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    objc_storeStrong((id *)&v7->_originalMapItem, a3);
    objc_storeStrong(&v7->_presentationObject, a3);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v10 = -[MapsAnalyticsHelper initWithMapItem:]([MapsAnalyticsHelper alloc], "initWithMapItem:", v5);
    analyticsHelper = v7->_analyticsHelper;
    v7->_analyticsHelper = v10;

  }
  return v7;
}

- (DragAndDropMapItem)initWithAddress:(id)a3
{
  id v5;
  DragAndDropMapItem *v6;
  DragAndDropMapItem *v7;
  uint64_t v8;
  MKMapItem *originalMapItem;
  uint64_t v10;
  NSString *name;
  MapsAnalyticsHelper *v12;
  MapsAnalyticsHelper *analyticsHelper;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DragAndDropMapItem;
  v6 = -[DragAndDropMapItem init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_address, a3);
    v8 = objc_claimAutoreleasedReturnValue(-[AddressBookAddress geocodedMapItem](v7->_address, "geocodedMapItem"));
    originalMapItem = v7->_originalMapItem;
    v7->_originalMapItem = (MKMapItem *)v8;

    objc_storeStrong(&v7->_presentationObject, a3);
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "compositeName"));
    name = v7->_name;
    v7->_name = (NSString *)v10;

    if (v7->_originalMapItem)
      v12 = -[MapsAnalyticsHelper initWithMapItem:]([MapsAnalyticsHelper alloc], "initWithMapItem:", v7->_originalMapItem);
    else
      v12 = objc_alloc_init(MapsAnalyticsHelper);
    analyticsHelper = v7->_analyticsHelper;
    v7->_analyticsHelper = v12;

  }
  return v7;
}

- (DragAndDropMapItem)initWithRecentContact:(id)a3
{
  id v5;
  DragAndDropMapItem *v6;
  DragAndDropMapItem *v7;
  uint64_t v8;
  NSString *name;
  MapsAnalyticsHelper *v10;
  MapsAnalyticsHelper *analyticsHelper;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DragAndDropMapItem;
  v6 = -[DragAndDropMapItem init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_recentContact, a3);
    objc_storeStrong(&v7->_presentationObject, a3);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v10 = objc_alloc_init(MapsAnalyticsHelper);
    analyticsHelper = v7->_analyticsHelper;
    v7->_analyticsHelper = v10;

  }
  return v7;
}

- (DragAndDropMapItem)initWithPersonalizedItem:(id)a3
{
  id v4;
  DragAndDropMapItem *v5;
  uint64_t v6;
  SearchResult *searchResult;
  uint64_t v8;
  AddressBookAddress *address;
  uint64_t v10;
  MKMapItem *mapItem;
  void *v12;
  uint64_t v13;
  NSString *name;
  void *v15;
  void *v16;
  AddressBookAddress *v17;
  AddressBookAddress *v18;
  MKMapItem *presentationObject;
  MapsAnalyticsHelper *v20;
  MapsAnalyticsHelper *analyticsHelper;
  SearchResult *v23;
  MKMapItem *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)DragAndDropMapItem;
  v5 = -[DragAndDropMapItem init](&v25, "init");
  if (!v5)
    goto LABEL_12;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchResult"));
  searchResult = v5->_searchResult;
  v5->_searchResult = (SearchResult *)v6;

  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "address"));
  address = v5->_address;
  v5->_address = (AddressBookAddress *)v8;

  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
  mapItem = v5->_mapItem;
  v5->_mapItem = (MKMapItem *)v10;

  objc_storeStrong((id *)&v5->_originalMapItem, v5->_mapItem);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));
  name = v5->_name;
  v5->_name = (NSString *)v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parkedCar"));
  v16 = v15;
  if (v15)
  {
    v17 = v15;
LABEL_6:
    presentationObject = (MKMapItem *)v5->_presentationObject;
    v5->_presentationObject = v17;
LABEL_7:

    goto LABEL_8;
  }
  v18 = v5->_address;
  if (v18)
  {
    v17 = v18;
    goto LABEL_6;
  }
  v23 = v5->_searchResult;
  if (v23 || v5->_mapItem)
  {
    presentationObject = (MKMapItem *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](v23, "mapItem"));
    v24 = presentationObject;
    if (!presentationObject)
      v24 = v5->_mapItem;
    objc_storeStrong(&v5->_presentationObject, v24);
    goto LABEL_7;
  }
LABEL_8:
  if (v5->_originalMapItem)
    v20 = -[MapsAnalyticsHelper initWithMapItem:]([MapsAnalyticsHelper alloc], "initWithMapItem:", v5->_originalMapItem);
  else
    v20 = objc_alloc_init(MapsAnalyticsHelper);
  analyticsHelper = v5->_analyticsHelper;
  v5->_analyticsHelper = v20;

LABEL_12:
  return v5;
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
  -[DragAndDropMapItem _resolveMapItem](self, "_resolveMapItem");
}

- (void)_didResolveMapItem:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_resolvedMapItem, a3);
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[DragAndDropMapItem observer](self, "observer"));
  objc_msgSend(v6, "dragAndDropItem:didResolveMapItem:", self, self->_resolvedMapItem);

}

- (void)_resolveMapItem
{
  NSObject *v3;
  NSProgress *v4;
  MapItemResolver *v5;
  MapItemResolver *v6;
  MapItemResolver *v7;
  void *v8;
  MapItemResolver *resolver;
  MapItemResolver *v10;
  NSProgress *resolveProgress;
  NSProgress *v12;
  OS_dispatch_group *resolveGroup;
  _QWORD v14[4];
  MapItemResolver *v15;
  _QWORD v16[5];
  NSProgress *v17;
  NSObject *v18;

  if (!self->_resolveGroup)
  {
    v3 = dispatch_group_create();
    if (self->_address)
    {
      v4 = (NSProgress *)objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](NSProgress, "progressWithTotalUnitCount:", 100));
      -[NSProgress setCancellable:](v4, "setCancellable:", 0);
      v5 = -[MapItemResolver initWithAddress:]([MapItemResolver alloc], "initWithAddress:", self->_address);
      goto LABEL_4;
    }
    if (self->_recentContact)
    {
      v4 = (NSProgress *)objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](NSProgress, "progressWithTotalUnitCount:", 100));
      -[NSProgress setCancellable:](v4, "setCancellable:", 1);
      v7 = [MapItemResolver alloc];
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRRecentContact address](self->_recentContact, "address"));
      v6 = -[MapItemResolver initWithAddressString:](v7, "initWithAddressString:", v8);

      if (v6)
        goto LABEL_8;
    }
    else
    {
      if (self->_mapItem)
      {
        v4 = (NSProgress *)objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](NSProgress, "progressWithTotalUnitCount:", 100));
        -[NSProgress setCancellable:](v4, "setCancellable:", 1);
        v5 = -[MapItemResolver initWithMapItem:]([MapItemResolver alloc], "initWithMapItem:", self->_mapItem);
LABEL_4:
        v6 = v5;
        if (!v5)
          goto LABEL_11;
LABEL_8:
        dispatch_group_enter(v3);
        -[MapItemResolver setDelegate:](v6, "setDelegate:", self);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100219E88;
        v16[3] = &unk_1011ACA30;
        v16[4] = self;
        v4 = v4;
        v17 = v4;
        v18 = v3;
        -[MapItemResolver startWithCompletion:](v6, "startWithCompletion:", v16);
        -[NSProgress setPausable:](v4, "setPausable:", 0);
        if (-[NSProgress isCancellable](v4, "isCancellable"))
        {
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_100219EE8;
          v14[3] = &unk_1011AC860;
          v15 = v6;
          -[NSProgress setCancellationHandler:](v4, "setCancellationHandler:", v14);

        }
        goto LABEL_11;
      }
      v4 = 0;
      v6 = 0;
    }
LABEL_11:
    resolver = self->_resolver;
    self->_resolver = v6;
    v10 = v6;

    resolveProgress = self->_resolveProgress;
    self->_resolveProgress = v4;
    v12 = v4;

    resolveGroup = self->_resolveGroup;
    self->_resolveGroup = (OS_dispatch_group *)v3;

  }
}

- (NSItemProviderWriting)itemProviderWriting
{
  -[DragAndDropMapItem _resolveMapItem](self, "_resolveMapItem");
  return (NSItemProviderWriting *)self;
}

- (NSItemProvider)itemProvider
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)NSItemProvider);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropMapItem itemProviderWriting](self, "itemProviderWriting"));
  v5 = objc_msgSend(v3, "initWithObject:", v4);

  objc_msgSend(v5, "setSuggestedName:", self->_name);
  return (NSItemProvider *)v5;
}

+ (id)writableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem writableTypeIdentifiersForItemProvider](MKMapItem, "writableTypeIdentifiersForItemProvider"));
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeVCard, "identifier"));
  objc_msgSend(v2, "addObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
  objc_msgSend(v2, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeUTF8PlainText, "identifier"));
  objc_msgSend(v2, "addObject:", v6);

  v7 = objc_msgSend(v2, "copy");
  return v7;
}

+ (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  return 0;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  id v14;
  NSObject *resolveGroup;
  id v16;
  _QWORD block[5];
  _QWORD *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  DragAndDropMapItem *v23;
  id v24;
  _QWORD v25[5];

  v6 = a3;
  v7 = a4;
  if (self->_resolveProgress)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](NSProgress, "progressWithTotalUnitCount:", 100));
    if (-[NSProgress isCancellable](self->_resolveProgress, "isCancellable"))
    {
      objc_msgSend(v8, "setCancellable:", 1);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10021A244;
      v25[3] = &unk_1011AC860;
      v25[4] = self;
      objc_msgSend(v8, "setCancellationHandler:", v25);
    }
  }
  else
  {
    v8 = 0;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10021A2B4;
  v20[3] = &unk_1011ACAA8;
  v9 = v7;
  v24 = v9;
  v10 = v8;
  v21 = v10;
  v11 = v6;
  v22 = v11;
  v23 = self;
  v12 = objc_retainBlock(v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  if (v14 == (id)5)
  {
    ((void (*)(_QWORD *, MKMapItem *))v12[2])(v12, self->_originalMapItem);
  }
  else
  {
    resolveGroup = self->_resolveGroup;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10021A514;
    block[3] = &unk_1011ACAD0;
    block[4] = self;
    v19 = v12;
    dispatch_group_notify(resolveGroup, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  v16 = v10;

  return v16;
}

- (id)traitsForMapItemResolver:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultTraits"));

  return v4;
}

- (MKMapItem)draggedMapItem
{
  return self->_resolvedMapItem;
}

- (DragAndDropMapItemObserver)observer
{
  return (DragAndDropMapItemObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (id)presentationObject
{
  return self->_presentationObject;
}

- (MKMapItem)originalMapItem
{
  return self->_originalMapItem;
}

- (MKMapItem)resolvedMapItem
{
  return self->_resolvedMapItem;
}

- (CLLocationCoordinate2D)sourceCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_sourceCoordinate.latitude;
  longitude = self->_sourceCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setSourceCoordinate:(CLLocationCoordinate2D)a3
{
  self->_sourceCoordinate = a3;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (MapsAnalyticsHelper)analyticsHelper
{
  return self->_analyticsHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsHelper, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_originalMapItem, 0);
  objc_storeStrong(&self->_presentationObject, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_resolveProgress, 0);
  objc_storeStrong((id *)&self->_resolvedMapItem, 0);
  objc_storeStrong((id *)&self->_resolveGroup, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_recentContact, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
}

@end
