@implementation _PSAppSuggestionsMetricsItem

- (NSString)transportBundleId
{
  return (NSString *)sub_245482500();
}

- (NSString)model
{
  return (NSString *)sub_245482500();
}

- (unsigned)rank
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____PSAppSuggestionsMetricsItem_rank);
}

- (_PSAppSuggestionsMetricsItem)initWithTransportBundleId:(id)a3 model:(id)a4 rank:(unsigned __int8)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  objc_super v15;

  v7 = sub_24549A0B4();
  v9 = v8;
  v10 = sub_24549A0B4();
  v11 = (uint64_t *)((char *)self + OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId);
  *v11 = v7;
  v11[1] = v9;
  v12 = (uint64_t *)((char *)self + OBJC_IVAR____PSAppSuggestionsMetricsItem_model);
  *v12 = v10;
  v12[1] = v13;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____PSAppSuggestionsMetricsItem_rank) = a5;
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for AppSuggestions.AppSuggestion();
  return -[_PSAppSuggestionsMetricsItem init](&v15, sel_init);
}

- (int64_t)hash
{
  _PSAppSuggestionsMetricsItem *v3;
  int64_t v4;

  sub_24549A558();
  v3 = self;
  swift_bridgeObjectRetain();
  sub_24549A0D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24549A0D8();
  swift_bridgeObjectRelease();
  v4 = sub_24549A540();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  return sub_2454834B0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_245481794);
}

- (_PSAppSuggestionsMetricsItem)init
{
  _PSAppSuggestionsMetricsItem *result;

  result = (_PSAppSuggestionsMetricsItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  return (NSString *)sub_245484BD8(self, (uint64_t)a2, (void (*)(void))AppSuggestions.AppSuggestion.description.getter);
}

@end
