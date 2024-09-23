@implementation MTSearchSeeAllSection

- (int64_t)contentType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___MTSearchSeeAllSection_contentType);
}

- (NSString)nextPage
{
  void *v2;

  if (*(_QWORD *)&self->contentType[OBJC_IVAR___MTSearchSeeAllSection_nextPage])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (MTSearchSeeAllSection)initWithContentType:(int64_t)a3 nextPage:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  objc_super v10;

  if (a4)
  {
    v6 = sub_1A93F8040();
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTSearchSeeAllSection_contentType) = (Class)a3;
  v8 = (uint64_t *)((char *)self + OBJC_IVAR___MTSearchSeeAllSection_nextPage);
  *v8 = v6;
  v8[1] = v7;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SearchSeeAllSection();
  return -[MTSearchSeeAllSection init](&v10, sel_init);
}

- (MTSearchSeeAllSection)init
{
  MTSearchSeeAllSection *result;

  result = (MTSearchSeeAllSection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
