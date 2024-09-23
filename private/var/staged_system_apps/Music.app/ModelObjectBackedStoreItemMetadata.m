@implementation ModelObjectBackedStoreItemMetadata

- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithDownloadAssetDictionary:(id)a3
{
  return (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata *)sub_100ABB4E0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithDownloadAssetDictionary_);
}

- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithStorePlatformDictionary:(id)a3
{
  return (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata *)sub_100ABB4E0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithStorePlatformDictionary_);
}

- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithStorePlatformDictionary:(id)a3 parentStoreItemMetadata:(id)a4
{
  unsigned __int8 *v6;
  id v7;
  Class isa;
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v9;
  objc_super v11;

  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  *(_QWORD *)&self->MPStoreItemMetadata_opaque[OBJC_IVAR____TtC9MusicCore34ModelObjectBackedStoreItemMetadata_modelObject] = 0;
  v6 = &self->MPStoreItemMetadata_opaque[OBJC_IVAR____TtC9MusicCore34ModelObjectBackedStoreItemMetadata_modelObjectStoreID];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = a4;
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ModelObjectBackedStoreItemMetadata();
  v9 = -[ModelObjectBackedStoreItemMetadata initWithStorePlatformDictionary:parentStoreItemMetadata:](&v11, "initWithStorePlatformDictionary:parentStoreItemMetadata:", isa, v7);

  return v9;
}

- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithStorePlatformDictionary:(id)a3 expirationDate:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v6 = sub_100007E8C(&qword_1011D5D00);
  __chkstk_darwin(v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  if (a4)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v10 = type metadata accessor for Date(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 0, 1, v10);
  }
  else
  {
    v11 = type metadata accessor for Date(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  }
  return (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata *)ModelObjectBackedStoreItemMetadata.init(storePlatformDictionary:expirationDate:)(v9, (uint64_t)v8);
}

- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithStorePlatformDictionary:(id)a3 parentStoreItemMetadata:(id)a4 expirationDate:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v15;
  uint64_t v17;

  v8 = sub_100007E8C(&qword_1011D5D00);
  __chkstk_darwin(v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  if (a5)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v12 = type metadata accessor for Date(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for Date(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  }
  v14 = a4;
  v15 = (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata *)sub_100AC32EC(v11, (uint64_t)v14, (uint64_t)v10);

  return v15;
}

- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithStoreMusicAPIDictionary:(id)a3
{
  return (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata *)sub_100ABB4E0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithStoreMusicAPIDictionary_);
}

- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithCoder:(id)a3
{
  unsigned __int8 *v4;
  id v5;
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *result;

  *(_QWORD *)&self->MPStoreItemMetadata_opaque[OBJC_IVAR____TtC9MusicCore34ModelObjectBackedStoreItemMetadata_modelObject] = 0;
  v4 = &self->MPStoreItemMetadata_opaque[OBJC_IVAR____TtC9MusicCore34ModelObjectBackedStoreItemMetadata_modelObjectStoreID];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = a3;

  result = (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "MusicCore/ModelObjectBackedStoreItemMetadata.swift", 50, 2, 49, 0);
  __break(1u);
  return result;
}

- (id)metadataByAppendingMetadata:(id)a3
{
  id v4;
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v5;
  char *v6;

  v4 = a3;
  v5 = self;
  v6 = ModelObjectBackedStoreItemMetadata.appending(_:)((uint64_t)v4);

  return v6;
}

- (NSString)artistName
{
  return (NSString *)sub_100AC2F84(self, (uint64_t)a2, ModelObjectBackedStoreItemMetadata.artistName.getter);
}

- (id)artistStoreID
{
  return sub_100AC1968(self, (uint64_t)a2, (void (*)(_QWORD *__return_ptr))ModelObjectBackedStoreItemMetadata.artistStoreID.getter);
}

- (NSArray)audioTraits
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  Class isa;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.audioTraits.getter();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (BOOL)isBeats1
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  char v3;
  char v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.isBeats1.getter();
  v4 = v3;

  return v4 & 1;
}

- (NSString)collectionName
{
  return (NSString *)sub_100AC2F84(self, (uint64_t)a2, ModelObjectBackedStoreItemMetadata.collectionName.getter);
}

- (id)collectionStoreID
{
  return sub_100AC1968(self, (uint64_t)a2, (void (*)(_QWORD *__return_ptr))ModelObjectBackedStoreItemMetadata.collectionStoreID.getter);
}

- (BOOL)isCompilation
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  char v3;
  char v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.isCompilation.getter();
  v4 = v3;

  return v4 & 1;
}

- (NSString)composerName
{
  return (NSString *)sub_100AC2F84(self, (uint64_t)a2, ModelObjectBackedStoreItemMetadata.composerName.getter);
}

- (NSString)copyrightText
{
  return (NSString *)sub_100AC2F84(self, (uint64_t)a2, ModelObjectBackedStoreItemMetadata.copyrightText.getter);
}

- (NSString)curatorName
{
  return (NSString *)sub_100AC2F84(self, (uint64_t)a2, ModelObjectBackedStoreItemMetadata.curatorName.getter);
}

- (NSString)descriptionText
{
  return (NSString *)sub_100AC2F84(self, (uint64_t)a2, ModelObjectBackedStoreItemMetadata.descriptionText.getter);
}

- (int64_t)discCount
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.discCount.getter();
  v4 = v3;

  return v4;
}

- (int64_t)discNumber
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.discNumber.getter();
  v4 = v3;

  return v4;
}

- (double)duration
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  double v3;
  double v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.duration.getter();
  v4 = v3;

  return v4;
}

- (NSString)editorNotes
{
  return (NSString *)sub_100AC2F84(self, (uint64_t)a2, ModelObjectBackedStoreItemMetadata.editorNotes.getter);
}

- (NSString)shortEditorNotes
{
  return (NSString *)sub_100AC2F84(self, (uint64_t)a2, ModelObjectBackedStoreItemMetadata.shortEditorNotes.getter);
}

- (int64_t)episodeCount
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.episodeCount.getter();
  v4 = v3;

  return v4;
}

- (int64_t)explicitRating
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.explicitRating.getter();
  v4 = v3;

  return v4;
}

- (NSArray)genreNames
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  uint64_t v3;
  uint64_t v4;
  NSArray v5;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.genreNames.getter();
  v4 = v3;

  if (v4)
  {
    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v5.super.isa = 0;
  }
  return (NSArray *)v5.super.isa;
}

- (NSString)handle
{
  return (NSString *)sub_100AC2F84(self, (uint64_t)a2, ModelObjectBackedStoreItemMetadata.handle.getter);
}

- (BOOL)hasArtistBiography
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  char v3;
  char v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.hasArtistBiography.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)hasLyrics
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  char v3;
  char v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.hasLyrics.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)hasTimeSyncedLyrics
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  char v3;
  char v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.hasTimeSyncedLyrics.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)hasSocialPosts
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  char v3;
  char v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.hasSocialPosts.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isExplicitContent
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  char v3;
  char v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.isExplicitContent.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isMasteredForiTunes
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  char v3;
  char v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.isMasteredForiTunes.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isPreorder
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  char v3;
  char v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.isPreorder.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isPrivatePerson
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  char v3;
  char v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.isPrivatePerson.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isVerifiedPerson
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  char v3;
  char v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.isVerifiedPerson.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isOnboardedPerson
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  char v3;
  char v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.isOnboardedPerson.getter();
  v4 = v3;

  return v4 & 1;
}

- (NSString)itemKind
{
  return (NSString *)sub_100AC2F84(self, (uint64_t)a2, ModelObjectBackedStoreItemMetadata.itemKind.getter);
}

- (NSDate)lastModifiedDate
{
  return (NSDate *)sub_100AC111C(self, (uint64_t)a2, &qword_1011D5D00, (void (*)(void))ModelObjectBackedStoreItemMetadata.lastModifiedDate.getter, (uint64_t (*)(_QWORD))&type metadata accessor for Date, (uint64_t (*)(void))&Date._bridgeToObjectiveC());
}

- (int64_t)movementCount
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.movementCount.getter();
  v4 = v3;

  return v4;
}

- (NSString)movementName
{
  return (NSString *)sub_100AC2F84(self, (uint64_t)a2, ModelObjectBackedStoreItemMetadata.movementName.getter);
}

- (int64_t)movementNumber
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.movementNumber.getter();
  v4 = v3;

  return v4;
}

- (NSString)name
{
  return (NSString *)sub_100AC2F84(self, (uint64_t)a2, ModelObjectBackedStoreItemMetadata.name.getter);
}

- (NSString)nameRaw
{
  return (NSString *)sub_100AC2F84(self, (uint64_t)a2, ModelObjectBackedStoreItemMetadata.nameRaw.getter);
}

- (NSDate)releaseDate
{
  return (NSDate *)sub_100AC111C(self, (uint64_t)a2, &qword_1011D5D00, (void (*)(void))ModelObjectBackedStoreItemMetadata.releaseDate.getter, (uint64_t (*)(_QWORD))&type metadata accessor for Date, (uint64_t (*)(void))&Date._bridgeToObjectiveC());
}

- (id)socialProfileID
{
  return sub_100AC1968(self, (uint64_t)a2, (void (*)(_QWORD *__return_ptr))ModelObjectBackedStoreItemMetadata.socialProfileID.getter);
}

- (int64_t)seasonNumber
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.seasonNumber.getter();
  v4 = v3;

  return v4;
}

- (NSString)shortName
{
  return (NSString *)sub_100AC2F84(self, (uint64_t)a2, ModelObjectBackedStoreItemMetadata.shortName.getter);
}

- (NSURL)shortURL
{
  return (NSURL *)sub_100AC111C(self, (uint64_t)a2, &qword_1011D2AE0, (void (*)(void))ModelObjectBackedStoreItemMetadata.shortURL.getter, (uint64_t (*)(_QWORD))&type metadata accessor for URL, (uint64_t (*)(void))&URL._bridgeToObjectiveC());
}

- (BOOL)showComposer
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  char v3;
  char v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.showComposer.getter();
  v4 = v3;

  return v4 & 1;
}

- (id)storeID
{
  unsigned __int8 *v2;
  uint64_t v3;
  void *v4;
  _BYTE v6[24];
  _QWORD v7[2];

  v2 = &self->MPStoreItemMetadata_opaque[OBJC_IVAR____TtC9MusicCore34ModelObjectBackedStoreItemMetadata_modelObjectStoreID];
  swift_beginAccess(&self->MPStoreItemMetadata_opaque[OBJC_IVAR____TtC9MusicCore34ModelObjectBackedStoreItemMetadata_modelObjectStoreID], v6, 0, 0);
  v3 = *((_QWORD *)v2 + 1);
  if (!v3)
    return 0;
  v7[0] = *(_QWORD *)v2;
  v7[1] = v3;
  swift_bridgeObjectRetain();
  v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v7, &type metadata for String);
  sub_100334854((uint64_t)v7);
  return v4;
}

- (BOOL)isStoreRedownloadable
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  char v3;
  char v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.isStoreRedownloadable.getter();
  v4 = v3;

  return v4 & 1;
}

- (int64_t)trackCount
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.trackCount.getter();
  v4 = v3;

  return v4;
}

- (int64_t)trackNumber
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  ModelObjectBackedStoreItemMetadata.trackNumber.getter();
  v4 = v3;

  return v4;
}

- (NSURL)URL
{
  return (NSURL *)sub_100AC111C(self, (uint64_t)a2, &qword_1011D2AE0, (void (*)(void))ModelObjectBackedStoreItemMetadata.url.getter, (uint64_t (*)(_QWORD))&type metadata accessor for URL, (uint64_t (*)(void))&URL._bridgeToObjectiveC());
}

- (NSString)workName
{
  return (NSString *)sub_100AC2F84(self, (uint64_t)a2, ModelObjectBackedStoreItemMetadata.workName.getter);
}

- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)init
{
  _TtC9MusicCore34ModelObjectBackedStoreItemMetadata *result;

  result = (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata *)_swift_stdlib_reportUnimplementedInitializer("MusicCore.ModelObjectBackedStoreItemMetadata", 44, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->modelObject[OBJC_IVAR____TtC9MusicCore34ModelObjectBackedStoreItemMetadata_modelObjectStoreID]);
}

@end
