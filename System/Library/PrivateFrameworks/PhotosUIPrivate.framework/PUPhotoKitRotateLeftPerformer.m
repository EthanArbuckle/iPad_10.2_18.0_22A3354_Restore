@implementation PUPhotoKitRotateLeftPerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E0D7BFF0];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end
