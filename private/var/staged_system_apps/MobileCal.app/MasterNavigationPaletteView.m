@implementation MasterNavigationPaletteView

- (MasterNavigationPaletteView)initWithFrame:(CGRect)a3
{
  MasterNavigationPaletteView *v3;
  id v4;
  uint64_t v5;
  NSDictionary *titleAttributes;
  UILabel *v7;
  UILabel *titleLabel;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MasterNavigationPaletteView;
  v3 = -[MasterNavigationPaletteView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init((Class)UINavigationBarAppearance);
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "largeTitleTextAttributes"));
    titleAttributes = v3->_titleAttributes;
    v3->_titleAttributes = (NSDictionary *)v5;

    v7 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v7;

    -[MasterNavigationPaletteView addSubview:](v3, "addSubview:", v3->_titleLabel);
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  int *v6;
  UISegmentedControl *segmentedControl;
  double v8;
  double v9;
  double v10;
  CGSize result;
  CGRect v12;
  CGRect v13;

  height = a3.height;
  width = a3.width;
  if (-[MasterNavigationPaletteView showsHeader](self, "showsHeader"))
  {
    if (self->_showIdentity)
      v6 = &OBJC_IVAR___MasterNavigationPaletteView__identityCell;
    else
      v6 = &OBJC_IVAR___MasterNavigationPaletteView__titleLabel;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v6), "frame");
    height = CGRectGetMaxY(v12);
  }
  segmentedControl = self->_segmentedControl;
  if (segmentedControl)
  {
    -[UISegmentedControl frame](segmentedControl, "frame");
    height = CGRectGetMaxY(v13);
  }
  v8 = height + 16.0;
  if (!-[MasterNavigationPaletteView showsHeader](self, "showsHeader") && !self->_segmentedControl)
    v8 = 0.0;
  v9 = width;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)showsHeader
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MasterNavigationPaletteView traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom") != 0;

  return v3;
}

- (void)setShowIdentity:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  self->_showIdentity = a3;
  if (-[MasterNavigationPaletteView showsHeader](self, "showsHeader"))
  {
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sourceForSelectedIdentity](self->_model, "sourceForSelectedIdentity"));
      -[MasterNavigationPaletteView updateIdentity:](self, "updateIdentity:", v5);

      -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
    }
    else
    {
      -[IdentitySwitcherCell removeFromSuperview](self->_identityCell, "removeFromSuperview");
      -[MasterNavigationPaletteView addSubview:](self, "addSubview:", self->_titleLabel);
    }
  }
}

- (void)setModel:(id)a3
{
  self->_model = (CUIKCalendarModel *)a3;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MasterNavigationPaletteDelegate *)a3;
}

- (void)layoutSubviews
{
  int IsLeftToRight;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL8 v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  UISegmentedControl *segmentedControl;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect v34;
  CGRect v35;

  IsLeftToRight = CalInterfaceIsLeftToRight(self);
  v4 = -[MasterNavigationPaletteView safeAreaInsets](self, "safeAreaInsets");
  if (IsLeftToRight)
    v7 = v5;
  else
    v7 = v6;
  v8 = 16.0;
  v9 = v7 + 16.0;
  v10 = CalInterfaceIsLeftToRight(v4);
  -[MasterNavigationPaletteView safeAreaInsets](self, "safeAreaInsets");
  if (v10)
    v13 = v12;
  else
    v13 = v11;
  v14 = v13 + 16.0;
  v15 = -[MasterNavigationPaletteView showsHeader](self, "showsHeader");
  if (v15)
  {
    if (self->_showIdentity)
    {
      if (CalInterfaceIsLeftToRight(v15))
        v16 = v9;
      else
        v16 = v14;
      -[MasterNavigationPaletteView bounds](self, "bounds");
      v18 = v17 - (v9 + v14);
      -[IdentitySwitcherCell systemLayoutSizeFittingSize:](self->_identityCell, "systemLayoutSizeFittingSize:", v18, 0.0);
      v20 = v19;
      -[IdentitySwitcherCell setFrame:](self->_identityCell, "setFrame:", v16, 6.0, v18, v19);
      v34.origin.y = 6.0;
      v34.origin.x = v16;
      v34.size.width = v18;
      v34.size.height = v20;
      v8 = CGRectGetMaxY(v34) + 16.0;
    }
    else
    {
      v21 = -[UILabel frame](self->_titleLabel, "frame");
      v23 = v22;
      v25 = v24;
      v26 = v9;
      if ((CalInterfaceIsLeftToRight(v21) & 1) == 0)
      {
        -[MasterNavigationPaletteView bounds](self, "bounds");
        v26 = v27 - v9 - v23;
      }
      -[UILabel setFrame:](self->_titleLabel, "setFrame:", v26, 16.0, v23, v25);
      v35.origin.y = 16.0;
      v35.origin.x = v26;
      v35.size.width = v23;
      v35.size.height = v25;
      v8 = CGRectGetMaxY(v35) + 16.0;
    }
  }
  else
  {
    -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
    -[IdentitySwitcherCell removeFromSuperview](self->_identityCell, "removeFromSuperview");
  }
  segmentedControl = self->_segmentedControl;
  if (segmentedControl)
  {
    v29 = -[UISegmentedControl frame](segmentedControl, "frame");
    v31 = v30;
    if (CalInterfaceIsLeftToRight(v29))
      v32 = v9;
    else
      v32 = v14;
    -[MasterNavigationPaletteView bounds](self, "bounds");
    -[UISegmentedControl setFrame:](self->_segmentedControl, "setFrame:", v32, v8, v33 - (v9 + v14), v31);
  }
}

- (void)setTitle:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[UILabel setText:](self->_titleLabel, "setText:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MasterNavigationPaletteView window](self, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MasterNavigationPaletteView traitCollection](self, "traitCollection"));
  v6 = paletteTitleFont(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[UILabel setFont:](self->_titleLabel, "setFont:", v7);

  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setSegmentedControl:(id)a3
{
  UISegmentedControl *v4;
  UISegmentedControl *segmentedControl;
  UISegmentedControl *v6;

  v4 = (UISegmentedControl *)a3;
  segmentedControl = self->_segmentedControl;
  if (segmentedControl != v4)
  {
    v6 = v4;
    if (segmentedControl)
    {
      -[UISegmentedControl removeFromSuperview](segmentedControl, "removeFromSuperview");
      v4 = v6;
    }
    self->_segmentedControl = v4;
    if (v4)
    {
      -[MasterNavigationPaletteView addSubview:](self, "addSubview:", v6);
      v4 = v6;
    }
  }

}

- (void)updateIdentity:(id)a3
{
  IdentitySwitcherCell *identityCell;
  id v5;
  IdentitySwitcherCell *v6;
  IdentitySwitcherCell *v7;
  void *v8;
  void *v9;
  id v10;

  identityCell = self->_identityCell;
  v5 = a3;
  -[IdentitySwitcherCell removeFromSuperview](identityCell, "removeFromSuperview");
  v6 = (IdentitySwitcherCell *)objc_claimAutoreleasedReturnValue(+[IdentitySwitcherCell cellForSource:withModel:inTableView:](IdentitySwitcherCell, "cellForSource:withModel:inTableView:", v5, self->_model, 0));

  v7 = self->_identityCell;
  self->_identityCell = v6;

  -[IdentitySwitcherCell setSelectionStyle:](self->_identityCell, "setSelectionStyle:", 0);
  -[IdentitySwitcherCell setAccessoryType:](self->_identityCell, "setAccessoryType:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor"));
  -[IdentitySwitcherCell setBackgroundColor:](self->_identityCell, "setBackgroundColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdentitySwitcherCell layer](self->_identityCell, "layer"));
  objc_msgSend(v9, "setCornerRadius:", 10.0);

  v10 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "cellTapped");
  -[IdentitySwitcherCell addGestureRecognizer:](self->_identityCell, "addGestureRecognizer:", v10);
  -[MasterNavigationPaletteView addSubview:](self, "addSubview:", self->_identityCell);

}

- (void)cellTapped
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MasterNavigationPaletteView delegate](self, "delegate"));
  objc_msgSend(v3, "palette:identitySwitcherTapped:", self, self->_identityCell);

}

- (MasterNavigationPaletteDelegate)delegate
{
  return self->_delegate;
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (BOOL)showIdentity
{
  return self->_showIdentity;
}

- (CUIKCalendarModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleAttributes, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_identityCell, 0);
}

@end
