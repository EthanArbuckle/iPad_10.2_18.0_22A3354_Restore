@implementation UpsellInformation

- (_TtC8ShelfKit17UpsellInformation)init
{
  _TtC8ShelfKit17UpsellInformation *result;

  result = (_TtC8ShelfKit17UpsellInformation *)_swift_stdlib_reportUnimplementedInitializer("ShelfKit.UpsellInformation", 26, "init()", 6, 0);
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
  swift_bridgeObjectRelease();
  sub_1459C((uint64_t)self + OBJC_IVAR____TtC8ShelfKit17UpsellInformation_backgroundArtwork, &qword_3BEB70);
  sub_1459C((uint64_t)self + OBJC_IVAR____TtC8ShelfKit17UpsellInformation_logoArtwork, &qword_3BEB70);
  swift_bridgeObjectRelease();
  sub_C5CC4(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit17UpsellInformation_backgroundColor), self->shelfUniqueId[OBJC_IVAR____TtC8ShelfKit17UpsellInformation_backgroundColor]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit17UpsellInformation_seeAllAction));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8ShelfKit17UpsellInformation_pageMetrics;
  v4 = type metadata accessor for PageMetrics(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit17UpsellInformation_externalUrlAction));
}

@end
