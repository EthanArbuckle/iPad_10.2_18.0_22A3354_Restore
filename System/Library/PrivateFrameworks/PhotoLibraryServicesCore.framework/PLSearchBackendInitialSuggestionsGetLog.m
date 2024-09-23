@implementation PLSearchBackendInitialSuggestionsGetLog

void __PLSearchBackendInitialSuggestionsGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.backend.search", "SearchBackendInitialSuggestions");
  v1 = (void *)PLSearchBackendInitialSuggestionsGetLog_log;
  PLSearchBackendInitialSuggestionsGetLog_log = (uint64_t)v0;

}

@end
