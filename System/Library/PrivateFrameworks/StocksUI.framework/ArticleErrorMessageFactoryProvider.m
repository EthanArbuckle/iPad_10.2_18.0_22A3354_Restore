@implementation ArticleErrorMessageFactoryProvider

- (_TtC8StocksUI34ArticleErrorMessageFactoryProvider)init
{
  _TtC8StocksUI34ArticleErrorMessageFactoryProvider *result;

  result = (_TtC8StocksUI34ArticleErrorMessageFactoryProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8StocksUI34ArticleErrorMessageFactoryProvider_reachability));
}

- (id)errorMessageForArticleView
{
  void *v2;
  _TtC8StocksUI34ArticleErrorMessageFactoryProvider *v3;
  void *v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI34ArticleErrorMessageFactoryProvider_reachability);
  v3 = self;
  v4 = (void *)sub_1DC176E00((uint64_t)objc_msgSend(v2, sel_offlineReason));

  return v4;
}

- (id)errorMessageForArticleViewWithOfflineReason:(int64_t)a3
{
  return (id)sub_1DC176E00(a3);
}

@end
