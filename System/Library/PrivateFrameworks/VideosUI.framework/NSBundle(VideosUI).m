@implementation NSBundle(VideosUI)

+ (id)vui_videosUIBundle
{
  if (vui_videosUIBundle_onceToken != -1)
    dispatch_once(&vui_videosUIBundle_onceToken, &__block_literal_global_147);
  return (id)vui_videosUIBundle_bundle;
}

@end
