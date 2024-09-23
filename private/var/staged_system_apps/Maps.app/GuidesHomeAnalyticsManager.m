@implementation GuidesHomeAnalyticsManager

- (GuidesHomeAnalyticsManager)initWithGuideLocationId:(id)a3 isCuratedGuidesHome:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  GuidesHomeAnalyticsManager *v7;
  uint64_t v8;
  uint64_t v9;
  OS_dispatch_queue *utilityQueue;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GuidesHomeAnalyticsManager;
  v7 = -[GuidesHomeAnalyticsManager init](&v12, "init");
  if (v7)
  {
    v8 = geo_dispatch_queue_create_with_qos("GuidesHomeAnalyticsManager.utilityQueue", 17);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    utilityQueue = v7->_utilityQueue;
    v7->_utilityQueue = (OS_dispatch_queue *)v9;

    v7->event.cardType = 14;
    -[GuidesHomeAnalyticsManager updateAnalyticsManagerWithGuideLocationId:isCuratedGuidesHome:](v7, "updateAnalyticsManagerWithGuideLocationId:isCuratedGuidesHome:", v6, v4);
  }

  return v7;
}

- (void)updateAnalyticsManagerWithGuideLocationId:(id)a3 isCuratedGuidesHome:(BOOL)a4
{
  _BOOL4 v4;
  GEOMapItemIdentifier *v7;
  GEOMapItemIdentifier *guideLocationId;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  int v13;
  int v14;
  GEOMapItemIdentifier *v15;

  v4 = a4;
  v7 = (GEOMapItemIdentifier *)a3;
  guideLocationId = self->_guideLocationId;
  if (guideLocationId == v7)
    goto LABEL_12;
  v9 = sub_1004316CC();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (guideLocationId)
  {
    if (v11)
    {
      v14 = 138412290;
      v15 = v7;
      v12 = "GuidesHomeAnalyticsManager *refreshed* to report analytics for : %@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v14, 0xCu);
    }
  }
  else if (v11)
  {
    v14 = 138412290;
    v15 = v7;
    v12 = "GuidesHomeAnalyticsManager initialized to report analytics for : %@";
    goto LABEL_7;
  }

  objc_storeStrong((id *)&self->_guideLocationId, a3);
  self->_isCuratedGuidesHome = v4;
  if (v4)
    v13 = 19;
  else
    v13 = 28;
  self->event.target = v13;
LABEL_12:

}

- (void)guidesHomeTappedFeaturedGuide:(id)a3 publisherId:(id)a4 isCurrentlySaved:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *utilityQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10086DCC8;
  v13[3] = &unk_1011D9968;
  objc_copyWeak(&v16, &location);
  v13[4] = self;
  v14 = v8;
  v17 = a5;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(utilityQueue, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)guidesHomeCitySelectorTapped
{
  NSObject *utilityQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10086DE94;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(utilityQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)guidesHomeCityGuidesMoreButtonTapped
{
  NSObject *utilityQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10086DFE0;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(utilityQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)guidesHomeRevealed
{
  NSObject *utilityQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10086E124;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(utilityQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)guidesHomeTappedCityGuide:(id)a3 atIndex:(unint64_t)a4 carouselIndex:(unint64_t)a5
{
  id v8;
  NSObject *utilityQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13[3];
  id location;

  v8 = a3;
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10086E308;
  v11[3] = &unk_1011D9990;
  objc_copyWeak(v13, &location);
  v11[4] = self;
  v12 = v8;
  v13[1] = (id)a4;
  v13[2] = (id)a5;
  v10 = v8;
  dispatch_async(utilityQueue, v11);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)guidesHomeTappedPublisher:(id)a3 atIndex:(unint64_t)a4 carouselIndex:(unint64_t)a5
{
  id v8;
  NSObject *utilityQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13[3];
  id location;

  v8 = a3;
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10086E524;
  v11[3] = &unk_1011D9990;
  objc_copyWeak(v13, &location);
  v11[4] = self;
  v12 = v8;
  v13[1] = (id)a4;
  v13[2] = (id)a5;
  v10 = v8;
  dispatch_async(utilityQueue, v11);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)guidesHomeTappedLatestGuide:(id)a3 publisherId:(id)a4 isCurrentlySaved:(BOOL)a5 atIndex:(unint64_t)a6 carouselIndex:(unint64_t)a7
{
  id v12;
  id v13;
  NSObject *utilityQueue;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20[3];
  BOOL v21;
  id location;

  v12 = a3;
  v13 = a4;
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10086E768;
  v17[3] = &unk_1011D99B8;
  objc_copyWeak(v20, &location);
  v17[4] = self;
  v18 = v12;
  v21 = a5;
  v19 = v13;
  v20[1] = (id)a6;
  v20[2] = (id)a7;
  v15 = v13;
  v16 = v12;
  dispatch_async(utilityQueue, v17);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

- (void)guidesHomeTappedTemporalGuide:(id)a3 publisherId:(id)a4 isCurrentlySaved:(BOOL)a5 atIndex:(unint64_t)a6 carouselIndex:(unint64_t)a7
{
  id v12;
  id v13;
  NSObject *utilityQueue;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20[3];
  BOOL v21;
  id location;

  v12 = a3;
  v13 = a4;
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10086E9CC;
  v17[3] = &unk_1011D99B8;
  objc_copyWeak(v20, &location);
  v17[4] = self;
  v18 = v12;
  v21 = a5;
  v19 = v13;
  v20[1] = (id)a6;
  v20[2] = (id)a7;
  v15 = v13;
  v16 = v12;
  dispatch_async(utilityQueue, v17);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

- (void)guidesHomeTappedEditorPickedGuide:(id)a3 publisherId:(id)a4 isCurrentlySaved:(BOOL)a5 atIndex:(unint64_t)a6 carouselIndex:(unint64_t)a7
{
  id v12;
  id v13;
  NSObject *utilityQueue;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20[3];
  BOOL v21;
  id location;

  v12 = a3;
  v13 = a4;
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10086EC30;
  v17[3] = &unk_1011D99B8;
  objc_copyWeak(v20, &location);
  v17[4] = self;
  v18 = v12;
  v21 = a5;
  v19 = v13;
  v20[1] = (id)a6;
  v20[2] = (id)a7;
  v15 = v13;
  v16 = v12;
  dispatch_async(utilityQueue, v17);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

- (void)guideHomeTappedFilter:(id)a3 atIndex:(unint64_t)a4 carouselIndex:(unint64_t)a5
{
  id v8;
  NSObject *utilityQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13[3];
  id location;

  v8 = a3;
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10086EE60;
  v11[3] = &unk_1011D9990;
  objc_copyWeak(v13, &location);
  v11[4] = self;
  v12 = v8;
  v13[1] = (id)a4;
  v13[2] = (id)a5;
  v10 = v8;
  dispatch_async(utilityQueue, v11);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)guidesHomeDisplayFilteredGuideList:(id)a3
{
  id v4;
  NSObject *utilityQueue;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10086F010;
  v7[3] = &unk_1011AFF10;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(utilityQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)guidesHomeTappedFilteredGuide:(id)a3 publisherId:(id)a4 isCurrentlySaved:(BOOL)a5 atIndex:(unint64_t)a6 carouselIndex:(unint64_t)a7 filterValue:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *utilityQueue;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25[3];
  BOOL v26;
  id location;

  v14 = a3;
  v15 = a4;
  v16 = a8;
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10086F318;
  block[3] = &unk_1011D9A08;
  objc_copyWeak(v25, &location);
  block[4] = self;
  v22 = v14;
  v26 = a5;
  v25[1] = (id)a6;
  v25[2] = (id)a7;
  v23 = v15;
  v24 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  dispatch_async(utilityQueue, block);

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

- (void)guidesHomeScrolledUp
{
  NSObject *utilityQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10086F528;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(utilityQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)guidesHomeScrolledDown
{
  NSObject *utilityQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10086F66C;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(utilityQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)guidesHomeClosed
{
  NSObject *utilityQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10086F7B0;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(utilityQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)logEvent
{
  uint64_t action;
  uint64_t target;
  NSString *value;
  NSNumber *publisherId;
  void *v7;
  NSNumber *collectionId;
  NSNumber *horizontalIndex;
  void *v10;
  __int128 v11;
  NSNumber *v12;

  action = self->event.action;
  target = self->event.target;
  value = self->event.value;
  publisherId = self->event.publisherId;
  if (publisherId)
  {
    v12 = self->event.publisherId;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  }
  else
  {
    v7 = 0;
  }
  collectionId = self->event.collectionId;
  v11 = *(_OWORD *)&self->event.collectionCurrentlySaved;
  horizontalIndex = self->event.horizontalIndex;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->event.cardType));
  +[GEOAPPortal captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:providerId:repeatableSectionIndex:modules:](GEOAPPortal, "captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:providerId:repeatableSectionIndex:modules:", action, target, value, v7, 0, collectionId, 0, v11, horizontalIndex, v10, self->event.possibleActions, self->event.impossibleActions, self->event.providerId, self->event.repeatableIndex, 0);

  if (publisherId)
}

- (void)cleanUp
{
  NSString *value;
  NSNumber *collectionId;
  NSNumber *collectionCurrentlySaved;
  NSNumber *verticalIndex;
  NSNumber *horizontalIndex;
  NSMutableArray *v8;
  NSMutableArray *possibleActions;
  NSMutableArray *v10;
  NSMutableArray *impossibleActions;
  NSNumber *repeatableIndex;
  NSNumber *providerId;

  self->event.action = 0;
  value = self->event.value;
  self->event.value = 0;

  collectionId = self->event.collectionId;
  self->event.collectionId = 0;

  collectionCurrentlySaved = self->event.collectionCurrentlySaved;
  self->event.collectionCurrentlySaved = 0;

  verticalIndex = self->event.verticalIndex;
  self->event.verticalIndex = 0;

  horizontalIndex = self->event.horizontalIndex;
  self->event.horizontalIndex = 0;

  v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  possibleActions = self->event.possibleActions;
  self->event.possibleActions = v8;

  v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  impossibleActions = self->event.impossibleActions;
  self->event.impossibleActions = v10;

  repeatableIndex = self->event.repeatableIndex;
  self->event.repeatableIndex = 0;

  providerId = self->event.providerId;
  self->event.providerId = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utilityQueue, 0);
  objc_storeStrong((id *)&self->_guideLocationId, 0);

}

@end
