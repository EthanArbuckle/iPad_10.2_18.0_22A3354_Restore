@implementation LinkedStockProvider

- (_TtC8StocksUI19LinkedStockProvider)init
{
  _TtC8StocksUI19LinkedStockProvider *result;

  result = (_TtC8StocksUI19LinkedStockProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI19LinkedStockProvider_metadataManager);
  swift_release();
}

- (id)loadLinkedContentForHeadline:(id)a3 withContext:(id)a4 completion:(id)a5
{
  void *v7;
  id v8;
  _TtC8StocksUI19LinkedStockProvider *v9;
  void *v10;
  void *v11;

  v7 = _Block_copy(a5);
  _Block_copy(v7);
  swift_unknownObjectRetain();
  v8 = a4;
  v9 = self;
  sub_1DC2FE78C(v8, (uint64_t)v9, v7);
  v11 = v10;
  _Block_release(v7);
  _Block_release(v7);
  swift_unknownObjectRelease();

  return v11;
}

@end
