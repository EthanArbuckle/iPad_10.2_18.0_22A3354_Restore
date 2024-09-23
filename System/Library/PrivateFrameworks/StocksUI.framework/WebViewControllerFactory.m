@implementation WebViewControllerFactory

- (id)createViewControllerForURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC8StocksUI24WebViewControllerFactory *v8;
  char *v9;
  _OWORD v11[2];
  uint64_t v12;

  v4 = sub_1DC3FFDD0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DC3FFD94();
  v12 = 0;
  memset(v11, 0, sizeof(v11));
  v8 = self;
  v9 = sub_1DC222604((uint64_t)v7, (uint64_t)v11);
  sub_1DC1E2A80((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (_TtC8StocksUI24WebViewControllerFactory)init
{
  _TtC8StocksUI24WebViewControllerFactory *result;

  result = (_TtC8StocksUI24WebViewControllerFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI24WebViewControllerFactory_resolver);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI24WebViewControllerFactory_sceneStateManager);
}

@end
