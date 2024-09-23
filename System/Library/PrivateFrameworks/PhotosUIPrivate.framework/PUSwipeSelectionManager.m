@implementation PUSwipeSelectionManager

- (PUSwipeSelectionManager)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Must use initWithStartingIndexPath:mode:photoSelectionManager:"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (PUSwipeSelectionManager)initWithSelectionMode:(int64_t)a3 photoSelectionManager:(id)a4
{
  id v6;
  PUSwipeSelectionManager *v7;
  PUSwipeSelectionManager *v8;
  uint64_t v9;
  PUPhotoSelectionManager *restorePhotoSelectionManager;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUSwipeSelectionManager;
  v7 = -[PUSwipeSelectionManager init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->__selectionMode = a3;
    v9 = objc_msgSend(v6, "copy");
    restorePhotoSelectionManager = v8->__restorePhotoSelectionManager;
    v8->__restorePhotoSelectionManager = (PUPhotoSelectionManager *)v9;

  }
  return v8;
}

- (void)dealloc
{
  PXUIAutoScroller *selectionAutoScroller;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  selectionAutoScroller = self->_selectionAutoScroller;
  if (selectionAutoScroller)
    -[PXUIAutoScroller stop](selectionAutoScroller, "stop");
  -[PUSwipeSelectionManager _pausingChangesToken](self, "_pausingChangesToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSwipeSelectionManager _pausingChangesToken](self, "_pausingChangesToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_endPausingChanges:", v6);

    -[PUSwipeSelectionManager _setPausingChangesToken:](self, "_setPausingChangesToken:", 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)PUSwipeSelectionManager;
  -[PUSwipeSelectionManager dealloc](&v7, sel_dealloc);
}

- (id)_indexesPathsRangeForIndexPath:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  id v32;
  SEL v33;

  v5 = a3;
  -[PUSwipeSelectionManager _startingIndexPath](self, "_startingIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSwipeSelectionManager.m"), 68, CFSTR("Starting indexPath should be set"));

  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PUSwipeSelectionManager _startingIndexPath](self, "_startingIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "compare:", v5);

  if (v9 == 1)
  {
    v33 = a2;
    v11 = objc_msgSend(v5, "section");
    v13 = objc_msgSend(v5, "item");
    -[PUSwipeSelectionManager _startingIndexPath](self, "_startingIndexPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v16, "section");

    -[PUSwipeSelectionManager _startingIndexPath](self, "_startingIndexPath");
    v17 = v5;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v18, "item");

    v5 = v17;
  }
  else
  {
    if (v9 && v9 != -1)
    {
      v11 = 0;
      v13 = 0;
      v15 = 0;
      goto LABEL_21;
    }
    v33 = a2;
    -[PUSwipeSelectionManager _startingIndexPath](self, "_startingIndexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "section");

    -[PUSwipeSelectionManager _startingIndexPath](self, "_startingIndexPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "item");

    v14 = objc_msgSend(v5, "section");
    v15 = objc_msgSend(v5, "item");
  }
  if (v11 >= v14)
  {
    if (v11 == v14)
    {
      v11 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", v33, self, CFSTR("PUSwipeSelectionManager.m"), 109, CFSTR("Must be same section"));

    }
  }
  else
  {
    v32 = v5;
    do
    {
      -[PUSwipeSelectionManager datasource](self, "datasource", v32);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", v33, self, CFSTR("PUSwipeSelectionManager.m"), 98, CFSTR("Datasource should be set"));

      }
      -[PUSwipeSelectionManager datasource](self, "datasource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "swipeSelectionManager:numberOfItemsInSection:", self, v11);

      if (v21)
      {
        v22 = v21 < v13;
        v23 = v21 - v13;
        if (!v22)
        {
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", v13, v23);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, v25);

        }
      }
      v13 = 0;
      ++v11;
    }
    while (v14 != v11);
    v11 = v14;
    v5 = v32;
  }
LABEL_21:
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", v13, v15 - v13 + 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, v28);

  return v7;
}

- (int64_t)_selectionModeForRestoringStateOfIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  -[PUSwipeSelectionManager datasource](self, "datasource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "swipeSelectionManager:photoCollectionAtIndex:", self, objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUSwipeSelectionManager _restorePhotoSelectionManager](self, "_restorePhotoSelectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "item");

  LODWORD(v4) = objc_msgSend(v7, "isAssetAtIndexSelected:inAssetCollection:", v8, v6);
  return v4 ^ 1;
}

- (void)beginSelectionFromIndexPath:(id)a3
{
  void *v4;
  id v5;

  -[PUSwipeSelectionManager _setStartingIndexPath:](self, "_setStartingIndexPath:", a3);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_beginPausingChangesWithTimeout:identifier:", CFSTR("PUSwipeSelectionManager"), 60.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSwipeSelectionManager _setPausingChangesToken:](self, "_setPausingChangesToken:", v4);

}

- (void)endSelection
{
  PXUIAutoScroller *selectionAutoScroller;
  void *v4;
  void *v5;
  id v6;

  selectionAutoScroller = self->_selectionAutoScroller;
  if (selectionAutoScroller)
    -[PXUIAutoScroller stop](selectionAutoScroller, "stop");
  -[PUSwipeSelectionManager _pausingChangesToken](self, "_pausingChangesToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PUSwipeSelectionManager _pausingChangesToken](self, "_pausingChangesToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_endPausingChanges:", v5);

    -[PUSwipeSelectionManager _setPausingChangesToken:](self, "_setPausingChangesToken:", 0);
  }
}

- (void)updateSelectionWithCurrentIndexPath:(id)a3 leftClosestIndexPath:(id)a4 aboveClosestIndexPath:(id)a5
{
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSMutableDictionary *oldIndexesPaths;
  uint64_t v17;
  NSMutableDictionary *v18;
  id v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  _QWORD v32[6];
  _QWORD v33[5];
  _QWORD v34[4];
  NSMutableDictionary *v35;
  PUSwipeSelectionManager *v36;
  id v37;
  SEL v38;

  v31 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = a5;
  -[PUSwipeSelectionManager _startingIndexPath](self, "_startingIndexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSwipeSelectionManager.m"), 148, CFSTR("Starting indexPath should be set"));

  }
  if (v31 | v9 || v10)
  {
    if (v31 | v9)
    {
      if (v31)
        v12 = (void *)v31;
      else
        v12 = (void *)v9;
      v13 = v12;
LABEL_10:
      -[PUSwipeSelectionManager _indexesPathsRangeForIndexPath:](self, "_indexesPathsRangeForIndexPath:", v13, v31);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      oldIndexesPaths = self->_oldIndexesPaths;
      v17 = MEMORY[0x1E0C809B0];
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __106__PUSwipeSelectionManager_updateSelectionWithCurrentIndexPath_leftClosestIndexPath_aboveClosestIndexPath___block_invoke;
      v34[3] = &unk_1E58A8430;
      v18 = v14;
      v35 = v18;
      v36 = self;
      v37 = v15;
      v38 = a2;
      v19 = v15;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](oldIndexesPaths, "enumerateKeysAndObjectsUsingBlock:", v34);
      v20 = self->_oldIndexesPaths;
      self->_oldIndexesPaths = v18;
      v21 = v18;

      v33[0] = v17;
      v33[1] = 3221225472;
      v33[2] = __106__PUSwipeSelectionManager_updateSelectionWithCurrentIndexPath_leftClosestIndexPath_aboveClosestIndexPath___block_invoke_3;
      v33[3] = &unk_1E58A8458;
      v33[4] = self;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v21, "enumerateKeysAndObjectsUsingBlock:", v33);
      v32[0] = v17;
      v32[1] = 3221225472;
      v32[2] = __106__PUSwipeSelectionManager_updateSelectionWithCurrentIndexPath_leftClosestIndexPath_aboveClosestIndexPath___block_invoke_4;
      v32[3] = &unk_1E58A8480;
      v32[4] = self;
      v32[5] = -[PUSwipeSelectionManager _selectionMode](self, "_selectionMode") == 0;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v32);

      goto LABEL_19;
    }
    if (!v10)
      goto LABEL_19;
    -[PUSwipeSelectionManager _startingIndexPath](self, "_startingIndexPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "compare:", v10);

    if (v23 != 1)
    {
      if (v23 != -1)
        goto LABEL_19;
      v24 = objc_msgSend(v10, "copy");
      goto LABEL_18;
    }
    v25 = objc_msgSend(v10, "section");
    -[PUSwipeSelectionManager _startingIndexPath](self, "_startingIndexPath");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "section");

    if (v25 < v27)
    {
      -[PUSwipeSelectionManager datasource](self, "datasource");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "swipeSelectionManager:numberOfItemsInSection:", self, objc_msgSend(v10, "section") + 1);

      if (v29 >= 1)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, objc_msgSend(v10, "section") + 1);
        v24 = objc_claimAutoreleasedReturnValue();
LABEL_18:
        v13 = (id)v24;
        if (!v24)
          goto LABEL_19;
        goto LABEL_10;
      }
    }
  }
LABEL_19:

}

- (PUSwipeSelectionManagerDelegate)delegate
{
  return (PUSwipeSelectionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PUSwipeSelectionManagerDataSource)datasource
{
  return (PUSwipeSelectionManagerDataSource *)objc_loadWeakRetained((id *)&self->_datasource);
}

- (void)setDatasource:(id)a3
{
  objc_storeWeak((id *)&self->_datasource, a3);
}

- (PXUIAutoScroller)selectionAutoScroller
{
  return self->_selectionAutoScroller;
}

- (void)setSelectionAutoScroller:(id)a3
{
  objc_storeStrong((id *)&self->_selectionAutoScroller, a3);
}

- (CGPoint)screenTouchLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_screenTouchLocation.x;
  y = self->_screenTouchLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setScreenTouchLocation:(CGPoint)a3
{
  self->_screenTouchLocation = a3;
}

- (int64_t)_selectionMode
{
  return self->__selectionMode;
}

- (void)_setSelectionMode:(int64_t)a3
{
  self->__selectionMode = a3;
}

- (NSIndexPath)_startingIndexPath
{
  return self->__startingIndexPath;
}

- (void)_setStartingIndexPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (PUPhotoSelectionManager)_restorePhotoSelectionManager
{
  return self->__restorePhotoSelectionManager;
}

- (void)_setRestorePhotoSelectionManager:(id)a3
{
  objc_storeStrong((id *)&self->__restorePhotoSelectionManager, a3);
}

- (id)_pausingChangesToken
{
  return self->__pausingChangesToken;
}

- (void)_setPausingChangesToken:(id)a3
{
  objc_storeStrong(&self->__pausingChangesToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__pausingChangesToken, 0);
  objc_storeStrong((id *)&self->__restorePhotoSelectionManager, 0);
  objc_storeStrong((id *)&self->__startingIndexPath, 0);
  objc_storeStrong((id *)&self->_selectionAutoScroller, 0);
  objc_destroyWeak((id *)&self->_datasource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_oldIndexesPaths, 0);
}

void __106__PUSwipeSelectionManager_updateSelectionWithCurrentIndexPath_leftClosestIndexPath_aboveClosestIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9[2];
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  __int128 v14;

  v5 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __106__PUSwipeSelectionManager_updateSelectionWithCurrentIndexPath_leftClosestIndexPath_aboveClosestIndexPath___block_invoke_2;
  v10[3] = &unk_1E58A8408;
  v11 = v5;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v12 = v6;
  v13 = v7;
  *(_OWORD *)v9 = *(_OWORD *)(a1 + 48);
  v8 = v9[0];
  v14 = *(_OWORD *)v9;
  v9[0] = v5;
  objc_msgSend(a3, "enumerateIndexesUsingBlock:", v10);

}

void __106__PUSwipeSelectionManager_updateSelectionWithCurrentIndexPath_leftClosestIndexPath_aboveClosestIndexPath___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "swipeSelectionManager:updatePhotoSelectionWithIndexes:inSection:selectionMode:", *(_QWORD *)(a1 + 32), v5, v6, objc_msgSend(*(id *)(a1 + 32), "_selectionMode"));

}

void __106__PUSwipeSelectionManager_updateSelectionWithCurrentIndexPath_leftClosestIndexPath_aboveClosestIndexPath___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "swipeSelectionManager:updatePhotoSelectionWithIndexes:inSection:selectionMode:", *(_QWORD *)(a1 + 32), v5, v6, *(_QWORD *)(a1 + 40));

}

void __106__PUSwipeSelectionManager_updateSelectionWithCurrentIndexPath_leftClosestIndexPath_aboveClosestIndexPath___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, objc_msgSend(*(id *)(a1 + 32), "integerValue"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "pu_containsIndexPath:") & 1) == 0)
  {
    v3 = objc_msgSend(v13, "item");
    objc_msgSend(*(id *)(a1 + 48), "datasource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "swipeSelectionManager:numberOfItemsInSection:", *(_QWORD *)(a1 + 48), objc_msgSend(v13, "section"));

    if (v3 >= v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), CFSTR("PUSwipeSelectionManager.m"), 188, CFSTR("IndexPath should still be valid"));

    }
    v6 = objc_msgSend(*(id *)(a1 + 48), "_selectionModeForRestoringStateOfIndexPath:", v13);
    if (v6 != objc_msgSend(*(id *)(a1 + 48), "_selectionMode"))
    {
      v7 = *(void **)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "section"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v9, "addIndex:", objc_msgSend(v13, "item"));
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", objc_msgSend(v13, "item"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 56);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "section"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

      }
    }
  }

}

@end
