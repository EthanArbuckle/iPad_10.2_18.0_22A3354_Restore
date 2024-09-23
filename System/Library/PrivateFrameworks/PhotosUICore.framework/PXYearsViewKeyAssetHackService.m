@implementation PXYearsViewKeyAssetHackService

- (id)title
{
  return CFSTR("Set as Month/Year Key Asset");
}

- (BOOL)canPerformAction
{
  void *v3;
  BOOL v4;

  if (!objc_msgSend((id)objc_opt_class(), "keyAssetHackServiceIsEnabled"))
    return 0;
  -[PXKeyAssetHackService asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)shouldSetKeyAssetForHighlight:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "kind") == 1 || objc_msgSend(v4, "kind") == 2)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXYearsViewKeyAssetHackService;
    v5 = -[PXMonthsViewKeyAssetHackService shouldSetKeyAssetForHighlight:](&v7, sel_shouldSetKeyAssetForHighlight_, v4);
  }

  return v5;
}

@end
