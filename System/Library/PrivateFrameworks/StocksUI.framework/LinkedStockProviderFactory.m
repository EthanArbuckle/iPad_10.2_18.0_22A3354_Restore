@implementation LinkedStockProviderFactory

- (id)createLinkedContentProviderForArticle:(id)a3
{
  objc_class *v5;
  char *v6;
  uint64_t v7;
  id v8;
  _TtC8StocksUI26LinkedStockProviderFactory *v9;
  char *v10;
  _TtC8StocksUI26LinkedStockProviderFactory *v11;
  objc_super v13;
  _BYTE v14[40];

  sub_1DC0824D4((uint64_t)self + OBJC_IVAR____TtC8StocksUI26LinkedStockProviderFactory_metadataManager, (uint64_t)v14);
  v5 = (objc_class *)type metadata accessor for LinkedStockProvider();
  v6 = (char *)objc_allocWithZone(v5);
  v7 = OBJC_IVAR____TtC8StocksUI19LinkedStockProvider_stocks;
  v8 = a3;
  v9 = self;
  v10 = v6;
  sub_1DC1A2568(MEMORY[0x1E0DEE9D8]);
  sub_1DC2969BC();
  swift_allocObject();
  *(_QWORD *)&v6[v7] = sub_1DC402C2C();
  sub_1DC0824D4((uint64_t)v14, (uint64_t)&v10[OBJC_IVAR____TtC8StocksUI19LinkedStockProvider_metadataManager]);

  v13.receiver = v10;
  v13.super_class = v5;
  v11 = -[LinkedStockProviderFactory init](&v13, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);

  return v11;
}

- (_TtC8StocksUI26LinkedStockProviderFactory)init
{
  _TtC8StocksUI26LinkedStockProviderFactory *result;

  result = (_TtC8StocksUI26LinkedStockProviderFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI26LinkedStockProviderFactory_metadataManager);
}

@end
