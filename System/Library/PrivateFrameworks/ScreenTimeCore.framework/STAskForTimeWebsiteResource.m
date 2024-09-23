@implementation STAskForTimeWebsiteResource

- (STAskForTimeWebsiteResource)initWithWebsiteDomain:(id)a3 changeHandler:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STAskForTimeWebsiteResource;
  return -[STAskForTimeResource initWithResourceIdentifier:resourceDisplayName:usageType:changeHandler:](&v5, sel_initWithResourceIdentifier_resourceDisplayName_usageType_changeHandler_, a3, a3, 1, a4);
}

@end
