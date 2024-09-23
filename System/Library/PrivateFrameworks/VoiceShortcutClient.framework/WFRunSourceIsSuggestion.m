@implementation WFRunSourceIsSuggestion

void __WFRunSourceIsSuggestion_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];

  v2[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("siri");
  v2[1] = CFSTR("lock_screen_prediction");
  v2[2] = CFSTR("WFWorkflowRunSourceSuggestionsWidgetPrediction");
  v2[3] = CFSTR("spotlight_prediction");
  v2[4] = CFSTR("spotlight-search");
  v2[5] = CFSTR("watch-face");
  v2[6] = CFSTR("siri_cloud_relay");
  v2[7] = CFSTR("carplay");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WFRunSourceIsSuggestion_s_suggestionRunSources;
  WFRunSourceIsSuggestion_s_suggestionRunSources = v0;

}

@end
