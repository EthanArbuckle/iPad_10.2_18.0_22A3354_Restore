@implementation NSBundle(PhotosUI)

+ (id)pu_PhotosUIFrameworkBundle
{
  if (pu_PhotosUIFrameworkBundle_onceToken != -1)
    dispatch_once(&pu_PhotosUIFrameworkBundle_onceToken, &__block_literal_global_29961);
  return (id)pu_PhotosUIFrameworkBundle_frameworkBundle;
}

@end
