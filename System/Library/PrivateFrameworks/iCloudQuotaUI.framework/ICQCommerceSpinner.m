@implementation ICQCommerceSpinner

- (void)loadView
{
  ICQCommerceSpinnerView *v3;
  void *v4;
  ICQCommerceSpinnerView *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICQCommerceSpinner;
  -[ICQCommerceSpinner loadView](&v7, sel_loadView);
  v3 = [ICQCommerceSpinnerView alloc];
  -[ICQCommerceSpinner view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v5 = -[ICQCommerceSpinnerView initWithFrame:](v3, "initWithFrame:");

  -[ICQCommerceSpinnerView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  -[ICQCommerceSpinner view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

}

- (id)specifiers
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
