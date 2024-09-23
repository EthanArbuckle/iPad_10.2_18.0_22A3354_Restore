@implementation PLPhotosSearchCurationGetLog

void __PLPhotosSearchCurationGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.search.curation", "SearchCuration");
  v1 = (void *)PLPhotosSearchCurationGetLog_log;
  PLPhotosSearchCurationGetLog_log = (uint64_t)v0;

}

@end
