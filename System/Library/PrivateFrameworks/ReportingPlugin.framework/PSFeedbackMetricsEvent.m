@implementation PSFeedbackMetricsEvent

- (PSFeedbackMetricsEvent)initWithId:(id)a3 type:(int64_t)a4 engagedSuggestionId:(id)a5 airdropOptionPresent:(BOOL)a6 visiblePeopleSuggestionCount:(unsigned __int8)a7 visibleAppSuggestionCount:(unsigned __int8)a8 trialExperimentId:(id)a9 trialTreatmentId:(id)a10 trialDeploymentId:(id)a11 peopleSuggestionTimeoutOccurred:(BOOL)a12
{
  uint64_t v12;
  _BOOL8 v13;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  PSFeedbackMetricsEvent *v22;
  _PSFeedbackMetricsEventInternal *v23;
  uint64_t v24;
  _PSFeedbackMetricsEventInternal *underlyingObject;
  uint64_t v27;
  objc_super v28;

  HIDWORD(v27) = a8;
  v12 = a7;
  v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)PSFeedbackMetricsEvent;
  v17 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a5;
  v21 = a3;
  v22 = -[PSFeedbackMetricsEvent init](&v28, sel_init);
  v23 = [_PSFeedbackMetricsEventInternal alloc];
  LOBYTE(v27) = a12;
  v24 = -[_PSFeedbackMetricsEventInternal initWithId:type:engagedSuggestionId:airdropOptionPresent:visiblePeopleSuggestionCount:visibleAppSuggestionCount:trialExperimentId:trialTreatmentId:trialDeploymentId:peopleSuggestionsTimeoutOccurred:](v23, "initWithId:type:engagedSuggestionId:airdropOptionPresent:visiblePeopleSuggestionCount:visibleAppSuggestionCount:trialExperimentId:trialTreatmentId:trialDeploymentId:peopleSuggestionsTimeoutOccurred:", v21, a4, v20, v13, v12, HIDWORD(v27), v19, v18, v17, v27, v28.receiver, v28.super_class);

  underlyingObject = v22->_underlyingObject;
  v22->_underlyingObject = (_PSFeedbackMetricsEventInternal *)v24;

  return v22;
}

- (_PSFeedbackMetricsEventInternal)underlyingObject
{
  return (_PSFeedbackMetricsEventInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
