@implementation PKPGSVTransitionInterstitialSnapshotContainerView

- (PKPGSVTransitionInterstitialSnapshotContainerView)init
{

  return 0;
}

- (PKPGSVTransitionInterstitialSnapshotContainerView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (double)initWithSnapshotSize:(double)a3
{
  objc_super v5;

  if (result)
  {
    v5.receiver = result;
    v5.super_class = (Class)PKPGSVTransitionInterstitialSnapshotContainerView;
    result = (double *)objc_msgSendSuper2(&v5, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    if (result)
    {
      result[52] = a2;
      result[53] = a3;
    }
  }
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

@end
