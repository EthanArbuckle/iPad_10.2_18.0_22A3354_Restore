@implementation UIToolbarButton

+ (id)defaultButtonFont
{
  return (id)objc_msgSend(off_1E167A828, "systemFontOfSize:", 17.0);
}

- (void)_setInTopBar:(BOOL)a3
{
  if (self->_isInTopBar != a3)
  {
    self->_isInTopBar = a3;
    -[UIToolbarButton layoutSubviews](self, "layoutSubviews");
  }
}

+ (id)_defaultLabelFont
{
  return (id)objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 10.0);
}

+ (id)_defaultLabelColor
{
  id result;

  result = (id)_defaultLabelColor___labelColor;
  if (!_defaultLabelColor___labelColor)
  {
    result = -[UIColor initWithWhite:alpha:]([UIColor alloc], "initWithWhite:alpha:", 0.6, 1.0);
    _defaultLabelColor___labelColor = (uint64_t)result;
  }
  return result;
}

- (double)initWithImage:(double)a3 pressedImage:(double)a4 label:(double)a5 labelHeight:(double)a6 withBarStyle:(uint64_t)a7 withStyle:(void *)a8 withInsets:(void *)a9 possibleTitles:(uint64_t)a10 possibleSystemItems:(uint64_t)a11 withToolbarTintColor:(uint64_t)a12 bezel:(uint64_t)a13 imageInsets:(double)a14 glowInsets:(double)a15 landscape:(double)a16
{
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double *v54;
  double v55;
  uint64_t v57;
  uint64_t v58;
  objc_super v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  if (a8)
  {
    objc_msgSend(a8, "size");
    v32 = v31;
    v34 = v33;
  }
  else
  {
    v32 = *MEMORY[0x1E0C9D820];
    v34 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v35 = MEMORY[0x1E0C9D648];
  v36 = (double *)MEMORY[0x1E0C9D538];
  if (a9)
  {
    objc_msgSend(a9, "size");
    if (v37 > v32)
      v32 = v37;
    if (v38 > v34)
      v34 = v38;
  }
  v39 = *(double *)(v35 + 16);
  v41 = *v36;
  v40 = v36[1];
  if (a17)
  {
    v42 = v36[1];
    if (objc_msgSend(a17, "count"))
    {
      v58 = a10;
      v43 = *MEMORY[0x1E0C9D820];
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v44 = objc_msgSend(a17, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v68;
        do
        {
          for (i = 0; i != v45; ++i)
          {
            if (*(_QWORD *)v68 != v46)
              objc_enumerationMutation(a17);
            v48 = objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "integerValue");
            v65 = 0;
            v66 = 0;
            LOWORD(v57) = a28;
            +[UIBarButtonItem _getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:usingSystemItem:usingItemStyle:](UIBarButtonItem, "_getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:usingSystemItem:usingItemStyle:", 0, 0, &v66, &v65, 0, a11, v57, v48, 0);
            objc_msgSend(v66, "size");
            if (v43 < v49)
            {
              objc_msgSend(v66, "size");
              v43 = v50;
            }
            if (v65)
            {
              objc_msgSend(v65, "size");
              if (v43 < v51)
              {
                objc_msgSend(v65, "size");
                v43 = v52;
              }
            }
          }
          v45 = objc_msgSend(a17, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
        }
        while (v45);
      }
      if (v32 < v43)
        v32 = v43;
      a10 = v58;
    }
    v40 = v42;
  }
  if (v39 + 2.0 <= v32)
    v53 = v32;
  else
    v53 = v39 + 2.0;
  v64.receiver = a1;
  v64.super_class = (Class)UIToolbarButton;
  v54 = (double *)objc_msgSendSuper2(&v64, sel_initWithFrame_, v41, v40, v53, v34);
  *((_QWORD *)v54 + 78) = a18;
  *((_QWORD *)v54 + 66) = a24;
  *((_QWORD *)v54 + 67) = a25;
  *((_QWORD *)v54 + 68) = a26;
  *((_QWORD *)v54 + 69) = a27;
  *((_QWORD *)v54 + 64) = a11;
  v54[65] = 0.0;
  if (a8)
  {
    *((_QWORD *)v54 + 62) = -[UINavigationButton initWithImage:width:style:applyBezel:forBarStyle:buttonItemStyle:]([_UIToolbarNavigationButton alloc], "initWithImage:width:style:applyBezel:forBarStyle:buttonItemStyle:", a8, 2 * (a12 == 2), 1, *((_QWORD *)v54 + 64), 0, 0.0);
  }
  else if (a10)
  {
    v54[63] = 0.0;
    v55 = 4.0;
    if (a2 > 0.0)
      v55 = a2;
    v54[73] = v55;
  }
  v54[74] = a3 + a20;
  v54[75] = a4 + a21;
  v54[76] = a5 + a22;
  v54[77] = a6 + a23;
  objc_msgSend(v54, "setOpaque:", 0);
  objc_msgSend(v54, "addSubview:", *((_QWORD *)v54 + 62));
  objc_msgSend(v54, "_adjustPushButtonForMiniBar:isChangingBarHeight:", 0, 0);
  objc_msgSend(v54, "addSubview:", *((_QWORD *)v54 + 63));
  objc_msgSend(v54, "setNeedsLayout");
  return v54;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIToolbarButton;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  objc_super v6;

  if (dyld_program_sdk_at_least())
    return -[UIButton gestureRecognizerShouldBegin:](self->_info, "gestureRecognizerShouldBegin:", a3);
  v6.receiver = self;
  v6.super_class = (Class)UIToolbarButton;
  return -[UIView gestureRecognizerShouldBegin:](&v6, sel_gestureRecognizerShouldBegin_, a3);
}

- (void)_setWantsBlendModeForAccessibilityBackgrounds:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UINavigationButton _setWantsBlendModeForAccessibilityBackgrounds:](self->_info, "_setWantsBlendModeForAccessibilityBackgrounds:", v3);
}

- (BOOL)_showsAccessibilityBackgroundWhenEnabled
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[UINavigationButton _showsAccessibilityBackgroundWhenEnabled](self->_info, "_showsAccessibilityBackgroundWhenEnabled");
}

- (BOOL)_wantsAccessibilityButtonShapes
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[UINavigationButton _wantsAccessibilityButtonShapes](self->_info, "_wantsAccessibilityButtonShapes");
}

- (void)_setCreatedByBarButtonItem:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UINavigationButton _setCreatedByBarButtonItem:](self->_info, "_setCreatedByBarButtonItem:", v3);
}

- (BOOL)_createdByBarButtonItem
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[UINavigationButton _createdByBarButtonItem](self->_info, "_createdByBarButtonItem");
}

- (void)_sizeView:(id)a3 toPossibleTitles:(id)a4 pressedTitle:(id)a5
{
  char isKindOfClass;
  double v9;
  double v10;
  void *v11;
  float v12;
  id v13;
  double v14;
  float v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  double v21;
  float v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(a3, "frame");
  v10 = v9;
  if ((isKindOfClass & 1) != 0)
    v11 = (void *)objc_msgSend(a3, "titleForState:", 0);
  else
    v11 = (void *)objc_msgSend(a3, "text");
  v12 = v10;
  v13 = v11;
  if (a5 && (objc_msgSend(a4, "containsObject:", a5) & 1) == 0)
  {
    if ((isKindOfClass & 1) != 0)
      objc_msgSend(a3, "setTitle:forState:", a5, 0);
    else
      objc_msgSend(a3, "setText:", a5);
    objc_msgSend(a3, "sizeToFit");
    objc_msgSend(a3, "frame");
    v15 = v14;
    if (v15 > v12)
      v12 = v14;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(a4);
        v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((isKindOfClass & 1) != 0)
          objc_msgSend(a3, "setTitle:forState:", v20, 0);
        else
          objc_msgSend(a3, "setText:", v20);
        objc_msgSend(a3, "sizeToFit");
        objc_msgSend(a3, "frame");
        v22 = v21;
        if (v12 < v22)
          v12 = v21;
      }
      v17 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }
  objc_msgSend(a3, "frame");
  objc_msgSend(a3, "setFrame:");
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(a3, "setTitle:forState:", v13, 0);
  else
    objc_msgSend(a3, "setText:", v13);

}

- (void)setImage:(id)a3
{
  -[UIButton setImage:forState:](self->_info, "setImage:forState:", a3, 0);
}

- (void)_setButtonBarHitRect:(CGRect)a3
{
  self->_hitRect = a3;
}

- (CGRect)_buttonBarHitRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_hitRect.origin.x;
  y = self->_hitRect.origin.y;
  width = self->_hitRect.size.width;
  height = self->_hitRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setPressed:(BOOL)a3
{
  _BOOL8 v3;
  UILabel *label;
  UIColor *v6;

  v3 = a3;
  if (-[UIToolbarButton _infoIsButton](self, "_infoIsButton"))
  {
    self->_onState = v3;
    -[UINavigationButton setHighlighted:](self->_info, "setHighlighted:", v3);
  }
  label = self->_label;
  if (v3)
    v6 = +[UIColor whiteColor](UIColor, "whiteColor");
  else
    v6 = (UIColor *)objc_msgSend((id)objc_opt_class(), "_defaultLabelColor");
  -[UILabel setTextColor:](label, "setTextColor:", v6);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setUseSelectedImage:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[UIToolbarButton _infoIsButton](self, "_infoIsButton"))
  {
    -[UIButton setSelected:](self->_info, "setSelected:", v3);
  }
  else if (v3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIToolbarButton.m"), 313, CFSTR("Selection not supported on toolbar items not backed by a UIButton subclass."));
  }
}

- (void)_setAdditionalSelectionInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (left != self->__additionalSelectionInsets.left
     || top != self->__additionalSelectionInsets.top
     || right != self->__additionalSelectionInsets.right
     || bottom != self->__additionalSelectionInsets.bottom))
  {
    -[UINavigationButton _setAdditionalSelectionInsets:](self->_info, "_setAdditionalSelectionInsets:", top, left, bottom, right);
    -[UIButton setNeedsLayout](self->_info, "setNeedsLayout");
  }
}

- (void)_setInfoWidth:(float)a3
{
  double v4;
  double v5;

  v4 = a3;
  self->_minimumWidth = a3;
  self->_maximumWidth = a3;
  -[UIView frame](self->_info, "frame");
  -[UIButton setFrame:](self->_info, "setFrame:");
  -[UIView frame](self, "frame");
  if (v5 < v4)
  {
    -[UIView frame](self, "frame");
    -[UIView setFrame:](self, "setFrame:");
  }
}

- (void)_setInfoExtremityWidth:(float)a3 isMin:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  double maximumWidth;
  double minimumWidth;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = a4;
  v6 = a3;
  if (a4)
  {
    self->_minimumWidth = v6;
    maximumWidth = self->_maximumWidth;
  }
  else
  {
    self->_maximumWidth = v6;
    maximumWidth = a3;
  }
  if (maximumWidth > 0.0)
  {
    minimumWidth = self->_minimumWidth;
    if (maximumWidth < minimumWidth)
      self->_maximumWidth = minimumWidth;
  }
  -[UIView frame](self->_info, "frame");
  if (v9 >= v6)
    v10 = v9;
  else
    v10 = v6;
  if (v9 >= v6)
    v9 = v6;
  if (v4)
    v11 = v10;
  else
    v11 = v9;
  -[UIButton setFrame:](self->_info, "setFrame:");
  -[UIView frame](self, "frame");
  if (v11 != v12)
  {
    -[UIView frame](self, "frame");
    -[UIView setFrame:](self, "setFrame:");
  }
}

- (void)_setInfoFlexibleWidth:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[UIView autoresizingMask](self->_info, "autoresizingMask");
  if (v3)
    v6 = v5 & 0xFFFFFFFD | 2;
  else
    v6 = v5 & 0xFFFFFFFD;
  -[UIView setAutoresizingMask:](self->_info, "setAutoresizingMask:", v6);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v3 = a3;
  if (-[UIControl isEnabled](self, "isEnabled") != a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIToolbarButton;
    -[UIControl setEnabled:](&v10, sel_setEnabled_, v3);
    if (-[UIToolbarButton _infoIsButton](self, "_infoIsButton"))
    {
      -[UINavigationButton setEnabled:](self->_info, "setEnabled:", v3);
      v5 = objc_msgSend(self->_appearanceStorage, "textAttributesForState:", 0);
      if (v5)
      {
        v6 = v5;
        v7 = -[UIControl isHighlighted](self, "isHighlighted");
        v8 = 2;
        if (v3)
          v8 = 0;
        if (v7)
          v9 = 1;
        else
          v9 = v8;
        if (v7 || !v3)
          v6 = objc_msgSend(self->_appearanceStorage, "textAttributesForState:", v9);
        -[UIToolbarButton _updateShadowOffsetWithAttributes:forState:](self, "_updateShadowOffsetWithAttributes:forState:", v6, v9);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(self->_appearanceStorage, "textAttributesForState:", 2))
        -[UIToolbarButton _adjustToolbarButtonInfo](self, "_adjustToolbarButtonInfo");
    }
  }
}

- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  return CGRectContainsPoint(self->_hitRect, a3);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return CGRectContainsPoint(self->_hitRect, a3);
}

- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  CGRect *p_hitRect;
  BOOL result;
  uint64_t v9;
  objc_super v10;
  CGPoint v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)UIToolbarButton;
  if (-[UIControl pointMostlyInside:withEvent:](&v10, sel_pointMostlyInside_withEvent_, a4))
    return 1;
  p_hitRect = &self->_hitRect;
  v11.x = x;
  v11.y = y;
  if (CGRectContainsPoint(self->_hitRect, v11))
    return 1;
  v9 = -[UIView _barPosition](-[UIView superview](self, "superview"), "_barPosition");
  result = 0;
  if (v9 != 1 && v9 != 4)
  {
    v12.origin.x = p_hitRect->origin.x;
    v12.origin.y = self->_hitRect.origin.y;
    v12.size.width = self->_hitRect.size.width;
    v12.size.height = self->_hitRect.size.height;
    if (x >= CGRectGetMinX(v12)
      && (v13.origin.x = p_hitRect->origin.x,
          v13.origin.y = self->_hitRect.origin.y,
          v13.size.width = self->_hitRect.size.width,
          v13.size.height = self->_hitRect.size.height,
          x <= CGRectGetMaxX(v13)))
    {
      v14.origin.x = p_hitRect->origin.x;
      v14.origin.y = self->_hitRect.origin.y;
      v14.size.width = self->_hitRect.size.width;
      v14.size.height = self->_hitRect.size.height;
      return y <= CGRectGetMaxY(v14);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  _UIToolbarNavigationButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIToolbarButton;
  v5 = -[UIControl hitTest:forEvent:](&v7, sel_hitTest_forEvent_, a4, a3.x, a3.y);
  if (-[UIToolbarButton _infoIsButton](self, "_infoIsButton") && v5 == self->_info)
    return self;
  return v5;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _UIToolbarNavigationButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIToolbarButton;
  v5 = -[UIControl hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  if (-[UIToolbarButton _infoIsButton](self, "_infoIsButton") && v5 == self->_info)
    return self;
  return v5;
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (BOOL)_canHandleStatusBarTouchAtLocation:(CGPoint)a3
{
  return 1;
}

- (void)_setLastHighlightSuccessful:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIToolbarButton;
  -[UIControl _setLastHighlightSuccessful:](&v5, sel__setLastHighlightSuccessful_);
  if (-[UIToolbarButton _infoIsButton](self, "_infoIsButton"))
    -[UIControl _setLastHighlightSuccessful:](self->_info, "_setLastHighlightSuccessful:", v3);
}

- (void)_setTouchHasHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIToolbarButton;
  -[UIControl _setTouchHasHighlighted:](&v5, sel__setTouchHasHighlighted_);
  if (-[UIToolbarButton _infoIsButton](self, "_infoIsButton"))
    -[UIControl _setTouchHasHighlighted:](self->_info, "_setTouchHasHighlighted:", v3);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  UIWindow *v7;
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
  double top;
  double left;
  double v20;
  double v21;
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
  double v32;
  double v33;
  UIWindow *v34;
  UIWindow *v35;
  UIView *v36;
  objc_super v37;

  v3 = a3;
  v37.receiver = self;
  v37.super_class = (Class)UIToolbarButton;
  -[UIControl setHighlighted:](&v37, sel_setHighlighted_);
  if (-[UIToolbarButton _infoIsButton](self, "_infoIsButton"))
  {
    -[UINavigationButton setHighlighted:](self->_info, "setHighlighted:", self->_onState | v3);
    v5 = objc_msgSend(self->_appearanceStorage, "textAttributesForState:", 0);
    if (v5)
    {
      v6 = v5;
      if (v3)
        v6 = objc_msgSend(self->_appearanceStorage, "textAttributesForState:", 1);
      -[UIToolbarButton _updateShadowOffsetWithAttributes:forState:](self, "_updateShadowOffsetWithAttributes:forState:", v6, v3);
    }
  }
  else if (v3)
  {
    if (!__backgroundGlow)
    {
      __backgroundGlow = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", _UIImageWithName(CFSTR("UIButtonBarPressedIndicator.png")));
      objc_msgSend((id)__backgroundGlow, "setEnabled:", 0);
      objc_msgSend((id)__backgroundGlow, "setOpaque:", 0);
    }
    if (-[UIView _containerStyle](self) == 1)
      v7 = -[UIView window](self, "window");
    else
      v7 = -[UIView superview](self, "superview");
    -[UIView addSubview:](v7, "addSubview:", __backgroundGlow);
    -[UIView frame](self, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend((id)__backgroundGlow, "frame");
    top = self->_infoInsets.top;
    left = self->_infoInsets.left;
    v20 = left + v9 - round((v16 - v13) * 0.5);
    v21 = top + v11 - round((v17 - v15) * 0.5);
    v22 = v16 - (left + self->_infoInsets.right);
    v23 = v17 - (top + self->_infoInsets.bottom);
    v24 = self->_glowAdjust.top;
    v25 = self->_glowAdjust.left;
    v26 = v20 + v25;
    v27 = v21 + v24;
    v28 = v22 - (v25 + self->_glowAdjust.right);
    v29 = v23 - (v24 + self->_glowAdjust.bottom);
    if (-[UIView _containerStyle](self) == 1)
    {
      -[UIView convertRect:fromView:](-[UIView window](self, "window"), "convertRect:fromView:", -[UIView superview](self, "superview"), v26, v27, v28, v29);
      v26 = v30;
      v27 = v31;
      v28 = v32;
      v29 = v33;
    }
    objc_msgSend((id)__backgroundGlow, "setFrame:", v26, v27, v28, v29);
    objc_msgSend((id)__backgroundGlow, "setAlpha:", 1.0);
    -[UIView bringSubviewToFront:](-[UIView superview](self, "superview"), "bringSubviewToFront:", self);
    if (-[UIView _containerStyle](self) == 1)
    {
      v34 = -[UIView window](self, "window");
      -[UIView addSubview:](v34, "addSubview:", __backgroundGlow);
      v35 = -[UIView window](self, "window");
      -[UIView bringSubviewToFront:](v35, "bringSubviewToFront:", __backgroundGlow);
    }
    else
    {
      v36 = -[UIView superview](self, "superview");
      -[UIView _addSubview:positioned:relativeTo:](v36, "_addSubview:positioned:relativeTo:", __backgroundGlow, -2, self);
    }
  }
  else if (-[UIControl isTouchInside](self, "isTouchInside"))
  {
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", &__block_literal_global_55, 0, 0.25);
  }
  else
  {
    objc_msgSend((id)__backgroundGlow, "setAlpha:", 0.0);
  }
}

uint64_t __34__UIToolbarButton_setHighlighted___block_invoke()
{
  return objc_msgSend((id)__backgroundGlow, "setAlpha:", 0.0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UINavigationButton sizeThatFits:](self->_info, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
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
  UIEdgeInsets result;

  -[UIButton alignmentRectInsets](self->_info, "alignmentRectInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[UIToolbarButton _isBordered](self, "_isBordered"))
  {
    v11 = v4;
    v12 = v6;
    v13 = v8;
    v14 = v10;
  }
  else
  {
    -[UIImage alignmentRectInsets](-[UIButton imageForState:](self->_info, "imageForState:", 0), "alignmentRectInsets");
  }
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (id)_customOrAccessibilityBackgroundImageForState:(unint64_t)a3 style:(int64_t)a4 isMini:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v9;

  v5 = a5;
  v9 = -[UIToolbarButton _wantsAccessibilityButtonShapes](self, "_wantsAccessibilityButtonShapes");
  if (a3 || !v9)
    return (id)objc_msgSend(self->_appearanceStorage, "backgroundImageForState:style:isMini:", a3, a4, v5);
  else
    return _UINavigationButtonAccessibilityBackground(0, v5);
}

- (void)_adjustPushButtonForMiniBar:(BOOL)a3 isChangingBarHeight:(BOOL)a4
{
  _BOOL8 v5;
  char v7;
  _UIToolbarNavigationButton *info;
  id v9;
  id v10;
  char v11;
  UIColor *v12;
  int64_t style;
  id v16;
  int v17;
  id v18;
  id v19;
  int v20;
  id v21;
  id v22;
  int v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double minimumWidth;
  double v34;
  double maximumWidth;
  double v37;

  v5 = a3;
  if (objc_msgSend(self->_appearanceStorage, "anyBackgroundImage"))
    v7 = 0;
  else
    v7 = !-[UIToolbarButton _wantsAccessibilityButtonShapes](self, "_wantsAccessibilityButtonShapes");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (v7 & 1) != 0)
    return;
  info = self->_info;
  v9 = -[UIToolbarButton _customOrAccessibilityBackgroundImageForState:style:isMini:](self, "_customOrAccessibilityBackgroundImageForState:style:isMini:", 0, self->_style, v5);
  v10 = v9;
  if (v5)
  {
    if (v9)
    {
      v11 = 1;
      goto LABEL_12;
    }
    v10 = -[UIToolbarButton _customOrAccessibilityBackgroundImageForState:style:isMini:](self, "_customOrAccessibilityBackgroundImageForState:style:isMini:", 0, self->_style, 0);
  }
  v11 = 0;
LABEL_12:
  v12 = -[UIToolbarButton _tintColor](self, "_tintColor");
  style = self->_style;
  if (style != 7 && v10 != 0)
  {
    -[UIButton setBackgroundImage:forState:](info, "setBackgroundImage:forState:", v10, 0);
    v16 = -[UIToolbarButton _customOrAccessibilityBackgroundImageForState:style:isMini:](self, "_customOrAccessibilityBackgroundImageForState:style:isMini:", 1, self->_style, v5);
    if (v16)
      v17 = 1;
    else
      v17 = !v5;
    if (v17)
      v18 = v16;
    else
      v18 = 0;
    if (((v11 | v17) & 1) == 0)
      v18 = -[UIToolbarButton _customOrAccessibilityBackgroundImageForState:style:isMini:](self, "_customOrAccessibilityBackgroundImageForState:style:isMini:", 1, self->_style, 0);
    -[UIButton setBackgroundImage:forState:](info, "setBackgroundImage:forState:", v18, 1);
    v19 = -[UIToolbarButton _customOrAccessibilityBackgroundImageForState:style:isMini:](self, "_customOrAccessibilityBackgroundImageForState:style:isMini:", 4, self->_style, v5);
    if (v19)
      v20 = 1;
    else
      v20 = !v5;
    if (v20)
      v21 = v19;
    else
      v21 = 0;
    if (((v11 | v20) & 1) == 0)
      v21 = -[UIToolbarButton _customOrAccessibilityBackgroundImageForState:style:isMini:](self, "_customOrAccessibilityBackgroundImageForState:style:isMini:", 4, self->_style, 0);
    -[UIButton setBackgroundImage:forState:](info, "setBackgroundImage:forState:", v21, 4);
    v22 = -[UIToolbarButton _customOrAccessibilityBackgroundImageForState:style:isMini:](self, "_customOrAccessibilityBackgroundImageForState:style:isMini:", 2, self->_style, v5);
    if (v22)
      v23 = 1;
    else
      v23 = !v5;
    if (v23)
      v24 = v22;
    else
      v24 = 0;
    if (((v11 | v23) & 1) == 0)
      v24 = -[UIToolbarButton _customOrAccessibilityBackgroundImageForState:style:isMini:](self, "_customOrAccessibilityBackgroundImageForState:style:isMini:", 2, self->_style, 0);
    -[UIButton setBackgroundImage:forState:](info, "setBackgroundImage:forState:", v24, 2);
    -[UINavigationButton setControlSize:](info, "setControlSize:", v5);
    -[UIView frame](info, "frame");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[UINavigationButton sizeThatFits:](info, "sizeThatFits:", 10000.0, 10000.0);
    if (self->_minimumWidth >= minimumWidth)
      minimumWidth = self->_minimumWidth;
    if (minimumWidth < v30)
      minimumWidth = v30;
    maximumWidth = self->_maximumWidth;
    if (maximumWidth >= minimumWidth || maximumWidth <= 0.0)
      maximumWidth = minimumWidth;
    if (v34 >= v32)
      v37 = v34;
    else
      v37 = v32;
    -[UIButton setFrame:](info, "setFrame:", v26, v28, maximumWidth, v37);
    goto LABEL_64;
  }
  if (style == 7 || v12 == 0)
  {
    -[UIButton setBackgroundImage:forState:](info, "setBackgroundImage:forState:", 0, 0);
    -[UIButton setBackgroundImage:forState:](info, "setBackgroundImage:forState:", 0, 1);
    if (self->_style != 2)
      goto LABEL_64;
  }
  else
  {
    -[UIButton setBackgroundImage:forState:](info, "setBackgroundImage:forState:", 0, 0);
    -[UIButton setBackgroundImage:forState:](info, "setBackgroundImage:forState:", 0, 1);
    if (style != 2)
      goto LABEL_64;
  }
  -[UIButton setBackgroundImage:forState:](info, "setBackgroundImage:forState:", 0, 2);
LABEL_64:
  if (!a4)
    -[UIButton setTitleColor:forState:](info, "setTitleColor:forState:", 0, 2);
  if (!v10 || -[UIButton currentTitle](info, "currentTitle") || -[UIButton currentImage](info, "currentImage"))
  {
    -[UIView frame](info, "frame");
    -[UIButton setFrame:](info, "setFrame:");
  }
  -[UIView sizeToFit](info, "sizeToFit");
  -[UIView layoutBelowIfNeeded](info, "layoutBelowIfNeeded");
}

- (void)layoutSubviews
{
  CGFloat x;
  double y;
  double width;
  double height;
  UILabel *label;
  double v8;
  double v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  double v23;
  UIView *v24;
  double v25;
  double v26;
  uint64_t v27;
  BOOL v28;
  double v29;
  _BOOL4 v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  double left;
  double top;
  double v49;
  double v50;
  id appearanceStorage;
  uint64_t v52;
  void *v53;
  double v54;
  double v55;
  _BOOL8 v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  double v65;
  double rect;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  -[UIView bounds](self, "bounds");
  v68 = CGRectInset(v67, 0.0, 0.0);
  x = v68.origin.x;
  y = v68.origin.y;
  width = v68.size.width;
  height = v68.size.height;
  label = self->_label;
  if (label)
  {
    -[UIView frame](label, "frame");
    -[UILabel setFrame:](self->_label, "setFrame:", round((width - v8) * 0.5), y + height - v9);
    height = height - self->_labelHeight;
  }
  if (self->_info)
  {
    objc_opt_class();
    v10 = (objc_opt_isKindOfClass() & 1) != 0 && -[UIButton imageForState:](self->_info, "imageForState:", 0) != 0;
    if (-[UIView window](self, "window"))
    {
      v11 = -[UIToolbarButton _showsAccessibilityBackgroundWhenEnabled](self, "_showsAccessibilityBackgroundWhenEnabled");
      if (v10 || v11)
      {
        v12 = v11;
        -[_UIToolbarNavigationButton updateImageIfNeededWithTintColor:](self->_info, "updateImageIfNeededWithTintColor:", objc_msgSend(self->_appearanceStorage, "tintColor"));
        if (v12)
          -[UIView sizeToFit](self->_info, "sizeToFit");
      }
    }
    -[UIView frame](self->_info, "frame");
    v14 = v13;
    v16 = v15;
    rect = v17;
    v19 = v18;
    +[UIToolbar defaultHeight](UIToolbar, "defaultHeight");
    v21 = v20;
    if (-[UIToolbarButton _wantsAccessibilityButtonShapes](self, "_wantsAccessibilityButtonShapes") || v19 >= 30.0)
    {
      v69.origin.x = v14;
      v69.origin.y = v16;
      v69.size.width = rect;
      v69.size.height = v19;
      v22 = CGRectGetHeight(v69) <= 24.0;
    }
    else
    {
      v22 = 1;
    }
    -[UIView superview](self, "superview");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v23 = height;
      if ((-[UIView _hidesShadow](-[UIView superview](self, "superview"), "_hidesShadow") & 1) == 0)
      {
        v24 = -[UIView superview](self, "superview");
        objc_msgSend(-[UIView _screen](self, "_screen"), "scale");
        v26 = 1.0 / v25;
        v27 = -[UIView _barPosition](v24, "_barPosition");
        v28 = v27 == 4 || v27 == 1;
        v29 = 0.0;
        if (v28)
          v29 = v26;
        y = y - v29;
        v23 = height + v26;
      }
    }
    else
    {
      v23 = height;
    }
    v30 = -[UIToolbarButton _isBordered](self, "_isBordered");
    if (v30 && v22 != height < v21)
    {
      -[UIToolbarButton _adjustPushButtonForMiniBar:isChangingBarHeight:](self, "_adjustPushButtonForMiniBar:isChangingBarHeight:", height < v21, 1);
      -[UIView frame](self->_info, "frame");
      rect = v31;
      v19 = v32;
    }
    v65 = v21;
    UIRoundToViewScale(self);
    v34 = v33;
    if (v30 || !v10)
    {
      v70.origin.x = x;
      v70.origin.y = y;
      v70.size.width = width;
      v70.size.height = v23;
      CGRectGetMinY(v70);
      UIFloorToViewScale(self);
      v36 = v35;
    }
    else
    {
      v62 = v33;
      v63 = y;
      v64 = width;
      if (!-[CALayer needsLayout](-[UIView layer](self->_info, "layer"), "needsLayout")
        && !-[UIButton _imageView](self->_info, "_imageView")
        && -[UIButton imageForState:](self->_info, "imageForState:", 0))
      {
        -[UIButton setNeedsLayout](self->_info, "setNeedsLayout");
      }
      -[UIView layoutIfNeeded](self->_info, "layoutIfNeeded");
      objc_msgSend(-[UIButton _imageView](self->_info, "_imageView"), "frame");
      v38 = v37;
      v40 = v39;
      v42 = v41;
      v44 = v43;
      v71.origin.x = x;
      v71.origin.y = v63;
      v71.size.width = v64;
      v71.size.height = v23;
      CGRectGetMinY(v71);
      UIFloorToViewScale(self);
      v46 = v45;
      v72.origin.x = v38;
      v72.origin.y = v40;
      v72.size.width = v42;
      v72.size.height = v44;
      v36 = v46 - CGRectGetMinY(v72);
      v34 = v62;
    }
    top = self->_infoInsets.top;
    left = self->_infoInsets.left;
    v49 = left + self->_infoInsets.right;
    v50 = top + self->_infoInsets.bottom;
    appearanceStorage = self->_appearanceStorage;
    if (height >= v65)
      v52 = objc_msgSend(appearanceStorage, "titlePositionOffset");
    else
      v52 = objc_msgSend(appearanceStorage, "miniTitlePositionOffset");
    v53 = (void *)v52;
    v54 = v34 + left;
    v55 = v36 + top;
    if (v30)
    {
      v56 = height < v65;
      v57 = 2.0;
      if (!self->_isInTopBar)
        v57 = 3.0;
      v58 = v55 + v57;
      objc_msgSend(self->_appearanceStorage, "backgroundVerticalAdjustmentForBarMetrics:", v56);
      v55 = v59 + v58;
      if (v53)
      {
        objc_msgSend(v53, "UIOffsetValue");
        -[UIButton setTitleEdgeInsets:](self->_info, "setTitleEdgeInsets:", v61, v60, -v61, -v60);
      }
    }
    -[UIButton setFrame:](self->_info, "setFrame:", v54, v55, rect - v49, v19 - v50);
  }
}

- (BOOL)_isBorderedOtherThanAccessibility
{
  return objc_msgSend(self->_appearanceStorage, "anyBackgroundImage") != 0;
}

- (BOOL)_isBordered
{
  return -[UIToolbarButton _wantsAccessibilityButtonShapes](self, "_wantsAccessibilityButtonShapes")
      || -[UIToolbarButton _isBorderedOtherThanAccessibility](self, "_isBorderedOtherThanAccessibility");
}

- (BOOL)_infoIsButton
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0 || -[UIToolbarButton _isBordered](self, "_isBordered");
}

- (BOOL)_canGetPadding
{
  double v2;
  double v3;

  -[UIView bounds](self, "bounds");
  return v3 > 0.0 && v2 > 0.0;
}

- (BOOL)_shouldApplyPadding
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && self->_style
      && objc_msgSend(self->_appearanceStorage, "anyBackgroundImage");
}

- (double)_paddingForLeft:(BOOL)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = 0.0;
  if (-[UIToolbarButton _shouldApplyPadding](self, "_shouldApplyPadding"))
  {
    -[UIView layoutIfNeeded](self, "layoutIfNeeded");
    -[UIView frame](self->_info, "frame");
    v5 = v7;
    if (!a3)
    {
      v8 = v6;
      -[UIView bounds](self, "bounds");
      return v9 - v5 - v8;
    }
  }
  return v5;
}

- (void)_setBarHeight:(float)a3
{
  self->_barHeight = 1;
  -[UIView frame](self, "frame");
  -[UIView setFrame:](self, "setFrame:");
}

- (BOOL)_useBarHeight
{
  return self->_barHeight;
}

- (void)setToolbarTintColor:(id)a3
{
  UIColor *toolbarTintColor;

  toolbarTintColor = self->_toolbarTintColor;
  if (toolbarTintColor != a3)
  {

    self->_toolbarTintColor = (UIColor *)a3;
    -[UIToolbarButton _adjustToolbarButtonInfo](self, "_adjustToolbarButtonInfo");
  }
}

- (void)setBarStyle:(int64_t)a3
{
  if (self->_barStyle != a3)
  {
    self->_barStyle = a3;
    -[UIToolbarButton _adjustToolbarButtonInfo](self, "_adjustToolbarButtonInfo");
  }
}

- (CGSize)_defaultTitleShadowOffsetForState:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 0.0;
  v4 = -1.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_updateShadowOffsetWithAttributes:(id)a3 forState:(unint64_t)a4
{
  char isKindOfClass;
  _UIToolbarNavigationButton *info;
  _UIToolbarNavigationButton *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  info = self->_info;
  if ((isKindOfClass & 1) != 0 || !info)
  {
    v9 = 0;
  }
  else
  {
    if (-[UIControl isEnabled](self, "isEnabled"))
      a4 = 0;
    else
      a4 = 2;
    v9 = info;
    info = 0;
  }
  v10 = (void *)objc_msgSend(a3, "objectForKey:", *(_QWORD *)off_1E1679048);
  if (v10)
    objc_msgSend(v10, "shadowOffset");
  else
    -[UIToolbarButton _defaultTitleShadowOffsetForState:](self, "_defaultTitleShadowOffsetForState:", a4);
  v13 = v11;
  v14 = v12;
  -[UILabel setShadowOffset:](-[UIButton titleLabel](info, "titleLabel"), "setShadowOffset:", v11, v12);
  -[_UIToolbarNavigationButton setShadowOffset:](v9, "setShadowOffset:", v13, v14);
}

- (void)_updateInfoTextColorsForState:(unint64_t)a3
{
  char isKindOfClass;
  _UIToolbarNavigationButton *info;
  unint64_t v7;
  _UIToolbarNavigationButton *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  info = self->_info;
  if ((isKindOfClass & 1) != 0 || !info)
  {
    v8 = 0;
    v7 = a3;
  }
  else
  {
    if (-[UIControl isEnabled](self, "isEnabled"))
      v7 = 0;
    else
      v7 = 2;
    v8 = info;
    info = 0;
  }
  v9 = (void *)objc_msgSend(self->_appearanceStorage, "textAttributesForState:", 0);
  if (v9)
  {
    if (v7)
      v9 = (void *)objc_msgSend(self->_appearanceStorage, "textAttributesForState:", v7);
    v10 = v9;
    v11 = objc_msgSend(v9, "objectForKey:", *(_QWORD *)off_1E1678D98);
    -[UIButton setTitleColor:forState:](info, "setTitleColor:forState:", v11, a3);
    -[_UIToolbarNavigationButton setTextColor:](v8, "setTextColor:", v11);
    v12 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", *(_QWORD *)off_1E1679048), "shadowColor");
    -[UIButton setTitleShadowColor:forState:](info, "setTitleShadowColor:forState:", v12, a3);
    -[_UIToolbarNavigationButton setShadowColor:](v8, "setShadowColor:", v12);
    v13 = -[UIControl isEnabled](self, "isEnabled");
    v14 = 2;
    if (v13)
      v14 = 0;
    if (v14 == a3)
      -[UIToolbarButton _updateShadowOffsetWithAttributes:forState:](self, "_updateShadowOffsetWithAttributes:forState:", v10, a3);
  }
}

- (void)_adjustToolbarButtonInfo
{
  -[UIToolbarButton _adjustToolbarButtonInfoTintColorHasChanged:](self, "_adjustToolbarButtonInfoTintColorHasChanged:", 0);
}

- (void)_adjustToolbarButtonInfoTintColorHasChanged:(BOOL)a3
{
  UIView *v4;
  uint64_t v5;
  _BOOL4 v6;
  _UIToolbarNavigationButton *info;
  UIColor *toolbarTintColor;
  uint64_t v9;
  void *v10;
  _UIToolbarNavigationButton *v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;

  -[UIView superview](self, "superview", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = -[UIView superview](self, "superview");
  else
    v4 = 0;
  v5 = -[UIView isMinibar](v4, "isMinibar");
  v6 = -[UIToolbarButton _infoIsButton](self, "_infoIsButton");
  if (v6)
  {
    -[UIToolbarButton _adjustPushButtonForMiniBar:isChangingBarHeight:](self, "_adjustPushButtonForMiniBar:isChangingBarHeight:", v5, 0);
    info = self->_info;
    toolbarTintColor = (UIColor *)objc_msgSend(self->_appearanceStorage, "tintColor");
    if (!toolbarTintColor)
      toolbarTintColor = self->_toolbarTintColor;
    -[UIView setTintColor:](self, "setTintColor:", toolbarTintColor);
    -[UINavigationButton setBarStyle:](info, "setBarStyle:", self->_barStyle);
    -[UINavigationButton _setTitleTextAttributes:forState:](info, "_setTitleTextAttributes:forState:", objc_msgSend(self->_appearanceStorage, "textAttributesForState:", 0), 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return;
  }
  v9 = objc_msgSend((id)objc_msgSend(self->_appearanceStorage, "textAttributesForState:", 0), "objectForKey:", *(_QWORD *)off_1E1678D90);
  if (v9)
  {
    v10 = (void *)v9;
    v11 = self->_info;
    if (v6)
      v11 = -[UIButton titleLabel](v11, "titleLabel");
    objc_msgSend(v10, "pointSize");
    if (v12 == 0.0)
    {
      v13 = 17.0;
      if (v6)
        v13 = 12.0;
      v10 = (void *)objc_msgSend(v10, "fontWithSize:", v13);
    }
    -[UIButton setFont:](v11, "setFont:", v10);
  }
  if (v6)
  {
    -[UIToolbarButton _updateInfoTextColorsForState:](self, "_updateInfoTextColorsForState:", 0);
    -[UIToolbarButton _updateInfoTextColorsForState:](self, "_updateInfoTextColorsForState:", 1);
    -[UIToolbarButton _updateInfoTextColorsForState:](self, "_updateInfoTextColorsForState:", 2);
  }
  else
  {
    if (-[UIControl isEnabled](self, "isEnabled"))
      v14 = 0;
    else
      v14 = 2;
    -[UIToolbarButton _updateInfoTextColorsForState:](self, "_updateInfoTextColorsForState:", v14);
    -[UIView alpha](self, "alpha");
    if (v15 > 0.0)
    {
      if (objc_msgSend(self->_appearanceStorage, "textAttributesForState:", 2))
        -[UIView setAlpha:](self, "setAlpha:", 1.0);
    }
  }
}

- (id)_info
{
  return self->_info;
}

- (void)_UIAppearance_setBackgroundImage:(id)a3 forState:(unint64_t)a4 style:(int64_t)a5 barMetrics:(int64_t)a6
{
  id v9;
  id appearanceStorage;
  double v12;
  double v13;
  unint64_t v15;

  if ((unint64_t)(a6 - 101) > 1)
  {
    v9 = a3;
    appearanceStorage = self->_appearanceStorage;
    if (a3)
    {
      if (!appearanceStorage)
        self->_appearanceStorage = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      if ((objc_msgSend(v9, "_isResizable") & 1) == 0)
      {
        objc_msgSend(v9, "size");
        v13 = floor(v12 * 0.5);
        v9 = (id)objc_msgSend(v9, "resizableImageWithCapInsets:", 0.0, v13, 0.0, v12 - v13 + -1.0);
      }
    }
    else
    {
      if (!appearanceStorage)
        return;
      v9 = 0;
    }
    if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0 || a4 == 4)
      v15 = a4;
    else
      v15 = 1;
    if ((id)objc_msgSend(self->_appearanceStorage, "backgroundImageForState:style:isMini:", v15, a5, a6 == 1) != v9)
    {
      objc_msgSend(self->_appearanceStorage, "setBackgroundImage:forState:style:isMini:", v9, v15, a5, a6 == 1);
      -[UINavigationButton _setBackgroundImage:forState:style:barMetrics:](self->_info, "_setBackgroundImage:forState:style:barMetrics:", v9, a4, a5, a6);
      -[UIToolbarButton _adjustToolbarButtonInfo](self, "_adjustToolbarButtonInfo");
      -[UIView setNeedsLayout](-[UIView superview](self, "superview"), "setNeedsLayout");
    }
  }
  else if ((_UIAppearance_setBackgroundImage_forState_style_barMetrics__didWarn_0 & 1) == 0)
  {
    _UIAppearance_setBackgroundImage_forState_style_barMetrics__didWarn_0 = 1;
    NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, a3, a4, a5, "UIBarButtonItem", CFSTR("background image"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
  }
}

- (void)_UIAppearance_setBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  -[UIToolbarButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", a3, a4, 8, a5);
}

- (id)_backgroundImageForState:(unint64_t)a3 barMetrics:(int64_t)a4
{
  if ((unint64_t)(a4 - 101) > 1)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0 && a3 != 4)
      a3 = 1;
    return (id)objc_msgSend(self->_appearanceStorage, "backgroundImageForState:style:isMini:", a3, self->_style, a4 == 1);
  }
  else
  {
    if ((_backgroundImageForState_barMetrics__didWarn_0 & 1) == 0)
    {
      _backgroundImageForState_barMetrics__didWarn_0 = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, a3, "UIBarButtonItem", CFSTR("background image"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    return 0;
  }
}

- (void)_UIAppearance_setTintColor:(id)a3
{
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  UIColor *v6;

  appearanceStorage = (_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage;
  if (a3)
  {
    if (!appearanceStorage)
    {
      appearanceStorage = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      self->_appearanceStorage = appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    return;
  }
  v6 = -[_UIBarButtonItemAppearanceStorage tintColor](appearanceStorage, "tintColor");
  objc_msgSend(self->_appearanceStorage, "setTintColor:", a3);
  if (v6 != a3)
    -[UIToolbarButton _adjustToolbarButtonInfoTintColorHasChanged:](self, "_adjustToolbarButtonInfoTintColorHasChanged:", 1);
}

- (UIColor)_tintColor
{
  UIColor *result;

  result = (UIColor *)objc_msgSend(self->_appearanceStorage, "tintColor");
  if (!result)
    return self->_toolbarTintColor;
  return result;
}

- (id)_titleTextAttributesForState:(unint64_t)a3
{
  return (id)objc_msgSend(self->_appearanceStorage, "textAttributesForState:", a3);
}

- (void)_UIAppearance_setBackgroundVerticalPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4
{
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  double v9;

  if ((unint64_t)(a4 - 101) > 1)
  {
    appearanceStorage = (_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage;
    if (a3 != 0.0 || appearanceStorage != 0)
    {
      if (!appearanceStorage)
      {
        appearanceStorage = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
        self->_appearanceStorage = appearanceStorage;
      }
      -[_UIBarButtonItemAppearanceStorage backgroundVerticalAdjustmentForBarMetrics:](appearanceStorage, "backgroundVerticalAdjustmentForBarMetrics:", a4);
      if (v9 != a3)
      {
        objc_msgSend(self->_appearanceStorage, "setBackgroundVerticalAdjustment:forBarMetrics:", a4, a3);
        -[UIView setNeedsLayout](self, "setNeedsLayout");
      }
    }
  }
  else if ((_UIAppearance_setBackgroundVerticalPositionAdjustment_forBarMetrics__didWarn & 1) == 0)
  {
    _UIAppearance_setBackgroundVerticalPositionAdjustment_forBarMetrics__didWarn = 1;
    NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, a3, "UIBarButtonItem", CFSTR("toolbar button background vertical position adjustment"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
  }
}

- (double)_backgroundVerticalPositionAdjustmentForBarMetrics:(int64_t)a3
{
  double result;

  if ((unint64_t)(a3 - 101) > 1)
  {
    objc_msgSend(self->_appearanceStorage, "backgroundVerticalAdjustmentForBarMetrics:");
  }
  else
  {
    if ((_backgroundVerticalPositionAdjustmentForBarMetrics__didWarn & 1) == 0)
    {
      _backgroundVerticalPositionAdjustmentForBarMetrics__didWarn = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, "UIBarButtonItem", CFSTR("toolbar button background vertical position adjustment"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    return 0.0;
  }
  return result;
}

- (void)_UIAppearance_setTitlePositionAdjustment:(UIOffset)a3 forBarMetrics:(int64_t)a4
{
  double vertical;
  double horizontal;
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  NSValue *v9;
  double v10;
  double v11;
  id v12;
  _QWORD v13[2];
  _QWORD v14[2];

  if ((unint64_t)(a4 - 101) <= 1)
  {
    if ((_UIAppearance_setTitlePositionAdjustment_forBarMetrics__didWarn_0 & 1) == 0)
    {
      _UIAppearance_setTitlePositionAdjustment_forBarMetrics__didWarn_0 = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, a3.horizontal, a3.vertical, "UIBarButtonItem", CFSTR("title position adjustment"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    return;
  }
  vertical = a3.vertical;
  horizontal = a3.horizontal;
  appearanceStorage = (_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage;
  if (!appearanceStorage)
  {
    if (a3.horizontal == 0.0 && a3.vertical == 0.0)
      return;
    appearanceStorage = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
    self->_appearanceStorage = appearanceStorage;
  }
  if (a4 != 1)
  {
    v9 = -[_UIBarButtonItemAppearanceStorage titlePositionOffset](appearanceStorage, "titlePositionOffset");
    if (v9)
      goto LABEL_10;
LABEL_12:
    v10 = 0.0;
    v11 = 0.0;
    goto LABEL_13;
  }
  v9 = -[_UIBarButtonItemAppearanceStorage miniTitlePositionOffset](appearanceStorage, "miniTitlePositionOffset");
  if (!v9)
    goto LABEL_12;
LABEL_10:
  -[NSValue UIOffsetValue](v9, "UIOffsetValue");
LABEL_13:
  if (horizontal != v10 || vertical != v11)
  {
    v12 = self->_appearanceStorage;
    if (a4 == 1)
    {
      *(double *)v14 = horizontal;
      *(double *)&v14[1] = vertical;
      objc_msgSend(v12, "setMiniTitlePositionOffset:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v14, "{UIOffset=dd}"));
    }
    else
    {
      *(double *)v13 = horizontal;
      *(double *)&v13[1] = vertical;
      objc_msgSend(v12, "setTitlePositionOffset:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v13, "{UIOffset=dd}"));
    }
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIOffset)_titlePositionAdjustmentForBarMetrics:(int64_t)a3
{
  double v3;
  id appearanceStorage;
  void *v5;
  double v6;
  double v7;
  double v8;
  UIOffset result;

  if ((unint64_t)(a3 - 101) <= 1)
  {
    v3 = 0.0;
    if ((_titlePositionAdjustmentForBarMetrics__didWarn_0 & 1) == 0)
    {
      _titlePositionAdjustmentForBarMetrics__didWarn_0 = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, "UIBarButtonItem", CFSTR("title position adjustment"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    goto LABEL_9;
  }
  appearanceStorage = self->_appearanceStorage;
  if (a3 != 1)
  {
    v5 = (void *)objc_msgSend(appearanceStorage, "titlePositionOffset");
    if (v5)
      goto LABEL_6;
LABEL_8:
    v3 = 0.0;
LABEL_9:
    v6 = 0.0;
    goto LABEL_10;
  }
  v5 = (void *)objc_msgSend(appearanceStorage, "miniTitlePositionOffset");
  if (!v5)
    goto LABEL_8;
LABEL_6:
  objc_msgSend(v5, "UIOffsetValue");
  v3 = v7;
LABEL_10:
  v8 = v3;
  result.vertical = v6;
  result.horizontal = v8;
  return result;
}

- (void)_applyBarButtonAppearanceStorage:(id)a3 withTaggedSelectors:(id)a4
{
  void *v6;
  void *v7;

  if (a4)
    objc_setAssociatedObject(self, &_UIAppearanceCustomizedSelectorsAssociationKey, a4, (void *)1);
  if (a3)
  {
    -[UIToolbarButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", objc_msgSend(a3, "backgroundImageForState:style:isMini:", 0, self->_style, 0), 0, self->_style, 0);
    -[UIToolbarButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", objc_msgSend(a3, "backgroundImageForState:style:isMini:", 1, self->_style, 0), 1, self->_style, 0);
    -[UIToolbarButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", objc_msgSend(a3, "backgroundImageForState:style:isMini:", 4, self->_style, 0), 4, self->_style, 0);
    -[UIToolbarButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", objc_msgSend(a3, "backgroundImageForState:style:isMini:", 2, self->_style, 0), 2, self->_style, 0);
    -[UIToolbarButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", objc_msgSend(a3, "backgroundImageForState:style:isMini:", 0, self->_style, 1), 0, self->_style, 1);
    -[UIToolbarButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", objc_msgSend(a3, "backgroundImageForState:style:isMini:", 1, self->_style, 1), 1, self->_style, 1);
    -[UIToolbarButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", objc_msgSend(a3, "backgroundImageForState:style:isMini:", 4, self->_style, 1), 4, self->_style, 1);
    -[UIToolbarButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", objc_msgSend(a3, "backgroundImageForState:style:isMini:", 2, self->_style, 1), 2, self->_style, 1);
    -[UIToolbarButton _setTintColor:](self, "_setTintColor:", objc_msgSend(a3, "tintColor"));
    -[UIToolbarButton _setTitleTextAttributes:forState:](self, "_setTitleTextAttributes:forState:", objc_msgSend(a3, "textAttributesForState:", 0), 0);
    -[UIToolbarButton _setTitleTextAttributes:forState:](self, "_setTitleTextAttributes:forState:", objc_msgSend(a3, "textAttributesForState:", 2), 2);
    -[UIToolbarButton _setTitleTextAttributes:forState:](self, "_setTitleTextAttributes:forState:", objc_msgSend(a3, "textAttributesForState:", 1), 1);
    v6 = (void *)objc_msgSend(a3, "titlePositionOffset");
    if (v6)
    {
      objc_msgSend(v6, "UIOffsetValue");
      -[UIToolbarButton _setTitlePositionAdjustment:forBarMetrics:](self, "_setTitlePositionAdjustment:forBarMetrics:", 0);
    }
    v7 = (void *)objc_msgSend(a3, "miniTitlePositionOffset");
    if (v7)
    {
      objc_msgSend(v7, "UIOffsetValue");
      -[UIToolbarButton _setTitlePositionAdjustment:forBarMetrics:](self, "_setTitlePositionAdjustment:forBarMetrics:", 1);
    }
    objc_msgSend(a3, "backgroundVerticalAdjustmentForBarMetrics:", 0);
    -[UIToolbarButton _setBackgroundVerticalPositionAdjustment:forBarMetrics:](self, "_setBackgroundVerticalPositionAdjustment:forBarMetrics:", 0);
    objc_msgSend(a3, "backgroundVerticalAdjustmentForBarMetrics:", 1);
    -[UIToolbarButton _setBackgroundVerticalPositionAdjustment:forBarMetrics:](self, "_setBackgroundVerticalPositionAdjustment:forBarMetrics:", 1);
  }
}

- (Class)_appearanceGuideClass
{
  return self->_appearanceGuideClass;
}

- (void)_setAppearanceGuideClass:(Class)a3
{
  self->_appearanceGuideClass = a3;
}

- (UIEdgeInsets)_additionalSelectionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->__additionalSelectionInsets.top;
  left = self->__additionalSelectionInsets.left;
  bottom = self->__additionalSelectionInsets.bottom;
  right = self->__additionalSelectionInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

@end
