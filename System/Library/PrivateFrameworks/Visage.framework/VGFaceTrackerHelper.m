@implementation VGFaceTrackerHelper

+ (NSArray)blendshapeNames
{
  if (blendshapesInitialization(void)::onceToken != -1)
    dispatch_once(&blendshapesInitialization(void)::onceToken, &__block_literal_global_3);
  return (NSArray *)(id)_blendshapeNames;
}

+ (NSDictionary)blendshapeNamesToIdx
{
  if (blendshapesInitialization(void)::onceToken != -1)
    dispatch_once(&blendshapesInitialization(void)::onceToken, &__block_literal_global_3);
  return (NSDictionary *)(id)_blendshapeNameToIdx;
}

@end
