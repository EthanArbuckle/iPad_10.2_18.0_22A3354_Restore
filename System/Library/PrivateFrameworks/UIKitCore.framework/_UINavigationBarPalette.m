@implementation _UINavigationBarPalette

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarPalette;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  if (!self->_transitioning)
  {
    -[UIView bounds](self, "bounds");
    -[UIView setFrame:](self->_contentView, "setFrame:");
  }
}

- (_BYTE)_paletteForSearch
{
  void *v1;

  if (a1)
  {
    if (a1[418])
      v1 = a1;
    else
      v1 = 0;
    a1 = v1;
  }
  return a1;
}

- (void)updateLayoutData:(id)a3 layoutWidth:(double)a4
{
  double v5;
  double v6;
  double *v7;
  uint64_t v8;
  double v9;
  double *v10;

  v10 = (double *)a3;
  UICeilToViewScale(self);
  v6 = v5;
  if (self->_minimumHeight == -1.0)
  {
    v7 = v10;
    if (v10)
    {
      v10[5] = v5;
      v8 = 4;
LABEL_8:
      v7[v8] = v6;
    }
  }
  else
  {
    UICeilToViewScale(self);
    v7 = v10;
    if (v10)
    {
      v10[4] = v9;
      if (v9 >= v6)
        v6 = v9;
      v8 = 5;
      goto LABEL_8;
    }
  }

}

- (int64_t)_layoutPriority
{
  return self->__layoutPriority;
}

- (void)setAssistantIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *assistantIdentifier;
  NSString *v10;

  v4 = a3;
  v5 = self->_assistantIdentifier;
  v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqual:](v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[_UINavigationBarPalette _clearAssistants](self, "_clearAssistants");
    v8 = (NSString *)-[NSString copy](v10, "copy");
    assistantIdentifier = self->_assistantIdentifier;
    self->_assistantIdentifier = v8;

    -[_UINavigationBarPalette _setAssistants](self, "_setAssistants");
  }
LABEL_9:

}

- (void)setAssistant:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);

  if (WeakRetained != obj)
  {
    -[_UINavigationBarPalette _clearAssistants](self, "_clearAssistants");
    objc_storeWeak((id *)&self->_assistant, obj);
    -[_UINavigationBarPalette _setAssistants](self, "_setAssistants");
  }

}

- (unint64_t)_contentViewMarginType
{
  return self->__contentViewMarginType;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)_setAssistants
{
  _UIPointerInteractionAssistant **p_assistant;
  id WeakRetained;
  NSString *assistantIdentifier;
  id v6;

  p_assistant = &self->_assistant;
  WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);
  if (WeakRetained)
  {
    assistantIdentifier = self->_assistantIdentifier;

    if (assistantIdentifier)
    {
      v6 = objc_loadWeakRetained((id *)p_assistant);
      objc_msgSend(v6, "setAssistedView:identifier:", self, self->_assistantIdentifier);

    }
  }
}

- (void)_clearAssistants
{
  _UIPointerInteractionAssistant **p_assistant;
  id WeakRetained;
  NSString *assistantIdentifier;
  id v6;

  p_assistant = &self->_assistant;
  WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);
  if (WeakRetained)
  {
    assistantIdentifier = self->_assistantIdentifier;

    if (assistantIdentifier)
    {
      v6 = objc_loadWeakRetained((id *)p_assistant);
      objc_msgSend(v6, "setAssistedView:identifier:", 0, self->_assistantIdentifier);

    }
  }
}

- (void)setPreferredHeight:(double)a3
{
  id WeakRetained;

  if (self->_preferredHeight != a3)
  {
    self->_preferredHeight = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_owningNavigationItem);
    objc_msgSend(WeakRetained, "_updatePalette:", self);

  }
}

- (void)setMinimumHeight:(double)a3
{
  id WeakRetained;

  if (a3 < 0.0)
    a3 = -1.0;
  if (self->_minimumHeight != a3)
  {
    self->_minimumHeight = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_owningNavigationItem);
    objc_msgSend(WeakRetained, "_updatePalette:", self);

  }
}

- (UINavigationItem)owningNavigationItem
{
  return (UINavigationItem *)objc_loadWeakRetained((id *)&self->_owningNavigationItem);
}

- (double)preferredHeight
{
  return self->_preferredHeight;
}

- (void)_setLayoutPriority:(int64_t)a3
{
  self->__layoutPriority = a3;
}

- (void)_setContentViewMarginType:(unint64_t)a3
{
  self->__contentViewMarginType = a3;
}

- (void)setOwningNavigationItem:(id)a3
{
  objc_storeWeak((id *)&self->_owningNavigationItem, a3);
}

- (_UINavigationBarPalette)initWithContentView:(id)a3
{
  id v5;
  _UINavigationBarPalette *v6;
  _UINavigationBarPalette *v7;
  objc_super v9;
  CGRect v10;

  v5 = a3;
  objc_msgSend(v5, "frame");
  v9.receiver = self;
  v9.super_class = (Class)_UINavigationBarPalette;
  v6 = -[UIView initWithFrame:](&v9, sel_initWithFrame_);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentView, a3);
    objc_msgSend(v5, "frame");
    v7->_preferredHeight = CGRectGetHeight(v10);
    v7->_minimumHeight = -1.0;
    -[_UINavigationBarPalette addSubview:](v7, "addSubview:", v7->_contentView);
    -[UIView setClipsToBounds:](v7, "setClipsToBounds:", 1);
  }

  return v7;
}

- (void)addSubview:(id)a3
{
  UIView *v4;
  UIView *contentView;
  objc_super v6;
  CGRect v7;

  v4 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView == v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)_UINavigationBarPalette;
    -[UIView addSubview:](&v6, sel_addSubview_, v4);
  }
  else
  {
    -[UIView addSubview:](contentView, "addSubview:", v4);
    if (self->_preferredHeight == 0.0)
    {
      -[UIView frame](v4, "frame");
      self->_preferredHeight = CGRectGetHeight(v7);
    }
  }

}

- (_UINavigationBarPalette)init
{
  void *v3;
  _UINavigationBarPalette *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[_UINavigationBarPalette initWithContentView:](self, "initWithContentView:", v3);

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  unint64_t contentViewMarginType;
  const __CFString *v6;
  int64_t layoutPriority;
  const __CFString *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UINavigationBarPalette;
  -[UIView description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_minimumHeight >= 0.0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" minimumHeight=%f"), *(_QWORD *)&self->_minimumHeight);
  else
    objc_msgSend(v4, "appendString:", CFSTR(" minimumHeight=auto"));
  objc_msgSend(v4, "appendFormat:", CFSTR(" preferredHeight=%f"), *(_QWORD *)&self->_preferredHeight);
  if (self->__displaysWhenSearchActive)
    objc_msgSend(v4, "appendString:", CFSTR(" displaysWhenSearchActive"));
  contentViewMarginType = self->__contentViewMarginType;
  if (contentViewMarginType == 1)
  {
    v6 = CFSTR(" marginsFollowBar");
  }
  else
  {
    if (contentViewMarginType != 2)
      goto LABEL_11;
    v6 = CFSTR(" marginsFollowLargeTitle");
  }
  objc_msgSend(v4, "appendString:", v6);
LABEL_11:
  layoutPriority = self->__layoutPriority;
  if (layoutPriority == 1)
  {
    v8 = CFSTR(" priorityAfterSearch");
    goto LABEL_15;
  }
  if (layoutPriority == 2)
  {
    v8 = CFSTR(" priorityAfterLargeTitle");
LABEL_15:
    objc_msgSend(v4, "appendString:", v8);
  }
  return (NSString *)v4;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "request:locationInView:", v8, self);
    -[UIView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v10 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v9, "isEnabled"))
      {
        objc_msgSend(v9, "bounds");
        objc_msgSend(v7, "createRegionFromRect:targetView:identifier:selected:", v9, CFSTR("com.apple.UIKit.UINavigationBar.Palette.UIButton"), objc_msgSend(v9, "isSelected"), v11, v12, v13, v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_UIPointerAssistantRegion targetViewAsButton]((uint64_t)v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "createStyleForButton:shapeProvider:", v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a5;
  -[_UIPointerAssistantRegion targetViewAsButton]((uint64_t)a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_visualProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointerWillEnter:", v6);

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a5;
  -[_UIPointerAssistantRegion targetViewAsButton]((uint64_t)a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_visualProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointerWillExit:", v6);

}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (NSString)assistantIdentifier
{
  return self->_assistantIdentifier;
}

- (_UIPointerInteractionAssistant)assistant
{
  return (_UIPointerInteractionAssistant *)objc_loadWeakRetained((id *)&self->_assistant);
}

- (BOOL)transitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (void)setPinned:(BOOL)a3
{
  self->_pinned = a3;
}

- (BOOL)_displaysWhenSearchActive
{
  return self->__displaysWhenSearchActive;
}

- (void)_setDisplaysWhenSearchActive:(BOOL)a3
{
  self->__displaysWhenSearchActive = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owningNavigationItem);
  objc_destroyWeak((id *)&self->_assistant);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
