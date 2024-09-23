@implementation PlaceSummaryViewModelTemplate

- (BOOL)isSelected
{
  uint64_t KeyPath;
  uint64_t v4;
  _TtC4Maps29PlaceSummaryViewModelTemplate *v5;
  _BOOL8 v7;

  KeyPath = swift_getKeyPath(&unk_100E28A38);
  v4 = swift_getKeyPath(&unk_100E28A60);
  v5 = self;
  static Published.subscript.getter(&v7, v5, KeyPath, v4);

  swift_release(KeyPath);
  swift_release(v4);
  return v7;
}

- (void)setIsSelected:(BOOL)a3
{
  uint64_t KeyPath;
  uint64_t v6;
  BOOL v7;

  KeyPath = swift_getKeyPath(&unk_100E28A38);
  v6 = swift_getKeyPath(&unk_100E28A60);
  v7 = a3;
  static Published.subscript.setter(&v7, self, KeyPath, v6);
}

- (double)containerWidth
{
  uint64_t KeyPath;
  uint64_t v4;
  _TtC4Maps29PlaceSummaryViewModelTemplate *v5;
  double v7;

  KeyPath = swift_getKeyPath(&unk_100E289F0);
  v4 = swift_getKeyPath(&unk_100E28A18);
  v5 = self;
  static Published.subscript.getter(&v7, v5, KeyPath, v4);

  swift_release(KeyPath);
  swift_release(v4);
  return v7;
}

- (void)setContainerWidth:(double)a3
{
  uint64_t KeyPath;
  uint64_t v6;
  double v7;

  KeyPath = swift_getKeyPath(&unk_100E289F0);
  v6 = swift_getKeyPath(&unk_100E28A18);
  v7 = a3;
  static Published.subscript.setter(&v7, self, KeyPath, v6);
}

- (BOOL)searchAlongRoute
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate_searchAlongRoute);
}

- (_TtC4Maps19PlaceSummaryMetrics)metrics
{
  return (_TtC4Maps19PlaceSummaryMetrics *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate_metrics));
}

- (void)setMetrics:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate_metrics);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate_metrics) = (Class)a3;
  v3 = a3;

}

- (BOOL)containsPhotoCarouselLine
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate_containsPhotoCarouselLine);
}

- (void)setContainsPhotoCarouselLine:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate_containsPhotoCarouselLine) = a3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC4Maps29PlaceSummaryViewModelTemplate *v5;
  _TtC4Maps29PlaceSummaryViewModelTemplate *v6;
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
  v7 = sub_100085FF0((uint64_t)v9);

  sub_100010CC4((uint64_t)v9, (uint64_t *)&unk_101493350);
  return v7 & 1;
}

- (_TtC4Maps29PlaceSummaryViewModelTemplate)init
{
  _TtC4Maps29PlaceSummaryViewModelTemplate *result;

  result = (_TtC4Maps29PlaceSummaryViewModelTemplate *)_swift_stdlib_reportUnimplementedInitializer("Maps.PlaceSummaryViewModelTemplate", 34, "init()", 6, 0);
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
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  v3 = (char *)self + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate__lines;
  v4 = sub_100008B04(&qword_101497970);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate__leadingEntity;
  v6 = sub_100008B04(&qword_101497928);
  v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate__trailingEntity, v6);
  v8 = (char *)self + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate__isSelected;
  v9 = sub_100008B04((uint64_t *)&unk_10149A660);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate__containerWidth;
  v11 = sub_100008B04(&qword_101497920);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  swift_release();
  swift_bridgeObjectRelease(*(_QWORD *)&self->useCase[OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate_actionButtons]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate_refinementButtons));

}

- (int)trailingEntityType
{
  _TtC4Maps29PlaceSummaryViewModelTemplate *v2;
  int v3;

  v2 = self;
  v3 = sub_10008BA70();

  return v3;
}

- (id)hyperlinkString
{
  _TtC4Maps29PlaceSummaryViewModelTemplate *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10008BBA4();
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
  return v5;
}

- (int)hyperlinkType
{
  _TtC4Maps29PlaceSummaryViewModelTemplate *v2;
  int v3;

  v2 = self;
  v3 = sub_10008C720();

  return v3;
}

@end
