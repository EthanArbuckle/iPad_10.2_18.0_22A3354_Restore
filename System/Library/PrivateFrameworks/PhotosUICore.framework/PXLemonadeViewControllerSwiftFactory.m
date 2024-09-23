@implementation PXLemonadeViewControllerSwiftFactory

+ (id)viewControllerWithPhotoLibrary:(id)a3
{
  void *v4;
  id v5;
  id v6;
  char *v7;

  type metadata accessor for RootViewControllerFactory();
  v4 = (void *)objc_opt_self();
  v5 = a3;
  v6 = objc_msgSend(v4, sel_defaultManager);
  v7 = sub_1A71CB960(v5, v6);

  return v7;
}

+ (unint64_t)sidebarRoutingOptionsForDestination:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  v4 = _s12PhotosUICore29LemonadeViewControllerFactoryC21sidebarRoutingOptions3forSo024PXProgrammaticNavigationhI0VSo0kL11DestinationC_tFZ_0(v3);

  return v4;
}

+ (id)viewControllerForSidebarNavigationDestination:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  char *v7;

  v5 = a3;
  v6 = a4;
  v7 = _s12PhotosUICore29LemonadeViewControllerFactoryC04rootdE031forSidebarNavigationDestination12photoLibrary17selectionDelegate19pickerConfigurationSo06UIViewE0CSo014PXProgrammaticjK0C_So07PHPhotoM0CAA0c6Pickera9SelectionO0_pSgAA0uQ0CSgtFZ_0(v5, v6, 0, 0, 0);

  return v7;
}

- (PXLemonadeViewControllerSwiftFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LemonadeViewControllerFactory();
  return -[PXLemonadeViewControllerSwiftFactory init](&v3, sel_init);
}

@end
