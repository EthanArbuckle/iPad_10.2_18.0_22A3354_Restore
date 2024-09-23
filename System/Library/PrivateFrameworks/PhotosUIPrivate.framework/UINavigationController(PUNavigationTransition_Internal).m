@implementation UINavigationController(PUNavigationTransition_Internal)

- (double)px_imageModulationIntensityWithProposedValue:()PUNavigationTransition_Internal
{
  void *v3;
  double v4;

  objc_msgSend(a1, "pu_currentNavigationTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isInteractive"))
  {
    objc_msgSend(v3, "imageModulationIntensity");
    a2 = v4;
  }

  return a2;
}

@end
