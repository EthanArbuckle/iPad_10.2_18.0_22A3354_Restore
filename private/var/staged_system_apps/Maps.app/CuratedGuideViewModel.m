@implementation CuratedGuideViewModel

- (GEOPlaceCollection)placeCollection
{
  return (GEOPlaceCollection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC4Maps21CuratedGuideViewModel_placeCollection));
}

- (BOOL)useRichLayout
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps21CuratedGuideViewModel_useRichLayout);
}

- (_TtC4Maps19GuideSummaryMetrics)metrics
{
  return (_TtC4Maps19GuideSummaryMetrics *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____TtC4Maps21CuratedGuideViewModel_metrics));
}

- (void)setMetrics:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps21CuratedGuideViewModel_metrics);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps21CuratedGuideViewModel_metrics) = (Class)a3;
  v3 = a3;

}

- (double)width
{
  uint64_t KeyPath;
  uint64_t v4;
  _TtC4Maps21CuratedGuideViewModel *v5;
  double v7;

  KeyPath = swift_getKeyPath(&unk_100E2B4D0);
  v4 = swift_getKeyPath(&unk_100E2B4F8);
  v5 = self;
  static Published.subscript.getter(&v7, v5, KeyPath, v4);

  swift_release(KeyPath);
  swift_release(v4);
  return v7;
}

- (void)setWidth:(double)a3
{
  uint64_t KeyPath;
  uint64_t v6;
  double v7;

  KeyPath = swift_getKeyPath(&unk_100E2B4D0);
  v6 = swift_getKeyPath(&unk_100E2B4F8);
  v7 = a3;
  static Published.subscript.setter(&v7, self, KeyPath, v6);
}

- (_TtC4Maps21CuratedGuideViewModel)initWithPlaceCollection:(id)a3 useRichLayout:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  _TtC4Maps21CuratedGuideViewModel *v6;

  v4 = a4;
  v5 = a3;
  v6 = (_TtC4Maps21CuratedGuideViewModel *)sub_1000D53F0(v5, v4);

  return v6;
}

- (NSString)guideNumberOfPlaces
{
  _TtC4Maps21CuratedGuideViewModel *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1000D4828();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)guideTitle
{
  void *v2;
  _TtC4Maps21CuratedGuideViewModel *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps21CuratedGuideViewModel_placeCollection);
  v3 = self;
  v4 = objc_msgSend(v2, "collectionTitle");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v6 = v5;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return (NSString *)v7;
}

- (NSString)guideSubtitle
{
  void *v2;
  _TtC4Maps21CuratedGuideViewModel *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps21CuratedGuideViewModel_placeCollection);
  v3 = self;
  v4 = objc_msgSend(v2, "publisherAttribution");
  if (v4
    && (v5 = v4,
        v6 = objc_msgSend(v4, "displayName"),
        swift_unknownObjectRelease(v5),
        v6))
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    v8 = v7;

    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
  }
  else
  {

    v9 = 0;
  }
  return (NSString *)v9;
}

- (double)guideBrickWidth
{
  _TtC4Maps21CuratedGuideViewModel *v2;
  double v3;

  v2 = self;
  v3 = sub_1000D4C00();

  return v3;
}

- (double)guideBrickHeight
{
  _TtC4Maps21CuratedGuideViewModel *v2;
  double v3;

  v2 = self;
  v3 = sub_1000D4CFC();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC4Maps21CuratedGuideViewModel *v5;
  _TtC4Maps21CuratedGuideViewModel *v6;
  char v7;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }
  v7 = sub_1000D4DB4((uint64_t)v9);

  sub_10000C180((uint64_t)v9);
  return v7 & 1;
}

- (int64_t)hash
{
  _TtC4Maps21CuratedGuideViewModel *v2;
  int64_t v3;

  v2 = self;
  v3 = NSObject.hashValue.getter();

  return v3;
}

- (_TtC4Maps21CuratedGuideViewModel)init
{
  _TtC4Maps21CuratedGuideViewModel *result;

  result = (_TtC4Maps21CuratedGuideViewModel *)_swift_stdlib_reportUnimplementedInitializer("Maps.CuratedGuideViewModel", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC4Maps21CuratedGuideViewModel__width;
  v4 = sub_100008B04(&qword_101497920);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC4Maps21CuratedGuideViewModel__publisherIcon;
  v6 = sub_100008B04(&qword_101497958);
  v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC4Maps21CuratedGuideViewModel__collectionImage, v6);
}

@end
