@implementation _PSPeopleSuggestionsMetricsItemInternal

- (NSString)id
{
  return (NSString *)sub_245482500();
}

- (_PSPeopleSuggestionsMetricsModelInternal)model
{
  return (_PSPeopleSuggestionsMetricsModelInternal *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                             + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_model));
}

- (_PSPeopleSuggestionsMetricsItemInternal)initWithId:(id)a3 model:(id)a4 transportBundleId:(id)a5 rank:(unsigned __int8)a6 score:(double)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v10 = sub_24549A0B4();
  v12 = v11;
  v13 = sub_24549A0B4();
  return (_PSPeopleSuggestionsMetricsItemInternal *)PeopleSuggestions.PeopleSuggestion.init(id:model:transportBundleId:rank:score:)(v10, v12, (uint64_t)a4, v13, v14, a6, a7);
}

- (int64_t)hash
{
  _PSPeopleSuggestionsMetricsItemInternal *v3;
  id v4;
  int64_t v5;

  sub_24549A558();
  v3 = self;
  swift_bridgeObjectRetain();
  sub_24549A0D8();
  swift_bridgeObjectRelease();
  v4 = *(id *)((char *)&v3->super.isa + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_model);
  sub_24549A240();

  v5 = sub_24549A540();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  return sub_2454834B0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_245480674);
}

- (_PSPeopleSuggestionsMetricsItemInternal)init
{
  _PSPeopleSuggestionsMetricsItemInternal *result;

  result = (_PSPeopleSuggestionsMetricsItemInternal *)_swift_stdlib_reportUnimplementedInitializer();
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
  return (NSString *)sub_245484BD8(self, (uint64_t)a2, (void (*)(void))PeopleSuggestions.PeopleSuggestion.description.getter);
}

@end
