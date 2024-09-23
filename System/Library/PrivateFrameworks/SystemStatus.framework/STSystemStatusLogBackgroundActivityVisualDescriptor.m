@implementation STSystemStatusLogBackgroundActivityVisualDescriptor

void __STSystemStatusLogBackgroundActivityVisualDescriptor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(STSystemStatusLoggingSubsystem, "BackgroundActivityVisualDescriptor");
  v1 = (void *)_MergedGlobals_18;
  _MergedGlobals_18 = (uint64_t)v0;

}

@end
