@implementation SRSmartRepliesActionMetadata

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies28SRSmartRepliesActionMetadata_type);
}

- (NSString)title
{
  return (NSString *)@objc SRSmartRepliesActionMetadata.title.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12SmartReplies28SRSmartRepliesActionMetadata_title);
}

- (NSString)attribution
{
  return (NSString *)@objc SRSmartRepliesActionMetadata.title.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12SmartReplies28SRSmartRepliesActionMetadata_attribution);
}

- (NSString)stringRepresentation
{
  return (NSString *)@objc SRSmartRepliesActionMetadata.title.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12SmartReplies28SRSmartRepliesActionMetadata_stringRepresentation);
}

- (NSDate)date
{
  return (NSDate *)Date._bridgeToObjectiveC()().super.isa;
}

- (BOOL)hasRichActionType
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies28SRSmartRepliesActionMetadata_hasRichActionType);
}

- (NSURL)url
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  NSURL *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Date?((uint64_t)self + OBJC_IVAR____TtC12SmartReplies28SRSmartRepliesActionMetadata_url, (uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for URL?);
  v6 = type metadata accessor for URL();
  v7 = *(_QWORD *)(v6 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    URL._bridgeToObjectiveC()(v8);
    v9 = v10;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return (NSURL *)v9;
}

- (double)locationLatitude
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC12SmartReplies28SRSmartRepliesActionMetadata_locationLatitude);
}

- (double)locationLongitude
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC12SmartReplies28SRSmartRepliesActionMetadata_locationLongitude);
}

- (NSString)imageName
{
  return (NSString *)@objc SRSmartRepliesActionMetadata.title.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12SmartReplies28SRSmartRepliesActionMetadata_imageName);
}

- (int64_t)attributionSource
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12SmartReplies28SRSmartRepliesActionMetadata_attributionSource);
}

- (_TtC12SmartReplies28SRSmartRepliesActionMetadata)initWithType:(int64_t)a3 title:(id)a4 attribution:(id)a5 stringRepresentation:(id)a6 date:(id)a7 hasRichActionType:(BOOL)a8 url:(id)a9 locationLatitude:(double)a10 locationLongitude:(double)a11 imageName:(id)a12 attributionSource:(int64_t)a13
{
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void (*v33)(char *, _QWORD, uint64_t, uint64_t);
  id v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL4 v45;
  uint64_t v46;
  _TtC12SmartReplies28SRSmartRepliesActionMetadata *v47;

  v45 = a8;
  v46 = a3;
  v47 = self;
  v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for Date();
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v42 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v43 = v25;
    v44 = v24;
    if (a5)
      goto LABEL_3;
LABEL_6:
    v26 = 0;
    v28 = 0;
    v29 = a9;
    if (a6)
      goto LABEL_4;
    goto LABEL_7;
  }
  v43 = 0;
  v44 = 0;
  if (!a5)
    goto LABEL_6;
LABEL_3:
  v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v28 = v27;
  v29 = a9;
  if (a6)
  {
LABEL_4:
    v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a6 = v31;
    goto LABEL_8;
  }
LABEL_7:
  v30 = 0;
LABEL_8:
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  if (!v29)
  {
    v39 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v20, 1, 1, v39);
    v40 = a12;
    v35 = a13;
    if (a12)
      goto LABEL_10;
LABEL_12:
    v36 = 0;
    v38 = 0;
    return (_TtC12SmartReplies28SRSmartRepliesActionMetadata *)SRSmartRepliesActionMetadata.init(type:title:attribution:stringRepresentation:date:hasRichActionType:url:locationLatitude:locationLongitude:imageName:attributionSource:)(v46, v44, v43, v26, v28, v30, (uint64_t)a6, (uint64_t)v23, a10, a11, v45, (uint64_t)v20, v36, v38, v35);
  }
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  v32 = type metadata accessor for URL();
  v33 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56);
  v34 = a12;
  v33(v20, 0, 1, v32);
  v35 = a13;
  if (!a12)
    goto LABEL_12;
LABEL_10:
  v36 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v38 = v37;

  return (_TtC12SmartReplies28SRSmartRepliesActionMetadata *)SRSmartRepliesActionMetadata.init(type:title:attribution:stringRepresentation:date:hasRichActionType:url:locationLatitude:locationLongitude:imageName:attributionSource:)(v46, v44, v43, v26, v28, v30, (uint64_t)a6, (uint64_t)v23, a10, a11, v45, (uint64_t)v20, v36, v38, v35);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(void *)a3
{
  _TtC12SmartReplies28SRSmartRepliesActionMetadata *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SRSmartRepliesActionMetadata.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC12SmartReplies28SRSmartRepliesActionMetadata *v5;

  v4 = a3;
  v5 = self;
  SRSmartRepliesActionMetadata.encode(with:)((NSCoder)v4);

}

- (_TtC12SmartReplies28SRSmartRepliesActionMetadata)initWithCoder:(id)a3
{
  return (_TtC12SmartReplies28SRSmartRepliesActionMetadata *)SRSmartRepliesActionMetadata.init(coder:)(a3);
}

- (BOOL)isEqual:(id)a3
{
  _TtC12SmartReplies28SRSmartRepliesActionMetadata *v4;
  _TtC12SmartReplies28SRSmartRepliesActionMetadata *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = SRSmartRepliesActionMetadata.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8, (uint64_t *)&demangling cache variable for type metadata for Any?);
  return v6;
}

- (_TtC12SmartReplies28SRSmartRepliesActionMetadata)init
{
  _TtC12SmartReplies28SRSmartRepliesActionMetadata *result;

  result = (_TtC12SmartReplies28SRSmartRepliesActionMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC12SmartReplies28SRSmartRepliesActionMetadata_date;
  v4 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  outlined destroy of Any?((uint64_t)self + OBJC_IVAR____TtC12SmartReplies28SRSmartRepliesActionMetadata_url, (uint64_t *)&demangling cache variable for type metadata for URL?);
  swift_bridgeObjectRelease();
}

@end
