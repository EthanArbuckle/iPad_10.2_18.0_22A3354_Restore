@implementation ProductKitCatalogInternal

- (ProductKitCatalogInternal)init
{
  return (ProductKitCatalogInternal *)ProductKitCatalog.init()();
}

+ (BOOL)isProductKitURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  BOOL v7;
  uint64_t v9;

  v3 = sub_213B2BBD0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213B2BBA0();
  v7 = _s10ProductKit0aB7CatalogC02isaB3URLySb10Foundation0E0VFZ_0((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

- (void)updateCatalogWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  ProductKitCatalogInternal *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_213AFF00C;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_213B26860((uint64_t)sub_213AFF098, v6);

  swift_release();
  swift_release();
}

- (void)watchBandFilesForFeatureWithURL:(id)a3 featureString:(id)a4 variant:(id)a5 completionHandler:(id)a6
{
  sub_213AFDC64(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, (void (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t, id, void *))sub_213AFE620);
}

- (void)watchBandImageForFeatureWithURL:(id)a3 featureString:(id)a4 variant:(id)a5 completionHandler:(id)a6
{
  sub_213AFDC64(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, (void (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t, id, void *))sub_213AFEAF8);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___ProductKitCatalogInternal_assetManager);
  swift_release();
}

@end
