@implementation PXPhotoKitAssetCollectionSetScreensaverActionPerformer

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return 0;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(CFSTR("PXPhotoKitAssetCollectionManagerStandardActionTitle_SetScreensaver"), CFSTR("PhotosUICore"));
}

@end
