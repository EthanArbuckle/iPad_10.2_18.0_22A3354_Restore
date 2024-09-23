@implementation SBSearchBackdropView(SBSpotlightBackgroundWeighting)

- (uint64_t)spotlightBackgroundWeighting
{
  objc_msgSend(a1, "transitionProgress");
  return objc_msgSend(a1, "isTransitioningToBlurred");
}

- (uint64_t)setSpotlightBackgroundWeighting:()SBSpotlightBackgroundWeighting
{
  int v4;
  double v5;

  v4 = objc_msgSend(a1, "isTransitioningToBlurred");
  v5 = 1.0 - a2;
  if (v4)
    v5 = a2;
  return objc_msgSend(a1, "setTransitionProgress:", v5);
}

@end
