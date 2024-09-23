@implementation PXDaysViewKeyAssetHackService

- (id)title
{
  return CFSTR("Set as Day Key Asset");
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
  if (objc_msgSend(v4, "kind") && objc_msgSend(v4, "type") != 3)
  {
    v7.receiver = self;
    v7.super_class = (Class)PXDaysViewKeyAssetHackService;
    v5 = -[PXKeyAssetHackService shouldSetKeyAssetForHighlight:](&v7, sel_shouldSetKeyAssetForHighlight_, v4);
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

@end
