@implementation BCCardStackConfiguration

- (BCCardStackConfiguration)initWithEnvironment:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCCardStackConfiguration;
  return -[BCLayoutConfiguration initWithViewController:configurationEnvironment:](&v4, "initWithViewController:configurationEnvironment:", 0, a3);
}

- (int64_t)_viewport
{
  void *v2;
  double v3;
  double v4;
  int64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v2, "screenSize");
  v5 = BCViewportSize(v3, v4);

  return v5;
}

- (double)cardExpandedTopOffset
{
  unsigned int v2;
  double result;

  v2 = -[BCCardStackConfiguration cardsCanExpand](self, "cardsCanExpand");
  result = -100.0;
  if (!v2)
    return 0.0;
  return result;
}

- (double)cardUnexpandedTopOffset
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  int v9;
  unsigned int v10;
  double v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfiguration environment](self, "environment"));
  objc_msgSend(v3, "defaultStatusBarHeight");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v6, "userInterfaceIdiom") != (char *)&dword_0 + 1)
    goto LABEL_4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfiguration environment](self, "environment"));
  if (objc_msgSend(v7, "isCompactWidth"))
  {

LABEL_4:
    v8 = 0.0;
    goto LABEL_8;
  }
  v9 = _os_feature_enabled_impl("UIKit", "uip_floating_tab_bar_only");

  if (v9)
    v8 = v5;
  else
    v8 = 0.0;
LABEL_8:
  v10 = -[BCCardStackConfiguration cardsCanExpand](self, "cardsCanExpand");
  v11 = 44.0;
  if (v10)
    v11 = 13.0;
  return v8 + v5 + v11;
}

- (double)cardGap
{
  unsigned __int8 v3;
  double result;
  int64_t v5;

  v3 = -[BCCardStackConfiguration cardsCanExpand](self, "cardsCanExpand");
  result = 4.0;
  if ((v3 & 1) == 0)
  {
    v5 = -[BCCardStackConfiguration _viewport](self, "_viewport", 4.0);
    result = 4.0;
    if (v5 == 2)
      result = 8.0;
    if (v5 == 3)
      return 12.0;
  }
  return result;
}

- (double)cardCornerRadius
{
  void *v2;
  double v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfiguration environment](self, "environment"));
  if (objc_msgSend(v2, "isCompactWidth"))
    v3 = 12.0;
  else
    v3 = 16.0;

  return v3;
}

- (double)auxiliaryNavigationBarHorizontalInset
{
  void *v2;
  double v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfiguration environment](self, "environment"));
  if (objc_msgSend(v2, "isCompactWidth"))
    v3 = 12.0;
  else
    v3 = 15.0;

  return v3;
}

- (double)auxiliaryNavigationBarVerticalInset
{
  void *v2;
  double v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfiguration environment](self, "environment"));
  if (objc_msgSend(v2, "isCompactWidth"))
    v3 = 12.0;
  else
    v3 = 15.0;

  return v3;
}

- (double)auxiliaryNavigationBarVisibilityOffset
{
  void *v3;
  double v4;
  double v5;
  double result;

  if (-[BCCardStackConfiguration cardsCanExpand](self, "cardsCanExpand"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfiguration environment](self, "environment"));
    objc_msgSend(v3, "defaultStatusBarHeight");
    v5 = v4;

    return v5;
  }
  else
  {
    -[BCCardStackConfiguration auxiliaryNavigationBarBlurBleedHeight](self, "auxiliaryNavigationBarBlurBleedHeight");
  }
  return result;
}

- (double)auxiliaryNavigationBarBlurBleedHeight
{
  return 24.0;
}

- (double)cardPeekWidth
{
  return 12.0;
}

- (BOOL)cardsCanExpand
{
  char v3;
  void *v4;
  unsigned __int8 v5;
  char v6;
  double v7;
  double v8;
  double v9;

  v3 = _os_feature_enabled_impl("UIKit", "uip_floating_tab_bar_only");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfiguration environment](self, "environment"));
  v5 = objc_msgSend(v4, "isCompactWidth");
  v6 = v3 ^ 1 | v5;
  if ((v3 & 1) == 0 && (v5 & 1) == 0)
  {
    objc_msgSend(v4, "size");
    v8 = v7;
    -[BCCardStackConfiguration maxCardWidth](self, "maxCardWidth");
    v6 = v8 <= v9;
  }

  return v6;
}

- (double)cardContractedScale
{
  unsigned int v3;
  double result;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = -[BCCardStackConfiguration cardsCanExpand](self, "cardsCanExpand");
  result = 1.0;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfiguration environment](self, "environment", 1.0));
    objc_msgSend(v5, "size");
    v7 = v6;

    -[BCCardStackConfiguration cardGap](self, "cardGap");
    v9 = v8;
    -[BCCardStackConfiguration cardPeekWidth](self, "cardPeekWidth");
    return (v7 + (v9 + v10) * -2.0) / v7;
  }
  return result;
}

- (unint64_t)cardBufferCount
{
  return 2;
}

- (double)maxCardWidth
{
  return 678.0;
}

+ (id)createCardSetPresentationTimingParameters
{
  void *v2;

  v2 = (void *)objc_opt_class(a1, a2);
  return _objc_msgSend(v2, "createCardSetPresentationTimingParametersWithInitialVelocity:", 0.0, 0.0);
}

+ (id)createCardSetPresentationTimingParametersWithInitialVelocity:(CGVector)a3
{
  return objc_msgSend(objc_alloc((Class)UISpringTimingParameters), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 380.0, 32.0, a3.dx, a3.dy);
}

- (double)contractedCardWidthForContainerWidth:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double result;

  -[BCCardStackConfiguration cardPeekWidth](self, "cardPeekWidth");
  v6 = a3 - v5 * 2.0;
  -[BCCardStackConfiguration cardGapForContainerWidth:](self, "cardGapForContainerWidth:", a3);
  v8 = v6 - v7 * 2.0;
  -[BCCardStackConfiguration maxCardWidth](self, "maxCardWidth");
  if (v8 < result)
    return v8;
  return result;
}

- (double)minCardGap
{
  return self->_minCardGap;
}

- (double)maxCardGap
{
  return self->_maxCardGap;
}

- (double)macOSCoverAnimationThreshold
{
  return self->_macOSCoverAnimationThreshold;
}

- (double)animationExtraCardGap
{
  return self->_animationExtraCardGap;
}

- (double)toolbarHeight
{
  return self->_toolbarHeight;
}

- (void)setToolbarHeight:(double)a3
{
  self->_toolbarHeight = a3;
}

@end
