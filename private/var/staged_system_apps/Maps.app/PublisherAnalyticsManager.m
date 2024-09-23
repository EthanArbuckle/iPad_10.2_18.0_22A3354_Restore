@implementation PublisherAnalyticsManager

- (PublisherAnalyticsManager)initWithPublisherId:(id)a3 usingAttribution:(id)a4
{
  id v6;
  id v7;
  PublisherAnalyticsManager *v8;
  PublisherAnalyticsManager *v9;
  NSNumber *v10;
  NSNumber *publisherId;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PublisherAnalyticsManager;
  v8 = -[PublisherAnalyticsManager init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    *(_QWORD *)&v8->event.target = 0xE00000105;
    v10 = (NSNumber *)objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLongLong:", objc_msgSend(v6, "muid"));
    publisherId = v9->event.publisherId;
    v9->event.publisherId = v10;

    objc_storeStrong((id *)&v9->_attribution, a4);
  }

  return v9;
}

- (void)publisherTrayRevealed
{
  -[PublisherAnalyticsManager cleanUp](self, "cleanUp");
  self->event.action = 21;
  -[PublisherAnalyticsManager logEvent](self, "logEvent");
}

- (void)publisherHeaderAppButtonTapped
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[PublisherAnalyticsManager cleanUp](self, "cleanUp");
  self->event.action = 2103;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2170));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOCollectionPublisherAttribution websiteURL](self->_attribution, "websiteURL"));
  v4 = 72;
  if (!v3)
    v4 = 80;
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "addObject:", v6);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2097));
  -[NSMutableArray addObject:](self->event.possibleActions, "addObject:", v5);
  -[PublisherAnalyticsManager logEvent](self, "logEvent");

}

- (void)publisherHeaderShareButtonTapped
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[PublisherAnalyticsManager cleanUp](self, "cleanUp");
  self->event.action = 2097;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2103));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOCollectionPublisherAttribution applicationAdamId](self->_attribution, "applicationAdamId"));
  if (v3)
    v4 = 72;
  else
    v4 = 80;
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "addObject:", v8);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2170));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOCollectionPublisherAttribution websiteURL](self->_attribution, "websiteURL"));
  if (v6)
    v7 = 72;
  else
    v7 = 80;
  objc_msgSend(*(id *)((char *)&self->super.isa + v7), "addObject:", v5);

  -[PublisherAnalyticsManager logEvent](self, "logEvent");
}

- (void)publisherHeaderWebsiteButtonTapped
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[PublisherAnalyticsManager cleanUp](self, "cleanUp");
  self->event.action = 2170;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2103));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOCollectionPublisherAttribution applicationAdamId](self->_attribution, "applicationAdamId"));
  v4 = 72;
  if (!v3)
    v4 = 80;
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "addObject:", v6);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2097));
  -[NSMutableArray addObject:](self->event.possibleActions, "addObject:", v5);
  -[PublisherAnalyticsManager logEvent](self, "logEvent");

}

- (void)publisherHeaderCloseButtonTapped
{
  -[PublisherAnalyticsManager cleanUp](self, "cleanUp");
  self->event.action = 4;
  -[PublisherAnalyticsManager logEvent](self, "logEvent");
}

- (void)publisherCollectionsScrolledDown
{
  -[PublisherAnalyticsManager cleanUp](self, "cleanUp");
  self->event.action = 8;
  -[PublisherAnalyticsManager logEvent](self, "logEvent");
}

- (void)publisherCollectionsScrolledUp
{
  -[PublisherAnalyticsManager cleanUp](self, "cleanUp");
  self->event.action = 7;
  -[PublisherAnalyticsManager logEvent](self, "logEvent");
}

- (void)publisherFilterTappedWithValue:(id)a3 atIndex:(unint64_t)a4
{
  NSString *v6;
  NSString *value;
  NSString *v8;
  NSNumber *v9;
  NSNumber *horizontalIndex;

  v6 = (NSString *)a3;
  -[PublisherAnalyticsManager cleanUp](self, "cleanUp");
  self->event.action = 49;
  value = self->event.value;
  self->event.value = v6;
  v8 = v6;

  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  horizontalIndex = self->event.horizontalIndex;
  self->event.horizontalIndex = v9;

  -[PublisherAnalyticsManager logEvent](self, "logEvent");
}

- (void)publisherCollectionTapped:(id)a3 atIndex:(unint64_t)a4 isCurrentlySaved:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSNumber *v10;
  NSNumber *collectionId;
  NSNumber *v12;
  NSNumber *collectionCurrentlySaved;
  NSNumber *v14;
  NSNumber *verticalIndex;

  v5 = a5;
  v8 = a3;
  -[PublisherAnalyticsManager cleanUp](self, "cleanUp");
  self->event.action = 2099;
  v9 = objc_msgSend(v8, "muid");

  v10 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v9));
  collectionId = self->event.collectionId;
  self->event.collectionId = v10;

  v12 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
  collectionCurrentlySaved = self->event.collectionCurrentlySaved;
  self->event.collectionCurrentlySaved = v12;

  v14 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  verticalIndex = self->event.verticalIndex;
  self->event.verticalIndex = v14;

  -[PublisherAnalyticsManager logEvent](self, "logEvent");
}

- (void)publisherTryAgainTapped
{
  -[PublisherAnalyticsManager cleanUp](self, "cleanUp");
  self->event.action = 2171;
  -[PublisherAnalyticsManager logEvent](self, "logEvent");
}

- (void)logEvent
{
  uint64_t action;
  uint64_t target;
  NSString *value;
  void *v6;
  NSNumber *collectionId;
  NSNumber *horizontalIndex;
  void *v9;
  __int128 v10;
  NSNumber *publisherId;

  action = self->event.action;
  target = self->event.target;
  value = self->event.value;
  publisherId = self->event.publisherId;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &publisherId, 1));
  collectionId = self->event.collectionId;
  v10 = *(_OWORD *)&self->event.collectionCurrentlySaved;
  horizontalIndex = self->event.horizontalIndex;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->event.cardType));
  +[GEOAPPortal captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:modules:](GEOAPPortal, "captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:modules:", action, target, value, v6, 0, collectionId, 0, v10, horizontalIndex, v9, self->event.possibleActions, self->event.impossibleActions, 0);

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

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribution, 0);
  sub_10026DEA8((id *)&self->event);
}

@end
