@implementation ShareSheetArtworkItemProvider

- (id)loadDataRepresentationForTypeIdentifier:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  _TtC9SeymourUI29ShareSheetArtworkItemProvider *v7;
  id v8;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = self;
  v8 = sub_22B72DA98((uint64_t)sub_22B55B870, v6);

  swift_release();
  return v8;
}

- (_TtC9SeymourUI29ShareSheetArtworkItemProvider)init
{
  _TtC9SeymourUI29ShareSheetArtworkItemProvider *result;

  result = (_TtC9SeymourUI29ShareSheetArtworkItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI29ShareSheetArtworkItemProvider)initWithItem:(id)a3 typeIdentifier:(id)a4
{
  _TtC9SeymourUI29ShareSheetArtworkItemProvider *result;

  swift_unknownObjectRetain();
  result = (_TtC9SeymourUI29ShareSheetArtworkItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29ShareSheetArtworkItemProvider_assetClient);
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI29ShareSheetArtworkItemProvider_artwork;
  v4 = sub_22BA7D0E8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
