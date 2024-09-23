@implementation MPModelForYouRecommendationGroup

- (BOOL)shouldDisplayUtterances
{
  return -[MPModelForYouRecommendationGroup traits](self, "traits") & 1;
}

@end
