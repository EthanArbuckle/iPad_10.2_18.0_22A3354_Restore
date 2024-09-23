@implementation PKSearchResult

- (NSArray)episodes
{
  return (NSArray *)sub_22FB2F9FC((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___PKSearchResult_episodes, (void (*)(_QWORD))type metadata accessor for Episode);
}

- (NSArray)shows
{
  return (NSArray *)sub_22FB2F9FC((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___PKSearchResult_shows, (void (*)(_QWORD))type metadata accessor for Show);
}

- (PKSearchResult)initWithEpisodes:(id)a3 shows:(id)a4
{
  objc_class *v5;
  objc_class *v6;
  objc_super v8;

  type metadata accessor for Episode();
  v5 = (objc_class *)sub_22FB37BC0();
  type metadata accessor for Show();
  v6 = (objc_class *)sub_22FB37BC0();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKSearchResult_episodes) = v5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKSearchResult_shows) = v6;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SearchResult();
  return -[PKSearchResult init](&v8, sel_init);
}

- (PKSearchResult)init
{
  PKSearchResult *result;

  result = (PKSearchResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
