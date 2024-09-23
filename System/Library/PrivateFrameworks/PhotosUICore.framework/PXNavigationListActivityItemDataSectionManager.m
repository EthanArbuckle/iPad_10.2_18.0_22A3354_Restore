@implementation PXNavigationListActivityItemDataSectionManager

- (PXNavigationListActivityItemDataSectionManager)initWithItem:(id)a3
{
  PXNavigationListActivityItemDataSectionManager *v3;
  PXNavigationListActivityItemDataSectionManager *v4;
  PXForYouBadgeManager *v5;
  void *v6;
  uint64_t v7;
  PXForYouBadgeManager *badgeManager;
  PXNavigationListActivityItemDataSectionManager *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXNavigationListActivityItemDataSectionManager;
  v3 = -[PXNavigationListItemDataSectionManager initWithItem:](&v11, sel_initWithItem_, a3);
  v4 = v3;
  if (v3)
  {
    -[PXNavigationListItemDataSectionManager setEnabled:](v3, "setEnabled:", 1);
    v5 = [PXForYouBadgeManager alloc];
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXForYouBadgeManager initWithPhotoLibrary:](v5, "initWithPhotoLibrary:", v6);
    badgeManager = v4->_badgeManager;
    v4->_badgeManager = (PXForYouBadgeManager *)v7;

    -[PXForYouBadgeManager registerChangeObserver:context:](v4->_badgeManager, "registerChangeObserver:context:", v4, PXForYouBadgeManagerObservationContext);
    v10 = v4;
    px_dispatch_on_main_queue_when_idle_after_delay();

  }
  return v4;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id location;

  v6 = a4;
  v9 = a3;
  if ((void *)PXForYouBadgeManagerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListActivityItemDataSectionManager.m"), 50, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if ((v6 & 1) != 0)
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v12, &location);
    px_dispatch_on_main_queue();
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)_updateSharedAlbumBadges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PXNavigationListActivityItemDataSectionManager badgeManager](self, "badgeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "unreadBadgeCount");

  -[PXDataSectionManager outlineObject](self, "outlineObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "copyWithZone:", 0);

  if (v4)
  {
    PLSharedCountFormatter();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromNumber:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "setBadgeString:", v4);
  -[PXDataSectionManager setOutlineObject:](self, "setOutlineObject:", v9);
  objc_msgSend(off_1E50B1608, "changeDetailsWithChangedIndexRange:", 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDataSectionManager updateDataSectionWithChangeDetails:](self, "updateDataSectionWithChangeDetails:", v8);

}

- (PXForYouBadgeManager)badgeManager
{
  return self->_badgeManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeManager, 0);
}

void __79__PXNavigationListActivityItemDataSectionManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSharedAlbumBadges");

}

uint64_t __63__PXNavigationListActivityItemDataSectionManager_initWithItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "startListeningForChanges");
}

@end
