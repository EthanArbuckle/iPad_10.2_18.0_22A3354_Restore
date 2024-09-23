@implementation PBFSBSWallpaperServiceHelper

+ (SBSWallpaperService)wallpaperService
{
  return (SBSWallpaperService *)objc_alloc_init((Class)getSBSWallpaperServiceClass());
}

@end
