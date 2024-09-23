@implementation SmallDropDownOutlineCell

- (SmallDropDownOutlineCell)initWithFrame:(CGRect)a3
{
  SmallDropDownOutlineCell *v3;
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
  v38.super_class = (Class)SmallDropDownOutlineCell;
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

    -[MapsThemeButton setTitleColorProvider:](v3->_button, "setTitleColorProvider:", &stru_1011E3E90);
    v9 = v3->_button;
    v10 = sub_10094EC34();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v11, 2));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("chevron.up.chevron.down"), v12));
    -[MapsRightImageButton setImage:forState:](v9, "setImage:forState:", v13, 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SmallDropDownOutlineCell theme](v3, "theme"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "keyColor"));
    -[MapsRightImageButton setTintColor:](v3->_button, "setTintColor:", v15);

    -[MapsRightImageButton setShowsMenuAsPrimaryAction:](v3->_button, "setShowsMenuAsPrimaryAction:", 1);
    -[MapsRightImageButton setAccessibilityIdentifier:](v3->_button, "setAccessibilityIdentifier:", CFSTR("SmallDropDownButton"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SmallDropDownOutlineCell contentView](v3, "contentView"));
    objc_msgSend(v16, "addSubview:", v3->_button);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRightImageButton topAnchor](v3->_button, "topAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[SmallDropDownOutlineCell contentView](v3, "contentView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "topAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 4.0));
    v39[0] = v34;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRightImageButton leadingAnchor](v3->_button, "leadingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SmallDropDownOutlineCell contentView](v3, "contentView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layoutMarginsGuide"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "leadingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v30));
    v39[1] = v29;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRightImageButton trailingAnchor](v3->_button, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SmallDropDownOutlineCell contentView](v3, "contentView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layoutMarginsGuide"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:", v19));
    v39[2] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRightImageButton bottomAnchor](v3->_button, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SmallDropDownOutlineCell contentView](v3, "contentView"));
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
  SmallDropDownOutlineCellModel *v5;
  SmallDropDownOutlineCellModel *v6;
  unsigned __int8 v7;
  SmallDropDownOutlineCellModel *v8;

  v5 = (SmallDropDownOutlineCellModel *)a3;
  v6 = v5;
  if (self->_cellModel != v5)
  {
    v8 = v5;
    v7 = -[SmallDropDownOutlineCellModel isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cellModel, a3);
      -[SmallDropDownOutlineCell _updateFromModel](self, "_updateFromModel");
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
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, id);
  void *v16;
  SmallDropDownOutlineCell *v17;
  id v18;
  id v19;
  id location;

  button = self->_button;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SmallDropDownOutlineCellModel buttonTitle](self->_cellModel, "buttonTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR(" ")));
  -[MapsRightImageButton setTitle:forState:](button, "setTitle:forState:", v5, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SmallDropDownOutlineCellModel dropDownTitles](self->_cellModel, "dropDownTitles"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_initWeak(&location, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SmallDropDownOutlineCellModel dropDownTitles](self->_cellModel, "dropDownTitles"));
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_100B52DE4;
    v16 = &unk_1011E3EB8;
    objc_copyWeak(&v19, &location);
    v17 = self;
    v10 = v8;
    v18 = v10;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v13);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_1011EB268, v10, v13, v14, v15, v16, v17));
    -[MapsRightImageButton setMenu:](self->_button, "setMenu:", v11);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MapsRightImageButton setMenu:](self->_button, "setMenu:", 0);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SmallDropDownOutlineCellModel backgroundModel](self->_cellModel, "backgroundModel"));
  -[SidebarOutlineCell setBackgroundModel:](self, "setBackgroundModel:", v12);

}

- (void)_itemSelectedAtIndex:(int64_t)a3
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SmallDropDownOutlineCellModel delegate](self->_cellModel, "delegate"));
  objc_msgSend(v5, "smallDropDownOutlineCell:didSelectItemAtIndex:", self, a3);

}

- (SmallDropDownOutlineCellModel)cellModel
{
  return self->_cellModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellModel, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
