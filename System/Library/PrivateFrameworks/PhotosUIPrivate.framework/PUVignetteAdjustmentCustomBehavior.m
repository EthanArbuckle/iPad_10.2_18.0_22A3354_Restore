@implementation PUVignetteAdjustmentCustomBehavior

- (void)dataSource:(id)a3 adjustmentInfo:(id)a4 populateNewAdjustmentController:(id)a5
{
  id v5;

  v5 = a5;
  objc_msgSend(v5, "setIntensity:", 0.4);
  objc_msgSend(v5, "setRadius:", 0.4);

}

@end
