@implementation ATXProactiveSuggestion(ATXProactiveCardSuggestionClient)

- (void)infoSuggestion
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AA841000, log, OS_LOG_TYPE_FAULT, "No info suggestion for a card suggestion client object", v1, 2u);
}

@end
