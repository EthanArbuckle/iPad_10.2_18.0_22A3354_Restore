@implementation PUPXPhotoKitRotateLeftActionPerformer

- (int64_t)rotateDirection
{
  return 0;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return (id)PXLocalizedString();
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("rotate.left");
}

@end
