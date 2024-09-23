@implementation PKMerchantMapViewController

- (PKMerchantMapViewController)initWithMapItem:(id)a3
{
  return -[PKMerchantMapViewController initWithMapItem:configOptions:](self, "initWithMapItem:configOptions:", a3, 0);
}

- (PKMerchantMapViewController)initWithMapItem:(id)a3 configOptions:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PKMerchantMapViewController *v10;
  PKMerchantMapViewController *v11;
  objc_super v13;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0D47408]);
  objc_msgSend(v7, "setOptions:", a4);
  PKPassKitCoreBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEffectiveBundleIdentifier:", v9);

  v13.receiver = self;
  v13.super_class = (Class)PKMerchantMapViewController;
  v10 = -[MUPlaceViewController initWithConfiguration:](&v13, sel_initWithConfiguration_, v7);
  v11 = v10;
  if (v10)
    -[MUPlaceViewController setMapItem:](v10, "setMapItem:", v6);

  return v11;
}

@end
