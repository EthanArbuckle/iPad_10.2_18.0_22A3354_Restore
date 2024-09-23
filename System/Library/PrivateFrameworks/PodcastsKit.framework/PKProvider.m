@implementation PKProvider

+ (void)createLibraryWithCompletion:(id)a3
{
  sub_22FB313CC((int)a1, (int)a2, a3, (uint64_t (*)(_QWORD))type metadata accessor for CoreDataLibrary);
}

+ (void)createCatalogWithCompletion:(id)a3
{
  sub_22FB313CC((int)a1, (int)a2, a3, (uint64_t (*)(_QWORD))type metadata accessor for Catalog);
}

+ (void)createPlayerControllerWithCompletion:(id)a3
{
  sub_22FB313CC((int)a1, (int)a2, a3, (uint64_t (*)(_QWORD))type metadata accessor for ProxyPlayerController);
}

- (PKProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Provider();
  return -[PKProvider init](&v3, sel_init);
}

@end
