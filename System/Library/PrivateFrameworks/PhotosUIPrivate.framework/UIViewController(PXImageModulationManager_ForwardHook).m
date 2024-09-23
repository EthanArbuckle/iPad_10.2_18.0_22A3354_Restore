@implementation UIViewController(PXImageModulationManager_ForwardHook)

- (double)px_effectiveImageModulationIntensityWithProposedValue:()PXImageModulationManager_ForwardHook
{
  void *v3;
  void *v4;
  double v5;

  objc_msgSend(a1, "pu_modalTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "imageModulationIntensity");
    a2 = v5;
  }

  return a2;
}

@end
