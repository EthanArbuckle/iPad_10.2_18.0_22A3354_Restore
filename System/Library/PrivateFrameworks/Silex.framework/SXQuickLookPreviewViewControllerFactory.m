@implementation SXQuickLookPreviewViewControllerFactory

- (id)viewControllerForFile:(id)a3 transitionContext:(id)a4
{
  id v5;
  id v6;
  SXQuickLookPreviewViewController *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SXQuickLookPreviewViewController initWithFile:transitionContext:]([SXQuickLookPreviewViewController alloc], "initWithFile:transitionContext:", v6, v5);

  return v7;
}

@end
