@implementation PXExtendedTraitCollection.EnvironmentStorage

- (_TtCE12PhotosUICoreCSo25PXExtendedTraitCollectionP33_5E66913795B6B06AAAB2221F88A6AAE318EnvironmentStorage)init
{
  objc_super v4;

  sub_1A7ADF534();
  v4.receiver = self;
  v4.super_class = (Class)_s18EnvironmentStorageCMa();
  return -[PXExtendedTraitCollection.EnvironmentStorage init](&v4, sel_init);
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self
     + OBJC_IVAR____TtCE12PhotosUICoreCSo25PXExtendedTraitCollectionP33_5E66913795B6B06AAAB2221F88A6AAE318EnvironmentStorage_values;
  v3 = sub_1A7ADF540();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
