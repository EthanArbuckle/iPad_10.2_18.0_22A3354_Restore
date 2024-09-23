@implementation _UINavigationBarVisualProviderModernIOS

- (BOOL)topItemHasVariableHeight
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;

  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UINavigationBarVisualProviderModernIOS _ensureLayoutsConfiguredForEntry:](self, "_ensureLayoutsConfiguredForEntry:", v3);
    objc_msgSend(v3, "normalLayout");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
    {
      if (-[_UINavigationBarLayout isVariableHeight](v4))
      {
        v6 = 1;
LABEL_9:

        goto LABEL_10;
      }
      if (objc_msgSend(v3, "isSearchActive"))
      {
        objc_msgSend(v3, "searchLayout");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[_UINavigationBarLayout isVariableHeight]((_BOOL8)v7);

        goto LABEL_9;
      }
    }
    v6 = 0;
    goto LABEL_9;
  }
  v6 = 0;
LABEL_10:

  return v6;
}

- ($1AB5FA073B851C12C2339EC22442E995)layoutHeightsFittingWidth:(double)a3
{
  UINavigationItem *v5;
  void *v6;
  id v7;
  void *v8;
  UINavigationBar *v9;
  UINavigationBar *navigationBar;
  _QWORD *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  char v19;
  _UINavigationBarItemStack *stack;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v5 = self->super._itemForMeasuring;
  if (v5)
  {
    v6 = v5;
    -[UINavigationItem _stackEntry](v5, "_stackEntry");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_3;
    goto LABEL_16;
  }
  if (-[_UINavigationBarItemStack itemCount](self->super._stack, "itemCount"))
  {
    -[_UINavigationBarItemStack transitionAssistant](self->super._stack, "transitionAssistant");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "cancelledTransition");
    stack = self->super._stack;
    if ((v19 & 1) != 0)
      -[_UINavigationBarItemStack previousTopEntry](stack, "previousTopEntry");
    else
      -[_UINavigationBarItemStack topEntry](stack, "topEntry");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
LABEL_3:
      if (qword_1ECD78E30 != -1)
        dispatch_once(&qword_1ECD78E30, &__block_literal_global_602);
      if (!byte_1ECD78E12
        || (objc_msgSend(v7, "item"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v8, "_navigationBar"),
            v9 = (UINavigationBar *)objc_claimAutoreleasedReturnValue(),
            navigationBar = self->super._navigationBar,
            v9,
            v8,
            v9 == navigationBar))
      {
        -[_UINavigationBarVisualProviderModernIOS _ensureLayoutsConfiguredForEntry:forMeasuring:](self, "_ensureLayoutsConfiguredForEntry:forMeasuring:", v7, 1);
      }
      objc_msgSend(v7, "activeLayout");
      v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarLayout layoutForMeasuringWidth:](v11, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        goto LABEL_9;
      goto LABEL_17;
    }
LABEL_16:
    v7 = +[_UINavigationBarItemStackEntry newEntryForItem:](_UINavigationBarItemStackEntry, "newEntryForItem:", v6);
    -[_UINavigationBarVisualProviderModernIOS _ensureLayoutsConfiguredForEntry:forMeasuring:](self, "_ensureLayoutsConfiguredForEntry:forMeasuring:", v7, 1);
    objc_msgSend(v7, "activeLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarLayout setLayoutSize:]((uint64_t)v12, a3, 0.0);
    if (v12)
    {
LABEL_9:
      v13 = -[_UINavigationBarLayout layoutHeights]((uint64_t)v12);
      v15 = v14;
      v17 = v16;
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:
    -[UIView traitCollection](self->super._navigationBar, "traitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernIOS defaultBarHeightForTraitCollection:](self, "defaultBarHeightForTraitCollection:", v22);
    v13 = v23;

    v15 = v13;
    v17 = v13;
    goto LABEL_18;
  }
  -[UIView traitCollection](self->super._navigationBar, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProviderModernIOS defaultBarHeightForTraitCollection:](self, "defaultBarHeightForTraitCollection:", v6);
  v13 = v21;
  v15 = v21;
  v17 = v21;
LABEL_19:

  v24 = v13;
  v25 = v15;
  v26 = v17;
  result.var2 = v26;
  result.var1 = v25;
  result.var0 = v24;
  return result;
}

- (void)_ensureLayoutsConfiguredForEntry:(id)a3 forMeasuring:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UINavigationBar *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *v17;
  UINavigationBar *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  char v23;
  void *v24;
  int v25;
  void *v26;
  id v27;
  _BOOL4 v28;
  int v29;
  BOOL v30;
  char v31;
  BOOL v32;
  NSObject *v33;
  UINavigationBar *navigationBar;
  _UINavigationBarLayout *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  _UINavigationBarModernPromptView *promptView;
  void *v40;
  char v41;
  _UINavigationBarVisualProviderModernIOS *v42;
  _UINavigationBarVisualProviderModernIOS *v43;
  double backgroundAlpha;
  int v45;
  uint64_t v46;
  void *v47;
  UILabel *weeTitleLabel;
  BOOL v49;
  _UINavigationBarLayout *v50;
  char v51;
  _UINavigationBarModernPromptView *v52;
  char v53;
  char v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  int v63;
  uint64_t v64;
  void *v65;
  int v66;
  int v67;
  UINavigationBar *v68;
  UINavigationBar *v69;
  _BYTE *v70;
  _BYTE *v71;
  void *v72;
  uint8_t buf[4];
  UINavigationBar *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    if (!-[_UINavigationBarVisualProviderModernIOS _isInnerNavigationBarOfNestedNavigationController](self, "_isInnerNavigationBarOfNestedNavigationController"))
    {
      -[UIView window](self->super._navigationBar, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v6, "item");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_searchControllerIfAllowed");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "searchBar");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_navigationBar");
        v11 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
        if (v11
          || (a4
           || -[_UINavigationBarItemStack state](self->super._stack, "state") == 1
           || -[_UINavigationBarItemStack state](self->super._stack, "state") == 2)
          && (v11 = self->super._navigationBar) != 0)
        {
          -[UIView traitCollection](v11, "traitCollection");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v8, "_hasInlineSearchBarForTraits:", v12);

          v14 = v13;
          if ((_DWORD)v13 == objc_msgSend(v10, "_isHostedInlineByNavigationBar"))
            goto LABEL_16;
        }
        else
        {
          v14 = 0;
          v11 = 0;
          if ((objc_msgSend(v10, "_isHostedInlineByNavigationBar") & 1) == 0)
            goto LABEL_16;
        }
        v15 = v14;
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          {
            navigationBar = self->super._navigationBar;
            *(_DWORD *)buf = 138412290;
            v74 = navigationBar;
            _os_log_fault_impl(&dword_185066000, v33, OS_LOG_TYPE_FAULT, "UINavigationBar has changed horizontal size class without updating search bar to new placement. Fixing, but delegate searchBarPlacement callbacks have been skipped. navigationBar = %@", buf, 0xCu);
          }

        }
        else
        {
          v16 = _ensureLayoutsConfiguredForEntry_forMeasuring____s_category;
          if (!_ensureLayoutsConfiguredForEntry_forMeasuring____s_category)
          {
            v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v16, (unint64_t *)&_ensureLayoutsConfiguredForEntry_forMeasuring____s_category);
          }
          v17 = *(NSObject **)(v16 + 8);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = self->super._navigationBar;
            *(_DWORD *)buf = 138412290;
            v74 = v18;
            _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "UINavigationBar has changed horizontal size class without updating search bar to new placement. Fixing, but delegate searchBarPlacement callbacks have been skipped. navigationBar = %@", buf, 0xCu);
          }
        }
        LODWORD(v14) = v15;
        objc_msgSend(v10, "_setHostedInlineByNavigationBar:", v15);
LABEL_16:
        objc_msgSend(v6, "normalLayout");
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "searchLayout");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v10)
          v22 = v20 == 0;
        else
          v22 = 0;
        v23 = v22;
        if (!v10)
        {
          v29 = 0;
LABEL_30:
          if (self->_transitionContext)
            v30 = v19 == 0;
          else
            v30 = 1;
          if (v30)
            v31 = 1;
          else
            v31 = v23;
          if ((v31 & 1) == 0 && !v29)
            goto LABEL_105;
LABEL_38:
          if (v19)
            goto LABEL_39;
LABEL_46:
          v35 = objc_alloc_init(_UINavigationBarLayout);
          v19 = (uint64_t)v35;
          if (v35)
          {
            v35->_apiVersion = self->_appearanceAPIVersion;
            v35->_representedSearchLayoutState = 2;
          }
          v69 = v11;
          objc_msgSend(v6, "setNormalLayout:", v35);
          v32 = -[UINavigationBar _effectiveDelegateSupportsScrollEdgeTransitionProgress](self->super._navigationBar, "_effectiveDelegateSupportsScrollEdgeTransitionProgress");
          if (!v19)
          {
            objc_msgSend(v8, "_isManualScrollEdgeAppearanceEnabled");
            v36 = 1;
LABEL_50:
            -[_UINavigationBarVisualProviderModernIOS _contentBackgroundExtension](self, "_contentBackgroundExtension", v9);
            v38 = v37;
            objc_msgSend(v8, "prompt");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v36 & 1) == 0)
              *(_QWORD *)(v19 + 200) = v38;
            -[_UINavigationBarLayout setBackgroundView:](v19, self->_backgroundView);
            if (v72)
              promptView = self->_promptView;
            else
              promptView = 0;
            -[_UINavigationBarLayout setPromptView:](v19, promptView);
            if ((v36 & 1) == 0)
              *(_BYTE *)(v19 + 114) = v14;
            if ((_DWORD)v14)
              v40 = 0;
            else
              v40 = v10;
            -[_UINavigationBarLayout setSearchBar:](v19, v40);
            -[_UINavigationBarLayout setHidesSearchBarWhenScrolling:](v19, objc_msgSend(v8, "_hidesSearchBarWhenScrollingIfAllowed"));
            v41 = objc_msgSend(v8, "_preserveSearchBarAcrossTransitions");
            v67 = v14;
            if (v36)
            {
              objc_msgSend(v8, "_backgroundHidden");
            }
            else
            {
              *(_BYTE *)(v19 + 115) = v41;
              *(_BYTE *)(v19 + 110) = objc_msgSend(v8, "_backgroundHidden");
            }
            v42 = self;
            v43 = v42;
            backgroundAlpha = v42->_backgroundAlpha;
            if (!v42->_usesBarBackground)
            {
              -[_UINavigationBarVisualProviderModernIOS alphaForBarBackground:preferredAlpha:navigationItem:](v42, "alphaForBarBackground:preferredAlpha:navigationItem:", self->_backgroundView, v8, backgroundAlpha);
              v43->_backgroundAlpha = backgroundAlpha;
            }
            -[_UINavigationBarVisualProviderModernIOS applyBarBackground:alpha:](v43, "applyBarBackground:alpha:", self->_backgroundView, backgroundAlpha);

            v45 = -[_UINavigationBarVisualProviderModernIOS useManualScrollEdgeAppearanceForItem:](v43, "useManualScrollEdgeAppearanceForItem:", v8);
            if ((v36 & 1) != 0)
            {
              objc_msgSend(v8, "_manualScrollEdgeAppearanceProgress");
            }
            else
            {
              if (*(unsigned __int8 *)(v19 + 111) != v45)
              {
                *(_BYTE *)(v19 + 111) = v45;
                objc_msgSend((id)v19, "_updateLayoutOutputs");
              }
              objc_msgSend(v8, "_manualScrollEdgeAppearanceProgress");
              *(_QWORD *)(v19 + 216) = v46;
              if (*(_BYTE *)(v19 + 111))
                objc_msgSend((id)v19, "_updateLayoutOutputs");
            }
            -[_UINavigationBarVisualProvider contentViewVisualProvider](v43, "contentViewVisualProvider");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UINavigationBarLayout setContentViewVisualProvider:](v19, v47);

            -[_UINavigationBarLayout setContentView:](v19, v43->_contentView);
            objc_msgSend(v8, "_topPalette");
            v71 = (_BYTE *)objc_claimAutoreleasedReturnValue();
            -[_UINavigationBarLayout setTopPalette:](v19, v71);
            objc_msgSend(v8, "_bottomPalette");
            v70 = (_BYTE *)objc_claimAutoreleasedReturnValue();
            -[_UINavigationBarLayout setBottomPalette:](v19, v70);
            if (-[_UINavigationBarVisualProviderModernIOS _stackWantsLargeTitleDisplayedForItem:hideLargeTitleForActiveSearch:](v43, "_stackWantsLargeTitleDisplayedForItem:hideLargeTitleForActiveSearch:", v8, 0))
            {
              -[_UINavigationBarLayout setLargeTitleView:](v19, v43->_largeTitleView);
              weeTitleLabel = v43->_weeTitleLabel;
            }
            else
            {
              -[_UINavigationBarLayout setLargeTitleView:](v19, 0);
              weeTitleLabel = 0;
            }
            -[_UINavigationBarLayout setWeeTitleLabel:](v19, weeTitleLabel);
            if (!v10)
            {
              v9 = v65;
              v11 = v69;
LABEL_104:

LABEL_105:
              goto LABEL_106;
            }
            if (v21)
            {
              v49 = -[UINavigationBar _effectiveDelegateSupportsScrollEdgeTransitionProgress](self->super._navigationBar, "_effectiveDelegateSupportsScrollEdgeTransitionProgress");
            }
            else
            {
              v50 = objc_alloc_init(_UINavigationBarLayout);
              v21 = (uint64_t)v50;
              if (v50)
              {
                v50->_apiVersion = v43->_appearanceAPIVersion;
                v50->_representedSearchLayoutState = 3;
              }
              objc_msgSend(v6, "setSearchLayout:", v50);
              v49 = -[UINavigationBar _effectiveDelegateSupportsScrollEdgeTransitionProgress](self->super._navigationBar, "_effectiveDelegateSupportsScrollEdgeTransitionProgress");
              if (!v21)
              {
                v51 = 1;
LABEL_80:
                -[_UINavigationBarLayout setBackgroundView:](v21, self->_backgroundView);
                if (v72)
                  v52 = v43->_promptView;
                else
                  v52 = 0;
                v9 = v65;
                -[_UINavigationBarLayout setPromptView:](v21, v52);
                if ((v51 & 1) == 0)
                  *(_BYTE *)(v21 + 114) = v67;
                -[_UINavigationBarLayout setSearchBar:](v21, v10);
                v53 = objc_msgSend(v8, "_preserveSearchBarAcrossTransitions");
                if ((v51 & 1) == 0)
                  *(_BYTE *)(v21 + 115) = v53;
                -[_UINavigationBarLayout setHidesSearchBarWhenScrolling:](v21, 0);
                v54 = objc_msgSend(v8, "_backgroundHidden");
                if ((v51 & 1) == 0)
                  *(_BYTE *)(v21 + 110) = v54;
                -[_UINavigationBarVisualProvider contentViewVisualProvider](v43, "contentViewVisualProvider");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                -[_UINavigationBarLayout setContentViewVisualProvider:](v21, v55);

                if (objc_msgSend(v65, "_hidesNavigationBarDuringPresentationRespectingInlineSearch"))
                {
                  -[_UINavigationBarLayout setContentView:](v21, 0);
                }
                else
                {
                  if ((v36 & 1) != 0)
                    v56 = 0;
                  else
                    v56 = *(void **)(v19 + 128);
                  v57 = v56;
                  -[_UINavigationBarLayout setContentView:](v21, v57);

                  if (!v67)
                  {
                    if ((v36 & 1) != 0)
                    {
                      -[_UINavigationBarLayout setLargeTitleView:](v21, 0);
                      v59 = 0;
                    }
                    else
                    {
                      v58 = *(id *)(v19 + 144);
                      -[_UINavigationBarLayout setLargeTitleView:](v21, v58);

                      v59 = *(void **)(v19 + 232);
                    }
                    v11 = v69;
                    v60 = v59;
                    -[_UINavigationBarLayout setWeeTitleLabel:](v21, v60);

LABEL_98:
                    -[_UINavigationBarPalette _paletteForSearch](v71);
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_UINavigationBarLayout setTopPalette:](v21, v61);

                    -[_UINavigationBarPalette _paletteForSearch](v70);
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_UINavigationBarLayout setBottomPalette:](v21, v62);

                    if (-[_UINavigationBarVisualProviderModernIOS alwaysEvaluateChromelessTransitionProgress](v43, "alwaysEvaluateChromelessTransitionProgress"))
                    {
                      v63 = -[_UINavigationBarVisualProviderModernIOS useManualScrollEdgeAppearanceForItem:](v43, "useManualScrollEdgeAppearanceForItem:", v8);
                      if ((v51 & 1) != 0)
                      {
                        objc_msgSend(v8, "_manualScrollEdgeAppearanceProgress");
                      }
                      else
                      {
                        if (*(unsigned __int8 *)(v21 + 111) != v63)
                        {
                          *(_BYTE *)(v21 + 111) = v63;
                          objc_msgSend((id)v21, "_updateLayoutOutputs");
                        }
                        objc_msgSend(v8, "_manualScrollEdgeAppearanceProgress");
                        *(_QWORD *)(v21 + 216) = v64;
                        if (*(_BYTE *)(v21 + 111))
                          objc_msgSend((id)v21, "_updateLayoutOutputs");
                      }
                    }
                    goto LABEL_104;
                  }
                }
                -[_UINavigationBarLayout setLargeTitleView:](v21, 0);
                -[_UINavigationBarLayout setWeeTitleLabel:](v21, 0);
                v11 = v69;
                goto LABEL_98;
              }
            }
            v51 = 0;
            *(_BYTE *)(v21 + 113) = v49;
            *(_QWORD *)(v21 + 200) = v38;
            goto LABEL_80;
          }
LABEL_49:
          *(_BYTE *)(v19 + 113) = v32;
          v36 = 0;
          *(_BYTE *)(v19 + 112) = objc_msgSend(v8, "_isManualScrollEdgeAppearanceEnabled");
          goto LABEL_50;
        }
        if (v19)
        {
          if (((v14 ^ (*(_BYTE *)(v19 + 114) != 0)) & 1) != 0)
          {
LABEL_39:
            v69 = v11;
            v32 = -[UINavigationBar _effectiveDelegateSupportsScrollEdgeTransitionProgress](self->super._navigationBar, "_effectiveDelegateSupportsScrollEdgeTransitionProgress");
            goto LABEL_49;
          }
          if (v20)
          {
LABEL_26:
            if (((v14 ^ (*(_BYTE *)(v20 + 114) != 0)) & 1) != 0)
              goto LABEL_38;
            v66 = v14;
            v68 = v11;
            v24 = v9;
            v25 = objc_msgSend(v9, "_hidesNavigationBarDuringPresentationRespectingInlineSearch");
            v26 = *(void **)(v21 + 128);
            goto LABEL_28;
          }
          if ((v14 & 1) != 0)
            goto LABEL_39;
        }
        else
        {
          if ((v14 & 1) != 0)
            goto LABEL_46;
          if (v20)
            goto LABEL_26;
        }
        v66 = v14;
        v68 = v11;
        v24 = v9;
        v25 = objc_msgSend(v9, "_hidesNavigationBarDuringPresentationRespectingInlineSearch");
        v26 = 0;
LABEL_28:
        v27 = v26;
        v28 = v27 == 0;

        v29 = v25 ^ v28;
        v9 = v24;
        v11 = v68;
        LODWORD(v14) = v66;
        goto LABEL_30;
      }
    }
  }
LABEL_106:

}

- (BOOL)_stackWantsLargeTitleDisplayedForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "_stackEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isSearchActive") & 1) != 0)
  {
    objc_msgSend(v4, "_searchControllerIfAllowed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_UINavigationBarVisualProviderModernIOS _stackWantsLargeTitleDisplayedForItem:hideLargeTitleForActiveSearch:](self, "_stackWantsLargeTitleDisplayedForItem:hideLargeTitleForActiveSearch:", v4, objc_msgSend(v6, "hidesNavigationBarDuringPresentation"));

  }
  else
  {
    v7 = -[_UINavigationBarVisualProviderModernIOS _stackWantsLargeTitleDisplayedForItem:hideLargeTitleForActiveSearch:](self, "_stackWantsLargeTitleDisplayedForItem:hideLargeTitleForActiveSearch:", v4, 0);
  }

  return v7;
}

- (BOOL)_stackWantsLargeTitleDisplayedForItem:(id)a3 hideLargeTitleForActiveSearch:(BOOL)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  v7 = 0;
  if (-[_UINavigationBarVisualProviderModernIOS allowLargeTitleView](self, "allowLargeTitleView") && !a4)
    v7 = -[_UINavigationBarVisualProviderModernIOS _useLargeTitleForDisplayMode:](self, "_useLargeTitleForDisplayMode:", -[_UINavigationBarItemStack effectiveDisplayModeForItemInCurrentStack:](self->super._stack, "effectiveDisplayModeForItemInCurrentStack:", v6));

  return v7;
}

- (BOOL)allowLargeTitleView
{
  _BOOL4 v3;

  v3 = -[_UINavigationBarVisualProviderModernIOS _allowLargeTitleView](self, "_allowLargeTitleView");
  if (v3)
    LOBYTE(v3) = -[_UINavigationBarVisualProviderModernIOS largeTitleStyle](self, "largeTitleStyle") == 0;
  return v3;
}

- (BOOL)_allowLargeTitleView
{
  void *v3;
  char v4;
  UINavigationBar *v5;

  -[UIView traitCollection](self->super._navigationBar, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "verticalSizeClass") == 1)
  {
    v4 = 0;
  }
  else
  {
    v5 = self->super._navigationBar;
    if (qword_1ECD78E28 != -1)
      dispatch_once(&qword_1ECD78E28, &__block_literal_global_67);
    if (_MergedGlobals_131 == 1)
      v4 = HIBYTE(_MergedGlobals_131);
    else
      v4 = -[UINavigationBar prefersLargeTitles](v5, "prefersLargeTitles");

  }
  return v4;
}

- (unint64_t)largeTitleStyle
{
  return 0;
}

- (BOOL)useManualScrollEdgeAppearanceForItem:(id)a3
{
  id v4;
  char v5;
  void *v6;
  char v7;
  char v8;

  v4 = a3;
  if ((objc_msgSend(v4, "_alwaysUseManualScrollEdgeAppearance") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "_searchControllerIfAllowed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_msgSend(v4, "_hidesSearchBarWhenScrollingIfAllowed");
    else
      v7 = 0;

    v5 = v7 | -[_UINavigationBarVisualProviderModernIOS _stackWantsLargeTitleDisplayedForItem:](self, "_stackWantsLargeTitleDisplayedForItem:", v4);
  }
  v8 = -[_UINavigationBarVisualProviderModernIOS alwaysEvaluateChromelessTransitionProgress](self, "alwaysEvaluateChromelessTransitionProgress");
  if ((v8 & 1) == 0 && (v5 & 1) == 0)
  {
    if (-[_UINavigationBarVisualProviderModernIOS forceScrollEdgeAppearance](self, "forceScrollEdgeAppearance"))
      v8 = 1;
    else
      v8 = objc_msgSend(v4, "_isManualScrollEdgeAppearanceEnabled");
  }

  return v8;
}

- (BOOL)alwaysEvaluateChromelessTransitionProgress
{
  int v3;

  v3 = _UIBarsApplyChromelessEverywhere();
  if (v3)
    LOBYTE(v3) = -[UINavigationBar _effectiveDelegateSupportsScrollEdgeTransitionProgress](self->super._navigationBar, "_effectiveDelegateSupportsScrollEdgeTransitionProgress");
  return v3;
}

- (void)applyBarBackground:(id)a3 alpha:(double)a4
{
  id v6;
  double v7;
  id v8;

  v6 = a3;
  if (!self->_usesBarBackground)
  {
    v8 = v6;
    objc_msgSend(v6, "alpha");
    v6 = v8;
    if (v7 != a4)
    {
      objc_msgSend(v8, "setAlpha:", a4);
      v6 = v8;
    }
  }

}

- (double)_contentBackgroundExtension
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;

  v3 = 0.0;
  if (-[UINavigationBar barPosition](self->super._navigationBar, "barPosition") == 3)
  {
    -[UINavigationBar _overrideBackgroundExtension](self->super._navigationBar, "_overrideBackgroundExtension");
    v3 = v4;
    if (v4 == 0.0)
    {
      -[UIView superview](self->super._navigationBar, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "safeAreaInsets");
        v3 = v7;
      }
      else
      {
        v3 = 0.0;
      }

    }
  }
  return v3;
}

- (void)_ensureLayoutsConfiguredForEntry:(id)a3
{
  -[_UINavigationBarVisualProviderModernIOS _ensureLayoutsConfiguredForEntry:forMeasuring:](self, "_ensureLayoutsConfiguredForEntry:forMeasuring:", a3, 0);
}

- (double)defaultBarHeightForTraitCollection:(id)a3
{
  double result;
  int v4;

  if (objc_msgSend(a3, "userInterfaceIdiom") == 5)
    return 39.0;
  v4 = _UIBarsUseNewPadHeights();
  result = 44.0;
  if (v4)
    return 50.0;
  return result;
}

- (BOOL)_isInnerNavigationBarOfNestedNavigationController
{
  void *v3;
  void *v4;
  UINavigationBar *v5;
  UINavigationBar *navigationBar;
  void *v7;
  void *v8;
  BOOL v9;

  -[UINavigationBar _accessibility_navigationController](self->super._navigationBar, "_accessibility_navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_outermostNavigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();

  navigationBar = self->super._navigationBar;
  if (navigationBar == v5)
  {
    v9 = 0;
  }
  else
  {
    -[UINavigationBar topItem](navigationBar, "topItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationBar topItem](v5, "topItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7 == v8;

  }
  return v9;
}

- (BOOL)supportsRefreshControlHosting
{
  return 1;
}

- (NSDirectionalEdgeInsets)largeSearchBaseMarginsRequiringNavMinimums:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSDirectionalEdgeInsets result;

  v3 = a3;
  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "largeTitleInsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (objc_msgSend(v6, "useRelativeLargeTitleInsets"))
  {
    -[UINavigationBar _resolvedLayoutMargins](self->super._navigationBar, "_resolvedLayoutMargins");
    v10 = v10 + v15;
    v14 = v14 + v16;
  }
  else if (v10 == 0.0 || v14 == 0.0)
  {
    -[UINavigationBar _resolvedLayoutMargins](self->super._navigationBar, "_resolvedLayoutMargins");
    if (v10 == 0.0)
      v21 = v19;
    else
      v21 = v10;
    if (v14 == 0.0)
      v22 = v20;
    else
      v22 = v14;
    v23 = fmax(v21, v19);
    v24 = fmax(v22, v20);
    if (v3)
      v14 = v24;
    else
      v14 = v22;
    if (v3)
      v10 = v23;
    else
      v10 = v21;
  }
  else if (v3)
  {
    -[UINavigationBar _resolvedLayoutMargins](self->super._navigationBar, "_resolvedLayoutMargins");
    v10 = fmax(v10, v17);
    v14 = fmax(v14, v18);
  }

  v25 = v8;
  v26 = v10;
  v27 = v12;
  v28 = v14;
  result.trailing = v28;
  result.bottom = v27;
  result.leading = v26;
  result.top = v25;
  return result;
}

- (NSDirectionalEdgeInsets)resolvedSearchBarMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSDirectionalEdgeInsets result;

  if (-[_UINavigationBarVisualProviderModernIOS allowLargeTitleView](self, "allowLargeTitleView"))
    -[_UINavigationBarVisualProviderModernIOS largeSearchBaseMarginsRequiringNavMinimums:](self, "largeSearchBaseMarginsRequiringNavMinimums:", 1);
  else
    -[UINavigationBar _resolvedLayoutMargins](self->super._navigationBar, "_resolvedLayoutMargins");
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (id)refreshControlHost
{
  return self->_refreshControlHost;
}

- (void)setRefreshControlHost:(id)a3
{
  _UINavigationControllerRefreshControlHost *v5;
  _UINavigationControllerRefreshControlHost **p_refreshControlHost;
  _UINavigationControllerRefreshControlHost *refreshControlHost;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  _UINavigationControllerRefreshControlHost *v12;

  v5 = (_UINavigationControllerRefreshControlHost *)a3;
  p_refreshControlHost = &self->_refreshControlHost;
  refreshControlHost = self->_refreshControlHost;
  v12 = v5;
  if (refreshControlHost != v5)
  {
    -[_UINavigationControllerRefreshControlHost setDelegate:](refreshControlHost, "setDelegate:", 0);
    -[_UINavigationControllerRefreshControlHost stopAnimations](*p_refreshControlHost, "stopAnimations");
    -[_UINavigationControllerRefreshControlHost hostContainerView](*p_refreshControlHost, "hostContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    objc_storeStrong((id *)&self->_refreshControlHost, a3);
    -[_UINavigationControllerRefreshControlHost setDelegate:](*p_refreshControlHost, "setDelegate:", self);
    v9 = (void *)objc_opt_new();
    -[_UINavigationControllerRefreshControlHost setHostContainerView:](*p_refreshControlHost, "setHostContainerView:", v9);

    -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "normalLayout");
    v11 = (id *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarLayout setRefreshControlHost:](v11, v12);

  }
}

- (void)recordBarSize:(CGSize)a3
{
  self->_previousBarSize = a3;
}

- (BOOL)forceScrollEdgeAppearance
{
  return self->_forceScrollEdgeAppearance;
}

- (void)navigationItemUpdatedScrollEdgeProgress:(id)a3
{
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  void *v13;
  char v14;
  void *v15;
  double v16;
  id v17;

  v17 = a3;
  if (!-[_UINavigationBarItemStack state](self->super._stack, "state")
    && !-[UIView _canDrawContent](self->super._navigationBar, "_canDrawContent"))
  {
    objc_msgSend(v17, "_stackEntry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_UINavigationBarVisualProviderModernIOS alwaysEvaluateChromelessTransitionProgress](self, "alwaysEvaluateChromelessTransitionProgress"))
    {
      objc_msgSend(v4, "activeLayout");
    }
    else
    {
      objc_msgSend(v4, "normalLayout");
    }
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = -[_UINavigationBarVisualProviderModernIOS useManualScrollEdgeAppearanceForItem:](self, "useManualScrollEdgeAppearanceForItem:", v17);
    v7 = v6;
    if (v5)
    {
      v8 = *(_BYTE *)(v5 + 111) != 0;
      if (*(unsigned __int8 *)(v5 + 111) != v6)
      {
        *(_BYTE *)(v5 + 111) = v6;
        objc_msgSend((id)v5, "_updateLayoutOutputs");
      }
      objc_msgSend(v17, "_manualScrollEdgeAppearanceProgress");
      v10 = v9;
      v11 = *(double *)(v5 + 216);
      *(double *)(v5 + 216) = v9;
      if (*(_BYTE *)(v5 + 111))
        objc_msgSend((id)v5, "_updateLayoutOutputs");
    }
    else
    {
      objc_msgSend(v17, "_manualScrollEdgeAppearanceProgress");
      v10 = v16;
      v8 = 0;
      v11 = 0.0;
    }
    if (v7)
      v12 = v10 == v11;
    else
      v12 = !v8;
    if (!v12)
    {
      -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == v4)
      {
        -[_UINavigationBarVisualProviderModernIOS _updateBackground](self, "_updateBackground");
        v14 = objc_msgSend(v17, "_isManualScrollEdgeAppearanceEnabled");
        if (-[_UINavigationBarVisualProviderModernIOS alwaysEvaluateChromelessTransitionProgress](self, "alwaysEvaluateChromelessTransitionProgress"))
        {
          if ((v14 & 1) == 0)
          {
            -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UINavigationBarVisualProviderModernIOS _updateContentForTopItem:backItem:animated:](self, "_updateContentForTopItem:backItem:animated:", v17, v15, 0);

          }
        }
      }
    }

  }
}

- (BOOL)scrollEdgeAppearanceHasChromelessBehavior
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;

  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollEdgeAppearance");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;

  }
  else
  {
    -[UINavigationBar scrollEdgeAppearance](self->super._navigationBar, "scrollEdgeAppearance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      LOBYTE(v7) = 1;
      return v7;
    }
  }
  objc_msgSend(v5, "_backgroundData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasBackground") ^ 1;

  return v7;
}

- (void)_updateTitleViewForLayout:(id)a3
{
  id v4;
  void *v5;
  char v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  id v10;
  double v11;
  _BOOL4 v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UILabel *weeTitleLabel;
  _QWORD v26[7];
  CGRect v27;

  v4 = a3;
  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSearchActive");

  if ((v6 & 1) != 0)
    goto LABEL_30;
  -[UIView bounds](self->super._navigationBar, "bounds");
  self->_previousBarSize.width = v7;
  self->_previousBarSize.height = v8;
  if (v4)
    v9 = (void *)*((_QWORD *)v4 + 18);
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    if (v4)
    {
      v11 = *((double *)v4 + 35);
      v12 = v11 < 0.05;
      v13 = 1.0;
      if (v11 >= 0.05)
        goto LABEL_8;
    }
    else
    {
      v12 = 1;
    }
    v13 = 0.0;
LABEL_8:
    if (v12)
      v14 = 1.0;
    else
      v14 = 0.0;
    if (self->_transitionContext
      || !-[_UINavigationBarVisualProviderModernIOS _isInInteractiveScroll](self, "_isInInteractiveScroll"))
    {
      -[_UINavigationBarContentView setInlineTitleViewAlpha:](self->_contentView, "setInlineTitleViewAlpha:", v14);
      -[UIView setAlpha:](self->_largeTitleView, "setAlpha:", v13);
    }
    else
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __69___UINavigationBarVisualProviderModernIOS__updateTitleViewForLayout___block_invoke;
      v26[3] = &unk_1E16B4E70;
      v26[4] = self;
      *(double *)&v26[5] = v14;
      *(double *)&v26[6] = v13;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v26, 0.2);
    }
    if (!self->_transitionContext)
    {
      -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_weeTitle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length");

      if (v17)
      {
        -[UIView bounds](self->super._navigationBar, "bounds");
        v19 = v18;
        -[UIView frame](self->_contentView, "frame");
        v20 = v19 - CGRectGetMaxY(v27);
        -[_UINavigationBarLargeTitleView restingHeightOfTitleView](self->_largeTitleView, "restingHeightOfTitleView");
        v22 = v21 - v20;
        if (v22 < 0.0)
          v22 = 0.0;
        if (v22 >= 10.0)
          v23 = 0.0;
        else
          v23 = (10.0 - v22) / 10.0;
        if (v23 < 0.0)
          v23 = 0.0;
        v24 = fmin(v23, 1.0);
        weeTitleLabel = self->_weeTitleLabel;
      }
      else
      {
        weeTitleLabel = self->_weeTitleLabel;
        v24 = 0.0;
      }
      -[UIView setAlpha:](weeTitleLabel, "setAlpha:", v24);
    }
    goto LABEL_30;
  }
  if (self->_appearanceAPIVersion < 1 || !self->_transitionContext)
    -[_UINavigationBarContentView setInlineTitleViewAlpha:](self->_contentView, "setInlineTitleViewAlpha:", self->_titleAlpha);
LABEL_30:

}

- (void)_updateContentForTopItem:(id)a3 backItem:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  int64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;
  int v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  double *v17;
  double v18;
  id v19;
  UINavigationBar *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  double *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  id v32;
  UINavigationBar *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  id v49;
  void *v50;
  id *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  char v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int64_t v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  int64_t v83;
  void *v84;
  _BOOL8 v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  _UINavigationBarContentView *contentView;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  _BOOL8 v102;
  uint64_t v103;
  void *v104;
  id v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  UILabel *v120;
  UILabel *v121;
  UILabel *weeTitleLabel;
  id v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  const __CFString *v132;
  void *v133;
  void *v134;
  void *v135;
  _BOOL4 v136;
  void *v137;
  int64_t v138;
  id v139;
  _BOOL4 v140;
  void *v141;
  void *v142;
  _QWORD v143[5];
  _QWORD aBlock[5];
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  id v149;
  id v150;
  id v151;
  id v152;
  _BYTE v153[128];
  uint64_t v154;

  v5 = a5;
  v154 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (self->_hasIdiom
    && !-[_UINavigationBarVisualProviderModernIOS _isInnerNavigationBarOfNestedNavigationController](self, "_isInnerNavigationBarOfNestedNavigationController"))
  {
    v10 = -[UINavigationBar _activeBarMetrics](self->super._navigationBar, "_activeBarMetrics");
    v11 = -[_UINavigationBarVisualProviderModernIOS wantsLargeTitleDisplayed](self, "wantsLargeTitleDisplayed");
    v138 = v10;
    v140 = v11;
    v136 = v5;
    if (self->_appearanceAPIVersion < 2)
    {
      v15 = 0;
      v141 = 0;
      goto LABEL_43;
    }
    v12 = v11;
    v13 = objc_msgSend(v8, "_isManualScrollEdgeAppearanceEnabled");
    if (((!-[_UINavigationBarVisualProviderModernIOS alwaysEvaluateChromelessTransitionProgress](self, "alwaysEvaluateChromelessTransitionProgress") | v13 | v12) & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(v8, "_stackEntry");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "activeLayout");
      v17 = (double *)objc_claimAutoreleasedReturnValue();
      if (v17)
        v18 = v17[27];
      else
        v18 = 0.0;
      v14 = v18 < 0.25;

    }
    if (v10 == 102 || v10 == 1)
    {
      if (!v14
        || (_nullableCompactScrollEdgeAppearance(self->super._navigationBar, v8),
            (v19 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {
        _compactAppearance(self->super._navigationBar, v8);
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_42;
    }
    if (v14)
      goto LABEL_16;
    objc_msgSend(v8, "_stackEntry");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activeLayout");
    v25 = (double *)(id)objc_claimAutoreleasedReturnValue();
    if (dyld_program_sdk_at_least())
    {
      if (v25)
        v26 = v25[36];
      else
        v26 = 0.0;

      if (v26 <= 0.0)
        goto LABEL_31;
    }
    else
    {
      if (!v12)
      {

LABEL_31:
        v20 = self->super._navigationBar;
        objc_msgSend(v8, "standardAppearance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v30)
        {
          v32 = v30;
        }
        else
        {
          -[UINavigationBar standardAppearance](v20, "standardAppearance");
          v32 = (id)objc_claimAutoreleasedReturnValue();
        }
        v19 = v32;

LABEL_41:
LABEL_42:
        v141 = v19;
        objc_msgSend(v19, "_barTitleData");
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_43:
        v142 = (void *)v15;
        objc_msgSend(v9, "_effectiveBackBarButtonItem");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UINavigationBarVisualProviderModernIOS _backButtonMenu](self, "_backButtonMenu");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setMenu:", v38);

        v39 = objc_msgSend(v8, "hidesBackButton");
        v40 = objc_msgSend(v8, "leftItemsSupplementBackButton");
        v151 = 0;
        v152 = 0;
        objc_msgSend(v8, "_getLeadingItems:groups:", &v152, &v151);
        v149 = 0;
        v150 = 0;
        objc_msgSend(v8, "_getTrailingItems:groups:", &v150, &v149);
        v139 = v9;
        if (v152)
        {
          if (v37)
            v41 = v39;
          else
            v41 = 1;
          if ((v41 & 1) != 0 || (v40 & 1) == 0 && objc_msgSend(v152, "count"))
          {
            v42 = v37;
            objc_msgSend(v8, "_barButtonForBackButtonIndicator");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v42 = v37;
            v43 = 0;
          }
          v147 = 0u;
          v148 = 0u;
          v145 = 0u;
          v146 = 0u;
          v44 = v152;
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v145, v153, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v146;
            do
            {
              for (i = 0; i != v46; ++i)
              {
                if (*(_QWORD *)v146 != v47)
                  objc_enumerationMutation(v44);
                objc_msgSend(*(id *)(*((_QWORD *)&v145 + 1) + 8 * i), "_setShowsChevron:", *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * i) == (_QWORD)v43);
              }
              v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v145, v153, 16);
            }
            while (v46);
          }

          v37 = v42;
          v9 = v139;
        }
        v137 = v37;
        -[_UINavigationBarContentView setBackButtonItem:](self->_contentView, "setBackButtonItem:", v37);
        -[_UINavigationBarContentView setBackButtonHidden:](self->_contentView, "setBackButtonHidden:", v39);
        v49 = v152;
        if (v152)
        {
          -[_UINavigationBarContentView leadingBarGroups](self->_contentView, "leadingBarGroups");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "lastObject");
          v51 = (id *)objc_claimAutoreleasedReturnValue();
          -[UIBarButtonItemGroup _items](v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v49;
          v54 = v52;
          if (v53 == v54)
          {

            goto LABEL_68;
          }
          v55 = v54;
          if (v54)
          {
            v56 = objc_msgSend(v53, "isEqual:", v54);

            if ((v56 & 1) != 0)
            {
LABEL_68:
              -[_UINavigationBarContentView setLeadingItemsSupplementBackItem:](self->_contentView, "setLeadingItemsSupplementBackItem:", v40);
              objc_msgSend(v8, "_inlineSearchBarItemGroup");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              -[_UINavigationBarContentView setInlineSearchBarGroup:](self->_contentView, "setInlineSearchBarGroup:", v57);

              -[_UINavigationBarContentView setPlaceInlineSearchBarInCenter:](self->_contentView, "setPlaceInlineSearchBarInCenter:", objc_msgSend(v8, "searchBarPlacement") == 3);
              if (v150)
              {
                objc_msgSend(v150, "reverseObjectEnumerator");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "allObjects");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                -[_UINavigationBarContentView trailingBarGroups](self->_contentView, "trailingBarGroups");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "lastObject");
                v61 = (id *)objc_claimAutoreleasedReturnValue();
                -[UIBarButtonItemGroup _items](v61);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = v59;
                v64 = v62;
                if (v63 == v64)
                {

                  goto LABEL_77;
                }
                v65 = v64;
                if (v63 && v64)
                {
                  v66 = objc_msgSend(v63, "isEqual:", v64);

                  if ((v66 & 1) != 0)
                  {
LABEL_77:
                    objc_msgSend(v8, "pinnedTrailingGroup");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_UINavigationBarContentView setFixedTrailingGroup:](self->_contentView, "setFixedTrailingGroup:", v67);

                    objc_msgSend(v8, "title");
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_UINavigationBarContentView setTitle:](self->_contentView, "setTitle:", v68);

                    objc_msgSend(v8, "titleView");
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_UINavigationBarContentView setTitleView:](self->_contentView, "setTitleView:", v69);

                    if (!_UIBarsDesktopNavigationBarEnabled())
                    {
                      -[_UINavigationBarContentView setCenterBarGroups:](self->_contentView, "setCenterBarGroups:", MEMORY[0x1E0C9AA60]);
                      -[_UINavigationBarContentView setToolbarStyle:](self->_contentView, "setToolbarStyle:", 0);
                      -[_UINavigationBarContentView setCustomizationIdentifier:](self->_contentView, "setCustomizationIdentifier:", 0);
                      -[_UINavigationBarContentView setTitleMenuProvider:](self->_contentView, "setTitleMenuProvider:", 0);
                      -[_UINavigationBarContentView setDocumentProperties:](self->_contentView, "setDocumentProperties:", 0);
                      -[_UINavigationBarContentView setAdditionalItems:](self->_contentView, "setAdditionalItems:", 0);
                      -[_UINavigationBarContentView dci_setRenameHandler:](self->_contentView, "dci_setRenameHandler:", 0);
                      -[_UINavigationBarContentView setBackAction:](self->_contentView, "setBackAction:", 0);
                      -[_UINavigationBarContentView setEnableAlternatePopItem:](self->_contentView, "setEnableAlternatePopItem:", 0);
                      v72 = v138;
                      v73 = v141;
                      if (v140)
                        goto LABEL_87;
                      goto LABEL_86;
                    }
                    objc_msgSend(v8, "centerItemGroups");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_UINavigationBarContentView setCenterBarGroups:](self->_contentView, "setCenterBarGroups:", v70);

                    -[_UINavigationBarContentView setToolbarStyle:](self->_contentView, "setToolbarStyle:", objc_msgSend(v8, "style"));
                    objc_msgSend(v8, "titleMenuProvider");
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    v72 = v138;
                    v73 = v141;
                    if (!v71)
                    {
                      objc_msgSend(v8, "_dci_documentMenu");
                      v74 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v74)
                      {
                        objc_msgSend(v8, "_dci_documentMenu");
                        v75 = (void *)objc_claimAutoreleasedReturnValue();
                        aBlock[0] = MEMORY[0x1E0C809B0];
                        aBlock[1] = 3221225472;
                        aBlock[2] = __86___UINavigationBarVisualProviderModernIOS__updateContentForTopItem_backItem_animated___block_invoke;
                        aBlock[3] = &unk_1E16B5118;
                        aBlock[4] = v75;
                        v76 = v75;
                        v77 = (id *)aBlock;
                        goto LABEL_81;
                      }
                      objc_msgSend(v8, "_dci_renameHandler");
                      v71 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v71)
                      {
                        +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_rename_);
                        v108 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v108)
                        {
                          v76 = 0;
                          v71 = 0;
                          goto LABEL_82;
                        }
                        v143[0] = MEMORY[0x1E0C809B0];
                        v143[1] = 3221225472;
                        v143[2] = __86___UINavigationBarVisualProviderModernIOS__updateContentForTopItem_backItem_animated___block_invoke_2;
                        v143[3] = &unk_1E16B5118;
                        v76 = v108;
                        v143[4] = v76;
                        v77 = (id *)v143;
LABEL_81:
                        v71 = _Block_copy(v77);

LABEL_82:
                      }
                    }
                    objc_msgSend(v8, "customizationIdentifier");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_UINavigationBarContentView setCustomizationIdentifier:](self->_contentView, "setCustomizationIdentifier:", v78);

                    -[_UINavigationBarContentView setTitleMenuProvider:](self->_contentView, "setTitleMenuProvider:", v71);
                    objc_msgSend(v8, "documentProperties");
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_UINavigationBarContentView setDocumentProperties:](self->_contentView, "setDocumentProperties:", v79);

                    objc_msgSend(v8, "_dci_renameHandler");
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_UINavigationBarContentView dci_setRenameHandler:](self->_contentView, "dci_setRenameHandler:", v80);

                    objc_msgSend(v8, "backAction");
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_UINavigationBarContentView setBackAction:](self->_contentView, "setBackAction:", v81);

                    -[_UINavigationBarContentView setEnableAlternatePopItem:](self->_contentView, "setEnableAlternatePopItem:", -[_UINavigationBarVisualProviderModernIOS _shouldEnableNestedNavigationPopForTopItem:backItem:](self, "_shouldEnableNestedNavigationPopForTopItem:backItem:", v8, v9));
                    objc_msgSend(v8, "additionalOverflowItems");
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_UINavigationBarContentView setAdditionalItems:](self->_contentView, "setAdditionalItems:", v82);

                    if (v140)
                    {
LABEL_87:
                      -[_UINavigationBarVisualProviderModernIOS _updateAugmentedTitleDataSources](self, "_updateAugmentedTitleDataSources");
                      objc_msgSend(v8, "_minimumDesiredHeightForBarMetrics:", -[UINavigationBar _activeBarMetrics](self->super._navigationBar, "_activeBarMetrics"));
                      -[_UINavigationBarContentView setOverrideSize:](self->_contentView, "setOverrideSize:");
                      -[_UINavigationBarContentView setBarMetrics:](self->_contentView, "setBarMetrics:", v72);
                      v83 = -[_UINavigationBarItemStack effectiveDisplayModeForItemInCurrentStack:](self->super._stack, "effectiveDisplayModeForItemInCurrentStack:", v8);
                      if (v83 == 1)
                      {
                        v85 = 1;
                        v84 = v142;
                        if (v142)
                          goto LABEL_94;
                      }
                      else
                      {
                        v84 = v142;
                        if (!v83)
                        {
                          v85 = -[_UINavigationBarVisualProviderModernIOS _allowLargeTitleView](self, "_allowLargeTitleView");
                          if (!v142)
                            goto LABEL_92;
LABEL_94:
                          objc_msgSend(v84, "titleTextAttributes");
                          v88 = (void *)objc_claimAutoreleasedReturnValue();
                          -[_UINavigationBarVisualProviderModernIOS _adjustedAppearanceTitleAttributes:allowsLargeTitle:](self, "_adjustedAppearanceTitleAttributes:allowsLargeTitle:", v88, v85);
                          v93 = (void *)objc_claimAutoreleasedReturnValue();
                          -[_UINavigationBarContentView setTitleAttributes:](self->_contentView, "setTitleAttributes:", v93);

                          objc_msgSend(v84, "titlePositionAdjustment");
                          contentView = self->_contentView;
LABEL_95:
                          -[_UINavigationBarContentView setTitlePositionAdjustment:](contentView, "setTitlePositionAdjustment:", v92, v90);

                          -[_UINavigationBarContentView setAllowLeadingAlignedLargeTitle:](self->_contentView, "setAllowLeadingAlignedLargeTitle:", -[_UINavigationBarVisualProviderModernIOS _allowLargeTitleView](self, "_allowLargeTitleView"));
                          if (v73)
                          {
                            objc_msgSend(v73, "_backButtonAppearanceData");
                            v94 = (void *)objc_claimAutoreleasedReturnValue();
                            -[_UINavigationBarContentView setBackButtonAppearance:](self->_contentView, "setBackButtonAppearance:", v94);

                            objc_msgSend(v73, "_plainButtonAppearanceData");
                            v95 = (void *)objc_claimAutoreleasedReturnValue();
                            -[_UINavigationBarContentView setPlainItemAppearance:](self->_contentView, "setPlainItemAppearance:", v95);

                            objc_msgSend(v73, "_doneButtonAppearanceData");
                            v96 = (void *)objc_claimAutoreleasedReturnValue();
                            -[_UINavigationBarContentView setDoneItemAppearance:](self->_contentView, "setDoneItemAppearance:", v96);
                          }
                          else
                          {
                            -[UINavigationBar backIndicatorImage](self->super._navigationBar, "backIndicatorImage");
                            v96 = (void *)objc_claimAutoreleasedReturnValue();
                            -[UINavigationBar backIndicatorTransitionMaskImage](self->super._navigationBar, "backIndicatorTransitionMaskImage");
                            v97 = objc_claimAutoreleasedReturnValue();
                            v98 = (void *)v97;
                            if (v96 && v97)
                            {
                              -[_UINavigationBarContentView setBackIndicatorImage:](self->_contentView, "setBackIndicatorImage:", v96);
                              -[_UIBarContentView setBackIndicatorMaskImage:](self->_contentView, "setBackIndicatorMaskImage:", v98);
                            }

                          }
                          -[UINavigationBar _requestedMaxBackButtonWidth](self->super._navigationBar, "_requestedMaxBackButtonWidth");
                          -[_UINavigationBarContentView _setBackButtonMaximumWidth:](self->_contentView, "_setBackButtonMaximumWidth:");
                          -[_UITabContainerView floatingTabBar](self->_tabBarHostedView, "floatingTabBar");
                          v99 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v99, "currentSelectionTitle");
                          v100 = (void *)objc_claimAutoreleasedReturnValue();
                          -[_UINavigationBarVisualProviderModernIOS _updateTabBarSuppressionIfNeeded](self, "_updateTabBarSuppressionIfNeeded");
                          if (self->_isActiveTabBarHost)
                          {
                            -[UIView tintColor](self->_contentView, "tintColor");
                            v101 = (void *)objc_claimAutoreleasedReturnValue();
                            -[_UITabContainerView setOverlaySidebarButtonTintColor:](self->_tabBarHostedView, "setOverlaySidebarButtonTintColor:", v101);

                          }
                          if (-[_UITabContainerView canShowFloatingTabBar](self->_tabBarHostedView, "canShowFloatingTabBar"))
                          {
                            v102 = !self->_isSuppressingTabBar;
                          }
                          else
                          {
                            v102 = 0;
                          }
                          -[_UINavigationBarContentView setHostedTabBarEnabled:](self->_contentView, "setHostedTabBarEnabled:", v102);
                          -[_UITabContainerView floatingTabBarContentFrameInCoordinateSpace:](self->_tabBarHostedView, "floatingTabBarContentFrameInCoordinateSpace:", self->_contentView);
                          -[_UINavigationBarContentView setHostedTabBarFrame:](self->_contentView, "setHostedTabBarFrame:");
                          -[_UINavigationBarContentView setWantsHostedTabBarMetrics:](self->_contentView, "setWantsHostedTabBarMetrics:", self->_wantsHostedTabBarMetrics);
                          -[_UINavigationBarContentView setHasLeadingInsetFromTideBar:](self->_contentView, "setHasLeadingInsetFromTideBar:", -[_UITabContainerView isSidebarOverlappingContent](self->_tabBarHostedView, "isSidebarOverlappingContent"));
                          v134 = v100;
                          if (objc_msgSend(v8, "style"))
                          {
                            v103 = 1;
                          }
                          else if (v9)
                          {
                            objc_msgSend(v8, "title");
                            v104 = (void *)objc_claimAutoreleasedReturnValue();
                            if (objc_msgSend(v104, "length"))
                            {
                              objc_msgSend(v8, "title");
                              v105 = (id)objc_claimAutoreleasedReturnValue();
                              v106 = v100;
                              v107 = v106;
                              if (v105 == v106)
                              {
                                v103 = 0;
                              }
                              else
                              {
                                v103 = 1;
                                if (v106 && v105)
                                  v103 = objc_msgSend(v105, "isEqual:", v106) ^ 1;
                              }

                              v84 = v142;
                            }
                            else
                            {
                              v103 = 0;
                            }

                          }
                          else
                          {
                            v103 = 0;
                          }
                          -[_UINavigationBarContentView setShowTitleWithTabBar:](self->_contentView, "setShowTitleWithTabBar:", v103, v134);
                          -[_UINavigationBarContentView setHostedTabBarVisibilityAffectsTitle:](self->_contentView, "setHostedTabBarVisibilityAffectsTitle:", -[_UITabContainerView sidebarLayout](self->_tabBarHostedView, "sidebarLayout") != 2);
                          -[_UINavigationBarContentView setIsHostedTabBarVisible:](self->_contentView, "setIsHostedTabBarVisible:", -[_UITabContainerView isShowingFloatingTabBar](self->_tabBarHostedView, "isShowingFloatingTabBar"));
                          -[_UINavigationBarContentView setUseInlineLargeTitleMetrics:](self->_contentView, "setUseInlineLargeTitleMetrics:", objc_msgSend(v8, "largeTitleDisplayMode") == 3);
                          -[_UINavigationBarContentView updateContentAnimated:](self->_contentView, "updateContentAnimated:", v136);
                          -[_UINavigationBarLargeTitleView setTitleType:](self->_largeTitleView, "setTitleType:", v140);
                          objc_msgSend(v8, "title");
                          v109 = (void *)objc_claimAutoreleasedReturnValue();
                          -[_UINavigationBarLargeTitleView setTitle:](self->_largeTitleView, "setTitle:", v109);

                          objc_msgSend(v8, "_alternateLargeTitles");
                          v110 = (void *)objc_claimAutoreleasedReturnValue();
                          -[_UINavigationBarLargeTitleView setAlternateTitles:](self->_largeTitleView, "setAlternateTitles:", v110);

                          objc_msgSend(v8, "_largeTitleAccessoryView");
                          v111 = (void *)objc_claimAutoreleasedReturnValue();
                          -[_UINavigationBarLargeTitleView setAccessoryView:](self->_largeTitleView, "setAccessoryView:", v111);

                          -[_UINavigationBarLargeTitleView setAlignAccessoryViewToTitleBaseline:](self->_largeTitleView, "setAlignAccessoryViewToTitleBaseline:", objc_msgSend(v8, "_alignLargeTitleAccessoryViewToBaseline"));
                          -[_UINavigationBarLargeTitleView setAccessoryViewHorizontalAlignment:](self->_largeTitleView, "setAccessoryViewHorizontalAlignment:", objc_msgSend(v8, "_largeTitleAccessoryViewHorizontalAlignment"));
                          -[_UINavigationBarLargeTitleView setTwoLineMode:](self->_largeTitleView, "setTwoLineMode:", objc_msgSend(v8, "_largeTitleTwoLineMode"));
                          if (v84)
                          {
                            objc_msgSend(v84, "largeTitleTextAttributes");
                            v112 = (void *)objc_claimAutoreleasedReturnValue();
                            -[_UINavigationBarLargeTitleView setTitleAttributes:](self->_largeTitleView, "setTitleAttributes:", v112);
                          }
                          else
                          {
                            -[UINavigationBar largeTitleTextAttributes](self->super._navigationBar, "largeTitleTextAttributes");
                            v112 = (void *)objc_claimAutoreleasedReturnValue();
                            -[UIView traitCollection](self->super._navigationBar, "traitCollection");
                            v113 = (void *)objc_claimAutoreleasedReturnValue();
                            _UINavigationTitleAppearanceAddDefaultLargeTitleAttributes(v112, objc_msgSend(v113, "userInterfaceIdiom"));
                            v114 = (void *)objc_claimAutoreleasedReturnValue();
                            -[_UINavigationBarLargeTitleView setTitleAttributes:](self->_largeTitleView, "setTitleAttributes:", v114);

                          }
                          -[_UINavigationBarVisualProviderModernIOS _computeProvidesExtraSpaceForExcessiveLineHeightsForTopItem:](self, "_computeProvidesExtraSpaceForExcessiveLineHeightsForTopItem:", v8);
                          -[_UINavigationBarLargeTitleView setProvidesExtraSpaceForExcessiveLineHeights:](self->_largeTitleView, "setProvidesExtraSpaceForExcessiveLineHeights:", self->_providesExtraSpaceForExcessiveLineHeights);
                          -[_UINavigationBarLargeTitleView updateContent](self->_largeTitleView, "updateContent");
                          objc_msgSend(v8, "prompt");
                          v115 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v115)
                          {
                            objc_msgSend(v8, "prompt");
                            v116 = (void *)objc_claimAutoreleasedReturnValue();
                            -[_UINavigationBarModernPromptView setPrompt:](self->_promptView, "setPrompt:", v116);

                            -[_UINavigationBarVisualProviderModernIOS _compatibleDefaultTextColor](self, "_compatibleDefaultTextColor");
                            v117 = (void *)objc_claimAutoreleasedReturnValue();
                            -[_UINavigationBarModernPromptView setTextColor:](self->_promptView, "setTextColor:", v117);

                          }
                          objc_msgSend(v8, "_weeTitle");
                          v118 = (void *)objc_claimAutoreleasedReturnValue();
                          v119 = objc_msgSend(v118, "length");

                          if (v119)
                          {
                            if (!self->_weeTitleLabel)
                            {
                              v120 = [UILabel alloc];
                              -[UIView bounds](self->super._navigationBar, "bounds");
                              v121 = -[UILabel initWithFrame:](v120, "initWithFrame:");
                              weeTitleLabel = self->_weeTitleLabel;
                              self->_weeTitleLabel = v121;

                            }
                            v123 = objc_alloc(MEMORY[0x1E0CB3498]);
                            objc_msgSend(v8, "_weeTitle");
                            v124 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v124, "localizedUppercaseString");
                            v125 = (void *)objc_claimAutoreleasedReturnValue();
                            -[_UINavigationBarVisualProviderModernIOS _defaultWeeTitleAttributes](self, "_defaultWeeTitleAttributes");
                            v126 = (void *)objc_claimAutoreleasedReturnValue();
                            v127 = (void *)objc_msgSend(v123, "initWithString:attributes:", v125, v126);
                            -[UILabel setAttributedText:](self->_weeTitleLabel, "setAttributedText:", v127);

                          }
                          objc_msgSend(v8, "_searchControllerIfAllowed");
                          v128 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v128, "searchBar");
                          v129 = (void *)objc_claimAutoreleasedReturnValue();

                          if ((objc_msgSend(v129, "_isHostedInlineByNavigationBar") & 1) != 0 || !v129)
                          {
                            v130 = v137;
                            v131 = v135;
                            if (!v129)
                            {
LABEL_142:
                              -[UINavigationBar _accessibility_navigationBarContentsDidChange](self->super._navigationBar, "_accessibility_navigationBarContentsDidChange");

                              v9 = v139;
                              goto LABEL_143;
                            }
                          }
                          else
                          {
                            v130 = v137;
                            v131 = v135;
                            if (v138 == 102 || v138 == 1)
                              v132 = CFSTR("UICTContentSizeCategoryAccessibilityL");
                            else
                              v132 = 0;
                            objc_msgSend(v129, "_setMaximumContentSizeCategory:", v132);
                          }
                          if (objc_msgSend(v129, "showsScopeBar"))
                          {
                            objc_msgSend(v129, "_scopeBar");
                            v133 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v133, "setAlpha:", 1.0);

                          }
                          goto LABEL_142;
                        }
                        v85 = 0;
                        if (v142)
                          goto LABEL_94;
                      }
LABEL_92:
                      -[_UINavigationBarVisualProviderModernIOS _effectiveLegacyTitleAttributes](self, "_effectiveLegacyTitleAttributes");
                      v86 = (void *)objc_claimAutoreleasedReturnValue();
                      -[_UINavigationBarVisualProviderModernIOS _adjustedAppearanceTitleAttributes:allowsLargeTitle:](self, "_adjustedAppearanceTitleAttributes:allowsLargeTitle:", v86, v85);
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      -[_UINavigationBarContentView setTitleAttributes:](self->_contentView, "setTitleAttributes:", v87);

                      -[UINavigationBar _appearanceStorage](self->super._navigationBar, "_appearanceStorage");
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v88, "titleVerticalAdjustmentForBarMetrics:", -[UINavigationBar _activeBarMetrics](self->super._navigationBar, "_activeBarMetrics"));
                      v90 = v89;
                      contentView = self->_contentView;
                      v92 = 0.0;
                      goto LABEL_95;
                    }
LABEL_86:
                    -[_UINavigationBarContentView setInlineTitleViewAlpha:](self->_contentView, "setInlineTitleViewAlpha:", self->_titleAlpha);
                    goto LABEL_87;
                  }
                }
                else
                {

                }
              }
              -[_UINavigationBarContentView setTrailingBarButtonItems:](self->_contentView, "setTrailingBarButtonItems:", v150);
              -[_UINavigationBarContentView setTrailingBarGroups:](self->_contentView, "setTrailingBarGroups:", v149);
              goto LABEL_77;
            }
          }
          else
          {

          }
        }
        -[_UINavigationBarContentView setLeadingBarButtonItems:](self->_contentView, "setLeadingBarButtonItems:", v152);
        -[_UINavigationBarContentView setLeadingBarGroups:](self->_contentView, "setLeadingBarGroups:", v151);
        goto LABEL_68;
      }
      if (v25)
        v29 = v25[35];
      else
        v29 = 0.0;

      if (v29 < 0.05)
        goto LABEL_31;
    }
LABEL_16:
    v20 = self->super._navigationBar;
    v21 = v8;
    objc_msgSend(v21, "scrollEdgeAppearance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v19 = v22;
    }
    else
    {
      -[UINavigationBar scrollEdgeAppearance](v20, "scrollEdgeAppearance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
      {
        v19 = v27;
      }
      else
      {
        v33 = v20;
        objc_msgSend(v21, "standardAppearance");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v34)
        {
          v36 = v34;
        }
        else
        {
          -[UINavigationBar standardAppearance](v33, "standardAppearance");
          v36 = (id)objc_claimAutoreleasedReturnValue();
        }
        v19 = v36;

      }
    }

    goto LABEL_41;
  }
LABEL_143:

}

- (BOOL)wantsLargeTitleDisplayed
{
  return -[_UINavigationBarVisualProviderModernIOS _stackWantsLargeTitleDisplayedForItem:](self, "_stackWantsLargeTitleDisplayedForItem:", 0);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UINavigationBar *v19;
  UINavigationBar *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  UINavigationBar *v37;
  UINavigationBar *navigationBar;
  double v39;
  unint64_t v40;
  NSObject *v41;
  _UINavigationBarItemStack *stack;
  NSObject *v43;
  void *v44;
  int v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView window](self->super._navigationBar, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    objc_msgSend(v3, "item");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_navigationBar");
    v37 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
    navigationBar = self->super._navigationBar;

    if (v37 != navigationBar)
      goto LABEL_24;
  }
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[_UIPointerInteractionAssistant previewContainer](self->_assistant, "previewContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", v5, v6, v7, v8);

  -[_UINavigationBarVisualProviderModernIOS _ensureLayoutsConfiguredForEntry:](self, "_ensureLayoutsConfiguredForEntry:", v3);
  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeLayout");
  v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (!self->_transitionContext)
  {
    if (v11)
      v12 = (void *)v11[18];
    else
      v12 = 0;
    v13 = v12;

    if (!v13)
    {
      -[UIView removeFromSuperview](self->_largeTitleView, "removeFromSuperview");
      -[UIView removeFromSuperview](self->_weeTitleLabel, "removeFromSuperview");
    }
    -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inactiveLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 || !v15)
    {
      -[_UINavigationBarLayout removeViewsNotInLayout:]((uint64_t)v15, v11);
LABEL_11:

      goto LABEL_12;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
        goto LABEL_31;
      -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138412290;
      v46 = v44;
      _os_log_fault_impl(&dword_185066000, v43, OS_LOG_TYPE_FAULT, "Unexpected configuration for the top navigation item on the navigation bar (activeLayout is nil with non-nil inactiveLayout). %@", (uint8_t *)&v45, 0xCu);
    }
    else
    {
      v40 = layoutSubviews___s_category;
      if (!layoutSubviews___s_category)
      {
        v40 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v40, (unint64_t *)&layoutSubviews___s_category);
      }
      v41 = *(NSObject **)(v40 + 8);
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      stack = self->super._stack;
      v43 = v41;
      -[_UINavigationBarItemStack topEntry](stack, "topEntry");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138412290;
      v46 = v44;
      _os_log_impl(&dword_185066000, v43, OS_LOG_TYPE_ERROR, "Unexpected configuration for the top navigation item on the navigation bar (activeLayout is nil with non-nil inactiveLayout). %@", (uint8_t *)&v45, 0xCu);
    }

LABEL_31:
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v3, "item");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "_hasInlineSearchBar"))
  {
    objc_msgSend(v16, "_searchControllerIfAllowed");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "searchBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "superview");
    v19 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
    v20 = self->super._navigationBar;

    if (v19 == v20)
      objc_msgSend(v18, "removeFromSuperview");

  }
  -[UIView _contentMargin](self->super._navigationBar, "_contentMargin");
  v22 = v21;
  objc_msgSend(v16, "_topPalette");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_bottomPalette");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAssistantIdentifier:", CFSTR("Palette.itemTop"));
  objc_msgSend(v23, "setAssistant:", self->_assistant);
  objc_msgSend(v24, "setAssistantIdentifier:", CFSTR("Palette.itemBottom"));
  objc_msgSend(v24, "setAssistant:", self->_assistant);
  -[_UINavigationBarVisualProviderModernIOS _configureMarginsOnContentViewsAndPalette:withContentMargin:](self, "_configureMarginsOnContentViewsAndPalette:withContentMargin:", v23, v22);
  -[_UINavigationBarVisualProviderModernIOS _configureMarginsOnContentViewsAndPalette:withContentMargin:](self, "_configureMarginsOnContentViewsAndPalette:withContentMargin:", v24, v22);
  -[UIView setSemanticContentAttribute:](self->_contentView, "setSemanticContentAttribute:", -[UIView semanticContentAttribute](self->super._navigationBar, "semanticContentAttribute"));
  -[_UINavigationBarVisualProviderModernIOS _updatePromptViewAndActuallyHide:](self, "_updatePromptViewAndActuallyHide:", 1);
  -[_UINavigationBarVisualProviderModernIOS _updateAugmentedTitleDataSources](self, "_updateAugmentedTitleDataSources");
  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProviderModernIOS _updateContentForTopItem:backItem:](self, "_updateContentForTopItem:backItem:", v16, v25);

  v26 = -[_UINavigationBarItemStack itemCount](self->super._stack, "itemCount");
  -[UIView bounds](self->super._navigationBar, "bounds");
  v31 = v27;
  v32 = v28;
  v33 = v29;
  v34 = v30;
  if (v26 < 1)
  {
    -[_UINavigationBarVisualProviderModernIOS _contentBackgroundExtension](self, "_contentBackgroundExtension");
    -[UIView setFrame:](self->_backgroundView, "setFrame:", v31, v32 - v39, v33, v34 + v39);
  }
  else
  {
    -[_UINavigationBarVisualProviderModernIOS _layoutInBounds:](self, "_layoutInBounds:", v27, v28, v29, v30);
    -[UIView _contentMargin](self->super._navigationBar, "_contentMargin");
    if (v22 != v35)
      -[_UINavigationBarVisualProviderModernIOS _configureMarginsOnContentViewsAndPalette:withContentMargin:](self, "_configureMarginsOnContentViewsAndPalette:withContentMargin:", v24);
    -[_UINavigationBarVisualProviderModernIOS _updateTitleViewForLayout:](self, "_updateTitleViewForLayout:", v11);
  }
  -[_UINavigationBarVisualProviderModernIOS updateBarVisibilityForTopItem](self, "updateBarVisibilityForTopItem");
  -[_UINavigationBarVisualProviderModernIOS _updateBackground](self, "_updateBackground");
  -[_UINavigationBarVisualProviderModernIOS _enforceLayoutOrdering](self, "_enforceLayoutOrdering");
  -[_UIBarCustomizer invalidateLayout](self->_customizer, "invalidateLayout");

LABEL_24:
}

- (void)_configureMarginsOnContentViewsAndPalette:(id)a3 withContentMargin:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;

  v32 = a3;
  -[_UINavigationBarVisualProviderModernIOS leadingMarginForContentViewsWithContentMargin:](self, "leadingMarginForContentViewsWithContentMargin:", a4);
  v7 = v6;
  -[_UINavigationBarContentView _setDirectionalLayoutMargins:](self->_contentView, "_setDirectionalLayoutMargins:", 0.0, v6, 0.0, a4);
  -[UIView setDirectionalLayoutMargins:](self->_promptView, "setDirectionalLayoutMargins:", 0.0, v7, 0.0, a4);
  -[_UINavigationBarVisualProviderModernIOS resolvedLargeTitleMargins](self, "resolvedLargeTitleMargins");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  if (-[UIView insetsLayoutMarginsFromSafeArea](self->super._navigationBar, "insetsLayoutMarginsFromSafeArea")
    && -[UIView insetsLayoutMarginsFromSafeArea](self->_largeTitleView, "insetsLayoutMarginsFromSafeArea"))
  {
    v16 = -[UIView _shouldReverseLayoutDirection](self->super._navigationBar, "_shouldReverseLayoutDirection");
    -[UIView safeAreaInsets](self->super._navigationBar, "safeAreaInsets");
    if (v16)
      v21 = v15;
    else
      v21 = v11;
    if (v16)
      v22 = v11;
    else
      v22 = v15;
    v9 = v9 - v17;
    v13 = v13 - v19;
    if (v16)
      v11 = v22 - v20;
    else
      v11 = v21 - v18;
    if (v16)
      v15 = v21 - v18;
    else
      v15 = v22 - v20;
  }
  -[UIView setDirectionalLayoutMargins:](self->_largeTitleView, "setDirectionalLayoutMargins:", v9, v11, v13, v15);
  v23 = v32;
  if (v32)
  {
    v24 = objc_msgSend(v32, "_contentViewMarginType");
    if (v24 == 2)
    {
      objc_msgSend(v32, "contentView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v28 = v9;
      v30 = v11;
      v29 = v13;
      v31 = v15;
    }
    else
    {
      v25 = v24 == 1;
      v23 = v32;
      if (!v25)
        goto LABEL_22;
      objc_msgSend(v32, "contentView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v28 = 0.0;
      v29 = 0.0;
      v30 = a4;
      v31 = a4;
    }
    objc_msgSend(v26, "setDirectionalLayoutMargins:", v28, v30, v29, v31);

    v23 = v32;
  }
LABEL_22:

}

- (NSDirectionalEdgeInsets)resolvedLargeTitleMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  NSDirectionalEdgeInsets result;

  if (-[_UINavigationBarVisualProviderModernIOS allowLargeTitleView](self, "allowLargeTitleView"))
  {
    -[_UINavigationBarVisualProviderModernIOS largeSearchBaseMarginsRequiringNavMinimums:](self, "largeSearchBaseMarginsRequiringNavMinimums:", 0);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UINavigationBarVisualProviderModernIOS;
    -[_UINavigationBarVisualProvider resolvedLargeTitleMargins](&v7, sel_resolvedLargeTitleMargins);
  }
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (void)_updateAugmentedTitleDataSources
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_UINavigationBarItemStack previousBackItem](self->super._stack, "previousBackItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setTitleViewDataSource:", 0);

  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setTitleViewDataSource:", 0);

  -[_UINavigationBarItemStack previousTopItem](self->super._stack, "previousTopItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setTitleViewDataSource:", self->_contentView);

  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setTitleViewDataSource:", self->_contentView);

}

- (void)_updatePromptViewAndActuallyHide:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;

  v3 = a3;
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prompt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[UIView setHidden:](self->_promptView, "setHidden:", v6 == 0);
  v7 = 0.0;
  if (v6)
    v7 = 1.0;
  -[UIView setAlpha:](self->_promptView, "setAlpha:", v7);
}

- (void)_updateContentForTopItem:(id)a3 backItem:(id)a4
{
  -[_UINavigationBarVisualProviderModernIOS _updateContentForTopItem:backItem:animated:](self, "_updateContentForTopItem:backItem:animated:", a3, a4, 0);
}

- (void)_enforceLayoutOrdering
{
  void *v3;
  void *v4;
  void *v5;
  UINavigationBar *navigationBar;
  void *v7;
  id v8;

  if (!dyld_program_sdk_at_least()
    || (-[UIView window](self->super._navigationBar, "window"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    if (!-[_UINavigationBarVisualProviderModernIOS _isInnerNavigationBarOfNestedNavigationController](self, "_isInnerNavigationBarOfNestedNavigationController"))
    {
      -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "activeLayout");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UINavigationBarLayout installViewsInNavigationBar:]((uint64_t)v5, self->super._navigationBar);

        if ((dyld_program_sdk_at_least() & 1) == 0)
          -[UINavigationBar didAddSubview:](self->super._navigationBar, "didAddSubview:", self->_backgroundView);
      }
      else
      {
        -[UIView insertSubview:atIndex:](self->super._navigationBar, "insertSubview:atIndex:", self->_backgroundView, 0);
      }
      navigationBar = self->super._navigationBar;
      -[_UIPointerInteractionAssistant previewContainer](self->_assistant, "previewContainer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](navigationBar, "addSubview:", v7);

    }
  }
}

- (void)_computeProvidesExtraSpaceForExcessiveLineHeightsForTopItem:(id)a3
{
  void *v4;

  if (sHasEncounteredNavigationTitleWithExcessiveHeight)
  {
    self->_providesExtraSpaceForExcessiveLineHeights = 1;
    -[_UINavigationBarVisualProviderModernIOS _beginOrEndObservingDidEncounterFirstTitleWithExcessiveHeightChangedIfNecessary](self, "_beginOrEndObservingDidEncounterFirstTitleWithExcessiveHeightChangedIfNecessary", a3);
  }
  else
  {
    objc_msgSend(a3, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sHasEncounteredNavigationTitleWithExcessiveHeight = _UINavigationBarHasExcessiveLineHeightCharactersInTitle(v4);

    LODWORD(v4) = sHasEncounteredNavigationTitleWithExcessiveHeight;
    self->_providesExtraSpaceForExcessiveLineHeights = sHasEncounteredNavigationTitleWithExcessiveHeight;
    -[_UINavigationBarVisualProviderModernIOS _beginOrEndObservingDidEncounterFirstTitleWithExcessiveHeightChangedIfNecessary](self, "_beginOrEndObservingDidEncounterFirstTitleWithExcessiveHeightChangedIfNecessary");
    if ((_DWORD)v4)
      -[_UINavigationBarVisualProviderModernIOS _postDidEncounterFirstTitleWithExcessiveHeightChanged](self, "_postDidEncounterFirstTitleWithExcessiveHeightChanged");
  }
}

- (void)_beginOrEndObservingDidEncounterFirstTitleWithExcessiveHeightChangedIfNecessary
{
  _BOOL4 v2;
  void *v4;
  id v5;

  v2 = !self->_providesExtraSpaceForExcessiveLineHeights;
  if (v2 != self->_isObservingDidEncounterFirstTitleWithExcessiveHeightChanged)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (self->_providesExtraSpaceForExcessiveLineHeights)
      objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("_UINavigationBarLargeTitleDidEncounterFirstTitleWithExcessiveHeightChanged"), 0);
    else
      objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__didEncounterFirstTitleWithExcessiveHeightChanged_, CFSTR("_UINavigationBarLargeTitleDidEncounterFirstTitleWithExcessiveHeightChanged"), 0);
    self->_isObservingDidEncounterFirstTitleWithExcessiveHeightChanged = v2;

  }
}

- (id)_adjustedAppearanceTitleAttributes:(id)a3 allowsLargeTitle:(BOOL)a4
{
  return a3;
}

- (BOOL)_shouldEnableNestedNavigationPopForTopItem:(id)a3 backItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  if (v7 && (objc_msgSend(v6, "backAction"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    -[UINavigationBar delegate](self->super._navigationBar, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = objc_msgSend(v9, "_navigationBarTopItemIsNestedNavigationController:", self->super._navigationBar);
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_updateContentPriorities
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  float v7;
  double v8;
  float v9;

  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UINavigationBarLayout isVariableHeight]((_BOOL8)v4))
    v5 = 250.0;
  else
    v5 = 750.0;

  -[UIView contentHuggingPriorityForAxis:](self->super._navigationBar, "contentHuggingPriorityForAxis:", 1);
  v7 = v6;
  -[UIView contentCompressionResistancePriorityForAxis:](self->super._navigationBar, "contentCompressionResistancePriorityForAxis:", 1);
  v9 = *(float *)&v8;
  if (v5 == v7)
  {
    if (v5 == *(float *)&v8)
      return;
  }
  else
  {
    *(float *)&v8 = v5;
    -[UIView setContentHuggingPriority:forAxis:](self->super._navigationBar, "setContentHuggingPriority:forAxis:", 1, v8);
    if (v5 == v9)
      goto LABEL_9;
  }
  *(float *)&v8 = v5;
  -[UIView setContentCompressionResistancePriority:forAxis:](self->super._navigationBar, "setContentCompressionResistancePriority:forAxis:", 1, v8);
LABEL_9:
  -[_UINavigationBarVisualProviderModernIOS _invalidateIntrinsicContentSizeAndNotifySizeChanged](self, "_invalidateIntrinsicContentSizeAndNotifySizeChanged");
}

- (void)_invalidateIntrinsicContentSizeAndNotifySizeChanged
{
  -[UINavigationBar invalidateIntrinsicContentSize](self->super._navigationBar, "invalidateIntrinsicContentSize");
  -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");
  -[UINavigationBar _sendNavigationBarResize](self->super._navigationBar, "_sendNavigationBarResize");
}

- (id)_effectiveLegacyTitleAttributes
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[UINavigationBar titleTextAttributes](self->super._navigationBar, "titleTextAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)off_1E1678D98;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_msgSend(v3, "mutableCopy");
    -[_UINavigationBarVisualProviderModernIOS _compatibleDefaultTextColor](self, "_compatibleDefaultTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v4);

    v3 = v6;
  }
  -[UIView traitCollection](self->super._navigationBar, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _UINavigationTitleAppearanceAddDefaultTitleAttributes(v3, objc_msgSend(v8, "userInterfaceIdiom"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_compatibleDefaultTextColor
{
  void *v3;

  if ((dyld_program_sdk_at_least() & 1) != 0
    || (unint64_t)(-[UINavigationBar barStyle](self->super._navigationBar, "barStyle") - 1) > 1)
  {
    +[UIColor labelColor](UIColor, "labelColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)prepare
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  BOOL v12;
  _UIBarBackground *v13;
  _UIBarBackground *backgroundView;
  _UINavigationBarContentView *v15;
  void *v16;
  _UINavigationBarContentView *v17;
  _UINavigationBarContentView *contentView;
  void *v19;
  void *v20;
  _BOOL8 v21;
  _UINavigationBarLargeTitleView *v22;
  _UINavigationBarLargeTitleView *largeTitleView;
  void *v24;
  uint64_t v25;
  void *v26;
  _UINavigationBarModernPromptView *v27;
  _UINavigationBarModernPromptView *promptView;
  _UIPointerInteractionAssistant *v29;
  _UIPointerInteractionAssistant *assistant;
  uint64_t v31;
  uint64_t v32;
  BOOL (*v33)(uint64_t);
  void *v34;
  id v35;
  id location;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)_UINavigationBarVisualProviderModernIOS;
  -[_UINavigationBarVisualProvider prepare](&v37, sel_prepare);
  self->_titleAlpha = 1.0;
  self->_backgroundAlpha = 1.0;
  self->_shadowAlpha = 1.0;
  -[UIView bounds](self->super._navigationBar, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UINavigationBarVisualProviderModernIOS alternateBarBackground](self, "alternateBarBackground");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_storeStrong((id *)&self->_backgroundView, v11);
    v12 = 0;
  }
  else
  {
    v13 = -[_UIBarBackground initWithFrame:]([_UIBarBackground alloc], "initWithFrame:", v4, v6, v8, v10);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v13;

    v12 = 1;
    -[_UIBarBackground setTopAligned:](self->_backgroundView, "setTopAligned:", 1);
  }
  self->_usesBarBackground = v12;
  objc_initWeak(&location, self);
  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = __50___UINavigationBarVisualProviderModernIOS_prepare__block_invoke;
  v34 = &unk_1E16B6588;
  objc_copyWeak(&v35, &location);
  +[_UIBarBackgroundLayoutPrototyping registerPrototypingCallback:](_UIBarBackgroundLayoutPrototyping, "registerPrototypingCallback:", &v31);
  v15 = [_UINavigationBarContentView alloc];
  -[_UINavigationBarVisualProvider contentViewVisualProvider](self, "contentViewVisualProvider", v31, v32, v33, v34);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[_UINavigationBarContentView initWithFrame:visualProvider:](v15, "initWithFrame:visualProvider:", v16, v4, v6, v8, v10);
  contentView = self->_contentView;
  self->_contentView = v17;

  -[_UINavigationBarContentView setDelegate:](self->_contentView, "setDelegate:", self);
  -[UINavigationBar _effectiveDelegate](self->super._navigationBar, "_effectiveDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v19, "_splitViewControllerEnforcingClass:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "primaryEdge") == 1;

  }
  else
  {
    v21 = 0;
  }
  -[_UINavigationBarContentView setStaticNavBarButtonTrailing:](self->_contentView, "setStaticNavBarButtonTrailing:", v21);
  -[_UINavigationBarContentView setStaticNavBarButtonItem:](self->_contentView, "setStaticNavBarButtonItem:", self->_staticNavBarButtonItem);
  v22 = -[_UINavigationBarLargeTitleView initWithFrame:]([_UINavigationBarLargeTitleView alloc], "initWithFrame:", v4, v6, v8, v10);
  largeTitleView = self->_largeTitleView;
  self->_largeTitleView = v22;

  -[UIView setClipsToBounds:](self->_largeTitleView, "setClipsToBounds:", 1);
  -[UIView traitCollection](self->super._navigationBar, "traitCollection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "userInterfaceIdiom");
  _UINavigationTitleAppearanceAddDefaultLargeTitleAttributes(MEMORY[0x1E0C9AA70], v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarLargeTitleView setTitleAttributes:](self->_largeTitleView, "setTitleAttributes:", v26);

  v27 = -[_UINavigationBarModernPromptView initWithFrame:]([_UINavigationBarModernPromptView alloc], "initWithFrame:", v4, v6, v8, v10);
  promptView = self->_promptView;
  self->_promptView = v27;

  v29 = objc_alloc_init(_UIPointerInteractionAssistant);
  assistant = self->_assistant;
  self->_assistant = v29;

  -[UIView addInteraction:](self->super._navigationBar, "addInteraction:", self->_assistant);
  -[_UINavigationBarContentView setAssistant:](self->_contentView, "setAssistant:", self->_assistant);
  -[_UINavigationBarLargeTitleView setAssistant:](self->_largeTitleView, "setAssistant:", self->_assistant);
  -[UIView _setWantsAutolayout](self->super._navigationBar, "_setWantsAutolayout");
  -[_UINavigationBarVisualProviderModernIOS _updateContentPriorities](self, "_updateContentPriorities");
  if (-[UIView translatesAutoresizingMaskIntoConstraints](self->super._navigationBar, "translatesAutoresizingMaskIntoConstraints"))
  {
    -[UIView _setHostsLayoutEngine:](self->super._navigationBar, "_setHostsLayoutEngine:", 1);
  }
  -[_UINavigationBarVisualProviderModernIOS _setUpContentFocusContainerGuide](self, "_setUpContentFocusContainerGuide");

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

- (void)_setUpContentFocusContainerGuide
{
  void *v3;
  UIFocusContainerGuide *v4;
  UIFocusContainerGuide *contentFocusContainerGuide;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  -[UIView _focusSystem](self->super._navigationBar, "_focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!self->_contentFocusContainerGuide)
    {
      v4 = objc_alloc_init(UIFocusContainerGuide);
      contentFocusContainerGuide = self->_contentFocusContainerGuide;
      self->_contentFocusContainerGuide = v4;

      -[UIView addLayoutGuide:](self->super._navigationBar, "addLayoutGuide:", self->_contentFocusContainerGuide);
      -[UILayoutGuide setIdentifier:](self->_contentFocusContainerGuide, "setIdentifier:", CFSTR("UINavigationBarContentFocusContainerGuide"));
      v16 = (void *)MEMORY[0x1E0D156E0];
      -[UILayoutGuide topAnchor](self->_contentFocusContainerGuide, "topAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self->super._navigationBar, "topAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v17;
      -[UILayoutGuide leadingAnchor](self->_contentFocusContainerGuide, "leadingAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->super._navigationBar, "leadingAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "constraintEqualToAnchor:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v8;
      -[UILayoutGuide trailingAnchor](self->_contentFocusContainerGuide, "trailingAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->super._navigationBar, "trailingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2] = v11;
      -[UILayoutGuide bottomAnchor](self->_contentFocusContainerGuide, "bottomAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->super._navigationBar, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[3] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "activateConstraints:", v15);

    }
  }
}

- (id)alternateBarBackground
{
  return 0;
}

- (void)navigationBarContentViewDidChangeTintColor:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setTintColor:](self->_customizationContainerView, "setTintColor:", v4);

  if (self->_isActiveTabBarHost)
  {
    objc_msgSend(v6, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITabContainerView setOverlaySidebarButtonTintColor:](self->_tabBarHostedView, "setOverlaySidebarButtonTintColor:", v5);

  }
}

- (void)_layoutInBounds:(CGRect)a3
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  char v8;
  double *p_backgroundAlpha;
  double backgroundAlpha;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  double v27;
  id v28;

  height = a3.size.height;
  width = a3.size.width;
  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry", a3.origin.x, a3.origin.y);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "activeLayout");
  v7 = objc_claimAutoreleasedReturnValue();
  if (self->_backgroundTransparentWhenNotCollapsed)
  {
    v8 = 1;
  }
  else if (self->_transitionContext
         || -[_UINavigationBarVisualProviderModernIOS _stackWantsSearchDisplayedBelowContentViewForItem:](self, "_stackWantsSearchDisplayedBelowContentViewForItem:", v6)|| -[_UINavigationBarVisualProviderModernIOS _stackWantsLargeTitleDisplayedForItem:](self, "_stackWantsLargeTitleDisplayedForItem:", v6))
  {
    v8 = 0;
  }
  else
  {
    v8 = !-[_UINavigationBarVisualProviderModernIOS _stackWantsBottomPaletteDisplayedForItem:](self, "_stackWantsBottomPaletteDisplayedForItem:", v6);
  }
  if (v7)
  {
    *(_BYTE *)(v7 + 109) = v8;
    p_backgroundAlpha = &self->_backgroundAlpha;
    backgroundAlpha = self->_backgroundAlpha;
    if (*(double *)(v7 + 208) != backgroundAlpha)
    {
      *(double *)(v7 + 208) = backgroundAlpha;
      objc_msgSend((id)v7, "_updateLayoutOutputs");
    }
  }
  else
  {
    p_backgroundAlpha = &self->_backgroundAlpha;
  }
  objc_msgSend(v28, "normalLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((void *)v7 == v11)
  {
    if (!-[_UITabContainerView canShowFloatingTabBar](self->_tabBarHostedView, "canShowFloatingTabBar"))
    {
      if (v7)
      {
        v12 = *(id *)(v7 + 144);
        if (v12 && objc_msgSend(v6, "largeTitleDisplayMode") == 3)
        {
          v13 = *(id *)(v7 + 160);
          objc_msgSend(v13, "backButton");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            if (!*(_BYTE *)(v7 + 108))
            {
              *(_BYTE *)(v7 + 108) = 1;
              objc_msgSend((id)v7, "_updateContentViewLayoutItem");
              objc_msgSend((id)v7, "_updateLargeTitleViewLayoutItem");
              objc_msgSend((id)v7, "_updateRefreshControlLayoutData");
            }
            v15 = *(id *)(v7 + 160);
            if (objc_msgSend(v15, "leadingGroupsMode") == 1)
              objc_msgSend(v15, "setLeadingGroupsMode:", 2);
            if (objc_msgSend(v15, "centerGroupsMode") == 1)
              objc_msgSend(v15, "setCenterGroupsMode:", 2);

            goto LABEL_30;
          }
          goto LABEL_28;
        }
      }
      else
      {
        v12 = 0;
      }

    }
    if (!v7)
      goto LABEL_30;
LABEL_28:
    if (*(_BYTE *)(v7 + 108))
    {
      *(_BYTE *)(v7 + 108) = 0;
      objc_msgSend((id)v7, "_updateContentViewLayoutItem");
      objc_msgSend((id)v7, "_updateLargeTitleViewLayoutItem");
      objc_msgSend((id)v7, "_updateRefreshControlLayoutData");
    }
  }
LABEL_30:
  -[_UINavigationBarLayout setLayoutSize:](v7, width, height);
  -[_UINavigationBarLayout layoutViews](v7);
  -[_UINavigationBarVisualProviderModernIOS applyBarBackground:alpha:](self, "applyBarBackground:alpha:", self->_backgroundView, *p_backgroundAlpha);
  if (!self->_transitionContext)
  {
    -[UIView setFrame:](self->_backgroundView, "setFrame:", -[_UINavigationBarLayout backgroundViewLayoutFrame](v7));
    if (self->_usesBarBackground)
    {
      -[_UIBarBackground layout](self->_backgroundView, "layout");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v7)
      {
        objc_msgSend(v16, "setBackgroundTransitionProgress:", *(double *)(v7 + 288));
        v18 = *(double *)(v7 + 296);
      }
      else
      {
        v18 = 0.0;
        objc_msgSend(v16, "setBackgroundTransitionProgress:", 0.0);
      }
      objc_msgSend(v17, "setBackgroundAlpha:", v18);
      -[_UIBarBackground transitionBackgroundViews](self->_backgroundView, "transitionBackgroundViews");

    }
    if (!self->_transitionContext)
    {
      -[UIView window](self->_weeTitleLabel, "window");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {

LABEL_39:
        if (v7)
        {
          v20 = *(id *)(v7 + 144);
          if (v20)
          {
            v21 = v20;
            v22 = *(id *)(v7 + 232);
            if (v22)
            {
              v23 = v22;
              -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "_weeTitle");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "length");

              v27 = 1.0;
              if (v26)
              {
LABEL_46:
                -[UIView setAlpha:](self->_weeTitleLabel, "setAlpha:", v27);
                goto LABEL_47;
              }
            }
            else
            {

            }
          }
        }
        v27 = 0.0;
        goto LABEL_46;
      }
      if (!+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))goto LABEL_39;
    }
  }
LABEL_47:

}

- (void)_updateBackground
{
  _BOOL8 v3;
  void *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  _UINavigationBarVisualProviderModernIOS *v16;
  _UINavigationBarVisualProviderModernIOS *v17;
  double backgroundAlpha;
  id v19;

  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[UIView _canDrawContent](self->super._navigationBar, "_canDrawContent");
  -[UIView setHidden:](self->_backgroundView, "setHidden:", v3);
  if (v3)
  {
    -[UIView setNeedsDisplay](self->super._navigationBar, "setNeedsDisplay");
    goto LABEL_30;
  }
  objc_msgSend(v19, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UINavigationBar _activeBarMetrics](self->super._navigationBar, "_activeBarMetrics");
  objc_msgSend(v19, "activeLayout");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = v5 == 102 || v5 == 1;
  if (v5 == 102 || v5 == 1)
  {
    if (v6)
    {
      v10 = *(void **)(v6 + 184);
LABEL_15:
      v11 = v10;
      goto LABEL_16;
    }
  }
  else if (v6)
  {
    v10 = *(void **)(v6 + 192);
    goto LABEL_15;
  }
  v10 = 0;
  v11 = 0;
LABEL_16:
  v12 = v10;

  -[_UINavigationBarVisualProviderModernIOS _updateBackgroundLayout:forNavigationItem:compact:](self, "_updateBackgroundLayout:forNavigationItem:compact:", v12, v4, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v14 = *(double *)(v7 + 288);
  else
    v14 = 0.0;
  objc_msgSend(v13, "setBackgroundTransitionProgress:", v14);
  if (v5 != 102 && v5 != 1)
  {
    -[_UINavigationBarLayout setStandardBackgroundViewLayout:]((id *)v7, v13);
    if (v7)
      goto LABEL_21;
LABEL_23:
    v15 = 1.0;
    goto LABEL_24;
  }
  -[_UINavigationBarLayout setCompactBackgroundViewLayout:](v7, v13);
  if (!v7)
    goto LABEL_23;
LABEL_21:
  v15 = *(double *)(v7 + 296);
LABEL_24:
  objc_msgSend(v13, "setBackgroundAlpha:", v15);
  if (self->_usesBarBackground)
  {
    -[_UIBarBackground setLayout:](self->_backgroundView, "setLayout:", v13);
    -[_UINavigationBarVisualProviderModernIOS updateBackgroundGroupName](self, "updateBackgroundGroupName");
    -[_UIBarBackground transitionBackgroundViews](self->_backgroundView, "transitionBackgroundViews");
  }
  else
  {
    v16 = self;
    v17 = v16;
    backgroundAlpha = v16->_backgroundAlpha;
    if (!self->_usesBarBackground)
    {
      -[_UINavigationBarVisualProviderModernIOS alphaForBarBackground:preferredAlpha:navigationItem:](v16, "alphaForBarBackground:preferredAlpha:navigationItem:", self->_backgroundView, v4, backgroundAlpha);
      v17->_backgroundAlpha = backgroundAlpha;
    }
    -[_UINavigationBarVisualProviderModernIOS applyBarBackground:alpha:](v17, "applyBarBackground:alpha:", self->_backgroundView, backgroundAlpha);

  }
  -[UINavigationBar _updatePaletteBackgroundIfNecessary](self->super._navigationBar, "_updatePaletteBackgroundIfNecessary");

LABEL_30:
}

- (void)updateBackgroundGroupName
{
  void *v3;
  void *v4;
  id v5;

  if (self->_usesBarBackground)
  {
    -[UIView traitCollection](self->super._navigationBar, "traitCollection");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForTrait:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBarBackground setGroupName:](self->_backgroundView, "setGroupName:", v4);

  }
}

- (id)_updateBackgroundLayout:(id)a3 forNavigationItem:(id)a4 compact:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  SEL v17;
  _UINavigationBarVisualProviderModernIOS *v18;
  uint64_t v19;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  if (!-[UIView _canDrawContent](self->super._navigationBar, "_canDrawContent"))
  {
    if (+[_UIBarBackgroundLayoutPrototyping prototypingEnabled](_UIBarBackgroundLayoutPrototyping, "prototypingEnabled"))
    {
      +[_UIBarBackgroundLayoutPrototyping prototypingLayoutForBarType:](_UIBarBackgroundLayoutPrototyping, "prototypingLayoutForBarType:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
      v9 = v12;
      v11 = v9;
      goto LABEL_17;
    }
    if (self->_appearanceAPIVersion >= 2)
    {
      -[_UINavigationBarVisualProviderModernIOS _backgroundLayoutOfClass:fromLayout:](self, "_backgroundLayoutOfClass:fromLayout:", objc_opt_class(), v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UINavigationBarVisualProviderModernIOS _updateModernLayout:forNavigationItem:compact:](self, "_updateModernLayout:forNavigationItem:compact:", v12, v10, v5);
      goto LABEL_16;
    }
    -[_UINavigationBarVisualProviderModernIOS _backgroundLayoutOfClass:fromLayout:](self, "_backgroundLayoutOfClass:fromLayout:", objc_opt_class(), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[UINavigationBar _activeBarMetrics](self->super._navigationBar, "_activeBarMetrics");
    if (v5)
    {
      if (v13 == 1 || v13 == 102)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("LEGACY: Trying to update background for compact size while bar is not in compact size is not supported");
      v17 = a2;
      v18 = self;
      v19 = 2152;
    }
    else
    {
      if (!v13 || v13 == 101)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("LEGACY: Trying to update background for default size while bar is not in default size is not supported");
      v17 = a2;
      v18 = self;
      v19 = 2154;
    }
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", v17, v18, CFSTR("_UINavigationBarVisualProviderModernIOS.m"), v19, v16);

LABEL_15:
    -[_UINavigationBarVisualProviderModernIOS _updateLegacyLayout:forNavigationItem:](self, "_updateLegacyLayout:forNavigationItem:", v12, v10);
    goto LABEL_16;
  }
  v11 = 0;
LABEL_17:

  return v11;
}

- (id)_backgroundLayoutOfClass:(Class)a3 fromLayout:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = (void *)objc_msgSend([a3 alloc], "initWithLayout:", v6);

  }
  -[UIView traitCollection](self->super._navigationBar, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInterfaceIdiom:", objc_msgSend(v8, "userInterfaceIdiom"));
  objc_msgSend(v7, "setInterfaceStyle:", objc_msgSend(v8, "userInterfaceStyle"));

  return v7;
}

- (BOOL)_stackWantsSearchDisplayedBelowContentViewForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  if (!v4)
  {
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "_searchControllerIfAllowed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "_stackEntry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isSearchActive"))
      v7 = objc_msgSend(v5, "hidesNavigationBarDuringPresentation") ^ 1;
    else
      LOBYTE(v7) = 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_stackWantsBottomPaletteDisplayedForItem:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (!v4)
  {
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "_bottomPalette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (id)traitCollectionForChild:(id)a3 baseTraitCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  id v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_appearanceAPIVersion > 1
    || ((v9 = objc_msgSend(v7, "userInterfaceStyle"),
         (unint64_t)(-[UINavigationBar barStyle](self->super._navigationBar, "barStyle") - 3) >= 0xFFFFFFFFFFFFFFFELL)
      ? (v10 = v9 == 2)
      : (v10 = 1),
        v10))
  {
    v11 = v8;
  }
  else
  {
    objc_msgSend(v8, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", 2, 0x1E1A994B0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (void)_updateLegacyLayout:(id)a3 forNavigationItem:(id)a4
{
  id v6;
  UINavigationBar *navigationBar;
  id v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  UIBarStyle v12;
  UIBarStyle v13;
  UINavigationBar *v14;
  id v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  char v19;
  BOOL v20;
  char v21;
  id v22;

  v6 = a3;
  navigationBar = self->super._navigationBar;
  v8 = a4;
  v9 = -[UINavigationBar isTranslucent](navigationBar, "isTranslucent");
  -[UINavigationBar backgroundEffects](self->super._navigationBar, "backgroundEffects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationBar _effectiveBarTintColor](self->super._navigationBar, "_effectiveBarTintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UINavigationBar barStyle](self->super._navigationBar, "barStyle");
  v13 = v12;
  if (v10)
  {
    objc_msgSend(v6, "configureWithEffects:", v10);
  }
  else if (v12 == 4
         || (v14 = self->super._navigationBar,
             v22 = 0,
             -[UINavigationBar _getBackgroundImage:shouldRespectOversizedBackgroundImage:actualBarMetrics:actualBarPosition:](v14, "_getBackgroundImage:shouldRespectOversizedBackgroundImage:actualBarMetrics:actualBarPosition:", &v22, 0, 0, 0), (v15 = v22) == 0))
  {
    objc_msgSend(v6, "configureEffectForStyle:backgroundTintColor:forceOpaque:", v13, v11, !v9);
  }
  else
  {
    v16 = v15;
    self->_backgroundTransparentWhenNotCollapsed = 1;
    v21 = 0;
    objc_msgSend(v15, "_isInvisibleAndGetIsTranslucent:", &v21);
    if (v9)
    {
      objc_msgSend(v6, "configureImage:forceTranslucent:", v16, v21 == 0);
    }
    else
    {
      v17 = v21 != 0;
      if (v11)
        objc_msgSend(v6, "configureImage:forceOpaque:backgroundTintColor:", v16, v17, v11);
      else
        objc_msgSend(v6, "configureImage:forceOpaque:barStyle:", v16, v17, v13);
    }

  }
  -[UINavigationBar shadowImage](self->super._navigationBar, "shadowImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v8, "_backgroundHidden");

  if ((v19 & 1) == 0)
  {
    v20 = -[UINavigationBar _hidesShadow](self->super._navigationBar, "_hidesShadow");
    if (v18 && !v20)
    {
      objc_msgSend(v6, "configureShadowImage:", v18);
      goto LABEL_19;
    }
    if (!v20)
    {
      objc_msgSend(v6, "configureShadowForBarStyle:", v13);
      goto LABEL_19;
    }
  }
  objc_msgSend(v6, "configureWithoutShadow");
LABEL_19:
  objc_msgSend(v6, "setShadowAlpha:", self->_shadowAlpha);

}

- (id)_backButtonMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id location;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!_UINavigationBarBackButtonShowsContextMenu())
    return 0;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58___UINavigationBarVisualProviderModernIOS__backButtonMenu__block_invoke;
  v8[3] = &unk_1E16B6600;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  +[UIDeferredMenuElement elementWithProvider:](UIDeferredMenuElement, "elementWithProvider:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setMaximumNumberOfTitleLines:", 1);
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDisplayPreferences:", v4);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

- (id)_shim_compatibilityBackgroundView
{
  _UIBarBackground *v3;
  _UIBarBackground *backgroundView;
  _UIBarBackground *v5;

  if (self->_usesBarBackground)
  {
    -[_UIBarBackground customBackgroundView](self->_backgroundView, "customBackgroundView");
    v3 = (_UIBarBackground *)objc_claimAutoreleasedReturnValue();
    backgroundView = v3;
    if (!v3)
      backgroundView = self->_backgroundView;
    v5 = backgroundView;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)barDidMoveToWindow
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[UIView subviews](self->super._navigationBar, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        -[_UINavigationBarVisualProviderModernIOS _setupAccessibilityLimitsForView:](self, "_setupAccessibilityLimitsForView:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  if (self->_customizer)
  {
    -[UIView window](self->super._navigationBar, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __61___UINavigationBarVisualProviderModernIOS_barDidMoveToWindow__block_invoke;
      v9[3] = &unk_1E16B1B28;
      v9[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);
    }
  }
}

- (void)_setupAccessibilityLimitsForView:(id)a3
{
  _UINavigationBarContentView *v4;
  void *v5;
  _UINavigationBarContentView *v6;

  v4 = (_UINavigationBarContentView *)a3;
  if (self->_contentView == v4 || (_UINavigationBarContentView *)self->_promptView == v4)
  {
    v6 = v4;
    -[UIView window](self->super._navigationBar, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v6;
    if (v5)
    {
      _UIBarsSetAccessibilityLimits(v6);
      v4 = v6;
    }
  }

}

- (BOOL)navigationItemIsTopItem:(id)a3
{
  _UINavigationBarItemStack *stack;
  id v4;
  id v5;

  stack = self->super._stack;
  v4 = a3;
  -[_UINavigationBarItemStack topItem](stack, "topItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (void)navigationItemUpdatedSearchController:(id)a3 oldSearchController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  int has_internal_diagnostics;
  NSObject *v11;
  int v12;
  void *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_stackEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_searchControllerIfAllowed");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v7)
    goto LABEL_24;
  if ((objc_msgSend(v8, "isSearchActive") & 1) != 0 || objc_msgSend(v7, "isActive"))
  {
    if (!objc_msgSend(v8, "isSearchActive") || (objc_msgSend(v7, "isActive") & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v34, OS_LOG_TYPE_FAULT, "Inconsistent state handled when removing old search controller. Investigate if repro steps are available. Otherwise, ignore.", buf, 2u);
        }

      }
      else
      {
        v30 = qword_1ECD78E18;
        if (!qword_1ECD78E18)
        {
          v30 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v30, (unint64_t *)&qword_1ECD78E18);
        }
        v31 = *(NSObject **)(v30 + 8);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v31, OS_LOG_TYPE_ERROR, "Inconsistent state handled when removing old search controller. Investigate if repro steps are available. Otherwise, ignore.", buf, 2u);
        }
      }
    }
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    objc_msgSend(v7, "searchBar");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = -[NSObject _isHostedInlineByNavigationBar](v11, "_isHostedInlineByNavigationBar");
    if (has_internal_diagnostics)
    {
      if (!v12)
      {
        objc_msgSend(v7, "searchBar");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "window");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v33)
          goto LABEL_15;
        __UIFaultDebugAssertLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v8, "item");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v42 = v7;
          v43 = 2112;
          v44 = v17;
          _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Someone is removing an active search controller while its search bar is visible. The UI probably looks terrible. Search controller being removed: %@ from navigation item: %@", buf, 0x16u);
LABEL_13:

        }
      }
    }
    else if (!v12)
    {
      objc_msgSend(v7, "searchBar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_15;
      v15 = qword_1ECD78E20;
      if (!qword_1ECD78E20)
      {
        v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&qword_1ECD78E20);
      }
      v16 = *(NSObject **)(v15 + 8);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      v11 = v16;
      objc_msgSend(v8, "item");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v42 = v7;
      v43 = 2112;
      v44 = v17;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Someone is removing an active search controller while its search bar is visible. The UI probably looks terrible. Search controller being removed: %@ from navigation item: %@", buf, 0x16u);
      goto LABEL_13;
    }

LABEL_15:
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __101___UINavigationBarVisualProviderModernIOS_navigationItemUpdatedSearchController_oldSearchController___block_invoke;
    v38 = &unk_1E16B1B50;
    v39 = v7;
    v40 = v8;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &v35);

  }
  objc_msgSend(v7, "searchBar", v35, v36, v37, v38);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isDescendantOfView:", self->super._navigationBar) & 1) != 0
    || (objc_msgSend(v18, "_existingSearchIconBarButtonItem"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v19, "view"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v20, "isDescendantOfView:", self->super._navigationBar),
        v20,
        v19,
        v21))
  {
    objc_msgSend(v18, "_resetIfNecessaryForNavigationBarHosting:", 0);
    objc_msgSend(v18, "_setMinimumContentSizeCategory:", 0);
    objc_msgSend(v18, "_setMaximumContentSizeCategory:", 0);
    objc_msgSend(v18, "removeFromSuperview");
    objc_msgSend(v18, "_existingSearchIconBarButtonItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeFromSuperview");

  }
  objc_msgSend(v9, "searchBar");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_resetIfNecessaryForNavigationBarHosting:", 1);
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (v25 == v6)
  {
    v26 = objc_msgSend(v6, "_hasInlineSearchBar");

    if (v26)
      -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");
  }
  else
  {

  }
LABEL_24:
  if (v9)
  {
    -[_UINavigationBarVisualProviderModernIOS _ensureLayoutsConfiguredForEntry:](self, "_ensureLayoutsConfiguredForEntry:", v8);
    objc_msgSend(v8, "setSearchActive:", objc_msgSend(v9, "isActive"));
  }
  else
  {
    objc_msgSend(v8, "normalLayout");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarLayout setSearchBar:]((uint64_t)v27, 0);

    objc_msgSend(v8, "setSearchLayout:", 0);
  }
  -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");
  -[_UINavigationBarVisualProvider navigationBar](self, "navigationBar");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "delegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v29, "_navigationItemDidUpdateSearchController:oldSearchController:", v6, v7);
  -[UINavigationBar _accessibility_navigationBarContentsDidChange](self->super._navigationBar, "_accessibility_navigationBarContentsDidChange");

}

- (BOOL)_isInInteractiveScroll
{
  void *v2;
  char v3;

  -[UINavigationBar delegate](self->super._navigationBar, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "_navigationBarLayoutIsInInteractiveScroll");
  else
    v3 = 0;

  return v3;
}

- (void)_prepareLayouts
{
  void *v3;
  id v4;

  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProviderModernIOS _ensureLayoutsConfiguredForEntry:](self, "_ensureLayoutsConfiguredForEntry:", v3);

  -[_UINavigationBarItemStack previousTopEntry](self->super._stack, "previousTopEntry");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProviderModernIOS _ensureLayoutsConfiguredForEntry:](self, "_ensureLayoutsConfiguredForEntry:", v4);

}

- (void)pushAnimated:(BOOL)a3 completion:(id)a4
{
  if (a3)
    -[_UINavigationBarVisualProviderModernIOS _performAnimationWithTransitionCompletion:transition:](self, "_performAnimationWithTransitionCompletion:transition:", a4, 1);
  else
    -[_UINavigationBarVisualProviderModernIOS _updateWithCompletion:](self, "_updateWithCompletion:", a4);
}

- (void)prepareForPush
{
  void *v3;

  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProviderModernIOS _upgradeAppearanceAPIForItemIfNecessary:](self, "_upgradeAppearanceAPIForItemIfNecessary:", v3);

  -[_UINavigationBarVisualProviderModernIOS _prepareLayouts](self, "_prepareLayouts");
}

- (void)_upgradeAppearanceAPIForItemIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (self->_appearanceAPIVersion <= 1)
  {
    v7 = v4;
    objc_msgSend(v4, "standardAppearance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 || (objc_msgSend(v7, "compactAppearance"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      objc_msgSend(v7, "scrollEdgeAppearance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v7;
      if (!v6)
        goto LABEL_6;
    }
    -[_UINavigationBarVisualProviderModernIOS setAppearanceAPIVersion:](self, "setAppearanceAPIVersion:", 2);
    v4 = v7;
  }
LABEL_6:

}

- (void)_updateWithCompletion:(id)a3
{
  _UINavigationBarItemStack *stack;
  void (**v5)(id, _QWORD, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  stack = self->super._stack;
  v5 = (void (**)(id, _QWORD, void *))a3;
  -[_UINavigationBarItemStack backItem](stack, "backItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setTitleViewDataSource:", 0);

  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setTitleViewDataSource:", self->_contentView);

  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProviderModernIOS _ensureLayoutsConfiguredForEntry:](self, "_ensureLayoutsConfiguredForEntry:", v8);

  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeLayout");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[_UINavigationBarItemStack previousTopEntry](self->super._stack, "previousTopEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeLayout");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v14)
    -[_UINavigationBarLayout removeViewsNotInLayout:](v11, v14);
  else
    -[_UINavigationBarLayout removeAllViews](v11);

  -[_UINavigationBarVisualProviderModernIOS layoutSubviews](self, "layoutSubviews");
  -[_UINavigationBarVisualProviderModernIOS _updateContentPriorities](self, "_updateContentPriorities");
  -[_UINavigationBarItemStack transitionAssistant](self->super._stack, "transitionAssistant");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v13);

}

- (void)stackDidChangeFrom:(id)a3
{
  -[_UINavigationBarItemStack setChangeObserver:](self->super._stack, "setChangeObserver:", self);
}

- (int64_t)appearanceAPIVersion
{
  return self->_appearanceAPIVersion;
}

- (void)setAppearanceAPIVersion:(int64_t)a3
{
  int64_t appearanceAPIVersion;
  _UINavigationBarItemStack *stack;
  void *v8;
  _QWORD v9[5];

  appearanceAPIVersion = self->_appearanceAPIVersion;
  if (appearanceAPIVersion > a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarVisualProviderModernIOS.m"), 592, CFSTR("We shouldn't be decreasing the API version... right?"));

    appearanceAPIVersion = self->_appearanceAPIVersion;
  }
  if (appearanceAPIVersion != a3)
  {
    self->_appearanceAPIVersion = a3;
    self->_useModernAppearanceAPI = a3 > 1;
    if (a3 >= 2)
    {
      stack = self->super._stack;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __67___UINavigationBarVisualProviderModernIOS_setAppearanceAPIVersion___block_invoke;
      v9[3] = &unk_1E16B5CA0;
      v9[4] = self;
      -[_UINavigationBarItemStack iterateEntries:](stack, "iterateEntries:", v9);
    }
  }
}

- (void)removeContentForItem:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "_stackEntry");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "normalLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarLayout removeAllViews]((uint64_t)v3);

  objc_msgSend(v5, "searchLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarLayout removeAllViews]((uint64_t)v4);

}

- (void)_updateModernLayout:(id)a3 forNavigationItem:(id)a4 compact:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  UINavigationBar *navigationBar;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UINavigationBar *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;

  v5 = a5;
  v8 = a4;
  navigationBar = self->super._navigationBar;
  v22 = v8;
  if (!v5)
  {
    v15 = navigationBar;
    v16 = a3;
    objc_msgSend(v22, "standardAppearance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      -[UINavigationBar standardAppearance](v15, "standardAppearance");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v19;

    objc_msgSend(v21, "_backgroundData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "scrollEdgeAppearance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      -[UINavigationBar scrollEdgeAppearance](self->super._navigationBar, "scrollEdgeAppearance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[_UIBarBackgroundAppearanceData transparentBackgroundData](_UIBarBackgroundAppearanceData, "transparentBackgroundData");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    goto LABEL_11;
  }
  v10 = a3;
  _compactAppearance(navigationBar, v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_backgroundData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[_UINavigationBarVisualProviderModernIOS alwaysEvaluateChromelessTransitionProgress](self, "alwaysEvaluateChromelessTransitionProgress"))
  {
    _nullableCompactScrollEdgeAppearance(self->super._navigationBar, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[_UIBarBackgroundAppearanceData transparentBackgroundData](_UIBarBackgroundAppearanceData, "transparentBackgroundData");
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v20 = (id)v14;

      goto LABEL_13;
    }
LABEL_11:
    objc_msgSend(v13, "_backgroundData");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v20 = v12;
  v12 = v20;
LABEL_13:
  objc_msgSend(a3, "setBackgroundData1:", v12);
  objc_msgSend(a3, "setBackgroundData2:", v20);

}

- (void)prepareForStackChange
{
  void *v3;

  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProviderModernIOS _upgradeAppearanceAPIForItemIfNecessary:](self, "_upgradeAppearanceAPIForItemIfNecessary:", v3);

  -[_UINavigationBarVisualProviderModernIOS _prepareLayouts](self, "_prepareLayouts");
}

- (void)setStaticNavBarButtonLingers:(BOOL)a3
{
  -[_UINavigationBarContentView setStaticNavBarButtonLingers:](self->_contentView, "setStaticNavBarButtonLingers:", a3);
}

- (void)changeAppearance
{
  void *v3;

  -[UINavigationBar largeTitleTextAttributes](self->super._navigationBar, "largeTitleTextAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarLargeTitleView setTitleAttributes:](self->_largeTitleView, "setTitleAttributes:", v3);

  -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");
  -[_UINavigationBarVisualProviderModernIOS _installWindowMoveClientInteractionIfNecessary](self, "_installWindowMoveClientInteractionIfNecessary");
}

- (void)_installWindowMoveClientInteractionIfNecessary
{
  _BOOL4 v3;
  UIWindowSceneDragInteraction *windowDragClientInteraction;
  UIWindowSceneDragInteraction *v5;
  UIWindowSceneDragInteraction *v6;

  v3 = -[_UINavigationBarVisualProviderModernIOS _wantsWindowMoveClientInteractionInstalled](self, "_wantsWindowMoveClientInteractionInstalled");
  windowDragClientInteraction = self->_windowDragClientInteraction;
  if (v3)
  {
    if (!windowDragClientInteraction)
    {
      v5 = objc_alloc_init(UIWindowSceneDragInteraction);
      v6 = self->_windowDragClientInteraction;
      self->_windowDragClientInteraction = v5;

      windowDragClientInteraction = self->_windowDragClientInteraction;
    }
    -[UIView addInteraction:](self->super._navigationBar, "addInteraction:", windowDragClientInteraction);
  }
  else if (windowDragClientInteraction)
  {
    -[UIView removeInteraction:](self->super._navigationBar, "removeInteraction:");
  }
}

- (BOOL)_wantsWindowMoveClientInteractionInstalled
{
  void *v3;
  uint64_t v4;
  char v5;
  BOOL v6;

  -[UIView traitCollection](self->super._navigationBar, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = _os_feature_enabled_impl();
  if (-[UINavigationBar barPosition](self->super._navigationBar, "barPosition") == 3)
    v6 = v5;
  else
    v6 = 0;
  return v4 == 1 && v6;
}

- (void)navigationItemUpdatedLargeTitleDisplayMode:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!-[_UINavigationBarItemStack state](self->super._stack, "state"))
  {
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v4 == v6)
    {
      if (_UIBarsApplyChromelessEverywhere())
      {
        -[_UINavigationBarVisualProviderModernIOS changeLayout](self, "changeLayout");
        -[UINavigationBar _effectiveDelegate](self->super._navigationBar, "_effectiveDelegate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v5, "_navigationBar:topItemUpdatedLargeTitleDisplayMode:", self->super._navigationBar, v6);

      }
    }
  }

}

- (void)changeLayout
{
  void *v3;
  void *v4;

  -[_UINavigationBarContentView setRequestedContentSize:](self->_contentView, "setRequestedContentSize:", -[UINavigationBar requestedContentSize](self->super._navigationBar, "requestedContentSize"));
  -[_UINavigationBarVisualProviderModernIOS _updateContentPriorities](self, "_updateContentPriorities");
  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarLayout updateLayout]((uint64_t)v4);

  -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");
  -[_UINavigationBarVisualProviderModernIOS _invalidateIntrinsicContentSizeAndNotifySizeChanged](self, "_invalidateIntrinsicContentSizeAndNotifySizeChanged");
}

- (void)safeAreaInsetsDidChange
{
  -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");
  -[UIView setNeedsLayout](self->_largeTitleView, "setNeedsLayout");
}

- (void)navigationBarInvalidatedResolvedLayoutMargins
{
  void *v2;
  void *v3;
  id v4;

  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_searchControllerIfAllowed");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateEffectiveContentInset");

}

- (void)navigationItemUpdatedRightBarButtonItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if (!-[_UINavigationBarItemStack state](self->super._stack, "state"))
  {
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v8)
    {
      -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarVisualProviderModernIOS _updateContentForTopItem:backItem:animated:](self, "_updateContentForTopItem:backItem:animated:", v8, v7, v4);

    }
  }

}

- (void)navigationItemUpdatedLeftBarButtonItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if (!-[_UINavigationBarItemStack state](self->super._stack, "state"))
  {
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v8)
    {
      -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarVisualProviderModernIOS _updateContentForTopItem:backItem:animated:](self, "_updateContentForTopItem:backItem:animated:", v8, v7, v4);

    }
  }

}

- (void)navigationItemUpdatedCenterBarButtonItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v4 = a4;
  v8 = a3;
  if (!-[_UINavigationBarItemStack state](self->super._stack, "state"))
  {
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v8)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __94___UINavigationBarVisualProviderModernIOS_navigationItemUpdatedCenterBarButtonItems_animated___block_invoke;
      v9[3] = &unk_1E16B1B28;
      v9[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);
      -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarVisualProviderModernIOS _updateContentForTopItem:backItem:animated:](self, "_updateContentForTopItem:backItem:animated:", v8, v7, v4);

    }
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  BOOL *p_hasIdiom;
  _BOOL4 hasIdiom;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  -[UIView traitCollection](self->super._navigationBar, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "userInterfaceIdiom");
    v7 = v6 == -1;
    p_hasIdiom = &self->_hasIdiom;
    hasIdiom = self->_hasIdiom;
    if (!self->_hasIdiom && v6 != -1)
    {
      *p_hasIdiom = 1;
      -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");
      hasIdiom = 0;
      goto LABEL_16;
    }
  }
  else
  {
    p_hasIdiom = &self->_hasIdiom;
    hasIdiom = self->_hasIdiom;
    v7 = 1;
  }
  if (!hasIdiom || !v7)
  {
    v12 = objc_msgSend(v5, "horizontalSizeClass");
    if (v12 != objc_msgSend(v21, "horizontalSizeClass")
      || (v13 = objc_msgSend(v5, "verticalSizeClass"), v13 != objc_msgSend(v21, "verticalSizeClass")))
    {
      -[_UINavigationBarVisualProviderModernIOS _updateContentPriorities](self, "_updateContentPriorities");
    }
  }
  else
  {
    *p_hasIdiom = 0;
    hasIdiom = 1;
  }
LABEL_16:
  -[_UINavigationBarContentView updateAugmentedTitleViewNavigationBarTraitsTo:from:](self->_contentView, "updateAugmentedTitleViewNavigationBarTraitsTo:from:", v5, v21);
  -[_UINavigationBarVisualProviderModernIOS _setUpContentFocusContainerGuide](self, "_setUpContentFocusContainerGuide");
  if (v21 && hasIdiom && *p_hasIdiom)
  {
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "_hasInlineSearchBar");
    if ((_DWORD)v15 != objc_msgSend(v14, "_hasInlineSearchBarForTraits:", v21))
    {
      objc_msgSend(v14, "_searchControllerIfAllowed");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "searchBar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_setHostedInlineByNavigationBar:", v15);

      objc_msgSend(v16, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if ((_DWORD)v15)
          v19 = 2;
        else
          v19 = 1;
        objc_msgSend(v18, "searchController:didChangeFromSearchBarPlacement:", v16, v19);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if ((_DWORD)v15)
          v20 = 1;
        else
          v20 = 2;
        objc_msgSend(v18, "_dci_searchController:didChangeToSearchBarPlacement:", v16, v20);
      }

    }
  }

}

- (void)navigationItem:(id)a3 appearance:(id)a4 categoriesChanged:(int64_t)a5
{
  id v6;
  id v7;

  v7 = a3;
  if (!-[_UINavigationBarItemStack state](self->super._stack, "state"))
  {
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      -[_UINavigationBarVisualProviderModernIOS _upgradeAppearanceAPIForItemIfNecessary:](self, "_upgradeAppearanceAPIForItemIfNecessary:", v7);
      -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");
    }

  }
}

- (void)appearance:(id)a3 categoriesChanged:(int64_t)a4
{
  -[_UINavigationBarVisualProviderModernIOS setAppearanceAPIVersion:](self, "setAppearanceAPIVersion:", 2, a4);
  -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");
}

- (id)_defaultWeeTitleAttributes
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleEmphasizedFootnote"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)off_1E1678D98;
  v7[0] = *(_QWORD *)off_1E1678D90;
  v7[1] = v3;
  v8[0] = v2;
  +[UIColor grayColor](UIColor, "grayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshControlHost, 0);
  objc_storeStrong((id *)&self->_hiddenFilter, 0);
  objc_storeStrong((id *)&self->_windowDragClientInteraction, 0);
  objc_storeStrong((id *)&self->_titleRenamerSession, 0);
  objc_storeStrong((id *)&self->_titleRenamer, 0);
  objc_storeStrong((id *)&self->_customizationContainerView, 0);
  objc_storeStrong((id *)&self->_currentCustomizationSession, 0);
  objc_storeStrong((id *)&self->_customizer, 0);
  objc_storeStrong((id *)&self->_contentFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_staticNavBarButtonItem, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_tabBarHostedView, 0);
  objc_storeStrong((id *)&self->_weeTitleLabel, 0);
  objc_storeStrong((id *)&self->_assistant, 0);
  objc_storeStrong((id *)&self->_promptView, 0);
  objc_storeStrong((id *)&self->_largeTitleView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

- (void)setForceScrollEdgeAppearance:(BOOL)a3
{
  unsigned int v4;
  _UINavigationBarItemStack *stack;
  _QWORD v6[5];

  v4 = a3 & ~-[UIView _canDrawContent](self->super._navigationBar, "_canDrawContent");
  if (self->_forceScrollEdgeAppearance != v4)
  {
    self->_forceScrollEdgeAppearance = v4;
    stack = self->super._stack;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72___UINavigationBarVisualProviderModernIOS_setForceScrollEdgeAppearance___block_invoke;
    v6[3] = &unk_1E16B5CA0;
    v6[4] = self;
    -[_UINavigationBarItemStack iterateEntries:](stack, "iterateEntries:", v6);
    -[_UINavigationBarVisualProviderModernIOS _updateBackground](self, "_updateBackground");
  }
}

- (void)teardown
{
  void *v3;
  _UIBarBackground *backgroundView;
  _UINavigationBarContentView *contentView;
  _UINavigationBarLargeTitleView *largeTitleView;
  _UINavigationBarModernPromptView *promptView;
  UILabel *weeTitleLabel;
  UILabel *v9;
  UIFocusContainerGuide *contentFocusContainerGuide;
  _UINavigationBarTransitionContext *transitionContext;
  objc_super v12;

  -[UIView removeInteraction:](self->super._navigationBar, "removeInteraction:", self->_assistant);
  -[UIView layer](self->super._navigationBar, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", 0);

  -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  -[UIView removeFromSuperview](self->_contentView, "removeFromSuperview");
  contentView = self->_contentView;
  self->_contentView = 0;

  -[UIView removeFromSuperview](self->_largeTitleView, "removeFromSuperview");
  largeTitleView = self->_largeTitleView;
  self->_largeTitleView = 0;

  -[UIView removeFromSuperview](self->_promptView, "removeFromSuperview");
  promptView = self->_promptView;
  self->_promptView = 0;

  weeTitleLabel = self->_weeTitleLabel;
  if (weeTitleLabel)
  {
    -[UIView removeFromSuperview](weeTitleLabel, "removeFromSuperview");
    v9 = self->_weeTitleLabel;
    self->_weeTitleLabel = 0;

  }
  if (self->_contentFocusContainerGuide)
  {
    -[UIView removeLayoutGuide:](self->super._navigationBar, "removeLayoutGuide:");
    contentFocusContainerGuide = self->_contentFocusContainerGuide;
    self->_contentFocusContainerGuide = 0;

  }
  -[_UINavigationBarTransitionContext setNavigationBar:](self->_transitionContext, "setNavigationBar:", 0);
  transitionContext = self->_transitionContext;
  self->_transitionContext = 0;

  v12.receiver = self;
  v12.super_class = (Class)_UINavigationBarVisualProviderModernIOS;
  -[_UINavigationBarVisualProvider teardown](&v12, sel_teardown);
}

- (void)traitCollectionDidChangeOnSubtree:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  id v21;

  v21 = a3;
  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeLayout");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = *(void **)(v5 + 144);
  else
    v7 = 0;
  v8 = v7;

  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeLayout");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = *(void **)(v10 + 240);
  else
    v12 = 0;
  v13 = v12;

  if (v8 | v13)
  {
    objc_msgSend(v21, "preferredContentSizeCategory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self->super._navigationBar, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferredContentSizeCategory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v14;
    v18 = v16;
    v19 = v18;
    if (v17 == v18)
    {

    }
    else
    {
      if (v17 && v18)
      {
        v20 = objc_msgSend(v17, "isEqual:", v18);

        if ((v20 & 1) != 0)
          goto LABEL_14;
      }
      else
      {

      }
      -[_UINavigationBarVisualProviderModernIOS changeLayout](self, "changeLayout");
    }
LABEL_14:

  }
}

- (void)navigationItemUpdatedBackButtonContent:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  if (!-[_UINavigationBarItemStack state](self->super._stack, "state"))
  {
    -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 == v8)
    {
      -[_UINavigationBarVisualProviderModernIOS _updateContentForTopItem:backItem:animated:](self, "_updateContentForTopItem:backItem:animated:", v6);
    }
    else
    {

      if (v7 != v8)
      {
LABEL_8:

        goto LABEL_9;
      }
      -[UINavigationBar _effectiveDelegate](self->super._navigationBar, "_effectiveDelegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "_navigationBar:itemBackButtonUpdated:", self->super._navigationBar, v5);
    }

    goto LABEL_8;
  }
LABEL_9:

}

- (void)navigationItemUpdatedLargeTitleContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  if (!-[_UINavigationBarItemStack state](self->super._stack, "state"))
  {
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 == v11)
    {
      -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarVisualProviderModernIOS _updateContentForTopItem:backItem:animated:](self, "_updateContentForTopItem:backItem:animated:", v11, v5, 0);

      if (objc_msgSend(v11, "_largeTitleTwoLineMode") == 2)
      {
        objc_msgSend(v11, "_stackEntry");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "activeLayout");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v7;
        if (v7)
          v9 = *(void **)(v7 + 144);
        else
          v9 = 0;
        v10 = v9;

        if (v10)
          -[_UINavigationBarVisualProviderModernIOS changeLayout](self, "changeLayout");
      }
    }

  }
}

- (void)navigationItemUpdatedTitleContent:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  if (!-[_UINavigationBarItemStack state](self->super._stack, "state"))
  {
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v9)
    {
      -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarVisualProviderModernIOS _updateContentForTopItem:backItem:animated:](self, "_updateContentForTopItem:backItem:animated:", v9, v7, v4);

      -[UINavigationBar _effectiveDelegate](self->super._navigationBar, "_effectiveDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v8, "_navigationBar:itemBackButtonUpdated:", self->super._navigationBar, v9);

    }
  }

}

- (void)setTitleAlpha:(double)a3
{
  if (self->_titleAlpha != a3)
    self->_titleAlpha = a3;
  if (!-[_UINavigationBarVisualProviderModernIOS wantsLargeTitleDisplayed](self, "wantsLargeTitleDisplayed"))
    -[_UINavigationBarContentView setInlineTitleViewAlpha:](self->_contentView, "setInlineTitleViewAlpha:", self->_titleAlpha);
}

- (void)navigationItemUpdatedContentLayout:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[_UINavigationBarItemStack state](self->super._stack, "state"))
  {
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 == v8)
    {
      -[UINavigationBar _effectiveDelegate](self->super._navigationBar, "_effectiveDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "_navigationBar:topItemUpdatedContentLayout:", self->super._navigationBar, v8);
      -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarVisualProviderModernIOS _updateContentForTopItem:backItem:animated:](self, "_updateContentForTopItem:backItem:animated:", v8, v7, 0);

    }
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  if (a3.width == 0.0)
  {
    -[UIView superview](self->super._navigationBar, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "bounds");
      width = v7;
    }

  }
  -[_UINavigationBarVisualProviderModernIOS layoutHeightsFittingWidth:](self, "layoutHeightsFittingWidth:", width);
  v9 = v8;
  v10 = width;
  result.height = v9;
  result.width = v10;
  return result;
}

- (double)titleAlpha
{
  return self->_titleAlpha;
}

- (void)updateSearchBarForPlacementChangeIfApplicable
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (_UIBarsDesktopNavigationBarEnabled())
  {
    -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "item");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_searchControllerIfAllowed");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "_setHostedInlineByNavigationBar:", objc_msgSend(v6, "_hasInlineSearchBar"));
  }
}

- (void)_shim_setShadowAlpha:(double)a3
{
  self->_shadowAlpha = a3;
  -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");
}

- (void)_shim_setCustomBackgroundView:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  if (self->_usesBarBackground)
  {
    v6 = v4;
    -[_UIBarBackground customBackgroundView](self->_backgroundView, "customBackgroundView");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v6;
    if (v5 != v6)
    {
      -[_UIBarBackground setCustomBackgroundView:](self->_backgroundView, "setCustomBackgroundView:", v6);
      v4 = v6;
    }
  }

}

- (void)setStaticNavBarButtonItem:(id)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  id v7;

  v7 = a3;
  -[UINavigationBar _effectiveDelegate](self->super._navigationBar, "_effectiveDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "_splitViewControllerEnforcingClass:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "primaryEdge") == 1;

  }
  else
  {
    v6 = 0;
  }
  -[_UINavigationBarVisualProviderModernIOS setStaticNavBarButtonItem:trailingPosition:](self, "setStaticNavBarButtonItem:trailingPosition:", v7, v6);

}

- (void)setBackgroundAlpha:(double)a3
{
  if (self->_backgroundAlpha != a3)
  {
    self->_backgroundAlpha = a3;
    -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");
  }
}

- (double)heightForRestoringFromCancelledTransition
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarLayout layoutHeights]((uint64_t)v3);
  v5 = v4;

  return v5;
}

- (void)provideViewsForContents:(id)a3 topItem:(id)a4 backItem:(id)a5
{
  id v7;
  _UINavigationBarContentView *contentView;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  contentView = self->_contentView;
  v9 = a4;
  -[_UINavigationBarContentView updateAccessibilityContents:](contentView, "updateAccessibilityContents:", v7);
  objc_msgSend(v9, "_stackEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "activeLayout");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = *(void **)(v11 + 144);
  else
    v13 = 0;
  v14 = v13;
  objc_msgSend(v14, "accessibilityTitleView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLargeTitleView:", v15);

  objc_msgSend(v7, "setPromptView:", 0);
  if (self->_backgroundView)
  {
    v17[0] = self->_backgroundView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setViewsRepresentingContentBackground:", v16);

  }
}

- (void)updateArchivedSubviews:(id)a3
{
  objc_msgSend(a3, "removeAllObjects");
}

- (BOOL)useInlineBackgroundHeightWhenLarge
{
  return self->_useInlineBackgroundHeightWhenLarge;
}

- (void)setUseInlineBackgroundHeightWhenLarge:(BOOL)a3
{
  if (self->_useInlineBackgroundHeightWhenLarge != a3)
  {
    self->_useInlineBackgroundHeightWhenLarge = a3;
    -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");
  }
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (BOOL)allowsUserInteractionDuringTransitions
{
  return -[UINavigationBar _canPreemptTransition](self->super._navigationBar, "_canPreemptTransition");
}

- (BOOL)_useLargeTitleForDisplayMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  switch(a3)
  {
    case 3:
      return !-[_UITabContainerView canShowFloatingTabBar](self->_tabBarHostedView, "canShowFloatingTabBar", v3, v4);
    case 2:
      return 0;
    case 0:
      return !-[_UITabContainerView canShowFloatingTabBar](self->_tabBarHostedView, "canShowFloatingTabBar", v3, v4);
  }
  return 1;
}

- (void)_popToItem:(id)a3
{
  void *v4;
  void *v5;
  _UINavigationBarItemStack *stack;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v8 = a3;
  -[UINavigationBar delegate](self->super._navigationBar, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "_navigationBar:requestPopToItem:", self->super._navigationBar, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    stack = self->super._stack;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54___UINavigationBarVisualProviderModernIOS__popToItem___block_invoke;
    v9[3] = &unk_1E16B5CC8;
    v10 = v5;
    v11 = v8;
    v7 = v5;
    -[_UINavigationBarItemStack iterateItems:](stack, "iterateItems:", v9);
    -[UINavigationBar setItems:animated:](self->super._navigationBar, "setItems:animated:", v7, 1);

  }
}

- (id)_staticNavBarButtonFakeBackMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id location;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!_UINavigationBarBackButtonShowsContextMenu())
    return 0;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74___UINavigationBarVisualProviderModernIOS__staticNavBarButtonFakeBackMenu__block_invoke;
  v8[3] = &unk_1E16B6600;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  +[UIDeferredMenuElement elementWithProvider:](UIDeferredMenuElement, "elementWithProvider:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setMaximumNumberOfTitleLines:", 1);
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDisplayPreferences:", v4);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

- (void)_refreshBackButtonMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[_UINavigationBarContentView layout](self->_contentView, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backButton");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v10;
  if (v10)
  {
    -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_effectiveBackBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UINavigationBarVisualProviderModernIOS _backButtonMenu](self, "_backButtonMenu");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMenu:", v7);

    objc_msgSend(v10, "visualProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v8, "canUpdateMenuInPlace");

    if ((_DWORD)v5)
    {
      objc_msgSend(v10, "visualProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateMenu");

    }
    v4 = v10;
  }

}

- (BOOL)isInCustomization
{
  return -[_UIBarCustomizer isActive](self->_customizer, "isActive");
}

- (void)_beginCustomization
{
  _UIBarCustomizer *v4;
  _UIBarCustomizer *customizer;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  uint64_t v10;
  id v11;
  id v12;
  _UIBarCustomizationSession *v13;
  _UIBarCustomizationSession *currentCustomizationSession;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  _UINavigationBarVisualProviderModernIOS *v30;
  _QWORD v31[5];
  id v32;
  id v33;

  if (!self->_customizer)
  {
    v4 = -[_UIBarCustomizer initWithDelegate:]([_UIBarCustomizer alloc], "initWithDelegate:", self);
    customizer = self->_customizer;
    self->_customizer = v4;

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarContentView layout](self->_contentView, "layout");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "centerBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "groupRealizedOrder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "groupOrderer");
  v9 = (id *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarVisualProviderModernIOS.m"), 930, CFSTR("Began customizing but the customizer is nil!"));

  }
  v10 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __62___UINavigationBarVisualProviderModernIOS__beginCustomization__block_invoke;
  v31[3] = &unk_1E16B6628;
  v31[4] = self;
  v11 = v6;
  v32 = v11;
  v12 = v7;
  v33 = v12;
  -[_UIButtonBarGroupOrderer enumerateSourceGroups:](v9, v31);
  +[_UIBarCustomizationSession sessionWithVisibleItems:additionalItems:](_UIBarCustomizationSession, "sessionWithVisibleItems:additionalItems:", v11, v12);
  v13 = (_UIBarCustomizationSession *)objc_claimAutoreleasedReturnValue();
  currentCustomizationSession = self->_currentCustomizationSession;
  self->_currentCustomizationSession = v13;

  -[_UIBarCustomizationSession beginAnimationCoordinator](self->_currentCustomizationSession, "beginAnimationCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v10;
  v28[1] = 3221225472;
  v28[2] = __62___UINavigationBarVisualProviderModernIOS__beginCustomization__block_invoke_2;
  v28[3] = &unk_1E16B1B50;
  v16 = v8;
  v29 = v16;
  v30 = self;
  objc_msgSend(v15, "addAnimations:", v28);

  -[_UIBarCustomizationSession endAnimationCoordinator](self->_currentCustomizationSession, "endAnimationCoordinator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = __62___UINavigationBarVisualProviderModernIOS__beginCustomization__block_invoke_3;
  v27[3] = &unk_1E16B1B28;
  v27[4] = self;
  objc_msgSend(v17, "addAnimations:", v27);

  objc_initWeak(&location, self);
  -[_UIBarCustomizationSession endAnimationCoordinator](self->_currentCustomizationSession, "endAnimationCoordinator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __62___UINavigationBarVisualProviderModernIOS__beginCustomization__block_invoke_4;
  v23[3] = &unk_1E16B6650;
  objc_copyWeak(&v25, &location);
  v19 = v16;
  v24 = v19;
  objc_msgSend(v18, "addCompletion:", v23);

  -[_UIBarCustomizer beginWithSession:](self->_customizer, "beginWithSession:", self->_currentCustomizationSession);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

- (id)_barCustomizationItemWithBarButtonGroup:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _UINavigationBarVisualProviderModernIOS *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  -[UIBarButtonItemGroup _customizationIdentifier](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItemGroup _items](v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 < 2)
  {
    -[UIBarButtonItemGroup _items](v4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernIOS _barCustomizationItemWithBarButtonItem:identifier:](self, "_barCustomizationItemWithBarButtonItem:identifier:", v27, v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = self;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v30 = v4;
    -[UIBarButtonItemGroup _items](v4);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v33;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v14);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%i"), v5, v12 + v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UINavigationBarVisualProviderModernIOS _barCustomizationItemWithBarButtonItem:identifier:](v8, "_barCustomizationItemWithBarButtonItem:identifier:", v15, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v17);

          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        v12 = (v12 + v14);
      }
      while (v11);
    }

    v4 = v30;
    objc_msgSend(v30, "representativeItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "image");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "representativeItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "title");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v9;
    +[_UIBarCustomizationItem groupWithWithIdentifier:icon:name:items:](_UIBarCustomizationItem, "groupWithWithIdentifier:icon:name:items:", v5, v19, v21, v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setCollapsed:", objc_msgSend(v30, "isDisplayingRepresentativeItem"));
    objc_msgSend(v30, "representativeItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernIOS _sourceViewProviderForBarButtonItem:](v8, "_sourceViewProviderForBarButtonItem:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSourceViewProvider:", v25);

  }
  if (v4)
    v28 = (*((unsigned __int8 *)v4 + 24) >> 5) & 1;
  else
    v28 = 0;
  objc_msgSend(v23, "setRemovable:", v28);

  return v23;
}

- (id)_barCustomizationItemWithBarButtonItem:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "customView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIBarCustomizationItem itemWithIdentifier:icon:name:view:](_UIBarCustomizationItem, "itemWithIdentifier:icon:name:view:", v6, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTintColor:", v12);

  objc_msgSend(v11, "setEnabled:", objc_msgSend(v7, "isEnabled"));
  -[_UINavigationBarVisualProviderModernIOS _sourceViewProviderForBarButtonItem:](self, "_sourceViewProviderForBarButtonItem:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setSourceViewProvider:", v13);
  return v11;
}

- (id)_sourceViewProviderForBarButtonItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79___UINavigationBarVisualProviderModernIOS__sourceViewProviderForBarButtonItem___block_invoke;
  aBlock[3] = &unk_1E16B6678;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

- (id)barCustomizer:(id)a3 containerViewForSession:(id)a4
{
  UIView *customizationContainerView;
  UIView *v6;
  void *v7;
  UIView *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  UIView *v14;
  void *v15;

  customizationContainerView = self->_customizationContainerView;
  if (!customizationContainerView)
  {
    v6 = [UIView alloc];
    -[UIView window](self->super._navigationBar, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v8 = -[UIView initWithFrame:](v6, "initWithFrame:");

    -[UIView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
    -[UIView tintColor](self->_contentView, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](v8, "setTintColor:", v9);

    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_BarCustomizationDebugEnabled, (uint64_t)CFSTR("BarCustomizationDebugEnabled")) & 1) == 0&& byte_1EDDA7DE4)
    {
      +[UIColor redColor](UIColor, "redColor");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = objc_msgSend(v10, "CGColor");
      -[UIView layer](v8, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBorderColor:", v11);

      -[UIView layer](v8, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBorderWidth:", 1.0);

    }
    v14 = self->_customizationContainerView;
    self->_customizationContainerView = v8;

    -[UIView window](self->super._navigationBar, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", self->_customizationContainerView);

    -[_UINavigationBarVisualProviderModernIOS _setupAccessibilityLimitsForView:](self, "_setupAccessibilityLimitsForView:", self->_customizationContainerView);
    customizationContainerView = self->_customizationContainerView;
  }
  return customizationContainerView;
}

- (id)barCustomizer:(id)a3 parentTraitEnvironmentForSession:(id)a4
{
  return self->_contentView;
}

- (CGRect)barCustomizer:(id)a3 customizationAreaBoundsForSession:(id)a4
{
  _UINavigationBarContentView *contentView;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double Width;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  CGRect result;

  contentView = self->_contentView;
  -[UIView bounds](contentView, "bounds", a3, a4);
  -[UIView convertRect:toView:](contentView, "convertRect:toView:", self->super._navigationBar);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UIView bounds](self->super._navigationBar, "bounds");
  Width = CGRectGetWidth(v19);
  v20.origin.x = v7;
  v20.origin.y = v9;
  v20.size.width = v11;
  v20.size.height = v13;
  -[UIView convertRect:toView:](self->super._navigationBar, "convertRect:toView:", self->_customizationContainerView, 0.0, -24.0, Width, CGRectGetHeight(v20) + 48.0);
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)barCustomizer:(id)a3 overflowControlBoundsForSession:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[_UINavigationBarContentView layout](self->_contentView, "layout", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overflowButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _contentViewFromBarButton(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bounds");
  objc_msgSend(v7, "convertRect:toView:", self->_customizationContainerView);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)barCustomizer:(id)a3 willEndSession:(id)a4 didReset:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t n;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id obj;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[5];
  _QWORD v84[5];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  void *v101;
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v5 = a5;
  v104 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[_UINavigationBarContentView layout](self->_contentView, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = v9;
  if (v5)
  {
    objc_msgSend(v9, "groupOrderer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarGroupOrderer reset]((uint64_t)v10);

    objc_msgSend(v9, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutIfNeeded");

    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    objc_msgSend(v9, "barButtonGroups");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
    if (v67)
    {
      v66 = *(_QWORD *)v94;
      v12 = MEMORY[0x1E0C809B0];
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v94 != v66)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * v13);
          v68 = v13;
          if (v14 && (*(_BYTE *)(v14 + 24) & 0x20) != 0)
          {
            v91 = 0u;
            v92 = 0u;
            v89 = 0u;
            v90 = 0u;
            objc_msgSend(v7, "visibleItems");
            v69 = (id)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v90;
              while (2)
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v90 != v18)
                    objc_enumerationMutation(v69);
                  v20 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
                  -[UIBarButtonItemGroup _customizationIdentifier]((id *)v14);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "identifier");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = objc_msgSend(v21, "isEqual:", v22);

                  if (v23)
                  {
                    objc_msgSend(v20, "setCollapsed:", objc_msgSend((id)v14, "isDisplayingRepresentativeItem"));
                    v15 = 1;
                    goto LABEL_20;
                  }
                }
                v17 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
                if (v17)
                  continue;
                break;
              }
            }
            v15 = 0;
LABEL_20:

          }
          else
          {
            v15 = 1;
          }
          if ((objc_msgSend((id)v14, "isDisplayingRepresentativeItem", v64) & 1) != 0)
          {
            objc_msgSend((id)v14, "representativeItem");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = v24;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            -[UIBarButtonItemGroup _items]((id *)v14);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v87 = 0u;
          v88 = 0u;
          v85 = 0u;
          v86 = 0u;
          v26 = v25;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v85, v100, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v86;
            do
            {
              for (j = 0; j != v28; ++j)
              {
                if (*(_QWORD *)v86 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
                objc_msgSend(v31, "view");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "setAlpha:", 0.0);

                objc_msgSend(v7, "endAnimationCoordinator");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = v33;
                if (v15)
                {
                  v84[0] = v12;
                  v84[1] = 3221225472;
                  v84[2] = __81___UINavigationBarVisualProviderModernIOS_barCustomizer_willEndSession_didReset___block_invoke;
                  v84[3] = &unk_1E16B66A0;
                  v84[4] = v31;
                  objc_msgSend(v33, "addCompletion:", v84);
                }
                else
                {
                  v83[0] = v12;
                  v83[1] = 3221225472;
                  v83[2] = __81___UINavigationBarVisualProviderModernIOS_barCustomizer_willEndSession_didReset___block_invoke_2;
                  v83[3] = &unk_1E16B1B28;
                  v83[4] = v31;
                  objc_msgSend(v33, "addAnimations:", v83);
                }

              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v85, v100, 16);
            }
            while (v28);
          }

          v13 = v68 + 1;
        }
        while (v68 + 1 != v67);
        v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
      }
      while (v67);
    }

    v35 = v64;
    objc_msgSend(v64, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setHidden:", 0);
  }
  else
  {
    v37 = (void *)objc_opt_new();
    v38 = (void *)objc_opt_new();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    objc_msgSend(v7, "visibleItems");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v79, v99, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v80;
      do
      {
        for (k = 0; k != v41; ++k)
        {
          if (*(_QWORD *)v80 != v42)
            objc_enumerationMutation(v39);
          v44 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * k);
          objc_msgSend(v44, "identifier", v64);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v45)
          {
            objc_msgSend(v44, "identifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addObject:", v46);

          }
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v79, v99, 16);
      }
      while (v41);
    }

    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    objc_msgSend(v7, "additionalItems");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v75, v98, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v76;
      do
      {
        for (m = 0; m != v49; ++m)
        {
          if (*(_QWORD *)v76 != v50)
            objc_enumerationMutation(v47);
          objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * m), "identifier", v64);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v52);

        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v75, v98, 16);
      }
      while (v49);
    }

    objc_msgSend(v64, "groupOrderer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v37;
    -[_UIButtonBarGroupOrderer setIncludedIdentifiers:excludedIdentifiers:]((uint64_t)v53, v37, v38);

    objc_msgSend(v64, "view");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "layoutIfNeeded");

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    objc_msgSend(v7, "visibleItems");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v71, v97, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v72;
      do
      {
        for (n = 0; n != v57; ++n)
        {
          if (*(_QWORD *)v72 != v58)
            objc_enumerationMutation(v55);
          v60 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * n);
          objc_msgSend(v60, "identifier", v64);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UINavigationBarVisualProviderModernIOS _centerBarButtonGroupWithIdentifier:](self, "_centerBarButtonGroupWithIdentifier:", v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v60, "setCollapsed:", objc_msgSend(v62, "isDisplayingRepresentativeItem"));
        }
        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v71, v97, 16);
      }
      while (v57);
    }

    v35 = v64;
    objc_msgSend(v64, "groupOrderer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarGroupOrderer save]((uint64_t)v63);

    v36 = v70;
  }

}

- (id)_centerBarButtonGroupWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  uint64_t v9;
  id *i;
  id *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[_UINavigationBarContentView layout](self->_contentView, "layout", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "barButtonGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (id *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (id *)((char *)i + 1))
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(id **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          -[UIBarButtonItemGroup _customizationIdentifier](v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", v4);

          if ((v13 & 1) != 0)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
        v8 = (id *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_beginRenaming
{
  void *v4;
  void *v5;
  _UINavigationBarTitleRenamerSession **p_titleRenamerSession;
  void *v7;
  void *v8;
  _UINavigationBarTitleRenamer *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _UINavigationBarTitleRenamerRemoteSession *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _UINavigationBarTitleRenamerRemoteSession *v19;
  id v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _UINavigationBarTitleRenamerSession *v33;
  uint64_t v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  _UINavigationBarTitleRenamerRemoteSession *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;

  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  p_titleRenamerSession = &self->_titleRenamerSession;
  -[_UINavigationBarTitleRenamerSession context](self->_titleRenamerSession, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v5)
  {
    if (*p_titleRenamerSession)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarTitleRenamerSession context](*p_titleRenamerSession, "context");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarVisualProviderModernIOS.m"), 1196, CFSTR("Attempting to begin renaming a navigation item (%@) while already renaming a different navigation item (%@) on navigation bar (%@)."), v5, v37, self->super._navigationBar);

    }
    objc_msgSend(v5, "_dci_renameHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_27;
    v9 = self->_titleRenamer;
    if (!v9)
    {
      v9 = (_UINavigationBarTitleRenamer *)objc_opt_new();
      -[_UINavigationBarTitleRenamer setDelegate:](v9, "setDelegate:", self);
      objc_storeStrong((id *)&self->_titleRenamer, v9);
    }
    -[_UINavigationBarContentView documentProperties](self->_contentView, "documentProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "wantsIconRepresentation"))
    {
      objc_msgSend(v10, "metadata");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v8, "_fileURLForRenaming");
    v12 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v12;
    v43 = (void *)v11;
    if (v12)
    {
      v13 = v12;
      v40 = v10;
      v14 = [_UINavigationBarTitleRenamerRemoteSession alloc];
      v44 = 0;
      -[UIView _window](self->_contentView, "_window");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "windowScene");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v13;
      v18 = (void *)v16;
      v19 = -[_UINavigationBarTitleRenamerRemoteSession initWithFileURL:iconMetadata:error:scene:](v14, "initWithFileURL:iconMetadata:error:scene:", v17, v11, &v44, v16);
      v20 = v44;

      if (!v19)
      {
        _UINSLocalizedStringWithDefaultValue(CFSTR("Rename failed"), CFSTR("Rename failed"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v26, v27, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        _UINSLocalizedStringWithDefaultValue(CFSTR("OK"), CFSTR("OK"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v29, 0, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addAction:", v30);

        -[UIView _viewControllerForAncestor](self->super._navigationBar, "_viewControllerForAncestor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "presentViewController:animated:completion:", v28, 1, 0);

        v19 = 0;
        v10 = v40;
        v32 = v42;
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      v10 = v40;
    }
    else
    {
      if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_ForceOOPRename, (uint64_t)CFSTR("ForceOOPRename")) & 1) != 0
        || !byte_1EDDA7DEC)
      {
        v33 = [_UINavigationBarTitleRenamerSession alloc];
        objc_msgSend(v5, "title");
        v34 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v34;
        if (v34)
          v35 = (const __CFString *)v34;
        else
          v35 = &stru_1E16EDF20;
        v19 = -[_UINavigationBarTitleRenamerSession initWithSuggestedTitle:iconMetadata:](v33, "initWithSuggestedTitle:iconMetadata:", v35, v11);
      }
      else
      {
        v39 = [_UINavigationBarTitleRenamerRemoteSession alloc];
        objc_msgSend(v5, "title");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        v23 = &stru_1E16EDF20;
        if (v21)
          v23 = (const __CFString *)v21;
        v38 = v23;
        -[UIView _window](self->_contentView, "_window");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "windowScene");
        v41 = v10;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[_UINavigationBarTitleRenamerRemoteSession initWithSuggestedTitle:iconMetadata:scene:](v39, "initWithSuggestedTitle:iconMetadata:scene:", v38, v11, v25);

        v10 = v41;
      }

      v20 = 0;
    }
    v32 = v42;
    -[_UINavigationBarTitleRenamerSession setContext:](v19, "setContext:", v5);
    -[_UINavigationBarTitleRenamer startSession:](v9, "startSession:", v19);
    objc_storeStrong((id *)&self->_titleRenamerSession, v19);
    -[_UINavigationBarContentView layout](self->_contentView, "layout");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setActiveRenamerSession:", v19);
    goto LABEL_26;
  }
  NSLog(CFSTR("Request to begin renaming a navigation item (%@) that's already being renamed. This request is ignored."), v5);
LABEL_28:

}

- (void)_endRenaming
{
  _UINavigationBarTitleRenamerSession *titleRenamerSession;
  void *v5;
  id v6;

  if (!self->_titleRenamerSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarVisualProviderModernIOS.m"), 1277, CFSTR("Unable to end a renaming session. No session in progress."));

  }
  -[_UINavigationBarTitleRenamer endSession:](self->_titleRenamer, "endSession:");
  titleRenamerSession = self->_titleRenamerSession;
  self->_titleRenamerSession = 0;

  -[_UINavigationBarContentView layout](self->_contentView, "layout");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveRenamerSession:", 0);

}

- (id)titleRenamer:(id)a3 session:(id)a4 willBeginRenamingWithTitle:(id)a5 selectedRange:(_NSRange *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;

  v9 = a5;
  v10 = a4;
  __ASSERT_RENAMER_SESSION__(self, v10);
  __renameHandler(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "_willBeginRenamingWithTitle:selectedRange:", v9, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)titleRenamer:(id)a3 session:(id)a4 shouldEndRenamingWithTitle:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;

  v7 = a5;
  v8 = a4;
  __ASSERT_RENAMER_SESSION__(self, v8);
  __renameHandler(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v9, "_shouldEndRenamingWithTitle:", v7);
  else
    v10 = 1;

  return v10;
}

- (void)titleRenamer:(id)a3 session:(id)a4 didEndRenamingWithTitle:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  __ASSERT_RENAMER_SESSION__(self, v11);
  __renameHandler(v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v9);

    objc_msgSend(v11, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_didEndRenamingWithTitle:", v10);

    -[_UINavigationBarVisualProviderModernIOS _endRenaming](self, "_endRenaming");
  }
  else
  {
    -[_UINavigationBarVisualProviderModernIOS _endRenaming](self, "_endRenaming");
  }

}

- (void)titleRenamer:(id)a3 didCancelSession:(id)a4
{
  id v5;
  void *v6;
  _UINavigationBarTitleRenamerSession *titleRenamerSession;
  void *v8;
  id v9;

  v5 = a4;
  __renameHandler(v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_didEndRenamingWithTitle:", v6);
  titleRenamerSession = self->_titleRenamerSession;
  self->_titleRenamerSession = 0;

  -[_UINavigationBarContentView layout](self->_contentView, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActiveRenamerSession:", 0);

}

- (void)titleRenamer:(id)a3 session:(id)a4 fileRenameDidEnd:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a5;
  v8 = a4;
  __ASSERT_RENAMER_SESSION__(self, v8);
  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "item");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByDeletingPathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v11);

  __renameHandler(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_fileRenameDidEndWithFinalURL:", v7);
  -[_UINavigationBarVisualProviderModernIOS _endRenaming](self, "_endRenaming");

}

- (void)titleRenamer:(id)a3 session:(id)a4 fileRenameDidFail:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  __ASSERT_RENAMER_SESSION__(self, v8);
  __renameHandler(v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_fileRenameDidFailWithError:", v7);
  -[_UINavigationBarVisualProviderModernIOS _endRenaming](self, "_endRenaming");

}

- (void)deferSearchSuggestionsMenuRefreshForGeometryChange
{
  uint64_t v3;
  void *v4;
  id v5;

  if (_UIBarsDesktopNavigationBarEnabled())
  {
    -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeLayout");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      objc_msgSend(*(id *)(v3 + 160), "deferSearchSuggestionsMenuRefreshForGeometryChange");

  }
}

- (void)searchScopeBarWillManuallyShowOrHideForNavigationItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "item");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v8;
    if (v6 == v8)
    {
      -[UINavigationBar delegate](self->super._navigationBar, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "_navigationBarWillChangeHeightForManualShowOrHideOfSearchScopeBar:", self->super._navigationBar);

      v4 = v8;
    }
  }

}

- (void)refreshSearchSuggestionsMenuAfterGeometryChange
{
  uint64_t v3;
  void *v4;
  id v5;

  if (_UIBarsDesktopNavigationBarEnabled())
  {
    -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeLayout");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      objc_msgSend(*(id *)(v3 + 160), "refreshSearchSuggestionsMenuAfterGeometryChange");

  }
}

- (id)emptyLayout
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  _UINavigationBarLayout *v6;
  uint64_t v7;
  void *v8;

  objc_getAssociatedObject(self, &emptyLayout___emptyLayoutKey);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    v5 = -[UINavigationBar _effectiveDelegateSupportsScrollEdgeTransitionProgress](self->super._navigationBar, "_effectiveDelegateSupportsScrollEdgeTransitionProgress");
LABEL_6:
    *(_BYTE *)(v4 + 113) = v5;
    return (id)v4;
  }
  v6 = objc_alloc_init(_UINavigationBarLayout);
  v4 = (uint64_t)v6;
  if (v6)
  {
    v6->_apiVersion = self->_appearanceAPIVersion;
    v6->_representedSearchLayoutState = 2;
    -[_UINavigationBarVisualProviderModernIOS _contentBackgroundExtension](self, "_contentBackgroundExtension");
    *(_QWORD *)(v4 + 200) = v7;
  }
  else
  {
    -[_UINavigationBarVisualProviderModernIOS _contentBackgroundExtension](self, "_contentBackgroundExtension");
  }
  -[_UINavigationBarLayout setBackgroundView:](v4, self->_backgroundView);
  -[_UINavigationBarVisualProvider contentViewVisualProvider](self, "contentViewVisualProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarLayout setContentViewVisualProvider:](v4, v8);

  -[_UINavigationBarLayout setContentView:](v4, self->_contentView);
  objc_setAssociatedObject(self, &emptyLayout___emptyLayoutKey, (id)v4, (void *)1);
  v5 = -[UINavigationBar _effectiveDelegateSupportsScrollEdgeTransitionProgress](self->super._navigationBar, "_effectiveDelegateSupportsScrollEdgeTransitionProgress");
  if (v4)
    goto LABEL_6;
  return (id)v4;
}

- (void)updateBarVisibilityForTopItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  _QWORD *v7;
  CAFilter *v8;
  CAFilter *hiddenFilter;
  void *v10;
  CAFilter *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_navigationBarVisibility");
  v6 = v5 != 0;

  if (self->_isHidden != v6)
  {
    v7 = (_QWORD *)MEMORY[0x1E0CD2D00];
    if (!self->_hiddenFilter)
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
      v8 = (CAFilter *)objc_claimAutoreleasedReturnValue();
      hiddenFilter = self->_hiddenFilter;
      self->_hiddenFilter = v8;

      -[CAFilter setName:](self->_hiddenFilter, "setName:", CFSTR("barVisibility"));
      if (self->_isHidden)
        +[UIColor clearColor](UIColor, "clearColor");
      else
        +[UIColor whiteColor](UIColor, "whiteColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = self->_hiddenFilter;
      v12 = objc_retainAutorelease(v10);
      -[CAFilter setValue:forKey:](v11, "setValue:forKey:", objc_msgSend(v12, "CGColor"), *v7);
      v24[0] = self->_hiddenFilter;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layer](self->super._navigationBar, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFilters:", v13);

    }
    if (v5)
      +[UIColor clearColor](UIColor, "clearColor");
    else
      +[UIColor whiteColor](UIColor, "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self->super._navigationBar, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_retainAutorelease(v15);
    v18 = objc_msgSend(v17, "CGColor");
    v19 = (void *)MEMORY[0x1E0CB3940];
    -[CAFilter name](self->_hiddenFilter, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("filters.%@.%@"), v20, *v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setValue:forKeyPath:", v18, v21);

    self->_isHidden = v6;
    -[_UINavigationBarVisualProvider navigationBar](self, "navigationBar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v23, "_navigationBarDidUpdateVisibility:", self->super._navigationBar);

  }
}

- (double)horizontalMarginAdjustment
{
  return 0.0;
}

- (void)_setupTransitionContextForTransition:(int64_t)a3 completion:(id)a4
{
  UINavigationBar *navigationBar;
  id v8;
  void *v9;
  _UINavigationBarTransitionContext *v10;
  _UINavigationBarTransitionContext *transitionContext;
  int64_t v12;
  _BOOL8 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  _BOOL8 v42;
  void *v43;
  _BOOL8 v44;
  void *v45;
  id v46;
  __int128 v47;

  navigationBar = self->super._navigationBar;
  v8 = a4;
  -[UIView traitCollection](navigationBar, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UINavigationBarTransitionContext contextForTransition:withIdiom:completion:](_UINavigationBarTransitionContext, "contextForTransition:withIdiom:completion:", a3, objc_msgSend(v9, "userInterfaceIdiom"), v8);
  v10 = (_UINavigationBarTransitionContext *)objc_claimAutoreleasedReturnValue();

  transitionContext = self->_transitionContext;
  self->_transitionContext = v10;

  -[_UINavigationBarTransitionContext setNavigationBar:](self->_transitionContext, "setNavigationBar:", self->super._navigationBar);
  -[_UINavigationBarTransitionContext setApiVersion:](self->_transitionContext, "setApiVersion:", self->_appearanceAPIVersion);
  v12 = -[UINavigationBar _activeBarMetrics](self->super._navigationBar, "_activeBarMetrics");
  v14 = v12 == 1 || v12 == 102;
  -[_UINavigationBarTransitionContext setCompact:](self->_transitionContext, "setCompact:", v14);
  -[_UINavigationBarTransitionContext setBackgroundAlpha:](self->_transitionContext, "setBackgroundAlpha:", self->_backgroundAlpha);
  -[_UINavigationBarVisualProviderModernIOS applyBarBackground:alpha:](self, "applyBarBackground:alpha:", self->_backgroundView, self->_backgroundAlpha);
  -[_UINavigationBarTransitionContext setStack:](self->_transitionContext, "setStack:", self->super._stack);
  -[_UINavigationBarTransitionContext setAllowLargeTitles:](self->_transitionContext, "setAllowLargeTitles:", -[_UINavigationBarVisualProviderModernIOS allowLargeTitleView](self, "allowLargeTitleView"));
  -[_UINavigationBarTransitionContext setRTL:](self->_transitionContext, "setRTL:", -[UIView effectiveUserInterfaceLayoutDirection](self->super._navigationBar, "effectiveUserInterfaceLayoutDirection") == UIUserInterfaceLayoutDirectionRightToLeft);
  -[_UINavigationBarTransitionContext setPromptView:](self->_transitionContext, "setPromptView:", self->_promptView);
  -[_UINavigationBarTransitionContext setContentView:](self->_transitionContext, "setContentView:", self->_contentView);
  -[_UITabContainerView floatingTabBar](self->_tabBarHostedView, "floatingTabBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarTransitionContext setTabBarHostedView:](self->_transitionContext, "setTabBarHostedView:", v15);

  -[_UINavigationBarTransitionContext setBackgroundView:isBarBackground:](self->_transitionContext, "setBackgroundView:isBarBackground:", self->_backgroundView, self->_usesBarBackground);
  -[_UINavigationBarTransitionContext setLargeTitleView:](self->_transitionContext, "setLargeTitleView:", self->_largeTitleView);
  if ((unint64_t)(a3 - 1) < 4)
  {
    -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
    v16 = objc_claimAutoreleasedReturnValue();
    v46 = (id)v16;
    if (v16)
    {
      -[_UINavigationBarVisualProviderModernIOS _ensureLayoutsConfiguredForEntry:](self, "_ensureLayoutsConfiguredForEntry:", v16);
      objc_msgSend(v46, "activeLayout");
    }
    else
    {
      -[_UINavigationBarVisualProviderModernIOS emptyLayout](self, "emptyLayout");
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarTransitionContext setToLayout:](self->_transitionContext, "setToLayout:", v28);

    -[UINavigationBar _incomingNavigationBarFrame](self->super._navigationBar, "_incomingNavigationBarFrame");
    v30 = v29;
    v32 = v31;
    -[_UINavigationBarTransitionContext toLayout](self->_transitionContext, "toLayout");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarLayout setLayoutSize:]((uint64_t)v33, v30, v32);

    -[_UINavigationBarItemStack previousTopEntry](self->super._stack, "previousTopEntry");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      -[_UINavigationBarVisualProviderModernIOS _ensureLayoutsConfiguredForEntry:](self, "_ensureLayoutsConfiguredForEntry:", v34);
      objc_msgSend(v34, "activeLayout");
      v35 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v46)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarVisualProviderModernIOS.m"), 2532, CFSTR("Unexpected transition in the navigation bar with no stack entries"));

      }
      -[_UINavigationBarVisualProviderModernIOS emptyLayout](self, "emptyLayout");
      v35 = objc_claimAutoreleasedReturnValue();
    }
    v36 = (void *)v35;
    -[_UINavigationBarTransitionContext setFromLayout:](self->_transitionContext, "setFromLayout:", v35);

    LODWORD(v36) = objc_msgSend(v46, "isSearchActive");
    if ((_DWORD)v36 != objc_msgSend(v34, "isSearchActive"))
      -[_UINavigationBarTransitionContext setTwoPart:](self->_transitionContext, "setTwoPart:", 1);
    -[UINavigationBar delegate](self->super._navigationBar, "delegate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v37, "_navigationBarTransitionOverlay");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarTransitionContext setTransitionOverlayView:](self->_transitionContext, "setTransitionOverlayView:", v38);

    }
    goto LABEL_38;
  }
  if (a3 != 5)
  {
    if (a3 != 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v46 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarVisualProviderModernIOS.m"), 2623, CFSTR("Unknown transition = %ld"), a3);
LABEL_38:

      return;
    }
    -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
    v46 = (id)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernIOS _ensureLayoutsConfiguredForEntry:](self, "_ensureLayoutsConfiguredForEntry:", v46);
    objc_msgSend(v46, "searchLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarTransitionContext setFromLayout:](self->_transitionContext, "setFromLayout:", v17);

    objc_msgSend(v46, "normalLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");

    if (v19)
      v20 = *(void **)(v19 + 160);
    else
      v20 = 0;
    v21 = v20;

    if (v21)
    {
      v22 = v19 ? *(void **)(v19 + 160) : 0;
      v23 = v22;
      v24 = objc_msgSend(v23, "expectedInactiveInlineSearchBarLayoutState");

      if (v19)
      {
        if (v24 != -1)
          *(_QWORD *)(v19 + 248) = v24;
      }
    }
    -[_UINavigationBarTransitionContext setToLayout:](self->_transitionContext, "setToLayout:", v19);
    objc_msgSend(v46, "setSearchActive:", 0);
    if (v19)
    {
      if (*(_BYTE *)(v19 + 116) && !*(_BYTE *)(v19 + 114))
      {
        if (!-[_UINavigationBarTransitionContext allowLargeTitles](self->_transitionContext, "allowLargeTitles")
          || !-[_UINavigationBarVisualProviderModernIOS _useLargeTitleForDisplayMode:](self, "_useLargeTitleForDisplayMode:", -[_UINavigationBarItemStack effectiveDisplayModeForItemInCurrentStack:](self->super._stack, "effectiveDisplayModeForItemInCurrentStack:", 0)))
        {
          goto LABEL_55;
        }
        goto LABEL_52;
      }
      if (-[_UINavigationBarTransitionContext allowLargeTitles](self->_transitionContext, "allowLargeTitles"))
      {
        v25 = *(double *)(v19 + 320);
        goto LABEL_25;
      }
    }
    else
    {
      v25 = 0.0;
      if (-[_UINavigationBarTransitionContext allowLargeTitles](self->_transitionContext, "allowLargeTitles"))
      {
LABEL_25:
        v26 = -[_UINavigationBarLayout layoutHeights](v19);
        if (vabdd_f64(v27, v25) >= vabdd_f64(v25, v26))
          goto LABEL_55;
LABEL_52:
        v44 = -[_UINavigationBarVisualProviderModernIOS _useLargeTitleForDisplayMode:](self, "_useLargeTitleForDisplayMode:", -[_UINavigationBarItemStack effectiveDisplayModeForItemInCurrentStack:](self->super._stack, "effectiveDisplayModeForItemInCurrentStack:", 0));
LABEL_56:
        -[_UINavigationBarTransitionContext setEndWithLargeTitle:](self->_transitionContext, "setEndWithLargeTitle:", v44);
        -[_UINavigationBarTransitionContext setBeginWithLargeTitle:](self->_transitionContext, "setBeginWithLargeTitle:", 0);

        goto LABEL_38;
      }
    }
LABEL_55:
    v44 = 0;
    goto LABEL_56;
  }
  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProviderModernIOS _ensureLayoutsConfiguredForEntry:](self, "_ensureLayoutsConfiguredForEntry:", v39);
  objc_msgSend(v39, "normalLayout");
  v40 = objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarTransitionContext setFromLayout:](self->_transitionContext, "setFromLayout:", v40);
  objc_msgSend(v39, "searchLayout");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarTransitionContext setToLayout:](self->_transitionContext, "setToLayout:", v41);

  objc_msgSend(v39, "setSearchActive:", 1);
  if (!v40)
    goto LABEL_46;
  if (*(_BYTE *)(v40 + 116) && !*(_BYTE *)(v40 + 114))
  {
    if (-[_UINavigationBarTransitionContext allowLargeTitles](self->_transitionContext, "allowLargeTitles"))
      goto LABEL_43;
LABEL_46:
    v42 = 0;
    goto LABEL_47;
  }
  if (*(double *)(v40 + 280) <= 0.0)
    goto LABEL_46;
LABEL_43:
  v42 = -[_UINavigationBarVisualProviderModernIOS _useLargeTitleForDisplayMode:](self, "_useLargeTitleForDisplayMode:", -[_UINavigationBarItemStack effectiveDisplayModeForItemInCurrentStack:](self->super._stack, "effectiveDisplayModeForItemInCurrentStack:", 0));
LABEL_47:
  -[_UINavigationBarTransitionContext setBeginWithLargeTitle:](self->_transitionContext, "setBeginWithLargeTitle:", v42);
  -[_UINavigationBarTransitionContext setEndWithLargeTitle:](self->_transitionContext, "setEndWithLargeTitle:", 0);
  -[UINavigationBar delegate](self->super._navigationBar, "delegate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v47 = *MEMORY[0x1E0C9D538];
    -[_UINavigationBarTransitionContext setObservedScrollViewOffsetIsApplicable:](self->_transitionContext, "setObservedScrollViewOffsetIsApplicable:", objc_msgSend(v43, "_navigationBar:getContentOffsetOfObservedScrollViewIfApplicable:", self->super._navigationBar, &v47));
    -[_UINavigationBarTransitionContext setStartingContentOffsetForObservedScrollView:](self->_transitionContext, "setStartingContentOffsetForObservedScrollView:", v47);
  }

}

- (void)_endTransitionCompleted:(BOOL)a3
{
  _UINavigationBarTransitionContext *transitionContext;
  _BOOL4 v5;
  void *v6;
  _UINavigationBarItemStack *stack;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _UINavigationBarTransitionContext *v12;
  void (**v13)(id, uint64_t, void *);

  transitionContext = self->_transitionContext;
  if (transitionContext)
  {
    v5 = a3;
    -[_UINavigationBarTransitionContext completionHandler](transitionContext, "completionHandler");
    v13 = (void (**)(id, uint64_t, void *))objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack transitionAssistant](self->super._stack, "transitionAssistant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernIOS _updateContentPriorities](self, "_updateContentPriorities");
    -[_UINavigationBarVisualProviderModernIOS _updateAugmentedTitleDataSources](self, "_updateAugmentedTitleDataSources");
    stack = self->super._stack;
    if (v5)
    {
      -[_UINavigationBarItemStack topItem](stack, "topItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarVisualProviderModernIOS _updateContentForTopItem:backItem:animated:](self, "_updateContentForTopItem:backItem:animated:", v8, v9, 0);

      -[_UINavigationBarTransitionContext complete](self->_transitionContext, "complete");
    }
    else
    {
      -[_UINavigationBarItemStack previousTopItem](stack, "previousTopItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarItemStack previousBackItem](self->super._stack, "previousBackItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarVisualProviderModernIOS _updateContentForTopItem:backItem:animated:](self, "_updateContentForTopItem:backItem:animated:", v10, v11, 0);

      -[_UINavigationBarTransitionContext cancel](self->_transitionContext, "cancel");
    }
    -[_UINavigationBarVisualProviderModernIOS _updatePromptViewAndActuallyHide:](self, "_updatePromptViewAndActuallyHide:", 1);
    v12 = self->_transitionContext;
    self->_transitionContext = 0;

    -[_UINavigationBarVisualProviderModernIOS _invalidateIntrinsicContentSizeAndNotifySizeChanged](self, "_invalidateIntrinsicContentSizeAndNotifySizeChanged");
    if (v13)
      v13[2](v13, 1, v6);

  }
}

- (void)presentHostedSearchWithTransitionCoordinator:(id)a3
{
  -[_UINavigationBarVisualProviderModernIOS _presentOrDismissSearch:withTransitionCoordinator:](self, "_presentOrDismissSearch:withTransitionCoordinator:", 5, a3);
}

- (void)dismissHostedSearchWithTransitionCoordinator:(id)a3
{
  -[_UINavigationBarVisualProviderModernIOS _presentOrDismissSearch:withTransitionCoordinator:](self, "_presentOrDismissSearch:withTransitionCoordinator:", 6, a3);
}

- (void)_presentOrDismissSearch:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  _UINavigationBarTransitionContext *transitionContext;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  id *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void (**v35)(_QWORD);
  void (**v36)(_QWORD);
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  void (**v41)(_QWORD);
  _QWORD v42[4];
  void (**v43)(_QWORD);
  _QWORD v44[5];
  _QWORD aBlock[5];
  _QWORD v46[6];

  v7 = a4;
  if ((unint64_t)(a3 - 7) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if ((unint64_t)(a3 - 1) > 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (transition = %ld)"), a3);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarVisualProviderModernIOS.m"), 2682, CFSTR("Unexpected transition type: %@"), v39);

    }
    else
    {
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarVisualProviderModernIOS.m"), 2682, CFSTR("Unexpected transition type: %@"), off_1E16B6780[a3 - 1]);
    }

  }
  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSearchActive:", a3 == 5);
  -[_UINavigationBarVisualProviderModernIOS _setupTransitionContextForTransition:completion:](self, "_setupTransitionContextForTransition:completion:", a3, 0);
  objc_msgSend(v8, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 != 5)
  {
    -[_UINavigationBarTransitionContext toLayout](self->_transitionContext, "toLayout");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = *(double *)(v10 + 312);
    else
      v12 = 0.0;
    -[UINavigationBar delegate](self->super._navigationBar, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[_UINavigationBarLayout updateLayout]((uint64_t)v11);
      -[UINavigationBar delegate](self->super._navigationBar, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_navigationBar:preferredHeightForTransitionToHeightRange:", self->super._navigationBar, -[_UINavigationBarLayout layoutHeights]((uint64_t)v11));
      v16 = v15;

      -[_UINavigationBarLayout setLayoutSize:]((uint64_t)v11, v12, v16);
    }

  }
  -[_UINavigationBarTransitionContext setSharesContentViewLayouts:](self->_transitionContext, "setSharesContentViewLayouts:", 1);
  -[UINavigationBar _prepareToAnimateTransition](self->super._navigationBar, "_prepareToAnimateTransition");
  transitionContext = self->_transitionContext;
  v18 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __93___UINavigationBarVisualProviderModernIOS__presentOrDismissSearch_withTransitionCoordinator___block_invoke;
  v46[3] = &unk_1E16B1B28;
  v46[4] = self;
  -[_UINavigationBarTransitionContext recordUpdates:](transitionContext, "recordUpdates:", v46);
  v19 = -[_UINavigationBarTransitionContext compact](self->_transitionContext, "compact");
  -[_UINavigationBarTransitionContext fromLayout](self->_transitionContext, "fromLayout");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (id *)v20;
  if (v19)
  {
    if (v20)
      v22 = *(void **)(v20 + 184);
    else
      v22 = 0;
    v23 = v22;
    -[_UINavigationBarVisualProviderModernIOS _updateBackgroundLayout:forNavigationItem:compact:](self, "_updateBackgroundLayout:forNavigationItem:compact:", v23, v9, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarLayout setCompactBackgroundViewLayout:]((uint64_t)v21, v24);

    -[_UINavigationBarTransitionContext toLayout](self->_transitionContext, "toLayout");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (id *)v25;
    if (v25)
      v27 = *(void **)(v25 + 184);
    else
      v27 = 0;
    v28 = v27;
    -[_UINavigationBarVisualProviderModernIOS _updateBackgroundLayout:forNavigationItem:compact:](self, "_updateBackgroundLayout:forNavigationItem:compact:", v28, v9, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarLayout setCompactBackgroundViewLayout:]((uint64_t)v26, v29);
  }
  else
  {
    if (v20)
      v30 = *(void **)(v20 + 192);
    else
      v30 = 0;
    v31 = v30;
    -[_UINavigationBarVisualProviderModernIOS _updateBackgroundLayout:forNavigationItem:compact:](self, "_updateBackgroundLayout:forNavigationItem:compact:", v31, v9, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarLayout setStandardBackgroundViewLayout:](v21, v32);

    -[_UINavigationBarTransitionContext toLayout](self->_transitionContext, "toLayout");
    v33 = objc_claimAutoreleasedReturnValue();
    v26 = (id *)v33;
    if (v33)
      v34 = *(void **)(v33 + 192);
    else
      v34 = 0;
    v28 = v34;
    -[_UINavigationBarVisualProviderModernIOS _updateBackgroundLayout:forNavigationItem:compact:](self, "_updateBackgroundLayout:forNavigationItem:compact:", v28, v9, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarLayout setStandardBackgroundViewLayout:](v26, v29);
  }

  -[_UINavigationBarTransitionContext prepare](self->_transitionContext, "prepare");
  aBlock[0] = v18;
  aBlock[1] = 3221225472;
  aBlock[2] = __93___UINavigationBarVisualProviderModernIOS__presentOrDismissSearch_withTransitionCoordinator___block_invoke_2;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v35 = (void (**)(_QWORD))_Block_copy(aBlock);
  v44[0] = v18;
  v44[1] = 3221225472;
  v44[2] = __93___UINavigationBarVisualProviderModernIOS__presentOrDismissSearch_withTransitionCoordinator___block_invoke_3;
  v44[3] = &unk_1E16B1B28;
  v44[4] = self;
  v36 = (void (**)(_QWORD))_Block_copy(v44);
  if (objc_msgSend(v7, "isAnimated"))
  {
    v42[0] = v18;
    v42[1] = 3221225472;
    v42[2] = __93___UINavigationBarVisualProviderModernIOS__presentOrDismissSearch_withTransitionCoordinator___block_invoke_4;
    v42[3] = &unk_1E16B1CC8;
    v43 = v35;
    v40[0] = v18;
    v40[1] = 3221225472;
    v40[2] = __93___UINavigationBarVisualProviderModernIOS__presentOrDismissSearch_withTransitionCoordinator___block_invoke_5;
    v40[3] = &unk_1E16B1CC8;
    v41 = v36;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v42, v40);

  }
  else
  {
    v35[2](v35);
    v36[2](v36);
  }

}

- (void)_performAnimationWithTransitionCompletion:(id)a3 transition:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;
  id v9;
  _UINavigationBarContentView *contentView;
  void *v11;
  _UINavigationBarContentView *v12;
  void *v13;
  unint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  _UINavigationBarTransitionContext *transitionContext;
  _UINavigationBarItemStack *stack;
  void *v24;
  double *v25;
  double v26;
  _BOOL8 v27;
  _BOOL8 v28;
  _BOOL8 v29;
  _UINavigationBarItemStack *v30;
  void *v31;
  double *v32;
  uint64_t v33;
  uint64_t v34;
  double backgroundAlpha;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  int64_t appearanceAPIVersion;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  BOOL v62;
  void *v63;
  id v64;
  void *v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[5];
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  _UINavigationBarVisualProviderModernIOS *v75;
  _QWORD aBlock[5];
  id v77;
  int64_t v78;
  BOOL v79;
  BOOL v80;
  _QWORD v81[5];
  _QWORD v82[5];
  id v83;

  v6 = a3;
  if (self->_transitionContext)
  {
    NSLog(CFSTR("Attempting to begin a transition on navigation bar (%@) while a transition is in progress."), self->super._navigationBar);
    goto LABEL_53;
  }
  -[_UINavigationBarVisualProviderModernIOS _enforceLayoutOrdering](self, "_enforceLayoutOrdering");
  -[_UINavigationBarItemStack transitionAssistant](self->super._stack, "transitionAssistant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "transition");
  if (!v8)
  {
    v9 = v6;
    contentView = self->_contentView;
    -[_UINavigationBarItemStack previousTopItem](self->super._stack, "previousTopItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(-[_UINavigationBarContentView effectiveStyleForStyle:](contentView, "effectiveStyleForStyle:", objc_msgSend(v11, "style"))- 1) > 1)
    {
      v12 = self->_contentView;
      -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[_UINavigationBarContentView effectiveStyleForStyle:](v12, "effectiveStyleForStyle:", objc_msgSend(v13, "style"))- 1;

      v8 = a4;
      v15 = v14 > 1;
      v6 = v9;
      if (v15)
        goto LABEL_8;
    }
    else
    {

    }
    v8 = 3;
  }
LABEL_8:
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "titleView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v7;
  if (_UINavigationBarAugmentedTitleWantsTwoPartCrossfade(v17))
  {

  }
  else
  {
    -[_UINavigationBarItemStack previousTopItem](self->super._stack, "previousTopItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "titleView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = _UINavigationBarAugmentedTitleWantsTwoPartCrossfade(v19);

    if (!v20)
      goto LABEL_12;
  }
  -[_UINavigationBarTransitionContext setTwoPart:](self->_transitionContext, "setTwoPart:", 1);
  v8 = 3;
LABEL_12:
  -[_UINavigationBarVisualProviderModernIOS _updateAugmentedTitleDataSources](self, "_updateAugmentedTitleDataSources");
  -[_UINavigationBarVisualProviderModernIOS _updateTabBarSuppressionIfNeeded](self, "_updateTabBarSuppressionIfNeeded");
  v21 = MEMORY[0x1E0C809B0];
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke;
  v82[3] = &unk_1E16B66C8;
  v82[4] = self;
  v83 = v6;
  -[_UINavigationBarVisualProviderModernIOS _setupTransitionContextForTransition:completion:](self, "_setupTransitionContextForTransition:completion:", v8, v82);
  -[_UINavigationBarTransitionContext setPushOperation:](self->_transitionContext, "setPushOperation:", a4 == 1);
  -[UINavigationBar _prepareToAnimateTransition](self->super._navigationBar, "_prepareToAnimateTransition");
  transitionContext = self->_transitionContext;
  v81[0] = v21;
  v81[1] = 3221225472;
  v81[2] = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_2;
  v81[3] = &unk_1E16B1B28;
  v81[4] = self;
  -[_UINavigationBarTransitionContext recordUpdates:](transitionContext, "recordUpdates:", v81);
  v64 = v6;
  if (-[_UINavigationBarVisualProviderModernIOS allowLargeTitleView](self, "allowLargeTitleView"))
  {
    stack = self->super._stack;
    -[_UINavigationBarItemStack previousTopItem](stack, "previousTopItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(stack) = -[_UINavigationBarVisualProviderModernIOS _useLargeTitleForDisplayMode:](self, "_useLargeTitleForDisplayMode:", -[_UINavigationBarItemStack effectiveDisplayModeForItemInPreviousStack:](stack, "effectiveDisplayModeForItemInPreviousStack:", v24));

    if ((_DWORD)stack)
    {
      -[_UINavigationBarTransitionContext fromLayout](self->_transitionContext, "fromLayout");
      v25 = (double *)objc_claimAutoreleasedReturnValue();
      if (v25)
        v26 = v25[35];
      else
        v26 = 0.0;
      v27 = v26 > 0.0;

    }
    else
    {
      v27 = 0;
    }
    v30 = self->super._stack;
    -[_UINavigationBarItemStack topItem](v30, "topItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v30) = -[_UINavigationBarVisualProviderModernIOS _useLargeTitleForDisplayMode:](self, "_useLargeTitleForDisplayMode:", -[_UINavigationBarItemStack effectiveDisplayModeForItemInCurrentStack:](v30, "effectiveDisplayModeForItemInCurrentStack:", v31));

    if ((_DWORD)v30)
    {
      -[_UINavigationBarTransitionContext toLayout](self->_transitionContext, "toLayout");
      v32 = (double *)objc_claimAutoreleasedReturnValue();
      if (v32)
        v29 = v32[35] > 0.0;
      else
        v29 = 0;
      v28 = v27;

    }
    else
    {
      v29 = 0;
      v28 = v27;
    }
  }
  else
  {
    v28 = 0;
    v29 = 0;
  }
  -[_UINavigationBarTransitionContext setBeginWithLargeTitle:](self->_transitionContext, "setBeginWithLargeTitle:", v28);
  -[_UINavigationBarTransitionContext setEndWithLargeTitle:](self->_transitionContext, "setEndWithLargeTitle:", v29);
  -[_UINavigationBarTransitionContext fromLayout](self->_transitionContext, "fromLayout");
  v33 = objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarTransitionContext toLayout](self->_transitionContext, "toLayout");
  v34 = objc_claimAutoreleasedReturnValue();
  backgroundAlpha = self->_backgroundAlpha;
  if (v33 && *(double *)(v33 + 208) != backgroundAlpha)
  {
    *(double *)(v33 + 208) = backgroundAlpha;
    objc_msgSend((id)v33, "_updateLayoutOutputs");
    backgroundAlpha = self->_backgroundAlpha;
  }
  if (v34 && *(double *)(v34 + 208) != backgroundAlpha)
  {
    *(double *)(v34 + 208) = backgroundAlpha;
    objc_msgSend((id)v34, "_updateLayoutOutputs");
  }
  v62 = v29;
  if (-[_UINavigationBarTransitionContext compact](self->_transitionContext, "compact", backgroundAlpha))
  {
    if (v33)
      v36 = *(void **)(v33 + 184);
    else
      v36 = 0;
    v37 = v36;
    -[_UINavigationBarItemStack previousTopItem](self->super._stack, "previousTopItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernIOS _updateBackgroundLayout:forNavigationItem:compact:](self, "_updateBackgroundLayout:forNavigationItem:compact:", v37, v38, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
      v40 = *(void **)(v34 + 184);
    else
      v40 = 0;
    v41 = v40;
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernIOS _updateBackgroundLayout:forNavigationItem:compact:](self, "_updateBackgroundLayout:forNavigationItem:compact:", v41, v42, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UINavigationBarLayout setCompactBackgroundViewLayout:](v33, v39);
    -[_UINavigationBarLayout setCompactBackgroundViewLayout:](v34, v43);
  }
  else
  {
    if (v33)
      v44 = *(void **)(v33 + 192);
    else
      v44 = 0;
    v45 = v44;
    -[_UINavigationBarItemStack previousTopItem](self->super._stack, "previousTopItem");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernIOS _updateBackgroundLayout:forNavigationItem:compact:](self, "_updateBackgroundLayout:forNavigationItem:compact:", v45, v46, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
      v47 = *(void **)(v34 + 192);
    else
      v47 = 0;
    v48 = v47;
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernIOS _updateBackgroundLayout:forNavigationItem:compact:](self, "_updateBackgroundLayout:forNavigationItem:compact:", v48, v49, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UINavigationBarLayout setStandardBackgroundViewLayout:]((id *)v33, v39);
    -[_UINavigationBarLayout setStandardBackgroundViewLayout:]((id *)v34, v43);
  }
  appearanceAPIVersion = self->_appearanceAPIVersion;
  v65 = v39;
  if (appearanceAPIVersion == 1)
  {
    -[_UINavigationBarTransitionContext setBeginWithTransparencyAllowed:](self->_transitionContext, "setBeginWithTransparencyAllowed:", 1);
LABEL_48:
    -[_UINavigationBarTransitionContext setEndWithTransparencyAllowed:](self->_transitionContext, "setEndWithTransparencyAllowed:", appearanceAPIVersion == 1);
    goto LABEL_49;
  }
  if (self->_useModernAppearanceAPI)
  {
    objc_msgSend(v39, "backgroundData2");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarTransitionContext setBeginWithTransparencyAllowed:](self->_transitionContext, "setBeginWithTransparencyAllowed:", objc_msgSend(v51, "hasBackground") ^ 1);

  }
  else
  {
    -[_UINavigationBarTransitionContext setBeginWithTransparencyAllowed:](self->_transitionContext, "setBeginWithTransparencyAllowed:", 0);
  }
  if (!self->_useModernAppearanceAPI)
    goto LABEL_48;
  objc_msgSend(v43, "backgroundData2");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarTransitionContext setEndWithTransparencyAllowed:](self->_transitionContext, "setEndWithTransparencyAllowed:", objc_msgSend(v52, "hasBackground") ^ 1);

LABEL_49:
  -[_UINavigationBarTransitionContext prepare](self->_transitionContext, "prepare");
  v53 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_3;
  aBlock[3] = &unk_1E16B66F0;
  aBlock[4] = self;
  v78 = v8;
  v79 = v28;
  v80 = v62;
  v54 = (id)v34;
  v77 = v54;
  v55 = _Block_copy(aBlock);
  v73[0] = v53;
  v73[1] = 3221225472;
  v73[2] = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_8;
  v73[3] = &unk_1E16B2218;
  v56 = v63;
  v74 = v56;
  v75 = self;
  v57 = _Block_copy(v73);
  v70[0] = v53;
  v70[1] = 3221225472;
  v70[2] = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_9;
  v70[3] = &unk_1E16B6718;
  v70[4] = self;
  v58 = v55;
  v72 = v58;
  v59 = v56;
  v71 = v59;
  v60 = _Block_copy(v70);
  if ((objc_msgSend(v59, "shouldAnimateAlongside") & 1) != 0)
  {
    objc_msgSend(v59, "transitionCoordinator");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v53;
    v68[1] = 3221225472;
    v68[2] = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_10;
    v68[3] = &unk_1E16B1CC8;
    v69 = v60;
    v66[0] = v53;
    v66[1] = 3221225472;
    v66[2] = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_11;
    v66[3] = &unk_1E16B1CC8;
    v67 = v57;
    objc_msgSend(v61, "_animateAlongsideTransitionInView:systemAnimation:systemCompletion:animation:completion:", 0, 0, 1, v68, v66);

  }
  else
  {
    (*((void (**)(void *, void *))v60 + 2))(v60, v57);
  }

  v6 = v64;
LABEL_53:

}

- (void)popAnimated:(BOOL)a3 completion:(id)a4
{
  if (a3)
    -[_UINavigationBarVisualProviderModernIOS _performAnimationWithTransitionCompletion:transition:](self, "_performAnimationWithTransitionCompletion:transition:", a4, 2);
  else
    -[_UINavigationBarVisualProviderModernIOS _updateWithCompletion:](self, "_updateWithCompletion:", a4);
}

- (void)prepareForPop
{
  void *v3;

  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProviderModernIOS _upgradeAppearanceAPIForItemIfNecessary:](self, "_upgradeAppearanceAPIForItemIfNecessary:", v3);

  -[_UINavigationBarVisualProviderModernIOS _prepareLayouts](self, "_prepareLayouts");
}

- (void)animateForSearchPresentation:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  _UINavigationBarVisualProviderModernIOS *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(_QWORD *);
  void *v23;
  _UINavigationBarVisualProviderModernIOS *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  _UINavigationBarVisualProviderModernIOS *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  void *v37;
  _UINavigationBarVisualProviderModernIOS *v38;

  v3 = a3;
  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarVisualProviderModernIOS.m"), 2998, CFSTR("Hosted search should take a different code path"));

  }
  if (!self->_runningPaletteBasedSearchPresentation)
  {
    self->_runningPaletteBasedSearchPresentation = 1;
    -[UIView alpha](self->_contentView, "alpha");
    v9 = v8;
    -[UIView alpha](self->_largeTitleView, "alpha");
    v11 = v10;
    if (v3)
    {
      v34 = MEMORY[0x1E0C809B0];
      v35 = 3221225472;
      v36 = __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke;
      v37 = &unk_1E16B1B28;
      v38 = self;
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_4;
      v30 = &unk_1E16B2290;
      v31 = self;
      v32 = v9;
      v33 = v10;
      v12 = &v34;
      v13 = &v27;
    }
    else
    {
      -[UIView setAlpha:](self->_contentView, "setAlpha:", 0.0);
      -[UIView setAlpha:](self->_largeTitleView, "setAlpha:", 0.0);
      v19 = self;
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_5;
      v23 = &unk_1E16B4E70;
      v24 = self;
      v25 = v9;
      v26 = v11;
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_8;
      v18 = &unk_1E16B3FD8;
      v12 = &v20;
      v13 = &v15;
    }
    +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v12, v13, 0.0, 0.0, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26,
      v27,
      v28,
      v29,
      v30,
      v31,
      v32,
      v33,
      v34,
      v35,
      v36,
      v37,
      v38);
  }
}

- (CGPoint)contentViewLayoutFrameOrigin
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)promptViewLayoutFrameOrigin
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (int64_t)currentContentSize
{
  return -[_UINavigationBarContentView currentContentSize](self->_contentView, "currentContentSize");
}

- (id)hitTest:(CGPoint)a3 defaultViewHit:(id)a4
{
  double y;
  double x;
  id v7;
  _UINavigationBarLargeTitleView *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _UINavigationBarLargeTitleView *largeTitleView;
  _UINavigationBarLargeTitleView *v15;
  CGPoint v17;
  CGPoint v18;
  CGRect v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!self->_isHidden)
  {
    -[UIView frame](self->_contentView, "frame");
    v17.x = x;
    v17.y = y;
    if (CGRectContainsPoint(v19, v17))
    {
      -[UIView frame](self->_largeTitleView, "frame");
      v18.x = x;
      v18.y = y;
      if (CGRectContainsPoint(v20, v18))
      {
        -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "activeLayout");
        v10 = objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          if (*(_BYTE *)(v10 + 108))
          {
            v11 = *(id *)(v10 + 128);
            if (v11)
            {
              v12 = v11;
              v13 = *(id *)(v10 + 144);

              if (v13)
              {
                largeTitleView = self->_largeTitleView;
                -[UIView convertPoint:toView:](self->super._navigationBar, "convertPoint:toView:", largeTitleView, x, y);
                -[UIView hitTest:withEvent:](largeTitleView, "hitTest:withEvent:", 0);
                v15 = (_UINavigationBarLargeTitleView *)objc_claimAutoreleasedReturnValue();
                v8 = v15;
                if (v15 && v15 != self->_largeTitleView)
                {

                  goto LABEL_15;
                }

              }
            }
          }
        }

      }
    }
    v8 = (_UINavigationBarLargeTitleView *)v7;
    goto LABEL_15;
  }
  v8 = 0;
LABEL_15:

  return v8;
}

- (int64_t)statusBarStyle
{
  void *v3;
  uint64_t v4;
  void *v6;
  double v7;
  double v8;
  objc_super v9;

  if (self->_useModernAppearanceAPI)
  {
    -[UIView traitCollection](self->_backgroundView, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceStyle");

    if (v4 == 2)
      return 1;
    else
      return 3;
  }
  else
  {
    if (-[UINavigationBar barStyle](self->super._navigationBar, "barStyle"))
      return 1;
    if (!self->_usesBarBackground)
      return 1;
    -[_UIBarBackground layout](self->_backgroundView, "layout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topInset");
    v8 = v7;

    if (v8 > 0.0)
    {
      return 1;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)_UINavigationBarVisualProviderModernIOS;
      return -[_UINavigationBarVisualProvider statusBarStyle](&v9, sel_statusBarStyle);
    }
  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[UIView bounds](self->super._navigationBar, "bounds");
  -[_UINavigationBarVisualProviderModernIOS layoutHeightsFittingWidth:](self, "layoutHeightsFittingWidth:", v3);
  v5 = v4;
  v6 = -1.0;
  result.height = v5;
  result.width = v6;
  return result;
}

- (id)restingHeights
{
  int has_internal_diagnostics;
  UINavigationItem *itemForMeasuring;
  void *v5;
  void **v6;
  void *v7;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  itemForMeasuring = self->super._itemForMeasuring;
  if (has_internal_diagnostics)
  {
    if (itemForMeasuring)
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Don’t know how to apply override measurement item when calculating detents!", buf, 2u);
      }

    }
  }
  else if (itemForMeasuring)
  {
    v10 = restingHeights___s_category;
    if (!restingHeights___s_category)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&restingHeights___s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Don’t know how to apply override measurement item when calculating detents!", v12, 2u);
    }
  }
  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeLayout");
  v6 = (void **)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarLayout restingHeights](v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_didEncounterFirstTitleWithExcessiveHeightChanged:(id)a3
{
  void *v4;
  void *v5;

  if (!self->_providesExtraSpaceForExcessiveLineHeights)
  {
    self->_providesExtraSpaceForExcessiveLineHeights = 1;
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernIOS _updateContentForTopItem:backItem:animated:](self, "_updateContentForTopItem:backItem:animated:", v4, v5, 1);

    -[_UINavigationBarVisualProviderModernIOS _invalidateIntrinsicContentSizeAndNotifySizeChanged](self, "_invalidateIntrinsicContentSizeAndNotifySizeChanged");
  }
}

- (void)_postDidEncounterFirstTitleWithExcessiveHeightChanged
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("_UINavigationBarLargeTitleDidEncounterFirstTitleWithExcessiveHeightChanged"), 0);

}

- (void)navigationControllerRefreshControlHostDidUpdateLayout:(id)a3
{
  void *v4;
  void *v5;

  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarLayout updateLayout]((uint64_t)v5);

  -[_UINavigationBarVisualProviderModernIOS _invalidateIntrinsicContentSizeAndNotifySizeChanged](self, "_invalidateIntrinsicContentSizeAndNotifySizeChanged");
}

- (id)tabBarHostedView
{
  return self->_tabBarHostedView;
}

- (void)setTabBarHostedView:(id)a3
{
  _UITabContainerView *v5;
  _UITabContainerView **p_tabBarHostedView;
  _UINavigationBarVisualProviderModernIOS *v7;
  _UINavigationBarVisualProviderModernIOS *v8;
  _UINavigationBarVisualProviderModernIOS *v9;
  void *v10;
  _UITabContainerView *v11;

  v5 = (_UITabContainerView *)a3;
  p_tabBarHostedView = &self->_tabBarHostedView;
  v11 = v5;
  if (self->_tabBarHostedView != v5
    || (-[_UITabContainerView floatingTabBarHost](v5, "floatingTabBarHost"),
        v7 = (_UINavigationBarVisualProviderModernIOS *)objc_claimAutoreleasedReturnValue(),
        v7,
        v5 = v11,
        v7 != self))
  {
    if (self->_isSuppressingTabBar)
    {
      -[_UITabContainerView floatingTabBarHost](*p_tabBarHostedView, "floatingTabBarHost");
      v8 = (_UINavigationBarVisualProviderModernIOS *)objc_claimAutoreleasedReturnValue();

      if (v8 == self)
        -[_UITabContainerView setSuppressTabBar:](*p_tabBarHostedView, "setSuppressTabBar:", 0);
      self->_isSuppressingTabBar = 0;
      v5 = v11;
    }
    -[_UITabContainerView floatingTabBarHost](v5, "floatingTabBarHost");
    v9 = (_UINavigationBarVisualProviderModernIOS *)objc_claimAutoreleasedReturnValue();

    if (v9 == self)
      -[_UITabContainerView setFloatingTabBarHost:](v11, "setFloatingTabBarHost:", 0);
    objc_storeStrong((id *)&self->_tabBarHostedView, a3);
    -[_UINavigationBarVisualProviderModernIOS _updateTabBarHost](self, "_updateTabBarHost");
    if (-[_UITabContainerView wantsOverlaySidebarButton](v11, "wantsOverlaySidebarButton"))
    {
      -[_UITabContainerView sidebarPlaceholder](*p_tabBarHostedView, "sidebarPlaceholder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarVisualProviderModernIOS setStaticNavBarButtonItem:trailingPosition:](self, "setStaticNavBarButtonItem:trailingPosition:", v10, 0);

    }
    -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");
    v5 = v11;
  }

}

- (void)setActiveTabBarHost:(BOOL)a3
{
  if (self->_isActiveTabBarHost != a3)
  {
    self->_isActiveTabBarHost = a3;
    -[_UINavigationBarVisualProviderModernIOS _updateTabBarHost](self, "_updateTabBarHost");
  }
}

- (void)setWantsHostedTabBarMetrics:(BOOL)a3
{
  if (self->_wantsHostedTabBarMetrics != a3)
  {
    self->_wantsHostedTabBarMetrics = a3;
    -[_UINavigationBarContentView setWantsHostedTabBarMetrics:](self->_contentView, "setWantsHostedTabBarMetrics:");
    -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");
  }
}

- (void)_updateTabBarHost
{
  _BOOL4 isActiveTabBarHost;
  _UITabContainerView *tabBarHostedView;
  _UINavigationBarVisualProviderModernIOS *v5;
  _UINavigationBarVisualProviderModernIOS *v6;
  _BOOL4 v7;

  isActiveTabBarHost = self->_isActiveTabBarHost;
  tabBarHostedView = self->_tabBarHostedView;
  if (isActiveTabBarHost)
  {
    v5 = self;
LABEL_3:
    -[_UITabContainerView setFloatingTabBarHost:](tabBarHostedView, "setFloatingTabBarHost:", v5);
    return;
  }
  -[_UITabContainerView floatingTabBarHost](tabBarHostedView, "floatingTabBarHost");
  v6 = (_UINavigationBarVisualProviderModernIOS *)objc_claimAutoreleasedReturnValue();
  if (v6 == self)
  {
    v7 = self->_isActiveTabBarHost;

    if (!v7)
    {
      tabBarHostedView = self->_tabBarHostedView;
      v5 = 0;
      goto LABEL_3;
    }
  }
  else
  {

  }
}

- (void)_updateTabBarSuppressionIfNeeded
{
  void *v3;
  void *v4;

  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_stackEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isSuppressingTabBar = objc_msgSend(v4, "isSearchActive");

  if (self->_isActiveTabBarHost)
    -[_UITabContainerView setSuppressTabBar:](self->_tabBarHostedView, "setSuppressTabBar:", self->_isSuppressingTabBar);
}

- (void)setStaticNavBarButtonItem:(id)a3 trailingPosition:(BOOL)a4
{
  _BOOL8 v4;
  UIBarButtonItem **p_staticNavBarButtonItem;
  id v8;

  v4 = a4;
  p_staticNavBarButtonItem = &self->_staticNavBarButtonItem;
  objc_storeStrong((id *)&self->_staticNavBarButtonItem, a3);
  v8 = a3;
  -[_UINavigationBarContentView setStaticNavBarButtonTrailing:](self->_contentView, "setStaticNavBarButtonTrailing:", v4);
  -[_UINavigationBarContentView setStaticNavBarButtonItem:](self->_contentView, "setStaticNavBarButtonItem:", *p_staticNavBarButtonItem);
  -[UINavigationBar _accessibility_navigationBarContentsDidChange](self->super._navigationBar, "_accessibility_navigationBarContentsDidChange");

}

- (id)staticNavBarButtonItem
{
  return self->_staticNavBarButtonItem;
}

- (BOOL)isContentView:(id)a3
{
  return self->_contentView == a3;
}

- (BOOL)isContentViewHidden
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;

  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeLayout");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = *(void **)(v3 + 128);
  else
    v5 = 0;
  v6 = v5;
  v7 = v6 == 0;

  return v7;
}

- (void)setNeedsStaticNavBarButtonUpdate
{
  void *v3;

  if (-[UIBarButtonItem _actsAsFakeBackButton](self->_staticNavBarButtonItem, "_actsAsFakeBackButton"))
  {
    -[_UINavigationBarVisualProviderModernIOS _staticNavBarButtonFakeBackMenu](self, "_staticNavBarButtonFakeBackMenu");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setMenu:](self->_staticNavBarButtonItem, "setMenu:", v3);

  }
  else
  {
    -[UIBarButtonItem setMenu:](self->_staticNavBarButtonItem, "setMenu:", 0);
  }
  -[_UINavigationBarContentView setNeedsStaticNavBarButtonUpdate](self->_contentView, "setNeedsStaticNavBarButtonUpdate");
  -[UINavigationBar _accessibility_navigationBarContentsDidChange](self->super._navigationBar, "_accessibility_navigationBarContentsDidChange");
}

- (void)setShouldFadeStaticNavBarButton:(BOOL)a3
{
  -[_UINavigationBarContentView setShouldFadeStaticNavBarButton:](self->_contentView, "setShouldFadeStaticNavBarButton:", a3);
}

- (BOOL)shouldFadeStaticNavBarButton
{
  return -[_UINavigationBarContentView shouldFadeStaticNavBarButton](self->_contentView, "shouldFadeStaticNavBarButton");
}

- (BOOL)staticNavBarButtonLingers
{
  return -[_UINavigationBarContentView staticNavBarButtonLingers](self->_contentView, "staticNavBarButtonLingers");
}

- (void)beginAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange
{
  -[_UINavigationBarContentView beginAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange](self->_contentView, "beginAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange");
}

- (BOOL)isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange
{
  return -[_UINavigationBarContentView isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange](self->_contentView, "isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange");
}

- (double)navItemContentLayoutGuideAnimationDistance
{
  double result;

  -[_UINavigationBarContentView navItemContentLayoutGuideAnimationDistance](self->_contentView, "navItemContentLayoutGuideAnimationDistance");
  return result;
}

- (BOOL)updateNavItemContentLayoutGuideAnimationConstraintConstant:(double)a3
{
  return -[_UINavigationBarContentView updateNavItemContentLayoutGuideAnimationConstraintConstant:](self->_contentView, "updateNavItemContentLayoutGuideAnimationConstraintConstant:", a3);
}

- (void)endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange
{
  -[_UINavigationBarContentView endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange](self->_contentView, "endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange");
}

- (void)_removeContentClippingView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  UINavigationBar *v7;
  void *v8;
  void *v9;
  UINavigationBar *v10;
  UINavigationBar *v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "normalLayout");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = *(void **)(v4 + 136);
  else
    v6 = 0;
  v7 = v6;

  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "normalLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarLayout setAnimationContentClippingView:]((uint64_t)v9, 0);

  -[UIView superview](self->_contentView, "superview");
  v10 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && v10 != self->super._navigationBar)
  {
    if (v7 && v10 != v7)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "Unexpected container for the content view when trying to remove clipping view", buf, 2u);
        }

      }
      else
      {
        v12 = _removeContentClippingView___s_category;
        if (!_removeContentClippingView___s_category)
        {
          v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v12, (unint64_t *)&_removeContentClippingView___s_category);
        }
        v13 = *(NSObject **)(v12 + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Unexpected container for the content view when trying to remove clipping view", v15, 2u);
        }
      }
    }
    -[UIView addSubview:](self->super._navigationBar, "addSubview:", self->_contentView);
    -[UIView removeFromSuperview](v7, "removeFromSuperview");
  }

}

- (void)_installContentClippingView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UINavigationBarItemStack topEntry](self->super._stack, "topEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_UINavigationBarVisualProviderModernIOS _ensureLayoutsConfiguredForEntry:](self, "_ensureLayoutsConfiguredForEntry:", v4);
    objc_msgSend(v4, "normalLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarLayout setAnimationContentClippingView:]((uint64_t)v5, v8);

    objc_msgSend(v4, "activeLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "normalLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
    {
      -[UIView addSubview:](self->super._navigationBar, "addSubview:", v8);
      objc_msgSend(v8, "addSubview:", self->_contentView);
    }
  }

}

- (void)navigationBarContentViewDidTriggerBackAction:(id)a3 fromBackButtonItem:(id)a4
{
  -[UINavigationBar _sendNavigationPopForBackBarButtonItem:](self->super._navigationBar, "_sendNavigationPopForBackBarButtonItem:", a4);
}

- (void)navigationBarContentViewDidTriggerTitleRenameAction:(id)a3
{
  -[UINavigationBar _beginRenamingIfPossible](self->super._navigationBar, "_beginRenamingIfPossible", a3);
}

- (BOOL)navigationItemIsBackItem:(id)a3
{
  _UINavigationBarItemStack *stack;
  id v4;
  id v5;

  stack = self->super._stack;
  v4 = a3;
  -[_UINavigationBarItemStack backItem](stack, "backItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (void)navigationItemUpdatedAdditionalOverflowItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!-[_UINavigationBarItemStack state](self->super._stack, "state"))
  {
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 == v9)
    {
      objc_msgSend(v9, "additionalOverflowItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarContentView layout](self->_contentView, "layout");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "canUpdateAdditionalOverflowItemsInPlace");

      if (v7)
      {
        -[_UINavigationBarContentView layout](self->_contentView, "layout");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setAdditionalOverflowItems:", v5);
        -[_UINavigationBarContentView setAdditionalItems:](self->_contentView, "setAdditionalItems:", v5);
      }
      else
      {
        -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UINavigationBarVisualProviderModernIOS _updateContentForTopItem:backItem:animated:](self, "_updateContentForTopItem:backItem:animated:", v9, v8, 0);
      }

    }
  }

}

- (id)presentationSourceForContent:(int64_t)a3 navigationItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v6 = a4;
  if (!-[_UINavigationBarItemStack state](self->super._stack, "state")
    && (-[_UINavigationBarItemStack topItem](self->super._stack, "topItem"),
        v7 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v7 == v6))
  {
    if (a3)
    {
      v10 = 0;
    }
    else
    {
      -[_UINavigationBarContentView layout](self->_contentView, "layout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "overflowItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "buttonGroup");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isHidden");

      if ((v14 & 1) != 0)
        v10 = 0;
      else
        v10 = v12;

    }
    _UIPopoverPresentationControllerSourceItemObscuredSource(v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)navigationItemUpdatedPromptContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  char v11;
  id v12;

  v12 = a3;
  if (!-[_UINavigationBarItemStack state](self->super._stack, "state"))
  {
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v4 == v12)
    {
      -[_UINavigationBarModernPromptView prompt](self->_promptView, "prompt");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "prompt");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {

      }
      else
      {
        if (v7)
          v10 = v8 == 0;
        else
          v10 = 1;
        if (v10)
        {

        }
        else
        {
          v11 = objc_msgSend(v7, "isEqual:", v8);

          if ((v11 & 1) != 0)
            goto LABEL_13;
        }
        -[_UINavigationBarModernPromptView setPrompt:](self->_promptView, "setPrompt:", v9);
        -[UIView layoutIfNeeded](self->_promptView, "layoutIfNeeded");
        -[UINavigationBar _sendResizeForPromptChange](self->super._navigationBar, "_sendResizeForPromptChange");
        -[UINavigationBar _accessibility_navigationBarContentsDidChange](self->super._navigationBar, "_accessibility_navigationBarContentsDidChange");
      }
LABEL_13:

    }
  }

}

- (void)navigationItemUpdatedBackgroundAppearance:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (!-[_UINavigationBarItemStack state](self->super._stack, "state"))
  {
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 == v5)
      -[_UINavigationBarVisualProviderModernIOS _updateBackground](self, "_updateBackground");

  }
}

- (void)navigationItemUpdatedNavigationBarVisibility:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (!-[_UINavigationBarItemStack state](self->super._stack, "state"))
  {
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 == v5)
      -[_UINavigationBarVisualProviderModernIOS updateBarVisibilityForTopItem](self, "updateBarVisibilityForTopItem");

  }
}

- (void)navigationItemSearchControllerReadyForDeferredAutomaticShowsScopeBar:(id)a3
{
  _UINavigationBarItemStack *stack;
  id v5;
  id v6;
  void *v7;
  id v8;

  stack = self->super._stack;
  v5 = a3;
  -[_UINavigationBarItemStack topItem](stack, "topItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    -[_UINavigationBarVisualProvider navigationBar](self, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "_navigationBarWillRunAutomaticDeferredShowsScopeBar:", self->super._navigationBar);

  }
}

- (BOOL)shouldSearchControllerDeferPresentationTransitionForNavigationItem:(id)a3
{
  id v4;
  id v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[_UINavigationBarVisualProvider navigationBar](self, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = objc_msgSend(v8, "_navigationItemShouldDeferSearchPresentationOrDismissalForScrollViewAnimation:", v4);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)navigationItemUpdatedBottomPalette:(id)a3 oldPalette:(id)a4
{
  id v5;
  UINavigationBar *v6;
  UINavigationBar *navigationBar;
  id v8;

  v5 = a4;
  v8 = v5;
  if (!self->_transitionContext)
  {
    objc_msgSend(v5, "superview");
    v6 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
    navigationBar = self->super._navigationBar;

    if (v6 == navigationBar)
      objc_msgSend(v8, "removeFromSuperview");
    -[_UINavigationBarVisualProviderModernIOS _invalidateIntrinsicContentSizeAndNotifySizeChanged](self, "_invalidateIntrinsicContentSizeAndNotifySizeChanged");
  }
  -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");

}

- (void)navigationItem:(id)a3 updatedPalettePart:(int64_t)a4 oldPalette:(id)a5
{
  id v9;
  id v10;
  UINavigationBar *v11;
  UINavigationBar *navigationBar;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;

  v21 = a3;
  v9 = a5;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarVisualProviderModernIOS.m"), 4278, CFSTR("Unexpected palette part (%li)"), a4);

  }
  if (a4 == 6)
    objc_msgSend(v21, "_topPalette");
  else
    objc_msgSend(v21, "_bottomPalette");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 != v9)
  {
    objc_msgSend(v9, "superview");
    v11 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
    navigationBar = self->super._navigationBar;

    if (v11 == navigationBar)
      objc_msgSend(v9, "removeFromSuperview");
    if (!-[_UINavigationBarItemStack state](self->super._stack, "state"))
      goto LABEL_12;
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v21;
    if (v13 == v21)
    {
LABEL_16:

      goto LABEL_17;
    }
    -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15 != v21)
    {
LABEL_12:
      objc_msgSend(v21, "_stackEntry");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "normalLayout");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (a4 == 6)
      {
        -[_UINavigationBarLayout setTopPalette:](v16, v10);

        objc_msgSend(v14, "searchLayout");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UINavigationBarLayout setTopPalette:]((uint64_t)v18, v10);
      }
      else
      {
        -[_UINavigationBarLayout setBottomPalette:](v16, v10);

        objc_msgSend(v14, "searchLayout");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UINavigationBarLayout setBottomPalette:]((uint64_t)v18, v10);
      }

      goto LABEL_16;
    }
  }
LABEL_17:
  if (!-[_UINavigationBarItemStack state](self->super._stack, "state"))
  {
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (v19 == v21)
      -[_UINavigationBarVisualProviderModernIOS _invalidateIntrinsicContentSizeAndNotifySizeChanged](self, "_invalidateIntrinsicContentSizeAndNotifySizeChanged");
  }

}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return 0;
}

- (id)_timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  double v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD *v16;

  v6 = a3;
  v7 = a4;
  -[_UINavigationBarItemStack transitionAssistant](self->super._stack, "transitionAssistant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "interactive");

  if (v9)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("opacity")))
    {
      -[_UINavigationBarTransitionContext viewUsingEaseInCurve](self->_transitionContext, "viewUsingEaseInCurve");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v10 != v6)
      {
        objc_msgSend(v6, "alpha");
        if (v11 < 0.05
          || (-[_UINavigationBarTransitionContext viewFadingInFromCustomAlpha](self->_transitionContext, "viewFadingInFromCustomAlpha"), v12 = (id)objc_claimAutoreleasedReturnValue(), v12, v12 == v6))
        {
          +[_UINavigationBarTransitionContext fadeInFunction](_UINavigationBarTransitionContext, "fadeInFunction");
          v13 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          +[_UINavigationBarTransitionContext fadeOutFunction](_UINavigationBarTransitionContext, "fadeOutFunction");
          v13 = objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_12;
      }
      v15 = (void *)MEMORY[0x1E0CD27D0];
      v16 = (_QWORD *)MEMORY[0x1E0CD3040];
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0CD27D0];
      v16 = (_QWORD *)MEMORY[0x1E0CD3058];
    }
    objc_msgSend(v15, "functionWithName:", *v16);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v14 = (void *)v13;
    goto LABEL_13;
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4
{
  return 1;
}

- (void)tabBarContainerWillChangeFloatingTabBarVisibility:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (!self->_transitionContext)
  {
    -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");
    v4 = v6;
  }
  if (objc_msgSend(v4, "wantsOverlaySidebarButton"))
  {
    objc_msgSend(v6, "sidebarPlaceholder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernIOS setStaticNavBarButtonItem:trailingPosition:](self, "setStaticNavBarButtonItem:trailingPosition:", v5, 0);

  }
}

- (void)tabBarContainerDidLayoutFloatingTabBar:(id)a3
{
  if (!self->_transitionContext)
  {
    -[_UITabContainerView floatingTabBarContentFrameInCoordinateSpace:](self->_tabBarHostedView, "floatingTabBarContentFrameInCoordinateSpace:", self->_contentView);
    -[_UINavigationBarContentView setHostedTabBarFrame:](self->_contentView, "setHostedTabBarFrame:");
  }
}

- (double)contentViewVerticalOffsetInTabBarContainer:(id)a3
{
  return 0.0;
}

- (BOOL)_shim_hasCustomBackgroundView
{
  void *v2;
  BOOL v3;

  if (!self->_usesBarBackground)
    return 0;
  -[_UIBarBackground customBackgroundView](self->_backgroundView, "customBackgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (double)_shim_shadowAlpha
{
  return self->_shadowAlpha;
}

- (BOOL)_shim_disableBlurTinting
{
  void *v2;
  char v3;

  if (!self->_usesBarBackground)
    return 0;
  -[_UIBarBackground layout](self->_backgroundView, "layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disableTinting");

  return v3;
}

- (void)_shim_setDisableBlurTinting:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;

  if (self->_usesBarBackground)
  {
    v4 = a3;
    -[_UIBarBackground layout](self->_backgroundView, "layout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisableTinting:", v4);

  }
  -[_UINavigationBarVisualProviderModernIOS changeAppearance](self, "changeAppearance", a3);
}

- (BOOL)_accessibility_shouldBeginHUDGestureAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  y = a3.y;
  x = a3.x;
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_searchControllerIfAllowed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 1;
  if (v8)
  {
    -[UIView convertPoint:toView:](self->super._navigationBar, "convertPoint:toView:", v8, x, y);
    if ((objc_msgSend(v8, "pointInside:withEvent:", 0) & 1) != 0)
      v9 = 0;
  }

  return v9;
}

- (id)_accessibility_HUDItemForPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  _UINavigationBarModernPromptView *promptView;
  UIAccessibilityHUDItem *v13;
  void *v14;
  UIAccessibilityHUDItem *v15;
  UILabel *weeTitleLabel;
  UIAccessibilityHUDItem *v17;
  uint64_t v18;
  _UINavigationBarLargeTitleView *largeTitleView;
  void *v20;
  void *v21;
  UINavigationBar *navigationBar;
  void *v23;
  void *v24;
  UIAccessibilityHUDItem *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;

  y = a3.y;
  x = a3.x;
  -[UIView convertPoint:toView:](self->super._navigationBar, "convertPoint:toView:", self->_contentView);
  v7 = v6;
  v9 = v8;
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_weeTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length") && !-[UIView isHidden](self->_weeTitleLabel, "isHidden"))
  {
    weeTitleLabel = self->_weeTitleLabel;
    -[UIView convertPoint:toView:](self->super._navigationBar, "convertPoint:toView:", weeTitleLabel, x, y);
    LODWORD(weeTitleLabel) = -[UIView pointInside:withEvent:](weeTitleLabel, "pointInside:withEvent:", 0);

    if ((_DWORD)weeTitleLabel)
    {
      v17 = [UIAccessibilityHUDItem alloc];
      -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_weeTitle");
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  else
  {

  }
  if (!-[UIView isHidden](self->_promptView, "isHidden"))
  {
    promptView = self->_promptView;
    -[UIView convertPoint:toView:](self->super._navigationBar, "convertPoint:toView:", promptView, x, y);
    if (-[UIView pointInside:withEvent:](promptView, "pointInside:withEvent:", 0))
    {
      v13 = [UIAccessibilityHUDItem alloc];
      -[_UINavigationBarModernPromptView prompt](self->_promptView, "prompt");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:](v13, "initWithTitle:image:imageInsets:", v14, 0, 0.0, 0.0, 0.0, 0.0);
LABEL_17:

      return v15;
    }
  }
  if (!-[UIView pointInside:withEvent:](self->_contentView, "pointInside:withEvent:", 0, v7, v9))
  {
    largeTitleView = self->_largeTitleView;
    -[UIView convertPoint:toView:](self->super._navigationBar, "convertPoint:toView:", largeTitleView, x, y);
    v15 = 0;
    if (!-[UIView pointInside:withEvent:](largeTitleView, "pointInside:withEvent:", 0))
      return v15;
    -[_UINavigationBarLargeTitleView accessoryView](self->_largeTitleView, "accessoryView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[_UINavigationBarLargeTitleView accessoryView](self->_largeTitleView, "accessoryView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      navigationBar = self->super._navigationBar;
      -[_UINavigationBarLargeTitleView accessoryView](self->_largeTitleView, "accessoryView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView convertPoint:toView:](navigationBar, "convertPoint:toView:", v23, x, y);
      objc_msgSend(v21, "_largeContentViewerItemAtPoint:");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v25 = [UIAccessibilityHUDItem alloc];
        objc_msgSend(v24, "largeContentTitle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "largeContentImage");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "largeContentImageInsets");
        v15 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:](v25, "initWithTitle:image:imageInsets:scaleImage:", v26, v27, objc_msgSend(v24, "scalesLargeContentImage"), v28, v29, v30, v31);

        return v15;
      }
    }
    v17 = [UIAccessibilityHUDItem alloc];
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "title");
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v32 = (void *)v18;
    v15 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:](v17, "initWithTitle:image:imageInsets:", v18, 0, 0.0, 0.0, 0.0, 0.0);

    goto LABEL_17;
  }
  -[_UINavigationBarContentView _accessibility_HUDItemForPoint:](self->_contentView, "_accessibility_HUDItemForPoint:", v7, v9);
  v15 = (UIAccessibilityHUDItem *)objc_claimAutoreleasedReturnValue();
  return v15;
}

- (id)_accessibility_controlToActivateForHUDGestureLiftAtPoint:(CGPoint)a3
{
  double y;
  double x;
  _UINavigationBarContentView *contentView;
  id v7;
  void *v8;
  UINavigationBar *navigationBar;
  void *v10;
  void *v11;

  y = a3.y;
  x = a3.x;
  contentView = self->_contentView;
  -[UIView convertPoint:toView:](self->super._navigationBar, "convertPoint:toView:", contentView);
  -[_UINavigationBarContentView _accessibility_controlToActivateForHUDGestureLiftAtPoint:](contentView, "_accessibility_controlToActivateForHUDGestureLiftAtPoint:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[_UINavigationBarLargeTitleView accessoryView](self->_largeTitleView, "accessoryView");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[_UINavigationBarLargeTitleView accessoryView](self->_largeTitleView, "accessoryView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      navigationBar = self->super._navigationBar;
      -[_UINavigationBarLargeTitleView accessoryView](self->_largeTitleView, "accessoryView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView convertPoint:toView:](navigationBar, "convertPoint:toView:", v10, x, y);
      objc_msgSend(v8, "_largeContentViewerItemAtPoint:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = v11;
          if ((objc_msgSend(v7, "isEnabled") & 1) != 0)
          {
LABEL_8:

            return v7;
          }

        }
      }
      v7 = 0;
      goto LABEL_8;
    }
  }
  return v7;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("backdropGroupName")))
  {
    UIKVCAccessProhibited((uint64_t)v4, (uint64_t)CFSTR("UINavigationBar"));

    return 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UINavigationBarVisualProviderModernIOS;
    -[_UINavigationBarVisualProviderModernIOS valueForUndefinedKey:](&v7, sel_valueForUndefinedKey_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("backdropGroupName")))
  {
    UIKVCAccessProhibited((uint64_t)v7, (uint64_t)CFSTR("UINavigationBar"));
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_UINavigationBarVisualProviderModernIOS;
    -[_UINavigationBarVisualProviderModernIOS setValue:forUndefinedKey:](&v8, sel_setValue_forUndefinedKey_, v6, v7);
  }

}

- (id)_immediatelyFinishRunningTransition
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UINavigationBarVisualProviderModernIOS;
  -[_UINavigationBarVisualProvider _immediatelyFinishRunningTransition](&v12, sel__immediatelyFinishRunningTransition);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_transitionContext)
  {
    +[UIView removePropertyAnimatorAnimationsInView:](UIView, "removePropertyAnimatorAnimationsInView:", self->super._navigationBar);
    -[_UINavigationBarTransitionContext prepareForInterruption](self->_transitionContext, "prepareForInterruption");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView _removeAllAnimations:](self->super._navigationBar, "_removeAllAnimations:", 1);
    -[UIView _removeAllRetargetableAnimations:](self->super._navigationBar, "_removeAllRetargetableAnimations:", 1);
    -[_UINavigationBarVisualProviderModernIOS _endTransitionCompleted:](self, "_endTransitionCompleted:", 1);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __78___UINavigationBarVisualProviderModernIOS__immediatelyFinishRunningTransition__block_invoke;
    v9[3] = &unk_1E16B6740;
    v10 = v4;
    v11 = v5;
    v6 = v5;
    v7 = _Block_copy(v9);

  }
  else
  {
    v7 = _Block_copy(v3);
  }

  return v7;
}

@end
