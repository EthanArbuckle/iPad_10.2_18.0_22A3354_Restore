@implementation WRM_iRATProximityRecommendation

- (WRM_iRATProximityRecommendation)init
{
  WRM_iRATProximityRecommendation *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WRM_iRATProximityRecommendation;
  v2 = -[WRM_iRATProximityRecommendation init](&v4, sel_init);
  if (v2)
    -[WRM_iRATProximityRecommendation setMetrics:](v2, "setMetrics:", objc_alloc_init(WRM_iRATProximityRecommendationLogging));
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  if (-[WRM_iRATProximityRecommendation metrics](self, "metrics"))
  {

    -[WRM_iRATProximityRecommendation setMetrics:](self, "setMetrics:", 0);
  }
  v3.receiver = self;
  v3.super_class = (Class)WRM_iRATProximityRecommendation;
  -[WRM_iRATProximityRecommendation dealloc](&v3, sel_dealloc);
}

- (int)RecommendationType
{
  return self->_RecommendationType;
}

- (void)setRecommendationType:(int)a3
{
  self->_RecommendationType = a3;
}

- (BOOL)linkRecommendationIsValid
{
  return self->_linkRecommendationIsValid;
}

- (void)setLinkRecommendationIsValid:(BOOL)a3
{
  self->_linkRecommendationIsValid = a3;
}

- (BOOL)linkIsRecommended
{
  return self->_linkIsRecommended;
}

- (void)setLinkIsRecommended:(BOOL)a3
{
  self->_linkIsRecommended = a3;
}

- (WRM_iRATProximityRecommendationLogging)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
