@implementation TPSSearchResult

- (NSArray)items
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for SearchResult.Item();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_19A990E30();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setItems:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for SearchResult.Item();
  v4 = sub_19A990E3C();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___TPSSearchResult_items);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSArray)suggestions
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_19A990E30();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setSuggestions:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  v4 = sub_19A990E3C();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___TPSSearchResult_suggestions);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (TPSSearchQuery)query
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchResult_query);
  swift_beginAccess();
  return (TPSSearchQuery *)*v2;
}

- (void)setQuery:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___TPSSearchResult_query);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (TPSSearchResult)initWithQuery:(id)a3 items:(id)a4 suggestions:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  TPSSearchResult *v9;

  type metadata accessor for SearchResult.Item();
  v6 = sub_19A990E3C();
  v7 = sub_19A990E3C();
  v8 = a3;
  v9 = (TPSSearchResult *)sub_19A962C58(v8, v6, v7);

  return v9;
}

- (TPSSearchResult)init
{
  TPSSearchResult *result;

  result = (TPSSearchResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TPSSearchResult *v5;

  v4 = a3;
  v5 = self;
  SearchResult.encode(with:)((NSCoder)v4);

}

- (TPSSearchResult)initWithCoder:(id)a3
{
  return (TPSSearchResult *)SearchResult.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)sub_19A962970(self, (uint64_t)a2, (void (*)(void))SearchResult.description.getter);
}

+ (id)makeResultWith:(id)a3 items:(id)a4 suggestions:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;

  sub_19A983684();
  v6 = sub_19A990E3C();
  v7 = sub_19A990E3C();
  v8 = (char *)a3;
  v9 = sub_19A986198(v8, v6, v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

@end
