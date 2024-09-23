@implementation _SBHLibraryPodIconView

- (id)createNewIconLabelViewFactory
{
  if (createNewIconLabelViewFactory_onceToken != -1)
    dispatch_once(&createNewIconLabelViewFactory_onceToken, &__block_literal_global_81);
  return (id)createNewIconLabelViewFactory_appLibraryFactory;
}

+ (BOOL)supportsDragInteraction
{
  return 0;
}

+ (BOOL)supportsTapGesture
{
  return 0;
}

+ (BOOL)supportsPreviewInteraction
{
  return 0;
}

+ (BOOL)supportsCursorInteraction
{
  return 0;
}

@end
