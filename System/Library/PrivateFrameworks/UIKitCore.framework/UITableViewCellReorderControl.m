@implementation UITableViewCellReorderControl

- (id)grabberImage
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  UIColor *accessoryTintColor;
  UIColor *v8;
  void *v9;
  void *v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  objc_msgSend(WeakRetained, "_reorderControlImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    accessoryTintColor = self->_accessoryTintColor;
    if (accessoryTintColor)
    {
      v8 = accessoryTintColor;
    }
    else
    {
      objc_msgSend(WeakRetained, "_tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_accessoryBaseColor");
      v8 = (UIColor *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(WeakRetained, "_constants");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "defaultReorderControlImageForTraitCollection:withAccessoryBaseColor:isTracking:", v11, v8, -[UIControl isTracking](self, "isTracking"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (UITableViewCellReorderControl)initWithTableViewCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UITableViewCellReorderControl *v12;
  UITableViewCellReorderControl *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  UIImageView *v25;
  UIImageView *imageView;
  objc_super v28;

  v4 = a3;
  objc_msgSend(v4, "_constants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessoryBaseColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultReorderControlSizeForCell:withAccessoryBaseColor:", v4, v7);
  v9 = v8;
  v11 = v10;

  v28.receiver = self;
  v28.super_class = (Class)UITableViewCellReorderControl;
  v12 = -[UIControl initWithFrame:](&v28, sel_initWithFrame_, 0.0, 0.0, v9, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_cell, v4);
    -[UIView setOpaque:](v13, "setOpaque:", 0);
    -[UIView setExclusiveTouch:](v13, "setExclusiveTouch:", 1);
    -[UIView setAutoresizingMask:](v13, "setAutoresizingMask:", 1);
    -[UIView bounds](v13, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[UITableViewCellReorderControl grabberImage](v13, "grabberImage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "size");
    v25 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", round(v15 + (v19 - v23) * 0.5), round(v17 + (v21 - v24) * 0.5), v23, v24);
    -[UIImageView setImage:](v25, "setImage:", v22);
    -[UIView addSubview:](v13, "addSubview:", v25);
    imageView = v13->_imageView;
    v13->_imageView = v25;

    v13->_focalY = NAN;
    v13->_focalHeight = NAN;

  }
  return v13;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  double v4;
  double v5;
  double v6;
  CGSize result;

  height = a3.height;
  -[UIView frame](self, "frame", a3.width);
  v5 = v4;
  v6 = height;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)adjustLayoutForFocalRect:(CGRect)a3
{
  double height;
  double y;
  _BOOL4 IsEmpty;
  double v7;
  double v8;

  height = a3.size.height;
  y = a3.origin.y;
  IsEmpty = CGRectIsEmpty(a3);
  v7 = NAN;
  if (IsEmpty)
    v8 = NAN;
  else
    v8 = y;
  if (!IsEmpty)
    v7 = height;
  self->_focalY = v8;
  self->_focalHeight = v7;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIImageView *v9;

  v9 = self->_imageView;
  -[UIView frame](v9, "frame");
  v4 = v3;
  v6 = v5;
  -[UIView bounds](self, "bounds");
  -[UIImageView setFrame:](v9, "setFrame:", round(v8 + (v7 - v4) * 0.5), round(self->_focalY + (self->_focalHeight - v6) * 0.5), v4, v6);

}

- (void)_updateImageView
{
  id v3;

  -[UITableViewCellReorderControl grabberImage](self, "grabberImage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_imageView, "setImage:", v3);

}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellReorderControl;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
}

- (BOOL)wantsMaskingWhileAnimatingDisabled
{
  return 0;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellReorderControl;
  -[UIView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[UITableViewCellReorderControl _updateImageView](self, "_updateImageView");
}

- (void)setAccessoryTintColor:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[UIColor isEqual:](self->_accessoryTintColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_accessoryTintColor, a3);
    -[UITableViewCellReorderControl _updateImageView](self, "_updateImageView");
  }

}

- (void)setTracking:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellReorderControl;
  -[UIControl setTracking:](&v4, sel_setTracking_, a3);
  -[UITableViewCellReorderControl _updateImageView](self, "_updateImageView");
}

- (BOOL)shouldTrack
{
  id WeakRetained;
  char v5;

  if (-[UIControl isTracking](self, "isTracking"))
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  v5 = objc_msgSend(WeakRetained, "_isReorderControlActive");

  return v5;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5;
  CGFloat v6;
  CGFloat v7;
  id WeakRetained;

  v5 = a3;
  -[UITableViewCellReorderControl setTracking:](self, "setTracking:", 1);
  objc_msgSend(v5, "locationInView:", self);
  self->_downPoint.x = v6;
  self->_downPoint.y = v7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  LOBYTE(self) = objc_msgSend(WeakRetained, "_grabberBeganReorder:touch:", self, v5);

  return (char)self;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  UITableViewCell **p_cell;
  id v6;
  id WeakRetained;
  double v8;
  double v9;

  p_cell = &self->_cell;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_cell);
  objc_msgSend(v6, "locationInView:", self);
  v9 = round(v8 - self->_downPoint.y);
  *(float *)&v9 = v9;
  objc_msgSend(WeakRetained, "_grabberDragged:yDelta:touch:", self, v6, v9);

  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id WeakRetained;

  -[UITableViewCellReorderControl setTracking:](self, "setTracking:", 0, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  objc_msgSend(WeakRetained, "_grabberReleased:", self);

}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4;

  v4 = a3;
  if (-[UIControl isTracking](self, "isTracking"))
    -[UITableViewCellReorderControl endTrackingWithTouch:withEvent:](self, "endTrackingWithTouch:withEvent:", 0, v4);

}

- (id)_imageView
{
  return self->_imageView;
}

- (UIColor)accessoryTintColor
{
  return self->_accessoryTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryTintColor, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_cell);
}

@end
