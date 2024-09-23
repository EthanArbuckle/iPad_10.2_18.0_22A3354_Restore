@implementation PUPhotoKitMoveToSharedLibraryActionPerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E0D7C078];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end
