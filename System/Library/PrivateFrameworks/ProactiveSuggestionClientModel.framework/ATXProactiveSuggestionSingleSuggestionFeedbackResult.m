@implementation ATXProactiveSuggestionSingleSuggestionFeedbackResult

- (ATXProactiveSuggestionSingleSuggestionFeedbackResult)initWithEngagementType:(int64_t)a3 suggestion:(id)a4 consumerSubType:(unsigned __int8)a5 clientCacheUpdate:(id)a6 uiCacheUpdate:(id)a7 context:(id)a8
{
  uint64_t v11;
  id v15;
  ATXProactiveSuggestionSingleSuggestionFeedbackResult *v16;
  ATXProactiveSuggestionSingleSuggestionFeedbackResult *v17;
  objc_super v19;

  v11 = a5;
  v15 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ATXProactiveSuggestionSingleSuggestionFeedbackResult;
  v16 = -[ATXProactiveSuggestionFeedbackResult initWithConsumerSubType:sessionType:clientCacheUpdate:uiCacheUpdate:context:](&v19, sel_initWithConsumerSubType_sessionType_clientCacheUpdate_uiCacheUpdate_context_, v11, 1, a6, a7, a8);
  v17 = v16;
  if (v16)
  {
    v16->_engagementType = a3;
    objc_storeStrong((id *)&v16->_suggestion, a4);
  }

  return v17;
}

- (int64_t)engagementType
{
  return self->_engagementType;
}

- (ATXProactiveSuggestion)suggestion
{
  return self->_suggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end
