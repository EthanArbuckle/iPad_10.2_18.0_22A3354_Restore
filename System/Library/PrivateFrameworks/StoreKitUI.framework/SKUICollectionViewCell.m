@implementation SKUICollectionViewCell

- (SKUICollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUICollectionViewCell *v8;
  void *v9;
  double v10;
  CGFloat v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUICollectionViewCell initWithFrame:].cold.1();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUICollectionViewCell;
  v8 = -[SKUICollectionViewCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    v11 = 1.0 / v10;

    v8->_separatorWidths.top = v11;
    v8->_separatorWidths.left = v11;
    v8->_separatorWidths.bottom = v11;
    v8->_separatorWidths.right = v11;
    *(_OWORD *)&v8->_separatorInsets.top = xmmword_1BBED15A0;
    *(_OWORD *)&v8->_separatorInsets.bottom = xmmword_1BBED15A0;
  }
  return v8;
}

- (void)setSeparatorColor:(id)a3
{
  UIColor *v5;
  UIColor **p_separatorColor;
  UIColor *separatorColor;
  char v8;
  UIView *bottomBorderView;
  void *v10;
  UIView *leftBorderView;
  void *v12;
  UIView *rightBorderView;
  void *v14;
  UIView *topBorderView;
  void *v16;
  UIColor *v17;

  v5 = (UIColor *)a3;
  p_separatorColor = &self->_separatorColor;
  separatorColor = self->_separatorColor;
  if (separatorColor != v5)
  {
    v17 = v5;
    v8 = -[UIColor isEqual:](separatorColor, "isEqual:", v5);
    v5 = v17;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_separatorColor, a3);
      bottomBorderView = self->_bottomBorderView;
      if (*p_separatorColor)
      {
        -[UIView setBackgroundColor:](self->_bottomBorderView, "setBackgroundColor:");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](bottomBorderView, "setBackgroundColor:", v10);

      }
      leftBorderView = self->_leftBorderView;
      if (*p_separatorColor)
      {
        -[UIView setBackgroundColor:](self->_leftBorderView, "setBackgroundColor:");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](leftBorderView, "setBackgroundColor:", v12);

      }
      rightBorderView = self->_rightBorderView;
      if (*p_separatorColor)
      {
        -[UIView setBackgroundColor:](self->_rightBorderView, "setBackgroundColor:");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](rightBorderView, "setBackgroundColor:", v14);

      }
      topBorderView = self->_topBorderView;
      if (*p_separatorColor)
      {
        -[UIView setBackgroundColor:](topBorderView, "setBackgroundColor:");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](topBorderView, "setBackgroundColor:", v16);

      }
      v5 = v17;
    }
  }

}

- (void)setSeparatorStyle:(int64_t)a3
{
  UIView *bottomBorderView;
  UIView *v5;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  uint64_t v9;
  void *v10;
  UIView *leftBorderView;
  UIView *v12;
  UIView *v13;
  UIView *v14;
  void *v15;
  UIView *rightBorderView;
  UIView *v17;
  UIView *v18;
  UIView *v19;
  void *v20;
  UIView *topBorderView;
  UIView *v22;
  UIView *v23;
  UIView *v24;
  void *v25;

  if (self->_separatorStyle != a3)
  {
    self->_separatorStyle = a3;
    bottomBorderView = self->_bottomBorderView;
    if (a3)
    {
      if (!bottomBorderView)
      {
        v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        v6 = self->_bottomBorderView;
        self->_bottomBorderView = v5;

        v7 = self->_bottomBorderView;
        if (self->_separatorColor)
        {
          -[UIView setBackgroundColor:](self->_bottomBorderView, "setBackgroundColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v10);

        }
        -[SKUICollectionViewCell addSubview:](self, "addSubview:", self->_bottomBorderView);
        bottomBorderView = self->_bottomBorderView;
      }
      -[UIView setHidden:](bottomBorderView, "setHidden:", -[SKUICollectionViewCell _showsBottomBorder](self, "_showsBottomBorder") ^ 1);
      leftBorderView = self->_leftBorderView;
      if (!leftBorderView)
      {
        v12 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        v13 = self->_leftBorderView;
        self->_leftBorderView = v12;

        v14 = self->_leftBorderView;
        if (self->_separatorColor)
        {
          -[UIView setBackgroundColor:](self->_leftBorderView, "setBackgroundColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](v14, "setBackgroundColor:", v15);

        }
        -[SKUICollectionViewCell addSubview:](self, "addSubview:", self->_leftBorderView);
        leftBorderView = self->_leftBorderView;
      }
      -[UIView setHidden:](leftBorderView, "setHidden:", -[SKUICollectionViewCell _showsLeftBorder](self, "_showsLeftBorder") ^ 1);
      rightBorderView = self->_rightBorderView;
      if (!rightBorderView)
      {
        v17 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        v18 = self->_rightBorderView;
        self->_rightBorderView = v17;

        v19 = self->_rightBorderView;
        if (self->_separatorColor)
        {
          -[UIView setBackgroundColor:](self->_rightBorderView, "setBackgroundColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](v19, "setBackgroundColor:", v20);

        }
        -[SKUICollectionViewCell addSubview:](self, "addSubview:", self->_rightBorderView);
        rightBorderView = self->_rightBorderView;
      }
      -[UIView setHidden:](rightBorderView, "setHidden:", -[SKUICollectionViewCell _showsRightBorder](self, "_showsRightBorder") ^ 1);
      topBorderView = self->_topBorderView;
      if (!topBorderView)
      {
        v22 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        v23 = self->_topBorderView;
        self->_topBorderView = v22;

        v24 = self->_topBorderView;
        if (self->_separatorColor)
        {
          -[UIView setBackgroundColor:](self->_topBorderView, "setBackgroundColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](v24, "setBackgroundColor:", v25);

        }
        -[SKUICollectionViewCell addSubview:](self, "addSubview:", self->_topBorderView);
        topBorderView = self->_topBorderView;
      }
      v9 = -[SKUICollectionViewCell _showsTopBorder](self, "_showsTopBorder") ^ 1;
      v8 = topBorderView;
    }
    else
    {
      -[UIView setHidden:](self->_bottomBorderView, "setHidden:", 1);
      -[UIView setHidden:](self->_leftBorderView, "setHidden:", 1);
      -[UIView setHidden:](self->_rightBorderView, "setHidden:", 1);
      v8 = self->_topBorderView;
      v9 = 1;
    }
    -[UIView setHidden:](v8, "setHidden:", v9);
  }
}

- (void)setSeparatorWidths:(UIEdgeInsets)a3
{
  if (self->_separatorWidths.left != a3.left
    || self->_separatorWidths.top != a3.top
    || self->_separatorWidths.right != a3.right
    || self->_separatorWidths.bottom != a3.bottom)
  {
    self->_separatorWidths = a3;
    -[SKUICollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowsCellSeparators:(BOOL)a3
{
  -[SKUICollectionViewCell setSeparatorStyle:](self, "setSeparatorStyle:", a3);
}

- (BOOL)showsCellSeparators
{
  return self->_separatorStyle != 0;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKUICollectionViewCell;
  v4 = a3;
  -[SKUICollectionViewCell applyLayoutAttributes:](&v8, sel_applyLayoutAttributes_, v4);
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)SKUICollectionViewCell;
  -[SKUICollectionViewCell setBackgroundColor:](&v7, sel_setBackgroundColor_, v5);

  v6 = objc_msgSend(v4, "position");
  -[SKUICollectionViewCell _setPosition:](self, "_setPosition:", v6);
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUICollectionViewCell;
  -[SKUICollectionViewCell setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[SKUICollectionViewCell _updateBorderVisibility](self, "_updateBorderVisibility");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUICollectionViewCell;
  -[SKUICollectionViewCell setSelected:](&v4, sel_setSelected_, a3);
  -[SKUICollectionViewCell _updateBorderVisibility](self, "_updateBorderVisibility");
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  void *v11;
  UIView *bottomBorderView;
  double v13;
  double MinX;
  CGFloat v15;
  CGFloat Width;
  UIView *v17;
  UIView *leftBorderView;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat MinY;
  CGFloat v29;
  UIView *v30;
  CGFloat v31;
  UIView *rightBorderView;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat Height;
  UIView *v42;
  UIView *topBorderView;
  double top;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  UIView *v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double right;
  double left;
  objc_super v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  v60.receiver = self;
  v60.super_class = (Class)SKUICollectionViewCell;
  -[SKUICollectionViewCell layoutSubviews](&v60, sel_layoutSubviews);
  right = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  left = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  if (self->_separatorStyle != 4)
  {
    if ((self->_position & 1) != 0)
      left = self->_separatorInsets.left;
    if ((self->_position & 5) == 4)
      right = self->_separatorInsets.right;
  }
  v56 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v57 = *MEMORY[0x1E0DC49E8];
  -[SKUICollectionViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SKUICollectionViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  bottomBorderView = self->_bottomBorderView;
  v13 = v10;
  if (bottomBorderView)
  {
    v13 = v10;
    if (!-[UIView isHidden](bottomBorderView, "isHidden"))
    {
      v13 = v10 - self->_separatorWidths.bottom;
      v61.origin.x = v4;
      v61.origin.y = v6;
      v61.size.width = v8;
      v61.size.height = v10;
      MinX = CGRectGetMinX(v61);
      v62.origin.x = v4;
      v62.origin.y = v6;
      v62.size.width = v8;
      v62.size.height = v10;
      v15 = CGRectGetMaxY(v62) - self->_separatorWidths.bottom;
      v63.origin.x = v4;
      v63.origin.y = v6;
      v63.size.width = v8;
      v63.size.height = v10;
      Width = CGRectGetWidth(v63);
      v17 = self->_bottomBorderView;
      SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(left + MinX, v57 + v15, Width - (right + left), self->_separatorWidths.bottom - (v57 + v56), v4, v6, v8, v10);
      -[UIView setFrame:](v17, "setFrame:");
    }
  }
  leftBorderView = self->_leftBorderView;
  v19 = v8;
  v20 = v4;
  if (leftBorderView)
  {
    v19 = v8;
    v20 = v4;
    if (!-[UIView isHidden](leftBorderView, "isHidden"))
    {
      v53 = v13;
      v21 = self->_separatorWidths.left;
      v22 = 0.0;
      if (v21 > 0.00000011920929)
      {
        v23 = v21 * 0.5;
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "scale");
        v26 = 1.0 / v25;

        if (v23 >= v26)
          v22 = v23;
        else
          v22 = v26;
      }
      v52 = v8 - v22;
      v64.origin.x = v4;
      v64.origin.y = v6;
      v64.size.width = v8;
      v64.size.height = v10;
      v27 = CGRectGetMinX(v64);
      v65.origin.x = v4;
      v65.origin.y = v6;
      v65.size.width = v8;
      v65.size.height = v10;
      MinY = CGRectGetMinY(v65);
      v66.origin.x = v4;
      v66.origin.y = v6;
      v66.size.width = v8;
      v66.size.height = v10;
      v29 = CGRectGetHeight(v66) - self->_separatorWidths.bottom;
      v30 = self->_leftBorderView;
      v31 = v27;
      v20 = v4 + v22;
      v19 = v8 - v22;
      SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v31, MinY, v22, v29, v4, v6, v8, v10);
      -[UIView setFrame:](v30, "setFrame:");
      v13 = v53;
    }
  }
  rightBorderView = self->_rightBorderView;
  if (rightBorderView && !-[UIView isHidden](rightBorderView, "isHidden"))
  {
    v52 = v20;
    v54 = v13;
    v33 = self->_separatorWidths.right;
    v34 = 0.0;
    if (v33 > 0.00000011920929)
    {
      v35 = v33 * 0.5;
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "scale");
      v38 = 1.0 / v37;

      if (v35 >= v38)
        v34 = v35;
      else
        v34 = v38;
    }
    v19 = v19 - v34;
    v67.origin.x = v4;
    v67.origin.y = v6;
    v67.size.width = v8;
    v67.size.height = v10;
    v39 = CGRectGetMaxX(v67) - v34;
    v68.origin.x = v4;
    v68.origin.y = v6;
    v68.size.width = v8;
    v68.size.height = v10;
    v40 = CGRectGetMinY(v68);
    v69.origin.x = v4;
    v69.origin.y = v6;
    v69.size.width = v8;
    v69.size.height = v10;
    Height = CGRectGetHeight(v69);
    v42 = self->_rightBorderView;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v39, v40, v34, Height - self->_separatorWidths.bottom, v4, v6, v8, v10);
    -[UIView setFrame:](v42, "setFrame:");
    v20 = v52;
    v13 = v54;
  }
  topBorderView = self->_topBorderView;
  if (topBorderView && !-[UIView isHidden](topBorderView, "isHidden"))
  {
    top = self->_separatorWidths.top;
    v55 = v6 + top;
    v13 = v13 - top;
    v70.origin.x = v4;
    v70.origin.y = v6;
    v70.size.width = v8;
    v70.size.height = v10;
    v52 = v19;
    v45 = v20;
    v46 = CGRectGetMinX(v70);
    v71.origin.x = v4;
    v71.origin.y = v6;
    v71.size.width = v8;
    v71.size.height = v10;
    v47 = CGRectGetMinY(v71);
    v72.origin.x = v4;
    v72.origin.y = v6;
    v72.size.width = v8;
    v72.size.height = v10;
    v48 = CGRectGetWidth(v72);
    v49 = self->_separatorWidths.top;
    v50 = self->_topBorderView;
    v51 = left + v46;
    v20 = v45;
    v19 = v52;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v51, v57 + v47, v48 - (right + left), v49 - (v57 + v56), v4, v6, v8, v10);
    -[UIView setFrame:](v50, "setFrame:");
    v6 = v55;
  }
  objc_msgSend(v11, "setFrame:", v20, v6, v19, v13, *(_QWORD *)&v52);

}

- (void)_setPosition:(int64_t)a3
{
  if (self->_position != a3)
  {
    self->_position = a3;
    -[SKUICollectionViewCell _updateBorderVisibility](self, "_updateBorderVisibility");
  }
}

- (BOOL)_showsBottomBorder
{
  BOOL v2;

  v2 = 1;
  switch(self->_separatorStyle)
  {
    case 2:
    case 4:
    case 7:
      return v2;
    case 3:
      v2 = (self->_position & 0x20) == 0;
      break;
    default:
      v2 = 0;
      break;
  }
  return v2;
}

- (BOOL)_showsLeftBorder
{
  int64_t separatorStyle;
  int64_t v3;
  BOOL v4;
  BOOL v6;
  BOOL v7;
  BOOL v8;

  separatorStyle = self->_separatorStyle;
  v3 = self->_position & 1;
  v4 = v3 == 0;
  v6 = separatorStyle != 5 && separatorStyle != 0;
  if (separatorStyle == 6)
  {
    v7 = 0;
  }
  else
  {
    v4 = 0;
    v7 = v3 == 0;
  }
  if (v7)
    v8 = v6;
  else
    v8 = v4;
  if (separatorStyle == 7)
    return (self->_position & 1) == 0;
  else
    return v8;
}

- (BOOL)_showsRightBorder
{
  int64_t separatorStyle;
  int64_t v3;
  BOOL v4;
  BOOL v6;
  BOOL v7;
  BOOL v8;

  separatorStyle = self->_separatorStyle;
  v3 = self->_position & 4;
  v4 = v3 == 0;
  v6 = separatorStyle != 5 && separatorStyle != 0;
  if (separatorStyle == 6)
  {
    v7 = 0;
  }
  else
  {
    v4 = 0;
    v7 = v3 == 0;
  }
  if (v7)
    v8 = v6;
  else
    v8 = v4;
  if (separatorStyle == 7)
    return (self->_position & 4) == 0;
  else
    return v8;
}

- (BOOL)_showsTopBorder
{
  SKUICollectionViewCell *v2;
  unint64_t separatorStyle;

  v2 = self;
  LOBYTE(self) = 0;
  separatorStyle = v2->_separatorStyle;
  if (separatorStyle <= 7)
  {
    if (((1 << separatorStyle) & 0x9C) != 0)
    {
      LODWORD(self) = (LOBYTE(v2->_position) >> 3) & 1;
    }
    else if (((1 << separatorStyle) & 0x22) != 0)
    {
      LOBYTE(self) = (v2->_position & 8) == 0;
    }
  }
  return (char)self;
}

- (void)_updateBorderVisibility
{
  _BOOL4 v3;
  int v4;
  _BOOL4 v5;
  int v6;
  _BOOL4 v7;
  _BOOL4 v8;

  v3 = -[SKUICollectionViewCell _showsBottomBorder](self, "_showsBottomBorder");
  v4 = v3 ^ -[UIView isHidden](self->_bottomBorderView, "isHidden");
  if ((v4 & 1) == 0)
    -[UIView setHidden:](self->_bottomBorderView, "setHidden:", !v3);
  v5 = -[SKUICollectionViewCell _showsLeftBorder](self, "_showsLeftBorder");
  if (v5 == -[UIView isHidden](self->_leftBorderView, "isHidden"))
  {
    -[UIView setHidden:](self->_leftBorderView, "setHidden:", !v5);
    v6 = 1;
  }
  else
  {
    v6 = v4 ^ 1;
  }
  v7 = -[SKUICollectionViewCell _showsRightBorder](self, "_showsRightBorder");
  if (v7 == -[UIView isHidden](self->_rightBorderView, "isHidden"))
  {
    -[UIView setHidden:](self->_rightBorderView, "setHidden:", !v7);
    v6 = 1;
  }
  v8 = -[SKUICollectionViewCell _showsTopBorder](self, "_showsTopBorder");
  if (v8 == -[UIView isHidden](self->_topBorderView, "isHidden"))
  {
    -[UIView setHidden:](self->_topBorderView, "setHidden:", !v8);
    goto LABEL_12;
  }
  if (v6)
LABEL_12:
    -[SKUICollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (int64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (UIEdgeInsets)separatorWidths
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_separatorWidths.top;
  left = self->_separatorWidths.left;
  bottom = self->_separatorWidths.bottom;
  right = self->_separatorWidths.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)separatorInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_separatorInsets.top;
  left = self->_separatorInsets.left;
  bottom = self->_separatorInsets.bottom;
  right = self->_separatorInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSeparatorInsets:(UIEdgeInsets)a3
{
  self->_separatorInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_rightBorderView, 0);
  objc_storeStrong((id *)&self->_leftBorderView, 0);
  objc_storeStrong((id *)&self->_bottomBorderView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICollectionViewCell initWithFrame:]";
}

@end
