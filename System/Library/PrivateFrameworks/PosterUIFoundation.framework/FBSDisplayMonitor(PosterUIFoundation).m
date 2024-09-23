@implementation FBSDisplayMonitor(PosterUIFoundation)

+ (id)pui_sharedDisplayMonitor
{
  if (pui_sharedDisplayMonitor_onceToken != -1)
    dispatch_once(&pui_sharedDisplayMonitor_onceToken, &__block_literal_global_24);
  return (id)pui_sharedDisplayMonitor_displayMonitor;
}

@end
