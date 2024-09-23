@implementation AXLogAppCompareGeometry

void __AXLogAppCompareGeometry_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXAppCompareGeometry");
  v1 = (void *)AXLogAppCompareGeometry___logObj;
  AXLogAppCompareGeometry___logObj = (uint64_t)v0;

}

@end
