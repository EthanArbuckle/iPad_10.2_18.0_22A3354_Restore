@implementation _PSMetricsManagerInternal

+ (void)recordWithInference:(id)a3
{
  id v3;

  v3 = a3;
  _s15ReportingPlugin29PeopleSuggesterMetricsManagerC6record9inferenceyAA0C19SuggestionInferenceC_tFZ_0(v3);

}

+ (void)recordWithFeedback:(id)a3
{
  id v3;

  v3 = a3;
  _s15ReportingPlugin29PeopleSuggesterMetricsManagerC6record8feedbackyAA0cD13FeedbackEventC_tFZ_0();

}

- (_PSMetricsManagerInternal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PeopleSuggesterMetricsManager();
  return -[_PSMetricsManagerInternal init](&v3, sel_init);
}

@end
