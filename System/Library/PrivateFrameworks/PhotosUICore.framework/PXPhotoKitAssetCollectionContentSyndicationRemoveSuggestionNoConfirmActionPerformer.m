@implementation PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionNoConfirmActionPerformer

- (PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionNoConfirmActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionNoConfirmActionPerformer *v5;
  PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionNoConfirmActionPerformer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionNoConfirmActionPerformer;
  v5 = -[PXAssetCollectionActionPerformer initWithActionType:assetCollectionReference:displayTitleInfo:](&v8, sel_initWithActionType_assetCollectionReference_displayTitleInfo_, a3, a4, a5);
  v6 = v5;
  if (v5)
    -[PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer setShouldSkipUserConfirmation:](v5, "setShouldSkipUserConfirmation:", 1);
  return v6;
}

@end
