@implementation SmallButtonOutlineCell

- (SmallButtonOutlineCell)initWithFrame:(CGRect)a3
{
  SmallButtonOutlineCell *v3;
  uint64_t v4;
  MapsThemeButton *button;
  id v6;
  void *v7;
  void *v8;
  UIImageSymbolConfiguration *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;
  _QWORD v35[4];

  v34.receiver = self;
  v34.super_class = (Class)SmallButtonOutlineCell;
  v3 = -[SidebarOutlineCell initWithFrame:](&v34, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 0));
    button = v3->_button;
    v3->_button = (MapsThemeButton *)v4;

    -[MapsThemeButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = sub_10094EC34();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton titleLabel](v3->_button, "titleLabel"));
    objc_msgSend(v8, "setFont:", v7);

    v9 = sub_10094EC40();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton imageView](v3->_button, "imageView"));
    objc_msgSend(v11, "setPreferredSymbolConfiguration:", v10);

    -[MapsThemeButton addTarget:action:forControlEvents:](v3->_button, "addTarget:action:forControlEvents:", v3, "_buttonTapped:", 64);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SmallButtonOutlineCell contentView](v3, "contentView"));
    objc_msgSend(v12, "addSubview:", v3->_button);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton topAnchor](v3->_button, "topAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SmallButtonOutlineCell contentView](v3, "contentView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
    v35[0] = v30;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton leadingAnchor](v3->_button, "leadingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SmallButtonOutlineCell contentView](v3, "contentView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "layoutMarginsGuide"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v26));
    v35[1] = v25;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton trailingAnchor](v3->_button, "trailingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SmallButtonOutlineCell contentView](v3, "contentView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layoutMarginsGuide"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:", v15));
    v35[2] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton bottomAnchor](v3->_button, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SmallButtonOutlineCell contentView](v3, "contentView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
    LODWORD(v20) = 1112276992;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:priority:", v19, 0.0, v20));
    v35[3] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

  }
  return v3;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SmallButtonOutlineCell;
  -[SmallButtonOutlineCell tintColorDidChange](&v3, "tintColorDidChange");
  -[SmallButtonOutlineCell _updateTitleColor](self, "_updateTitleColor");
}

- (void)setCellModel:(id)a3
{
  SmallButtonOutlineCellModel *v5;
  SmallButtonOutlineCellModel *v6;
  unsigned __int8 v7;
  SmallButtonOutlineCellModel *v8;

  v5 = (SmallButtonOutlineCellModel *)a3;
  v6 = v5;
  if (self->_cellModel != v5)
  {
    v8 = v5;
    v7 = -[SmallButtonOutlineCellModel isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cellModel, a3);
      -[SmallButtonOutlineCell _updateFromModel](self, "_updateFromModel");
      v6 = v8;
    }
  }

}

- (void)_updateFromModel
{
  MapsThemeButton *button;
  void *v4;

  button = self->_button;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SmallButtonOutlineCellModel title](self->_cellModel, "title"));
  -[MapsThemeButton setTitle:forState:](button, "setTitle:forState:", v4, 0);

  -[MapsThemeButton setAccessibilityIdentifier:](self->_button, "setAccessibilityIdentifier:", CFSTR("SmallButton"));
  -[SmallButtonOutlineCell _updateTitleColor](self, "_updateTitleColor");
  -[SmallButtonOutlineCell _updateImage](self, "_updateImage");
}

- (void)_updateTitleColor
{
  int64_t v3;
  MapsThemeButton *v4;
  uint64_t v5;
  MapsThemeButton *v6;
  void *v7;
  MapsThemeButton *button;
  id v9;

  v3 = -[SmallButtonOutlineCellModel style](self->_cellModel, "style");
  if (v3 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[MapsThemeButton setTintColor:](self->_button, "setTintColor:", v7);

    button = self->_button;
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v6 = button;
  }
  else
  {
    if (v3)
      return;
    -[MapsThemeButton setTintColor:](self->_button, "setTintColor:", 0);
    v4 = self->_button;
    v5 = objc_claimAutoreleasedReturnValue(-[SmallButtonOutlineCell tintColor](self, "tintColor"));
    v6 = v4;
  }
  v9 = (id)v5;
  -[MapsThemeButton setTitleColor:forState:](v6, "setTitleColor:forState:");

}

- (void)_updateImage
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  _BOOL4 v15;
  MapsThemeButton *button;
  uint64_t v17;
  void *v18;
  id v19;
  CGPoint v20;
  CGRect v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SidebarOutlineCell hoverSource](self, "hoverSource"));
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hoverGestureRecognizer"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SmallButtonOutlineCellModel hoverImage](self->_cellModel, "hoverImage"));
  if (!v4 || !objc_msgSend(v19, "_maps_isHovering"))
  {

    goto LABEL_6;
  }
  -[MapsThemeButton bounds](self->_button, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v19, "locationInView:", self->_button);
  v20.x = v13;
  v20.y = v14;
  v21.origin.x = v6;
  v21.origin.y = v8;
  v21.size.width = v10;
  v21.size.height = v12;
  v15 = CGRectContainsPoint(v21, v20);

  if (!v15)
  {
LABEL_6:
    button = self->_button;
    v17 = objc_claimAutoreleasedReturnValue(-[SmallButtonOutlineCellModel image](self->_cellModel, "image"));
    goto LABEL_7;
  }
  button = self->_button;
  v17 = objc_claimAutoreleasedReturnValue(-[SmallButtonOutlineCellModel hoverImage](self->_cellModel, "hoverImage"));
LABEL_7:
  v18 = (void *)v17;
  -[MapsThemeButton setImage:forState:](button, "setImage:forState:", v17, 0);

}

- (void)_buttonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SmallButtonOutlineCellModel delegate](self->_cellModel, "delegate", a3));
  objc_msgSend(v4, "smallButtonOutlineCellTapped:", self);

}

- (void)hoverSourceStateDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SmallButtonOutlineCell;
  -[SidebarOutlineCell hoverSourceStateDidChange:](&v4, "hoverSourceStateDidChange:", a3);
  -[SmallButtonOutlineCell _updateImage](self, "_updateImage");
}

- (SmallButtonOutlineCellModel)cellModel
{
  return self->_cellModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellModel, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
