@implementation Shelf

- (_TtC8ShelfKit5Shelf)init
{
  _TtC8ShelfKit5Shelf *result;

  result = (_TtC8ShelfKit5Shelf *)_swift_stdlib_reportUnimplementedInitializer("ShelfKit.Shelf", 14, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1459C((uint64_t)self + OBJC_IVAR____TtC8ShelfKit5Shelf_titleContextMenu, (uint64_t *)&unk_3BF7E0);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit5Shelf_seeAllAction));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1459C((uint64_t)self + OBJC_IVAR____TtC8ShelfKit5Shelf_url, &qword_3B4370);
  sub_C5CC4(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit5Shelf_backgroundColor), self->id[OBJC_IVAR____TtC8ShelfKit5Shelf_backgroundColor]);
  if (*(_QWORD *)&self->contentType[OBJC_IVAR____TtC8ShelfKit5Shelf_shelvesIntent])
    __swift_destroy_boxed_opaque_existential_1((Class *)((char *)&self->super.isa
                                                       + OBJC_IVAR____TtC8ShelfKit5Shelf_shelvesIntent));
  sub_1459C((uint64_t)self + OBJC_IVAR____TtC8ShelfKit5Shelf_impressionMetrics, (uint64_t *)&unk_3B8790);
  sub_1459C((uint64_t)self + OBJC_IVAR____TtC8ShelfKit5Shelf_headerArtwork, &qword_3BEB70);
}

@end
