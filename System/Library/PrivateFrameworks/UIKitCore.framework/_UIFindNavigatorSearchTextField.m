@implementation _UIFindNavigatorSearchTextField

- (_UIFindNavigatorSearchTextField)initWithFrame:(CGRect)a3
{
  _UIFindNavigatorSearchTextField *v3;
  _UIFindNavigatorSearchTextField *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIFindNavigatorSearchTextField;
  v3 = -[UITextField initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UITextField _systemBackgroundView](v3, "_systemBackgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundContainer:", 1);
    objc_initWeak(&location, v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49___UIFindNavigatorSearchTextField_initWithFrame___block_invoke;
    v9[3] = &unk_1E16B22E0;
    objc_copyWeak(&v10, &location);
    v7 = (id)objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", CFSTR("UIKeyboardDidShowNotification"), 0, 0, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

  }
  return v4;
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIFindNavigatorSearchTextField;
  -[UISearchTextField willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (!a3)
    self->_keyboardDidAppear = 0;
}

- (CGRect)visibleRect
{
  void *v2;
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
  CGRect result;

  -[UIView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_canResignIfContainsFirstResponder
{
  return 0;
}

- (BOOL)canResignFirstResponder
{
  void *v3;
  char v4;
  void *v5;
  _BOOL4 keyboardDidAppear;
  objc_super v8;

  -[UIResponder _ui_findNavigatorResponder](self, "_ui_findNavigatorResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isChangingInputModes");

  if ((v4 & 1) != 0)
    return 0;
  -[UIResponder _ui_findNavigatorResponder](self, "_ui_findNavigatorResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    keyboardDidAppear = self->_keyboardDidAppear;

    if (!keyboardDidAppear)
      return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIFindNavigatorSearchTextField;
  return -[UISearchTextField canResignFirstResponder](&v8, sel_canResignFirstResponder);
}

- (int64_t)keyboardAppearance
{
  void *v2;
  int64_t v3;

  -[UIResponder _ui_findNavigatorResponder](self, "_ui_findNavigatorResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyboardAppearance");

  return v3;
}

- (id)undoManager
{
  void *v2;
  void *v3;

  -[UIView nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_delegateShouldScrollToVisibleWhenBecomingFirstResponder
{
  return 0;
}

- (BOOL)_showsClearButtonWhenNonEmpty:(BOOL)a3
{
  _BOOL4 v4;

  v4 = -[UIView isFirstResponder](self, "isFirstResponder", a3);
  if (v4)
    LOBYTE(v4) = -[UISearchTextField _hasContent](self, "_hasContent");
  return v4;
}

- (CGRect)_applyRightViewOffsetIfApplicable:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UITextField rightView](self, "rightView");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = -[_UIFindNavigatorSearchTextField _showsClearButtonWhenNonEmpty:](self, "_showsClearButtonWhenNonEmpty:", -[UITextField isEditing](self, "isEditing"));

    if (v10)
    {
      v11 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
      -[UITextField clearButtonRect](self, "clearButtonRect");
      v12 = CGRectGetWidth(v18);
      if (v11)
        v13 = v12;
      else
        v13 = -v12;
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      v20 = CGRectOffset(v19, v13, 0.0);
      x = v20.origin.x;
      y = v20.origin.y;
      width = v20.size.width;
      height = v20.size.height;
    }
  }
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_baselineLeftViewRectForBounds:(CGRect)a3
{
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
  objc_super v20;
  CGRect result;

  v20.receiver = self;
  v20.super_class = (Class)_UIFindNavigatorSearchTextField;
  -[UITextField _baselineLeftViewRectForBounds:](&v20, sel__baselineLeftViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (-[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    -[_UIFindNavigatorSearchTextField _applyRightViewOffsetIfApplicable:](self, "_applyRightViewOffsetIfApplicable:", v5, v7, v9, v11);
    v5 = v12;
    v7 = v13;
    v9 = v14;
    v11 = v15;
  }
  v16 = v5;
  v17 = v7;
  v18 = v9;
  v19 = v11;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
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
  objc_super v20;
  CGRect result;

  v20.receiver = self;
  v20.super_class = (Class)_UIFindNavigatorSearchTextField;
  -[UISearchTextField rightViewRectForBounds:](&v20, sel_rightViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (!-[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    -[_UIFindNavigatorSearchTextField _applyRightViewOffsetIfApplicable:](self, "_applyRightViewOffsetIfApplicable:", v5, v7, v9, v11);
    v5 = v12;
    v7 = v13;
    v9 = v14;
    v11 = v15;
  }
  v16 = v5;
  v17 = v7;
  v18 = v9;
  v19 = v11;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)_isTextRectWideEnoughForRightView:(CGRect)a3
{
  double width;
  CGRect v6;

  width = a3.size.width;
  -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UIFindNavigatorSearchTextField rightViewRectForBounds:](self, "rightViewRectForBounds:");
  return width - CGRectGetWidth(v6) > 44.0;
}

- (CGRect)_availableTextRectForBounds:(CGRect)a3 forEditing:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[_UIFindNavigatorSearchTextField _availableTextRectForBounds:forEditing:accountForRightView:](self, "_availableTextRectForBounds:forEditing:accountForRightView:", a4, -[_UIFindNavigatorSearchTextField _showsClearButtonWhenNonEmpty:](self, "_showsClearButtonWhenNonEmpty:"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_availableTextRectForBounds:(CGRect)a3 forEditing:(BOOL)a4 accountForRightView:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;
  objc_super v25;
  CGRect v26;
  CGRect result;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v25.receiver = self;
  v25.super_class = (Class)_UIFindNavigatorSearchTextField;
  -[UISearchTextField _availableTextRectForBounds:forEditing:](&v25, sel__availableTextRectForBounds_forEditing_, a4);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  if (v5)
  {
    -[UITextField rightView](self, "rightView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 && !-[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v24 = -[_UIFindNavigatorSearchTextField _isTextRectWideEnoughForRightView:](self, "_isTextRectWideEnoughForRightView:", v12, v14, v16, v18);

      if (v24)
      {
        -[_UIFindNavigatorSearchTextField rightViewRectForBounds:](self, "rightViewRectForBounds:", x, y, width, height);
        v16 = v16 - CGRectGetWidth(v26);
      }
    }
    else
    {

    }
  }
  v20 = v12;
  v21 = v14;
  v22 = v16;
  v23 = v18;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIFindNavigatorSearchTextField;
  -[UISearchTextField layoutSubviews](&v9, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[_UIFindNavigatorSearchTextField _availableTextRectForBounds:forEditing:accountForRightView:](self, "_availableTextRectForBounds:forEditing:accountForRightView:", -[UITextField isEditing](self, "isEditing"), 0, v3, v4, v5, v6);
  v7 = -[_UIFindNavigatorSearchTextField _isTextRectWideEnoughForRightView:](self, "_isTextRectWideEnoughForRightView:") ^ 1;
  -[UITextField rightView](self, "rightView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v7);

}

+ (id)_newlineImageForSize:(CGSize)a3 withTraitCollection:(id)a4
{
  double height;
  CGFloat width;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  _QWORD *ContextStack;
  CGContext *v16;
  CGFloat v17;
  double v18;
  void *v19;
  void *v20;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  height = a3.height;
  width = a3.width;
  v6 = a4;
  +[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resolvedColorWithTraitCollection:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIColor labelColor](UIColor, "labelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resolvedColorWithTraitCollection:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("return"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageWithTintColor:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "displayScale");
  v14 = v13;

  _UIGraphicsBeginImageContextWithOptions(0, 0, width, height, v14);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v16 = 0;
  else
    v16 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  v17 = *MEMORY[0x1E0C9D538];
  v18 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", *MEMORY[0x1E0C9D538], v18, width, height, height * 0.25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addClip");

  objc_msgSend(v8, "setFill");
  v22.origin.x = v17;
  v22.origin.y = v18;
  v22.size.width = width;
  v22.size.height = height;
  CGContextFillRect(v16, v22);
  v23.origin.x = v17;
  v23.origin.y = v18;
  v23.size.width = width;
  v23.size.height = height;
  v24 = CGRectInset(v23, 1.0, 1.0);
  objc_msgSend(v12, "drawInRect:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
  _UIGraphicsGetImageFromCurrentImageContext(0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v20;
}

- (void)insertNewline
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[UITextField font](self, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capHeight");
  -[UITextField font](self, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descender");
  UICeilToViewScale(self);
  v6 = v5;

  v18 = objc_alloc_init((Class)off_1E1679D28);
  v7 = (void *)objc_opt_class();
  -[UIView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_newlineImageForSize:withTraitCollection:", v8, v6, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setImage:", v9);

  -[UITextField font](self, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descender");
  objc_msgSend(v18, "setBounds:", 0.0, v11 * 0.5, v6, v6);

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField textStorage](self, "textStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendAttributedString:", v12);

  -[UITextField selectedTextRange](self, "selectedTextRange");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "end");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField positionFromPosition:inDirection:offset:](self, "positionFromPosition:inDirection:offset:", v15, 2, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextField textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v16, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setSelectedTextRange:](self, "setSelectedTextRange:", v17);

  -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", 0x20000, 0);
}

- (id)text
{
  void *v2;
  void *v3;
  void *v4;
  __int16 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFindNavigatorSearchTextField;
  -[UISearchTextField text](&v7, sel_text);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", v3, CFSTR("\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)keyboardDidAppear
{
  return self->_keyboardDidAppear;
}

- (void)setKeyboardDidAppear:(BOOL)a3
{
  self->_keyboardDidAppear = a3;
}

@end
