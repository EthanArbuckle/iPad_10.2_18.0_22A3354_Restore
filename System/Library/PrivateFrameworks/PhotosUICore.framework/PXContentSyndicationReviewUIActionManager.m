@implementation PXContentSyndicationReviewUIActionManager

- (void)px_registerAdditionalPerformerClasses
{
  objc_super v3;

  -[PXPhotoKitAssetActionManager registerPerformerClass:forType:](self, "registerPerformerClass:forType:", objc_opt_class(), CFSTR("PXAssetActionTypeInternalContentSyndicationPromoteToGuest"));
  v3.receiver = self;
  v3.super_class = (Class)PXContentSyndicationReviewUIActionManager;
  -[PXAssetActionManager px_registerAdditionalPerformerClasses](&v3, sel_px_registerAdditionalPerformerClasses);
}

@end
