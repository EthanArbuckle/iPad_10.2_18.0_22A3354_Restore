@implementation PreviewPlayerDataProvider

- (void)playerFinished:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t ObjectType;
  void (*v11)(uint64_t, uint64_t);
  _TtC9SeymourUI25PreviewPlayerDataProvider *v12;
  uint64_t v13;

  v4 = sub_22BA79344();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BA79320();
  v8 = (char *)self + OBJC_IVAR____TtC9SeymourUI25PreviewPlayerDataProvider_display;
  if (MEMORY[0x22E2F3FFC]((char *)self + OBJC_IVAR____TtC9SeymourUI25PreviewPlayerDataProvider_display))
  {
    v9 = *((_QWORD *)v8 + 1);
    ObjectType = swift_getObjectType();
    v11 = *(void (**)(uint64_t, uint64_t))(v9 + 40);
    v12 = self;
    v11(ObjectType, v9);

    swift_unknownObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC9SeymourUI25PreviewPlayerDataProvider)init
{
  _TtC9SeymourUI25PreviewPlayerDataProvider *result;

  result = (_TtC9SeymourUI25PreviewPlayerDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI25PreviewPlayerDataProvider_preview;
  v4 = sub_22BA7A7C0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25PreviewPlayerDataProvider_display);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25PreviewPlayerDataProvider_assetClient);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25PreviewPlayerDataProvider_marketingItemProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25PreviewPlayerDataProvider_marketingMetricFieldsProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25PreviewPlayerDataProvider_subscriptionCache);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SeymourUI25PreviewPlayerDataProvider_dynamicOfferCoordinator));

}

@end
