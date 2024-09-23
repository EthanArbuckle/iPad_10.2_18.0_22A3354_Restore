@implementation PUPhotoKitSyndicationSaveActionPerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E0D7C110];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a3, "px_isSyndicatedAsset");
}

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a3, "px_isUnsavedSyndicatedAsset");
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end
