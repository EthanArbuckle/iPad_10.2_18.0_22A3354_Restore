@implementation PUPhotoKitPlaybackRatePerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E0D7BFE8];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end
