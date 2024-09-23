@implementation SearchResultOutlineCell

- (SearchResultOutlineCell)initWithFrame:(CGRect)a3
{
  SearchResultOutlineCell *v3;
  SearchResultTableViewCell *v4;
  SearchResultTableViewCell *tableViewCell;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  NSLayoutConstraint *heightConstraint;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;
  _QWORD v38[5];

  v37.receiver = self;
  v37.super_class = (Class)SearchResultOutlineCell;
  v3 = -[SidebarOutlineCell initWithFrame:](&v37, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[_SearchResultTableViewCell identifier](SearchResultTableViewCell, "identifier"));
    v4 = -[SearchResultTableViewCell initWithStyle:reuseIdentifier:]([SearchResultTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, v36);
    tableViewCell = v3->_tableViewCell;
    v3->_tableViewCell = v4;

    -[SearchResultTableViewCell setTranslatesAutoresizingMaskIntoConstraints:](v3->_tableViewCell, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (objc_class *)objc_opt_class(v3);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[SearchResultOutlineCell setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultOutlineCell contentView](v3, "contentView"));
    objc_msgSend(v9, "addSubview:", v3->_tableViewCell);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultOutlineCell contentView](v3, "contentView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "heightAnchor"));
    LODWORD(v12) = 1132003328;
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:priority:", 0.0, v12));
    heightConstraint = v3->_heightConstraint;
    v3->_heightConstraint = (NSLayoutConstraint *)v13;

    v38[0] = v3->_heightConstraint;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultTableViewCell topAnchor](v3->_tableViewCell, "topAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultOutlineCell contentView](v3, "contentView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
    v38[1] = v32;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultTableViewCell leadingAnchor](v3->_tableViewCell, "leadingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultOutlineCell contentView](v3, "contentView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "layoutMarginsGuide"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v28));
    v38[2] = v27;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultTableViewCell trailingAnchor](v3->_tableViewCell, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultOutlineCell contentView](v3, "contentView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layoutMarginsGuide"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v17));
    v38[3] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultTableViewCell bottomAnchor](v3->_tableViewCell, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultOutlineCell contentView](v3, "contentView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
    LODWORD(v22) = 1112276992;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:priority:", v21, 0.0, v22));
    v38[4] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 5));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

    -[SearchResultOutlineCell _updateDisclosureConfiguration](v3, "_updateDisclosureConfiguration");
    -[SearchResultOutlineCell _updateHeightConstraint](v3, "_updateHeightConstraint");

  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SearchResultOutlineCell;
  v4 = a3;
  -[SidebarOutlineCell traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultOutlineCell traitCollection](self, "traitCollection", v10.receiver, v10.super_class));
  objc_msgSend(v5, "displayScale");
  v7 = v6;
  objc_msgSend(v4, "displayScale");
  v9 = v8;

  if (v7 != v9)
    -[SearchResultOutlineCell _updateHeightConstraint](self, "_updateHeightConstraint");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SearchResultOutlineCell;
  v5 = -[SearchResultOutlineCell hitTest:withEvent:](&v12, "hitTest:withEvent:", a4, a3.x, a3.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (objc_msgSend(v6, "isDescendantOfView:", self->_tableViewCell)
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gestureRecognizers")),
        v8 = objc_msgSend(v7, "count"),
        v7,
        !v8))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultOutlineCell contentView](self, "contentView"));
  }
  else
  {
    v9 = v6;
  }
  v10 = v9;

  return v10;
}

- (void)setHovering:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchResultOutlineCell;
  -[SidebarOutlineCell setHovering:](&v4, "setHovering:", a3);
  -[SearchResultOutlineCell _updateDisclosureConfiguration](self, "_updateDisclosureConfiguration");
}

- (void)setCellModel:(id)a3
{
  SearchResultOutlineCellModel *v5;
  SearchResultOutlineCellModel *v6;
  unsigned __int8 v7;
  SearchResultOutlineCellModel *v8;

  v5 = (SearchResultOutlineCellModel *)a3;
  v6 = v5;
  if (self->_cellModel != v5)
  {
    v8 = v5;
    v7 = -[SearchResultOutlineCellModel isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cellModel, a3);
      -[SearchResultOutlineCell _updateFromModel](self, "_updateFromModel");
      v6 = v8;
    }
  }

}

- (void)_updateFromModel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[_SearchResultTableViewCell setDisplayDistanceIfValidCurrentLocation:](self->_tableViewCell, "setDisplayDistanceIfValidCurrentLocation:", -[SearchResultOutlineCellModel displayDistance](self->_cellModel, "displayDistance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultOutlineCellModel currentLocation](self->_cellModel, "currentLocation"));
  -[_SearchResultTableViewCell setCurrentLocation:](self->_tableViewCell, "setCurrentLocation:", v3);

  -[_SearchResultTableViewCell setPrefersAddressOverCategory:](self->_tableViewCell, "setPrefersAddressOverCategory:", -[SearchResultOutlineCellModel prefersAddressOverCategory](self->_cellModel, "prefersAddressOverCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultOutlineCellModel searchCategory](self->_cellModel, "searchCategory"));
  -[_SearchResultTableViewCell setSearchCategory:](self->_tableViewCell, "setSearchCategory:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultOutlineCellModel placeContextViewModel](self->_cellModel, "placeContextViewModel"));
  -[_SearchResultTableViewCell setPlaceContextViewModel:](self->_tableViewCell, "setPlaceContextViewModel:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultOutlineCellModel placeContextViewModelDelegate](self->_cellModel, "placeContextViewModelDelegate"));
  -[_SearchResultTableViewCell setPlaceContextViewModelDelegate:](self->_tableViewCell, "setPlaceContextViewModelDelegate:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultOutlineCellModel searchResult](self->_cellModel, "searchResult"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
  -[_SearchResultTableViewCell setMapItem:](self->_tableViewCell, "setMapItem:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultOutlineCellModel searchResult](self->_cellModel, "searchResult"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "relatedSection"));
  -[_SearchResultTableViewCell setRelatedSection:](self->_tableViewCell, "setRelatedSection:", v10);

  -[SearchResultOutlineCell _updateHeightConstraint](self, "_updateHeightConstraint");
  -[SearchResultOutlineCell _updateDisclosureConfiguration](self, "_updateDisclosureConfiguration");
}

- (void)_updateDisclosureConfiguration
{
  void *v3;
  id v4;
  id v5;
  UIImageSymbolConfiguration *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self->_tableViewCell, "mapItem"));
  v4 = objc_msgSend(v3, "_venueFeatureType");

  if (v4 == (id)1)
  {
    v5 = objc_msgSend(objc_alloc((Class)_UICellAccessoryConfigurationOutlineDisclosure), "initWithCellSelectionTogglesExpansionState:", 0);
    v6 = sub_10094EC40();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("chevron.forward.circle.fill"), v7));
    objc_msgSend(v5, "setImage:", v8);

    if (-[SidebarOutlineCell isHovering](self, "isHovering"))
      v9 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    else
      v9 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v10 = (void *)v9;
    objc_msgSend(v5, "setTintColor:", v9);

    v12 = v5;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    -[SearchResultOutlineCell setTrailingAccessoryConfigurations:](self, "setTrailingAccessoryConfigurations:", v11);

  }
  else
  {
    -[SearchResultOutlineCell setTrailingAccessoryConfigurations:](self, "setTrailingAccessoryConfigurations:", &__NSArray0__struct);
  }
}

- (void)_updateHeightConstraint
{
  unint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultOutlineCell traitCollection](self, "traitCollection"));
  v3 = -[_SearchResultTableViewCell numberOfLines](self->_tableViewCell, "numberOfLines");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell placeContextViewModel](self->_tableViewCell, "placeContextViewModel"));
  +[_SearchResultTableViewCell cellHeightWithTraitCollection:numberOfLines:hasPlaceContext:](SearchResultTableViewCell, "cellHeightWithTraitCollection:numberOfLines:hasPlaceContext:", v5, v3, v4 != 0);
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:");

}

- (SearchResultOutlineCellModel)cellModel
{
  return self->_cellModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellModel, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_tableViewCell, 0);
}

@end
