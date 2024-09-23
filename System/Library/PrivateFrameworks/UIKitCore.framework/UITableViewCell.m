@implementation UITableViewCell

- (void)_safeAreaInsetsDidChangeFromOldInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  objc_super v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[UIView safeAreaInsets](self, "safeAreaInsets");
  if (left != v9 || right != v8)
  {
    -[UITableViewCell _setNeedsSeparatorUpdate](self, "_setNeedsSeparatorUpdate");
    -[UITableViewCell _updateAccessoryMetrics](self, "_updateAccessoryMetrics");
  }
  v11.receiver = self;
  v11.super_class = (Class)UITableViewCell;
  -[UIView _safeAreaInsetsDidChangeFromOldInsets:](&v11, sel__safeAreaInsetsDidChangeFromOldInsets_, top, left, bottom, right);
}

- (void)didMoveToSuperview
{
  UITableViewCell *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  UITableViewCell *v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v2 = self;
  v30 = *MEMORY[0x1E0C80C00];
  if ((*((_WORD *)&self->_tableCellFlags + 6) & 2) == 0)
    objc_storeWeak((id *)&self->_tableView, 0);
  -[UIView superview](v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UITableViewCell _tableView](v2, "_tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (-[UITableViewCell _usesModernAccessoriesLayout](v2, "_usesModernAccessoriesLayout"))
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v16 = v2;
        -[UITableViewCell _accessoryManager](v2, "_accessoryManager");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "configurations");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "allValues");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v18)
        {
          v17 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v25 != v17)
                objc_enumerationMutation(v7);
              v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              v20 = 0u;
              v21 = 0u;
              v22 = 0u;
              v23 = 0u;
              objc_msgSend(v9, "trailingAccessories");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
              if (v11)
              {
                v12 = v11;
                v13 = *(_QWORD *)v21;
                do
                {
                  for (j = 0; j != v12; ++j)
                  {
                    if (*(_QWORD *)v21 != v13)
                      objc_enumerationMutation(v10);
                    objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "view");
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      objc_msgSend(v15, "addTarget:action:forControlEvents:", v4, sel__accessoryButtonAction_, 64);

                  }
                  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
                }
                while (v12);
              }

            }
            v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          }
          while (v18);
        }

        v2 = v16;
      }
      else
      {
        -[UIControl addTarget:action:forControlEvents:](v2->_accessoryView, "addTarget:action:forControlEvents:", v4, sel__accessoryButtonAction_, 64);
        -[UIControl addTarget:action:forControlEvents:](v2->_editingAccessoryView, "addTarget:action:forControlEvents:", v4, sel__accessoryButtonAction_, 64);
      }
    }
    -[UITableViewCell _updateContentClip](v2, "_updateContentClip");

  }
  v19.receiver = v2;
  v19.super_class = (Class)UITableViewCell;
  -[UIView didMoveToSuperview](&v19, sel_didMoveToSuperview);
}

+ (void)_initializeForIdiom:(int64_t)a3
{
  _QWORD v5[6];

  if ((dyld_program_sdk_at_least() & 1) == 0 && (id)objc_opt_class() == a1 && (a3 == 8 || a3 == 2))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __39__UITableViewCell__initializeForIdiom___block_invoke;
    v5[3] = &__block_descriptor_48_e5_v8__0l;
    v5[4] = a3;
    v5[5] = a1;
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v5);
  }
}

- (CGPoint)center
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGPoint result;

  v12.receiver = self;
  v12.super_class = (Class)UITableViewCell;
  -[UIView center](&v12, sel_center);
  v4 = v3;
  v6 = v5;
  -[UITableViewCell _swipeContainerView](self, "_swipeContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "center");
    v6 = v9;
  }

  v10 = v4;
  v11 = v6;
  result.y = v11;
  result.x = v10;
  return result;
}

- (UIEdgeInsets)_concreteDefaultLayoutMargins
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
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
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
  double v29;
  double v30;
  double v31;
  objc_super v32;
  UIEdgeInsets result;

  v32.receiver = self;
  v32.super_class = (Class)UITableViewCell;
  -[UIView _concreteDefaultLayoutMargins](&v32, sel__concreteDefaultLayoutMargins);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if (v12 == 6)
  {
    -[UITableViewCell _constants](self, "_constants");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell frame](self, "frame");
    objc_msgSend(v13, "defaultLayoutMarginsInsideSectionForSize:tableStyle:", *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x1FLL, v14, v15);
    v4 = v16;
    v6 = v17;
    v8 = v18;
    v10 = v19;
LABEL_5:

    goto LABEL_6;
  }
  if (-[UITableViewCell _usesRoundedGroups](self, "_usesRoundedGroups"))
  {
    -[UITableViewCell _constants](self, "_constants");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView window](self, "window");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "screen");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell frame](self, "frame");
    objc_msgSend(v13, "defaultTableLayoutMarginsForScreen:size:tableStyle:", v21, 2, v22, v23);
    v4 = v24;
    v6 = v25;
    v8 = v26;
    v10 = v27;

    goto LABEL_5;
  }
LABEL_6:
  v28 = v4;
  v29 = v6;
  v30 = v8;
  v31 = v10;
  result.right = v31;
  result.bottom = v30;
  result.left = v29;
  result.top = v28;
  return result;
}

- (CGRect)frame
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
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGRect result;

  v18.receiver = self;
  v18.super_class = (Class)UITableViewCell;
  -[UIView frame](&v18, sel_frame);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UITableViewCell _swipeContainerView](self, "_swipeContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "frame");
    v6 = v13;
  }

  v14 = v4;
  v15 = v6;
  v16 = v8;
  v17 = v10;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)_swipeContainerView
{
  id v2;
  void *v3;

  v2 = -[UITableViewCell _containerView](self, "_containerView");
  if (v2)
  {
    v3 = v2;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v3;
    else
      v2 = 0;
  }
  return v2;
}

- (id)_containerView
{
  id v2;
  void *v3;

  v2 = -[UIView superview](self, "superview");
  if (v2)
  {
    v3 = v2;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v3;
    else
      v2 = 0;
  }
  return v2;
}

- (BOOL)_usesRoundedGroups
{
  unint64_t v4;
  BOOL v5;
  uint64_t v6;
  BOOL v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UITableConstants shouldUseRoundedGroupsForTableViewStyle:backgroundInsets:](self->_constants, "shouldUseRoundedGroupsForTableViewStyle:backgroundInsets:", *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x1FLL, self->_backgroundInset.top, self->_backgroundInset.left, self->_backgroundInset.bottom, self->_backgroundInset.right);
  v4 = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x1FLL;
  v5 = v4 > 0x10;
  v6 = (1 << v4) & 0x10006;
  v7 = v5 || v6 == 0;
  return !v7 && self->_backgroundInset.left > 0.0 && self->_backgroundInset.right > 0.0;
}

- (id)_constants
{
  UITableConstants *constants;
  UITableConstants *v3;
  void *v4;

  constants = self->_constants;
  if (constants)
  {
    v3 = constants;
  }
  else
  {
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UITableConstantsForTraitCollection(v4);
    v3 = (UITableConstants *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_textLabel:(BOOL)a3
{
  UILabel *textLabel;
  BOOL v4;
  UILabel *v5;

  textLabel = self->_textLabel;
  if (textLabel)
    v4 = 1;
  else
    v4 = !a3;
  if (v4)
  {
    v5 = textLabel;
  }
  else
  {
    -[UITableViewCell _textLabel](self, "_textLabel", a3);
    v5 = (UILabel *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_imageView:(BOOL)a3
{
  UIImageView *imageView;
  BOOL v4;
  UIImageView *v5;

  imageView = self->_imageView;
  if (imageView)
    v4 = 1;
  else
    v4 = !a3;
  if (v4)
  {
    v5 = imageView;
  }
  else
  {
    -[UITableViewCell _imageView](self, "_imageView", a3);
    v5 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_detailTextLabel:(BOOL)a3
{
  UILabel *detailTextLabel;
  BOOL v4;
  UILabel *v5;

  detailTextLabel = self->_detailTextLabel;
  if (detailTextLabel)
    v4 = 1;
  else
    v4 = !a3;
  if (v4)
  {
    v5 = detailTextLabel;
  }
  else
  {
    -[UITableViewCell _detailTextLabel](self, "_detailTextLabel", a3);
    v5 = (UILabel *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)currentStateMask
{
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  unint64_t tableCellFlags;
  uint64_t v4;

  p_tableCellFlags = &self->_tableCellFlags;
  tableCellFlags = (unint64_t)self->_tableCellFlags;
  v4 = 2 * (tableCellFlags & 1);
  if ((tableCellFlags & 0x100) != 0)
    v4 = ((*(_QWORD *)((char *)p_tableCellFlags + 4) & 0x200) == 0) | (unint64_t)v4;
  return v4 & 0xFFFFFFFFBFFFFFFFLL | (((tableCellFlags >> 21) & 1) << 30);
}

- (int64_t)style
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 14) & 0xFFFLL;
}

- (UIFocusContainerGuide)_editingControlsFocusGuide
{
  return self->_editingControlsFocusGuide;
}

- (id)_badge:(BOOL)a3
{
  id badge;
  BOOL v4;
  id v5;

  badge = self->_badge;
  if (badge)
    v4 = 1;
  else
    v4 = !a3;
  if (v4)
  {
    v5 = badge;
  }
  else
  {
    -[UITableViewCell _badge](self, "_badge", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_setOverriddenDefaultContentViewLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  double trailing;
  double bottom;
  double leading;
  double top;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIView _setOverriddenDefaultLayoutMargins:](self->_contentView, "_setOverriddenDefaultLayoutMargins:", top, leading, bottom, trailing);
}

- (void)_updateBackgroundViewConfigurationForState:(id)a3
{
  void *v4;
  void (**backgroundViewConfigurationProvider)(id, unint64_t);
  void *v6;
  id v7;

  -[UITableViewCell _stateForUpdatingBackgroundConfigurationWithState:](self, "_stateForUpdatingBackgroundConfigurationWithState:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  backgroundViewConfigurationProvider = (void (**)(id, unint64_t))self->_backgroundViewConfigurationProvider;
  if (backgroundViewConfigurationProvider)
  {
    v7 = v4;
    backgroundViewConfigurationProvider[2](backgroundViewConfigurationProvider, -[UITableViewCell _viewConfigurationState](self, "_viewConfigurationState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    -[UITableViewCell _applyBackgroundViewConfiguration:withState:](self, "_applyBackgroundViewConfiguration:withState:", v6, v7);
    goto LABEL_4;
  }
  if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x8000) == 0)
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
  void *v6;
  void *v7;
  int v8;
  void *v10;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_tableCellFlags & 0x70) == 0)
  {
    v6 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend(v6, "setHighlighted:", 0);
    objc_msgSend(v6, "setSelected:", 0);
    v5 = v6;
  }
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "userInterfaceIdiom") == 3 && (v8 = (*(_DWORD *)&self->_tableCellFlags >> 4) & 7, v8 != 1))
  {

    if (v8 != 3)
    {
      v10 = (void *)objc_msgSend(v5, "copy");

      objc_msgSend(v10, "setFocused:", 0);
      v5 = v10;
    }
  }
  else
  {

  }
  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  int IsAccessibilityCategory;
  NSString *v8;
  int v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UITableViewCell;
  -[UIView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  if (!_UITraitUsageTrackingEnabled() || (dyld_program_sdk_at_least() & 1) == 0)
    -[UITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);
  objc_msgSend(v4, "preferredContentSizeCategory");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = UIContentSizeCategoryIsAccessibilityCategory(v8);

  if (IsAccessibilityCategory != v9)
  {
    -[UITableViewCell _setNeedsSeparatorUpdate](self, "_setNeedsSeparatorUpdate");
    -[UITableViewCell _updateAccessoryMetrics](self, "_updateAccessoryMetrics");
    -[UITableViewCell _setNeedsAccessoriesUpdateForced:](self, "_setNeedsAccessoriesUpdateForced:", 1);
  }
  -[UIView traitCollection](self, "traitCollection");

}

- (UICellConfigurationState)_configurationState
{
  UICellConfigurationState *v3;
  void *v4;
  UICellConfigurationState *v5;
  uint64_t v6;
  int64_t v7;

  v3 = [UICellConfigurationState alloc];
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIViewConfigurationState initWithTraitCollection:](v3, "initWithTraitCollection:", v4);

  -[UIViewConfigurationState setDisabled:](v5, "setDisabled:", -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled") ^ 1);
  -[UIViewConfigurationState setHighlighted:](v5, "setHighlighted:", -[UITableViewCell isHighlighted](self, "isHighlighted"));
  -[UIViewConfigurationState setSelected:](v5, "setSelected:", -[UITableViewCell isSelected](self, "isSelected"));
  -[UIViewConfigurationState setFocused:](v5, "setFocused:", -[UIView isFocused](self, "isFocused"));
  -[UICellConfigurationState setEditing:](v5, "setEditing:", -[UITableViewCell isEditing](self, "isEditing"));
  -[UICellConfigurationState setSwiped:](v5, "setSwiped:", -[UITableViewCell _isSwiped](self, "_isSwiped"));
  -[UICellConfigurationState setReordering:](v5, "setReordering:", -[UITableViewCell _isReordering](self, "_isReordering"));
  if (-[UITableViewCell _isShowingCompactContextMenu](self, "_isShowingCompactContextMenu"))
    v6 = 4;
  else
    v6 = 0;
  -[UIViewConfigurationState _setContextMenuGroupLocation:](v5, "_setContextMenuGroupLocation:", v6);
  -[UICellConfigurationState _setUsesAnyPlainListStyle:](v5, "_setUsesAnyPlainListStyle:", -[UITableViewCell tableViewStyle](self, "tableViewStyle") == 0);
  v7 = -[UITableViewCell _dragState](self, "_dragState");
  if ((unint64_t)(v7 - 1) <= 1)
    -[UICellConfigurationState setCellDragState:](v5, "setCellDragState:", v7);
  -[UICellConfigurationState setCellDropState:](v5, "setCellDropState:", -[UITableViewCell _dropState](self, "_dropState"));
  return v5;
}

- (BOOL)isEditing
{
  return *((_BYTE *)&self->_tableCellFlags + 1) & 1;
}

- (void)_updateContentClip
{
  void *v3;
  uint64_t v4;
  UITableConstants *constants;
  void *v6;
  uint64_t v7;
  UITableViewCell *v8;
  uint64_t v9;
  unint64_t v10;

  if (!-[UITableViewCell _isReordering](self, "_isReordering")
    || (-[UIView traitCollection](self, "traitCollection"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "userInterfaceIdiom"),
        v3,
        v4 != 6))
  {
    if (!-[UITableViewCell _usesRoundedGroups](self, "_usesRoundedGroups")
      || -[UITableViewCell _appliesMaskingToBackgroundConfiguration](self, "_appliesMaskingToBackgroundConfiguration")
      && -[UITableViewCell _usingBackgroundViewConfiguration](self, "_usingBackgroundViewConfiguration"))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        constants = self->_constants;
        -[UITableViewCell _tableView](self, "_tableView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[UITableConstants contentClipCornersForCell:inTableView:](constants, "contentClipCornersForCell:inTableView:", self, v6);

        v8 = self;
        v9 = v7;
LABEL_14:
        v10 = 1;
      }
      else
      {
        v10 = ((unint64_t)*((unsigned __int16 *)&self->_tableCellFlags + 6) >> 3) & 1;
        v8 = self;
        v9 = 0;
      }
      -[UITableViewCell _setContentClipCorners:updateCorners:](v8, "_setContentClipCorners:updateCorners:", v9, v10);
    }
    else
    {
      *((_WORD *)&self->_tableCellFlags + 6) |= 8u;
      switch(-[UITableViewCell sectionLocation](self, "sectionLocation"))
      {
        case 0:
        case 4:
          v8 = self;
          v9 = 15;
          goto LABEL_14;
        case 1:
          v8 = self;
          v9 = 0;
          goto LABEL_14;
        case 2:
          v8 = self;
          v9 = 3;
          goto LABEL_14;
        case 3:
          v8 = self;
          v9 = 12;
          goto LABEL_14;
        default:
          return;
      }
    }
  }
}

- (BOOL)_isReordering
{
  return (*((unsigned __int8 *)&self->_tableCellFlags + 1) >> 2) & 1;
}

- (int)sectionLocation
{
  return *((_BYTE *)&self->_tableCellFlags + 3) & 7;
}

- (BOOL)isSelected
{
  return *(_BYTE *)&self->_tableCellFlags >> 7;
}

- (BOOL)isHighlighted
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 10) & 1;
}

- (BOOL)_appliesMaskingToBackgroundConfiguration
{
  unsigned int tableCellFlags;
  _BOOL4 v3;

  tableCellFlags = self->_tableCellFlags;
  if ((tableCellFlags & 0x400) != 0 || (*((_WORD *)&self->_tableCellFlags + 6) & 0x10) != 0)
    LOBYTE(v3) = 1;
  else
    return (tableCellFlags >> 11) & 1;
  return v3;
}

- (int64_t)tableViewStyle
{
  return *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x1FLL;
}

- (BOOL)_isSwiped
{
  return (*((unsigned __int8 *)&self->_tableCellFlags + 1) >> 1) & 1;
}

- (BOOL)_isShowingCompactContextMenu
{
  return (*((unsigned __int8 *)&self->_tableCellFlags + 1) >> 3) & 1;
}

- (int64_t)_dropState
{
  return self->_dropState;
}

- (int64_t)_dragState
{
  return self->_dragState;
}

- (void)setConfigurationUpdateHandler:(UITableViewCellConfigurationUpdateHandler)configurationUpdateHandler
{
  void *v4;
  id v5;

  if (self->_configurationUpdateHandler != configurationUpdateHandler)
  {
    v4 = (void *)objc_msgSend(configurationUpdateHandler, "copy");
    v5 = self->_configurationUpdateHandler;
    self->_configurationUpdateHandler = v4;

    -[UITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UITableViewCell _performConfigurationStateUpdate](self, "_performConfigurationStateUpdate");
  if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x40) != 0)
  {
    objc_msgSend(self->_layoutManager, "contentRectForCell:forState:rowWidth:", self, -[UITableViewCell currentStateMask](self, "currentStateMask"), width);
    v12 = v11;
    -[UIView setFrame:](self->_contentView, "setFrame:");
    -[UITableViewCell _updateLeadingLayoutMarginForIndentation](self, "_updateLeadingLayoutMarginForIndentation");
    v15 = 1.79769313e308;
    if (width == 0.0)
      v16 = 1.79769313e308;
    else
      v16 = v12;
    if (height != 0.0)
      v15 = height;
    LODWORD(v13) = 1112014848;
    LODWORD(v14) = 1112014848;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_contentView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v16, v15, v13, v14);
    v7 = v17;
    v19 = v18;
    -[UITableViewCell _verticalPaddingForSeparator](self, "_verticalPaddingForSeparator");
    v9 = v19 + v20;
  }
  else
  {
    objc_msgSend(self->_layoutManager, "intrinsicContentSizeForCell:rowWidth:", self, width);
    v7 = v6;
    v9 = v8;
    if (v8 != 0.0 && dyld_program_sdk_at_least())
    {
      -[UITableViewCell _verticalPaddingForSeparator](self, "_verticalPaddingForSeparator");
      v9 = v9 - v10;
    }
  }
  v21 = v7;
  v22 = v9;
  result.height = v22;
  result.width = v21;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UIView *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  UIView *contentView;
  double v32;
  double v33;
  double v34;
  char *v36;
  double v37;
  double v38;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  objc_super v51;
  _QWORD block[5];
  char v53;
  CGSize v54;
  CGSize result;
  CGRect v56;

  height = a3.height;
  width = a3.width;
  -[UITableViewCell _performConfigurationStateUpdate](self, "_performConfigurationStateUpdate");
  objc_msgSend(self->_layoutManager, "contentRectForCell:forState:rowWidth:", self, -[UITableViewCell currentStateMask](self, "currentStateMask"), width);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[UIView setFrame:](self->_contentView, "setFrame:");
  -[UITableViewCell _updateLeadingLayoutMarginForIndentation](self, "_updateLeadingLayoutMarginForIndentation");
  if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x40) != 0
    && -[UIView translatesAutoresizingMaskIntoConstraints](self->_contentView, "translatesAutoresizingMaskIntoConstraints"))
  {
    if (a5 >= 1000.0)
      v20 = height;
    else
      v20 = 1.79769313e308;
    *(float *)&v18 = a4;
    *(float *)&v19 = a5;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_contentView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v15, v20, v18, v19);
    v22 = v21;
    v24 = v23;
    v25 = self->_contentView;
    if (a4 != 1000.0 && v22 > 2777777.0 || a5 != 1000.0 && v24 > 2777777.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _UIContentViewAssertValidFittingSize(UIView * _Nonnull __strong, CGSize, UILayoutPriority, UILayoutPriority)");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v54.width = v22;
      v54.height = v24;
      NSStringFromCGSize(v54);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, CFSTR("_UIContentViewShared.h"), 66, CFSTR("Content view returned an invalid size %@ from -systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority: which is not allowed. If you have implemented a custom content view, you need to add constraints inside it so that its size is not ambiguous, or you need to manually compute and return a valid size. Content view: %@"), v50, v25);

    }
    -[UITableViewCell _verticalPaddingForSeparator](self, "_verticalPaddingForSeparator");
    v27 = v24 + v26;
    if (a4 >= 1000.0)
      v28 = width;
    else
      v28 = v22;
    if (a5 < 1000.0)
      height = v27;
  }
  else if ((-[UIView _wantsAutolayoutOrIsGuardingForEngineHosting]((uint64_t)self->_contentView) & 1) != 0
         || objc_msgSend((id)objc_opt_class(), "requiresConstraintBasedLayout"))
  {
    if (!_UIEngineHostingViewsShouldGuardWantsAutolayoutFlagPropagation()
      || (-[UIView _usesLayoutEngineHostingConstraints]((uint64_t)self->_contentView) & 1) == 0)
    {
      -[UIView _setWantsAutolayout](self->_contentView, "_setWantsAutolayout");
    }
    v53 = 1;
    contentView = self->_contentView;
    v56.origin.x = v11;
    v56.origin.y = v13;
    v56.size.width = v15;
    v56.size.height = v17;
    v32 = CGRectGetWidth(v56);
    if (a5 == 50.0 && height == 0.0)
      v36 = &v53;
    else
      v36 = 0;
    *(float *)&v33 = a4;
    *(float *)&v34 = a5;
    -[UIView _systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:](contentView, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:", v36, v32, height, v33, v34);
    v28 = v38;
    if (v37 == 0.0 && v53 == 0)
    {
      -[UITableViewCell sizeThatFits:](self, "sizeThatFits:", width, height);
      height = v42;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __101__UITableViewCell_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = self;
      if (systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority__once != -1)
        dispatch_once(&systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority__once, block);
    }
    else
    {
      v40 = v37;
      -[UITableViewCell _verticalPaddingForSeparator](self, "_verticalPaddingForSeparator");
      height = v40 + v41;
    }
  }
  else
  {
    v51.receiver = self;
    v51.super_class = (Class)UITableViewCell;
    *(float *)&v29 = a4;
    *(float *)&v30 = a5;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v51, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v29, v30);
    v28 = v43;
    height = v44;
    if (v44 != 0.0 && dyld_program_sdk_at_least())
    {
      -[UITableViewCell _verticalPaddingForSeparator](self, "_verticalPaddingForSeparator");
      height = height + v45;
    }
  }
  v46 = v28;
  v47 = height;
  result.height = v47;
  result.width = v46;
  return result;
}

- (double)_verticalPaddingForSeparator
{
  double result;

  if ((*(_BYTE *)&self->_tableCellFlags & 0xE) == 0)
    return 0.0;
  -[UITableViewCell _separatorHeight](self, "_separatorHeight");
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  int v4;
  unsigned int v5;
  objc_super v6;

  -[UITableViewCell _restoreLabelTextAfterSystemTextSizeChangeIfNeeded](self, "_restoreLabelTextAfterSystemTextSizeChangeIfNeeded");
  -[UITableViewCell _layoutFloatingContentView](self, "_layoutFloatingContentView");
  -[UITableViewCell _performConfigurationStateUpdate](self, "_performConfigurationStateUpdate");
  -[UITableViewCell _layoutSystemBackgroundView:](self, "_layoutSystemBackgroundView:", 0);
  if (!-[UITableViewCell _skipsLayout](self, "_skipsLayout")
    && (*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x40000000000000) == 0)
  {
    -[UITableViewCell _updateAccessoriesIfNeeded](self, "_updateAccessoriesIfNeeded");
    -[UITableViewCell _updateLeadingLayoutMarginForIndentation](self, "_updateLeadingLayoutMarginForIndentation");
    -[UITableViewCell layoutManager](self, "layoutManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutSubviewsOfCell:", self);

  }
  -[UITableViewCell _updateSeparatorContent](self, "_updateSeparatorContent");
  v6.receiver = self;
  v6.super_class = (Class)UITableViewCell;
  -[UIView layoutSubviews](&v6, sel_layoutSubviews);
  v4 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
  if ((v4 & 0x20000) != 0)
  {
    v5 = v4 & 0xFFFDFFFF;
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
    *((_WORD *)&self->_tableCellFlags + 6) = v5;
    *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v5);
    if (-[UIView isFocused](self, "isFocused"))
    {
      if (+[UIFocusRingManager focusRingAvailable](UIFocusRingManager, "focusRingAvailable"))
        +[UIFocusRingManager _updateActiveFocusLayers](UIFocusRingManager, "_updateActiveFocusLayers");
    }
  }
}

- (void)_performConfigurationStateUpdate
{
  int v2;
  unsigned int v4;

  v2 = *((unsigned __int16 *)&self->_tableCellFlags + 6);
  if ((v2 & 0x20) != 0)
  {
    v4 = v2 & 0xFFFFFFDF | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
    *((_WORD *)&self->_tableCellFlags + 6) = v4;
    *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v4);
    if (_UIObservationTrackingEnabled())
      -[UITableViewCell _updateConfigurationWithObservationTracking](self, "_updateConfigurationWithObservationTracking");
    else
      -[UITableViewCell _executeConfigurationUpdate](self);
  }
}

- (void)_updateSeparatorContent
{
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  _UITableViewCellSeparatorView *separatorView;
  _UITableViewCellSeparatorView *v6;
  _UITableViewCellSeparatorView *v7;
  _UITableViewCellSeparatorView *v8;
  _UITableViewCellSeparatorView *v9;
  _UITableViewCellSeparatorView *topSeparatorView;
  _UITableViewCellSeparatorView *v11;
  _UITableViewCellSeparatorView *v12;
  uint64_t v13;
  int v14;

  p_tableCellFlags = &self->_tableCellFlags;
  if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x800) == 0)
    return;
  separatorView = self->_separatorView;
  if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x3000) == 0x1000
    || (*(_DWORD *)p_tableCellFlags & 0xE) == 0)
  {
    -[UIView removeFromSuperview](self->_separatorView, "removeFromSuperview");
    v6 = self->_separatorView;
    self->_separatorView = 0;

  }
  else
  {
    -[UITableViewCell _separatorFrame](self, "_separatorFrame");
    if (separatorView)
    {
      -[UIView setFrame:](self->_separatorView, "setFrame:");
    }
    else
    {
      -[UITableViewCell _addSeparatorWithFrame:](self, "_addSeparatorWithFrame:");
      v8 = (_UITableViewCellSeparatorView *)objc_claimAutoreleasedReturnValue();
      v9 = self->_separatorView;
      self->_separatorView = v8;

    }
    -[UITableViewCell _updateSeparatorViewAlpha](self, "_updateSeparatorViewAlpha");
    if ((*(_QWORD *)((char *)p_tableCellFlags + 4) & 0x40000000000) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        -[UIView setBackgroundColor:](self->_separatorView, "setBackgroundColor:", self->_separatorColor);
    }
    if ((*((_BYTE *)p_tableCellFlags + 2) & 0x40) != 0
      || -[UITableViewCell _showSeparatorAtTopOfSection](self, "_showSeparatorAtTopOfSection"))
    {
      topSeparatorView = self->_topSeparatorView;
      -[UITableViewCell _topSeparatorFrame](self, "_topSeparatorFrame");
      if (topSeparatorView)
      {
        -[UIView setFrame:](self->_topSeparatorView, "setFrame:");
      }
      else
      {
        -[UITableViewCell _addSeparatorWithFrame:](self, "_addSeparatorWithFrame:");
        v11 = (_UITableViewCellSeparatorView *)objc_claimAutoreleasedReturnValue();
        v12 = self->_topSeparatorView;
        self->_topSeparatorView = v11;

      }
      -[UITableViewCell _updateTopSeparatorViewAlpha](self, "_updateTopSeparatorViewAlpha");
      if ((*(_QWORD *)((char *)p_tableCellFlags + 4) & 0x40000000000) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          -[UIView setBackgroundColor:](self->_topSeparatorView, "setBackgroundColor:", self->_separatorColor);
      }
      goto LABEL_23;
    }
  }
  -[UIView removeFromSuperview](self->_topSeparatorView, "removeFromSuperview");
  v7 = self->_topSeparatorView;
  self->_topSeparatorView = 0;

LABEL_23:
  v13 = *(_QWORD *)((char *)p_tableCellFlags + 4);
  if ((v13 & 0x3000) == 0x1000)
  {
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
    v14 = *((unsigned __int16 *)p_tableCellFlags + 6) | (*((unsigned __int8 *)p_tableCellFlags + 14) << 16);
    v13 = *(_QWORD *)((char *)p_tableCellFlags + 4);
  }
  else
  {
    v14 = *((unsigned __int16 *)p_tableCellFlags + 6) | (*((unsigned __int8 *)p_tableCellFlags + 14) << 16);
  }
  *(_QWORD *)((char *)p_tableCellFlags + 4) = v13 & 0xFFFFFFFFFFFFF7FFLL;
  *((_WORD *)p_tableCellFlags + 6) = v14;
  *((_BYTE *)p_tableCellFlags + 14) = BYTE2(v14);
}

- (void)_updateLeadingLayoutMarginForIndentation
{
  double extraLeadingLayoutMarginForIndentation;
  double v4;

  if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x40) != 0)
  {
    extraLeadingLayoutMarginForIndentation = self->_extraLeadingLayoutMarginForIndentation;
    objc_msgSend(self->_layoutManager, "contentIndentationForCell:", self);
    self->_extraLeadingLayoutMarginForIndentation = v4;
    if (v4 - extraLeadingLayoutMarginForIndentation != 0.0)
      -[UITableViewCell _applyLeadingLayoutMarginAdjustment:](self, "_applyLeadingLayoutMarginAdjustment:");
  }
}

- (UICellAccessoryManager)_accessoryManager
{
  return self->_accessoryManager;
}

- (void)_updateAccessoriesIfNeeded
{
  if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x800000000000000) != 0)
    -[UITableViewCell _updateAccessories](self, "_updateAccessories");
}

- (BOOL)_skipsLayout
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 52) & 1;
}

- (void)_restoreLabelTextAfterSystemTextSizeChangeIfNeeded
{
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  uint64_t v4;
  __int16 v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char *v16;
  __int16 v17;
  char v18;

  p_tableCellFlags = &self->_tableCellFlags;
  v4 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  if ((v4 & 0x4000000000000000) == 0)
  {
    v5 = *((_WORD *)&self->_tableCellFlags + 6);
    if ((v4 & 0x8000000000000000) == 0)
      goto LABEL_10;
    goto LABEL_7;
  }
  -[UILabel attributedText](self->_textLabel, "attributedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_getAssociatedObject(self, &unk_1ECD7A412);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell textLabel](self, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAttributedText:", v7);

  }
  objc_setAssociatedObject(self, &unk_1ECD7A412, 0, (void *)1);
  v5 = *((_WORD *)p_tableCellFlags + 6);
  v9 = *(_QWORD *)((char *)p_tableCellFlags + 4) & 0xBFFFFFFFFFFFFFFFLL;
  *(_QWORD *)((char *)p_tableCellFlags + 4) = v9;
  if ((v9 & 0x8000000000000000) != 0)
  {
LABEL_7:
    -[UILabel attributedText](self->_detailTextLabel, "attributedText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_getAssociatedObject(self, &unk_1ECD7A413);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCell detailTextLabel](self, "detailTextLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAttributedText:", v11);

    }
    objc_setAssociatedObject(self, &unk_1ECD7A413, 0, (void *)1);
    v5 = *((_WORD *)p_tableCellFlags + 6);
    *(_QWORD *)((char *)p_tableCellFlags + 4) &= ~0x8000000000000000;
  }
LABEL_10:
  if ((v5 & 1) != 0)
  {
    -[UITextField attributedText](self->_editableTextField, "attributedText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_getAssociatedObject(self, &unk_1ECD7A414);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCell editableTextField](self, "editableTextField");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAttributedText:", v14);

    }
    objc_setAssociatedObject(self, &unk_1ECD7A414, 0, (void *)1);
    v17 = *((_WORD *)p_tableCellFlags + 6);
    v16 = (char *)p_tableCellFlags + 12;
    v18 = v16[2];
    *(_WORD *)v16 = v17 & 0xFFFE;
    v16[2] = v18;
  }
}

- (void)_layoutSystemBackgroundView:(BOOL)a3
{
  _UISystemBackgroundView *systemBackgroundView;

  systemBackgroundView = self->_systemBackgroundView;
  if (systemBackgroundView)
  {
    -[_UISystemBackgroundView frameInContainerView:](systemBackgroundView, "frameInContainerView:", self);
    -[_UISystemBackgroundView setFrame:](self->_systemBackgroundView, "setFrame:");
    if (a3
      || +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      -[UIView layoutIfNeeded](self->_systemBackgroundView, "layoutIfNeeded");
    }
  }
}

- (void)_layoutFloatingContentView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (self->_floatingContentView)
  {
    -[UITableViewCell layoutManager](self, "layoutManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "backgroundEndingRectForCell:forNewEditingState:", self, -[UITableViewCell isEditing](self, "isEditing"));
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    -[_UIFloatingContentView setFrame:](self->_floatingContentView, "setFrame:", v5, v7, v9, v11);
    -[UIView layoutIfNeeded](self->_floatingContentView, "layoutIfNeeded");
  }
}

- (void)_updateSeparatorViewAlpha
{
  _BOOL4 v3;
  double v4;

  v3 = -[UITableViewCell _shouldHideSeparator](self, "_shouldHideSeparator");
  v4 = 1.0;
  if (v3)
    v4 = 0.0;
  -[UIView setAlpha:](self->_separatorView, "setAlpha:", v4);
}

- (BOOL)_shouldHideSeparator
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x100000000000) != 0
      || -[UITableViewCell _hidesBottomSeparatorWhenUnselected](self, "_hidesBottomSeparatorWhenUnselected");
}

- (BOOL)_hidesBottomSeparatorWhenUnselected
{
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;

  p_tableCellFlags = &self->_tableCellFlags;
  if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x80000000000) != 0)
    return 1;
  if ((*((_BYTE *)&self->_tableCellFlags + 3) & 7u) - 3 > 1)
    return 0;
  if (-[UITableViewCell _usesRoundedGroups](self, "_usesRoundedGroups"))
    return 1;
  return (*(_QWORD *)((char *)p_tableCellFlags + 4) & 0x4000000000) == 0;
}

- (CGRect)_separatorFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  CGRect v24;
  CGRect result;

  if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0)
  {
    -[UITableViewCell _trailingSeparatorInset](self, "_trailingSeparatorInset");
    v4 = v6;
    -[UITableViewCell _leadingSeparatorInset](self, "_leadingSeparatorInset");
  }
  else
  {
    -[UITableViewCell _leadingSeparatorInset](self, "_leadingSeparatorInset");
    v4 = v3;
    -[UITableViewCell _trailingSeparatorInset](self, "_trailingSeparatorInset");
  }
  if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x400000000) != 0)
  {
    v4 = 0.0;
    v7 = 0.0;
  }
  else
  {
    v7 = v5;
  }
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UITableViewCell _separatorHeight](self, "_separatorHeight");
  v17 = v16;
  v23.origin.x = v9;
  v23.origin.y = v11;
  v23.size.width = v13;
  v23.size.height = v15;
  v18 = CGRectGetHeight(v23) - v17;
  v24.origin.x = v9;
  v24.origin.y = v11;
  v24.size.width = v13;
  v24.size.height = v15;
  v19 = CGRectGetWidth(v24) - (v4 + v7);
  v20 = v4;
  v21 = v18;
  v22 = v17;
  result.size.height = v22;
  result.size.width = v19;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (double)_trailingSeparatorInset
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double result;

  if (self->_separatorInset.right == -1.0)
  {
    -[UIView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4 == 6)
    {
      -[UITableViewCell _tableView](self, "_tableView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "_rawSeparatorInset");
        if (v7 == -1.0)
        {

          return 0.0;
        }
      }

    }
  }
  -[UITableViewCell _rightMarginWidth](self, "_rightMarginWidth");
  return result;
}

- (double)_leadingSeparatorInset
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double result;

  if (self->_separatorInset.left == -1.0)
  {
    -[UIView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4 == 6)
    {
      -[UITableViewCell _tableView](self, "_tableView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "_rawSeparatorInset");
        if (v7 == -1.0)
        {

          return 0.0;
        }
      }

    }
  }
  -[UITableViewCell _marginWidth](self, "_marginWidth");
  return result;
}

- (BOOL)_showSeparatorAtTopOfSection
{
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  int v3;
  BOOL v4;
  _BOOL8 v5;

  p_tableCellFlags = &self->_tableCellFlags;
  v3 = *((_BYTE *)&self->_tableCellFlags + 3) & 7;
  v4 = v3 == 4 || v3 == 2;
  if (v4 && !-[UITableViewCell _usesRoundedGroups](self, "_usesRoundedGroups"))
    return (*(_QWORD *)((char *)p_tableCellFlags + 4) >> 37) & 1;
  else
    LOBYTE(v5) = 0;
  return v5;
}

- (UIEdgeInsets)_effectiveSafeAreaInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double indexBarExtentFromEdge;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UIEdgeInsets result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  if (-[UITableViewCell _insetsContentViewsToSafeArea](self, "_insetsContentViewsToSafeArea"))
  {
    -[UIView superview](self, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[UIView safeAreaInsets](self, "safeAreaInsets");
      v6 = v8;
      v5 = v9;
      v4 = v10;
      v3 = v11;
    }
    else
    {
      -[UITableViewCell _tableView](self, "_tableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_cellSafeAreaInsets");
      v6 = UIEdgeInsetsAdd(10, 0.0, 0.0, 0.0, 0.0, v13);
      v5 = v14;
      v4 = v15;
      v3 = v16;

    }
  }
  v17 = *((_DWORD *)&self->super._viewFlags + 4);
  indexBarExtentFromEdge = self->_indexBarExtentFromEdge;
  v19 = fmax(v5, indexBarExtentFromEdge);
  v20 = fmax(v3, indexBarExtentFromEdge);
  if ((v17 & 0x80000) != 0)
    v21 = v3;
  else
    v21 = v20;
  if ((*(_QWORD *)&v17 & 0x80000) == 0)
    v19 = v5;
  v22 = v6;
  v23 = v4;
  result.right = v21;
  result.bottom = v23;
  result.left = v19;
  result.top = v22;
  return result;
}

- (BOOL)_insetsContentViewsToSafeArea
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 58) & 1;
}

- (UIView)contentView
{
  void *v3;

  if (!self->_contentView
    && !-[UITableViewCell drawingEnabled](self, "drawingEnabled")
    && dyld_program_sdk_at_least())
  {
    -[UITableViewCell _createDefaultContentView](self, "_createDefaultContentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell _setContentView:](self, "_setContentView:", v3);

  }
  return self->_contentView;
}

- (CGFloat)indentationWidth
{
  return self->_indentationWidth;
}

- (NSInteger)indentationLevel
{
  return self->_indentationLevel;
}

- (double)_rightMarginWidth
{
  double right;
  double v4;
  void *v5;
  void *v6;
  double v7;
  _BOOL4 v8;
  _BOOL4 v9;
  double indexBarExtentFromEdge;
  double v11;
  double v13;

  right = self->_separatorInset.right;
  if (right == -1.0
    && (-[UITableViewCell _preferredTrailingSeparatorInsetFromContentView](self, "_preferredTrailingSeparatorInsetFromContentView"), right = v4, v4 == 1.79769313e308)|| right == -1.0)
  {
    -[UITableViewCell _tableView](self, "_tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "_rawSeparatorInset");
      right = v7;
    }
    else
    {
      right = -1.0;
    }

  }
  v8 = -[UITableViewCell _shouldApplyReadableWidthInsets](self, "_shouldApplyReadableWidthInsets");
  v9 = v8;
  indexBarExtentFromEdge = self->_indexBarExtentFromEdge;
  if (right == -1.0)
  {
    if (v8)
    {
      -[UIView directionalLayoutMargins](self, "directionalLayoutMargins");
      return fmax(indexBarExtentFromEdge, v11);
    }
    return self->_indexBarExtentFromEdge;
  }
  else if (!-[UITableViewCell _separatorInsetIsRelativeToCellEdges](self, "_separatorInsetIsRelativeToCellEdges"))
  {
    if (v9)
    {
      -[UIView directionalLayoutMargins](self, "directionalLayoutMargins");
      return right + fmax(v13, indexBarExtentFromEdge);
    }
    else
    {
      return right + indexBarExtentFromEdge;
    }
  }
  return right;
}

- (double)_marginWidth
{
  void *v3;
  void *v4;
  double left;
  double v7;
  double defaultLeadingMarginWidth;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  _BOOL4 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;

  -[UITableViewCell _tableView](self, "_tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  left = self->_separatorInset.left;
  if (left == -1.0 && v3 != 0)
  {
    objc_msgSend(v3, "_rawSeparatorInset");
    left = v7;
  }
  if (left == -1.0)
  {
    defaultLeadingMarginWidth = self->_defaultLeadingMarginWidth;
    -[UIView directionalLayoutMargins](self, "directionalLayoutMargins");
    v10 = fmax(defaultLeadingMarginWidth, v9);
    objc_msgSend(v4, "_sectionContentInset");
    if (v11 > 0.0)
    {
      objc_msgSend(v4, "_sectionContentInset");
      v10 = v10 - v12;
    }
    if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x40) != 0)
    {
      -[UITableViewCell _preferredLeadingSeparatorInsetFromContentView](self, "_preferredLeadingSeparatorInsetFromContentView");
      left = v24;
      if (v24 == 1.79769313e308)
      {
        -[UITableViewCell _contentConfigurationPrimaryTextInsetFromCellLeadingEdge](self, "_contentConfigurationPrimaryTextInsetFromCellLeadingEdge");
        left = fmax(v25, v10);
      }
    }
    else
    {
      -[UITableViewCell layoutManager](self, "layoutManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "shouldIncreaseMarginForImageViewInCell:", self);

      if (v14)
      {
        -[UIView traitCollection](self, "traitCollection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "userInterfaceIdiom");

        if (v16 == 3)
        {
          -[UITableViewCell _imageView:](self, "_imageView:", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITableViewCell _imageViewExtentFromCellLeadingEdge](self, "_imageViewExtentFromCellLeadingEdge");
          v19 = v18;
          objc_msgSend(v17, "image");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 8.0;
          if (!v20)
            v21 = 12.0;
          left = fmax(v19 + v21, v10);

        }
        else
        {
          -[UITableViewCell _imageViewExtentFromCellLeadingEdge](self, "_imageViewExtentFromCellLeadingEdge");
          v27 = v26;
          if (v26 != 0.0)
            goto LABEL_27;
          if (qword_1ECD7A420 != -1)
            dispatch_once(&qword_1ECD7A420, &__block_literal_global_4_18);
          if (byte_1ECD7A411)
          {
            -[UITableViewCell contentView](self, "contentView");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "directionalLayoutMargins");
            v30 = v29;

          }
          else
          {
LABEL_27:
            v30 = v27 + 15.0;
          }
          left = fmax(v30, v10);
        }
      }
      else
      {
        left = fmax(v10, 15.0);
      }
    }
  }
  else if (!-[UITableViewCell _separatorInsetIsRelativeToCellEdges](self, "_separatorInsetIsRelativeToCellEdges"))
  {
    v22 = -[UITableViewCell _shouldApplyReadableWidthInsets](self, "_shouldApplyReadableWidthInsets");
    if ((dyld_program_sdk_at_least() & 1) != 0 || v22)
    {
      -[UIView directionalLayoutMargins](self, "directionalLayoutMargins");
      left = left + v23;
    }
  }

  return left;
}

- (id)layoutManager
{
  return self->_layoutManager;
}

- (double)_separatorHeight
{
  void *v3;
  char v4;
  double result;
  double v6;

  -[UITableViewCell _tableView](self, "_tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_shouldDrawThickSeparators");

  result = 1.0;
  if ((v4 & 1) == 0)
  {
    -[UIView _currentScreenScale](self, "_currentScreenScale", 1.0);
    return 1.0 / v6;
  }
  return result;
}

- (id)_tableView
{
  UITable_UITableViewCellDelegate **p_tableView;
  void *WeakRetained;
  uint64_t v5;
  id v6;

  p_tableView = &self->_tableView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  if (!WeakRetained)
  {
    v5 = objc_opt_class();
    _UIFallbackViewOfClassForReusableView(v5, self);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    if (WeakRetained)
      objc_storeWeak((id *)p_tableView, WeakRetained);
  }
  v6 = WeakRetained;

  return v6;
}

- (double)_imageViewExtentFromCellLeadingEdge
{
  uint64_t v3;
  double v4;
  void *v5;
  BOOL IsEmpty;
  int v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double MaxX;
  void *v25;
  void *v26;
  _BOOL4 ShouldCenterImageHorizontallyForTraitCollection;
  void *v28;
  void *v29;
  double v30;
  double v31;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  -[UIImageView image](self->_imageView, "image");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if (v3)
  {
    v5 = (void *)v3;
    -[UIView frame](self->_imageView, "frame");
    IsEmpty = CGRectIsEmpty(v33);

    if (!IsEmpty)
    {
      v7 = *((_DWORD *)&self->super._viewFlags + 4);
      -[UIView bounds](self, "bounds");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      -[UIView bounds](self->_imageView, "bounds");
      -[UIView convertRect:fromView:](self, "convertRect:fromView:", self->_imageView);
      if ((*(_QWORD *)&v7 & 0x80000) != 0)
        v20 = v9;
      else
        v20 = v16;
      if ((*(_QWORD *)&v7 & 0x80000) != 0)
        v21 = v11;
      else
        v21 = v17;
      if ((*(_QWORD *)&v7 & 0x80000) != 0)
        v22 = v13;
      else
        v22 = v18;
      if ((*(_QWORD *)&v7 & 0x80000) != 0)
        v23 = v15;
      else
        v23 = v19;
      if ((*(_QWORD *)&v7 & 0x80000) != 0)
      {
        v9 = v16;
        v11 = v17;
        v13 = v18;
        v15 = v19;
      }
      v34.origin.x = v20;
      v34.origin.y = v21;
      v34.size.width = v22;
      v34.size.height = v23;
      MaxX = CGRectGetMaxX(v34);
      v35.origin.x = v9;
      v35.origin.y = v11;
      v35.size.width = v13;
      v35.size.height = v15;
      v4 = MaxX - CGRectGetMinX(v35);
      -[UIImageView image](self->_imageView, "image");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView traitCollection](self, "traitCollection");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      ShouldCenterImageHorizontallyForTraitCollection = _UITableCellShouldCenterImageHorizontallyForTraitCollection(v25, v26);

      if (ShouldCenterImageHorizontallyForTraitCollection)
      {
        -[UITableViewCell _constants](self, "_constants");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView traitCollection](self, "traitCollection");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:traitCollection:", 0, v29);
        v31 = v30;

        -[UIView frame](self->_imageView, "frame");
        return v4 + (v31 - CGRectGetWidth(v36)) * 0.5;
      }
    }
  }
  return v4;
}

- (BOOL)_shouldApplyReadableWidthInsets
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[UIView layoutMarginsFollowReadableWidth](self, "layoutMarginsFollowReadableWidth");
  if (v3)
  {
    -[UITableViewCell _tableView](self, "_tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_safeAreaWidthExceedsReadableWidth");

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (double)_preferredTrailingSeparatorInsetFromContentView
{
  double v3;
  double result;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 1.79769313e308;
  -[UIView _preferredTrailingSeparatorInset](self->_contentView, "_preferredTrailingSeparatorInset");
  if (v3 == 1.79769313e308)
    return 1.79769313e308;
  -[UITableViewCell _contentViewInset:convertedToCellInsetOnEdge:](self, "_contentViewInset:convertedToCellInsetOnEdge:", 8);
  return result;
}

- (BOOL)_separatorInsetIsRelativeToCellEdges
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 53) & 1;
}

- (UITableViewCellConfigurationUpdateHandler)configurationUpdateHandler
{
  return self->_configurationUpdateHandler;
}

- (unint64_t)_viewConfigurationState
{
  void *v2;
  unint64_t v3;

  -[UITableViewCell configurationState](self, "configurationState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_viewConfigurationState");

  return v3;
}

- (void)_updateContentViewConfigurationForState:(id)a3
{
  id v4;
  void (**contentViewConfigurationProvider)(id, unint64_t);
  void *v6;
  UITableViewCell *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  contentViewConfigurationProvider = (void (**)(id, unint64_t))self->_contentViewConfigurationProvider;
  if (!contentViewConfigurationProvider)
  {
    if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x4000) == 0)
      goto LABEL_4;
    v11 = v4;
    if (self->_viewForContentConfiguration)
    {
      -[UITableViewCell contentConfiguration](self, "contentConfiguration");
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
      -[UITableViewCell _contentViewConfiguration](self, "_contentViewConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
        goto LABEL_3;
      v7 = self;
      v8 = v6;
      v9 = v11;
      v10 = 1;
    }
    -[UITableViewCell _applyContentViewConfiguration:withState:usingSPI:](v7, "_applyContentViewConfiguration:withState:usingSPI:", v8, v9, v10);
    goto LABEL_3;
  }
  v11 = v4;
  contentViewConfigurationProvider[2](contentViewConfigurationProvider, -[UITableViewCell _viewConfigurationState](self, "_viewConfigurationState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell _setContentViewConfiguration:](self, "_setContentViewConfiguration:", v6);
LABEL_3:

  v4 = v11;
LABEL_4:

}

- (void)_updateConfigurationUsingState:(id)a3
{
  -[UITableViewCell _updateCurrentSystemTypeAccessoryViewsUsingState:](self, "_updateCurrentSystemTypeAccessoryViewsUsingState:", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIView _defaultListContentConfigurationMayHaveChanged](self->_contentView, "_defaultListContentConfigurationMayHaveChanged");
}

- (void)_updateCellForCurrentBackgroundConfiguration
{
  void *v3;
  int v4;
  _UIBackgroundConfigurationInternal *lastNormalBackgroundViewConfiguration;
  void *v6;
  int v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  id v11;

  if (dyld_program_sdk_at_least()
    && !self->_selectedBackgroundView
    && !self->_multipleSelectionBackgroundView)
  {
    -[_UISystemBackgroundView configuration](self->_systemBackgroundView, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v3;
    if (!v3)
    {
      if (!-[UITableViewCell isHighlighted](self, "isHighlighted"))
        -[UITableViewCell isSelected](self, "isSelected");
      goto LABEL_13;
    }
    v4 = objc_msgSend(v3, "_hasBackgroundFill");
    if (-[UITableViewCell isHighlighted](self, "isHighlighted"))
    {
      if (!v4)
        goto LABEL_13;
    }
    else if ((-[UITableViewCell isSelected](self, "isSelected") & v4 & 1) == 0)
    {
      goto LABEL_13;
    }
    lastNormalBackgroundViewConfiguration = self->_lastNormalBackgroundViewConfiguration;
    -[UIView tintColor](self, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(lastNormalBackgroundViewConfiguration) = objc_msgSend(v11, "_backgroundFillIsEqual:withTintColor:", lastNormalBackgroundViewConfiguration, v6);

    if ((lastNormalBackgroundViewConfiguration & 1) == 0)
    {
      v10 = ((*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16) | 0x10000u) >> 16;
      *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
      *((_BYTE *)&self->_tableCellFlags + 14) = v10;
      -[UITableViewCell _applySelectedStateToSeparators:](self, "_applySelectedStateToSeparators:", 1);
      -[UITableViewCell _tableView](self, "_tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_cellDidShowSelectedBackground:", self);
      goto LABEL_16;
    }
LABEL_13:
    v7 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    if ((v7 & 0x10000) == 0)
    {
LABEL_17:

      return;
    }
    v8 = v7 & 0xFFFEFFFF;
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
    *((_WORD *)&self->_tableCellFlags + 6) = v8;
    *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v8);
    -[UITableViewCell _applySelectedStateToSeparators:](self, "_applySelectedStateToSeparators:", 0);
    -[UITableViewCell _tableView](self, "_tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_cellDidHideSelectedBackground:", self);
LABEL_16:

    goto LABEL_17;
  }
}

- (id)_contentViewConfiguration
{
  if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x40) == 0 || self->_viewForContentConfiguration)
    return 0;
  -[UIView configuration](self->_contentView, "configuration");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)drawingEnabled
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x3000) == 4096;
}

- (double)_preferredLeadingSeparatorInsetFromContentView
{
  double v3;
  double result;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 1.79769313e308;
  -[UIView _preferredLeadingSeparatorInset](self->_contentView, "_preferredLeadingSeparatorInset");
  if (v3 == 1.79769313e308)
    return 1.79769313e308;
  -[UITableViewCell _contentViewInset:convertedToCellInsetOnEdge:](self, "_contentViewInset:convertedToCellInsetOnEdge:", 2);
  return result;
}

- (double)_contentConfigurationPrimaryTextInsetFromCellLeadingEdge
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL IsNull;
  double result;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double MaxX;
  double MinX;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIView _primaryTextLayoutFrame](self->_contentView, "_primaryTextLayoutFrame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D628];
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  IsNull = CGRectIsNull(v31);
  result = 0.0;
  if (!IsNull)
  {
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", self->_contentView, v4, v6, v8, v10);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[UIView bounds](self, "bounds");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    if (-[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v32.origin.x = v22;
      v32.origin.y = v24;
      v32.size.width = v26;
      v32.size.height = v28;
      MaxX = CGRectGetMaxX(v32);
      v33.origin.x = v14;
      v33.origin.y = v16;
      v33.size.width = v18;
      v33.size.height = v20;
      return MaxX - CGRectGetMaxX(v33);
    }
    else
    {
      v34.origin.x = v14;
      v34.origin.y = v16;
      v34.size.width = v18;
      v34.size.height = v20;
      MinX = CGRectGetMinX(v34);
      v35.origin.x = v22;
      v35.origin.y = v24;
      v35.size.width = v26;
      v35.size.height = v28;
      return MinX - CGRectGetMinX(v35);
    }
  }
  return result;
}

- (BOOL)_isAnimating
{
  return HIDWORD(*(_QWORD *)((char *)&self->_tableCellFlags + 4)) & 1;
}

- (BOOL)_needsSetup
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 29) & 1;
}

- (void)_setSectionLocation:(int)a3 animated:(BOOL)a4 forceBackgroundSetup:(BOOL)a5
{
  _BOOL8 v6;
  char v7;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];

  if ((*((_BYTE *)&self->_tableCellFlags + 3) & 7) != a3 || a5)
  {
    v6 = a4;
    v7 = a3;
    v9 = -[UITableViewCell _maskedCornersForSystemBackgroundView](self, "_maskedCornersForSystemBackgroundView");
    *(_DWORD *)&self->_tableCellFlags = *(_DWORD *)&self->_tableCellFlags & 0xF8FFFFFF | ((v7 & 7) << 24);
    -[UITableViewCell _selectedBackgroundView:](self, "_selectedBackgroundView:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[4] = self;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __69__UITableViewCell__setSectionLocation_animated_forceBackgroundSetup___block_invoke;
    v16[3] = &unk_1E16C11C0;
    v16[4] = self;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__UITableViewCell__setSectionLocation_animated_forceBackgroundSetup___block_invoke_2;
    v15[3] = &unk_1E16B1B28;
    +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", v6, v16, v15, 0);
    -[UITableViewCell _updateContentClip](self, "_updateContentClip");
    if (v9 != -[UITableViewCell _maskedCornersForSystemBackgroundView](self, "_maskedCornersForSystemBackgroundView"))
    {
      -[UITableViewCell backgroundConfiguration](self, "backgroundConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        -[UITableViewCell _backgroundViewConfiguration](self, "_backgroundViewConfiguration");
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v13;

      -[UITableViewCell _applyBackgroundViewConfiguration:withState:](self, "_applyBackgroundViewConfiguration:withState:", v14, 0);
    }

  }
}

- (id)_selectedBackgroundView:(BOOL)a3
{
  void *v3;
  int tableCellFlags;
  void *v6;
  UIView *selectedBackgroundView;
  UIView *v8;
  UIView *v9;
  UIView *multipleSelectionBackgroundView;

  if (a3
    && !-[UITableViewCell _usingBackgroundConfigurationOrDefaultBackgroundConfiguration](self, "_usingBackgroundConfigurationOrDefaultBackgroundConfiguration"))
  {
    -[UITableViewCell _setupSelectedBackgroundView](self, "_setupSelectedBackgroundView");
  }
  tableCellFlags = (int)self->_tableCellFlags;
  if ((tableCellFlags & 0x100) == 0)
    goto LABEL_5;
  if ((*(_DWORD *)&self->_tableCellFlags & 0x7000) != 0x3000)
  {
    -[UITableViewCell _tableView](self, "_tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "allowsMultipleSelectionDuringEditing")
      && (*((_WORD *)&self->_tableCellFlags + 6) & 4) == 0)
    {
      multipleSelectionBackgroundView = self->_multipleSelectionBackgroundView;
      if (!multipleSelectionBackgroundView)
        multipleSelectionBackgroundView = self->_selectedBackgroundView;
      v8 = multipleSelectionBackgroundView;
      goto LABEL_22;
    }
LABEL_5:
    if ((*((_BYTE *)&self->_tableCellFlags + 1) & 1) != 0)
    {
      v8 = self->_selectedBackgroundView;
      if ((tableCellFlags & 0x100) == 0)
        return v8;
    }
    else
    {
      -[UITableViewCell _tableView](self, "_tableView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "allowsMultipleSelection") & 1) == 0
        || (selectedBackgroundView = self->_multipleSelectionBackgroundView) == 0)
      {
        selectedBackgroundView = self->_selectedBackgroundView;
      }
      v8 = selectedBackgroundView;

      if ((tableCellFlags & 0x100) == 0)
        return v8;
    }
LABEL_22:

    return v8;
  }
  v9 = self->_multipleSelectionBackgroundView;
  if (!v9)
    v9 = self->_selectedBackgroundView;
  v8 = v9;
  return v8;
}

- (void)setSectionLocation:(int)a3 animated:(BOOL)a4
{
  -[UITableViewCell _setSectionLocation:animated:forceBackgroundSetup:](self, "_setSectionLocation:animated:forceBackgroundSetup:", *(_QWORD *)&a3, a4, 0);
}

- (BOOL)_needsHeightCalculation
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 47) & 1;
}

void __69__UITableViewCell__setSectionLocation_animated_forceBackgroundSetup___block_invoke_2(uint64_t a1)
{
  void *v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 420) |= 0x800uLL;
  objc_msgSend(*(id *)(a1 + 32), "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "_updateSeparatorContent");
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

void __69__UITableViewCell__setSectionLocation_animated_forceBackgroundSetup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v9 = a2;
  objc_msgSend(v4, "_constants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultEditAndUpdateAnimationDuration");
  v8 = v7;

  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v9, v5, v8, 0.0);
}

- (id)_accessoryViewForType:(int64_t)a3
{
  UITableConstants *constants;
  void *v6;
  void *v7;
  _UITableCellAccessoryButton *v8;
  id *v9;
  UITableViewCellDetailDisclosureView *v10;
  _UITableCellAccessoryButton *v11;
  void *v12;
  void *v13;
  UITableConstants *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  constants = self->_constants;
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableConstants defaultListCellAccessoryImageSymbolConfigurationForTraitCollection:accessoryType:](constants, "defaultListCellAccessoryImageSymbolConfigurationForTraitCollection:accessoryType:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a3)
  {
    case 1:
      objc_initWeak(&location, self);
      v11 = [_UITableCellAccessoryButton alloc];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __41__UITableViewCell__accessoryViewForType___block_invoke_2;
      v18[3] = &unk_1E16E3670;
      v9 = &v19;
      objc_copyWeak(&v19, &location);
      v10 = -[_UITableCellAccessoryButton initWithFrame:backgroundImageProvider:accessoryType:](v11, "initWithFrame:backgroundImageProvider:accessoryType:", v18, 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[UITableViewCellDetailDisclosureView setPreferredSymbolConfiguration:forImageInState:](v10, "setPreferredSymbolConfiguration:forImageInState:", v7, 0);
      goto LABEL_6;
    case 4:
      +[UIButton buttonWithType:](UIButton, "buttonWithType:", 3);
      v10 = (UITableViewCellDetailDisclosureView *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCellDetailDisclosureView setPreferredSymbolConfiguration:forImageInState:](v10, "setPreferredSymbolConfiguration:forImageInState:", v7, 0);
      break;
    case 3:
      objc_initWeak(&location, self);
      v8 = [_UITableCellAccessoryButton alloc];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __41__UITableViewCell__accessoryViewForType___block_invoke;
      v20[3] = &unk_1E16E3670;
      v9 = &v21;
      objc_copyWeak(&v21, &location);
      v10 = -[_UITableCellAccessoryButton initWithFrame:backgroundImageProvider:accessoryType:](v8, "initWithFrame:backgroundImageProvider:accessoryType:", v20, 3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[UITableViewCellDetailDisclosureView setPreferredSymbolConfiguration:forImageInState:](v10, "setPreferredSymbolConfiguration:forImageInState:", v7, 0);
LABEL_6:
      objc_destroyWeak(v9);
      objc_destroyWeak(&location);
      break;
    default:
      if ((unint64_t)(a3 - 5) > 1)
      {
        if ((unint64_t)(a3 - 7) > 1)
        {
          if (a3 == 2)
            v10 = -[UITableViewCellDetailDisclosureView initWithTarget:action:cell:buttonType:shouldReverseLayoutDirection:]([UITableViewCellDetailDisclosureView alloc], "initWithTarget:action:cell:buttonType:shouldReverseLayoutDirection:", self->_target, self->_accessoryAction, self, 4, ((unint64_t)*((unsigned int *)&self->super._viewFlags + 4) >> 19) & 1);
          else
            v10 = 0;
        }
        else
        {
          v10 = -[UITableViewCellDetailDisclosureView initWithTarget:action:cell:buttonType:shouldReverseLayoutDirection:]([UITableViewCellDetailDisclosureView alloc], "initWithTarget:action:cell:buttonType:shouldReverseLayoutDirection:", self->_target, self->_accessoryAction, self, 123, ((unint64_t)*((unsigned int *)&self->super._viewFlags + 4) >> 19) & 1);
          -[UITableViewCellDetailDisclosureView accessoryButton](v10, "accessoryButton");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITableViewCell _updateExpansionButton:forType:animated:](self, "_updateExpansionButton:forType:animated:", v12, a3, 0);

        }
      }
      else
      {
        +[UIButton buttonWithType:](UIButton, "buttonWithType:", 123);
        v10 = (UITableViewCellDetailDisclosureView *)objc_claimAutoreleasedReturnValue();
        -[UITableViewCell _updateExpansionButton:forType:animated:](self, "_updateExpansionButton:forType:animated:", v10, a3, 0);
      }
      break;
  }
  -[UITableViewCell _tableView](self, "_tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    -[UITableViewCellDetailDisclosureView addTarget:action:forControlEvents:](v10, "addTarget:action:forControlEvents:", v13, sel__accessoryButtonAction_, 64);
  -[NSObject accessibilitySetIdentification:](v10, "accessibilitySetIdentification:", CFSTR("UITableCellViewDisclosure"));
  -[UITableViewCellDetailDisclosureView setSemanticContentAttribute:](v10, "setSemanticContentAttribute:", -[UIView semanticContentAttribute](self, "semanticContentAttribute"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = self->_constants;
    -[UITableViewCell _tableView](self, "_tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableConstants defaultAccessoryColorForCell:inTableView:](v14, "defaultAccessoryColorForCell:inTableView:", self, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](v10, "setTintColor:", v16);

  }
  return v10;
}

id __41__UITableViewCell__accessoryViewForType___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_disclosureChevronImageWithBaseColor:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_disclosureChevronImageWithBaseColor:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[UIView isFocused](self, "isFocused")
    && (-[UITableViewCell _constants](self, "_constants"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_opt_respondsToSelector(),
        v5,
        (v6 & 1) != 0))
  {
    -[UITableViewCell _constants](self, "_constants");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell _tableView](self, "_tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultFocusedDisclosureImageForCell:inTableView:", self, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UITableViewCell _constants](self, "_constants");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultDisclosureImageForCell:withAccessoryBaseColor:", self, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_accessoryView:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIControl *customAccessoryView;
  UIControl *v12;

  if (!-[UITableViewCell _usesModernAccessoriesLayout](self, "_usesModernAccessoriesLayout"))
  {
    customAccessoryView = (UIControl *)self->_customAccessoryView;
    if (!customAccessoryView)
    {
      if (a3)
      {
        -[UITableViewCell _defaultAccessoryView](self, "_defaultAccessoryView");
        v12 = (UIControl *)objc_claimAutoreleasedReturnValue();
LABEL_8:
        v10 = v12;
        return v10;
      }
      customAccessoryView = self->_accessoryView;
    }
    v12 = customAccessoryView;
    goto LABEL_8;
  }
  -[UITableViewCell _accessoryManager](self, "_accessoryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", 0x1E170DE80);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "trailingAccessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_updateAccessories
{
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  void *v4;
  void *v5;
  void *v6;
  UICellAccessoryConfiguration *v7;
  UICellAccessoryConfiguration *v8;
  void *v9;
  void *v10;
  void *v11;
  UICellAccessoryConfiguration *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UICellAccessoryConfiguration *v17;
  UICellAccessoryConfiguration *v18;
  UICellAccessoryConfiguration *v19;
  int v20;
  UICellAccessoryConfiguration *v21;
  UICellAccessoryConfiguration *v22;
  UICellAccessoryConfiguration *v23;
  int v24;
  UICellAccessoryConfiguration *v25;
  UICellAccessoryConfiguration *v26;
  UICellAccessoryConfiguration *v27;
  void *v28;
  UICellAccessoryConfiguration *v29;
  void *v30;
  void *v31;
  UICellAccessoryConfiguration *v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  p_tableCellFlags = &self->_tableCellFlags;
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) &= ~0x800000000000000uLL;
  -[UITableViewCell _accessoryManager](self, "_accessoryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "configurations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:");
    v7 = (UICellAccessoryConfiguration *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc_init(UICellAccessoryConfiguration);
    -[UITableViewCell _leadingAccessoriesForEditing:style:](self, "_leadingAccessoriesForEditing:style:", 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICellAccessoryConfiguration setLeadingAccessories:](v8, "setLeadingAccessories:", v9);

    -[UITableViewCell _trailingAccessoriesForType:view:editing:style:](self, "_trailingAccessoriesForType:view:editing:style:", ((unint64_t)*(_DWORD *)p_tableCellFlags >> 15) & 7, self->_customAccessoryView, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICellAccessoryConfiguration setTrailingAccessories:](v8, "setTrailingAccessories:", v10);

    objc_msgSend(v5, "configurations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", 0x1E1772080);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc_init(UICellAccessoryConfiguration);
    v13 = 1;
    -[UITableViewCell _leadingAccessoriesForEditing:style:](self, "_leadingAccessoriesForEditing:style:", 1, ((unint64_t)*(_DWORD *)p_tableCellFlags >> 12) & 7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICellAccessoryConfiguration setLeadingAccessories:](v12, "setLeadingAccessories:", v14);

    -[UITableViewCell _trailingAccessoriesForType:view:editing:style:](self, "_trailingAccessoriesForType:view:editing:style:", ((unint64_t)*(_DWORD *)p_tableCellFlags >> 18) & 7, self->_customEditingAccessoryView, 1, ((unint64_t)*(_DWORD *)p_tableCellFlags >> 12) & 7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICellAccessoryConfiguration setTrailingAccessories:](v12, "setTrailingAccessories:", v15);

    v16 = *(_QWORD *)((char *)p_tableCellFlags + 4);
    if ((v16 & 0x1000000000000000) != 0)
    {
      v20 = *((unsigned __int16 *)p_tableCellFlags + 6) | (*((unsigned __int8 *)p_tableCellFlags + 14) << 16);
    }
    else
    {
      v17 = v7;
      v18 = v8;
      v19 = v18;
      if (v17 == v18)
      {
        v13 = 0;
      }
      else if (v17 && v18)
      {
        v13 = !-[UICellAccessoryConfiguration isEqual:](v17, "isEqual:", v18);
      }

      v20 = *((unsigned __int16 *)p_tableCellFlags + 6) | (*((unsigned __int8 *)p_tableCellFlags + 14) << 16);
      v16 = *(_QWORD *)((char *)p_tableCellFlags + 4);
    }
    v32 = v7;
    if ((v16 & 0x1000000000000000) != 0)
    {
      if (v13)
        v25 = v8;
      else
        v25 = v7;
    }
    else
    {
      v21 = v33;
      v22 = v12;
      v23 = v22;
      if (v21 == v22)
      {
        v24 = 0;
LABEL_19:

        if ((v13 | v24) != 1)
        {
LABEL_31:
          -[UITableViewCell configurationState](self, "configurationState");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITableViewCell _updateCurrentSystemTypeAccessoryViewsUsingState:](self, "_updateCurrentSystemTypeAccessoryViewsUsingState:", v31);

          goto LABEL_32;
        }
        v26 = v32;
        if (v13)
          v26 = v8;
        *(_QWORD *)((char *)p_tableCellFlags + 4) &= ~0x1000000000000000uLL;
        v27 = v26;
        if ((v24 & 1) == 0)
        {
LABEL_30:
          v34[0] = 0x1E170DE80;
          v34[1] = 0x1E1772080;
          v35[0] = v27;
          v35[1] = v21;
          v28 = (void *)MEMORY[0x1E0C99D80];
          v29 = v21;
          objc_msgSend(v28, "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "setConfigurations:", v30);
          goto LABEL_31;
        }
LABEL_29:
        v21 = v12;
        goto LABEL_30;
      }
      if (v21 && v22)
      {
        v24 = !-[UICellAccessoryConfiguration isEqual:](v21, "isEqual:", v22);
        goto LABEL_19;
      }

      if (v13)
        v25 = v8;
      else
        v25 = v7;
      v20 = *((unsigned __int16 *)p_tableCellFlags + 6) | (*((unsigned __int8 *)p_tableCellFlags + 14) << 16);
      v16 = *(_QWORD *)((char *)p_tableCellFlags + 4);
    }
    *(_QWORD *)((char *)p_tableCellFlags + 4) = v16 & 0xEFFFFFFFFFFFFFFFLL;
    *((_WORD *)p_tableCellFlags + 6) = v20;
    *((_BYTE *)p_tableCellFlags + 14) = BYTE2(v20);
    v27 = v25;
    goto LABEL_29;
  }
LABEL_32:

}

- (id)_leadingAccessoriesForEditing:(BOOL)a3 style:(int64_t)a4
{
  _BOOL8 v5;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UITableViewCell _sanitizedEditingStyleForEditing:style:](self, "_sanitizedEditingStyleForEditing:style:", v5, a4);
  if (-[UITableViewCell _editControlShouldBeOnLeadingSideForStyle:](self, "_editControlShouldBeOnLeadingSideForStyle:", v8))
  {
    -[UITableViewCell _editControlAccessoryForStyle:](self, "_editControlAccessoryForStyle:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v7, "addObject:", v9);

  }
  if (v5 && !objc_msgSend(v7, "count") && (*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x20) != 0)
  {
    -[UITableViewCell _constants](self, "_constants");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:traitCollection:", 0, v11);
    v13 = v12;

    if (v13 > 0.0)
    {
      +[_UICellSpacingAccessory accessoryWithIdentifier:size:](_UICellSpacingAccessory, "accessoryWithIdentifier:size:", CFSTR("spacing"), v13, 1.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v14);

    }
  }
  return v7;
}

- (id)_trailingAccessoriesForType:(int64_t)a3 view:(id)a4 editing:(BOOL)a5 style:(int64_t)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  char isKindOfClass;
  double v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v7 = a5;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell _badgeText](self, "_badgeText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "length"))
  {

LABEL_14:
    v16 = 0;
    v15 = 0;
    if (v10)
      goto LABEL_7;
LABEL_15:
    switch(a3)
    {
      case 1:
        goto LABEL_22;
      case 2:
        -[UITableViewCell _accessoryViewForType:](self, "_accessoryViewForType:", 4);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UICellViewAccessory accessoryWithIdentifier:view:options:](_UICellViewAccessory, "accessoryWithIdentifier:view:options:", CFSTR("info"), v24, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v25);

        if (v16)
          objc_msgSend(v11, "addObject:", v15);
LABEL_22:
        -[UITableViewCell _accessoryViewForType:](self, "_accessoryViewForType:", 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UICellViewAccessory accessoryWithIdentifier:view:options:reservedLayoutWidth:](_UICellViewAccessory, "accessoryWithIdentifier:view:options:reservedLayoutWidth:", CFSTR("chevron"), v20, 1, 1.79769313e308);
        v26 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 3:
        -[UITableViewCell _accessoryViewForType:](self, "_accessoryViewForType:", 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CFSTR("checkmark");
        goto LABEL_25;
      case 4:
        -[UITableViewCell _accessoryViewForType:](self, "_accessoryViewForType:", 4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CFSTR("info");
        goto LABEL_25;
      case 5:
      case 6:
        -[UITableViewCell _accessoryViewForType:](self, "_accessoryViewForType:", 5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CFSTR("expand");
        goto LABEL_25;
      case 7:
      case 8:
        -[UITableViewCell _accessoryViewForType:](self, "_accessoryViewForType:", 5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UICellViewAccessory accessoryWithIdentifier:view:options:](_UICellViewAccessory, "accessoryWithIdentifier:view:options:", CFSTR("expand"), v22, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v23);

        if (v16)
          objc_msgSend(v11, "addObject:", v15);
        -[UITableViewCell _accessoryViewForType:](self, "_accessoryViewForType:", 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CFSTR("chevron");
LABEL_25:
        +[_UICellViewAccessory accessoryWithIdentifier:view:options:](_UICellViewAccessory, "accessoryWithIdentifier:view:options:", v21, v20, 1);
        v26 = objc_claimAutoreleasedReturnValue();
LABEL_26:
        v27 = (void *)v26;
        objc_msgSend(v11, "addObject:", v26);

        goto LABEL_27;
      default:
        goto LABEL_28;
    }
  }
  v13 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);

  if ((v13 & 0x2000000000000000) == 0)
    goto LABEL_14;
  -[UITableViewCell _badge](self, "_badge");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UICellViewAccessory accessoryWithIdentifier:view:options:](_UICellViewAccessory, "accessoryWithIdentifier:view:options:", CFSTR("badge"), v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v15 != 0;
  if (a3 != 2 && v15)
  {
    objc_msgSend(v11, "addObject:", v15);
    v16 = 1;
  }
  if (!v10)
    goto LABEL_15;
LABEL_7:
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v18 = 1.79769313e308;
  if ((isKindOfClass & 1) == 0)
    v18 = 0.0;
  if (v7)
    v19 = CFSTR("customEditing");
  else
    v19 = CFSTR("custom");
  +[_UICellViewAccessory accessoryWithIdentifier:view:options:reservedLayoutWidth:](_UICellViewAccessory, "accessoryWithIdentifier:view:options:reservedLayoutWidth:", v19, v10, 12, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v20);
LABEL_27:

LABEL_28:
  v28 = -[UITableViewCell _sanitizedEditingStyleForEditing:style:](self, "_sanitizedEditingStyleForEditing:style:", v7, a6);
  if (!-[UITableViewCell _editControlShouldBeOnLeadingSideForStyle:](self, "_editControlShouldBeOnLeadingSideForStyle:", v28))
  {
    -[UITableViewCell _editControlAccessoryForStyle:](self, "_editControlAccessoryForStyle:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      objc_msgSend(v11, "addObject:", v29);

  }
  if ((*((_BYTE *)&self->_tableCellFlags + 2) & 0x20) != 0
    && (*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x400000000200) != 0x200)
  {
    if (a3 || v10)
    {
      -[UITableViewCell editingData:](self, "editingData:", 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "reorderSeparatorView:", 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UICellViewAccessory accessoryWithIdentifier:view:options:](_UICellViewAccessory, "accessoryWithIdentifier:view:options:", CFSTR("reorderSeparator"), v31, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v32);

    }
    -[UITableViewCell editingData:](self, "editingData:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "reorderControl:", 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICellViewAccessory accessoryWithIdentifier:view:options:](_UICellViewAccessory, "accessoryWithIdentifier:view:options:", CFSTR("reorder"), v34, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v35);

  }
  return v11;
}

- (int64_t)_sanitizedEditingStyleForEditing:(BOOL)a3 style:(int64_t)a4
{
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  void *v6;
  __int16 v7;

  if (!a3)
    return 0;
  p_tableCellFlags = &self->_tableCellFlags;
  if ((*(_DWORD *)&self->_tableCellFlags & 0x7000) == 0x3000)
    return 3;
  -[UITableViewCell _tableView](self, "_tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "allowsMultipleSelectionDuringEditing") & 1) == 0)
  {

    return a4;
  }
  v7 = *((_WORD *)p_tableCellFlags + 6);

  if ((v7 & 4) == 0)
    return 3;
  return a4;
}

- (BOOL)_editControlShouldBeOnLeadingSideForStyle:(int64_t)a3
{
  return 1;
}

- (id)_editControlAccessoryForStyle:(int64_t)a3
{
  __CFString *v6;
  void *v7;
  void *v8;
  void *v10;
  id WeakRetained;
  void *v12;

  v6 = 0;
  switch(a3)
  {
    case 0:
      return v6;
    case 1:
      v6 = CFSTR("delete");
      goto LABEL_5;
    case 2:
      v6 = CFSTR("insert");
      goto LABEL_5;
    case 3:
      v6 = CFSTR("multiselect");
      goto LABEL_5;
    default:
LABEL_5:
      -[UITableViewCell editingData:](self, "editingData:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "editControl:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UICellViewAccessory accessoryWithIdentifier:view:options:reservedLayoutWidth:](_UICellViewAccessory, "accessoryWithIdentifier:view:options:reservedLayoutWidth:", v6, v8, 5, 0.0);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        if (dyld_program_sdk_at_least())
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
          objc_msgSend(WeakRetained, "description");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITableViewCell.m"), 8136, CFSTR("Invalid editing style detected (%tu). This is likely due to an invalid value being returned from the implementation of -tableView:editingStyleForRowAtIndexPath: of this table view's delegate: %@"), a3, v12);

        }
        v6 = 0;
      }
      return v6;
  }
}

- (id)_badgeText
{
  void *v3;
  void *v4;

  if (!-[UITableViewCell _usesModernAccessoriesLayout](self, "_usesModernAccessoriesLayout")
    || (*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x2000000000000000) != 0)
  {
    -[UITableViewCell _badge](self, "_badge");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_updateModernCellAccessoriesForState:(id)a3 isEditing:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __CFString *v18;
  int64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v6 = &_UITableCellAccessoryConfigurationIdentifierEditing;
  v26 = v4;
  if (!v4)
    v6 = &_UITableCellAccessoryConfigurationIdentifierNormal;
  v7 = (id)*v6;
  -[UITableViewCell _accessoryManager](self, "_accessoryManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v7;
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "leadingAccessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v10;
  objc_msgSend(v10, "trailingAccessories");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v11;
  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v17, "identifier");
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v18 == CFSTR("delete"))
        {
          v19 = 2;
        }
        else if (v18 == CFSTR("insert"))
        {
          v19 = 3;
        }
        else if (v18 == CFSTR("multiselect"))
        {
          v19 = 5;
        }
        else if (v18 == CFSTR("checkmark"))
        {
          v19 = 1;
        }
        else if (v18 == CFSTR("chevron"))
        {
          v19 = 0;
        }
        else if (v18 == CFSTR("reorder"))
        {
          v19 = 4;
        }
        else if (v18 == CFSTR("expand"))
        {
          v19 = 6;
        }
        else
        {
          if (v18 != CFSTR("info"))
          {

            v19 = -[UITableViewCell _currentAccessoryTypeForEditing:](self, "_currentAccessoryTypeForEditing:", v26);
            goto LABEL_26;
          }
          v19 = 9;
        }

LABEL_26:
        objc_msgSend(v17, "identifier");
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v20 != CFSTR("custom"))
        {
          objc_msgSend(v17, "view");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITableViewCell _updateSystemTypeAccessoryView:withCellAccessoryType:forState:](self, "_updateSystemTypeAccessoryView:withCellAccessoryType:forState:", v21, v19, v27);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v14);
  }

}

- (void)_updateCurrentSystemTypeAccessoryViewsUsingState:(id)a3
{
  char v4;
  char v5;
  char v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x800000000000000) == 0)
  {
    v4 = 0;
    v5 = 1;
    do
    {
      v6 = v5;
      if (-[UITableViewCell _usesModernAccessoriesLayout](self, "_usesModernAccessoriesLayout"))
      {
        -[UITableViewCell _updateModernCellAccessoriesForState:isEditing:](self, "_updateModernCellAccessoriesForState:isEditing:", v9, v4 & 1);
      }
      else
      {
        v7 = v4 & 1;
        -[UITableViewCell _existingSystemAccessoryView:](self, "_existingSystemAccessoryView:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITableViewCell _updateSystemTypeAccessoryView:withTableViewAccessoryType:forState:](self, "_updateSystemTypeAccessoryView:withTableViewAccessoryType:forState:", v8, -[UITableViewCell _currentAccessoryTypeForEditing:](self, "_currentAccessoryTypeForEditing:", v7), v9);

      }
      v5 = 0;
      v4 = 1;
    }
    while ((v6 & 1) != 0);
  }

}

- (BOOL)_usesModernAccessoriesLayout
{
  return self->_accessoryManager != 0;
}

double __42__UITableViewCell__updateAccessoryMetrics__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_constants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "interspaceBetweenInnerAccessoryIdentifier:outerAccessoryIdentifier:forCell:trailingAccessoryGroup:", v6, v5, WeakRetained, 1);
  v10 = v9;

  return v10;
}

- (double)_minimumCellAccessoryMargin
{
  return self->_defaultTrailingCellMarginWidth;
}

- (int64_t)_currentAccessoryTypeForEditing:(BOOL)a3
{
  unsigned int tableCellFlags;
  unsigned int v4;

  tableCellFlags = self->_tableCellFlags;
  if (!a3)
    return (tableCellFlags >> 15) & 7;
  v4 = (tableCellFlags >> 18) & 7;
  if (!v4)
    return (tableCellFlags >> 15) & 7;
  return v4;
}

void __57__UITableViewCell__setupChangeHandlersForNewContentView___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSeparatorContent:", 1);

}

- (void)_updateSeparatorContent:(BOOL)a3
{
  if (a3)
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) |= 0x800uLL;
  -[UITableViewCell _updateSeparatorContent](self, "_updateSeparatorContent");
}

- (void)_applyBackgroundViewConfiguration:(id)a3 withState:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _UISystemBackgroundView *systemBackgroundView;
  void *v11;
  double v12;
  void *lastNormalBackgroundViewConfiguration;
  _UISystemBackgroundView *v14;
  _UISystemBackgroundView *v15;
  uint64_t v16;
  void *v17;
  UITableViewCell *v18;
  UITableViewCell *v19;
  _UIBackgroundConfigurationInternal *v20;
  unsigned int v21;
  void *v22;
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  systemBackgroundView = self->_systemBackgroundView;
  if (v7)
  {
    if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x8000) != 0 && !self->_backgroundViewConfigurationProvider)
    {
      if (!v8)
      {
        -[UITableViewCell configurationState](self, "configurationState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITableViewCell _stateForUpdatingBackgroundConfigurationWithState:](self, "_stateForUpdatingBackgroundConfigurationWithState:", v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v7, "_updatedConfigurationForState:", v9);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITableViewCell.m"), 3740, CFSTR("Updated configuration was nil for configuration: %@"), v7);

      }
    }
    else
    {
      v23 = v7;
    }
  }
  else
  {
    v23 = 0;
  }
  objc_msgSend(v23, "__setMaskedCorners:", -[UITableViewCell _maskedCornersForSystemBackgroundView](self, "_maskedCornersForSystemBackgroundView"));
  if (v7)
  {
    if (-[UITableViewCell _appliesMaskingToBackgroundConfiguration](self, "_appliesMaskingToBackgroundConfiguration"))
    {
      if (-[UITableViewCell _usesRoundedGroups](self, "_usesRoundedGroups"))
      {
        -[UITableViewCell _roundedGroupCornerRadius](self, "_roundedGroupCornerRadius");
        if (v12 > 0.0)
        {
          -[UITableViewCell _roundedGroupCornerRadius](self, "_roundedGroupCornerRadius");
          objc_msgSend(v23, "_setCornerRadius:");
        }
      }
    }
    if (systemBackgroundView)
    {
      -[_UISystemBackgroundView setConfiguration:](self->_systemBackgroundView, "setConfiguration:", v23);
      -[UIView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[UITableViewCell _resetBackgroundViewsAndColor](self, "_resetBackgroundViewsAndColor");
      v14 = -[_UISystemBackgroundView initWithConfiguration:]([_UISystemBackgroundView alloc], "initWithConfiguration:", v23);
      v15 = self->_systemBackgroundView;
      self->_systemBackgroundView = v14;

      -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v16)
        v18 = (UITableViewCell *)v16;
      else
        v18 = self;
      v19 = v18;

      -[UIView insertSubview:atIndex:](v19, "insertSubview:atIndex:", self->_systemBackgroundView, 0);
      -[UIView setNeedsLayout](self, "setNeedsLayout");

    }
    if (-[UITableViewCell isHighlighted](self, "isHighlighted")
      || -[UITableViewCell isSelected](self, "isSelected")
      || -[UIView isFocused](self, "isFocused"))
    {
      goto LABEL_29;
    }
    v20 = (_UIBackgroundConfigurationInternal *)objc_msgSend(v23, "copyWithZone:", 0);
    lastNormalBackgroundViewConfiguration = self->_lastNormalBackgroundViewConfiguration;
    self->_lastNormalBackgroundViewConfiguration = v20;
  }
  else
  {
    if (!systemBackgroundView)
    {
      -[UITableViewCell _updateContentClip](self, "_updateContentClip");
      goto LABEL_33;
    }
    -[UIView removeFromSuperview](self->_systemBackgroundView, "removeFromSuperview");
    lastNormalBackgroundViewConfiguration = self->_systemBackgroundView;
    self->_systemBackgroundView = 0;
  }

LABEL_29:
  -[UITableViewCell _updateContentClip](self, "_updateContentClip");
  if (-[UIView isFocused](self, "isFocused")
    && +[UIFocusRingManager focusRingAvailable](UIFocusRingManager, "focusRingAvailable"))
  {
    v21 = ((*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16) | 0x20000u) >> 16;
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((_BYTE *)&self->_tableCellFlags + 14) = v21;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_33:

}

- (unint64_t)_maskedCornersForSystemBackgroundView
{
  int v3;
  double v4;

  v3 = -[UITableViewCell _selectionGrouping](self, "_selectionGrouping");
  if (-[UITableViewCell _usesRoundedGroups](self, "_usesRoundedGroups"))
  {
    -[UITableViewCell _roundedGroupCornerRadius](self, "_roundedGroupCornerRadius");
    if (v4 > 0.0)
      v3 = -[UITableViewCell sectionLocation](self, "sectionLocation");
  }
  if ((v3 - 1) > 2)
    return 15;
  else
    return qword_1866842B0[v3 - 1];
}

- (int)_selectionGrouping
{
  return (*(_DWORD *)&self->_tableCellFlags >> 27) & 7;
}

- (void)_setContentClipCorners:(unint64_t)a3 updateCorners:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;
  id v13;
  id v14;

  v4 = a4;
  -[UIView layer](self, "layer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell _swipeContainerView](self, "_swipeContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v13, "setCornerRadius:", 0.0);
    objc_msgSend(v13, "setMasksToBounds:", 0);
    v9 = v8;

    v10 = v9;
  }
  else
  {
    v10 = v13;
  }
  v14 = v10;
  if (a3)
  {
    objc_msgSend(v10, "setMaskedCorners:", a3);
    -[UITableViewCell _roundedGroupCornerRadius](self, "_roundedGroupCornerRadius");
    objc_msgSend(v14, "setCornerRadius:");
    objc_msgSend(v14, "setMasksToBounds:", 1);
    objc_msgSend(v14, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
  }
  else
  {
    if (v4)
    {
      objc_msgSend(v10, "setMaskedCorners:", 0);
      objc_msgSend(v14, "setCornerRadius:", 0.0);
      v10 = v14;
    }
    v11 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
    if ((v11 & 0x200200000000) != 0)
    {
      v12 = 1;
    }
    else if ((v11 & 0x100000000) != 0)
    {
      v12 = -[UITableViewCell _shouldMaskToBoundsWhileAnimating](self, "_shouldMaskToBoundsWhileAnimating");
      v10 = v14;
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v10, "setMasksToBounds:", v12);
  }

}

- (double)_roundedGroupCornerRadius
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  -[UITableViewCell _tableView](self, "_tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || (objc_msgSend(v3, "_sectionCornerRadius"), v5 == -1.0))
  {
    -[UIView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userInterfaceIdiom");

    v7 = 10.0;
  }
  else
  {
    objc_msgSend(v4, "_sectionCornerRadius");
    v7 = v6;
  }

  return v7;
}

- (void)_setAnimating:(BOOL)a3 clippingAdjacentCells:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v7;
  BOOL v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;
  _BOOL8 v12;
  UIView *v13;
  UIView *v14;
  UIView *clearBlendingView;
  void *v16;
  void *v17;
  UITableViewCell *v18;
  id v19;

  v4 = a4;
  v5 = a3;
  v7 = -[UITableViewCell _shouldMaskToBoundsWhileAnimating](self, "_shouldMaskToBoundsWhileAnimating");
  v8 = -[UITableViewCell _usesRoundedGroups](self, "_usesRoundedGroups");
  v9 = 0x100000000;
  if (!v5)
    v9 = 0;
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0xFFFFFFFEFFFFFFFFLL | v9;
  -[UITableViewCell _updateContentClip](self, "_updateContentClip");
  if (!v5)
  {
    -[UIView removeFromSuperview](self->_clearBlendingView, "removeFromSuperview");
    v10 = (*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x38000000000) == 0;
    -[UIView layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v11;
    v12 = v10;
LABEL_14:
    objc_msgSend(v11, "setAllowsGroupBlending:", v12);

    return;
  }
  if (!v8 && v7 && v4)
  {
    if (self->_clearBlendingView)
    {
      -[UIView bounds](self, "bounds");
      -[UIView setFrame:](self->_clearBlendingView, "setFrame:");
    }
    else
    {
      v13 = [UIView alloc];
      -[UIView bounds](self, "bounds");
      v14 = -[UIView initWithFrame:](v13, "initWithFrame:");
      clearBlendingView = self->_clearBlendingView;
      self->_clearBlendingView = v14;

      -[UIView setAutoresizingMask:](self->_clearBlendingView, "setAutoresizingMask:", 18);
      -[UIView layer](self->_clearBlendingView, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMasksToBounds:", 1);
      objc_msgSend(v16, "setCompositingFilter:", *MEMORY[0x1E0CD2C18]);

    }
    -[UITableViewCell backgroundColor](self, "backgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_clearBlendingView, "setBackgroundColor:", v17);

    -[UIView superview](self->_clearBlendingView, "superview");
    v18 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();

    if (v18 != self)
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_clearBlendingView, 0);
    -[UIView layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v11;
    v12 = 0;
    goto LABEL_14;
  }
}

- (BOOL)_shouldMaskToBoundsWhileAnimating
{
  void *v2;
  char v3;

  -[UITableViewCell editingData:](self, "editingData:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsMaskingWhileAnimatingDisabled");

  return v3 ^ 1;
}

- (id)editingData:(BOOL)a3
{
  void *v3;
  BOOL v5;
  UITableViewCellEditingData *v6;
  int v7;
  unint64_t v8;
  UITableViewCellEditingData *v9;
  id editingData;

  if (self->_editingData)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = [UITableViewCellEditingData alloc];
    v7 = *(_DWORD *)&self->_tableCellFlags & 0x7000;
    if (v7 == 12288)
    {
      v8 = 3;
    }
    else
    {
      -[UITableViewCell _tableView](self, "_tableView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "allowsMultipleSelectionDuringEditing")
        || (*((_WORD *)&self->_tableCellFlags + 6) & 4) != 0)
      {
        v8 = ((unint64_t)*(_DWORD *)&self->_tableCellFlags >> 12) & 7;
      }
      else
      {
        v8 = 3;
      }
    }
    v9 = -[UITableViewCellEditingData initWithTableViewCell:editingStyle:](v6, "initWithTableViewCell:editingStyle:", self, v8);
    editingData = self->_editingData;
    self->_editingData = v9;

    if (v7 != 12288)
  }
  return self->_editingData;
}

- (void)_setBackgroundViewConfiguration:(id)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_tableCellFlags + 6) & 0xEFFF | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
  v4 = ((unint64_t)a3 | *((_WORD *)&self->_tableCellFlags + 6) & 0x1000) != 0;
  *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v3);
  *((_WORD *)&self->_tableCellFlags + 6) = v3 | (v4 << 12);
  -[UITableViewCell _applyBackgroundViewConfiguration:withState:](self, "_applyBackgroundViewConfiguration:withState:");
}

uint64_t __53__UITableViewCell__updateDefaultBackgroundAppearance__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundConfiguration:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__UITableViewCell__resetBackgroundViewsAndColor__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", 0);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 420) &= ~0x10000000uLL;
  return result;
}

void __37__UITableViewCell_setTableViewStyle___block_invoke(uint64_t a1)
{
  _WORD *v2;
  __int16 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v2 = *(_WORD **)(a1 + 32);
  v3 = v2[214];
  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v2, "_constants", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_tableStyle");
  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "defaultCellBackgroundPropertiesForTableViewStyle:state:traitCollection:", v6, v7, v8);
  }
  else
  {
    v20 = 0;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
  }

  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *((_QWORD *)&v12 + 1));
  v10 = *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 428);
  v9 = *(_QWORD *)(a1 + 32) + 428;
  v11 = v10 & 0xFFFFFF7F | (*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 430) << 16);
  *(_WORD *)v9 = v10 & 0xFF7F | v3 & 0x80;
  *(_BYTE *)(v9 + 2) = BYTE2(v11);
  __destructor_8_s8_s16_s24_s80((id *)&v12);
}

- (id)_backgroundView:(BOOL)a3
{
  if (a3
    && !-[UITableViewCell _usingBackgroundConfigurationOrDefaultBackgroundConfiguration](self, "_usingBackgroundConfigurationOrDefaultBackgroundConfiguration"))
  {
    -[UITableViewCell _setupBackgroundView](self, "_setupBackgroundView");
  }
  return self->_backgroundView;
}

- (BOOL)_usingBackgroundConfigurationOrDefaultBackgroundConfiguration
{
  int v3;

  v3 = dyld_program_sdk_at_least();
  if (v3)
    LOBYTE(v3) = -[UITableViewCell _usingBackgroundViewConfiguration](self, "_usingBackgroundViewConfiguration")
              || (*((_WORD *)&self->_tableCellFlags + 6) & 0x1B80) == 0
              && (*((_WORD *)&self->_tableCellFlags + 6) & 0x400) == 0;
  return v3;
}

- (BOOL)_usingBackgroundViewConfiguration
{
  return self->_systemBackgroundView || self->_backgroundViewConfigurationProvider != 0;
}

- (id)_addSeparatorWithFrame:(CGRect)a3
{
  _UITableViewCellSeparatorView *v4;
  _UITableViewCellSeparatorView *v5;
  unint64_t v6;

  v4 = -[_UITableViewCellSeparatorView initWithFrame:]([_UITableViewCellSeparatorView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v6 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  if ((v6 & 0x40000000000) != 0)
    -[_UITableViewCellSeparatorView setDrawsWithVibrantLightMode:](v4, "setDrawsWithVibrantLightMode:", 1);
  else
    -[UIView _setDrawsAsBackdropOverlayWithBlendMode:](v4, "_setDrawsAsBackdropOverlayWithBlendMode:", (v6 >> 39) & 7);
  -[_UITableViewCellSeparatorView setSeparatorEffect:](v5, "setSeparatorEffect:", self->_separatorEffect);
  -[UIView addSubview:](self, "addSubview:", v5);
  return v5;
}

- (void)_setContentView:(id)a3
{
  UIView *v5;
  UIView *v6;
  UIView **p_contentView;
  UIView *contentView;
  UIView *v9;
  UILongPressGestureRecognizer *longPressGesture;
  uint64_t v11;
  UIView *v12;

  v5 = (UIView *)a3;
  v6 = v5;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v12 = v5;
    if (contentView)
    {
      -[UITableViewCell _clearChangeHandlersForOldContentView:](self, "_clearChangeHandlersForOldContentView:");
      if (*p_contentView)
      {
        *((_QWORD *)&(*p_contentView)->_viewFlags + 1) &= ~0x200uLL;
        v9 = *p_contentView;
      }
      else
      {
        v9 = 0;
      }
      -[UIView removeFromSuperview](v9, "removeFromSuperview");
    }
    longPressGesture = self->_longPressGesture;
    self->_longPressGesture = 0;

    objc_storeStrong((id *)&self->_contentView, a3);
    -[UIView setSemanticContentAttribute:](v12, "setSemanticContentAttribute:", -[UIView semanticContentAttribute](self, "semanticContentAttribute"));
    v6 = v12;
    if (v12)
    {
      -[UIView addSubview:](self, "addSubview:", v12);
      v11 = 512;
      if ((((*(_QWORD *)&v12->_viewFlags & 0x20000000000000) == 0) & (*((unsigned __int8 *)&self->_tableCellFlags + 14) >> 4)) == 0)
        v11 = 0;
      *((_QWORD *)&v12->_viewFlags + 1) = v11 | *((_QWORD *)&v12->_viewFlags + 1) & 0xFFFFFFFFFFFFFDFFLL;
      -[UITableViewCell _setupChangeHandlersForNewContentView:](self, "_setupChangeHandlersForNewContentView:", v12);
      -[UITableViewCell _setupMenuGesture](self, "_setupMenuGesture");
      v6 = v12;
    }
  }

}

- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  objc_super v20;
  objc_super v21;

  v8 = a3;
  v9 = a5;
  if (self->_floatingContentView)
  {
    -[UITableViewCell _subviewsForFloatingContentView](self, "_subviewsForFloatingContentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v8);

    if (!v11)
    {
      -[UIView _addSubview:positioned:relativeTo:](&v21, sel__addSubview_positioned_relativeTo_, v8, a4, v9, v20.receiver, v20.super_class, self, UITableViewCell);
      goto LABEL_20;
    }
    if (a4 == -3)
    {
      objc_msgSend(v9, "superview");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 != v16)
      {
        -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "insertSubview:atIndex:", v8, 0);
        goto LABEL_19;
      }
      a4 = -3;
    }
    else if (a4 == -2)
    {
      objc_msgSend(v9, "superview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 != v13)
      {
        -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubview:", v8);
LABEL_19:

        goto LABEL_20;
      }
      a4 = -2;
    }
    else if (a4 >= 1)
    {
      -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "subviews");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v19 < a4)
        a4 = v19;
    }
    -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_addSubview:positioned:relativeTo:", v8, a4, v9);
    goto LABEL_19;
  }
  -[UIView _addSubview:positioned:relativeTo:](&v20, sel__addSubview_positioned_relativeTo_, v8, a4, v9, self, UITableViewCell, v21.receiver, v21.super_class);
LABEL_20:

}

- (void)_setupMenuGesture
{
  UIView *contentView;
  UIView *v4;
  UILongPressGestureRecognizer *v5;
  UILongPressGestureRecognizer *longPressGesture;

  contentView = self->_contentView;
  if (contentView)
  {
    -[UIGestureRecognizer view](self->_longPressGesture, "view");
    v4 = (UIView *)objc_claimAutoreleasedReturnValue();

    if (contentView != v4)
    {
      v5 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__longPressGestureRecognized_);
      longPressGesture = self->_longPressGesture;
      self->_longPressGesture = v5;

      -[UIGestureRecognizer setDelegate:](self->_longPressGesture, "setDelegate:", self);
      -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_longPressGesture, "setMinimumPressDuration:", 0.5);
      -[UIView addGestureRecognizer:](self->_contentView, "addGestureRecognizer:", self->_longPressGesture);
    }
  }
}

- (void)_setupChangeHandlersForNewContentView:(id)a3
{
  id v4;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  id (*v8)(uint64_t);
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __57__UITableViewCell__setupChangeHandlersForNewContentView___block_invoke;
    v17[3] = &unk_1E16B3F40;
    v5 = &v18;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v4, "_setPreferredSeparatorInsetsDidChangeHandler:", v17);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_6;
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__UITableViewCell__setupChangeHandlersForNewContentView___block_invoke_2;
    v15[3] = &unk_1E16B3F40;
    v5 = &v16;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v4, "_setPrimaryTextFrameDidChangeHandler:", v15);
  }
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
LABEL_6:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__UITableViewCell__setupChangeHandlersForNewContentView___block_invoke_3;
    v13[3] = &unk_1E16B3F40;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v4, "_setPopupMenuButtonDidChangeHandler:", v13);
    -[UITableViewCell _updatePopupMenuButtonFromContentView](self, "_updatePopupMenuButtonFromContentView");
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__UITableViewCell__setupChangeHandlersForNewContentView___block_invoke_4;
    v11[3] = &unk_1E16B3F40;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v4, "_setContainerBackgroundViewDidChangeHandler:", v11);
    if (-[UITableViewCell _usingBackgroundConfigurationOrDefaultBackgroundConfiguration](self, "_usingBackgroundConfigurationOrDefaultBackgroundConfiguration"))
    {
      -[UITableViewCell _updateDefaultBackgroundAppearance](self, "_updateDefaultBackgroundAppearance");
    }
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __57__UITableViewCell__setupChangeHandlersForNewContentView___block_invoke_5;
    v9 = &unk_1E16BC328;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v4, "_setDefaultListContentConfigurationProvider:", &v6);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "_containingListStyleUpdated:", -[UITableViewCell _contentViewListStyleFromTableViewStyle:](self, "_contentViewListStyleFromTableViewStyle:", *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x1FLL));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "_containerViewIsHiddenForReuse:", ((*((unsigned __int16 *)&self->_tableCellFlags + 6) | ((unint64_t)*((unsigned __int8 *)&self->_tableCellFlags+ 14) << 16)) & 0x80000) == 0, v6, v7, v8, v9);

}

- (void)_clearChangeHandlersForOldContentView:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "_setPreferredSeparatorInsetsDidChangeHandler:", 0);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "_setPrimaryTextFrameDidChangeHandler:", 0);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "_setPopupMenuButtonDidChangeHandler:", 0);
    -[UITableViewCell _setPopupMenuButton:](self, "_setPopupMenuButton:", 0);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "_setContainerBackgroundViewDidChangeHandler:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "_setDefaultListContentConfigurationProvider:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "_containingListStyleUpdated:", -1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "_containerViewIsHiddenForReuse:", 0);

}

- (void)_setupSelectedBackgroundView
{
  void *v3;
  double v4;
  UITableViewCellSelectedBackground *v5;
  void *v6;
  UIView *v7;
  UIView *selectedBackgroundView;
  id v9;

  if (self->_selectedBackgroundView)
    goto LABEL_2;
  if ((*(_BYTE *)&self->_tableCellFlags & 0x70) != 0
    && !self->_systemBackgroundView
    && !self->_backgroundViewConfigurationProvider)
  {
    v5 = [UITableViewCellSelectedBackground alloc];
    -[UITableViewCell layoutManager](self, "layoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedBackgroundEndingRectForCell:forNewEditingState:", self, -[UITableViewCell isEditing](self, "isEditing"));
    v7 = -[UIView initWithFrame:](v5, "initWithFrame:");
    selectedBackgroundView = self->_selectedBackgroundView;
    self->_selectedBackgroundView = v7;

    *(_QWORD *)((char *)&self->_tableCellFlags + 4) |= 0x80uLL;
    if (self->_selectedBackgroundView)
    {
LABEL_2:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[UIView setSelectionStyle:](self->_selectedBackgroundView, "setSelectionStyle:", ((unint64_t)*(_DWORD *)&self->_tableCellFlags >> 4) & 7);
        -[UIView setSelectionEffects:](self->_selectedBackgroundView, "setSelectionEffects:", self->_selectionEffects);
        -[UIView setSelectionTintColor:](self->_selectedBackgroundView, "setSelectionTintColor:", self->_selectionTintColor);
        -[UITableViewCell backgroundColor](self, "backgroundColor");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setNoneStyleBackgroundColor:](self->_selectedBackgroundView, "setNoneStyleBackgroundColor:", v3);

      }
      if (-[UIView isOpaque](self, "isOpaque"))
      {
        -[UITableViewCell backgroundColor](self, "backgroundColor");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "alphaComponent");
        -[UIView setOpaque:](self->_selectedBackgroundView, "setOpaque:", v4 == 1.0);

      }
      else
      {
        -[UIView setOpaque:](self->_selectedBackgroundView, "setOpaque:", 0);
      }
    }
  }
}

- (id)backgroundColor
{
  id v3;
  objc_super v5;
  objc_super v6;

  if (qword_1ECD7A428 != -1)
    dispatch_once(&qword_1ECD7A428, &__block_literal_global_1267);
  if (byte_1ECD7A415)
  {
    v6.receiver = self;
    v6.super_class = (Class)UITableViewCell;
    -[UIView backgroundColor](&v6, sel_backgroundColor);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITableViewCell;
    -[UIView backgroundColor](&v5, sel_backgroundColor);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)_insetsBackground
{
  return self->_backgroundInset.left > 0.0 || self->_backgroundInset.right > 0.0;
}

- (UIView)multipleSelectionBackgroundView
{
  return self->_multipleSelectionBackgroundView;
}

- (BOOL)_isUsingOldStyleMultiselection
{
  return (*(_DWORD *)&self->_tableCellFlags & 0x7100) == 0x3100 && self->_multipleSelectionBackgroundView == 0;
}

- (int64_t)separatorStyle
{
  return ((unint64_t)*(_DWORD *)&self->_tableCellFlags >> 1) & 7;
}

- (id)_textLabel
{
  UILabel *v3;
  UILabel *textLabel;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;

  if (!self->_textLabel && (*((_WORD *)&self->_tableCellFlags + 6) & 0x40) == 0)
  {
    objc_msgSend(self->_layoutManager, "textLabelForCell:", self);
    v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
    textLabel = self->_textLabel;
    self->_textLabel = v3;

    v5 = self->_textLabel;
    if (v5)
    {
      -[UIView superview](v5, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 != v7)
      {
        -[UITableViewCell contentView](self, "contentView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addSubview:", self->_textLabel);

      }
    }
  }
  return self->_textLabel;
}

- (id)_imageView
{
  UIImageView *imageView;
  UIImageView *v4;
  UIImageView *v5;
  UIView *backgroundView;
  void *v7;
  void *v8;
  UIImageView *v9;
  void *v10;

  imageView = self->_imageView;
  if (!imageView)
  {
    if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x40) != 0
      || (objc_msgSend(self->_layoutManager, "imageViewForCell:", self),
          v4 = (UIImageView *)objc_claimAutoreleasedReturnValue(),
          v5 = self->_imageView,
          self->_imageView = v4,
          v5,
          -[UITableViewCell _updateDefaultImageSymbolConfiguration](self, "_updateDefaultImageSymbolConfiguration"),
          !self->_imageView))
    {
      imageView = 0;
    }
    else
    {
      backgroundView = self->_backgroundView;
      -[UITableViewCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = self->_imageView;
      if (backgroundView)
        objc_msgSend(v7, "insertSubview:aboveSubview:", v9, self->_backgroundView);
      else
        objc_msgSend(v7, "addSubview:", v9);

      -[UITableViewCell _tableView](self, "_tableView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_tableStyle");

      imageView = self->_imageView;
    }
  }
  return imageView;
}

- (void)_updateDefaultImageSymbolConfiguration
{
  UITableConstants *constants;
  void *v4;
  id v5;

  if (self->_imageView)
  {
    constants = self->_constants;
    -[UIView traitCollection](self, "traitCollection");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UITableConstants defaultImageSymbolConfigurationForTraitCollection:](constants, "defaultImageSymbolConfigurationForTraitCollection:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", v4);

  }
}

- (void)_bridgedUpdateConfigurationUsingState:(void *)a3
{
  void *v3;
  id v4;
  _QWORD v5[7];

  sub_1850F2A38(a3, (uint64_t)v5);
  v3 = (void *)v5[0];
  v4 = (id)v5[4];
  swift_bridgeObjectRelease();

}

- (BOOL)_forwardsSystemLayoutFittingSizeToContentView:(id)a3
{
  if (self->_contentView == a3)
    return -[UIView _wantsAutolayoutOrIsGuardingForEngineHosting]((uint64_t)a3);
  else
    return 0;
}

- (void)_updateSystemTypeAccessoryView:(id)a3 withCellAccessoryType:(int64_t)a4 forState:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  UITableConstants *constants;
  void *v14;
  void *v15;
  UITableConstants *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  v20 = a3;
  v8 = a5;
  -[UIView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v9, "_hasSplitViewControllerContextSidebarColumn");

  -[UITableViewCell _tableView](self, "_tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_accessoryBaseColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v10 = v10;
  }
  else
  {
    constants = self->_constants;
    v10 = v10;
    -[UIView traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView tintColor](self, "tintColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableConstants defaultAccessoryTintColorForAccessorySystemType:header:sidebarStyle:cellConfigurationState:traitCollection:inheritedTintColor:](constants, "defaultAccessoryTintColorForAccessorySystemType:header:sidebarStyle:cellConfigurationState:traitCollection:inheritedTintColor:", a4, 0, v10, v8, v14, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16 = self->_constants;
  -[UIView traitCollection](self, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableConstants defaultAccessoryBackgroundColorForAccessorySystemType:header:sidebarStyle:cellConfigurationState:traitCollection:](v16, "defaultAccessoryBackgroundColorForAccessorySystemType:header:sidebarStyle:cellConfigurationState:traitCollection:", a4, 0, v10, v8, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v20, "setTintColor:", v12);
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_9:
    objc_msgSend(v20, "setAccessoryTintColor:", v12);
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v20;
    objc_msgSend(v19, "setAccessoryTintColor:", v12);
    objc_msgSend(v19, "setAccessoryBackgroundColor:", v18);
    objc_msgSend(v19, "_updateImageView");

  }
LABEL_10:

}

- (void)setBackgroundColor:(id)a3
{
  unint64_t v4;
  int v5;
  __int16 v6;
  id v7;
  void *v8;
  CGColor *v9;
  _BOOL4 v10;
  BOOL v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  objc_super v17;
  objc_super v18;

  v4 = (unint64_t)a3;
  if (v4)
    -[UITableViewCell _resetBackgroundViewConfiguration](self, "_resetBackgroundViewConfiguration");
  v5 = *((_WORD *)&self->_tableCellFlags + 6) & 0xFF7F | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
  v6 = (v4 | *((_WORD *)&self->_tableCellFlags + 6) & 0x80) != 0;
  *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v5);
  *((_WORD *)&self->_tableCellFlags + 6) = v5 | (v6 << 7);
  if (-[UITableViewCell _changesOpaqueStateOfSubviews](self, "_changesOpaqueStateOfSubviews"))
  {
    v17.receiver = self;
    v17.super_class = (Class)UITableViewCell;
    -[UIView backgroundColor](&v17, sel_backgroundColor);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 == (id)v4)
    {
LABEL_15:

      goto LABEL_16;
    }
    v9 = (CGColor *)objc_msgSend(objc_retainAutorelease(v7), "CGColor");
    CGColorRetain(v9);
    v16.receiver = self;
    v16.super_class = (Class)UITableViewCell;
    -[UIView setBackgroundColor:](&v16, sel_setBackgroundColor_, v4);
    v10 = -[UITableViewCell _shouldUseHighlightedOrSelectedAppearance](self, "_shouldUseHighlightedOrSelectedAppearance");
    v11 = v10;
    v12 = !v10;
    -[UIView setOpaque:](self->_textLabel, "setOpaque:", v12);
    -[UIView setOpaque:](self->_detailTextLabel, "setOpaque:", v12);
    if (v11)
    {
      +[UIColor clearColor](UIColor, "clearColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_textLabel, "setBackgroundColor:", v13);

    }
    else
    {
      if (CGColorEqualToColor(-[UIView _backgroundCGColor](self->_textLabel, "_backgroundCGColor"), v9))
      {
        -[UIView setBackgroundColor:](self->_textLabel, "setBackgroundColor:", v4);
      }
      else
      {
        +[UIColor clearColor](UIColor, "clearColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](self->_textLabel, "setBackgroundColor:", v14);

      }
      if (CGColorEqualToColor(-[UIView _backgroundCGColor](self->_detailTextLabel, "_backgroundCGColor"), v9))
      {
        -[UIView setBackgroundColor:](self->_detailTextLabel, "setBackgroundColor:", v4);
LABEL_14:
        CGColorRelease(v9);
        goto LABEL_15;
      }
    }
    +[UIColor clearColor](UIColor, "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_detailTextLabel, "setBackgroundColor:", v15);

    goto LABEL_14;
  }
  v18.receiver = self;
  v18.super_class = (Class)UITableViewCell;
  -[UIView setBackgroundColor:](&v18, sel_setBackgroundColor_, v4);
LABEL_16:
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) |= 0x10000000uLL;

}

- (BOOL)_changesOpaqueStateOfSubviews
{
  return dyld_program_sdk_at_least() ^ 1;
}

- (BOOL)_shouldUseHighlightedOrSelectedAppearance
{
  _BOOL4 v2;

  if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x400) != 0)
    LOBYTE(v2) = 1;
  else
    return ((*(_DWORD *)&self->_tableCellFlags & 0x70) != 0) & (*(_DWORD *)&self->_tableCellFlags >> 7);
  return v2;
}

- (void)_resetBackgroundViewConfiguration
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52__UITableViewCell__resetBackgroundViewConfiguration__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v2);
}

- (void)_applyContentViewConfiguration:(id)a3 withState:(id)a4 usingSPI:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  void *viewForContentConfiguration;
  id v16;
  id v17;
  int v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  objc_class *v23;
  id v24;
  void *v25;
  objc_class *v26;
  char v27;
  void *contentView;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  const char *v35;
  id v36;
  void *v37;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  v12 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
  if (v9)
  {
    if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x4000) != 0 && !self->_contentViewConfigurationProvider)
    {
      if (!v10)
      {
        -[UITableViewCell configurationState](self, "configurationState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v37 = v11;
      if (v5)
      {
        v20 = -[UITableViewCell _viewConfigurationState](self, "_viewConfigurationState");
        -[UIView traitCollection](self, "traitCollection");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "updatedConfigurationForState:traitCollection:", v20, v21);
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
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITableViewCell.m"), 2483, CFSTR("Updated configuration was nil for configuration: %@"), v9);

      }
      v11 = v37;
    }
    else
    {
      v13 = v9;
    }
    v36 = v11;
    if ((v12 & 0x40) == 0)
    {
      v14 = *((_BYTE *)&self->_tableCellFlags + 14);
      *((_WORD *)&self->_tableCellFlags + 6) |= 0x40u;
      *((_BYTE *)&self->_tableCellFlags + 14) = v14;
      -[UITableViewCell _resetContentViews](self, "_resetContentViews");
      if (!v5)
      {
LABEL_44:
        objc_msgSend(v13, "makeContentView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&self->_viewForContentConfiguration, v29);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[_UIContentViewInternal _wrappedContentView](self->_viewForContentConfiguration, "_wrappedContentView");
          v31 = objc_claimAutoreleasedReturnValue();

          v29 = (void *)v31;
        }
        goto LABEL_46;
      }
      goto LABEL_40;
    }
    viewForContentConfiguration = self->_viewForContentConfiguration;
    if (!viewForContentConfiguration)
      viewForContentConfiguration = self->_contentView;
    v16 = v13;
    v17 = viewForContentConfiguration;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v18 = objc_msgSend(v17, "supportsConfiguration:", v16);
    }
    else
    {
      v35 = a2;
      objc_msgSend(v17, "configuration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v19;
      if (v17)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v17, "_wrappedConfigurationIdentifier");
        }
        else
        {
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }

      v24 = v16;
      if (v24)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v24, "_wrappedConfigurationIdentifier");
        }
        else
        {
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = 0;
      }

      v18 = objc_msgSend(v22, "isEqualToString:", v25);
      a2 = v35;
    }

    v27 = *((_BYTE *)&self->_tableCellFlags + 14);
    *((_WORD *)&self->_tableCellFlags + 6) |= 0x40u;
    *((_BYTE *)&self->_tableCellFlags + 14) = v27;
    if (!v18)
    {
      if (!v5)
      {
        -[_UIContentViewInternal configuration](self->_viewForContentConfiguration, "configuration");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        UIContentConfigurationAlertForReplacedContentView(CFSTR("cell"), self, v30, v16, CFSTR("Use separate reuse identifiers for different types of cells to avoid this."));

        -[UITableViewCell _resetContentViews](self, "_resetContentViews");
        goto LABEL_44;
      }
      -[UITableViewCell _resetContentViews](self, "_resetContentViews");
LABEL_40:
      objc_msgSend(v13, "createContentView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_46:
      if (!v29)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITableViewCell.m"), 2514, CFSTR("Content configuration returned a nil content view: %@"), v13);

      }
      if ((objc_msgSend(v29, "translatesAutoresizingMaskIntoConstraints") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITableViewCell.m"), 2515, CFSTR("The content view returned from the content configuration must have translatesAutoresizingMaskIntoConstraints enabled: %@"), v29);

      }
      -[UITableViewCell _setContentView:](self, "_setContentView:", v29);

      goto LABEL_51;
    }
    if (v5)
      contentView = self->_contentView;
    else
      contentView = self->_viewForContentConfiguration;
    objc_msgSend(contentView, "setConfiguration:", v16);
    v13 = v16;
LABEL_51:

    v11 = v36;
    goto LABEL_52;
  }
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v12);
  *((_WORD *)&self->_tableCellFlags + 6) = v12 & 0xFFBF;
  if ((v12 & 0x40) != 0)
  {
    v36 = v10;
    -[UITableViewCell _setContentView:](self, "_setContentView:", 0);
    v13 = self->_viewForContentConfiguration;
    self->_viewForContentConfiguration = 0;
    goto LABEL_51;
  }
LABEL_52:

}

- (void)_resetContentViews
{
  UIImageView *imageView;
  UILabel *textLabel;
  UILabel *detailTextLabel;
  UITextField *editableTextField;

  -[UIView removeFromSuperview](self->_imageView, "removeFromSuperview");
  imageView = self->_imageView;
  self->_imageView = 0;

  -[UIView removeFromSuperview](self->_textLabel, "removeFromSuperview");
  textLabel = self->_textLabel;
  self->_textLabel = 0;

  -[UIView removeFromSuperview](self->_detailTextLabel, "removeFromSuperview");
  detailTextLabel = self->_detailTextLabel;
  self->_detailTextLabel = 0;

  -[UITextField removeFromSuperview](self->_editableTextField, "removeFromSuperview");
  editableTextField = self->_editableTextField;
  self->_editableTextField = 0;

}

- (void)_resetBackgroundViewsAndColor
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__UITableViewCell__resetBackgroundViewsAndColor__block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v3);
  -[UITableViewCell setBackgroundView:](self, "setBackgroundView:", 0);
  -[UITableViewCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", 0);
  -[UITableViewCell setMultipleSelectionBackgroundView:](self, "setMultipleSelectionBackgroundView:", 0);
}

- (void)setSelectedBackgroundView:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  UIView *v7;
  UIView *v8;
  UIView **p_selectedBackgroundView;
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  int v11;
  __int16 v12;
  UIView *v13;
  UIView *v14;
  int v15;
  unint64_t v16;
  int v17;
  void *v18;
  UIView *multipleSelectionBackgroundView;
  BOOL v20;
  UIView *v21;
  UIView *v22;
  UIView *v23;
  uint64_t v24;
  _QWORD v25[4];
  UIView *v26;
  _QWORD v27[4];
  UIView *v28;
  UITableViewCell *v29;

  v4 = a4;
  v5 = a3;
  v7 = (UIView *)a3;
  v8 = v7;
  p_selectedBackgroundView = &self->_selectedBackgroundView;
  if (self->_selectedBackgroundView != v7)
  {
    if (v7)
      -[UITableViewCell _resetBackgroundViewConfiguration](self, "_resetBackgroundViewConfiguration");
    p_tableCellFlags = &self->_tableCellFlags;
    v11 = *((_WORD *)&self->_tableCellFlags + 6) & 0xFDFF | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    v12 = ((unint64_t)v8 | *((_WORD *)&self->_tableCellFlags + 6) & 0x200) != 0;
    *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v11);
    *((_WORD *)&self->_tableCellFlags + 6) = v11 | (v12 << 9);
    v13 = *p_selectedBackgroundView;
    if (v4)
    {
      v14 = v13;
    }
    else
    {
      -[UIView removeFromSuperview](v13, "removeFromSuperview");
      v14 = 0;
    }
    objc_storeStrong((id *)&self->_selectedBackgroundView, v5);
    if (*p_selectedBackgroundView)
    {
      v15 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
      v16 = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0xFFFFFFFFFFFFFF7FLL;
    }
    else
    {
      if (-[UITableViewCell _usingBackgroundConfigurationOrDefaultBackgroundConfiguration](self, "_usingBackgroundConfigurationOrDefaultBackgroundConfiguration"))
      {
        goto LABEL_12;
      }
      -[UITableViewCell _setupSelectedBackgroundView](self, "_setupSelectedBackgroundView");
      v15 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
      v16 = *(_QWORD *)((char *)&self->_tableCellFlags + 4) | 0x80;
    }
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) = v16;
    *((_WORD *)&self->_tableCellFlags + 6) = v15;
    *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v15);
LABEL_12:
    if (!-[UITableViewCell isSelected](self, "isSelected"))
      goto LABEL_25;
    v17 = *(_DWORD *)p_tableCellFlags;
    if ((*(_DWORD *)p_tableCellFlags & 0x100) == 0)
    {
LABEL_14:
      -[UITableViewCell _tableView](self, "_tableView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_msgSend(v18, "allowsMultipleSelection") & 1) == 0
         || (multipleSelectionBackgroundView = self->_multipleSelectionBackgroundView) == 0
         || multipleSelectionBackgroundView == *p_selectedBackgroundView;

      if ((v17 & 0x100) != 0)
      if (!v20)
        goto LABEL_25;
LABEL_35:
      if (!*p_selectedBackgroundView)
        goto LABEL_38;
      goto LABEL_36;
    }
    if ((*(_DWORD *)p_tableCellFlags & 0x7000) == 0x3000)
    {
      v21 = self->_multipleSelectionBackgroundView;
      if (!v21)
        goto LABEL_35;
      if (v21 == *p_selectedBackgroundView)
      {
LABEL_36:
        if (!self->_backgroundView)
        {
          -[UIView addSubview:](self, "addSubview:");
          -[UITableViewCell sendSubviewToBack:](self, "sendSubviewToBack:", *p_selectedBackgroundView);
          if (!v4)
            goto LABEL_26;
          goto LABEL_41;
        }
        -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:");
LABEL_38:
        if (!v4)
          goto LABEL_26;
LABEL_41:
        -[UIView setAlpha:](*p_selectedBackgroundView, "setAlpha:", 0.0);
        v24 = MEMORY[0x1E0C809B0];
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __54__UITableViewCell_setSelectedBackgroundView_animated___block_invoke;
        v27[3] = &unk_1E16B1B50;
        v28 = v14;
        v29 = self;
        v25[0] = v24;
        v25[1] = 3221225472;
        v25[2] = __54__UITableViewCell_setSelectedBackgroundView_animated___block_invoke_2;
        v25[3] = &unk_1E16B3FD8;
        v26 = v28;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v27, v25, 0.35, 0.0);

        goto LABEL_26;
      }
      goto LABEL_25;
    }
    -[UITableViewCell _tableView](self, "_tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "allowsMultipleSelectionDuringEditing")
      || (*((_WORD *)&self->_tableCellFlags + 6) & 4) != 0)
    {
      if ((*((_BYTE *)&self->_tableCellFlags + 1) & 1) == 0)
        goto LABEL_14;
    }
    else
    {
      v22 = self->_multipleSelectionBackgroundView;
      if (v22)
      {
        v23 = *p_selectedBackgroundView;

        if (v22 == v23)
          goto LABEL_35;
LABEL_25:
        -[UIView removeFromSuperview](*p_selectedBackgroundView, "removeFromSuperview");
LABEL_26:

        goto LABEL_27;
      }
    }

    goto LABEL_35;
  }
LABEL_27:

}

- (void)setSelectedBackgroundView:(UIView *)selectedBackgroundView
{
  -[UITableViewCell setSelectedBackgroundView:animated:](self, "setSelectedBackgroundView:animated:", selectedBackgroundView, 0);
}

- (void)setBackgroundView:(UIView *)backgroundView
{
  UIView *v5;
  UIView *v6;
  UIView **p_backgroundView;
  int v8;
  __int16 v9;
  BOOL v10;
  UIView *v11;

  v5 = backgroundView;
  v6 = v5;
  p_backgroundView = &self->_backgroundView;
  if (self->_backgroundView != v5)
  {
    v11 = v5;
    if (v5)
    {
      -[UITableViewCell _resetBackgroundViewConfiguration](self, "_resetBackgroundViewConfiguration");
      v6 = v11;
    }
    v8 = *((_WORD *)&self->_tableCellFlags + 6) & 0xFEFF | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    v9 = ((unint64_t)v6 | *((_WORD *)&self->_tableCellFlags + 6) & 0x100) != 0;
    *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v8);
    *((_WORD *)&self->_tableCellFlags + 6) = v8 | (v9 << 8);
    -[UIView removeFromSuperview](*p_backgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundView, backgroundView);
    if (*p_backgroundView)
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_backgroundView, 0);
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) &= ~0x100uLL;
    v6 = v11;
    if (!*p_backgroundView)
    {
      v10 = -[UITableViewCell _usingBackgroundConfigurationOrDefaultBackgroundConfiguration](self, "_usingBackgroundConfigurationOrDefaultBackgroundConfiguration");
      v6 = v11;
      if (!v10)
      {
        -[UITableViewCell _setupBackgroundView](self, "_setupBackgroundView");
        v6 = v11;
      }
    }
  }

}

- (void)setMultipleSelectionBackgroundView:(UIView *)multipleSelectionBackgroundView
{
  void *v3;
  UIView *v5;
  UIView **p_multipleSelectionBackgroundView;
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  int v8;
  __int16 v9;
  int v10;
  void *v11;
  int v12;
  UIView *v13;
  UIView *v14;

  v3 = multipleSelectionBackgroundView;
  v5 = multipleSelectionBackgroundView;
  p_multipleSelectionBackgroundView = &self->_multipleSelectionBackgroundView;
  if (self->_multipleSelectionBackgroundView != v5)
  {
    v14 = v5;
    if (v5)
    {
      -[UITableViewCell _resetBackgroundViewConfiguration](self, "_resetBackgroundViewConfiguration");
      v5 = v14;
    }
    p_tableCellFlags = &self->_tableCellFlags;
    v8 = *((_WORD *)&self->_tableCellFlags + 6) & 0xFBFF | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    v9 = ((unint64_t)v5 | *((_WORD *)&self->_tableCellFlags + 6) & 0x400) != 0;
    *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v8);
    *((_WORD *)&self->_tableCellFlags + 6) = v8 | (v9 << 10);
    -[UIView removeFromSuperview](*p_multipleSelectionBackgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_multipleSelectionBackgroundView, v3);
    if (!-[UITableViewCell isSelected](self, "isSelected"))
      goto LABEL_19;
    v10 = *(_DWORD *)p_tableCellFlags;
    if ((*(_DWORD *)p_tableCellFlags & 0x100) != 0)
    {
      if ((*(_DWORD *)p_tableCellFlags & 0x7000) == 0x3000)
        goto LABEL_14;
      -[UITableViewCell _tableView](self, "_tableView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "allowsMultipleSelectionDuringEditing")
        && (*((_WORD *)&self->_tableCellFlags + 6) & 4) == 0)
      {

        goto LABEL_14;
      }
      if ((*((_BYTE *)&self->_tableCellFlags + 1) & 1) != 0)
      {

        goto LABEL_19;
      }
    }
    -[UITableViewCell _tableView](self, "_tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "allowsMultipleSelection");

    if ((v10 & 0x100) != 0)
    {

      if ((v12 & 1) == 0)
      {
LABEL_19:
        -[UIView removeFromSuperview](*p_multipleSelectionBackgroundView, "removeFromSuperview");
LABEL_20:
        v5 = v14;
        goto LABEL_21;
      }
    }
    else if (!v12)
    {
      goto LABEL_19;
    }
LABEL_14:
    v13 = *p_multipleSelectionBackgroundView;
    if (self->_backgroundView)
    {
      -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v13);
    }
    else
    {
      -[UIView addSubview:](self, "addSubview:", v13);
      -[UITableViewCell sendSubviewToBack:](self, "sendSubviewToBack:", *p_multipleSelectionBackgroundView);
    }
    goto LABEL_20;
  }
LABEL_21:

}

- (void)_setNeedsSeparatorUpdate
{
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) |= 0x800uLL;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setSeparatorHidden:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0xFFFFF7FFFFFFFFFFLL | v3;
  -[UITableViewCell _setNeedsSeparatorUpdate](self, "_setNeedsSeparatorUpdate");
}

- (void)setSeparatorStyle:(int64_t)a3
{
  unint64_t tableCellFlags;

  tableCellFlags = (unint64_t)self->_tableCellFlags;
  if (((tableCellFlags >> 1) & 7) != a3)
  {
    *(_DWORD *)&self->_tableCellFlags = tableCellFlags & 0xFFFFFFF1 | (2 * (a3 & 7));
    -[UITableViewCell _setNeedsSeparatorUpdate](self, "_setNeedsSeparatorUpdate");
  }
}

- (void)_setNeedsAccessoriesUpdate
{
  -[UITableViewCell _setNeedsAccessoriesUpdateForced:](self, "_setNeedsAccessoriesUpdateForced:", 0);
}

- (void)_setNeedsAccessoriesUpdateForced:(BOOL)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  if (a3)
    v3 |= 0x1000000000000000uLL;
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) = v3 | 0x800000000000000;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setNeedsSetup:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (void)_setEditing:(BOOL)a3 animated:(BOOL)a4 cellOrAncestorViewForAnimatedLayout:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  _QWORD v19[6];
  _QWORD aBlock[5];
  id v21;
  BOOL v22;
  _QWORD v23[7];

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if (((((*((_BYTE *)&self->_tableCellFlags + 1) & 1) == 0) ^ v6) & 1) == 0)
  {
    v9 = CFSTR("normal");
    v10 = (*(_DWORD *)&self->_tableCellFlags << 9) & 0x40000000;
    if (v6)
    {
      if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x200) != 0)
      {
        v10 |= 2uLL;
      }
      else
      {
        v10 |= 1uLL;
        v11 = CFSTR("editing");

        v9 = v11;
      }
    }
    v12 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __76__UITableViewCell__setEditing_animated_cellOrAncestorViewForAnimatedLayout___block_invoke;
    v23[3] = &unk_1E16B1888;
    v23[4] = self;
    v23[5] = v10;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v23);
    -[UITableViewCell removeEditingData](self, "removeEditingData");
    -[UITableViewCell _accessoryManager](self, "_accessoryManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCurrentConfigurationIdentifier:", v9);

    aBlock[0] = v12;
    aBlock[1] = 3221225472;
    aBlock[2] = __76__UITableViewCell__setEditing_animated_cellOrAncestorViewForAnimatedLayout___block_invoke_2;
    aBlock[3] = &unk_1E16B4008;
    aBlock[4] = self;
    v22 = v6;
    v21 = v8;
    v14 = _Block_copy(aBlock);
    v15 = v14;
    if (v5)
    {
      *(_QWORD *)((char *)&self->_tableCellFlags + 4) |= 0x200000000uLL;
      -[UITableViewCell _updateContentClip](self, "_updateContentClip");
      -[UITableViewCell _constants](self, "_constants");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "defaultEditAndUpdateAnimationDuration");
      v18 = v17;

      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __76__UITableViewCell__setEditing_animated_cellOrAncestorViewForAnimatedLayout___block_invoke_3;
      v19[3] = &unk_1E16B7A60;
      v19[4] = self;
      v19[5] = v10;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v15, v19, v18, 0.0);
    }
    else
    {
      (*((void (**)(void *))v14 + 2))(v14);
      -[UITableViewCell didTransitionToState:](self, "didTransitionToState:", v10);
    }

  }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
  -[UITableViewCell _setEditing:animated:cellOrAncestorViewForAnimatedLayout:](self, "_setEditing:animated:cellOrAncestorViewForAnimatedLayout:", editing, animated, self);
}

- (void)setWasSwiped:(BOOL)a3
{
  uint64_t v3;
  int v5;
  uint64_t v6;

  v3 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  if (((((v3 & 0x200) == 0) ^ a3) & 1) == 0)
  {
    v5 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    v6 = 512;
    if (!a3)
      v6 = 0;
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v5);
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFFFFFFFFFFFFDFFLL | v6;
    if (-[UITableViewCell _usesModernAccessoriesLayout](self, "_usesModernAccessoriesLayout"))
      -[UITableViewCell _setNeedsAccessoriesUpdate](self, "_setNeedsAccessoriesUpdate");
  }
}

- (void)setEditingStyle:(int64_t)a3
{
  unint64_t tableCellFlags;

  tableCellFlags = (unint64_t)self->_tableCellFlags;
  if (((tableCellFlags >> 12) & 7) != a3)
  {
    *(_DWORD *)&self->_tableCellFlags = tableCellFlags & 0xFFFF8FFF | ((a3 & 7) << 12);
    if ((tableCellFlags & 0x100) != 0)
    {
      -[UITableViewCell removeEditingData](self, "removeEditingData");
      -[UITableViewCell setEditing:animated:](self, "setEditing:animated:", (*(_DWORD *)&self->_tableCellFlags >> 8) & 1, 0);
    }
    -[UITableViewCell _setNeedsAccessoriesUpdate](self, "_setNeedsAccessoriesUpdate");
  }
}

- (void)_setShowsReorderControl:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  int v6;
  uint64_t v7;
  unint64_t v8;

  if (((((*((_BYTE *)&self->_tableCellFlags + 2) & 0x20) == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    v5 = -[UITableViewCell currentStateMask](self, "currentStateMask");
    if (v3)
      v6 = 0x200000;
    else
      v6 = 0;
    v7 = 0x40000000;
    if (!v3)
      v7 = 0;
    v8 = v5 & 0xFFFFFFFFBFFFFFFFLL | v7;
    *(_DWORD *)&self->_tableCellFlags = *(_DWORD *)&self->_tableCellFlags & 0xFFDFFFFF | v6;
    if (-[UITableViewCell _usesModernAccessoriesLayout](self, "_usesModernAccessoriesLayout"))
      -[UITableViewCell _setNeedsAccessoriesUpdate](self, "_setNeedsAccessoriesUpdate");
    -[UITableViewCell _willTransitionToState:](self, "_willTransitionToState:", v8);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UITableViewCell _didTransitionToState:](self, "_didTransitionToState:", v8);
  }
}

- (void)_setShowingDeleteConfirmation:(BOOL)a3
{
  *(_DWORD *)&self->_tableCellFlags = *(_DWORD *)&self->_tableCellFlags & 0xFFFFFFFE | a3;
}

- (void)_setShouldIndentWhileEditing:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0xFFFFFFFFFFFFFFDFLL | v3;
  -[UITableViewCell _setNeedsAccessoriesUpdate](self, "_setNeedsAccessoriesUpdate");
}

- (void)_setMultiselecting:(BOOL)a3
{
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  UIView **p_selectedBackgroundView;
  void *v6;
  void *v7;

  if (a3 && self->_multipleSelectionBackgroundView)
  {
    p_tableCellFlags = &self->_tableCellFlags;
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) |= 0x40000000uLL;
    p_selectedBackgroundView = &self->_selectedBackgroundView;
    -[UIView superview](self->_selectedBackgroundView, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
LABEL_8:
      -[UIView removeFromSuperview](*p_selectedBackgroundView, "removeFromSuperview");
      -[UITableViewCell showSelectedBackgroundView:animated:](self, "showSelectedBackgroundView:animated:", (*(_DWORD *)p_tableCellFlags >> 7) & 1, 0);
      goto LABEL_9;
    }
    if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x40000000) != 0)
      goto LABEL_9;
  }
  else
  {
    p_tableCellFlags = &self->_tableCellFlags;
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) &= ~0x40000000uLL;
  }
  p_selectedBackgroundView = &self->_multipleSelectionBackgroundView;
  -[UIView superview](self->_multipleSelectionBackgroundView, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_8;
LABEL_9:
  -[UITableViewCell _setNeedsAccessoriesUpdate](self, "_setNeedsAccessoriesUpdate");
}

- (void)_setDrawsSeparatorAtTopOfSection:(BOOL)a3
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  if (((((v3 & 0x2000000000) == 0) ^ a3) & 1) == 0)
  {
    v4 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    v5 = 0x2000000000;
    if (!a3)
      v5 = 0;
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v4);
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFFFFFDFFFFFFFFFLL | v5;
    -[UITableViewCell _setNeedsSeparatorUpdate](self, "_setNeedsSeparatorUpdate");
  }
}

- (void)_setDrawsSeparatorAtBottomOfSection:(BOOL)a3
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  if (((((v3 & 0x4000000000) == 0) ^ a3) & 1) == 0)
  {
    v4 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    v5 = 0x4000000000;
    if (!a3)
      v5 = 0;
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v4);
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFFFFFBFFFFFFFFFLL | v5;
    -[UITableViewCell _setNeedsSeparatorUpdate](self, "_setNeedsSeparatorUpdate");
  }
}

- (void)_setShouldHaveFullLengthTopSeparator:(BOOL)a3
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  if (((((v3 & 0x800000000) == 0) ^ a3) & 1) == 0)
  {
    v4 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    v5 = 0x800000000;
    if (!a3)
      v5 = 0;
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v4);
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFFFFFF7FFFFFFFFLL | v5;
    -[UITableViewCell _setNeedsSeparatorUpdate](self, "_setNeedsSeparatorUpdate");
  }
}

- (void)_setTopSeparatorFollowsLayoutMargins:(BOOL)a3
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  if (((((v3 & 0x1000000000) == 0) ^ a3) & 1) == 0)
  {
    v4 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    v5 = 0x1000000000;
    if (!a3)
      v5 = 0;
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v4);
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFFFFFEFFFFFFFFFLL | v5;
    -[UITableViewCell _setNeedsSeparatorUpdate](self, "_setNeedsSeparatorUpdate");
  }
}

- (void)_setShouldHaveFullLengthBottomSeparator:(BOOL)a3
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  if (((((v3 & 0x400000000) == 0) ^ a3) & 1) == 0)
  {
    v4 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    v5 = 0x400000000;
    if (!a3)
      v5 = 0;
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v4);
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFFFFFFBFFFFFFFFLL | v5;
    -[UITableViewCell _setNeedsSeparatorUpdate](self, "_setNeedsSeparatorUpdate");
  }
}

- (void)setAccessoryType:(UITableViewCellAccessoryType)accessoryType
{
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  unint64_t tableCellFlags;
  uint64_t v5;
  UIControl *accessoryView;
  UIControl *v9;
  void *v10;
  UIControl *v11;
  id v12;

  p_tableCellFlags = &self->_tableCellFlags;
  tableCellFlags = (unint64_t)self->_tableCellFlags;
  v5 = (tableCellFlags >> 15) & 7;
  if (v5 == accessoryType)
    return;
  *(_DWORD *)p_tableCellFlags = tableCellFlags & 0xFFFC7FFF | ((accessoryType & 7) << 15);
  if (-[UITableViewCell _usesModernAccessoriesLayout](self, "_usesModernAccessoriesLayout"))
  {
    if (!-[UITableViewCell _updateExpansionButtonFromType:toType:](self, "_updateExpansionButtonFromType:toType:", v5, accessoryType))-[UITableViewCell _setNeedsAccessoriesUpdate](self, "_setNeedsAccessoriesUpdate");
    return;
  }
  accessoryView = self->_accessoryView;
  if ((*(_DWORD *)p_tableCellFlags & 0x38000) != 0)
  {
    if (accessoryView)
    {
      if ((unint64_t)(accessoryType - 5) > 1 || (v5 - 5) > 1)
      {
        if ((unint64_t)(accessoryType - 7) <= 1 && (_DWORD)v5 == 7)
        {
          -[UIControl accessoryButton](self->_accessoryView, "accessoryButton");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITableViewCell _updateExpansionButton:forType:animated:](self, "_updateExpansionButton:forType:animated:", v10, accessoryType, (*(_QWORD *)((char *)p_tableCellFlags + 4) & 0x20000000) == 0);

        }
        else
        {
          -[UIView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
          v11 = self->_accessoryView;
          self->_accessoryView = 0;

        }
      }
      else
      {
        -[UITableViewCell _updateExpansionButton:forType:animated:](self, "_updateExpansionButton:forType:animated:");
      }
    }
    -[UITableViewCell _syncAccessoryViewsIfNecessary](self, "_syncAccessoryViewsIfNecessary");
    if (!-[UITableViewCell isEditing](self, "isEditing"))
      v12 = -[UITableViewCell _accessoryView:](self, "_accessoryView:", 1);
    goto LABEL_22;
  }
  if (accessoryView != self->_editingAccessoryView)
    goto LABEL_14;
  if (!-[UITableViewCell isEditing](self, "isEditing"))
  {
    accessoryView = self->_accessoryView;
LABEL_14:
    -[UIView removeFromSuperview](accessoryView, "removeFromSuperview");
  }
  v9 = self->_accessoryView;
  self->_accessoryView = 0;

LABEL_22:
  if (!-[UITableViewCell isEditing](self, "isEditing"))
    -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_updateExpansionButtonFromType:(int64_t)a3 toType:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  BOOL v17;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[UITableViewCell _accessoryManager](self, "_accessoryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", 0x1E170DE80);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v7, "trailingAccessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("expand"));

      if ((v15 & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    objc_msgSend(v13, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 && (((a4 - 5) | (unint64_t)(a3 - 5)) < 2 || ((a4 - 7) | (unint64_t)(a3 - 7)) <= 1))
    {
      -[UITableViewCell _updateExpansionButton:forType:animated:](self, "_updateExpansionButton:forType:animated:", v16);
      v17 = 1;
      goto LABEL_15;
    }
  }
  else
  {
LABEL_9:

    v16 = 0;
  }
  v17 = 0;
LABEL_15:

  return v17;
}

- (void)_setAccessoryViewsHidden:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = 0x8000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0xFFF7FFFFFFFFFFFFLL | v4;
  -[UITableViewCell editingData:](self, "editingData:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editControl:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

}

- (BOOL)showsReorderControl
{
  return (*((unsigned __int8 *)&self->_tableCellFlags + 2) >> 5) & 1;
}

- (BOOL)wasSwiped
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 9) & 1;
}

- (double)_defaultTrailingCellMarginWidth
{
  return self->_defaultTrailingCellMarginWidth;
}

- (id)_customAccessoryView:(BOOL)a3
{
  return self->_customAccessoryView;
}

double __42__UITableViewCell__updateAccessoryMetrics__block_invoke(uint64_t a1)
{
  double result;
  _BOOL4 v3;
  uint64_t v4;

  result = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (result == -1.79769313e308)
  {
    v3 = _UITableCellSupportsHorizontalCenteringBehaviorForTraitCollection(*(void **)(a1 + 32));
    v4 = 0;
    if (v3)
      objc_msgSend(*(id *)(a1 + 40), "defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:traitCollection:", 0, *(_QWORD *)(a1 + 32), 0.0);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
    return *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  return result;
}

- (id)_createDefaultContentView
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
  double v12;
  double v13;
  double v14;
  double v15;

  if (dyld_program_sdk_at_least())
  {
    -[UIView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
  }
  else
  {
    -[UITableViewCell layoutManager](self, "layoutManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentEndingRectForCell:forNewEditingState:", self, -[UITableViewCell isEditing](self, "isEditing"));
    v4 = v12;
    v6 = v13;
    v8 = v14;
    v10 = v15;

  }
  return -[UITableViewCellContentView initWithFrame:]([UITableViewCellContentView alloc], "initWithFrame:", v4, v6, v8, v10);
}

- (void)_setupTableViewCellCommon
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __int16 v15;
  id obj[2];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_ensureInitializeSystemAppearanceModifications");
  -[UITableViewCell setSelectionFadeDuration:](self, "setSelectionFadeDuration:", 0.5);
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_separatorInset.top = _Q0;
  *(_OWORD *)&self->_separatorInset.bottom = _Q0;
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) |= 0x800020000000uLL;
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  *(_OWORD *)obj = 0u;
  v17 = 0u;
  -[UITableViewCell _constants](self, "_constants", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v8, "defaultCellBackgroundPropertiesForTableViewStyle:state:traitCollection:", v9 & 0x1F, v10, v11);
  }
  else
  {
    v24 = 0;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    *(_OWORD *)obj = 0u;
    v17 = 0u;
  }

  objc_storeStrong((id *)&self->_selectionTintColor, obj[1]);
  v12 = (id)v17;
  v13 = v12;
  if (v12)
  {
    v25[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  objc_storeStrong((id *)&self->_selectionEffects, v14);
  if (v13)

  *(_DWORD *)&self->_tableCellFlags = *(_DWORD *)&self->_tableCellFlags & 0xC7FFFFFF | 0x20000000;
  if ((dyld_program_sdk_at_least() & 1) == 0)
    -[UITableViewCell setClipsToBounds:](self, "setClipsToBounds:", 1);
  if (dyld_program_sdk_at_least())
    -[UIView _setHostsLayoutEngine:](self, "_setHostsLayoutEngine:", 1);
  -[UIView setEdgesPreservingSuperviewLayoutMargins:](self, "setEdgesPreservingSuperviewLayoutMargins:", 10, obj[0]);
  -[UIView setEdgesInsettingLayoutMarginsFromSafeArea:](self, "setEdgesInsettingLayoutMarginsFromSafeArea:", -[UIView edgesInsettingLayoutMarginsFromSafeArea](self, "edgesInsettingLayoutMarginsFromSafeArea") & 0xA);
  v15 = *((_WORD *)&self->_tableCellFlags + 6);
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) |= 0x400000000000000uLL;
  *((_WORD *)&self->_tableCellFlags + 6) = v15 | 0xC020;
  -[UITableViewCell _updateDefaultIndentationWidth](self, "_updateDefaultIndentationWidth");

  __destructor_8_s8_s16_s24_s80(obj);
}

- (void)_setIndentationWidth:(double)a3
{
  if (self->_indentationWidth != a3)
  {
    self->_indentationWidth = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSelectionFadeDuration:(double)a3
{
  self->_selectionFadeDuration = a3;
}

+ (void)_ensureInitializeSystemAppearanceModifications
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__UITableViewCell__ensureInitializeSystemAppearanceModifications__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_ensureInitializeSystemAppearanceModifications_onceToken != -1)
    dispatch_once(&_ensureInitializeSystemAppearanceModifications_onceToken, block);
}

- (void)_updateDefaultIndentationWidth
{
  void *v3;
  double v4;
  double v5;

  if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x2000) == 0)
  {
    -[UITableViewCell _constants](self, "_constants");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultIndentationWidthForSidebarStyle:", 0);
    v5 = v4;

    -[UITableViewCell _setIndentationWidth:](self, "_setIndentationWidth:", v5);
  }
}

- (UITableViewCell)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  __int16 v4;
  NSString *v6;
  UITableViewCell *v7;
  UITableViewCell *v8;
  objc_class *v9;
  IMP MethodImplementation;
  objc_class *v11;
  BOOL v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *v17;
  NSTimer *deselectTimer;
  objc_super v20;

  v4 = style;
  v6 = reuseIdentifier;
  v20.receiver = self;
  v20.super_class = (Class)UITableViewCell;
  v7 = -[UIView initWithFrame:](&v20, sel_initWithFrame_, 0.0, 0.0, 320.0, 44.0);
  v8 = v7;
  if (v7)
  {
    -[UITableViewCell _setupTableViewCellCommon](v7, "_setupTableViewCellCommon");
    *(_QWORD *)((char *)&v8->_tableCellFlags + 4) = *(_QWORD *)((char *)&v8->_tableCellFlags + 4) & 0xFFFFFFFFFC003FFFLL | ((unint64_t)(v4 & 0xFFF) << 14);
    v9 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v9, sel__drawContentInRect_selected_);
    v11 = (objc_class *)objc_opt_class();
    v12 = MethodImplementation != class_getMethodImplementation(v11, sel__drawContentInRect_selected_);
    v13 = *(_QWORD *)((char *)&v8->_tableCellFlags + 4);
    *(_QWORD *)((char *)&v8->_tableCellFlags + 4) = v13 & 0xFFFFFFFFFFFFEFFFLL | ((unint64_t)v12 << 12);
    +[UITableViewCellLayoutManager layoutManagerForTableViewCellStyle:](UITableViewCellLayoutManager, "layoutManagerForTableViewCellStyle:", (v13 >> 14) & 0xFFF);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell setLayoutManager:](v8, "setLayoutManager:", v14);

    if ((*(_QWORD *)((char *)&v8->_tableCellFlags + 4) & 0x1000) == 0
      && (dyld_program_sdk_at_least() & 1) == 0
      && !v8->_contentView)
    {
      -[UITableViewCell _createDefaultContentView](v8, "_createDefaultContentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCell _setContentView:](v8, "_setContentView:", v15);

    }
    -[UITableViewCell _setupModernAccessoriesLayout](v8, "_setupModernAccessoriesLayout");
    *(_DWORD *)&v8->_tableCellFlags = *(_DWORD *)&v8->_tableCellFlags & 0xFFFFFF81 | 0x32;
    v16 = -[NSString copy](v6, "copy");
    v17 = v8->_reuseIdentifier;
    v8->_reuseIdentifier = (NSString *)v16;

    v8->_returnAction = 0;
    -[UIView setNeedsDisplayOnBoundsChange:](v8, "setNeedsDisplayOnBoundsChange:", 1);
    *(_QWORD *)((char *)&v8->_tableCellFlags + 4) |= 0x800uLL;
    v8->_textFieldOffset = 114.0;
    deselectTimer = v8->_deselectTimer;
    v8->_deselectTimer = 0;

    *(_QWORD *)((char *)&v8->_tableCellFlags + 4) &= 0xFFF8FFFFFFFFFFFFLL;
  }

  return v8;
}

- (BOOL)_canDrawContent
{
  objc_super v3;

  if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x1000) != 0)
    return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x2000) == 0;
  v3.receiver = self;
  v3.super_class = (Class)UITableViewCell;
  return -[UIView _canDrawContent](&v3, sel__canDrawContent);
}

- (void)_updateAccessoryMetrics
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  id v19;
  _QWORD v20[4];
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  id location;

  -[UITableViewCell _accessoryManager](self, "_accessoryManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UITableViewCell _effectiveSafeAreaInsets](self, "_effectiveSafeAreaInsets");
    objc_msgSend(v3, "setSafeAreaInsets:");
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell _constants](self, "_constants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v6 = MEMORY[0x1E0C809B0];
    v25[3] = 0xFFEFFFFFFFFFFFFFLL;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __42__UITableViewCell__updateAccessoryMetrics__block_invoke;
    v21[3] = &unk_1E16E36C0;
    v24 = v25;
    v7 = v4;
    v22 = v7;
    v8 = v5;
    v23 = v8;
    objc_msgSend(v3, "setStandardLayoutWidthProvider:", v21);
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v20[3] = 0xFFEFFFFFFFFFFFFFLL;
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __42__UITableViewCell__updateAccessoryMetrics__block_invoke_2;
    v16[3] = &unk_1E16BC378;
    v18 = v20;
    v9 = v8;
    v17 = v9;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v3, "setDisclosureLayoutWidthProvider:", v16);
    objc_msgSend(v3, "leadingLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __42__UITableViewCell__updateAccessoryMetrics__block_invoke_3;
    v14[3] = &unk_1E16BC300;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v10, "setSpacingBlock:", v14);
    objc_msgSend(v3, "trailingLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __42__UITableViewCell__updateAccessoryMetrics__block_invoke_4;
    v12[3] = &unk_1E16BC300;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v11, "setSpacingBlock:", v12);
    objc_destroyWeak(&v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v19);

    _Block_object_dispose(v20, 8);
    _Block_object_dispose(v25, 8);
    objc_destroyWeak(&location);

  }
}

- (void)setLayoutManager:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_layoutManager != v5)
  {
    v6 = v5;
    objc_storeStrong(&self->_layoutManager, a3);
    if (objc_msgSend((id)objc_opt_class(), "requiresLegacyLayout"))
      -[UITableViewCell _setUsesModernAccessoriesLayout:](self, "_setUsesModernAccessoriesLayout:", 0);
    else
      -[UITableViewCell _setupModernAccessoriesLayout](self, "_setupModernAccessoriesLayout");
    v5 = v6;
  }

}

- (void)_setupModernAccessoriesLayout
{
  -[UITableViewCell _setUsesModernAccessoriesLayout:](self, "_setUsesModernAccessoriesLayout:", 1);
}

- (void)_setUsesModernAccessoriesLayout:(BOOL)a3
{
  _BOOL4 v3;
  UITableCellAccessoryLayout *v5;
  UITableCellAccessoryLayout *v6;
  UICellAccessoryManager *v7;

  v3 = a3;
  if (-[UITableViewCell _usesModernAccessoriesLayout](self, "_usesModernAccessoriesLayout") != a3)
  {
    if (v3)
    {
      v7 = -[UICellAccessoryManager initWithContainerView:]([UICellAccessoryManager alloc], "initWithContainerView:", self);
      -[UICellAccessoryManager setCurrentConfigurationIdentifier:](v7, "setCurrentConfigurationIdentifier:", 0x1E170DE80);
      v5 = objc_alloc_init(UITableCellAccessoryLayout);
      -[UICellAccessoryManager setLeadingLayout:](v7, "setLeadingLayout:", v5);

      v6 = objc_alloc_init(UITableCellAccessoryLayout);
      -[UICellAccessoryManager setTrailingLayout:](v7, "setTrailingLayout:", v6);

      -[UITableViewCell _setAccessoryManager:](self, "_setAccessoryManager:", v7);
    }
    else
    {
      -[UITableViewCell _setAccessoryManager:](self, "_setAccessoryManager:", 0);
    }
  }
}

- (void)_setAccessoryManager:(id)a3
{
  UICellAccessoryManager *v5;
  UICellAccessoryManager *v6;

  v5 = (UICellAccessoryManager *)a3;
  if (self->_accessoryManager != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_accessoryManager, a3);
    v5 = v6;
    if (v6)
    {
      -[UITableViewCell _updateAccessoryMetrics](self, "_updateAccessoryMetrics");
      -[UITableViewCell _setNeedsAccessoriesUpdate](self, "_setNeedsAccessoriesUpdate");
      v5 = v6;
    }
    else
    {
      *(_QWORD *)((char *)&self->_tableCellFlags + 4) &= ~0x800000000000000uLL;
    }
  }

}

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier
{
  return -[UITableViewCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, reuseIdentifier, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
}

- (UITableViewCell)initWithFrame:(CGRect)a3
{
  return -[UITableViewCell initWithFrame:reuseIdentifier:](self, "initWithFrame:reuseIdentifier:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)willMoveToSuperview:(id)a3
{
  UITable_UITableViewCellDelegate **p_tableView;
  id v5;
  id WeakRetained;
  objc_super v7;

  p_tableView = &self->_tableView;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_tableView);
  -[UIControl removeTarget:action:forControlEvents:](self->_accessoryView, "removeTarget:action:forControlEvents:", WeakRetained, 0, 64);
  -[UIControl removeTarget:action:forControlEvents:](self->_editingAccessoryView, "removeTarget:action:forControlEvents:", WeakRetained, 0, 64);
  v7.receiver = self;
  v7.super_class = (Class)UITableViewCell;
  -[UIView willMoveToSuperview:](&v7, sel_willMoveToSuperview_, v5);

}

- (void)_contentViewLabelTextDidChange:(id)a3
{
  UILabel *v4;
  void *v5;
  void *v6;
  void *v7;
  UILabel *v8;

  v4 = (UILabel *)a3;
  if (self->_detailTextLabel == v4 || self->_textLabel == v4)
  {
    v8 = v4;
    if (v4)
    {
      -[UIView superview](v4, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCell contentView](self, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 != v6)
      {
        -[UITableViewCell contentView](self, "contentView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addSubview:", v8);

      }
    }
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    v4 = v8;
  }

}

uint64_t __52__UITableViewCell__resetBackgroundViewConfiguration__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundConfiguration:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_setBackgroundViewConfigurationProvider:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_setBackgroundViewConfiguration:", 0);
}

- (void)setBackgroundConfiguration:(UIBackgroundConfiguration *)backgroundConfiguration
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_tableCellFlags + 6) & 0xEFFF | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
  v4 = ((unint64_t)backgroundConfiguration | *((_WORD *)&self->_tableCellFlags + 6) & 0x1000) != 0;
  *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v3);
  *((_WORD *)&self->_tableCellFlags + 6) = v3 | (v4 << 12);
  -[UITableViewCell _applyBackgroundViewConfiguration:withState:](self, "_applyBackgroundViewConfiguration:withState:");
}

- (void)_setBackgroundViewConfigurationProvider:(id)a3
{
  uint64_t v3;
  int v4;
  id v6;
  void *v7;
  id backgroundViewConfigurationProvider;

  v3 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  v4 = *((_WORD *)&self->_tableCellFlags + 6) & 0xF7FF | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16) | ((((unint64_t)a3 | *((_WORD *)&self->_tableCellFlags + 6) & 0x800) != 0) << 11);
  *((_BYTE *)&self->_tableCellFlags + 14) = *((_BYTE *)&self->_tableCellFlags + 14);
  *((_WORD *)&self->_tableCellFlags + 6) = v4;
  if (self->_backgroundViewConfigurationProvider != a3)
  {
    if (a3)
    {
      *(_QWORD *)((char *)&self->_tableCellFlags + 4) = v3;
      *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v4);
      *((_WORD *)&self->_tableCellFlags + 6) = v4 & 0x7FFF;
    }
    v6 = a3;
    v7 = (void *)objc_msgSend(v6, "copy");
    backgroundViewConfigurationProvider = self->_backgroundViewConfigurationProvider;
    self->_backgroundViewConfigurationProvider = v7;

    -[UITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)selectedBackgroundView
{
  if (!-[UITableViewCell _usingBackgroundConfigurationOrDefaultBackgroundConfiguration](self, "_usingBackgroundConfigurationOrDefaultBackgroundConfiguration"))-[UITableViewCell _setupSelectedBackgroundView](self, "_setupSelectedBackgroundView");
  return self->_selectedBackgroundView;
}

- (void)_setTableView:(id)a3
{
  int v3;

  v3 = *((_WORD *)&self->_tableCellFlags + 6) & 0xFFFD | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
  *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6) & 0xFFFD | (2 * (a3 != 0));
  *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v3);
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (void)_setHiddenForReuse:(BOOL)a3
{
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITableViewCell;
  -[UIView _setHiddenForReuse:](&v7, sel__setHiddenForReuse_);
  if (!a3)
  {
    v5 = -[UIView superview](self, "superview");
    if (v5)
    {
      v6 = v5;
      do
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
          -[UITableViewCell _updateCellMaskViewsForView:backdropView:](self, "_updateCellMaskViewsForView:backdropView:", self, v6);
        }
        v6 = (id)objc_msgSend(v6, "superview");
      }
      while (v6);
    }
  }
}

- (void)_setIndexBarExtentFromEdge:(double)a3
{
  if (self->_indexBarExtentFromEdge != a3)
  {
    self->_indexBarExtentFromEdge = a3;
    -[UITableViewCell _setNeedsSeparatorUpdate](self, "_setNeedsSeparatorUpdate");
    -[UITableViewCell _updateAccessoryMetrics](self, "_updateAccessoryMetrics");
  }
}

- (void)setTableViewStyle:(int64_t)a3
{
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  uint64_t v6;
  int64_t v7;
  int v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  _QWORD v12[5];

  p_tableCellFlags = &self->_tableCellFlags;
  v6 = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x1FLL;
  v7 = -[UITableViewCell _contentViewListStyleFromTableViewStyle:](self, "_contentViewListStyleFromTableViewStyle:", v6);
  if (v6 == a3 || a3 && v6)
  {
    v8 = 0;
  }
  else
  {
    -[UITableViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
    v8 = 1;
  }
  -[UITableViewCell _usesRoundedGroups](self, "_usesRoundedGroups");
  v9 = *(_QWORD *)((char *)p_tableCellFlags + 4);
  *(_QWORD *)((char *)p_tableCellFlags + 4) = v9 & 0xFFFFFFFFFFFFFFE0 | a3 & 0x1F;
  if ((v9 & 0x10000000) == 0
    && !-[UITableViewCell _usingBackgroundConfigurationOrDefaultBackgroundConfiguration](self, "_usingBackgroundConfigurationOrDefaultBackgroundConfiguration"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __37__UITableViewCell_setTableViewStyle___block_invoke;
    v12[3] = &unk_1E16B1B28;
    v12[4] = self;
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v12);
  }
  if (v6 != (*(_QWORD *)((char *)p_tableCellFlags + 4) & 0x1FLL)
    || !-[UITableViewCell _usingBackgroundViewConfiguration](self, "_usingBackgroundViewConfiguration"))
  {
    -[UITableViewCell _updateDefaultBackgroundAppearance](self, "_updateDefaultBackgroundAppearance");
  }
  v10 = -[UITableViewCell _contentViewListStyleFromTableViewStyle:](self, "_contentViewListStyleFromTableViewStyle:", a3);
  if (v7 != v10)
  {
    v11 = v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIView _containingListStyleUpdated:](self->_contentView, "_containingListStyleUpdated:", v11);
  }
  -[UITableViewCell _updateContentClip](self, "_updateContentClip");
  if (v8)
    -[UITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (int64_t)_contentViewListStyleFromTableViewStyle:(int64_t)a3
{
  int64_t v3;
  unint64_t v4;
  NSObject *v5;
  NSObject *v7;
  int v8;
  int64_t v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 >= 3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v8 = 134217984;
        v9 = v3;
        _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "Unhandled UITableViewStyle (%ld)", (uint8_t *)&v8, 0xCu);
      }

    }
    else
    {
      v4 = _contentViewListStyleFromTableViewStyle____s_category;
      if (!_contentViewListStyleFromTableViewStyle____s_category)
      {
        v4 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v4, (unint64_t *)&_contentViewListStyleFromTableViewStyle____s_category);
      }
      v5 = *(NSObject **)(v4 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v8 = 134217984;
        v9 = v3;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Unhandled UITableViewStyle (%ld)", (uint8_t *)&v8, 0xCu);
      }
    }
    return -1;
  }
  return v3;
}

- (void)_updateDefaultBackgroundAppearance
{
  __int16 v3;
  int v4;
  unsigned int v5;
  void *v6;
  int v7;
  unsigned int v8;
  id v9;
  _QWORD v10[5];
  id v11;

  if (dyld_program_sdk_at_least())
  {
    v3 = *((_WORD *)&self->_tableCellFlags + 6);
    if ((v3 & 0x1800) == 0)
    {
      if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x780) != 0)
      {
        if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x100) == 0)
        {
          -[UITableViewCell _setupBackgroundView](self, "_setupBackgroundView");
          v3 = *((_WORD *)&self->_tableCellFlags + 6) & 0xFEFF;
          *((_WORD *)&self->_tableCellFlags + 6) = v3;
        }
        if ((v3 & 0x200) == 0)
        {
          -[UITableViewCell _setupSelectedBackgroundView](self, "_setupSelectedBackgroundView");
          v4 = *((unsigned __int16 *)&self->_tableCellFlags + 6);
          v5 = v4 & 0xFFFFFDFF | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
          *((_WORD *)&self->_tableCellFlags + 6) = v4 & 0xFDFF;
          *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v5);
        }
      }
      else
      {
        -[UITableViewCell _defaultBackgroundConfiguration](self, "_defaultBackgroundConfiguration");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __53__UITableViewCell__updateDefaultBackgroundAppearance__block_invoke;
        v10[3] = &unk_1E16B1B50;
        v10[4] = self;
        v11 = v6;
        v9 = v6;
        +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v10);
        v7 = *((unsigned __int16 *)&self->_tableCellFlags + 6);
        v8 = v7 & 0xFFFFEFFF | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
        *((_WORD *)&self->_tableCellFlags + 6) = v7 & 0xEFFF;
        *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v8);

      }
    }
  }
}

- (void)_setConstants:(id)a3
{
  UITableConstants *v5;
  UITableConstants *v6;

  v5 = (UITableConstants *)a3;
  if (self->_constants != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_constants, a3);
    -[UITableViewCell _updateContentClip](self, "_updateContentClip");
    -[UITableViewCell _updateAccessoryMetrics](self, "_updateAccessoryMetrics");
    -[UITableViewCell _updateDefaultBackgroundAppearance](self, "_updateDefaultBackgroundAppearance");
    -[UITableViewCell _updateDefaultIndentationWidth](self, "_updateDefaultIndentationWidth");
    v5 = v6;
  }

}

- (void)setNeedsUpdateConfiguration
{
  if (dyld_program_sdk_at_least())
  {
    *((_WORD *)&self->_tableCellFlags + 6) |= 0x20u;
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      -[UITableViewCell _performConfigurationStateUpdate](self, "_performConfigurationStateUpdate");
    }
    else
    {
      -[UIView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)_setRawLayoutMargins:(UIEdgeInsets)a3
{
  objc_super v4;

  if (self->_extraLeadingLayoutMarginForIndentation > 0.0)
    -[UITableViewCell _adjustedRawLayoutMargins:withLeadingLayoutMarginAdjustment:](self, "_adjustedRawLayoutMargins:withLeadingLayoutMarginAdjustment:", a3.top, a3.left, a3.bottom, a3.right);
  v4.receiver = self;
  v4.super_class = (Class)UITableViewCell;
  -[UIView _setRawLayoutMargins:](&v4, sel__setRawLayoutMargins_);
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITableViewCell;
  -[UIView setSemanticContentAttribute:](&v7, sel_setSemanticContentAttribute_);
  -[UIView setSemanticContentAttribute:](self->_contentView, "setSemanticContentAttribute:", a3);
  -[UITableViewCell _existingSystemAccessoryView:](self, "_existingSystemAccessoryView:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSemanticContentAttribute:", a3);

  -[UITableViewCell _existingSystemAccessoryView:](self, "_existingSystemAccessoryView:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSemanticContentAttribute:", a3);

}

- (id)_existingSystemAccessoryView:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  if (-[UITableViewCell _usesModernAccessoriesLayout](self, "_usesModernAccessoriesLayout"))
  {
    v5 = 49;
    if (v3)
      v5 = 60;
    v6 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___UITableViewCellSelectedBackground__multiselect[v5]));
    if (v6)
    {
      v7 = 0;
    }
    else
    {
      if (v3)
        -[UITableViewCell _editingAccessoryView:](self, "_editingAccessoryView:", 0);
      else
        -[UITableViewCell _accessoryView:](self, "_accessoryView:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return v7;
  }
  else
  {
    v8 = 51;
    if (v3)
      v8 = 52;
    return objc_autoreleaseReturnValue(objc_retain(*(id *)((char *)&self->super.super.super.isa
                                                         + OBJC_IVAR___UITableViewCellSelectedBackground__multiselect[v8])));
  }
}

- (id)_editingAccessoryView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIView *v10;
  UIView *customEditingAccessoryView;
  UIControl **p_editingAccessoryView;
  unsigned int tableCellFlags;
  int v14;
  UIControl *accessoryView;
  UIControl *v17;
  UIControl *v18;

  v3 = a3;
  if (-[UITableViewCell _usesModernAccessoriesLayout](self, "_usesModernAccessoriesLayout"))
  {
    -[UITableViewCell _accessoryManager](self, "_accessoryManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configurations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", 0x1E1772080);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "trailingAccessories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "view");
    v10 = (UIView *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    customEditingAccessoryView = self->_customEditingAccessoryView;
    if (!customEditingAccessoryView)
    {
      p_editingAccessoryView = &self->_editingAccessoryView;
      if (!self->_editingAccessoryView)
      {
        tableCellFlags = self->_tableCellFlags;
        v14 = (tableCellFlags >> 18) & 7;
        if (v14 && v3)
        {
          if (((tableCellFlags >> 15) & 7) == v14 && (accessoryView = self->_accessoryView) != 0)
          {
            objc_storeStrong((id *)&self->_editingAccessoryView, accessoryView);
          }
          else
          {
            v17 = -[UITableViewCell _newAccessoryView:](self, "_newAccessoryView:", 1);
            v18 = *p_editingAccessoryView;
            *p_editingAccessoryView = v17;

            if ((*((_BYTE *)&self->_tableCellFlags + 1) & 1) != 0)
              -[UIView addSubview:](self, "addSubview:", *p_editingAccessoryView);
          }
        }
      }
      customEditingAccessoryView = (UIView *)*p_editingAccessoryView;
    }
    v10 = customEditingAccessoryView;
  }
  return v10;
}

- (void)_setBackgroundInset:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  _BOOL4 v8;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v8 = -[UITableViewCell _usesRoundedGroups](self, "_usesRoundedGroups");
  self->_backgroundInset.top = top;
  self->_backgroundInset.left = left;
  self->_backgroundInset.bottom = bottom;
  self->_backgroundInset.right = right;
  if (v8 != -[UITableViewCell _usesRoundedGroups](self, "_usesRoundedGroups"))
  {
    -[UITableViewCell _setSectionLocation:animated:forceBackgroundSetup:](self, "_setSectionLocation:animated:forceBackgroundSetup:", *((_BYTE *)&self->_tableCellFlags + 3) & 7, 0, 1);
    -[UIView _updateInferredLayoutMargins](self, "_updateInferredLayoutMargins");
  }
}

- (void)setSectionBorderColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_sectionBorderColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_sectionBorderColor, a3);
    v5 = v6;
  }

}

- (void)_setSeparatorInsetIsRelativeToCellEdges:(BOOL)a3
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  if (((((v3 & 0x20000000000000) == 0) ^ a3) & 1) == 0)
  {
    v4 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    v5 = 0x20000000000000;
    if (!a3)
      v5 = 0;
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v4);
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFDFFFFFFFFFFFFFLL | v5;
    -[UITableViewCell _setNeedsSeparatorUpdate](self, "_setNeedsSeparatorUpdate");
  }
}

- (void)_setSeparatorEffect:(id)a3
{
  UIVisualEffect *v5;
  UIVisualEffect **p_separatorEffect;
  UIColor *separatorColor;
  UIVisualEffect *v8;

  v5 = (UIVisualEffect *)a3;
  p_separatorEffect = &self->_separatorEffect;
  if (self->_separatorEffect != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_separatorEffect, a3);
    -[_UITableViewCellSeparatorView setSeparatorEffect:](self->_separatorView, "setSeparatorEffect:", *p_separatorEffect);
    -[_UITableViewCellSeparatorView setSeparatorEffect:](self->_topSeparatorView, "setSeparatorEffect:", *p_separatorEffect);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIView setBackgroundColor:](self->_separatorView, "setBackgroundColor:", 0);
      separatorColor = 0;
    }
    else
    {
      -[UIView setBackgroundColor:](self->_separatorView, "setBackgroundColor:", self->_separatorColor);
      separatorColor = self->_separatorColor;
    }
    -[UIView setBackgroundColor:](self->_topSeparatorView, "setBackgroundColor:", separatorColor);
    v5 = v8;
  }

}

- (void)_setInsetsContentViewsToSafeArea:(BOOL)a3
{
  uint64_t v3;
  int v5;
  uint64_t v6;

  v3 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  if (((((v3 & 0x400000000000000) == 0) ^ a3) & 1) == 0)
  {
    v5 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    v6 = 0x400000000000000;
    if (!a3)
      v6 = 0;
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v5);
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFBFFFFFFFFFFFFFFLL | v6;
    -[UITableViewCell _setNeedsSeparatorUpdate](self, "_setNeedsSeparatorUpdate");
    -[UITableViewCell _updateAccessoryMetrics](self, "_updateAccessoryMetrics");
  }
}

- (void)_setDefaultTrailingCellMarginWidth:(double)a3
{
  if (self->_defaultTrailingCellMarginWidth != a3)
  {
    self->_defaultTrailingCellMarginWidth = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UITableViewCell _updateAccessoryMetrics](self, "_updateAccessoryMetrics");
  }
}

- (void)_setDefaultLeadingMarginWidth:(double)a3
{
  if (self->_defaultLeadingMarginWidth != a3)
  {
    self->_defaultLeadingMarginWidth = a3;
    -[UITableViewCell _setNeedsSeparatorUpdate](self, "_setNeedsSeparatorUpdate");
  }
}

- (void)_setDefaultBackgroundColor:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x10000000) == 0)
  {
    v10 = v4;
    v5 = -[UITableViewCell _usingBackgroundConfigurationOrDefaultBackgroundConfiguration](self, "_usingBackgroundConfigurationOrDefaultBackgroundConfiguration");
    v4 = v10;
    if (!v5)
    {
      -[UITableViewCell backgroundColor](self, "backgroundColor");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v10;
      v8 = v7;
      if (v6 == v7)
      {

      }
      else
      {
        if (v7 && v6)
        {
          v9 = objc_msgSend(v6, "isEqual:", v7);

          v4 = v10;
          if ((v9 & 1) != 0)
            goto LABEL_12;
        }
        else
        {

        }
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __46__UITableViewCell__setDefaultBackgroundColor___block_invoke;
        v11[3] = &unk_1E16B1B50;
        v11[4] = self;
        v12 = v8;
        +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v11);

      }
      v4 = v10;
    }
  }
LABEL_12:

}

- (void)_setAutomaticIntrinsicContentSizeInvalidationEnabled:(BOOL)a3
{
  unsigned int v3;
  int v4;
  UIView *contentView;
  $1DC6EB69857CC9E7E7608875A7943F0A *p_viewFlags;
  uint64_t v7;

  v3 = (*((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16)) & 0xFFEFFFFF;
  if (a3)
    v4 = 0x100000;
  else
    v4 = 0;
  *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
  *((_BYTE *)&self->_tableCellFlags + 14) = (v3 | v4) >> 16;
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

- (void)_setAllowsReorderingWhenNotEditing:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (int64_t)_separatorBackdropOverlayBlendMode
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 39) & 7;
}

- (void)_prepareToSetDefaultLayoutMargins
{
  double extraLeadingLayoutMarginForIndentation;

  extraLeadingLayoutMarginForIndentation = self->_extraLeadingLayoutMarginForIndentation;
  self->_extraLeadingLayoutMarginForIndentation = 0.0;
  if (extraLeadingLayoutMarginForIndentation != 0.0)
    -[UITableViewCell _applyLeadingLayoutMarginAdjustment:](self, "_applyLeadingLayoutMarginAdjustment:", -extraLeadingLayoutMarginForIndentation);
}

- (void)_setSelectionGrouping:(int)a3
{
  unsigned int tableCellFlags;
  void *v5;
  void *v6;

  tableCellFlags = self->_tableCellFlags;
  if (((tableCellFlags >> 27) & 7) != a3)
  {
    *(_DWORD *)&self->_tableCellFlags = tableCellFlags & 0xC7FFFFFF | ((a3 & 7) << 27);
    -[_UISystemBackgroundView configuration](self->_systemBackgroundView, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      -[UITableViewCell _applyBackgroundViewConfiguration:withState:](self, "_applyBackgroundViewConfiguration:withState:", v5, 0);
      v5 = v6;
    }

  }
}

- (void)setSelected:(BOOL)selected
{
  -[UITableViewCell setSelected:animated:](self, "setSelected:animated:", selected, 0);
}

- (void)setHighlighted:(BOOL)highlighted
{
  -[UITableViewCell setHighlighted:animated:](self, "setHighlighted:animated:", highlighted, 0);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  _BOOL8 v4;
  _BOOL8 v5;
  NSTimer *deselectTimer;
  CFAbsoluteTime Current;
  int v9;
  double v10;
  NSTimer *v11;
  NSTimer *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;

  v4 = animated;
  v5 = selected;
  if (selected)
  {
    if (!-[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
      return;
    if (self->_deselectTimer)
    {
      self->_lastSelectionTime = 0.0;
      -[UITableViewCell _delayedDeselect](self, "_delayedDeselect");
    }
  }
  if (((*(_BYTE *)&self->_tableCellFlags & 0x80) == 0) == v5)
  {
    -[NSTimer invalidate](self->_deselectTimer, "invalidate");
    deselectTimer = self->_deselectTimer;
    self->_deselectTimer = 0;

    Current = CFAbsoluteTimeGetCurrent();
    if (v5)
    {
      self->_lastSelectionTime = Current;
      if ((*(_BYTE *)&self->_tableCellFlags & 0x70) != 0)
      {
        if (!-[UITableViewCell _usingBackgroundConfigurationOrDefaultBackgroundConfiguration](self, "_usingBackgroundConfigurationOrDefaultBackgroundConfiguration"))-[UITableViewCell _setupSelectedBackgroundView](self, "_setupSelectedBackgroundView");
        v9 = 128;
LABEL_16:
        -[UITableViewCell _cancelInternalPerformRequests](self, "_cancelInternalPerformRequests");
        -[UITableViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
        *(_DWORD *)&self->_tableCellFlags = *(_DWORD *)&self->_tableCellFlags & 0xFFFFFF7F | v9;
        -[UITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
        -[UITableViewCell showSelectedBackgroundView:animated:](self, "showSelectedBackgroundView:animated:", -[UITableViewCell _shouldUseHighlightedOrSelectedAppearance](self, "_shouldUseHighlightedOrSelectedAppearance"), v4);
        -[UITableViewCell editingData:](self, "editingData:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "editControl:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setSelected:", v5);

        goto LABEL_19;
      }
      v13 = 128;
    }
    else
    {
      if (!v4)
      {
        v10 = Current - self->_lastSelectionTime;
        if (v10 < 0.1 && v10 >= 0.0)
        {
          objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__delayedDeselect, 0, 0, 0.1 - v10);
          v11 = (NSTimer *)objc_claimAutoreleasedReturnValue();
          v12 = self->_deselectTimer;
          self->_deselectTimer = v11;

          objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
          v16 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addTimer:forMode:", self->_deselectTimer, *MEMORY[0x1E0C99860]);

          return;
        }
      }
      v9 = 0;
      v13 = 0;
      if ((*(_BYTE *)&self->_tableCellFlags & 0x70) != 0)
        goto LABEL_16;
    }
    -[UITableViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
    *(_DWORD *)&self->_tableCellFlags = *(_DWORD *)&self->_tableCellFlags & 0xFFFFFF7F | v13;
    -[UITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
LABEL_19:
    -[UITableViewCell _updateFloatingContentControlStateAnimated:](self, "_updateFloatingContentControlStateAnimated:", v4);
    if (-[UIView isFocused](self, "isFocused"))
    {
      if (+[UIFocusRingManager focusRingAvailable](UIFocusRingManager, "focusRingAvailable"))
        +[UIFocusRingManager _updateActiveFocusLayers](UIFocusRingManager, "_updateActiveFocusLayers");
    }
  }
}

- (void)_setDragState:(int64_t)a3
{
  if (self->_dragState != a3)
  {
    self->_dragState = a3;
    -[UITableViewCell _updateUserInteractionEnabledForNewDragState:](self, "_updateUserInteractionEnabledForNewDragState:");
    -[UITableViewCell dragStateDidChange:](self, "dragStateDidChange:", a3);
  }
}

- (void)_setDrawsTopSeparator:(BOOL)a3
{
  int tableCellFlags;
  int v4;

  tableCellFlags = (int)self->_tableCellFlags;
  if (((((tableCellFlags & 0x400000) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 0x400000;
    else
      v4 = 0;
    *(_DWORD *)&self->_tableCellFlags = tableCellFlags & 0xFFBFFFFF | v4;
    -[UITableViewCell _setNeedsSeparatorUpdate](self, "_setNeedsSeparatorUpdate");
  }
}

- (void)setSeparatorColor:(id)a3
{
  UIColor *v5;
  UIColor **p_separatorColor;
  UIColor *v7;
  void *v8;
  UIColor *v9;
  void *v10;
  UIColor *v11;

  v5 = (UIColor *)a3;
  p_separatorColor = &self->_separatorColor;
  if (self->_separatorColor != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_separatorColor, a3);
    -[UITableViewCell _setNeedsSeparatorUpdate](self, "_setNeedsSeparatorUpdate");
    v7 = *p_separatorColor;
    +[UIColor tableSeparatorDarkColor](UIColor, "tableSeparatorDarkColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIColor isEqual:](v7, "isEqual:", v8))
    {

LABEL_6:
      v5 = v11;
      goto LABEL_7;
    }
    v9 = *p_separatorColor;
    +[UIColor tableSeparatorLightColor](UIColor, "tableSeparatorLightColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = -[UIColor isEqual:](v9, "isEqual:", v10);

    v5 = v11;
    if ((v9 & 1) == 0)
    {
      -[UITableViewCell _setSeparatorDrawsInVibrantLightModeUIAppearance:](self, "_setSeparatorDrawsInVibrantLightModeUIAppearance:", MEMORY[0x1E0C9AAA0]);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
  _BOOL8 v4;
  _BOOL8 v5;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = animated;
  v5 = highlighted;
  if ((!highlighted || -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
    && ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x400) == 0) == v5)
  {
    if ((*(_BYTE *)&self->_tableCellFlags & 0x70) == 0)
    {
      -[UITableViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
      v7 = 1024;
      if (!v5)
        v7 = 0;
      *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0xFFFFFFFFFFFFFBFFLL | v7;
      -[UITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
      goto LABEL_17;
    }
    if (v5)
    {
      if (!-[UITableViewCell _usingBackgroundConfigurationOrDefaultBackgroundConfiguration](self, "_usingBackgroundConfigurationOrDefaultBackgroundConfiguration"))-[UITableViewCell _setupSelectedBackgroundView](self, "_setupSelectedBackgroundView");
      -[UITableViewCell _cancelInternalPerformRequests](self, "_cancelInternalPerformRequests");
      -[UITableViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
      *(_QWORD *)((char *)&self->_tableCellFlags + 4) |= 0x400uLL;
      -[UITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
    }
    else
    {
      -[UITableViewCell _cancelInternalPerformRequests](self, "_cancelInternalPerformRequests");
      -[UITableViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
      *(_QWORD *)((char *)&self->_tableCellFlags + 4) &= ~0x400uLL;
      -[UITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
      if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x40000000000000) != 0)
      {
LABEL_16:
        -[UITableViewCell editingData:](self, "editingData:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "editControl:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setHighlighted:", v5);

LABEL_17:
        -[UITableViewCell _updateFloatingContentControlStateAnimated:](self, "_updateFloatingContentControlStateAnimated:", v4);
        return;
      }
    }
    -[UITableViewCell showSelectedBackgroundView:animated:](self, "showSelectedBackgroundView:animated:", -[UITableViewCell _shouldUseHighlightedOrSelectedAppearance](self, "_shouldUseHighlightedOrSelectedAppearance"), v4);
    -[UIView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (v9 == 3)
    {
      -[UITableViewCell _updateDefaultLabelsForFocus:](self, "_updateDefaultLabelsForFocus:", v5);
      -[UITableViewCell _updateDefaultAccessoryViewForFocus:](self, "_updateDefaultAccessoryViewForFocus:", v5);
    }
    goto LABEL_16;
  }
}

- (void)_setSeparatorDrawsInVibrantLightModeUIAppearance:(id)a3
{
  -[UITableViewCell _setSeparatorDrawsInVibrantLightMode:](self, "_setSeparatorDrawsInVibrantLightMode:", objc_msgSend(a3, "BOOLValue"));
}

- (void)_setSeparatorDrawsInVibrantLightMode:(BOOL)a3
{
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  uint64_t v5;
  _UITableViewCellSeparatorView *separatorView;
  _UITableViewCellSeparatorView **p_topSeparatorView;
  UIColor *separatorColor;

  p_tableCellFlags = &self->_tableCellFlags;
  v5 = 0x40000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0xFFFFFBFFFFFFFFFFLL | v5;
  separatorView = self->_separatorView;
  if (a3)
  {
    -[UIView _setDrawsAsBackdropOverlayWithBlendMode:](separatorView, "_setDrawsAsBackdropOverlayWithBlendMode:", 0);
    -[_UITableViewCellSeparatorView setDrawsWithVibrantLightMode:](self->_separatorView, "setDrawsWithVibrantLightMode:", 1);
    -[UIView setBackgroundColor:](self->_separatorView, "setBackgroundColor:", 0);
    p_topSeparatorView = &self->_topSeparatorView;
    -[UIView _setDrawsAsBackdropOverlayWithBlendMode:](self->_topSeparatorView, "_setDrawsAsBackdropOverlayWithBlendMode:", 0);
    -[_UITableViewCellSeparatorView setDrawsWithVibrantLightMode:](self->_topSeparatorView, "setDrawsWithVibrantLightMode:", 1);
    separatorColor = 0;
  }
  else
  {
    -[_UITableViewCellSeparatorView setDrawsWithVibrantLightMode:](separatorView, "setDrawsWithVibrantLightMode:");
    p_topSeparatorView = &self->_topSeparatorView;
    -[_UITableViewCellSeparatorView setDrawsWithVibrantLightMode:](self->_topSeparatorView, "setDrawsWithVibrantLightMode:", 0);
    -[UIView _setDrawsAsBackdropOverlayWithBlendMode:](self->_separatorView, "_setDrawsAsBackdropOverlayWithBlendMode:", (*(_QWORD *)((char *)p_tableCellFlags + 4) >> 39) & 7);
    -[UIView setBackgroundColor:](self->_separatorView, "setBackgroundColor:", self->_separatorColor);
    -[UIView _setDrawsAsBackdropOverlayWithBlendMode:](self->_topSeparatorView, "_setDrawsAsBackdropOverlayWithBlendMode:", (*(_QWORD *)((char *)p_tableCellFlags + 4) >> 39) & 7);
    separatorColor = self->_separatorColor;
  }
  -[UIView setBackgroundColor:](*p_topSeparatorView, "setBackgroundColor:", separatorColor);
}

- (void)_prepareForConfigurationStateUpdate
{
  _QWORD v3[5];

  if (((*((unsigned __int16 *)&self->_tableCellFlags + 6) | ((unint64_t)*((unsigned __int8 *)&self->_tableCellFlags
                                                                                + 14) << 16)) & 0x20002000200020) == 0x20)
  {
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __54__UITableViewCell__prepareForConfigurationStateUpdate__block_invoke;
      v3[3] = &unk_1E16B1B28;
      v3[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
    }
  }
}

- (id)_defaultBackgroundConfiguration
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

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
    v6 = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x1FLL;
    if (v6 == 2)
    {
      +[UIBackgroundConfiguration _listInsetGroupedCellConfiguration](UIBackgroundConfiguration, "_listInsetGroupedCellConfiguration");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v6)
        +[UIBackgroundConfiguration listGroupedCellConfiguration](UIBackgroundConfiguration, "listGroupedCellConfiguration");
      else
        +[UIBackgroundConfiguration listPlainCellConfiguration](UIBackgroundConfiguration, "listPlainCellConfiguration");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v7;
  }
  return v5;
}

- (void)_setFrame:(CGRect)a3 skipLayout:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UITableViewCell _dropAnimationContainerView](self, "_dropAnimationContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setFrame:", x, y, width, height);
    x = *MEMORY[0x1E0C9D538];
    y = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  -[UITableViewCell _swipeContainerView](self, "_swipeContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "frame");
    objc_msgSend(v13, "setFrame:");
    y = 0.0;
  }
  -[UITableViewCell frame](self, "frame");
  v15 = v14;
  v17 = v16;
  v21.receiver = self;
  v21.super_class = (Class)UITableViewCell;
  -[UIView setFrame:](&v21, sel_setFrame_, x, y, width, height);
  if (!a4 && (v15 != width || v17 != height))
  {
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) |= 0x800uLL;
    -[UIView window](self, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = v18;
      if (self->_contentView || self->_backgroundView)
      {

      }
      else
      {
        -[UITableViewCell _selectedBackgroundView:](self, "_selectedBackgroundView:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
          goto LABEL_13;
      }
      -[UIView setNeedsLayout](self, "setNeedsLayout");
    }
LABEL_13:
    -[UITableViewCell _updateAccessoryMetrics](self, "_updateAccessoryMetrics");
  }

}

- (id)_dropAnimationContainerView
{
  void *v2;
  id v3;

  -[UITableViewCell _containerView](self, "_containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)setFrame:(CGRect)a3
{
  -[UITableViewCell _setFrame:skipLayout:](self, "_setFrame:skipLayout:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_setNeedsHeightCalculation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  objc_super v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[UIView layoutMargins](self, "layoutMargins");
  if (left != v9 || right != v8)
    -[UITableViewCell _updateAccessoryMetrics](self, "_updateAccessoryMetrics");
  v11.receiver = self;
  v11.super_class = (Class)UITableViewCell;
  -[UIView _layoutMarginsDidChangeFromOldMargins:](&v11, sel__layoutMarginsDidChangeFromOldMargins_, top, left, bottom, right);
}

- (void)_setIndexPath:(id)a3
{
  NSIndexPath *v5;
  NSIndexPath *v6;

  v5 = (NSIndexPath *)a3;
  if (self->_representedIndexPath != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_representedIndexPath, a3);
    v5 = v6;
  }

}

- (NSString)reuseIdentifier
{
  return (NSString *)(id)-[NSString copy](self->_reuseIdentifier, "copy");
}

- (BOOL)_hasBeenReused
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16) >> 18) & 1;
}

- (void)_notifyIsDisplaying:(BOOL)a3
{
  int v3;
  _BOOL4 v4;
  unsigned int v6;
  int v7;

  v3 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
  if (((((*(_QWORD *)&v3 & 0x80000) == 0) ^ a3) & 1) == 0)
  {
    v4 = a3;
    v6 = v3 & 0xFFF7FFFF;
    if (a3)
      v7 = 0x80000;
    else
      v7 = 0;
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
    *((_WORD *)&self->_tableCellFlags + 6) = v6;
    *((_BYTE *)&self->_tableCellFlags + 14) = (v6 | v7) >> 16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIView _containerViewIsHiddenForReuse:](self->_contentView, "_containerViewIsHiddenForReuse:", !v4);
  }
}

- (void)setReuseIdentifier:(id)a3
{
  NSString *v4;
  NSString *reuseIdentifier;

  if (self->_reuseIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    reuseIdentifier = self->_reuseIdentifier;
    self->_reuseIdentifier = v4;

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  __CFDictionary *unhighlightedStates;
  objc_super v6;

  v3 = (void *)MEMORY[0x186DC9484](self, a2);
  +[UIAnimator sharedAnimator](UIAnimator, "sharedAnimator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAnimationsForTarget:", self);

  -[UITableViewCell _releaseTextLabel](self, "_releaseTextLabel");
  -[UITableViewCell _releaseDetailTextLabel](self, "_releaseDetailTextLabel");
  unhighlightedStates = self->_unhighlightedStates;
  if (unhighlightedStates)
  {
    CFRelease(unhighlightedStates);
    self->_unhighlightedStates = 0;
  }
  objc_autoreleasePoolPop(v3);
  v6.receiver = self;
  v6.super_class = (Class)UITableViewCell;
  -[UIView dealloc](&v6, sel_dealloc);
}

- (void)_releaseTextLabel
{
  UILabel *textLabel;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UILabel setTableCell:](self->_textLabel, "setTableCell:", 0);
  -[UIView removeFromSuperview](self->_textLabel, "removeFromSuperview");
  textLabel = self->_textLabel;
  self->_textLabel = 0;

}

- (void)_releaseDetailTextLabel
{
  UILabel *detailTextLabel;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UILabel setTableCell:](self->_detailTextLabel, "setTableCell:", 0);
  -[UIView removeFromSuperview](self->_detailTextLabel, "removeFromSuperview");
  detailTextLabel = self->_detailTextLabel;
  self->_detailTextLabel = 0;

}

- (id)_indexPath
{
  return self->_representedIndexPath;
}

- (void)_removeInnerShadow
{
  UIView *topShadowAnimationView;
  UIView *bottomShadowAnimationView;

  -[UIView removeFromSuperview](self->_topShadowAnimationView, "removeFromSuperview");
  topShadowAnimationView = self->_topShadowAnimationView;
  self->_topShadowAnimationView = 0;

  -[UIView removeFromSuperview](self->_bottomShadowAnimationView, "removeFromSuperview");
  bottomShadowAnimationView = self->_bottomShadowAnimationView;
  self->_bottomShadowAnimationView = 0;

}

- (void)_removeFloatingSeparator
{
  UIView *floatingSeparatorView;

  -[UIView removeFromSuperview](self->_floatingSeparatorView, "removeFromSuperview");
  floatingSeparatorView = self->_floatingSeparatorView;
  self->_floatingSeparatorView = 0;

}

- (void)_setSwipeContainerView:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[UITableViewCell _swipeContainerView](self, "_swipeContainerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v10)
  {
    v6 = v10;
    if (v10)
    {
      if (!v5)
      {
        -[UITableViewCell _containerView](self, "_containerView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v10;
        if (v7)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITableViewCell _containerView](self, "_containerView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITableViewCell.m"), 4970, CFSTR("UIKit inconsistency: Can't set a swipe container view when a different type of container view is already present: %@"), v9);

          v6 = v10;
        }
      }
    }
    -[UITableViewCell _setContainerView:](self, "_setContainerView:", v6);
    objc_msgSend(v5, "removeFromSuperview");
  }

}

- (void)_setAnimating:(BOOL)a3
{
  -[UITableViewCell _setAnimating:clippingAdjacentCells:](self, "_setAnimating:clippingAdjacentCells:", a3, 0);
}

- (void)_willEnterReusePool
{
  -[UITableViewCell _setSwipeContainerView:](self, "_setSwipeContainerView:", 0);
}

- (void)removeFromSuperview
{
  -[UITableViewCell _removeFromSuperviewIgnoringFirstResponder:](self, "_removeFromSuperviewIgnoringFirstResponder:", 0);
}

- (void)_removeFromSuperviewIgnoringFirstResponder:(BOOL)a3
{
  objc_super v3;

  if (a3 || (*(_QWORD *)&self->super._viewFlags & 0x10000) == 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)UITableViewCell;
    -[UIView removeFromSuperview](&v3, sel_removeFromSuperview);
  }
}

- (UITableViewCellSelectionStyle)selectionStyle
{
  return ((unint64_t)*(_DWORD *)&self->_tableCellFlags >> 4) & 7;
}

- (void)setSeparatorInset:(UIEdgeInsets)separatorInset
{
  if (separatorInset.left != self->_separatorInset.left
    || separatorInset.top != self->_separatorInset.top
    || separatorInset.right != self->_separatorInset.right
    || separatorInset.bottom != self->_separatorInset.bottom)
  {
    self->_separatorInset = separatorInset;
    -[UITableViewCell _setNeedsSeparatorUpdate](self, "_setNeedsSeparatorUpdate");
  }
}

- (BOOL)showingDeleteConfirmation
{
  return *(_DWORD *)&self->_tableCellFlags & 1;
}

- (void)setSelectionStyle:(UITableViewCellSelectionStyle)selectionStyle
{
  -[UITableViewCell _setSelectionStyle:selectionTintColor:](self, "_setSelectionStyle:selectionTintColor:", selectionStyle, self->_selectionTintColor);
}

- (void)_setSelectionStyle:(int64_t)a3 selectionTintColor:(id)a4
{
  UIColor *v7;
  unint64_t tableCellFlags;
  NSArray *selectionEffects;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  UIView *selectedOverlayView;
  UIView *v15;
  UIColor *v16;

  v7 = (UIColor *)a4;
  tableCellFlags = (unint64_t)self->_tableCellFlags;
  if (((tableCellFlags >> 4) & 7) != a3 || self->_selectionTintColor != v7)
  {
    v16 = v7;
    *(_DWORD *)&self->_tableCellFlags = tableCellFlags & 0xFFFFFF8F | (16 * (a3 & 7));
    objc_storeStrong((id *)&self->_selectionTintColor, a4);
    selectionEffects = self->_selectionEffects;
    self->_selectionEffects = 0;

    -[UITableViewCell _updateDefaultBackgroundAppearance](self, "_updateDefaultBackgroundAppearance");
    -[UITableViewCell _selectedBackgroundView:](self, "_selectedBackgroundView:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!a3)
    {
      if (v10)
        objc_msgSend(v10, "removeFromSuperview");
      -[UIView alpha](self->_backgroundView, "alpha");
      if (v12 == 0.0)
        -[UIView setAlpha:](self->_backgroundView, "setAlpha:", 1.0);
      -[UITableViewCell _applySelectedStateToSeparators:](self, "_applySelectedStateToSeparators:", 0);
    }
    if (!-[UITableViewCell isSelected](self, "isSelected") || v11)
    {
      if (v11)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "setSelectionStyle:", -[UITableViewCell selectionStyle](self, "selectionStyle"));
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[UITableViewCell selectionTintColor](self, "selectionTintColor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setSelectionTintColor:", v13);

        }
      }
    }
    else
    {
      -[UIView setNeedsDisplay](self, "setNeedsDisplay");
    }
    if (-[UITableViewCell isSelected](self, "isSelected"))
    {
      -[UITableViewCell _updateAndCacheBackgroundColorForHighlightIgnoringSelection:](self, "_updateAndCacheBackgroundColorForHighlightIgnoringSelection:", 0);
      -[UITableViewCell _updateHighlightColors](self, "_updateHighlightColors");
      if (!a3)
      {
        selectedOverlayView = self->_selectedOverlayView;
        if (selectedOverlayView)
        {
          -[UIView removeFromSuperview](selectedOverlayView, "removeFromSuperview");
          v15 = self->_selectedOverlayView;
          self->_selectedOverlayView = 0;

        }
      }
    }

    v7 = v16;
  }

}

- (UIEdgeInsets)separatorInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  -[UITableViewCell _leadingSeparatorInset](self, "_leadingSeparatorInset");
  v4 = v3;
  -[UITableViewCell _trailingSeparatorInset](self, "_trailingSeparatorInset");
  v6 = v5;
  v7 = 0.0;
  v8 = 0.0;
  v9 = v4;
  result.right = v6;
  result.bottom = v8;
  result.left = v9;
  result.top = v7;
  return result;
}

- (void)_updateTopSeparatorViewAlpha
{
  double v2;

  v2 = 0.0;
  if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x100000000000) == 0)
    v2 = 1.0;
  -[UIView setAlpha:](self->_topSeparatorView, "setAlpha:", v2);
}

- (void)_applySelectedStateToSeparators:(BOOL)a3
{
  uint64_t v4;

  v4 = 0x100000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0xFFFFEFFFFFFFFFFFLL | v4;
  -[UITableViewCell _updateSeparatorViewAlpha](self, "_updateSeparatorViewAlpha");
  -[UITableViewCell _updateTopSeparatorViewAlpha](self, "_updateTopSeparatorViewAlpha");
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  UIView *v4;
  UIView *contentView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITableViewCell;
  v4 = (UIView *)a3;
  -[UIView _intrinsicContentSizeInvalidatedForChildView:](&v6, sel__intrinsicContentSizeInvalidatedForChildView_, v4);
  contentView = self->_contentView;

  if (contentView == v4)
    -[UITableViewCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize", v6.receiver, v6.super_class);
}

- (void)invalidateIntrinsicContentSize
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UITableViewCell _tableView](self, "_tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_cellDidInvalidateIntrinsicContentSize:", self);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITableViewCell;
    -[UIView invalidateIntrinsicContentSize](&v5, sel_invalidateIntrinsicContentSize);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__popupMenuButton, 0);
  objc_storeStrong((id *)&self->_accessoryManager, 0);
  objc_storeStrong(&self->_configurationUpdateHandler, 0);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong((id *)&self->_editingControlsFocusGuide, 0);
  objc_storeStrong((id *)&self->_clearBlendingView, 0);
  objc_storeStrong((id *)&self->_representedIndexPath, 0);
  objc_storeStrong((id *)&self->_longPressGesture, 0);
  objc_storeStrong((id *)&self->_accessoryTintColor, 0);
  objc_storeStrong((id *)&self->_selectionEffects, 0);
  objc_storeStrong((id *)&self->_selectionTintColor, 0);
  objc_storeStrong((id *)&self->_deselectTimer, 0);
  objc_storeStrong((id *)&self->_editableTextField, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_customEditingAccessoryView, 0);
  objc_storeStrong((id *)&self->_customAccessoryView, 0);
  objc_storeStrong((id *)&self->_editingAccessoryView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_accessoryActionPreviewingSegueTemplateStorage, 0);
  objc_storeStrong(&self->_accessoryActionSegueTemplate, 0);
  objc_storeStrong(&self->_selectionSegueTemplate, 0);
  objc_storeStrong(&self->_badge, 0);
  objc_storeStrong((id *)&self->_bottomShadowAnimationView, 0);
  objc_storeStrong((id *)&self->_topShadowAnimationView, 0);
  objc_storeStrong((id *)&self->_floatingSeparatorView, 0);
  objc_storeStrong((id *)&self->_sectionBorderColor, 0);
  objc_storeStrong((id *)&self->_separatorEffect, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_lastNormalBackgroundViewConfiguration, 0);
  objc_storeStrong(&self->_backgroundViewConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_systemBackgroundView, 0);
  objc_storeStrong(&self->_contentViewConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_viewForContentConfiguration, 0);
  objc_storeStrong((id *)&self->_selectedOverlayView, 0);
  objc_storeStrong((id *)&self->_multipleSelectionBackgroundView, 0);
  objc_storeStrong((id *)&self->_selectedBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_floatingContentView, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong(&self->_editingData, 0);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong(&self->_layoutManager, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->__editingControlTintColors, 0);
}

- (UIView)accessoryView
{
  return self->_customAccessoryView;
}

- (void)prepareForReuse
{
  double v3;
  unsigned int v4;
  UIView *selectedOverlayView;
  void *v6;
  void *v7;
  id v8;

  -[UITableViewCell _setDrawsTopSeparator:](self, "_setDrawsTopSeparator:", 0);
  -[UIView alpha](self, "alpha");
  if (v3 != 1.0)
    -[UIView setAlpha:](self, "setAlpha:", 1.0);
  -[UITableViewCell _resetSelectionTimer](self, "_resetSelectionTimer");
  -[UITableViewCell _resetEditControlRotation](self, "_resetEditControlRotation");
  *(_DWORD *)&self->_tableCellFlags &= ~1u;
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) &= ~0x200uLL;
  -[UITableViewCell _setSwiped:](self, "_setSwiped:", 0);
  -[UITableViewCell _setSwipeContainerView:](self, "_setSwipeContainerView:", 0);
  *(_DWORD *)&self->_tableCellFlags = *(_DWORD *)&self->_tableCellFlags & 0xC7FFFFFF | 0x20000000;
  v4 = ((*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16) | 0x40000u) >> 16;
  *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
  *((_BYTE *)&self->_tableCellFlags + 14) = v4;
  -[UITableViewCell setSelected:](self, "setSelected:", 0);
  -[UITableViewCell setHighlighted:](self, "setHighlighted:", 0);
  -[UITableViewCell _setShowingCompactContextMenu:](self, "_setShowingCompactContextMenu:", 0);
  -[UITableViewCell _setReordering:](self, "_setReordering:", 0);
  -[UITableViewCell _setDragState:](self, "_setDragState:", 0);
  -[UITableViewCell _setDropState:](self, "_setDropState:", 0);
  -[UITableViewCell setUserInteractionEnabledWhileDragging:](self, "setUserInteractionEnabledWhileDragging:", 0);
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) &= 0xFCFFFFFFFFFFFFFFLL;
  -[UIView _removeAllAnimations:](self, "_removeAllAnimations:", 1);
  -[UITableViewCell _updateHighlightColors](self, "_updateHighlightColors");
  -[UITableViewCell _resetRawLayoutMargins](self, "_resetRawLayoutMargins");
  if (-[UIView isHidden](self, "isHidden"))
    -[UIView setHidden:](self, "setHidden:", 0);
  -[UIView removeFromSuperview](self->_selectedOverlayView, "removeFromSuperview");
  selectedOverlayView = self->_selectedOverlayView;
  self->_selectedOverlayView = 0;

  if (!-[UITableViewCell _usesModernAccessoriesLayout](self, "_usesModernAccessoriesLayout"))
  {
    -[UITableViewCell _existingSystemAccessoryView:](self, "_existingSystemAccessoryView:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setHiddenForReuse:", 1);

    -[UITableViewCell _existingSystemAccessoryView:](self, "_existingSystemAccessoryView:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setHiddenForReuse:", 1);

  }
  objc_msgSend(self->_layoutManager, "prepareCellForReuse:", self);
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0xFFFF7FFF5FFFF7FFLL | 0x800020000800;
  -[UITableViewCell _notifyIsDisplaying:](self, "_notifyIsDisplaying:", 0);
  -[UITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  -[UIView layer](self, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearHasBeenCommitted");

}

- (void)setUserInteractionEnabledWhileDragging:(BOOL)userInteractionEnabledWhileDragging
{
  uint64_t v3;

  v3 = 0x80000000000000;
  if (!userInteractionEnabledWhileDragging)
    v3 = 0;
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (void)_updateHighlightColors
{
  _BOOL8 v3;
  void *v4;

  v3 = -[UITableViewCell _shouldUseHighlightedOrSelectedAppearance](self, "_shouldUseHighlightedOrSelectedAppearance");
  -[UITableViewCell _updateHighlightColorsForView:highlighted:](self, "_updateHighlightColorsForView:highlighted:", self, v3);
  -[UITableViewCell _tableView](self, "_tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_tableStyle");

  if (!v3 && self->_unhighlightedStates)
  {
    -[UIView _setMonitorsSubtree:](self, "_setMonitorsSubtree:", 0);
    -[UITableViewCell _setOpaque:forSubview:](self, "_setOpaque:forSubview:", 1, self);
    CFRelease(self->_unhighlightedStates);
    self->_unhighlightedStates = 0;
  }
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateHighlightColorsForView:(id)a3 highlighted:(BOOL)a4
{
  void *v4;
  _BOOL8 v5;
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  int tableCellFlags;
  void *v10;
  int v11;
  int v12;
  id v13;
  uint64_t v14;
  __CFDictionary *unhighlightedStates;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v5 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_28;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_28;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_28;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_28;
  p_tableCellFlags = &self->_tableCellFlags;
  tableCellFlags = (int)self->_tableCellFlags;
  if ((tableCellFlags & 0x100) != 0)
  {
    if ((*(_DWORD *)&self->_tableCellFlags & 0x7000) == 0x3000)
      goto LABEL_28;
    -[UITableViewCell _tableView](self, "_tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "allowsMultipleSelectionDuringEditing") & 1) != 0)
    {
      v12 = *(_DWORD *)p_tableCellFlags;
      if ((*((_WORD *)&self->_tableCellFlags + 6) & 4) == 0)
      {

        if ((v12 & 0x100) != 0)
          goto LABEL_28;
LABEL_21:
        if (v5)
        {
          v13 = a3;
          v14 = 1;
        }
        else
        {
          unhighlightedStates = self->_unhighlightedStates;
          if (unhighlightedStates)
          {
            v16 = (id)CFDictionaryGetValue(unhighlightedStates, a3);
            if (v16)
            {
              v17 = v16;
              objc_msgSend(a3, "setHighlighted:", objc_msgSend(v16, "highlighted"));

              goto LABEL_28;
            }
          }
          v13 = a3;
          v14 = 0;
        }
        objc_msgSend(v13, "setHighlighted:", v14);
        goto LABEL_28;
      }
    }
    else
    {
      v12 = *(_DWORD *)p_tableCellFlags;
    }
    if ((v12 & 0x100) != 0)
    {
LABEL_20:

      goto LABEL_21;
    }
  }
  -[UITableViewCell _tableView](self, "_tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "allowsMultipleSelection"))
  {

    if ((tableCellFlags & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  v11 = *(_DWORD *)p_tableCellFlags;

  if ((tableCellFlags & 0x100) != 0)
  if ((v11 & 0x100) == 0)
    goto LABEL_21;
LABEL_28:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && self->_selectedBackgroundView != a3)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(a3, "subviews", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(v18);
          -[UITableViewCell _updateHighlightColorsForView:highlighted:](self, "_updateHighlightColorsForView:highlighted:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), v5);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v20);
    }

  }
}

- (void)_setSwiped:(BOOL)a3
{
  _BOOL4 v3;
  int v5;

  if (((((*((_BYTE *)&self->_tableCellFlags + 1) & 2) == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    -[UITableViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
    if (v3)
      v5 = 512;
    else
      v5 = 0;
    *(_DWORD *)&self->_tableCellFlags = *(_DWORD *)&self->_tableCellFlags & 0xFFFFFDFF | v5;
    -[UITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (void)_setShowingCompactContextMenu:(BOOL)a3
{
  _BOOL4 v3;
  int v5;

  if (((((*((_BYTE *)&self->_tableCellFlags + 1) & 8) == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    -[UITableViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
    if (v3)
      v5 = 2048;
    else
      v5 = 0;
    *(_DWORD *)&self->_tableCellFlags = *(_DWORD *)&self->_tableCellFlags & 0xFFFFF7FF | v5;
    -[UITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (void)_setReordering:(BOOL)a3
{
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  _BOOL4 v4;
  int v6;
  _QWORD v7[5];

  p_tableCellFlags = &self->_tableCellFlags;
  if (((((*((_BYTE *)&self->_tableCellFlags + 1) & 4) == 0) ^ a3) & 1) == 0)
  {
    v4 = a3;
    -[UITableViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
    if (v4)
      v6 = 1024;
    else
      v6 = 0;
    *(_DWORD *)p_tableCellFlags = *(_DWORD *)p_tableCellFlags & 0xFFFFFBFF | v6;
    if (!v4 && -[UITableViewCell _usesRoundedGroups](self, "_usesRoundedGroups"))
    {
      if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
      {
        *((_WORD *)p_tableCellFlags + 6) |= 0x10u;
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __34__UITableViewCell__setReordering___block_invoke;
        v7[3] = &unk_1E16B3FD8;
        v7[4] = self;
        +[UIView _addCompletion:](UIView, "_addCompletion:", v7);
      }
    }
    -[UITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (void)_setDropState:(int64_t)a3
{
  if (self->_dropState != a3)
  {
    -[UITableViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
    self->_dropState = a3;
    -[UITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (void)_resetSelectionTimer
{
  NSTimer *deselectTimer;
  NSTimer *v4;

  deselectTimer = self->_deselectTimer;
  if (deselectTimer)
  {
    -[NSTimer invalidate](deselectTimer, "invalidate");
    v4 = self->_deselectTimer;
    self->_deselectTimer = 0;

  }
  self->_lastSelectionTime = -1.79769313e308;
}

- (void)_resetRawLayoutMargins
{
  objc_super v3;

  if (dyld_program_sdk_at_least())
  {
    self->_extraLeadingLayoutMarginForIndentation = 0.0;
    v3.receiver = self;
    v3.super_class = (Class)UITableViewCell;
    -[UIView _setRawLayoutMargins:](&v3, sel__setRawLayoutMargins_, -1.79769313e308, -1.79769313e308, -1.79769313e308, -1.79769313e308);
  }
}

- (void)_resetEditControlRotation
{
  void *v2;
  id v3;

  -[UITableViewCell editingData:](self, "editingData:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editControl:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRotated:", 0);

}

- (id)_detailTextLabel
{
  UILabel *v3;
  UILabel *detailTextLabel;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;

  if (!self->_detailTextLabel && (*((_WORD *)&self->_tableCellFlags + 6) & 0x40) == 0)
  {
    objc_msgSend(self->_layoutManager, "detailTextLabelForCell:", self);
    v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
    detailTextLabel = self->_detailTextLabel;
    self->_detailTextLabel = v3;

    v5 = self->_detailTextLabel;
    if (v5)
    {
      -[UIView superview](v5, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 != v7)
      {
        -[UITableViewCell contentView](self, "contentView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addSubview:", self->_detailTextLabel);

      }
    }
  }
  return self->_detailTextLabel;
}

- (void)_animateInnerShadowForInsertion:(BOOL)a3 withRowAnimation:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v15;
  UIImageView *v16;
  void *v17;
  UIView *v18;
  UIView *topShadowAnimationView;
  UIImageView *v20;
  void *v21;
  UIView *v22;
  UIView *bottomShadowAnimationView;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  _BOOL8 v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  _QWORD v82[6];
  _QWORD v83[33];

  if (a4 == 6)
  {
    v83[13] = v13;
    v83[14] = v12;
    v83[15] = v11;
    v83[16] = v10;
    v83[17] = v9;
    v83[18] = v8;
    v83[19] = v7;
    v83[20] = v6;
    v83[31] = v4;
    v83[32] = v5;
    if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x1FLL) == 0)
    {
      v15 = a3;
      -[UIView removeFromSuperview](self->_topShadowAnimationView, "removeFromSuperview");
      v16 = [UIImageView alloc];
      +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("UITableInnerShadowTop.png"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[UIImageView initWithImage:](v16, "initWithImage:", v17);
      topShadowAnimationView = self->_topShadowAnimationView;
      self->_topShadowAnimationView = v18;

      -[UIView removeFromSuperview](self->_bottomShadowAnimationView, "removeFromSuperview");
      v20 = [UIImageView alloc];
      +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("UITableInnerShadowBottom.png"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[UIImageView initWithImage:](v20, "initWithImage:", v21);
      bottomShadowAnimationView = self->_bottomShadowAnimationView;
      self->_bottomShadowAnimationView = v22;

      -[UITableViewCell layoutManager](self, "layoutManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[UITableViewCell isEditing](self, "isEditing"))
      {
        objc_msgSend(v24, "backgroundStartingRectForCell:forNewEditingState:", self, 1);
        v80 = v26;
        v81 = v25;
        v28 = v27;
        v30 = v29;
      }
      else
      {
        -[UITableViewCell _tableView](self, "_tableView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "backgroundStartingRectForCell:forNewEditingState:", self, objc_msgSend(v31, "_wasEditing"));
        v80 = v33;
        v81 = v32;
        v28 = v34;
        v30 = v35;

      }
      -[UITableViewCell layoutManager](self, "layoutManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[UITableViewCell isEditing](self, "isEditing"))
      {
        objc_msgSend(v36, "backgroundEndingRectForCell:forNewEditingState:", self, 1);
        v78 = v38;
        v79 = v37;
        v40 = v39;
        v42 = v41;
      }
      else
      {
        -[UITableViewCell _tableView](self, "_tableView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "backgroundEndingRectForCell:forNewEditingState:", self, objc_msgSend(v43, "isEditing"));
        v78 = v45;
        v79 = v44;
        v40 = v46;
        v42 = v47;

      }
      -[UIView bounds](self->_topShadowAnimationView, "bounds");
      v49 = v48;
      v50 = v28 + v30 * 0.5;
      -[UIView bounds](self->_topShadowAnimationView, "bounds");
      v52 = v51;
      -[UIView bounds](self->_bottomShadowAnimationView, "bounds");
      v54 = v40 + v42 - v53;
      -[UIView bounds](self->_bottomShadowAnimationView, "bounds");
      v56 = v55;
      -[UIView bounds](self->_bottomShadowAnimationView, "bounds");
      v58 = v40 + v42 * 0.5 - v57;
      -[UIView bounds](self->_bottomShadowAnimationView, "bounds");
      v60 = 1.0;
      if (v15)
        v61 = v54;
      else
        v61 = v58;
      if (v15)
        v62 = v56;
      else
        v62 = v59;
      v75 = v61;
      v76 = v62;
      if (v15)
        v56 = v59;
      else
        v58 = v54;
      if (v15)
        v63 = 1.0;
      else
        v63 = 0.0;
      if (v15)
        v60 = 0.0;
      v77 = v60;
      if (v15)
        v64 = v49;
      else
        v64 = v52;
      v74 = v64;
      if (v15)
        v65 = v28;
      else
        v65 = v50;
      if (v15)
      {
        v49 = v52;
        v28 = v50;
      }
      v66 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
      +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
      -[UIView setFrame:](self->_topShadowAnimationView, "setFrame:", v81, v28, v80, v49);
      -[UIView setFrame:](self->_bottomShadowAnimationView, "setFrame:", v79, v58, v78, v56);
      -[UIView setAlpha:](self->_topShadowAnimationView, "setAlpha:", v63);
      -[UIView setAlpha:](self->_bottomShadowAnimationView, "setAlpha:", v63);
      -[UIView layer](self->_topShadowAnimationView, "layer");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setZPosition:", 1.0);

      -[UIView layer](self->_bottomShadowAnimationView, "layer");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setZPosition:", 1.0);

      +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v66);
      -[UIView addSubview:](self, "addSubview:", self->_topShadowAnimationView);
      -[UIView addSubview:](self, "addSubview:", self->_bottomShadowAnimationView);
      -[UITableViewCell _constants](self, "_constants");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "defaultEditAndUpdateAnimationDuration");
      v71 = v70;

      v72 = MEMORY[0x1E0C809B0];
      v83[0] = MEMORY[0x1E0C809B0];
      v83[1] = 3221225472;
      v83[2] = __68__UITableViewCell__animateInnerShadowForInsertion_withRowAnimation___block_invoke;
      v83[3] = &unk_1E16B5328;
      v83[4] = self;
      *(double *)&v83[5] = v81;
      *(double *)&v83[6] = v65;
      *(double *)&v83[7] = v80;
      *(double *)&v83[8] = v74;
      *(double *)&v83[9] = v79;
      *(double *)&v83[10] = v75;
      *(double *)&v83[11] = v78;
      *(double *)&v83[12] = v76;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v83, v71);
      v73 = v71 - v71 * 0.5;
      if (!v15)
        v73 = 0.0;
      v82[0] = v72;
      v82[1] = 3221225472;
      v82[2] = __68__UITableViewCell__animateInnerShadowForInsertion_withRowAnimation___block_invoke_2;
      v82[3] = &unk_1E16B1888;
      v82[4] = self;
      *(double *)&v82[5] = v77;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v82, 0, v71 * 0.5, v73);
    }
  }
}

- (void)_animateFloatingSeparatorForInsertion:(BOOL)a3 withRowAnimation:(int64_t)a4
{
  _BOOL4 v5;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double Height;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  UIView *v29;
  UIView *floatingSeparatorView;
  void *v31;
  void *v32;
  double v33;
  double v34;
  _QWORD v35[9];
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v5 = a3;
  if (-[UITableViewCell separatorStyle](self, "separatorStyle") && (a4 | 2) == 6)
  {
    -[UITableViewCell _separatorFrame](self, "_separatorFrame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[UIView bounds](self, "bounds");
    v17 = v15 + v16;
    v36.origin.x = v8;
    v36.origin.y = v10;
    v36.size.width = v12;
    v36.size.height = v14;
    v18 = v17 - CGRectGetHeight(v36);
    v37.origin.x = v8;
    v37.origin.y = v10;
    v37.size.width = v12;
    v37.size.height = v14;
    Height = CGRectGetHeight(v37);
    if (a4 == 6)
    {
      -[UIView bounds](self, "bounds");
      v25 = v24 + v23 * 0.5;
      v39.origin.x = v8;
      v39.origin.y = v10;
      v39.size.width = v12;
      v39.size.height = v14;
      v20 = floor(v25 - CGRectGetHeight(v39));
    }
    else
    {
      v20 = 0.0;
      if (a4 == 4)
      {
        -[UIView bounds](self, "bounds");
        v22 = v21;
        v38.origin.x = v8;
        v38.origin.y = v10;
        v38.size.width = v12;
        v38.size.height = v14;
        v20 = v22 - CGRectGetHeight(v38);
      }
    }
    v40.origin.x = v8;
    v40.origin.y = v10;
    v40.size.width = v12;
    v40.size.height = v14;
    v26 = CGRectGetHeight(v40);
    if (v5)
      v27 = v26;
    else
      v27 = Height;
    if (v5)
      v28 = v20;
    else
      v28 = v18;
    if (v5)
      v20 = v18;
    else
      Height = v26;
    -[UIView removeFromSuperview](self->_floatingSeparatorView, "removeFromSuperview");
    v29 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v8, v28, v12, v27);
    floatingSeparatorView = self->_floatingSeparatorView;
    self->_floatingSeparatorView = v29;

    if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x40000000000) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        -[UIView setBackgroundColor:](self->_floatingSeparatorView, "setBackgroundColor:", self->_separatorColor);
    }
    -[UIView layer](self->_floatingSeparatorView, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setZPosition:", 1.0);

    -[UIView addSubview:](self, "addSubview:", self->_floatingSeparatorView);
    -[UITableViewCell _constants](self, "_constants");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "defaultEditAndUpdateAnimationDuration");
    v34 = v33;

    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __74__UITableViewCell__animateFloatingSeparatorForInsertion_withRowAnimation___block_invoke;
    v35[3] = &unk_1E16B20D8;
    v35[4] = self;
    *(double *)&v35[5] = v8;
    *(double *)&v35[6] = v20;
    *(double *)&v35[7] = v12;
    *(double *)&v35[8] = Height;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v35, v34);
  }
}

- (void)setNeedsUpdateConstraints
{
  void *v3;
  void *v4;

  -[UITableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateConstraints");

  -[UIView _setNeedsUpdateConstraints](self, "_setNeedsUpdateConstraints");
  -[UIView _layoutEngine](self, "_layoutEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else if ((*(_QWORD *)&self->super._viewFlags & 0x8000000000000000) == 0)
  {
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentConfiguration:(id)contentConfiguration
{
  -[UITableViewCell _applyContentViewConfiguration:withState:usingSPI:](self, "_applyContentViewConfiguration:withState:usingSPI:", contentConfiguration, 0, 0);
}

- (void)setAccessoryView:(UIView *)accessoryView
{
  UIView *v5;
  UIView *v6;
  UIView **p_customAccessoryView;
  UIControl *v8;
  BOOL v9;
  UIView *v10;

  v5 = accessoryView;
  v6 = v5;
  p_customAccessoryView = &self->_customAccessoryView;
  if (self->_customAccessoryView != v5)
  {
    v10 = v5;
    if (-[UITableViewCell _usesModernAccessoriesLayout](self, "_usesModernAccessoriesLayout"))
    {
      objc_storeStrong((id *)&self->_customAccessoryView, accessoryView);
      -[UITableViewCell _setNeedsAccessoriesUpdate](self, "_setNeedsAccessoriesUpdate");
LABEL_8:
      v6 = v10;
      goto LABEL_9;
    }
    -[UIView removeFromSuperview](*p_customAccessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_customAccessoryView, accessoryView);
    if (*p_customAccessoryView)
    {
      -[UIView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
      v8 = self->_accessoryView;
      self->_accessoryView = 0;

    }
    v9 = -[UITableViewCell isEditing](self, "isEditing");
    v6 = v10;
    if (!v9)
    {
      -[UIView setNeedsLayout](self, "setNeedsLayout");
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)setEditingAccessoryType:(UITableViewCellAccessoryType)editingAccessoryType
{
  unint64_t tableCellFlags;
  UIControl *editingAccessoryView;
  UIControl *v6;
  id v7;
  UIControl *v8;
  UIControl *v9;

  tableCellFlags = (unint64_t)self->_tableCellFlags;
  if (((tableCellFlags >> 18) & 7) != editingAccessoryType)
  {
    *(_DWORD *)&self->_tableCellFlags = tableCellFlags & 0xFFE3FFFF | ((editingAccessoryType & 7) << 18);
    if (-[UITableViewCell _usesModernAccessoriesLayout](self, "_usesModernAccessoriesLayout"))
    {
      -[UITableViewCell _setNeedsAccessoriesUpdate](self, "_setNeedsAccessoriesUpdate");
      return;
    }
    if ((*((_BYTE *)&self->_tableCellFlags + 2) & 0x1C) != 0)
    {
      editingAccessoryView = self->_editingAccessoryView;
      if (editingAccessoryView)
      {
        -[UIView removeFromSuperview](editingAccessoryView, "removeFromSuperview");
        v6 = self->_editingAccessoryView;
        self->_editingAccessoryView = 0;

      }
      -[UITableViewCell _syncAccessoryViewsIfNecessary](self, "_syncAccessoryViewsIfNecessary");
      if (-[UITableViewCell isEditing](self, "isEditing"))
        v7 = -[UITableViewCell _editingAccessoryView:](self, "_editingAccessoryView:", 1);
      goto LABEL_15;
    }
    v8 = self->_editingAccessoryView;
    if (self->_accessoryView == v8)
    {
      if (-[UITableViewCell isEditing](self, "isEditing"))
      {
LABEL_14:
        v9 = self->_editingAccessoryView;
        self->_editingAccessoryView = 0;

LABEL_15:
        if (-[UITableViewCell isEditing](self, "isEditing"))
          -[UIView setNeedsLayout](self, "setNeedsLayout");
        return;
      }
      v8 = self->_editingAccessoryView;
    }
    -[UIView removeFromSuperview](v8, "removeFromSuperview");
    goto LABEL_14;
  }
}

- (BOOL)_accessoryViewsHidden
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 51) & 1;
}

- (void)setClipsToBounds:(BOOL)a3
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  if (((((v3 & 0x200000000000) == 0) ^ a3) & 1) == 0)
  {
    v4 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    v5 = 0x200000000000;
    if (!a3)
      v5 = 0;
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v4);
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFFFDFFFFFFFFFFFLL | v5;
    -[UITableViewCell _updateContentClip](self, "_updateContentClip");
  }
}

- (CGRect)_topSeparatorFrame
{
  double v3;
  double v4;
  int v5;
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
  CGRect v16;
  CGRect result;

  v3 = 0.0;
  v4 = 0.0;
  if (!-[UITableViewCell _showFullLengthTopSeparatorForTopOfSection](self, "_showFullLengthTopSeparatorForTopOfSection"))
  {
    v5 = *((_DWORD *)&self->super._viewFlags + 4);
    if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x1000000000) != 0)
    {
      -[UIView directionalLayoutMargins](self, "directionalLayoutMargins");
      if ((*(_QWORD *)&v5 & 0x80000) != 0)
        v3 = v8;
      else
        v3 = 0.0;
      if ((*(_QWORD *)&v5 & 0x80000) != 0)
        v4 = 0.0;
      else
        v4 = v8;
    }
    else
    {
      if ((v5 & 0x80000) != 0)
      {
        -[UITableViewCell _trailingSeparatorInset](self, "_trailingSeparatorInset");
        v4 = v9;
        -[UITableViewCell _leadingSeparatorInset](self, "_leadingSeparatorInset");
      }
      else
      {
        -[UITableViewCell _leadingSeparatorInset](self, "_leadingSeparatorInset");
        v4 = v6;
        -[UITableViewCell _trailingSeparatorInset](self, "_trailingSeparatorInset");
      }
      v3 = v7;
    }
  }
  -[UITableViewCell _separatorHeight](self, "_separatorHeight");
  v11 = v10;
  -[UIView bounds](self, "bounds");
  v12 = CGRectGetWidth(v16) - (v3 + v4);
  v13 = 0.0;
  v14 = v4;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v12;
  result.origin.y = v13;
  result.origin.x = v14;
  return result;
}

- (BOOL)_showFullLengthTopSeparatorForTopOfSection
{
  return (~*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x2800000000) == 0;
}

void __65__UITableViewCell__ensureInitializeSystemAppearanceModifications__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "userInterfaceIdiom");

    if (((v3 - 1) & 0xFFFFFFFFFFFFFFFBLL) == 0)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __65__UITableViewCell__ensureInitializeSystemAppearanceModifications__block_invoke_2;
      v4[3] = &__block_descriptor_40_e5_v8__0l;
      v4[4] = *(_QWORD *)(a1 + 32);
      +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v4);
    }
  }
}

- (UITableViewCellAccessoryType)accessoryType
{
  return ((unint64_t)*(_DWORD *)&self->_tableCellFlags >> 15) & 7;
}

- (void)_updateConfigurationWithObservationTracking
{
  UITableViewCell *v2;

  v2 = self;
  sub_185729E24();

}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

void __65__UITableViewCell__ensureInitializeSystemAppearanceModifications__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[3];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    +[UIColor tableCellBackgroundColor](UIColor, "tableCellBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBackgroundColor:", v3);

  }
  v15[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  +[UIColor tableSeparatorLightColor](UIColor, "tableSeparatorLightColor", CFSTR("_popoverControllerStyle"), CFSTR("_isInModalViewController"), CFSTR("separatorColor"), &unk_1E1A9A398, MEMORY[0x1E0C9AAA0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appearanceMatchingProperties:whenContainedInInstancesOfClasses:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setSeparatorDrawsInVibrantLightModeUIAppearance:", MEMORY[0x1E0C9AAB0]);

  objc_msgSend(*(id *)(a1 + 32), "appearanceMatchingProperties:whenContainedInInstancesOfClasses:", &unk_1E1A9B4C8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor clearColor](UIColor, "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v10);

  objc_msgSend(*(id *)(a1 + 32), "appearanceMatchingProperties:whenContainedInInstancesOfClasses:", &unk_1E1A9B4F0, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v12);

}

void __39__UITableViewCell__initializeForIdiom___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  +[UITraitCollection traitCollectionWithUserInterfaceIdiom:](UITraitCollection, "traitCollectionWithUserInterfaceIdiom:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "defaultCellBackgroundPropertiesForTableViewStyle:state:traitCollection:", 0, v4, v2, (_QWORD)v8);
  }
  else
  {
    v16 = 0;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
  }

  v5 = *(void **)(a1 + 40);
  v17[0] = _UIAppearanceContainerForUserInterfaceIdiom();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appearanceWhenContainedInInstancesOfClasses:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", *((_QWORD *)&v8 + 1));

  __destructor_8_s8_s16_s24_s80((id *)&v8);
}

- (BOOL)_shouldChangeOpaqueStateOfView:(id)a3
{
  _UITableViewCellSeparatorView *v4;
  _UIFloatingContentView *floatingContentView;
  _UITableViewCellSeparatorView *v6;
  _UITableViewCellSeparatorView *v7;
  BOOL v8;

  v4 = (_UITableViewCellSeparatorView *)a3;
  if (!-[UITableViewCell _changesOpaqueStateOfSubviews](self, "_changesOpaqueStateOfSubviews")
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (_UITableViewCellSeparatorView *)self->_backgroundView == v4
    || (_UITableViewCellSeparatorView *)self->_selectedBackgroundView == v4
    || (_UITableViewCellSeparatorView *)self->_multipleSelectionBackgroundView == v4
    || self->_separatorView == v4
    || self->_topSeparatorView == v4
    || (floatingContentView = self->_floatingContentView, floatingContentView == (_UIFloatingContentView *)v4))
  {
    v8 = 0;
  }
  else
  {
    -[_UIFloatingContentView transformView](floatingContentView, "transformView");
    v6 = (_UITableViewCellSeparatorView *)objc_claimAutoreleasedReturnValue();
    if (v6 == v4)
    {
      v8 = 0;
    }
    else
    {
      -[_UIFloatingContentView highlightView](self->_floatingContentView, "highlightView");
      v7 = (_UITableViewCellSeparatorView *)objc_claimAutoreleasedReturnValue();
      v8 = v7 != v4;

    }
  }

  return v8;
}

- (int64_t)_popoverControllerStyle
{
  void *v2;
  int64_t v3;

  -[UITableViewCell _tableView](self, "_tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_popoverControllerStyle");

  return v3;
}

- (BOOL)_isInModalViewController
{
  void *v2;
  char v3;

  -[UITableViewCell _tableView](self, "_tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isInModalViewController");

  return v3;
}

- (id)_checkmarkImage
{
  return -[UITableViewCell _checkmarkImageWithTintColor:](self, "_checkmarkImageWithTintColor:", 0);
}

- (id)_checkmarkImageWithTintColor:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  if (-[UIView isFocused](self, "isFocused")
    && (-[UITableViewCell _constants](self, "_constants"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_opt_respondsToSelector(),
        v5,
        (v6 & 1) != 0))
  {
    -[UITableViewCell _constants](self, "_constants");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell _tableView](self, "_tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultFocusedCheckmarkImageForCell:inTableView:", self, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UITableViewCell _constants](self, "_constants");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultCheckmarkImageForCell:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v4)
  {
    objc_msgSend(v9, "imageWithTintColor:renderingMode:", v4, 1);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }

  return v9;
}

- (id)_disclosureChevronImage
{
  void *v3;
  void *v4;
  void *v5;

  -[UITableViewCell _tableView](self, "_tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessoryBaseColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell _disclosureChevronImageWithBaseColor:](self, "_disclosureChevronImageWithBaseColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  UITableViewCell *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  if (!a3
    && -[UIView translatesAutoresizingMaskIntoConstraints](self, "translatesAutoresizingMaskIntoConstraints")
    && dyld_program_sdk_at_least())
  {
    v5 = setTranslatesAutoresizingMaskIntoConstraints____s_category_0;
    if (!setTranslatesAutoresizingMaskIntoConstraints____s_category_0)
    {
      v5 = __UILogCategoryGetNode("LayoutConstraints", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&setTranslatesAutoresizingMaskIntoConstraints____s_category_0);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = self;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Changing the translatesAutoresizingMaskIntoConstraints property of a UITableViewCell that is managed by a UITableView is not supported, and will result in incorrect self-sizing. Cell: %@", buf, 0xCu);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)UITableViewCell;
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](&v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, v3);
}

- (CGRect)_updatedContentViewFrameForTargetWidth:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(self->_layoutManager, "contentRectForCell:forState:rowWidth:", self, -[UITableViewCell currentStateMask](self, "currentStateMask"), a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

void __101__UITableViewCell_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = _UITableViewCellExpansionAccessoryIdentifier_block_invoke___s_category;
  if (!_UITableViewCellExpansionAccessoryIdentifier_block_invoke___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UITableViewCellExpansionAccessoryIdentifier_block_invoke___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Warning once only: Detected a case where constraints ambiguously suggest a height of zero for a table view cell's content view. We're considering the collapse unintentional and using standard height instead. Cell: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_updateHighlightColorsForAnimationHalfwayPoint
{
  _BOOL8 v3;

  v3 = -[UITableViewCell _shouldUseHighlightedOrSelectedAppearance](self, "_shouldUseHighlightedOrSelectedAppearance");
  -[UITableViewCell _updateHighlightColorsForView:highlighted:](self, "_updateHighlightColorsForView:highlighted:", self, v3);
  if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x1000) != 0)
    -[UIView setSelected:](self->_selectedOverlayView, "setSelected:", v3);
  if (!v3)
    -[UITableViewCell _setOpaque:forSubview:](self, "_setOpaque:forSubview:", 1, self->_backgroundView);
}

- (void)_updateAndCacheBackgroundColorForHighlightIgnoringSelection:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if ((-[UITableViewCell _shouldUseHighlightedOrSelectedAppearance](self, "_shouldUseHighlightedOrSelectedAppearance")
     || v3)
    && !self->_unhighlightedStates)
  {
    -[UITableViewCell _saveOpaqueViewState:](self, "_saveOpaqueViewState:", self);
    -[UITableViewCell _setOpaque:forSubview:](self, "_setOpaque:forSubview:", 0, self);
  }
}

- (id)_defaultFont
{
  void *v3;
  void *v4;

  -[UITableViewCell _constants](self, "_constants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultTextLabelFontForCellStyle:", -[UITableViewCell _cellStyle](self, "_cellStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_editableTextField
{
  UITextField *editableTextField;
  UITextField *v4;
  UITextField *v5;
  void *v6;

  editableTextField = self->_editableTextField;
  if (!editableTextField)
  {
    if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x40) != 0
      || (objc_msgSend(self->_layoutManager, "editableTextFieldForCell:", self),
          v4 = (UITextField *)objc_claimAutoreleasedReturnValue(),
          v5 = self->_editableTextField,
          self->_editableTextField = v4,
          v5,
          !self->_editableTextField))
    {
      editableTextField = 0;
    }
    else
    {
      -[UITableViewCell contentView](self, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSubview:", self->_editableTextField);

      editableTextField = self->_editableTextField;
    }
  }
  return editableTextField;
}

- (id)_badge
{
  id badge;
  void *v4;
  id v5;

  badge = self->_badge;
  if (!badge)
  {
    objc_msgSend(self->_layoutManager, "badgeForCell:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = self->_badge;
    self->_badge = v4;

    badge = self->_badge;
  }
  return badge;
}

- (BOOL)_gestureRecognizerShouldBegin:(id)a3
{
  UILongPressGestureRecognizer *v4;
  void *v5;
  int v6;
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  uint64_t v8;
  UILongPressGestureRecognizer *longPressGesture;
  _BOOL8 v10;

  v4 = (UILongPressGestureRecognizer *)a3;
  -[UITableViewCell _tableView](self, "_tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_shouldShowMenuForCell:", self);
  p_tableCellFlags = &self->_tableCellFlags;
  v8 = 0x4000000;
  if (!v6)
    v8 = 0;
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0xFFFFFFFFFBFFFFFFLL | v8;

  longPressGesture = self->_longPressGesture;
  if (longPressGesture == v4)
    return (*(_QWORD *)((char *)p_tableCellFlags + 4) >> 26) & 1;
  else
    LOBYTE(v10) = 1;
  return v10;
}

- (void)_longPressGestureRecognized:(id)a3
{
  id v4;
  BOOL v5;
  id v6;

  v4 = a3;
  if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x4000000) != 0)
  {
    v6 = v4;
    v5 = objc_msgSend(v4, "state") == 1;
    v4 = v6;
    if (v5)
    {
      -[UITableViewCell _showMenuFromLongPressGesture](self, "_showMenuFromLongPressGesture");
      v4 = v6;
    }
  }

}

- (void)_showMenuFromLongPressGesture
{
  UIEditMenuInteraction *v3;
  UIEditMenuInteraction *editMenuInteraction;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  if (!self->_editMenuInteraction)
  {
    v3 = -[UIEditMenuInteraction initWithDelegate:]([UIEditMenuInteraction alloc], "initWithDelegate:", self);
    editMenuInteraction = self->_editMenuInteraction;
    self->_editMenuInteraction = v3;

    -[UIView addInteraction:](self, "addInteraction:", self->_editMenuInteraction);
  }
  -[UITableViewCell center](self, "center");
  v6 = v5;
  v8 = v7;
  -[UIView superview](self, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v9, v6, v8);
  v11 = v10;
  v13 = v12;

  +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", 0, v11, v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "set_firstResponderTarget:", self);
  -[UIEditMenuInteraction presentEditMenuWithConfiguration:](self->_editMenuInteraction, "presentEditMenuWithConfiguration:", v14);

}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v7 = a5;
  if (self->_editMenuInteraction == a3)
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
    +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  if (self->_editMenuInteraction == a3)
  {
    -[UITableViewCell _tableView](self, "_tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_calloutTargetRectForCell:", self);
    v4 = v10;
    v5 = v11;
    v6 = v12;
    v7 = v13;

  }
  else
  {
    v4 = *MEMORY[0x1E0C9D628];
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v14 = v4;
  v15 = v5;
  v16 = v6;
  v17 = v7;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  if (self->_editMenuInteraction == a3)
    -[UITableViewCell setSelected:animated:](self, "setSelected:animated:", 1, 0, a5);
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  UIEditMenuInteraction *v7;
  id v8;
  UIEditMenuInteraction *editMenuInteraction;
  _QWORD v10[4];
  UIEditMenuInteraction *v11;

  v7 = (UIEditMenuInteraction *)a3;
  if (self->_editMenuInteraction == v7)
  {
    v8 = a5;
    -[UITableViewCell setSelected:animated:](self, "setSelected:animated:", 0, 0);
    editMenuInteraction = self->_editMenuInteraction;
    self->_editMenuInteraction = 0;

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __80__UITableViewCell_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke;
    v10[3] = &unk_1E16B1B28;
    v11 = v7;
    objc_msgSend(v8, "addCompletion:", v10);

  }
}

void __80__UITableViewCell_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeInteraction:", *(_QWORD *)(a1 + 32));

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  objc_super v13;

  v6 = a4;
  if (!dyld_program_sdk_at_least())
  {
    -[UITableViewCell _tableView](self, "_tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "_canPerformAction:forCell:sender:", a3, self, v6))
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
    -[UITableViewCell _tableView](self, "_tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_canPerformAction:forCell:sender:", a3, self, v6);
    goto LABEL_13;
  }
  v13.receiver = self;
  v13.super_class = (Class)UITableViewCell;
  v11 = -[UIView canPerformAction:withSender:](&v13, sel_canPerformAction_withSender_, a3, v6);
LABEL_16:

  return v11 & 1;
}

- (void)cut:(id)a3
{
  -[UITableViewCell _performAction:sender:](self, "_performAction:sender:", a2, a3);
}

- (void)copy:(id)a3
{
  -[UITableViewCell _performAction:sender:](self, "_performAction:sender:", a2, a3);
}

- (void)paste:(id)a3
{
  -[UITableViewCell _performAction:sender:](self, "_performAction:sender:", a2, a3);
}

uint64_t __34__UITableViewCell__setReordering___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 32) + 428;
  v2 = *(_WORD *)v1 & 0xFFEF | (*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 430) << 16);
  *(_WORD *)v1 &= ~0x10u;
  *(_BYTE *)(v1 + 2) = BYTE2(v2);
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateConfiguration");
}

- (BOOL)_drawsTopSeparatorDuringReordering
{
  return (*((_BYTE *)&self->_tableCellFlags + 2) & 0x80) == 0;
}

- (void)_setDrawsTopSeparatorDuringReordering:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0;
  else
    v3 = 0x800000;
  *(_DWORD *)&self->_tableCellFlags = *(_DWORD *)&self->_tableCellFlags & 0xFF7FFFFF | v3;
  -[UITableViewCell _updateSeparatorContent](self, "_updateSeparatorContent");
}

- (void)setAccessoryActionSegueTemplate:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_accessoryActionSegueTemplate != v5)
  {
    v6 = v5;
    objc_storeStrong(&self->_accessoryActionSegueTemplate, a3);
    v5 = v6;
  }

}

- (id)accessoryActionSegueTemplate
{
  return self->_accessoryActionSegueTemplate;
}

- (void)setSelectionSegueTemplate:(id)a3
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

- (id)selectionSegueTemplate
{
  return self->_selectionSegueTemplate;
}

- (BOOL)_shouldHaveFullLengthBottomSeparator
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 34) & 1;
}

- (BOOL)_shouldHaveFullLengthTopSeparator
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 35) & 1;
}

- (BOOL)_topSeparatorFollowsLayoutMargins
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 36) & 1;
}

- (UIEdgeInsets)_backgroundSeparatorInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[UITableViewCell separatorInset](self, "separatorInset");
  if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x400000000) != 0)
  {
    v6 = 0.0;
    v4 = 0.0;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)_drawsSeparatorAtTopOfSection
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 37) & 1;
}

- (BOOL)_drawsSeparatorAtBottomOfSection
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 38) & 1;
}

- (UITableViewCell)init
{
  return -[UITableViewCell initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 320.0, 44.0);
}

- (void)sendSubviewToBack:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendSubviewToBack:", v4);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewCell;
    -[UIView sendSubviewToBack:](&v8, sel_sendSubviewToBack_, v4);
  }

}

- (void)bringSubviewToFront:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bringSubviewToFront:", v4);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewCell;
    -[UIView bringSubviewToFront:](&v8, sel_bringSubviewToFront_, v4);
  }

}

- (void)_systemTextSizeChanged
{
  UILabel *textLabel;
  void *v4;
  UILabel *detailTextLabel;
  void *v6;
  UITextField **p_editableTextField;
  UITextField *editableTextField;
  void *v9;
  UITextField *v10;

  if (!dyld_program_sdk_at_least())
  {
    -[UITableViewCell _releaseTextLabel](self, "_releaseTextLabel");
    -[UITableViewCell _releaseDetailTextLabel](self, "_releaseDetailTextLabel");
    p_editableTextField = &self->_editableTextField;
    goto LABEL_12;
  }
  textLabel = self->_textLabel;
  if (textLabel && !-[UILabel adjustsFontForContentSizeCategory](textLabel, "adjustsFontForContentSizeCategory"))
  {
    -[UILabel attributedText](self->_textLabel, "attributedText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(self, &unk_1ECD7A412, v4, (void *)1);

    *(_QWORD *)((char *)&self->_tableCellFlags + 4) |= 0x4000000000000000uLL;
    -[UITableViewCell _releaseTextLabel](self, "_releaseTextLabel");
  }
  detailTextLabel = self->_detailTextLabel;
  if (detailTextLabel
    && !-[UILabel adjustsFontForContentSizeCategory](detailTextLabel, "adjustsFontForContentSizeCategory"))
  {
    -[UILabel attributedText](self->_detailTextLabel, "attributedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(self, &unk_1ECD7A413, v6, (void *)1);

    *(_QWORD *)((char *)&self->_tableCellFlags + 4) |= 0x8000000000000000;
    -[UITableViewCell _releaseDetailTextLabel](self, "_releaseDetailTextLabel");
  }
  p_editableTextField = &self->_editableTextField;
  editableTextField = self->_editableTextField;
  if (editableTextField
    && !-[UITextField adjustsFontForContentSizeCategory](editableTextField, "adjustsFontForContentSizeCategory"))
  {
    -[UITextField attributedText](*p_editableTextField, "attributedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(self, &unk_1ECD7A414, v9, (void *)1);

    *((_WORD *)&self->_tableCellFlags + 6) |= 1u;
LABEL_12:
    -[UITextField removeFromSuperview](*p_editableTextField, "removeFromSuperview");
    v10 = *p_editableTextField;
    *p_editableTextField = 0;

  }
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (UITableViewCell)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UITableViewCell *v5;
  UITableViewCell *v6;
  uint64_t v7;
  NSString *reuseIdentifier;
  unsigned int *p_tableCellFlags;
  int v10;
  int v11;
  void *v12;
  int v13;
  float v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  _UIContentViewInternal *viewForContentConfiguration;
  uint64_t v19;
  UIView *contentView;
  UITableViewCellContentView *v21;
  UITableViewCellContentView *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  UIView *v28;
  UIView *v29;
  void *v30;
  uint64_t v31;
  UILabel *textLabel;
  void *v33;
  void *v34;
  char v35;
  uint64_t v36;
  UILabel *detailTextLabel;
  uint64_t v38;
  UIImageView *imageView;
  uint64_t v40;
  _UISystemBackgroundView *systemBackgroundView;
  _UISystemBackgroundView *v42;
  uint64_t v43;
  UIView *backgroundView;
  uint64_t v45;
  UIView *selectedBackgroundView;
  uint64_t v47;
  UIView *multipleSelectionBackgroundView;
  uint64_t v49;
  UIView *customAccessoryView;
  int v51;
  _BOOL4 v52;
  uint64_t v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  uint64_t v58;
  UIStoryboardPreviewingSegueTemplateStorage *accessoryActionPreviewingSegueTemplateStorage;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = coder;
  v65.receiver = self;
  v65.super_class = (Class)UITableViewCell;
  v5 = -[UIView initWithCoder:](&v65, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[UITableViewCell _setupTableViewCellCommon](v5, "_setupTableViewCellCommon");
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIReuseIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    reuseIdentifier = v6->_reuseIdentifier;
    v6->_reuseIdentifier = (NSString *)v7;

    p_tableCellFlags = (unsigned int *)&v6->_tableCellFlags;
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIShowsReorderControl")))
      v10 = 0x200000;
    else
      v10 = 0;
    *p_tableCellFlags = *(_DWORD *)&v6->_tableCellFlags & 0xFFDFFFFF | v10;
    v11 = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UITableViewCellStyle"));
    *(_QWORD *)((char *)&v6->_tableCellFlags + 4) = *(_QWORD *)((char *)&v6->_tableCellFlags + 4) & 0xFFFFFFFFFC003FFFLL | ((unint64_t)(v11 & 0xFFF) << 14);
    +[UITableViewCellLayoutManager layoutManagerForTableViewCellStyle:](UITableViewCellLayoutManager, "layoutManagerForTableViewCellStyle:", ((unint64_t)(v11 << 14) >> 14) & 0xFFF);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell setLayoutManager:](v6, "setLayoutManager:", v12);

    v6->_indentationLevel = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIIndentationLevel"));
    -[UITableViewCell _setupModernAccessoriesLayout](v6, "_setupModernAccessoriesLayout");
    *p_tableCellFlags = *p_tableCellFlags & 0xFFFFFFF1 | 2;
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISeparatorStyle")))
      v13 = *p_tableCellFlags & 0xFFFFFFF1 | (2
                                            * (-[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UISeparatorStyle")) & 7));
    else
      v13 = *p_tableCellFlags;
    *p_tableCellFlags = v13 & 0xFFFFFF8F | 0x30;
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISelectionStyle")))
      *p_tableCellFlags = *p_tableCellFlags & 0xFFFFFF8F | (16
                                                          * (-[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UISelectionStyle")) & 7));
    *p_tableCellFlags = *p_tableCellFlags & 0xFFFF8FFF | ((-[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIEditingStyle")) & 7) << 12);
    *p_tableCellFlags = *p_tableCellFlags & 0xFFFC7FFF | ((-[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIAccessoryType")) & 7) << 15);
    *p_tableCellFlags = *p_tableCellFlags & 0xFFE3FFFF | ((-[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIEditingAccessoryType")) & 7) << 18);
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIIndentationWidth")))
    {
      -[NSCoder decodeFloatForKey:](v4, "decodeFloatForKey:", CFSTR("UIIndentationWidth"));
      -[UITableViewCell setIndentationWidth:](v6, "setIndentationWidth:", v14);
    }
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIContentConfigurationIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (*((_WORD *)&v6->_tableCellFlags + 6) & 0xFFBF | (*((unsigned __int8 *)&v6->_tableCellFlags + 14) << 16)) >> 16;
    *((_WORD *)&v6->_tableCellFlags + 6) = *((_WORD *)&v6->_tableCellFlags + 6) & 0xFFBF | ((v15 != 0) << 6);
    *((_BYTE *)&v6->_tableCellFlags + 14) = v16;

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIContentConfigurationView"));
    v17 = objc_claimAutoreleasedReturnValue();
    viewForContentConfiguration = v6->_viewForContentConfiguration;
    v6->_viewForContentConfiguration = (_UIContentViewInternal *)v17;

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIContentView"));
    v19 = objc_claimAutoreleasedReturnValue();
    contentView = v6->_contentView;
    v6->_contentView = (UIView *)v19;

    if (!v6->_contentView
      || (*((_WORD *)&v6->_tableCellFlags + 6) & 0x40) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v21 = [UITableViewCellContentView alloc];
      -[UIView frame](v6->_contentView, "frame");
      v22 = -[UITableViewCellContentView initWithFrame:](v21, "initWithFrame:");
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      -[UIView subviews](v6->_contentView, "subviews", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v62 != v26)
              objc_enumerationMutation(v23);
            -[UIView addSubview:](v22, "addSubview:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i));
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
        }
        while (v25);
      }

      if (v6->_contentView)
      {
        -[UIView insertSubview:belowSubview:](v6, "insertSubview:belowSubview:", v22);
        v28 = v6->_contentView;
      }
      else
      {
        v28 = 0;
      }
      -[UIView removeFromSuperview](v28, "removeFromSuperview");
      v29 = v6->_contentView;
      v6->_contentView = &v22->super;

    }
    -[UITableViewCell layoutManager](v6, "layoutManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "contentRectForCell:forState:", v6, 0);
    -[UIView setFrame:](v6->_contentView, "setFrame:");

    -[UITableViewCell _setupMenuGesture](v6, "_setupMenuGesture");
    if ((*((_WORD *)&v6->_tableCellFlags + 6) & 0x40) == 0)
    {
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UITextLabel"));
      v31 = objc_claimAutoreleasedReturnValue();
      textLabel = v6->_textLabel;
      v6->_textLabel = (UILabel *)v31;

      -[UILabel font](v6->_textLabel, "font");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCell _defaultFont](v6, "_defaultFont");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v33, "isEqual:", v34);

      if ((v35 & 1) == 0)
        *(_QWORD *)((char *)&v6->_tableCellFlags + 4) |= 0x40uLL;
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIDetailTextLabel"));
      v36 = objc_claimAutoreleasedReturnValue();
      detailTextLabel = v6->_detailTextLabel;
      v6->_detailTextLabel = (UILabel *)v36;

      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIImageView"));
      v38 = objc_claimAutoreleasedReturnValue();
      imageView = v6->_imageView;
      v6->_imageView = (UIImageView *)v38;

    }
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UISystemBackgroundView"));
    v40 = objc_claimAutoreleasedReturnValue();
    systemBackgroundView = v6->_systemBackgroundView;
    v6->_systemBackgroundView = (_UISystemBackgroundView *)v40;

    v42 = v6->_systemBackgroundView;
    if (v42)
    {
      -[UIView insertSubview:atIndex:](v6, "insertSubview:atIndex:", v42, 0);
    }
    else
    {
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIBackgroundView"));
      v43 = objc_claimAutoreleasedReturnValue();
      backgroundView = v6->_backgroundView;
      v6->_backgroundView = (UIView *)v43;

      if (v6->_backgroundView)
        *(_QWORD *)((char *)&v6->_tableCellFlags + 4) &= ~0x100uLL;
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UISelectedBackgroundView"));
      v45 = objc_claimAutoreleasedReturnValue();
      selectedBackgroundView = v6->_selectedBackgroundView;
      v6->_selectedBackgroundView = (UIView *)v45;

      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIMultipleSelectionBackgroundView"));
      v47 = objc_claimAutoreleasedReturnValue();
      multipleSelectionBackgroundView = v6->_multipleSelectionBackgroundView;
      v6->_multipleSelectionBackgroundView = (UIView *)v47;

      if (v6->_selectedBackgroundView)
        *(_QWORD *)((char *)&v6->_tableCellFlags + 4) &= ~0x80uLL;
    }
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UICustomAccessoryView"));
    v49 = objc_claimAutoreleasedReturnValue();
    customAccessoryView = v6->_customAccessoryView;
    v6->_customAccessoryView = (UIView *)v49;

    -[UIView setNeedsDisplayOnBoundsChange:](v6, "setNeedsDisplayOnBoundsChange:", 1);
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIDidEncodeCompatibilityBackgroundColor")))
    {
      -[UITableViewCell setBackgroundColor:](v6, "setBackgroundColor:", 0);
      v51 = *((_WORD *)&v6->_tableCellFlags + 6) & 0xFF7F | (*((unsigned __int8 *)&v6->_tableCellFlags + 14) << 16);
      *((_WORD *)&v6->_tableCellFlags + 6) &= ~0x80u;
      *((_BYTE *)&v6->_tableCellFlags + 14) = BYTE2(v51);
    }
    v52 = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UITableCellBackgroundColorSet"));
    v53 = 2048;
    if (v52)
      v53 = 268437504;
    *(_QWORD *)((char *)&v6->_tableCellFlags + 4) = *(_QWORD *)((char *)&v6->_tableCellFlags + 4) & 0xFFFFFFFFEFFFFFFFLL | v53;
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISeparatorInset")))
    {
      -[NSCoder decodeUIEdgeInsetsForKey:](v4, "decodeUIEdgeInsetsForKey:", CFSTR("UISeparatorInset"));
      v6->_separatorInset.top = v54;
      v6->_separatorInset.left = v55;
      v6->_separatorInset.bottom = v56;
      v6->_separatorInset.right = v57;
    }
    *(_QWORD *)((char *)&v6->_tableCellFlags + 4) &= 0xFFF8FFFFFFFFFFFFLL;
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIFocusStyle")))
      *(_QWORD *)((char *)&v6->_tableCellFlags + 4) = *(_QWORD *)((char *)&v6->_tableCellFlags + 4) & 0xFFF8FFFFFFFFFFFFLL | ((-[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIFocusStyle")) & 7) << 48);
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIAccessoryActionPreviewingSegueTemplateStorage"));
    v58 = objc_claimAutoreleasedReturnValue();
    accessoryActionPreviewingSegueTemplateStorage = v6->_accessoryActionPreviewingSegueTemplateStorage;
    v6->_accessoryActionPreviewingSegueTemplateStorage = (UIStoryboardPreviewingSegueTemplateStorage *)v58;

  }
  return v6;
}

- (id)_encodableSubviews
{
  void *v2;
  void *v3;

  if (self->_floatingContentView)
  {
    -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "subviews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIView subviews](self, "subviews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_populateArchivedSubviews:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  -[UITableViewCell _encodableSubviews](self, "_encodableSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v4);
  if (-[UITableViewCell _usesModernAccessoriesLayout](self, "_usesModernAccessoriesLayout"))
  {
    -[UITableViewCell _existingSystemAccessoryViews](self, "_existingSystemAccessoryViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "minusSet:", v5);

  }
  else
  {
    if (self->_accessoryView)
      objc_msgSend(v7, "removeObject:");
    if (self->_editingAccessoryView)
      objc_msgSend(v7, "removeObject:");
  }
  if (self->_systemBackgroundView)
    objc_msgSend(v7, "removeObject:");
  v6 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  if ((v6 & 0x100) != 0)
  {
    objc_msgSend(v7, "removeObject:", self->_backgroundView);
    v6 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  }
  if ((v6 & 0x80) != 0)
    objc_msgSend(v7, "removeObject:", self->_selectedBackgroundView);

}

- (void)_encodeBackgroundColorWithCoder:(id)a3
{
  _UISystemBackgroundView *systemBackgroundView;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  systemBackgroundView = self->_systemBackgroundView;
  if (systemBackgroundView)
  {
    -[_UISystemBackgroundView configuration](systemBackgroundView, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView tintColor](self, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resolvedBackgroundColorForTintColor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("UIBackgroundColor"));
      objc_msgSend(v9, "encodeBool:forKey:", 1, CFSTR("UIDidEncodeCompatibilityBackgroundColor"));
LABEL_6:

    }
  }
  else
  {
    -[UIView _backgroundColor](self, "_backgroundColor");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v7 = (void *)v8;
      objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("UIBackgroundColor"));
      goto LABEL_6;
    }
  }

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *reuseIdentifier;
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  uint64_t v7;
  int64_t indentationLevel;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double indentationWidth;
  UIView *backgroundView;
  UIView *customAccessoryView;
  UIView *selectedBackgroundView;
  UIView *multipleSelectionBackgroundView;
  uint64_t v20;
  void *v21;
  id v22;
  objc_class *v23;
  void *v24;
  UIStoryboardPreviewingSegueTemplateStorage *accessoryActionPreviewingSegueTemplateStorage;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)UITableViewCell;
  -[UIView encodeWithCoder:](&v26, sel_encodeWithCoder_, v4);
  reuseIdentifier = self->_reuseIdentifier;
  if (reuseIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", reuseIdentifier, CFSTR("UIReuseIdentifier"));
  p_tableCellFlags = &self->_tableCellFlags;
  if ((*((_BYTE *)&self->_tableCellFlags + 2) & 0x20) != 0)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIShowsReorderControl"));
  v7 = (*((_DWORD *)&self->_tableCellFlags + 1) >> 14) & 0xFFF;
  if ((_DWORD)v7)
    objc_msgSend(v4, "encodeInteger:forKey:", v7, CFSTR("UITableViewCellStyle"));
  indentationLevel = self->_indentationLevel;
  if (indentationLevel)
    objc_msgSend(v4, "encodeInteger:forKey:", indentationLevel, CFSTR("UIIndentationLevel"));
  v9 = *(_DWORD *)p_tableCellFlags;
  v10 = (v9 >> 1) & 7;
  if ((_DWORD)v10 != 1)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", v10, CFSTR("UISeparatorStyle"));
    LODWORD(v9) = *(_DWORD *)p_tableCellFlags;
  }
  v11 = (v9 >> 4) & 7;
  if ((_DWORD)v11 != 3)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", v11, CFSTR("UISelectionStyle"));
    LODWORD(v9) = *(_DWORD *)p_tableCellFlags;
  }
  v12 = (v9 >> 12) & 7;
  if ((_DWORD)v12)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", v12, CFSTR("UIEditingStyle"));
    LODWORD(v9) = *(_DWORD *)p_tableCellFlags;
  }
  v13 = (v9 >> 15) & 7;
  if ((_DWORD)v13)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", v13, CFSTR("UIAccessoryType"));
    LODWORD(v9) = *(_DWORD *)p_tableCellFlags;
  }
  v14 = (v9 >> 18) & 7;
  if ((_DWORD)v14)
    objc_msgSend(v4, "encodeInteger:forKey:", v14, CFSTR("UIEditingAccessoryType"));
  if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x2000) != 0)
  {
    indentationWidth = self->_indentationWidth;
    *(float *)&indentationWidth = indentationWidth;
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UIIndentationWidth"), indentationWidth);
  }
  if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x100) == 0)
  {
    backgroundView = self->_backgroundView;
    if (backgroundView)
      objc_msgSend(v4, "encodeObject:forKey:", backgroundView, CFSTR("UIBackgroundView"));
  }
  customAccessoryView = self->_customAccessoryView;
  if (customAccessoryView)
    objc_msgSend(v4, "encodeObject:forKey:", customAccessoryView, CFSTR("UICustomAccessoryView"));
  if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x80) == 0)
  {
    selectedBackgroundView = self->_selectedBackgroundView;
    if (selectedBackgroundView)
      objc_msgSend(v4, "encodeObject:forKey:", selectedBackgroundView, CFSTR("UISelectedBackgroundView"));
  }
  multipleSelectionBackgroundView = self->_multipleSelectionBackgroundView;
  if (multipleSelectionBackgroundView && multipleSelectionBackgroundView != self->_selectedBackgroundView)
    objc_msgSend(v4, "encodeObject:forKey:", multipleSelectionBackgroundView, CFSTR("UIMultipleSelectionBackgroundView"));
  if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x10000000) != 0)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UITableCellBackgroundColorSet"));
  if (self->_separatorInset.left != -1.0 || self->_separatorInset.right != -1.0)
    objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", CFSTR("UISeparatorInset"), self->_separatorInset.top);
  v20 = *((_WORD *)&self->_tableCellFlags + 5) & 7;
  if (v20)
    objc_msgSend(v4, "encodeInteger:forKey:", v20, CFSTR("UIFocusStyle"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_systemBackgroundView, CFSTR("UISystemBackgroundView"));
  if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x40) != 0)
  {
    -[UITableViewCell contentConfiguration](self, "contentConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = v21;
    }
    else
    {
      -[UITableViewCell _contentViewConfiguration](self, "_contentViewConfiguration");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        v24 = 0;
LABEL_47:
        objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("UIContentConfigurationIdentifier"));

        goto LABEL_48;
      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v22, "_wrappedConfigurationIdentifier");
    }
    else
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_47;
  }
LABEL_48:
  objc_msgSend(v4, "encodeObject:forKey:", self->_viewForContentConfiguration, CFSTR("UIContentConfigurationView"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentView, CFSTR("UIContentView"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_textLabel, CFSTR("UITextLabel"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_detailTextLabel, CFSTR("UIDetailTextLabel"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageView, CFSTR("UIImageView"));
  accessoryActionPreviewingSegueTemplateStorage = self->_accessoryActionPreviewingSegueTemplateStorage;
  if (accessoryActionPreviewingSegueTemplateStorage)
    objc_msgSend(v4, "encodeObject:forKey:", accessoryActionPreviewingSegueTemplateStorage, CFSTR("UIAccessoryActionPreviewingSegueTemplateStorage"));

}

- (void)setDrawingEnabled:(BOOL)a3
{
  unint64_t v3;
  int v5;
  uint64_t v6;
  void *v7;

  v3 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  if ((v3 & 0x1000) != 0 && ((v3 >> 13) & 1) == a3)
  {
    v5 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    v6 = 0x2000;
    if (a3)
      v6 = 0;
    *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
    *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v5);
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFFFFFFFFFFFDFFFLL | v6;
    if (a3)
    {
      if (dyld_program_sdk_at_least())
        -[UITableViewCell _setContentView:](self, "_setContentView:", 0);
      else
        -[UIView removeFromSuperview](self->_contentView, "removeFromSuperview");
    }
    else if (!self->_contentView && (dyld_program_sdk_at_least() & 1) == 0)
    {
      -[UITableViewCell _createDefaultContentView](self, "_createDefaultContentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCell _setContentView:](self, "_setContentView:", v7);

      -[UITableViewCell _didCreateContentView](self, "_didCreateContentView");
    }
    -[UITableViewCell _setNeedsSeparatorUpdate](self, "_setNeedsSeparatorUpdate");
    -[UIView _updateNeedsDisplayOnBoundsChange](self);
  }
}

- (void)setText:(NSString *)text
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  void *v7;
  NSString *v8;

  v4 = text;
  v5 = v4;
  v8 = v4;
  if (v4 && (v6 = -[NSString isEqualToString:](v4, "isEqualToString:", &stru_1E16EDF20), v5 = v8, !v6))
  {
    -[UITableViewCell _textLabel](self, "_textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v8);

    -[UIView setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }
  else if (self->_textLabel)
  {
    -[UITableViewCell _releaseTextLabel](self, "_releaseTextLabel");
    v5 = v8;
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) &= ~0x40uLL;
  }

}

- (NSString)text
{
  void *v2;
  void *v3;

  -[UITableViewCell _textLabel:](self, "_textLabel:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_setFont:(id)a3 layout:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;

  v4 = a4;
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) |= 0x40uLL;
  v6 = a3;
  -[UITableViewCell _textLabel](self, "_textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  if (v4)
    -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setFont:(UIFont *)font
{
  -[UITableViewCell _setFont:layout:](self, "_setFont:layout:", font, 1);
}

- (UIFont)font
{
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  p_tableCellFlags = &self->_tableCellFlags;
  if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x40) == 0)
  {
    -[UITableViewCell _defaultFont](self, "_defaultFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell _textLabel](self, "_textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v4);

    *(_QWORD *)((char *)p_tableCellFlags + 4) |= 0x40uLL;
  }
  -[UITableViewCell _textLabel](self, "_textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v7;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
  id v4;

  -[UITableViewCell _textLabel](self, "_textLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextAlignment:", textAlignment);

}

- (NSTextAlignment)textAlignment
{
  void *v2;
  NSTextAlignment v3;

  -[UITableViewCell _textLabel](self, "_textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "textAlignment");

  return v3;
}

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode
{
  void *v5;

  -[UITableViewCell _textLabel](self, "_textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineBreakMode:", lineBreakMode);

  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (NSLineBreakMode)lineBreakMode
{
  void *v2;
  NSLineBreakMode v3;

  -[UITableViewCell _textLabel](self, "_textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lineBreakMode");

  return v3;
}

- (void)setTextColor:(UIColor *)textColor
{
  UIColor *v4;
  void *v5;

  v4 = textColor;
  -[UITableViewCell _textLabel](self, "_textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (UIColor)textColor
{
  void *v2;
  void *v3;

  -[UITableViewCell _textLabel](self, "_textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setSelectedTextColor:(UIColor *)selectedTextColor
{
  UIColor *v4;
  id v5;

  v4 = selectedTextColor;
  -[UITableViewCell _textLabel](self, "_textLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlightedTextColor:", v4);

}

- (UIColor)selectedTextColor
{
  void *v2;
  void *v3;

  -[UITableViewCell _textLabel](self, "_textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightedTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setImage:(UIImage *)image
{
  UIImage *v4;
  id v5;

  v4 = image;
  -[UITableViewCell _imageView](self, "_imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[UITableViewCell _imageView](self, "_imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setSelectedImage:(UIImage *)selectedImage
{
  UIImage *v4;
  id v5;

  v4 = selectedImage;
  -[UITableViewCell _imageView](self, "_imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlightedImage:", v4);

}

- (UIImage)selectedImage
{
  void *v2;
  void *v3;

  -[UITableViewCell _imageView](self, "_imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightedImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)_setBadgeText:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  BOOL v10;
  void *v11;
  char v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  if (-[UITableViewCell _usesModernAccessoriesLayout](self, "_usesModernAccessoriesLayout"))
  {
    -[UITableViewCell _badgeText](self, "_badgeText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v17;
    v6 = v4;
    if (v6 == v5)
    {

    }
    else
    {
      v7 = v6;
      if (v5 && v6)
      {
        v8 = objc_msgSend(v5, "isEqual:", v6);

        if ((v8 & 1) != 0)
          goto LABEL_16;
      }
      else
      {

      }
      v10 = objc_msgSend(v5, "length") != 0;
      -[UITableViewCell _badgeText](self, "_badgeText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10 ^ (objc_msgSend(v11, "length") == 0);

      v13 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
      v14 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
      if (v5)
      {
        *(_QWORD *)((char *)&self->_tableCellFlags + 4) = v14 | 0x2000000000000000;
        *((_WORD *)&self->_tableCellFlags + 6) = v13;
        *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v13);
        -[UITableViewCell _badge](self, "_badge");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setText:", v5);

      }
      else
      {
        *(_QWORD *)((char *)&self->_tableCellFlags + 4) = v14 & 0xDFFFFFFFFFFFFFFFLL;
        *((_WORD *)&self->_tableCellFlags + 6) = v13;
        *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v13);
      }
      if ((v12 & 1) != 0)
      {
        -[UITableViewCell _accessoryManager](self, "_accessoryManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setNeedsLayout");

      }
      else
      {
        -[UITableViewCell _setNeedsAccessoriesUpdate](self, "_setNeedsAccessoriesUpdate");
      }
    }
  }
  else
  {
    -[UITableViewCell _badge](self, "_badge");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v17);

    objc_msgSend(self->_badge, "setNeedsDisplay");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_16:

}

- (void)_setBadgeFont:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UITableViewCell _badge](self, "_badge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  if (-[UITableViewCell _usesModernAccessoriesLayout](self, "_usesModernAccessoriesLayout"))
  {
    -[UITableViewCell _accessoryManager](self, "_accessoryManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
  else
  {
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_badgeFont
{
  void *v2;
  void *v3;

  -[UITableViewCell _badge](self, "_badge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setBadgeColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITableViewCell _badge](self, "_badge");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v4);

}

- (id)_badgeColor
{
  void *v2;
  void *v3;

  -[UITableViewCell _badge](self, "_badge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_existingContentView
{
  return self->_contentView;
}

void __57__UITableViewCell__setupChangeHandlersForNewContentView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSeparatorContent:", 1);

}

void __57__UITableViewCell__setupChangeHandlersForNewContentView___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updatePopupMenuButtonFromContentView");

}

void __57__UITableViewCell__setupChangeHandlersForNewContentView___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateDefaultBackgroundAppearance");

}

id __57__UITableViewCell__setupChangeHandlersForNewContentView___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "defaultContentConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "configurationState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updatedConfigurationForState:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIListContentConfiguration)defaultContentConfiguration
{
  int v2;
  void *v3;

  v2 = (*((_DWORD *)&self->_tableCellFlags + 1) >> 14) & 0xFFF;
  if ((v2 - 1) >= 2)
  {
    if (v2 == 3)
    {
      +[UIListContentConfiguration subtitleCellConfiguration](UIListContentConfiguration, "subtitleCellConfiguration");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[UITableViewCell _usesRoundedGroups](self, "_usesRoundedGroups"))
        +[UIListContentConfiguration _defaultInsetGroupedCellConfiguration](UIListContentConfiguration, "_defaultInsetGroupedCellConfiguration");
      else
        +[UIListContentConfiguration cellConfiguration](UIListContentConfiguration, "cellConfiguration");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[UIListContentConfiguration valueCellConfiguration](UIListContentConfiguration, "valueCellConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIListContentConfiguration *)v3;
}

- (void)_setContentViewConfiguration:(id)a3
{
  -[UITableViewCell _applyContentViewConfiguration:withState:usingSPI:](self, "_applyContentViewConfiguration:withState:usingSPI:", a3, 0, 1);
}

- (id)contentConfiguration
{
  void *viewForContentConfiguration;

  if ((*((_WORD *)&self->_tableCellFlags + 6) & 0x40) == 0)
    return 0;
  viewForContentConfiguration = self->_viewForContentConfiguration;
  if (viewForContentConfiguration)
  {
    objc_msgSend(viewForContentConfiguration, "configuration");
    viewForContentConfiguration = (void *)objc_claimAutoreleasedReturnValue();
  }
  return viewForContentConfiguration;
}

- (void)setAutomaticallyUpdatesContentConfiguration:(BOOL)automaticallyUpdatesContentConfiguration
{
  id contentViewConfigurationProvider;
  char *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;

  if (automaticallyUpdatesContentConfiguration)
  {
    contentViewConfigurationProvider = self->_contentViewConfigurationProvider;
    v4 = (char *)&self->_tableCellFlags + 4;
    v5 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
    v6 = *((unsigned __int16 *)&self->_tableCellFlags + 6);
    v7 = v6 | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    if ((contentViewConfigurationProvider == 0) != ((v6 & 0x4000) == 0))
      return;
    if (!contentViewConfigurationProvider)
    {
      *(_QWORD *)v4 = v5;
      *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v7);
      *((_WORD *)&self->_tableCellFlags + 6) = v7 | 0x4000;
      -[UITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
      return;
    }
  }
  else
  {
    v4 = (char *)&self->_tableCellFlags + 4;
    v5 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
    v8 = *((unsigned __int16 *)&self->_tableCellFlags + 6);
    v7 = v8 | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    if ((v8 & 0x4000) == 0)
      return;
  }
  *(_QWORD *)v4 = v5;
  v4[10] = BYTE2(v7);
  *((_WORD *)v4 + 4) = v7 & 0xBFFF;
}

- (BOOL)automaticallyUpdatesContentConfiguration
{
  return ((unint64_t)*((unsigned __int16 *)&self->_tableCellFlags + 6) >> 14) & 1;
}

- (void)_setContentViewConfigurationProvider:(id)a3
{
  int v4;
  void *v5;
  id contentViewConfigurationProvider;

  if (self->_contentViewConfigurationProvider != a3)
  {
    if (a3)
    {
      v4 = *((_WORD *)&self->_tableCellFlags + 6) & 0xBFFF | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
      *((_WORD *)&self->_tableCellFlags + 6) &= ~0x4000u;
      *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v4);
    }
    v5 = (void *)objc_msgSend(a3, "copy");
    contentViewConfigurationProvider = self->_contentViewConfigurationProvider;
    self->_contentViewConfigurationProvider = v5;

    -[UITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (id)_contentViewConfigurationProvider
{
  return _Block_copy(self->_contentViewConfigurationProvider);
}

uint64_t __54__UITableViewCell_setSelectedBackgroundView_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 576), "setAlpha:", 1.0);
}

uint64_t __54__UITableViewCell_setSelectedBackgroundView_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (id)_forSpringBoardDefaultSelectedBackgroundView
{
  return self->_selectedBackgroundView;
}

- (void)_forSpringBoardSetDefaultSelectedBackgroundView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  UIVisualEffectView *v7;
  void *v8;
  void *v9;
  void *v10;
  UIView *v11;
  void *v12;
  id v13;

  v4 = a3;
  if (v4 && !self->_selectedBackgroundView)
  {
    v13 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v13;
      objc_msgSend(v5, "effect");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", v6);
      objc_msgSend(v5, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "backgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[UIVisualEffectView contentView](v7, "contentView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setBackgroundColor:", v9);

      }
    }
    else
    {
      v11 = [UIView alloc];
      v7 = -[UIView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    }
    objc_msgSend(v13, "backgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v12);

    -[UITableViewCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v7);
    v4 = v13;
  }

}

uint64_t __46__UITableViewCell__setDefaultBackgroundColor___block_invoke(uint64_t a1)
{
  _WORD *v2;
  __int16 v3;
  uint64_t result;
  uint64_t v5;
  int v6;
  unsigned int v7;

  v2 = *(_WORD **)(a1 + 32);
  v3 = v2[214];
  result = objc_msgSend(v2, "setBackgroundColor:", *(_QWORD *)(a1 + 40));
  v6 = *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 428);
  v5 = *(_QWORD *)(a1 + 32) + 428;
  v7 = v6 & 0xFFFFFF7F | (*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 430) << 16);
  *(_WORD *)v5 = v6 & 0xFF7F | v3 & 0x80;
  *(_BYTE *)(v5 + 2) = BYTE2(v7);
  return result;
}

- (id)separatorColor
{
  return self->_separatorColor;
}

- (id)sectionBorderColor
{
  return self->_sectionBorderColor;
}

- (void)_saveOpaqueViewState:(id)a3
{
  UIView *v4;
  UITableViewCellUnhighlightedState *v5;
  void *v6;
  __CFDictionary *unhighlightedStates;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (UIView *)a3;
  if (-[UITableViewCell _changesOpaqueStateOfSubviews](self, "_changesOpaqueStateOfSubviews"))
  {
    if (-[UITableViewCell _shouldChangeOpaqueStateOfView:](self, "_shouldChangeOpaqueStateOfView:", v4))
    {
      v5 = objc_alloc_init(UITableViewCellUnhighlightedState);
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          && ((*(_DWORD *)&self->_tableCellFlags & 0x7100) != 0x3100 || self->_multipleSelectionBackgroundView))
        {
          -[UITableViewCellUnhighlightedState setHighlighted:](v5, "setHighlighted:", -[UIView isHighlighted](v4, "isHighlighted"));
        }
      }
      -[UITableViewCellUnhighlightedState setOpaque:](v5, "setOpaque:", -[UIView isOpaque](v4, "isOpaque"));
      -[UIView backgroundColor](v4, "backgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCellUnhighlightedState setBackgroundColor:](v5, "setBackgroundColor:", v6);

      unhighlightedStates = self->_unhighlightedStates;
      if (!unhighlightedStates)
      {
        self->_unhighlightedStates = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
        -[UIView _setMonitorsSubtree:](self, "_setMonitorsSubtree:", 1);
        unhighlightedStates = self->_unhighlightedStates;
      }
      CFDictionaryAddValue(unhighlightedStates, v4, v5);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && self->_selectedBackgroundView != v4)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      -[UIView subviews](v4, "subviews", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v14;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v14 != v11)
              objc_enumerationMutation(v8);
            -[UITableViewCell _saveOpaqueViewState:](self, "_saveOpaqueViewState:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v10);
      }

    }
  }

}

- (void)_clearOpaqueViewState:(id)a3
{
  id v4;
  __CFDictionary *unhighlightedStates;
  void *v6;
  void *v7;
  void *v8;
  void *key;

  v4 = a3;
  unhighlightedStates = self->_unhighlightedStates;
  if (unhighlightedStates)
  {
    key = v4;
    CFDictionaryGetValue(unhighlightedStates, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(key, "setOpaque:", objc_msgSend(v6, "opaque"));
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(key, "setHighlighted:", objc_msgSend(v7, "highlighted"));
      }
      objc_msgSend(v7, "backgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(key, "setBackgroundColor:", v8);

      CFDictionaryRemoveValue(self->_unhighlightedStates, key);
    }

    v4 = key;
  }

}

- (id)_multiselectBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;

  -[UITableViewCell _constants](self, "_constants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell _tableView](self, "_tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultMultiSelectBackgroundColorForCell:inTableView:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_ignoresMultipleSelectionDuringEditing
{
  return ((unint64_t)*((unsigned __int16 *)&self->_tableCellFlags + 6) >> 2) & 1;
}

- (void)_setIgnoresMultipleSelectionDuringEditing:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_tableCellFlags + 6) & 0xFFFB | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
  if (a3)
    v4 = 4;
  else
    v4 = 0;
  *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6) & 0xFFFB | v4;
  *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v3);
}

- (void)_setOpaque:(BOOL)a3 forSubview:(id)a4
{
  _BOOL8 v4;
  UIView *v6;
  __CFDictionary *unhighlightedStates;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = (UIView *)a4;
  if (!-[UITableViewCell _changesOpaqueStateOfSubviews](self, "_changesOpaqueStateOfSubviews"))
    goto LABEL_38;
  if (v4)
  {
    unhighlightedStates = self->_unhighlightedStates;
    if (!unhighlightedStates)
      goto LABEL_38;
    CFDictionaryGetValue(unhighlightedStates, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && -[UITableViewCell _shouldChangeOpaqueStateOfView:](self, "_shouldChangeOpaqueStateOfView:", v6))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          && ((*(_DWORD *)&self->_tableCellFlags & 0x7100) != 0x3100 || self->_multipleSelectionBackgroundView))
        {
          -[UIView setHighlighted:](v6, "setHighlighted:", objc_msgSend(v8, "highlighted"));
        }
      }
      -[UIView setOpaque:](v6, "setOpaque:", objc_msgSend(v8, "opaque"));
      objc_msgSend(v8, "backgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v9);

    }
LABEL_27:

    goto LABEL_28;
  }
  if (-[UITableViewCell _shouldChangeOpaqueStateOfView:](self, "_shouldChangeOpaqueStateOfView:", v6))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        && ((*(_DWORD *)&self->_tableCellFlags & 0x7100) != 0x3100 || self->_multipleSelectionBackgroundView))
      {
        CFDictionaryGetValue(self->_unhighlightedStates, v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
          v12 = objc_msgSend(v10, "highlighted");
        else
          v12 = 0;
        -[UIView setHighlighted:](v6, "setHighlighted:", v12);

      }
    }
    if ((*(_DWORD *)&self->_tableCellFlags & 0x7100) == 0x3100 && !self->_multipleSelectionBackgroundView)
    {
      if (!-[UIView isOpaque](v6, "isOpaque"))
        goto LABEL_28;
      -[UITableViewCell _multiselectBackgroundColor](self, "_multiselectBackgroundColor");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIView setOpaque:](v6, "setOpaque:", 0);
      +[UIColor clearColor](UIColor, "clearColor");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v13;
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v13);
    goto LABEL_27;
  }
LABEL_28:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && self->_selectedBackgroundView != v6)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[UIView subviews](v6, "subviews", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          -[UITableViewCell _setOpaque:forSubview:](self, "_setOpaque:forSubview:", v4, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v16);
    }

  }
LABEL_38:

}

- (void)setSelectionTintColor:(id)a3
{
  -[UITableViewCell _setSelectionStyle:selectionTintColor:](self, "_setSelectionStyle:selectionTintColor:", 3, a3);
}

- (id)selectionTintColor
{
  return self->_selectionTintColor;
}

- (BOOL)_hasCustomSelectionAction
{
  void *v2;
  BOOL v3;

  -[UITableViewCell _effectivePopupMenuButton](self, "_effectivePopupMenuButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_performCustomSelectionAction
{
  void *v2;
  id v3;

  -[UITableViewCell _effectivePopupMenuButton](self, "_effectivePopupMenuButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "performPrimaryAction");
    v2 = v3;
  }

}

- (CGRect)backgroundRectForBounds:(CGRect)a3
{
  void *v4;
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
  double v15;
  double v16;
  CGRect result;

  -[UITableViewCell layoutManager](self, "layoutManager", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundEndingRectForCell:forNewEditingState:", self, -[UITableViewCell isEditing](self, "isEditing"));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)contentRectForBounds:(CGRect)a3
{
  void *v4;
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
  double v15;
  double v16;
  CGRect result;

  -[UITableViewCell layoutManager](self, "layoutManager", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentEndingRectForCell:forNewEditingState:", self, -[UITableViewCell isEditing](self, "isEditing"));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)textRectForContentRect:(CGRect)a3
{
  void *v4;
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
  double v15;
  double v16;
  CGRect v17;
  CGRect result;

  -[UITableViewCell layoutManager](self, "layoutManager", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  objc_msgSend(v4, "textRectForCell:rowWidth:forSizing:", self, 0, CGRectGetWidth(v17));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  void *v4;
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
  double v15;
  double v16;
  CGRect result;

  -[UITableViewCell layoutManager](self, "layoutManager", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "standardLayoutImageViewFrameForCell:forSizing:", self, 0);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)accessoryRectForBounds:(CGRect)a3
{
  void *v4;
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
  double v15;
  double v16;
  CGRect result;

  -[UITableViewCell layoutManager](self, "layoutManager", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:", self, -[UITableViewCell isEditing](self, "isEditing"), *(_DWORD *)&self->_tableCellFlags & 1);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)reorderRectForBounds:(CGRect)a3
{
  void *v4;
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
  double v15;
  double v16;
  CGRect result;

  -[UITableViewCell layoutManager](self, "layoutManager", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reorderControlEndingRectForCell:forNewEditingState:showingDeleteConfirmation:", self, -[UITableViewCell isEditing](self, "isEditing"), *(_DWORD *)&self->_tableCellFlags & 1);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)dragStateDidChange:(UITableViewCellDragState)dragState
{
  UITableConstants *constants;
  void *v5;

  if (dragState != UITableViewCellDragStateLifting)
  {
    if (dragState == UITableViewCellDragStateDragging)
    {
      constants = self->_constants;
      -[UITableViewCell _tableView](self, "_tableView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableConstants defaultAlphaForDraggingCell:inTableView:](constants, "defaultAlphaForDraggingCell:inTableView:", self, v5);
      -[UIView setAlpha:](self, "setAlpha:");

    }
    dragState = UITableViewCellDragStateNone;
  }
  -[UITableViewCell _setDragging:](self, "_setDragging:", dragState);
}

- (void)_updateUserInteractionEnabledForNewDragState:(int64_t)a3
{
  _BOOL8 v5;
  _BOOL8 v6;
  uint64_t v7;
  BOOL v8;
  _BOOL4 v9;
  int v10;
  _BOOL4 v11;
  uint64_t v12;

  v5 = -[UITableViewCell userInteractionEnabledWhileDragging](self, "userInteractionEnabledWhileDragging");
  v6 = v5;
  if (a3 == 2)
  {
    if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x300000000000000) == 0)
    {
      v11 = -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled");
      v12 = 0x100000000000000;
      if (v11)
        v12 = 0x200000000000000;
      *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0xFCFFFFFFFFFFFFFFLL | v12;
      -[UITableViewCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v6);
    }
  }
  else if (!a3)
  {
    v7 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
    v8 = (v7 & 0x300000000000000) == 0x200000000000000 && !v5;
    v9 = (v7 & 0x300000000000000) == 0x100000000000000 && v5;
    if (v8 || v9)
    {
      -[UITableViewCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
      v10 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
      v7 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
    }
    else
    {
      v10 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    }
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) = v7 & 0xFCFFFFFFFFFFFFFFLL;
    *((_WORD *)&self->_tableCellFlags + 6) = v10;
    *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v10);
  }
}

- (BOOL)_isDragging
{
  return self->_dragState == 1;
}

- (BOOL)_isDropTarget
{
  return self->_dropState == 2;
}

- (BOOL)userInteractionEnabledWhileDragging
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 55) & 1;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  objc_super v6;

  v3 = a3;
  v5 = -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled");
  if (v5 != v3)
    -[UITableViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
  v6.receiver = self;
  v6.super_class = (Class)UITableViewCell;
  -[UIView setUserInteractionEnabled:](&v6, sel_setUserInteractionEnabled_, v3);
  if (v5 != -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
    -[UITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)_updateShowingSelectedBackground
{
  if (self->_selectedBackgroundView || self->_multipleSelectionBackgroundView)
    -[UITableViewCell showSelectedBackgroundView:animated:](self, "showSelectedBackgroundView:animated:", -[UITableViewCell _shouldUseHighlightedOrSelectedAppearance](self, "_shouldUseHighlightedOrSelectedAppearance"), 0);
  else
    -[UITableViewCell _updateCellForCurrentBackgroundConfiguration](self, "_updateCellForCurrentBackgroundConfiguration");
}

- (void)showSelectedBackgroundView:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  UITableViewCellContentMirror *v14;
  UIView *v15;
  UIView *selectedOverlayView;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  UIView *v24;
  _QWORD v25[5];
  BOOL v26;
  _QWORD v27[4];
  id v28;
  UITableViewCell *v29;
  BOOL v30;

  v4 = a4;
  v5 = a3;
  p_tableCellFlags = &self->_tableCellFlags;
  if ((*(_DWORD *)&self->_tableCellFlags & 0x100) != 0)
  {
    if ((*(_DWORD *)&self->_tableCellFlags & 0x7000) == 0x3000)
    {
      v8 = 1;
    }
    else
    {
      -[UITableViewCell _tableView](self, "_tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "allowsMultipleSelectionDuringEditing"))
        v8 = (*((_WORD *)p_tableCellFlags + 6) & 4) == 0;
      else
        v8 = 0;

    }
  }
  else
  {
    v8 = 0;
  }
  -[UITableViewCell _selectedBackgroundView:](self, "_selectedBackgroundView:", 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v5 && v10)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v11, "setMultiselect:", v8);
      -[UITableViewCell _multiselectBackgroundColor](self, "_multiselectBackgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setMultiselectBackgroundColor:", v12);

    }
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v11, 0);
    if (!v8)
    {
      -[UITableViewCell _applySelectedStateToSeparators:](self, "_applySelectedStateToSeparators:", 1);
      -[UITableViewCell _tableView](self, "_tableView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_cellDidShowSelectedBackground:", self);

    }
    if (self->_backgroundView)
      -[UITableViewCell sendSubviewToBack:](self, "sendSubviewToBack:");
    if ((*(_QWORD *)((char *)p_tableCellFlags + 4) & 0x1000) != 0 && !self->_selectedOverlayView)
    {
      v14 = [UITableViewCellContentMirror alloc];
      -[UIView bounds](self, "bounds");
      v15 = -[UITableViewCellContentMirror initWithFrame:](v14, "initWithFrame:");
      selectedOverlayView = self->_selectedOverlayView;
      self->_selectedOverlayView = v15;

      -[UIView addSubview:](self, "addSubview:", self->_selectedOverlayView);
    }
    if (v4)
      goto LABEL_21;
  }
  else
  {
    -[UITableViewCell _applySelectedStateToSeparators:](self, "_applySelectedStateToSeparators:", 0);
    -[UITableViewCell _tableView](self, "_tableView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_cellDidHideSelectedBackground:", self);

    if (v4)
    {
LABEL_21:
      objc_msgSend(v11, "setAlpha:", (double)!v5);
      -[UITableViewCell _layoutSystemBackgroundView:](self, "_layoutSystemBackgroundView:", 1);
      -[UITableViewCell selectionFadeDuration](self, "selectionFadeDuration");
      v18 = v17;
      v19 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __55__UITableViewCell_showSelectedBackgroundView_animated___block_invoke;
      v27[3] = &unk_1E16B4008;
      v30 = v5;
      v28 = v11;
      v29 = self;
      v25[0] = v19;
      v25[1] = 3221225472;
      v25[2] = __55__UITableViewCell_showSelectedBackgroundView_animated___block_invoke_2;
      v25[3] = &unk_1E16B7F38;
      v26 = v5;
      v25[4] = self;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v27, v25, v18, 0.0);
      *(_QWORD *)((char *)p_tableCellFlags + 4) |= 0x8000000uLL;
      if (v5)
        -[UITableViewCell _updateAndCacheBackgroundColorForHighlightIgnoringSelection:](self, "_updateAndCacheBackgroundColorForHighlightIgnoringSelection:", 0);
      -[UITableViewCell selectionFadeDuration](self, "selectionFadeDuration");
      v21 = v20 * 0.5 * UIAnimationDragCoefficient();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C99860]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCell performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__updateHighlightColorsForAnimationHalfwayPoint, 0, v22, v21);

      goto LABEL_31;
    }
  }
  if (v5)
  {
    objc_msgSend(v11, "setAlpha:", 1.0);
    -[UIView setSelected:](self->_selectedOverlayView, "setSelected:", 1);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIView setAlpha:](self->_backgroundView, "setAlpha:", 1.0);
    objc_msgSend(v11, "removeFromSuperview");
    -[UIView removeFromSuperview](self->_selectedOverlayView, "removeFromSuperview");
    v24 = self->_selectedOverlayView;
    self->_selectedOverlayView = 0;

  }
  -[UITableViewCell _updateAndCacheBackgroundColorForHighlightIgnoringSelection:](self, "_updateAndCacheBackgroundColorForHighlightIgnoringSelection:", 0);
  -[UITableViewCell _updateHighlightColors](self, "_updateHighlightColors");
LABEL_31:

}

uint64_t __55__UITableViewCell_showSelectedBackgroundView_animated___block_invoke(uint64_t a1, double a2)
{
  double v3;

  LOBYTE(a2) = *(_BYTE *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", (double)*(unint64_t *)&a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 0.0;
    if (!*(_BYTE *)(a1 + 48))
      v3 = 1.0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 568), "setAlpha:", v3);
  }
  return objc_msgSend(*(id *)(a1 + 40), "_performConfigurationStateUpdate");
}

uint64_t __55__UITableViewCell_showSelectedBackgroundView_animated___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_deselectAnimationFinished");
  return result;
}

- (void)_cancelInternalPerformRequests
{
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateHighlightColorsForAnimationHalfwayPoint, 0);
}

- (void)_performConfigurationStateModifications:(id)a3
{
  unsigned __int16 *v3;
  int v4;
  int v5;
  unsigned int v6;

  v3 = (unsigned __int16 *)&self->_tableCellFlags + 6;
  v4 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
  *((_WORD *)&self->_tableCellFlags + 6) = *((_WORD *)&self->_tableCellFlags + 6);
  *((_BYTE *)&self->_tableCellFlags + 14) = (v4 | 0x200000u) >> 16;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  v5 = *v3;
  v6 = (v5 | (*((unsigned __int8 *)v3 + 2) << 16)) & 0xFFDFFFFF;
  *v3 = v5;
  *((_BYTE *)v3 + 2) = (v6 | v4 & 0x200000) >> 16;
}

- (void)_deselectAnimationFinished
{
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  void *v4;
  UIView *selectedOverlayView;

  p_tableCellFlags = &self->_tableCellFlags;
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) &= ~0x8000000uLL;
  if (!-[UITableViewCell _shouldUseHighlightedOrSelectedAppearance](self, "_shouldUseHighlightedOrSelectedAppearance"))
  {
    -[UITableViewCell _selectedBackgroundView:](self, "_selectedBackgroundView:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    if ((*(_QWORD *)((char *)p_tableCellFlags + 4) & 0x1000) != 0)
    {
      -[UIView removeFromSuperview](self->_selectedOverlayView, "removeFromSuperview");
      selectedOverlayView = self->_selectedOverlayView;
      self->_selectedOverlayView = 0;

    }
    -[UITableViewCell _updateHighlightColors](self, "_updateHighlightColors");
  }
}

- (void)_delayedDeselect
{
  NSTimer *deselectTimer;

  -[UITableViewCell setSelected:animated:](self, "setSelected:animated:", 0, 0);
  deselectTimer = self->_deselectTimer;
  self->_deselectTimer = 0;

}

- (BOOL)isAtLeastHalfSelected
{
  return *(_BYTE *)&self->_tableCellFlags >> 7;
}

- (float)selectionPercent
{
  float result;

  result = 1.0;
  if ((*(_BYTE *)&self->_tableCellFlags & 0x80) == 0)
    return 0.0;
  return result;
}

- (void)_macSidebarDefaultIconSizeChanged
{
  -[UITableViewCell _updateDefaultImageSymbolConfiguration](self, "_updateDefaultImageSymbolConfiguration");
  -[UITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (BOOL)_backgroundFillIsCustomized
{
  UITableViewCell *v2;
  UIView *selectedBackgroundView;
  void *v4;
  void *v5;
  _UIBackgroundConfigurationInternal *lastNormalBackgroundViewConfiguration;
  void *v7;
  double v8;

  if ((*(_BYTE *)&self->_tableCellFlags & 0x70) == 0)
    goto LABEL_4;
  v2 = self;
  selectedBackgroundView = self->_selectedBackgroundView;
  if (selectedBackgroundView)
  {
    if (!-[UIView isHidden](selectedBackgroundView, "isHidden"))
    {
      -[UIView alpha](v2->_selectedBackgroundView, "alpha");
      LOBYTE(v2) = v8 > 0.0;
      return (char)v2;
    }
    goto LABEL_4;
  }
  if (!-[UITableViewCell isHighlighted](v2, "isHighlighted")
    && !-[UITableViewCell isSelected](v2, "isSelected")
    && !-[UIView isFocused](v2, "isFocused"))
  {
LABEL_4:
    LOBYTE(v2) = 0;
    return (char)v2;
  }
  -[_UISystemBackgroundView configuration](v2->_systemBackgroundView, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "_hasBackgroundFill"))
  {
    lastNormalBackgroundViewConfiguration = v2->_lastNormalBackgroundViewConfiguration;
    -[UIView tintColor](v2, "tintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v2) = objc_msgSend(v5, "_backgroundFillIsEqual:withTintColor:", lastNormalBackgroundViewConfiguration, v7) ^ 1;

  }
  else
  {
    LOBYTE(v2) = 0;
  }

  return (char)v2;
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

- (id)_visiblePathForBackgroundConfiguration
{
  return -[_UISystemBackgroundView currentVisiblePathInContainerView:](self->_systemBackgroundView, "currentVisiblePathInContainerView:", self);
}

- (id)_systemBackgroundView
{
  return self->_systemBackgroundView;
}

- (void)setAutomaticallyUpdatesBackgroundConfiguration:(BOOL)automaticallyUpdatesBackgroundConfiguration
{
  id backgroundViewConfigurationProvider;
  char *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;

  if (automaticallyUpdatesBackgroundConfiguration)
  {
    backgroundViewConfigurationProvider = self->_backgroundViewConfigurationProvider;
    v4 = (char *)&self->_tableCellFlags + 4;
    v5 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
    v6 = *((unsigned __int16 *)&self->_tableCellFlags + 6);
    v7 = v6 | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    if ((backgroundViewConfigurationProvider == 0) != ((v6 & 0x8000) == 0))
      return;
    if (!backgroundViewConfigurationProvider)
    {
      *(_QWORD *)v4 = v5;
      *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v7);
      *((_WORD *)&self->_tableCellFlags + 6) = v7 | 0x8000;
      -[UITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
      return;
    }
  }
  else
  {
    v4 = (char *)&self->_tableCellFlags + 4;
    v5 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
    v8 = *((unsigned __int16 *)&self->_tableCellFlags + 6);
    v7 = v8 | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    if ((v8 & 0x8000) == 0)
      return;
  }
  *(_QWORD *)v4 = v5;
  v4[10] = BYTE2(v7);
  *((_WORD *)v4 + 4) = v7 & 0x7FFF;
}

- (BOOL)automaticallyUpdatesBackgroundConfiguration
{
  return (unint64_t)*((unsigned __int16 *)&self->_tableCellFlags + 6) >> 15;
}

- (id)_backgroundViewConfigurationProvider
{
  return _Block_copy(self->_backgroundViewConfigurationProvider);
}

uint64_t __54__UITableViewCell__prepareForConfigurationStateUpdate__block_invoke(uint64_t a1)
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
  _BYTE v7[352];
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
      (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, a1, v3);
    objc_msgSend(a1, "_updateCellForCurrentBackgroundConfiguration");
    memcpy(v7, __src, sizeof(v7));
    v6 = (char *)GetTraitCollectionTSD() + 16;
    memcpy(__dst, v6, sizeof(__dst));
    memcpy(v6, v7, 0x160uLL);
    -[UIView _recordTraitUsage:insideMethod:withInvalidationAction:]((uint64_t *)a1, (uint64_t)&__dst[136], objc_msgSend(a1, "methodForSelector:", sel_updateConfigurationUsingState_), sel_setNeedsUpdateConfiguration);
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled", _UITraitUsageTrackingResultDestroy((uint64_t)__dst)))
    {
      objc_msgSend(a1, "_layoutSystemBackgroundView:", 1);
    }
    _UIRestorePreviousFallbackEnvironment(v2);

  }
}

- (void)_updateSystemTypeAccessoryView:(id)a3 withTableViewAccessoryType:(int64_t)a4 forState:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v8 = a5;
  v9 = 0;
  switch(a4)
  {
    case 0:
      goto LABEL_7;
    case 1:
    case 2:
      goto LABEL_6;
    case 3:
      v9 = 1;
      goto LABEL_6;
    case 4:
      v9 = 9;
      goto LABEL_6;
    case 5:
    case 6:
    case 7:
    case 8:
      v9 = 6;
      goto LABEL_6;
    default:
      v9 = -1;
LABEL_6:
      -[UITableViewCell _updateSystemTypeAccessoryView:withCellAccessoryType:forState:](self, "_updateSystemTypeAccessoryView:withCellAccessoryType:forState:", v10, v9, v8);
LABEL_7:

      return;
  }
}

- (id)selectedOverlayView
{
  return self->_selectedOverlayView;
}

- (UITableViewCellEditingStyle)editingStyle
{
  return ((unint64_t)*(_DWORD *)&self->_tableCellFlags >> 12) & 7;
}

- (void)setShowsReorderControl:(BOOL)showsReorderControl
{
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;

  p_tableCellFlags = &self->_tableCellFlags;
  if (((((*((_BYTE *)&self->_tableCellFlags + 2) & 0x20) == 0) ^ showsReorderControl) & 1) == 0)
  {
    -[UITableViewCell _setShowsReorderControl:](self, "_setShowsReorderControl:");
    if ((*((_BYTE *)p_tableCellFlags + 1) & 1) != 0
      || (*(_QWORD *)((char *)p_tableCellFlags + 4) & 0x400000000000) != 0)
    {
      -[UIView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setShouldIndentWhileEditing:(BOOL)shouldIndentWhileEditing
{
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;

  p_tableCellFlags = &self->_tableCellFlags;
  if (((((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x20) == 0) ^ shouldIndentWhileEditing) & 1) == 0)
  {
    -[UITableViewCell _setShouldIndentWhileEditing:](self, "_setShouldIndentWhileEditing:");
    if ((*((_BYTE *)p_tableCellFlags + 1) & 1) != 0)
    {
      -[UITableViewCell setEditing:animated:](self, "setEditing:animated:", 1, 0);
      -[UIView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (BOOL)shouldIndentWhileEditing
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 5) & 1;
}

- (void)_syncAccessoryViewsIfNecessary
{
  UIControl *accessoryView;
  UIControl *editingAccessoryView;
  UIControl *v5;
  UIControl *v6;
  UIControl *v7;

  accessoryView = self->_accessoryView;
  editingAccessoryView = self->_editingAccessoryView;
  if ((((*(_DWORD *)&self->_tableCellFlags >> 15) ^ (*(_DWORD *)&self->_tableCellFlags >> 18)) & 7) != 0)
  {
    if (accessoryView == editingAccessoryView)
    {
      if (-[UITableViewCell isEditing](self, "isEditing"))
      {
        v5 = self->_accessoryView;
        self->_accessoryView = 0;
      }
      else
      {
        v5 = self->_editingAccessoryView;
        self->_editingAccessoryView = 0;
      }
LABEL_11:

    }
  }
  else if (accessoryView != editingAccessoryView)
  {
    if (-[UITableViewCell isEditing](self, "isEditing"))
    {
      -[UIView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
      v6 = self->_editingAccessoryView;
      v5 = self->_accessoryView;
      self->_accessoryView = v6;
    }
    else
    {
      -[UIView removeFromSuperview](self->_editingAccessoryView, "removeFromSuperview");
      v7 = self->_accessoryView;
      v5 = self->_editingAccessoryView;
      self->_editingAccessoryView = v7;
    }
    goto LABEL_11;
  }
}

- (void)_setAccessoryTintColor:(id)a3
{
  UIColor *v5;
  unint64_t v6;
  UIColor *v7;

  v5 = (UIColor *)a3;
  if (self->_accessoryTintColor != v5)
  {
    v6 = ((unint64_t)*(_DWORD *)&self->_tableCellFlags >> 15) & 7;
    v7 = v5;
    -[UITableViewCell setAccessoryType:](self, "setAccessoryType:", 0);
    objc_storeStrong((id *)&self->_accessoryTintColor, a3);
    -[UITableViewCell setAccessoryType:](self, "setAccessoryType:", v6);
    v5 = v7;
  }

}

- (id)_accessoryTintColor
{
  return self->_accessoryTintColor;
}

- (UITableViewCellAccessoryType)editingAccessoryType
{
  return ((unint64_t)*(_DWORD *)&self->_tableCellFlags >> 18) & 7;
}

- (void)setEditingAccessoryView:(UIView *)editingAccessoryView
{
  UIView *v5;
  UIView **p_customEditingAccessoryView;
  UIControl *v7;
  UIView *v8;

  v5 = editingAccessoryView;
  p_customEditingAccessoryView = &self->_customEditingAccessoryView;
  if (self->_customEditingAccessoryView != v5)
  {
    v8 = v5;
    if (-[UITableViewCell _usesModernAccessoriesLayout](self, "_usesModernAccessoriesLayout"))
    {
      objc_storeStrong((id *)&self->_customEditingAccessoryView, editingAccessoryView);
      -[UITableViewCell _setNeedsAccessoriesUpdate](self, "_setNeedsAccessoriesUpdate");
LABEL_8:
      v5 = v8;
      goto LABEL_9;
    }
    -[UIView removeFromSuperview](*p_customEditingAccessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_customEditingAccessoryView, editingAccessoryView);
    if (*p_customEditingAccessoryView)
    {
      -[UIView removeFromSuperview](self->_editingAccessoryView, "removeFromSuperview");
      v7 = self->_editingAccessoryView;
      self->_editingAccessoryView = 0;

    }
    v5 = v8;
    if ((*((_BYTE *)&self->_tableCellFlags + 1) & 1) != 0)
    {
      -[UIView setNeedsLayout](self, "setNeedsLayout");
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (UIView)editingAccessoryView
{
  return self->_customEditingAccessoryView;
}

- (BOOL)hidesAccessoryWhenEditing
{
  return 1;
}

- (void)setIndentationLevel:(NSInteger)indentationLevel
{
  if (self->_indentationLevel != indentationLevel)
  {
    self->_indentationLevel = indentationLevel;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setIndentationWidth:(CGFloat)indentationWidth
{
  *((_WORD *)&self->_tableCellFlags + 6) |= 0x2000u;
  -[UITableViewCell _setIndentationWidth:](self, "_setIndentationWidth:", indentationWidth);
}

- (BOOL)clipsContents
{
  return 1;
}

- (double)selectionFadeDuration
{
  return self->_selectionFadeDuration;
}

- (void)setEditing:(BOOL)editing
{
  -[UITableViewCell setEditing:animated:](self, "setEditing:animated:", editing, 0);
}

uint64_t __76__UITableViewCell__setEditing_animated_cellOrAncestorViewForAnimatedLayout___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "willTransitionToState:", *(_QWORD *)(a1 + 40));
}

uint64_t __76__UITableViewCell__setEditing_animated_cellOrAncestorViewForAnimatedLayout___block_invoke_2(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_prepareForConfigurationStateUpdate");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 416) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 416) & 0xFFFFFEFF | (*(unsigned __int8 *)(a1 + 48) << 8);
  v2 = *(_BYTE *)(a1 + 48) && (objc_msgSend(*(id *)(a1 + 32), "wasSwiped") & 1) != 0;
  objc_msgSend(*(id *)(a1 + 32), "setShowingDeleteConfirmation:", v2);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateConfiguration");
  v3 = *(void **)(a1 + 40);
  if (v3 != *(void **)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
    v3 = *(void **)(a1 + 40);
  }
  objc_msgSend(v3, "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 40), "layoutBelowIfNeeded");
}

uint64_t __76__UITableViewCell__setEditing_animated_cellOrAncestorViewForAnimatedLayout___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didTransitionToState:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 420) &= ~0x200000000uLL;
  return objc_msgSend(*(id *)(a1 + 32), "_updateContentClip");
}

- (void)setShowingDeleteConfirmation:(BOOL)a3
{
  int tableCellFlags;
  uint64_t v4;

  tableCellFlags = (int)self->_tableCellFlags;
  if (((((tableCellFlags & 1) == 0) ^ a3) & 1) == 0)
  {
    if ((tableCellFlags & 0x100) != 0)
    {
      v4 = 2;
      if (!a3)
        v4 = 0;
      -[UITableViewCell willTransitionToState:](self, "willTransitionToState:", v4 | ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x200) == 0));
    }
    else
    {
      *(_DWORD *)&self->_tableCellFlags = tableCellFlags & 0xFFFFFFFE | a3;
      -[UIView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)_setContainerView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  -[UITableViewCell _containerView](self, "_containerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v20)
  {
    if (v4)
    {
      -[UITableViewCell frame](self, "frame");
      v6 = v5;
      v8 = v7;
      objc_msgSend(v4, "frame");
      v10 = v9;
      v12 = v11;
      objc_msgSend(v4, "superview");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCell _removeFromSuperviewIgnoringFirstResponder:](self, "_removeFromSuperviewIgnoringFirstResponder:", 1);
      objc_msgSend(v13, "insertSubview:aboveSubview:", self, v4);
      -[UITableViewCell _setFrame:skipLayout:](self, "_setFrame:skipLayout:", 1, v10, v12, v6, v8);

    }
    if (v20)
    {
      -[UITableViewCell frame](self, "frame");
      v15 = v14;
      v17 = v16;
      objc_msgSend(v20, "setFrame:");
      -[UIView _removePropertyAnimationsForLayerKeyPath:](self, "_removePropertyAnimationsForLayerKeyPath:", CFSTR("position"));
      -[UITableViewCell _setFrame:skipLayout:](self, "_setFrame:skipLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v15, v17);
      objc_msgSend(v20, "superview");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        -[UIView superview](self, "superview");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "insertSubview:aboveSubview:", v20, self);

      }
      objc_msgSend(v20, "addSubview:", self);
    }
  }

}

- (void)_setDropAnimationContainerView:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[UITableViewCell _containerView](self, "_containerView");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[UITableViewCell _containerView](self, "_containerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell _dropAnimationContainerView](self, "_dropAnimationContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITableViewCell.m"), 4951, CFSTR("UIKit inconsistency: Unable to add a drop animation container view while another container view is already present."));

    }
  }
  -[UITableViewCell _setContainerView:](self, "_setContainerView:", v10);

}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  CGRect v11;

  y = a3.y;
  x = a3.x;
  -[UITableViewCell _dropAnimationContainerView](self, "_dropAnimationContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setCenter:", x, y);
  }
  else
  {
    -[UITableViewCell _swipeContainerView](self, "_swipeContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "center");
      objc_msgSend(v9, "setCenter:");
      objc_msgSend(v9, "bounds");
      y = CGRectGetMidY(v11);
    }
    v10.receiver = self;
    v10.super_class = (Class)UITableViewCell;
    -[UIView setCenter:](&v10, sel_setCenter_, x, y);

  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UITableViewCell;
  -[UIView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height)
    -[UITableViewCell _updateAccessoryMetrics](self, "_updateAccessoryMetrics");
}

- (void)_setSkipsLayout:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (void)setTarget:(id)target
{
  objc_storeStrong(&self->_target, target);
}

- (id)target
{
  return self->_target;
}

- (void)setEditAction:(SEL)editAction
{
  self->_editAction = editAction;
}

- (SEL)editAction
{
  return self->_editAction;
}

- (void)setAccessoryAction:(SEL)accessoryAction
{
  self->_accessoryAction = accessoryAction;
}

- (SEL)accessoryAction
{
  return self->_accessoryAction;
}

- (void)_updateCellMaskViewsForView:(id)a3 backdropView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "_backdropMaskViewFlags"))
    objc_msgSend(v7, "updateMaskViewsForView:", v6);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v6, "subviews", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[UITableViewCell _updateCellMaskViewsForView:backdropView:](self, "_updateCellMaskViewsForView:backdropView:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_updateFloatingContentControlStateAnimated:(BOOL)a3
{
  -[UITableViewCell _updateFloatingContentControlStateInContext:withAnimationCoordinator:animated:](self, "_updateFloatingContentControlStateInContext:withAnimationCoordinator:animated:", 0, 0, a3);
}

- (void)_updateFloatingContentControlStateInContext:(id)a3 withAnimationCoordinator:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  UITableViewCell *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  _UIFloatingContentView *floatingContentView;
  id v14;

  v5 = a5;
  v14 = a3;
  v8 = a4;
  if (self->_floatingContentView)
  {
    if (v14)
    {
      objc_msgSend(v14, "nextFocusedView");
      v9 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();
      v10 = v9 == self;

    }
    else
    {
      v10 = -[UIView isFocused](self, "isFocused");
    }
    if (v10)
      v11 = 8;
    else
      v11 = 0;
    if (-[UITableViewCell isSelected](self, "isSelected"))
      v11 |= 4uLL;
    v12 = v11 | -[UITableViewCell isHighlighted](self, "isHighlighted");
    floatingContentView = self->_floatingContentView;
    if (v8)
      -[_UIFloatingContentView setControlState:withAnimationCoordinator:](floatingContentView, "setControlState:withAnimationCoordinator:", v12, v8);
    else
      -[_UIFloatingContentView setControlState:animated:](floatingContentView, "setControlState:animated:", v12, v5);
  }

}

- (void)_willTransitionToState:(unint64_t)a3
{
  id v5;

  -[UITableViewCell layoutManager](self, "layoutManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cell:willTransitionToState:", self, a3);

}

- (void)_didTransitionToState:(unint64_t)a3
{
  id v5;

  -[UITableViewCell layoutManager](self, "layoutManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cell:didTransitionToState:", self, a3);

}

- (CGRect)contentRectForState:(unint64_t)a3
{
  void *v5;
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
  double v16;
  double v17;
  CGRect result;

  -[UITableViewCell layoutManager](self, "layoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentRectForCell:forState:", self, a3);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  _BOOL4 v15;
  objc_super v16;
  CGPoint v17;
  CGRect v18;

  v6 = a3;
  v7 = a4;
  -[UITableViewCell _tableView](self, "_tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v16.receiver = self;
    v16.super_class = (Class)UITableViewCell;
    -[UIResponder touchesBegan:withEvent:](&v16, sel_touchesBegan_withEvent_, v6, v7);

  }
  else
  {
    objc_msgSend(v7, "_firstTouchForView:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "locationInView:", self);
      v11 = v10;
      v13 = v12;
      -[UITableViewCell layoutManager](self, "layoutManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "backgroundEndingRectForCell:forNewEditingState:", self, -[UITableViewCell isEditing](self, "isEditing"));
      v17.x = v11;
      v17.y = v13;
      v15 = CGRectContainsPoint(v18, v17);

      if (v15)
        -[UITableViewCell setSelected:](self, "setSelected:", 1);
    }

  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  objc_super v15;
  CGPoint v16;
  CGRect v17;

  v6 = a3;
  v7 = a4;
  -[UITableViewCell _tableView](self, "_tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)UITableViewCell;
    -[UIResponder touchesMoved:withEvent:](&v15, sel_touchesMoved_withEvent_, v6, v7);

  }
  else
  {
    objc_msgSend(v7, "_firstTouchForView:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "locationInView:", self);
      v11 = v10;
      v13 = v12;
      -[UITableViewCell layoutManager](self, "layoutManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "backgroundEndingRectForCell:forNewEditingState:", self, -[UITableViewCell isEditing](self, "isEditing"));
      v16.x = v11;
      v16.y = v13;
      -[UITableViewCell setSelected:](self, "setSelected:", CGRectContainsPoint(v17, v16));

    }
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  -[UITableViewCell _tableView](self, "_tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v10.receiver = self;
    v10.super_class = (Class)UITableViewCell;
    -[UIResponder touchesEnded:withEvent:](&v10, sel_touchesEnded_withEvent_, v6, v7);

  }
  else
  {
    objc_msgSend(v7, "_firstTouchForView:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[UITableViewCell setSelected:](self, "setSelected:", 0);

  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  -[UITableViewCell _tableView](self, "_tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9.receiver = self;
    v9.super_class = (Class)UITableViewCell;
    -[UIResponder touchesCancelled:withEvent:](&v9, sel_touchesCancelled_withEvent_, v6, v7);
  }
  else
  {
    -[UITableViewCell setSelected:](self, "setSelected:", 0);
  }

}

- (void)setSectionLocation:(int)a3
{
  -[UITableViewCell setSectionLocation:animated:](self, "setSectionLocation:animated:", *(_QWORD *)&a3, 0);
}

- (BOOL)canBecomeFirstResponder
{
  _BOOL4 v3;
  objc_super v5;

  if (_UIDeviceHasExternalTouchInput()
    || (v5.receiver = self,
        v5.super_class = (Class)UITableViewCell,
        v3 = -[UIResponder canBecomeFirstResponder](&v5, sel_canBecomeFirstResponder)))
  {
    LOBYTE(v3) = !-[UIView isHidden](self, "isHidden");
  }
  return v3;
}

- (void)_performAction:(SEL)a3 sender:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[UITableViewCell _tableView](self, "_tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_performAction:forCell:sender:", a3, self, v6);

}

- (BOOL)_automaticIntrinsicContentSizeInvalidationEnabled
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16) >> 20) & 1;
}

- (id)_editableTextField:(BOOL)a3
{
  UITextField *editableTextField;
  BOOL v4;
  UITextField *v5;

  editableTextField = self->_editableTextField;
  if (editableTextField)
    v4 = 1;
  else
    v4 = !a3;
  if (v4)
  {
    v5 = editableTextField;
  }
  else
  {
    -[UITableViewCell _editableTextField](self, "_editableTextField", a3);
    v5 = (UITextField *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_setReorderControlImage:(id)a3
{
  objc_setAssociatedObject(self, &_UITableViewCellReorderControlImageKey, a3, (void *)1);
}

- (id)_reorderControlImage
{
  return objc_getAssociatedObject(self, &_UITableViewCellReorderControlImageKey);
}

- (void)_setEditingControlTintColor:(id)a3 forStyle:(int64_t)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *editingControlTintColors;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  NSMutableDictionary *v15;
  void *v16;
  id v17;

  v6 = a3;
  if (v6 && !self->__editingControlTintColors)
  {
    v7 = (NSMutableDictionary *)objc_opt_new();
    editingControlTintColors = self->__editingControlTintColors;
    self->__editingControlTintColors = v7;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->__editingControlTintColors, "objectForKeyedSubscript:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v12 = v11;
  v13 = v11;
  v17 = v11;
  if (v10 != v11)
  {
    if (v6 && v10)
    {
      v14 = objc_msgSend(v10, "isEqual:", v11);

      if ((v14 & 1) != 0)
        goto LABEL_12;
    }
    else
    {

    }
    v15 = self->__editingControlTintColors;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v17, v16);

    -[UITableViewCell editingData:](self, "editingData:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "editControl:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_updateImageView");
  }

LABEL_12:
}

- (id)_editingControlTintColorForStyle:(int64_t)a3
{
  NSMutableDictionary *editingControlTintColors;
  void *v4;
  void *v5;

  editingControlTintColors = self->__editingControlTintColors;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](editingControlTintColors, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_drawSeparatorInRect:(CGRect)a3
{
  unsigned int v3;
  UIColor *separatorColor;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  unint64_t tableCellFlags;
  uint64_t v15;
  UIColor *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;

  v3 = (*(_DWORD *)&self->_tableCellFlags >> 1) & 7;
  if (v3)
  {
    separatorColor = self->_separatorColor;
    -[UITableViewCell _separatorFrame](self, "_separatorFrame", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    if (v3 <= 2)
    {
      v10 = v6;
      v11 = v7;
      v12 = v8;
      v13 = v9;
      -[UIColor set](separatorColor, "set");
      UIRectFillUsingOperation(1, v10, v11, v12, v13);
    }
    tableCellFlags = (unint64_t)self->_tableCellFlags;
    if ((tableCellFlags & 0x400000) != 0)
    {
      v15 = (tableCellFlags >> 1) & 7;
      v16 = self->_separatorColor;
      -[UITableViewCell _topSeparatorFrame](self, "_topSeparatorFrame");
      if ((unint64_t)(v15 - 1) <= 1)
      {
        v21 = v17;
        v22 = v18;
        v23 = v19;
        v24 = v20;
        -[UIColor set](v16, "set");
        UIRectFillUsingOperation(1, v21, v22, v23, v24);
      }
    }
  }
}

uint64_t __74__UITableViewCell__animateFloatingSeparatorForInsertion_withRowAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __68__UITableViewCell__animateInnerShadowForInsertion_withRowAnimation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 680), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 688), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

uint64_t __68__UITableViewCell__animateInnerShadowForInsertion_withRowAnimation___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 680), "setAlpha:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 688), "setAlpha:", *(double *)(a1 + 40));
}

- (BOOL)_isReorderControlActive
{
  UITableViewCell *v2;
  void *v3;

  v2 = self;
  -[UITableViewCell _tableView](self, "_tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "_isReorderControlActiveForCell:", v2);

  return (char)v2;
}

- (BOOL)_grabberBeganReorder:(id)a3 touch:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[UITableViewCell _tableView](self, "_tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "_beginReorderingForCell:touch:", self, v5);

  return (char)self;
}

- (void)_grabberDragged:(id)a3 yDelta:(float)a4
{
  -[UITableViewCell _grabberDragged:yDelta:touch:](self, "_grabberDragged:yDelta:touch:", a3, 0);
}

- (void)_grabberDragged:(id)a3 yDelta:(float)a4 touch:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  -[UITableViewCell _tableView](self, "_tableView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_draggingReorderingCell:yDelta:touch:", self, v7, a4);

}

- (void)_grabberReleased:(id)a3
{
  id v4;

  -[UITableViewCell _tableView](self, "_tableView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_endReorderingForCell:wasCancelled:animated:", self, 0, 1);

}

- (void)editControlWasClicked:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_DWORD *)&self->_tableCellFlags & 0x7000) == 0x1000)
  {
    if (!objc_msgSend(v4, "isRotated"))
    {
      -[UITableViewCell setShowingDeleteConfirmation:](self, "setShowingDeleteConfirmation:", 0);
      goto LABEL_8;
    }
    -[UITableViewCell _tableView](self, "_tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_swipeToDeleteCell:", self);
    goto LABEL_6;
  }
  if (-[UITableViewCell editingStyle](self, "editingStyle") == UITableViewCellEditingStyleInsert)
  {
    -[UITableViewCell _tableView](self, "_tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_didInsertRowForTableCell:", self);
LABEL_6:

  }
LABEL_8:

}

- (BOOL)_isReorderable
{
  UITableViewCell *v2;
  void *v3;

  v2 = self;
  -[UITableViewCell _tableView](self, "_tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "_isCellReorderable:", v2);

  return (char)v2;
}

- (void)removeEditingData
{
  id editingData;

  editingData = self->_editingData;
  self->_editingData = 0;

  -[UITableViewCell _setNeedsAccessoriesUpdate](self, "_setNeedsAccessoriesUpdate");
}

- (void)_toggleExpansionButton
{
  void *v3;
  unsigned int tableCellFlags;
  int v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;

  -[UITableViewCell _existingSystemAccessoryView:](self, "_existingSystemAccessoryView:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  tableCellFlags = self->_tableCellFlags;
  v5 = (tableCellFlags >> 15) & 7;
  switch(v5)
  {
    case 7:
      v6 = tableCellFlags & 0xFFFC7FFF;
      v7 = 8;
      goto LABEL_7;
    case 6:
      v7 = 5;
      v6 = tableCellFlags & 0xFFFC7FFF | 0x28000;
      goto LABEL_7;
    case 5:
      v6 = tableCellFlags & 0xFFFC7FFF | 0x30000;
      v7 = 6;
LABEL_7:
      *(_DWORD *)&self->_tableCellFlags = v6;
      v8 = v3;
      -[UITableViewCell _updateExpansionButton:forType:animated:](self, "_updateExpansionButton:forType:animated:", v3, v7, 1);
      v3 = v8;
      break;
  }

}

- (void)_updateExpansionButton:(id)a3 forType:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  CGFloat v9;
  __int128 v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD aBlock[4];
  id v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  v5 = a5;
  v8 = a3;
  memset(&v17, 0, sizeof(v17));
  if (a4 == 8 || a4 == 6)
  {
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0)
      v9 = -1.57079633;
    else
      v9 = 1.57079633;
    CGAffineTransformMakeRotation(&v17, v9);
  }
  else
  {
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v17.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v17.c = v10;
    *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__UITableViewCell__updateExpansionButton_forType_animated___block_invoke;
  aBlock[3] = &unk_1E16BF720;
  v11 = v8;
  v15 = v11;
  v16 = v17;
  v12 = _Block_copy(aBlock);
  v13 = v12;
  if (v5)
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v12, 0, 0.333);
  else
    (*((void (**)(void *))v12 + 2))(v12);

}

uint64_t __59__UITableViewCell__updateExpansionButton_forType_animated___block_invoke(uint64_t a1)
{
  __int128 v1;
  _OWORD v3[3];

  v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", v3);
}

- (id)_newAccessoryView:(BOOL)a3
{
  -[UITableViewCell _accessoryViewForType:](self, "_accessoryViewForType:", -[UITableViewCell _currentAccessoryTypeForEditing:](self, "_currentAccessoryTypeForEditing:", a3));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __41__UITableViewCell__accessoryViewForType___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_checkmarkImageWithTintColor:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_existingSystemAccessoryViews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void (**v7)(void *, void *);
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD aBlock[4];
  id v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  if (-[UITableViewCell _usesModernAccessoriesLayout](self, "_usesModernAccessoriesLayout"))
  {
    -[UITableViewCell _accessoryManager](self, "_accessoryManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("custom"), CFSTR("customEditing"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__UITableViewCell__existingSystemAccessoryViews__block_invoke;
    aBlock[3] = &unk_1E16BC3F0;
    v6 = v5;
    v23 = v6;
    v24 = v3;
    v7 = (void (**)(void *, void *))_Block_copy(aBlock);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "configurations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v14, "leadingAccessories");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, v15);

          objc_msgSend(v14, "trailingAccessories");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, v16);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      }
      while (v11);
    }

  }
  else
  {
    if (self->_accessoryView)
      objc_msgSend(v3, "addObject:");
    if (self->_editingAccessoryView)
      objc_msgSend(v3, "addObject:");
  }
  return v3;
}

void __48__UITableViewCell__existingSystemAccessoryViews__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v9 = *(void **)(a1 + 32);
        objc_msgSend(v8, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v9) = objc_msgSend(v9, "containsObject:", v10);

        if ((v9 & 1) == 0)
        {
          v11 = *(void **)(a1 + 40);
          objc_msgSend(v8, "view");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v12);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (id)_defaultAccessoryView
{
  UIControl *v3;
  UIControl **p_accessoryView;
  unsigned int tableCellFlags;
  int v6;
  UIControl *editingAccessoryView;
  UIControl *v8;
  UIControl *v9;

  if (-[UITableViewCell _usesModernAccessoriesLayout](self, "_usesModernAccessoriesLayout"))
  {
    -[UITableViewCell _accessoryView:](self, "_accessoryView:", 0);
    v3 = (UIControl *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    p_accessoryView = &self->_accessoryView;
    if (!self->_accessoryView)
    {
      tableCellFlags = self->_tableCellFlags;
      v6 = (tableCellFlags >> 15) & 7;
      if (v6)
      {
        if (v6 == ((tableCellFlags >> 18) & 7) && (editingAccessoryView = self->_editingAccessoryView) != 0)
        {
          objc_storeStrong((id *)&self->_accessoryView, editingAccessoryView);
        }
        else
        {
          v8 = -[UITableViewCell _newAccessoryView:](self, "_newAccessoryView:", 0);
          v9 = *p_accessoryView;
          *p_accessoryView = v8;

          -[UIView addSubview:](self, "addSubview:", *p_accessoryView);
        }
      }
    }
    v3 = *p_accessoryView;
  }
  return v3;
}

- (id)_customEditingAccessoryView:(BOOL)a3
{
  return self->_customEditingAccessoryView;
}

- (id)_separatorView:(BOOL)a3
{
  if (a3)
    -[UITableViewCell _updateSeparatorContent:](self, "_updateSeparatorContent:", 1);
  return self->_separatorView;
}

- (BOOL)_hasAccessoryView
{
  return -[UITableViewCell accessoryType](self, "accessoryType") || self->_customAccessoryView != 0;
}

- (BOOL)_hasEditingAccessoryView
{
  return -[UITableViewCell editingAccessoryType](self, "editingAccessoryType")
      || self->_customEditingAccessoryView != 0;
}

- (void)_setTarget:(id)a3
{
  objc_storeStrong(&self->_target, a3);
}

- (id)_target
{
  return self->_target;
}

- (void)_setAccessoryAction:(SEL)a3
{
  self->_accessoryAction = a3;
}

- (SEL)_accessoryAction
{
  return self->_accessoryAction;
}

- (void)_monitoredView:(id)a3 willMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (self->_unhighlightedStates
    && -[UIView containsView:](self, "containsView:", v8)
    && !-[UIView containsView:](self, "containsView:", v9))
  {
    -[UITableViewCell _clearOpaqueViewState:](self, "_clearOpaqueViewState:", v10);
  }

}

- (void)_monitoredView:(id)a3 didMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  id v8;
  UITableViewCell *v9;
  UITableViewCell *v10;
  BOOL v11;
  _BOOL4 v12;
  _BOOL4 v13;
  UITableViewCell *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = (UITableViewCell *)a5;
  v10 = v9;
  while (1)
  {
    v11 = v10 == self || v10 == 0;
    v12 = !v11;
    if (v11)
      break;
    objc_opt_class();
    v13 = (objc_opt_isKindOfClass() & 1) != 0 || v10 == (UITableViewCell *)self->_selectedBackgroundView;
    -[UIView superview](v10, "superview");
    v14 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();

    v10 = v14;
    if (v13)
      goto LABEL_15;
  }
  v14 = v10;
LABEL_15:
  if (self->_unhighlightedStates
    && !-[UIView containsView:](self, "containsView:", v8)
    && ((v12 | !-[UIView containsView:](self, "containsView:", v9)) & 1) == 0)
  {
    -[UITableViewCell _saveOpaqueViewState:](self, "_saveOpaqueViewState:", v15);
    -[UITableViewCell _setOpaque:forSubview:](self, "_setOpaque:forSubview:", 0, v15);
    -[UITableViewCell _updateHighlightColorsForView:highlighted:](self, "_updateHighlightColorsForView:highlighted:", v15, -[UITableViewCell _shouldUseHighlightedOrSelectedAppearance](self, "_shouldUseHighlightedOrSelectedAppearance"));
  }

}

- (void)_startToEditTextField
{
  void *v2;
  id v3;

  -[UITableViewCell editableTextField](self, "editableTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "becomeFirstResponder");
    v2 = v3;
  }

}

- (void)_multiselectColorChanged
{
  void *v2;
  id v3;

  -[UITableViewCell editingData:](self, "editingData:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editControl:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_multiselectColorChanged");

}

- (BOOL)_isMultiselecting
{
  void *v2;
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  int tableCellFlags;
  void *v6;
  char v7;

  p_tableCellFlags = &self->_tableCellFlags;
  tableCellFlags = (int)self->_tableCellFlags;
  if ((tableCellFlags & 0x100) == 0)
  {
LABEL_2:
    -[UITableViewCell _tableView](self, "_tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "allowsMultipleSelection");

    if ((tableCellFlags & 0x100) == 0)
      return v7;
    goto LABEL_11;
  }
  if ((*(_DWORD *)&self->_tableCellFlags & 0x7000) != 0x3000)
  {
    -[UITableViewCell _tableView](self, "_tableView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v2, "allowsMultipleSelectionDuringEditing")
      || (*((_WORD *)p_tableCellFlags + 6) & 4) != 0)
    {
      if ((*((_BYTE *)p_tableCellFlags + 1) & 1) == 0)
        goto LABEL_2;
      v7 = 0;
    }
    else
    {
      v7 = 1;
    }
LABEL_11:

    return v7;
  }
  return 1;
}

- (BOOL)_shouldSaveOpaqueStateForView:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  int v7;
  int v8;
  BOOL v9;

  v4 = a3;
  if ((*((_BYTE *)&self->_tableCellFlags + 1) & 1) != 0)
  {
    v6 = 1;
    -[UITableViewCell _existingSystemAccessoryView:](self, "_existingSystemAccessoryView:", 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 != v4)
      goto LABEL_8;
    v7 = 0x80000;
    v8 = 1835008;
LABEL_7:
    v6 = (*(_DWORD *)&self->_tableCellFlags & v8) != v7;
    v5 = v4;
    goto LABEL_8;
  }
  -[UITableViewCell _existingSystemAccessoryView:](self, "_existingSystemAccessoryView:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    v7 = 0x10000;
    v8 = 229376;
    goto LABEL_7;
  }
  v6 = 1;
LABEL_8:

  v9 = -[UITableViewCell _shouldChangeOpaqueStateOfView:](self, "_shouldChangeOpaqueStateOfView:", v4) && v6;
  return v9;
}

- (UIEdgeInsets)_adjustedRawLayoutMargins:(UIEdgeInsets)a3 withLeadingLayoutMarginAdjustment:(double)a4
{
  double right;
  CGFloat bottom;
  double left;
  CGFloat top;
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
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (-[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    if (right == -1.79769313e308)
    {
      v10 = 0.0;
      if ((-[UIView edgesInsettingLayoutMarginsFromSafeArea](self, "edgesInsettingLayoutMarginsFromSafeArea", -1.79769313e308) & 8) != 0)
      {
        -[UIView safeAreaInsets](self, "safeAreaInsets");
        v10 = v11;
      }
      -[UIView layoutMargins](self, "layoutMargins");
      right = v12 - v10 + a4;
    }
    else
    {
      right = right + a4;
    }
  }
  else if (left == -1.79769313e308)
  {
    v13 = 0.0;
    if ((-[UIView edgesInsettingLayoutMarginsFromSafeArea](self, "edgesInsettingLayoutMarginsFromSafeArea", -1.79769313e308) & 2) != 0)
    {
      -[UIView safeAreaInsets](self, "safeAreaInsets");
      v13 = v14;
    }
    -[UIView layoutMargins](self, "layoutMargins");
    left = v15 - v13 + a4;
  }
  else
  {
    left = left + a4;
  }
  v16 = top;
  v17 = left;
  v18 = bottom;
  v19 = right;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void)_applyLeadingLayoutMarginAdjustment:(double)a3
{
  objc_super v4;

  -[UIView _rawLayoutMargins](self, "_rawLayoutMargins");
  -[UITableViewCell _adjustedRawLayoutMargins:withLeadingLayoutMarginAdjustment:](self, "_adjustedRawLayoutMargins:withLeadingLayoutMarginAdjustment:");
  v4.receiver = self;
  v4.super_class = (Class)UITableViewCell;
  -[UIView _setRawLayoutMargins:](&v4, sel__setRawLayoutMargins_);
}

- (NSDirectionalEdgeInsets)_overriddenDefaultContentViewLayoutMargins
{
  char isKindOfClass;
  double v4;
  double v5;
  double v6;
  double v7;
  NSDirectionalEdgeInsets result;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  if ((isKindOfClass & 1) != 0)
    -[UIView _overriddenDefaultLayoutMargins](self->_contentView, "_overriddenDefaultLayoutMargins", 0.0, 0.0, 0.0, 0.0);
  result.trailing = v7;
  result.bottom = v6;
  result.leading = v4;
  result.top = v5;
  return result;
}

- (double)_contentViewInset:(double)a3 convertedToCellInsetOnEdge:(unint64_t)a4
{
  void *v8;
  double v9;
  _BOOL4 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double MaxX;
  double MinX;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  if (a4 != 2 && a4 != 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITableViewCell.m"), 6595, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("edge == NSDirectionalRectEdgeLeading || edge == NSDirectionalRectEdgeTrailing"));

  }
  if (a4 == 2)
    v9 = 0.0;
  else
    v9 = a3;
  if (a4 != 2)
    a3 = 0.0;
  v10 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[UIView bounds](self->_contentView, "bounds");
  if (v10)
    v14 = v9;
  else
    v14 = a3;
  if (v10)
    v15 = a3;
  else
    v15 = v9;
  v16 = v14 + v11;
  v17 = v12 + 0.0;
  v18 = v13 - (v14 + v15);
  if (v10)
    v19 = 2;
  else
    v19 = 8;
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", self->_contentView, v16, v17, v18);
  v24 = v20;
  v25 = v21;
  v26 = v22;
  v27 = v23;
  if (v19 == a4)
  {
    -[UIView bounds](self, "bounds");
    MaxX = CGRectGetMaxX(v31);
    v32.origin.x = v24;
    v32.origin.y = v25;
    v32.size.width = v26;
    v32.size.height = v27;
    return MaxX - CGRectGetMaxX(v32);
  }
  else
  {
    MinX = CGRectGetMinX(*(CGRect *)&v20);
    -[UIView bounds](self, "bounds");
    return MinX - CGRectGetMinX(v33);
  }
}

- (void)_setMarginWidth:(double)a3
{
  -[UITableViewCell setSeparatorInset:](self, "setSeparatorInset:", self->_separatorInset.top, a3, self->_separatorInset.bottom, self->_separatorInset.right);
}

- (void)_setRightMarginWidth:(double)a3
{
  -[UITableViewCell setSeparatorInset:](self, "setSeparatorInset:", self->_separatorInset.top, self->_separatorInset.left, self->_separatorInset.bottom, a3);
}

- (double)_defaultLeadingMarginWidth
{
  return self->_defaultLeadingMarginWidth;
}

- (void)_tableViewDidUpdateMarginWidth
{
  if (self->_separatorInset.left == -1.0 || self->_separatorInset.right == -1.0)
    -[UITableViewCell _updateSeparatorContent:](self, "_updateSeparatorContent:", 1);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  _BOOL4 IsAnimating;
  BOOL v10;
  void *v11;
  void *v12;
  void (**v13)(void *, void *, BOOL, _QWORD);
  _BOOL8 v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  double MidY;
  int v34;
  uint64_t v35;
  _BOOL4 v39;
  _BOOL4 v40;
  int v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  int tableCellFlags;
  int v51;
  void *v52;
  BOOL v53;
  char v54;
  int v55;
  void *v56;
  void *v57;
  id v59;
  uint64_t aBlock;
  uint64_t v61;
  id (*v62)(uint64_t, void *, int, int);
  void *v63;
  UITableViewCell *v64;
  id v65;
  id v66;
  double v67;
  double v68;
  objc_super v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v69.receiver = self;
  v69.super_class = (Class)UITableViewCell;
  -[UIView hitTest:withEvent:](&v69, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IsAnimating = _UIViewIsAnimating(self);
  if (v8)
    v10 = 0;
  else
    v10 = !IsAnimating;
  if (v10)
    goto LABEL_58;
  if (dyld_program_sdk_at_least()
    && -[UITableViewCell _usesModernAccessoriesLayout](self, "_usesModernAccessoriesLayout"))
  {
    -[UITableViewCell _accessoryManager](self, "_accessoryManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock = MEMORY[0x1E0C809B0];
    v61 = 3221225472;
    v62 = __37__UITableViewCell_hitTest_withEvent___block_invoke;
    v63 = &unk_1E16E3698;
    v64 = self;
    v59 = v11;
    v65 = v59;
    v67 = x;
    v68 = y;
    v66 = v7;
    v13 = (void (**)(void *, void *, BOOL, _QWORD))_Block_copy(&aBlock);
    v14 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    objc_msgSend(v12, "leadingAccessories");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      v17 = 0;
      while (1)
      {
        objc_msgSend(v12, "leadingAccessories", v59, aBlock, v61, v62, v63, v64, v65);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "leadingAccessories");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2](v13, v19, v17 == objc_msgSend(v20, "count") - 1, v14 ^ 1);
        v21 = (id)objc_claimAutoreleasedReturnValue();

        if (v21)
          break;

        ++v17;
        objc_msgSend(v12, "leadingAccessories");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

        if (v17 >= v23)
          goto LABEL_11;
      }
    }
    else
    {
LABEL_11:
      objc_msgSend(v12, "trailingAccessories", v59);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v21, "count");

      if (!v24)
      {
LABEL_15:
        v29 = 1;
        v30 = v59;
        goto LABEL_25;
      }
      v25 = 0;
      while (1)
      {
        objc_msgSend(v12, "trailingAccessories");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "trailingAccessories");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2](v13, v19, v25 == objc_msgSend(v27, "count") - 1, v14);
        v21 = (id)objc_claimAutoreleasedReturnValue();

        if (v21)
          break;

        ++v25;
        objc_msgSend(v12, "trailingAccessories");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (id)objc_msgSend(v28, "count");

        if (v25 >= (unint64_t)v21)
          goto LABEL_15;
      }
    }
    v30 = v59;

    v29 = 0;
LABEL_25:

    if ((v29 & 1) == 0)
      goto LABEL_59;
    goto LABEL_58;
  }
  if ((*((_BYTE *)&self->_tableCellFlags + 2) & 0x20) != 0)
  {
LABEL_58:
    v21 = v8;
    goto LABEL_59;
  }
  -[UITableViewCell _existingSystemAccessoryView:](self, "_existingSystemAccessoryView:", 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell _existingSystemAccessoryView:](self, "_existingSystemAccessoryView:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  MidY = CGRectGetMidY(v70);
  v34 = *((_DWORD *)&self->super._viewFlags + 4);
  if (!v31)
  {
    if (!v32)
    {
      v41 = 0;
      v39 = 0;
      goto LABEL_32;
    }
    v39 = 0;
    if ((v34 & 0x80000) == 0)
    {
LABEL_23:
      objc_msgSend(v32, "frame");
      v40 = x >= CGRectGetMinX(v71);
LABEL_29:
      v41 = 1;
      goto LABEL_33;
    }
LABEL_28:
    objc_msgSend(v32, "frame");
    v40 = x <= CGRectGetMaxX(v72);
    goto LABEL_29;
  }
  objc_msgSend(v31, "frame");
  if ((v34 & 0x80000) == 0)
  {
    v39 = x >= CGRectGetMinX(*(CGRect *)&v35);
    if (!v32)
      goto LABEL_30;
    goto LABEL_23;
  }
  v39 = x <= CGRectGetMaxX(*(CGRect *)&v35);
  if (v32)
    goto LABEL_28;
LABEL_30:
  v41 = 0;
LABEL_32:
  v40 = 0;
LABEL_33:
  objc_msgSend(v31, "convertPoint:fromView:", self, x, MidY);
  v43 = v42;
  v45 = v44;
  objc_msgSend(v32, "convertPoint:fromView:", self, x, MidY);
  v47 = v46;
  v49 = v48;
  tableCellFlags = (int)self->_tableCellFlags;
  if ((tableCellFlags & 0x100) != 0)
  {
    if (v31)
      v53 = (tableCellFlags & 0x1C0000) == 0x100000;
    else
      v53 = 0;
    v54 = !v53;
    v55 = !v53 || v39;
    if (v55 == 1)
    {
      v52 = v31;
      if ((v54 & 1) == 0)
        goto LABEL_56;
    }
    else
    {
      objc_msgSend(v31, "hitTest:withEvent:", v7, v43, v45);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      v52 = v31;
      if (v56)
        goto LABEL_56;
      tableCellFlags = (int)self->_tableCellFlags;
    }
  }
  if ((tableCellFlags & 0x100) != 0)
  {
LABEL_57:

    goto LABEL_58;
  }
  if ((tableCellFlags & 0x38000) == 0x20000)
    v51 = v41;
  else
    v51 = 0;
  if ((v51 ^ 1 | v40) != 1)
  {
    objc_msgSend(v32, "hitTest:withEvent:", v7, v47, v49);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = v32;
    if (v57)
      goto LABEL_56;
    goto LABEL_57;
  }
  v52 = v32;
  if ((v51 & 1) == 0)
    goto LABEL_57;
LABEL_56:
  v21 = v52;

LABEL_59:
  return v21;
}

id __37__UITableViewCell_hitTest_withEvent___block_invoke(uint64_t a1, void *a2, int a3, int a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  void *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  unint64_t v55;
  NSObject *v56;
  uint64_t v57;
  double v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  uint64_t v67;
  uint64_t v68;
  CGPoint v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  v68 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  v10 = v8;
  v11 = v9;
  v12 = v11;
  v13 = v10 != 0;
  v14 = v10;
  if (v10 && v10 != v11)
  {
    v14 = v10;
    do
    {
      v15 = v14;
      objc_msgSend(v14, "superview");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v14 != 0;
    }
    while (v14 != v12 && v14);
  }

  if (!os_variant_has_internal_diagnostics())
  {
    if (v13)
      goto LABEL_8;
    v55 = _UITableViewCellExpansionAccessoryIdentifier_block_invoke_2___s_category;
    if (!_UITableViewCellExpansionAccessoryIdentifier_block_invoke_2___s_category)
    {
      v55 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v55, (unint64_t *)&_UITableViewCellExpansionAccessoryIdentifier_block_invoke_2___s_category);
    }
    v56 = *(NSObject **)(v55 + 8);
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    v52 = v56;
    objc_msgSend(v10, "superview");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    v61 = v7;
    v62 = 2112;
    v63 = v10;
    v64 = 2112;
    v65 = v53;
    v66 = 2112;
    v67 = v57;
    _os_log_impl(&dword_185066000, v52, OS_LOG_TYPE_ERROR, "Found an accessory in the current configuration that is not in the correct view hierarchy: %@; view: %@; superview"
      ": %@; configurations: %@",
      buf,
      0x2Au);
    goto LABEL_34;
  }
  if (!v13)
  {
    __UIFaultDebugAssertLog();
    v52 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
    {
LABEL_35:

      goto LABEL_36;
    }
    objc_msgSend(v10, "superview");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    v61 = v7;
    v62 = 2112;
    v63 = v10;
    v64 = 2112;
    v65 = v53;
    v66 = 2112;
    v67 = v54;
    _os_log_fault_impl(&dword_185066000, v52, OS_LOG_TYPE_FAULT, "Found an accessory in the current configuration that is not in the correct view hierarchy: %@; view: %@; superview"
      ": %@; configurations: %@",
      buf,
      0x2Au);
LABEL_34:

    goto LABEL_35;
  }
LABEL_8:
  v16 = *(void **)(a1 + 32);
  objc_msgSend(v10, "frame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(v10, "superview");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "convertRect:fromView:", v25, v18, v20, v22, v24);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v59 = v32;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  x = v70.origin.x;
  y = v70.origin.y;
  width = v70.size.width;
  height = v70.size.height;
  v37 = CGRectGetHeight(v70);
  if (a3)
  {
    if (a4)
    {
      v38 = 0.0;
      v71.origin.y = 0.0;
      v71.origin.x = v27;
      v71.size.width = v31;
      v71.size.height = v37;
      v39 = v31 + CGRectGetMinX(v71);
      goto LABEL_14;
    }
    v72.origin.x = x;
    v72.origin.y = y;
    v72.size.width = width;
    v72.size.height = height;
    v40 = CGRectGetWidth(v72);
    v73.origin.y = 0.0;
    v73.origin.x = v27;
    v73.size.width = v31;
    v73.size.height = v37;
    v39 = v31 + v40 - CGRectGetMaxX(v73);
  }
  else
  {
    v39 = v31;
  }
  v38 = v27;
LABEL_14:
  v41 = 0;
  v42 = v38;
  v43 = v37;
  if (!CGRectContainsPoint(*(CGRect *)(&v39 - 2), *(CGPoint *)(a1 + 56)))
  {
LABEL_36:
    v51 = 0;
    goto LABEL_37;
  }
  v44 = *(double *)(a1 + 56);
  v45 = *(double *)(a1 + 64);
  v74.origin.x = v27;
  v74.origin.y = v29;
  v74.size.width = v31;
  v74.size.height = v59;
  v69.x = v44;
  v69.y = v45;
  if (!CGRectContainsPoint(v74, v69))
  {
    v46 = v31 + -2.0;
    v75.origin.x = v27 + 1.0;
    v75.origin.y = v29 + 1.0;
    v75.size.width = v46;
    v75.size.height = v59 + -2.0;
    MinX = CGRectGetMinX(v75);
    v76.origin.x = v27 + 1.0;
    v76.origin.y = v29 + 1.0;
    v76.size.width = v46;
    v76.size.height = v59 + -2.0;
    MaxX = CGRectGetMaxX(v76);
    if (v44 < MaxX)
      MaxX = v44;
    if (MinX >= MaxX)
      v44 = MinX;
    else
      v44 = MaxX;
    v77.origin.x = v27 + 1.0;
    v77.origin.y = v29 + 1.0;
    v77.size.width = v46;
    v77.size.height = v59 + -2.0;
    MinY = CGRectGetMinY(v77);
    v78.origin.x = v27 + 1.0;
    v78.origin.y = v29 + 1.0;
    v78.size.width = v46;
    v78.size.height = v59 + -2.0;
    MaxY = CGRectGetMaxY(v78);
    if (v45 < MaxY)
      MaxY = v45;
    if (MinY >= MaxY)
      v45 = MinY;
    else
      v45 = MaxY;
  }
  objc_msgSend(v10, "convertPoint:fromView:", *(_QWORD *)(a1 + 32), v44, v45);
  objc_msgSend(v10, "hitTest:withEvent:", *(_QWORD *)(a1 + 48));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_37:

  return v51;
}

- (BOOL)_isDeleteAnimationInProgress
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 31) & 1;
}

- (void)_setDeleteAnimationInProgress:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (void)setTextFieldOffset:(double)a3
{
  self->_textFieldOffset = a3;
}

- (double)textFieldOffset
{
  return self->_textFieldOffset;
}

- (void)setPlaceHolderValue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITableViewCell editableTextField](self, "editableTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaceholder:", v4);

}

- (void)setReturnAction:(SEL)a3
{
  self->_returnAction = a3;
}

- (SEL)returnAction
{
  return self->_returnAction;
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
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITableViewCell.m"), 7067, CFSTR("Popup menu button must be configured with a menu: %@"), v14);

      }
      if (!-[UIControl showsMenuAsPrimaryAction](v14, "showsMenuAsPrimaryAction"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITableViewCell.m"), 7068, CFSTR("Popup menu button must have showsMenuAsPrimaryAction enabled: %@"), v14);

      }
      if (!-[UIButton changesSelectionAsPrimaryAction](v14, "changesSelectionAsPrimaryAction"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITableViewCell.m"), 7069, CFSTR("Popup menu button must have changesSelectionAsPrimaryAction enabled: %@"), v14);

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

- (void)_updatePopupMenuButtonFromContentView
{
  id v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIView _popupMenuButton](self->_contentView, "_popupMenuButton");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell _setPopupMenuButton:](self, "_setPopupMenuButton:", v3);

  }
}

- (UIEdgeInsets)_rawSeparatorInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_separatorInset.top;
  left = self->_separatorInset.left;
  bottom = self->_separatorInset.bottom;
  right = self->_separatorInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)_separatorDrawsInVibrantLightMode
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 42) & 1;
}

- (void)_setSeparatorBackdropOverlayBlendMode:(int64_t)a3
{
  uint64_t v5;
  _BOOL8 v6;
  id v7;

  v5 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  *(_QWORD *)((char *)&self->_tableCellFlags + 4) = v5 & 0xFFFFFC7FFFFFFFFFLL | ((unint64_t)(a3 & 7) << 39);
  if ((v5 & 0x40000000000) == 0)
  {
    -[_UITableViewCellSeparatorView setDrawsWithVibrantLightMode:](self->_separatorView, "setDrawsWithVibrantLightMode:", 0);
    -[_UITableViewCellSeparatorView setDrawsWithVibrantLightMode:](self->_topSeparatorView, "setDrawsWithVibrantLightMode:", 0);
    -[UIView _setDrawsAsBackdropOverlayWithBlendMode:](self->_separatorView, "_setDrawsAsBackdropOverlayWithBlendMode:", a3);
    -[UIView setBackgroundColor:](self->_separatorView, "setBackgroundColor:", self->_separatorColor);
    -[UIView _setDrawsAsBackdropOverlayWithBlendMode:](self->_topSeparatorView, "_setDrawsAsBackdropOverlayWithBlendMode:", a3);
    -[UIView setBackgroundColor:](self->_topSeparatorView, "setBackgroundColor:", self->_separatorColor);
  }
  -[UIView layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = a3 == 0;
  objc_msgSend(v7, "setAllowsGroupBlending:", v6);
  objc_msgSend(v7, "setAllowsGroupOpacity:", v6);

}

- (id)_separatorEffect
{
  return self->_separatorEffect;
}

- (double)_indexBarExtentFromEdge
{
  return self->_indexBarExtentFromEdge;
}

- (UIEdgeInsets)_backgroundInset
{
  double top;
  double left;
  double bottom;
  double right;
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
  UIEdgeInsets result;

  top = self->_backgroundInset.top;
  left = self->_backgroundInset.left;
  bottom = self->_backgroundInset.bottom;
  right = self->_backgroundInset.right;
  -[UITableViewCell _tableView](self, "_tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sectionContentInset");
  v8 = v7;
  v10 = v9;

  if (v8 == -1.0)
    v11 = 0.0;
  else
    v11 = v8;
  if (left == -1.0)
    v12 = v11;
  else
    v12 = left;
  if (top == -1.0)
    v13 = 0.0;
  else
    v13 = top;
  if (v10 == -1.0)
    v14 = 0.0;
  else
    v14 = v10;
  if (right != -1.0)
    v14 = right;
  if (bottom == -1.0)
    v15 = 0.0;
  else
    v15 = bottom;
  result.right = v14;
  result.bottom = v15;
  result.left = v12;
  result.top = v13;
  return result;
}

- (BOOL)_separatorHidden
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 43) & 1;
}

- (BOOL)_allowsReorderingWhenNotEditing
{
  return (*(_QWORD *)((char *)&self->_tableCellFlags + 4) >> 46) & 1;
}

- (id)_previewingSegueTemplateStorageForLocation:(CGPoint)a3 inView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UITableViewCell _accessoryView:](self, "_accessoryView:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_5;
  -[UITableViewCell accessoryActionPreviewingSegueTemplateStorage](self, "accessoryActionPreviewingSegueTemplateStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || (objc_msgSend(v8, "convertPoint:fromView:", v7, x, y), (objc_msgSend(v8, "pointInside:forEvent:", 0) & 1) == 0))
  {

LABEL_5:
    -[UIView _previewingSegueTemplateStorage](self, "_previewingSegueTemplateStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)accessoryActionPreviewingSegueTemplateStorage
{
  return self->_accessoryActionPreviewingSegueTemplateStorage;
}

- (void)setAccessoryActionPreviewingSegueTemplateStorage:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryActionPreviewingSegueTemplateStorage, a3);
}

- (UITableViewCellFocusStyle)focusStyle
{
  return *((_WORD *)&self->_tableCellFlags + 5) & 7;
}

- (void)setFocusStyle:(UITableViewCellFocusStyle)focusStyle
{
  unint64_t v3;
  int v5;

  v3 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  if ((HIWORD(v3) & 7) != focusStyle)
  {
    v5 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFF8FFFFFFFFFFFFLL | ((unint64_t)(focusStyle & 7) << 48);
    *((_WORD *)&self->_tableCellFlags + 6) = v5;
    *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v5);
    if (focusStyle)
    {
      if (focusStyle == UITableViewCellFocusStyleCustom)
        -[UITableViewCell _removeFocusedFloatingContentView](self, "_removeFocusedFloatingContentView");
    }
    else if (-[UIView isFocused](self, "isFocused"))
    {
      -[UITableViewCell _ensureFocusedFloatingContentView](self, "_ensureFocusedFloatingContentView");
      -[UITableViewCell _updateFloatingContentControlStateAnimated:](self, "_updateFloatingContentControlStateAnimated:", 0);
    }
  }
}

- (id)_subviewsForFloatingContentView
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_systemBackgroundView)
    objc_msgSend(v3, "addObject:");
  if (self->_backgroundView)
    objc_msgSend(v4, "addObject:");
  if (self->_selectedBackgroundView)
    objc_msgSend(v4, "addObject:");
  if (self->_multipleSelectionBackgroundView)
    objc_msgSend(v4, "addObject:");
  if (self->_contentView)
    objc_msgSend(v4, "addObject:");
  -[UITableViewCell _existingSystemAccessoryView:](self, "_existingSystemAccessoryView:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addObject:", v5);
  if (self->_customAccessoryView)
    objc_msgSend(v4, "addObject:");

  return v4;
}

- (void)_removeFocusedFloatingContentView
{
  _UIFloatingContentView *floatingContentView;
  _UIFloatingContentView *v4;
  _UIFloatingContentView *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  floatingContentView = self->_floatingContentView;
  if (floatingContentView)
  {
    v4 = floatingContentView;
    v5 = self->_floatingContentView;
    self->_floatingContentView = 0;

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[_UIFloatingContentView contentView](v4, "contentView", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          -[UIView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    -[UIView removeFromSuperview](v4, "removeFromSuperview");
  }
}

- (BOOL)canBecomeFocused
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  char v7;
  void *v8;
  void *v9;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "preventsCellFocusabilityWhileEditing")
    && -[UITableViewCell isEditing](self, "isEditing"))
  {
    -[UITableViewCell _tableView](self, "_tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canBecomeFocused");

    if (!v6)
      return 0;
  }
  else
  {

  }
  -[UITableViewCell _existingContentView](self, "_existingContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v8, "_preventFocus") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[UITableViewCell _tableView](self, "_tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "_canFocusCell:", self);

  }
  return v7;
}

- (int64_t)_focusTouchSensitivityStyle
{
  return 3;
}

- (id)preferredFocusedView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  char v8;
  int v9;
  int v10;
  void *v11;
  char IsFocusedOrFocusable;
  id v13;
  objc_super v15;

  if (!-[UITableViewCell isEditing](self, "isEditing"))
    goto LABEL_17;
  -[UITableViewCell editingData:](self, "editingData:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editControl:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITableViewCell editingData:](self, "editingData:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reorderControl:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (!v6)
      goto LABEL_16;
    IsFocusedOrFocusable = _UIFocusItemIsFocusedOrFocusable(v6);
    v11 = v6;
    if ((IsFocusedOrFocusable & 1) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  v7 = _UIFocusItemIsFocusedOrFocusable(v4);
  v8 = v7;
  if (v6)
  {
    v9 = _UIFocusItemIsFocusedOrFocusable(v6);
    v10 = v9;
    if ((v8 & 1) == 0)
    {
      v11 = v6;
      if (!v9)
        goto LABEL_16;
LABEL_15:
      v13 = v11;

      return v13;
    }
LABEL_12:
    if ((objc_msgSend(v4, "isFocused") & v10) != 0)
      v11 = v6;
    else
      v11 = v4;
    goto LABEL_15;
  }
  if (v7)
  {
    v10 = 0;
    goto LABEL_12;
  }
LABEL_16:

LABEL_17:
  v15.receiver = self;
  v15.super_class = (Class)UITableViewCell;
  -[UIView preferredFocusedView](&v15, sel_preferredFocusedView);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_willUpdateFocusInContext:(id)a3
{
  id v4;
  UITableViewCell *v5;
  UITableViewCell *v6;
  UITableViewCell *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITableViewCell;
  -[UIView _willUpdateFocusInContext:](&v8, sel__willUpdateFocusInContext_, v4);
  objc_msgSend(v4, "previouslyFocusedView");
  v5 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

LABEL_5:
    -[UITableViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
    goto LABEL_6;
  }
  v6 = v5;
  objc_msgSend(v4, "nextFocusedView");
  v7 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
    goto LABEL_5;
LABEL_6:

}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v4;
  UITableViewCell *v5;
  void *v6;
  UITableViewCell *v7;
  void *v8;
  UITableViewCell *v9;
  UITableViewCell *v10;
  UITableViewCell *v11;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "previouslyFocusedView");
  v5 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    -[UITableViewCell _tableView](self, "_tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_cellDidBecomeUnfocused:", self);

  }
  objc_msgSend(v4, "nextFocusedView");
  v7 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
  {
    -[UITableViewCell _tableView](self, "_tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_cellDidBecomeFocused:", self);

  }
  v12.receiver = self;
  v12.super_class = (Class)UITableViewCell;
  -[UIView _didUpdateFocusInContext:](&v12, sel__didUpdateFocusInContext_, v4);
  objc_msgSend(v4, "previouslyFocusedView");
  v9 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();
  if (v9 == self)
  {

LABEL_9:
    -[UITableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
    goto LABEL_10;
  }
  v10 = v9;
  objc_msgSend(v4, "nextFocusedView");
  v11 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();

  if (v11 == self)
    goto LABEL_9;
LABEL_10:

}

- (int64_t)_systemDefaultFocusGroupPriority
{
  if (-[UITableViewCell isSelected](self, "isSelected"))
    return 2000;
  else
    return 0;
}

- (void)_updateDefaultLabelsForFocus:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  UILabel *textLabel;
  void *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *detailTextLabel;
  void *v13;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  UILabel *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  UILabel *v29;
  void *v30;
  UILabel *v31;
  int64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int64_t v36;
  void *v37;
  void *v38;
  id v39;

  v3 = a3;
  -[UITableViewCell _constants](self, "_constants");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell _tableView](self, "_tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v39, "supportsUserInterfaceStyles"))
  {
    textLabel = self->_textLabel;
    if (v3)
    {
      objc_msgSend(v39, "defaultFocusedTextColorForCell:inTableView:", self, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel _setFallbackTextColor:forUserInterfaceStyle:](textLabel, "_setFallbackTextColor:forUserInterfaceStyle:", v7, 1);

      v8 = self->_textLabel;
      objc_msgSend(v39, "defaultFocusedTextColorForCell:inTableView:", self, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel _setFallbackTextColor:forUserInterfaceStyle:](v8, "_setFallbackTextColor:forUserInterfaceStyle:", v9, 2);

      v10 = self->_textLabel;
      objc_msgSend(v39, "defaultFocusedTextColorForCell:inTableView:", self, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel _setFallbackTextColor:forUserInterfaceStyle:](v10, "_setFallbackTextColor:forUserInterfaceStyle:", v11, 1000);

      detailTextLabel = self->_detailTextLabel;
      objc_msgSend(v39, "defaultFocusedDetailTextColorForCell:inTableView:", self, v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel _setFallbackTextColor:forUserInterfaceStyle:](detailTextLabel, "_setFallbackTextColor:forUserInterfaceStyle:", v13, 1);

      v14 = self->_detailTextLabel;
      objc_msgSend(v39, "defaultFocusedDetailTextColorForCell:inTableView:", self, v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel _setFallbackTextColor:forUserInterfaceStyle:](v14, "_setFallbackTextColor:forUserInterfaceStyle:", v15, 2);

      v16 = self->_detailTextLabel;
      objc_msgSend(v39, "defaultFocusedDetailTextColorForCell:inTableView:", self, v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v16;
    }
    else
    {
      objc_msgSend(v39, "defaultTextColorForUserInterfaceStyle:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel _setFallbackTextColor:forUserInterfaceStyle:](textLabel, "_setFallbackTextColor:forUserInterfaceStyle:", v22, 1);

      v23 = self->_textLabel;
      objc_msgSend(v39, "defaultTextColorForUserInterfaceStyle:", 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel _setFallbackTextColor:forUserInterfaceStyle:](v23, "_setFallbackTextColor:forUserInterfaceStyle:", v24, 2);

      v25 = self->_textLabel;
      objc_msgSend(v39, "defaultTextColorForUserInterfaceStyle:", 1000);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel _setFallbackTextColor:forUserInterfaceStyle:](v25, "_setFallbackTextColor:forUserInterfaceStyle:", v26, 1000);

      v27 = self->_detailTextLabel;
      objc_msgSend(v39, "defaultDetailTextColorForUserInterfaceStyle:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel _setFallbackTextColor:forUserInterfaceStyle:](v27, "_setFallbackTextColor:forUserInterfaceStyle:", v28, 1);

      v29 = self->_detailTextLabel;
      objc_msgSend(v39, "defaultDetailTextColorForUserInterfaceStyle:", 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel _setFallbackTextColor:forUserInterfaceStyle:](v29, "_setFallbackTextColor:forUserInterfaceStyle:", v30, 2);

      v31 = self->_detailTextLabel;
      objc_msgSend(v39, "defaultDetailTextColorForUserInterfaceStyle:", 1000);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v31;
    }
    -[UILabel _setFallbackTextColor:forUserInterfaceStyle:](v18, "_setFallbackTextColor:forUserInterfaceStyle:", v17, 1000);
    goto LABEL_10;
  }
  -[UIView traitCollection](self, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "userInterfaceIdiom");

  if (v20 == 3)
  {
    if (v3)
    {
      objc_msgSend(v39, "defaultFocusedTextColorForCell:inTableView:", self, v5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v21);

      objc_msgSend(v39, "defaultFocusedDetailTextColorForCell:inTableView:", self, v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_detailTextLabel, "setTextColor:", v17);
    }
    else
    {
      +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[UITableViewCell _cellStyle](self, "_cellStyle");
      -[UIView traitCollection](self, "traitCollection");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _inheritedInteractionTintColor](self, "_inheritedInteractionTintColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "defaultTextColorForCellStyle:traitCollection:tintColor:state:", v32, v33, v34, v17);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v35);

      v36 = -[UITableViewCell _cellStyle](self, "_cellStyle");
      -[UIView traitCollection](self, "traitCollection");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "defaultDetailTextColorForCellStyle:traitCollection:state:", v36, v37, v17);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_detailTextLabel, "setTextColor:", v38);

    }
LABEL_10:

  }
}

- (void)_updateDefaultAccessoryViewForFocus:(BOOL)a3
{
  _BOOL8 v5;
  UITableViewCellAccessoryType v6;
  int *v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  UITableConstants *constants;
  void *v20;
  uint64_t v21;
  UITableConstants *v22;
  void *v23;
  NSObject *v24;
  unint64_t v25;
  NSObject *v26;
  uint8_t v27[16];
  uint8_t buf[16];

  -[UITableViewCell _updateAccessoriesIfNeeded](self, "_updateAccessoriesIfNeeded");
  v5 = -[UITableViewCell isEditing](self, "isEditing");
  if (v5)
  {
    v6 = -[UITableViewCell editingAccessoryType](self, "editingAccessoryType");
    v7 = &OBJC_IVAR___UITableViewCell__customEditingAccessoryView;
  }
  else
  {
    v6 = -[UITableViewCell accessoryType](self, "accessoryType");
    v7 = &OBJC_IVAR___UITableViewCell__customAccessoryView;
  }
  v8 = *(id *)((char *)&self->super.super.super.isa + *v7);
  v9 = v8;
  v10 = v6 == UITableViewCellAccessoryCheckmark || v6 == UITableViewCellAccessoryDisclosureIndicator;
  if (v10 && !v8)
  {
    -[UITableViewCell _existingSystemAccessoryView:](self, "_existingSystemAccessoryView:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;
    -[UITableViewCell _constants](self, "_constants");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell _tableView](self, "_tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_variant_has_internal_diagnostics())
    {
      if (!v13)
      {
        __UIFaultDebugAssertLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v24, OS_LOG_TYPE_FAULT, "expected standard checkmark/chevron accessory view to be a button", buf, 2u);
        }

      }
    }
    else if (!v13)
    {
      v25 = _updateDefaultAccessoryViewForFocus____s_category;
      if (!_updateDefaultAccessoryViewForFocus____s_category)
      {
        v25 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v25, (unint64_t *)&_updateDefaultAccessoryViewForFocus____s_category);
      }
      v26 = *(NSObject **)(v25 + 8);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_ERROR, "expected standard checkmark/chevron accessory view to be a button", v27, 2u);
      }
    }
    if (v6 == UITableViewCellAccessoryDisclosureIndicator)
    {
      if (!a3)
      {
        objc_msgSend(v15, "_accessoryBaseColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "defaultDisclosureImageForCell:withAccessoryBaseColor:", self, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_25:
        objc_msgSend(v13, "setBackgroundImage:forStates:", v18, 0);

LABEL_26:
        if (a3)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            constants = self->_constants;
            -[UITableViewCell _tableView](self, "_tableView");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[UITableConstants defaultFocusedAccessoryColorForCell:inTableView:](constants, "defaultFocusedAccessoryColorForCell:inTableView:", self, v20);
            v21 = objc_claimAutoreleasedReturnValue();
LABEL_31:
            v23 = (void *)v21;
            objc_msgSend(v13, "setTintColor:", v21);

          }
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v22 = self->_constants;
          -[UITableViewCell _tableView](self, "_tableView");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITableConstants defaultAccessoryColorForCell:inTableView:](v22, "defaultAccessoryColorForCell:inTableView:", self, v20);
          v21 = objc_claimAutoreleasedReturnValue();
          goto LABEL_31;
        }

        goto LABEL_33;
      }
      objc_msgSend(v14, "defaultFocusedDisclosureImageForCell:inTableView:", self, v15);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v6 != UITableViewCellAccessoryCheckmark)
        goto LABEL_26;
      if (a3)
        objc_msgSend(v14, "defaultFocusedCheckmarkImageForCell:inTableView:", self, v15);
      else
        objc_msgSend(v14, "defaultCheckmarkImageForCell:", self);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v16;
    goto LABEL_25;
  }
LABEL_33:

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  UITableViewCell *v9;
  _BOOL8 v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UITableViewCell;
  -[UIView didUpdateFocusInContext:withAnimationCoordinator:](&v12, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 3)
  {
    objc_msgSend(v6, "nextFocusedView");
    v9 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == self;

    -[UITableViewCell _tableView](self, "_tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_highlightCell:animated:scrollPosition:highlight:", self, 0, 0, v10);

  }
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  void *v4;
  objc_super v6;

  if (self->_floatingContentView)
  {
    -[_UIFloatingContentView _preferredConfigurationForFocusAnimation:inContext:](self->_floatingContentView, "_preferredConfigurationForFocusAnimation:inContext:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UITableViewCell;
    -[UIView _preferredConfigurationForFocusAnimation:inContext:](&v6, sel__preferredConfigurationForFocusAnimation_inContext_, a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)_shouldForwardMovementToFocusEngine:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 1)
    return 0;
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)UITableViewCell;
  return -[UIResponder _shouldForwardMovementToFocusEngine:](&v6, sel__shouldForwardMovementToFocusEngine_);
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
  unint64_t v5;
  void *v6;
  void *v7;
  int v8;
  __objc2_class *v9;

  if (self->_systemBackgroundView)
  {
    -[UITableViewCell _performConfigurationStateUpdate](self, "_performConfigurationStateUpdate");
    -[_UISystemBackgroundView configuration](self->_systemBackgroundView, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isTintBackgroundColor") & 1) != 0
      || (-[UIView traitCollection](self, "traitCollection"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "userInterfaceIdiom"),
          v4,
          v5 <= 5)
      && ((1 << v5) & 0x23) != 0
      && -[UITableViewCell _backgroundFillIsCustomized](self, "_backgroundFillIsCustomized"))
    {
      v6 = 0;
      goto LABEL_12;
    }

  }
  -[UITableViewCell _tableView](self, "_tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_effectiveDefaultAllowsFocus");

  if (v8)
    v9 = UIFocusHaloEffect;
  else
    v9 = _UIFocusSystemHaloEffect;
  -[UITableViewCell _defaultFocusOutline](self, "_defaultFocusOutline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[__objc2_class effectWithPath:](v9, "effectWithPath:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v6;
}

- (int64_t)focusItemDeferralMode
{
  void *v3;
  int64_t v4;

  -[UITableViewCell _tableView](self, "_tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_cellFocusItemDeferral:", self);

  return v4;
}

- (void)_prepareHighlightForInteraction:(id)a3
{
  $51D58DCA35D83F13F0EA9037A03A8F25 *p_tableCellFlags;
  id v5;
  void *v6;

  p_tableCellFlags = &self->_tableCellFlags;
  if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x40000000000000) == 0)
  {
    v5 = a3;
    -[UITableViewCell _tableView](self, "_tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_prepareHighlightForCell:withInteraction:", self, v5);

    *(_QWORD *)((char *)p_tableCellFlags + 4) |= 0x40000000000000uLL;
  }
}

- (int64_t)_preferredHighlightAnimationStyleForInteraction:(id)a3
{
  return 1;
}

- (BOOL)_highlightsAlongsideDefaultEffect
{
  uint64_t v2;

  v2 = *(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x1FLL;
  return v2 == 16 || (unint64_t)(v2 - 1) < 2;
}

- (void)_highlightForInteraction:(id)a3 fractionComplete:(double)a4 ended:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  __int128 v9;
  double v10;
  __int128 v11;
  float v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  _QWORD v19[5];
  CGAffineTransform v20;

  v5 = a5;
  v8 = a3;
  if (v5)
  {
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v20.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v20.c = v9;
    *(_OWORD *)&v20.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v10 = 0.0;
  }
  else
  {
    if (!-[UITableViewCell isHighlighted](self, "isHighlighted"))
      goto LABEL_10;
    v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v20.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v20.c = v11;
    *(_OWORD *)&v20.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    if ((*(_QWORD *)((char *)&self->_tableCellFlags + 4) & 0x1FLL) == 0)
      CGAffineTransformMakeScale(&v20, a4 * 0.945 + (1.0 - a4) * 0.99, a4 * 0.945 + (1.0 - a4) * 0.99);
    v12 = a4;
    v13 = powf(v12, 3.0);
    v10 = 1.0 - v13 + v13 * 0.0;
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __67__UITableViewCell__highlightForInteraction_fractionComplete_ended___block_invoke;
  v19[3] = &unk_1E16B1B28;
  v19[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v19);
  v18 = v20;
  -[UITableViewCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v18;
  objc_msgSend(v14, "setTransform:", &v17);

  -[UITableViewCell selectedBackgroundView](self, "selectedBackgroundView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAlpha:", v10);

  -[UITableViewCell backgroundView](self, "backgroundView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", 1.0 - v10);

  if (v5 && !-[UITableViewCell _hidesBottomSeparatorWhenUnselected](self, "_hidesBottomSeparatorWhenUnselected"))
  {
    -[UIView setAlpha:](self->_separatorView, "setAlpha:", 1.0);
    -[UIView setAlpha:](self->_topSeparatorView, "setAlpha:", 1.0);
  }
LABEL_10:

}

void __67__UITableViewCell__highlightForInteraction_fractionComplete_ended___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "selectedBackgroundView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)_highlightDidEndForInteraction:(id)a3
{
  uint64_t v3;
  int v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(_QWORD *)((char *)&self->_tableCellFlags + 4);
  if ((v3 & 0x40000000000000) != 0)
  {
    v5 = *((unsigned __int16 *)&self->_tableCellFlags + 6) | (*((unsigned __int8 *)&self->_tableCellFlags + 14) << 16);
    *(_QWORD *)((char *)&self->_tableCellFlags + 4) = v3 & 0xFFBFFFFFFFFFFFFFLL;
    *((_WORD *)&self->_tableCellFlags + 6) = v5;
    *((_BYTE *)&self->_tableCellFlags + 14) = BYTE2(v5);
    v6 = a3;
    if (!-[UITableViewCell isHighlighted](self, "isHighlighted"))
    {
      -[UITableViewCell selectedBackgroundView](self, "selectedBackgroundView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        -[UITableViewCell showSelectedBackgroundView:animated:](self, "showSelectedBackgroundView:animated:", 0, 0);
    }
    -[UITableViewCell _tableView](self, "_tableView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_highlightDidEndForCell:withInteraction:", self, v6);

  }
}

double __42__UITableViewCell__updateAccessoryMetrics__block_invoke_2(uint64_t a1)
{
  double result;
  void *v3;
  id WeakRetained;
  uint64_t v5;

  result = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (result == -1.79769313e308)
  {
    v3 = *(void **)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v3, "defaultDisclosureLayoutWidthForView:", WeakRetained);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;

    return *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  return result;
}

double __42__UITableViewCell__updateAccessoryMetrics__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_constants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "interspaceBetweenInnerAccessoryIdentifier:outerAccessoryIdentifier:forCell:trailingAccessoryGroup:", v6, v5, WeakRetained, 0);
  v10 = v9;

  return v10;
}

- (void)_setEditingControlsFocusGuide:(id)a3
{
  objc_storeStrong((id *)&self->_editingControlsFocusGuide, a3);
}

- (UIButton)_popupMenuButton
{
  return self->__popupMenuButton;
}

@end
