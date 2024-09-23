@implementation _UINavigationBarLayout

- (void)setTopPalette:(uint64_t)a1
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _UIBarInsertLayoutData *v10;
  const char *v11;
  _UIBarInsertLayoutData *v12;
  void *v13;
  id v14;

  v4 = a2;
  if (a1 && *(id *)(a1 + 256) != v4)
  {
    v14 = v4;
    objc_storeStrong((id *)(a1 + 256), a2);
    v5 = *(void **)(a1 + 256);
    if (v5)
    {
      v6 = objc_msgSend(v5, "_layoutPriority");
      v7 = 900;
      if (v6 == 2)
        v7 = 1802;
      if (v6 == 1)
        v8 = 1702;
      else
        v8 = v7;
      v9 = *(_QWORD *)(a1 + 64);
      if (!v9)
      {
        v10 = objc_alloc_init(_UIBarInsertLayoutData);
        v12 = v10;
        if (v10)
        {
          objc_setProperty_nonatomic_copy(v10, v11, CFSTR("TopPalette"), 24);
          v12->_priority = v8;
          v12->_order = 90;
        }
        v13 = *(void **)(a1 + 64);
        *(_QWORD *)(a1 + 64) = v12;

        v9 = *(_QWORD *)(a1 + 64);
        if (!v9)
          goto LABEL_14;
      }
      if ((*(_BYTE *)(v9 + 8) & 8) != 0)
        objc_msgSend((id)a1, "_reprioritizeLayoutItem:toPriority:");
      else
LABEL_14:
        objc_msgSend((id)a1, "_addLayoutItem:");
    }
    else
    {
      objc_msgSend((id)a1, "_removeLayoutItem:", *(_QWORD *)(a1 + 64));
    }
    v4 = v14;
  }

}

- (void)setBottomPalette:(uint64_t)a1
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _UIBarInsertLayoutData *v10;
  const char *v11;
  _UIBarInsertLayoutData *v12;
  void *v13;
  id v14;

  v4 = a2;
  if (a1 && *(id *)(a1 + 264) != v4)
  {
    v14 = v4;
    objc_storeStrong((id *)(a1 + 264), a2);
    v5 = *(void **)(a1 + 264);
    if (v5)
    {
      v6 = objc_msgSend(v5, "_layoutPriority");
      v7 = 700;
      if (v6 == 2)
        v7 = 1801;
      if (v6 == 1)
        v8 = 1701;
      else
        v8 = v7;
      v9 = *(_QWORD *)(a1 + 72);
      if (!v9)
      {
        v10 = objc_alloc_init(_UIBarInsertLayoutData);
        v12 = v10;
        if (v10)
        {
          objc_setProperty_nonatomic_copy(v10, v11, CFSTR("BottomPalette"), 24);
          v12->_priority = v8;
          v12->_order = 30;
        }
        v13 = *(void **)(a1 + 72);
        *(_QWORD *)(a1 + 72) = v12;

        v9 = *(_QWORD *)(a1 + 72);
        if (!v9)
          goto LABEL_14;
      }
      if ((*(_BYTE *)(v9 + 8) & 8) != 0)
        objc_msgSend((id)a1, "_reprioritizeLayoutItem:toPriority:");
      else
LABEL_14:
        objc_msgSend((id)a1, "_addLayoutItem:");
    }
    else
    {
      objc_msgSend((id)a1, "_removeLayoutItem:", *(_QWORD *)(a1 + 72));
    }
    v4 = v14;
  }

}

- (void)setSearchBar:(uint64_t)a1
{
  id v4;
  uint64_t v5;
  int v6;
  _UIBarInsertLayoutData *v7;
  const char *v8;
  _UIBarInsertLayoutData *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _UIBarInsertLayoutData *v13;
  const char *v14;
  _UIBarInsertLayoutData *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v4 = a2;
  if (a1 && *(id *)(a1 + 240) != v4)
  {
    v18 = v4;
    objc_storeStrong((id *)(a1 + 240), a2);
    v5 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 240))
    {
      if (!v5)
      {
        v6 = *(unsigned __int8 *)(a1 + 116);
        v7 = objc_alloc_init(_UIBarInsertLayoutData);
        v9 = v7;
        if (v7)
        {
          if (v6)
            v10 = 1700;
          else
            v10 = 1900;
          objc_setProperty_nonatomic_copy(v7, v8, CFSTR("SearchBar"), 24);
          v9->_priority = v10;
          v9->_order = 50;
        }
        v11 = *(void **)(a1 + 48);
        *(_QWORD *)(a1 + 48) = v9;

        v12 = *(_QWORD *)(a1 + 48);
        if (v12)
          *(_BYTE *)(v12 + 8) = *(_BYTE *)(v12 + 8) & 0xFE | *(_BYTE *)(a1 + 116);
        v13 = objc_alloc_init(_UIBarInsertLayoutData);
        v15 = v13;
        if (v13)
        {
          objc_setProperty_nonatomic_copy(v13, v14, CFSTR("ActiveSearchScopeBar"), 24);
          *(_OWORD *)&v15->_priority = xmmword_186679440;
        }
        v16 = *(void **)(a1 + 56);
        *(_QWORD *)(a1 + 56) = v15;

        v17 = *(_QWORD *)(a1 + 56);
        if (v17)
          *(_BYTE *)(v17 + 8) |= 1u;
        v5 = *(_QWORD *)(a1 + 48);
      }
      objc_msgSend((id)a1, "_addLayoutItem:", v5);
      objc_msgSend((id)a1, "_addLayoutItem:", *(_QWORD *)(a1 + 56));
    }
    else
    {
      objc_msgSend((id)a1, "_removeLayoutItem:", v5);
      objc_msgSend((id)a1, "_removeLayoutItem:", *(_QWORD *)(a1 + 56));
    }
    v4 = v18;
  }

}

- (void)setWeeTitleLabel:(uint64_t)a1
{
  id v4;
  id *v5;
  id v6;
  id v7;

  v4 = a2;
  if (a1)
  {
    v6 = *(id *)(a1 + 232);
    v5 = (id *)(a1 + 232);
    if (v6 != v4)
    {
      v7 = v4;
      objc_storeStrong(v5, a2);
      v4 = v7;
    }
  }

}

- (void)setLargeTitleView:(uint64_t)a1
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a2;
  if (a1)
  {
    v5 = *(id *)(a1 + 144);
    v9 = v4;
    if (v4)
    {
      if (v5 == v4)
      {
        if (*(_QWORD *)(a1 + 168))
          goto LABEL_8;
        v6 = v4;
      }
      else
      {
        objc_storeStrong((id *)(a1 + 144), a2);
        v6 = *(void **)(a1 + 144);
      }
      objc_msgSend(v6, "layout");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 168);
      *(_QWORD *)(a1 + 168) = v7;
    }
    else
    {
      *(_QWORD *)(a1 + 144) = 0;

      v8 = *(void **)(a1 + 168);
      *(_QWORD *)(a1 + 168) = 0;
    }

LABEL_8:
    objc_msgSend((id)a1, "_updateLargeTitleViewLayoutItem");
    v4 = v9;
  }

}

- (void)_updateLargeTitleViewLayoutItem
{
  _UINavigationBarLargeTitleViewLayout *largeTitleViewLayout;
  _UIBarInsertLayoutData *largeTitleLayoutData;
  _UIBarInsertLayoutData *v5;
  const char *v6;
  _UIBarInsertLayoutData *v7;
  _UIBarInsertLayoutData *v8;
  _UIBarInsertLayoutData *v9;
  _UIBarInsertLayoutData *v10;

  if (self->_largeTitleView && (largeTitleViewLayout = self->_largeTitleViewLayout) != 0)
  {
    -[_UINavigationBarLargeTitleViewLayout setOverlaysContentView:](largeTitleViewLayout, "setOverlaysContentView:", self->_largeTitleViewOverlaysContentView);
    largeTitleLayoutData = self->_largeTitleLayoutData;
    if (!largeTitleLayoutData)
    {
      v5 = objc_alloc_init(_UIBarInsertLayoutData);
      v7 = v5;
      if (v5)
      {
        objc_setProperty_nonatomic_copy(v5, v6, CFSTR("LargeTitle"), 24);
        *(_OWORD *)&v7->_priority = xmmword_186679420;
      }
      v8 = self->_largeTitleLayoutData;
      self->_largeTitleLayoutData = v7;

      v9 = self->_largeTitleLayoutData;
      if (v9 && (*(_BYTE *)&v9->_flags |= 2u, (v10 = self->_largeTitleLayoutData) != 0))
      {
        *(_BYTE *)&v10->_flags |= 1u;
        largeTitleLayoutData = self->_largeTitleLayoutData;
      }
      else
      {
        largeTitleLayoutData = 0;
      }
    }
    -[_UINavigationBarLayout _addLayoutItem:](self, "_addLayoutItem:", largeTitleLayoutData);
  }
  else
  {
    -[_UINavigationBarLayout _removeLayoutItem:](self, "_removeLayoutItem:", self->_largeTitleLayoutData);
  }
}

- (void)setPromptView:(uint64_t)a1
{
  id v4;
  uint64_t v5;
  _UIBarInsertLayoutData *v6;
  const char *v7;
  _UIBarInsertLayoutData *v8;
  void *v9;
  id v10;

  v4 = a2;
  if (a1 && *(id *)(a1 + 120) != v4)
  {
    v10 = v4;
    objc_storeStrong((id *)(a1 + 120), a2);
    v5 = *(_QWORD *)(a1 + 16);
    if (*(_QWORD *)(a1 + 120))
    {
      if (!v5)
      {
        v6 = objc_alloc_init(_UIBarInsertLayoutData);
        v8 = v6;
        if (v6)
        {
          objc_setProperty_nonatomic_copy(v6, v7, CFSTR("Prompt"), 24);
          *(_OWORD *)&v8->_priority = xmmword_186679400;
        }
        v9 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v8;

        v5 = *(_QWORD *)(a1 + 16);
      }
      objc_msgSend((id)a1, "_addLayoutItem:", v5);
    }
    else
    {
      objc_msgSend((id)a1, "_removeLayoutItem:", v5);
    }
    v4 = v10;
  }

}

- (uint64_t)setHidesSearchBarWhenScrolling:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    if (*(unsigned __int8 *)(result + 116) != a2)
    {
      *(_BYTE *)(result + 116) = a2;
      if (*(_QWORD *)(result + 240))
      {
        v2 = *(_QWORD *)(result + 48);
        if (v2)
        {
          *(_BYTE *)(v2 + 8) = *(_BYTE *)(v2 + 8) & 0xFE | a2;
          v3 = *(_QWORD *)(result + 48);
          a2 = *(unsigned __int8 *)(result + 116);
        }
        else
        {
          v3 = 0;
        }
        if (a2)
          v4 = 1700;
        else
          v4 = 1900;
        return objc_msgSend((id)result, "_reprioritizeLayoutItem:toPriority:", v3, v4);
      }
    }
  }
  return result;
}

- (void)setContentViewVisualProvider:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 152), a2);
}

- (void)setContentView:(uint64_t)a1
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a2;
  v5 = v4;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 136) && *(id *)(a1 + 128) != v4)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "Surprise!", buf, 2u);
        }

      }
      else
      {
        v11 = setContentView____s_category;
        if (!setContentView____s_category)
        {
          v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v11, (unint64_t *)&setContentView____s_category);
        }
        v12 = *(NSObject **)(v11 + 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Surprise!", v14, 2u);
        }
      }
    }
    v6 = *(void **)(a1 + 128);
    if (v5)
    {
      if (v6 == v5)
      {
        if (*(_QWORD *)(a1 + 160))
          goto LABEL_10;
        v7 = v5;
      }
      else
      {
        objc_storeStrong((id *)(a1 + 128), a2);
        v7 = *(void **)(a1 + 128);
      }
      objc_msgSend(v7, "layout");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 160);
      *(_QWORD *)(a1 + 160) = v8;
    }
    else
    {
      *(_QWORD *)(a1 + 128) = 0;

      v10 = *(void **)(a1 + 160);
      *(_QWORD *)(a1 + 160) = 0;

      objc_msgSend(*(id *)(a1 + 136), "removeFromSuperview");
      v9 = *(void **)(a1 + 136);
      *(_QWORD *)(a1 + 136) = 0;
    }

LABEL_10:
    objc_msgSend((id)a1, "_updateContentViewLayoutItem");
  }

}

- (void)_addLayoutItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = v4;
  if (v4 && (*((_BYTE *)v4 + 8) & 8) == 0)
  {
    *((_BYTE *)v4 + 8) |= 8u;
    v6 = v4;
    -[NSMutableArray insertObject:atIndex:](self->_priorityOrderedLayout, "insertObject:atIndex:", v4, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_priorityOrderedLayout, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, -[NSMutableArray count](self->_priorityOrderedLayout, "count"), 1024, &__block_literal_global_65));
    -[NSMutableArray insertObject:atIndex:](self->_stackingOrderedLayout, "insertObject:atIndex:", v6, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_stackingOrderedLayout, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, -[NSMutableArray count](self->_stackingOrderedLayout, "count"), 1024, &__block_literal_global_1_1));
    v5 = v6;
    *(_BYTE *)&self->_flags &= ~1u;
  }

}

- (void)_includeContentLayoutDataInLayout:(BOOL)a3
{
  if (a3 && !self->_largeTitleViewOverlaysContentView)
    -[_UINavigationBarLayout _addLayoutItem:](self, "_addLayoutItem:", self->_contentLayoutData);
  else
    -[_UINavigationBarLayout _removeLayoutItem:](self, "_removeLayoutItem:", self->_contentLayoutData);
}

- (void)setBackgroundView:(uint64_t)a1
{
  id v4;
  id *v5;
  id v6;
  id v7;

  v4 = a2;
  if (a1)
  {
    v6 = *(id *)(a1 + 176);
    v5 = (id *)(a1 + 176);
    if (v6 != v4)
    {
      v7 = v4;
      objc_storeStrong(v5, a2);
      v4 = v7;
    }
  }

}

- (void)_updateContentViewLayoutItem
{
  _UIBarInsertLayoutData *v3;
  const char *v4;
  _UIBarInsertLayoutData *v5;
  _UIBarInsertLayoutData *contentLayoutData;
  uint64_t v7;

  if (self->_contentView && self->_contentViewLayout)
  {
    if (!self->_contentLayoutData)
    {
      v3 = objc_alloc_init(_UIBarInsertLayoutData);
      v5 = v3;
      if (v3)
      {
        objc_setProperty_nonatomic_copy(v3, v4, CFSTR("ContentView"), 24);
        *(_OWORD *)&v5->_priority = xmmword_186679410;
      }
      contentLayoutData = self->_contentLayoutData;
      self->_contentLayoutData = v5;

    }
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  -[_UINavigationBarLayout _includeContentLayoutDataInLayout:](self, "_includeContentLayoutDataInLayout:", v7);
}

- (void)_updateLayoutOutputs
{
  NSMutableArray *v3;
  uint64_t v4;
  char v5;
  _UIBarInsertLayoutData *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v17;
  uint64_t v18;
  _BOOL4 clientCanUpdateChromelessTransitionProgress;
  _BOOL4 useManualScrollEdgeAppearance;
  int64_t apiVersion;
  char v22;
  _UIBarBackgroundLayout *standardBackgroundViewLayout;
  double v24;
  _UIBarInsertLayoutData *largeTitleLayoutData;
  double preferredHeight;
  double collapsingHeight;
  _UINavigationBarContentViewLayout *contentViewLayout;
  double v30;
  _UINavigationControllerRefreshControlHost *refreshControlHost;
  _UIBarInsertLayoutData *refreshControlLayoutData;
  double v33;
  double requestedBackgroundViewAlpha;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v3 = self->_stackingOrderedLayout;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  v5 = 0;
  v6 = 0;
  if (!v4)
  {
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    goto LABEL_28;
  }
  v7 = *(_QWORD *)v36;
  v8 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v36 != v7)
        objc_enumerationMutation(v3);
      v13 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v12);
      if (v6)
      {
        if (v13 && *(double *)(v13 + 64) > 0.0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_28;
        }
      }
      else
      {
        if (!v13)
        {
          v17 = 0.0;
          goto LABEL_18;
        }
        v14 = 0.0;
        if ((*(_BYTE *)(v13 + 8) & 1) == 0)
          v14 = *(double *)(v13 + 32);
        v15 = *(double *)(v13 + 40);
        if (v15 <= v14 || (*(_BYTE *)(v13 + 8) & 4) != 0)
        {
          v17 = *(double *)(v13 + 56);
LABEL_18:
          v6 = 0;
          v8 = v8 + v17;
          goto LABEL_22;
        }
        v11 = 0.0;
        if ((*(_BYTE *)(v13 + 8) & 1) == 0)
          v11 = *(double *)(v13 + 32);
        v9 = *(double *)(v13 + 64);
        v6 = (_UIBarInsertLayoutData *)(id)v13;
        v5 = 1;
        v10 = v15;
      }
LABEL_22:
      ++v12;
    }
    while (v4 != v12);
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    v4 = v18;
  }
  while (v18);
LABEL_28:

  if (vabdd_f64(v9, v11) < 0.00000011920929)
    v9 = v11;
  if (_UIBarsApplyChromelessEverywhere())
    clientCanUpdateChromelessTransitionProgress = self->_clientCanUpdateChromelessTransitionProgress;
  else
    clientCanUpdateChromelessTransitionProgress = 0;
  useManualScrollEdgeAppearance = self->_useManualScrollEdgeAppearance;
  if (!clientCanUpdateChromelessTransitionProgress && self->_useManualScrollEdgeAppearance)
  {
    self->_chromelessTransitionProgress = 1.0 - self->_manualScrollEdgeAppearanceProgress;
    apiVersion = self->_apiVersion;
    goto LABEL_36;
  }
  apiVersion = self->_apiVersion;
  if (apiVersion < 1)
  {
    self->_chromelessTransitionProgress = 0.0;
    goto LABEL_56;
  }
  if (v9 <= v11)
  {
    if (clientCanUpdateChromelessTransitionProgress
      && (self->_clientUsesManualScrollEdgeAppearanceProgressSPI & v5) == 0)
    {
      v24 = 1.0 - self->_manualScrollEdgeAppearanceProgress;
      goto LABEL_85;
    }
    self->_chromelessTransitionProgress = 0.0;
  }
  else if (v9 >= v10)
  {
    self->_chromelessTransitionProgress = 1.0;
  }
  else
  {
    if (clientCanUpdateChromelessTransitionProgress && !self->_clientUsesManualScrollEdgeAppearanceProgressSPI)
      v24 = 1.0;
    else
      v24 = (v9 - v11) / (v10 - v11);
LABEL_85:
    self->_chromelessTransitionProgress = v24;
  }
LABEL_36:
  if (apiVersion >= 2)
  {
    if (self->_largeTitleView)
    {
      if (v6 == self->_largeTitleLayoutData)
        v22 = v4;
      else
        v22 = 1;
      standardBackgroundViewLayout = self->_standardBackgroundViewLayout;
      if ((v22 & 1) == 0 && !useManualScrollEdgeAppearance)
      {
        -[_UIBarBackgroundLayout setUseExplicitGeometry:](standardBackgroundViewLayout, "setUseExplicitGeometry:", 1, (_QWORD)v35);
        -[_UIBarBackgroundLayout setBackgroundHeight1:](self->_standardBackgroundViewLayout, "setBackgroundHeight1:", v8 + self->_backgroundExtension);
        -[_UIBarBackgroundLayout setBackgroundHeight2:](self->_standardBackgroundViewLayout, "setBackgroundHeight2:", self->_layoutSize.height - v8);
        goto LABEL_56;
      }
    }
    else
    {
      standardBackgroundViewLayout = self->_standardBackgroundViewLayout;
    }
    -[_UIBarBackgroundLayout setUseExplicitGeometry:](standardBackgroundViewLayout, "setUseExplicitGeometry:", 0, (_QWORD)v35);
  }
LABEL_56:
  if (self->_largeTitleView
    && (largeTitleLayoutData = self->_largeTitleLayoutData) != 0
    && (preferredHeight = largeTitleLayoutData->_preferredHeight, preferredHeight > 0.0))
  {
    collapsingHeight = largeTitleLayoutData->_collapsingHeight;
    if (collapsingHeight <= 0.0 || collapsingHeight < preferredHeight)
    {
      self->_largeTitleExposure = collapsingHeight / preferredHeight;
      if (fabs(collapsingHeight / preferredHeight) < 0.00000011920929)
        self->_largeTitleExposure = 0.0;
    }
    else
    {
      self->_largeTitleExposure = 1.0;
    }
    self->_largeTitleTransitionProgress = -[_UIBarInsertLayoutData transitionProgress]((uint64_t)largeTitleLayoutData);
    -[_UINavigationBarContentViewLayout setLargeTitleHeight:](self->_contentViewLayout, "setLargeTitleHeight:", collapsingHeight);
    contentViewLayout = self->_contentViewLayout;
    v30 = preferredHeight;
  }
  else
  {
    self->_largeTitleExposure = 0.0;
    self->_largeTitleTransitionProgress = 0.0;
    -[_UINavigationBarContentViewLayout setLargeTitleHeight:](self->_contentViewLayout, "setLargeTitleHeight:", 0.0, (_QWORD)v35);
    contentViewLayout = self->_contentViewLayout;
    v30 = 0.0;
  }
  -[_UINavigationBarContentViewLayout setLargeTitleHeightRange:](contentViewLayout, "setLargeTitleHeightRange:", 0.0, v30, (_QWORD)v35);
  refreshControlHost = self->_refreshControlHost;
  if (refreshControlHost)
  {
    refreshControlLayoutData = self->_refreshControlLayoutData;
    if (refreshControlLayoutData)
      v33 = refreshControlLayoutData->_collapsingHeight;
    else
      v33 = 0.0;
    -[_UINavigationControllerRefreshControlHost setUnobstructedHeight:](refreshControlHost, "setUnobstructedHeight:", v33);
  }
  if (self->_clientWantsBackgroundHidden)
  {
    self->_computedBackgroundViewAlpha = 0.0;
  }
  else
  {
    requestedBackgroundViewAlpha = self->_requestedBackgroundViewAlpha;
    if (self->_apiVersion < 2)
    {
      if (v6 || self->_useManualScrollEdgeAppearance || self->_backgroundCoversContentOnly)
        requestedBackgroundViewAlpha = requestedBackgroundViewAlpha * (1.0 - self->_chromelessTransitionProgress);
      self->_computedBackgroundViewAlpha = requestedBackgroundViewAlpha;
    }
    else
    {
      self->_computedBackgroundViewAlpha = requestedBackgroundViewAlpha;
      -[_UIBarBackgroundLayout setBackgroundTransitionProgress:](self->_standardBackgroundViewLayout, "setBackgroundTransitionProgress:", self->_chromelessTransitionProgress);
    }
  }

}

- (void)_removeLayoutItem:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if (v4 && (v4[8] & 8) != 0)
  {
    v4[8] &= ~8u;
    v5 = v4;
    -[NSMutableArray removeObjectIdenticalTo:](self->_priorityOrderedLayout, "removeObjectIdenticalTo:", v4);
    -[NSMutableArray removeObjectIdenticalTo:](self->_stackingOrderedLayout, "removeObjectIdenticalTo:", v5);
    v4 = v5;
    *(_BYTE *)&self->_flags &= ~1u;
  }

}

- (id)layoutForMeasuringWidth:(_QWORD *)a1
{
  id v2;
  void *v3;
  uint64_t v5;

  v2 = a1;
  if (a1)
  {
    v3 = (void *)a1[21];
    if (v3 && (v5 = objc_msgSend(v3, "twoLineMode"), a2 != 0.0) && v5 == 1)
    {
      v2 = (id)objc_msgSend(v2, "copy");
      -[_UINavigationBarLayout setLayoutSize:]((uint64_t)v2, a2, 0.0);
    }
    else
    {
      -[_UINavigationBarLayout updateLayout]((uint64_t)v2);
      v2 = v2;
    }
  }
  return v2;
}

- (void)updateLayout
{
  void *v2;
  void *v3;
  double v4;
  id v5;

  if (a1)
  {
    objc_msgSend((id)a1, "_updateLayoutParametersForWidth:", *(double *)(a1 + 312));
    v2 = *(void **)(a1 + 32);
    if (!v2)
      v2 = *(void **)(a1 + 40);
    v3 = *(void **)(a1 + 80);
    v4 = *(double *)(a1 + 320);
    v5 = v2;
    +[_UIBarInsertLayoutData updateLayoutParameters:overflowLayout:forAvailableHeight:](v4, (uint64_t)_UIBarInsertLayoutData, v3, v5);
    +[_UIBarInsertLayoutData assignVerticalOriginsToItemsInLayouts:]((uint64_t)_UIBarInsertLayoutData, *(void **)(a1 + 88));
    *(_BYTE *)(a1 + 104) |= 1u;
    objc_msgSend((id)a1, "_updateLayoutOutputs");

  }
}

- (void)_updateLayoutParametersForWidth:(double)a3
{
  _UINavigationBarModernPromptView *promptView;
  _UIBarInsertLayoutData *promptLayoutData;
  _UINavigationBarContentViewLayout *contentViewLayout;
  _UINavigationBarContentViewLayout *v8;
  _UINavigationBarContentViewLayout *v9;
  _UIBarInsertLayoutData *contentLayoutData;
  _UIBarInsertLayoutData *refreshControlLayoutData;
  UISearchBar *searchBar;
  _UIBarInsertLayoutData *searchBarLayoutData;
  _UIBarInsertLayoutData *scopeBarLayoutData;
  _UINavigationBarLargeTitleViewLayout *largeTitleViewLayout;
  _UINavigationBarLargeTitleViewLayout *v16;
  _UINavigationBarLargeTitleViewLayout *v17;
  _UIBarInsertLayoutData *v18;
  _UIBarInsertLayoutData *v19;
  double minimumHeight;
  _UIBarInsertLayoutData *largeTitleLayoutData;
  _UIBarInsertLayoutData *v22;
  _UIBarInsertLayoutData *v23;
  _UIBarInsertLayoutData *v24;
  _UIBarInsertLayoutData *v25;
  _UINavigationBarPalette *topPalette;
  _UINavigationBarPalette *bottomPalette;
  NSArray *restingHeights;

  promptView = self->_promptView;
  promptLayoutData = self->_promptLayoutData;
  if (promptView)
  {
    -[_UINavigationBarModernPromptView updateLayoutData:layoutWidth:](promptView, "updateLayoutData:layoutWidth:", promptLayoutData, a3);
  }
  else if (promptLayoutData)
  {
    promptLayoutData->_minimumHeight = 0.0;
    promptLayoutData->_preferredHeight = 0.0;
  }
  if (self->_contentView)
  {
    contentViewLayout = self->_contentViewLayout;
    if (!contentViewLayout)
    {
      -[_UINavigationBarContentView layout](self->_contentView, "layout");
      v8 = (_UINavigationBarContentViewLayout *)objc_claimAutoreleasedReturnValue();
      v9 = self->_contentViewLayout;
      self->_contentViewLayout = v8;

      if (self->_contentViewLayout)
      {
        -[_UINavigationBarLayout _includeContentLayoutDataInLayout:](self, "_includeContentLayoutDataInLayout:", 1);
        contentViewLayout = self->_contentViewLayout;
      }
      else
      {
        contentViewLayout = 0;
      }
    }
    -[_UINavigationBarContentViewLayout updateLayoutData:layoutWidth:](contentViewLayout, "updateLayoutData:layoutWidth:", self->_contentLayoutData, a3);
  }
  else
  {
    contentLayoutData = self->_contentLayoutData;
    if (contentLayoutData)
    {
      contentLayoutData->_minimumHeight = 0.0;
      contentLayoutData->_preferredHeight = 0.0;
    }
  }
  if (self->_refreshControlHost)
  {
    -[_UINavigationBarLayout _updateRefreshControlLayoutData](self, "_updateRefreshControlLayoutData");
  }
  else
  {
    refreshControlLayoutData = self->_refreshControlLayoutData;
    if (refreshControlLayoutData)
    {
      refreshControlLayoutData->_minimumHeight = 0.0;
      refreshControlLayoutData->_preferredHeight = 0.0;
    }
  }
  searchBar = self->_searchBar;
  searchBarLayoutData = self->_searchBarLayoutData;
  if (searchBar)
  {
    -[UISearchBar _updateNavigationBarLayoutInsertDataForSearchBar:collapsibleScopeBar:forLayoutState:](searchBar, "_updateNavigationBarLayoutInsertDataForSearchBar:collapsibleScopeBar:forLayoutState:", searchBarLayoutData, self->_scopeBarLayoutData, self->_representedSearchLayoutState);
  }
  else if (searchBarLayoutData)
  {
    searchBarLayoutData->_minimumHeight = 0.0;
    searchBarLayoutData->_preferredHeight = 0.0;
    scopeBarLayoutData = self->_scopeBarLayoutData;
    if (scopeBarLayoutData)
    {
      scopeBarLayoutData->_minimumHeight = 0.0;
      scopeBarLayoutData->_preferredHeight = 0.0;
    }
  }
  if (self->_largeTitleView)
  {
    largeTitleViewLayout = self->_largeTitleViewLayout;
    if (!largeTitleViewLayout)
    {
      -[_UINavigationBarLargeTitleView layout](self->_largeTitleView, "layout");
      v16 = (_UINavigationBarLargeTitleViewLayout *)objc_claimAutoreleasedReturnValue();
      v17 = self->_largeTitleViewLayout;
      self->_largeTitleViewLayout = v16;

      if (self->_largeTitleViewLayout)
      {
        -[_UINavigationBarLayout _addLayoutItem:](self, "_addLayoutItem:", self->_largeTitleLayoutData);
        largeTitleViewLayout = self->_largeTitleViewLayout;
      }
      else
      {
        largeTitleViewLayout = 0;
      }
    }
    -[_UINavigationBarLargeTitleViewLayout updateLayoutData:layoutWidth:](largeTitleViewLayout, "updateLayoutData:layoutWidth:", self->_largeTitleLayoutData, a3);
    if (self->_largeTitleViewOverlaysContentView && self->_contentViewLayout)
    {
      v19 = self->_contentLayoutData;
      if (v19)
        minimumHeight = v19->_minimumHeight;
      else
        minimumHeight = 0.0;
      largeTitleLayoutData = self->_largeTitleLayoutData;
      if (largeTitleLayoutData)
      {
        largeTitleLayoutData->_minimumHeight = minimumHeight;
        v22 = self->_largeTitleLayoutData;
        if (v22)
        {
          *(_BYTE *)&v22->_flags &= ~1u;
          v23 = self->_largeTitleLayoutData;
          if (v23)
            v23->_bottomInsetForTransitionProgress = 0.0;
        }
      }
    }
    else
    {
      v24 = self->_largeTitleLayoutData;
      if (v24)
      {
        *(_BYTE *)&v24->_flags |= 1u;
        v25 = self->_largeTitleLayoutData;
        if (v25)
          v25->_bottomInsetForTransitionProgress = 14.0;
      }
    }
  }
  else
  {
    v18 = self->_largeTitleLayoutData;
    if (v18)
    {
      v18->_minimumHeight = 0.0;
      v18->_preferredHeight = 0.0;
    }
  }
  topPalette = self->_topPalette;
  if (topPalette)
    -[_UINavigationBarPalette updateLayoutData:layoutWidth:](topPalette, "updateLayoutData:layoutWidth:", self->_topPaletteLayoutData, a3);
  bottomPalette = self->_bottomPalette;
  if (bottomPalette)
    -[_UINavigationBarPalette updateLayoutData:layoutWidth:](bottomPalette, "updateLayoutData:layoutWidth:", self->_bottomPaletteLayoutData, a3);
  restingHeights = self->_restingHeights;
  self->_restingHeights = 0;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLayout:", self);
}

- (void)_reprioritizeLayoutItem:(id)a3 toPriority:(int64_t)a4
{
  id v6;
  void *v7;
  _QWORD *v8;

  v6 = a3;
  v7 = v6;
  if (v6 && *((_QWORD *)v6 + 9) != a4 && (*((_BYTE *)v6 + 8) & 8) != 0)
  {
    v8 = v6;
    -[NSMutableArray removeObjectIdenticalTo:](self->_priorityOrderedLayout, "removeObjectIdenticalTo:", v6);
    v8[9] = a4;
    -[NSMutableArray insertObject:atIndex:](self->_priorityOrderedLayout, "insertObject:atIndex:", v8, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_priorityOrderedLayout, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, -[NSMutableArray count](self->_priorityOrderedLayout, "count"), 1024, &__block_literal_global_2_0));
    v7 = v8;
    *(_BYTE *)&self->_flags &= ~1u;
  }

}

- (BOOL)isVariableHeight
{
  uint64_t v1;
  double v2;
  double v3;

  if (result)
  {
    v1 = result;
    -[_UINavigationBarLayout updateLayout](result);
    v2 = +[_UIBarInsertLayoutData calculateLayoutHeights:]((uint64_t)_UIBarInsertLayoutData, *(void **)(v1 + 88));
    return v2 < v3;
  }
  return result;
}

- (double)layoutHeights
{
  if (a1)
    return +[_UIBarInsertLayoutData calculateLayoutHeights:]((uint64_t)_UIBarInsertLayoutData, *(void **)(a1 + 88));
  else
    return 0.0;
}

- (_UINavigationBarLayout)init
{
  _UINavigationBarLayout *v2;
  uint64_t v3;
  NSMutableArray *priorityOrderedLayout;
  uint64_t v5;
  NSMutableArray *stackingOrderedLayout;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UINavigationBarLayout;
  v2 = -[_UINavigationBarLayout init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    priorityOrderedLayout = v2->_priorityOrderedLayout;
    v2->_priorityOrderedLayout = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    stackingOrderedLayout = v2->_stackingOrderedLayout;
    v2->_stackingOrderedLayout = (NSMutableArray *)v5;

    -[_UINavigationBarLayout _updateWhitespaceLayoutItems](v2, "_updateWhitespaceLayoutItems");
  }
  return v2;
}

- (void)setRefreshControlHost:(id *)a1
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a2;
  if (a1)
  {
    v5 = a1[28];
    if (v5 != v4)
    {
      v7 = v4;
      objc_msgSend(v5, "setDelegate:", 0);
      objc_msgSend(a1[28], "stopAnimations");
      objc_msgSend(a1[28], "hostContainerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromSuperview");

      objc_storeStrong(a1 + 28, a2);
      objc_msgSend(a1, "_updateRefreshControlLayoutData");
      v4 = v7;
    }
  }

}

- (void)_updateRefreshControlLayoutData
{
  _UIBarInsertLayoutData *refreshControlLayoutData;
  _UIBarInsertLayoutData *v4;
  const char *v5;
  _UIBarInsertLayoutData *v6;
  _UIBarInsertLayoutData *v7;
  _UIBarInsertLayoutData *v8;
  _UIBarInsertLayoutData *v9;
  double v10;
  _UIBarInsertLayoutData *v11;
  _UIBarInsertLayoutData *v12;

  refreshControlLayoutData = self->_refreshControlLayoutData;
  if (self->_refreshControlHost)
  {
    if (!refreshControlLayoutData)
    {
      v4 = objc_alloc_init(_UIBarInsertLayoutData);
      v6 = v4;
      if (v4)
      {
        objc_setProperty_nonatomic_copy(v4, v5, CFSTR("RefreshControl"), 24);
        *(_OWORD *)&v6->_priority = xmmword_186679430;
      }
      v7 = self->_refreshControlLayoutData;
      self->_refreshControlLayoutData = v6;

      v8 = self->_refreshControlLayoutData;
      if (v8)
      {
        *(_BYTE *)&v8->_flags |= 4u;
        refreshControlLayoutData = self->_refreshControlLayoutData;
      }
      else
      {
        refreshControlLayoutData = 0;
      }
    }
    -[_UINavigationBarLayout _addLayoutItem:](self, "_addLayoutItem:", refreshControlLayoutData);
    v9 = self->_refreshControlLayoutData;
    if (v9)
      v9->_minimumHeight = 0.0;
    -[_UINavigationControllerRefreshControlHost restingHeightOfRefreshControl](self->_refreshControlHost, "restingHeightOfRefreshControl");
    v11 = self->_refreshControlLayoutData;
    if (v11)
    {
      v11->_preferredHeight = v10;
      v12 = self->_refreshControlLayoutData;
      if (v12)
        *(_BYTE *)&v12->_flags |= 1u;
    }
  }
  else
  {
    -[_UINavigationBarLayout _removeLayoutItem:](self, "_removeLayoutItem:", refreshControlLayoutData);
  }
}

- (_UINavigationBarLayout)initWithLayout:(id)a3
{
  char *v4;
  _UINavigationBarLayout *v5;
  _UINavigationBarLayout *v6;
  __int128 v7;
  uint64_t v8;
  NSMutableArray *priorityOrderedLayout;
  uint64_t v10;
  NSMutableArray *stackingOrderedLayout;
  uint64_t v12;
  _UIBarInsertLayoutData *topWhitespaceLayoutData;
  uint64_t v14;
  _UIBarInsertLayoutData *promptLayoutData;
  uint64_t v16;
  _UIBarInsertLayoutData *contentLayoutData;
  uint64_t v18;
  _UIBarInsertLayoutData *refreshControlLayoutData;
  uint64_t v20;
  _UIBarInsertLayoutData *largeTitleLayoutData;
  uint64_t v22;
  _UIBarInsertLayoutData *searchBarLayoutData;
  uint64_t v24;
  _UIBarInsertLayoutData *scopeBarLayoutData;
  uint64_t v26;
  _UIBarInsertLayoutData *topPaletteLayoutData;
  uint64_t v28;
  _UIBarInsertLayoutData *bottomPaletteLayoutData;
  objc_super v31;

  v4 = (char *)a3;
  v31.receiver = self;
  v31.super_class = (Class)_UINavigationBarLayout;
  v5 = -[_UINavigationBarLayout init](&v31, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_promptView, *((id *)v4 + 15));
    objc_storeStrong((id *)&v6->_contentView, *((id *)v4 + 16));
    objc_storeStrong((id *)&v6->_contentViewVisualProvider, *((id *)v4 + 19));
    objc_storeStrong((id *)&v6->_animationContentClippingView, *((id *)v4 + 17));
    objc_storeStrong((id *)&v6->_contentViewLayout, *((id *)v4 + 20));
    objc_storeStrong((id *)&v6->_largeTitleView, *((id *)v4 + 18));
    objc_storeStrong((id *)&v6->_largeTitleViewLayout, *((id *)v4 + 21));
    objc_storeStrong((id *)&v6->_backgroundView, *((id *)v4 + 22));
    objc_storeStrong((id *)&v6->_standardBackgroundViewLayout, *((id *)v4 + 24));
    objc_storeStrong((id *)&v6->_compactBackgroundViewLayout, *((id *)v4 + 23));
    objc_storeStrong((id *)&v6->_weeTitleLabel, *((id *)v4 + 29));
    objc_storeStrong((id *)&v6->_refreshControlHost, *((id *)v4 + 28));
    objc_storeStrong((id *)&v6->_searchBar, *((id *)v4 + 30));
    objc_storeStrong((id *)&v6->_topPalette, *((id *)v4 + 32));
    objc_storeStrong((id *)&v6->_bottomPalette, *((id *)v4 + 33));
    v6->_largeTitleViewOverlaysContentView = v4[108];
    v7 = *(_OWORD *)(v4 + 344);
    *(_OWORD *)&v6->_largeTitleViewInsets.top = *(_OWORD *)(v4 + 328);
    *(_OWORD *)&v6->_largeTitleViewInsets.bottom = v7;
    v6->_backgroundExtension = *((double *)v4 + 25);
    v6->_backgroundCoversContentOnly = v4[109];
    v6->_hidesSearchBarWhenScrolling = v4[116];
    v6->_layoutSize = *(CGSize *)(v4 + 312);
    v6->_useManualScrollEdgeAppearance = v4[111];
    v6->_manualScrollEdgeAppearanceProgress = *((double *)v4 + 27);
    v6->_representedSearchLayoutState = *((_QWORD *)v4 + 31);
    v6->_clientCanUpdateChromelessTransitionProgress = v4[113];
    v6->_clientUsesManualScrollEdgeAppearanceProgressSPI = v4[112];
    v6->_apiVersion = *((_QWORD *)v4 + 38);
    v6->_largeTitleExposure = *((double *)v4 + 34);
    v6->_largeTitleTransitionProgress = *((double *)v4 + 35);
    v6->_chromelessTransitionProgress = *((double *)v4 + 36);
    v6->_computedBackgroundViewAlpha = *((double *)v4 + 37);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    priorityOrderedLayout = v6->_priorityOrderedLayout;
    v6->_priorityOrderedLayout = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    stackingOrderedLayout = v6->_stackingOrderedLayout;
    v6->_stackingOrderedLayout = (NSMutableArray *)v10;

    v12 = objc_msgSend(*((id *)v4 + 1), "copy");
    topWhitespaceLayoutData = v6->_topWhitespaceLayoutData;
    v6->_topWhitespaceLayoutData = (_UIBarInsertLayoutData *)v12;

    -[_UINavigationBarLayout _addLayoutItem:](v6, "_addLayoutItem:", v6->_topWhitespaceLayoutData);
    if (v6->_promptView)
    {
      v14 = objc_msgSend(*((id *)v4 + 2), "copy");
      promptLayoutData = v6->_promptLayoutData;
      v6->_promptLayoutData = (_UIBarInsertLayoutData *)v14;

      -[_UINavigationBarLayout _addLayoutItem:](v6, "_addLayoutItem:", v6->_promptLayoutData);
    }
    if (v6->_contentView)
    {
      v16 = objc_msgSend(*((id *)v4 + 3), "copy");
      contentLayoutData = v6->_contentLayoutData;
      v6->_contentLayoutData = (_UIBarInsertLayoutData *)v16;

      -[_UINavigationBarLayout _includeContentLayoutDataInLayout:](v6, "_includeContentLayoutDataInLayout:", 1);
    }
    if (v6->_refreshControlHost)
    {
      v18 = objc_msgSend(*((id *)v4 + 5), "copy");
      refreshControlLayoutData = v6->_refreshControlLayoutData;
      v6->_refreshControlLayoutData = (_UIBarInsertLayoutData *)v18;

    }
    if (v6->_largeTitleView)
    {
      v20 = objc_msgSend(*((id *)v4 + 4), "copy");
      largeTitleLayoutData = v6->_largeTitleLayoutData;
      v6->_largeTitleLayoutData = (_UIBarInsertLayoutData *)v20;

      -[_UINavigationBarLayout _addLayoutItem:](v6, "_addLayoutItem:", v6->_largeTitleLayoutData);
    }
    if (v6->_searchBar)
    {
      v22 = objc_msgSend(*((id *)v4 + 6), "copy");
      searchBarLayoutData = v6->_searchBarLayoutData;
      v6->_searchBarLayoutData = (_UIBarInsertLayoutData *)v22;

      v24 = objc_msgSend(*((id *)v4 + 7), "copy");
      scopeBarLayoutData = v6->_scopeBarLayoutData;
      v6->_scopeBarLayoutData = (_UIBarInsertLayoutData *)v24;

      -[_UINavigationBarLayout _addLayoutItem:](v6, "_addLayoutItem:", v6->_searchBarLayoutData);
      -[_UINavigationBarLayout _addLayoutItem:](v6, "_addLayoutItem:", v6->_scopeBarLayoutData);
    }
    if (v6->_topPalette)
    {
      v26 = objc_msgSend(*((id *)v4 + 8), "copy");
      topPaletteLayoutData = v6->_topPaletteLayoutData;
      v6->_topPaletteLayoutData = (_UIBarInsertLayoutData *)v26;

      -[_UINavigationBarLayout _addLayoutItem:](v6, "_addLayoutItem:", v6->_topPaletteLayoutData);
    }
    if (v6->_bottomPalette)
    {
      v28 = objc_msgSend(*((id *)v4 + 9), "copy");
      bottomPaletteLayoutData = v6->_bottomPaletteLayoutData;
      v6->_bottomPaletteLayoutData = (_UIBarInsertLayoutData *)v28;

      -[_UINavigationBarLayout _addLayoutItem:](v6, "_addLayoutItem:", v6->_bottomPaletteLayoutData);
    }
    *(_BYTE *)&v6->_flags &= ~1u;
  }

  return v6;
}

- (void)removeViewsNotInLayout:(uint64_t)a1
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id *v18;

  v3 = a2;
  if (a1)
  {
    v18 = v3;
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel_removeViewsNotInLayout_, a1, CFSTR("_UINavigationBarLayout.m"), 1046, CFSTR("otherLayout==nil"));

    }
    objc_msgSend(*(id *)(a1 + 224), "hostContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18[28], "hostContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 != v5)
    {
      objc_msgSend(*(id *)(a1 + 224), "stopAnimations");
      objc_msgSend(*(id *)(a1 + 224), "hostContainerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromSuperview");

    }
    v7 = *(id *)(a1 + 120);
    v8 = v18;
    if (v7 != v18[15])
    {
      objc_msgSend(v7, "removeFromSuperview");
      v8 = v18;
    }
    v9 = *(id *)(a1 + 128);
    if (v9 != v8[16])
    {
      objc_msgSend(v9, "removeFromSuperview");
      objc_msgSend(*(id *)(a1 + 136), "removeFromSuperview");
      v8 = v18;
    }
    v10 = *(id *)(a1 + 144);
    if (v10 != v8[18])
    {
      objc_msgSend(v10, "removeFromSuperview");
      v8 = v18;
    }
    v11 = *(id *)(a1 + 176);
    if (v11 != v8[22])
    {
      objc_msgSend(v11, "removeFromSuperview");
      v8 = v18;
    }
    v12 = *(id *)(a1 + 232);
    if (v12 != v8[29])
    {
      objc_msgSend(v12, "removeFromSuperview");
      v8 = v18;
    }
    v13 = *(id *)(a1 + 240);
    if (v13 != v8[30])
    {
      objc_msgSend(v13, "_viewStackedInNavigationBar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeFromSuperview");

      v8 = v18;
    }
    v15 = *(id *)(a1 + 256);
    if (v15 != v8[32])
    {
      objc_msgSend(v15, "removeFromSuperview");
      v8 = v18;
    }
    v16 = *(id *)(a1 + 264);
    if (v16 != v8[33])
      objc_msgSend(v16, "removeFromSuperview");

    v3 = v18;
  }

}

- (void)installViewsInNavigationBar:(uint64_t)a1
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  __int128 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = *(void **)(a1 + 240);
    v4 = a2;
    objc_msgSend(v3, "_viewStackedInNavigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = *(_QWORD *)(a1 + 176);
    v14[1] = (id)objc_msgSend(*(id *)(a1 + 224), "hostContainerView");
    v15 = *(_OWORD *)(a1 + 256);
    v7 = *(_QWORD *)(a1 + 136);
    v6 = *(_QWORD *)(a1 + 144);
    v16 = v5;
    v17 = v6;
    v9 = *(_QWORD *)(a1 + 120);
    v8 = *(void **)(a1 + 128);
    if (!v7)
      v7 = *(_QWORD *)(a1 + 128);
    v18 = v7;
    v19 = v9;
    v20 = *(_QWORD *)(a1 + 232);
    objc_msgSend(v8, "assistant");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v10, "previewContainer");

    objc_msgSend(*(id *)(a1 + 128), "layout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:contentView:", 1, *(_QWORD *)(a1 + 128));

    objc_msgSend(v4, "_ensureViewsAreInstalledInRelativeOrder:viewCount:insertionStartIndex:", v14, 10, 0);
    if (*(_QWORD *)(a1 + 136))
    {
      objc_msgSend(*(id *)(a1 + 128), "superview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 136);

      if (v12 != v13)
        objc_msgSend(*(id *)(a1 + 136), "addSubview:", *(_QWORD *)(a1 + 128));
    }
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  }
}

- (void)setLayoutSize:(double)a3
{
  BOOL v3;

  if (a1)
  {
    v3 = *(double *)(a1 + 312) == a2 && *(double *)(a1 + 320) == a3;
    if (!v3 || (*(_BYTE *)(a1 + 104) & 1) == 0)
    {
      *(double *)(a1 + 312) = a2;
      *(double *)(a1 + 320) = a3;
      -[_UINavigationBarLayout updateLayout](a1);
    }
  }
}

- (void)setStandardBackgroundViewLayout:(id *)a1
{
  id v4;
  id v5;

  v4 = a2;
  if (a1 && a1[24] != v4)
  {
    v5 = v4;
    objc_storeStrong(a1 + 24, a2);
    objc_msgSend(a1, "_updateLayoutOutputs");
    v4 = v5;
  }

}

- (void)layoutViews
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double MinX;
  double MaxX;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double MaxY;
  double v55;
  double v56;
  double v57;
  CGFloat recta;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 120))
      objc_msgSend(*(id *)(a1 + 120), "setFrame:", -[_UINavigationBarLayout _layoutFrameFor:withOrder:](a1, *(void **)(a1 + 16), 95));
    if (*(_QWORD *)(a1 + 256))
      objc_msgSend(*(id *)(a1 + 256), "setFrame:", -[_UINavigationBarLayout _layoutFrameFor:withOrder:](a1, *(void **)(a1 + 64), 90));
    if (*(_QWORD *)(a1 + 128))
    {
      v2 = -[_UINavigationBarLayout contentViewLayoutFrame](a1);
      v6 = v2;
      v7 = v3;
      v8 = v4;
      v9 = v5;
      v10 = *(void **)(a1 + 136);
      if (v10)
      {
        objc_msgSend(v10, "frame");
        objc_msgSend(*(id *)(a1 + 136), "setFrame:");
        objc_msgSend(*(id *)(a1 + 136), "superview");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "safeAreaInsets");
        v13 = v12;
        v15 = v14;
        v59.origin.x = v6;
        v59.origin.y = v7;
        v59.size.width = v8;
        v59.size.height = v9;
        MinX = CGRectGetMinX(v59);
        if (MinX >= v13)
          v13 = MinX;
        v60.origin.x = v6;
        v60.origin.y = v7;
        v60.size.width = v8;
        v60.size.height = v9;
        MaxX = CGRectGetMaxX(v60);
        objc_msgSend(v11, "bounds");
        v18 = CGRectGetMaxX(v61) - v15;
        if (MaxX < v18)
          v18 = MaxX;
        v19 = v18 - v13;
        v20 = *(void **)(a1 + 136);
        objc_msgSend(v20, "superview");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "convertRect:fromView:", v21, v13, v7, v19, v9);
        objc_msgSend(*(id *)(a1 + 128), "setFrame:");

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 128), "setFrame:", v2, v3, v4, v5);
      }
    }
    if (*(_QWORD *)(a1 + 224))
    {
      v22 = -[_UINavigationBarLayout _layoutFrameFor:withOrder:](a1, *(void **)(a1 + 40), 70);
      v24 = v23;
      v26 = v25;
      objc_msgSend(*(id *)(a1 + 224), "fullHeightOfRefreshControl");
      v28 = v27;
      objc_msgSend(*(id *)(a1 + 224), "hostContainerView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

    }
    if (*(_QWORD *)(a1 + 144))
      objc_msgSend(*(id *)(a1 + 144), "setFrame:", -[_UINavigationBarLayout _layoutFrameFor:withOrder:](a1, *(void **)(a1 + 32), 60));
    if (*(_QWORD *)(a1 + 240)
      && !+[UIView _hasInProcessProgressAnimator](UIView, "_hasInProcessProgressAnimator"))
    {
      v30 = -[_UINavigationBarLayout searchBarLayoutFrame](a1);
      v32 = v31;
      v34 = v33;
      v36 = v35;
      objc_msgSend(*(id *)(a1 + 240), "_viewStackedInNavigationBar");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setFrame:", v30, v32, v34, v36);

    }
    if (*(_QWORD *)(a1 + 264))
      objc_msgSend(*(id *)(a1 + 264), "setFrame:", -[_UINavigationBarLayout _layoutFrameFor:withOrder:](a1, *(void **)(a1 + 72), 30));
    if (*(_QWORD *)(a1 + 232))
    {
      v38 = *MEMORY[0x1E0C9D648];
      v39 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v40 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      objc_msgSend(*(id *)(a1 + 144), "frame");
      recta = v41;
      v43 = v42;
      v45 = v44;
      v47 = v46;
      objc_msgSend(*(id *)(a1 + 144), "directionalLayoutMargins");
      v49 = v48;
      v51 = *(double *)(a1 + 312) - v48 - v50;
      objc_msgSend(*(id *)(a1 + 232), "sizeThatFits:", v51, v40);
      v53 = v52;
      objc_msgSend(*(id *)(a1 + 232), "setBounds:", v38, v39, v51, v52);
      v62.origin.x = recta;
      v62.origin.y = v43;
      v62.size.width = v45;
      v62.size.height = v47;
      MaxY = CGRectGetMaxY(v62);
      objc_msgSend(*(id *)(a1 + 144), "restingHeightOfTitleView");
      v56 = MaxY - v55;
      objc_msgSend(*(id *)(a1 + 232), "_firstLineBaseline");
      objc_msgSend(*(id *)(a1 + 232), "setCenter:", v49 + v51 * 0.5, v53 * 0.5 + v56 - v57);
    }
  }
}

- (double)backgroundViewLayoutFrame
{
  if (a1)
    return *MEMORY[0x1E0C9D648];
  else
    return 0.0;
}

- (double)contentViewLayoutFrame
{
  if (!a1)
    return 0.0;
  if (!*(_BYTE *)(a1 + 108))
    return -[_UINavigationBarLayout _layoutFrameFor:withOrder:](a1, *(void **)(a1 + 24), 80);
  -[_UIBarInsertLayoutData verticalOrigin](*(_QWORD *)(a1 + 32));
  return 0.0;
}

- (double)_layoutFrameFor:(uint64_t)a3 withOrder:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (v5 && (*((_BYTE *)v5 + 8) & 8) != 0)
    {
      -[_UIBarInsertLayoutData verticalOrigin]((uint64_t)v5);
    }
    else
    {
      +[_UIBarInsertLayoutData layoutPriorToItemWithOrder:inLayouts:]((uint64_t)_UIBarInsertLayoutData, a3, *(void **)(a1 + 88));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v7)
        -[_UIBarInsertLayoutData verticalOrigin](v7);

    }
  }

  return 0.0;
}

- (double)searchBarLayoutFrame
{
  if (a1)
    return -[_UINavigationBarLayout _layoutFrameFor:withOrder:](a1, *(void **)(a1 + 48), 50);
  else
    return 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomPalette, 0);
  objc_storeStrong((id *)&self->_topPalette, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_weeTitleLabel, 0);
  objc_storeStrong((id *)&self->_refreshControlHost, 0);
  objc_storeStrong((id *)&self->_standardBackgroundViewLayout, 0);
  objc_storeStrong((id *)&self->_compactBackgroundViewLayout, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_largeTitleViewLayout, 0);
  objc_storeStrong((id *)&self->_contentViewLayout, 0);
  objc_storeStrong((id *)&self->_contentViewVisualProvider, 0);
  objc_storeStrong((id *)&self->_largeTitleView, 0);
  objc_storeStrong((id *)&self->_animationContentClippingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_promptView, 0);
  objc_storeStrong((id *)&self->_restingHeights, 0);
  objc_storeStrong((id *)&self->_stackingOrderedLayout, 0);
  objc_storeStrong((id *)&self->_priorityOrderedLayout, 0);
  objc_storeStrong((id *)&self->_bottomPaletteLayoutData, 0);
  objc_storeStrong((id *)&self->_topPaletteLayoutData, 0);
  objc_storeStrong((id *)&self->_scopeBarLayoutData, 0);
  objc_storeStrong((id *)&self->_searchBarLayoutData, 0);
  objc_storeStrong((id *)&self->_refreshControlLayoutData, 0);
  objc_storeStrong((id *)&self->_largeTitleLayoutData, 0);
  objc_storeStrong((id *)&self->_contentLayoutData, 0);
  objc_storeStrong((id *)&self->_promptLayoutData, 0);
  objc_storeStrong((id *)&self->_topWhitespaceLayoutData, 0);
}

- (void)restingHeights
{
  void **v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = a1[12];
    if (!v2)
    {
      +[_UIBarInsertLayoutData calculateRestingHeightsForLayouts:]((uint64_t)_UIBarInsertLayoutData, a1[11]);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = v1[12];
      v1[12] = (void *)v3;

      v2 = v1[12];
    }
    a1 = v2;
  }
  return a1;
}

- (uint64_t)removeAllViews
{
  id *v1;
  void *v2;
  void *v3;

  if (result)
  {
    v1 = (id *)result;
    objc_msgSend(*(id *)(result + 120), "removeFromSuperview");
    objc_msgSend(v1[28], "stopAnimations");
    objc_msgSend(v1[28], "hostContainerView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeFromSuperview");

    objc_msgSend(v1[16], "removeFromSuperview");
    objc_msgSend(v1[17], "removeFromSuperview");
    objc_msgSend(v1[18], "removeFromSuperview");
    objc_msgSend(v1[22], "removeFromSuperview");
    objc_msgSend(v1[29], "removeFromSuperview");
    objc_msgSend(v1[30], "_viewStackedInNavigationBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    objc_msgSend(v1[32], "removeFromSuperview");
    return objc_msgSend(v1[33], "removeFromSuperview");
  }
  return result;
}

- (void)setCompactBackgroundViewLayout:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 184), a2);
}

- (void)setContentViewLayout:(id *)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    objc_storeStrong(a1 + 20, a2);
    objc_msgSend(a1, "_updateContentViewLayoutItem");
  }

}

- (void)setLargeTitleViewLayout:(id *)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    objc_storeStrong(a1 + 21, a2);
    objc_msgSend(a1, "_updateLargeTitleViewLayoutItem");
  }

}

- (CGRect)topWhitespaceLayoutFrame
{
  _UIBarInsertLayoutData *topWhitespaceLayoutData;
  CGFloat width;
  double inserted;
  double collapsingHeight;
  double v6;
  double v7;
  CGRect result;

  topWhitespaceLayoutData = self->_topWhitespaceLayoutData;
  if (topWhitespaceLayoutData)
  {
    width = self->_layoutSize.width;
    inserted = -[_UIBarInsertLayoutData verticalOrigin]((uint64_t)self->_topWhitespaceLayoutData);
    collapsingHeight = topWhitespaceLayoutData->_collapsingHeight;
  }
  else
  {
    width = 0.0;
    collapsingHeight = 0.0;
    inserted = 0.0;
  }
  v6 = 0.0;
  v7 = width;
  result.size.height = collapsingHeight;
  result.size.width = v7;
  result.origin.y = inserted;
  result.origin.x = v6;
  return result;
}

- (void)interleaveViewsWithLayout:(void *)a3 inNavigationBar:
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[20];

  v20[19] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel_interleaveViewsWithLayout_inNavigationBar_, a1, CFSTR("_UINavigationBarLayout.m"), 1008, CFSTR("otherLayout==nil"));

    }
    v20[2] = (id)objc_msgSend(*(id *)(a1 + 224), "hostContainerView", *(_QWORD *)(a1 + 176), *((_QWORD *)v5 + 22));
    v7 = (id)objc_msgSend(*((id *)v5 + 28), "hostContainerView");
    v8 = *(_QWORD *)(a1 + 256);
    v9 = *(_QWORD *)(a1 + 264);
    v20[3] = v7;
    v20[4] = v8;
    v10 = *((_QWORD *)v5 + 33);
    v20[5] = *((_QWORD *)v5 + 32);
    v20[6] = v9;
    v20[7] = v10;
    v20[8] = (id)objc_msgSend(*(id *)(a1 + 240), "_viewStackedInNavigationBar");
    v11 = (id)objc_msgSend(*((id *)v5 + 30), "_viewStackedInNavigationBar");
    v12 = *(_QWORD *)(a1 + 136);
    v13 = *(_QWORD *)(a1 + 144);
    v20[9] = v11;
    v20[10] = v13;
    v20[11] = *((_QWORD *)v5 + 18);
    if (!v12)
      v12 = *(_QWORD *)(a1 + 128);
    v20[12] = v12;
    v14 = *((_QWORD *)v5 + 17);
    if (!v14)
      v14 = *((_QWORD *)v5 + 16);
    v16 = *(_QWORD *)(a1 + 120);
    v15 = *(void **)(a1 + 128);
    v20[13] = v14;
    v20[14] = v16;
    v17 = *(_QWORD *)(a1 + 232);
    v20[15] = *((_QWORD *)v5 + 15);
    v20[16] = v17;
    v20[17] = *((_QWORD *)v5 + 29);
    objc_msgSend(v15, "assistant");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[18] = (id)objc_msgSend(v18, "previewContainer");

    objc_msgSend(v6, "_ensureViewsAreInstalledInRelativeOrder:viewCount:insertionStartIndex:", v20, 19, 0);
  }

}

- (void)iterateLayoutViews:(uint64_t)a1
{
  void (**v3)(id, id, double);
  void *v4;
  void *v5;
  id v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  void *v12;
  id v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  double v26;
  void *v27;
  id v28;
  double v29;
  void *v30;
  void (**v31)(id, id, double);

  v3 = a2;
  if (a1)
  {
    v31 = v3;
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", sel_iterateLayoutViews_, a1, CFSTR("_UINavigationBarLayout.m"), 1076, CFSTR("Block has to be non-nil or this method is pointless"));

    }
    v4 = *(void **)(a1 + 120);
    if (v4)
    {
      v5 = *(void **)(a1 + 16);
      v6 = v4;
      v7 = -[_UINavigationBarLayout _layoutFrameFor:withOrder:](a1, v5, 95);
      v31[2](v31, v6, v7);

    }
    v8 = *(void **)(a1 + 256);
    if (v8)
    {
      v9 = *(void **)(a1 + 64);
      v10 = v8;
      v11 = -[_UINavigationBarLayout _layoutFrameFor:withOrder:](a1, v9, 90);
      v31[2](v31, v10, v11);

    }
    v12 = *(void **)(a1 + 128);
    if (v12)
    {
      v13 = v12;
      v14 = -[_UINavigationBarLayout contentViewLayoutFrame](a1);
      v31[2](v31, v13, v14);

    }
    objc_msgSend(*(id *)(a1 + 224), "hostContainerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = -[_UINavigationBarLayout _layoutFrameFor:withOrder:](a1, *(void **)(a1 + 40), 70);
      v31[2](v31, v15, v16);
    }

    v17 = *(void **)(a1 + 144);
    if (v17)
    {
      v18 = *(void **)(a1 + 32);
      v19 = v17;
      v20 = -[_UINavigationBarLayout _layoutFrameFor:withOrder:](a1, v18, 60);
      v31[2](v31, v19, v20);

    }
    objc_msgSend(*(id *)(a1 + 240), "_viewStackedInNavigationBar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = -[_UINavigationBarLayout searchBarLayoutFrame](a1);
      v31[2](v31, v21, v22);
    }

    v23 = *(void **)(a1 + 264);
    if (v23)
    {
      v24 = *(void **)(a1 + 72);
      v25 = v23;
      v26 = -[_UINavigationBarLayout _layoutFrameFor:withOrder:](a1, v24, 30);
      v31[2](v31, v25, v26);

    }
    v27 = *(void **)(a1 + 232);
    v3 = v31;
    if (v27)
    {
      v28 = v27;
      v29 = -[_UINavigationBarLayout searchBarLayoutFrame](a1);
      v31[2](v31, v28, v29);

      v3 = v31;
    }
  }

}

- (double)layoutHeightRevealingPart:(id *)a1
{
  double v2;
  id *v4;
  _QWORD *v5;
  _BYTE *v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = 0.0;
  if (!a1)
    return v2;
  switch(a2)
  {
    case 1:
      v4 = a1 + 3;
      goto LABEL_15;
    case 2:
      v4 = a1 + 4;
      goto LABEL_15;
    case 3:
      v4 = a1 + 2;
      goto LABEL_15;
    case 4:
      goto LABEL_11;
    case 5:
      v4 = a1 + 7;
      v6 = a1[7];
      if (v6)
      {
        if ((v6[8] & 8) == 0)
          v4 = a1 + 6;
      }
      else
      {
LABEL_11:
        v4 = a1 + 6;
      }
      goto LABEL_15;
    case 6:
      v4 = a1 + 8;
      goto LABEL_15;
    case 7:
      v4 = a1 + 9;
      goto LABEL_15;
    case 8:
      v4 = a1 + 5;
LABEL_15:
      v7 = *v4;
      v5 = v7;
      if (!v7 || (v7[1] & 8) == 0)
        goto LABEL_31;
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = a1[10];
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (!v9)
        goto LABEL_30;
      v10 = v9;
      v11 = *(_QWORD *)v18;
      break;
    default:
      v5 = 0;
      goto LABEL_31;
  }
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v18 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
      v14 = 0.0;
      if (v13)
      {
        if (*(_QWORD *)(v13 + 72) >= v5[9])
        {
          v15 = 40;
        }
        else
        {
          if ((*(_BYTE *)(v13 + 8) & 1) != 0)
            goto LABEL_28;
          v15 = 32;
        }
        v14 = *(double *)(v13 + v15);
      }
LABEL_28:
      v2 = v2 + v14;
      ++v12;
    }
    while (v10 != v12);
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v10);
LABEL_30:

LABEL_31:
  return v2;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  _UINavigationBarContentView *contentView;
  _UINavigationBarLargeTitleView *largeTitleView;
  _UIBarInsertLayoutData *largeTitleLayoutData;
  _UINavigationBarLargeTitleViewLayout *largeTitleViewLayout;
  double largeTitleExposure;
  double largeTitleTransitionProgress;
  void *v12;
  UISearchBar *searchBar;
  const __CFString *v14;
  _UIBarBackground *backgroundView;
  const __CFString *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_UINavigationBarLayout;
  -[_UINavigationBarLayout description](&v18, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  NSStringFromCGSize(self->_layoutSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" layoutSize=%@ priority=%p order=%p"), v5, self->_priorityOrderedLayout, self->_stackingOrderedLayout);

  if (self->_promptView)
    objc_msgSend(v4, "appendFormat:", CFSTR(" prompt{view=%p data=%p}"), self->_promptView, self->_promptLayoutData);
  contentView = self->_contentView;
  if (contentView)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(" content{view=%p data=%p layout=%p}"), contentView, self->_contentLayoutData, self->_contentViewLayout);
    if (self->_animationContentClippingView)
      objc_msgSend(v4, "appendString:", CFSTR("[CLIPPED]"));
  }
  if (self->_refreshControlHost)
    objc_msgSend(v4, "appendFormat:", CFSTR(" refreshControl{host=%p layout=%p}"), self->_refreshControlHost, self->_refreshControlLayoutData);
  largeTitleView = self->_largeTitleView;
  if (largeTitleView)
  {
    largeTitleLayoutData = self->_largeTitleLayoutData;
    largeTitleViewLayout = self->_largeTitleViewLayout;
    largeTitleExposure = self->_largeTitleExposure;
    largeTitleTransitionProgress = self->_largeTitleTransitionProgress;
    NSStringFromDirectionalEdgeInsets(self->_largeTitleViewInsets);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" largeTitle{view=%p data=%p layout=%p exposure=%f progress=%f insets=%@}"), largeTitleView, largeTitleLayoutData, largeTitleViewLayout, *(_QWORD *)&largeTitleExposure, *(_QWORD *)&largeTitleTransitionProgress, v12);

  }
  searchBar = self->_searchBar;
  if (searchBar)
  {
    if (self->_hidesSearchBarWhenScrolling)
      v14 = CFSTR(" hidesWhenScrolling");
    else
      v14 = &stru_1E16EDF20;
    objc_msgSend(v4, "appendFormat:", CFSTR(" searchBar{view=%p data=%p%@ scopeBarData=%p}"), searchBar, self->_searchBarLayoutData, v14, self->_scopeBarLayoutData);
  }
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    if (self->_backgroundCoversContentOnly)
      v16 = CFSTR(" coversContentOnly");
    else
      v16 = &stru_1E16EDF20;
    objc_msgSend(v4, "appendFormat:", CFSTR(" background{view=%p extension=%f%@}"), backgroundView, *(_QWORD *)&self->_backgroundExtension, v16);
  }
  if (self->_weeTitleLabel)
    objc_msgSend(v4, "appendFormat:", CFSTR(" weeTitleView=%p"), self->_weeTitleLabel);
  if (self->_topPalette)
    objc_msgSend(v4, "appendFormat:", CFSTR(" topPalette{view=%p data=%p}"), self->_topPalette, self->_topPaletteLayoutData);
  if (self->_bottomPalette)
    objc_msgSend(v4, "appendFormat:", CFSTR(" bottomPalette{view=%p data=%p}"), self->_bottomPalette, self->_bottomPaletteLayoutData);
  if (self->_useManualScrollEdgeAppearance)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(" manualScrollEdgeProgress=%f"), 1.0 - self->_manualScrollEdgeAppearanceProgress);
  }
  else if (self->_largeTitleView)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(" chromelessScrollEdgeProgress=%f"), *(_QWORD *)&self->_chromelessTransitionProgress);
  }
  return (NSString *)v4;
}

- (void)recordFromStateForTransition:(id)a3
{
  _UINavigationBarContentView *contentView;
  id v5;

  contentView = self->_contentView;
  v5 = a3;
  -[_UINavigationBarContentView recordFromStateForTransition:](contentView, "recordFromStateForTransition:", v5);
  -[_UINavigationBarLargeTitleView recordFromStateForTransition:](self->_largeTitleView, "recordFromStateForTransition:", v5);

}

- (void)prepareToRecordToState:(id)a3
{
  _UINavigationBarContentView *contentView;
  id v5;

  contentView = self->_contentView;
  v5 = a3;
  -[_UINavigationBarContentView prepareToRecordToState:](contentView, "prepareToRecordToState:", v5);
  -[_UINavigationBarLargeTitleView prepareToRecordToState:](self->_largeTitleView, "prepareToRecordToState:", v5);

}

- (void)recordToStateForTransition:(id)a3
{
  _UINavigationBarContentView *contentView;
  id v5;

  contentView = self->_contentView;
  v5 = a3;
  -[_UINavigationBarContentView recordToStateForTransition:](contentView, "recordToStateForTransition:", v5);
  -[_UINavigationBarLargeTitleView recordToStateForTransition:](self->_largeTitleView, "recordToStateForTransition:", v5);

}

- (void)ensureBackButtonTruncationOccursWithContext:(id)a3
{
  -[_UINavigationBarContentView ensureBackButtonTruncationOccursWithContext:](self->_contentView, "ensureBackButtonTruncationOccursWithContext:", a3);
}

- (void)finalizeStateFromTransition:(id)a3
{
  -[_UINavigationBarContentView adoptLayout:](self->_contentView, "adoptLayout:", self->_contentViewLayout);
  -[_UINavigationBarLargeTitleView adoptLayout:](self->_largeTitleView, "adoptLayout:", self->_largeTitleViewLayout);
}

- (void)setAnimationContentClippingView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 136), a2);
}

@end
