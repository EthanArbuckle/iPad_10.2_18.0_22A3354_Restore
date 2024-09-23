@implementation UITextField

- (BOOL)_hasBaseline
{
  return 1;
}

- (void)didMoveToWindow
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  void *v7;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_2;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled");

    if (v6)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeASPVisualEffectsIfNecessary:", self);
      v3 = v7;
LABEL_2:

    }
  }
}

- (void)interactionTintColorDidChange
{
  void *v3;
  objc_super v4;

  v3 = (void *)_clearButtonImages;
  _clearButtonImages = 0;

  v4.receiver = self;
  v4.super_class = (Class)UITextField;
  -[UIView interactionTintColorDidChange](&v4, sel_interactionTintColorDidChange);
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
  v13.super_class = (Class)UITextField;
  -[UIView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11)
    -[UITextField _sizeChanged:](self, "_sizeChanged:", height != v11);
}

- (BOOL)_wantsBaselineUpdatingFollowingConstraintsPass
{
  objc_super v3;

  if ((*(_QWORD *)&self->super.super._viewFlags & 0x400000000000000) != 0
    && (*((_BYTE *)&self->_textFieldFlags + 3) & 0x80) != 0)
  {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)UITextField;
  return -[UIView _wantsBaselineUpdatingFollowingConstraintsPass](&v3, sel__wantsBaselineUpdatingFollowingConstraintsPass);
}

- (UIFont)font
{
  return -[_UICascadingTextStorage font](self->_textStorage, "font");
}

uint64_t __48__UITextField__addTextCanvasViewAdjustingFrame___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 960), "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 32), "_textCanvasViewFrameIncludingContentInsetsFromFontsWhenNotContainedByFieldEditor");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 960), "setFrame:");
  }
  return objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 960));
}

uint64_t __33__UITextField__attachFieldEditor__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "editRect");
  return objc_msgSend(v1, "setFrame:");
}

- (CGRect)_availableTextRectForBounds:(CGRect)a3 forEditing:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  int v9;
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
  CGFloat v21;
  double v22;
  float v23;
  double v24;
  UILabel *label;
  double v26;
  double v27;
  float v28;
  double v29;
  double v30;
  float v31;
  double v32;
  float v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  UITextFieldLabel *suffixLabel;
  void *v42;
  void *v43;
  double v44;
  double v45;
  UITextFieldLabel *prefixLabel;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  float v54;
  double v55;
  double MaxX;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double x;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect result;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  v9 = *((_DWORD *)&self->super.super._viewFlags + 4);
  x = a3.origin.x;
  -[UITextField _availableTextRectExcludingButtonsForBounds:](self, "_availableTextRectExcludingButtonsForBounds:");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[UITextField shadowBlur](self, "shadowBlur");
  if (v18 != 0.0)
  {
    v19 = v18;
    -[UITextField shadowOffset](self, "shadowOffset");
    v21 = -(fabs(v19) + fabs(v20));
    v68.origin.x = v11;
    v68.origin.y = v13;
    v68.size.width = v15;
    v68.size.height = v17;
    v69 = CGRectInset(v68, 0.0, v21);
    v11 = v69.origin.x;
    v13 = v69.origin.y;
    v15 = v69.size.width;
    v17 = v69.size.height;
  }
  if (self->_iconView)
  {
    -[UITextField iconRect](self, "iconRect");
    v23 = v22;
    v24 = v23;
    v11 = v11 + v24;
    v15 = v15 - v24;
  }
  label = self->_label;
  if (label)
  {
    -[UIView frame](label, "frame");
    if ((v9 & 0x80000) != 0)
    {
      v31 = v26;
      -[UIView bounds](self, "bounds");
      v33 = v32 - v31;
      v15 = v15 - v33;
      v11 = v31 - v15;
    }
    else
    {
      v28 = v27;
      -[UIView frame](self->_label, "frame");
      *(float *)&v29 = v29 + v28;
      v30 = *(float *)&v29;
      v11 = v11 + v30;
      v15 = v15 - v30;
    }
  }
  if (-[UITextField _showsLeftView](self, "_showsLeftView"))
  {
    -[UITextField leftViewRectForBounds:](self, "leftViewRectForBounds:", x, y, width, height);
    v65 = v34;
    v66 = v17;
    v35 = v13;
    v37 = v36;
    -[UITextField _baselineLeftViewRectForBounds:](self, "_baselineLeftViewRectForBounds:", x, y, width, height);
    v38 = v37 + v65;
    v13 = v35;
    v17 = v66;
    v40 = fmin(v15, v38 - v39);
    v11 = v11 + v40;
    v15 = v15 - v40;
  }
  suffixLabel = self->_suffixLabel;
  if (suffixLabel)
  {
    -[UILabel text](suffixLabel, "text");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel font](self->_suffixLabel, "font");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "_legacy_sizeWithFont:", v43);
    v45 = fmin(v15, v44);

    v15 = v15 - v45;
  }
  prefixLabel = self->_prefixLabel;
  if (prefixLabel)
  {
    -[UILabel text](prefixLabel, "text");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel font](self->_prefixLabel, "font");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "_legacy_sizeWithFont:", v48);
    v50 = fmin(v15, v49);

    v11 = v11 + v50;
    v15 = v15 - v50;
  }
  -[UITextField clearButtonRect](self, "clearButtonRect");
  v52 = v51;
  -[UITextField _clearButtonMarginX](self, "_clearButtonMarginX");
  v54 = v53 + v52;
  if ((v9 & 0x80000) == 0)
  {
    if (((UIKeyboardIsRightToLeftInputModeActive() & 1) != 0
       || -[_UICascadingTextStorage _ui_resolvedTextAlignment](self->_textStorage, "_ui_resolvedTextAlignment") == 2
       || -[UITextField _hasContent](self, "_hasContent"))
      && -[UITextField _showsClearButtonWhenNonEmpty:](self, "_showsClearButtonWhenNonEmpty:", v4)
      || !-[UITextField _hasContent](self, "_hasContent")
      && -[UITextField _showsClearButtonWhenEmpty](self, "_showsClearButtonWhenEmpty"))
    {
      v55 = v54;
    }
    else
    {
      if (!-[UITextField _showsRightView](self, "_showsRightView"))
        goto LABEL_33;
      -[UITextField rightViewRectForBounds:](self, "rightViewRectForBounds:", x, y, width, height);
      v55 = fmin(v15, v58);
    }
    goto LABEL_32;
  }
  if (-[UITextField _hasContent](self, "_hasContent")
    && -[UITextField _showsClearButtonWhenNonEmpty:](self, "_showsClearButtonWhenNonEmpty:", v4)
    || !-[UITextField _hasContent](self, "_hasContent")
    && -[UITextField _showsClearButtonWhenEmpty](self, "_showsClearButtonWhenEmpty"))
  {
    v15 = v15 - v54;
    v11 = v11 + v54;
  }
  if (-[UITextField _showsRightView](self, "_showsRightView"))
  {
    -[UIView bounds](self, "bounds");
    MaxX = CGRectGetMaxX(v70);
    -[UITextField rightViewRectForBounds:](self, "rightViewRectForBounds:", x, y, width, height);
    v55 = fmin(v15, MaxX - v57);
LABEL_32:
    v15 = v15 - v55;
  }
LABEL_33:
  if (v15 >= 0.0)
    v59 = v15;
  else
    v59 = 0.0;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v61 = UIRectIntegralWithScale(v11, v13, v59, v17, v60);
  result.size.height = v64;
  result.size.width = v63;
  result.origin.y = v62;
  result.origin.x = v61;
  return result;
}

- (BOOL)_hasContent
{
  void *v2;
  BOOL v3;

  -[UITextField _text](self, "_text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)_text
{
  void *v2;
  void *v3;

  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
  {
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSConcreteTextStorage string](self->_textStorage, "string");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (BOOL)_showsRightView
{
  uint64_t rightView;
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags;
  BOOL v5;
  int64_t rightViewMode;

  rightView = (uint64_t)self->_rightView;
  if (rightView)
  {
    textFieldFlags = self->_textFieldFlags;
    v5 = -[UITextField _hasContent](self, "_hasContent");
    rightViewMode = self->_rightViewMode;
    switch(rightViewMode)
    {
      case 3:
        LOBYTE(rightView) = 1;
        break;
      case 2:
        LOBYTE(rightView) = !v5;
        if (v5 && (*(_WORD *)&textFieldFlags & 0x100) == 0)
        {
          objc_opt_class();
          LOBYTE(rightView) = objc_opt_isKindOfClass() ^ 1;
        }
        break;
      case 1:
        rightView = (*(unint64_t *)&textFieldFlags >> 8) & 1;
        break;
      default:
        LOBYTE(rightView) = 0;
        break;
    }
  }
  return rightView & 1;
}

- (CGRect)clearButtonRectForBounds:(CGRect)bounds
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double MaxX;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double MinX;
  double v21;
  double v22;
  double v23;
  double MidY;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat rect;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect result;

  height = bounds.size.height;
  width = bounds.size.width;
  y = bounds.origin.y;
  x = bounds.origin.x;
  v8 = (CGFloat *)MEMORY[0x1E0C9D648];
  rect = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[UITextField _clearButtonSize:](self, "_clearButtonSize:", bounds.origin.x);
  v10 = v9;
  v12 = v11;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    MinX = CGRectGetMinX(v34);
    -[UITextField _clearButtonMarginX](self, "_clearButtonMarginX");
    UIRoundToViewScale(self);
    v22 = round(MinX + v21);
    -[UITextField clearButtonOffset](self, "clearButtonOffset");
    v19 = v22 - v23;
  }
  else
  {
    v13 = *v8;
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    MaxX = CGRectGetMaxX(v32);
    v33.origin.x = v13;
    v33.origin.y = rect;
    v33.size.width = v10;
    v33.size.height = v12;
    v15 = MaxX - CGRectGetWidth(v33);
    -[UITextField _clearButtonMarginX](self, "_clearButtonMarginX");
    UIRoundToViewScale(self);
    v17 = round(v15 - v16);
    -[UITextField clearButtonOffset](self, "clearButtonOffset");
    v19 = v17 + v18;
  }
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  MidY = CGRectGetMidY(v35);
  v36.origin.x = v19;
  v36.origin.y = rect;
  v36.size.width = v10;
  v36.size.height = v12;
  v25 = round(MidY - (CGRectGetHeight(v36) * 0.5 + 1.0));
  -[UITextField clearButtonOffset](self, "clearButtonOffset");
  v27 = v26 + v25;
  v28 = v19;
  v29 = v10;
  v30 = v12;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v27;
  result.origin.x = v28;
  return result;
}

- (CGSize)clearButtonOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_clearButtonOffset.width;
  height = self->_clearButtonOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)_clearButtonSize:(CGRect)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  _UITextFieldClearButton *clearButton;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[UIView traitCollection](self, "traitCollection", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  v6 = 0.0;
  v7 = 0.0;
  if (v5 != 6)
  {
    v6 = 19.0;
    if (_TextFieldScalesClearButton())
    {
      clearButton = self->_clearButton;
      v7 = 19.0;
      if (clearButton)
      {
        -[UIButton imageForState:](clearButton, "imageForState:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "size");
        v7 = v10;
        v6 = v11;

      }
    }
    else
    {
      v7 = 19.0;
    }
  }
  v12 = v7;
  v13 = v6;
  result.height = v13;
  result.width = v12;
  return result;
}

- (double)_clearButtonMarginX
{
  void *v2;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInterfaceIdiom");

  return 8.0;
}

- (BOOL)_showsLeftView
{
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags;
  BOOL v4;
  int64_t leftViewMode;
  _BOOL8 v6;

  if (!self->_leftView)
    goto LABEL_6;
  textFieldFlags = self->_textFieldFlags;
  v4 = -[UITextField _hasContent](self, "_hasContent");
  leftViewMode = self->_leftViewMode;
  if (leftViewMode == 3)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  if (leftViewMode != 2)
  {
    if (leftViewMode == 1)
      return (*(unint64_t *)&textFieldFlags >> 8) & 1;
LABEL_6:
    LOBYTE(v6) = 0;
    return v6;
  }
  LOBYTE(v6) = (*(_WORD *)&textFieldFlags & 0x100) == 0 || !v4;
  return v6;
}

- (CGRect)clearButtonRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIView bounds](self, "bounds");
  -[UITextField clearButtonRectForBounds:](self, "clearButtonRectForBounds:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)shadowBlur
{
  double result;

  -[_UICascadingTextStorage shadowBlur](self->_textStorage, "shadowBlur");
  return result;
}

- (CGRect)_availableTextRectExcludingButtonsForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
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

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UITextField _metricsProvider](self, "_metricsProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentFrameForBounds:", x, y, width, height);
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

- (id)_metricsProvider
{
  return self->_metricsProvider;
}

- (BOOL)_showsClearButtonWhenEmpty
{
  return 0;
}

- (BOOL)_showsClearButtonWhenNonEmpty:(BOOL)a3
{
  int v5;
  int v6;
  _BOOL4 v7;
  int v8;
  int v9;
  _BOOL4 v10;

  if (-[UITextField clearButtonMode](self, "clearButtonMode") == UITextFieldViewModeNever)
  {
    v5 = 1;
    goto LABEL_16;
  }
  if (-[UITextField clearButtonMode](self, "clearButtonMode") == UITextFieldViewModeAlways)
  {
    v5 = 0;
    goto LABEL_16;
  }
  if (-[UIView isFirstResponder](self, "isFirstResponder"))
  {
    v6 = 1;
    if (!a3)
    {
LABEL_7:
      v7 = -[UITextField _hasContent](self, "_hasContent");
      goto LABEL_10;
    }
  }
  else
  {
    v6 = *((_BYTE *)&self->_textFieldFlags + 1) & 1;
    if (!a3)
      goto LABEL_7;
  }
  v7 = 1;
LABEL_10:
  if (-[UITextField clearButtonMode](self, "clearButtonMode") == UITextFieldViewModeWhileEditing)
  {
    v5 = v6 & v7 ^ 1;
  }
  else
  {
    if (-[UITextField clearButtonMode](self, "clearButtonMode") == UITextFieldViewModeUnlessEditing)
      v8 = v6;
    else
      v8 = 0;
    v5 = v8 & v7;
  }
LABEL_16:
  v9 = *((_DWORD *)&self->super.super._viewFlags + 4);
  if ((v9 & 0x80000) != 0)
    v10 = -[UITextField _showsLeftView](self, "_showsLeftView");
  else
    v10 = -[UITextField _showsRightView](self, "_showsRightView");
  if (((v5 | v10) & 1) != 0)
    return 0;
  if (-[UITextField _currentTextAlignment](self, "_currentTextAlignment") == (((*(_QWORD *)&v9 & 0x80000uLL) >> 18) ^ 2)
    && !-[UITextField _hasContent](self, "_hasContent"))
  {
    return -[UITextField clearButtonMode](self, "clearButtonMode") == UITextFieldViewModeAlways;
  }
  return 1;
}

- (UITextFieldViewMode)clearButtonMode
{
  return self->_clearButtonMode;
}

- (id)_textContainer
{
  return self->_textContainer;
}

- (NSTextContainer)textContainer
{
  void *v3;
  id v4;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "_textLayoutController");

  return (NSTextContainer *)-[UITextField _textContainer](self, "_textContainer");
}

- (CGPoint)textContainerOrigin
{
  double v2;
  double v3;
  CGPoint result;

  -[UIFieldEditor textContainerOrigin](self->_fieldEditor, "textContainerOrigin");
  result.y = v3;
  result.x = v2;
  return result;
}

- (UIScrollView)enclosingScrollView
{
  return 0;
}

- (CGRect)_clipRectForFadedEdges
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (objc_msgSend((id)objc_opt_class(), "_wantsFadedEdges")
    && !-[UITextField _fieldEditorAttached](self, "_fieldEditorAttached"))
  {
    -[_UITextCanvas bounds](self->_textCanvasView, "bounds");
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D628];
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)textInRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UITextField _shouldObscureInput](self, "_shouldObscureInput");
  v8 = v6;
  v9 = v8;
  if (v8 && v7)
    v10 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "_newZStringWithString:", v8);
  else
    v10 = v8;
  v11 = v10;

  return v11;
}

- (BOOL)_shouldObscureInput
{
  int v3;

  v3 = -[UITextField isSecureTextEntry](self, "isSecureTextEntry");
  if (v3)
  {
    if ((-[UITextField displaySecureTextUsingPlainText](self, "displaySecureTextUsingPlainText") & 1) != 0)
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[UITextField _shouldUnobscureTextWithContentCover](self, "_shouldUnobscureTextWithContentCover");
  }
  return v3;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;

  v6 = a4;
  v7 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "comparePosition:toPosition:", v7, v6);

  return v9;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "positionFromPosition:offset:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (UIFieldEditor)_fieldEditor
{
  UIFieldEditor *fieldEditor;
  UIFieldEditor *v4;
  UIFieldEditor *v5;

  fieldEditor = self->_fieldEditor;
  if (!fieldEditor)
  {
    v4 = (UIFieldEditor *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_fieldEditorClass")), "initWithTextField:", self);
    v5 = self->_fieldEditor;
    self->_fieldEditor = v4;

    fieldEditor = self->_fieldEditor;
  }
  return fieldEditor;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textRangeFromPosition:toPosition:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (UITextPosition)beginningOfDocument
{
  void *v2;
  void *v3;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginningOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextPosition *)v3;
}

+ (BOOL)_wantsFadedEdges
{
  return 0;
}

- (void)textContainerUsageDidChangeToSize:(CGSize)a3
{
  -[UIFieldEditor textContainerUsageDidChangeToSize:](self->_fieldEditor, "textContainerUsageDidChangeToSize:", a3.width, a3.height);
}

+ (Class)_fieldEditorClass
{
  return (Class)objc_opt_class();
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", a3))
  {
    -[UITextField textInputTraits](self, "textInputTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITextField;
    -[UITextField forwardingTargetForSelector:](&v7, sel_forwardingTargetForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITextField;
  if (-[UITextField respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[UITextField textInputTraits](self, "textInputTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (id)textInputTraits
{
  UITextInputTraits *traits;
  UITextInputTraits *v4;
  UITextInputTraits *v5;
  UITextInputTraits *nonAtomTraits;
  UITextInputTraits *v7;
  void *v8;
  UITextInputTraits *v9;
  void *v10;
  UITextInputTraits *v11;
  void *v12;

  traits = self->_traits;
  if (!traits)
  {
    v4 = objc_alloc_init(UITextInputTraits);
    v5 = self->_traits;
    self->_traits = v4;

    traits = self->_traits;
  }
  -[UITextInputTraits setIsSingleLineDocument:](traits, "setIsSingleLineDocument:", 1);
  nonAtomTraits = self->_nonAtomTraits;
  if (nonAtomTraits)
  {
    -[UITextInputTraits setTextSelectionBehavior:](self->_traits, "setTextSelectionBehavior:", -[UITextInputTraits textSelectionBehavior](nonAtomTraits, "textSelectionBehavior"));
    v7 = self->_traits;
    -[UITextInputTraits insertionPointColor](self->_nonAtomTraits, "insertionPointColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputTraits setInsertionPointColor:](v7, "setInsertionPointColor:", v8);

    v9 = self->_traits;
    -[UITextInputTraits selectionHighlightColor](self->_nonAtomTraits, "selectionHighlightColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputTraits setSelectionHighlightColor:](v9, "setSelectionHighlightColor:", v10);

    v11 = self->_traits;
    -[UITextInputTraits selectionDragDotImage](self->_nonAtomTraits, "selectionDragDotImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputTraits setSelectionDragDotImage:](v11, "setSelectionDragDotImage:", v12);

    -[UITextInputTraits setTextLoupeVisibility:](self->_traits, "setTextLoupeVisibility:", -[UITextInputTraits textLoupeVisibility](self->_nonAtomTraits, "textLoupeVisibility"));
  }
  return self->_traits;
}

- (int)textSelectionBehavior
{
  if (-[UITextField clearsOnInsertion](self, "clearsOnInsertion"))
    return 3;
  else
    return -[UITextInputTraits textSelectionBehavior](self->_traits, "textSelectionBehavior");
}

- (BOOL)clearsOnInsertion
{
  return (*((unsigned __int8 *)&self->_textFieldFlags + 2) >> 3) & 1;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  if ((*((_BYTE *)&self->_textFieldFlags + 4) & 0x40) != 0)
  {
    -[UITextField textRectForBounds:](self, "textRectForBounds:", 0.0, 0.0, 100.0, 100.0);
    if (v5 == 0.0 && 100.0 - (v5 + v6) == 0.0 && self->_padding.left == 0.0)
    {
      v3 = 0.0;
      if (self->_padding.right == 0.0)
      {
        -[UITextField _applicableContentOutsetsFromFontsOversize:extremeSizing:]((uint64_t)self, 1, 0);
        v3 = v7 + 0.0;
        v2 = v8 + 0.0;
      }
    }
    else
    {
      v3 = 0.0;
    }
  }
  v9 = 0.0;
  v10 = 0.0;
  v11 = v2;
  result.right = v11;
  result.bottom = v10;
  result.left = v3;
  result.top = v9;
  return result;
}

- (UILabel)_placeholderLabel
{
  return (UILabel *)self->_placeholderLabel;
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UITextField _availableTextRectForBounds:forEditing:](self, "_availableTextRectForBounds:forEditing:", 0, bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)_hasSuffixField
{
  return self->_suffixLabel != 0;
}

- (float)paddingLeft
{
  return self->_padding.left;
}

- (BOOL)_fieldEditorAttached
{
  return *((_BYTE *)&self->_textFieldFlags + 1) & 1;
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UITextField _availableTextRectForBounds:forEditing:](self, "_availableTextRectForBounds:forEditing:", 1, bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
  double height;
  double width;
  double y;
  double x;
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
  UIControlContentVerticalAlignment v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  height = bounds.size.height;
  width = bounds.size.width;
  y = bounds.origin.y;
  x = bounds.origin.x;
  if (-[UITextField isEditing](self, "isEditing"))
    -[UITextField editingRectForBounds:](self, "editingRectForBounds:", x, y, width, height);
  else
    -[UITextField textRectForBounds:](self, "textRectForBounds:", x, y, width, height);
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  -[UILabel textRectForBounds:](self->_placeholderLabel, "textRectForBounds:", x, y, width, height);
  v17 = v16;
  v18 = -[UIControl contentVerticalAlignment](self, "contentVerticalAlignment");
  if (v18 != UIControlContentVerticalAlignmentTop)
  {
    v19 = v15 - v17;
    if (v18 != UIControlContentVerticalAlignmentBottom)
      UIRoundToViewScale(self);
    v13 = v13 + v19;
  }
  v20 = v12;
  v21 = v13;
  v22 = v14;
  v23 = v17;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (float)paddingRight
{
  return self->_padding.right;
}

- (void)setRightViewMode:(UITextFieldViewMode)rightViewMode
{
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
    -[UITextField _setActualLeftViewMode:](self, "_setActualLeftViewMode:", rightViewMode);
  else
    -[UITextField _setActualRightViewMode:](self, "_setActualRightViewMode:", rightViewMode);
}

- (void)_setActualRightViewMode:(int64_t)a3
{
  if (self->_rightViewMode != a3)
  {
    self->_rightViewMode = a3;
    -[UITextField _showSymbolAnimatableRightViewNowIfNeeded](self, "_showSymbolAnimatableRightViewNowIfNeeded");
    -[UITextField setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_showSymbolAnimatableRightViewNowIfNeeded
{
  if (-[UITextField _showsRightView](self, "_showsRightView"))
  {
    if (-[UITextField _isAccessoryViewAnimatable:](self, "_isAccessoryViewAnimatable:", self->_rightView))
      -[UITextField _transitionFromAccessoryView:toView:allowingAnimation:](self, "_transitionFromAccessoryView:toView:allowingAnimation:", 0, self->_rightView, 0);
  }
}

- (BOOL)_isAccessoryViewAnimatable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (-[UIControl _allowsSymbolAnimations](self, "_allowsSymbolAnimations"))
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "_imageViewIfNeeded");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "image");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isSymbolImage");

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

- (void)setRightView:(UIView *)rightView
{
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
    -[UITextField _setActualLeftView:](self, "_setActualLeftView:", rightView);
  else
    -[UITextField _setActualRightView:](self, "_setActualRightView:", rightView);
}

- (void)_setActualRightView:(id)a3
{
  UIView *v5;
  UIView **p_rightView;
  void *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  p_rightView = &self->_rightView;
  if (self->_rightView != v5)
  {
    v8 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIView _setProxyPointerInteraction:](*p_rightView, "_setProxyPointerInteraction:", 0);
    -[UIView _setOverrideUserInterfaceRenderingMode:](*p_rightView, "_setOverrideUserInterfaceRenderingMode:", -1);
    -[UITextField _transitionFromAccessoryView:toView:allowingAnimation:](self, "_transitionFromAccessoryView:toView:allowingAnimation:", *p_rightView, 0, 0);
    objc_storeStrong((id *)&self->_rightView, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIControl pointerInteraction](self, "pointerInteraction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _setProxyPointerInteraction:](*p_rightView, "_setProxyPointerInteraction:", v7);

    }
    -[UIView _setOverrideUserInterfaceRenderingMode:](*p_rightView, "_setOverrideUserInterfaceRenderingMode:", 1);
    -[UITextField _showSymbolAnimatableRightViewNowIfNeeded](self, "_showSymbolAnimatableRightViewNowIfNeeded");
    -[UITextField setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)_setMetricsProvider:(id)a3
{
  _UITextFieldBackgroundProvider *v5;
  _UITextFieldBackgroundProvider *backgroundProvider;
  _UITextFieldMetricsProvider *metricsProvider;
  _UITextFieldMetricsProvider *v8;
  BOOL v9;
  _UITextFieldBackgroundProvider *v10;

  v5 = (_UITextFieldBackgroundProvider *)a3;
  backgroundProvider = self->_backgroundProvider;
  metricsProvider = self->_metricsProvider;
  v10 = v5;
  v8 = metricsProvider;
  if (v8 == (_UITextFieldMetricsProvider *)v10)
  {

  }
  else
  {
    if (!v10 || !v8)
    {

LABEL_10:
      -[UITextField _metricsProviderWillChange:](self, "_metricsProviderWillChange:", v10);
      objc_storeStrong((id *)&self->_metricsProvider, a3);
      -[UITextField _metricsProviderDidChange](self, "_metricsProviderDidChange");
LABEL_11:
      -[UITextField _setNeedsStyleRecalc](self, "_setNeedsStyleRecalc");
      -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      -[UIView _invalidateBaselineConstraints](self, "_invalidateBaselineConstraints");
      goto LABEL_12;
    }
    v9 = -[_UITextFieldBackgroundProvider isEqual:](v10, "isEqual:", v8);

    if (!v9)
      goto LABEL_10;
  }
  if (backgroundProvider == v5)
    goto LABEL_11;
LABEL_12:

}

- (void)setNeedsLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITextField;
  -[UIView setNeedsLayout](&v3, sel_setNeedsLayout);
  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
    -[UIScrollView setNeedsLayout](self->_fieldEditor, "setNeedsLayout");
}

- (void)_invalidateAllGlyphsAndTextLayout
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  -[UITextField textLayoutController](self, "textLayoutController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEmpty") & 1) == 0)
  {
    objc_msgSend(v3, "invalidateLayoutForRange:", v4);
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
  -[UIView _invalidateBaselineConstraints](self, "_invalidateBaselineConstraints");
  if (-[UIView _shouldNotifyGeometryObserversForBaselineChanges](self, "_shouldNotifyGeometryObserversForBaselineChanges"))
  {
    v23 = 0;
    v22 = 0u;
    v21 = 0u;
    v20 = 0u;
    v19 = 0u;
    v18 = 0u;
    v17 = 0u;
    v16 = 0u;
    v15 = 0u;
    v14 = 0u;
    v13 = 0u;
    v12 = 0u;
    v11 = 0u;
    v10 = 0u;
    v9 = 0u;
    v8 = 2048;
    -[UIView _notifyGeometryObserversWithChangeInfo:]((uint64_t)self, &v8);
  }
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 2) != 0)
  {
    -[UIView superview](self, "superview");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5 && (*(_QWORD *)(v5 + 104) & 0x8000000000000000) == 0)
    {
      -[UIView superview](self, "superview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNeedsLayout");

    }
  }

}

- (id)_textLayoutController
{
  return self->_textLayoutController;
}

- (CGPoint)_originForTextFieldLabel:(id)a3
{
  UITextFieldLabel *v4;
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
  float v16;
  float v17;
  double left;
  double v19;
  double v21;
  double v22;
  double v23;
  CGPoint result;
  CGRect v25;

  v4 = (UITextFieldLabel *)a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = self;
  objc_msgSend(v6, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[UITextField _marginTopForBounds:](self, "_marginTopForBounds:", v9, v11, v13, v15);
  v17 = v16;
  left = self->_padding.left;
  if ((*((_BYTE *)&self->_textFieldFlags + 4) & 0x40) != 0 && left == 0.0)
  {
    -[UITextField _availableTextRectForBounds:forEditing:](self, "_availableTextRectForBounds:forEditing:", -[UITextField isEditing](self, "isEditing"), v9, v11, v13, v15);
    -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:");
    left = left + CGRectGetMinX(v25);
  }
  v19 = v17;
  if (self->_placeholderLabel == v4 || v4 == 0)
    v21 = left;
  else
    v21 = 0.0;

  v22 = v21;
  v23 = v19;
  result.y = v23;
  result.x = v22;
  return result;
}

- (float)_marginTopForBounds:(CGRect)a3
{
  void *v4;
  _UICascadingTextStorage *v5;
  void *v6;
  double v7;
  float v8;
  double v9;
  float v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  double v16;

  if ((*(_BYTE *)&self->_textFieldFlags & 1) != 0
    || -[UIControl contentVerticalAlignment](self, "contentVerticalAlignment", a3.origin.x, a3.origin.y, a3.size.width) == UIControlContentVerticalAlignmentCenter
    || -[UIControl contentVerticalAlignment](self, "contentVerticalAlignment") == UIControlContentVerticalAlignmentBottom)
  {
    -[UITextField font](self, "font", a3.origin.x, a3.origin.y, a3.size.width);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lineHeight");

    -[UITextField textRectForBounds:](self, "textRectForBounds:", 0.0, 0.0, 100.0, 100.0);
    -[UIControl contentVerticalAlignment](self, "contentVerticalAlignment");
  }
  else
  {
    v5 = self->_textStorage;
    -[_UICascadingTextStorage font](v5, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pointSize");
    v8 = v7;

    -[UITextField _fullFontSize](self, "_fullFontSize");
    v10 = v9;
    if (v10 > v8)
    {
      -[_UICascadingTextStorage font](v5, "font");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v12 = v10;
      *(float *)&v13 = v10;
      v14 = -[UITextField _copyFont:newSize:maxSize:](self, "_copyFont:newSize:maxSize:", v11, v12, v13);

      objc_msgSend(v14, "ascender");
      -[_UICascadingTextStorage font](v5, "font");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ascender");

    }
  }
  UIRoundToViewScale(self);
  return v16;
}

- (id)_textCanvasView
{
  return self->_textCanvasView;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  $1DC6EB69857CC9E7E7608875A7943F0A *p_viewFlags;
  int v5;
  UIView *rightView;
  UIView *v7;
  int64_t leftViewMode;
  double width;
  CGFloat height;
  CGFloat v11;
  objc_super v12;

  p_viewFlags = &self->super.super._viewFlags;
  v5 = *((_DWORD *)&self->super.super._viewFlags + 4);
  v12.receiver = self;
  v12.super_class = (Class)UITextField;
  -[UIView setSemanticContentAttribute:](&v12, sel_setSemanticContentAttribute_, a3);
  if (((*((_DWORD *)p_viewFlags + 4) ^ v5) & 0x80000) != 0)
  {
    rightView = self->_rightView;
    v7 = self->_leftView;
    -[UITextField _setActualLeftView:](self, "_setActualLeftView:", rightView);
    -[UITextField _setActualRightView:](self, "_setActualRightView:", v7);
    leftViewMode = self->_leftViewMode;
    -[UITextField _setActualLeftViewMode:](self, "_setActualLeftViewMode:", self->_rightViewMode);
    -[UITextField _setActualRightViewMode:](self, "_setActualRightViewMode:", leftViewMode);
    width = self->_leftViewOffset.width;
    height = self->_leftViewOffset.height;
    v11 = self->_rightViewOffset.height;
    self->_leftViewOffset.width = -self->_rightViewOffset.width;
    self->_leftViewOffset.height = v11;
    self->_rightViewOffset.width = -width;
    self->_rightViewOffset.height = height;

  }
}

- (void)setBorderStyle:(UITextBorderStyle)borderStyle
{
  if (self->_preferredBorderStyle != borderStyle)
  {
    self->_preferredBorderStyle = borderStyle;
    -[UITextField _invalidateBackgroundProvider](self, "_invalidateBackgroundProvider");
    -[_UITextFieldBackgroundProvider borderStyleDidChange:](self->_backgroundProvider, "borderStyleDidChange:", 0);
  }
}

- (void)setClearButtonMode:(UITextFieldViewMode)clearButtonMode
{
  if (self->_clearButtonMode != clearButtonMode)
  {
    self->_clearButtonMode = clearButtonMode;
    -[UITextField setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLeftViewMode:(UITextFieldViewMode)leftViewMode
{
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
    -[UITextField _setActualRightViewMode:](self, "_setActualRightViewMode:", leftViewMode);
  else
    -[UITextField _setActualLeftViewMode:](self, "_setActualLeftViewMode:", leftViewMode);
}

- (void)_setActualLeftViewMode:(int64_t)a3
{
  if (self->_leftViewMode != a3)
  {
    self->_leftViewMode = a3;
    -[UITextField _showSymbolAnimatableLeftViewNowIfNeeded](self, "_showSymbolAnimatableLeftViewNowIfNeeded");
    -[UITextField setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_showSymbolAnimatableLeftViewNowIfNeeded
{
  if (-[UITextField _showsLeftView](self, "_showsLeftView"))
  {
    if (-[UITextField _isAccessoryViewAnimatable:](self, "_isAccessoryViewAnimatable:", self->_leftView))
      -[UITextField _transitionFromAccessoryView:toView:allowingAnimation:](self, "_transitionFromAccessoryView:toView:allowingAnimation:", 0, self->_leftView, 0);
  }
}

- (double)_foregroundViewsAlpha
{
  return self->_foregroundViewsAlpha;
}

- (void)_invalidateBackgroundProvider
{
  -[UITextField _invalidateBackgroundProviderForced:](self, "_invalidateBackgroundProviderForced:", 0);
}

- (id)_initWithFrame:(CGRect)a3 textLayoutManagerEnabled:(BOOL)a4
{
  _BOOL4 v4;
  UITextField *v5;
  uint64_t v6;
  _UITextFieldVisualStyle *visualStyle;
  CGFloat v8;
  uint64_t v9;
  void *v10;
  UITextField *v11;
  void *v12;
  double v13;
  _QWORD v15[4];
  UITextField *v16;
  objc_super v17;

  v4 = a4;
  v17.receiver = self;
  v17.super_class = (Class)UITextField;
  v5 = -[UIControl initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    +[_UITextFieldVisualStyle inferredVisualStyleWithStyleSubject:](_UITextFieldVisualStyle, "inferredVisualStyleWithStyleSubject:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    visualStyle = v5->_visualStyle;
    v5->_visualStyle = (_UITextFieldVisualStyle *)v6;

    -[UITextField _setupDefaultStyleEffectConfiguration](v5, "_setupDefaultStyleEffectConfiguration");
    v5->_preferredBorderStyle = 0;
    v5->_preferredBackgroundCornerRadius = 5.0;
    -[UITextField _invalidateBackgroundProviderForced:](v5, "_invalidateBackgroundProviderForced:", 1);
    v5->_tvUseVibrancy = 1;
    -[UIView setOpaque:](v5, "setOpaque:", 0);
    -[UITextField _clearButtonPadX](v5, "_clearButtonPadX");
    v5->_clearButtonOffset.width = v8;
    v5->_clearButtonOffset.height = 1.0;
    v9 = 32;
    if (v4)
      v9 = 0x1000000020;
    v5->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&v5->_textFieldFlags & 0xFFFFFFEFFFFFFFFFLL | v9);
    -[UIControl setContentHorizontalAlignment:](v5, "setContentHorizontalAlignment:", 1);
    -[UITextField setContentVerticalAlignment:](v5, "setContentVerticalAlignment:", 0);
    *(_QWORD *)&v5->_textFieldFlags |= 0x100000000000uLL;
    +[_UIFullFontSize defaultValue](_UIFullFontSize, "defaultValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField _setFullFontSize:](v5, "_setFullFontSize:", v10);

    -[UITextField _initTextStorage](v5, "_initTextStorage");
    -[UITextField _initTextLayoutController](v5, "_initTextLayoutController");
    -[UITextField _initTextCanvasView](v5, "_initTextCanvasView");
    v5->_foregroundViewsAlpha = 1.0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__UITextField__initWithFrame_textLayoutManagerEnabled___block_invoke;
    v15[3] = &unk_1E16B1B28;
    v11 = v5;
    v16 = v11;
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v15);

    LODWORD(v10) = dyld_program_sdk_at_least();
    -[UITextField _contentView](v11, "_contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClipsToBounds:", v10 ^ 1);

    objc_msgSend(off_1E167A828, "systemMinimumFontSize");
    v11->_minimumFontSize = v13;
    *(_QWORD *)&v5->_textFieldFlags |= 0x10000000uLL;
    -[UITextField _detectCustomDrawing](v11, "_detectCustomDrawing");
    -[UITextField _initIncreasedContrastNotifications](v11, "_initIncreasedContrastNotifications");
    -[UIControl setSymbolAnimationEnabled:](v11, "setSymbolAnimationEnabled:", 1);
  }
  return v5;
}

- (void)_invalidateBackgroundProviderForced:(BOOL)a3
{
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = -[UITextField _preferredBackgroundProviderClass](self, "_preferredBackgroundProviderClass");
  if (a3
    || (-[UITextField _backgroundProvider](self, "_backgroundProvider"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_opt_class(),
        v6,
        v5 != (objc_class *)v7))
  {
    v8 = (void *)objc_opt_new();
    if (v8)
    {
      -[UITextField _setBackgroundProvider:](self, "_setBackgroundProvider:", v8);
    }
    else
    {
      v9 = (void *)objc_opt_new();
      -[UITextField _setBackgroundProvider:](self, "_setBackgroundProvider:", v9);

    }
  }
  -[UITextField _invalidateMetricsProvider](self, "_invalidateMetricsProvider");
}

- (Class)_preferredBackgroundProviderClass
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  void *v12;
  unint64_t preferredBorderStyle;
  __CFString *v14;

  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 5)
    goto LABEL_5;
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "userInterfaceIdiom") == 2)
  {

LABEL_5:
    v9 = (void *)objc_opt_class();
    goto LABEL_6;
  }
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 8 || -[UITextField _isPasscodeStyle](self, "_isPasscodeStyle"))
    goto LABEL_5;
  switch(self->_preferredBorderStyle)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      goto LABEL_5;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      preferredBorderStyle = self->_preferredBorderStyle;
      if (preferredBorderStyle > 3)
        v14 = 0;
      else
        v14 = off_1E16E64F0[preferredBorderStyle];
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextField.m"), 5069, CFSTR("No background provider for border style %@."), v14);

      v9 = 0;
      break;
  }
LABEL_6:
  if (self->_background && (objc_msgSend(v9, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    v9 = (void *)objc_opt_class();
  return (Class)v9;
}

- (BOOL)_isPasscodeStyle
{
  void *v3;
  BOOL v4;

  -[UITextField textInputTraits](self, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "keyboardAppearance") == 127 && (*((_BYTE *)&self->_textFieldFlags + 2) & 0x10) == 0;

  return v4;
}

- (void)_setBackgroundProvider:(id)a3
{
  id v4;
  _UITextFieldBackgroundProvider *backgroundProvider;
  _UITextFieldBackgroundProvider *v6;
  _UITextFieldBackgroundProvider *v7;
  _UITextFieldBackgroundProvider *v8;
  BOOL v9;
  void (**v10)(_QWORD);
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  UITextField *v19;
  _UITextFieldBackgroundProvider *v20;

  v4 = a3;
  backgroundProvider = self->_backgroundProvider;
  v6 = (_UITextFieldBackgroundProvider *)v4;
  v7 = backgroundProvider;
  if (v7 == v6)
  {

  }
  else
  {
    v8 = v7;
    if (v6 && v7)
    {
      v9 = -[_UITextFieldBackgroundProvider isEqual:](v6, "isEqual:", v7);

      if (v9)
        goto LABEL_16;
    }
    else
    {

    }
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __38__UITextField__setBackgroundProvider___block_invoke;
    v18 = &unk_1E16B1B50;
    v19 = self;
    v20 = v6;
    v10 = (void (**)(_QWORD))_Block_copy(&v15);
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled", v15, v16, v17, v18, v19))
    {
      +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", self, 5242880, v10, 0, 0.35);
    }
    else
    {
      v10[2](v10);
    }
    v11 = objc_opt_respondsToSelector();
    v12 = 0x200000000;
    if ((v11 & 1) == 0)
      v12 = 0;
    self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFFFFDFFFFFFFFLL | v12);
    v13 = objc_opt_respondsToSelector();
    v14 = 0x400000000;
    if ((v13 & 1) == 0)
      v14 = 0;
    self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFFFFBFFFFFFFFLL | v14);
    -[_UITextFieldBackgroundProvider setNeedsDisplay](self->_backgroundProvider, "setNeedsDisplay");

  }
LABEL_16:

}

void __38__UITextField__setBackgroundProvider___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  void *v4;
  id v5;

  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 944);
  v2 = objc_msgSend(v5, "drawsContent");
  v3 = v2 ^ objc_msgSend(*(id *)(a1 + 40), "drawsContent");
  if (v3 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_backgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_backgroundProviderWillChange:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "removeFromTextField");
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 944), *(id *)(a1 + 40));
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_setBackgroundColor:", v4);
  objc_msgSend(*(id *)(a1 + 40), "addToTextField:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_backgroundProviderDidChange");

}

- (void)_invalidateMetricsProvider
{
  uint64_t v3;
  void *v4;
  id v5;

  -[UITextField _preferredMetricsProvider](self, "_preferredMetricsProvider");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (v3)
  {
    -[UITextField _setMetricsProvider:](self, "_setMetricsProvider:", v3);
  }
  else
  {
    v4 = (void *)objc_opt_new();
    -[UITextField _setMetricsProvider:](self, "_setMetricsProvider:", v4);

  }
}

- (id)_preferredMetricsProvider
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v8;
  void *v9;
  unint64_t preferredBorderStyle;
  __CFString *v11;

  -[UITextField _backgroundProvider](self, "_backgroundProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredMetricsProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    switch(self->_preferredBorderStyle)
    {
      case 0:
        v6 = objc_opt_new();
        goto LABEL_7;
      case 1:
        +[_UITextFieldLineBackgroundProvider lineStyleMetricsProvider](_UITextFieldLineBackgroundProvider, "lineStyleMetricsProvider");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 2:
        +[_UITextFieldBezelBackgroundProvider bezelStyleMetricsProvider](_UITextFieldBezelBackgroundProvider, "bezelStyleMetricsProvider");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 3:
        +[_UITextFieldSystemBackgroundProvider systemStyleMetricsProvider](_UITextFieldSystemBackgroundProvider, "systemStyleMetricsProvider");
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
        v5 = (void *)v6;
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        preferredBorderStyle = self->_preferredBorderStyle;
        if (preferredBorderStyle > 3)
          v11 = 0;
        else
          v11 = off_1E16E64F0[preferredBorderStyle];
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextField.m"), 5091, CFSTR("No metrics provider for border style %@."), v11);

        v5 = 0;
        break;
    }
  }
  return v5;
}

- (id)_backgroundProvider
{
  return self->_backgroundProvider;
}

- (void)setClipsToBounds:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITextField;
  -[UIView setClipsToBounds:](&v4, sel_setClipsToBounds_, a3);
  -[UIScrollView setNeedsLayout](self->_fieldEditor, "setNeedsLayout");
}

- (void)_initIncreasedContrastNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__increaseContrastSettingChanged_, CFSTR("UIAccessibilityDarkerSystemColorsStatusDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__increaseContrastSettingChanged_, CFSTR("UIAccessibilityReduceTransparencyStatusDidChangeNotification"), 0);

}

- (void)_detectCustomDrawing
{
  uint64_t v3;

  if (qword_1ECD7A1F8 != -1)
    dispatch_once(&qword_1ECD7A1F8, &__block_literal_global_571);
  v3 = -[UITextField methodForSelector:](self, "methodForSelector:", sel_drawRect_);
  self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFFFFFFFFFBFFFLL | ((unint64_t)(v3 != qword_1ECD7A1F0) << 14));
}

- (void)setContentVerticalAlignment:(int64_t)a3
{
  objc_super v5;

  if (-[UIControl contentVerticalAlignment](self, "contentVerticalAlignment") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UITextField;
    -[UIControl setContentVerticalAlignment:](&v5, sel_setContentVerticalAlignment_, a3);
    -[UITextField _setNeedsStyleRecalc](self, "_setNeedsStyleRecalc");
    -[UIView _invalidateBaselineConstraints](self, "_invalidateBaselineConstraints");
  }
}

- (void)_initTextStorage
{
  _UICascadingTextStorage *v3;
  void *v4;
  void *v5;
  _UICascadingTextStorage *textStorage;

  v3 = (_UICascadingTextStorage *)objc_opt_new();
  -[_UITextFieldVisualStyle defaultTextColor](self->_visualStyle, "defaultTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICascadingTextStorage setTextColor:](v3, "setTextColor:", v4);

  -[_UICascadingTextStorage setTextAlignment:](v3, "setTextAlignment:", 4);
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICascadingTextStorage _setIntentResolver:](self->_textStorage, "_setIntentResolver:", v5);

  textStorage = self->_textStorage;
  self->_textStorage = v3;

}

- (void)_setTextColor:(id)a3
{
  -[_UICascadingTextStorage setTextColor:](self->_textStorage, "setTextColor:", a3);
  -[UITextField _updateLabelAppearance](self, "_updateLabelAppearance");
}

- (void)_initTextLayoutController
{
  NSTextContainer *v3;
  NSTextContainer *v4;
  id *v5;
  void *v6;
  _UITextKit2LayoutController *v7;
  _UITextLayoutController *textLayoutController;
  NSTextContainer *v9;
  NSTextContainer *textContainer;
  void *v11;
  void *v12;
  _UIObscurableTextContentStorage *v13;

  if ((*((_BYTE *)&self->_textFieldFlags + 4) & 0x10) != 0)
  {
    v13 = -[_UIObscurableTextContentStorage initWithTextStorage:]([_UIObscurableTextContentStorage alloc], "initWithTextStorage:", self->_textStorage);
    v6 = (void *)objc_opt_new();
    v7 = -[_UITextKit2LayoutController initWithTextView:textContentStorage:textContainer:]([_UITextKit2LayoutController alloc], "initWithTextView:textContentStorage:textContainer:", 0, v13, v6);
    textLayoutController = self->_textLayoutController;
    self->_textLayoutController = (_UITextLayoutController *)v7;

    -[_UITextLayoutController firstTextContainer](self->_textLayoutController, "firstTextContainer");
    v9 = (NSTextContainer *)objc_claimAutoreleasedReturnValue();
    textContainer = self->_textContainer;
    self->_textContainer = v9;

    -[NSTextContainer textLayoutManager](self->_textContainer, "textLayoutManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUsesFontLeading:", 0);

    -[NSTextContainer textLayoutManager](self->_textContainer, "textLayoutManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLimitsLayoutForSuspiciousContents:", 1);

  }
  else
  {
    v3 = (NSTextContainer *)objc_alloc_init((Class)off_1E1679D30);
    v4 = self->_textContainer;
    self->_textContainer = v3;

    v13 = objc_alloc_init(_UIFieldEditorLayoutManager);
    -[_UIObscurableTextContentStorage setUsesFontLeading:](v13, "setUsesFontLeading:", 0);
    if (dyld_program_sdk_at_least())
      -[_UIObscurableTextContentStorage setLimitsLayoutForSuspiciousContents:](v13, "setLimitsLayoutForSuspiciousContents:", 1);
    -[_UICascadingTextStorage addLayoutManager:](self->_textStorage, "addLayoutManager:", v13);
    -[_UIObscurableTextContentStorage addTextContainer:](v13, "addTextContainer:", self->_textContainer);
    v5 = -[_UITextKit1LayoutController initWithTextView:textContainer:]((id *)[_UITextKit1LayoutController alloc], 0, self->_textContainer);
    v6 = self->_textLayoutController;
    self->_textLayoutController = (_UITextLayoutController *)v5;
  }

}

- (void)_initTextCanvasView
{
  _UITextCanvas *v3;
  _UITextCanvas *textCanvasView;

  -[_UICollectionCompositionalLayoutSolverOptions setLayoutAttributesClass:]((uint64_t)self->_textLayoutController, -[UITextField _canvasViewClass](self, "_canvasViewClass"));
  -[_UITextLayoutController dequeueCanvasViewForTextContainer:](self->_textLayoutController, "dequeueCanvasViewForTextContainer:", self->_textContainer);
  v3 = (_UITextCanvas *)objc_claimAutoreleasedReturnValue();
  textCanvasView = self->_textCanvasView;
  self->_textCanvasView = v3;

  -[_UITextCanvas setContext:](self->_textCanvasView, "setContext:", self);
  -[UITextField _addTextCanvasViewAdjustingFrame:](self, "_addTextCanvasViewAdjustingFrame:", 0);
}

- (double)_clearButtonPadX
{
  void *v2;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInterfaceIdiom");

  return 3.0;
}

- (void)_addTextCanvasViewAdjustingFrame:(BOOL)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  -[UITextField visualStyle](self, "visualStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentViewForTextContentView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[_UITextCanvas superview](self->_textCanvasView, "superview");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6 != v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__UITextField__addTextCanvasViewAdjustingFrame___block_invoke;
    v9[3] = &unk_1E16B4008;
    v11 = a3;
    v9[4] = self;
    v10 = v8;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);
    -[UIView _invalidateBaselineConstraints](self, "_invalidateBaselineConstraints");

    v7 = v8;
  }

}

- (void)_setupDefaultStyleEffectConfiguration
{
  id v3;
  __CFString *v4;
  void *v5;
  CUIStyleEffectConfiguration *cuiStyleEffectConfiguration;

  if (dyld_program_sdk_at_least())
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D1A6E8]);
    -[UIView traitCollection](self, "traitCollection");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[UITraitCollection _styleEffectAppearanceName](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAppearanceName:", v5);

    cuiStyleEffectConfiguration = self->_cuiStyleEffectConfiguration;
    self->_cuiStyleEffectConfiguration = (CUIStyleEffectConfiguration *)v3;

  }
}

- (id)backgroundColor
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  UITextField *v7;
  void *v8;
  objc_super v10;

  -[_UITextFieldBackgroundProvider overridingGetBackgroundColor](self->_backgroundProvider, "overridingGetBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UITextField _contentView](self, "_contentView");
    v7 = (UITextField *)objc_claimAutoreleasedReturnValue();

    if (v7 != self)
    {
      -[UITextField _contentView](self, "_contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "backgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    v10.receiver = self;
    v10.super_class = (Class)UITextField;
    -[UIView backgroundColor](&v10, sel_backgroundColor);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
LABEL_6:

  return v6;
}

- (double)_roundedRectBackgroundCornerRadius
{
  void *v3;
  void *v4;
  double v5;
  double preferredBackgroundCornerRadius;

  -[UITextField _backgroundView](self, "_backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_continuousCornerRadius");
    preferredBackgroundCornerRadius = v5;
  }
  else
  {
    preferredBackgroundCornerRadius = self->_preferredBackgroundCornerRadius;
  }

  return preferredBackgroundCornerRadius;
}

- (void)setLeftView:(UIView *)leftView
{
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
    -[UITextField _setActualRightView:](self, "_setActualRightView:", leftView);
  else
    -[UITextField _setActualLeftView:](self, "_setActualLeftView:", leftView);
}

- (void)_setActualLeftView:(id)a3
{
  UIView *v5;
  UIView **p_leftView;
  void *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  p_leftView = &self->_leftView;
  if (self->_leftView != v5)
  {
    v8 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIView _setProxyPointerInteraction:](*p_leftView, "_setProxyPointerInteraction:", 0);
    -[UIView _setOverrideUserInterfaceRenderingMode:](*p_leftView, "_setOverrideUserInterfaceRenderingMode:", -1);
    -[UITextField _transitionFromAccessoryView:toView:allowingAnimation:](self, "_transitionFromAccessoryView:toView:allowingAnimation:", *p_leftView, 0, 0);
    objc_storeStrong((id *)&self->_leftView, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIControl pointerInteraction](self, "pointerInteraction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _setProxyPointerInteraction:](*p_leftView, "_setProxyPointerInteraction:", v7);

    }
    -[UIView _setOverrideUserInterfaceRenderingMode:](*p_leftView, "_setOverrideUserInterfaceRenderingMode:", 1);
    -[UITextField _showSymbolAnimatableLeftViewNowIfNeeded](self, "_showSymbolAnimatableLeftViewNowIfNeeded");
    -[UITextField setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)_setRoundedRectBackgroundCornerRadius:(double)a3
{
  double v3;
  id v4;

  if (a3 >= 0.0)
    v3 = a3;
  else
    v3 = 0.0;
  if (self->_preferredBackgroundCornerRadius != v3)
  {
    self->_preferredBackgroundCornerRadius = v3;
    -[UITextField _systemBackgroundView](self, "_systemBackgroundView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCornerRadius:", v3);

  }
}

- (void)setControlSize:(int)a3
{
  if (self->_controlSize != a3)
  {
    self->_controlSize = a3;
    -[UITextField _invalidateBackgroundProvider](self, "_invalidateBackgroundProvider");
    -[UITextField _invalidateDefaultFont](self, "_invalidateDefaultFont");
    -[_UITextFieldBackgroundProvider controlSizeDidChange:](self->_backgroundProvider, "controlSizeDidChange:", 0);
  }
}

- (Class)_canvasViewClass
{
  return (Class)objc_opt_class();
}

- (void)_invalidateDefaultFont
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __37__UITextField__invalidateDefaultFont__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v2);
}

- (CGRect)rightViewRectForBounds:(CGRect)bounds
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
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
  CGRect v21;
  CGRect v22;
  CGRect result;

  height = bounds.size.height;
  width = bounds.size.width;
  y = bounds.origin.y;
  x = bounds.origin.x;
  if (ShouldSizeLeftOrRightViewToFit(self->_rightView))
  {
    -[UIView systemLayoutSizeFittingSize:](self->_rightView, "systemLayoutSizeFittingSize:", width, height);
    v9 = v8;
    v11 = v10;
  }
  else
  {
    -[UIView frame](self->_rightView, "frame");
    v9 = v12;
    v11 = v13;
  }
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  CGRectGetMaxX(v21);
  UIRoundToViewScale(self);
  v15 = v14 + self->_rightViewOffset.width;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  CGRectGetMidY(v22);
  UIRoundToViewScale(self);
  v17 = v16 + self->_rightViewOffset.height;
  v18 = v15;
  v19 = v9;
  v20 = v11;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v17;
  result.origin.x = v18;
  return result;
}

- (CGRect)_baselineLeftViewRectForBounds:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (ShouldSizeLeftOrRightViewToFit(self->_leftView))
  {
    -[UIView systemLayoutSizeFittingSize:](self->_leftView, "systemLayoutSizeFittingSize:", width, height);
    v9 = v8;
    v11 = v10;
  }
  else
  {
    -[UIView frame](self->_leftView, "frame");
    v9 = v12;
    v11 = v13;
  }
  v14 = self->_leftViewOffset.width;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  CGRectGetMidY(v20);
  UIRoundToViewScale(self);
  v16 = v15 + self->_leftViewOffset.height;
  v17 = v14;
  v18 = v9;
  v19 = v11;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v16;
  result.origin.x = v17;
  return result;
}

- (BOOL)_canDrawContent
{
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags;
  objc_super v4;

  textFieldFlags = self->_textFieldFlags;
  if ((*(_WORD *)&textFieldFlags & 0x4000) != 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)UITextField;
    return -[UIView _canDrawContent](&v4, sel__canDrawContent);
  }
  else
  {
    return (*(_QWORD *)&textFieldFlags & 0x200000000) != 0
        && -[_UITextFieldBackgroundProvider drawsContent](self->_backgroundProvider, "drawsContent");
  }
}

- (void)setDefaultTextAttributes:(NSDictionary *)defaultTextAttributes
{
  NSDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _UICascadingTextStorage *v12;
  id v13;
  _QWORD v14[5];

  v12 = self->_textStorage;
  v5 = defaultTextAttributes;
  -[_UICascadingTextStorage setDefaultAttributes:](v12, "setDefaultAttributes:", 0);
  -[_UICascadingTextStorage defaultAttributes](v12, "defaultAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "addEntriesFromDictionary:", v5);
  objc_msgSend(v7, "objectForKey:", *(_QWORD *)off_1E1678D90);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self, "setFont:", v8);

  -[NSDictionary objectForKey:](v5, "objectForKey:", *(_QWORD *)off_1E1678F98);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextField setTextAlignment:](self, "setTextAlignment:", objc_msgSend(v9, "alignment"));
  -[_UICascadingTextStorage setDefaultAttributes:](v12, "setDefaultAttributes:", v7);
  v10 = -[NSConcreteTextStorage length](v12, "length");
  -[NSConcreteTextStorage setAttributes:range:](v12, "setAttributes:range:", MEMORY[0x1E0C9AA70], 0, v10);
  -[UITextField _invalidateAllGlyphsAndTextLayout](self, "_invalidateAllGlyphsAndTextLayout");
  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __40__UITextField_setDefaultTextAttributes___block_invoke;
    v14[3] = &unk_1E16B5BD8;
    v14[4] = self;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v14);
    -[UITextField _inputController](self, "_inputController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_selectionGeometryChanged");

  }
  -[UITextField setNeedsLayout](self, "setNeedsLayout", v12);

}

- (void)setFont:(UIFont *)font
{
  _UICascadingTextStorage *v4;
  UIFont *v5;
  void *v6;
  void *v7;
  char v8;
  UITextField *v9;
  UIFont *v10;
  UIFont *v11;

  v11 = font;
  v4 = self->_textStorage;
  -[_UICascadingTextStorage font](v4, "font");
  v5 = (UIFont *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v5 == v11)
  {
LABEL_7:

    goto LABEL_8;
  }
  -[_UICascadingTextStorage font](v4, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v11);

  if ((v8 & 1) == 0)
  {
    if (v11)
    {
      -[UIFont pointSize](v11, "pointSize");
      +[_UIFullFontSize valued:](_UIFullFontSize, "valued:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self;
      v10 = v11;
    }
    else
    {
      +[_UIFullFontSize defaultValue](_UIFullFontSize, "defaultValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self;
      v10 = 0;
    }
    -[UITextField setFont:fullFontSize:](v9, "setFont:fullFontSize:", v10, v6);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    -[UITextField _adjustFontForAccessibilityTraits:](self, "_adjustFontForAccessibilityTraits:", 0);
  }
}

- (void)setFont:(id)a3 fullFontSize:(id)a4
{
  -[UITextField setFont:fullFontSize:ambientOnly:](self, "setFont:fullFontSize:ambientOnly:", a3, a4, 0);
}

- (void)_adjustFontForAccessibilityTraits:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  _UICascadingTextStorage *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  if (self->_adjustsFontForContentSizeCategory || a3)
  {
    -[UIView traitCollection](self, "traitCollection", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField font](self, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    -[UITextField font](self, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (v8 && v7)
    {
      -[UITextField font](self, "font");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "isEqual:", v7) ^ 1;

    }
    v23 = v9;
    if (*((_BYTE *)v21 + 24))
    {
      objc_msgSend(v7, "pointSize");
      +[_UIFullFontSize valued:](_UIFullFontSize, "valued:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextField setFont:fullFontSize:ambientOnly:](self, "setFont:fullFontSize:ambientOnly:", v7, v11, 1);

    }
    v12 = self->_textStorage;
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __49__UITextField__adjustFontForAccessibilityTraits___block_invoke;
    v17 = &unk_1E16E6430;
    v13 = v5;
    v18 = v13;
    v19 = &v20;
    -[_UICascadingTextStorage coordinateEditing:](v12, "coordinateEditing:", &v14);
    if (*((_BYTE *)v21 + 24))
    {
      -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize", v14, v15, v16, v17);
      -[UITextField _didSetFont:](self, "_didSetFont:", v7);
    }

    _Block_object_dispose(&v20, 8);
  }
}

- (void)_setSupportsKeyboardNavigationForSuggestions:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (id)defaultClearButtonImageForState:(unint64_t)a3
{
  NSMutableDictionary *cachedDefaultClearButtonImages;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;

  cachedDefaultClearButtonImages = self->_cachedDefaultClearButtonImages;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedDefaultClearButtonImages, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[UITextField _clearButtonImageForState:](self, "_clearButtonImageForState:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = self->_cachedDefaultClearButtonImages;
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v10 = self->_cachedDefaultClearButtonImages;
        self->_cachedDefaultClearButtonImages = v9;

        v8 = self->_cachedDefaultClearButtonImages;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v11);

    }
  }
  return v7;
}

- (void)setTextColor:(UIColor *)textColor
{
  self->_disableTextColorUpdateOnTraitCollectionChange = textColor != 0;
  -[UITextField _setTextColor:](self, "_setTextColor:");
}

- (void)_updateLabelAppearance
{
  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
    -[UITextField _syncTypingAttributesWithDefaultAttribute:](self, "_syncTypingAttributesWithDefaultAttribute:", *(_QWORD *)off_1E1678D98);
}

- (BOOL)_partsShouldBeMini
{
  UITextBorderStyle v3;

  v3 = -[UITextField borderStyle](self, "borderStyle");
  if (v3)
    LOBYTE(v3) = -[UITextField _heightShouldBeMini](self, "_heightShouldBeMini");
  return v3;
}

- (UITextBorderStyle)borderStyle
{
  UITextBorderStyle result;

  result = -[_UITextFieldBackgroundProvider associatedBorderStyle](self->_backgroundProvider, "associatedBorderStyle");
  if (result == -1)
    return self->_preferredBorderStyle;
  return result;
}

- (BOOL)_heightShouldBeMini
{
  double v2;

  -[UIView frame](self, "frame");
  return v2 <= 26.0;
}

- (id)_placeholderColor
{
  void *v2;
  void *v3;

  -[UITextField visualStyle](self, "visualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeholderColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
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
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UITextFieldLabel *placeholderLabel;
  double v24;
  double v25;
  double left;
  double top;
  double right;
  double bottom;
  double v30;
  double v31;
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags;
  _BOOL4 v33;
  _BOOL4 v34;
  _BOOL4 v35;
  _BOOL4 v36;
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
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGSize result;

  -[UIView superview](self, "superview", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  kdebug_trace();

  if (self)
  {
    -[UITextField textRectForBounds:](self, "textRectForBounds:", 0.0, 0.0, 100.0, 100.0);
    v6 = v5;
    v8 = v7;
    v10 = 100.0 - (v7 + v9);
    v12 = 100.0 - (v5 + v11);
  }
  else
  {
    v12 = 0.0;
    v10 = 0.0;
    v6 = 0.0;
    v8 = 0.0;
  }
  -[UIView traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  if (v14 == 6)
  {
    -[UITextField _visionOverrideHorizontalInsets:](self, "_visionOverrideHorizontalInsets:", v8, v6, v10, v12);
    v8 = v15;
    v6 = v16;
    v10 = v17;
    v12 = v18;
  }
  -[UITextField _textSizeUsingFullFontSize:](self, "_textSizeUsingFullFontSize:", 1);
  v20 = v19;
  v22 = v21;
  placeholderLabel = self->_placeholderLabel;
  if (placeholderLabel)
  {
    -[UILabel _intrinsicSizeWithinSize:](placeholderLabel, "_intrinsicSizeWithinSize:", 3.40282347e38, 3.40282347e38);
    if (v20 < v24)
      v20 = v24;
    if (v22 < v25)
      v22 = v25;
  }
  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  v30 = v12 + v6 + v20 + left + right;
  v31 = v10 + v8 + v22 + top + bottom;
  textFieldFlags = self->_textFieldFlags;
  if ((*(_QWORD *)&textFieldFlags & 0x6000000000) != 0)
  {
    v33 = bottom == 0.0;
    if (v8 != 0.0)
      v33 = 0;
    if (v10 != 0.0)
      v33 = 0;
    v34 = top == 0.0 && v33;
    v35 = right == 0.0;
    if (v6 != 0.0)
      v35 = 0;
    if (v12 != 0.0)
      v35 = 0;
    v36 = left == 0.0 && v35;
    if ((v34 | (*(unint64_t *)&textFieldFlags >> 38) & v36) == 1)
    {
      -[UITextField _applicableContentOutsetsFromFontsOversize:extremeSizing:]((uint64_t)self, (*(unint64_t *)&textFieldFlags >> 38) & 1, (*(unint64_t *)&textFieldFlags >> 37) & 1);
      v41 = v39 + v40;
      if (!v34)
        v41 = -0.0;
      v31 = v31 + v41;
      v42 = v37 + v38;
      if (!v36)
        v42 = -0.0;
      v30 = v30 + v42;
    }
  }
  -[UITextField _metricsProvider](self, "_metricsProvider");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "intrinsicSizeForContentSize:", v30, v31);
  v45 = v44;
  v47 = v46;

  -[UIView traitCollection](self, "traitCollection");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "userInterfaceIdiom");

  if (v49 == 6)
    -[UITextField _visionOverrideNaturalHeight:](self, "_visionOverrideNaturalHeight:", v45, v47);
  if (kdebug_is_enabled())
  {
    -[UITextField description](self, "description");
    v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v50, "UTF8String");
    kdebug_trace_string();

    -[UIView superview](self, "superview");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    kdebug_trace();

  }
  UICeilToViewScale(self);
  v53 = v52;
  UICeilToViewScale(self);
  v55 = v54;
  v56 = v53;
  result.height = v55;
  result.width = v56;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  id v4;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  v4 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "caretRectForPosition:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[UITextField adjustedCaretRectForCaretRect:](self, "adjustedCaretRectForCaretRect:", v7, v9, v11, v13);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)fieldEditorShouldExtendCaretHeight:(id)a3
{
  void *v3;
  char v4;

  -[UITextField _metricsProvider](self, "_metricsProvider", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldExtendCaretHeight");

  return v4;
}

- (CGRect)adjustedCaretRectForCaretRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  UITextFieldLabel *placeholderLabel;
  void *v11;
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
  void *v25;
  double v26;
  double v27;
  UITextFieldLabel *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[UILabel textAlignment](self->_placeholderLabel, "textAlignment") == NSTextAlignmentCenter
    && !-[UITextField _hasContent](self, "_hasContent"))
  {
    -[UILabel text](self->_placeholderLabel, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "length"))
    {
LABEL_8:

      goto LABEL_9;
    }
    -[UIView superview](self->_placeholderLabel, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      placeholderLabel = self->_placeholderLabel;
      -[UITextField textInputView](self, "textInputView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView convertRect:fromView:](placeholderLabel, "convertRect:fromView:", v11, x, y, width, height);
      v13 = v12;
      v15 = v14;
      v17 = v16;

      -[UIView bounds](self->_placeholderLabel, "bounds");
      v19 = v18;
      v21 = v20;
      -[UILabel textRectForBounds:](self->_placeholderLabel, "textRectForBounds:");
      v23 = v22;
      v24 = round(v19 + (v21 - v22) * 0.5);
      -[UILabel text](self->_placeholderLabel, "text");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v25, "_isNaturallyRTL");

      v26 = -v15;
      if ((_DWORD)v11)
        v26 = v23;
      v27 = v26 + v24;
      v28 = self->_placeholderLabel;
      -[UITextField textInputView](self, "textInputView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView convertRect:toView:](v28, "convertRect:toView:", v8, v27, v13, v15, v17);
      x = v29;
      y = v30;
      width = v31;
      height = v32;
      goto LABEL_8;
    }
  }
LABEL_9:
  v33 = x;
  v34 = y;
  v35 = width;
  v36 = height;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (void)setContinuousSpellCheckingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UITextField _inputController](self, "_inputController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContinuousSpellCheckingEnabled:", v3);

}

uint64_t __35__UITextField__detectCustomDrawing__block_invoke()
{
  uint64_t result;

  result = +[UITextField instanceMethodForSelector:](UITextField, "instanceMethodForSelector:", sel_drawRect_);
  qword_1ECD7A1F0 = result;
  return result;
}

- (BOOL)isEditable
{
  return 1;
}

- (BOOL)_shouldCollectAsKeyView
{
  return -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled")
      && -[UIControl isEnabled](self, "isEnabled")
      && -[UITextField isEditable](self, "isEditable");
}

- (BOOL)_requiresKeyboardResetOnReload
{
  return 1;
}

- (void)_invalidateDefaultFullFontSize
{
  if (-[UITextField adjustsFontSizeToFitWidth](self, "adjustsFontSizeToFitWidth"))
  {
    if (-[_UIFullFontSize setNeedsEvaluation](self->_fullFontSize, "setNeedsEvaluation"))
    {
      -[UITextField setNeedsLayout](self, "setNeedsLayout");
      -[UIView _invalidateBaselineConstraints](self, "_invalidateBaselineConstraints");
    }
  }
}

- (void)_ensureSelectionContainerViewSubviewOrdering
{
  void *v3;
  void *v4;
  id v5;
  _UITouchPassthroughView *v6;
  _UITouchPassthroughView *selectionContainerView;
  void *v8;
  id v9;

  if (self->_selectionContainerView)
  {
    -[UITextField visualStyle](self, "visualStyle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "parentViewForTextContentView");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[UITextField _backgroundView](self, "_backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v9)
    {
      selectionContainerView = self->_selectionContainerView;
      -[UITextField _backgroundView](self, "_backgroundView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertSubview:above:", selectionContainerView, v8);
    }
    else
    {
      v6 = self->_selectionContainerView;
      if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) == 0)
      {
        objc_msgSend(v9, "insertSubview:atIndex:", self->_selectionContainerView, 0);
LABEL_9:

        return;
      }
      -[UITextField _fieldEditor](self, "_fieldEditor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertSubview:below:", v6, v8);
    }

    goto LABEL_9;
  }
}

- (UIView)_backgroundView
{
  UITextField *v2;
  UITextField *v3;
  _UITextFieldBackgroundProvider *backgroundProvider;
  _UITextFieldBackgroundProvider *v5;
  void *v6;

  v2 = self;
  v3 = v2;
  if (v2 && (*((_BYTE *)&v2->_textFieldFlags + 4) & 4) != 0)
    backgroundProvider = v2->_backgroundProvider;
  else
    backgroundProvider = 0;
  v5 = backgroundProvider;

  -[_UITextFieldBackgroundProvider backgroundView](v5, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v6;
}

- (_NSRange)_visibleRangeWithLayout:(BOOL)a3
{
  _BOOL8 v3;
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
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  _UITextLayoutController *textLayoutController;
  void *v40;
  void *v41;
  uint64_t v42;
  NSUInteger v43;
  NSUInteger v44;
  NSUInteger v45;
  NSUInteger v46;
  _NSRange result;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v3 = a3;
  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UITextField textInputView](self, "textInputView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertRect:fromView:", self, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[UITextField textInputView](self, "textInputView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  v52.origin.x = v23;
  v52.origin.y = v24;
  v52.size.width = v25;
  v52.size.height = v26;
  v48.origin.x = v15;
  v48.origin.y = v17;
  v48.size.width = v19;
  v48.size.height = v21;
  v49 = CGRectIntersection(v48, v52);
  x = v49.origin.x;
  y = v49.origin.y;
  width = v49.size.width;
  height = v49.size.height;

  -[UITextField textContainerOrigin](self, "textContainerOrigin");
  v32 = -v31;
  v34 = -v33;
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  v51 = CGRectOffset(v50, v32, v34);
  v35 = v51.origin.x;
  v36 = v51.origin.y;
  v37 = v51.size.width;
  v38 = v51.size.height;
  textLayoutController = self->_textLayoutController;
  -[UITextField textContainer](self, "textContainer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextLayoutController textRangeForBounds:inTextContainer:layoutIfNeeded:](textLayoutController, "textRangeForBounds:inTextContainer:layoutIfNeeded:", v40, v3, v35, v36, v37, v38);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = -[_UITextLayoutController characterRangeForTextRange:](self->_textLayoutController, "characterRangeForTextRange:", v41);
  v44 = v43;

  v45 = v42;
  v46 = v44;
  result.length = v46;
  result.location = v45;
  return result;
}

- (void)setFont:(id)a3 fullFontSize:(id)a4 ambientOnly:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  _UICascadingTextStorage *v9;
  _UICascadingTextStorage *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;

  v5 = a5;
  v22 = a3;
  v8 = a4;
  v9 = self->_textStorage;
  v10 = v9;
  if (v5)
  {
    if (v22)
    {
      -[_UICascadingTextStorage defaultAttributes](v9, "defaultAttributes", v22);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "mutableCopy");
      v13 = v12;
      if (v12)
        v14 = v12;
      else
        v14 = (id)objc_opt_new();
      v15 = v14;

      objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, *(_QWORD *)off_1E1678D90);
      -[_UICascadingTextStorage setDefaultAttributes:](v10, "setDefaultAttributes:", v15);

    }
  }
  else
  {
    -[_UICascadingTextStorage setFont:](v9, "setFont:", v22);
  }
  if (!self->_overriddenPlaceholder)
    -[UILabel setFont:](self->_placeholderLabel, "setFont:", v22);
  -[UILabel setFont:](self->_label, "setFont:", v22);
  -[UILabel setFont:](self->_suffixLabel, "setFont:", v22);
  -[UILabel setFont:](self->_prefixLabel, "setFont:", v22);
  -[UITextField _setFullFontSize:](self, "_setFullFontSize:", v8);
  if (v5)
  {
    if (v22)
    {
      -[_UICascadingTextStorage defaultAttributes](v10, "defaultAttributes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "mutableCopy");
      v18 = v17;
      if (v17)
        v19 = v17;
      else
        v19 = (id)objc_opt_new();
      v20 = v19;

      objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, *(_QWORD *)off_1E1678D90);
      -[_UICascadingTextStorage setDefaultAttributes:](v10, "setDefaultAttributes:", v20);

    }
  }
  else
  {
    -[_UICascadingTextStorage setFont:](v10, "setFont:", v22);
  }
  if (-[UITextField _shouldObscureInput](self, "_shouldObscureInput"))
    -[UITextField _forceObscureAllText](self, "_forceObscureAllText");
  -[UITextField _syncTypingAttributesWithDefaultAttribute:](self, "_syncTypingAttributesWithDefaultAttribute:", *(_QWORD *)off_1E1678D90);
  -[UITextField _inputController](self, "_inputController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_updateEmptyStringAttributes");
  objc_msgSend(v21, "_selectionGeometryChanged");
  -[UITextField setNeedsLayout](self, "setNeedsLayout");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  if (!v5)
    -[UITextField _didSetFont:](self, "_didSetFont:", v22);
  -[UITextField _invalidateAllGlyphsAndTextLayout](self, "_invalidateAllGlyphsAndTextLayout");

}

- (void)layoutSubviews
{
  void *v3;
  UIFieldEditor *fieldEditor;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITextField;
  -[UIView layoutSubviews](&v6, sel_layoutSubviews);
  -[UITextField _contentFloatingContainerView](self, "_contentFloatingContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(v3, "setNeedsLayout");
  objc_msgSend(v3, "layoutIfNeeded");
  -[UITextField _tvUpdateContentBackdropView](self, "_tvUpdateContentBackdropView");
  fieldEditor = self->_fieldEditor;
  if (fieldEditor)
  {
    -[UIView superview](fieldEditor, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[UIView layoutIfNeeded](self->_fieldEditor, "layoutIfNeeded");
  }
  -[UITextField _layoutContentAndExtras](self, "_layoutContentAndExtras");

}

- (void)_layoutContentAndExtras
{
  -[UITextField _updateLabel](self, "_updateLabel");
  -[UITextField _updatePlaceholderPosition](self, "_updatePlaceholderPosition");
  -[UITextField _updateAutosizeStyleIfNeeded](self, "_updateAutosizeStyleIfNeeded");
  -[UITextField _updateButtons](self, "_updateButtons");
  -[_UITextFieldBackgroundProvider layoutIfNeeded](self->_backgroundProvider, "layoutIfNeeded");
  -[UITextField _layoutLabels](self, "_layoutLabels");
  -[UITextField _layoutContentOnly](self, "_layoutContentOnly");
}

- (void)_updateButtons
{
  -[UITextField _updateButtonsAllowingAnimation:](self, "_updateButtonsAllowingAnimation:", 1);
}

- (void)_updatePlaceholderPosition
{
  void *v3;
  uint64_t v4;
  int64_t v5;

  -[UILabel text](self->_placeholderLabel, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4 && -[UILabel textAlignment](self->_placeholderLabel, "textAlignment") != NSTextAlignmentCenter)
  {
    v5 = -[UITextField _currentTextAlignment](self, "_currentTextAlignment");
    if (v5 != -[UILabel textAlignment](self->_placeholderLabel, "textAlignment"))
      -[UILabel setTextAlignment:](self->_placeholderLabel, "setTextAlignment:", v5);
  }
}

- (void)_updateLabel
{
  UILabel *label;
  double v4;
  double v5;
  UIImageView *iconView;
  double v7;
  double v8;
  double v9;
  double v10;

  label = self->_label;
  if (label)
  {
    -[UIView sizeToFit](label, "sizeToFit");
    -[UIView frame](self->_label, "frame");
    v5 = v4;
    iconView = self->_iconView;
    if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
    {
      if (!iconView)
      {
        -[UIView bounds](self, "bounds");
        v7 = v10 - v5 + -6.0 - self->_labelOffset;
        goto LABEL_9;
      }
    }
    else if (!iconView)
    {
      v7 = self->_labelOffset + 6.0;
LABEL_9:
      -[UIView bounds](self, "bounds");
      -[UITextField _availableTextRectForBounds:forEditing:](self, "_availableTextRectForBounds:forEditing:", 0);
      -[UILabel setFrame:](self->_label, "setFrame:", v7);
      return;
    }
    -[UITextField iconRect](self, "iconRect");
    v7 = self->_labelOffset + v8 + v9 + 3.0;
    goto LABEL_9;
  }
}

- (id)_contentFloatingContainerView
{
  return self->_floatingContainerView;
}

- (int64_t)_currentTextAlignment
{
  void *v2;
  int64_t v3;

  -[UITextField _textStorage](self, "_textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_ui_resolvedTextAlignment");

  return v3;
}

- (id)_textStorage
{
  return self->_textStorage;
}

- (void)_setFullFontSize:(id)a3
{
  id v4;
  id obj;

  v4 = a3;
  if (!v4)
  {
    +[_UIFullFontSize defaultValue](_UIFullFontSize, "defaultValue");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  obj = v4;
  if (!-[_UIFullFontSize isEqual:](self->_fullFontSize, "isEqual:", v4))
  {
    objc_storeStrong((id *)&self->_fullFontSize, obj);
    if (-[UITextField adjustsFontSizeToFitWidth](self, "adjustsFontSizeToFitWidth"))
    {
      if (-[_UIFullFontSize needsEvaluation](self->_fullFontSize, "needsEvaluation"))
        -[UITextField setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)_updateAutosizeStyleIfNeeded
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  _UICascadingTextStorage *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  float v17;
  double v18;
  float v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  unsigned int v28;
  float v29;
  int v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  float *v36;
  float v37;
  id v39;
  void *v40;
  double v41;
  double v42;
  id v43;
  id v44;
  double v45;
  double v46;
  id v48;
  void *v49;
  double v50;
  double v51;
  id v52;
  id v53;
  double v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  _QWORD v60[5];
  id v61;
  uint64_t *v62;
  uint64_t *v63;
  uint64_t *v64;
  float v65;
  float v66;
  int v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  float *v79;
  uint64_t v80;
  float v81;
  _QWORD v82[5];
  id v83[2];

  if (-[UITextField adjustsFontSizeToFitWidth](self, "adjustsFontSizeToFitWidth")
    && ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) == 0
     || !-[UITextField _tvHasFloatingFieldEditor](self, "_tvHasFloatingFieldEditor")))
  {
    v3 = -[UITextField _shouldObscureInput](self, "_shouldObscureInput");
    if ((*((_BYTE *)&self->_textFieldFlags + 2) & 2) != 0)
    {
      -[UITextField attributedText](self, "attributedText");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "string");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[UITextField text](self, "text");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = self->_textStorage;
    -[_UICascadingTextStorage font](v6, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "length");
    v9 = v8 == 0;
    if (v8)
    {
      if (v3)
      {
        v83[0] = 0;
        objc_msgSend(v7, "_ui_bulletStringWithFont:", v83);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v83[0];
        v68 = 0;
        v69 = &v68;
        v70 = 0x2020000000;
        v71 = 0;
        v11 = objc_msgSend(v4, "length");
        v82[0] = MEMORY[0x1E0C809B0];
        v82[1] = 3221225472;
        v82[2] = __43__UITextField__updateAutosizeStyleIfNeeded__block_invoke;
        v82[3] = &unk_1E16BBAB8;
        v82[4] = &v68;
        objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 2, v82);
        objc_msgSend(&stru_1E16EDF20, "stringByPaddingToLength:withString:startingAtIndex:", v69[3], v10, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = (*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0 && objc_msgSend(v12, "length") == 0;
        _Block_object_dispose(&v68, 8);

        v14 = 0;
        v13 = v59;
LABEL_19:
        v78 = 0;
        v79 = (float *)&v78;
        v80 = 0x2020000000;
        v81 = 0.0;
        -[_UICascadingTextStorage font](v6, "font");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pointSize");
        v17 = v16;

        v81 = v17;
        -[UITextField _fullFontSize](self, "_fullFontSize");
        v19 = v18;
        if (v9)
        {
          if (v79[6] != v19)
          {
            -[_UICascadingTextStorage font](v6, "font");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v21 = v19;
            *(float *)&v22 = v19;
            v23 = -[UITextField _copyFont:newSize:maxSize:](self, "_copyFont:newSize:maxSize:", v20, v21, v22);

            -[_UIFullFontSize overrideUnlessDefault:](self->_fullFontSize, "overrideUnlessDefault:", v19);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[UITextField setFont:fullFontSize:ambientOnly:](self, "setFont:fullFontSize:ambientOnly:", v23, v24, v14);

          }
LABEL_54:
          _Block_object_dispose(&v78, 8);

          return;
        }
        -[UITextField editRect](self, "editRect");
        v26 = v25;
        -[UITextField textInputTraits](self, "textInputTraits");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "insertionPointWidth");

        v29 = v26 - (double)v28 + -10.0;
        v74 = 0;
        v75 = &v74;
        v76 = 0x2020000000;
        v77 = 0;
        v68 = 0;
        v69 = &v68;
        v70 = 0x3032000000;
        v71 = __Block_byref_object_copy__206;
        v72 = __Block_byref_object_dispose__206;
        v73 = 0;
        if ((_DWORD)v14)
        {
          v30 = *((_DWORD *)v79 + 6);
          v60[0] = MEMORY[0x1E0C809B0];
          v60[1] = 3221225472;
          v60[2] = __43__UITextField__updateAutosizeStyleIfNeeded__block_invoke_2;
          v60[3] = &unk_1E16E63E0;
          v65 = v19;
          v66 = v26 - (double)v28 + -10.0;
          v62 = &v78;
          v63 = &v74;
          v60[4] = self;
          v67 = v30;
          v64 = &v68;
          v61 = v7;
          -[_UICascadingTextStorage coordinateAccess:](v6, "coordinateAccess:", v60);

LABEL_48:
          v55 = (void *)v69[5];
          if (v55 && (objc_msgSend(v55, "isEqual:", v7) & 1) == 0)
          {
            v56 = v69[5];
            -[_UIFullFontSize overrideUnlessDefault:](self->_fullFontSize, "overrideUnlessDefault:", v19);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            -[UITextField setFont:fullFontSize:ambientOnly:](self, "setFont:fullFontSize:ambientOnly:", v56, v57, 0);

          }
          if (*((_DWORD *)v75 + 6))
          {
            -[UITextField interactionAssistant](self, "interactionAssistant");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "setNeedsSelectionDisplayUpdate");

          }
          _Block_object_dispose(&v68, 8);

          _Block_object_dispose(&v74, 8);
          goto LABEL_54;
        }
        if (v3)
        {
          objc_msgSend(v7, "pointSize");
          objc_msgSend(v13, "fontWithSize:");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31 != v7)
            goto LABEL_28;

        }
        v31 = 0;
LABEL_28:
        if (v31)
          v32 = v31;
        else
          v32 = v7;
        objc_msgSend(v12, "_legacy_sizeWithFont:", v32);
        v34 = v33;
        v35 = v29;
        while (1)
        {
          v36 = v79;
          v37 = v79[6];
          if (v37 >= v19 || v34 >= v35)
            break;
          ++*((_DWORD *)v75 + 6);
          v36[6] = v37 + 1.0;
          v39 = -[UITextField _copyFont:newSize:maxSize:](self, "_copyFont:newSize:maxSize:", v7);
          v40 = (void *)v69[5];
          v69[5] = (uint64_t)v39;

          *(float *)&v41 = v79[6];
          *(float *)&v42 = v19;
          v43 = -[UITextField _copyFont:newSize:maxSize:](self, "_copyFont:newSize:maxSize:", v31, v41, v42);

          v44 = v43;
          if (!v43)
            v44 = (id)v69[5];
          objc_msgSend(v12, "_legacy_sizeWithFont:", v44);
          v34 = v45;
          v31 = v43;
        }
        while (1)
        {
          -[UITextField actualMinimumFontSize](self, "actualMinimumFontSize");
          if (v46 >= v37 || v34 <= v35)
            break;
          --*((_DWORD *)v75 + 6);
          v79[6] = v79[6] + -1.0;
          v48 = -[UITextField _copyFont:newSize:maxSize:](self, "_copyFont:newSize:maxSize:", v7);
          v49 = (void *)v69[5];
          v69[5] = (uint64_t)v48;

          *(float *)&v50 = v79[6];
          *(float *)&v51 = v19;
          v52 = -[UITextField _copyFont:newSize:maxSize:](self, "_copyFont:newSize:maxSize:", v31, v50, v51);

          v53 = v52;
          if (!v52)
            v53 = (id)v69[5];
          objc_msgSend(v12, "_legacy_sizeWithFont:", v53);
          v34 = v54;
          v37 = v79[6];
          v31 = v52;
        }

        goto LABEL_48;
      }
      v12 = v4;
    }
    else
    {
      -[UITextField placeholder](self, "placeholder");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        v13 = 0;
        v14 = 0;
        v9 = 1;
        goto LABEL_19;
      }
    }
    if ((*((_BYTE *)&self->_textFieldFlags + 2) & 2) != 0)
    {
      v14 = dyld_program_sdk_at_least();
      v13 = 0;
    }
    else
    {
      v13 = 0;
      v14 = 0;
    }
    goto LABEL_19;
  }
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return (*(_BYTE *)&self->_textFieldFlags & 0x80) != 0 && !self->_suffixLabel && self->_prefixLabel == 0;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
  _UICascadingTextStorage *v5;
  void *v6;
  _UICascadingTextStorage *v7;

  v5 = self->_textStorage;
  *(_QWORD *)&self->_textFieldFlags |= 0x2000uLL;
  v7 = v5;
  if (-[_UICascadingTextStorage textAlignment](v5, "textAlignment") != textAlignment)
  {
    -[UILabel setTextAlignment:](self->_placeholderLabel, "setTextAlignment:", textAlignment);
    -[_UICascadingTextStorage setTextAlignment:](v7, "setTextAlignment:", textAlignment);
    -[UITextField _syncTypingAttributesWithDefaultAttribute:](self, "_syncTypingAttributesWithDefaultAttribute:", *(_QWORD *)off_1E1678F98);
    -[UITextField _inputController](self, "_inputController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_selectionGeometryChanged");

  }
}

- (void)_layoutLabels
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  UITextFieldLabel *prefixLabel;
  void *v18;
  void *v19;
  UITextFieldLabel *suffixLabel;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_hasDictationPlaceholder");

  v5 = -[UITextField _hasContent](self, "_hasContent") | v4;
  -[UILabel text](self->_placeholderLabel, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length") || (v5 & 1) != 0 || (*((_BYTE *)&self->_textFieldFlags + 3) & 8) != 0)
  {

LABEL_7:
    -[UIView removeFromSuperview](self->_placeholderLabel, "removeFromSuperview");
    goto LABEL_8;
  }

  -[UIView bounds](self, "bounds");
  -[UITextField placeholderRectForBounds:](self, "placeholderRectForBounds:");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (-[UITextField _shouldShrinkPlaceholderToFitForAccessibility](self, "_shouldShrinkPlaceholderToFitForAccessibility"))
  {
    v15 = 1;
    v16 = 1;
  }
  else
  {
    v16 = 0;
    v15 = *(_BYTE *)&self->_textFieldFlags >> 7;
  }
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_placeholderLabel, "setAdjustsFontSizeToFitWidth:", v15);
  -[UILabel setBaselineAdjustment:](self->_placeholderLabel, "setBaselineAdjustment:", v16);
  -[UILabel font](self->_placeholderLabel, "font");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pointSize");
  v24 = v23;

  if (v24 <= 0.0)
  {
    objc_msgSend((id)objc_opt_class(), "defaultFont");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "pointSize");
    v24 = v26;

  }
  if (v24 == 0.0)
    v27 = 0.0;
  else
    v27 = self->_minimumFontSize / v24;
  -[UILabel setMinimumScaleFactor:](self->_placeholderLabel, "setMinimumScaleFactor:", v27);
  -[UILabel setFrame:](self->_placeholderLabel, "setFrame:", v8, v10, v12, v14);
  if (-[UITextField isEditing](self, "isEditing")
    && -[UITextField clearsPlaceholderOnBeginEditing](self, "clearsPlaceholderOnBeginEditing"))
  {
    goto LABEL_7;
  }
  -[UITextField _fieldEditorHost](self, "_fieldEditorHost");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    objc_msgSend(v28, "addPlaceholderLabel:", self->_placeholderLabel);
  }
  else
  {
    -[UITextField _contentView](self, "_contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSubview:", self->_placeholderLabel);

  }
  -[UITextField _inputController](self, "_inputController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_selectionGeometryChanged");

LABEL_8:
  prefixLabel = self->_prefixLabel;
  if (prefixLabel)
  {
    -[UITextField _prefixFrame](self, "_prefixFrame");
    -[UILabel setFrame:](prefixLabel, "setFrame:");
    -[UITextField _contentView](self, "_contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", self->_prefixLabel);

    if (((-[UITextField isEditing](self, "isEditing") | v5) & 1) != 0)
      -[_UICascadingTextStorage textColor](self->_textStorage, "textColor");
    else
      -[UILabel color](self->_placeholderLabel, "color");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setColor:](self->_prefixLabel, "setColor:", v19);
    -[UIView frame](self->_placeholderLabel, "frame");
    -[UILabel setFrame:](self->_placeholderLabel, "setFrame:");
    -[UILabel setNeedsDisplay](self->_prefixLabel, "setNeedsDisplay");

  }
  suffixLabel = self->_suffixLabel;
  if (suffixLabel)
  {
    -[UITextField _suffixFrame](self, "_suffixFrame");
    -[UILabel setFrame:](suffixLabel, "setFrame:");
    -[UITextField _contentView](self, "_contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", self->_suffixLabel);

    -[UILabel setNeedsDisplay](self->_suffixLabel, "setNeedsDisplay");
  }
}

- (id)_inputController
{
  void *v2;
  void *v3;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_inputController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_layoutContentOnly
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIView *contentCoverView;
  void *v8;
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double preferredBackgroundCornerRadius;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  _UITouchPassthroughView *v21;

  v21 = self->_selectionContainerView;
  -[UITextField visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentViewForTextContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UITextField _showsContentCoverView](self, "_showsContentCoverView"))
  {
    if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
      -[UIScrollView removeFromSuperview](self->_fieldEditor, "removeFromSuperview");
    if (v21)
    {
      -[UIView superview](self->_selectionContainerView, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4 != v5)
        objc_msgSend(v4, "addSubview:", v21);
    }
    -[_UITextCanvas superview](self->_textCanvasView, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 != v6)
      objc_msgSend(v4, "addSubview:", self->_textCanvasView);
    contentCoverView = self->_contentCoverView;
    if (contentCoverView)
    {
      -[UIView superview](contentCoverView, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4 != v8)
        objc_msgSend(v4, "addSubview:", self->_contentCoverView);
      objc_msgSend(v4, "bringSubviewToFront:", self->_contentCoverView);
      -[UITextField editRect](self, "editRect");
      -[UIView setFrame:](self->_contentCoverView, "setFrame:");
    }
  }
  else
  {
    -[UIView removeFromSuperview](self->_contentCoverView, "removeFromSuperview");
    textFieldFlags = self->_textFieldFlags;
    if ((*(_WORD *)&textFieldFlags & 0x100) != 0)
    {
      -[UIView superview](self->_fieldEditor, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        -[UITextField _addFieldEditorToView](self, "_addFieldEditorToView");
        goto LABEL_24;
      }
      textFieldFlags = self->_textFieldFlags;
    }
    if ((*(_WORD *)&textFieldFlags & 0x100) == 0)
    {
      if (v21)
      {
        -[UIView superview](self->_selectionContainerView, "superview");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v4 != v11)
          objc_msgSend(v4, "addSubview:", v21);
      }
      -[_UITextCanvas superview](self->_textCanvasView, "superview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4 != v12)
        objc_msgSend(v4, "addSubview:", self->_textCanvasView);
      objc_msgSend(v4, "bringSubviewToFront:", self->_textCanvasView);
    }
  }
LABEL_24:
  -[UITextField textInputView](self, "textInputView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  -[UIView setFrame:](v21, "setFrame:");

  -[UITextField interactionAssistant](self, "interactionAssistant");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_legacySelectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deferredUpdateSelectionRects");

  if (-[UITextField _showsBackgroundCoverView](self, "_showsBackgroundCoverView"))
  {
    objc_msgSend(v4, "insertSubview:below:", self->_backgroundCoverView, self->_textCanvasView);
    -[UIView bounds](self, "bounds");
    -[UITextField borderRectForBounds:](self, "borderRectForBounds:");
    -[UIView setFrame:](self->_backgroundCoverView, "setFrame:");
    if (-[UITextField borderStyle](self, "borderStyle") == UITextBorderStyleRoundedRect)
    {
      preferredBackgroundCornerRadius = self->_preferredBackgroundCornerRadius;
      -[UIView layer](self->_backgroundCoverView, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = preferredBackgroundCornerRadius;
    }
    else
    {
      -[UIView layer](self->_backgroundCoverView, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = 0.0;
    }
    objc_msgSend(v17, "setCornerRadius:", v19);

  }
  else
  {
    -[UIView removeFromSuperview](self->_backgroundCoverView, "removeFromSuperview");
  }
  -[_UITextCanvas superview](self->_textCanvasView, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v20)
  {
    -[UITextField _textCanvasViewFrameIncludingContentInsetsFromFontsWhenNotContainedByFieldEditor](self, "_textCanvasViewFrameIncludingContentInsetsFromFontsWhenNotContainedByFieldEditor");
    -[_UITextCanvas setFrame:](self->_textCanvasView, "setFrame:");
    -[_UITextCanvas setNeedsDisplay](self->_textCanvasView, "setNeedsDisplay");
  }
  -[UITextField _layoutFieldEditor](self, "_layoutFieldEditor");
  -[_UITextFieldBackgroundProvider layoutIfNeeded](self->_backgroundProvider, "layoutIfNeeded");

}

- (UIView)textInputView
{
  void *textCanvasView;
  void *v4;
  UIView *v5;

  -[UIFieldEditor textInputView](self->_fieldEditor, "textInputView");
  textCanvasView = (void *)objc_claimAutoreleasedReturnValue();
  v4 = textCanvasView;
  if (!textCanvasView)
    textCanvasView = self->_textCanvasView;
  v5 = textCanvasView;

  return v5;
}

- (_UITextFieldVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (void)_updateButtonsAllowingAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v9;
  id v10;

  v3 = a3;
  -[UITextField _contentView](self, "_contentView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView superview](self->_clearButton, "superview");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (-[UITextField _showsClearButton:](self, "_showsClearButton:", -[UITextField isEditing](self, "isEditing")))
  {
    v6 = -[UITextField clearButton](self, "clearButton");
    v7 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
    v8 = v5 == v10 && v7;
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v8);
    -[UITextField clearButtonRect](self, "clearButtonRect");
    -[UIButton setFrame:](self->_clearButton, "setFrame:");
    -[UIView setUserInteractionEnabled:](self->_clearButton, "setUserInteractionEnabled:", 1);
    -[_UITextFieldClearButton setPointerInteractionEnabled:](self->_clearButton, "setPointerInteractionEnabled:", -[UITextField _hasCustomClearButtonImage](self, "_hasCustomClearButtonImage") ^ 1);
    -[UITextField _transitionFromAccessoryView:toView:allowingAnimation:](self, "_transitionFromAccessoryView:toView:allowingAnimation:", 0, self->_clearButton, v3);
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v7);
  }
  else
  {
    -[UITextField _transitionFromAccessoryView:toView:allowingAnimation:](self, "_transitionFromAccessoryView:toView:allowingAnimation:", self->_clearButton, 0, v3);
  }
  v9 = v10;
  if (self->_leftView)
  {
    if (-[UITextField _showsLeftView](self, "_showsLeftView"))
    {
      -[UITextField _transitionFromAccessoryView:toView:allowingAnimation:](self, "_transitionFromAccessoryView:toView:allowingAnimation:", 0, self->_leftView, v3);
      -[UIView bounds](self, "bounds");
      -[UITextField leftViewRectForBounds:](self, "leftViewRectForBounds:");
      -[UIView setFrame:](self->_leftView, "setFrame:");
    }
    else
    {
      -[UITextField _transitionFromAccessoryView:toView:allowingAnimation:](self, "_transitionFromAccessoryView:toView:allowingAnimation:", self->_leftView, 0, v3);
    }
    v9 = v10;
  }
  if (self->_rightView)
  {
    if (-[UITextField _showsRightView](self, "_showsRightView"))
    {
      -[UITextField _transitionFromAccessoryView:toView:allowingAnimation:](self, "_transitionFromAccessoryView:toView:allowingAnimation:", 0, self->_rightView, v3);
      -[UIView bounds](self, "bounds");
      -[UITextField rightViewRectForBounds:](self, "rightViewRectForBounds:");
      -[UIView setFrame:](self->_rightView, "setFrame:");
    }
    else
    {
      -[UITextField _transitionFromAccessoryView:toView:allowingAnimation:](self, "_transitionFromAccessoryView:toView:allowingAnimation:", self->_rightView, 0, v3);
    }
    v9 = v10;
  }

}

- (BOOL)isEditing
{
  return (self->_deferringBecomeFirstResponder || (*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
      && -[UIView isFirstResponder](self, "isFirstResponder")
      && -[UITextField isEditable](self, "isEditable");
}

- (void)_transitionFromAccessoryView:(id)a3 toView:(id)a4 allowingAnimation:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[UITextField _contentView](self, "_contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v8, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 == v10)
    {
      if (v5
        && -[UITextField _shouldAnimateTransitionForAccessoryView:](self, "_shouldAnimateTransitionForAccessoryView:", v8))
      {
        v12 = v8;
        objc_msgSend(v12, "_imageViewIfNeeded");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CE86D8], "disappearDownEffect");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CE86E8], "options");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __69__UITextField__transitionFromAccessoryView_toView_allowingAnimation___block_invoke;
        v24[3] = &unk_1E16E6390;
        v25 = v12;
        v16 = v12;
        objc_msgSend(v13, "addSymbolEffect:options:animated:completion:", v14, v15, 1, v24);

      }
      else
      {
        objc_msgSend(v8, "removeFromSuperview");
      }
    }
  }
  if (v9)
  {
    objc_msgSend(v9, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 != v10)
    {
      if (v5
        && -[UITextField _shouldAnimateTransitionForAccessoryView:](self, "_shouldAnimateTransitionForAccessoryView:", v9))
      {
        v18 = v9;
        objc_msgSend(v18, "_imageViewIfNeeded");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CE86D8], "disappearDownEffect");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CE86E8], "options");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addSymbolEffect:options:animated:", v20, v21, 0);

        objc_msgSend(v10, "addSubview:", v18);
        objc_msgSend(v18, "_imageViewIfNeeded");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CE86B8], "appearUpEffect");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addSymbolEffect:", v23);

      }
      else
      {
        objc_msgSend(v10, "addSubview:", v9);
      }
    }
  }

}

- (BOOL)_showsClearButton:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 3)
  {
    -[UIView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "interactionModel") & 1;

    return v8;
  }
  else if (-[UITextField _hasContent](self, "_hasContent"))
  {
    return -[UITextField _showsClearButtonWhenNonEmpty:](self, "_showsClearButtonWhenNonEmpty:", v3);
  }
  else
  {
    return -[UITextField _showsClearButtonWhenEmpty](self, "_showsClearButtonWhenEmpty");
  }
}

- (BOOL)_showsContentCoverView
{
  BOOL result;
  int64_t contentCoverViewMode;

  if (!self->_contentCoverView)
    return 0;
  result = -[UIView isFirstResponder](self, "isFirstResponder");
  contentCoverViewMode = self->_contentCoverViewMode;
  if (contentCoverViewMode == 3)
    return 1;
  if (contentCoverViewMode != 2)
  {
    if (contentCoverViewMode == 1)
      return result;
    return 0;
  }
  return !result;
}

- (BOOL)_showsBackgroundCoverView
{
  BOOL result;
  int64_t backgroundCoverViewMode;

  if (!self->_backgroundCoverView)
    return 0;
  result = -[UIView isFirstResponder](self, "isFirstResponder");
  backgroundCoverViewMode = self->_backgroundCoverViewMode;
  if (backgroundCoverViewMode == 3)
    return 1;
  if (backgroundCoverViewMode != 2)
  {
    if (backgroundCoverViewMode == 1)
      return result;
    return 0;
  }
  return !result;
}

- (void)_layoutFieldEditor
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  id v19;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v3;
  if (v3)
  {
    v4 = -[UIView isFirstResponder](self, "isFirstResponder");
    v5 = v4;
    textFieldFlags = self->_textFieldFlags;
    if ((*(_BYTE *)&textFieldFlags & 0x1E) != 0 && !v4)
    {
      v9 = *MEMORY[0x1E0C9D648];
      v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      -[UIView bounds](self, "bounds");
      -[UITextField editingRectForBounds:](self, "editingRectForBounds:");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      textFieldFlags = self->_textFieldFlags;
    }
    if ((*(_BYTE *)&textFieldFlags & 0x1E) == 0)
    {
      objc_msgSend(v19, "frame");
      if (!-[UITextField _tvHasFloatingFieldEditor](self, "_tvHasFloatingFieldEditor"))
        objc_msgSend(v19, "setFrame:", v9, v11, v13, v15);
    }
    v3 = v19;
    if (v5)
    {
      if (-[UITextField adjustsFontSizeToFitWidth](self, "adjustsFontSizeToFitWidth"))
      {
        -[UITextField textInputTraits](self, "textInputTraits");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v13 - (double)(unint64_t)objc_msgSend(v16, "insertionPointWidth");

        objc_msgSend(v19, "contentSize");
        if (v18 <= v17)
          objc_msgSend(v19, "setScrollXOffset:scrollYOffset:", 0, objc_msgSend(v19, "scrollYOffset"));
      }
      objc_msgSend(v19, "scrollSelectionToVisible:", 0);
      v3 = v19;
    }
  }
  objc_msgSend(v3, "_applyCorrectTextContainerSize");

}

- (BOOL)_tvHasFloatingFieldEditor
{
  return 0;
}

- (CGRect)_textCanvasViewFrameIncludingContentInsetsFromFontsWhenNotContainedByFieldEditor
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_contentInsetsFromFonts");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIView bounds](self, "bounds");
  -[UITextField textRectForBounds:](self, "textRectForBounds:");
  v13 = v7 + v12;
  v15 = v5 + v14;
  v17 = v16 - (v7 + v11);
  v19 = v18 - (v5 + v9);
  result.size.height = v19;
  result.size.width = v17;
  result.origin.y = v15;
  result.origin.x = v13;
  return result;
}

- (UITextInteractionAssistant)interactionAssistant
{
  return self->_interactionAssistant;
}

- (id)_fieldEditorHostAllowingCreation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_getAssociatedObject(self, &FieldEditorHostKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = 1;
  else
    v6 = !v3;
  if (!v6)
  {
    +[_UIFieldEditorHost fieldEditorHostForTextField:](_UIFieldEditorHost, "fieldEditorHostForTextField:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(self, &FieldEditorHostKey, v5, (void *)1);
  }
  return v5;
}

- (BOOL)_shouldShrinkPlaceholderToFitForAccessibility
{
  void *v4;
  NSString *v5;
  BOOL IsAccessibilityCategory;

  if (!dyld_program_sdk_at_least()
    || (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_TextFieldShrinksPlaceholderToFitForAXSizes, (uint64_t)CFSTR("TextFieldShrinksPlaceholderToFitForAXSizes")) & 1) == 0&& !byte_1ECD7696C)
  {
    return 0;
  }
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  return IsAccessibilityCategory;
}

- (id)_fieldEditorHost
{
  return -[UITextField _fieldEditorHostAllowingCreation:](self, "_fieldEditorHostAllowingCreation:", 0);
}

- (void)_syncTypingAttributesWithDefaultAttribute:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
  {
    v15 = v4;
    if (!objc_msgSend(v4, "isEqualToString:", *(_QWORD *)off_1E1678D90)
      || (v6 = -[UITextField _tvHasFloatingFieldEditor](self, "_tvHasFloatingFieldEditor"), v5 = v15, !v6))
    {
      v7 = -[UITextField _fieldEditor](self, "_fieldEditor");
      objc_msgSend(v7, "_textStorage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "defaultAttributes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[UITextField _inputController](self, "_inputController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_addToTypingAttributes:value:", v15, v11);

      objc_msgSend(v7, "_textContainer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextField _inputController](self, "_inputController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "typingAttributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAttributesForExtraLineFragment:", v14);

      v5 = v15;
    }
  }

}

- (id)_systemBackgroundView
{
  UITextField *v2;
  UITextField *v3;
  _UITextFieldBackgroundProvider *backgroundProvider;
  _UITextFieldBackgroundProvider *v5;
  void *v6;
  id v7;

  v2 = self;
  v3 = v2;
  if (v2 && (*((_BYTE *)&v2->_textFieldFlags + 4) & 4) != 0)
    backgroundProvider = v2->_backgroundProvider;
  else
    backgroundProvider = 0;
  v5 = backgroundProvider;

  -[_UITextFieldBackgroundProvider backgroundView](v5, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (id)_backgroundCoverView
{
  return self->_backgroundCoverView;
}

- (CGRect)_backgroundBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIView bounds](self, "bounds");
  -[UITextField borderRectForBounds:](self, "borderRectForBounds:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (UIEdgeInsets)_padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGSize)_textSizeUsingFullFontSize:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  _UICascadingTextStorage *v7;
  _UICascadingTextStorage *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  __CFString *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  v3 = a3;
  -[UIResponder _caretRect](self, "_caretRect");
  v6 = v5;
  v7 = self->_textStorage;
  v8 = v7;
  if ((*((_BYTE *)&self->_textFieldFlags + 2) & 2) != 0)
  {
    -[_UICascadingTextStorage _UIKBStringWideAttributeValueForKey:](v7, "_UIKBStringWideAttributeValueForKey:", *(_QWORD *)off_1E1678D90);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && -[NSConcreteTextStorage length](v8, "length"))
    {
      -[_UICascadingTextStorage size](v8, "size");
      v11 = v10;
      v13 = v12;
      goto LABEL_13;
    }

  }
  -[_UICascadingTextStorage font](v8, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UITextField _fullFontSize](self, "_fullFontSize");
    objc_msgSend(v9, "fontWithSize:");
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v14;
  }
  if (!v9)
  {
    objc_msgSend(off_1E167A828, "defaultFontSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UITextField text](self, "text");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = -[__CFString length](v15, "length");
  v17 = CFSTR(" ");
  if (v16)
    v17 = v15;
  v18 = v17;

  -[__CFString _legacy_sizeWithFont:](v18, "_legacy_sizeWithFont:", v9);
  v11 = v19;
  v13 = v20;

LABEL_13:
  if (v13 >= v6)
    v6 = v13;

  v21 = v11;
  v22 = v6;
  result.height = v22;
  result.width = v21;
  return result;
}

- (NSString)text
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[UITextField _text](self, "_text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField textInputTraits](self, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "textTrimmingSet");

  if (v5)
  {
    objc_msgSend(v3, "_stringByTrimmingCharactersInCFCharacterSet:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  v7 = -[UITextField _shouldObscureInput](self, "_shouldObscureInput");
  v8 = (void *)objc_msgSend(v3, "copy");
  v9 = v8;
  if (v7 && v8)
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "_newZStringWithString:", v8);
  else
    v10 = objc_msgSend(v8, "copy");
  v11 = (void *)v10;

  return (NSString *)v11;
}

- (double)_fullFontSize
{
  _UIFullFontSize *fullFontSize;
  double result;
  _QWORD v4[5];

  fullFontSize = self->_fullFontSize;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__UITextField__fullFontSize__block_invoke;
  v4[3] = &unk_1E16B4CF0;
  v4[4] = self;
  -[_UIFullFontSize valueWithEvaluationIfNeeded:](fullFontSize, "valueWithEvaluationIfNeeded:", v4);
  return result;
}

- (CGRect)editRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIView bounds](self, "bounds");
  -[UITextField editingRectForBounds:](self, "editingRectForBounds:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)actualMinimumFontSize
{
  char v3;
  double minimumFontSize;
  double v5;

  v3 = dyld_program_sdk_at_least();
  minimumFontSize = self->_minimumFontSize;
  if ((v3 & 1) == 0)
  {
    objc_msgSend(off_1E167A828, "systemMinimumFontSize");
    if (minimumFontSize < v5)
      return v5;
  }
  return minimumFontSize;
}

- (BOOL)_shouldAnimateTransitionForAccessoryView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[UIView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && -[UITextField _isAccessoryViewAnimatable:](self, "_isAccessoryViewAnimatable:", v4))
  {
    -[UIView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom") != 6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)placeholder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NSAttributedString string](self->_overriddenPlaceholder, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UILabel text](self->_placeholderLabel, "text");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (BOOL)clearsPlaceholderOnBeginEditing
{
  return (*(_BYTE *)&self->_textFieldFlags >> 6) & 1;
}

double __28__UITextField__fullFontSize__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend(off_1E167A828, "defaultFontSize");
  v3 = v2;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 898) & 2) != 0 && dyld_program_sdk_at_least())
  {
    v14 = 0;
    v15 = (double *)&v14;
    v16 = 0x2020000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    objc_msgSend(*(id *)(a1 + 32), "attributedText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    objc_msgSend(*(id *)(a1 + 32), "attributedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)off_1E1678D90;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __28__UITextField__fullFontSize__block_invoke_2;
    v9[3] = &unk_1E16E6368;
    *(double *)&v9[6] = v3;
    v9[7] = v5;
    v9[4] = &v14;
    v9[5] = &v10;
    objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v5, 0, v9);

    if (*((_BYTE *)v11 + 24))
      v3 = v15[3];
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  return v3;
}

- (id)automaticallySelectedOverlay
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  -[UITextField customOverlayContainer](self, "customOverlayContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[UIView _scroller](self, "_scroller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[UIView superview](self, "superview");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v4 = (id)v7;
        while (1)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          objc_msgSend(v4, "superview");
          v8 = objc_claimAutoreleasedReturnValue();

          v4 = (id)v8;
          if (!v8)
            goto LABEL_8;
        }
      }
      else
      {
LABEL_8:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v6, "_flipsHorizontalAxis") & 1) != 0)
          goto LABEL_15;
        v4 = v6;
        if (objc_msgSend(v4, "isScrollEnabled"))
        {
          if ((objc_msgSend(v4, "_canScrollY") & 1) != 0)
          {
            v5 = v4;
            goto LABEL_16;
          }
          v5 = v4;
          if ((objc_msgSend(v4, "_canScrollX") & 1) != 0)
            goto LABEL_16;
        }
      }

    }
LABEL_15:
    -[UIView keyboardSceneDelegate](self, "keyboardSceneDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v6;
    goto LABEL_16;
  }
  v4 = v3;
  v5 = v4;
LABEL_16:

  return v5;
}

- (id)customOverlayContainer
{
  UITextField *WeakRetained;
  void *v4;

  WeakRetained = (UITextField *)objc_loadWeakRetained(&self->_delegate);
  v4 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0 && WeakRetained != self)
  {
    -[UITextField customOverlayContainer](WeakRetained, "customOverlayContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_destroyWeak((id *)&self->_textDropDelegate);
  objc_destroyWeak((id *)&self->_textDragDelegate);
  objc_storeStrong((id *)&self->_tvCustomFocusedTextColor, 0);
  objc_storeStrong((id *)&self->_tvCustomTextColor, 0);
  objc_destroyWeak((id *)&self->_pasteDelegate);
  objc_storeStrong((id *)&self->_selectionContainerView, 0);
  objc_storeStrong((id *)&self->_cuiStyleEffectConfiguration, 0);
  objc_storeStrong((id *)&self->_cuiCatalog, 0);
  objc_storeStrong((id *)&self->_textCanvasView, 0);
  objc_storeStrong((id *)&self->_metricsProvider, 0);
  objc_storeStrong((id *)&self->_backgroundProvider, 0);
  objc_storeStrong((id *)&self->_draggableGeometry, 0);
  objc_storeStrong((id *)&self->_textDragDropSupport, 0);
  objc_storeStrong((id *)&self->_inputAssistantItem, 0);
  objc_storeStrong((id *)&self->_recentsAccessoryView, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
  objc_storeStrong((id *)&self->_linkTextAttributes, 0);
  objc_storeStrong((id *)&self->_textLayoutController, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_fieldEditor, 0);
  objc_storeStrong((id *)&self->_selectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_interactionAssistant, 0);
  objc_storeStrong((id *)&self->_overriddenPlaceholder, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_prefixLabel, 0);
  objc_storeStrong((id *)&self->_suffixLabel, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_contentBackdropView, 0);
  objc_storeStrong((id *)&self->_floatingContainerView, 0);
  objc_storeStrong((id *)&self->_cachedDefaultClearButtonImages, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_fullFontSize, 0);
  objc_storeStrong((id *)&self->_nonAtomTraits, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_backgroundCoverView, 0);
  objc_storeStrong((id *)&self->_contentCoverView, 0);
  objc_storeStrong((id *)&self->_rightView, 0);
  objc_storeStrong((id *)&self->_leftView, 0);
  objc_storeStrong((id *)&self->_disabledBackground, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_destroyWeak(&self->_delegate);
}

- (int64_t)textDragOptions
{
  return self->_textDragOptions;
}

- (id)_textGeometry
{
  _UITextStorageDraggableGeometry *draggableGeometry;
  _UITextStorageDraggableGeometry *v4;
  _UITextStorageDraggableGeometry *v5;

  draggableGeometry = self->_draggableGeometry;
  if (!draggableGeometry)
  {
    v4 = -[_UITextStorageDraggableGeometry initWithView:textStorage:]([_UITextStorageDraggableGeometry alloc], "initWithView:textStorage:", self, self->_textStorage);
    v5 = self->_draggableGeometry;
    self->_draggableGeometry = v4;

    draggableGeometry = self->_draggableGeometry;
  }
  return draggableGeometry;
}

- (BOOL)resignFirstResponder
{
  _BOOL4 v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 8) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v3 = -[UITextField _showsContentCoverView](self, "_showsContentCoverView");
    *(_QWORD *)&self->_textFieldFlags |= 0x800uLL;
    v11.receiver = self;
    v11.super_class = (Class)UITextField;
    v4 = -[UIResponder resignFirstResponder](&v11, sel_resignFirstResponder);
    *(_QWORD *)&self->_textFieldFlags &= ~0x800uLL;
    if (v4)
    {
      -[UITextField interactionAssistant](self, "interactionAssistant");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSelectionDisplayVisible:", 0);

      -[UITextField interactionAssistant](self, "interactionAssistant");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deactivateSelection");

      -[UITextField _inputController](self, "_inputController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "didEndEditing");

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("UIKeyboardDidShowNotification"), 0);

    if (v3 && -[UITextField _shouldObscureInput](self, "_shouldObscureInput"))
    {
      -[UITextField _fieldEditor](self, "_fieldEditor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_obscureAllText");

    }
  }
  return v4;
}

- (BOOL)canBecomeFirstResponder
{
  _BOOL8 v3;
  _BOOL4 v4;
  BOOL v5;
  _BOOL4 v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags;

  LODWORD(v3) = -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled");
  if (v3)
  {
    v4 = -[UIView _containedInAbsoluteResponderChain](self, "_containedInAbsoluteResponderChain");
    v5 = v4;
    if (v4 && (*((_BYTE *)&self->_textFieldFlags + 1) & 4) != 0)
    {
      v9 = 0;
    }
    else
    {
      if (-[UIControl isEnabled](self, "isEnabled"))
      {
        v6 = -[UITextField _delegateShouldBeginEditing](self, "_delegateShouldBeginEditing");
        v7 = 512;
        if (!v6)
          v7 = 0;
        v8 = *(_QWORD *)&self->_textFieldFlags & 0xFFFFFFFFFFFFFDFFLL | v7;
      }
      else
      {
        v8 = *(_QWORD *)&self->_textFieldFlags & 0xFFFFFFFFFFFFFDFFLL;
      }
      self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)v8;
      v9 = (2 * (int)v8) & 0x400;
      if (v5)
        v9 = 0;
    }
    textFieldFlags = self->_textFieldFlags;
    self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&textFieldFlags & 0xFFFFFFFFFFFFFBFFLL | v9);
    return (*(unint64_t *)&textFieldFlags >> 9) & 1;
  }
  return v3;
}

- (BOOL)_delegateShouldBeginEditing
{
  id WeakRetained;
  char v4;
  BOOL v5;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(WeakRetained, "textFieldShouldBeginEditing:", self);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v5 = 1;
      goto LABEL_7;
    }
    v4 = objc_msgSend(WeakRetained, "textFieldShouldStartEditing:", self);
  }
  v5 = v4;
LABEL_7:

  return v5;
}

- (UIColor)selectionHighlightColor
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  -[UITextField textInputTraits](self, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionHighlightColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled")&& (-[UIView traitCollection](self, "traitCollection"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "userInterfaceStyle"), v5, v6 == 2))
  {
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.35);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return (UIColor *)v8;
}

- (BOOL)_useGesturesForEditableContent
{
  return 1;
}

- (CGRect)_selectionClipRect
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
  CGRect result;

  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0
    && -[UITextField _tvHasFloatingFieldEditor](self, "_tvHasFloatingFieldEditor"))
  {
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_selectionClipRect");
  }
  else
  {
    -[UIView bounds](self, "bounds");
    -[UITextField editingRectForBounds:](self, "editingRectForBounds:");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[UITextField textInputView](self, "textInputView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "convertRect:fromView:", self, v9, v11, v13, v15);
  }
  v16 = v4;
  v17 = v5;
  v18 = v6;
  v19 = v7;

  v20 = v16;
  v21 = v17;
  v22 = v18;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (id)selectionContainerView
{
  _UITouchPassthroughView *selectionContainerView;
  _UITouchPassthroughView *v4;
  _UITouchPassthroughView *v5;
  _UITouchPassthroughView *v6;

  selectionContainerView = self->_selectionContainerView;
  if (!selectionContainerView)
  {
    v4 = [_UITouchPassthroughView alloc];
    v5 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_selectionContainerView;
    self->_selectionContainerView = v5;

    -[UITextField _ensureSelectionContainerViewSubviewOrdering](self, "_ensureSelectionContainerViewSubviewOrdering");
    selectionContainerView = self->_selectionContainerView;
  }
  return selectionContainerView;
}

- (UITextRange)selectedTextRange
{
  void *v2;
  void *v3;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextRange *)v3;
}

- (id)selectionRectsForRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionRectsForRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UITextRange)markedTextRange
{
  return -[UIFieldEditor markedTextRange](self->_fieldEditor, "markedTextRange");
}

- (BOOL)_shouldSuppressSelectionHandles
{
  return 0;
}

- (UITextPosition)endOfDocument
{
  void *v2;
  void *v3;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextPosition *)v3;
}

void __37__UITextField__invalidateDefaultFont__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "defaultTextAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 32), "_defaultFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(_QWORD *)off_1E1678D90);

  objc_msgSend(*(id *)(a1 + 32), "setDefaultTextAttributes:", v4);
}

- (NSDictionary)defaultTextAttributes
{
  return -[_UICascadingTextStorage defaultAttributes](self->_textStorage, "defaultAttributes");
}

void __55__UITextField__initWithFrame_textLayoutManagerEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 824), "textColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, *(_QWORD *)off_1E1678D98);

  objc_msgSend(*(id *)(a1 + 32), "_defaultFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(_QWORD *)off_1E1678D90);

  objc_msgSend(*(id *)(a1 + 32), "setDefaultTextAttributes:", v4);
  if (objc_msgSend((id)objc_opt_class(), "_wantsFadedEdges"))
    objc_msgSend(*(id *)(a1 + 32), "setNonEditingLinebreakMode:", 2);

}

- (id)_defaultFont
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 5)
  {
    if (-[UITextField controlSize](self, "controlSize") == 1)
      objc_msgSend(off_1E167A828, "smallSystemFontSize");
    else
      objc_msgSend(off_1E167A828, "defaultFontSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setNonEditingLinebreakMode:(int64_t)a3
{
  -[_UICascadingTextStorage setLineBreakMode:](self->_textStorage, "setLineBreakMode:", a3);
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITextField;
  -[UIView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[UITextField _updateForTintColor](self, "_updateForTintColor");
}

- (void)traitCollectionDidChange:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  -[UIView traitCollection](self, "traitCollection");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_focusSystemState") == 2)
    -[UITextField _installSelectGestureRecognizer](self, "_installSelectGestureRecognizer");
  else
    -[UITextField _uninstallSelectGestureRecognizer](self, "_uninstallSelectGestureRecognizer");
  v6 = objc_msgSend(v4, "userInterfaceIdiom");
  if (v6 == objc_msgSend(v5, "userInterfaceIdiom"))
    -[_UITextFieldBackgroundProvider traitCollectionDidChange:](self->_backgroundProvider, "traitCollectionDidChange:", v4);
  else
    -[UITextField _invalidateBackgroundProvider](self, "_invalidateBackgroundProvider");
  if (v5 && (!v4 || v5[13] != v4[13] || v5[15] != v4[15]))
    -[UITextField _adjustFontForAccessibilityTraits:](self, "_adjustFontForAccessibilityTraits:", objc_msgSend(v5, "legibilityWeight") != objc_msgSend(v4, "legibilityWeight"));
  v7 = objc_msgSend(v5, "userInterfaceStyle");
  if (v7 != objc_msgSend(v4, "userInterfaceStyle"))
  {
    -[UITextField _updateTextEffectsConfigurationIfNeeded](self, "_updateTextEffectsConfigurationIfNeeded");
    v8 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
      objc_msgSend(v9, "traitCollectionDidChange");
    else
      objc_msgSend(v9, "updateRenderConfigForCurrentResponder");

  }
  if (_TextFieldScalesClearButton())
    -[UITextField _invalidateCachedDefaultClearButtonImages](self, "_invalidateCachedDefaultClearButtonImages");
  -[UITextField setNeedsLayout](self, "setNeedsLayout");
  v11.receiver = self;
  v11.super_class = (Class)UITextField;
  -[UIView traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);

}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  UITextDragDropSupport *v5;
  UITextDragDropSupport *textDragDropSupport;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    if (!self->_textDragDropSupport)
    {
      +[UITextDragDropSupport installTextDragDropOnView:](UITextDragDropSupport, "installTextDragDropOnView:", self);
      v5 = (UITextDragDropSupport *)objc_claimAutoreleasedReturnValue();
      textDragDropSupport = self->_textDragDropSupport;
      self->_textDragDropSupport = v5;

    }
    -[UITextField _createInteractionAssistant](self, "_createInteractionAssistant");
    objc_msgSend(v8, "_focusSystem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[UITextField _installSelectGestureRecognizer](self, "_installSelectGestureRecognizer");
    else
      -[UITextField _uninstallSelectGestureRecognizer](self, "_uninstallSelectGestureRecognizer");
    v4 = v8;
  }

}

- (void)_uninstallSelectGestureRecognizer
{
  UITapGestureRecognizer *selectGestureRecognizer;

  if (self->_selectGestureRecognizer)
  {
    -[UIView removeGestureRecognizer:](self, "removeGestureRecognizer:");
    selectGestureRecognizer = self->_selectGestureRecognizer;
    self->_selectGestureRecognizer = 0;

  }
}

- (void)_createInteractionAssistant
{
  UITextInteractionAssistant *v3;
  UITextInteractionAssistant *interactionAssistant;

  if (!self->_interactionAssistant)
  {
    v3 = -[UITextInteractionAssistant initWithView:]([UITextInteractionAssistant alloc], "initWithView:", self);
    interactionAssistant = self->_interactionAssistant;
    self->_interactionAssistant = v3;

  }
}

- (void)_updateForTintColor
{
  void *v3;
  void *v4;
  void *v5;
  UIFieldEditor *fieldEditor;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  id v11;

  -[UITextField textInputTraits](self, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _inheritedInteractionTintColor](self, "_inheritedInteractionTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setColorsToMatchTintColor:", v4);

  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
  {
    -[UITextField interactionAssistant](self, "interactionAssistant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateSelection");

    fieldEditor = self->_fieldEditor;
    -[UIView _inheritedInteractionTintColor](self, "_inheritedInteractionTintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFieldEditor _setColorsToMatchTintColor:](fieldEditor, "_setColorsToMatchTintColor:", v7);

    -[UITextField interactionAssistant](self, "interactionAssistant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activateSelection");

  }
  -[UITextField _invalidateCachedDefaultClearButtonImages](self, "_invalidateCachedDefaultClearButtonImages");
  if (-[UITextField isEditing](self, "isEditing"))
  {
    v9 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
      objc_msgSend(v10, "traitCollectionDidChange");
    else
      objc_msgSend(v10, "updateRenderConfigForCurrentResponder");

  }
}

- (void)_invalidateCachedDefaultClearButtonImages
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[NSMutableDictionary removeAllObjects](self->_cachedDefaultClearButtonImages, "removeAllObjects");
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 6)
  {
    -[UITextField _clearButtonImageForState:](self, "_clearButtonImageForState:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton configuration](self->_clearButton, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v5);

    -[UIButton _visualProvider](self->_clearButton, "_visualProvider");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applyConfiguration");
  }
  else
  {
    -[UIButton _visualProvider](self->_clearButton, "_visualProvider");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_updateImageView");
  }

}

- (void)_updateTextEffectsConfigurationIfNeeded
{
  __CFString *v3;
  void *v4;
  void *v5;
  id v6;
  char v7;
  void *v8;
  CUIStyleEffectConfiguration *cuiStyleEffectConfiguration;
  id v10;

  if (self->_cuiStyleEffectConfiguration)
  {
    -[UIView traitCollection](self, "traitCollection");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[UITraitCollection _styleEffectAppearanceName](v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[CUIStyleEffectConfiguration appearanceName](self->_cuiStyleEffectConfiguration, "appearanceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v4;
    v6 = v5;
    if (v10 == v6)
    {

    }
    else
    {
      if (v10 && v6)
      {
        v7 = objc_msgSend(v10, "isEqual:", v6);

        if ((v7 & 1) != 0)
          goto LABEL_11;
      }
      else
      {

      }
      v8 = (void *)-[CUIStyleEffectConfiguration copy](self->_cuiStyleEffectConfiguration, "copy");
      objc_msgSend(v8, "setAppearanceName:", v10);
      cuiStyleEffectConfiguration = self->_cuiStyleEffectConfiguration;
      self->_cuiStyleEffectConfiguration = (CUIStyleEffectConfiguration *)v8;

      -[UITextField _propagateCuiProperties](self, "_propagateCuiProperties");
    }
LABEL_11:

  }
}

- (void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder
{
  NSAttributedString *v5;

  v5 = attributedPlaceholder;
  if (self->_overriddenPlaceholder)
    objc_storeStrong((id *)&self->_overriddenPlaceholder, attributedPlaceholder);
  else
    -[UITextField _setAttributedPlaceholder:](self, "_setAttributedPlaceholder:");

}

- (void)setPlaceholder:(NSString *)placeholder
{
  objc_class *v4;
  NSString *v5;
  id v6;
  const __CFString *v7;
  NSAttributedString *v8;
  NSAttributedString *overriddenPlaceholder;
  NSString *v10;

  if (self->_overriddenPlaceholder)
  {
    v4 = (objc_class *)MEMORY[0x1E0CB3498];
    v5 = placeholder;
    v6 = [v4 alloc];
    if (v5)
      v7 = (const __CFString *)v5;
    else
      v7 = &stru_1E16EDF20;
    v8 = (NSAttributedString *)objc_msgSend(v6, "initWithString:", v7);

    overriddenPlaceholder = self->_overriddenPlaceholder;
    self->_overriddenPlaceholder = v8;
  }
  else
  {
    v10 = placeholder;
    -[UITextField _setPlaceholder:](self, "_setPlaceholder:", v10);
    overriddenPlaceholder = (NSAttributedString *)v10;
  }

}

- (void)_setAttributedPlaceholder:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "length"))
    -[UITextField createPlaceholderIfNecessary](self, "createPlaceholderIfNecessary");
  if (objc_msgSend(v8, "length")
    || (-[UILabel attributedText](self->_placeholderLabel, "attributedText"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "length"),
        v4,
        v5))
  {
    -[UILabel attributedText](self->_placeholderLabel, "attributedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqualToAttributedString:", v6);

    if ((v7 & 1) == 0)
    {
      -[UILabel setAttributedText:](self->_placeholderLabel, "setAttributedText:", v8);
      -[UITextField finishedSettingPlaceholder](self, "finishedSettingPlaceholder");
    }
  }

}

- (void)_setPlaceholder:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "length"))
    -[UITextField createPlaceholderIfNecessary](self, "createPlaceholderIfNecessary");
  if (objc_msgSend(v8, "length")
    || (-[UILabel text](self->_placeholderLabel, "text"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "length"),
        v4,
        v5))
  {
    -[UILabel text](self->_placeholderLabel, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqualToString:", v6);

    if ((v7 & 1) == 0)
    {
      -[UILabel setText:](self->_placeholderLabel, "setText:", v8);
      -[UITextField finishedSettingPlaceholder](self, "finishedSettingPlaceholder");
    }
  }

}

- (void)createPlaceholderIfNecessary
{
  _UICascadingTextStorage *v3;
  UITextFieldLabel *v4;
  UITextFieldLabel *placeholderLabel;
  id v6;

  if (!self->_placeholderLabel)
  {
    v3 = self->_textStorage;
    -[_UICascadingTextStorage font](v3, "font");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = -[UITextField createPlaceholderLabelWithFont:andTextAlignment:](self, "createPlaceholderLabelWithFont:andTextAlignment:", v6, -[_UICascadingTextStorage textAlignment](v3, "textAlignment"));
    placeholderLabel = self->_placeholderLabel;
    self->_placeholderLabel = v4;

  }
}

- (void)finishedSettingPlaceholder
{
  -[UITextField setNeedsLayout](self, "setNeedsLayout");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UITextField;
  -[UIControl _didMoveFromWindow:toWindow:](&v13, sel__didMoveFromWindow_toWindow_, v6, v7);
  if (v7 && dyld_program_sdk_at_least())
  {
    objc_msgSend(v7, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");
    objc_msgSend(v6, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == objc_msgSend(v10, "userInterfaceIdiom"))
    {

    }
    else
    {
      objc_msgSend(v7, "traitCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "userInterfaceIdiom");

      if (v12 == 3)
        -[UITextField _adjustFontForAccessibilityTraits:](self, "_adjustFontForAccessibilityTraits:", 1);
    }
  }

}

- (void)_propagateCuiProperties
{
  UIFieldEditor *fieldEditor;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  fieldEditor = self->_fieldEditor;
  if (fieldEditor)
    -[UIFieldEditor _updateLayoutManagerStyleEffectConfiguration](fieldEditor, "_updateLayoutManagerStyleEffectConfiguration");
  if (self->_placeholderLabel)
  {
    -[UITextField _cuiCatalog](self, "_cuiCatalog");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setCuiCatalog:](self->_placeholderLabel, "_setCuiCatalog:", v4);

    -[UITextField _cuiStyleEffectConfiguration](self, "_cuiStyleEffectConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setCuiStyleEffectConfiguration:](self->_placeholderLabel, "_setCuiStyleEffectConfiguration:", v5);

  }
  if (self->_suffixLabel)
  {
    -[UITextField _cuiCatalog](self, "_cuiCatalog");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setCuiCatalog:](self->_suffixLabel, "_setCuiCatalog:", v6);

    -[UITextField _cuiStyleEffectConfiguration](self, "_cuiStyleEffectConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setCuiStyleEffectConfiguration:](self->_suffixLabel, "_setCuiStyleEffectConfiguration:", v7);

  }
  if (self->_prefixLabel)
  {
    -[UITextField _cuiCatalog](self, "_cuiCatalog");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setCuiCatalog:](self->_prefixLabel, "_setCuiCatalog:", v8);

    -[UITextField _cuiStyleEffectConfiguration](self, "_cuiStyleEffectConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setCuiStyleEffectConfiguration:](self->_prefixLabel, "_setCuiStyleEffectConfiguration:", v9);

  }
  if (self->_label)
  {
    -[UITextField _cuiCatalog](self, "_cuiCatalog");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setCuiCatalog:](self->_label, "_setCuiCatalog:", v10);

    -[UITextField _cuiStyleEffectConfiguration](self, "_cuiStyleEffectConfiguration");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel _setCuiStyleEffectConfiguration:](self->_label, "_setCuiStyleEffectConfiguration:", v11);

  }
}

- (id)createPlaceholderLabelWithFont:(id)a3 andTextAlignment:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = objc_alloc(-[UITextField _placeholderLabelClass](self, "_placeholderLabelClass", a3, a4));
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UITextField _placeholderColor](self, "_placeholderColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v7);

  objc_msgSend(v6, "setOpaque:", 0);
  objc_msgSend(v6, "setBackgroundColor:", 0);
  -[_UICascadingTextStorage font](self->_textStorage, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v8);

  objc_msgSend(v6, "setTextAlignment:", -[_UICascadingTextStorage textAlignment](self->_textStorage, "textAlignment"));
  objc_msgSend(v6, "_setOverrideUserInterfaceRenderingMode:", -[UITextField _preferredRenderingModeForPlaceholder](self, "_preferredRenderingModeForPlaceholder"));
  -[UITextField _cuiCatalog](self, "_cuiCatalog");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setCuiCatalog:", v9);

  -[UITextField _cuiStyleEffectConfiguration](self, "_cuiStyleEffectConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setCuiStyleEffectConfiguration:", v10);

  return v6;
}

- (CUIStyleEffectConfiguration)_cuiStyleEffectConfiguration
{
  return self->_cuiStyleEffectConfiguration;
}

- (CUICatalog)_cuiCatalog
{
  return self->_cuiCatalog;
}

- (int64_t)_preferredRenderingModeForPlaceholder
{
  return 0;
}

- (Class)_placeholderLabelClass
{
  return (Class)objc_opt_class();
}

- (void)_becomeFirstResponder
{
  void *v3;
  _BOOL4 deferringBecomeFirstResponder;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITextField;
  -[UIResponder _becomeFirstResponder](&v6, sel__becomeFirstResponder);
  -[UITextField textInputTraits](self, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "deferBecomingResponder"))
  {
    deferringBecomeFirstResponder = self->_deferringBecomeFirstResponder;

    if (!deferringBecomeFirstResponder)
    {
      self->_deferringBecomeFirstResponder = 1;
      return;
    }
  }
  else
  {

  }
  self->_deferringBecomeFirstResponder = 0;
  -[UITextField _attachFieldEditor](self, "_attachFieldEditor");
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollEnabled:", 0);

  -[_UITextFieldBackgroundProvider didChangeFirstResponder](self->_backgroundProvider, "didChangeFirstResponder");
  -[UITextField _updateSelectionGestures](self, "_updateSelectionGestures");
  -[UITextField _notifyDidBeginEditing](self, "_notifyDidBeginEditing");
}

- (void)_attachFieldEditor
{
  void *v3;
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  UITextField *v12;

  if (-[UITextField _showsContentCoverView](self, "_showsContentCoverView"))
  {
    -[UITextField _invalidateAllGlyphsAndTextLayout](self, "_invalidateAllGlyphsAndTextLayout");
  }
  else
  {
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __33__UITextField__attachFieldEditor__block_invoke;
    v10[3] = &unk_1E16B1B50;
    v9 = v3;
    v11 = v9;
    v12 = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);
    textFieldFlags = self->_textFieldFlags;
    if ((*(_WORD *)&textFieldFlags & 0x100) == 0)
    {
      self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(unint64_t *)&textFieldFlags | 0x100);
      -[UITextField _willAttachFieldEditor](self, "_willAttachFieldEditor");
      -[UITextField _addFieldEditorToView](self, "_addFieldEditorToView");
      objc_msgSend(v9, "activateEditor");
    }
    if (-[UIView isFirstResponder](self, "isFirstResponder"))
    {
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      if (-[UITextField clearsOnBeginEditing](self, "clearsOnBeginEditing")
        && -[UITextField _delegateShouldClear](self, "_delegateShouldClear"))
      {
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E16EDF20);
        objc_msgSend(v9, "setAttributedText:", v6);

      }
      -[UITextField _inputController](self, "_inputController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAllowsEditingTextAttributes:", (*(_QWORD *)&self->_textFieldFlags >> 16) & 1);

      if ((*(_WORD *)&textFieldFlags & 0x100) == 0)
      {
        -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", 0x10000, 0);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__applicationResuming_, CFSTR("UIApplicationResumedNotification"), UIApp);

      }
      -[UITextField _activateSelectionView](self, "_activateSelectionView");

    }
    if ((*(_WORD *)&textFieldFlags & 0x100) == 0)
      -[UITextField _didAttachFieldEditor](self, "_didAttachFieldEditor");
    -[UITextField setNeedsLayout](self, "setNeedsLayout");

  }
}

- (BOOL)clearsOnBeginEditing
{
  return (*(_QWORD *)&self->_textFieldFlags & 0xC0000) == 0x40000;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  UITextField *v4;
  char v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  -[UIView keyboardSceneDelegate](self, "keyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UITextField keyboardAppearance](self, "keyboardAppearance") == 127
    || -[UIView isFirstResponder](self, "isFirstResponder")
    && (objc_msgSend(v3, "responder"),
        v4 = (UITextField *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4 != self))
  {
    objc_msgSend(v3, "_beginIgnoringReloadInputViews");
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  v6 = -[UIView isFirstResponder](self, "isFirstResponder");
  v12.receiver = self;
  v12.super_class = (Class)UITextField;
  v7 = -[UIView becomeFirstResponder](&v12, sel_becomeFirstResponder);
  if (v7)
  {
    -[UITextField scrollTextFieldToVisibleIfNecessary](self, "scrollTextFieldToVisibleIfNecessary");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__receivedKeyboardDidShowNotification_, CFSTR("UIKeyboardDidShowNotification"), 0);

    if (-[NSConcreteTextStorage length](self->_textStorage, "length"))
    {
      if (v6 && -[UITextField textSelectionBehavior](self, "textSelectionBehavior") == 3)
        -[UIFieldEditor _updateTextSelectionFromBehavior](self->_fieldEditor, "_updateTextSelectionFromBehavior");
    }
    else
    {
      -[UITextField setClearsOnInsertion:](self, "setClearsOnInsertion:", 0);
    }
    if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0
      && -[UIScrollView isScrollAnimating](self->_fieldEditor, "isScrollAnimating"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextField _fieldEditor](self, "_fieldEditor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__initialScrollDidFinish_, CFSTR("UITextSelectionDidScroll"), v10);

      if ((v5 & 1) == 0)
        goto LABEL_24;
      goto LABEL_23;
    }
    if (-[UITextField _showsContentCoverView](self, "_showsContentCoverView"))
    {
      -[UITextField setNeedsLayout](self, "setNeedsLayout");
      if ((v5 & 1) == 0)
        goto LABEL_24;
      goto LABEL_23;
    }
    -[UITextField _activateSelectionView](self, "_activateSelectionView");
    if ((v5 & 1) != 0)
    {
LABEL_23:
      objc_msgSend(v3, "_endIgnoringReloadInputViews");
      -[UIResponder reloadInputViews](self, "reloadInputViews");
    }
  }
  else if ((v5 & 1) != 0 && objc_msgSend(v3, "_endIgnoringReloadInputViews"))
  {
    objc_msgSend(v3, "forceReloadInputViews");
  }
LABEL_24:

  return v7;
}

- (void)_activateSelectionView
{
  void *v3;
  void *v4;
  id v5;

  -[UITextField inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UITextField interactionAssistant](self, "interactionAssistant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSelectionDisplayVisible:", 1);

    -[UITextField interactionAssistant](self, "interactionAssistant");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activateSelection");

  }
}

- (UITextInputDelegate)inputDelegate
{
  void *v2;
  void *v3;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextInputDelegate *)v3;
}

- (void)setClearsOnInsertion:(BOOL)clearsOnInsertion
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = clearsOnInsertion;
  if (-[UITextField clearsOnInsertion](self, "clearsOnInsertion") != clearsOnInsertion)
  {
    v5 = 0x80000;
    if (!v3)
      v5 = 0;
    self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFFFFFFFF3FFFFLL | v5);
    -[UITextInputTraits setTextSelectionBehavior:](self->_traits, "setTextSelectionBehavior:", -[UITextField textSelectionBehavior](self, "textSelectionBehavior"));
    if (-[UITextField isEditing](self, "isEditing"))
    {
      -[UITextField interactionAssistant](self, "interactionAssistant");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v3)
      {
        objc_msgSend(v6, "deactivateSelection");

        -[UITextField _text](self, "_text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextField setSelectionRange:](self, "setSelectionRange:", 0, objc_msgSend(v8, "length"));
      }
      else
      {
        objc_msgSend(v6, "activateSelection");

        -[UITextField interactionAssistant](self, "interactionAssistant");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setSelectionDisplayVisible:", 1);

        -[UITextField _fieldEditor](self, "_fieldEditor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setTextSelectionBehavior:", -[UITextInputTraits textSelectionBehavior](self->_traits, "textSelectionBehavior"));
      }

      -[UITextField _updateSelectionGestures](self, "_updateSelectionGestures");
    }
  }
}

- (void)_updateSelectionGestures
{
  _BOOL4 v3;
  _BOOL4 v4;
  void *v5;
  id v6;

  -[UITextField interactionAssistant](self, "interactionAssistant");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (-[UITextField isTextDragActive](self, "isTextDragActive")
    || -[UITextField isTextDropActive](self, "isTextDropActive"))
  {
    if (-[UIView isFirstResponder](self, "isFirstResponder"))
      objc_msgSend(v6, "deactivateSelection");
    goto LABEL_5;
  }
  v3 = -[UITextField _showsContentCoverView](self, "_showsContentCoverView");
  v4 = -[UIView isFirstResponder](self, "isFirstResponder");
  if (!v3)
  {
    v5 = v6;
    if (v4)
    {
      objc_msgSend(v6, "activateSelection");
      v5 = v6;
    }
    goto LABEL_12;
  }
  v5 = v6;
  if (!v4)
  {
LABEL_12:
    objc_msgSend(v5, "setGestureRecognizers");
    goto LABEL_6;
  }
  objc_msgSend(v6, "deactivateSelection");
  objc_msgSend(v6, "hideSelectionCommands");
LABEL_5:
  objc_msgSend(v6, "clearGestureRecognizers:", 1);
LABEL_6:

}

- (BOOL)isTextDropActive
{
  UITextDragDropSupport *textDragDropSupport;
  UITextDragDropSupport *v4;
  UITextDragDropSupport *v5;

  textDragDropSupport = self->_textDragDropSupport;
  if (!textDragDropSupport)
  {
    +[UITextDragDropSupport installTextDragDropOnView:](UITextDragDropSupport, "installTextDragDropOnView:", self);
    v4 = (UITextDragDropSupport *)objc_claimAutoreleasedReturnValue();
    v5 = self->_textDragDropSupport;
    self->_textDragDropSupport = v4;

    textDragDropSupport = self->_textDragDropSupport;
  }
  return -[UITextDragDropSupport isDropActive](textDragDropSupport, "isDropActive");
}

- (BOOL)isTextDragActive
{
  UITextDragDropSupport *textDragDropSupport;
  UITextDragDropSupport *v4;
  UITextDragDropSupport *v5;

  textDragDropSupport = self->_textDragDropSupport;
  if (!textDragDropSupport)
  {
    +[UITextDragDropSupport installTextDragDropOnView:](UITextDragDropSupport, "installTextDragDropOnView:", self);
    v4 = (UITextDragDropSupport *)objc_claimAutoreleasedReturnValue();
    v5 = self->_textDragDropSupport;
    self->_textDragDropSupport = v4;

    textDragDropSupport = self->_textDragDropSupport;
  }
  return -[UITextDragDropSupport isDragActive](textDragDropSupport, "isDragActive");
}

- (int64_t)clearingBehavior
{
  return (*(_QWORD *)&self->_textFieldFlags >> 18) & 3;
}

- (void)_didAttachFieldEditor
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id value;

  objc_getAssociatedObject(self, &EditingTokenKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextField.m"), 6181, CFSTR("The textfield is already editing?!"));

  }
  -[UITextField _editingProcessor](self, "_editingProcessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginEditingWithTextStorage:", self->_textStorage);
  value = (id)objc_claimAutoreleasedReturnValue();

  if (value)
  {
    objc_setAssociatedObject(self, &EditingTokenKey, value, (void *)0x301);
    -[UITextField _invalidateAfterUpdatingEditingAttributes](self, "_invalidateAfterUpdatingEditingAttributes");
  }
  -[UITextField _inputController](self, "_inputController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_updateEmptyStringAttributes");

  -[UITextField _ensureSelectionContainerViewSubviewOrdering](self, "_ensureSelectionContainerViewSubviewOrdering");
}

- (id)_editingProcessor
{
  void *v3;

  objc_getAssociatedObject(self, &EditingProcessorKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v3 = (void *)objc_opt_new();
      objc_msgSend(v3, "setDelegate:", self->_visualStyle);
      objc_setAssociatedObject(self, &EditingProcessorKey, v3, (void *)1);
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (void)_addFieldEditorToView
{
  void *v3;
  void *v4;

  -[UITextField _fieldEditorHostAllowingCreation:](self, "_fieldEditorHostAllowingCreation:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addFieldEditor:", v4);

  -[UITextField _invalidateAllGlyphsAndTextLayout](self, "_invalidateAllGlyphsAndTextLayout");
}

- (NSTextStorage)textStorage
{
  void *v3;
  id v4;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "_textLayoutController");

  return (NSTextStorage *)self->_textStorage;
}

- (_NSRange)selectionRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectionRange");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)_notifyDidBeginEditing
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "textFieldDidBecomeFirstResponder:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "textFieldDidBeginEditing:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("UITextFieldTextDidBeginEditingNotification"), self);

}

- (unint64_t)_controlEventsForActionTriggered
{
  return 0x80000;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  UITextInteractionAssistant *interactionAssistant;
  objc_super v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  -[UITextField _stopObservingFieldEditorScroll](self, "_stopObservingFieldEditorScroll");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("UIKeyboardDidShowNotification");
  v7[1] = CFSTR("UIAccessibilityReduceTransparencyStatusDidChangeNotification");
  v7[2] = CFSTR("UIAccessibilityDarkerSystemColorsStatusDidChangeNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  interactionAssistant = self->_interactionAssistant;
  self->_interactionAssistant = 0;

  -[UITextField setInputView:](self, "setInputView:", 0);
  -[UITextField setInputAccessoryView:](self, "setInputAccessoryView:", 0);
  v6.receiver = self;
  v6.super_class = (Class)UITextField;
  -[UIView dealloc](&v6, sel_dealloc);
}

- (void)setInputView:(UIView *)inputView
{
  objc_setProperty_atomic(self, a2, inputView, 848);
}

- (void)setInputAccessoryView:(UIView *)inputAccessoryView
{
  UIView *v5;
  UIView *v6;

  v5 = inputAccessoryView;
  if (self->_inputAccessoryView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_inputAccessoryView, inputAccessoryView);
    v5 = v6;
  }

}

- (void)_stopObservingFieldEditorScroll
{
  UIFieldEditor *fieldEditor;
  void *v4;
  UIFieldEditor *v5;
  id v6;

  fieldEditor = self->_fieldEditor;
  if (fieldEditor)
  {
    v4 = (void *)MEMORY[0x1E0CB37D0];
    v5 = fieldEditor;
    objc_msgSend(v4, "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("UITextSelectionDidScroll"), v5);

  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v14.receiver = self;
  v14.super_class = (Class)UITextField;
  -[UIView setFrame:](&v14, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    -[UITextField _sizeChanged:](self, "_sizeChanged:", height != v11);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textFrameChanged:", self);

  }
}

- (void)_sizeChanged:(BOOL)a3
{
  double Height;
  double v5;
  void *v6;
  void *v7;
  CGRect v8;

  if (a3)
  {
    self->_firstBaselineOffsetFromTop = 0.0;
    self->_lastBaselineOffsetFromBottom = 0.0;
    if ((*(_QWORD *)&self->super.super._viewFlags & 0x400000000000000) != 0)
    {
      if (!self->_didInvalidateBaselineConstraintsOnHeightChange
        || (-[UIView bounds](self, "bounds"),
            Height = CGRectGetHeight(v8),
            -[UIView _calculatedIntrinsicHeight](self, "_calculatedIntrinsicHeight"),
            Height == v5))
      {
        self->_didInvalidateBaselineConstraintsOnHeightChange = 1;
        -[UIView _invalidateBaselineConstraints](self, "_invalidateBaselineConstraints");
      }
    }
    if ((*(_BYTE *)&self->_textFieldFlags & 1) != 0
      || -[UIControl contentVerticalAlignment](self, "contentVerticalAlignment") == UIControlContentVerticalAlignmentCenter
      || -[UIControl contentVerticalAlignment](self, "contentVerticalAlignment") == UIControlContentVerticalAlignmentBottom)
    {
      -[UITextField _setNeedsStyleRecalc](self, "_setNeedsStyleRecalc");
    }
  }
  -[UITextField interactionAssistant](self, "interactionAssistant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_selectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateSelectionRects");

  -[UILabel setNeedsDisplay](self->_placeholderLabel, "setNeedsDisplay");
  -[_UITextCanvas setNeedsDisplay](self->_textCanvasView, "setNeedsDisplay");
  -[_UITextFieldBackgroundProvider setNeedsDisplay](self->_backgroundProvider, "setNeedsDisplay");
}

- (void)_setForegroundViewsAlpha:(double)a3
{
  void *v5;
  double v6;
  void *v7;
  void *v8;
  UITextFieldLabel *placeholderLabel;

  self->_foregroundViewsAlpha = a3;
  -[UIView setAlpha:](self->_iconView, "setAlpha:");
  -[UITextField leftView](self, "leftView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField _maximumAlphaForLeadingView](self, "_maximumAlphaForLeadingView");
  objc_msgSend(v5, "setAlpha:", v6 * a3);

  -[UITextField rightView](self, "rightView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", a3);

  -[UITextField _clearButton](self, "_clearButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", a3);

  -[_UITextCanvas setAlpha:](self->_textCanvasView, "setAlpha:", a3);
  placeholderLabel = self->_placeholderLabel;
  -[UITextField _placeholderLabelAlphaForForegroundViewsAlpha:](self, "_placeholderLabelAlphaForForegroundViewsAlpha:", a3);
  -[UIView setAlpha:](placeholderLabel, "setAlpha:");
}

- (UIView)leftView
{
  uint64_t v2;

  v2 = 8;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) == 0)
    v2 = 7;
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR___UITextField__fieldEditor[v2]));
}

- (UIView)rightView
{
  uint64_t v2;

  v2 = 7;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) == 0)
    v2 = 8;
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR___UITextField__fieldEditor[v2]));
}

- (id)clearButton
{
  _UITextFieldClearButton *clearButton;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _UITextFieldClearButton *v19;
  _UITextFieldClearButton *v20;
  void *v21;
  _UITextFieldClearButton *v22;
  _UITextFieldClearButton *v23;
  double v24;
  double v25;

  clearButton = self->_clearButton;
  if (clearButton)
    return clearButton;
  -[UITextField clearButtonRect](self, "clearButtonRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if (v13 == 6)
  {
    +[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setButtonSize:", 1);
    -[UITextField _clearButtonImageForState:](self, "_clearButtonImageForState:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v15);

    -[UIView traitCollection](self, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferredContentSizeCategory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v17))
    {
      if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v17, CFSTR("UICTContentSizeCategoryAccessibilityXL")) != NSOrderedAscending)
      {
        v18 = 1;
LABEL_9:

        +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleFootnote"), v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setPreferredSymbolConfigurationForImage:", v21);

        +[UIButton buttonWithConfiguration:primaryAction:](_UITextFieldClearButton, "buttonWithConfiguration:primaryAction:", v14, 0);
        v22 = (_UITextFieldClearButton *)objc_claimAutoreleasedReturnValue();
        v23 = self->_clearButton;
        self->_clearButton = v22;

        goto LABEL_10;
      }
      UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v17, CFSTR("UICTContentSizeCategoryAccessibilityM"));
    }
    v18 = 2;
    goto LABEL_9;
  }
  v19 = -[UIButton initWithFrame:]([_UITextFieldClearButton alloc], "initWithFrame:", v5, v7, v9, v11);
  v20 = self->_clearButton;
  self->_clearButton = v19;

  -[_UITextFieldClearButton setImageProvider:](self->_clearButton, "setImageProvider:", self);
LABEL_10:
  -[UIControl addTarget:action:forControlEvents:](self->_clearButton, "addTarget:action:forControlEvents:", self, sel__clearButtonClicked_, 64);
  -[UIView setOpaque:](self->_clearButton, "setOpaque:", 0);
  -[UIView setBackgroundColor:](self->_clearButton, "setBackgroundColor:", 0);
  if (v9 + -44.0 <= 0.0)
    v24 = (v9 + -44.0) * 0.5;
  else
    v24 = 0.0;
  if (v11 + -44.0 <= 0.0)
    v25 = (v11 + -44.0) * 0.5;
  else
    v25 = 0.0;
  -[UIView _setTouchInsets:](self->_clearButton, "_setTouchInsets:", v25, v24, v25, v24);
  clearButton = self->_clearButton;
  return clearButton;
}

- (double)_maximumAlphaForLeadingView
{
  return 1.0;
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  _BOOL8 v5;
  id v6;

  -[UITextField textInputTraits](self, "textInputTraits");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[UITextField _isPasscodeStyle](self, "_isPasscodeStyle");
  if (objc_msgSend(v6, "keyboardAppearance") != a3)
  {
    objc_msgSend(v6, "setKeyboardAppearance:", a3);
    -[UITextField _noteThatKeyboardAppearanceHasChanged](self, "_noteThatKeyboardAppearanceHasChanged");
    -[UITextField _invalidatePasscodeStyleFromStyle:](self, "_invalidatePasscodeStyleFromStyle:", v5);
  }

}

- (void)_noteThatKeyboardAppearanceHasChanged
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__notifySystemKeyboardOfAppearanceChange, 0);
  -[UITextField performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__notifySystemKeyboardOfAppearanceChange, 0, 0.0);
}

- (void)_invalidatePasscodeStyleFromStyle:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  v5 = -[UITextField _isPasscodeStyle](self, "_isPasscodeStyle");
  if (v3 || !v5)
  {
    if (!v3 || v5)
      return;
    -[_UICascadingTextStorage defaultAttributes](self->_textStorage, "defaultAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v14, "removeObjectForKey:", *(_QWORD *)off_1E1678E60);
    -[_UICascadingTextStorage setDefaultAttributes:](self->_textStorage, "setDefaultAttributes:", v14);
    -[UITextField setTextColor:](self, "setTextColor:", 0);
    -[UITextField _invalidateBackgroundProvider](self, "_invalidateBackgroundProvider");
    -[UITextField setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    v8 = 16.0;
    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v8 = 18.0;
      v9 = &unk_1E1A96270;
    }
    else
    {
      v9 = &unk_1E1A96280;
    }
    objc_msgSend(off_1E167A828, "systemFontOfSize:", v8);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[_UICascadingTextStorage defaultAttributes](self->_textStorage, "defaultAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v11, "setObject:forKey:", v9, *(_QWORD *)off_1E1678E60);
    -[_UICascadingTextStorage setDefaultAttributes:](self->_textStorage, "setDefaultAttributes:", v11);
    -[_UICascadingTextStorage setFont:](self->_textStorage, "setFont:", v14);
    -[UITextField setContentVerticalAlignment:](self, "setContentVerticalAlignment:", 0);
    +[UIColor whiteColor](UIColor, "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setTextColor:](self, "setTextColor:", v12);

    -[UITextField _invalidateBackgroundProvider](self, "_invalidateBackgroundProvider");
    -[UITextField setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setTextDragOptions:(int64_t)a3
{
  self->_textDragOptions = a3;
}

- (void)setTextSelectionBehavior:(int)a3
{
  -[UITextInputTraits setTextSelectionBehavior:](self->_traits, "setTextSelectionBehavior:", *(_QWORD *)&a3);
  -[UITextInputTraits setTextSelectionBehavior:](self->_traits, "setTextSelectionBehavior:", -[UITextField textSelectionBehavior](self, "textSelectionBehavior"));
}

- (void)setMarkedTextStyle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMarkedTextStyle:", v4);

}

- (void)removeFromSuperview
{
  void *v3;
  objc_super v4;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeASPVisualEffectsIfNecessary:", self);

  v4.receiver = self;
  v4.super_class = (Class)UITextField;
  -[UIView removeFromSuperview](&v4, sel_removeFromSuperview);
}

- (void)setDelegate:(id)delegate
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = delegate;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);

  if (WeakRetained != obj)
  {
    NSStringFromSelector(sel_textInputTraits);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField willChangeValueForKey:](self, "willChangeValueForKey:", v5);

    objc_storeWeak(&self->_delegate, obj);
    NSStringFromSelector(sel_textInputTraits);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField didChangeValueForKey:](self, "didChangeValueForKey:", v6);

  }
}

- (BOOL)_implementsEditMenu
{
  void *v2;
  char v3;

  -[UITextField delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)_drawTextInRect:(CGRect)a3 forLabel:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  UITextFieldLabel *v9;
  UITextFieldLabel *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (UITextFieldLabel *)a4;
  if (self->_placeholderLabel == v9)
  {
    v10 = v9;
    -[UITextField drawPlaceholderInRect:](self, "drawPlaceholderInRect:", x, y, width, height);
    goto LABEL_7;
  }
  if (self->_suffixLabel == v9)
  {
    v10 = v9;
    -[UITextField drawSuffixInRect:](self, "drawSuffixInRect:", x, y, width, height);
    goto LABEL_7;
  }
  if (self->_prefixLabel == v9)
  {
    v10 = v9;
    -[UITextField drawPrefixInRect:](self, "drawPrefixInRect:", x, y, width, height);
LABEL_7:
    v9 = v10;
  }

}

- (void)drawPlaceholderInRect:(CGRect)rect
{
  -[UITextFieldLabel _defaultDrawTextInRect:](self->_placeholderLabel, "_defaultDrawTextInRect:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
}

- (void)scrollTextFieldToVisibleIfNecessary
{
  void *v3;
  uint64_t v4;
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
  CGFloat v15;
  double v16;
  CGFloat v17;
  id v18;
  CGRect v19;
  CGRect v20;

  if (-[UIResponder _textInputSource](self, "_textInputSource") != 3)
  {
    -[UIView _scroller](self, "_scroller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      while (1)
      {
        v18 = v3;
        if ((objc_msgSend(v3, "isScrollEnabled") & 1) != 0)
          break;
        objc_msgSend(v18, "_scroller");
        v4 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v4;
        if (!v4)
          goto LABEL_5;
      }
    }
    else
    {
LABEL_5:
      v18 = 0;
    }
    -[UIView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView frame](self, "frame");
    objc_msgSend(v5, "convertRect:toView:", v18);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    if (!objc_msgSend(v18, "isDecelerating"))
      goto LABEL_13;
    objc_msgSend(v18, "_animatedTargetOffset");
    v15 = v14;
    v17 = v16;
    objc_msgSend(v18, "bounds");
    v19.origin.x = v15;
    v19.origin.y = v17;
    v20.origin.x = v7;
    v20.origin.y = v9;
    v20.size.width = v11;
    v20.size.height = v13;
    if (!CGRectContainsRect(v19, v20))
    {
LABEL_13:
      if (-[UITextField _delegateShouldScrollToVisibleWhenBecomingFirstResponder](self, "_delegateShouldScrollToVisibleWhenBecomingFirstResponder"))
      {
        objc_msgSend(v18, "scrollRectToVisible:animated:", 1, v7, v9, v11, v13);
      }
    }

  }
}

- (BOOL)_delegateShouldScrollToVisibleWhenBecomingFirstResponder
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "_textFieldShouldScrollToVisibleWhenBecomingFirstResponder:", self);
  else
    v4 = 1;

  return v4;
}

- (NSAttributedString)attributedPlaceholder
{
  NSAttributedString *overriddenPlaceholder;

  overriddenPlaceholder = self->_overriddenPlaceholder;
  if (overriddenPlaceholder)
    return overriddenPlaceholder;
  -[UILabel attributedText](self->_placeholderLabel, "attributedText");
  return (NSAttributedString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setText:(NSString *)text
{
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags;
  uint64_t v5;
  uint64_t v6;
  NSString *v7;

  textFieldFlags = self->_textFieldFlags;
  v7 = text;
  if ((*(_QWORD *)&textFieldFlags & 0x800000000) != 0)
    v5 = -[UITextField _rangeForClearButton](self, "_rangeForClearButton");
  else
    v5 = -[UITextField _rangeForSetText](self, "_rangeForSetText");
  -[UITextField _setTextInRange:replacementText:](self, "_setTextInRange:replacementText:", v5, v6, v7);

}

- (void)_setTextInRange:(_NSRange)a3 replacementText:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  __CFString *v7;
  _BOOL4 v8;
  __CFString *v9;
  __CFString *v10;
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;

  length = a3.length;
  location = a3.location;
  v7 = (__CFString *)a4;
  *(_QWORD *)&self->_textFieldFlags &= ~0x20000uLL;
  v16 = v7;
  if (v7)
  {
    v8 = -[UITextField _textNeedsSanitizing:](self, "_textNeedsSanitizing:", v7);
    v9 = v16;
    if (!v8)
    {
      v10 = v16;
      goto LABEL_6;
    }
  }
  else
  {
    v9 = &stru_1E16EDF20;
  }
  v10 = (__CFString *)-[__CFString mutableCopy](v9, "mutableCopy");
  -[UITextField _sanitizeText:](self, "_sanitizeText:", v10);
LABEL_6:
  textFieldFlags = self->_textFieldFlags;
  if ((*(_WORD *)&textFieldFlags & 0x100) != 0)
  {
    self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(unint64_t *)&textFieldFlags | 0x8000);
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextInRange:replacementText:", location, length, v10);

    self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFFFFFFFFF7FFFLL | (((*(unint64_t *)&textFieldFlags >> 15) & 1) << 15));
  }
  else if (-[__CFString length](v10, "length") | length)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[_UICascadingTextStorage defaultAttributes](self->_textStorage, "defaultAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithString:attributes:", v10, v13);

    -[NSConcreteTextStorage replaceCharactersInRange:withAttributedString:](self->_textStorage, "replaceCharactersInRange:withAttributedString:", location, length, v14);
  }
  -[UITextField finishedSettingTextOrAttributedText](self, "finishedSettingTextOrAttributedText");

}

- (NSString)searchText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  id v21;
  void *v22;

  if (-[UITextField hasMarkedText](self, "hasMarkedText"))
  {
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "markedTextRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "searchStringForMarkedText");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = &stru_1E16EDF20;
      if (v7)
        v9 = (__CFString *)v7;
      v10 = v9;

      v11 = -[_UITextLayoutController characterRangeForTextRange:](self->_textLayoutController, "characterRangeForTextRange:", v5);
      objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v11, v12, v10);
      v13 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v13;
    }
    -[UITextField textInputTraits](self, "textInputTraits");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "textTrimmingSet");

    if (v15)
    {
      objc_msgSend(v4, "_stringByTrimmingCharactersInCFCharacterSet:", v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v16;
    }

  }
  else
  {
    -[UITextField text](self, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (dyld_program_sdk_at_least())
  {
    v17 = objc_msgSend(v4, "mutableCopy");
    -[UITextField _sanitizeText:](self, "_sanitizeText:", v17);

    v4 = (void *)v17;
  }
  v18 = -[UITextField _shouldObscureInput](self, "_shouldObscureInput");
  v19 = v4;
  v20 = v19;
  if (v19 && v18)
    v21 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "_newZStringWithString:", v19);
  else
    v21 = v19;
  v22 = v21;

  return (NSString *)v22;
}

- (BOOL)hasMarkedText
{
  void *v2;
  void *v3;
  BOOL v4;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)finishedSettingTextOrAttributedText
{
  id v3;

  -[UITextField setNeedsLayout](self, "setNeedsLayout");
  -[UITextField _invalidateDefaultFullFontSize](self, "_invalidateDefaultFullFontSize");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  if (-[UITextField _shouldObscureInput](self, "_shouldObscureInput"))
  {
    -[UITextField _forceObscureAllText](self, "_forceObscureAllText");
  }
  else
  {
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_unobscureAllText");

  }
}

- (BOOL)_textNeedsSanitizing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  -[UITextField textInputTraits](self, "textInputTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textTrimmingSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v4, "rangeOfCharacterFromSet:", v6) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("\r\n\uFFFC"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v7) != 0x7FFFFFFFFFFFFFFFLL;

  }
  return v8;
}

- (_NSRange)_rangeForSetText
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[NSConcreteTextStorage length](self->_textStorage, "length");
  v3 = 0;
  result.length = v2;
  result.location = v3;
  return result;
}

- (NSTextAlignment)textAlignment
{
  return -[_UICascadingTextStorage textAlignment](self->_textStorage, "textAlignment");
}

- (void)_sanitizeText:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UITextField textInputTraits](self, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_removeCharactersFromSet:", objc_msgSend(v4, "textTrimmingSet"));

  if (!-[UITextField allowsAttachments](self, "allowsAttachments"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", 65532);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", v5, &stru_1E16EDF20, 2, 0, objc_msgSend(v6, "length"));

  }
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\r\n"), CFSTR("\n"), 2, 0, objc_msgSend(v6, "length"));
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\r"), CFSTR("\n"), 2, 0, objc_msgSend(v6, "length"));
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR(" "), 2, 0, objc_msgSend(v6, "length"));

}

- (BOOL)allowsAttachments
{
  return (*((unsigned __int8 *)&self->_textFieldFlags + 3) >> 2) & 1;
}

- (UIColor)textColor
{
  return -[_UICascadingTextStorage textColor](self->_textStorage, "textColor");
}

- (UIView)inputAccessoryView
{
  UIView *inputAccessoryView;
  objc_super v4;

  inputAccessoryView = self->_inputAccessoryView;
  if (inputAccessoryView)
    return inputAccessoryView;
  v4.receiver = self;
  v4.super_class = (Class)UITextField;
  -[UIResponder inputAccessoryView](&v4, sel_inputAccessoryView);
  return (UIView *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIView)inputView
{
  return (UIView *)objc_getProperty(self, a2, 848, 1);
}

- (UITextField)initWithFrame:(CGRect)a3
{
  return (UITextField *)-[UITextField _initWithFrame:textLayoutManagerEnabled:](self, "_initWithFrame:textLayoutManagerEnabled:", objc_msgSend((id)objc_opt_class(), "_isTextLayoutManagerEnabled"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (BOOL)_isTextLayoutManagerEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)hasText
{
  void *v3;
  char v4;

  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) == 0)
    return -[NSConcreteTextStorage length](self->_textStorage, "length") != 0;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasText");

  return v4;
}

void __49__UITextField__adjustFontForAccessibilityTraits___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = objc_msgSend(v3, "length");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__UITextField__adjustFontForAccessibilityTraits___block_invoke_2;
  v8[3] = &unk_1E16B15F8;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v6;
  v9 = v5;
  v7 = v3;
  objc_msgSend(v7, "enumerateAttributesInRange:options:usingBlock:", 0, v4, 0x100000, v8);

}

- (void)setMinimumFontSize:(CGFloat)minimumFontSize
{
  if (minimumFontSize < 0.0)
    minimumFontSize = 0.0;
  self->_minimumFontSize = minimumFontSize;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;

  v6 = a4;
  v7 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "offsetFromPosition:toPosition:", v7, v6);

  return v9;
}

- (UITextInputTokenizer)tokenizer
{
  void *v2;
  void *v3;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tokenizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextInputTokenizer *)v3;
}

- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[UITextField _inputController](self, "_inputController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textStylingAtPosition:inDirection:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setEnabled:(BOOL)a3
{
  -[UITextField _setEnabled:animated:](self, "_setEnabled:animated:", a3, 0);
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  _UITextFieldBackgroundProvider *backgroundProvider;
  uint64_t v6;
  UITextField *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  backgroundProvider = self->_backgroundProvider;
  if (backgroundProvider)
  {
    -[_UITextFieldBackgroundProvider overridingSetBackgroundColor:](backgroundProvider, "overridingSetBackgroundColor:", v4);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  -[UITextField _contentView](self, "_contentView");
  v7 = (UITextField *)objc_claimAutoreleasedReturnValue();

  if (v7 != self)
  {
    -[UITextField _contentView](self, "_contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v4);

    v4 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)UITextField;
  -[UIView setBackgroundColor:](&v9, sel_setBackgroundColor_, v4);

}

- (void)_notifySystemKeyboardOfAppearanceChange
{
  UITextField *v3;
  id v4;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responder");
  v3 = (UITextField *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    objc_msgSend(v4, "traitCollectionDidChange");

}

- (void)setPasteDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pasteDelegate, a3);
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth
{
  uint64_t v3;

  if (((((*(_QWORD *)&self->_textFieldFlags & 0x80) == 0) ^ adjustsFontSizeToFitWidth) & 1) == 0)
  {
    v3 = 128;
    if (!adjustsFontSizeToFitWidth)
      v3 = 0;
    self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFFFFFFFFFFF7FLL | v3);
    -[UITextField _setNeedsStyleRecalc](self, "_setNeedsStyleRecalc");
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UITextField *v4;
  double y;
  double x;
  id v8;
  UITextField *v9;
  UITextField *v10;
  UITextField *v11;
  UITextField *v12;
  int v13;
  _BOOL4 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  float v25;
  UITextField *v26;
  float v27;
  double v28;
  double v29;
  double v30;
  float v31;
  double v32;
  uint64_t v33;
  UITextField *v34;
  char v35;
  UITextField *v36;
  char v37;
  UITextField *v38;
  char v39;
  _UITextFieldClearButton *clearButton;
  UITextField *v41;
  UITextField *v42;
  char isKindOfClass;
  UITextField *v44;
  objc_super v46;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v46.receiver = self;
  v46.super_class = (Class)UITextField;
  -[UIControl hitTest:withEvent:](&v46, sel_hitTest_withEvent_, v8, x, y);
  v9 = (UITextField *)objc_claimAutoreleasedReturnValue();
  -[UIView superview](self->_clearButton, "superview");
  v10 = (UITextField *)objc_claimAutoreleasedReturnValue();
  if (v10 == self)
  {
    v13 = 0;
  }
  else
  {
    -[UIView superview](self->_leftView, "superview");
    v11 = (UITextField *)objc_claimAutoreleasedReturnValue();
    if (v11 == self)
    {
      v13 = 0;
      v4 = self;
    }
    else
    {
      v4 = v11;
      -[UIView superview](self->_rightView, "superview");
      v12 = (UITextField *)objc_claimAutoreleasedReturnValue();
      if (v12 != self)
      {

LABEL_45:
        goto LABEL_46;
      }
      v13 = 1;
    }
  }
  v14 = v9 == self;
  if (v9 == self || (*((_BYTE *)&self->_textFieldFlags + 1) & 1) == 0)
  {
    if ((v13 & 1) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v26 = (UITextField *)objc_claimAutoreleasedReturnValue();
  v14 = v9 == v26;

  if (v13)
LABEL_11:

LABEL_12:
  if (v10 == self)
  {

    if (!v14)
      goto LABEL_46;
  }
  else
  {

    if (!v14)
      goto LABEL_46;
  }
  -[UITextField editRect](self, "editRect");
  v16 = v15;
  v18 = v17;
  -[UITextField _textSize](self, "_textSize");
  v20 = v19;
  -[UITextField _textStorage](self, "_textStorage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "_ui_resolvedTextAlignment");

  if (v22)
  {
    v23 = v16 + v18;
    v24 = v16 + v18 - v20 + -20.0;
    if (v16 >= v24)
      v24 = v16;
    v25 = v24;
    if (v22 == 2)
      goto LABEL_26;
  }
  else
  {
    v25 = v16;
    v23 = v16 + v18;
  }
  if (v23 >= v16 + v20 + 20.0)
    v23 = v16 + v20 + 20.0;
LABEL_26:
  v27 = v23;
  -[UIView bounds](self, "bounds");
  v30 = fmin(v29 * 0.15, 48.0);
  if (v28 + v30 <= v25)
    v31 = v28 + v30;
  else
    v31 = v25;
  v32 = v28 + v29 - v30;
  if (v32 > v27)
    v27 = v32;
  if (x <= v31)
  {
    v33 = 504;
    -[UIView superview](self->_leftView, "superview");
    v34 = (UITextField *)objc_claimAutoreleasedReturnValue();
    if (v34 == self)
    {
      v35 = UIViewIgnoresTouchEvents(self->_leftView);

      if ((v35 & 1) == 0)
        goto LABEL_42;
    }
    else
    {

    }
  }
  if (x >= v27)
  {
    -[UIView superview](self->_clearButton, "superview");
    v36 = (UITextField *)objc_claimAutoreleasedReturnValue();
    if (v36 == self)
    {
      v37 = UIViewIgnoresTouchEvents(self->_clearButton);

      if ((v37 & 1) == 0)
      {
        clearButton = self->_clearButton;
        goto LABEL_44;
      }
    }
    else
    {

    }
    v33 = 520;
    -[UIView superview](self->_rightView, "superview");
    v38 = (UITextField *)objc_claimAutoreleasedReturnValue();
    if (v38 != self)
    {
      v10 = v38;
      goto LABEL_45;
    }
    v39 = UIViewIgnoresTouchEvents(self->_rightView);

    if ((v39 & 1) == 0)
    {
LABEL_42:
      clearButton = *(_UITextFieldClearButton **)((char *)&self->super.super.super.super.isa + v33);
LABEL_44:
      v10 = v9;
      v9 = clearButton;
      goto LABEL_45;
    }
  }
LABEL_46:
  v41 = v9;
  if (v9 != (UITextField *)self->_leftView)
  {
    v41 = v9;
    if (v9 != (UITextField *)self->_rightView)
    {
      v41 = v9;
      if (v9 != (UITextField *)self->_clearButton)
      {
        if (!-[_UITextFieldBackgroundProvider hitTestView:](self->_backgroundProvider, "hitTestView:", v9))
        {
          if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
          {
            -[UITextField _fieldEditor](self, "_fieldEditor");
            v42 = (UITextField *)objc_claimAutoreleasedReturnValue();
            if (v9 == v42)
            {
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              v41 = self;
              if ((isKindOfClass & 1) == 0)
                goto LABEL_56;
            }
            else
            {

            }
          }
          v41 = v9;
          goto LABEL_56;
        }
        v41 = self;
      }
    }
  }
LABEL_56:
  v44 = v41;

  return v44;
}

- (void)setInputDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInputDelegate:", v4);

}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBaseWritingDirection:forRange:", a3, v6);

}

- (BOOL)_shouldIgnoreBaseWritingDirectionChanges
{
  return 0;
}

- (void)keyboardInputChangedSelection:(id)a3
{
  UITextField *WeakRetained;
  id v5;

  v5 = a3;
  if (-[UITextField isEditing](self, "isEditing"))
  {
    WeakRetained = (UITextField *)objc_loadWeakRetained(&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0 && WeakRetained != self)
      -[UITextField keyboardInputChangedSelection:](WeakRetained, "keyboardInputChangedSelection:", v5);

  }
}

- (void)_setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL4 v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  if (-[UIControl isEnabled](self, "isEnabled") != a3)
  {
    if (!v5
      && (*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0
      && -[UITextField canResignFirstResponder](self, "canResignFirstResponder"))
    {
      v7 = -[UITextField resignFirstResponder](self, "resignFirstResponder");
      if (v5)
        goto LABEL_9;
    }
    else
    {
      v7 = (*((_BYTE *)&self->_textFieldFlags + 1) & 1) == 0;
      if (v5)
      {
LABEL_9:
        v8.receiver = self;
        v8.super_class = (Class)UITextField;
        -[UIControl setEnabled:](&v8, sel_setEnabled_, v5);
        -[UITextField _enabledDidChangeAnimated:](self, "_enabledDidChangeAnimated:", v4);
        return;
      }
    }
    if (!v7)
      return;
    goto LABEL_9;
  }
}

- (id)metadataDictionariesForDictationResults
{
  void *v2;
  void *v3;

  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
  {
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "metadataDictionariesForDictationResults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v8;
  unsigned __int8 v9;
  void *v10;
  int v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  v8 = sel_paste_ == a3 || sel_select_ == a3 || sel_selectAll_ == a3;
  if (v8 && -[UITextField _isPasscodeStyle](self, "_isPasscodeStyle"))
  {
    v9 = 0;
  }
  else
  {
    -[UITextField _inputController](self, "_inputController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "_canHandleResponderAction:", a3);

    if (v11)
    {
      -[UITextField _inputController](self, "_inputController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v12, "_shouldHandleResponderAction:", a3);

    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)UITextField;
      v9 = -[UIView canPerformAction:withSender:](&v14, sel_canPerformAction_withSender_, a3, v6);
    }
  }

  return v9;
}

- (void)_willUpdateAfterDetachingFieldEditor
{
  -[UITextField willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("text"));
  -[UITextField willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("attributedText"));
}

- (id)_viewForLoweringBaselineLayoutAttribute:(int)a3
{
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags;
  BOOL v4;
  uint64_t v5;
  objc_super v7;

  textFieldFlags = self->_textFieldFlags;
  v4 = *(_DWORD *)&textFieldFlags >= 0 && (a3 - 11) >= 2;
  v5 = 0x80000000;
  if (v4)
    v5 = 0;
  self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(v5 | *(_QWORD *)&textFieldFlags & 0xFFFFFFFF7FFFFFFFLL);
  v7.receiver = self;
  v7.super_class = (Class)UITextField;
  -[UIView _viewForLoweringBaselineLayoutAttribute:](&v7, sel__viewForLoweringBaselineLayoutAttribute_);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateBaselineInformationDependentOnBounds
{
  -[UITextField _updateBaselineInformationDependentOnBoundsAllowingInvalidation:](self, "_updateBaselineInformationDependentOnBoundsAllowingInvalidation:", 1);
}

- (void)_updateBaselineInformationDependentOnBoundsAllowingInvalidation:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  id v31;

  v3 = a3;
  v6 = -[UIView _wantsAutolayout](self, "_wantsAutolayout");
  v7 = v6;
  if (v3 && !v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextField.m"), 3128, CFSTR("invalidation is only applicable to auto layout"));

    if (v7)
      goto LABEL_4;
LABEL_6:
    v11 = *MEMORY[0x1E0C9D538];
    v13 = *(_QWORD *)(MEMORY[0x1E0C9D538] + 8);
    -[UIView bounds](self, "bounds");
    -[UITextField sizeThatFits:](self, "sizeThatFits:", v15, v16);
    v8 = v17;
    v9 = v18;
    goto LABEL_7;
  }
  if (!v6)
    goto LABEL_6;
LABEL_4:
  -[UIView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
LABEL_7:
  v19 = v11;
  v20 = v13;
  if (CGRectGetHeight(*(CGRect *)(&v8 - 2)) > 0.0)
    goto LABEL_10;
  v21 = 0.0;
  if (!v7)
  {
    v22 = 0.0;
    goto LABEL_12;
  }
  -[UIView _calculatedIntrinsicHeight](self, "_calculatedIntrinsicHeight");
  v22 = 0.0;
  if (v23 > 0.0)
  {
LABEL_10:
    -[UITextField _layoutContentOnly](self, "_layoutContentOnly");
    -[UITextField _inputController](self, "_inputController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField textLayoutController](self, "textLayoutController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "typingAttributes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField textContainerOrigin](self, "textContainerOrigin");
    -[_UITextLayoutControllerBase baselineCalculatorForView:typingAttributes:usesLineFragmentOrigin:fallbackTextContainerOrigin:]((uint64_t)v25, self, v26, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "firstBaselineOffsetFromTop");
    v22 = v28;
    objc_msgSend(v27, "lastBaselineOffsetFromBottom");
    v21 = v29;

  }
LABEL_12:
  if (self->_firstBaselineOffsetFromTop != v22 || self->_lastBaselineOffsetFromBottom != v21)
  {
    if (v7)
    {
      -[UIView _layoutEngineCreateIfNecessary](self, "_layoutEngineCreateIfNecessary");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
LABEL_20:

        return;
      }
    }
    else
    {
      v30 = 0;
    }
    self->_firstBaselineOffsetFromTop = v22;
    self->_lastBaselineOffsetFromBottom = v21;
    if (v3)
    {
      v31 = v30;
      -[UIView _invalidateBaselineConstraints](self, "_invalidateBaselineConstraints");
      v30 = v31;
    }
    goto LABEL_20;
  }
}

- (BOOL)_shouldEndEditing
{
  return (*((_BYTE *)&self->_textFieldFlags + 1) & 1) == 0
      || -[UITextField _delegateShouldEndEditing](self, "_delegateShouldEndEditing");
}

- (void)_resignFirstResponder
{
  objc_super v3;
  objc_super v4;

  if (self->_deferringBecomeFirstResponder)
  {
    v4.receiver = self;
    v4.super_class = (Class)UITextField;
    -[UIResponder _resignFirstResponder](&v4, sel__resignFirstResponder);
  }
  else
  {
    if (!-[UITextField isTextDragActive](self, "isTextDragActive"))
      -[UITextField _detachFieldEditor](self, "_detachFieldEditor");
    v3.receiver = self;
    v3.super_class = (Class)UITextField;
    -[UIResponder _resignFirstResponder](&v3, sel__resignFirstResponder);
    -[_UITextFieldBackgroundProvider didChangeFirstResponder](self->_backgroundProvider, "didChangeFirstResponder");
    -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", 0x40000, 0);
    -[UITextField _updateSelectionGestures](self, "_updateSelectionGestures");
    -[UITextField _notifyDidEndEditing](self, "_notifyDidEndEditing");
  }
}

- (void)_removeFieldEditorAndHost
{
  void *v3;
  id v4;

  objc_getAssociatedObject(self, &FieldEditorHostKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "removeFieldEditor");
    objc_setAssociatedObject(self, &FieldEditorHostKey, 0, (void *)1);
    v3 = v4;
  }

}

- (void)_notifyDidEndEditing
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "textFieldDidResignFirstResponder:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "textFieldDidEndEditing:reason:", self, 0);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "textFieldDidEndEditing:", self);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("UITextFieldEndEditingReasonKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("UITextFieldTextDidEndEditingNotification"), self, v6);

}

- (BOOL)_finishResignFirstResponder
{
  BOOL v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITextField;
  v3 = -[UIResponder _finishResignFirstResponder](&v6, sel__finishResignFirstResponder);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("UIKeyboardDidShowNotification"), 0);

  return v3;
}

- (void)_didUpdateAfterDetachingFieldEditor
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  -[UITextField didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("text"));
  objc_getAssociatedObject(self, &EditingTokenKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_msgSend(v3, "endEditing");
    v4 = v6;
    if (v5)
    {
      -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      v4 = v6;
    }
  }

}

- (void)_didDetachFieldEditor
{
  id v3;

  objc_setAssociatedObject(self, &EditingTokenKey, 0, (void *)1);
  -[UITextField _inputController](self, "_inputController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateEmptyStringAttributes");

}

- (void)_detachFieldEditor
{
  -[UITextField _detachFieldEditorDiscardingEdits:animated:](self, "_detachFieldEditorDiscardingEdits:animated:", (*(_QWORD *)&self->_textFieldFlags >> 21) & 1, 0);
}

- (void)_detachFieldEditorDiscardingEdits:(BOOL)a3 animated:(BOOL)a4
{
  UIFieldEditor *fieldEditor;
  _BOOL4 v6;
  _BOOL8 v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  int has_internal_diagnostics;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  BOOL v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  fieldEditor = self->_fieldEditor;
  if (fieldEditor)
  {
    v6 = a4;
    v7 = a3;
    -[UIFieldEditor _scrollAnimationEndedAction](fieldEditor, "_scrollAnimationEndedAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = qword_1ECD7A1D8;
      if (!qword_1ECD7A1D8)
      {
        v9 = __UILogCategoryGetNode("Text", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&qword_1ECD7A1D8);
      }
      if ((*(_BYTE *)v9 & 1) != 0)
      {
        v10 = *(NSObject **)(v9 + 8);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Detaching field editor while detaching was already in progress. Bailing.", buf, 2u);
        }
      }
    }
    else
    {
      -[UITextField _stopObservingFieldEditorScroll](self, "_stopObservingFieldEditorScroll");
      if (v6 && (-[UIScrollView contentOffset](self->_fieldEditor, "contentOffset"), v13 > 0.0))
      {
        objc_initWeak((id *)buf, self);
        v24 = MEMORY[0x1E0C809B0];
        v25 = 3221225472;
        v26 = __58__UITextField__detachFieldEditorDiscardingEdits_animated___block_invoke;
        v27 = &unk_1E16E6458;
        objc_copyWeak(&v28, (id *)buf);
        v29 = v7;
        -[UIFieldEditor _setScrollAnimationEndedAction:](self->_fieldEditor, "_setScrollAnimationEndedAction:", &v24);
        -[UIFieldEditor setContentOffset:animated:](self->_fieldEditor, "setContentOffset:animated:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v24, v25, v26, v27);
        objc_destroyWeak(&v28);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (!v7)
          -[UITextField _willUpdateAfterDetachingFieldEditor](self, "_willUpdateAfterDetachingFieldEditor");
        -[UIFieldEditor deactivateEditorDiscardingEdits:](self->_fieldEditor, "deactivateEditorDiscardingEdits:", v7);
        *(_QWORD *)&self->_textFieldFlags &= ~0x100uLL;
        if (!v7)
          -[UITextField _didUpdateAfterDetachingFieldEditor](self, "_didUpdateAfterDetachingFieldEditor");
        -[UITextField _didDetachFieldEditor](self, "_didDetachFieldEditor");
        if (-[UIView isFirstResponder](self, "isFirstResponder"))
        {
          if ((*((_BYTE *)&self->_textFieldFlags + 1) & 8) == 0)
            -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", 0x40000, 0);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObserver:name:object:", self, CFSTR("UIApplicationResumedNotification"), 0);

          -[UITextField _removeFieldEditorAndHost](self, "_removeFieldEditorAndHost");
          if ((*((_BYTE *)&self->_textFieldFlags + 2) & 2) != 0)
          {
            -[UIFieldEditor _inputController](self->_fieldEditor, "_inputController");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "typingAttributes");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v16 || objc_msgSend(v16, "count"))
              -[_UICascadingTextStorage setDefaultAttributes:](self->_textStorage, "setDefaultAttributes:", v16);

          }
          -[UITextField interactionAssistant](self, "interactionAssistant");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "deactivateSelection");

        }
        else
        {
          -[UITextField _removeFieldEditorAndHost](self, "_removeFieldEditorAndHost");
        }
        -[UITextField _addTextCanvasViewAdjustingFrame:](self, "_addTextCanvasViewAdjustingFrame:", 1);
        -[UITextField setNeedsLayout](self, "setNeedsLayout");
      }
    }
  }
  else
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    -[UITextField _fieldEditorHost](self, "_fieldEditorHost");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (has_internal_diagnostics)
    {
      if (v12)
      {
        __UIFaultDebugAssertLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          -[UITextField _fieldEditorHost](self, "_fieldEditorHost");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v31 = v23;
          _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "Detaching non-existing fieldeditor, but have a host (%@)", buf, 0xCu);

        }
      }
    }
    else if (v12)
    {
      v19 = qword_1ECD7A1D0;
      if (!qword_1ECD7A1D0)
      {
        v19 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v19, (unint64_t *)&qword_1ECD7A1D0);
      }
      v20 = *(NSObject **)(v19 + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = v20;
        -[UITextField _fieldEditorHost](self, "_fieldEditorHost");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v22;
        _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "Detaching non-existing fieldeditor, but have a host (%@)", buf, 0xCu);

      }
    }
    -[UITextField _removeFieldEditorAndHost](self, "_removeFieldEditorAndHost");
  }
}

- (BOOL)_delegateShouldEndEditing
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "textFieldShouldEndEditing:", self);
  else
    v4 = 1;

  return v4;
}

- (double)_baselineOffsetFromBottom
{
  double result;

  -[UITextField _baselineOffsetForLast:autolayoutOnly:](self, "_baselineOffsetForLast:autolayoutOnly:", 1, 1);
  return result;
}

- (double)_baselineOffsetForLast:(BOOL)a3 autolayoutOnly:(BOOL)a4
{
  _BOOL4 v4;
  double *p_firstBaselineOffsetFromTop;
  void *v9;
  void *v10;
  const __CFString *v11;

  v4 = a3;
  if (a4 && (*(_QWORD *)&self->super.super._viewFlags & 0x400000000000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("_firstBaselineOffsetFromTop");
    if (v4)
      v11 = CFSTR("_baselineOffsetFromBottom");
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextField.m"), 3074, CFSTR("-[UITextField %@] only valid when using auto layout"), v11);

  }
  p_firstBaselineOffsetFromTop = &self->_firstBaselineOffsetFromTop;
  if (self->_firstBaselineOffsetFromTop == 0.0 && self->_lastBaselineOffsetFromBottom == 0.0)
    -[UITextField _updateBaselineInformationDependentOnBoundsAllowingInvalidation:](self, "_updateBaselineInformationDependentOnBoundsAllowingInvalidation:", 0);
  if (v4)
    p_firstBaselineOffsetFromTop = &self->_lastBaselineOffsetFromBottom;
  return *p_firstBaselineOffsetFromTop;
}

- (id)_baselineCalculatorSourceCoordinateSpace
{
  _UITextCanvas *v3;
  double v4;

  -[_UITextCanvas frame](self->_textCanvasView, "frame");
  v3 = 0;
  if (fabs(v4) != INFINITY)
    v3 = self->_textCanvasView;
  return v3;
}

- (Class)_intelligenceBaseClass
{
  sub_1851F9080(0, &qword_1EDD88128);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4
{
  id v5;
  UITextField *v6;

  v5 = a4;
  v6 = self;
  _sSo11UITextFieldC5UIKitE27_intelligenceCollectContent2in9collectorySo6CGRectV_21UIIntelligenceSupport0J16ElementCollectorCtF_0((uint64_t)v5);

}

- (BOOL)isAccessibilityElementByDefault
{
  return 1;
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 1;
}

- (id)largeContentTitle
{
  void *v3;
  int v4;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  -[UIView _largeContentStoredProperties](self, "_largeContentStoredProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "didSetLargeContentTitle");

  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)UITextField;
    -[UIView largeContentTitle](&v9, sel_largeContentTitle);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITextField attributedText](self, "attributedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v7, "length"))
    {
      -[UITextField placeholder](self, "placeholder");
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    return v7;
  }
}

- (CGPoint)drawingScale
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 1.0;
  v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (NSCustomTextRendering)customRenderController
{
  return 0;
}

- (void)_setCuiCatalog:(id)a3
{
  CUICatalog *v5;
  CUICatalog *v6;

  v5 = (CUICatalog *)a3;
  if (self->_cuiCatalog != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_cuiCatalog, a3);
    -[UITextField _propagateCuiProperties](self, "_propagateCuiProperties");
    v5 = v6;
  }

}

- (void)_setCuiStyleEffectConfiguration:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  CUIStyleEffectConfiguration *cuiStyleEffectConfiguration;

  if (self->_cuiStyleEffectConfiguration != a3)
  {
    v4 = (id)objc_msgSend(a3, "copy");
    if (!v4)
    {
      if (dyld_program_sdk_at_least())
        v4 = objc_alloc_init(MEMORY[0x1E0D1A6E8]);
      else
        v4 = 0;
    }
    objc_msgSend(v4, "appearanceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[UIView traitCollection](self, "traitCollection");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[UITraitCollection _styleEffectAppearanceName](v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAppearanceName:", v7);

    }
    cuiStyleEffectConfiguration = self->_cuiStyleEffectConfiguration;
    self->_cuiStyleEffectConfiguration = (CUIStyleEffectConfiguration *)v4;

    -[UITextField _propagateCuiProperties](self, "_propagateCuiProperties");
  }
}

- (UITextField)initWithCoder:(id)a3
{
  id v4;
  UITextField *v5;
  uint64_t v6;
  _UITextFieldVisualStyle *visualStyle;
  int v8;
  uint64_t v9;
  int v10;
  double v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  float v30;
  double v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  UIView *leftView;
  uint64_t v36;
  UIView *rightView;
  uint64_t v38;
  UIImage *background;
  uint64_t v40;
  UIImage *disabledBackground;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t i;
  UITextField *v68;
  void *v70;
  objc_super v71;
  _QWORD v72[6];

  v72[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)UITextField;
  v5 = -[UIControl initWithCoder:](&v71, sel_initWithCoder_, v4);

  if (!v5)
    goto LABEL_101;
  +[_UITextFieldVisualStyle inferredVisualStyleWithStyleSubject:](_UITextFieldVisualStyle, "inferredVisualStyleWithStyleSubject:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  visualStyle = v5->_visualStyle;
  v5->_visualStyle = (_UITextFieldVisualStyle *)v6;

  v8 = objc_msgSend((id)objc_opt_class(), "_isTextLayoutManagerEnabled");
  v9 = 0x1000000000;
  if (!v8)
    v9 = 0;
  v5->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&v5->_textFieldFlags & 0xFFFFFFEFFFFFFFFFLL | v9);
  -[UITextField _setupDefaultStyleEffectConfiguration](v5, "_setupDefaultStyleEffectConfiguration");
  v10 = objc_msgSend(v4, "containsValueForKey:", CFSTR("UIRoundedRectBackgroundCornerRadius"));
  v11 = 5.0;
  if (v10)
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("UIRoundedRectBackgroundCornerRadius"), 5.0);
  v5->_preferredBackgroundCornerRadius = v11;
  -[UITextField _invalidateBackgroundProviderForced:](v5, "_invalidateBackgroundProviderForced:", 1);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIAllowsEditingTextAttributes")))
  {
    v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIAllowsEditingTextAttributes"));
    v13 = 0x10000;
    if (!v12)
      v13 = 0;
    v5->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&v5->_textFieldFlags & 0xFFFFFFFFFFFEFFFFLL | v13);
  }
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIText"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = (__CFString *)v14;
  else
    v15 = &stru_1E16EDF20;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAttributedText"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  if (!v17)
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v15);
  -[UITextField sanitizeAttributedText:](v5, "sanitizeAttributedText:", v17);
  if (!objc_msgSend(v17, "length"))
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UITextAlignment")))
      v21 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UITextAlignment"));
    else
      v21 = 4;
    goto LABEL_27;
  }
  objc_msgSend(v17, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678F98, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18 && objc_msgSend(v18, "alignment") != 4)
  {
    v20 = objc_msgSend(v19, "alignment");
    goto LABEL_24;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UITextAlignment")))
  {
    v20 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UITextAlignment"));
LABEL_24:
    v21 = v20;
    goto LABEL_25;
  }
  v21 = 4;
LABEL_25:

LABEL_27:
  -[UITextField _initTextStorage](v5, "_initTextStorage");
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIFont"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "pointSize");
    +[_UIFullFontSize valued:](_UIFullFontSize, "valued:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField _setFullFontSize:](v5, "_setFullFontSize:", v24);

    -[_UICascadingTextStorage setFont:](v5->_textStorage, "setFont:", v23);
  }
  else
  {
    +[_UIFullFontSize defaultValue](_UIFullFontSize, "defaultValue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField _setFullFontSize:](v5, "_setFullFontSize:", v25);

  }
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITextColor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    -[_UICascadingTextStorage setTextColor:](v5->_textStorage, "setTextColor:", v26);
  if (v21 != 4)
    -[_UICascadingTextStorage setTextAlignment:](v5->_textStorage, "setTextAlignment:", v21);
  *(_QWORD *)&v5->_textFieldFlags |= 0x20000uLL;
  -[_UICascadingTextStorage setAttributedString:](v5->_textStorage, "setAttributedString:", v17);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIAdjustsFontForContentSizeCategory")))
    -[UITextField setAdjustsFontForContentSizeCategory:](v5, "setAdjustsFontForContentSizeCategory:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIAdjustsFontForContentSizeCategory")));
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIDelegate"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak(&v5->_delegate, v27);

  if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIClearsOnBeginEditing")))
    v5->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&v5->_textFieldFlags & 0xFFFFFFFFFFF3FFFFLL | 0x40000);
  v28 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIAdjustsFontSizeToFit"));
  v29 = 128;
  if (!v28)
    v29 = 0;
  v5->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&v5->_textFieldFlags & 0xFFFFFFFFFFFFFF7FLL | v29);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIMinimumFontSize")))
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIMinimumFontSize"));
    v31 = v30;
    if (v31 < 0.0)
      v31 = 0.0;
  }
  else
  {
    objc_msgSend(off_1E167A828, "systemMinimumFontSize");
  }
  v5->_minimumFontSize = v31;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIBorderStyle"), v23))
    v32 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIBorderStyle"));
  else
    v32 = 0;
  v5->_clearButtonMode = 0;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIClearButtonMode")))
    v5->_clearButtonMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIClearButtonMode"));
  -[UITextField _initTextLayoutController](v5, "_initTextLayoutController");
  -[UITextField _initTextCanvasView](v5, "_initTextCanvasView");
  v5->_foregroundViewsAlpha = 1.0;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIPlaceholder"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    -[UITextField createPlaceholderIfNecessary](v5, "createPlaceholderIfNecessary");
    -[UILabel setText:](v5->_placeholderLabel, "setText:", v33);
  }
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UILeftView"));
  v34 = objc_claimAutoreleasedReturnValue();
  leftView = v5->_leftView;
  v5->_leftView = (UIView *)v34;

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIRightView"));
  v36 = objc_claimAutoreleasedReturnValue();
  rightView = v5->_rightView;
  v5->_rightView = (UIView *)v36;

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITextFieldBackground"));
  v38 = objc_claimAutoreleasedReturnValue();
  background = v5->_background;
  v5->_background = (UIImage *)v38;

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITextFieldDisabledBackground"));
  v40 = objc_claimAutoreleasedReturnValue();
  disabledBackground = v5->_disabledBackground;
  v5->_disabledBackground = (UIImage *)v40;

  *(_QWORD *)&v5->_textFieldFlags |= 0x20uLL;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIBecomesFirstResponderOnClearButtonTap")))
    v5->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&v5->_textFieldFlags & 0xFFFFFFFFFFFFFFDFLL | (32 * (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIBecomesFirstResponderOnClearButtonTap")) & 1)));
  objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("UIClearButtonOffset"));
  v5->_clearButtonOffset.width = v42;
  v5->_clearButtonOffset.height = v43;
  objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("UIPadding"));
  v5->_padding.top = v44;
  v5->_padding.left = v45;
  v5->_padding.bottom = v46;
  v5->_padding.right = v47;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIAutocapitalizationType")))
    v48 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIAutocapitalizationType"));
  else
    v48 = 0;
  -[UITextField setAutocapitalizationType:](v5, "setAutocapitalizationType:", v48);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIAutocorrectionType")))
    v49 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIAutocorrectionType"));
  else
    v49 = 0;
  -[UITextField setAutocorrectionType:](v5, "setAutocorrectionType:", v49);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UISpellCheckingType")))
    v50 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UISpellCheckingType"));
  else
    v50 = 0;
  -[UITextField setSpellCheckingType:](v5, "setSpellCheckingType:", v50);
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("UIDisableTextColorUpdateOnTraitCollectionChange")) & 1) != 0)
  {
    v51 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIDisableTextColorUpdateOnTraitCollectionChange"));
    v5->_disableTextColorUpdateOnTraitCollectionChange = v51;
    if (!v51)
      goto LABEL_68;
    goto LABEL_67;
  }
  if (v5->_disableTextColorUpdateOnTraitCollectionChange)
LABEL_67:
    objc_storeStrong((id *)&v5->_tvCustomTextColor, v26);
LABEL_68:
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIKeyboardAppearance")))
    v52 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIKeyboardAppearance"));
  else
    v52 = 0;
  -[UITextField setKeyboardAppearance:](v5, "setKeyboardAppearance:", v52);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIKeyboardType")))
    v53 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIKeyboardType"));
  else
    v53 = 0;
  -[UITextField setKeyboardType:](v5, "setKeyboardType:", v53);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIReturnKeyType")))
    v54 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIReturnKeyType"));
  else
    v54 = 0;
  -[UITextField setReturnKeyType:](v5, "setReturnKeyType:", v54);
  -[UITextField setEnablesReturnKeyAutomatically:](v5, "setEnablesReturnKeyAutomatically:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIEnablesReturnKeyAutomatically")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UITextContentType"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setTextContentType:](v5, "setTextContentType:", v55);

  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UITextSmartInsertDeleteType")))
    v56 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UITextSmartInsertDeleteType"));
  else
    v56 = 0;
  -[UITextField setSmartInsertDeleteType:](v5, "setSmartInsertDeleteType:", v56);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UITextSmartQuotesType")))
    v57 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UITextSmartQuotesType"));
  else
    v57 = 0;
  -[UITextField setSmartQuotesType:](v5, "setSmartQuotesType:", v57);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UITextSmartDashesType")))
    v58 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UITextSmartDashesType"));
  else
    v58 = 0;
  -[UITextField setSmartDashesType:](v5, "setSmartDashesType:", v58);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UITextInlinePredictionType")))
    v59 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UITextInlinePredictionType"));
  else
    v59 = 0;
  -[UITextField setInlinePredictionType:](v5, "setInlinePredictionType:", v59);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILetterformAwareSizingRule")))
    v5->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&v5->_textFieldFlags & 0xFFFFFFBFFFFFFFFFLL | ((objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UILetterformAwareSizingRule")) & 1) << 38));
  -[UITextField setSecureTextEntry:](v5, "setSecureTextEntry:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UISecureTextEntry")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UITextInputPasswordRules"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setPasswordRules:](v5, "setPasswordRules:", v60);

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIIcon"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setIcon:](v5, "setIcon:", v61);

  -[UITextField setBorderStyle:](v5, "setBorderStyle:", v32);
  -[UIView tintColor](v5, "tintColor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
    -[UITextField _updateForTintColor](v5, "_updateForTintColor");
  *(_QWORD *)&v5->_textFieldFlags |= 0x10000000uLL;
  -[UITextField _contentFloatingContainerView](v5, "_contentFloatingContainerView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    v72[0] = v5->_iconView;
    v72[1] = v5->_placeholderLabel;
    v72[2] = v5->_label;
    v72[3] = v5->_clearButton;
    v64 = 0;
    v72[4] = v5->_contentBackdropView;
    do
    {
      v65 = v72[v64];
      if (v65)
      {
        -[UITextField _contentView](v5, "_contentView");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "addSubview:", v65);

      }
      ++v64;
    }
    while (v64 != 5);
    for (i = 4; i != -1; --i)

  }
  v5->_tvUseVibrancy = !v5->_disableTextColorUpdateOnTraitCollectionChange;
  -[UITextField _detectCustomDrawing](v5, "_detectCustomDrawing");
  -[UITextField _initIncreasedContrastNotifications](v5, "_initIncreasedContrastNotifications");
  -[UIControl setSymbolAnimationEnabled:](v5, "setSymbolAnimationEnabled:", 1);

LABEL_101:
  v68 = v5;

  return v68;
}

- (id)_encodableSubviews
{
  void *v2;
  void *v3;

  -[UITextField _contentView](self, "_contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UITextField;
  -[UIView _populateArchivedSubviews:](&v6, sel__populateArchivedSubviews_, v4);
  -[_UITextFieldBackgroundProvider populateArchivedSubviews:](self->_backgroundProvider, "populateArchivedSubviews:", v4);
  if (self->_iconView)
    objc_msgSend(v4, "removeObject:");
  if (self->_placeholderLabel)
    objc_msgSend(v4, "removeObject:");
  if (self->_label)
    objc_msgSend(v4, "removeObject:");
  if (self->_clearButton)
    objc_msgSend(v4, "removeObject:");
  if (self->_contentBackdropView)
    objc_msgSend(v4, "removeObject:");
  if (self->_textCanvasView)
    objc_msgSend(v4, "removeObject:");
  if (self->_fieldEditor)
    objc_msgSend(v4, "removeObject:");
  -[UITextInteractionAssistant _selectionViewManager](self->_interactionAssistant, "_selectionViewManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_filterArchivedSubviews:", v4);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id WeakRetained;
  _UICascadingTextStorage *v6;
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
  UIView *leftView;
  UIView *rightView;
  UIImage *background;
  UIImage *disabledBackground;
  UITextBorderStyle v21;
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags;
  double minimumFontSize;
  int64_t clearButtonMode;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)UITextField;
  -[UIControl encodeWithCoder:](&v38, sel_encodeWithCoder_, v4);
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
    objc_msgSend(v4, "encodeConditionalObject:", WeakRetained);
  if (-[UITextField adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIAdjustsFontForContentSizeCategory"));
  v6 = self->_textStorage;
  -[_UICascadingTextStorage font](self->_textStorage, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UICascadingTextStorage font](v6, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("UIFont"));

  }
  -[UITextField placeholder](self, "placeholder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UITextField placeholder](self, "placeholder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("UIPlaceholder"));

  }
  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 0x20) != 0)
    objc_msgSend(v4, "encodeInteger:forKey:", -[_UICascadingTextStorage textAlignment](v6, "textAlignment"), CFSTR("UITextAlignment"));
  if (-[NSConcreteTextStorage length](v6, "length"))
  {
    if ((*((_BYTE *)&self->_textFieldFlags + 2) & 2) != 0)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v6);
      objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("UIAttributedText"));

    }
    -[NSConcreteTextStorage string](v6, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("UIText"));

  }
  -[UIImageView image](self->_iconView, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[UIImageView image](self->_iconView, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("UIIcon"));

  }
  -[_UICascadingTextStorage textColor](v6, "textColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[_UICascadingTextStorage textColor](v6, "textColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("UITextColor"));

  }
  leftView = self->_leftView;
  if (leftView)
    objc_msgSend(v4, "encodeObject:forKey:", leftView, CFSTR("UILeftView"));
  rightView = self->_rightView;
  if (rightView)
    objc_msgSend(v4, "encodeObject:forKey:", rightView, CFSTR("UIRightView"));
  background = self->_background;
  if (background)
    objc_msgSend(v4, "encodeObject:forKey:", background, CFSTR("UITextFieldBackground"));
  disabledBackground = self->_disabledBackground;
  if (disabledBackground)
    objc_msgSend(v4, "encodeObject:forKey:", disabledBackground, CFSTR("UITextFieldDisabledBackground"));
  v21 = -[UITextField borderStyle](self, "borderStyle");
  if (v21)
    objc_msgSend(v4, "encodeInteger:forKey:", v21, CFSTR("UIBorderStyle"));
  if (-[UITextField clearsOnBeginEditing](self, "clearsOnBeginEditing"))
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIClearsOnBeginEditing"));
  textFieldFlags = self->_textFieldFlags;
  if ((*(_BYTE *)&textFieldFlags & 0x80) != 0)
  {
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIAdjustsFontSizeToFit"));
    textFieldFlags = self->_textFieldFlags;
    if ((*(_BYTE *)&textFieldFlags & 0x20) != 0)
    {
LABEL_33:
      if ((*(_DWORD *)&textFieldFlags & 0x10000) == 0)
        goto LABEL_35;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&textFieldFlags & 0x20) != 0)
  {
    goto LABEL_33;
  }
  objc_msgSend(v4, "encodeBool:forKey:", 0, CFSTR("UIBecomesFirstResponderOnClearButtonTap"));
  if ((*(_QWORD *)&self->_textFieldFlags & 0x10000) != 0)
LABEL_34:
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIAllowsEditingTextAttributes"));
LABEL_35:
  minimumFontSize = self->_minimumFontSize;
  if (minimumFontSize != 0.0)
  {
    *(float *)&minimumFontSize = minimumFontSize;
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UIMinimumFontSize"), minimumFontSize);
  }
  clearButtonMode = self->_clearButtonMode;
  if (clearButtonMode)
    objc_msgSend(v4, "encodeInteger:forKey:", clearButtonMode, CFSTR("UIClearButtonMode"));
  if (self->_clearButtonOffset.width != 0.0 || self->_clearButtonOffset.height != 0.0)
    objc_msgSend(v4, "encodeCGSize:forKey:", CFSTR("UIClearButtonOffset"));
  if (self->_padding.top != 0.0
    || self->_padding.bottom != 0.0
    || self->_padding.left != 0.0
    || self->_padding.right != 0.0)
  {
    objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", CFSTR("UIPadding"));
  }
  v25 = -[UITextField autocapitalizationType](self, "autocapitalizationType");
  if (v25)
    objc_msgSend(v4, "encodeInteger:forKey:", v25, CFSTR("UIAutocapitalizationType"));
  v26 = -[UITextField autocorrectionType](self, "autocorrectionType");
  if (v26)
    objc_msgSend(v4, "encodeInteger:forKey:", v26, CFSTR("UIAutocorrectionType"));
  v27 = -[UITextField spellCheckingType](self, "spellCheckingType");
  if (v27)
    objc_msgSend(v4, "encodeInteger:forKey:", v27, CFSTR("UISpellCheckingType"));
  v28 = -[UITextField keyboardAppearance](self, "keyboardAppearance");
  if (v28)
    objc_msgSend(v4, "encodeInteger:forKey:", v28, CFSTR("UIKeyboardAppearance"));
  v29 = -[UITextField keyboardType](self, "keyboardType");
  if (v29)
    objc_msgSend(v4, "encodeInteger:forKey:", v29, CFSTR("UIKeyboardType"));
  v30 = -[UITextField returnKeyType](self, "returnKeyType");
  if (v30)
    objc_msgSend(v4, "encodeInteger:forKey:", v30, CFSTR("UIReturnKeyType"));
  if (-[UITextField enablesReturnKeyAutomatically](self, "enablesReturnKeyAutomatically"))
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIEnablesReturnKeyAutomatically"));
  if (-[UITextField isSecureTextEntry](self, "isSecureTextEntry"))
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UISecureTextEntry"));
  -[UITextField passwordRules](self, "passwordRules");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("UITextInputPasswordRules"));
  -[UITextField textContentType](self, "textContentType");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
    objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("UITextContentType"));
  v33 = -[UITextField smartInsertDeleteType](self, "smartInsertDeleteType");
  if (v33)
    objc_msgSend(v4, "encodeInteger:forKey:", v33, CFSTR("UITextSmartInsertDeleteType"));
  v34 = -[UITextField smartQuotesType](self, "smartQuotesType");
  if (v34)
    objc_msgSend(v4, "encodeInteger:forKey:", v34, CFSTR("UITextSmartQuotesType"));
  v35 = -[UITextField smartDashesType](self, "smartDashesType");
  if (v35)
    objc_msgSend(v4, "encodeInteger:forKey:", v35, CFSTR("UITextSmartDashesType"));
  v36 = -[UITextField inlinePredictionType](self, "inlinePredictionType");
  if (v36)
    objc_msgSend(v4, "encodeInteger:forKey:", v36, CFSTR("UITextInlinePredictionType"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_disableTextColorUpdateOnTraitCollectionChange, CFSTR("UIDisableTextColorUpdateOnTraitCollectionChange"));
  -[UITextField _roundedRectBackgroundCornerRadius](self, "_roundedRectBackgroundCornerRadius");
  if (fabs(v37 + -5.0) > 0.00000011920929)
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("UIRoundedRectBackgroundCornerRadius"));
  if ((*((_BYTE *)&self->_textFieldFlags + 4) & 0x40) != 0)
    objc_msgSend(v4, "encodeInteger:forKey:", 1, CFSTR("UILetterformAwareSizingRule"));

}

- (void)_encodeBackgroundColorWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UITextField backgroundColor](self, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("UIBackgroundColor"));

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  UITextBorderStyle v6;
  __CFString *v7;
  _UITextFieldBackgroundProvider *backgroundProvider;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)UITextField;
  -[UIView description](&v15, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = -[UITextField borderStyle](self, "borderStyle");
  if ((unint64_t)v6 > UITextBorderStyleRoundedRect)
    v7 = 0;
  else
    v7 = off_1E16E64F0[v6];
  backgroundProvider = self->_backgroundProvider;
  if (!backgroundProvider)
    backgroundProvider = (_UITextFieldBackgroundProvider *)CFSTR("(nil)");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("; borderStyle = %@; background = %@"), v7, backgroundProvider);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "rangeOfString:", CFSTR("; layer ="));
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    v10 = objc_msgSend(v4, "length") - 1;
  objc_msgSend(v4, "insertString:atIndex:", v9, v10);
  -[UITextField placeholder](self, "placeholder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("; placeholder = %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertString:atIndex:", v12, v10);

  }
  v13 = (void *)objc_msgSend(v4, "copy");

  return (NSString *)v13;
}

- (CGRect)_responderSelectionRectForWindow:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGRect result;

  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
  {
    v3 = *MEMORY[0x1E0C9D628];
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITextField;
    -[UIView _responderSelectionRectForWindow:](&v7, sel__responderSelectionRectForWindow_, a3);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_responderExternalTouchRectForWindow:(id)a3
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
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  CGRect result;

  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
  {
    v13 = a3;
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_responderExternalTouchRectForWindow:", v13);
    v6 = v15;
    v8 = v16;
    v10 = v17;
    v12 = v18;

  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)UITextField;
    v4 = a3;
    -[UIView _responderExternalTouchRectForWindow:](&v23, sel__responderExternalTouchRectForWindow_, v4);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  v19 = v6;
  v20 = v8;
  v21 = v10;
  v22 = v12;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGSize)_textSize
{
  double v2;
  double v3;
  CGSize result;

  -[UITextField _textSizeUsingFullFontSize:](self, "_textSizeUsingFullFontSize:", 0);
  result.height = v3;
  result.width = v2;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  double height;
  double width;
  int has_internal_diagnostics;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  _UICascadingTextStorage *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
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
  NSObject *v31;
  unint64_t v32;
  NSObject *v33;
  _QWORD v34[6];
  _QWORD v35[4];
  uint8_t buf[8];
  uint8_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  height = a3.height;
  width = a3.width;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  -[UITextField alignmentRectInsets](self, "alignmentRectInsets");
  v10 = v9 == 0.0;
  if (v11 != 0.0)
    v10 = 0;
  if (v8 != 0.0)
    v10 = 0;
  if (v7 != 0.0)
    v10 = 0;
  if (has_internal_diagnostics)
  {
    if (!v10)
    {
      __UIFaultDebugAssertLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v31, OS_LOG_TYPE_FAULT, "Text Field not expected to have alignmentRectInsets.", buf, 2u);
      }

    }
  }
  else if (!v10)
  {
    v32 = _baselineOffsetsAtSize____s_category;
    if (!_baselineOffsetsAtSize____s_category)
    {
      v32 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v32, (unint64_t *)&_baselineOffsetsAtSize____s_category);
    }
    v33 = *(NSObject **)(v32 + 8);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v33, OS_LOG_TYPE_ERROR, "Text Field not expected to have alignmentRectInsets.", buf, 2u);
    }
  }
  v12 = self->_textStorage;
  *(_QWORD *)buf = 0;
  v37 = buf;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__206;
  v40 = __Block_byref_object_dispose__206;
  v41 = 0;
  if ((*((_BYTE *)&self->_textFieldFlags + 2) & 2) == 0)
    goto LABEL_11;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0;
  -[UITextField attributedText](self, "attributedText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField attributedText](self, "attributedText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");
  v16 = *(_QWORD *)off_1E1678D90;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __38__UITextField__baselineOffsetsAtSize___block_invoke;
  v34[3] = &unk_1E16E6328;
  v34[4] = v35;
  v34[5] = buf;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v16, 0, v15, 0, v34);

  _Block_object_dispose(v35, 8);
  if (!*((_QWORD *)v37 + 5))
  {
LABEL_11:
    -[_UICascadingTextStorage font](v12, "font");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField _fullFontSize](self, "_fullFontSize");
    objc_msgSend(v17, "fontWithSize:");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v37 + 5);
    *((_QWORD *)v37 + 5) = v18;

    if (!*((_QWORD *)v37 + 5))
    {
      objc_msgSend(off_1E167A828, "defaultFontSize");
      objc_msgSend(off_1E167A828, "systemFontOfSize:");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)*((_QWORD *)v37 + 5);
      *((_QWORD *)v37 + 5) = v20;

    }
  }
  -[UITextField _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", width, height);
  v23 = v22;
  v25 = v24;
  -[UITextField textRectForBounds:](self, "textRectForBounds:", 0.0, 0.0, v22, v24);
  -[UITextField _marginTopForBounds:](self, "_marginTopForBounds:", 0.0, 0.0, v23, v25);
  objc_msgSend(*((id *)v37 + 5), "lineHeight");
  objc_msgSend(*((id *)v37 + 5), "descender");
  UIRoundToViewScale(self);
  v27 = v26;
  v28 = v25 - v26;
  _Block_object_dispose(buf, 8);

  v29 = v27;
  v30 = v28;
  result.var1 = v30;
  result.var0 = v29;
  return result;
}

void __38__UITextField__baselineOffsetsAtSize___block_invoke(uint64_t a1, void *a2)
{
  double v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "lineHeight");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v4 > *(double *)(v5 + 24))
  {
    *(double *)(v5 + 24) = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (void)_applicableContentOutsetsFromFontsOversize:(int)a3 extremeSizing:
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (a1 && a2 | a3)
  {
    if ((*(_BYTE *)(a1 + 897) & 1) != 0)
    {
      objc_msgSend((id)a1, "_fieldEditor", 0.0, 0.0, 0.0, 0.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_fullContentInsetsFromFonts");
    }
    else
    {
      objc_msgSend((id)a1, "text", 0.0, 0.0, 0.0, 0.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[UILabel _tooBigChars]();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v5);

      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if ((*(_BYTE *)(a1 + 898) & 2) != 0)
        {
          v8 = *(void **)(a1 + 824);
          objc_msgSend(v8, "font");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          +[UILabel _insetsForAttributedString:withDefaultFont:inView:]((uint64_t)UILabel, v8, v7, (void *)a1);
        }
        else
        {
          objc_msgSend((id)a1, "font");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          +[UILabel _insetsForString:withFont:inView:]((uint64_t)UILabel, (uint64_t)v4, v7, (void *)a1);
        }

      }
    }

  }
}

- (void)_installSelectGestureRecognizer
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *selectGestureRecognizer;

  if (!self->_selectGestureRecognizer)
  {
    v3 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__selectGestureChanged_);
    selectGestureRecognizer = self->_selectGestureRecognizer;
    self->_selectGestureRecognizer = v3;

    -[UITapGestureRecognizer setAllowedPressTypes:](self->_selectGestureRecognizer, "setAllowedPressTypes:", &unk_1E1A94E50);
    -[UIGestureRecognizer setDelegate:](self->_selectGestureRecognizer, "setDelegate:", self);
    -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_selectGestureRecognizer);
  }
}

- (void)_selectGestureChanged:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
  {
    -[UITextField _setHighlighted:animated:](self, "_setHighlighted:animated:", 0, 1);
    -[UITextField becomeFirstResponder](self, "becomeFirstResponder");
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return self->_selectGestureRecognizer != a3 || -[UIControl isEnabled](self, "isEnabled");
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (!+[UIDictationController takesPressesBegan:forTextView:](UIDictationController, "takesPressesBegan:forTextView:", v6, self))
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "canHandlePresses:withEvent:", v6, v7);

    if (!v9)
    {
      objc_msgSend(v7, "_lastPreparedPress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "type") == 4)
      {
        v12 = -[UIControl isEnabled](self, "isEnabled");

        if (v12)
        {
          -[UITextField _setHighlighted:animated:](self, "_setHighlighted:animated:", 1, 1);
          goto LABEL_9;
        }
      }
      else
      {

      }
      v13.receiver = self;
      v13.super_class = (Class)UITextField;
      -[UIResponder pressesBegan:withEvent:](&v13, sel_pressesBegan_withEvent_, v6, v7);
      goto LABEL_9;
    }
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pressesBegan:withEvent:", v6, v7);

  }
LABEL_9:

}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (!+[UIDictationController takesPressesChanged:forTextView:](UIDictationController, "takesPressesChanged:forTextView:", v6, self))
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "canHandlePresses:withEvent:", v6, v7);

    if (v9)
    {
      +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pressesChanged:withEvent:", v6, v7);

    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)UITextField;
      -[UIResponder pressesChanged:withEvent:](&v11, sel_pressesChanged_withEvent_, v6, v7);
    }
  }

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (!+[UIDictationController takesPressesEnded:forTextView:](UIDictationController, "takesPressesEnded:forTextView:", v6, self))
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "canHandlePresses:withEvent:", v6, v7);

    if (!v9)
    {
      objc_msgSend(v7, "_lastPreparedPress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "type") == 4)
      {
        v12 = -[UIControl isHighlighted](self, "isHighlighted");

        if (v12)
        {
          -[UITextField _setHighlighted:animated:](self, "_setHighlighted:animated:", 0, 1);
          goto LABEL_9;
        }
      }
      else
      {

      }
      v13.receiver = self;
      v13.super_class = (Class)UITextField;
      -[UIResponder pressesEnded:withEvent:](&v13, sel_pressesEnded_withEvent_, v6, v7);
      goto LABEL_9;
    }
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pressesEnded:withEvent:", v6, v7);

  }
LABEL_9:

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canHandlePresses:withEvent:", v6, v7);

  if (!v9)
  {
    objc_msgSend(v7, "_lastPreparedPress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "type") == 4)
    {
      v12 = -[UIControl isHighlighted](self, "isHighlighted");

      if (v12)
      {
        -[UITextField _setHighlighted:animated:](self, "_setHighlighted:animated:", 0, 1);
        goto LABEL_8;
      }
    }
    else
    {

    }
    v13.receiver = self;
    v13.super_class = (Class)UITextField;
    -[UIResponder pressesCancelled:withEvent:](&v13, sel_pressesCancelled_withEvent_, v6, v7);
    goto LABEL_8;
  }
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pressesCancelled:withEvent:", v6, v7);

LABEL_8:
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  -[UITextField _animateNextHighlightChange](self, "_animateNextHighlightChange");
  v9.receiver = self;
  v9.super_class = (Class)UITextField;
  LOBYTE(self) = -[UIControl beginTrackingWithTouch:withEvent:](&v9, sel_beginTrackingWithTouch_withEvent_, v7, v6);

  return (char)self;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  -[UITextField _animateNextHighlightChange](self, "_animateNextHighlightChange");
  v9.receiver = self;
  v9.super_class = (Class)UITextField;
  LOBYTE(self) = -[UIControl continueTrackingWithTouch:withEvent:](&v9, sel_continueTrackingWithTouch_withEvent_, v7, v6);

  return (char)self;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[UITextField _animateNextHighlightChange](self, "_animateNextHighlightChange");
  v8.receiver = self;
  v8.super_class = (Class)UITextField;
  -[UIControl endTrackingWithTouch:withEvent:](&v8, sel_endTrackingWithTouch_withEvent_, v7, v6);

}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[UITextField _animateNextHighlightChange](self, "_animateNextHighlightChange");
  v5.receiver = self;
  v5.super_class = (Class)UITextField;
  -[UIControl cancelTrackingWithEvent:](&v5, sel_cancelTrackingWithEvent_, v4);

}

- (void)_setDisableFocus:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)canBecomeFocused
{
  objc_super v3;

  if ((*((_BYTE *)&self->_textFieldFlags + 3) & 1) != 0)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)UITextField;
  return -[UIControl canBecomeFocused](&v3, sel_canBecomeFocused);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITextField;
  -[UIView didUpdateFocusInContext:withAnimationCoordinator:](&v4, sel_didUpdateFocusInContext_withAnimationCoordinator_, a3, a4);
}

- (BOOL)_allowsChangingFirstResponderForFocusUpdateWithContext:(id)a3
{
  id v4;
  void *v5;
  _UIDynamicFocusGroupMap *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (-[UITextField _supportsKeyboardNavigationForSuggestions](self, "_supportsKeyboardNavigationForSuggestions")
    && -[UIView isFirstResponder](self, "isFirstResponder")
    && (objc_msgSend(v4, "nextFocusedItem"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    v6 = -[_UIDynamicFocusGroupMap initWithCoordinateSpace:]([_UIDynamicFocusGroupMap alloc], "initWithCoordinateSpace:", self);
    -[_UIDynamicFocusGroupMap focusGroupIdentifierForItem:](v6, "focusGroupIdentifierForItem:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextFocusedItem");
    self = (UITextField *)objc_claimAutoreleasedReturnValue();
    -[_UIDynamicFocusGroupMap focusGroupIdentifierForItem:](v6, "focusGroupIdentifierForItem:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(self) = objc_msgSend(v7, "isEqualToString:", v8) ^ 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UITextField;
    LOBYTE(self) = -[UIResponder _allowsChangingFirstResponderForFocusUpdateWithContext:](&v10, sel__allowsChangingFirstResponderForFocusUpdateWithContext_, v4);
  }

  return (char)self;
}

- (BOOL)_shouldForwardMovementToFocusEngine:(int64_t)a3
{
  BOOL v5;
  objc_super v7;

  v5 = -[UITextField _supportsKeyboardNavigationForSuggestions](self, "_supportsKeyboardNavigationForSuggestions");
  if (a3 == 2 && v5)
    return 1;
  v7.receiver = self;
  v7.super_class = (Class)UITextField;
  return -[UIResponder _shouldForwardMovementToFocusEngine:](&v7, sel__shouldForwardMovementToFocusEngine_, a3);
}

- (int64_t)_systemDefaultFocusGroupPriority
{
  objc_super v4;

  if (-[UITextField _supportsKeyboardNavigationForSuggestions](self, "_supportsKeyboardNavigationForSuggestions"))
    return 2000;
  v4.receiver = self;
  v4.super_class = (Class)UITextField;
  return -[UIView _systemDefaultFocusGroupPriority](&v4, sel__systemDefaultFocusGroupPriority);
}

- (id)_systemDefaultFocusGroupIdentifier
{
  void *v3;
  __int16 v4;
  void *v5;
  objc_super v7;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "focusGroupContainmentBehavior");

  if ((v4 & 0x200) != 0)
  {
    _UIFocusGroupIdentifierForInstance(self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITextField;
    -[UIControl _systemDefaultFocusGroupIdentifier](&v7, sel__systemDefaultFocusGroupIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  -[UITextField _contentFloatingContainerView](self, "_contentFloatingContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UITextField _contentFloatingContainerView](self, "_contentFloatingContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_preferredConfigurationForFocusAnimation:inContext:", a3, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UITextField;
    -[UIView _preferredConfigurationForFocusAnimation:inContext:](&v11, sel__preferredConfigurationForFocusAnimation_inContext_, a3, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)_supportsKeyboardNavigationForSuggestions
{
  return *((_BYTE *)&self->_textFieldFlags + 5) & 1;
}

- (void)_initialScrollDidFinish:(id)a3
{
  -[UITextField _activateSelectionView](self, "_activateSelectionView", a3);
  -[UITextField _stopObservingFieldEditorScroll](self, "_stopObservingFieldEditorScroll");
}

- (void)__resumeBecomeFirstResponder
{
  -[UITextField _becomeFirstResponder](self, "_becomeFirstResponder");
  -[UIResponder reloadInputViews](self, "reloadInputViews");
}

- (void)_nonDestructivelyResignFirstResponder
{
  *(_QWORD *)&self->_textFieldFlags |= 0x200000uLL;
  -[UITextField resignFirstResponder](self, "resignFirstResponder");
  *(_QWORD *)&self->_textFieldFlags &= ~0x200000uLL;
}

- (void)_windowBecameKey
{
  objc_super v3;

  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) == 0)
    -[UITextField _becomeFirstResponder](self, "_becomeFirstResponder");
  v3.receiver = self;
  v3.super_class = (Class)UITextField;
  -[UIResponder _windowBecameKey](&v3, sel__windowBecameKey);
}

- (void)_windowResignedKey
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UITextField;
  -[UIResponder _windowResignedKey](&v2, sel__windowResignedKey);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (qword_1ECD7A200 != -1)
    dispatch_once(&qword_1ECD7A200, &__block_literal_global_2141);
  if (_MergedGlobals_57_1)
  {
    v8.receiver = self;
    v8.super_class = (Class)UITextField;
    -[UIControl touchesCancelled:withEvent:](&v8, sel_touchesCancelled_withEvent_, v6, v7);
  }
  else
  {
    -[UITextField touchesEnded:withEvent:](self, "touchesEnded:withEvent:", v6, v7);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (qword_1ECD7A200 != -1)
    dispatch_once(&qword_1ECD7A200, &__block_literal_global_2141);
  if (_MergedGlobals_57_1)
  {
    v8.receiver = self;
    v8.super_class = (Class)UITextField;
    -[UIControl touchesEnded:withEvent:](&v8, sel_touchesEnded_withEvent_, v6, v7);
  }

}

- (void)_tvUpdateAppearanceForUserInterfaceStyle
{
  if (!self->_disableTextColorUpdateOnTraitCollectionChange)
    -[UITextField _tvUpdateTextColor](self, "_tvUpdateTextColor");
  -[UITextField _tvUpdateContentBackdropView](self, "_tvUpdateContentBackdropView");
}

double __28__UITextField__fullFontSize__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unint64_t a4)
{
  double v6;
  float v7;
  uint64_t v8;
  double result;

  if (a2)
    objc_msgSend(a2, "pointSize");
  else
    v6 = *(double *)(a1 + 48);
  v7 = v6;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(v8 + 24) + (float)((float)((float)a4 * v7) / (float)*(uint64_t *)(a1 + 56));
  *(double *)(v8 + 24) = result;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (float)_newFontSize:(float)a3 maxSize:(float)a4
{
  float v5;
  double v6;
  double v7;

  if (a3 <= a4)
    v5 = a3;
  else
    v5 = a4;
  -[UITextField actualMinimumFontSize](self, "actualMinimumFontSize");
  if (v6 > v5)
  {
    -[UITextField actualMinimumFontSize](self, "actualMinimumFontSize");
    return v7;
  }
  return v5;
}

- (id)_copyFont:(id)a3 newSize:(float)a4 maxSize:(float)a5
{
  id v8;
  double v9;
  double v10;
  float v11;
  void *v12;

  if (!a3)
    return 0;
  v8 = a3;
  *(float *)&v9 = a4;
  *(float *)&v10 = a5;
  -[UITextField _newFontSize:maxSize:](self, "_newFontSize:maxSize:", v9, v10);
  objc_msgSend(v8, "fontWithSize:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (float)_marginTop
{
  float result;

  -[UIView bounds](self, "bounds");
  -[UITextField _marginTopForBounds:](self, "_marginTopForBounds:");
  return result;
}

- (id)_clearButtonImageForState:(unint64_t)a3
{
  void *v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  if (!a3)
  {
    -[UIView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6 == 3)
    {
      +[UIColor whiteColor](UIColor, "whiteColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 2;
    }
    else
    {
      v8 = -[UITextField _partsShouldBeMini](self, "_partsShouldBeMini");
      v7 = 0;
    }
    -[UIView tintColor](self, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _GetTextFieldClearButtonWithCustomColorContrastSettings(0, v8, v7, v9, v10, -[UIView _accessibilityResolvedInterfaceStyle](self, "_accessibilityResolvedInterfaceStyle") == 1, -[UITextField _forcesClearButtonHighContrastAppearance](self, "_forcesClearButtonHighContrastAppearance"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!_TextFieldScalesClearButton())
      goto LABEL_14;
    -[UIView traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (v12 == 6)
      goto LABEL_14;
    -[UITextField font](self, "font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferredContentSizeCategory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v15))
    {
      if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v15, CFSTR("UICTContentSizeCategoryAccessibilityXL")) != NSOrderedAscending)
      {
        v16 = 1;
LABEL_13:

        +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v13, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "imageWithConfiguration:", v17);
        v18 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v18;
LABEL_14:

        return v3;
      }
      UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v15, CFSTR("UICTContentSizeCategoryAccessibilityM"));
    }
    v16 = 2;
    goto LABEL_13;
  }
  v3 = 0;
  return v3;
}

- (BOOL)_hasCustomClearButtonImage
{
  return 0;
}

void __69__UITextField__transitionFromAccessoryView_toView_allowingAnimation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(a2, "isFinished"))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 32), "_imageViewIfNeeded");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CE86B8], "appearUpEffect");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CE86E8], "options");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSymbolEffect:options:animated:", v3, v4, 0);

  }
}

uint64_t __43__UITextField__updateAutosizeStyleIfNeeded__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __43__UITextField__updateAutosizeStyleIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  int v11;
  id v12;
  double v13;
  float v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  int v21;
  id v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  float v31;
  int v32;
  _QWORD v33[5];
  id v34;
  float v35;
  int v36;

  v28 = a2;
  objc_msgSend(v28, "size");
  v4 = v3;
  v5 = objc_msgSend(v28, "length");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(float *)(v6 + 24);
  if (v7 >= *(float *)(a1 + 72) || v4 >= *(float *)(a1 + 76))
  {
    v14 = *(float *)(v6 + 24);
  }
  else
  {
    v8 = *(_QWORD *)off_1E1678D90;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24)
                                                                 + 1.0;
      v10 = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) / v7;
      v33[0] = v9;
      v33[1] = 3221225472;
      v33[2] = __43__UITextField__updateAutosizeStyleIfNeeded__block_invoke_3;
      v33[3] = &unk_1E16E63B8;
      v33[4] = *(_QWORD *)(a1 + 32);
      v11 = *(_DWORD *)(a1 + 72);
      v35 = v10;
      v36 = v11;
      v12 = v28;
      v34 = v12;
      objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v5, 0, v33);
      objc_msgSend(v12, "size");
      v4 = v13;
      v7 = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

      v14 = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }
    while (v14 < *(float *)(a1 + 72) && v4 < *(float *)(a1 + 76));
  }
  v15 = v14;
  objc_msgSend(*(id *)(a1 + 32), "actualMinimumFontSize");
  if (v16 < v15)
  {
    v18 = *(_QWORD *)off_1E1678D90;
    v19 = MEMORY[0x1E0C809B0];
    do
    {
      v16 = *(float *)(a1 + 76);
      if (v4 <= v16)
        break;
      --*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24)
                                                                 + -1.0;
      v20 = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) / v7;
      v29[0] = v19;
      v29[1] = 3221225472;
      v29[2] = __43__UITextField__updateAutosizeStyleIfNeeded__block_invoke_4;
      v29[3] = &unk_1E16E63B8;
      v29[4] = *(_QWORD *)(a1 + 32);
      v21 = *(_DWORD *)(a1 + 72);
      v31 = v20;
      v32 = v21;
      v22 = v28;
      v30 = v22;
      objc_msgSend(v22, "enumerateAttribute:inRange:options:usingBlock:", v18, 0, v5, 0, v29);
      objc_msgSend(v22, "size");
      v4 = v23;
      v7 = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

      v24 = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 32), "actualMinimumFontSize");
    }
    while (v16 < v24);
  }
  LODWORD(v16) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (*(float *)&v16 != *(float *)(a1 + 80))
  {
    LODWORD(v17) = *(_DWORD *)(a1 + 72);
    v25 = objc_msgSend(*(id *)(a1 + 32), "_copyFont:newSize:maxSize:", *(_QWORD *)(a1 + 40), v16, v17);
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

  }
}

void __43__UITextField__updateAutosizeStyleIfNeeded__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v8, "pointSize");
  LODWORD(v9) = *(_DWORD *)(a1 + 52);
  v11 = v10 * *(float *)(a1 + 48);
  *(float *)&v11 = v11;
  v12 = (id)objc_msgSend(v7, "_copyFont:newSize:maxSize:", v8, v11, v9);

  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *(_QWORD *)off_1E1678D90, v12, a3, a4);
}

void __43__UITextField__updateAutosizeStyleIfNeeded__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v8, "pointSize");
  LODWORD(v9) = *(_DWORD *)(a1 + 52);
  v11 = v10 * *(float *)(a1 + 48);
  *(float *)&v11 = v11;
  v12 = (id)objc_msgSend(v7, "_copyFont:newSize:maxSize:", v8, v11, v9);

  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *(_QWORD *)off_1E1678D90, v12, a3, a4);
}

- (BOOL)_shouldUnobscureTextWithContentCover
{
  _BOOL4 v3;

  v3 = -[UITextField _showsContentCoverView](self, "_showsContentCoverView");
  if (v3)
    LOBYTE(v3) = -[UITextField _contentCoverUnsecuresText](self, "_contentCoverUnsecuresText");
  return v3;
}

- (BOOL)_isShowingPlaceholder
{
  void *v2;
  BOOL v3;

  -[UIView superview](self->_placeholderLabel, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_isShowingPrefix
{
  void *v2;
  BOOL v3;

  -[UIView superview](self->_prefixLabel, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (double)_internalFirstBaselineOffsetFromTop
{
  double result;

  -[UITextField _baselineOffsetForLast:autolayoutOnly:](self, "_baselineOffsetForLast:autolayoutOnly:", 0, 0);
  return result;
}

- (double)_firstBaselineOffsetFromTop
{
  double result;

  -[UITextField _baselineOffsetForLast:autolayoutOnly:](self, "_baselineOffsetForLast:autolayoutOnly:", 0, 1);
  return result;
}

- (double)_internalLastBaselineOffsetFromBottom
{
  double result;

  -[UITextField _baselineOffsetForLast:autolayoutOnly:](self, "_baselineOffsetForLast:autolayoutOnly:", 1, 0);
  return result;
}

- (UIEdgeInsets)textContainerInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UIFieldEditor textContainerInset](self->_fieldEditor, "textContainerInset");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setSizingRule:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  void *v14;

  if (((*(_QWORD *)&self->_textFieldFlags >> 38) & 1) != a3)
  {
    if ((*(_QWORD *)&self->super.super._viewFlags & 0x400000000000000) != 0)
    {
      v5 = 0;
    }
    else
    {
      -[UIView superview](self, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v14 = v5;
        -[UIView bounds](self, "bounds");
        v7 = v6;
        v9 = v8;
        -[UITextField sizeThatFits:](self, "sizeThatFits:", v6, v8);
        v13 = vabdd_f64(v7, v10) > 2.22044605e-16;
        v12 = vabdd_f64(v9, v11);
        v13 = v13 || v12 > 2.22044605e-16;
        if (v13)
          objc_msgSend(v14, "setNeedsLayout", v12);
        v5 = v14;
      }
    }
    self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFFFBFFFFFFFFFLL | ((unint64_t)(a3 == 1) << 38));

  }
}

- (int64_t)sizingRule
{
  return (*(_QWORD *)&self->_textFieldFlags >> 38) & 1;
}

- (void)_setExtremeSizingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double width;
  double height;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  CGRect v12;

  v3 = a3;
  if (-[UITextField _isExtremeSizingEnabled](self, "_isExtremeSizingEnabled") != a3)
  {
    if ((*(_QWORD *)&self->super.super._viewFlags & 0x400000000000000) != 0)
    {
      v5 = 0;
    }
    else
    {
      -[UIView superview](self, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v11 = v5;
        -[UIView bounds](self, "bounds");
        width = v12.size.width;
        height = v12.size.height;
        v8 = CGRectGetHeight(v12);
        -[UITextField sizeThatFits:](self, "sizeThatFits:", width, height);
        if (v8 == v9)
          objc_msgSend(v11, "setNeedsLayout");
        v5 = v11;
      }
    }
    v10 = 0x2000000000;
    if (!v3)
      v10 = 0;
    self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFFFDFFFFFFFFFLL | v10);

  }
}

- (BOOL)_isExtremeSizingEnabled
{
  return (*((unsigned __int8 *)&self->_textFieldFlags + 4) >> 5) & 1;
}

- (CGRect)_suffixFrame
{
  _BOOL4 v3;
  void *placeholderLabel;
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
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double MaxX;
  double left;
  double v30;
  BOOL v31;
  double v32;
  double v33;
  double v34;
  int64_t v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGRect v47;
  CGRect result;

  v3 = -[UITextField _isShowingPlaceholder](self, "_isShowingPlaceholder");
  placeholderLabel = self;
  if (v3)
    placeholderLabel = self->_placeholderLabel;
  objc_msgSend(placeholderLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField font](self, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_legacy_sizeWithFont:", v6);
  v8 = v7;

  -[UIView bounds](self, "bounds");
  -[UITextField _availableTextRectForBounds:forEditing:](self, "_availableTextRectForBounds:forEditing:", -[UITextField isEditing](self, "isEditing"), v9, v10, v11, v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[UIView bounds](self, "bounds");
  -[UITextField placeholderRectForBounds:](self, "placeholderRectForBounds:");
  v22 = v21;
  v46 = v23;
  -[UILabel text](self->_suffixLabel, "text");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel font](self->_suffixLabel, "font");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_legacy_sizeWithFont:", v25);
  v27 = v26;

  v47.origin.x = v14;
  v47.origin.y = v16;
  v47.size.width = v18;
  v47.size.height = v20;
  MaxX = CGRectGetMaxX(v47);
  left = self->_padding.left;
  v30 = left + self->_padding.right;
  v31 = v8 < v18 - v30;
  if (v8 >= v18 - v30)
    left = -0.0;
  else
    v18 = v18 - v30;
  v32 = v14 + left;
  if (v31)
    v33 = -0.0;
  else
    v33 = v30;
  v34 = v8 + v33;
  v35 = -[_UICascadingTextStorage _ui_resolvedTextAlignment](self->_textStorage, "_ui_resolvedTextAlignment");
  v36 = v32;
  v37 = v16;
  v38 = v18;
  v39 = v20;
  if (v35 == 1)
  {
    v40 = v34 * 0.5 + CGRectGetMidX(*(CGRect *)&v36) + -1.0;
  }
  else if (v35 == 2)
  {
    v40 = CGRectGetMaxX(*(CGRect *)&v36);
  }
  else
  {
    v40 = v34 + CGRectGetMinX(*(CGRect *)&v36);
  }
  if (v40 >= MaxX)
    v41 = MaxX;
  else
    v41 = v40;

  v42 = v41;
  v43 = v22;
  v44 = v27;
  v45 = v46;
  result.size.height = v45;
  result.size.width = v44;
  result.origin.y = v43;
  result.origin.x = v42;
  return result;
}

- (CGRect)_prefixFrame
{
  _BOOL4 v3;
  void *placeholderLabel;
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
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double MinX;
  double left;
  double v30;
  BOOL v31;
  double v32;
  double v33;
  double v34;
  int64_t v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGRect v48;
  CGRect result;

  v3 = -[UITextField _isShowingPlaceholder](self, "_isShowingPlaceholder");
  placeholderLabel = self;
  if (v3)
    placeholderLabel = self->_placeholderLabel;
  objc_msgSend(placeholderLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField font](self, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_legacy_sizeWithFont:", v6);
  v8 = v7;

  -[UIView bounds](self, "bounds");
  -[UITextField _availableTextRectForBounds:forEditing:](self, "_availableTextRectForBounds:forEditing:", -[UITextField isEditing](self, "isEditing"), v9, v10, v11, v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[UILabel text](self->_prefixLabel, "text");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel font](self->_prefixLabel, "font");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_legacy_sizeWithFont:", v22);
  v24 = v23;

  -[UIView bounds](self, "bounds");
  -[UITextField placeholderRectForBounds:](self, "placeholderRectForBounds:");
  v26 = v25;
  v47 = v27;
  v48.origin.x = v14;
  v48.origin.y = v16;
  v48.size.width = v18;
  v48.size.height = v20;
  MinX = CGRectGetMinX(v48);
  left = self->_padding.left;
  v30 = left + self->_padding.right;
  v31 = v8 < v18 - v30;
  if (v8 >= v18 - v30)
    left = -0.0;
  else
    v18 = v18 - v30;
  v32 = v14 + left;
  if (v31)
    v33 = -0.0;
  else
    v33 = v30;
  v34 = v8 + v33;
  v35 = -[_UICascadingTextStorage _ui_resolvedTextAlignment](self->_textStorage, "_ui_resolvedTextAlignment");
  v36 = v32;
  v37 = v16;
  v38 = v18;
  v39 = v20;
  if (v35 == 1)
  {
    v41 = CGRectGetMidX(*(CGRect *)&v36) + v34 * -0.5 - v24 + -1.0;
  }
  else
  {
    if (v35 == 2)
      v40 = CGRectGetMaxX(*(CGRect *)&v36) - v34;
    else
      v40 = CGRectGetMinX(*(CGRect *)&v36);
    v41 = v40 - v24;
  }
  if (v41 >= MinX - v24)
    v42 = v41;
  else
    v42 = MinX - v24;

  v43 = v42;
  v44 = v26;
  v45 = v24;
  v46 = v47;
  result.size.height = v46;
  result.size.width = v45;
  result.origin.y = v44;
  result.origin.x = v43;
  return result;
}

- (void)floatingContentView:(id)a3 isTransitioningFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  -[UITextField _tvUpdateContentBackdropView](self, "_tvUpdateContentBackdropView", a3, a4, a5);
  -[UITextField _tvUpdateTextColor](self, "_tvUpdateTextColor");
  -[UITextField _layoutContentAndExtras](self, "_layoutContentAndExtras");
}

- (BOOL)_isTextLayoutManagerEnabled
{
  return (*((unsigned __int8 *)&self->_textFieldFlags + 4) >> 4) & 1;
}

- (NSLayoutManager)layoutManager
{
  int has_internal_diagnostics;
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  int v9;
  UITextField *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  textFieldFlags = self->_textFieldFlags;
  if (has_internal_diagnostics)
  {
    if ((*(_QWORD *)&textFieldFlags & 0x1000000000) != 0)
    {
      __UIFaultDebugAssertLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        v9 = 138412290;
        v10 = self;
        _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "TextKit1 layout manager requested from field (%@) configured to use TextKit2", (uint8_t *)&v9, 0xCu);
      }

    }
  }
  else if ((*(_QWORD *)&textFieldFlags & 0x1000000000) != 0)
  {
    v7 = layoutManager___s_category_0;
    if (!layoutManager___s_category_0)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&layoutManager___s_category_0);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = self;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "TextKit1 layout manager requested from field (%@) configured to use TextKit2", (uint8_t *)&v9, 0xCu);
    }
  }
  -[_UITextLayoutController layoutManager](self->_textLayoutController, "layoutManager");
  return (NSLayoutManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_visualizesDebugRects
{
  return 0;
}

- (id)actualFont
{
  return -[_UICascadingTextStorage font](self->_textStorage, "font");
}

- (CGPoint)_scrollOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentOffset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGSize)_leftViewOffset
{
  CGFloat *p_height;
  double width;
  double v4;
  CGSize result;

  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    p_height = &self->_rightViewOffset.height;
    width = -self->_rightViewOffset.width;
  }
  else
  {
    p_height = &self->_leftViewOffset.height;
    width = self->_leftViewOffset.width;
  }
  v4 = *p_height;
  result.height = v4;
  result.width = width;
  return result;
}

- (void)_setLeftViewOffset:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  uint64_t v9;

  height = a3.height;
  width = a3.width;
  -[UITextField _leftViewOffset](self, "_leftViewOffset");
  if (v7 != width || v6 != height)
  {
    if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
    {
      v9 = 688;
      self->_rightViewOffset.width = -width;
    }
    else
    {
      v9 = 672;
      self->_leftViewOffset.width = width;
    }
    *(double *)((char *)&self->super.super.super._responderFlags + v9) = height;
    -[UITextField setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)_rightViewOffset
{
  CGFloat *p_height;
  double width;
  double v4;
  CGSize result;

  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    p_height = &self->_leftViewOffset.height;
    width = -self->_leftViewOffset.width;
  }
  else
  {
    p_height = &self->_rightViewOffset.height;
    width = self->_rightViewOffset.width;
  }
  v4 = *p_height;
  result.height = v4;
  result.width = width;
  return result;
}

- (void)_setRightViewOffset:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  uint64_t v9;

  height = a3.height;
  width = a3.width;
  -[UITextField _rightViewOffset](self, "_rightViewOffset");
  if (v7 != width || v6 != height)
  {
    if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
    {
      v9 = 672;
      self->_leftViewOffset.width = -width;
    }
    else
    {
      v9 = 688;
      self->_rightViewOffset.width = width;
    }
    *(double *)((char *)&self->super.super.super._responderFlags + v9) = height;
    -[UITextField setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_placeholderView
{
  return self->_placeholderLabel;
}

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v5 = v4;
  if ((valueForKey__checkedPlaceholderLabel & 1) == 0
    && objc_msgSend(v4, "isEqualToString:", CFSTR("_placeholderLabel")))
  {
    UIKVCAccessProhibited((uint64_t)v5, (uint64_t)CFSTR("UITextField"));
    valueForKey__checkedPlaceholderLabel = 1;
  }
  v8.receiver = self;
  v8.super_class = (Class)UITextField;
  -[UITextField valueForKey:](&v8, sel_valueForKey_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UITextField textInputTraits](self, "textInputTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (void)takeTraitsFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField textInputTraits](self, "textInputTraits");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "takeTraitsFrom:", v4);

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)_increaseContrastSettingChanged:(id)a3
{
  -[UITextField _invalidateCachedDefaultClearButtonImages](self, "_invalidateCachedDefaultClearButtonImages", a3);
  -[UITextField setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_forcesClearButtonHighContrastAppearance
{
  return (*((unsigned __int8 *)&self->_textFieldFlags + 3) >> 5) & 1;
}

- (void)_setForcesClearButtonHighContrastAppearance:(BOOL)a3
{
  uint64_t v4;

  if (((((*(_QWORD *)&self->_textFieldFlags & 0x20000000) == 0) ^ a3) & 1) == 0)
  {
    v4 = 0x20000000;
    if (!a3)
      v4 = 0;
    self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFFFFFDFFFFFFFLL | v4);
    -[UITextField _invalidateCachedDefaultClearButtonImages](self, "_invalidateCachedDefaultClearButtonImages");
    -[UITextField setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDevicePasscodeEntry:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[UITextField textInputTraits](self, "textInputTraits");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isDevicePasscodeEntry") != v3)
  {
    objc_msgSend(v5, "setDevicePasscodeEntry:", v3);
    -[UITextField _didChangeSecureTextEntry](self, "_didChangeSecureTextEntry");
  }

}

- (void)setSecureTextEntry:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[UITextField textInputTraits](self, "textInputTraits");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSecureTextEntry") != v3)
  {
    objc_msgSend(v5, "setSecureTextEntry:", v3);
    -[UITextField _didChangeSecureTextEntry](self, "_didChangeSecureTextEntry");
  }

}

- (void)_didChangeSecureTextEntry
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  UITextField *v9;
  void *v10;
  uint64_t v11;
  id v12;

  -[UITextField _setNeedsStyleRecalc](self, "_setNeedsStyleRecalc");
  v3 = -[UITextField _shouldObscureInput](self, "_shouldObscureInput");
  -[_UITextLayoutController setDocumentObscured:](self->_textLayoutController, "setDocumentObscured:", v3);
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecureTextEntry:", -[UITextField isSecureTextEntry](self, "isSecureTextEntry"));

  if (v3)
    v5 = 18;
  else
    v5 = 0;
  -[_UITextCanvas layer](self->_textCanvasView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisableUpdateMask:", v5);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputDelegateManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyInputDelegate");
  v9 = (UITextField *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", self);

  }
  if (+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[UIView semanticContentAttribute](self, "semanticContentAttribute")) == UIUserInterfaceLayoutDirectionRightToLeft&& -[UITextField textAlignment](self, "textAlignment") == NSTextAlignmentNatural)
  {
    -[UITextField setTextAlignment:](self, "setTextAlignment:", 2);
  }
  if (v3)
  {
    -[UITextField selectionRange](self, "selectionRange");
    if (v11)
      -[UITextField selectAll](self, "selectAll");
  }
  -[UITextField interactionAssistant](self, "interactionAssistant");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateDisplayedSelection");

}

- (void)setDisplaySecureTextUsingPlainText:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[UITextField textInputTraits](self, "textInputTraits");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "displaySecureTextUsingPlainText") != v3)
  {
    objc_msgSend(v6, "setDisplaySecureTextUsingPlainText:", v3);
    -[_UITextLayoutController setDocumentObscured:](self->_textLayoutController, "setDocumentObscured:", -[UITextField _shouldObscureInput](self, "_shouldObscureInput"));
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplaySecureTextUsingPlainText:", v3);

  }
}

- (void)setDisplaySecureEditsUsingPlainText:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[UITextField textInputTraits](self, "textInputTraits");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "displaySecureEditsUsingPlainText") != v3)
  {
    objc_msgSend(v6, "setDisplaySecureEditsUsingPlainText:", v3);
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplaySecureEditsUsingPlainText:", v3);

  }
}

- (void)setPasswordRules:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[UITextField textInputTraits](self, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passwordRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqual:", v5);

  if ((v6 & 1) == 0)
    objc_msgSend(v4, "setPasswordRules:", v7);

}

- (void)setLinkTextAttributes:(id)a3
{
  NSDictionary *v4;
  NSDictionary *linkTextAttributes;
  id v6;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  linkTextAttributes = self->_linkTextAttributes;
  self->_linkTextAttributes = v4;

  -[_UITextLayoutController documentRange](self->_textLayoutController, "documentRange");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEmpty") & 1) == 0)
  {
    -[_UITextLayoutController invalidateLayoutForRange:](self->_textLayoutController, "invalidateLayoutForRange:", v6);
    -[_UITextCanvas setNeedsDisplay](self->_textCanvasView, "setNeedsDisplay");
  }

}

- (NSDictionary)linkTextAttributes
{
  NSDictionary *linkTextAttributes;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  linkTextAttributes = self->_linkTextAttributes;
  if (linkTextAttributes)
    return linkTextAttributes;
  -[UIView tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[UIView _normalInheritedTintColor](self, "_normalInheritedTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIView tintAdjustmentMode](self, "tintAdjustmentMode") == UIViewTintAdjustmentModeDimmed)
    {
      v10 = 0.0;
      v11 = 0.0;
      objc_msgSend(v6, "getWhite:alpha:", &v11, &v10);
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v11, v10 * 0.8);
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextField.m"), 4300, CFSTR("Unable to derive tintColor!"));

      v6 = 0;
    }
  }
  v12 = *(_QWORD *)off_1E1678D98;
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (int64_t)nonEditingLinebreakMode
{
  return -[_UICascadingTextStorage lineBreakMode](self->_textStorage, "lineBreakMode");
}

- (void)setAllowsAttachments:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  _UICascadingTextStorage *textStorage;
  _QWORD v8[5];

  if (((((*(_QWORD *)&self->_textFieldFlags & 0x4000000) == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    v5 = 0x4000000;
    if (!a3)
      v5 = 0;
    self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFFFFFFBFFFFFFLL | v5);
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsAttachments:", v3);

    if (!v3)
    {
      textStorage = self->_textStorage;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __36__UITextField_setAllowsAttachments___block_invoke;
      v8[3] = &unk_1E16E6408;
      v8[4] = self;
      -[_UICascadingTextStorage coordinateAccess:](textStorage, "coordinateAccess:", v8);
    }
  }
}

void __36__UITextField_setAllowsAttachments___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)off_1E1678C48;
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 824), "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__UITextField_setAllowsAttachments___block_invoke_2;
  v7[3] = &unk_1E16B15D0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v5, 2, v7);

}

uint64_t __36__UITextField_setAllowsAttachments___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", a3, a4, &stru_1E16EDF20);
}

- (id)_attributedText
{
  _UICascadingTextStorage *v2;
  void *v3;

  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
  {
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributedText");
    v2 = (_UICascadingTextStorage *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = self->_textStorage;
  }
  return v2;
}

- (NSAttributedString)attributedText
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if ((*((_BYTE *)&self->_textFieldFlags + 2) & 2) != 0)
  {
    -[UITextField _attributedText](self, "_attributedText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
LABEL_12:
      v13 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    -[UITextField text](self, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v3);
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[UITextField font](self, "font");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[UITextField font](self, "font");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v7, *(_QWORD *)off_1E1678D90);

      }
      -[UITextField textColor](self, "textColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[UITextField textColor](self, "textColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v9, *(_QWORD *)off_1E1678D98);

      }
      objc_msgSend(v4, "setAttributes:range:", v5, 0, objc_msgSend(v4, "length"));

    }
    else
    {
      v4 = 0;
    }

    if (!v4)
      goto LABEL_12;
  }
  v10 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v10, "mutableString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField textInputTraits](self, "textInputTraits");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_removeCharactersFromSet:", objc_msgSend(v12, "textTrimmingSet"));

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v10);
LABEL_13:

  return (NSAttributedString *)v13;
}

- (void)_setAttributedTextOnFieldEditor:(id)a3 setCaretSelectionAfterText:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v4 = a4;
  v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v11;
  else
    v6 = (id)objc_msgSend(v11, "mutableCopy");
  v7 = v6;
  *(_QWORD *)&self->_textFieldFlags |= 0x20000uLL;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UITextField _rangeForSetText](self, "_rangeForSetText");
  objc_msgSend(v8, "_setAttributedTextInRange:replacementText:andSetCaretSelectionAfterText:", v9, v10, v7, v4);

}

- (void)sanitizeAttributedText:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "mutableString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField _sanitizeText:](self, "_sanitizeText:", v4);

  +[_NSAttributedStringIntentResolver resolveAttributedString:inRange:](_UIAttributedStringIntentResolver, "resolveAttributedString:inRange:", v5, 0, objc_msgSend(v5, "length"));
}

- (void)_scrollRangeToVisible:(_NSRange)a3 animated:(BOOL)a4
{
  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
    -[UIFieldEditor _scrollRangeToVisible:animated:](self->_fieldEditor, "_scrollRangeToVisible:animated:", a3.location, a3.length, a4);
}

- (void)_setAttributedText:(id)a3 setCaretSelectionAfterText:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _UICascadingTextStorage *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v4 = a4;
  *(_QWORD *)&self->_textFieldFlags |= 0x20000uLL;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E16EDF20);
  v13 = v8;

  objc_msgSend(v13, "mutableString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField sanitizeAttributedText:](self, "sanitizeAttributedText:", v13);
  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
  {
    -[UITextField _setAttributedTextOnFieldEditor:setCaretSelectionAfterText:](self, "_setAttributedTextOnFieldEditor:setCaretSelectionAfterText:", v13, v4);
  }
  else
  {
    v10 = self->_textStorage;
    v11 = -[UITextField _rangeForSetText](self, "_rangeForSetText");
    -[NSConcreteTextStorage replaceCharactersInRange:withAttributedString:](v10, "replaceCharactersInRange:withAttributedString:", v11, v12, v13);
    -[_UICascadingTextStorage _restoreOriginalFontAttribute](v10, "_restoreOriginalFontAttribute");
    -[_UICascadingTextStorage setLineBreakMode:](v10, "setLineBreakMode:", -[UITextField nonEditingLinebreakMode](self, "nonEditingLinebreakMode"));

  }
  -[UITextField finishedSettingTextOrAttributedText](self, "finishedSettingTextOrAttributedText");

}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
  -[UITextField _setAttributedText:setCaretSelectionAfterText:](self, "_setAttributedText:setCaretSelectionAfterText:", attributedText, 1);
}

- (void)setShadowColor:(id)a3
{
  -[_UICascadingTextStorage setShadowColor:](self->_textStorage, "setShadowColor:", a3);
  -[UITextField _syncTypingAttributesWithDefaultAttribute:](self, "_syncTypingAttributesWithDefaultAttribute:", *(_QWORD *)off_1E1679048);
}

- (UIColor)shadowColor
{
  return -[_UICascadingTextStorage shadowColor](self->_textStorage, "shadowColor");
}

- (void)setShadowOffset:(CGSize)a3
{
  -[_UICascadingTextStorage setShadowOffset:](self->_textStorage, "setShadowOffset:", a3.width, a3.height);
  -[UITextField _syncTypingAttributesWithDefaultAttribute:](self, "_syncTypingAttributesWithDefaultAttribute:", *(_QWORD *)off_1E1679048);
}

- (CGSize)shadowOffset
{
  double v2;
  double v3;
  CGSize result;

  -[_UICascadingTextStorage shadowOffset](self->_textStorage, "shadowOffset");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setShadowBlur:(double)a3
{
  -[_UICascadingTextStorage setShadowBlur:](self->_textStorage, "setShadowBlur:", a3);
  -[UITextField _syncTypingAttributesWithDefaultAttribute:](self, "_syncTypingAttributesWithDefaultAttribute:", *(_QWORD *)off_1E1679048);
}

- (void)setClearingBehavior:(int64_t)a3
{
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  textFieldFlags = self->_textFieldFlags;
  if (((*(unint64_t *)&textFieldFlags >> 18) & 3) != a3)
  {
    self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&textFieldFlags & 0xFFFFFFFFFFF3FFFFLL | ((unint64_t)(a3 & 3) << 18));
    -[UITextInputTraits setTextSelectionBehavior:](self->_traits, "setTextSelectionBehavior:", -[UITextField textSelectionBehavior](self, "textSelectionBehavior"));
    if (-[UITextField isEditing](self, "isEditing"))
    {
      if (a3)
      {
        if (a3 == 3)
        {
          -[UITextField interactionAssistant](self, "interactionAssistant");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setSelectionHighlightMode:", 1);
        }
        else
        {
          if (a3 != 2)
          {
LABEL_12:
            -[UITextField _updateSelectionGestures](self, "_updateSelectionGestures");
            return;
          }
          -[UITextField interactionAssistant](self, "interactionAssistant");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "deactivateSelection");
        }

        -[UITextField _text](self, "_text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextField setSelectionRange:](self, "setSelectionRange:", 0, objc_msgSend(v10, "length"));
      }
      else
      {
        -[UITextField interactionAssistant](self, "interactionAssistant");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "activateSelection");

        -[UITextField interactionAssistant](self, "interactionAssistant");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setSelectionDisplayVisible:", 1);

        -[UITextField interactionAssistant](self, "interactionAssistant");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setSelectionHighlightMode:", 0);

        -[UITextField _fieldEditor](self, "_fieldEditor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTextSelectionBehavior:", -[UITextInputTraits textSelectionBehavior](self->_traits, "textSelectionBehavior"));
      }

      goto LABEL_12;
    }
  }
}

- (void)disableClearsOnInsertion
{
  -[UITextField setClearingBehavior:](self, "setClearingBehavior:", 0);
}

void __49__UITextField__adjustFontForAccessibilityTraits___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678F78);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v10, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", *(_QWORD *)(a1 + 32));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13 && (objc_msgSend(v10, "isEqual:", v11) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *(_QWORD *)off_1E1678D90, v12, a3, a4);
  }

}

void __40__UITextField_setDefaultTextAttributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "_inputController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_addToTypingAttributes:value:", v6, v5);

}

- (BOOL)_shouldUpdatePlaceholderTextAlignmentWhenOverridden
{
  return (*((unsigned __int8 *)&self->_textFieldFlags + 5) >> 4) & 1;
}

- (void)_setShouldUpdatePlaceholderTextAlignmentWhenOverridden:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (int)controlSize
{
  return self->_controlSize;
}

- (id)createTextLabelWithTextColor:(id)a3
{
  id v3;
  UITextFieldLabel *v4;
  UITextFieldLabel *v5;
  void *v6;

  v3 = a3;
  v4 = [UITextFieldLabel alloc];
  v5 = -[UILabel initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(off_1E167A828, "defaultFontSize");
  objc_msgSend(off_1E167A828, "systemFontOfSize:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v5, "setFont:", v6);

  -[UIView setOpaque:](v5, "setOpaque:", 0);
  -[UIView setBackgroundColor:](v5, "setBackgroundColor:", 0);
  -[UIView setContentMode:](v5, "setContentMode:", 3);
  if (v3)
    -[UILabel setTextColor:](v5, "setTextColor:", v3);

  return v5;
}

- (int64_t)_suffixLabelTextAlignment
{
  return 0;
}

- (void)_setSuffix:(id)a3 withColor:(id)a4
{
  id v6;
  UITextFieldLabel *suffixLabel;
  UITextFieldLabel *v8;
  void *v9;
  UITextFieldLabel *v10;
  UITextFieldLabel *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  suffixLabel = self->_suffixLabel;
  if (suffixLabel)
  {
    -[UIView removeFromSuperview](suffixLabel, "removeFromSuperview");
    v8 = self->_suffixLabel;
    self->_suffixLabel = 0;

    -[UITextField setNeedsLayout](self, "setNeedsLayout");
  }
  if (objc_msgSend(v15, "length"))
  {
    v9 = v6;
    if (!v6)
    {
      +[UIColor placeholderTextColor](UIColor, "placeholderTextColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = -[UITextField createTextLabelWithTextColor:](self, "createTextLabelWithTextColor:", v9);
    v11 = self->_suffixLabel;
    self->_suffixLabel = v10;

    if (!v6)
    -[UILabel setText:](self->_suffixLabel, "setText:", v15);
    -[UITextField font](self, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_suffixLabel, "setFont:", v12);

    -[UILabel setTextAlignment:](self->_suffixLabel, "setTextAlignment:", -[UITextField _suffixLabelTextAlignment](self, "_suffixLabelTextAlignment"));
    -[UITextField _cuiCatalog](self, "_cuiCatalog");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setCuiCatalog:](self->_suffixLabel, "_setCuiCatalog:", v13);

    -[UITextField _cuiStyleEffectConfiguration](self, "_cuiStyleEffectConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setCuiStyleEffectConfiguration:](self->_suffixLabel, "_setCuiStyleEffectConfiguration:", v14);

    -[UITextField setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_updateSuffix:(id)a3
{
  UITextFieldLabel *suffixLabel;

  suffixLabel = self->_suffixLabel;
  if (suffixLabel)
  {
    -[UILabel setText:](suffixLabel, "setText:", a3);
    -[UITextField setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UITextField _setSuffix:withColor:](self, "_setSuffix:withColor:", a3, 0);
  }
}

- (void)_setPrefix:(id)a3
{
  id v4;
  UITextFieldLabel *prefixLabel;
  UITextFieldLabel *v6;
  void *v7;
  UITextFieldLabel *placeholderLabel;
  uint64_t v9;
  UITextFieldLabel *v10;
  UITextFieldLabel *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  prefixLabel = self->_prefixLabel;
  v15 = v4;
  if (prefixLabel)
  {
    -[UIView removeFromSuperview](prefixLabel, "removeFromSuperview");
    v6 = self->_prefixLabel;
    self->_prefixLabel = 0;

    v4 = v15;
  }
  if (objc_msgSend(v4, "length"))
  {
    +[UIColor placeholderTextColor](UIColor, "placeholderTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    placeholderLabel = self->_placeholderLabel;
    if (placeholderLabel)
    {
      -[UILabel textColor](placeholderLabel, "textColor");
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
    v10 = -[UITextField createTextLabelWithTextColor:](self, "createTextLabelWithTextColor:", v7);
    v11 = self->_prefixLabel;
    self->_prefixLabel = v10;

    -[UILabel setText:](self->_prefixLabel, "setText:", v15);
    -[UITextField font](self, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_prefixLabel, "setFont:", v12);

    -[UITextField _cuiCatalog](self, "_cuiCatalog");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setCuiCatalog:](self->_prefixLabel, "_setCuiCatalog:", v13);

    -[UITextField _cuiStyleEffectConfiguration](self, "_cuiStyleEffectConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setCuiStyleEffectConfiguration:](self->_prefixLabel, "_setCuiStyleEffectConfiguration:", v14);

    -[UITextField setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setClearsOnBeginEditing:(BOOL)clearsOnBeginEditing
{
  -[UITextField setClearingBehavior:](self, "setClearingBehavior:", clearsOnBeginEditing);
}

- (void)setClearsPlaceholderOnBeginEditing:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (void)setBackground:(UIImage *)background
{
  UIImage *v5;
  void *v6;
  UIImage *v7;

  v5 = background;
  if (self->_background != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_background, background);
    -[UITextField _invalidateBackgroundProvider](self, "_invalidateBackgroundProvider");
    -[UITextField _backgroundProvider](self, "_backgroundProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsDisplay");

    v5 = v7;
  }

}

- (void)setDisabledBackground:(UIImage *)disabledBackground
{
  UIImage *v5;
  UIImage *v6;

  v5 = disabledBackground;
  if (self->_disabledBackground != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_disabledBackground, disabledBackground);
    -[UITextField setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (BOOL)allowsEditingTextAttributes
{
  return *((_BYTE *)&self->_textFieldFlags + 2) & 1;
}

- (void)setAllowsEditingTextAttributes:(BOOL)allowsEditingTextAttributes
{
  _BOOL4 v3;
  uint64_t v5;
  unint64_t v6;

  v3 = allowsEditingTextAttributes;
  if ((-[UITextField isSecureTextEntry](self, "isSecureTextEntry") & 1) == 0)
  {
    v5 = 0x10000;
    if (!v3)
      v5 = 0;
    v6 = *(_QWORD *)&self->_textFieldFlags & 0xFFFFFFFFFFFEFFFFLL | v5;
    self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)v6;
    if (v3)
      self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(v6 | 0x20000);
  }
}

- (id)_attributedStringForInsertionOfAttributedString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_inputController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_attributedStringForInsertionOfAttributedString:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)typingAttributes
{
  void *v2;
  void *v3;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typingAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setTypingAttributes:(NSDictionary *)typingAttributes
{
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags;
  NSDictionary *v5;
  id v6;

  textFieldFlags = self->_textFieldFlags;
  if ((*(_WORD *)&textFieldFlags & 0x100) != 0)
  {
    self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(unint64_t *)&textFieldFlags | 0x20000);
    v5 = typingAttributes;
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTypingAttributes:", v5);

  }
}

- (UITextFieldViewMode)leftViewMode
{
  uint64_t v2;

  v2 = 10;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) == 0)
    v2 = 9;
  return *(UITextFieldViewMode *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___UITextField__fieldEditor[v2]);
}

- (UITextFieldViewMode)rightViewMode
{
  uint64_t v2;

  v2 = 9;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) == 0)
    v2 = 10;
  return *(UITextFieldViewMode *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___UITextField__fieldEditor[v2]);
}

- (id)_contentCoverView
{
  return self->_contentCoverView;
}

- (void)_setContentCoverView:(id)a3
{
  UIView *v5;
  UIView *contentCoverView;
  UIView *v7;

  v5 = (UIView *)a3;
  contentCoverView = self->_contentCoverView;
  if (contentCoverView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](contentCoverView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentCoverView, a3);
    -[UIView setUserInteractionEnabled:](self->_contentCoverView, "setUserInteractionEnabled:", 0);
    -[UITextField _contentCoverStateDidChange](self, "_contentCoverStateDidChange");
    v5 = v7;
  }

}

- (int64_t)_contentCoverViewMode
{
  return self->_contentCoverViewMode;
}

- (void)_setContentCoverViewMode:(int64_t)a3
{
  if (self->_contentCoverViewMode != a3)
  {
    self->_contentCoverViewMode = a3;
    -[UITextField _contentCoverStateDidChange](self, "_contentCoverStateDidChange");
  }
}

- (BOOL)_contentCoverUnsecuresText
{
  return (*((unsigned __int8 *)&self->_textFieldFlags + 3) >> 4) & 1;
}

- (void)_setContentCoverUnsecuresText:(BOOL)a3
{
  uint64_t v4;

  if (((((*(_QWORD *)&self->_textFieldFlags & 0x10000000) == 0) ^ a3) & 1) == 0)
  {
    v4 = 0x10000000;
    if (!a3)
      v4 = 0;
    self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFFFFFEFFFFFFFLL | v4);
    if (-[UITextField _showsContentCoverView](self, "_showsContentCoverView"))
      -[UITextField _contentCoverStateDidChange](self, "_contentCoverStateDidChange");
  }
}

- (void)_contentCoverStateDidChange
{
  _BOOL8 v3;

  -[UITextField setNeedsLayout](self, "setNeedsLayout");
  if (-[UIView isFirstResponder](self, "isFirstResponder"))
  {
    if (-[UITextField _showsContentCoverView](self, "_showsContentCoverView"))
      -[UITextField _detachFieldEditor](self, "_detachFieldEditor");
    else
      -[UITextField _attachFieldEditor](self, "_attachFieldEditor");
  }
  v3 = -[UITextField _shouldObscureInput](self, "_shouldObscureInput");
  -[_UITextLayoutController setDocumentObscured:](self->_textLayoutController, "setDocumentObscured:", v3);
  if (v3)
    -[UIFieldEditor _obscureAllText](self->_fieldEditor, "_obscureAllText");
  else
    -[UITextField _invalidateAllGlyphsAndTextLayout](self, "_invalidateAllGlyphsAndTextLayout");
  -[UITextField _updateSelectionGestures](self, "_updateSelectionGestures");
}

- (void)_setBackgroundCoverView:(id)a3
{
  UIView *v5;
  UIView *backgroundCoverView;
  UIView *v7;

  v5 = (UIView *)a3;
  backgroundCoverView = self->_backgroundCoverView;
  if (backgroundCoverView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](backgroundCoverView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundCoverView, a3);
    -[UIView setUserInteractionEnabled:](self->_backgroundCoverView, "setUserInteractionEnabled:", 0);
    -[UITextField _backgroundCoverStateDidChange](self, "_backgroundCoverStateDidChange");
    v5 = v7;
  }

}

- (int64_t)_backgroundCoverViewMode
{
  return self->_backgroundCoverViewMode;
}

- (void)_setBackgroundCoverViewMode:(int64_t)a3
{
  if (self->_backgroundCoverViewMode != a3)
  {
    self->_backgroundCoverViewMode = a3;
    -[UITextField _backgroundCoverStateDidChange](self, "_backgroundCoverStateDidChange");
  }
}

- (void)setRecentsAccessoryView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_recentsAccessoryView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_recentsAccessoryView, a3);
    v5 = v6;
  }

}

- (UIView)recentsAccessoryView
{
  UIView *recentsAccessoryView;
  objc_super v4;

  recentsAccessoryView = self->_recentsAccessoryView;
  if (recentsAccessoryView)
    return recentsAccessoryView;
  v4.receiver = self;
  v4.super_class = (Class)UITextField;
  -[UIResponder inputAccessoryView](&v4, sel_inputAccessoryView);
  return (UIView *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_ownsInputAccessoryView
{
  objc_super v3;

  if (self->_inputAccessoryView)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)UITextField;
  return -[UIResponder _ownsInputAccessoryView](&v3, sel__ownsInputAccessoryView);
}

- (void)setInputAssistantItem:(id)a3
{
  UITextInputAssistantItem *v5;
  UITextInputAssistantItem *v6;

  v5 = (UITextInputAssistantItem *)a3;
  if (self->_inputAssistantItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_inputAssistantItem, a3);
    v5 = v6;
  }

}

- (UITextInputAssistantItem)inputAssistantItem
{
  UITextInputAssistantItem *inputAssistantItem;
  objc_super v4;

  inputAssistantItem = self->_inputAssistantItem;
  if (inputAssistantItem)
    return inputAssistantItem;
  v4.receiver = self;
  v4.super_class = (Class)UITextField;
  -[UIResponder inputAssistantItem](&v4, sel_inputAssistantItem);
  return (UITextInputAssistantItem *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)drawTextInRect:(CGRect)rect
{
  -[_UITextCanvas drawTextInRect:](self->_textCanvasView, "drawTextInRect:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
}

- (void)drawSuffixInRect:(CGRect)a3
{
  -[UITextFieldLabel _defaultDrawTextInRect:](self->_suffixLabel, "_defaultDrawTextInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)drawPrefixInRect:(CGRect)a3
{
  -[UITextFieldLabel _defaultDrawTextInRect:](self->_prefixLabel, "_defaultDrawTextInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

void __58__UITextField__detachFieldEditorDiscardingEdits_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_detachFieldEditorDiscardingEdits:animated:", *(unsigned __int8 *)(a1 + 40), 0);
  objc_msgSend(WeakRetained, "layoutIfNeeded");

}

- (id)_defaultPromptString
{
  NSAttributedString *overriddenPlaceholder;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  overriddenPlaceholder = self->_overriddenPlaceholder;
  if (overriddenPlaceholder)
  {
    -[NSAttributedString string](overriddenPlaceholder, "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITextField attributedPlaceholder](self, "attributedPlaceholder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[UITextField placeholder](self, "placeholder");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v4 = v8;

  }
  return v4;
}

- (void)_invalidateAfterUpdatingEditingAttributes
{
  -[UITextField setTypingAttributes:](self, "setTypingAttributes:", 0);
  -[UITextField _invalidateAllGlyphsAndTextLayout](self, "_invalidateAllGlyphsAndTextLayout");
}

- (BOOL)_shouldEndEditingOnReturn
{
  return 0;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  UITextField *WeakRetained;
  char v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (-[UITextField isEditing](self, "isEditing")
    || -[UITextField _showsContentCoverView](self, "_showsContentCoverView")
    && objc_msgSend(v9, "isEqualToString:", CFSTR("\n")))
  {
    WeakRetained = (UITextField *)objc_loadWeakRetained(&self->_delegate);
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("\n")))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v11 = -[UITextField textFieldShouldReturn:](WeakRetained, "textFieldShouldReturn:", self);
LABEL_14:
        v12 = v11;
        goto LABEL_15;
      }
      if (-[UITextField _shouldEndEditingOnReturn](self, "_shouldEndEditingOnReturn"))
      {
        -[UIView endEditing:](self, "endEditing:", 0);
        v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "selectionRange");
    v16 = v15;

    v18 = 0;
    v12 = -[UITextField _delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:](self, "_delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:", v14, v16, v9, &v18);
    if (v18 || (objc_opt_respondsToSelector() & 1) == 0 || WeakRetained == self)
      goto LABEL_15;
    v11 = -[UITextField keyboardInput:shouldInsertText:isMarkedText:](WeakRetained, "keyboardInput:shouldInsertText:isMarkedText:", v8, v9, v5);
    goto LABEL_14;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  BOOL v9;

  length = a4.length;
  location = a4.location;
  v8 = a5;
  if (-[UITextField isEditing](self, "isEditing"))
    v9 = -[UITextField _delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:](self, "_delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:", location, length, v8, 0);
  else
    v9 = 0;

  return v9;
}

- (BOOL)keyboardInputShouldDelete:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  UITextField *WeakRetained;
  char v13;

  v4 = a3;
  if (-[UITextField isEditing](self, "isEditing"))
  {
    -[UITextField _inputController](self, "_inputController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_rangeForBackwardsDelete");
    v8 = v7;

    v13 = 0;
    if (v8
      && (v9 = -[UITextField _delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:](self, "_delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:", v6, v8, &stru_1E16EDF20, &v13), v13))
    {
      v10 = v9;
    }
    else
    {
      WeakRetained = (UITextField *)objc_loadWeakRetained(&self->_delegate);
      v10 = 1;
      if ((objc_opt_respondsToSelector() & 1) != 0 && WeakRetained != self)
        v10 = -[UITextField keyboardInputShouldDelete:](WeakRetained, "keyboardInputShouldDelete:", v4);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)keyboardInputChanged:(id)a3
{
  id v4;
  UITextField *WeakRetained;
  char v6;

  v4 = a3;
  if (-[UITextField isEditing](self, "isEditing"))
  {
    WeakRetained = (UITextField *)objc_loadWeakRetained(&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) == 0 || WeakRetained == self)
    {
      -[UITextField setNeedsLayout](self, "setNeedsLayout");
      v6 = 1;
    }
    else
    {
      v6 = -[UITextField keyboardInputChanged:](WeakRetained, "keyboardInputChanged:", v4);
    }

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)fieldEditorDidChange:(id)a3
{
  _BOOL4 v4;
  void *v5;
  UITextFieldLabel *suffixLabel;
  UITextFieldLabel *prefixLabel;
  id v8;

  if (-[UITextField adjustsFontSizeToFitWidth](self, "adjustsFontSizeToFitWidth", a3))
    -[UITextField _setNeedsStyleRecalc](self, "_setNeedsStyleRecalc");
  v4 = -[UITextField _hasContent](self, "_hasContent");
  if (self->_clearButtonMode || v4 == -[UITextField _isShowingPlaceholder](self, "_isShowingPlaceholder"))
    -[UITextField setNeedsLayout](self, "setNeedsLayout");
  if ((-[UITextField _shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged](self, "_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged")|| !-[UITextField hasMarkedText](self, "hasMarkedText"))&& (*((_BYTE *)&self->_textFieldFlags + 1) & 0x80) == 0)
  {
    -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", 0x20000, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("UITextFieldTextDidChangeNotification"), self);

  }
  if (v4)
  {
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[UITextField setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UITextField _invalidateAllGlyphsAndTextLayout](self, "_invalidateAllGlyphsAndTextLayout");
  }
  suffixLabel = self->_suffixLabel;
  if (suffixLabel)
  {
    -[UITextField _suffixFrame](self, "_suffixFrame");
    -[UILabel setFrame:](suffixLabel, "setFrame:");
  }
  prefixLabel = self->_prefixLabel;
  if (prefixLabel)
  {
    -[UITextField _prefixFrame](self, "_prefixFrame");
    -[UILabel setFrame:](prefixLabel, "setFrame:");
  }
  -[UITextField _fieldEditorHost](self, "_fieldEditorHost");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutIfNeeded");

}

- (_NSRange)fieldEditor:(id)a3 willChangeSelectionFromCharacterRange:(_NSRange)a4 toCharacterRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  id WeakRetained;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  length = a5.length;
  location = a5.location;
  v7 = a4.length;
  v8 = a4.location;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    location = objc_msgSend(WeakRetained, "textField:willChangeSelectionFromCharacterRange:toCharacterRange:", self, v8, v7, location, length);
    length = v11;
  }

  v12 = location;
  v13 = length;
  result.length = v13;
  result.location = v12;
  return result;
}

- (void)fieldEditorDidChangeSelection:(id)a3
{
  UITextDragDropSupport *textDragDropSupport;
  UITextDragDropSupport *v5;
  UITextDragDropSupport *v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  textDragDropSupport = self->_textDragDropSupport;
  if (!textDragDropSupport)
  {
    +[UITextDragDropSupport installTextDragDropOnView:](UITextDragDropSupport, "installTextDragDropOnView:", self);
    v5 = (UITextDragDropSupport *)objc_claimAutoreleasedReturnValue();
    v6 = self->_textDragDropSupport;
    self->_textDragDropSupport = v5;

    textDragDropSupport = self->_textDragDropSupport;
  }
  -[UITextDragDropSupport notifyTextInteraction](textDragDropSupport, "notifyTextInteraction");
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "textFieldDidChangeSelection:", self);

}

- (BOOL)fieldEditor:(id)a3 shouldInsertText:(id)a4 replacingRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  UITextDragDropSupport *textDragDropSupport;
  UITextDragDropSupport *v10;
  UITextDragDropSupport *v11;
  BOOL v12;

  length = a5.length;
  location = a5.location;
  v8 = a4;
  textDragDropSupport = self->_textDragDropSupport;
  if (!textDragDropSupport)
  {
    +[UITextDragDropSupport installTextDragDropOnView:](UITextDragDropSupport, "installTextDragDropOnView:", self);
    v10 = (UITextDragDropSupport *)objc_claimAutoreleasedReturnValue();
    v11 = self->_textDragDropSupport;
    self->_textDragDropSupport = v10;

    textDragDropSupport = self->_textDragDropSupport;
  }
  -[UITextDragDropSupport notifyTextInteraction](textDragDropSupport, "notifyTextInteraction");
  v12 = -[UITextField _delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:](self, "_delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:", location, length, v8, 0);
  -[UITextField disableClearsOnInsertion](self, "disableClearsOnInsertion");

  return v12;
}

- (id)supportedPasteboardTypesForCurrentSelection
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = qword_1ECD7A1E0;
  if (!qword_1ECD7A1E0)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = (void *)qword_1ECD7A1E0;
    qword_1ECD7A1E0 = (uint64_t)v4;

    v6 = (void *)qword_1ECD7A1E0;
    objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    objc_msgSend((id)qword_1ECD7A1E0, "addObjectsFromArray:", UIPasteboardTypeListString);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = (void *)qword_1ECD7A1E8;
    qword_1ECD7A1E8 = (uint64_t)v8;

    objc_msgSend((id)qword_1ECD7A1E8, "addObject:", *MEMORY[0x1E0DD97D8]);
    v10 = (void *)qword_1ECD7A1E8;
    objc_msgSend((id)*MEMORY[0x1E0CEC5C0], "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    v12 = (void *)qword_1ECD7A1E8;
    objc_msgSend((id)*MEMORY[0x1E0CEC5C8], "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

    objc_msgSend((id)qword_1ECD7A1E8, "addObjectsFromArray:", qword_1ECD7A1E0);
    v3 = qword_1ECD7A1E0;
  }
  if ((*(_QWORD *)&self->_textFieldFlags & 0x10000) != 0)
    v14 = (void *)qword_1ECD7A1E8;
  else
    v14 = (void *)v3;
  return v14;
}

- (id)_dictationInterpretations
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  NSRequestConcreteImplementation();
  v3 = (void *)MEMORY[0x1E0C99D20];
  -[UITextField text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)documentFragmentForPasteboardItemAtIndex:(int64_t)a3
{
  id WeakRetained;
  void *v6;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "documentFragmentForPasteboardItemAtIndex:inTextField:", a3, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setClearButtonStyle:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
    -[UITextField setClearButtonMode:](self, "setClearButtonMode:", qword_186684958[a3]);
}

- (void)drawRect:(CGRect)a3
{
  if ((*((_BYTE *)&self->_textFieldFlags + 4) & 2) != 0)
  {
    -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    -[UITextField borderRectForBounds:](self, "borderRectForBounds:");
    -[_UITextFieldBackgroundProvider drawInBounds:](self->_backgroundProvider, "drawInBounds:");
  }
}

- (id)_defaultFocusEffect
{
  return 0;
}

- (void)_setPadding:(UIEdgeInsets)a3
{
  UIEdgeInsets *p_padding;
  double top;
  double bottom;

  p_padding = &self->_padding;
  top = self->_padding.top;
  bottom = self->_padding.bottom;
  if (a3.left != self->_padding.left || a3.top != top || a3.right != self->_padding.right || a3.bottom != bottom)
  {
    if (a3.bottom == bottom)
    {
      p_padding->top = a3.top;
      self->_padding.left = a3.left;
      self->_padding.bottom = a3.bottom;
      self->_padding.right = a3.right;
      if (a3.top == top)
      {
LABEL_16:
        -[UITextField _setNeedsStyleRecalc](self, "_setNeedsStyleRecalc");
        return;
      }
    }
    else
    {
      p_padding->top = a3.top;
      self->_padding.left = a3.left;
      self->_padding.bottom = a3.bottom;
      self->_padding.right = a3.right;
    }
    -[UIView _invalidateBaselineConstraints](self, "_invalidateBaselineConstraints");
    goto LABEL_16;
  }
}

- (void)_setLeadingPadding:(double)a3
{
  double left;
  double right;

  left = a3;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    right = a3;
    left = self->_padding.left;
  }
  else
  {
    right = self->_padding.right;
  }
  -[UITextField _setPadding:](self, "_setPadding:", self->_padding.top, left, self->_padding.bottom, right);
}

- (void)_setTrailingPadding:(double)a3
{
  double left;
  double right;

  left = a3;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    right = self->_padding.right;
  }
  else
  {
    right = a3;
    left = self->_padding.left;
  }
  -[UITextField _setPadding:](self, "_setPadding:", self->_padding.top, left, self->_padding.bottom, right);
}

- (void)setPaddingTop:(float)a3 paddingLeft:(float)a4
{
  -[UITextField _setPadding:](self, "_setPadding:", a3, a4, self->_padding.bottom, self->_padding.right);
}

- (void)setPaddingLeft:(float)a3
{
  -[UITextField _setPadding:](self, "_setPadding:", self->_padding.top, a3, self->_padding.bottom, self->_padding.right);
}

- (void)setPaddingRight:(float)a3
{
  -[UITextField _setPadding:](self, "_setPadding:", self->_padding.top, self->_padding.left, self->_padding.bottom, a3);
}

- (float)paddingTop
{
  return self->_padding.top;
}

- (float)paddingBottom
{
  return self->_padding.bottom;
}

- (void)_enabledDidChangeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UITextField _backgroundProvider](self, "_backgroundProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enabledDidChangeAnimated:", v3);

}

- (void)_setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL4 v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v7 = -[UIControl isHighlighted](self, "isHighlighted");
  v8.receiver = self;
  v8.super_class = (Class)UITextField;
  -[UIControl setHighlighted:](&v8, sel_setHighlighted_, v5);
  if (v7 != -[UIControl isHighlighted](self, "isHighlighted"))
    -[UITextField _highlightedDidChangeAnimated:](self, "_highlightedDidChangeAnimated:", v4);
}

- (void)setHighlighted:(BOOL)a3
{
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags;

  textFieldFlags = self->_textFieldFlags;
  self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&textFieldFlags & 0xFFFFFFFEFFFFFFFFLL);
  -[UITextField _setHighlighted:animated:](self, "_setHighlighted:animated:", a3, HIDWORD(*(unint64_t *)&textFieldFlags) & 1);
}

- (void)_highlightedDidChangeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UITextField _backgroundProvider](self, "_backgroundProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "highlightedDidChangeAnimated:", v3);

}

- (void)_animateNextHighlightChange
{
  *(_QWORD *)&self->_textFieldFlags |= 0x100000000uLL;
}

- (void)selectAll
{
  id v3;

  -[UITextField _text](self, "_text");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextField setSelectionRange:](self, "setSelectionRange:", 0, objc_msgSend(v3, "length"));

}

- (void)_clearSelectionUI
{
  void *v3;
  void *v4;
  id v5;

  -[UITextField interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearSelection");

  -[UITextField interactionAssistant](self, "interactionAssistant");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateDisplayedSelection");

}

- (void)_resetSelectionUI
{
  void *v3;
  void *v4;
  id v5;

  -[UITextField interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionChanged");

  -[UITextField interactionAssistant](self, "interactionAssistant");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateDisplayedSelection");

}

- (void)clearText
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
  {
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = -[UITextField _rangeForSetText](self, "_rangeForSetText");
    objc_msgSend(v5, "setTextInRange:replacementText:", v3, v4, &stru_1E16EDF20);

  }
}

- (id)_tvTypingAttributes
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  -[UITextField typingAttributes](self, "typingAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[UITextField _fieldEditorHeight](self, "_fieldEditorHeight");
  v6 = v5;
  -[UITextField font](self, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontWithSize:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v4, "setObject:forKey:", v8, *(_QWORD *)off_1E1678D90);

  return v4;
}

- (void)_forceObscureAllText
{
  id v2;

  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
  {
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_obscureAllText");

  }
}

- (BOOL)_blurEnabled
{
  return (*((unsigned __int8 *)&self->_textFieldFlags + 2) >> 6) & 1;
}

- (void)_setBlurEnabled:(BOOL)a3
{
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags;
  uint64_t v4;

  textFieldFlags = self->_textFieldFlags;
  if (((((*(_QWORD *)&textFieldFlags & 0x400000) == 0) ^ a3) & 1) == 0)
  {
    v4 = 0x400000;
    if (!a3)
      v4 = 0;
    self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&textFieldFlags & 0xFFFFFFFFFFBFFFFFLL | v4);
  }
}

- (BOOL)_visualEffectViewEnabled
{
  return *((unsigned __int8 *)&self->_textFieldFlags + 2) >> 7;
}

- (void)_setVisualEffectViewEnabled:(BOOL)a3 backgroundColor:(id)a4
{
  uint64_t v4;

  v4 = 0x800000;
  if (!a3)
    v4 = 0;
  self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFFFFFFF7FFFFFLL | v4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITextField;
  -[UITextField observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5, a6);
}

- (void)setSelectionRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v5;

  length = a3.length;
  location = a3.location;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelection:", location, length);

}

- (void)setIcon:(id)a3
{
  id v4;
  void *v5;
  UIImageView *iconView;
  UIImageView *v7;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;
  void *v11;
  UIImageView *v12;
  id v13;

  v13 = a3;
  -[UIImageView image](self->_iconView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v13;
  if (v4 != v13)
  {
    iconView = self->_iconView;
    if (v13)
    {
      if (iconView)
      {
        -[UIImageView setImage:](iconView, "setImage:");
        -[UIView sizeToFit](self->_iconView, "sizeToFit");
      }
      else
      {
        v8 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v13);
        v9 = self->_iconView;
        self->_iconView = v8;

        -[UITextField _contentView](self, "_contentView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addSubview:", self->_iconView);

        -[UITextField _contentView](self, "_contentView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bringSubviewToFront:", self->_iconView);

      }
      v12 = self->_iconView;
      -[UITextField iconRect](self, "iconRect");
      -[UIImageView setFrame:](v12, "setFrame:");
    }
    else
    {
      -[UIView removeFromSuperview](iconView, "removeFromSuperview");
      v7 = self->_iconView;
      self->_iconView = 0;

    }
    -[UITextField setNeedsLayout](self, "setNeedsLayout");
    v5 = v13;
  }

}

- (void)setBecomesFirstResponderOnClearButtonTap:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (CGRect)iconRect
{
  UIImageView *iconView;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  iconView = self->_iconView;
  if (iconView)
  {
    -[UIView size](iconView, "size");
    v4 = v3;
    v6 = v5;
    v7 = 0.0;
    v8 = 0.0;
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v6;
  result.size.width = v4;
  result.origin.y = v7;
  result.origin.x = v8;
  return result;
}

- (void)setProgress:(float)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_UITextFieldBackgroundProvider setProgress:](self->_backgroundProvider, "setProgress:", a3);
}

- (void)setLabelOffset:(float)a3
{
  UILabel *label;
  double v6;
  double v7;

  label = self->_label;
  if (label)
  {
    -[UIView frame](label, "frame");
    v7 = v6 - self->_labelOffset;
    self->_labelOffset = a3;
    -[UILabel setFrame:](self->_label, "setFrame:", v7 + a3);
  }
  else
  {
    self->_labelOffset = a3;
  }
}

- (id)textLabel
{
  -[UIView sizeToFit](self->_label, "sizeToFit");
  return self->_label;
}

- (void)setLabel:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  UILabel *label;
  UILabel *v10;
  UILabel *v11;
  void *v12;
  void *v13;
  void *v14;
  _UICascadingTextStorage *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  id v20;

  v20 = a3;
  -[UILabel text](self->_label, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length") && !objc_msgSend(v20, "length"))
  {

LABEL_14:
    v7 = v20;
    goto LABEL_15;
  }
  -[UILabel text](self->_label, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v20);

  v7 = v20;
  if ((v6 & 1) == 0)
  {
    v8 = objc_msgSend(v20, "length");
    label = self->_label;
    if (v8)
    {
      if (!label)
      {
        v10 = objc_alloc_init(UILabel);
        v11 = self->_label;
        self->_label = v10;

        -[UITextField _contentView](self, "_contentView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addSubview:", self->_label);

        -[UILabel setEnabled:](self->_label, "setEnabled:", 0);
        -[UIView setOpaque:](self->_label, "setOpaque:", 0);
        -[UIView setBackgroundColor:](self->_label, "setBackgroundColor:", 0);
        -[UITextField _cuiCatalog](self, "_cuiCatalog");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel _setCuiCatalog:](self->_label, "_setCuiCatalog:", v13);

        -[UITextField _cuiStyleEffectConfiguration](self, "_cuiStyleEffectConfiguration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel _setCuiStyleEffectConfiguration:](self->_label, "_setCuiStyleEffectConfiguration:", v14);

        v15 = self->_textStorage;
        -[_UICascadingTextStorage font](v15, "font");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = self->_label;
          -[_UICascadingTextStorage font](v15, "font");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setFont:](v17, "setFont:", v18);

        }
        label = self->_label;
      }
      -[UILabel setText:](label, "setText:", v20);
      -[UIView sizeToFit](self->_label, "sizeToFit");
    }
    else if (label)
    {
      -[UIView removeFromSuperview](label, "removeFromSuperview");
      v19 = self->_label;
      self->_label = 0;

    }
    -[UITextField setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_14;
  }
LABEL_15:

}

- (void)setTextCentersHorizontally:(BOOL)a3
{
  -[UITextField setTextAlignment:](self, "setTextAlignment:", a3);
}

- (void)setTextCentersVertically:(BOOL)a3
{
  if (((((*(_QWORD *)&self->_textFieldFlags & 1) == 0) ^ a3) & 1) == 0)
  {
    self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFFFFFFFFFFFFELL | a3);
    -[UITextField _setNeedsStyleRecalc](self, "_setNeedsStyleRecalc");
  }
}

- (void)setUndoEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (a3)
    v3 = 0;
  self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)isUndoEnabled
{
  return (*((_BYTE *)&self->_textFieldFlags + 1) & 0x10) == 0 && -[UITextField isEditing](self, "isEditing");
}

- (void)_clearButtonClicked:(id)a3
{
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags;
  void *v5;
  id v6;
  uint64_t v7;
  $53C8F00389CE9BE12F0B2EE980283837 v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (-[UITextField _delegateShouldClear](self, "_delegateShouldClear"))
  {
    textFieldFlags = self->_textFieldFlags;
    if ((*(_WORD *)&textFieldFlags & 0x100) != 0)
    {
      v6 = -[UITextField _fieldEditor](self, "_fieldEditor");
      objc_msgSend(v6, "selectionRange");
      if (v7)
        objc_msgSend(v6, "setSelection:", 0, 0);
      objc_msgSend(v6, "clearText");
      v8 = self->_textFieldFlags;
      self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(unint64_t *)&v8 | 0x8000);
      -[UITextField fieldEditorDidChange:](self, "fieldEditorDidChange:", v6);
      self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFFFFFFFFF7FFFLL | (((*(unint64_t *)&v8 >> 15) & 1) << 15));
    }
    else
    {
      self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&textFieldFlags | 0x800000000);
      -[UITextField setText:](self, "setText:", &stru_1E16EDF20);
      *(_QWORD *)&self->_textFieldFlags &= ~0x800000000uLL;
      -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", 0x20000, 0);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:", CFSTR("UITextFieldTextDidChangeNotification"), self);

    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textChanged:", 0);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didClearText");

    if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "resetDictation");

    }
    -[UITextField setClearsOnInsertion:](self, "setClearsOnInsertion:", 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "textFieldDidClear:", self);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "textFieldClearButtonPressed:", self);
    }
    if ((*(_QWORD *)&self->_textFieldFlags & 0x120) == 0x20)
      -[UITextField becomeFirstResponder](self, "becomeFirstResponder");
  }

}

- (void)setClearButtonOffset:(CGSize)a3
{
  if (self->_clearButtonOffset.width != a3.width || self->_clearButtonOffset.height != a3.height)
  {
    self->_clearButtonOffset = a3;
    -[UITextField setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)undoManager
{
  void *v3;
  void *v4;

  if (-[UITextField isUndoEnabled](self, "isUndoEnabled"))
  {
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "undoManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)_textShouldUseVibrancy
{
  return self->_tvUseVibrancy;
}

- (id)_currentTextColor
{
  return -[_UICascadingTextStorage textColor](self->_textStorage, "textColor");
}

- (BOOL)_hasFloatingFieldEditor
{
  UITextField *v2;
  void *v3;

  v2 = self;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "isDescendantOfView:", v2) ^ 1;

  return (char)v2;
}

- (BOOL)_inVibrantContentView
{
  void *v3;
  void *v4;
  char v5;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView contentView](self->_contentBackdropView, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isDescendantOfView:", v4);

  return v5;
}

- (double)_fieldEditorHeight
{
  void *v2;
  double v3;
  double v4;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = round(v3 * 0.6857);

  return v4;
}

- (BOOL)_textShouldFillFieldEditorHeight
{
  return 1;
}

- (BOOL)_shouldOverrideEditingFont
{
  return 1;
}

- (id)_textStorageTextColor
{
  return -[_UICascadingTextStorage textColor](self->_textStorage, "textColor");
}

- (BOOL)_uiktest_shouldDisableTextColorUpdateOnTraitCollectionChange
{
  return self->_disableTextColorUpdateOnTraitCollectionChange;
}

- (BOOL)_uiktest_tvUseVibrancy
{
  return self->_tvUseVibrancy;
}

- (id)_uiktest_placeholderLabelColor
{
  void *v2;
  void *v3;

  -[UITextField _placeholderLabel](self, "_placeholderLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_uiktest_tvCustomTextColor
{
  return self->_tvCustomTextColor;
}

- (void)beginSelectionChange
{
  id v2;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginSelectionChange");

}

- (void)endSelectionChange
{
  id v2;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endSelectionChange");

}

- (BOOL)hasSelection
{
  void *v2;
  uint64_t v3;
  BOOL v4;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionRange");
  v4 = v3 != 0;

  return v4;
}

- (void)startAutoscroll:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  y = a3.y;
  x = a3.x;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField textInputView](self, "textInputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:fromView:", v7, x, y);
  v9 = v8;
  v11 = v10;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startAutoscroll:", v9, v11);

}

- (void)cancelAutoscroll
{
  id v2;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAutoscroll");

}

- (BOOL)_restoreFirstResponder
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 8) != 0)
    return 0;
  -[UITextField interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "checkEditabilityAndSetFirstResponderIfNecessary");
    v5 = -[UIView isFirstResponder](self, "isFirstResponder");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITextField;
    v5 = -[UIResponder _restoreFirstResponder](&v8, sel__restoreFirstResponder);
  }
  v6 = v5;

  return v6;
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[UITextField interactionAssistant](self, "interactionAssistant");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginFloatingCursorAtPoint:", x, y);

}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[UITextField interactionAssistant](self, "interactionAssistant");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateFloatingCursorAtPoint:", x, y);

}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  id v7;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[UITextField interactionAssistant](self, "interactionAssistant");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateFloatingCursorAtPoint:animated:", v4, x, y);

}

- (void)endFloatingCursor
{
  id v2;

  -[UITextField interactionAssistant](self, "interactionAssistant");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endFloatingCursor");

}

- (id)selectedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInRange:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UITextField _shouldObscureInput](self, "_shouldObscureInput");
  v8 = v6;
  v9 = v8;
  if (v8 && v7)
    v10 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "_newZStringWithString:", v8);
  else
    v10 = v8;
  v11 = v10;

  return v11;
}

- (id)selectedAttributedText
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  -[UITextField attributedText](self, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UITextField selectionRange](self, "selectionRange");
  objc_msgSend(v3, "attributedSubstringFromRange:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_activityItemsConfigurationAtLocation:(CGPoint)a3
{
  UIActivityItemsConfiguration *v4;
  void *v5;
  void *v6;
  UIActivityItemsConfiguration *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = [UIActivityItemsConfiguration alloc];
  -[UITextField selectedText](self, "selectedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIActivityItemsConfiguration initWithObjects:](v4, "initWithObjects:", v6);

  return v7;
}

- (CGRect)closestCaretRectInMarkedTextRangeForPoint:(CGPoint)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (unint64_t)offsetInMarkedTextForSelection:(id)a3
{
  return 0;
}

- (CGPoint)constrainedPoint:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)webView
{
  return 0;
}

- (id)_proxyTextInput
{
  if (self->_fieldEditor)
    self = (UITextField *)self->_fieldEditor;
  return self;
}

- (void)cut:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[UITextField keyboardInputShouldDelete:](self, "keyboardInputShouldDelete:", self))
  {
    -[UITextField _inputController](self, "_inputController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cut:", v5);

  }
}

- (void)copy:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UITextField _inputController](self, "_inputController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "copy:", v4);

  -[UITextField interactionAssistant](self, "interactionAssistant");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hideSelectionCommands");

}

- (void)_define:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _inputController](self, "_inputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_define:", v4);

}

- (void)_translate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _inputController](self, "_inputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_translate:", v4);

}

- (void)_share:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _inputController](self, "_inputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_share:", v4);

}

- (BOOL)_isDisplayingTextService
{
  void *v2;
  char v3;

  -[UITextField _inputController](self, "_inputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isDisplayingTextService");

  return v3;
}

- (BOOL)_isDisplayingShortcutViewController
{
  void *v2;
  char v3;

  -[UITextField _inputController](self, "_inputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isDisplayingShortcutViewController");

  return v3;
}

- (BOOL)_isDisplayingReferenceLibraryViewController
{
  void *v2;
  char v3;

  -[UITextField _inputController](self, "_inputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isDisplayingReferenceLibraryViewController");

  return v3;
}

- (BOOL)_isDisplayingShareViewController
{
  void *v2;
  char v3;

  -[UITextField _inputController](self, "_inputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isDisplayingShareViewController");

  return v3;
}

- (BOOL)_isDisplayingLookupViewController
{
  void *v2;
  char v3;

  -[UITextField _inputController](self, "_inputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isDisplayingLookupViewController");

  return v3;
}

- (void)_selectionMayChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _inputController](self, "_inputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_selectionMayChange:", v4);

}

- (void)_setBackgroundStrokeColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _systemBackgroundView](self, "_systemBackgroundView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStrokeColor:", v4);

}

- (id)_backgroundStrokeColor
{
  void *v2;
  void *v3;

  -[UITextField _systemBackgroundView](self, "_systemBackgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "strokeColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setBackgroundFillColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _systemBackgroundView](self, "_systemBackgroundView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFillColor:", v4);

}

- (id)_backgroundFillColor
{
  void *v2;
  void *v3;

  -[UITextField _systemBackgroundView](self, "_systemBackgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fillColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setBackgroundStrokeWidth:(double)a3
{
  id v4;

  -[UITextField _systemBackgroundView](self, "_systemBackgroundView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineWidth:", a3);

}

- (double)_backgroundStrokeWidth
{
  void *v2;
  double v3;
  double v4;

  -[UITextField _systemBackgroundView](self, "_systemBackgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineWidth");
  v4 = v3;

  return v4;
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  _UICascadingTextStorage *textStorage;
  id v8;
  id v9;

  length = a4.length;
  location = a4.location;
  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
  {
    v8 = a3;
    -[UITextField _inputController](self, "_inputController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributes:range:", v8, location, length);

  }
  else
  {
    textStorage = self->_textStorage;
    v9 = a3;
    -[NSConcreteTextStorage setAttributes:range:](textStorage, "setAttributes:range:");
  }

}

- (void)_insertAttributedTextWithoutClosingTyping:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _inputController](self, "_inputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_insertAttributedTextWithoutClosingTyping:", v4);

}

- (void)_addShortcut:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _inputController](self, "_inputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_addShortcut:", v4);

}

- (void)paste:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
  {
    v4 = a3;
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_clearOnEditIfNeeded");

    -[UITextField _inputController](self, "_inputController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paste:", v4);

  }
}

- (void)pasteAndMatchStyle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
  {
    v4 = a3;
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_clearOnEditIfNeeded");

    -[UITextField _inputController](self, "_inputController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pasteAndMatchStyle:", v4);

  }
}

- (id)_effectivePasteConfiguration
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UITextField;
  -[UIResponder _effectivePasteConfiguration](&v8, sel__effectivePasteConfiguration);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UITextField _implicitPasteConfigurationClasses](self, "_implicitPasteConfigurationClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIPasteConfiguration _pasteConfigurationForAcceptingClasses:](UIPasteConfiguration, "_pasteConfigurationForAcceptingClasses:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_implicitPasteConfigurationClasses
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!-[UITextField isEditable](self, "isEditable"))
    return MEMORY[0x1E0C9AA60];
  v3 = -[UITextField allowsEditingTextAttributes](self, "allowsEditingTextAttributes");
  v4 = objc_opt_class();
  if (v3)
  {
    v11 = v4;
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v11;
    v7 = 3;
  }
  else
  {
    v9 = v4;
    v10 = objc_opt_class();
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v9;
    v7 = 2;
  }
  objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v9, v10, v11, v12, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)pasteItemProviders:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if ((*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
  {
    v4 = a3;
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_clearOnEditIfNeeded");

    -[UITextField _inputController](self, "_inputController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pasteItemProviders:", v4);

  }
}

+ (Class)_textPasteItemClass
{
  return (Class)objc_opt_class();
}

- (void)_pasteSessionDidFinish:(id)a3
{
  if (-[UITextField _shouldObscureInput](self, "_shouldObscureInput", a3))
  {
    -[UITextField _forceObscureAllText](self, "_forceObscureAllText");
    -[UITextField setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)select:(id)a3
{
  id v3;

  -[UITextField interactionAssistant](self, "interactionAssistant", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectWord");

}

- (void)selectAll:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField interactionAssistant](self, "interactionAssistant");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectAll:", v4);

}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _inputController](self, "_inputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeTextWritingDirectionRightToLeft:", v4);

}

- (void)makeTextWritingDirectionNatural:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _inputController](self, "_inputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeTextWritingDirectionNatural:", v4);

}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _inputController](self, "_inputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeTextWritingDirectionLeftToRight:", v4);

}

- (void)toggleBoldface:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _inputController](self, "_inputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toggleBoldface:", v4);

}

- (void)toggleItalics:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _inputController](self, "_inputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toggleItalics:", v4);

}

- (void)toggleUnderline:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _inputController](self, "_inputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toggleUnderline:", v4);

}

- (void)increaseSize:(id)a3
{
  id v4;

  -[UITextField _inputController](self, "_inputController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "increaseSize:", self);

}

- (void)decreaseSize:(id)a3
{
  id v4;

  -[UITextField _inputController](self, "_inputController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decreaseSize:", self);

}

- (void)replace:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _inputController](self, "_inputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "replace:", v4);

}

- (void)_promptForReplace:(id)a3
{
  id v3;

  -[UITextField interactionAssistant](self, "interactionAssistant", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleReplacements");

}

- (void)_transliterateChinese:(id)a3
{
  id v3;

  -[UITextField interactionAssistant](self, "interactionAssistant", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleChineseTransliteration");

}

- (void)captureTextFromCamera:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _inputController](self, "_inputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "captureTextFromCamera:", v4);

}

- (void)validateCommand:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _inputController](self, "_inputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateCommand:", v4);

}

- (BOOL)_inPopover
{
  uint64_t v2;
  void *v3;
  char isKindOfClass;
  uint64_t v5;

  -[UIView superview](self, "superview");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    do
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        break;
      objc_msgSend(v3, "superview");
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v5;
    }
    while (v5);

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)insertAttributedText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertAttributedText:", v4);

}

- (id)attributedTextInRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedTextInRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replaceRange:withText:", v7, v6);

}

- (void)replaceRange:(id)a3 withAttributedText:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replaceRange:withAttributedText:", v7, v6);

}

- (void)replaceRangeWithTextWithoutClosingTyping:(id)a3 replacementText:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replaceRangeWithTextWithoutClosingTyping:replacementText:", v7, v6);

}

- (void)setSelectedTextRange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedTextRange:", v4);

}

- (id)_rangeForTextKitRanges:(id)a3
{
  return (id)-[_UITextLayoutController textRangeForTextKit2Ranges:](self->_textLayoutController, "textRangeForTextKit2Ranges:", a3);
}

- (NSDictionary)markedTextStyle
{
  return -[UIFieldEditor markedTextStyle](self->_fieldEditor, "markedTextStyle");
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  id v8;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMarkedText:selectedRange:", v7, location, length);

}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  id v8;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributedMarkedText:selectedRange:", v7, location, length);

}

- (void)unmarkText
{
  -[UIFieldEditor unmarkText](self->_fieldEditor, "unmarkText");
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "positionFromPosition:inDirection:offset:", v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "positionWithinRange:farthestInDirection:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "characterRangeByExtendingPosition:inDirection:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_visualSelectionRangeForExtent:(id)a3 forPoint:(CGPoint)a4 fromPosition:(id)a5 inDirection:(int64_t)a6
{
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;

  y = a4.y;
  x = a4.x;
  v11 = a5;
  v12 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_visualSelectionRangeForExtent:forPoint:fromPosition:inDirection:", v12, v11, a6, x, y);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;

  v6 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "baseWritingDirectionForPosition:inDirection:", v6, a4);

  return v8;
}

- (CGRect)firstRectForRange:(id)a3
{
  id v4;
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

  v4 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstRectForRange:", v4);
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

- (id)closestPositionToPoint:(CGPoint)a3
{
  double x;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double MidY;
  void *v15;
  void *v16;
  CGRect v18;

  x = a3.x;
  -[_UITextLayoutController beginningOfDocument](self->_textLayoutController, "beginningOfDocument", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField caretRectForPosition:](self, "caretRectForPosition:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v18.origin.x = v7;
  v18.origin.y = v9;
  v18.size.width = v11;
  v18.size.height = v13;
  MidY = CGRectGetMidY(v18);
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "closestPositionToPoint:", x, MidY);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double x;
  _UITextLayoutController *textLayoutController;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double MidY;
  void *v18;
  void *v19;
  CGRect v21;

  x = a3.x;
  textLayoutController = self->_textLayoutController;
  v7 = a4;
  -[_UITextLayoutController beginningOfDocument](textLayoutController, "beginningOfDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField caretRectForPosition:](self, "caretRectForPosition:", v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v21.origin.x = v10;
  v21.origin.y = v12;
  v21.size.width = v14;
  v21.size.height = v16;
  MidY = CGRectGetMidY(v21);
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "closestPositionToPoint:withinRange:", v7, x, MidY);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)_setCursorAccessories:(id)a3
{
  UITextInteractionAssistant *interactionAssistant;
  id v4;
  void *v5;
  id v6;

  interactionAssistant = self->_interactionAssistant;
  v4 = a3;
  -[UITextInteractionAssistant _selectionViewManager](interactionAssistant, "_selectionViewManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cursorAccessoryViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessories:", v4);

}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;

  y = a3.y;
  x = a3.x;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "characterRangeAtPoint:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(a3, "singleLineResult");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "phrases");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "dictationPhraseArray");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextField insertDictationResult:](self, "insertDictationResult:", v9);
    }
    else
    {
      -[UITextField _fieldEditor](self, "_fieldEditor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertDictationResult:withCorrectionIdentifier:", v10, v6);
    }

  }
}

- (id)insertTextPlaceholderWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;

  height = a3.height;
  width = a3.width;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertTextPlaceholderWithSize:", width, height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeTextPlaceholder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTextPlaceholder:", v4);

}

- (id)insertDictationResultPlaceholder
{
  void *v2;
  void *v3;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertDictationResultPlaceholder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)frameForDictationResultPlaceholder:(id)a3
{
  id v4;
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

  v4 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frameForDictationResultPlaceholder:", v4);
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

- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeDictationResultPlaceholder:willInsertResult:", v6, v4);

}

- (void)_setForceDisplayOverridePlaceholder:(BOOL)a3
{
  self->_forceDisplayOverridePlaceholder = a3;
  -[UITextField setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_forceDisplayOverridePlaceholder
{
  return self->_forceDisplayOverridePlaceholder;
}

- (void)_setOverridePlaceholder:(id)a3 alignment:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSAttributedString *v11;
  int64_t overriddenPlaceholderAlignment;
  void *v13;
  NSAttributedString *overriddenPlaceholder;
  char v15;
  UITextFieldLabel *placeholderLabel;
  uint64_t v17;
  NSAttributedString *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;

  v6 = a3;
  v7 = v6;
  if (self->_overriddenPlaceholder)
  {
    v22 = v6;
    if (v6)
    {
      -[UITextField _setAttributedPlaceholder:](self, "_setAttributedPlaceholder:", v6);
      -[UITextField _placeholderLabel](self, "_placeholderLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTextAlignment:", a4);

LABEL_13:
      v7 = v22;
      goto LABEL_14;
    }
    -[UITextField _setAttributedPlaceholder:](self, "_setAttributedPlaceholder:");
    overriddenPlaceholderAlignment = self->_overriddenPlaceholderAlignment;
    -[UITextField _placeholderLabel](self, "_placeholderLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextAlignment:", overriddenPlaceholderAlignment);

    overriddenPlaceholder = self->_overriddenPlaceholder;
    self->_overriddenPlaceholder = 0;

    v15 = objc_opt_respondsToSelector();
    v7 = 0;
    if ((v15 & 1) != 0)
    {
      placeholderLabel = self->_placeholderLabel;
      v17 = 0;
LABEL_12:
      -[UITextFieldLabel setShouldRenderWithoutTextField:](placeholderLabel, "setShouldRenderWithoutTextField:", v17);
      goto LABEL_13;
    }
  }
  else if (v6)
  {
    v22 = v6;
    -[UITextField attributedPlaceholder](self, "attributedPlaceholder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = v9
        ? (NSAttributedString *)v9
        : (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E16EDF20);
    v18 = self->_overriddenPlaceholder;
    self->_overriddenPlaceholder = v11;

    -[UITextField _placeholderLabel](self, "_placeholderLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    self->_overriddenPlaceholderAlignment = objc_msgSend(v19, "textAlignment");

    -[UITextField _setAttributedPlaceholder:](self, "_setAttributedPlaceholder:", v22);
    -[UITextField _placeholderLabel](self, "_placeholderLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTextAlignment:", a4);

    v21 = objc_opt_respondsToSelector();
    v7 = v22;
    if ((v21 & 1) != 0)
    {
      placeholderLabel = self->_placeholderLabel;
      v17 = 1;
      goto LABEL_12;
    }
  }
LABEL_14:

}

- (id)rangeWithTextAlternatives:(id *)a3 atPosition:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v6 = a4;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rangeWithTextAlternatives:atPosition:", a3, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_shouldResignOnEditingDidEndOnExit
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && -[UIControl _hasActionForEventMask:](self, "_hasActionForEventMask:", 0x80000);
}

- (BOOL)_shouldDisplayDictationPlaceholderMessage
{
  return *((unsigned __int8 *)&self->_textFieldFlags + 4) >> 7;
}

- (void)_setShouldDisplayDictationPlaceholderMessage:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (_NSRange)_rangeForClearButton
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[NSConcreteTextStorage length](self->_textStorage, "length");
  v3 = 0;
  result.length = v2;
  result.location = v3;
  return result;
}

- (_NSRange)_textRangeForTextStorageRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  result.length = length;
  result.location = location;
  return result;
}

- (BOOL)_delegateShouldClear
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "textFieldShouldClear:", self);
  else
    v4 = 1;

  return v4;
}

- (BOOL)_delegateShouldChangeCharactersInTextStorageRange:(_NSRange)a3 replacementString:(id)a4 delegateCares:(BOOL *)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v11 = -[UITextField _textRangeForTextStorageRange:](self, "_textRangeForTextStorageRange:", location, length);
  v13 = v12;
  v14 = objc_opt_respondsToSelector();
  if ((v14 & 1) != 0)
  {
    v15 = objc_msgSend(WeakRetained, "textField:shouldChangeCharactersInRange:replacementString:", self, v11, v13, v9);
    if (!a5)
      goto LABEL_6;
    goto LABEL_5;
  }
  v15 = 1;
  if (a5)
LABEL_5:
    *a5 = v14 & 1;
LABEL_6:

  return v15;
}

- (void)insertText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertText:", v4);

}

- (void)insertText:(id)a3 alternatives:(id)a4 style:(int64_t)a5
{
  id v6;

  objc_msgSend(off_1E1679D20, "attributedText:withAlternativeTexts:style:", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextField insertAttributedText:](self, "insertAttributedText:", v6);

}

- (void)insertText:(id)a3 style:(int64_t)a4 alternatives:(id)a5
{
  -[UITextField insertText:alternatives:style:](self, "insertText:alternatives:style:", a3, a5, a4);
}

- (void)addTextAlternatives:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextField _inputController](self, "_inputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTextAlternatives:", v4);

}

- (void)removeEmojiAlternatives
{
  id v2;

  -[UITextField _inputController](self, "_inputController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeEmojiAlternatives");

}

- (_NSRange)insertFilteredText:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v4 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "insertFilteredText:", v4);
    v8 = v7;
  }
  else
  {
    objc_msgSend(v5, "insertText:", v4);
    v8 = objc_msgSend(v4, "length");
    v6 = 0;
  }

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (void)deleteBackward
{
  id v2;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteBackward");

}

- (void)_deleteBackwardAndNotify:(BOOL)a3
{
  id v3;

  if (a3)
  {
    -[UITextField deleteBackward](self, "deleteBackward");
  }
  else
  {
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_deleteBackwardAndNotify:", 0);

  }
}

- (unint64_t)_textLengthToDeleteBeforeSelectedRangeForSmartDelete
{
  void *v2;
  unint64_t v3;

  -[UITextField _inputController](self, "_inputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "textLengthToDeleteBeforeSelectedRangeForSmartDelete");

  return v3;
}

- (double)_preferredBackgroundCornerRadius
{
  return self->_preferredBackgroundCornerRadius;
}

- (int64_t)_blurEffectStyleForAppearance
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;

  +[UISystemInputViewController _canonicalTraitsForResponder:](UISystemInputViewController, "_canonicalTraitsForResponder:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyboardAppearance");
  v4 = 4016;
  v5 = 4012;
  if (v3 == 1)
    v5 = 4013;
  if (v3 != 9)
    v4 = v5;
  if (v3 == 10)
    v6 = 5006;
  else
    v6 = v4;

  return v6;
}

- (BOOL)_shouldDetermineInterfaceStyleTextColor
{
  return 1;
}

- (void)_tvUpdateTextColor
{
  UIColor *tvCustomFocusedTextColor;
  UIColor *v4;
  UIColor *tvCustomTextColor;
  UIColor *v6;
  UIColor *v7;
  id v8;

  if (-[UITextField _fieldEditorAttached](self, "_fieldEditorAttached"))
  {
    -[_UITextFieldVisualStyle defaultTextColorForKeyboardAppearance](self->_visualStyle, "defaultTextColorForKeyboardAppearance");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[UITextField _setTextColor:](self, "_setTextColor:", v8);

  }
  else
  {
    if (-[UIView isFocused](self, "isFocused"))
    {
      tvCustomFocusedTextColor = self->_tvCustomFocusedTextColor;
      if (tvCustomFocusedTextColor)
      {
        v4 = tvCustomFocusedTextColor;
      }
      else
      {
        -[_UITextFieldVisualStyle defaultFocusedTextColor](self->_visualStyle, "defaultFocusedTextColor");
        v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
      }
      v7 = v4;
      -[_UICascadingTextStorage setTextColor:](self->_textStorage, "setTextColor:", v4);
      self->_tvUseVibrancy = 0;
    }
    else
    {
      tvCustomTextColor = self->_tvCustomTextColor;
      if (tvCustomTextColor)
      {
        v6 = tvCustomTextColor;
      }
      else
      {
        -[_UITextFieldVisualStyle defaultTextColor](self->_visualStyle, "defaultTextColor");
        v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
      }
      v7 = v6;
      -[_UICascadingTextStorage setTextColor:](self->_textStorage, "setTextColor:", v6);
      self->_tvUseVibrancy = self->_tvCustomTextColor == 0;
    }

    -[UITextField _updateLabelAppearance](self, "_updateLabelAppearance");
  }
}

- (id)_contentBackdropView
{
  return self->_contentBackdropView;
}

- (int64_t)_blurEffectStyle
{
  if ((dyld_program_sdk_at_least() & 1) != 0)
    return 5006;
  else
    return -[UITextField _blurEffectStyleForAppearance](self, "_blurEffectStyleForAppearance");
}

- (id)obtainSelectionGrabberSuppressionAssertion
{
  void *v2;
  void *v3;

  -[UITextField interactionAssistant](self, "interactionAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "obtainSelectionGrabberSuppressionAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_allowAssistanceInSubtree
{
  return 0;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  unsigned int (**v12)(void *, UIView *);
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  UITextField *v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __65__UITextField_pointerInteraction_regionForRequest_defaultRegion___block_invoke;
  v20 = &unk_1E16E6488;
  v11 = v9;
  v21 = v11;
  v22 = self;
  v12 = (unsigned int (**)(void *, UIView *))_Block_copy(&v17);
  if (-[UITextField _showsLeftView](self, "_showsLeftView", v17, v18, v19, v20) && v12[2](v12, self->_leftView))
  {
    -[UIView frame](self->_leftView, "frame");
    v13 = CFSTR("_UITextFieldLeftViewRegion");
  }
  else
  {
    if (!-[UITextField _showsRightView](self, "_showsRightView") || !v12[2](v12, self->_rightView))
    {
      -[UITextField interactionAssistant](self, "interactionAssistant");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pointerInteraction:regionForRequest:defaultRegion:", v8, v11, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    -[UIView frame](self->_rightView, "frame");
    v13 = CFSTR("_UITextFieldRightViewRegion");
  }
  +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v14;
}

uint64_t __65__UITextField_pointerInteraction_regionForRequest_defaultRegion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  uint64_t v15;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  CGPoint v22;
  CGRect v23;

  v3 = a2;
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "location");
  v22.x = v12;
  v22.y = v13;
  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  if (CGRectContainsPoint(v23, v22)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(v3, "alpha"), v14 + 0.0001 >= 0.0)
    && (objc_msgSend(v3, "isHidden") & 1) == 0)
  {
    objc_msgSend(v3, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(void **)(a1 + 40);
    v19 = v17;
    v20 = v18;
    v21 = v20;
    if (v19 == v20)
    {
      v15 = 1;
    }
    else
    {
      v15 = 0;
      if (v19 && v20)
        v15 = objc_msgSend(v19, "isEqual:", v20);
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  int *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  char v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("_UITextFieldLeftViewRegion"));

  if ((v9 & 1) != 0)
  {
    v10 = &OBJC_IVAR___UITextField__leftView;
  }
  else
  {
    objc_msgSend(v7, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", CFSTR("_UITextFieldRightViewRegion"));

    if (!v12)
    {
LABEL_8:
      -[UITextField interactionAssistant](self, "interactionAssistant");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pointerInteraction:styleForRegion:", v6, v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    v10 = &OBJC_IVAR___UITextField__rightView;
  }
  v13 = *(id *)((char *)&self->super.super.super.super.isa + *v10);
  if (!v13)
    goto LABEL_8;
  v14 = v13;
  objc_msgSend(v13, "_pointerEffect");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isMemberOfClass:", objc_opt_class()))
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __49__UITextField_pointerInteraction_styleForRegion___block_invoke;
    v21[3] = &unk_1E16E64B0;
    v21[4] = self;
    v22 = v14;
    v23 = v9 ^ 1;
    objc_msgSend(v22, "_shapeInContainer:proposal:", self, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v14, "_shapeInContainer:", self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "pointerStyleProvider");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (!v18
    || ((*(void (**)(uint64_t, void *, void *, void *))(v18 + 16))(v18, v14, v15, v16),
        (v17 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_14:
  return v17;
}

id __49__UITextField_pointerInteraction_styleForRegion___block_invoke(uint64_t a1)
{
  CGFloat x;
  double y;
  CGFloat width;
  double height;
  void *v6;
  double MidX;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat MaxX;
  double v13;
  double v14;
  double v15;
  CGFloat MinX;
  double v17;
  double v18;
  double v19;
  void *v20;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v23 = CGRectInset(v22, 2.0, 2.0);
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_visualBounds");
  objc_msgSend(v6, "convertRect:fromView:", *(_QWORD *)(a1 + 40));
  MidX = CGRectGetMidX(v24);
  v8 = x;
  v9 = y;
  v10 = width;
  v11 = height;
  if (*(_BYTE *)(a1 + 48))
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v8);
    v13 = MaxX - MidX + MaxX - MidX;
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v14 = CGRectGetMaxX(v25);
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = v13;
    v26.size.height = height;
    v15 = v14 - CGRectGetWidth(v26);
  }
  else
  {
    MinX = CGRectGetMinX(*(CGRect *)&v8);
    v13 = MidX - MinX + MidX - MinX;
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v15 = CGRectGetMinX(v27);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "borderStyle") == 3)
  {
    v17 = *(double *)(*(_QWORD *)(a1 + 32) + 936) + -2.0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_cornerRadius");
    if (v18 <= 0.0)
    {
      +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v15, y, v13, height);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      return v20;
    }
    objc_msgSend(*(id *)(a1 + 32), "_cornerRadius");
    v17 = v19 + -2.0;
  }
  +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v15, y, v13, height, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  return v20;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[UITextField interactionAssistant](self, "interactionAssistant");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pointerInteraction:willEnterRegion:animator:", v10, v9, v8);

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[UITextField interactionAssistant](self, "interactionAssistant");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pointerInteraction:willExitRegion:animator:", v10, v9, v8);

}

- (void)addGhostedRange:(id)a3
{
  -[_UITextLayoutController addGhostedRange:](self->_textLayoutController, "addGhostedRange:", a3);
}

- (void)removeAllGhostedRanges
{
  -[_UITextLayoutController removeAllGhostedRanges](self->_textLayoutController, "removeAllGhostedRanges");
}

- (void)addInvisibleRange:(id)a3
{
  -[_UITextLayoutController addInvisibleRange:](self->_textLayoutController, "addInvisibleRange:", a3);
}

- (void)removeInvisibleRange:(id)a3
{
  -[_UITextLayoutController removeInvisibleRange:](self->_textLayoutController, "removeInvisibleRange:", a3);
}

- (UIDragInteraction)textDragInteraction
{
  UITextDragDropSupport *textDragDropSupport;
  UITextDragDropSupport *v4;
  UITextDragDropSupport *v5;
  UITextDragDropSupport *v6;
  void *v7;
  void *v8;
  void *v9;

  textDragDropSupport = self->_textDragDropSupport;
  if (textDragDropSupport)
  {
    v4 = textDragDropSupport;
  }
  else
  {
    +[UITextDragDropSupport installTextDragDropOnView:](UITextDragDropSupport, "installTextDragDropOnView:", self);
    v5 = (UITextDragDropSupport *)objc_claimAutoreleasedReturnValue();
    v6 = self->_textDragDropSupport;
    self->_textDragDropSupport = v5;

    v4 = self->_textDragDropSupport;
    if (!v4)
    {
      v9 = 0;
      return (UIDragInteraction *)v9;
    }
  }
  -[UIView interactions](self, "interactions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextDragDropSupport dragInteraction](v4, "dragInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "indexOfObject:", v8) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    -[UITextDragDropSupport dragInteraction](v4, "dragInteraction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIDragInteraction *)v9;
}

- (UIDropInteraction)textDropInteraction
{
  UITextDragDropSupport *textDragDropSupport;
  UITextDragDropSupport *v4;
  UITextDragDropSupport *v5;
  UITextDragDropSupport *v6;
  void *v7;
  void *v8;
  void *v9;

  textDragDropSupport = self->_textDragDropSupport;
  if (textDragDropSupport)
  {
    v4 = textDragDropSupport;
  }
  else
  {
    +[UITextDragDropSupport installTextDragDropOnView:](UITextDragDropSupport, "installTextDragDropOnView:", self);
    v5 = (UITextDragDropSupport *)objc_claimAutoreleasedReturnValue();
    v6 = self->_textDragDropSupport;
    self->_textDragDropSupport = v5;

    v4 = self->_textDragDropSupport;
    if (!v4)
    {
      v9 = 0;
      return (UIDropInteraction *)v9;
    }
  }
  -[UIView interactions](self, "interactions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextDragDropSupport dropInteraction](v4, "dropInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "indexOfObject:", v8) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    -[UITextDragDropSupport dropInteraction](v4, "dropInteraction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIDropInteraction *)v9;
}

- (void)invalidateDropCaret
{
  UITextDragDropSupport *textDragDropSupport;
  UITextDragDropSupport *v4;
  UITextDragDropSupport *v5;

  textDragDropSupport = self->_textDragDropSupport;
  if (!textDragDropSupport)
  {
    +[UITextDragDropSupport installTextDragDropOnView:](UITextDragDropSupport, "installTextDragDropOnView:", self);
    v4 = (UITextDragDropSupport *)objc_claimAutoreleasedReturnValue();
    v5 = self->_textDragDropSupport;
    self->_textDragDropSupport = v4;

    textDragDropSupport = self->_textDragDropSupport;
  }
  -[UITextDragDropSupport invalidateDropCaret](textDragDropSupport, "invalidateDropCaret");
}

- (void)draggingFinished:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UITextField _updateSelectionGestures](self, "_updateSelectionGestures");
  if (!-[UIView isFirstResponder](self, "isFirstResponder"))
    -[UITextField _detachFieldEditor](self, "_detachFieldEditor");
  if ((objc_msgSend(v6, "dragTearoffOccured") & 1) == 0)
  {
    -[UITextField selectionRange](self, "selectionRange");
    if (v4)
    {
      -[UITextField interactionAssistant](self, "interactionAssistant");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "showSelectionCommands");

    }
  }

}

- (id)willGenerateCancelPreview
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3B18];
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOffset");
  objc_msgSend(v3, "valueWithPoint:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentOffset:", v6, v7);

  return v5;
}

- (void)didGenerateCancelPreview:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  objc_msgSend(a3, "CGPointValue");
  v5 = v4;
  v7 = v6;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentOffset:", v5, v7);

}

- (void)performCancelAnimations
{
  UIFieldEditor *fieldEditor;
  id v4;

  if (!-[UIView isFirstResponder](self, "isFirstResponder"))
  {
    if (-[UITextField _fieldEditorAttached](self, "_fieldEditorAttached"))
    {
      fieldEditor = self->_fieldEditor;
      -[UITextField beginningOfDocument](self, "beginningOfDocument");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[UITextField caretRectForPosition:](self, "caretRectForPosition:", v4);
      -[UIScrollView scrollRectToVisible:animated:](fieldEditor, "scrollRectToVisible:animated:", 1);

    }
  }
}

- (BOOL)allowsDraggingAttachments
{
  return 0;
}

- (BOOL)canBecomeDropResponder
{
  return !-[UITextField _showsContentCoverView](self, "_showsContentCoverView");
}

- (void)becomeDropResponder
{
  double v3;
  double v4;
  void *v5;
  id v6;

  if (!-[UIView isFirstResponder](self, "isFirstResponder") && (*((_BYTE *)&self->_textFieldFlags + 1) & 1) == 0)
  {
    -[UITextField _attachFieldEditor](self, "_attachFieldEditor");
    v3 = *MEMORY[0x1E0C9D538];
    v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentOffset:", v3, v4);

    -[UITextField _fieldEditor](self, "_fieldEditor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScrollEnabled:", 1);

  }
}

- (void)resignDropResponderWithDropPerformed:(BOOL)a3
{
  void *v5;
  char v6;
  void *v7;
  double v8;
  dispatch_time_t v9;
  _QWORD v10[5];
  char v11;

  if (!-[UIView isFirstResponder](self, "isFirstResponder") && (*((_BYTE *)&self->_textFieldFlags + 1) & 1) != 0)
  {
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setScrollEnabled:", 0);

    v6 = 0;
    if (!a3)
      v6 = !-[UITextField isTextDragActive](self, "isTextDragActive");
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_contentOffsetAnimationDuration");
    v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__UITextField_resignDropResponderWithDropPerformed___block_invoke;
    v10[3] = &unk_1E16B1B78;
    v10[4] = self;
    v11 = v6;
    dispatch_after(v9, MEMORY[0x1E0C80D38], v10);

  }
  -[UITextField _updateSelectionGestures](self, "_updateSelectionGestures");
}

uint64_t __52__UITextField_resignDropResponderWithDropPerformed___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isFirstResponder");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_detachFieldEditorDiscardingEdits:animated:", *(unsigned __int8 *)(a1 + 40), 1);
  return result;
}

- (CGPoint)contentOffsetForSameViewDrops
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[UITextField _fieldEditor](self, "_fieldEditor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentOffset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setContentOffsetForSameViewDrops:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentOffset:", x, y);

}

- (void)droppingStarted
{
  *(_QWORD *)&self->_textFieldFlags |= 0x8000000uLL;
  -[UITextField setNeedsLayout](self, "setNeedsLayout");
  if (!-[UIView isFirstResponder](self, "isFirstResponder"))
    -[UITextField _notifyDidBeginEditing](self, "_notifyDidBeginEditing");
}

- (void)droppingFinished
{
  *(_QWORD *)&self->_textFieldFlags &= ~0x8000000uLL;
  -[UITextField setNeedsLayout](self, "setNeedsLayout");
  if (!-[UIView isFirstResponder](self, "isFirstResponder"))
    -[UITextField _notifyDidEndEditing](self, "_notifyDidEndEditing");
}

- (id)_previewRendererForRange:(id)a3 unifyRects:(BOOL)a4
{
  return (id)-[_UITextLayoutController previewRendererForRange:unifyRects:](self->_textLayoutController, "previewRendererForRange:unifyRects:", a3, a4);
}

- (CGRect)_boundingRectForRange:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_UITextLayoutController boundingRectForRange:](self->_textLayoutController, "boundingRectForRange:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (int64_t)_keyboardAppearance
{
  void *v2;
  int64_t v3;

  +[UISystemInputViewController _canonicalTraitsForResponder:](UISystemInputViewController, "_canonicalTraitsForResponder:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyboardAppearance");

  return v3;
}

- (int64_t)_userInterfaceStyle
{
  void *v2;
  int64_t v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  return v3;
}

- (BOOL)drawTextInRectIfNeeded:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((dyld_program_sdk_at_least() & 1) != 0
    || (v8 = -[UITextField _fieldEditorAttached](self, "_fieldEditorAttached")))
  {
    -[UITextField drawTextInRect:](self, "drawTextInRect:", x, y, width, height);
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (_NSRange)_unobscuredSecureRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[UIFieldEditor _unobscuredSecureRange](self->_fieldEditor, "_unobscuredSecureRange");
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)editMenuForTextRange:(id)a3 suggestedActions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (-[UITextField _implementsEditMenu](self, "_implementsEditMenu"))
  {
    v8 = -[_UITextLayoutController characterRangeForTextRange:](self->_textLayoutController, "characterRangeForTextRange:", v6);
    v10 = v9;
    -[UITextField delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textField:editMenuForCharactersInRange:suggestedActions:", self, v8, v10, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)willPresentEditMenuWithAnimator:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UITextField delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UITextField delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textField:willPresentEditMenuWithAnimator:", self, v7);

  }
}

- (void)willDismissEditMenuWithAnimator:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UITextField delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UITextField delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textField:willDismissEditMenuWithAnimator:", self, v8);

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "willDismissEditMenu");

}

- (void)_logWarningForMenuControllerUsage
{
  unint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = _logWarningForMenuControllerUsage___s_category;
  if (!_logWarningForMenuControllerUsage___s_category)
  {
    v2 = __UILogCategoryGetNode("Text", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_logWarningForMenuControllerUsage___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Using UIMenuController to add items into text menus is deprecated. Please implement the UITextFieldDelegate API textField:editMenuForCharactersInRange:suggestedActions: instead.", v4, 2u);
  }
}

- (void)_setOverridePasscodeStyle:(BOOL)a3
{
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags;
  uint64_t v4;

  textFieldFlags = self->_textFieldFlags;
  if (((((*(_QWORD *)&textFieldFlags & 0x100000) == 0) ^ a3) & 1) == 0)
  {
    v4 = 0x100000;
    if (!a3)
      v4 = 0;
    self->_textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&textFieldFlags & 0xFFFFFFFFFFEFFFFFLL | v4);
    -[UITextField setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_overridePasscodeStyle
{
  return (*((unsigned __int8 *)&self->_textFieldFlags + 2) >> 4) & 1;
}

- (double)_passcodeStyleAlpha
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  objc_getAssociatedObject(self, &_UITextFieldPasscodeStyleAlphaKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.25;
  }

  return v5;
}

- (void)_setPasscodeStyleAlpha:(double)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, &_UITextFieldPasscodeStyleAlphaKey, v4, (void *)1);

  -[_UITextCanvas setNeedsDisplay](self->_textCanvasView, "setNeedsDisplay");
}

- (id)_contentSnapshot
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIGraphicsImageRenderer *v9;
  void *v10;
  UIImageView *v11;
  _QWORD v13[9];

  -[UIView bounds](self, "bounds");
  -[UIView convertRect:toView:](self, "convertRect:toView:", self->_textCanvasView);
  v4 = v3;
  v6 = v5;
  -[_UITextCanvas bounds](self->_textCanvasView, "bounds");
  v8 = v7;
  v9 = -[UIGraphicsImageRenderer initWithBounds:]([UIGraphicsImageRenderer alloc], "initWithBounds:", 0.0, v4, v7, v6);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __31__UITextField__contentSnapshot__block_invoke;
  v13[3] = &unk_1E16B55B8;
  v13[4] = self;
  v13[5] = 0;
  *(double *)&v13[6] = v4;
  *(double *)&v13[7] = v8;
  *(double *)&v13[8] = v6;
  -[UIGraphicsImageRenderer imageWithActions:](v9, "imageWithActions:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v10);

  return v11;
}

uint64_t __31__UITextField__contentSnapshot__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 960);
  objc_msgSend(v1, "convertRect:fromView:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(v1, "drawRect:");
}

- (void)_applyHighlightedAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[UITextField _contentFloatingContainerView](self, "_contentFloatingContainerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setControlState:animated:", -[UIControl state](self, "state"), v3);

}

- (void)setSupportsAdaptiveImageGlyph:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  *(_QWORD *)&self->_textFieldFlags |= 0x20000000000uLL;
  -[UITextField _inputController](self, "_inputController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupportsAdaptiveImageGlyph:", v3);

}

- (BOOL)supportsAdaptiveImageGlyph
{
  int v3;
  void *v4;
  char v5;

  if ((*((_BYTE *)&self->_textFieldFlags + 5) & 2) != 0)
  {
    -[UITextField _inputController](self, "_inputController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportsAdaptiveImageGlyph");

    LOBYTE(v3) = v5;
  }
  else
  {
    v3 = dyld_program_sdk_at_least();
    if (v3)
      LOBYTE(v3) = -[UITextField _supportsImagePasteCached](self, "_supportsImagePasteCached");
  }
  return v3;
}

- (BOOL)_supportsImagePasteCached
{
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags;
  _BOOL4 v4;
  uint64_t v5;

  textFieldFlags = self->_textFieldFlags;
  if ((*(_QWORD *)&textFieldFlags & 0x40000000000) == 0)
  {
    v4 = -[UIResponder _supportsImagePaste](self, "_supportsImagePaste");
    v5 = 0x40000000000;
    if (v4)
      v5 = 0xC0000000000;
    textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(_QWORD *)&self->_textFieldFlags & 0xFFFFF3FFFFFFFFFFLL | v5);
    self->_textFieldFlags = textFieldFlags;
  }
  return (*(unint64_t *)&textFieldFlags >> 43) & 1;
}

- (void)insertAdaptiveImageGlyph:(id)a3 replacementRange:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UITextField _inputController](self, "_inputController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertAdaptiveImageGlyph:replacementRange:", v7, v6);

}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (UITextPasteDelegate)pasteDelegate
{
  return (UITextPasteDelegate *)objc_loadWeakRetained((id *)&self->_pasteDelegate);
}

- (BOOL)_tvUseVibrancy
{
  return self->_tvUseVibrancy;
}

- (void)set_tvUseVibrancy:(BOOL)a3
{
  self->_tvUseVibrancy = a3;
}

- (UIColor)_tvCustomTextColor
{
  return self->_tvCustomTextColor;
}

- (void)set_tvCustomTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_tvCustomTextColor, a3);
}

- (UIColor)_tvCustomFocusedTextColor
{
  return self->_tvCustomFocusedTextColor;
}

- (void)set_tvCustomFocusedTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_tvCustomFocusedTextColor, a3);
}

- (BOOL)_disableTextColorUpdateOnTraitCollectionChange
{
  return self->_disableTextColorUpdateOnTraitCollectionChange;
}

- (void)set_disableTextColorUpdateOnTraitCollectionChange:(BOOL)a3
{
  self->_disableTextColorUpdateOnTraitCollectionChange = a3;
}

- (CGFloat)minimumFontSize
{
  return self->_minimumFontSize;
}

- (UIImage)background
{
  return self->_background;
}

- (UIImage)disabledBackground
{
  return self->_disabledBackground;
}

- (UITextDragDelegate)textDragDelegate
{
  return (UITextDragDelegate *)objc_loadWeakRetained((id *)&self->_textDragDelegate);
}

- (void)setTextDragDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_textDragDelegate, a3);
}

- (UITextDropDelegate)textDropDelegate
{
  return (UITextDropDelegate *)objc_loadWeakRetained((id *)&self->_textDropDelegate);
}

- (void)setTextDropDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_textDropDelegate, a3);
}

- (void)setVisualStyle:(id)a3
{
  objc_storeStrong((id *)&self->_visualStyle, a3);
}

- (BOOL)_handwritingEnabled
{
  return self->__handwritingEnabled;
}

- (void)_setHandwritingEnabled:(BOOL)a3
{
  self->__handwritingEnabled = a3;
}

- (void)encodeRestorableStateWithCoder:(id)a3 includingSelectedTextAndDisplayedViewControllers:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v13;

  v4 = a4;
  v6 = a3;
  v7 = -[UITextField selectionRange](self, "selectionRange");
  v9 = v8;
  v13.receiver = self;
  v13.super_class = (Class)UITextField;
  -[UIResponder encodeRestorableStateWithCoder:](&v13, sel_encodeRestorableStateWithCoder_, v6);
  if (-[UIView isFirstResponder](self, "isFirstResponder"))
  {
    objc_msgSend(v6, "encodeBool:forKey:", 1, CFSTR("kTextFirstResponderKey"));
    objc_msgSend(v6, "encodeInt:forKey:", v9, CFSTR("kTextSelectedTextLengthKey"));
    objc_msgSend(v6, "encodeInt:forKey:", v7, CFSTR("kTextSelectedTextLocationKey"));
  }
  if (v4)
  {
    -[UITextField selectedText](self, "selectedText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("kTextSelectedTextKey"));
    if (-[UITextField _isDisplayingShortcutViewController](self, "_isDisplayingShortcutViewController"))
      objc_msgSend((id)UIApp, "ignoreSnapshotOnNextApplicationLaunch");
    if (-[UITextField _isDisplayingReferenceLibraryViewController](self, "_isDisplayingReferenceLibraryViewController"))
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "userInterfaceIdiom");

      if (!v12)
        objc_msgSend((id)UIApp, "ignoreSnapshotOnNextApplicationLaunch");
      objc_msgSend(v6, "encodeBool:forKey:", 1, CFSTR("kTextDisplayingReferenceLibraryViewControllerKey"));
    }
    if (-[UITextField _isDisplayingShareViewController](self, "_isDisplayingShareViewController"))
      objc_msgSend((id)UIApp, "ignoreSnapshotOnNextApplicationLaunch");

  }
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  -[UITextField encodeRestorableStateWithCoder:includingSelectedTextAndDisplayedViewControllers:](self, "encodeRestorableStateWithCoder:includingSelectedTextAndDisplayedViewControllers:", a3, 1);
}

- (void)decodeRestorableStateWithCoder:(id)a3 includingSelectedTextAndDisplayedViewControllers:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UITextField;
  -[UIResponder decodeRestorableStateWithCoder:](&v10, sel_decodeRestorableStateWithCoder_, v6);
  if (objc_msgSend(v6, "containsValueForKey:", CFSTR("kTextFirstResponderKey"))
    && objc_msgSend(v6, "decodeBoolForKey:", CFSTR("kTextFirstResponderKey")))
  {
    -[UITextField becomeFirstResponder](self, "becomeFirstResponder");
  }
  if (objc_msgSend(v6, "containsValueForKey:", CFSTR("kTextSelectedTextLengthKey")))
  {
    if (objc_msgSend(v6, "containsValueForKey:", CFSTR("kTextSelectedTextLocationKey")))
    {
      v7 = (int)objc_msgSend(v6, "decodeIntForKey:", CFSTR("kTextSelectedTextLengthKey"));
      v8 = (int)objc_msgSend(v6, "decodeIntForKey:", CFSTR("kTextSelectedTextLocationKey"));
      -[UITextField becomeFirstResponder](self, "becomeFirstResponder");
      -[UITextField setSelectionRange:](self, "setSelectionRange:", v8, v7);
      if (v4)
      {
        objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTextSelectedTextKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v6, "decodeBoolForKey:", CFSTR("kTextDisplayingShortcutViewControllerKey"));
          objc_msgSend(v6, "decodeBoolForKey:", CFSTR("kTextDisplayingReferenceLibraryViewControllerKey"));
          objc_msgSend(v6, "decodeBoolForKey:", CFSTR("kTextDisplayingShareViewControllerKey"));
        }

      }
    }
  }

}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  -[UITextField decodeRestorableStateWithCoder:includingSelectedTextAndDisplayedViewControllers:](self, "decodeRestorableStateWithCoder:includingSelectedTextAndDisplayedViewControllers:", a3, 1);
}

- (id)_interactionState
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  -[UITextField encodeRestorableStateWithCoder:includingSelectedTextAndDisplayedViewControllers:](self, "encodeRestorableStateWithCoder:includingSelectedTextAndDisplayedViewControllers:", v3, 0);
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setInteractionState:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3710];
  v5 = a3;
  v10 = 0;
  v6 = (void *)objc_msgSend([v4 alloc], "initForReadingFromData:error:", v5, &v10);

  v7 = v10;
  if (v6)
  {
    -[UITextField decodeRestorableStateWithCoder:includingSelectedTextAndDisplayedViewControllers:](self, "decodeRestorableStateWithCoder:includingSelectedTextAndDisplayedViewControllers:", v6, 0);
  }
  else
  {
    v8 = _setInteractionState____s_category;
    if (!_setInteractionState____s_category)
    {
      v8 = __UILogCategoryGetNode("Text", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&_setInteractionState____s_category);
    }
    if ((*(_BYTE *)v8 & 1) != 0)
    {
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[UITextField(_UIInteractionStateRestorable) _setInteractionState:]";
        v13 = 2112;
        v14 = v7;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "%s: Error decoding interaction state (%@)", buf, 0x16u);
      }
    }
  }

}

- (BOOL)_hasFontInfoForVerticalBaselineSpacing
{
  return 1;
}

- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3
{
  return ((_DWORD)a3 - 11) < 2;
}

- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6
{
  double result;
  objc_super v8;

  if ((a3 - 5) > 1)
  {
    v8.receiver = self;
    v8.super_class = (Class)UITextField;
    -[UIView _autolayoutSpacingAtEdge:forAttribute:inContainer:isGuide:](&v8, sel__autolayoutSpacingAtEdge_forAttribute_inContainer_isGuide_, *(_QWORD *)&a3, a4, a5, a6);
  }
  else
  {
    _UIViewBaselineToEdgeSpacing(-[UITextField _fontInfoForBaselineSpacing](self, "_fontInfoForBaselineSpacing"), a3);
    UICeilToViewScale(self);
  }
  return result;
}

- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 nextToNeighbor:(id)a5 edge:(int)a6 attribute:(int64_t)a7 multiplier:(double)a8
{
  uint64_t v10;
  uint64_t v13;
  unsigned int v15;
  double result;
  NSObject *v17;
  unint64_t v18;
  NSObject *v19;
  objc_super v20;
  uint8_t buf[16];

  v10 = *(_QWORD *)&a6;
  v13 = *(_QWORD *)&a3;
  if ((a3 - 5) <= 1)
  {
    v15 = a4 - 11;
    if (os_variant_has_internal_diagnostics())
    {
      if (v15 < 2)
        goto LABEL_4;
      v17 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v17, OS_LOG_TYPE_FAULT, "UIKit problem: invalid argument for internal layout spacing method", buf, 2u);
      }
    }
    else
    {
      if (v15 < 2)
      {
LABEL_4:
        _UIViewBaselineSpacing(self, a5, v13);
        return result;
      }
      v18 = _autolayoutSpacingAtEdge_forAttribute_nextToNeighbor_edge_attribute_multiplier____s_category_879;
      if (!_autolayoutSpacingAtEdge_forAttribute_nextToNeighbor_edge_attribute_multiplier____s_category_879)
      {
        v18 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&_autolayoutSpacingAtEdge_forAttribute_nextToNeighbor_edge_attribute_multiplier____s_category_879);
      }
      v19 = *(NSObject **)(v18 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "UIKit problem: invalid argument for internal layout spacing method", buf, 2u);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)UITextField;
  -[UIView _autolayoutSpacingAtEdge:forAttribute:nextToNeighbor:edge:attribute:multiplier:](&v20, sel__autolayoutSpacingAtEdge_forAttribute_nextToNeighbor_edge_attribute_multiplier_, v13, a4, a5, v10, a7, a8);
  return result;
}

@end
