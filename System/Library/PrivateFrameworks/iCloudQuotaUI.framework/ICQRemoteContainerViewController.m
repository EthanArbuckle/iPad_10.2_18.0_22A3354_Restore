@implementation ICQRemoteContainerViewController

- (ICQRemoteContainerViewController)initWithRootViewController:(id)a3
{
  id v5;
  uint64_t v6;
  ICQRemoteContainerViewController *v7;
  ICQRemoteContainerViewController *v8;
  ICQRemoteContainerViewController *v9;
  void *v10;
  uint64_t v11;
  __objc2_class *v12;
  ICQRemoteContainerViewController *v13;
  objc_super v15;

  v5 = a3;
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    if (v11 == 1)
      v12 = ICQRemoteContaineriPadViewController;
    else
      v12 = ICQRemoteContaineriPhoneViewController;
    v9 = (ICQRemoteContainerViewController *)objc_msgSend([v12 alloc], "initWithRootViewController:", v5);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)ICQRemoteContainerViewController;
    v7 = -[ICQRemoteContainerViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, 0, 0);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_rootViewController, a3);
    v9 = v8;
    self = v9;
  }
  v13 = v9;

  return v13;
}

- (ICQRemoteContainerViewController)init
{
  -[ICQRemoteContainerViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICQRemoteContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  -[ICQRemoteContainerViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);

  return 0;
}

- (ICQRemoteContainerViewController)initWithCoder:(id)a3
{
  -[ICQRemoteContainerViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return 30;
  else
    return 2;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end
