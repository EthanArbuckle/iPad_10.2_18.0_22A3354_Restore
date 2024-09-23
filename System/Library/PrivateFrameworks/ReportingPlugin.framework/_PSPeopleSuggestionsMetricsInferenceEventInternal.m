@implementation _PSPeopleSuggestionsMetricsInferenceEventInternal

- (_PSPeopleSuggestionsMetricsInferenceEventInternal)initWithId:(id)a3 responseType:(int64_t)a4 suggestions:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _PSPeopleSuggestionsMetricsInferenceEventInternal *v11;
  uint64_t *v12;
  objc_super v14;

  v7 = sub_24549A0B4();
  v9 = v8;
  type metadata accessor for PeopleSuggestions.PeopleSuggestion();
  sub_24548B1F8(&qword_254413848, type metadata accessor for PeopleSuggestions.PeopleSuggestion, MEMORY[0x24BEE5BD8]);
  v10 = sub_24549A198();
  v11 = self;
  sub_245487774(v10);
  *(Class *)((char *)&v11->super.super.isa + OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_responseType) = (Class)a4;
  *(Class *)((char *)&v11->super.super.isa + OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_suggestions) = (Class)v10;

  v12 = (uint64_t *)((char *)v11 + OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id);
  *v12 = v7;
  v12[1] = v9;
  v14.receiver = v11;
  v14.super_class = (Class)type metadata accessor for PeopleSuggestionInference();
  return -[PeopleSuggestionInference init](&v14, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  return (NSString *)sub_245484BD8(self, (uint64_t)a2, (void (*)(void))PeopleSuggestions.description.getter);
}

@end
