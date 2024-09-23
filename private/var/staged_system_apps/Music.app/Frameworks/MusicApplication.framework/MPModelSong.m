@implementation MPModelSong

- (id)pickableObjectFor:(int64_t)a3
{
  MPModelSong *v4;

  v4 = 0;
  if ((unint64_t)a3 <= 4 && ((1 << a3) & 0x13) != 0)
    v4 = self;
  return v4;
}

- (NSString)musicTypeIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (BOOL)shouldVisuallyDisableFor:(int64_t)a3
{
  return ((unint64_t)a3 > 7) | (0x3Eu >> a3) & 1;
}

- (id)storeNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4
{
  return sub_34A7F0(self, (int)a2, a3, a4, (uint64_t (*)(id))sub_34AF8C, (uint64_t)&block_descriptor_52_0);
}

+ (id)requiredStoreNavigationHandlerProperties
{
  return sub_34B0B4();
}

- (void)loadLibraryRequestedProperties:(id)a3 completionHandler:(id)a4
{
  sub_34A634(self, (int)a2, a3, a4, (uint64_t)&unk_135ABC0, (uint64_t)sub_34BA5C, (void (*)(id, uint64_t, uint64_t))sub_34A378);
}

- (void)loadCatalogSongsWithCompletionHandler:(void *)aBlock
{
  void *v4;
  id v5;

  v4 = _Block_copy(aBlock);
  _Block_copy(v4);
  v5 = a1;
  sub_34B2A4(v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (id)libraryNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4
{
  return sub_34A7F0(self, (int)a2, a3, a4, (uint64_t (*)(id))sub_34B3BC, (uint64_t)&block_descriptor_29_2);
}

+ (id)requiredLibraryNavigationHandlerProperties
{
  return sub_34B730();
}

- (NSString)shortDescription
{
  return (NSString *)sub_D9B75C(self, (uint64_t)a2, (void (*)(void))sub_D9ACFC);
}

- (double)preferredArtworkAspectRatio
{
  MPModelSong *v2;
  double v3;

  v2 = self;
  v3 = sub_DC6570();

  return v3;
}

@end
