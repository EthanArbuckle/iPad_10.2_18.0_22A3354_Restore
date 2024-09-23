@implementation PUSidebarDataSectionEnablementController

- (PUSidebarDataSectionEnablementController)initWithPhotoLibrary:(id)a3 isPhotosPicker:(BOOL)a4 excludesHiddenAlbum:(BOOL)a5
{
  id v8;
  PUSidebarDataSectionEnablementController *v9;
  PUSidebarDataSectionEnablementController *v10;
  uint64_t v11;
  NSMapTable *sectionManagerByItemTypeForAccountStoreChange;
  uint64_t v13;
  NSMapTable *sectionManagersByItemTypeForDefaultsChange;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PUSidebarDataSectionEnablementController;
  v9 = -[PUSidebarDataSectionEnablementController init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_photoLibrary, v8);
    v10->_isPhotosPicker = a4;
    v10->_excludesHiddenAlbum = a5;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    sectionManagerByItemTypeForAccountStoreChange = v10->_sectionManagerByItemTypeForAccountStoreChange;
    v10->_sectionManagerByItemTypeForAccountStoreChange = (NSMapTable *)v11;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    sectionManagersByItemTypeForDefaultsChange = v10->_sectionManagersByItemTypeForDefaultsChange;
    v10->_sectionManagersByItemTypeForDefaultsChange = (NSMapTable *)v13;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  if (-[PUSidebarDataSectionEnablementController registeredAsPrefObserver](self, "registeredAsPrefObserver"))
    PXUnregisterPreferencesObserver();
  v3.receiver = self;
  v3.super_class = (Class)PUSidebarDataSectionEnablementController;
  -[PUSidebarDataSectionEnablementController dealloc](&v3, sel_dealloc);
}

- (void)configureEnablementOfSectionManager:(id)a3 enablementItem:(int64_t)a4
{
  -[PUSidebarDataSectionEnablementController _configureEnablementOfSectionManager:enablementItem:setupObservation:](self, "_configureEnablementOfSectionManager:enablementItem:setupObservation:", a3, a4, 1);
}

- (void)_configureEnablementOfSectionManager:(id)a3 enablementItem:(int64_t)a4 setupObservation:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  PUSidebarDataSectionEnablementController *v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v21;
  void *v22;

  v5 = a5;
  v8 = a3;
  v22 = v8;
  switch(a4)
  {
    case 0:
    case 5:
    case 16:
    case 26:
      v9 = -[PUSidebarDataSectionEnablementController isPhotosPicker](self, "isPhotosPicker") ^ 1;
      goto LABEL_12;
    case 1:
      if (-[PUSidebarDataSectionEnablementController isPhotosPicker](self, "isPhotosPicker"))
      {
        v8 = v22;
LABEL_2:
        v9 = 1;
LABEL_32:
        objc_msgSend(v8, "setEnabled:", v9);
        goto LABEL_33;
      }
      objc_msgSend(v22, "setEnabled:", PLIsFeaturedContentAllowed());
      v14 = v22;
      if (v5)
      {
        v15 = self;
        v16 = v22;
        v17 = 1;
LABEL_37:
        -[PUSidebarDataSectionEnablementController _observeDefaultsForManager:enablementItem:](v15, "_observeDefaultsForManager:enablementItem:", v16, v17);
LABEL_33:
        v14 = v22;
      }
LABEL_34:

      return;
    case 2:
      if (-[PUSidebarDataSectionEnablementController isPhotosPicker](self, "isPhotosPicker"))
        goto LABEL_30;
      +[PUTabbedLibrarySettings sharedInstance](PUTabbedLibrarySettings, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "enableForYouTab");
      goto LABEL_28;
    case 3:
    case 12:
    case 13:
    case 22:
      goto LABEL_2;
    case 4:
      if (-[PUSidebarDataSectionEnablementController excludesHiddenAlbum](self, "excludesHiddenAlbum"))
        goto LABEL_30;
      objc_msgSend(v22, "setEnabled:", PXPreferencesIsHiddenAlbumVisible());
      v14 = v22;
      if (!v5)
        goto LABEL_34;
      v15 = self;
      v16 = v22;
      v17 = 4;
      goto LABEL_37;
    case 6:
      if (-[PUSidebarDataSectionEnablementController isPhotosPicker](self, "isPhotosPicker"))
        goto LABEL_30;
      objc_msgSend(MEMORY[0x1E0D7B2B8], "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "enableRecentlyEditedAlbum");
LABEL_28:
      objc_msgSend(v22, "setEnabled:", v20);

      goto LABEL_33;
    case 8:
    case 9:
      -[PUSidebarDataSectionEnablementController photoLibrary](self, "photoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "photoLibraryURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = -[PUSidebarDataSectionEnablementController isPhotosPicker](self, "isPhotosPicker");
      if (a4 == 8 && v12)
        v13 = 0;
      else
        v13 = objc_msgSend(MEMORY[0x1E0D719E0], "sharedStreamsEnabledForPhotoLibraryURL:", v11);
      objc_msgSend(v22, "setEnabled:", v13);
      if (v5)
        -[PUSidebarDataSectionEnablementController _observeAccountsStoreForManager:enablementItem:](self, "_observeAccountsStoreForManager:enablementItem:", v22, a4);

      goto LABEL_33;
    case 14:
    case 15:
      if (-[PUSidebarDataSectionEnablementController isPhotosPicker](self, "isPhotosPicker"))
        goto LABEL_30;
      objc_msgSend(v22, "setEnabled:", PLIsFeaturedContentAllowed());
      v14 = v22;
      if (!v5)
        goto LABEL_34;
      v15 = self;
      v16 = v22;
      v17 = a4;
      goto LABEL_37;
    case 17:
    case 25:
      v18 = -[PUSidebarDataSectionEnablementController isPhotosPicker](self, "isPhotosPicker");
      goto LABEL_11;
    case 18:
    case 20:
      goto LABEL_31;
    case 19:
      if (-[PUSidebarDataSectionEnablementController isPhotosPicker](self, "isPhotosPicker"))
      {
LABEL_30:
        v8 = v22;
LABEL_31:
        v9 = 0;
      }
      else
      {
        v18 = MEMORY[0x1AF42A744]();
LABEL_11:
        v9 = v18;
LABEL_12:
        v8 = v22;
      }
      goto LABEL_32;
    default:
      v21 = -[PUSidebarDataSectionEnablementController isPhotosPicker](self, "isPhotosPicker");
      v14 = v22;
      if (!v21)
        goto LABEL_34;
      v8 = v22;
      goto LABEL_31;
  }
}

- (void)_observeAccountsStoreForManager:(id)a3 enablementItem:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  -[PUSidebarDataSectionEnablementController sectionManagerByItemTypeForAccountStoreChange](self, "sectionManagerByItemTypeForAccountStoreChange");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0D71C28];
    objc_msgSend(MEMORY[0x1E0D71568], "pl_sharedAccountStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__accountStoreDidChange_, v8, v9);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v6, v10);

}

- (void)_observeDefaultsForManager:(id)a3 enablementItem:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PUSidebarDataSectionEnablementController sectionManagersByItemTypeForDefaultsChange](self, "sectionManagersByItemTypeForDefaultsChange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v8);

  if (!-[PUSidebarDataSectionEnablementController registeredAsPrefObserver](self, "registeredAsPrefObserver"))
  {
    -[PUSidebarDataSectionEnablementController setRegisteredAsPrefObserver:](self, "setRegisteredAsPrefObserver:", 1);
    PXRegisterPreferencesObserver();
  }
}

- (void)_accountStoreDidChange:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[PUSidebarDataSectionEnablementController sectionManagerByItemTypeForAccountStoreChange](self, "sectionManagerByItemTypeForAccountStoreChange", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__PUSidebarDataSectionEnablementController__accountStoreDidChange___block_invoke;
  v6[3] = &unk_1E589E5D8;
  v6[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

}

- (void)preferencesDidChange
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[PUSidebarDataSectionEnablementController sectionManagersByItemTypeForDefaultsChange](self, "sectionManagersByItemTypeForDefaultsChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PUSidebarDataSectionEnablementController_preferencesDidChange__block_invoke;
  v5[3] = &unk_1E589E5D8;
  v5[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

- (NSMapTable)sectionManagerByItemTypeForAccountStoreChange
{
  return self->_sectionManagerByItemTypeForAccountStoreChange;
}

- (NSMapTable)sectionManagersByItemTypeForDefaultsChange
{
  return self->_sectionManagersByItemTypeForDefaultsChange;
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_loadWeakRetained((id *)&self->_photoLibrary);
}

- (BOOL)isPhotosPicker
{
  return self->_isPhotosPicker;
}

- (BOOL)excludesHiddenAlbum
{
  return self->_excludesHiddenAlbum;
}

- (BOOL)registeredAsPrefObserver
{
  return self->_registeredAsPrefObserver;
}

- (void)setRegisteredAsPrefObserver:(BOOL)a3
{
  self->_registeredAsPrefObserver = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_sectionManagersByItemTypeForDefaultsChange, 0);
  objc_storeStrong((id *)&self->_sectionManagerByItemTypeForAccountStoreChange, 0);
}

void __64__PUSidebarDataSectionEnablementController_preferencesDidChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "_configureEnablementOfSectionManager:enablementItem:setupObservation:", v5, objc_msgSend(a2, "integerValue"), 0);

}

void __67__PUSidebarDataSectionEnablementController__accountStoreDidChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "_configureEnablementOfSectionManager:enablementItem:setupObservation:", v5, objc_msgSend(a2, "integerValue"), 0);

}

@end
