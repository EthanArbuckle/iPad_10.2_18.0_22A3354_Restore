@implementation PUPhotoKitMoveToPersonalLibraryFromSuggestionActionPerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E0D7C070];
}

- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a3;
  v6 = a4;
  if (v4)
    -[PUPhotoKitActionPerformer forceIncludeAssetsInDataSource](self, "forceIncludeAssetsInDataSource");
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoKitMoveToPersonalLibraryFromSuggestionActionPerformer;
  -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](&v7, sel_completeUserInteractionTaskWithSuccess_error_, v4, v6);

}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "px_isSharedLibrarySharingSuggestion") & 1) != 0
    || objc_msgSend(v7, "px_isSharedLibrarySharingSuggestionsSmartAlbum"))
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___PUPhotoKitMoveToPersonalLibraryFromSuggestionActionPerformer;
    v8 = objc_msgSendSuper2(&v10, sel_canPerformOnAsset_inAssetCollection_, v6, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end
