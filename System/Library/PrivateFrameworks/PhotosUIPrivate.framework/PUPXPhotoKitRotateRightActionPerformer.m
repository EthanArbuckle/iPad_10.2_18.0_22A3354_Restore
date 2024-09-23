@implementation PUPXPhotoKitRotateRightActionPerformer

- (int64_t)rotateDirection
{
  return 1;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return (id)PXLocalizedString();
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("rotate.right");
}

@end
