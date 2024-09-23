@implementation PLSearchBackendModelTranslationGetLog

void __PLSearchBackendModelTranslationGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.backend.search", "SearchBackendModelTranslation");
  v1 = (void *)PLSearchBackendModelTranslationGetLog_log;
  PLSearchBackendModelTranslationGetLog_log = (uint64_t)v0;

}

@end
