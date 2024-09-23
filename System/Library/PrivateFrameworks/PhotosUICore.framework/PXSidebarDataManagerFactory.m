@implementation PXSidebarDataManagerFactory

+ (id)makeUtilityTypesDataSectionManagerWithLibrary:(id)a3 forPicker:(BOOL)a4
{
  id v5;
  char *v6;

  v5 = a3;
  v6 = sub_1A6E0A0B0(v5, a4);

  return v6;
}

+ (id)makeTopCollectionsDataSectionManagerWithLibrary:(id)a3
{
  id v3;
  char *v4;

  v3 = a3;
  v4 = sub_1A6E0A274(v3);

  return v4;
}

- (PXSidebarDataManagerFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSidebarDataManagerFactory;
  return -[PXSidebarDataManagerFactory init](&v3, sel_init);
}

@end
