@implementation AutocompleteAnalyticsManager

- (AutocompleteAnalyticsManager)init
{
  AutocompleteAnalyticsManager *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AutocompleteAnalyticsManager;
  result = -[AutocompleteAnalyticsManager init](&v3, "init");
  if (result)
    result->_curatedCollectionsEvent.target = 11;
  return result;
}

- (void)curatedCollectionTappedWithMUID:(unint64_t)a3 isCurrentlySaved:(BOOL)a4 verticalIndex:(int64_t)a5
{
  _BOOL8 v6;
  NSNumber *v9;
  NSNumber *collectionId;
  NSNumber *v11;
  NSNumber *collectionCurrentlySaved;
  NSNumber *v13;
  NSNumber *verticalIndex;

  v6 = a4;
  -[AutocompleteAnalyticsManager cleanupCuratedCollectionsEvent](self, "cleanupCuratedCollectionsEvent");
  self->_curatedCollectionsEvent.action = 2099;
  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  collectionId = self->_curatedCollectionsEvent.collectionId;
  self->_curatedCollectionsEvent.collectionId = v9;

  v11 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
  collectionCurrentlySaved = self->_curatedCollectionsEvent.collectionCurrentlySaved;
  self->_curatedCollectionsEvent.collectionCurrentlySaved = v11;

  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
  verticalIndex = self->_curatedCollectionsEvent.verticalIndex;
  self->_curatedCollectionsEvent.verticalIndex = v13;

  -[AutocompleteAnalyticsManager logCuratedCollectionsEvent](self, "logCuratedCollectionsEvent");
}

- (void)publisherTappedWithMuid:(unint64_t)a3 verticalIndex:(int64_t)a4
{
  void *v7;
  NSArray *v8;
  NSArray *publisherIds;
  NSNumber *v10;
  NSNumber *verticalIndex;
  void *v12;

  -[AutocompleteAnalyticsManager cleanupCuratedCollectionsEvent](self, "cleanupCuratedCollectionsEvent");
  self->_curatedCollectionsEvent.action = 2102;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v12 = v7;
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  publisherIds = self->_curatedCollectionsEvent.publisherIds;
  self->_curatedCollectionsEvent.publisherIds = v8;

  v10 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  verticalIndex = self->_curatedCollectionsEvent.verticalIndex;
  self->_curatedCollectionsEvent.verticalIndex = v10;

  -[AutocompleteAnalyticsManager logCuratedCollectionsEvent](self, "logCuratedCollectionsEvent");
}

- (void)publisherChildItemButtonTappedWithPublisherMuid:(unint64_t)a3 verticalIndex:(int64_t)a4
{
  void *v7;
  NSArray *v8;
  NSArray *publisherIds;
  NSNumber *v10;
  NSNumber *verticalIndex;
  void *v12;

  -[AutocompleteAnalyticsManager cleanupCuratedCollectionsEvent](self, "cleanupCuratedCollectionsEvent");
  self->_curatedCollectionsEvent.action = 2195;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v12 = v7;
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  publisherIds = self->_curatedCollectionsEvent.publisherIds;
  self->_curatedCollectionsEvent.publisherIds = v8;

  v10 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  verticalIndex = self->_curatedCollectionsEvent.verticalIndex;
  self->_curatedCollectionsEvent.verticalIndex = v10;

  -[AutocompleteAnalyticsManager logCuratedCollectionsEvent](self, "logCuratedCollectionsEvent");
}

- (void)placeContextSingleCollectionTappedWithMuid:(unint64_t)a3 isCurrentlySaved:(BOOL)a4 verticalIndex:(int64_t)a5
{
  _BOOL8 v6;
  NSNumber *v9;
  NSNumber *collectionId;
  NSNumber *v11;
  NSNumber *collectionCurrentlySaved;
  NSNumber *v13;
  NSNumber *verticalIndex;
  NSString *value;
  id v16;

  v6 = a4;
  -[AutocompleteAnalyticsManager cleanupCuratedCollectionsEvent](self, "cleanupCuratedCollectionsEvent");
  self->_curatedCollectionsEvent.action = 2099;
  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  collectionId = self->_curatedCollectionsEvent.collectionId;
  self->_curatedCollectionsEvent.collectionId = v9;

  v11 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
  collectionCurrentlySaved = self->_curatedCollectionsEvent.collectionCurrentlySaved;
  self->_curatedCollectionsEvent.collectionCurrentlySaved = v11;

  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
  verticalIndex = self->_curatedCollectionsEvent.verticalIndex;
  self->_curatedCollectionsEvent.verticalIndex = v13;

  value = self->_curatedCollectionsEvent.value;
  self->_curatedCollectionsEvent.value = (NSString *)CFSTR("Hyperlink");

  -[AutocompleteAnalyticsManager logCuratedCollectionsEvent](self, "logCuratedCollectionsEvent");
  v16 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v16, "captureUserAction:onTarget:eventValue:", 198, 11, CFSTR("PLACE_SUMMARY_LAYOUT_UNIT_TYPE_CURATED_GUIDES"));

}

- (void)placeContextMultipleCollectionsTappedWithMuids:(id)a3 verticalIndex:(int64_t)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *value;
  NSNumber *v16;
  NSNumber *verticalIndex;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a3;
  -[AutocompleteAnalyticsManager cleanupCuratedCollectionsEvent](self, "cleanupCuratedCollectionsEvent");
  self->_curatedCollectionsEvent.action = 2100;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v12), "stringValue", (_QWORD)v19));
        objc_msgSend(v7, "addObject:", v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v14 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", ")));
  value = self->_curatedCollectionsEvent.value;
  self->_curatedCollectionsEvent.value = v14;

  v16 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  verticalIndex = self->_curatedCollectionsEvent.verticalIndex;
  self->_curatedCollectionsEvent.verticalIndex = v16;

  -[AutocompleteAnalyticsManager logCuratedCollectionsEvent](self, "logCuratedCollectionsEvent");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v18, "captureUserAction:onTarget:eventValue:", 198, 11, CFSTR("PLACE_SUMMARY_LAYOUT_UNIT_TYPE_CURATED_GUIDES"));

}

- (void)guidesHomeChildItemButtonTappedWithVerticalIndex:(int64_t)a3
{
  NSNumber *v5;
  NSNumber *verticalIndex;

  -[AutocompleteAnalyticsManager cleanupCuratedCollectionsEvent](self, "cleanupCuratedCollectionsEvent");
  self->_curatedCollectionsEvent.action = 258;
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  verticalIndex = self->_curatedCollectionsEvent.verticalIndex;
  self->_curatedCollectionsEvent.verticalIndex = v5;

  -[AutocompleteAnalyticsManager logCuratedCollectionsEvent](self, "logCuratedCollectionsEvent");
}

- (void)cleanupCuratedCollectionsEvent
{
  NSString *value;
  NSNumber *collectionId;
  NSArray *publisherIds;
  NSNumber *collectionCurrentlySaved;
  NSNumber *verticalIndex;

  self->_curatedCollectionsEvent.action = 17099;
  value = self->_curatedCollectionsEvent.value;
  self->_curatedCollectionsEvent.value = 0;

  collectionId = self->_curatedCollectionsEvent.collectionId;
  self->_curatedCollectionsEvent.collectionId = 0;

  publisherIds = self->_curatedCollectionsEvent.publisherIds;
  self->_curatedCollectionsEvent.publisherIds = 0;

  collectionCurrentlySaved = self->_curatedCollectionsEvent.collectionCurrentlySaved;
  self->_curatedCollectionsEvent.collectionCurrentlySaved = 0;

  verticalIndex = self->_curatedCollectionsEvent.verticalIndex;
  self->_curatedCollectionsEvent.verticalIndex = 0;

}

- (void)logCuratedCollectionsEvent
{
  +[GEOAPPortal captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:modules:](GEOAPPortal, "captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:modules:", self->_curatedCollectionsEvent.action, self->_curatedCollectionsEvent.target, self->_curatedCollectionsEvent.value, self->_curatedCollectionsEvent.publisherIds, 0, self->_curatedCollectionsEvent.collectionId, 0, self->_curatedCollectionsEvent.collectionCurrentlySaved, self->_curatedCollectionsEvent.verticalIndex, 0, 0, 0, 0, 0);
}

- (void)userGeneratedGuideUnitTapped
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 73, 11, 0);

  v3 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 198, 11, CFSTR("PLACE_SUMMARY_LAYOUT_UNIT_TYPE_USER_GENERATED_GUIDES"));

}

- (void)containmentParentUnitTappedWithMuid:(unint64_t)a3
{
  void *v4;
  id v5;

  v5 = objc_alloc_init((Class)GEOPlaceActionDetails);
  objc_msgSend(v5, "setBusinessID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:placeActionDetails:", 198, 11, CFSTR("PLACE_SUMMARY_LAYOUT_UNIT_TYPE_CONTAINMENT"), v5);

}

- (void)tappableEntryUnitTappedWithMuid:(unint64_t)a3
{
  void *v4;
  id v5;

  v5 = objc_alloc_init((Class)GEOPlaceActionDetails);
  objc_msgSend(v5, "setBusinessID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:placeActionDetails:", 198, 11, CFSTR("PLACE_SUMMARY_LAYOUT_UNIT_TYPE_STRING"), v5);

}

- (void)resultRefinementTappedWithKey:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 200, 11, v3);

}

- (void)addAPlaceTappedWithNumberOfResults:(unint64_t)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 222, 11, v4);

}

- (void).cxx_destruct
{
  sub_1007DA85C((id *)&self->_curatedCollectionsEvent);
}

@end
