@implementation FeedHeadlinePlaybackCommandHandler

- (_TtC8StocksUI34FeedHeadlinePlaybackCommandHandler)init
{
  _TtC8StocksUI34FeedHeadlinePlaybackCommandHandler *result;

  result = (_TtC8StocksUI34FeedHeadlinePlaybackCommandHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8StocksUI34FeedHeadlinePlaybackCommandHandler_readingHistory));
  sub_1DC148A20((uint64_t)self + OBJC_IVAR____TtC8StocksUI34FeedHeadlinePlaybackCommandHandler_commandCenter);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI34FeedHeadlinePlaybackCommandHandler_audioPlaybackContext);
}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC8StocksUI34FeedHeadlinePlaybackCommandHandler *v8;

  sub_1DC0E7878();
  v6 = sub_1DC40898C();
  v7 = a3;
  v8 = self;
  sub_1DC373BD8(v6);

  swift_bridgeObjectRelease();
}

@end
