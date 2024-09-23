@implementation SiriSuggestionsIntelligence.RandomForestModel

- (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence17RandomForestModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  uint64_t v6;

  v6 = sub_24731B478();
  return (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence17RandomForestModel *)SiriSuggestionsIntelligence.RandomForestModel.init(modelDescription:parameters:)(a3, v6);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  _TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence17RandomForestModel *v9;
  void *v10;

  swift_unknownObjectRetain();
  v8 = a4;
  v9 = self;
  v10 = (void *)SiriSuggestionsIntelligence.RandomForestModel.prediction(from:options:)(a3);

  swift_unknownObjectRelease();
  return v10;
}

- (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence17RandomForestModel)init
{
  return (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence17RandomForestModel *)SiriSuggestionsIntelligence.RandomForestModel.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

@end
