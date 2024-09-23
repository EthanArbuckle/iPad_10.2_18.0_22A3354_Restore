@implementation PKOpaqueDataServiceProviderOrder

- (void)setServiceProviderData:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKOpaqueDataServiceProviderOrder;
  -[PKServiceProviderOrder setServiceProviderData:](&v3, sel_setServiceProviderData_, a3);
}

@end
