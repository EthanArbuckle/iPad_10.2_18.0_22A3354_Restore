@implementation VenueDropDownOutlineCell

- (VenueDropDownOutlineCell)initWithFrame:(CGRect)a3
{
  VenueDropDownOutlineCell *v3;
  uint64_t v4;
  MapsRightImageButton *button;
  id v6;
  void *v7;
  void *v8;
  MapsRightImageButton *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;
  _QWORD v39[4];

  v38.receiver = self;
  v38.super_class = (Class)VenueDropDownOutlineCell;
  v3 = -[SidebarOutlineCell initWithFrame:](&v38, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[MapsRightImageButton buttonWithType:](MapsRightImageButton, "buttonWithType:", 0));
    button = v3->_button;
    v3->_button = (MapsRightImageButton *)v4;

    -[MapsRightImageButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = sub_10094EC34();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRightImageButton titleLabel](v3->_button, "titleLabel"));
    objc_msgSend(v8, "setFont:", v7);

    -[MapsThemeButton setTitleColorProvider:](v3->_button, "setTitleColorProvider:", &stru_1011ACE98);
    v9 = v3->_button;
    v10 = sub_10094EC34();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v11, 2));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("chevron.down"), v12));
    -[MapsRightImageButton setImage:forState:](v9, "setImage:forState:", v13, 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VenueDropDownOutlineCell theme](v3, "theme"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "keyColor"));
    -[MapsRightImageButton setTintColor:](v3->_button, "setTintColor:", v15);

    -[MapsRightImageButton setShowsMenuAsPrimaryAction:](v3->_button, "setShowsMenuAsPrimaryAction:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VenueDropDownOutlineCell contentView](v3, "contentView"));
    objc_msgSend(v16, "addSubview:", v3->_button);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRightImageButton topAnchor](v3->_button, "topAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[VenueDropDownOutlineCell contentView](v3, "contentView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "topAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 4.0));
    v39[0] = v34;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRightImageButton leadingAnchor](v3->_button, "leadingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[VenueDropDownOutlineCell contentView](v3, "contentView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layoutMarginsGuide"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "leadingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v30));
    v39[1] = v29;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRightImageButton trailingAnchor](v3->_button, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[VenueDropDownOutlineCell contentView](v3, "contentView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layoutMarginsGuide"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:", v19));
    v39[2] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRightImageButton bottomAnchor](v3->_button, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VenueDropDownOutlineCell contentView](v3, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
    LODWORD(v24) = 1112276992;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:priority:", v23, -4.0, v24));
    v39[3] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

  }
  return v3;
}

- (void)setCellModel:(id)a3
{
  VenueDropDownOutlineCellModel *v5;
  VenueDropDownOutlineCellModel *v6;
  unsigned __int8 v7;
  VenueDropDownOutlineCellModel *v8;

  v5 = (VenueDropDownOutlineCellModel *)a3;
  v6 = v5;
  if (self->_cellModel != v5)
  {
    v8 = v5;
    v7 = -[VenueDropDownOutlineCellModel isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cellModel, a3);
      -[VenueDropDownOutlineCell _updateFromModel](self, "_updateFromModel");
      v6 = v8;
    }
  }

}

- (void)_updateFromModel
{
  MapsRightImageButton *button;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  VenueDropDownOutlineCell *v16;
  id v17;
  id v18;
  id location;

  button = self->_button;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenueDropDownOutlineCellModel buttonTitle](self->_cellModel, "buttonTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR(" ")));
  -[MapsRightImageButton setTitle:forState:](button, "setTitle:forState:", v5, 0);

  -[MapsRightImageButton setAccessibilityIdentifier:](self->_button, "setAccessibilityIdentifier:", CFSTR("VenueDropDownButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenueDropDownOutlineCellModel categories](self->_cellModel, "categories"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_initWeak(&location, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VenueDropDownOutlineCellModel categories](self->_cellModel, "categories"));
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_100225B8C;
    v15 = &unk_1011ACEE8;
    objc_copyWeak(&v18, &location);
    v16 = self;
    v10 = v8;
    v17 = v10;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v12);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_1011EB268, v10, v12, v13, v14, v15, v16));
    -[MapsRightImageButton setMenu:](self->_button, "setMenu:", v11);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MapsRightImageButton setMenu:](self->_button, "setMenu:", 0);
  }
}

- (void)_itemSelectedCategory:(id)a3
{
  VenueDropDownOutlineCellModel *cellModel;
  id v5;
  id v6;

  cellModel = self->_cellModel;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[VenueDropDownOutlineCellModel delegate](cellModel, "delegate"));
  objc_msgSend(v6, "venuesDropDownOutlineCell:didSelectCategory:", self, v5);

}

- (VenueDropDownOutlineCellModel)cellModel
{
  return self->_cellModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellModel, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
