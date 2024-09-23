@implementation NMTPodcastsArtworkToken

- (NSString)key
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (CGColor)backgroundColor
{
  NMTPodcastsArtworkToken *v2;
  CGColorRef v3;

  v2 = self;
  v3 = sub_1A924F4D4();

  return v3;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  void *v3;
  CGColor *v4;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NMTPodcastsArtworkToken____lazy_storage___backgroundColor);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NMTPodcastsArtworkToken____lazy_storage___backgroundColor) = a3;
  v4 = a3;
  sub_1A924F5C4(v3);
}

- (NMTPodcastsArtworkToken)initWithKey:(id)a3 backgroundColorString:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  objc_super v14;

  v6 = sub_1A93F8040();
  v8 = v7;
  if (a4)
  {
    v9 = sub_1A93F8040();
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NMTPodcastsArtworkToken____lazy_storage___backgroundColor) = (Class)1;
  v11 = (uint64_t *)((char *)self + OBJC_IVAR___NMTPodcastsArtworkToken_key);
  *v11 = v6;
  v11[1] = v8;
  v12 = (uint64_t *)((char *)self + OBJC_IVAR___NMTPodcastsArtworkToken_backgroundColorString);
  *v12 = v9;
  v12[1] = v10;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for NanoPodcastsArtworkToken();
  return -[NMTPodcastsArtworkToken init](&v14, sel_init);
}

- (NMTPodcastsArtworkToken)init
{
  NMTPodcastsArtworkToken *result;

  result = (NMTPodcastsArtworkToken *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A924F5C4(*(id *)((char *)&self->super.isa + OBJC_IVAR___NMTPodcastsArtworkToken____lazy_storage___backgroundColor));
  swift_bridgeObjectRelease();
}

@end
