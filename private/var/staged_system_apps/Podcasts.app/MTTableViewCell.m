@implementation MTTableViewCell

+ (double)rowHeight
{
  return 60.0;
}

+ (id)titleFont
{
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0);
}

+ (id)detailFont
{
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0);
}

+ (id)textColor
{
  return +[UIColor blackColor](UIColor, "blackColor");
}

+ (id)detailTextColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.5);
}

+ (id)defaultCellBackgroundColor
{
  return +[UIColor backgroundColor](UIColor, "backgroundColor");
}

- (MTTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTTableViewCell *v4;
  MTTableViewCell *v5;
  char v6;
  MTTableViewCell *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTTableViewCell;
  v4 = -[MTTableViewCell initWithStyle:reuseIdentifier:](&v9, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    if ((isTV(v4) & 1) != 0)
      v6 = 1;
    else
      v6 = isMac();
    v5->_showsSeparator = v6;
    -[MTTableViewCell setupCell](v5, "setupCell");
    v7 = v5;
  }

  return v5;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTTableViewCell;
  -[MTTableViewCell prepareForReuse](&v5, "prepareForReuse");
  -[MTTableViewCell setDeleteButtonBlock:](self, "setDeleteButtonBlock:", 0);
  -[MTTableViewCell setSwipeToDeleteButtonColor:](self, "setSwipeToDeleteButtonColor:", 0);
  -[MTTableViewCell _clearCellEmphasis](self, "_clearCellEmphasis");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell textLabel](self, "textLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)setupCell
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)UIView);
  -[MTTableViewCell bounds](self, "bounds");
  v5 = objc_msgSend(v3, "initWithFrame:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellSelectedBackgroundColor](UIColor, "cellSelectedBackgroundColor"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[MTTableViewCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v5);
  if (self->_showsSeparator)
    -[MTTableViewCell createSeparator](self, "createSeparator");

}

- (void)createSeparator
{
  void *v3;
  id v4;

  if (!self->_separator)
  {
    v4 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellSeparatorColor](UIColor, "cellSeparatorColor"));
    objc_msgSend(v4, "setBackgroundColor:", v3);

    -[MTTableViewCell setSeparator:](self, "setSeparator:", v4);
    -[MTTableViewCell addSubview:](self, "addSubview:", v4);

  }
}

- (void)setLeftAccessoryView:(id)a3
{
  UIView *v5;
  UIView *leftAccessoryView;
  UIView *v7;

  v5 = (UIView *)a3;
  leftAccessoryView = self->_leftAccessoryView;
  if (leftAccessoryView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](leftAccessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_leftAccessoryView, a3);
    -[MTTableViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setLeftEditingAccessoryView:(id)a3
{
  UIView *v5;
  UIView *leftEditingAccessoryView;
  UIView *v7;

  v5 = (UIView *)a3;
  leftEditingAccessoryView = self->_leftEditingAccessoryView;
  if (leftEditingAccessoryView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](leftEditingAccessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_leftEditingAccessoryView, a3);
    -[MTTableViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setShowsSeparator:(BOOL)a3
{
  if (self->_showsSeparator != a3)
  {
    self->_showsSeparator = a3;
    if (a3)
    {
      -[MTTableViewCell createSeparator](self, "createSeparator");
    }
    else
    {
      -[UIView removeFromSuperview](self->_separator, "removeFromSuperview");
      -[MTTableViewCell setSeparator:](self, "setSeparator:", 0);
    }
  }
}

- (void)_clearCellEmphasis
{
  -[MTTableViewCell setCellEmphasis:](self, "setCellEmphasis:", 0);
}

- (void)setCellEmphasis:(int64_t)a3
{
  unsigned __int8 v4;
  unsigned __int8 v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  if (self->_cellEmphasis != a3)
  {
    self->_cellEmphasis = a3;
    v4 = -[MTTableViewCell _isTextEmphasized](self, "_isTextEmphasized");
    v5 = -[MTTableViewCell _isBackgroundEmphasized](self, "_isBackgroundEmphasized");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell textLabel](self, "textLabel"));
    if ((v4 & 1) != 0)
    {
      v7 = objc_claimAutoreleasedReturnValue(+[UIColor cellEmpahsisTextColor](UIColor, "cellEmpahsisTextColor"));
    }
    else
    {
      v8 = objc_msgSend((id)objc_opt_class(self), "textColor");
      v7 = objc_claimAutoreleasedReturnValue(v8);
    }
    v9 = (void *)v7;
    objc_msgSend(v6, "setTextColor:", v7);

    if ((v5 & 1) != 0)
    {
      v10 = objc_claimAutoreleasedReturnValue(+[UIColor cellEmpahsisBackgroundColor](UIColor, "cellEmpahsisBackgroundColor"));
    }
    else
    {
      v11 = objc_msgSend((id)objc_opt_class(self), "defaultCellBackgroundColor");
      v10 = objc_claimAutoreleasedReturnValue(v11);
    }
    v12 = (id)v10;
    -[MTTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v10);

  }
}

- (BOOL)_isTextEmphasized
{
  return self->_cellEmphasis != 0;
}

- (BOOL)_isBackgroundEmphasized
{
  return self->_cellEmphasis > 1uLL;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double Width;
  void *v7;
  double v8;
  double v9;
  CGFloat v10;
  double Height;
  double v12;
  double v13;
  double x;
  double v15;
  double y;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  MTTableViewCell *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  MTTableViewCell *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double MinY;
  void *v45;
  double v46;
  double v47;
  CGFloat MaxX;
  double v49;
  double v50;
  void *v51;
  objc_super v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v52.receiver = self;
  v52.super_class = (Class)MTTableViewCell;
  -[MTTableViewCell layoutSubviews](&v52, "layoutSubviews");
  if (self->_separator)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell separator](self, "separator"));
    objc_msgSend(v3, "frame");
    v5 = v4;

    -[MTTableViewCell bounds](self, "bounds");
    Width = CGRectGetWidth(v53);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v7, "scale");
    v9 = v8;

    v10 = 1.0 / v9;
    -[MTTableViewCell bounds](self, "bounds");
    Height = CGRectGetHeight(v54);
    v55.origin.x = 0.0;
    v55.origin.y = v5;
    v55.size.width = Width;
    v55.size.height = v10;
    v12 = Height - CGRectGetHeight(v55);
    -[MTTableViewCell separatorInset](self, "separatorInset");
    x = v13 + 0.0;
    y = v12 + v15;
    v18 = Width - (v13 + v17);
    v20 = v10 - (v15 + v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell separator](self, "separator"));
    objc_msgSend(v21, "setFrame:", x, y, v18, v20);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell separator](self, "separator"));
    -[MTTableViewCell bringSubviewToFront:](self, "bringSubviewToFront:", v22);

  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    v18 = CGRectZero.size.width;
    v20 = CGRectZero.size.height;
  }
  v23 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
  if (-[MTTableViewCell isEditing](self, "isEditing")
    && !-[MTTableViewCell editingStyle](self, "editingStyle"))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell leftEditingAccessoryView](self, "leftEditingAccessoryView"));

    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell leftEditingAccessoryView](self, "leftEditingAccessoryView"));
      v30 = (MTTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "superview"));

      if (v30 != self)
      {
        v27 = objc_claimAutoreleasedReturnValue(-[MTTableViewCell leftEditingAccessoryView](self, "leftEditingAccessoryView"));
        goto LABEL_12;
      }
LABEL_13:
      v33 = 1;
      goto LABEL_15;
    }
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell leftAccessoryView](self, "leftAccessoryView"));

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell leftAccessoryView](self, "leftAccessoryView"));
      v26 = (MTTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "superview"));

      if (v26 != self)
      {
        v27 = objc_claimAutoreleasedReturnValue(-[MTTableViewCell leftAccessoryView](self, "leftAccessoryView"));
LABEL_12:
        v31 = (void *)v27;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell contentView](self, "contentView"));
        -[MTTableViewCell insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v31, v32);

        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  v33 = 0;
LABEL_15:
  if (-[MTTableViewCell isEditing](self, "isEditing"))
    v34 = objc_claimAutoreleasedReturnValue(-[MTTableViewCell leftEditingAccessoryView](self, "leftEditingAccessoryView"));
  else
    v34 = objc_claimAutoreleasedReturnValue(-[MTTableViewCell leftAccessoryView](self, "leftAccessoryView"));
  v35 = (void *)v34;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell contentView](self, "contentView"));
  objc_msgSend(v36, "frame");
  v38 = v37;
  v40 = v39;
  v42 = v41;
  MinY = v43;

  if (self->_separator)
  {
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = v18;
    v56.size.height = v20;
    MinY = CGRectGetMinY(v56);
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell contentView](self, "contentView"));
    objc_msgSend(v45, "setFrame:", v38, v40, v42, MinY);

  }
  if (v35)
  {
    objc_msgSend(v35, "sizeThatFits:", v42, MinY);
    objc_msgSend(v35, "setFrame:", IMRectCenteredYInRectScale(15.0, 0.0, v46, v47, v38, v40, v42, MinY, 0.0));
  }
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v23);
  if (v33)
  {
    objc_msgSend(v35, "frame");
    MaxX = CGRectGetMaxX(v57);
    v49 = v38 + MaxX;
    v50 = v42 - (MaxX + 0.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell contentView](self, "contentView"));
    objc_msgSend(v51, "setFrame:", v49, v40 + 0.0, v50, MinY);

  }
}

- (void)updateCellShadows:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  if (a4)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100064778;
    v4[3] = &unk_1004A65F0;
    v4[4] = self;
    v5 = a3;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v4, 0, 0.25, 0.0);
  }
  else
  {
    -[MTTableViewCell updateCellShadows:](self, "updateCellShadows:", a3);
  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  -[MTTableViewCell updateCellShadows:animated:](self, "updateCellShadows:animated:");
  v7.receiver = self;
  v7.super_class = (Class)MTTableViewCell;
  -[MTTableViewCell setHighlighted:animated:](&v7, "setHighlighted:animated:", v5, v4);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  -[MTTableViewCell updateCellShadows:animated:](self, "updateCellShadows:animated:");
  v7.receiver = self;
  v7.super_class = (Class)MTTableViewCell;
  -[MTTableViewCell setSelected:animated:](&v7, "setSelected:animated:", v5, v4);
}

- (void)setEnabled:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  self->_enabled = a3;
  -[MTTableViewCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v4, "setEnabled:", self->_enabled);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v5, "setEnabled:", self->_enabled);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell imageView](self, "imageView"));
  v8 = v6;
  v7 = 0.400000006;
  if (self->_enabled)
    v7 = 1.0;
  objc_msgSend(v6, "setAlpha:", v7);

}

- (void)didTransitionToState:(unint64_t)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  if ((a3 & 1) != 0 && !-[MTTableViewCell editingStyle](self, "editingStyle"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell leftAccessoryView](self, "leftAccessoryView"));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell leftEditingAccessoryView](self, "leftEditingAccessoryView"));
  v6 = v5;
  objc_msgSend(v5, "removeFromSuperview");

  v7.receiver = self;
  v7.super_class = (Class)MTTableViewCell;
  -[MTTableViewCell didTransitionToState:](&v7, "didTransitionToState:", a3);
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_separator, a3);
}

- (UIView)leftAccessoryView
{
  return self->_leftAccessoryView;
}

- (UIView)leftEditingAccessoryView
{
  return self->_leftEditingAccessoryView;
}

- (BOOL)showsSeparator
{
  return self->_showsSeparator;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (int64_t)cellEmphasis
{
  return self->_cellEmphasis;
}

- (id)deleteButtonBlock
{
  return self->_deleteButtonBlock;
}

- (void)setDeleteButtonBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIColor)swipeToDeleteButtonColor
{
  return self->_swipeToDeleteButtonColor;
}

- (void)setSwipeToDeleteButtonColor:(id)a3
{
  objc_storeStrong((id *)&self->_swipeToDeleteButtonColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeToDeleteButtonColor, 0);
  objc_storeStrong(&self->_deleteButtonBlock, 0);
  objc_storeStrong((id *)&self->_leftEditingAccessoryView, 0);
  objc_storeStrong((id *)&self->_leftAccessoryView, 0);
  objc_storeStrong((id *)&self->_separator, 0);
}

@end
