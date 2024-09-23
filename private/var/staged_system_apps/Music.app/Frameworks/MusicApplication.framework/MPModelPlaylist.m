@implementation MPModelPlaylist

- (NSString)ownerName
{
  MPModelPlaylist *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1EA384();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)loadCatalogSongsWithCompletionHandler:(id)a3
{
  sub_349854(self, (int)a2, a3, (void (*)(void))sub_34AD34);
}

- (id)storeNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4
{
  return sub_34A1A8((int)self, (int)a2, (int)a3, a4, (uint64_t)&unk_135AE40, (uint64_t)sub_34BD80, (uint64_t)&block_descriptor_98_0);
}

- (void)loadLibraryRequestedProperties:(id)a3 completionHandler:(id)a4
{
  sub_34A634(self, (int)a2, a3, a4, (uint64_t)&unk_135ADC8, (uint64_t)sub_34BD78, (void (*)(id, uint64_t, uint64_t))sub_3498D4);
}

- (void)loadLibrarySongsWithCompletionHandler:(id)a3
{
  sub_34A110(self, (int)a2, a3, (uint64_t)&unk_135ACD8, (uint64_t)sub_34BD78, sub_349B14);
}

- (id)libraryNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4
{
  return sub_34A1A8((int)self, (int)a2, (int)a3, a4, (uint64_t)&unk_135AC88, (uint64_t)sub_34BD80, (uint64_t)&block_descriptor_63_1);
}

- (NSString)sortStorageKeyDomain
{
  MPModelPlaylist *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  MPModelPlaylist.sortStorageKeyDomain.getter();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSArray)preferredTracklistSortDescriptors
{
  MPModelPlaylist *v2;
  uint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = MPModelPlaylist.preferredTracklistSortDescriptors.getter();

  if (v3)
  {
    sub_CCC930();
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (NSString)shortDescription
{
  return (NSString *)sub_D9B75C(self, (uint64_t)a2, (void (*)(void))sub_D9B0C4);
}

@end
