@implementation CuratedCollectionsListAnalyticsManager

- (CuratedCollectionsListAnalyticsManager)init
{
  CuratedCollectionsListAnalyticsManager *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CuratedCollectionsListAnalyticsManager;
  result = -[CuratedCollectionsListAnalyticsManager init](&v3, "init");
  if (result)
    result->_event.target = 260;
  return result;
}

- (void)curatedCollectionTappedWithMuid:(unint64_t)a3 verticalIndex:(unint64_t)a4 isCollectionSaved:(BOOL)a5
{
  _BOOL8 v5;
  NSNumber *v9;
  NSNumber *collectionId;
  NSNumber *v11;
  NSNumber *collectionCurrentlySaved;
  NSNumber *v13;
  NSNumber *verticalIndex;

  v5 = a5;
  -[CuratedCollectionsListAnalyticsManager cleanup](self, "cleanup");
  self->_event.action = 2099;
  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  collectionId = self->_event.collectionId;
  self->_event.collectionId = v9;

  v11 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
  collectionCurrentlySaved = self->_event.collectionCurrentlySaved;
  self->_event.collectionCurrentlySaved = v11;

  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  verticalIndex = self->_event.verticalIndex;
  self->_event.verticalIndex = v13;

  -[CuratedCollectionsListAnalyticsManager logEvent](self, "logEvent");
}

- (void)cleanup
{
  NSNumber *collectionId;
  NSNumber *collectionCurrentlySaved;
  NSNumber *verticalIndex;

  self->_event.action = 17099;
  collectionId = self->_event.collectionId;
  self->_event.collectionId = 0;

  collectionCurrentlySaved = self->_event.collectionCurrentlySaved;
  self->_event.collectionCurrentlySaved = 0;

  verticalIndex = self->_event.verticalIndex;
  self->_event.verticalIndex = 0;

}

- (void)logEvent
{
  +[GEOAPPortal captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:modules:](GEOAPPortal, "captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:modules:", self->_event.action, self->_event.target, 0, 0, 0, self->_event.collectionId, 0, self->_event.collectionCurrentlySaved, self->_event.verticalIndex, 0, 0, 0, 0, 0);
}

- (void).cxx_destruct
{

}

@end
