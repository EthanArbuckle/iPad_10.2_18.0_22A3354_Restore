@implementation GKRecommendationEntryCacheObject

+ (id)entityName
{
  return CFSTR("RecommendationEntry");
}

- (void)updateWithServerRepresentation:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKRecommendationEntryCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v4, "updateWithServerRepresentation:", a3);
  -[GKRecommendationEntryCacheObject setViewed:](self, "setViewed:", 0);
  -[GKRecommendationEntryCacheObject setDisplayedToUser:](self, "setDisplayedToUser:", 0);
}

@end
