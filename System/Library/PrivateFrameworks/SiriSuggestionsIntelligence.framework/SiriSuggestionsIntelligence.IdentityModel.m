@implementation SiriSuggestionsIntelligence.IdentityModel

- (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence13IdentityModel)init
{
  return (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence13IdentityModel *)SiriSuggestionsIntelligence.IdentityModel.init()();
}

- (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence13IdentityModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  id v6;
  _TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence13IdentityModel *result;

  sub_24731B478();
  v6 = a3;
  SiriSuggestionsIntelligence.IdentityModel.init(modelDescription:parameters:)();
  return result;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  _TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence13IdentityModel *v8;
  id v9;

  swift_unknownObjectRetain();
  v7 = a4;
  v8 = self;
  v9 = SiriSuggestionsIntelligence.IdentityModel.prediction(from:options:)();

  swift_unknownObjectRelease();
  return v9;
}

@end
