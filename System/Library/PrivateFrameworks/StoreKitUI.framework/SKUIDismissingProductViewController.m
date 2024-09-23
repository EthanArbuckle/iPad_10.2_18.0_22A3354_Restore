@implementation SKUIDismissingProductViewController

- (SKUIDismissingProductViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SKUIDismissingProductViewController *v4;
  SKUIDismissingProductViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUIDismissingProductViewController;
  v4 = -[SKStoreProductViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[SKStoreProductViewController setDelegate:](v4, "setDelegate:", v4);
  return v5;
}

- (void)productViewControllerDidFinish:(id)a3
{
  -[SKStoreProductViewController setDelegate:](self, "setDelegate:", 0);
  -[SKStoreProductViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

@end
