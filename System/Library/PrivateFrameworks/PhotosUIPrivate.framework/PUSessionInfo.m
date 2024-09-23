@implementation PUSessionInfo

- (PUSessionInfo)init
{
  PUSessionInfo *v2;
  uint64_t v3;
  NSPointerArray *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUSessionInfo;
  v2 = -[PUSessionInfo init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSPointerArray *)v3;

    v2->_allowsSwipeToSelect = 1;
    -[PUSessionInfo setBannerGenerator:](v2, "setBannerGenerator:", 0);
  }
  return v2;
}

- (BOOL)isSelectingAssets
{
  return 0;
}

- (void)addSessionInfoObserver:(id)a3
{
  -[NSPointerArray addPointer:](self->_observers, "addPointer:", a3);
}

- (void)removeSessionInfoObserver:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (-[NSPointerArray count](self->_observers, "count"))
  {
    v4 = 0;
    while (-[NSPointerArray pointerAtIndex:](self->_observers, "pointerAtIndex:", v4) != v5)
    {
      if (++v4 >= -[NSPointerArray count](self->_observers, "count"))
        goto LABEL_7;
    }
    -[NSPointerArray removePointerAtIndex:](self->_observers, "removePointerAtIndex:", v4);
  }
LABEL_7:

}

- (void)setStatus:(int64_t)a3
{
  uint64_t v3;
  _QWORD v4[5];

  if (self->_status != a3)
  {
    v3 = MEMORY[0x1E0C809B0];
    self->_status = a3;
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __27__PUSessionInfo_setStatus___block_invoke;
    v4[3] = &unk_1E58A7FD8;
    v4[4] = self;
    -[PUSessionInfo _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v4);
  }
}

- (void)setPhotoSelectionManager:(id)a3
{
  PUPhotoSelectionManager *v5;
  PUPhotoSelectionManager *photoSelectionManager;
  PUPhotoSelectionManager *v7;

  v5 = (PUPhotoSelectionManager *)a3;
  photoSelectionManager = self->_photoSelectionManager;
  if (photoSelectionManager != v5)
  {
    v7 = v5;
    -[PUPhotoSelectionManager unregisterChangeObserver:](photoSelectionManager, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_photoSelectionManager, a3);
    -[PUPhotoSelectionManager registerChangeObserver:](self->_photoSelectionManager, "registerChangeObserver:", self);
    v5 = v7;
  }

}

- (void)_enumerateObserversWithBlock:(id)a3
{
  unint64_t v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  if (-[NSPointerArray count](self->_observers, "count"))
  {
    v4 = 0;
    do
    {
      -[NSPointerArray pointerAtIndex:](self->_observers, "pointerAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v5);

      ++v4;
    }
    while (v4 < -[NSPointerArray count](self->_observers, "count"));
  }

}

- (void)setBannerGenerator:(id)a3
{
  id v4;
  void *v5;
  id bannerGenerator;
  id v7;

  v4 = a3;
  if (!v4)
  {
    v7 = 0;
    v4 = &__block_literal_global_86412;
    goto LABEL_5;
  }
  if (self->_bannerGenerator != v4)
  {
    v7 = v4;
LABEL_5:
    v5 = (void *)objc_msgSend(v4, "copy");
    bannerGenerator = self->_bannerGenerator;
    self->_bannerGenerator = v5;

    v4 = v7;
  }

}

- (void)photoSelectionManagerSelectionDidChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__PUSessionInfo_photoSelectionManagerSelectionDidChange___block_invoke;
  v3[3] = &unk_1E58A7FD8;
  v3[4] = self;
  -[PUSessionInfo _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v3);
}

- (int64_t)status
{
  return self->_status;
}

- (BOOL)allowSelectingNonEditableAlbums
{
  return self->_allowSelectingNonEditableAlbums;
}

- (void)setAllowSelectingNonEditableAlbums:(BOOL)a3
{
  self->_allowSelectingNonEditableAlbums = a3;
}

- (BOOL)isSelectingTargetAlbum
{
  return self->_selectingTargetAlbum;
}

- (void)setSelectingTargetAlbum:(BOOL)a3
{
  self->_selectingTargetAlbum = a3;
}

- (PUPhotoSelectionManager)photoSelectionManager
{
  return self->_photoSelectionManager;
}

- (PHAssetCollection)sourceAlbum
{
  return self->_sourceAlbum;
}

- (void)setSourceAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_sourceAlbum, a3);
}

- (BOOL)showCheckmarkOnSourceAlbum
{
  return self->_showCheckmarkOnSourceAlbum;
}

- (void)setShowCheckmarkOnSourceAlbum:(BOOL)a3
{
  self->_showCheckmarkOnSourceAlbum = a3;
}

- (BOOL)scrollToSourceAlbumWhenPresented
{
  return self->_scrollToSourceAlbumWhenPresented;
}

- (void)setScrollToSourceAlbumWhenPresented:(BOOL)a3
{
  self->_scrollToSourceAlbumWhenPresented = a3;
}

- (NSOrderedSet)transferredAssets
{
  return self->_transferredAssets;
}

- (void)setTransferredAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (PHAssetCollection)targetAlbum
{
  return self->_targetAlbum;
}

- (void)setTargetAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_targetAlbum, a3);
}

- (NSString)targetAlbumName
{
  return self->_targetAlbumName;
}

- (void)setTargetAlbumName:(id)a3
{
  objc_storeStrong((id *)&self->_targetAlbumName, a3);
}

- (NSPredicate)assetsFilterPredicate
{
  return self->_assetsFilterPredicate;
}

- (void)setAssetsFilterPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_assetsFilterPredicate, a3);
}

- (unint64_t)assetTypesToInclude
{
  return self->_assetTypesToInclude;
}

- (void)setAssetTypesToInclude:(unint64_t)a3
{
  self->_assetTypesToInclude = a3;
}

- (NSString)localizedPrompt
{
  return self->_localizedPrompt;
}

- (void)setLocalizedPrompt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)promptLocation
{
  return self->_promptLocation;
}

- (void)setPromptLocation:(int64_t)a3
{
  self->_promptLocation = a3;
}

- (id)bannerGenerator
{
  return self->_bannerGenerator;
}

- (BOOL)wantsNumberedSelectionStyle
{
  return self->_wantsNumberedSelectionStyle;
}

- (void)setWantsNumberedSelectionStyle:(BOOL)a3
{
  self->_wantsNumberedSelectionStyle = a3;
}

- (int64_t)noContentPlaceholderType
{
  return self->_noContentPlaceholderType;
}

- (void)setNoContentPlaceholderType:(int64_t)a3
{
  self->_noContentPlaceholderType = a3;
}

- (BOOL)allowsMultipleSelection
{
  return self->_allowsMultipleSelection;
}

- (void)setAllowsMultipleSelection:(BOOL)a3
{
  self->_allowsMultipleSelection = a3;
}

- (BOOL)showsFileSizePicker
{
  return self->_showsFileSizePicker;
}

- (void)setShowsFileSizePicker:(BOOL)a3
{
  self->_showsFileSizePicker = a3;
}

- (BOOL)hasClearBackgroundColor
{
  return self->_hasClearBackgroundColor;
}

- (void)setHasClearBackgroundColor:(BOOL)a3
{
  self->_hasClearBackgroundColor = a3;
}

- (BOOL)allowsSwipeToSelect
{
  return self->_allowsSwipeToSelect;
}

- (void)setAllowsSwipeToSelect:(BOOL)a3
{
  self->_allowsSwipeToSelect = a3;
}

- (BOOL)excludesSharedAlbums
{
  return self->_excludesSharedAlbums;
}

- (void)setExcludesSharedAlbums:(BOOL)a3
{
  self->_excludesSharedAlbums = a3;
}

- (BOOL)excludesHiddenAlbum
{
  return self->_excludesHiddenAlbum;
}

- (void)setExcludesHiddenAlbum:(BOOL)a3
{
  self->_excludesHiddenAlbum = a3;
}

- (BOOL)excludesNewAlbumCreation
{
  return self->_excludesNewAlbumCreation;
}

- (void)setExcludesNewAlbumCreation:(BOOL)a3
{
  self->_excludesNewAlbumCreation = a3;
}

- (BOOL)reverseSortOrder
{
  return self->_reverseSortOrder;
}

- (void)setReverseSortOrder:(BOOL)a3
{
  self->_reverseSortOrder = a3;
}

- (int64_t)contentStartingPosition
{
  return self->_contentStartingPosition;
}

- (void)setContentStartingPosition:(int64_t)a3
{
  self->_contentStartingPosition = a3;
}

- (BOOL)isForAssetPicker
{
  return self->_isForAssetPicker;
}

- (BOOL)isLimitedLibraryPicker
{
  return self->_isLimitedLibraryPicker;
}

- (BOOL)isForAlbumPicker
{
  return self->_isForAlbumPicker;
}

- (PXPhotosViewDelegate)photosViewDelegate
{
  return (PXPhotosViewDelegate *)objc_loadWeakRetained((id *)&self->_photosViewDelegate);
}

- (void)setPhotosViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_photosViewDelegate, a3);
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (void)setLoadingStatusManager:(id)a3
{
  objc_storeStrong((id *)&self->_loadingStatusManager, a3);
}

- (PXSelectionCoordinator)selectionCoordinator
{
  return self->_selectionCoordinator;
}

- (void)setSelectionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_selectionCoordinator, a3);
}

- (NSString)pickerClientBundleIdentifier
{
  return self->_pickerClientBundleIdentifier;
}

- (void)setPickerClientBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerClientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_selectionCoordinator, 0);
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_destroyWeak((id *)&self->_photosViewDelegate);
  objc_storeStrong(&self->_bannerGenerator, 0);
  objc_storeStrong((id *)&self->_localizedPrompt, 0);
  objc_storeStrong((id *)&self->_assetsFilterPredicate, 0);
  objc_storeStrong((id *)&self->_targetAlbumName, 0);
  objc_storeStrong((id *)&self->_targetAlbum, 0);
  objc_storeStrong((id *)&self->_transferredAssets, 0);
  objc_storeStrong((id *)&self->_sourceAlbum, 0);
  objc_storeStrong((id *)&self->_photoSelectionManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __57__PUSessionInfo_photoSelectionManagerSelectionDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sessionInfoPhotoSelectionDidChange:", *(_QWORD *)(a1 + 32));

}

uint64_t __36__PUSessionInfo_setBannerGenerator___block_invoke()
{
  return 0;
}

void __27__PUSessionInfo_setStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sessionInfoStatusDidChange:", *(_QWORD *)(a1 + 32));

}

- (BOOL)hasTargetAlbum
{
  void *v3;
  BOOL v4;
  void *v5;

  -[PUSessionInfo targetAlbum](self, "targetAlbum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[PUSessionInfo targetAlbumName](self, "targetAlbumName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)hasLocalTargetAlbum
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[PUSessionInfo targetAlbum](self, "targetAlbum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUSessionInfo targetAlbum](self, "targetAlbum");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v4, "isCloudSharedAlbum") ^ 1;
  }
  else
  {
    -[PUSessionInfo targetAlbumName](self, "targetAlbumName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;
  }

  return v5;
}

@end
