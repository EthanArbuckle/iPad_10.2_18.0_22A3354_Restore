@implementation ShareSheetLinkItemProvider

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4;
  _TtC9SeymourUI26ShareSheetLinkItemProvider *v5;
  id v6;

  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI26ShareSheetLinkItemProvider_artworkItemProvider))
  {
    v4 = a3;
    v5 = self;
    v6 = sub_22B5CD3E0();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)item
{
  uint64_t v3;
  __n128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v3 = sub_22BA797C4();
  v4 = MEMORY[0x24BDAC7A8](v3);
  (*(void (**)(char *, char *, uint64_t, __n128))(v6 + 16))((char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)self + OBJC_IVAR____TtC9SeymourUI26ShareSheetLinkItemProvider_url, v3, v4);
  return (id)sub_22BA81768();
}

- (_TtC9SeymourUI26ShareSheetLinkItemProvider)initWithPlaceholderItem:(id)a3
{
  _TtC9SeymourUI26ShareSheetLinkItemProvider *result;

  swift_unknownObjectRetain();
  sub_22BA812E8();
  swift_unknownObjectRelease();
  result = (_TtC9SeymourUI26ShareSheetLinkItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26ShareSheetLinkItemProvider_storefrontLocalizer);
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI26ShareSheetLinkItemProvider_url;
  v4 = sub_22BA797C4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26ShareSheetLinkItemProvider_artworkItemProvider));
  swift_bridgeObjectRelease();
}

@end
