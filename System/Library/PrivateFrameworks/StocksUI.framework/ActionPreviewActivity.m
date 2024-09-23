@implementation ActionPreviewActivity

- (id)previewViewControllerForAction:(id)a3
{
  _TtC8StocksUI21ActionPreviewActivity *v5;
  void *v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = (void *)sub_1DC31C9CC((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

- (void)commitViewController:(id)a3 action:(id)a4
{
  id v5;
  _TtC8StocksUI21ActionPreviewActivity *v6;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_1DC31D544();

  swift_unknownObjectRelease();
}

- (_TtC8StocksUI21ActionPreviewActivity)init
{
  _TtC8StocksUI21ActionPreviewActivity *result;

  result = (_TtC8StocksUI21ActionPreviewActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI21ActionPreviewActivity_handler);
  swift_release();
}

@end
