@implementation _PSAppSuggestionsMetricsInferenceEventInternal

- (NSSet)suggestions
{
  void *v2;

  type metadata accessor for AppSuggestions.AppSuggestion();
  sub_24548B1F8(&qword_254413750, type metadata accessor for AppSuggestions.AppSuggestion, MEMORY[0x24BEE5BD8]);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_24549A18C();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (_PSAppSuggestionsMetricsInferenceEventInternal)initWithId:(id)a3 suggestions:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _PSAppSuggestionsMetricsInferenceEventInternal *v9;
  uint64_t *v10;
  objc_super v12;

  v5 = sub_24549A0B4();
  v7 = v6;
  type metadata accessor for AppSuggestions.AppSuggestion();
  sub_24548B1F8(&qword_254413750, type metadata accessor for AppSuggestions.AppSuggestion, MEMORY[0x24BEE5BD8]);
  v8 = sub_24549A198();
  v9 = self;
  sub_2454862D8(v8);
  *(Class *)((char *)&v9->super.super.isa + OBJC_IVAR____PSAppSuggestionsMetricsInferenceEventInternal_suggestions) = (Class)v8;

  v10 = (uint64_t *)((char *)v9 + OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id);
  *v10 = v5;
  v10[1] = v7;
  v12.receiver = v9;
  v12.super_class = (Class)type metadata accessor for PeopleSuggestionInference();
  return -[PeopleSuggestionInference init](&v12, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  return (NSString *)sub_245484BD8(self, (uint64_t)a2, (void (*)(void))AppSuggestions.description.getter);
}

@end
