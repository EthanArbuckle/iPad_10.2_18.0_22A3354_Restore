@implementation PXCMMPhotoKitActionManager

- (PXCMMPhotoKitActionManager)init
{
  PXCMMPhotoKitActionManager *v2;
  PXCMMPhotoKitActionManager *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXCMMPhotoKitActionManager;
  v2 = -[PXCMMActionManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PXCMMActionManager performerClassByType](v2, "performerClassByType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXCMMActionTypeAccept"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXCMMActionTypeCleanup"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXCMMActionTypeForceSync"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXCMMActionTypeSaveToLibrary"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXCMMActionTypeNotifyWhenReadyIfNeeded"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXCMMActionTypeDelete"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXCMMActionTypePublish"));

  }
  return v3;
}

- (id)publishActionPerformer
{
  void *v3;
  uint64_t v4;
  __objc2_class **v5;
  void *v6;
  void *v7;

  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "publishTransport");

  if (v4)
  {
    if (v4 != 1)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = off_1E50B1A48;
  }
  else
  {
    v5 = off_1E50B19F0;
  }
  v6 = (void *)objc_msgSend(objc_alloc(*v5), "initWithActionType:", CFSTR("PXCMMActionTypePublish"));
LABEL_7:
  -[PXCMMActionManager performerDelegate](self, "performerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v7);

  return v6;
}

- (id)messageComposeActionPerformer
{
  PXCMMPhotoKitMessageComposeActionPerformer *v3;
  void *v4;

  v3 = -[PXActionPerformer initWithActionType:]([PXCMMPhotoKitMessageComposeActionPerformer alloc], "initWithActionType:", CFSTR("PXCMMActionTypeMessageCompose"));
  -[PXCMMActionManager performerDelegate](self, "performerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer setDelegate:](v3, "setDelegate:", v4);

  return v3;
}

- (id)photosPickerActionPerformer
{
  PXCMMPhotoKitPhotosPickerActionPerformer *v3;
  void *v4;

  v3 = -[PXActionPerformer initWithActionType:]([PXCMMPhotoKitPhotosPickerActionPerformer alloc], "initWithActionType:", CFSTR("PXCMMActionTypeShowPhotosPicker"));
  -[PXCMMActionManager performerDelegate](self, "performerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer setDelegate:](v3, "setDelegate:", v4);

  return v3;
}

@end
