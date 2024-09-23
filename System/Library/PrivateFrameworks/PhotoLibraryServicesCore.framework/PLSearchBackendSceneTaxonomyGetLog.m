@implementation PLSearchBackendSceneTaxonomyGetLog

void __PLSearchBackendSceneTaxonomyGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.backend.search", "SearchBackendSceneTaxonomy");
  v1 = (void *)PLSearchBackendSceneTaxonomyGetLog_log;
  PLSearchBackendSceneTaxonomyGetLog_log = (uint64_t)v0;

}

@end
