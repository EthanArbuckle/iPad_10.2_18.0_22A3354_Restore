@implementation SidebarOutlineCell

- (void)_maps_addDisclosureIndicator
{
  id v3;
  UIImageSymbolConfiguration *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_msgSend(objc_alloc((Class)_UICellAccessoryConfigurationOutlineDisclosure), "initWithCellSelectionTogglesExpansionState:", 0);
  v4 = sub_10094EC40();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("chevron.forward.circle.fill"), v5));
  objc_msgSend(v3, "setImage:", v6);

  if (-[SidebarOutlineCell isHovering](self, "isHovering"))
    v7 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  else
    v7 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v8 = (void *)v7;
  objc_msgSend(v3, "setTintColor:", v7);

  v10 = v3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  -[SidebarOutlineCell setTrailingAccessoryConfigurations:](self, "setTrailingAccessoryConfigurations:", v9);

}

- (void)_maps_removeDisclosureIndicator
{
  -[SidebarOutlineCell setTrailingAccessoryConfigurations:](self, "setTrailingAccessoryConfigurations:", &__NSArray0__struct);
}

- (SidebarOutlineCell)initWithFrame:(CGRect)a3
{
  SidebarOutlineCell *v3;
  SidebarOutlineCell *v4;
  double left;
  double bottom;
  double right;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SidebarOutlineCell;
  v3 = -[SidebarOutlineCell initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SidebarOutlineCell contentView](v3, "contentView"));
    objc_msgSend(v8, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);

    -[SidebarOutlineCell _updateBackgroundStyle](v4, "_updateBackgroundStyle");
    -[SidebarOutlineCell _updateBackgroundGrouping](v4, "_updateBackgroundGrouping");
    v9 = (objc_class *)objc_opt_class(v4);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[SidebarOutlineCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v11);

  }
  return v4;
}

- (void)setBackgroundModel:(id)a3
{
  SidebarOutlineCellBackgroundModel *v5;
  SidebarOutlineCellBackgroundModel *v6;
  unsigned __int8 v7;
  SidebarOutlineCellBackgroundModel *v8;

  v5 = (SidebarOutlineCellBackgroundModel *)a3;
  v6 = v5;
  if (self->_backgroundModel != v5)
  {
    v8 = v5;
    v7 = -[SidebarOutlineCellBackgroundModel isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_backgroundModel, a3);
      -[SidebarOutlineCell _updateBackgroundStyle](self, "_updateBackgroundStyle");
      -[SidebarOutlineCell _updateBackgroundGrouping](self, "_updateBackgroundGrouping");
      v6 = v8;
    }
  }

}

- (void)_updateBackgroundStyle
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[_UIBackgroundViewConfiguration outlineCellConfiguration](_UIBackgroundViewConfiguration, "outlineCellConfiguration"));
  objc_msgSend(v4, "setBackgroundColorMode:", -[SidebarOutlineCell _currentBackgroundColorMode](self, "_currentBackgroundColorMode"));
  if (!objc_msgSend(v4, "backgroundColorMode"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v4, "setBackgroundColor:", v3);

  }
  -[SidebarOutlineCell _setBackgroundViewConfiguration:](self, "_setBackgroundViewConfiguration:", v4);
  -[SidebarOutlineCell _updateForegroundColors](self, "_updateForegroundColors");

}

- (int64_t)_currentBackgroundColorMode
{
  int64_t result;
  void *v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  unsigned __int8 v8;
  int v9;
  int v10;
  int64_t v11;

  result = -[SidebarOutlineCellBackgroundModel dropStyle](self->_backgroundModel, "dropStyle");
  if (result != 1)
  {
    if (result == 2)
    {
      return 8;
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SidebarOutlineCell traitCollection](self, "traitCollection"));
      v5 = objc_msgSend(v4, "activeAppearance");

      v6 = -[SidebarOutlineCellBackgroundModel collectionViewFocused](self->_backgroundModel, "collectionViewFocused");
      v7 = -[SidebarOutlineCellBackgroundModel collectionViewProxyFocused](self->_backgroundModel, "collectionViewProxyFocused");
      v8 = -[SidebarOutlineCellBackgroundModel collectionViewHasDropSession](self->_backgroundModel, "collectionViewHasDropSession");
      v9 = (v5 != (id)1) & ~v7;
      if ((v8 & 1) != 0)
        v9 = 1;
      if ((v6 | v7) == 1)
        v10 = v9;
      else
        v10 = 1;
      result = -[SidebarOutlineCellBackgroundModel style](self->_backgroundModel, "style");
      switch(result)
      {
        case 2:
          if (v10)
            return 9;
          else
            return 8;
        case 1:
          if (v10)
            return 9;
          else
            return 7;
        case 0:
          if (-[SidebarOutlineCell isSelected](self, "isSelected"))
          {
            v11 = 3;
            if (v5 != (id)1)
              v11 = 9;
            if (v10)
              return v11;
            else
              return 1;
          }
          else
          {
            return 0;
          }
      }
    }
  }
  return result;
}

- (void)_updateBackgroundGrouping
{
  int64_t v3;
  int64_t v4;

  v3 = -[SidebarOutlineCellBackgroundModel grouping](self->_backgroundModel, "grouping");
  if ((unint64_t)(v3 - 1) >= 4)
    v4 = 0;
  else
    v4 = v3;
  -[SidebarOutlineCell _setBackgroundViewConfigurationGrouping:](self, "_setBackgroundViewConfigurationGrouping:", v4);
}

- (BOOL)_useLightForegroundColors
{
  return (id)-[SidebarOutlineCell _currentBackgroundColorMode](self, "_currentBackgroundColorMode") == (id)1;
}

- (void)_updateForegroundColors
{
  _BOOL8 v3;

  v3 = -[SidebarOutlineCell _useLightForegroundColors](self, "_useLightForegroundColors");
  if (self->_useLightForegroundColors != v3)
    -[SidebarOutlineCell setUseLightForegroundColors:](self, "setUseLightForegroundColors:", v3);
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SidebarOutlineCell;
  -[SidebarOutlineCell setSelected:](&v4, "setSelected:", a3);
  -[SidebarOutlineCell _updateBackgroundStyle](self, "_updateBackgroundStyle");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SidebarOutlineCell;
  v4 = a3;
  -[MapsThemeCollectionViewOutlineCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SidebarOutlineCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  v6 = objc_msgSend(v5, "activeAppearance");
  v7 = objc_msgSend(v4, "activeAppearance");

  if (v6 != v7)
    -[SidebarOutlineCell _updateBackgroundStyle](self, "_updateBackgroundStyle");
}

- (void)applyLayoutAttributes:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SidebarOutlineCell;
  -[SidebarOutlineCell applyLayoutAttributes:](&v4, "applyLayoutAttributes:", a3);
  -[SidebarOutlineCell _updateHoverStateIfNeeded](self, "_updateHoverStateIfNeeded");
}

- (void)setHoverSource:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hoverSource);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_hoverSource);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hoverChangeObservers"));
    objc_msgSend(v6, "unregisterObserver:", self);

    v7 = objc_storeWeak((id *)&self->_hoverSource, obj);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "hoverChangeObservers"));
    objc_msgSend(v8, "registerObserver:", self);

    -[SidebarOutlineCell _updateHoverStateIfNeeded](self, "_updateHoverStateIfNeeded");
  }

}

- (void)_updateHoverStateIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  _BOOL8 v19;
  id v20;
  CGPoint v21;
  CGRect v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SidebarOutlineCell hoverSource](self, "hoverSource"));
  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hoverGestureRecognizer"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SidebarOutlineCell hoverSource](self, "hoverSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hoverScrollView"));
  if ((objc_msgSend(v5, "isDragging") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SidebarOutlineCell hoverSource](self, "hoverSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hoverScrollView"));
    v6 = objc_msgSend(v8, "isDecelerating");

  }
  if (objc_msgSend(v20, "_maps_isHovering") && !v6)
  {
    -[SidebarOutlineCell bounds](self, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v20, "locationInView:", self);
    v21.x = v17;
    v21.y = v18;
    v22.origin.x = v10;
    v22.origin.y = v12;
    v22.size.width = v14;
    v22.size.height = v16;
    v19 = CGRectContainsPoint(v22, v21);
    if (v19 == -[SidebarOutlineCell isHovering](self, "isHovering"))
      goto LABEL_11;
    goto LABEL_10;
  }
  if (-[SidebarOutlineCell isHovering](self, "isHovering"))
  {
    v19 = 0;
LABEL_10:
    -[SidebarOutlineCell setHovering:](self, "setHovering:", v19);
  }
LABEL_11:

}

- (SidebarOutlineCellBackgroundModel)backgroundModel
{
  return self->_backgroundModel;
}

- (SidebarOutlineCellHoverSource)hoverSource
{
  return (SidebarOutlineCellHoverSource *)objc_loadWeakRetained((id *)&self->_hoverSource);
}

- (BOOL)isHovering
{
  return self->_hovering;
}

- (void)setHovering:(BOOL)a3
{
  self->_hovering = a3;
}

- (BOOL)useLightForegroundColors
{
  return self->_useLightForegroundColors;
}

- (void)setUseLightForegroundColors:(BOOL)a3
{
  self->_useLightForegroundColors = a3;
}

- (NSString)axSectionIdentifier
{
  return self->_axSectionIdentifier;
}

- (void)setAxSectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_axSectionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axSectionIdentifier, 0);
  objc_destroyWeak((id *)&self->_hoverSource);
  objc_storeStrong((id *)&self->_backgroundModel, 0);
}

@end
