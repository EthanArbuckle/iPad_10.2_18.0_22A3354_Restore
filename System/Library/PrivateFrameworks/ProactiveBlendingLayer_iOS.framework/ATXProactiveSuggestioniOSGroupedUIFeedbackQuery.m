@implementation ATXProactiveSuggestioniOSGroupedUIFeedbackQuery

- (ATXProactiveSuggestioniOSGroupedUIFeedbackQuery)initWithClientModelIds:(id)a3 consumerSubTypeToConsider:(unsigned __int8)a4 startDateForResults:(id)a5 bookmarkURLPath:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  ATXProactiveSuggestioniOSGroupedUIFeedbackQuery *v14;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  +[ATXBlendingLayerHyperParameters sharedInstance](ATXBlendingLayerHyperParameters, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ATXProactiveSuggestionGroupedUIFeedbackQuery initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:hyperParameters:](self, "initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:hyperParameters:", v12, v7, v11, v10, v13);

  return v14;
}

@end
