@implementation UIToolbarTextButton

- (UIToolbarTextButton)initWithTitle:(id)a3 pressedTitle:(id)a4 withFont:(id)a5 withBarStyle:(int64_t)a6 withStyle:(int64_t)a7 withTitleWidth:(double)a8 possibleTitles:(id)a9 withToolbarTintColor:(id)a10
{
  _BOOL4 v18;
  _UIToolbarNavigationButton *v19;
  _UIToolbarNavigationButton *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  UIToolbarTextButton *v30;
  UIToolbarTextButton *v31;
  objc_super v33;

  v18 = a7 == 2;
  self->super._toolbarTintColor = (UIColor *)a10;
  self->super._barStyle = a6;
  self->super._style = a7;
  v19 = -[UINavigationButton initWithTitle:possibleTitles:style:]([_UIToolbarNavigationButton alloc], "initWithTitle:possibleTitles:style:", a3, a9, (2 * v18));
  v20 = v19;
  if (a5)
    -[UILabel setFont:](-[UIButton titleLabel](v19, "titleLabel"), "setFont:", a5);
  -[UIView frame](self, "frame");
  v22 = v21;
  v24 = v23;
  -[UINavigationButton sizeThatFits:](v20, "sizeThatFits:", v25, v26);
  -[UINavigationButton _setFrame:deferLayout:](v20, "_setFrame:deferLayout:", 1, v22, v24, v27, v28);
  if (a8 == 0.0)
  {
    if (a9)
    {
      v29 = objc_msgSend(a9, "count");
      if (!a4 && !v29)
        goto LABEL_10;
    }
    else if (!a4)
    {
      goto LABEL_10;
    }
    -[UIToolbarButton _sizeView:toPossibleTitles:pressedTitle:](self, "_sizeView:toPossibleTitles:pressedTitle:", v20, a9, a4);
  }
LABEL_10:
  -[UIView frame](v20, "frame");
  v33.receiver = self;
  v33.super_class = (Class)UIToolbarTextButton;
  v30 = -[UIControl initWithFrame:](&v33, sel_initWithFrame_);
  v31 = v30;
  if (v30)
  {
    -[UIView setOpaque:](v30, "setOpaque:", 0);
    v31->super._info = v20;
    v31->_title = (NSString *)objc_msgSend(a3, "copy");
    v31->_pressedTitle = (NSString *)objc_msgSend(a4, "copy");
    v31->_possibleTitles = (NSSet *)objc_msgSend(a9, "copy");
    -[UIView addSubview:](v31, "addSubview:", v31->super._info);
    -[UIToolbarButton _adjustPushButtonForMiniBar:isChangingBarHeight:](v31, "_adjustPushButtonForMiniBar:isChangingBarHeight:", 0, 0);
    -[UIView setNeedsLayout](v31, "setNeedsLayout");
  }
  else
  {

  }
  return v31;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _UIToolbarNavigationButton *info;
  UILabel *v7;
  NSString *v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  _QWORD v13[2];
  CGSize result;

  height = a3.height;
  width = a3.width;
  v13[1] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    info = self->super._info;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[UIButton titleLabel](info, "titleLabel");
      v8 = -[UILabel text](v7, "text");
      v12 = *(_QWORD *)off_1E1678D90;
      v13[0] = -[UILabel font](v7, "font");
      -[NSString boundingRectWithSize:options:attributes:context:](v8, "boundingRectWithSize:options:attributes:context:", 0, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1), 0, width, height);
      width = v9;
    }
  }
  v10 = width;
  v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIToolbarTextButton;
  -[UIToolbarButton dealloc](&v3, sel_dealloc);
}

- (void)_setPressed:(BOOL)a3
{
  _BOOL8 v3;
  NSString *pressedTitle;
  objc_super v6;

  v3 = a3;
  if (-[UIToolbarButton _infoIsButton](self, "_infoIsButton"))
  {
    v6.receiver = self;
    v6.super_class = (Class)UIToolbarTextButton;
    -[UIToolbarButton _setPressed:](&v6, sel__setPressed_, v3);
  }
  else
  {
    pressedTitle = self->_pressedTitle;
    if (pressedTitle)
    {
      if (!v3)
        pressedTitle = self->_title;
      -[_UIToolbarNavigationButton setText:](self->super._info, "setText:", pressedTitle);
      -[UIView sizeToFit](self->super._info, "sizeToFit");
      -[UIView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)layoutSubviews
{
  UIView *v3;
  UIView *v4;
  _UIToolbarNavigationButton *info;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double MaxY;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;

  v28.receiver = self;
  v28.super_class = (Class)UIToolbarTextButton;
  -[UIToolbarButton layoutSubviews](&v28, sel_layoutSubviews);
  if (!-[UIToolbarButton _isBorderedOtherThanAccessibility](self, "_isBorderedOtherThanAccessibility"))
  {
    if (-[UIView superview](self, "superview"))
    {
      -[UIView superview](self, "superview");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v3 = -[UIView superview](self, "superview");
        if (v3)
        {
          v4 = v3;
          if ((-[UIView centerTextButtons](v3, "centerTextButtons") & 1) == 0)
          {
            info = self->super._info;
            -[UIButton setNeedsLayout](info, "setNeedsLayout");
            -[UIView layoutIfNeeded](info, "layoutIfNeeded");
            v6 = -[UIButton _titleView](info, "_titleView");
            if (v6)
            {
              v7 = v6;
              objc_msgSend(v6, "_baselineOffsetFromBottom");
              v9 = v8;
              objc_msgSend(v7, "frame");
              -[UIView convertRect:toView:](info, "convertRect:toView:", v4);
              v11 = v10;
              v13 = v12;
              v15 = v14;
              v17 = v16;
              -[UIView bounds](v4, "bounds");
              MaxY = CGRectGetMaxY(v29);
              v30.origin.x = v11;
              v30.origin.y = v13;
              v30.size.width = v15;
              v30.size.height = v17;
              v19 = MaxY - (CGRectGetMaxY(v30) - v9);
              if (-[UIView isMinibar](v4, "isMinibar"))
                v20 = 11.0;
              else
                v20 = 16.0;
              if (v20 != v19)
              {
                -[UIView frame](info, "frame");
                v22 = v21;
                v24 = v23;
                v26 = v25;
                UIRoundToViewScale(self);
                -[UIButton setFrame:](info, "setFrame:", v22, v27, v24, v26);
              }
            }
          }
        }
      }
    }
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UIButton alignmentRectInsets](self->super._info, "alignmentRectInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_UIAppearance_setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  id appearanceStorage;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  double v23;
  double v24;
  double maximumWidth;
  double v26;
  double v27;
  double v28;

  appearanceStorage = self->super._appearanceStorage;
  if (a3)
  {
    if (!appearanceStorage)
      self->super._appearanceStorage = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
  }
  else if (!appearanceStorage)
  {
    return;
  }
  v8 = objc_msgSend(a3, "_ui_attributesForDictionaryContainingUIStringDrawingKeys");
  v9 = objc_msgSend(self->super._appearanceStorage, "textAttributesForState:", a4);
  if (v8 | v9)
  {
    v10 = (void *)v9;
    if ((objc_msgSend((id)v8, "isEqualToDictionary:", v9) & 1) == 0)
    {
      objc_msgSend(self->super._appearanceStorage, "setTextAttributes:forState:", v8, a4);
      -[UIToolbarButton _adjustToolbarButtonInfo](self, "_adjustToolbarButtonInfo");
      v11 = *(_QWORD *)off_1E1678D90;
      v12 = objc_msgSend((id)v8, "objectForKey:", *(_QWORD *)off_1E1678D90);
      v13 = objc_msgSend(v10, "objectForKey:", v11);
      if (v12 | v13)
      {
        if ((objc_msgSend((id)v12, "isEqual:", v13) & 1) == 0)
        {
          -[UIView sizeToFit](self->super._info, "sizeToFit");
          if (*(_OWORD *)&self->_pressedTitle != 0)
            -[UIToolbarButton _sizeView:toPossibleTitles:pressedTitle:](self, "_sizeView:toPossibleTitles:pressedTitle:", self->super._info);
          -[UIView frame](self->super._info, "frame");
          v15 = v14;
          v17 = v16;
          v19 = v18;
          v21 = v20;
          v22 = -[UIToolbarButton _isBordered](self, "_isBordered");
          v23 = v19 + 20.0;
          if (v22)
          {
            v24 = 30.0;
          }
          else
          {
            v23 = v19;
            v24 = v21;
          }
          maximumWidth = self->super._maximumWidth;
          v26 = fmax(self->super._minimumWidth, v23);
          v27 = fmin(maximumWidth, v26);
          if (maximumWidth <= 0.0)
            v28 = v26;
          else
            v28 = v27;
          -[UIButton setFrame:](self->super._info, "setFrame:", v15, v17, v28, v24);
          -[UIView setNeedsLayout](-[UIView superview](self, "superview"), "setNeedsLayout");
        }
      }
    }
  }
}

@end
