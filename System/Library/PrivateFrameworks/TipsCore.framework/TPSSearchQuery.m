@implementation TPSSearchQuery

- (id)makeCSQueryWith:(id)a3
{
  TPSSearchQuery *v4;
  id v5;

  sub_19A990E3C();
  v4 = self;
  v5 = sub_19A962F30();

  swift_bridgeObjectRelease();
  return v5;
}

+ (id)escapeSearchTerm:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = sub_19A990D58();
  sub_19A9642C0(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  return v5;
}

- (NSString)identifier
{
  return (NSString *)sub_19A95F504();
}

- (void)setIdentifier:(id)a3
{
  sub_19A95F580((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSSearchQuery_identifier);
}

- (NSString)searchTerm
{
  return (NSString *)sub_19A95F504();
}

- (void)setSearchTerm:(id)a3
{
  sub_19A95F580((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSSearchQuery_searchTerm);
}

- (unint64_t)options
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR___TPSSearchQuery_options);
  swift_beginAccess();
  return *v2;
}

- (void)setOptions:(unint64_t)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)((char *)self + OBJC_IVAR___TPSSearchQuery_options);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)matchingStyle
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___TPSSearchQuery_matchingStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setMatchingStyle:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___TPSSearchQuery_matchingStyle);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)contentTypeFilter
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___TPSSearchQuery_contentTypeFilter);
  swift_beginAccess();
  return *v2;
}

- (void)setContentTypeFilter:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___TPSSearchQuery_contentTypeFilter);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)maxCount
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___TPSSearchQuery_maxCount);
  swift_beginAccess();
  return *v2;
}

- (void)setMaxCount:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___TPSSearchQuery_maxCount);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isCancelled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___TPSSearchQuery_isCancelled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsCancelled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___TPSSearchQuery_isCancelled;
  swift_beginAccess();
  *v4 = a3;
}

- (id)rankingModifier
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  if (!*(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchQuery_rankingModifier))
    return 0;
  v2 = *(_QWORD *)&self->identifier[OBJC_IVAR___TPSSearchQuery_rankingModifier];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchQuery_rankingModifier);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 1107296256;
  v5[2] = sub_19A987770;
  v5[3] = &block_descriptor_6;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (void)setRankingModifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;

  v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v5;
    v6 = sub_19A988E98;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR___TPSSearchQuery_rankingModifier);
  v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchQuery_rankingModifier);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_19A9642B0(v8);
}

- (TPSSearchQuery)initWithIdentifier:(id)a3 searchTerm:(id)a4 options:(unint64_t)a5 matchingStyle:(int64_t)a6 contentTypeFilter:(int64_t)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v10 = sub_19A990D58();
  v12 = v11;
  v13 = sub_19A990D58();
  return (TPSSearchQuery *)SearchQuery.init(identifier:searchTerm:options:matchingStyle:contentTypeFilter:)(v10, v12, v13, v14, a5, a6, a7);
}

- (TPSSearchQuery)initWithIdentifier:(id)a3 searchTerm:(id)a4
{
  void *v5;
  void *v6;
  TPSSearchQuery *v7;

  sub_19A990D58();
  sub_19A990D58();
  v5 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  v7 = -[TPSSearchQuery initWithIdentifier:searchTerm:options:matchingStyle:contentTypeFilter:](self, sel_initWithIdentifier_searchTerm_options_matchingStyle_contentTypeFilter_, v5, v6, 0, 0, 0);

  return v7;
}

- (NSString)description
{
  TPSSearchQuery *v2;
  void *v3;

  v2 = self;
  SearchQuery.description.getter();

  v3 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (TPSSearchQuery)init
{
  TPSSearchQuery *result;

  result = (TPSSearchQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_19A9642B0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchQuery_rankingModifier));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TPSSearchQuery *v5;

  v4 = a3;
  v5 = self;
  SearchQuery.encode(with:)((NSCoder)v4);

}

- (TPSSearchQuery)initWithCoder:(id)a3
{
  return (TPSSearchQuery *)SearchQuery.init(coder:)(a3);
}

- (int64_t)hash
{
  TPSSearchQuery *v3;
  int64_t v4;

  swift_beginAccess();
  v3 = self;
  swift_bridgeObjectRetain();
  v4 = sub_19A990E00();

  swift_bridgeObjectRelease();
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  TPSSearchQuery *v4;
  TPSSearchQuery *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_19A9910A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = SearchQuery.isEqual(_:)((uint64_t)v8);

  sub_19A91E1E0((uint64_t)v8);
  return v6 & 1;
}

@end
