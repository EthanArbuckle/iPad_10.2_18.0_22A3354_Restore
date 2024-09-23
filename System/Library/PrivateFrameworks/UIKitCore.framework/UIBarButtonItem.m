@implementation UIBarButtonItem

- (SEL)action
{
  if (self->_primaryAction)
    return 0;
  else
    return self->_action;
}

- (BOOL)isSelected
{
  return *((unsigned __int8 *)&self->_barButtonItemFlags + 1) >> 7;
}

- (void)_applyDeferredSymbolEffects:(id)a3
{
  void (**v4)(id, uint64_t, void *, void *, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, void *, void *, uint64_t))a3;
  -[UIBarButtonItem _deferredEffectsCreateIfNecessary:](self, "_deferredEffectsCreateIfNecessary:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = (void *)objc_msgSend(v5, "copy");
  else
    v7 = 0;
  objc_msgSend(v6, "removeAllObjects", v6);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("operation"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "integerValue");
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("symbolEffect"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("options"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("animated"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v14, v15, v16, objc_msgSend(v17, "BOOLValue"));

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

}

- (id)_deferredEffectsCreateIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_getAssociatedObject(self, &_deferredEffectsCreateIfNecessary___UIBarButtonItemDeferredSymbolEffectKey);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3 && !v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(self, &_deferredEffectsCreateIfNecessary___UIBarButtonItemDeferredSymbolEffectKey, v6, (void *)1);
  }
  return v6;
}

- (BOOL)isSystemItem
{
  return (*(_BYTE *)&self->_barButtonItemFlags >> 4) & 1;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (UIContextMenuConfigurationElementOrder)preferredMenuElementOrder
{
  return self->_preferredMenuElementOrder;
}

- (id)_secondaryActionsProvider
{
  return self->_secondaryActionsProvider;
}

- (UIBarButtonItemGroup)_owningButtonGroup
{
  id WeakRetained;

  if (self->_groupRepresentative)
    WeakRetained = objc_loadWeakRetained((id *)&self->_buttonGroup);
  else
    WeakRetained = 0;
  return (UIBarButtonItemGroup *)WeakRetained;
}

- (NSArray)_gestureRecognizers
{
  if (self->_gestureRecognizers)
    return self->_gestureRecognizers;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)_backgroundImageForState:(unint64_t)a3 compact:(BOOL)a4 type:(int64_t)a5
{
  void *v5;
  id v6;
  void *v8;

  v5 = 0;
  v8 = 0;
  if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) != 0)
  {
    BarButtonItemResolveSystemBackgroundImage(-[UIBarButtonItem systemItem](self, "systemItem", a3), &v8, a4);
    v5 = v8;
  }
  v6 = v5;

  return v6;
}

- (UIImage)backgroundImageForState:(UIControlState)state style:(UIBarButtonItemStyle)style barMetrics:(UIBarMetrics)barMetrics
{
  UIControlState v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t buf[4];
  UIControlState v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (state > 8 || ((1 << state) & 0x107) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        v16 = state;
        _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "button background image only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", buf, 0xCu);
      }

    }
    else
    {
      v12 = qword_1ECD79AA0;
      if (!qword_1ECD79AA0)
      {
        v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&qword_1ECD79AA0);
      }
      v13 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v16 = state;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "button background image only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", buf, 0xCu);
      }
    }
  }
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    if ((state & 0xFFFFFFFFFFFFFFFDLL) == 0 || state == 8)
      v11 = state;
    else
      v11 = 1;
    -[_UIBarButtonItemAppearanceStorage backgroundImageForState:style:isMini:](self->_appearanceStorage, "backgroundImageForState:style:isMini:", v11, style, barMetrics == UIBarMetricsCompact);
    return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((byte_1ECD79A91 & 1) == 0)
    {
      byte_1ECD79A91 = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), "UIBarButtonItem", CFSTR("background image"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    return (UIImage *)0;
  }
}

- (BOOL)isEnabled
{
  return *(_DWORD *)&self->_barButtonItemFlags & 1;
}

- (id)_imageForState:(unint64_t)a3 compact:(BOOL)a4 type:(int64_t)a5
{
  void *v6;
  id v7;
  id v9;

  v9 = 0;
  if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) != 0)
  {
    BarButtonItemResolveSystemImage(-[UIBarButtonItem systemItem](self, "systemItem", a3), &v9, a4, a5);
    v6 = v9;
  }
  else if (!a4
         || (-[UIBarButtonItem landscapeImagePhone](self, "landscapeImagePhone", a3, a4, a5),
             v6 = (void *)objc_claimAutoreleasedReturnValue(),
             (v9 = v6) == 0))
  {
    -[UIBarButtonItem image](self, "image", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
  }
  v7 = v6;

  return v7;
}

- (id)titleTextAttributesForState:(unint64_t)a3
{
  unint64_t v3;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v15;
  NSObject *v16;
  NSObject *v18;
  int v19;
  unint64_t v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if (a3 > 8 || ((1 << a3) & 0x107) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        v19 = 134217984;
        v20 = v3;
        _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "button text attributes only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", (uint8_t *)&v19, 0xCu);
      }

    }
    else
    {
      v15 = titleTextAttributesForState____s_category;
      if (!titleTextAttributesForState____s_category)
      {
        v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&titleTextAttributesForState____s_category);
      }
      v16 = *(NSObject **)(v15 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v19 = 134217984;
        v20 = v3;
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "button text attributes only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  if ((v3 & 0xFFFFFFFFFFFFFFFDLL) != 0 && v3 != 8)
    v3 = 1;
  -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[UIBarButtonItem view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    -[UIBarButtonItem view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v8 & 1) != 0)
      goto LABEL_24;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      return 0;
    -[UIBarButtonItem view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -3;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v12, "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v9;
      if (__CFADD__(v13++, 1))
        goto LABEL_23;
    }
    v9 = v12;
LABEL_23:
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
LABEL_24:
      objc_msgSend(v9, "_titleTextAttributesForState:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (UIView)view
{
  return self->_view;
}

- (UIBarButtonItemStyle)style
{
  unsigned int v2;

  v2 = (*(_DWORD *)&self->_barButtonItemFlags >> 1) & 7;
  if (v2 == 1)
    return 0;
  else
    return (unint64_t)v2;
}

- (UIColor)tintColor
{
  return -[_UIBarButtonItemAppearanceStorage tintColor](self->_appearanceStorage, "tintColor");
}

- (BOOL)isSpringLoaded
{
  $3665B5265F98EA8C853F20A3FDC87915 barButtonItemFlags;
  _BOOL4 v3;

  barButtonItemFlags = self->_barButtonItemFlags;
  if ((*(_WORD *)&barButtonItemFlags & 0x1000) != 0
    || (*(_BYTE *)&barButtonItemFlags & 0x10) != 0 && ((*(unsigned int *)&barButtonItemFlags >> 5) & 0x7F) - 5 < 2)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    return (*(unsigned int *)&barButtonItemFlags >> 20) & 1;
  }
  return v3;
}

- (NSArray)_interactions
{
  if (self->_interactions)
    return self->_interactions;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)isSymbolAnimationEnabled
{
  return *((_BYTE *)&self->_barButtonItemFlags + 3) & 1;
}

- (UIEdgeInsets)_additionalSelectionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_additionalSelectionInsets.top;
  left = self->_additionalSelectionInsets.left;
  bottom = self->_additionalSelectionInsets.bottom;
  right = self->_additionalSelectionInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGFloat)backButtonBackgroundVerticalPositionAdjustmentForBarMetrics:(UIBarMetrics)barMetrics
{
  CGFloat result;

  -[_UIBarButtonItemAppearanceStorage backButtonBackgroundVerticalAdjustmentForBarMetrics:](self->_appearanceStorage, "backButtonBackgroundVerticalAdjustmentForBarMetrics:", barMetrics);
  return result;
}

- (BOOL)_resizesBackgroundImage
{
  return (*(_BYTE *)&self->_barButtonItemFlags & 0x10) != 0 && -[UIBarButtonItem systemItem](self, "systemItem") != 24;
}

- (UIEdgeInsets)imageInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_imageInsets.top;
  left = self->_imageInsets.left;
  bottom = self->_imageInsets.bottom;
  right = self->_imageInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGFloat)backgroundVerticalPositionAdjustmentForBarMetrics:(UIBarMetrics)barMetrics
{
  CGFloat result;

  -[_UIBarButtonItemAppearanceStorage backgroundVerticalAdjustmentForBarMetrics:](self->_appearanceStorage, "backgroundVerticalAdjustmentForBarMetrics:", barMetrics);
  return result;
}

- (void)setMenuRepresentation:(UIMenuElement *)menuRepresentation
{
  UIMenuElement *v4;
  UIMenuElement *v5;

  if (self->_menuRepresentation != menuRepresentation)
  {
    v4 = (UIMenuElement *)-[UIMenuElement copy](menuRepresentation, "copy");
    v5 = self->_menuRepresentation;
    self->_menuRepresentation = v4;

    -[UIBarButtonItem _sendNeedsToolbarUpdate](self, "_sendNeedsToolbarUpdate");
  }
}

- (UIBarButtonItem)initWithCustomView:(UIView *)customView
{
  UIView *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *v6;

  v4 = customView;
  v5 = -[UIBarButtonItem init](self, "init");
  v6 = v5;
  if (v5)
    -[UIBarButtonItem setCustomView:](v5, "setCustomView:", v4);

  return v6;
}

- (void)setCustomView:(UIView *)customView
{
  UIView *v5;
  UIView **p_view;
  UIView *view;
  void *v8;
  UIView *v9;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  UIView *v16;

  v5 = customView;
  if (v5 || (*((_BYTE *)&self->_barButtonItemFlags + 1) & 0x10) != 0)
  {
    p_view = &self->_view;
    view = self->_view;
    if (view != v5)
    {
      v16 = v5;
      -[UIView superview](view, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *p_view;
      objc_storeStrong((id *)&self->_view, customView);
      self->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFFFEFFF | ((*p_view != 0) << 12));
      if (*p_view
        && +[_UIAppearance _hasCustomizationsForClass:guideClass:](_UIAppearance, "_hasCustomizationsForClass:guideClass:", objc_opt_class(), 0))
      {
        -[UIView _setAppearanceIsInvalid:](*p_view, "_setAppearanceIsInvalid:", 1);
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[UIView setEnabled:](*p_view, "setEnabled:", *(_DWORD *)&self->_barButtonItemFlags & 1);
      -[UIBarButtonItem _updateView](self, "_updateView");
      WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
      v11 = WeakRetained;
      if (WeakRetained)
      {
        objc_msgSend(WeakRetained, "_itemCustomViewDidChange:fromView:", self, v9);
      }
      else if (v8)
      {
        v12 = objc_loadWeakRetained((id *)&self->__owningNavigationItem);
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "_navigationBar");
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = v8;
        }
        v15 = v14;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "_customViewChangedForButtonItem:", self);

      }
      -[UIView removeFromSuperview](v9, "removeFromSuperview");

      v5 = v16;
    }
  }

}

- (double)_width
{
  return self->_width;
}

- (BOOL)isCustomViewItem
{
  return (*((unsigned __int8 *)&self->_barButtonItemFlags + 1) >> 4) & 1;
}

- (UIView)customView
{
  if ((*((_BYTE *)&self->_barButtonItemFlags + 1) & 0x10) != 0)
    return self->_view;
  else
    return (UIView *)0;
}

- (void)setView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_view != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_view, a3);
    v5 = v6;
  }

}

- (BOOL)_updateMenuInPlace
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "_itemDidUpdateMenu:fromMenu:", self, self->_menu);
  else
    v4 = 0;

  return v4;
}

- (BOOL)_showsChevron
{
  return (*((unsigned __int8 *)&self->_barButtonItemFlags + 2) >> 5) & 1;
}

- (BOOL)_actsAsFakeBackButton
{
  return (*((unsigned __int8 *)&self->_barButtonItemFlags + 2) >> 3) & 1;
}

- (BOOL)_showsBackButtonIndicator
{
  return self->__showsBackButtonIndicator;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)_setViewOwner:(id)a3
{
  objc_storeWeak((id *)&self->__viewOwner, a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  objc_super v12;
  objc_super v13;

  v4 = a3;
  if ((_UIUseModernBars() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (!-[UIBarButtonItem isSpaceItem](self, "isSpaceItem") || !objc_msgSend(v5, "isSpaceItem"))
        goto LABEL_11;
      v6 = -[UIBarButtonItem systemItem](self, "systemItem");
      if (v6 != objc_msgSend(v5, "systemItem"))
      {
        v10 = 0;
        goto LABEL_12;
      }
      if (-[UIBarButtonItem systemItem](self, "systemItem") == 5
        || (-[UIBarButtonItem width](self, "width"), v8 = v7, objc_msgSend(v5, "width"), v8 == v9))
      {
        v10 = 1;
      }
      else
      {
LABEL_11:
        v12.receiver = self;
        v12.super_class = (Class)UIBarButtonItem;
        v10 = -[UIBarButtonItem isEqual:](&v12, sel_isEqual_, v5);
      }
LABEL_12:

      goto LABEL_13;
    }
    v10 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UIBarButtonItem;
    v10 = -[UIBarButtonItem isEqual:](&v13, sel_isEqual_, v4);
  }
LABEL_13:

  return v10;
}

- (int64_t)systemItem
{
  return ((unint64_t)self->_barButtonItemFlags >> 5) & 0x7F;
}

- (unint64_t)hash
{
  objc_super v4;

  if (_UIUseModernBars() && -[UIBarButtonItem isSpaceItem](self, "isSpaceItem"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)UIBarButtonItem;
  return -[UIBarButtonItem hash](&v4, sel_hash);
}

- (BOOL)isSpaceItem
{
  return (((*(_DWORD *)&self->_barButtonItemFlags >> 5) & 0x7Fu) - 5 < 2) & (*(_DWORD *)&self->_barButtonItemFlags >> 4);
}

- (CGFloat)width
{
  CGFloat result;

  if ((*(_DWORD *)&self->_barButtonItemFlags & 0x10) == 0)
    return self->_width;
  result = 0.0;
  if ((*(_DWORD *)&self->_barButtonItemFlags & 0xFE0) == 0xC0)
    return self->_width;
  return result;
}

- (_UIBarButtonItemViewOwner)_viewOwner
{
  return (_UIBarButtonItemViewOwner *)objc_loadWeakRetained((id *)&self->__viewOwner);
}

- (void)_setWidth:(double)a3
{
  id WeakRetained;
  id v5;

  if (self->_width != a3)
  {
    self->_width = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    v5 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "_itemDidChangeWidth:", self);
    else
      -[UIBarButtonItem _updateView](self, "_updateView");

  }
}

- (void)_updateView
{
  id WeakRetained;
  void *v4;
  UIView *view;
  void *v6;
  id v7;
  void *v8;
  UIView *v9;
  void *v10;
  UIView *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  UIView *v16;
  id v17;
  UIView *v18;
  UIView *v19;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  void *v21;
  _QWORD v22[5];
  id v23;
  __int128 v24;
  __int128 v25;

  if ((*((_BYTE *)&self->_barButtonItemFlags + 1) & 0x10) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    v4 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_itemStandardViewNeedsUpdate:", self);
LABEL_21:

      return;
    }
    view = self->_view;
    if (!view)
      goto LABEL_21;
    -[UIView superview](view, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v6;
          -[UIView removeFromSuperview](self->_view, "removeFromSuperview");
          v16 = self->_view;
          self->_view = 0;

          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __30__UIBarButtonItem__updateView__block_invoke;
          v22[3] = &unk_1E16B1B50;
          v22[4] = self;
          v23 = v15;
          v17 = v15;
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v22);

        }
      }
      else
      {
        v18 = self->_view;
        self->_view = 0;

      }
      goto LABEL_20;
    }
    v7 = objc_loadWeakRetained((id *)&self->__owningNavigationItem);
    objc_msgSend(v7, "_navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) != 0)
    {
LABEL_17:
      -[UIView setStyle:](self->_view, "setStyle:", 2 * (-[UIBarButtonItem style](self, "style") == UIBarButtonItemStyleDone));
      v24 = 0u;
      v25 = 0u;
      -[UIBarButtonItem _getNavBarEdgeSizeAdjust:imageInsets:landscape:](self, "_getNavBarEdgeSizeAdjust:imageInsets:landscape:", 0, &v24, objc_msgSend(v8, "isMinibar"));
      -[UIView setImageEdgeInsets:](self->_view, "setImageEdgeInsets:", v24, v25);
      v19 = self->_view;
      appearanceStorage = self->_appearanceStorage;
      objc_getAssociatedObject(self, &_UIAppearanceCustomizedSelectorsAssociationKey);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _applyBarButtonAppearanceStorage:withTaggedSelectors:](v19, "_applyBarButtonAppearanceStorage:withTaggedSelectors:", appearanceStorage, v21);

      if (self->__showsBackButtonIndicator)
        objc_msgSend(v8, "_updateBackIndicatorImage");

LABEL_20:
      goto LABEL_21;
    }
    v9 = self->_view;
    -[UIBarButtonItem title](self, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTitle:](v9, "setTitle:", v10);

    v11 = self->_view;
    if (objc_msgSend(v8, "isMinibar"))
    {
      -[UIBarButtonItem landscapeImagePhone](self, "landscapeImagePhone");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        -[UIBarButtonItem image](self, "image");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setImage:](v11, "setImage:", v13);

        v14 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      -[UIBarButtonItem image](self, "image");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v12;
    -[UIView setImage:](v11, "setImage:", v12);
    goto LABEL_16;
  }
}

- (void)setWidth:(CGFloat)width
{
  if ((*(_DWORD *)&self->_barButtonItemFlags & 0x10) == 0 || (*(_DWORD *)&self->_barButtonItemFlags & 0xFE0) == 0xC0)
    -[UIBarButtonItem _setWidth:](self, "_setWidth:", width);
}

- (UIBarButtonItemGroup)buttonGroup
{
  return (UIBarButtonItemGroup *)objc_loadWeakRetained((id *)&self->_buttonGroup);
}

- (void)_setButtonGroup:(id)a3 isRepresentative:(BOOL)a4
{
  BOOL v7;

  objc_storeWeak((id *)&self->_buttonGroup, a3);
  if (a3)
    v7 = a4;
  else
    v7 = 0;
  self->_groupRepresentative = v7;
}

- (BOOL)_wantsThreeUp
{
  return (*((unsigned __int8 *)&self->_barButtonItemFlags + 2) >> 6) & 1;
}

- (UIImage)backButtonBackgroundImageForState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics
{
  UIControlState v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t buf[4];
  UIControlState v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    if (state > 8 || ((1 << state) & 0x107) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          v14 = state;
          _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "back button background image only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", buf, 0xCu);
        }

      }
      else
      {
        v10 = qword_1ECD79AB0;
        if (!qword_1ECD79AB0)
        {
          v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v10, (unint64_t *)&qword_1ECD79AB0);
        }
        v11 = *(NSObject **)(v10 + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v14 = state;
          _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "back button background image only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", buf, 0xCu);
        }
      }
    }
    if ((state & 0xFFFFFFFFFFFFFFFDLL) == 0 || state == 8)
      v9 = state;
    else
      v9 = 1;
    -[_UIBarButtonItemAppearanceStorage backButtonBackgroundImageForState:isMini:](self->_appearanceStorage, "backButtonBackgroundImageForState:isMini:", v9, barMetrics == UIBarMetricsCompact);
    return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((byte_1ECD79A93 & 1) == 0)
    {
      byte_1ECD79A93 = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, state, "UIBarButtonItem", CFSTR("back button background image"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    return (UIImage *)0;
  }
}

- (UIBarButtonItem)initWithPrimaryAction:(UIAction *)primaryAction menu:(UIMenu *)menu
{
  UIAction *v6;
  UIMenu *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;

  v6 = primaryAction;
  v7 = menu;
  v8 = -[UIBarButtonItem init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[UIBarButtonItem setPrimaryAction:](v8, "setPrimaryAction:", v6);
    -[UIBarButtonItem setMenu:](v9, "setMenu:", v7);
  }

  return v9;
}

- (UIBarButtonItem)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem primaryAction:(UIAction *)primaryAction menu:(UIMenu *)menu
{
  UIAction *v8;
  UIMenu *v9;
  UIBarButtonItem *v10;
  UIBarButtonItem *v11;

  v8 = primaryAction;
  v9 = menu;
  v10 = -[UIBarButtonItem init](self, "init");
  v11 = v10;
  if (v10)
  {
    v10->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&v10->_barButtonItemFlags & 0xFFFFF00F | (32 * (systemItem & 0x7F)) | 0x10);
    if (systemItem == UIBarButtonSystemItemDone)
      -[UIBarButtonItem setStyle:](v10, "setStyle:", 2);
    -[UIBarButtonItem setPrimaryAction:](v11, "setPrimaryAction:", v8);
    -[UIBarButtonItem setMenu:](v11, "setMenu:", v9);
  }

  return v11;
}

- (UIBarButtonItem)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UIBarButtonItem *v5;
  int v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  NSString *title;
  uint64_t v11;
  UIImage *image;
  uint64_t v13;
  UIImage *landscapeImagePhone;
  float v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  uint64_t v24;
  UIView *view;
  void *v26;
  uint64_t v27;
  UIMenu *menu;
  int v29;
  uint64_t v30;
  UIMenuElement *menuRepresentation;
  objc_super v33;

  v4 = coder;
  v33.receiver = self;
  v33.super_class = (Class)UIBarButtonItem;
  v5 = -[UIBarItem initWithCoder:](&v33, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&v5->_barButtonItemFlags & 0xFFFFFFFE | -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIEnabled")));
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIIsSystemItem")))
      v6 = 16;
    else
      v6 = 0;
    v5->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&v5->_barButtonItemFlags & 0xFFFFFFEF | v6);
    v5->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&v5->_barButtonItemFlags & 0xFFFFF01F | (32 * (-[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UISystemItem")) & 0x7F)));
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIAction"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5->_action = NSSelectorFromString(v7);

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UITarget"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&v5->_target, v8);

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UITitle"));
    v9 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v9;

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIImage"));
    v11 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (UIImage *)v11;

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UILandscapeImagePhone"));
    v13 = objc_claimAutoreleasedReturnValue();
    landscapeImagePhone = v5->_landscapeImagePhone;
    v5->_landscapeImagePhone = (UIImage *)v13;

    -[NSCoder decodeFloatForKey:](v4, "decodeFloatForKey:", CFSTR("UIWidth"));
    v5->_width = v15;
    -[NSCoder decodeUIEdgeInsetsForKey:](v4, "decodeUIEdgeInsetsForKey:", CFSTR("UIImageInsets"));
    v5->_imageInsets.top = v16;
    v5->_imageInsets.left = v17;
    v5->_imageInsets.bottom = v18;
    v5->_imageInsets.right = v19;
    -[NSCoder decodeUIEdgeInsetsForKey:](v4, "decodeUIEdgeInsetsForKey:", CFSTR("UILandscapeImagePhoneInsets"));
    v5->_landscapeImagePhoneInsets.top = v20;
    v5->_landscapeImagePhoneInsets.left = v21;
    v5->_landscapeImagePhoneInsets.bottom = v22;
    v5->_landscapeImagePhoneInsets.right = v23;
    *(_DWORD *)&v5->_barButtonItemFlags &= 0xFFFFFFF1;
    -[UIBarItem setTag:](v5, "setTag:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UITag")));
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UICustomView"));
    v24 = objc_claimAutoreleasedReturnValue();
    view = v5->_view;
    v5->_view = (UIView *)v24;

    v5->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&v5->_barButtonItemFlags & 0xFFFFEFFF | ((v5->_view != 0) << 12));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIStyle")))
      v5->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&v5->_barButtonItemFlags & 0xFFFFFFF1 | (2 * (-[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIStyle")) & 7)));
    v5->_hidden = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIItemHidden"));
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UITintColor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      -[UIBarButtonItem setTintColor:](v5, "setTintColor:", v26);
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISpringLoaded")))
      -[UIBarButtonItem setSpringLoaded:](v5, "setSpringLoaded:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UISpringLoaded")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIBarButtonMenu")))
    {
      -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIBarButtonMenu"));
      v27 = objc_claimAutoreleasedReturnValue();
      menu = v5->_menu;
      v5->_menu = (UIMenu *)v27;

    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIBarButtonSelectionAsPrimary")))
    {
      if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIBarButtonSelectionAsPrimary")))
        v29 = 0x800000;
      else
        v29 = 0;
      v5->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&v5->_barButtonItemFlags & 0xFF7FFFFF | v29);
    }
    -[UIBarButtonItem _updateForAutomaticSelection](v5, "_updateForAutomaticSelection");
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIMenuRepresentation"));
    v30 = objc_claimAutoreleasedReturnValue();
    menuRepresentation = v5->_menuRepresentation;
    v5->_menuRepresentation = (UIMenuElement *)v30;

  }
  return v5;
}

- (UIBarButtonItem)initWithTitle:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action menu:(UIMenu *)menu
{
  NSString *v12;
  UIImage *v13;
  id v14;
  UIMenu *v15;
  UIBarButtonItem *v16;
  UIBarButtonItem *v17;

  v12 = title;
  v13 = image;
  v14 = target;
  v15 = menu;
  v16 = -[UIBarButtonItem init](self, "init");
  v17 = v16;
  if (v16)
  {
    -[UIBarButtonItem setTitle:](v16, "setTitle:", v12);
    -[UIBarButtonItem setImage:](v17, "setImage:", v13);
    -[UIBarButtonItem setTarget:](v17, "setTarget:", v14);
    -[UIBarButtonItem setAction:](v17, "setAction:", action);
    -[UIBarButtonItem setMenu:](v17, "setMenu:", v15);
  }

  return v17;
}

- (void)setMenu:(UIMenu *)menu
{
  UIMenu *v3;
  UIMenu *v6;
  UIMenu *v7;
  id WeakRetained;
  UIMenu *v9;

  v3 = self->_menu;
  if (v3 != menu)
  {
    v9 = v3;
    v6 = (UIMenu *)-[UIMenu copy](menu, "copy");
    v7 = self->_menu;
    self->_menu = v6;

    WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(WeakRetained, "_itemDidUpdateMenu:fromMenu:", self, v9) & 1) == 0)
    {
      objc_msgSend(WeakRetained, "_itemStandardViewNeedsUpdate:", self);
    }
    -[UIBarButtonItem _updateForAutomaticSelection](self, "_updateForAutomaticSelection");

  }
}

- (void)_updateForAutomaticSelection
{
  _BOOL4 v3;
  UIMenu *menu;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = -[UIBarButtonItem _isPopUpMenuButtonWithMenu:](self, "_isPopUpMenuButtonWithMenu:", self->_menu);
  menu = self->_menu;
  if (v3)
  {
    -[UIMenu setForceAutomaticSelection:](menu, "setForceAutomaticSelection:", 1);
    -[UIMenu setForcedAutomaticSelectionDelegate:](self->_menu, "setForcedAutomaticSelectionDelegate:", self);
    -[UIMenu selectedElements](self->_menu, "selectedElements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](self, "setTitle:", v7);

    -[UIMenu selectedElements](self->_menu, "selectedElements");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setImage:](self, "setImage:", v9);

  }
  else
  {
    -[UIMenu setForcedAutomaticSelectionDelegate:](menu, "setForcedAutomaticSelectionDelegate:", 0);
    -[UIMenu setForceAutomaticSelection:](self->_menu, "setForceAutomaticSelection:", 0);
  }
}

- (BOOL)_isPopUpMenuButtonWithMenu:(id)a3
{
  return a3
      && (*((_BYTE *)&self->_barButtonItemFlags + 2) & 0x80) != 0
      && -[UIBarButtonItem _menuIsPrimary](self, "_menuIsPrimary");
}

- (UIBarButtonItem)initWithImage:(UIImage *)image menu:(UIMenu *)menu
{
  return -[UIBarButtonItem initWithTitle:image:target:action:menu:](self, "initWithTitle:image:target:action:menu:", 0, image, 0, 0, menu);
}

- (UIBarButtonItem)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action
{
  NSString *v10;
  id v11;
  UIBarButtonItem *v12;
  UIBarButtonItem *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSDictionary *stylesForSizingTitles;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v10 = title;
  v11 = target;
  v12 = -[UIBarButtonItem init](self, "init");
  v13 = v12;
  if (v12)
  {
    -[UIBarButtonItem setTitle:](v12, "setTitle:", v10);
    -[UIBarButtonItem setStyle:](v13, "setStyle:", style);
    -[UIBarButtonItem setTarget:](v13, "setTarget:", v11);
    -[UIBarButtonItem setAction:](v13, "setAction:", action);
    if (v10)
    {
      if (style == UIBarButtonItemStyleDone)
      {
        v14 = objc_alloc(MEMORY[0x1E0C99D80]);
        v19[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "initWithObjects:forKeys:", v15, &unk_1E1A92B70);
        stylesForSizingTitles = v13->_stylesForSizingTitles;
        v13->_stylesForSizingTitles = (NSDictionary *)v16;

      }
    }
  }

  return v13;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *title;
  NSString *v9;

  v4 = (NSString *)a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) == 0 && self->_title != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      title = self->_title;
      self->_title = v7;

      -[UIBarButtonItem _updateView](self, "_updateView");
      v5 = v9;
    }
  }

}

- (void)_setBackButtonAlternateTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (UIBarButtonItem)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action
{
  UIImage *v10;
  id v11;
  UIBarButtonItem *v12;
  UIBarButtonItem *v13;

  v10 = image;
  v11 = target;
  v12 = -[UIBarButtonItem init](self, "init");
  v13 = v12;
  if (v12)
  {
    -[UIBarButtonItem setImage:](v12, "setImage:", v10);
    -[UIBarButtonItem setStyle:](v13, "setStyle:", style);
    -[UIBarButtonItem setTarget:](v13, "setTarget:", v11);
    -[UIBarButtonItem setAction:](v13, "setAction:", action);
  }

  return v13;
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) == 0 && self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[UIBarButtonItem _updateView](self, "_updateView");
    v5 = v6;
  }

}

- (void)setStyle:(UIBarButtonItemStyle)style
{
  unint64_t barButtonItemFlags;

  barButtonItemFlags = self->_barButtonItemFlags;
  if (((barButtonItemFlags >> 1) & 7) != style)
  {
    self->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(barButtonItemFlags & 0xFFFFFFF1 | (2 * (style & 7)));
    -[UIBarButtonItem _updateView](self, "_updateView");
  }
}

- (UIBarButtonItem)init
{
  UIBarButtonItem *v2;
  UIBarButtonItem *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIBarButtonItem;
  v2 = -[UIBarItem init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UIBarButtonItem setEnabled:](v2, "setEnabled:", 1);
  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  id WeakRetained;
  id v5;

  if (((((*(_DWORD *)&self->_barButtonItemFlags & 1) == 0) ^ a3) & 1) == 0)
  {
    self->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFFFFFFE | a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIView setEnabled:](self->_view, "setEnabled:", *(_DWORD *)&self->_barButtonItemFlags & 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      objc_msgSend(WeakRetained, "_itemDidChangeEnabledState:", self);
      WeakRetained = v5;
    }

  }
}

- (UIBarButtonItem)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem target:(id)target action:(SEL)action
{
  id v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *v10;

  v8 = target;
  v9 = -[UIBarButtonItem init](self, "init");
  v10 = v9;
  if (v9)
  {
    v9->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&v9->_barButtonItemFlags & 0xFFFFF00F | (32 * (systemItem & 0x7F)) | 0x10);
    if (systemItem == UIBarButtonSystemItemDone)
      -[UIBarButtonItem setStyle:](v9, "setStyle:", 2);
    -[UIBarButtonItem setTarget:](v10, "setTarget:", v8);
    -[UIBarButtonItem setAction:](v10, "setAction:", action);
  }

  return v10;
}

- (void)setAction:(SEL)action
{
  _BOOL4 v5;
  id WeakRetained;

  v5 = -[UIBarButtonItem _menuIsPrimary](self, "_menuIsPrimary");
  self->_action = action;
  if (v5 != -[UIBarButtonItem _menuIsPrimary](self, "_menuIsPrimary"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    objc_msgSend(WeakRetained, "_itemStandardViewNeedsUpdate:", self);

    -[UIBarButtonItem _updateForAutomaticSelection](self, "_updateForAutomaticSelection");
  }
}

- (BOOL)_menuIsPrimary
{
  if ((*((_WORD *)&self->_barButtonItemFlags + 1) & 3) != 0)
    return (*((_WORD *)&self->_barButtonItemFlags + 1) & 3) != 1;
  if ((self->_menu || self->_secondaryActionsProvider) && !self->_action)
    return self->_primaryAction == 0;
  return 0;
}

- (void)setTarget:(id)target
{
  id v4;
  char v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  id obj;
  _QWORD block[4];
  id v11;
  UIBarButtonItem *v12;

  v4 = target;
  if (!v4)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v5 = dyld_program_sdk_at_least();
  v6 = v4;
  if ((v5 & 1) == 0)
  {
    v7 = objc_msgSend(v4, sel_allowsWeakReference);
    v6 = v4;
    if ((v7 & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __29__UIBarButtonItem_setTarget___block_invoke;
      block[3] = &unk_1E16B1B50;
      v8 = v4;
      v11 = v8;
      v12 = self;
      if (setTarget__once != -1)
      {
        dispatch_once(&setTarget__once, block);
        v8 = v11;
      }

      goto LABEL_7;
    }
  }
LABEL_8:
  obj = v6;

  objc_storeWeak(&self->_target, obj);
}

- (void)_setShowsChevron:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFDFFFFF | v3);
}

- (void)setSpringLoaded:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFEFFFFF | v3);
}

- (void)setHidden:(BOOL)hidden
{
  id WeakRetained;

  if (self->_hidden != hidden)
  {
    self->_hidden = hidden;
    WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    objc_msgSend(WeakRetained, "_itemDidChangeHiddenState:", self);

  }
}

- (void)_setLargeContentSizeTitle:(id)a3
{
  objc_setAssociatedObject(self, &_largeContentSizeTitleKey, a3, (void *)3);
}

- (void)_setActsAsFakeBackButton:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFF7FFFF | v3);
}

- (UIOffset)titlePositionAdjustmentForBarMetrics:(UIBarMetrics)barMetrics
{
  double v3;
  double v4;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIOffset result;

  if ((unint64_t)(barMetrics - 101) > 1)
  {
    appearanceStorage = self->_appearanceStorage;
    if (barMetrics == UIBarMetricsCompact)
      -[_UIBarButtonItemAppearanceStorage miniTitlePositionOffset](appearanceStorage, "miniTitlePositionOffset");
    else
      -[_UIBarButtonItemAppearanceStorage titlePositionOffset](appearanceStorage, "titlePositionOffset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "UIOffsetValue");
      v3 = v8;
      v4 = v9;
    }
    else
    {
      v3 = 0.0;
      v4 = 0.0;
    }

  }
  else
  {
    v3 = 0.0;
    if ((titlePositionAdjustmentForBarMetrics__didWarn & 1) == 0)
    {
      titlePositionAdjustmentForBarMetrics__didWarn = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, "UIBarButtonItem", CFSTR("title position adjustment"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    v4 = 0.0;
  }
  v10 = v3;
  v11 = v4;
  result.vertical = v11;
  result.horizontal = v10;
  return result;
}

- (void)_setPossibleItemVariations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) == 0)
  {
    if (objc_msgSend(v4, "count"))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v5, "count"));
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v18 = v5;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            objc_msgSend(v13, "title");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v13, "style");
            if (v14)
            {
              v16 = v15;
              objc_msgSend(v6, "addObject:", v14);
              if (v16 >= 2)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "setObject:forKey:", v17, v14);

              }
            }

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v10);
      }

      -[UIBarButtonItem _setStylesForSizingTitles:](self, "_setStylesForSizingTitles:", v7);
      -[UIBarButtonItem setPossibleTitles:](self, "setPossibleTitles:", v6);

      v5 = v18;
    }
    else
    {
      -[UIBarButtonItem _setStylesForSizingTitles:](self, "_setStylesForSizingTitles:", 0);
      -[UIBarButtonItem setPossibleTitles:](self, "setPossibleTitles:", 0);
    }
  }

}

- (void)setPossibleTitles:(NSSet *)possibleTitles
{
  NSSet *v4;
  NSSet *v5;
  BOOL v6;
  NSSet *v7;
  NSSet *v8;
  NSSet *v9;

  v4 = possibleTitles;
  v5 = v4;
  if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) == 0)
  {
    v9 = v4;
    v6 = -[NSSet isEqualToSet:](v4, "isEqualToSet:", self->_possibleTitles);
    v5 = v9;
    if (!v6)
    {
      v7 = (NSSet *)-[NSSet copy](v9, "copy");
      v8 = self->_possibleTitles;
      self->_possibleTitles = v7;

      -[UIBarButtonItem _updateView](self, "_updateView");
      v5 = v9;
    }
  }

}

- (void)_setStylesForSizingTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__itemVariation, 0);
  objc_storeStrong((id *)&self->__backButtonAlternateTitles, 0);
  objc_storeStrong(&self->__autoValidationHandler, 0);
  objc_destroyWeak((id *)&self->__viewOwner);
  objc_destroyWeak((id *)&self->__owningButtonGroup);
  objc_destroyWeak((id *)&self->__owningNavigationItem);
  objc_destroyWeak((id *)&self->_buttonGroup);
  objc_storeStrong((id *)&self->_menuRepresentation, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);
  objc_storeStrong(&self->_secondaryActionsProvider, 0);
  objc_storeStrong((id *)&self->_stylesForSizingTitles, 0);
  objc_storeStrong((id *)&self->_possibleSystemItems, 0);
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_gestureRecognizers, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_landscapeImagePhone, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_possibleTitles, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)_appearanceBlindViewClasses
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)_appearanceBlindViewClasses_classList;
  if (!_appearanceBlindViewClasses_classList)
  {
    v6[0] = objc_opt_class();
    v6[1] = objc_opt_class();
    v6[2] = objc_opt_class();
    v6[3] = objc_opt_class();
    v6[4] = objc_opt_class();
    v6[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 6);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_appearanceBlindViewClasses_classList;
    _appearanceBlindViewClasses_classList = v3;

    v2 = (void *)_appearanceBlindViewClasses_classList;
  }
  return v2;
}

- (void)_setOwningNavigationItem:(id)a3
{
  objc_storeWeak((id *)&self->__owningNavigationItem, a3);
}

- (id)resolvedTitle
{
  unint64_t barButtonItemFlags;
  void *v3;
  objc_super v5;

  barButtonItemFlags = self->_barButtonItemFlags;
  if ((barButtonItemFlags & 0x10) != 0)
  {
    BarButtonItemTitleForSystemItem((barButtonItemFlags >> 5) & 0x7F);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIBarButtonItem;
    -[UIBarItem resolvedTitle](&v5, sel_resolvedTitle);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)title
{
  if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) != 0)
    return 0;
  else
    return self->_title;
}

- (NSArray)_backButtonAlternateTitles
{
  return self->__backButtonAlternateTitles;
}

- (void)_setWantsThreeUp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFBFFFFF | v3);
}

- (BOOL)_flexible
{
  return self->_flexible;
}

- (BOOL)hasImage
{
  void *v2;
  BOOL v3;

  if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) != 0)
    return BarButtonItemResolveSystemImage(-[UIBarButtonItem systemItem](self, "systemItem"), 0, 0, 0);
  -[UIBarButtonItem image](self, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)image
{
  if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) != 0)
    return 0;
  else
    return self->_image;
}

- (UIBarButtonItem)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem primaryAction:(UIAction *)primaryAction
{
  return -[UIBarButtonItem initWithBarButtonSystemItem:primaryAction:menu:](self, "initWithBarButtonSystemItem:primaryAction:menu:", systemItem, primaryAction, 0);
}

- (void)_relinquishOwnership:(id)a3
{
  _UIBarButtonItemViewOwner **p_viewOwner;
  id v4;
  void *v5;
  id WeakRetained;

  p_viewOwner = &self->__viewOwner;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewOwner);

  v5 = WeakRetained;
  if (WeakRetained == v4)
  {
    objc_storeWeak((id *)p_viewOwner, 0);
    v5 = WeakRetained;
  }

}

- (UIMenuElement)menuRepresentation
{
  return self->_menuRepresentation;
}

- (void)dealloc
{
  objc_super v3;

  if (!-[UIBarButtonItem isCustomViewItem](self, "isCustomViewItem") && (objc_opt_respondsToSelector() & 1) != 0)
    -[UIView removeTarget:action:forControlEvents:](self->_view, "removeTarget:action:forControlEvents:", self, sel__sendAction_withEvent_, 0x2000);
  v3.receiver = self;
  v3.super_class = (Class)UIBarButtonItem;
  -[UIBarButtonItem dealloc](&v3, sel_dealloc);
}

- (UIImage)backgroundImageForState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics
{
  return -[UIBarButtonItem backgroundImageForState:style:barMetrics:](self, "backgroundImageForState:style:barMetrics:", state, 8, barMetrics);
}

- (void)setPrimaryAction:(UIAction *)primaryAction
{
  UIAction *v4;
  _BOOL4 v5;
  UIAction *v6;
  UIAction *v7;
  id WeakRetained;
  UIAction *v9;
  void *v10;
  id v11;

  v4 = primaryAction;
  v5 = -[UIBarButtonItem _menuIsPrimary](self, "_menuIsPrimary");
  -[UIAction _immutableCopy](v4, "_immutableCopy");
  v6 = (UIAction *)objc_claimAutoreleasedReturnValue();

  v7 = self->_primaryAction;
  self->_primaryAction = v6;

  if (v5 != -[UIBarButtonItem _menuIsPrimary](self, "_menuIsPrimary"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    objc_msgSend(WeakRetained, "_itemStandardViewNeedsUpdate:", self);

    -[UIBarButtonItem _updateForAutomaticSelection](self, "_updateForAutomaticSelection");
  }
  if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) == 0)
  {
    v9 = self->_primaryAction;
    if (v9)
    {
      -[UIMenuElement title](v9, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setTitle:](self, "setTitle:", v10);

      -[UIMenuElement image](self->_primaryAction, "image");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setImage:](self, "setImage:", v11);

    }
  }
}

- (void)setBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics
{
  -[UIBarButtonItem setBackgroundImage:forState:style:barMetrics:](self, "setBackgroundImage:forState:style:barMetrics:", backgroundImage, state, 8, barMetrics);
}

- (void)_connectInterfaceBuilderEventConnection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(v4, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTarget:](self, "setTarget:", v5);

  v6 = objc_msgSend(v4, "action");
  -[UIBarButtonItem setAction:](self, "setAction:", v6);
}

- (void)setBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state style:(UIBarButtonItemStyle)style barMetrics:(UIBarMetrics)barMetrics
{
  UIImage *v11;
  _UIBarButtonItemAppearanceStorage *v12;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  uint8_t buf[4];
  UIControlState v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = backgroundImage;
  if (style != 8 && -[UIBarButtonItem style](self, "style") != style)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIBarButtonItem.m"), 1456, CFSTR("attempt to set background image for style not matching the UIBarButtonItem's style"));

  }
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    if (!self->_appearanceStorage)
    {
      v12 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      appearanceStorage = self->_appearanceStorage;
      self->_appearanceStorage = v12;

    }
    if (state > 8 || ((1 << state) & 0x107) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          v30 = state;
          _os_log_fault_impl(&dword_185066000, v28, OS_LOG_TYPE_FAULT, "button background image only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", buf, 0xCu);
        }

      }
      else
      {
        v25 = qword_1ECD79A98;
        if (!qword_1ECD79A98)
        {
          v25 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v25, (unint64_t *)&qword_1ECD79A98);
        }
        v26 = *(NSObject **)(v25 + 8);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v30 = state;
          _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_ERROR, "button background image only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", buf, 0xCu);
        }
      }
    }
    if ((state & 0xFFFFFFFFFFFFFFFDLL) != 0 && state != 8)
      state = 1;
    v15 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", state);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", barMetrics);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayWithObjects:", v16, v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _UIAppearanceTagObjectForSelector(self, sel_setBackgroundImage_forState_barMetrics_, v18);

    v19 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", state);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", style);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", barMetrics);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrayWithObjects:", v20, v21, v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _UIAppearanceTagObjectForSelector(self, a2, v23);

    -[_UIBarButtonItemAppearanceStorage backgroundImageForState:style:isMini:](self->_appearanceStorage, "backgroundImageForState:style:isMini:", state, style, barMetrics == UIBarMetricsCompact);
    v24 = objc_claimAutoreleasedReturnValue();
    if ((unint64_t)v11 | v24 && !-[UIImage isEqual:](v11, "isEqual:", v24))
    {
      -[_UIBarButtonItemAppearanceStorage setBackgroundImage:forState:style:isMini:](self->_appearanceStorage, "setBackgroundImage:forState:style:isMini:", v11, state, style, barMetrics == UIBarMetricsCompact);
      -[UIBarButtonItem _updateView](self, "_updateView");
    }

  }
  else if ((_MergedGlobals_13_0 & 1) == 0)
  {
    _MergedGlobals_13_0 = 1;
    NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), "UIBarButtonItem", CFSTR("background image"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
  }

}

- (void)setTintColor:(UIColor *)tintColor
{
  _UIBarButtonItemAppearanceStorage *v5;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  uint64_t v7;
  UIColor *v8;

  v8 = tintColor;
  if (!self->_appearanceStorage)
  {
    v5 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
    appearanceStorage = self->_appearanceStorage;
    self->_appearanceStorage = v5;

  }
  _UIAppearanceTagObjectForSelector(self, a2, 0);
  -[_UIBarButtonItemAppearanceStorage tintColor](self->_appearanceStorage, "tintColor");
  v7 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v8 | v7 && !-[UIColor isEqual:](v8, "isEqual:", v7))
  {
    -[_UIBarButtonItemAppearanceStorage setTintColor:](self->_appearanceStorage, "setTintColor:", v8);
    -[UIBarButtonItem _updateView](self, "_updateView");
  }

}

- (void)setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  id v7;
  _UIBarButtonItemAppearanceStorage *v8;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!self->_appearanceStorage)
  {
    v8 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
    appearanceStorage = self->_appearanceStorage;
    self->_appearanceStorage = v8;

  }
  if (a4 > 8 || ((1 << a4) & 0x107) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        v21 = 134217984;
        v22 = a4;
        _os_log_fault_impl(&dword_185066000, v20, OS_LOG_TYPE_FAULT, "button text attributes only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", (uint8_t *)&v21, 0xCu);
      }

    }
    else
    {
      v18 = setTitleTextAttributes_forState____s_category;
      if (!setTitleTextAttributes_forState____s_category)
      {
        v18 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&setTitleTextAttributes_forState____s_category);
      }
      v19 = *(NSObject **)(v18 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v21 = 134217984;
        v22 = a4;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "button text attributes only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", (uint8_t *)&v21, 0xCu);
      }
    }
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0 || a4 == 8)
    v11 = a4;
  else
    v11 = 1;
  objc_msgSend(v7, "_ui_attributesForDictionaryContainingUIStringDrawingKeys");
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayWithObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _UIAppearanceTagObjectForSelector(self, a2, v15);

  -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", v11);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16 | v12 && (objc_msgSend((id)v16, "isEqual:", v12) & 1) == 0)
  {
    -[_UIBarItemAppearanceStorage setTextAttributes:forState:](self->_appearanceStorage, "setTextAttributes:forState:", v12, v11);
    -[UIBarButtonItem _updateView](self, "_updateView");
  }

}

- (id)target
{
  if (self->_primaryAction)
    return 0;
  else
    return objc_loadWeakRetained(&self->_target);
}

- (void)_setShowsBackButtonIndicator:(BOOL)a3
{
  int v4;
  id v5;

  if (self->__showsBackButtonIndicator != a3)
  {
    self->__showsBackButtonIndicator = a3;
    if (a3)
      v4 = 0x200000;
    else
      v4 = 0;
    self->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFDFFFFF | v4);
    if (dyld_program_sdk_at_least())
    {
      -[UIBarButtonItem _owningNavigationItem](self, "_owningNavigationItem");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "updateNavigationBarButtonsAnimated:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));

    }
  }
}

- (void)_setGestureRecognizers:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *v6;
  char v7;
  NSArray *v8;
  id WeakRetained;
  NSArray *v10;
  NSArray *gestureRecognizers;
  NSArray *v12;

  v4 = a3;
  v5 = self->_gestureRecognizers;
  v6 = (NSArray *)v4;
  v12 = v6;
  if (v5 == v6)
  {

    WeakRetained = v12;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSArray isEqual:](v5, "isEqual:", v6);

      v8 = v12;
      if ((v7 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

      v8 = v12;
    }
    v10 = (NSArray *)-[NSArray copy](v8, "copy");
    gestureRecognizers = self->_gestureRecognizers;
    self->_gestureRecognizers = v10;

    WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    objc_msgSend(WeakRetained, "_itemStandardViewNeedsUpdate:", self);
  }

  v8 = v12;
LABEL_10:

}

- (void)_setAdditionalSelectionInsets:(UIEdgeInsets)a3
{
  id WeakRetained;

  if (self->_additionalSelectionInsets.left != a3.left
    || self->_additionalSelectionInsets.top != a3.top
    || self->_additionalSelectionInsets.right != a3.right
    || self->_additionalSelectionInsets.bottom != a3.bottom)
  {
    self->_additionalSelectionInsets = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    objc_msgSend(WeakRetained, "_itemStandardViewNeedsUpdate:", self);

  }
}

- (void)setSelected:(BOOL)selected
{
  int v4;
  id WeakRetained;
  char isKindOfClass;
  void *v7;
  id v8;

  if (((((*(_DWORD *)&self->_barButtonItemFlags & 0x8000) == 0) ^ selected) & 1) == 0)
  {
    if (selected)
      v4 = 0x8000;
    else
      v4 = 0;
    self->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFFF7FFF | v4);
    WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    v8 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_itemDidChangeSelectionState:", self);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[UIView setUseSelectedImage:](self->_view, "setUseSelectedImage:", (*(_DWORD *)&self->_barButtonItemFlags >> 15) & 1);
      }
      else
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v7 = 0;
        if ((isKindOfClass & 1) == 0)
        {
LABEL_12:

          return;
        }
        -[UIView setSelected:](self->_view, "setSelected:", (*(_DWORD *)&self->_barButtonItemFlags >> 15) & 1);
      }
    }
    v7 = v8;
    goto LABEL_12;
  }
}

- (void)setIsMinibarView:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFFFDFFF | v3);
}

- (id)createViewForNavigationItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  id v10;
  UIImage *image;
  UIImage *v12;
  __int128 v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  id v17;
  double width;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  void *v24;
  NSArray *gestureRecognizers;
  id v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v33;
  UIImage *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  UIBarButtonItemStyle v46;
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_hasLegacyProvider");

  if (v6)
  {
    if ((*((_BYTE *)&self->_barButtonItemFlags + 1) & 0x10) != 0)
    {
      -[UIBarButtonItem customView](self, "customView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[UIBarButtonItem _applyPositionAdjustmentToSegmentedControl:](self, "_applyPositionAdjustmentToSegmentedControl:", v14);
      _clampWidthOfView(v14, self->_minimumWidth, self->_maximumWidth);
    }
    else
    {
      v47 = 0;
      v46 = UIBarButtonItemStylePlain;
      v7 = *MEMORY[0x1E0C9D820];
      v44 = 0u;
      v45 = v7;
      v43 = 0u;
      objc_msgSend(v4, "navigationBar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "barStyle");
      if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) != 0)
      {
        v41 = 0;
        v42 = 0;
        v40 = 0;
        LOWORD(v33) = objc_msgSend(v8, "isMinibar");
        -[UIBarButtonItem _getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:](self, "_getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:", &v46, &v42, &v41, &v40, &v47, v9, v33);
        v10 = v42;
        v12 = (UIImage *)v41;
        v35 = v40;
        -[UIBarButtonItem _getNavBarEdgeSizeAdjust:imageInsets:landscape:](self, "_getNavBarEdgeSizeAdjust:imageInsets:landscape:", &v45, &v43, objc_msgSend(v8, "isMinibar"));
        if (!-[UIBarButtonItem action](self, "action") && v47)
          -[UIBarButtonItem setAction:](self, "setAction:");
      }
      else
      {
        -[UIBarButtonItem title](self, "title");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v8, "isMinibar") || (image = self->_landscapeImagePhone) == 0)
          image = self->_image;
        v12 = image;
        v35 = 0;
        v46 = -[UIBarButtonItem style](self, "style");
        v13 = *(_OWORD *)&self->_imageInsets.bottom;
        v43 = *(_OWORD *)&self->_imageInsets.top;
        v44 = v13;
      }
      if (v46 == (UIBarButtonItemStyleDone|UIBarButtonItemStyleBordered|0x4))
        v15 = 5;
      else
        v15 = 0;
      if (v46 == UIBarButtonItemStyleDone)
        v16 = 2;
      else
        v16 = v15;
      if (v9 == 1 && (objc_msgSend(v8, "isTranslucent") & 1) != 0)
        v9 = 2;
      if (v12)
      {
        v17 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "classForNavigationButton"));
        if ((*((_BYTE *)&self->_barButtonItemFlags + 1) & 0x40) != 0)
          width = self->_width;
        else
          -[UIBarButtonItem width](self, "width");
        LOBYTE(v33) = 0;
        v14 = (void *)objc_msgSend(v17, "initWithValue:width:style:barStyle:possibleTitles:possibleSystemItems:tintColor:applyBezel:forButtonItemStyle:", v12, v16, v9, 0, self->_possibleSystemItems, 0, width, v33, v46);
      }
      else if (v10)
      {
        v19 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "classForNavigationButton"));
        -[UIBarButtonItem possibleTitles](self, "possibleTitles");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v19, "initWithTitle:possibleTitles:style:", v10, v20, v16);

      }
      else
      {
        v14 = 0;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v14, "_setCreatedByBarButtonItem:", 1);
      -[UIBarButtonItem _setEnclosingBar:onItem:](self, "_setEnclosingBar:onItem:", v8, v14);
      if (v14)
      {
        objc_msgSend(v14, "setOriginatingButtonItem:", self);
        objc_msgSend(v14, "setOriginatingNavigationItem:", v4);
        objc_msgSend(v14, "_setStylesForSizingTitles:", self->_stylesForSizingTitles);
        objc_msgSend(v14, "setEnabled:", -[UIBarButtonItem isEnabled](self, "isEnabled"));
        objc_msgSend(v14, "setAutosizesToFit:", (*(_DWORD *)&self->_barButtonItemFlags & 0x4000) == 0);
        objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel__sendAction_withEvent_, 0x2000);
        objc_msgSend(v14, "setImageEdgeInsets:", v43, v44);
        if (self->_width <= 0.0)
        {
          _clampWidthOfView(v14, self->_minimumWidth, self->_maximumWidth);
          objc_msgSend(v14, "setMinimumWidth:", self->_minimumWidth);
          objc_msgSend(v14, "setMaximumWidth:", self->_maximumWidth);
        }
        objc_msgSend(v14, "_setBoundsAdjustment:", v45);
        objc_msgSend(v8, "_appearanceStorage");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "_barButtonAppearanceStorage");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_applyBarButtonAppearanceStorage:withTaggedSelectors:", v22, 0);

        appearanceStorage = self->_appearanceStorage;
        objc_getAssociatedObject(self, &_UIAppearanceCustomizedSelectorsAssociationKey);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_applyBarButtonAppearanceStorage:withTaggedSelectors:", appearanceStorage, v24);

        if (+[_UIAppearance _hasCustomizationsForClass:guideClass:](_UIAppearance, "_hasCustomizationsForClass:guideClass:", objc_opt_class(), 0))
        {
          objc_msgSend(v14, "_setAppearanceIsInvalid:", 1);
        }
        objc_msgSend(v14, "_setAppearanceGuideClass:", objc_opt_class());
        gestureRecognizers = self->_gestureRecognizers;
        if (gestureRecognizers)
        {
          v34 = v12;
          v26 = v10;
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v27 = gestureRecognizers;
          v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v37;
            do
            {
              for (i = 0; i != v29; ++i)
              {
                if (*(_QWORD *)v37 != v30)
                  objc_enumerationMutation(v27);
                objc_msgSend(v14, "addGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
              }
              v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
            }
            while (v29);
          }

          v10 = v26;
          v12 = v34;
        }
      }
      objc_msgSend(v14, "setSelected:", (*(_DWORD *)&self->_barButtonItemFlags >> 15) & 1);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (UIBarButtonItem)initWithPrimaryAction:(UIAction *)primaryAction
{
  return -[UIBarButtonItem initWithPrimaryAction:menu:](self, "initWithPrimaryAction:menu:", primaryAction, 0);
}

- (void)_setSecondaryActionsProvider:(id)a3
{
  void *v4;
  id secondaryActionsProvider;
  id WeakRetained;

  if (self->_secondaryActionsProvider != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    secondaryActionsProvider = self->_secondaryActionsProvider;
    self->_secondaryActionsProvider = v4;

    WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    objc_msgSend(WeakRetained, "_itemStandardViewNeedsUpdate:", self);

  }
}

- (UIBarButtonItem)initWithTitle:(NSString *)title menu:(UIMenu *)menu
{
  return -[UIBarButtonItem initWithTitle:image:target:action:menu:](self, "initWithTitle:image:target:action:menu:", title, 0, 0, 0, menu);
}

- (UIBarButtonItem)initWithImage:(UIImage *)image landscapeImagePhone:(UIImage *)landscapeImagePhone style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action
{
  UIImage *v12;
  UIImage *v13;
  id v14;
  UIBarButtonItem *v15;
  UIBarButtonItem *v16;

  v12 = image;
  v13 = landscapeImagePhone;
  v14 = target;
  v15 = -[UIBarButtonItem init](self, "init");
  v16 = v15;
  if (v15)
  {
    -[UIBarButtonItem setImage:](v15, "setImage:", v12);
    -[UIBarButtonItem setLandscapeImagePhone:](v16, "setLandscapeImagePhone:", v13);
    -[UIBarButtonItem setStyle:](v16, "setStyle:", style);
    -[UIBarButtonItem setTarget:](v16, "setTarget:", v14);
    -[UIBarButtonItem setAction:](v16, "setAction:", action);
  }

  return v16;
}

- (void)setLandscapeImagePhone:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) == 0 && self->_landscapeImagePhone != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_landscapeImagePhone, a3);
    -[UIBarButtonItem _updateView](self, "_updateView");
    v5 = v6;
  }

}

- (void)setSecondaryActionsArePrimary:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  id WeakRetained;

  v3 = a3;
  if (-[UIBarButtonItem _menuIsPrimary](self, "_menuIsPrimary") != a3)
  {
    if (v3)
      v5 = 0x20000;
    else
      v5 = 0x10000;
    self->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFFCFFFF | v5);
    WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    objc_msgSend(WeakRetained, "_itemStandardViewNeedsUpdate:", self);

  }
}

- (void)setImageInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_imageInsets.left
    || a3.top != self->_imageInsets.top
    || a3.right != self->_imageInsets.right
    || a3.bottom != self->_imageInsets.bottom)
  {
    self->_imageInsets = a3;
    -[UIBarButtonItem _updateView](self, "_updateView");
  }
}

+ (UIBarButtonItem)flexibleSpaceItem
{
  return (UIBarButtonItem *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBarButtonSystemItem:primaryAction:", 5, 0);
}

- (UIBarButtonItem)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem menu:(UIMenu *)menu
{
  return -[UIBarButtonItem initWithBarButtonSystemItem:primaryAction:menu:](self, "initWithBarButtonSystemItem:primaryAction:menu:", systemItem, 0, menu);
}

+ (UIBarButtonItem)fixedSpaceItemOfWidth:(CGFloat)width
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBarButtonSystemItem:primaryAction:", 6, 0);
  objc_msgSend(v4, "setWidth:", width);
  return (UIBarButtonItem *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  $3665B5265F98EA8C853F20A3FDC87915 barButtonItemFlags;
  uint64_t v8;
  const char *action;
  void *v10;
  id WeakRetained;
  NSString *title;
  double width;
  UIImage *image;
  UIImage *landscapeImagePhone;
  void *v16;
  void *v17;
  UIMenu *menu;
  UIMenuElement *menuRepresentation;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UIBarButtonItem;
  -[UIBarItem encodeWithCoder:](&v20, sel_encodeWithCoder_, v4);
  -[UIBarButtonItem customView](self, "customView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIBarButtonItem customView](self, "customView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("UICustomView"));

  }
  barButtonItemFlags = self->_barButtonItemFlags;
  if ((*(_BYTE *)&barButtonItemFlags & 1) != 0)
  {
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIEnabled"));
    barButtonItemFlags = self->_barButtonItemFlags;
  }
  if ((*(_BYTE *)&barButtonItemFlags & 0x10) != 0)
  {
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIIsSystemItem"));
    objc_msgSend(v4, "encodeInteger:forKey:", ((unint64_t)self->_barButtonItemFlags >> 5) & 0x7F, CFSTR("UISystemItem"));
    barButtonItemFlags = self->_barButtonItemFlags;
  }
  v8 = (*(unsigned int *)&barButtonItemFlags >> 1) & 7;
  if ((_DWORD)v8)
    objc_msgSend(v4, "encodeInteger:forKey:", v8, CFSTR("UIStyle"));
  if (self->_hidden)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIItemHidden"));
  if (-[UIBarItem tag](self, "tag"))
    objc_msgSend(v4, "encodeInteger:forKey:", -[UIBarItem tag](self, "tag"), CFSTR("UITag"));
  action = self->_action;
  if (action)
  {
    NSStringFromSelector(action);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("UIAction"));

  }
  WeakRetained = objc_loadWeakRetained(&self->_target);
  if (WeakRetained)
    objc_msgSend(v4, "encodeConditionalObject:forKey:", WeakRetained, CFSTR("UITarget"));
  title = self->_title;
  if (title)
    objc_msgSend(v4, "encodeObject:forKey:", title, CFSTR("UITitle"));
  width = self->_width;
  if (width != 0.0)
  {
    *(float *)&width = width;
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UIWidth"), width);
  }
  image = self->_image;
  if (image)
    objc_msgSend(v4, "encodeObject:forKey:", image, CFSTR("UIImage"));
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_imageInsets.top), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_imageInsets.bottom))))) & 1) != 0)
  {
    -[UIBarButtonItem imageInsets](self, "imageInsets");
    objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", CFSTR("UIImageInsets"));
  }
  landscapeImagePhone = self->_landscapeImagePhone;
  if (landscapeImagePhone)
    objc_msgSend(v4, "encodeObject:forKey:", landscapeImagePhone, CFSTR("UILandscapeImagePhone"));
  if (self->_landscapeImagePhoneInsets.top != 0.0
    || self->_landscapeImagePhoneInsets.bottom != 0.0
    || self->_landscapeImagePhoneInsets.left != 0.0
    || self->_landscapeImagePhoneInsets.right != 0.0)
  {
    objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", CFSTR("UILandscapeImagePhoneInsets"));
  }
  -[_UIBarButtonItemAppearanceStorage tintColor](self->_appearanceStorage, "tintColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_UIBarButtonItemAppearanceStorage tintColor](self->_appearanceStorage, "tintColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("UITintColor"));

  }
  if (-[UIBarButtonItem isSpringLoaded](self, "isSpringLoaded"))
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UISpringLoaded"));
  menu = self->_menu;
  if (menu)
    objc_msgSend(v4, "encodeObject:forKey:", menu, CFSTR("UIBarButtonMenu"));
  if ((*((_BYTE *)&self->_barButtonItemFlags + 2) & 0x80) != 0)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIBarButtonSelectionAsPrimary"));
  menuRepresentation = self->_menuRepresentation;
  if (menuRepresentation)
    objc_msgSend(v4, "encodeObject:forKey:", menuRepresentation, CFSTR("UIMenuRepresentation"));

}

- (id)landscapeImagePhone
{
  if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) != 0)
    return 0;
  else
    return self->_landscapeImagePhone;
}

- (void)setLandscapeImagePhoneInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_landscapeImagePhoneInsets.left
    || a3.top != self->_landscapeImagePhoneInsets.top
    || a3.right != self->_landscapeImagePhoneInsets.right
    || a3.bottom != self->_landscapeImagePhoneInsets.bottom)
  {
    self->_landscapeImagePhoneInsets = a3;
    -[UIBarButtonItem _updateView](self, "_updateView");
  }
}

- (UIEdgeInsets)landscapeImagePhoneInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_landscapeImagePhoneInsets.top;
  left = self->_landscapeImagePhoneInsets.left;
  bottom = self->_landscapeImagePhoneInsets.bottom;
  right = self->_landscapeImagePhoneInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (id)largeContentSizeImage
{
  void *v2;
  objc_super v4;

  if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) != 0)
  {
    v2 = 0;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)UIBarButtonItem;
    -[UIBarItem largeContentSizeImage](&v4, sel_largeContentSizeImage);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLargeContentSizeImage:(id)a3
{
  objc_super v3;

  if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) == 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)UIBarButtonItem;
    -[UIBarItem setLargeContentSizeImage:](&v3, sel_setLargeContentSizeImage_, a3);
  }
}

- (UIEdgeInsets)largeContentSizeImageInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIBarButtonItem;
    -[UIBarItem largeContentSizeImageInsets](&v6, sel_largeContentSizeImageInsets, 0.0, 0.0, 0.0, 0.0);
  }
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (void)setLargeContentSizeImageInsets:(UIEdgeInsets)a3
{
  objc_super v3;

  if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) == 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)UIBarButtonItem;
    -[UIBarItem setLargeContentSizeImageInsets:](&v3, sel_setLargeContentSizeImageInsets_, a3.top, a3.left, a3.bottom, a3.right);
  }
}

- (BOOL)_hasAction
{
  return self->_primaryAction || self->_action != 0;
}

- (void)_triggerAction:(id)a3
{
  -[UIBarButtonItem _triggerActionForEvent:](self, "_triggerActionForEvent:", 0);
}

- (void)_triggerActionForEvent:(id)a3
{
  -[UIBarButtonItem _triggerActionForEvent:fallbackSender:](self, "_triggerActionForEvent:fallbackSender:", a3, 0);
}

- (void)_triggerActionForEvent:(id)a3 fallbackSender:(id)a4
{
  id v6;
  UIAction *primaryAction;
  void *WeakRetained;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  primaryAction = self->_primaryAction;
  if (primaryAction)
  {
    -[UIAction performWithSender:target:](primaryAction, "performWithSender:target:", self, 0);
  }
  else if (self->_action)
  {
    WeakRetained = objc_loadWeakRetained(&self->_target);
    if (!WeakRetained)
    {
      -[UIBarButtonItem window](self, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        if (!v9)
        {
          objc_msgSend((id)UIApp, "_unswizzledTargetInChainForAction:sender:", self->_action, v6);
          WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    objc_msgSend((id)UIApp, "sendAction:to:from:forEvent:", self->_action, WeakRetained, self, v10);

  }
}

- (void)_executeValidationHandler
{
  void (**autoValidationHandler)(id, UIBarButtonItem *);

  autoValidationHandler = (void (**)(id, UIBarButtonItem *))self->__autoValidationHandler;
  if (autoValidationHandler)
    autoValidationHandler[2](autoValidationHandler, self);
}

- (void)_getMenuTitle:(id *)a3 image:(id *)a4
{
  __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  -[UIBarButtonItem resolvedTitle](self, "resolvedTitle");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
    v7 = (__CFString *)v13;
  else
    v7 = &stru_1E16EDF20;
  v8 = *a3;
  *a3 = v7;

  -[UIBarButtonItem _imageForState:compact:type:](self, "_imageForState:compact:type:", 0, 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = v9;
  v12 = *a4;
  *a4 = v10;

}

- (UIMenuElement)_effectiveMenuRepresentation
{
  UIMenuElement *menuRepresentation;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  menuRepresentation = self->_menuRepresentation;
  if (menuRepresentation)
    return menuRepresentation;
  if (-[UIBarButtonItem isCustomViewItem](self, "isCustomViewItem")
    || -[UIBarButtonItem isSpaceItem](self, "isSpaceItem"))
  {
    return (UIMenuElement *)0;
  }
  v12 = 0;
  v13 = 0;
  -[UIBarButtonItem _getMenuTitle:image:](self, "_getMenuTitle:image:", &v13, &v12);
  if (self->_menu)
  {
    if (-[UIBarButtonItem isEnabled](self, "isEnabled"))
    {
      -[UIMenu children](self->_menu, "children");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[UIBarButtonItem _menuIsPrimary](self, "_menuIsPrimary"))
      {
        _proxyAction(self, (uint64_t)v13, (uint64_t)v12);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v5);
        v8 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v8;
      }
      +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", v13, v12, 0, 0, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
    _proxyAction(self, (uint64_t)v13, (uint64_t)v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    v10 = 1;
  }
  else
  {
    _proxyAction(self, (uint64_t)v13, (uint64_t)v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setState:", -[UIBarButtonItem isSelected](self, "isSelected"));
    v10 = -[UIBarButtonItem isEnabled](self, "isEnabled") ^ 1;
    v11 = v9;
  }
  objc_msgSend(v11, "setAttributes:", v10);
LABEL_14:

  return (UIMenuElement *)v9;
}

- (BOOL)_canProduceNSToolbarItem
{
  if (self->_hidden)
    return 0;
  else
    return !-[UIBarButtonItem isSpaceItem](self, "isSpaceItem");
}

- (id)_primaryNSToolbarItemForIdentifier:(id)a3
{
  void *v6;

  if (!objc_msgSend(a3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIBarButtonItem.m"), 934, CFSTR("Must provide an identifier"));

  }
  return 0;
}

- (id)_secondaryNSToolbarItemForIdentifier:(id)a3
{
  void *v6;

  if (!objc_msgSend(a3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIBarButtonItem.m"), 961, CFSTR("Must provide an identifier"));

  }
  return 0;
}

- (id)_NSToolbarSourceItem
{
  return 0;
}

- (UIBarButtonItemGroup)creatingFixedGroup
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBarButtonItemGroup fixedGroupWithRepresentativeItem:items:](UIBarButtonItemGroup, "fixedGroupWithRepresentativeItem:items:", 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBarButtonItemGroup *)v3;
}

- (UIBarButtonItemGroup)creatingMovableGroupWithCustomizationIdentifier:(NSString *)customizationIdentifier
{
  void *v3;
  NSString *v4;
  void *v5;
  void *v6;
  UIBarButtonItem *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = self;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = customizationIdentifier;
  objc_msgSend(v3, "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBarButtonItemGroup movableGroupWithCustomizationIdentifier:representativeItem:items:](UIBarButtonItemGroup, "movableGroupWithCustomizationIdentifier:representativeItem:items:", v4, 0, v5, v8, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBarButtonItemGroup *)v6;
}

- (UIBarButtonItemGroup)creatingOptionalGroupWithCustomizationIdentifier:(NSString *)customizationIdentifier inDefaultCustomization:(BOOL)inDefaultCustomization
{
  _BOOL8 v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  UIBarButtonItem *v10;
  uint64_t v11;

  v4 = inDefaultCustomization;
  v11 = *MEMORY[0x1E0C80C00];
  v10 = self;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = customizationIdentifier;
  objc_msgSend(v5, "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBarButtonItemGroup optionalGroupWithCustomizationIdentifier:inDefaultCustomization:representativeItem:items:](UIBarButtonItemGroup, "optionalGroupWithCustomizationIdentifier:inDefaultCustomization:representativeItem:items:", v6, v4, 0, v7, v10, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBarButtonItemGroup *)v8;
}

- (id)_dci_creatingGroupWithCustomizationIdentifier:(id)a3
{
  return -[UIBarButtonItem creatingOptionalGroupWithCustomizationIdentifier:inDefaultCustomization:](self, "creatingOptionalGroupWithCustomizationIdentifier:inDefaultCustomization:", a3, 1);
}

- (id)_dci_creatingOptionalGroupWithCustomizationIdentifier:(id)a3
{
  return -[UIBarButtonItem creatingOptionalGroupWithCustomizationIdentifier:inDefaultCustomization:](self, "creatingOptionalGroupWithCustomizationIdentifier:inDefaultCustomization:", a3, 0);
}

- (id)_itemForPresenting
{
  id WeakRetained;
  void *v4;
  void *v5;
  UIBarButtonItem *v6;
  id v7;
  uint64_t v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_buttonGroup);
  -[UIBarButtonItem view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_10;
  if (!self->_groupRepresentative && objc_msgSend(WeakRetained, "isDisplayingRepresentativeItem"))
  {
    objc_msgSend(WeakRetained, "representativeItem");
    v6 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v9 = v6;
    goto LABEL_12;
  }
  v7 = objc_loadWeakRetained((id *)&self->__viewOwner);
  if (!v7
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v7, "_overflowFallbackItem"), (v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_10:
    v6 = self;
    goto LABEL_11;
  }
  v9 = (void *)v8;

LABEL_12:
  return v9;
}

- (UIView)_viewForPresenting
{
  id *v2;
  UIView *v3;

  -[UIBarButtonItem _itemForPresenting](self, "_itemForPresenting");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = (UIView *)v2[23];

  return v3;
}

- (CGRect)_rectForPresenting
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
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
  CGRect result;

  -[UIBarButtonItem _itemForPresenting](self, "_itemForPresenting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem _viewForPresenting](self, "_viewForPresenting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visualProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "bounds");
    objc_msgSend(v9, "convertRect:toView:", v4);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

  }
  else
  {
    objc_msgSend(v4, "bounds");
    v11 = v18;
    v13 = v19;
    v15 = v20;
    v17 = v21;
  }

  v22 = v11;
  v23 = v13;
  v24 = v15;
  v25 = v17;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (NSSet)_possibleItemVariations
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  UIBarButtonItem *v10;
  uint64_t v11;
  UIBarButtonItem *v12;
  NSSet *obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) != 0 || !-[NSSet count](self->_possibleTitles, "count"))
  {
    v3 = 0;
  }
  else
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSSet count](self->_possibleTitles, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    obj = self->_possibleTitles;
    v4 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          -[NSDictionary objectForKey:](self->_stylesForSizingTitles, "objectForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = [UIBarButtonItem alloc];
          if (v9)
            v11 = objc_msgSend(v9, "integerValue");
          else
            v11 = 0;
          v12 = -[UIBarButtonItem initWithTitle:style:target:action:](v10, "initWithTitle:style:target:action:", v8, v11, 0, 0);
          objc_msgSend(v3, "addObject:", v12);

        }
        v5 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v5);
    }

  }
  return (NSSet *)v3;
}

- (void)_setItemVariation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) == 0)
  {
    v4 = a3;
    objc_msgSend(v4, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](self, "setTitle:", v5);

    v6 = objc_msgSend(v4, "style");
    -[UIBarButtonItem setStyle:](self, "setStyle:", v6);
  }
}

- (id)itemVariation
{
  UIBarButtonItem *v3;
  void *v4;
  UIBarButtonItem *v5;

  if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) != 0)
  {
    v5 = 0;
  }
  else
  {
    v3 = [UIBarButtonItem alloc];
    -[UIBarButtonItem title](self, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[UIBarButtonItem initWithTitle:style:target:action:](v3, "initWithTitle:style:target:action:", v4, -[UIBarButtonItem style](self, "style"), 0, 0);

  }
  return v5;
}

- (NSSet)possibleTitles
{
  return self->_possibleTitles;
}

void __29__UIBarButtonItem_setTarget___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_0;
  if (!_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_0)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_0);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "You are trying to set a deallocating object as a delegate. This will be a hard crash in the future. Offending object: %@ hostObject: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_setSystemItem:(int64_t)a3
{
  unint64_t barButtonItemFlags;
  NSSet *possibleSystemItems;
  void *v7;
  void *v8;
  char CanBeSet;
  void *v10;
  id WeakRetained;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;

  barButtonItemFlags = self->_barButtonItemFlags;
  if ((barButtonItemFlags & 0x10) == 0 || ((barButtonItemFlags >> 5) & 0x7F) != a3)
  {
    possibleSystemItems = self->_possibleSystemItems;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(possibleSystemItems) = -[NSSet containsObject:](possibleSystemItems, "containsObject:", v7);

    if ((possibleSystemItems & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("System item (%ld) is not listed in possible system items"), a3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CanBeSet = BarButtonItemSystemItemCanBeSet(v8);

    if ((CanBeSet & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("System item (%ld) is not a supported system item"), a3);
    self->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFFFF00F | (32 * (a3 & 0x7F)) | 0x10);
    v24 = 0u;
    v25 = 0u;
    -[UIView superview](self->_view, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->__owningNavigationItem);
      objc_msgSend(WeakRetained, "_navigationBar");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "barStyle");
      v23 = 0;
      LOWORD(v20) = objc_msgSend(v12, "isMinibar");
      -[UIBarButtonItem _getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:](self, "_getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:", 0, 0, &v23, 0, 0, v13, v20);
      v14 = v23;
      -[UIBarButtonItem _getNavBarEdgeSizeAdjust:imageInsets:landscape:](self, "_getNavBarEdgeSizeAdjust:imageInsets:landscape:", 0, &v24, objc_msgSend(v12, "isMinibar"));
      if (objc_msgSend(v12, "isMinibar"))
      {
        if ((*(_DWORD *)&self->_barButtonItemFlags & 0xFE0) == 0x1A0)
          *(double *)&v24 = *(double *)&v24 + 2.0;
      }
      -[UIBarButtonItem view](self, "view");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setImageEdgeInsets:", v24, v25);
      objc_msgSend(v15, "setImage:forStates:", v14, 0);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_21:

        return;
      }
      v12 = v10;
      v16 = objc_msgSend(v12, "barStyle");
      v21 = 0;
      v22 = 0;
      LOWORD(v20) = objc_msgSend(v12, "isMinibar");
      -[UIBarButtonItem _getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:](self, "_getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:", 0, 0, &v22, &v21, 0, v16, v20);
      v14 = v22;
      v15 = v21;
      -[UIBarButtonItem _getToolbarSystemItemEdgeInsetsWithImageInsets:forBarStyle:landscape:alwaysBordered:](self, "_getToolbarSystemItemEdgeInsetsWithImageInsets:forBarStyle:landscape:alwaysBordered:", &v24, v16, objc_msgSend(v12, "isMinibar"), 0);
      if (v14)
      {
        -[UIBarButtonItem view](self, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_info");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = v18;
          objc_msgSend(v19, "setImage:forState:", v14, 0);
          if (v15)
            objc_msgSend(v19, "setImage:forState:", v15, 1);

        }
        else
        {
          objc_msgSend(v18, "setImage:", v14);
        }

      }
    }

    goto LABEL_21;
  }
}

- (void)_setPossibleSystemItems:(id)a3
{
  id v4;
  $3665B5265F98EA8C853F20A3FDC87915 barButtonItemFlags;
  uint64_t *v6;
  void *v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSSet *v16;
  NSSet *possibleSystemItems;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  barButtonItemFlags = self->_barButtonItemFlags;
  v6 = (uint64_t *)MEMORY[0x1E0C99750];
  if ((*(_BYTE *)&barButtonItemFlags & 0x10) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Button item is not a system item"));
    barButtonItemFlags = self->_barButtonItemFlags;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (*(unsigned int *)&barButtonItemFlags >> 5) & 0x7F);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "containsObject:", v7);

  if ((v8 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v6, CFSTR("Current system item (%ld) is not listed as a possible system item"), ((unint64_t)self->_barButtonItemFlags >> 5) & 0x7F);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    v13 = *v6;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((BarButtonItemSystemItemCanBeSet(v15) & 1) == 0)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v13, CFSTR("System item (%ld) is unsupported as a settable system item"), objc_msgSend(v15, "integerValue"));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  if (!-[NSSet isEqualToSet:](self->_possibleSystemItems, "isEqualToSet:", v9))
  {
    v16 = (NSSet *)objc_msgSend(v9, "copy");
    possibleSystemItems = self->_possibleSystemItems;
    self->_possibleSystemItems = v16;

    -[UIBarButtonItem _updateView](self, "_updateView");
  }

}

- (NSSet)_possibleSystemItems
{
  return self->_possibleSystemItems;
}

- (id)_appearanceStorage
{
  return self->_appearanceStorage;
}

- (void)setBackButtonBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics
{
  UIImage *v9;
  _UIBarButtonItemAppearanceStorage *v10;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint8_t buf[4];
  UIControlState v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = backgroundImage;
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    if (!self->_appearanceStorage)
    {
      v10 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      appearanceStorage = self->_appearanceStorage;
      self->_appearanceStorage = v10;

    }
    if (state > 8 || ((1 << state) & 0x107) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          v21 = state;
          _os_log_fault_impl(&dword_185066000, v19, OS_LOG_TYPE_FAULT, "back button background image only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", buf, 0xCu);
        }

      }
      else
      {
        v17 = qword_1ECD79AA8;
        if (!qword_1ECD79AA8)
        {
          v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v17, (unint64_t *)&qword_1ECD79AA8);
        }
        v18 = *(NSObject **)(v17 + 8);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v21 = state;
          _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "back button background image only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", buf, 0xCu);
        }
      }
    }
    if ((state & 0xFFFFFFFFFFFFFFFDLL) != 0 && state != 8)
      state = 1;
    v13 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", state);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", barMetrics);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayWithObjects:", v14, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _UIAppearanceTagObjectForSelector(self, a2, v16);

    -[_UIBarButtonItemAppearanceStorage setBackButtonBackgroundImage:forState:isMini:](self->_appearanceStorage, "setBackButtonBackgroundImage:forState:isMini:", v9, state, barMetrics == UIBarMetricsCompact);
  }
  else if ((byte_1ECD79A92 & 1) == 0)
  {
    byte_1ECD79A92 = 1;
    NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), "UIBarButtonItem", CFSTR("back button background image"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
  }

}

- (void)setBackgroundVerticalPositionAdjustment:(CGFloat)adjustment forBarMetrics:(UIBarMetrics)barMetrics
{
  _UIBarButtonItemAppearanceStorage *v8;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  void *v10;
  void *v11;
  void *v12;
  double v13;

  if (!self->_appearanceStorage)
  {
    v8 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
    appearanceStorage = self->_appearanceStorage;
    self->_appearanceStorage = v8;

  }
  v10 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", barMetrics);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _UIAppearanceTagObjectForSelector(self, a2, v12);

  -[_UIBarButtonItemAppearanceStorage backgroundVerticalAdjustmentForBarMetrics:](self->_appearanceStorage, "backgroundVerticalAdjustmentForBarMetrics:", barMetrics);
  if (v13 != adjustment)
  {
    -[_UIBarButtonItemAppearanceStorage setBackgroundVerticalAdjustment:forBarMetrics:](self->_appearanceStorage, "setBackgroundVerticalAdjustment:forBarMetrics:", barMetrics, adjustment);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIBarButtonItem _applyPositionAdjustmentToSegmentedControl:](self, "_applyPositionAdjustmentToSegmentedControl:", self->_view);
    -[UIBarButtonItem _updateView](self, "_updateView");
  }
}

- (void)setTitlePositionAdjustment:(UIOffset)adjustment forBarMetrics:(UIBarMetrics)barMetrics
{
  double vertical;
  double horizontal;
  _UIBarButtonItemAppearanceStorage *v9;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  void *v11;
  void *v12;
  void *v13;
  _UIBarButtonItemAppearanceStorage *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  _UIBarButtonItemAppearanceStorage *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];

  if ((unint64_t)(barMetrics - 101) > 1)
  {
    vertical = adjustment.vertical;
    horizontal = adjustment.horizontal;
    if (!self->_appearanceStorage)
    {
      v9 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      appearanceStorage = self->_appearanceStorage;
      self->_appearanceStorage = v9;

    }
    v11 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", barMetrics);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayWithObject:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _UIAppearanceTagObjectForSelector(self, a2, v13);

    v14 = self->_appearanceStorage;
    if (barMetrics == UIBarMetricsCompact)
      -[_UIBarButtonItemAppearanceStorage miniTitlePositionOffset](v14, "miniTitlePositionOffset");
    else
      -[_UIBarButtonItemAppearanceStorage titlePositionOffset](v14, "titlePositionOffset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "UIOffsetValue");
    }
    else
    {
      v17 = 0.0;
      v18 = 0.0;
    }
    if (horizontal != v17 || vertical != v18)
    {
      v19 = self->_appearanceStorage;
      if (barMetrics == UIBarMetricsCompact)
      {
        *(double *)v22 = horizontal;
        *(double *)&v22[1] = vertical;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v22, "{UIOffset=dd}");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIBarButtonItemAppearanceStorage setMiniTitlePositionOffset:](v19, "setMiniTitlePositionOffset:", v20);
      }
      else
      {
        *(double *)v21 = horizontal;
        *(double *)&v21[1] = vertical;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v21, "{UIOffset=dd}");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIBarButtonItemAppearanceStorage setTitlePositionOffset:](v19, "setTitlePositionOffset:", v20);
      }

      -[UIBarButtonItem _updateView](self, "_updateView");
    }

  }
  else if ((setTitlePositionAdjustment_forBarMetrics__didWarn & 1) == 0)
  {
    setTitlePositionAdjustment_forBarMetrics__didWarn = 1;
    NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, adjustment.horizontal, adjustment.vertical, "UIBarButtonItem", CFSTR("title position adjustment"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
  }
}

- (void)setBackButtonBackgroundVerticalPositionAdjustment:(CGFloat)adjustment forBarMetrics:(UIBarMetrics)barMetrics
{
  _UIBarButtonItemAppearanceStorage *v8;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  void *v10;
  void *v11;
  void *v12;
  double v13;

  if (!self->_appearanceStorage)
  {
    v8 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
    appearanceStorage = self->_appearanceStorage;
    self->_appearanceStorage = v8;

  }
  v10 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", barMetrics);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _UIAppearanceTagObjectForSelector(self, a2, v12);

  -[_UIBarButtonItemAppearanceStorage backButtonBackgroundVerticalAdjustmentForBarMetrics:](self->_appearanceStorage, "backButtonBackgroundVerticalAdjustmentForBarMetrics:", barMetrics);
  if (v13 != adjustment)
    -[_UIBarButtonItemAppearanceStorage setBackButtonBackgroundVerticalAdjustment:forBarMetrics:](self->_appearanceStorage, "setBackButtonBackgroundVerticalAdjustment:forBarMetrics:", barMetrics, adjustment);
}

- (void)setBackButtonTitlePositionAdjustment:(UIOffset)adjustment forBarMetrics:(UIBarMetrics)barMetrics
{
  double vertical;
  double horizontal;
  _UIBarButtonItemAppearanceStorage *v9;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  void *v11;
  void *v12;
  void *v13;
  _UIBarButtonItemAppearanceStorage *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  _UIBarButtonItemAppearanceStorage *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];

  if ((unint64_t)(barMetrics - 101) > 1)
  {
    vertical = adjustment.vertical;
    horizontal = adjustment.horizontal;
    if (!self->_appearanceStorage)
    {
      v9 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      appearanceStorage = self->_appearanceStorage;
      self->_appearanceStorage = v9;

    }
    v11 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", barMetrics);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayWithObject:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _UIAppearanceTagObjectForSelector(self, a2, v13);

    v14 = self->_appearanceStorage;
    if (barMetrics == UIBarMetricsCompact)
      -[_UIBarButtonItemAppearanceStorage miniTitlePositionOffset](v14, "miniTitlePositionOffset");
    else
      -[_UIBarButtonItemAppearanceStorage titlePositionOffset](v14, "titlePositionOffset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "UIOffsetValue");
    }
    else
    {
      v17 = 0.0;
      v18 = 0.0;
    }
    if (horizontal != v17 || vertical != v18)
    {
      v19 = self->_appearanceStorage;
      if (barMetrics == UIBarMetricsCompact)
      {
        *(double *)v22 = horizontal;
        *(double *)&v22[1] = vertical;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v22, "{UIOffset=dd}");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIBarButtonItemAppearanceStorage setMiniBackButtonTitlePositionOffset:](v19, "setMiniBackButtonTitlePositionOffset:", v20);
      }
      else
      {
        *(double *)v21 = horizontal;
        *(double *)&v21[1] = vertical;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v21, "{UIOffset=dd}");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIBarButtonItemAppearanceStorage setBackButtonTitlePositionOffset:](v19, "setBackButtonTitlePositionOffset:", v20);
      }

    }
  }
  else if ((setBackButtonTitlePositionAdjustment_forBarMetrics__didWarn & 1) == 0)
  {
    setBackButtonTitlePositionAdjustment_forBarMetrics__didWarn = 1;
    NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, adjustment.horizontal, adjustment.vertical, "UIBarButtonItem", CFSTR("back button title position adjustment"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
  }
}

- (UIOffset)backButtonTitlePositionAdjustmentForBarMetrics:(UIBarMetrics)barMetrics
{
  double v3;
  double v4;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIOffset result;

  if ((unint64_t)(barMetrics - 101) > 1)
  {
    appearanceStorage = self->_appearanceStorage;
    if (barMetrics == UIBarMetricsCompact)
      -[_UIBarButtonItemAppearanceStorage miniBackButtonTitlePositionOffset](appearanceStorage, "miniBackButtonTitlePositionOffset");
    else
      -[_UIBarButtonItemAppearanceStorage backButtonTitlePositionOffset](appearanceStorage, "backButtonTitlePositionOffset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "UIOffsetValue");
      v3 = v8;
      v4 = v9;
    }
    else
    {
      v3 = 0.0;
      v4 = 0.0;
    }

  }
  else
  {
    v3 = 0.0;
    if ((backButtonTitlePositionAdjustmentForBarMetrics__didWarn & 1) == 0)
    {
      backButtonTitlePositionAdjustmentForBarMetrics__didWarn = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, "UIBarButtonItem", CFSTR("back button title position adjustment"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    v4 = 0.0;
  }
  v10 = v3;
  v11 = v4;
  result.vertical = v11;
  result.horizontal = v10;
  return result;
}

- (void)_applyPositionAdjustmentToSegmentedControl:(id)a3
{
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  id v5;

  appearanceStorage = self->_appearanceStorage;
  v5 = a3;
  -[_UIBarButtonItemAppearanceStorage backgroundVerticalAdjustmentForBarMetrics:](appearanceStorage, "backgroundVerticalAdjustmentForBarMetrics:", 0);
  objc_msgSend(v5, "_setBackgroundVerticalPositionAdjustment:forBarMetrics:", 0);
  -[_UIBarButtonItemAppearanceStorage backgroundVerticalAdjustmentForBarMetrics:](self->_appearanceStorage, "backgroundVerticalAdjustmentForBarMetrics:", 1);
  objc_msgSend(v5, "_setBackgroundVerticalPositionAdjustment:forBarMetrics:", 1);
  -[_UIBarButtonItemAppearanceStorage backgroundVerticalAdjustmentForBarMetrics:](self->_appearanceStorage, "backgroundVerticalAdjustmentForBarMetrics:", 101);
  objc_msgSend(v5, "_setBackgroundVerticalPositionAdjustment:forBarMetrics:", 101);
  -[_UIBarButtonItemAppearanceStorage backgroundVerticalAdjustmentForBarMetrics:](self->_appearanceStorage, "backgroundVerticalAdjustmentForBarMetrics:", 102);
  objc_msgSend(v5, "_setBackgroundVerticalPositionAdjustment:forBarMetrics:", 102);

}

- (double)_toolbarCharge
{
  return -0.15;
}

- (UIToolbarButton)_toolbarButton
{
  UIView *view;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    view = self->_view;
  else
    view = 0;
  return (UIToolbarButton *)view;
}

- (void)_setImageHasEffects:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFFBFFFF | v3);
}

- (BOOL)_imageHasEffects
{
  return (*((unsigned __int8 *)&self->_barButtonItemFlags + 2) >> 2) & 1;
}

- (void)_setEnclosingBar:(id)a3 onItem:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "_setEnclosingBar:", v6);

}

- (id)createViewForToolbar:(id)a3
{
  id v4;
  uint64_t v5;
  UIToolbarTextButton *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSSet *possibleSystemItems;
  void *v13;
  UIToolbarTextButton *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  UIImage *landscapeImagePhone;
  UIImage *v22;
  UIToolbarTextButton *v23;
  void *v24;
  UIBarButtonItemStyle v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  UIToolbarButton *v35;
  void *v36;
  UIBarButtonItemStyle v37;
  void *v38;
  void *v39;
  char v40;
  double width;
  double v42;
  double v43;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  void *v45;
  void *v46;
  double minimumWidth;
  double maximumWidth;
  _BOOL8 v49;
  NSArray *gestureRecognizers;
  NSArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "barStyle");
  if (v5 == 1 && (objc_msgSend(v4, "isTranslucent") & 1) != 0)
    v61 = 2;
  else
    v61 = v5;
  if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) != 0)
  {
    v72 = 0;
    v70 = 0u;
    v71 = 0u;
    v68 = 0;
    v69 = 0;
    v66 = 0;
    v67 = 0;
    LOWORD(v57) = objc_msgSend(v4, "isMinibar");
    -[UIBarButtonItem _getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:](self, "_getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:", &v69, &v68, &v67, &v66, &v72, v5, v57);
    v7 = v68;
    v8 = v67;
    v9 = v66;
    -[UIBarButtonItem _getToolbarSystemItemEdgeInsetsWithImageInsets:forBarStyle:landscape:alwaysBordered:](self, "_getToolbarSystemItemEdgeInsetsWithImageInsets:forBarStyle:landscape:alwaysBordered:", &v70, v5, objc_msgSend(v4, "isMinibar"), 0);
    if (v8)
    {
      v10 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "classForToolbarButton"));
      v11 = v69;
      possibleSystemItems = self->_possibleSystemItems;
      objc_msgSend(v4, "tintColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v59) = objc_msgSend(v4, "isMinibar");
      LOBYTE(v58) = 0;
      v6 = (UIToolbarTextButton *)objc_msgSend(v10, "initWithImage:pressedImage:label:labelHeight:withBarStyle:withStyle:withInsets:possibleTitles:possibleSystemItems:withToolbarTintColor:bezel:imageInsets:glowInsets:landscape:", v8, v9, v7, v61, v11, 0, 0.0, 0.0, 0.0, 0.0, 0.0, possibleSystemItems, v13, v58, v70, v71,
                                    0,
                                    0,
                                    0,
                                    0,
                                    v59);

      -[UIToolbarButton _setCreatedByBarButtonItem:](v6, "_setCreatedByBarButtonItem:", 1);
    }
    else if (v7)
    {
      v14 = [UIToolbarTextButton alloc];
      v15 = v69;
      objc_msgSend(v4, "tintColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[UIToolbarTextButton initWithTitle:pressedTitle:withFont:withBarStyle:withStyle:withTitleWidth:possibleTitles:withToolbarTintColor:](v14, "initWithTitle:pressedTitle:withFont:withBarStyle:withStyle:withTitleWidth:possibleTitles:withToolbarTintColor:", v7, 0, 0, v61, v15, 0, 0.0, v16);

      -[UIToolbarButton _setCreatedByBarButtonItem:](v6, "_setCreatedByBarButtonItem:", 1);
      -[UIToolbarButton _info](v6, "_info");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_setStylesForSizingTitles:", self->_stylesForSizingTitles);

    }
    else
    {
      v6 = 0;
    }
    if (!-[UIBarButtonItem action](self, "action") && v72)
      -[UIBarButtonItem setAction:](self, "setAction:");

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v18, "toolbar:viewForItem:", v4, self);
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v6 = (UIToolbarTextButton *)v19;
        *(_DWORD *)&self->_barButtonItemFlags |= 0x1000u;
        goto LABEL_33;
      }
    }
    -[UIBarButtonItem image](self, "image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      if (objc_msgSend(v4, "isMinibar"))
      {
        landscapeImagePhone = self->_landscapeImagePhone;
        if (landscapeImagePhone)
        {
          v22 = landscapeImagePhone;
        }
        else
        {
          -[UIBarButtonItem image](self, "image");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "_imageScaledToProportion:interpolationQuality:", 3, 0.75);
          v22 = (UIImage *)objc_claimAutoreleasedReturnValue();

        }
        if (self->_landscapeImagePhone)
        {
          v31 = &OBJC_IVAR___UIBarButtonItem__landscapeImagePhoneInsets;
LABEL_32:
          v32 = (char *)self + *v31;
          v33 = *((_QWORD *)v32 + 3);
          v60 = *(_OWORD *)(v32 + 8);
          v34 = *(_QWORD *)v32;
          v35 = [UIToolbarButton alloc];
          -[UIBarButtonItem title](self, "title");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = -[UIBarButtonItem style](self, "style");
          -[UIBarButtonItem possibleTitles](self, "possibleTitles");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "tintColor");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = !-[UIBarButtonItem _imageHasEffects](self, "_imageHasEffects");
          LOBYTE(v59) = objc_msgSend(v4, "isMinibar");
          LOBYTE(v58) = v40;
          v6 = -[UIToolbarButton initWithImage:pressedImage:label:labelHeight:withBarStyle:withStyle:withInsets:possibleTitles:possibleSystemItems:withToolbarTintColor:bezel:imageInsets:glowInsets:landscape:](v35, "initWithImage:pressedImage:label:labelHeight:withBarStyle:withStyle:withInsets:possibleTitles:possibleSystemItems:withToolbarTintColor:bezel:imageInsets:glowInsets:landscape:", v22, 0, v36, v61, v37, v38, 0.0, 0.0, 0.0, 0.0, 0.0, 0, v39, v58, v34, v60,
                 v33,
                 0,
                 0,
                 0,
                 0,
                 v59);

          -[UIToolbarButton _setCreatedByBarButtonItem:](v6, "_setCreatedByBarButtonItem:", 1);
          goto LABEL_33;
        }
      }
      else
      {
        -[UIBarButtonItem image](self, "image");
        v22 = (UIImage *)objc_claimAutoreleasedReturnValue();
      }
      v31 = &OBJC_IVAR___UIBarButtonItem__imageInsets;
      goto LABEL_32;
    }
    v23 = [UIToolbarTextButton alloc];
    -[UIBarButtonItem title](self, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[UIBarButtonItem style](self, "style");
    -[UIBarButtonItem possibleTitles](self, "possibleTitles");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tintColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIToolbarTextButton initWithTitle:pressedTitle:withFont:withBarStyle:withStyle:withTitleWidth:possibleTitles:withToolbarTintColor:](v23, "initWithTitle:pressedTitle:withFont:withBarStyle:withStyle:withTitleWidth:possibleTitles:withToolbarTintColor:", v24, 0, 0, v61, v25, v26, 0.0, v27);

    -[UIToolbarButton _setCreatedByBarButtonItem:](v6, "_setCreatedByBarButtonItem:", 1);
    -[UIBarButtonItem title](self, "title");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      -[UIToolbarButton _info](v6, "_info");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_setStylesForSizingTitles:", self->_stylesForSizingTitles);

    }
  }
LABEL_33:
  if ((*((_BYTE *)&self->_barButtonItemFlags + 1) & 0x10) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIBarButtonItem _applyPositionAdjustmentToSegmentedControl:](self, "_applyPositionAdjustmentToSegmentedControl:", v6);
  }
  else
  {
    -[UIToolbarButton _setAppearanceGuideClass:](v6, "_setAppearanceGuideClass:", objc_opt_class());
    width = self->_width;
    if (width != 0.0)
    {
      *(float *)&width = width;
      -[UIToolbarButton _setInfoWidth:](v6, "_setInfoWidth:", width);
    }
    objc_msgSend(v4, "bounds");
    *(float *)&v43 = v42;
    -[UIToolbarButton _setBarHeight:](v6, "_setBarHeight:", v43);
    if ((*(_BYTE *)&self->_barButtonItemFlags & 0x10) == 0)
    {
      appearanceStorage = self->_appearanceStorage;
      objc_getAssociatedObject(self, &_UIAppearanceCustomizedSelectorsAssociationKey);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIToolbarButton _applyBarButtonAppearanceStorage:withTaggedSelectors:](v6, "_applyBarButtonAppearanceStorage:withTaggedSelectors:", appearanceStorage, v45);

    }
    -[UIToolbarButton _info](v6, "_info");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem _setEnclosingBar:onItem:](self, "_setEnclosingBar:onItem:", v4, v46);

  }
  if (self->_width <= 0.0)
  {
    minimumWidth = self->_minimumWidth;
    maximumWidth = minimumWidth;
    if (minimumWidth > 0.0 || (maximumWidth = self->_maximumWidth, maximumWidth > 0.0))
    {
      v49 = minimumWidth > 0.0;
      *(float *)&minimumWidth = maximumWidth;
      -[UIToolbarButton _setInfoExtremityWidth:isMin:](v6, "_setInfoExtremityWidth:isMin:", v49, minimumWidth);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIControl addTarget:action:forEvents:](v6, "addTarget:action:forEvents:", self, sel__sendAction_withEvent_, 0x2000);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIToolbarButton setEnabled:](v6, "setEnabled:", -[UIBarButtonItem isEnabled](self, "isEnabled"));
  if (self->_flexible && (*(_DWORD *)&self->_barButtonItemFlags & 0x100E) == 2)
    -[UIToolbarButton _setInfoFlexibleWidth:](v6, "_setInfoFlexibleWidth:", 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIToolbarButton setUseSelectedImage:](v6, "setUseSelectedImage:", (*(_DWORD *)&self->_barButtonItemFlags >> 15) & 1);
  gestureRecognizers = self->_gestureRecognizers;
  if (gestureRecognizers)
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v51 = gestureRecognizers;
    v52 = -[NSArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v53; ++i)
        {
          if (*(_QWORD *)v63 != v54)
            objc_enumerationMutation(v51);
          -[UIView addGestureRecognizer:](v6, "addGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i));
        }
        v53 = -[NSArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
      }
      while (v53);
    }

  }
  return v6;
}

- (void)_setInteractions:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *v6;
  char v7;
  NSArray *v8;
  id WeakRetained;
  NSArray *v10;
  NSArray *interactions;
  NSArray *v12;

  v4 = a3;
  v5 = self->_interactions;
  v6 = (NSArray *)v4;
  v12 = v6;
  if (v5 == v6)
  {

    WeakRetained = v12;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSArray isEqual:](v5, "isEqual:", v6);

      v8 = v12;
      if ((v7 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

      v8 = v12;
    }
    v10 = (NSArray *)-[NSArray copy](v8, "copy");
    interactions = self->_interactions;
    self->_interactions = v10;

    WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    objc_msgSend(WeakRetained, "_itemStandardViewNeedsUpdate:", self);
  }

  v8 = v12;
LABEL_10:

}

- (void)setPreferredMenuElementOrder:(UIContextMenuConfigurationElementOrder)preferredMenuElementOrder
{
  void *v4;
  id WeakRetained;

  if (self->_preferredMenuElementOrder != preferredMenuElementOrder)
  {
    self->_preferredMenuElementOrder = preferredMenuElementOrder;
    WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIBarButtonItem menu](self, "menu");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_itemDidUpdateMenu:fromMenu:", self, v4);

    }
  }
}

- (void)forcedSelectionOfMenu:(id)a3 willChangeTo:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTitle:](self, "setTitle:", v6);

  objc_msgSend(v5, "image");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[UIBarButtonItem setImage:](self, "setImage:", v7);
}

- (void)setChangesSelectionAsPrimaryAction:(BOOL)changesSelectionAsPrimaryAction
{
  $3665B5265F98EA8C853F20A3FDC87915 barButtonItemFlags;
  int v4;

  barButtonItemFlags = self->_barButtonItemFlags;
  if (((((*(_DWORD *)&barButtonItemFlags & 0x800000) == 0) ^ changesSelectionAsPrimaryAction) & 1) == 0)
  {
    if (changesSelectionAsPrimaryAction)
      v4 = 0x800000;
    else
      v4 = 0;
    self->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&barButtonItemFlags & 0xFF7FFFFF | v4);
    -[UIBarButtonItem _updateForAutomaticSelection](self, "_updateForAutomaticSelection");
  }
}

- (BOOL)changesSelectionAsPrimaryAction
{
  return *((unsigned __int8 *)&self->_barButtonItemFlags + 2) >> 7;
}

- (id)window
{
  return -[UIView window](self->_view, "window");
}

- (id)nextResponder
{
  return -[UIView nextResponder](self->_view, "nextResponder");
}

- (BOOL)isMinibarView
{
  return (*((unsigned __int8 *)&self->_barButtonItemFlags + 1) >> 5) & 1;
}

- (void)_sendAction:(id)a3 withEvent:(id)a4
{
  void *v5;
  const char *v6;
  void *v7;
  id v8;

  v8 = a4;
  if (-[UIBarButtonItem action](self, "action"))
  {
    v5 = (void *)UIApp;
    v6 = -[UIBarButtonItem action](self, "action");
    -[UIBarButtonItem target](self, "target");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendAction:to:from:forEvent:", v6, v7, self, v8);

  }
}

- (BOOL)hasTitle
{
  void *v2;
  BOOL v3;

  -[UIBarButtonItem resolvedTitle](self, "resolvedTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_resolvedImage
{
  return -[UIBarButtonItem _imageForState:compact:type:](self, "_imageForState:compact:type:", 0, 0, 0);
}

- (void)_deferSymbolEffectOperation:(int64_t)a3 effect:(id)a4 options:(id)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a6;
  v15 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithObject:forKey:", v12, CFSTR("operation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("symbolEffect"));
  if (v10)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, CFSTR("options"));
  if (v6)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("animated"));
  -[UIBarButtonItem _deferredEffectsCreateIfNecessary:](self, "_deferredEffectsCreateIfNecessary:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v13);

}

- (void)setSymbolAnimationEnabled:(BOOL)symbolAnimationEnabled
{
  int v4;
  id WeakRetained;

  if (symbolAnimationEnabled)
    v4 = 0x1000000;
  else
    v4 = 0;
  self->_barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFEFFFFFF | v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
  objc_msgSend(WeakRetained, "_itemStandardViewNeedsUpdate:", self);

}

- (BOOL)_isFloatable
{
  return 0;
}

- (BOOL)_isFloating
{
  return 0;
}

- (UIView)_configuredFloatableView
{
  return 0;
}

- (UIView)_referenceView
{
  return 0;
}

- (NSString)_largeContentSizeTitle
{
  return (NSString *)objc_getAssociatedObject(self, &_largeContentSizeTitleKey);
}

- (NSString)_resolvedLargeContentSizeTitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[UIBarButtonItem _largeContentSizeTitle](self, "_largeContentSizeTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    -[UIBarButtonItem resolvedTitle](self, "resolvedTitle");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {

    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect
{
  void *v4;
  NSSymbolEffect *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CE86E8];
  v5 = symbolEffect;
  objc_msgSend(v4, "options");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem addSymbolEffect:options:](self, "addSymbolEffect:options:", v5, v6);

}

- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options
{
  -[UIBarButtonItem addSymbolEffect:options:animated:](self, "addSymbolEffect:options:animated:", symbolEffect, options, 1);
}

- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options animated:(BOOL)animated
{
  _BOOL8 v5;
  NSSymbolEffectOptions *v9;
  void *v10;
  void *WeakRetained;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  NSSymbolEffect *v16;

  v5 = animated;
  v16 = symbolEffect;
  v9 = options;
  if ((*((_BYTE *)&self->_barButtonItemFlags + 1) & 0x10) == 0)
  {
    if (!-[NSSymbolEffect ui_isSupportedByBarButtonItem](v16, "ui_isSupportedByBarButtonItem"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIBarButtonItem.m"), 2407, CFSTR("Unsupported symbol effect added to UIBarButtonItem."));

    }
    if (v16)
    {
      objc_opt_self();
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (-[UIBarButtonItem image](self, "image"), (v12 = objc_claimAutoreleasedReturnValue()) == 0))
      {
LABEL_11:

        goto LABEL_12;
      }
      v13 = (void *)v12;
      -[UIBarButtonItem image](self, "image");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isSymbolImage");

      if (v15)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
        if ((objc_opt_respondsToSelector() & 1) == 0
          || objc_msgSend(WeakRetained, "_item:addSymbolEffect:options:animated:", self, v16, v9, v5))
        {
          -[UIBarButtonItem _deferSymbolEffectOperation:effect:options:animated:](self, "_deferSymbolEffectOperation:effect:options:animated:", 0, v16, v9, v5);
        }
        goto LABEL_11;
      }
    }
  }
LABEL_12:

}

- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect
{
  void *v4;
  NSSymbolEffect *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CE86E8];
  v5 = symbolEffect;
  objc_msgSend(v4, "options");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem removeSymbolEffectOfType:options:](self, "removeSymbolEffectOfType:options:", v5, v6);

}

- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options
{
  -[UIBarButtonItem removeSymbolEffectOfType:options:animated:](self, "removeSymbolEffectOfType:options:animated:", symbolEffect, options, 1);
}

- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options animated:(BOOL)animated
{
  _BOOL8 v5;
  NSSymbolEffectOptions *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  id WeakRetained;
  NSSymbolEffect *v14;

  v5 = animated;
  v14 = symbolEffect;
  v9 = options;
  if ((*((_BYTE *)&self->_barButtonItemFlags + 1) & 0x10) == 0)
  {
    if (!-[NSSymbolEffect ui_isSupportedByBarButtonItem](v14, "ui_isSupportedByBarButtonItem"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIBarButtonItem.m"), 2443, CFSTR("Unsupported symbol effect removed from UIBarButtonItem."));

    }
    if (v14)
    {
      objc_opt_self();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
        if ((objc_opt_respondsToSelector() & 1) == 0
          || objc_msgSend(WeakRetained, "_item:removeSymbolEffectOfType:options:animated:", self, v14, v9, v5))
        {
          -[UIBarButtonItem _deferSymbolEffectOperation:effect:options:animated:](self, "_deferSymbolEffectOperation:effect:options:animated:", 1, v14, v9, v5);
        }

      }
    }
  }

}

- (void)removeAllSymbolEffects
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CE86E8], "options");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem removeAllSymbolEffectsWithOptions:](self, "removeAllSymbolEffectsWithOptions:", v3);

}

- (void)removeAllSymbolEffectsWithOptions:(NSSymbolEffectOptions *)options
{
  -[UIBarButtonItem removeAllSymbolEffectsWithOptions:animated:](self, "removeAllSymbolEffectsWithOptions:animated:", options, 1);
}

- (void)removeAllSymbolEffectsWithOptions:(NSSymbolEffectOptions *)options animated:(BOOL)animated
{
  _BOOL8 v4;
  NSSymbolEffectOptions *v6;
  id WeakRetained;
  NSSymbolEffectOptions *v8;

  v4 = animated;
  v6 = options;
  if ((*((_BYTE *)&self->_barButtonItemFlags + 1) & 0x10) == 0)
  {
    v8 = v6;
    WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || objc_msgSend(WeakRetained, "_item:removeAllSymbolEffectsWithOptions:animated:", self, v8, v4))
    {
      -[UIBarButtonItem _deferSymbolEffectOperation:effect:options:animated:](self, "_deferSymbolEffectOperation:effect:options:animated:", 2, 0, v8, v4);
    }

    v6 = v8;
  }

}

- (void)setSymbolImage:(UIImage *)symbolImage withContentTransition:(NSSymbolContentTransition *)transition
{
  void *v6;
  NSSymbolContentTransition *v7;
  UIImage *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CE86E8];
  v7 = transition;
  v8 = symbolImage;
  objc_msgSend(v6, "options");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setSymbolImage:withContentTransition:options:](self, "setSymbolImage:withContentTransition:options:", v8, v7, v9);

}

- (void)setSymbolImage:(UIImage *)symbolImage withContentTransition:(NSSymbolContentTransition *)transition options:(NSSymbolEffectOptions *)options
{
  NSSymbolContentTransition *v10;
  NSSymbolEffectOptions *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  UIImage *v18;
  UIImage *v19;
  UIImage *v20;
  BOOL v21;
  id WeakRetained;
  UIImage *v23;

  v23 = symbolImage;
  v10 = transition;
  v11 = options;
  if ((*(_WORD *)&self->_barButtonItemFlags & 0x1010) != 0)
    goto LABEL_18;
  if (!-[NSSymbolContentTransition ui_isSupportedByBarButtonItem](v10, "ui_isSupportedByBarButtonItem"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIBarButtonItem.m"), 2499, CFSTR("Unsupported symbol content transition added to UIBarButtonItem."));

  }
  if (!v10)
    goto LABEL_17;
  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (-[UIBarButtonItem image](self, "image"), (v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  v15 = (void *)v14;
  -[UIBarButtonItem image](self, "image");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isSymbolImage");
  if (!v23 || !v17 || !-[UIImage isSymbolImage](v23, "isSymbolImage"))
  {
LABEL_15:

    goto LABEL_16;
  }
  -[UIBarButtonItem image](self, "image");
  v18 = (UIImage *)(id)objc_claimAutoreleasedReturnValue();
  v19 = v23;
  v20 = v19;
  if (v18 == v19)
  {

    goto LABEL_15;
  }
  if (v18)
  {
    v21 = -[UIImage isEqual:](v18, "isEqual:", v19);

    if (!v21)
      goto LABEL_20;
LABEL_17:
    -[UIBarButtonItem setImage:](self, "setImage:", v23);
    goto LABEL_18;
  }

LABEL_20:
  WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_storeStrong((id *)&self->_image, symbolImage);
    objc_msgSend(WeakRetained, "_item:applyContentTransition:options:", self, v10, v11);
  }
  else
  {
    -[UIBarButtonItem setImage:](self, "setImage:", v20);
  }

LABEL_18:
}

+ (void)_getSystemItemStyle:(int64_t *)a3 title:(id *)a4 image:(id *)a5 selectedImage:(id *)a6 action:(SEL *)a7 forBarStyle:(int64_t)a8 landscape:(BOOL)a9 alwaysBordered:(BOOL)a10 usingSystemItem:(int64_t)a11 usingItemStyle:(int64_t)a12
{
  BarButtonItemGetSystemItemStyle_KitAsset(a3, a4, a5, a6, (char **)a7, a8, a9, 0, a11, a12);
}

- (void)_getSystemItemStyle:(int64_t *)a3 title:(id *)a4 image:(id *)a5 selectedImage:(id *)a6 action:(SEL *)a7 forBarStyle:(int64_t)a8 landscape:(BOOL)a9 alwaysBordered:(BOOL)a10
{
  UIBarButtonItemStyle v17;

  if (a10)
    v17 = UIBarButtonItemStyleBordered;
  else
    v17 = -[UIBarButtonItem style](self, "style");
  BarButtonItemGetSystemItemStyle_KitAsset(a3, a4, a5, a6, (char **)a7, a8, a9, 0, ((unint64_t)self->_barButtonItemFlags >> 5) & 0x7F, v17);
}

- (void)_getNavBarEdgeSizeAdjust:(CGSize *)a3 imageInsets:(UIEdgeInsets *)a4 landscape:(BOOL)a5
{
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;

  if (a3)
    *a3 = *(CGSize *)MEMORY[0x1E0C9D820];
  if (a4)
  {
    if (a5)
      -[UIBarButtonItem landscapeImagePhoneInsets](self, "landscapeImagePhoneInsets");
    else
      -[UIBarButtonItem imageInsets](self, "imageInsets");
    a4->top = v6;
    a4->left = v7;
    a4->bottom = v8;
    a4->right = v9;
  }
}

- (BOOL)_isImageBarButtonItem
{
  BOOL v3;
  void *v4;

  if (!self->_view)
    return 0;
  if (-[UIBarButtonItem isCustomViewItem](self, "isCustomViewItem"))
    return 1;
  -[UIView imageForState:](self->_view, "imageForState:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (double)_leftImagePaddingForEdgeMarginInNavBar
{
  double v3;
  void *v4;
  void *v5;
  double left;
  CGRect v8;

  v3 = 0.0;
  if (!-[UIBarButtonItem isCustomViewItem](self, "isCustomViewItem"))
  {
    _ImageViewInNavigationButton(self->_view);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "frame");
      objc_msgSend(v5, "alignmentRectForFrame:");
      left = self->_imageInsets.left;
      v3 = left - CGRectGetMinX(v8);

    }
  }
  return v3;
}

- (double)_rightImagePaddingForEdgeMarginInNavBar
{
  double v3;
  void *v4;
  void *v5;
  double MaxX;
  CGRect v8;
  CGRect v9;

  v3 = 0.0;
  if (!-[UIBarButtonItem isCustomViewItem](self, "isCustomViewItem"))
  {
    _ImageViewInNavigationButton(self->_view);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "frame");
      objc_msgSend(v5, "alignmentRectForFrame:");
      MaxX = CGRectGetMaxX(v8);
      -[UIView bounds](self->_view, "bounds");
      v3 = MaxX - CGRectGetMaxX(v9) - self->_imageInsets.right;

    }
  }
  return v3;
}

- (void)_getToolbarSystemItemEdgeInsetsWithImageInsets:(UIEdgeInsets *)a3 forBarStyle:(int64_t)a4 landscape:(BOOL)a5 alwaysBordered:(BOOL)a6
{
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;

  if (a3)
  {
    if (a5)
      -[UIBarButtonItem landscapeImagePhoneInsets](self, "landscapeImagePhoneInsets");
    else
      -[UIBarButtonItem imageInsets](self, "imageInsets");
    a3->top = v7;
    a3->left = v8;
    a3->bottom = v9;
    a3->right = v10;
  }
}

+ (Class)classForNavigationButton
{
  return (Class)objc_opt_class();
}

+ (Class)classForToolbarButton
{
  return (Class)objc_opt_class();
}

uint64_t __30__UIBarButtonItem__updateView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "createViewForToolbar:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setView:", v2);

  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  return objc_msgSend(*(id *)(a1 + 40), "_positionToolbarButtonsAndResetFontScaleAdjustment:", 1);
}

- (NSString)description
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  UIMenu *menu;
  int v8;
  const __CFString *v9;
  const __CFString *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIBarButtonItem;
  -[UIBarButtonItem description](&v12, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (-[UIBarButtonItem isCustomViewItem](self, "isCustomViewItem"))
    objc_msgSend(v4, "appendFormat:", CFSTR(" view=%p"), self->_view);
  if (self->_primaryAction)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(" primaryAction=%@"), self->_primaryAction);
  }
  else if (self->_action)
  {
    WeakRetained = objc_loadWeakRetained(&self->_target);
    NSStringFromSelector(self->_action);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" target=%p action=%@"), WeakRetained, v6);

  }
  menu = self->_menu;
  if (menu)
  {
    v8 = *((_WORD *)&self->_barButtonItemFlags + 1) & 3;
    if (v8 == 2)
    {
      v9 = CFSTR(" menuForcedOnTouchDown");
    }
    else if (v8 == 1)
    {
      v9 = CFSTR(" menuForcedOnLongPress");
    }
    else
    {
      if ((*((_WORD *)&self->_barButtonItemFlags + 1) & 3) != 0)
      {
LABEL_17:
        objc_msgSend(v4, "appendFormat:", CFSTR(" menu=%p"), menu);
        goto LABEL_18;
      }
      if (-[UIBarButtonItem _menuIsPrimary](self, "_menuIsPrimary"))
        v9 = CFSTR(" menuOnTouchDown");
      else
        v9 = CFSTR(" menuOnLongPress");
    }
    objc_msgSend(v4, "appendString:", v9);
    menu = self->_menu;
    goto LABEL_17;
  }
LABEL_18:
  if (-[UIBarButtonItem isSystemItem](self, "isSystemItem"))
  {
    switch(-[UIBarButtonItem systemItem](self, "systemItem"))
    {
      case 0:
        v10 = CFSTR(" systemItem=Done");
        goto LABEL_54;
      case 1:
        v10 = CFSTR(" systemItem=Cancel");
        goto LABEL_54;
      case 2:
        v10 = CFSTR(" systemItem=Edit");
        goto LABEL_54;
      case 3:
        v10 = CFSTR(" systemItem=Save");
        goto LABEL_54;
      case 4:
        v10 = CFSTR(" systemItem=Add");
        goto LABEL_54;
      case 5:
        v10 = CFSTR(" systemItem=FlexibleSpace");
        goto LABEL_54;
      case 6:
        objc_msgSend(v4, "appendFormat:", CFSTR(" systemItem=FixedSpace width=%f"), *(_QWORD *)&self->_width);
        return (NSString *)v4;
      case 7:
        v10 = CFSTR(" systemItem=Compose");
        goto LABEL_54;
      case 8:
        v10 = CFSTR(" systemItem=Reply");
        goto LABEL_54;
      case 9:
        v10 = CFSTR(" systemItem=Action");
        goto LABEL_54;
      case 10:
        v10 = CFSTR(" systemItem=Organize");
        goto LABEL_54;
      case 11:
        v10 = CFSTR(" systemItem=Bookmarks");
        goto LABEL_54;
      case 12:
        v10 = CFSTR(" systemItem=Search");
        goto LABEL_54;
      case 13:
        v10 = CFSTR(" systemItem=Refresh");
        goto LABEL_54;
      case 14:
        v10 = CFSTR(" systemItem=Stop");
        goto LABEL_54;
      case 15:
        v10 = CFSTR(" systemItem=Camera");
        goto LABEL_54;
      case 16:
        v10 = CFSTR(" systemItem=Trash");
        goto LABEL_54;
      case 17:
        v10 = CFSTR(" systemItem=Play");
        goto LABEL_54;
      case 18:
        v10 = CFSTR(" systemItem=Pause");
        goto LABEL_54;
      case 19:
        v10 = CFSTR(" systemItem=Rewind");
        goto LABEL_54;
      case 20:
        v10 = CFSTR(" systemItem=Forward");
        goto LABEL_54;
      case 21:
        v10 = CFSTR(" systemItem=Undo");
        goto LABEL_54;
      case 22:
        v10 = CFSTR(" systemItem=Redo");
        goto LABEL_54;
      case 24:
        v10 = CFSTR(" systemItem=Close");
LABEL_54:
        objc_msgSend(v4, "appendString:", v10);
        break;
      default:
        objc_msgSend(v4, "appendFormat:", CFSTR(" systemItem=%li"), -[UIBarButtonItem systemItem](self, "systemItem"));
        break;
    }
  }
  else if (!-[UIBarButtonItem isCustomViewItem](self, "isCustomViewItem"))
  {
    if (self->_image)
    {
      objc_msgSend(v4, "appendFormat:", CFSTR(" image=%@"), self->_image);
      if (self->_landscapeImagePhone)
        objc_msgSend(v4, "appendFormat:", CFSTR(" landscapeImagePhone=%@"), self->_landscapeImagePhone);
    }
    else if (self->_title)
    {
      objc_msgSend(v4, "appendFormat:", CFSTR(" title='%@'"), self->_title);
    }
    if (self->_width != 0.0)
      objc_msgSend(v4, "appendFormat:", CFSTR(" width=%f"), *(_QWORD *)&self->_width);
  }
  return (NSString *)v4;
}

- (double)_minimumWidth
{
  return self->_minimumWidth;
}

- (void)_setMinimumWidth:(double)a3
{
  self->_minimumWidth = a3;
}

- (double)_maximumWidth
{
  return self->_maximumWidth;
}

- (void)_setMaximumWidth:(double)a3
{
  self->_maximumWidth = a3;
}

- (void)_setFlexible:(BOOL)a3
{
  self->_flexible = a3;
}

- (NSDictionary)_stylesForSizingTitles
{
  return self->_stylesForSizingTitles;
}

- (UIAction)primaryAction
{
  return self->_primaryAction;
}

- (UINavigationItem)_owningNavigationItem
{
  return (UINavigationItem *)objc_loadWeakRetained((id *)&self->__owningNavigationItem);
}

- (void)_setOwningButtonGroup:(id)a3
{
  objc_storeWeak((id *)&self->__owningButtonGroup, a3);
}

- (BOOL)groupRepresentative
{
  return self->_groupRepresentative;
}

- (id)_autoValidationHandler
{
  return self->__autoValidationHandler;
}

- (void)_setAutoValidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (void)_setToolbarCharge:(double)a3
{
  self->__toolbarCharge = a3;
}

- (BOOL)isKeyboardItem
{
  return self->_isKeyboardItem;
}

- (void)setIsKeyboardItem:(BOOL)a3
{
  self->_isKeyboardItem = a3;
}

- (UIBarButtonItem)_itemVariation
{
  return self->__itemVariation;
}

- (BOOL)_changesSelectionAsPrimaryAction
{
  return self->__changesSelectionAsPrimaryAction;
}

- (void)_setChangesSelectionAsPrimaryAction:(BOOL)a3
{
  self->__changesSelectionAsPrimaryAction = a3;
}

- (CGRect)frameInView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIBarButtonItem _frameInCoordinateSpace:window:](self, "_frameInCoordinateSpace:window:", a3, 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_frameInCoordinateSpace:(id)a3 window:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  v6 = a3;
  v7 = a4;
  -[UIBarButtonItem _NSToolbarSourceItem](self, "_NSToolbarSourceItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "_frameInCoordinateSpace:window:", v6, v7);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
  }
  else
  {
    -[UIBarButtonItem _viewForPresenting](self, "_viewForPresenting");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    objc_msgSend(v18, "convertRect:toCoordinateSpace:", v6);
    v11 = v19;
    v13 = v20;
    v15 = v21;
    v17 = v22;

  }
  v23 = v11;
  v24 = v13;
  v25 = v15;
  v26 = v17;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)_nearestViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIBarButtonItem _NSToolbarSourceItem](self, "_NSToolbarSourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_nearestViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIBarButtonItem _viewForPresenting](self, "_viewForPresenting");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_viewControllerForAncestor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_sourceViewForPresentationInWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[UIBarButtonItem _NSToolbarSourceItem](self, "_NSToolbarSourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "_sourceViewForPresentationInWindow:", v4);
  else
    -[UIBarButtonItem _viewForPresenting](self, "_viewForPresenting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGRect)_sourceRectForPresentationInWindow:(id)a3
{
  id v4;
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
  CGRect result;

  v4 = a3;
  -[UIBarButtonItem _NSToolbarSourceItem](self, "_NSToolbarSourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "_sourceRectForPresentationInWindow:", v4);
  else
    -[UIBarButtonItem _rectForPresenting](self, "_rectForPresenting");
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;

  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

@end
