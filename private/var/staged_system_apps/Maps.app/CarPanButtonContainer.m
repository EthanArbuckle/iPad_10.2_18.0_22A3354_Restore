@implementation CarPanButtonContainer

- (id)_buttonForDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  else
    return objc_autoreleaseReturnValue(objc_retain(*(id *)((char *)&self->super.super.super.isa
                                                         + **(&off_1011BF758 + a3 - 1))));
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  void *v5;
  CarPanButton *panRightButton;
  uint64_t v8;

  if (self->_lastNudgedDirection
    && (v3 = objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer _buttonForDirection:](self, "_buttonForDirection:")),
        self->_lastNudgedDirection = 0,
        v3))
  {
    v4 = (void *)v3;
    v8 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

    return (NSArray *)v5;
  }
  else
  {
    panRightButton = self->_panRightButton;
    return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &panRightButton, 1));
  }
}

- (CarPanButtonContainer)initWithFrame:(CGRect)a3
{
  CarPanButtonContainer *v3;
  CarPanButtonContainer *v4;
  CarPanButton *v5;
  CarPanButton *panUpButton;
  CarPanButton *v7;
  CarPanButton *panLeftButton;
  CarPanButton *v9;
  CarPanButton *panRightButton;
  CarPanButton *v11;
  CarPanButton *panDownButton;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CarPanButtonContainer;
  v3 = -[CarPanButtonContainer initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CarPanButtonContainer setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("CarPanButtonContainer"));
    v5 = -[CarPanButton initWithDirection:]([CarPanButton alloc], "initWithDirection:", 1);
    panUpButton = v4->_panUpButton;
    v4->_panUpButton = v5;

    -[CarPanButton setContentHorizontalAlignment:](v4->_panUpButton, "setContentHorizontalAlignment:", 0);
    -[CarPanButton setContentVerticalAlignment:](v4->_panUpButton, "setContentVerticalAlignment:", 0);
    -[CarPanButtonContainer addSubview:](v4, "addSubview:", v4->_panUpButton);
    v7 = -[CarPanButton initWithDirection:]([CarPanButton alloc], "initWithDirection:", 3);
    panLeftButton = v4->_panLeftButton;
    v4->_panLeftButton = v7;

    -[CarPanButton setContentHorizontalAlignment:](v4->_panLeftButton, "setContentHorizontalAlignment:", 0);
    -[CarPanButton setContentVerticalAlignment:](v4->_panLeftButton, "setContentVerticalAlignment:", 0);
    -[CarPanButtonContainer addSubview:](v4, "addSubview:", v4->_panLeftButton);
    v9 = -[CarPanButton initWithDirection:]([CarPanButton alloc], "initWithDirection:", 4);
    panRightButton = v4->_panRightButton;
    v4->_panRightButton = v9;

    -[CarPanButton setContentHorizontalAlignment:](v4->_panRightButton, "setContentHorizontalAlignment:", 0);
    -[CarPanButton setContentVerticalAlignment:](v4->_panRightButton, "setContentVerticalAlignment:", 0);
    -[CarPanButtonContainer addSubview:](v4, "addSubview:", v4->_panRightButton);
    v11 = -[CarPanButton initWithDirection:]([CarPanButton alloc], "initWithDirection:", 2);
    panDownButton = v4->_panDownButton;
    v4->_panDownButton = v11;

    -[CarPanButton setContentHorizontalAlignment:](v4->_panDownButton, "setContentHorizontalAlignment:", 0);
    -[CarPanButton setContentVerticalAlignment:](v4->_panDownButton, "setContentVerticalAlignment:", 0);
    -[CarPanButtonContainer addSubview:](v4, "addSubview:", v4->_panDownButton);
  }
  return v4;
}

- (void)layoutSubviews
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
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat MidX;
  uint64_t v20;
  double v21;
  CGFloat MinY;
  uint64_t v23;
  CGFloat MinX;
  uint64_t v25;
  double v26;
  CGFloat MidY;
  uint64_t v28;
  CGFloat MaxX;
  uint64_t v30;
  double v31;
  CGFloat v32;
  uint64_t v33;
  CGFloat v34;
  uint64_t v35;
  double v36;
  CGFloat MaxY;
  uint64_t v38;
  objc_super v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v39.receiver = self;
  v39.super_class = (Class)CarPanButtonContainer;
  -[CarPanButtonContainer layoutSubviews](&v39, "layoutSubviews");
  -[CarPanButtonContainer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CarPanButtonContainer safeAreaInsets](self, "safeAreaInsets");
  v12 = v4 + v11;
  v14 = v6 + v13;
  v16 = v8 - (v11 + v15);
  v18 = v10 - (v13 + v17);
  v40.origin.x = v4 + v11;
  v40.origin.y = v14;
  v40.size.width = v16;
  v40.size.height = v18;
  MidX = CGRectGetMidX(v40);
  v21 = UIRoundToViewScale(self, v20, MidX + -14.0);
  v41.origin.x = v12;
  v41.origin.y = v14;
  v41.size.width = v16;
  v41.size.height = v18;
  MinY = CGRectGetMinY(v41);
  -[CarPanButton setFrame:](self->_panUpButton, "setFrame:", v21, UIRoundToViewScale(self, v23, MinY + 8.5), 28.0, 28.0);
  -[CarFocusableControl setTouchInsets:](self->_panUpButton, "setTouchInsets:", v18 / -12.0, v16 / -12.0, v18 / -12.0, v16 / -12.0);
  v42.origin.x = v12;
  v42.origin.y = v14;
  v42.size.width = v16;
  v42.size.height = v18;
  MinX = CGRectGetMinX(v42);
  v26 = UIRoundToViewScale(self, v25, MinX + 8.5);
  v43.origin.x = v12;
  v43.origin.y = v14;
  v43.size.width = v16;
  v43.size.height = v18;
  MidY = CGRectGetMidY(v43);
  -[CarPanButton setFrame:](self->_panLeftButton, "setFrame:", v26, UIRoundToViewScale(self, v28, MidY + -14.0), 28.0, 28.0);
  -[CarFocusableControl setTouchInsets:](self->_panLeftButton, "setTouchInsets:", v16 / -12.0, v18 / -12.0, v16 / -12.0, v18 / -12.0);
  v44.origin.x = v12;
  v44.origin.y = v14;
  v44.size.width = v16;
  v44.size.height = v18;
  MaxX = CGRectGetMaxX(v44);
  v31 = UIRoundToViewScale(self, v30, MaxX + -8.5 + -28.0);
  v45.origin.x = v12;
  v45.origin.y = v14;
  v45.size.width = v16;
  v45.size.height = v18;
  v32 = CGRectGetMidY(v45);
  -[CarPanButton setFrame:](self->_panRightButton, "setFrame:", v31, UIRoundToViewScale(self, v33, v32 + -14.0), 28.0, 28.0);
  -[CarFocusableControl setTouchInsets:](self->_panRightButton, "setTouchInsets:", v16 / -12.0, v18 / -12.0, v16 / -12.0, v18 / -12.0);
  v46.origin.x = v12;
  v46.origin.y = v14;
  v46.size.width = v16;
  v46.size.height = v18;
  v34 = CGRectGetMidX(v46);
  v36 = UIRoundToViewScale(self, v35, v34 + -14.0);
  v47.origin.x = v12;
  v47.origin.y = v14;
  v47.size.width = v16;
  v47.size.height = v18;
  MaxY = CGRectGetMaxY(v47);
  -[CarPanButton setFrame:](self->_panDownButton, "setFrame:", v36, UIRoundToViewScale(self, v38, MaxY + -8.5 + -28.0), 28.0, 28.0);
  -[CarFocusableControl setTouchInsets:](self->_panDownButton, "setTouchInsets:", v18 / -12.0, v16 / -12.0, v18 / -12.0, v16 / -12.0);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v5;
  CarPanButtonContainer *v6;
  CarPanButtonContainer *v7;
  CarPanButtonContainer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CarPanButtonContainer;
  v5 = -[CarPanButtonContainer hitTest:withEvent:](&v10, "hitTest:withEvent:", a4, a3.x, a3.y);
  v6 = (CarPanButtonContainer *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6 == self)
    v8 = 0;
  else
    v8 = v6;

  return v8;
}

- (int64_t)lastNudgedDirection
{
  return self->_lastNudgedDirection;
}

- (void)setLastNudgedDirection:(int64_t)a3
{
  self->_lastNudgedDirection = a3;
}

- (CarPanButton)panUpButton
{
  return self->_panUpButton;
}

- (void)setPanUpButton:(id)a3
{
  objc_storeStrong((id *)&self->_panUpButton, a3);
}

- (CarPanButton)panLeftButton
{
  return self->_panLeftButton;
}

- (void)setPanLeftButton:(id)a3
{
  objc_storeStrong((id *)&self->_panLeftButton, a3);
}

- (CarPanButton)panRightButton
{
  return self->_panRightButton;
}

- (void)setPanRightButton:(id)a3
{
  objc_storeStrong((id *)&self->_panRightButton, a3);
}

- (CarPanButton)panDownButton
{
  return self->_panDownButton;
}

- (void)setPanDownButton:(id)a3
{
  objc_storeStrong((id *)&self->_panDownButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panDownButton, 0);
  objc_storeStrong((id *)&self->_panRightButton, 0);
  objc_storeStrong((id *)&self->_panLeftButton, 0);
  objc_storeStrong((id *)&self->_panUpButton, 0);
}

@end
