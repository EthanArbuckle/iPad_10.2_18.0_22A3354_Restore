@implementation PUPhotosGridBarsHelper

- (PUPhotosGridBarsHelper)init
{
  PUPhotosGridBarsHelper *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPhotosGridBarsHelper;
  v2 = -[PUPhotosGridBarsHelper init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.PUPhotosGridBarsHelper", v3);
    queue = v2->__queue;
    v2->__queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[PUPhotosGridBarsHelper _invalidatePhotoSelectionManager](self, "_invalidatePhotoSelectionManager");
    v5 = obj;
  }

}

- (void)setSwipeSelecting:(BOOL)a3
{
  if (self->_swipeSelecting != a3)
  {
    self->_swipeSelecting = a3;
    -[PUPhotosGridBarsHelper _invalidateShouldUpdateBarItemsLazily](self, "_invalidateShouldUpdateBarItemsLazily");
  }
}

- (NSString)title
{
  -[PUPhotosGridBarsHelper _updateIfNeeded](self, "_updateIfNeeded");
  return self->_title;
}

- (NSString)prompt
{
  -[PUPhotosGridBarsHelper _updateIfNeeded](self, "_updateIfNeeded");
  return self->_prompt;
}

- (BOOL)shouldHideBackButton
{
  -[PUPhotosGridBarsHelper _updateIfNeeded](self, "_updateIfNeeded");
  return self->_shouldHideBackButton;
}

- (NSArray)leftBarButtonItems
{
  -[PUPhotosGridBarsHelper _updateIfNeeded](self, "_updateIfNeeded");
  return self->_leftBarButtonItems;
}

- (NSArray)rightBarButtonItems
{
  -[PUPhotosGridBarsHelper _updateIfNeeded](self, "_updateIfNeeded");
  return self->_rightBarButtonItems;
}

- (void)_setPhotoSelectionManager:(id)a3
{
  PUPhotoSelectionManager *v5;
  PUPhotoSelectionManager *photoSelectionManager;
  PUPhotoSelectionManager *v7;

  v5 = (PUPhotoSelectionManager *)a3;
  photoSelectionManager = self->__photoSelectionManager;
  if (photoSelectionManager != v5)
  {
    v7 = v5;
    -[PUPhotoSelectionManager unregisterChangeObserver:](photoSelectionManager, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->__photoSelectionManager, a3);
    -[PUPhotoSelectionManager registerChangeObserver:](self->__photoSelectionManager, "registerChangeObserver:", self);
    -[PUPhotosGridBarsHelper _invalidateBarItems](self, "_invalidateBarItems");
    v5 = v7;
  }

}

- (void)_setShouldUpdateBarItemsLazily:(BOOL)a3
{
  if (self->__shouldUpdateBarItemsLazily != a3)
  {
    self->__shouldUpdateBarItemsLazily = a3;
    if (!a3)
    {
      -[PUPhotosGridBarsHelper _notifyBarItemsDidChange](self, "_notifyBarItemsDidChange");
      -[PUPhotosGridBarsHelper _stopUpdatingItemsWithCount](self, "_stopUpdatingItemsWithCount");
      -[PUPhotosGridBarsHelper _invalidateBarItems](self, "_invalidateBarItems");
    }
  }
}

- (void)_notifyBarItemsDidChange
{
  id v3;

  -[PUPhotosGridBarsHelper delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photosGridBarsHelper:didChange:", self, 1);

}

- (void)_updateIfNeeded
{
  BOOL isPerformingUpdates;

  if (-[PUPhotosGridBarsHelper _needsUpdate](self, "_needsUpdate"))
  {
    isPerformingUpdates = self->_isPerformingUpdates;
    self->_isPerformingUpdates = 1;
    -[PUPhotosGridBarsHelper _updatePhotoSelectionManagerIfNeeded](self, "_updatePhotoSelectionManagerIfNeeded");
    -[PUPhotosGridBarsHelper _updateShouldUpdateBarItemsLazilyIfNeeded](self, "_updateShouldUpdateBarItemsLazilyIfNeeded");
    -[PUPhotosGridBarsHelper _updateBarItemsIfNeeded](self, "_updateBarItemsIfNeeded");
    self->_isPerformingUpdates = isPerformingUpdates;
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.photoSelectionManager
      || self->_needsUpdateFlags.shouldUpdateBarItemsLazily
      || self->_needsUpdateFlags.barItems;
}

- (void)_invalidatePhotoSelectionManager
{
  self->_needsUpdateFlags.photoSelectionManager = 1;
  -[PUPhotosGridBarsHelper _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updatePhotoSelectionManagerIfNeeded
{
  void *v3;
  id v4;

  if (self->_needsUpdateFlags.photoSelectionManager)
  {
    self->_needsUpdateFlags.photoSelectionManager = 0;
    -[PUPhotosGridBarsHelper delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photosGridBarsHelperPhotoSelectionManager:", self);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    -[PUPhotosGridBarsHelper _setPhotoSelectionManager:](self, "_setPhotoSelectionManager:", v4);
  }
}

- (void)_invalidateShouldUpdateBarItemsLazily
{
  self->_needsUpdateFlags.shouldUpdateBarItemsLazily = 1;
  -[PUPhotosGridBarsHelper _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateShouldUpdateBarItemsLazilyIfNeeded
{
  if (self->_needsUpdateFlags.shouldUpdateBarItemsLazily)
  {
    self->_needsUpdateFlags.shouldUpdateBarItemsLazily = 0;
    -[PUPhotosGridBarsHelper _setShouldUpdateBarItemsLazily:](self, "_setShouldUpdateBarItemsLazily:", -[PUPhotosGridBarsHelper isSwipeSelecting](self, "isSwipeSelecting"));
  }
}

- (void)_invalidateBarItems
{
  self->_needsUpdateFlags.barItems = 1;
  -[PUPhotosGridBarsHelper _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateBarItemsIfNeeded
{
  if (self->_needsUpdateFlags.barItems)
  {
    self->_needsUpdateFlags.barItems = 0;
    if (-[PUPhotosGridBarsHelper _shouldUpdateBarItemsLazily](self, "_shouldUpdateBarItemsLazily"))
    {
      -[PUPhotosGridBarsHelper _setShouldUpdateItemsWithCount:](self, "_setShouldUpdateItemsWithCount:", 1);
      -[PUPhotosGridBarsHelper _startUpdatingItemsWithCountIfNeeded](self, "_startUpdatingItemsWithCountIfNeeded");
    }
    else
    {
      -[PUPhotosGridBarsHelper _updateAllBarItems](self, "_updateAllBarItems");
    }
  }
}

- (void)_updateAllBarItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;

  v16 = 0;
  -[PUPhotosGridBarsHelper delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = 0;
  v12 = 0;
  v13 = 0;
  -[PUPhotosGridBarsHelper _photoSelectionManager](self, "_photoSelectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photosGridBarsHelper:getTitle:prompt:shouldHideBackButton:leftBarButtonItems:rightBarButtonItems:forPhotoSelectionManager:", self, &v15, &v14, &v16, &v13, &v12, v4);
  v5 = v14;
  v6 = v15;
  v7 = v13;
  v8 = v12;
  v9 = v7;
  v10 = v5;
  v11 = v6;

  -[PUPhotosGridBarsHelper _setTitle:](self, "_setTitle:", v11);
  -[PUPhotosGridBarsHelper _setPrompt:](self, "_setPrompt:", v10);
  -[PUPhotosGridBarsHelper _setShouldHideBackButton:](self, "_setShouldHideBackButton:", v16);
  -[PUPhotosGridBarsHelper _setLeftBarButtonItems:](self, "_setLeftBarButtonItems:", v9);
  -[PUPhotosGridBarsHelper _setRightBarButtonItems:](self, "_setRightBarButtonItems:", v8);

}

- (void)_startUpdatingItemsWithCountIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id location;

  if (-[PUPhotosGridBarsHelper _shouldUpdateItemsWithCount](self, "_shouldUpdateItemsWithCount"))
  {
    if (!-[PUPhotosGridBarsHelper _isUpdatingItemsWithCount](self, "_isUpdatingItemsWithCount"))
    {
      -[PUPhotosGridBarsHelper _setShouldUpdateItemsWithCount:](self, "_setShouldUpdateItemsWithCount:", 0);
      -[PUPhotosGridBarsHelper _setUpdatingItemsWithCount:](self, "_setUpdatingItemsWithCount:", 1);
      -[PUPhotosGridBarsHelper delegate](self, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotosGridBarsHelper _photoSelectionManager](self, "_photoSelectionManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v4, "copy");

      objc_initWeak(&location, self);
      -[PUPhotosGridBarsHelper _queue](self, "_queue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_copyWeak(&v9, &location);
      v7 = v3;
      v8 = v5;
      pl_dispatch_async();

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);

    }
  }
}

- (void)_stopUpdatingItemsWithCount
{
  void *v3;
  id v4;
  id location;

  -[PUPhotosGridBarsHelper _setShouldUpdateItemsWithCount:](self, "_setShouldUpdateItemsWithCount:", 0);
  objc_initWeak(&location, self);
  -[PUPhotosGridBarsHelper _queue](self, "_queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(&v4, &location);
  pl_dispatch_async();

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_updateItemsWithCountInBackgroundWithDelegate:(id)a3 photoSelectionManagerSnapshot:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  uint64_t v9;
  int v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  char v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[PUPhotosGridBarsHelper _hadSelectionOnLastUpdate](self, "_hadSelectionOnLastUpdate");
  v9 = objc_msgSend(v7, "isAnyAssetSelected");
  -[PUPhotosGridBarsHelper _setHadSelectionOnLastUpdate:](self, "_setHadSelectionOnLastUpdate:", v9);
  v10 = v9 & v8;
  if (v10 == 1)
  {
    objc_msgSend(v6, "photosGridBarsHelper:titleForPhotoSelectionManager:", self, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_initWeak(&location, self);
  v12 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v14, &location);
  v13 = v11;
  v15 = v10 ^ 1;
  pl_dispatch_async();

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)_handleItemsWithCountUpdateWithTitle:(id)a3 shouldReloadAllItems:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  if (-[PUPhotosGridBarsHelper _shouldUpdateBarItemsLazily](self, "_shouldUpdateBarItemsLazily"))
  {
    if (v4)
      -[PUPhotosGridBarsHelper _updateAllBarItems](self, "_updateAllBarItems");
    else
      -[PUPhotosGridBarsHelper _setTitle:](self, "_setTitle:", v6);
    -[PUPhotosGridBarsHelper _notifyBarItemsDidChange](self, "_notifyBarItemsDidChange");
  }
  -[PUPhotosGridBarsHelper _setUpdatingItemsWithCount:](self, "_setUpdatingItemsWithCount:", 0);
  -[PUPhotosGridBarsHelper _startUpdatingItemsWithCountIfNeeded](self, "_startUpdatingItemsWithCountIfNeeded");

}

- (PUPhotosGridBarsHelperDelegate)delegate
{
  return (PUPhotosGridBarsHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isSwipeSelecting
{
  return self->_swipeSelecting;
}

- (void)_setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_setPrompt:(id)a3
{
  objc_storeStrong((id *)&self->_prompt, a3);
}

- (void)_setShouldHideBackButton:(BOOL)a3
{
  self->_shouldHideBackButton = a3;
}

- (void)_setLeftBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_leftBarButtonItems, a3);
}

- (void)_setRightBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_rightBarButtonItems, a3);
}

- (PUPhotoSelectionManager)_photoSelectionManager
{
  return self->__photoSelectionManager;
}

- (BOOL)_shouldUpdateBarItemsLazily
{
  return self->__shouldUpdateBarItemsLazily;
}

- (BOOL)_isUpdatingItemsWithCount
{
  return self->__updatingItemsWithCount;
}

- (void)_setUpdatingItemsWithCount:(BOOL)a3
{
  self->__updatingItemsWithCount = a3;
}

- (BOOL)_shouldUpdateItemsWithCount
{
  return self->__shouldUpdateItemsWithCount;
}

- (void)_setShouldUpdateItemsWithCount:(BOOL)a3
{
  self->__shouldUpdateItemsWithCount = a3;
}

- (OS_dispatch_queue)_queue
{
  return self->__queue;
}

- (BOOL)_hadSelectionOnLastUpdate
{
  return self->__hadSelectionOnLastUpdate;
}

- (void)_setHadSelectionOnLastUpdate:(BOOL)a3
{
  self->__hadSelectionOnLastUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__queue, 0);
  objc_storeStrong((id *)&self->__photoSelectionManager, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __102__PUPhotosGridBarsHelper__updateItemsWithCountInBackgroundWithDelegate_photoSelectionManagerSnapshot___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleItemsWithCountUpdateWithTitle:shouldReloadAllItems:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

void __53__PUPhotosGridBarsHelper__stopUpdatingItemsWithCount__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setHadSelectionOnLastUpdate:", 0);

}

void __62__PUPhotosGridBarsHelper__startUpdatingItemsWithCountIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_updateItemsWithCountInBackgroundWithDelegate:photoSelectionManagerSnapshot:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
