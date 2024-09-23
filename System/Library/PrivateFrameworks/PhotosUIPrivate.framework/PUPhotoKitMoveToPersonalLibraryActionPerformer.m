@implementation PUPhotoKitMoveToPersonalLibraryActionPerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E0D7C070];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end
