@implementation MPModelAlbum

- (id)pickableObjectFor:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 2)
    return 0;
  else
    return self;
}

- (void)loadCatalogSongsWithCompletionHandler:(id)a3
{
  sub_349854(self, (int)a2, a3, (void (*)(void))sub_34A918);
}

- (id)storeNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  MPModelAlbum *v9;
  void *v10;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_135B1B0, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  v10 = MPModelAlbum.orphanMusicVideo.getter();

  if (v10)
  {
    swift_release(v7);
    return 0;
  }
  else
  {
    v13[4] = sub_34BD80;
    v14 = v7;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 1107296256;
    v13[2] = sub_42D124;
    v13[3] = &block_descriptor_173;
    v12 = _Block_copy(v13);
    swift_release(v14);
    return v12;
  }
}

- (void)loadLibraryRequestedProperties:(id)a3 completionHandler:(id)a4
{
  sub_34A634(self, (int)a2, a3, a4, (uint64_t)&unk_135B138, (uint64_t)sub_34BD78, (void (*)(id, uint64_t, uint64_t))sub_348EC0);
}

- (void)loadLibrarySongsWithCompletionHandler:(id)a3
{
  sub_34A110(self, (int)a2, a3, (uint64_t)&unk_135B0C0, (uint64_t)sub_34BD78, sub_3490CC);
}

- (id)libraryNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  MPModelAlbum *v9;
  void *v10;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_135B070, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  v10 = MPModelAlbum.orphanMusicVideo.getter();

  if (v10)
  {
    swift_release(v7);
    return 0;
  }
  else
  {
    v13[4] = sub_34BD80;
    v14 = v7;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 1107296256;
    v13[2] = sub_42D124;
    v13[3] = &block_descriptor_146;
    v12 = _Block_copy(v13);
    swift_release(v14);
    return v12;
  }
}

+ (id)requiredLibraryNavigationHandlerProperties
{
  return sub_34AB70();
}

- (NSString)shortDescription
{
  MPModelAlbum *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  Swift::String v8;
  Swift::String v9;
  NSString v10;

  v2 = self;
  v3 = -[MPModelAlbum title](v2, "title", 0x22203A656C746954);
  if (v3)
  {
    v4 = v3;
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v7 = v6;

  }
  else
  {
    v7 = (void *)0xEE006D75626C4120;
    v5 = 0x64656C7469746E55;
  }
  v8._countAndFlagsBits = v5;
  v8._object = v7;
  String.append(_:)(v8);
  swift_bridgeObjectRelease(v7);
  v9._countAndFlagsBits = 34;
  v9._object = (void *)0xE100000000000000;
  String.append(_:)(v9);

  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xE800000000000000);
  return (NSString *)v10;
}

@end
