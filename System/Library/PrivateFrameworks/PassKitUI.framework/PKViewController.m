@implementation PKViewController

- (PKViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKViewController;
  return -[PKViewController initWithNibName:bundle:](&v3, sel_initWithNibName_bundle_, 0, 0);
}

- (PKViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (void)loadView
{
  PKView *v3;

  v3 = objc_alloc_init(PKView);
  -[PKViewController setView:](self, "setView:", v3);

}

@end
