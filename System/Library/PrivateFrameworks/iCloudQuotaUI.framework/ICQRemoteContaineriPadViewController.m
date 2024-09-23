@implementation ICQRemoteContaineriPadViewController

- (ICQRemoteContaineriPadViewController)initWithRootViewController:(id)a3
{
  ICQRemoteContaineriPadViewController *v3;
  ICQRemoteContaineriPadViewController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICQRemoteContaineriPadViewController;
  v3 = -[ICQRemoteContainerViewController initWithRootViewController:](&v7, sel_initWithRootViewController_, a3);
  v4 = v3;
  if (v3)
  {
    -[ICQRemoteContaineriPadViewController setModalPresentationStyle:](v3, "setModalPresentationStyle:", 0);
    -[ICQRemoteContainerViewController rootViewController](v4, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setModalPresentationStyle:", 2);

  }
  return v4;
}

@end
