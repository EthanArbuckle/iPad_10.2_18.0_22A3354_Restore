@implementation ISScrollViewVitalityController

- (NSHashTable)_playerViews
{
  return self->__playerViews;
}

- (BOOL)hasTargetContentOffset
{
  return self->_hasTargetContentOffset;
}

- (CGPoint)targetContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_targetContentOffset.x;
  y = self->_targetContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)canPerformVitality
{
  return 1;
}

- (BOOL)isDecelerating
{
  return self->_decelerating;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isScrolling
{
  return self->_scrolling;
}

- (ISScrollViewVitalityController)init
{
  ISScrollViewVitalityController *v2;
  uint64_t v3;
  NSHashTable *playerViews;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISScrollViewVitalityController;
  v2 = -[ISScrollViewVitalityController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    playerViews = v2->__playerViews;
    v2->__playerViews = (NSHashTable *)v3;

    v2->_enabled = 1;
  }
  return v2;
}

void __56__ISScrollViewVitalityController__updateVitalityFilters__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v23 = 0;
        v21 = 0;
        v22 = 0;
        objc_msgSend(v3, "getVisibility:offset:targetVisibilityOffset:forView:", &v23, &v22, &v21, v9);
        objc_msgSend(v9, "livePhotoPlayer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "vitalityFilter");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (id)v11;
        if (*(_BYTE *)(a1 + 56))
        {
          if (!v11)
          {
            v12 = (id)objc_msgSend(*(id *)(a1 + 40), "_newVitalityFilter");
            objc_msgSend(v10, "setVitalityFilter:", v12);
          }
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __56__ISScrollViewVitalityController__updateVitalityFilters__block_invoke_2;
          v13[3] = &unk_1E9453CA8;
          v12 = v12;
          v14 = v12;
          v18 = v23;
          v19 = *(_BYTE *)(a1 + 57);
          v16 = v22;
          v17 = v21;
          v15 = *(id *)(a1 + 48);
          v20 = *(_WORD *)(a1 + 58);
          objc_msgSend(v12, "performInputChanges:", v13);

        }
        else
        {
          objc_msgSend(v10, "setVitalityFilter:", 0);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

}

- (void)setScrolling:(BOOL)a3
{
  self->_scrolling = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityOffsetHelper, 0);
  objc_storeStrong((id *)&self->_estimatedScrollEndDate, 0);
  objc_storeStrong((id *)&self->__playerViews, 0);
  objc_destroyWeak((id *)&self->__scrollView);
}

- (void)setEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_enabled != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __45__ISScrollViewVitalityController_setEnabled___block_invoke;
    v3[3] = &unk_1E9454270;
    v3[4] = self;
    v4 = a3;
    -[ISScrollViewVitalityController performChanges:](self, "performChanges:", v3);
  }
}

- (void)addPlayerView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ISScrollViewVitalityController _playerViews](self, "_playerViews");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removePlayerView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ISScrollViewVitalityController _playerViews](self, "_playerViews");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)didLayoutPlayerViews
{
  -[ISScrollViewVitalityController performChanges:](self, "performChanges:", 0);
}

- (void)performChanges:(id)a3
{
  _BOOL8 v4;
  void (**v5)(_QWORD);

  v5 = (void (**)(_QWORD))a3;
  v4 = -[ISScrollViewVitalityController _isPerformingChanges](self, "_isPerformingChanges");
  -[ISScrollViewVitalityController _setPerformingChanges:](self, "_setPerformingChanges:", 1);
  if (v5)
    v5[2](v5);
  -[ISScrollViewVitalityController _setPerformingChanges:](self, "_setPerformingChanges:", v4);
  if (!v4)
    -[ISScrollViewVitalityController _updateVitalityFilters](self, "_updateVitalityFilters");

}

- (void)setDecelerating:(BOOL)a3
{
  self->_decelerating = a3;
}

- (void)setHasTargetContentOffset:(BOOL)a3
{
  self->_hasTargetContentOffset = a3;
}

- (void)setTargetContentOffset:(CGPoint)a3
{
  self->_targetContentOffset = a3;
}

- (void)setEstimatedScrollEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_estimatedScrollEndDate, a3);
}

- (void)canPerformVitalityDidChange
{
  -[ISScrollViewVitalityController performChanges:](self, "performChanges:", &__block_literal_global_2539);
}

- (id)_newVitalityFilter
{
  void *v2;
  void *v3;
  ISLivePhotoAutoplayVitalityFilter *v4;

  +[ISVitalitySettings sharedInstance](ISVitalitySettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oneUpSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[ISLivePhotoVitalityFilter initWithSettings:]([ISLivePhotoAutoplayVitalityFilter alloc], "initWithSettings:", v3);
  return v4;
}

- (void)_updateVitalityFilters
{
  void *v3;
  BOOL v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  ISScrollViewVitalityController *v20;
  id v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;

  -[ISScrollViewVitalityController _scrollView](self, "_scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ISScrollViewVitalityController isScrolling](self, "isScrolling");
  v5 = -[ISScrollViewVitalityController isDecelerating](self, "isDecelerating");
  -[ISScrollViewVitalityController targetContentOffset](self, "targetContentOffset");
  v7 = v6;
  v9 = v8;
  -[ISScrollViewVitalityController estimatedScrollEndDate](self, "estimatedScrollEndDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ISScrollViewVitalityController hasTargetContentOffset](self, "hasTargetContentOffset");
  -[ISScrollViewVitalityController _playerViews](self, "_playerViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ISScrollViewVitalityController canPerformVitality](self, "canPerformVitality"))
    v14 = -[ISScrollViewVitalityController isEnabled](self, "isEnabled");
  else
    v14 = 0;
  -[ISScrollViewVitalityController visibilityOffsetHelper](self, "visibilityOffsetHelper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDirection:", 1);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __56__ISScrollViewVitalityController__updateVitalityFilters__block_invoke;
  v18[3] = &unk_1E9453CD0;
  v22 = v14;
  v19 = v13;
  v20 = self;
  v23 = v11;
  v21 = v10;
  v24 = v4;
  v25 = v5;
  v16 = v10;
  v17 = v13;
  objc_msgSend(v15, "computeVisibilityOffsetsInScrollView:withTargetContentOffset:usingBlock:", v3, v18, v7, v9);

}

- (UIScrollView)_scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->__scrollView);
}

- (void)_setScrollView:(id)a3
{
  objc_storeWeak((id *)&self->__scrollView, a3);
}

- (BOOL)_isPerformingChanges
{
  return self->__isPerformingChanges;
}

- (void)_setPerformingChanges:(BOOL)a3
{
  self->__isPerformingChanges = a3;
}

- (NSDate)estimatedScrollEndDate
{
  return self->_estimatedScrollEndDate;
}

- (ISVisibilityOffsetHelper)visibilityOffsetHelper
{
  return self->_visibilityOffsetHelper;
}

uint64_t __56__ISScrollViewVitalityController__updateVitalityFilters__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setVisible:", *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setVisibilityOffset:", *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setHasTargetVisibilityOffset:", *(unsigned __int8 *)(a1 + 65));
  objc_msgSend(*(id *)(a1 + 32), "setTargetVisibilityOffset:", *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setEstimatedScrollEndDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setScrolling:", *(unsigned __int8 *)(a1 + 66));
  return objc_msgSend(*(id *)(a1 + 32), "setDecelerating:", *(unsigned __int8 *)(a1 + 67));
}

uint64_t __45__ISScrollViewVitalityController_setEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = *(_BYTE *)(result + 40);
  return result;
}

@end
