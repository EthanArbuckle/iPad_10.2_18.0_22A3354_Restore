@implementation PlaylistCovers.ArtworkDataSource

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return 1;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  return 0;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  id v4;
  _TtCO9MusicCore14PlaylistCovers17ArtworkDataSource *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = PlaylistCovers.ArtworkDataSource.existingRepresentation(for:)(v4);

  return v6;
}

- (void)loadRepresentationForArtworkCatalog:(MPArtworkCatalog *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  MPArtworkCatalog *v15;
  _TtCO9MusicCore14PlaylistCovers17ArtworkDataSource *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_1000057B4((uint64_t *)&unk_1004BFBC0);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10047B620, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10047B648, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1004C10A8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10047B670, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1004C10B8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1001AECA8((uint64_t)v9, (uint64_t)&unk_1004C10C8, (uint64_t)v14);
  swift_release(v17);
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  id v4;
  _TtCO9MusicCore14PlaylistCovers17ArtworkDataSource *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v10;
  _BYTE v11[32];

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, "token");
  _bridgeAnyObjectToAny(_:)(v6);
  swift_unknownObjectRelease(v6);
  v7 = type metadata accessor for PlaylistCovers.ArtworkToken();
  if (swift_dynamicCast(&v10, v11, (char *)&type metadata for Any + 8, v7, 6))
    v8 = v10;
  else
    v8 = 0;

  return v8;
}

- (_TtCO9MusicCore14PlaylistCovers17ArtworkDataSource)init
{
  uint64_t v3;
  id v4;
  _TtCO9MusicCore14PlaylistCovers17ArtworkDataSource *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtCO9MusicCore14PlaylistCovers17ArtworkDataSource_cache;
  v4 = objc_allocWithZone((Class)NSCache);
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, "init");

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for PlaylistCovers.ArtworkDataSource();
  return -[PlaylistCovers.ArtworkDataSource init](&v7, "init");
}

- (void).cxx_destruct
{

}

@end
