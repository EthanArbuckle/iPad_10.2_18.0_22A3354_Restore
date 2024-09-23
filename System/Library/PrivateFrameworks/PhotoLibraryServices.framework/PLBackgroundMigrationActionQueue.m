@implementation PLBackgroundMigrationActionQueue

void __PLBackgroundMigrationActionQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.photos.BackgroundMigrationActionProcessing", v2);
  v1 = (void *)PLBackgroundMigrationActionQueue_sBackgroundMigrationActionQueue;
  PLBackgroundMigrationActionQueue_sBackgroundMigrationActionQueue = (uint64_t)v0;

}

@end
