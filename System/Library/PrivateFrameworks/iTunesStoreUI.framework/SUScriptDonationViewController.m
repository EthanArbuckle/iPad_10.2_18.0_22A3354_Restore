@implementation SUScriptDonationViewController

- (SUScriptDonationViewController)initWithCharityIdentifier:(id)a3
{
  SUScriptDonationViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptDonationViewController;
  v4 = -[SUScriptObject init](&v6, sel_init);
  if (v4)
    v4->_charityIdentifier = (NSString *)objc_msgSend(a3, "copy");
  return v4;
}

- (id)newNativeViewController
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = ISUIMobileStoreUIFramework();
  v4 = (void *)objc_msgSend(objc_alloc((Class)ISUIWeakLinkedClassForString(CFSTR("SUUIDonationViewController"), v3)), "initWithCharityIdentifier:", self->_charityIdentifier);
  v5 = ISUIMobileStoreUIFramework();
  objc_msgSend(v4, "setClientContext:", objc_msgSend(ISUIWeakLinkedClassForString(CFSTR("SUUIClientContext"), v5), "defaultContext"));
  return v4;
}

- (id)_className
{
  return CFSTR("iTunesDonationViewController");
}

@end
