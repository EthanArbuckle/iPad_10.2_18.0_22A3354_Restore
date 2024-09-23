@implementation QuoteDetailViewRenderer

- (_TtC8StocksUI23QuoteDetailViewRenderer)init
{
  _TtC8StocksUI23QuoteDetailViewRenderer *result;

  result = (_TtC8StocksUI23QuoteDetailViewRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23QuoteDetailViewRenderer_styler);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC8StocksUI23QuoteDetailViewRenderer *v8;

  v4 = a3;
  v8 = self;
  objc_msgSend(v4, sel_contentOffset);
  v5 = (char *)v8 + OBJC_IVAR____TtC8StocksUI23QuoteDetailViewRenderer_lastKnownContentOffset;
  *(_QWORD *)v5 = v6;
  *((_QWORD *)v5 + 1) = v7;
  v5[16] = 0;

}

@end
