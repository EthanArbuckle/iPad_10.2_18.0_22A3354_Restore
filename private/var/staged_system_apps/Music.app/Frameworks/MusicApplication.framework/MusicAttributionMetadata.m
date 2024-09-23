@implementation MusicAttributionMetadata

+ (NSString)didChangeNotificationName
{
  if (qword_14AAF70 != -1)
    swift_once(&qword_14AAF70, sub_35476C);
  return (NSString *)(id)qword_15800B0;
}

- (NSString)title
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->title[OBJC_IVAR___MusicAttributionMetadata_title];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->title[OBJC_IVAR___MusicAttributionMetadata_title]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___MusicAttributionMetadata_title);
  v7 = *(_QWORD *)&self->title[OBJC_IVAR___MusicAttributionMetadata_title];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (MPArtworkCatalog)artworkCatalog
{
  return (MPArtworkCatalog *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___MusicAttributionMetadata_artworkCatalog));
}

- (void)setArtworkCatalog:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MusicAttributionMetadata_artworkCatalog);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MusicAttributionMetadata_artworkCatalog) = (Class)a3;
  v3 = a3;

}

- (MPArtworkCatalog)placeholderArtworkCatalog
{
  return (MPArtworkCatalog *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___MusicAttributionMetadata_placeholderArtworkCatalog));
}

- (void)setPlaceholderArtworkCatalog:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MusicAttributionMetadata_placeholderArtworkCatalog);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MusicAttributionMetadata_placeholderArtworkCatalog) = (Class)a3;
  v3 = a3;

}

- (MusicAttributionMetadata)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___MusicAttributionMetadata_title);
  *v2 = 0;
  v2[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MusicAttributionMetadata_artworkCatalog) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MusicAttributionMetadata_placeholderArtworkCatalog) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AttributionMetadata();
  return -[MusicAttributionMetadata init](&v4, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR___MusicAttributionMetadata_title]);

}

@end
