@implementation PXHideAssetsAction

- (PXHideAssetsAction)initWithAssets:(id)a3 hidden:(BOOL)a4
{
  void *v5;
  PXHideAssetsAction *v6;
  PXHideAssetsAction *v7;
  objc_super v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *);
  void *v13;
  PXHideAssetsAction *v14;
  BOOL v15;

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __44__PXHideAssetsAction_initWithAssets_hidden___block_invoke;
  v13 = &unk_1E5131E38;
  v15 = a4;
  v14 = self;
  PXFilter();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = v14;
  v9.super_class = (Class)PXHideAssetsAction;
  v6 = -[PXAssetsAction initWithAssets:](&v9, sel_initWithAssets_, v5);
  v7 = v6;
  if (v6)
    v6->_hidden = a4;

  return v7;
}

- (PXHideAssetsAction)initWithAssets:(id)a3
{
  id v4;
  PXHideAssetsAction *v5;

  v4 = a3;
  v5 = -[PXHideAssetsAction initWithAssets:hidden:](self, "initWithAssets:hidden:", v4, objc_msgSend((id)objc_opt_class(), "toggledValueForAssets:", v4));

  return v5;
}

- (id)actionIdentifier
{
  return CFSTR("HideAssets");
}

- (id)actionNameLocalizationKey
{
  if (-[PXHideAssetsAction isHidden](self, "isHidden"))
    return CFSTR("PXHideActionName");
  else
    return CFSTR("PXUnhideActionName");
}

- (void)performAction:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v6[4];
  BOOL v7;

  v4 = a3;
  v5 = -[PXHideAssetsAction isHidden](self, "isHidden");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__PXHideAssetsAction_performAction___block_invoke;
  v6[3] = &__block_descriptor_33_e30_v16__0__PHAssetChangeRequest_8l;
  v7 = v5;
  -[PXAssetsAction performAssetChanges:completionHandler:](self, "performAssetChanges:completionHandler:", v6, v4);

}

- (void)performUndo:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v6[4];
  BOOL v7;

  v4 = a3;
  v5 = -[PXHideAssetsAction isHidden](self, "isHidden");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__PXHideAssetsAction_performUndo___block_invoke;
  v6[3] = &__block_descriptor_33_e30_v16__0__PHAssetChangeRequest_8l;
  v7 = !v5;
  -[PXAssetsAction performAssetChanges:completionHandler:](self, "performAssetChanges:completionHandler:", v6, v4);

}

- (BOOL)isHidden
{
  return self->_hidden;
}

uint64_t __34__PXHideAssetsAction_performUndo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHidden:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __36__PXHideAssetsAction_performAction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHidden:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __44__PXHideAssetsAction_initWithAssets_hidden___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (*(unsigned __int8 *)(a1 + 40) == objc_msgSend(v3, "isHidden"))
    v4 = 0;
  else
    v4 = objc_msgSend((id)objc_opt_class(), "canPerformOnAsset:inAssetCollection:", v3, 0);

  return v4;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v4;
  int v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isTrashed") & 1) != 0
    || (objc_msgSend(v4, "isRecoveredAsset") & 1) != 0
    || objc_msgSend(v4, "sourceType") == 2
    || objc_msgSend(v4, "sourceType") == 8)
  {
    goto LABEL_5;
  }
  if (!objc_msgSend(v4, "px_isSyndicatedAsset"))
  {
    LOBYTE(v5) = 1;
    goto LABEL_6;
  }
  if (!objc_msgSend(v4, "px_isUnsavedSyndicatedAsset"))
LABEL_5:
    LOBYTE(v5) = 0;
  else
    v5 = objc_msgSend(v4, "px_isSyndicationPhotoLibraryAsset") ^ 1;
LABEL_6:

  return v5;
}

+ (BOOL)toggledValueForAssets:(id)a3
{
  return PXExists();
}

+ (BOOL)currentValueForAssets:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
    v5 = objc_msgSend(a1, "toggledValueForAssets:", v4) ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

uint64_t __44__PXHideAssetsAction_toggledValueForAssets___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHidden") ^ 1;
}

@end
