@implementation PUCopyToPasteboardActivity

- (id)activityTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PUCopyToPasteboardActivity itemSourceController](self, "itemSourceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXMediaTypeForAssets();
  objc_msgSend(v3, "count");
  PXLocalizationKeyForMediaType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v4 = a3;
  -[PUCopyToPasteboardActivity itemSourceController](self, "itemSourceController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPreparingIndividualItems");

  objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowCopyingVideos");

  v9 = v8 & v6;
  if ((v8 & 1) == 0 && v6)
  {
    -[PUCopyToPasteboardActivity itemSourceController](self, "itemSourceController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    if (v10 && (v11 = v10, objc_msgSend(v10, "requestAssetsMediaTypeCount"), v11, *((_QWORD *)&v14 + 1)))
    {
      v9 = 0;
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)PUCopyToPasteboardActivity;
      v9 = -[UICopyToPasteboardActivity canPerformWithActivityItems:](&v13, sel_canPerformWithActivityItems_, v4);
    }
  }

  return v9;
}

- (PXActivityItemSourceController)itemSourceController
{
  return (PXActivityItemSourceController *)objc_loadWeakRetained((id *)&self->_itemSourceController);
}

- (void)setItemSourceController:(id)a3
{
  objc_storeWeak((id *)&self->_itemSourceController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_itemSourceController);
}

@end
