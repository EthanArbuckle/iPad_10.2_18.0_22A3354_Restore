@implementation PXPhotoKitAssetSpotlightActionManager

- (BOOL)supportsActionType:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PXAssetActionTypeShare")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("PXAssetActionTypeSpotlightOpenApp")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXAssetActionTypeCopy"));
  }

  return v4;
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4;
  objc_super *v5;
  unsigned __int8 v6;
  PXPhotoKitAssetSpotlightActionManager *v8;
  PXPhotoKitAssetSpotlightActionManager *v9;
  objc_super v10;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeShare")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeSpotlightOpenApp")) & 1) != 0)
  {
    goto LABEL_11;
  }
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeCopy")))
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeAddToAlbum")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeAddToAlbumStream")) & 1) == 0)
    {
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeSyndicationSaveToLibrary")))
      {
        v9 = self;
        v5 = (objc_super *)&v9;
        goto LABEL_5;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeShowActionsMenu")) & 1) == 0)
      {
        if (!objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeNotThisPerson")))
        {
          v6 = 0;
          goto LABEL_12;
        }
        v8 = self;
        v5 = (objc_super *)&v8;
        goto LABEL_5;
      }
    }
LABEL_11:
    v6 = 1;
    goto LABEL_12;
  }
  v10.receiver = self;
  v5 = &v10;
LABEL_5:
  v5->super_class = (Class)PXPhotoKitAssetSpotlightActionManager;
  v6 = -[objc_super canPerformActionType:](v5, sel_canPerformActionType_, v4, v8);
LABEL_12:

  return v6;
}

- (void)px_registerAdditionalPerformerClasses
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotoKitAssetSpotlightActionManager;
  -[PXAssetActionManager px_registerAdditionalPerformerClasses](&v3, sel_px_registerAdditionalPerformerClasses);
  -[PXPhotoKitAssetActionManager registerPerformerClass:forType:](self, "registerPerformerClass:forType:", objc_opt_class(), CFSTR("PXAssetActionTypeSpotlightOpenApp"));
}

- (unint64_t)presentationSource
{
  return 1;
}

+ (id)notThisPersonLocalizedTitleForPerson:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "px_localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    PXLocalizedStringForPersonOrPetAndVisibility(v3, 0, CFSTR("PXPeopleAssetNotThisNamedPersonFormat"));
    v5 = objc_claimAutoreleasedReturnValue();

    PXStringWithValidatedFormat();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)v5;
  }
  else
  {
    PXLocalizedStringForPersonOrPetAndVisibility(v3, 0, CFSTR("PXPeopleAssetNotThisUnnamedPerson"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)notThisPersonSystemImage
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.crop.circle.badge.xmark"));
}

@end
