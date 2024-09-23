@implementation PLSearchBackendStickerSuggestionsGetLog

void __PLSearchBackendStickerSuggestionsGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.backend.search", "SearchBackendStickerSuggestions");
  v1 = (void *)PLSearchBackendStickerSuggestionsGetLog_log;
  PLSearchBackendStickerSuggestionsGetLog_log = (uint64_t)v0;

}

@end
