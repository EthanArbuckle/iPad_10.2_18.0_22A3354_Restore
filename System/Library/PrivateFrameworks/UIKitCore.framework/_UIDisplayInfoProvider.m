@implementation _UIDisplayInfoProvider

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->displayConfiguration;
}

- (unint64_t)artworkSubtype
{
  return self->artworkSubtype;
}

- (double)homeAffordanceOverlayAllowance
{
  return self->homeAffordanceOverlayAllowance;
}

- (double)systemMinimumMargin
{
  return self->systemMinimumMargin;
}

- (UIEdgeInsets)peripheryInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->peripheryInsets.top;
  left = self->peripheryInsets.left;
  bottom = self->peripheryInsets.bottom;
  right = self->peripheryInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsPortrait
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->safeAreaInsetsPortrait.top;
  left = self->safeAreaInsetsPortrait.left;
  bottom = self->safeAreaInsetsPortrait.bottom;
  right = self->safeAreaInsetsPortrait.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (_UIDisplayInfoShape)exclusionArea
{
  return self->exclusionArea;
}

- (UIEdgeInsets)safeAreaInsetsLandscapeLeft
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->safeAreaInsetsLandscapeLeft.top;
  left = self->safeAreaInsetsLandscapeLeft.left;
  bottom = self->safeAreaInsetsLandscapeLeft.bottom;
  right = self->safeAreaInsetsLandscapeLeft.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsLandscapeRight
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->safeAreaInsetsLandscapeRight.top;
  left = self->safeAreaInsetsLandscapeRight.left;
  bottom = self->safeAreaInsetsLandscapeRight.bottom;
  right = self->safeAreaInsetsLandscapeRight.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsPortraitUpsideDown
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->safeAreaInsetsPortraitUpsideDown.top;
  left = self->safeAreaInsetsPortraitUpsideDown.left;
  bottom = self->safeAreaInsetsPortraitUpsideDown.bottom;
  right = self->safeAreaInsetsPortraitUpsideDown.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->exclusionArea, 0);
  objc_storeStrong((id *)&self->displayConfiguration, 0);
}

@end
