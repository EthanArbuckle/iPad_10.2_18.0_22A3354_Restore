@implementation UICollectionViewCell

uint64_t __50__UICollectionViewCell_setSelectedBackgroundView___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = 1.0;
  if ((*(_DWORD *)(v2 + 592) & 1) == 0)
    v3 = 0.0;
  objc_msgSend(*(id *)(v2 + 512), "setAlpha:", v3);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "setFrame:");
}

uint64_t __42__UICollectionViewCell_setBackgroundView___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setFrame:");
}

- (id)_bridgedConfigurationState
{
  id v1;
  id result;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[6];

  v1 = a1;
  result = objc_msgSend(v1, sel__configurationState);
  if (result)
  {
    v3 = result;
    static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(result, (uint64_t)v7);

    v4 = (void *)v7[0];
    v6 = (void *)v7[4];
    v5 = (void *)sub_1850F22DC();
    swift_bridgeObjectRelease();

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (UICellConfigurationState)_configurationState
{
  UICellConfigurationState *v3;
  void *v4;
  UICellConfigurationState *v5;
  uint64_t v6;
  _QWORD *v7;
  _BOOL8 v8;
  unint64_t v9;

  v3 = [UICellConfigurationState alloc];
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIViewConfigurationState initWithTraitCollection:](v3, "initWithTraitCollection:", v4);

  -[UIViewConfigurationState setDisabled:](v5, "setDisabled:", -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled") ^ 1);
  -[UIViewConfigurationState setHighlighted:](v5, "setHighlighted:", -[UICollectionViewCell isHighlighted](self, "isHighlighted"));
  -[UIViewConfigurationState setSelected:](v5, "setSelected:", -[UICollectionViewCell isSelected](self, "isSelected"));
  -[UIViewConfigurationState setFocused:](v5, "setFocused:", -[UICollectionViewCell isFocused](self, "isFocused"));
  -[UICellConfigurationState setEditing:](v5, "setEditing:", -[UICollectionViewCell isEditing](self, "isEditing"));
  -[UICellConfigurationState setSwiped:](v5, "setSwiped:", -[UICollectionViewCell _isSwiped](self, "_isSwiped"));
  -[UICellConfigurationState setReordering:](v5, "setReordering:", -[UICollectionViewCell _isReordering](self, "_isReordering"));
  -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (_QWORD *)v6;
  if (v6)
  {
    -[UIViewConfigurationState setPinned:](v5, "setPinned:", (*(unsigned __int16 *)(v6 + 288) >> 11) & 1);
    -[UIViewConfigurationState _setContextMenuGroupLocation:](v5, "_setContextMenuGroupLocation:", -[UICollectionViewCell _contextMenuGroupLocation](self, "_contextMenuGroupLocation"));
    -[UICellConfigurationState _setUsesAnyPlainListStyle:](v5, "_setUsesAnyPlainListStyle:", -[UICollectionViewCell _usesAnyPlainListStyle](self, "_usesAnyPlainListStyle"));
    v8 = v7[38] > 1uLL;
  }
  else
  {
    -[UIViewConfigurationState setPinned:](v5, "setPinned:", 0);
    -[UIViewConfigurationState _setContextMenuGroupLocation:](v5, "_setContextMenuGroupLocation:", -[UICollectionViewCell _contextMenuGroupLocation](self, "_contextMenuGroupLocation"));
    -[UICellConfigurationState _setUsesAnyPlainListStyle:](v5, "_setUsesAnyPlainListStyle:", -[UICollectionViewCell _usesAnyPlainListStyle](self, "_usesAnyPlainListStyle"));
    v8 = 0;
  }
  -[UICellConfigurationState _setInMultiSelectGroup:](v5, "_setInMultiSelectGroup:", v8);
  v9 = self->_dragAppearance - 1;
  if (v9 <= 2)
    -[UICellConfigurationState setCellDragState:](v5, "setCellDragState:", qword_186679F00[v9]);
  -[UICellConfigurationState setCellDropState:](v5, "setCellDropState:", -[UICollectionViewCell _dropState](self, "_dropState"));

  return v5;
}

- (BOOL)isSelected
{
  return *(_DWORD *)&self->_collectionCellFlags & 1;
}

- (BOOL)isHighlighted
{
  return (*(_BYTE *)&self->_collectionCellFlags >> 1) & 1;
}

- (BOOL)isEditing
{
  return (*(_BYTE *)&self->_collectionCellFlags >> 2) & 1;
}

- (void)_setLayoutAttributes:(id)a3
{
  id *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  _BOOL4 v9;
  int v10;
  _BOOL4 v11;
  int v12;
  int64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  BOOL v17;
  unsigned int v18;
  uint64_t v19;
  int64_t v20;
  int64_t v21;
  _UIBackgroundConfigurationInternal *lastNormalBackgroundViewConfiguration;
  int v23;
  unint64_t v24;
  void *v25;
  void *v26;
  objc_super v27;
  CGRect v28;

  v4 = (id *)a3;
  -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v7 = (*(unsigned __int16 *)(v5 + 288) >> 11) & 1;
    if (v4)
      goto LABEL_3;
LABEL_31:
    v8 = 0;
    if (v5)
      goto LABEL_4;
    goto LABEL_32;
  }
  v7 = 0;
  if (!v4)
    goto LABEL_31;
LABEL_3:
  v8 = (*((unsigned __int16 *)v4 + 144) >> 11) & 1;
  if (v5)
  {
LABEL_4:
    v9 = *(_QWORD *)(v5 + 304) > 1uLL;
    goto LABEL_5;
  }
LABEL_32:
  v9 = 0;
LABEL_5:
  v10 = v7 ^ v8;
  if (v4)
    v11 = (unint64_t)v4[38] > 1;
  else
    v11 = 0;
  v12 = v10 | v9 ^ v11;
  if (v12 == 1)
    -[UICollectionViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
  v13 = -[UICollectionReusableView _contentViewListStyleFromLayoutAttributes:](self, "_contentViewListStyleFromLayoutAttributes:", v6);
  v27.receiver = self;
  v27.super_class = (Class)UICollectionViewCell;
  -[UICollectionReusableView _setLayoutAttributes:](&v27, sel__setLayoutAttributes_, v4);
  -[UICollectionViewCell _restoreCurrentDragAppearanceIfNeeded](self, "_restoreCurrentDragAppearanceIfNeeded");
  -[UICollectionViewCell _updateUserInterfaceRenderingModeUsingAttributes:](self, "_updateUserInterfaceRenderingModeUsingAttributes:", v4);
  if (v12)
    -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  -[UICollectionViewLayoutAttributes _existingListAttributes](v4);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
  {
    v16 = *(_QWORD *)(v14 + 16);
    v17 = v16 > 4;
    v18 = (0x19u >> v16) & 1;
    if (v17)
      v19 = 0;
    else
      v19 = v18;
  }
  else
  {
    v19 = 0;
  }
  -[UICollectionViewCell _setUsesAnyPlainListStyle:](self, "_setUsesAnyPlainListStyle:", v19);
  v20 = -[UICollectionReusableView _contentViewListStyleFromLayoutAttributes:](self, "_contentViewListStyleFromLayoutAttributes:", v4);
  if (v13 == v20)
  {
    if ((*(_DWORD *)&self->_collectionCellFlags & 0x200) != 0)
      goto LABEL_26;
    goto LABEL_22;
  }
  v21 = v20;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIView _containingListStyleUpdated:](self->_contentView, "_containingListStyleUpdated:", v21);
  lastNormalBackgroundViewConfiguration = self->_lastNormalBackgroundViewConfiguration;
  self->_lastNormalBackgroundViewConfiguration = 0;

  v23 = *(_DWORD *)&self->_collectionCellFlags | 0x800000;
  self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)v23;
  if ((v23 & 0x200) == 0)
  {
LABEL_22:
    v24 = -[UICollectionViewCell _effectiveMaskedCornersForSystemBackgroundView](self, "_effectiveMaskedCornersForSystemBackgroundView");
    -[_UISystemBackgroundView configuration](self->_systemBackgroundView, "configuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25 && objc_msgSend(v25, "__maskedCorners") != v24)
      -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");

  }
LABEL_26:
  if (dyld_program_sdk_at_least())
  {
    -[UIView bounds](self->_contentView, "bounds");
    if (CGRectEqualToRect(v28, *MEMORY[0x1E0C9D648]))
      -[UICollectionViewCell _layoutContentView](self, "_layoutContentView");
  }

}

- (unint64_t)_effectiveMaskedCornersForSystemBackgroundView
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;

  -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes");
  v3 = objc_claimAutoreleasedReturnValue();
  -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4 && (*(_BYTE *)(v4 + 8) & 2) != 0)
    v6 = *(_QWORD *)(v4 + 24);
  else
    v6 = -[UICollectionViewCell _maskedCornersForSystemBackgroundView](self, "_maskedCornersForSystemBackgroundView");
  if (v3)
  {
    v7 = *(unsigned __int16 *)(v3 + 288);
    if ((v7 & 0x10) != 0)
      v6 |= (v7 >> 5) & 0xF;
  }

  return v6;
}

- (unint64_t)_maskedCornersForSystemBackgroundView
{
  unsigned __int16 *v2;
  unint64_t v3;
  unint64_t v4;

  -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes");
  v2 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2[144];
    if ((v3 & 0x10) != 0)
      v4 = (v3 >> 5) & 0xF;
    else
      v4 = 15;
  }
  else
  {
    v4 = 15;
  }

  return v4;
}

- (void)_setUsesAnyPlainListStyle:(BOOL)a3
{
  _BOOL4 v3;
  int v5;

  if (((((*((_BYTE *)&self->_collectionCellFlags + 1) & 1) == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    -[UICollectionViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
    if (v3)
      v5 = 256;
    else
      v5 = 0;
    self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFFFFFEFF | v5);
    -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (void)_updateUserInterfaceRenderingModeUsingAttributes:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  id *v6;

  v6 = (id *)a3;
  -[UICollectionViewLayoutAttributes _existingListAttributes](v6);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_5:
    v5 = 0;
    goto LABEL_7;
  }
  v5 = 0;
  if (v6 && v4[2] == 2)
  {
    if (((_WORD)v6[36] & 1) != 0)
    {
      v5 = -[UICollectionReusableView _isStyledAsHeaderOrFooterFromLayoutAttributes:](self, "_isStyledAsHeaderOrFooterFromLayoutAttributes:") ^ 1;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
LABEL_7:
  -[UIView _setOverrideUserInterfaceRenderingMode:](self, "_setOverrideUserInterfaceRenderingMode:", v5);

}

- (BOOL)_usesAnyPlainListStyle
{
  return *((_BYTE *)&self->_collectionCellFlags + 1) & 1;
}

- (BOOL)_isSwiped
{
  return (*(_BYTE *)&self->_collectionCellFlags >> 3) & 1;
}

- (BOOL)_isReordering
{
  return (*(_BYTE *)&self->_collectionCellFlags >> 4) & 1;
}

- (int64_t)_dropState
{
  return self->__dropState;
}

- (int64_t)_contextMenuGroupLocation
{
  return *(_DWORD *)&self->_collectionCellFlags >> 5;
}

- (void)setNeedsUpdateConfiguration
{
  if ((objc_msgSend((id)objc_opt_class(), "_isInternalCell") & 1) != 0 || dyld_program_sdk_at_least())
  {
    *(_DWORD *)&self->_collectionCellFlags |= 0x200u;
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      -[UICollectionViewCell _performConfigurationStateUpdate](self, "_performConfigurationStateUpdate");
    }
    else
    {
      -[UIView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

+ (BOOL)_isInternalCell
{
  return 0;
}

- (void)_applyBackgroundViewConfiguration:(id)a3 withState:(id)a4
{
  unint64_t v7;
  id v8;
  void *v9;
  _UISystemBackgroundView *systemBackgroundView;
  int v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double *v17;
  double v18;
  uint64_t v19;
  double v20;
  _UISystemBackgroundView *v21;
  _UISystemBackgroundView *v22;
  _UISystemBackgroundView *v23;
  uint64_t v24;
  void *v25;
  UICollectionViewCell *v26;
  UICollectionViewCell *v27;
  _UIBackgroundConfigurationInternal *v28;
  _UIBackgroundConfigurationInternal *lastNormalBackgroundViewConfiguration;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;

  v7 = (unint64_t)a3;
  v8 = a4;
  v9 = v8;
  systemBackgroundView = self->_systemBackgroundView;
  v11 = systemBackgroundView != 0;
  if (v7)
  {
    if ((*((_BYTE *)&self->_collectionCellFlags + 2) & 1) != 0 && !self->_backgroundViewConfigurationProvider)
    {
      if (!v8)
      {
        -[UICollectionViewCell configurationState](self, "configurationState");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionViewCell _stateForUpdatingBackgroundConfigurationWithState:](self, "_stateForUpdatingBackgroundConfigurationWithState:", v33);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend((id)v7, "_updatedConfigurationForState:", v9);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      if (!v36)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCell.m"), 1988, CFSTR("Updated configuration was nil for configuration: %@"), v7);

      }
      v12 = v36;
    }
    else
    {
      v12 = (id)v7;
    }
    v35 = v12;
    if (systemBackgroundView)
    {
      -[_UISystemBackgroundView configuration](self->_systemBackgroundView, "configuration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView tintColor](self, "tintColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v35, "_backgroundFillIsEqual:withTintColor:", v13, v14) ^ 1;

    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v35 = 0;
  }
  objc_msgSend(v35, "__setMaskedCorners:", -[UICollectionViewCell _effectiveMaskedCornersForSystemBackgroundView](self, "_effectiveMaskedCornersForSystemBackgroundView"));
  if (v7)
  {
    if (!-[UICollectionViewCell _appliesLayoutAttributesMaskingToBackgroundConfiguration](self, "_appliesLayoutAttributesMaskingToBackgroundConfiguration"))goto LABEL_19;
    -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
    {
      if ((*(_WORD *)(v15 + 288) & 0x10) != 0)
      {
        -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes");
        v17 = (double *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = v17[39];

          if (v18 <= 0.0)
            goto LABEL_19;
          -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes");
          v19 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v19;
          if (v19)
            v20 = *(double *)(v19 + 312);
          else
            v20 = 0.0;
          objc_msgSend(v35, "_setCornerRadius:", v20);
        }
      }
    }

LABEL_19:
    if (systemBackgroundView)
    {
      -[_UISystemBackgroundView setConfiguration:](self->_systemBackgroundView, "setConfiguration:", v35);
      -[UIView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[UICollectionViewCell _resetBackgroundViewsAndColor](self, "_resetBackgroundViewsAndColor");
      v22 = -[_UISystemBackgroundView initWithConfiguration:]([_UISystemBackgroundView alloc], "initWithConfiguration:", v35);
      v23 = self->_systemBackgroundView;
      self->_systemBackgroundView = v22;

      -[_UIFloatingContentView contentView](self->_focusedFloatingContentView, "contentView");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      if (v24)
        v26 = (UICollectionViewCell *)v24;
      else
        v26 = self;
      v27 = v26;

      -[UIView insertSubview:atIndex:](v27, "insertSubview:atIndex:", self->_systemBackgroundView, 0);
      -[UIView setNeedsLayout](self, "setNeedsLayout");

    }
    if (!-[UICollectionViewCell isHighlighted](self, "isHighlighted")
      && !-[UICollectionViewCell isSelected](self, "isSelected")
      && !-[UICollectionViewCell isFocused](self, "isFocused"))
    {
      v28 = (_UIBackgroundConfigurationInternal *)objc_msgSend(v35, "copyWithZone:", 0);
      lastNormalBackgroundViewConfiguration = self->_lastNormalBackgroundViewConfiguration;
      self->_lastNormalBackgroundViewConfiguration = v28;

    }
    goto LABEL_32;
  }
  if (systemBackgroundView)
  {
    -[UIView removeFromSuperview](self->_systemBackgroundView, "removeFromSuperview");
    v21 = self->_systemBackgroundView;
    self->_systemBackgroundView = 0;

  }
LABEL_32:
  if (v11)
  {
    -[UICollectionReusableView _collectionView](self, "_collectionView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_cellBackgroundChangedForSelectionOrHighlight:", self);

  }
  v31 = v7 | (unint64_t)systemBackgroundView;
  -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionReusableView _updateMaskingUsingAttributes:](self, "_updateMaskingUsingAttributes:", v32);

  if (v31)
  {
    *(_DWORD *)&self->_collectionCellFlags |= 0x1000000u;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (BOOL)_appliesLayoutAttributesMaskingToReusableView
{
  if (-[UICollectionViewCell _appliesLayoutAttributesMaskingToBackgroundConfiguration](self, "_appliesLayoutAttributesMaskingToBackgroundConfiguration"))
  {
    return !-[UICollectionViewCell _usingBackgroundViewConfiguration](self, "_usingBackgroundViewConfiguration");
  }
  else
  {
    return 1;
  }
}

- (BOOL)_appliesLayoutAttributesMaskingToBackgroundConfiguration
{
  BOOL v2;
  void *v4;

  if ((*(_DWORD *)&self->_collectionCellFlags & 0x10) == 0)
    return (*(_DWORD *)&self->_collectionCellFlags & 0xE0) != 0;
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "userInterfaceIdiom") != 6 || (*(_BYTE *)&self->_collectionCellFlags & 0xE0) != 0;

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags;
  int v6;
  int v7;
  objc_super v8;

  v4 = a3;
  if (v4)
    -[UICollectionViewCell _resetBackgroundViewConfiguration](self, "_resetBackgroundViewConfiguration");
  collectionCellFlags = self->_collectionCellFlags;
  v6 = (*(unsigned int *)&collectionCellFlags >> 11) & 1;
  if (v4)
    v6 = 1;
  if (v6)
    v7 = 2048;
  else
    v7 = 0;
  self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(v7 | *(_DWORD *)&collectionCellFlags & 0xFFFFF7FF);
  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewCell;
  -[UIView setBackgroundColor:](&v8, sel_setBackgroundColor_, v4);

}

- (void)_setBackgroundViewConfiguration:(id)a3
{
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags;
  int v4;
  int v5;

  collectionCellFlags = self->_collectionCellFlags;
  v4 = (*(unsigned int *)&collectionCellFlags >> 15) & 1;
  if (a3)
    v4 = 1;
  if (v4)
    v5 = 0x8000;
  else
    v5 = 0;
  self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(v5 | *(_DWORD *)&collectionCellFlags & 0xFFFF7FFF);
  -[UICollectionViewCell _applyBackgroundViewConfiguration:withState:](self, "_applyBackgroundViewConfiguration:withState:");
}

uint64_t __58__UICollectionViewCell__updateDefaultBackgroundAppearance__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundConfiguration:", *(_QWORD *)(a1 + 40));
}

uint64_t __53__UICollectionViewCell__resetBackgroundViewsAndColor__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", 0);
}

- (BOOL)_usingBackgroundViewConfiguration
{
  return self->_systemBackgroundView || self->_backgroundViewConfigurationProvider != 0;
}

- (BOOL)_backgroundIsVerticallyInset
{
  _UISystemBackgroundView *systemBackgroundView;
  double v4;
  double v5;

  if (self->_selectedBackgroundView)
  {
    LOBYTE(systemBackgroundView) = 0;
  }
  else
  {
    systemBackgroundView = self->_systemBackgroundView;
    if (systemBackgroundView)
    {
      -[_UISystemBackgroundView effectiveInsetsInContainerView:](systemBackgroundView, "effectiveInsetsInContainerView:", self);
      LOBYTE(systemBackgroundView) = v5 > 0.0 && v4 > 0.0;
    }
  }
  return (char)systemBackgroundView;
}

- (UICollectionViewCell)initWithFrame:(CGRect)a3
{
  UICollectionViewCell *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UICollectionViewCell;
  v3 = -[UICollectionReusableView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (!dyld_program_sdk_at_least()
      || objc_msgSend((id)objc_opt_class(), "_subclassOverridesContentViewClass"))
    {
      v4 = (void *)objc_opt_class();
      -[UIView bounds](v3, "bounds");
      objc_msgSend(v4, "_createDefaultContentViewWithFrame:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionViewCell setContentView:](v3, "setContentView:", v5);

    }
    *(_DWORD *)&v3->_collectionCellFlags |= 0x200u;
    *(_DWORD *)&v3->_collectionCellFlags |= 0x10000u;
    *(_DWORD *)&v3->_collectionCellFlags |= 0x20000u;
  }
  return v3;
}

+ (BOOL)_subclassOverridesContentViewClass
{
  uint64_t v3;
  BOOL v4;

  if (qword_1ECD78238 != -1)
    dispatch_once(&qword_1ECD78238, &__block_literal_global_111);
  v3 = objc_msgSend(a1, "methodForSelector:", sel__contentViewClass);
  if (v3)
    v4 = v3 == qword_1ECD78230;
  else
    v4 = 1;
  return !v4;
}

- (void)setContentView:(id)a3
{
  -[UICollectionViewCell _setContentView:addToHierarchy:](self, "_setContentView:addToHierarchy:", a3, 1);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  uint64_t v10;
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
  UIView *v24;
  double v25;
  double v26;
  char v27;
  UICollectionViewCell *contentView;
  UICollectionViewCell *v29;
  int v30;
  double v31;
  double v32;
  int v33;
  int has_internal_diagnostics;
  BOOL v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint8_t *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint8_t *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  unint64_t v58;
  NSObject *v59;
  double v60;
  double v61;
  objc_super v62;
  _QWORD block[5];
  _QWORD v64[5];
  uint8_t buf[4];
  UICollectionViewCell *v66;
  uint64_t v67;
  CGSize v68;
  CGSize result;
  CGRect v70;

  height = a3.height;
  width = a3.width;
  v67 = *MEMORY[0x1E0C80C00];
  v10 = MEMORY[0x1E0C809B0];
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __106__UICollectionViewCell_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke;
  v64[3] = &unk_1E16B1B28;
  v64[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v64);
  -[UICollectionViewCell _contentViewInset](self, "_contentViewInset");
  v12 = v11;
  v14 = v13;
  v61 = v15;
  v17 = v16;
  if ((*((_BYTE *)&self->_collectionCellFlags + 1) & 4) == 0
    || !-[UIView translatesAutoresizingMaskIntoConstraints](self->_contentView, "translatesAutoresizingMaskIntoConstraints"))
  {
    v27 = dyld_program_sdk_at_least();
    contentView = self;
    if ((v27 & 1) == 0)
      contentView = (UICollectionViewCell *)self->_contentView;
    v29 = contentView;
    if ((-[UIView _wantsAutolayoutOrIsGuardingForEngineHosting]((uint64_t)v29) & 1) != 0)
      v30 = 1;
    else
      v30 = objc_msgSend((id)objc_opt_class(), "requiresConstraintBasedLayout");
    if ((-[UIView _wantsAutolayoutOrIsGuardingForEngineHosting]((uint64_t)self->_contentView) & 1) != 0)
      v33 = 1;
    else
      v33 = objc_msgSend((id)objc_opt_class(), "requiresConstraintBasedLayout");
    if (v29 == self && v33)
    {
      if (!v30
        || (v29 = self,
            -[UIView translatesAutoresizingMaskIntoConstraints](self->_contentView, "translatesAutoresizingMaskIntoConstraints"))&& (!-[UIView needsUpdateConstraints](self, "needsUpdateConstraints")|| (v29 = self, dyld_program_sdk_at_least())&& (v29 = self, -[UIView _hostsLayoutEngine](self->_contentView, "_hostsLayoutEngine"))))
      {
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        v35 = -[UIView translatesAutoresizingMaskIntoConstraints](self->_contentView, "translatesAutoresizingMaskIntoConstraints");
        if (has_internal_diagnostics)
        {
          if (!v35)
          {
            __UIFaultDebugAssertLog();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v66 = self;
              _os_log_fault_impl(&dword_185066000, v57, OS_LOG_TYPE_FAULT, "contentView of collectionViewCell has translatesAutoresizingMaskIntoConstraints false and is missing constraints to the cell, which will cause substandard performance in cell autosizing. Please leave the contentView's translatesAutoresizingMaskIntoConstraints true or else provide constraints between the contentView and the cell. %@", buf, 0xCu);
            }

          }
        }
        else if (!v35)
        {
          v58 = qword_1ECD78250;
          if (!qword_1ECD78250)
          {
            v58 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v58, (unint64_t *)&qword_1ECD78250);
          }
          v59 = *(NSObject **)(v58 + 8);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v66 = self;
            _os_log_impl(&dword_185066000, v59, OS_LOG_TYPE_ERROR, "contentView of collectionViewCell has translatesAutoresizingMaskIntoConstraints false and is missing constraints to the cell, which will cause substandard performance in cell autosizing. Please leave the contentView's translatesAutoresizingMaskIntoConstraints true or else provide constraints between the contentView and the cell. %@", buf, 0xCu);
          }
        }
        if (-[UIView translatesAutoresizingMaskIntoConstraints](self->_contentView, "translatesAutoresizingMaskIntoConstraints"))
        {
          -[UIView _setHostsLayoutEngine:](self->_contentView, "_setHostsLayoutEngine:", 1);
        }
        v29 = self->_contentView;

      }
    }
    else if (!v30)
    {
      goto LABEL_47;
    }
    if (dyld_program_sdk_at_least())
    {
      self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFFEFFFFF | ((v29 == (UICollectionViewCell *)self->_contentView) << 20));
      if (!_UIEngineHostingViewsShouldGuardWantsAutolayoutFlagPropagation()
        || (-[UIView _usesLayoutEngineHostingConstraints]((uint64_t)v29) & 1) == 0)
      {
        -[UIView _setWantsAutolayout](v29, "_setWantsAutolayout");
      }
      buf[0] = 1;
      if ((dyld_program_sdk_at_least() & 1) == 0
        && (!dyld_program_sdk_at_least() || v14 == 0.0 && v12 == 0.0 && v17 == 0.0 && v61 == 0.0))
      {
        -[UIView frame](v29, "frame");
        v38 = CGRectGetWidth(v70);
      }
      else
      {
        v38 = width;
        if (v29 == (UICollectionViewCell *)self->_contentView)
        {
          *(float *)&v36 = a4;
          *(float *)&v37 = a5;
          -[UICollectionViewCell _contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:](self, "_contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:", 0, width, height, v36, v37);
          if (v39 == 0.0 && a5 == 50.0)
            v41 = buf;
          else
            v41 = 0;
          -[UIView _systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:](v29, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:", v41);
          v25 = v42 - (-v17 - v14);
          v26 = v43 - (-v61 - v12);
LABEL_61:
          if (v26 == 0.0 && !buf[0])
          {
            -[UICollectionViewCell sizeThatFits:](self, "sizeThatFits:", width, height);
            v25 = v50;
            v26 = v51;
            block[0] = v10;
            block[1] = 3221225472;
            block[2] = __106__UICollectionViewCell_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke_303;
            block[3] = &unk_1E16B1B28;
            block[4] = self;
            if (qword_1ECD78258 != -1)
              dispatch_once(&qword_1ECD78258, block);
          }
          goto LABEL_65;
        }
      }
      if (a5 == 50.0 && height == 0.0)
        v47 = buf;
      else
        v47 = 0;
      *(float *)&v36 = a4;
      *(float *)&v37 = a5;
      -[UIView _systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:](v29, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:", v47, v38, height, v36, v37);
      v25 = v48;
      v26 = v49;
      goto LABEL_61;
    }
LABEL_47:
    v62.receiver = self;
    v62.super_class = (Class)UICollectionViewCell;
    *(float *)&v31 = a4;
    *(float *)&v32 = a5;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v62, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v31, v32);
    v25 = v44;
    v26 = v45;
LABEL_65:

    goto LABEL_66;
  }
  v18 = width;
  v19 = v12;
  v60 = v18;
  -[UICollectionViewCell _contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:](self, "_contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:", 1);
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_contentView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
  v21 = v20;
  v23 = v22;
  v24 = self->_contentView;
  if (a4 != 1000.0 && v21 > 2777777.0 || a5 != 1000.0 && v23 > 2777777.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _UIContentViewAssertValidFittingSize(UIView * _Nonnull __strong, CGSize, UILayoutPriority, UILayoutPriority)");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v68.width = v21;
    v68.height = v23;
    NSStringFromCGSize(v68);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, CFSTR("_UIContentViewShared.h"), 66, CFSTR("Content view returned an invalid size %@ from -systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority: which is not allowed. If you have implemented a custom content view, you need to add constraints inside it so that its size is not ambiguous, or you need to manually compute and return a valid size. Content view: %@"), v56, v24);

  }
  if (a4 >= 1000.0)
    v25 = v60;
  else
    v25 = v21 - (-v17 - v14);
  if (a5 >= 1000.0)
    v26 = height;
  else
    v26 = v23 - (-v61 - v19);
LABEL_66:
  v52 = v25;
  v53 = v26;
  result.height = v53;
  result.width = v52;
  return result;
}

- (void)_layoutContentView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if (-[UIView translatesAutoresizingMaskIntoConstraints](self->_contentView, "translatesAutoresizingMaskIntoConstraints")|| (dyld_program_sdk_at_least() & 1) == 0)
  {
    -[UIView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UICollectionViewCell _contentViewInset](self, "_contentViewInset");
    -[UIView setFrame:](self->_contentView, "setFrame:", v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
  }
}

- (UIEdgeInsets)_contentViewInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)layoutSubviews
{
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewCell;
  -[UIView layoutSubviews](&v5, sel_layoutSubviews);
  -[UICollectionViewCell _performConfigurationStateUpdate](self, "_performConfigurationStateUpdate");
  -[UICollectionViewCell _layoutSystemBackgroundView](self, "_layoutSystemBackgroundView");
  -[UICollectionViewCell _layoutFocusedFloatingContentView](self, "_layoutFocusedFloatingContentView");
  if (dyld_program_sdk_at_least())
    -[UICollectionViewCell _layoutContentView](self, "_layoutContentView");
  collectionCellFlags = self->_collectionCellFlags;
  if ((*(_DWORD *)&collectionCellFlags & 0x1000000) != 0)
  {
    self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&collectionCellFlags & 0xFEFFFFFF);
    -[UIView _focusSystemSceneComponent](self, "_focusSystemSceneComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_requestFocusEffectUpdateToEnvironment:", self);

  }
}

- (void)_performConfigurationStateUpdate
{
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags;

  collectionCellFlags = self->_collectionCellFlags;
  if ((*(_WORD *)&collectionCellFlags & 0x200) != 0)
  {
    self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&collectionCellFlags & 0xFFFFFDFF);
    if (_UIObservationTrackingEnabled())
      -[UICollectionViewCell _updateConfigurationWithObservationTracking](self, "_updateConfigurationWithObservationTracking");
    else
      -[UICollectionViewCell _executeConfigurationUpdate](self);
  }
}

- (void)_layoutFocusedFloatingContentView
{
  -[UIView bounds](self, "bounds");
  -[_UIFloatingContentView setFrame:](self->_focusedFloatingContentView, "setFrame:");
}

- (void)_layoutSystemBackgroundView
{
  _UISystemBackgroundView *systemBackgroundView;

  systemBackgroundView = self->_systemBackgroundView;
  if (systemBackgroundView)
  {
    -[_UISystemBackgroundView frameInContainerView:](systemBackgroundView, "frameInContainerView:", self);
    -[_UISystemBackgroundView setFrame:](self->_systemBackgroundView, "setFrame:");
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      -[UIView layoutIfNeeded](self->_systemBackgroundView, "layoutIfNeeded");
    }
  }
}

- (UICollectionViewCellConfigurationUpdateHandler)configurationUpdateHandler
{
  return self->_configurationUpdateHandler;
}

- (unint64_t)_viewConfigurationState
{
  void *v2;
  unint64_t v3;

  -[UICollectionViewCell configurationState](self, "configurationState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_viewConfigurationState");

  return v3;
}

- (void)_updateContentViewConfigurationForState:(id)a3
{
  id v4;
  void (**contentViewConfigurationProvider)(id, unint64_t);
  void *v6;
  UICollectionViewCell *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  contentViewConfigurationProvider = (void (**)(id, unint64_t))self->_contentViewConfigurationProvider;
  if (!contentViewConfigurationProvider)
  {
    if ((*((_BYTE *)&self->_collectionCellFlags + 2) & 2) == 0)
      goto LABEL_4;
    v11 = v4;
    if (self->_viewForContentConfiguration)
    {
      -[UICollectionViewCell contentConfiguration](self, "contentConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
        goto LABEL_3;
      v7 = self;
      v8 = v6;
      v9 = v11;
      v10 = 0;
    }
    else
    {
      -[UICollectionViewCell _contentViewConfiguration](self, "_contentViewConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
        goto LABEL_3;
      v7 = self;
      v8 = v6;
      v9 = v11;
      v10 = 1;
    }
    -[UICollectionViewCell _applyContentViewConfiguration:withState:usingSPI:](v7, "_applyContentViewConfiguration:withState:usingSPI:", v8, v9, v10);
    goto LABEL_3;
  }
  v11 = v4;
  contentViewConfigurationProvider[2](contentViewConfigurationProvider, -[UICollectionViewCell _viewConfigurationState](self, "_viewConfigurationState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewCell _setContentViewConfiguration:](self, "_setContentViewConfiguration:", v6);
LABEL_3:

  v4 = v11;
LABEL_4:

}

- (void)_updateBackgroundViewConfigurationForState:(id)a3
{
  void *v4;
  void (**backgroundViewConfigurationProvider)(id, unint64_t);
  void *v6;
  id v7;

  -[UICollectionViewCell _stateForUpdatingBackgroundConfigurationWithState:](self, "_stateForUpdatingBackgroundConfigurationWithState:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  backgroundViewConfigurationProvider = (void (**)(id, unint64_t))self->_backgroundViewConfigurationProvider;
  if (backgroundViewConfigurationProvider)
  {
    v7 = v4;
    backgroundViewConfigurationProvider[2](backgroundViewConfigurationProvider, -[UICollectionViewCell _viewConfigurationState](self, "_viewConfigurationState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    -[UICollectionViewCell _applyBackgroundViewConfiguration:withState:](self, "_applyBackgroundViewConfiguration:withState:", v6, v7);
    goto LABEL_4;
  }
  if ((*((_BYTE *)&self->_collectionCellFlags + 2) & 1) == 0)
    goto LABEL_5;
  v7 = v4;
  -[_UISystemBackgroundView configuration](self->_systemBackgroundView, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_3;
LABEL_4:

  v4 = v7;
LABEL_5:

}

- (id)_stateForUpdatingBackgroundConfigurationWithState:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[UICollectionViewCell _removesHighlightedAndSelectedStatesForBackground](self, "_removesHighlightedAndSelectedStatesForBackground"))
  {
    v5 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend(v5, "setHighlighted:", 0);
    objc_msgSend(v5, "setSelected:", 0);
    v4 = v5;
  }
  return v4;
}

- (BOOL)_forwardsSystemLayoutFittingSizeToContentView:(id)a3
{
  UIView *v4;
  char IsGuardingForEngine;

  v4 = (UIView *)a3;
  if (((*((_BYTE *)&self->_collectionCellFlags + 2) & 0x10) != 0 || (dyld_program_sdk_at_least() & 1) == 0)
    && self->_contentView == v4)
  {
    IsGuardingForEngine = -[UIView _wantsAutolayoutOrIsGuardingForEngineHosting]((uint64_t)v4);
  }
  else
  {
    IsGuardingForEngine = 0;
  }

  return IsGuardingForEngine;
}

- (CGSize)_contentTargetSizeForTargetSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5 forUseWithSizeThatFits:(BOOL)a6
{
  double height;
  double width;
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
  unint64_t v21;
  NSObject *v22;
  unint64_t v23;
  NSObject *v24;
  double v25;
  double v26;
  double v27;
  uint8_t buf[4];
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  UICollectionViewCell *v36;
  uint64_t v37;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v37 = *MEMORY[0x1E0C80C00];
  -[UICollectionViewCell _contentViewInset](self, "_contentViewInset");
  v14 = v13;
  v16 = v15;
  v17 = width - (v11 + v12);
  v27 = height;
  v18 = height - (v13 + v15);
  if (v17 < 0.0)
  {
    v19 = v11;
    v17 = 0.0;
    if (a4 >= 1000.0)
    {
      v20 = v12;
      v21 = qword_1ECD78240;
      if (!qword_1ECD78240)
      {
        v21 = __UILogCategoryGetNode("CollectionView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v21, (unint64_t *)&qword_1ECD78240);
      }
      v22 = *(NSObject **)(v21 + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218754;
        v30 = v19;
        v31 = 2048;
        v32 = v20;
        v33 = 2048;
        v34 = width;
        v35 = 2112;
        v36 = self;
        _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "The cell's content view insets (left: %g, right: %g) exceed the cell's target width of %g with required fitting priority. Cell: %@", buf, 0x2Au);
      }
    }
  }
  if (v18 < 0.0)
  {
    v18 = 0.0;
    if (a5 >= 1000.0)
    {
      v23 = qword_1ECD78248;
      if (!qword_1ECD78248)
      {
        v23 = __UILogCategoryGetNode("CollectionView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v23, (unint64_t *)&qword_1ECD78248);
      }
      v24 = *(NSObject **)(v23 + 8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218754;
        v30 = v14;
        v31 = 2048;
        v32 = v16;
        v33 = 2048;
        v34 = v27;
        v35 = 2112;
        v36 = self;
        _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "The cell's content view insets (top: %g, bottom: %g) exceed the cell's target height of %g with required fitting priority. Cell: %@", buf, 0x2Au);
      }
    }
  }
  v25 = 1.79769313e308;
  if (a5 < 1000.0 && a6)
    v26 = 1.79769313e308;
  else
    v26 = v18;
  if (a4 >= 1000.0 || !a6)
    v25 = v17;
  result.height = v26;
  result.width = v25;
  return result;
}

- (BOOL)_removesHighlightedAndSelectedStatesForBackground
{
  return 0;
}

- (id)_contentViewConfiguration
{
  if ((*((_BYTE *)&self->_collectionCellFlags + 1) & 4) == 0 || self->_viewForContentConfiguration)
    return 0;
  -[UIView configuration](self->_contentView, "configuration");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIView)_existingContentView
{
  return self->_contentView;
}

- (void)_applyContentViewConfiguration:(id)a3 withState:(id)a4 usingSPI:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags;
  void *v13;
  void *viewForContentConfiguration;
  id v15;
  id v16;
  int v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  objc_class *v22;
  id v23;
  void *v24;
  objc_class *v25;
  void *contentView;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  const char *v33;
  id v34;
  void *v35;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  collectionCellFlags = self->_collectionCellFlags;
  if (v9)
  {
    if ((*(_DWORD *)&collectionCellFlags & 0x20000) != 0 && !self->_contentViewConfigurationProvider)
    {
      if (!v10)
      {
        -[UICollectionViewCell configurationState](self, "configurationState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v35 = v11;
      if (v5)
      {
        v19 = -[UICollectionViewCell _viewConfigurationState](self, "_viewConfigurationState");
        -[UIView traitCollection](self, "traitCollection");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "updatedConfigurationForState:traitCollection:", v19, v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v9, "updatedConfigurationForState:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCell.m"), 1055, CFSTR("Updated configuration was nil for configuration: %@"), v9);

      }
      v11 = v35;
    }
    else
    {
      v13 = v9;
    }
    v34 = v11;
    if ((*(_WORD *)&collectionCellFlags & 0x400) == 0)
    {
      *(_DWORD *)&self->_collectionCellFlags |= 0x400u;
      if (!v5)
      {
LABEL_43:
        objc_msgSend(v13, "makeContentView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&self->_viewForContentConfiguration, v27);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[_UIContentViewInternal _wrappedContentView](self->_viewForContentConfiguration, "_wrappedContentView");
          v29 = objc_claimAutoreleasedReturnValue();

          v27 = (void *)v29;
        }
        goto LABEL_45;
      }
      goto LABEL_39;
    }
    viewForContentConfiguration = self->_viewForContentConfiguration;
    if (!viewForContentConfiguration)
      viewForContentConfiguration = self->_contentView;
    v15 = v13;
    v16 = viewForContentConfiguration;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v17 = objc_msgSend(v16, "supportsConfiguration:", v15);
    }
    else
    {
      v33 = a2;
      objc_msgSend(v16, "configuration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v18;
      if (v16)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v16, "_wrappedConfigurationIdentifier");
        }
        else
        {
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }

      v23 = v15;
      if (v23)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v23, "_wrappedConfigurationIdentifier");
        }
        else
        {
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = 0;
      }

      v17 = objc_msgSend(v21, "isEqualToString:", v24);
      a2 = v33;
    }

    *(_DWORD *)&self->_collectionCellFlags |= 0x400u;
    if (!v17)
    {
      if (!v5)
      {
        -[_UIContentViewInternal configuration](self->_viewForContentConfiguration, "configuration");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        UIContentConfigurationAlertForReplacedContentView(CFSTR("cell"), self, v28, v15, CFSTR("Use separate registrations or reuse identifiers for different types of cells to avoid this."));

        goto LABEL_43;
      }
LABEL_39:
      objc_msgSend(v13, "createContentView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_45:
      if (!v27)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCell.m"), 1085, CFSTR("Content configuration returned a nil content view: %@"), v13);

      }
      if ((objc_msgSend(v27, "translatesAutoresizingMaskIntoConstraints") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCell.m"), 1086, CFSTR("The content view returned from the content configuration must have translatesAutoresizingMaskIntoConstraints enabled: %@"), v27);

      }
      -[UICollectionViewCell setContentView:](self, "setContentView:", v27);

      goto LABEL_50;
    }
    if (v5)
      contentView = self->_contentView;
    else
      contentView = self->_viewForContentConfiguration;
    objc_msgSend(contentView, "setConfiguration:", v15);
    v13 = v15;
LABEL_50:

    v11 = v34;
    goto LABEL_51;
  }
  self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&collectionCellFlags & 0xFFFFFBFF);
  if ((*(_WORD *)&collectionCellFlags & 0x400) != 0)
  {
    v34 = v10;
    -[UICollectionViewCell setContentView:](self, "setContentView:", 0);
    v13 = self->_viewForContentConfiguration;
    self->_viewForContentConfiguration = 0;
    goto LABEL_50;
  }
LABEL_51:

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
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
  objc_super v21;
  _QWORD v22[5];
  _QWORD v23[5];
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __37__UICollectionViewCell_sizeThatFits___block_invoke;
  v23[3] = &unk_1E16B1B28;
  v23[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v23);
  if ((*((_BYTE *)&self->_collectionCellFlags + 1) & 4) != 0)
  {
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __37__UICollectionViewCell_sizeThatFits___block_invoke_2;
    v22[3] = &unk_1E16B1B28;
    v22[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v22);
    if (width == 0.0)
      *(float *)&v9 = 50.0;
    else
      *(float *)&v9 = 1000.0;
    if (height == 0.0)
      *(float *)&v10 = 50.0;
    else
      *(float *)&v10 = 1000.0;
    -[UICollectionViewCell _contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:](self, "_contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:", 1, width, height, v9, v10);
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_contentView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
    v12 = v11;
    v14 = v13;
    -[UICollectionViewCell _contentViewInset](self, "_contentViewInset");
    width = v12 - (-v16 - v17);
    height = v14 - (-v15 - v18);
  }
  else if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    v21.receiver = self;
    v21.super_class = (Class)UICollectionViewCell;
    -[UIView sizeThatFits:](&v21, sel_sizeThatFits_, width, height);
    width = v7;
    height = v8;
  }
  v19 = width;
  v20 = height;
  result.height = v20;
  result.width = v19;
  return result;
}

- (id)contentConfiguration
{
  void *viewForContentConfiguration;

  if ((*((_BYTE *)&self->_collectionCellFlags + 1) & 4) == 0)
    return 0;
  viewForContentConfiguration = self->_viewForContentConfiguration;
  if (viewForContentConfiguration)
  {
    objc_msgSend(viewForContentConfiguration, "configuration");
    viewForContentConfiguration = (void *)objc_claimAutoreleasedReturnValue();
  }
  return viewForContentConfiguration;
}

- (BOOL)_usingContentViewConfiguration
{
  return (*((unsigned __int8 *)&self->_collectionCellFlags + 1) >> 2) & 1;
}

- (void)setContentConfiguration:(id)contentConfiguration
{
  -[UICollectionViewCell _applyContentViewConfiguration:withState:usingSPI:](self, "_applyContentViewConfiguration:withState:usingSPI:", contentConfiguration, 0, 0);
}

- (void)_resetBackgroundViewsAndColor
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__UICollectionViewCell__resetBackgroundViewsAndColor__block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v3);
  -[UICollectionViewCell setBackgroundView:](self, "setBackgroundView:", 0);
  -[UICollectionViewCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", 0);
}

- (void)setSelectedBackgroundView:(UIView *)selectedBackgroundView
{
  UIView *v5;
  UIView **p_selectedBackgroundView;
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  UICollectionViewCell *v12;
  UICollectionViewCell *v13;
  UIView *v14;
  UIView *v15;
  UIView *v16;
  _QWORD v17[5];

  v5 = selectedBackgroundView;
  p_selectedBackgroundView = &self->_selectedBackgroundView;
  if (self->_selectedBackgroundView != v5)
  {
    v15 = v5;
    if (v5)
    {
      -[UICollectionViewCell _resetBackgroundViewConfiguration](self, "_resetBackgroundViewConfiguration");
      v5 = v15;
    }
    collectionCellFlags = self->_collectionCellFlags;
    v8 = (*(unsigned int *)&collectionCellFlags >> 13) & 1;
    if (v5)
      v8 = 1;
    if (v8)
      v9 = 0x2000;
    else
      v9 = 0;
    self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(v9 | *(_DWORD *)&collectionCellFlags & 0xFFFFDFFF);
    -[UIView removeFromSuperview](*p_selectedBackgroundView, "removeFromSuperview", v15);
    objc_storeStrong((id *)&self->_selectedBackgroundView, selectedBackgroundView);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __50__UICollectionViewCell_setSelectedBackgroundView___block_invoke;
    v17[3] = &unk_1E16B1B28;
    v17[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v17);
    -[UIView setAutoresizingMask:](*p_selectedBackgroundView, "setAutoresizingMask:", 18);
    -[_UIFloatingContentView contentView](self->_focusedFloatingContentView, "contentView");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (UICollectionViewCell *)v10;
    else
      v12 = self;
    v13 = v12;

    v14 = *p_selectedBackgroundView;
    if (self->_backgroundView)
      -[UIView insertSubview:above:](v13, "insertSubview:above:", v14);
    else
      -[UIView insertSubview:atIndex:](v13, "insertSubview:atIndex:", v14);

    v5 = v16;
  }

}

- (void)setBackgroundView:(UIView *)backgroundView
{
  UIView *v5;
  UIView **p_backgroundView;
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  UICollectionViewCell *v12;
  UICollectionViewCell *v13;
  UIView *v14;
  UIView *v15;
  _QWORD v16[5];

  v5 = backgroundView;
  p_backgroundView = &self->_backgroundView;
  if (self->_backgroundView != v5)
  {
    v14 = v5;
    if (v5)
    {
      -[UICollectionViewCell _resetBackgroundViewConfiguration](self, "_resetBackgroundViewConfiguration");
      v5 = v14;
    }
    collectionCellFlags = self->_collectionCellFlags;
    v8 = (*(unsigned int *)&collectionCellFlags >> 12) & 1;
    if (v5)
      v8 = 1;
    if (v8)
      v9 = 4096;
    else
      v9 = 0;
    self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(v9 | *(_DWORD *)&collectionCellFlags & 0xFFFFEFFF);
    -[UIView removeFromSuperview](*p_backgroundView, "removeFromSuperview", v14);
    objc_storeStrong((id *)&self->_backgroundView, backgroundView);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __42__UICollectionViewCell_setBackgroundView___block_invoke;
    v16[3] = &unk_1E16B1B28;
    v16[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v16);
    -[UIView setAutoresizingMask:](*p_backgroundView, "setAutoresizingMask:", 18);
    -[_UIFloatingContentView contentView](self->_focusedFloatingContentView, "contentView");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (UICollectionViewCell *)v10;
    else
      v12 = self;
    v13 = v12;

    -[UIView insertSubview:atIndex:](v13, "insertSubview:atIndex:", v15, 0);
    v5 = v15;
  }

}

- (void)_resetBackgroundViewConfiguration
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__UICollectionViewCell__resetBackgroundViewConfiguration__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v2);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)_notifyIsDisplaying:(BOOL)a3
{
  _BOOL4 v3;
  __int16 reusableViewFlags;
  objc_super v6;

  v3 = a3;
  reusableViewFlags = (__int16)self->super._reusableViewFlags;
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewCell;
  -[UICollectionReusableView _notifyIsDisplaying:](&v6, sel__notifyIsDisplaying_);
  if (((((reusableViewFlags & 0x400) == 0) ^ v3) & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
    -[UIView _containerViewIsHiddenForReuse:](self->_contentView, "_containerViewIsHiddenForReuse:", !v3);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewCell;
  -[UIView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  if (!_UITraitUsageTrackingEnabled() || (dyld_program_sdk_at_least() & 1) == 0)
    -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)_setFocusStyle:(int64_t)a3
{
  self->_focusStyle = a3;
}

- (void)_updateDefaultBackgroundAppearance
{
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  collectionCellFlags = self->_collectionCellFlags;
  if ((*(_WORD *)&collectionCellFlags & 0xC000) == 0)
  {
    if ((*(_WORD *)&collectionCellFlags & 0x3800) != 0)
    {
      if ((*(_WORD *)&collectionCellFlags & 0x1000) == 0)
      {
        -[UICollectionViewCell _defaultBackgroundView](self, "_defaultBackgroundView");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionViewCell setBackgroundView:](self, "setBackgroundView:", v4);

        collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFFFFEFFF);
        self->_collectionCellFlags = collectionCellFlags;
      }
      if ((*(_WORD *)&collectionCellFlags & 0x2000) == 0)
      {
        -[UICollectionViewCell _defaultSelectedBackgroundView](self, "_defaultSelectedBackgroundView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionViewCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v5);

        *(_DWORD *)&self->_collectionCellFlags &= ~0x2000u;
      }
    }
    else
    {
      -[UICollectionViewCell _effectiveDefaultBackgroundConfiguration](self, "_effectiveDefaultBackgroundConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __58__UICollectionViewCell__updateDefaultBackgroundAppearance__block_invoke;
      v8[3] = &unk_1E16B1B50;
      v8[4] = self;
      v9 = v6;
      v7 = v6;
      +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v8);
      *(_DWORD *)&self->_collectionCellFlags &= ~0x8000u;

    }
  }
}

- (id)_effectiveDefaultBackgroundConfiguration
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (self->_contentView
    && (objc_opt_respondsToSelector() & 1) != 0
    && (-[UIView _containerBackgroundView](self->_contentView, "_containerBackgroundView"),
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCustomView:", v4);

  }
  else
  {
    -[UICollectionViewCell _defaultBackgroundConfiguration](self, "_defaultBackgroundConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (UIView)contentView
{
  void *v3;
  void *v4;

  if (!self->_contentView && dyld_program_sdk_at_least())
  {
    v3 = (void *)objc_opt_class();
    -[UIView bounds](self, "bounds");
    objc_msgSend(v3, "_createDefaultContentViewWithFrame:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCell _setContentView:addToHierarchy:](self, "_setContentView:addToHierarchy:", v4, 1);

  }
  return self->_contentView;
}

- (void)_setContentView:(id)a3 addToHierarchy:(BOOL)a4
{
  _BOOL4 v4;
  UIView **p_contentView;
  UIView *v8;
  UILongPressGestureRecognizer *menuGesture;
  uint64_t v10;
  void *v11;
  UICollectionViewCell *v12;
  UICollectionViewCell *v13;
  BOOL v14;
  uint64_t v15;
  UILongPressGestureRecognizer *v16;
  UILongPressGestureRecognizer *v17;
  UIView *v18;

  v4 = a4;
  p_contentView = &self->_contentView;
  v18 = (UIView *)a3;
  if (*p_contentView != v18)
  {
    if (v4)
    {
      -[UICollectionViewCell _clearChangeHandlersForOldContentView:](self, "_clearChangeHandlersForOldContentView:");
      if (*p_contentView)
      {
        *((_QWORD *)&(*p_contentView)->_viewFlags + 1) &= ~0x200uLL;
        v8 = *p_contentView;
      }
      else
      {
        v8 = 0;
      }
      -[UIView removeFromSuperview](v8, "removeFromSuperview");
      menuGesture = self->_menuGesture;
      self->_menuGesture = 0;

    }
    objc_storeStrong((id *)&self->_contentView, a3);
    -[UIView setSemanticContentAttribute:](v18, "setSemanticContentAttribute:", -[UIView semanticContentAttribute](self, "semanticContentAttribute"));
    if (v18 && v4)
    {
      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        -[UIView bounds](self, "bounds");
        -[UIView setFrame:](v18, "setFrame:");
        -[UIView setAutoresizingMask:](v18, "setAutoresizingMask:", 18);
      }
      -[_UIFloatingContentView contentView](self->_focusedFloatingContentView, "contentView");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        v12 = (UICollectionViewCell *)v10;
      else
        v12 = self;
      v13 = v12;

      -[UIView addSubview:](v13, "addSubview:", v18);
      v14 = (*(_QWORD *)&v18->_viewFlags & 0x20000000000000) == 0 && *(_WORD *)&self->super._reusableViewFlags < 0;
      v15 = 512;
      if (!v14)
        v15 = 0;
      *((_QWORD *)&v18->_viewFlags + 1) = v15 | *((_QWORD *)&v18->_viewFlags + 1) & 0xFFFFFFFFFFFFFDFFLL;
      -[UICollectionViewCell _setupChangeHandlersForNewContentView:](self, "_setupChangeHandlersForNewContentView:");
      if (objc_msgSend((id)objc_opt_class(), "_wantsLegacyMenuGesture"))
      {
        v16 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleMenuGesture_);
        v17 = self->_menuGesture;
        self->_menuGesture = v16;

        -[UIGestureRecognizer setDelegate:](self->_menuGesture, "setDelegate:", self);
        -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_menuGesture, "setMinimumPressDuration:", 0.5);
        -[UIView addGestureRecognizer:](v18, "addGestureRecognizer:", self->_menuGesture);
      }

    }
  }

}

+ (BOOL)_wantsLegacyMenuGesture
{
  return 1;
}

- (void)_setupChangeHandlersForNewContentView:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__UICollectionViewCell__setupChangeHandlersForNewContentView___block_invoke;
    v9[3] = &unk_1E16B3F40;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v4, "_setPopupMenuButtonDidChangeHandler:", v9);
    -[UICollectionViewCell _updatePopupMenuButtonFromContentView](self, "_updatePopupMenuButtonFromContentView");
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __62__UICollectionViewCell__setupChangeHandlersForNewContentView___block_invoke_2;
    v7[3] = &unk_1E16B3F40;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v4, "_setContainerBackgroundViewDidChangeHandler:", v7);
    if (-[UICollectionViewCell _usingBackgroundConfigurationOrDefaultBackgroundConfiguration](self, "_usingBackgroundConfigurationOrDefaultBackgroundConfiguration"))
    {
      -[UICollectionViewCell _updateDefaultBackgroundAppearance](self, "_updateDefaultBackgroundAppearance");
    }
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "_containerViewIsHiddenForReuse:", (*(_WORD *)&self->super._reusableViewFlags & 0x400) == 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UICollectionReusableView _contentViewListStyleFromLayoutAttributes:](self, "_contentViewListStyleFromLayoutAttributes:", v5);

    objc_msgSend(v4, "_containingListStyleUpdated:", v6);
  }

}

- (void)_clearChangeHandlersForOldContentView:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "_setPopupMenuButtonDidChangeHandler:", 0);
    -[UICollectionViewCell _setPopupMenuButton:](self, "_setPopupMenuButton:", 0);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "_setContainerBackgroundViewDidChangeHandler:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "_containerViewIsHiddenForReuse:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "_containingListStyleUpdated:", -1);

}

+ (id)_createDefaultContentViewWithFrame:(CGRect)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_contentViewClass")), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (dyld_program_sdk_at_least())
    objc_msgSend(v3, "_setHostsLayoutEngine:", 1);
  return v3;
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_usingBackgroundConfigurationOrDefaultBackgroundConfiguration
{
  if (-[UICollectionViewCell _usingBackgroundViewConfiguration](self, "_usingBackgroundViewConfiguration"))
    return 1;
  if ((*(_DWORD *)&self->_collectionCellFlags & 0xD800) != 0)
    return 0;
  return (*(_DWORD *)&self->_collectionCellFlags & 0x2000) == 0;
}

void __62__UICollectionViewCell__setupChangeHandlersForNewContentView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updatePopupMenuButtonFromContentView");

}

- (void)_updatePopupMenuButtonFromContentView
{
  id v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIView _popupMenuButton](self->_contentView, "_popupMenuButton");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCell _setPopupMenuButton:](self, "_setPopupMenuButton:", v3);

  }
}

- (void)_setPopupMenuButton:(id)a3
{
  UIButton *v6;
  UIButton **p_popupMenuButton;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  UIButton *v14;

  v6 = (UIButton *)a3;
  p_popupMenuButton = &self->__popupMenuButton;
  if (self->__popupMenuButton != v6)
  {
    v14 = v6;
    if (v6)
    {
      -[UIButton menu](v6, "menu");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCell.m"), 1849, CFSTR("Popup menu button must be configured with a menu: %@"), v14);

      }
      if (!-[UIControl showsMenuAsPrimaryAction](v14, "showsMenuAsPrimaryAction"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCell.m"), 1850, CFSTR("Popup menu button must have showsMenuAsPrimaryAction enabled: %@"), v14);

      }
      if (!-[UIButton changesSelectionAsPrimaryAction](v14, "changesSelectionAsPrimaryAction"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCell.m"), 1851, CFSTR("Popup menu button must have changesSelectionAsPrimaryAction enabled: %@"), v14);

      }
    }
    -[UIButton _setWantsAccessibilityUnderline:](*p_popupMenuButton, "_setWantsAccessibilityUnderline:", 1);
    -[UIView setUserInteractionEnabled:](*p_popupMenuButton, "setUserInteractionEnabled:", 1);
    objc_storeStrong((id *)&self->__popupMenuButton, a3);
    -[UIButton _setWantsAccessibilityUnderline:](*p_popupMenuButton, "_setWantsAccessibilityUnderline:", 0);
    -[UIView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    v6 = v14;
    if (v10 != 5)
    {
      -[UIView setUserInteractionEnabled:](v14, "setUserInteractionEnabled:", 0);
      v6 = v14;
    }
  }

}

- (id)_defaultBackgroundConfiguration
{
  return 0;
}

- (UIBackgroundConfiguration)backgroundConfiguration
{
  void *v2;
  void *v3;
  UIBackgroundConfiguration *v4;

  -[_UISystemBackgroundView configuration](self->_systemBackgroundView, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

uint64_t __57__UICollectionViewCell__resetBackgroundViewConfiguration__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundConfiguration:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_setBackgroundViewConfigurationProvider:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_setBackgroundViewConfiguration:", 0);
}

- (void)setBackgroundConfiguration:(UIBackgroundConfiguration *)backgroundConfiguration
{
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags;
  int v4;
  int v5;

  collectionCellFlags = self->_collectionCellFlags;
  v4 = (*(unsigned int *)&collectionCellFlags >> 15) & 1;
  if (backgroundConfiguration)
    v4 = 1;
  if (v4)
    v5 = 0x8000;
  else
    v5 = 0;
  self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(v5 | *(_DWORD *)&collectionCellFlags & 0xFFFF7FFF);
  -[UICollectionViewCell _applyBackgroundViewConfiguration:withState:](self, "_applyBackgroundViewConfiguration:withState:");
}

- (void)_setBackgroundViewConfigurationProvider:(id)a3
{
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags;
  int v4;
  int v5;
  unsigned int v6;
  id v8;
  void *v9;
  id backgroundViewConfigurationProvider;

  collectionCellFlags = self->_collectionCellFlags;
  v4 = (*(unsigned int *)&collectionCellFlags >> 14) & 1;
  if (a3)
    v4 = 1;
  if (v4)
    v5 = 0x4000;
  else
    v5 = 0;
  v6 = v5 | *(_DWORD *)&collectionCellFlags & 0xFFFFBFFF;
  self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)v6;
  if (self->_backgroundViewConfigurationProvider != a3)
  {
    if (a3)
      self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(v6 & 0xFFFEFFFF);
    v8 = a3;
    v9 = (void *)objc_msgSend(v8, "copy");
    backgroundViewConfigurationProvider = self->_backgroundViewConfigurationProvider;
    self->_backgroundViewConfigurationProvider = v9;

    -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (void)_setAutomaticIntrinsicContentSizeInvalidationEnabled:(BOOL)a3
{
  UIView *contentView;
  $1DC6EB69857CC9E7E7608875A7943F0A *p_viewFlags;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewCell;
  -[UICollectionReusableView _setAutomaticIntrinsicContentSizeInvalidationEnabled:](&v8, sel__setAutomaticIntrinsicContentSizeInvalidationEnabled_);
  contentView = self->_contentView;
  if (contentView)
  {
    p_viewFlags = &contentView->_viewFlags;
    v7 = 512;
    if (!a3 || (*(_QWORD *)p_viewFlags & 0x20000000000000) != 0)
      v7 = 0;
    *((_QWORD *)p_viewFlags + 1) = v7 | *((_QWORD *)p_viewFlags + 1) & 0xFFFFFFFFFFFFFDFFLL;
  }
}

- (void)_prepareForConfigurationStateUpdate
{
  _QWORD v3[5];

  if ((*(_DWORD *)&self->_collectionCellFlags & 0x2000200) == 0x200)
  {
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __59__UICollectionViewCell__prepareForConfigurationStateUpdate__block_invoke;
      v3[3] = &unk_1E16B1B28;
      v3[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
    }
  }
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  UIView *v4;
  UIView *contentView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewCell;
  v4 = (UIView *)a3;
  -[UIView _intrinsicContentSizeInvalidatedForChildView:](&v6, sel__intrinsicContentSizeInvalidatedForChildView_, v4);
  contentView = self->_contentView;

  if (contentView == v4)
    -[UICollectionReusableView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize", v6.receiver, v6.super_class);
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  objc_super v6;

  v3 = a3;
  v5 = -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled");
  if (v5 != v3)
    -[UICollectionViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewCell;
  -[UIView setUserInteractionEnabled:](&v6, sel_setUserInteractionEnabled_, v3);
  if (v5 != -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
    -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)_setAllowsStateUpdatesWhenEvaluatingBackgroundAppearance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFFBFFFFF | v3);
}

- (void)prepareForReuse
{
  void *v3;
  _UIBackgroundConfigurationInternal *lastNormalBackgroundViewConfiguration;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewCell;
  -[UICollectionReusableView prepareForReuse](&v5, sel_prepareForReuse);
  -[UICollectionViewCell setHighlighted:](self, "setHighlighted:", 0);
  -[UICollectionViewCell setSelected:](self, "setSelected:", 0);
  -[UICollectionViewCell _setContextMenuGroupLocation:](self, "_setContextMenuGroupLocation:", 0);
  -[UICollectionViewCell _setUsesAnyPlainListStyle:](self, "_setUsesAnyPlainListStyle:", 0);
  -[UICollectionViewCell _setSwiped:](self, "_setSwiped:", 0);
  -[UICollectionViewCell _setReordering:](self, "_setReordering:", 0);
  -[UICollectionViewCell _setDragAppearance:](self, "_setDragAppearance:", 0);
  -[UICollectionViewCell _setDropState:](self, "_setDropState:", 0);
  if (dyld_program_sdk_at_least())
  {
    -[UIView _removeAllAnimations:](self, "_removeAllAnimations:", 1);
  }
  else
  {
    -[UIView layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAllAnimations");

  }
  lastNormalBackgroundViewConfiguration = self->_lastNormalBackgroundViewConfiguration;
  self->_lastNormalBackgroundViewConfiguration = 0;

  -[UICollectionViewCell _updateHighlightColorsForView:highlight:](self, "_updateHighlightColorsForView:highlight:", self, (*(_DWORD *)&self->_collectionCellFlags >> 1) & 1);
  -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)_updateHighlightColorsForView:(id)a3 highlight:(BOOL)a4
{
  id v6;

  if (a4)
  {
    v6 = a3;
    -[UICollectionViewCell _setupHighlightingSupport](self, "_setupHighlightingSupport");
    objc_msgSend(self->_highlightingSupport, "highlightView:", v6);
  }
  else
  {
    objc_msgSend(self->_highlightingSupport, "applyState:toView:", 1, a3);
  }

  -[UICollectionViewCell _teardownHighlightingSupportIfReady](self, "_teardownHighlightingSupportIfReady");
}

- (UIView)selectedBackgroundView
{
  return self->_selectedBackgroundView;
}

- (BOOL)_shouldSaveOpaqueStateForView:(id)a3
{
  UIView *v4;
  BOOL v5;

  v4 = (UIView *)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) == 0 && self->_backgroundView != v4 && self->_selectedBackgroundView != v4;

  return v5;
}

- (void)_teardownHighlightingSupportIfReady
{
  id highlightingSupport;

  if ((*(_DWORD *)&self->_collectionCellFlags & 0x80003) == 0)
  {
    highlightingSupport = self->_highlightingSupport;
    self->_highlightingSupport = 0;

  }
}

- (void)_setSwiped:(BOOL)a3
{
  _BOOL4 v3;
  int v5;

  if (((((*(_BYTE *)&self->_collectionCellFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    -[UICollectionViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
    if (v3)
      v5 = 16777224;
    else
      v5 = 0x1000000;
    self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFFFFFFF7 | v5);
    -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (void)_setReordering:(BOOL)a3
{
  _BOOL4 v3;
  int v5;

  if (((((*(_BYTE *)&self->_collectionCellFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    -[UICollectionViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
    if (v3)
      v5 = 16;
    else
      v5 = 0;
    self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFFFFFFEF | v5);
    -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (void)_setDropState:(int64_t)a3
{
  if (self->__dropState != a3)
  {
    -[UICollectionViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
    self->__dropState = a3;
    -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (void)_setContextMenuGroupLocation:(int64_t)a3
{
  char v3;

  if (*(_DWORD *)&self->_collectionCellFlags >> 5 != a3)
  {
    v3 = a3;
    -[UICollectionViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
    self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFFFFFF1F | (32 * (v3 & 7)));
    -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (BOOL)_isUsingOldStyleMultiselection
{
  return 0;
}

- (void)setSelected:(BOOL)selected
{
  _BOOL4 v3;
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags;
  unsigned int v6;

  v3 = selected;
  collectionCellFlags = self->_collectionCellFlags;
  if (!selected)
  {
    v6 = ((*(_DWORD *)&self->_collectionCellFlags & 3) == 0) ^ ((*(_DWORD *)&self->_collectionCellFlags & 2u) >> 1);
    if ((*(_BYTE *)&collectionCellFlags & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  LOBYTE(v6) = (*(_DWORD *)&self->_collectionCellFlags & 3) != 0;
  self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&collectionCellFlags & 0xFFFBFFFF);
  if ((*(_BYTE *)&collectionCellFlags & 1) == 0)
  {
LABEL_5:
    -[UICollectionViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
    self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFFFFFFFE | v3 | 0x200000);
    -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
LABEL_6:
  if ((v6 & 1) == 0)
    -[UICollectionViewCell _updateBackgroundView](self, "_updateBackgroundView");
  -[UICollectionViewCell _updateFocusedFloatingContentControlStateAnimated:](self, "_updateFocusedFloatingContentControlStateAnimated:", +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"));
  if (-[UICollectionViewCell isFocused](self, "isFocused"))
  {
    if (+[UIFocusRingManager focusRingAvailable](UIFocusRingManager, "focusRingAvailable"))
      +[UIFocusRingManager _updateActiveFocusLayers](UIFocusRingManager, "_updateActiveFocusLayers");
  }
}

- (void)_updateFocusedFloatingContentControlStateInContext:(id)a3 withAnimationCoordinator:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  UICollectionViewCell *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  _UIFloatingContentView *focusedFloatingContentView;
  id v14;

  v5 = a5;
  v14 = a3;
  v8 = a4;
  if (-[UICollectionViewCell _canFocusProgrammatically](self, "_canFocusProgrammatically"))
    -[UICollectionViewCell _ensureFocusedFloatingContentView](self, "_ensureFocusedFloatingContentView");
  if (self->_focusedFloatingContentView)
  {
    if (v14)
    {
      objc_msgSend(v14, "nextFocusedView");
      v9 = (UICollectionViewCell *)objc_claimAutoreleasedReturnValue();
      v10 = v9 == self;

    }
    else
    {
      v10 = -[UICollectionViewCell isFocused](self, "isFocused");
    }
    if (v10)
      v11 = 8;
    else
      v11 = 0;
    if (-[UICollectionViewCell isSelected](self, "isSelected"))
      v11 |= 4uLL;
    v12 = v11 | -[UICollectionViewCell isHighlighted](self, "isHighlighted");
    focusedFloatingContentView = self->_focusedFloatingContentView;
    if (v8)
      -[_UIFloatingContentView setControlState:withAnimationCoordinator:](focusedFloatingContentView, "setControlState:withAnimationCoordinator:", v12, v8);
    else
      -[_UIFloatingContentView setControlState:animated:](focusedFloatingContentView, "setControlState:animated:", v12, v5);
  }

}

- (void)_updateFocusedFloatingContentControlStateAnimated:(BOOL)a3
{
  -[UICollectionViewCell _updateFocusedFloatingContentControlStateInContext:withAnimationCoordinator:animated:](self, "_updateFocusedFloatingContentControlStateInContext:withAnimationCoordinator:animated:", 0, 0, a3);
}

- (BOOL)_canFocusProgrammatically
{
  return 0;
}

- (void)_updateBackgroundView
{
  double v3;
  _BOOL8 v4;
  UIView *selectedBackgroundView;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;

  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateHighlightColorsForAnimationHalfwayPoint, 0);
  if ((*(_DWORD *)&self->_collectionCellFlags & 3) != 0)
    v3 = 1.0;
  else
    v3 = 0.0;
  v4 = -[UICollectionViewCell _descendantsShouldHighlight](self, "_descendantsShouldHighlight");
  if (v4)
    -[UICollectionViewCell _setupHighlightingSupport](self, "_setupHighlightingSupport");
  selectedBackgroundView = self->_selectedBackgroundView;
  if (selectedBackgroundView)
  {
    -[UIView setAlpha:](selectedBackgroundView, "setAlpha:", v3);
    -[UICollectionReusableView _collectionView](self, "_collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_cellBackgroundChangedForSelectionOrHighlight:", self);

  }
  if (+[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"))
  {
    +[UIView _currentAnimationAttributes](UIView, "_currentAnimationAttributes");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_delay");
    v8 = v7;
    objc_msgSend(v10, "_duration");
    -[UICollectionViewCell performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateHighlightColorsForAnimationHalfwayPoint, 0, (v8 + v9 * 0.5) * UIAnimationDragCoefficient());
    *(_DWORD *)&self->_collectionCellFlags |= 0x80000u;

  }
  else
  {
    -[UICollectionViewCell _updateHighlightColorsForView:highlight:](self, "_updateHighlightColorsForView:highlight:", self, v4);
    *(_DWORD *)&self->_collectionCellFlags &= ~0x80000u;
  }
}

- (void)_setupHighlightingSupport
{
  UICellHighlightingSupport *v3;
  id highlightingSupport;

  if (!self->_highlightingSupport)
  {
    v3 = -[UICellHighlightingSupport initWithCell:]([UICellHighlightingSupport alloc], "initWithCell:", self);
    highlightingSupport = self->_highlightingSupport;
    self->_highlightingSupport = v3;

    objc_msgSend(self->_highlightingSupport, "cacheState:forView:", 255, self);
  }
}

- (BOOL)_descendantsShouldHighlight
{
  _BOOL4 v3;

  if ((*(_BYTE *)&self->_collectionCellFlags & 2) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[UICollectionViewCell _highlightDescendantsWhenSelected](self, "_highlightDescendantsWhenSelected");
    if (v3)
      LOBYTE(v3) = *(_BYTE *)&self->_collectionCellFlags & 1;
  }
  return v3;
}

- (void)setHighlighted:(BOOL)highlighted
{
  _BOOL4 v3;
  _BOOL4 v5;
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags;
  int v7;
  _BOOL4 v8;
  unsigned int v9;
  int v10;

  v3 = highlighted;
  v5 = -[UICollectionViewCell _highlightDescendantsWhenSelected](self, "_highlightDescendantsWhenSelected");
  collectionCellFlags = self->_collectionCellFlags;
  v7 = *(_BYTE *)&collectionCellFlags & 1;
  if (v3)
    v7 = 1;
  v8 = v7 != ((*(_BYTE *)&collectionCellFlags & 3) != 0);
  if (v5)
    v9 = v8;
  else
    v9 = v3 ^ ((*(_DWORD *)&self->_collectionCellFlags & 2u) >> 1);
  if (((((*(_DWORD *)&self->_collectionCellFlags & 2) == 0) ^ v3) & 1) == 0)
  {
    -[UICollectionViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
    if (v3)
      v10 = 2097154;
    else
      v10 = 0x200000;
    self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFFFFFFFD | v10);
    -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
  if (v9)
    -[UICollectionViewCell _updateBackgroundView](self, "_updateBackgroundView");
  -[UICollectionViewCell _updateFocusedFloatingContentControlStateAnimated:](self, "_updateFocusedFloatingContentControlStateAnimated:", +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"));
}

- (BOOL)_highlightDescendantsWhenSelected
{
  return 1;
}

- (void)setAutomaticallyUpdatesContentConfiguration:(BOOL)automaticallyUpdatesContentConfiguration
{
  id contentViewConfigurationProvider;
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 *p_collectionCellFlags;
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags;

  if (automaticallyUpdatesContentConfiguration)
  {
    contentViewConfigurationProvider = self->_contentViewConfigurationProvider;
    p_collectionCellFlags = &self->_collectionCellFlags;
    collectionCellFlags = self->_collectionCellFlags;
    if ((contentViewConfigurationProvider == 0) != ((*(_DWORD *)&collectionCellFlags & 0x20000) == 0))
      return;
    if (!contentViewConfigurationProvider)
    {
      *p_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&collectionCellFlags | 0x20000);
      -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
      return;
    }
  }
  else
  {
    p_collectionCellFlags = &self->_collectionCellFlags;
    collectionCellFlags = self->_collectionCellFlags;
    if ((*(_DWORD *)&collectionCellFlags & 0x20000) == 0)
      return;
  }
  *p_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&collectionCellFlags & 0xFFFDFFFF);
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewCell;
  -[UIView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  -[UIView setSemanticContentAttribute:](self->_contentView, "setSemanticContentAttribute:", a3);
}

- (void)setEditing:(BOOL)a3
{
  _BOOL4 v3;
  int v5;

  if (((((*(_BYTE *)&self->_collectionCellFlags & 4) == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    -[UICollectionViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
    if (v3)
      v5 = 4;
    else
      v5 = 0;
    self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFFFFFFFB | v5);
    -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (BOOL)canBeEdited
{
  return dyld_program_sdk_at_least();
}

uint64_t __58__UICollectionViewCell__subclassOverridesContentViewClass__block_invoke()
{
  uint64_t result;

  result = +[UICollectionViewCell methodForSelector:](UICollectionViewCell, "methodForSelector:", sel__contentViewClass);
  qword_1ECD78230 = result;
  return result;
}

- (void)setConfigurationUpdateHandler:(UICollectionViewCellConfigurationUpdateHandler)configurationUpdateHandler
{
  void *v4;
  id v5;

  if (self->_configurationUpdateHandler != configurationUpdateHandler)
  {
    v4 = (void *)objc_msgSend(configurationUpdateHandler, "copy");
    v5 = self->_configurationUpdateHandler;
    self->_configurationUpdateHandler = v4;

    -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (UIBackgroundConfiguration)defaultBackgroundConfiguration
{
  return +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
}

- (void)setAutomaticallyUpdatesBackgroundConfiguration:(BOOL)automaticallyUpdatesBackgroundConfiguration
{
  id backgroundViewConfigurationProvider;
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 *p_collectionCellFlags;
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags;

  if (automaticallyUpdatesBackgroundConfiguration)
  {
    backgroundViewConfigurationProvider = self->_backgroundViewConfigurationProvider;
    p_collectionCellFlags = &self->_collectionCellFlags;
    collectionCellFlags = self->_collectionCellFlags;
    if ((backgroundViewConfigurationProvider == 0) != ((*(_DWORD *)&collectionCellFlags & 0x10000) == 0))
      return;
    if (!backgroundViewConfigurationProvider)
    {
      *p_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&collectionCellFlags | 0x10000);
      -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
      return;
    }
  }
  else
  {
    p_collectionCellFlags = &self->_collectionCellFlags;
    collectionCellFlags = self->_collectionCellFlags;
    if ((*(_DWORD *)&collectionCellFlags & 0x10000) == 0)
      return;
  }
  *p_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&collectionCellFlags & 0xFFFEFFFF);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__popupMenuButton, 0);
  objc_storeStrong((id *)&self->_focusedFloatingContentView, 0);
  objc_storeStrong((id *)&self->__editMenuInteraction, 0);
  objc_storeStrong(&self->_configurationUpdateHandler, 0);
  objc_storeStrong((id *)&self->_lastNormalBackgroundViewConfiguration, 0);
  objc_storeStrong(&self->_backgroundViewConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_systemBackgroundView, 0);
  objc_storeStrong(&self->_contentViewConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_viewForContentConfiguration, 0);
  objc_storeStrong(&self->_highlightingSupport, 0);
  objc_storeStrong(&self->_selectionSegueTemplate, 0);
  objc_storeStrong((id *)&self->_menuGesture, 0);
  objc_storeStrong((id *)&self->_selectedBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)_setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  _QWORD v7[5];
  char v8;

  v4 = a4;
  v5 = a3;
  if (_UICollectionViewCellContextMenuSuppressesSelectionState())
  {
    if ((*(_BYTE *)&self->_collectionCellFlags & 0xE0) != 0)
      v5 = 0;
    else
      v5 = v5;
  }
  if (v4)
  {
    -[UICollectionViewCell _selectionAnimationDuration](self, "_selectionAnimationDuration");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__UICollectionViewCell__setSelected_animated___block_invoke;
    v7[3] = &unk_1E16B1B78;
    v7[4] = self;
    v8 = v5;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v7, 0);
  }
  else
  {
    -[UICollectionViewCell setSelected:](self, "setSelected:", v5);
  }
}

- (void)_updateConfigurationWithObservationTracking
{
  UICollectionViewCell *v2;

  v2 = self;
  sub_1857299AC();

}

- (UICollectionViewCell)initWithCoder:(id)a3
{
  id v4;
  UICollectionViewCell *v5;
  void *v6;
  uint64_t v7;
  _UIContentViewInternal *viewForContentConfiguration;
  uint64_t v9;
  UIView *contentView;
  void *v11;
  void *v12;
  uint64_t v13;
  _UISystemBackgroundView *systemBackgroundView;
  _UISystemBackgroundView *v15;
  uint64_t v16;
  UIView *backgroundView;
  uint64_t v18;
  UIView *selectedBackgroundView;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UICollectionViewCell;
  v5 = -[UICollectionReusableView initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIContentConfigurationIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&v5->_collectionCellFlags & 0xFFFFFBFF | ((v6 != 0) << 10));

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIContentConfigurationView"));
    v7 = objc_claimAutoreleasedReturnValue();
    viewForContentConfiguration = v5->_viewForContentConfiguration;
    v5->_viewForContentConfiguration = (_UIContentViewInternal *)v7;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIContentView"));
    v9 = objc_claimAutoreleasedReturnValue();
    contentView = v5->_contentView;
    v5->_contentView = (UIView *)v9;

    if (v5->_contentView)
    {
      -[UIView addSubview:](v5, "addSubview:");
    }
    else if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      v11 = (void *)objc_opt_class();
      -[UIView bounds](v5, "bounds");
      objc_msgSend(v11, "_createDefaultContentViewWithFrame:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionViewCell setContentView:](v5, "setContentView:", v12);

    }
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UISystemBackgroundView"));
    v13 = objc_claimAutoreleasedReturnValue();
    systemBackgroundView = v5->_systemBackgroundView;
    v5->_systemBackgroundView = (_UISystemBackgroundView *)v13;

    v15 = v5->_systemBackgroundView;
    if (v15)
    {
      -[UIView insertSubview:atIndex:](v5, "insertSubview:atIndex:", v15, 0);
    }
    else
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIBackgroundView"));
      v16 = objc_claimAutoreleasedReturnValue();
      backgroundView = v5->_backgroundView;
      v5->_backgroundView = (UIView *)v16;

      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UISelectedBackgroundView"));
      v18 = objc_claimAutoreleasedReturnValue();
      selectedBackgroundView = v5->_selectedBackgroundView;
      v5->_selectedBackgroundView = (UIView *)v18;

    }
    *(_DWORD *)&v5->_collectionCellFlags |= 0x30200u;
  }

  return v5;
}

- (void)_setContentViewConfiguration:(id)a3
{
  -[UICollectionViewCell _applyContentViewConfiguration:withState:usingSPI:](self, "_applyContentViewConfiguration:withState:usingSPI:", a3, 0, 1);
}

- (BOOL)automaticallyUpdatesContentConfiguration
{
  return (*((unsigned __int8 *)&self->_collectionCellFlags + 2) >> 1) & 1;
}

- (void)_setContentViewConfigurationProvider:(id)a3
{
  void *v4;
  id contentViewConfigurationProvider;

  if (self->_contentViewConfigurationProvider != a3)
  {
    if (a3)
      *(_DWORD *)&self->_collectionCellFlags &= ~0x20000u;
    v4 = (void *)objc_msgSend(a3, "copy");
    contentViewConfigurationProvider = self->_contentViewConfigurationProvider;
    self->_contentViewConfigurationProvider = v4;

    -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (id)_contentViewConfigurationProvider
{
  return _Block_copy(self->_contentViewConfigurationProvider);
}

void __62__UICollectionViewCell__setupChangeHandlersForNewContentView___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateDefaultBackgroundAppearance");

}

- (id)_encodableSubviews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[_UIFloatingContentView contentView](self->_focusedFloatingContentView, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[UIView subviews](self, "subviews");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewCell;
  -[UIView _populateArchivedSubviews:](&v5, sel__populateArchivedSubviews_, v4);
  if (self->_systemBackgroundView)
    objc_msgSend(v4, "removeObject:");

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  UIView *contentView;
  UIView *backgroundView;
  UIView *selectedBackgroundView;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UICollectionViewCell;
  -[UICollectionReusableView encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_systemBackgroundView, CFSTR("UISystemBackgroundView"));
  if ((*((_BYTE *)&self->_collectionCellFlags + 1) & 4) != 0)
  {
    -[UICollectionViewCell contentConfiguration](self, "contentConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
    }
    else
    {
      -[UICollectionViewCell _contentViewConfiguration](self, "_contentViewConfiguration");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        v8 = 0;
LABEL_9:
        objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("UIContentConfigurationIdentifier"));

        goto LABEL_10;
      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "_wrappedConfigurationIdentifier");
    }
    else
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(v4, "encodeObject:forKey:", self->_viewForContentConfiguration, CFSTR("UIContentConfigurationView"));
  contentView = self->_contentView;
  if (contentView)
    objc_msgSend(v4, "encodeObject:forKey:", contentView, CFSTR("UIContentView"));
  backgroundView = self->_backgroundView;
  if (backgroundView)
    objc_msgSend(v4, "encodeObject:forKey:", backgroundView, CFSTR("UIBackgroundView"));
  selectedBackgroundView = self->_selectedBackgroundView;
  if (selectedBackgroundView)
    objc_msgSend(v4, "encodeObject:forKey:", selectedBackgroundView, CFSTR("UISelectedBackgroundView"));

}

- (void)_updateHighlightColorsForAnimationHalfwayPoint
{
  *(_DWORD *)&self->_collectionCellFlags &= ~0x80000u;
  -[UICollectionViewCell _updateHighlightColorsForView:highlight:](self, "_updateHighlightColorsForView:highlight:", self, -[UICollectionViewCell _descendantsShouldHighlight](self, "_descendantsShouldHighlight"));
}

- (void)_setOpaque:(BOOL)a3 forSubview:(id)a4
{
  _BOOL8 v4;
  _UISystemBackgroundView *v6;
  id highlightingSupport;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = (_UISystemBackgroundView *)a4;
  highlightingSupport = self->_highlightingSupport;
  if (v4)
  {
    objc_msgSend(highlightingSupport, "applyState:toView:", 255, v6);
  }
  else
  {
    objc_msgSend(highlightingSupport, "applyState:toView:", 1, v6);
    -[UIView setOpaque:](v6, "setOpaque:", 0);
    +[UIColor clearColor](UIColor, "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v8);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && (_UISystemBackgroundView *)self->_selectedBackgroundView != v6
    && self->_systemBackgroundView != v6)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[UIView subviews](v6, "subviews", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          -[UICollectionViewCell _setOpaque:forSubview:](self, "_setOpaque:forSubview:", v4, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)_monitoredView:(id)a3 willMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  id v7;

  v7 = a5;
  if (-[UIView containsView:](self, "containsView:", a4) && !-[UIView containsView:](self, "containsView:", v7))
    objc_msgSend(self->_highlightingSupport, "applyState:toView:", 255, self);

}

- (void)_monitoredView:(id)a3 didMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  id v8;
  UICollectionViewCell *v9;
  UICollectionViewCell *v10;
  BOOL v11;
  UICollectionViewCell *v12;
  _UISystemBackgroundView *v13;

  v13 = (_UISystemBackgroundView *)a3;
  v8 = a4;
  v9 = (UICollectionViewCell *)a5;
  v10 = v9;
  while (v10 != self && v10)
  {
    objc_opt_class();
    v11 = (objc_opt_isKindOfClass() & 1) != 0
       || (_UISystemBackgroundView *)self->_selectedBackgroundView == v13
       || self->_systemBackgroundView == v13;
    -[UIView superview](v10, "superview");
    v12 = (UICollectionViewCell *)objc_claimAutoreleasedReturnValue();

    v10 = v12;
    if (v11)
      goto LABEL_14;
  }
  if (!-[UIView containsView:](self, "containsView:", v8) && -[UIView containsView:](self, "containsView:", v9))
  {
    objc_msgSend(self->_highlightingSupport, "cacheState:forView:", 255, v13);
    -[UICollectionViewCell _updateHighlightColorsForView:highlight:](self, "_updateHighlightColorsForView:highlight:", v13, (*(_DWORD *)&self->_collectionCellFlags >> 1) & 1);
    -[UICollectionViewCell _setOpaque:forSubview:](self, "_setOpaque:forSubview:", 0, v13);
  }
  v12 = v10;
LABEL_14:

}

- (double)_selectionAnimationDuration
{
  return 0.3;
}

uint64_t __46__UICollectionViewCell__setSelected_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelected:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)isFocused
{
  objc_super v3;

  if ((*((_BYTE *)&self->_collectionCellFlags + 3) & 4) != 0)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewCell;
  return -[UIView isFocused](&v3, sel_isFocused);
}

- (BOOL)isDragging
{
  return (self->_dragAppearance & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)_isDropTarget
{
  return self->__dropState == 2;
}

- (void)_setDragAppearance:(unint64_t)a3
{
  double v5;
  double v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  _QWORD v13[5];

  if (self->_dragAppearance | a3)
  {
    self->_dragAppearance = a3;
    -[UICollectionViewLayoutAttributes alpha](self->super._layoutAttributes, "alpha");
    v6 = fmin(v5, 0.5);
    v7 = 2;
    if (a3 != 2)
    {
      v7 = a3 == 1;
      v6 = v5;
    }
    v8 = a3 == 3;
    if (a3 == 3)
      v9 = 2;
    else
      v9 = v7;
    if (v8)
      v10 = v5;
    else
      v10 = v6;
    v11 = v8;
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")&& ((v11 | !-[UICollectionReusableView _isHiddenForReordering](self, "_isHiddenForReordering")) & 1) == 0)
    {
      -[UIView alpha](self, "alpha");
      if (v12 > 0.0)
      {
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __43__UICollectionViewCell__setDragAppearance___block_invoke;
        v13[3] = &unk_1E16B1B28;
        v13[4] = self;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v13);
      }
    }
    -[UIView setAlpha:](self, "setAlpha:", v10);
    -[UICollectionReusableView _setHiddenForReordering:](self, "_setHiddenForReordering:", v11);
    -[UICollectionViewCell dragStateDidChange:](self, "dragStateDidChange:", v9);
  }
}

uint64_t __43__UICollectionViewCell__setDragAppearance___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (unint64_t)_dragAppearance
{
  return self->_dragAppearance;
}

- (void)_restoreCurrentDragAppearanceIfNeeded
{
  unint64_t dragAppearance;
  _QWORD v4[6];

  dragAppearance = self->_dragAppearance;
  if (dragAppearance)
  {
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __61__UICollectionViewCell__restoreCurrentDragAppearanceIfNeeded__block_invoke;
      v4[3] = &unk_1E16B1888;
      v4[4] = self;
      v4[5] = dragAppearance;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v4);
    }
    else
    {
      -[UICollectionViewCell _setDragAppearance:](self, "_setDragAppearance:", dragAppearance);
    }
  }
}

uint64_t __61__UICollectionViewCell__restoreCurrentDragAppearanceIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setDragAppearance:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_hasCustomSelectionAction
{
  void *v2;
  BOOL v3;

  -[UICollectionViewCell _effectivePopupMenuButton](self, "_effectivePopupMenuButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_performCustomSelectionAction
{
  void *v2;
  id v3;

  -[UICollectionViewCell _effectivePopupMenuButton](self, "_effectivePopupMenuButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "performPrimaryAction");
    v2 = v3;
  }

}

- (id)_effectivePopupMenuButton
{
  void *v3;
  UIButton *popupMenuButton;
  UIButton *v5;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") == 5)
    popupMenuButton = 0;
  else
    popupMenuButton = self->__popupMenuButton;
  v5 = popupMenuButton;

  return v5;
}

- (BOOL)_canPerformActionForKey:(id)a3
{
  return 0;
}

- (BOOL)_performActionForKey:(id)a3
{
  return 0;
}

- (void)_setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v6[5];
  BOOL v7;

  if (a4)
  {
    -[UICollectionViewCell _selectionAnimationDuration](self, "_selectionAnimationDuration");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__UICollectionViewCell__setHighlighted_animated___block_invoke;
    v6[3] = &unk_1E16B1B78;
    v6[4] = self;
    v7 = a3;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, 0);
  }
  else
  {
    -[UICollectionViewCell setHighlighted:](self, "setHighlighted:", a3);
  }
}

uint64_t __49__UICollectionViewCell__setHighlighted_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_performConfigurationStateModifications:(id)a3
{
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags;

  collectionCellFlags = self->_collectionCellFlags;
  self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&collectionCellFlags | 0x2000000);
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&self->_collectionCellFlags & 0xFDFFFFFF | (((*(unsigned int *)&collectionCellFlags >> 25) & 1) << 25));
}

- (BOOL)_backgroundFillIsCustomized
{
  UICollectionViewCell *v2;
  UIView *selectedBackgroundView;
  void *v4;
  void *v5;
  _UIBackgroundConfigurationInternal *lastNormalBackgroundViewConfiguration;
  void *v7;
  double v8;
  void *v10;
  _QWORD v11[5];

  v2 = self;
  selectedBackgroundView = self->_selectedBackgroundView;
  if (!selectedBackgroundView)
  {
    if (!-[UICollectionViewCell isHighlighted](v2, "isHighlighted")
      && !-[UICollectionViewCell isSelected](v2, "isSelected")
      && !-[UICollectionViewCell isFocused](v2, "isFocused"))
    {
      goto LABEL_3;
    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__UICollectionViewCell__backgroundFillIsCustomized__block_invoke;
    v11[3] = &unk_1E16B1B28;
    v11[4] = v2;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
    -[_UISystemBackgroundView configuration](v2->_systemBackgroundView, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "_hasBackgroundFill"))
    {
      lastNormalBackgroundViewConfiguration = v2->_lastNormalBackgroundViewConfiguration;
      if (!lastNormalBackgroundViewConfiguration)
      {
        if ((*((_BYTE *)&v2->_collectionCellFlags + 2) & 0xC0) != 0)
        {
          -[UICollectionViewCell _forcePopulateNormalStateConfiguration](v2, "_forcePopulateNormalStateConfiguration");
          -[_UISystemBackgroundView configuration](v2->_systemBackgroundView, "configuration");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v10)
          {
            LOBYTE(v2) = 0;
            v5 = 0;
            goto LABEL_13;
          }
          if (!objc_msgSend(v10, "_hasBackgroundFill"))
          {
            LOBYTE(v2) = 0;
            v5 = v10;
            goto LABEL_13;
          }
          lastNormalBackgroundViewConfiguration = v2->_lastNormalBackgroundViewConfiguration;
          v5 = v10;
        }
        else
        {
          lastNormalBackgroundViewConfiguration = 0;
        }
      }
      -[UIView tintColor](v2, "tintColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v2) = objc_msgSend(v5, "_backgroundFillIsEqual:withTintColor:", lastNormalBackgroundViewConfiguration, v7) ^ 1;

    }
    else
    {
      LOBYTE(v2) = 0;
    }
LABEL_13:

    return (char)v2;
  }
  if (!-[UIView isHidden](selectedBackgroundView, "isHidden"))
  {
    -[UIView alpha](v2->_selectedBackgroundView, "alpha");
    LOBYTE(v2) = v8 > 0.0;
    return (char)v2;
  }
LABEL_3:
  LOBYTE(v2) = 0;
  return (char)v2;
}

uint64_t __51__UICollectionViewCell__backgroundFillIsCustomized__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performConfigurationStateUpdate");
}

- (void)_forcePopulateNormalStateConfiguration
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__UICollectionViewCell__forcePopulateNormalStateConfiguration__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

uint64_t __62__UICollectionViewCell__forcePopulateNormalStateConfiguration__block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  _DWORD *v4;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 592) &= ~0x800000u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "isHighlighted");
  v3 = objc_msgSend(*(id *)(a1 + 32), "isSelected");
  objc_msgSend(*(id *)(a1 + 32), "isFocused");
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_setSelected:animated:", 0, 0);
  v4 = *(_DWORD **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v4, "_setHighlighted:animated:", 0, 0);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 592) |= 0x4000000u;
    objc_msgSend(*(id *)(a1 + 32), "_performConfigurationStateUpdate");
    objc_msgSend(*(id *)(a1 + 32), "_setHighlighted:animated:", 1, 0);
    if (!v3)
      goto LABEL_8;
    goto LABEL_7;
  }
  v4[148] |= 0x4000000u;
  objc_msgSend(*(id *)(a1 + 32), "_performConfigurationStateUpdate");
  if (v3)
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "_setSelected:animated:", 1, 0);
LABEL_8:
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 592) &= ~0x4000000u;
  return objc_msgSend(*(id *)(a1 + 32), "_performConfigurationStateUpdate");
}

- (BOOL)_allowsStateUpdatesWhenEvaluatingBackgroundAppearance
{
  return (*((unsigned __int8 *)&self->_collectionCellFlags + 2) >> 6) & 1;
}

- (id)_backgroundViewConfiguration
{
  void *v2;
  void *v3;
  id v4;

  -[_UISystemBackgroundView configuration](self->_systemBackgroundView, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_visiblePathForBackgroundConfiguration
{
  return -[_UISystemBackgroundView currentVisiblePathInContainerView:](self->_systemBackgroundView, "currentVisiblePathInContainerView:", self);
}

- (id)_systemBackgroundView
{
  return self->_systemBackgroundView;
}

- (BOOL)automaticallyUpdatesBackgroundConfiguration
{
  return *((_BYTE *)&self->_collectionCellFlags + 2) & 1;
}

- (id)_backgroundViewConfigurationProvider
{
  return _Block_copy(self->_backgroundViewConfigurationProvider);
}

- (id)_defaultBackgroundView
{
  return 0;
}

- (id)_defaultSelectedBackgroundView
{
  return 0;
}

uint64_t __59__UICollectionViewCell__prepareForConfigurationStateUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performConfigurationStateUpdate");
}

- (void)_executeConfigurationUpdate
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  char *v6;
  double v7;
  _BYTE v8[352];
  _BYTE __dst[352];
  _OWORD __src[22];

  if (a1)
  {
    v2 = (void *)_UISetCurrentFallbackEnvironment(a1);
    objc_msgSend(a1, "configurationState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    memset(__src, 0, sizeof(__src));
    _UIBeginTrackingTraitUsage(a1, 0, __src);
    objc_msgSend(a1, "_updateBackgroundViewConfigurationForState:", v3);
    objc_msgSend(a1, "_updateContentViewConfigurationForState:", v3);
    objc_msgSend(a1, "_updateConfigurationUsingState:", v3);
    objc_msgSend(a1, "_updateViewConfigurationsWithState:", objc_msgSend(a1, "_viewConfigurationState"));
    objc_msgSend(a1, "updateConfigurationUsingState:", v3);
    objc_msgSend(a1, "_bridgedUpdateConfigurationUsingState:", v3);
    objc_msgSend(a1, "configurationUpdateHandler");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      (*(void (**)(uint64_t, _DWORD *, void *))(v4 + 16))(v4, a1, v3);
    memcpy(v8, __src, sizeof(v8));
    v6 = (char *)GetTraitCollectionTSD() + 16;
    memcpy(__dst, v6, sizeof(__dst));
    memcpy(v6, v8, 0x160uLL);
    -[UIView _recordTraitUsage:insideMethod:withInvalidationAction:]((uint64_t *)a1, (uint64_t)&__dst[136], objc_msgSend(a1, "methodForSelector:", sel_updateConfigurationUsingState_), sel_setNeedsUpdateConfiguration);
    v7 = _UITraitUsageTrackingResultDestroy((uint64_t)__dst);
    a1[148] &= ~0x200000u;
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled", v7))
    {
      objc_msgSend(a1, "_layoutSystemBackgroundView");
    }
    _UIRestorePreviousFallbackEnvironment(v2);

  }
}

- (BOOL)_gestureRecognizerShouldBegin:(id)a3
{
  UICollectionViewCell *v4;
  id WeakRetained;

  if (self->_menuGesture != a3)
    return 1;
  v4 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._collectionView);
  LOBYTE(v4) = objc_msgSend(WeakRetained, "_shouldShowMenuForCell:", v4);

  return (char)v4;
}

- (void)_handleMenuGesture:(id)a3
{
  UIEditMenuInteraction *v4;
  UIEditMenuInteraction *editMenuInteraction;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  if (objc_msgSend(a3, "state") == 1)
  {
    if (!self->__editMenuInteraction)
    {
      v4 = -[UIEditMenuInteraction initWithDelegate:]([UIEditMenuInteraction alloc], "initWithDelegate:", self);
      editMenuInteraction = self->__editMenuInteraction;
      self->__editMenuInteraction = v4;

      -[UIView addInteraction:](self, "addInteraction:", self->__editMenuInteraction);
    }
    -[UIView center](self, "center");
    v7 = v6;
    v9 = v8;
    -[UIView superview](self, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v10, v7, v9);
    v12 = v11;
    v14 = v13;

    +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", 0, v12, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "set_firstResponderTarget:", self);
    -[UIEditMenuInteraction presentEditMenuWithConfiguration:](self->__editMenuInteraction, "presentEditMenuWithConfiguration:", v15);

  }
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v7 = a5;
  if (self->__editMenuInteraction == a3)
  {
    _UIMenuForUIMenuControllerMenuItems();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v7, "arrayByAddingObject:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v10;
    }
    +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  if (self->__editMenuInteraction == a3)
  {
    -[UIView bounds](self, "bounds");
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D628];
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  if (self->__editMenuInteraction == a3)
  {
    -[UICollectionViewCell _setSelected:animated:](self, "_setSelected:animated:", 1, 0, a5);
    *(_DWORD *)&self->_collectionCellFlags |= 0x40000u;
  }
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  UIEditMenuInteraction *v8;
  id v9;
  id v10;
  $92F999E4C202D2BA6E8CE0BB0C09C3F2 collectionCellFlags;
  id WeakRetained;
  UIEditMenuInteraction *editMenuInteraction;
  _QWORD v14[4];
  UIEditMenuInteraction *v15;

  v8 = (UIEditMenuInteraction *)a3;
  v9 = a4;
  v10 = a5;
  if (self->__editMenuInteraction == v8)
  {
    collectionCellFlags = self->_collectionCellFlags;
    if ((*(_DWORD *)&collectionCellFlags & 0x40000) != 0)
    {
      -[UICollectionViewCell _setSelected:animated:](self, "_setSelected:animated:", 0, 0);
      collectionCellFlags = self->_collectionCellFlags;
    }
    self->_collectionCellFlags = ($92F999E4C202D2BA6E8CE0BB0C09C3F2)(*(_DWORD *)&collectionCellFlags & 0xFFFBFFFF);
    WeakRetained = objc_loadWeakRetained((id *)&self->super._collectionView);
    objc_msgSend(WeakRetained, "_cellMenuDismissed");

    editMenuInteraction = self->__editMenuInteraction;
    self->__editMenuInteraction = 0;

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __85__UICollectionViewCell_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke;
    v14[3] = &unk_1E16B1B28;
    v15 = v8;
    objc_msgSend(v10, "addCompletion:", v14);

  }
}

void __85__UICollectionViewCell_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeInteraction:", *(_QWORD *)(a1 + 32));

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  id WeakRetained;
  unsigned __int8 v10;
  unsigned __int8 v11;
  objc_super v13;

  v6 = a4;
  if (!dyld_program_sdk_at_least())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._collectionView);
    if (!objc_msgSend(WeakRetained, "_canPerformAction:forCell:sender:", a3, self, v6))
    {
      v11 = 0;
      goto LABEL_15;
    }
    v10 = objc_opt_respondsToSelector();
LABEL_13:
    v11 = v10;
LABEL_15:

    goto LABEL_16;
  }
  if (sel_cut_ == a3 || sel_copy_ == a3 || sel_paste_ == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._collectionView);
    v10 = objc_msgSend(WeakRetained, "_canPerformAction:forCell:sender:", a3, self, v6);
    goto LABEL_13;
  }
  v13.receiver = self;
  v13.super_class = (Class)UICollectionViewCell;
  v11 = -[UIView canPerformAction:withSender:](&v13, sel_canPerformAction_withSender_, a3, v6);
LABEL_16:

  return v11 & 1;
}

- (void)_performAction:(SEL)a3 sender:(id)a4
{
  UICollectionView **p_collectionView;
  id v7;
  id WeakRetained;

  p_collectionView = &self->super._collectionView;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_collectionView);
  objc_msgSend(WeakRetained, "_performAction:forCell:sender:", a3, self, v7);

}

- (void)cut:(id)a3
{
  -[UICollectionViewCell _performAction:sender:](self, "_performAction:sender:", a2, a3);
}

- (void)copy:(id)a3
{
  -[UICollectionViewCell _performAction:sender:](self, "_performAction:sender:", a2, a3);
}

- (void)paste:(id)a3
{
  -[UICollectionViewCell _performAction:sender:](self, "_performAction:sender:", a2, a3);
}

- (void)_setSelectionSegueTemplate:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_selectionSegueTemplate != v5)
  {
    v6 = v5;
    objc_storeStrong(&self->_selectionSegueTemplate, a3);
    v5 = v6;
  }

}

- (id)_selectionSegueTemplate
{
  return objc_retainAutorelease(self->_selectionSegueTemplate);
}

uint64_t __106__UICollectionViewCell_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_performConfigurationStateUpdate");
  return objc_msgSend(*(id *)(a1 + 32), "_layoutContentView");
}

void __106__UICollectionViewCell_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke_303(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_CollectionViewCellContextMenuSuppressesSelectionState_block_invoke___s_category;
  if (!_UIInternalPreference_CollectionViewCellContextMenuSuppressesSelectionState_block_invoke___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_CollectionViewCellContextMenuSuppressesSelectionState_block_invoke___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Warning once only: Detected a case where constraints ambiguously suggest a size of zero for a collection view cell's content view. We're considering the collapse unintentional and using standard size instead. Cell: %@", (uint8_t *)&v5, 0xCu);
  }
}

uint64_t __37__UICollectionViewCell_sizeThatFits___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performConfigurationStateUpdate");
}

uint64_t __37__UICollectionViewCell_sizeThatFits___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutContentView");
}

- (void)_configureFocusedFloatingContentView:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setBackgroundColor:forState:", 0, 0);
  objc_msgSend(v3, "setBackgroundColor:forState:", 0, 8);
  objc_msgSend(v3, "setBackgroundColor:forState:", 0, 1);
  objc_msgSend(v3, "setBackgroundColor:forState:", 0, 4);
  objc_msgSend(v3, "setFocusedSizeIncrease:", 70.0);
  objc_msgSend(v3, "setContentMotionRotation:translation:", 0.2, 0.2, 12.0, 12.0);

}

- (BOOL)canBecomeFocused
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;

  -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UICollectionReusableView _isStyledAsHeaderOrFooterFromLayoutAttributes:](self, "_isStyledAsHeaderOrFooterFromLayoutAttributes:", v3);

  if (v4)
    v4 = !-[UICollectionReusableView _isFocusableWhenStyledAsHeader](self, "_isFocusableWhenStyledAsHeader");
  -[UICollectionViewCell _existingContentView](self, "_existingContentView");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      LODWORD(v5) = objc_msgSend(v6, "_preventFocus");
    else
      LODWORD(v5) = 0;
  }
  if (((v4 | v5) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[UICollectionReusableView _collectionView](self, "_collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "_cellCanBecomeFocused:", self);

  }
  return v7;
}

- (void)_willUpdateFocusInContext:(id)a3
{
  id v4;
  UICollectionViewCell *v5;
  UICollectionViewCell *v6;
  UICollectionViewCell *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewCell;
  -[UIView _willUpdateFocusInContext:](&v8, sel__willUpdateFocusInContext_, v4);
  objc_msgSend(v4, "previouslyFocusedView");
  v5 = (UICollectionViewCell *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

LABEL_5:
    -[UICollectionViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
    goto LABEL_6;
  }
  v6 = v5;
  objc_msgSend(v4, "nextFocusedView");
  v7 = (UICollectionViewCell *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
    goto LABEL_5;
LABEL_6:

}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v5;
  UICollectionViewCell *v6;
  void *v7;
  void *v8;
  UICollectionViewCell *v9;
  UICollectionViewCell *v10;
  UICollectionViewCell *v11;
  UICollectionViewCell *v12;
  void *v13;
  UICollectionViewCell *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v5 = a3;
  objc_msgSend(v5, "nextFocusedView");
  v6 = (UICollectionViewCell *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    -[UICollectionViewCell _ensureFocusedFloatingContentView](self, "_ensureFocusedFloatingContentView");
    if (self->_focusedFloatingContentView)
    {
      -[UIView superview](self, "superview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bringSubviewToFront:", self);

    }
  }
  +[_UIFocusAnimationCoordinatorManager animationCoordinatorForContext:](_UIFocusAnimationCoordinatorManager, "animationCoordinatorForContext:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCell.m"), 3128, CFSTR("Received call to _didUpdateFocusInContext: outside of a focus update."));

  }
  -[UICollectionViewCell _updateFocusedFloatingContentControlStateInContext:withAnimationCoordinator:animated:](self, "_updateFocusedFloatingContentControlStateInContext:withAnimationCoordinator:animated:", v5, v8, 1);
  objc_msgSend(v5, "previouslyFocusedView");
  v9 = (UICollectionViewCell *)objc_claimAutoreleasedReturnValue();
  if (v9 == self)
  {

  }
  else
  {
    v10 = v9;
    objc_msgSend(v5, "nextFocusedView");
    v11 = (UICollectionViewCell *)objc_claimAutoreleasedReturnValue();

    if (v11 != self)
      goto LABEL_11;
  }
  -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
LABEL_11:
  objc_msgSend(v5, "previouslyFocusedView");
  v12 = (UICollectionViewCell *)objc_claimAutoreleasedReturnValue();

  if (v12 == self)
  {
    -[UICollectionReusableView _collectionView](self, "_collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_cellDidBecomeUnfocused:", self);

  }
  objc_msgSend(v5, "nextFocusedView");
  v14 = (UICollectionViewCell *)objc_claimAutoreleasedReturnValue();

  if (v14 == self)
  {
    -[UICollectionReusableView _collectionView](self, "_collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_cellDidBecomeFocused:", self);

  }
  v17.receiver = self;
  v17.super_class = (Class)UICollectionViewCell;
  -[UIView _didUpdateFocusInContext:](&v17, sel__didUpdateFocusInContext_, v5);

}

- (int64_t)_systemDefaultFocusGroupPriority
{
  if (-[UICollectionViewCell isSelected](self, "isSelected"))
    return 2000;
  else
    return 0;
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  id v6;
  _UIFloatingContentView *focusedFloatingContentView;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  -[UICollectionViewCell _ensureFocusedFloatingContentView](self, "_ensureFocusedFloatingContentView");
  focusedFloatingContentView = self->_focusedFloatingContentView;
  if (focusedFloatingContentView)
  {
    -[_UIFloatingContentView _preferredConfigurationForFocusAnimation:inContext:](focusedFloatingContentView, "_preferredConfigurationForFocusAnimation:inContext:", a3, v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UICollectionViewCell;
    -[UIView _preferredConfigurationForFocusAnimation:inContext:](&v11, sel__preferredConfigurationForFocusAnimation_inContext_, a3, v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (BOOL)_allowsHorizontalFocusMovement
{
  id *v2;
  void *v3;
  BOOL v4;

  -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewLayoutAttributes _existingListAttributes](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (BOOL)_shouldForwardMovementToFocusEngine:(int64_t)a3
{
  _BOOL4 v5;
  objc_super v7;

  v5 = -[UICollectionViewCell _allowsHorizontalFocusMovement](self, "_allowsHorizontalFocusMovement");
  if (a3 != 1 || v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)UICollectionViewCell;
    LOBYTE(v5) = -[UIResponder _shouldForwardMovementToFocusEngine:](&v7, sel__shouldForwardMovementToFocusEngine_, a3);
  }
  return v5;
}

- (id)_defaultFocusOutline
{
  _UISystemBackgroundView *systemBackgroundView;
  void *v4;
  void *v5;
  uint64_t v6;

  systemBackgroundView = self->_systemBackgroundView;
  if (systemBackgroundView)
  {
    -[_UISystemBackgroundView outlinePathInContainerView:](systemBackgroundView, "outlinePathInContainerView:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cornerRadius");
    v6 = objc_msgSend(v5, "maskedCorners") & 0xF;
    -[UIView bounds](self, "bounds");
    +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_defaultFocusEffect
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  int v8;
  __objc2_class *v9;

  if (!-[UICollectionViewCell _isSwiped](self, "_isSwiped"))
  {
    if (self->_systemBackgroundView)
    {
      -[UICollectionViewCell _performConfigurationStateUpdate](self, "_performConfigurationStateUpdate");
      -[_UISystemBackgroundView configuration](self->_systemBackgroundView, "configuration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isTintBackgroundColor") & 1) != 0
        || (-[UIView traitCollection](self, "traitCollection"),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            v6 = objc_msgSend(v5, "userInterfaceIdiom"),
            v5,
            v6 <= 5)
        && ((1 << v6) & 0x23) != 0
        && -[UICollectionViewCell _backgroundFillIsCustomized](self, "_backgroundFillIsCustomized"))
      {
        v3 = 0;
LABEL_14:

        return v3;
      }

    }
    -[UICollectionReusableView _collectionView](self, "_collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_effectiveDefaultAllowsFocus");

    if (v8)
      v9 = UIFocusHaloEffect;
    else
      v9 = _UIFocusSystemHaloEffect;
    -[UICollectionViewCell _defaultFocusOutline](self, "_defaultFocusOutline");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[__objc2_class effectWithPath:](v9, "effectWithPath:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v3 = 0;
  return v3;
}

- (int64_t)focusItemDeferralMode
{
  void *v3;
  int64_t v4;

  -[UICollectionReusableView _collectionView](self, "_collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_cellFocusItemDeferral:", self);

  return v4;
}

- (UIEditMenuInteraction)_editMenuInteraction
{
  return self->__editMenuInteraction;
}

- (void)set_editMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->__editMenuInteraction, a3);
}

- (_UIFloatingContentView)_focusedFloatingContentView
{
  return self->_focusedFloatingContentView;
}

- (int64_t)_focusStyle
{
  return self->_focusStyle;
}

- (void)setDragging:(BOOL)a3
{
  self->_dragging = a3;
}

- (UIButton)_popupMenuButton
{
  return self->__popupMenuButton;
}

@end
