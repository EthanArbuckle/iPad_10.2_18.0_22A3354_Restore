@implementation PXTitleLegibilityDimmingViewConfiguration

- (PXTitleLegibilityDimmingViewConfiguration)initWithGradientImageName:(id)a3
{
  id v5;
  PXTitleLegibilityDimmingViewConfiguration *v6;
  PXTitleLegibilityDimmingViewConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXTitleLegibilityDimmingViewConfiguration;
  v6 = -[PXTitleLegibilityDimmingViewConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_gradientImageName, a3);

  return v7;
}

- (NSString)gradientImageName
{
  return self->_gradientImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientImageName, 0);
}

@end
