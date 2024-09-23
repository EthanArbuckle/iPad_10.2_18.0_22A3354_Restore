@implementation SXConditionValidationContext

- (SXConditionValidationContext)initWithLayoutOptions:(id)a3
{
  id v5;
  SXConditionValidationContext *v6;
  SXConditionValidationContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXConditionValidationContext;
  v6 = -[SXConditionValidationContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_layoutOptions, a3);

  return v7;
}

- (unint64_t)numberOfColumns
{
  void *v2;
  unint64_t v3;

  -[SXLayoutOptions columnLayout](self->_layoutOptions, "columnLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfColumns");

  return v3;
}

- (NSString)contentSizeCategory
{
  return -[SXLayoutOptions contentSizeCategory](self->_layoutOptions, "contentSizeCategory");
}

- (int64_t)horizontalSizeClass
{
  void *v2;
  int64_t v3;

  -[SXLayoutOptions traitCollection](self->_layoutOptions, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "horizontalSizeClass");

  return v3;
}

- (int64_t)verticalSizeClass
{
  void *v2;
  int64_t v3;

  -[SXLayoutOptions traitCollection](self->_layoutOptions, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verticalSizeClass");

  return v3;
}

- (CGSize)viewportSize
{
  double v2;
  double v3;
  CGSize result;

  -[SXLayoutOptions viewportSize](self->_layoutOptions, "viewportSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)testing
{
  return -[SXLayoutOptions testing](self->_layoutOptions, "testing");
}

- (unint64_t)viewingLocation
{
  return -[SXLayoutOptions viewingLocation](self->_layoutOptions, "viewingLocation");
}

- (BOOL)isBundleSubscriber
{
  return -[SXLayoutOptions bundleSubscriptionStatus](self->_layoutOptions, "bundleSubscriptionStatus") == 1;
}

- (BOOL)isBundleTrialEligible
{
  return -[SXLayoutOptions bundleSubscriptionStatus](self->_layoutOptions, "bundleSubscriptionStatus") == 3;
}

- (BOOL)isChannelSubscriber
{
  return -[SXLayoutOptions channelSubscriptionStatus](self->_layoutOptions, "channelSubscriptionStatus") == 1;
}

- (int64_t)userInterfaceStyle
{
  void *v2;
  int64_t v3;

  -[SXLayoutOptions traitCollection](self->_layoutOptions, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  return v3;
}

- (double)contentScaleFactor
{
  double result;

  -[SXLayoutOptions contentScaleFactor](self->_layoutOptions, "contentScaleFactor");
  return result;
}

- (unint64_t)newsletterSubscriptionStatus
{
  return -[SXLayoutOptions newsletterSubscriptionStatus](self->_layoutOptions, "newsletterSubscriptionStatus");
}

- (int64_t)offerUpsellScenario
{
  return -[SXLayoutOptions offerUpsellScenario](self->_layoutOptions, "offerUpsellScenario");
}

- (int64_t)subscriptionActivationEligibility
{
  return -[SXLayoutOptions subscriptionActivationEligibility](self->_layoutOptions, "subscriptionActivationEligibility");
}

- (NSSet)conditionKeys
{
  return -[SXLayoutOptions conditionKeys](self->_layoutOptions, "conditionKeys");
}

- (SXLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end
