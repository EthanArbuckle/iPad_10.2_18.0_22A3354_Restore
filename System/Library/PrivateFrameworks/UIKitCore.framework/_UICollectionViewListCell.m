@implementation _UICollectionViewListCell

- (unint64_t)_maskedCornersForSystemBackgroundView
{
  unint64_t v2;
  objc_super v4;

  v2 = self->__backgroundViewConfigurationGrouping - 1;
  if (v2 < 4)
    return qword_186679DA0[v2];
  v4.receiver = self;
  v4.super_class = (Class)_UICollectionViewListCell;
  return -[UICollectionViewCell _maskedCornersForSystemBackgroundView](&v4, sel__maskedCornersForSystemBackgroundView);
}

- (int64_t)_backgroundViewConfigurationGrouping
{
  return self->__backgroundViewConfigurationGrouping;
}

- (void)_setBackgroundViewConfigurationGrouping:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  if (self->__backgroundViewConfigurationGrouping != a3)
  {
    self->__backgroundViewConfigurationGrouping = a3;
    -[UICollectionViewCell backgroundConfiguration](self, "backgroundConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      -[UICollectionViewCell _backgroundViewConfiguration](self, "_backgroundViewConfiguration");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v6;

    -[UICollectionViewCell _applyBackgroundViewConfiguration:withState:](self, "_applyBackgroundViewConfiguration:withState:", v8, 0);
    if (-[UICollectionViewCell isHighlighted](self, "isHighlighted")
      || -[UICollectionViewCell isSelected](self, "isSelected"))
    {
      -[UICollectionReusableView _collectionView](self, "_collectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_cellBackgroundChangedForSelectionOrHighlight:", self);

    }
  }
}

- (int64_t)accessoryTypeForAxis:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  switch(a3)
  {
    case 0:
      -[UICollectionViewListCell leadingAccessoryConfigurations](self, "leadingAccessoryConfigurations");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      -[UICollectionViewListCell trailingAccessoryConfigurations](self, "trailingAccessoryConfigurations");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      -[UICollectionViewListCell leadingEditingAccessoryConfigurations](self, "leadingEditingAccessoryConfigurations");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      -[UICollectionViewListCell trailingEditingAccessoryConfigurations](self, "trailingEditingAccessoryConfigurations");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v5 = v3;
      objc_msgSend(v3, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4 || !objc_msgSend(v4, "_isSystemType"))
        goto LABEL_10;
      v6 = objc_msgSend(v4, "_systemType") + 1;
      break;
    default:
      v4 = 0;
LABEL_10:
      v6 = 0;
      break;
  }

  return v6;
}

- (void)setAccessoryType:(int64_t)a3 forAxis:(int64_t)a4
{
  int64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v7 = -[_UICollectionViewListCell accessoryTypeForAxis:](self, "accessoryTypeForAxis:", a4);
  if (a3)
  {
    -[_UICollectionViewListCell _configurationForListAccessoryType:](self, "_configurationForListAccessoryType:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewListCell _setAccessoryConfigurations:forAxis:](self, "_setAccessoryConfigurations:forAxis:", v9, a4);

  }
  else if (v7)
  {
    -[_UICollectionViewListCell _setAccessoryConfigurations:forAxis:](self, "_setAccessoryConfigurations:forAxis:", MEMORY[0x1E0C9AA60], a4);
  }
}

- (id)accessoryViewForAxis:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  switch(a3)
  {
    case 0:
      -[UICollectionViewListCell leadingAccessoryConfigurations](self, "leadingAccessoryConfigurations");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      -[UICollectionViewListCell trailingAccessoryConfigurations](self, "trailingAccessoryConfigurations");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      -[UICollectionViewListCell leadingEditingAccessoryConfigurations](self, "leadingEditingAccessoryConfigurations");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      -[UICollectionViewListCell trailingEditingAccessoryConfigurations](self, "trailingEditingAccessoryConfigurations");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v6 = v4;
      objc_msgSend(v4, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionViewListCell _customViewForAccessoryConfiguration:](self, "_customViewForAccessoryConfiguration:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (void)setAccessoryView:(id)a3 forAxis:(int64_t)a4
{
  id v6;
  void *v7;
  _UICellAccessoryConfigurationCustomView *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_UICollectionViewListCell accessoryViewForAxis:](self, "accessoryViewForAxis:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v8 = -[_UICellAccessoryConfigurationCustomView initWithCustomView:]([_UICellAccessoryConfigurationCustomView alloc], "initWithCustomView:", v6);
    -[_UICellAccessoryConfigurationCustomView setMaintainsFixedSize:](v8, "setMaintainsFixedSize:", 1);
    v10[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewListCell _setAccessoryConfigurations:forAxis:](self, "_setAccessoryConfigurations:forAxis:", v9, a4);

  }
  else if (v7)
  {
    -[_UICollectionViewListCell _setAccessoryConfigurations:forAxis:](self, "_setAccessoryConfigurations:forAxis:", MEMORY[0x1E0C9AA60], a4);
  }

}

- (id)_customViewForAccessoryConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "_isSystemType") & 1) == 0)
  {
    v6 = (objc_class *)objc_opt_class();
    _accessoryConfigurationAsClass(v4, v6);
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "customView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_configurationForListAccessoryType:(int64_t)a3
{
  __objc2_class *v3;
  void *v7;
  id v8;

  switch(a3)
  {
    case 1:
      v3 = _UICellAccessoryConfigurationDisclosureIndicator;
      goto LABEL_9;
    case 2:
      v3 = _UICellAccessoryConfigurationCheckmark;
      goto LABEL_9;
    case 3:
      v3 = _UICellAccessoryConfigurationDelete;
      goto LABEL_9;
    case 4:
      v3 = _UICellAccessoryConfigurationInsert;
      goto LABEL_9;
    case 5:
      v3 = _UICellAccessoryConfigurationReorder;
      goto LABEL_9;
    case 6:
      v3 = _UICellAccessoryConfigurationMultiselect;
LABEL_9:
      v8 = objc_alloc_init(v3);
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewListCell.m"), 2636, CFSTR("Invalid _UICollectionViewListCellAccessoryType value: %ld"), a3);

      v8 = 0;
      break;
  }
  return v8;
}

- (void)_setAccessoryConfigurations:(id)a3 forAxis:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 0:
      -[UICollectionViewListCell setLeadingAccessoryConfigurations:](self, "setLeadingAccessoryConfigurations:", v6);
      goto LABEL_6;
    case 1:
      -[UICollectionViewListCell setTrailingAccessoryConfigurations:](self, "setTrailingAccessoryConfigurations:", v6);
      goto LABEL_6;
    case 2:
      -[UICollectionViewListCell setLeadingEditingAccessoryConfigurations:](self, "setLeadingEditingAccessoryConfigurations:", v6);
      goto LABEL_6;
    case 3:
      -[UICollectionViewListCell setTrailingEditingAccessoryConfigurations:](self, "setTrailingEditingAccessoryConfigurations:", v6);
LABEL_6:
      v6 = v7;
      break;
    default:
      break;
  }

}

@end
