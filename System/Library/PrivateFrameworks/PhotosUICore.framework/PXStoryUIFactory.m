@implementation PXStoryUIFactory

+ (id)viewControllerWithConfiguration:(id)a3 contentViewController:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  -[objc_class viewControllerWithConfiguration:contentViewController:](NSClassFromString(CFSTR("PUStoryUISwiftFactory")), "viewControllerWithConfiguration:contentViewController:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)feedViewControllerWithConfiguration:(id)a3
{
  id v3;
  PXFeedViewController *v4;

  v3 = a3;
  v4 = -[PXFeedViewController initWithConfiguration:]([PXFeedViewController alloc], "initWithConfiguration:", v3);

  return v4;
}

+ (id)feedGadgetWithConfiguration:(id)a3
{
  id v3;
  PXFeedGadget *v4;

  v3 = a3;
  v4 = -[PXFeedGadget initWithConfiguration:]([PXFeedGadget alloc], "initWithConfiguration:", v3);

  return v4;
}

+ (id)thumbnailActionPerformerWithModel:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  -[objc_class thumbnailActionPerformerWithModel:](NSClassFromString(CFSTR("PUStoryUISwiftFactory")), "thumbnailActionPerformerWithModel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
