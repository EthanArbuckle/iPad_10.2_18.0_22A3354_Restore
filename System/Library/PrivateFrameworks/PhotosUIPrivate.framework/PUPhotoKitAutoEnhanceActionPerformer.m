@implementation PUPhotoKitAutoEnhanceActionPerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E0D7BFD8];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end
