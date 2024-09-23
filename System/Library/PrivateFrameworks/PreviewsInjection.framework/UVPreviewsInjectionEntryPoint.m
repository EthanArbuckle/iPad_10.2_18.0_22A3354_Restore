@implementation UVPreviewsInjectionEntryPoint

+ (void)load
{
  +[UVBSEndpointMonitor activateMonitor](_TtC17PreviewsInjection19UVBSEndpointMonitor, "activateMonitor");
}

@end
