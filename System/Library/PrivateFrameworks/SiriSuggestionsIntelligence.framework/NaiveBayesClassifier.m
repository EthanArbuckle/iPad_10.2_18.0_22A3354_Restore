@implementation NaiveBayesClassifier

- (NaiveBayesClassifier)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  uint64_t v6;

  v6 = sub_24731B478();
  return (NaiveBayesClassifier *)SiriSuggestionsIntelligence.NaiveBayesClassifier.init(modelDescription:parameters:)(a3, v6);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  NaiveBayesClassifier *v8;
  void *v9;
  void *v10;

  swift_unknownObjectRetain();
  v7 = a4;
  v8 = self;
  SiriSuggestionsIntelligence.NaiveBayesClassifier.prediction(from:options:)();
  v10 = v9;

  swift_unknownObjectRelease();
  return v10;
}

- (NaiveBayesClassifier)init
{
  SiriSuggestionsIntelligence.NaiveBayesClassifier.init()();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
