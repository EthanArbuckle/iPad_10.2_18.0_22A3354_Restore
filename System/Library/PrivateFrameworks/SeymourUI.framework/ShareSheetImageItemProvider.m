@implementation ShareSheetImageItemProvider

- (id)item
{
  _TtC9SeymourUI27ShareSheetImageItemProvider *v2;
  void *v3;
  _QWORD v5[4];

  v2 = self;
  sub_22BA7ECD8();

  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3 = (void *)sub_22BA81720();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  _TtC9SeymourUI27ShareSheetImageItemProvider *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  __n128 v12;
  uint64_t v13;
  char *v14;
  void *v15;
  _QWORD v17[3];
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22BA0FDD0((uint64_t)v8, (uint64_t)a4, v17);

  v9 = v18;
  if (!v18)
    return 0;
  v10 = __swift_project_boxed_opaque_existential_1(v17, v18);
  v11 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v11 + 16))(v14, v12);
  v15 = (void *)sub_22BA81720();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return v15;
}

- (_TtC9SeymourUI27ShareSheetImageItemProvider)initWithPlaceholderItem:(id)a3
{
  _TtC9SeymourUI27ShareSheetImageItemProvider *result;

  swift_unknownObjectRetain();
  sub_22BA812E8();
  swift_unknownObjectRelease();
  result = (_TtC9SeymourUI27ShareSheetImageItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27ShareSheetImageItemProvider_artworkItemProvider);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27ShareSheetImageItemProvider_loadedImage));
}

@end
